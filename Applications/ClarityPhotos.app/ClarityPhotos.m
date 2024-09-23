uint64_t sub_100003B40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  void (*v23)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v28 = a1;
  v27 = sub_1000040EC(&qword_1000187E8);
  ((void (*)(void))__chkstk_darwin)();
  v2 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1000040EC(&qword_1000187F0);
  v26 = *(_QWORD *)(v3 - 8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v25 - v7;
  v9 = sub_1000040EC(&qword_1000187F8);
  v25 = *(_QWORD *)(v9 - 8);
  v10 = v25;
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v25 - v14;
  v16 = sub_1000040EC(&qword_100018800);
  v17 = sub_10000412C();
  WindowGroup.init(id:title:lazyContent:)(0, 0, 0, 0, 0, 0, sub_100003D84, 0, v16, v17);
  ClarityUIScene.init(content:)(sub_100003D84, 0, v16, v17);
  v18 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v18(v13, v15, v9);
  v19 = v26;
  v20 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
  v20(v6, v8, v3);
  v18(v2, v13, v9);
  v21 = v27;
  v20(&v2[*(int *)(v27 + 48)], v6, v3);
  _TupleScene.init(_:)(v2, v21);
  v22 = *(void (**)(char *, uint64_t))(v19 + 8);
  v22(v8, v3);
  v23 = *(void (**)(char *, uint64_t))(v25 + 8);
  v23(v15, v9);
  v22(v6, v3);
  return ((uint64_t (*)(char *, uint64_t))v23)(v13, v9);
}

uint64_t sub_100003D84@<X0>(uint64_t a1@<X8>)
{
  return sub_100003E30((uint64_t)sub_100003D90, a1);
}

uint64_t sub_100003D94()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100003DB4(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for ColorScheme(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.colorScheme.setter(v3);
}

uint64_t sub_100003E30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t KeyPath;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v24;

  v4 = type metadata accessor for ColorScheme(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000040EC(&qword_100018828);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1000040EC(&qword_100018818);
  __chkstk_darwin();
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100004290();
  NavigationStack.init<>(root:)(a1, 0, &type metadata for PhotoLibraryView, v15);
  KeyPath = swift_getKeyPath(&unk_100010868);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for ColorScheme.dark(_:), v4);
  v17 = (uint64_t *)&v14[*(int *)(v12 + 36)];
  v18 = sub_1000040EC(&qword_100018838);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))((char *)v17 + *(int *)(v18 + 28), v7, v4);
  *v17 = KeyPath;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v14, v11, v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v19 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v20 = static Color.black.getter(v19);
  v21 = swift_getKeyPath(&unk_100010898);
  sub_100004324((uint64_t)v14, a2);
  v22 = (uint64_t *)(a2 + *(int *)(sub_1000040EC(&qword_100018800) + 36));
  *v22 = v21;
  v22[1] = v20;
  return sub_10000436C((uint64_t)v14);
}

id (*sub_100004018@<X0>(uint64_t a1@<X8>))()
{
  id (*result)();
  uint64_t v3;
  char v4;
  char v5;

  result = PhotoLibraryView.init()();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_BYTE *)(a1 + 17) = v5 & 1;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100004088();
  static App.main()();
  return 0;
}

unint64_t sub_100004088()
{
  unint64_t result;

  result = qword_1000187E0;
  if (!qword_1000187E0)
  {
    result = swift_getWitnessTable("}F", &type metadata for ClarityPhotosApp);
    atomic_store(result, (unint64_t *)&qword_1000187E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ClarityPhotosApp()
{
  return &type metadata for ClarityPhotosApp;
}

uint64_t sub_1000040DC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000111D0, 1);
}

uint64_t sub_1000040EC(uint64_t *a1)
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

unint64_t sub_10000412C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018808;
  if (!qword_100018808)
  {
    v1 = sub_1000041B0(&qword_100018800);
    sub_1000041F4();
    sub_1000043D8(&qword_100018840, &qword_100018848, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018808);
  }
  return result;
}

uint64_t sub_1000041B0(uint64_t *a1)
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

unint64_t sub_1000041F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018810;
  if (!qword_100018810)
  {
    v1 = sub_1000041B0(&qword_100018818);
    sub_1000043D8(&qword_100018820, &qword_100018828, (uint64_t)&protocol conformance descriptor for NavigationStack<A, B>);
    sub_1000043D8(&qword_100018830, &qword_100018838, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018810);
  }
  return result;
}

unint64_t sub_100004290()
{
  unint64_t result;

  result = qword_100018850;
  if (!qword_100018850)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for PhotoLibraryView, &type metadata for PhotoLibraryView);
    atomic_store(result, (unint64_t *)&qword_100018850);
  }
  return result;
}

uint64_t sub_1000042D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.tintColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000042FC(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.tintColor.setter(v1);
}

uint64_t sub_100004324(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000040EC(&qword_100018818);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000436C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000040EC(&qword_100018818);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000043AC()
{
  return sub_1000043D8(&qword_100018858, &qword_100018860, (uint64_t)&protocol conformance descriptor for _TupleScene<A>);
}

uint64_t sub_1000043D8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000041B0(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100004418()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC13ClarityPhotosP33_73689473195CF8DE0EF87B1925FBE47119ResourceBundleClass);
}

uint64_t static UIInterfaceOrientation.window.getter()
{
  id v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v27;
  uint64_t v28[2];

  v0 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v1 = objc_msgSend(v0, "connectedScenes");

  v2 = sub_1000052D8(0, &qword_100018920, UIScene_ptr);
  v3 = sub_1000047AC();
  v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v1, v2, v3);

  if ((v4 & 0xC000000000000001) != 0)
  {
    if (v4 < 0)
      v5 = v4;
    else
      v5 = v4 & 0xFFFFFFFFFFFFFF8;
    v6 = __CocoaSet.count.getter(v5);
  }
  else
  {
    v6 = *(_QWORD *)(v4 + 16);
  }
  if (v6 >= 2)
  {
    if (qword_100018900 != -1)
      swift_once(&qword_100018900, sub_100009E90);
    v7 = type metadata accessor for Logger(0);
    sub_100004B14(v7, (uint64_t)qword_100019A20);
    v8 = swift_bridgeObjectRetain_n(v4, 2);
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(12, -1);
      v12 = swift_slowAlloc(32, -1);
      v28[0] = v12;
      *(_DWORD *)v11 = 136315138;
      v13 = swift_bridgeObjectRetain(v4);
      v14 = Set.description.getter(v13, v2, v3);
      v16 = v15;
      swift_bridgeObjectRelease(v4);
      v27 = sub_100004B84(v14, v16, v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, v28, v11 + 4, v11 + 12);
      swift_bridgeObjectRelease_n(v4, 2);
      swift_bridgeObjectRelease(v16);
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Unexpectedly had multiple scenes: %s", v11, 0xCu);
      swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v12, -1, -1);
      swift_slowDealloc(v11, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v4, 2);
    }
  }
  sub_100004804(v4);
  v18 = v17;
  swift_bridgeObjectRelease(v4);
  if (v18)
  {
    v19 = objc_opt_self(UIWindowScene);
    v20 = (void *)swift_dynamicCastObjCClass(v18, v19);
    if (v20)
    {
      v21 = (uint64_t)objc_msgSend(v20, "interfaceOrientation");
      goto LABEL_22;
    }

  }
  if (qword_100018900 != -1)
    swift_once(&qword_100018900, sub_100009E90);
  v22 = type metadata accessor for Logger(0);
  v23 = sub_100004B14(v22, (uint64_t)qword_100019A20);
  v18 = Logger.logObject.getter(v23);
  v24 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v18, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v24, "Unexpectedly had no window scene.", v25, 2u);
    swift_slowDealloc(v25, -1, -1);
  }
  v21 = 1;
LABEL_22:

  return v21;
}

unint64_t sub_1000047AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018928;
  if (!qword_100018928)
  {
    v1 = sub_1000052D8(255, &qword_100018920, UIScene_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100018928);
  }
  return result;
}

void sub_100004804(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id i;
  int64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  void *v28;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v2 = a1;
    else
      v2 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = __CocoaSet.makeIterator()(v2);
    v4 = sub_1000052D8(0, &qword_100018920, UIScene_ptr);
    v5 = sub_1000047AC();
    v6 = Set.Iterator.init(_cocoa:)(v27, v3, v4, v5);
    v1 = v27[0];
    v25 = v27[1];
    v7 = v27[2];
    v8 = v27[3];
    v9 = v27[4];
  }
  else
  {
    v10 = -1 << *(_BYTE *)(a1 + 32);
    v25 = a1 + 56;
    v7 = ~v10;
    v11 = -v10;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v9 = v12 & *(_QWORD *)(a1 + 56);
    v6 = (_QWORD *)swift_bridgeObjectRetain(a1);
    v8 = 0;
  }
  v24 = (unint64_t)(v7 + 64) >> 6;
  if (v1 < 0)
    goto LABEL_13;
LABEL_11:
  if (v9)
  {
    v13 = (v9 - 1) & v9;
    v14 = __clz(__rbit64(v9)) | (v8 << 6);
    v15 = v8;
    goto LABEL_32;
  }
  v20 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v20 < v24)
    {
      v21 = *(_QWORD *)(v25 + 8 * v20);
      v15 = v8 + 1;
      if (v21)
        goto LABEL_31;
      v15 = v8 + 2;
      if (v8 + 2 >= v24)
        goto LABEL_36;
      v21 = *(_QWORD *)(v25 + 8 * v15);
      if (v21)
        goto LABEL_31;
      v15 = v8 + 3;
      if (v8 + 3 >= v24)
        goto LABEL_36;
      v21 = *(_QWORD *)(v25 + 8 * v15);
      if (v21)
        goto LABEL_31;
      v15 = v8 + 4;
      if (v8 + 4 >= v24)
        goto LABEL_36;
      v21 = *(_QWORD *)(v25 + 8 * v15);
      if (v21)
      {
LABEL_31:
        v13 = (v21 - 1) & v21;
        v14 = __clz(__rbit64(v21)) + (v15 << 6);
LABEL_32:
        for (i = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v14); i; v13 = v9)
        {
          v23 = sub_1000052D8(0, &qword_100018940, UIWindowScene_ptr);
          if (objc_msgSend(i, "isKindOfClass:", swift_getObjCClassFromMetadata(v23)))
            break;

          v8 = v15;
          v9 = v13;
          if ((v1 & 0x8000000000000000) == 0)
            goto LABEL_11;
LABEL_13:
          v16 = __CocoaSet.Iterator.next()(v6);
          if (!v16)
            break;
          v17 = v16;
          v26 = v16;
          v18 = sub_1000052D8(0, &qword_100018920, UIScene_ptr);
          swift_unknownObjectRetain(v17);
          swift_dynamicCast(&v28, &v26, (char *)&type metadata for Swift.AnyObject + 8, v18, 7);
          i = v28;
          swift_unknownObjectRelease(v17);
          v15 = v8;
        }
        goto LABEL_36;
      }
      v15 = v8 + 5;
      if (v8 + 5 < v24)
      {
        v21 = *(_QWORD *)(v25 + 8 * v15);
        if (!v21)
        {
          v22 = v8 + 6;
          while (v24 != v22)
          {
            v21 = *(_QWORD *)(v25 + 8 * v22++);
            if (v21)
            {
              v15 = v22 - 1;
              goto LABEL_31;
            }
          }
          goto LABEL_36;
        }
        goto LABEL_31;
      }
    }
LABEL_36:
    sub_1000052D0(v1);
    return;
  }
  __break(1u);
}

uint64_t static UIInterfaceOrientation.fromDeviceOrientation(_:)(uint64_t result)
{
  if ((unint64_t)(result - 5) < 0xFFFFFFFFFFFFFFFCLL)
    return 0;
  return result;
}

uint64_t sub_100004B14(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

BOOL variable initialization expression of PhotoLibraryView.isPad()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  return v1 == (id)1;
}

uint64_t sub_100004B84(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100004C54(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100005290((uint64_t)v12, *a3);
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
      sub_100005290((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100005270(v12);
  return v7;
}

uint64_t sub_100004C54(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100004E0C(a5, a6);
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

uint64_t sub_100004E0C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100004EA0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100005078(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100005078(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100004EA0(uint64_t a1, unint64_t a2)
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
      v5 = sub_100005014(v4, 0);
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

_QWORD *sub_100005014(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000040EC(&qword_100018938);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100005078(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000040EC(&qword_100018938);
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

__n128 sub_1000051C4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000051D4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1000051F4(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_100018930)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100015040);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100018930);
  }
}

uint64_t sub_100005270(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100005290(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000052D0(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000052D8(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_100005314(uint64_t a1, uint64_t a2)
{
  return swift_retain(a2);
}

uint64_t destroy for VideoDetailView(uint64_t *a1)
{
  return sub_10000532C(*a1, a1[1]);
}

uint64_t sub_10000532C(uint64_t a1, uint64_t a2)
{
  return swift_release(a2);
}

uint64_t _s15ClarityPhotosUI15VideoDetailViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100005314(*(_QWORD *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for VideoDetailView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100005314(*(_QWORD *)a2, v4);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_10000532C(v6, v7);
  return a1;
}

__n128 initializeWithTake for VideoDetailView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for VideoDetailView(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_10000532C(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for VideoDetailView(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for VideoDetailView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for VideoDetailView()
{
  return &type metadata for VideoDetailView;
}

uint64_t sub_1000054C4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100011290, 1);
}

uint64_t sub_1000054D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (**v24)();
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v48 = a4;
  v42 = sub_1000040EC(&qword_100018950);
  v7 = *(_QWORD *)(v42 - 8);
  __chkstk_darwin(v42);
  v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_1000040EC(&qword_100018958);
  __chkstk_darwin(v41);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_1000040EC(&qword_100018960);
  __chkstk_darwin(v46);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_1000040EC(&qword_100018968);
  __chkstk_darwin(v47);
  v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1000040EC(&qword_100018970);
  __chkstk_darwin(v16);
  v45 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for PlayerViewModel();
  v44 = v18;
  v43 = sub_100005984();
  v19 = a3 & 1;
  v20 = StateObject.wrappedValue.getter(a1, a2, v19, v18, v43);
  v21 = *(id *)(v20 + 16);
  swift_release(v20);
  VideoPlayer<>.init(player:)(v21);
  v22 = swift_allocObject(&unk_1000150E8, 33, 7);
  *(_QWORD *)(v22 + 16) = a1;
  *(_QWORD *)(v22 + 24) = a2;
  *(_BYTE *)(v22 + 32) = v19;
  v23 = v42;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v9, v42);
  v24 = (uint64_t (**)())&v11[*(int *)(v41 + 36)];
  *v24 = sub_1000059D0;
  v24[1] = (uint64_t (*)())v22;
  v24[2] = 0;
  v24[3] = 0;
  sub_100005314(a1, a2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v23);
  v25 = swift_allocObject(&unk_100015110, 33, 7);
  *(_QWORD *)(v25 + 16) = a1;
  *(_QWORD *)(v25 + 24) = a2;
  *(_BYTE *)(v25 + 32) = v19;
  sub_100005BE4((uint64_t)v11, (uint64_t)v13, &qword_100018958);
  v26 = &v13[*(int *)(v46 + 36)];
  *(_QWORD *)v26 = 0;
  *((_QWORD *)v26 + 1) = 0;
  *((_QWORD *)v26 + 2) = sub_100005A20;
  *((_QWORD *)v26 + 3) = v25;
  sub_100005314(a1, a2);
  sub_100005C28((uint64_t)v11, &qword_100018958);
  sub_100005BE4((uint64_t)v13, (uint64_t)v15, &qword_100018960);
  v27 = v47;
  v15[*(int *)(v47 + 36)] = 1;
  sub_100005C28((uint64_t)v13, &qword_100018960);
  v28 = sub_100005A44();
  v29 = v45;
  View.accessibilityIdentifier(_:)(0x6F65646956, 0xE500000000000000, v27, v28);
  sub_100005C28((uint64_t)v15, &qword_100018968);
  v31 = v43;
  v30 = v44;
  v32 = StateObject.wrappedValue.getter(a1, a2, v19, v44, v43);
  v33 = *(double *)(v32 + 24);
  swift_release(v32);
  v34 = StateObject.wrappedValue.getter(a1, a2, v19, v30, v31);
  v35 = *(double *)(v34 + 32);
  swift_release(v34);
  v36 = (uint64_t)v29;
  v37 = (uint64_t)v29;
  v38 = v48;
  sub_100005BE4(v37, v48, &qword_100018970);
  v39 = v38 + *(int *)(sub_1000040EC(&qword_1000189A8) + 36);
  *(double *)v39 = v33 / v35;
  *(_WORD *)(v39 + 8) = 0;
  return sub_100005C28(v36, &qword_100018970);
}

uint64_t sub_100005890(uint64_t a1, uint64_t a2, char a3, SEL *a4)
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v7 = a3 & 1;
  v8 = type metadata accessor for PlayerViewModel();
  v9 = sub_100005984();
  v10 = StateObject.wrappedValue.getter(a1, a2, v7, v8, v9);
  objc_msgSend(*(id *)(v10 + 16), *a4);
  return swift_release(v10);
}

uint64_t sub_10000590C()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100005924@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v3 = *(_QWORD *)v1;
  v4 = *(_QWORD *)(v1 + 8);
  v5 = *(_BYTE *)(v1 + 16);
  *(_QWORD *)a1 = static HorizontalAlignment.center.getter();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v6 = sub_1000040EC(&qword_100018948);
  return sub_1000054D4(v3, v4, v5, a1 + *(int *)(v6 + 44));
}

unint64_t sub_100005984()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018978;
  if (!qword_100018978)
  {
    v1 = type metadata accessor for PlayerViewModel();
    result = swift_getWitnessTable("aH", v1);
    atomic_store(result, (unint64_t *)&qword_100018978);
  }
  return result;
}

uint64_t sub_1000059D0()
{
  uint64_t v0;

  return sub_100005890(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32), (SEL *)&selRef_play);
}

uint64_t sub_1000059F8()
{
  uint64_t v0;

  sub_10000532C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 33, 7);
}

uint64_t sub_100005A20()
{
  uint64_t v0;

  return sub_100005890(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32), (SEL *)&selRef_pause);
}

unint64_t sub_100005A44()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018980;
  if (!qword_100018980)
  {
    v1 = sub_1000041B0(&qword_100018968);
    sub_100005AB0();
    sub_100005BA0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018980);
  }
  return result;
}

unint64_t sub_100005AB0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018988;
  if (!qword_100018988)
  {
    v1 = sub_1000041B0(&qword_100018960);
    sub_100005B1C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018988);
  }
  return result;
}

