uint64_t sub_1000031A0()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t variable initialization expression of ImageCache.directoryURL@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

uint64_t variable initialization expression of ImageCache.hasRunCleanup()
{
  return 0;
}

id variable initialization expression of ImageCache.ramCache()
{
  return objc_msgSend(objc_allocWithZone((Class)NSCache), "init");
}

uint64_t variable initialization expression of BubbleContentContainer.$__lazy_storage_$_isIpad()
{
  return 2;
}

uint64_t variable initialization expression of BubbleContentContainer.contentViewController()
{
  return 0;
}

uint64_t variable initialization expression of BubbleContentContainer.resolvedSize()
{
  return 0;
}

uint64_t type metadata accessor for PeopleMessagesURLHandler()
{
  return objc_opt_self(_TtC22PeopleMessagesAskToBuy24PeopleMessagesURLHandler);
}

__n128 initializeWithTake for RequestName(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100003268(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100003288(uint64_t result, int a2, int a3)
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
  sub_100003600(a1, &qword_100031470, (uint64_t)&unk_10002D258);
}

uint64_t sub_1000032C4(uint64_t a1, uint64_t a2)
{
  return sub_10000340C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000032D0(uint64_t a1, id *a2)
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

uint64_t sub_100003344(uint64_t a1, id *a2)
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

uint64_t sub_1000033C0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

uint64_t sub_100003400(uint64_t a1, uint64_t a2)
{
  return sub_10000340C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000340C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_100003448(uint64_t a1)
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

Swift::Int sub_100003488(uint64_t a1)
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

uint64_t sub_1000034F8(_QWORD *a1, uint64_t *a2)
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

uint64_t sub_100003580@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_1000035C4@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
  sub_100003600(a1, &qword_100031478, (uint64_t)&unk_10002D298);
}

void sub_100003600(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_100003644(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000036F8(&qword_100031498, (uint64_t)&unk_100025368);
  v3 = sub_1000036F8(&qword_1000314A0, (uint64_t)&unk_100025308);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000036B0()
{
  return sub_1000036F8(&qword_100031480, (uint64_t)&unk_1000252CC);
}

uint64_t sub_1000036D4()
{
  return sub_1000036F8(&qword_100031488, (uint64_t)&unk_1000252A0);
}

uint64_t sub_1000036F8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for URLResourceKey(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100003738()
{
  return sub_1000036F8(&qword_100031490, (uint64_t)&unk_10002533C);
}

uint64_t sub_10000375C()
{
  uint64_t v0;
  id v1;
  unint64_t v2;

  v0 = sub_100003CB4(&qword_100031630);
  sub_100006D24(v0, qword_100032A68);
  sub_100006CCC(v0, (uint64_t)qword_100032A68);
  v1 = objc_msgSend((id)objc_opt_self(NSUnitDuration), "hours");
  v2 = sub_100006D64();
  return Measurement.init(value:unit:)(v1, v2, 720.0);
}

id sub_1000037EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id result;

  v0 = type metadata accessor for ImageCache(0);
  v1 = swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  v2 = v1 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy10ImageCache_directoryURL;
  v3 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  *(_BYTE *)(v1 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy10ImageCache_hasRunCleanup) = 0;
  v4 = OBJC_IVAR____TtC22PeopleMessagesAskToBuy10ImageCache_ramCache;
  v5 = objc_msgSend(objc_allocWithZone((Class)NSCache), "init");
  *(_QWORD *)(v1 + v4) = v5;
  sub_100004B34();
  sub_1000051E4();
  result = objc_msgSend(v5, "setCountLimit:", 30);
  static ImageCache.sharedInstance = v1;
  return result;
}

uint64_t *ImageCache.sharedInstance.unsafeMutableAddressor()
{
  if (qword_1000312C8 != -1)
    swift_once(&qword_1000312C8, sub_1000037EC);
  return &static ImageCache.sharedInstance;
}

uint64_t static ImageCache.sharedInstance.getter()
{
  if (qword_1000312C8 != -1)
    swift_once(&qword_1000312C8, sub_1000037EC);
  return swift_retain(static ImageCache.sharedInstance);
}

uint64_t ImageCache.addToCache(_:image:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  NSString v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  Class isa;
  id v28;
  NSString v29;
  id v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v40 = a4;
  v8 = type metadata accessor for Logger(0);
  v41 = *(_QWORD *)(v8 - 8);
  v42 = v8;
  __chkstk_darwin(v8);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100003CB4(&qword_1000314A8);
  __chkstk_darwin(v11);
  v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = v4;
  v14 = *(void **)(v4 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy10ImageCache_ramCache);
  v15 = objc_allocWithZone((Class)NSString);
  swift_bridgeObjectRetain(a2);
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v17 = objc_msgSend(v15, "initWithString:", v16);

  v18 = objc_msgSend(v14, "objectForKey:", v17);
  if (v18)
  {
    v20 = a1;
    static PeopleLogger.messages.getter(v19);
    v21 = swift_bridgeObjectRetain_n(a2, 2);
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(12, -1);
      v25 = swift_slowAlloc(32, -1);
      v44 = v25;
      *(_DWORD *)v24 = 136315138;
      swift_bridgeObjectRetain(a2);
      v43 = sub_10000608C(v20, a2, &v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44, v24 + 4, v24 + 12);
      swift_bridgeObjectRelease_n(a2, 3);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "%s already in ram cache", v24, 0xCu);
      swift_arrayDestroy(v25, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v25, -1, -1);
      swift_slowDealloc(v24, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a2, 2);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v10, v42);
  }
  else
  {
    v38 = a3;
    v26 = v40;
    isa = Data._bridgeToObjectiveC()().super.isa;
    v28 = objc_allocWithZone((Class)NSString);
    swift_bridgeObjectRetain(a2);
    v29 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
    v30 = objc_msgSend(v28, "initWithString:", v29);

    objc_msgSend(v14, "setObject:forKey:", isa, v30);
    v31 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v13, 1, 1, v31);
    v32 = (_QWORD *)swift_allocObject(&unk_10002D378, 72, 7);
    v32[2] = 0;
    v32[3] = 0;
    v34 = v38;
    v33 = v39;
    v32[4] = v39;
    v32[5] = a1;
    v32[6] = a2;
    v32[7] = v34;
    v32[8] = v26;
    swift_bridgeObjectRetain(a2);
    swift_retain(v33);
    sub_1000062B8(v34, v26);
    v35 = sub_100004258((uint64_t)v13, (uint64_t)&unk_1000314C0, (uint64_t)v32);
    return swift_release(v35);
  }
}

uint64_t sub_100003CB4(uint64_t *a1)
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

uint64_t sub_100003CF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  v8[9] = a7;
  v8[10] = a8;
  v8[7] = a5;
  v8[8] = a6;
  v8[6] = a4;
  v9 = type metadata accessor for Logger(0);
  v8[11] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v8[12] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8[13] = swift_task_alloc(v11);
  v8[14] = swift_task_alloc(v11);
  v8[15] = swift_task_alloc(v11);
  v12 = (*(_QWORD *)(*(_QWORD *)(sub_100003CB4(&qword_1000314C8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8[16] = swift_task_alloc(v12);
  v8[17] = swift_task_alloc(v12);
  v13 = type metadata accessor for URL(0);
  v8[18] = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v8[19] = v14;
  v15 = (*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8[20] = swift_task_alloc(v15);
  v8[21] = swift_task_alloc(v15);
  v8[22] = swift_task_alloc(v15);
  return swift_task_switch(sub_100003DF0, 0, 0);
}

uint64_t sub_100003DF0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(uint64_t, uint64_t, uint64_t);
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t, uint64_t);
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t);
  uint64_t v57;

  v1 = (uint64_t *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_QWORD *)(v0 + 128);
  v5 = *(_QWORD *)(v0 + 48) + OBJC_IVAR____TtC22PeopleMessagesAskToBuy10ImageCache_directoryURL;
  swift_beginAccess(v5, v0 + 16, 0, 0);
  sub_1000062FC(v5, v4);
  v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v6(v4, 1, v2))
  {
    v7 = *(_QWORD *)(v0 + 144);
    v8 = *(_QWORD *)(v0 + 152);
    v9 = *(_QWORD *)(v0 + 136);
    sub_100006C90(*(_QWORD *)(v0 + 128), &qword_1000314C8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v9, 1, 1, v7);
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 168);
    v11 = *(_QWORD *)(v0 + 144);
    v12 = *(_QWORD *)(v0 + 152);
    v14 = *(_QWORD *)(v0 + 128);
    v13 = *(_QWORD *)(v0 + 136);
    v16 = *(_QWORD *)(v0 + 56);
    v15 = *(_QWORD *)(v0 + 64);
    v54 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
    v54(v10, v14, v11);
    sub_100006C90(v14, &qword_1000314C8);
    URL.appendingPathComponent(_:)(v16, v15);
    v56 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v56(v10, v11);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(v13, 0, 1, v11);
    if (v6(v13, 1, v11) != 1)
    {
      v17 = (uint64_t *)(v0 + 176);
      v35 = *(_QWORD *)(v0 + 176);
      v36 = *(_QWORD *)(v0 + 160);
      v37 = *(_QWORD *)(v0 + 144);
      v38 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v0 + 152) + 32))(v35, *(_QWORD *)(v0 + 136), v37);
      static PeopleLogger.messages.getter(v38);
      v39 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v54)(v36, v35, v37);
      v40 = Logger.logObject.getter(v39);
      v41 = static os_log_type_t.debug.getter();
      v42 = os_log_type_enabled(v40, v41);
      v43 = *(_QWORD *)(v0 + 160);
      v44 = *(_QWORD *)(v0 + 112);
      v45 = *(_QWORD *)(v0 + 88);
      v46 = *(_QWORD *)(v0 + 96);
      if (v42)
      {
        v52 = *(_QWORD *)(v0 + 144);
        v55 = *(_QWORD *)(v0 + 88);
        v53 = *(_QWORD *)(v0 + 96);
        v47 = (uint8_t *)swift_slowAlloc(12, -1);
        v48 = swift_slowAlloc(32, -1);
        v57 = v48;
        *(_DWORD *)v47 = 136315138;
        v49 = URL.absoluteString.getter(v48);
        v51 = v50;
        *(_QWORD *)(v0 + 40) = sub_10000608C(v49, v50, &v57);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v47 + 4, v47 + 12);
        swift_bridgeObjectRelease(v51);
        v56(v43, v52);
        _os_log_impl((void *)&_mh_execute_header, v40, v41, "Attempting to cache image to file at url %s", v47, 0xCu);
        swift_arrayDestroy(v48, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v48, -1, -1);
        swift_slowDealloc(v47, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v44, v55);
      }
      else
      {
        v56(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));

        (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v44, v45);
      }
      Data.write(to:options:)(*(_QWORD *)(v0 + 176), 1, *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
      v24 = v56;
      goto LABEL_7;
    }
  }
  v17 = (uint64_t *)(v0 + 120);
  v18 = sub_100006C90(*(_QWORD *)(v0 + 136), &qword_1000314C8);
  v19 = static PeopleLogger.messages.getter(v18);
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Unable to create save url", v22, 2u);
    swift_slowDealloc(v22, -1, -1);
  }
  v23 = *(_QWORD *)(v0 + 96);

  v24 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  v1 = (uint64_t *)(v0 + 88);
LABEL_7:
  v25 = *v1;
  v26 = *(_QWORD *)(v0 + 168);
  v27 = *(_QWORD *)(v0 + 176);
  v28 = *(_QWORD *)(v0 + 160);
  v30 = *(_QWORD *)(v0 + 128);
  v29 = *(_QWORD *)(v0 + 136);
  v32 = *(_QWORD *)(v0 + 112);
  v31 = *(_QWORD *)(v0 + 120);
  v33 = *(_QWORD *)(v0 + 104);
  v24(*v17, v25);
  swift_task_dealloc(v27);
  swift_task_dealloc(v26);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004258(uint64_t a1, uint64_t a2, uint64_t a3)
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
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_100006C90(a1, &qword_1000314A8);
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
  v17 = swift_allocObject(&unk_10002D3C8, 32, 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_100031660, v17);
}

uint64_t sub_1000043A4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_100006C90(a1, &qword_1000314A8);
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
  v17 = swift_allocObject(&unk_10002D3A0, 32, 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  v18 = sub_100003CB4(&qword_100031610);
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
  return swift_task_create(v8, v19, v18, &unk_100031608, v17);
}

uint64_t ImageCache.getFromCache(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSString v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int (*v39)(char *, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  unint64_t v49;
  unint64_t v50;
  Class isa;
  void (*v52)(char *, uint64_t);
  id v53;
  NSString v54;
  id v55;
  uint64_t v56;
  id v57;
  char *v58;
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
  uint64_t v69[3];

  v5 = sub_100003CB4(&qword_1000314C8);
  v6 = __chkstk_darwin(v5);
  v61 = (uint64_t)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v58 = (char *)&v56 - v8;
  v59 = type metadata accessor for URL(0);
  v62 = *(_QWORD *)(v59 - 8);
  v9 = __chkstk_darwin(v59);
  v11 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v56 - v12;
  v14 = type metadata accessor for Logger(0);
  v64 = *(_QWORD *)(v14 - 8);
  v65 = v14;
  v15 = __chkstk_darwin(v14);
  v17 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v15);
  v20 = (char *)&v56 - v19;
  __chkstk_darwin(v18);
  v66 = (char *)&v56 - v21;
  v60 = v2;
  v22 = *(void **)(v2 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy10ImageCache_ramCache);
  v23 = objc_allocWithZone((Class)NSString);
  swift_bridgeObjectRetain(a2);
  v63 = a1;
  v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v25 = objc_msgSend(v23, "initWithString:", v24);

  v26 = objc_msgSend(v22, "objectForKey:", v25);
  if (v26)
  {
    v27 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v26);

    static PeopleLogger.messages.getter(v28);
    v29 = swift_bridgeObjectRetain_n(a2, 2);
    v30 = Logger.logObject.getter(v29);
    v31 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc(12, -1);
      v33 = swift_slowAlloc(32, -1);
      v69[0] = v33;
      *(_DWORD *)v32 = 136315138;
      swift_bridgeObjectRetain(a2);
      v67 = sub_10000608C(v63, a2, v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68, v32 + 4, v32 + 12);
      swift_bridgeObjectRelease_n(a2, 3);
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "%s found in ram cache", v32, 0xCu);
      swift_arrayDestroy(v33, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v33, -1, -1);
      swift_slowDealloc(v32, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a2, 2);
    }
    (*(void (**)(char *, uint64_t))(v64 + 8))(v66, v65);
  }
  else
  {
    v66 = v17;
    v57 = v22;
    v34 = v58;
    v35 = v20;
    v36 = v60 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy10ImageCache_directoryURL;
    swift_beginAccess(v60 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy10ImageCache_directoryURL, v69, 0, 0);
    v37 = v61;
    sub_1000062FC(v36, v61);
    v38 = v62;
    v39 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v62 + 48);
    v40 = v59;
    if (v39((char *)v37, 1, v59))
    {
      sub_100006C90(v37, &qword_1000314C8);
      v41 = (uint64_t)v34;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v38 + 56))(v34, 1, 1, v40);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v11, v37, v40);
      sub_100006C90(v37, &qword_1000314C8);
      v41 = (uint64_t)v34;
      URL.appendingPathComponent(_:)(v63, a2);
      v42 = *(void (**)(char *, uint64_t))(v38 + 8);
      v42(v11, v40);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v34, 0, 1, v40);
      if (v39(v34, 1, v40) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v13, v34, v40);
        v27 = Data.init(contentsOf:options:)(v13, 0);
        v50 = v49;
        sub_1000062B8(v27, v49);
        isa = Data._bridgeToObjectiveC()().super.isa;
        sub_100006198(v27, v50);
        v52 = v42;
        v53 = objc_allocWithZone((Class)NSString);
        swift_bridgeObjectRetain(a2);
        v54 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(a2);
        v55 = objc_msgSend(v53, "initWithString:", v54);

        objc_msgSend(v57, "setObject:forKey:", isa, v55);
        v52(v13, v40);
        return v27;
      }
    }
    v43 = sub_100006C90(v41, &qword_1000314C8);
    v44 = static PeopleLogger.messages.getter(v43);
    v45 = Logger.logObject.getter(v44);
    v46 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v47 = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, v46, "Unable to create get url", v47, 2u);
      swift_slowDealloc(v47, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v64 + 8))(v35, v65);
    return 0;
  }
  return v27;
}

uint64_t sub_100004B34()
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t (*v27)(char *, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v29;
  uint64_t (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  char *v33;
  id v34;
  NSURL *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  id v39;
  uint64_t (*v40)(char *, uint64_t);
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  Swift::String v47;
  void *object;
  Swift::String v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  void *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  unint64_t v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t (*v69)(char *, uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  id v75;
  unint64_t v76;
  char v77[24];

  v69 = (uint64_t (*)(char *, uint64_t, uint64_t))type metadata accessor for Logger(0);
  v71 = *((_QWORD *)v69 - 1);
  v1 = ((uint64_t (*)(void))__chkstk_darwin)();
  v66 = (char *)&v65 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  v73 = (char *)&v65 - v3;
  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v65 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v67 = (char *)&v65 - v8;
  v9 = sub_100003CB4(&qword_1000314C8);
  v10 = __chkstk_darwin(v9);
  v68 = (uint64_t)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v65 - v13;
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v65 - v16;
  v18 = __chkstk_darwin(v15);
  v20 = (char *)&v65 - v19;
  v21 = __chkstk_darwin(v18);
  v23 = (char *)&v65 - v22;
  __chkstk_darwin(v21);
  v25 = (char *)&v65 - v24;
  v72 = v0;
  v26 = v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy10ImageCache_directoryURL;
  swift_beginAccess(v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy10ImageCache_directoryURL, v77, 0, 0);
  sub_1000062FC(v26, (uint64_t)v25);
  v70 = v5;
  v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  LODWORD(v5) = v27(v25, 1, v4);
  result = sub_100006C90((uint64_t)v25, &qword_1000314C8);
  if ((_DWORD)v5 == 1)
  {
    static PeopleSharedDirectory.cacheFolder(create:)(0);
    if (v27(v20, 1, v4) == 1)
    {
      sub_100006C90((uint64_t)v20, &qword_1000314C8);
      v29 = 1;
      v30 = v69;
      v31 = v70;
    }
    else
    {
      URL.appendingPathComponent(_:)(0x736567616D49, 0xE600000000000000);
      v31 = v70;
      (*(void (**)(char *, uint64_t))(v70 + 8))(v20, v4);
      v29 = 0;
      v30 = v69;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56))(v23, v29, 1, v4);
    sub_100006DA0((uint64_t)v23, (uint64_t)v17);
    swift_beginAccess(v26, &v75, 33, 0);
    sub_100006DE8((uint64_t)v17, v26);
    swift_endAccess(&v75);
    sub_1000062FC(v26, (uint64_t)v14);
    v69 = v27;
    if (v27(v14, 1, v4) == 1)
    {
      v32 = sub_100006C90((uint64_t)v14, &qword_1000314C8);
    }
    else
    {
      v33 = v67;
      (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v67, v14, v4);
      v34 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
      URL._bridgeToObjectiveC()(v35);
      v37 = v36;
      v75 = 0;
      v38 = objc_msgSend(v34, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v36, 1, 0, &v75);

      v39 = v75;
      if (v38)
      {
        v40 = *(uint64_t (**)(char *, uint64_t))(v31 + 8);
        v41 = v75;
        v32 = v40(v33, v4);
      }
      else
      {
        v42 = v75;
        v43 = _convertNSErrorToError(_:)(v39);

        v44 = swift_willThrow();
        v45 = v66;
        static PeopleLogger.messages.getter(v44);
        v75 = 0;
        v76 = 0xE000000000000000;
        swift_errorRetain(v43);
        _StringGuts.grow(_:)(34);
        v46 = swift_bridgeObjectRelease(v76);
        v75 = (id)0xD00000000000001CLL;
        v76 = 0x8000000100023ED0;
        v47._countAndFlagsBits = URL.absoluteString.getter(v46);
        object = v47._object;
        String.append(_:)(v47);
        swift_bridgeObjectRelease(object);
        v49._countAndFlagsBits = 1076174906;
        v49._object = (void *)0xE400000000000000;
        String.append(_:)(v49);
        v50 = v76;
        Logger.ifError(_:message:)(v43, v75, v76);
        swift_bridgeObjectRelease(v50);
        swift_errorRelease(v43);
        swift_errorRelease(v43);
        (*(void (**)(char *, uint64_t (*)(char *, uint64_t, uint64_t)))(v71 + 8))(v45, v30);
        v32 = (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v33, v4);
      }
    }
    v51 = v73;
    static PeopleLogger.messages.getter(v32);
    v52 = v72;
    v53 = swift_retain_n(v72, 2);
    v54 = Logger.logObject.getter(v53);
    v55 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = (uint8_t *)swift_slowAlloc(12, -1);
      v57 = (void *)swift_slowAlloc(32, -1);
      v75 = v57;
      *(_DWORD *)v56 = 136315138;
      v58 = v68;
      sub_1000062FC(v26, v68);
      if (v69((char *)v58, 1, v4))
      {
        sub_100006C90(v58, &qword_1000314C8);
        v59 = 0xE300000000000000;
        v60 = 7104878;
      }
      else
      {
        v61 = v70;
        v62 = v65;
        (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v65, v58, v4);
        v63 = sub_100006C90(v58, &qword_1000314C8);
        v60 = URL.absoluteString.getter(v63);
        v59 = v64;
        (*(void (**)(char *, uint64_t))(v61 + 8))(v62, v4);
      }
      v74 = sub_10000608C(v60, v59, (uint64_t *)&v75);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75, v56 + 4, v56 + 12);
      swift_release_n(v72, 2);
      swift_bridgeObjectRelease(v59);
      _os_log_impl((void *)&_mh_execute_header, v54, v55, "Root folder %s", v56, 0xCu);
      swift_arrayDestroy(v57, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v57, -1, -1);
      swift_slowDealloc(v56, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t (*)(char *, uint64_t, uint64_t)))(v71 + 8))(v73, v30);
    }
    else
    {

      swift_release_n(v52, 2);
      return (*(uint64_t (**)(char *, uint64_t (*)(char *, uint64_t, uint64_t)))(v71 + 8))(v51, v30);
    }
  }
  return result;
}

uint64_t sub_1000051E4()
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t result;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  NSString *v38;
  NSURL *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  Class isa;
  id v44;
  id v45;
  uint64_t v46;
  char *v47;
  _QWORD *v48;
  unint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t inited;
  NSURLResourceKey v56;
  NSString *v57;
  void *v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t, uint64_t);
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  NSURL *v75;
  void (*v76)(char *, uint64_t);
  void *v77;
  void *v78;
  unsigned int v79;
  id v80;
  id v81;
  void (*v82)(char *, uint64_t);
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  Swift::String v89;
  void *object;
  Swift::String v91;
  id v92;
  void (*v93)(char *, uint64_t);
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  NSObject *v101;
  uint64_t v102;
  uint8_t *v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  NSObject *v107;
  os_log_type_t v108;
  uint8_t *v109;
  uint64_t (*v110)(char *, uint64_t);
  char *v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  void (*v118)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v119;
  char *v120;
  uint64_t v121;
  NSURLResourceKey v122;
  void (*v123)(char *, unint64_t, uint64_t);
  uint64_t v124;
  __int128 v125;
  uint64_t v126;
  void (*v127)(char *, char *, uint64_t);
  char *v128;
  _QWORD *v129;
  uint64_t v130;
  uint64_t v131;
  void (*v132)(char *, uint64_t);
  char *v133;
  unsigned int (*v134)(char *, uint64_t, uint64_t);
  uint64_t v135;
  char *v136;
  char *v137;
  char *v138;
  char *v139;
  char *v140;
  char *v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  id v145[2];
  char v146[8];
  char v147[8];

  v131 = type metadata accessor for Logger(0);
  v130 = *(_QWORD *)(v131 - 8);
  v1 = __chkstk_darwin(v131);
  v128 = (char *)&v111 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __chkstk_darwin(v1);
  v136 = (char *)&v111 - v4;
  __chkstk_darwin(v3);
  v6 = (char *)&v111 - v5;
  v7 = sub_100003CB4(&qword_100031618);
  __chkstk_darwin(v7);
  v9 = (char *)&v111 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v142 = type metadata accessor for Date(0);
  v144 = *(_QWORD *)(v142 - 8);
  v10 = __chkstk_darwin(v142);
  v139 = (char *)&v111 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v10);
  v138 = (char *)&v111 - v13;
  __chkstk_darwin(v12);
  v137 = (char *)&v111 - v14;
  v15 = sub_100003CB4(&qword_100031620);
  __chkstk_darwin(v15);
  v17 = (char *)&v111 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for URLResourceValues(0);
  v135 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v143 = (char *)&v111 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_100003CB4(&qword_1000314C8);
  v21 = __chkstk_darwin(v20);
  v141 = (char *)&v111 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v24 = (char *)&v111 - v23;
  v25 = type metadata accessor for URL(0);
  v26 = *(_QWORD **)(v25 - 8);
  v27 = __chkstk_darwin(v25);
  v140 = (char *)&v111 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __chkstk_darwin(v27);
  v31 = (char *)&v111 - v30;
  result = __chkstk_darwin(v29);
  v34 = (char *)&v111 - v33;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy10ImageCache_hasRunCleanup) & 1) == 0)
  {
    v116 = OBJC_IVAR____TtC22PeopleMessagesAskToBuy10ImageCache_hasRunCleanup;
    v133 = v9;
    v117 = v0;
    v35 = v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy10ImageCache_directoryURL;
    swift_beginAccess(v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy10ImageCache_directoryURL, v147, 0, 0);
    sub_1000062FC(v35, (uint64_t)v24);
    v134 = (unsigned int (*)(char *, uint64_t, uint64_t))v26[6];
    if (v134(v24, 1, v25) == 1)
      return sub_100006C90((uint64_t)v24, &qword_1000314C8);
    v111 = v6;
    v127 = (void (*)(char *, char *, uint64_t))v26[4];
    v127(v34, v24, v25);
    v36 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
    v126 = sub_100003CB4(&qword_100031628);
    v37 = swift_allocObject(v126, 40, 7);
    v125 = xmmword_100025400;
    *(_OWORD *)(v37 + 16) = xmmword_100025400;
    *(_QWORD *)(v37 + 32) = NSURLContentModificationDateKey;
    v38 = NSURLContentModificationDateKey;
    v115 = v34;
    URL.standardizedFileURL.getter(v38);
    URL._bridgeToObjectiveC()(v39);
    v41 = v40;
    v129 = v26;
    v132 = (void (*)(char *, uint64_t))v26[1];
    v132(v31, v25);
    type metadata accessor for URLResourceKey(0);
    v124 = v42;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v37);
    v145[0] = 0;
    v44 = objc_msgSend(v36, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v41, isa, 4, v145);

    v45 = v145[0];
    if (v44)
    {
      v114 = v36;
      v46 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v44, v25);

      v47 = *(char **)(v46 + 16);
      v112 = v46;
      if (v47)
      {
        v48 = v129;
        v49 = v46 + ((*((unsigned __int8 *)v48 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v48 + 80));
        v121 = v129[9];
        v123 = (void (*)(char *, unint64_t, uint64_t))v129[2];
        v122 = NSURLCreationDateKey;
        v51 = v140;
        v50 = v141;
        v52 = v135;
        v119 = v25;
        v120 = v17;
        v113 = v18;
        v123(v141, v49, v25);
        while (1)
        {
          v54 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v48[7];
          v54(v50, 0, 1, v25);
          if (v134(v50, 1, v25) == 1)
            goto LABEL_29;
          v118 = v54;
          v136 = v47;
          v127(v51, v50, v25);
          inited = swift_initStackObject(v126, v146);
          *(_OWORD *)(inited + 16) = v125;
          v56 = v122;
          *(_QWORD *)(inited + 32) = v122;
          v57 = v56;
          v58 = sub_100006A64(inited);
          swift_setDeallocating(inited);
          v51 = v140;
          swift_arrayDestroy(inited + 32, 1, v124);
          URL.resourceValues(forKeys:)(v58);
          swift_bridgeObjectRelease(v58);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v52 + 56))(v17, 0, 1, v18);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v52 + 48))(v17, 1, v18) == 1)
          {
            swift_bridgeObjectRelease(v112);
            v104 = sub_100006C90((uint64_t)v17, &qword_100031620);
            v105 = v111;
            v106 = static PeopleLogger.messages.getter(v104);
            v107 = Logger.logObject.getter(v106);
            v108 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v107, v108))
            {
              v109 = (uint8_t *)swift_slowAlloc(2, -1);
              *(_WORD *)v109 = 0;
              _os_log_impl((void *)&_mh_execute_header, v107, v108, "Unable to file list", v109, 2u);
              swift_slowDealloc(v109, -1, -1);
            }

            (*(void (**)(char *, uint64_t))(v130 + 8))(v105, v131);
            v110 = (uint64_t (*)(char *, uint64_t))v132;
            v132(v51, v25);
            return v110(v115, v25);
          }
          v59 = v17;
          v60 = v139;
          v61 = v143;
          v62 = (*(uint64_t (**)(char *, char *, uint64_t))(v52 + 32))(v143, v59, v18);
          v63 = (uint64_t)v133;
          URLResourceValues.creationDate.getter(v62);
          v64 = v18;
          v65 = v144;
          v66 = v142;
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v144 + 48))(v63, 1, v142) == 1)
            break;
          v67 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 32);
          v68 = v137;
          v67(v137, v63, v66);
          if (qword_1000312C0 != -1)
            swift_once(&qword_1000312C0, sub_10000375C);
          v69 = sub_100003CB4(&qword_100031630);
          v70 = sub_100006CCC(v69, (uint64_t)qword_100032A68);
          v71 = v138;
          v72 = static Date.+ infix(_:_:)(v68, v70);
          v73 = v60;
          Date.init()(v72);
          v74 = sub_100006CE4(&qword_100031638, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
          if ((dispatch thunk of static Comparable.< infix(_:_:)(v60, v71, v66, v74) & 1) != 0)
          {
            v76 = *(void (**)(char *, uint64_t))(v144 + 8);
            v76(v60, v66);
            v76(v71, v66);
            v76(v68, v66);
            v52 = v135;
            v18 = v113;
            (*(void (**)(char *, uint64_t))(v135 + 8))(v143, v113);
            v25 = v119;
            v132(v51, v119);
            v17 = v120;
            goto LABEL_8;
          }
          URL._bridgeToObjectiveC()(v75);
          v78 = v77;
          v145[0] = 0;
          v79 = objc_msgSend(v114, "removeItemAtURL:error:", v77, v145);

          v80 = v145[0];
          v17 = v120;
          v50 = v141;
          if (v79)
          {
            v81 = v145[0];
            v82 = *(void (**)(char *, uint64_t))(v144 + 8);
            v83 = v142;
            v82(v73, v142);
            v82(v138, v83);
            v82(v137, v83);
            v52 = v135;
            v18 = v113;
            (*(void (**)(char *, uint64_t))(v135 + 8))(v143, v113);
            v25 = v119;
            v132(v51, v119);
          }
          else
          {
            v84 = v145[0];
            v85 = _convertNSErrorToError(_:)(v80);

            v86 = swift_willThrow();
            v87 = v128;
            static PeopleLogger.messages.getter(v86);
            v145[0] = 0;
            v145[1] = (id)0xE000000000000000;
            swift_errorRetain(v85);
            _StringGuts.grow(_:)(20);
            swift_bridgeObjectRelease(v145[1]);
            strcpy((char *)v145, "Failed delete ");
            HIBYTE(v145[1]) = -18;
            v88 = sub_100006CE4((unint64_t *)&qword_100031640, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
            v25 = v119;
            v89._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v119, v88);
            object = v89._object;
            String.append(_:)(v89);
            swift_bridgeObjectRelease(object);
            v91._countAndFlagsBits = 1076174906;
            v91._object = (void *)0xE400000000000000;
            String.append(_:)(v91);
            v92 = v145[1];
            Logger.ifError(_:message:)(v85, v145[0], v145[1]);
            swift_bridgeObjectRelease(v92);
            swift_errorRelease(v85);
            swift_errorRelease(v85);
            (*(void (**)(char *, uint64_t))(v130 + 8))(v87, v131);
            v93 = *(void (**)(char *, uint64_t))(v144 + 8);
            v94 = v142;
            v93(v73, v142);
            v93(v138, v94);
            v93(v137, v94);
            v52 = v135;
            v18 = v113;
            (*(void (**)(char *, uint64_t))(v135 + 8))(v143, v113);
            v132(v51, v25);
          }
LABEL_9:
          v49 += v121;
          v47 = v136 - 1;
          v48 = v129;
          if (v136 == (char *)1)
          {
            v118(v50, 1, 1, v25);
            goto LABEL_29;
          }
          v123(v50, v49, v25);
        }
        (*(void (**)(char *, uint64_t))(v52 + 8))(v61, v64);
        v53 = v119;
        v132(v51, v119);
        sub_100006C90(v63, &qword_100031618);
        v17 = v120;
        v18 = v64;
        v25 = v53;
LABEL_8:
        v50 = v141;
        goto LABEL_9;
      }
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v129[7])(v141, 1, 1, v25);
LABEL_29:
      swift_bridgeObjectRelease(v112);

      result = ((uint64_t (*)(char *, uint64_t))v132)(v115, v25);
      *(_BYTE *)(v117 + v116) = 1;
    }
    else
    {
      v95 = v45;
      v96 = v130;
      v97 = _convertNSErrorToError(_:)(v45);

      swift_willThrow();
      v98 = swift_errorRelease(v97);
      v99 = v136;
      v100 = static PeopleLogger.messages.getter(v98);
      v101 = Logger.logObject.getter(v100);
      v102 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v101, (os_log_type_t)v102))
      {
        v103 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v103 = 0;
        _os_log_impl((void *)&_mh_execute_header, v101, (os_log_type_t)v102, "Unable to read folder", v103, 2u);
        swift_slowDealloc(v103, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v96 + 8))(v99, v131);
      return ((uint64_t (*)(char *, uint64_t))v132)(v115, v25);
    }
  }
  return result;
}

uint64_t ImageCache.deinit()
{
  uint64_t v0;

  sub_100006C90(v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy10ImageCache_directoryURL, &qword_1000314C8);

  return v0;
}

uint64_t ImageCache.__deallocating_deinit()
{
  uint64_t v0;

  sub_100006C90(v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy10ImageCache_directoryURL, &qword_1000314C8);

  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100005F78(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100006F04;
  return v6(a1);
}

uint64_t sub_100005FDC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100006040;
  return v6(a1);
}

uint64_t sub_100006040()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000608C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_1000064F4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100006EC0((uint64_t)v12, *a3);
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
      sub_100006EC0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100006EA0(v12);
  return v7;
}

uint64_t sub_10000615C()
{
  _QWORD *v0;

  swift_unknownObjectRelease(v0[2]);
  swift_release(v0[4]);
  swift_bridgeObjectRelease(v0[6]);
  sub_100006198(v0[7], v0[8]);
  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100006198(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    ((void (*)(void))swift_release)();
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000061DC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc(dword_1000314BC);
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_100006270;
  return sub_100003CF4(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100006270()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000062B8(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    ((void (*)(void))swift_retain)();
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000062FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003CB4(&qword_1000314C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006344()
{
  return type metadata accessor for ImageCache(0);
}

uint64_t type metadata accessor for ImageCache(uint64_t a1)
{
  uint64_t result;

  result = qword_100031508;
  if (!qword_100031508)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ImageCache);
  return result;
}

void sub_100006388(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  sub_10000640C(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = &unk_100025428;
    v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
  }
}

void sub_10000640C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100031518)
  {
    v2 = type metadata accessor for URL(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100031518);
  }
}

uint64_t sub_100006460()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006484(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100031604);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100006270;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100031600 + dword_100031600))(a1, v4);
}

uint64_t sub_1000064F4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_1000066AC(a5, a6);
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

uint64_t sub_1000066AC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100006740(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100006918(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100006918(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100006740(uint64_t a1, unint64_t a2)
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
      v5 = sub_1000068B4(v4, 0);
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

_QWORD *sub_1000068B4(uint64_t a1, uint64_t a2)
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
  v4 = sub_100003CB4(&qword_100031668);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100006918(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100003CB4(&qword_100031668);
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

void *sub_100006A64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  Swift::Int v12;
  void *result;
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
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  char v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[9];

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_100003CB4(&qword_100031650);
    v3 = static _SetStorage.allocate(capacity:)(v1);
    v4 = 0;
    v5 = v3 + 56;
    v38 = v1;
    v39 = a1 + 32;
    while (1)
    {
      v6 = *(void **)(v39 + 8 * v4);
      v7 = *(_QWORD *)(v3 + 40);
      v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
      v10 = v9;
      Hasher.init(_seed:)(v40, v7);
      v11 = v6;
      String.hash(into:)(v40, v8, v10);
      v12 = Hasher._finalize()();
      result = (void *)swift_bridgeObjectRelease(v10);
      v14 = -1 << *(_BYTE *)(v3 + 32);
      v15 = v12 & ~v14;
      v16 = v15 >> 6;
      v17 = *(_QWORD *)(v5 + 8 * (v15 >> 6));
      v18 = 1 << v15;
      if (((1 << v15) & v17) != 0)
      {
        v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v15));
        v21 = v20;
        v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
        if (v19 == v22 && v21 == v23)
        {
LABEL_3:
          swift_bridgeObjectRelease_n(v21, 2);
LABEL_4:

          goto LABEL_5;
        }
        v25 = v23;
        v26 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v21, v22, v23, 0);
        swift_bridgeObjectRelease(v21);
        result = (void *)swift_bridgeObjectRelease(v25);
        if ((v26 & 1) != 0)
          goto LABEL_4;
        v27 = ~v14;
        while (1)
        {
          v15 = (v15 + 1) & v27;
          v16 = v15 >> 6;
          v17 = *(_QWORD *)(v5 + 8 * (v15 >> 6));
          v18 = 1 << v15;
          if ((v17 & (1 << v15)) == 0)
            break;
          v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v15));
          v21 = v29;
          v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
          if (v28 == v30 && v21 == v31)
            goto LABEL_3;
          v33 = v31;
          v34 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v21, v30, v31, 0);
          swift_bridgeObjectRelease(v21);
          result = (void *)swift_bridgeObjectRelease(v33);
          if ((v34 & 1) != 0)
            goto LABEL_4;
        }
      }
      *(_QWORD *)(v5 + 8 * v16) = v18 | v17;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v15) = v11;
      v35 = *(_QWORD *)(v3 + 16);
      v36 = __OFADD__(v35, 1);
      v37 = v35 + 1;
      if (v36)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v37;
LABEL_5:
      if (++v4 == v38)
        return (void *)v3;
    }
  }
  return &_swiftEmptySetSingleton;
}

uint64_t sub_100006C90(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100003CB4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006CCC(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100006CE4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t *sub_100006D24(uint64_t a1, uint64_t *a2)
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

unint64_t sub_100006D64()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100031648;
  if (!qword_100031648)
  {
    v1 = objc_opt_self(NSUnitDuration);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100031648);
  }
  return result;
}

uint64_t sub_100006DA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003CB4(&qword_1000314C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006DE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003CB4(&qword_1000314C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006E30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10003165C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100006F00;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100031658 + dword_100031658))(a1, v4);
}

uint64_t sub_100006EA0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100006EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_100006F0C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  objc_class *v15;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)&v1[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
  v7 = *(_QWORD *)&v1[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
  v8 = swift_bridgeObjectRetain(v7);
  static PeopleLogger.messages.getter(v8);
  v9 = swift_bridgeObjectRetain(v7);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v18 = v1;
    v12 = swift_slowAlloc(12, -1);
    v17 = v2;
    v13 = (uint8_t *)v12;
    v14 = swift_slowAlloc(32, -1);
    v20 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_bridgeObjectRetain(v7);
    v19 = sub_10000608C(v6, v7, &v20);
    v1 = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20, v13 + 4, v13 + 12);
    swift_bridgeObjectRelease_n(v7, 3);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "RequestMessageViewController deinit %s", v13, 0xCu);
    swift_arrayDestroy(v14, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v17);
  }
  else
  {

    swift_bridgeObjectRelease_n(v7, 2);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  v15 = (objc_class *)type metadata accessor for RequestMessageViewController();
  v21.receiver = v1;
  v21.super_class = v15;
  return objc_msgSendSuper2(&v21, "dealloc");
}

void sub_100007198()
{
  uint64_t v0;
  NSString v1;
  UIImage *v2;
  NSData *v3;
  unint64_t v4;
  unint64_t v5;

  if (qword_1000313A8 != -1)
    swift_once(&qword_1000313A8, sub_10000EA60);
  v0 = *(_QWORD *)algn_100032BA8;
  swift_bridgeObjectRetain(*(_QWORD *)algn_100032BA8);
  v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v0);
  v2 = (UIImage *)objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:", v1);

  if (!v2)
    goto LABEL_7;
  v3 = UIImagePNGRepresentation(v2);

  if (!v3)
  {
    v2 = 0;
LABEL_7:
    v5 = 0xF000000000000000;
    goto LABEL_8;
  }
  v2 = (UIImage *)static Data._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v5 = v4;

LABEL_8:
  qword_100032A88 = (uint64_t)v2;
  unk_100032A90 = v5;
}

id sub_100007310()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.messages.getter(v3);
  v6 = v0;
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v16 = v1;
    v9 = swift_slowAlloc(12, -1);
    v15 = v2;
    v10 = (uint8_t *)v9;
    v11 = swift_slowAlloc(32, -1);
    v18 = v11;
    *(_DWORD *)v10 = 136315138;
    v13 = *(_QWORD *)&v6[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
    v12 = *(_QWORD *)&v6[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
    swift_bridgeObjectRetain(v12);
    v17 = sub_10000608C(v13, v12, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, &v18, v10 + 4, v10 + 12);

    swift_bridgeObjectRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Failure balloon %s", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

    (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v16);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  v6[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_initialLoadError] = 1;
  return objc_msgSend(v6, "requestResize");
}

uint64_t sub_1000074F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[24];
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v1 = v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_eventNotifier;
  swift_beginAccess(v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_eventNotifier, v8, 0, 0);
  sub_10000E458(v1, (uint64_t)&v9, &qword_100031778);
  if (*((_QWORD *)&v10 + 1))
  {
    sub_10000E4E4((uint64_t)&v9, (uint64_t)v5);
    sub_100006C90((uint64_t)&v9, &qword_100031778);
    v2 = v6;
    v3 = v7;
    sub_10000E528(v5, v6);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
    sub_100006EA0(v5);
  }
  else
  {
    sub_100006C90((uint64_t)&v9, &qword_100031778);
  }
  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  swift_beginAccess(v1, v5, 33, 0);
  sub_10000E49C((uint64_t)&v9, v1);
  return swift_endAccess(v5);
}

double sub_1000075EC(double a1, CGFloat a2)
{
  void *v2;
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(char *, uint64_t);
  uint64_t v29;
  double v30;
  CGFloat *v31;
  double v32;
  char *v33;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  double v45;
  double v46;
  double v47;
  char *v48;
  char *v49;
  NSObject *v50;
  os_log_type_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  uint64_t v69;
  char *v71;
  char *v72;
  char *v73;
  uint64_t v74;
  CGFloat v75;
  char *v76;
  CGSize v77;

  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v71 - v11;
  v13 = __chkstk_darwin(v10);
  v72 = (char *)&v71 - v14;
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v71 - v16;
  static PeopleLogger.messages.getter(v15);
  v18 = v2;
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.debug.getter();
  v21 = os_log_type_enabled(v19, v20);
  v73 = v12;
  if (v21)
  {
    v22 = swift_slowAlloc(42, -1);
    v71 = v9;
    v23 = v22;
    v24 = swift_slowAlloc(64, -1);
    v76 = (char *)v24;
    *(_DWORD *)v23 = 136315906;
    v74 = v5;
    v25 = *(_QWORD *)&v18[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
    v26 = *(_QWORD *)&v18[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
    swift_bridgeObjectRetain(v26);
    v75 = COERCE_DOUBLE(sub_10000608C(v25, v26, (uint64_t *)&v76));
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v23 + 4, v23 + 12);

    swift_bridgeObjectRelease(v26);
    *(_WORD *)(v23 + 12) = 2080;
    v75 = COERCE_DOUBLE(sub_10000608C(0xD000000000000017, 0x80000001000243E0, (uint64_t *)&v76));
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v23 + 14, v23 + 22);
    *(_WORD *)(v23 + 22) = 2048;
    v75 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v23 + 24, v23 + 32);
    *(_WORD *)(v23 + 32) = 2048;
    v75 = a2;
    v5 = v74;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v23 + 34, v23 + 42);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s  %s! size: %f x %f", (uint8_t *)v23, 0x2Au);
    swift_arrayDestroy(v24, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    v27 = v23;
    v9 = v71;
    swift_slowDealloc(v27, -1, -1);

  }
  else
  {

  }
  v28 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
  v29 = v28(v17, v5);
  if ((v18[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_initialLoadError] & 1) != 0)
  {
    if (qword_100031318 != -1)
      swift_once(&qword_100031318, sub_10000E768);
  }
  else
  {
    if (a1 <= 300.0)
      v30 = a1;
    else
      v30 = 300.0;
    v31 = (CGFloat *)&v18[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_cachedSizeInfo];
    if ((v18[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_cachedSizeInfo + 32] & 1) != 0
      || (a1 = v31[2],
          v32 = v31[3],
          v77.width = v30,
          v77.height = a2,
          v29 = CGSizeEqualToSize(v77, *(CGSize *)v31),
          !(_DWORD)v29))
    {
      v42 = *(_QWORD *)&v18[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_bubble];
      if (v42
        && (v29 = *(_QWORD *)(v42
                            + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer_contentViewController)) != 0
        && (v29 = (uint64_t)objc_msgSend((id)v29, "view")) != 0)
      {
        v43 = (void *)v29;
        v44 = objc_msgSend((id)v29, "sizeThatFits:", v30, a2);
        a1 = v45;
        v47 = v46;
        v48 = v73;
        static PeopleLogger.messages.getter(v44);
        v49 = v18;
        v50 = Logger.logObject.getter(v49);
        v51 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v50, v51))
        {
          v52 = swift_slowAlloc(52, -1);
          v72 = (char *)swift_slowAlloc(32, -1);
          v76 = v72;
          *(_DWORD *)v52 = 136316162;
          v74 = v5;
          v53 = *(_QWORD *)&v49[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
          v54 = *(_QWORD *)&v49[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
          swift_bridgeObjectRetain(v54);
          v75 = COERCE_DOUBLE(sub_10000608C(v53, v54, (uint64_t *)&v76));
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v52 + 4, v52 + 12);

          swift_bridgeObjectRelease(v54);
          *(_WORD *)(v52 + 12) = 2048;
          v75 = a1;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v52 + 14, v52 + 22);
          *(_WORD *)(v52 + 22) = 2048;
          v75 = v47;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v52 + 24, v52 + 32);
          *(_WORD *)(v52 + 32) = 2048;
          v75 = v30;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v52 + 34, v52 + 42);
          *(_WORD *)(v52 + 42) = 2048;
          v75 = a2;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v52 + 44, v52 + 52);
          _os_log_impl((void *)&_mh_execute_header, v50, v51, " %s - contentSizeThatFits %f x %f in fitting size %f x %f", (uint8_t *)v52, 0x34u);
          v55 = v72;
          swift_arrayDestroy(v72, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v55, -1, -1);
          swift_slowDealloc(v52, -1, -1);

          v56 = v73;
          v57 = v74;
        }
        else
        {

          v56 = v48;
          v57 = v5;
        }
        v28(v56, v57);
        *v31 = v30;
        v31[1] = a2;
        v31[2] = a1;
        v31[3] = v47;
        *((_BYTE *)v31 + 32) = 0;
      }
      else
      {
        if (qword_100031320 != -1)
          v29 = swift_once(&qword_100031320, sub_10000E778);
        v58 = qword_100032AD8;
        static PeopleLogger.messages.getter(v29);
        v59 = v18;
        v60 = Logger.logObject.getter(v59);
        v61 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v60, v61))
        {
          v62 = swift_slowAlloc(32, -1);
          v74 = v5;
          v63 = v62;
          v64 = swift_slowAlloc(32, -1);
          v76 = (char *)v64;
          *(_DWORD *)v63 = 136315650;
          v65 = v9;
          v66 = *(_QWORD *)&v59[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
          v67 = *(_QWORD *)&v59[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
          swift_bridgeObjectRetain(v67);
          v75 = COERCE_DOUBLE(sub_10000608C(v66, v67, (uint64_t *)&v76));
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v63 + 4, v63 + 12);

          swift_bridgeObjectRelease(v67);
          *(_WORD *)(v63 + 12) = 2048;
          v75 = v30;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v63 + 14, v63 + 22);
          *(_WORD *)(v63 + 22) = 2048;
          v75 = *(double *)&v58;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v63 + 24, v63 + 32);
          _os_log_impl((void *)&_mh_execute_header, v60, v61, " %s - contentSizeThatFits using constants: %f x %f", (uint8_t *)v63, 0x20u);
          swift_arrayDestroy(v64, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v64, -1, -1);
          swift_slowDealloc(v63, -1, -1);

          v68 = v65;
          v69 = v74;
        }
        else
        {

          v68 = v9;
          v69 = v5;
        }
        v28(v68, v69);
        return v30;
      }
    }
    else
    {
      v33 = v72;
      static PeopleLogger.messages.getter(v29);
      v34 = v18;
      v35 = Logger.logObject.getter(v34);
      v36 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = swift_slowAlloc(52, -1);
        v74 = v5;
        v38 = v37;
        v39 = swift_slowAlloc(32, -1);
        v76 = (char *)v39;
        *(_DWORD *)v38 = 136316162;
        v40 = *(_QWORD *)&v34[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
        v41 = *(_QWORD *)&v34[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
        swift_bridgeObjectRetain(v41);
        v75 = COERCE_DOUBLE(sub_10000608C(v40, v41, (uint64_t *)&v76));
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v38 + 4, v38 + 12);

        swift_bridgeObjectRelease(v41);
        *(_WORD *)(v38 + 12) = 2048;
        v75 = a1;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v38 + 14, v38 + 22);
        *(_WORD *)(v38 + 22) = 2048;
        v75 = v32;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v38 + 24, v38 + 32);
        *(_WORD *)(v38 + 32) = 2048;
        v75 = v30;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v38 + 34, v38 + 42);
        *(_WORD *)(v38 + 42) = 2048;
        v75 = a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v38 + 44, v38 + 52);
        _os_log_impl((void *)&_mh_execute_header, v35, v36, " %s - contentSizeThatFits pre-sized %f x %f in fitting size %f x %f", (uint8_t *)v38, 0x34u);
        swift_arrayDestroy(v39, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v39, -1, -1);
        swift_slowDealloc(v38, -1, -1);

        v28(v33, v74);
      }
      else
      {

        v28(v33, v5);
      }
    }
  }
  return a1;
}

void sub_100007F1C(id a1)
{
  void *v1;
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
  char *v22;
  char *v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  objc_class *v35;
  char *v36;
  int v37;
  char *v38;
  char *v39;
  void *v40;
  char *v41;
  id v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  Swift::String v46;
  Swift::String v47;
  Swift::String v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  NSObject *v53;
  os_log_type_t v54;
  _BOOL4 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  id v70;
  char *v71;
  NSObject *v72;
  os_log_type_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  char *v83;
  void (*v84)(uint64_t, uint64_t);
  char *v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  id v89;
  uint64_t v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  char *v96;
  char *v97;
  char *v98;
  void (*v99)(char *, uint64_t);
  char *v100;
  id v101;
  char *v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  objc_super v109;

  v3 = sub_100003CB4(&qword_1000314A8);
  __chkstk_darwin(v3);
  v97 = (char *)&v93 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100003CB4(&qword_100031710);
  __chkstk_darwin(v5);
  v100 = (char *)&v93 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MessageDetails(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v96 = (char *)&v93 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v102 = (char *)&v93 - v12;
  __chkstk_darwin(v11);
  v104 = (uint64_t)&v93 - v13;
  v105 = type metadata accessor for Logger(0);
  v99 = *(void (**)(char *, uint64_t))(v105 - 8);
  v14 = __chkstk_darwin(v105);
  v95 = (char *)&v93 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v14);
  v98 = (char *)&v93 - v17;
  v18 = __chkstk_darwin(v16);
  v103 = (char *)&v93 - v19;
  v20 = __chkstk_darwin(v18);
  v22 = (char *)&v93 - v21;
  static PeopleLogger.messages.getter(v20);
  v23 = v1;
  v24 = Logger.logObject.getter(v23);
  v25 = static os_log_type_t.debug.getter();
  v26 = os_log_type_enabled(v24, v25);
  v101 = a1;
  if (v26)
  {
    v27 = swift_slowAlloc(22, -1);
    v28 = swift_slowAlloc(64, -1);
    v94 = v8;
    v29 = v28;
    v107 = v28;
    *(_DWORD *)v27 = 136315394;
    v31 = *(_QWORD *)&v23[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
    v30 = *(_QWORD *)&v23[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
    swift_bridgeObjectRetain(v30);
    v106 = sub_10000608C(v31, v30, &v107);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v106, &v107, v27 + 4, v27 + 12);

    swift_bridgeObjectRelease(v30);
    *(_WORD *)(v27 + 12) = 2080;
    v106 = sub_10000608C(0xD000000000000017, 0x8000000100024390, &v107);
    a1 = v101;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v106, &v107, v27 + 14, v27 + 22);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "%s  %s!", (uint8_t *)v27, 0x16u);
    swift_arrayDestroy(v29, 2, (char *)&type metadata for Any + 8);
    v32 = v29;
    v8 = v94;
    swift_slowDealloc(v32, -1, -1);
    swift_slowDealloc(v27, -1, -1);

  }
  else
  {

  }
  v33 = (void (*)(char *, uint64_t))*((_QWORD *)v99 + 1);
  v34 = v105;
  v33(v22, v105);
  v35 = (objc_class *)type metadata accessor for RequestMessageViewController();
  v109.receiver = v23;
  v109.super_class = v35;
  objc_msgSendSuper2(&v109, "willBecomeActiveWithConversation:", a1);
  objc_msgSend(v23, "setNeedsSizeMatchBeforeSnapshotSwap");
  v23[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_isBubbleActive] = 1;
  v36 = v100;
  sub_10000AA7C(a1, v100);
  v37 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v36, 1, v7);
  v39 = v102;
  v38 = v103;
  if (v37 == 1)
  {
    sub_100006C90((uint64_t)v36, &qword_100031710);
    v40 = (void *)static PeopleErrors.createError(_:code:)(0xD000000000000019, 0x8000000100024370, 500);
    v41 = v95;
    static PeopleLogger.messages.getter(v40);
    v107 = 0;
    v108 = 0xE000000000000000;
    v42 = v40;
    _StringGuts.grow(_:)(37);
    v43 = v108;
    v45 = *(_QWORD *)&v23[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
    v44 = *(_QWORD *)&v23[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
    swift_bridgeObjectRetain(v44);
    swift_bridgeObjectRelease(v43);
    v107 = v45;
    v108 = v44;
    v46._countAndFlagsBits = 32;
    v46._object = (void *)0xE100000000000000;
    String.append(_:)(v46);
    v47._object = (void *)0x8000000100024390;
    v47._countAndFlagsBits = 0xD000000000000017;
    String.append(_:)(v47);
    v48._countAndFlagsBits = 0xD000000000000020;
    v48._object = (void *)0x80000001000243B0;
    String.append(_:)(v48);
    v49 = v108;
    Logger.ifError(_:message:)(v42, v107, v108);

    swift_bridgeObjectRelease(v49);
    v33(v41, v34);
    sub_100007310();

  }
  else
  {
    v50 = v104;
    v51 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(v104, v36, v7);
    static PeopleLogger.messages.getter(v51);
    v100 = *(char **)(v8 + 16);
    ((void (*)(char *, uint64_t, uint64_t))v100)(v39, v50, v7);
    v52 = v23;
    v53 = Logger.logObject.getter(v52);
    v54 = static os_log_type_t.debug.getter();
    v55 = os_log_type_enabled(v53, v54);
    v99 = v33;
    if (v55)
    {
      v56 = swift_slowAlloc(32, -1);
      v57 = swift_slowAlloc(96, -1);
      v107 = v57;
      *(_DWORD *)v56 = 136315650;
      v95 = (char *)v7;
      v58 = *(_QWORD *)&v52[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
      v59 = *(_QWORD *)&v52[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
      swift_bridgeObjectRetain(v59);
      v106 = sub_10000608C(v58, v59, &v107);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v106, &v107, v56 + 4, v56 + 12);

      swift_bridgeObjectRelease(v59);
      *(_WORD *)(v56 + 12) = 2080;
      v106 = sub_10000608C(0xD000000000000017, 0x8000000100024390, &v107);
      v60 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v106, &v107, v56 + 14, v56 + 22);
      *(_WORD *)(v56 + 22) = 2080;
      v61 = v102;
      v62 = MessageDetails.requestID.getter(v60);
      v64 = v63;
      v106 = sub_10000608C(v62, v63, &v107);
      v7 = (uint64_t)v95;
      v34 = v105;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v106, &v107, v56 + 24, v56 + 32);
      swift_bridgeObjectRelease(v64);
      v102 = *(char **)(v8 + 8);
      ((void (*)(char *, uint64_t))v102)(v61, v7);
      _os_log_impl((void *)&_mh_execute_header, v53, v54, "%s %s - %s loaded from cache", (uint8_t *)v56, 0x20u);
      swift_arrayDestroy(v57, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v57, -1, -1);
      v65 = v56;
      v33 = v99;
      swift_slowDealloc(v65, -1, -1);

      v66 = v103;
    }
    else
    {

      v102 = *(char **)(v8 + 8);
      ((void (*)(char *, uint64_t))v102)(v39, v7);

      v66 = v38;
    }
    v33(v66, v34);
    v67 = v98;
    v68 = v96;
    v69 = v104;
    v70 = sub_1000088D4(v104);
    static PeopleLogger.messages.getter(v70);
    ((void (*)(char *, uint64_t, uint64_t))v100)(v68, v69, v7);
    v71 = v52;
    v72 = Logger.logObject.getter(v71);
    v73 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = swift_slowAlloc(32, -1);
      v75 = swift_slowAlloc(96, -1);
      v107 = v75;
      *(_DWORD *)v74 = 136315650;
      v76 = v7;
      v77 = *(_QWORD *)&v71[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
      v78 = *(_QWORD *)&v71[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
      swift_bridgeObjectRetain(v78);
      v106 = sub_10000608C(v77, v78, &v107);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v106, &v107, v74 + 4, v74 + 12);

      swift_bridgeObjectRelease(v78);
      *(_WORD *)(v74 + 12) = 2080;
      v106 = sub_10000608C(0xD000000000000017, 0x8000000100024390, &v107);
      v79 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v106, &v107, v74 + 14, v74 + 22);
      *(_WORD *)(v74 + 22) = 2080;
      v80 = MessageDetails.requestID.getter(v79);
      v82 = v81;
      v106 = sub_10000608C(v80, v81, &v107);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v106, &v107, v74 + 24, v74 + 32);
      swift_bridgeObjectRelease(v82);
      v83 = v68;
      v84 = (void (*)(uint64_t, uint64_t))v102;
      ((void (*)(char *, uint64_t))v102)(v83, v76);
      _os_log_impl((void *)&_mh_execute_header, v72, v73, "%s %s - %s loadIgnoringCache...", (uint8_t *)v74, 0x20u);
      swift_arrayDestroy(v75, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v75, -1, -1);
      swift_slowDealloc(v74, -1, -1);

      v99(v98, v105);
    }
    else
    {

      v85 = v68;
      v84 = (void (*)(uint64_t, uint64_t))v102;
      ((void (*)(char *, uint64_t))v102)(v85, v7);

      v33(v67, v34);
      v76 = v7;
    }
    v86 = type metadata accessor for TaskPriority(0);
    v87 = (uint64_t)v97;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v86 - 8) + 56))(v97, 1, 1, v86);
    type metadata accessor for MainActor(0);
    v88 = v71;
    v89 = v101;
    v90 = static MainActor.shared.getter();
    v91 = (_QWORD *)swift_allocObject(&unk_10002D450, 48, 7);
    v91[2] = v90;
    v91[3] = &protocol witness table for MainActor;
    v91[4] = v88;
    v91[5] = v89;
    v92 = sub_100004258(v87, (uint64_t)&unk_100031790, (uint64_t)v91);
    swift_release(v92);
    v84(v104, v76);
  }
}

id sub_1000088D4(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t Strong;
  int v24;
  uint64_t v25;
  uint64_t ObjectType;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  id result;
  char *v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
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

  v2 = v1;
  v68 = a1;
  v3 = type metadata accessor for Logger(0);
  v69 = *(_QWORD *)(v3 - 8);
  v70 = v3;
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v9 = (char *)&v65 - v8;
  __chkstk_darwin(v7);
  v11 = (char *)&v65 - v10;
  v12 = sub_100003CB4(&qword_100031708);
  __chkstk_darwin(v12);
  v14 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for MessageDetails.EventSource(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_100003CB4(&qword_100031710);
  __chkstk_darwin(v19);
  v21 = (char *)&v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = &v2[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_bubbleDelegate];
  Strong = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_bubbleDelegate]);
  if (Strong)
  {
    v24 = v2[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_isBubbleActive];
    v67 = Strong;
    if (v24 == 1)
    {
      v65 = v15;
      v25 = *((_QWORD *)v22 + 1);
      ObjectType = swift_getObjectType(Strong);
      v27 = v68;
      v28 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, CGFloat, CGFloat, CGFloat, CGFloat))(v25 + 24))(v68, ObjectType, v25, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
      v66 = v28;
      v29 = *(void **)(v28 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer_contentViewController);
      if (v29)
      {
        v30 = type metadata accessor for MessageDetails(0);
        v31 = *(_QWORD *)(v30 - 8);
        (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v21, v27, v30);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v21, 0, 1, v30);
        v32 = v29;
        LOBYTE(v30) = sub_10000DD44((uint64_t)v21);
        sub_100006C90((uint64_t)v21, &qword_100031710);
        if ((v30 & 1) != 0)
        {
          sub_1000074F8();
          v33 = v65;
        }
        else
        {
          v56 = swift_unknownObjectWeakLoadStrong(v22);
          v57 = v68;
          v33 = v65;
          if (v56)
          {
            v58 = v56;
            v59 = *((_QWORD *)v22 + 1);
            v60 = swift_getObjectType(v56);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 32))(v57, v60, v59);
            swift_unknownObjectRelease(v58);
          }
        }
        result = objc_msgSend(v32, "view");
        if (result)
        {
          v61 = result;
          v62 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
          objc_msgSend(v61, "setBackgroundColor:", v62);

          MessageDetails.eventSource.getter();
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v33) == 1)
          {
            (*(void (**)(char *, _QWORD, uint64_t))(v16 + 104))(v18, enum case for MessageDetails.EventSource.unknown(_:), v33);
            sub_100006C90((uint64_t)v14, &qword_100031708);
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v33);
          }
          sub_10000CEE8(v32);
          (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v33);
          v63 = *(_QWORD *)&v2[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_bubble];
          v64 = v67;
          *(_QWORD *)&v2[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_bubble] = v66;
          swift_unknownObjectRelease(v64);

          return (id)swift_release(v63);
        }
        else
        {
          __break(1u);
        }
      }
      else
      {
        static PeopleLogger.messages.getter(v28);
        v49 = v2;
        v50 = Logger.logObject.getter(v49);
        v51 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v50, v51))
        {
          v52 = (uint8_t *)swift_slowAlloc(12, -1);
          v53 = swift_slowAlloc(32, -1);
          v72 = v53;
          *(_DWORD *)v52 = 136315138;
          v55 = *(_QWORD *)&v49[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
          v54 = *(_QWORD *)&v49[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
          swift_bridgeObjectRetain(v54);
          v71 = sub_10000608C(v55, v54, &v72);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v52 + 4, v52 + 12);

          swift_bridgeObjectRelease(v54);
          _os_log_impl((void *)&_mh_execute_header, v50, v51, "%s - No bubble view controller!", v52, 0xCu);
          swift_arrayDestroy(v53, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v53, -1, -1);
          swift_slowDealloc(v52, -1, -1);
          swift_release(v66);
          swift_unknownObjectRelease(v67);

        }
        else
        {

          swift_unknownObjectRelease(v67);
          swift_release(v66);
        }
        return (id)(*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v11, v70);
      }
    }
    else
    {
      static PeopleLogger.messages.getter(Strong);
      v41 = v2;
      v42 = Logger.logObject.getter(v41);
      v43 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v42, v43))
      {
        v44 = (uint8_t *)swift_slowAlloc(12, -1);
        v45 = swift_slowAlloc(32, -1);
        v72 = v45;
        *(_DWORD *)v44 = 136315138;
        v46 = *(_QWORD *)&v41[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
        v47 = *(_QWORD *)&v41[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
        swift_bridgeObjectRetain(v47);
        v71 = sub_10000608C(v46, v47, &v72);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v44 + 4, v44 + 12);

        swift_bridgeObjectRelease(v47);
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "%s has been deactivated prior to render!", v44, 0xCu);
        swift_arrayDestroy(v45, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v45, -1, -1);
        swift_slowDealloc(v44, -1, -1);
        swift_unknownObjectRelease(v67);

      }
      else
      {

        swift_unknownObjectRelease(v67);
      }
      return (id)(*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v9, v70);
    }
  }
  else
  {
    static PeopleLogger.messages.getter(0);
    v34 = v2;
    v35 = Logger.logObject.getter(v34);
    v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc(12, -1);
      v38 = swift_slowAlloc(32, -1);
      v72 = v38;
      *(_DWORD *)v37 = 136315138;
      v39 = *(_QWORD *)&v34[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
      v40 = *(_QWORD *)&v34[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
      swift_bridgeObjectRetain(v40);
      v71 = sub_10000608C(v39, v40, &v72);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v37 + 4, v37 + 12);

      swift_bridgeObjectRelease(v40);
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "%s - Missing bubble creator!", v37, 0xCu);
      swift_arrayDestroy(v38, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v38, -1, -1);
      swift_slowDealloc(v37, -1, -1);

    }
    else
    {

    }
    return (id)(*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v6, v70);
  }
  return result;
}

uint64_t sub_10000907C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;

  v7 = type metadata accessor for MainActor(0);
  v5[2] = v7;
  v5[3] = static MainActor.shared.getter(v7);
  v8 = (_QWORD *)swift_task_alloc(dword_1000316DC);
  v5[4] = v8;
  *v8 = v5;
  v8[1] = sub_1000090F0;
  return sub_1000091E4(a5);
}

uint64_t sub_1000090F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 32));
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100009160, v2, v3);
}

uint64_t sub_100009160()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000091E4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2[6] = a1;
  v2[7] = v1;
  v3 = type metadata accessor for CancellationError(0);
  v2[8] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[9] = v4;
  v2[10] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Logger(0);
  v2[11] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[12] = v6;
  v7 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[13] = swift_task_alloc(v7);
  v2[14] = swift_task_alloc(v7);
  v2[15] = swift_task_alloc(v7);
  v2[16] = swift_task_alloc(v7);
  v2[17] = swift_task_alloc(v7);
  v8 = type metadata accessor for MessageDetails(0);
  v2[18] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v2[19] = v9;
  v10 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[20] = swift_task_alloc(v10);
  v2[21] = swift_task_alloc(v10);
  v11 = (*(_QWORD *)(*(_QWORD *)(sub_100003CB4(&qword_1000314C8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[22] = swift_task_alloc(v11);
  v2[23] = swift_task_alloc(v11);
  v12 = type metadata accessor for URL(0);
  v2[24] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v2[25] = v13;
  v2[26] = swift_task_alloc((*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for PeopleURL.Parameter(0);
  v2[27] = v14;
  v15 = *(_QWORD *)(v14 - 8);
  v2[28] = v15;
  v2[29] = swift_task_alloc((*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for MainActor(0);
  v2[30] = static MainActor.shared.getter(v16);
  v17 = dispatch thunk of Actor.unownedExecutor.getter(v16, &protocol witness table for MainActor);
  v2[31] = v17;
  v2[32] = v18;
  return swift_task_switch(sub_100009390, v17, v18);
}

uint64_t sub_100009390()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  const char *v17;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v2 = *(_QWORD *)(v0 + 224);
  v1 = *(_QWORD *)(v0 + 232);
  v3 = *(_QWORD *)(v0 + 216);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, enum case for PeopleURL.Parameter.requestID(_:), v3);
  v4 = sub_1000101F0(v1);
  v6 = v5;
  *(_QWORD *)(v0 + 264) = v4;
  *(_QWORD *)(v0 + 272) = v5;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (!v6)
  {
    v11 = (uint64_t *)(v0 + 128);
    v12 = swift_release(*(_QWORD *)(v0 + 240));
    v13 = static PeopleLogger.messages.getter(v12);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v16 = 0;
      v17 = "conversation.requestID is nil";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v14, v15, v17, v16, 2u);
      swift_slowDealloc(v16, -1, -1);
    }
LABEL_13:
    v26 = *v11;
    v27 = *(_QWORD *)(v0 + 88);
    v28 = *(_QWORD *)(v0 + 96);

    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v27);
    v29 = *(_QWORD *)(v0 + 208);
    v31 = *(_QWORD *)(v0 + 176);
    v30 = *(_QWORD *)(v0 + 184);
    v33 = *(_QWORD *)(v0 + 160);
    v32 = *(_QWORD *)(v0 + 168);
    v35 = *(_QWORD *)(v0 + 128);
    v34 = *(_QWORD *)(v0 + 136);
    v37 = *(_QWORD *)(v0 + 112);
    v36 = *(_QWORD *)(v0 + 120);
    v44 = *(_QWORD *)(v0 + 104);
    v45 = *(_QWORD *)(v0 + 80);
    swift_task_dealloc(*(_QWORD *)(v0 + 232));
    swift_task_dealloc(v29);
    swift_task_dealloc(v30);
    swift_task_dealloc(v31);
    swift_task_dealloc(v32);
    swift_task_dealloc(v33);
    swift_task_dealloc(v34);
    swift_task_dealloc(v35);
    swift_task_dealloc(v36);
    swift_task_dealloc(v37);
    swift_task_dealloc(v44);
    swift_task_dealloc(v45);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v7 = objc_msgSend(*(id *)(v0 + 48), "selectedMessage");
  if (!v7)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 200) + 56))(*(_QWORD *)(v0 + 184), 1, 1, *(_QWORD *)(v0 + 192));
    goto LABEL_10;
  }
  v8 = v7;
  v9 = objc_msgSend(v7, "URL");

  if (v9)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v9);

    v10 = 0;
  }
  else
  {
    v10 = 1;
  }
  v19 = *(_QWORD *)(v0 + 192);
  v18 = *(_QWORD *)(v0 + 200);
  v21 = *(_QWORD *)(v0 + 176);
  v20 = *(_QWORD *)(v0 + 184);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(v21, v10, 1, v19);
  sub_100006DA0(v21, v20);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v20, 1, v19) == 1)
  {
LABEL_10:
    v11 = (uint64_t *)(v0 + 136);
    v22 = *(_QWORD *)(v0 + 240);
    v23 = *(_QWORD *)(v0 + 184);
    swift_bridgeObjectRelease(v6);
    swift_release(v22);
    v24 = sub_100006C90(v23, &qword_1000314C8);
    v25 = static PeopleLogger.messages.getter(v24);
    v14 = Logger.logObject.getter(v25);
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v16 = 0;
      v17 = "message url is nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v39 = *(_QWORD *)(v0 + 208);
  v40 = *(_QWORD *)(v0 + 56);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 32))(v39, *(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 192));
  *(_QWORD *)(v0 + 280) = *(_QWORD *)(v40
                                    + OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_messageDetailsLoader);
  v41 = sub_10000EB88(v39, v4, v6);
  *(_QWORD *)(v0 + 288) = v41;
  v42 = (_QWORD *)swift_task_alloc(async function pointer to Task.value.getter[1]);
  *(_QWORD *)(v0 + 296) = v42;
  v43 = sub_100003CB4(&qword_1000316F8);
  *(_QWORD *)(v0 + 304) = v43;
  *v42 = v0;
  v42[1] = sub_100009730;
  return Task.value.getter(*(_QWORD *)(v0 + 168), v41, *(_QWORD *)(v0 + 144), v43, &protocol self-conformance witness table for Error);
}

uint64_t sub_100009730()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 296);
  *(_QWORD *)(*(_QWORD *)v1 + 312) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = v2[31];
    v5 = v2[32];
    v6 = sub_1000098D8;
  }
  else
  {
    v7 = v2[34];
    swift_release(v2[36]);
    swift_bridgeObjectRelease(v7);
    v4 = v2[31];
    v5 = v2[32];
    v6 = sub_1000097A8;
  }
  return swift_task_switch(v6, v4, v5);
}

uint64_t sub_1000097A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v1 = *(_QWORD *)(v0 + 168);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 152);
  swift_release(*(_QWORD *)(v0 + 240));
  sub_1000088D4(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  v5 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 208);
  v6 = *(_QWORD *)(v0 + 192);
  v7 = *(void **)(v0 + 56);
  objc_msgSend(v7, "setReadyForDisplay");
  objc_msgSend(v7, "requestResize");
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v8 = *(_QWORD *)(v0 + 208);
  v10 = *(_QWORD *)(v0 + 176);
  v9 = *(_QWORD *)(v0 + 184);
  v12 = *(_QWORD *)(v0 + 160);
  v11 = *(_QWORD *)(v0 + 168);
  v14 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 136);
  v16 = *(_QWORD *)(v0 + 112);
  v15 = *(_QWORD *)(v0 + 120);
  v18 = *(_QWORD *)(v0 + 104);
  v19 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 232));
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000098D8()
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
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
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
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v1 = *(_QWORD *)(v0 + 304);
  v2 = *(_QWORD *)(v0 + 312);
  v3 = *(_QWORD *)(v0 + 288);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 64);
  swift_release(*(_QWORD *)(v0 + 240));
  swift_release(v3);
  *(_QWORD *)(v0 + 16) = v2;
  swift_errorRetain(v2);
  v6 = swift_dynamicCast(v4, v0 + 16, v1, v5, 6);
  if ((v6 & 1) != 0)
  {
    v8 = *(_QWORD *)(v0 + 72);
    v7 = *(_QWORD *)(v0 + 80);
    v9 = *(_QWORD *)(v0 + 64);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 272));
    v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    v11 = static PeopleLogger.messages.getter(v10);
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "loadAndRenderBubbleIgnoringCache cancelled, no render", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }
    v15 = *(_QWORD *)(v0 + 312);
    v17 = *(_QWORD *)(v0 + 200);
    v16 = *(_QWORD *)(v0 + 208);
    v18 = *(_QWORD *)(v0 + 192);
    v19 = *(_QWORD *)(v0 + 120);
    v20 = *(_QWORD *)(v0 + 88);
    v21 = *(_QWORD *)(v0 + 96);

    swift_errorRelease(v15);
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v19, v20);
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  else
  {
    v22 = *(_QWORD *)(v0 + 312);
    v23 = *(void **)(v0 + 56);
    static PeopleLogger.messages.getter(v6);
    swift_errorRetain(v22);
    swift_errorRetain(v22);
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.debug.getter();
    v26 = os_log_type_enabled(v24, v25);
    v27 = *(_QWORD *)(v0 + 312);
    v28 = *(_QWORD *)(v0 + 112);
    v29 = *(_QWORD *)(v0 + 88);
    v30 = *(char **)(v0 + 56);
    if (v26)
    {
      v57 = *(_QWORD *)(v0 + 96);
      v31 = swift_slowAlloc(32, -1);
      v55 = (uint64_t *)swift_slowAlloc(8, -1);
      v56 = swift_slowAlloc(64, -1);
      v60 = v56;
      *(_DWORD *)v31 = 136315650;
      v32 = *(_QWORD *)&v30[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
      v33 = *(_QWORD *)&v30[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
      swift_bridgeObjectRetain(v33);
      *(_QWORD *)(v0 + 24) = sub_10000608C(v32, v33, &v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v31 + 4, v31 + 12);
      swift_bridgeObjectRelease(v33);

      *(_WORD *)(v31 + 12) = 2080;
      *(_QWORD *)(v0 + 32) = sub_10000608C(0xD000000000000027, 0x80000001000242D0, &v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v31 + 14, v31 + 22);
      *(_WORD *)(v31 + 22) = 2112;
      swift_errorRetain(v27);
      v34 = _swift_stdlib_bridgeErrorToNSError(v27);
      *(_QWORD *)(v0 + 40) = v34;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v31 + 24, v31 + 32);
      *v55 = v34;
      swift_errorRelease(v27);
      swift_errorRelease(v27);
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "%s  %s error loading full bubble: %@", (uint8_t *)v31, 0x20u);
      v35 = sub_100003CB4(&qword_100031700);
      swift_arrayDestroy(v55, 1, v35);
      swift_slowDealloc(v55, -1, -1);
      swift_arrayDestroy(v56, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v56, -1, -1);
      swift_slowDealloc(v31, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v28, v29);
    }
    else
    {
      v36 = *(_QWORD *)(v0 + 96);

      swift_errorRelease(v27);
      swift_errorRelease(v27);

      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v28, v29);
    }
    sub_10000ED98(*(_QWORD *)(v0 + 208), 1, *(_QWORD *)(v0 + 160));
    v37 = *(_QWORD *)(v0 + 312);
    v39 = *(_QWORD *)(v0 + 152);
    v38 = *(_QWORD *)(v0 + 160);
    v40 = *(_QWORD *)(v0 + 144);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 272));
    sub_1000088D4(v38);
    swift_errorRelease(v37);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v40);
    v42 = *(_QWORD *)(v0 + 200);
    v41 = *(_QWORD *)(v0 + 208);
    v43 = *(_QWORD *)(v0 + 192);
    v44 = *(void **)(v0 + 56);
    objc_msgSend(v44, "setReadyForDisplay");
    objc_msgSend(v44, "requestResize");
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
  }
  v45 = *(_QWORD *)(v0 + 208);
  v47 = *(_QWORD *)(v0 + 176);
  v46 = *(_QWORD *)(v0 + 184);
  v49 = *(_QWORD *)(v0 + 160);
  v48 = *(_QWORD *)(v0 + 168);
  v51 = *(_QWORD *)(v0 + 128);
  v50 = *(_QWORD *)(v0 + 136);
  v53 = *(_QWORD *)(v0 + 112);
  v52 = *(_QWORD *)(v0 + 120);
  v58 = *(_QWORD *)(v0 + 104);
  v59 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 232));
  swift_task_dealloc(v45);
  swift_task_dealloc(v46);
  swift_task_dealloc(v47);
  swift_task_dealloc(v48);
  swift_task_dealloc(v49);
  swift_task_dealloc(v50);
  swift_task_dealloc(v51);
  swift_task_dealloc(v52);
  swift_task_dealloc(v53);
  swift_task_dealloc(v58);
  swift_task_dealloc(v59);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009EC0(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t result;
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

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.messages.getter(v5);
  v8 = a1;
  v9 = v1;
  v10 = v8;
  v11 = (char *)v9;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(32, -1);
    v32 = v4;
    v15 = v14;
    v16 = swift_slowAlloc(96, -1);
    v35 = v16;
    *(_DWORD *)v15 = 136315650;
    v31 = v3;
    v33 = (uint64_t)a1;
    v18 = *(_QWORD *)&v11[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
    v17 = *(_QWORD *)&v11[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
    swift_bridgeObjectRetain(v17);
    v34 = sub_10000608C(v18, v17, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v15 + 4, v15 + 12);

    swift_bridgeObjectRelease(v17);
    *(_WORD *)(v15 + 12) = 2080;
    v34 = sub_10000608C(0xD000000000000013, 0x8000000100024350, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v15 + 14, v15 + 22);
    *(_WORD *)(v15 + 22) = 2080;
    v34 = v33;
    v19 = v10;
    v20 = sub_100003CB4(&qword_100031780);
    v21 = String.init<A>(describing:)(&v34, v20);
    v23 = v22;
    v34 = sub_10000608C(v21, v22, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v15 + 24, v15 + 32);

    v24 = v33;
    swift_bridgeObjectRelease(v23);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s  %s %s", (uint8_t *)v15, 0x20u);
    swift_arrayDestroy(v16, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    swift_slowDealloc(v15, -1, -1);

    result = (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v7, v31);
    if (v24)
      return result;
  }
  else
  {

    result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    if (a1)
      return result;
  }
  v11[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_isBubbleActive] = 0;
  v26 = *(_QWORD *)&v11[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_messageDetailsLoader];
  v27 = *(_QWORD *)(v26 + 128);
  if (v27)
  {
    type metadata accessor for MessageDetails(0);
    swift_retain(v27);
    sub_100003CB4(&qword_1000316F8);
    Task.cancel()();
    swift_release(v27);
    v28 = *(_QWORD *)(v26 + 128);
  }
  else
  {
    v28 = 0;
  }
  *(_QWORD *)(v26 + 128) = 0;
  swift_release(v28);
  sub_1000074F8();
  v29 = *(_QWORD *)&v11[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_bubble];
  *(_QWORD *)&v11[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_bubble] = 0;
  return swift_release(v29);
}

uint64_t sub_10000A258(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for RequestMessageViewController();
  objc_msgSendSuper2(&v7, "willResignActiveWithConversation:", a1);
  v1[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_isBubbleActive] = 0;
  v3 = *(_QWORD *)&v1[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_messageDetailsLoader];
  v4 = *(_QWORD *)(v3 + 128);
  if (v4)
  {
    type metadata accessor for MessageDetails(0);
    swift_retain(v4);
    sub_100003CB4(&qword_1000316F8);
    Task.cancel()();
    swift_release(v4);
    v5 = *(_QWORD *)(v3 + 128);
  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)(v3 + 128) = 0;
  swift_release(v5);
  return sub_1000074F8();
}

void sub_10000A36C(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  _BYTE *v22;
  objc_class *v23;
  id v24;
  void *v25;
  uint64_t v26;
  _BYTE *v27;
  char *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  char *v43;
  NSObject *v44;
  os_log_type_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  void (*v55)(_BYTE *, uint64_t);
  uint64_t v56;
  _BYTE v57[4];
  int v58;
  uint64_t v59;
  _BYTE *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  objc_super v66;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v62 = v3;
  v63 = v4;
  v5 = __chkstk_darwin(v3);
  v7 = &v57[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = __chkstk_darwin(v5);
  v10 = &v57[-v9];
  __chkstk_darwin(v8);
  v12 = &v57[-v11];
  v13 = sub_100003CB4(&qword_100031710);
  __chkstk_darwin(v13);
  v15 = &v57[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = type metadata accessor for MessageDetails(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = __chkstk_darwin(v16);
  v20 = &v57[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v18);
  v22 = &v57[-v21];
  v23 = (objc_class *)type metadata accessor for RequestMessageViewController();
  v66.receiver = v1;
  v66.super_class = v23;
  objc_msgSendSuper2(&v66, "didTransitionToPresentationStyle:", a1);
  v24 = objc_msgSend(v1, "activeConversation");
  if (v24)
  {
    v25 = v24;
    sub_10000AA7C(v24, v15);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
    {
      v26 = sub_100006C90((uint64_t)v15, &qword_100031710);
      v27 = v10;
      static PeopleLogger.messages.getter(v26);
      v28 = v1;
      v29 = Logger.logObject.getter(v28);
      v30 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = swift_slowAlloc(22, -1);
        v32 = swift_slowAlloc(64, -1);
        v65 = v32;
        *(_DWORD *)v31 = 136315394;
        v33 = *(_QWORD *)&v28[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
        v34 = *(_QWORD *)&v28[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
        swift_bridgeObjectRetain(v34);
        v64 = sub_10000608C(v33, v34, &v65);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65, v31 + 4, v31 + 12);

        swift_bridgeObjectRelease(v34);
        *(_WORD *)(v31 + 12) = 2080;
        v64 = sub_10000608C(0xD000000000000012, 0x8000000100024330, &v65);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65, v31 + 14, v31 + 22);
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "%s %s - failed to load from cache", (uint8_t *)v31, 0x16u);
        swift_arrayDestroy(v32, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v32, -1, -1);
        swift_slowDealloc(v31, -1, -1);

      }
      else
      {

      }
      (*(void (**)(_BYTE *, uint64_t))(v63 + 8))(v27, v62);
      sub_100007310();

    }
    else
    {
      v42 = (*(uint64_t (**)(_BYTE *, char *, uint64_t))(v17 + 32))(v22, v15, v16);
      static PeopleLogger.messages.getter(v42);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v17 + 16))(v20, v22, v16);
      v43 = v1;
      v44 = Logger.logObject.getter(v43);
      v45 = static os_log_type_t.debug.getter();
      v46 = v45;
      if (os_log_type_enabled(v44, v45))
      {
        v47 = swift_slowAlloc(32, -1);
        v61 = v43;
        v48 = v47;
        v59 = swift_slowAlloc(96, -1);
        v65 = v59;
        *(_DWORD *)v48 = 136315650;
        v60 = v12;
        v58 = v46;
        v50 = *(_QWORD *)&v61[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
        v49 = *(_QWORD *)&v61[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
        swift_bridgeObjectRetain(v49);
        v64 = sub_10000608C(v50, v49, &v65);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65, v48 + 4, v48 + 12);

        swift_bridgeObjectRelease(v49);
        *(_WORD *)(v48 + 12) = 2080;
        v64 = sub_10000608C(0xD000000000000012, 0x8000000100024330, &v65);
        v51 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65, v48 + 14, v48 + 22);
        *(_WORD *)(v48 + 22) = 2080;
        v52 = MessageDetails.requestID.getter(v51);
        v54 = v53;
        v64 = sub_10000608C(v52, v53, &v65);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65, v48 + 24, v48 + 32);
        swift_bridgeObjectRelease(v54);
        v55 = *(void (**)(_BYTE *, uint64_t))(v17 + 8);
        v55(v20, v16);
        _os_log_impl((void *)&_mh_execute_header, v44, (os_log_type_t)v58, "%s %s - %s loaded from cache", (uint8_t *)v48, 0x20u);
        v56 = v59;
        swift_arrayDestroy(v59, 3, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v56, -1, -1);
        swift_slowDealloc(v48, -1, -1);

        (*(void (**)(_BYTE *, uint64_t))(v63 + 8))(v60, v62);
      }
      else
      {

        v55 = *(void (**)(_BYTE *, uint64_t))(v17 + 8);
        v55(v20, v16);

        (*(void (**)(_BYTE *, uint64_t))(v63 + 8))(v12, v62);
      }
      sub_1000088D4((uint64_t)v22);

      v55(v22, v16);
    }
  }
  else
  {
    static PeopleLogger.messages.getter(0);
    v35 = v1;
    v36 = Logger.logObject.getter(v35);
    v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc(12, -1);
      v39 = swift_slowAlloc(32, -1);
      v65 = v39;
      *(_DWORD *)v38 = 136315138;
      v40 = *(_QWORD *)&v35[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
      v41 = *(_QWORD *)&v35[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
      swift_bridgeObjectRetain(v41);
      v64 = sub_10000608C(v40, v41, &v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65, v38 + 4, v38 + 12);

      swift_bridgeObjectRelease(v41);
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "%s expected an active converstation, confused!", v38, 0xCu);
      swift_arrayDestroy(v39, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v39, -1, -1);
      swift_slowDealloc(v38, -1, -1);

    }
    else
    {

    }
    (*(void (**)(_BYTE *, uint64_t))(v63 + 8))(v7, v62);
  }
}

uint64_t sub_10000AA7C@<X0>(void *a1@<X0>, char *a2@<X8>)
{
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;

  v47 = a2;
  v3 = type metadata accessor for Logger(0);
  v45 = *(_QWORD *)(v3 - 8);
  v46 = v3;
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v44 = (char *)&v41 - v7;
  v8 = sub_100003CB4(&qword_1000314C8);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v41 - v12;
  v14 = type metadata accessor for URL(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v43 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for PeopleURL.Parameter(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v20, enum case for PeopleURL.Parameter.requestID(_:), v17);
  v42 = sub_1000101F0((uint64_t)v20);
  v22 = v21;
  v23 = (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  if (!v22)
  {
    v28 = static PeopleLogger.messages.getter(v23);
    v29 = Logger.logObject.getter(v28);
    v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "conversation.requestID is nil", v31, 2u);
      swift_slowDealloc(v31, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v45 + 8))(v6, v46);
    goto LABEL_14;
  }
  v24 = objc_msgSend(a1, "selectedMessage");
  if (!v24)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
LABEL_11:
    swift_bridgeObjectRelease(v22);
    v32 = sub_100006C90((uint64_t)v13, &qword_1000314C8);
    v33 = v44;
    v34 = static PeopleLogger.messages.getter(v32);
    v35 = Logger.logObject.getter(v34);
    v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "message url is nil", v37, 2u);
      swift_slowDealloc(v37, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v45 + 8))(v33, v46);
LABEL_14:
    v38 = type metadata accessor for MessageDetails(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v47, 1, 1, v38);
  }
  v25 = v24;
  v26 = objc_msgSend(v24, "URL");

  if (v26)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v26);

    v27 = 0;
  }
  else
  {
    v27 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v11, v27, 1, v14);
  sub_100006DA0((uint64_t)v11, (uint64_t)v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
    goto LABEL_11;
  v40 = (uint64_t)v43;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v43, v13, v14);
  sub_10000F350(v40, v42, v22, v47);
  swift_bridgeObjectRelease(v22);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v40, v14);
}

id sub_10000AE88(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  NSString v23;
  objc_class *v24;
  id v25;
  objc_super v27;
  __int128 v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  uint64_t v32;
  void *v33;

  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t *)&v3[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
  v11 = v3;
  v12 = UUID.init()();
  v13 = UUID.uuidString.getter(v12);
  v15 = v14;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *v10 = v13;
  v10[1] = v15;
  v11[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_isBubbleActive] = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_bubble] = 0;
  v16 = &v11[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_eventNotifier];
  *(_OWORD *)v16 = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  *((_QWORD *)v16 + 4) = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_bubbleDelegate + 8] = 0;
  ((void (*)(void))swift_unknownObjectWeakInit)();
  v11[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_initialLoadError] = 0;
  v17 = &v11[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_cachedSizeInfo];
  *(_OWORD *)v17 = 0u;
  *((_OWORD *)v17 + 1) = 0u;
  v17[32] = 1;
  v18 = OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_messageDetailsLoader;
  if (qword_1000313B8 != -1)
    swift_once(&qword_1000313B8, sub_100013F70);
  v20 = *(_QWORD *)(qword_100032BB8 + 16);
  v19 = *(_QWORD *)(qword_100032BB8 + 24);
  v32 = type metadata accessor for MessageDetailsCache(0);
  v33 = &protocol witness table for MessageDetailsCache;
  *(_QWORD *)&v31 = v20;
  v29 = type metadata accessor for ResolvedFamilyCache(0);
  v30 = &protocol witness table for ResolvedFamilyCache;
  *(_QWORD *)&v28 = v19;
  v21 = type metadata accessor for MessageDetailsLoader();
  v22 = (_QWORD *)swift_allocObject(v21, 136, 7);
  v22[3] = 0;
  swift_unknownObjectWeakInit(v22 + 2, 0);
  v22[5] = 0;
  swift_unknownObjectWeakInit(v22 + 4, 0);
  v22[16] = 0;
  sub_10000E54C(&v31, (uint64_t)(v22 + 6));
  sub_10000E54C(&v28, (uint64_t)(v22 + 11));
  *(_QWORD *)&v11[v18] = v22;
  swift_retain(v20);
  swift_retain(v19);

  if (a2)
  {
    v23 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v23 = 0;
  }
  v24 = (objc_class *)type metadata accessor for RequestMessageViewController();
  v27.receiver = v11;
  v27.super_class = v24;
  v25 = objc_msgSendSuper2(&v27, "initWithNibName:bundle:", v23, a3);

  return v25;
}

id sub_10000B144(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  objc_class *v21;
  id v22;
  objc_super v24;
  __int128 v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  uint64_t v29;
  void *v30;

  v3 = type metadata accessor for UUID(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (uint64_t *)&v1[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
  v8 = v1;
  v9 = UUID.init()();
  v10 = UUID.uuidString.getter(v9);
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  *v7 = v10;
  v7[1] = v12;
  v8[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_isBubbleActive] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_bubble] = 0;
  v13 = &v8[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_eventNotifier];
  *(_OWORD *)v13 = 0u;
  *((_OWORD *)v13 + 1) = 0u;
  *((_QWORD *)v13 + 4) = 0;
  v14 = &v8[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_bubbleDelegate];
  *((_QWORD *)v14 + 1) = 0;
  swift_unknownObjectWeakInit(v14, 0);
  v8[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_initialLoadError] = 0;
  v15 = &v8[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_cachedSizeInfo];
  *(_OWORD *)v15 = 0u;
  *((_OWORD *)v15 + 1) = 0u;
  v15[32] = 1;
  v16 = OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_messageDetailsLoader;
  if (qword_1000313B8 != -1)
    swift_once(&qword_1000313B8, sub_100013F70);
  v18 = *(_QWORD *)(qword_100032BB8 + 16);
  v17 = *(_QWORD *)(qword_100032BB8 + 24);
  v29 = type metadata accessor for MessageDetailsCache(0);
  v30 = &protocol witness table for MessageDetailsCache;
  *(_QWORD *)&v28 = v18;
  v26 = type metadata accessor for ResolvedFamilyCache(0);
  v27 = &protocol witness table for ResolvedFamilyCache;
  *(_QWORD *)&v25 = v17;
  v19 = type metadata accessor for MessageDetailsLoader();
  v20 = (_QWORD *)swift_allocObject(v19, 136, 7);
  v20[3] = 0;
  swift_unknownObjectWeakInit(v20 + 2, 0);
  v20[5] = 0;
  swift_unknownObjectWeakInit(v20 + 4, 0);
  v20[16] = 0;
  sub_10000E54C(&v28, (uint64_t)(v20 + 6));
  sub_10000E54C(&v25, (uint64_t)(v20 + 11));
  *(_QWORD *)&v8[v16] = v20;
  swift_retain(v18);
  swift_retain(v17);

  v21 = (objc_class *)type metadata accessor for RequestMessageViewController();
  v24.receiver = v8;
  v24.super_class = v21;
  v22 = objc_msgSendSuper2(&v24, "initWithCoder:", a1);

  return v22;
}

id sub_10000B38C(char a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  objc_class *v21;
  objc_super v23;
  __int128 v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  uint64_t v28;
  void *v29;

  v3 = type metadata accessor for UUID(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (uint64_t *)&v1[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
  v8 = v1;
  v9 = UUID.init()();
  v10 = UUID.uuidString.getter(v9);
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  *v7 = v10;
  v7[1] = v12;
  v8[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_isBubbleActive] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_bubble] = 0;
  v13 = &v8[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_eventNotifier];
  *(_OWORD *)v13 = 0u;
  *((_OWORD *)v13 + 1) = 0u;
  *((_QWORD *)v13 + 4) = 0;
  v14 = &v8[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_bubbleDelegate];
  *((_QWORD *)v14 + 1) = 0;
  swift_unknownObjectWeakInit(v14, 0);
  v8[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_initialLoadError] = 0;
  v15 = &v8[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_cachedSizeInfo];
  *(_OWORD *)v15 = 0u;
  *((_OWORD *)v15 + 1) = 0u;
  v15[32] = 1;
  v16 = OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_messageDetailsLoader;
  if (qword_1000313B8 != -1)
    swift_once(&qword_1000313B8, sub_100013F70);
  v18 = *(_QWORD *)(qword_100032BB8 + 16);
  v17 = *(_QWORD *)(qword_100032BB8 + 24);
  v28 = type metadata accessor for MessageDetailsCache(0);
  v29 = &protocol witness table for MessageDetailsCache;
  *(_QWORD *)&v27 = v18;
  v25 = type metadata accessor for ResolvedFamilyCache(0);
  v26 = &protocol witness table for ResolvedFamilyCache;
  *(_QWORD *)&v24 = v17;
  v19 = type metadata accessor for MessageDetailsLoader();
  v20 = (_QWORD *)swift_allocObject(v19, 136, 7);
  v20[3] = 0;
  swift_unknownObjectWeakInit(v20 + 2, 0);
  v20[5] = 0;
  swift_unknownObjectWeakInit(v20 + 4, 0);
  v20[16] = 0;
  sub_10000E54C(&v27, (uint64_t)(v20 + 6));
  sub_10000E54C(&v24, (uint64_t)(v20 + 11));
  *(_QWORD *)&v8[v16] = v20;
  swift_retain(v18);
  swift_retain(v17);

  v21 = (objc_class *)type metadata accessor for RequestMessageViewController();
  v23.receiver = v8;
  v23.super_class = v21;
  return objc_msgSendSuper2(&v23, "initWithShouldBeSheetPresentationControllerDelegate:", a1 & 1);
}

uint64_t type metadata accessor for RequestMessageViewController()
{
  return objc_opt_self(_TtC22PeopleMessagesAskToBuy28RequestMessageViewController);
}

uint64_t sub_10000B5E8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1[4] = v0;
  v2 = type metadata accessor for Logger(0);
  v1[5] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[6] = v3;
  v4 = (*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[7] = swift_task_alloc(v4);
  v1[8] = swift_task_alloc(v4);
  v5 = type metadata accessor for MainActor(0);
  v1[9] = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v1[10] = v6;
  v1[11] = v7;
  return swift_task_switch(sub_10000B68C, v6, v7);
}

uint64_t sub_10000B68C()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint8_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  os_log_type_t type;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v1 = *(void **)(v0 + 32);
  if (*((_BYTE *)v1 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_isBubbleActive) == 1)
  {
    v2 = objc_msgSend(*(id *)(v0 + 32), "activeConversation");
    *(_QWORD *)(v0 + 96) = v2;
    if (v2)
    {
      v3 = (uint64_t)v2;
      v4 = (_QWORD *)swift_task_alloc(dword_1000316DC);
      *(_QWORD *)(v0 + 104) = v4;
      *v4 = v0;
      v4[1] = sub_10000BA4C;
      return sub_1000091E4(v3);
    }
    v18 = *(void **)(v0 + 32);
    v19 = swift_release(*(_QWORD *)(v0 + 72));
    static PeopleLogger.messages.getter(v19);
    v20 = Logger.logObject.getter(v18);
    v21 = static os_log_type_t.error.getter();
    v22 = os_log_type_enabled(v20, v21);
    v23 = *(_QWORD *)(v0 + 64);
    v24 = *(_QWORD *)(v0 + 40);
    v25 = *(_QWORD *)(v0 + 48);
    v26 = *(char **)(v0 + 32);
    if (v22)
    {
      v36 = *(_QWORD *)(v0 + 64);
      v34 = *(_QWORD *)(v0 + 48);
      v27 = (uint8_t *)swift_slowAlloc(12, -1);
      type = v21;
      v28 = swift_slowAlloc(32, -1);
      v37 = v28;
      *(_DWORD *)v27 = 136315138;
      v30 = *(_QWORD *)&v26[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
      v29 = *(_QWORD *)&v26[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
      swift_bridgeObjectRetain(v29);
      *(_QWORD *)(v0 + 24) = sub_10000608C(v30, v29, &v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v27 + 4, v27 + 12);
      swift_bridgeObjectRelease(v29);

      _os_log_impl((void *)&_mh_execute_header, v20, type, "%s conversation is nil", v27, 0xCu);
      swift_arrayDestroy(v28, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v28, -1, -1);
      swift_slowDealloc(v27, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v36, v24);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
    }
  }
  else
  {
    v6 = swift_release(*(_QWORD *)(v0 + 72));
    static PeopleLogger.messages.getter(v6);
    v7 = Logger.logObject.getter(v1);
    v8 = static os_log_type_t.debug.getter();
    v9 = os_log_type_enabled(v7, v8);
    v11 = *(_QWORD *)(v0 + 48);
    v10 = *(_QWORD *)(v0 + 56);
    v12 = *(char **)(v0 + 32);
    v13 = *(_QWORD *)(v0 + 40);
    if (v9)
    {
      v35 = *(_QWORD *)(v0 + 56);
      v14 = (uint8_t *)swift_slowAlloc(12, -1);
      v33 = v13;
      v15 = swift_slowAlloc(32, -1);
      v37 = v15;
      *(_DWORD *)v14 = 136315138;
      v16 = *(_QWORD *)&v12[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
      v17 = *(_QWORD *)&v12[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
      swift_bridgeObjectRetain(v17);
      *(_QWORD *)(v0 + 16) = sub_10000608C(v16, v17, &v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v14 + 4, v14 + 12);
      swift_bridgeObjectRelease(v17);

      _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s has been deactivated prior to notify!", v14, 0xCu);
      swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v15, -1, -1);
      swift_slowDealloc(v14, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v35, v33);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v13);
    }
  }
  v31 = *(_QWORD *)(v0 + 56);
  swift_task_dealloc(*(_QWORD *)(v0 + 64));
  swift_task_dealloc(v31);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000BA4C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 104));
  return swift_task_switch(sub_10000BA98, *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88));
}

uint64_t sub_10000BA98()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 96);
  swift_release(*(_QWORD *)(v0 + 72));

  v2 = *(_QWORD *)(v0 + 56);
  swift_task_dealloc(*(_QWORD *)(v0 + 64));
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000BAE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4[3] = a4;
  v5 = type metadata accessor for Logger(0);
  v4[4] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[5] = v6;
  v4[6] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MainActor(0);
  v4[7] = static MainActor.shared.getter(v7);
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  v4[8] = v8;
  v4[9] = v9;
  return swift_task_switch(sub_10000BB74, v8, v9);
}

uint64_t sub_10000BB74(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  os_log_type_t v4;
  char *v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = *(void **)(v1 + 24);
  static PeopleLogger.messages.getter(a1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(char **)(v1 + 24);
    v17 = *(_QWORD *)(v1 + 32);
    v18 = *(_QWORD *)(v1 + 48);
    v15 = v5;
    v16 = *(_QWORD *)(v1 + 40);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v19 = v7;
    *(_DWORD *)v6 = 136315138;
    v8 = *(_QWORD *)&v5[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
    v9 = *(_QWORD *)&v5[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
    swift_bridgeObjectRetain(v9);
    *(_QWORD *)(v1 + 16) = sub_10000608C(v8, v9, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 16, v1 + 24, v6 + 4, v6 + 12);
    swift_bridgeObjectRelease(v9);

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s responding to event notify)", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v18, v17);
  }
  else
  {
    v11 = *(_QWORD *)(v1 + 40);
    v10 = *(_QWORD *)(v1 + 48);
    v12 = *(_QWORD *)(v1 + 32);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  v13 = (_QWORD *)swift_task_alloc(dword_1000316F4);
  *(_QWORD *)(v1 + 80) = v13;
  *v13 = v1;
  v13[1] = sub_10000BD48;
  return sub_10000B5E8();
}

uint64_t sub_10000BD48()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 80));
  return swift_task_switch(sub_10000BD94, *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72));
}

uint64_t sub_10000BD94()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_release(*(_QWORD *)(v0 + 56));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000BDCC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;

  v1 = sub_100003CB4(&qword_1000314A8);
  v2 = __chkstk_darwin(v1);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static TaskPriority.userInitiated.getter(v2);
  v5 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 0, 1, v5);
  type metadata accessor for MainActor(0);
  v6 = v0;
  v7 = static MainActor.shared.getter();
  v8 = (_QWORD *)swift_allocObject(&unk_10002D400, 40, 7);
  v8[2] = v7;
  v8[3] = &protocol witness table for MainActor;
  v8[4] = v6;
  v9 = sub_100004258((uint64_t)v4, (uint64_t)&unk_1000316E8, (uint64_t)v8);
  return swift_release(v9);
}

uint64_t sub_10000BEB0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2[6] = a1;
  v2[7] = v1;
  v3 = type metadata accessor for Logger(0);
  v2[8] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[9] = v4;
  v2[10] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL(0);
  v2[11] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[12] = v6;
  v7 = *(_QWORD *)(v6 + 64);
  v2[13] = v7;
  v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[14] = swift_task_alloc(v8);
  v2[15] = swift_task_alloc(v8);
  v9 = sub_100003CB4(&qword_1000314A8);
  v2[16] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for MainActor(0);
  v2[17] = v10;
  v2[18] = static MainActor.shared.getter(v10);
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  v2[19] = v11;
  v2[20] = v12;
  return swift_task_switch(sub_10000BFA8, v11, v12);
}

uint64_t sub_10000BFA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  os_log_type_t type;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v1 = static AMSBagHelper.isTrustedDomain(for:)(*(_QWORD *)(v0 + 48));
  if ((v1 & 1) != 0)
  {
    v2 = *(_QWORD *)(v0 + 128);
    v3 = *(_QWORD *)(v0 + 120);
    v5 = *(_QWORD *)(v0 + 96);
    v4 = *(_QWORD *)(v0 + 104);
    v6 = *(_QWORD *)(v0 + 88);
    v7 = *(_QWORD *)(v0 + 48);
    v8 = *(void **)(v0 + 56);
    static TaskPriority.userInitiated.getter(v1);
    v9 = type metadata accessor for TaskPriority(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v2, 0, 1, v9);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v7, v6);
    v10 = v8;
    v11 = static MainActor.shared.getter(v10);
    v12 = *(unsigned __int8 *)(v5 + 80);
    v13 = (v12 + 40) & ~v12;
    v14 = (char *)swift_allocObject(&unk_10002D428, v13 + v4, v12 | 7);
    *((_QWORD *)v14 + 2) = v11;
    *((_QWORD *)v14 + 3) = &protocol witness table for MainActor;
    *((_QWORD *)v14 + 4) = v10;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(&v14[v13], v3, v6);
    v15 = sub_1000043A4(v2, (uint64_t)&unk_100031770, (uint64_t)v14);
    *(_QWORD *)(v0 + 168) = v15;
    v16 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to Task<>.value.getter + 1));
    *(_QWORD *)(v0 + 176) = v16;
    v17 = sub_100003CB4(&qword_100031610);
    *v16 = v0;
    v16[1] = sub_10000C384;
    return Task<>.value.getter(v0 + 16, v15, v17);
  }
  else
  {
    v19 = *(_QWORD *)(v0 + 112);
    v20 = *(_QWORD *)(v0 + 88);
    v21 = *(_QWORD *)(v0 + 96);
    v22 = *(_QWORD *)(v0 + 48);
    v23 = *(void **)(v0 + 56);
    v24 = swift_release(*(_QWORD *)(v0 + 144));
    static PeopleLogger.messages.getter(v24);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v19, v22, v20);
    v25 = Logger.logObject.getter(v23);
    v26 = static os_log_type_t.error.getter();
    v27 = os_log_type_enabled(v25, v26);
    v28 = *(_QWORD *)(v0 + 112);
    v29 = *(_QWORD *)(v0 + 88);
    v49 = *(_QWORD *)(v0 + 96);
    v31 = *(_QWORD *)(v0 + 72);
    v30 = *(_QWORD *)(v0 + 80);
    v33 = *(char **)(v0 + 56);
    v32 = *(_QWORD *)(v0 + 64);
    if (v27)
    {
      v48 = *(_QWORD *)(v0 + 72);
      v44 = *(_QWORD *)(v0 + 112);
      v34 = swift_slowAlloc(22, -1);
      v46 = swift_slowAlloc(64, -1);
      v50 = v46;
      *(_DWORD *)v34 = 136315394;
      type = v26;
      v47 = v30;
      v36 = *(_QWORD *)&v33[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
      v35 = *(_QWORD *)&v33[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
      swift_bridgeObjectRetain(v35);
      *(_QWORD *)(v0 + 32) = sub_10000608C(v36, v35, &v50);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v34 + 4, v34 + 12);
      swift_bridgeObjectRelease(v35);

      *(_WORD *)(v34 + 12) = 2080;
      v37 = sub_100006CE4((unint64_t *)&qword_100031640, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v38 = dispatch thunk of CustomStringConvertible.description.getter(v29, v37);
      v40 = v39;
      *(_QWORD *)(v0 + 40) = sub_10000608C(v38, v39, &v50);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v34 + 14, v34 + 22);
      swift_bridgeObjectRelease(v40);
      (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v44, v29);
      _os_log_impl((void *)&_mh_execute_header, v25, type, "%s - %s not in trusted list", (uint8_t *)v34, 0x16u);
      swift_arrayDestroy(v46, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v46, -1, -1);
      swift_slowDealloc(v34, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v32);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v28, v29);
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
    }
    v41 = *(_QWORD *)(v0 + 120);
    v42 = *(_QWORD *)(v0 + 112);
    v43 = *(_QWORD *)(v0 + 80);
    swift_task_dealloc(*(_QWORD *)(v0 + 128));
    swift_task_dealloc(v41);
    swift_task_dealloc(v42);
    swift_task_dealloc(v43);
    return (*(uint64_t (**)(_QWORD, unint64_t))(v0 + 8))(0, 0xF000000000000000);
  }
}

uint64_t sub_10000C384()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 176));
  return swift_task_switch(sub_10000C3D0, *(_QWORD *)(v1 + 152), *(_QWORD *)(v1 + 160));
}

uint64_t sub_10000C3D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 144);
  swift_release(*(_QWORD *)(v0 + 168));
  swift_release(v1);
  v3 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v4 = *(_QWORD *)(v0 + 120);
  v5 = *(_QWORD *)(v0 + 112);
  v6 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 128));
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v3, v2);
}

uint64_t sub_10000C450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5[5] = a4;
  v5[6] = a5;
  v5[4] = a1;
  v6 = type metadata accessor for URL(0);
  v5[7] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[8] = v7;
  v5[9] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Logger(0);
  v5[10] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v5[11] = v9;
  v5[12] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for MainActor(0);
  v5[13] = static MainActor.shared.getter(v10);
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000C510, v11, v12);
}

uint64_t sub_10000C510()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36[2];

  v2 = *(_QWORD *)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v5 = *(void **)(v0 + 40);
  v6 = swift_release(*(_QWORD *)(v0 + 104));
  static PeopleLogger.messages.getter(v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v7 = Logger.logObject.getter(v5);
  v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = *(_QWORD *)(v0 + 72);
    v34 = *(_QWORD *)(v0 + 80);
    v35 = *(_QWORD *)(v0 + 96);
    v31 = *(_QWORD *)(v0 + 64);
    v32 = *(_QWORD *)(v0 + 56);
    v33 = *(_QWORD *)(v0 + 88);
    v10 = *(char **)(v0 + 40);
    v11 = swift_slowAlloc(22, -1);
    v12 = swift_slowAlloc(64, -1);
    v36[0] = v12;
    *(_DWORD *)v11 = 136315394;
    v14 = *(_QWORD *)&v10[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
    v13 = *(_QWORD *)&v10[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
    swift_bridgeObjectRetain(v13);
    *(_QWORD *)(v0 + 16) = sub_10000608C(v14, v13, v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease(v13);

    *(_WORD *)(v11 + 12) = 2080;
    v16 = URL.absoluteString.getter(v15);
    v18 = v17;
    *(_QWORD *)(v0 + 24) = sub_10000608C(v16, v17, v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v11 + 14, v11 + 22);
    swift_bridgeObjectRelease(v18);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v9, v32);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s - Fetching %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy(v12, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v35, v34);
  }
  else
  {
    v20 = *(_QWORD *)(v0 + 88);
    v19 = *(_QWORD *)(v0 + 96);
    v22 = *(_QWORD *)(v0 + 72);
    v21 = *(_QWORD *)(v0 + 80);
    v23 = *(_QWORD *)(v0 + 56);
    v24 = *(_QWORD *)(v0 + 64);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  v25 = Data.init(contentsOf:options:)(*(_QWORD *)(v0 + 48), 0);
  v26 = *(_QWORD *)(v0 + 96);
  v27 = *(_QWORD *)(v0 + 72);
  v28 = *(uint64_t **)(v0 + 32);
  *v28 = v25;
  v28[1] = v29;
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000C78C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t PartyApps;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  PartyApps = type metadata accessor for FirstPartyApps(0);
  v3[5] = PartyApps;
  v5 = *(_QWORD *)(PartyApps - 8);
  v3[6] = v5;
  v3[7] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100003CB4(&qword_1000314C8);
  v3[8] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for URL(0);
  v3[9] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[10] = v8;
  v3[11] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MainActor(0);
  v3[12] = static MainActor.shared.getter(v9);
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v9, &protocol witness table for MainActor);
  v3[13] = v10;
  v3[14] = v11;
  return swift_task_switch(sub_10000C870, v10, v11);
}

uint64_t sub_10000C870()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
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
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = type metadata accessor for MessageDetails(0);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(v1, v2, v3);
  v5 = MessageDetails.bundleId.getter(v4);
  if (!v6)
    v5 = MessageDetails.requestID.getter(v5);
  v7 = v5;
  v8 = v6;
  *(_QWORD *)(v0 + 120) = v5;
  *(_QWORD *)(v0 + 128) = v6;
  v9 = MessageDetails.thumbnailData.getter(v5);
  v11 = v10;
  v12 = sub_10000E320(v9, v10);
  if (v11 >> 60 == 15)
  {
    if (qword_1000312C8 != -1)
      swift_once(&qword_1000312C8, sub_1000037EC);
    v12 = ImageCache.getFromCache(_:)(v7, v8);
    if (v13 >> 60 != 15)
      v12 = MessageDetails.thumbnailData.setter(v12, v13);
  }
  v14 = MessageDetails.thumbnailData.getter(v12);
  v16 = v15;
  v17 = sub_10000E320(v14, v15);
  if (v16 >> 60 == 15)
  {
    v17 = MessageDetails.thumbnailPath.getter(v17);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)(v0 + 72);
      v21 = *(_QWORD *)(v0 + 80);
      v22 = *(_QWORD *)(v0 + 64);
      URL.init(string:)(v17);
      swift_bridgeObjectRelease(v19);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v22, 1, v20) != 1)
      {
        (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 32))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
        v39 = (_QWORD *)swift_task_alloc(dword_100031764);
        *(_QWORD *)(v0 + 136) = v39;
        *v39 = v0;
        v39[1] = sub_10000CB00;
        return sub_10000BEB0(*(_QWORD *)(v0 + 88));
      }
      v17 = sub_100006C90(*(_QWORD *)(v0 + 64), &qword_1000314C8);
    }
  }
  v23 = MessageDetails.thumbnailData.getter(v17);
  v25 = v24;
  v26 = sub_10000E320(v23, v24);
  if (v25 >> 60 == 15 && (v27 = MessageDetails.bundleId.getter(v26), (*(_QWORD *)(v0 + 160) = v28) != 0))
  {
    v29 = v27;
    v30 = v28;
    v32 = *(_QWORD *)(v0 + 48);
    v31 = *(_QWORD *)(v0 + 56);
    v33 = *(_QWORD *)(v0 + 40);
    type metadata accessor for AppBundleResolver(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v32 + 104))(v31, enum case for FirstPartyApps.none(_:), v33);
    v34 = (_QWORD *)swift_task_alloc(async function pointer to static AppBundleResolver.resolveThumbnail(_:_:)[1]);
    *(_QWORD *)(v0 + 168) = v34;
    *v34 = v0;
    v34[1] = sub_10000CD1C;
    return static AppBundleResolver.resolveThumbnail(_:_:)(v29, v30, *(_QWORD *)(v0 + 56));
  }
  else
  {
    v36 = *(_QWORD *)(v0 + 128);
    swift_release(*(_QWORD *)(v0 + 96));
    swift_bridgeObjectRelease(v36);
    v37 = *(_QWORD *)(v0 + 56);
    v38 = *(_QWORD *)(v0 + 64);
    swift_task_dealloc(*(_QWORD *)(v0 + 88));
    swift_task_dealloc(v38);
    swift_task_dealloc(v37);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_10000CB00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = *(_QWORD **)v2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 136);
  v3[18] = a1;
  v3[19] = a2;
  swift_task_dealloc(v4);
  return swift_task_switch(sub_10000CB58, v3[13], v3[14]);
}

uint64_t sub_10000CB58()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  _QWORD *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = *(_QWORD *)(v0 + 152);
  if (v1 >> 60 == 15)
  {
    v2 = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 144);
    sub_1000062B8(v3, *(_QWORD *)(v0 + 152));
    MessageDetails.thumbnailData.setter(v3, v1);
    if (qword_1000312C8 != -1)
      swift_once(&qword_1000312C8, sub_1000037EC);
    v5 = *(_QWORD *)(v0 + 144);
    v4 = *(_QWORD *)(v0 + 152);
    v7 = *(_QWORD *)(v0 + 80);
    v6 = *(_QWORD *)(v0 + 88);
    v8 = *(_QWORD *)(v0 + 72);
    ImageCache.addToCache(_:image:)(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 128), v5, v4);
    sub_10000E320(v5, v4);
    v2 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }
  v9 = MessageDetails.thumbnailData.getter(v2);
  v11 = v10;
  v12 = sub_10000E320(v9, v10);
  if (v11 >> 60 == 15 && (v13 = MessageDetails.bundleId.getter(v12), (*(_QWORD *)(v0 + 160) = v14) != 0))
  {
    v15 = v13;
    v16 = v14;
    v18 = *(_QWORD *)(v0 + 48);
    v17 = *(_QWORD *)(v0 + 56);
    v19 = *(_QWORD *)(v0 + 40);
    type metadata accessor for AppBundleResolver(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 104))(v17, enum case for FirstPartyApps.none(_:), v19);
    v20 = (_QWORD *)swift_task_alloc(async function pointer to static AppBundleResolver.resolveThumbnail(_:_:)[1]);
    *(_QWORD *)(v0 + 168) = v20;
    *v20 = v0;
    v20[1] = sub_10000CD1C;
    return static AppBundleResolver.resolveThumbnail(_:_:)(v15, v16, *(_QWORD *)(v0 + 56));
  }
  else
  {
    v22 = *(_QWORD *)(v0 + 128);
    swift_release(*(_QWORD *)(v0 + 96));
    swift_bridgeObjectRelease(v22);
    v23 = *(_QWORD *)(v0 + 56);
    v24 = *(_QWORD *)(v0 + 64);
    swift_task_dealloc(*(_QWORD *)(v0 + 88));
    swift_task_dealloc(v24);
    swift_task_dealloc(v23);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_10000CD1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 160);
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 168);
  v7 = *(_QWORD *)(*(_QWORD *)v2 + 48);
  v6 = *(_QWORD *)(*(_QWORD *)v2 + 56);
  v8 = *(_QWORD *)(*(_QWORD *)v2 + 40);
  v3[22] = a1;
  v3[23] = a2;
  swift_task_dealloc(v4);
  swift_bridgeObjectRelease(v5);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  return swift_task_switch(sub_10000CDA4, v3[13], v3[14]);
}

uint64_t sub_10000CDA4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 184);
  swift_release(*(_QWORD *)(v0 + 96));
  if (v1 >> 60 == 15)
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 128));
    if (qword_1000312D0 != -1)
      swift_once(&qword_1000312D0, sub_100007198);
    v2 = qword_100032A88;
    v3 = qword_100032A90;
    sub_10000E334(qword_100032A88, qword_100032A90);
    MessageDetails.thumbnailData.setter(v2, v3);
  }
  else
  {
    sub_1000062B8(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 184));
    if (qword_1000312C8 != -1)
      swift_once(&qword_1000312C8, sub_1000037EC);
    v5 = *(_QWORD *)(v0 + 176);
    v4 = *(_QWORD *)(v0 + 184);
    v6 = *(_QWORD *)(v0 + 128);
    ImageCache.addToCache(_:image:)(*(_QWORD *)(v0 + 120), v6, v5, v4);
    swift_bridgeObjectRelease(v6);
    MessageDetails.thumbnailData.setter(v5, v4);
    sub_10000E320(v5, v4);
  }
  v7 = *(_QWORD *)(v0 + 56);
  v8 = *(_QWORD *)(v0 + 64);
  swift_task_dealloc(*(_QWORD *)(v0 + 88));
  swift_task_dealloc(v8);
  swift_task_dealloc(v7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10000CEE8(void *a1)
{
  char *v1;
  char *v2;
  _QWORD *v4;
  void (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  char *v17;
  uint64_t Strong;
  uint64_t v19;
  uint64_t v20;
  uint64_t ObjectType;
  id v22;
  char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t inited;
  void *v42;
  NSString v43;
  Class isa;
  uint64_t v45;
  unint64_t v46;
  Class v47;
  id v48;
  uint64_t v49;
  NSString v50;
  unint64_t v51;
  Class v52;
  uint64_t v53;
  void *v54;
  unint64_t v55;
  Class v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  Class v60;
  id v61;
  uint8_t *v62;
  id v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  __int128 v68;
  id v69;
  unint64_t v70;
  uint8_t *v71;
  void (**v72)(_QWORD, _QWORD);
  id v73;
  _BYTE v74[80];
  uint64_t v75;
  uint64_t v76;
  uint64_t v77[2];

  v2 = v1;
  v4 = (_QWORD *)type metadata accessor for Logger(0);
  v5 = (void (**)(_QWORD, _QWORD))*(v4 - 1);
  __chkstk_darwin(v4);
  v7 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(a1, "view");
  if (!v8)
    goto LABEL_7;
  v9 = v8;
  v10 = objc_msgSend(v2, "view");
  if (!v10)
  {

LABEL_7:
    static PeopleLogger.messages.getter(v8);
    v23 = v2;
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc(12, -1);
      v27 = swift_slowAlloc(32, -1);
      v77[0] = v27;
      v72 = v5;
      v73 = v4;
      *(_DWORD *)v26 = 136315138;
      v71 = v26 + 4;
      v28 = *(_QWORD *)&v23[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
      v29 = *(_QWORD *)&v23[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
      swift_bridgeObjectRetain(v29);
      v76 = sub_10000608C(v28, v29, v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, v77, v71, v26 + 12);

      swift_bridgeObjectRelease(v29);
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "%s missing views", v26, 0xCu);
      swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v27, -1, -1);
      swift_slowDealloc(v26, -1, -1);

      ((void (**)(char *, id))v72)[1](v7, v73);
    }
    else
    {

      ((void (**)(char *, _QWORD *))v5)[1](v7, v4);
    }
    return;
  }
  v11 = (void (**)(_QWORD, _QWORD))v10;
  v12 = objc_msgSend(v2, "childViewControllers");
  v13 = sub_10000E258(0, &qword_100031718, UIViewController_ptr);
  v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v12, v13);

  sub_10000E140(v14);
  swift_bridgeObjectRelease(v14);
  objc_msgSend(v2, "addChildViewController:", a1);
  v15 = objc_msgSend(v2, "view");
  if (v15)
  {
    v16 = v15;
    v72 = v11;
    v73 = a1;
    v17 = &v2[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_bubbleDelegate];
    Strong = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_bubbleDelegate]);
    if (Strong)
    {
      v19 = Strong;
      v20 = *((_QWORD *)v17 + 1);
      ObjectType = swift_getObjectType(Strong);
      v22 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(v20 + 16))(ObjectType, v20);
      swift_unknownObjectRelease(v19);
    }
    else
    {
      v22 = objc_msgSend((id)objc_opt_self(UIColor), "redColor");
    }
    objc_msgSend(v16, "setBackgroundColor:", v22);

    objc_msgSend(v2, "_balloonMaskEdgeInsets");
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v38 = objc_msgSend(v2, "view");
    v71 = (uint8_t *)v2;
    if (v38)
    {
      v39 = v38;
      objc_msgSend(v38, "insertSubview:atIndex:", v9, 0);

      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v40 = (void *)sub_100003CB4(&qword_100031720);
      v69 = v40;
      inited = swift_initStackObject(v40, &v75);
      *(_OWORD *)(inited + 16) = xmmword_100025490;
      *(_QWORD *)(inited + 32) = 1952867692;
      *(_QWORD *)(inited + 40) = 0xE400000000000000;
      *(_QWORD *)(inited + 48) = v33;
      *(_QWORD *)(inited + 72) = &type metadata for CGFloat;
      *(_QWORD *)(inited + 80) = 0x7468676972;
      *(_QWORD *)(inited + 88) = 0xE500000000000000;
      *(_QWORD *)(inited + 96) = v37;
      *(_QWORD *)(inited + 120) = &type metadata for CGFloat;
      *(_QWORD *)(inited + 128) = 7368564;
      *(_QWORD *)(inited + 136) = 0xE300000000000000;
      *(_QWORD *)(inited + 144) = v31;
      *(_QWORD *)(inited + 168) = &type metadata for CGFloat;
      *(_QWORD *)(inited + 176) = 0x6D6F74746F62;
      *(_QWORD *)(inited + 184) = 0xE600000000000000;
      *(_QWORD *)(inited + 216) = &type metadata for CGFloat;
      *(_QWORD *)(inited + 192) = v35;
      v70 = sub_10001B5DC(inited);
      v77[0] = (uint64_t)&_swiftEmptyArrayStorage;
      v42 = (void *)objc_opt_self(NSLayoutConstraint);
      v66 = v42;
      swift_bridgeObjectRetain(&off_100023DD0);
      v43 = String._bridgeToObjectiveC()();
      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      v45 = swift_initStackObject(v40, v74);
      v68 = xmmword_100025400;
      *(_OWORD *)(v45 + 16) = xmmword_100025400;
      *(_QWORD *)(v45 + 32) = 2003134838;
      *(_QWORD *)(v45 + 40) = 0xE400000000000000;
      v67 = sub_10000E258(0, &qword_100031728, UIView_ptr);
      *(_QWORD *)(v45 + 72) = v67;
      *(_QWORD *)(v45 + 48) = v9;
      v65 = v9;
      v46 = sub_10001B5DC(v45);
      v47 = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v46);
      v48 = objc_msgSend(v42, "constraintsWithVisualFormat:options:metrics:views:", v43, 0, isa, v47);

      v64 = sub_10000E258(0, &qword_100031730, NSLayoutConstraint_ptr);
      v49 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v48, v64);
      swift_bridgeObjectRelease(&off_100023DD0);

      sub_10000D76C(v49);
      swift_bridgeObjectRetain("H:|-(left)-[view]-(right)-|");
      v50 = String._bridgeToObjectiveC()();
      v51 = v70;
      v52 = Dictionary._bridgeToObjectiveC()().super.isa;
      v53 = swift_initStackObject(v69, v74);
      *(_OWORD *)(v53 + 16) = v68;
      *(_QWORD *)(v53 + 32) = 2003134838;
      *(_QWORD *)(v53 + 72) = v67;
      v54 = v65;
      *(_QWORD *)(v53 + 40) = 0xE400000000000000;
      *(_QWORD *)(v53 + 48) = v54;
      v69 = v54;
      v55 = sub_10001B5DC(v53);
      v56 = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v55);
      v57 = objc_msgSend(v66, "constraintsWithVisualFormat:options:metrics:views:", v50, 0, v52, v56);

      v58 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v57, v64);
      swift_bridgeObjectRelease("H:|-(left)-[view]-(right)-|");

      sub_10000D76C(v58);
      swift_bridgeObjectRelease(v51);
      v59 = v77[0];
      v60 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v59);
      v61 = v72;
      objc_msgSend(v72, "addConstraints:", v60);

      v62 = v71;
      objc_msgSend(v73, "didMoveToParentViewController:", v71);
      v63 = v69;
      objc_msgSend(v69, "setMinimumContentSizeCategory:", UIContentSizeCategorySmall);
      objc_msgSend(v63, "setMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityExtraLarge);
      -[uint8_t requestResize](v62, "requestResize");

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_10000D6D4()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000D700(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_1000316E4);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_100006F00;
  return sub_10000BAE0(a1, v4, v5, v6);
}

uint64_t sub_10000D76C(uint64_t a1)
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
    result = sub_10000D924(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
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

uint64_t sub_10000D924(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t i;
  void (*v15)(_QWORD *);
  id *v16;
  id v17;
  uint64_t v18;
  uint64_t result;
  void (*v20[4])(id *);

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v18 = a3;
    else
      v18 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v18);
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
      v12 = a3;
    else
      v12 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v13 = _CocoaArrayWrapper.endIndex.getter(v12);
    swift_bridgeObjectRelease(a3);
    if (v13 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10000E290();
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_100003CB4(&qword_100031738);
          v15 = sub_10000DB2C(v20, i, a3);
          v17 = *v16;
          ((void (*)(void (**)(id *), _QWORD))v15)(v20, 0);
          *(_QWORD *)(a1 + 8 * i) = v17;
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
  v10 = v8 + 32;
  if (v8 + 32 >= a1 + 8 * v9 || v10 + 8 * v9 <= a1)
  {
    v11 = sub_10000E258(0, &qword_100031730, NSLayoutConstraint_ptr);
    swift_arrayInitWithCopy(a1, v10, v9, v11);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

void (*sub_10000DB2C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_10000DBAC(v6, a2, a3);
  return sub_10000DB80;
}

void sub_10000DB80(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_10000DBAC(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
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
    return sub_10000DC18;
  }
  __break(1u);
  return result;
}

void sub_10000DC18(id *a1)
{

}

uint64_t sub_10000DC20(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  objc_super v17;

  v2 = v1;
  v4 = type metadata accessor for PeopleURL.Parameter(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for RequestMessageViewController();
  v17.receiver = v2;
  v17.super_class = v8;
  objc_msgSendSuper2(&v17, "setActiveConversation:", a1);
  v9 = objc_msgSend(v2, "activeConversation");
  if (!v9
    || (v10 = v9,
        (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for PeopleURL.Parameter.requestID(_:), v4), v11 = sub_1000101F0((uint64_t)v7), v13 = v12, (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4), v10, !v13))
  {
    swift_bridgeObjectRelease(0);
    v11 = 0;
    v13 = 0xE000000000000000;
  }
  v14 = (uint64_t *)&v2[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
  v15 = *(_QWORD *)&v2[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
  *v14 = v11;
  v14[1] = v13;
  return swift_bridgeObjectRelease(v15);
}

uint64_t sub_10000DD44(uint64_t a1)
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  char v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  void (*v42)(char *, uint64_t);
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;

  v2 = sub_100003CB4(&qword_100031748);
  __chkstk_darwin(v2);
  v48 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_100003CB4(&qword_100031630);
  v47 = *(_QWORD *)(v50 - 8);
  __chkstk_darwin(v50);
  v46 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Date(0);
  v52 = *(_QWORD *)(v5 - 8);
  v53 = v5;
  v6 = __chkstk_darwin(v5);
  v45 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v6);
  v51 = (char *)&v44 - v9;
  __chkstk_darwin(v8);
  v49 = (char *)&v44 - v10;
  v11 = type metadata accessor for MessageDetails.EventStatus(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v44 - v16;
  v18 = sub_100003CB4(&qword_100031710);
  __chkstk_darwin(v18);
  v20 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for MessageDetails(0);
  v22 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v24 = (char *)&v44 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E458(a1, (uint64_t)v20, &qword_100031710);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
  {
    sub_100006C90((uint64_t)v20, &qword_100031710);
LABEL_5:
    v30 = 1;
    return v30 & 1;
  }
  v25 = (*(uint64_t (**)(char *, char *, uint64_t))(v22 + 32))(v24, v20, v21);
  MessageDetails.status.getter(v25);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v15, enum case for MessageDetails.EventStatus.purged(_:), v11);
  v26 = sub_100006CE4(&qword_100031750, (uint64_t (*)(uint64_t))&type metadata accessor for MessageDetails.EventStatus, (uint64_t)&protocol conformance descriptor for MessageDetails.EventStatus);
  v27 = dispatch thunk of static Equatable.== infix(_:_:)(v17, v15, v11, v26);
  v28 = *(void (**)(char *, uint64_t))(v12 + 8);
  v28(v15, v11);
  v29 = ((uint64_t (*)(char *, uint64_t))v28)(v17, v11);
  if ((v27 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
    goto LABEL_5;
  }
  v31 = v49;
  v32 = Date.init()(v29);
  v33 = v51;
  v34 = MessageDetails.expirationDate.getter(v32);
  v35 = (uint64_t)v48;
  MessageDetails.TTL.getter(v34);
  v36 = v47;
  v37 = v50;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v35, 1, v50) == 1)
  {
    sub_100006C90(v35, &qword_100031748);
    v38 = v52;
    v39 = v53;
  }
  else
  {
    v40 = v46;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 32))(v46, v35, v37);
    v41 = v45;
    static Date.+ infix(_:_:)(v33, v40);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v40, v37);
    v38 = v52;
    v39 = v53;
    (*(void (**)(char *, uint64_t))(v52 + 8))(v33, v53);
    (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v33, v41, v39);
  }
  v30 = static Date.> infix(_:_:)(v31, v33);
  v42 = *(void (**)(char *, uint64_t))(v38 + 8);
  v42(v33, v39);
  v42(v31, v39);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  return v30 & 1;
}

uint64_t sub_10000E140(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  if (!((unint64_t)a1 >> 62))
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(a1);
    if (v2)
      goto LABEL_3;
    return swift_bridgeObjectRelease(a1);
  }
  if (a1 < 0)
    v8 = a1;
  else
    v8 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a1);
  result = _CocoaArrayWrapper.endIndex.getter(v8);
  v2 = result;
  if (!result)
    return swift_bridgeObjectRelease(a1);
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, a1);
      else
        v5 = *(id *)(a1 + 8 * v4 + 32);
      v6 = v5;
      ++v4;
      objc_msgSend(v5, "willMoveToParentViewController:", 0);
      v7 = objc_msgSend(v6, "view");
      objc_msgSend(v7, "removeFromSuperview");

      objc_msgSend(v6, "removeFromParentViewController");
    }
    while (v2 != v4);
    return swift_bridgeObjectRelease(a1);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000E258(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

unint64_t sub_10000E290()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100031740;
  if (!qword_100031740)
  {
    v1 = sub_10000E2DC(&qword_100031738);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100031740);
  }
  return result;
}

uint64_t sub_10000E2DC(uint64_t *a1)
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

uint64_t sub_10000E320(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100006198(a1, a2);
  return a1;
}

uint64_t sub_10000E334(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1000062B8(a1, a2);
  return a1;
}

uint64_t sub_10000E348()
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

uint64_t sub_10000E3C4(uint64_t a1)
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
  v9 = (_QWORD *)swift_task_alloc(dword_10003176C);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_100006270;
  return sub_10000C450(a1, v5, v6, v7, v8);
}

uint64_t sub_10000E458(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100003CB4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000E49C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003CB4(&qword_100031778);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E4E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *sub_10000E528(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000E54C(__int128 *a1, uint64_t a2)
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

uint64_t sub_10000E564()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000E598(uint64_t a1)
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
  v8 = (_QWORD *)swift_task_alloc(dword_10003178C);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_100006F00;
  return sub_10000907C(a1, v4, v5, v7, v6);
}

uint64_t sub_10000E610(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

ValueMetadata *type metadata accessor for SharedConstants()
{
  return &type metadata for SharedConstants;
}

void sub_10000E644()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  byte_100031798 = v1 == (id)5;
}

void sub_10000E6A4()
{
  qword_100032A98 = 0x4010000000000000;
}

void sub_10000E6B4()
{
  qword_100032AA0 = 0x4034000000000000;
}

void sub_10000E6C4()
{
  qword_100032AA8 = 0x4014000000000000;
}

void sub_10000E6D4()
{
  qword_100032AB0 = 0x4018000000000000;
}

uint64_t sub_10000E6E4()
{
  uint64_t result;

  result = static Font.subheadline.getter();
  qword_100032AB8 = result;
  return result;
}

void sub_10000E700()
{
  qword_100032AC0 = 0x4028000000000000;
}

uint64_t sub_10000E710()
{
  double v0;
  uint64_t result;

  if (qword_1000312D8 != -1)
    result = swift_once(&qword_1000312D8, sub_10000E644);
  v0 = 28.0;
  if (byte_100031798)
    v0 = 22.0;
  qword_100032AC8 = *(_QWORD *)&v0;
  return result;
}

void sub_10000E768()
{
  qword_100032AD0 = 0x4049000000000000;
}

void sub_10000E778()
{
  qword_100032AD8 = 0x4062C00000000000;
}

uint64_t sub_10000E78C(uint64_t a1)
{
  return sub_10000E948(a1, (SEL *)&selRef_labelColor, &qword_100032AE0);
}

uint64_t sub_10000E7A0(uint64_t a1)
{
  return sub_10000E948(a1, (SEL *)&selRef_secondaryLabelColor, &qword_100032AE8);
}

uint64_t sub_10000E7B4(uint64_t a1)
{
  return sub_10000E948(a1, (SEL *)&selRef_opaqueSeparatorColor, &qword_100032AF0);
}

uint64_t sub_10000E7C8()
{
  uint64_t result;

  qword_100032AF8 = static PeopleWidgetConstants.askToBuyAppstoreGradientColor1.getter();
  result = static PeopleWidgetConstants.askToBuyAppstoreGradientColor2.getter();
  qword_100032B00 = result;
  return result;
}

uint64_t sub_10000E7F8()
{
  uint64_t result;

  qword_100032B08 = static PeopleWidgetConstants.askToBuyITunesGradientColor1.getter();
  result = static PeopleWidgetConstants.askToBuyITunesGradientColor2.getter();
  qword_100032B10 = result;
  return result;
}

uint64_t sub_10000E828()
{
  uint64_t result;

  qword_100032B18 = static PeopleWidgetConstants.askToBuyBooksGradientColor1.getter();
  result = static PeopleWidgetConstants.askToBuyBooksGradientColor2.getter();
  qword_100032B20 = result;
  return result;
}

uint64_t sub_10000E858()
{
  uint64_t result;

  qword_100032B28 = static PeopleWidgetConstants.subscriptionBadgeColor.getter();
  result = static PeopleWidgetConstants.subscriptionBadgeColor.getter();
  qword_100032B30 = result;
  return result;
}

void sub_10000E888()
{
  qword_1000317A0 = 0x4046800000000000;
}

uint64_t sub_10000E89C()
{
  double v0;
  uint64_t result;

  if (qword_1000312D8 != -1)
    result = swift_once(&qword_1000312D8, sub_10000E644);
  v0 = 60.0;
  if (byte_100031798)
    v0 = 48.0;
  qword_100032B38 = *(_QWORD *)&v0;
  return result;
}

id sub_10000E8FC()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(UIColor), "systemGray5Color");
  qword_100032B40 = (uint64_t)result;
  return result;
}

uint64_t sub_10000E934(uint64_t a1)
{
  return sub_10000E948(a1, (SEL *)&selRef_systemGray5Color, &qword_100032B48);
}

uint64_t sub_10000E948(uint64_t a1, SEL *a2, uint64_t *a3)
{
  id v4;
  uint64_t result;

  v4 = objc_msgSend((id)objc_opt_self(UIColor), *a2);
  result = Color.init(uiColor:)(v4);
  *a3 = result;
  return result;
}

void sub_10000E98C()
{
  qword_100032B50 = 0x65726F7473707061;
  *(_QWORD *)algn_100032B58 = 0xE800000000000000;
}

void sub_10000E9B0()
{
  qword_100032B60 = 0x6C69662E6B6F6F62;
  *(_QWORD *)algn_100032B68 = 0xE90000000000006CLL;
}

void sub_10000E9D8()
{
  qword_100032B70 = 0x6C69662E72617473;
  *(_QWORD *)algn_100032B78 = 0xE90000000000006CLL;
}

void sub_10000EA00()
{
  qword_100032B80 = 0x2E6E6F7276656863;
  *(_QWORD *)algn_100032B88 = 0xEF64726177726F66;
}

void sub_10000EA30()
{
  strcpy((char *)&qword_100032B90, "goforward.plus");
  algn_100032B98[7] = -18;
}

void sub_10000EA60()
{
  strcpy((char *)&qword_100032BA0, "FamilyRequest");
  *(_WORD *)&algn_100032BA8[6] = -4864;
}

uint64_t sub_10000EA90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_100003CB4(&qword_1000317A8);
  v1 = swift_allocObject(v0, 80, 7);
  *(_OWORD *)(v1 + 16) = xmmword_100025510;
  if (qword_100031380 != -1)
    swift_once(&qword_100031380, sub_10000E98C);
  v2 = *(_QWORD *)algn_100032B58;
  *(_QWORD *)(v1 + 32) = qword_100032B50;
  *(_QWORD *)(v1 + 40) = v2;
  v3 = qword_100031388;
  swift_bridgeObjectRetain(v2);
  if (v3 != -1)
    swift_once(&qword_100031388, sub_10000E9B0);
  v4 = *(_QWORD *)algn_100032B68;
  *(_QWORD *)(v1 + 48) = qword_100032B60;
  *(_QWORD *)(v1 + 56) = v4;
  v5 = qword_100031390;
  swift_bridgeObjectRetain(v4);
  if (v5 != -1)
    swift_once(&qword_100031390, sub_10000E9D8);
  v6 = *(_QWORD *)algn_100032B78;
  *(_QWORD *)(v1 + 64) = qword_100032B70;
  *(_QWORD *)(v1 + 72) = v6;
  qword_100032BB0 = v1;
  return swift_bridgeObjectRetain(v6);
}

uint64_t sub_10000EB88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
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
  unint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;

  v4 = v3;
  v29 = a2;
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  __chkstk_darwin(v7);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100003CB4(&qword_1000314A8);
  __chkstk_darwin(v11);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v4 + 128);
  if (v14)
  {
    type metadata accessor for MessageDetails(0);
    swift_retain(v14);
    sub_100003CB4(&qword_1000316F8);
    Task.cancel()();
    swift_release(v14);
    v15 = *(_QWORD *)(v4 + 128);
  }
  else
  {
    v15 = 0;
  }
  *(_QWORD *)(v4 + 128) = 0;
  v16 = swift_release(v15);
  static TaskPriority.userInitiated.getter(v16);
  v17 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v13, 0, 1, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  type metadata accessor for MainActor(0);
  swift_retain(v4);
  v18 = swift_bridgeObjectRetain(a3);
  v19 = static MainActor.shared.getter(v18);
  v20 = *(unsigned __int8 *)(v8 + 80);
  v21 = (v20 + 40) & ~v20;
  v22 = (v9 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (char *)swift_allocObject(&unk_10002D4A0, v22 + 16, v20 | 7);
  *((_QWORD *)v23 + 2) = v19;
  *((_QWORD *)v23 + 3) = &protocol witness table for MainActor;
  *((_QWORD *)v23 + 4) = v4;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v23[v21], v10, v7);
  v24 = &v23[v22];
  *(_QWORD *)v24 = v29;
  *((_QWORD *)v24 + 1) = a3;
  v25 = sub_100012EEC((uint64_t)v13, (uint64_t)&unk_100031898, (uint64_t)v23);
  v26 = *(_QWORD *)(v4 + 128);
  *(_QWORD *)(v4 + 128) = v25;
  swift_retain(v25);
  swift_release(v26);
  return v25;
}

uint64_t sub_10000ED98@<X0>(uint64_t a1@<X0>, char a2@<W3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  unint64_t v26;
  _BYTE *v27;
  uint64_t v29;
  NSObject *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t Strong;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  os_log_t v59;
  uint8_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint8_t *v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;
  os_log_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v74 = a3;
  v6 = type metadata accessor for Logger(0);
  v75 = *(_QWORD *)(v6 - 8);
  v76 = v6;
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v70 = (char *)&v64 - v10;
  v11 = type metadata accessor for MessageDetails(0);
  v72 = *(_QWORD *)(v11 - 8);
  v73 = v11;
  __chkstk_darwin(v11);
  v13 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100003CB4(&qword_100031878);
  __chkstk_darwin(v14);
  v16 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for URLComponents(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  URLComponents.init(url:resolvingAgainstBaseURL:)(a1, 0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    v21 = sub_100006C90((uint64_t)v16, &qword_100031878);
    v22 = static PeopleLogger.messages.getter(v21);
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Can't parse bubble view url components", v25, 2u);
      swift_slowDealloc(v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v75 + 8))(v9, v76);
    v26 = sub_1000139C4();
    swift_allocError(&type metadata for MessageDetailsLoaderError, v26, 0, 0);
    *v27 = 2;
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v16, v17);
    v29 = static MessageDetails.detailsFrom(_:)(v20);
    if (v3)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    }
    else
    {
      v30 = MessageDetails.bundleId.getter(v29);
      if (v31)
      {
        v32 = v31;
        v69 = v30;
      }
      else
      {
        v69 = (os_log_t)MessageDetails.requestID.getter(v30);
        v32 = v33;
      }
      v34 = ((uint64_t (*)(void))MessageDetails.thumbnailData.getter)();
      v36 = v35;
      sub_10000E320(v34, v35);
      if (v36 >> 60 == 15)
      {
        if (qword_1000312C8 != -1)
          swift_once(&qword_1000312C8, sub_1000037EC);
        v37 = ImageCache.getFromCache(_:)((uint64_t)v69, v32);
        v39 = v38;
        v40 = swift_bridgeObjectRelease(v32);
        if (v39 >> 60 != 15)
          v40 = MessageDetails.thumbnailData.setter(v37, v39);
      }
      else
      {
        v40 = swift_bridgeObjectRelease(v32);
      }
      if ((a2 & 1) != 0)
      {
        v41 = MessageDetails.thumbnailData.getter(v40);
        v43 = v42;
        sub_10000E320(v41, v42);
        if (v43 >> 60 == 15)
        {
          Strong = swift_unknownObjectWeakLoadStrong(v71 + 16);
          if (Strong)
          {
            v45 = Strong;
            if (qword_1000312D0 != -1)
              swift_once(&qword_1000312D0, sub_100007198);
            v47 = qword_100032A88;
            v46 = qword_100032A90;
            sub_10000E334(qword_100032A88, qword_100032A90);
            swift_unknownObjectRelease(v45);
            if (v46 >> 60 != 15)
            {
              sub_1000062B8(v47, v46);
              v48 = MessageDetails.thumbnailData.setter(v47, v46);
              v49 = v70;
              v50 = static PeopleLogger.messages.getter(v48);
              v51 = Logger.logObject.getter(v50);
              v52 = static os_log_type_t.info.getter();
              LODWORD(v71) = v52;
              if (os_log_type_enabled(v51, v52))
              {
                v69 = v51;
                v53 = (uint8_t *)swift_slowAlloc(12, -1);
                v67 = swift_slowAlloc(32, -1);
                v79 = v67;
                *(_DWORD *)v53 = 136315138;
                v54 = v53 + 12;
                v65 = v53 + 4;
                v66 = v53;
                v55 = swift_beginAccess(v13, &v77, 32, 0);
                v56 = MessageDetails.requestID.getter(v55);
                v68 = v47;
                v58 = v57;
                swift_endAccess(&v77);
                v77 = sub_10000608C(v56, v58, &v79);
                UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, &v78, v65, v54);
                swift_bridgeObjectRelease(v58);
                v59 = v69;
                v60 = v66;
                _os_log_impl((void *)&_mh_execute_header, v69, (os_log_type_t)v71, "%s - using fallback icon", v66, 0xCu);
                v61 = v67;
                swift_arrayDestroy(v67, 1, (char *)&type metadata for Any + 8);
                swift_slowDealloc(v61, -1, -1);
                swift_slowDealloc(v60, -1, -1);

                sub_10000E320(v68, v46);
                (*(void (**)(char *, uint64_t))(v75 + 8))(v70, v76);
              }
              else
              {

                sub_10000E320(v47, v46);
                (*(void (**)(char *, uint64_t))(v75 + 8))(v49, v76);
              }
            }
          }
        }
      }
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
      swift_beginAccess(v13, &v77, 0, 0);
      v63 = v72;
      v62 = v73;
      (*(void (**)(uint64_t, char *, uint64_t))(v72 + 16))(v74, v13, v73);
      return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v13, v62);
    }
  }
}

uint64_t sub_10000F350@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, char *a4@<X8>)
{
  _QWORD *v4;
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
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  void (*v44)(char *, uint64_t, uint64_t, uint64_t);
  void (*v45)(char *, uint64_t, uint64_t, uint64_t);
  char *v46;
  uint64_t v47;
  _QWORD *v48;
  unsigned int (*v49)(uint64_t, uint64_t, uint64_t);
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  unint64_t v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  char *v61;
  uint8_t *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  _BOOL4 v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint8_t *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  char *v97;
  void (*v98)(char *, uint64_t);
  char *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  NSObject *v103;
  os_log_type_t v104;
  uint8_t *v105;
  uint64_t v106;
  char *v107;
  char *v109;
  void (*v110)(char *, uint64_t, uint64_t, uint64_t);
  char *v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  char *v118;
  char *v119;
  char *v120;
  char *v121;
  void (*v122)(char *, char *, uint64_t);
  char *v123;
  char *v124;
  unint64_t v125;
  char *v126;
  _QWORD *v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;

  v132 = a2;
  v126 = a4;
  v7 = type metadata accessor for Logger(0);
  v8 = *(_QWORD *)(v7 - 8);
  v129 = v7;
  v130 = v8;
  v9 = __chkstk_darwin(v7);
  v123 = (char *)&v109 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v12 = __chkstk_darwin(v11);
  v118 = (char *)&v109 - v13;
  v14 = __chkstk_darwin(v12);
  v121 = (char *)&v109 - v15;
  __chkstk_darwin(v14);
  v117 = (char *)&v109 - v16;
  v116 = type metadata accessor for ResolvedFamily(0);
  v115 = *(_QWORD *)(v116 - 8);
  __chkstk_darwin(v116);
  v111 = (char *)&v109 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100003CB4(&qword_100031870);
  v19 = __chkstk_darwin(v18);
  v113 = (uint64_t)&v109 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __chkstk_darwin(v19);
  v112 = (uint64_t)&v109 - v22;
  __chkstk_darwin(v21);
  v114 = (char *)&v109 - v23;
  v24 = type metadata accessor for MessageDetails(0);
  v25 = *(_QWORD *)(v24 - 8);
  v26 = __chkstk_darwin(v24);
  v119 = (char *)&v109 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __chkstk_darwin(v26);
  v120 = (char *)&v109 - v29;
  v30 = __chkstk_darwin(v28);
  v128 = (char *)&v109 - v31;
  __chkstk_darwin(v30);
  v131 = (char *)&v109 - v32;
  v33 = sub_100003CB4(&qword_100031710);
  v34 = __chkstk_darwin(v33);
  v124 = (char *)&v109 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __chkstk_darwin(v34);
  v38 = (char *)&v109 - v37;
  v39 = __chkstk_darwin(v36);
  v41 = (char *)&v109 - v40;
  __chkstk_darwin(v39);
  v43 = (char *)&v109 - v42;
  v133 = v25;
  v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
  v44((char *)&v109 - v42, 1, 1, v24);
  v127 = v4;
  sub_10000ED98(a1, 1, (uint64_t)v41);
  v125 = a3;
  sub_100006C90((uint64_t)v43, &qword_100031710);
  v44(v41, 0, 1, v24);
  sub_100013A08((uint64_t)v41, (uint64_t)v43, &qword_100031710);
  v45 = v44;
  v46 = v131;
  v47 = v133;
  v48 = v127;
  sub_10000E458((uint64_t)v43, (uint64_t)v38, &qword_100031710);
  v49 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48);
  if (v49((uint64_t)v38, 1, v24) == 1)
  {
    sub_100006C90((uint64_t)v43, &qword_100031710);
    sub_100006C90((uint64_t)v38, &qword_100031710);
    v50 = 1;
    v51 = v126;
  }
  else
  {
    v110 = v45;
    v122 = *(void (**)(char *, char *, uint64_t))(v47 + 32);
    v122(v46, v38, v24);
    (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v128, v46, v24);
    v52 = v48[9];
    v53 = v48[10];
    sub_10000E528(v48 + 6, v52);
    v54 = (uint64_t)v124;
    dispatch thunk of MessageDetailsCacheProtocol.messageDetails(for:)(v132, v125, v52, v53);
    if (v49(v54, 1, v24) == 1)
    {
      v55 = sub_100006C90(v54, &qword_100031710);
      v56 = v118;
      static PeopleLogger.messages.getter(v55);
      v57 = v125;
      v58 = swift_bridgeObjectRetain_n(v125, 2);
      v59 = Logger.logObject.getter(v58);
      v60 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v59, v60))
      {
        v61 = v56;
        v62 = (uint8_t *)swift_slowAlloc(12, -1);
        v63 = swift_slowAlloc(32, -1);
        v135 = v63;
        *(_DWORD *)v62 = 136315138;
        swift_bridgeObjectRetain(v57);
        v134 = sub_10000608C(v132, v57, &v135);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v134, &v135, v62 + 4, v62 + 12);
        swift_bridgeObjectRelease_n(v57, 3);
        _os_log_impl((void *)&_mh_execute_header, v59, v60, "%s - cached message details is nil", v62, 0xCu);
        swift_arrayDestroy(v63, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v63, -1, -1);
        swift_slowDealloc(v62, -1, -1);

        (*(void (**)(char *, uint64_t))(v130 + 8))(v61, v129);
        (*(void (**)(char *, uint64_t))(v133 + 8))(v131, v24);
      }
      else
      {
        swift_bridgeObjectRelease_n(v57, 2);

        (*(void (**)(char *, uint64_t))(v130 + 8))(v56, v129);
        (*(void (**)(char *, uint64_t))(v133 + 8))(v46, v24);
      }
      v79 = (uint64_t)v43;
    }
    else
    {
      v64 = v120;
      v65 = ((uint64_t (*)(char *, uint64_t, uint64_t))v122)(v120, v54, v24);
      v66 = MessageDetails.userDSID.getter(v65);
      v109 = v43;
      if ((v67 & 1) != 0)
      {
        v80 = v117;
        static PeopleLogger.messages.getter(v66);
        v77 = v125;
        v81 = swift_bridgeObjectRetain_n(v125, 2);
        v82 = Logger.logObject.getter(v81);
        v83 = static os_log_type_t.error.getter();
        v84 = os_log_type_enabled(v82, v83);
        v86 = v129;
        v85 = v130;
        v87 = v132;
        if (v84)
        {
          v88 = (uint8_t *)swift_slowAlloc(12, -1);
          v89 = swift_slowAlloc(32, -1);
          v135 = v89;
          *(_DWORD *)v88 = 136315138;
          swift_bridgeObjectRetain(v125);
          v134 = sub_10000608C(v87, v125, &v135);
          v77 = v125;
          v64 = v120;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v134, &v135, v88 + 4, v88 + 12);
          swift_bridgeObjectRelease_n(v77, 3);
          _os_log_impl((void *)&_mh_execute_header, v82, v83, "%s - userDSID is nil", v88, 0xCu);
          swift_arrayDestroy(v89, 1, (char *)&type metadata for Any + 8);
          v46 = v131;
          swift_slowDealloc(v89, -1, -1);
          swift_slowDealloc(v88, -1, -1);

          (*(void (**)(char *, uint64_t))(v130 + 8))(v117, v86);
        }
        else
        {

          swift_bridgeObjectRelease_n(v77, 2);
          (*(void (**)(char *, uint64_t))(v85 + 8))(v80, v86);
        }
      }
      else
      {
        v68 = v66;
        v69 = v127[14];
        v70 = v127[15];
        sub_10000E528(v127 + 11, v69);
        v71 = (uint64_t)v114;
        v46 = v131;
        dispatch thunk of ResolvedFamilyCacheProtocol.familyFromCacheForChild(dsid:)(v68, v69, v70);
        v72 = v112;
        sub_10000E458(v71, v112, &qword_100031870);
        MessageDetails.family.setter(v72);
        v73 = v113;
        sub_10000E458(v71, v113, &qword_100031870);
        v74 = v115;
        v75 = v116;
        v76 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v115 + 48))(v73, 1, v116);
        v77 = v125;
        if (v76 == 1)
        {
          sub_100006C90(v71, &qword_100031870);
          v78 = v73;
        }
        else
        {
          v90 = v111;
          v91 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v74 + 32))(v111, v73, v75);
          v92 = (void *)ResolvedFamily.requestingFamilyMember.getter(v91);
          v93 = FAFamilyMember.displayNameWithFallback.getter();
          v95 = v94;

          MessageDetails.childName.setter(v93, v95);
          (*(void (**)(char *, uint64_t))(v115 + 8))(v90, v116);
          v78 = v71;
        }
        sub_100006C90(v78, &qword_100031870);
        v86 = v129;
      }
      v96 = v119;
      MessageDetails.updateFromDetails(_:)(v64);
      v97 = v64;
      v98 = *(void (**)(char *, uint64_t))(v133 + 8);
      v99 = v128;
      v98(v128, v24);
      v100 = ((uint64_t (*)(char *, char *, uint64_t))v122)(v99, v96, v24);
      v101 = v121;
      static PeopleLogger.messages.getter(v100);
      v102 = swift_bridgeObjectRetain_n(v77, 2);
      v103 = Logger.logObject.getter(v102);
      v104 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v103, v104))
      {
        v105 = (uint8_t *)swift_slowAlloc(12, -1);
        v106 = swift_slowAlloc(32, -1);
        v135 = v106;
        *(_DWORD *)v105 = 136315138;
        swift_bridgeObjectRetain(v77);
        v134 = sub_10000608C(v132, v77, &v135);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v134, &v135, v105 + 4, v105 + 12);
        swift_bridgeObjectRelease_n(v77, 3);
        _os_log_impl((void *)&_mh_execute_header, v103, v104, "%s - loaded cached message details from cache", v105, 0xCu);
        swift_arrayDestroy(v106, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v106, -1, -1);
        swift_slowDealloc(v105, -1, -1);

        (*(void (**)(char *, uint64_t))(v130 + 8))(v121, v129);
        v98(v97, v24);
        v107 = v131;
      }
      else
      {
        swift_bridgeObjectRelease_n(v77, 2);

        (*(void (**)(char *, uint64_t))(v130 + 8))(v101, v86);
        v98(v97, v24);
        v107 = v46;
      }
      v98(v107, v24);
      v79 = (uint64_t)v109;
    }
    sub_100006C90(v79, &qword_100031710);
    v51 = v126;
    v45 = v110;
    v122(v126, v128, v24);
    v50 = 0;
  }
  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v45)(v51, v50, 1, v24);
}

BOOL sub_100010120(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100010134()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100010178()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_1000101A0(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_1000101F0(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(char *, unint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  v2 = v1;
  v75 = a1;
  v3 = type metadata accessor for Logger(0);
  v77 = *(_QWORD *)(v3 - 8);
  v78 = v3;
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v70 = (char *)&v69 - v7;
  v8 = type metadata accessor for URLQueryItem(0);
  v76 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v10 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100003CB4(&qword_100031888);
  __chkstk_darwin(v11);
  v13 = (char *)&v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100003CB4(&qword_100031878);
  __chkstk_darwin(v14);
  v16 = (char *)&v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for URLComponents(0);
  v18 = *(_QWORD *)(v17 - 8);
  v72 = v17;
  v73 = v18;
  __chkstk_darwin(v17);
  v71 = (char *)&v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_100003CB4(&qword_1000314C8);
  v21 = __chkstk_darwin(v20);
  v23 = (char *)&v69 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v25 = (char *)&v69 - v24;
  v26 = type metadata accessor for URL(0);
  v27 = *(_QWORD *)(v26 - 8);
  __chkstk_darwin(v26);
  v74 = (char *)&v69 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = objc_msgSend(v2, "selectedMessage");
  if (!v29)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v25, 1, 1, v26);
    goto LABEL_7;
  }
  v30 = v29;
  v69 = v13;
  v31 = objc_msgSend(v29, "URL");

  if (v31)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v31);

    v32 = 0;
  }
  else
  {
    v32 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v23, v32, 1, v26);
  sub_100013A08((uint64_t)v23, (uint64_t)v25, &qword_1000314C8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26) == 1)
  {
LABEL_7:
    v33 = sub_100006C90((uint64_t)v25, &qword_1000314C8);
    v34 = static PeopleLogger.messages.getter(v33);
    v35 = Logger.logObject.getter(v34);
    v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "No message url in conversation", v37, 2u);
      swift_slowDealloc(v37, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v77 + 8))(v6, v78);
    return 0;
  }
  v40 = v74;
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v74, v25, v26);
  URLComponents.init(url:resolvingAgainstBaseURL:)(v40, 0);
  v42 = v72;
  v41 = v73;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v73 + 48))(v16, 1, v72) == 1)
  {
    v43 = sub_100006C90((uint64_t)v16, &qword_100031878);
    v44 = v70;
    v45 = static PeopleLogger.messages.getter(v43);
    v46 = Logger.logObject.getter(v45);
    v47 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "Can't parse bubble view url components", v48, 2u);
      swift_slowDealloc(v48, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v77 + 8))(v44, v78);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v40, v26);
  }
  else
  {
    v49 = v71;
    v50 = (*(uint64_t (**)(char *, char *, uint64_t))(v41 + 32))(v71, v16, v42);
    v51 = v41;
    v52 = URLComponents.queryItems.getter(v50);
    v38 = v52;
    if (!v52)
    {
      (*(void (**)(char *, uint64_t))(v51 + 8))(v49, v42);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v40, v26);
      return v38;
    }
    v53 = *(_QWORD *)(v52 + 16);
    if (v53)
    {
      v54 = v52 + ((*(unsigned __int8 *)(v76 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80));
      v55 = *(_QWORD *)(v76 + 72);
      v77 = v52;
      v78 = v55;
      v56 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v76 + 16);
      swift_bridgeObjectRetain(v52);
      while (1)
      {
        v57 = v56(v10, v54, v8);
        v58 = URLQueryItem.name.getter(v57);
        v60 = v59;
        v62 = PeopleURL.Parameter.rawValue.getter();
        v63 = v61;
        if (v58 == v62 && v60 == v61)
        {
          v38 = v77;
          swift_bridgeObjectRelease(v77);
          swift_bridgeObjectRelease_n(v60, 2);
          goto LABEL_28;
        }
        v64 = _stringCompareWithSmolCheck(_:_:expecting:)(v58, v60, v62, v61, 0);
        swift_bridgeObjectRelease(v60);
        swift_bridgeObjectRelease(v63);
        if ((v64 & 1) != 0)
          break;
        v65 = v76;
        (*(void (**)(char *, uint64_t))(v76 + 8))(v10, v8);
        v54 += v78;
        if (!--v53)
        {
          v38 = v77;
          swift_bridgeObjectRelease(v77);
          v66 = 1;
          v67 = (uint64_t)v69;
          goto LABEL_29;
        }
      }
      v38 = v77;
      swift_bridgeObjectRelease(v77);
LABEL_28:
      v65 = v76;
      v67 = (uint64_t)v69;
      (*(void (**)(char *, char *, uint64_t))(v76 + 32))(v69, v10, v8);
      v66 = 0;
LABEL_29:
      v42 = v72;
    }
    else
    {
      v66 = 1;
      v65 = v76;
      v67 = (uint64_t)v69;
    }
    v68 = v71;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v65 + 56))(v67, v66, 1, v8);
    swift_bridgeObjectRelease(v38);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v65 + 48))(v67, 1, v8) != 1)
    {
      v38 = URLQueryItem.value.getter();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v68, v42);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v74, v26);
      (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v67, v8);
      return v38;
    }
    (*(void (**)(char *, uint64_t))(v73 + 8))(v68, v42);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v74, v26);
    sub_100006C90(v67, &qword_100031888);
  }
  return 0;
}

uint64_t sub_1000108A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  v7[2] = a1;
  v8 = sub_100003CB4(&qword_100031870);
  v7[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for ResolvedFamily(0);
  v7[8] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v7[9] = v10;
  v7[10] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for MessageDetails(0);
  v7[11] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v7[12] = v12;
  v7[13] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for MainActor(0);
  v7[14] = static MainActor.shared.getter(v13);
  v14 = dispatch thunk of Actor.unownedExecutor.getter(v13, &protocol witness table for MainActor);
  v7[15] = v14;
  v7[16] = v15;
  return swift_task_switch(sub_100010988, v14, v15);
}

uint64_t sub_100010988()
{
  uint64_t *v0;
  uint64_t **v1;

  sub_10000ED98(v0[4], 0, v0[13]);
  v1 = (uint64_t **)swift_task_alloc(dword_1000318A4);
  v0[17] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = (uint64_t *)sub_100010A40;
  return sub_100010CB4(v0[2], v0[5], v0[6], v0[13]);
}

uint64_t sub_100010A40()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 136);
  *(_QWORD *)(*v1 + 144) = v0;
  swift_task_dealloc(v3);
  if (v0)
    v4 = sub_100010C44;
  else
    v4 = sub_100010AA0;
  return swift_task_switch(v4, *(_QWORD *)(v2 + 120), *(_QWORD *)(v2 + 128));
}

uint64_t sub_100010AA0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0[18];
  v2 = v0[5];
  v3 = v0[6];
  v4 = v0[2];
  swift_release(v0[14]);
  sub_1000128E4(v4, v2, v3);
  if (v1)
  {
    v5 = v0[13];
    v6 = v0[11];
    v7 = *(void (**)(uint64_t, uint64_t))(v0[12] + 8);
    v7(v0[2], v6);
    v7(v5, v6);
    v8 = v0[10];
    v9 = v0[7];
    swift_task_dealloc(v0[13]);
    swift_task_dealloc(v8);
    swift_task_dealloc(v9);
    v10 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    v11 = v0[8];
    v12 = v0[9];
    v13 = v0[7];
    MessageDetails.family.getter();
    v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v13, 1, v11);
    v16 = v0[12];
    v15 = v0[13];
    v17 = v0[11];
    if (v14 == 1)
    {
      v18 = v0[7];
      (*(void (**)(_QWORD, _QWORD))(v16 + 8))(v0[13], v0[11]);
      sub_100006C90(v18, &qword_100031870);
    }
    else
    {
      v20 = v0[9];
      v19 = v0[10];
      v21 = v0[8];
      v22 = (_QWORD *)v0[3];
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v20 + 32))(v19, v0[7], v21);
      v23 = v22[14];
      v24 = v22[15];
      sub_10000E528(v22 + 11, v23);
      dispatch thunk of ResolvedFamilyCacheProtocol.addFamilyToCacheByChild(_:)(v19, v23, v24);
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    }
    v25 = v0[10];
    v26 = v0[7];
    swift_task_dealloc(v0[13]);
    swift_task_dealloc(v25);
    swift_task_dealloc(v26);
    v10 = (uint64_t (*)(void))v0[1];
  }
  return v10();
}

uint64_t sub_100010C44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 96);
  swift_release(*(_QWORD *)(v0 + 112));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 56);
  swift_task_dealloc(*(_QWORD *)(v0 + 104));
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100010CB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5[15] = a4;
  v5[16] = v4;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  v6 = type metadata accessor for CancellationError(0);
  v5[17] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[18] = v7;
  v5[19] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Logger(0);
  v5[20] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v5[21] = v9;
  v10 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[22] = swift_task_alloc(v10);
  v5[23] = swift_task_alloc(v10);
  v5[24] = swift_task_alloc(v10);
  v5[25] = swift_task_alloc(v10);
  v11 = type metadata accessor for MessageDetails(0);
  v5[26] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v5[27] = v12;
  v13 = (*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[28] = swift_task_alloc(v13);
  v5[29] = swift_task_alloc(v13);
  v5[30] = swift_task_alloc(v13);
  v14 = type metadata accessor for MainActor(0);
  v5[31] = v14;
  v5[32] = static MainActor.shared.getter(v14);
  v15 = dispatch thunk of Actor.unownedExecutor.getter(v14, &protocol witness table for MainActor);
  v5[33] = v15;
  v5[34] = v16;
  return swift_task_switch(sub_100010DE8, v15, v16);
}

uint64_t sub_100010DE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t Strong;
  _QWORD *v26;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint8_t *v37;
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
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  _BOOL4 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  os_log_type_t v82;
  _BOOL4 v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint8_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  _BYTE *v97;
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
  uint64_t v109[2];

  v1 = v0 + 72;
  v2 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 216) + 16))(*(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 208));
  v3 = static Task<>.checkCancellation()(v2);
  *(_QWORD *)(v0 + 280) = 0;
  v4 = "secondaryLabelColor";
  v5 = v0 + 80;
  v6 = MessageDetails.thumbnailData.getter(v3);
  v8 = v7;
  v9 = sub_10000E320(v6, v7);
  if (v8 >> 60 == 15)
  {
    v10 = v0 + 88;
    v11 = *(_QWORD *)(v0 + 112);
    static PeopleLogger.messages.getter(v9);
    v12 = swift_bridgeObjectRetain_n(v11, 2);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.debug.getter();
    v15 = os_log_type_enabled(v13, v14);
    v16 = *(_QWORD *)(v0 + 200);
    v18 = *(_QWORD *)(v0 + 160);
    v17 = *(_QWORD *)(v0 + 168);
    v19 = *(_QWORD *)(v0 + 112);
    if (v15)
    {
      v20 = *(_QWORD *)(v0 + 104);
      v98 = *(_QWORD *)(v0 + 168);
      v21 = (uint8_t *)swift_slowAlloc(12, -1);
      v22 = swift_slowAlloc(32, -1);
      v109[0] = v22;
      *(_DWORD *)v21 = 136315138;
      swift_bridgeObjectRetain(v19);
      v23 = v20;
      v10 = v0 + 88;
      *(_QWORD *)(v0 + 88) = sub_10000608C(v23, v19, v109);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 88, v0 + 96, v21 + 4, v21 + 12);
      swift_bridgeObjectRelease_n(v19, 3);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%s stable details had no thumbnail data. Fetching it.", v21, 0xCu);
      swift_arrayDestroy(v22, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v22, -1, -1);
      swift_slowDealloc(v21, -1, -1);

      v24 = *(void (**)(uint64_t, uint64_t))(v98 + 8);
    }
    else
    {
      swift_bridgeObjectRelease_n(v19, 2);

      v24 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    }
    v24(v16, v18);
    Strong = swift_unknownObjectWeakLoadStrong(*(_QWORD *)(v0 + 128) + 16);
    *(_QWORD *)(v0 + 288) = Strong;
    if (Strong)
    {
      v26 = (_QWORD *)swift_task_alloc(dword_10003175C);
      *(_QWORD *)(v0 + 296) = v26;
      *v26 = v0;
      v26[1] = sub_100011764;
      return sub_10000C78C(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240));
    }
    v28 = *(_QWORD *)(v0 + 112);
    static PeopleLogger.messages.getter(0);
    v29 = swift_bridgeObjectRetain_n(v28, 2);
    v30 = Logger.logObject.getter(v29);
    v31 = static os_log_type_t.debug.getter();
    v32 = os_log_type_enabled(v30, v31);
    v33 = *(_QWORD *)(v0 + 192);
    v34 = *(_QWORD *)(v0 + 160);
    v35 = *(_QWORD *)(v0 + 112);
    if (v32)
    {
      v36 = *(_QWORD *)(v0 + 104);
      v103 = *(_QWORD *)(v0 + 160);
      v37 = (uint8_t *)swift_slowAlloc(12, -1);
      v100 = v33;
      v38 = swift_slowAlloc(32, -1);
      v109[0] = v38;
      *(_DWORD *)v37 = 136315138;
      swift_bridgeObjectRetain(v35);
      *(_QWORD *)(v0 + 80) = sub_10000608C(v36, v35, v109);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v10, v37 + 4, v37 + 12);
      swift_bridgeObjectRelease_n(v35, 3);
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "%s thumbnail is nil", v37, 0xCu);
      swift_arrayDestroy(v38, 1, (char *)&type metadata for Any + 8);
      v39 = v38;
      v5 = v0 + 80;
      swift_slowDealloc(v39, -1, -1);
      swift_slowDealloc(v37, -1, -1);

      v9 = ((uint64_t (*)(uint64_t, uint64_t))v24)(v100, v103);
    }
    else
    {
      swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 112), 2);

      v9 = ((uint64_t (*)(uint64_t, uint64_t))v24)(v33, v34);
      v5 = v0 + 80;
    }
    v1 = v0 + 72;
    v4 = "secondaryLabelColor";
  }
  *(_OWORD *)(v0 + 304) = *((_OWORD *)v4 + 84);
  v40 = *(_QWORD *)(v0 + 280);
  static Task<>.checkCancellation()(v9);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)(v0 + 240);
    v43 = *(_QWORD *)(v0 + 208);
    v44 = *(_QWORD *)(v0 + 216);
    v45 = sub_100013BA4(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112), "%s has been deactivated prior to loading message status!");
    swift_willThrow(v45);
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v42, v43);
  }
  else
  {
    v75 = swift_unknownObjectWeakLoadStrong(*(_QWORD *)(v0 + 128) + 32);
    *(_QWORD *)(v0 + 320) = v75;
    if (v75)
    {
      v76 = *(_QWORD *)(v0 + 248);
      *(_QWORD *)(v0 + 328) = static MainActor.shared.getter(v75);
      v77 = dispatch thunk of Actor.unownedExecutor.getter(v76, &protocol witness table for MainActor);
      *(_QWORD *)(v0 + 336) = v77;
      *(_QWORD *)(v0 + 344) = v78;
      return swift_task_switch(sub_100011DFC, v77, v78);
    }
    v108 = v1;
    v79 = *(_QWORD *)(v0 + 112);
    static PeopleLogger.messages.getter(0);
    v80 = swift_bridgeObjectRetain_n(v79, 2);
    v81 = Logger.logObject.getter(v80);
    v82 = static os_log_type_t.debug.getter();
    v83 = os_log_type_enabled(v81, v82);
    v84 = *(_QWORD *)(v0 + 184);
    v85 = *(_QWORD *)(v0 + 160);
    v86 = *(_QWORD *)(v0 + 168);
    v87 = *(_QWORD *)(v0 + 112);
    if (v83)
    {
      v102 = *(_QWORD *)(v0 + 184);
      v105 = *(_QWORD *)(v0 + 160);
      v88 = v5;
      v89 = *(_QWORD *)(v0 + 104);
      v99 = *(_QWORD *)(v0 + 168);
      v90 = (uint8_t *)swift_slowAlloc(12, -1);
      v91 = swift_slowAlloc(32, -1);
      v109[0] = v91;
      *(_DWORD *)v90 = 136315138;
      swift_bridgeObjectRetain(v87);
      *(_QWORD *)(v0 + 72) = sub_10000608C(v89, v87, v109);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v108, v88, v90 + 4, v90 + 12);
      swift_bridgeObjectRelease_n(v87, 3);
      _os_log_impl((void *)&_mh_execute_header, v81, v82, "%s messageStatusProvider == nil", v90, 0xCu);
      swift_arrayDestroy(v91, 1, (char *)&type metadata for Any + 8);
      v92 = v91;
      v4 = "secondaryLabelColor";
      swift_slowDealloc(v92, -1, -1);
      swift_slowDealloc(v90, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v102, v105);
    }
    else
    {
      swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 112), 2);

      (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v84, v85);
    }
    v93 = *(_QWORD *)(v0 + 240);
    v94 = *(_QWORD *)(v0 + 208);
    v95 = *(_QWORD *)(v0 + 216);
    v96 = sub_1000139C4();
    v41 = swift_allocError(&type metadata for MessageDetailsLoaderError, v96, 0, 0);
    *v97 = 3;
    swift_willThrow(v41);
    (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v93, v94);
    v1 = v108;
  }
  *(_OWORD *)(v0 + 384) = *((_OWORD *)v4 + 84);
  *(_QWORD *)(v0 + 376) = v41;
  v46 = *(_QWORD *)(v0 + 152);
  v47 = *(_QWORD *)(v0 + 136);
  *(_QWORD *)(v0 + 56) = v41;
  swift_errorRetain(v41);
  v48 = sub_100003CB4(&qword_1000316F8);
  v49 = swift_dynamicCast(v46, v0 + 56, v48, v47, 6);
  if ((_DWORD)v49)
  {
    v50 = *(_QWORD *)(v0 + 232);
    v51 = *(_QWORD *)(v0 + 240);
    v52 = *(_QWORD *)(v0 + 224);
    v54 = *(_QWORD *)(v0 + 192);
    v53 = *(_QWORD *)(v0 + 200);
    v106 = *(_QWORD *)(v0 + 184);
    v107 = *(_QWORD *)(v0 + 176);
    v55 = *(_QWORD *)(v0 + 144);
    v56 = *(_QWORD *)(v0 + 152);
    v57 = *(_QWORD *)(v0 + 136);
    swift_release(*(_QWORD *)(v0 + 256));
    v58 = (*(uint64_t (**)(uint64_t, uint64_t))(v55 + 8))(v56, v57);
    swift_willThrow(v58);
    sub_10000E320(0, 0xF000000000000000);
    swift_task_dealloc(v51);
    swift_task_dealloc(v50);
    swift_task_dealloc(v52);
    swift_task_dealloc(v53);
    swift_task_dealloc(v54);
    swift_task_dealloc(v106);
    swift_task_dealloc(v107);
    swift_task_dealloc(v56);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v59 = *(_QWORD *)(v0 + 112);
    static PeopleLogger.messages.getter(v49);
    swift_bridgeObjectRetain(v59);
    swift_errorRetain(v41);
    swift_bridgeObjectRetain(v59);
    v60 = swift_errorRetain(v41);
    v61 = Logger.logObject.getter(v60);
    v62 = static os_log_type_t.debug.getter();
    v63 = os_log_type_enabled(v61, v62);
    v65 = *(_QWORD *)(v0 + 168);
    v64 = *(_QWORD *)(v0 + 176);
    v66 = *(_QWORD *)(v0 + 160);
    v67 = *(_QWORD *)(v0 + 112);
    if (v63)
    {
      v104 = *(_QWORD *)(v0 + 176);
      v68 = *(_QWORD *)(v0 + 104);
      v101 = *(_QWORD *)(v0 + 168);
      v69 = swift_slowAlloc(22, -1);
      v70 = swift_slowAlloc(64, -1);
      *(_DWORD *)v69 = 136315394;
      v109[0] = v70;
      swift_bridgeObjectRetain(v67);
      *(_QWORD *)(v0 + 40) = sub_10000608C(v68, v67, v109);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v69 + 4, v69 + 12);
      swift_bridgeObjectRelease_n(v67, 3);
      *(_WORD *)(v69 + 12) = 2080;
      swift_getErrorValue(v41, v0 + 48, v0 + 16);
      v71 = Error.localizedDescription.getter(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
      v73 = v72;
      *(_QWORD *)(v0 + 64) = sub_10000608C(v71, v72, v109);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v1, v69 + 14, v69 + 22);
      swift_bridgeObjectRelease(v73);
      swift_errorRelease(v41);
      swift_errorRelease(v41);
      _os_log_impl((void *)&_mh_execute_header, v61, v62, "%s failed load details %s, using fallback", (uint8_t *)v69, 0x16u);
      swift_arrayDestroy(v70, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v70, -1, -1);
      swift_slowDealloc(v69, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v104, v66);
    }
    else
    {
      swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 112), 2);
      swift_errorRelease(v41);
      swift_errorRelease(v41);

      (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v64, v66);
    }
    v74 = (_QWORD *)swift_task_alloc(dword_1000318AC);
    *(_QWORD *)(v0 + 400) = v74;
    *v74 = v0;
    v74[1] = sub_1000127E4;
    return sub_10001301C(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120), 0, 0xF000000000000000);
  }
}

uint64_t sub_100011764()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 296));
  return swift_task_switch(sub_1000117B0, *(_QWORD *)(v1 + 264), *(_QWORD *)(v1 + 272));
}

uint64_t sub_1000117B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
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
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t Strong;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  _BOOL4 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint8_t *v60;
  uint64_t v61;
  unint64_t v62;
  _BYTE *v63;
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
  uint64_t v76[2];

  v2 = v1 + 72;
  v3 = *(_QWORD *)(v1 + 288);
  v4 = *(_QWORD *)(v1 + 232);
  v6 = *(_QWORD *)(v1 + 208);
  v5 = *(_QWORD *)(v1 + 216);
  v7 = MessageDetails.thumbnailData.getter(a1);
  v9 = v8;
  swift_unknownObjectRelease(v3);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (v9 >> 60 != 15)
  {
    sub_1000062B8(v7, v9);
    v10 = MessageDetails.thumbnailData.setter(v7, v9);
  }
  *(_QWORD *)(v1 + 304) = v7;
  *(_QWORD *)(v1 + 312) = v9;
  v11 = *(_QWORD *)(v1 + 280);
  static Task<>.checkCancellation()(v10);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)(v1 + 240);
    v15 = *(_QWORD *)(v1 + 208);
    v14 = *(_QWORD *)(v1 + 216);
    v16 = sub_100013BA4(*(_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 112), "%s has been deactivated prior to loading message status!");
  }
  else
  {
    Strong = swift_unknownObjectWeakLoadStrong(*(_QWORD *)(v1 + 128) + 32);
    *(_QWORD *)(v1 + 320) = Strong;
    if (Strong)
    {
      v47 = *(_QWORD *)(v1 + 248);
      *(_QWORD *)(v1 + 328) = static MainActor.shared.getter(Strong);
      v48 = dispatch thunk of Actor.unownedExecutor.getter(v47, &protocol witness table for MainActor);
      *(_QWORD *)(v1 + 336) = v48;
      *(_QWORD *)(v1 + 344) = v49;
      return swift_task_switch(sub_100011DFC, v48, v49);
    }
    v51 = *(_QWORD *)(v1 + 112);
    static PeopleLogger.messages.getter(0);
    v52 = swift_bridgeObjectRetain_n(v51, 2);
    v53 = Logger.logObject.getter(v52);
    v54 = static os_log_type_t.debug.getter();
    v55 = os_log_type_enabled(v53, v54);
    v56 = *(_QWORD *)(v1 + 184);
    v57 = *(_QWORD *)(v1 + 160);
    v58 = *(_QWORD *)(v1 + 168);
    v59 = *(_QWORD *)(v1 + 112);
    if (v55)
    {
      v65 = *(_QWORD *)(v1 + 104);
      v71 = *(_QWORD *)(v1 + 168);
      v60 = (uint8_t *)swift_slowAlloc(12, -1);
      v68 = v57;
      v61 = swift_slowAlloc(32, -1);
      v76[0] = v61;
      *(_DWORD *)v60 = 136315138;
      swift_bridgeObjectRetain(v59);
      *(_QWORD *)(v1 + 72) = sub_10000608C(v65, v59, v76);
      v2 = v1 + 72;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 72, v1 + 80, v60 + 4, v60 + 12);
      swift_bridgeObjectRelease_n(v59, 3);
      _os_log_impl((void *)&_mh_execute_header, v53, v54, "%s messageStatusProvider == nil", v60, 0xCu);
      swift_arrayDestroy(v61, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v61, -1, -1);
      swift_slowDealloc(v60, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v56, v68);
    }
    else
    {
      swift_bridgeObjectRelease_n(*(_QWORD *)(v1 + 112), 2);

      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v56, v57);
    }
    v13 = *(_QWORD *)(v1 + 240);
    v15 = *(_QWORD *)(v1 + 208);
    v14 = *(_QWORD *)(v1 + 216);
    v62 = sub_1000139C4();
    v16 = swift_allocError(&type metadata for MessageDetailsLoaderError, v62, 0, 0);
    v12 = v16;
    *v63 = 3;
  }
  swift_willThrow(v16);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  *(_QWORD *)(v1 + 384) = v7;
  *(_QWORD *)(v1 + 392) = v9;
  *(_QWORD *)(v1 + 376) = v12;
  v17 = *(_QWORD *)(v1 + 152);
  v18 = *(_QWORD *)(v1 + 136);
  *(_QWORD *)(v1 + 56) = v12;
  swift_errorRetain(v12);
  v19 = sub_100003CB4(&qword_1000316F8);
  v20 = swift_dynamicCast(v17, v1 + 56, v19, v18, 6);
  if ((_DWORD)v20)
  {
    v22 = *(_QWORD *)(v1 + 232);
    v21 = *(_QWORD *)(v1 + 240);
    v23 = *(_QWORD *)(v1 + 224);
    v66 = *(_QWORD *)(v1 + 200);
    v69 = *(_QWORD *)(v1 + 192);
    v72 = *(_QWORD *)(v1 + 184);
    v74 = *(_QWORD *)(v1 + 176);
    v24 = v9;
    v26 = *(_QWORD *)(v1 + 144);
    v25 = *(_QWORD *)(v1 + 152);
    v27 = *(_QWORD *)(v1 + 136);
    swift_release(*(_QWORD *)(v1 + 256));
    v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
    swift_willThrow(v28);
    sub_10000E320(v7, v24);
    swift_task_dealloc(v21);
    swift_task_dealloc(v22);
    swift_task_dealloc(v23);
    swift_task_dealloc(v66);
    swift_task_dealloc(v69);
    swift_task_dealloc(v72);
    swift_task_dealloc(v74);
    swift_task_dealloc(v25);
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
  else
  {
    v75 = v2;
    v30 = *(_QWORD *)(v1 + 112);
    static PeopleLogger.messages.getter(v20);
    swift_bridgeObjectRetain(v30);
    swift_errorRetain(v12);
    swift_bridgeObjectRetain(v30);
    v31 = swift_errorRetain(v12);
    v32 = Logger.logObject.getter(v31);
    v33 = static os_log_type_t.debug.getter();
    v34 = os_log_type_enabled(v32, v33);
    v36 = *(_QWORD *)(v1 + 168);
    v35 = *(_QWORD *)(v1 + 176);
    v37 = *(_QWORD *)(v1 + 160);
    v38 = *(_QWORD *)(v1 + 112);
    if (v34)
    {
      v70 = *(_QWORD *)(v1 + 176);
      v73 = v7;
      v39 = v9;
      v40 = *(_QWORD *)(v1 + 104);
      v67 = *(_QWORD *)(v1 + 168);
      v41 = swift_slowAlloc(22, -1);
      v64 = swift_slowAlloc(64, -1);
      v76[0] = v64;
      *(_DWORD *)v41 = 136315394;
      swift_bridgeObjectRetain(v38);
      v42 = v40;
      v9 = v39;
      v7 = v73;
      *(_QWORD *)(v1 + 40) = sub_10000608C(v42, v38, v76);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 40, v1 + 48, v41 + 4, v41 + 12);
      swift_bridgeObjectRelease_n(v38, 3);
      *(_WORD *)(v41 + 12) = 2080;
      swift_getErrorValue(v12, v1 + 48, v1 + 16);
      v43 = Error.localizedDescription.getter(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
      v45 = v44;
      *(_QWORD *)(v1 + 64) = sub_10000608C(v43, v44, v76);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 64, v75, v41 + 14, v41 + 22);
      swift_bridgeObjectRelease(v45);
      swift_errorRelease(v12);
      swift_errorRelease(v12);
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "%s failed load details %s, using fallback", (uint8_t *)v41, 0x16u);
      swift_arrayDestroy(v64, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v64, -1, -1);
      swift_slowDealloc(v41, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v70, v37);
    }
    else
    {
      swift_bridgeObjectRelease_n(*(_QWORD *)(v1 + 112), 2);
      swift_errorRelease(v12);
      swift_errorRelease(v12);

      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
    }
    v50 = (_QWORD *)swift_task_alloc(dword_1000318AC);
    *(_QWORD *)(v1 + 400) = v50;
    *v50 = v1;
    v50[1] = sub_1000127E4;
    return sub_10001301C(*(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 120), v7, v9);
  }
}

uint64_t sub_100011DFC()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = (uint64_t *)(v0[40] + OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID);
  v3 = *v1;
  v2 = v1[1];
  v0[44] = v2;
  v4 = async function pointer to static AskToBuySupport.getDetailsWithDetails(withDetails:forId:)[1];
  swift_bridgeObjectRetain(v2);
  v5 = (_QWORD *)swift_task_alloc(v4);
  v0[45] = v5;
  *v5 = v0;
  v5[1] = sub_100011E88;
  return static AskToBuySupport.getDetailsWithDetails(withDetails:forId:)(v0[28], v0[30], v3, v2);
}

uint64_t sub_100011E88()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 360);
  *(_QWORD *)(*(_QWORD *)v1 + 368) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = v2[42];
    v5 = v2[43];
    v6 = sub_1000123EC;
  }
  else
  {
    swift_bridgeObjectRelease(v2[44]);
    v4 = v2[42];
    v5 = v2[43];
    v6 = sub_100011EF4;
  }
  return swift_task_switch(v6, v4, v5);
}

uint64_t sub_100011EF4()
{
  _QWORD *v0;

  swift_release(v0[41]);
  return swift_task_switch(sub_100011F2C, v0[33], v0[34]);
}

uint64_t sub_100011F2C()
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
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(void);
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  _QWORD *v57;
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
  uint64_t v68[2];

  v1 = v0[46];
  v2 = v0[27];
  static Task<>.checkCancellation()();
  v3 = v0[40];
  if (!v1)
  {
    v25 = v0[38];
    v24 = v0[39];
    v27 = v0[29];
    v26 = v0[30];
    v29 = v0[27];
    v28 = v0[28];
    v30 = v0[26];
    v67 = v0[12];
    swift_release(v0[32]);
    MessageDetails.updateFromDetails(_:)(v28);
    swift_unknownObjectRelease(v3);
    sub_10000E320(v25, v24);
    v31 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
    v31(v28, v30);
    v31(v26, v30);
    v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32);
    v32(v26, v27, v30);
    v32(v67, v26, v30);
    v33 = v0[29];
    v34 = v0[28];
    v36 = v0[24];
    v35 = v0[25];
    v38 = v0[22];
    v37 = v0[23];
    v39 = v0[19];
    swift_task_dealloc(v0[30]);
    swift_task_dealloc(v33);
    swift_task_dealloc(v34);
    swift_task_dealloc(v35);
    swift_task_dealloc(v36);
    swift_task_dealloc(v37);
    swift_task_dealloc(v38);
    swift_task_dealloc(v39);
    v23 = (uint64_t (*)(void))v0[1];
    return v23();
  }
  v4 = v1;
  v5 = v0[30];
  v6 = v0[28];
  v7 = v0[26];
  v8 = sub_100013BA4(v0[13], v0[14], "%s has been deactivated prior to updating details!");
  swift_willThrow(v8);
  swift_unknownObjectRelease(v3);
  v9 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v9(v6, v7);
  v9(v5, v7);
  v11 = v0[38];
  v10 = v0[39];
  v0[48] = v11;
  v0[49] = v10;
  v0[47] = v1;
  v12 = v0[19];
  v13 = v0[17];
  v0[7] = v1;
  swift_errorRetain(v1);
  v14 = sub_100003CB4(&qword_1000316F8);
  v15 = swift_dynamicCast(v12, v0 + 7, v14, v13, 6);
  if ((_DWORD)v15)
  {
    v17 = v0[29];
    v16 = v0[30];
    v58 = v0[28];
    v60 = v0[25];
    v62 = v0[24];
    v64 = v0[23];
    v66 = v0[22];
    v19 = v0[18];
    v18 = v0[19];
    v20 = v10;
    v21 = v0[17];
    swift_release(v0[32]);
    v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v18, v21);
    swift_willThrow(v22);
    sub_10000E320(v11, v20);
    swift_task_dealloc(v16);
    swift_task_dealloc(v17);
    swift_task_dealloc(v58);
    swift_task_dealloc(v60);
    swift_task_dealloc(v62);
    swift_task_dealloc(v64);
    swift_task_dealloc(v66);
    swift_task_dealloc(v18);
    v23 = (uint64_t (*)(void))v0[1];
    return v23();
  }
  v41 = v0[14];
  static PeopleLogger.messages.getter(v15);
  swift_bridgeObjectRetain(v41);
  swift_errorRetain(v4);
  swift_bridgeObjectRetain(v41);
  v42 = swift_errorRetain(v4);
  v43 = Logger.logObject.getter(v42);
  v44 = static os_log_type_t.debug.getter();
  v45 = os_log_type_enabled(v43, v44);
  v47 = v0[21];
  v46 = v0[22];
  v48 = v0[20];
  v49 = v0[14];
  if (v45)
  {
    v63 = v0[20];
    v65 = v0[22];
    v50 = v11;
    v51 = v0[13];
    v61 = v0[21];
    v52 = swift_slowAlloc(22, -1);
    v59 = swift_slowAlloc(64, -1);
    *(_DWORD *)v52 = 136315394;
    v68[0] = v59;
    swift_bridgeObjectRetain(v49);
    v53 = v51;
    v11 = v50;
    v0[5] = sub_10000608C(v53, v49, v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 5, v0 + 6, v52 + 4, v52 + 12);
    swift_bridgeObjectRelease_n(v49, 3);
    *(_WORD *)(v52 + 12) = 2080;
    swift_getErrorValue(v4, v0 + 6, v0 + 2);
    v54 = Error.localizedDescription.getter(v0[3], v0[4]);
    v56 = v55;
    v0[8] = sub_10000608C(v54, v55, v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 8, v0 + 9, v52 + 14, v52 + 22);
    swift_bridgeObjectRelease(v56);
    swift_errorRelease(v4);
    swift_errorRelease(v4);
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "%s failed load details %s, using fallback", (uint8_t *)v52, 0x16u);
    swift_arrayDestroy(v59, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v59, -1, -1);
    swift_slowDealloc(v52, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v65, v63);
  }
  else
  {
    swift_bridgeObjectRelease_n(v0[14], 2);
    swift_errorRelease(v4);
    swift_errorRelease(v4);

    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v46, v48);
  }
  v57 = (_QWORD *)swift_task_alloc(dword_1000318AC);
  v0[50] = v57;
  *v57 = v0;
  v57[1] = sub_1000127E4;
  return sub_10001301C(v0[12], v0[15], v11, v10);
}

uint64_t sub_1000123EC()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[41];
  swift_bridgeObjectRelease(v0[44]);
  swift_release(v1);
  return swift_task_switch(sub_100012430, v0[33], v0[34]);
}

uint64_t sub_100012430()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
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
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44[2];

  v1 = *(_QWORD *)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 216);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 320));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  v4 = *(_QWORD *)(v0 + 368);
  *(_QWORD *)(v0 + 56) = v4;
  v6 = *(_QWORD *)(v0 + 304);
  v5 = *(_QWORD *)(v0 + 312);
  *(_QWORD *)(v0 + 384) = v6;
  *(_QWORD *)(v0 + 392) = v5;
  *(_QWORD *)(v0 + 376) = v4;
  v7 = *(_QWORD *)(v0 + 152);
  v8 = *(_QWORD *)(v0 + 136);
  swift_errorRetain(v4);
  v9 = sub_100003CB4(&qword_1000316F8);
  v10 = swift_dynamicCast(v7, v0 + 56, v9, v8, 6);
  if ((_DWORD)v10)
  {
    v12 = *(_QWORD *)(v0 + 232);
    v11 = *(_QWORD *)(v0 + 240);
    v13 = *(_QWORD *)(v0 + 224);
    v37 = *(_QWORD *)(v0 + 200);
    v38 = *(_QWORD *)(v0 + 192);
    v40 = *(_QWORD *)(v0 + 184);
    v42 = *(_QWORD *)(v0 + 176);
    v14 = *(_QWORD *)(v0 + 144);
    v15 = *(_QWORD *)(v0 + 152);
    v16 = *(_QWORD *)(v0 + 136);
    swift_release(*(_QWORD *)(v0 + 256));
    v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v15, v16);
    swift_willThrow(v17);
    sub_10000E320(v6, v5);
    swift_task_dealloc(v11);
    swift_task_dealloc(v12);
    swift_task_dealloc(v13);
    swift_task_dealloc(v37);
    swift_task_dealloc(v38);
    swift_task_dealloc(v40);
    swift_task_dealloc(v42);
    swift_task_dealloc(v15);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v19 = *(_QWORD *)(v0 + 112);
    static PeopleLogger.messages.getter(v10);
    swift_bridgeObjectRetain(v19);
    swift_errorRetain(v4);
    swift_bridgeObjectRetain(v19);
    v20 = swift_errorRetain(v4);
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.debug.getter();
    v23 = os_log_type_enabled(v21, v22);
    v24 = *(_QWORD *)(v0 + 176);
    v43 = *(_QWORD *)(v0 + 168);
    v25 = *(_QWORD *)(v0 + 160);
    v26 = *(_QWORD *)(v0 + 112);
    if (v23)
    {
      v39 = *(_QWORD *)(v0 + 176);
      v27 = v5;
      v28 = *(_QWORD *)(v0 + 104);
      v41 = v6;
      v29 = swift_slowAlloc(22, -1);
      v36 = swift_slowAlloc(64, -1);
      v44[0] = v36;
      *(_DWORD *)v29 = 136315394;
      swift_bridgeObjectRetain(v26);
      v30 = v28;
      v5 = v27;
      *(_QWORD *)(v0 + 40) = sub_10000608C(v30, v26, v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v29 + 4, v29 + 12);
      swift_bridgeObjectRelease_n(v26, 3);
      *(_WORD *)(v29 + 12) = 2080;
      swift_getErrorValue(v4, v0 + 48, v0 + 16);
      v31 = Error.localizedDescription.getter(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
      v33 = v32;
      *(_QWORD *)(v0 + 64) = sub_10000608C(v31, v32, v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72, v29 + 14, v29 + 22);
      swift_bridgeObjectRelease(v33);
      swift_errorRelease(v4);
      swift_errorRelease(v4);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "%s failed load details %s, using fallback", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy(v36, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v36, -1, -1);
      v34 = v29;
      v6 = v41;
      swift_slowDealloc(v34, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v39, v25);
    }
    else
    {
      swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 112), 2);
      swift_errorRelease(v4);
      swift_errorRelease(v4);

      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v24, v25);
    }
    v35 = (_QWORD *)swift_task_alloc(dword_1000318AC);
    *(_QWORD *)(v0 + 400) = v35;
    *v35 = v0;
    v35[1] = sub_1000127E4;
    return sub_10001301C(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120), v6, v5);
  }
}

uint64_t sub_1000127E4()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 400));
  return swift_task_switch(sub_100012830, *(_QWORD *)(v1 + 264), *(_QWORD *)(v1 + 272));
}

uint64_t sub_100012830()
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

  v1 = *(_QWORD *)(v0 + 376);
  v2 = *(_QWORD *)(v0 + 256);
  sub_10000E320(*(_QWORD *)(v0 + 384), *(_QWORD *)(v0 + 392));
  swift_release(v2);
  swift_errorRelease(v1);
  v3 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 224);
  v6 = *(_QWORD *)(v0 + 192);
  v5 = *(_QWORD *)(v0 + 200);
  v8 = *(_QWORD *)(v0 + 176);
  v7 = *(_QWORD *)(v0 + 184);
  v9 = *(_QWORD *)(v0 + 152);
  swift_task_dealloc(*(_QWORD *)(v0 + 240));
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000128E4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(char *, uint64_t);
  uint64_t v23;
  char *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t result;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(char *, uint64_t);
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v7 = type metadata accessor for Logger(0);
  v53 = *(uint64_t (**)(char *, uint64_t))(v7 - 8);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v59 = (char *)&v51 - v12;
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v51 - v14;
  static PeopleLogger.messages.getter(v13);
  v16 = swift_bridgeObjectRetain_n(a3, 2);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.info.getter();
  v19 = os_log_type_enabled(v17, v18);
  v57 = a2;
  v58 = v10;
  v55 = a1;
  v56 = v3;
  if (v19)
  {
    v52 = v7;
    v20 = (uint8_t *)swift_slowAlloc(12, -1);
    v21 = swift_slowAlloc(32, -1);
    v62 = v21;
    *(_DWORD *)v20 = 136315138;
    swift_bridgeObjectRetain(a3);
    v60 = sub_10000608C(a2, a3, &v62);
    v7 = v52;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v20 + 4, v20 + 12);
    swift_bridgeObjectRelease_n(a3, 3);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "%s - Finished background loading details ignoring cache!", v20, 0xCu);
    swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v21, -1, -1);
    swift_slowDealloc(v20, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a3, 2);
  }
  v22 = (uint64_t (*)(char *, uint64_t))*((_QWORD *)v53 + 1);
  v23 = v22(v15, v7);
  v24 = v59;
  static PeopleLogger.messages.getter(v23);
  v25 = swift_bridgeObjectRetain_n(a3, 2);
  v26 = Logger.logObject.getter(v25);
  v27 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = swift_slowAlloc(22, -1);
    v29 = swift_slowAlloc(64, -1);
    v53 = v22;
    v30 = v29;
    v62 = v29;
    *(_DWORD *)v28 = 136315394;
    swift_bridgeObjectRetain(a3);
    v31 = v57;
    v60 = sub_10000608C(v57, a3, &v62);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v28 + 4, v28 + 12);
    swift_bridgeObjectRelease_n(a3, 3);
    *(_WORD *)(v28 + 12) = 2080;
    v60 = sub_10000608C(0xD000000000000019, 0x80000001000244F0, &v62);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v28 + 14, v28 + 22);
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "%s %s - Caching message details...", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy(v30, 2, (char *)&type metadata for Any + 8);
    v32 = v30;
    v22 = v53;
    swift_slowDealloc(v32, -1, -1);
    swift_slowDealloc(v28, -1, -1);

    v22(v59, v7);
  }
  else
  {

    swift_bridgeObjectRelease_n(a3, 2);
    v22(v24, v7);
    v31 = v57;
  }
  v34 = v55;
  v33 = v56;
  v35 = v54[9];
  v36 = v54[10];
  sub_10000E528(v54 + 6, v35);
  result = dispatch thunk of MessageDetailsCacheProtocol.save(messageDetails:for:)(v34, v31, a3, v35, v36);
  v38 = v33;
  if (v33)
  {
    v39 = v58;
    static PeopleLogger.messages.getter(result);
    swift_bridgeObjectRetain(a3);
    swift_errorRetain(v33);
    swift_bridgeObjectRetain(a3);
    v40 = swift_errorRetain(v33);
    v41 = Logger.logObject.getter(v40);
    v42 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc(22, -1);
      v52 = v7;
      v44 = v43;
      v45 = swift_slowAlloc(8, -1);
      v59 = 0;
      v46 = (_QWORD *)v45;
      v47 = v31;
      v48 = swift_slowAlloc(32, -1);
      v62 = v48;
      *(_DWORD *)v44 = 136315394;
      swift_bridgeObjectRetain(a3);
      v60 = sub_10000608C(v47, a3, &v62);
      v53 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v44 + 4, v44 + 12);
      swift_bridgeObjectRelease_n(a3, 3);
      *(_WORD *)(v44 + 12) = 2112;
      swift_errorRetain(v38);
      v49 = _swift_stdlib_bridgeErrorToNSError(v38);
      v60 = v49;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v44 + 14, v44 + 22);
      *v46 = v49;
      swift_errorRelease(v38);
      swift_errorRelease(v38);
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "%s - Error saving message details to cache! %@", (uint8_t *)v44, 0x16u);
      v50 = sub_100003CB4(&qword_100031700);
      swift_arrayDestroy(v46, 1, v50);
      swift_slowDealloc(v46, -1, -1);
      swift_arrayDestroy(v48, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v48, -1, -1);
      swift_slowDealloc(v44, -1, -1);

      swift_errorRelease(v38);
      return v53(v58, v52);
    }
    else
    {
      swift_errorRelease(v33);
      swift_bridgeObjectRelease_n(a3, 2);
      swift_errorRelease(v33);
      swift_errorRelease(v33);

      return v22(v39, v7);
    }
  }
  return result;
}

uint64_t sub_100012EEC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_100006C90(a1, &qword_1000314A8);
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
  v17 = type metadata accessor for MessageDetails(0);
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v8, v18, v17, a2, a3);
}

uint64_t sub_10001301C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
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
  uint64_t v16;
  uint64_t v17;

  v5[29] = a4;
  v5[30] = v4;
  v5[27] = a2;
  v5[28] = a3;
  v5[26] = a1;
  v6 = type metadata accessor for ResolvedFamily(0);
  v5[31] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[32] = v7;
  v5[33] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (*(_QWORD *)(*(_QWORD *)(sub_100003CB4(&qword_100031870) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[34] = swift_task_alloc(v8);
  v5[35] = swift_task_alloc(v8);
  v5[36] = swift_task_alloc(v8);
  v9 = type metadata accessor for MessageDetails.EventStatus(0);
  v5[37] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v5[38] = v10;
  v5[39] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Logger(0);
  v5[40] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v5[41] = v12;
  v5[42] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for MessageDetails(0);
  v5[43] = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v5[44] = v14;
  v5[45] = swift_task_alloc((*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for MainActor(0);
  v5[46] = static MainActor.shared.getter(v15);
  v16 = dispatch thunk of Actor.unownedExecutor.getter(v15, &protocol witness table for MainActor);
  v5[47] = v16;
  v5[48] = v17;
  return swift_task_switch(sub_100013170, v16, v17);
}

uint64_t sub_100013170()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t Strong;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
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
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
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
  os_log_type_t type;
  NSObject *log;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v1 = *(_QWORD *)(v0 + 360);
  v2 = *(_QWORD *)(v0 + 344);
  v3 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 216);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 352) + 16);
  *(_QWORD *)(v0 + 392) = v5;
  v6 = v5(v1, v4, v2);
  if (v3 >> 60 == 15)
  {
    v7 = MessageDetails.thumbnailData.getter(v6);
    v9 = v8;
    sub_10000E320(v7, v8);
    if (v9 >> 60 == 15)
    {
      Strong = swift_unknownObjectWeakLoadStrong(*(_QWORD *)(v0 + 240) + 16);
      if (Strong)
      {
        v11 = Strong;
        if (qword_1000312D0 != -1)
          swift_once(&qword_1000312D0, sub_100007198);
        v13 = qword_100032A88;
        v12 = qword_100032A90;
        sub_10000E334(qword_100032A88, qword_100032A90);
        swift_unknownObjectRelease(v11);
        if (v12 >> 60 != 15)
        {
          sub_1000062B8(v13, v12);
          v14 = MessageDetails.thumbnailData.setter(v13, v12);
          v15 = static PeopleLogger.messages.getter(v14);
          v16 = Logger.logObject.getter(v15);
          v17 = static os_log_type_t.info.getter();
          if (os_log_type_enabled(v16, v17))
          {
            type = v17;
            v18 = *(_QWORD *)(v0 + 360);
            v58 = *(_QWORD *)(v0 + 328);
            v59 = *(_QWORD *)(v0 + 320);
            v60 = *(_QWORD *)(v0 + 336);
            log = v16;
            v19 = (uint8_t *)swift_slowAlloc(12, -1);
            v57 = swift_slowAlloc(32, -1);
            v61 = v57;
            *(_DWORD *)v19 = 136315138;
            v20 = swift_beginAccess(v18, v0 + 176, 32, 0);
            v21 = MessageDetails.requestID.getter(v20);
            v23 = v22;
            swift_endAccess(v0 + 176);
            *(_QWORD *)(v0 + 200) = sub_10000608C(v21, v23, &v61);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 200, v0 + 208, v19 + 4, v19 + 12);
            swift_bridgeObjectRelease(v23);
            _os_log_impl((void *)&_mh_execute_header, log, type, "%s - using fallback icon (2)", v19, 0xCu);
            swift_arrayDestroy(v57, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v57, -1, -1);
            swift_slowDealloc(v19, -1, -1);

            sub_10000E320(v13, v12);
            (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v60, v59);
          }
          else
          {
            v53 = *(_QWORD *)(v0 + 328);
            v52 = *(_QWORD *)(v0 + 336);
            v54 = *(_QWORD *)(v0 + 320);
            sub_10000E320(v13, v12);

            (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v54);
          }
        }
      }
    }
  }
  else
  {
    v25 = *(_QWORD *)(v0 + 224);
    v24 = *(_QWORD *)(v0 + 232);
    sub_1000062B8(v25, v24);
    MessageDetails.thumbnailData.setter(v25, v24);
  }
  v26 = *(_QWORD *)(v0 + 360);
  v27 = *(_QWORD *)(v0 + 312);
  v28 = *(_QWORD *)(v0 + 288);
  v29 = *(_QWORD *)(v0 + 248);
  v30 = *(_QWORD *)(v0 + 256);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 304) + 104))(v27, enum case for MessageDetails.EventStatus.purged(_:), *(_QWORD *)(v0 + 296));
  swift_beginAccess(v26, v0 + 104, 33, 0);
  MessageDetails.status.setter(v27);
  swift_endAccess(v0 + 104);
  v31 = swift_beginAccess(v26, v0 + 56, 32, 0);
  MessageDetails.family.getter(v31);
  swift_endAccess(v0 + 56);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29) == 1)
  {
    v32 = *(_QWORD *)(v0 + 360);
    sub_100006C90(*(_QWORD *)(v0 + 288), &qword_100031870);
    v33 = swift_beginAccess(v32, v0 + 80, 32, 0);
    v34 = MessageDetails.userDSID.getter(v33);
    if ((v35 & 1) == 0)
    {
      v36 = v34;
      swift_endAccess(v0 + 80);
      sub_100013D70();
      v37 = type metadata accessor for ContactFetcher(0);
      v38 = ContactFetcher.__allocating_init()();
      *(_QWORD *)(v0 + 40) = v37;
      *(_QWORD *)(v0 + 48) = &protocol witness table for ContactFetcher;
      *(_QWORD *)(v0 + 16) = v38;
      v39 = (_QWORD *)swift_task_alloc(async function pointer to static FAFamilyCircle.resolveFamily(userDSID:actionUserDSID:withContactFetcher:useCache:)[1]);
      *(_QWORD *)(v0 + 400) = v39;
      *v39 = v0;
      v39[1] = sub_10001364C;
      return static FAFamilyCircle.resolveFamily(userDSID:actionUserDSID:withContactFetcher:useCache:)(*(_QWORD *)(v0 + 280), v36, 0, 1, v0 + 16, 1);
    }
    v42 = *(_QWORD *)(v0 + 368);
    swift_endAccess(v0 + 80);
    swift_release(v42);
  }
  else
  {
    v41 = *(_QWORD *)(v0 + 288);
    swift_release(*(_QWORD *)(v0 + 368));
    sub_100006C90(v41, &qword_100031870);
  }
  v44 = *(_QWORD *)(v0 + 352);
  v43 = *(_QWORD *)(v0 + 360);
  v46 = *(_QWORD *)(v0 + 336);
  v45 = *(_QWORD *)(v0 + 344);
  v47 = *(_QWORD *)(v0 + 312);
  v49 = *(_QWORD *)(v0 + 280);
  v48 = *(_QWORD *)(v0 + 288);
  v51 = *(_QWORD *)(v0 + 264);
  v50 = *(_QWORD *)(v0 + 272);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 392))(*(_QWORD *)(v0 + 208), v43, v45);
  (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v43, v45);
  swift_task_dealloc(v43);
  swift_task_dealloc(v46);
  swift_task_dealloc(v47);
  swift_task_dealloc(v48);
  swift_task_dealloc(v49);
  swift_task_dealloc(v50);
  swift_task_dealloc(v51);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001364C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v2 = *(_QWORD **)v1;
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v1 + 400));
  if (v0)
  {
    swift_errorRelease(v0);
    v3 = v2[47];
    v4 = v2[48];
    v5 = sub_100013864;
  }
  else
  {
    sub_100006EA0(v2 + 2);
    v3 = v2[47];
    v4 = v2[48];
    v5 = sub_1000136BC;
  }
  return swift_task_switch(v5, v3, v4);
}

uint64_t sub_1000136BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
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

  v1 = *(_QWORD *)(v0 + 360);
  v3 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v0 + 280);
  v5 = *(_QWORD *)(v0 + 256);
  v4 = *(_QWORD *)(v0 + 264);
  v6 = *(_QWORD *)(v0 + 248);
  swift_release(*(_QWORD *)(v0 + 368));
  v7 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56);
  v7(v2, 0, 1, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v4, v2, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v4, v6);
  v7(v3, 0, 1, v6);
  swift_beginAccess(v1, v0 + 128, 33, 0);
  MessageDetails.family.setter(v3);
  v8 = swift_endAccess(v0 + 128);
  v9 = (void *)ResolvedFamily.requestingFamilyMember.getter(v8);
  v10 = FAFamilyMember.displayNameWithFallback.getter();
  v12 = v11;

  swift_beginAccess(v1, v0 + 152, 33, 0);
  MessageDetails.childName.setter(v10, v12);
  swift_endAccess(v0 + 152);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v14 = *(_QWORD *)(v0 + 352);
  v13 = *(_QWORD *)(v0 + 360);
  v16 = *(_QWORD *)(v0 + 336);
  v15 = *(_QWORD *)(v0 + 344);
  v17 = *(_QWORD *)(v0 + 312);
  v19 = *(_QWORD *)(v0 + 280);
  v18 = *(_QWORD *)(v0 + 288);
  v21 = *(_QWORD *)(v0 + 264);
  v20 = *(_QWORD *)(v0 + 272);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 392))(*(_QWORD *)(v0 + 208), v13, v15);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_task_dealloc(v13);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100013864()
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

  v1 = *(_QWORD *)(v0 + 280);
  v2 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD *)(v0 + 256);
  swift_release(*(_QWORD *)(v0 + 368));
  sub_100006EA0((_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  sub_100006C90(v1, &qword_100031870);
  v5 = *(_QWORD *)(v0 + 352);
  v4 = *(_QWORD *)(v0 + 360);
  v7 = *(_QWORD *)(v0 + 336);
  v6 = *(_QWORD *)(v0 + 344);
  v8 = *(_QWORD *)(v0 + 312);
  v10 = *(_QWORD *)(v0 + 280);
  v9 = *(_QWORD *)(v0 + 288);
  v12 = *(_QWORD *)(v0 + 264);
  v11 = *(_QWORD *)(v0 + 272);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 392))(*(_QWORD *)(v0 + 208), v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc(v4);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100013960()
{
  _QWORD *v0;

  sub_10000E610((uint64_t)(v0 + 2));
  sub_10000E610((uint64_t)(v0 + 4));
  sub_100006EA0(v0 + 6);
  sub_100006EA0(v0 + 11);
  swift_release(v0[16]);
  return swift_deallocClassInstance(v0, 136, 7);
}

uint64_t type metadata accessor for MessageDetailsLoader()
{
  return objc_opt_self(_TtC22PeopleMessagesAskToBuy20MessageDetailsLoader);
}

unint64_t sub_1000139C4()
{
  unint64_t result;

  result = qword_100031880;
  if (!qword_100031880)
  {
    result = swift_getWitnessTable(&unk_100025674, &type metadata for MessageDetailsLoaderError);
    atomic_store(result, (unint64_t *)&qword_100031880);
  }
  return result;
}

uint64_t sub_100013A08(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100003CB4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100013A4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for URL(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v6 + 8));
  return swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_100013AE8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v4 = *(_QWORD *)(type metadata accessor for URL(0) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v1[2];
  v7 = v1[3];
  v8 = v1[4];
  v9 = (uint64_t)v1 + v5;
  v10 = (_QWORD *)((char *)v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v11 = *v10;
  v12 = v10[1];
  v13 = (_QWORD *)swift_task_alloc(dword_100031894);
  *(_QWORD *)(v2 + 16) = v13;
  *v13 = v2;
  v13[1] = sub_100006270;
  return sub_1000108A0(a1, v6, v7, v8, v9, v11, v12);
}

uint64_t sub_100013BA4(uint64_t a1, unint64_t a2, const char *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.messages.getter(v8);
  v11 = swift_bridgeObjectRetain_n(a2, 2);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v19 = a3;
    v14 = swift_slowAlloc(12, -1);
    v20 = v6;
    v15 = a1;
    v16 = (uint8_t *)v14;
    v17 = swift_slowAlloc(32, -1);
    v22 = v17;
    *(_DWORD *)v16 = 136315138;
    swift_bridgeObjectRetain(a2);
    v21 = sub_10000608C(v15, a2, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v16 + 4, v16 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, v19, v16, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v16, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v20);
  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
}

unint64_t sub_100013D70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000318B0;
  if (!qword_1000318B0)
  {
    v1 = objc_opt_self(FAFamilyCircle);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000318B0);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for MessageDetailsLoaderError(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MessageDetailsLoaderError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MessageDetailsLoaderError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100013E94 + 4 * byte_100025555[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100013EC8 + 4 * byte_100025550[v4]))();
}

uint64_t sub_100013EC8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013ED0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100013ED8);
  return result;
}

uint64_t sub_100013EE4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100013EECLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_100013EF0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013EF8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013F04(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100013F10(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MessageDetailsLoaderError()
{
  return &type metadata for MessageDetailsLoaderError;
}

unint64_t sub_100013F2C()
{
  unint64_t result;

  result = qword_1000318B8;
  if (!qword_1000318B8)
  {
    result = swift_getWitnessTable(&unk_10002564C, &type metadata for MessageDetailsLoaderError);
    atomic_store(result, (unint64_t *)&qword_1000318B8);
  }
  return result;
}

uint64_t sub_100013F70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v10[5];

  v0 = type metadata accessor for MessageDetails.EventSource(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v10[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for AppStateStore();
  v5 = swift_allocObject(v4, 32, 7);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for MessageDetails.EventSource.askToBuy(_:), v0);
  v6 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  v10[3] = sub_100015188();
  v10[4] = &protocol witness table for NSFileManager;
  v10[0] = v6;
  v7 = type metadata accessor for MessageDetailsCache(0);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  *(_QWORD *)(v5 + 16) = MessageDetailsCache.init(statusSource:fileManager:)(v3, v10);
  type metadata accessor for ResolvedFamilyCache(0);
  result = ResolvedFamilyCache.__allocating_init(usePersistentCache:)(1);
  *(_QWORD *)(v5 + 24) = result;
  qword_100032BB8 = v5;
  return result;
}

uint64_t sub_100014088()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for AppStateStore()
{
  return objc_opt_self(_TtC22PeopleMessagesAskToBuy13AppStateStore);
}

uint64_t sub_1000140D4(uint64_t a1)
{
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  unint64_t v39;
  char v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  void *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t, uint64_t);
  void (*v49)(char *, uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  char *v58;
  NSObject *v59;
  os_log_type_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _BYTE v82[24];
  char v83[24];
  uint64_t v84[6];

  v79 = a1;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v76 = v2;
  v77 = v3;
  v4 = __chkstk_darwin(v2);
  v70 = (char *)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v4);
  v75 = (char *)&v66 - v7;
  __chkstk_darwin(v6);
  v74 = (char *)&v66 - v8;
  v9 = type metadata accessor for StatusType(0);
  v72 = *(_QWORD *)(v9 - 8);
  v73 = v9;
  __chkstk_darwin(v9);
  v71 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = type metadata accessor for MessageDetails.EventSource(0);
  v11 = *(_QWORD *)(v80 - 8);
  __chkstk_darwin(v80);
  v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = sub_100003CB4(&qword_1000319A8);
  __chkstk_darwin(v78);
  v15 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_100003CB4(&qword_100031708);
  v17 = __chkstk_darwin(v16);
  v19 = (char *)&v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __chkstk_darwin(v17);
  v22 = (char *)&v66 - v21;
  __chkstk_darwin(v20);
  v24 = (char *)&v66 - v23;
  v25 = (uint64_t)&v1[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_eventNotifier];
  swift_beginAccess(&v1[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_eventNotifier], v83, 0, 0);
  sub_10000E458(v25, (uint64_t)v84, &qword_100031778);
  v26 = v84[3];
  result = sub_100006C90((uint64_t)v84, &qword_100031778);
  if (!v26)
  {
    v69 = v19;
    v67 = v13;
    v66 = v25;
    v68 = v1;
    MessageDetails.eventSource.getter(result);
    v28 = v80;
    (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v22, enum case for MessageDetails.EventSource.askToBuy(_:), v80);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v22, 0, 1, v28);
    v29 = (uint64_t)&v15[*(int *)(v78 + 48)];
    sub_10000E458((uint64_t)v24, (uint64_t)v15, &qword_100031708);
    sub_10000E458((uint64_t)v22, v29, &qword_100031708);
    v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
    v31 = (uint64_t)v15;
    v32 = (uint64_t)v22;
    if (v30((uint64_t)v15, 1, v28) == 1)
    {
      sub_100006C90((uint64_t)v22, &qword_100031708);
      sub_100006C90((uint64_t)v24, &qword_100031708);
      v33 = v30(v29, 1, v28);
      v34 = v76;
      if (v33 == 1)
      {
        v35 = sub_100006C90((uint64_t)v15, &qword_100031708);
        v36 = v77;
LABEL_9:
        v43 = v68;
        if (v68[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_isBubbleActive] == 1)
        {
          v45 = *(_QWORD *)&v68[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
          v44 = *(_QWORD *)&v68[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
          v46 = swift_bridgeObjectRetain(v44);
          v47 = MessageDetails.requestID.getter(v46);
          v49 = v48;
          v51 = v72;
          v50 = v73;
          v52 = (uint64_t)v71;
          (*(void (**)(char *, _QWORD, uint64_t))(v72 + 104))(v71, enum case for StatusType.askToBuyRequest(_:), v73);
          sub_10001C434(v45, v44, v47, v49, v52, (uint64_t)v43, (uint64_t)&off_10002D3E0, v84);
          (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v52, v50);
          swift_bridgeObjectRelease(v44);
          swift_bridgeObjectRelease(v49);
          v65 = v66;
          swift_beginAccess(v66, &v81, 33, 0);
          sub_10000E49C((uint64_t)v84, v65);
          return swift_endAccess(&v81);
        }
        v53 = v74;
        static PeopleLogger.messages.getter(v35);
        v58 = v43;
        v59 = Logger.logObject.getter(v58);
        v60 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v59, v60))
        {
          v61 = swift_slowAlloc(22, -1);
          v62 = swift_slowAlloc(64, -1);
          v84[0] = v62;
          *(_DWORD *)v61 = 136315394;
          v63 = *(_QWORD *)&v58[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID];
          v64 = *(_QWORD *)&v58[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID + 8];
          swift_bridgeObjectRetain(v64);
          v81 = sub_10000608C(v63, v64, v84);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, v82, v61 + 4, v61 + 12);

          swift_bridgeObjectRelease(v64);
          *(_WORD *)(v61 + 12) = 2080;
          v81 = sub_10000608C(0xD00000000000001ELL, 0x80000001000245D0, v84);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, v82, v61 + 14, v61 + 22);
          _os_log_impl((void *)&_mh_execute_header, v59, v60, "%s has been deactivated prior to %s!", (uint8_t *)v61, 0x16u);
          swift_arrayDestroy(v62, 2, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v62, -1, -1);
          swift_slowDealloc(v61, -1, -1);

          return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v74, v34);
        }

        return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v53, v34);
      }
    }
    else
    {
      v37 = (uint64_t)v69;
      sub_10000E458((uint64_t)v15, (uint64_t)v69, &qword_100031708);
      if (v30(v29, 1, v28) != 1)
      {
        v38 = v67;
        (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v67, v29, v28);
        v39 = sub_100015140();
        v40 = dispatch thunk of static Equatable.== infix(_:_:)(v37, v38, v28, v39);
        v41 = v37;
        v42 = *(void (**)(char *, uint64_t))(v11 + 8);
        v42(v38, v28);
        sub_100006C90(v32, &qword_100031708);
        sub_100006C90((uint64_t)v24, &qword_100031708);
        v42((char *)v41, v28);
        v35 = sub_100006C90(v31, &qword_100031708);
        v34 = v76;
        v36 = v77;
        if ((v40 & 1) != 0)
          goto LABEL_9;
LABEL_11:
        v53 = v75;
        v54 = static PeopleLogger.messages.getter(v35);
        v55 = Logger.logObject.getter(v54);
        v56 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v55, v56))
        {
          v57 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v57 = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, v56, "Misconfigured askToBuy details", v57, 2u);
          swift_slowDealloc(v57, -1, -1);
        }

        return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v53, v34);
      }
      sub_100006C90(v32, &qword_100031708);
      sub_100006C90((uint64_t)v24, &qword_100031708);
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v37, v28);
      v34 = v76;
    }
    v35 = sub_100006C90((uint64_t)v15, &qword_1000319A8);
    v36 = v77;
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_1000148BC()
{
  char *v0;
  uint64_t v1;
  objc_super v3;

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for AskToBuyMessageViewController(0);
  objc_msgSendSuper2(&v3, "viewDidLoad");
  *(_QWORD *)&v0[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_bubbleDelegate + 8] = &off_10002D5D0;
  ((void (*)(void))swift_unknownObjectWeakAssign)();
  v1 = *(_QWORD *)&v0[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_messageDetailsLoader];
  *(_QWORD *)(v1 + 40) = &off_10002D5A8;
  swift_unknownObjectWeakAssign(v1 + 32, v0);
  *(_QWORD *)(v1 + 24) = &off_10002D5B8;
  return swift_unknownObjectWeakAssign(v1 + 16, v0);
}

id sub_100014990(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  char *v6;
  uint64_t v7;
  uint64_t PartyApps;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  NSString v14;
  id v15;
  objc_super v17;

  v6 = &v3[OBJC_IVAR____TtC22PeopleMessagesAskToBuy29AskToBuyMessageViewController_fallbackThumbnail];
  v7 = enum case for FirstPartyApps.appstore(_:);
  PartyApps = type metadata accessor for FirstPartyApps(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(PartyApps - 8) + 104))(v6, v7, PartyApps);
  v9 = OBJC_IVAR____TtC22PeopleMessagesAskToBuy29AskToBuyMessageViewController_backgroundColor;
  v10 = qword_100031370;
  v11 = v3;
  if (v10 != -1)
    swift_once(&qword_100031370, sub_10000E8FC);
  v12 = (void *)qword_100032B40;
  *(_QWORD *)&v3[v9] = qword_100032B40;
  v13 = v12;

  if (a2)
  {
    v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v14 = 0;
  }
  v17.receiver = v11;
  v17.super_class = (Class)type metadata accessor for AskToBuyMessageViewController(0);
  v15 = objc_msgSendSuper2(&v17, "initWithNibName:bundle:", v14, a3);

  return v15;
}

void sub_100014CC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t PartyApps;

  v1 = v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy29AskToBuyMessageViewController_fallbackThumbnail;
  PartyApps = type metadata accessor for FirstPartyApps(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(PartyApps - 8) + 8))(v1, PartyApps);

}

id sub_100014D14()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AskToBuyMessageViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100014D98()
{
  return type metadata accessor for AskToBuyMessageViewController(0);
}

uint64_t type metadata accessor for AskToBuyMessageViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_100031990;
  if (!qword_100031990)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AskToBuyMessageViewController);
  return result;
}

uint64_t sub_100014DDC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = type metadata accessor for FirstPartyApps(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    result = swift_updateClassMetadata2(a1, 256, 2, v4, a1 + 352);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_100014E54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t PartyApps;

  v3 = v1 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy29AskToBuyMessageViewController_fallbackThumbnail;
  PartyApps = type metadata accessor for FirstPartyApps(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(PartyApps - 8) + 16))(a1, v3, PartyApps);
}

id sub_100014E98()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy29AskToBuyMessageViewController_backgroundColor);
}

uint64_t sub_100014EA8(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v10 = type metadata accessor for MessageDetails(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v13 + 16))(v12, a1);
  v14 = type metadata accessor for AskToBuyBubble(0);
  swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
  return sub_100017A7C((uint64_t)v12, a2, a3, a4, a5);
}

uint64_t sub_100014F68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v4 = type metadata accessor for MainActor(0);
  v3[5] = static MainActor.shared.getter(v4);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v3[6] = v5;
  v3[7] = v6;
  return swift_task_switch(sub_100014FD8, v5, v6);
}

uint64_t sub_100014FD8()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = (uint64_t *)(v0[4] + OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID);
  v3 = *v1;
  v2 = v1[1];
  v0[8] = v2;
  v4 = async function pointer to static AskToBuySupport.getDetailsWithDetails(withDetails:forId:)[1];
  swift_bridgeObjectRetain(v2);
  v5 = (_QWORD *)swift_task_alloc(v4);
  v0[9] = v5;
  *v5 = v0;
  v5[1] = sub_100015060;
  return static AskToBuySupport.getDetailsWithDetails(withDetails:forId:)(v0[2], v0[3], v3, v2);
}

uint64_t sub_100015060()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = v2[6];
    v5 = v2[7];
    v6 = sub_100015100;
  }
  else
  {
    swift_bridgeObjectRelease(v2[8]);
    v4 = v2[6];
    v5 = v2[7];
    v6 = sub_1000150CC;
  }
  return swift_task_switch(v6, v4, v5);
}

uint64_t sub_1000150CC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100015100()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 64));
  swift_release(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_100015140()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000319B0;
  if (!qword_1000319B0)
  {
    v1 = type metadata accessor for MessageDetails.EventSource(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for MessageDetails.EventSource, v1);
    atomic_store(result, (unint64_t *)&qword_1000319B0);
  }
  return result;
}

unint64_t sub_100015188()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000319B8;
  if (!qword_1000319B8)
  {
    v1 = objc_opt_self(NSFileManager);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000319B8);
  }
  return result;
}

void sub_1000151C4()
{
  qword_1000319C0 = (uint64_t)&_swiftEmptySetSingleton;
}

BOOL sub_1000151D8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  id v3;
  id v4;
  _BOOL8 result;

  v1 = OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer____lazy_storage___isMac;
  v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer____lazy_storage___isMac);
  if (v2 != 2)
    return v2 & 1;
  v3 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  result = v4 == (id)5;
  *(_BYTE *)(v0 + v1) = result;
  return result;
}

uint64_t sub_100015258(uint64_t a1, uint64_t a2)
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

  v4 = type metadata accessor for MessageDetails.EventSource(0);
  v19 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a2 + 16)
    && (v7 = *(_QWORD *)(a2 + 40),
        v8 = sub_100006CE4(&qword_100031B68, (uint64_t (*)(uint64_t))&type metadata accessor for MessageDetails.EventSource, (uint64_t)&protocol conformance descriptor for MessageDetails.EventSource), v9 = dispatch thunk of Hashable._rawHashValue(seed:)(v7, v4, v8), v10 = -1 << *(_BYTE *)(a2 + 32), v11 = v9 & ~v10, ((*(_QWORD *)(a2 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0))
  {
    v12 = ~v10;
    v13 = *(_QWORD *)(v19 + 72);
    v14 = *(void (**)(char *, unint64_t, uint64_t))(v19 + 16);
    do
    {
      v14(v6, *(_QWORD *)(a2 + 48) + v13 * v11, v4);
      v15 = sub_100006CE4((unint64_t *)&qword_1000319B0, (uint64_t (*)(uint64_t))&type metadata accessor for MessageDetails.EventSource, (uint64_t)&protocol conformance descriptor for MessageDetails.EventSource);
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

uint64_t sub_1000153DC()
{
  uint64_t v0;
  uint64_t v1;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  NSObject *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned __int8 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  uint64_t v69;
  int v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;

  v1 = v0;
  v2 = type metadata accessor for MessageDetails.EventStatus(0);
  v73 = *(_QWORD *)(v2 - 8);
  v74 = v2;
  v3 = __chkstk_darwin(v2);
  v72 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v3);
  v71 = (char *)&v68 - v6;
  __chkstk_darwin(v5);
  v8 = (char *)&v68 - v7;
  v9 = sub_100003CB4(&qword_100031870);
  v10 = __chkstk_darwin(v9);
  v75 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)&v68 - v12;
  v79 = type metadata accessor for ResolvedFamily(0);
  v81 = *(_QWORD *)(v79 - 8);
  v14 = __chkstk_darwin(v79);
  v78 = (char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v68 - v16;
  v18 = type metadata accessor for Logger(0);
  v76 = *(_QWORD *)(v18 - 8);
  v77 = v18;
  __chkstk_darwin(v18);
  v20 = (char *)&v68 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_100003CB4(&qword_100031708);
  __chkstk_darwin(v21);
  v23 = (char *)&v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for MessageDetails.EventSource(0);
  v25 = *(_QWORD *)(v24 - 8);
  v26 = __chkstk_darwin(v24);
  v28 = (char *)&v68 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer_details;
  MessageDetails.eventSource.getter(v26);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24) == 1)
  {
    v29 = sub_100006C90((uint64_t)v23, &qword_100031708);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v28, v23, v24);
    if (qword_1000313C0 != -1)
      swift_once(&qword_1000313C0, sub_1000151C4);
    v30 = sub_100015258((uint64_t)v28, qword_1000319C0);
    v29 = (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v28, v24);
    if ((v30 & 1) != 0)
      goto LABEL_23;
  }
  static PeopleLogger.common.getter(v29);
  v31 = swift_retain_n(v1, 6);
  v32 = Logger.logObject.getter(v31);
  v33 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v32, (os_log_type_t)v33))
  {
    v70 = v33;
    v34 = swift_slowAlloc(24, -1);
    v35 = swift_slowAlloc(32, -1);
    v69 = v35;
    v84 = v35;
    *(_DWORD *)v34 = 67109634;
    MessageDetails.family.getter(v35);
    v36 = v81;
    v37 = v79;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v81 + 48))(v13, 1, v79) == 1)
    {
      sub_100006C90((uint64_t)v13, &qword_100031870);
      swift_release(v1);
      v38 = 1;
    }
    else
    {
      v40 = (*(uint64_t (**)(char *, char *, uint64_t))(v36 + 32))(v17, v13, v37);
      v41 = ResolvedFamily.approvers.getter(v40);
      v42 = v41;
      if ((unint64_t)v41 >> 62)
      {
        if (v41 >= 0)
          v41 &= 0xFFFFFFFFFFFFFF8uLL;
        v43 = _CocoaArrayWrapper.endIndex.getter(v41);
      }
      else
      {
        v43 = *(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease(v42);
      v38 = v43 == 0;
      (*(void (**)(char *, uint64_t))(v81 + 8))(v17, v37);
      swift_release(v1);
    }
    LODWORD(v82) = v38;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v82, (char *)&v82 + 4, v34 + 4, v34 + 8);
    swift_release(v1);
    *(_WORD *)(v34 + 8) = 1024;
    v44 = sub_100015AFC();
    swift_release(v1);
    LODWORD(v82) = v44 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v82, (char *)&v82 + 4, v34 + 10, v34 + 14);
    v45 = swift_release(v1);
    *(_WORD *)(v34 + 14) = 2080;
    v46 = MessageDetails.status.getter(v45);
    v47 = MessageDetails.EventStatus.rawValue.getter(v46);
    v49 = v48;
    (*(void (**)(char *, uint64_t))(v73 + 8))(v8, v74);
    v82 = sub_10000608C(v47, v49, &v84);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v82, &v83, v34 + 16, v34 + 24);
    swift_release_n(v1, 2);
    swift_bridgeObjectRelease(v49);
    _os_log_impl((void *)&_mh_execute_header, v32, (os_log_type_t)v70, "[canPresentApprovalActions] familyIsEmpty: %{BOOL}d, amIaParent: %{BOOL}d, details.status: %s", (uint8_t *)v34, 0x18u);
    v50 = v69;
    swift_arrayDestroy(v69, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v50, -1, -1);
    swift_slowDealloc(v34, -1, -1);

    v39 = (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v20, v77);
  }
  else
  {

    swift_release_n(v1, 6);
    v39 = (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v20, v77);
    v37 = v79;
  }
  v51 = (uint64_t)v75;
  MessageDetails.family.getter(v39);
  v52 = v81;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v81 + 48))(v51, 1, v37) == 1)
  {
    sub_100006C90(v51, &qword_100031870);
LABEL_23:
    v64 = 0;
    return v64 & 1;
  }
  v53 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v52 + 32))(v78, v51, v37);
  v54 = ResolvedFamily.approvers.getter(v53);
  v55 = v54;
  if ((unint64_t)v54 >> 62)
  {
    if (v54 >= 0)
      v54 &= 0xFFFFFFFFFFFFFF8uLL;
    v56 = _CocoaArrayWrapper.endIndex.getter(v54);
  }
  else
  {
    v56 = *(_QWORD *)((v54 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v55);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v78, v37);
  if (!v56)
    goto LABEL_23;
  v57 = sub_100015AFC();
  if ((v57 & 1) == 0)
    goto LABEL_23;
  v58 = v71;
  MessageDetails.status.getter(v57);
  v59 = v72;
  v60 = v74;
  (*(void (**)(char *, _QWORD, uint64_t))(v73 + 104))(v72, enum case for MessageDetails.EventStatus.pending(_:), v74);
  v61 = sub_100006CE4(&qword_100031B78, (uint64_t (*)(uint64_t))&type metadata accessor for MessageDetails.EventStatus, (uint64_t)&protocol conformance descriptor for MessageDetails.EventStatus);
  dispatch thunk of RawRepresentable.rawValue.getter(&v84, v60, v61);
  dispatch thunk of RawRepresentable.rawValue.getter(&v82, v60, v61);
  v62 = v85;
  v63 = v83;
  if (v84 == v82 && v85 == v83)
  {
    v64 = 1;
    v63 = v85;
  }
  else
  {
    v64 = _stringCompareWithSmolCheck(_:_:expecting:)(v84, v85, v82, v83, 0);
  }
  swift_bridgeObjectRelease(v62);
  swift_bridgeObjectRelease(v63);
  v66 = v74;
  v67 = *(void (**)(char *, uint64_t))(v73 + 8);
  v67(v59, v74);
  v67(v58, v66);
  return v64 & 1;
}

id sub_100015AFC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;

  v0 = sub_100003CB4(&qword_100031870);
  __chkstk_darwin(v0);
  v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for ResolvedFamily(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MessageDetails.family.getter(v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_100006C90((uint64_t)v2, &qword_100031870);
    return 0;
  }
  v8 = (*(uint64_t (**)(char *, char *, uint64_t))(v4 + 32))(v7, v2, v3);
  v9 = (void *)ResolvedFamily.findMe.getter(v8);
  if (!v9)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    return 0;
  }
  v10 = v9;
  v11 = objc_msgSend(v9, "isParent");

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return v11;
}

uint64_t sub_100015C40(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  Class isa;
  id v15;

  v2 = v1;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer____lazy_storage___isIpad) = 2;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer____lazy_storage___isMac) = 2;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer_contentViewController) = 0;
  v4 = v1 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer_resolvedSize;
  *(_QWORD *)v4 = 0;
  *(_QWORD *)(v4 + 8) = 0;
  *(_BYTE *)(v4 + 16) = 1;
  v5 = v1 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer_details;
  v6 = type metadata accessor for MessageDetails(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, a1, v6);
  v9 = MessageDetails.thumbnailData.getter(v8);
  if (v10 >> 60 == 15)
    v11 = 0;
  else
    v11 = v9;
  if (v10 >> 60 == 15)
    v12 = 0xC000000000000000;
  else
    v12 = v10;
  v13 = objc_allocWithZone((Class)UIImage);
  isa = Data._bridgeToObjectiveC()().super.isa;
  v15 = objc_msgSend(v13, "initWithData:", isa);
  sub_100006198(v11, v12);

  if (!v15)
    v15 = objc_msgSend(objc_allocWithZone((Class)UIImage), "init");
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer_image) = v15;
  return v2;
}

uint64_t sub_100015D8C()
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;
  id v78;
  void *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  unsigned int v89;
  BOOL v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  int v109;
  unsigned int v110;
  BOOL v111;
  unint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  Swift::String_optional v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  id v131;
  unsigned int v132;
  BOOL v133;
  unint64_t v134;
  unint64_t v135;
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
  uint64_t v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;
  char *v155;
  uint64_t v156;
  NSObject *v157;
  os_log_type_t v158;
  uint8_t *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  char *v163;
  char *v164;
  char *v165;
  char *v166;
  char *v167;
  char *v168;
  char *v169;
  uint64_t v170;
  uint64_t v171;
  char *v172;
  uint64_t v173;
  uint64_t v174;
  char *v175;
  char *v176;
  uint64_t v177;
  void (*v178)(char *, _QWORD, uint64_t);
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;

  v1 = type metadata accessor for Logger(0);
  v170 = *(_QWORD *)(v1 - 8);
  v171 = v1;
  v2 = __chkstk_darwin(v1);
  v168 = (char *)&v160 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v167 = (char *)&v160 - v4;
  v5 = sub_100003CB4(&qword_100031708);
  v6 = __chkstk_darwin(v5);
  v161 = (uint64_t)&v160 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v162 = (uint64_t)&v160 - v8;
  v9 = sub_100003CB4(&qword_100031870);
  __chkstk_darwin(v9);
  v172 = (char *)&v160 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for ResolvedFamily(0);
  v173 = *(_QWORD *)(v11 - 8);
  v174 = v11;
  __chkstk_darwin(v11);
  v169 = (char *)&v160 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for MessageDetails.EventStatus(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = __chkstk_darwin(v13);
  v164 = (char *)&v160 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v163 = (char *)&v160 - v18;
  v19 = __chkstk_darwin(v17);
  v166 = (char *)&v160 - v20;
  v21 = __chkstk_darwin(v19);
  v165 = (char *)&v160 - v22;
  v23 = __chkstk_darwin(v21);
  v175 = (char *)&v160 - v24;
  v25 = __chkstk_darwin(v23);
  v176 = (char *)&v160 - v26;
  v27 = __chkstk_darwin(v25);
  v29 = (char *)&v160 - v28;
  v30 = __chkstk_darwin(v27);
  v32 = (char *)&v160 - v31;
  v33 = __chkstk_darwin(v30);
  v35 = (char *)&v160 - v34;
  v36 = __chkstk_darwin(v33);
  v38 = (char *)&v160 - v37;
  v177 = v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer_details;
  MessageDetails.status.getter(v36);
  v178 = *(void (**)(char *, _QWORD, uint64_t))(v14 + 104);
  v178(v35, enum case for MessageDetails.EventStatus.pending(_:), v13);
  v39 = sub_100006CE4(&qword_100031B78, (uint64_t (*)(uint64_t))&type metadata accessor for MessageDetails.EventStatus, (uint64_t)&protocol conformance descriptor for MessageDetails.EventStatus);
  dispatch thunk of RawRepresentable.rawValue.getter(&v181, v13, v39);
  dispatch thunk of RawRepresentable.rawValue.getter(&v179, v13, v39);
  v40 = v182;
  v41 = v180;
  if (v181 == v179 && v182 == v180)
  {
    v42 = 1;
    v41 = v182;
  }
  else
  {
    v42 = _stringCompareWithSmolCheck(_:_:expecting:)(v181, v182, v179, v180, 0);
  }
  swift_bridgeObjectRelease(v40);
  swift_bridgeObjectRelease(v41);
  v43 = *(void (**)(char *, uint64_t))(v14 + 8);
  v43(v35, v13);
  v44 = ((uint64_t (*)(char *, uint64_t))v43)(v38, v13);
  if ((v42 & 1) != 0)
    return String.localized.getter(0x5374736575716552, 0xEB00000000746E65);
  v45 = 2099744;
  MessageDetails.status.getter(v44);
  v178(v29, enum case for MessageDetails.EventStatus.expired(_:), v13);
  dispatch thunk of RawRepresentable.rawValue.getter(&v181, v13, v39);
  dispatch thunk of RawRepresentable.rawValue.getter(&v179, v13, v39);
  v46 = v182;
  v47 = v180;
  if (v181 == v179 && v182 == v180)
  {
    swift_bridgeObjectRelease_n(v182, 2);
    v43(v29, v13);
    v48 = v32;
LABEL_14:
    v43(v48, v13);
    return v45;
  }
  v49 = _stringCompareWithSmolCheck(_:_:expecting:)(v181, v182, v179, v180, 0);
  swift_bridgeObjectRelease(v46);
  swift_bridgeObjectRelease(v47);
  v43(v29, v13);
  v50 = ((uint64_t (*)(char *, uint64_t))v43)(v32, v13);
  if ((v49 & 1) != 0)
    return v45;
  v51 = v176;
  MessageDetails.status.getter(v50);
  v52 = v175;
  v178(v175, enum case for MessageDetails.EventStatus.unknown(_:), v13);
  dispatch thunk of RawRepresentable.rawValue.getter(&v181, v13, v39);
  dispatch thunk of RawRepresentable.rawValue.getter(&v179, v13, v39);
  v53 = v182;
  v54 = v180;
  if (v181 == v179 && v182 == v180)
  {
    swift_bridgeObjectRelease_n(v182, 2);
    v43(v52, v13);
    v48 = v51;
    goto LABEL_14;
  }
  v56 = _stringCompareWithSmolCheck(_:_:expecting:)(v181, v182, v179, v180, 0);
  swift_bridgeObjectRelease(v53);
  swift_bridgeObjectRelease(v54);
  v43(v52, v13);
  v57 = ((uint64_t (*)(char *, uint64_t))v43)(v51, v13);
  if ((v56 & 1) != 0)
    return v45;
  v58 = (uint64_t)v172;
  MessageDetails.family.getter(v57);
  v60 = v173;
  v59 = v174;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v173 + 48))(v58, 1, v174) == 1)
  {
    v61 = sub_100006C90(v58, &qword_100031870);
    v62 = v168;
    v63 = static PeopleLogger.messages.getter(v61);
    v64 = Logger.logObject.getter(v63);
    v65 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v64, v65))
    {
      v66 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v66 = 0;
      _os_log_impl((void *)&_mh_execute_header, v64, v65, "No family!", v66, 2u);
      swift_slowDealloc(v66, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v170 + 8))(v62, v171);
    return v45;
  }
  v67 = v169;
  v68 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v60 + 32))(v169, v58, v59);
  v69 = MessageDetails.actionUserDSID.getter(v68);
  v175 = (char *)v69;
  if ((v70 & 1) == 0)
  {
    v71 = ResolvedFamily.approvers.getter(v69);
    v72 = v71;
    if ((unint64_t)v71 >> 62)
    {
      if (v71 < 0)
        v154 = v71;
      else
        v154 = v71 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v71);
      v73 = _CocoaArrayWrapper.endIndex.getter(v154);
      if (v73)
        goto LABEL_24;
    }
    else
    {
      v73 = *(_QWORD *)((v71 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(v71);
      if (v73)
      {
LABEL_24:
        v74 = 4;
        while (1)
        {
          v75 = (v72 & 0xC000000000000001) != 0
              ? (char *)specialized _ArrayBuffer._getElementSlowPath(_:)(v74 - 4, v72)
              : (char *)*(id *)(v72 + 8 * v74);
          v76 = v75;
          v77 = v74 - 3;
          if (__OFADD__(v74 - 4, 1))
            break;
          v78 = objc_msgSend(v75, "dsid");
          if (v78)
          {
            v79 = v78;
            v80 = (char *)objc_msgSend(v78, "integerValue");
            v176 = v76;
            v81 = v80;

            v90 = v81 == v175;
            v76 = v176;
            if (v90)
            {
              v82 = swift_bridgeObjectRelease_n(v72, 2);
              v83 = v165;
              MessageDetails.status.getter(v82);
              v178(v166, enum case for MessageDetails.EventStatus.denied(_:), v13);
              dispatch thunk of RawRepresentable.rawValue.getter(&v181, v13, v39);
              dispatch thunk of RawRepresentable.rawValue.getter(&v179, v13, v39);
              v84 = v182;
              v85 = v180;
              v86 = v174;
              v45 = 2099744;
              if (v181 == v179 && v182 == v180)
              {
                swift_bridgeObjectRelease_n(v182, 2);
                v43(v166, v13);
                v43(v83, v13);
                goto LABEL_37;
              }
              v87 = _stringCompareWithSmolCheck(_:_:expecting:)(v181, v182, v179, v180, 0);
              swift_bridgeObjectRelease(v84);
              swift_bridgeObjectRelease(v85);
              v43(v166, v13);
              v88 = ((uint64_t (*)(char *, uint64_t))v43)(v83, v13);
              if ((v87 & 1) != 0)
              {
LABEL_37:
                v89 = objc_msgSend(v76, "isMe");
                v90 = v89 == 0;
                if (v89)
                  v91 = 0xD00000000000001BLL;
                else
                  v91 = 0xD00000000000001ELL;
                if (v90)
                  v92 = 0x80000001000247F0;
                else
                  v92 = 0x8000000100024810;
                v93 = String.localized.getter(v91, v92);
                v95 = v94;
                swift_bridgeObjectRelease(v92);
                v96 = sub_100003CB4(&qword_100031B80);
                v97 = swift_allocObject(v96, 72, 7);
                *(_OWORD *)(v97 + 16) = xmmword_100025400;
                v98 = FAFamilyMember.displayNameWithFallback.getter();
                v99 = v76;
                v101 = v100;
                *(_QWORD *)(v97 + 56) = &type metadata for String;
                *(_QWORD *)(v97 + 64) = sub_100017A38();
                *(_QWORD *)(v97 + 32) = v98;
                *(_QWORD *)(v97 + 40) = v101;
                v45 = String.init(format:_:)(v93, v95, v97);

                swift_bridgeObjectRelease(v95);
                (*(void (**)(char *, uint64_t))(v173 + 8))(v169, v86);
                return v45;
              }
              v102 = v163;
              MessageDetails.status.getter(v88);
              v103 = v164;
              v178(v164, enum case for MessageDetails.EventStatus.approved(_:), v13);
              v104 = sub_100006CE4(&qword_100031750, (uint64_t (*)(uint64_t))&type metadata accessor for MessageDetails.EventStatus, (uint64_t)&protocol conformance descriptor for MessageDetails.EventStatus);
              v105 = dispatch thunk of static Equatable.== infix(_:_:)(v102, v103, v13, v104);
              v43(v103, v13);
              v106 = ((uint64_t (*)(char *, uint64_t))v43)(v102, v13);
              if ((v105 & 1) == 0)
              {
                (*(void (**)(char *, uint64_t))(v173 + 8))(v169, v86);

                return v45;
              }
              v107 = v162;
              MessageDetails.eventSource.getter(v106);
              v77 = type metadata accessor for MessageDetails.EventSource(0);
              v72 = *(_QWORD *)(v77 - 8);
              if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v72 + 48))(v107, 1, v77) == 1)
              {
LABEL_46:
                v45 = String.localized.getter(0x4574736575716552, 0xEE00646572697078);

LABEL_56:
                (*(void (**)(char *, uint64_t))(v173 + 8))(v169, v86);
                sub_100006C90(v107, &qword_100031708);
                return v45;
              }
              v108 = v161;
              sub_1000179F0(v107, v161);
              v109 = (*(uint64_t (**)(uint64_t, uint64_t))(v72 + 88))(v108, v77);
              if (v109 == enum case for MessageDetails.EventSource.askToBuy(_:))
              {
                v110 = objc_msgSend(v76, "isMe");
                v111 = v110 == 0;
                if (v110)
                  v112 = 0xD00000000000001BLL;
                else
                  v112 = 0xD00000000000001ELL;
                if (v111)
                  v113 = 0x8000000100024750;
                else
                  v113 = 0x8000000100024770;
                v114 = String.localized.getter(v112, v113);
                v116 = v115;
                swift_bridgeObjectRelease(v113);
                v117 = sub_100003CB4(&qword_100031B80);
                v118 = swift_allocObject(v117, 72, 7);
                *(_OWORD *)(v118 + 16) = xmmword_100025400;
                v119 = FAFamilyMember.displayNameWithFallback.getter();
                v120 = v76;
                v122 = v121;
                *(_QWORD *)(v118 + 56) = &type metadata for String;
                *(_QWORD *)(v118 + 64) = sub_100017A38();
                *(_QWORD *)(v118 + 32) = v119;
                *(_QWORD *)(v118 + 40) = v122;
                v45 = String.init(format:_:)(v114, v116, v118);
                swift_bridgeObjectRelease(v116);

                goto LABEL_56;
              }
              if (v109 == enum case for MessageDetails.EventSource.screenTime(_:))
              {
                MessageDetails.approvalTime.getter();
                v124 = v123;
                v125 = String.trimToNil()();
                swift_bridgeObjectRelease(v124);
                if (v125.value._object)
                {
                  if (objc_msgSend(v176, "isMe"))
                  {
                    v126 = String.localized.getter(0xD000000000000023, 0x80000001000247C0);
                    v128 = v127;
                    v129 = sub_100003CB4(&qword_100031B80);
                    v130 = swift_allocObject(v129, 72, 7);
                    *(_OWORD *)(v130 + 16) = xmmword_100025400;
                    *(_QWORD *)(v130 + 56) = &type metadata for String;
                    *(_QWORD *)(v130 + 64) = sub_100017A38();
                    *(Swift::String_optional *)(v130 + 32) = v125;
                    v45 = String.init(format:_:)(v126, v128, v130);
                    swift_bridgeObjectRelease(v128);

                  }
                  else
                  {
                    v144 = String.localized.getter(0xD000000000000026, 0x8000000100024790);
                    v146 = v145;
                    v147 = sub_100003CB4(&qword_100031B80);
                    v148 = swift_allocObject(v147, 112, 7);
                    *(_OWORD *)(v148 + 16) = xmmword_100025750;
                    v149 = v176;
                    v150 = FAFamilyMember.displayNameWithFallback.getter();
                    v152 = v151;
                    *(_QWORD *)(v148 + 56) = &type metadata for String;
                    v153 = sub_100017A38();
                    *(_QWORD *)(v148 + 32) = v150;
                    *(_QWORD *)(v148 + 40) = v152;
                    *(_QWORD *)(v148 + 96) = &type metadata for String;
                    *(_QWORD *)(v148 + 104) = v153;
                    *(_QWORD *)(v148 + 64) = v153;
                    *(Swift::String_optional *)(v148 + 72) = v125;
                    v45 = String.init(format:_:)(v144, v146, v148);
                    swift_bridgeObjectRelease(v146);

                  }
                }
                else
                {
                  v131 = v176;
                  v132 = objc_msgSend(v176, "isMe");
                  v133 = v132 == 0;
                  if (v132)
                    v134 = 0xD00000000000001BLL;
                  else
                    v134 = 0xD00000000000001ELL;
                  if (v133)
                    v135 = 0x8000000100024750;
                  else
                    v135 = 0x8000000100024770;
                  v136 = String.localized.getter(v134, v135);
                  v138 = v137;
                  swift_bridgeObjectRelease(v135);
                  v139 = sub_100003CB4(&qword_100031B80);
                  v140 = swift_allocObject(v139, 72, 7);
                  *(_OWORD *)(v140 + 16) = xmmword_100025400;
                  v141 = FAFamilyMember.displayNameWithFallback.getter();
                  v143 = v142;
                  *(_QWORD *)(v140 + 56) = &type metadata for String;
                  *(_QWORD *)(v140 + 64) = sub_100017A38();
                  *(_QWORD *)(v140 + 32) = v141;
                  *(_QWORD *)(v140 + 40) = v143;
                  v45 = String.init(format:_:)(v136, v138, v140);
                  swift_bridgeObjectRelease(v138);

                }
                (*(void (**)(char *, uint64_t))(v173 + 8))(v169, v174);
                sub_100006C90(v162, &qword_100031708);
                return v45;
              }
LABEL_62:
              (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v161, v77);
              v86 = v174;
              v107 = v162;
              v76 = v176;
              goto LABEL_46;
            }
          }

          ++v74;
          if (v77 == v73)
            goto LABEL_76;
        }
        __break(1u);
        goto LABEL_62;
      }
    }
LABEL_76:
    v69 = swift_bridgeObjectRelease_n(v72, 2);
    v60 = v173;
    v59 = v174;
    v67 = v169;
    v45 = 2099744;
  }
  v155 = v167;
  v156 = static PeopleLogger.messages.getter(v69);
  v157 = Logger.logObject.getter(v156);
  v158 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v157, v158))
  {
    v159 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v159 = 0;
    _os_log_impl((void *)&_mh_execute_header, v157, v158, "No approver found", v159, 2u);
    swift_slowDealloc(v159, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v170 + 8))(v155, v171);
  (*(void (**)(char *, uint64_t))(v60 + 8))(v67, v59);
  return v45;
}

id sub_100016C70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int v5;
  uint64_t v7;

  v0 = type metadata accessor for MessageDetails.EventStatus(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin();
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MessageDetails.status.getter(v2);
  v5 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v4, v0);
  if (v5 == enum case for MessageDetails.EventStatus.approved(_:))
    return objc_msgSend((id)objc_opt_self(UIColor), "systemGreenColor");
  if (v5 == enum case for MessageDetails.EventStatus.denied(_:))
    return objc_msgSend((id)objc_opt_self(UIColor), "systemRedColor");
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return 0;
}

void *sub_100016DAC@<X0>(_QWORD *a1@<X8>)
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, _QWORD, uint64_t);
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  char v31;
  void (*v32)(char *, uint64_t);
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  char v71;
  void *result;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  __int128 v82;
  char *v83;
  char *v84;
  char *v85;
  char *v86;
  uint64_t v87;
  char *v88;
  _QWORD *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;

  v89 = a1;
  v2 = sub_100003CB4(&qword_100031870);
  __chkstk_darwin(v2);
  v91 = (char *)&v82 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for ResolvedFamily(0);
  v93 = *(_QWORD *)(v4 - 8);
  v94 = v4;
  __chkstk_darwin(v4);
  v88 = (char *)&v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100003CB4(&qword_100031708);
  v7 = __chkstk_darwin(v6);
  v86 = (char *)&v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v85 = (char *)&v82 - v9;
  v92 = type metadata accessor for MessageDetails.EventSource(0);
  v87 = *(_QWORD *)(v92 - 8);
  v10 = __chkstk_darwin(v92);
  v84 = (char *)&v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v83 = (char *)&v82 - v12;
  v13 = type metadata accessor for MessageDetails.EventStatus(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v82 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v19 = (char *)&v82 - v18;
  v20 = sub_100003CB4(&qword_100031B58);
  v21 = *(_QWORD *)(v14 + 72);
  v22 = *(unsigned __int8 *)(v14 + 80);
  v23 = (v22 + 32) & ~v22;
  v24 = swift_allocObject(v20, v23 + 2 * v21, v22 | 7);
  v82 = xmmword_100025750;
  *(_OWORD *)(v24 + 16) = xmmword_100025750;
  v25 = v24 + v23;
  v26 = *(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 104);
  v26(v25, enum case for MessageDetails.EventStatus.approved(_:), v13);
  v27 = v25 + v21;
  v28 = ((uint64_t (*)(uint64_t, _QWORD, uint64_t))v26)(v25 + v21, enum case for MessageDetails.EventStatus.denied(_:), v13);
  v90 = v1;
  v95 = v1 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer_details;
  MessageDetails.status.getter(v28);
  v29 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v29(v17, v25, v13);
  v30 = sub_100006CE4(&qword_100031750, (uint64_t (*)(uint64_t))&type metadata accessor for MessageDetails.EventStatus, (uint64_t)&protocol conformance descriptor for MessageDetails.EventStatus);
  v31 = dispatch thunk of static Equatable.== infix(_:_:)(v17, v19, v13, v30);
  v32 = *(void (**)(char *, uint64_t))(v14 + 8);
  swift_bridgeObjectRetain(v24);
  v32(v17, v13);
  if ((v31 & 1) != 0)
  {
    swift_bridgeObjectRelease(v24);
    v32(v19, v13);
    swift_setDeallocating(v24);
    swift_arrayDestroy(v25, *(_QWORD *)(v24 + 16), v13);
    swift_deallocClassInstance(v24, 32, 7);
  }
  else
  {
    v29(v17, v27, v13);
    v33 = dispatch thunk of static Equatable.== infix(_:_:)(v17, v19, v13, v30);
    v32(v17, v13);
    swift_bridgeObjectRelease(v24);
    v32(v19, v13);
    swift_setDeallocating(v24);
    swift_arrayDestroy(v25, *(_QWORD *)(v24 + 16), v13);
    v34 = swift_deallocClassInstance(v24, 32, 7);
    if ((v33 & 1) == 0)
    {
      v35 = (uint64_t)v85;
      MessageDetails.eventSource.getter(v34);
      v36 = v87;
      v37 = v92;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v87 + 48))(v35, 1, v92) == 1)
      {
        sub_100006C90(v35, &qword_100031708);
      }
      else
      {
        v13 = (uint64_t)v83;
        (*(void (**)(char *, uint64_t, uint64_t))(v36 + 32))(v83, v35, v37);
        if (qword_1000313C0 != -1)
          swift_once(&qword_1000313C0, sub_1000151C4);
        v38 = sub_100015258(v13, qword_1000319C0);
        (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v13, v37);
        if ((v38 & 1) != 0)
        {
          v39 = sub_100003CB4(&qword_100031B60);
          v40 = (_QWORD *)swift_allocObject(v39, 64, 7);
          *((_OWORD *)v40 + 1) = v82;
          v40[4] = 0;
          v40[5] = 0;
          v40[6] = String.localized.getter(0xD000000000000028, 0x80000001000246E0);
          v40[7] = v41;
          goto LABEL_11;
        }
      }
    }
  }
  v42 = sub_100015D8C();
  v44 = v43;
  v36 = String.splitWith(_:)(10, 0xE100000000000000, v42, v43);
  swift_bridgeObjectRelease(v44);
  v40 = sub_100017534(v36);
  swift_bridgeObjectRelease(v36);
LABEL_11:
  v45 = (char *)sub_100016C70();
  v46 = v45;
  v48 = v47;
  v50 = v49;
  if (v45)
  {
    v51 = v45;
    swift_bridgeObjectRetain(v50);
    v45 = (char *)Color.init(uiColor:)(v51);
    v52 = v48;
    v53 = v50;
  }
  else
  {
    v52 = 0;
    v53 = 0;
  }
  v54 = (uint64_t)v91;
  v55 = v40[2];
  v90 = v48;
  v91 = v45;
  if (v55 == 2)
  {
    v17 = (char *)v40[4];
    v13 = v40[5];
    v36 = v40[7];
    v85 = (char *)v40[6];
    swift_bridgeObjectRetain(v36);
  }
  else
  {
    if (!v55)
    {
      __break(1u);
      goto LABEL_32;
    }
    v85 = 0;
    v36 = 0;
    v17 = (char *)v40[4];
    v13 = v40[5];
  }
  swift_bridgeObjectRetain(v13);
  v56 = swift_bridgeObjectRelease(v40);
  v57 = v54;
  MessageDetails.family.getter(v56);
  v59 = v93;
  v58 = v94;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v93 + 48))(v57, 1, v94) != 1)
  {
    v62 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v59 + 32))(v88, v57, v58);
    v54 = ResolvedFamily.approvers.getter(v62);
    if (!((unint64_t)v54 >> 62))
    {
      v63 = *(_QWORD *)((v54 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_22;
    }
LABEL_32:
    if (v54 < 0)
      v81 = v54;
    else
      v81 = v54 & 0xFFFFFFFFFFFFFF8;
    v63 = _CocoaArrayWrapper.endIndex.getter(v81);
LABEL_22:
    v61 = v92;
    swift_bridgeObjectRelease(v54);
    v60 = (*(uint64_t (**)(char *, uint64_t))(v93 + 8))(v88, v94);
    if (v63)
      goto LABEL_28;
    goto LABEL_23;
  }
  v60 = sub_100006C90(v57, &qword_100031870);
  v61 = v92;
LABEL_23:
  v64 = v86;
  MessageDetails.eventSource.getter(v60);
  v65 = (uint64_t)v64;
  v66 = v87;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v87 + 48))(v65, 1, v61) == 1)
  {
    sub_100006C90(v65, &qword_100031708);
LABEL_29:
    swift_bridgeObjectRelease(v53);
    swift_bridgeObjectRelease(v36);
    swift_bridgeObjectRelease(v13);
    v75 = String.rebrand.getter(0x6953657361656C50, 0xEC0000006E496E67);
    v77 = v76;
    v74 = String.localized.getter(v75, v76);
    v36 = v78;
    swift_bridgeObjectRelease(v77);
    v17 = (char *)String.localized.getter(0x656E676953746F4ELL, 0xEB000000006E4964);
    v13 = v79;
    result = sub_100017820(v46, v90, v50);
    v52 = 0;
    v53 = 0;
    v73 = v91;
    goto LABEL_30;
  }
  v67 = v65;
  v68 = (uint64_t)v84;
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 32))(v84, v67, v61);
  if (qword_1000313C0 != -1)
    swift_once(&qword_1000313C0, sub_1000151C4);
  v69 = sub_100015258(v68, qword_1000319C0);
  v70 = v68;
  v71 = v69;
  (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v70, v61);
  if ((v71 & 1) == 0)
    goto LABEL_29;
LABEL_28:
  result = sub_100017820(v46, v90, v50);
  v73 = v91;
  v74 = (uint64_t)v85;
LABEL_30:
  v80 = v89;
  *v89 = v17;
  v80[1] = v13;
  v80[2] = v74;
  v80[3] = v36;
  v80[4] = v52;
  v80[5] = v53;
  v80[6] = v73;
  return result;
}

_QWORD *sub_100017534(uint64_t a1)
{
  int64_t v1;
  _QWORD *v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD *v15;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    v15 = &_swiftEmptyArrayStorage;
    sub_10001784C(0, v1, 0);
    v2 = &_swiftEmptyArrayStorage;
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *v4;
      v13[0] = *(v4 - 1);
      v13[1] = v5;
      swift_bridgeObjectRetain_n(v5, 2);
      v6 = sub_100003CB4(&qword_100031B70);
      swift_dynamicCast(v14, v13, &type metadata for String, v6, 7);
      v7 = v14[0];
      v8 = v14[1];
      swift_bridgeObjectRelease(v5);
      if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
      {
        sub_10001784C(0, v2[2] + 1, 1);
        v2 = v15;
      }
      v10 = v2[2];
      v9 = v2[3];
      if (v10 >= v9 >> 1)
      {
        sub_10001784C(v9 > 1, v10 + 1, 1);
        v2 = v15;
      }
      v4 += 2;
      v2[2] = v10 + 1;
      v11 = (char *)&v2[2 * v10];
      *((_QWORD *)v11 + 4) = v7;
      *((_QWORD *)v11 + 5) = v8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t BubbleContentContainer.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer_details;
  v2 = type metadata accessor for MessageDetails(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t BubbleContentContainer.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer_details;
  v2 = type metadata accessor for MessageDetails(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100017744()
{
  return type metadata accessor for BubbleContentContainer(0);
}

uint64_t type metadata accessor for BubbleContentContainer(uint64_t a1)
{
  uint64_t result;

  result = qword_100031A00;
  if (!qword_100031A00)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for BubbleContentContainer);
  return result;
}

uint64_t sub_100017788(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[6];

  result = type metadata accessor for MessageDetails(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[2] = &unk_100025778;
    v4[3] = &unk_100025778;
    v4[4] = &unk_100025790;
    v4[5] = &unk_1000257A8;
    result = swift_updateClassMetadata2(a1, 256, 6, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

void *sub_100017820(void *result, uint64_t a2, uint64_t a3)
{
  if (result)
  {

    return (void *)swift_bridgeObjectRelease(a3);
  }
  return result;
}

uint64_t sub_10001784C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100017868(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_100017868(char a1, int64_t a2, char a3, _QWORD *a4)
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
  uint64_t v18;
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
    v10 = sub_100003CB4(&qword_100031B60);
    v11 = (_QWORD *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 4);
  }
  else
  {
    v11 = &_swiftEmptyArrayStorage;
  }
  v14 = (unint64_t)(v11 + 4);
  v15 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= v15 + 16 * v8)
      memmove(v11 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v15 >= v14 + 16 * v8 || v14 >= v15 + 16 * v8)
  {
    v18 = sub_100003CB4(&qword_100031B70);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v18);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000179F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003CB4(&qword_100031708);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100017A38()
{
  unint64_t result;

  result = qword_100031B88;
  if (!qword_100031B88)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100031B88);
  }
  return result;
}

uint64_t sub_100017A7C(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v23;
  char v24;
  _QWORD v25[2];

  v11 = type metadata accessor for MessageDetails(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = v5 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy14AskToBuyBubble__buttonTapped;
  v24 = 0;
  swift_retain(v5);
  State.init(wrappedValue:)(v25, &v24, &type metadata for Bool);
  v16 = v25[1];
  *(_BYTE *)v15 = v25[0];
  *(_QWORD *)(v15 + 8) = v16;
  swift_release(v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  v17 = sub_100015C40((uint64_t)v14);
  v18 = *(void **)(v17 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer_image);
  swift_retain(v17);
  v19 = v18;
  v20 = sub_100018E9C(v19, a2, a3, a4, a5);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  v21 = *(void **)(v17 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer_contentViewController);
  *(_QWORD *)(v17 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer_contentViewController) = v20;
  swift_release(v17);

  return v17;
}

uint64_t sub_100017BD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char **v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v29 = a4;
  v30 = a2;
  v31 = a5;
  v8 = sub_100003CB4(&qword_100031E20);
  __chkstk_darwin(v8);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_1000151D8())
    v11 = static Alignment.trailing.getter();
  else
    v11 = static Alignment.leading.getter();
  v13 = v11;
  v14 = v12;
  v15 = OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer____lazy_storage___isMac;
  v16 = *(_BYTE *)(v5 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer____lazy_storage___isMac);
  if ((v16 & 1) != 0)
  {
    v18 = 0;
    v17 = 0;
  }
  else
  {
    if (qword_100031398 != -1)
      swift_once(&qword_100031398, sub_10000EA00);
    v18 = qword_100032B80;
    v17 = *(_QWORD *)algn_100032B88;
    swift_bridgeObjectRetain(*(_QWORD *)algn_100032B88);
    v16 = *(_BYTE *)(v5 + v15);
  }
  v19 = (void *)objc_opt_self(UIColor);
  v20 = &selRef_tertiarySystemFillColor;
  if ((v16 & 1) != 0)
    v20 = &selRef_systemFillColor;
  v21 = Color.init(uiColor:)(objc_msgSend(v19, *v20));
  *(_QWORD *)v10 = static VerticalAlignment.center.getter(v21);
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 1;
  v22 = sub_100003CB4(&qword_100031E48);
  sub_100017DFC(v5, a3, v29, a1, v30, v21, v13, v14, (uint64_t)&v10[*(int *)(v22 + 44)], v18, v17);
  v23 = swift_bridgeObjectRelease(v17);
  if (qword_100031310 != -1)
    v23 = swift_once(&qword_100031310, sub_10000E710);
  v24 = *(double *)&qword_100032AC8;
  v25 = static Alignment.center.getter(v23);
  sub_1000180B0(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, v31, 0.0, 1, v24, 0, v25, v26);
  swift_release(v21);
  return sub_100006C90((uint64_t)v10, &qword_100031E20);
}

uint64_t sub_100017DFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  _QWORD v34[7];
  uint64_t v35;
  _BYTE v36[136];
  _BYTE v37[136];
  _BYTE v38[144];

  v34[5] = a7;
  v34[6] = a8;
  v34[3] = a5;
  v34[4] = a6;
  v34[1] = a4;
  v35 = a9;
  v34[2] = a11;
  v34[0] = a10;
  v14 = sub_100003CB4(&qword_100031E50);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = __chkstk_darwin(v14);
  v18 = (char *)v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v20 = (char *)v34 - v19;
  v21 = sub_1000151D8();
  if (v21)
  {
    v22 = static Alignment.center.getter(v21);
    sub_10001826C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v37, 0.0, 1, 0.0, 1, v22, v23, 0, 1);
    sub_10001B3F4((uint64_t)v37);
  }
  else
  {
    sub_10001AFFC((uint64_t)v37);
  }
  sub_100013A08((uint64_t)v37, (uint64_t)v38, &qword_100031E58);
  v24 = swift_allocObject(&unk_10002D658, 32, 7);
  *(_QWORD *)(v24 + 16) = a2;
  *(_QWORD *)(v24 + 24) = a3;
  __chkstk_darwin(v24);
  swift_retain(a3);
  v25 = sub_100003CB4(&qword_100031E60);
  v26 = sub_10001B074();
  Button.init(action:label:)(sub_10001B040, v24, sub_10001B060, &v34[-10], v25, v26);
  v27 = *(_BYTE *)(a1 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer____lazy_storage___isMac) & 1;
  sub_100013A08((uint64_t)v38, (uint64_t)v36, &qword_100031E58);
  v28 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v28(v18, v20, v14);
  sub_100013A08((uint64_t)v36, (uint64_t)v37, &qword_100031E58);
  v29 = v35;
  sub_100013A08((uint64_t)v37, v35, &qword_100031E58);
  v30 = sub_100003CB4(&qword_100031F20);
  v28((char *)(v29 + *(int *)(v30 + 48)), v18, v14);
  v31 = v29 + *(int *)(v30 + 64);
  *(_QWORD *)v31 = 0;
  *(_BYTE *)(v31 + 8) = v27 == 0;
  *(_BYTE *)(v31 + 9) = v27;
  v32 = *(void (**)(char *, uint64_t))(v15 + 8);
  v32(v20, v14);
  return ((uint64_t (*)(char *, uint64_t))v32)(v18, v14);
}

__n128 sub_1000180B0@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v29;
  double v30;
  double v31;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __n128 result;
  unsigned int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _OWORD v44[7];

  v16 = v15;
  v18 = a15;
  v19 = a12;
  v20 = a10;
  v21 = a2 & 1;
  v22 = a1;
  if ((_DWORD)v21)
    v22 = -INFINITY;
  v23 = a4 & 1;
  v24 = a3;
  if ((a4 & 1) != 0)
    v24 = v22;
  v25 = a6 & 1;
  v26 = a8 & 1;
  v27 = a5;
  if ((a6 & 1) != 0)
    v27 = v24;
  if (v22 > v24 || v24 > v27)
    goto LABEL_22;
  v29 = a7;
  if ((a8 & 1) != 0)
    v29 = -INFINITY;
  v30 = a10;
  if ((a11 & 1) != 0)
    v30 = v29;
  v31 = a12;
  if ((a13 & 1) != 0)
    v31 = v30;
  if (v29 > v30 || v30 > v31)
  {
LABEL_22:
    v42 = a5;
    v43 = a7;
    v41 = a3;
    v40 = a1;
    v39 = v21;
    v33 = static os_log_type_t.fault.getter();
    v34 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v33, &_mh_execute_header, v34, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v18 = a15;
    v21 = v39;
    a1 = v40;
    v20 = a10;
    a3 = v41;
    v19 = a12;
    a5 = v42;
    a7 = v43;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v44, *(_QWORD *)&a1, v21, *(_QWORD *)&a3, v23, *(_QWORD *)&a5, v25, *(_QWORD *)&a7, v26, *(_QWORD *)&v20, a11 & 1, *(_QWORD *)&v19, a13 & 1, a14, v18);
  sub_10000E458(v16, a9, &qword_100031E20);
  v35 = a9 + *(int *)(sub_100003CB4(&qword_100031E08) + 36);
  v36 = v44[5];
  *(_OWORD *)(v35 + 64) = v44[4];
  *(_OWORD *)(v35 + 80) = v36;
  *(_OWORD *)(v35 + 96) = v44[6];
  v37 = v44[1];
  *(_OWORD *)v35 = v44[0];
  *(_OWORD *)(v35 + 16) = v37;
  result = (__n128)v44[3];
  *(_OWORD *)(v35 + 32) = v44[2];
  *(__n128 *)(v35 + 48) = result;
  return result;
}

__n128 sub_10001826C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  char v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v30;
  double v31;
  double v32;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __n128 result;
  unsigned int v39;
  unsigned int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _OWORD v45[7];

  v18 = a17;
  v19 = a15;
  v20 = a12;
  v21 = a10;
  v22 = a2 & 1;
  v23 = a1;
  if ((_DWORD)v22)
    v23 = -INFINITY;
  v24 = a4 & 1;
  v25 = a3;
  if ((_DWORD)v24)
    v25 = v23;
  v26 = a6 & 1;
  v27 = a8 & 1;
  v28 = a5;
  if ((a6 & 1) != 0)
    v28 = v25;
  if (v23 > v25 || v25 > v28)
    goto LABEL_22;
  v30 = a7;
  if ((a8 & 1) != 0)
    v30 = -INFINITY;
  v31 = a10;
  if ((a11 & 1) != 0)
    v31 = v30;
  v32 = a12;
  if ((a13 & 1) != 0)
    v32 = v31;
  if (v30 > v31 || v31 > v32)
  {
LABEL_22:
    v43 = a5;
    v44 = a7;
    v41 = a1;
    v42 = a3;
    v39 = v24;
    v40 = v22;
    v34 = static os_log_type_t.fault.getter();
    v35 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v34, &_mh_execute_header, v35, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v24 = v39;
    v22 = v40;
    v19 = a15;
    v21 = a10;
    v20 = a12;
    a1 = v41;
    a3 = v42;
    a5 = v43;
    v18 = a17;
    a7 = v44;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v45, *(_QWORD *)&a1, v22, *(_QWORD *)&a3, v24, *(_QWORD *)&a5, v26, *(_QWORD *)&a7, v27, *(_QWORD *)&v21, a11 & 1, *(_QWORD *)&v20, a13 & 1, a14, v19);
  *(_QWORD *)a9 = a16;
  *(_BYTE *)(a9 + 8) = v18 & 1;
  v36 = v45[5];
  *(_OWORD *)(a9 + 80) = v45[4];
  *(_OWORD *)(a9 + 96) = v36;
  *(_OWORD *)(a9 + 112) = v45[6];
  v37 = v45[1];
  *(_OWORD *)(a9 + 16) = v45[0];
  *(_OWORD *)(a9 + 32) = v37;
  result = (__n128)v45[3];
  *(_OWORD *)(a9 + 48) = v45[2];
  *(__n128 *)(a9 + 64) = result;
  return result;
}

uint64_t sub_100018414@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v28;
  double v29;
  double v30;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  unsigned int v42;
  double v43;
  double v44;
  double v45;
  double v46;
  _OWORD v47[7];

  v17 = a15;
  v18 = a12;
  v19 = a10;
  v20 = a2 & 1;
  v21 = a1;
  if ((_DWORD)v20)
    v21 = -INFINITY;
  v22 = a4 & 1;
  v23 = a3;
  if ((a4 & 1) != 0)
    v23 = v21;
  v24 = a6 & 1;
  v25 = a8 & 1;
  v26 = a5;
  if ((a6 & 1) != 0)
    v26 = v23;
  if (v21 > v23 || v23 > v26)
    goto LABEL_22;
  v28 = a7;
  if ((a8 & 1) != 0)
    v28 = -INFINITY;
  v29 = a10;
  if ((a11 & 1) != 0)
    v29 = v28;
  v30 = a12;
  if ((a13 & 1) != 0)
    v30 = v29;
  if (v28 > v29 || v29 > v30)
  {
LABEL_22:
    v45 = a5;
    v46 = a7;
    v44 = a3;
    v43 = a1;
    v42 = v20;
    v32 = static os_log_type_t.fault.getter();
    v33 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v32, &_mh_execute_header, v33, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v17 = a15;
    v20 = v42;
    v19 = a10;
    a1 = v43;
    a3 = v44;
    v18 = a12;
    a5 = v45;
    a7 = v46;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v47, *(_QWORD *)&a1, v20, *(_QWORD *)&a3, v22, *(_QWORD *)&a5, v24, *(_QWORD *)&a7, v25, *(_QWORD *)&v19, a11 & 1, *(_QWORD *)&v18, a13 & 1, a14, v17);
  v34 = *(_OWORD *)(v15 + 80);
  *(_OWORD *)(a9 + 64) = *(_OWORD *)(v15 + 64);
  *(_OWORD *)(a9 + 80) = v34;
  *(_BYTE *)(a9 + 96) = *(_BYTE *)(v15 + 96);
  v35 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v15;
  *(_OWORD *)(a9 + 16) = v35;
  v36 = *(_OWORD *)(v15 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v15 + 32);
  *(_OWORD *)(a9 + 48) = v36;
  v37 = v47[1];
  *(_OWORD *)(a9 + 104) = v47[0];
  *(_OWORD *)(a9 + 120) = v37;
  v38 = v47[3];
  *(_OWORD *)(a9 + 136) = v47[2];
  v39 = v47[4];
  v40 = v47[5];
  *(_OWORD *)(a9 + 200) = v47[6];
  *(_OWORD *)(a9 + 184) = v40;
  *(_OWORD *)(a9 + 168) = v39;
  *(_OWORD *)(a9 + 152) = v38;
  return sub_10001B474(v15);
}

uint64_t sub_1000185D4@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, char a18)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v32;
  double v33;
  double v34;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  unsigned int v43;
  double v44;
  double v45;
  double v46;
  double v47;
  _OWORD v48[7];

  v19 = a15;
  v20 = a16;
  v21 = a14;
  v22 = a12;
  v23 = a10;
  v24 = a2 & 1;
  v25 = a1;
  if ((_DWORD)v24)
    v25 = -INFINITY;
  v26 = a4 & 1;
  v27 = a3;
  if ((a4 & 1) != 0)
    v27 = v25;
  v28 = a6 & 1;
  v29 = a8 & 1;
  v30 = a5;
  if ((a6 & 1) != 0)
    v30 = v27;
  if (v25 > v27 || v27 > v30)
    goto LABEL_22;
  v32 = a7;
  if ((a8 & 1) != 0)
    v32 = -INFINITY;
  v33 = a10;
  if ((a11 & 1) != 0)
    v33 = v32;
  v34 = a12;
  if ((a13 & 1) != 0)
    v34 = v33;
  if (v32 > v33 || v33 > v34)
  {
LABEL_22:
    v46 = a5;
    v47 = a7;
    v44 = a1;
    v45 = a3;
    v43 = v24;
    v36 = static os_log_type_t.fault.getter();
    v37 = (void *)static Log.runtimeIssuesLog.getter();
    v38 = v36;
    v20 = a16;
    os_log(_:dso:log:_:_:)(v38, &_mh_execute_header, v37, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v21 = a14;
    v19 = a15;
    v24 = v43;
    v23 = a10;
    v22 = a12;
    a1 = v44;
    a3 = v45;
    a5 = v46;
    a7 = v47;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v48, *(_QWORD *)&a1, v24, *(_QWORD *)&a3, v26, *(_QWORD *)&a5, v28, *(_QWORD *)&a7, v29, *(_QWORD *)&v23, a11 & 1, *(_QWORD *)&v22, a13 & 1, v21, v19);
  *(_QWORD *)a9 = v20;
  *(_BYTE *)(a9 + 8) = a17 & 1;
  *(_BYTE *)(a9 + 9) = a18 & 1;
  v39 = v48[5];
  *(_OWORD *)(a9 + 80) = v48[4];
  *(_OWORD *)(a9 + 96) = v39;
  *(_OWORD *)(a9 + 112) = v48[6];
  v40 = v48[1];
  *(_OWORD *)(a9 + 16) = v48[0];
  *(_OWORD *)(a9 + 32) = v40;
  v41 = v48[3];
  *(_OWORD *)(a9 + 48) = v48[2];
  *(_OWORD *)(a9 + 64) = v41;
  return swift_retain(v20);
}

uint64_t sub_10001878C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v28;
  double v29;
  double v30;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  unsigned int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _OWORD v45[7];

  v17 = a15;
  v18 = a12;
  v19 = a10;
  v20 = a2 & 1;
  v21 = a1;
  if ((_DWORD)v20)
    v21 = -INFINITY;
  v22 = a4 & 1;
  v23 = a3;
  if ((a4 & 1) != 0)
    v23 = v21;
  v24 = a6 & 1;
  v25 = a8 & 1;
  v26 = a5;
  if ((a6 & 1) != 0)
    v26 = v23;
  if (v21 > v23 || v23 > v26)
    goto LABEL_22;
  v28 = a7;
  if ((a8 & 1) != 0)
    v28 = -INFINITY;
  v29 = a10;
  if ((a11 & 1) != 0)
    v29 = v28;
  v30 = a12;
  if ((a13 & 1) != 0)
    v30 = v29;
  if (v28 > v29 || v29 > v30)
  {
LABEL_22:
    v44 = a7;
    v42 = a1;
    v43 = a5;
    v41 = a3;
    v40 = v20;
    v32 = static os_log_type_t.fault.getter();
    v33 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v32, &_mh_execute_header, v33, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v17 = a15;
    v19 = a10;
    v20 = v40;
    a3 = v41;
    a1 = v42;
    a5 = v43;
    v18 = a12;
    a7 = v44;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v45, *(_QWORD *)&a1, v20, *(_QWORD *)&a3, v22, *(_QWORD *)&a5, v24, *(_QWORD *)&a7, v25, *(_QWORD *)&v19, a11 & 1, *(_QWORD *)&v18, a13 & 1, a14, v17);
  v34 = *(_OWORD *)(v15 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v15 + 32);
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = *(_OWORD *)(v15 + 64);
  v35 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v15;
  *(_OWORD *)(a9 + 16) = v35;
  v36 = v45[2];
  *(_OWORD *)(a9 + 136) = v45[3];
  v37 = v45[5];
  *(_OWORD *)(a9 + 152) = v45[4];
  *(_OWORD *)(a9 + 168) = v37;
  *(_OWORD *)(a9 + 184) = v45[6];
  v38 = v45[1];
  *(_OWORD *)(a9 + 88) = v45[0];
  *(_OWORD *)(a9 + 104) = v38;
  *(_BYTE *)(a9 + 80) = *(_BYTE *)(v15 + 80);
  *(_OWORD *)(a9 + 120) = v36;
  return sub_10001B56C(v15);
}

uint64_t sub_10001894C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v28;
  double v29;
  double v30;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  unsigned int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _OWORD v45[7];

  v17 = a15;
  v18 = a12;
  v19 = a10;
  v20 = a2 & 1;
  v21 = a1;
  if ((_DWORD)v20)
    v21 = -INFINITY;
  v22 = a4 & 1;
  v23 = a3;
  if ((a4 & 1) != 0)
    v23 = v21;
  v24 = a6 & 1;
  v25 = a8 & 1;
  v26 = a5;
  if ((a6 & 1) != 0)
    v26 = v23;
  if (v21 > v23 || v23 > v26)
    goto LABEL_22;
  v28 = a7;
  if ((a8 & 1) != 0)
    v28 = -INFINITY;
  v29 = a10;
  if ((a11 & 1) != 0)
    v29 = v28;
  v30 = a12;
  if ((a13 & 1) != 0)
    v30 = v29;
  if (v28 > v29 || v29 > v30)
  {
LABEL_22:
    v44 = a7;
    v42 = a1;
    v43 = a5;
    v41 = a3;
    v40 = v20;
    v32 = static os_log_type_t.fault.getter();
    v33 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v32, &_mh_execute_header, v33, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v17 = a15;
    v19 = a10;
    v20 = v40;
    a3 = v41;
    a1 = v42;
    a5 = v43;
    v18 = a12;
    a7 = v44;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v45, *(_QWORD *)&a1, v20, *(_QWORD *)&a3, v22, *(_QWORD *)&a5, v24, *(_QWORD *)&a7, v25, *(_QWORD *)&v19, a11 & 1, *(_QWORD *)&v18, a13 & 1, a14, v17);
  v34 = *(_OWORD *)(v15 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v15 + 32);
  *(_OWORD *)(a9 + 48) = v34;
  v35 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v15;
  *(_OWORD *)(a9 + 16) = v35;
  v36 = v45[2];
  *(_OWORD *)(a9 + 120) = v45[3];
  v37 = v45[5];
  *(_OWORD *)(a9 + 136) = v45[4];
  *(_OWORD *)(a9 + 152) = v37;
  *(_OWORD *)(a9 + 168) = v45[6];
  v38 = v45[1];
  *(_OWORD *)(a9 + 72) = v45[0];
  *(_OWORD *)(a9 + 88) = v38;
  *(_DWORD *)(a9 + 63) = *(_DWORD *)(v15 + 63);
  *(_OWORD *)(a9 + 104) = v36;
  return sub_10001B514(v15);
}

uint64_t sub_100018B08@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v28;
  double v29;
  double v30;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  unsigned int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _OWORD v45[7];

  v17 = a15;
  v18 = a12;
  v19 = a10;
  v20 = a2 & 1;
  v21 = a1;
  if ((_DWORD)v20)
    v21 = -INFINITY;
  v22 = a4 & 1;
  v23 = a3;
  if ((a4 & 1) != 0)
    v23 = v21;
  v24 = a6 & 1;
  v25 = a8 & 1;
  v26 = a5;
  if ((a6 & 1) != 0)
    v26 = v23;
  if (v21 > v23 || v23 > v26)
    goto LABEL_22;
  v28 = a7;
  if ((a8 & 1) != 0)
    v28 = -INFINITY;
  v29 = a10;
  if ((a11 & 1) != 0)
    v29 = v28;
  v30 = a12;
  if ((a13 & 1) != 0)
    v30 = v29;
  if (v28 > v29 || v29 > v30)
  {
LABEL_22:
    v44 = a7;
    v42 = a1;
    v43 = a5;
    v41 = a3;
    v40 = v20;
    v32 = static os_log_type_t.fault.getter();
    v33 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v32, &_mh_execute_header, v33, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v17 = a15;
    v19 = a10;
    v20 = v40;
    a3 = v41;
    a1 = v42;
    a5 = v43;
    v18 = a12;
    a7 = v44;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v45, *(_QWORD *)&a1, v20, *(_QWORD *)&a3, v22, *(_QWORD *)&a5, v24, *(_QWORD *)&a7, v25, *(_QWORD *)&v19, a11 & 1, *(_QWORD *)&v18, a13 & 1, a14, v17);
  v34 = *(_OWORD *)(v15 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v15 + 32);
  *(_OWORD *)(a9 + 48) = v34;
  v35 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v15;
  *(_OWORD *)(a9 + 16) = v35;
  v36 = v45[2];
  *(_OWORD *)(a9 + 120) = v45[3];
  v37 = v45[5];
  *(_OWORD *)(a9 + 136) = v45[4];
  *(_OWORD *)(a9 + 152) = v37;
  *(_OWORD *)(a9 + 168) = v45[6];
  v38 = v45[1];
  *(_OWORD *)(a9 + 72) = v45[0];
  *(_OWORD *)(a9 + 88) = v38;
  *(_BYTE *)(a9 + 64) = *(_BYTE *)(v15 + 64);
  *(_OWORD *)(a9 + 104) = v36;
  return sub_10001B514(v15);
}

uint64_t sub_100018CC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t KeyPath;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;

  v30 = a8;
  v31 = a9;
  v16 = sub_100003CB4(&qword_100031E78);
  __chkstk_darwin(v16);
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = (void *)objc_opt_self(UIColor);
  v20 = Color.init(uiColor:)(objc_msgSend(v19, "labelColor"));
  v21 = Color.init(uiColor:)(objc_msgSend(v19, "tertiaryLabelColor"));
  sub_10001DBB8(a1, a2, v20, a3, a4, a5, a6, a7, (uint64_t)v18, v21);
  swift_release(v20);
  swift_release(v21);
  v22 = *(_QWORD *)(v30 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy14AskToBuyBubble__buttonTapped + 8);
  v32 = *(_BYTE *)(v30 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy14AskToBuyBubble__buttonTapped);
  v33 = v22;
  v23 = sub_100003CB4(&qword_100031E30);
  State.wrappedValue.getter(&v34, v23);
  LOBYTE(v20) = v34;
  KeyPath = swift_getKeyPath(&unk_1000257F0);
  v25 = swift_allocObject(&unk_10002D680, 17, 7);
  *(_BYTE *)(v25 + 16) = v20;
  v26 = v31;
  sub_10000E458((uint64_t)v18, v31, &qword_100031E78);
  v27 = (uint64_t *)(v26 + *(int *)(sub_100003CB4(&qword_100031E60) + 36));
  *v27 = KeyPath;
  v27[1] = (uint64_t)sub_10001B45C;
  v27[2] = v25;
  return sub_100006C90((uint64_t)v18, &qword_100031E78);
}

void *sub_100018E9C(void *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
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
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void (*v31)(void);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
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
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __n128 v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  __n128 v74;
  double v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __n128 v85;
  double v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char v96;
  __n128 v97;
  double v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  void *v108;
  id v109;
  void *v110;
  uint64_t v111;
  char *v113;
  char *v114;
  uint64_t v115;
  NSObject *v116;
  os_log_type_t v117;
  uint8_t *v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  unint64_t v122;
  os_log_t v123;
  uint8_t *v124;
  uint64_t v125;
  uint64_t v126;
  uint8_t *v127;
  uint64_t v128;
  os_log_t v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  int v134;
  uint64_t v135;
  void *v136;
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
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;

  v136 = a1;
  v10 = sub_100003CB4(&qword_100031D60);
  __chkstk_darwin(v10);
  v12 = (char *)&v126 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v135 = sub_100003CB4(&qword_100031D68);
  __chkstk_darwin(v135);
  v140 = (uint64_t)&v126 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v138 = sub_100003CB4(&qword_100031D70);
  __chkstk_darwin(v138);
  v142 = (uint64_t)&v126 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v139 = sub_100003CB4(&qword_100031D78);
  __chkstk_darwin(v139);
  v143 = (uint64_t)&v126 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v141 = sub_100003CB4(&qword_100031D80);
  __chkstk_darwin(v141);
  v145 = (uint64_t)&v126 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v144 = sub_100003CB4(&qword_100031D88);
  v17 = __chkstk_darwin(v144);
  v146 = (uint64_t)&v126 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v20 = (char *)&v126 - v19;
  v132 = type metadata accessor for Logger(0);
  v131 = *(_QWORD *)(v132 - 8);
  __chkstk_darwin(v132);
  v133 = (char *)&v126 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for BMAskToBuyEvent.ProductType(0);
  v23 = *(_QWORD *)(v22 - 8);
  __chkstk_darwin(v22);
  v25 = (char *)&v126 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for MessageDetails(0);
  v27 = __chkstk_darwin(v26);
  v29 = (char *)&v126 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  v147 = v30;
  v31 = *(void (**)(void))(v30 + 16);
  v150 = (uint64_t)&v126 - v32;
  v31();
  v137 = v5;
  v134 = sub_1000153DC();
  if (qword_100031380 != -1)
    swift_once(&qword_100031380, sub_10000E98C);
  v130 = v29;
  v148 = v20;
  v149 = v26;
  v33 = *(_QWORD *)algn_100032B58;
  v155 = qword_100032B50;
  v156 = *(_QWORD *)algn_100032B58;
  v34 = qword_100031340;
  swift_bridgeObjectRetain(*(_QWORD *)algn_100032B58);
  if (v34 != -1)
    swift_once(&qword_100031340, sub_10000E7C8);
  v35 = qword_100032AF8;
  v36 = qword_100032B00;
  v153 = qword_100032AF8;
  v154 = qword_100032B00;
  swift_retain(qword_100032AF8);
  v37 = swift_retain(v36);
  v38 = MessageDetails.productType.getter(v37);
  if (v39)
    v40 = v38;
  else
    v40 = 0;
  if (v39)
    v41 = v39;
  else
    v41 = 0xE000000000000000;
  sub_10001AD0C();
  static BMAskToBuyEvent.productType(withCode:)(v40, v41);
  swift_bridgeObjectRelease(v41);
  v42 = (*(uint64_t (**)(char *, uint64_t))(v23 + 88))(v25, v22);
  if ((_DWORD)v42 == enum case for BMAskToBuyEvent.ProductType.books(_:))
  {
    if (qword_100031388 != -1)
      swift_once(&qword_100031388, sub_10000E9B0);
    v44 = qword_100032B60;
    v43 = *(_QWORD *)algn_100032B68;
    swift_bridgeObjectRetain(*(_QWORD *)algn_100032B68);
    swift_bridgeObjectRelease(v33);
    v155 = v44;
    v156 = v43;
    v45 = v149;
    v46 = v147;
    if (qword_100031350 != -1)
      swift_once(&qword_100031350, sub_10000E828);
    v47 = &qword_100032B18;
LABEL_29:
    v52 = *v47;
    v53 = v47[1];
    swift_retain(*v47);
    swift_retain(v53);
    swift_release(v36);
    v54 = swift_release(v35);
    v153 = v52;
    v154 = v53;
    v55 = (uint64_t)v148;
    goto LABEL_30;
  }
  v45 = v149;
  if ((_DWORD)v42 == enum case for BMAskToBuyEvent.ProductType.iTunes(_:))
  {
    if (qword_100031390 != -1)
      swift_once(&qword_100031390, sub_10000E9D8);
    v49 = qword_100032B70;
    v48 = *(_QWORD *)algn_100032B78;
    swift_bridgeObjectRetain(*(_QWORD *)algn_100032B78);
    swift_bridgeObjectRelease(v33);
    v155 = v49;
    v156 = v48;
    v46 = v147;
    if (qword_100031348 != -1)
      swift_once(&qword_100031348, sub_10000E7F8);
    v47 = &qword_100032B08;
    goto LABEL_29;
  }
  if ((_DWORD)v42 == enum case for BMAskToBuyEvent.ProductType.subscriptions(_:))
  {
    if (qword_1000313A0 != -1)
      swift_once(&qword_1000313A0, sub_10000EA30);
    v51 = qword_100032B90;
    v50 = *(_QWORD *)algn_100032B98;
    swift_bridgeObjectRetain(*(_QWORD *)algn_100032B98);
    swift_bridgeObjectRelease(v33);
    v155 = v51;
    v156 = v50;
    v46 = v147;
    if (qword_100031358 != -1)
      swift_once(&qword_100031358, sub_10000E858);
    v47 = &qword_100032B28;
    goto LABEL_29;
  }
  v113 = v133;
  static PeopleLogger.messages.getter(v42);
  v114 = v130;
  v115 = ((uint64_t (*)(char *, uint64_t, uint64_t))v31)(v130, v150, v45);
  v116 = Logger.logObject.getter(v115);
  v117 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v116, v117))
  {
    v129 = v116;
    v118 = (uint8_t *)swift_slowAlloc(12, -1);
    v127 = v118;
    v119 = swift_slowAlloc(32, -1);
    v128 = v119;
    v152 = v119;
    *(_DWORD *)v118 = 136315138;
    v120 = MessageDetails.productType.getter(v119);
    if (v121)
    {
      v122 = v121;
    }
    else
    {
      v120 = 0;
      v122 = 0xE000000000000000;
    }
    v151 = sub_10000608C(v120, v122, &v152);
    v45 = v149;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v151, &v152, v118 + 4, v118 + 12);
    swift_bridgeObjectRelease(v122);
    v46 = v147;
    (*(void (**)(char *, uint64_t))(v147 + 8))(v114, v45);
    v123 = v129;
    v124 = v127;
    _os_log_impl((void *)&_mh_execute_header, v129, v117, "Unknown product type (%s), defaults to app store", v127, 0xCu);
    v125 = v128;
    swift_arrayDestroy(v128, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v125, -1, -1);
    swift_slowDealloc(v124, -1, -1);

    (*(void (**)(char *, uint64_t))(v131 + 8))(v133, v132);
  }
  else
  {
    v46 = v147;
    (*(void (**)(char *, uint64_t))(v147 + 8))(v114, v45);

    (*(void (**)(char *, uint64_t))(v131 + 8))(v113, v132);
  }
  v55 = (uint64_t)v148;
  v54 = (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v25, v22);
LABEL_30:
  *(_QWORD *)v12 = static HorizontalAlignment.leading.getter(v54);
  *((_QWORD *)v12 + 1) = 0;
  v12[16] = 0;
  v56 = sub_100003CB4(&qword_100031D90);
  v57 = sub_1000199CC(v136, &v155, &v153, v137, v150, v134 & 1, (uint64_t)&v12[*(int *)(v56 + 44)]);
  v58 = static Color.clear.getter(v57);
  v59 = static Edge.Set.all.getter(v58);
  v60 = v140;
  sub_10000E458((uint64_t)v12, v140, &qword_100031D60);
  v61 = v60 + *(int *)(v135 + 36);
  *(_QWORD *)v61 = v58;
  *(_BYTE *)(v61 + 8) = v59;
  v62 = sub_100006C90((uint64_t)v12, &qword_100031D60);
  LOBYTE(v58) = static Edge.Set.top.getter(v62);
  v63.n128_f64[0] = a2 + 12.0;
  v64 = EdgeInsets.init(_all:)(v63);
  v66 = v65;
  v68 = v67;
  v70 = v69;
  v71 = v142;
  sub_10000E458(v60, v142, &qword_100031D68);
  v72 = v71 + *(int *)(v138 + 36);
  *(_BYTE *)v72 = v58;
  *(double *)(v72 + 8) = v64;
  *(_QWORD *)(v72 + 16) = v66;
  *(_QWORD *)(v72 + 24) = v68;
  *(_QWORD *)(v72 + 32) = v70;
  *(_BYTE *)(v72 + 40) = 0;
  v73 = sub_100006C90(v60, &qword_100031D68);
  LOBYTE(v58) = static Edge.Set.trailing.getter(v73);
  v74.n128_f64[0] = a5 + 12.0;
  v75 = EdgeInsets.init(_all:)(v74);
  v77 = v76;
  v79 = v78;
  v81 = v80;
  v82 = v143;
  sub_10000E458(v71, v143, &qword_100031D70);
  v83 = v82 + *(int *)(v139 + 36);
  *(_BYTE *)v83 = v58;
  *(double *)(v83 + 8) = v75;
  *(_QWORD *)(v83 + 16) = v77;
  *(_QWORD *)(v83 + 24) = v79;
  *(_QWORD *)(v83 + 32) = v81;
  *(_BYTE *)(v83 + 40) = 0;
  v84 = sub_100006C90(v71, &qword_100031D70);
  LOBYTE(v58) = static Edge.Set.leading.getter(v84);
  v85.n128_f64[0] = a3 + 12.0;
  v86 = EdgeInsets.init(_all:)(v85);
  v88 = v87;
  v90 = v89;
  v92 = v91;
  v93 = v145;
  sub_10000E458(v82, v145, &qword_100031D78);
  v94 = v93 + *(int *)(v141 + 36);
  *(_BYTE *)v94 = v58;
  *(double *)(v94 + 8) = v86;
  *(_QWORD *)(v94 + 16) = v88;
  *(_QWORD *)(v94 + 24) = v90;
  *(_QWORD *)(v94 + 32) = v92;
  *(_BYTE *)(v94 + 40) = 0;
  v95 = sub_100006C90(v82, &qword_100031D78);
  v96 = static Edge.Set.bottom.getter(v95);
  if (qword_1000312D8 != -1)
    swift_once(&qword_1000312D8, sub_10000E644);
  v97.n128_u64[0] = 8.0;
  if (byte_100031798)
    v97.n128_f64[0] = 7.0;
  v97.n128_f64[0] = v97.n128_f64[0] + a4;
  v98 = EdgeInsets.init(_all:)(v97);
  v100 = v99;
  v102 = v101;
  v104 = v103;
  sub_10000E458(v93, v55, &qword_100031D80);
  v105 = v55 + *(int *)(v144 + 36);
  *(_BYTE *)v105 = v96;
  *(double *)(v105 + 8) = v98;
  *(_QWORD *)(v105 + 16) = v100;
  *(_QWORD *)(v105 + 24) = v102;
  *(_QWORD *)(v105 + 32) = v104;
  *(_BYTE *)(v105 + 40) = 0;
  sub_100006C90(v93, &qword_100031D80);
  v106 = v146;
  sub_10000E458(v55, v146, &qword_100031D88);
  v107 = objc_allocWithZone((Class)sub_100003CB4(&qword_100031D98));
  v108 = (void *)UIHostingController.init(rootView:)(v106);
  UIHostingController.safeAreaRegions.setter(0);
  v109 = objc_msgSend(v108, "view");
  if (v109)
  {
    v110 = v109;
    v111 = sub_100003CB4(&qword_100031DA0);
    if (swift_dynamicCastClass(v110, v111))
      dispatch thunk of _UIHostingView.safeAreaRegions.setter(0);

  }
  sub_100006C90(v55, &qword_100031D88);
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v150, v45);
  swift_release(v153);
  swift_release(v154);
  swift_bridgeObjectRelease(v156);
  return v108;
}

uint64_t sub_1000199CC@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, uint64_t a7@<X8>)
{
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  _OWORD *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v74;
  int v75;
  _QWORD v76[2];
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _OWORD v93[22];
  _BYTE v94[216];
  char v95;
  char v96;
  char v97;
  char v98;
  char v99;
  char v100;
  char v101;
  _QWORD v102[44];
  uint64_t v103;
  char v104;
  uint64_t v105;
  char v106;
  uint64_t v107;
  char v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  char v114;
  __int128 v115;
  uint64_t v116;
  unsigned __int8 v117;
  uint64_t v118;
  unsigned __int8 v119;
  uint64_t v120;
  uint64_t v121;
  _OWORD v122[13];
  char v123;

  v84 = a6;
  v76[1] = a5;
  v91 = a7;
  v11 = sub_100003CB4(&qword_100031DA8);
  __chkstk_darwin(v11);
  v13 = (char *)v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = sub_100003CB4(&qword_100031DB0);
  __chkstk_darwin(v83);
  v88 = (uint64_t)v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = sub_100003CB4(&qword_100031DB8);
  v15 = __chkstk_darwin(v85);
  v90 = (uint64_t)v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v86 = (uint64_t)v76 - v18;
  __chkstk_darwin(v17);
  v89 = (uint64_t)v76 - v19;
  v80 = type metadata accessor for AccessibilityChildBehavior(0);
  v78 = *(_QWORD *)(v80 - 8);
  __chkstk_darwin(v80);
  v21 = (char *)v76 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = sub_100003CB4(&qword_100031DC0);
  v22 = *(_QWORD *)(v81 - 8);
  __chkstk_darwin(v81);
  v24 = (char *)v76 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_100003CB4(&qword_100031DC8);
  v25 = __chkstk_darwin(v79);
  v87 = (uint64_t)v76 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __chkstk_darwin(v25);
  v29 = (char *)v76 - v28;
  v30 = __chkstk_darwin(v27);
  v92 = (uint64_t)v76 - v31;
  v77 = static VerticalAlignment.top.getter(v30);
  v82 = a4;
  v32 = sub_10001A2D0(a1, a2, a3, a4, (uint64_t)v122);
  if (qword_100031368 != -1)
    v32 = swift_once(&qword_100031368, sub_10000E89C);
  v33 = qword_100032B38;
  v34 = static Alignment.center.getter(v32);
  *(_OWORD *)&v94[167] = v122[10];
  *(_OWORD *)&v94[183] = v122[11];
  *(_OWORD *)&v94[199] = v122[12];
  *(_OWORD *)&v94[103] = v122[6];
  *(_OWORD *)&v94[119] = v122[7];
  *(_OWORD *)&v94[135] = v122[8];
  *(_OWORD *)&v94[151] = v122[9];
  *(_OWORD *)&v94[39] = v122[2];
  *(_OWORD *)&v94[55] = v122[3];
  *(_OWORD *)&v94[71] = v122[4];
  *(_OWORD *)&v94[87] = v122[5];
  *(_OWORD *)&v94[7] = v122[0];
  v95 = 0;
  v94[215] = v123;
  *(_OWORD *)&v94[23] = v122[1];
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(&v103, 0, 1, 0, 1, 0, 1, v33, 0, 0, 1, 0, 1, v34, v35);
  *(_OWORD *)((char *)&v93[11] + 1) = *(_OWORD *)&v94[160];
  *(_OWORD *)((char *)&v93[12] + 1) = *(_OWORD *)&v94[176];
  *(_OWORD *)((char *)&v93[13] + 1) = *(_OWORD *)&v94[192];
  *(_OWORD *)((char *)&v93[7] + 1) = *(_OWORD *)&v94[96];
  *(_OWORD *)((char *)&v93[8] + 1) = *(_OWORD *)&v94[112];
  *(_OWORD *)((char *)&v93[9] + 1) = *(_OWORD *)&v94[128];
  *(_OWORD *)((char *)&v93[10] + 1) = *(_OWORD *)&v94[144];
  *(_OWORD *)((char *)&v93[3] + 1) = *(_OWORD *)&v94[32];
  *(_OWORD *)((char *)&v93[4] + 1) = *(_OWORD *)&v94[48];
  *(_OWORD *)((char *)&v93[5] + 1) = *(_OWORD *)&v94[64];
  *(_OWORD *)((char *)&v93[6] + 1) = *(_OWORD *)&v94[80];
  *(_OWORD *)((char *)&v93[1] + 1) = *(_OWORD *)v94;
  v101 = v104;
  v100 = v106;
  v99 = v108;
  v98 = v110;
  v97 = v112;
  v96 = v114;
  v93[0] = (unint64_t)v77;
  LOBYTE(v93[1]) = 0;
  *(_QWORD *)((char *)&v93[14] + 1) = *(_QWORD *)&v94[208];
  *(_OWORD *)((char *)&v93[2] + 1) = *(_OWORD *)&v94[16];
  *(_QWORD *)&v93[15] = v103;
  BYTE8(v93[15]) = v104;
  *(_QWORD *)&v93[16] = v105;
  BYTE8(v93[16]) = v106;
  *(_QWORD *)&v93[17] = v107;
  BYTE8(v93[17]) = v108;
  *(_QWORD *)&v93[18] = v109;
  BYTE8(v93[18]) = v110;
  *(_QWORD *)&v93[19] = v111;
  BYTE8(v93[19]) = v112;
  *(_QWORD *)&v93[20] = v113;
  BYTE8(v93[20]) = v114;
  v93[21] = v115;
  static AccessibilityChildBehavior.combine.getter();
  v36 = sub_100003CB4(&qword_100031DD0);
  v37 = sub_10001AD48();
  View.accessibilityElement(children:)(v21, v36, v37);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v21, v80);
  memcpy(v102, v93, sizeof(v102));
  v38 = sub_10001ADCC(v102);
  v39 = static Color.clear.getter(v38);
  LOBYTE(v36) = static Edge.Set.all.getter(v39);
  v40 = v81;
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v29, v24, v81);
  v41 = &v29[*(int *)(v79 + 36)];
  *(_QWORD *)v41 = v39;
  v41[8] = v36;
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v40);
  v42 = sub_100013A08((uint64_t)v29, v92, &qword_100031DC8);
  v43 = static Alignment.center.getter(v42);
  v45 = _FrameLayout.init(width:height:alignment:)(&v116, 0, 1, 0x4028000000000000, 0, v43, v44);
  v81 = v116;
  LODWORD(v80) = v117;
  v79 = v118;
  LODWORD(v78) = v119;
  v46 = v120;
  v77 = v121;
  *(_QWORD *)v13 = static HorizontalAlignment.center.getter(v45);
  *((_QWORD *)v13 + 1) = 0;
  v13[16] = 0;
  sub_100003CB4(&qword_100031DF0);
  v47 = v84;
  sub_10001A698(v84 & 1, v82);
  if (qword_100031378 != -1)
    swift_once(&qword_100031378, sub_10000E934);
  v48 = qword_100032B48;
  v49 = swift_retain(qword_100032B48);
  v50 = static Edge.Set.all.getter(v49);
  v51 = v88;
  sub_10000E458((uint64_t)v13, v88, &qword_100031DA8);
  v52 = v51 + *(int *)(v83 + 36);
  *(_QWORD *)v52 = v48;
  *(_BYTE *)(v52 + 8) = v50;
  v53 = sub_100006C90((uint64_t)v13, &qword_100031DA8);
  if ((v47 & 1) == 0)
    goto LABEL_9;
  if (qword_1000312D8 != -1)
    v53 = swift_once(&qword_1000312D8, sub_10000E644);
  if ((byte_100031798 & 1) == 0)
  {
    v58 = 8.0;
    if (qword_100031360 != -1)
    {
      swift_once(&qword_100031360, sub_10000E888);
      v58 = 8.0;
      if (byte_100031798)
        v58 = 7.0;
    }
    v54 = *(double *)&qword_1000317A0 - v58;
    v55 = ((uint64_t (*)(void))static Alignment.top.getter)();
    v57 = v59;
  }
  else
  {
LABEL_9:
    v54 = 0.0;
    v55 = static Alignment.top.getter(v53);
    v57 = v56;
  }
  LOBYTE(v75) = 1;
  LOBYTE(v74) = 1;
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v93, 0, 1, 0, 1, 0, 1, *(_QWORD *)&v54, 0, 0, v74, 0, v75, v55, v57);
  v60 = v86;
  sub_10000E458(v51, v86, &qword_100031DB0);
  v61 = (_OWORD *)(v60 + *(int *)(v85 + 36));
  v62 = v93[5];
  v61[4] = v93[4];
  v61[5] = v62;
  v61[6] = v93[6];
  v63 = v93[1];
  *v61 = v93[0];
  v61[1] = v63;
  v64 = v93[3];
  v61[2] = v93[2];
  v61[3] = v64;
  sub_100006C90(v51, &qword_100031DB0);
  v65 = v89;
  sub_100013A08(v60, v89, &qword_100031DB8);
  v66 = v92;
  v67 = v87;
  sub_10000E458(v92, v87, &qword_100031DC8);
  v68 = v90;
  sub_10000E458(v65, v90, &qword_100031DB8);
  v69 = v91;
  sub_10000E458(v67, v91, &qword_100031DC8);
  v70 = sub_100003CB4(&qword_100031DF8);
  v71 = v69 + *(int *)(v70 + 48);
  *(_QWORD *)v71 = 0;
  *(_BYTE *)(v71 + 8) = 1;
  *(_QWORD *)(v71 + 16) = v81;
  *(_BYTE *)(v71 + 24) = v80;
  *(_QWORD *)(v71 + 32) = v79;
  *(_BYTE *)(v71 + 40) = v78;
  v72 = v77;
  *(_QWORD *)(v71 + 48) = v46;
  *(_QWORD *)(v71 + 56) = v72;
  sub_10000E458(v68, v69 + *(int *)(v70 + 64), &qword_100031DB8);
  sub_100006C90(v65, &qword_100031DB8);
  sub_100006C90(v66, &qword_100031DC8);
  sub_100006C90(v68, &qword_100031DB8);
  return sub_100006C90(v67, &qword_100031DC8);
}

uint64_t sub_10001A2D0@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
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
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  id v43;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[8];
  char v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;

  v7 = *a2;
  v8 = a2[1];
  v9 = *a3;
  v10 = a3[1];
  v11 = a1;
  swift_bridgeObjectRetain(v8);
  swift_retain(v9);
  swift_retain(v10);
  v12 = swift_retain(a4);
  v13 = static Color.white.getter(v12);
  v14 = sub_100021074(v11, v7, v8, v13, v9, v10, (uint64_t)sub_10001AFE4, a4, (uint64_t)v56);
  v15 = static Alignment.center.getter(v14);
  _FrameLayout.init(width:height:alignment:)(&v58, 0x4028000000000000, 0, 0, 1, v15, v16);
  v54 = v62;
  v55 = v63;
  v50 = v59;
  v51 = v61;
  v52 = v58;
  v53 = v60;
  v17 = String.localized.getter(0x4674736575716552, 0xEB000000006D6F72);
  v19 = v18;
  v20 = sub_100003CB4(&qword_100031B80);
  v21 = swift_allocObject(v20, 72, 7);
  *(_OWORD *)(v21 + 16) = xmmword_100025400;
  v22 = MessageDetails.childName.getter();
  v24 = v23;
  *(_QWORD *)(v21 + 56) = &type metadata for String;
  *(_QWORD *)(v21 + 64) = sub_100017A38();
  *(_QWORD *)(v21 + 32) = v22;
  *(_QWORD *)(v21 + 40) = v24;
  v49 = String.init(format:_:)(v17, v19, v21);
  v26 = v25;
  v27 = swift_bridgeObjectRelease(v19);
  v48 = MessageDetails.bubbleCaption.getter(v27);
  v29 = v28;
  MessageDetails._bubbleCaption.getter();
  v31 = v30;
  v32 = swift_bridgeObjectRelease(v30);
  v47 = v31 != 0;
  v46 = static HorizontalAlignment.leading.getter(v32);
  swift_bridgeObjectRetain(v26);
  v33 = swift_bridgeObjectRetain(v29);
  v45 = static Color.clear.getter(v33);
  LOBYTE(v24) = static Edge.Set.all.getter();
  swift_bridgeObjectRelease(v26);
  swift_bridgeObjectRelease(v29);
  v34 = (void *)v56[0];
  v35 = v56[1];
  v36 = v56[2];
  v37 = v56[3];
  v39 = v56[4];
  v38 = v56[5];
  v40 = v56[6];
  v41 = v56[7];
  v42 = v57 & 1;
  *(_QWORD *)a5 = v56[0];
  *(_QWORD *)(a5 + 8) = v35;
  *(_QWORD *)(a5 + 16) = v36;
  *(_QWORD *)(a5 + 24) = v37;
  *(_QWORD *)(a5 + 32) = v39;
  *(_QWORD *)(a5 + 40) = v38;
  *(_QWORD *)(a5 + 48) = v40;
  *(_QWORD *)(a5 + 56) = v41;
  *(_BYTE *)(a5 + 64) = v42;
  *(_QWORD *)(a5 + 72) = 0;
  *(_BYTE *)(a5 + 80) = 1;
  *(_QWORD *)(a5 + 88) = v52;
  *(_BYTE *)(a5 + 96) = v50;
  *(_QWORD *)(a5 + 104) = v53;
  *(_BYTE *)(a5 + 112) = v51;
  *(_QWORD *)(a5 + 120) = v54;
  *(_QWORD *)(a5 + 128) = v55;
  *(_QWORD *)(a5 + 136) = v46;
  *(_QWORD *)(a5 + 144) = 0;
  *(_BYTE *)(a5 + 152) = 0;
  *(_QWORD *)(a5 + 160) = v49;
  *(_QWORD *)(a5 + 168) = v26;
  *(_QWORD *)(a5 + 176) = v48;
  *(_QWORD *)(a5 + 184) = v29;
  *(_BYTE *)(a5 + 192) = v47;
  *(_QWORD *)(a5 + 200) = v45;
  *(_BYTE *)(a5 + 208) = v24;
  v43 = v34;
  swift_bridgeObjectRetain(v36);
  swift_retain(v37);
  swift_retain(v39);
  swift_retain(v38);
  sub_10001AFEC(v40, v41);
  swift_release(v38);
  swift_release(v39);
  swift_release(v37);
  swift_bridgeObjectRelease(v36);

  return sub_10001AE6C(v40, v41);
}

uint64_t sub_10001A5B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v0 = type metadata accessor for PeopleAnalytics.MessageRequestBubbleSource(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_1000151D8();
  if ((result & 1) == 0)
  {
    type metadata accessor for PeopleAnalytics(0);
    v5 = static PeopleAnalytics.shared.getter();
    (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for PeopleAnalytics.MessageRequestBubbleSource.askToBuy(_:), v0);
    dispatch thunk of PeopleAnalytics.logRequestBubbleInteraction(_:isPreview:didAct:)(v3, 1, 0);
    swift_release(v5);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return sub_10001B8BC();
  }
  return result;
}

uint64_t sub_10001A698(char a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  BOOL v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  unint64_t v23;
  unint64_t v24;
  _OWORD v25[3];
  uint64_t v26;

  v4 = sub_100003CB4(&qword_100031E00);
  __chkstk_darwin(v4);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100003CB4(&qword_100031E08);
  __chkstk_darwin(v7);
  v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    v10 = sub_1000151D8();
    v11 = !v10;
    if (v10)
      v12 = 0xD000000000000016;
    else
      v12 = 0xD000000000000013;
    if (v11)
      v13 = 0x80000001000248A0;
    else
      v13 = 0x80000001000248C0;
    v14 = String.localized.getter(v12, v13);
    v16 = v15;
    swift_bridgeObjectRelease(v13);
    swift_retain(a2);
    sub_100017BD8(v14, v16, (uint64_t)sub_10001AF44, a2, (uint64_t)v9);
    swift_bridgeObjectRelease(v16);
    swift_release(a2);
    sub_10000E458((uint64_t)v9, (uint64_t)v6, &qword_100031E08);
    swift_storeEnumTagMultiPayload(v6, v4, 0);
    v17 = sub_10001AE7C();
    v18 = sub_10001AF00();
    _ConditionalContent<>.init(storage:)(v6, v7, &type metadata for RequestStatusView, v17, v18);
    return sub_100006C90((uint64_t)v9, &qword_100031E08);
  }
  else
  {
    sub_100016DAC(v25);
    v20 = v26;
    v21 = v25[1];
    v22 = v25[2];
    *(_OWORD *)v6 = v25[0];
    *((_OWORD *)v6 + 1) = v21;
    *((_OWORD *)v6 + 2) = v22;
    *((_QWORD *)v6 + 6) = v20;
    swift_storeEnumTagMultiPayload(v6, v4, 1);
    v23 = sub_10001AE7C();
    v24 = sub_10001AF00();
    return _ConditionalContent<>.init(storage:)(v6, v7, &type metadata for RequestStatusView, v23, v24);
  }
}

uint64_t sub_10001A8A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _BYTE v14[9];
  uint64_t v15;

  v2 = sub_100003CB4(&qword_1000314A8);
  __chkstk_darwin(v2);
  v4 = &v14[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 1];
  v5 = *(_QWORD *)(a1 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy14AskToBuyBubble__buttonTapped + 8);
  v14[1] = *(_BYTE *)(a1 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy14AskToBuyBubble__buttonTapped);
  v15 = v5;
  v14[0] = 1;
  v6 = sub_100003CB4(&qword_100031E30);
  State.wrappedValue.setter(v14, v6);
  v7 = type metadata accessor for TaskPriority(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v4, 1, 1, v7);
  type metadata accessor for MainActor(0);
  v8 = swift_retain(a1);
  v9 = static MainActor.shared.getter(v8);
  v10 = (_QWORD *)swift_allocObject(&unk_10002D630, 40, 7);
  v10[2] = v9;
  v10[3] = &protocol witness table for MainActor;
  v10[4] = a1;
  v11 = sub_100004258((uint64_t)v4, (uint64_t)&unk_100031E40, (uint64_t)v10);
  return swift_release(v11);
}

uint64_t sub_10001A9C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t);

  v4[4] = a4;
  v6 = type metadata accessor for MainActor(0);
  v4[5] = v6;
  v4[6] = static MainActor.shared.getter(v6);
  v7 = a4 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer_details;
  v10 = (uint64_t (*)(uint64_t))((char *)&dword_100031F28 + dword_100031F28);
  v8 = (_QWORD *)swift_task_alloc(unk_100031F2C);
  v4[7] = v8;
  *v8 = v4;
  v8[1] = sub_10001AA58;
  return v10(v7);
}

uint64_t sub_10001AA58()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 56));
  v2 = (_QWORD *)swift_task_alloc(async function pointer to static Task<>.sleep(nanoseconds:)[1]);
  *(_QWORD *)(v1 + 64) = v2;
  *v2 = v4;
  v2[1] = sub_10001AAC4;
  return static Task<>.sleep(nanoseconds:)(4000000000);
}

uint64_t sub_10001AAC4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();
  uint64_t v8;

  v2 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 64));
  v3 = *(_QWORD *)(v2 + 40);
  if (v0)
  {
    swift_errorRelease(v0);
    v4 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
    v6 = v5;
    v7 = sub_10001B5D8;
  }
  else
  {
    v4 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
    v6 = v8;
    v7 = sub_10001AB70;
  }
  return swift_task_switch(v7, v4, v6);
}

uint64_t sub_10001AB70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 32);
  swift_release(*(_QWORD *)(v0 + 48));
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy14AskToBuyBubble__buttonTapped + 8);
  *(_BYTE *)(v0 + 16) = *(_BYTE *)(v1 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy14AskToBuyBubble__buttonTapped);
  *(_QWORD *)(v0 + 24) = v2;
  *(_BYTE *)(v0 + 72) = 0;
  v3 = sub_100003CB4(&qword_100031E30);
  State.wrappedValue.setter(v0 + 72, v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001ABE4()
{
  uint64_t v0;

  return swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy14AskToBuyBubble__buttonTapped + 8));
}

uint64_t sub_10001ABF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy22BubbleContentContainer_details;
  v2 = type metadata accessor for MessageDetails(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC22PeopleMessagesAskToBuy14AskToBuyBubble__buttonTapped + 8));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_10001AC88()
{
  return type metadata accessor for AskToBuyBubble(0);
}

uint64_t type metadata accessor for AskToBuyBubble(uint64_t a1)
{
  uint64_t result;

  result = qword_100031BC0;
  if (!qword_100031BC0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AskToBuyBubble);
  return result;
}

uint64_t sub_10001ACCC(uint64_t a1)
{
  void *v2;

  v2 = &unk_1000257D8;
  return swift_updateClassMetadata2(a1, 256, 1, &v2, a1 + 304);
}

unint64_t sub_10001AD0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032060;
  if (!qword_100032060)
  {
    v1 = objc_opt_self(BMAskToBuyEvent);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100032060);
  }
  return result;
}

unint64_t sub_10001AD48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100031DD8;
  if (!qword_100031DD8)
  {
    v1 = sub_10000E2DC(&qword_100031DD0);
    sub_10001B3B4(&qword_100031DE0, &qword_100031DE8, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100031DD8);
  }
  return result;
}

_QWORD *sub_10001ADCC(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (void *)a1[3];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = a1[9];
  v7 = a1[10];
  v8 = a1[24];
  v9 = a1[26];
  v10 = a1[28];
  swift_release(a1[8]);
  swift_release(v5);
  swift_release(v4);
  swift_bridgeObjectRelease(v3);

  sub_10001AE6C(v6, v7);
  swift_release(v10);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v8);
  return a1;
}

uint64_t sub_10001AE6C(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

unint64_t sub_10001AE7C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100031E10;
  if (!qword_100031E10)
  {
    v1 = sub_10000E2DC(&qword_100031E08);
    sub_10001B3B4(&qword_100031E18, &qword_100031E20, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100031E10);
  }
  return result;
}

unint64_t sub_10001AF00()
{
  unint64_t result;

  result = qword_100031E28;
  if (!qword_100031E28)
  {
    result = swift_getWitnessTable(&unk_100025B14, &type metadata for RequestStatusView);
    atomic_store(result, (unint64_t *)&qword_100031E28);
  }
  return result;
}

uint64_t sub_10001AF44()
{
  uint64_t v0;

  return sub_10001A8A8(v0);
}

uint64_t sub_10001AF4C()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001AF78(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_100031E3C);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_100006270;
  return sub_10001A9C8(a1, v4, v5, v6);
}

uint64_t sub_10001AFE4()
{
  return sub_10001A5B8();
}

uint64_t sub_10001AFEC(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

double sub_10001AFFC(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_BYTE *)(a1 + 128) = 1;
  return result;
}

uint64_t sub_10001B01C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001B040()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10001B060@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_100018CC4(v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], a1);
}

unint64_t sub_10001B074()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100031E68;
  if (!qword_100031E68)
  {
    v1 = sub_10000E2DC(&qword_100031E60);
    sub_10001B0F8();
    sub_10001B3B4(&qword_100031F10, &qword_100031F18, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyTransformModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100031E68);
  }
  return result;
}

unint64_t sub_10001B0F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100031E70;
  if (!qword_100031E70)
  {
    v1 = sub_10000E2DC(&qword_100031E78);
    sub_10001B17C();
    sub_10001B3B4(&qword_100031F00, &qword_100031F08, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100031E70);
  }
  return result;
}

unint64_t sub_10001B17C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100031E80;
  if (!qword_100031E80)
  {
    v1 = sub_10000E2DC(&qword_100031E88);
    sub_10001B200();
    sub_10001B3B4(&qword_100031EF0, &qword_100031EF8, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100031E80);
  }
  return result;
}

unint64_t sub_10001B200()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100031E90;
  if (!qword_100031E90)
  {
    v1 = sub_10000E2DC(&qword_100031E98);
    sub_10001B2A4(&qword_100031EA0, &qword_100031EA8, (void (*)(void))sub_10001B30C);
    sub_10001B3B4(&qword_100031EE0, &qword_100031EE8, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100031E90);
  }
  return result;
}

uint64_t sub_10001B2A4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000E2DC(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001B30C()
{
  return sub_10001B2A4(&qword_100031EB0, &qword_100031EB8, (void (*)(void))sub_10001B330);
}

unint64_t sub_10001B330()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100031EC0;
  if (!qword_100031EC0)
  {
    v1 = sub_10000E2DC(&qword_100031EC8);
    sub_10001B3B4(&qword_100031ED0, &qword_100031ED8, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100031EC0);
  }
  return result;
}

uint64_t sub_10001B3B4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000E2DC(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001B3F4(uint64_t result)
{
  *(_BYTE *)(result + 128) = 0;
  return result;
}

uint64_t sub_10001B3FC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10001B428(unsigned __int8 *a1)
{
  return EnvironmentValues.isEnabled.setter(*a1);
}

uint64_t sub_10001B44C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE *sub_10001B45C(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_10001B474(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 88);
  sub_10001B504(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_retain(v7);
  swift_retain(v8);
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  return a1;
}

uint64_t sub_10001B504(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_10001B514(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  sub_10001B504(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_retain(v4);
  return a1;
}

uint64_t sub_10001B56C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 72);
  sub_10001B504(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  return a1;
}

unint64_t sub_10001B5DC(uint64_t a1)
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
  sub_100003CB4(&qword_100031F30);
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
    sub_10001C358(v7, (uint64_t)&v16);
    v8 = v16;
    v9 = v17;
    result = sub_10001B778(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_10001C3A0(&v18, (_OWORD *)(v4[7] + 32 * result));
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

uint64_t sub_10001B704(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (!a2)
    return swift_continuation_throwingResume(*(_QWORD *)(a1 + 32));
  v4 = sub_100003CB4(&qword_1000316F8);
  v5 = swift_allocError(v4, &protocol self-conformance witness table for Error, 0, 0);
  *v6 = a2;
  v7 = a2;
  return swift_continuation_throwingResumeWithError(v2, v5);
}

unint64_t sub_10001B778(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10001B7DC(a1, a2, v5);
}

unint64_t sub_10001B7DC(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_10001B8BC()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  char *v33;
  uint64_t v34;
  id v35;
  NSURL *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  Class isa;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  void (*v54)(char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  void (*v65)(char *, uint64_t);
  void (*v66)(char *, uint64_t);
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  uint8_t *v70;
  void (*v71)(char *, uint64_t);
  uint64_t v72;
  uint64_t v73;
  char *v74;
  unsigned int v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  v0 = type metadata accessor for Logger(0);
  v78 = *(_QWORD *)(v0 - 8);
  v79 = v0;
  v1 = __chkstk_darwin(v0);
  v3 = (char *)&v72 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __chkstk_darwin(v1);
  v6 = (char *)&v72 - v5;
  v7 = __chkstk_darwin(v4);
  v9 = (char *)&v72 - v8;
  __chkstk_darwin(v7);
  v77 = (char *)&v72 - v10;
  v11 = sub_100003CB4(&qword_1000314C8);
  __chkstk_darwin(v11);
  v13 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for URL(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v72 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __chkstk_darwin(v16);
  v21 = (char *)&v72 - v20;
  v22 = __chkstk_darwin(v19);
  v24 = (char *)&v72 - v23;
  v25 = MessageDetails.storeLink.getter(v22);
  if (!v26)
  {
LABEL_4:
    v28 = static PeopleLogger.messages.getter(v25);
    v29 = Logger.logObject.getter(v28);
    v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Storelink URL failure ", v31, 2u);
      swift_slowDealloc(v31, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v78 + 8))(v3, v79);
  }
  v27 = v26;
  URL.init(string:)(v25);
  swift_bridgeObjectRelease(v27);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    v25 = sub_10001C2D0((uint64_t)v13);
    goto LABEL_4;
  }
  v33 = v24;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v24, v13, v14);
  v34 = static AMSBagHelper.isTrustedDomain(for:)(v24);
  if ((v34 & 1) != 0)
  {
    v35 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
    if (v35)
    {
      v37 = v35;
      URL._bridgeToObjectiveC()(v36);
      v39 = v38;
      v40 = sub_10001B5DC((uint64_t)&_swiftEmptyArrayStorage);
      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v40);
      v75 = objc_msgSend(v37, "openSensitiveURL:withOptions:", v39, isa);

      v42 = v77;
      static PeopleLogger.messages.getter(v43);
      v44 = (*(uint64_t (**)(char *, char *, uint64_t))(v15 + 16))(v21, v33, v14);
      v45 = v33;
      v46 = Logger.logObject.getter(v44);
      v47 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v46, v47))
      {
        v48 = swift_slowAlloc(18, -1);
        v74 = (char *)&type metadata for Any + 8;
        v49 = v48;
        v73 = swift_slowAlloc(32, -1);
        v81 = v73;
        *(_DWORD *)v49 = 136315394;
        v50 = sub_10001C310();
        v76 = v45;
        v51 = dispatch thunk of CustomStringConvertible.description.getter(v14, v50);
        v53 = v52;
        v80 = sub_10000608C(v51, v52, &v81);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v49 + 4, v49 + 12);
        swift_bridgeObjectRelease(v53);
        v54 = *(void (**)(char *, uint64_t))(v15 + 8);
        v54(v21, v14);
        *(_WORD *)(v49 + 12) = 1024;
        LODWORD(v80) = v75;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, (char *)&v80 + 4, v49 + 14, v49 + 18);
        _os_log_impl((void *)&_mh_execute_header, v46, v47, "storeLink url: %s opened: %{BOOL}d", (uint8_t *)v49, 0x12u);
        v55 = v73;
        swift_arrayDestroy(v73, 1, v74);
        swift_slowDealloc(v55, -1, -1);
        swift_slowDealloc(v49, -1, -1);

        (*(void (**)(char *, uint64_t))(v78 + 8))(v42, v79);
        return ((uint64_t (*)(char *, uint64_t))v54)(v76, v14);
      }
      else
      {

        v71 = *(void (**)(char *, uint64_t))(v15 + 8);
        v71(v21, v14);
        (*(void (**)(char *, uint64_t))(v78 + 8))(v42, v79);
        return ((uint64_t (*)(char *, uint64_t))v71)(v45, v14);
      }
    }
    else
    {
      v67 = static PeopleLogger.messages.getter(0);
      v68 = Logger.logObject.getter(v67);
      v69 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v68, v69))
      {
        v70 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v70 = 0;
        _os_log_impl((void *)&_mh_execute_header, v68, v69, "Failed to get workspace in bubble action", v70, 2u);
        swift_slowDealloc(v70, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v78 + 8))(v9, v79);
      return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v33, v14);
    }
  }
  else
  {
    static PeopleLogger.messages.getter(v34);
    v56 = (*(uint64_t (**)(char *, char *, uint64_t))(v15 + 16))(v18, v24, v14);
    v57 = Logger.logObject.getter(v56);
    v58 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = (uint8_t *)swift_slowAlloc(12, -1);
      v60 = swift_slowAlloc(32, -1);
      v81 = v60;
      v76 = v33;
      *(_DWORD *)v59 = 136315138;
      v77 = (char *)(v59 + 4);
      v61 = sub_10001C310();
      v62 = dispatch thunk of CustomStringConvertible.description.getter(v14, v61);
      v64 = v63;
      v80 = sub_10000608C(v62, v63, &v81);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v77, v59 + 12);
      swift_bridgeObjectRelease(v64);
      v65 = *(void (**)(char *, uint64_t))(v15 + 8);
      v65(v18, v14);
      _os_log_impl((void *)&_mh_execute_header, v57, v58, "Storelink not trusted: %s", v59, 0xCu);
      swift_arrayDestroy(v60, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v60, -1, -1);
      swift_slowDealloc(v59, -1, -1);

      (*(void (**)(char *, uint64_t))(v78 + 8))(v6, v79);
      return ((uint64_t (*)(char *, uint64_t))v65)(v76, v14);
    }
    else
    {

      v66 = *(void (**)(char *, uint64_t))(v15 + 8);
      v66(v18, v14);
      (*(void (**)(char *, uint64_t))(v78 + 8))(v6, v79);
      return ((uint64_t (*)(char *, uint64_t))v66)(v33, v14);
    }
  }
}

uint64_t sub_10001BF8C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[15] = a1;
  v2 = type metadata accessor for Logger(0);
  v1[16] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[17] = v3;
  v1[18] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for PeopleAnalytics.MessageRequestBubbleSource(0);
  v1[19] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v1[20] = v5;
  v1[21] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10001C014, 0, 0);
}

uint64_t sub_10001C014()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  uint64_t v7;

  v1 = v0;
  v2 = v0 + 2;
  v1[22] = type metadata accessor for PeopleAnalytics(0);
  static PeopleAnalytics.trackAction(_:extensionBundleID:isNotification:)(2003134838, 0xE400000000000000, 0xD000000000000027, 0x80000001000248F0, 0);
  v3 = (void *)objc_opt_self(APRequestHandler);
  MessageDetails.requestID.getter(v3);
  v5 = v4;
  v6 = String._bridgeToObjectiveC()();
  v1[23] = v6;
  swift_bridgeObjectRelease(v5);
  v1[2] = v1;
  v1[3] = sub_10001C11C;
  v7 = swift_continuation_init(v2, 1);
  v1[10] = _NSConcreteStackBlock;
  v1 += 10;
  v1[1] = 0x40000000;
  v1[2] = sub_10001B704;
  v1[3] = &unk_10002D6B0;
  v1[4] = v7;
  objc_msgSend(v3, "presentApprovalSheetWithRequestIdentifier:completion:", v6, v1);
  return swift_continuation_await(v2);
}

uint64_t sub_10001C11C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 192) = v1;
  if (v1)
    v2 = sub_10001C21C;
  else
    v2 = sub_10001C17C;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001C17C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 160);
  v1 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 152);

  v4 = static PeopleAnalytics.shared.getter();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, enum case for PeopleAnalytics.MessageRequestBubbleSource.askToBuy(_:), v3);
  dispatch thunk of PeopleAnalytics.logRequestBubbleInteraction(_:isPreview:didAct:)(v1, 0, 1);
  swift_release(v4);
  v5 = *(_QWORD *)(v0 + 168);
  v6 = *(_QWORD *)(v0 + 144);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(v5, *(_QWORD *)(v0 + 152));
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001C21C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(v0 + 184);
  v1 = *(_QWORD *)(v0 + 192);
  swift_willThrow();

  static PeopleLogger.messages.getter();
  swift_errorRetain(v1);
  Logger.ifError(_:message:)(v1, 0xD000000000000018, 0x8000000100024940);
  swift_errorRelease(v1);
  swift_errorRelease(v1);
  v3 = *(_QWORD *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 168);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(v3, *(_QWORD *)(v0 + 128));
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001C2D0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003CB4(&qword_1000314C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10001C310()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100031640;
  if (!qword_100031640)
  {
    v1 = type metadata accessor for URL(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for URL, v1);
    atomic_store(result, (unint64_t *)&qword_100031640);
  }
  return result;
}

uint64_t sub_10001C358(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003CB4(&qword_100031F38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10001C3A0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10001C3B4(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  result = type metadata accessor for StatusType(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = "\b";
    v4[2] = &unk_100025890;
    result = swift_initClassMetadata2(a1, 0, 3, v4, a1 + 88);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_10001C434@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(char *, uint64_t, uint64_t)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t, uint64_t);
  int v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t (*v26)();
  uint64_t *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t result;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;

  v35 = a3;
  v36 = a7;
  v34 = a1;
  v37 = a8;
  v12 = type metadata accessor for StatusType(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v34 - v17;
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v19((char *)&v34 - v17, a5, v12);
  v20 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v18, v12);
  if (v20 == enum case for StatusType.askToBuyRequest(_:))
  {
    v19(v16, a5, v12);
    v21 = (void *)objc_opt_self(BMStreams);
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a4);
    swift_unknownObjectRetain(a6, v22);
    v23 = objc_msgSend(v21, "askToBuyStream", v34, v35, v36);
    v24 = objc_msgSend(v23, "publisher");

    v25 = sub_100003CB4(&qword_100032040);
    swift_allocObject(v25, *(unsigned int *)(v25 + 48), *(unsigned __int16 *)(v25 + 52));
    v26 = sub_10001D958;
    v27 = (uint64_t *)&unk_100032048;
LABEL_5:
    result = sub_10001CF98(v34, a2, v35, a4, v16, a6, v36, v24, v27, (uint64_t)v26);
    v32 = v37;
    v37[3] = v25;
    v32[4] = (uint64_t)&off_10002D808;
    *v32 = result;
    return result;
  }
  if (v20 == enum case for StatusType.screenTimeRequest(_:))
  {
    v19(v16, a5, v12);
    v28 = (void *)objc_opt_self(BMStreams);
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a4);
    swift_unknownObjectRetain(a6, v29);
    v30 = objc_msgSend(v28, "screenTimeRequestStream", v34, v35, v36);
    v24 = objc_msgSend(v30, "publisher");

    v25 = sub_100003CB4(&qword_100032038);
    swift_allocObject(v25, *(unsigned int *)(v25 + 48), *(unsigned __int16 *)(v25 + 52));
    v26 = sub_10001DA34;
    v27 = (uint64_t *)&unk_100032088;
    goto LABEL_5;
  }
  v33 = static PeopleErrors.createError(_:code:)(0xD000000000000012, 0x8000000100024990, 500);
  swift_willThrow(v33);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
}

uint64_t sub_10001C704()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _UNKNOWN **v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.messages.getter(v4);
  v7 = swift_retain_n(v0, 2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.debug.getter();
  v10 = &off_100031000;
  if (os_log_type_enabled(v8, v9))
  {
    v11 = swift_slowAlloc(12, -1);
    v22 = v2;
    v12 = (uint8_t *)v11;
    v13 = swift_slowAlloc(32, -1);
    v24 = v13;
    *(_DWORD *)v12 = 136315138;
    v14 = StatusType.rawValue.getter();
    v16 = v15;
    v23 = sub_10000608C(v14, v15, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v12 + 4, v12 + 12);
    swift_release_n(v1, 2);
    v17 = v16;
    v10 = &off_100031000;
    swift_bridgeObjectRelease(v17);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "BubbleEventRegistration bye bye for %s", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v22);
  }
  else
  {

    swift_release_n(v1, 2);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  v18 = (char *)v10[488] + v1;
  v19 = type metadata accessor for StatusType(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v18, v19);
  swift_release(*(_QWORD *)(v1 + qword_100031F48));
  sub_10001D8E4(v1 + qword_100031F50);
  return v1;
}

uint64_t sub_10001C924()
{
  uint64_t v0;

  v0 = sub_10001C704();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t type metadata accessor for BubbleEventRegistration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001DAC8(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BubbleEventRegistration);
}

uint64_t sub_10001C950(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t Strong;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[3];
  uint64_t v37;
  void *v38;

  v2 = v1;
  v4 = sub_100003CB4(&qword_1000314A8);
  __chkstk_darwin(v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for StatusType(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_10000E258(0, &qword_100032090, BMScreenTimeRequestEvent_ptr);
  v38 = &protocol witness table for BMScreenTimeRequestEvent;
  v36[0] = a1;
  sub_10000E528(v36, v37);
  BMScreenTimeRequestEvent.statusType.getter(a1);
  v11 = sub_10001D95C(&qword_100032068, (uint64_t)&protocol conformance descriptor for StatusType);
  dispatch thunk of RawRepresentable.rawValue.getter(&v31, v7, v11);
  dispatch thunk of RawRepresentable.rawValue.getter(&v34, v7, v11);
  v12 = v32;
  v13 = v35;
  if (v31 == v34 && v32 == v35)
  {
    swift_bridgeObjectRelease_n(v32, 2);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v31, v32, v34, v35, 0);
    swift_bridgeObjectRelease(v12);
    swift_bridgeObjectRelease(v13);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    if ((v14 & 1) == 0)
      goto LABEL_11;
  }
  v15 = (_QWORD *)(v2 + qword_100031F50);
  v17 = v15[2];
  v16 = v15[3];
  v18 = swift_bridgeObjectRetain(v16);
  v20 = BMScreenTimeRequestEvent.requestId.getter(v18);
  v21 = v19;
  if (v17 == v20 && v16 == v19)
  {
    swift_bridgeObjectRelease_n(v16, 2);
  }
  else
  {
    v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v17, v16, v20, v19, 0);
    swift_bridgeObjectRelease(v16);
    swift_bridgeObjectRelease(v21);
    if ((v22 & 1) == 0)
      goto LABEL_11;
  }
  sub_10001D99C(v15, &v31);
  Strong = swift_unknownObjectWeakLoadStrong(v33);
  v24 = v33[1];
  sub_10001D8E4((uint64_t)&v31);
  if (Strong)
  {
    v25 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v6, 1, 1, v25);
    v26 = (_QWORD *)swift_allocObject(&unk_10002D850, 48, 7);
    v26[2] = 0;
    v26[3] = 0;
    v26[4] = Strong;
    v26[5] = v24;
    v27 = sub_100004258((uint64_t)v6, (uint64_t)&unk_100032098, (uint64_t)v26);
    swift_release(v27);
  }
LABEL_11:
  sub_100006EA0(v36);
  v28 = sub_100003CB4(&qword_100032070);
  swift_allocObject(v28, *(unsigned int *)(v28 + 48), *(unsigned __int16 *)(v28 + 52));
  return Promise.init(startBlock:)(sub_10001CF60, 0);
}

uint64_t sub_10001CC2C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t Strong;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[3];
  uint64_t v37;
  void *v38;

  v2 = v1;
  v4 = sub_100003CB4(&qword_1000314A8);
  __chkstk_darwin(v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for StatusType(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_10000E258(0, (unint64_t *)&qword_100032060, BMAskToBuyEvent_ptr);
  v38 = &protocol witness table for BMAskToBuyEvent;
  v36[0] = a1;
  sub_10000E528(v36, v37);
  BMAskToBuyEvent.statusType.getter(a1);
  v11 = sub_10001D95C(&qword_100032068, (uint64_t)&protocol conformance descriptor for StatusType);
  dispatch thunk of RawRepresentable.rawValue.getter(&v31, v7, v11);
  dispatch thunk of RawRepresentable.rawValue.getter(&v34, v7, v11);
  v12 = v32;
  v13 = v35;
  if (v31 == v34 && v32 == v35)
  {
    swift_bridgeObjectRelease_n(v32, 2);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v31, v32, v34, v35, 0);
    swift_bridgeObjectRelease(v12);
    swift_bridgeObjectRelease(v13);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    if ((v14 & 1) == 0)
      goto LABEL_11;
  }
  v15 = (_QWORD *)(v2 + qword_100031F50);
  v17 = v15[2];
  v16 = v15[3];
  v18 = swift_bridgeObjectRetain(v16);
  v20 = BMAskToBuyEvent.requestId.getter(v18);
  v21 = v19;
  if (v17 == v20 && v16 == v19)
  {
    swift_bridgeObjectRelease_n(v16, 2);
  }
  else
  {
    v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v17, v16, v20, v19, 0);
    swift_bridgeObjectRelease(v16);
    swift_bridgeObjectRelease(v21);
    if ((v22 & 1) == 0)
      goto LABEL_11;
  }
  sub_10001D99C(v15, &v31);
  Strong = swift_unknownObjectWeakLoadStrong(v33);
  v24 = v33[1];
  sub_10001D8E4((uint64_t)&v31);
  if (Strong)
  {
    v25 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v6, 1, 1, v25);
    v26 = (_QWORD *)swift_allocObject(&unk_10002D828, 48, 7);
    v26[2] = 0;
    v26[3] = 0;
    v26[4] = Strong;
    v26[5] = v24;
    v27 = sub_100004258((uint64_t)v6, (uint64_t)&unk_100032080, (uint64_t)v26);
    swift_release(v27);
  }
LABEL_11:
  sub_100006EA0(v36);
  v28 = sub_100003CB4(&qword_100032070);
  swift_allocObject(v28, *(unsigned int *)(v28 + 48), *(unsigned __int16 *)(v28 + 52));
  return Promise.init(startBlock:)(sub_10001CF60, 0);
}

uint64_t sub_10001CF08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  return swift_task_switch(sub_10001CF20, 0, 0);
}

uint64_t sub_10001CF20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;

  v1 = *(_QWORD *)(v0 + 24);
  ObjectType = swift_getObjectType(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(ObjectType, v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001CF60(uint64_t (*a1)(uint64_t *))
{
  uint64_t v2;
  char v3;

  v2 = 0;
  v3 = 0;
  return a1(&v2);
}

uint64_t sub_10001CF98(uint64_t a1, unint64_t a2, uint64_t a3, void (*a4)(char *, uint64_t, uint64_t), char *a5, uint64_t a6, uint64_t a7, void *a8, uint64_t *a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  void (*v38)(char *, uint64_t);
  os_log_type_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(char *, uint64_t, uint64_t);
  uint64_t *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67[4];
  _QWORD v68[3];

  v11 = v10;
  v64 = a7;
  v65 = a8;
  v63 = a10;
  v60 = a4;
  v61 = a9;
  v17 = type metadata accessor for StatusType(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = __chkstk_darwin(v17);
  v62 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v22 = (char *)&v52 - v21;
  v23 = type metadata accessor for Logger(0);
  v57 = *(_QWORD *)(v23 - 8);
  v58 = v23;
  __chkstk_darwin(v23);
  v25 = (char *)&v52 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v11 + qword_100031F48) = 0;
  v56 = v18;
  v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16);
  v26(v11 + qword_100031F40, (uint64_t)a5, v17);
  v55 = a1;
  v67[0] = a1;
  v67[1] = a2;
  v67[2] = a3;
  v67[3] = (uint64_t)v60;
  v68[1] = v64;
  v64 = a6;
  swift_unknownObjectWeakInit(v68, a6);
  sub_10001D910((uint64_t)v67, v11 + qword_100031F50);
  v27 = swift_bridgeObjectRetain(a2);
  static PeopleLogger.messages.getter(v27);
  v59 = v17;
  v60 = (void (*)(char *, uint64_t, uint64_t))v26;
  v26((uint64_t)v22, (uint64_t)a5, v17);
  v28 = swift_bridgeObjectRetain(a2);
  v29 = Logger.logObject.getter(v28);
  v30 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = swift_slowAlloc(22, -1);
    v54 = a5;
    v32 = v31;
    v53 = swift_slowAlloc(64, -1);
    v67[0] = v53;
    *(_DWORD *)v32 = 136315394;
    swift_bridgeObjectRetain(a2);
    v66 = sub_10000608C(v55, a2, v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v66, v67, v32 + 4, v32 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    *(_WORD *)(v32 + 12) = 2080;
    v33 = sub_10001D95C((unint64_t *)&unk_100032050, (uint64_t)&protocol conformance descriptor for StatusType);
    v34 = v59;
    v35 = dispatch thunk of CustomStringConvertible.description.getter(v59, v33);
    v37 = v36;
    v66 = sub_10000608C(v35, v36, v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v66, v67, v32 + 14, v32 + 22);
    swift_bridgeObjectRelease(v37);
    v38 = *(void (**)(char *, uint64_t))(v56 + 8);
    v38(v22, v34);
    v39 = v30;
    v40 = v38;
    _os_log_impl((void *)&_mh_execute_header, v29, v39, "Created listener with %s for %s listener", (uint8_t *)v32, 0x16u);
    v41 = v53;
    swift_arrayDestroy(v53, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v41, -1, -1);
    v42 = v32;
    a5 = v54;
    swift_slowDealloc(v42, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(a2, 2);
    v40 = *(void (**)(char *, uint64_t))(v56 + 8);
    v34 = v59;
    v40(v22, v59);
  }

  (*(void (**)(char *, uint64_t))(v57 + 8))(v25, v58);
  type metadata accessor for BiomeUtilities(0);
  v43 = static BiomeUtilities.shared.getter();
  v44 = (void *)dispatch thunk of BiomeUtilities.scheduler(for:isDaemon:)(a5, 0);
  swift_release(v43);
  v45 = v65;
  v46 = objc_msgSend(v65, "subscribeOn:", v44);
  v47 = v62;
  v60(v62, (uint64_t)a5, v34);
  v48 = sub_100003CB4(v61);
  swift_allocObject(v48, *(unsigned int *)(v48 + 48), *(unsigned __int16 *)(v48 + 52));
  swift_retain(v11);
  v49 = BiomeStreamListener.init(statusType:biomePublisher:eventHandler:)(v47, v46, v63, v11);

  swift_unknownObjectRelease(v64);
  v40(a5, v34);
  v50 = *(_QWORD *)(v11 + qword_100031F48);
  *(_QWORD *)(v11 + qword_100031F48) = v49;
  swift_release(v50);
  return v11;
}

uint64_t sub_10001D3BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _UNKNOWN **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.messages.getter(v4);
  v7 = swift_retain_n(v0, 4);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.debug.getter();
  v10 = &off_100031000;
  if (os_log_type_enabled(v8, v9))
  {
    v11 = swift_slowAlloc(22, -1);
    v26 = v3;
    v12 = v11;
    v13 = swift_slowAlloc(64, -1);
    v28 = v13;
    *(_DWORD *)v12 = 136315394;
    v14 = StatusType.rawValue.getter();
    v16 = v15;
    v27 = sub_10000608C(v14, v15, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v12 + 4, v12 + 12);
    swift_release_n(v1, 2);
    swift_bridgeObjectRelease(v16);
    *(_WORD *)(v12 + 12) = 2080;
    v25 = v2;
    v18 = *(_QWORD *)(v1 + qword_100031F50);
    v17 = *(_QWORD *)(v1 + qword_100031F50 + 8);
    swift_bridgeObjectRetain(v17);
    v27 = sub_10000608C(v18, v17, &v28);
    v10 = &off_100031000;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v12 + 14, v12 + 22);
    swift_release_n(v1, 2);
    swift_bridgeObjectRelease(v17);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Shutdown %s for %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy(v13, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v25);
  }
  else
  {

    swift_release_n(v1, 4);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  v19 = (char *)v10[490] + v1;
  *((_QWORD *)v19 + 5) = 0;
  swift_unknownObjectWeakAssign(v19 + 32, 0);
  v20 = qword_100031F48;
  v21 = *(_QWORD *)(v1 + qword_100031F48);
  if (v21)
  {
    v22 = swift_retain(*(_QWORD *)(v1 + qword_100031F48));
    dispatch thunk of BiomeStreamListener.cancel()(v22);
    swift_release(v21);
    v23 = *(_QWORD *)(v1 + v20);
  }
  else
  {
    v23 = 0;
  }
  *(_QWORD *)(v1 + v20) = 0;
  return swift_release(v23);
}

uint64_t initializeBufferWithCopyOfBuffer for InterestedParty(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for InterestedParty(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
  return swift_unknownObjectWeakDestroy(a1 + 32);
}

_QWORD *initializeWithCopy for InterestedParty(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2 + 4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_unknownObjectWeakCopyInit(a1 + 4, v6);
  a1[5] = a2[5];
  return a1;
}

_QWORD *assignWithCopy for InterestedParty(_QWORD *a1, _QWORD *a2)
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
  swift_unknownObjectWeakCopyAssign(a1 + 4, a2 + 4);
  a1[5] = a2[5];
  return a1;
}

uint64_t initializeWithTake for InterestedParty(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  swift_unknownObjectWeakTakeInit(a1 + 32, a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

_QWORD *assignWithTake for InterestedParty(_QWORD *a1, _QWORD *a2)
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
  swift_unknownObjectWeakTakeAssign(a1 + 4, a2 + 4);
  a1[5] = a2[5];
  return a1;
}

uint64_t getEnumTagSinglePayload for InterestedParty(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for InterestedParty(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for InterestedParty()
{
  return &type metadata for InterestedParty;
}

uint64_t sub_10001D8C4()
{
  return sub_10001D3BC();
}

uint64_t sub_10001D8E4(uint64_t a1)
{
  destroy for InterestedParty(a1);
  return a1;
}

uint64_t sub_10001D910(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  swift_unknownObjectWeakTakeInit(a2 + 32, a1 + 32);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 40);
  return a2;
}

uint64_t sub_10001D95C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for StatusType(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *sub_10001D99C(_QWORD *a1, _QWORD *a2)
{
  initializeWithCopy for InterestedParty(a2, a1);
  return a2;
}

uint64_t sub_10001D9D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc(dword_10003207C);
  v3 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_100006F00;
  *(_OWORD *)(v2 + 16) = v3;
  return swift_task_switch(sub_10001CF20, 0, 0);
}

uint64_t sub_10001DA3C()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001DA68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc(dword_10003207C);
  v3 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_100006270;
  *(_OWORD *)(v2 + 16) = v3;
  return swift_task_switch(sub_10001CF20, 0, 0);
}

uint64_t sub_10001DAC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t sub_10001DAF4(uint64_t a1, uint64_t a2, _QWORD *a3)
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

uint64_t sub_10001DBB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __n128 v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __n128 v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t KeyPath;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  int v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _BYTE v85[640];
  char v86;
  char v87;
  char v88;
  char v89;
  _QWORD v90[101];
  uint64_t v91;
  char v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  uint64_t v96;
  _BYTE v97[632];

  v80 = a4;
  v83 = a9;
  v84 = type metadata accessor for Image.Scale(0);
  v82 = *(_QWORD *)(v84 - 8);
  __chkstk_darwin(v84);
  v81 = (char *)&v72 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = sub_100003CB4(&qword_100031EF8);
  __chkstk_darwin(v77);
  v78 = (uint64_t)&v72 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v75);
  v20 = (_OWORD *)((char *)&v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v76 = sub_100003CB4(&qword_100031E88);
  v21 = __chkstk_darwin(v76);
  v79 = (char *)&v72 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = static VerticalAlignment.center.getter(v21);
  v23 = sub_10001E058(a1, a2, a3, a5, a6, a7, a8, a10, v97);
  v73 = static Edge.Set.top.getter(v23);
  if (qword_1000312D8 != -1)
    swift_once(&qword_1000312D8, sub_10000E644);
  v24.n128_u64[0] = 4.5;
  if (byte_100031798)
  {
    v25 = 2.5;
  }
  else
  {
    v24.n128_f64[0] = 6.5;
    v25 = 6.5;
  }
  v26 = EdgeInsets.init(_all:)(v24);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v72 = static Edge.Set.bottom.getter();
  v85[632] = 0;
  memcpy(&v85[7], v97, 0x270uLL);
  v86 = 0;
  v33.n128_f64[0] = v25;
  v34 = EdgeInsets.init(_all:)(v33);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v41 = v86;
  v87 = 0;
  v43 = static Alignment.center.getter(v42);
  v45 = _FrameLayout.init(width:height:alignment:)(&v91, 0, 1, 0, 1, v43, v44);
  v46 = v91;
  v47 = v93;
  v48 = v95;
  v49 = v96;
  v50 = v87;
  v89 = v92;
  v88 = v94;
  v51 = static Edge.Set.all.getter(v45);
  v90[0] = v74;
  v90[1] = 0;
  LOBYTE(v90[2]) = 0;
  memcpy((char *)&v90[2] + 1, v85, 0x277uLL);
  LOBYTE(v90[81]) = v73;
  *(double *)&v90[82] = v26;
  v90[83] = v28;
  v90[84] = v30;
  v90[85] = v32;
  LOBYTE(v90[86]) = v41;
  LOBYTE(v90[87]) = v72;
  *(double *)&v90[88] = v34;
  v90[89] = v36;
  v90[90] = v38;
  v90[91] = v40;
  LOBYTE(v90[92]) = v50;
  v90[93] = v46;
  LOBYTE(v90[94]) = v89;
  v90[95] = v47;
  LOBYTE(v90[96]) = v88;
  v90[97] = v48;
  v90[98] = v49;
  v52 = v80;
  v90[99] = v80;
  LOBYTE(v90[100]) = v51;
  v53 = (char *)v20 + *(int *)(v75 + 20);
  v54 = enum case for RoundedCornerStyle.continuous(_:);
  v55 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 104))(v53, v54, v55);
  __asm { FMOV            V0.2D, #10.0 }
  *v20 = _Q0;
  v61 = v78;
  sub_100021434((uint64_t)v20, v78);
  *(_WORD *)(v61 + *(int *)(v77 + 36)) = 256;
  v62 = v79;
  sub_10000E458(v61, (uint64_t)&v79[*(int *)(v76 + 36)], &qword_100031EF8);
  memcpy(v62, v90, 0x321uLL);
  swift_retain(v52);
  sub_100021478((uint64_t)v90);
  sub_100006C90(v61, &qword_100031EF8);
  sub_100021638((uint64_t)v20);
  sub_100021674((uint64_t)v90);
  v64 = v81;
  v63 = v82;
  v65 = v84;
  (*(void (**)(char *, _QWORD, uint64_t))(v82 + 104))(v81, enum case for Image.Scale.small(_:), v84);
  KeyPath = swift_getKeyPath(&unk_100025910);
  v67 = sub_100003CB4(&qword_100031E78);
  v68 = v83;
  v69 = (uint64_t *)(v83 + *(int *)(v67 + 36));
  v70 = sub_100003CB4(&qword_100031F08);
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))((char *)v69 + *(int *)(v70 + 28), v64, v65);
  *v69 = KeyPath;
  sub_10000E458((uint64_t)v62, v68, &qword_100031E88);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v64, v65);
  return sub_100006C90((uint64_t)v62, &qword_100031E88);
}

uint64_t sub_10001E058@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t KeyPath;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v64;
  uint64_t v66;
  _BYTE v69[152];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  _QWORD v84[19];
  _OWORD v85[8];
  _OWORD __src[39];
  _QWORD v87[19];
  _OWORD v88[13];
  uint64_t v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char v108;
  _BYTE v109[152];
  _OWORD v110[8];
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;

  v12 = a1;
  if (qword_100031308 != -1)
    a1 = swift_once(&qword_100031308, sub_10000E700);
  v54 = a6;
  v13 = *(double *)&qword_100032AC0;
  v14 = static Alignment.center.getter(a1);
  sub_10001826C(0.0, 1, 0.0, 1, v13, 0, 0.0, 1, (uint64_t)v110, 0.0, 1, 0.0, 1, v14, v15, 0, 1);
  *(_QWORD *)&__src[0] = v12;
  *((_QWORD *)&__src[0] + 1) = a2;
  v16 = sub_100021868();
  swift_bridgeObjectRetain(a2);
  v17 = Text.init<A>(_:)(__src, &type metadata for String, v16);
  v19 = v18;
  v21 = v20;
  v59 = v22;
  KeyPath = swift_getKeyPath(&unk_100025940);
  if (qword_100031300 != -1)
    swift_once(&qword_100031300, sub_10000E6E4);
  v24 = qword_100032AB8;
  v57 = swift_getKeyPath(&unk_100025970);
  v25 = swift_getKeyPath(&unk_1000259A0);
  swift_retain(a3);
  v26 = swift_retain(v24);
  v27 = static Color.clear.getter(v26);
  v28 = static Edge.Set.all.getter();
  v96 = v17;
  v97 = v19;
  v29 = v21 & 1;
  v98 = v29;
  v99 = v59;
  v100 = KeyPath;
  v101 = 1;
  v102 = 0;
  v103 = v57;
  v104 = v24;
  v105 = v25;
  v106 = a3;
  v107 = v27;
  v108 = v28;
  sub_100018414(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1, a4, a5);
  sub_1000217AC(v17, v19, v29);
  swift_release(v27);
  swift_release(a3);
  swift_release(v25);
  swift_release(v24);
  swift_release(v57);
  swift_release(KeyPath);
  swift_bridgeObjectRelease(v59);
  v121 = __src[10];
  v122 = __src[11];
  v123 = __src[12];
  v117 = __src[6];
  v118 = __src[7];
  v119 = __src[8];
  v120 = __src[9];
  v113 = __src[2];
  v114 = __src[3];
  v115 = __src[4];
  v116 = __src[5];
  v111 = __src[0];
  v124 = *(_QWORD *)&__src[13];
  v112 = __src[1];
  if (a7 && a8)
  {
    v30 = qword_1000313B0;
    swift_retain(a8);
    if (v30 != -1)
      swift_once(&qword_1000313B0, sub_10000EA90);
    v31 = sub_10001DAF4(v54, a7, (_QWORD *)qword_100032BB0);
    swift_bridgeObjectRetain(a7);
    if ((v31 & 1) != 0)
      v32 = Image.init(_internalSystemName:)(v54, a7);
    else
      v32 = Image.init(systemName:)(v54, a7);
    v33 = Text.init(_:)(v32);
    v64 = v34;
    v66 = v33;
    v58 = v35;
    v62 = v36;
    v60 = swift_getKeyPath(&unk_100025940);
    v37 = qword_100032AB8;
    v56 = swift_getKeyPath(&unk_100025970);
    v55 = swift_getKeyPath(&unk_1000259A0);
    swift_retain(a8);
    v38 = swift_retain(v37);
    v53 = static Color.clear.getter(v38);
    v39 = static Edge.Set.all.getter();
    v40 = static Alignment.trailing.getter();
    _FrameLayout.init(width:height:alignment:)(&v90, 0, 1, 0, 1, v40, v41);
    v42 = v90;
    v43 = v91;
    v44 = v92;
    v45 = v93;
    v46 = v94;
    v47 = v95;
    swift_release(a8);
    LOBYTE(v88[0]) = v58 & 1;
    LOBYTE(v70) = 0;
    LOBYTE(v87[0]) = v43;
    LOBYTE(v84[0]) = v45;
    *(_QWORD *)&__src[0] = v66;
    *((_QWORD *)&__src[0] + 1) = v64;
    LOBYTE(__src[1]) = v58 & 1;
    *((_QWORD *)&__src[1] + 1) = v62;
    *(_QWORD *)&__src[2] = v60;
    *((_QWORD *)&__src[2] + 1) = 1;
    LOBYTE(__src[3]) = 0;
    *((_QWORD *)&__src[3] + 1) = v56;
    *(_QWORD *)&__src[4] = v37;
    *((_QWORD *)&__src[4] + 1) = v55;
    *(_QWORD *)&__src[5] = a8;
    *((_QWORD *)&__src[5] + 1) = v53;
    LOBYTE(__src[6]) = v39;
    *((_QWORD *)&__src[6] + 1) = v42;
    LOBYTE(__src[7]) = v43;
    *((_QWORD *)&__src[7] + 1) = v44;
    LOBYTE(__src[8]) = v45;
    *((_QWORD *)&__src[8] + 1) = v46;
    *(_QWORD *)&__src[9] = v47;
    nullsub_1(__src);
  }
  else
  {
    sub_1000219A8((uint64_t)__src);
  }
  v48 = sub_100013A08((uint64_t)__src, (uint64_t)v109, &qword_100032108);
  v49 = *(double *)&qword_100032AC0;
  v50 = static Alignment.center.getter(v48);
  sub_10001826C(0.0, 1, 0.0, 1, v49, 0, 0.0, 1, (uint64_t)v85, 0.0, 1, 0.0, 1, v50, v51, 0, 1);
  sub_100013A08((uint64_t)v109, (uint64_t)v69, &qword_100032108);
  v80 = v121;
  v81 = v122;
  v82 = v123;
  v83 = v124;
  v76 = v117;
  v77 = v118;
  v78 = v119;
  v79 = v120;
  v72 = v113;
  v73 = v114;
  v74 = v115;
  v75 = v116;
  v70 = v111;
  v71 = v112;
  sub_100013A08((uint64_t)v69, (uint64_t)v84, &qword_100032108);
  __src[4] = v110[4];
  __src[5] = v110[5];
  __src[6] = v110[6];
  __src[7] = v110[7];
  __src[0] = v110[0];
  __src[1] = v110[1];
  __src[2] = v110[2];
  __src[3] = v110[3];
  __src[18] = v80;
  __src[19] = v81;
  __src[20] = v82;
  *(_QWORD *)&__src[21] = v83;
  __src[14] = v76;
  __src[15] = v77;
  __src[16] = v78;
  __src[17] = v79;
  __src[10] = v72;
  __src[11] = v73;
  __src[12] = v74;
  __src[13] = v75;
  __src[8] = v70;
  __src[9] = v71;
  sub_100013A08((uint64_t)v84, (uint64_t)&__src[21] + 8, &qword_100032108);
  __src[35] = v85[4];
  __src[36] = v85[5];
  __src[37] = v85[6];
  __src[38] = v85[7];
  __src[31] = v85[0];
  __src[32] = v85[1];
  __src[33] = v85[2];
  __src[34] = v85[3];
  memcpy(a9, __src, 0x270uLL);
  sub_100013A08((uint64_t)v69, (uint64_t)v87, &qword_100032108);
  sub_10001B474((uint64_t)&v70);
  sub_1000219C8(v84, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1000215B0);
  sub_1000219C8(v87, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1000217BC);
  v88[10] = v121;
  v88[11] = v122;
  v88[12] = v123;
  v89 = v124;
  v88[6] = v117;
  v88[7] = v118;
  v88[8] = v119;
  v88[9] = v120;
  v88[2] = v113;
  v88[3] = v114;
  v88[4] = v115;
  v88[5] = v116;
  v88[0] = v111;
  v88[1] = v112;
  return sub_100021A2C((uint64_t)v88);
}

void sub_10001E738(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

uint64_t sub_10001E76C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _QWORD *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v35[5];

  v2 = v1;
  v4 = type metadata accessor for Color.RGBColorSpace(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v35[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000312D8 != -1)
    swift_once(&qword_1000312D8, sub_10000E644);
  v8 = byte_100031798;
  v9 = byte_100031798;
  if (qword_1000312F0 != -1)
  {
    swift_once(&qword_1000312F0, sub_10000E6C4);
    v9 = byte_100031798;
  }
  v10 = *(double *)&qword_100032AA8;
  if ((*(_BYTE *)(v2 + 64) & 1) != 0)
  {
    if (v9)
      v12 = 8.0;
    else
      v12 = 15.0;
    if (v9)
      v11 = 24.0;
    else
      v11 = 30.0;
  }
  else
  {
    if (v9)
      v11 = 36.0;
    else
      v11 = 45.0;
    if (qword_1000312E0 != -1)
      swift_once(&qword_1000312E0, sub_10000E6A4);
    v12 = *(double *)&qword_100032A98;
  }
  v13 = v11 - v10;
  v14 = 30.0;
  if (v8)
    v14 = 24.0;
  v15 = v14 - v10;
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for Color.RGBColorSpace.sRGBLinear(_:), v4);
  v16 = Color.init(_:white:opacity:)(v7, 0.0, 0.2);
  v17 = sub_100003CB4(&qword_1000321F8);
  v18 = swift_allocObject(v17, 48, 7);
  *(_OWORD *)(v18 + 16) = xmmword_100025750;
  v19 = *(_QWORD *)(v2 + 32);
  v20 = *(_QWORD *)(v2 + 40);
  *(_QWORD *)(v18 + 32) = v19;
  *(_QWORD *)(v18 + 40) = v20;
  v35[0] = v18;
  specialized Array._endMutation()(v18);
  v21 = v35[0];
  swift_retain(v19);
  swift_retain(v20);
  v22 = Gradient.init(colors:)(v21);
  v23 = static UnitPoint.bottom.getter();
  v25 = v24;
  v26 = static UnitPoint.top.getter();
  v28 = LinearGradient.init(gradient:startPoint:endPoint:)(v35, v22, v23, v25, v26, v27);
  *(_QWORD *)a1 = static VerticalAlignment.center.getter(v28);
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v29 = sub_100003CB4(&qword_100032200);
  v30 = (char *)(a1 + *(int *)(v29 + 44));
  *(_QWORD *)v30 = static Alignment.center.getter(v29);
  *((_QWORD *)v30 + 1) = v31;
  v32 = sub_100003CB4(&qword_100032208);
  sub_10001EA14(v2, v35, v16, &v30[*(int *)(v32 + 44)], v12, v15, v13);
  sub_100022728(v35);
  return swift_release(v16);
}

uint64_t sub_10001EA14@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>)
{
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
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double *v49;
  char *v50;
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
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  unint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  Swift::String_optional v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  double *v76;
  uint64_t v77;
  uint64_t v78;
  void (*v79)(char *, char *, uint64_t);
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  void (*v84)(char *, uint64_t);
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  double *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  uint64_t v114;

  v88 = a3;
  v87 = a2;
  v108 = a4;
  v11 = sub_100003CB4(&qword_100032210);
  __chkstk_darwin(v11);
  v89 = (uint64_t *)((char *)&v86 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = sub_100003CB4(&qword_100032218);
  v104 = *(_QWORD *)(v13 - 8);
  v105 = v13;
  __chkstk_darwin(v13);
  v86 = (uint64_t)&v86 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100003CB4(&qword_100032220);
  v16 = __chkstk_darwin(v15);
  v107 = (uint64_t)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v106 = (uint64_t)&v86 - v18;
  v94 = sub_100003CB4(&qword_100031EF8);
  __chkstk_darwin(v94);
  v98 = (uint64_t)&v86 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v20);
  v93 = (double *)((char *)&v86 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22 = type metadata accessor for Image.ResizingMode(0);
  v23 = *(_QWORD *)(v22 - 8);
  __chkstk_darwin(v22);
  v25 = (char *)&v86 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = sub_100003CB4(&qword_100032228);
  __chkstk_darwin(v92);
  v27 = (char *)&v86 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = sub_100003CB4(&qword_100032230);
  __chkstk_darwin(v99);
  v100 = (uint64_t)&v86 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_100003CB4(&qword_100032238);
  v101 = *(_QWORD *)(v29 - 8);
  v102 = v29;
  v30 = __chkstk_darwin(v29);
  v103 = (char *)&v86 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __chkstk_darwin(v30);
  v96 = (char *)&v86 - v33;
  __chkstk_darwin(v32);
  v97 = (char *)&v86 - v34;
  v35 = Image.init(uiImage:)(*(id *)a1);
  (*(void (**)(char *, _QWORD, uint64_t))(v23 + 104))(v25, enum case for Image.ResizingMode.stretch(_:), v22);
  v91 = Image.resizable(capInsets:resizingMode:)(v25, v35, 0.0, 0.0, 0.0, 0.0);
  swift_release(v35);
  v36 = (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v25, v22);
  if (qword_1000312D8 != -1)
    v36 = swift_once(&qword_1000312D8, sub_10000E644);
  v37 = 60.0;
  if (byte_100031798)
    v37 = 48.0;
  v38 = 90.0;
  if (byte_100031798)
    v38 = 72.0;
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
    v38 = v37;
  v39 = v37;
  v40 = v38;
  v41 = static Alignment.center.getter(v36);
  _FrameLayout.init(width:height:alignment:)(&v109, *(_QWORD *)&v39, 0, *(_QWORD *)&v40, 0, v41, v42);
  v43 = v109;
  v44 = v110;
  v90 = v111;
  v45 = v112;
  v95 = a1;
  v46 = v113;
  v47 = v114;
  v48 = *(int *)(v20 + 20);
  v49 = v93;
  v50 = (char *)v93 + v48;
  v51 = enum case for RoundedCornerStyle.continuous(_:);
  v52 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 104))(v50, v51, v52);
  *v49 = a5;
  v49[1] = a5;
  v53 = v98;
  sub_100021434((uint64_t)v49, v98);
  *(_WORD *)(v53 + *(int *)(v94 + 36)) = 256;
  sub_10000E458(v53, (uint64_t)&v27[*(int *)(v92 + 36)], &qword_100031EF8);
  v54 = v91;
  *(_QWORD *)v27 = v91;
  *((_QWORD *)v27 + 1) = 0;
  *((_WORD *)v27 + 8) = 1;
  *((_QWORD *)v27 + 3) = v43;
  v27[32] = v44;
  *((_QWORD *)v27 + 5) = v90;
  v27[48] = v45;
  *((_QWORD *)v27 + 7) = v46;
  *((_QWORD *)v27 + 8) = v47;
  v55 = v95;
  swift_retain(v54);
  sub_100006C90(v53, &qword_100031EF8);
  sub_100021638((uint64_t)v49);
  v56 = swift_release(v54);
  v57 = static Color.clear.getter(v56);
  LOBYTE(v43) = static Edge.Set.all.getter(v57);
  v58 = v100;
  sub_10000E458((uint64_t)v27, v100, &qword_100032228);
  v59 = v99;
  v60 = v58 + *(int *)(v99 + 36);
  *(_QWORD *)v60 = v57;
  *(_BYTE *)(v60 + 8) = v43;
  sub_100006C90((uint64_t)v27, &qword_100032228);
  v61 = swift_allocObject(&unk_10002DB08, 81, 7);
  v62 = *(_OWORD *)(v55 + 48);
  *(_OWORD *)(v61 + 48) = *(_OWORD *)(v55 + 32);
  *(_OWORD *)(v61 + 64) = v62;
  *(_BYTE *)(v61 + 80) = *(_BYTE *)(v55 + 64);
  v63 = *(_OWORD *)(v55 + 16);
  *(_OWORD *)(v61 + 16) = *(_OWORD *)v55;
  *(_OWORD *)(v61 + 32) = v63;
  sub_1000227CC(v55);
  v64 = sub_100022844();
  v65 = v96;
  View.onTapGesture(count:perform:)(1, sub_1000227A4, v61, v59, v64);
  swift_release(v61);
  sub_100006C90(v58, &qword_100032230);
  v67 = v101;
  v66 = v102;
  v68 = v97;
  (*(void (**)(char *, char *, uint64_t))(v101 + 32))(v97, v65, v102);
  v69 = String.trimToNil()();
  if (v69.value._object)
  {
    v70 = static Alignment.center.getter(v69.value._countAndFlagsBits);
    v71 = (uint64_t)v89;
    *v89 = v70;
    *(_QWORD *)(v71 + 8) = v72;
    v73 = sub_100003CB4(&qword_100032278);
    sub_10001F194(v87, v88, v69.value._countAndFlagsBits, (uint64_t)v69.value._object, v55, v71 + *(int *)(v73 + 44));
    swift_bridgeObjectRelease(v69.value._object);
    v74 = v86;
    sub_10000E458(v71, v86, &qword_100032210);
    v75 = v105;
    v76 = (double *)(v74 + *(int *)(v105 + 36));
    *v76 = a6;
    v76[1] = a7;
    sub_100006C90(v71, &qword_100032210);
    v77 = v106;
    sub_100013A08(v74, v106, &qword_100032218);
    v78 = 0;
  }
  else
  {
    v75 = v105;
    v77 = v106;
    v78 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v104 + 56))(v77, v78, 1, v75);
  v79 = *(void (**)(char *, char *, uint64_t))(v67 + 16);
  v80 = v103;
  v79(v103, v68, v66);
  v81 = v107;
  sub_10000E458(v77, v107, &qword_100032220);
  v82 = v108;
  v79(v108, v80, v66);
  v83 = sub_100003CB4(&qword_100032270);
  sub_10000E458(v81, (uint64_t)&v82[*(int *)(v83 + 48)], &qword_100032220);
  sub_100006C90(v77, &qword_100032220);
  v84 = *(void (**)(char *, uint64_t))(v67 + 8);
  v84(v68, v66);
  sub_100006C90(v81, &qword_100032220);
  return ((uint64_t (*)(char *, uint64_t))v84)(v80, v66);
}

uint64_t sub_10001F194@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
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
  _OWORD *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t KeyPath;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  unsigned __int8 v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unsigned __int8 v96;
  uint64_t v97;
  char v98;
  uint64_t v99;
  uint64_t v100;

  v87 = a5;
  v82 = a4;
  v81 = a3;
  v86 = (char *)a2;
  v88 = a6;
  v7 = *a1;
  v8 = a1[1];
  v9 = a1[2];
  v10 = a1[3];
  v11 = a1[4];
  v12 = type metadata accessor for Image.ResizingMode(0);
  v84 = *(_QWORD *)(v12 - 8);
  v85 = v12;
  __chkstk_darwin(v12);
  v83 = (char *)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = sub_100003CB4(&qword_100031EF8);
  __chkstk_darwin(v78);
  v15 = (char *)&v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v16);
  v18 = (_OWORD *)((char *)&v72 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19 = sub_100003CB4(&qword_100032280);
  __chkstk_darwin(v19);
  v21 = (char *)&v72 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = sub_100003CB4(&qword_100032288);
  v22 = __chkstk_darwin(v77);
  v24 = (char *)&v72 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v79 = (uint64_t)&v72 - v25;
  v26 = qword_1000312E8;
  v80 = v7;
  v27 = swift_bridgeObjectRetain(v7);
  if (v26 != -1)
    v27 = swift_once(&qword_1000312E8, sub_10000E6B4);
  v28 = qword_100032AA0;
  v29 = static Alignment.center.getter(v27);
  _FrameLayout.init(width:height:alignment:)(&v89, v28, 0, v28, 0, v29, v30);
  v76 = v89;
  v31 = v90;
  v32 = v91;
  v75 = v92;
  v74 = v93;
  v73 = v94;
  v33 = (char *)v18 + *(int *)(v16 + 20);
  v34 = enum case for RoundedCornerStyle.continuous(_:);
  v35 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 104))(v33, v34, v35);
  __asm { FMOV            V0.2D, #4.5 }
  *v18 = _Q0;
  sub_100021434((uint64_t)v18, (uint64_t)v15);
  *(_WORD *)&v15[*(int *)(v78 + 36)] = 256;
  sub_10000E458((uint64_t)v15, (uint64_t)&v21[*(int *)(v19 + 36)], &qword_100031EF8);
  v41 = v80;
  *(_QWORD *)v21 = v80;
  *((_QWORD *)v21 + 1) = v8;
  *((_QWORD *)v21 + 2) = v9;
  *((_QWORD *)v21 + 3) = v10;
  *((_QWORD *)v21 + 4) = v11;
  *((_WORD *)v21 + 20) = 256;
  *((_QWORD *)v21 + 6) = v76;
  v21[56] = v31;
  *((_QWORD *)v21 + 8) = v32;
  v21[72] = v75;
  v42 = v73;
  *((_QWORD *)v21 + 10) = v74;
  *((_QWORD *)v21 + 11) = v42;
  swift_bridgeObjectRetain(v41);
  sub_100006C90((uint64_t)v15, &qword_100031EF8);
  sub_100021638((uint64_t)v18);
  sub_100022728(a1);
  sub_10000E458((uint64_t)v21, (uint64_t)v24, &qword_100032280);
  v43 = &v24[*(int *)(v77 + 36)];
  v44 = (uint64_t)v86;
  *(_QWORD *)v43 = v86;
  *(_OWORD *)(v43 + 8) = xmmword_100025900;
  *((_QWORD *)v43 + 3) = 0x4000000000000000;
  swift_retain(v44);
  sub_100006C90((uint64_t)v21, &qword_100032280);
  v45 = v79;
  sub_100013A08((uint64_t)v24, v79, &qword_100032288);
  if (qword_1000313B0 != -1)
    swift_once(&qword_1000313B0, sub_10000EA90);
  v86 = v24;
  v46 = v81;
  v47 = v82;
  v48 = sub_10001DAF4(v81, v82, (_QWORD *)qword_100032BB0);
  swift_bridgeObjectRetain(v47);
  if ((v48 & 1) != 0)
    v49 = Image.init(_internalSystemName:)(v46, v47);
  else
    v49 = Image.init(systemName:)(v46, v47);
  v50 = v49;
  v52 = v84;
  v51 = v85;
  v53 = v83;
  (*(void (**)(char *, _QWORD, uint64_t))(v84 + 104))(v83, enum case for Image.ResizingMode.stretch(_:), v85);
  v82 = Image.resizable(capInsets:resizingMode:)(v53, v50, 0.0, 0.0, 0.0, 0.0);
  swift_release(v50);
  v54 = (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v53, v51);
  v55 = *(double *)&qword_100032AA0;
  v56 = *(double *)&qword_100032AA0;
  if (qword_1000312F8 != -1)
  {
    v54 = swift_once(&qword_1000312F8, sub_10000E6D4);
    v56 = *(double *)&qword_100032AA0;
  }
  v57 = v55 - *(double *)&qword_100032AB0;
  v58 = v56 - *(double *)&qword_100032AB0;
  v59 = static Alignment.center.getter(v54);
  _FrameLayout.init(width:height:alignment:)(&v95, *(_QWORD *)&v57, 0, *(_QWORD *)&v58, 0, v59, v60);
  v85 = v95;
  LODWORD(v84) = v96;
  v61 = v97;
  v62 = v98;
  v63 = v99;
  v64 = v100;
  v65 = *(_QWORD *)(v87 + 24);
  KeyPath = swift_getKeyPath(&unk_1000259A0);
  v67 = (uint64_t)v86;
  sub_10000E458(v45, (uint64_t)v86, &qword_100032288);
  v68 = v88;
  sub_10000E458(v67, v88, &qword_100032288);
  v69 = v68 + *(int *)(sub_100003CB4(&qword_100032290) + 48);
  v70 = v82;
  *(_QWORD *)v69 = v82;
  *(_QWORD *)(v69 + 8) = 0;
  *(_WORD *)(v69 + 16) = 1;
  *(_QWORD *)(v69 + 24) = v85;
  *(_BYTE *)(v69 + 32) = v84;
  *(_QWORD *)(v69 + 40) = v61;
  *(_BYTE *)(v69 + 48) = v62;
  *(_QWORD *)(v69 + 56) = v63;
  *(_QWORD *)(v69 + 64) = v64;
  *(_QWORD *)(v69 + 72) = KeyPath;
  *(_QWORD *)(v69 + 80) = v65;
  swift_retain(v70);
  swift_retain(KeyPath);
  swift_retain_n(v65, 2);
  sub_100006C90(v45, &qword_100032288);
  swift_release(v65);
  swift_release(KeyPath);
  swift_release(v70);
  return sub_100006C90(v67, &qword_100032288);
}

uint64_t sub_10001F7A8@<X0>(uint64_t a1@<X8>)
{
  return sub_10001E76C(a1);
}

__n128 sub_10001F7E8@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
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
  int v28;
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
  uint64_t KeyPath;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __n128 result;
  uint64_t v51;
  int v52;
  uint64_t v53;
  _OWORD v54[12];
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  char v66;

  v6 = type metadata accessor for Font.Leading(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v54[0] = a1;
  *((_QWORD *)&v54[0] + 1) = a2;
  v10 = sub_100021868();
  swift_bridgeObjectRetain(a2);
  v11 = Text.init<A>(_:)(v54, &type metadata for String, v10);
  v13 = v12;
  v52 = v14;
  v53 = v15;
  if (qword_1000312D8 != -1)
    swift_once(&qword_1000312D8, sub_10000E644);
  if (byte_100031798 == 1)
    v16 = static Font.body.getter();
  else
    v16 = static Font.subheadline.getter();
  v17 = v16;
  v18 = Font.bold()();
  swift_release(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for Font.Leading.tight(_:), v6);
  v19 = Font.leading(_:)(v9, v18);
  swift_release(v18);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  LOBYTE(v18) = v52 & 1;
  v20 = v11;
  v21 = v13;
  v22 = v13;
  v23 = v11;
  v24 = v53;
  v25 = Text.font(_:)(v19, v20, v21, v52 & 1, v53);
  v27 = v26;
  v52 = v28;
  v30 = v29;
  swift_release(v19);
  sub_1000217AC(v23, v22, v18);
  swift_bridgeObjectRelease(v24);
  if (qword_100031328 != -1)
    swift_once(&qword_100031328, sub_10000E78C);
  v31 = v52 & 1;
  v32 = Text.foregroundColor(_:)(qword_100032AE0, v25, v27, v52 & 1, v30);
  v34 = v33;
  v36 = v35;
  v53 = v35;
  v38 = v37 & 1;
  sub_1000217AC(v25, v27, v31);
  swift_bridgeObjectRelease(v30);
  KeyPath = swift_getKeyPath(&unk_100025940);
  v40 = static Color.clear.getter(KeyPath);
  v41 = static Edge.Set.all.getter(v40);
  v42 = swift_getKeyPath(&unk_100025B68);
  v56 = v32;
  v57 = v34;
  v58 = v38;
  v59 = v36;
  v60 = KeyPath;
  v61 = 2;
  v62 = 0;
  v63 = v40;
  v64 = v41;
  v65 = v42;
  v66 = 1;
  v43 = static Alignment.topLeading.getter();
  sub_10001878C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v54, 0.0, 1, 0.0, 1, v43, v44);
  sub_1000217AC(v32, v34, v38);
  swift_release(v42);
  swift_release(v40);
  swift_release(KeyPath);
  swift_bridgeObjectRelease(v53);
  v45 = v54[11];
  *(_OWORD *)(a3 + 160) = v54[10];
  *(_OWORD *)(a3 + 176) = v45;
  *(_QWORD *)(a3 + 192) = v55;
  v46 = v54[7];
  *(_OWORD *)(a3 + 96) = v54[6];
  *(_OWORD *)(a3 + 112) = v46;
  v47 = v54[9];
  *(_OWORD *)(a3 + 128) = v54[8];
  *(_OWORD *)(a3 + 144) = v47;
  v48 = v54[3];
  *(_OWORD *)(a3 + 32) = v54[2];
  *(_OWORD *)(a3 + 48) = v48;
  v49 = v54[5];
  *(_OWORD *)(a3 + 64) = v54[4];
  *(_OWORD *)(a3 + 80) = v49;
  result = (__n128)v54[1];
  *(_OWORD *)a3 = v54[0];
  *(__n128 *)(a3 + 16) = result;
  return result;
}

uint64_t sub_10001FB40()
{
  return static View._viewListCount(inputs:)();
}

double sub_10001FB58@<D0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  double result;

  *(_QWORD *)&result = sub_10001F7E8(*v1, v1[1], a1).n128_u64[0];
  return result;
}

uint64_t sub_10001FB60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t result;
  _QWORD v42[2];

  v6 = type metadata accessor for Font.Leading(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42[0] = a1;
  v42[1] = a2;
  v10 = sub_100021868();
  swift_bridgeObjectRetain(a2);
  v11 = Text.init<A>(_:)(v42, &type metadata for String, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  if (qword_1000312D8 != -1)
    swift_once(&qword_1000312D8, sub_10000E644);
  if (byte_100031798 == 1)
    v18 = static Font.body.getter();
  else
    v18 = static Font.footnote.getter();
  v19 = v18;
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for Font.Leading.tight(_:), v6);
  v20 = Font.leading(_:)(v9, v19);
  swift_release(v19);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v21 = v15 & 1;
  v22 = Text.font(_:)(v20, v11, v13, v15 & 1, v17);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  swift_release(v20);
  sub_1000217AC(v11, v13, v21);
  swift_bridgeObjectRelease(v17);
  if (qword_100031328 != -1)
    swift_once(&qword_100031328, sub_10000E78C);
  v29 = v26 & 1;
  v30 = Text.foregroundColor(_:)(qword_100032AE0, v22, v24, v26 & 1, v28);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  sub_1000217AC(v22, v24, v29);
  v37 = swift_bridgeObjectRelease(v28);
  v38 = static Color.clear.getter(v37);
  v39 = static Edge.Set.all.getter(v38);
  result = swift_getKeyPath(&unk_100025940);
  *(_QWORD *)a3 = v30;
  *(_QWORD *)(a3 + 8) = v32;
  *(_BYTE *)(a3 + 16) = v34 & 1;
  *(_QWORD *)(a3 + 24) = v36;
  *(_QWORD *)(a3 + 32) = v38;
  *(_BYTE *)(a3 + 40) = v39;
  *(_QWORD *)(a3 + 48) = result;
  *(_QWORD *)(a3 + 56) = 0;
  *(_BYTE *)(a3 + 64) = 1;
  return result;
}

double sub_10001FDA0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, _OWORD *a4@<X8>)
{
  uint64_t v5;
  __int128 v6;
  char v7;
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
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  double result;
  __int128 v25;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  _OWORD v39[11];
  uint64_t v40;
  _BYTE v41[72];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _OWORD v52[3];

  if ((a3 & 1) != 0)
  {
    v5 = sub_10001FB60(a1, a2, (uint64_t)&v42);
    v6 = v42;
    v7 = v43;
    v8 = *((_QWORD *)&v43 + 1);
    v9 = v44;
    v10 = v45;
    v27 = v42;
    LOBYTE(v28) = v43;
    *((_QWORD *)&v28 + 1) = *((_QWORD *)&v43 + 1);
    *(_QWORD *)&v29 = v44;
    BYTE8(v29) = BYTE8(v44);
    v30 = v45;
    LOBYTE(v31) = v46;
    *(_WORD *)((char *)&v31 + 1) = 256;
    v11 = static Alignment.topLeading.getter(v5);
    sub_10001894C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v39, 0.0, 1, 0.0, 1, v11, v12);
    sub_1000217AC(v6, *((uint64_t *)&v6 + 1), v7);
    swift_release(v10);
    swift_release(v9);
    swift_bridgeObjectRelease(v8);
    sub_1000226D0((uint64_t)v39);
  }
  else
  {
    v13 = sub_10001FB60(a1, a2, (uint64_t)v41);
    v14 = static Alignment.topLeading.getter(v13);
    sub_100018B08(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v27, 0.0, 1, 0.0, 1, v14, v15);
    sub_100022540((uint64_t)v41);
    v39[8] = v35;
    v39[9] = v36;
    v39[10] = v37;
    v40 = v38;
    v39[4] = v31;
    v39[5] = v32;
    v39[6] = v33;
    v39[7] = v34;
    v39[0] = v27;
    v39[1] = v28;
    v39[2] = v29;
    v39[3] = v30;
    sub_100022598((uint64_t)v39);
  }
  sub_100013A08((uint64_t)v39, (uint64_t)&v26, &qword_100032190);
  v16 = sub_100003CB4(&qword_100032198);
  v17 = sub_100003CB4(&qword_1000321A0);
  v18 = sub_10001B2A4(&qword_1000321A8, &qword_100032198, (void (*)(void))sub_1000225A4);
  v19 = sub_10001B2A4(&qword_1000321F0, &qword_1000321A0, (void (*)(void))sub_1000225C8);
  _ConditionalContent<>.init(storage:)(&v26, v16, v17, v18, v19);
  v20 = v51;
  a4[8] = v50;
  a4[9] = v20;
  a4[10] = v52[0];
  *(_OWORD *)((char *)a4 + 169) = *(_OWORD *)((char *)v52 + 9);
  v21 = v47;
  a4[4] = v46;
  a4[5] = v21;
  v22 = v49;
  a4[6] = v48;
  a4[7] = v22;
  v23 = v43;
  *a4 = v42;
  a4[1] = v23;
  result = *(double *)&v44;
  v25 = v45;
  a4[2] = v44;
  a4[3] = v25;
  return result;
}

double sub_10002006C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  double result;
  __int128 v14;
  _OWORD v15[10];
  _OWORD v16[2];
  _BYTE v17[192];

  v4 = *(_QWORD *)v2;
  v5 = *(_QWORD *)(v2 + 8);
  v6 = *(_BYTE *)(v2 + 16);
  v7 = static VerticalAlignment.center.getter(a1);
  sub_10001FDA0(v4, v5, v6, v15);
  *(_OWORD *)&v17[135] = v15[8];
  *(_OWORD *)&v17[151] = v15[9];
  *(_OWORD *)&v17[167] = v16[0];
  *(_OWORD *)&v17[176] = *(_OWORD *)((char *)v16 + 9);
  *(_OWORD *)&v17[71] = v15[4];
  *(_OWORD *)&v17[87] = v15[5];
  *(_OWORD *)&v17[103] = v15[6];
  *(_OWORD *)&v17[119] = v15[7];
  *(_OWORD *)&v17[7] = v15[0];
  *(_OWORD *)&v17[23] = v15[1];
  *(_OWORD *)&v17[39] = v15[2];
  *(_OWORD *)&v17[55] = v15[3];
  v8 = *(_OWORD *)&v17[144];
  *(_OWORD *)(a2 + 145) = *(_OWORD *)&v17[128];
  *(_OWORD *)(a2 + 161) = v8;
  v9 = *(_OWORD *)&v17[176];
  *(_OWORD *)(a2 + 177) = *(_OWORD *)&v17[160];
  *(_OWORD *)(a2 + 193) = v9;
  v10 = *(_OWORD *)&v17[80];
  *(_OWORD *)(a2 + 81) = *(_OWORD *)&v17[64];
  *(_OWORD *)(a2 + 97) = v10;
  v11 = *(_OWORD *)&v17[112];
  *(_OWORD *)(a2 + 113) = *(_OWORD *)&v17[96];
  *(_OWORD *)(a2 + 129) = v11;
  v12 = *(_OWORD *)&v17[16];
  *(_OWORD *)(a2 + 17) = *(_OWORD *)v17;
  *(_OWORD *)(a2 + 33) = v12;
  result = *(double *)&v17[32];
  v14 = *(_OWORD *)&v17[48];
  *(_OWORD *)(a2 + 49) = *(_OWORD *)&v17[32];
  *(_QWORD *)a2 = v7;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  *(_OWORD *)(a2 + 65) = v14;
  return result;
}

uint64_t sub_1000201C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  Swift::String_optional v24;
  unint64_t v25;
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
  uint64_t KeyPath;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  Swift::String_optional v57;

  v14 = sub_100003CB4(&qword_100032150);
  v15 = __chkstk_darwin(v14);
  v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v15);
  v20 = (char *)&v50 - v19;
  *(_QWORD *)v20 = static VerticalAlignment.center.getter(v18);
  *((_QWORD *)v20 + 1) = 0x4000000000000000;
  v20[16] = 0;
  v21 = sub_100003CB4(&qword_100032158);
  sub_1000204B0(a1, a2, a3, a4, a5, (uint64_t *)&v20[*(int *)(v21 + 44)]);
  v56 = a7;
  v22 = (uint64_t)v20;
  v23 = (uint64_t)v17;
  if (a6 && (v24 = String.trimToNil()(), v24.value._object))
  {
    v57 = v24;
    v25 = sub_100021868();
    v26 = Text.init<A>(_:)(&v57, &type metadata for String, v25);
    v28 = v27;
    v30 = v29;
    v32 = v31 & 1;
    v33 = static Font.caption2.getter(v26);
    v34 = Text.font(_:)(v33, v26, v28, v32, v30);
    v52 = v36;
    v53 = v35;
    v38 = v37;
    swift_release(v33);
    v51 = v38 & 1;
    sub_1000217AC(v26, v28, v32);
    swift_bridgeObjectRelease(v30);
    KeyPath = swift_getKeyPath(&unk_100025940);
    if (qword_100031330 != -1)
      swift_once(&qword_100031330, sub_10000E7A0);
    v40 = qword_100032AE8;
    v55 = swift_getKeyPath(&unk_1000259A0);
    swift_retain(v40);
    v54 = 2;
    v42 = v52;
    v41 = v53;
    v43 = v51;
  }
  else
  {
    v34 = 0;
    v41 = 0;
    v43 = 0;
    v42 = 0;
    KeyPath = 0;
    v54 = 0;
    v55 = 0;
    v40 = 0;
  }
  v44 = v22;
  sub_10000E458(v22, v23, &qword_100032150);
  v45 = v56;
  sub_10000E458(v23, v56, &qword_100032150);
  v46 = (uint64_t *)(v45 + *(int *)(sub_100003CB4(&qword_100032160) + 48));
  *v46 = v34;
  v46[1] = v41;
  v46[2] = v43;
  v46[3] = v42;
  v47 = v54;
  v48 = v55;
  v46[4] = KeyPath;
  v46[5] = v47;
  v46[6] = 0;
  v46[7] = v48;
  v46[8] = v40;
  sub_100022428(v34, v41, v43, v42, KeyPath, v47, 0, v48, v40);
  sub_100006C90(v44, &qword_100032150);
  sub_100022484(v34, v41, v43, v42, KeyPath, v47, 0, v48, v40);
  return sub_100006C90(v23, &qword_100032150);
}

uint64_t sub_1000204B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int *v56;
  char *v57;
  uint64_t KeyPath;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[3];

  v78 = a3;
  v80 = sub_100003CB4(&qword_100031F08);
  __chkstk_darwin(v80);
  v12 = (uint64_t *)((char *)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = type metadata accessor for Image.Scale(0);
  v84 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v82 = (char *)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_100003CB4(&qword_100032168);
  __chkstk_darwin(v79);
  v86 = (char *)&v74 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = sub_100003CB4(&qword_100032170);
  __chkstk_darwin(v81);
  v87 = (uint64_t)&v74 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100003CB4(&qword_100032178);
  v89 = *(_QWORD *)(v17 - 8);
  v18 = __chkstk_darwin(v17);
  v85 = (uint64_t)&v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v83 = (uint64_t)&v74 - v20;
  v21 = sub_100003CB4(&qword_100032180);
  v22 = __chkstk_darwin(v21);
  v90 = (uint64_t)&v74 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v25 = (char *)&v74 - v24;
  v91 = v17;
  v92 = a5;
  if (a2)
  {
    v74 = a4;
    v75 = v13;
    v76 = v12;
    v77 = a6;
    v93[0] = a1;
    v93[1] = a2;
    v26 = sub_100021868();
    swift_bridgeObjectRetain(a2);
    v27 = Text.init<A>(_:)(v93, &type metadata for String, v26);
    v29 = v28;
    v31 = v30;
    v33 = v32 & 1;
    v34 = static Font.footnote.getter();
    v35 = Text.font(_:)(v34, v27, v29, v33, v31);
    v37 = v36;
    v39 = v38;
    v41 = v40;
    swift_release(v34);
    sub_1000217AC(v27, v29, v33);
    swift_bridgeObjectRelease(v31);
    if (qword_100031328 != -1)
      swift_once(&qword_100031328, sub_10000E78C);
    v42 = v39 & 1;
    v43 = Text.foregroundColor(_:)(qword_100032AE0, v35, v37, v39 & 1, v41);
    v45 = v44;
    v88 = v46;
    a2 = v47 & 1;
    sub_1000217AC(v35, v37, v42);
    swift_bridgeObjectRelease(v41);
    v12 = v76;
    a6 = v77;
    v17 = v91;
    a5 = v92;
    v13 = v75;
    a4 = v74;
    if (!v74)
      goto LABEL_12;
  }
  else
  {
    v43 = 0;
    v45 = 0;
    v88 = 0;
    if (!a4)
    {
LABEL_12:
      v53 = 1;
      goto LABEL_20;
    }
  }
  if (!a5)
    goto LABEL_12;
  v76 = (uint64_t *)v25;
  v77 = (uint64_t *)a2;
  v48 = a4;
  v49 = qword_1000313B0;
  swift_retain(a5);
  if (v49 != -1)
    swift_once(&qword_1000313B0, sub_10000EA90);
  v50 = v78;
  v51 = sub_10001DAF4(v78, v48, (_QWORD *)qword_100032BB0);
  swift_bridgeObjectRetain(v48);
  if ((v51 & 1) != 0)
    v52 = Image.init(_internalSystemName:)(v50, v48);
  else
    v52 = Image.init(systemName:)(v50, v48);
  v54 = v52;
  v25 = (char *)v76;
  a2 = (uint64_t)v77;
  v77 = (uint64_t *)v45;
  v78 = v43;
  if (qword_1000312D8 != -1)
    swift_once(&qword_1000312D8, sub_10000E644);
  v55 = v84;
  if (byte_100031798)
    v56 = (unsigned int *)&enum case for Image.Scale.medium(_:);
  else
    v56 = (unsigned int *)&enum case for Image.Scale.small(_:);
  v57 = v82;
  (*(void (**)(char *, _QWORD, uint64_t))(v84 + 104))(v82, *v56, v13);
  KeyPath = swift_getKeyPath(&unk_100025910);
  (*(void (**)(char *, char *, uint64_t))(v55 + 16))((char *)v12 + *(int *)(v80 + 28), v57, v13);
  *v12 = KeyPath;
  v59 = (uint64_t *)v86;
  sub_10000E458((uint64_t)v12, (uint64_t)&v86[*(int *)(v79 + 36)], &qword_100031F08);
  *v59 = v54;
  swift_retain(v54);
  sub_100006C90((uint64_t)v12, &qword_100031F08);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v57, v13);
  v60 = swift_release(v54);
  v61 = static Font.caption2.getter(v60);
  v62 = swift_getKeyPath(&unk_100025970);
  v63 = v87;
  sub_10000E458((uint64_t)v59, v87, &qword_100032168);
  v64 = (uint64_t *)(v63 + *(int *)(v81 + 36));
  *v64 = v62;
  v64[1] = v61;
  sub_100006C90((uint64_t)v59, &qword_100032168);
  v65 = swift_getKeyPath(&unk_1000259A0);
  v66 = v85;
  sub_10000E458(v63, v85, &qword_100032170);
  v17 = v91;
  v67 = v92;
  v68 = (uint64_t *)(v66 + *(int *)(v91 + 36));
  *v68 = v65;
  v68[1] = v67;
  sub_100006C90(v63, &qword_100032170);
  v69 = v83;
  sub_100013A08(v66, v83, &qword_100032178);
  sub_100013A08(v69, (uint64_t)v25, &qword_100032178);
  v53 = 0;
  v45 = (uint64_t)v77;
  v43 = v78;
LABEL_20:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v89 + 56))(v25, v53, 1, v17);
  v70 = v90;
  sub_10000E458((uint64_t)v25, v90, &qword_100032180);
  *a6 = v43;
  a6[1] = v45;
  v71 = v88;
  a6[2] = a2;
  a6[3] = v71;
  v72 = sub_100003CB4(&qword_100032188);
  sub_10000E458(v70, (uint64_t)a6 + *(int *)(v72 + 48), &qword_100032180);
  sub_1000224E0(v43, v45, a2, v71);
  sub_100006C90((uint64_t)v25, &qword_100032180);
  sub_100006C90(v70, &qword_100032180);
  return sub_100022510(v43, v45, a2, v71);
}

_QWORD *sub_100020AE0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _OWORD v66[8];
  _OWORD v67[8];
  uint64_t v68;
  unsigned __int8 v69;
  uint64_t v70;
  unsigned __int8 v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;

  v4 = sub_100003CB4(&qword_100032118);
  v5 = __chkstk_darwin(v4);
  v63 = (uint64_t)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v62 = (uint64_t *)((char *)&v52 - v7);
  v8 = sub_100003CB4(&qword_100032120);
  __chkstk_darwin(v8);
  v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_100003CB4(&qword_100032128);
  v11 = __chkstk_darwin(v61);
  v65 = (uint64_t)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v64 = (uint64_t)&v52 - v13;
  if (qword_100031338 != -1)
    swift_once(&qword_100031338, sub_10000E7B4);
  v14 = qword_100032AF0;
  v15 = swift_retain(qword_100032AF0);
  v16 = static Alignment.center.getter(v15);
  sub_1000185D4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v74, 0.0, 1, 0.5, 0, v16, v17, v14, 0, 1);
  v18 = swift_release(v14);
  if (qword_1000312D8 != -1)
    v18 = swift_once(&qword_1000312D8, sub_10000E644);
  if (byte_100031798)
    v19 = 0x401A000000000000;
  else
    v19 = 0x401E000000000000;
  v20 = static Alignment.center.getter(v18);
  v22 = _FrameLayout.init(width:height:alignment:)(&v68, 0, 1, v19, 0, v20, v21);
  v60 = v68;
  v59 = v69;
  v58 = v70;
  v57 = v71;
  v55 = v73;
  v56 = v72;
  *(_QWORD *)v10 = static VerticalAlignment.center.getter(v22);
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 1;
  v23 = sub_100003CB4(&qword_100032130);
  v53 = &v10[*(int *)(v23 + 44)];
  v54 = v10;
  v25 = *a1;
  v24 = a1[1];
  v26 = a1[3];
  v27 = a1[4];
  v28 = a1[5];
  v29 = a1[6];
  v30 = static HorizontalAlignment.leading.getter(v23);
  v31 = (uint64_t)v62;
  *v62 = v30;
  *(_QWORD *)(v31 + 8) = 0;
  *(_BYTE *)(v31 + 16) = 0;
  v32 = sub_100003CB4(&qword_100032138);
  sub_1000201C8(v25, v24, v27, v28, v29, v26, v31 + *(int *)(v32 + 44));
  v33 = v63;
  sub_10000E458(v31, v63, &qword_100032118);
  v34 = (uint64_t)v53;
  sub_10000E458(v33, (uint64_t)v53, &qword_100032118);
  v35 = v34 + *(int *)(sub_100003CB4(&qword_100032140) + 48);
  *(_QWORD *)v35 = 0;
  *(_BYTE *)(v35 + 8) = 1;
  sub_100006C90(v31, &qword_100032118);
  v36 = sub_100006C90(v33, &qword_100032118);
  v37 = static Color.clear.getter(v36);
  LOBYTE(v33) = static Edge.Set.all.getter(v37);
  v38 = (uint64_t)v54;
  v39 = v65;
  sub_10000E458((uint64_t)v54, v65, &qword_100032120);
  v40 = v39 + *(int *)(v61 + 36);
  *(_QWORD *)v40 = v37;
  *(_BYTE *)(v40 + 8) = v33;
  sub_100006C90(v38, &qword_100032120);
  v41 = v64;
  sub_100013A08(v39, v64, &qword_100032128);
  sub_10000E458(v41, v39, &qword_100032128);
  v42 = v78;
  v43 = v79;
  v66[4] = v78;
  v66[5] = v79;
  v44 = v81;
  v66[6] = v80;
  v66[7] = v81;
  v45 = v74;
  v46 = v75;
  v66[0] = v74;
  v66[1] = v75;
  v47 = v76;
  v48 = v77;
  v66[2] = v76;
  v66[3] = v77;
  *(_OWORD *)(a2 + 96) = v80;
  *(_OWORD *)(a2 + 112) = v44;
  *(_OWORD *)(a2 + 64) = v42;
  *(_OWORD *)(a2 + 80) = v43;
  *(_OWORD *)(a2 + 32) = v47;
  *(_OWORD *)(a2 + 48) = v48;
  *(_OWORD *)a2 = v45;
  *(_OWORD *)(a2 + 16) = v46;
  *(_QWORD *)(a2 + 128) = 0;
  *(_BYTE *)(a2 + 136) = 1;
  *(_QWORD *)(a2 + 144) = v60;
  *(_BYTE *)(a2 + 152) = v59;
  *(_QWORD *)(a2 + 160) = v58;
  *(_BYTE *)(a2 + 168) = v57;
  v49 = v55;
  *(_QWORD *)(a2 + 176) = v56;
  *(_QWORD *)(a2 + 184) = v49;
  v50 = sub_100003CB4(&qword_100032148);
  sub_10000E458(v39, a2 + *(int *)(v50 + 64), &qword_100032128);
  sub_1000223D8(v66);
  sub_100006C90(v41, &qword_100032128);
  sub_100006C90(v39, &qword_100032128);
  v67[4] = v78;
  v67[5] = v79;
  v67[6] = v80;
  v67[7] = v81;
  v67[0] = v74;
  v67[1] = v75;
  v67[2] = v76;
  v67[3] = v77;
  return sub_100022400(v67);
}

_QWORD *sub_100020F94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __int128 v4;
  uint64_t v5;
  _OWORD v7[3];
  uint64_t v8;

  v4 = *(_OWORD *)(v2 + 16);
  v7[0] = *(_OWORD *)v2;
  v7[1] = v4;
  v7[2] = *(_OWORD *)(v2 + 32);
  v8 = *(_QWORD *)(v2 + 48);
  *(_QWORD *)a2 = static HorizontalAlignment.center.getter(a1);
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 0;
  v5 = sub_100003CB4(&qword_100032110);
  return sub_100020AE0((uint64_t *)v7, a2 + *(int *)(v5 + 44));
}

uint64_t sub_100020FF8(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for Image.Scale(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.imageScale.setter(v3);
}

uint64_t sub_100021074@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  CGFloat v25;
  id v26;
  double v27;
  double v28;
  double width;
  double height;
  id v31;
  id v32;
  double *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t result;
  uint64_t v44;
  uint64_t v45;
  _QWORD aBlock[5];
  uint64_t v47;
  CGSize v48;
  CGRect v49;
  CGRect v50;

  swift_retain(a4);
  v44 = a7;
  v45 = a8;
  sub_10001AFEC(a7, a8);
  objc_msgSend(a1, "size");
  v15 = v14;
  objc_msgSend(a1, "size");
  v17 = v16;
  if (qword_1000312D8 != -1)
    swift_once(&qword_1000312D8, sub_10000E644);
  if (byte_100031798)
    v18 = 48.0;
  else
    v18 = 60.0;
  v19 = 90.0;
  if (byte_100031798)
    v19 = 72.0;
  if (v15 == v17)
    v20 = v18;
  else
    v20 = v19;
  v21 = (void *)objc_opt_self(UIScreen);
  v22 = objc_msgSend(v21, "mainScreen");
  objc_msgSend(v22, "scale");
  v24 = v23;

  v25 = v18 * v24;
  v26 = objc_msgSend(v21, "mainScreen");
  objc_msgSend(v26, "scale");
  v28 = v27;

  objc_msgSend(a1, "size");
  v50.origin.x = 0.0;
  v50.origin.y = 0.0;
  v50.size.width = v25;
  v50.size.height = v20 * v28;
  v49 = AVMakeRectWithAspectRatioInsideRect(v48, v50);
  width = v49.size.width;
  height = v49.size.height;
  v31 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRendererFormat), "init");
  objc_msgSend(v31, "setScale:", 1.0);
  v32 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRenderer), "initWithSize:format:", v31, width, height);
  v33 = (double *)swift_allocObject(&unk_10002D878, 40, 7);
  *((_QWORD *)v33 + 2) = a1;
  v33[3] = width;
  v33[4] = height;
  v34 = swift_allocObject(&unk_10002D8A0, 32, 7);
  *(_QWORD *)(v34 + 16) = sub_1000213F0;
  *(_QWORD *)(v34 + 24) = v33;
  aBlock[4] = sub_10001B040;
  v47 = v34;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001E738;
  aBlock[3] = &unk_10002D8B8;
  v35 = _Block_copy(aBlock);
  v36 = v47;
  v37 = a1;
  swift_retain(v34);
  swift_release(v36);
  v38 = objc_msgSend(v32, "imageWithActions:", v35);
  sub_10001AE6C(v44, v45);

  swift_release(a4);
  _Block_release(v35);
  LOBYTE(v36) = swift_isEscapingClosureAtFileLocation(v34, "", 99, 128, 38, 1);
  swift_release(v33);
  result = swift_release(v34);
  if ((v36 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)a9 = v38;
    *(_QWORD *)(a9 + 8) = a2;
    *(_QWORD *)(a9 + 16) = a3;
    *(_QWORD *)(a9 + 24) = a4;
    *(_QWORD *)(a9 + 32) = a5;
    *(_QWORD *)(a9 + 40) = a6;
    *(_QWORD *)(a9 + 48) = v44;
    *(_QWORD *)(a9 + 56) = v45;
    *(_BYTE *)(a9 + 64) = v15 == v17;
  }
  return result;
}

uint64_t sub_1000213CC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 40, 7);
}

id sub_1000213F0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "drawInRect:", 0.0, 0.0, *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_10002140C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002141C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002142C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100021434(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100021478(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *(_QWORD *)(a1 + 176);
  v3 = *(_QWORD *)(a1 + 184);
  v4 = *(_QWORD *)(a1 + 208);
  v5 = *(_QWORD *)(a1 + 216);
  v6 = *(_QWORD *)(a1 + 224);
  v7 = *(_QWORD *)(a1 + 232);
  v8 = *(_QWORD *)(a1 + 240);
  v19 = *(_QWORD *)(a1 + 376);
  v20 = *(_QWORD *)(a1 + 368);
  v17 = *(_QWORD *)(a1 + 392);
  v18 = *(_QWORD *)(a1 + 384);
  v15 = *(_QWORD *)(a1 + 408);
  v16 = *(_QWORD *)(a1 + 400);
  v13 = *(_QWORD *)(a1 + 424);
  v14 = *(_QWORD *)(a1 + 416);
  v11 = *(_OWORD *)(a1 + 448);
  v12 = *(_OWORD *)(a1 + 432);
  v9 = *(_QWORD *)(a1 + 792);
  sub_10001B504(*(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160), *(_BYTE *)(a1 + 168));
  swift_retain(v7);
  swift_retain(v8);
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  sub_1000215B0(v20, v19, v18, v17, v16, v15, v14, v13, v12, *((uint64_t *)&v12 + 1), v11, *((uint64_t *)&v11 + 1));
  swift_retain(v9);
  return a1;
}

uint64_t sub_1000215B0(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a4)
  {
    sub_10001B504(result, a2, a3 & 1);
    swift_retain(a11);
    swift_retain(a12);
    swift_bridgeObjectRetain(a4);
    swift_retain(a5);
    swift_retain(a8);
    swift_retain(a9);
    return swift_retain(a10);
  }
  return result;
}

uint64_t sub_100021638(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100021674(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *(_QWORD *)(a1 + 176);
  v3 = *(_QWORD *)(a1 + 184);
  v4 = *(_QWORD *)(a1 + 208);
  v5 = *(_QWORD *)(a1 + 216);
  v6 = *(_QWORD *)(a1 + 224);
  v7 = *(_QWORD *)(a1 + 232);
  v8 = *(_QWORD *)(a1 + 240);
  v19 = *(_QWORD *)(a1 + 376);
  v20 = *(_QWORD *)(a1 + 368);
  v17 = *(_QWORD *)(a1 + 392);
  v18 = *(_QWORD *)(a1 + 384);
  v15 = *(_QWORD *)(a1 + 408);
  v16 = *(_QWORD *)(a1 + 400);
  v13 = *(_QWORD *)(a1 + 424);
  v14 = *(_QWORD *)(a1 + 416);
  v11 = *(_OWORD *)(a1 + 448);
  v12 = *(_OWORD *)(a1 + 432);
  v9 = *(_QWORD *)(a1 + 792);
  sub_1000217AC(*(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160), *(_BYTE *)(a1 + 168));
  swift_release(v8);
  swift_release(v6);
  swift_release(v4);
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  swift_release(v5);
  swift_release(v7);
  sub_1000217BC(v20, v19, v18, v17, v16, v15, v14, v13, v12, *((uint64_t *)&v12 + 1), v11, *((uint64_t *)&v11 + 1));
  swift_release(v9);
  return a1;
}

uint64_t sub_1000217AC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_1000217BC(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a4)
  {
    sub_1000217AC(result, a2, a3 & 1);
    swift_release(a12);
    swift_release(a10);
    swift_release(a8);
    swift_release(a5);
    swift_bridgeObjectRelease(a4);
    swift_release(a9);
    return swift_release(a11);
  }
  return result;
}

uint64_t sub_100021844()
{
  return EnvironmentValues.imageScale.getter();
}

unint64_t sub_100021868()
{
  unint64_t result;

  result = qword_100032100;
  if (!qword_100032100)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100032100);
  }
  return result;
}

uint64_t sub_1000218AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1000218DC(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_100021908@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100021930(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_100021958@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100021980(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

double sub_1000219A8(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 144) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

_QWORD *sub_1000219C8(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18]);
  return a1;
}

uint64_t sub_100021A2C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 88);
  sub_1000217AC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release(v8);
  swift_release(v6);
  swift_release(v4);
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  swift_release(v5);
  swift_release(v7);
  return a1;
}

uint64_t destroy for RequestStatusView(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  return swift_release(a1[6]);
}

_QWORD *initializeWithCopy for RequestStatusView(_QWORD *a1, _QWORD *a2)
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
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[6];
  a1[6] = v6;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_retain(v6);
  return a1;
}

_QWORD *assignWithCopy for RequestStatusView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

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
  a1[4] = a2[4];
  v8 = a2[5];
  v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = a1[6];
  v11 = a2[6];
  a1[6] = v11;
  swift_retain(v11);
  swift_release(v10);
  return a1;
}

__n128 initializeWithTake for RequestStatusView(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

_QWORD *assignWithTake for RequestStatusView(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = a1[1];
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = a1[3];
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  a1[4] = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease(a1[5]);
  v8 = a1[6];
  *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 40);
  swift_release(v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for RequestStatusView(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 56))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for RequestStatusView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for RequestStatusView()
{
  return &type metadata for RequestStatusView;
}

uint64_t sub_100021D4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t assignWithCopy for RequestDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for RequestDescription(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for RequestDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for RequestDescription(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RequestDescription(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RequestDescription()
{
  return &type metadata for RequestDescription;
}

_QWORD *initializeBufferWithCopyOfBuffer for RequestName(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for RequestName(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for RequestName(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for RequestName(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for RequestName(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RequestName(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RequestName()
{
  return &type metadata for RequestName;
}

uint64_t destroy for ThumbnailWithBadge(uint64_t a1)
{
  uint64_t result;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
  swift_release(*(_QWORD *)(a1 + 24));
  swift_release(*(_QWORD *)(a1 + 32));
  result = swift_release(*(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
    return swift_release(*(_QWORD *)(a1 + 56));
  return result;
}

uint64_t initializeWithCopy for ThumbnailWithBadge(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  id v12;
  uint64_t v13;

  v4 = *(void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  v11 = (_OWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 48);
  v12 = v4;
  swift_bridgeObjectRetain(v6);
  swift_retain(v7);
  swift_retain(v8);
  swift_retain(v9);
  if (v10)
  {
    v13 = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 48) = v10;
    *(_QWORD *)(a1 + 56) = v13;
    swift_retain(v13);
  }
  else
  {
    *(_OWORD *)(a1 + 48) = *v11;
  }
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

uint64_t assignWithCopy for ThumbnailWithBadge(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
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

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v8);
  v9 = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v9;
  swift_retain(v9);
  swift_release(v10);
  v11 = *(_QWORD *)(a2 + 32);
  v12 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v11;
  swift_retain(v11);
  swift_release(v12);
  v13 = *(_QWORD *)(a2 + 40);
  v14 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v13;
  swift_retain(v13);
  swift_release(v14);
  v15 = *(_QWORD *)(a2 + 48);
  if (!*(_QWORD *)(a1 + 48))
  {
    if (v15)
    {
      v18 = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 48) = v15;
      *(_QWORD *)(a1 + 56) = v18;
      swift_retain(v18);
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    goto LABEL_8;
  }
  if (!v15)
  {
    swift_release(*(_QWORD *)(a1 + 56));
    goto LABEL_7;
  }
  v16 = *(_QWORD *)(a2 + 56);
  v17 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v15;
  *(_QWORD *)(a1 + 56) = v16;
  swift_retain(v16);
  swift_release(v17);
LABEL_8:
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

__n128 initializeWithTake for ThumbnailWithBadge(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for ThumbnailWithBadge(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
  v5 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release(v5);
  swift_release(*(_QWORD *)(a1 + 32));
  v6 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release(v6);
  v7 = *(_QWORD *)(a2 + 48);
  if (!*(_QWORD *)(a1 + 48))
  {
    if (v7)
    {
      v10 = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 48) = v7;
      *(_QWORD *)(a1 + 56) = v10;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    goto LABEL_8;
  }
  if (!v7)
  {
    swift_release(*(_QWORD *)(a1 + 56));
    goto LABEL_7;
  }
  v8 = *(_QWORD *)(a2 + 56);
  v9 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v7;
  *(_QWORD *)(a1 + 56) = v8;
  swift_release(v9);
LABEL_8:
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for ThumbnailWithBadge(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 65))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ThumbnailWithBadge(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 65) = 1;
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
    *(_BYTE *)(result + 65) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ThumbnailWithBadge()
{
  return &type metadata for ThumbnailWithBadge;
}

uint64_t sub_100022398(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100026378, 1);
}

uint64_t sub_1000223A8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100026350, 1);
}

uint64_t sub_1000223B8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100026328, 1);
}

uint64_t sub_1000223C8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100026300, 1);
}

_QWORD *sub_1000223D8(_QWORD *a1)
{
  swift_retain(*a1);
  return a1;
}

_QWORD *sub_100022400(_QWORD *a1)
{
  swift_release(*a1);
  return a1;
}

uint64_t sub_100022428(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a4)
  {
    sub_10001B504(result, a2, a3 & 1);
    swift_retain(a9);
    swift_bridgeObjectRetain(a4);
    swift_retain(a5);
    return swift_retain(a8);
  }
  return result;
}

uint64_t sub_100022484(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a4)
  {
    sub_1000217AC(result, a2, a3 & 1);
    swift_release(a8);
    swift_release(a5);
    swift_bridgeObjectRelease(a4);
    return swift_release(a9);
  }
  return result;
}

uint64_t sub_1000224E0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10001B504(result, a2, a3 & 1);
    return swift_bridgeObjectRetain(a4);
  }
  return result;
}

uint64_t sub_100022510(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1000217AC(result, a2, a3 & 1);
    return swift_bridgeObjectRelease(a4);
  }
  return result;
}

uint64_t sub_100022540(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  sub_1000217AC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release(v4);
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  return a1;
}

uint64_t sub_100022598(uint64_t result)
{
  *(_BYTE *)(result + 184) = 1;
  return result;
}

uint64_t sub_1000225A4()
{
  return sub_10001B2A4(&qword_1000321B0, &qword_1000321B8, (void (*)(void))sub_1000225C8);
}

unint64_t sub_1000225C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000321C0;
  if (!qword_1000321C0)
  {
    v1 = sub_10000E2DC(&qword_1000321C8);
    sub_10002264C();
    sub_10001B3B4(&qword_1000321E0, &qword_1000321E8, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000321C0);
  }
  return result;
}

unint64_t sub_10002264C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000321D0;
  if (!qword_1000321D0)
  {
    v1 = sub_10000E2DC(&qword_1000321D8);
    sub_10001B3B4(&qword_100031EE0, &qword_100031EE8, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000321D0);
  }
  return result;
}

uint64_t sub_1000226D0(uint64_t result)
{
  *(_BYTE *)(result + 184) = 0;
  return result;
}

uint64_t sub_1000226D8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.allowsTightening.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100022704(unsigned __int8 *a1)
{
  return EnvironmentValues.allowsTightening.setter(*a1);
}

_QWORD *sub_100022728(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  return a1;
}

uint64_t sub_100022750()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 48));
  swift_release(*(_QWORD *)(v0 + 56));
  if (*(_QWORD *)(v0 + 64))
    swift_release(*(_QWORD *)(v0 + 72));
  return swift_deallocObject(v0, 81, 7);
}

uint64_t sub_1000227A4()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t result;

  v1 = *(uint64_t (**)(void))(v0 + 64);
  if (v1)
    return v1();
  return result;
}

uint64_t sub_1000227CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(id *)a1;
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  sub_10001AFEC(v6, v7);
  return a1;
}

unint64_t sub_100022844()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032240;
  if (!qword_100032240)
  {
    v1 = sub_10000E2DC(&qword_100032230);
    sub_1000228C8();
    sub_10001B3B4(&qword_100031EE0, &qword_100031EE8, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100032240);
  }
  return result;
}

unint64_t sub_1000228C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032248;
  if (!qword_100032248)
  {
    v1 = sub_10000E2DC(&qword_100032228);
    sub_10001B2A4(&qword_100032250, &qword_100032258, (void (*)(void))sub_10002296C);
    sub_10001B3B4(&qword_100031EF0, &qword_100031EF8, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100032248);
  }
  return result;
}

unint64_t sub_10002296C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032260;
  if (!qword_100032260)
  {
    v1 = sub_10000E2DC(&qword_100032268);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100032260);
  }
  return result;
}

uint64_t sub_1000229D0()
{
  return sub_10001B3B4(&qword_100032298, &qword_1000322A0, (uint64_t)&protocol conformance descriptor for VStack<A>);
}

uint64_t sub_1000229FC()
{
  return sub_10001B3B4(&qword_1000322A8, &qword_1000322B0, (uint64_t)&protocol conformance descriptor for HStack<A>);
}

uint64_t sub_100022A28()
{
  return sub_10001B2A4(&qword_1000322B8, &qword_1000322C0, (void (*)(void))sub_100022A5C);
}

unint64_t sub_100022A5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000322C8;
  if (!qword_1000322C8)
  {
    v1 = sub_10000E2DC(&qword_1000322D0);
    sub_100022AE0();
    sub_10001B3B4(&qword_1000322F8, &qword_100032300, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000322C8);
  }
  return result;
}

unint64_t sub_100022AE0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000322D8;
  if (!qword_1000322D8)
  {
    v1 = sub_10000E2DC(&qword_1000322E0);
    sub_100022B64();
    sub_10001B3B4(&qword_100031EE0, &qword_100031EE8, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000322D8);
  }
  return result;
}

unint64_t sub_100022B64()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000322E8;
  if (!qword_1000322E8)
  {
    v1 = sub_10000E2DC(&qword_1000322F0);
    sub_10001B3B4(&qword_1000321E0, &qword_1000321E8, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000322E8);
  }
  return result;
}

uint64_t sub_100022BE8()
{
  return sub_10001B3B4(&qword_100032308, &qword_100032310, (uint64_t)&protocol conformance descriptor for HStack<A>);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC22PeopleMessagesAskToBuyP33_B25C1C3C8BA9800F31056C22605F1BEA19ResourceBundleClass);
}
