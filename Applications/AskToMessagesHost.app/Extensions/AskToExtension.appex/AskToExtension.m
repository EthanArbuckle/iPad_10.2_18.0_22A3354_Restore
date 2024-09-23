uint64_t sub_100002118()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_1000021A0(v0, qword_1000080A0);
  sub_1000021E0(v0, (uint64_t)qword_1000080A0);
  return Logger.init(subsystem:category:)(0x6C7070612E6D6F63, 0xEF6F546B73412E65, 0x7478456F546B7341, 0xEE006E6F69736E65);
}

uint64_t *sub_1000021A0(uint64_t a1, uint64_t *a2)
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

uint64_t sub_1000021E0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

BOOL sub_1000021F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100002210()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100002254()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000227C(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

id sub_1000022CC(uint64_t a1)
{
  return sub_100002A94(a1);
}

uint64_t sub_1000022E0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100002410();
  return AskToExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100002374();
  static AppExtension.main()();
  return 0;
}

unint64_t sub_100002374()
{
  unint64_t result;

  result = qword_100008068;
  if (!qword_100008068)
  {
    result = swift_getWitnessTable(&unk_100003890, &type metadata for Appex);
    atomic_store(result, (unint64_t *)&qword_100008068);
  }
  return result;
}

ValueMetadata *type metadata accessor for Appex()
{
  return &type metadata for Appex;
}

uint64_t sub_1000023CC(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100002410();
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of AskToExtension.configuration>>, 1)+ 8);
}

unint64_t sub_100002410()
{
  unint64_t result;

  result = qword_100008070;
  if (!qword_100008070)
  {
    result = swift_getWitnessTable(&unk_100003860, &type metadata for Appex);
    atomic_store(result, (unint64_t *)&qword_100008070);
  }
  return result;
}