unint64_t sub_100005B1C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018990;
  if (!qword_100018990)
  {
    v1 = sub_1000041B0(&qword_100018958);
    sub_1000043D8(&qword_100018998, &qword_100018950, (uint64_t)&protocol conformance descriptor for VideoPlayer<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018990);
  }
  return result;
}

unint64_t sub_100005BA0()
{
  unint64_t result;

  result = qword_1000189A0;
  if (!qword_1000189A0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for _AccessibilityIgnoresInvertColorsViewModifier, &type metadata for _AccessibilityIgnoresInvertColorsViewModifier);
    atomic_store(result, (unint64_t *)&qword_1000189A0);
  }
  return result;
}

uint64_t sub_100005BE4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000040EC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100005C28(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000040EC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100005C64()
{
  return sub_1000043D8(&qword_1000189B0, &qword_1000189B8, (uint64_t)&protocol conformance descriptor for VStack<A>);
}

char *sub_100005C90(char *a1, char **a2, uint64_t a3)
{
  int v4;
  char *v5;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain(v5);
  }
  else
  {
    a1[8] = *((_BYTE *)a2 + 8);
    v9 = a2[2];
    v8 = a2[3];
    *((_QWORD *)a1 + 2) = v9;
    *((_QWORD *)a1 + 3) = v8;
    *((_DWORD *)a1 + 8) = *((_DWORD *)a2 + 8);
    a1[36] = *((_BYTE *)a2 + 36);
    v10 = a2[5];
    v11 = (uint64_t)a2[6];
    *((_QWORD *)a1 + 5) = v10;
    v12 = *((_BYTE *)a2 + 56);
    v13 = v5;
    v14 = v9;
    swift_retain(v8);
    swift_retain(v10);
    sub_100005D9C(v11, v12);
    *((_QWORD *)a1 + 6) = v11;
    a1[56] = v12;
    v15 = *(int *)(a3 + 36);
    v16 = &a1[v15];
    v17 = (uint64_t)a2 + v15;
    *(_OWORD *)&a1[v15] = *(_OWORD *)((char *)a2 + v15);
    v18 = *(int *)(type metadata accessor for RoundedRectangle(0) + 20);
    v19 = &v16[v18];
    v20 = v17 + v18;
    v21 = type metadata accessor for RoundedCornerStyle(0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
  }
  return a1;
}

uint64_t sub_100005D9C(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return swift_retain(result);
  return result;
}

uint64_t sub_100005DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release(*(_QWORD *)(a1 + 24));
  swift_release(*(_QWORD *)(a1 + 40));
  sub_100005E24(*(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
  v4 = a1 + *(int *)(a2 + 36);
  v5 = v4 + *(int *)(type metadata accessor for RoundedRectangle(0) + 20);
  v6 = type metadata accessor for RoundedCornerStyle(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t sub_100005E24(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return swift_release(result);
  return result;
}

uint64_t sub_100005E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;

  v6 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v8 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v7;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v9;
  v11 = *(_BYTE *)(a2 + 56);
  v12 = v6;
  v13 = v8;
  swift_retain(v7);
  swift_retain(v9);
  sub_100005D9C(v10, v11);
  *(_QWORD *)(a1 + 48) = v10;
  *(_BYTE *)(a1 + 56) = v11;
  v14 = *(int *)(a3 + 36);
  v15 = a1 + v14;
  v16 = (_OWORD *)(a2 + v14);
  *(_OWORD *)(a1 + v14) = *v16;
  v17 = *(int *)(type metadata accessor for RoundedRectangle(0) + 20);
  v18 = v15 + v17;
  v19 = (char *)v16 + v17;
  v20 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  return a1;
}

uint64_t sub_100005F18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v9 = *(void **)(a1 + 16);
  v10 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  v11 = v10;

  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v13;
  swift_retain(v13);
  swift_release(v12);
  v14 = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v14;
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v16;
  swift_retain(v16);
  swift_release(v15);
  v17 = *(_QWORD *)(a2 + 48);
  v18 = *(_BYTE *)(a2 + 56);
  sub_100005D9C(v17, v18);
  v19 = *(_QWORD *)(a1 + 48);
  v20 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v17;
  *(_BYTE *)(a1 + 56) = v18;
  sub_100005E24(v19, v20);
  v21 = *(int *)(a3 + 36);
  v22 = (_QWORD *)(a1 + v21);
  v23 = a2 + v21;
  *v22 = *(_QWORD *)(a2 + v21);
  v22[1] = *(_QWORD *)(a2 + v21 + 8);
  v24 = *(int *)(type metadata accessor for RoundedRectangle(0) + 20);
  v25 = (char *)v22 + v24;
  v26 = v23 + v24;
  v27 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 24))(v25, v26, v27);
  return a1;
}

uint64_t sub_100006038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v5 = *(int *)(a3 + 36);
  v6 = a1 + v5;
  v7 = a2 + v5;
  *(_OWORD *)(a1 + v5) = *(_OWORD *)(a2 + v5);
  v8 = *(int *)(type metadata accessor for RoundedRectangle(0) + 20);
  v9 = v6 + v8;
  v10 = v7 + v8;
  v11 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t sub_1000060D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v7 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  v8 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release(v8);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release(v9);
  v10 = *(_BYTE *)(a2 + 56);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = v10;
  sub_100005E24(v11, v12);
  v13 = *(int *)(a3 + 36);
  v14 = a1 + v13;
  v15 = (_OWORD *)(a2 + v13);
  *(_OWORD *)(a1 + v13) = *v15;
  v16 = *(int *)(type metadata accessor for RoundedRectangle(0) + 20);
  v17 = v14 + v16;
  v18 = (char *)v15 + v16;
  v19 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t sub_1000061BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000061C8);
}

uint64_t sub_1000061C8(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for RoundedRectangle(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 36)], a2, v8);
  }
}

uint64_t sub_100006244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006250);
}

char *sub_100006250(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for RoundedRectangle(0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 36)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PhotoViewInternal(uint64_t a1)
{
  uint64_t result;

  result = qword_100018A18;
  if (!qword_100018A18)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PhotoViewInternal);
  return result;
}

uint64_t sub_100006300(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[6];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = &unk_100010998;
  v4[2] = &unk_1000109B0;
  v4[3] = &unk_1000109B0;
  v4[4] = &unk_1000109C8;
  result = type metadata accessor for RoundedRectangle(319);
  if (v3 <= 0x3F)
  {
    v4[5] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 6, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_100006398(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000112E0, 1);
}

uint64_t sub_1000063A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __n128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t (**v38)@<X0>(uint64_t@<X0>, uint64_t@<X8>);
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (**v48)@<X0>(uint64_t@<X0>, uint64_t@<X8>);
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
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
  uint64_t (**v67)@<X0>(uint64_t@<X0>, uint64_t@<X8>);
  __int128 v68;
  void *v69;

  v66 = sub_1000040EC(&qword_100018A60);
  __chkstk_darwin(v66);
  v67 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))((char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v60 = type metadata accessor for PhotoViewInternal(0);
  v62 = *(_QWORD *)(v60 - 8);
  __chkstk_darwin(v60);
  v63 = v4;
  v64 = (uint64_t)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = sub_1000040EC(&qword_100018A68);
  __chkstk_darwin(v59);
  v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Image.ResizingMode(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = sub_1000040EC(&qword_100018A70);
  __chkstk_darwin(v57);
  v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = sub_1000040EC(&qword_100018A78);
  __chkstk_darwin(v58);
  v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = sub_1000040EC(&qword_100018A80);
  v15 = __chkstk_darwin(v65);
  v17 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v61 = (uint64_t)&v52 - v18;
  v19 = v1;
  v68 = *(_OWORD *)(v1 + 16);
  sub_1000040EC(&qword_100018A88);
  v20 = State.wrappedValue.getter(&v69);
  v21 = v69;
  if (v69)
  {
    v52 = static Color.clear.getter(v20);
    v22 = static Alignment.center.getter();
    v53 = v23;
    v54 = v22;
    v56 = v21;
    v24 = Image.init(uiImage:)();
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for Image.ResizingMode.stretch(_:), v7);
    v25 = Image.resizable(capInsets:resizingMode:)(v10, v24, 0.0, 0.0, 0.0, 0.0);
    v55 = a1;
    v26 = v25;
    v27 = swift_release(v24);
    (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v27);
    v28 = v19 + *(int *)(v60 + 36);
    sub_100007200(v28, (uint64_t)v6, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
    *(_WORD *)&v6[*(int *)(v59 + 36)] = 256;
    sub_100005BE4((uint64_t)v6, (uint64_t)&v12[*(int *)(v57 + 36)], &qword_100018A68);
    *(_QWORD *)v12 = v52;
    *((_QWORD *)v12 + 1) = 0x3FF0000000000000;
    *((_WORD *)v12 + 8) = 0;
    *((_QWORD *)v12 + 3) = v26;
    *((_QWORD *)v12 + 4) = 0;
    *((_WORD *)v12 + 20) = 257;
    v29 = v53;
    *((_QWORD *)v12 + 6) = v54;
    *((_QWORD *)v12 + 7) = v29;
    sub_100005C28((uint64_t)v6, &qword_100018A68);
    v30 = (uint64_t)&v14[*(int *)(v58 + 36)];
    sub_100007200(v28, v30, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
    *(_BYTE *)(v30 + *(int *)(sub_1000040EC(&qword_100018AF0) + 36)) = 0;
    sub_100007274((uint64_t)v12, (uint64_t)v14, &qword_100018A70);
    v31 = v64;
    sub_100007200(v19, v64, type metadata accessor for PhotoViewInternal);
    v32 = *(unsigned __int8 *)(v62 + 80);
    v33 = (v32 + 16) & ~v32;
    v34 = swift_allocObject(&unk_100015198, v33 + v63, v32 | 7);
    sub_100006E90(v31, v34 + v33);
    sub_100005BE4((uint64_t)v14, (uint64_t)v17, &qword_100018A78);
    v35 = v65;
    v36 = &v17[*(int *)(v65 + 36)];
    *(_QWORD *)v36 = 0;
    *((_QWORD *)v36 + 1) = 0;
    *((_QWORD *)v36 + 2) = sub_100007248;
    *((_QWORD *)v36 + 3) = v34;
    sub_100005C28((uint64_t)v14, &qword_100018A78);
    v37 = v61;
    sub_100007274((uint64_t)v17, v61, &qword_100018A80);
    v38 = v67;
    sub_100005BE4(v37, (uint64_t)v67, &qword_100018A80);
    swift_storeEnumTagMultiPayload(v38, v66, 0);
    v39 = sub_1000040EC(&qword_100018A90);
    v40 = sub_100006F20();
    v41 = sub_10000717C();
    _ConditionalContent<>.init(storage:)(v38, v35, v39, v40, v41);

    return sub_100005C28(v37, &qword_100018A80);
  }
  else
  {
    v43 = v64;
    sub_100007200(v19, v64, type metadata accessor for PhotoViewInternal);
    v44 = *(unsigned __int8 *)(v62 + 80);
    v45 = (v44 + 16) & ~v44;
    v46 = swift_allocObject(&unk_100015170, v45 + v63, v44 | 7);
    sub_100006E90(v43, v46 + v45);
    v47 = v66;
    v48 = v67;
    *v67 = sub_100006ED4;
    v48[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v46;
    v48[2] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))0x3FF0000000000000;
    *((_WORD *)v48 + 12) = 0;
    swift_storeEnumTagMultiPayload(v48, v47, 1);
    v49 = sub_1000040EC(&qword_100018A90);
    v50 = sub_100006F20();
    v51 = sub_10000717C();
    return _ConditionalContent<>.init(storage:)(v48, v65, v49, v50, v51);
  }
}

uint64_t sub_1000068F4(uint64_t a1)
{
  uint64_t v2;
  int v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v10;
  __int128 v11;

  v11 = *(_OWORD *)(a1 + 16);
  v10 = 0;
  v2 = sub_1000040EC(&qword_100018A88);
  State.wrappedValue.setter(&v10, v2);
  v3 = *(_DWORD *)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 36);
  v5 = *(_QWORD *)(a1 + 40);
  LODWORD(v11) = v3;
  BYTE4(v11) = v4;
  *((_QWORD *)&v11 + 1) = v5;
  v6 = sub_1000040EC(&qword_100018B10);
  State.wrappedValue.getter(&v10);
  if ((v10 & 0x100000000) == 0)
  {
    v7 = v10;
    v8 = objc_msgSend((id)objc_opt_self(PHImageManager), "defaultManager");
    objc_msgSend(v8, "cancelImageRequest:", v7);

  }
  LODWORD(v11) = v3;
  BYTE4(v11) = v4;
  *((_QWORD *)&v11 + 1) = v5;
  LODWORD(v10) = 0;
  BYTE4(v10) = 1;
  return State.wrappedValue.setter(&v10, v6);
}

uint64_t sub_1000069F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (**v22)();
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v25 = a2;
  v26 = a1;
  v27 = a3;
  v3 = type metadata accessor for GeometryProxy(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for PhotoViewInternal(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  __chkstk_darwin(v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000040EC(&qword_100018B18);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  ProgressView<>.init<>()(v13);
  sub_100007200(v25, (uint64_t)v10, type metadata accessor for PhotoViewInternal);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v26, v3);
  v16 = *(unsigned __int8 *)(v8 + 80);
  v17 = (v16 + 16) & ~v16;
  v18 = *(unsigned __int8 *)(v4 + 80);
  v19 = (v9 + v18 + v17) & ~v18;
  v20 = swift_allocObject(&unk_1000151C0, v19 + v5, v16 | v18 | 7);
  sub_100006E90((uint64_t)v10, v20 + v17);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v20 + v19, v6, v3);
  v21 = v27;
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(v27, v15, v11);
  v22 = (uint64_t (**)())(v21 + *(int *)(sub_1000040EC(&qword_100018B20) + 36));
  *v22 = sub_1000073B8;
  v22[1] = (uint64_t (*)())v20;
  v22[2] = 0;
  v22[3] = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
}

uint64_t sub_100006BB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  char v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  int v27;
  char v28;
  void **aBlock;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, void *, uint64_t);
  void *v32;
  void *(*v33)(void *, uint64_t);
  uint64_t v34;

  v2 = type metadata accessor for PhotoViewInternal(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  __chkstk_darwin(v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(PHImageManager), "defaultManager");
  v7 = *(_QWORD *)a1;
  v8 = ((double (*)(void))GeometryProxy.size.getter)();
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_BYTE *)(a1 + 56);
  sub_100005D9C(v9, v10);
  v11 = sub_100009354(v9, v10);
  v12 = sub_100005E24(v9, v10);
  v13 = v8 * v11;
  GeometryProxy.size.getter(v12);
  v15 = v14;
  sub_100005D9C(v9, v10);
  v16 = sub_100009354(v9, v10);
  sub_100005E24(v9, v10);
  v17 = objc_msgSend(objc_allocWithZone((Class)PHImageRequestOptions), "init");
  objc_msgSend(v17, "setDeliveryMode:", 0);
  objc_msgSend(v17, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v17, "setAllowSecondaryDegradedImage:", 1);
  sub_100007200(a1, (uint64_t)v5, type metadata accessor for PhotoViewInternal);
  v18 = *(unsigned __int8 *)(v3 + 80);
  v19 = (v18 + 16) & ~v18;
  v20 = swift_allocObject(&unk_1000151E8, v19 + v4, v18 | 7);
  sub_100006E90((uint64_t)v5, v20 + v19);
  v33 = sub_1000074DC;
  v34 = v20;
  aBlock = _NSConcreteStackBlock;
  v30 = 1107296256;
  v31 = sub_1000078CC;
  v32 = &unk_100015200;
  v21 = _Block_copy(&aBlock);
  swift_release(v34);
  LODWORD(v7) = objc_msgSend(v6, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v7, 1, v17, v21, v13, v15 * v16);
  _Block_release(v21);

  v22 = *(_BYTE *)(a1 + 36);
  v23 = *(_QWORD *)(a1 + 40);
  LODWORD(aBlock) = *(_DWORD *)(a1 + 32);
  BYTE4(aBlock) = v22;
  v30 = v23;
  v27 = v7;
  v28 = 0;
  v24 = sub_1000040EC(&qword_100018B10);
  return State.wrappedValue.setter(&v27, v24);
}

void *sub_100006E38(void *result, uint64_t a2, uint64_t a3)
{
  id v3;
  uint64_t v4;
  void *v5;
  __int128 v6;

  if (result)
  {
    v6 = *(_OWORD *)(a3 + 16);
    v5 = result;
    v3 = result;
    v4 = sub_1000040EC(&qword_100018A88);
    return (void *)State.wrappedValue.setter(&v5, v4);
  }
  return result;
}

uint64_t sub_100006E90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PhotoViewInternal(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006ED4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PhotoViewInternal(0) - 8) + 80);
  return sub_1000069F0(a1, v2 + ((v5 + 16) & ~v5), a2);
}

unint64_t sub_100006F20()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018A98;
  if (!qword_100018A98)
  {
    v1 = sub_1000041B0(&qword_100018A80);
    sub_100006F8C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018A98);
  }
  return result;
}

unint64_t sub_100006F8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018AA0;
  if (!qword_100018AA0)
  {
    v1 = sub_1000041B0(&qword_100018A78);
    sub_100007010();
    sub_1000043D8(&qword_100018AE8, &qword_100018AF0, (uint64_t)&protocol conformance descriptor for _ContentShapeModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018AA0);
  }
  return result;
}

unint64_t sub_100007010()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018AA8;
  if (!qword_100018AA8)
  {
    v1 = sub_1000041B0(&qword_100018A70);
    sub_100007094();
    sub_1000043D8(&qword_100018AE0, &qword_100018A68, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018AA8);
  }
  return result;
}

unint64_t sub_100007094()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018AB0;
  if (!qword_100018AB0)
  {
    v1 = sub_1000041B0(&qword_100018AB8);
    sub_100007118();
    sub_1000043D8(&qword_100018AD0, &qword_100018AD8, (uint64_t)&protocol conformance descriptor for _OverlayModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018AB0);
  }
  return result;
}

unint64_t sub_100007118()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018AC0;
  if (!qword_100018AC0)
  {
    v1 = sub_1000041B0(&qword_100018AC8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018AC0);
  }
  return result;
}

unint64_t sub_10000717C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018AF8;
  if (!qword_100018AF8)
  {
    v1 = sub_1000041B0(&qword_100018A90);
    sub_1000043D8(&qword_100018B00, &qword_100018B08, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018AF8);
  }
  return result;
}

