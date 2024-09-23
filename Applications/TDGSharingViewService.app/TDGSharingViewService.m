uint64_t sub_100005BA8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100005BD4(uint64_t a1)
{
  NSString v2;
  id v3;
  Class isa;
  Class v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  NSString v12;
  id v13;
  double v14;
  uint64_t v15;

  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend((id)objc_opt_self(CABasicAnimation), "animationWithKeyPath:", v2);

  isa = Int._bridgeToObjectiveC()().super.super.isa;
  objc_msgSend(v3, "setFromValue:", isa);

  v5 = Int._bridgeToObjectiveC()().super.super.isa;
  objc_msgSend(v3, "setToValue:", v5);

  objc_msgSend(v3, "setDuration:", 0.8);
  if (!((unint64_t)a1 >> 62))
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(a1);
    if (v6)
      goto LABEL_3;
LABEL_13:

    return swift_bridgeObjectRelease(a1);
  }
  if (a1 < 0)
    v15 = a1;
  else
    v15 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a1);
  result = _CocoaArrayWrapper.endIndex.getter(v15);
  v6 = result;
  if (!result)
    goto LABEL_13;
LABEL_3:
  if (v6 >= 1)
  {
    v8 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8, a1);
      else
        v9 = *(id *)(a1 + 8 * v8 + 32);
      v10 = v9;
      ++v8;
      v11 = objc_msgSend(v9, "layer");
      v12 = String._bridgeToObjectiveC()();
      objc_msgSend(v11, "addAnimation:forKey:", v3, v12);

      v13 = objc_msgSend(v10, "layer");
      LODWORD(v14) = 1.0;
      objc_msgSend(v13, "setOpacity:", v14);

    }
    while (v6 != v8);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_100005DCC(uint64_t a1)
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

uint64_t sub_100005DF8(uint64_t a1)
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
    result = sub_1000062F8(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
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

uint64_t ProxCardLayoutCache.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t HeroAssetManager.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t variable initialization expression of ProxCardLayoutCache.extendedHeightDisplayedContentSize()
{
  return 0;
}

uint64_t type metadata accessor for HeroAssetManager()
{
  return objc_opt_self(_TtC21TDGSharingViewService16HeroAssetManager);
}

__n128 initializeWithTake for AppleIDAccountRenewalActionHandler(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100006008(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100006028(uint64_t result, int a2, int a3)
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
  sub_100006DD8(a1, &qword_100041F68, (uint64_t)&unk_100039110);
}

void sub_100006064(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_10000606C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_100006080(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_1000060B0(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_1000060C4(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

BOOL sub_1000060D8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

BOOL sub_1000060EC(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_100006100(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

NSNumber sub_100006114()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_10000611C(uint64_t a1, uint64_t a2)
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

uint64_t sub_10000616C(uint64_t a1, uint64_t a2)
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

uint64_t sub_1000061C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static Int._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  return result;
}

BOOL sub_1000061E4(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void sub_1000061F8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_100006204@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_100006210(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_10000621C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_10000622C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100006E48(&qword_100042038, (uint64_t (*)(uint64_t))type metadata accessor for UIBackgroundTaskIdentifier, (uint64_t)&unk_10002ACA4);
  v3 = sub_100006E48((unint64_t *)&unk_100042040, (uint64_t (*)(uint64_t))type metadata accessor for UIBackgroundTaskIdentifier, (uint64_t)&unk_10002AC44);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for Int);
}

uint64_t sub_1000062C0()
{
  _QWORD *v0;

  return Int.hashValue.getter(*v0);
}

void sub_1000062C8()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

uint64_t sub_1000062F0(uint64_t a1)
{
  _QWORD *v1;

  return static Hasher._hash(seed:_:)(a1, *v1);
}

uint64_t sub_1000062F8(unint64_t a1, uint64_t a2, uint64_t a3)
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
        sub_100006D5C(&qword_100042000, &qword_100041FF8, (uint64_t)&protocol conformance descriptor for [A]);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_100006CA0(&qword_100041FF8);
          v15 = sub_100006514(v20, i, a3);
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
    v11 = sub_100006D24(0, &qword_100041FF0, UIView_ptr);
    swift_arrayInitWithCopy(a1, v10, v9, v11);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

void (*sub_100006514(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_100006594(v6, a2, a3);
  return sub_100006568;
}

void sub_100006568(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_100006594(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
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
    return sub_100006600;
  }
  __break(1u);
  return result;
}

void sub_100006600(id *a1)
{

}

void sub_100006608(void *a1)
{
  id v2;
  id v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v2 = objc_msgSend(a1, "contentView");
  v3 = objc_msgSend(v2, "titleView");

  if (v3)
  {
    v4 = v3;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v6 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
    v5 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v6 >= v5 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v5 > 1, v6 + 1, 1);
    v7 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v6, v4);
    specialized Array._endMutation()(v7);

  }
  v8 = objc_msgSend(a1, "contentView");
  v9 = objc_msgSend(v8, "auxiliaryViews");

  if (v9)
  {
    v10 = sub_100006D24(0, &qword_100041FF0, UIView_ptr);
    v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);

    sub_100005DF8(v11);
    v12 = objc_msgSend(a1, "contentView");
    v13 = objc_msgSend(v12, "dismissButton");

    if (v13)
    {
      v14 = v13;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v16 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
      v15 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v16 >= v15 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v15 > 1, v16 + 1, 1);
      v17 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v16, v14);
      specialized Array._endMutation()(v17);

    }
  }
  else
  {
    __break(1u);
  }
}

void sub_1000067E8(void *a1, unsigned __int8 a2)
{
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
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  void *v30;
  char *v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  os_log_t v46;
  void *v47;
  _QWORD aBlock[5];
  uint64_t v49;

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchTime(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v42 - v12;
  type metadata accessor for AssetLoader();
  v14 = sub_10001E2B8();
  if (!v14)
  {
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v25 = type metadata accessor for Logger(0);
    v26 = sub_100006C44(v25, (uint64_t)qword_100044E40);
    v46 = (os_log_t)Logger.logObject.getter(v26);
    v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v46, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, v27, "Unable to load video asset!", v28, 2u);
      swift_slowDealloc(v28, -1, -1);
    }
    goto LABEL_15;
  }
  v15 = v14;
  v44 = v4;
  v45 = v6;
  v46 = (os_log_t)v14;
  v16 = sub_100008D48(v15, (a2 ^ 1) & 1);
  sub_100007598(v16, (uint64_t)v15, (a2 ^ 1) & 1, 0, 2);

  if (((a2 ^ 1) & 1) != 0)
  {
LABEL_15:

    return;
  }
  v42 = v13;
  v43 = v7;
  sub_100006608(a1);
  v18 = v17;
  if (!((unint64_t)v17 >> 62))
  {
    v19 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v17);
    if (v19)
      goto LABEL_5;
LABEL_20:
    swift_bridgeObjectRelease(v18);
    sub_100006D24(0, (unint64_t *)&qword_100041FD0, OS_dispatch_queue_ptr);
    v30 = (void *)static OS_dispatch_queue.main.getter();
    static DispatchTime.now()();
    v31 = v42;
    + infix(_:_:)(v11, 2.75);
    v32 = *(void (**)(char *, uint64_t))(v8 + 8);
    v33 = v43;
    v32(v11, v43);
    v34 = swift_allocObject(&unk_100039138, 24, 7);
    *(_QWORD *)(v34 + 16) = v18;
    aBlock[4] = sub_100006C80;
    v49 = v34;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100005DCC;
    aBlock[3] = &unk_100039150;
    v35 = _Block_copy(aBlock);
    v47 = &_swiftEmptyArrayStorage;
    v36 = sub_100006E48((unint64_t *)&qword_100042630, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v37 = sub_100006CA0((uint64_t *)&unk_100041FE0);
    v38 = sub_100006D5C((unint64_t *)&qword_100042640, (uint64_t *)&unk_100041FE0, (uint64_t)&protocol conformance descriptor for [A]);
    v39 = v45;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v47, v37, v38, v44, v36);
    v40 = type metadata accessor for DispatchWorkItem(0);
    swift_allocObject(v40, *(unsigned int *)(v40 + 48), *(unsigned __int16 *)(v40 + 52));
    v41 = DispatchWorkItem.init(flags:block:)(v39, v35);
    swift_release(v49);
    OS_dispatch_queue.asyncAfter(deadline:execute:)(v31, v41);

    swift_release(v41);
    v32(v31, v33);
    return;
  }
  if (v17 < 0)
    v29 = v17;
  else
    v29 = v17 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v17);
  v19 = _CocoaArrayWrapper.endIndex.getter(v29);
  if (!v19)
    goto LABEL_20;
LABEL_5:
  if (v19 >= 1)
  {
    v20 = 0;
    do
    {
      if ((v18 & 0xC000000000000001) != 0)
        v21 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v20, v18);
      else
        v21 = *(id *)(v18 + 8 * v20 + 32);
      v22 = v21;
      ++v20;
      v23 = objc_msgSend(v21, "layer");
      LODWORD(v24) = 0;
      objc_msgSend(v23, "setOpacity:", v24);

    }
    while (v19 != v20);
    goto LABEL_20;
  }
  __break(1u);
}

uint64_t sub_100006C44(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100006C5C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006C80()
{
  uint64_t v0;

  return sub_100005BD4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100006C88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100006C98(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100006CA0(uint64_t *a1)
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

uint64_t sub_100006CE0(uint64_t *a1)
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

uint64_t sub_100006D24(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_100006D5C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100006CE0(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for WFSetupClientUserInteractionProgressEvent(uint64_t a1)
{
  sub_100006DD8(a1, &qword_100042008, (uint64_t)&unk_100039188);
}

void type metadata accessor for CFError(uint64_t a1)
{
  sub_100006DD8(a1, &qword_100042010, (uint64_t)&unk_1000391A8);
}

void type metadata accessor for UIBackgroundTaskIdentifier(uint64_t a1)
{
  sub_100006DD8(a1, &qword_100042018, (uint64_t)&unk_1000391D8);
}

void sub_100006DD8(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_100006E1C()
{
  return sub_100006E48(&qword_100042020, (uint64_t (*)(uint64_t))type metadata accessor for UIBackgroundTaskIdentifier, (uint64_t)&unk_10002AC08);
}

uint64_t sub_100006E48(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100006E88()
{
  return sub_100006E48(&qword_100042028, (uint64_t (*)(uint64_t))type metadata accessor for UIBackgroundTaskIdentifier, (uint64_t)&unk_10002ABDC);
}

uint64_t sub_100006EB4()
{
  return sub_100006E48(&qword_100042030, (uint64_t (*)(uint64_t))type metadata accessor for UIBackgroundTaskIdentifier, (uint64_t)&unk_10002AC78);
}

uint64_t sub_100006EFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v1 = v0;
  v2 = sub_100006CA0(&qword_100042170);
  __chkstk_darwin(v2);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v5 = type metadata accessor for Logger(0);
  v6 = sub_100006C44(v5, (uint64_t)qword_100044E40);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Redirecting user to Settings to upgrade account", v9, 2u);
    swift_slowDealloc(v9, -1, -1);
  }

  URL.init(string:)(0xD000000000000036, 0x800000010002E770);
  v10 = sub_10000B9BC((uint64_t)v4);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Successfully launched the Settings app to guide the user to upgrade their iCloud account. ", v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

  v14 = *(_QWORD *)(v1 + 16);
  LOBYTE(v17) = 2;
  swift_retain(v14);
  PassthroughSubject.send(_:)(&v17);
  swift_release(v14);
  return sub_1000072A4((uint64_t)v4);
}

uint64_t sub_100007260()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for AppleIDAccountUpgradeActionHandler()
{
  return objc_opt_self(_TtC21TDGSharingViewService34AppleIDAccountUpgradeActionHandler);
}

uint64_t sub_1000072A4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006CA0(&qword_100042170);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_BYTE *initializeBufferWithCopyOfBuffer for CompletionStatus(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for VisualPairingAppClipCodeGenerationError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for VisualPairingAppClipCodeGenerationError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_1000073CC + 4 * byte_10002ADA5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_100007400 + 4 * asc_10002ADA0[v4]))();
}

uint64_t sub_100007400(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100007408(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100007410);
  return result;
}

uint64_t sub_10000741C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100007424);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_100007428(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100007430(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000743C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100007448(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for VisualPairingAppClipCodeGenerationError()
{
  return &type metadata for VisualPairingAppClipCodeGenerationError;
}

unint64_t sub_100007464()
{
  unint64_t result;

  result = qword_100042180;
  if (!qword_100042180)
  {
    result = swift_getWitnessTable(&unk_10002AE38, &type metadata for VisualPairingAppClipCodeGenerationError);
    atomic_store(result, (unint64_t *)&qword_100042180);
  }
  return result;
}

BOOL sub_1000074A8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000074BC()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100007500()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100007528(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t type metadata accessor for AccessorySetupActionHandler()
{
  return objc_opt_self(_TtC21TDGSharingViewService27AccessorySetupActionHandler);
}

void sub_100007598(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  void *v5;
  void *v6;
  id v9;
  id v10;

  v6 = v5;
  objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = objc_msgSend(v6, "contentView");
  objc_msgSend(v9, "addSubview:", a1);

  v10 = objc_msgSend(v6, "contentView");
  objc_msgSend(v10, "mainContentGuide");

  __asm { BR              X10 }
}

void sub_100007658(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
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
  Class isa;
  void *v41;

  v25 = (void *)objc_opt_self(NSLayoutConstraint);
  v26 = sub_100006CA0(&qword_100042258);
  v27 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))swift_allocObject)(v26, 64, 7);
  *(_OWORD *)(v27 + 16) = xmmword_10002AF00;
  v28 = objc_msgSend(v24, "centerYAnchor");
  v29 = objc_msgSend(v41, "centerYAnchor");
  v30 = objc_msgSend(v28, "constraintEqualToAnchor:", v29);

  *(_QWORD *)(v27 + 32) = v30;
  v31 = objc_msgSend(v24, "centerXAnchor");
  v32 = objc_msgSend(v41, "centerXAnchor");
  v33 = objc_msgSend(v31, "constraintEqualToAnchor:", v32);

  *(_QWORD *)(v27 + 40) = v33;
  v34 = objc_msgSend(v24, "widthAnchor");
  v35 = objc_msgSend(v41, "widthAnchor");
  v36 = objc_msgSend(v34, "constraintLessThanOrEqualToAnchor:", v35);

  *(_QWORD *)(v27 + 48) = v36;
  v37 = objc_msgSend(v24, "heightAnchor");
  v38 = objc_msgSend(v41, "heightAnchor");
  v39 = objc_msgSend(v37, "constraintLessThanOrEqualToAnchor:", v38);

  *(_QWORD *)(v27 + 56) = v39;
  ((void (*)(void))specialized Array._endMutation())();
  sub_100006D24(0, &qword_100042260, NSLayoutConstraint_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v27);
  objc_msgSend(v25, "activateConstraints:", isa);

}

Swift::Bool __swiftcall PRXCardContainerViewController._canShowWhileLocked()()
{
  return 1;
}

void sub_1000085CC()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  Swift::String v5;
  Swift::String_optional v6;
  Swift::String v7;
  void *object;
  Swift::String v9;
  Swift::String_optional v10;
  Swift::String v11;
  void *v12;
  id v13;
  Swift::String v14;
  Swift::String_optional v15;
  Swift::String v16;
  void *v17;
  NSString v18;
  NSString v19;
  id v20;
  Swift::String v21;
  Swift::String_optional v22;
  Swift::String v23;
  void *v24;
  NSString v25;
  id v26;
  Swift::String v27;
  Swift::String_optional v28;
  Swift::String v29;
  void *v30;
  NSString v31;
  id v32;
  Swift::String v33;
  Swift::String v34;
  Swift::String v35;
  Swift::String v36;
  Swift::String v37;

  if ((sub_100019278() - 1) > 1u)
  {
    v4 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v9._countAndFlagsBits = 0xD000000000000020;
    v34._object = (void *)0xE000000000000000;
    v9._object = (void *)0x800000010002E880;
    v10.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v10.value._object = (void *)0xEB00000000656C62;
    v11._countAndFlagsBits = 0;
    v11._object = (void *)0xE000000000000000;
    v34._countAndFlagsBits = 0;
    object = NSLocalizedString(_:tableName:bundle:value:comment:)(v9, v10, (NSBundle)v4, v11, v34)._object;
  }
  else
  {
    v1 = String.appleAccountRebrandStringKey.getter(0xD000000000000018, 0x800000010002E920);
    v3 = v2;
    v4 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v33._object = (void *)0xE000000000000000;
    v5._countAndFlagsBits = v1;
    v5._object = v3;
    v6.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v6.value._object = (void *)0xEB00000000656C62;
    v7._countAndFlagsBits = 0;
    v7._object = (void *)0xE000000000000000;
    v33._countAndFlagsBits = 0;
    object = NSLocalizedString(_:tableName:bundle:value:comment:)(v5, v6, (NSBundle)v4, v7, v33)._object;
    swift_bridgeObjectRelease(v3);
  }

  v12 = (void *)objc_opt_self(NSBundle);
  v13 = objc_msgSend(v12, "mainBundle");
  v35._object = (void *)0xE000000000000000;
  v14._object = (void *)0x800000010002E8B0;
  v14._countAndFlagsBits = 0xD000000000000016;
  v15.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v15.value._object = (void *)0xEB00000000656C62;
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  v35._countAndFlagsBits = 0;
  v17 = NSLocalizedString(_:tableName:bundle:value:comment:)(v14, v15, (NSBundle)v13, v16, v35)._object;

  v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v17);
  v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  v20 = objc_msgSend(v12, "mainBundle");
  v21._countAndFlagsBits = 0xD000000000000024;
  v36._object = (void *)0xE000000000000000;
  v21._object = (void *)0x800000010002E8D0;
  v22.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v22.value._object = (void *)0xEB00000000656C62;
  v23._countAndFlagsBits = 0;
  v23._object = (void *)0xE000000000000000;
  v36._countAndFlagsBits = 0;
  v24 = NSLocalizedString(_:tableName:bundle:value:comment:)(v21, v22, (NSBundle)v20, v23, v36)._object;

  v25 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v24);
  v26 = objc_msgSend(v12, "mainBundle");
  v27._countAndFlagsBits = 0xD00000000000001ELL;
  v37._object = (void *)0xE000000000000000;
  v27._object = (void *)0x800000010002E900;
  v28.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v28.value._object = (void *)0xEB00000000656C62;
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  v37._countAndFlagsBits = 0;
  v30 = NSLocalizedString(_:tableName:bundle:value:comment:)(v27, v28, (NSBundle)v26, v29, v37)._object;

  v31 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v30);
  v32 = objc_msgSend(v0, "dismissalConfirmationActionWithTitle:message:confirmButtonTitle:cancelButtonTitle:", v18, v19, v25, v31);

  objc_msgSend(v0, "setDismissButtonAction:", v32);
}

Swift::Void __swiftcall PRXCardContentViewController.VideoPlayerView.layoutSubviews()()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  double Width;
  uint64_t v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;

  v11.receiver = v0;
  v11.super_class = (Class)type metadata accessor for PRXCardContentViewController.VideoPlayerView();
  objc_msgSendSuper2(&v11, "layoutSubviews");
  v1 = objc_msgSend(v0, "layer");
  v2 = objc_msgSend(v1, "sublayers");

  if (v2)
  {
    v3 = sub_100006D24(0, &qword_100042228, CALayer_ptr);
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

    if ((unint64_t)v4 >> 62)
    {
      if (v4 < 0)
        v10 = v4;
      else
        v10 = v4 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v4);
      v5 = _CocoaArrayWrapper.endIndex.getter(v10);
      swift_bridgeObjectRelease(v4);
      if (v5)
        goto LABEL_4;
    }
    else
    {
      v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v5)
      {
LABEL_4:
        if (v5 < 1)
        {
          __break(1u);
          return;
        }
        v6 = 0;
        do
        {
          if ((v4 & 0xC000000000000001) != 0)
            v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v4);
          else
            v7 = *(id *)(v4 + 8 * v6 + 32);
          v8 = v7;
          ++v6;
          objc_msgSend(v0, "frame");
          Width = CGRectGetWidth(v12);
          objc_msgSend(v0, "frame");
          objc_msgSend(v8, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v13));

        }
        while (v5 != v6);
      }
    }
    swift_bridgeObjectRelease(v4);
  }
}

uint64_t type metadata accessor for PRXCardContentViewController.VideoPlayerView()
{
  return objc_opt_self(_TtCE21TDGSharingViewServiceCSo28PRXCardContentViewController15VideoPlayerView);
}

id PRXCardContentViewController.VideoPlayerView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), "initWithFrame:", a1, a2, a3, a4);
}

id PRXCardContentViewController.VideoPlayerView.init(frame:)(double a1, double a2, double a3, double a4)
{
  void *v4;
  objc_super v10;

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for PRXCardContentViewController.VideoPlayerView();
  return objc_msgSendSuper2(&v10, "initWithFrame:", a1, a2, a3, a4);
}

id PRXCardContentViewController.VideoPlayerView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithCoder:", a1);

  return v3;
}

id PRXCardContentViewController.VideoPlayerView.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for PRXCardContentViewController.VideoPlayerView();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id PRXCardContentViewController.VideoPlayerView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PRXCardContentViewController.VideoPlayerView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_100008D48(void *a1, char a2)
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint8_t *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  id v43;
  uint8_t *v44;
  uint8_t *v45;
  _QWORD *v46;
  char v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;

  v4 = type metadata accessor for PRXCardContentViewController.VideoPlayerView();
  v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v4)), "init");
  if (a1)
  {
    v6 = objc_allocWithZone((Class)AVPlayer);
    v7 = a1;
    v8 = objc_msgSend(v6, "initWithPlayerItem:", v7);
    v9 = objc_msgSend((id)objc_opt_self(AVPlayerLayer), "playerLayerWithPlayer:", v8);
    objc_msgSend(v9, "setVideoGravity:", AVLayerVideoGravityResizeAspectFill);
    v10 = objc_msgSend((id)objc_opt_self(AVAudioSession), "sharedInstance");
    v49 = 0;
    LODWORD(v6) = objc_msgSend(v10, "setCategory:mode:options:error:", AVAudioSessionCategoryPlayback, AVAudioSessionModeDefault, 1, &v49);

    v11 = v49;
    if ((_DWORD)v6)
    {
      v12 = v49;
    }
    else
    {
      v18 = v49;
      v19 = _convertNSErrorToError(_:)(v11);

      swift_willThrow();
      if (qword_100041E50 != -1)
        swift_once(&qword_100041E50, sub_10001A2E8);
      v20 = type metadata accessor for Logger(0);
      sub_100006C44(v20, (uint64_t)qword_100044E40);
      swift_errorRetain(v19);
      v21 = swift_errorRetain(v19);
      v22 = Logger.logObject.getter(v21);
      v23 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v22, v23))
      {
        v47 = a2;
        v24 = (uint8_t *)swift_slowAlloc(12, -1);
        v48 = v5;
        v46 = (_QWORD *)swift_slowAlloc(8, -1);
        *(_DWORD *)v24 = 138543362;
        swift_errorRetain(v19);
        v25 = v8;
        v26 = v9;
        v27 = v7;
        v28 = (void *)_swift_stdlib_bridgeErrorToNSError(v19);
        v49 = v28;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50);
        *v46 = v28;
        v7 = v27;
        v9 = v26;
        v8 = v25;
        swift_errorRelease(v19);
        swift_errorRelease(v19);
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "Failed to configure AVAudioSession due to %{public}@", v24, 0xCu);
        v29 = sub_100006CA0(&qword_100042268);
        swift_arrayDestroy(v46, 1, v29);
        v5 = v48;
        swift_slowDealloc(v46, -1, -1);
        v30 = v24;
        a2 = v47;
        swift_slowDealloc(v30, -1, -1);

        swift_errorRelease(v19);
      }
      else
      {
        swift_errorRelease(v19);
        swift_errorRelease(v19);
        swift_errorRelease(v19);

      }
    }
    v31 = objc_msgSend(v5, "layer", v46);
    objc_msgSend(v31, "addSublayer:", v9);

    if ((a2 & 1) != 0)
    {
      v32 = objc_msgSend(v8, "currentItem");
      if (v32)
      {
        v33 = v32;
        v34 = objc_msgSend(v32, "asset");

        objc_msgSend(v34, "duration");
        v35 = v49;
        v36 = v51;
        v37 = v50;

        v49 = v35;
        v50 = v37;
        v51 = v36;
        objc_msgSend(v8, "seekToTime:", &v49);
        objc_msgSend(v8, "pause");
      }
      else
      {
        if (qword_100041E50 != -1)
          swift_once(&qword_100041E50, sub_10001A2E8);
        v39 = type metadata accessor for Logger(0);
        v40 = sub_100006C44(v39, (uint64_t)qword_100044E40);
        v41 = Logger.logObject.getter(v40);
        v42 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v41, v42))
        {
          v43 = v7;
          v44 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v44 = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, v42, "Unable to find last seekable time range", v44, 2u);
          v45 = v44;
          v7 = v43;
          swift_slowDealloc(v45, -1, -1);
        }

      }
    }
    else
    {
      objc_msgSend(v8, "play");
    }
    objc_msgSend(v8, "play");

  }
  else
  {
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v13 = type metadata accessor for Logger(0);
    v14 = sub_100006C44(v13, (uint64_t)qword_100044E40);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "AVPlayerItem is nil, returning an empty video view", v17, 2u);
      swift_slowDealloc(v17, -1, -1);
    }

  }
  return v5;
}

id sub_1000092D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v5;
  id v6;
  id v7;
  id v8;

  swift_bridgeObjectRetain(a2);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v6 = objc_msgSend((id)objc_opt_self(UIImage), "_systemImageNamed:", v5);

  v7 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v6);
  objc_msgSend(v7, "setTintColor:", a3);
  v8 = objc_msgSend((id)objc_opt_self(UIImageSymbolConfiguration), "configurationWithPointSize:", 72.0);
  objc_msgSend(v7, "setPreferredSymbolConfiguration:", v8);

  return v7;
}

uint64_t destroy for AppleIDAccountRenewalActionHandler(_QWORD *a1)
{
  swift_release(*a1);
  return swift_release(a1[1]);
}

uint64_t *_s21TDGSharingViewService34AppleIDAccountRenewalActionHandlerVwCP_0(uint64_t *a1, uint64_t *a2)
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

uint64_t *assignWithCopy for AppleIDAccountRenewalActionHandler(uint64_t *a1, uint64_t *a2)
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

_QWORD *assignWithTake for AppleIDAccountRenewalActionHandler(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleIDAccountRenewalActionHandler(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppleIDAccountRenewalActionHandler(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AppleIDAccountRenewalActionHandler()
{
  return &type metadata for AppleIDAccountRenewalActionHandler;
}

uint64_t sub_10000955C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;

  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100006C44(v6, (uint64_t)qword_100044E40);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Renewing Apple ID", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  swift_retain_n(a2, 2);
  swift_retain_n(a3, 2);
  sub_1000187A4(a1, a3, a2, a3);
  swift_release(a3);
  return swift_release(a2);
}

uint64_t sub_100009678(char a1)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  char v11;
  char v12;

  if ((a1 & 1) != 0)
  {
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v1 = type metadata accessor for Logger(0);
    sub_100006C44(v1, (uint64_t)qword_100044E40);
    v2 = Logger.logObject.getter();
    v3 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Apple ID Renewal Success", v4, 2u);
      swift_slowDealloc(v4, -1, -1);
    }

    v11 = 2;
    v5 = &v11;
  }
  else
  {
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v6 = type metadata accessor for Logger(0);
    sub_100006C44(v6, (uint64_t)qword_100044E40);
    v7 = Logger.logObject.getter();
    v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Apple ID Renewal Failed", v9, 2u);
      swift_slowDealloc(v9, -1, -1);
    }

    v12 = 0;
    v5 = &v12;
  }
  return PassthroughSubject.send(_:)(v5);
}

uint64_t sub_100009814(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = sub_100009F94();
  **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v4);
  return swift_continuation_resume(v3);
}

uint64_t type metadata accessor for PrescriptionRecordProvider()
{
  return objc_opt_self(_TtC21TDGSharingViewService26PrescriptionRecordProvider);
}

uint64_t sub_100009878()
{
  uint64_t v0;
  uint64_t v1;

  v1 = type metadata accessor for Date(0);
  *(_QWORD *)(v0 + 144) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000098CC, 0, 0);
}

uint64_t sub_1000098CC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;

  if (qword_100041E68 != -1)
    swift_once(&qword_100041E68, sub_10001A490);
  v1 = type metadata accessor for Logger(0);
  v2 = sub_100006C44(v1, (uint64_t)qword_100044E88);
  v0[19] = v2;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Fetching prescription records…", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  v6 = v0 + 2;
  v7 = objc_msgSend(objc_allocWithZone((Class)WFPrescriptionRecordCollector), "initWithTimeout:", 5.0);
  v0[20] = v7;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_100009A38;
  v8 = swift_continuation_init(v0 + 2, 0);
  v0[10] = _NSConcreteStackBlock;
  v9 = v0 + 10;
  v9[1] = 0x40000000;
  v9[2] = sub_100009814;
  v9[3] = &unk_100039410;
  v9[4] = v8;
  objc_msgSend(v7, "fetchPrescriptionRecordsWithCompletion:", v9);
  return swift_continuation_await(v6);
}

uint64_t sub_100009A38()
{
  return swift_task_switch(sub_100009A84, 0, 0);
}

uint64_t sub_100009A84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  void *v46;
  uint8_t *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = swift_bridgeObjectRetain_n(v1, 2);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = (_QWORD *)swift_slowAlloc(32, -1);
    v58 = v6;
    *(_DWORD *)v5 = 136315138;
    v7 = sub_100009F94();
    v8 = Array.description.getter(v1, v7);
    v10 = v9;
    *(_QWORD *)(v0 + 136) = sub_100020FBC(v8, v9, (uint64_t *)&v58);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 136, v0 + 144);
    swift_bridgeObjectRelease(v10);
    swift_bridgeObjectRelease_n(v1, 2);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Finished fetching prescription record: %s", v5, 0xCu);
    swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(v1, 2);
  }

  if ((unint64_t)v1 >> 62)
  {
    if (v1 < 0)
      v41 = v1;
    else
      v41 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v1);
    v11 = _CocoaArrayWrapper.endIndex.getter(v41);
    swift_bridgeObjectRelease(v1);
    if (v11)
      goto LABEL_6;
LABEL_26:
    swift_bridgeObjectRelease(v1);
    v40 = &_swiftEmptyArrayStorage;
    goto LABEL_27;
  }
  v11 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v11)
    goto LABEL_26;
LABEL_6:
  v58 = &_swiftEmptyArrayStorage;
  result = specialized ContiguousArray.reserveCapacity(_:)(v11);
  if (v11 < 0)
  {
    __break(1u);
    return result;
  }
  v57 = v0;
  v13 = 0;
  v53 = v1 & 0xC000000000000001;
  v54 = v1;
  do
  {
    if (v53)
      v23 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v13, v1);
    else
      v23 = *(id *)(v1 + 8 * v13 + 32);
    v24 = v23;
    v25 = objc_msgSend(v23, "accPayload");
    v26 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v25);
    v55 = v27;
    v56 = v26;

    v28 = objc_msgSend(v24, "enrollmentName");
    if (v28)
    {
      v29 = v28;
      v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
      v32 = v31;

    }
    else
    {
      v30 = 0;
      v32 = 0;
    }
    v33 = objc_msgSend(v24, "enrollmentDate");
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    v34 = objc_msgSend(v24, "leftCalibrationData");
    if (v34)
    {
      v35 = v34;
      v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
      v38 = v37;

    }
    else
    {
      v36 = 0;
      v38 = 0;
    }
    v39 = objc_msgSend(v24, "rightCalibrationData");
    if (v39)
    {
      v14 = v39;
      v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v39);
      v17 = v16;

    }
    else
    {
      v15 = 0;
      v17 = 0;
    }
    v18 = *(_QWORD *)(v57 + 144);
    ++v13;
    v19 = objc_allocWithZone((Class)type metadata accessor for PrescriptionRecord(0));
    v20 = PrescriptionRecord.init(accPayload:enrollmentName:enrollmentDate:leftLensFactoryCalibrationData:rightLensFactoryCalibrationData:)(v56, v55, v30, v32, v18, v36, v38, v15, v17);

    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    v21 = v58[2];
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v21);
    v22 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v21, v20);
    specialized ContiguousArray._endMutation()(v22);
    v1 = v54;
  }
  while (v11 != v13);
  v40 = v58;
  swift_bridgeObjectRelease(v54);
  v0 = v57;
LABEL_27:
  v42 = swift_bridgeObjectRetain_n(v40, 2);
  v43 = Logger.logObject.getter(v42);
  v44 = static os_log_type_t.default.getter();
  v45 = os_log_type_enabled(v43, v44);
  v46 = *(void **)(v0 + 160);
  if (v45)
  {
    v47 = (uint8_t *)swift_slowAlloc(12, -1);
    v48 = (_QWORD *)swift_slowAlloc(32, -1);
    v58 = v48;
    *(_DWORD *)v47 = 136315138;
    v49 = type metadata accessor for PrescriptionRecord(0);
    v50 = Array.description.getter(v40, v49);
    v52 = v51;
    *(_QWORD *)(v0 + 128) = sub_100020FBC(v50, v51, (uint64_t *)&v58);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 128, v0 + 136);
    swift_bridgeObjectRelease(v52);
    swift_bridgeObjectRelease_n(v40, 2);
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "Generated prescription records: %s", v47, 0xCu);
    swift_arrayDestroy(v48, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v48, -1, -1);
    swift_slowDealloc(v47, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(v40, 2);
  }

  swift_task_dealloc(*(_QWORD *)(v0 + 144));
  return (*(uint64_t (**)(void *))(v0 + 8))(v40);
}

unint64_t sub_100009F94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100042318;
  if (!qword_100042318)
  {
    v1 = objc_opt_self(CRXFLitePrescriptionRecord);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100042318);
  }
  return result;
}

ValueMetadata *type metadata accessor for InteractionEventPublisher()
{
  return &type metadata for InteractionEventPublisher;
}

void sub_100009FE0(unsigned __int8 a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _BYTE v12[104];
  uint64_t v13;

  if (qword_100041E48 != -1)
    swift_once(&qword_100041E48, sub_10001A268);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100006C44(v2, (uint64_t)qword_100044E28);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v13 = v7;
    *(_DWORD *)v6 = 136446210;
    v8 = sub_100027318(a1);
    v10 = v9;
    v11 = sub_100020FBC(v8, v9, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, v12);
    swift_bridgeObjectRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Interaction event publisher asked to publish event for stageId: %{public}s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }

  __asm { BR              X10 }
}

void sub_10000A518(uint64_t a1, int16x8_t a2, uint64_t a3, uint64_t a4, unint64_t a5, unsigned __int8 a6, const char *a7)
{
  uint64_t v11;
  uint64_t v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  __CFString *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  NSObject *oslog;
  uint64_t v41;
  uint64_t v42;

  if (a1)
  {
    ((void (*)(void))swift_errorRetain)();
    if (qword_100041E48 != -1)
      swift_once(&qword_100041E48, sub_10001A268);
    v11 = type metadata accessor for Logger(0);
    sub_100006C44(v11, (uint64_t)qword_100044E28);
    swift_errorRetain(a1);
    v12 = swift_errorRetain(a1);
    oslog = Logger.logObject.getter(v12);
    v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v13))
    {
      v14 = swift_slowAlloc(32, -1);
      v15 = swift_slowAlloc(96, -1);
      v42 = v15;
      *(_DWORD *)v14 = vmovn_s16(a2).u32[0];
      v16 = sub_10000A9F4(a5);
      v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v19 = v18;

      v41 = sub_100020FBC(v17, v19, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42);
      swift_bridgeObjectRelease(v19);
      *(_WORD *)(v14 + 12) = 2082;
      v20 = sub_100027318(a6);
      v22 = v21;
      v41 = sub_100020FBC(v20, v21, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42);
      swift_bridgeObjectRelease(v22);
      *(_WORD *)(v14 + 22) = 2082;
      v41 = a1;
      swift_errorRetain(a1);
      v23 = sub_100006CA0(&qword_100042178);
      v24 = String.init<A>(describing:)(&v41, v23);
      v26 = v25;
      v41 = sub_100020FBC(v24, v25, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42);
      swift_bridgeObjectRelease(v26);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, oslog, v13, a7, (uint8_t *)v14, 0x20u);
      swift_arrayDestroy(v15, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v15, -1, -1);
      swift_slowDealloc(v14, -1, -1);

      swift_errorRelease(a1);
      return;
    }
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }
  else
  {
    if (qword_100041E48 != -1)
      swift_once(&qword_100041E48, sub_10001A268);
    v27 = type metadata accessor for Logger(0);
    v28 = sub_100006C44(v27, (uint64_t)qword_100044E28);
    oslog = Logger.logObject.getter(v28);
    v29 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v29))
    {
      v30 = swift_slowAlloc(22, -1);
      v31 = swift_slowAlloc(64, -1);
      v42 = v31;
      *(_DWORD *)v30 = 136446466;
      v32 = sub_10000A9F4(a5);
      v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v35 = v34;

      v41 = sub_100020FBC(v33, v35, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42);
      swift_bridgeObjectRelease(v35);
      *(_WORD *)(v30 + 12) = 2082;
      v36 = sub_100027318(a6);
      v38 = v37;
      v41 = sub_100020FBC(v36, v37, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42);
      swift_bridgeObjectRelease(v38);
      _os_log_impl((void *)&_mh_execute_header, oslog, v29, "Successfully published event: %{public}s for stageID: %{public}s", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy(v31, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v31, -1, -1);
      swift_slowDealloc(v30, -1, -1);

      return;
    }
  }

}

uint64_t sub_10000A95C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 25, 7);
}

uint64_t sub_10000A96C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 25, 7);
}

void sub_10000A97C(uint64_t a1, uint64_t a2, uint64_t a3, int16x8_t a4)
{
  uint64_t v4;

  a4.i64[0] = 0x8002200030002;
  sub_10000A518(a1, a4, a2, a3, *(_QWORD *)(v4 + 16), *(_BYTE *)(v4 + 24), "Failed to publish event: %{public}s for stageID: %{public}s with error: %{public}s");
}

uint64_t sub_10000A9A8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 25, 7);
}

void sub_10000A9B8(uint64_t a1, uint64_t a2, uint64_t a3, int16x8_t a4)
{
  uint64_t v4;

  a4.i64[0] = 0x8002000030002;
  sub_10000A518(a1, a4, a2, a3, *(_QWORD *)(v4 + 16), *(_BYTE *)(v4 + 24), "Failed to publish event: %s for stageID: %{public}s with error: %{public}s");
}

uint64_t sub_10000A9E4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 25, 7);
}

__CFString *sub_10000A9F4(unint64_t a1)
{
  __CFString *v1;
  __CFString *v2;

  if (a1 <= 5)
  {
    v1 = off_100039528[a1];
    v2 = off_1000394F8[a1];
  }
  return v1;
}

uint64_t type metadata accessor for FailureActionHandler()
{
  return objc_opt_self(_TtC21TDGSharingViewService20FailureActionHandler);
}

id sub_10000AB38()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntroductionUIProvider.IntroductionCardContentViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000AB7C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v6;
  id v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)();
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  char *v16;
  id v17;
  Swift::String v18;
  Swift::String_optional v19;
  Swift::String v20;
  void *object;
  NSString v22;
  char *v23;
  id v24;
  Swift::String v25;
  Swift::String_optional v26;
  Swift::String v27;
  void *v28;
  NSString v29;
  id v30;
  Swift::String v31;
  Swift::String_optional v32;
  Swift::String v33;
  void *v34;
  NSString v35;
  Swift::String v36;
  Swift::String_optional v37;
  Swift::String v38;
  void *v39;
  uint64_t v40;
  NSString v41;
  void *v42;
  id v43;
  uint64_t v44;
  _QWORD aBlock[5];
  uint64_t v48;
  Swift::String v49;
  Swift::String v50;
  Swift::String v51;
  Swift::String v52;

  *(_BYTE *)(v3 + 32) = a3;
  *(_QWORD *)(v3 + 24) = a1;
  v6 = type metadata accessor for IntroductionUIProvider.IntroductionCardContentViewController();
  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6));
  swift_retain(a1);
  v8 = (char *)objc_msgSend(v7, "init");
  *(_QWORD *)(v3 + 16) = v8;
  v9 = swift_allocObject(&unk_100039588, 24, 7);
  swift_weakInit(v9 + 16, v3);
  v10 = swift_allocObject(&unk_1000395B0, 32, 7);
  *(_BYTE *)(v10 + 16) = a3;
  *(_QWORD *)(v10 + 24) = v9;
  v11 = (void (**)())&v8[OBJC_IVAR____TtCC21TDGSharingViewService22IntroductionUIProvider37IntroductionCardContentViewController_viewDidLoadCompletionHandler];
  v12 = *(_QWORD *)&v8[OBJC_IVAR____TtCC21TDGSharingViewService22IntroductionUIProvider37IntroductionCardContentViewController_viewDidLoadCompletionHandler];
  v13 = *(_QWORD *)&v8[OBJC_IVAR____TtCC21TDGSharingViewService22IntroductionUIProvider37IntroductionCardContentViewController_viewDidLoadCompletionHandler
                     + 8];
  *v11 = sub_10000B594;
  v11[1] = (void (*)())v10;
  v14 = v8;
  sub_10000B5A0(v12, v13);
  v15 = (void *)objc_opt_self(NSBundle);
  v16 = v14;
  v17 = objc_msgSend(v15, "mainBundle");
  v49._object = (void *)0xE000000000000000;
  v18._object = (void *)0x800000010002EC80;
  v18._countAndFlagsBits = 0xD000000000000012;
  v19.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v19.value._object = (void *)0xEB00000000656C62;
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  v49._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v18, v19, (NSBundle)v17, v20, v49)._object;

  v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v16, "setTitle:", v22);

  v23 = v16;
  v24 = objc_msgSend(v15, "mainBundle");
  v25._countAndFlagsBits = 0xD000000000000015;
  v50._object = (void *)0xE000000000000000;
  v25._object = (void *)0x800000010002ECA0;
  v26.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v26.value._object = (void *)0xEB00000000656C62;
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  v50._countAndFlagsBits = 0;
  v28 = NSLocalizedString(_:tableName:bundle:value:comment:)(v25, v26, (NSBundle)v24, v27, v50)._object;

  v29 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v28);
  objc_msgSend(v23, "setSubtitle:", v29);

  objc_msgSend(v23, "setDismissalType:", 1);
  v30 = objc_msgSend(v15, "mainBundle");
  if ((a3 & 1) != 0)
  {
    v31._countAndFlagsBits = 0xD000000000000023;
    v51._object = (void *)0xE000000000000000;
    v31._object = (void *)0x800000010002ECE0;
    v32.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v32.value._object = (void *)0xEB00000000656C62;
    v33._countAndFlagsBits = 0;
    v33._object = (void *)0xE000000000000000;
    v51._countAndFlagsBits = 0;
    v34 = NSLocalizedString(_:tableName:bundle:value:comment:)(v31, v32, (NSBundle)v30, v33, v51)._object;

    v35 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v34);
    objc_msgSend(v23, "showActivityIndicatorWithStatus:", v35);

  }
  else
  {
    v52._object = (void *)0xE000000000000000;
    v36._countAndFlagsBits = 0x45554E49544E4F43;
    v36._object = (void *)0xEC0000004E54425FLL;
    v37.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v37.value._object = (void *)0xEB00000000656C62;
    v38._countAndFlagsBits = 0;
    v38._object = (void *)0xE000000000000000;
    v52._countAndFlagsBits = 0;
    v39 = NSLocalizedString(_:tableName:bundle:value:comment:)(v36, v37, (NSBundle)v30, v38, v52)._object;

    v40 = swift_allocObject(&unk_100039588, 24, 7);
    swift_weakInit(v40 + 16, v3);
    swift_retain(v40);
    v41 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v39);
    aBlock[4] = sub_10000B5B0;
    v48 = v40;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100027818;
    aBlock[3] = &unk_1000395C8;
    v42 = _Block_copy(aBlock);
    v43 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v41, 0, v42);

    _Block_release(v42);
    v44 = v48;
    swift_release(v40);
    swift_release(v44);

  }
  sub_1000067E8(v23, (a3 & 1) == 0);

  swift_release(a1);
  swift_release(a2);
  return v3;
}

void sub_10000B024(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t Strong;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD *v15;
  void (*v16)(void);
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  os_log_type_t v20;
  uint8_t *v21;
  NSObject *oslog;
  _BYTE v23[24];

  if ((a1 & 1) != 0)
  {
    v2 = a2 + 16;
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v3 = type metadata accessor for Logger(0);
    v4 = sub_100006C44(v3, (uint64_t)qword_100044E40);
    v5 = Logger.logObject.getter(v4);
    v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Invoking introduction action handler automatically", v7, 2u);
      swift_slowDealloc(v7, -1, -1);
    }

    swift_beginAccess(v2, v23, 0, 0);
    Strong = swift_weakLoadStrong(v2);
    if (Strong)
    {
      v9 = Strong;
      v10 = *(_QWORD *)(Strong + 24);
      swift_retain(v10);
      v11 = swift_release(v9);
      v12 = Logger.logObject.getter(v11);
      v13 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Activating WFSetupClient", v14, 2u);
        swift_slowDealloc(v14, -1, -1);
      }

      v15 = *(_QWORD **)(v10 + 24);
      v16 = *(void (**)(void))((swift_isaMask & *v15) + 0x1D8);
      v17 = v15;
      v16();
      swift_release(v10);

    }
  }
  else
  {
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v18 = type metadata accessor for Logger(0);
    v19 = sub_100006C44(v18, (uint64_t)qword_100044E40);
    oslog = Logger.logObject.getter(v19);
    v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v20, "Not automatically invoking introduction action handler since shouldAutoStart is false", v21, 2u);
      swift_slowDealloc(v21, -1, -1);
    }

  }
}

void sub_10000B29C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  uint64_t v4;
  id v5;
  id v6;
  Swift::String v7;
  Swift::String_optional v8;
  Swift::String v9;
  void *object;
  NSString v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _QWORD *v20;
  void (*v21)(void);
  _QWORD *v22;
  _BYTE v23[24];
  _BYTE v24[24];
  Swift::String v25;

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v24, 0, 0);
  Strong = swift_weakLoadStrong(v2);
  if (Strong)
  {
    v4 = Strong;
    v5 = *(id *)(Strong + 16);
    swift_release(v4);
    v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v25._object = (void *)0xE000000000000000;
    v7._object = (void *)0x800000010002ECE0;
    v7._countAndFlagsBits = 0xD000000000000023;
    v8.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v8.value._object = (void *)0xEB00000000656C62;
    v9._countAndFlagsBits = 0;
    v9._object = (void *)0xE000000000000000;
    v25._countAndFlagsBits = 0;
    object = NSLocalizedString(_:tableName:bundle:value:comment:)(v7, v8, (NSBundle)v6, v9, v25)._object;

    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object);
    objc_msgSend(v5, "showActivityIndicatorWithStatus:", v11);

  }
  swift_beginAccess(v2, v23, 0, 0);
  v12 = swift_weakLoadStrong(v2);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)(v12 + 24);
    swift_retain(v14);
    swift_release(v13);
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v15 = type metadata accessor for Logger(0);
    v16 = sub_100006C44(v15, (uint64_t)qword_100044E40);
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Activating WFSetupClient", v19, 2u);
      swift_slowDealloc(v19, -1, -1);
    }

    v20 = *(_QWORD **)(v14 + 24);
    v21 = *(void (**)(void))((swift_isaMask & *v20) + 0x1D8);
    v22 = v20;
    v21();
    swift_release(v14);

  }
}

uint64_t sub_10000B4D4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 33, 7);
}

uint64_t type metadata accessor for IntroductionUIProvider()
{
  return objc_opt_self(_TtC21TDGSharingViewService22IntroductionUIProvider);
}

uint64_t type metadata accessor for IntroductionUIProvider.IntroductionCardContentViewController()
{
  return objc_opt_self(_TtCC21TDGSharingViewService22IntroductionUIProvider37IntroductionCardContentViewController);
}

id sub_10000B540()
{
  uint64_t v0;

  return *(id *)(*(_QWORD *)v0 + 16);
}

uint64_t sub_10000B54C()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000B570()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_10000B594()
{
  uint64_t v0;

  sub_10000B024(*(_BYTE *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_10000B5A0(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

void sub_10000B5B0(uint64_t a1)
{
  uint64_t v1;

  sub_10000B29C(a1, v1);
}

uint64_t sub_10000B5B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000B5C8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t String.appleAccountRebrandStringKey.getter(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];

  v9[3] = &type metadata for AppleAccountFeatures;
  v9[4] = sub_10000B6AC();
  v4 = isFeatureEnabled(_:)(v9);
  sub_10000B6F0(v9);
  if ((v4 & 1) != 0)
  {
    swift_bridgeObjectRetain(a2);
  }
  else
  {
    v9[0] = 0xD000000000000014;
    v9[1] = 0x800000010002ED10;
    v7 = a1;
    v8 = a2;
    swift_bridgeObjectRetain(a2);
    v7 = String.init<A>(_:)(&v7, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
    v8 = v5;
    String.append<A>(contentsOf:)(v9, &type metadata for String, &protocol witness table for String);
    return v7;
  }
  return a1;
}

unint64_t sub_10000B6AC()
{
  unint64_t result;

  result = qword_1000424A8;
  if (!qword_1000424A8)
  {
    result = swift_getWitnessTable(&unk_10002B220, &type metadata for AppleAccountFeatures);
    atomic_store(result, (unint64_t *)&qword_1000424A8);
  }
  return result;
}

uint64_t sub_10000B6F0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t getEnumTagSinglePayload for AppleAccountFeatures(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppleAccountFeatures(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_10000B7A4 + 4 * byte_10002B170[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10000B7C4 + 4 * byte_10002B175[v4]))();
}

_BYTE *sub_10000B7A4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10000B7C4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000B7CC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000B7D4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000B7DC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000B7E4(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_10000B7F0()
{
  return 0;
}

ValueMetadata *type metadata accessor for AppleAccountFeatures()
{
  return &type metadata for AppleAccountFeatures;
}

unint64_t sub_10000B80C()
{
  unint64_t result;

  result = qword_1000424B0;
  if (!qword_1000424B0)
  {
    result = swift_getWitnessTable(&unk_10002B1F8, &type metadata for AppleAccountFeatures);
    atomic_store(result, (unint64_t *)&qword_1000424B0);
  }
  return result;
}

Swift::Int sub_10000B850()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void sub_10000B890()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_10000B8B4(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

const char *sub_10000B8F0()
{
  return "AppleAccount";
}

const char *sub_10000B904()
{
  return "AABranding";
}

uint64_t sub_10000B918()
{
  uint64_t v0;

  sub_10000B6F0((_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for InstructionStage()
{
  return objc_opt_self(_TtC21TDGSharingViewService16InstructionStage);
}

uint64_t sub_10000B95C@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  return sub_10000B978(*v1 + 24, a1);
}

uint64_t sub_10000B96C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(*(_QWORD *)v0 + 16);
}

uint64_t sub_10000B978(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_10000B9BC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id result;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSURL *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t inited;
  uint64_t v14;
  id v15;
  unint64_t v16;
  Class isa;
  void *v18;
  id v19;
  _BYTE v20[80];

  v2 = sub_100006CA0(&qword_100042170);
  __chkstk_darwin(v2);
  v4 = &v20[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  result = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
  if (result)
  {
    v6 = result;
    sub_10000BBD0(a1, (uint64_t)v4);
    v7 = type metadata accessor for URL(0);
    v8 = *(_QWORD *)(v7 - 8);
    v10 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v4, 1, v7) != 1)
    {
      URL._bridgeToObjectiveC()(v9);
      v10 = v11;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v4, v7);
    }
    v12 = sub_100006CA0(&qword_100042568);
    inited = swift_initStackObject(v12, v20);
    *(_OWORD *)(inited + 16) = xmmword_10002B020;
    *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyUnlockDevice);
    *(_QWORD *)(inited + 40) = v14;
    v15 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", 1);
    *(_QWORD *)(inited + 72) = sub_10000BC18();
    *(_QWORD *)(inited + 48) = v15;
    v16 = sub_10001FB44(inited);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v16);
    v19 = 0;
    LOBYTE(v16) = objc_msgSend(v6, "openSensitiveURL:withOptions:error:", v10, isa, &v19);

    result = v19;
    if ((v16 & 1) == 0)
    {
      v18 = result;
      _convertNSErrorToError(_:)(result);

      return (id)swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_10000BBD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006CA0(&qword_100042170);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000BC18()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100042570;
  if (!qword_100042570)
  {
    v1 = objc_opt_self(NSNumber);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100042570);
  }
  return result;
}

uint64_t sub_10000BC54()
{
  uint64_t v0;
  void *Strong;
  void *v2;
  id v3;
  uint64_t v4;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;

  Strong = (void *)swift_unknownObjectWeakLoadStrong(v0 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_remoteAlertServiceVC);
  if (!Strong)
  {
    v7 = 0u;
    v8 = 0u;
LABEL_10:
    sub_10000D75C((uint64_t)&v7);
    return 0;
  }
  v2 = Strong;
  v3 = objc_msgSend(Strong, "_remoteViewControllerProxy");

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)(v6, v3);
    swift_unknownObjectRelease(v3);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_10000D714((uint64_t)v6, (uint64_t)&v7);
  if (!*((_QWORD *)&v8 + 1))
    goto LABEL_10;
  v4 = sub_100006CA0(&qword_100042658);
  if (swift_dynamicCast(v6, &v7, (char *)&type metadata for Any + 8, v4, 6))
    return *(_QWORD *)&v6[0];
  else
    return 0;
}

uint64_t sub_10000BD34(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  int v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  char *v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t aBlock[5];
  uint64_t v49;

  v2 = v1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v46 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100041E58 != -1)
    swift_once(&qword_100041E58, sub_10001A398);
  v11 = type metadata accessor for Logger(0);
  sub_100006C44(v11, (uint64_t)qword_100044E58);
  v12 = a1;
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  v15 = v14;
  if (os_log_type_enabled(v13, v14))
  {
    v16 = swift_slowAlloc(22, -1);
    v42 = swift_slowAlloc(64, -1);
    aBlock[0] = v42;
    *(_DWORD *)v16 = 136446466;
    v45 = v4;
    v47 = sub_100020FBC(0xD00000000000001ALL, 0x800000010002EEB0, aBlock);
    v44 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, aBlock);
    *(_WORD *)(v16 + 12) = 2082;
    v17 = objc_msgSend(v12, "description", v16 + 14);
    v41 = v15;
    v18 = v17;
    v19 = v2;
    v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v43 = v9;
    v21 = v8;
    v22 = v5;
    v24 = v23;

    v25 = v20;
    v2 = v19;
    v47 = sub_100020FBC(v25, v24, aBlock);
    v7 = v44;
    v4 = v45;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, aBlock);

    v26 = v24;
    v5 = v22;
    v8 = v21;
    v9 = v43;
    swift_bridgeObjectRelease(v26);
    _os_log_impl((void *)&_mh_execute_header, v13, (os_log_type_t)v41, "%{public}s is invoked with viewController: %{public}s", (uint8_t *)v16, 0x16u);
    v27 = v42;
    swift_arrayDestroy(v42, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1, -1);
    swift_slowDealloc(v16, -1, -1);

  }
  else
  {

  }
  sub_10000D564();
  v28 = (void *)static OS_dispatch_queue.main.getter();
  v29 = swift_allocObject(&unk_100039830, 32, 7);
  *(_QWORD *)(v29 + 16) = v12;
  *(_QWORD *)(v29 + 24) = v2;
  aBlock[4] = (uint64_t)sub_10000D70C;
  v49 = v29;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100005DCC;
  aBlock[3] = (uint64_t)&unk_100039848;
  v30 = _Block_copy(aBlock);
  v31 = v49;
  v32 = v12;
  v33 = v2;
  v34 = swift_release(v31);
  v35 = v46;
  static DispatchQoS.unspecified.getter(v34);
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  v36 = sub_10000D5E8();
  v37 = sub_100006CA0((uint64_t *)&unk_100041FE0);
  v38 = sub_10000D630();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v37, v38, v4, v36);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v35, v7, v30);
  _Block_release(v30);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v35, v8);
}

void sub_10000C108(void *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *Strong;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (qword_100041E58 != -1)
    swift_once(&qword_100041E58, sub_10001A398);
  v4 = type metadata accessor for Logger(0);
  sub_100006C44(v4, (uint64_t)qword_100044E58);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v23 = a2;
    v9 = swift_slowAlloc(32, -1);
    v25 = v9;
    *(_DWORD *)v8 = 136446210;
    v10 = objc_msgSend(v5, "description");
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v13 = v12;

    v24 = sub_100020FBC(v11, v13, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25);

    swift_bridgeObjectRelease(v13);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Presenting prox card flow with initial view controller: %{public}s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    v14 = v9;
    a2 = v23;
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  v15 = objc_msgSend((id)objc_opt_self(PRXFlowConfiguration), "defaultConfiguration");
  if (v15)
  {
    v16 = v15;
    v17 = objc_msgSend((id)objc_opt_self(UIColor), "blackColor");
    objc_msgSend(v16, "setCustomBackgroundColor:", v17);

    Strong = (void *)swift_unknownObjectWeakLoadStrong(a2 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_remoteAlertServiceVC);
    if (Strong)
    {
      v19 = Strong;
      v20 = objc_msgSend(Strong, "presentProxCardFlowWithDelegate:initialViewController:configuration:", a2, v5, v16);

    }
    v21 = objc_msgSend(v5, "navigationController");
    v22 = *(void **)(a2 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_navigationController);
    *(_QWORD *)(a2 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_navigationController) = v21;

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10000C3B8(void *a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  _QWORD *v20;
  os_log_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  _BYTE *v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  _BYTE v39[12];
  int v40;
  _QWORD *v41;
  os_log_t v42;
  uint64_t v43;
  _BYTE *v44;
  uint64_t v45;
  _BYTE *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t aBlock[5];
  uint64_t v50;

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v39[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for DispatchQoS(0);
  v47 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v46 = &v39[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_100041E58 != -1)
    swift_once(&qword_100041E58, sub_10001A398);
  v10 = type metadata accessor for Logger(0);
  sub_100006C44(v10, (uint64_t)qword_100044E58);
  v11 = a1;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  v14 = v13;
  if (os_log_type_enabled(v12, v13))
  {
    v15 = swift_slowAlloc(28, -1);
    v44 = v7;
    v16 = v15;
    v41 = (_QWORD *)swift_slowAlloc(8, -1);
    v43 = swift_slowAlloc(32, -1);
    aBlock[0] = v43;
    *(_DWORD *)v16 = 136446722;
    v42 = v12;
    v48 = sub_100020FBC(0xD00000000000001FLL, 0x800000010002EE90, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, aBlock);
    *(_WORD *)(v16 + 12) = 2114;
    v48 = (uint64_t)v11;
    v17 = v11;
    v40 = v14;
    v18 = v8;
    v19 = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, aBlock);
    v20 = v41;
    *v41 = v11;

    v8 = v18;
    *(_WORD *)(v16 + 22) = 1024;
    LODWORD(v48) = a2 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, (char *)&v48 + 4);
    v21 = v42;
    _os_log_impl((void *)&_mh_execute_header, v42, (os_log_type_t)v40, "%{public}s is invoked with viewController: %{public}@, animated: %{BOOL}d", (uint8_t *)v16, 0x1Cu);
    v22 = sub_100006CA0(&qword_100042268);
    swift_arrayDestroy(v20, 1, v22);
    swift_slowDealloc(v20, -1, -1);
    v23 = v43;
    swift_arrayDestroy(v43, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    v24 = v16;
    v7 = v44;
    swift_slowDealloc(v24, -1, -1);

  }
  else
  {

  }
  v25 = v45;
  v26 = *(void **)(v45 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredViewController);
  *(_QWORD *)(v45 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredViewController) = 0;

  *(_BYTE *)(v25 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredPushAnimated) = 2;
  sub_10000D564();
  v27 = (void *)static OS_dispatch_queue.main.getter();
  v28 = swift_allocObject(&unk_100039790, 24, 7);
  swift_unknownObjectWeakInit(v28 + 16, v25);
  v29 = swift_allocObject(&unk_1000397E0, 33, 7);
  *(_QWORD *)(v29 + 16) = v28;
  *(_QWORD *)(v29 + 24) = v11;
  *(_BYTE *)(v29 + 32) = a2 & 1;
  aBlock[4] = (uint64_t)sub_10000D6D4;
  v50 = v29;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100005DCC;
  aBlock[3] = (uint64_t)&unk_1000397F8;
  v30 = _Block_copy(aBlock);
  v31 = v50;
  v32 = v11;
  v33 = swift_release(v31);
  v34 = v46;
  static DispatchQoS.unspecified.getter(v33);
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  v35 = sub_10000D5E8();
  v36 = sub_100006CA0((uint64_t *)&unk_100041FE0);
  v37 = sub_10000D630();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v36, v37, v4, v35);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v34, v7, v30);
  _Block_release(v30);

  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v47 + 8))(v34, v8);
}

void sub_10000C820(uint64_t a1, void *a2, char a3)
{
  uint64_t v5;
  uint64_t Strong;
  char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28[3];
  _BYTE v29[24];

  v5 = a1 + 16;
  swift_beginAccess(a1 + 16, v29, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v7 = (char *)Strong;
    v8 = OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_navigationController;
    v9 = *(void **)(Strong + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_navigationController);
    if (!v9
      || (v10 = objc_msgSend(v9, "transitionCoordinator"),
          swift_unknownObjectRelease(v10),
          !v10))
    {
      if (qword_100041E58 != -1)
        swift_once(&qword_100041E58, sub_10001A398);
      v12 = type metadata accessor for Logger(0);
      sub_100006C44(v12, (uint64_t)qword_100044E58);
      v13 = a2;
      v14 = Logger.logObject.getter(v13);
      v15 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v14, v15))
      {
        v25 = v8;
        v16 = (uint8_t *)swift_slowAlloc(12, -1);
        v26 = a3;
        v17 = swift_slowAlloc(32, -1);
        v28[0] = v17;
        *(_DWORD *)v16 = 136446210;
        v18 = objc_msgSend(v13, "description");
        v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v21 = v20;

        v22 = v19;
        v8 = v25;
        v27 = sub_100020FBC(v22, v21, v28);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, v28);

        swift_bridgeObjectRelease(v21);
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Pushing view controller: %{public}s on to the navigation stack", v16, 0xCu);
        swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
        v23 = v17;
        a3 = v26;
        swift_slowDealloc(v23, -1, -1);
        swift_slowDealloc(v16, -1, -1);

      }
      else
      {

      }
      v24 = *(id *)&v7[v8];
      objc_msgSend(v24, "pushViewController:animated:", v13, a3 & 1);

      goto LABEL_13;
    }

  }
  swift_beginAccess(v5, v28, 0, 0);
  v11 = swift_unknownObjectWeakLoadStrong(v5);
  if (!v11)
    return;
  v7 = (char *)v11;
  sub_10000CABC(a2, a3 & 1);
LABEL_13:

}

void sub_10000CABC(void *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  uint64_t v25;
  uint64_t aBlock[5];
  uint64_t v27;

  v3 = v2;
  if (qword_100041E58 != -1)
    swift_once(&qword_100041E58, sub_10001A398);
  v6 = type metadata accessor for Logger(0);
  sub_100006C44(v6, (uint64_t)qword_100044E58);
  v7 = a1;
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v24 = a2;
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    aBlock[0] = v11;
    *(_DWORD *)v10 = 136446210;
    v12 = objc_msgSend(v7, "description");
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v15 = v14;

    v16 = v13;
    a2 = v24;
    v25 = sub_100020FBC(v16, v15, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, aBlock);

    swift_bridgeObjectRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Deferring push of view controller: %{public}s on to the navigation stack", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

  }
  else
  {

  }
  v17 = *(void **)(v3 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredViewController);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredViewController) = v7;
  v18 = v7;

  *(_BYTE *)(v3 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredPushAnimated) = a2 & 1;
  v19 = *(void **)(v3 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_navigationController);
  if (v19)
  {
    v20 = objc_msgSend(v19, "transitionCoordinator");
    if (v20)
    {
      v21 = v20;
      v22 = swift_allocObject(&unk_100039790, 24, 7);
      swift_unknownObjectWeakInit(v22 + 16, v3);
      aBlock[4] = (uint64_t)sub_10000D6A0;
      v27 = v22;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_10000CE5C;
      aBlock[3] = (uint64_t)&unk_1000397A8;
      v23 = _Block_copy(aBlock);
      swift_release(v27);
      objc_msgSend(v21, "notifyWhenInteractionChangesUsingBlock:", v23);
      swift_unknownObjectRelease(v21);
      _Block_release(v23);
    }
  }
}

void sub_10000CD80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  void *v5;
  id v6;
  unsigned __int8 *v7;
  int v8;
  uint64_t v9;
  void *v10;
  _BYTE v11[24];
  _BYTE v12[24];
  _BYTE v13[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v13, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = *(void **)(Strong + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredViewController);
    v6 = v5;

    if (v5)
    {
      swift_beginAccess(v2, v12, 0, 0);
      v7 = (unsigned __int8 *)swift_unknownObjectWeakLoadStrong(v2);
      if (v7)
      {
        v8 = v7[OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredPushAnimated];

        if (v8 != 2)
        {
          swift_beginAccess(v2, v11, 0, 0);
          v9 = swift_unknownObjectWeakLoadStrong(v2);
          if (v9)
          {
            v10 = (void *)v9;
            sub_10000C3B8(v6, v8 & 1);

          }
        }
      }

    }
  }
}

uint64_t sub_10000CE5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2);
}

uint64_t sub_10000CEA4(int a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _BYTE v28[4];
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t aBlock[5];
  uint64_t v34;

  v2 = v1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = &v28[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for DispatchQoS(0);
  v31 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v10 = &v28[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_100041E58 != -1)
    swift_once(&qword_100041E58, sub_10001A398);
  v11 = type metadata accessor for Logger(0);
  sub_100006C44(v11, (uint64_t)qword_100044E58);
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(18, -1);
    v15 = swift_slowAlloc(32, -1);
    v30 = v8;
    v16 = v15;
    aBlock[0] = v15;
    *(_DWORD *)v14 = 136446466;
    v29 = a1;
    v32 = sub_100020FBC(0xD000000000000012, 0x800000010002EE30, aBlock);
    LOBYTE(a1) = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, aBlock);
    *(_WORD *)(v14 + 12) = 1024;
    LODWORD(v32) = a1 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, (char *)&v32 + 4);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%{public}s is invoked with animated: %{BOOL}d", (uint8_t *)v14, 0x12u);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    v17 = v16;
    v8 = v30;
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v14, -1, -1);
  }

  sub_10000D564();
  v18 = (void *)static OS_dispatch_queue.main.getter();
  v19 = swift_allocObject(&unk_100039740, 25, 7);
  *(_QWORD *)(v19 + 16) = v2;
  *(_BYTE *)(v19 + 24) = a1 & 1;
  aBlock[4] = (uint64_t)sub_10000D5C4;
  v34 = v19;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100005DCC;
  aBlock[3] = (uint64_t)&unk_100039758;
  v20 = _Block_copy(aBlock);
  v21 = v34;
  v22 = v2;
  v23 = swift_release(v21);
  static DispatchQoS.unspecified.getter(v23);
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  v24 = sub_10000D5E8();
  v25 = sub_100006CA0((uint64_t *)&unk_100041FE0);
  v26 = sub_10000D630();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v25, v26, v4, v24);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v10, v7, v20);
  _Block_release(v20);

  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v31 + 8))(v10, v8);
}

void sub_10000D1E8(uint64_t a1, char a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *Strong;
  id v9;

  if (qword_100041E58 != -1)
    swift_once(&qword_100041E58, sub_10001A398);
  v4 = type metadata accessor for Logger(0);
  sub_100006C44(v4, (uint64_t)qword_100044E58);
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Dismissing remote alert service view controller", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

  Strong = (void *)swift_unknownObjectWeakLoadStrong(a1 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_remoteAlertServiceVC);
  if (Strong)
  {
    v9 = Strong;
    objc_msgSend(Strong, "dismissViewControllerAnimated:completion:", a2 & 1, 0);

  }
}

void *sub_10000D314()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t Strong;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *result;
  void *v13;

  v1 = v0;
  if (qword_100041E58 != -1)
    swift_once(&qword_100041E58, sub_10001A398);
  v2 = type metadata accessor for Logger(0);
  sub_100006C44(v2, (uint64_t)qword_100044E58);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Prox card flow did dismiss", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  Strong = swift_unknownObjectWeakLoadStrong(v1 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_remoteAlertServiceVC);
  if (Strong)
  {
    v7 = (void *)Strong;
    v8 = type metadata accessor for BYDovePeaceRemoteViewController();
    v9 = swift_dynamicCastClass(v7, v8);
    if (v9)
    {
      v10 = *(void **)(v9 + OBJC_IVAR___BYDovePeaceRemoteViewController_flowEngine);
      if (v10)
      {
        v11 = v10;
        sub_100017758();

      }
    }

  }
  result = (void *)sub_10000BC54();
  if (result)
  {
    v13 = result;
    objc_msgSend(result, "invalidate");
    return (void *)swift_unknownObjectRelease(v13);
  }
  return result;
}

id sub_10000D4CC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProxCardPresenter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ProxCardPresenter()
{
  return objc_opt_self(_TtC21TDGSharingViewService17ProxCardPresenter);
}

unint64_t sub_10000D564()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100041FD0;
  if (!qword_100041FD0)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100041FD0);
  }
  return result;
}

uint64_t sub_10000D5A0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 25, 7);
}

void sub_10000D5C4()
{
  uint64_t v0;

  sub_10000D1E8(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_10000D5D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000D5E0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_10000D5E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100042630;
  if (!qword_100042630)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_100042630);
  }
  return result;
}

unint64_t sub_10000D630()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100042640;
  if (!qword_100042640)
  {
    v1 = sub_100006CE0((uint64_t *)&unk_100041FE0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100042640);
  }
  return result;
}

uint64_t sub_10000D67C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_unknownObjectWeakDestroy(v2 + 16, a2);
  return swift_deallocObject(v2, 24, 7);
}

void sub_10000D6A0(uint64_t a1)
{
  uint64_t v1;

  sub_10000CD80(a1, v1);
}

uint64_t sub_10000D6A8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 33, 7);
}

void sub_10000D6D4()
{
  uint64_t v0;

  sub_10000C820(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_BYTE *)(v0 + 32));
}

uint64_t sub_10000D6E0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_10000D70C()
{
  uint64_t v0;

  sub_10000C108(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_10000D714(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006CA0(&qword_100042650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D75C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006CA0(&qword_100042650);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000D7B4@<X0>(char a1@<W2>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _DWORD *v20;

  if ((a1 & 1) == 0)
  {
    if (MKBGetDeviceLockState(0) - 1 <= 1)
    {
      if (qword_100041E78 != -1)
        swift_once(&qword_100041E78, sub_10001A594);
      v10 = type metadata accessor for Logger(0);
      v11 = sub_100006C44(v10, (uint64_t)qword_100044EB8);
      v12 = Logger.logObject.getter(v11);
      v13 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Inserting device unlock stage since device is locked. ", v14, 2u);
        swift_slowDealloc(v14, -1, -1);
      }

      sub_10000E2D8(0, 0, 0);
    }
    v15 = sub_100019278();
    if (qword_100041E78 != -1)
      swift_once(&qword_100041E78, sub_10001A594);
    v16 = type metadata accessor for Logger(0);
    v17 = sub_100006C44(v16, (uint64_t)qword_100044EB8);
    v18 = Logger.logObject.getter(v17);
    v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (_DWORD *)swift_slowAlloc(12, -1);
      swift_slowAlloc(32, -1);
      *v20 = 136315138;
      __asm { BR              X10 }
    }

    __asm { BR              X10 }
  }
  if (qword_100041E78 != -1)
    swift_once(&qword_100041E78, sub_10001A594);
  v3 = type metadata accessor for Logger(0);
  v4 = sub_100006C44(v3, (uint64_t)qword_100044EB8);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Utilizing SimulatedFlow for list of stages to run", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

  v8 = type metadata accessor for SimulatedFlow();
  result = swift_allocObject(v8, 24, 7);
  *(_QWORD *)(result + 16) = &off_100038DD0;
  a2[3] = v8;
  a2[4] = (uint64_t)&off_100039870;
  *a2 = result;
  return result;
}

uint64_t type metadata accessor for FlowFactory()
{
  return objc_opt_self(_TtC21TDGSharingViewService11FlowFactory);
}

uint64_t type metadata accessor for DefaultFlow()
{
  return objc_opt_self(_TtC21TDGSharingViewService11DefaultFlow);
}

void *sub_10000E0C4(uint64_t a1)
{
  _QWORD *v1;

  swift_beginAccess(*v1 + 16, a1, 33, 0);
  return &j__swift_endAccess;
}

uint64_t sub_10000E108()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for SimulatedFlow()
{
  return objc_opt_self(_TtC21TDGSharingViewService13SimulatedFlow);
}

uint64_t sub_10000E14C()
{
  uint64_t v0;
  uint64_t result;

  result = v0;
  *(_QWORD *)(v0 + 16) = &off_100038DD0;
  return result;
}

uint64_t sub_10000E160()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = *v0;
  swift_beginAccess(*v0 + 16, v3, 0, 0);
  return swift_bridgeObjectRetain(*(_QWORD *)(v1 + 16));
}

void *sub_10000E1A0(uint64_t a1)
{
  _QWORD *v1;

  swift_beginAccess(*v1 + 16, a1, 33, 0);
  return &j_j__swift_endAccess;
}

char *sub_10000E1E0(char *result, int64_t a2, char a3, char *a4)
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
      v10 = sub_100006CA0(&qword_1000428C8);
      v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
      v12 = j__malloc_size(v11);
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * v12 - 64;
      v13 = v11 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[v8 + 32])
          memmove(v13, a4 + 32, v8);
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
    sub_10000E434(0, v8, v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_10000E2D8(uint64_t a1, int64_t a2, char a3)
{
  char **v3;
  char *v5;
  int64_t v6;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  char *result;
  int64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  size_t v17;
  char *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  char v22;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v5 = *v3;
  v6 = *((_QWORD *)*v3 + 2);
  if (v6 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  result = (char *)swift_isUniquelyReferenced_nonNull_native(*v3);
  if (!(_DWORD)result || v10 > *((_QWORD *)v5 + 3) >> 1)
  {
    if (v6 <= v10)
      v13 = v6 + v9;
    else
      v13 = v6;
    result = sub_10000E1E0(result, v13, 1, v5);
    v5 = result;
  }
  v14 = v5 + 32;
  v15 = &v5[a1 + 32];
  if (!v9)
    goto LABEL_20;
  v16 = *((_QWORD *)v5 + 2);
  v17 = v16 - a2;
  if (__OFSUB__(v16, a2))
    goto LABEL_26;
  if ((v17 & 0x8000000000000000) == 0)
  {
    result = v15 + 1;
    v18 = &v14[a2];
    if (v15 + 1 != &v14[a2] || result >= &v18[v17])
      result = (char *)memmove(result, v18, v17);
    v19 = *((_QWORD *)v5 + 2);
    v20 = __OFADD__(v19, v9);
    v21 = v19 + v9;
    if (!v20)
    {
      *((_QWORD *)v5 + 2) = v21;
LABEL_20:
      *v15 = a3;
      *v3 = v5;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  v22 = 2;
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v22, 1046, 0);
  __break(1u);
  return result;
}

char *sub_10000E434(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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

char *sub_10000E51C(uint64_t a1, int64_t a2)
{
  char **v2;
  char *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  char *result;
  int64_t v11;
  uint64_t v12;
  size_t v13;
  char *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  v4 = *v2;
  v5 = *((_QWORD *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  result = (char *)swift_isUniquelyReferenced_nonNull_native(*v2);
  if ((_DWORD)result && v9 <= *((_QWORD *)v4 + 3) >> 1)
  {
    if (!v8)
      goto LABEL_21;
  }
  else
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    result = sub_10000E1E0(result, v11, 1, v4);
    v4 = result;
    if (!v8)
      goto LABEL_21;
  }
  v12 = *((_QWORD *)v4 + 2);
  v13 = v12 - a2;
  if (__OFSUB__(v12, a2))
    goto LABEL_27;
  if ((v13 & 0x8000000000000000) == 0)
  {
    result = &v4[a1 + 32];
    v14 = &v4[a2 + 32];
    if (a1 != a2 || result >= &v14[v13])
      result = (char *)memmove(result, v14, v13);
    v15 = *((_QWORD *)v4 + 2);
    v16 = __OFADD__(v15, v8);
    v17 = v15 + v8;
    if (!v16)
    {
      *((_QWORD *)v4 + 2) = v17;
LABEL_21:
      *v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

_QWORD *sub_10000E674()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14[3];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = v0;
  v2 = *v0;
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v3 = type metadata accessor for Logger(0);
  sub_100006C44(v3, (uint64_t)qword_100044E40);
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v14[0] = v7;
    *(_DWORD *)v6 = 136446210;
    v8 = _typeName(_:qualified:)(v2, 0);
    v10 = v9;
    v17 = sub_100020FBC(v8, v9, v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, &v18);
    swift_bridgeObjectRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%{public}s is being deinitialized.", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }

  swift_beginAccess(v1 + 3, &v17, 0, 0);
  if (v1[6])
  {
    sub_10000B978((uint64_t)(v1 + 3), (uint64_t)v14);
    v11 = v15;
    v12 = v16;
    sub_10000FED4(v14, v15);
    dispatch thunk of Cancellable.cancel()(v11, v12);
    sub_10000B6F0(v14);
  }

  sub_10000FE98((uint64_t)(v1 + 3), &qword_100042990);
  return v1;
}

uint64_t sub_10000E85C()
{
  uint64_t v0;

  sub_10000E674();
  return swift_deallocClassInstance(v0, 65, 7);
}

uint64_t type metadata accessor for VisualPairingUIProvider()
{
  return objc_opt_self(_TtC21TDGSharingViewService23VisualPairingUIProvider);
}

uint64_t *sub_10000E89C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  char *v19;
  id v20;
  Swift::String v21;
  Swift::String_optional v22;
  Swift::String v23;
  void *object;
  NSString v25;
  id v26;
  id v27;
  Swift::String v28;
  Swift::String_optional v29;
  Swift::String v30;
  void *v31;
  NSString v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (**v38)();
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  id v43;
  Swift::String v44;
  Swift::String_optional v45;
  Swift::String v46;
  void *v47;
  NSString v48;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  void *v57;
  Swift::String v58;
  Swift::String v59;
  Swift::String v60;

  v3 = v2;
  *(_OWORD *)(v2 + 3) = 0u;
  v5 = (uint64_t)(v2 + 3);
  v6 = *v2;
  *(_OWORD *)(v2 + 5) = 0u;
  *(_OWORD *)((char *)v2 + 49) = 0u;
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v7 = type metadata accessor for Logger(0);
  v8 = sub_100006C44(v7, (uint64_t)qword_100044E40);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  v50 = a1;
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    v54 = v12;
    *(_DWORD *)v11 = 136446210;
    v13 = _typeName(_:qualified:)(v6, 0);
    v15 = v14;
    v52 = sub_100020FBC(v13, v14, &v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53);
    swift_bridgeObjectRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Initializing %{public}s.", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);
  }

  v16 = type metadata accessor for ViewServiceUIViewControllerExtendedHeight();
  v17 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), "init");
  swift_weakAssign(&v17[OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_layoutCache], a2);
  v3[2] = (uint64_t)v17;
  v18 = (void *)objc_opt_self(NSBundle);
  v19 = v17;
  v20 = objc_msgSend(v18, "mainBundle");
  v58._object = (void *)0xE000000000000000;
  v21._object = (void *)0x800000010002F110;
  v21._countAndFlagsBits = 0xD000000000000014;
  v22.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v22.value._object = (void *)0xEB00000000656C62;
  v23._countAndFlagsBits = 0;
  v23._object = (void *)0xE000000000000000;
  v58._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v21, v22, (NSBundle)v20, v23, v58)._object;

  v25 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v19, "setTitle:", v25);

  v26 = (id)v3[2];
  v27 = objc_msgSend(v18, "mainBundle");
  v28._countAndFlagsBits = 0xD000000000000017;
  v59._object = (void *)0xE000000000000000;
  v28._object = (void *)0x800000010002F130;
  v29.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v29.value._object = (void *)0xEB00000000656C62;
  v30._countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  v59._countAndFlagsBits = 0;
  v31 = NSLocalizedString(_:tableName:bundle:value:comment:)(v28, v29, (NSBundle)v27, v30, v59)._object;

  v32 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v31);
  objc_msgSend(v26, "setSubtitle:", v32);

  objc_msgSend((id)v3[2], "setDismissalType:", 1);
  v33 = (id)v3[2];
  sub_1000085CC();

  v54 = v50;
  swift_retain(v3);
  v34 = sub_100006CA0(&qword_100042980);
  v35 = sub_100006D5C(&qword_100042988, &qword_100042980, (uint64_t)&protocol conformance descriptor for CurrentValueSubject<A, B>);
  v36 = Publisher<>.sink(receiveValue:)(sub_10000FD2C, v3, v34, v35);
  swift_release(v3);
  v56 = type metadata accessor for AnyCancellable(0);
  v57 = &protocol witness table for AnyCancellable;
  v54 = v36;
  swift_beginAccess(v5, &v52, 33, 0);
  sub_10000FD34((uint64_t)&v54, v5);
  swift_endAccess(&v52);
  v37 = swift_dynamicCastClass(v3[2], v16);
  if (v37)
  {
    v38 = (uint64_t (**)())(v37
                         + OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_viewDidAppearCompletionHandler);
    v39 = *(_QWORD *)(v37
                    + OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_viewDidAppearCompletionHandler);
    v40 = (uint64_t)v38[1];
    *v38 = sub_10000EE00;
    v38[1] = 0;
    v37 = sub_10000B5A0(v39, v40);
  }
  CurrentValueSubject.value.getter(&v54, v37);
  v41 = v55;
  if (v55)
  {
    sub_10000F070(v54, v55);

    swift_bridgeObjectRelease(v41);
  }
  else
  {
    v42 = (id)v3[2];
    v43 = objc_msgSend(v18, "mainBundle");
    v44._countAndFlagsBits = 0xD00000000000001FLL;
    v60._object = (void *)0xE000000000000000;
    v44._object = (void *)0x800000010002F150;
    v45.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v45.value._object = (void *)0xEB00000000656C62;
    v46._countAndFlagsBits = 0;
    v46._object = (void *)0xE000000000000000;
    v60._countAndFlagsBits = 0;
    v47 = NSLocalizedString(_:tableName:bundle:value:comment:)(v44, v45, (NSBundle)v43, v46, v60)._object;

    v48 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v47);
    objc_msgSend(v42, "showActivityIndicatorWithStatus:", v48);

  }
  swift_release(v50);
  swift_release(a2);
  return v3;
}

uint64_t sub_10000EE00()
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
  char *v9;
  void *v10;
  void (*v11)(char *, uint64_t);
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  void *v20;
  _QWORD aBlock[6];

  v0 = type metadata accessor for DispatchWorkItemFlags(0);
  __chkstk_darwin(v0);
  v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for DispatchTime(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v19 - v8;
  sub_10000D564();
  v10 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  + infix(_:_:)(v7, 0.5);
  v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v7, v3);
  aBlock[4] = sub_10000EFFC;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005DCC;
  aBlock[3] = &unk_1000398D0;
  v12 = _Block_copy(aBlock);
  v20 = &_swiftEmptyArrayStorage;
  v13 = sub_10000D5E8();
  v14 = sub_100006CA0((uint64_t *)&unk_100041FE0);
  v15 = sub_100006D5C((unint64_t *)&qword_100042640, (uint64_t *)&unk_100041FE0, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v20, v14, v15, v0, v13);
  v16 = type metadata accessor for DispatchWorkItem(0);
  swift_allocObject(v16, *(unsigned int *)(v16 + 48), *(unsigned __int16 *)(v16 + 52));
  v17 = DispatchWorkItem.init(flags:block:)(v2, v12);
  OS_dispatch_queue.asyncAfter(deadline:execute:)(v9, v17);

  swift_release(v17);
  return ((uint64_t (*)(char *, uint64_t))v11)(v9, v3);
}

void sub_10000EFFC()
{
  UIAccessibilityNotifications v0;
  unint64_t v1;
  Class argument;

  v0 = UIAccessibilityAnnouncementNotification;
  v1 = sub_10001FDB8((uint64_t)&off_100038E00);
  argument = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v1);
  UIAccessibilityPostNotification(v0, argument);

}

void sub_10000F070(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  NSObject v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  uint64_t v10;
  void **v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  os_log_t v38;
  Class v39;
  void *v40;
  objc_class *v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  objc_class *v47;
  void **v48;
  objc_class *isa;
  os_log_t v50;
  uint64_t v51;
  uint64_t v52[2];

  v5.isa = *(Class *)v2;
  v6 = sub_100006CA0(&qword_100042998);
  v7 = __chkstk_darwin(v6);
  v9 = (unint64_t *)((char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v7);
  v11 = (void **)((char *)&v48 - v10);
  v12 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v12 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v12)
  {
    if (qword_100041E70 != -1)
      swift_once(&qword_100041E70, sub_10001A514);
    v18 = type metadata accessor for Logger(0);
    v19 = sub_100006C44(v18, (uint64_t)qword_100044EA0);
    v50 = (os_log_t)Logger.logObject.getter(v19);
    v15 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v50, v15))
      goto LABEL_14;
    v16 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v16 = 0;
    v17 = "Setup pin not yet received.";
    goto LABEL_13;
  }
  if ((*(_BYTE *)(v2 + 64) & 1) != 0)
  {
    if (qword_100041E70 != -1)
      swift_once(&qword_100041E70, sub_10001A514);
    v13 = type metadata accessor for Logger(0);
    v14 = sub_100006C44(v13, (uint64_t)qword_100044EA0);
    v50 = (os_log_t)Logger.logObject.getter(v14);
    v15 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v50, v15))
      goto LABEL_14;
    v16 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v16 = 0;
    v17 = "Already showing the app clip code";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v50, v15, v17, v16, 2u);
    swift_slowDealloc(v16, -1, -1);
LABEL_14:

    return;
  }
  if (qword_100041E70 != -1)
    swift_once(&qword_100041E70, sub_10001A514);
  v20 = type metadata accessor for Logger(0);
  sub_100006C44(v20, (uint64_t)qword_100044EA0);
  v21 = swift_bridgeObjectRetain_n(a2, 2);
  v22 = Logger.logObject.getter(v21);
  v23 = static os_log_type_t.default.getter();
  v24 = os_log_type_enabled(v22, v23);
  v50 = (os_log_t)v2;
  if (v24)
  {
    v25 = (uint8_t *)swift_slowAlloc(12, -1);
    v26 = swift_slowAlloc(32, -1);
    isa = v5.isa;
    v27 = v26;
    v52[0] = v26;
    v48 = v11;
    *(_DWORD *)v25 = 136315138;
    swift_bridgeObjectRetain(a2);
    v51 = sub_100020FBC(a1, a2, v52);
    v11 = v48;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, v52);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Encoding this pin: %s", v25, 0xCu);
    swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
    v28 = v27;
    v5.isa = isa;
    swift_slowDealloc(v28, -1, -1);
    swift_slowDealloc(v25, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
  swift_bridgeObjectRetain(a2);
  sub_100024BD8(a1, a2, v9);
  swift_bridgeObjectRelease(a2);
  v29 = type metadata accessor for VisualPairingAppClipCode(0);
  (*(void (**)(unint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v9, 0, 1, v29);
  v30 = sub_10000FDF4((uint64_t)v9, (uint64_t)v11);
  v31 = Logger.logObject.getter(v30);
  v32 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc(12, -1);
    v34 = swift_slowAlloc(32, -1);
    v52[0] = v34;
    *(_DWORD *)v33 = 136446210;
    v35 = _typeName(_:qualified:)(v5.isa, 0);
    v37 = v36;
    v51 = sub_100020FBC(v35, v36, v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, v52);
    swift_bridgeObjectRelease(v37);
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "Successfully generated ACC in %{public}s.", v33, 0xCu);
    swift_arrayDestroy(v34, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v34, -1, -1);
    swift_slowDealloc(v33, -1, -1);
  }

  v38 = v50;
  LOBYTE(v50[8].isa) = 1;
  -[objc_class hideActivityIndicator](v38[2].isa, "hideActivityIndicator");
  v39 = v38[2].isa;
  type metadata accessor for VisualPairingAppClipCode(0);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 48))(v11, 1, v29))
  {
    v40 = (void *)objc_opt_self(UIColor);
    v41 = v39;
    v42 = objc_msgSend(v40, "secondaryLabelColor");
    v43 = sub_1000092D8(0xD000000000000013, 0x800000010002F180, (uint64_t)v42);

    v44 = 0;
  }
  else
  {
    v44 = *v11;
    v45 = objc_allocWithZone((Class)UIImageView);
    v46 = v44;
    v47 = v39;
    v43 = objc_msgSend(v45, "initWithImage:", v46);
  }
  objc_msgSend(v43, "setContentMode:", 1);
  sub_10000FD94(v44, 0, 0, 3);
  sub_100007598(v43, (uint64_t)v44, 0, 0, 3);

  sub_10000FD94(v44, 0, 0, 3);
  sub_10000FE98((uint64_t)v11, &qword_100042998);
}

void sub_10000F864(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  os_log_type_t v28;
  uint8_t *v29;
  void *v30;
  uint64_t v31;
  _QWORD *v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  os_log_t v42;
  uint64_t v43;
  uint64_t aBlock[5];
  _QWORD *v45;

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = __chkstk_darwin(v8);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[1];
  if (v13)
  {
    v41 = v10;
    v42 = v9;
    v14 = *a1;
    v15 = qword_100041E50;
    swift_bridgeObjectRetain(v13);
    if (v15 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v16 = type metadata accessor for Logger(0);
    sub_100006C44(v16, (uint64_t)qword_100044E40);
    v17 = swift_bridgeObjectRetain_n(v13, 2);
    v18 = Logger.logObject.getter(v17);
    v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v38 = a2;
      v20 = swift_slowAlloc(12, -1);
      v39 = v5;
      v21 = (uint8_t *)v20;
      v22 = swift_slowAlloc(32, -1);
      v40 = v14;
      v23 = v22;
      aBlock[0] = v22;
      *(_DWORD *)v21 = 136315138;
      swift_bridgeObjectRetain(v13);
      v43 = sub_100020FBC(v40, v13, aBlock);
      a2 = v38;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, aBlock);
      swift_bridgeObjectRelease_n(v13, 3);
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Received this pin: %s", v21, 0xCu);
      swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
      v24 = v23;
      v14 = v40;
      swift_slowDealloc(v24, -1, -1);
      v25 = v21;
      v5 = v39;
      swift_slowDealloc(v25, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v13, 2);
    }
    sub_10000D564();
    v30 = (void *)static OS_dispatch_queue.main.getter();
    v31 = swift_allocObject(&unk_100039908, 24, 7);
    swift_weakInit(v31 + 16, a2);
    v32 = (_QWORD *)swift_allocObject(&unk_100039930, 40, 7);
    v32[2] = v31;
    v32[3] = v14;
    v32[4] = v13;
    aBlock[4] = (uint64_t)sub_10000FE8C;
    v45 = v32;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100005DCC;
    aBlock[3] = (uint64_t)&unk_100039948;
    v33 = _Block_copy(aBlock);
    v34 = swift_release(v45);
    static DispatchQoS.unspecified.getter(v34);
    aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
    v35 = sub_10000D5E8();
    v36 = sub_100006CA0((uint64_t *)&unk_100041FE0);
    v37 = sub_100006D5C((unint64_t *)&qword_100042640, (uint64_t *)&unk_100041FE0, (uint64_t)&protocol conformance descriptor for [A]);
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v36, v37, v4, v35);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v12, v7, v33);
    _Block_release(v33);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, os_log_t))(v41 + 8))(v12, v42);
  }
  else
  {
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v26 = type metadata accessor for Logger(0);
    v27 = sub_100006C44(v26, (uint64_t)qword_100044E40);
    v42 = (os_log_t)Logger.logObject.getter(v27);
    v28 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v42, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, v28, "No pin received from setup pin publisher", v29, 2u);
      swift_slowDealloc(v29, -1, -1);
    }

  }
}

uint64_t sub_10000FCBC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  _BYTE v8[24];

  v5 = a1 + 16;
  swift_beginAccess(a1 + 16, v8, 0, 0);
  result = swift_weakLoadStrong(v5);
  if (result)
  {
    v7 = result;
    sub_10000F070(a2, a3);
    return swift_release(v7);
  }
  return result;
}

void sub_10000FD2C(uint64_t *a1)
{
  uint64_t v1;

  sub_10000F864(a1, v1);
}

uint64_t sub_10000FD34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006CA0(&qword_100042990);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000FD7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000FD8C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_10000FD94(void *a1, uint64_t a2, void *a3, char a4)
{
  switch(a4)
  {
    case 0:
      swift_bridgeObjectRelease(a2);

      break;
    case 1:
    case 2:
    case 3:

      break;
    case 4:
    case 5:
      swift_bridgeObjectRelease(a2);
      break;
    default:
      return;
  }
}

uint64_t sub_10000FDF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006CA0(&qword_100042998);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000FE3C()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000FE60()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000FE8C()
{
  uint64_t v0;

  return sub_10000FCBC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_10000FE98(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100006CA0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_QWORD *sub_10000FED4(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000FF00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v1 = v0;
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v2 = type metadata accessor for Logger(0);
  sub_100006C44(v2, (uint64_t)qword_100044E40);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "InstructionUIProvider is being deinitialized", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  return swift_deallocClassInstance(v1, 24, 7);
}

uint64_t type metadata accessor for InstructionUIProvider()
{
  return objc_opt_self(_TtC21TDGSharingViewService21InstructionUIProvider);
}

uint64_t sub_100010004()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  Swift::String v6;
  Swift::String_optional v7;
  Swift::String v8;
  void *object;
  NSString v10;
  id v11;
  Swift::String v12;
  Swift::String_optional v13;
  Swift::String v14;
  Swift::String v15;
  id v16;
  NSString v17;
  id v18;
  Swift::String v20;
  Swift::String v21;

  v1 = v0;
  v2 = objc_msgSend(objc_allocWithZone((Class)PRXCardContentViewController), "init");
  *(_QWORD *)(v0 + 16) = v2;
  v3 = v2;
  objc_msgSend(v3, "setDismissalType:", 1);
  sub_1000085CC();
  v4 = (void *)objc_opt_self(NSBundle);
  v5 = objc_msgSend(v4, "mainBundle");
  v6._countAndFlagsBits = 0xD000000000000028;
  v20._object = (void *)0xE000000000000000;
  v6._object = (void *)0x800000010002F1E0;
  v7.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v7.value._object = (void *)0xEB00000000656C62;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  v20._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v6, v7, (NSBundle)v5, v8, v20)._object;

  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v3, "showActivityIndicatorWithStatus:", v10);

  v11 = objc_msgSend(v4, "mainBundle");
  v21._object = (void *)0xE000000000000000;
  v12._object = (void *)0x800000010002F210;
  v12._countAndFlagsBits = 0xD000000000000016;
  v13.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v13.value._object = (void *)0xEB00000000656C62;
  v14._countAndFlagsBits = 0;
  v14._object = (void *)0xE000000000000000;
  v21._countAndFlagsBits = 0;
  v15 = NSLocalizedString(_:tableName:bundle:value:comment:)(v12, v13, (NSBundle)v11, v14, v21);

  v16 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v17 = String._bridgeToObjectiveC()();
  objc_msgSend(v16, "setText:", v17);

  v18 = objc_msgSend((id)objc_opt_self(UIFont), "preferredFontForTextStyle:", UIFontTextStyleExtraLargeTitle2);
  objc_msgSend(v16, "setFont:", v18);

  objc_msgSend(v16, "setTextAlignment:", 1);
  objc_msgSend(v16, "setNumberOfLines:", 0);
  sub_100007598(v16, v15._countAndFlagsBits, (uint64_t)v15._object, 0, 5);

  swift_bridgeObjectRelease(v15._object);
  return v1;
}

uint64_t sub_100010284()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x676E696E6E7572;
  if (*v0 != 1)
    v1 = 0x676E69646E65;
  if (*v0)
    return v1;
  else
    return 1701602409;
}

uint64_t sub_1000102D4(_QWORD *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  _QWORD *v24;
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
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  unint64_t v45;
  char v46;
  void *v47;
  uint64_t v48;
  int v49;
  id v50;
  void *v51;
  id v52;
  objc_class *v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  NSString v59;
  uint64_t result;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  id v66;
  int v67;
  int v68;
  uint64_t v69;
  id v70;
  void *v71;
  uint64_t v72;
  objc_super v73;
  __int128 v74;
  __int128 v75;

  v8 = v7;
  v67 = a6;
  v68 = a7;
  v69 = a5;
  v70 = a3;
  v65 = a4;
  v66 = a2;
  v64 = a1;
  v9 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v62 = *(_QWORD *)(v9 - 8);
  v63 = v9;
  __chkstk_darwin(v9);
  v11 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v12);
  v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v15);
  v17 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = &v8[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage];
  *(_OWORD *)v18 = 0u;
  *((_OWORD *)v18 + 1) = 0u;
  *((_QWORD *)v18 + 4) = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_navigationContoller] = 0;
  v61 = OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue;
  sub_100006D24(0, (unint64_t *)&qword_100041FD0, OS_dispatch_queue_ptr);
  v19 = v8;
  static DispatchQoS.unspecified.getter(v19);
  v71 = &_swiftEmptyArrayStorage;
  v20 = sub_100006E48(&qword_100042AF8, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v21 = sub_100006CA0(&qword_100042B00);
  v22 = sub_100006D5C(&qword_100042B08, &qword_100042B00, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v71, v21, v22, v12, v20);
  (*(void (**)(char *, _QWORD, uint64_t))(v62 + 104))(v11, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v63);
  v23 = v11;
  v24 = v64;
  v25 = v61;
  *(_QWORD *)&v8[v25] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000002ALL, 0x800000010002F3C0, v17, v14, v23, 0);
  v19[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_hasReceivedServerInteractionEvent] = 0;
  v19[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_hasReceivedSetupCompletedEvent] = 0;
  *(_QWORD *)&v19[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_cancellables] = &_swiftEmptySetSingleton;
  v26 = OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_setupPinPublisher;
  v71 = 0;
  v72 = 0;
  v27 = sub_100006CA0(&qword_100042980);
  swift_allocObject(v27, *(unsigned int *)(v27 + 48), *(unsigned __int16 *)(v27 + 52));
  *(_QWORD *)&v19[v26] = CurrentValueSubject.init(_:)(&v71);
  v19[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_engineFlowProgress] = 0;
  v28 = OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_layoutCache;
  v29 = type metadata accessor for ProxCardLayoutCache();
  v30 = swift_allocObject(v29, 33, 7);
  *(_QWORD *)(v30 + 16) = 0;
  *(_QWORD *)(v30 + 24) = 0;
  *(_BYTE *)(v30 + 32) = 1;
  *(_QWORD *)&v19[v28] = v30;
  v31 = v24[3];
  v32 = v24[4];
  sub_10000FED4(v24, v31);
  v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v31, v32);
  v34 = *(_QWORD *)(v33 + 16);
  swift_bridgeObjectRelease(v33);
  if (v34)
  {
    v35 = v65;
    *(_QWORD *)&v19[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_appleIDManager] = v65;
    sub_10000B978((uint64_t)v24, (uint64_t)&v19[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow]);
    v36 = v66;
    *(_QWORD *)&v19[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_presenter] = v66;
    v37 = *(void **)&v8[v25];
    swift_retain(v35);
    v66 = v36;
    v38 = v37;
    if (v70 && (v39 = objc_msgSend(v70, "userInfo")) != 0)
    {
      v40 = v39;
      v41 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v39, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

      *(_QWORD *)&v74 = 0xD000000000000010;
      *((_QWORD *)&v74 + 1) = 0x800000010002F410;
      AnyHashable.init<A>(_:)(&v71, &v74, &type metadata for String, &protocol witness table for String);
      v42 = v69;
      v44 = v67;
      v43 = v68;
      if (*(_QWORD *)(v41 + 16) && (v45 = sub_100021834((uint64_t)&v71), (v46 & 1) != 0))
      {
        sub_100017C08(*(_QWORD *)(v41 + 56) + 32 * v45, (uint64_t)&v74);
      }
      else
      {
        v74 = 0u;
        v75 = 0u;
      }
      sub_100017BD4((uint64_t)&v71);
      swift_bridgeObjectRelease(v41);
      if (*((_QWORD *)&v75 + 1))
      {
        v49 = swift_dynamicCast(&v71, &v74, (char *)&type metadata for Any + 8, &type metadata for String, 6);
        if (v49)
          v47 = v71;
        else
          v47 = 0;
        if (v49)
          v48 = v72;
        else
          v48 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      v74 = 0u;
      v75 = 0u;
      v42 = v69;
      v44 = v67;
      v43 = v68;
    }
    sub_10000FE98((uint64_t)&v74, &qword_100042650);
    v47 = 0;
    v48 = 0;
LABEL_17:
    v50 = objc_allocWithZone((Class)type metadata accessor for WFSetupClient(0));
    v51 = (void *)WFSetupClient.init(queue:deviceIdentifier:)(v38, v47, v48);
    *(_QWORD *)&v19[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_setupClient] = v51;
    *(_QWORD *)&v19[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_interactionEventPublisher] = v51;
    *(_QWORD *)&v19[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_assetLoader] = v42;
    v19[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_shouldAutoStart] = v44 & 1;
    v19[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_shouldSimulate] = v43 & 1;
    v52 = v51;
    swift_retain(v42);

    v53 = (objc_class *)type metadata accessor for ProxCardFlowEngine();
    v73.receiver = v19;
    v73.super_class = v53;
    v54 = objc_msgSendSuper2(&v73, "init");
    v55 = (void *)objc_opt_self(NSDistributedNotificationCenter);
    v56 = v54;
    v57 = objc_msgSend(v55, "defaultCenter");
    v58 = v56;
    v59 = String._bridgeToObjectiveC()();
    objc_msgSend(v57, "addObserver:selector:name:object:suspensionBehavior:", v58, "handleDeviceSetupNotification:", v59, 0, 4);

    swift_release(v35);
    swift_release(v42);
    sub_10000B6F0(v24);
    return (uint64_t)v58;
  }
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001DLL, 0x800000010002F460, "TDGSharingViewService/ProxCardFlowEngine.swift", 46, 2, 90, 0);
  __break(1u);
  return result;
}

id sub_1000108F4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  id v6;
  id v7;
  NSString v8;
  objc_super v10;

  v1 = v0;
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v2 = type metadata accessor for Logger(0);
  sub_100006C44(v2, (uint64_t)qword_100044E40);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "ProxCardFlowEngine is being deinitialized…", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  v6 = objc_msgSend((id)objc_opt_self(NSDistributedNotificationCenter), "defaultCenter");
  v7 = v1;
  v8 = String._bridgeToObjectiveC()();
  objc_msgSend(v6, "removeObserver:name:object:", v7, v8, 0);

  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for ProxCardFlowEngine();
  return objc_msgSendSuper2(&v10, "dealloc");
}

uint64_t sub_100010B5C()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  _QWORD *v5;
  uint64_t v6;
  void (*v7)(_QWORD, uint64_t);
  uint64_t v8;
  void (*v9)(void (*)(), uint64_t);
  uint64_t v10;
  void (*v11)(void (*)(), uint64_t);
  uint64_t v12;
  void (*v13)(void (*)(uint64_t), uint64_t);
  uint64_t v14;
  void (*v15)(void (*)(int, uint64_t, unint64_t), uint64_t);
  uint64_t v16;
  void (*v17)(void (*)(uint64_t), uint64_t);
  uint64_t v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v24;

  v1 = v0;
  v2 = sub_100006CA0(&qword_100042BB8);
  __chkstk_darwin(v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD **)&v0[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_setupClient];
  v6 = swift_allocObject(&unk_100039AF0, 24, 7);
  swift_unknownObjectWeakInit(v6 + 16, v1);
  v7 = *(void (**)(_QWORD, uint64_t))((swift_isaMask & *v5) + 0x138);
  swift_retain(v6);
  v7(sub_100018380, v6);
  swift_release(v6);
  v8 = swift_allocObject(&unk_100039AF0, 24, 7);
  swift_unknownObjectWeakInit(v8 + 16, v1);
  v9 = *(void (**)(void (*)(), uint64_t))((swift_isaMask & *v5) + 0xD8);
  swift_retain(v8);
  v9(sub_100018388, v8);
  swift_release(v8);
  v10 = swift_allocObject(&unk_100039AF0, 24, 7);
  swift_unknownObjectWeakInit(v10 + 16, v1);
  v11 = *(void (**)(void (*)(), uint64_t))((swift_isaMask & *v5) + 0xF0);
  swift_retain(v10);
  v11(sub_1000183A8, v10);
  swift_release(v10);
  v12 = swift_allocObject(&unk_100039AF0, 24, 7);
  swift_unknownObjectWeakInit(v12 + 16, v1);
  v13 = *(void (**)(void (*)(uint64_t), uint64_t))((swift_isaMask & *v5) + 0x150);
  swift_retain(v12);
  v13(sub_1000183C8, v12);
  swift_release(v12);
  v14 = swift_allocObject(&unk_100039AF0, 24, 7);
  swift_unknownObjectWeakInit(v14 + 16, v1);
  v15 = *(void (**)(void (*)(int, uint64_t, unint64_t), uint64_t))((swift_isaMask & *v5)
                                                                                            + 0x198);
  swift_retain(v14);
  v15(sub_1000183E8, v14);
  swift_release(v14);
  v16 = swift_allocObject(&unk_100039AF0, 24, 7);
  swift_unknownObjectWeakInit(v16 + 16, v1);
  v17 = *(void (**)(void (*)(uint64_t), uint64_t))((swift_isaMask & *v5) + 0x168);
  swift_retain(v16);
  v17(sub_1000183F0, v16);
  swift_release(v16);
  v18 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v4, 1, 1, v18);
  type metadata accessor for MainActor(0);
  v19 = v1;
  v20 = static MainActor.shared.getter();
  v21 = (_QWORD *)swift_allocObject(&unk_100039C08, 40, 7);
  v21[2] = v20;
  v21[3] = &protocol witness table for MainActor;
  v21[4] = v19;
  v22 = sub_10001FEC8((uint64_t)v4, (uint64_t)&unk_100042BC8, (uint64_t)v21);
  return swift_release(v22);
}

void sub_100010E44(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t Strong;
  void *v7;
  _BYTE v8[24];

  v5 = a3 + 16;
  swift_beginAccess(a3 + 16, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v7 = (void *)Strong;
    sub_10001373C(a1, a2);

  }
}

void sub_100010EB0(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t Strong;
  void *v10;
  id v11;
  _BYTE v12[24];

  v3 = a1 + 16;
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100006C44(v4, (uint64_t)qword_100044E40);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, a2, v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  swift_beginAccess(v3, v12, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v10 = (void *)Strong;
    v11 = *(id *)(Strong + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_presenter);

    sub_10000CEA4(1);
  }
}

void sub_100010FD8(int a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t Strong;
  void *v9;
  _BYTE v10[24];

  v7 = a4 + 16;
  swift_beginAccess(a4 + 16, v10, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v7);
  if (Strong)
  {
    v9 = (void *)Strong;
    sub_100016160(a1, a2, a3);

  }
}

void sub_10001104C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5;
  uint64_t Strong;
  void *v7;
  _BYTE v8[24];

  v5 = a2 + 16;
  swift_beginAccess(a2 + 16, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v7 = (void *)Strong;
    a3(a1);

  }
}

uint64_t sub_1000110B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[27] = a4;
  v5 = type metadata accessor for MainActor(0);
  v4[28] = static MainActor.shared.getter();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v4[29] = v6;
  v4[30] = v7;
  return swift_task_switch(sub_100011120, v6, v7);
}

uint64_t sub_100011120()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  uint64_t (__cdecl *v8)();

  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v1 = type metadata accessor for Logger(0);
  v2 = sub_100006C44(v1, (uint64_t)qword_100044E40);
  *(_QWORD *)(v0 + 248) = v2;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Fetching assets from server.", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  v8 = (uint64_t (__cdecl *)())((char *)&dword_100043610 + dword_100043610);
  v6 = (_QWORD *)swift_task_alloc(unk_100043614);
  *(_QWORD *)(v0 + 256) = v6;
  *v6 = v0;
  v6[1] = sub_100011240;
  return v8();
}

uint64_t sub_100011240()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 256));
  return swift_task_switch(sub_10001128C, *(_QWORD *)(v1 + 232), *(_QWORD *)(v1 + 240));
}

uint64_t sub_10001128C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD);
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v1 = swift_release(*(_QWORD *)(v0 + 224));
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Running prox card flow engine", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }
  v5 = *(_QWORD *)(v0 + 216);

  v6 = v5 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow;
  swift_beginAccess(v5 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow, v0 + 168, 33, 0);
  v7 = *(_QWORD *)(v6 + 24);
  v8 = *(_QWORD *)(v6 + 32);
  sub_100017C44(v6, v7);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v0 + 136, v7, v8);
  if (*(_QWORD *)(*(_QWORD *)v10 + 16))
  {
    v11 = (void (*)(uint64_t, _QWORD))result;
    v12 = *(_QWORD *)(v0 + 216);
    v13 = *(_BYTE *)(*(_QWORD *)v10 + 32);
    sub_10000E51C(0, 1);
    v11(v0 + 136, 0);
    swift_endAccess(v0 + 168);
    sub_100012FC8(v13);
    sub_10000B978(v0 + 16, v0 + 56);
    v14 = v12 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage;
    swift_beginAccess(v12 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage, v0 + 192, 33, 0);
    sub_1000181E8(v0 + 56, v14);
    swift_endAccess(v0 + 192);
    v15 = *(_QWORD *)(v0 + 40);
    v16 = *(_QWORD *)(v0 + 48);
    sub_10000FED4((_QWORD *)(v0 + 16), v15);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16);
    v17 = *(_QWORD *)(v0 + 120);
    v18 = *(_QWORD *)(v0 + 128);
    sub_10000FED4((_QWORD *)(v0 + 96), v17);
    v19 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v17, v18);
    sub_10000BD34(v19);

    sub_10000B6F0((_QWORD *)(v0 + 96));
    if (*(_BYTE *)(v12 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_shouldSimulate) == 1)
      sub_1000114E8();
    else
      sub_100011A0C(v0 + 16);
    sub_10000B6F0((_QWORD *)(v0 + 16));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000114E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  _BYTE v39[24];
  _QWORD v40[3];
  uint64_t v41;
  uint64_t v42;

  v1 = v0;
  v2 = sub_100006CA0(&qword_100042B40);
  __chkstk_darwin(v2);
  v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006CA0(&qword_100042B80);
  v37 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100006CA0(&qword_100042B88);
  __chkstk_darwin(v8);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = v0 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow;
  swift_beginAccess(v11, v39, 0, 0);
  sub_10000B978(v11, (uint64_t)v40);
  v13 = v41;
  v12 = v42;
  sub_10000FED4(v40, v41);
  v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v13, v12);
  sub_10000B6F0(v40);
  v36 = *(_QWORD *)(v14 + 16);
  swift_bridgeObjectRelease(v14);
  v15 = swift_allocObject(&unk_100039BB8, 24, 7);
  *(_QWORD *)(v15 + 16) = 0;
  sub_100006D24(0, &qword_100042B90, NSTimer_ptr);
  v16 = objc_msgSend((id)objc_opt_self(NSRunLoop), "mainRunLoop");
  v17 = type metadata accessor for NSRunLoop.SchedulerOptions(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v10, 1, 1, v17);
  v18 = static NSTimer.publish(every:tolerance:on:in:options:)(0, 1, v16, NSDefaultRunLoopMode, v10, 7.0);

  sub_10000FE98((uint64_t)v10, &qword_100042B88);
  v40[0] = v18;
  v19 = type metadata accessor for NSTimer.TimerPublisher(0);
  v20 = sub_100006E48(&qword_100042B98, (uint64_t (*)(uint64_t))&type metadata accessor for NSTimer.TimerPublisher, (uint64_t)&protocol conformance descriptor for NSTimer.TimerPublisher);
  v21 = ConnectablePublisher.autoconnect()(v19, v20);
  swift_release(v18);
  v40[0] = v21;
  v38 = *(id *)(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  v22 = v38;
  v23 = type metadata accessor for OS_dispatch_queue.SchedulerOptions(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v4, 1, 1, v23);
  v24 = v22;
  v25 = sub_100006CA0(&qword_100042BA0);
  v26 = sub_100006D24(0, (unint64_t *)&qword_100041FD0, OS_dispatch_queue_ptr);
  v27 = sub_100006D5C(&qword_100042BA8, &qword_100042BA0, (uint64_t)&protocol conformance descriptor for Publishers.Autoconnect<A>);
  v28 = sub_100018288();
  Publisher.receive<A>(on:options:)(&v38, v4, v25, v26, v27, v28);
  sub_10000FE98((uint64_t)v4, &qword_100042B40);

  v29 = swift_allocObject(&unk_100039AF0, 24, 7);
  swift_unknownObjectWeakInit(v29 + 16, v1);
  v30 = (_QWORD *)swift_allocObject(&unk_100039BE0, 48, 7);
  v30[2] = v29;
  v30[3] = v15;
  v30[4] = v36;
  v30[5] = v21;
  v31 = sub_100006D5C(&qword_100042BB0, &qword_100042B80, (uint64_t)&protocol conformance descriptor for Publishers.ReceiveOn<A, B>);
  swift_retain(v15);
  swift_retain(v21);
  v32 = Publisher<>.sink(receiveValue:)(sub_100018374, v30, v5, v31);
  swift_release(v30);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v7, v5);
  v33 = v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_cancellables;
  swift_beginAccess(v33, v40, 33, 0);
  AnyCancellable.store(in:)(v33);
  swift_endAccess(v40);
  swift_release(v32);
  swift_release(v21);
  return swift_release(v15);
}

uint64_t sub_100011914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t Strong;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[24];
  _BYTE v20[24];

  v5 = a2 + 16;
  v6 = (_QWORD *)(a3 + 16);
  swift_beginAccess(a2 + 16, v20, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v8 = (void *)Strong;
    sub_1000122D0();

  }
  v9 = swift_beginAccess(v6, v19, 0, 0);
  if (*v6 == a4)
  {
    v10 = Publishers.Autoconnect.upstream.getter(&v15, v9);
    v11 = v15;
    NSTimer.TimerPublisher.connect()(v16, v10);
    swift_release(v11);
    v12 = v17;
    v13 = v18;
    sub_10000FED4(v16, v17);
    dispatch thunk of Cancellable.cancel()(v12, v13);
    return sub_10000B6F0(v16);
  }
  else
  {
    result = swift_beginAccess(v6, v16, 1, 0);
    if (__OFADD__(*v6, 1))
      __break(1u);
    else
      ++*v6;
  }
  return result;
}

void sub_100011A0C(uint64_t a1)
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
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60[2];
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[3];
  uint64_t v66;
  uint64_t v67;

  v2 = v1;
  v4 = sub_100006CA0(&qword_100042B40);
  __chkstk_darwin(v4);
  v6 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100006CA0(&qword_100042B48);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B978(a1, (uint64_t)&v62);
  v11 = sub_100006CA0(&qword_100042B50);
  v12 = sub_100006CA0(&qword_100042B58);
  if (swift_dynamicCast(v60, &v62, v11, v12, 6))
  {
    sub_10001830C(v60, (uint64_t)v65);
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v57 = v8;
    v58 = v7;
    v13 = type metadata accessor for Logger(0);
    sub_100006C44(v13, (uint64_t)qword_100044E40);
    v14 = sub_10000B978(a1, (uint64_t)&v62);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc(12, -1);
      v18 = swift_slowAlloc(32, -1);
      v55 = a1;
      v19 = v18;
      *(_QWORD *)&v60[0] = v18;
      v56 = v2;
      *(_DWORD *)v17 = 136446210;
      v54 = v17 + 4;
      v20 = v63;
      v21 = v64;
      sub_10000FED4(&v62, v63);
      v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 56))(v20, v21);
      v23 = sub_100027318(v22);
      v25 = v24;
      v59 = sub_100020FBC(v23, v24, (uint64_t *)v60);
      v2 = v56;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, v60);
      swift_bridgeObjectRelease(v25);
      sub_10000B6F0(&v62);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Subscribing to completion status for %{public}s stage", v17, 0xCu);
      swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
      v26 = v19;
      a1 = v55;
      swift_slowDealloc(v26, -1, -1);
      swift_slowDealloc(v17, -1, -1);
    }
    else
    {
      sub_10000B6F0(&v62);
    }

    v39 = v66;
    v40 = v67;
    sub_10000FED4(v65, v66);
    *(_QWORD *)&v62 = (*(uint64_t (**)(uint64_t, uint64_t))(v40 + 8))(v39, v40);
    *(_QWORD *)&v60[0] = *(_QWORD *)(v2 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
    v41 = *(void **)&v60[0];
    v42 = type metadata accessor for OS_dispatch_queue.SchedulerOptions(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v6, 1, 1, v42);
    v43 = v41;
    v44 = sub_100006CA0(&qword_100042B30);
    v45 = sub_100006D24(0, (unint64_t *)&qword_100041FD0, OS_dispatch_queue_ptr);
    v46 = sub_100006D5C(&qword_100042B68, &qword_100042B30, (uint64_t)&protocol conformance descriptor for PassthroughSubject<A, B>);
    v47 = sub_100018288();
    Publisher.receive<A>(on:options:)(v60, v6, v44, v45, v46, v47);
    sub_10000FE98((uint64_t)v6, &qword_100042B40);

    swift_release(v62);
    v48 = swift_allocObject(&unk_100039AF0, 24, 7);
    swift_unknownObjectWeakInit(v48 + 16, v2);
    sub_10000B978(a1, (uint64_t)&v62);
    v49 = swift_allocObject(&unk_100039B90, 64, 7);
    sub_10001830C(&v62, v49 + 16);
    *(_QWORD *)(v49 + 56) = v48;
    v50 = sub_100006D5C(&qword_100042B78, &qword_100042B48, (uint64_t)&protocol conformance descriptor for Publishers.ReceiveOn<A, B>);
    v51 = v58;
    v52 = Publisher<>.sink(receiveValue:)(sub_100018324, v49, v58, v50);
    swift_release(v49);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v10, v51);
    v53 = v2 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_cancellables;
    swift_beginAccess(v2 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_cancellables, &v62, 33, 0);
    AnyCancellable.store(in:)(v53);
    swift_endAccess(&v62);
    swift_release(v52);
    sub_10000B6F0(v65);
  }
  else
  {
    v61 = 0;
    memset(v60, 0, sizeof(v60));
    sub_10000FE98((uint64_t)v60, &qword_100042B60);
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v27 = type metadata accessor for Logger(0);
    sub_100006C44(v27, (uint64_t)qword_100044E40);
    v28 = sub_10000B978(a1, (uint64_t)v65);
    v29 = Logger.logObject.getter(v28);
    v30 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc(12, -1);
      v32 = swift_slowAlloc(32, -1);
      *(_QWORD *)&v62 = v32;
      *(_DWORD *)v31 = 136446210;
      v33 = v66;
      v34 = v67;
      sub_10000FED4(v65, v66);
      v35 = (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 56))(v33, v34);
      v36 = sub_100027318(v35);
      v38 = v37;
      *(_QWORD *)&v60[0] = sub_100020FBC(v36, v37, (uint64_t *)&v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v60, (char *)v60 + 8);
      swift_bridgeObjectRelease(v38);
      sub_10000B6F0(v65);
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "%{public}s stage is not subscribable", v31, 0xCu);
      swift_arrayDestroy(v32, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v32, -1, -1);
      swift_slowDealloc(v31, -1, -1);
    }
    else
    {
      sub_10000B6F0(v65);
    }

  }
}

void sub_100012020(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t Strong;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[3];
  uint64_t v28;
  uint64_t v29;

  v5 = *a1;
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v6 = a3 + 16;
  v7 = type metadata accessor for Logger(0);
  sub_100006C44(v7, (uint64_t)qword_100044E40);
  v8 = sub_10000B978(a2, (uint64_t)v27);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc(22, -1);
    v12 = swift_slowAlloc(64, -1);
    v26 = v12;
    *(_DWORD *)v11 = 136315394;
    v13 = 0x6E776F6E6B6E75;
    if (v5 != 1)
      v13 = 0x73736563637573;
    if (v5)
      v14 = v13;
    else
      v14 = 0x64656C696166;
    if (v5)
      v15 = 0xE700000000000000;
    else
      v15 = 0xE600000000000000;
    v25 = sub_100020FBC(v14, v15, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26);
    swift_bridgeObjectRelease(v15);
    *(_WORD *)(v11 + 12) = 2082;
    v16 = v28;
    v17 = v29;
    sub_10000FED4(v27, v28);
    v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 56))(v16, v17);
    v19 = sub_100027318(v18);
    v21 = v20;
    v25 = sub_100020FBC(v19, v20, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26);
    swift_bridgeObjectRelease(v21);
    sub_10000B6F0(v27);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Received status: %s, for %{public}s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy(v12, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

  }
  else
  {
    sub_10000B6F0(v27);

  }
  if (v5 == 2)
  {
    swift_beginAccess(v6, v27, 0, 0);
    Strong = swift_unknownObjectWeakLoadStrong(v6);
    if (!Strong)
      return;
    v23 = (void *)Strong;
    sub_1000122D0(Strong);
  }
  else
  {
    swift_beginAccess(v6, v27, 0, 0);
    v24 = swift_unknownObjectWeakLoadStrong(v6);
    if (!v24)
      return;
    v23 = (void *)v24;
    sub_100013BD4();
  }

}

uint64_t sub_1000122D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];
  uint64_t v16;
  void *v17;
  _QWORD aBlock[5];
  uint64_t v19;

  v1 = type metadata accessor for DispatchWorkItemFlags(0);
  v16 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[1] = *(_QWORD *)(v0 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  v8 = swift_allocObject(&unk_100039AF0, 24, 7);
  swift_unknownObjectWeakInit(v8 + 16, v0);
  aBlock[4] = sub_100018254;
  v19 = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005DCC;
  aBlock[3] = &unk_100039B08;
  v9 = _Block_copy(aBlock);
  v10 = swift_retain(v8);
  static DispatchQoS.unspecified.getter(v10);
  v17 = &_swiftEmptyArrayStorage;
  v11 = sub_100006E48((unint64_t *)&qword_100042630, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v12 = sub_100006CA0((uint64_t *)&unk_100041FE0);
  v13 = sub_100006D5C((unint64_t *)&qword_100042640, (uint64_t *)&unk_100041FE0, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v17, v12, v13, v1, v11);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v7, v3, v9);
  _Block_release(v9);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_release(v19);
  return swift_release(v8);
}

void sub_1000124E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t Strong;
  _BYTE *v11;
  uint64_t v12;
  void *v13;
  uint64_t (*v14)();
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t (*v19)();
  unsigned __int8 v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  id v32;
  void *v33;
  uint64_t (*v34)();
  uint64_t v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(_QWORD *, _QWORD);
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE v58[24];
  _QWORD aBlock[3];
  void *v60;
  uint64_t (*v61)();
  uint64_t v62;
  char v63[24];
  char v64[24];
  char v65[32];

  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  swift_beginAccess(a1, v65, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (!Strong)
  {
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v22 = type metadata accessor for Logger(0);
    v23 = sub_100006C44(v22, (uint64_t)qword_100044E40);
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "ProxCard flow engine is unexpectedly deallocated.", v26, 2u);
      swift_slowDealloc(v26, -1, -1);
    }

    return;
  }
  v11 = (_BYTE *)Strong;
  v57 = v7;
  v12 = Strong + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow;
  swift_beginAccess(Strong + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow, v64, 0, 0);
  sub_10000B978(v12, (uint64_t)aBlock);
  v13 = v60;
  v14 = v61;
  sub_10000FED4(aBlock, (uint64_t)v60);
  v15 = (*((uint64_t (**)(void *, uint64_t (*)()))v14 + 1))(v13, v14);
  sub_10000B6F0(aBlock);
  v16 = *(_QWORD *)(v15 + 16);
  swift_bridgeObjectRelease(v15);
  if (!v16)
  {
    v11[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_engineFlowProgress] = 2;
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v27 = type metadata accessor for Logger(0);
    v28 = sub_100006C44(v27, (uint64_t)qword_100044E40);
    v29 = Logger.logObject.getter(v28);
    v30 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Finished running proximity setup", v31, 2u);
      swift_slowDealloc(v31, -1, -1);
    }

    v32 = *(id *)&v11[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_presenter];
    sub_10000CEA4(1);

    return;
  }
  v17 = (uint64_t)&v11[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage];
  swift_beginAccess(&v11[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage], v63, 0, 0);
  sub_1000180F4(v17, (uint64_t)aBlock);
  v18 = v60;
  if (v60)
  {
    v19 = v61;
    sub_10000FED4(aBlock, (uint64_t)v60);
    v20 = (*((uint64_t (**)(void *, uint64_t (*)()))v19 + 7))(v18, v19);
    sub_10000FE98((uint64_t)aBlock, &qword_100042B20);
    v21 = *(id *)&v11[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_interactionEventPublisher];
    sub_100009FE0(v20);

  }
  else
  {
    sub_10000FE98((uint64_t)aBlock, &qword_100042B20);
  }
  v56 = v3;
  if (v11[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_hasReceivedServerInteractionEvent] != 1)
    goto LABEL_25;
  sub_10000B978(v12, (uint64_t)aBlock);
  v33 = v60;
  v34 = v61;
  sub_10000FED4(aBlock, (uint64_t)v60);
  v35 = (*((uint64_t (**)(void *, uint64_t (*)()))v34 + 1))(v33, v34);
  sub_10000B6F0(aBlock);
  if (!*(_QWORD *)(v35 + 16))
  {
    swift_bridgeObjectRelease(v35);
    goto LABEL_25;
  }
  v36 = *(_BYTE *)(v35 + 32);
  swift_bridgeObjectRelease(v35);
  v37 = sub_1000271E4(v36);
  v39 = v38;
  if (v37 != 0x7463757274736E69 || v38 != 0xEB000000006E6F69)
  {
    v40 = _stringCompareWithSmolCheck(_:_:expecting:)(v37, v38, 0x7463757274736E69, 0xEB000000006E6F69, 0);
    swift_bridgeObjectRelease(v39);
    if ((v40 & 1) != 0)
      goto LABEL_23;
LABEL_25:
    sub_100006D24(0, (unint64_t *)&qword_100041FD0, OS_dispatch_queue_ptr);
    v46 = (void *)static OS_dispatch_queue.main.getter();
    v47 = swift_allocObject(&unk_100039B40, 24, 7);
    *(_QWORD *)(v47 + 16) = v11;
    v61 = sub_100018280;
    v62 = v47;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100005DCC;
    v60 = &unk_100039B58;
    v48 = _Block_copy(aBlock);
    v49 = v62;
    v50 = v11;
    v51 = swift_release(v49);
    static DispatchQoS.unspecified.getter(v51);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v52 = sub_100006E48((unint64_t *)&qword_100042630, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v53 = sub_100006CA0((uint64_t *)&unk_100041FE0);
    v54 = sub_100006D5C((unint64_t *)&qword_100042640, (uint64_t *)&unk_100041FE0, (uint64_t)&protocol conformance descriptor for [A]);
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v53, v54, v2, v52);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v5, v48);
    _Block_release(v48);

    (*(void (**)(char *, uint64_t))(v56 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v9, v6);
    return;
  }
  swift_bridgeObjectRelease(0xEB000000006E6F69);
LABEL_23:
  swift_beginAccess(v12, v58, 33, 0);
  v41 = *(_QWORD *)(v12 + 24);
  v42 = *(_QWORD *)(v12 + 32);
  sub_100017C44(v12, v41);
  v43 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v42 + 24))(aBlock, v41, v42);
  if (*(_QWORD *)(*(_QWORD *)v44 + 16))
  {
    v45 = (void (*)(_QWORD *, _QWORD))v43;
    sub_10000E51C(0, 1);
    v45(aBlock, 0);
    swift_endAccess(v58);
    goto LABEL_25;
  }
  __break(1u);
}

uint64_t sub_100012B34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  void (*v6)(_BYTE *, _QWORD);
  unsigned __int8 v7;
  _BYTE v8[32];
  _BYTE v9[24];

  v1 = a1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow;
  swift_beginAccess(a1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow, v9, 33, 0);
  v2 = *(_QWORD *)(v1 + 24);
  v3 = *(_QWORD *)(v1 + 32);
  sub_100017C44(v1, v2);
  result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v3 + 24))(v8, v2, v3);
  if (*(_QWORD *)(*(_QWORD *)v5 + 16))
  {
    v6 = (void (*)(_BYTE *, _QWORD))result;
    v7 = *(_BYTE *)(*(_QWORD *)v5 + 32);
    sub_10000E51C(0, 1);
    v6(v8, 0);
    swift_endAccess(v9);
    return sub_100012BF0(v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100012BF0(unsigned __int8 a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v33;
  uint64_t v34[3];
  _QWORD v35[3];
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[3];
  uint64_t v39;
  uint64_t v40;

  v2 = v1;
  v4 = type metadata accessor for DispatchPredicate(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (uint64_t *)((char *)&v34[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100006D24(0, (unint64_t *)&qword_100041FD0, OS_dispatch_queue_ptr);
  *v7 = static OS_dispatch_queue.main.getter();
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for DispatchPredicate.onQueue(_:), v4);
  v8 = _dispatchPreconditionTest(_:)(v7);
  (*(void (**)(_QWORD *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) != 0)
  {
    sub_100012FC8(a1);
    sub_10000B978((uint64_t)v38, (uint64_t)v35);
    v9 = (uint64_t)&v2[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage];
    swift_beginAccess(&v2[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage], v34, 33, 0);
    sub_1000181E8((uint64_t)v35, v9);
    swift_endAccess(v34);
    sub_100011A0C((uint64_t)v38);
    if (qword_100041E50 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once(&qword_100041E50, sub_10001A2E8);
LABEL_3:
  v10 = type metadata accessor for Logger(0);
  sub_100006C44(v10, (uint64_t)qword_100044E40);
  sub_10000B978((uint64_t)v38, (uint64_t)v35);
  v11 = v2;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(22, -1);
    v15 = swift_slowAlloc(64, -1);
    v34[0] = v15;
    *(_DWORD *)v14 = 136315394;
    v16 = v36;
    v17 = v37;
    sub_10000FED4(v35, v36);
    v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 56))(v16, v17);
    v19 = sub_1000271E4(v18);
    v21 = v20;
    v33 = sub_100020FBC(v19, v20, v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, v34);
    swift_bridgeObjectRelease(v21);
    sub_10000B6F0(v35);
    *(_WORD *)(v14 + 12) = 2080;
    v22 = *(void **)(*(_QWORD *)&v11[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_presenter]
                   + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_navigationController);
    if (v22)
    {
      v23 = objc_msgSend(v22, "description");
      v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
      v26 = v25;

    }
    else
    {
      v26 = 0xE300000000000000;
      v24 = 7104878;
    }
    v33 = sub_100020FBC(v24, v26, v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, v34);
    swift_bridgeObjectRelease(v26);

    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Pushing %s on to navigation controller %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy(v15, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v14, -1, -1);
  }
  else
  {
    sub_10000B6F0(v35);

  }
  v27 = v39;
  v28 = v40;
  sub_10000FED4(v38, v39);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v28 + 8))(v35, v27, v28);
  v29 = v36;
  v30 = v37;
  sub_10000FED4(v35, v36);
  v31 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v30 + 8))(v29, v30);
  sub_10000C3B8(v31, 1);

  sub_10000B6F0(v35);
  return sub_10000B6F0(v38);
}

void sub_100012FC8(unsigned __int8 a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100006C44(v2, (uint64_t)qword_100044E40);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v12 = v7;
    *(_DWORD *)v6 = 136446210;
    v8 = sub_100027318(a1);
    v10 = v9;
    v11 = sub_100020FBC(v8, v9, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12);
    swift_bridgeObjectRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Generate proximity stage for %{public}s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }

  __asm { BR              X10 }
}

void sub_10001373C(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  id v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  unint64_t v19;
  __CFString *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];
  uint64_t v35;
  uint64_t v36;

  v3 = v2;
  v6 = type metadata accessor for DispatchPredicate(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (_QWORD *)((char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = *(void **)(v3 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *v9 = v10;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for DispatchPredicate.onQueue(_:), v6);
  v11 = v10;
  v12 = _dispatchPreconditionTest(_:)(v9);
  (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v9, v6);
  if ((v12 & 1) != 0)
  {
    if (qword_100041E50 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once(&qword_100041E50, sub_10001A2E8);
LABEL_3:
  v13 = type metadata accessor for Logger(0);
  v14 = sub_100006C44(v13, (uint64_t)qword_100044E40);
  v15 = swift_bridgeObjectRetain_n(a2, 2);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc(22, -1);
    v34[0] = swift_slowAlloc(64, -1);
    v36 = v34[0];
    *(_DWORD *)v18 = 136446466;
    v19 = a1;
    v20 = sub_10001817C(a1);
    v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
    v34[1] = v14;
    v23 = v22;

    a1 = v19;
    v35 = sub_100020FBC(v21, v23, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36);
    swift_bridgeObjectRelease(v23);
    *(_WORD *)(v18 + 12) = 2082;
    v35 = a2;
    swift_bridgeObjectRetain(a2);
    v24 = sub_100006CA0(&qword_100042B28);
    v25 = String.init<A>(describing:)(&v35, v24);
    v27 = v26;
    v35 = sub_100020FBC(v25, v26, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36);
    swift_bridgeObjectRelease(v27);
    swift_bridgeObjectRelease_n(a2, 2);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Received progress setup event: %{public}s, with info: %{public}s", (uint8_t *)v18, 0x16u);
    v28 = v34[0];
    swift_arrayDestroy(v34[0], 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v28, -1, -1);
    swift_slowDealloc(v18, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(a2, 2);
  }

  switch(a1)
  {
    case 0uLL:
      sub_100014ED4();
      break;
    case 1uLL:
      sub_100014A3C(a2);
      break;
    case 2uLL:
    case 4uLL:
    case 0xEuLL:
      sub_100013BD4();
      break;
    case 3uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
      return;
    case 5uLL:
      sub_100014088();
      break;
    case 6uLL:
      sub_1000141E4();
      break;
    case 0xFuLL:
      sub_100014D50();
      break;
    default:
      v30 = Logger.logObject.getter(v29);
      v31 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v30, v31))
      {
        v32 = swift_slowAlloc(22, -1);
        v33 = swift_slowAlloc(32, -1);
        v36 = v33;
        *(_DWORD *)v32 = 136446466;
        v35 = sub_100020FBC(0xD000000000000022, 0x800000010002F4B0, &v36);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36);
        *(_WORD *)(v32 + 12) = 2050;
        v35 = a1;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36);
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "%{public}s received unknown setup progress event: %{public}ld", (uint8_t *)v32, 0x16u);
        swift_arrayDestroy(v33, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v33, -1, -1);
        swift_slowDealloc(v32, -1, -1);
      }

      break;
  }
}

void sub_100013BD4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(_QWORD *, _QWORD);
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  _BYTE v41[24];
  _BYTE v42[24];
  _QWORD v43[3];
  uint64_t v44;
  uint64_t v45;

  v1 = v0;
  v2 = (char *)type metadata accessor for DispatchPredicate(0);
  v3 = *((_QWORD *)v2 - 1);
  __chkstk_darwin(v2);
  v5 = &v41[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v6 = type metadata accessor for Logger(0);
  v7 = (_QWORD *)sub_100006C44(v6, (uint64_t)qword_100044E40);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Failure UI requested", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  v11 = *(void **)(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *v5 = v11;
  (*(void (**)(_QWORD *, _QWORD, char *))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  v12 = v11;
  v13 = _dispatchPreconditionTest(_:)(v5);
  (*(void (**)(_QWORD *, char *))(v3 + 8))(v5, v2);
  if ((v13 & 1) == 0)
  {
    __break(1u);
LABEL_22:
    v2 = sub_10000E1E0(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
    *v7 = v2;
    goto LABEL_15;
  }
  v14 = v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage;
  swift_beginAccess(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage, v42, 0, 0);
  sub_1000180F4(v14, (uint64_t)v43);
  v15 = v44;
  if (v44)
  {
    v16 = v45;
    sub_10000FED4(v43, v44);
    v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 56))(v15, v16);
    sub_10000FE98((uint64_t)v43, &qword_100042B20);
    v18 = sub_1000271E4(v17);
    v20 = v19;
    if (v18 == 0x6974656C706D6F63 && v19 == 0xEA00000000006E6FLL)
    {
      v21 = swift_bridgeObjectRelease(0xEA00000000006E6FLL);
      v22 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_engineFlowProgress) == 2;
      LOBYTE(v15) = 1;
      goto LABEL_18;
    }
    LOBYTE(v15) = _stringCompareWithSmolCheck(_:_:expecting:)(v18, v19, 0x6974656C706D6F63, 0xEA00000000006E6FLL, 0);
    v21 = swift_bridgeObjectRelease(v20);
  }
  else
  {
    v21 = sub_10000FE98((uint64_t)v43, &qword_100042B20);
  }
  v23 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_engineFlowProgress);
  v22 = v23 == 2;
  if (v23 == 2 || (v15 & 1) != 0)
  {
LABEL_18:
    v37 = Logger.logObject.getter(v21);
    v38 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = swift_slowAlloc(14, -1);
      *(_DWORD *)v39 = 67109376;
      LODWORD(v43[0]) = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v43, (char *)v43 + 4);
      *(_WORD *)(v39 + 8) = 1024;
      LODWORD(v43[0]) = v15 & 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v43, (char *)v43 + 4);
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Ignoring failure and not showing failure prox card: setup is already complete. (Engine finished:%{BOOL}d, Completion card:%{BOOL}d)", (uint8_t *)v39, 0xEu);
      swift_slowDealloc(v39, -1, -1);
    }

    return;
  }
  v24 = v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow;
  swift_beginAccess(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow, v41, 33, 0);
  v25 = *(_QWORD *)(v24 + 24);
  v26 = *(_QWORD *)(v24 + 32);
  sub_100017C44(v24, v25);
  v27 = (void (*)(_QWORD *, _QWORD))(*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v26 + 24))(v43, v25, v26);
  v29 = *v28;
  *v28 = (uint64_t)&_swiftEmptyArrayStorage;
  v27(v43, 0);
  swift_endAccess(v41);
  swift_bridgeObjectRelease(v29);
  swift_beginAccess(v24, v41, 33, 0);
  v30 = *(_QWORD *)(v24 + 24);
  v31 = *(_QWORD *)(v24 + 32);
  sub_100017C44(v24, v30);
  v13 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v31 + 24))(v43, v30, v31);
  v7 = v32;
  v2 = (char *)*v32;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v32);
  *v7 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    goto LABEL_22;
LABEL_15:
  v35 = *((_QWORD *)v2 + 2);
  v34 = *((_QWORD *)v2 + 3);
  if (v35 >= v34 >> 1)
  {
    v2 = sub_10000E1E0((char *)(v34 > 1), v35 + 1, 1, v2);
    *v7 = v2;
  }
  *((_QWORD *)v2 + 2) = v35 + 1;
  v2[v35 + 32] = 9;
  ((void (*)(_QWORD *, _QWORD))v13)(v43, 0);
  v36 = swift_endAccess(v41);
  sub_1000122D0(v36);
}

void sub_100014088()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;

  v1 = type metadata accessor for DispatchPredicate(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (uint64_t *)((char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = *(void **)(v0 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *v4 = v5;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v2 + 104))(v4, enum case for DispatchPredicate.onQueue(_:), v1);
  v6 = v5;
  LOBYTE(v5) = _dispatchPreconditionTest(_:)(v4);
  (*(void (**)(_QWORD *, uint64_t))(v2 + 8))(v4, v1);
  if ((v5 & 1) != 0)
  {
    if (qword_100041E50 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once(&qword_100041E50, sub_10001A2E8);
LABEL_3:
  v7 = type metadata accessor for Logger(0);
  v8 = sub_100006C44(v7, (uint64_t)qword_100044E40);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "eventSecurityStart is received", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

}

uint64_t sub_1000141E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(_BYTE *, _QWORD);
  uint64_t *v13;
  uint64_t v14;
  _QWORD v16[3];
  _BYTE v17[32];
  _BYTE v18[24];

  v1 = v0;
  v2 = type metadata accessor for DispatchPredicate(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (_QWORD *)((char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(void **)(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *v5 = v6;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  v7 = v6;
  LOBYTE(v6) = _dispatchPreconditionTest(_:)(v5);
  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0)
  {
    __break(1u);
    JUMPOUT(0x100014988);
  }
  v8 = v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow;
  swift_beginAccess(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow, v18, 33, 0);
  v9 = *(_QWORD *)(v8 + 24);
  v10 = *(_QWORD *)(v8 + 32);
  sub_100017C44(v8, v9);
  v11 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v10 + 24))(v17, v9, v10);
  v12 = (void (*)(_BYTE *, _QWORD))v11;
  v14 = *v13;
  if (*(_QWORD *)(*v13 + 16))
  {
    v16[0] = v11;
    v16[1] = v1;
    swift_bridgeObjectRetain(v14);
    v16[2] = "AIN";
    __asm { BR              X8 }
  }
  sub_10000E51C(0, 0);
  v12(v17, 0);
  swift_endAccess(v18);
  return sub_1000122D0();
}

uint64_t sub_100014A3C(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD v25[3];
  _BYTE v26[8];
  _QWORD v27[2];
  uint64_t v28[5];
  __int128 v29;
  __int128 v30;

  v3 = v1;
  v5 = type metadata accessor for DispatchPredicate(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (_QWORD *)((char *)&v25[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *(void **)(v3 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *v8 = v9;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  v10 = v9;
  LOBYTE(v9) = _dispatchPreconditionTest(_:)(v8);
  (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) == 0)
  {
    __break(1u);
LABEL_18:
    swift_once(&qword_100041E50, sub_10001A2E8);
    goto LABEL_10;
  }
  if (!a1)
  {
    v29 = 0u;
    v30 = 0u;
    return sub_10000FE98((uint64_t)&v29, &qword_100042650);
  }
  v27[0] = 28517;
  v27[1] = 0xE200000000000000;
  AnyHashable.init<A>(_:)(v28, v27, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(a1 + 16) && (v11 = sub_100021834((uint64_t)v28), (v12 & 1) != 0))
  {
    sub_100017C08(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)&v29);
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
  }
  sub_100017BD4((uint64_t)v28);
  if (!*((_QWORD *)&v30 + 1))
    return sub_10000FE98((uint64_t)&v29, &qword_100042650);
  v13 = sub_100006CA0(&qword_100042178);
  v2 = (char *)&type metadata for Any;
  result = swift_dynamicCast(v28, &v29, (char *)&type metadata for Any + 8, v13, 6);
  if ((result & 1) == 0)
    return result;
  v5 = v28[0];
  if (qword_100041E50 != -1)
    goto LABEL_18;
LABEL_10:
  v15 = type metadata accessor for Logger(0);
  sub_100006C44(v15, (uint64_t)qword_100044E40);
  swift_errorRetain(v5);
  v16 = swift_errorRetain(v5);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc(12, -1);
    v20 = swift_slowAlloc(32, -1);
    v28[0] = v20;
    *(_DWORD *)v19 = 136446210;
    swift_getErrorValue(v5, v26, v25);
    v21 = Error.localizedDescription.getter(v25[1], v25[2]);
    v23 = v22;
    *(_QWORD *)&v29 = sub_100020FBC(v21, v22, v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, (char *)&v29 + 8);
    swift_bridgeObjectRelease(v23);
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Presenting failed stage due to error: %{public}s", v19, 0xCu);
    swift_arrayDestroy(v20, 1, v2 + 8);
    swift_slowDealloc(v20, -1, -1);
    swift_slowDealloc(v19, -1, -1);
  }
  else
  {
    swift_errorRelease(v5);
    swift_errorRelease(v5);
  }

  sub_100013BD4();
  return swift_errorRelease(v5);
}

void sub_100014D50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;

  v1 = type metadata accessor for DispatchPredicate(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (uint64_t *)((char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = *(void **)(v0 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *v4 = v5;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v2 + 104))(v4, enum case for DispatchPredicate.onQueue(_:), v1);
  v6 = v5;
  LOBYTE(v5) = _dispatchPreconditionTest(_:)(v4);
  (*(void (**)(_QWORD *, uint64_t))(v2 + 8))(v4, v1);
  if ((v5 & 1) == 0)
  {
    __break(1u);
LABEL_9:
    swift_once(&qword_100041E50, sub_10001A2E8);
    goto LABEL_4;
  }
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_hasReceivedSetupCompletedEvent) & 1) == 0)
  {
    *(_BYTE *)(v0 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_hasReceivedSetupCompletedEvent) = 1;
    sub_1000122D0();
    return;
  }
  if (qword_100041E50 != -1)
    goto LABEL_9;
LABEL_4:
  v7 = type metadata accessor for Logger(0);
  v8 = sub_100006C44(v7, (uint64_t)qword_100044E40);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Already received setup completed event. Ignoring setup completed event.", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

}

void sub_100014ED4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;

  v1 = v0;
  v2 = type metadata accessor for DispatchPredicate(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (uint64_t *)((char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(void **)(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *v5 = v6;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  v7 = v6;
  LOBYTE(v6) = _dispatchPreconditionTest(_:)(v5);
  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) != 0)
  {
    if (qword_100041E50 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once(&qword_100041E50, sub_10001A2E8);
LABEL_3:
  v8 = type metadata accessor for Logger(0);
  v9 = sub_100006C44(v8, (uint64_t)qword_100044E40);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Setup started event received. Transitioning the engine flow progress to running. ", v12, 2u);
    swift_slowDealloc(v12, -1, -1);
  }

  *(_BYTE *)(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_engineFlowProgress) = 1;
}

void sub_10001504C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  __CFString *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t *, _QWORD);
  uint64_t *v57;
  uint64_t v58;
  _QWORD v59[2];
  uint64_t v60;
  _BYTE v61[24];
  uint64_t v62;
  _BYTE v63[16];
  uint64_t v64[3];
  uint64_t v65;
  uint64_t v66;

  v2 = v1;
  v4 = type metadata accessor for DispatchPredicate(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (_QWORD *)((char *)v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = *(void **)(v2 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *v7 = v8;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for DispatchPredicate.onQueue(_:), v4);
  v9 = v8;
  LOBYTE(v8) = _dispatchPreconditionTest(_:)(v7);
  (*(void (**)(_QWORD *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) != 0)
  {
    if (qword_100041E50 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once(&qword_100041E50, sub_10001A2E8);
LABEL_3:
  v10 = type metadata accessor for Logger(0);
  v11 = sub_100006C44(v10, (uint64_t)qword_100044E40);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v15 = swift_slowAlloc(32, -1);
    v60 = v2;
    v16 = v15;
    v64[0] = v15;
    v59[1] = v11;
    *(_DWORD *)v14 = 136446210;
    v17 = sub_10001813C(a1);
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
    v20 = v19;

    v62 = sub_100020FBC(v18, v20, v64);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, v63);
    swift_bridgeObjectRelease(v20);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Received server user interaction event: (%{public}s)", v14, 0xCu);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    v21 = v16;
    v2 = v60;
    swift_slowDealloc(v21, -1, -1);
    swift_slowDealloc(v14, -1, -1);
  }

  if (a1 == 1)
  {
    v32 = sub_100015BC0();
    v23 = Logger.logObject.getter(v32);
    v33 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v23, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v33, "User chose pin pairing setup. ", v34, 2u);
      v35 = (uint64_t)v34;
LABEL_15:
      swift_slowDealloc(v35, -1, -1);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (a1)
  {
    v23 = Logger.logObject.getter(v22);
    v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v36))
    {
      v25 = swift_slowAlloc(22, -1);
      v37 = swift_slowAlloc(32, -1);
      v64[0] = v37;
      *(_DWORD *)v25 = 136315394;
      v62 = sub_100020FBC(0xD000000000000023, 0x800000010002F480, v64);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, v63);
      *(_WORD *)(v25 + 12) = 2050;
      v62 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, v63);
      _os_log_impl((void *)&_mh_execute_header, v23, v36, "%s received unknown user interaction event: %{public}ld", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy(v37, 1, (char *)&type metadata for Any + 8);
      v31 = v37;
      goto LABEL_14;
    }
LABEL_16:

    return;
  }
  if ((*(_BYTE *)(v2 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_hasReceivedServerInteractionEvent) & 1) != 0)
  {
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = swift_slowAlloc(12, -1);
      v26 = swift_slowAlloc(32, -1);
      v64[0] = v26;
      *(_DWORD *)v25 = 136446210;
      v27 = sub_10001813C(0);
      v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
      v30 = v29;

      v62 = sub_100020FBC(v28, v30, v64);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, v63);
      swift_bridgeObjectRelease(v30);
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Ignoring event: %{public}s since the flow has already received this event", (uint8_t *)v25, 0xCu);
      swift_arrayDestroy(v26, 1, (char *)&type metadata for Any + 8);
      v31 = v26;
LABEL_14:
      swift_slowDealloc(v31, -1, -1);
      v35 = v25;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  *(_BYTE *)(v2 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_hasReceivedServerInteractionEvent) = 1;
  v38 = v2 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage;
  swift_beginAccess(v2 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage, &v62, 0, 0);
  sub_1000180F4(v38, (uint64_t)v64);
  v39 = v65;
  if (v65)
  {
    v40 = v66;
    sub_10000FED4(v64, v65);
    LOBYTE(v40) = (*(uint64_t (**)(uint64_t, uint64_t))(v40 + 56))(v39, v40);
    sub_10000FE98((uint64_t)v64, &qword_100042B20);
    v41 = sub_1000271E4(v40);
    v43 = v42;
    if (v41 == 0x7463757274736E69 && v42 == 0xEB000000006E6F69)
    {
      v44 = swift_bridgeObjectRelease(0xEB000000006E6F69);
LABEL_23:
      v46 = Logger.logObject.getter(v44);
      v47 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v46, v47))
      {
        v48 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v48 = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, v47, "Proceeding from the instruction pane since the user interacted with the first pane on the server side", v48, 2u);
        swift_slowDealloc(v48, -1, -1);
      }

      sub_1000122D0();
      return;
    }
    v45 = _stringCompareWithSmolCheck(_:_:expecting:)(v41, v42, 0x7463757274736E69, 0xEB000000006E6F69, 0);
    v44 = swift_bridgeObjectRelease(v43);
    if ((v45 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
    v44 = sub_10000FE98((uint64_t)v64, &qword_100042B20);
  }
  v49 = Logger.logObject.getter(v44);
  v50 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v49, v50))
  {
    v51 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v51 = 0;
    _os_log_impl((void *)&_mh_execute_header, v49, v50, "Removing instructions pane from flow since user already interacted with first pane on the server side", v51, 2u);
    swift_slowDealloc(v51, -1, -1);
  }

  v52 = v2 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow;
  swift_beginAccess(v2 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow, v61, 33, 0);
  v53 = *(_QWORD *)(v52 + 24);
  v54 = *(_QWORD *)(v52 + 32);
  sub_100017C44(v52, v53);
  v55 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v54 + 24))(v64, v53, v54);
  v56 = (void (*)(uint64_t *, _QWORD))v55;
  v58 = *v57;
  if (*(_QWORD *)(*v57 + 16))
  {
    v60 = v55;
    swift_bridgeObjectRetain(v58);
    __asm { BR              X9 }
  }
  sub_10000E51C(0, 0);
  v56(v64, 0);
  swift_endAccess(v61);
}

uint64_t sub_100015BC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(_QWORD *, _QWORD);
  uint64_t *v13;
  uint64_t v14;
  _QWORD v16[3];
  _QWORD v17[4];
  _BYTE v18[24];

  v1 = v0;
  v2 = type metadata accessor for DispatchPredicate(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (_QWORD *)((char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(void **)(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *v5 = v6;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  v7 = v6;
  LOBYTE(v6) = _dispatchPreconditionTest(_:)(v5);
  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0)
  {
    __break(1u);
    JUMPOUT(0x100016108);
  }
  v8 = v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow;
  swift_beginAccess(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow, v18, 33, 0);
  v9 = *(_QWORD *)(v8 + 24);
  v10 = *(_QWORD *)(v8 + 32);
  sub_100017C44(v8, v9);
  v11 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v10 + 24))(v17, v9, v10);
  v12 = (void (*)(_QWORD *, _QWORD))v11;
  v14 = *v13;
  if (*(_QWORD *)(*v13 + 16))
  {
    v16[1] = v11;
    swift_bridgeObjectRetain(v14);
    v16[2] = "AIN";
    __asm { BR              X9 }
  }
  sub_10000E51C(0, 0);
  v12(v17, 0);
  swift_endAccess(v18);
  v17[0] = 0;
  v17[1] = 0;
  CurrentValueSubject.value.setter(v17);
  return sub_1000122D0();
}

uint64_t sub_100016160(int a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23[2];

  v4 = v3;
  v8 = type metadata accessor for DispatchPredicate(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = *(void **)(v4 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *v11 = v12;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for DispatchPredicate.onQueue(_:), v8);
  v13 = v12;
  LOBYTE(v12) = _dispatchPreconditionTest(_:)(v11);
  (*(void (**)(_QWORD *, uint64_t))(v9 + 8))(v11, v8);
  if ((v12 & 1) != 0)
  {
    if (qword_100041E50 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once(&qword_100041E50, sub_10001A2E8);
LABEL_3:
  v14 = type metadata accessor for Logger(0);
  sub_100006C44(v14, (uint64_t)qword_100044E40);
  v15 = swift_bridgeObjectRetain_n(a3, 2);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc(18, -1);
    v19 = swift_slowAlloc(32, -1);
    v23[0] = v19;
    *(_DWORD *)v18 = 136315394;
    swift_bridgeObjectRetain(a3);
    v22 = sub_100020FBC(a2, a3, v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, v23);
    swift_bridgeObjectRelease_n(a3, 3);
    *(_WORD *)(v18 + 12) = 1026;
    LODWORD(v22) = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, (char *)&v22 + 4);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Received pin: %s with pairingFlags: %{public}u", (uint8_t *)v18, 0x12u);
    swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v19, -1, -1);
    swift_slowDealloc(v18, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a3, 2);
  }
  v23[0] = a2;
  v23[1] = a3;
  swift_bridgeObjectRetain(a3);
  CurrentValueSubject.send(_:)(v23);
  return swift_bridgeObjectRelease(a3);
}

void sub_1000163D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v2 = type metadata accessor for Logger(0);
  sub_100006C44(v2, (uint64_t)qword_100044E40);
  swift_errorRetain(a1);
  v3 = swift_errorRetain(a1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v21 = a1;
    v22 = v7;
    *(_DWORD *)v6 = 136446210;
    swift_errorRetain(a1);
    v8 = sub_100006CA0(&qword_100042B18);
    v9 = String.init<A>(describing:)(&v21, v8);
    v11 = v10;
    v21 = sub_100020FBC(v9, v10, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22);
    swift_bridgeObjectRelease(v11);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Secure pairing completed with error: %{public}s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    if (!a1)
      return;
  }
  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);

    if (!a1)
      return;
  }
  swift_errorRetain(a1);
  v12 = swift_errorRetain(a1);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(12, -1);
    v16 = swift_slowAlloc(32, -1);
    v21 = a1;
    v22 = v16;
    *(_DWORD *)v15 = 136446210;
    swift_errorRetain(a1);
    v17 = sub_100006CA0(&qword_100042B18);
    v18 = String.init<A>(describing:)(&v21, v17);
    v20 = v19;
    v21 = sub_100020FBC(v18, v19, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22);
    swift_bridgeObjectRelease(v20);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Secure pairing failed with error: %{public}s", v15, 0xCu);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    swift_slowDealloc(v15, -1, -1);
  }
  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }

  sub_100013BD4();
}

uint64_t sub_1000166FC(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  void *v19;
  _QWORD aBlock[5];
  uint64_t v21;

  v3 = type metadata accessor for DispatchWorkItemFlags(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(_QWORD *)&v1[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue];
  v11 = swift_allocObject(&unk_100039A50, 32, 7);
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = v1;
  aBlock[4] = sub_100017C98;
  v21 = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005DCC;
  aBlock[3] = &unk_100039A68;
  v12 = _Block_copy(aBlock);
  v13 = a1;
  static DispatchQoS.unspecified.getter(v1);
  v19 = &_swiftEmptyArrayStorage;
  v14 = sub_100006E48((unint64_t *)&qword_100042630, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v15 = sub_100006CA0((uint64_t *)&unk_100041FE0);
  v16 = sub_100006D5C((unint64_t *)&qword_100042640, (uint64_t *)&unk_100041FE0, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v19, v15, v16, v3, v14);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v10, v6, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release(v21);
}

void sub_1000168F0(void *a1, uint8_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint8_t *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint8_t *v27;
  id v28;
  uint8_t *v29;
  NSObject *v30;
  int v31;
  uint64_t v32;
  id v33;
  uint8_t *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  id v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  uint8_t *v50;
  unint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  const char *v68;
  os_log_type_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  os_log_type_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  id v89;
  void *v90;
  uint64_t v91;
  unint64_t v92;
  char v93;
  id v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  id v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  NSObject *v102;
  os_log_type_t v103;
  uint8_t *v104;
  uint64_t v105;
  char *v106;
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint8_t *v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114[5];
  __int128 v115;
  __int128 v116;

  v4 = type metadata accessor for UUID(0);
  v109 = *(_QWORD *)(v4 - 8);
  v110 = v4;
  ((void (*)(void))__chkstk_darwin)();
  v6 = (char *)&v105 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006CA0(&qword_100042B10);
  v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = (char *)&v105 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v105 - v10;
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v12 = type metadata accessor for Logger(0);
  sub_100006C44(v12, (uint64_t)qword_100044E40);
  v13 = a1;
  v14 = ((uint64_t (*)(void))Logger.logObject.getter)();
  v15 = static os_log_type_t.default.getter();
  v16 = os_log_type_enabled(v14, v15);
  v106 = v6;
  v107 = v9;
  v108 = v11;
  if (v16)
  {
    v17 = (uint8_t *)swift_slowAlloc(12, -1);
    v18 = swift_slowAlloc(32, -1);
    v114[0] = v18;
    v111 = a2;
    *(_DWORD *)v17 = 136446210;
    v19 = objc_msgSend(v13, "debugDescription", v17 + 4);
    v20 = v13;
    v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v23 = v22;

    v24 = v21;
    v13 = v20;
    *(_QWORD *)&v115 = sub_100020FBC(v24, v23, v114);
    a2 = v111;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, (char *)&v115 + 8);

    swift_bridgeObjectRelease(v23);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Received device setup notification: %{public}s", v17, 0xCu);
    swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v18, -1, -1);
    swift_slowDealloc(v17, -1, -1);

  }
  else
  {

  }
  v25 = OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_engineFlowProgress;
  if (a2[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_engineFlowProgress])
  {
    v26 = v13;
    v27 = a2;
    v28 = v26;
    v29 = v27;
    v30 = Logger.logObject.getter(v29);
    v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v30, (os_log_type_t)v31))
    {
      LODWORD(v111) = v31;
      v32 = swift_slowAlloc(22, -1);
      v110 = swift_slowAlloc(64, -1);
      v114[0] = v110;
      *(_DWORD *)v32 = 136446466;
      v33 = objc_msgSend(v28, "debugDescription");
      v34 = a2;
      v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v37 = v36;

      *(_QWORD *)&v115 = sub_100020FBC(v35, v37, v114);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, (char *)&v115 + 8);

      swift_bridgeObjectRelease(v37);
      *(_WORD *)(v32 + 12) = 2080;
      if (v34[v25])
      {
        if (v34[v25] == 1)
        {
          v38 = 0xE700000000000000;
          v39 = 0x676E696E6E7572;
        }
        else
        {
          v38 = 0xE600000000000000;
          v39 = 0x676E69646E65;
        }
      }
      else
      {
        v38 = 0xE400000000000000;
        v39 = 1701602409;
      }
      v69 = v111;
      v70 = v110;
      *(_QWORD *)&v115 = sub_100020FBC(v39, v38, v114);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, (char *)&v115 + 8);

      swift_bridgeObjectRelease(v38);
      _os_log_impl((void *)&_mh_execute_header, v30, v69, "Ignoring setup notification: %{public}s since the engine flow progress: %s", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy(v70, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v70, -1, -1);
      swift_slowDealloc(v32, -1, -1);

    }
    else
    {

    }
    return;
  }
  v40 = objc_msgSend(v13, "name");
  v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v43 = v42;

  if (v41 == 0xD00000000000001DLL && v43 == 0x800000010002F3F0)
  {
    swift_bridgeObjectRelease(0x800000010002F3F0);
  }
  else
  {
    v44 = _stringCompareWithSmolCheck(_:_:expecting:)(v41, v43, 0xD00000000000001DLL, 0x800000010002F3F0, 0);
    swift_bridgeObjectRelease(v43);
    if ((v44 & 1) == 0)
    {
      v59 = v13;
      v60 = ((uint64_t (*)(void))Logger.logObject.getter)();
      v61 = static os_log_type_t.default.getter();
      if (!os_log_type_enabled(v60, v61))
        goto LABEL_62;
      v62 = (uint8_t *)swift_slowAlloc(12, -1);
      v63 = swift_slowAlloc(32, -1);
      v114[0] = v63;
      *(_DWORD *)v62 = 136446210;
      v71 = objc_msgSend(v59, "name");
      v72 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v74 = v73;

      *(_QWORD *)&v115 = sub_100020FBC(v72, v74, v114);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, (char *)&v115 + 8);

      swift_bridgeObjectRelease(v74);
      v68 = "Ignoring notification: %{public}s since it is not an SFDeviceSetupNotification";
      goto LABEL_35;
    }
  }
  v45 = objc_msgSend(v13, "userInfo");
  if (!v45)
  {
    v115 = 0u;
    v116 = 0u;
LABEL_27:
    sub_10000FE98((uint64_t)&v115, &qword_100042650);
    goto LABEL_28;
  }
  v46 = v45;
  v47 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v45, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v112 = 0x4449656369766564;
  v113 = 0xE800000000000000;
  AnyHashable.init<A>(_:)(v114, &v112, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v47 + 16) && (v48 = sub_100021834((uint64_t)v114), (v49 & 1) != 0))
  {
    sub_100017C08(*(_QWORD *)(v47 + 56) + 32 * v48, (uint64_t)&v115);
  }
  else
  {
    v115 = 0u;
    v116 = 0u;
  }
  swift_bridgeObjectRelease(v47);
  sub_100017BD4((uint64_t)v114);
  if (!*((_QWORD *)&v116 + 1))
    goto LABEL_27;
  if ((swift_dynamicCast(v114, &v115, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
  {
LABEL_28:
    v59 = v13;
    v60 = ((uint64_t (*)(void))Logger.logObject.getter)();
    v61 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v60, v61))
      goto LABEL_62;
    v62 = (uint8_t *)swift_slowAlloc(12, -1);
    v63 = swift_slowAlloc(32, -1);
    v114[0] = v63;
    *(_DWORD *)v62 = 136446210;
    v64 = objc_msgSend(v59, "debugDescription");
    v65 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v67 = v66;

    *(_QWORD *)&v115 = sub_100020FBC(v65, v67, v114);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, (char *)&v115 + 8);

    swift_bridgeObjectRelease(v67);
    v68 = "Missing value for key SFDeviceSetupNotificationKeyDeviceIdentifier in notification: %{public}s";
LABEL_35:
    _os_log_impl((void *)&_mh_execute_header, v60, v61, v68, v62, 0xCu);
    swift_arrayDestroy(v63, 1, (char *)&type metadata for Any + 8);
    v75 = v63;
    goto LABEL_36;
  }
  v50 = a2;
  v52 = v114[0];
  v51 = v114[1];
  v111 = v50;
  v53 = (void *)(*(uint64_t (**)(void))((swift_isaMask & **(_QWORD **)&v50[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_setupClient])
                                     + 0x100))();
  if (!v53)
  {
LABEL_40:
    v78 = swift_bridgeObjectRetain(v51);
    v60 = Logger.logObject.getter(v78);
    v79 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v60, v79))
    {

      swift_bridgeObjectRelease_n(v51, 2);
      return;
    }
    v62 = (uint8_t *)swift_slowAlloc(12, -1);
    v80 = swift_slowAlloc(32, -1);
    v114[0] = v80;
    *(_DWORD *)v62 = 136446210;
    swift_bridgeObjectRetain(v51);
    *(_QWORD *)&v115 = sub_100020FBC(v52, v51, v114);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, (char *)&v115 + 8);
    swift_bridgeObjectRelease_n(v51, 3);
    _os_log_impl((void *)&_mh_execute_header, v60, v79, "Ignoring device setup notification targeted for peer device with identifier: %{public}s", v62, 0xCu);
    swift_arrayDestroy(v80, 1, (char *)&type metadata for Any + 8);
    v75 = v80;
LABEL_36:
    swift_slowDealloc(v75, -1, -1);
    swift_slowDealloc(v62, -1, -1);

    return;
  }
  v54 = v53;
  v55 = objc_msgSend(v53, "identifier");

  if (v55)
  {
    v56 = (uint64_t)v107;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(v55);

    v57 = 0;
    v58 = v110;
  }
  else
  {
    v57 = 1;
    v58 = v110;
    v56 = (uint64_t)v107;
  }
  v76 = v109;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v109 + 56))(v56, v57, 1, v58);
  v77 = (uint64_t)v108;
  sub_100017CB8(v56, (uint64_t)v108);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v76 + 48))(v77, 1, v58))
  {
    sub_10000FE98(v77, &qword_100042B10);
    goto LABEL_40;
  }
  v81 = v106;
  (*(void (**)(char *, uint64_t, uint64_t))(v76 + 16))(v106, v77, v58);
  v82 = sub_10000FE98(v77, &qword_100042B10);
  v83 = v76;
  v84 = UUID.uuidString.getter(v82);
  v85 = v58;
  v87 = v86;
  (*(void (**)(char *, uint64_t))(v83 + 8))(v81, v85);
  if (v52 == v84 && v51 == v87)
  {
    swift_bridgeObjectRelease(v51);
  }
  else
  {
    v88 = _stringCompareWithSmolCheck(_:_:expecting:)(v52, v51, v84, v87, 0);
    swift_bridgeObjectRelease(v87);
    if ((v88 & 1) == 0)
      goto LABEL_40;
  }
  swift_bridgeObjectRelease(v51);
  v89 = objc_msgSend(v13, "userInfo");
  if (!v89)
  {
    v115 = 0u;
    v116 = 0u;
LABEL_59:
    sub_10000FE98((uint64_t)&v115, &qword_100042650);
LABEL_60:
    v59 = v13;
    v60 = ((uint64_t (*)(void))Logger.logObject.getter)();
    v61 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v60, v61))
    {
      v62 = (uint8_t *)swift_slowAlloc(12, -1);
      v63 = swift_slowAlloc(32, -1);
      v114[0] = v63;
      *(_DWORD *)v62 = 136446210;
      v111 = v62 + 4;
      v98 = objc_msgSend(v59, "debugDescription");
      v99 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v101 = v100;

      *(_QWORD *)&v115 = sub_100020FBC(v99, v101, v114);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, (char *)&v115 + 8);

      swift_bridgeObjectRelease(v101);
      v68 = "Missing value for key SFDeviceSetupNotificationKeyNeedsSetup in notification: %{public}s";
      goto LABEL_35;
    }
    goto LABEL_62;
  }
  v90 = v89;
  v91 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v89, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v112 = 0x746553736465656ELL;
  v113 = 0xEA00000000007075;
  AnyHashable.init<A>(_:)(v114, &v112, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v91 + 16))
  {
    v92 = sub_100021834((uint64_t)v114);
    if ((v93 & 1) != 0)
    {
      sub_100017C08(*(_QWORD *)(v91 + 56) + 32 * v92, (uint64_t)&v115);
    }
    else
    {
      v115 = 0u;
      v116 = 0u;
    }
  }
  else
  {
    v115 = 0u;
    v116 = 0u;
  }
  swift_bridgeObjectRelease(v91);
  sub_100017BD4((uint64_t)v114);
  if (!*((_QWORD *)&v116 + 1))
    goto LABEL_59;
  if ((swift_dynamicCast(v114, &v115, (char *)&type metadata for Any + 8, &type metadata for Bool, 6) & 1) == 0)
    goto LABEL_60;
  if ((v114[0] & 1) != 0)
  {
    v59 = v13;
    v60 = ((uint64_t (*)(void))Logger.logObject.getter)();
    v61 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v60, v61))
    {
      v62 = (uint8_t *)swift_slowAlloc(12, -1);
      v63 = swift_slowAlloc(32, -1);
      v114[0] = v63;
      *(_DWORD *)v62 = 136446210;
      v111 = v62 + 4;
      v94 = objc_msgSend(v59, "debugDescription");
      v95 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v97 = v96;

      *(_QWORD *)&v115 = sub_100020FBC(v95, v97, v114);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, (char *)&v115 + 8);

      swift_bridgeObjectRelease(v97);
      v68 = "Device needs to be setup. Ignoring the notification: %{public}s";
      goto LABEL_35;
    }
LABEL_62:

    return;
  }
  v102 = ((uint64_t (*)(void))Logger.logObject.getter)();
  v103 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v102, v103))
  {
    v104 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v104 = 0;
    _os_log_impl((void *)&_mh_execute_header, v102, v103, "Auto-dismissing proximity setup flow.", v104, 2u);
    swift_slowDealloc(v104, -1, -1);
  }

  sub_10000CEA4(1);
}

uint64_t sub_100017758()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(_BYTE *, _QWORD);
  uint64_t *v10;
  uint64_t v11;
  _BYTE v13[32];
  _BYTE v14[24];

  v1 = v0;
  if (qword_100041E48 != -1)
    swift_once(&qword_100041E48, sub_10001A268);
  v2 = type metadata accessor for Logger(0);
  sub_100006C44(v2, (uint64_t)qword_100044E28);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Invalidating ProxCardFlowEngine", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  (*(void (**)(void))((swift_isaMask & **(_QWORD **)(v1
                                                   + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_setupClient))
                    + 0x1C8))();
  *(_BYTE *)(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_engineFlowProgress) = 0;
  v6 = v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow;
  swift_beginAccess(v6, v14, 33, 0);
  v7 = *(_QWORD *)(v6 + 24);
  v8 = *(_QWORD *)(v6 + 32);
  sub_100017C44(v6, v7);
  v9 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v8 + 24))(v13, v7, v8);
  v11 = *v10;
  *v10 = (uint64_t)&_swiftEmptyArrayStorage;
  v9(v13, 0);
  swift_endAccess(v14);
  return swift_bridgeObjectRelease(v11);
}

uint64_t type metadata accessor for ProxCardFlowEngine()
{
  return objc_opt_self(_TtC21TDGSharingViewService18ProxCardFlowEngine);
}

uint64_t getEnumTagSinglePayload for CompletionStatus(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ProxCardFlowEngine.ProxCardEngineFlowProgress(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100017A04 + 4 * byte_10002B489[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100017A38 + 4 * byte_10002B484[v4]))();
}

uint64_t sub_100017A38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100017A40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100017A48);
  return result;
}

uint64_t sub_100017A54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100017A5CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_100017A60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100017A68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProxCardFlowEngine.ProxCardEngineFlowProgress()
{
  return &type metadata for ProxCardFlowEngine.ProxCardEngineFlowProgress;
}

unint64_t sub_100017A88()
{
  unint64_t result;

  result = qword_100042AF0;
  if (!qword_100042AF0)
  {
    result = swift_getWitnessTable(&unk_10002B554, &type metadata for ProxCardFlowEngine.ProxCardEngineFlowProgress);
    atomic_store(result, (unint64_t *)&qword_100042AF0);
  }
  return result;
}

uint64_t sub_100017ACC()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_100006C44(v0, (uint64_t)qword_100044E40);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Device unlock stage is dismissing to display the passcode", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }

  return sub_100017758();
}

uint64_t sub_100017B9C(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100017BAC@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_100017BD4(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100017C08(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100017C44(uint64_t a1, uint64_t a2)
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

uint64_t sub_100017C6C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_100017C98()
{
  uint64_t v0;

  sub_1000168F0(*(void **)(v0 + 16), *(uint8_t **)(v0 + 24));
}

uint64_t sub_100017CA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100017CB0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100017CB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006CA0(&qword_100042B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

char *sub_100017D00(uint64_t a1)
{
  return sub_10000E1E0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100017D14(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  Swift::String v13;
  Swift::String_optional v14;
  Swift::String v15;
  void *object;
  NSString v17;
  id v18;
  id v19;
  Swift::String v20;
  Swift::String_optional v21;
  Swift::String v22;
  void *v23;
  NSString v24;
  id v25;
  id v26;
  Swift::String v27;
  Swift::String_optional v28;
  Swift::String v29;
  void *v30;
  uint64_t v31;
  NSString v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  _QWORD aBlock[5];
  uint64_t v41;
  Swift::String v42;
  Swift::String v43;
  Swift::String v44;

  *(_QWORD *)(a4 + 40) = 0;
  v7 = swift_unknownObjectWeakInit(a4 + 32, 0);
  *(_QWORD *)(a4 + 24) = a1;
  *(_QWORD *)(a4 + 40) = &off_100039A30;
  swift_unknownObjectWeakAssign(v7, a3);
  v8 = objc_allocWithZone((Class)PRXCardContentViewController);
  swift_retain(a1);
  v9 = objc_msgSend(v8, "init");
  *(_QWORD *)(a4 + 16) = v9;
  v10 = (void *)objc_opt_self(NSBundle);
  v11 = v9;
  v12 = objc_msgSend(v10, "mainBundle");
  v42._object = (void *)0xE000000000000000;
  v13._object = (void *)0x800000010002F4E0;
  v13._countAndFlagsBits = 0xD000000000000013;
  v14.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v14.value._object = (void *)0xEB00000000656C62;
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  v42._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v13, v14, (NSBundle)v12, v15, v42)._object;

  v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v11, "setTitle:", v17);

  v18 = *(id *)(a4 + 16);
  v19 = objc_msgSend(v10, "mainBundle");
  v20._countAndFlagsBits = 0xD000000000000016;
  v43._object = (void *)0xE000000000000000;
  v20._object = (void *)0x800000010002F500;
  v21.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v21.value._object = (void *)0xEB00000000656C62;
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  v43._countAndFlagsBits = 0;
  v23 = NSLocalizedString(_:tableName:bundle:value:comment:)(v20, v21, (NSBundle)v19, v22, v43)._object;

  v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v23);
  objc_msgSend(v18, "setSubtitle:", v24);

  objc_msgSend(*(id *)(a4 + 16), "setDismissalType:", 3);
  v25 = *(id *)(a4 + 16);
  v26 = objc_msgSend(v10, "mainBundle");
  v27._countAndFlagsBits = 0xD000000000000014;
  v44._object = (void *)0xE000000000000000;
  v27._object = (void *)0x800000010002F520;
  v28.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v28.value._object = (void *)0xEB00000000656C62;
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  v44._countAndFlagsBits = 0;
  v30 = NSLocalizedString(_:tableName:bundle:value:comment:)(v27, v28, (NSBundle)v26, v29, v44)._object;

  v31 = swift_allocObject(&unk_100039AA0, 24, 7);
  swift_weakInit(v31 + 16, a4);
  swift_retain(v31);
  v32 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v30);
  aBlock[4] = sub_1000181E0;
  v41 = v31;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100027818;
  aBlock[3] = &unk_100039AB8;
  v33 = _Block_copy(aBlock);
  v34 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v32, 0, v33);

  _Block_release(v33);
  swift_release(v41);
  swift_release(v31);
  v35 = objc_msgSend(v25, "addAction:", v34);

  v36 = *(id *)(a4 + 16);
  sub_1000067E8(v36, 1u);

  swift_release(a2);
  swift_release(a1);

  return a4;
}

uint64_t sub_1000180F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006CA0(&qword_100042B20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

__CFString *sub_10001813C(uint64_t a1)
{
  __CFString *v1;
  __CFString *v2;

  if (!a1)
  {
    v1 = CFSTR("WFSetupServerUserInteractionProgressEventBeganInteractingWithDevice");
    goto LABEL_5;
  }
  if (a1 == 1)
  {
    v1 = CFSTR("WFSetupServerUserInteractionProgressEventChosePinPairingSetup");
LABEL_5:
    v2 = v1;
  }
  return v1;
}

__CFString *sub_10001817C(unint64_t a1)
{
  __CFString *v1;
  __CFString *v2;

  if (a1 <= 0xF)
  {
    v1 = off_100039CA0[a1];
    v2 = off_100039C20[a1];
  }
  return v1;
}

uint64_t sub_1000181BC()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000181E0(uint64_t a1)
{
  uint64_t v1;

  return sub_10001A8B0(a1, v1);
}

uint64_t sub_1000181E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006CA0(&qword_100042B20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018230(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_unknownObjectWeakDestroy(v2 + 16, a2);
  return swift_deallocObject(v2, 24, 7);
}

void sub_100018254()
{
  uint64_t v0;

  sub_1000124E0(v0);
}

uint64_t sub_10001825C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100018280()
{
  uint64_t v0;

  return sub_100012B34(*(_QWORD *)(v0 + 16));
}

unint64_t sub_100018288()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100042B70;
  if (!qword_100042B70)
  {
    v1 = sub_100006D24(255, (unint64_t *)&qword_100041FD0, OS_dispatch_queue_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue, v1);
    atomic_store(result, (unint64_t *)&qword_100042B70);
  }
  return result;
}

uint64_t sub_1000182E0()
{
  uint64_t v0;

  sub_10000B6F0((_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10001830C(__int128 *a1, uint64_t a2)
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

void sub_100018324(unsigned __int8 *a1)
{
  uint64_t v1;

  sub_100012020(a1, v1 + 16, *(_QWORD *)(v1 + 56));
}

uint64_t sub_100018330()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100018340()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[3]);
  swift_release(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100018374(uint64_t a1)
{
  uint64_t *v1;

  return sub_100011914(a1, v1[2], v1[3], v1[4]);
}

void sub_100018380(unint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_100010E44(a1, a2, v2);
}

void sub_100018388()
{
  uint64_t v0;

  sub_100010EB0(v0, "connection to server interrupted");
}

void sub_1000183A8()
{
  uint64_t v0;

  sub_100010EB0(v0, "connection to server invalidated");
}

void sub_1000183C8(uint64_t a1)
{
  uint64_t v1;

  sub_10001104C(a1, v1, sub_10001504C);
}

void sub_1000183E8(int a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  sub_100010FD8(a1, a2, a3, v3);
}

void sub_1000183F0(uint64_t a1)
{
  uint64_t v1;

  sub_10001104C(a1, v1, sub_1000163D8);
}

uint64_t sub_100018410()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001843C(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_100042BC4);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1000184A8;
  return sub_1000110B4(a1, v4, v5, v6);
}

uint64_t sub_1000184A8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v0;
  v1 = *(_QWORD *)(v4 + 16);
  v2 = *v0;
  v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100018508()
{
  _QWORD *v0;
  uint64_t v1;

  sub_10000B6F0(v0 + 3);
  v1 = v0[8];
  swift_release(v0[9]);
  swift_release(v1);
  return swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for AppleIDAccountRenewalStage()
{
  return objc_opt_self(_TtC21TDGSharingViewService26AppleIDAccountRenewalStage);
}

uint64_t sub_100018564()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(*(_QWORD *)v0 + 64));
}

uint64_t sub_100018570()
{
  _QWORD *v0;
  void *v1;

  sub_10000B6F0(v0 + 3);
  v1 = (void *)v0[8];
  swift_release(v0[9]);

  return swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for ProgressStage()
{
  return objc_opt_self(_TtC21TDGSharingViewService13ProgressStage);
}

uint64_t sub_1000185C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  _UNKNOWN **v14;

  v3 = v2;
  *(_BYTE *)(v2 + 16) = 8;
  v6 = type metadata accessor for CompleteActionHandler();
  v7 = swift_allocObject(v6, 24, 7);
  v8 = sub_100006CA0(&qword_100042B30);
  swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
  *(_QWORD *)(v7 + 16) = PassthroughSubject.init()();
  *(_QWORD *)(v2 + 64) = v7;
  v9 = type metadata accessor for CompleteUIProvider();
  swift_allocObject(v9, 32, 7);
  swift_retain_n(v7, 2);
  swift_retain(a1);
  v10 = sub_100028CEC(v7, a1);
  v13 = v9;
  v14 = &off_10003A888;
  swift_release(v7);
  swift_release(a1);
  swift_release(a2);
  *(_QWORD *)&v12 = v10;
  sub_10001830C(&v12, v3 + 24);
  return v3;
}

uint64_t sub_1000186C4()
{
  uint64_t v0;

  sub_10000B6F0((_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 64));
  return swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for CompleteStage()
{
  return objc_opt_self(_TtC21TDGSharingViewService13CompleteStage);
}

uint64_t sub_100018710()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 64) + 16));
}

uint64_t sub_100018720()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_100018750 + 4 * byte_10002B6E0[*v0]))(0x6E776F6E6B6E55, 0xE700000000000000);
}

unint64_t sub_100018750()
{
  return 0xD000000000000014;
}

unint64_t sub_10001876C()
{
  return 0xD00000000000001ALL;
}

void sub_1000187A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  id v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  void *v26;
  _QWORD *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  id v40;
  _QWORD aBlock[5];
  _QWORD *v42;

  v8 = swift_allocObject(&unk_100039EB8, 32, 7);
  *(_QWORD *)(v8 + 16) = a3;
  *(_QWORD *)(v8 + 24) = a4;
  v9 = (void *)objc_opt_self(AKAccountManager);
  swift_retain(a3);
  swift_retain(a4);
  v10 = objc_msgSend(v9, "sharedInstance");
  v11 = objc_msgSend(v10, "primaryAuthKitAccount");

  if (v11)
  {
    if (qword_100041E80 != -1)
      swift_once(&qword_100041E80, sub_10001A610);
    v12 = type metadata accessor for Logger(0);
    v13 = sub_100006C44(v12, (uint64_t)qword_100044ED0);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Creating AKAppleIDAuthenticationPurpleBuddyContext", v16, 2u);
      swift_slowDealloc(v16, -1, -1);
    }

    v17 = objc_msgSend(objc_allocWithZone((Class)AKAppleIDAuthenticationPurpleBuddyContext), "init");
    objc_msgSend(v17, "setShouldOfferSecurityUpgrade:", 1);
    objc_msgSend(v17, "setServiceType:", 1);
    objc_msgSend(v17, "setAnticipateEscrowAttempt:", 1);
    objc_msgSend(v17, "setShouldAllowAppleIDCreation:", 1);
    objc_msgSend(v17, "setAuthenticationType:", 2);
    objc_msgSend(v17, "setShouldUpdatePersistentServiceTokens:", 1);
    objc_msgSend(v17, "setIsUsernameEditable:", 0);
    v40 = v17;
    v18 = objc_msgSend(v11, "username");
    objc_msgSend(v40, "setUsername:", v18);

    v19 = Logger.logObject.getter(objc_msgSend(v40, "setPresentingViewController:", a1));
    v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Starting Authentication", v21, 2u);
      swift_slowDealloc(v21, -1, -1);
    }

    v22 = objc_msgSend(objc_allocWithZone((Class)AKAppleIDAuthenticationController), "init");
    if (v22)
    {
      v23 = v22;
      v24 = swift_allocObject(&unk_100039EE0, 24, 7);
      swift_weakInit(v24 + 16, a2);
      v25 = (_QWORD *)swift_allocObject(&unk_100039F08, 48, 7);
      v25[2] = v11;
      v25[3] = sub_10001A058;
      v25[4] = v8;
      v25[5] = v24;
      aBlock[4] = sub_10001A0B8;
      v42 = v25;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000191A8;
      aBlock[3] = &unk_100039F20;
      v26 = _Block_copy(aBlock);
      v27 = v42;
      v28 = v40;
      v29 = v23;
      v30 = v11;
      swift_retain(v8);
      swift_release(v27);
      objc_msgSend(v29, "authenticateWithContext:completion:", v28, v26);

      _Block_release(v26);
      swift_release(a4);
      swift_release(a3);
      swift_release(v8);

    }
    else
    {
      swift_release(a4);
      swift_release(a3);
      swift_release(v8);

    }
  }
  else
  {
    if (qword_100041E80 != -1)
      swift_once(&qword_100041E80, sub_10001A610);
    v31 = type metadata accessor for Logger(0);
    v32 = sub_100006C44(v31, (uint64_t)qword_100044ED0);
    v33 = Logger.logObject.getter(v32);
    v34 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v35 = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "No apple ID found on the device.", v35, 2u);
      swift_slowDealloc(v35, -1, -1);
    }

    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v36 = sub_100006C44(v31, (uint64_t)qword_100044E40);
    v37 = Logger.logObject.getter(v36);
    v38 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Apple ID Renewal Failed", v39, 2u);
      swift_slowDealloc(v39, -1, -1);
    }

    LOBYTE(aBlock[0]) = 0;
    PassthroughSubject.send(_:)(aBlock);
    swift_release(a4);
    swift_release(a3);
    swift_release(v8);
  }
}

void sub_100018D5C(uint64_t a1, uint64_t a2, void *a3, void (*a4)(_QWORD), uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  os_log_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t Strong;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  os_log_t v46;
  uint64_t v47;
  void (*v48)(_QWORD);
  _QWORD v49[3];
  _BYTE v50[8];
  uint64_t v51;
  uint64_t v52[3];

  v11 = type metadata accessor for Logger(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
    v32 = a6 + 16;
    if (qword_100041E80 != -1)
      swift_once(&qword_100041E80, sub_10001A610);
    v33 = sub_100006C44(v11, (uint64_t)qword_100044ED0);
    v34 = Logger.logObject.getter(v33);
    v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Successfully logged in.", v36, 2u);
      swift_slowDealloc(v36, -1, -1);
    }

    swift_beginAccess(v32, v52, 0, 0);
    Strong = swift_weakLoadStrong(v32);
    if (Strong)
    {
      v38 = Strong;
      v39 = sub_100019908();
      if ((v39 & 1) != 0)
      {
        v40 = Logger.logObject.getter(v39);
        v41 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v40, v41))
        {
          v42 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v42 = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, v41, "Error, account renewal is still needed after successful login.", v42, 2u);
          swift_slowDealloc(v42, -1, -1);
        }

      }
      swift_release(v38);
    }
    goto LABEL_18;
  }
  if (qword_100041E80 != -1)
    swift_once(&qword_100041E80, sub_10001A610);
  v15 = sub_100006C44(v11, (uint64_t)qword_100044ED0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  v16 = a3;
  swift_errorRetain(a2);
  v17 = v16;
  v18 = swift_errorRetain(a2);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v19, (os_log_type_t)v20))
  {

    swift_errorRelease(a2);
    swift_errorRelease(a2);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    goto LABEL_18;
  }
  v45 = v20;
  v46 = v19;
  v47 = a5;
  v48 = a4;
  v21 = swift_slowAlloc(22, -1);
  v44 = swift_slowAlloc(64, -1);
  v52[0] = v44;
  *(_DWORD *)v21 = 136315394;
  v22 = objc_msgSend(v17, "username");
  if (v22)
  {
    v23 = v22;
    v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
    v26 = v25;

    v51 = sub_100020FBC(v24, v26, v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, v52);

    swift_bridgeObjectRelease(v26);
    *(_WORD *)(v21 + 12) = 2082;
    swift_getErrorValue(a2, v50, v49);
    v27 = Error.localizedDescription.getter(v49[1], v49[2]);
    v29 = v28;
    v51 = sub_100020FBC(v27, v28, v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, v52);
    swift_bridgeObjectRelease(v29);
    swift_errorRelease(a2);
    swift_errorRelease(a2);
    v30 = v46;
    _os_log_impl((void *)&_mh_execute_header, v46, (os_log_type_t)v45, "Failed to sign into iCloud account %s, error: %{public}s)", (uint8_t *)v21, 0x16u);
    v31 = v44;
    swift_arrayDestroy(v44, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v31, -1, -1);
    swift_slowDealloc(v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    a4 = v48;
LABEL_18:
    a4(a2 == 0);
    return;
  }
  swift_errorRelease(a2);

  __break(1u);
}

uint64_t sub_1000191A8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  uint64_t v7;
  id v8;

  v4 = a2;
  v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    v7 = sub_100006CA0((uint64_t *)&unk_100042F20);
    v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, &type metadata for String, v7, &protocol witness table for String);
  }
  swift_retain(v5);
  v8 = a3;
  v6(v4, a3);
  swift_release(v5);

  return swift_bridgeObjectRelease(v4);
}

uint64_t type metadata accessor for AppleIDManager()
{
  return objc_opt_self(_TtC21TDGSharingViewService14AppleIDManager);
}

uint64_t sub_100019258(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100019278()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  NSObject *log;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v0 = (void *)objc_opt_self(AKAccountManager);
  v1 = objc_msgSend(v0, "sharedInstance");
  v2 = objc_msgSend(v1, "primaryAuthKitAccount");

  if (v2)
  {
    v3 = objc_msgSend(v2, "aa_altDSID");
    if (v3)
    {
      v4 = v3;
      v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v7 = v6;
      v8 = objc_msgSend(v0, "sharedInstance");
      v9 = objc_msgSend(v8, "authKitAccountWithAltDSID:", v4);

      if (v9)
      {
        swift_bridgeObjectRelease(v7);
        v10 = objc_msgSend(v0, "sharedInstance");
        v11 = objc_msgSend(v10, "securityLevelForAccount:", v9);

        if (qword_100041E80 != -1)
          swift_once(&qword_100041E80, sub_10001A610);
        v12 = type metadata accessor for Logger(0);
        sub_100006C44(v12, (uint64_t)qword_100044ED0);
        v13 = v9;
        v14 = Logger.logObject.getter(v13);
        v15 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v14, v15))
        {
          v16 = swift_slowAlloc(28, -1);
          log = v14;
          v17 = (_QWORD *)swift_slowAlloc(8, -1);
          *(_DWORD *)v16 = 138543874;
          v44 = (uint64_t)v13;
          v18 = v13;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45);
          *v17 = v9;

          *(_WORD *)(v16 + 12) = 1024;
          LODWORD(v44) = v11 == (id)4;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, (char *)&v44 + 4);
          *(_WORD *)(v16 + 18) = 2050;
          v44 = (uint64_t)v11;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45);
          _os_log_impl((void *)&_mh_execute_header, log, v15, "AuthKit account: %{public}@ isHSA2: %{BOOL}d with security level: %{public}lu", (uint8_t *)v16, 0x1Cu);
          v19 = sub_100006CA0(&qword_100042268);
          swift_arrayDestroy(v17, 1, v19);
          swift_slowDealloc(v17, -1, -1);
          swift_slowDealloc(v16, -1, -1);

        }
        else
        {

        }
        if (v11 == (id)4)
          return 2;
        else
          return 1;
      }
      if (qword_100041E80 != -1)
        swift_once(&qword_100041E80, sub_10001A610);
      v35 = type metadata accessor for Logger(0);
      sub_100006C44(v35, (uint64_t)qword_100044ED0);
      v36 = swift_bridgeObjectRetain(v7);
      v37 = Logger.logObject.getter(v36);
      v38 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v37, v38))
      {
        v39 = (uint8_t *)swift_slowAlloc(12, -1);
        v40 = swift_slowAlloc(32, -1);
        v44 = v40;
        *(_DWORD *)v39 = 136446210;
        swift_bridgeObjectRetain(v7);
        v43 = sub_100020FBC(v5, v7, &v44);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44);
        v25 = 3;
        swift_bridgeObjectRelease_n(v7, 3);
        _os_log_impl((void *)&_mh_execute_header, v37, v38, "Failed to authkit account for alternate dsid: %{public}s", v39, 0xCu);
        swift_arrayDestroy(v40, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v40, -1, -1);
        swift_slowDealloc(v39, -1, -1);

        return v25;
      }

      swift_bridgeObjectRelease_n(v7, 2);
    }
    else
    {
      if (qword_100041E80 != -1)
        swift_once(&qword_100041E80, sub_10001A610);
      v26 = type metadata accessor for Logger(0);
      sub_100006C44(v26, (uint64_t)qword_100044ED0);
      v2 = v2;
      v27 = Logger.logObject.getter(v2);
      v28 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = (uint8_t *)swift_slowAlloc(12, -1);
        v30 = swift_slowAlloc(32, -1);
        v44 = v30;
        *(_DWORD *)v29 = 136446210;
        v31 = objc_msgSend(v2, "description");
        v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v34 = v33;

        v43 = sub_100020FBC(v32, v34, &v44);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44);

        swift_bridgeObjectRelease(v34);
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "Failed to find alternate dsid for account: %{public}s. ", v29, 0xCu);
        swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v30, -1, -1);
        swift_slowDealloc(v29, -1, -1);

        return 3;
      }

    }
    return 3;
  }
  if (qword_100041E80 != -1)
    swift_once(&qword_100041E80, sub_10001A610);
  v20 = type metadata accessor for Logger(0);
  v21 = sub_100006C44(v20, (uint64_t)qword_100044ED0);
  v22 = Logger.logObject.getter(v21);
  v23 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "No apple ID found on the device.", v24, 2u);
    swift_slowDealloc(v24, -1, -1);
  }

  return 0;
}

uint64_t sub_100019908()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  _QWORD *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  _QWORD *v35;
  id v36;
  uint64_t v37;
  uint64_t result;
  void *v39;
  unsigned int v40;
  uint64_t v41;
  os_log_type_t v42;
  _BOOL4 v43;
  uint8_t *v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v0 = (void *)objc_opt_self(AKAccountManager);
  v1 = objc_msgSend(v0, "sharedInstance");
  v2 = objc_msgSend(v1, "primaryAuthKitAccount");

  if (!v2)
  {
    if (qword_100041E80 != -1)
      swift_once(&qword_100041E80, sub_10001A610);
    v17 = type metadata accessor for Logger(0);
    v18 = sub_100006C44(v17, (uint64_t)qword_100044ED0);
    v8 = Logger.logObject.getter(v18);
    v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v19, "No apple ID found on the device.", v20, 2u);
      swift_slowDealloc(v20, -1, -1);
    }
    goto LABEL_30;
  }
  v3 = objc_msgSend(v0, "sharedInstance");
  v4 = objc_msgSend(v3, "continuationTokenForAccount:", v2);

  if (!v4)
  {
    if (qword_100041E80 != -1)
      swift_once(&qword_100041E80, sub_10001A610);
    v21 = type metadata accessor for Logger(0);
    sub_100006C44(v21, (uint64_t)qword_100044ED0);
    v22 = v2;
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc(12, -1);
      v26 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v25 = 138543362;
      v47 = (uint64_t)v22;
      v27 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48);
      *v26 = v2;

      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Primary Account %{public}@ does not have a continuation token. Needs repair.", v25, 0xCu);
      v28 = sub_100006CA0(&qword_100042268);
      v29 = 1;
      swift_arrayDestroy(v26, 1, v28);
      swift_slowDealloc(v26, -1, -1);
      swift_slowDealloc(v25, -1, -1);

    }
    else
    {

      return 1;
    }
    return v29;
  }

  v5 = objc_msgSend(v0, "sharedInstance");
  v6 = objc_msgSend(v5, "passwordResetTokenForAccount:", v2);

  if (v6)
  {

    if (qword_100041E80 != -1)
      swift_once(&qword_100041E80, sub_10001A610);
    v7 = type metadata accessor for Logger(0);
    sub_100006C44(v7, (uint64_t)qword_100044ED0);
    v8 = v2;
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(12, -1);
      v12 = swift_slowAlloc(32, -1);
      v47 = v12;
      *(_DWORD *)v11 = 136446210;
      v13 = -[NSObject description](v8, "description");
      v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
      v16 = v15;

      v46 = sub_100020FBC(v14, v16, &v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47);

      swift_bridgeObjectRelease(v16);
      swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v12, -1, -1);
      swift_slowDealloc(v11, -1, -1);

      return 0;
    }

LABEL_30:
    return 0;
  }
  if (qword_100041E80 != -1)
    swift_once(&qword_100041E80, sub_10001A610);
  v30 = type metadata accessor for Logger(0);
  sub_100006C44(v30, (uint64_t)qword_100044ED0);
  v31 = v2;
  v32 = Logger.logObject.getter(v31);
  v33 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc(12, -1);
    v35 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v34 = 138543362;
    v47 = (uint64_t)v31;
    v36 = v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48);
    *v35 = v2;

    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Primary Account %{public}@ does not have a password reset token.", v34, 0xCu);
    v37 = sub_100006CA0(&qword_100042268);
    swift_arrayDestroy(v35, 1, v37);
    swift_slowDealloc(v35, -1, -1);
    swift_slowDealloc(v34, -1, -1);

  }
  else
  {

  }
  result = (uint64_t)objc_msgSend((id)objc_opt_self(MCProfileConnection), "sharedConnection");
  if (result)
  {
    v39 = (void *)result;
    v40 = objc_msgSend((id)result, "isPasscodeSet");

    v8 = Logger.logObject.getter(v41);
    v42 = static os_log_type_t.default.getter();
    v43 = os_log_type_enabled(v8, v42);
    if (v40)
    {
      if (v43)
      {
        v44 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v44 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, v42, "Primary Account has passcode enabled, we should initiate a repair.", v44, 2u);
        swift_slowDealloc(v44, -1, -1);

      }
      else
      {

      }
      return 1;
    }
    if (!v43)
    {

      return 0;
    }
    v45 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v45 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v42, "Primary Account has no passcode, account is not elible for passwordless account transfer. No Repair needed.", v45, 2u);
    swift_slowDealloc(v45, -1, -1);

    goto LABEL_30;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001A02C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001A058(uint64_t a1)
{
  uint64_t v1;

  return sub_100009674(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_10001A060()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001A084()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

void sub_10001A0B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_100018D5C(a1, a2, *(void **)(v2 + 16), *(void (**)(_QWORD))(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40));
}

uint64_t sub_10001A0C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001A0D4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001A0DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  _UNKNOWN **v12;

  v2 = v1;
  *(_BYTE *)(v1 + 16) = 9;
  v4 = type metadata accessor for FailureActionHandler();
  v5 = swift_allocObject(v4, 24, 7);
  v6 = sub_100006CA0(&qword_100042B30);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  *(_QWORD *)(v5 + 16) = PassthroughSubject.init()();
  *(_QWORD *)(v1 + 64) = v5;
  v7 = type metadata accessor for FailureUIProvider();
  swift_allocObject(v7, 32, 7);
  swift_retain_n(v5, 2);
  swift_retain(a1);
  v8 = sub_100029414(v5, a1);
  v11 = v7;
  v12 = &off_10003A900;
  swift_release(v5);
  swift_release(a1);
  *(_QWORD *)&v10 = v8;
  sub_10001830C(&v10, v2 + 24);
  return v2;
}

uint64_t type metadata accessor for FailureStage()
{
  return objc_opt_self(_TtC21TDGSharingViewService12FailureStage);
}

uint64_t sub_10001A1EC()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001A358(v0, qword_100044E10);
  sub_100006C44(v0, (uint64_t)qword_100044E10);
  return Logger.init(subsystem:category:)(0xD00000000000001FLL, 0x800000010002F990, 0x616F4C7465737341, 0xEB00000000726564);
}

uint64_t sub_10001A268()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001A358(v0, qword_100044E28);
  sub_100006C44(v0, (uint64_t)qword_100044E28);
  return Logger.init(subsystem:category:)(0xD00000000000001FLL, 0x800000010002F990, 0xD000000000000019, 0x800000010002F9D0);
}

uint64_t sub_10001A2E8()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001A358(v0, qword_100044E40);
  sub_100006C44(v0, (uint64_t)qword_100044E40);
  return Logger.init(subsystem:category:)(0xD00000000000001FLL, 0x800000010002F990, 0x7075746553, 0xE500000000000000);
}

uint64_t *sub_10001A358(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10001A398()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001A358(v0, qword_100044E58);
  sub_100006C44(v0, (uint64_t)qword_100044E58);
  return Logger.init(subsystem:category:)(0xD00000000000001FLL, 0x800000010002F990, 0x65746E6573657250, 0xE900000000000072);
}

uint64_t sub_10001A410()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001A358(v0, qword_100044E70);
  sub_100006C44(v0, (uint64_t)qword_100044E70);
  return Logger.init(subsystem:category:)(0xD00000000000001FLL, 0x800000010002F990, 0x6553646572616853, 0xEE0073676E697474);
}

uint64_t sub_10001A490()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001A358(v0, qword_100044E88);
  sub_100006C44(v0, (uint64_t)qword_100044E88);
  return Logger.init(subsystem:category:)(0xD00000000000001FLL, 0x800000010002F990, 0xD00000000000001ALL, 0x800000010002F9B0);
}

uint64_t sub_10001A514()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001A358(v0, qword_100044EA0);
  sub_100006C44(v0, (uint64_t)qword_100044EA0);
  return Logger.init(subsystem:category:)(0xD00000000000001FLL, 0x800000010002F990, 0x61506C6175736956, 0xED0000676E697269);
}

uint64_t sub_10001A594()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001A358(v0, qword_100044EB8);
  sub_100006C44(v0, (uint64_t)qword_100044EB8);
  return Logger.init(subsystem:category:)(0xD00000000000001FLL, 0x800000010002F990, 0x64726143786F7250, 0xEC000000776F6C46);
}

uint64_t sub_10001A610()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001A358(v0, qword_100044ED0);
  sub_100006C44(v0, (uint64_t)qword_100044ED0);
  return Logger.init(subsystem:category:)(0xD00000000000001FLL, 0x800000010002F990, 0x4D4449656C707041, 0xEE00726567616E61);
}

uint64_t type metadata accessor for CompleteActionHandler()
{
  return objc_opt_self(_TtC21TDGSharingViewService21CompleteActionHandler);
}

id sub_10001A7D8()
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
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v11 = v10;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0, 0, v9, v11);
  swift_bridgeObjectRelease(v11);
  exit((int)v8);
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC21TDGSharingViewService11AppDelegate);
}

uint64_t sub_10001A8B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t Strong;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  uint64_t v17;
  _BYTE v18[24];

  v2 = a2 + 16;
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v3 = type metadata accessor for Logger(0);
  v4 = sub_100006C44(v3, (uint64_t)qword_100044E40);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "DeviceUnlockUIProvider: card requesting device unlock", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

  swift_beginAccess(v2, v18, 0, 0);
  Strong = swift_weakLoadStrong(v2);
  if (Strong)
  {
    v9 = Strong;
    v10 = *(_QWORD *)(Strong + 24);
    swift_retain(v10);
    swift_release(v9);
    sub_10001F630();
    swift_release(v10);
  }
  swift_beginAccess(v2, &v17, 0, 0);
  result = swift_weakLoadStrong(v2);
  if (result)
  {
    v12 = result;
    v13 = swift_unknownObjectWeakLoadStrong(result + 32);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)(v12 + 40);
      swift_release(v12);
      ObjectType = swift_getObjectType(v14);
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(ObjectType, v15);
      return swift_unknownObjectRelease(v14);
    }
    else
    {
      return swift_release(v12);
    }
  }
  return result;
}

uint64_t sub_10001AA34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;

  v1 = v0;
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100006C44(v2, (uint64_t)qword_100044E40);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "DeviceUnlockUIProvider deinit", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  swift_release(*(_QWORD *)(v1 + 24));
  sub_10001AB60(v1 + 32, v7);
  return v1;
}

uint64_t sub_10001AB20()
{
  uint64_t v0;

  sub_10001AA34();
  return swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for DeviceUnlockUIProvider()
{
  return objc_opt_self(_TtC21TDGSharingViewService22DeviceUnlockUIProvider);
}

uint64_t sub_10001AB60(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakDestroy(a1, a2);
  return a1;
}

uint64_t sub_10001AB84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v1 = v0;
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100006C44(v2, (uint64_t)qword_100044E40);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "DeviceUnlockStage deinit", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  sub_10000B6F0((_QWORD *)(v1 + 24));
  swift_release(*(_QWORD *)(v1 + 64));
  return swift_deallocClassInstance(v1, 72, 7);
}

uint64_t type metadata accessor for DeviceUnlockStage()
{
  return objc_opt_self(_TtC21TDGSharingViewService17DeviceUnlockStage);
}

id sub_10001AC90()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  objc_super v8;

  v1 = v0;
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100006C44(v2, (uint64_t)qword_100044E40);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "BYDovePeaceRemoteViewController deinit", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for BYDovePeaceRemoteViewController();
  return objc_msgSendSuper2(&v8, "dealloc");
}

void sub_10001AECC(char *a1, void (*a2)(uint64_t), uint64_t a3)
{
  char *v3;
  char *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  uint8_t *v15;
  _QWORD *v16;
  void *v17;
  char *v18;
  uint64_t v19;
  id v20;
  NSString v21;
  id v22;
  NSString v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  objc_class *v27;
  _BYTE *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char *v36;
  int v37;
  char *v38;
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  void *v50;
  uint64_t v51;
  id v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  _QWORD v59[2];
  uint64_t v60;
  id v61;
  uint64_t v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  objc_super v69;
  char v70[16];
  uint64_t v71[5];
  __int128 v72;
  __int128 v73;
  char *v74;
  uint64_t v75;

  v4 = v3;
  v59[1] = a3;
  v7 = type metadata accessor for Logger(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v68 = (char *)v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v10 = sub_100006C44(v7, (uint64_t)qword_100044E40);
  v11 = a1;
  v64 = v10;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  v14 = os_log_type_enabled(v12, v13);
  v67 = a1;
  v66 = v7;
  v65 = v8;
  if (v14)
  {
    v15 = (uint8_t *)swift_slowAlloc(12, -1);
    v16 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v15 = 138543362;
    v17 = v67;
    if (v67)
    {
      v74 = v11;
      v18 = v11;
      v17 = v67;
    }
    else
    {
      v74 = 0;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75);
    *v16 = v17;

    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Preparing for activation with context: %{public}@", v15, 0xCu);
    v19 = sub_100006CA0(&qword_100042268);
    swift_arrayDestroy(v16, 1, v19);
    swift_slowDealloc(v16, -1, -1);
    swift_slowDealloc(v15, -1, -1);

    v7 = v66;
    v8 = v65;
  }
  else
  {

  }
  v20 = objc_allocWithZone((Class)NSUserDefaults);
  v21 = String._bridgeToObjectiveC()();
  v22 = objc_msgSend(v20, "initWithSuiteName:", v21);

  if (!v22)
    __break(1u);
  v23 = String._bridgeToObjectiveC()();
  v24 = objc_msgSend(v22, "BOOLForKey:", v23);

  type metadata accessor for FlowFactory();
  v25 = *(_QWORD *)&v4[OBJC_IVAR___BYDovePeaceRemoteViewController_appleIDManager];
  v26 = type metadata accessor for MobileKeyBagManager();
  swift_initStackObject(v26, v70);
  v62 = v25;
  sub_10000D7B4(v24, (uint64_t *)&v74);
  v27 = (objc_class *)type metadata accessor for ProxCardPresenter();
  v28 = objc_allocWithZone(v27);
  v29 = swift_unknownObjectWeakInit(&v28[OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_remoteAlertServiceVC], 0);
  *(_QWORD *)&v28[OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_navigationController] = 0;
  *(_QWORD *)&v28[OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredViewController] = 0;
  v28[OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredPushAnimated] = 2;
  swift_unknownObjectWeakAssign(v29, v4);
  v69.receiver = v28;
  v69.super_class = v27;
  v61 = objc_msgSendSuper2(&v69, "init");
  v60 = OBJC_IVAR___BYDovePeaceRemoteViewController_configurationContext;
  v30 = *(void **)&v4[OBJC_IVAR___BYDovePeaceRemoteViewController_configurationContext];
  v63 = v24;
  if (!v30 || (v31 = objc_msgSend(v30, "userInfo")) == 0)
  {
    v72 = 0u;
    v73 = 0u;
    v36 = v68;
LABEL_16:
    sub_10000D75C((uint64_t)&v72);
LABEL_17:
    v37 = 0;
    goto LABEL_18;
  }
  v32 = v31;
  v33 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v31, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  *(_QWORD *)&v72 = 0x726174536F747561;
  *((_QWORD *)&v72 + 1) = 0xE900000000000074;
  AnyHashable.init<A>(_:)(v71, &v72, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v33 + 16) && (v34 = sub_100021834((uint64_t)v71), (v35 & 1) != 0))
  {
    sub_100017C08(*(_QWORD *)(v33 + 56) + 32 * v34, (uint64_t)&v72);
  }
  else
  {
    v72 = 0u;
    v73 = 0u;
  }
  v36 = v68;
  sub_100017BD4((uint64_t)v71);
  swift_bridgeObjectRelease(v33);
  if (!*((_QWORD *)&v73 + 1))
    goto LABEL_16;
  if (!swift_dynamicCast(v71, &v72, (char *)&type metadata for Any + 8, &type metadata for Bool, 6))
    goto LABEL_17;
  v37 = LOBYTE(v71[0]);
LABEL_18:
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v36, v64, v7);
  v38 = v11;
  v39 = Logger.logObject.getter(v38);
  v40 = static os_log_type_t.default.getter();
  v41 = os_log_type_enabled(v39, v40);
  LODWORD(v64) = v37;
  if (v41)
  {
    v42 = swift_slowAlloc(18, -1);
    v43 = swift_slowAlloc(32, -1);
    v71[0] = v43;
    *(_DWORD *)v42 = 67109378;
    LODWORD(v72) = v37;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, (char *)&v72 + 4);
    *(_WORD *)(v42 + 8) = 2082;
    if (!v67)
    {
      __break(1u);
      return;
    }
    v67 = v4;
    v44 = objc_msgSend(v38, "userInfo");
    v59[0] = a2;
    if (v44)
    {
      v45 = v44;
      v46 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v44, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    }
    else
    {
      v46 = sub_10001FC78((uint64_t)&_swiftEmptyArrayStorage);
    }
    v47 = Dictionary.description.getter(v46, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
    v49 = v48;
    swift_bridgeObjectRelease(v46);
    *(_QWORD *)&v72 = sub_100020FBC(v47, v49, v71);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, (char *)&v72 + 8);

    swift_bridgeObjectRelease(v49);
    _os_log_impl((void *)&_mh_execute_header, v39, v40, "Extracted autoStart value: %{BOOL}d from %{public}s", (uint8_t *)v42, 0x12u);
    swift_arrayDestroy(v43, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v43, -1, -1);
    swift_slowDealloc(v42, -1, -1);

    (*(void (**)(char *, uint64_t))(v65 + 8))(v68, v66);
    a2 = (void (*)(_QWORD))v59[0];
    v4 = v67;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v8 + 8))(v36, v7);
  }
  sub_10000B978((uint64_t)&v74, (uint64_t)v71);
  v50 = *(void **)&v4[v60];
  v51 = *(_QWORD *)&v4[OBJC_IVAR___BYDovePeaceRemoteViewController_assetLoader];
  objc_allocWithZone((Class)type metadata accessor for ProxCardFlowEngine());
  v52 = v50;
  v53 = v61;
  v54 = v62;
  swift_retain(v62);
  swift_retain(v51);
  v55 = (void *)sub_1000102D4(v71, v53, v50, v54, v51, v64, v63);
  v56 = *(void **)&v4[OBJC_IVAR___BYDovePeaceRemoteViewController_flowEngine];
  *(_QWORD *)&v4[OBJC_IVAR___BYDovePeaceRemoteViewController_flowEngine] = v55;
  v57 = v55;

  v58 = sub_100010B5C();
  if (a2)
  {
    a2(v58);

    sub_10000B6F0(&v74);
  }
  else
  {
    sub_10000B6F0(&v74);

  }
}

void sub_10001B780(void *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  int v15;
  uint8_t *v16;
  id v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(void);
  uint64_t v30;
  int v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;

  v4 = v3;
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v12 = sub_100006C44(v8, (uint64_t)qword_100044E40);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  v13 = a1;
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, (os_log_type_t)v15))
  {
    v31 = v15;
    v32 = v9;
    v16 = (uint8_t *)swift_slowAlloc(12, -1);
    v30 = swift_slowAlloc(32, -1);
    v35 = v30;
    *(_DWORD *)v16 = 136446210;
    v33 = a1;
    if (!a1)
    {
      __break(1u);
      return;
    }
    v17 = objc_msgSend(v13, "userInfo");
    v28 = a3;
    v29 = a2;
    v27 = v4;
    if (v17)
    {
      v18 = v17;
      v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v17, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    }
    else
    {
      v19 = sub_10001FC78((uint64_t)&_swiftEmptyArrayStorage);
    }
    v20 = Dictionary.description.getter(v19, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
    v22 = v21;
    swift_bridgeObjectRelease(v19);
    v34 = sub_100020FBC(v20, v22, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35);

    swift_bridgeObjectRelease(v22);
    _os_log_impl((void *)&_mh_execute_header, v14, (os_log_type_t)v31, "Received context: %{public}s", v16, 0xCu);
    v23 = v30;
    swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    swift_slowDealloc(v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v8);
    a2 = v29;
    v4 = v27;
    a1 = v33;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  v24 = *(void **)(v4 + OBJC_IVAR___BYDovePeaceRemoteViewController_configurationContext);
  *(_QWORD *)(v4 + OBJC_IVAR___BYDovePeaceRemoteViewController_configurationContext) = a1;
  v25 = v13;

  if (a2)
    a2();
}

id sub_10001BB1C()
{
  void *v0;
  uint64_t v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  objc_class *v11;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v1 = type metadata accessor for Logger(0);
  sub_100006C44(v1, (uint64_t)qword_100044E40);
  v2 = v0;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = swift_slowAlloc(32, -1);
    v14 = v6;
    *(_DWORD *)v5 = 136446210;
    v7 = objc_msgSend(v2, "description");
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    v10 = v9;

    v13 = sub_100020FBC(v8, v10, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14);

    swift_bridgeObjectRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%{public}s view did load", v5, 0xCu);
    swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {

  }
  v11 = (objc_class *)type metadata accessor for BYDovePeaceRemoteViewController();
  v15.receiver = v2;
  v15.super_class = v11;
  return objc_msgSendSuper2(&v15, "viewDidLoad");
}

uint64_t sub_10001BD2C()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t result;
  id v5;
  id v6;
  _OWORD v7[2];
  _BYTE v8[24];
  uint64_t v9;
  objc_super v10;

  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for BYDovePeaceRemoteViewController();
  objc_msgSendSuper2(&v10, "_willAppearInRemoteViewController");
  v1 = objc_msgSend(v0, "_remoteViewControllerProxy");
  if (v1)
  {
    v2 = v1;
    _bridgeAnyObjectToAny(_:)(v7, v1);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_10000D714((uint64_t)v7, (uint64_t)v8);
  if (!v9)
    return sub_10000D75C((uint64_t)v8);
  v3 = sub_100006CA0(&qword_100042658);
  result = swift_dynamicCast(&v6, v8, (char *)&type metadata for Any + 8, v3, 6);
  if ((result & 1) != 0)
  {
    v5 = v6;
    objc_msgSend(v6, "setAllowsBanners:", 0);
    objc_msgSend(v5, "setAllowsAlertStacking:", 1);
    return swift_unknownObjectRelease(v5);
  }
  return result;
}

uint64_t sub_10001BE58(char a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  NSString v22;
  uint64_t v23;
  uint64_t v24;
  objc_class *v25;
  char v27;
  void *v28;
  objc_super v29;
  _OWORD v30[2];
  uint64_t v31[4];

  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v3 = type metadata accessor for Logger(0);
  sub_100006C44(v3, (uint64_t)qword_100044E40);
  v4 = v1;
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v27 = a1;
    v8 = swift_slowAlloc(32, -1);
    v31[0] = v8;
    *(_DWORD *)v7 = 136446210;
    v9 = objc_msgSend(v4, "description");
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v12 = v11;

    *(_QWORD *)&v30[0] = sub_100020FBC(v10, v12, v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v30, (char *)v30 + 8);

    swift_bridgeObjectRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%{public}s view did appear", v7, 0xCu);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    v13 = v8;
    a1 = v27;
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v7, -1, -1);

  }
  else
  {

  }
  v14 = objc_msgSend(v4, "_remoteViewControllerProxy");
  if (v14)
  {
    v15 = v14;
    _bridgeAnyObjectToAny(_:)(v30, v14);
    swift_unknownObjectRelease(v15);
  }
  else
  {
    memset(v30, 0, sizeof(v30));
  }
  sub_10000D714((uint64_t)v30, (uint64_t)v31);
  if (v31[3])
  {
    v16 = sub_100006CA0(&qword_100042658);
    v17 = swift_dynamicCast(&v28, v31, (char *)&type metadata for Any + 8, v16, 6);
    if ((_DWORD)v17)
      v18 = v28;
    else
      v18 = 0;
  }
  else
  {
    v17 = sub_10000D75C((uint64_t)v31);
    v18 = 0;
  }
  v19 = Logger.logObject.getter(v17);
  v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Setting the system idle timer to disabled.", v21, 2u);
    swift_slowDealloc(v21, -1, -1);
  }

  if (v18)
  {
    swift_unknownObjectRetain(v18);
    v22 = String._bridgeToObjectiveC()();
    objc_msgSend(v18, "setIdleTimerDisabled:forReason:", 1, v22);

    swift_unknownObjectRelease(v18);
    v23 = swift_unknownObjectRetain(v18);
    if (SFDeviceHomeButtonType(v23) == 3)
      v24 = 1;
    else
      v24 = 17;
    objc_msgSend(v18, "setDesiredHardwareButtonEvents:", v24);
    swift_unknownObjectRelease(v18);
  }
  v25 = (objc_class *)type metadata accessor for BYDovePeaceRemoteViewController();
  v29.receiver = v4;
  v29.super_class = v25;
  objc_msgSendSuper2(&v29, "viewDidAppear:", a1 & 1);
  return swift_unknownObjectRelease(v18);
}

uint64_t sub_10001C214(char a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  NSString v22;
  objc_class *v23;
  char v25;
  void *v26;
  objc_super v27;
  _OWORD v28[2];
  uint64_t v29[4];

  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v3 = type metadata accessor for Logger(0);
  sub_100006C44(v3, (uint64_t)qword_100044E40);
  v4 = v1;
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v25 = a1;
    v8 = swift_slowAlloc(32, -1);
    v29[0] = v8;
    *(_DWORD *)v7 = 136446210;
    v9 = objc_msgSend(v4, "description");
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v12 = v11;

    *(_QWORD *)&v28[0] = sub_100020FBC(v10, v12, v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v28, (char *)v28 + 8);

    swift_bridgeObjectRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%{public}s view did disappear", v7, 0xCu);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    v13 = v8;
    a1 = v25;
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v7, -1, -1);

  }
  else
  {

  }
  v14 = objc_msgSend(v4, "_remoteViewControllerProxy");
  if (v14)
  {
    v15 = v14;
    _bridgeAnyObjectToAny(_:)(v28, v14);
    swift_unknownObjectRelease(v15);
  }
  else
  {
    memset(v28, 0, sizeof(v28));
  }
  sub_10000D714((uint64_t)v28, (uint64_t)v29);
  if (v29[3])
  {
    v16 = sub_100006CA0(&qword_100042658);
    v17 = swift_dynamicCast(&v26, v29, (char *)&type metadata for Any + 8, v16, 6);
    if ((_DWORD)v17)
      v18 = v26;
    else
      v18 = 0;
  }
  else
  {
    v17 = sub_10000D75C((uint64_t)v29);
    v18 = 0;
  }
  v19 = Logger.logObject.getter(v17);
  v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Setting the system idle timer to enabled.", v21, 2u);
    swift_slowDealloc(v21, -1, -1);
  }

  if (v18)
  {
    swift_unknownObjectRetain(v18);
    v22 = String._bridgeToObjectiveC()();
    objc_msgSend(v18, "setIdleTimerDisabled:forReason:", 0, v22);

    swift_unknownObjectRelease(v18);
    objc_msgSend(v18, "invalidate");
  }
  v23 = (objc_class *)type metadata accessor for BYDovePeaceRemoteViewController();
  v27.receiver = v4;
  v27.super_class = v23;
  objc_msgSendSuper2(&v27, "viewDidDisappear:", a1 & 1);
  return swift_unknownObjectRelease(v18);
}

void sub_10001C5B0(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  int64_t v26;
  unint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[5];

  if (qword_100041E50 != -1)
LABEL_43:
    swift_once(&qword_100041E50, sub_10001A2E8);
  v2 = type metadata accessor for Logger(0);
  v33 = sub_100006C44(v2, (uint64_t)qword_100044E40);
  v3 = Logger.logObject.getter(v33);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Received button action event", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  if (a1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      if (a1 >= 0)
        v6 = a1 & 0xFFFFFFFFFFFFFF8;
      else
        v6 = a1;
      swift_bridgeObjectRetain(a1);
      v7 = __CocoaSet.makeIterator()(v6);
      v8 = sub_10001CFC4();
      v9 = sub_10001D000();
      v10 = Set.Iterator.init(_cocoa:)(v37, v7, v8, v9);
      a1 = v37[0];
      v11 = v37[1];
      v12 = v37[2];
      v13 = v37[3];
      v14 = v37[4];
    }
    else
    {
      v15 = -1 << *(_BYTE *)(a1 + 32);
      v11 = a1 + 56;
      v12 = ~v15;
      v16 = -v15;
      if (v16 < 64)
        v17 = ~(-1 << v16);
      else
        v17 = -1;
      v14 = v17 & *(_QWORD *)(a1 + 56);
      v10 = (_QWORD *)swift_bridgeObjectRetain(a1);
      v13 = 0;
    }
    v32 = v12;
    v18 = (unint64_t)(v12 + 64) >> 6;
    while (1)
    {
      if (a1 < 0)
      {
        v22 = __CocoaSet.Iterator.next()(v10);
        if (!v22)
          goto LABEL_41;
        v23 = v22;
        v35 = v22;
        v24 = sub_10001CFC4();
        swift_unknownObjectRetain(v23);
        swift_dynamicCast(&v36, &v35, (char *)&type metadata for Swift.AnyObject + 8, v24, 7);
        v25 = v36;
        swift_unknownObjectRelease(v23);
        v21 = v13;
        v19 = v14;
        if (!v25)
          goto LABEL_41;
      }
      else
      {
        if (v14)
        {
          v19 = (v14 - 1) & v14;
          v20 = __clz(__rbit64(v14)) | (v13 << 6);
          v21 = v13;
        }
        else
        {
          v26 = v13 + 1;
          if (__OFADD__(v13, 1))
          {
            __break(1u);
            goto LABEL_43;
          }
          if (v26 >= v18)
            goto LABEL_41;
          v27 = *(_QWORD *)(v11 + 8 * v26);
          v21 = v13 + 1;
          if (!v27)
          {
            v21 = v13 + 2;
            if (v13 + 2 >= v18)
              goto LABEL_41;
            v27 = *(_QWORD *)(v11 + 8 * v21);
            if (!v27)
            {
              v21 = v13 + 3;
              if (v13 + 3 >= v18)
                goto LABEL_41;
              v27 = *(_QWORD *)(v11 + 8 * v21);
              if (!v27)
              {
                v21 = v13 + 4;
                if (v13 + 4 >= v18)
                  goto LABEL_41;
                v27 = *(_QWORD *)(v11 + 8 * v21);
                if (!v27)
                {
                  v28 = v13 + 5;
                  while (v18 != v28)
                  {
                    v27 = *(_QWORD *)(v11 + 8 * v28++);
                    if (v27)
                    {
                      v21 = v28 - 1;
                      goto LABEL_36;
                    }
                  }
LABEL_41:
                  sub_10001D048(a1);
                  return;
                }
              }
            }
          }
LABEL_36:
          v19 = (v27 - 1) & v27;
          v20 = __clz(__rbit64(v27)) + (v21 << 6);
        }
        v25 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v20);
        if (!v25)
          goto LABEL_41;
      }
      if ((objc_msgSend(v25, "events", v32) & 0x10) != 0)
      {
        objc_msgSend(v34, "handleHomeButtonPressed");
        v29 = Logger.logObject.getter(objc_msgSend(v25, "sendResponseWithUnHandledEvents:", 0));
        v30 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v29, v30))
        {
          v31 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v31 = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, v30, "Home button event handled", v31, 2u);
          swift_slowDealloc(v31, -1, -1);
        }

      }
      v13 = v21;
      v14 = v19;
    }
  }
  __break(1u);
}

void sub_10001C9D0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;

  v1 = v0;
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100006C44(v2, (uint64_t)qword_100044E40);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Handling home button press event", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  v8 = OBJC_IVAR___BYDovePeaceRemoteViewController_homePressed;
  if ((*((_BYTE *)v0 + OBJC_IVAR___BYDovePeaceRemoteViewController_homePressed) & 1) != 0
    || (v7 = MKBGetDeviceLockState(0), (v7 - 1) > 1))
  {
    v12 = Logger.logObject.getter(v7);
    v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Dismissing due to button press", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }

    objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    v9 = Logger.logObject.getter(v7);
    v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "First button press while locked, deferring dismissal to next button press", v11, 2u);
      swift_slowDealloc(v11, -1, -1);
    }

    *((_BYTE *)v1 + v8) = 1;
  }
}

id sub_10001CC08(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  NSString v18;
  objc_class *v19;
  id v20;
  objc_super v22;
  __int128 v23;
  uint64_t v24;
  _UNKNOWN **v25;
  _QWORD v26[5];

  *(_QWORD *)&v3[OBJC_IVAR___BYDovePeaceRemoteViewController_flowEngine] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___BYDovePeaceRemoteViewController_configurationContext] = 0;
  v6 = OBJC_IVAR___BYDovePeaceRemoteViewController_appleIDManager;
  v7 = type metadata accessor for AppleIDManager();
  *(_QWORD *)&v3[v6] = swift_allocObject(v7, 16, 7);
  v8 = OBJC_IVAR___BYDovePeaceRemoteViewController_assetLoader;
  v9 = type metadata accessor for MobileAssetsDownloader();
  v26[3] = v9;
  v26[4] = &off_10003A128;
  v26[0] = swift_allocObject(v9, 16, 7);
  v10 = type metadata accessor for AssetLoader();
  v11 = swift_allocObject(v10, 64, 7);
  v12 = sub_100017C44((uint64_t)v26, v9);
  __chkstk_darwin(v12);
  v14 = (uint64_t *)((char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v15 + 16))(v14);
  v16 = *v14;
  v24 = v9;
  v25 = &off_10003A128;
  *(_QWORD *)&v23 = v16;
  *(_QWORD *)(v11 + 56) = 0;
  sub_10001830C(&v23, v11 + 16);
  v17 = v3;
  sub_10000B6F0(v26);
  *(_QWORD *)&v3[v8] = v11;
  v17[OBJC_IVAR___BYDovePeaceRemoteViewController_homePressed] = 0;

  if (a2)
  {
    v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v18 = 0;
  }
  v19 = (objc_class *)type metadata accessor for BYDovePeaceRemoteViewController();
  v22.receiver = v17;
  v22.super_class = v19;
  v20 = objc_msgSendSuper2(&v22, "initWithNibName:bundle:", v18, a3);

  return v20;
}

id sub_10001CE10(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  objc_class *v15;
  id v16;
  objc_super v18;
  __int128 v19;
  uint64_t v20;
  _UNKNOWN **v21;
  _QWORD v22[5];

  *(_QWORD *)&v1[OBJC_IVAR___BYDovePeaceRemoteViewController_flowEngine] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___BYDovePeaceRemoteViewController_configurationContext] = 0;
  v3 = OBJC_IVAR___BYDovePeaceRemoteViewController_appleIDManager;
  v4 = type metadata accessor for AppleIDManager();
  *(_QWORD *)&v1[v3] = swift_allocObject(v4, 16, 7);
  v5 = OBJC_IVAR___BYDovePeaceRemoteViewController_assetLoader;
  v6 = type metadata accessor for MobileAssetsDownloader();
  v22[3] = v6;
  v22[4] = &off_10003A128;
  v22[0] = swift_allocObject(v6, 16, 7);
  v7 = type metadata accessor for AssetLoader();
  v8 = swift_allocObject(v7, 64, 7);
  v9 = sub_100017C44((uint64_t)v22, v6);
  __chkstk_darwin(v9);
  v11 = (uint64_t *)((char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v12 + 16))(v11);
  v13 = *v11;
  v20 = v6;
  v21 = &off_10003A128;
  *(_QWORD *)&v19 = v13;
  *(_QWORD *)(v8 + 56) = 0;
  sub_10001830C(&v19, v8 + 16);
  v14 = v1;
  sub_10000B6F0(v22);
  *(_QWORD *)&v1[v5] = v8;
  v14[OBJC_IVAR___BYDovePeaceRemoteViewController_homePressed] = 0;

  v15 = (objc_class *)type metadata accessor for BYDovePeaceRemoteViewController();
  v18.receiver = v14;
  v18.super_class = v15;
  v16 = objc_msgSendSuper2(&v18, "initWithCoder:", a1);

  return v16;
}

uint64_t type metadata accessor for BYDovePeaceRemoteViewController()
{
  return objc_opt_self(BYDovePeaceRemoteViewController);
}

unint64_t sub_10001CFC4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000432D8;
  if (!qword_1000432D8)
  {
    v1 = objc_opt_self(SBUIRemoteAlertButtonAction);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000432D8);
  }
  return result;
}

unint64_t sub_10001D000()
{
  unint64_t result;
  unint64_t v1;

  result = qword_1000432E0;
  if (!qword_1000432E0)
  {
    v1 = sub_10001CFC4();
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_1000432E0);
  }
  return result;
}

uint64_t sub_10001D048(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10001D050()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001D074()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void sub_10001D080(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
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

uint64_t sub_10001D130(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_10001D154@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_10001D184()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v1 = v0;
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100006C44(v2, (uint64_t)qword_100044E40);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "ProxCardPinPairingUI is being deinitialized", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  sub_10001DCBC(v1 + 24);
  return swift_deallocClassInstance(v1, 65, 7);
}

uint64_t type metadata accessor for PinPairingUIProvider()
{
  return objc_opt_self(_TtC21TDGSharingViewService20PinPairingUIProvider);
}

uint64_t sub_10001D290(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  Swift::String v9;
  Swift::String_optional v10;
  Swift::String v11;
  void *object;
  NSString v13;
  id v14;
  id v15;
  Swift::String v16;
  Swift::String_optional v17;
  Swift::String v18;
  void *v19;
  NSString v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  id v32;
  id v33;
  Swift::String v34;
  Swift::String_optional v35;
  Swift::String v36;
  void *v37;
  NSString v38;
  _BYTE v40[24];
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  Swift::String v45;
  Swift::String v46;
  Swift::String v47;

  v2 = v1;
  *(_OWORD *)(v1 + 49) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 24) = 0u;
  v4 = v1 + 24;
  v5 = objc_msgSend(objc_allocWithZone((Class)PRXCardContentViewController), "init");
  *(_QWORD *)(v2 + 16) = v5;
  v6 = (void *)objc_opt_self(NSBundle);
  v7 = v5;
  v8 = objc_msgSend(v6, "mainBundle");
  v45._object = (void *)0xE000000000000000;
  v9._object = (void *)0x800000010002FC60;
  v9._countAndFlagsBits = 0xD000000000000011;
  v10.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v10.value._object = (void *)0xEB00000000656C62;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  v45._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v9, v10, (NSBundle)v8, v11, v45)._object;

  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v7, "setTitle:", v13);

  v14 = *(id *)(v2 + 16);
  v15 = objc_msgSend(v6, "mainBundle");
  v16._countAndFlagsBits = 0xD000000000000014;
  v46._object = (void *)0xE000000000000000;
  v16._object = (void *)0x800000010002FC80;
  v17.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v17.value._object = (void *)0xEB00000000656C62;
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  v46._countAndFlagsBits = 0;
  v19 = NSLocalizedString(_:tableName:bundle:value:comment:)(v16, v17, (NSBundle)v15, v18, v46)._object;

  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v19);
  objc_msgSend(v14, "setSubtitle:", v20);

  objc_msgSend(*(id *)(v2 + 16), "setDismissalType:", 1);
  v21 = *(id *)(v2 + 16);
  sub_1000085CC();

  swift_retain(v2);
  v22 = sub_100006CA0(&qword_100042980);
  v23 = sub_100006D5C(&qword_100042988, &qword_100042980, (uint64_t)&protocol conformance descriptor for CurrentValueSubject<A, B>);
  v24 = Publisher<>.sink(receiveValue:)(sub_10001DCFC, v2, v22, v23);
  swift_release(v2);
  v43 = type metadata accessor for AnyCancellable(0);
  v44 = &protocol witness table for AnyCancellable;
  v41 = v24;
  swift_beginAccess(v4, v40, 33, 0);
  sub_10000FD34((uint64_t)&v41, v4);
  v25 = swift_endAccess(v40);
  CurrentValueSubject.value.getter(&v41, v25);
  v26 = v42;
  if (v42)
  {
    sub_10001D704(v41, v42);
    swift_bridgeObjectRelease(v26);
    swift_release(a1);
    *(_BYTE *)(v2 + 64) = 1;
  }
  else
  {
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v27 = type metadata accessor for Logger(0);
    v28 = sub_100006C44(v27, (uint64_t)qword_100044E40);
    v29 = Logger.logObject.getter(v28);
    v30 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "No pin received from setup pin publisher", v31, 2u);
      swift_slowDealloc(v31, -1, -1);
    }

    v32 = *(id *)(v2 + 16);
    v33 = objc_msgSend(v6, "mainBundle");
    v34._countAndFlagsBits = 0xD00000000000001CLL;
    v47._object = (void *)0xE000000000000000;
    v34._object = (void *)0x800000010002FCA0;
    v35.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v35.value._object = (void *)0xEB00000000656C62;
    v36._countAndFlagsBits = 0;
    v36._object = (void *)0xE000000000000000;
    v47._countAndFlagsBits = 0;
    v37 = NSLocalizedString(_:tableName:bundle:value:comment:)(v34, v35, (NSBundle)v33, v36, v47)._object;

    v38 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v37);
    objc_msgSend(v32, "showActivityIndicatorWithStatus:", v38);

    swift_release(a1);
  }
  return v2;
}

void sub_10001D704(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v13;
  id v14;
  id v15;
  NSString v16;
  id v17;
  os_log_t oslog;

  v3 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v3 = a1 & 0xFFFFFFFFFFFFLL;
  if (v3)
  {
    if ((*(_BYTE *)(v2 + 64) & 1) == 0)
    {
      objc_msgSend(*(id *)(v2 + 16), "hideActivityIndicator");
      v13 = *(void **)(v2 + 16);
      v14 = objc_allocWithZone((Class)UILabel);
      v15 = v13;
      oslog = (os_log_t)objc_msgSend(v14, "init");
      v16 = String._bridgeToObjectiveC()();
      -[NSObject setText:](oslog, "setText:", v16);

      v17 = objc_msgSend((id)objc_opt_self(UIFont), "preferredFontForTextStyle:", UIFontTextStyleLargeTitle);
      -[NSObject setFont:](oslog, "setFont:", v17);

      -[NSObject setTextAlignment:](oslog, "setTextAlignment:", 1);
      sub_100007598(oslog, a1, a2, 0, 4);

      goto LABEL_15;
    }
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v4 = type metadata accessor for Logger(0);
    v5 = sub_100006C44(v4, (uint64_t)qword_100044E40);
    oslog = (os_log_t)Logger.logObject.getter(v5);
    v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v7 = 0;
      v8 = "Already showing the pin";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, oslog, v6, v8, v7, 2u);
      swift_slowDealloc(v7, -1, -1);
    }
  }
  else
  {
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v9 = type metadata accessor for Logger(0);
    v10 = sub_100006C44(v9, (uint64_t)qword_100044E40);
    oslog = (os_log_t)Logger.logObject.getter(v10);
    v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v7 = 0;
      v8 = "Setup pin not yet received. ";
      goto LABEL_13;
    }
  }
LABEL_15:

}

uint64_t sub_10001D96C(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[5];
  _QWORD *v26;

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v24 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *a1;
  v11 = a1[1];
  sub_10000D564();
  v13 = (void *)static OS_dispatch_queue.main.getter();
  v14 = swift_allocObject(&unk_10003A0B8, 24, 7);
  swift_weakInit(v14 + 16, a2);
  v15 = (_QWORD *)swift_allocObject(&unk_10003A0E0, 40, 7);
  v15[2] = v12;
  v15[3] = v11;
  v15[4] = v14;
  aBlock[4] = sub_10001DD54;
  v26 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005DCC;
  aBlock[3] = &unk_10003A0F8;
  v16 = _Block_copy(aBlock);
  v17 = v26;
  swift_bridgeObjectRetain(v11);
  v18 = swift_release(v17);
  static DispatchQoS.unspecified.getter(v18);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v19 = sub_10000D5E8();
  v20 = sub_100006CA0((uint64_t *)&unk_100041FE0);
  v21 = sub_100006D5C((unint64_t *)&qword_100042640, (uint64_t *)&unk_100041FE0, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v20, v21, v4, v19);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v10, v6, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_10001DB88(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  NSObject *oslog;
  _BYTE v13[24];

  if (a2)
  {
    v5 = a3 + 16;
    swift_beginAccess(a3 + 16, v13, 0, 0);
    Strong = swift_weakLoadStrong(v5);
    if (Strong)
    {
      v7 = Strong;
      sub_10001D704(a1, a2);
      swift_release(v7);
    }
  }
  else
  {
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v8 = type metadata accessor for Logger(0);
    v9 = sub_100006C44(v8, (uint64_t)qword_100044E40);
    oslog = Logger.logObject.getter(v9);
    v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v10, "No pin received from setup pin publisher", v11, 2u);
      swift_slowDealloc(v11, -1, -1);
    }

  }
}

uint64_t sub_10001DCBC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006CA0(&qword_100042990);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001DCFC(uint64_t *a1)
{
  uint64_t v1;

  return sub_10001D96C(a1, v1);
}

uint64_t sub_10001DD04()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001DD28()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_10001DD54()
{
  uint64_t v0;

  sub_10001DB88(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_10001DD60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001DD70(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

char *sub_10001DD78(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  char *v12;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain(v4);
  }
  else
  {
    v5 = a1;
    v6 = a2[2];
    *((_QWORD *)a1 + 1) = a2[1];
    *((_QWORD *)a1 + 2) = v6;
    v7 = *(int *)(a3 + 24);
    v8 = &a1[v7];
    v9 = (uint64_t)a2 + v7;
    v10 = type metadata accessor for URL(0);
    v11 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    v12 = v4;
    swift_bridgeObjectRetain(v6);
    v11(v8, v9, v10);
  }
  return v5;
}

uint64_t sub_10001DE24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_10001DE74(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  id v12;

  v5 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v6 = *(_QWORD *)(a2 + 16);
  a1[2] = v6;
  v7 = *(int *)(a3 + 24);
  v8 = (char *)a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for URL(0);
  v11 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v12 = v5;
  swift_bridgeObjectRetain(v6);
  v11(v8, v9, v10);
  return a1;
}

uint64_t sub_10001DEF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(_QWORD *)(a2 + 16);
  v10 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v9;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRelease(v10);
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_10001DF88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_10001DFEC(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v7 = a2[2];
  v8 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = v7;
  swift_bridgeObjectRelease(v8);
  v9 = *(int *)(a3 + 24);
  v10 = a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_10001E068(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001E074);
}

uint64_t sub_10001E074(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for URL(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t sub_10001E0F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001E0FC);
}

char *sub_10001E0FC(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for URL(0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for VisualPairingAppClipCode(uint64_t a1)
{
  uint64_t result;

  result = qword_1000433F0;
  if (!qword_1000433F0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for VisualPairingAppClipCode);
  return result;
}

uint64_t sub_10001E1AC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = &unk_10002BA10;
  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for MobileKeyBagManager()
{
  return objc_opt_self(_TtC21TDGSharingViewService19MobileKeyBagManager);
}

uint64_t type metadata accessor for MobileAssetsDownloader()
{
  return objc_opt_self(_TtC21TDGSharingViewService22MobileAssetsDownloader);
}

uint64_t sub_10001E26C()
{
  uint64_t v0;

  sub_10000B6F0((_QWORD *)(v0 + 16));

  return swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for AssetLoader()
{
  return objc_opt_self(_TtC21TDGSharingViewService11AssetLoader);
}

id sub_10001E2B8()
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
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t ObjCClassFromMetadata;
  id v13;
  NSString v14;
  NSString v15;
  id v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  id v23;
  NSURL *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_100006CA0(&qword_100042170);
  __chkstk_darwin(v2);
  v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v35 - v10;
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v1);
  v13 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v14 = String._bridgeToObjectiveC()();
  v15 = String._bridgeToObjectiveC()();
  v16 = objc_msgSend(v13, "URLForResource:withExtension:", v14, v15);

  if (v16)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v16);

    v17 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v17(v4, v9, v5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
    {
      v17(v11, v4, v5);
      if (qword_100041E40 != -1)
        swift_once(&qword_100041E40, sub_10001A1EC);
      v18 = type metadata accessor for Logger(0);
      v19 = sub_100006C44(v18, (uint64_t)qword_100044E10);
      v20 = Logger.logObject.getter(v19);
      v21 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "Successfully loaded video", v22, 2u);
        swift_slowDealloc(v22, -1, -1);
      }

      v23 = objc_allocWithZone((Class)AVPlayerItem);
      URL._bridgeToObjectiveC()(v24);
      v26 = v25;
      v27 = objc_msgSend(v23, "initWithURL:", v25);

      (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
      return v27;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  }
  sub_1000072A4((uint64_t)v4);
  if (qword_100041E40 != -1)
    swift_once(&qword_100041E40, sub_10001A1EC);
  v28 = type metadata accessor for Logger(0);
  v29 = sub_100006C44(v28, (uint64_t)qword_100044E10);
  v30 = Logger.logObject.getter(v29);
  v31 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc(12, -1);
    v33 = swift_slowAlloc(32, -1);
    v36 = v33;
    *(_DWORD *)v32 = 136446210;
    v35 = sub_100020FBC(0x656369766544, 0xE600000000000000, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36);
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "Unable to load video asset: %{public}s.mov", v32, 0xCu);
    swift_arrayDestroy(v33, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v33, -1, -1);
    swift_slowDealloc(v32, -1, -1);
  }

  return 0;
}

uint64_t sub_10001E6D4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch(sub_10001E6EC, 0, 0);
}

uint64_t sub_10001E6EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (qword_100041E40 != -1)
    swift_once(&qword_100041E40, sub_10001A1EC);
  v1 = type metadata accessor for Logger(0);
  v2 = sub_100006C44(v1, (uint64_t)qword_100044E10);
  *(_QWORD *)(v0 + 32) = v2;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Pre-fetching assets from the server", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  v6 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 40) = static MainActor.shared.getter();
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001E80C, v7, v8);
}

uint64_t sub_10001E80C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  v1 = swift_release(*(_QWORD *)(v0 + 40));
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "ProductKit SPI is not supported. Return nil for product image", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }

  return swift_task_switch(sub_10001E8BC, 0, 0);
}

uint64_t sub_10001E8BC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = (_QWORD *)(v0 + 24);
  v3 = *(void **)(v1 + 56);
  *(_QWORD *)(v1 + 56) = 0;

  v4 = swift_retain_n(v1, 2);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v16 = *(_QWORD *)(v0 + 24);
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = swift_slowAlloc(32, -1);
    *(_DWORD *)v7 = 136446210;
    v17 = v8;
    v9 = *(void **)(v1 + 56);
    *(_QWORD *)(v0 + 16) = v9;
    v10 = v9;
    v11 = sub_100006CA0(&qword_100043618);
    v12 = String.init<A>(describing:)(v0 + 16, v11);
    v14 = v13;
    *(_QWORD *)(v0 + 16) = sub_100020FBC(v12, v13, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v2);
    swift_bridgeObjectRelease(v14);
    swift_release_n(v16, 2);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Downloaded the following image asset: %{public}s from the server. ", v7, 0xCu);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);
  }
  else
  {
    swift_release_n(*v2, 2);
  }

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v1 + 56));
}

uint64_t type metadata accessor for AppleIDAccountUpgradeStage()
{
  return objc_opt_self(_TtC21TDGSharingViewService26AppleIDAccountUpgradeStage);
}

void sub_10001EA88(uint64_t *a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t Strong;
  uint64_t v17;
  uint64_t v18;
  NSObject *oslog;
  uint64_t v20;
  uint64_t v21[3];

  v2 = a1[1];
  if (v2)
  {
    v3 = *a1;
    v4 = a2 + 16;
    v5 = qword_100041E50;
    swift_bridgeObjectRetain(a1[1]);
    if (v5 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v6 = type metadata accessor for Logger(0);
    sub_100006C44(v6, (uint64_t)qword_100044E40);
    v7 = swift_bridgeObjectRetain(v2);
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(12, -1);
      v11 = swift_slowAlloc(32, -1);
      v21[0] = v11;
      *(_DWORD *)v10 = 136315138;
      swift_bridgeObjectRetain(v2);
      v20 = sub_100020FBC(v3, v2, v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, v21);
      swift_bridgeObjectRelease_n(v2, 3);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Received this pin whilst in the introduction stage: %s", v10, 0xCu);
      swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v11, -1, -1);
      swift_slowDealloc(v10, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v2, 2);
    }
    swift_beginAccess(v4, v21, 0, 0);
    Strong = swift_weakLoadStrong(v4);
    if (Strong)
    {
      v17 = Strong;
      v18 = *(_QWORD *)(Strong + 16);
      swift_retain(v18);
      swift_release(v17);
      LOBYTE(v20) = 2;
      PassthroughSubject.send(_:)(&v20);
      swift_release(v18);
    }
  }
  else
  {
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v12 = type metadata accessor for Logger(0);
    v13 = sub_100006C44(v12, (uint64_t)qword_100044E40);
    oslog = Logger.logObject.getter(v13);
    v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v14, "No pin received from setup pin publisher", v15, 2u);
      swift_slowDealloc(v15, -1, -1);
    }

  }
}

uint64_t sub_10001ED54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0;
  v2 = *(_QWORD *)(v0 + 32);
  if (v2)
  {
    swift_retain(v2);
    AnyCancellable.cancel()();
    swift_release(v2);
  }
  swift_release(*(_QWORD *)(v1 + 16));

  swift_release(*(_QWORD *)(v1 + 32));
  return swift_deallocClassInstance(v1, 40, 7);
}

uint64_t type metadata accessor for IntroductionActionHandler()
{
  return objc_opt_self(_TtC21TDGSharingViewService25IntroductionActionHandler);
}

void sub_10001EDD0()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *oslog;

  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_100006C44(v0, (uint64_t)qword_100044E40);
  oslog = Logger.logObject.getter(v1);
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v2, "Unlock background task expired", v3, 2u);
    swift_slowDealloc(v3, -1, -1);
  }

}

void sub_10001EE9C(char a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  NSObject *oslog;
  _QWORD aBlock[5];
  uint64_t v27;

  if (qword_100041E78 != -1)
    swift_once(&qword_100041E78, sub_10001A594);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100006C44(v4, (uint64_t)qword_100044EB8);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Passcode unlock ui completion block is invoked. ", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  if ((a1 & 1) != 0 || MKBGetDeviceLockState(0) - 1 >= 2)
  {
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v12 = sub_100006C44(v4, (uint64_t)qword_100044E40);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc(14, -1);
      *(_DWORD *)v15 = 67109376;
      LODWORD(aBlock[0]) = a1 & 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(aBlock, (char *)aBlock + 4);
      *(_WORD *)(v15 + 8) = 1024;
      LODWORD(aBlock[0]) = MKBGetDeviceLockState(0) - 1 < 2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(aBlock, (char *)aBlock + 4);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "User did unlock the device: %{BOOL}d, isDeviceLocked: %{BOOL}d", (uint8_t *)v15, 0xEu);
      swift_slowDealloc(v15, -1, -1);
    }

    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Starting to ask sharingd to retrigger prox card flow. ", v19, 2u);
      swift_slowDealloc(v19, -1, -1);
    }

    v20 = objc_msgSend(objc_allocWithZone((Class)SFClient), "init");
    v21 = swift_allocObject(&unk_10003A238, 32, 7);
    *(_QWORD *)(v21 + 16) = v20;
    *(_QWORD *)(v21 + 24) = a2;
    aBlock[4] = sub_10001F844;
    v27 = v21;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10001F4A0;
    aBlock[3] = &unk_10003A250;
    v22 = _Block_copy(aBlock);
    v23 = v27;
    v24 = v20;
    swift_release(v23);
    objc_msgSend(v24, "retriggerProximitySetup:", v22);
    _Block_release(v22);

  }
  else if (UIApp)
  {
    objc_msgSend(UIApp, "endBackgroundTask:", a2);
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v9 = sub_100006C44(v4, (uint64_t)qword_100044E40);
    oslog = Logger.logObject.getter(v9);
    v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v10, "User did not unlock device to continue with proximity setup. ", v11, 2u);
      swift_slowDealloc(v11, -1, -1);
    }

  }
  else
  {
    __break(1u);
  }
}

id sub_10001F2A0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id result;
  uint64_t v17;
  uint64_t v18;

  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v6 = type metadata accessor for Logger(0);
  sub_100006C44(v6, (uint64_t)qword_100044E40);
  swift_errorRetain(a1);
  v7 = swift_errorRetain(a1);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v17 = a1;
    v18 = v11;
    *(_DWORD *)v10 = 136446210;
    swift_errorRetain(a1);
    v12 = sub_100006CA0(&qword_100042B18);
    v13 = String.init<A>(describing:)(&v17, v12);
    v15 = v14;
    v17 = sub_100020FBC(v13, v14, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, &v18);
    swift_bridgeObjectRelease(v15);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Retrigger proximity setup completed with error: %{public}s", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);
  }
  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }

  objc_msgSend(a2, "invalidate");
  result = (id)UIApp;
  if (UIApp)
    return objc_msgSend(UIApp, "endBackgroundTask:", a3);
  __break(1u);
  return result;
}

void sub_10001F4A0(uint64_t a1, void *a2)
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

uint64_t sub_10001F4F4(uint64_t a1, int a2)
{
  uint64_t v2;
  void (*v3)(_BOOL8);
  _BOOL8 v4;

  v3 = *(void (**)(_BOOL8))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2 != 0;
  swift_retain(v2);
  v3(v4);
  return swift_release(v2);
}

uint64_t sub_10001F534()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v1 = v0;
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100006C44(v2, (uint64_t)qword_100044E40);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "DeviceUnlockActionHandler deinit", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  return swift_deallocClassInstance(v1, 16, 7);
}

uint64_t type metadata accessor for DeviceUnlockActionHandler()
{
  return objc_opt_self(_TtC21TDGSharingViewService25DeviceUnlockActionHandler);
}

void sub_10001F630()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_100006C44(v0, (uint64_t)qword_100044E40);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Requesting SpringBoard to present passcode unlock UI. ", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }

  v5 = (void *)UIApp;
  if (UIApp)
  {
    v15 = sub_10001EDD0;
    v16 = 0;
    v11 = _NSConcreteStackBlock;
    v12 = 1107296256;
    v13 = sub_100005DCC;
    v14 = &unk_10003A1B0;
    v6 = _Block_copy(&v11);
    v7 = v5;
    v8 = objc_msgSend(v7, "beginBackgroundTaskWithExpirationHandler:", v6);
    _Block_release(v6);

    v9 = swift_allocObject(&unk_10003A1E8, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v15 = sub_10001F818;
    v16 = v9;
    v11 = _NSConcreteStackBlock;
    v12 = 1107296256;
    v13 = sub_10001F4F4;
    v14 = &unk_10003A200;
    v10 = _Block_copy(&v11);
    swift_release(v16);
    SBSRequestPasscodeUnlockUI(v10);
    _Block_release(v10);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10001F7F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001F800(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001F808()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_10001F818(char a1)
{
  uint64_t v1;

  sub_10001EE9C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_10001F820()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

id sub_10001F844(uint64_t a1)
{
  uint64_t v1;

  return sub_10001F2A0(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_10001F85C()
{
  qword_100044EE8 = 0x406F400000000000;
}

void sub_10001F870()
{
  qword_100044EF0 = 0x4061000000000000;
}

void sub_10001F880()
{
  qword_100044EF8 = 0x4077200000000000;
}

void sub_10001F894()
{
  qword_100044F00 = 0x4066800000000000;
}

void sub_10001F8A8()
{
  qword_100044F08 = 0x4028000000000000;
}

void sub_10001F8B8()
{
  qword_100044F10 = 0xC03B000000000000;
}

void sub_10001F8C8()
{
  qword_100044F18 = 0x4039000000000000;
}

double sub_10001F8D8()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  double v5;
  double v6;
  double result;

  v0 = (void *)objc_opt_self(UIScreen);
  v1 = objc_msgSend(v0, "mainScreen");
  objc_msgSend(v1, "nativeBounds");
  v3 = v2;

  v4 = objc_msgSend(v0, "mainScreen");
  objc_msgSend(v4, "nativeBounds");
  v6 = v5;

  result = v6 * 0.208135861;
  qword_100044F20 = v3;
  *(double *)algn_100044F28 = v6 * 0.208135861;
  return result;
}

double sub_10001F97C()
{
  void *v0;
  id v1;
  double v2;
  double v3;
  double v4;
  id v5;
  double v6;
  double v7;
  double result;

  v0 = (void *)objc_opt_self(UIScreen);
  v1 = objc_msgSend(v0, "mainScreen");
  objc_msgSend(v1, "nativeBounds");
  v3 = v2;

  v4 = fmin(v3 + -25.0, 400.0);
  v5 = objc_msgSend(v0, "mainScreen");
  objc_msgSend(v5, "nativeBounds");
  v7 = v6;

  result = fmin(v7 + -25.0, 500.0);
  qword_100044F30 = *(_QWORD *)&v4;
  *(double *)algn_100044F38 = result;
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for ProgressActionHandler(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  swift_retain(v4);
  return a1;
}

uint64_t destroy for ProgressActionHandler(uint64_t a1)
{

  return swift_release(*(_QWORD *)(a1 + 8));
}

uint64_t assignWithCopy for ProgressActionHandler(uint64_t a1, uint64_t a2)
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

  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  swift_retain(v7);
  swift_release(v8);
  return a1;
}

uint64_t assignWithTake for ProgressActionHandler(uint64_t a1, _OWORD *a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  return a1;
}

ValueMetadata *type metadata accessor for ProgressActionHandler()
{
  return &type metadata for ProgressActionHandler;
}

unint64_t sub_10001FB44(uint64_t a1)
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
  sub_100006CA0(&qword_100043890);
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
    sub_1000242DC(v7, (uint64_t)&v16, &qword_100043898);
    v8 = v16;
    v9 = v17;
    result = sub_1000217D0(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_100024238(&v18, (_OWORD *)(v4[7] + 32 * result));
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

unint64_t sub_10001FC78(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006CA0(&qword_100043850);
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
    sub_1000242DC(v7, (uint64_t)v16, &qword_100043858);
    result = sub_100021834((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_100024238(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 72;
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

unint64_t sub_10001FDB8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006CA0(&qword_100043888);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (_BYTE *)(a1 + 48);
  while (1)
  {
    v7 = *((_QWORD *)v6 - 2);
    v8 = *((_QWORD *)v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    result = sub_1000217D0(v7, v8);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v7;
    v12[1] = v8;
    *(_BYTE *)(v4[7] + result) = v9;
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v6 += 24;
    v4[2] = v15;
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

uint64_t sub_10001FEC8(uint64_t a1, uint64_t a2, uint64_t a3)
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
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10000FE98(a1, &qword_100042BB8);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_10003A330, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_100043840, v16);
}

uint64_t sub_100020014(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v4 = sub_100006CA0(&qword_100042BB8);
  __chkstk_darwin(v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v7 = type metadata accessor for Logger(0);
  v8 = sub_100006C44(v7, (uint64_t)qword_100044E40);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    v19 = v12;
    *(_DWORD *)v11 = 136446210;
    v18 = sub_100020FBC(0xD000000000000014, 0x800000010002FEA0, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%{public}s invoked. ", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);
  }

  v13 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v6, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject(&unk_10003A308, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = a1;
  v14[5] = a2;
  v15 = a1;
  swift_retain(a2);
  v16 = sub_10001FEC8((uint64_t)v6, (uint64_t)&unk_100043828, (uint64_t)v14);
  return swift_release(v16);
}

uint64_t sub_100020234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 256) = a4;
  return swift_task_switch(sub_100020298, 0, 0);
}

uint64_t sub_100020298()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;

  if (qword_100041E60 != -1)
    swift_once(&qword_100041E60, sub_10001A410);
  v1 = type metadata accessor for Logger(0);
  v2 = sub_100006C44(v1, (uint64_t)qword_100044E70);
  *(_QWORD *)(v0 + 264) = v2;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Gathering shared setting…", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  v6 = (_QWORD *)swift_task_alloc(dword_10004384C);
  *(_QWORD *)(v0 + 272) = v6;
  *v6 = v0;
  v6[1] = sub_1000203C0;
  return sub_10002278C();
}

uint64_t sub_1000203C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 272);
  *(_QWORD *)(v3 + 280) = a1;
  *(_QWORD *)(v3 + 288) = v1;
  swift_task_dealloc(v4);
  if (v1)
    v5 = sub_100020980;
  else
    v5 = sub_100020470;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100020470()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint8_t *v31;
  void *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t inited;
  unint64_t v36;
  uint64_t v38;
  uint64_t v39;

  v1 = *(_QWORD *)(v0 + 288);
  v2 = (*(uint64_t (**)(void))(**(_QWORD **)(v0 + 280) + 1208))();
  if (v1)
  {
    v3 = v1;
    v4 = *(_QWORD *)(v0 + 280);
    goto LABEL_3;
  }
  v14 = (void *)v2;
  v15 = (void *)objc_opt_self(NSKeyedArchiver);
  *(_QWORD *)(v0 + 232) = 0;
  v16 = objc_msgSend(v15, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, v0 + 232);
  v17 = *(id *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 280);
  if (!v16)
  {
    v32 = v17;
    v3 = _convertNSErrorToError(_:)(v17);

    swift_willThrow();
LABEL_3:
    swift_release(v4);
    swift_errorRetain(v3);
    v5 = swift_errorRetain(v3);
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc(12, -1);
      v9 = swift_slowAlloc(32, -1);
      v39 = v9;
      *(_DWORD *)v8 = 136446210;
      *(_QWORD *)(v0 + 224) = v3;
      swift_errorRetain(v3);
      v10 = sub_100006CA0(&qword_100042178);
      v11 = String.init<A>(describing:)(v0 + 224, v10);
      v13 = v12;
      *(_QWORD *)(v0 + 240) = sub_100020FBC(v11, v12, &v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 240, v0 + 248);
      swift_bridgeObjectRelease(v13);
      swift_errorRelease(v3);
      swift_errorRelease(v3);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "%{public}s", v8, 0xCu);
      swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v9, -1, -1);
      swift_slowDealloc(v8, -1, -1);

      swift_errorRelease(v3);
    }
    else
    {
      swift_errorRelease(v3);
      swift_errorRelease(v3);
      swift_errorRelease(v3);

    }
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v18 = v0 + 16;
  v19 = v0 + 192;
  v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v16);
  v22 = v21;

  swift_release(v4);
  sub_1000241B0(v20, v22);
  sub_1000241B0(v20, v22);
  v23 = sub_1000241B0(v20, v22);
  v24 = Logger.logObject.getter(v23);
  v25 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc(12, -1);
    v38 = swift_slowAlloc(32, -1);
    v39 = v38;
    *(_DWORD *)v26 = 136315138;
    sub_1000241B0(v20, v22);
    v27 = Data.description.getter(v20, v22);
    v29 = v28;
    sub_1000241F4(v20, v22);
    v30 = v27;
    v19 = v0 + 192;
    *(_QWORD *)(v0 + 248) = sub_100020FBC(v30, v29, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 248, v0 + 256);
    swift_bridgeObjectRelease(v29);
    sub_1000241F4(v20, v22);
    sub_1000241F4(v20, v22);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Sending shared settings :%s", v26, 0xCu);
    swift_arrayDestroy(v38, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v38, -1, -1);
    v31 = v26;
    v18 = v0 + 16;
    swift_slowDealloc(v31, -1, -1);
  }
  else
  {
    sub_1000241F4(v20, v22);
    sub_1000241F4(v20, v22);
  }

  v33 = *(_QWORD **)(v0 + 256);
  v34 = sub_100006CA0(&qword_100042320);
  inited = swift_initStackObject(v34, v18);
  *(_OWORD *)(inited + 16) = xmmword_10002BC30;
  *(_QWORD *)(v0 + 208) = 28783;
  *(_QWORD *)(v0 + 216) = 0xE200000000000000;
  AnyHashable.init<A>(_:)((_QWORD *)(inited + 32), v0 + 208, &type metadata for String, &protocol witness table for String);
  *(_QWORD *)(inited + 96) = &type metadata for Int32;
  *(_DWORD *)(inited + 72) = 5;
  *(_QWORD *)(v0 + 192) = 1635017060;
  *(_QWORD *)(v0 + 200) = 0xE400000000000000;
  AnyHashable.init<A>(_:)((_QWORD *)(inited + 104), v19, &type metadata for String, &protocol witness table for String);
  *(_QWORD *)(inited + 168) = &type metadata for Data;
  *(_QWORD *)(inited + 144) = v20;
  *(_QWORD *)(inited + 152) = v22;
  v36 = sub_10001FC78(inited);
  (*(void (**)(unint64_t, uint64_t))((swift_isaMask & *v33) + 0x1E0))(v36, 1);
  sub_1000241F4(v20, v22);
  swift_bridgeObjectRelease(v36);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100020980()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 288);
  swift_errorRetain(v1);
  v2 = swift_errorRetain(v1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = swift_slowAlloc(32, -1);
    *(_DWORD *)v5 = 136446210;
    v12 = v6;
    *(_QWORD *)(v0 + 224) = v1;
    swift_errorRetain(v1);
    v7 = sub_100006CA0(&qword_100042178);
    v8 = String.init<A>(describing:)(v0 + 224, v7);
    v10 = v9;
    *(_QWORD *)(v0 + 240) = sub_100020FBC(v8, v9, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 240, v0 + 248);
    swift_bridgeObjectRelease(v10);
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%{public}s", v5, 0xCu);
    swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

    swift_errorRelease(v1);
  }
  else
  {
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    swift_errorRelease(v1);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100020B58()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100020B8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc(dword_100043824);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1000184A8;
  v3[32] = v2;
  return swift_task_switch(sub_100020298, 0, 0);
}

uint64_t sub_100020BEC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  uint64_t v10;
  id v11;
  void *v12;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v5 = sub_100006CA0(&qword_100042178);
    v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0, 0);
    *v7 = a3;
    v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }
  else
  {
    v12 = a2;
    v10 = *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40);
    v11 = a2;
    sub_100024298((uint64_t)&v12, v10, &qword_100043880);
    return swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_100020C94(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v5 = sub_100006CA0(&qword_100042178);
    v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0, 0);
    *v7 = a3;
    v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }
  else
  {
    if (a2)
    {
      v11 = sub_100006D24(0, &qword_100043878, ACAccount_ptr);
      v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v11);
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;
    sub_100024298((uint64_t)&v13, *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40), &qword_100043870);
    return swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_100020D68(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v5 = sub_100006CA0(&qword_100042178);
    v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0, 0);
    *v7 = a2;
    v8 = a2;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }
  else
  {
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = a3;
    return swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_100020DE8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v5 = sub_100006CA0(&qword_100042178);
    v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0, 0);
    *v7 = a3;
    v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }
  else
  {
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = a2;
    return swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_100020E68(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100020E9C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100020F00;
  return v6(a1);
}

uint64_t sub_100020F00()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100020F4C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v6 = a4();
  v8 = v7;
  v9 = sub_100020FBC(v6, v7, a3);
  v10 = *a1 + 8;
  v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t sub_100020FBC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10002108C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100017C08((uint64_t)v12, *a3);
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
      sub_100017C08((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000B6F0(v12);
  return v7;
}

uint64_t sub_10002108C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100021244(a5, a6);
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
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_100021244(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_1000212D8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100021528(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100021528(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_1000212D8(uint64_t a1, unint64_t a2)
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
      v5 = sub_10002144C(v4, 0);
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

_QWORD *sub_10002144C(uint64_t a1, uint64_t a2)
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
  v4 = sub_100006CA0(&qword_100043830);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000214B0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v5 = a1;
  v6 = a1 >> 16;
  v7 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v13 = String.UTF16View.index(_:offsetBy:)(15, v6, a2);
    v14 = v13 + (v7 << 16);
    v15 = v13 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v16 = v14 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v16 = v15;
    return v16 | 4;
  }
  else
  {
    v8 = String.UTF8View._foreignIndex(_:offsetBy:)(15, v6);
    v9 = v8 + (v7 << 16);
    v10 = v8 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v11 = v9 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v11 = v10;
    return v11 | 8;
  }
}

uint64_t sub_100021528(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100006CA0(&qword_100043830);
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

_BYTE **sub_100021674(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_100021684()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000216A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10004383C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1000184A8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100043838 + dword_100043838))(a1, v4);
}

void *sub_100021718(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawBufferPointer.copyMemory source has too many elements", 69, 2, "Swift/UnsafeRawBufferPointer.swift", 34, 2, 487, 0);
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_1000217AC(uint64_t (*a1)(void))
{
  uint64_t v1;

  v1 = a1();
  return _typeName(_:qualified:)(v1, 0);
}

unint64_t sub_1000217D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100021864(a1, a2, v5);
}

unint64_t sub_100021834(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100021944(a1, v4);
}

unint64_t sub_100021864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100021944(uint64_t a1, uint64_t a2)
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
      sub_100024248(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100017BD4((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100021A08(unint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;

  v3 = a1;
  if (a1 >> 62)
    goto LABEL_34;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  while (v4)
  {
    v5 = v3 & 0xC000000000000001;
    v6 = 4;
    v25 = a2;
    v26 = v3;
    v24 = v3 & 0xC000000000000001;
    while (1)
    {
      v7 = v5 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6 - 4, v3) : *(id *)(v3 + 8 * v6);
      v8 = v7;
      v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1))
        break;
      if (!objc_msgSend(v7, "isActive"))
      {

        goto LABEL_5;
      }
      v10 = v4;
      v11 = objc_msgSend(v8, "aa_altDSID");
      if (v11)
      {
        v12 = v11;
        v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v15 = v14;

        if (a2)
          goto LABEL_13;
      }
      else
      {
        v13 = 0;
        v15 = 0;
        if (a2)
        {
LABEL_13:
          v16 = objc_msgSend(a2, "aa_altDSID");
          if (v16)
          {
            v17 = v16;
            a2 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
            v19 = v18;

            if (!v15)
              goto LABEL_24;
          }
          else
          {
            a2 = 0;
            v19 = 0;
            if (!v15)
            {
LABEL_24:
              a2 = v25;
              if (!v19)
              {
                swift_bridgeObjectRelease(v26);

                return 1;
              }

              swift_bridgeObjectRelease(v19);
              goto LABEL_27;
            }
          }
          goto LABEL_18;
        }
      }
      v19 = 0;
      if (!v15)
        goto LABEL_24;
LABEL_18:
      if (!v19)
      {

        swift_bridgeObjectRelease(v15);
        a2 = v25;
LABEL_27:
        v4 = v10;
        v3 = v26;
        v5 = v24;
        goto LABEL_5;
      }
      if ((void *)v13 == a2 && v15 == v19)
      {
        swift_bridgeObjectRelease(v26);

        swift_bridgeObjectRelease(v15);
        v21 = v19;
LABEL_30:
        swift_bridgeObjectRelease(v21);
        return 1;
      }
      v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v15, a2, v19, 0);

      swift_bridgeObjectRelease(v15);
      swift_bridgeObjectRelease(v19);
      v5 = v24;
      a2 = v25;
      v4 = v10;
      v3 = v26;
      if ((v20 & 1) != 0)
      {
        v21 = v26;
        goto LABEL_30;
      }
LABEL_5:
      ++v6;
      if (v9 == v4)
        goto LABEL_38;
    }
    __break(1u);
LABEL_34:
    if (v3 < 0)
      v23 = v3;
    else
      v23 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v3);
    v4 = _CocoaArrayWrapper.endIndex.getter(v23);
  }
LABEL_38:
  swift_bridgeObjectRelease(v3);
  return 0;
}

void sub_100021C84(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  os_log_type_t v18;
  uint8_t *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *oslog;
  uint64_t v51;
  uint64_t v52;

  v1 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 1240);
  v2 = v1(0);
  v3 = (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 1248))(&_swiftEmptyArrayStorage);
  swift_release(v2);
  v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1256))(&_swiftEmptyArrayStorage);
  swift_release(v4);
  swift_release(v3);
  if (!WiFiManagerClientCreate(kCFAllocatorDefault, 0))
  {
    if (qword_100041E60 != -1)
      swift_once(&qword_100041E60, sub_10001A410);
    v16 = type metadata accessor for Logger(0);
    v17 = sub_100006C44(v16, (uint64_t)qword_100044E70);
    oslog = Logger.logObject.getter(v17);
    v18 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(oslog, v18))
      goto LABEL_53;
    v19 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v19 = 0;
    v20 = "Failed to initialize wiFiManager.";
    goto LABEL_52;
  }
  v5 = WiFiManagerClientCopyDevices();
  if (!v5)
  {
    if (qword_100041E60 == -1)
    {
LABEL_23:
      v21 = type metadata accessor for Logger(0);
      v22 = sub_100006C44(v21, (uint64_t)qword_100044E70);
      oslog = Logger.logObject.getter(v22);
      v18 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(oslog, v18))
        goto LABEL_53;
      v19 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v19 = 0;
      v20 = "Failed to get wifi devices.";
LABEL_52:
      _os_log_impl((void *)&_mh_execute_header, oslog, v18, v20, v19, 2u);
      swift_slowDealloc(v19, -1, -1);
      goto LABEL_53;
    }
LABEL_56:
    swift_once(&qword_100041E60, sub_10001A410);
    goto LABEL_23;
  }
  v6 = (void *)v5;
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, (char *)&type metadata for Swift.AnyObject + 8);

  if (!((unint64_t)v7 >> 62))
  {
    if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_5;
LABEL_48:
    swift_bridgeObjectRelease(v7);
    if (qword_100041E60 != -1)
      swift_once(&qword_100041E60, sub_10001A410);
    v48 = type metadata accessor for Logger(0);
    v49 = sub_100006C44(v48, (uint64_t)qword_100044E70);
    oslog = Logger.logObject.getter(v49);
    v18 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(oslog, v18))
      goto LABEL_53;
    v19 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v19 = 0;
    v20 = "No Wi-Fi devices found.";
    goto LABEL_52;
  }
  if (v7 < 0)
    v46 = v7;
  else
    v46 = v7 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v7);
  v47 = _CocoaArrayWrapper.endIndex.getter(v46);
  swift_bridgeObjectRelease(v7);
  if (!v47)
    goto LABEL_48;
LABEL_5:
  if ((v7 & 0xC000000000000001) != 0)
  {
    v8 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v7);
    goto LABEL_8;
  }
  if (!*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_56;
  }
  v8 = *(_QWORD *)(v7 + 32);
  swift_unknownObjectRetain(v8);
LABEL_8:
  swift_bridgeObjectRelease(v7);
  v9 = WiFiDeviceClientCopyCurrentNetwork(v8);
  if (!v9)
  {
    if (qword_100041E60 != -1)
      swift_once(&qword_100041E60, sub_10001A410);
    v23 = type metadata accessor for Logger(0);
    v24 = sub_100006C44(v23, (uint64_t)qword_100044E70);
    oslog = Logger.logObject.getter(v24);
    v13 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(oslog, v13))
      goto LABEL_30;
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    v15 = "Failed to get current network from device client ref.";
    goto LABEL_29;
  }
  v10 = v9;
  if (WiFiNetworkIsEAP()
    || WiFiNetworkIsProfileBased(v10)
    || WiFiNetworkIsExpirable(v10)
    || WiFiNetworkIsCaptive(v10)
    || WiFiNetworkGetType(v10) == 1)
  {
    if (qword_100041E60 != -1)
      swift_once(&qword_100041E60, sub_10001A410);
    v11 = type metadata accessor for Logger(0);
    v12 = sub_100006C44(v11, (uint64_t)qword_100044E70);
    oslog = Logger.logObject.getter(v12);
    v13 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(oslog, v13))
      goto LABEL_30;
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    v15 = "Current Wi-Fi network is not transferrable.";
LABEL_29:
    _os_log_impl((void *)&_mh_execute_header, oslog, v13, v15, v14, 2u);
    swift_slowDealloc(v14, -1, -1);
LABEL_30:
    swift_unknownObjectRelease(v8);
    goto LABEL_53;
  }
  v25 = (void *)WiFiNetworkCopyPassword(v10);
  if (!v25)
  {
    if (qword_100041E60 != -1)
      swift_once(&qword_100041E60, sub_10001A410);
    v26 = type metadata accessor for Logger(0);
    v27 = sub_100006C44(v26, (uint64_t)qword_100044E70);
    v28 = Logger.logObject.getter(v27);
    v29 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Forcing password to an empty string to handle the case where there is no password on the access point.", v30, 2u);
      swift_slowDealloc(v30, -1, -1);
    }

    sub_100006D24(0, &qword_100043868, NSString_ptr);
    v25 = (void *)NSString.init(stringLiteral:)("", 0, 2);
  }
  v31 = WiFiNetworkCopyRecord(v10);
  if (v31)
  {
    v32 = (void *)v31;
    v33 = v1(1);
    v34 = sub_100006CA0(&qword_100042258);
    v35 = swift_allocObject(v34, 40, 7);
    *(_OWORD *)(v35 + 16) = xmmword_10002BC40;
    *(_QWORD *)(v35 + 32) = v32;
    v51 = v35;
    specialized Array._endMutation()(v35);
    v36 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v33 + 1248);
    v37 = v32;
    v38 = v36(v51);
    swift_release(v33);
    swift_bridgeObjectRelease(v51);
    v39 = swift_allocObject(v34, 40, 7);
    *(_OWORD *)(v39 + 16) = xmmword_10002BC40;
    *(_QWORD *)(v39 + 32) = v25;
    v52 = v39;
    specialized Array._endMutation()(v39);
    v40 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v38 + 1256);
    oslog = v25;
    v41 = v40(v52);
    swift_unknownObjectRelease(v8);
    swift_release(v41);
    swift_release(v38);
    swift_bridgeObjectRelease(v52);

  }
  else
  {
    if (qword_100041E60 != -1)
      swift_once(&qword_100041E60, sub_10001A410);
    v42 = type metadata accessor for Logger(0);
    v43 = sub_100006C44(v42, (uint64_t)qword_100044E70);
    oslog = Logger.logObject.getter(v43);
    v44 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(oslog, v44))
    {
      swift_unknownObjectRelease(v8);

      return;
    }
    v45 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v45 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v44, "Failed to get Wi-Fi record.", v45, 2u);
    swift_slowDealloc(v45, -1, -1);
    swift_unknownObjectRelease(v8);

  }
LABEL_53:

}

void sub_1000223F0(uint64_t a1)
{
  id v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  id v12;
  unsigned int v13;
  uint64_t v14;

  v12 = objc_msgSend(objc_allocWithZone((Class)MBManager), "init");
  v2 = objc_msgSend(v12, "restoreState");
  if (!v2)
    goto LABEL_4;
  v3 = v2;
  v4 = objc_msgSend(v2, "state");

  if (v4 <= 6)
  {
    if (((1 << v4) & 0x71) == 0)
    {
      v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 1328))(1);
      goto LABEL_6;
    }
LABEL_4:
    v5 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 1328))(0);
LABEL_6:
    swift_release(v5);

    return;
  }
  if (qword_100041E60 != -1)
    swift_once(&qword_100041E60, sub_10001A410);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100006C44(v6, (uint64_t)qword_100044E70);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v10 = 67109120;
    v13 = v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Unrecognized restore state: MBState == %u", v10, 8u);
    swift_slowDealloc(v10, -1, -1);
  }

  v11 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 1328))(0);
  swift_release(v11);

}

uint64_t sub_1000225C4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 128) = a1;
  return swift_task_switch(sub_1000225DC, 0, 0);
}

uint64_t sub_1000225DC()
{
  _QWORD *v0;
  _QWORD *v1;
  id v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0 + 2;
  v2 = objc_msgSend((id)objc_opt_self(FMDFMIPManager), "sharedInstance");
  v0[17] = v2;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_10002269C;
  v3 = swift_continuation_init(v0 + 2, 1);
  v0[10] = _NSConcreteStackBlock;
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_100020DE8;
  v4[3] = &unk_10003A390;
  v4[4] = v3;
  objc_msgSend(v2, "fmipStateWithCompletion:", v4);
  return swift_continuation_await(v1);
}

uint64_t sub_10002269C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 144) = v1;
  if (v1)
    v2 = sub_10002274C;
  else
    v2 = sub_1000226FC;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000226FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 120);

  v3 = (*(uint64_t (**)(BOOL))(*(_QWORD *)v1 + 1376))(v2 == 1);
  swift_release(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002274C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 136);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002278C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = type metadata accessor for TimeZone(0);
  v0[56] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[57] = v2;
  v0[58] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100022814, 0, 0);
}

uint64_t sub_100022814()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  CFPropertyListRef v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  _QWORD *v18;

  if (qword_100041E60 != -1)
    swift_once(&qword_100041E60, sub_10001A410);
  v1 = type metadata accessor for Logger(0);
  v2 = sub_100006C44(v1, (uint64_t)qword_100044E70);
  v0[59] = v2;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Creating builder", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  v6 = type metadata accessor for WFSetupData.Builder(0);
  swift_allocObject(v6, 328, 7);
  v7 = WFSetupData.Builder.init()();
  v0[60] = v7;
  v8 = (__CFString *)String._bridgeToObjectiveC()();
  v9 = CFPreferencesCopyValue(v8, kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);

  v10 = (*(uint64_t (**)(CFPropertyListRef))(*(_QWORD *)v7 + 1216))(v9);
  swift_unknownObjectRelease(v9);
  v11 = swift_release(v10);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Retrieve Apple Keyboards", v14, 2u);
    swift_slowDealloc(v14, -1, -1);
  }

  v15 = v0 + 10;
  v16 = objc_msgSend(objc_allocWithZone((Class)ACAccountStore), "init");
  v0[61] = v16;
  v0[15] = v0 + 51;
  v0[10] = v0;
  v0[11] = sub_100022AC4;
  v17 = swift_continuation_init(v0 + 10, 1);
  v0[26] = _NSConcreteStackBlock;
  v18 = v0 + 26;
  v18[1] = 0x40000000;
  v18[2] = sub_100020BEC;
  v18[3] = &unk_10003A348;
  v18[4] = v17;
  objc_msgSend(v16, "aa_primaryAppleAccountWithCompletion:", v18);
  return swift_continuation_await(v15);
}

uint64_t sub_100022AC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 112);
  *(_QWORD *)(*(_QWORD *)v0 + 496) = v1;
  if (v1)
    v2 = sub_100023FF0;
  else
    v2 = sub_100022B68;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_100022B68()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;

  v1 = *(void **)(v0 + 408);
  *(_QWORD *)(v0 + 504) = v1;
  if (v1 && (v2 = objc_msgSend(v1, "username")) != 0)
  {
    v3 = v2;
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
    v6 = v5;

  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = v0 + 16;
  v8 = *(void **)(v0 + 488);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)(v0 + 480) + 1224))(v4, v6);
  swift_release(v9);
  swift_bridgeObjectRelease(v6);
  v10 = objc_msgSend(v8, "accountTypeWithAccountTypeIdentifier:", ACAccountTypeIdentifieriTunesStore);
  *(_QWORD *)(v0 + 512) = v10;
  *(_QWORD *)(v0 + 56) = v0 + 432;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_100022CD8;
  v11 = swift_continuation_init(v0 + 16, 1);
  *(_QWORD *)(v0 + 248) = _NSConcreteStackBlock;
  v12 = (_QWORD *)(v0 + 248);
  v12[1] = 0x40000000;
  v12[2] = sub_100020C94;
  v12[3] = &unk_10003A360;
  v12[4] = v11;
  objc_msgSend(v8, "accountsWithAccountType:options:completion:", v10, 0, v12);
  return swift_continuation_await(v7);
}

uint64_t sub_100022CD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 520) = v1;
  if (v1)
    v2 = sub_100024070;
  else
    v2 = sub_100022D7C;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_100022D7C()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __CFString *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __CFString *v62;
  int v63;
  uint64_t v64;
  id v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  id v76;
  id v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;

  v1 = *(_QWORD *)(v0 + 432);
  if (v1)
  {
    v2 = *(void **)(v0 + 504);
    v3 = v2;
    v4 = sub_100021A08(v1, v2);

    swift_bridgeObjectRelease(v1);
  }
  else
  {
    v4 = 0;
  }
  v5 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v0 + 480) + 1232))(v4 & 1);
  v6 = swift_release(v5);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Retrieve Apple ID", v9, 2u);
    swift_slowDealloc(v9, -1, -1);
  }
  v10 = *(_QWORD *)(v0 + 480);
  v12 = *(_QWORD *)(v0 + 456);
  v11 = *(_QWORD *)(v0 + 464);
  v13 = *(_QWORD *)(v0 + 448);

  sub_100021C84(v10);
  v14 = TMIsAutomaticTimeZoneEnabled() != 0;
  v15 = (*(uint64_t (**)(_BOOL8))(*(_QWORD *)v10 + 1272))(v14);
  v16 = objc_msgSend((id)objc_opt_self(NSTimeZone), "systemTimeZone");
  static TimeZone._unconditionallyBridgeFromObjectiveC(_:)();

  v17 = TimeZone.identifier.getter();
  v19 = v18;
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  v20 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v15 + 1280))(v17, v19);
  swift_release(v15);
  swift_release(v20);
  swift_bridgeObjectRelease(v19);
  v21 = objc_msgSend((id)objc_opt_self(NSLocale), "archivedPreferences");
  v22 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v21, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v23 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 1264))(v22);
  swift_bridgeObjectRelease(v22);
  v24 = swift_release(v23);
  v25 = _AXSCopySettingsDataBlobForBuddy(v24);
  if (v25)
  {
    v26 = (void *)v25;
    v27 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v25);
    v29 = v28;

  }
  else
  {
    v27 = 0;
    v29 = 0xF000000000000000;
  }
  v30 = *(_QWORD *)(v0 + 504);
  v31 = (*(uint64_t (**)(uint64_t, unint64_t))(**(_QWORD **)(v0 + 480) + 1288))(v27, v29);
  sub_100024284(v27, v29);
  swift_release(v31);
  if (v30)
  {
    v32 = objc_msgSend(*(id *)(v0 + 504), "aa_firstName");
    if (v32)
    {
      v33 = v32;
      v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
      v35 = v34;

      goto LABEL_14;
    }
    v30 = 0;
  }
  v35 = 0;
LABEL_14:
  v36 = (*(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)(v0 + 480) + 1296))(v30, v35);
  swift_bridgeObjectRelease(v35);
  v37 = CFSTR("ProductType");
  v38 = MGCopyAnswer(CFSTR("ProductType"), 0);

  if (v38)
  {
    v39 = objc_opt_self(NSString);
    v40 = swift_dynamicCastObjCClass(v38, v39);
    if (v40)
    {
      v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
      v43 = v42;
      swift_unknownObjectRelease(v38);
      goto LABEL_19;
    }
    swift_unknownObjectRelease(v38);
  }
  v41 = 0;
  v43 = 0;
LABEL_19:
  v44 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v36 + 1304))(v41, v43);
  swift_release(v36);
  swift_bridgeObjectRelease(v43);
  v45 = CFSTR("DeviceClass");
  v46 = MGCopyAnswer(CFSTR("DeviceClass"), 0);

  if (v46)
  {
    v47 = objc_opt_self(NSString);
    v48 = swift_dynamicCastObjCClass(v46, v47);
    if (v48)
    {
      v49 = static String._unconditionallyBridgeFromObjectiveC(_:)(v48);
      v51 = v50;
      swift_unknownObjectRelease(v46);
      goto LABEL_24;
    }
    swift_unknownObjectRelease(v46);
  }
  v49 = 0;
  v51 = 0;
LABEL_24:
  v52 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v44 + 1312))(v49, v51);
  swift_release(v44);
  swift_bridgeObjectRelease(v51);
  v53 = CFSTR("UserAssignedDeviceName");
  v54 = MGCopyAnswer(CFSTR("UserAssignedDeviceName"), 0);

  if (v54)
  {
    v55 = objc_opt_self(NSString);
    v56 = swift_dynamicCastObjCClass(v54, v55);
    if (v56)
    {
      v57 = static String._unconditionallyBridgeFromObjectiveC(_:)(v56);
      v59 = v58;
      swift_unknownObjectRelease(v54);
      goto LABEL_29;
    }
    swift_unknownObjectRelease(v54);
  }
  v57 = 0;
  v59 = 0;
LABEL_29:
  v60 = *(_QWORD *)(v0 + 480);
  v61 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v52 + 1336))(v57, v59);
  swift_release(v52);
  swift_bridgeObjectRelease(v59);
  v62 = CFSTR("JwLB44/jEB8aFDpXQ16Tuw");
  v63 = MGGetSInt32Answer(CFSTR("JwLB44/jEB8aFDpXQ16Tuw"), 0);

  v64 = (*(uint64_t (**)(BOOL))(*(_QWORD *)v61 + 1320))(v63 != 2);
  swift_release(v61);
  swift_release(v64);
  v65 = objc_msgSend(objc_allocWithZone((Class)MBManager), "init");
  *(_QWORD *)(v0 + 528) = v65;
  sub_1000223F0(v60);
  v66 = objc_msgSend(v65, "backupDeviceUUID");
  if (v66)
  {
    v67 = v66;
    v68 = static String._unconditionallyBridgeFromObjectiveC(_:)(v66);
    v70 = v69;

  }
  else
  {
    v68 = 0;
    v70 = 0;
  }
  v71 = *(_QWORD *)(v0 + 480);
  v72 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v71 + 1344))(v68, v70);
  swift_bridgeObjectRelease(v70);
  v73 = (*(uint64_t (**)(id))(*(_QWORD *)v72 + 1352))(objc_msgSend(v65, "isBackupEnabled"));
  swift_release(v72);
  swift_release(v73);
  v74 = (void *)objc_opt_self(CLLocationManager);
  v75 = (*(uint64_t (**)(id))(*(_QWORD *)v71 + 1360))(objc_msgSend(v74, "locationServicesEnabled"));
  *(_QWORD *)(v0 + 424) = 0;
  v76 = objc_msgSend(v74, "_archivedAuthorizationDecisionsWithError:", v0 + 424);
  v77 = *(id *)(v0 + 424);
  if (v76)
  {
    v78 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v76);
    v80 = v79;

    v81 = (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)v75 + 1368))(v78, v80);
    swift_release(v75);
    swift_release(v81);
    sub_1000241F4(v78, v80);
    v82 = (_QWORD *)swift_task_alloc(dword_100043864);
    *(_QWORD *)(v0 + 536) = v82;
    *v82 = v0;
    v82[1] = sub_1000234C4;
    v82[16] = *(_QWORD *)(v0 + 480);
    return swift_task_switch(sub_1000225DC, 0, 0);
  }
  else
  {
    v84 = v77;
    v86 = *(void **)(v0 + 504);
    v85 = *(void **)(v0 + 512);
    v87 = *(_QWORD *)(v0 + 480);
    v88 = *(void **)(v0 + 488);
    swift_release(v75);
    _convertNSErrorToError(_:)(v84);

    swift_willThrow();
    swift_release(v87);

    swift_task_dealloc(*(_QWORD *)(v0 + 464));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1000234C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 536);
  *(_QWORD *)(*(_QWORD *)v1 + 544) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_100023928;
  else
    v3 = sub_10002356C;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_10002356C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSString v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSString v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;

  static String._unconditionallyBridgeFromObjectiveC(_:)(MCFeatureDiagnosticsSubmissionAllowed);
  v2 = v1;
  v3 = (void *)objc_opt_self(MCProfileConnection);
  v4 = objc_msgSend(v3, "sharedConnection");
  if (!v4)
  {
    __break(1u);
    goto LABEL_9;
  }
  v5 = v4;
  v6 = v0[60];
  v7 = String._bridgeToObjectiveC()();
  v8 = objc_msgSend(v5, "userBoolValueForSetting:", v7);

  swift_bridgeObjectRelease(v2);
  v9 = (*(uint64_t (**)(BOOL))(*(_QWORD *)v6 + 1384))(v8 == 1);
  static String._unconditionallyBridgeFromObjectiveC(_:)(MCFeatureAppAnalyticsAllowed);
  v11 = v10;
  v12 = objc_msgSend(v3, "sharedConnection");
  if (!v12)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
  }
  v13 = v12;
  v14 = String._bridgeToObjectiveC()();
  v15 = objc_msgSend(v13, "userBoolValueForSetting:", v14);

  swift_bridgeObjectRelease(v11);
  v16 = (*(uint64_t (**)(BOOL))(*(_QWORD *)v9 + 1392))(v15 == 1);
  swift_release(v9);
  v17 = (void *)objc_opt_self(AFPreferences);
  v0[69] = v17;
  v18 = objc_msgSend(v17, "sharedPreferences");
  v19 = objc_msgSend(v18, "assistantIsEnabled");

  v20 = (*(uint64_t (**)(id))(*(_QWORD *)v16 + 1400))(v19);
  swift_release(v16);
  v21 = objc_msgSend((id)objc_opt_self(VTPreferences), "sharedPreferences");
  if (!v21)
    goto LABEL_10;
  v22 = v21;
  v23 = objc_msgSend(v21, "voiceTriggerEnabled");

  v24 = (*(uint64_t (**)(id))(*(_QWORD *)v20 + 1408))(v23);
  swift_release(v20);
  v25 = objc_msgSend(v17, "sharedPreferences");
  v26 = objc_msgSend(v25, "languageCode");

  if (v26)
  {
    v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
    v29 = v28;

  }
  else
  {
    v27 = 0;
    v29 = 0;
  }
  v30 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v24 + 1416))(v27, v29);
  swift_release(v24);
  swift_bridgeObjectRelease(v29);
  v31 = objc_msgSend(v17, "sharedPreferences");
  v32 = objc_msgSend(v31, "outputVoice");

  v0[70] = (*(uint64_t (**)(id))(*(_QWORD *)v30 + 1424))(v32);
  swift_release(v30);
  v33 = objc_msgSend(objc_allocWithZone((Class)AFSettingsConnection), "init");
  v0[71] = v33;
  v0[23] = v0 + 55;
  v0[18] = v0;
  v0[19] = sub_1000239BC;
  v0[40] = swift_continuation_init(v0 + 18, 1);
  v0[36] = _NSConcreteStackBlock;
  v0[37] = 0x40000000;
  v0[38] = sub_100020D68;
  v0[39] = &unk_10003A378;
  objc_msgSend(v33, "getSiriDataSharingOptInStatusWithCompletion:", v0 + 36);
  return swift_continuation_await(v0 + 18);
}

uint64_t sub_100023928()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(v0 + 504);
  v1 = *(void **)(v0 + 512);
  v3 = *(_QWORD *)(v0 + 480);
  v4 = *(void **)(v0 + 488);

  swift_release(v3);
  swift_task_dealloc(*(_QWORD *)(v0 + 464));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000239BC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 176);
  *(_QWORD *)(*v0 + 576) = v2;
  if (v2)
  {
    swift_release(*(_QWORD *)(v1 + 560));
    v3 = sub_100024104;
  }
  else
  {
    v3 = sub_100023A68;
  }
  return swift_task_switch(v3, 0, 0);
}

void *sub_100023A68()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *result;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;

  v1 = *(_QWORD *)(v0 + 560);
  v2 = *(void **)(v0 + 552);
  v3 = *(_QWORD *)(v0 + 440);

  v4 = (*(uint64_t (**)(BOOL))(*(_QWORD *)v1 + 1432))(v3 == 1);
  swift_release(v1);
  v5 = objc_msgSend(v2, "sharedPreferences");
  v6 = objc_msgSend(v5, "dictationIsEnabled");

  v7 = (*(uint64_t (**)(id))(*(_QWORD *)v4 + 1440))(v6);
  swift_release(v4);
  v8 = objc_msgSend(v2, "sharedPreferences");
  v9 = objc_msgSend(v8, "suppressDictationOptIn");

  v10 = (*(uint64_t (**)(id))(*(_QWORD *)v7 + 1448))(v9);
  swift_release(v7);
  swift_release(v10);
  if (((unint64_t)objc_msgSend((id)objc_opt_self(BYLicenseAgreement), "versionOfAcceptedAgreement") & 0x8000000000000000) != 0)__break(1u);
  v11 = (*(uint64_t (**)(void))(**(_QWORD **)(v0 + 480) + 1456))();
  v12 = swift_release(v11);
  result = (void *)_CFCopySystemVersionDictionary(v12);
  if (!result)
    goto LABEL_12;
  if (_kCFSystemVersionProductVersionKey)
  {
    v14 = result;
    v15 = objc_msgSend(result, "valueForKey:");
    if (v15)
    {
      v16 = v15;
      _bridgeAnyObjectToAny(_:)((_QWORD *)(v0 + 328), v15);
      swift_unknownObjectRelease(v16);
    }
    else
    {
      *(_OWORD *)(v0 + 328) = 0u;
      *(_OWORD *)(v0 + 344) = 0u;
    }
    sub_100024298(v0 + 328, v0 + 360, &qword_100042650);
    if (*(_QWORD *)(v0 + 384))
    {
      if ((swift_dynamicCast(v0 + 392, v0 + 360, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
      {
        v17 = *(_QWORD *)(v0 + 400);
        v18 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(v0 + 480) + 1464))(*(_QWORD *)(v0 + 392), v17);
        swift_release(v18);
        swift_bridgeObjectRelease(v17);
      }

    }
    else
    {

      sub_10000FE98(v0 + 360, &qword_100042650);
    }
LABEL_12:
    v19 = dword_100042310;
    v20 = (_QWORD *)swift_task_alloc(unk_100042314);
    *(_QWORD *)(v0 + 584) = v20;
    *v20 = v0;
    v20[1] = sub_100023CE0;
    return (void *)((uint64_t (__cdecl *)())((char *)&dword_100042310 + v19))();
  }
  __break(1u);
  return result;
}

uint64_t sub_100023CE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 584);
  *(_QWORD *)(*(_QWORD *)v1 + 592) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100023D68, 0, 0);
}

uint64_t sub_100023D68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v24;

  v1 = *(_QWORD *)(v0 + 592);
  v2 = (*(uint64_t (**)(uint64_t))(**(_QWORD **)(v0 + 480) + 1480))(v1);
  swift_release(v2);
  swift_bridgeObjectRelease(v1);
  v3 = objc_msgSend((id)objc_opt_self(PKPassLibrary), "sharedInstance");
  if (!v3)
    __break(1u);
  v4 = v3;
  v5 = objc_msgSend(v3, "backupMetadata");

  if (v5)
  {
    v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v5);
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0xF000000000000000;
  }
  v9 = (*(uint64_t (**)(uint64_t, unint64_t))(**(_QWORD **)(v0 + 480) + 1488))(v6, v8);
  swift_release(v9);
  v10 = sub_100024284(v6, v8);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(12, -1);
    v14 = swift_slowAlloc(32, -1);
    v24 = v14;
    *(_DWORD *)v13 = 136446210;
    *(_QWORD *)(v0 + 416) = sub_100020FBC(0xD000000000000021, 0x8000000100030100, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 416, v0 + 424);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Creating %{public}s", v13, 0xCu);
    swift_arrayDestroy(v14, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v13, -1, -1);
  }

  v15 = *(void **)(v0 + 528);
  v16 = *(void **)(v0 + 504);
  v17 = *(void **)(v0 + 512);
  v18 = *(_QWORD *)(v0 + 480);
  v19 = *(void **)(v0 + 488);
  v20 = *(_QWORD *)(v0 + 464);
  v21 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for WFSetupServerAnisetteDataProvider(0)), "init");
  v22 = (*(uint64_t (**)(void))(*(_QWORD *)v18 + 1472))();

  swift_release(v22);
  swift_task_dealloc(v20);
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 480));
}

uint64_t sub_100023FF0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 488);
  v2 = *(_QWORD *)(v0 + 480);
  swift_willThrow();
  swift_release(v2);

  swift_task_dealloc(*(_QWORD *)(v0 + 464));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100024070()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(v0 + 504);
  v1 = *(void **)(v0 + 512);
  v3 = *(_QWORD *)(v0 + 480);
  v4 = *(void **)(v0 + 488);
  swift_willThrow();
  swift_release(v3);

  swift_task_dealloc(*(_QWORD *)(v0 + 464));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100024104()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v1 = *(void **)(v0 + 568);
  v2 = *(void **)(v0 + 528);
  v4 = *(void **)(v0 + 504);
  v3 = *(void **)(v0 + 512);
  v5 = *(_QWORD *)(v0 + 480);
  v6 = *(void **)(v0 + 488);
  swift_willThrow();
  swift_release(v5);

  swift_task_dealloc(*(_QWORD *)(v0 + 464));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000241B0(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000241F4(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

_OWORD *sub_100024238(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100024248(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100024284(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1000241F4(result, a2);
  return result;
}

uint64_t sub_100024298(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100006CA0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000242DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100006CA0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100024324(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  uint64_t v26;
  _UNKNOWN **v27;

  v5 = v4;
  *(_BYTE *)(v5 + 16) = 3;
  v10 = type metadata accessor for IntroductionActionHandler();
  v11 = (_QWORD *)swift_allocObject(v10, 40, 7);
  v12 = sub_100006CA0(&qword_100042B30);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  v13 = a1;
  v14 = swift_retain(a2);
  v15 = PassthroughSubject.init()(v14);
  v11[3] = v13;
  v11[4] = 0;
  v11[2] = v15;
  *(_QWORD *)&v25 = a2;
  v16 = swift_allocObject(&unk_10003A418, 24, 7);
  swift_weakInit(v16 + 16, v11);
  v17 = v13;
  v18 = sub_100006CA0(&qword_100043958);
  v19 = sub_100024528();
  v20 = Publisher<>.sink(receiveValue:)(sub_100024520, v16, v18, v19);
  swift_release(a2);
  swift_release(v16);

  v21 = v11[4];
  v11[4] = v20;
  swift_release(v21);
  *(_QWORD *)(v5 + 64) = v11;
  v22 = type metadata accessor for IntroductionUIProvider();
  swift_allocObject(v22, 33, 7);
  swift_retain_n(v11, 2);
  swift_retain(a3);
  v23 = sub_10000AB7C((uint64_t)v11, a3, a4);
  v26 = v22;
  v27 = &off_100039558;
  swift_release(v11);

  swift_release(a2);
  swift_release(a3);
  *(_QWORD *)&v25 = v23;
  sub_10001830C(&v25, v5 + 24);
  return v5;
}

uint64_t type metadata accessor for IntroductionStage()
{
  return objc_opt_self(_TtC21TDGSharingViewService17IntroductionStage);
}

uint64_t sub_1000244FC()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_100024520(uint64_t *a1)
{
  uint64_t v1;

  sub_10001EA88(a1, v1);
}

unint64_t sub_100024528()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100043960;
  if (!qword_100043960)
  {
    v1 = sub_100006CE0(&qword_100043958);
    result = swift_getWitnessTable(&protocol conformance descriptor for AnyPublisher<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100043960);
  }
  return result;
}

uint64_t sub_100024574()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6E776F6E6B6E75;
  if (*v0 != 1)
    v1 = 0x73736563637573;
  if (*v0)
    return v1;
  else
    return 0x64656C696166;
}

uint64_t ProxCardLayoutCache.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 33, 7);
}

uint64_t type metadata accessor for ProxCardLayoutCache()
{
  return objc_opt_self(_TtC21TDGSharingViewService19ProxCardLayoutCache);
}

uint64_t sub_1000245FC()
{
  char *v0;
  char *v1;
  uint64_t Strong;
  double v3;
  double v4;
  int v5;
  id v6;
  id v7;
  uint64_t *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  char v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;

  v22.receiver = v0;
  v22.super_class = (Class)type metadata accessor for ViewServiceUIViewControllerExtendedHeight();
  objc_msgSendSuper2(&v22, "viewDidLayoutSubviews");
  v1 = &v0[OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_layoutCache];
  Strong = swift_weakLoadStrong(&v0[OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_layoutCache]);
  if (!Strong
    || (v3 = *(double *)(Strong + 16),
        v4 = *(double *)(Strong + 24),
        v5 = *(unsigned __int8 *)(Strong + 32),
        swift_release(Strong),
        v5 == 1))
  {
    v6 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 == (id)1)
    {
      if (qword_100041EC8 != -1)
        swift_once(&qword_100041EC8, sub_10001F97C);
      v8 = &qword_100044F30;
    }
    else
    {
      if (qword_100041EC0 != -1)
        swift_once(&qword_100041EC0, sub_10001F8D8);
      v8 = &qword_100044F20;
    }
    v3 = *(double *)v8;
    v4 = *((double *)v8 + 1);
  }
  objc_msgSend(v0, "preferredContentSize");
  if (v4 > v9)
    v9 = v4;
  objc_msgSend(v0, "setPreferredContentSize:", v3, v9);
  objc_msgSend(v0, "preferredContentSize");
  v11 = v10;
  v13 = v12;
  v14 = swift_weakLoadStrong(v1);
  if (!v14
    || (v15 = *(double *)(v14 + 16),
        v16 = *(double *)(v14 + 24),
        v17 = *(_BYTE *)(v14 + 32),
        result = swift_release(v14),
        (v17 & 1) != 0)
    || v15 * v16 < v11 * v13)
  {
    result = swift_weakLoadStrong(v1);
    if (result)
    {
      v19 = result;
      objc_msgSend(v0, "preferredContentSize");
      *(_QWORD *)(v19 + 16) = v20;
      *(_QWORD *)(v19 + 24) = v21;
      *(_BYTE *)(v19 + 32) = 0;
      return swift_release(v19);
    }
  }
  return result;
}

id sub_1000248E8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ViewServiceUIViewControllerExtendedHeight();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ViewServiceUIViewControllerExtendedHeight()
{
  return objc_opt_self(_TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight);
}

uint64_t storeEnumTagSinglePayload for CompletionStatus(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000249C0 + 4 * byte_10002BD15[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1000249F4 + 4 * byte_10002BD10[v4]))();
}

uint64_t sub_1000249F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000249FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100024A04);
  return result;
}

uint64_t sub_100024A10(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100024A18);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_100024A1C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100024A24(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CompletionStatus()
{
  return &type metadata for CompletionStatus;
}

unint64_t sub_100024A44()
{
  unint64_t result;

  result = qword_100043A58;
  if (!qword_100043A58)
  {
    result = swift_getWitnessTable(&unk_10002BE2C, &type metadata for CompletionStatus);
    atomic_store(result, (unint64_t *)&qword_100043A58);
  }
  return result;
}

void static NSUserDefaults.appDefaults.getter()
{
  id v0;
  NSString v1;
  id v2;

  v0 = objc_allocWithZone((Class)NSUserDefaults);
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "initWithSuiteName:", v1);

  if (!v2)
    __break(1u);
}

id NSUserDefaults.shouldSimulate.getter()
{
  void *v0;
  NSString v1;
  id v2;

  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "BOOLForKey:", v1);

  return v2;
}

ValueMetadata *type metadata accessor for NSUserDefaults.Keys()
{
  return &type metadata for NSUserDefaults.Keys;
}

uint64_t sub_100024BD8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t result;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  NSObject *v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t *v44;
  _QWORD v45[2];
  uint64_t v46;
  unint64_t v47;
  os_log_t v48;
  char *v49;
  uint64_t v50;
  unint64_t *v51;
  uint64_t v52;
  char *v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v54 = a2;
  v51 = a3;
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)v45 - v10;
  if (qword_100041E70 != -1)
    swift_once(&qword_100041E70, sub_10001A514);
  v12 = type metadata accessor for Logger(0);
  v50 = sub_100006C44(v12, (uint64_t)qword_100044EA0);
  v13 = Logger.logObject.getter(v50);
  v14 = static os_log_type_t.default.getter();
  v15 = os_log_type_enabled(v13, v14);
  v53 = v9;
  if (v15)
  {
    v16 = swift_slowAlloc(12, -1);
    v52 = v6;
    v17 = (uint8_t *)v16;
    v18 = swift_slowAlloc(32, -1);
    v49 = v11;
    v19 = v5;
    v20 = v18;
    v57 = v18;
    *(_DWORD *)v17 = 136446210;
    v55 = sub_100020FBC(0xD000000000000021, 0x8000000100030350, &v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "%{public}s generating App Clip Code.", v17, 0xCu);
    swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
    v21 = v20;
    v5 = v19;
    v11 = v49;
    swift_slowDealloc(v21, -1, -1);
    v22 = v17;
    v6 = v52;
    swift_slowDealloc(v22, -1, -1);
  }

  result = sub_1000250BC(a1, v54);
  if (!v3)
  {
    v25 = result;
    v26 = (unint64_t)v24;
    sub_1000257B0(result, v24, (uint64_t)v11);
    v27 = v11;
    v28 = sub_1000262C4((uint64_t)v11);
    v30 = v29;
    v31 = (char *)sub_100026BB4();
    v32 = sub_100026D7C((uint64_t)v31);
    v49 = v31;
    v54 = (unint64_t)v32;
    v33 = (*(uint64_t (**)(char *, char *, uint64_t))(v6 + 16))(v53, v27, v5);
    v34 = Logger.logObject.getter(v33);
    v35 = static os_log_type_t.default.getter();
    LODWORD(v50) = v35;
    if (os_log_type_enabled(v34, v35))
    {
      v36 = swift_slowAlloc(22, -1);
      v47 = v30;
      v37 = v36;
      v46 = swift_slowAlloc(64, -1);
      v57 = v46;
      *(_DWORD *)v37 = 136446466;
      v48 = v34;
      v55 = sub_100020FBC(0xD000000000000021, 0x8000000100030350, &v57);
      v52 = v6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56);
      *(_WORD *)(v37 + 12) = 2082;
      v45[1] = v37 + 14;
      v38 = sub_100026F60();
      v39 = dispatch thunk of CustomStringConvertible.description.getter(v5, v38);
      v41 = v40;
      v55 = sub_100020FBC(v39, v40, &v57);
      v6 = v52;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56);
      swift_bridgeObjectRelease(v41);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v53, v5);
      _os_log_impl((void *)&_mh_execute_header, v48, (os_log_type_t)v50, "%{public}s successfully generated VisualPairingAppClipCode with URL: %{public}s.", (uint8_t *)v37, 0x16u);
      v42 = v46;
      swift_arrayDestroy(v46, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v42, -1, -1);
      swift_slowDealloc(v37, -1, -1);

      sub_1000241F4((uint64_t)v28, v47);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v53, v5);

      sub_1000241F4((uint64_t)v28, v30);
    }
    v43 = type metadata accessor for VisualPairingAppClipCode(0);
    v44 = v51;
    result = (*(uint64_t (**)(char *, char *, uint64_t))(v6 + 32))((char *)v51 + *(int *)(v43 + 24), v27, v5);
    *v44 = v54;
    v44[1] = v25;
    v44[2] = v26;
  }
  return result;
}

uint64_t sub_1000250BC(uint64_t result, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  _BYTE *v38;
  unsigned __int8 *v39;
  unsigned int v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44[2];
  uint64_t v45;
  uint64_t v46;

  v3 = result;
  v4 = HIBYTE(a2) & 0xF;
  v5 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v6 = v4;
  else
    v6 = result & 0xFFFFFFFFFFFFLL;
  if (!v6)
    goto LABEL_51;
  if ((a2 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain(a2);
    v8 = (uint64_t)sub_100025AA8(v3, a2, 10);
    v10 = v42;
    swift_bridgeObjectRelease(a2);
    goto LABEL_44;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
      v7 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(result, a2);
    v8 = (uint64_t)sub_100025B8C(v7, v5, 10);
    v10 = v9 & 1;
LABEL_44:
    if ((v10 & 1) == 0 && (v8 & 0x8000000000000000) == 0 && v8 < 1000000)
    {
      v20 = sub_100006CA0(&qword_100043A70);
      v21 = swift_allocObject(v20, 72, 7);
      *(_OWORD *)(v21 + 16) = xmmword_10002B020;
      *(_QWORD *)(v21 + 56) = &type metadata for Int;
      *(_QWORD *)(v21 + 64) = &protocol witness table for Int;
      *(_QWORD *)(v21 + 32) = v8;
      v22 = String.init(format:_:)(2016751653, 0xE400000000000000, v21);
      v24 = v23;
      if (qword_100041E70 != -1)
        swift_once(&qword_100041E70, sub_10001A514);
      v25 = type metadata accessor for Logger(0);
      sub_100006C44(v25, (uint64_t)qword_100044EA0);
      swift_bridgeObjectRetain_n(a2, 2);
      v26 = swift_bridgeObjectRetain_n(v24, 2);
      v27 = Logger.logObject.getter(v26);
      v28 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = swift_slowAlloc(22, -1);
        v43 = v3;
        v30 = swift_slowAlloc(64, -1);
        v44[0] = v30;
        *(_DWORD *)v29 = 136446466;
        swift_bridgeObjectRetain(v24);
        v45 = sub_100020FBC(v22, v24, v44);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46);
        swift_bridgeObjectRelease_n(v24, 3);
        *(_WORD *)(v29 + 12) = 2080;
        swift_bridgeObjectRetain(a2);
        v45 = sub_100020FBC(v43, a2, v44);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46);
        swift_bridgeObjectRelease_n(a2, 3);
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "Generated payload '%{public}s' from PIN '%s' (this PIN is for visual pairing only).", (uint8_t *)v29, 0x16u);
        swift_arrayDestroy(v30, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v30, -1, -1);
        swift_slowDealloc(v29, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(a2, 2);
        swift_bridgeObjectRelease_n(v24, 2);
      }
      return v22;
    }
LABEL_51:
    if (qword_100041E70 != -1)
      swift_once(&qword_100041E70, sub_10001A514);
    v31 = type metadata accessor for Logger(0);
    sub_100006C44(v31, (uint64_t)qword_100044EA0);
    v32 = swift_bridgeObjectRetain_n(a2, 2);
    v33 = Logger.logObject.getter(v32);
    v34 = static os_log_type_t.error.getter();
    v22 = v34;
    if (os_log_type_enabled(v33, v34))
    {
      v35 = swift_slowAlloc(22, -1);
      v36 = swift_slowAlloc(64, -1);
      v44[0] = v36;
      *(_DWORD *)v35 = 136446466;
      v45 = sub_100020FBC(0xD000000000000021, 0x8000000100030350, v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46);
      *(_WORD *)(v35 + 12) = 2080;
      swift_bridgeObjectRetain(a2);
      v45 = sub_100020FBC(v3, a2, v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46);
      swift_bridgeObjectRelease_n(a2, 3);
      _os_log_impl((void *)&_mh_execute_header, v33, (os_log_type_t)v22, "%{public}s received invalid PIN: %s.", (uint8_t *)v35, 0x16u);
      swift_arrayDestroy(v36, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v36, -1, -1);
      swift_slowDealloc(v35, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a2, 2);
    }
    v37 = sub_100026FA8();
    swift_allocError(&type metadata for VisualPairingAppClipCodeGenerationError, v37, 0, 0);
    *v38 = 0;
    swift_willThrow();
    return v22;
  }
  v44[0] = result;
  v44[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (!v4)
      goto LABEL_68;
    if (v4 == 1 || (BYTE1(result) - 48) > 9u)
      goto LABEL_31;
    v8 = (BYTE1(result) - 48);
    if (v4 != 2)
    {
      if ((BYTE2(result) - 48) > 9u)
        goto LABEL_31;
      v8 = 10 * (BYTE1(result) - 48) + (BYTE2(result) - 48);
      v11 = v4 - 3;
      if (v11)
      {
        v12 = (unsigned __int8 *)v44 + 3;
        while (1)
        {
          v13 = *v12 - 48;
          if (v13 > 9)
            goto LABEL_31;
          v14 = 10 * v8;
          if ((unsigned __int128)(v8 * (__int128)10) >> 64 != (10 * v8) >> 63)
            goto LABEL_31;
          v8 = v14 + v13;
          if (__OFADD__(v14, v13))
            goto LABEL_31;
          v10 = 0;
          ++v12;
          if (!--v11)
            goto LABEL_44;
        }
      }
    }
LABEL_43:
    v10 = 0;
    goto LABEL_44;
  }
  if (result != 45)
  {
    if (!v4 || (result - 48) > 9u)
      goto LABEL_31;
    v8 = (result - 48);
    if (v4 != 1)
    {
      if ((BYTE1(result) - 48) > 9u)
        goto LABEL_31;
      v8 = 10 * (result - 48) + (BYTE1(result) - 48);
      v15 = v4 - 2;
      if (v15)
      {
        v16 = (unsigned __int8 *)v44 + 2;
        while (1)
        {
          v17 = *v16 - 48;
          if (v17 > 9)
            goto LABEL_31;
          v18 = 10 * v8;
          if ((unsigned __int128)(v8 * (__int128)10) >> 64 != (10 * v8) >> 63)
            goto LABEL_31;
          v8 = v18 + v17;
          if (__OFADD__(v18, v17))
            goto LABEL_31;
          v10 = 0;
          ++v16;
          if (!--v15)
            goto LABEL_44;
        }
      }
    }
    goto LABEL_43;
  }
  if (v4)
  {
    if (v4 != 1 && (BYTE1(result) - 48) <= 9u)
    {
      if (v4 == 2)
      {
        v10 = 0;
        v8 = -(uint64_t)(BYTE1(result) - 48);
        goto LABEL_44;
      }
      if ((BYTE2(result) - 48) <= 9u)
      {
        v8 = -10 * (BYTE1(result) - 48) - (BYTE2(result) - 48);
        v19 = v4 - 3;
        if (!v19)
          goto LABEL_43;
        v39 = (unsigned __int8 *)v44 + 3;
        while (1)
        {
          v40 = *v39 - 48;
          if (v40 > 9)
            break;
          v41 = 10 * v8;
          if ((unsigned __int128)(v8 * (__int128)10) >> 64 != (10 * v8) >> 63)
            break;
          v8 = v41 - v40;
          if (__OFSUB__(v41, v40))
            break;
          v10 = 0;
          ++v39;
          if (!--v19)
            goto LABEL_44;
        }
      }
    }
LABEL_31:
    v8 = 0;
    v10 = 1;
    goto LABEL_44;
  }
  __break(1u);
LABEL_68:
  __break(1u);
  return result;
}

uint64_t sub_1000257B0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  Swift::String v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v6 = sub_100006CA0(&qword_100042170);
  __chkstk_darwin(v6);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = 0;
  v25 = 0xE000000000000000;
  _StringGuts.grow(_:)(33);
  swift_bridgeObjectRelease(v25);
  v24 = 0xD000000000000021;
  v25 = 0x8000000100030380;
  v9._countAndFlagsBits = a1;
  v9._object = a2;
  String.append(_:)(v9);
  v10 = v25;
  URL.init(string:)(v24, v25);
  swift_bridgeObjectRelease(v10);
  v11 = type metadata accessor for URL(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(a3, v8, v11);
  sub_1000072A4((uint64_t)v8);
  if (qword_100041E70 != -1)
    swift_once(&qword_100041E70, sub_10001A514);
  v13 = type metadata accessor for Logger(0);
  sub_100006C44(v13, (uint64_t)qword_100044EA0);
  v14 = swift_bridgeObjectRetain_n(a2, 2);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc(22, -1);
    v18 = swift_slowAlloc(64, -1);
    v24 = v18;
    *(_DWORD *)v17 = 136446466;
    v23 = sub_100020FBC(0xD000000000000021, 0x8000000100030350, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24);
    *(_WORD *)(v17 + 12) = 2080;
    swift_bridgeObjectRetain(a2);
    v23 = sub_100020FBC(a1, (unint64_t)a2, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "%{public}s failed to create URL for payload: %s.", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy(v18, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v18, -1, -1);
    swift_slowDealloc(v17, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
  v20 = sub_100026FA8();
  swift_allocError(&type metadata for VisualPairingAppClipCodeGenerationError, v20, 0, 0);
  *v21 = 1;
  return swift_willThrow();
}

unsigned __int8 *sub_100025AA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned __int8 *v12;
  uint64_t v14;
  uint64_t v15;

  v14 = a1;
  v15 = a2;
  swift_bridgeObjectRetain(a2);
  v4 = String.init<A>(_:)(&v14, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
  v6 = v4;
  v7 = v5;
  if ((v5 & 0x1000000000000000) == 0)
  {
    if ((v5 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v9 = HIBYTE(v7) & 0xF;
    v14 = v6;
    v15 = v7 & 0xFFFFFFFFFFFFFFLL;
    v8 = (unsigned __int8 *)&v14;
    goto LABEL_7;
  }
  v6 = sub_100025E08(v4, v5);
  v11 = v10;
  swift_bridgeObjectRelease(v7);
  v7 = v11;
  if ((v11 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v6 & 0x1000000000000000) != 0)
  {
    v8 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v6, v7);
  }
LABEL_7:
  v12 = sub_100025B8C(v8, v9, a3);
  swift_bridgeObjectRelease(v7);
  return v12;
}

unsigned __int8 *sub_100025B8C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_100025E08(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1;
  v3 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0)
    v3 = 11;
  v4 = String.subscript.getter(15, v3 | (v2 << 16), a1, a2);
  v6 = v5;
  v9 = sub_100025E84(v4, v7, v8, v5);
  swift_bridgeObjectRelease(v6);
  return v9;
}

uint64_t sub_100025E84(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];

  v5 = a3;
  if ((a4 & 0x1000000000000000) != 0)
  {
    v12 = sub_100025FC8(a1, a2, a3, a4);
    if (v12)
    {
      v9 = v12;
      v8 = (unint64_t)sub_10002144C(v12, 0);
      v5 = sub_1000260B4((unint64_t)v15, v8 + 32, v9, a1, a2, v5, a4);
      v13 = v15[3];
      swift_bridgeObjectRetain(a4);
      swift_bridgeObjectRelease(v13);
      if (v5 != v9)
      {
        __break(1u);
        goto LABEL_11;
      }
    }
    else
    {
      v8 = (unint64_t)&_swiftEmptyArrayStorage;
    }
    v14 = static String._uncheckedFromUTF8(_:)(v8 + 32, *(_QWORD *)(v8 + 16));
    swift_release(v8);
    return v14;
  }
  else
  {
    v8 = a1 >> 16;
    v9 = a2 >> 16;
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
      {
        v10 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
LABEL_5:
        v10 += v8;
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      }
LABEL_11:
      v10 = _StringObject.sharedUTF8.getter(v5, a4);
      if (!v10)
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      goto LABEL_5;
    }
    v15[0] = a3;
    v15[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return static String._uncheckedFromUTF8(_:)((char *)v15 + v8, v9 - v8);
  }
}

unint64_t sub_100025FC8(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_1000214B0(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_1000214B0(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return String.UTF8View._foreignDistance(from:to:)(v7, a2, a3, a4);
  }
  __break(1u);
  return result;
}

unint64_t sub_1000260B4(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_1000214B0(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = String.UTF8View._foreignSubscript(position:)();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = _StringObject.sharedUTF8.getter(a6, a7);
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_1000214B0(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = String.UTF8View._foreignIndex(after:)(v12, a6, a7);
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

NSObject *sub_1000262C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  os_log_type_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  id v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  _BYTE *v65;
  uint64_t v67;
  void *v68;
  uint64_t (*v69)(char *, uint64_t, uint64_t);
  uint64_t v70;
  void (*v71)(char *, uint64_t);
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _BYTE v77[8];
  uint64_t v78;
  id v79;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v73 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v7 = (char *)&v67 - v6;
  v8 = objc_msgSend((id)objc_opt_self(UITraitCollection), "currentTraitCollection");
  v9 = objc_msgSend(v8, "userInterfaceStyle");

  if (!v9)
  {
    if (qword_100041E70 != -1)
      swift_once(&qword_100041E70, sub_10001A514);
    v16 = type metadata accessor for Logger(0);
    v17 = sub_100006C44(v16, (uint64_t)qword_100044EA0);
    v12 = Logger.logObject.getter(v17);
    v18 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v12, v18))
      goto LABEL_22;
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    v19 = "Using black strokes on white background for ACC in unspecified UI style.";
    goto LABEL_20;
  }
  if (v9 == (id)1)
  {
    if (qword_100041E70 != -1)
      swift_once(&qword_100041E70, sub_10001A514);
    v20 = type metadata accessor for Logger(0);
    v21 = sub_100006C44(v20, (uint64_t)qword_100044EA0);
    v12 = Logger.logObject.getter(v21);
    v18 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v12, v18))
      goto LABEL_22;
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    v19 = "Using black strokes on white background for ACC in light mode UI style.";
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v12, v18, v19, v14, 2u);
    v15 = 1;
    goto LABEL_21;
  }
  if (v9 != (id)2)
  {
    if (qword_100041E70 != -1)
      swift_once(&qword_100041E70, sub_10001A514);
    v22 = type metadata accessor for Logger(0);
    v23 = sub_100006C44(v22, (uint64_t)qword_100044EA0);
    v12 = Logger.logObject.getter(v23);
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v18))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      v19 = "Using black strokes on white background for ACC in unknown UI style.";
      goto LABEL_20;
    }
LABEL_22:
    v15 = 1;
    goto LABEL_24;
  }
  if (qword_100041E70 != -1)
    swift_once(&qword_100041E70, sub_10001A514);
  v10 = type metadata accessor for Logger(0);
  v11 = sub_100006C44(v10, (uint64_t)qword_100044EA0);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Using white strokes on black background for ACC in dark mode UI style.", v14, 2u);
    v15 = 0;
LABEL_21:
    swift_slowDealloc(v14, -1, -1);
    goto LABEL_24;
  }
  v15 = 0;
LABEL_24:
  v74 = v15;

  if (qword_100041E70 != -1)
    swift_once(&qword_100041E70, sub_10001A514);
  v24 = type metadata accessor for Logger(0);
  v25 = sub_100006C44(v24, (uint64_t)qword_100044EA0);
  v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v27 = v26(v7, a1, v2);
  v72 = v25;
  v28 = v3;
  v29 = Logger.logObject.getter(v27);
  v30 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = swift_slowAlloc(32, -1);
    v69 = v26;
    v32 = v31;
    v68 = (void *)swift_slowAlloc(64, -1);
    v79 = v68;
    *(_DWORD *)v32 = 136446722;
    v78 = sub_100020FBC(0xD000000000000021, 0x8000000100030350, (uint64_t *)&v79);
    v70 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, &v79);
    *(_WORD *)(v32 + 12) = 2082;
    v33 = sub_100026F60();
    v34 = dispatch thunk of CustomStringConvertible.description.getter(v2, v33);
    v36 = v35;
    v78 = sub_100020FBC(v34, v35, (uint64_t *)&v79);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, &v79);
    swift_bridgeObjectRelease(v36);
    v71 = *(void (**)(char *, uint64_t))(v28 + 8);
    v71(v7, v2);
    *(_WORD *)(v32 + 22) = 2050;
    v78 = v74;
    a1 = v70;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, &v79);
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "%{public}s encoding URL: %{public}s with preset color: %{public}ld.", (uint8_t *)v32, 0x20u);
    v37 = v68;
    swift_arrayDestroy(v68, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v37, -1, -1);
    v38 = v32;
    v26 = v69;
    swift_slowDealloc(v38, -1, -1);
  }
  else
  {
    v71 = *(void (**)(char *, uint64_t))(v28 + 8);
    v71(v7, v2);
  }

  v77[7] = ACCBakerDataVersion2;
  v79 = 0;
  URL._bridgeToObjectiveC()((NSURL *)ACCBakerDataVersion2);
  v40 = v39;
  v41 = (void *)ACCBakerCreate();

  if (v41)
  {
    v42 = v41;
    v40 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v41);

  }
  else
  {
    v43 = v26(v73, a1, v2);
    v44 = Logger.logObject.getter(v43);
    v45 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = swift_slowAlloc(22, -1);
      v47 = swift_slowAlloc(64, -1);
      v78 = v47;
      *(_DWORD *)v46 = 136315394;
      v76 = sub_100020FBC(0xD000000000000021, 0x8000000100030350, &v78);
      v48 = v73;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, v77);
      *(_WORD *)(v46 + 12) = 2082;
      v40 = (v46 + 14);
      v49 = sub_100026F60();
      v50 = dispatch thunk of CustomStringConvertible.description.getter(v2, v49);
      v52 = v51;
      v76 = sub_100020FBC(v50, v51, &v78);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, v77);
      swift_bridgeObjectRelease(v52);
      v71(v48, v2);
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "%s failed to create SVG Data from URL \"%{public}s\".", (uint8_t *)v46, 0x16u);
      swift_arrayDestroy(v47, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v47, -1, -1);
      swift_slowDealloc(v46, -1, -1);
    }
    else
    {
      v71(v73, v2);
    }

    if (v79)
    {
      v53 = v79;
      v40 = Logger.logObject.getter(v53);
      v54 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v40, v54))
      {
        v55 = (uint8_t *)swift_slowAlloc(12, -1);
        v56 = swift_slowAlloc(32, -1);
        v78 = v56;
        *(_DWORD *)v55 = 136446210;
        v76 = (uint64_t)v53;
        type metadata accessor for CFError(0);
        v58 = v57;
        v59 = v53;
        v60 = String.init<A>(describing:)(&v76, v58);
        v62 = v61;
        v76 = sub_100020FBC(v60, v61, &v78);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, v77);

        swift_bridgeObjectRelease(v62);
        _os_log_impl((void *)&_mh_execute_header, v40, v54, "%{public}s.", v55, 0xCu);
        swift_arrayDestroy(v56, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v56, -1, -1);
        swift_slowDealloc(v55, -1, -1);

      }
      else
      {

      }
    }
    v63 = sub_100026FA8();
    v64 = swift_allocError(&type metadata for VisualPairingAppClipCodeGenerationError, v63, 0, 0);
    *v65 = 2;
    v75 = v64;
    swift_willThrow();
  }
  return v40;
}

uint64_t sub_100026BB4()
{
  Class isa;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  isa = Data._bridgeToObjectiveC()().super.isa;
  v1 = CGSVGDocumentCreateFromData(isa, 0);

  if (!v1)
  {
    if (qword_100041E70 != -1)
      swift_once(&qword_100041E70, sub_10001A514);
    v2 = type metadata accessor for Logger(0);
    v3 = sub_100006C44(v2, (uint64_t)qword_100044EA0);
    v4 = Logger.logObject.getter(v3);
    v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc(12, -1);
      v7 = swift_slowAlloc(32, -1);
      v13 = v7;
      *(_DWORD *)v6 = 136446210;
      v11 = sub_100020FBC(0xD000000000000021, 0x8000000100030350, &v13);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "%{public}s failed to create CGSVGDocument from Data.", v6, 0xCu);
      swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v7, -1, -1);
      swift_slowDealloc(v6, -1, -1);
    }

    v8 = sub_100026FA8();
    swift_allocError(&type metadata for VisualPairingAppClipCodeGenerationError, v8, 0, 0);
    *v9 = 3;
    swift_willThrow();
  }
  return v1;
}

id sub_100026D7C(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = objc_msgSend((id)objc_opt_self(UIImage), "_imageWithCGSVGDocument:scale:orientation:", a1, 0, 1.0);
  if (!v1)
  {
    if (qword_100041E70 != -1)
      swift_once(&qword_100041E70, sub_10001A514);
    v2 = type metadata accessor for Logger(0);
    v3 = sub_100006C44(v2, (uint64_t)qword_100044EA0);
    v4 = Logger.logObject.getter(v3);
    v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc(12, -1);
      v7 = swift_slowAlloc(32, -1);
      v13 = v7;
      *(_DWORD *)v6 = 136446210;
      v11 = sub_100020FBC(0xD000000000000021, 0x8000000100030350, &v13);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "%{public}s failed to create UIImage from CGSVGDocument.", v6, 0xCu);
      swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v7, -1, -1);
      swift_slowDealloc(v6, -1, -1);
    }

    v8 = sub_100026FA8();
    swift_allocError(&type metadata for VisualPairingAppClipCodeGenerationError, v8, 0, 0);
    *v9 = 4;
    swift_willThrow();
  }
  return v1;
}

unint64_t sub_100026F60()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100043A60;
  if (!qword_100043A60)
  {
    v1 = type metadata accessor for URL(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for URL, v1);
    atomic_store(result, (unint64_t *)&qword_100043A60);
  }
  return result;
}

unint64_t sub_100026FA8()
{
  unint64_t result;

  result = qword_100043A68;
  if (!qword_100043A68)
  {
    result = swift_getWitnessTable(&unk_10002AE60, &type metadata for VisualPairingAppClipCodeGenerationError);
    atomic_store(result, (unint64_t *)&qword_100043A68);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ProxCardStageIdentifier(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ProxCardStageIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_1000270C8 + 4 * byte_10002BE95[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_1000270FC + 4 * asc_10002BE90[v4]))();
}

uint64_t sub_1000270FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100027104(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10002710CLL);
  return result;
}

uint64_t sub_100027118(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100027120);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_100027124(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002712C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProxCardStageIdentifier()
{
  return &type metadata for ProxCardStageIdentifier;
}

uint64_t storeEnumTagSinglePayload for ProxCardStageVersion(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100027188 + 4 * byte_10002BE9A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1000271A8 + 4 * byte_10002BE9F[v4]))();
}

_BYTE *sub_100027188(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1000271A8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000271B0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000271B8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000271C0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000271C8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ProxCardStageVersion()
{
  return &type metadata for ProxCardStageVersion;
}

uint64_t sub_1000271E4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_100027220 + 4 * byte_10002BEA4[a1]))(0x6E55656369766564, 0xEC0000006B636F6CLL);
}

unint64_t sub_100027220()
{
  return 0xD000000000000015;
}

uint64_t sub_100027248()
{
  return 0x6375646F72746E69;
}

uint64_t sub_100027268()
{
  return 0x7463757274736E69;
}

uint64_t sub_100027288()
{
  return 0x61506C6175736976;
}

uint64_t sub_1000272AC()
{
  return 0x69726961506E6970;
}

uint64_t sub_1000272C8()
{
  return 0x73736572676F7270;
}

uint64_t sub_1000272E0()
{
  return 0x6974656C706D6F63;
}

uint64_t sub_100027300()
{
  return 0x6572756C696166;
}

uint64_t sub_100027318(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_100027358 + 4 * byte_10002BEAE[a1]))(0x7520656369766564, 0xED00006B636F6C6ELL);
}

unint64_t sub_100027358()
{
  return 0xD000000000000018;
}

uint64_t sub_100027380()
{
  return 0x6375646F72746E69;
}

uint64_t sub_1000273A0()
{
  return 0x7463757274736E69;
}

uint64_t sub_1000273C0()
{
  return 0x70206C6175736976;
}

uint64_t sub_1000273E4()
{
  return 0x72696170206E6970;
}

uint64_t sub_100027404()
{
  return 0x73736572676F7270;
}

uint64_t sub_10002741C()
{
  return 0x6974656C706D6F63;
}

uint64_t sub_100027438()
{
  return 0x6572756C696166;
}

uint64_t sub_100027450(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = sub_1000271E4(*a1);
  v5 = v4;
  v6 = sub_1000271E4(v2);
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

Swift::Int sub_1000274D8()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v1 = *v0;
  Hasher.init(_seed:)(v6, 0);
  v2 = sub_1000271E4(v1);
  v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_100027538(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_1000271E4(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100027578(uint64_t a1)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  v3 = sub_1000271E4(v2);
  v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

unint64_t sub_1000275D4@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_1000277B0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100027600@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1000271E4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100027628()
{
  unsigned __int8 *v0;

  return sub_100027318(*v0);
}

Swift::Int sub_100027630()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  String.hash(into:)(v1, 12662, 0xE200000000000000);
  return Hasher._finalize()();
}

uint64_t sub_100027674(uint64_t a1)
{
  return String.hash(into:)(a1, 12662, 0xE200000000000000);
}

Swift::Int sub_100027680(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  String.hash(into:)(v2, 12662, 0xE200000000000000);
  return Hasher._finalize()();
}

uint64_t sub_1000276C0@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100038F48, v3);
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

void sub_100027710(_QWORD *a1@<X8>)
{
  *a1 = 12662;
  a1[1] = 0xE200000000000000;
}

unint64_t sub_100027724()
{
  unint64_t result;

  result = qword_100043A78;
  if (!qword_100043A78)
  {
    result = swift_getWitnessTable(&unk_10002BFC0, &type metadata for ProxCardStageVersion);
    atomic_store(result, (unint64_t *)&qword_100043A78);
  }
  return result;
}

unint64_t sub_10002776C()
{
  unint64_t result;

  result = qword_100043A80;
  if (!qword_100043A80)
  {
    result = swift_getWitnessTable(&unk_10002C088, &type metadata for ProxCardStageIdentifier);
    atomic_store(result, (unint64_t *)&qword_100043A80);
  }
  return result;
}

unint64_t sub_1000277B0(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100038E38, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 0xA)
    return 10;
  else
    return v3;
}

uint64_t type metadata accessor for PinPairingStage()
{
  return objc_opt_self(_TtC21TDGSharingViewService15PinPairingStage);
}

void sub_100027818(uint64_t a1, void *a2)
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

uint64_t sub_100027868(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  Swift::String v9;
  Swift::String_optional v10;
  Swift::String v11;
  void *object;
  NSString v13;
  Class v14;
  id v15;
  Swift::String v16;
  Swift::String_optional v17;
  Swift::String v18;
  void *v19;
  NSString v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  Swift::String v25;
  Swift::String_optional v26;
  Swift::String v27;
  void *v28;
  uint64_t v29;
  NSString v30;
  void *v31;
  id v32;
  uint64_t v33;
  NSString v34;
  id v35;
  id v36;
  double v37;
  double v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  Class isa;
  _QWORD aBlock[5];
  uint64_t v47;
  Swift::String v48;
  Swift::String v49;
  Swift::String v50;

  v2 = v1;
  *(_QWORD *)(v1 + 24) = a1;
  v4 = objc_allocWithZone((Class)PRXIconContentViewController);
  swift_retain(a1);
  v5 = objc_msgSend(v4, "init");
  *(_QWORD *)(v2 + 16) = v5;
  v6 = (void *)objc_opt_self(NSBundle);
  v7 = v5;
  v8 = objc_msgSend(v6, "mainBundle");
  v9._countAndFlagsBits = 0xD000000000000024;
  v48._object = (void *)0xE000000000000000;
  v9._object = (void *)0x8000000100030460;
  v10.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v10.value._object = (void *)0xEB00000000656C62;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  v48._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v9, v10, (NSBundle)v8, v11, v48)._object;

  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v7, "setTitle:", v13);

  v14 = (Class)v7;
  v15 = objc_msgSend(v6, "mainBundle");
  v16._countAndFlagsBits = 0xD000000000000027;
  v49._object = (void *)0xE000000000000000;
  v16._object = (void *)0x8000000100030490;
  v17.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v17.value._object = (void *)0xEB00000000656C62;
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  v49._countAndFlagsBits = 0;
  v19 = NSLocalizedString(_:tableName:bundle:value:comment:)(v16, v17, (NSBundle)v15, v18, v49)._object;

  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v19);
  -[objc_class setSubtitle:](v14, "setSubtitle:", v20);

  -[objc_class setDismissalType:](v14, "setDismissalType:", 1);
  v21 = String.appleAccountRebrandStringKey.getter(0xD000000000000025, 0x80000001000304C0);
  v23 = v22;
  v24 = objc_msgSend(v6, "mainBundle");
  v50._object = (void *)0xE000000000000000;
  v25._countAndFlagsBits = v21;
  v25._object = v23;
  v26.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v26.value._object = (void *)0xEB00000000656C62;
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  v50._countAndFlagsBits = 0;
  v28 = NSLocalizedString(_:tableName:bundle:value:comment:)(v25, v26, (NSBundle)v24, v27, v50)._object;
  swift_bridgeObjectRelease(v23);

  v29 = swift_allocObject(&unk_10003A748, 24, 7);
  swift_weakInit(v29 + 16, v2);
  swift_retain(v29);
  v30 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v28);
  aBlock[4] = sub_100027E1C;
  v47 = v29;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100027818;
  aBlock[3] = &unk_10003A760;
  v31 = _Block_copy(aBlock);
  v32 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v30, 0, v31);

  _Block_release(v31);
  v33 = v47;
  swift_release(v29);
  swift_release(v33);

  v34 = String._bridgeToObjectiveC()();
  v35 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:", v34);

  if (v35)
  {
    v36 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
    objc_msgSend(v36, "scale");
    v38 = v37;

    v39 = objc_msgSend(v35, "_applicationIconImageForFormat:precomposed:scale:", 2, 1, v38);
    if (v39)
    {
      v40 = sub_100006CA0(&qword_100042258);
      v41 = swift_allocObject(v40, 40, 7);
      *(_OWORD *)(v41 + 16) = xmmword_10002BC40;
      *(_QWORD *)(v41 + 32) = v39;
      aBlock[0] = v41;
      specialized Array._endMutation()(v41);
      v42 = aBlock[0];
      sub_100027E3C();
      v43 = v39;
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v42);
      -[objc_class setImages:](v14, "setImages:", isa);

      v14 = isa;
    }
  }

  swift_release(a1);
  return v2;
}

uint64_t sub_100027D44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0, 0);
  result = swift_weakLoadStrong(v2);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)(result + 24);
    swift_retain(v5);
    swift_release(v4);
    sub_100006EFC();
    return swift_release(v5);
  }
  return result;
}

uint64_t sub_100027DAC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for AppleIDAccountUpgradeUIProvider()
{
  return objc_opt_self(_TtC21TDGSharingViewService31AppleIDAccountUpgradeUIProvider);
}

uint64_t sub_100027DF8()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100027E1C(uint64_t a1)
{
  uint64_t v1;

  return sub_100027D44(a1, v1);
}

uint64_t sub_100027E24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100027E34(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100027E3C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100043BE0;
  if (!qword_100043BE0)
  {
    v1 = objc_opt_self(UIImage);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100043BE0);
  }
  return result;
}

uint64_t type metadata accessor for VisualPairingStage()
{
  return objc_opt_self(_TtC21TDGSharingViewService18VisualPairingStage);
}

uint64_t type metadata accessor for EducationActionHandler()
{
  return objc_opt_self(_TtC21TDGSharingViewService22EducationActionHandler);
}

uint64_t sub_100027EB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  void *v7;

  v1 = v0;
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100006C44(v2, (uint64_t)qword_100044E40);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "ProgressUIProvider is being deinitialized", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  v7 = *(void **)(v1 + 24);
  swift_release(*(_QWORD *)(v1 + 32));

  return v1;
}

uint64_t sub_100027FA0()
{
  uint64_t v0;

  sub_100027EB8();
  return swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for ProgressUIProvider()
{
  return objc_opt_self(_TtC21TDGSharingViewService18ProgressUIProvider);
}

_QWORD *sub_100027FE0(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  id v9;
  id v10;
  char *v11;
  char *v12;
  void *v13;
  uint64_t v14;
  id v15;
  char *v16;
  void *v17;
  char *v18;
  id v19;
  Swift::String v20;
  Swift::String_optional v21;
  Swift::String v22;
  void *object;
  NSString v24;
  id v25;
  Swift::String v27;

  v4 = v3;
  v4[3] = a1;
  v4[4] = a2;
  v8 = type metadata accessor for ProgressViewServiceUIViewController();
  v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v8));
  v10 = a1;
  swift_retain(a2);
  v11 = (char *)objc_msgSend(v9, "init");
  swift_weakAssign(&v11[OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_layoutCache], a3);
  v4[2] = v11;
  v12 = &v11[OBJC_IVAR____TtC21TDGSharingViewService35ProgressViewServiceUIViewController_actionHandler];
  v13 = *(void **)&v11[OBJC_IVAR____TtC21TDGSharingViewService35ProgressViewServiceUIViewController_actionHandler];
  v14 = *(_QWORD *)&v11[OBJC_IVAR____TtC21TDGSharingViewService35ProgressViewServiceUIViewController_actionHandler + 8];
  *(_QWORD *)v12 = v10;
  *((_QWORD *)v12 + 1) = a2;
  v15 = v10;
  swift_retain(a2);
  v16 = v11;
  sub_100028370(v13, v14);
  v17 = (void *)objc_opt_self(NSBundle);
  v18 = v16;
  v19 = objc_msgSend(v17, "mainBundle");
  v27._object = (void *)0xE000000000000000;
  v20._object = (void *)0x8000000100030620;
  v20._countAndFlagsBits = 0xD000000000000014;
  v21.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v21.value._object = (void *)0xEB00000000656C62;
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  v27._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v20, v21, (NSBundle)v19, v22, v27)._object;

  v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v18, "setTitle:", v24);

  objc_msgSend(v18, "setDismissalType:", 1);
  sub_1000085CC();
  v25 = objc_msgSend(objc_allocWithZone((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v25, "startAnimating");
  sub_100007598(v25, 0, 0, 0, 6);

  swift_release(a2);
  swift_release(a3);

  return v4;
}

void *sub_1000282F8()
{
  uint64_t v0;

  return sub_100028370(*(void **)(v0 + OBJC_IVAR____TtC21TDGSharingViewService35ProgressViewServiceUIViewController_actionHandler), *(_QWORD *)(v0+ OBJC_IVAR____TtC21TDGSharingViewService35ProgressViewServiceUIViewController_actionHandler+ 8));
}

id sub_10002830C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProgressViewServiceUIViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ProgressViewServiceUIViewController()
{
  return objc_opt_self(_TtC21TDGSharingViewService35ProgressViewServiceUIViewController);
}

void *sub_100028370(void *result, uint64_t a2)
{
  if (result)
  {

    return (void *)swift_release(a2);
  }
  return result;
}

void *sub_10002839C(void *result, uint64_t a2)
{
  id v3;

  if (result)
  {
    v3 = result;
    return (void *)swift_retain(a2);
  }
  return result;
}

uint64_t sub_1000283C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  Swift::String v19;
  Swift::String_optional v20;
  Swift::String v21;
  void *object;
  NSString v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  Swift::String v29;
  Swift::String_optional v30;
  Swift::String v31;
  void *v32;
  NSString v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  Swift::String v38;
  Swift::String_optional v39;
  Swift::String v40;
  void *v41;
  _QWORD *v42;
  id v43;
  NSString v44;
  void *v45;
  id v46;
  id v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  id v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t aBlock[5];
  _QWORD *v61;
  Swift::String v62;
  Swift::String v63;
  Swift::String v64;

  v5 = objc_msgSend(objc_allocWithZone((Class)PRXIconContentViewController), "init");
  v58 = v2;
  *(_QWORD *)(v2 + 16) = v5;
  v6 = qword_100041E50;
  v7 = v5;
  if (v6 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v8 = type metadata accessor for Logger(0);
  v9 = sub_100006C44(v8, (uint64_t)qword_100044E40);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Creating Apple ID Renewal card", v12, 2u);
    swift_slowDealloc(v12, -1, -1);
  }

  v13 = v7;
  v14 = String.appleAccountRebrandStringKey.getter(0xD000000000000024, 0x8000000100030680);
  v16 = v15;
  v17 = (void *)objc_opt_self(NSBundle);
  v18 = objc_msgSend(v17, "mainBundle");
  v62._object = (void *)0xE000000000000000;
  v19._countAndFlagsBits = v14;
  v19._object = v16;
  v20.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v20.value._object = (void *)0xEB00000000656C62;
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  v62._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v19, v20, (NSBundle)v18, v21, v62)._object;
  swift_bridgeObjectRelease(v16);

  v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v13, "setTitle:", v23);

  v24 = v13;
  v25 = String.appleAccountRebrandStringKey.getter(0xD000000000000027, 0x80000001000306B0);
  v27 = v26;
  v28 = objc_msgSend(v17, "mainBundle");
  v63._object = (void *)0xE000000000000000;
  v29._countAndFlagsBits = v25;
  v29._object = v27;
  v30.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v30.value._object = (void *)0xEB00000000656C62;
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  v63._countAndFlagsBits = 0;
  v32 = NSLocalizedString(_:tableName:bundle:value:comment:)(v29, v30, (NSBundle)v28, v31, v63)._object;
  swift_bridgeObjectRelease(v27);

  v33 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v32);
  objc_msgSend(v24, "setSubtitle:", v33);

  objc_msgSend(v24, "setDismissalType:", 1);
  sub_1000289EC(v24);
  v34 = String.appleAccountRebrandStringKey.getter(0xD000000000000025, 0x80000001000306E0);
  v36 = v35;
  v37 = objc_msgSend(v17, "mainBundle");
  v64._object = (void *)0xE000000000000000;
  v38._countAndFlagsBits = v34;
  v38._object = v36;
  v39.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v39.value._object = (void *)0xEB00000000656C62;
  v40._countAndFlagsBits = 0;
  v40._object = (void *)0xE000000000000000;
  v64._countAndFlagsBits = 0;
  v41 = NSLocalizedString(_:tableName:bundle:value:comment:)(v38, v39, (NSBundle)v37, v40, v64)._object;
  swift_bridgeObjectRelease(v36);

  v42 = (_QWORD *)swift_allocObject(&unk_10003A840, 40, 7);
  v42[2] = a1;
  v42[3] = a2;
  v42[4] = v24;
  v43 = v24;
  swift_retain(a1);
  swift_retain(a2);
  v44 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v41);
  aBlock[4] = (uint64_t)sub_100028BA4;
  v61 = v42;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100027818;
  aBlock[3] = (uint64_t)&unk_10003A858;
  v45 = _Block_copy(aBlock);
  v46 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v44, 0, v45);

  _Block_release(v45);
  swift_release(v61);

  v47 = v43;
  v48 = Logger.logObject.getter(v47);
  v49 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = (uint8_t *)swift_slowAlloc(12, -1);
    v51 = swift_slowAlloc(32, -1);
    aBlock[0] = v51;
    *(_DWORD *)v50 = 136446210;
    v52 = objc_msgSend(v47, "title");
    if (v52)
    {
      v53 = v52;
      v54 = static String._unconditionallyBridgeFromObjectiveC(_:)(v52);
      v56 = v55;

    }
    else
    {
      v54 = 0;
      v56 = 0xE000000000000000;
    }
    v59 = sub_100020FBC(v54, v56, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, aBlock);

    swift_bridgeObjectRelease(v56);
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "Displaying Apple ID Renewal with title: %{public}s", v50, 0xCu);
    swift_arrayDestroy(v51, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v51, -1, -1);
    swift_slowDealloc(v50, -1, -1);

    swift_release(a2);
    swift_release(a1);
  }
  else
  {

    swift_release(a2);
    swift_release(a1);

  }
  return v58;
}

uint64_t sub_1000289A8()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for AppleIDAccountRenewalUIProvider()
{
  return objc_opt_self(_TtC21TDGSharingViewService31AppleIDAccountRenewalUIProvider);
}

void sub_1000289EC(void *a1)
{
  NSString v2;
  id v3;
  id v4;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  Class isa;
  uint64_t v12;

  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:", v2);

  if (v3)
  {
    v4 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
    objc_msgSend(v4, "scale");
    v6 = v5;

    v7 = objc_msgSend(v3, "_applicationIconImageForFormat:precomposed:scale:", 2, 1, v6);
    if (v7)
    {
      v8 = sub_100006CA0(&qword_100042258);
      v9 = swift_allocObject(v8, 40, 7);
      *(_OWORD *)(v9 + 16) = xmmword_10002BC40;
      *(_QWORD *)(v9 + 32) = v7;
      v12 = v9;
      specialized Array._endMutation()(v9);
      sub_100027E3C();
      v10 = v7;
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v12);
      objc_msgSend(a1, "setImages:", isa);

    }
  }
}

uint64_t sub_100028B70()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100028BA4()
{
  uint64_t *v0;

  return sub_10000955C(v0[4], v0[2], v0[3]);
}

uint64_t sub_100028BB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100028BC0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100028BC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v1 = v0;
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100006C44(v2, (uint64_t)qword_100044E40);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "ProxCardCompleteUI is being deinitialized", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  swift_release(*(_QWORD *)(v1 + 24));
  return v1;
}

uint64_t sub_100028CAC()
{
  uint64_t v0;

  sub_100028BC8();
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for CompleteUIProvider()
{
  return objc_opt_self(_TtC21TDGSharingViewService18CompleteUIProvider);
}

uint64_t sub_100028CEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  Swift::String v10;
  Swift::String_optional v11;
  Swift::String v12;
  void *object;
  NSString v14;
  id v15;
  id v16;
  Swift::String v17;
  Swift::String_optional v18;
  Swift::String v19;
  void *v20;
  uint64_t v21;
  NSString v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD aBlock[5];
  uint64_t v35;
  Swift::String v36;
  Swift::String v37;

  v3 = v2;
  *(_QWORD *)(v2 + 24) = a1;
  v5 = objc_allocWithZone((Class)PRXCardContentViewController);
  swift_retain(a1);
  v6 = objc_msgSend(v5, "init");
  *(_QWORD *)(v3 + 16) = v6;
  v7 = (void *)objc_opt_self(NSBundle);
  v8 = v6;
  v9 = objc_msgSend(v7, "mainBundle");
  v10._countAndFlagsBits = 0xD000000000000014;
  v36._object = (void *)0xE000000000000000;
  v10._object = (void *)0x8000000100030740;
  v11.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v11.value._object = (void *)0xEB00000000656C62;
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  v36._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v10, v11, (NSBundle)v9, v12, v36)._object;

  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v8, "setTitle:", v14);

  objc_msgSend(*(id *)(v3 + 16), "setDismissalType:", 3);
  v15 = *(id *)(v3 + 16);
  v16 = objc_msgSend(v7, "mainBundle");
  v17._countAndFlagsBits = 0xD000000000000017;
  v37._object = (void *)0xE000000000000000;
  v17._object = (void *)0x8000000100030760;
  v18.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v18.value._object = (void *)0xEB00000000656C62;
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  v37._countAndFlagsBits = 0;
  v20 = NSLocalizedString(_:tableName:bundle:value:comment:)(v17, v18, (NSBundle)v16, v19, v37)._object;

  v21 = swift_allocObject(&unk_10003A8B8, 24, 7);
  swift_weakInit(v21 + 16, v3);
  swift_retain(v21);
  v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v20);
  aBlock[4] = sub_1000291CC;
  v35 = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100027818;
  aBlock[3] = &unk_10003A8D0;
  v23 = _Block_copy(aBlock);
  v24 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v22, 0, v23);

  _Block_release(v23);
  v25 = v35;
  swift_release(v21);
  swift_release(v25);

  v26 = *(void **)(v3 + 16);
  v27 = (void *)objc_opt_self(UIColor);
  v28 = v26;
  v29 = objc_msgSend(v27, "systemBlueColor");
  v30 = v29;
  v31 = sub_1000092D8(0xD000000000000010, 0x8000000100030780, (uint64_t)v30);

  sub_100007598(v31, 0xD000000000000010, 0x8000000100030780, (uint64_t)v29, 0);
  swift_release(a1);
  swift_release(a2);

  return v3;
}

uint64_t sub_10002906C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  char v12;
  _BYTE v13[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v13, 0, 0);
  result = swift_weakLoadStrong(v2);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)(result + 24);
    swift_retain(v5);
    swift_release(v4);
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v6 = type metadata accessor for Logger(0);
    v7 = sub_100006C44(v6, (uint64_t)qword_100044E40);
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Proximity Setup completed", v10, 2u);
      swift_slowDealloc(v10, -1, -1);
    }

    v11 = *(_QWORD *)(v5 + 16);
    v12 = 2;
    swift_retain(v11);
    PassthroughSubject.send(_:)(&v12);
    swift_release(v5);
    return swift_release(v11);
  }
  return result;
}

uint64_t sub_1000291A8()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000291CC(uint64_t a1)
{
  uint64_t v1;

  return sub_10002906C(a1, v1);
}

uint64_t sub_1000291D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000291E4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id sub_100029290()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(_TtC21TDGSharingViewService13SceneDelegate);
}

uint64_t sub_1000292F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v1 = v0;
  if (qword_100041E50 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100006C44(v2, (uint64_t)qword_100044E40);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "FailureUIProvider is being deinitialized", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  swift_release(*(_QWORD *)(v1 + 24));
  return v1;
}

uint64_t sub_1000293D4()
{
  uint64_t v0;

  sub_1000292F0();
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for FailureUIProvider()
{
  return objc_opt_self(_TtC21TDGSharingViewService17FailureUIProvider);
}

uint64_t sub_100029414(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  id v7;
  char *v8;
  void *v9;
  char *v10;
  id v11;
  Swift::String v12;
  Swift::String_optional v13;
  Swift::String v14;
  void *object;
  NSString v16;
  id v17;
  id v18;
  Swift::String v19;
  Swift::String_optional v20;
  Swift::String v21;
  void *v22;
  NSString v23;
  id v24;
  id v25;
  Swift::String v26;
  Swift::String_optional v27;
  Swift::String v28;
  void *v29;
  uint64_t v30;
  NSString v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD aBlock[5];
  uint64_t v44;
  Swift::String v45;
  Swift::String v46;
  Swift::String v47;

  v3 = v2;
  *(_QWORD *)(v2 + 24) = a1;
  v6 = type metadata accessor for ViewServiceUIViewControllerExtendedHeight();
  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6));
  swift_retain(a1);
  v8 = (char *)objc_msgSend(v7, "init");
  swift_weakAssign(&v8[OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_layoutCache], a2);
  *(_QWORD *)(v3 + 16) = v8;
  v9 = (void *)objc_opt_self(NSBundle);
  v10 = v8;
  v11 = objc_msgSend(v9, "mainBundle");
  v12._countAndFlagsBits = 0xD000000000000013;
  v45._object = (void *)0xE000000000000000;
  v12._object = (void *)0x8000000100030840;
  v13.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v13.value._object = (void *)0xEB00000000656C62;
  v14._countAndFlagsBits = 0;
  v14._object = (void *)0xE000000000000000;
  v45._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v12, v13, (NSBundle)v11, v14, v45)._object;

  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v10, "setTitle:", v16);

  v17 = *(id *)(v3 + 16);
  v18 = objc_msgSend(v9, "mainBundle");
  v46._object = (void *)0xE000000000000000;
  v19._object = (void *)0x8000000100030860;
  v19._countAndFlagsBits = 0xD000000000000016;
  v20.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v20.value._object = (void *)0xEB00000000656C62;
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  v46._countAndFlagsBits = 0;
  v22 = NSLocalizedString(_:tableName:bundle:value:comment:)(v19, v20, (NSBundle)v18, v21, v46)._object;

  v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v22);
  objc_msgSend(v17, "setSubtitle:", v23);

  objc_msgSend(*(id *)(v3 + 16), "setDismissalType:", 3);
  v24 = *(id *)(v3 + 16);
  v25 = objc_msgSend(v9, "mainBundle");
  v26._countAndFlagsBits = 0xD000000000000019;
  v47._object = (void *)0xE000000000000000;
  v26._object = (void *)0x8000000100030880;
  v27.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v27.value._object = (void *)0xEB00000000656C62;
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  v47._countAndFlagsBits = 0;
  v29 = NSLocalizedString(_:tableName:bundle:value:comment:)(v26, v27, (NSBundle)v25, v28, v47)._object;

  v30 = swift_allocObject(&unk_10003A930, 24, 7);
  swift_weakInit(v30 + 16, v3);
  swift_retain(v30);
  v31 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v29);
  aBlock[4] = sub_1000299D4;
  v44 = v30;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100027818;
  aBlock[3] = &unk_10003A948;
  v32 = _Block_copy(aBlock);
  v33 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v31, 0, v32);

  _Block_release(v32);
  v34 = v44;
  swift_release(v30);
  swift_release(v34);

  v35 = *(void **)(v3 + 16);
  v36 = (void *)objc_opt_self(UIColor);
  v37 = v35;
  v38 = objc_msgSend(v36, "redColor");
  v39 = v38;
  v40 = sub_1000092D8(0xD000000000000016, 0x80000001000308A0, (uint64_t)v39);

  sub_100007598(v40, 0xD000000000000016, 0x80000001000308A0, (uint64_t)v38, 0);
  swift_release(a1);
  swift_release(a2);

  return v3;
}

uint64_t sub_100029874(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  char v12;
  _BYTE v13[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v13, 0, 0);
  result = swift_weakLoadStrong(v2);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)(result + 24);
    swift_retain(v5);
    swift_release(v4);
    if (qword_100041E50 != -1)
      swift_once(&qword_100041E50, sub_10001A2E8);
    v6 = type metadata accessor for Logger(0);
    v7 = sub_100006C44(v6, (uint64_t)qword_100044E40);
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Handle failure action", v10, 2u);
      swift_slowDealloc(v10, -1, -1);
    }

    v11 = *(_QWORD *)(v5 + 16);
    v12 = 2;
    swift_retain(v11);
    PassthroughSubject.send(_:)(&v12);
    swift_release(v5);
    return swift_release(v11);
  }
  return result;
}

uint64_t sub_1000299B0()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000299D4(uint64_t a1)
{
  uint64_t v1;

  return sub_100029874(a1, v1);
}

uint64_t sub_1000299DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000299EC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC21TDGSharingViewServiceP33_4100E0FB415C0EA67BFA34C7D406A0CB19ResourceBundleClass);
}

id objc_msgSend_collector(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collector");
}

id objc_msgSend_fetchPrescriptionRecordsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPrescriptionRecordsWithCompletion:");
}

id objc_msgSend_initWithTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeout:");
}

id objc_msgSend_setCollector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCollector:");
}