uint64_t sub_100002454(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100002524(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000032CC((uint64_t)v12, *a3);
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
      sub_1000032CC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000032AC(v12);
  return v7;
}

uint64_t sub_100002524(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_1000026DC(a5, a6);
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

uint64_t sub_1000026DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100002770(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100002948(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100002948(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100002770(uint64_t a1, unint64_t a2)
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
      v5 = sub_1000028E4(v4, 0);
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

_QWORD *sub_1000028E4(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000031E8(&qword_100008090);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100002948(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000031E8(&qword_100008090);
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

id sub_100002A94(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSString v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSString v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  NSArray v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _BYTE *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  int v41;
  uint64_t v42;
  uint8_t *v43;
  uint8_t *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t);
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  NSURL *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  NSString v61;
  id v62;
  id result;
  void *v64;
  unint64_t v65;
  _BYTE *v66;
  uint64_t v67;
  uint8_t *v68;
  uint8_t *v69;
  os_log_t v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;

  sub_1000031E8(&qword_100008078);
  ((void (*)(void))__chkstk_darwin)();
  v4 = (char *)&v67 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v76 = (char *)&v67 - v10;
  if (qword_100008060 != -1)
    swift_once(&qword_100008060, sub_100002118);
  v74 = v9;
  v75 = v6;
  v77 = v5;
  v11 = type metadata accessor for Logger(0);
  sub_1000021E0(v11, (uint64_t)qword_1000080A0);
  v12 = ((uint64_t (*)(void))Logger.logObject.getter)();
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Creating Messages payload", v14, 2u);
    swift_slowDealloc(v14, -1, -1);
  }

  v15 = objc_msgSend(objc_allocWithZone((Class)MSMessageTemplateLayout), "init");
  v16 = (void *)ATPayload.question.getter();
  ATQuestion.title.getter();
  v18 = v17;

  v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v18);
  objc_msgSend(v15, "setCaption:", v19);

  v20 = (void *)ATPayload.question.getter();
  ATQuestion.summary.getter();
  v22 = v21;

  v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v22);
  objc_msgSend(v15, "setSubcaption:", v23);

  v24 = objc_msgSend(objc_allocWithZone((Class)MSMessageLiveLayout), "initWithAlternateLayout:", v15);
  if (objc_msgSend(v24, "respondsToSelector:", "setRequiredCapabilities:"))
  {
    v25 = sub_1000031E8(&qword_100008088);
    v26 = swift_allocObject(v25, 48, 7);
    *(_OWORD *)(v26 + 16) = xmmword_100003820;
    strcpy((char *)(v26 + 32), "supports-askto");
    *(_BYTE *)(v26 + 47) = -18;
    v27.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v26);
    objc_msgSend(v24, "setRequiredCapabilities:", v27.super.isa);
  }
  else
  {
    v27.super.isa = (Class)((uint64_t (*)(void))Logger.logObject.getter)();
    v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled((os_log_t)v27.super.isa, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v27.super.isa, v28, "MSMessage does not respond to #selector(setter: MSMessage.requiredCapabilities)!", v29, 2u);
      swift_slowDealloc(v29, -1, -1);
    }
  }

  v30 = (uint64_t)objc_msgSend(objc_allocWithZone((Class)MSSession), "init");
  v31 = objc_msgSend(objc_allocWithZone((Class)MSMessage), "initWithSession:", v30);

  objc_msgSend(v31, "setLayout:", v24);
  static ATURL.create(using:)(a1);
  if (v1)
  {

    return (id)v30;
  }
  v73 = a1;
  v32 = v75;
  v30 = 1;
  v33 = v77;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v75 + 48))(v4, 1, v77) == 1)
  {
    sub_100003228((uint64_t)v4);
    v34 = sub_100003268();
    swift_allocError(&type metadata for AskToExtensionError, v34, 0, 0);
    *v35 = 1;
    swift_willThrow();

    return (id)v30;
  }
  v36 = v76;
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v76, v4, v33);
  v37 = v74;
  v38 = (*(uint64_t (**)(char *, char *, uint64_t))(v32 + 16))(v74, v36, v33);
  v39 = Logger.logObject.getter(v38);
  v40 = static os_log_type_t.default.getter();
  v41 = v40;
  if (os_log_type_enabled(v39, v40))
  {
    v42 = swift_slowAlloc(12, -1);
    v71 = v41;
    v43 = (uint8_t *)v42;
    v72 = swift_slowAlloc(32, -1);
    v80 = v72;
    v69 = v43;
    v70 = v39;
    *(_DWORD *)v43 = 136315138;
    v44 = v43 + 12;
    v68 = v43 + 4;
    v45 = URL.absoluteString.getter();
    v47 = v46;
    v78 = sub_100002454(v45, v46, &v80);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, &v79, v68, v44);
    swift_bridgeObjectRelease(v47);
    v48 = v33;
    v49 = *(void (**)(char *, uint64_t))(v32 + 8);
    v49(v37, v48);
    v50 = v69;
    v39 = v70;
    _os_log_impl((void *)&_mh_execute_header, v70, (os_log_type_t)v71, "Generated AskTo URL: %s", v69, 0xCu);
    v51 = v72;
    swift_arrayDestroy(v72, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v51, -1, -1);
    swift_slowDealloc(v50, -1, -1);
  }
  else
  {
    v52 = v33;
    v49 = *(void (**)(char *, uint64_t))(v32 + 8);
    v49(v37, v52);
  }

  URL._bridgeToObjectiveC()(v53);
  v55 = v54;
  objc_msgSend(v31, "setURL:", v54);

  v56 = (void *)ATPayload.question.getter();
  ATQuestion.notificationText.getter();
  v58 = v57;

  if (!v58)
  {
    v59 = (void *)ATPayload.question.getter();
    ATQuestion.summary.getter();
    v58 = v60;

  }
  v30 = (uint64_t)String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v58);
  objc_msgSend(v31, "setSummaryText:", v30);

  if (!objc_msgSend(v31, "respondsToSelector:", "_pluginPayloadWithAppIconData:appName:allowDataPayloads:"))
  {
    v65 = sub_100003268();
    swift_allocError(&type metadata for AskToExtensionError, v65, 0, 0);
    *v66 = 0;
    swift_willThrow();

    v49(v76, v77);
    return (id)v30;
  }
  v61 = String._bridgeToObjectiveC()();
  v62 = objc_msgSend(v31, "_pluginPayloadWithAppIconData:appName:allowDataPayloads:", 0, v61, 0);

  result = objc_msgSend(v62, "data");
  if (result)
  {
    v64 = result;
    v30 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

    v49(v76, v77);
    return (id)v30;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000031E8(uint64_t *a1)
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

uint64_t sub_100003228(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000031E8(&qword_100008078);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100003268()
{
  unint64_t result;

  result = qword_100008080;
  if (!qword_100008080)
  {
    result = swift_getWitnessTable(&unk_10000394C, &type metadata for AskToExtensionError);
    atomic_store(result, (unint64_t *)&qword_100008080);
  }
  return result;
}

uint64_t sub_1000032AC(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000032CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_BYTE *initializeBufferWithCopyOfBuffer for AskToExtensionError(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AskToExtensionError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AskToExtensionError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000033F8 + 4 * byte_100003845[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10000342C + 4 * byte_100003840[v4]))();
}

uint64_t sub_10000342C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100003434(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000343CLL);
  return result;
}

uint64_t sub_100003448(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100003450);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100003454(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000345C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100003468(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100003470(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AskToExtensionError()
{
  return &type metadata for AskToExtensionError;
}

unint64_t sub_100003490()
{
  unint64_t result;

  result = qword_100008098;
  if (!qword_100008098)
  {
    result = swift_getWitnessTable(&unk_100003924, &type metadata for AskToExtensionError);
    atomic_store(result, (unint64_t *)&qword_100008098);
  }
  return result;
}