uint64_t sub_100007200(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100007248()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PhotoViewInternal(0) - 8) + 80);
  return sub_1000068F4(v0 + ((v1 + 16) & ~v1));
}

uint64_t sub_100007274(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000040EC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000072B8()
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

  v1 = type metadata accessor for PhotoViewInternal(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = type metadata accessor for GeometryProxy(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v4 + v5 + v8) & ~v8;
  v10 = v9 + *(_QWORD *)(v7 + 64);
  v11 = v3 | v8 | 7;
  v12 = v0 + v4;

  swift_release(*(_QWORD *)(v12 + 24));
  swift_release(*(_QWORD *)(v12 + 40));
  sub_100005E24(*(_QWORD *)(v12 + 48), *(_BYTE *)(v12 + 56));
  v13 = *(int *)(v1 + 36);
  v14 = v12 + v13 + *(int *)(type metadata accessor for RoundedRectangle(0) + 20);
  v15 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return swift_deallocObject(v0, v10, v11);
}

uint64_t sub_1000073B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PhotoViewInternal(0) - 8) + 80);
  v2 = (v1 + 16) & ~v1;
  type metadata accessor for GeometryProxy(0);
  return sub_100006BB4(v0 + v2);
}

uint64_t sub_10000741C()
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

  v1 = type metadata accessor for PhotoViewInternal(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  v7 = v0 + v4;

  swift_release(*(_QWORD *)(v7 + 24));
  swift_release(*(_QWORD *)(v7 + 40));
  sub_100005E24(*(_QWORD *)(v7 + 48), *(_BYTE *)(v7 + 56));
  v8 = *(int *)(v1 + 36);
  v9 = v7 + v8 + *(int *)(type metadata accessor for RoundedRectangle(0) + 20);
  v10 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  return swift_deallocObject(v0, v5, v6);
}

void *sub_1000074DC(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PhotoViewInternal(0) - 8) + 80);
  return sub_100006E38(a1, a2, v2 + ((v5 + 16) & ~v5));
}

uint64_t sub_100007528(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100007538(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100007544()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018B28;
  if (!qword_100018B28)
  {
    v1 = sub_1000041B0(&qword_100018B30);
    sub_100006F20();
    sub_10000717C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018B28);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for PhotoDetailView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for PhotoDetailView(uint64_t a1)
{

  swift_release(*(_QWORD *)(a1 + 16));
  swift_release(*(_QWORD *)(a1 + 24));
  swift_release(*(_QWORD *)(a1 + 32));
  return sub_100005E24(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
}

uint64_t initializeWithCopy for PhotoDetailView(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;
  id v11;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  v9 = *(_BYTE *)(a2 + 48);
  v10 = v3;
  v11 = v4;
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v7);
  sub_100005D9C(v8, v9);
  *(_QWORD *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for PhotoDetailView(uint64_t a1, void **a2)
{
  void **v2;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v2 = a2;
  v4 = *a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *a2;
  v6 = v4;

  v7 = *(void **)(a1 + 8);
  v8 = v2[1];
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  v10 = *(_QWORD *)(a1 + 16);
  v11 = v2[2];
  *(_QWORD *)(a1 + 16) = v11;
  swift_retain(v11);
  swift_release(v10);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = v2[3];
  *(_QWORD *)(a1 + 24) = v13;
  swift_retain(v13);
  swift_release(v12);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v2[4];
  *(_QWORD *)(a1 + 32) = v15;
  swift_retain(v15);
  swift_release(v14);
  v16 = (uint64_t)v2[5];
  LOBYTE(v2) = *((_BYTE *)v2 + 48);
  sub_100005D9C(v16, (char)v2);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_BYTE *)(a1 + 48);
  *(_QWORD *)(a1 + 40) = v16;
  *(_BYTE *)(a1 + 48) = (_BYTE)v2;
  sub_100005E24(v17, v18);
  return a1;
}

__n128 initializeWithTake for PhotoDetailView(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for PhotoDetailView(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  swift_release(*(_QWORD *)(a1 + 16));
  v5 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release(v5);
  v6 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release(v6);
  v7 = *(_BYTE *)(a2 + 48);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_BYTE *)(a1 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = v7;
  sub_100005E24(v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoDetailView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotoDetailView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
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
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotoDetailView()
{
  return &type metadata for PhotoDetailView;
}

uint64_t sub_1000078BC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001139C, 1);
}

uint64_t sub_1000078D0()
{
  void (**v0)(void);

  return sub_100009D1C(*v0);
}

uint64_t sub_1000078E0()
{
  return sub_100009D9C();
}

uint64_t sub_1000078F8(uint64_t a1, char a2)
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)(a1, a2 & 1);
}

uint64_t sub_100007938(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100010AE0, a3);
  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, WitnessTable);
}

uint64_t sub_100007994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100010AE0, a3);
  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, WitnessTable);
}

void sub_1000079F0(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100010AE0, a1);
  UIViewRepresentable.body.getter(a1, WitnessTable);
  __break(1u);
}

uint64_t sub_100007A20()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[3];
  uint64_t v15;
  char v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  id v22;
  id v23;

  v23 = *(id *)v0;
  v20 = *(_OWORD *)(v0 + 8);
  sub_100007274((uint64_t)&v20, (uint64_t)&v22, &qword_100018B38);
  sub_100007274((uint64_t)&v20 + 8, (uint64_t)&v21, &qword_100018B40);
  v17 = *(_OWORD *)(v0 + 24);
  sub_100007274((uint64_t)&v17, (uint64_t)&v19, &qword_100018B48);
  sub_100007274((uint64_t)&v17 + 8, (uint64_t)&v18, &qword_100018B50);
  v15 = *(_QWORD *)(v0 + 40);
  v16 = *(_BYTE *)(v0 + 48);
  v1 = swift_allocObject(&unk_1000152F8, 65, 7);
  v2 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v1 + 32) = v2;
  *(_OWORD *)(v1 + 48) = *(_OWORD *)(v0 + 32);
  *(_BYTE *)(v1 + 64) = *(_BYTE *)(v0 + 48);
  v14[1] = sub_100009290;
  v14[2] = v1;
  sub_1000092D8(&v23);
  sub_1000092D8(&v22);
  sub_100009300(&v21);
  sub_100009300(&v19);
  sub_100009300(&v18);
  sub_100009328((uint64_t)&v15);
  v3 = LocalizedStringKey.init(stringLiteral:)(0, 0xE000000000000000);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = Image.init(systemName:)(0, 0xE000000000000000);
  v14[0] = v10;
  v11 = sub_1000040EC(&qword_100018B58);
  v12 = sub_1000043D8(&qword_100018B60, &qword_100018B58, (uint64_t)&unk_100010BC0);
  ((void (*)(uint64_t, uint64_t, _QWORD, uint64_t, _QWORD *, uint64_t, void *, uint64_t, void *))View.navigationTitle<A>(_:icon:))(v3, v5, v7 & 1, v9, v14, v11, &type metadata for Image, v12, &protocol witness table for Image);
  swift_release(v1);
  swift_release(v10);
  swift_bridgeObjectRelease(v9);
  return swift_bridgeObjectRelease(v5);
}

double sub_100007C08@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int16 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  double result;
  __int128 v12;
  __int16 v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int16 v17;
  char v18;
  __int128 v19;
  __int128 v20;
  __int16 v21;
  char v22;
  uint64_t v23;
  char v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  id v30;
  id v31;

  v31 = *(id *)a1;
  if (objc_msgSend(v31, "mediaType") == (id)2)
  {
    sub_100007DF8((uint64_t)&v19);
    if (HIBYTE(v21))
      v4 = 256;
    else
      v4 = 0;
    v15 = v19;
    v16 = v20;
    v17 = v4 | v21;
    v18 = 0;
  }
  else
  {
    v28 = *(_OWORD *)(a1 + 8);
    sub_100007274((uint64_t)&v28, (uint64_t)&v30, &qword_100018B38);
    sub_100007274((uint64_t)&v28 + 8, (uint64_t)&v29, &qword_100018B40);
    v25 = *(_OWORD *)(a1 + 24);
    sub_100007274((uint64_t)&v25, (uint64_t)&v27, &qword_100018B48);
    sub_100007274((uint64_t)&v25 + 8, (uint64_t)&v26, &qword_100018B50);
    v23 = *(_QWORD *)(a1 + 40);
    v24 = *(_BYTE *)(a1 + 48);
    v5 = swift_allocObject(&unk_100015320, 65, 7);
    v6 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v5 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v5 + 32) = v6;
    *(_OWORD *)(v5 + 48) = *(_OWORD *)(a1 + 32);
    *(_BYTE *)(v5 + 64) = *(_BYTE *)(a1 + 48);
    *(_QWORD *)&v15 = sub_100009518;
    *((_QWORD *)&v15 + 1) = v5;
    v16 = 0uLL;
    v17 = 0;
    v18 = 1;
    sub_1000092D8(&v31);
    sub_1000092D8(&v30);
    sub_100009300(&v29);
    sub_100009300(&v27);
    sub_100009300(&v26);
    sub_100009328((uint64_t)&v23);
  }
  v7 = sub_1000040EC(&qword_100018B68);
  v8 = sub_1000040EC(&qword_100018B70);
  v9 = sub_100009520();
  v10 = sub_1000043D8(&qword_100018BA8, &qword_100018B70, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
  _ConditionalContent<>.init(storage:)(&v15, v7, v8, v9, v10);
  result = *(double *)&v19;
  v12 = v20;
  v13 = v21;
  v14 = v22;
  *(_OWORD *)a2 = v19;
  *(_OWORD *)(a2 + 16) = v12;
  *(_WORD *)(a2 + 32) = v13;
  *(_BYTE *)(a2 + 34) = v14;
  return result;
}

double sub_100007DF8@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  void (*v5)();
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double result;
  __int128 v14;
  char v15;
  char v16;
  void (*v17)();
  uint64_t v18;
  uint64_t (*v19)();
  void (*v20)();
  __int16 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  char v25;
  uint64_t v26;
  char v27;
  __int128 v28;
  uint64_t v29;
  id v30;
  id v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;

  v2 = v1;
  v32 = *(_OWORD *)(v1 + 24);
  v22 = *(_OWORD *)(v1 + 24);
  sub_1000040EC(&qword_100018BB0);
  v4 = State.wrappedValue.getter(&v17);
  v5 = v17;
  if (v17)
  {
    v17 = (void (*)())static Alignment.bottom.getter(v4);
    v18 = v6;
    v19 = sub_100009614;
    v20 = v5;
    v21 = 0;
  }
  else
  {
    sub_100007274((uint64_t)&v32 + 8, (uint64_t)&v34, &qword_100018B50);
    sub_100007274((uint64_t)&v32, (uint64_t)&v33, &qword_100018B48);
    v31 = *(id *)v2;
    v28 = *(_OWORD *)(v2 + 8);
    sub_100007274((uint64_t)&v28, (uint64_t)&v30, &qword_100018B38);
    sub_100007274((uint64_t)&v28 + 8, (uint64_t)&v29, &qword_100018B40);
    v26 = *(_QWORD *)(v2 + 40);
    v27 = *(_BYTE *)(v2 + 48);
    v7 = swift_allocObject(&unk_100015348, 65, 7);
    v8 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v7 + 32) = v8;
    *(_OWORD *)(v7 + 48) = *(_OWORD *)(v2 + 32);
    *(_BYTE *)(v7 + 64) = *(_BYTE *)(v2 + 48);
    v17 = sub_10000960C;
    v18 = v7;
    v19 = 0;
    v20 = 0;
    v21 = 256;
    sub_1000092D8(&v31);
    sub_1000092D8(&v30);
    sub_100009300(&v29);
    sub_100009300(&v33);
    sub_100009300(&v34);
    sub_100009328((uint64_t)&v26);
  }
  v9 = sub_1000040EC(&qword_100018B88);
  v10 = sub_1000040EC(&qword_100018B98);
  v11 = sub_1000043D8(&qword_100018B80, &qword_100018B88, (uint64_t)&protocol conformance descriptor for ZStack<A>);
  v12 = sub_10000978C(&qword_100018B90, &qword_100018B98, (void (*)(void))sub_1000095C4);
  _ConditionalContent<>.init(storage:)(&v17, v9, v10, v11, v12);
  result = *(double *)&v22;
  v14 = v23;
  v15 = v24;
  v16 = v25;
  *(_OWORD *)a1 = v22;
  *(_OWORD *)(a1 + 16) = v14;
  *(_BYTE *)(a1 + 32) = v15;
  *(_BYTE *)(a1 + 33) = v16;
  return result;
}

void sub_100008000(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t v17;
  char v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  id v24;
  id v25;

  if (qword_100018900 != -1)
    swift_once(&qword_100018900, sub_100009E90);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100004B14(v2, (uint64_t)qword_100019A20);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Requesting asset for video", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  v7 = objc_msgSend(objc_allocWithZone((Class)PHVideoRequestOptions), "init");
  objc_msgSend(v7, "setNetworkAccessAllowed:", 1);
  v8 = objc_msgSend((id)objc_opt_self(PHImageManager), "defaultManager");
  v25 = *(id *)a1;
  v9 = v25;
  v22 = *(_OWORD *)(a1 + 8);
  sub_100007274((uint64_t)&v22, (uint64_t)&v24, &qword_100018B38);
  sub_100007274((uint64_t)&v22 + 8, (uint64_t)&v23, &qword_100018B40);
  v19 = *(_OWORD *)(a1 + 24);
  sub_100007274((uint64_t)&v19, (uint64_t)&v21, &qword_100018B48);
  sub_100007274((uint64_t)&v19 + 8, (uint64_t)&v20, &qword_100018B50);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_BYTE *)(a1 + 48);
  v10 = swift_allocObject(&unk_100015370, 65, 7);
  v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v10 + 32) = v11;
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(a1 + 32);
  *(_BYTE *)(v10 + 64) = *(_BYTE *)(a1 + 48);
  v15[4] = sub_100009620;
  v16 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_1000078CC;
  v15[3] = &unk_100015388;
  v12 = _Block_copy(v15);
  v13 = v16;
  v14 = v7;
  sub_1000092D8(&v25);
  sub_1000092D8(&v24);
  sub_100009300(&v23);
  sub_100009300(&v21);
  sub_100009300(&v20);
  sub_100009328((uint64_t)&v17);
  objc_msgSend(v8, "requestPlayerItemForVideo:options:resultHandler:", v9, v14, v12, swift_release(v13).n128_f64[0]);
  _Block_release(v12);

}

void sub_100008294(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  id v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  id v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  id v43;
  id v44;

  if (a1)
  {
    v4 = qword_100018900;
    v5 = a1;
    if (v4 != -1)
      swift_once(&qword_100018900, sub_100009E90);
    v6 = type metadata accessor for Logger(0);
    v7 = sub_100004B14(v6, (uint64_t)qword_100019A20);
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Got player item", v10, 2u);
      swift_slowDealloc(v10, -1, -1);
    }

    v11 = *(id *)a3;
    v12 = v5;
    v13 = (double)(uint64_t)objc_msgSend(v11, "pixelWidth");
    v14 = (double)(uint64_t)objc_msgSend(v11, "pixelHeight");
    v15 = type metadata accessor for PlayerViewModel();
    v16 = swift_allocObject(v15, 40, 7);
    v17 = objc_msgSend(objc_allocWithZone((Class)AVPlayer), "initWithPlayerItem:", v12);

    *(_QWORD *)(v16 + 16) = v17;
    *(double *)(v16 + 24) = v13;
    *(double *)(v16 + 32) = v14;
    v41 = *(_OWORD *)(a3 + 24);
    *(_QWORD *)&v38 = v16;
    v18 = sub_1000040EC(&qword_100018BB0);
    State.wrappedValue.setter(&v38, v18);

  }
  else
  {
    if (qword_100018900 != -1)
      swift_once(&qword_100018900, sub_100009E90);
    v20 = type metadata accessor for Logger(0);
    sub_100004B14(v20, (uint64_t)qword_100019A20);
    v44 = *(id *)a3;
    v41 = *(_OWORD *)(a3 + 8);
    sub_100007274((uint64_t)&v41, (uint64_t)&v43, &qword_100018B38);
    sub_100007274((uint64_t)&v41 + 8, (uint64_t)&v42, &qword_100018B40);
    v38 = *(_OWORD *)(a3 + 24);
    sub_100007274((uint64_t)&v38, (uint64_t)&v40, &qword_100018B48);
    sub_100007274((uint64_t)&v38 + 8, (uint64_t)&v39, &qword_100018B50);
    v36 = *(_QWORD *)(a3 + 40);
    v37 = *(_BYTE *)(a3 + 48);
    sub_1000092D8(&v44);
    sub_1000092D8(&v43);
    sub_100009300(&v42);
    sub_100009300(&v40);
    sub_100009300(&v39);
    sub_100009328((uint64_t)&v36);
    swift_bridgeObjectRetain(a2);
    sub_1000092D8(&v44);
    sub_1000092D8(&v43);
    sub_100009300(&v42);
    sub_100009300(&v40);
    sub_100009300(&v39);
    sub_100009328((uint64_t)&v36);
    v21 = swift_bridgeObjectRetain(a2);
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = v44;
      v25 = swift_slowAlloc(22, -1);
      v26 = (_QWORD *)swift_slowAlloc(8, -1);
      v27 = swift_slowAlloc(32, -1);
      v34 = (uint64_t)v24;
      v35 = v27;
      *(_DWORD *)v25 = 138412546;
      v28 = v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v25 + 4, v25 + 12);
      *v26 = v24;
      sub_100009640(&v44);
      sub_100009640(&v43);
      sub_100009668(&v42);
      sub_100009668(&v40);
      sub_100009668(&v39);
      sub_100009690((uint64_t)&v36);
      sub_100009640(&v44);
      sub_100009640(&v43);
      sub_100009668(&v42);
      sub_100009668(&v40);
      sub_100009668(&v39);
      sub_100009690((uint64_t)&v36);
      *(_WORD *)(v25 + 12) = 2080;
      v34 = a2;
      swift_bridgeObjectRetain(a2);
      v29 = sub_1000040EC(&qword_100018BB8);
      v30 = String.init<A>(describing:)(&v34, v29);
      v32 = v31;
      v34 = sub_100004B84(v30, v31, &v35);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v25 + 14, v25 + 22);
      swift_bridgeObjectRelease_n(a2, 2);
      swift_bridgeObjectRelease(v32);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Could not get playerItem for %@. Info: %s", (uint8_t *)v25, 0x16u);
      v33 = sub_1000040EC(&qword_100018BC0);
      swift_arrayDestroy(v26, 1, v33);
      swift_slowDealloc(v26, -1, -1);
      swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v27, -1, -1);
      swift_slowDealloc(v25, -1, -1);

    }
    else
    {
      sub_100009640(&v44);
      sub_100009640(&v43);
      sub_100009668(&v42);
      sub_100009668(&v40);
      sub_100009668(&v39);
      sub_100009690((uint64_t)&v36);
      sub_100009640(&v44);
      sub_100009640(&v43);
      sub_100009668(&v42);
      sub_100009668(&v40);
      sub_100009668(&v39);
      sub_100009690((uint64_t)&v36);

      swift_bridgeObjectRelease_n(a2, 2);
    }
  }
}

