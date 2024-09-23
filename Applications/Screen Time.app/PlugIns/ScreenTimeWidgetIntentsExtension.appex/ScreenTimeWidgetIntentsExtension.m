uint64_t variable initialization expression of STSelectUserIntentResponse.code()
{
  return 0;
}

BOOL sub_1000039E0(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

void sub_1000039F4(_WORD *a1@<X8>)
{
  _WORD *v1;

  *a1 = *v1;
}

uint64_t sub_100003A00@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100003A28()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100004834(v0, qword_100011710);
  sub_1000046F0(v0, (uint64_t)qword_100011710);
  return Logger.init(subsystem:category:)(0xD000000000000021, 0x800000010000A7E0, 0x6148746E65746E49, 0xED000072656C646ELL);
}

id sub_100003B6C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntentHandler()
{
  return objc_opt_self(_TtC32ScreenTimeWidgetIntentsExtension13IntentHandler);
}

uint64_t sub_100003BBC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_100003BDC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD aBlock[5];
  uint64_t v14;
  _QWORD v15[5];

  v2 = type metadata accessor for XPCPersistentStoreManager();
  v15[3] = v2;
  v15[4] = &off_10000C728;
  v15[0] = a1;
  v3 = swift_allocObject(&unk_10000C698, 24, 7);
  *(_QWORD *)(v3 + 16) = &_swiftEmptyArrayStorage;
  v4 = *sub_100004738(v15, v2);
  swift_retain_n(v3, 2);
  swift_retain(a1);
  sub_100004B9C();
  if (*(_BYTE *)(v4 + 24) != 1)
    goto LABEL_4;
  v5 = objc_msgSend(*(id *)(v4 + 16), "newBackgroundContext");
  objc_msgSend(v5, "setAutomaticallyMergesChangesFromParent:", 1);
  objc_msgSend(v5, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
  v6 = (_QWORD *)swift_allocObject(&unk_10000C6C0, 40, 7);
  v6[2] = sub_100004898;
  v6[3] = v3;
  v6[4] = v5;
  v7 = swift_allocObject(&unk_10000C6E8, 32, 7);
  *(_QWORD *)(v7 + 16) = sub_1000048EC;
  *(_QWORD *)(v7 + 24) = v6;
  aBlock[4] = sub_1000048E0;
  v14 = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100003BBC;
  aBlock[3] = &unk_10000C700;
  v8 = _Block_copy(aBlock);
  v9 = v14;
  swift_retain(v3);
  v10 = v5;
  swift_retain(v7);
  swift_release(v9);
  objc_msgSend(v10, "performBlockAndWait:", v8);

  _Block_release(v8);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation(v7, "", 109, 78, 36, 1);
  swift_release_n(v3, 2);
  swift_release(v6);
  swift_release(v7);
  if ((v10 & 1) != 0)
  {
    __break(1u);
LABEL_4:
    sub_100006780(v3);
    swift_release_n(v3, 2);
  }
  swift_beginAccess(v3 + 16, aBlock, 0, 0);
  v11 = *(_QWORD *)(v3 + 16);
  swift_bridgeObjectRetain(v11);
  swift_release(v3);
  sub_1000047BC(v15);
  return v11;
}

void *sub_100003E34(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int16 v17;
  __int16 v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[5];
  uint64_t v25;
  char v26[24];
  _QWORD v27[5];

  v2 = type metadata accessor for XPCPersistentStoreManager();
  v27[3] = v2;
  v27[4] = &off_10000C728;
  v27[0] = a1;
  v3 = swift_allocObject(&unk_10000C5F8, 42, 7);
  *(_QWORD *)(v3 + 16) = 0;
  v4 = v3 + 16;
  *(_QWORD *)(v3 + 24) = 0;
  *(_QWORD *)(v3 + 32) = 0;
  *(_WORD *)(v3 + 40) = 0;
  v5 = *sub_100004738(v27, v2);
  swift_retain_n(v3, 2);
  swift_retain(a1);
  sub_100004B9C();
  if (*(_BYTE *)(v5 + 24) != 1)
    goto LABEL_4;
  v6 = objc_msgSend(*(id *)(v5 + 16), "newBackgroundContext");
  objc_msgSend(v6, "setAutomaticallyMergesChangesFromParent:", 1);
  objc_msgSend(v6, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
  v7 = (_QWORD *)swift_allocObject(&unk_10000C620, 40, 7);
  v7[2] = sub_10000475C;
  v7[3] = v3;
  v7[4] = v6;
  v8 = swift_allocObject(&unk_10000C648, 32, 7);
  *(_QWORD *)(v8 + 16) = sub_1000047E0;
  *(_QWORD *)(v8 + 24) = v7;
  v24[4] = sub_1000047FC;
  v25 = v8;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 1107296256;
  v24[2] = sub_100003BBC;
  v24[3] = &unk_10000C660;
  v9 = _Block_copy(v24);
  v10 = v25;
  swift_retain(v3);
  v11 = v6;
  swift_retain(v8);
  swift_release(v10);
  objc_msgSend(v11, "performBlockAndWait:", v9);

  _Block_release(v9);
  LOBYTE(v11) = swift_isEscapingClosureAtFileLocation(v8, "", 109, 78, 36, 1);
  swift_release_n(v3, 2);
  swift_release(v7);
  swift_release(v8);
  if ((v11 & 1) != 0)
  {
    __break(1u);
LABEL_4:
    v12 = sub_100005FC8();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    swift_beginAccess(v4, v24, 1, 0);
    v19 = *(void **)(v3 + 16);
    v20 = *(_QWORD *)(v3 + 24);
    v21 = *(_QWORD *)(v3 + 32);
    *(_QWORD *)(v3 + 16) = v12;
    *(_QWORD *)(v3 + 24) = v14;
    *(_QWORD *)(v3 + 32) = v16;
    *(_WORD *)(v3 + 40) = v18;
    sub_100004764(v19, v20, v21);
    swift_release_n(v3, 2);
  }
  swift_beginAccess(v4, v26, 0, 0);
  v22 = *(void **)(v3 + 16);
  sub_100004790(v22, *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32));
  swift_release(v3);
  sub_1000047BC(v27);
  return v22;
}