uint64_t sub_1000087D4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void (*v5)(void *, uint64_t);
  uint64_t v6;
  id v7;

  v5 = *(void (**)(void *, uint64_t))(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (a3)
    v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v6 = 0;
  swift_retain(v4);
  v7 = a2;
  v5(a2, v6);
  swift_release(v4);

  return swift_bridgeObjectRelease(v6);
}

uint64_t sub_100008868@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v37[2];
  _QWORD v38[2];
  _OWORD v39[3];
  uint64_t v40;
  char v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  id v47;
  id v48;

  v37[1] = a3;
  v37[0] = type metadata accessor for GeometryProxy(0);
  v5 = *(_QWORD *)(v37[0] - 8);
  v6 = *(_QWORD *)(v5 + 64);
  __chkstk_darwin(v37[0]);
  v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000040EC(&qword_100018BC8);
  __chkstk_darwin(v8);
  v10 = (char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000040EC(&qword_100018BD0);
  __chkstk_darwin(v11);
  v13 = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100008B98(a2, (uint64_t)v10);
  v15 = GeometryProxy.size.getter(v14);
  v17 = GeometryProxy.size.getter(v16);
  v19 = v18;
  v20 = static Alignment.center.getter(v17);
  _FrameLayout.init(width:height:alignment:)(v39, *(_QWORD *)&v15, 0, v19, 0, v20, v21);
  sub_100005BE4((uint64_t)v10, (uint64_t)v13, &qword_100018BC8);
  v22 = &v13[*(int *)(v11 + 36)];
  v23 = v39[1];
  *(_OWORD *)v22 = v39[0];
  *((_OWORD *)v22 + 1) = v23;
  *((_OWORD *)v22 + 2) = v39[2];
  v24 = sub_100005C28((uint64_t)v10, &qword_100018BC8);
  v38[0] = GeometryProxy.size.getter(v24);
  v38[1] = v25;
  v48 = *(id *)a2;
  v45 = *(_OWORD *)(a2 + 8);
  sub_100007274((uint64_t)&v45, (uint64_t)&v47, &qword_100018B38);
  sub_100007274((uint64_t)&v45 + 8, (uint64_t)&v46, &qword_100018B40);
  v42 = *(_OWORD *)(a2 + 24);
  sub_100007274((uint64_t)&v42, (uint64_t)&v44, &qword_100018B48);
  sub_100007274((uint64_t)&v42 + 8, (uint64_t)&v43, &qword_100018B50);
  v40 = *(_QWORD *)(a2 + 40);
  v41 = *(_BYTE *)(a2 + 48);
  v26 = a1;
  v27 = v37[0];
  (*(void (**)(char *, uint64_t, _QWORD))(v5 + 16))(v7, v26, v37[0]);
  v28 = *(unsigned __int8 *)(v5 + 80);
  v29 = (v28 + 65) & ~v28;
  v30 = swift_allocObject(&unk_1000153C0, v29 + v6, v28 | 7);
  v31 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v30 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v30 + 32) = v31;
  *(_OWORD *)(v30 + 48) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(v30 + 64) = *(_BYTE *)(a2 + 48);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v30 + v29, v7, v27);
  sub_1000092D8(&v48);
  sub_1000092D8(&v47);
  sub_100009300(&v46);
  sub_100009300(&v44);
  sub_100009300(&v43);
  sub_100009328((uint64_t)&v40);
  type metadata accessor for CGSize();
  v33 = v32;
  v34 = sub_10000978C(&qword_100018BD8, &qword_100018BD0, (void (*)(void))sub_1000097F4);
  v35 = sub_1000099AC(&qword_100018C20, (uint64_t (*)(uint64_t))type metadata accessor for CGSize, (uint64_t)&protocol conformance descriptor for CGSize);
  View.onChange<A>(of:initial:_:)(v38, 1, sub_10000975C, v30, v11, v33, v34, v35);
  swift_release(v30);
  return sub_100005C28((uint64_t)v13, &qword_100018BD0);
}

uint64_t sub_100008B98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  __n128 v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v24;
  unint64_t v25;
  _QWORD v26[2];
  __int128 v27;
  __int16 v28;
  id v29;

  v4 = type metadata accessor for Image.ResizingMode(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000040EC(&qword_100018C00);
  __chkstk_darwin(v8);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000040EC(qword_100018C28);
  __chkstk_darwin(v11);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = *(_OWORD *)(a1 + 8);
  sub_1000040EC(&qword_100018A88);
  State.wrappedValue.getter(&v29);
  if (v29)
  {
    v14 = v29;
    v26[1] = a2;
    v15 = v14;
    v16 = Image.init(uiImage:)();
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for Image.ResizingMode.stretch(_:), v4);
    v17 = Image.resizable(capInsets:resizingMode:)(v7, v16, 0.0, 0.0, 0.0, 0.0);
    v18 = swift_release(v16);
    (*(void (**)(char *, uint64_t, __n128))(v5 + 8))(v7, v4, v18);
    v27 = (unint64_t)v17;
    v28 = 1;
    v19 = sub_1000040EC(&qword_100018C10);
    v20 = sub_100009948();
    View.accessibilityIdentifier(_:)(0x6F746F6850, 0xE500000000000000, v19, v20);
    swift_release(v17);
    sub_100005BE4((uint64_t)v10, (uint64_t)v13, &qword_100018C00);
    swift_storeEnumTagMultiPayload(v13, v11, 0);
    v21 = sub_1000098C4();
    v22 = sub_1000095C4();
    _ConditionalContent<>.init(storage:)(v13, v8, &type metadata for PhotoDetailView.LoadingView, v21, v22);

    return sub_100005C28((uint64_t)v10, &qword_100018C00);
  }
  else
  {
    swift_storeEnumTagMultiPayload(v13, v11, 1);
    v24 = sub_1000098C4();
    v25 = sub_1000095C4();
    return _ConditionalContent<>.init(storage:)(v13, v8, &type metadata for PhotoDetailView.LoadingView, v24, v25);
  }
}

void sub_100008E10(uint64_t a1)
{
  id v2;
  id v3;
  double v4;
  uint64_t v5;
  char v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  id v25;
  id v26;

  v2 = objc_msgSend((id)objc_opt_self(PHImageManager), "defaultManager");
  v26 = *(id *)a1;
  v3 = v26;
  v4 = GeometryProxy.size.getter(v2);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_BYTE *)(a1 + 48);
  sub_100005D9C(v5, v6);
  v7 = sub_100009354(v5, v6);
  v8 = sub_100005E24(v5, v6);
  v9 = v4 * v7;
  GeometryProxy.size.getter(v8);
  v11 = v10;
  sub_100005D9C(v5, v6);
  v12 = sub_100009354(v5, v6);
  sub_100005E24(v5, v6);
  v13 = objc_msgSend(objc_allocWithZone((Class)PHImageRequestOptions), "init");
  objc_msgSend(v13, "setDeliveryMode:", 0);
  objc_msgSend(v13, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v13, "setAllowSecondaryDegradedImage:", 1);
  v23 = *(_OWORD *)(a1 + 8);
  sub_100007274((uint64_t)&v23, (uint64_t)&v25, &qword_100018B38);
  sub_100007274((uint64_t)&v23 + 8, (uint64_t)&v24, &qword_100018B40);
  v20 = *(_OWORD *)(a1 + 24);
  sub_100007274((uint64_t)&v20, (uint64_t)&v22, &qword_100018B48);
  sub_100007274((uint64_t)&v20 + 8, (uint64_t)&v21, &qword_100018B50);
  v14 = swift_allocObject(&unk_1000153E8, 65, 7);
  v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v14 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v14 + 32) = v15;
  *(_OWORD *)(v14 + 48) = *(_OWORD *)(a1 + 32);
  *(_BYTE *)(v14 + 64) = *(_BYTE *)(a1 + 48);
  v18[4] = sub_100009A40;
  v19 = v14;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_1000078CC;
  v18[3] = &unk_100015400;
  v16 = _Block_copy(v18);
  v17 = v19;
  sub_100005D9C(v5, v6);
  sub_1000092D8(&v26);
  sub_1000092D8(&v25);
  sub_100009300(&v24);
  sub_100009300(&v22);
  sub_100009300(&v21);
  swift_release(v17);
  objc_msgSend(v2, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v3, 0, v13, v16, v9, v11 * v12);
  _Block_release(v16);

}

uint64_t sub_1000090A0(void *a1, uint64_t a2, uint64_t a3)
{
  id v3;
  uint64_t v4;
  void *v6;
  __int128 v7;

  v7 = *(_OWORD *)(a3 + 8);
  v6 = a1;
  v3 = a1;
  v4 = sub_1000040EC(&qword_100018A88);
  return State.wrappedValue.setter(&v6, v4);
}

uint64_t sub_1000090EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v2 = LocalizedStringKey.init(stringLiteral:)(0x474E4944414F4CLL, 0xE700000000000000);
  result = Text.init(_:tableName:bundle:comment:)(v2);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_10000915C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t *v10;
  uint64_t v12;

  v2 = sub_1000040EC(&qword_100018B18);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = ProgressView<>.init<>()(v4);
  v8 = static Color.white.getter(v7);
  KeyPath = swift_getKeyPath(&unk_100010C10);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v6, v2);
  v10 = (uint64_t *)(a1 + *(int *)(sub_1000040EC(&qword_100018CB0) + 36));
  *v10 = KeyPath;
  v10[1] = v8;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_100009224()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_1000040EC(&qword_100018CB0);
  v1 = sub_100009C30();
  return Label.init(title:icon:)(sub_1000090EC, 0, sub_10000915C, 0, &type metadata for Text, v0, &protocol witness table for Text, v1);
}

double sub_100009290@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int16 v3;
  char v4;
  double result;
  __int128 v6;
  _OWORD v7[2];
  __int16 v8;
  char v9;

  sub_100007C08(v1 + 16, (uint64_t)v7);
  v3 = v8;
  v4 = v9;
  result = *(double *)v7;
  v6 = v7[1];
  *(_OWORD *)a1 = v7[0];
  *(_OWORD *)(a1 + 16) = v6;
  *(_WORD *)(a1 + 32) = v3;
  *(_BYTE *)(a1 + 34) = v4;
  return result;
}

id *sub_1000092D8(id *a1)
{
  id v2;

  v2 = *a1;
  return a1;
}

_QWORD *sub_100009300(_QWORD *a1)
{
  swift_retain(*a1);
  return a1;
}

uint64_t sub_100009328(uint64_t a1)
{
  sub_100005D9C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return a1;
}

double sub_100009354(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v15;
  double v16;

  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return *(double *)&a1;
  v8 = swift_retain(a1);
  v9 = static os_log_type_t.fault.getter(v8);
  v10 = static Log.runtimeIssuesLog.getter();
  v11 = v9;
  if (os_log_type_enabled(v10, v9))
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    v16 = *(double *)&v13;
    *(_DWORD *)v12 = 136315138;
    v15 = sub_100004B84(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v12 + 4, v12 + 12);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath(&v16, v7, a1);
  sub_100005E24(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v16;
}

uint64_t sub_100009518@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100008868(a1, v2 + 16, a2);
}

unint64_t sub_100009520()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018B78;
  if (!qword_100018B78)
  {
    v1 = sub_1000041B0(&qword_100018B68);
    sub_1000043D8(&qword_100018B80, &qword_100018B88, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    sub_10000978C(&qword_100018B90, &qword_100018B98, (void (*)(void))sub_1000095C4);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018B78);
  }
  return result;
}

unint64_t sub_1000095C4()
{
  unint64_t result;

  result = qword_100018BA0;
  if (!qword_100018BA0)
  {
    result = swift_getWitnessTable(&unk_100010B70, &type metadata for PhotoDetailView.LoadingView);
    atomic_store(result, (unint64_t *)&qword_100018BA0);
  }
  return result;
}

void sub_10000960C()
{
  uint64_t v0;

  sub_100008000(v0 + 16);
}

uint64_t sub_100009614()
{
  uint64_t v0;

  return swift_retain(v0);
}

void sub_100009620(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_100008294(a1, a2, v2 + 16);
}

uint64_t sub_100009628(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100009638(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id *sub_100009640(id *a1)
{

  return a1;
}

_QWORD *sub_100009668(_QWORD *a1)
{
  swift_release(*a1);
  return a1;
}

uint64_t sub_100009690(uint64_t a1)
{
  sub_100005E24(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return a1;
}

uint64_t sub_1000096BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for GeometryProxy(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 65) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;

  swift_release(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 48));
  sub_100005E24(*(_QWORD *)(v0 + 56), *(_BYTE *)(v0 + 64));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_10000975C()
{
  uint64_t v0;

  type metadata accessor for GeometryProxy(0);
  sub_100008E10(v0 + 16);
}

uint64_t sub_10000978C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000041B0(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000097F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018BE0;
  if (!qword_100018BE0)
  {
    v1 = sub_1000041B0(&qword_100018BC8);
    sub_100009858();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100018BE0);
  }
  return result;
}

unint64_t sub_100009858()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018BE8;
  if (!qword_100018BE8)
  {
    v1 = sub_1000041B0(&qword_100018BF0);
    sub_1000098C4();
    sub_1000095C4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018BE8);
  }
  return result;
}

unint64_t sub_1000098C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018BF8;
  if (!qword_100018BF8)
  {
    v1 = sub_1000041B0(&qword_100018C00);
    sub_100009948();
    sub_1000099AC((unint64_t *)&qword_100018C18, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018BF8);
  }
  return result;
}

unint64_t sub_100009948()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018C08;
  if (!qword_100018C08)
  {
    v1 = sub_1000041B0(&qword_100018C10);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018C08);
  }
  return result;
}

uint64_t sub_1000099AC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_1000099F0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 48));
  sub_100005E24(*(_QWORD *)(v0 + 56), *(_BYTE *)(v0 + 64));
  return swift_deallocObject(v0, 65, 7);
}

uint64_t sub_100009A40(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1000090A0(a1, a2, v2 + 16);
}

ValueMetadata *type metadata accessor for PhotoDetailView.LoadingView()
{
  return &type metadata for PhotoDetailView.LoadingView;
}

uint64_t sub_100009A58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

_QWORD *sub_100009A60(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain(v3);
  return a1;
}

uint64_t sub_100009A8C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 8));
}

_QWORD *sub_100009A94(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain(v3);
  swift_release(v4);
  return a1;
}

uint64_t sub_100009ACC(uint64_t a1, _OWORD *a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *a2;
  swift_release(v3);
  return a1;
}

uint64_t sub_100009AFC(uint64_t *a1, int a2)
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

uint64_t sub_100009B44(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for PhotoViewHost(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100009E28(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotoViewHost);
}

uint64_t sub_100009B8C()
{
  _QWORD v1[4];

  v1[0] = sub_1000041B0(&qword_100018B58);
  v1[1] = &type metadata for Image;
  v1[2] = sub_1000043D8(&qword_100018B60, &qword_100018B58, (uint64_t)&unk_100010BC0);
  v1[3] = &protocol witness table for Image;
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.navigationTitle<A>(_:icon:)>>, 1);
}

uint64_t sub_100009C04(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100010BC0, a1);
}

uint64_t sub_100009C14(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000113C4, 1);
}

void *sub_100009C24()
{
  return &protocol witness table for Never;
}

unint64_t sub_100009C30()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018CB8;
  if (!qword_100018CB8)
  {
    v1 = sub_1000041B0(&qword_100018CB0);
    sub_1000043D8(&qword_100018CC0, &qword_100018B18, (uint64_t)&protocol conformance descriptor for ProgressView<A, B>);
    sub_1000043D8(&qword_100018840, &qword_100018848, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018CB8);
  }
  return result;
}

uint64_t sub_100009CCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.tintColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100009CF4(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.tintColor.setter(v1);
}

uint64_t sub_100009D1C(void (*a1)(void))
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  __chkstk_darwin();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for _UIHostingView(0, v4, v5);
  a1();
  return _UIHostingView.__allocating_init(rootView:)(v3);
}

uint64_t sub_100009D9C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  void (*v3)(uint64_t);
  uint64_t v5;

  v0 = __chkstk_darwin();
  v2 = (char *)&v5 - v1;
  v3(v0);
  return dispatch thunk of _UIHostingView.rootView.setter(v2);
}

uint64_t sub_100009E28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t sub_100009E54()
{
  return sub_1000043D8(&qword_100018CC8, &qword_100018CD0, (uint64_t)&protocol conformance descriptor for Label<A, B>);
}

uint64_t sub_100009E90()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100009FF8(v0, qword_100019A20);
  sub_100004B14(v0, (uint64_t)qword_100019A20);
  return Logger.init(subsystem:category:)(0xD000000000000017, 0x8000000100012E20, 0x5079746972616C43, 0xEF4955736F746F68);
}

uint64_t sub_100009F10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for OSSignposter(0);
  sub_100009FF8(v4, qword_100019A38);
  sub_100004B14(v4, (uint64_t)qword_100019A38);
  if (qword_100018900 != -1)
    swift_once(&qword_100018900, sub_100009E90);
  v5 = sub_100004B14(v0, (uint64_t)qword_100019A20);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return OSSignposter.init(logger:)(v3);
}

uint64_t *sub_100009FF8(uint64_t a1, uint64_t *a2)
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

ValueMetadata *type metadata accessor for PhotoCollection()
{
  return &type metadata for PhotoCollection;
}

uint64_t sub_10000A048()
{
  return sub_1000043D8(&qword_100018CD8, &qword_100018CE0, (uint64_t)&protocol conformance descriptor for IndexingIterator<A>);
}

id sub_10000A07C(int64_t a1, uint64_t a2, int64_t a3, id a4)
{
  id result;
  uint64_t v9;
  int64_t v10;
  BOOL v11;

  result = objc_msgSend(a4, "count");
  if (a1 < 0 || (uint64_t)result < a1)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = objc_msgSend(a4, "count");
  if (a3 < 0 || (uint64_t)result < a3)
    goto LABEL_17;
  v9 = a3 - a1;
  if (a2 >= 1)
  {
    if (v9 < 0 || v9 >= a2)
      goto LABEL_12;
    return 0;
  }
  if (v9 <= 0 && v9 > a2)
    return 0;
LABEL_12:
  v11 = __OFADD__(a1, a2);
  v10 = a1 + a2;
  if (v11)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  result = objc_msgSend(a4, "count");
  if ((v10 & 0x8000000000000000) == 0 && (uint64_t)result >= v10)
    return (id)v10;
LABEL_19:
  __break(1u);
  return result;
}

_QWORD *sub_10000A15C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if (__OFSUB__(*result, 1))
    __break(1u);
  else
    *a2 = *result - 1;
  return result;
}

_QWORD *sub_10000A174(_QWORD *result)
{
  if (__OFSUB__(*result, 1))
    __break(1u);
  else
    --*result;
  return result;
}

void sub_10000A18C(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

id sub_10000A194@<X0>(_QWORD *a1@<X8>)
{
  id *v1;
  id result;

  result = objc_msgSend(*v1, "count");
  *a1 = result;
  return result;
}

void (*sub_10000A1C4(_QWORD *a1, _QWORD *a2))(uint64_t a1)
{
  id *v2;
  id v4;

  v4 = objc_msgSend(*v2, "objectAtIndexedSubscript:", *a2);
  *a1 = v4;
  a1[1] = v4;
  return sub_10000A20C;
}

void sub_10000A20C(uint64_t a1)
{

}

uint64_t sub_10000A214@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  id *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  id v7;

  v5 = *a1;
  v4 = a1[1];
  v7 = *v2;
  result = (uint64_t)objc_msgSend(*v2, "count");
  if (result < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v5 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result >= v4)
  {
    *a2 = v5;
    a2[1] = v4;
    a2[2] = v7;
    return (uint64_t)v7;
  }
LABEL_7:
  __break(1u);
  return result;
}

unint64_t sub_10000A280@<X0>(_QWORD *a1@<X8>)
{
  id *v1;
  unint64_t result;

  result = (unint64_t)objc_msgSend(*v1, "count");
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    *a1 = 0;
    a1[1] = result;
  }
  return result;
}

BOOL sub_10000A2B8()
{
  id *v0;

  return objc_msgSend(*v0, "count") == 0;
}

void sub_10000A2E4(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

_QWORD *sub_10000A2F4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  id *v3;
  uint64_t v5;

  v5 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(*v3, "count");
    if ((v5 & 0x8000000000000000) == 0 && (uint64_t)result >= v5)
    {
      *a3 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

id sub_10000A34C@<X0>(int64_t *a1@<X0>, uint64_t a2@<X1>, int64_t *a3@<X2>, uint64_t a4@<X8>)
{
  id *v4;
  id result;
  char v7;

  result = sub_10000A07C(*a1, a2, *a3, *v4);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v7 & 1;
  return result;
}

id sub_10000A384(uint64_t *a1, uint64_t *a2)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id result;

  v3 = *a1;
  v4 = *a2;
  v5 = *v2;
  result = objc_msgSend(*v2, "count");
  if (v3 < 0 || (uint64_t)result < v3)
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v5, "count");
    if ((v4 & 0x8000000000000000) == 0 && (uint64_t)result >= v4)
      return (id)(v4 - v3);
  }
  __break(1u);
  return result;
}

uint64_t *sub_10000A3F0(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;

  v2 = *result;
  v3 = a2[1];
  if (*result >= *a2)
  {
    v5 = __OFSUB__(v2, v3);
    v4 = v2 - v3 < 0;
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  if (v4 == v5)
    __break(1u);
  return result;
}

_QWORD *sub_10000A40C(_QWORD *result, _QWORD *a2)
{
  if (*result < *a2 || a2[1] < *result)
    __break(1u);
  return result;
}

_QWORD *sub_10000A428(_QWORD *result, _QWORD *a2)
{
  if (*result < *a2 || a2[1] < result[1])
    __break(1u);
  return result;
}

_QWORD *sub_10000A444@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    *a2 = *result + 1;
  return result;
}

_QWORD *sub_10000A45C(_QWORD *result)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    ++*result;
  return result;
}

void sub_10000A474(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = 0;
}

int64_t sub_10000A480()
{
  void **v0;
  void *v1;
  int64_t v2;
  int64_t result;

  v1 = *v0;
  v2 = (int64_t)objc_msgSend(v1, "count");
  result = (int64_t)objc_msgSend(v1, "count");
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    result = (int64_t)objc_msgSend(v1, "count");
    if ((v2 & 0x8000000000000000) == 0 && result >= v2)
      return v2;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A4EC()
{
  return 2;
}

uint64_t sub_10000A4F4()
{
  void **v0;
  void *v1;
  uint64_t v2;

  v1 = *v0;
  v2 = sub_10000A964(*v0);

  return v2;
}

_QWORD *sub_10000A524(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  id *v3;

  return sub_10000A52C(a1, a2, a3, *v3);
}

_QWORD *sub_10000A52C(_QWORD *result, _QWORD *a2, uint64_t a3, id a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v8;

  v5 = result;
  if (!a2)
  {
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  v6 = a3;
  if (!a3)
  {
LABEL_11:
    *v5 = a4;
    v5[1] = v6;
    return (_QWORD *)v6;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (objc_msgSend(a4, "count"))
    {
      *a2 = objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
      if (v6 != 1)
      {
        v8 = 1;
        while ((id)v8 != objc_msgSend(a4, "count"))
        {
          a2[v8] = objc_msgSend(a4, "objectAtIndexedSubscript:", v8);
          if (v6 == ++v8)
            goto LABEL_11;
        }
        v6 = v8;
      }
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)(a1, a2, a4, a3);
}

unint64_t sub_10000A638()
{
  unint64_t result;

  result = qword_100018CE8;
  if (!qword_100018CE8)
  {
    result = swift_getWitnessTable("1I", &type metadata for PhotoCollection);
    atomic_store(result, (unint64_t *)&qword_100018CE8);
  }
  return result;
}

void *sub_10000A67C()
{
  return &protocol witness table for Int;
}

uint64_t sub_10000A688()
{
  return sub_10000A820(&qword_100018CF0, (uint64_t)&protocol conformance descriptor for <> Range<A>);
}

unint64_t sub_10000A6AC()
{
  unint64_t result;

  result = qword_100018D00;
  if (!qword_100018D00)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_100018D00);
  }
  return result;
}

uint64_t sub_10000A6F0()
{
  return sub_1000043D8(&qword_100018D08, &qword_100018D10, (uint64_t)&protocol conformance descriptor for Slice<A>);
}

unint64_t sub_10000A720()
{
  unint64_t result;

  result = qword_100018D18;
  if (!qword_100018D18)
  {
    result = swift_getWitnessTable(&unk_100010CB8, &type metadata for PhotoCollection);
    atomic_store(result, (unint64_t *)&qword_100018D18);
  }
  return result;
}

uint64_t sub_10000A764()
{
  return sub_10000A820(&qword_100018D20, (uint64_t)&protocol conformance descriptor for <> Range<A>);
}

uint64_t sub_10000A788()
{
  return sub_10000A8B8(&qword_100018D28, (void (*)(void))sub_10000A7B4, (uint64_t)&protocol conformance descriptor for <> Slice<A>);
}

unint64_t sub_10000A7B4()
{
  unint64_t result;

  result = qword_100018D30;
  if (!qword_100018D30)
  {
    result = swift_getWitnessTable(&unk_100010D98, &type metadata for PhotoCollection);
    atomic_store(result, (unint64_t *)&qword_100018D30);
  }
  return result;
}

uint64_t sub_10000A7FC()
{
  return sub_10000A820(&qword_100018D38, (uint64_t)&protocol conformance descriptor for <> Range<A>);
}

uint64_t sub_10000A820(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1000041B0(&qword_100018CF8);
    sub_10000A6AC();
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000A88C()
{
  return sub_10000A8B8(&qword_100018D40, (void (*)(void))sub_10000A920, (uint64_t)&protocol conformance descriptor for <> Slice<A>);
}

uint64_t sub_10000A8B8(unint64_t *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_1000041B0(&qword_100018D10);
    a2();
    result = swift_getWitnessTable(a3, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000A920()
{
  unint64_t result;

  result = qword_100018D48;
  if (!qword_100018D48)
  {
    result = swift_getWitnessTable(&unk_100010DF8, &type metadata for PhotoCollection);
    atomic_store(result, (unint64_t *)&qword_100018D48);
  }
  return result;
}

uint64_t sub_10000A964(void *a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9[2];

  v2 = (uint64_t)objc_msgSend(a1, "count");
  result = (uint64_t)objc_msgSend(a1, "count");
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    result = (uint64_t)objc_msgSend(a1, "count");
    if ((v2 & 0x8000000000000000) == 0 && result >= v2)
    {
      if (v2)
      {
        v4 = sub_1000040EC(&qword_100018D50);
        v5 = (_QWORD *)swift_allocObject(v4, 8 * v2 + 32, 7);
        v6 = j__malloc_size(v5);
        v7 = v6 - 32;
        if (v6 < 32)
          v7 = v6 - 25;
        v5[2] = v2;
        v5[3] = 2 * (v7 >> 3);
        v8 = sub_10000A52C(v9, v5 + 4, v2, a1);

        if (v8 == (_QWORD *)v2)
          return (uint64_t)v5;
        __break(1u);
      }
      return (uint64_t)&_swiftEmptyArrayStorage;
    }
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for PhotoView()
{
  return &type metadata for PhotoView;
}

uint64_t sub_10000AA64(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100011424, 1);
}

uint64_t sub_10000AA74@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t OpaqueTypeConformance2;
  unint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[2];
  __int128 v47;

  v45 = a2;
  v3 = type metadata accessor for AccessibilityChildBehavior(0);
  v43 = *(_QWORD *)(v3 - 8);
  v44 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for PhotoViewInternal(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000040EC(&qword_100018D58);
  __chkstk_darwin(v9);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1000040EC(&qword_100018D60);
  v42 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46[0] = 0;
  v15 = a1;
  v16 = sub_1000040EC(&qword_100018B38);
  State.init(wrappedValue:)(&v47, v46, v16);
  *((_OWORD *)v8 + 1) = v47;
  LODWORD(v46[0]) = 0;
  BYTE4(v46[0]) = 1;
  v17 = sub_1000040EC(&qword_100018D68);
  State.init(wrappedValue:)(&v47, v46, v17);
  v18 = BYTE4(v47);
  v19 = *((_QWORD *)&v47 + 1);
  *((_DWORD *)v8 + 8) = v47;
  v8[36] = v18;
  *((_QWORD *)v8 + 5) = v19;
  *((_QWORD *)v8 + 6) = swift_getKeyPath(&unk_100010EA8);
  v8[56] = 0;
  v20 = &v8[*(int *)(v6 + 36)];
  v21 = &v20[*(int *)(type metadata accessor for RoundedRectangle(0) + 20)];
  v22 = enum case for RoundedCornerStyle.continuous(_:);
  v23 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v21, v22, v23);
  __asm { FMOV            V0.2D, #10.0 }
  *(_OWORD *)v20 = _Q0;
  *(_QWORD *)v8 = v15;
  v8[8] = 0;
  v29 = objc_msgSend(v15, "localIdentifier");
  v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
  v32 = v31;

  sub_10000AE18((uint64_t)v8, (uint64_t)v11);
  v33 = (uint64_t *)&v11[*(int *)(v9 + 52)];
  *v33 = v30;
  v33[1] = v32;
  v34 = sub_10000AE5C((uint64_t)v8);
  static AccessibilityChildBehavior.ignore.getter(v34);
  v35 = sub_10000AE98();
  View.accessibilityElement(children:)(v5, v9, v35);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v5, v44);
  sub_10000AEE4((uint64_t)v11);
  v36 = sub_10000B048(v15);
  v38 = v37;
  *(_QWORD *)&v47 = v36;
  *((_QWORD *)&v47 + 1) = v37;
  v46[0] = v9;
  v46[1] = v35;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v46, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
  v40 = sub_10000AF24();
  View.accessibilityLabel<A>(_:)(&v47, v12, &type metadata for String, OpaqueTypeConformance2, v40);
  swift_bridgeObjectRelease(v38);
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v14, v12);
}

uint64_t sub_10000AD78@<X0>(uint64_t a1@<X8>)
{
  void **v1;

  return sub_10000AA74(*v1, a1);
}

void sub_10000AD80(double *a1@<X8>)
{
  *a1 = EnvironmentValues.displayScale.getter();
}

void sub_10000ADA8(double *a1@<X8>)
{
  *a1 = EnvironmentValues.displayScale.getter();
}

uint64_t sub_10000ADD0(double *a1)
{
  return EnvironmentValues.displayScale.setter(*a1);
}

uint64_t sub_10000ADF4(double *a1)
{
  return EnvironmentValues.displayScale.setter(*a1);
}

uint64_t sub_10000AE18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PhotoViewInternal(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000AE5C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PhotoViewInternal(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000AE98()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018D70;
  if (!qword_100018D70)
  {
    v1 = sub_1000041B0(&qword_100018D58);
    result = swift_getWitnessTable(&protocol conformance descriptor for IDView<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018D70);
  }
  return result;
}

uint64_t sub_10000AEE4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000040EC(&qword_100018D58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000AF24()
{
  unint64_t result;

  result = qword_100018D78;
  if (!qword_100018D78)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100018D78);
  }
  return result;
}

unint64_t sub_10000AF6C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_100018D80;
  if (!qword_100018D80)
  {
    v1 = sub_1000041B0(&qword_100018D88);
    v2[0] = sub_1000041B0(&qword_100018D58);
    v2[1] = sub_10000AE98();
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
    sub_10000B000();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018D80);
  }
  return result;
}

unint64_t sub_10000B000()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018C18;
  if (!qword_100018C18)
  {
    v1 = type metadata accessor for AccessibilityAttachmentModifier(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for AccessibilityAttachmentModifier, v1);
    atomic_store(result, (unint64_t *)&qword_100018C18);
  }
  return result;
}

uint64_t sub_10000B048(void *a1)
{
  Swift::String v2;
  Swift::String v3;
  void *object;
  uint64_t v6;

  v6 = sub_10000B0A4(a1);
  v2._countAndFlagsBits = 8236;
  v2._object = (void *)0xE200000000000000;
  String.append(_:)(v2);
  v3._countAndFlagsBits = sub_10000B1B4(a1);
  object = v3._object;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(object);
  return v6;
}

uint64_t sub_10000B0A4(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  Swift::String v4;
  Swift::String v5;
  unint64_t v6;
  uint64_t countAndFlagsBits;
  unint64_t v9;

  v1 = objc_msgSend(a1, "mediaType");
  if (v1 == (id)2)
  {
    v2 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v9 = 0x8000000100012E40;
    v3 = 1162103126;
  }
  else
  {
    if (v1 != (id)1)
      return 0;
    v2 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v9 = 0x8000000100012E40;
    v3 = 1414482000;
  }
  v4._countAndFlagsBits = v3 & 0xFFFF0000FFFFFFFFLL | 0x4F00000000;
  v4._object = (void *)0xE500000000000000;
  v5._countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  v6 = 0xD00000000000001ELL;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v4, (Swift::String_optional)0, (NSBundle)v2, v5, *(Swift::String *)(&v9 - 1))._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_10000B1B4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  Class isa;
  id v18;
  uint64_t v20;

  v2 = sub_1000040EC(&qword_100018D90);
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v20 - v6;
  v8 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend(a1, "creationDate");
  if (v12)
  {
    v13 = v12;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    v14 = 0;
  }
  else
  {
    v14 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5, v14, 1, v8);
  sub_10000B394((uint64_t)v5, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_10000B3DC((uint64_t)v7);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    if (qword_100018910 != -1)
      swift_once(&qword_100018910, sub_10000B588);
    v16 = (void *)qword_100019A50;
    isa = Date._bridgeToObjectiveC()().super.isa;
    v18 = objc_msgSend(v16, "stringFromDate:", isa);

    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return v15;
}

uint64_t sub_10000B394(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000040EC(&qword_100018D90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B3DC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000040EC(&qword_100018D90);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10000B41C(uint64_t *a1@<X8>)
{
  id *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(*v1, "localIdentifier");
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

Swift::Int sub_10000B470()
{
  void **v0;
  void *v1;
  id v2;
  _QWORD v4[9];

  v1 = *v0;
  Hasher.init(_seed:)(v4, 0);
  v2 = v1;
  NSObject.hash(into:)(v4);

  return Hasher._finalize()();
}

void sub_10000B4BC(uint64_t a1)
{
  id *v1;
  id v3;

  v3 = *v1;
  NSObject.hash(into:)(a1);

}

Swift::Int sub_10000B500(uint64_t a1)
{
  void **v1;
  void *v2;
  id v3;
  _QWORD v5[9];

  v2 = *v1;
  Hasher.init(_seed:)(v5, a1);
  v3 = v2;
  NSObject.hash(into:)(v5);

  return Hasher._finalize()();
}

uint64_t sub_10000B548(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  sub_10000B65C();
  return static NSObject.== infix(_:_:)(v2, v3) & 1;
}

void sub_10000B588()
{
  id v0;
  NSString v1;

  v0 = objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
  v1 = String._bridgeToObjectiveC()();
  objc_msgSend(v0, "setDateFormat:", v1);

  qword_100019A50 = (uint64_t)v0;
}

ValueMetadata *type metadata accessor for Photo()
{
  return &type metadata for Photo;
}

unint64_t sub_10000B60C()
{
  unint64_t result;

  result = qword_100018D98;
  if (!qword_100018D98)
  {
    result = swift_getWitnessTable(&unk_100010EE0, &type metadata for Photo);
    atomic_store(result, (unint64_t *)&qword_100018D98);
  }
  return result;
}

void *sub_10000B650()
{
  return &protocol witness table for String;
}

unint64_t sub_10000B65C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018DA0;
  if (!qword_100018DA0)
  {
    v1 = objc_opt_self(NSObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100018DA0);
  }
  return result;
}

uint64_t sub_10000B698()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for PlayerViewModel()
{
  return objc_opt_self(_TtC15ClarityPhotosUI15PlayerViewModel);
}

void *sub_10000B6DC()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10000B6E8@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = ObservableObject<>.objectWillChange.getter(*v1);
  *a1 = result;
  return result;
}

id (*variable initialization expression of PhotoLibraryView._photoLibrary())()
{
  return sub_10000B728;
}

id sub_10000B728()
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PhotoLibrary(0)), "init");
}