_QWORD *sub_1000040E8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;
  unsigned __int8 *v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSString v14;
  NSString v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *ObjCClassFromMetadata;

  v2 = *(_QWORD *)(a1 + 16);
  result = _swiftEmptyArrayStorage;
  if (v2)
  {
    specialized ContiguousArray.reserveCapacity(_:)(v2);
    v4 = type metadata accessor for STUser();
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v4);
    v5 = (unsigned __int8 *)(a1 + 57);
    do
    {
      v6 = *(void **)(v5 - 25);
      v7 = *(_QWORD *)(v5 - 9);
      v8 = *v5;
      v5 += 32;
      v9 = v6;
      swift_bridgeObjectRetain(v7);
      v10 = objc_msgSend(v9, "stringValue");
      static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
      v12 = v11;

      v13 = objc_allocWithZone(ObjCClassFromMetadata);
      swift_bridgeObjectRetain(v7);
      v14 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v12);
      v15 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v7);
      v16 = objc_msgSend(v13, "initWithIdentifier:displayString:", v14, v15);

      v17 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", v8);
      objc_msgSend(v16, "setIsRemote:", v17);
      swift_bridgeObjectRelease(v7);

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      v18 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v18);
      v19 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, v16);
      specialized ContiguousArray._endMutation()(v19);
      --v2;
    }
    while (v2);
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void sub_1000042A0(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  id v14;
  Class isa;
  id v16;

  if (qword_1000116F0 != -1)
    swift_once(&qword_1000116F0, sub_100003A28);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_1000046F0(v4, (uint64_t)qword_100011710);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "provide user options collection", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  if (qword_100011700 != -1)
    swift_once(&qword_100011700, sub_100004970);
  v9 = qword_100011E78;
  v10 = swift_retain(qword_100011E78);
  v11 = sub_100003BDC(v10);
  swift_release(v9);
  v12 = a1;
  v13 = sub_1000040E8(v11);
  swift_bridgeObjectRelease(v11);

  v14 = objc_allocWithZone((Class)INObjectCollection);
  type metadata accessor for STUser();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  v16 = objc_msgSend(v14, "initWithItems:", isa);

  (*(void (**)(uint64_t, id, _QWORD))(a2 + 16))(a2, v16, 0);
}

id sub_100004458()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSString v18;
  NSString v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;

  if (qword_1000116F0 != -1)
    swift_once(&qword_1000116F0, sub_100003A28);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_1000046F0(v0, (uint64_t)qword_100011710);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "get default user for widget. getting local user", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }

  if (qword_100011700 != -1)
    swift_once(&qword_100011700, sub_100004970);
  v5 = qword_100011E78;
  v6 = swift_retain(qword_100011E78);
  v7 = sub_100003E34(v6);
  v9 = v8;
  v11 = v10;
  v12 = swift_release(v5);
  if (v7)
  {
    v13 = type metadata accessor for STUser();
    v14 = objc_msgSend(v7, "stringValue");
    static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    v16 = v15;

    v17 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v13));
    swift_bridgeObjectRetain(v9);
    v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v16);
    v19 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
    v20 = objc_msgSend(v17, "initWithIdentifier:displayString:", v18, v19);

    v21 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", (v11 >> 8) & 1);
    objc_msgSend(v20, "setIsRemote:", v21);
    swift_bridgeObjectRelease(v9);

  }
  else
  {
    v22 = Logger.logObject.getter(v12);
    v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "couldn't fetch local user to use as default user", v24, 2u);
      swift_slowDealloc(v24, -1, -1);
    }

    return 0;
  }
  return v20;
}

uint64_t sub_1000046F0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100004708()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {

    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  }
  return swift_deallocObject(v0, 42, 7);
}

_QWORD *sub_100004738(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void *sub_10000475C(uint64_t a1)
{
  uint64_t v1;

  return sub_100005800(a1, v1);
}

void *sub_100004764(void *result, uint64_t a2, uint64_t a3)
{
  if (result)
  {

    return (void *)swift_bridgeObjectRelease(a3);
  }
  return result;
}

void *sub_100004790(void *result, uint64_t a2, uint64_t a3)
{
  id v4;

  if (result)
  {
    v4 = result;
    return (void *)swift_bridgeObjectRetain(a3);
  }
  return result;
}

uint64_t sub_1000047BC(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000047E0()
{
  uint64_t v0;

  return sub_1000050A0(*(uint64_t (**)(uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_1000047EC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000047FC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000481C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000482C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t *sub_100004834(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100004874()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_100004898(uint64_t a1)
{
  uint64_t v1;

  sub_1000057F8(a1, v1);
}

uint64_t sub_1000048A4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000048D0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000048F0()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100004834(v0, qword_100011750);
  sub_1000046F0(v0, (uint64_t)qword_100011750);
  return Logger.init(subsystem:category:)(0xD00000000000001ALL, 0x800000010000AA20, 0xD000000000000016, 0x8000000100009950);
}

uint64_t sub_100004970()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = type metadata accessor for XPCPersistentStoreManager();
  v1 = swift_allocObject(v0, 40, 7);
  result = sub_1000049A8();
  qword_100011E78 = v1;
  return result;
}

uint64_t sub_1000049A8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  NSString v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  Class isa;
  _QWORD v18[5];

  v1 = v0;
  v2 = (void *)objc_opt_self(STPersistenceConfiguration);
  v3 = objc_msgSend(v2, "managedObjectModel");
  v4 = objc_allocWithZone((Class)NSPersistentContainer);
  v5 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend(v4, "initWithName:managedObjectModel:", v5, v3);

  *(_QWORD *)(v1 + 16) = v6;
  *(_BYTE *)(v1 + 24) = 0;
  *(_QWORD *)(v1 + 32) = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for STWidgetXPCStoreServerEndpointFactory()), "init");
  v7 = objc_msgSend(v2, "localPersistentXPCStoreDescription");
  v8 = type metadata accessor for ScreenTimeFeatureFlags(0);
  v18[3] = v8;
  v18[4] = sub_100005654();
  v9 = sub_10000569C(v18);
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v8 - 8) + 104))(v9, enum case for ScreenTimeFeatureFlags.simplifiedAgent(_:), v8);
  LOBYTE(v8) = isFeatureEnabled(_:)(v18);
  sub_1000047BC(v18);
  if ((v8 & 1) != 0)
    objc_msgSend(v7, "setOption:forKey:", *(_QWORD *)(v1 + 32), NSXPCStoreServerEndpointFactoryKey);
  v10 = *(void **)(v1 + 16);
  v11 = sub_1000055B8((uint64_t *)&unk_100011900);
  v12 = swift_allocObject(v11, 40, 7);
  *(_OWORD *)(v12 + 16) = xmmword_100009920;
  *(_QWORD *)(v12 + 32) = v7;
  v18[0] = v12;
  specialized Array._endMutation()();
  v13 = v18[0];
  sub_1000055F8();
  v14 = v10;
  v15 = v7;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  objc_msgSend(v14, "setPersistentStoreDescriptions:", isa);

  return v1;
}