id PhotoLibraryView.body.getter@<X0>(uint64_t a1@<X0>, void *a2@<X1>, __int16 a3@<W2>, _QWORD *a4@<X8>)
{
  uint64_t v8;

  v8 = swift_allocObject(&unk_100015830, 34, 7);
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  *(_BYTE *)(v8 + 32) = a3 & 1;
  *(_BYTE *)(v8 + 33) = HIBYTE(a3) & 1;
  *a4 = sub_10000BCC4;
  a4[1] = v8;
  return sub_10000BCC8(a1, a2, a3 & 1);
}

uint64_t sub_10000B7B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __int16 a4@<W3>, uint64_t a5@<X8>)
{
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t OpaqueTypeConformance2;
  uint64_t v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  int v42;
  int v43;
  double v44;
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
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78[16];
  uint64_t v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  _QWORD v83[3];

  v66 = a1;
  v77 = a5;
  v69 = type metadata accessor for ScrollAnchorRole(0);
  v68 = *(_QWORD *)(v69 - 8);
  __chkstk_darwin(v69);
  v9 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000040EC(&qword_100018E68);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1000040EC(&qword_100018E70);
  v67 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v16 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1000040EC(&qword_100018E78);
  v71 = *(_QWORD *)(v17 - 8);
  v72 = v17;
  __chkstk_darwin(v17);
  v19 = (char *)&v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = sub_1000040EC(&qword_100018E80);
  __chkstk_darwin(v74);
  v70 = (char *)&v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_1000040EC(&qword_100018E88);
  v75 = *(_QWORD *)(v21 - 8);
  v76 = v21;
  v22 = __chkstk_darwin(v21);
  v73 = (char *)&v66 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = a2;
  v80 = a3;
  v81 = a4 & 0x101;
  v82 = v66;
  v24 = static Axis.Set.vertical.getter(v22);
  v25 = sub_1000040EC(&qword_100018E90);
  v26 = sub_1000043D8(&qword_100018E98, &qword_100018E90, (uint64_t)&protocol conformance descriptor for LazyVGrid<A>);
  v27 = ScrollView.init(_:showsIndicators:content:)(v24, 0, sub_10000C778, v78, v25, v26);
  v28 = static UnitPoint.bottom.getter(v27);
  v30 = v29;
  v31 = sub_1000043D8(&qword_100018EA0, &qword_100018E68, (uint64_t)&protocol conformance descriptor for ScrollView<A>);
  View.defaultScrollAnchor(_:)(*(_QWORD *)&v28, v30, 0, v10, v31);
  v32 = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v33 = static UnitPoint.top.getter(v32);
  v35 = v34;
  static ScrollAnchorRole.alignment.getter();
  v83[0] = v10;
  v83[1] = v31;
  v36 = v19;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v83, &opaque type descriptor for <<opaque return type of View.defaultScrollAnchor(_:)>>, 1);
  View.defaultScrollAnchor(_:for:)(*(_QWORD *)&v33, v35, 0, v9, v14, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v9, v69);
  v38 = (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v16, v14);
  v39 = static Edge.Set.leading.getter(v38);
  v40 = static Edge.Set.trailing.getter();
  v41 = Edge.Set.init(rawValue:)(0);
  v42 = Edge.Set.init(rawValue:)(v41);
  if (Edge.Set.init(rawValue:)(v42 & v39) != v39)
    v41 = Edge.Set.init(rawValue:)(v41 | v39);
  v43 = Edge.Set.init(rawValue:)(v41);
  if (Edge.Set.init(rawValue:)(v43 & v40) != v40)
    LOBYTE(v41) = Edge.Set.init(rawValue:)(v41 | v40);
  if (qword_100018918 != -1)
    swift_once(&qword_100018918, sub_10000C488);
  v44 = EdgeInsets.init(_all:)(*(double *)&qword_100018E50);
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v51 = (uint64_t)v70;
  v52 = v71;
  v53 = v72;
  (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v70, v36, v72);
  v54 = v74;
  v55 = v51 + *(int *)(v74 + 36);
  *(_BYTE *)v55 = v41;
  *(double *)(v55 + 8) = v44;
  *(_QWORD *)(v55 + 16) = v46;
  *(_QWORD *)(v55 + 24) = v48;
  *(_QWORD *)(v55 + 32) = v50;
  *(_BYTE *)(v55 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v52 + 8))(v36, v53);
  v56 = LocalizedStringKey.init(stringLiteral:)(0x534F544F4850, 0xE600000000000000);
  v58 = v57;
  LOBYTE(v53) = v59;
  v61 = v60;
  v62 = Image.init(systemName:)(0x69662E6F746F6870, 0xEA00000000006C6CLL);
  v83[0] = v62;
  v63 = sub_10000C7A4();
  v64 = v73;
  View.navigationTitle<A>(_:icon:)(v56, v58, v53 & 1, v61, v83, v54, &type metadata for Image, v63, &protocol witness table for Image);
  swift_release(v62);
  swift_bridgeObjectRelease(v61);
  swift_bridgeObjectRelease(v58);
  sub_10000C880(v51);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v75 + 32))(v77, v64, v76);
}

void sub_10000BCB4(uint64_t a1, void *a2, char a3)
{
  if ((a3 & 1) != 0)

  else
    swift_release(a2);
}

id sub_10000BCC8(uint64_t a1, void *a2, char a3)
{
  if ((a3 & 1) != 0)
    return a2;
  else
    return (id)swift_retain(a2);
}

uint64_t sub_10000BCD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  double v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[16];
  uint64_t v35;
  uint64_t v36;
  __int16 v37;
  int v38;

  v30 = a1;
  v31 = a2;
  v33 = a4;
  v5 = type metadata accessor for PinnedScrollableViews(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for GridItem.Size(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (_OWORD *)((char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = type metadata accessor for GridItem(0);
  __chkstk_darwin(v12);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_1000040EC(&qword_100018E90);
  v29 = *(_QWORD *)(v32 - 8);
  v15 = __chkstk_darwin(v32);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = GeometryProxy.size.getter(v15);
  v19 = 3;
  if (v20 < v18)
    v19 = 4;
  if ((a3 & 0x100) != 0)
    v21 = v19;
  else
    v21 = 2;
  *v11 = xmmword_100010FE0;
  (*(void (**)(_OWORD *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for GridItem.Size.flexible(_:), v8);
  GridItem.init(_:spacing:alignment:)(v11, 0, 1, 0, 0, 1);
  v22 = sub_10000C358((uint64_t)v14, v21);
  v35 = v30;
  v36 = v31;
  v37 = a3 & 0x101;
  v23 = static HorizontalAlignment.center.getter();
  v38 = 0;
  v24 = sub_1000099AC(&qword_100018EB0, (uint64_t (*)(uint64_t))&type metadata accessor for PinnedScrollableViews, (uint64_t)&protocol conformance descriptor for PinnedScrollableViews);
  dispatch thunk of OptionSet.init(rawValue:)(&v38, v5, v24);
  v25 = sub_1000040EC(&qword_100018EB8);
  v26 = sub_10000C8E8();
  LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)(v22, v23, 0, 1, v7, sub_10000C8C0, v34, v25, v26);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v29 + 32))(v33, v17, v32);
}

uint64_t sub_10000BF44(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t KeyPath;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t OpaqueTypeConformance2;
  unint64_t v18;
  _QWORD v20[4];
  uint64_t v21;

  v6 = type metadata accessor for PhotoLibrary(0);
  v7 = sub_1000099AC(&qword_100018EE0, type metadata accessor for PhotoLibrary, (uint64_t)&unk_100011120);
  v8 = (void *)StateObject.wrappedValue.getter(a1, a2, a3 & 1, v6, v7);
  KeyPath = swift_getKeyPath(&unk_100011068);
  v10 = swift_getKeyPath(&unk_100011090);
  static Published.subscript.getter(v20, v8, KeyPath, v10);

  swift_release(KeyPath);
  swift_release(v10);
  v21 = v20[0];
  v11 = sub_1000040EC(&qword_100018EE8);
  v12 = sub_10000A920();
  v13 = sub_1000041B0(&qword_100018EC8);
  v14 = type metadata accessor for PlainButtonStyle(255);
  v15 = sub_1000043D8(&qword_100018ED0, &qword_100018EC8, (uint64_t)&protocol conformance descriptor for NavigationLink<A, B>);
  v16 = sub_1000099AC(&qword_100018ED8, (uint64_t (*)(uint64_t))&type metadata accessor for PlainButtonStyle, (uint64_t)&protocol conformance descriptor for PlainButtonStyle);
  v20[0] = v13;
  v20[1] = v14;
  v20[2] = v15;
  v20[3] = v16;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v20, &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>, 1);
  v18 = sub_10000C9D8();
  return ForEach<>.init(_:content:)(&v21, sub_10000C0F0, 0, &type metadata for PhotoCollection, &type metadata for String, v11, v12, OpaqueTypeConformance2, v18);
}

uint64_t sub_10000C0F0@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t KeyPath;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[2];
  char v26[16];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  char v34;
  uint64_t v35;

  v25[1] = a2;
  v3 = type metadata accessor for PlainButtonStyle(0);
  v25[0] = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000040EC(&qword_100018EC8);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  v35 = 0;
  v11 = v10;
  v12 = sub_1000040EC(&qword_100018B38);
  State.init(wrappedValue:)(&v28, &v35, v12);
  v13 = v28;
  v14 = v29;
  v35 = 0;
  v15 = sub_1000040EC(&qword_100018B48);
  State.init(wrappedValue:)(&v28, &v35, v15);
  v16 = v28;
  v17 = v29;
  KeyPath = swift_getKeyPath(&unk_1000110B0);
  v28 = v11;
  v29 = v13;
  v30 = v14;
  v31 = v16;
  v32 = v17;
  v33 = KeyPath;
  v34 = 0;
  v27 = v11;
  v19 = sub_10000CA30();
  v20 = sub_10000CA74();
  v21 = NavigationLink.init(destination:label:)(&v28, sub_10000CA24, v26, &type metadata for PhotoView, &type metadata for PhotoDetailView, v19, v20);
  PlainButtonStyle.init()(v21);
  v22 = sub_1000043D8(&qword_100018ED0, &qword_100018EC8, (uint64_t)&protocol conformance descriptor for NavigationLink<A, B>);
  v23 = sub_1000099AC(&qword_100018ED8, (uint64_t (*)(uint64_t))&type metadata accessor for PlainButtonStyle, (uint64_t)&protocol conformance descriptor for PlainButtonStyle);
  View.buttonStyle<A>(_:)(v5, v6, v3, v22, v23);
  (*(void (**)(char *, uint64_t))(v25[0] + 8))(v5, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

id (*PhotoLibraryView.init()())()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  objc_msgSend(v0, "userInterfaceIdiom");

  return sub_10000B728;
}

uint64_t sub_10000C358(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  void (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t result;

  if (a2 < 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
    __break(1u);
  }
  else
  {
    if (a2)
    {
      v4 = type metadata accessor for GridItem(0);
      v5 = (char *)static Array._allocateBufferUninitialized(minimumCapacity:)(a2, v4);
      *((_QWORD *)v5 + 2) = a2;
      v6 = *(_QWORD *)(v4 - 8);
      v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      v8 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
      v8(&v5[v7], a1, v4);
      v9 = a2 - 1;
      if (a2 != 1)
      {
        v10 = *(_QWORD *)(v6 + 72);
        v11 = &v5[v10 + v7];
        do
        {
          v8(v11, a1, v4);
          v11 += v10;
          --v9;
        }
        while (v9);
      }
    }
    else
    {
      v5 = (char *)&_swiftEmptyArrayStorage;
    }
    v12 = type metadata accessor for GridItem(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
    return (uint64_t)v5;
  }
  return result;
}

void sub_10000C488()
{
  qword_100018E50 = static ClarityUIMetrics.titleHorizontalPadding.getter();
}

id sub_10000C4A4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  char v5;
  char v6;
  uint64_t v7;

  v3 = *(_QWORD *)v1;
  v4 = *(void **)(v1 + 8);
  v5 = *(_BYTE *)(v1 + 16);
  v6 = *(_BYTE *)(v1 + 17);
  v7 = swift_allocObject(&unk_1000158D8, 34, 7);
  *(_QWORD *)(v7 + 16) = v3;
  *(_QWORD *)(v7 + 24) = v4;
  *(_BYTE *)(v7 + 32) = v5;
  *(_BYTE *)(v7 + 33) = v6;
  *a1 = sub_10000BCC4;
  a1[1] = v7;
  return sub_10000BCC8(v3, v4, v5);
}

uint64_t sub_10000C514(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of PhotoLibraryView.body>>, 1);
}

void destroy for PhotoLibraryView(uint64_t a1)
{
  sub_10000BCB4(*(_QWORD *)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s15ClarityPhotosUI16PhotoLibraryViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  char v6;

  v4 = *(_QWORD *)a2;
  v5 = *(void **)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_10000BCC8(*(_QWORD *)a2, v5, v6);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

uint64_t assignWithCopy for PhotoLibraryView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  char v9;

  v4 = *(_QWORD *)a2;
  v5 = *(void **)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_10000BCC8(*(_QWORD *)a2, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(void **)(a1 + 8);
  v9 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_10000BCB4(v7, v8, v9);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

__n128 initializeWithTake for PhotoLibraryView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PhotoLibraryView(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  void *v6;
  char v7;

  v4 = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)a1;
  v6 = *(void **)(a1 + 8);
  v7 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_10000BCB4(v5, v6, v7);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoLibraryView(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 18))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotoLibraryView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 18) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 18) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotoLibraryView()
{
  return &type metadata for PhotoLibraryView;
}

uint64_t sub_10000C6F8()
{
  return sub_1000043D8(&qword_100018E58, &qword_100018E60, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
}

uint64_t sub_10000C728()
{
  uint64_t v0;

  sub_10000BCB4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_BYTE *)(v0 + 32));
  return swift_deallocObject(v0, 34, 7);
}

uint64_t sub_10000C750@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __int16 v3;

  if (*(_BYTE *)(v2 + 33))
    v3 = 256;
  else
    v3 = 0;
  return sub_10000B7B8(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), v3 | *(unsigned __int8 *)(v2 + 32), a2);
}

uint64_t sub_10000C778@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int16 v2;

  if (*(_BYTE *)(v1 + 33))
    v2 = 256;
  else
    v2 = 0;
  return sub_10000BCD8(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), v2 | *(unsigned __int8 *)(v1 + 32), a1);
}

unint64_t sub_10000C7A4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  uint64_t v5;

  result = qword_100018EA8;
  if (!qword_100018EA8)
  {
    v1 = sub_1000041B0(&qword_100018E80);
    v2 = sub_1000041B0(&qword_100018E70);
    v4 = sub_1000041B0(&qword_100018E68);
    v5 = sub_1000043D8(&qword_100018EA0, &qword_100018E68, (uint64_t)&protocol conformance descriptor for ScrollView<A>);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v4, &opaque type descriptor for <<opaque return type of View.defaultScrollAnchor(_:)>>, 1);
    v4 = v2;
    v5 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2(&v4, &opaque type descriptor for <<opaque return type of View.defaultScrollAnchor(_:for:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018EA8);
  }
  return result;
}

uint64_t sub_10000C880(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000040EC(&qword_100018E80);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000C8C0()
{
  uint64_t v0;

  return sub_10000BF44(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
}

unint64_t sub_10000C8E8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_100018EC0;
  if (!qword_100018EC0)
  {
    v1 = sub_1000041B0(&qword_100018EB8);
    v2[0] = sub_1000041B0(&qword_100018EC8);
    v2[1] = type metadata accessor for PlainButtonStyle(255);
    v2[2] = sub_1000043D8(&qword_100018ED0, &qword_100018EC8, (uint64_t)&protocol conformance descriptor for NavigationLink<A, B>);
    v2[3] = sub_1000099AC(&qword_100018ED8, (uint64_t (*)(uint64_t))&type metadata accessor for PlainButtonStyle, (uint64_t)&protocol conformance descriptor for PlainButtonStyle);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_100018EC0);
  }
  return result;
}

unint64_t sub_10000C9D8()
{
  unint64_t result;

  result = qword_100018EF0;
  if (!qword_100018EF0)
  {
    result = swift_getWitnessTable(&unk_100010F48, &type metadata for Photo);
    atomic_store(result, (unint64_t *)&qword_100018EF0);
  }
  return result;
}

id sub_10000CA24@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 16);
  *a1 = v2;
  return v2;
}

unint64_t sub_10000CA30()
{
  unint64_t result;

  result = qword_100018EF8;
  if (!qword_100018EF8)
  {
    result = swift_getWitnessTable(&unk_100010E54, &type metadata for PhotoView);
    atomic_store(result, (unint64_t *)&qword_100018EF8);
  }
  return result;
}

unint64_t sub_10000CA74()
{
  unint64_t result;

  result = qword_100018F00;
  if (!qword_100018F00)
  {
    result = swift_getWitnessTable("QJ", &type metadata for PhotoDetailView);
    atomic_store(result, (unint64_t *)&qword_100018F00);
  }
  return result;
}

uint64_t sub_10000CAB8()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100011158);
  v2 = swift_getKeyPath(&unk_100011180);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(v2);
  swift_release(KeyPath);
  return v4;
}

char *sub_10000CB28()
{
  char *v0;
  uint64_t v1;
  void *v2;
  char *v3;
  id v4;
  id v5;
  id v6;
  char *v7;
  void *v8;
  char *v9;
  objc_super v11;
  id v12;
  _BYTE v13[24];

  v1 = OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary_photoLibrary;
  v2 = (void *)objc_opt_self(PHPhotoLibrary);
  v3 = v0;
  v4 = objc_msgSend(v2, "sharedPhotoLibrary");
  *(_QWORD *)&v0[v1] = v4;
  v5 = v4;
  v6 = sub_10000E934();

  swift_beginAccess(&v3[OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary__collection], v13, 33, 0);
  v12 = v6;
  Published.init(initialValue:)(&v12, &type metadata for PhotoCollection);
  swift_endAccess(v13);

  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for PhotoLibrary(0);
  v7 = (char *)objc_msgSendSuper2(&v11, "init");
  v8 = *(void **)&v7[OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary_photoLibrary];
  v9 = v7;
  objc_msgSend(v8, "registerChangeObserver:", v9);
  sub_10000F734();

  return v9;
}