void sub_100004B9C()
{
  uint64_t v0;
  void *v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  NSObject *oslog;
  _QWORD aBlock[5];
  uint64_t v20;

  if ((*(_BYTE *)(v0 + 24) & 1) == 0)
  {
    v1 = *(void **)(v0 + 16);
    v2 = objc_msgSend(v1, "persistentStoreDescriptions");
    v3 = sub_1000055F8();
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

    if ((unint64_t)v4 >> 62)
    {
      if (v4 < 0)
        v17 = v4;
      else
        v17 = v4 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v4);
      v5 = _CocoaArrayWrapper.endIndex.getter(v17);
      swift_bridgeObjectRelease(v4);
    }
    else
    {
      v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(v4);
    if (v5)
    {
      aBlock[4] = sub_100005634;
      v20 = v0;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_10000502C;
      aBlock[3] = &unk_10000C748;
      v6 = _Block_copy(aBlock);
      v7 = v20;
      swift_retain(v0);
      swift_release(v7);
      objc_msgSend(v1, "loadPersistentStoresWithCompletionHandler:", v6);
      _Block_release(v6);
      if (*(_BYTE *)(v0 + 24) == 1)
      {
        if (qword_1000116F8 != -1)
          swift_once(&qword_1000116F8, sub_1000048F0);
        v8 = type metadata accessor for Logger(0);
        v9 = sub_1000046F0(v8, (uint64_t)qword_100011750);
        v10 = Logger.logObject.getter(v9);
        v11 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v10, v11))
        {
          v12 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v12 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, v11, "Successfully loaded persistent stores", v12, 2u);
          swift_slowDealloc(v12, -1, -1);
        }

      }
    }
    else
    {
      *(_BYTE *)(v0 + 24) = 0;
      if (qword_1000116F8 != -1)
        swift_once(&qword_1000116F8, sub_1000048F0);
      v13 = type metadata accessor for Logger(0);
      v14 = sub_1000046F0(v13, (uint64_t)qword_100011750);
      oslog = Logger.logObject.getter(v14);
      v15 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(oslog, v15))
      {
        v16 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, oslog, v15, "No persistent stores available to load", v16, 2u);
        swift_slowDealloc(v16, -1, -1);
      }

    }
  }
}

void sub_100004E40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *oslog;
  uint64_t v12;
  uint64_t v13;

  if (a2)
  {
    *(_BYTE *)(a3 + 24) = 0;
    swift_errorRetain(a2);
    if (qword_1000116F8 != -1)
      swift_once(&qword_1000116F8, sub_1000048F0);
    v4 = type metadata accessor for Logger(0);
    sub_1000046F0(v4, (uint64_t)qword_100011750);
    swift_errorRetain(a2);
    v5 = swift_errorRetain(a2);
    oslog = Logger.logObject.getter(v5);
    v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(12, -1);
      v8 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v7 = 138412290;
      swift_errorRetain(a2);
      v9 = _swift_stdlib_bridgeErrorToNSError(a2);
      v12 = v9;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
      *v8 = v9;
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      _os_log_impl((void *)&_mh_execute_header, oslog, v6, "Failed to load persistent store: %@", v7, 0xCu);
      v10 = sub_1000055B8(&qword_1000118E8);
      swift_arrayDestroy(v8, 1, v10);
      swift_slowDealloc(v8, -1, -1);
      swift_slowDealloc(v7, -1, -1);

      swift_errorRelease(a2);
    }
    else
    {
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      swift_errorRelease(a2);

    }
  }
  else
  {
    *(_BYTE *)(a3 + 24) = 1;
  }
}

void sub_10000502C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(id, void *);
  id v7;
  id v8;

  v6 = *(void (**)(id, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v8 = a2;
  v7 = a3;
  v6(v8, a3);
  swift_release(v5);

}

uint64_t sub_1000050A0(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_1000050C8()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for XPCPersistentStoreManager()
{
  return objc_opt_self(_TtC32ScreenTimeWidgetIntentsExtension25XPCPersistentStoreManager);
}

id sub_100005154()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for STWidgetXPCStoreServerEndpointFactory();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for STWidgetXPCStoreServerEndpointFactory()
{
  return objc_opt_self(_TtC32ScreenTimeWidgetIntentsExtension37STWidgetXPCStoreServerEndpointFactory);
}

uint64_t sub_1000051A4(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1000051B4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_1000051E8(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_1000051F8(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a4();
  v7 = (void *)v6;
  v8 = *a1 + 8;
  if (v6)
    v10 = v6;
  else
    v10 = 0;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11);
  *a1 = v8;
  v9 = *a2;
  if (*a2)
  {
    *v9 = v7;
    *a2 = v9 + 1;
  }
  else
  {

  }
}

uint64_t sub_1000055B8(uint64_t *a1)
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

unint64_t sub_1000055F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000118F0;
  if (!qword_1000118F0)
  {
    v1 = objc_opt_self(NSPersistentStoreDescription);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000118F0);
  }
  return result;
}

void sub_100005634(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_100004E40(a1, a2, v2);
}

uint64_t sub_10000563C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000564C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100005654()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000118F8;
  if (!qword_1000118F8)
  {
    v1 = type metadata accessor for ScreenTimeFeatureFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for ScreenTimeFeatureFlags, v1);
    atomic_store(result, (unint64_t *)&qword_1000118F8);
  }
  return result;
}

_QWORD *sub_10000569C(_QWORD *a1)
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

uint64_t sub_1000056D8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for UsageProvider()
{
  return objc_opt_self(_TtC32ScreenTimeWidgetIntentsExtension13UsageProvider);
}

uint64_t sub_100005724()
{
  _QWORD *v0;

  sub_1000047BC(v0 + 2);
  sub_1000047BC(v0 + 7);
  sub_1000047BC(v0 + 12);
  return swift_deallocClassInstance(v0, 136, 7);
}

uint64_t type metadata accessor for CoreDataUsageProvider()
{
  return objc_opt_self(_TtC32ScreenTimeWidgetIntentsExtension21CoreDataUsageProvider);
}

uint64_t sub_100005778()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100004834(v0, qword_100011B90);
  sub_1000046F0(v0, (uint64_t)qword_100011B90);
  return Logger.init(subsystem:category:)(0xD00000000000001ALL, 0x800000010000AA20, 0xD000000000000014, 0x800000010000ABF0);
}

void sub_1000057F8(uint64_t a1, uint64_t a2)
{
  sub_100006780(a2);
}