id sub_10000CC58()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary_photoLibrary], "unregisterChangeObserver:", v0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotoLibrary(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000CD60()
{
  return type metadata accessor for PhotoLibrary(0);
}

uint64_t type metadata accessor for PhotoLibrary(uint64_t a1)
{
  uint64_t result;

  result = qword_100018FA0;
  if (!qword_100018FA0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PhotoLibrary);
  return result;
}

uint64_t sub_10000CDA4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char **v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  _BYTE v16[24];

  v5 = (char **)(a4 + 16);
  v6 = objc_msgSend(a1, "localIdentifier");
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  v9 = v8;

  swift_beginAccess(v5, v16, 33, 0);
  v10 = *(char **)(a4 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v10);
  *(_QWORD *)(a4 + 16) = v10;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v10 = sub_10000DDAC(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
    *v5 = v10;
  }
  v13 = *((_QWORD *)v10 + 2);
  v12 = *((_QWORD *)v10 + 3);
  if (v13 >= v12 >> 1)
  {
    v10 = sub_10000DDAC((char *)(v12 > 1), v13 + 1, 1, v10);
    *v5 = v10;
  }
  *((_QWORD *)v10 + 2) = v13 + 1;
  v14 = &v10[16 * v13];
  *((_QWORD *)v14 + 4) = v7;
  *((_QWORD *)v14 + 5) = v9;
  return swift_endAccess(v16);
}

void sub_10000CE98(uint64_t a1, void *a2)
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

double sub_10000CF04()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t KeyPath;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double result;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v1 = v0;
  v2 = sub_1000040EC(&qword_100018FB8);
  __chkstk_darwin(v2);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100011158);
  v6 = swift_getKeyPath(&unk_100011180);
  static Published.subscript.getter(&v18, v0, KeyPath, v6);
  swift_release(v6);
  swift_release(KeyPath);
  v7 = v18;
  v8 = sub_1000052D8(0, &qword_100018FC0, PHAsset_ptr);
  v9 = (void *)PHChange.changeDetails<A>(for:)(v7, v8);

  if (v9)
  {
    v11 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v4, 1, 1, v11);
    type metadata accessor for MainActor(0);
    v12 = v9;
    v13 = v1;
    v14 = static MainActor.shared.getter();
    v15 = (_QWORD *)swift_allocObject(&unk_100015948, 48, 7);
    v15[2] = v14;
    v15[3] = &protocol witness table for MainActor;
    v15[4] = v12;
    v15[5] = v13;
    v16 = sub_10000D7E8((uint64_t)v4, (uint64_t)&unk_100018FD0, (uint64_t)v15);

    *(_QWORD *)&result = swift_release(v16).n128_u64[0];
  }
  return result;
}

uint64_t sub_10000D080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5[7] = a4;
  v5[8] = a5;
  v6 = type metadata accessor for IndexSet.Index(0);
  v5[9] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[10] = v7;
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[11] = swift_task_alloc(v8);
  v5[12] = swift_task_alloc(v8);
  v9 = sub_1000040EC(&qword_100018FE8);
  v5[13] = v9;
  v5[14] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for IndexSet(0);
  v5[15] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v5[16] = v11;
  v12 = (*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[17] = swift_task_alloc(v12);
  v5[18] = swift_task_alloc(v12);
  v13 = (*(_QWORD *)(*(_QWORD *)(sub_1000040EC(&qword_100018FF0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[19] = swift_task_alloc(v13);
  v5[20] = swift_task_alloc(v13);
  v5[21] = swift_task_alloc(v13);
  v14 = type metadata accessor for MainActor(0);
  v5[22] = static MainActor.shared.getter();
  v15 = dispatch thunk of Actor.unownedExecutor.getter(v14, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000D1C4, v15, v16);
}

uint64_t sub_10000D1C4()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t KeyPath;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t, uint64_t);
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
  char v53;
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void (*v59)(uint64_t, _QWORD);
  uint64_t *v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t);
  id v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, uint64_t, uint64_t);
  uint64_t v72;

  if (!objc_msgSend(*(id *)(v0 + 56), "hasIncrementalChanges", swift_release(*(_QWORD *)(v0 + 176)).n128_f64[0]))goto LABEL_10;
  v1 = objc_msgSend(*(id *)(v0 + 56), "insertedIndexes");
  v2 = *(_QWORD *)(v0 + 168);
  if (v1)
  {
    v3 = v1;
    v4 = *(_QWORD *)(v0 + 144);
    v5 = *(_QWORD *)(v0 + 120);
    v6 = *(_QWORD *)(v0 + 128);
    static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v2, v4, v5);
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
    v7(v2, 0, 1, v5);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v2, 1, v5) != 1)
    {
      v8 = *(_QWORD *)(v0 + 168);
LABEL_9:
      sub_100005C28(v8, &qword_100018FF0);
LABEL_10:
      if (qword_100018900 != -1)
        swift_once(&qword_100018900, sub_100009E90);
      v16 = type metadata accessor for Logger(0);
      v17 = sub_100004B14(v16, (uint64_t)qword_100019A20);
      v18 = Logger.logObject.getter(v17);
      v19 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Updating photo collection for photo library change.", v20, 2u);
        swift_slowDealloc(v20, -1, -1);
      }
      v21 = *(void **)(v0 + 56);
      v22 = *(void **)(v0 + 64);

      v23 = objc_msgSend(v21, "fetchResultAfterChanges");
      KeyPath = swift_getKeyPath(&unk_100011158);
      v25 = swift_getKeyPath(&unk_100011180);
      *(_QWORD *)(v0 + 48) = v23;
      static Published.subscript.setter(v0 + 48, v22, KeyPath, v25);
      goto LABEL_15;
    }
  }
  else
  {
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 128) + 56);
    v7(*(_QWORD *)(v0 + 168), 1, 1, *(_QWORD *)(v0 + 120));
  }
  v9 = *(void **)(v0 + 56);
  sub_100005C28(*(_QWORD *)(v0 + 168), &qword_100018FF0);
  v10 = objc_msgSend(v9, "removedIndexes");
  v11 = *(_QWORD *)(v0 + 160);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)(v0 + 144);
    v14 = *(_QWORD *)(v0 + 120);
    v15 = *(_QWORD *)(v0 + 128);
    static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v11, v13, v14);
    v7(v11, 0, 1, v14);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v11, 1, v14) != 1)
    {
      v8 = *(_QWORD *)(v0 + 160);
      goto LABEL_9;
    }
  }
  else
  {
    v7(*(_QWORD *)(v0 + 160), 1, 1, *(_QWORD *)(v0 + 120));
  }
  v34 = *(void **)(v0 + 56);
  sub_100005C28(*(_QWORD *)(v0 + 160), &qword_100018FF0);
  v35 = objc_msgSend(v34, "changedIndexes");
  v36 = *(_QWORD *)(v0 + 152);
  if (!v35)
  {
    v7(*(_QWORD *)(v0 + 152), 1, 1, *(_QWORD *)(v0 + 120));
    goto LABEL_24;
  }
  v37 = v35;
  v38 = *(_QWORD *)(v0 + 144);
  v39 = *(_QWORD *)(v0 + 120);
  v40 = *(_QWORD *)(v0 + 128);
  static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();

  v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32);
  v41(v36, v38, v39);
  v7(v36, 0, 1, v39);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v36, 1, v39) == 1)
  {
LABEL_24:
    sub_100005C28(*(_QWORD *)(v0 + 152), &qword_100018FF0);
    goto LABEL_15;
  }
  v70 = *(_QWORD *)(v0 + 128);
  v42 = *(_QWORD *)(v0 + 112);
  v43 = *(_QWORD *)(v0 + 104);
  v44 = *(_QWORD *)(v0 + 80);
  v45 = ((uint64_t (*)(_QWORD, _QWORD, _QWORD))v41)(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 120));
  IndexSet.makeIterator()(v45);
  v46 = v42 + *(int *)(v43 + 36);
  v71 = *(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16);
  v72 = v44;
  while (1)
  {
    v47 = *(_QWORD *)(v0 + 120);
    v49 = *(_QWORD *)(v0 + 88);
    v48 = *(_QWORD *)(v0 + 96);
    v50 = *(_QWORD *)(v0 + 72);
    v71(v48, v46, v50);
    v51 = sub_1000099AC(&qword_100018FF8, (uint64_t (*)(uint64_t))&type metadata accessor for IndexSet, (uint64_t)&protocol conformance descriptor for IndexSet);
    dispatch thunk of Collection.endIndex.getter(v47, v51);
    v52 = sub_1000099AC((unint64_t *)&unk_100019000, (uint64_t (*)(uint64_t))&type metadata accessor for IndexSet.Index, (uint64_t)&protocol conformance descriptor for IndexSet.Index);
    v53 = dispatch thunk of static Equatable.== infix(_:_:)(v48, v49, v50, v52);
    v54 = *(void (**)(uint64_t, uint64_t))(v72 + 8);
    v54(v49, v50);
    v54(v48, v50);
    v55 = *(_QWORD *)(v0 + 112);
    v56 = *(_QWORD *)(v0 + 120);
    if ((v53 & 1) != 0)
      break;
    v57 = *(_QWORD *)(v0 + 144);
    v58 = *(void **)(v0 + 56);
    v59 = (void (*)(uint64_t, _QWORD))dispatch thunk of Collection.subscript.read(v0 + 16, v46, *(_QWORD *)(v0 + 120), v51);
    v61 = *v60;
    v59(v0 + 16, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 16))(v57, v55, v56);
    dispatch thunk of Collection.formIndex(after:)(v46, v56, v51);
    v62 = *(void (**)(uint64_t, uint64_t))(v70 + 8);
    v62(v57, v56);
    v63 = objc_msgSend(v58, "fetchResultBeforeChanges");
    v64 = objc_msgSend(v63, "objectAtIndexedSubscript:", v61);

    v65 = objc_msgSend(v58, "fetchResultAfterChanges");
    v66 = objc_msgSend(v65, "objectAtIndexedSubscript:", v61);

    sub_1000052D8(0, &qword_100018FC0, PHAsset_ptr);
    LOBYTE(v65) = static NSObject.== infix(_:_:)(v64, v66);

    if ((v65 & 1) == 0)
    {
      v67 = *(_QWORD *)(v0 + 136);
      v68 = *(_QWORD *)(v0 + 120);
      sub_100005C28(*(_QWORD *)(v0 + 112), &qword_100018FE8);
      v62(v67, v68);
      goto LABEL_10;
    }
  }
  v69 = *(_QWORD *)(v0 + 136);
  sub_100005C28(*(_QWORD *)(v0 + 112), &qword_100018FE8);
  (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v69, v56);
LABEL_15:
  v26 = *(_QWORD *)(v0 + 160);
  v28 = *(_QWORD *)(v0 + 144);
  v27 = *(_QWORD *)(v0 + 152);
  v29 = *(_QWORD *)(v0 + 136);
  v30 = *(_QWORD *)(v0 + 112);
  v32 = *(_QWORD *)(v0 + 88);
  v31 = *(_QWORD *)(v0 + 96);
  swift_task_dealloc(*(_QWORD *)(v0 + 168));
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000D7E8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_100005C28(a1, &qword_100018FB8);
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
  v16 = swift_allocObject(&unk_100015970, 32, 7);
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
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_100018FE0, v16);
}

void sub_10000D978(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  sub_10000D9F0();
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_updateClassMetadata2(a1, 256, 2, v4, a1 + 80);
  }
}

void sub_10000D9F0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_100018FB0)
  {
    v0 = type metadata accessor for Published(0, &type metadata for PhotoCollection);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_100018FB0);
  }
}

uint64_t sub_10000DA44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = type metadata accessor for PhotoLibrary(0);
  result = ObservableObject<>.objectWillChange.getter(v2);
  *a1 = result;
  return result;
}

uint64_t sub_10000DA80@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100011158);
  v5 = swift_getKeyPath(&unk_100011180);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(v5);
  result = swift_release(KeyPath);
  *a2 = v7;
  return result;
}

uint64_t sub_10000DB00(void **a1, void **a2)
{
  void *v2;
  void *v3;
  uint64_t KeyPath;
  uint64_t v5;
  id v6;
  void *v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100011158);
  v5 = swift_getKeyPath(&unk_100011180);
  v8 = v2;
  v6 = v2;
  return static Published.subscript.setter(&v8, v3, KeyPath, v5);
}

uint64_t sub_10000DB74()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000DBA8(uint64_t a1)
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
  v8 = (_QWORD *)swift_task_alloc(dword_100018FCC);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_10000DC20;
  return sub_10000D080(a1, v4, v5, v7, v6);
}

uint64_t sub_10000DC20()
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

uint64_t sub_10000DC68(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10000DCCC;
  return v6(a1);
}

uint64_t sub_10000DCCC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000DD18()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000DD3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100018FDC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000DC20;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100018FD8 + dword_100018FD8))(a1, v4);
}

char *sub_10000DDAC(char *result, int64_t a2, char a3, char *a4)
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
      v10 = sub_1000040EC(&qword_100019050);
      v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
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
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32])
          memmove(v14, a4 + 32, 16 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000FA74(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000DEB8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;
  _QWORD v22[9];

  v7 = *v3;
  Hasher.init(_seed:)(v22, *(_QWORD *)(*v3 + 40));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v22, a2, a3);
  v8 = Hasher._finalize()();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain(v15);
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease(v7);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v22[0] = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain(a3);
  sub_10000E340(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  v21 = *v3;
  *v3 = v22[0];
  swift_bridgeObjectRelease(v21);
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

void sub_10000E064(uint64_t a1)
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
  int64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
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
  _QWORD *v33;
  _QWORD v34[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_1000040EC(&qword_100019048);
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
    swift_retain(v3);
    v12 = 0;
    while (1)
    {
      if (v9)
      {
        v15 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v16 = v15 | (v12 << 6);
      }
      else
      {
        v17 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return;
        }
        if (v17 >= v10)
          goto LABEL_36;
        v18 = v33[v17];
        ++v12;
        if (!v18)
        {
          v12 = v17 + 1;
          if (v17 + 1 >= v10)
            goto LABEL_36;
          v18 = v33[v12];
          if (!v18)
          {
            v12 = v17 + 2;
            if (v17 + 2 >= v10)
              goto LABEL_36;
            v18 = v33[v12];
            if (!v18)
            {
              v19 = v17 + 3;
              if (v19 >= v10)
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
              v18 = v33[v19];
              if (!v18)
              {
                while (1)
                {
                  v12 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_42;
                  if (v12 >= v10)
                    goto LABEL_36;
                  v18 = v33[v12];
                  ++v19;
                  if (v18)
                    goto LABEL_26;
                }
              }
              v12 = v19;
            }
          }
        }
LABEL_26:
        v9 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v12 << 6);
      }
      v20 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v16);
      v21 = *v20;
      v22 = v20[1];
      Hasher.init(_seed:)(v34, *(_QWORD *)(v6 + 40));
      String.hash(into:)(v34, v21, v22);
      v23 = Hasher._finalize()();
      v24 = -1 << *(_BYTE *)(v6 + 32);
      v25 = v23 & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
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
        v13 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v11 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      v14 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v13);
      *v14 = v21;
      v14[1] = v22;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  swift_release(v3);
  *v2 = v6;
}

void sub_10000E340(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  BOOL v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  _QWORD v27[9];

  v5 = v4;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_10000E064(v11);
  }
  else
  {
    if (v10 > v9)
    {
      sub_10000E4D8();
      goto LABEL_22;
    }
    sub_10000E688(v11);
  }
  v12 = *v4;
  Hasher.init(_seed:)(v27, *(_QWORD *)(*v4 + 40));
  String.hash(into:)(v27, a1, a2);
  v13 = Hasher._finalize()();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a3 = v13 & ~v14;
  v15 = v12 + 56;
  if (((*(_QWORD *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v16 = *(_QWORD *)(v12 + 48);
    v17 = (_QWORD *)(v16 + 16 * a3);
    v18 = *v17 == a1 && v17[1] == a2;
    if (v18 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_21:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }
    else
    {
      v19 = ~v14;
      while (1)
      {
        a3 = (a3 + 1) & v19;
        if (((*(_QWORD *)(v15 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v20 = (_QWORD *)(v16 + 16 * a3);
        v21 = *v20 == a1 && v20[1] == a2;
        if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          goto LABEL_21;
      }
    }
  }
LABEL_22:
  v22 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v23 = (_QWORD *)(*(_QWORD *)(v22 + 48) + 16 * a3);
  *v23 = a1;
  v23[1] = a2;
  v24 = *(_QWORD *)(v22 + 16);
  v25 = __OFADD__(v24, 1);
  v26 = v24 + 1;
  if (v25)
    __break(1u);
  else
    *(_QWORD *)(v22 + 16) = v26;
}

void sub_10000E4D8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
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
  sub_1000040EC(&qword_100019048);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    swift_release(v2);
    *v1 = v4;
    return;
  }
  v5 = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)v5 >= v2 + 56 + 8 * v7)
    memmove(v5, (const void *)(v2 + 56), 8 * v7);
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
    swift_bridgeObjectRetain(v18);
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
}

void sub_10000E688(uint64_t a1)
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
  int64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
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
  uint64_t *v31;
  int64_t v32;
  _QWORD v33[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_1000040EC(&qword_100019048);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    swift_release(v3);
LABEL_38:
    *v2 = v6;
    return;
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
  swift_retain(v3);
  v12 = 0;
  while (1)
  {
    if (v10)
    {
      v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v16 = v15 | (v12 << 6);
      goto LABEL_27;
    }
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v32)
      goto LABEL_36;
    v18 = *(_QWORD *)(v8 + 8 * v17);
    ++v12;
    if (!v18)
    {
      v12 = v17 + 1;
      if (v17 + 1 >= v32)
        goto LABEL_36;
      v18 = *(_QWORD *)(v8 + 8 * v12);
      if (!v18)
      {
        v12 = v17 + 2;
        if (v17 + 2 >= v32)
          goto LABEL_36;
        v18 = *(_QWORD *)(v8 + 8 * v12);
        if (!v18)
          break;
      }
    }
LABEL_26:
    v10 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v12 << 6);
LABEL_27:
    v20 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v21 = *v20;
    v22 = v20[1];
    Hasher.init(_seed:)(v33, *(_QWORD *)(v6 + 40));
    swift_bridgeObjectRetain(v22);
    String.hash(into:)(v33, v21, v22);
    v23 = Hasher._finalize()();
    v24 = -1 << *(_BYTE *)(v6 + 32);
    v25 = v23 & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
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
      v13 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v11 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    v14 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v13);
    *v14 = v21;
    v14[1] = v22;
    ++*(_QWORD *)(v6 + 16);
  }
  v19 = v17 + 3;
  if (v19 >= v32)
  {
LABEL_36:
    swift_release_n(v3, 2);
    v2 = v31;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v8 + 8 * v19);
  if (v18)
  {
    v12 = v19;
    goto LABEL_26;
  }
  while (1)
  {
    v12 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v12 >= v32)
      goto LABEL_36;
    v18 = *(_QWORD *)(v8 + 8 * v12);
    ++v19;
    if (v18)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
}

id sub_10000E934()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_signpost_type_t v13;
  char v14;
  void (*v15)(char *, int64_t, uint64_t);
  uint64_t v16;
  char *v17;
  uint8_t *v18;
  os_signpost_id_t v19;
  uint8_t *v20;
  uint64_t v21;
  void (*v22)(char *, int64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  int64_t v45;
  unint64_t v46;
  int64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v67;
  BOOL v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  void *v73;
  void *v74;
  Class isa;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  os_log_type_t v83;
  uint8_t *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;
  NSString v89;
  id v90;
  uint64_t v91;
  Class v92;
  void *v93;
  id v94;
  id v95;
  uint64_t v96;
  NSObject *v97;
  char *v98;
  uint64_t v99;
  os_signpost_type_t v100;
  uint64_t v101;
  __n128 v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  char *v107;
  uint64_t v108;
  char *v109;
  uint8_t *v110;
  os_signpost_id_t v111;
  char *v112;
  void (*v113)(char *, uint64_t);
  uint64_t v115;
  _QWORD *v116;
  uint64_t v117;
  id v118;
  id v119;
  uint64_t v120;
  void (*v121)(char *, char *, uint64_t);
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void (*v125)(int64_t, uint64_t);
  char *v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  __int128 v131;
  unint64_t v132;
  _QWORD *v133;
  uint64_t v134;
  int64_t v135;
  uint64_t v136;
  uint64_t v137[2];
  void *v138;
  _QWORD aBlock[5];
  uint64_t v140;

  v123 = type metadata accessor for OSSignpostError(0);
  v122 = *(_QWORD *)(v123 - 8);
  __chkstk_darwin(v123);
  v1 = (unint64_t)&v115 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v128 = type metadata accessor for OSSignpostID(0);
  v2 = *(_QWORD *)(v128 - 8);
  v3 = __chkstk_darwin(v128);
  v126 = (char *)&v115 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v3);
  v127 = (char *)&v115 - v6;
  __chkstk_darwin(v5);
  v8 = (int64_t)&v115 - v7;
  if (qword_100018908 != -1)
LABEL_77:
    swift_once(&qword_100018908, sub_100009F10);
  v9 = type metadata accessor for OSSignposter(0);
  v10 = sub_100004B14(v9, (uint64_t)qword_100019A38);
  v11 = static OSSignpostID.exclusive.getter();
  v12 = OSSignposter.logHandle.getter(v11);
  v13 = static os_signpost_type_t.begin.getter();
  v14 = OS_os_log.signpostsEnabled.getter();
  v132 = v1;
  v124 = v10;
  if ((v14 & 1) != 0)
  {
    v15 = *(void (**)(char *, int64_t, uint64_t))(v2 + 16);
    v17 = v127;
    v16 = v128;
    v15(v127, v8, v128);
    v18 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v18 = 0;
    v19 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, v13, v19, "makePhotoCollection", "", v18, 2u);
    v20 = v18;
    v1 = v132;
    swift_slowDealloc(v20, -1, -1);

    v21 = v16;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v17, v16);
    v22 = v15;
  }
  else
  {

    v22 = *(void (**)(char *, int64_t, uint64_t))(v2 + 16);
    v17 = v127;
    v21 = v128;
  }
  v121 = (void (*)(char *, char *, uint64_t))v22;
  v22(v17, v8, v21);
  v23 = type metadata accessor for OSSignpostIntervalState(0);
  swift_allocObject(v23, *(unsigned int *)(v23 + 48), *(unsigned __int16 *)(v23 + 52));
  v24 = OSSignpostIntervalState.init(id:isOpen:)(v17, 1);
  v125 = *(void (**)(int64_t, uint64_t))(v2 + 8);
  v125(v8, v21);
  v25 = objc_msgSend(objc_allocWithZone((Class)PHFetchOptions), "init");
  objc_msgSend(v25, "setIncludeAssetSourceTypes:", 5);
  v26 = sub_1000052D8(0, &qword_100019010, CLFPhotosSettings_ptr);
  v27 = objc_msgSend((id)swift_getObjCClassFromMetadata(v26), "sharedInstance");
  if (!objc_msgSend(v27, "includeSharedAlbums"))
    goto LABEL_67;
  v120 = v24;
  v28 = objc_msgSend(v27, "selectedSharedAlbumCloudIdentifiers");
  v29 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v129 = *(_QWORD *)(v29 + 16);
  if (!v129)
  {
    swift_bridgeObjectRelease(v29);
    v24 = v120;
    goto LABEL_67;
  }
  v118 = v27;
  v30 = (_QWORD *)v29;
  v31 = swift_allocObject(&unk_100015998, 24, 7);
  *(_QWORD *)(v31 + 16) = &_swiftEmptyArrayStorage;
  v32 = (void *)objc_opt_self(PHAssetCollection);
  v2 = 1;
  v119 = v25;
  v33 = objc_msgSend(v32, "fetchAssetCollectionsWithType:subtype:options:", 1, 101, v25);
  aBlock[4] = sub_10000F9F0;
  v140 = v31;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000CE98;
  aBlock[3] = &unk_1000159B0;
  v34 = _Block_copy(aBlock);
  v35 = v140;
  v117 = v31;
  swift_retain(v31);
  objc_msgSend(v33, "enumerateObjectsUsingBlock:", v34, swift_release(v35).n128_f64[0]);
  _Block_release(v34);

  swift_beginAccess(v31 + 16, aBlock, 0, 0);
  v36 = *(_QWORD *)(v31 + 16);
  v37 = swift_bridgeObjectRetain(v36);
  v38 = PHPhotoLibrary.cloudIdentifierMappings(forLocalIdentifiers:)(v37);
  swift_bridgeObjectRelease(v36);
  v8 = 0;
  v40 = *(_QWORD *)(v38 + 64);
  v133 = v30;
  v134 = v38 + 64;
  v41 = 1 << *(_BYTE *)(v38 + 32);
  v138 = &_swiftEmptySetSingleton;
  if (v41 < 64)
    v42 = ~(-1 << v41);
  else
    v42 = -1;
  v1 = v42 & v40;
  v135 = (unint64_t)(v41 + 63) >> 6;
  v136 = v38;
  v116 = v30 + 9;
  *(_QWORD *)&v39 = 136315394;
  v131 = v39;
  v130 = (char *)&type metadata for Any + 8;
  while (v1)
  {
    v43 = __clz(__rbit64(v1));
    v1 &= v1 - 1;
    v44 = v43 | (v8 << 6);
LABEL_28:
    v48 = 16 * v44;
    v49 = (uint64_t *)(*(_QWORD *)(v136 + 48) + v48);
    v50 = *v49;
    v2 = v49[1];
    v51 = *(_QWORD *)(v136 + 56) + v48;
    v52 = *(void **)v51;
    if ((*(_BYTE *)(v51 + 8) & 1) != 0)
    {
      sub_10000FA10(v52, 1);
      sub_10000FA10(v52, 1);
      v53 = qword_100018900;
      swift_bridgeObjectRetain(v2);
      if (v53 != -1)
        swift_once(&qword_100018900, sub_100009E90);
      v54 = type metadata accessor for Logger(0);
      sub_100004B14(v54, (uint64_t)qword_100019A20);
      sub_10000FA10(v52, 1);
      sub_10000FA10(v52, 1);
      v55 = swift_bridgeObjectRetain(v2);
      v56 = Logger.logObject.getter(v55);
      v57 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v56, v57))
      {
        v58 = swift_slowAlloc(22, -1);
        v59 = (uint64_t *)swift_slowAlloc(8, -1);
        v60 = swift_slowAlloc(32, -1);
        v137[0] = v60;
        *(_DWORD *)v58 = v131;
        swift_bridgeObjectRetain(v2);
        *(_QWORD *)(v58 + 4) = sub_100004B84(v50, v2, v137);
        swift_bridgeObjectRelease_n(v2, 3);
        *(_WORD *)(v58 + 12) = 2112;
        swift_errorRetain(v52);
        v61 = _swift_stdlib_bridgeErrorToNSError(v52);
        *(_QWORD *)(v58 + 14) = v61;
        *v59 = v61;
        sub_10000FA1C(v52, 1);
        sub_10000FA1C(v52, 1);
        _os_log_impl((void *)&_mh_execute_header, v56, v57, "Error fetching album cloud identifier for local identifier: %s. Error: %@.", (uint8_t *)v58, 0x16u);
        v62 = sub_1000040EC(&qword_100018BC0);
        swift_arrayDestroy(v59, 1, v62);
        swift_slowDealloc(v59, -1, -1);
        swift_arrayDestroy(v60, 1, v130);
        swift_slowDealloc(v60, -1, -1);
        swift_slowDealloc(v58, -1, -1);

        sub_10000FA1C(v52, 1);
      }
      else
      {
        sub_10000FA1C(v52, 1);
        swift_bridgeObjectRelease_n(v2, 2);
        sub_10000FA1C(v52, 1);
        sub_10000FA1C(v52, 1);

      }
      sub_10000FA1C(v52, 1);
    }
    else
    {
      sub_10000FA10(v52, 0);
      sub_10000FA10(v52, 0);
      swift_bridgeObjectRetain(v2);
      v63 = objc_msgSend(v52, "stringValue");
      v64 = static String._unconditionallyBridgeFromObjectiveC(_:)(v63);
      v66 = v65;

      v67 = v133[4] == v64 && v133[5] == v66;
      if (v67 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        goto LABEL_11;
      if (v129 == 1)
        goto LABEL_39;
      v68 = v133[6] == v64 && v133[7] == v66;
      if (v68 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
LABEL_11:
        swift_bridgeObjectRelease(v66);
        sub_10000DEB8(v137, v50, v2);
        sub_10000FA1C(v52, 0);
        sub_10000FA1C(v52, 0);
        swift_bridgeObjectRelease(v137[1]);
      }
      else
      {
        if (v129 != 2)
        {
          v69 = v116;
          v70 = 2;
          do
          {
            v71 = v70 + 1;
            if (__OFADD__(v70, 1))
              goto LABEL_76;
            v72 = *(v69 - 1) == v64 && *v69 == v66;
            if (v72 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              goto LABEL_11;
            v69 += 2;
            ++v70;
          }
          while (v71 != v129);
        }
LABEL_39:
        swift_bridgeObjectRelease(v66);
        sub_10000FA1C(v52, 0);
        swift_bridgeObjectRelease(v2);
        sub_10000FA1C(v52, 0);
      }
    }
  }
  v45 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  if (v45 >= v135)
  {
    swift_bridgeObjectRelease(v133);
    swift_release(v136);
    v1 = v132;
    goto LABEL_60;
  }
  v46 = *(_QWORD *)(v134 + 8 * v45);
  ++v8;
  v1 = v132;
  if (v46)
    goto LABEL_27;
  v8 = v45 + 1;
  if (v45 + 1 >= v135)
    goto LABEL_59;
  v46 = *(_QWORD *)(v134 + 8 * v8);
  if (v46)
    goto LABEL_27;
  v8 = v45 + 2;
  if (v45 + 2 >= v135)
    goto LABEL_59;
  v46 = *(_QWORD *)(v134 + 8 * v8);
  if (v46)
  {
LABEL_27:
    v1 = (v46 - 1) & v46;
    v44 = __clz(__rbit64(v46)) + (v8 << 6);
    goto LABEL_28;
  }
  v47 = v45 + 3;
  if (v47 < v135)
  {
    v46 = *(_QWORD *)(v134 + 8 * v47);
    if (!v46)
    {
      while (1)
      {
        v8 = v47 + 1;
        if (__OFADD__(v47, 1))
          goto LABEL_75;
        if (v8 >= v135)
          goto LABEL_59;
        v46 = *(_QWORD *)(v134 + 8 * v8);
        ++v47;
        if (v46)
          goto LABEL_27;
      }
    }
    v8 = v47;
    goto LABEL_27;
  }
LABEL_59:
  swift_bridgeObjectRelease(v133);
  swift_release(v136);
LABEL_60:
  v73 = (void *)objc_opt_self(PHObject);
  v74 = v138;
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v74);
  v76 = objc_msgSend(v73, "uuidsFromLocalIdentifiers:", isa);

  v25 = v119;
  if (v76)
  {
    v77 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v76, &type metadata for String, &protocol witness table for String);

    sub_1000052D8(0, &qword_100019028, NSPredicate_ptr);
    v78 = sub_1000040EC(&qword_100019030);
    v79 = swift_allocObject(v78, 72, 7);
    *(_OWORD *)(v79 + 16) = xmmword_1000110F0;
    *(_QWORD *)(v79 + 56) = sub_1000040EC(&qword_100019038);
    *(_QWORD *)(v79 + 64) = sub_10000FA28();
    *(_QWORD *)(v79 + 32) = v77;
    v80 = NSPredicate.init(format:_:)(0xD00000000000002FLL, 0x8000000100012FD0, v79);
    objc_msgSend(v25, "setInternalInclusionPredicate:", v80);
  }
  else
  {
    if (qword_100018900 != -1)
      swift_once(&qword_100018900, sub_100009E90);
    v81 = type metadata accessor for Logger(0);
    v82 = sub_100004B14(v81, (uint64_t)qword_100019A20);
    v80 = Logger.logObject.getter(v82);
    v83 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v80, v83))
    {
      v84 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v84 = 0;
      _os_log_impl((void *)&_mh_execute_header, v80, v83, "Unable to get UUIDs from shared album local identifiers.", v84, 2u);
      swift_slowDealloc(v84, -1, -1);
    }
  }
  swift_release(v117);

  v24 = v120;
  v27 = v118;
LABEL_67:
  v85 = sub_1000040EC(&qword_100019018);
  v86 = swift_allocObject(v85, 40, 7);
  *(_OWORD *)(v86 + 16) = xmmword_100011100;
  v87 = v27;
  v88 = objc_allocWithZone((Class)NSSortDescriptor);
  v89 = String._bridgeToObjectiveC()();
  v90 = objc_msgSend(v88, "initWithKey:ascending:", v89, 1);

  *(_QWORD *)(v86 + 32) = v90;
  v137[0] = v86;
  specialized Array._endMutation()();
  v91 = v137[0];
  sub_1000052D8(0, &qword_100019020, NSSortDescriptor_ptr);
  v92 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v91);
  objc_msgSend(v25, "setSortDescriptors:", v92);

  v93 = (void *)objc_opt_self(PHAsset);
  v94 = v25;
  v95 = objc_msgSend(v93, "fetchAssetsWithOptions:", v94);

  v97 = OSSignposter.logHandle.getter(v96);
  v98 = v126;
  v99 = OSSignpostIntervalState.signpostID.getter();
  v100 = static os_signpost_type_t.end.getter(v99);
  if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
  {
    v101 = swift_retain(v24);
    checkForErrorAndConsumeState(state:)(v101);
    v102 = swift_release(v24);
    v103 = v122;
    v104 = v123;
    v105 = v24;
    if ((*(unsigned int (**)(unint64_t, uint64_t, __n128))(v122 + 88))(v1, v123, v102) == enum case for OSSignpostError.doubleEnd(_:))
    {
      v106 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(unint64_t, uint64_t))(v103 + 8))(v1, v104);
      v106 = "";
    }
    v107 = v127;
    v108 = v128;
    v109 = v126;
    v121(v127, v126, v128);
    v110 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v110 = 0;
    v111 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v97, v100, v111, "makePhotoCollection", v106, v110, 2u);
    swift_slowDealloc(v110, -1, -1);

    v112 = v107;
    v113 = (void (*)(char *, uint64_t))v125;
    v125((int64_t)v109, v108);
    v24 = v105;
    v113(v112, v108);
  }
  else
  {

    v125((int64_t)v98, v128);
  }
  swift_release(v24);
  return v95;
}

void sub_10000F734()
{
  id v0;
  unsigned int v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;

  v0 = objc_msgSend((id)objc_opt_self(AVAudioSession), "sharedInstance");
  v14 = 0;
  v1 = objc_msgSend(v0, "setCategory:mode:options:error:", AVAudioSessionCategoryPlayback, AVAudioSessionModeDefault, 0, &v14);

  if (v1)
  {
    v2 = v14;
  }
  else
  {
    v13 = v14;
    v3 = v14;
    v4 = _convertNSErrorToError(_:)(v13);

    swift_willThrow();
    if (qword_100018900 != -1)
      swift_once(&qword_100018900, sub_100009E90);
    v5 = type metadata accessor for Logger(0);
    sub_100004B14(v5, (uint64_t)qword_100019A20);
    swift_errorRetain(v4);
    v6 = swift_errorRetain(v4);
    v7 = Logger.logObject.getter(v6);
    v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(12, -1);
      v10 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v9 = 138412290;
      swift_errorRetain(v4);
      v11 = (void *)_swift_stdlib_bridgeErrorToNSError(v4);
      v14 = v11;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v9 + 4, v9 + 12);
      *v10 = v11;
      swift_errorRelease(v4);
      swift_errorRelease(v4);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Error setting AVAudioSession playback category. Error: %@.", v9, 0xCu);
      v12 = sub_1000040EC(&qword_100018BC0);
      swift_arrayDestroy(v10, 1, v12);
      swift_slowDealloc(v10, -1, -1);
      swift_slowDealloc(v9, -1, -1);

      swift_errorRelease(v4);
    }
    else
    {
      swift_errorRelease(v4);
      swift_errorRelease(v4);
      swift_errorRelease(v4);

    }
  }
}

uint64_t sub_10000F9CC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000F9F0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_10000CDA4(a1, a2, a3, v3);
}

uint64_t sub_10000F9F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000FA08(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id sub_10000FA10(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    return (id)swift_errorRetain();
  else
    return a1;
}

void sub_10000FA1C(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    swift_errorRelease();
  else

}

unint64_t sub_10000FA28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019040;
  if (!qword_100019040)
  {
    v1 = sub_1000041B0(&qword_100019038);
    result = swift_getWitnessTable(&protocol conformance descriptor for Set<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100019040);
  }
  return result;
}

uint64_t sub_10000FA74(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v10;
  NSBundle v12;
  uint64_t v13;
  uint64_t v15;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      v8 = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  v8 = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v8, *(Swift::String_optional *)&v10, v12, *(Swift::String *)&v13, *(Swift::String *)&v15)._countAndFlagsBits;
}