void *sub_100005800(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  __int16 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v15[24];

  v3 = a2 + 16;
  v4 = sub_100005FC8();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  swift_beginAccess(v3, v15, 1, 0);
  v11 = *(void **)(a2 + 16);
  v12 = *(_QWORD *)(a2 + 24);
  v13 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a2 + 16) = v4;
  *(_QWORD *)(a2 + 24) = v6;
  *(_QWORD *)(a2 + 32) = v8;
  *(_WORD *)(a2 + 40) = v10;
  return sub_100004764(v11, v12, v13);
}

char *sub_10000587C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

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
      v10 = sub_1000055B8(&qword_100011C00);
      v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 1;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 5);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[32 * v8 + 32])
          memmove(v14, a4 + 32, 32 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100006690(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_100005988(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100005A58(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000076E0((uint64_t)v12, *a3);
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
      sub_1000076E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000047BC(v12);
  return v7;
}

uint64_t sub_100005A58(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100005C10(a5, a6);
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

uint64_t sub_100005C10(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100005CA4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100005E7C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100005E7C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100005CA4(uint64_t a1, unint64_t a2)
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
      v5 = sub_100005E18(v4, 0);
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

_QWORD *sub_100005E18(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000055B8(&qword_100011BF8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100005E7C(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000055B8(&qword_100011BF8);
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

id sub_100005FC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  NSObject **v40;
  NSObject *v41;
  uint64_t v42;
  id v43;
  Swift::String v44;
  Swift::String v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v52;
  NSObject *v53;
  _QWORD v54[2];
  id v55;
  Swift::String v56;

  v0 = type metadata accessor for PersonNameComponents(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v52 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend((id)objc_opt_self(STCoreUser), "fetchRequestMatchingLocalUser");
  v55 = 0;
  v5 = objc_msgSend(v4, "execute:", &v55);

  v6 = v55;
  if (!v5)
  {
    v30 = v55;
    v31 = (void *)_convertNSErrorToError(_:)(v6);

    swift_willThrow();
    v55 = v31;
    v32 = sub_1000055B8(&qword_100011BA8);
    v33 = sub_100007660(0, &qword_100011BB0, NSError_ptr);
    swift_dynamicCast(v54, &v55, v32, v33, 0);
    v34 = (void *)v54[0];
    if (qword_100011708 != -1)
      swift_once(&qword_100011708, sub_100005778);
    v35 = type metadata accessor for Logger(0);
    sub_1000046F0(v35, (uint64_t)qword_100011B90);
    v36 = v34;
    v37 = ((uint64_t (*)(void))Logger.logObject.getter)();
    v38 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc(12, -1);
      v40 = (NSObject **)swift_slowAlloc(8, -1);
      *(_DWORD *)v39 = 138412290;
      v53 = v36;
      v41 = v36;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, v54);
      *v40 = v36;

      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Failed to fetch local user: %@", v39, 0xCu);
      v42 = sub_1000055B8(&qword_1000118E8);
      swift_arrayDestroy(v40, 1, v42);
      swift_slowDealloc(v40, -1, -1);
      swift_slowDealloc(v39, -1, -1);
    }
    else
    {

      v37 = v36;
    }

    swift_errorRelease(v55);
    return 0;
  }
  v7 = sub_100007660(0, &qword_100011BB8, STCoreUser_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v7);
  v9 = v6;

  if (!((unint64_t)v8 >> 62))
  {
    v10 = *(void **)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v10)
      goto LABEL_4;
    goto LABEL_28;
  }
  if (v8 < 0)
    v46 = v8;
  else
    v46 = v8 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v8);
  v10 = (void *)_CocoaArrayWrapper.endIndex.getter(v46);
  swift_bridgeObjectRelease(v8);
  if (!v10)
  {
LABEL_28:
    swift_bridgeObjectRelease(v8);
    if (qword_100011708 != -1)
      swift_once(&qword_100011708, sub_100005778);
    v47 = type metadata accessor for Logger(0);
    sub_1000046F0(v47, (uint64_t)qword_100011B90);
    v48 = ((uint64_t (*)(void))Logger.logObject.getter)();
    v49 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v50 = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, v49, "Fetching local user returned empty results.", v50, 2u);
      swift_slowDealloc(v50, -1, -1);
    }

    return 0;
  }
LABEL_4:
  if ((v8 & 0xC000000000000001) != 0)
  {
    v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v8);
  }
  else
  {
    if (!*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_37;
    }
    v11 = *(id *)(v8 + 32);
  }
  v10 = v11;
  swift_bridgeObjectRelease(v8);
  if (qword_100011708 != -1)
LABEL_37:
    swift_once(&qword_100011708, sub_100005778);
  v12 = type metadata accessor for Logger(0);
  sub_1000046F0(v12, (uint64_t)qword_100011B90);
  v13 = ((uint64_t (*)(void))Logger.logObject.getter)();
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Successfully fetched local user.", v15, 2u);
    swift_slowDealloc(v15, -1, -1);
  }

  PersonNameComponents.init()();
  v16 = objc_msgSend(v10, "givenName");
  if (v16)
  {
    v17 = v16;
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
    v20 = v19;

    PersonNameComponents.givenName.setter(v18, v20);
    v21 = objc_msgSend(v10, "familyName");
    if (v21)
    {
      v22 = v21;
      v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
      v25 = v24;

      v21 = (id)PersonNameComponents.familyName.setter(v23, v25);
    }
    v26 = Logger.logObject.getter(v21);
    v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Successfully fetched given name of local user.", v28, 2u);
      swift_slowDealloc(v28, -1, -1);
    }

    PersonNameComponents.formatted()();
    v29 = objc_msgSend(v10, "dsid");
  }
  else
  {
    v29 = objc_msgSend(v10, "dsid");
    v43 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v56._object = (void *)0xE000000000000000;
    v44._object = (void *)0x800000010000ABD0;
    v44._countAndFlagsBits = 0xD000000000000016;
    v45._countAndFlagsBits = 0;
    v45._object = (void *)0xE000000000000000;
    v56._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v44, (Swift::String_optional)0, (NSBundle)v43, v45, v56);

  }
  objc_msgSend(v10, "isParent");

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v29;
}

uint64_t sub_100006690(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

void sub_100006780(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char **v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint8_t *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  BOOL v43;
  unint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  Swift::String v55;
  id v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int64_t v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  int64_t v79;
  unint64_t isa;
  char *v81;
  id v82;
  void *v83;
  unsigned int v84;
  id v85;
  char **v86;
  char *v87;
  char v88;
  unint64_t v89;
  unint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  os_log_type_t v95;
  uint8_t *v96;
  id v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  id v103;
  NSObject *v104;
  os_log_type_t v105;
  uint8_t *v106;
  _QWORD *v107;
  id v108;
  uint64_t v109;
  id v110;
  id v111;
  uint64_t v112;
  unint64_t v113;
  unint64_t v114;
  uint64_t v115;
  NSObject *v116;
  os_log_type_t v117;
  uint8_t *v118;
  uint64_t v119;
  uint64_t v120;
  char v121;
  char v122;
  char *v123;
  NSObject *v124;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v126;
  unint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  uint64_t v134;
  uint64_t v135;
  id v136;
  uint64_t v137;
  char **v138;
  NSObject *v139;
  uint64_t v140;
  uint64_t countAndFlagsBits;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *object;
  id v150;
  unint64_t v151;
  char *v152;
  uint64_t v153;
  os_log_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157[3];
  id v158[5];

  v2 = type metadata accessor for PersonNameComponents(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v131 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100005FC8();
  v147 = v9;
  if (!v6)
  {
    if (qword_100011708 != -1)
      goto LABEL_80;
    goto LABEL_64;
  }
  v137 = v7;
  v139 = v6;
  v10 = (char **)(a1 + 16);
  v138 = (char **)(a1 + 16);
  if ((v8 & 1) == 0)
    goto LABEL_86;
  v142 = v5;
  v143 = v3;
  v144 = v2;
  v133 = v8;
  v136 = objc_msgSend((id)objc_opt_self(STCoreUser), "fetchRequest");
  sub_100007660(0, &qword_100011BC0, NSPredicate_ptr);
  v11 = sub_1000055B8(&qword_100011BC8);
  v12 = swift_allocObject(v11, 232, 7);
  *(_OWORD *)(v12 + 16) = xmmword_100009B00;
  *(_QWORD *)(v12 + 56) = &type metadata for String;
  v13 = sub_10000761C();
  *(_QWORD *)(v12 + 32) = 0xD000000000000018;
  *(_QWORD *)(v12 + 40) = 0x800000010000AC40;
  *(_QWORD *)(v12 + 96) = &type metadata for String;
  *(_QWORD *)(v12 + 104) = v13;
  *(_QWORD *)(v12 + 64) = v13;
  *(_QWORD *)(v12 + 72) = 0xD000000000000010;
  *(_QWORD *)(v12 + 80) = 0x800000010000AC60;
  static String._unconditionallyBridgeFromObjectiveC(_:)(STFamilyMemberTypeChild);
  v15 = v14;
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v15);
  v17 = sub_100007660(0, &qword_100011BD8, NSString_ptr);
  *(_QWORD *)(v12 + 136) = v17;
  v18 = sub_100007698(&qword_100011BE0, &qword_100011BD8, NSString_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  *(_QWORD *)(v12 + 112) = v16;
  *(_QWORD *)(v12 + 176) = &type metadata for String;
  *(_QWORD *)(v12 + 184) = v13;
  *(_QWORD *)(v12 + 144) = v18;
  *(_QWORD *)(v12 + 152) = 0xD000000000000010;
  *(_QWORD *)(v12 + 160) = 0x800000010000AC60;
  static String._unconditionallyBridgeFromObjectiveC(_:)(STFamilyMemberTypeTeen);
  v20 = v19;
  v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v20);
  *(_QWORD *)(v12 + 216) = v17;
  *(_QWORD *)(v12 + 224) = v18;
  *(_QWORD *)(v12 + 192) = v21;
  v22 = (void *)NSPredicate.init(format:_:)(0xD000000000000027, 0x800000010000AC10, v12);
  v23 = v136;
  objc_msgSend(v136, "setPredicate:", v22);

  v158[0] = 0;
  v24 = objc_msgSend(v23, "execute:", v158);
  v25 = v158[0];
  if (!v24)
  {
    v97 = v158[0];
    v98 = (void *)_convertNSErrorToError(_:)(v25);

    swift_willThrow();
    v158[0] = v98;
    v99 = sub_1000055B8(&qword_100011BA8);
    v100 = sub_100007660(0, &qword_100011BB0, NSError_ptr);
    swift_dynamicCast(v157, v158, v99, v100, 0);
    v101 = (void *)v157[0];
    if (qword_100011708 != -1)
      swift_once(&qword_100011708, sub_100005778);
    v102 = type metadata accessor for Logger(0);
    sub_1000046F0(v102, (uint64_t)qword_100011B90);
    v103 = v101;
    v104 = Logger.logObject.getter(v103);
    v105 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v104, v105))
    {
      v106 = (uint8_t *)swift_slowAlloc(12, -1);
      v107 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v106 = 138412290;
      v155 = (uint64_t)v103;
      v108 = v103;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v155, &v156);
      *v107 = v103;

      _os_log_impl((void *)&_mh_execute_header, v104, v105, "Failed to fetch managed users: %@", v106, 0xCu);
      v109 = sub_1000055B8(&qword_1000118E8);
      swift_arrayDestroy(v107, 1, v109);
      swift_slowDealloc(v107, -1, -1);
      swift_slowDealloc(v106, -1, -1);
      swift_bridgeObjectRelease(v147);

    }
    else
    {

      swift_bridgeObjectRelease(v147);
      v104 = v139;
    }

    swift_errorRelease(v158[0]);
    return;
  }
  v26 = v24;
  v27 = sub_100007660(0, &qword_100011BB8, STCoreUser_ptr);
  v28 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v26, v27);
  v29 = v25;

  if (qword_100011708 != -1)
    swift_once(&qword_100011708, sub_100005778);
  v30 = type metadata accessor for Logger(0);
  v132 = sub_1000046F0(v30, (uint64_t)qword_100011B90);
  v31 = Logger.logObject.getter(v132);
  v32 = static os_log_type_t.default.getter();
  v33 = os_log_type_enabled(v31, v32);
  v34 = v144;
  v35 = v143;
  v36 = v142;
  if (v33)
  {
    v37 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v37 = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "Successfully fetched managed users.", v37, 2u);
    swift_slowDealloc(v37, -1, -1);
  }

  if ((unint64_t)v28 >> 62)
  {
    if (v28 < 0)
      v120 = v28;
    else
      v120 = v28 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v28);
    v38 = _CocoaArrayWrapper.endIndex.getter(v120);
    swift_bridgeObjectRelease(v28);
    if (v38)
      goto LABEL_10;
    goto LABEL_85;
  }
  v38 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v38)
  {
LABEL_85:

    swift_bridgeObjectRelease(v28);
    LOWORD(v8) = v133;
    v10 = v138;
LABEL_86:
    v121 = BYTE1(v8);
    v122 = v8 & 1;
    swift_beginAccess(v10, v157, 33, 0);
    v123 = *v10;
    v124 = v139;
    swift_bridgeObjectRetain(v147);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v123);
    *v10 = v123;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v123 = sub_10000587C(0, *((_QWORD *)v123 + 2) + 1, 1, v123);
      *v138 = v123;
    }
    v127 = *((_QWORD *)v123 + 2);
    v126 = *((_QWORD *)v123 + 3);
    if (v127 >= v126 >> 1)
    {
      v123 = sub_10000587C((char *)(v126 > 1), v127 + 1, 1, v123);
      *v138 = v123;
    }
    *((_QWORD *)v123 + 2) = v127 + 1;
    v128 = &v123[32 * v127];
    v129 = v137;
    *((_QWORD *)v128 + 4) = v124;
    *((_QWORD *)v128 + 5) = v129;
    v130 = v147;
    *((_QWORD *)v128 + 6) = v147;
    v128[56] = v122;
    v128[57] = v121 & 1;
    swift_endAccess(v157);
    swift_bridgeObjectRelease(v130);

    return;
  }
LABEL_10:
  v39 = 0;
  v146 = v28 & 0xC000000000000001;
  v135 = v28 & 0xFFFFFFFFFFFFFF8;
  v134 = v28 + 32;
  v152 = (char *)&type metadata for Swift.AnyObject + 8;
  v140 = v28;
  v145 = v38;
  while (1)
  {
    if (v146)
    {
      v41 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v39, v28);
    }
    else
    {
      if (v39 >= *(_QWORD *)(v135 + 16))
        goto LABEL_79;
      v41 = *(id *)(v134 + 8 * v39);
    }
    v42 = v41;
    v43 = __OFADD__(v39, 1);
    v44 = v39 + 1;
    if (v43)
      goto LABEL_78;
    v151 = v44;
    v45 = objc_msgSend(v41, "givenName");
    if (!v45)
    {
      swift_bridgeObjectRelease(v28);
      v110 = objc_msgSend(v42, "dsid");
      v111 = objc_msgSend(v110, "stringValue");

      v112 = static String._unconditionallyBridgeFromObjectiveC(_:)(v111);
      v114 = v113;

      v115 = swift_bridgeObjectRetain(v114);
      v116 = Logger.logObject.getter(v115);
      v117 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v116, v117))
      {
        v118 = (uint8_t *)swift_slowAlloc(12, -1);
        v119 = swift_slowAlloc(32, -1);
        v157[0] = v119;
        *(_DWORD *)v118 = 136380675;
        swift_bridgeObjectRetain(v114);
        v155 = sub_100005988(v112, v114, v157);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v155, &v156);
        swift_bridgeObjectRelease_n(v114, 3);
        _os_log_impl((void *)&_mh_execute_header, v116, v117, "Failed to fetch given name for remote user with dsid: %{private}s", v118, 0xCu);
        swift_arrayDestroy(v119, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v119, -1, -1);
        swift_slowDealloc(v118, -1, -1);
        swift_bridgeObjectRelease(v147);

      }
      else
      {

        swift_bridgeObjectRelease(v147);
        swift_bridgeObjectRelease_n(v114, 2);
      }

      return;
    }
    v46 = v45;
    v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v45);
    v49 = v48;

    PersonNameComponents.init()();
    PersonNameComponents.givenName.setter(v47, v49);
    v50 = objc_msgSend(v42, "familyName");
    if (v50)
    {
      v51 = v50;
      v52 = static String._unconditionallyBridgeFromObjectiveC(_:)(v50);
      v54 = v53;

      PersonNameComponents.familyName.setter(v52, v54);
    }
    v55 = PersonNameComponents.formatted()();
    v56 = objc_msgSend(v42, "userDeviceStates");
    if (v56)
      break;
    swift_bridgeObjectRelease(v55._object);

LABEL_12:
    v40 = v145;
    (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v34);
    v39 = v151;
    if (v151 == v40)
      goto LABEL_85;
  }
  v57 = v56;
  countAndFlagsBits = v55._countAndFlagsBits;
  object = v55._object;
  v150 = v42;
  v58 = sub_100007660(0, &qword_100011BE8, STUserDeviceState_ptr);
  v59 = sub_100007698(&qword_100011BF0, &qword_100011BE8, STUserDeviceState_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v60 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v57, v58, v59);

  v153 = v58;
  if ((v60 & 0xC000000000000001) != 0)
  {
    if (v60 < 0)
      v62 = v60;
    else
      v62 = v60 & 0xFFFFFFFFFFFFFF8;
    v63 = __CocoaSet.makeIterator()(v62);
    v61 = Set.Iterator.init(_cocoa:)(v158, v63, v58, v59);
    v60 = (uint64_t)v158[0];
    v154 = (os_log_t)v158[1];
    v64 = (uint64_t)v158[2];
    v65 = v158[3];
    v66 = (unint64_t)v158[4];
  }
  else
  {
    v65 = 0;
    v67 = -1 << *(_BYTE *)(v60 + 32);
    v68 = *(_QWORD *)(v60 + 56);
    v154 = (os_log_t)(v60 + 56);
    v64 = ~v67;
    v69 = -v67;
    if (v69 < 64)
      v70 = ~(-1 << v69);
    else
      v70 = -1;
    v66 = v70 & v68;
  }
  v148 = v64;
  v71 = (unint64_t)(v64 + 64) >> 6;
  if (v60 < 0)
    goto LABEL_34;
LABEL_32:
  if (v66)
  {
    v72 = (v66 - 1) & v66;
    v73 = __clz(__rbit64(v66)) | ((_QWORD)v65 << 6);
    v74 = (char *)v65;
    goto LABEL_51;
  }
  v79 = (int64_t)v65 + 1;
  if (!__OFADD__(v65, 1))
  {
    if (v79 >= v71)
      goto LABEL_61;
    isa = (unint64_t)v154[v79].isa;
    v74 = (char *)v65 + 1;
    if (!isa)
    {
      v74 = (char *)v65 + 2;
      if ((uint64_t)v65 + 2 >= v71)
        goto LABEL_61;
      isa = (unint64_t)v154[(_QWORD)v74].isa;
      if (!isa)
      {
        v74 = (char *)v65 + 3;
        if ((uint64_t)v65 + 3 >= v71)
          goto LABEL_61;
        isa = (unint64_t)v154[(_QWORD)v74].isa;
        if (!isa)
        {
          v74 = (char *)v65 + 4;
          if ((uint64_t)v65 + 4 >= v71)
            goto LABEL_61;
          isa = (unint64_t)v154[(_QWORD)v74].isa;
          if (!isa)
          {
            v81 = (char *)v65 + 5;
            while ((char *)v71 != v81)
            {
              isa = (unint64_t)v154[(_QWORD)v81++].isa;
              if (isa)
              {
                v74 = v81 - 1;
                goto LABEL_50;
              }
            }
            goto LABEL_61;
          }
        }
      }
    }
LABEL_50:
    v72 = (isa - 1) & isa;
    v73 = __clz(__rbit64(isa)) + ((_QWORD)v74 << 6);
LABEL_51:
    v78 = *(id *)(*(_QWORD *)(v60 + 48) + 8 * v73);
    if (v78)
    {
      while (1)
      {
        v82 = objc_msgSend(v78, "device");
        if (!v82)
          __break(1u);
        v83 = v82;
        v84 = objc_msgSend(v82, "platform");

        if (v84 != 4)
          break;

        v65 = v74;
        v66 = v72;
        if ((v60 & 0x8000000000000000) == 0)
          goto LABEL_32;
LABEL_34:
        v75 = __CocoaSet.Iterator.next()(v61);
        if (v75)
        {
          v77 = v75;
          v155 = v75;
          swift_unknownObjectRetain(v75, v76);
          swift_dynamicCast(v157, &v155, v152, v153, 7);
          v78 = (id)v157[0];
          swift_unknownObjectRelease(v77);
          v74 = (char *)v65;
          v72 = v66;
          if (v78)
            continue;
        }
        goto LABEL_61;
      }
      v85 = objc_msgSend(v150, "dsid");
      v86 = v138;
      swift_beginAccess(v138, v157, 33, 0);
      v87 = *v86;
      v88 = swift_isUniquelyReferenced_nonNull_native(*v86);
      *v86 = v87;
      if ((v88 & 1) == 0)
      {
        v87 = sub_10000587C(0, *((_QWORD *)v87 + 2) + 1, 1, v87);
        *v86 = v87;
      }
      v90 = *((_QWORD *)v87 + 2);
      v89 = *((_QWORD *)v87 + 3);
      if (v90 >= v89 >> 1)
      {
        v87 = sub_10000587C((char *)(v89 > 1), v90 + 1, 1, v87);
        *v138 = v87;
      }
      *((_QWORD *)v87 + 2) = v90 + 1;
      v91 = &v87[32 * v90];
      v92 = countAndFlagsBits;
      *((_QWORD *)v91 + 4) = v85;
      *((_QWORD *)v91 + 5) = v92;
      *((_QWORD *)v91 + 6) = object;
      *((_WORD *)v91 + 28) = 256;
      swift_endAccess(v157);

LABEL_62:
      sub_1000076D8(v60);
      v34 = v144;
      v35 = v143;
      v36 = v142;
      v28 = v140;
      goto LABEL_12;
    }
LABEL_61:
    swift_bridgeObjectRelease(object);
    goto LABEL_62;
  }
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  __break(1u);
LABEL_80:
  swift_once(&qword_100011708, sub_100005778);
LABEL_64:
  v93 = type metadata accessor for Logger(0);
  v94 = sub_1000046F0(v93, (uint64_t)qword_100011B90);
  v154 = (os_log_t)Logger.logObject.getter(v94);
  v95 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v154, v95))
  {
    v96 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v96 = 0;
    _os_log_impl((void *)&_mh_execute_header, v154, v95, "couldn't fetch local user", v96, 2u);
    swift_slowDealloc(v96, -1, -1);
  }

}

unint64_t sub_10000761C()
{
  unint64_t result;

  result = qword_100011BD0;
  if (!qword_100011BD0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100011BD0);
  }
  return result;
}

uint64_t sub_100007660(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_100007698(unint64_t *a1, unint64_t *a2, _QWORD *a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_100007660(255, a2, a3);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000076D8(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000076E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for UserDetail(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for UserDetail(uint64_t a1)
{

  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
}

uint64_t initializeWithCopy for UserDetail(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v5;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  v6 = v3;
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t assignWithCopy for UserDetail(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

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
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  return a1;
}

__n128 initializeWithTake for UserDetail(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 10) = *(_OWORD *)(a2 + 10);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for UserDetail(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease(v6);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserDetail(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 26))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UserDetail(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_WORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 26) = 1;
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
    *(_BYTE *)(result + 26) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UserDetail()
{
  return &type metadata for UserDetail;
}

uint64_t sub_100007930()
{
  _QWORD *v0;

  sub_1000047BC(v0 + 2);
  sub_1000047BC(v0 + 9);
  sub_1000047BC(v0 + 14);
  return swift_deallocClassInstance(v0, 152, 7);
}

uint64_t type metadata accessor for DeviceActivityUsageProvider()
{
  return objc_opt_self(_TtC32ScreenTimeWidgetIntentsExtension27DeviceActivityUsageProvider);
}

id STSelectUserIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id STSelectUserIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for STSelectUserIntent();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for STSelectUserIntent()
{
  return objc_opt_self(STSelectUserIntent);
}

id STUser.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithCoder:", a1);

  return v3;
}

id STSelectUserIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for STSelectUserIntent();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id STSelectUserIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  NSString v7;
  id v8;

  v4 = v3;
  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(objc_allocWithZone(v4), "initWithIdentifier:backingStore:", v7, a3);

  return v8;
}

id STSelectUserIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  NSString v6;
  id v7;
  objc_super v9;

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
  v9.super_class = (Class)type metadata accessor for STSelectUserIntent();
  v7 = objc_msgSendSuper2(&v9, "initWithIdentifier:backingStore:", v6, a3);

  return v7;
}

id STSelectUserIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  NSString v9;
  NSString v10;
  NSDictionary v11;
  id v12;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a5)
  {
    v11.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a5);
  }
  else
  {
    v11.super.isa = 0;
  }
  v12 = objc_msgSend(objc_allocWithZone(v5), "initWithDomain:verb:parametersByName:", v9, v10, v11.super.isa);

  return v12;
}

id STSelectUserIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  NSString v9;
  NSString v10;
  NSDictionary v11;
  id v12;
  objc_super v14;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a5)
  {
    v11.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a5);
  }
  else
  {
    v11.super.isa = 0;
  }
  v14.receiver = v5;
  v14.super_class = (Class)type metadata accessor for STSelectUserIntent();
  v12 = objc_msgSendSuper2(&v14, "initWithDomain:verb:parametersByName:", v9, v10, v11.super.isa);

  return v12;
}

id STSelectUserIntent.__deallocating_deinit()
{
  return sub_100008678(type metadata accessor for STSelectUserIntent);
}

unint64_t STSelectUserIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_1000086A8(a1);
}

BOOL sub_100007F8C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100007FA0()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100007FE4()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000800C(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_10000804C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_1000086A8(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_10000807C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t STSelectUserIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR___STSelectUserIntentResponse_code;
  swift_beginAccess(v0 + OBJC_IVAR___STSelectUserIntentResponse_code, v3, 0, 0);
  return *(_QWORD *)v1;
}

char *STSelectUserIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), "init");
  v6 = &v5[OBJC_IVAR___STSelectUserIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___STSelectUserIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

char *STSelectUserIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(v2, "init");
  v6 = &v5[OBJC_IVAR___STSelectUserIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___STSelectUserIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

id STSelectUserIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___STSelectUserIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for STSelectUserIntentResponse();
  return objc_msgSendSuper2(&v2, "init");
}

id STSelectUserIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___STSelectUserIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for STSelectUserIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id STSelectUserIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithBackingStore:", a1);

  return v3;
}

id STSelectUserIntentResponse.init(backingStore:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___STSelectUserIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for STSelectUserIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithBackingStore:", a1);

  return v3;
}

id sub_10000849C(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  objc_super v7;

  *(_QWORD *)&a1[OBJC_IVAR___STSelectUserIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for STSelectUserIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id STSelectUserIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  objc_class *v1;
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
  v4 = objc_msgSend(objc_allocWithZone(v1), "initWithPropertiesByName:", v3.super.isa);

  return v4;
}

id STSelectUserIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  NSDictionary v3;
  id v4;
  objc_super v6;

  *(_QWORD *)&v1[OBJC_IVAR___STSelectUserIntentResponse_code] = 0;
  if (a1)
  {
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3.super.isa = 0;
  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for STSelectUserIntentResponse();
  v4 = objc_msgSendSuper2(&v6, "initWithPropertiesByName:", v3.super.isa);

  if (v4)
  return v4;
}

id STSelectUserIntentResponse.__deallocating_deinit()
{
  return sub_100008678(type metadata accessor for STSelectUserIntentResponse);
}

id sub_100008678(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

unint64_t sub_1000086A8(unint64_t result)
{
  if (result > 6)
    return 0;
  return result;
}

uint64_t type metadata accessor for STSelectUserIntentResponse()
{
  return objc_opt_self(STSelectUserIntentResponse);
}

unint64_t sub_1000086DC()
{
  unint64_t result;

  result = qword_100011DC8;
  if (!qword_100011DC8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for STSelectUserIntentResponseCode, &type metadata for STSelectUserIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_100011DC8);
  }
  return result;
}

uint64_t sub_100008720@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___STSelectUserIntentResponse_code);
  result = swift_beginAccess(v3, v5, 0, 0);
  *a2 = *v3;
  return result;
}

uint64_t sub_100008770(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___STSelectUserIntentResponse_code);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for STSelectUserIntentResponseCode()
{
  return &type metadata for STSelectUserIntentResponseCode;
}

uint64_t static STUser.supportsSecureCoding.getter()
{
  return 1;
}

id STUser.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  NSString v10;
  NSString v11;
  NSString v12;
  id v13;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a6)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(objc_allocWithZone(v6), "initWithIdentifier:displayString:pronunciationHint:", v10, v11, v12);

  return v13;
}

id STUser.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  NSString v10;
  NSString v11;
  NSString v12;
  id v13;
  objc_super v15;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a6)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v6;
  v15.super_class = (Class)type metadata accessor for STUser();
  v13 = objc_msgSendSuper2(&v15, "initWithIdentifier:displayString:pronunciationHint:", v10, v11, v12);

  return v13;
}

uint64_t type metadata accessor for STUser()
{
  return objc_opt_self(STUser);
}

id STUser.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for STUser();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id STUser.__deallocating_deinit()
{
  return sub_100008678(type metadata accessor for STUser);
}

id static STUserResolutionResult.success(with:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v4;

  v4.receiver = (id)swift_getObjCClassFromMetadata(v1);
  v4.super_class = (Class)&OBJC_METACLASS___STUserResolutionResult;
  return objc_msgSendSuper2(&v4, "successWithResolvedObject:", a1);
}

id static STUserResolutionResult.disambiguation(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *ObjCClassFromMetadata;
  Class isa;
  id v7;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  objc_super v12;

  v2 = v1;
  v3 = a1;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v9 = a1;
    else
      v9 = a1 & 0xFFFFFFFFFFFFFF8;
    v10 = sub_100008C64();
    swift_bridgeObjectRetain(v3);
    v11 = _bridgeCocoaArray<A>(_:)(v9, v10);
    swift_bridgeObjectRelease(v3);
    v3 = v11;
  }
  else
  {
    v4 = swift_bridgeObjectRetain(a1);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v4);
    sub_100008C64();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v2);
  sub_100008C64();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  v12.receiver = ObjCClassFromMetadata;
  v12.super_class = (Class)&OBJC_METACLASS___STUserResolutionResult;
  v7 = objc_msgSendSuper2(&v12, "disambiguationWithObjectsToDisambiguate:", isa);

  return v7;
}

unint64_t sub_100008C64()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100011E48;
  if (!qword_100011E48)
  {
    v1 = objc_opt_self(INObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100011E48);
  }
  return result;
}

id static STUserResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v4;

  v4.receiver = (id)swift_getObjCClassFromMetadata(v1);
  v4.super_class = (Class)&OBJC_METACLASS___STUserResolutionResult;
  return objc_msgSendSuper2(&v4, "confirmationRequiredWithObjectToConfirm:", a1);
}

void static STUserResolutionResult.success(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "ScreenTimeWidgetIntentsExtension/STUser.swift", 45, 2, 47, 0);
  __break(1u);
}

void static STUserResolutionResult.disambiguation(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "ScreenTimeWidgetIntentsExtension/STUser.swift", 45, 2, 52, 0);
  __break(1u);
}

void static STUserResolutionResult.confirmationRequired(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "ScreenTimeWidgetIntentsExtension/STUser.swift", 45, 2, 57, 0);
  __break(1u);
}

id STUserResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v5;
  Class isa;
  id v7;

  v5 = objc_allocWithZone(v2);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v7 = objc_msgSend(v5, "initWithJSONDictionary:forIntent:", isa, a2);

  return v7;
}

id STUserResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  Class isa;
  id v6;
  id v7;
  objc_super v9;

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for STUserResolutionResult();
  v6 = objc_msgSendSuper2(&v9, "initWithJSONDictionary:forIntent:", isa, a2);

  v7 = v6;
  if (v7)

  return v7;
}

uint64_t type metadata accessor for STUserResolutionResult()
{
  return objc_opt_self(STUserResolutionResult);
}

id STUserResolutionResult.__deallocating_deinit()
{
  return sub_100008678(type metadata accessor for STUserResolutionResult);
}
