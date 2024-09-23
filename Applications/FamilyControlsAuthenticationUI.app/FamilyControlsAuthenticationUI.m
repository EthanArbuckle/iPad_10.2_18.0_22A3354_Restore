int main(int argc, const char **argv, const char **envp)
{
  int v3;
  char **v4;

  v3 = static CommandLine.argc.getter(*(_QWORD *)&argc, argv, envp);
  v4 = (char **)static CommandLine.unsafeArgv.getter();
  UIApplicationMain(v3, v4, 0, 0);
  return 0;
}

uint64_t sub_1000034D8(uint64_t a1, uint64_t a2)
{
  return sub_100003620(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000034E4(uint64_t a1, id *a2)
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

uint64_t sub_100003558(uint64_t a1, id *a2)
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

uint64_t sub_1000035D4@<X0>(_QWORD *a1@<X8>)
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

uint64_t sub_100003614(uint64_t a1, uint64_t a2)
{
  return sub_100003620(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100003620(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_10000365C(uint64_t a1)
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

Swift::Int sub_10000369C(uint64_t a1)
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

id sub_10000370C()
{
  id *v0;

  return *v0;
}

uint64_t sub_100003714@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_10000371C(_QWORD *a1, uint64_t *a2)
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

uint64_t sub_1000037A4()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(LAErrorDomain);
}

uint64_t sub_1000037B4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003B04((unint64_t *)&qword_100019C98, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_100010200);
  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_1000037F4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003B04((unint64_t *)&qword_100019C98, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_100010200);
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100003834(void *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003B04((unint64_t *)&qword_100019C98, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_100010200);
  return _BridgedStoredNSError.init(_bridgedNSError:)(a1, a2, v4);
}

uint64_t sub_100003898()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_1000038CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003B04((unint64_t *)&qword_100019C98, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_100010200);
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_10000391C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD v7[10];

  v7[9] = *v3;
  Hasher.init(_seed:)(v7, a1);
  dispatch thunk of Hashable.hash(into:)(v7, a2, a3);
  return Hasher._finalize()();
}

_QWORD *sub_100003978@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100003988(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_100003994@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_1000039D8@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void type metadata accessor for LAError(uint64_t a1)
{
  sub_100003EC4(a1, &qword_100019C30, (uint64_t)&unk_1000149F0);
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
  sub_100003EC4(a1, &qword_100019C38, (uint64_t)&unk_100014A18);
}

uint64_t sub_100003A28(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100003B04(&qword_100019CA8, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_100010310);
  v3 = sub_100003B04(&qword_100019CB0, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_100010008);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100003AAC()
{
  return sub_100003B04(&qword_100019C40, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_10000FFCC);
}

uint64_t sub_100003AD8()
{
  return sub_100003B04(&qword_100019C48, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)"1K");
}

uint64_t sub_100003B04(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100003B44(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003B04(&qword_100019C60, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_1000101BC);
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100003B84(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003B04(&qword_100019C60, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_1000101BC);
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100003BC8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003B04((unint64_t *)&qword_100019C98, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_100010200);
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100003C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_100003B04((unint64_t *)&qword_100019C98, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_100010200);
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_100003C60()
{
  return sub_100003B04(&qword_100019C50, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_1000100D4);
}

uint64_t sub_100003C8C()
{
  return sub_100003B04(&qword_100019C58, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_100010100);
}

uint64_t sub_100003CB8()
{
  return sub_100003B04(&qword_100019C60, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_1000101BC);
}

uint64_t sub_100003CE4()
{
  return sub_100003B04(&qword_100019C68, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_100010188);
}

uint64_t sub_100003D10()
{
  return sub_100003B04(&qword_100019C70, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_100010144);
}

uint64_t sub_100003D3C()
{
  return sub_100003B04(&qword_100019C78, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1000102A8);
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_100003EC4(a1, &qword_100019CB8, (uint64_t)&unk_100014A40);
}

uint64_t sub_100003D7C()
{
  return sub_100003B04(&qword_100019C80, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_10001026C);
}

unint64_t sub_100003DAC()
{
  unint64_t result;

  result = qword_100019C88;
  if (!qword_100019C88)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_100019C88);
  }
  return result;
}

uint64_t sub_100003DF0()
{
  return sub_100003B04(&qword_100019C90, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1000102E4);
}

uint64_t sub_100003E1C()
{
  return sub_100003B04((unint64_t *)&qword_100019C98, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_100010200);
}

BOOL sub_100003E48(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100003E5C()
{
  return sub_100003B04(&qword_100019CA0, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_10001003C);
}

void type metadata accessor for CFRunLoopSource(uint64_t a1)
{
  sub_100003EC4(a1, &qword_100019CC0, (uint64_t)&unk_100014A60);
}

void type metadata accessor for CFUserNotification(uint64_t a1)
{
  sub_100003EC4(a1, &qword_100019CC8, (uint64_t)&unk_100014A90);
}

void type metadata accessor for LAPolicy(uint64_t a1)
{
  sub_100003EC4(a1, (unint64_t *)&unk_100019CD0, (uint64_t)&unk_100014AC0);
}

void sub_100003EC4(uint64_t a1, unint64_t *a2, uint64_t a3)
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

BOOL sub_100003F08(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100003F1C()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100003F60()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100003F88(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100003FD4()
{
  uint64_t v0;
  uint64_t result;

  v0 = type metadata accessor for FamilyCircle(0);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  result = FamilyCircle.init()();
  qword_100019D40 = result;
  return result;
}

uint64_t sub_100004010(uint64_t a1, uint64_t a2, void (*a3)(__int128 *), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  void *v25;
  unsigned __int8 v26;
  unint64_t v27;
  _BYTE *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  _BOOL4 v57;
  uint8_t *v58;
  NSObject *v59;
  os_log_t v60;
  _BYTE *v61;
  void (*v62)(_BYTE *, uint64_t);
  unint64_t v63;
  unint64_t v65;
  uint64_t v66;
  _BYTE *v67;
  _BYTE *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  int v74;
  uint8_t *v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  void (*v79)(_BYTE *, uint64_t);
  os_log_t v80;
  uint8_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v95;
  uint64_t v96;
  void (*v97)(__int128 *);
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  _QWORD *v103;
  unint64_t v104;
  uint64_t v105;
  _BYTE *v106;
  void (*v107)(__int128 *);
  unint64_t v108;
  uint64_t v109;
  _BYTE *v110;
  _BYTE v111[4];
  int v112;
  uint64_t v113;
  unint64_t v114;
  os_log_t v115;
  uint64_t (*v116)(_BYTE *, uint64_t);
  NSObject *v117;
  void (*v118)(__int128 *);
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  __int128 v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  _BYTE v126[32];
  __int128 v127;
  __int128 v128;
  void *v129;
  char v130;

  v121 = a4;
  v7 = type metadata accessor for AppleAccount(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = &v111[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v9);
  v13 = &v111[-v12];
  v14 = type metadata accessor for Logger(0);
  v15 = __chkstk_darwin(v14);
  v17 = &v111[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = __chkstk_darwin(v15);
  v20 = &v111[-v19];
  v21 = __chkstk_darwin(v18);
  v24 = &v111[-v23];
  if (!a2)
  {
    if (a1)
    {
      v45 = v22;
      v120 = v21;
      v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(AKAuthenticationAlternateDSIDKey);
      v48 = v47;
      if (*(_QWORD *)(a1 + 16) && (v49 = sub_100006CF4(v46, v47), (v50 & 1) != 0))
      {
        v51 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v49);
        swift_unknownObjectRetain(v51);
        swift_bridgeObjectRelease(v48);
        v125 = v51;
        v52 = sub_100004B1C(&qword_100019D58);
        if ((swift_dynamicCast(&v127, &v125, v52, &type metadata for String, 6) & 1) != 0)
        {
          v53 = *((_QWORD *)&v127 + 1);
          v119 = v127;
          ((void (*)(void))static Logger.authenticationUI.getter)();
          v54 = swift_bridgeObjectRetain_n(v53, 2);
          v55 = Logger.logObject.getter(v54);
          v56 = static os_log_type_t.default.getter();
          v117 = v55;
          LODWORD(v116) = v56;
          v57 = os_log_type_enabled(v55, v56);
          v118 = a3;
          if (v57)
          {
            v58 = (uint8_t *)swift_slowAlloc(12, -1);
            v115 = (os_log_t)swift_slowAlloc(32, -1);
            *(_QWORD *)&v127 = v115;
            *(_DWORD *)v58 = 136446210;
            v113 = (uint64_t)(v58 + 4);
            swift_bridgeObjectRetain(v53);
            v114 = v53;
            v125 = sub_10000E7F0(v119, v53, (uint64_t *)&v127);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v125, v126, v113, v58 + 12);
            swift_bridgeObjectRelease_n(v53, 3);
            v59 = v117;
            _os_log_impl((void *)&_mh_execute_header, v117, (os_log_type_t)v116, "Authenticated account altDSIS: %{public}s", v58, 0xCu);
            v60 = v115;
            swift_arrayDestroy(v115, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v60, -1, -1);
            swift_slowDealloc(v58, -1, -1);

            v61 = v20;
            v62 = *(void (**)(_BYTE *, uint64_t))(v45 + 8);
            v62(v61, v120);
            v63 = v114;
          }
          else
          {

            swift_bridgeObjectRelease_n(v53, 2);
            v68 = v20;
            v62 = *(void (**)(_BYTE *, uint64_t))(v45 + 8);
            v62(v68, v120);
            v63 = v53;
          }
          v69 = sub_100009FB0(0);
          if ((v69 & 1) == 0)
          {
            v84 = v119;
            if (qword_100019AF0 != -1)
              swift_once(&qword_100019AF0, sub_100003FD4);
            v85 = dispatch thunk of FamilyCircle.guardians.getter();
            v86 = v85;
            v87 = *(_QWORD *)(v85 + 16);
            if (!v87)
            {
LABEL_48:
              v129 = 0;
              v127 = 0u;
              v128 = 0u;
              goto LABEL_51;
            }
            v88 = v85 + 32;
            swift_bridgeObjectRetain(v85);
            while (1)
            {
              sub_100004D7C(v88, (uint64_t)&v122);
              v89 = v123;
              v90 = v124;
              sub_100004DC0(&v122, v123);
              v91 = dispatch thunk of FamilyMemberable.altDSID.getter(v89, v90);
              if (v92)
              {
                v93 = v92;
                if (v91 == v84 && v92 == v63)
                {
                  swift_bridgeObjectRelease(v86);
                  v96 = v93;
LABEL_50:
                  swift_bridgeObjectRelease(v96);
                  sub_100004E40(&v122, (uint64_t)&v127);
LABEL_51:
                  swift_bridgeObjectRelease(v86);
                  swift_bridgeObjectRelease(v63);
                  v107 = v118;
                  if (*((_QWORD *)&v128 + 1))
                  {
                    sub_100004E40(&v127, (uint64_t)&v125);
                    sub_100004D7C((uint64_t)&v125, (uint64_t)&v127);
                    v130 = 0;
                    v107(&v127);
                    sub_100004E04((uint64_t)&v127, &qword_100019D50);
                    return sub_100004DE4(&v125);
                  }
                  sub_100004E04((uint64_t)&v127, (uint64_t *)&unk_100019D60);
                  v108 = sub_100004AD8();
                  v109 = swift_allocError(&type metadata for AuthenticationError, v108, 0, 0);
                  *v110 = 2;
                  *(_QWORD *)&v127 = v109;
                  v130 = 1;
                  v107(&v127);
                  return sub_100004E04((uint64_t)&v127, &qword_100019D50);
                }
                v95 = _stringCompareWithSmolCheck(_:_:expecting:)(v91, v92, v84, v63, 0);
                swift_bridgeObjectRelease(v93);
                if ((v95 & 1) != 0)
                {
                  v96 = v86;
                  goto LABEL_50;
                }
              }
              sub_100004DE4(&v122);
              v88 += 40;
              if (!--v87)
              {
                swift_bridgeObjectRelease(v86);
                goto LABEL_48;
              }
            }
          }
          v70 = AppleAccount.init()(v69);
          static Logger.authenticationUI.getter(v70);
          v117 = *(NSObject **)(v8 + 16);
          v71 = ((uint64_t (*)(_BYTE *, _BYTE *, uint64_t))v117)(v11, v13, v7);
          v72 = Logger.logObject.getter(v71);
          v73 = static os_log_type_t.default.getter();
          v74 = v73;
          if (os_log_type_enabled(v72, v73))
          {
            v115 = v72;
            v75 = (uint8_t *)swift_slowAlloc(12, -1);
            v113 = swift_slowAlloc(32, -1);
            *(_QWORD *)&v127 = v113;
            v116 = (uint64_t (*)(_BYTE *, uint64_t))v62;
            v112 = v74;
            *(_DWORD *)v75 = 136446210;
            v76 = ((uint64_t (*)(void))AppleAccount.altDSID.getter)();
            if (v77)
            {
              v78 = v77;
            }
            else
            {
              v76 = 1280070990;
              v78 = 0xE400000000000000;
            }
            v125 = sub_10000E7F0(v76, v78, (uint64_t *)&v127);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v125, v126, v75 + 4, v75 + 12);
            swift_bridgeObjectRelease(v78);
            v79 = *(void (**)(_BYTE *, uint64_t))(v8 + 8);
            v79(v11, v7);
            v80 = v115;
            v81 = v75;
            _os_log_impl((void *)&_mh_execute_header, v115, (os_log_type_t)v112, "Primary account altDSIS: %{public}s", v75, 0xCu);
            v82 = v113;
            swift_arrayDestroy(v113, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v82, -1, -1);
            swift_slowDealloc(v81, -1, -1);

            v83 = v116(v17, v120);
          }
          else
          {
            v79 = *(void (**)(_BYTE *, uint64_t))(v8 + 8);
            v79(v11, v7);

            v83 = ((uint64_t (*)(_BYTE *, uint64_t))v62)(v17, v120);
          }
          v97 = v118;
          v98 = v119;
          v99 = AppleAccount.altDSID.getter(v83);
          if (v100)
          {
            v101 = v100;
            if (v99 == v98 && v100 == v63)
            {
              swift_bridgeObjectRelease(v100);
              swift_bridgeObjectRelease(v63);
LABEL_45:
              *((_QWORD *)&v128 + 1) = v7;
              v129 = &protocol witness table for AppleAccount;
              v103 = sub_100004E58(&v127);
              ((void (*)(_QWORD *, _BYTE *, uint64_t))v117)(v103, v13, v7);
              v130 = 0;
              v97(&v127);
              v79(v13, v7);
              return sub_100004E04((uint64_t)&v127, &qword_100019D50);
            }
            v102 = _stringCompareWithSmolCheck(_:_:expecting:)(v99, v100, v98, v63, 0);
            swift_bridgeObjectRelease(v101);
            swift_bridgeObjectRelease(v63);
            if ((v102 & 1) != 0)
              goto LABEL_45;
          }
          else
          {
            swift_bridgeObjectRelease(v63);
          }
          v104 = sub_100004AD8();
          v105 = swift_allocError(&type metadata for AuthenticationError, v104, 0, 0);
          *v106 = 2;
          *(_QWORD *)&v127 = v105;
          v130 = 1;
          v97(&v127);
          sub_100004E04((uint64_t)&v127, &qword_100019D50);
          return ((uint64_t (*)(_BYTE *, uint64_t))v79)(v13, v7);
        }
      }
      else
      {
        swift_bridgeObjectRelease(v48);
      }
    }
    v65 = sub_100004AD8();
    v66 = swift_allocError(&type metadata for AuthenticationError, v65, 0, 0);
    *v67 = 4;
    *(_QWORD *)&v127 = v66;
    v130 = 1;
    a3(&v127);
    return sub_100004E04((uint64_t)&v127, &qword_100019D50);
  }
  v119 = v22;
  v120 = v21;
  *(_QWORD *)&v122 = a2;
  swift_errorRetain(a2);
  v25 = (void *)_convertErrorToNSError(_:)(a2);
  v26 = objc_msgSend(v25, "ak_isUserCancelError");

  if ((v26 & 1) != 0)
  {
    v27 = sub_100004AD8();
    a2 = swift_allocError(&type metadata for AuthenticationError, v27, 0, 0);
    *v28 = 0;
    swift_errorRelease(v122);
    *(_QWORD *)&v122 = a2;
  }
  swift_errorRetain(a2);
  v29 = (void *)_convertErrorToNSError(_:)(a2);
  swift_errorRelease(a2);
  v30 = objc_msgSend(v29, "ak_isServiceError");

  if (v30)
  {
    v32 = type metadata accessor for FamilyControlsError(0);
    v33 = sub_100004E94();
    v34 = swift_allocError(v32, v33, 0, 0);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v32 - 8) + 104))(v35, enum case for FamilyControlsError.networkError(_:), v32);
    v31 = swift_errorRelease(a2);
    *(_QWORD *)&v122 = v34;
    a2 = v34;
  }
  static Logger.authenticationUI.getter(v31);
  swift_errorRetain(a2);
  v36 = swift_errorRetain(a2);
  v37 = Logger.logObject.getter(v36);
  v38 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc(12, -1);
    v40 = swift_slowAlloc(32, -1);
    *(_QWORD *)&v127 = v40;
    *(_DWORD *)v39 = 136446210;
    v125 = a2;
    swift_errorRetain(a2);
    v41 = sub_100004B1C((uint64_t *)&unk_10001A070);
    v42 = String.init<A>(describing:)(&v125, v41);
    v44 = v43;
    v125 = sub_10000E7F0(v42, v43, (uint64_t *)&v127);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v125, v126, v39 + 4, v39 + 12);
    swift_bridgeObjectRelease(v44);
    swift_errorRelease(a2);
    swift_errorRelease(a2);
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "Authentication failed with error: %{public}s", v39, 0xCu);
    swift_arrayDestroy(v40, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v40, -1, -1);
    swift_slowDealloc(v39, -1, -1);
  }
  else
  {
    swift_errorRelease(a2);
    swift_errorRelease(a2);
  }

  (*(void (**)(_BYTE *, uint64_t))(v119 + 8))(v24, v120);
  swift_beginAccess(&v122, &v125, 0, 0);
  *(_QWORD *)&v127 = v122;
  v130 = 1;
  swift_errorRetain(v122);
  a3(&v127);
  sub_100004E04((uint64_t)&v127, &qword_100019D50);
  return swift_errorRelease(v122);
}

unint64_t sub_100004AD8()
{
  unint64_t result;

  result = qword_100019D48;
  if (!qword_100019D48)
  {
    result = swift_getWitnessTable(&unk_1000104BC, &type metadata for AuthenticationError);
    atomic_store(result, (unint64_t *)&qword_100019D48);
  }
  return result;
}

uint64_t sub_100004B1C(uint64_t *a1)
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

void sub_100004B5C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7)
{
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSString v34;
  _QWORD v35[3];
  uint64_t v36;
  uint64_t v37;

  if (qword_100019AF0 != -1)
    swift_once(&qword_100019AF0, sub_100003FD4);
  dispatch thunk of FamilyCircle.currentMember.getter(v35);
  v14 = v36;
  if (!v36)
  {
    sub_100004E04((uint64_t)v35, (uint64_t *)&unk_100019D60);
    goto LABEL_7;
  }
  v15 = v37;
  sub_100004DC0(v35, v36);
  v16 = dispatch thunk of FamilyMemberable.firstName.getter(v14, v15);
  v18 = v17;
  sub_100004DE4(v35);
  if (!v18)
  {
LABEL_7:
    v28 = sub_10000ABAC(a6, a7);
    v30 = v29;
    v31 = sub_100004B1C(&qword_100019D78);
    v32 = swift_allocObject(v31, 72, 7);
    *(_OWORD *)(v32 + 16) = xmmword_1000103F0;
    *(_QWORD *)(v32 + 56) = &type metadata for String;
    *(_QWORD *)(v32 + 64) = sub_1000052F0();
    *(_QWORD *)(v32 + 32) = a1;
    *(_QWORD *)(v32 + 40) = a2;
    swift_bridgeObjectRetain(a2);
    sub_10000ACA4(v28, v30, v32);
    v26 = v33;
    swift_bridgeObjectRelease(v30);
    v27 = v32;
    goto LABEL_8;
  }
  v19 = sub_10000ABAC(a4, a5);
  v21 = v20;
  v22 = sub_100004B1C(&qword_100019D78);
  v23 = swift_allocObject(v22, 112, 7);
  *(_OWORD *)(v23 + 16) = xmmword_1000103E0;
  *(_QWORD *)(v23 + 56) = &type metadata for String;
  v24 = sub_1000052F0();
  *(_QWORD *)(v23 + 32) = a1;
  *(_QWORD *)(v23 + 40) = a2;
  *(_QWORD *)(v23 + 96) = &type metadata for String;
  *(_QWORD *)(v23 + 104) = v24;
  *(_QWORD *)(v23 + 64) = v24;
  *(_QWORD *)(v23 + 72) = v16;
  *(_QWORD *)(v23 + 80) = v18;
  swift_bridgeObjectRetain(a2);
  sub_10000ACA4(v19, v21, v23);
  v26 = v25;
  swift_bridgeObjectRelease(v21);
  v27 = v23;
LABEL_8:
  swift_bridgeObjectRelease(v27);
  v34 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v26);
  objc_msgSend(a3, "setReason:", v34);

}

uint64_t sub_100004D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *sub_100004DC0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100004DE4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100004E04(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100004B1C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100004E40(__int128 *a1, uint64_t a2)
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

_QWORD *sub_100004E58(_QWORD *a1)
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

unint64_t sub_100004E94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019D70;
  if (!qword_100019D70)
  {
    v1 = type metadata accessor for FamilyControlsError(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for FamilyControlsError, v1);
    atomic_store(result, (unint64_t *)&qword_100019D70);
  }
  return result;
}

void sub_100004EDC(char a1)
{
  id v2;
  id v3;
  id v4;

  type metadata accessor for Logger(0);
  __chkstk_darwin();
  v2 = objc_msgSend(objc_allocWithZone((Class)AKAppleIDAuthenticationInAppContext), "init");
  v3 = objc_allocWithZone((Class)AKAppleIDAuthenticationController);
  v4 = v2;
  if (objc_msgSend(v3, "init"))
    __asm { BR              X10 }
  __break(1u);
  JUMPOUT(0x1000052D8);
}

unint64_t sub_1000052F0()
{
  unint64_t result;

  result = qword_100019D80;
  if (!qword_100019D80)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100019D80);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for AuthenticationError(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AuthenticationError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AuthenticationError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100005420 + 4 * byte_100010405[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_100005454 + 4 * byte_100010400[v4]))();
}

uint64_t sub_100005454(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000545C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100005464);
  return result;
}

uint64_t sub_100005470(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100005478);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_10000547C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100005484(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100005490(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000549C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AuthenticationError()
{
  return &type metadata for AuthenticationError;
}

unint64_t sub_1000054B8()
{
  unint64_t result;

  result = qword_100019D88;
  if (!qword_100019D88)
  {
    result = swift_getWitnessTable(&unk_100010494, &type metadata for AuthenticationError);
    atomic_store(result, (unint64_t *)&qword_100019D88);
  }
  return result;
}

id sub_100005604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v7;
  NSString v12;
  NSString v13;
  NSString v14;
  id v15;
  objc_super v17;

  *(_QWORD *)&v7[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI26ConfirmationViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  if (!a4)
  {
    v13 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    goto LABEL_6;
  }
  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a6);
LABEL_6:
  v17.receiver = v7;
  v17.super_class = (Class)type metadata accessor for ConfirmationViewController();
  v15 = objc_msgSendSuper2(&v17, "initWithTitle:detailText:symbolName:contentLayout:", v12, v13, v14, a7);

  return v15;
}

id sub_1000058BC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfirmationViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ConfirmationViewController()
{
  return objc_opt_self(_TtC30FamilyControlsAuthenticationUI26ConfirmationViewController);
}

id sub_10000591C(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  NSString v26;
  NSString v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  NSString v35;
  id v36;

  v7 = sub_100004B1C(&qword_100019D78);
  v8 = swift_allocObject(v7, 72, 7);
  *(_OWORD *)(v8 + 16) = xmmword_1000103F0;
  *(_QWORD *)(v8 + 56) = &type metadata for String;
  v9 = sub_1000052F0();
  *(_QWORD *)(v8 + 64) = v9;
  *(_QWORD *)(v8 + 32) = a1;
  *(_QWORD *)(v8 + 40) = a2;
  swift_bridgeObjectRetain(a2);
  sub_10000AFF0(0xD00000000000001ALL, 0x8000000100011C10, v8);
  v11 = v10;
  swift_bridgeObjectRelease(v8);
  v12 = a4[3];
  v13 = a4[4];
  sub_100004DC0(a4, v12);
  v14 = dispatch thunk of FamilyMemberable.firstName.getter(v12, v13);
  if (v15)
  {
    v16 = v14;
    v17 = v15;
    v18 = swift_allocObject(v7, 112, 7);
    *(_OWORD *)(v18 + 16) = xmmword_1000103E0;
    *(_QWORD *)(v18 + 56) = &type metadata for String;
    *(_QWORD *)(v18 + 64) = v9;
    *(_QWORD *)(v18 + 32) = a1;
    *(_QWORD *)(v18 + 40) = a2;
    *(_QWORD *)(v18 + 96) = &type metadata for String;
    *(_QWORD *)(v18 + 104) = v9;
    *(_QWORD *)(v18 + 72) = v16;
    *(_QWORD *)(v18 + 80) = v17;
    swift_bridgeObjectRetain(a2);
    v19 = 0xD000000000000023;
    v20 = "CONFIRMATION_APPROVE_MESSAGE_PARENT";
  }
  else
  {
    v18 = swift_allocObject(v7, 72, 7);
    *(_OWORD *)(v18 + 16) = xmmword_1000103F0;
    *(_QWORD *)(v18 + 56) = &type metadata for String;
    *(_QWORD *)(v18 + 64) = v9;
    *(_QWORD *)(v18 + 32) = a1;
    *(_QWORD *)(v18 + 40) = a2;
    swift_bridgeObjectRetain(a2);
    v19 = 0xD00000000000001CLL;
    v20 = "CONFIRMATION_APPROVE_MESSAGE";
  }
  sub_10000ACA4(v19, (unint64_t)(v20 - 32) | 0x8000000000000000, v18);
  v22 = v21;
  swift_bridgeObjectRelease(v18);
  v23 = type metadata accessor for ConfirmationViewController();
  v24 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v23));
  v25 = a3;
  v26 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v22);
  v28 = objc_msgSend(v24, "initWithTitle:detailText:icon:", v26, v27, v25);

  sub_100005C84();
  v29 = swift_allocObject(&unk_100014D58, 24, 7);
  *(_QWORD *)(v29 + 16) = v28;
  v30 = v28;
  v31 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_100005CE4, v29);
  v32 = objc_msgSend((id)objc_opt_self(OBBoldTrayButton), "boldButton");
  sub_10000AFF0(0x445F4E4F4D4D4F43, 0xEB00000000454E4FLL, (uint64_t)&_swiftEmptyArrayStorage);
  v34 = v33;
  v35 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v34);
  objc_msgSend(v32, "setTitle:forState:", v35, 0);

  objc_msgSend(v32, "addAction:forControlEvents:", v31, 64);
  v36 = objc_msgSend(v30, "buttonTray");
  objc_msgSend(v36, "addButton:", v32);

  return v30;
}

unint64_t sub_100005C84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019DC0;
  if (!qword_100019DC0)
  {
    v1 = objc_opt_self(UIAction);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100019DC0);
  }
  return result;
}

uint64_t sub_100005CC0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_100005CE4()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "dismissViewControllerAnimated:completion:", 1, 0);
}

id sub_100005CFC(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  NSString v26;
  NSString v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  NSString v35;
  id v36;

  v7 = sub_100004B1C(&qword_100019D78);
  v8 = swift_allocObject(v7, 72, 7);
  *(_OWORD *)(v8 + 16) = xmmword_1000103F0;
  *(_QWORD *)(v8 + 56) = &type metadata for String;
  v9 = sub_1000052F0();
  *(_QWORD *)(v8 + 64) = v9;
  *(_QWORD *)(v8 + 32) = a1;
  *(_QWORD *)(v8 + 40) = a2;
  swift_bridgeObjectRetain(a2);
  sub_10000AFF0(0xD000000000000017, 0x8000000100011C80, v8);
  v11 = v10;
  swift_bridgeObjectRelease(v8);
  v12 = a4[3];
  v13 = a4[4];
  sub_100004DC0(a4, v12);
  v14 = dispatch thunk of FamilyMemberable.firstName.getter(v12, v13);
  if (v15)
  {
    v16 = v14;
    v17 = v15;
    v18 = swift_allocObject(v7, 112, 7);
    *(_OWORD *)(v18 + 16) = xmmword_1000103E0;
    *(_QWORD *)(v18 + 56) = &type metadata for String;
    *(_QWORD *)(v18 + 64) = v9;
    *(_QWORD *)(v18 + 32) = a1;
    *(_QWORD *)(v18 + 40) = a2;
    *(_QWORD *)(v18 + 96) = &type metadata for String;
    *(_QWORD *)(v18 + 104) = v9;
    *(_QWORD *)(v18 + 72) = v16;
    *(_QWORD *)(v18 + 80) = v17;
    swift_bridgeObjectRetain(a2);
    v19 = 0xD000000000000020;
    v20 = "CONFIRMATION_DENY_MESSAGE_PARENT";
  }
  else
  {
    v18 = swift_allocObject(v7, 72, 7);
    *(_OWORD *)(v18 + 16) = xmmword_1000103F0;
    *(_QWORD *)(v18 + 56) = &type metadata for String;
    *(_QWORD *)(v18 + 64) = v9;
    *(_QWORD *)(v18 + 32) = a1;
    *(_QWORD *)(v18 + 40) = a2;
    swift_bridgeObjectRetain(a2);
    v19 = 0xD000000000000019;
    v20 = "CONFIRMATION_DENY_MESSAGE";
  }
  sub_10000ACA4(v19, (unint64_t)(v20 - 32) | 0x8000000000000000, v18);
  v22 = v21;
  swift_bridgeObjectRelease(v18);
  v23 = type metadata accessor for ConfirmationViewController();
  v24 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v23));
  v25 = a3;
  v26 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v22);
  v28 = objc_msgSend(v24, "initWithTitle:detailText:icon:", v26, v27, v25);

  sub_100005C84();
  v29 = swift_allocObject(&unk_100014D80, 24, 7);
  *(_QWORD *)(v29 + 16) = v28;
  v30 = v28;
  v31 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_100006088, v29);
  v32 = objc_msgSend((id)objc_opt_self(OBBoldTrayButton), "boldButton");
  sub_10000AFF0(0x445F4E4F4D4D4F43, 0xEB00000000454E4FLL, (uint64_t)&_swiftEmptyArrayStorage);
  v34 = v33;
  v35 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v34);
  objc_msgSend(v32, "setTitle:forState:", v35, 0);

  objc_msgSend(v32, "addAction:forControlEvents:", v31, 64);
  v36 = objc_msgSend(v30, "buttonTray");
  objc_msgSend(v36, "addButton:", v32);

  return v30;
}

uint64_t sub_100006064(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

BOOL sub_100006090(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1000060A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  _QWORD aBlock[5];
  uint64_t v8;
  unsigned __int8 v9;

  v9 = 0;
  if (qword_100019AF8 != -1)
    swift_once(&qword_100019AF8, sub_100006AB8);
  v0 = qword_100019DE8;
  v1 = swift_allocObject(&unk_100014F38, 24, 7);
  *(_QWORD *)(v1 + 16) = &v9;
  v2 = swift_allocObject(&unk_100014F60, 32, 7);
  *(_QWORD *)(v2 + 16) = sub_100008120;
  *(_QWORD *)(v2 + 24) = v1;
  aBlock[4] = sub_1000083B0;
  v8 = v2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000B2B4;
  aBlock[3] = &unk_100014F78;
  v3 = _Block_copy(aBlock);
  v4 = v8;
  swift_retain(v2);
  swift_release(v4);
  dispatch_sync(v0, v3);
  _Block_release(v3);
  LOBYTE(v0) = swift_isEscapingClosureAtFileLocation(v2, "", 116, 193, 24, 1);
  result = swift_release(v2);
  if ((v0 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v6 = v9;
    swift_release(v1);
    return v6;
  }
  return result;
}

uint64_t sub_100006200(uint64_t a1, char a2)
{
  return sub_100007FDC(a2);
}

void sub_100006208(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  __CFRunLoopSource *v14;
  char isEscapingClosureAtFileLocation;
  __CFRunLoop *v16;
  _QWORD v17[5];
  uint64_t v18;

  if (qword_100019AF8 != -1)
    swift_once(&qword_100019AF8, sub_100006AB8);
  v8 = qword_100019DE8;
  v9 = (_QWORD *)swift_allocObject(&unk_100014E70, 48, 7);
  v9[2] = a1;
  v9[3] = a2;
  v9[4] = a3;
  v9[5] = a4;
  v10 = swift_allocObject(&unk_100014E98, 32, 7);
  *(_QWORD *)(v10 + 16) = sub_100007FB0;
  *(_QWORD *)(v10 + 24) = v9;
  v17[4] = sub_1000083B0;
  v18 = v10;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_10000B2B4;
  v17[3] = &unk_100014EB0;
  v11 = _Block_copy(v17);
  v12 = v18;
  v13 = a1;
  v14 = a2;
  swift_retain(a4);
  swift_retain(v10);
  swift_release(v12);
  dispatch_sync(v8, v11);
  _Block_release(v11);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v10, "", 116, 200, 24, 1);
  swift_release(v10);
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v16 = CFRunLoopGetMain();
    CFRunLoopAddSource(v16, v14, kCFRunLoopCommonModes);
    swift_release(v9);

  }
}

unint64_t sub_1000063A8(uint64_t a1)
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
  sub_100004B1C(&qword_100019E20);
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
    sub_10000814C(v7, (uint64_t)&v16, &qword_100019E28);
    v8 = v16;
    v9 = v17;
    result = sub_100006CF4(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_100007F3C(&v18, (_OWORD *)(v4[7] + 32 * result));
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

unint64_t sub_1000064DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004B1C(&qword_100019E30);
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
    sub_10000814C(v7, (uint64_t)&v14, &qword_100019E38);
    v8 = v14;
    result = sub_100006D58(v14);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v8;
    result = (unint64_t)sub_100007F3C(&v15, (_OWORD *)(v4[7] + 32 * result));
    v11 = v4[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4[2] = v13;
    v7 += 40;
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

unint64_t sub_100006608(uint64_t a1)
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
  sub_100004B1C(&qword_100019E40);
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
    sub_10000814C(v7, (uint64_t)v16, &qword_100019E48);
    result = sub_100006DD8((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_100007F3C(&v18, (_OWORD *)(v4[7] + 32 * result));
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

uint64_t sub_100006748(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t result;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  unint64_t v13;
  _BYTE *v14;
  _QWORD v15[5];
  uint64_t v16;

  if (qword_100019AF8 != -1)
    swift_once(&qword_100019AF8, sub_100006AB8);
  v4 = qword_100019DE8;
  v5 = swift_allocObject(&unk_100014E20, 32, 7);
  *(_QWORD *)(v5 + 16) = sub_100007120;
  *(_QWORD *)(v5 + 24) = 0;
  v15[4] = sub_100007F5C;
  v16 = v5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_10000B2B4;
  v15[3] = &unk_100014E38;
  v6 = _Block_copy(v15);
  v7 = v16;
  swift_retain(v5);
  swift_release(v7);
  dispatch_sync(v4, v6);
  _Block_release(v6);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation(v5, "", 116, 207, 24, 1);
  result = swift_release(v5);
  if ((v4 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    if (!a1 || a1 == 3)
    {
      v9 = sub_100007EC4();
      v10 = swift_allocError(&type metadata for NotificationError, v9, 0, 0);
      v11 = v10;
      *v12 = 0;
    }
    else
    {
      if (a1 == 1)
        return a2(1, 0);
      v13 = sub_100007EC4();
      v10 = swift_allocError(&type metadata for NotificationError, v13, 0, 0);
      v11 = v10;
      *v14 = 1;
    }
    a2(v10, 1);
    return swift_errorRelease(v11);
  }
  return result;
}

uint64_t sub_100006904(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t result;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  unint64_t v13;
  _BYTE *v14;
  _QWORD v15[5];
  uint64_t v16;

  if (qword_100019AF8 != -1)
    swift_once(&qword_100019AF8, sub_100006AB8);
  v4 = qword_100019DE8;
  v5 = swift_allocObject(&unk_100014EE8, 32, 7);
  *(_QWORD *)(v5 + 16) = sub_100007120;
  *(_QWORD *)(v5 + 24) = 0;
  v15[4] = sub_1000083B0;
  v16 = v5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_10000B2B4;
  v15[3] = &unk_100014F00;
  v6 = _Block_copy(v15);
  v7 = v16;
  swift_retain(v5);
  swift_release(v7);
  dispatch_sync(v4, v6);
  _Block_release(v6);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation(v5, "", 116, 207, 24, 1);
  result = swift_release(v5);
  if ((v4 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    if (a1 == 3)
    {
      v9 = sub_100007EC4();
      v10 = swift_allocError(&type metadata for NotificationError, v9, 0, 0);
      v11 = v10;
      *v12 = 0;
    }
    else
    {
      if (!a1)
        return a2(1, 0);
      v13 = sub_100007EC4();
      v10 = swift_allocError(&type metadata for NotificationError, v13, 0, 0);
      v11 = v10;
      *v14 = 1;
    }
    a2(v10, 1);
    return swift_errorRelease(v11);
  }
  return result;
}

uint64_t sub_100006AB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t result;
  uint64_t v13;
  void *v14;

  v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DispatchQoS(0);
  __chkstk_darwin();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000071E4();
  static DispatchQoS.unspecified.getter();
  v14 = &_swiftEmptyArrayStorage;
  v9 = sub_100007220();
  v10 = sub_100004B1C(&qword_100019E00);
  v11 = sub_100007268();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v14, v10, v11, v4, v9);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000003DLL, 0x8000000100011CF0, v8, v6, v3, 0);
  qword_100019DE8 = result;
  return result;
}

uint64_t sub_100006C48(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v7 = xmmword_100019DC8;
  v9 = qword_100019DD8;
  v8 = qword_100019DE0;
  *(_QWORD *)&xmmword_100019DC8 = a1;
  *((_QWORD *)&xmmword_100019DC8 + 1) = a2;
  qword_100019DD8 = a3;
  qword_100019DE0 = a4;
  sub_1000071B0((void *)v7, *((void **)&v7 + 1), v9, v8);
  v10 = a1;
  v11 = a2;
  return swift_retain(a4);
}

uint64_t sub_100006CA0(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100006CB0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_100006CE4(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

unint64_t sub_100006CF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100006E08(a1, a2, v5);
}

unint64_t sub_100006D58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Int v7;
  _QWORD v9[9];

  v3 = *(_QWORD *)(v1 + 40);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_100006EE8(a1, v7);
}

unint64_t sub_100006DD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10000705C(a1, v4);
}

unint64_t sub_100006E08(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_100006EE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char v22;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2);
      return v5;
    }
    v13 = v11;
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      v15 = ~v4;
      v5 = (v5 + 1) & v15;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
          v9 = v17;
          v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19)
            break;
          v21 = v19;
          v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            v5 = (v5 + 1) & v15;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_10000705C(uint64_t a1, uint64_t a2)
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
      sub_100008190(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_1000081CC((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void *sub_100007120()
{
  uint64_t v0;
  void *v1;
  __CFUserNotification *v2;
  __CFRunLoopSource *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  if ((_QWORD)xmmword_100019DC8)
  {
    v0 = qword_100019DE0;
    v1 = (void *)*((_QWORD *)&xmmword_100019DC8 + 1);
    v2 = (__CFUserNotification *)(id)xmmword_100019DC8;
    v3 = v1;
    swift_retain(v0);
    CFRunLoopSourceInvalidate(v3);
    CFUserNotificationCancel(v2);
    swift_release(v0);

    v4 = (void *)xmmword_100019DC8;
  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)*((_QWORD *)&xmmword_100019DC8 + 1);
  v6 = qword_100019DD8;
  v7 = qword_100019DE0;
  xmmword_100019DC8 = 0u;
  *(_OWORD *)&qword_100019DD8 = 0u;
  return sub_1000071B0(v4, v5, v6, v7);
}

void *sub_1000071B0(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {

    return (void *)swift_release(a4);
  }
  return result;
}

unint64_t sub_1000071E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019DF0;
  if (!qword_100019DF0)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100019DF0);
  }
  return result;
}

unint64_t sub_100007220()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019DF8;
  if (!qword_100019DF8)
  {
    v1 = type metadata accessor for OS_dispatch_queue.Attributes(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue.Attributes, v1);
    atomic_store(result, (unint64_t *)&qword_100019DF8);
  }
  return result;
}

unint64_t sub_100007268()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019E08;
  if (!qword_100019E08)
  {
    v1 = sub_1000072B4(&qword_100019E00);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100019E08);
  }
  return result;
}

uint64_t sub_1000072B4(uint64_t *a1)
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

CFStringRef sub_1000072F8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
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
  const char *v28;
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
  uint64_t inited;
  CFStringRef result;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  Class isa;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v6 = type metadata accessor for AppleAccount(0);
  v52 = *(_QWORD *)(v6 - 8);
  v53 = v6;
  __chkstk_darwin();
  v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain(a2);
  v10 = sub_100009B74(a1, a2, 1);
  v11 = objc_msgSend(v10, "localizedName");

  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v14 = v13;

  v15 = sub_100004B1C(&qword_100019D78);
  v16 = swift_allocObject(v15, 72, 7);
  v54 = xmmword_1000103F0;
  *(_OWORD *)(v16 + 16) = xmmword_1000103F0;
  *(_QWORD *)(v16 + 56) = &type metadata for String;
  v17 = sub_1000052F0();
  *(_QWORD *)(v16 + 64) = v17;
  *(_QWORD *)(v16 + 32) = v12;
  *(_QWORD *)(v16 + 40) = v14;
  swift_bridgeObjectRetain(v14);
  v18 = sub_10000AFF0(0xD00000000000001FLL, 0x8000000100011D30, v16);
  v55 = v19;
  v56 = v18;
  v20 = swift_bridgeObjectRelease(v16);
  if ((a3 & 1) != 0)
  {
    v21 = AppleAccount.init()(v20);
    v22 = AppleAccount.firstName.getter(v21);
    if (v23)
    {
      v24 = v22;
      v25 = v23;
      v26 = swift_allocObject(v15, 112, 7);
      *(_OWORD *)(v26 + 16) = xmmword_1000103E0;
      *(_QWORD *)(v26 + 56) = &type metadata for String;
      *(_QWORD *)(v26 + 64) = v17;
      *(_QWORD *)(v26 + 32) = v12;
      *(_QWORD *)(v26 + 40) = v14;
      *(_QWORD *)(v26 + 96) = &type metadata for String;
      *(_QWORD *)(v26 + 104) = v17;
      *(_QWORD *)(v26 + 72) = v24;
      *(_QWORD *)(v26 + 80) = v25;
      v27 = 0xD000000000000027;
      v28 = "NOTIFICATION_AUTH_REQUEST_MESSAGE_CHILD";
    }
    else
    {
      v26 = swift_allocObject(v15, 72, 7);
      *(_OWORD *)(v26 + 16) = v54;
      *(_QWORD *)(v26 + 56) = &type metadata for String;
      *(_QWORD *)(v26 + 64) = v17;
      v27 = 0xD000000000000021;
      *(_QWORD *)(v26 + 32) = v12;
      *(_QWORD *)(v26 + 40) = v14;
      v28 = "NOTIFICATION_AUTH_REQUEST_MESSAGE";
    }
    v30 = sub_10000AFF0(v27, (unint64_t)(v28 - 32) | 0x8000000000000000, v26);
    v32 = v33;
    swift_bridgeObjectRelease(v26);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v8, v53);
  }
  else
  {
    v29 = swift_allocObject(v15, 72, 7);
    *(_OWORD *)(v29 + 16) = v54;
    *(_QWORD *)(v29 + 56) = &type metadata for String;
    *(_QWORD *)(v29 + 64) = v17;
    *(_QWORD *)(v29 + 32) = v12;
    *(_QWORD *)(v29 + 40) = v14;
    v30 = sub_10000AFF0(0xD00000000000002CLL, 0x8000000100011D50, v29);
    v32 = v31;
    swift_bridgeObjectRelease(v29);
  }
  v34 = sub_10000AFF0(0xD000000000000011, 0x8000000100011D80, (uint64_t)&_swiftEmptyArrayStorage);
  v36 = v35;
  v37 = sub_10000AFF0(0x435F4E4F4D4D4F43, 0xEF45554E49544E4FLL, (uint64_t)&_swiftEmptyArrayStorage);
  v39 = v38;
  v40 = sub_100004B1C(&qword_100019E18);
  inited = swift_initStackObject(v40, &v57);
  *(_OWORD *)(inited + 16) = xmmword_100010580;
  result = kCFUserNotificationAlertHeaderKey;
  if (!kCFUserNotificationAlertHeaderKey)
  {
    __break(1u);
    goto LABEL_15;
  }
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCFUserNotificationAlertHeaderKey);
  *(_QWORD *)(inited + 40) = v43;
  *(_QWORD *)(inited + 72) = &type metadata for String;
  v44 = v55;
  *(_QWORD *)(inited + 48) = v56;
  *(_QWORD *)(inited + 56) = v44;
  result = kCFUserNotificationAlertMessageKey;
  if (!kCFUserNotificationAlertMessageKey)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCFUserNotificationAlertMessageKey);
  *(_QWORD *)(inited + 88) = v45;
  *(_QWORD *)(inited + 120) = &type metadata for String;
  *(_QWORD *)(inited + 96) = v30;
  *(_QWORD *)(inited + 104) = v32;
  result = kCFUserNotificationDefaultButtonTitleKey;
  if (!kCFUserNotificationDefaultButtonTitleKey)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  *(_QWORD *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCFUserNotificationDefaultButtonTitleKey);
  *(_QWORD *)(inited + 136) = v46;
  *(_QWORD *)(inited + 168) = &type metadata for String;
  *(_QWORD *)(inited + 144) = v34;
  *(_QWORD *)(inited + 152) = v36;
  result = kCFUserNotificationAlternateButtonTitleKey;
  if (!kCFUserNotificationAlternateButtonTitleKey)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  *(_QWORD *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCFUserNotificationAlternateButtonTitleKey);
  *(_QWORD *)(inited + 184) = v47;
  *(_QWORD *)(inited + 216) = &type metadata for String;
  *(_QWORD *)(inited + 192) = v37;
  *(_QWORD *)(inited + 200) = v39;
  result = (CFStringRef)SBUserNotificationDontDismissOnUnlock;
  if (!SBUserNotificationDontDismissOnUnlock)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  *(_QWORD *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)(SBUserNotificationDontDismissOnUnlock);
  *(_QWORD *)(inited + 232) = v48;
  *(_QWORD *)(inited + 264) = &type metadata for Bool;
  *(_BYTE *)(inited + 240) = 1;
  result = (CFStringRef)SBUserNotificationWakeDisplay;
  if (SBUserNotificationWakeDisplay)
  {
    *(_QWORD *)(inited + 272) = static String._unconditionallyBridgeFromObjectiveC(_:)(SBUserNotificationWakeDisplay);
    *(_QWORD *)(inited + 280) = v49;
    *(_QWORD *)(inited + 312) = &type metadata for Bool;
    *(_BYTE *)(inited + 288) = 0;
    v50 = sub_1000063A8(inited);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v50);
    return (CFStringRef)isa;
  }
LABEL_19:
  __break(1u);
  return result;
}

CFStringRef sub_10000773C()
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
  uint64_t inited;
  CFStringRef result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  Class isa;
  uint64_t v19;

  v0 = sub_10000AFF0(0xD000000000000021, 0x8000000100011E00, (uint64_t)&_swiftEmptyArrayStorage);
  v2 = v1;
  v3 = sub_10000ACA4(0xD000000000000023, 0x8000000100011E30, (uint64_t)&_swiftEmptyArrayStorage);
  v5 = v4;
  v6 = sub_10000AFF0(0x4F5F4E4F4D4D4F43, 0xE90000000000004BLL, (uint64_t)&_swiftEmptyArrayStorage);
  v8 = v7;
  v9 = sub_100004B1C(&qword_100019E18);
  inited = swift_initStackObject(v9, &v19);
  *(_OWORD *)(inited + 16) = xmmword_100010590;
  result = kCFUserNotificationAlertHeaderKey;
  if (!kCFUserNotificationAlertHeaderKey)
  {
    __break(1u);
    goto LABEL_8;
  }
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCFUserNotificationAlertHeaderKey);
  *(_QWORD *)(inited + 40) = v12;
  *(_QWORD *)(inited + 72) = &type metadata for String;
  *(_QWORD *)(inited + 48) = v0;
  *(_QWORD *)(inited + 56) = v2;
  result = kCFUserNotificationAlertMessageKey;
  if (!kCFUserNotificationAlertMessageKey)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCFUserNotificationAlertMessageKey);
  *(_QWORD *)(inited + 88) = v13;
  *(_QWORD *)(inited + 120) = &type metadata for String;
  *(_QWORD *)(inited + 96) = v3;
  *(_QWORD *)(inited + 104) = v5;
  result = kCFUserNotificationDefaultButtonTitleKey;
  if (!kCFUserNotificationDefaultButtonTitleKey)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  *(_QWORD *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCFUserNotificationDefaultButtonTitleKey);
  *(_QWORD *)(inited + 136) = v14;
  *(_QWORD *)(inited + 168) = &type metadata for String;
  *(_QWORD *)(inited + 144) = v6;
  *(_QWORD *)(inited + 152) = v8;
  result = (CFStringRef)SBUserNotificationDontDismissOnUnlock;
  if (!SBUserNotificationDontDismissOnUnlock)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  *(_QWORD *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)(SBUserNotificationDontDismissOnUnlock);
  *(_QWORD *)(inited + 184) = v15;
  *(_QWORD *)(inited + 216) = &type metadata for Bool;
  *(_BYTE *)(inited + 192) = 1;
  result = (CFStringRef)SBUserNotificationWakeDisplay;
  if (SBUserNotificationWakeDisplay)
  {
    *(_QWORD *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)(SBUserNotificationWakeDisplay);
    *(_QWORD *)(inited + 232) = v16;
    *(_QWORD *)(inited + 264) = &type metadata for Bool;
    *(_BYTE *)(inited + 240) = 0;
    v17 = sub_1000063A8(inited);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v17);
    return (CFStringRef)isa;
  }
LABEL_11:
  __break(1u);
  return result;
}

void sub_100007928(uint64_t a1, uint64_t a2, char a3, void *a4, int a5, uint64_t a6, unint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  unint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  const __CFDictionary *v32;
  const __CFDictionary *v33;
  CFUserNotificationRef v34;
  __CFUserNotification *v35;
  CFRunLoopSourceRef RunLoopSource;
  CFRunLoopSourceRef v37;
  void *v38;
  uint64_t (*v39)(uint64_t);
  uint64_t v40;
  __CFUserNotification *v41;
  __CFRunLoopSource *v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  unint64_t v47;
  uint64_t v48;
  _BYTE *v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  unint64_t v54;
  uint64_t v55;
  _BYTE *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  SInt32 v62;
  SInt32 error;
  char v64[24];

  v14 = type metadata accessor for Logger(0);
  v58 = *(_QWORD *)(v14 - 8);
  v59 = v14;
  v15 = __chkstk_darwin(v14);
  v57 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v19 = (char *)&v57 - v18;
  __chkstk_darwin(v17);
  v21 = (char *)&v57 - v20;
  v22 = swift_allocObject(&unk_100014DA8, 48, 7);
  *(_QWORD *)(v22 + 16) = a4;
  v60 = a5;
  *(_BYTE *)(v22 + 24) = a5;
  v61 = a6;
  *(_QWORD *)(v22 + 32) = a6;
  *(_QWORD *)(v22 + 40) = a7;
  v23 = a4;
  swift_bridgeObjectRetain(a7);
  v24 = sub_1000060A8();
  if ((v24 & 1) != 0)
  {
    v25 = static Logger.authorization.getter(v24);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Already presenting a user notification. Rejecting the new request.", v28, 2u);
      swift_slowDealloc(v28, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v58 + 8))(v21, v59);
    v29 = sub_100007EC4();
    v30 = swift_allocError(&type metadata for NotificationError, v29, 0, 0);
    *v31 = 0;
    sub_10000D2F8(v30, 1, (uint64_t)v23, v60, v61, a7);
    swift_errorRelease(v30);
    swift_release(v22);
  }
  else
  {
    if (a3)
    {
      if (a3 == 1)
        v32 = (const __CFDictionary *)sub_1000072F8(a1, a2, 0);
      else
        v32 = (const __CFDictionary *)sub_10000773C();
    }
    else
    {
      v32 = (const __CFDictionary *)sub_1000072F8(a1, a2, 1);
    }
    v33 = v32;
    error = 0;
    v34 = CFUserNotificationCreate(0, 0.0, 0, &error, v32);
    if (v34)
    {
      v35 = v34;
      RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v35, (CFUserNotificationCallBack)sub_100006200, 0);
      if (RunLoopSource)
      {
        v37 = RunLoopSource;
        if ((a3 & 0xFE) != 0)
          v38 = &unk_100014DD0;
        else
          v38 = &unk_100014DF8;
        if ((a3 & 0xFE) != 0)
          v39 = sub_100007F2C;
        else
          v39 = sub_100007F34;
        v40 = swift_allocObject(v38, 32, 7);
        *(_QWORD *)(v40 + 16) = sub_100007EB0;
        *(_QWORD *)(v40 + 24) = v22;
        v41 = v35;
        v42 = v37;
        swift_retain(v22);
        swift_retain(v40);
        sub_100006208(v41, v42, (uint64_t)v39, v40);
        swift_release(v22);

        swift_release_n(v40, 2);
      }
      else
      {
        v50 = static Logger.authorization.getter(0);
        v51 = Logger.logObject.getter(v50);
        v52 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v51, v52))
        {
          v53 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v53 = 0;
          _os_log_impl((void *)&_mh_execute_header, v51, v52, "Failed to create run loop source", v53, 2u);
          swift_slowDealloc(v53, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v58 + 8))(v57, v59);
        v54 = sub_100007EC4();
        v55 = swift_allocError(&type metadata for NotificationError, v54, 0, 0);
        *v56 = 1;
        sub_10000D2F8(v55, 1, (uint64_t)v23, v60, v61, a7);
        swift_errorRelease(v55);
        swift_release(v22);

      }
    }
    else
    {
      v43 = static Logger.authorization.getter(0);
      v44 = Logger.logObject.getter(v43);
      v45 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v44, v45))
      {
        v46 = (uint8_t *)swift_slowAlloc(8, -1);
        *(_DWORD *)v46 = 67109120;
        swift_beginAccess(&error, v64, 0, 0);
        v62 = error;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &error, v46 + 4, v46 + 8);
        _os_log_impl((void *)&_mh_execute_header, v44, v45, "Failed to create user notification. ErrorCode: %d", v46, 8u);
        swift_slowDealloc(v46, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v58 + 8))(v19, v59);
      v47 = sub_100007EC4();
      v48 = swift_allocError(&type metadata for NotificationError, v47, 0, 0);
      *v49 = 1;
      sub_10000D2F8(v48, 1, (uint64_t)v23, v60, v61, a7);
      swift_errorRelease(v48);
      swift_release(v22);

    }
  }
}

uint64_t sub_100007E84()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

void sub_100007EB0(uint64_t a1, char a2)
{
  uint64_t v2;

  sub_10000D2F8(a1, a2 & 1, *(_QWORD *)(v2 + 16), *(_BYTE *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40));
}

unint64_t sub_100007EC4()
{
  unint64_t result;

  result = qword_100019E10;
  if (!qword_100019E10)
  {
    result = swift_getWitnessTable(&unk_10001068C, &type metadata for NotificationError);
    atomic_store(result, (unint64_t *)&qword_100019E10);
  }
  return result;
}

uint64_t sub_100007F08()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007F2C(uint64_t a1)
{
  uint64_t v1;

  return sub_100006904(a1, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16));
}

uint64_t sub_100007F34(uint64_t a1)
{
  uint64_t v1;

  return sub_100006748(a1, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16));
}

_OWORD *sub_100007F3C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100007F4C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007F5C()
{
  uint64_t v0;

  return sub_10000B294(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100007F64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100007F74(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100007F7C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100007FB0()
{
  uint64_t v0;

  return sub_100006C48(*(void **)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_100007FBC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007FCC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007FDC(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(_QWORD);
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin();
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((_QWORD)xmmword_100019DC8)
  {
    v8 = (void (*)(_QWORD))qword_100019DD8;
    v7 = qword_100019DE0;
    swift_retain(qword_100019DE0);
    v8(a1 & 3);
    return swift_release(v7);
  }
  else
  {
    v10 = static Logger.authorization.getter(v4);
    v11 = Logger.logObject.getter(v10);
    v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "No response handler provided for the presented notification, ignoring the response.", v13, 2u);
      swift_slowDealloc(v13, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
}

uint64_t sub_100008110()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_100008120()
{
  uint64_t v0;

  **(_BYTE **)(v0 + 16) = (_QWORD)xmmword_100019DC8 != 0;
}

uint64_t sub_10000813C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000814C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100004B1C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100008190(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1000081CC(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t getEnumTagSinglePayload for NotificationError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for NotificationError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000082DC + 4 * byte_1000105A5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100008310 + 4 * byte_1000105A0[v4]))();
}

uint64_t sub_100008310(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100008318(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100008320);
  return result;
}

uint64_t sub_10000832C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100008334);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100008338(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100008340(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_10000834C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NotificationError()
{
  return &type metadata for NotificationError;
}

unint64_t sub_10000836C()
{
  unint64_t result;

  result = qword_100019E50;
  if (!qword_100019E50)
  {
    result = swift_getWitnessTable(&unk_100010664, &type metadata for NotificationError);
    atomic_store(result, (unint64_t *)&qword_100019E50);
  }
  return result;
}

UIImage *sub_1000083D0(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIImage *v23;
  UIImage *v24;
  double v25;
  double v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  CGSize v38;

  v2 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(v2, "traitCollection");
  objc_msgSend(v8, "displayScale");
  v10 = v9;

  objc_msgSend(v2, "size");
  v12 = v11 + v11;
  objc_msgSend(v2, "size");
  v38.width = v12;
  UIGraphicsBeginImageContextWithOptions(v38, 0, v10);
  objc_msgSend(v2, "size");
  v14 = v13 + -40.0;
  objc_msgSend(v2, "size");
  v16 = v15;
  objc_msgSend(v2, "size");
  v18 = v17;
  objc_msgSend(v2, "size");
  v20 = v19;
  objc_msgSend(v2, "size");
  v22 = v21;
  objc_msgSend(v2, "drawInRect:", v14, 0.0, v16, v18);
  objc_msgSend(a1, "drawInRect:blendMode:alpha:", 0, 0.0, 0.0, v20, v22, 1.0);
  v23 = UIGraphicsGetImageFromCurrentImageContext();
  if (v23)
  {
    v24 = v23;
    UIGraphicsEndImageContext();
  }
  else
  {
    objc_msgSend(v2, "size");
    v27 = objc_msgSend(objc_allocWithZone((Class)ISImageDescriptor), "initWithSize:scale:", v25, v26, v10);
    v28 = objc_msgSend((id)objc_opt_self(ISIcon), "genericApplicationIcon");
    v29 = objc_msgSend(v28, "prepareImageForDescriptor:", v27);

    if (v29)
    {
      v30 = objc_msgSend(v29, "CGImage");

      if (v30)
      {
        v31 = objc_msgSend(objc_allocWithZone((Class)UIImage), "initWithCGImage:", v30);

        return (UIImage *)v31;
      }
    }
    v33 = static Logger.authenticationUI.getter();
    v34 = Logger.logObject.getter(v33);
    v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Failed to resolve merged icons and generic icon", v36, 2u);
      swift_slowDealloc(v36, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v24 = (UIImage *)objc_msgSend(objc_allocWithZone((Class)UIImage), "init");

  }
  return v24;
}

uint64_t sub_1000086F8(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  NSURL *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  Class isa;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  sub_100004B1C(&qword_100019E90);
  __chkstk_darwin();
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.init(string:)(0xD000000000000028, 0x8000000100012030);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100009A3C((uint64_t)v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    v9 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    URL._bridgeToObjectiveC()(v10);
    v12 = v11;
    v13 = sub_1000064DC((uint64_t)&_swiftEmptyArrayStorage);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_100003B04(&qword_100019CA8, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_100010310);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v13);
    objc_msgSend(v9, "openURL:options:completionHandler:", v12, isa, 0);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  v15 = type metadata accessor for FamilyControlsError(0);
  v16 = sub_100003B04((unint64_t *)&qword_100019D70, (uint64_t (*)(uint64_t))&type metadata accessor for FamilyControlsError, (uint64_t)&protocol conformance descriptor for FamilyControlsError);
  v17 = swift_allocError(v15, v16, 0, 0);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v18, enum case for FamilyControlsError.authorizationCanceled(_:), v15);
  a2(v17);
  return swift_errorRelease(v17);
}

void sub_100008940(char a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSString v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString v22;
  id v23;

  v4 = v3;
  sub_100009980(0, (unint64_t *)&qword_100019DC0, UIAction_ptr);
  v8 = swift_allocObject(&unk_100015140, 32, 7);
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  swift_retain(a3);
  v9 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_100009A7C, v8);
  v10 = objc_msgSend((id)objc_opt_self(OBBoldTrayButton), "boldButton");
  if ((a1 & 1) != 0)
  {
    sub_10000AFF0(0xD000000000000016, 0x80000001000120A0, (uint64_t)&_swiftEmptyArrayStorage);
    v12 = v11;
    v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v12);
    objc_msgSend(v10, "setTitle:forState:", v13, 0);
  }
  else
  {
    v13 = objc_msgSend(objc_allocWithZone((Class)LAContext), "init");
    if (objc_msgSend(v13, "canEvaluatePolicy:error:", 1, 0))
    {
      v14 = objc_msgSend(v13, "biometryType");
      v15 = 0xE500000000000000;
      v16 = 0x574F4C4C41;
      if (v14 == (id)2)
      {
        v16 = 0x5F575F574F4C4C41;
        v15 = 0xEF44495F45434146;
      }
      v17 = v14 == (id)1;
      if (v14 == (id)1)
        v18 = 0xD000000000000010;
      else
        v18 = v16;
      if (v17)
        v19 = 0x8000000100012080;
      else
        v19 = v15;
    }
    else
    {
      v18 = 0xD000000000000017;
      v19 = 0x8000000100012060;
    }
    sub_10000AFF0(v18, v19, (uint64_t)&_swiftEmptyArrayStorage);
    v21 = v20;
    swift_bridgeObjectRelease(v19);
    v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v21);
    objc_msgSend(v10, "setTitle:forState:", v22, 0);

  }
  objc_msgSend(v10, "addAction:forControlEvents:", v9, 64);
  v23 = objc_msgSend(v4, "buttonTray");
  objc_msgSend(v23, "addButton:", v10);

}

void sub_100008BE4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  uint64_t v11;

  v7 = swift_allocObject(&unk_1000150F0, 32, 7);
  *(_QWORD *)(v7 + 16) = a3;
  *(_QWORD *)(v7 + 24) = a4;
  v10[4] = sub_100009A1C;
  v11 = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100008D3C;
  v10[3] = &unk_100015108;
  v8 = _Block_copy(v10);
  v9 = v11;
  swift_retain(a4);
  swift_release(v9);
  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, v8);
  _Block_release(v8);
}

uint64_t sub_100008CA8(void (*a1)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = type metadata accessor for FamilyControlsError(0);
  v3 = sub_100003B04((unint64_t *)&qword_100019D70, (uint64_t (*)(uint64_t))&type metadata accessor for FamilyControlsError, (uint64_t)&protocol conformance descriptor for FamilyControlsError);
  v4 = swift_allocError(v2, v3, 0, 0);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v5, enum case for FamilyControlsError.authorizationCanceled(_:), v2);
  a1(v4);
  return swift_errorRelease(v4);
}

uint64_t sub_100008D3C(uint64_t a1)
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

uint64_t sub_100008D68(char a1)
{
  char *v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for InformationalViewController();
  objc_msgSendSuper2(&v12, "viewDidDisappear:", a1 & 1);
  result = swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI27InformationalViewController_delegate]);
  if (result)
  {
    v4 = result;
    v5 = OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationNavigationController;
    if ((objc_msgSend(*(id *)(result+ OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationNavigationController), "isMovingFromParentViewController") & 1) == 0)
    {
      if (objc_msgSend(*(id *)(v4 + v5), "isBeingDismissed"))
      {
        v6 = type metadata accessor for FamilyControlsError(0);
        v7 = sub_100003B04((unint64_t *)&qword_100019D70, (uint64_t (*)(uint64_t))&type metadata accessor for FamilyControlsError, (uint64_t)&protocol conformance descriptor for FamilyControlsError);
        v8 = swift_allocError(v6, v7, 0, 0);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v9, enum case for FamilyControlsError.authorizationCanceled(_:), v6);
        v10 = (void *)sub_10000CC6C();
        v11 = (void *)_convertErrorToNSError(_:)(v8);
        objc_msgSend(v10, "didCompleteAuthenticationRequestWithStatus:error:", 0, v11);
        swift_unknownObjectRelease(v10);

        swift_errorRelease(v8);
        sub_10000CAC4();
      }
    }
    return swift_unknownObjectRelease(v4);
  }
  return result;
}

id sub_100008EE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v7;
  NSString v12;
  NSString v13;
  NSString v14;
  id v15;
  objc_super v17;

  *(_QWORD *)&v7[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI27InformationalViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  if (!a4)
  {
    v13 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    goto LABEL_6;
  }
  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a6);
LABEL_6:
  v17.receiver = v7;
  v17.super_class = (Class)type metadata accessor for InformationalViewController();
  v15 = objc_msgSendSuper2(&v17, "initWithTitle:detailText:symbolName:contentLayout:", v12, v13, v14, a7);

  return v15;
}

id sub_10000919C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InformationalViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for InformationalViewController()
{
  return objc_opt_self(_TtC30FamilyControlsAuthenticationUI27InformationalViewController);
}

id sub_1000091FC(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
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
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  Swift::String v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  Swift::String v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  Swift::String v52;
  void *object;
  void *v54;
  Swift::String v55;
  UIImage *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  UIImage *v60;
  NSString v61;
  NSString v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  NSString v71;
  id v72;
  _QWORD *v73;
  id v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  NSString v79;
  id v80;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  Class isa;
  uint64_t v87;
  int v88;
  uint64_t v89;
  Swift::String v90;
  uint64_t v91;
  uint64_t v92;

  v89 = a5;
  v11 = (objc_class *)type metadata accessor for AppleAccount(0);
  v12 = *((_QWORD *)v11 - 1);
  __chkstk_darwin();
  v14 = (char *)&v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_10000AFF0(0xD00000000000001ELL, 0x8000000100011EB0, (uint64_t)&_swiftEmptyArrayStorage);
  v87 = v15;
  v17 = v16;
  v88 = a1;
  if ((a1 & 1) != 0)
  {
    v85 = v12;
    isa = v11;
    v18 = AppleAccount.init()(v15);
    v19 = AppleAccount.firstName.getter(v18);
    if (v20)
    {
      v21 = v19;
      v22 = v20;
      v23 = sub_100004B1C(&qword_100019D78);
      v83 = v17;
      v24 = v23;
      v25 = swift_allocObject(v23, 152, 7);
      *(_OWORD *)(v25 + 16) = xmmword_1000106D0;
      *(_QWORD *)(v25 + 56) = &type metadata for String;
      v26 = sub_1000052F0();
      v84 = a4;
      v27 = v26;
      *(_QWORD *)(v25 + 32) = a2;
      *(_QWORD *)(v25 + 40) = a3;
      *(_QWORD *)(v25 + 96) = &type metadata for String;
      *(_QWORD *)(v25 + 104) = v26;
      *(_QWORD *)(v25 + 64) = v26;
      *(_QWORD *)(v25 + 72) = v21;
      *(_QWORD *)(v25 + 80) = v22;
      *(_QWORD *)(v25 + 136) = &type metadata for String;
      *(_QWORD *)(v25 + 144) = v26;
      *(_QWORD *)(v25 + 112) = a2;
      *(_QWORD *)(v25 + 120) = a3;
      swift_bridgeObjectRetain_n(a3, 2);
      swift_bridgeObjectRetain(v22);
      v28 = sub_10000AFF0(0xD00000000000002ALL, 0x8000000100011FD0, v25);
      v30 = v29;
      swift_bridgeObjectRelease(v25);
      v91 = v28;
      v92 = v30;
      v31 = v24;
      v17 = v83;
      v32 = swift_allocObject(v31, 72, 7);
      *(_OWORD *)(v32 + 16) = xmmword_1000103F0;
      *(_QWORD *)(v32 + 56) = &type metadata for String;
      *(_QWORD *)(v32 + 64) = v27;
      *(_QWORD *)(v32 + 32) = v21;
      *(_QWORD *)(v32 + 40) = v22;
      v33 = sub_10000AFF0(0xD000000000000025, 0x8000000100012000, v32);
      v35 = v34;
      swift_bridgeObjectRelease(v32);
      v90._countAndFlagsBits = 2570;
      v90._object = (void *)0xE200000000000000;
      v36._countAndFlagsBits = v33;
      v36._object = v35;
      String.append(_:)(v36);
      v37 = v35;
    }
    else
    {
      v46 = sub_100004B1C(&qword_100019D78);
      v47 = swift_allocObject(v46, 112, 7);
      *(_OWORD *)(v47 + 16) = xmmword_1000103E0;
      *(_QWORD *)(v47 + 56) = &type metadata for String;
      v48 = sub_1000052F0();
      *(_QWORD *)(v47 + 32) = a2;
      *(_QWORD *)(v47 + 40) = a3;
      *(_QWORD *)(v47 + 96) = &type metadata for String;
      *(_QWORD *)(v47 + 104) = v48;
      *(_QWORD *)(v47 + 64) = v48;
      *(_QWORD *)(v47 + 72) = a2;
      *(_QWORD *)(v47 + 80) = a3;
      swift_bridgeObjectRetain_n(a3, 2);
      v49 = sub_10000AFF0(0xD000000000000032, 0x8000000100011F60, v47);
      v51 = v50;
      swift_bridgeObjectRelease(v47);
      v91 = v49;
      v92 = v51;
      v52._countAndFlagsBits = sub_10000AFF0(0xD00000000000002DLL, 0x8000000100011FA0, (uint64_t)&_swiftEmptyArrayStorage);
      object = v52._object;
      v90._countAndFlagsBits = 2570;
      v90._object = (void *)0xE200000000000000;
      String.append(_:)(v52);
      v37 = object;
    }
    swift_bridgeObjectRelease(v37);
    v54 = v90._object;
    String.append(_:)(v90);
    swift_bridgeObjectRelease(v54);
    (*(void (**)(char *, Class))(v85 + 8))(v14, isa);
  }
  else
  {
    v38 = sub_100004B1C(&qword_100019D78);
    v39 = swift_allocObject(v38, 72, 7);
    *(_OWORD *)(v39 + 16) = xmmword_1000103F0;
    *(_QWORD *)(v39 + 56) = &type metadata for String;
    *(_QWORD *)(v39 + 64) = sub_1000052F0();
    *(_QWORD *)(v39 + 32) = a2;
    *(_QWORD *)(v39 + 40) = a3;
    swift_bridgeObjectRetain(a3);
    v40 = sub_10000AFF0(0xD000000000000035, 0x8000000100011ED0, v39);
    v42 = v41;
    swift_bridgeObjectRelease(v39);
    v91 = v40;
    v92 = v42;
    v43._countAndFlagsBits = sub_10000AFF0(0xD00000000000002ALL, 0x8000000100011F10, (uint64_t)&_swiftEmptyArrayStorage);
    v44 = v43._object;
    v90._countAndFlagsBits = 2570;
    v90._object = (void *)0xE200000000000000;
    String.append(_:)(v43);
    swift_bridgeObjectRelease(v44);
    v45 = v90._object;
    String.append(_:)(v90);
    swift_bridgeObjectRelease(v45);
  }
  sub_100009980(0, &qword_100019E88, UIImage_ptr);
  v55._countAndFlagsBits = 0x73616C6772756F48;
  v55._object = (void *)0xE900000000000073;
  isa = UIImage.init(imageLiteralResourceName:)(v55).super.isa;
  v56 = sub_1000083D0(isa);
  v57 = type metadata accessor for InformationalViewController();
  v58 = v92;
  v59 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v57));
  v60 = v56;
  v61 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v17);
  v62 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v58);
  v63 = objc_msgSend(v59, "initWithTitle:detailText:icon:", v61, v62, v60);

  v64 = objc_msgSend(v63, "headerView");
  objc_msgSend(v64, "setAllowFullWidthIcon:", 1);

  sub_100009980(0, (unint64_t *)&qword_100019DC0, UIAction_ptr);
  v65 = swift_allocObject(&unk_1000150A0, 32, 7);
  v66 = v89;
  *(_QWORD *)(v65 + 16) = v89;
  *(_QWORD *)(v65 + 24) = a6;
  swift_retain(a6);
  v67 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_1000099DC, v65);
  v68 = objc_msgSend((id)objc_opt_self(OBHeaderAccessoryButton), "accessoryButton");
  sub_10000AFF0(0xD000000000000011, 0x8000000100011F40, (uint64_t)&_swiftEmptyArrayStorage);
  v70 = v69;
  v71 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v70);
  objc_msgSend(v68, "setTitle:forState:", v71, 0);

  objc_msgSend(v68, "addAction:forControlEvents:", v67, 64);
  v72 = objc_msgSend(v63, "headerView");
  objc_msgSend(v72, "addAccessoryButton:", v68);

  sub_100008940(v88 & 1, v66, a6);
  v73 = (_QWORD *)swift_allocObject(&unk_1000150C8, 40, 7);
  v73[2] = v63;
  v73[3] = v66;
  v73[4] = a6;
  swift_retain(a6);
  v74 = v63;
  v75 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_100009A10, v73);
  v76 = objc_msgSend((id)objc_opt_self(OBBoldTrayButton), "buttonWithType:", 1);
  sub_10000AFF0(0xD000000000000011, 0x8000000100011D80, (uint64_t)&_swiftEmptyArrayStorage);
  v78 = v77;
  v79 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v78);
  objc_msgSend(v76, "setTitle:forState:", v79, 0);

  objc_msgSend(v76, "addAction:forControlEvents:", v75, 64);
  v80 = objc_msgSend(v74, "buttonTray");
  objc_msgSend(v80, "addButton:", v76);

  return v74;
}

uint64_t sub_100009980(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_1000099B8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000099DC(uint64_t a1)
{
  uint64_t v1;

  return sub_1000086F8(a1, *(void (**)(uint64_t))(v1 + 16));
}

uint64_t sub_1000099E4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_100009A10(uint64_t a1)
{
  uint64_t v1;

  sub_100008BE4(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_100009A1C()
{
  uint64_t v0;

  return sub_100008CA8(*(void (**)(uint64_t))(v0 + 16));
}

uint64_t sub_100009A24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100009A34(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100009A3C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004B1C(&qword_100019E90);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100009A7C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(0);
}

uint64_t static LSResolutions.resolveApplicationName(_:)(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;

  v4 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain(a2);
  v5 = sub_100009B74(a1, a2, 1);
  v6 = objc_msgSend(v5, "localizedName");

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  return v7;
}

uint64_t LSResolutions.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t LSResolutions.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

id sub_100009B74(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  NSString v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v12 = 0;
  v7 = objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v6, a3 & 1, &v12);

  v8 = v12;
  if (v7)
  {
    v9 = v12;
  }
  else
  {
    v10 = v12;
    _convertNSErrorToError(_:)(v8);

    swift_willThrow();
  }
  return v7;
}

id _s30FamilyControlsAuthenticationUI13LSResolutionsC31resolveApplicationIconAsUIImageySo0J0CSSFZ_0(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  NSString v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend((id)objc_opt_self(ISImageDescriptor), "imageDescriptorNamed:", kISImageDescriptorHomeScreen);
  v9 = objc_allocWithZone((Class)ISIcon);
  swift_bridgeObjectRetain(a2);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v11 = objc_msgSend(v9, "initWithBundleIdentifier:", v10);

  v12 = objc_msgSend(v11, "prepareImageForDescriptor:", v8);
  if (v12 && (v13 = objc_msgSend(v12, "CGImage"), v12, v13))
  {
    v14 = objc_msgSend(objc_allocWithZone((Class)UIImage), "initWithCGImage:", v13);

  }
  else
  {
    static Logger.family.getter();
    v15 = swift_bridgeObjectRetain_n(a2, 2);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v23 = v4;
      v18 = (uint8_t *)swift_slowAlloc(12, -1);
      v19 = swift_slowAlloc(32, -1);
      v22 = v5;
      v20 = v19;
      v25 = v19;
      *(_DWORD *)v18 = 136380675;
      swift_bridgeObjectRetain(a2);
      v24 = sub_10000E7F0(a1, a2, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v18 + 4, v18 + 12);
      swift_bridgeObjectRelease_n(a2, 3);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Failed to resolve icon for bundle identifier: %{private}s", v18, 0xCu);
      swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v20, -1, -1);
      swift_slowDealloc(v18, -1, -1);

      (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v23);
    }
    else
    {

      swift_bridgeObjectRelease_n(a2, 2);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    v14 = objc_msgSend(objc_allocWithZone((Class)UIImage), "init");

  }
  return v14;
}

uint64_t type metadata accessor for LSResolutions()
{
  return objc_opt_self(_TtC30FamilyControlsAuthenticationUI13LSResolutions);
}

uint64_t sub_100009F50(char a1)
{
  if (!a1)
    return 0xD000000000000010;
  if (a1 == 1)
    return 0x6E614D4D444D6F6ELL;
  return 7105633;
}

uint64_t sub_100009FB0(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  id v7;
  NSString v8;
  id v9;
  NSString v10;
  unsigned int v11;
  char v12;
  NSString v13;
  unsigned __int8 v14;
  char v15;
  NSString v16;
  unsigned __int8 v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[16];
  uint64_t v37[3];
  unsigned __int8 v38;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = os_variant_allows_internal_security_policies("com.apple.FamilyControlsAgent");
  v38 = 0;
  v7 = objc_allocWithZone((Class)NSUserDefaults);
  v8 = String._bridgeToObjectiveC()();
  v9 = objc_msgSend(v7, "initWithSuiteName:", v8);

  if (v9)
  {
    v10 = String._bridgeToObjectiveC()();
    v11 = objc_msgSend(v9, "BOOLForKey:", v10);

    if (v11)
    {

      v12 = 1;
LABEL_8:
      v38 = v12;
      goto LABEL_10;
    }
    v13 = String._bridgeToObjectiveC()();
    v14 = objc_msgSend(v9, "BOOLForKey:", v13);

    v15 = a1;
    v16 = String._bridgeToObjectiveC()();
    v17 = objc_msgSend(v9, "BOOLForKey:", v16);

    a1 = v15;
    if (v15 == 2)
    {
      v12 = v14 & v17;
      goto LABEL_8;
    }
    if (v15 == 1)
      v38 = v17;
    else
      v38 = v14;
  }
LABEL_10:
  v18 = static Logger.permissions.getter();
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v32 = v3;
    v33 = v2;
    v21 = swift_slowAlloc(32, -1);
    v22 = swift_slowAlloc(96, -1);
    v37[0] = v22;
    *(_DWORD *)v21 = 136315650;
    v31 = v6;
    if (v6)
      v23 = 0;
    else
      v23 = 1953459744;
    if (v6)
      v24 = 0xE000000000000000;
    else
      v24 = 0xE400000000000000;
    v35 = sub_10000E7F0(v23, v24, v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, v36, v21 + 4, v21 + 12);
    swift_bridgeObjectRelease(v24);
    *(_WORD *)(v21 + 12) = 2080;
    if (a1)
    {
      if (a1 == 1)
      {
        v25 = 0xEF746E656D656761;
        v26 = 0x6E614D4D444D6F6ELL;
      }
      else
      {
        v25 = 0xE300000000000000;
        v26 = 7105633;
      }
    }
    else
    {
      v26 = 0xD000000000000010;
      v25 = 0x8000000100012160;
    }
    v35 = sub_10000E7F0(v26, v25, v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, v36, v21 + 14, v21 + 22);
    swift_bridgeObjectRelease(v25);
    *(_WORD *)(v21 + 22) = 2080;
    swift_beginAccess(&v38, &v35, 0, 0);
    if (v38)
      v28 = 0;
    else
      v28 = 1953459744;
    if (v38)
      v29 = 0xE000000000000000;
    else
      v29 = 0xE400000000000000;
    v34 = sub_10000E7F0(v28, v29, v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v21 + 24, v21 + 32);
    swift_bridgeObjectRelease(v29);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "This device is%s internal and the permission requirement %s is%s overridden.", (uint8_t *)v21, 0x20u);
    swift_arrayDestroy(v22, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v32 + 8))(v5, v33);
    if (v31)
      goto LABEL_31;
    return 0;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (!v6)
    return 0;
LABEL_31:
  swift_beginAccess(&v38, v37, 0, 0);
  return v38;
}

void sub_10000A3F4(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *), uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  unint64_t v24;
  _BYTE *v25;
  id v26;
  _QWORD v27[5];
  char v28;
  id v29;

  if (a1)
  {
    v6 = a5 + *(int *)(type metadata accessor for AuthenticationBiometric(0) + 28);
    v7 = type metadata accessor for AppleAccount(0);
    v27[3] = v7;
    v27[4] = &protocol witness table for AppleAccount;
    v8 = sub_100004E58(v27);
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v8, v6, v7);
    v28 = 0;
    a3(v27);
  }
  else
  {
    if (!a2)
      return;
    v26 = (id)_convertErrorToNSError(_:)(a2);
    v9 = objc_msgSend(v26, "domain");
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v12 = v11;

    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(LAErrorDomain);
    if (v10 == v13 && v12 == v14)
    {
      swift_bridgeObjectRelease_n(v12, 2);
    }
    else
    {
      v16 = v14;
      v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v12, v13, v14, 0);
      swift_bridgeObjectRelease(v12);
      swift_bridgeObjectRelease(v16);
      if ((v17 & 1) == 0)
      {

        return;
      }
    }
    v29 = v26;
    type metadata accessor for LAError(0);
    v19 = v18;
    v20 = sub_10000A5E8();
    _BridgedStoredNSError.code.getter(v27, v19, v20);
    if (v27[0] == -1)
    {
      v24 = sub_100004AD8();
      v22 = swift_allocError(&type metadata for AuthenticationError, v24, 0, 0);
      *v25 = 1;
    }
    else
    {
      v21 = sub_100004AD8();
      v22 = swift_allocError(&type metadata for AuthenticationError, v21, 0, 0);
      *v23 = 0;
    }
    v27[0] = v22;
    v28 = 1;
    a3(v27);

  }
  sub_10000A630((uint64_t)v27);
}

unint64_t sub_10000A5E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019C98;
  if (!qword_100019C98)
  {
    type metadata accessor for LAError(255);
    result = swift_getWitnessTable(&unk_100010200, v1);
    atomic_store(result, (unint64_t *)&qword_100019C98);
  }
  return result;
}

uint64_t sub_10000A630(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004B1C(&qword_100019D50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for AuthenticationBiometric(uint64_t a1)
{
  uint64_t result;

  result = qword_100019F88;
  if (!qword_100019F88)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AuthenticationBiometric);
  return result;
}

uint64_t *sub_10000A6AC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  id v13;
  uint64_t v14;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v14 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain(v14);
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v7 = (void *)a2[2];
    v6 = a2[3];
    a1[2] = (uint64_t)v7;
    a1[3] = v6;
    v8 = *(int *)(a3 + 28);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for AppleAccount(0);
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain(v5);
    v13 = v7;
    v12(v9, v10, v11);
  }
  return v3;
}

uint64_t sub_10000A75C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));

  v4 = a1 + *(int *)(a2 + 28);
  v5 = type metadata accessor for AppleAccount(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_10000A7AC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  id v12;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v6 = (void *)a2[2];
  v5 = a2[3];
  a1[2] = v6;
  a1[3] = v5;
  v7 = *(int *)(a3 + 28);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for AppleAccount(0);
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain(v4);
  v12 = v6;
  v11(v8, v9, v10);
  return a1;
}

_QWORD *sub_10000A830(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  *a1 = *a2;
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = (void *)a2[2];
  v9 = (void *)a1[2];
  a1[2] = v8;
  v10 = v8;

  a1[3] = a2[3];
  v11 = *(int *)(a3 + 28);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = type metadata accessor for AppleAccount(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_10000A8C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(int *)(a3 + 28);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = type metadata accessor for AppleAccount(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_QWORD *sub_10000A92C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = a2[1];
  v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = (void *)a1[2];
  a1[2] = a2[2];

  a1[3] = a2[3];
  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for AppleAccount(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_10000A9B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000A9BC);
}

uint64_t sub_10000A9BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for AppleAccount(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t sub_10000AA38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000AA44);
}

uint64_t sub_10000AA44(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for AppleAccount(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_10000AAB8(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[4];

  v4[0] = &unk_1000107D8;
  v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[2] = (char *)&value witness table for Builtin.Int64 + 64;
  result = type metadata accessor for AppleAccount(319);
  if (v3 <= 0x3F)
  {
    v4[3] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 4, v4, a1 + 16);
    return 0;
  }
  return result;
}

id sub_10000AB48()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  qword_100019FC8 = (uint64_t)result;
  return result;
}

void sub_10000AB80()
{
  qword_100019FD0 = 0x617A696C61636F4CLL;
  *(_QWORD *)algn_100019FD8 = 0xEB00000000656C62;
}

uint64_t sub_10000ABAC(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;

  if ((static Feature.isRebrandingEnabled.getter() & 1) != 0
    && (v9 = a1,
        v10 = a2,
        v7 = 0x444E4152424552,
        v8 = 0xE700000000000000,
        v4 = sub_10000B1C0(),
        (StringProtocol.contains<A>(_:)(&v7, &type metadata for String, &type metadata for String, v4, v4) & 1) == 0))
  {
    v9 = 0x444E41524245525FLL;
    v10 = 0xE800000000000000;
    v7 = a1;
    v8 = a2;
    swift_bridgeObjectRetain(a2);
    v7 = String.init<A>(_:)(&v7, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
    v8 = v5;
    String.append<A>(contentsOf:)(&v9, &type metadata for String, &protocol witness table for String);
    return v7;
  }
  else
  {
    swift_bridgeObjectRetain(a2);
  }
  return a1;
}

uint64_t sub_10000ACA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  Swift::String v13;
  uint64_t v14;
  void *v15;
  NSString v16;
  NSString v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSString v25;
  NSString v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  sub_100004B1C(&qword_100019FE0);
  __chkstk_darwin();
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MGCopyAnswer(CFSTR("DeviceClass"), 0);
  if (result)
  {
    v35 = result;
    if (swift_dynamicCast(&v33, &v35, (char *)&type metadata for Swift.AnyObject + 8, &type metadata for String, 6))
    {
      v9 = v34;
      v33 = a1;
      v34 = a2;
      swift_bridgeObjectRetain(a2);
      v10._countAndFlagsBits = 95;
      v10._object = (void *)0xE100000000000000;
      String.append(_:)(v10);
      v11 = v33;
      v12 = v34;
      v13 = String.uppercased()();
      swift_bridgeObjectRelease(v9);
      v33 = v11;
      v34 = v12;
      swift_bridgeObjectRetain(v12);
      String.append(_:)(v13);
      swift_bridgeObjectRelease(v12);
      swift_bridgeObjectRelease(v13._object);
      v14 = v34;
      if (qword_100019B00 != -1)
        swift_once(&qword_100019B00, sub_10000AB48);
      v15 = (void *)qword_100019FC8;
      v16 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v14);
      if (qword_100019B08 != -1)
        swift_once(&qword_100019B08, sub_10000AB80);
      v17 = String._bridgeToObjectiveC()();
      v18 = objc_msgSend(v15, "localizedStringForKey:value:table:", v16, 0, v17);

      v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
      v21 = v20;

      static Locale.autoupdatingCurrent.getter();
      v22 = type metadata accessor for Locale(0);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v7, 0, 1, v22);
      v23 = v19;
    }
    else
    {
      if (qword_100019B00 != -1)
        swift_once(&qword_100019B00, sub_10000AB48);
      v24 = (void *)qword_100019FC8;
      v25 = String._bridgeToObjectiveC()();
      if (qword_100019B08 != -1)
        swift_once(&qword_100019B08, sub_10000AB80);
      v26 = String._bridgeToObjectiveC()();
      v27 = objc_msgSend(v24, "localizedStringForKey:value:table:", v25, 0, v26);

      v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
      v21 = v29;

      static Locale.autoupdatingCurrent.getter();
      v30 = type metadata accessor for Locale(0);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v7, 0, 1, v30);
      v23 = v28;
    }
    v31 = String.init(format:locale:arguments:)(v23, v21, v7, a3);
    swift_bridgeObjectRelease(v21);
    sub_10000B180((uint64_t)v7);
    return v31;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000AFF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  void *v6;
  NSString v7;
  NSString v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  sub_100004B1C(&qword_100019FE0);
  __chkstk_darwin();
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019B00 != -1)
    swift_once(&qword_100019B00, sub_10000AB48);
  v6 = (void *)qword_100019FC8;
  v7 = String._bridgeToObjectiveC()();
  if (qword_100019B08 != -1)
    swift_once(&qword_100019B08, sub_10000AB80);
  v8 = String._bridgeToObjectiveC()();
  v9 = objc_msgSend(v6, "localizedStringForKey:value:table:", v7, 0, v8);

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
  v12 = v11;

  static Locale.autoupdatingCurrent.getter();
  v13 = type metadata accessor for Locale(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v5, 0, 1, v13);
  v14 = String.init(format:locale:arguments:)(v10, v12, v5, a3);
  swift_bridgeObjectRelease(v12);
  sub_10000B180((uint64_t)v5);
  return v14;
}

uint64_t sub_10000B180(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004B1C(&qword_100019FE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000B1C0()
{
  unint64_t result;

  result = qword_100019FE8;
  if (!qword_100019FE8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100019FE8);
  }
  return result;
}

uint64_t sub_10000B204(uint64_t a1, uint64_t a2, void *a3)
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
    v7 = sub_100004B1C(&qword_100019D58);
    v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, &type metadata for String, v7, &protocol witness table for String);
  }
  swift_retain(v5);
  v8 = a3;
  v6(v4, a3);
  swift_release(v5);

  return swift_bridgeObjectRelease(v4);
}

uint64_t sub_10000B294(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000B2B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_10000B2D4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  uint64_t v6;
  id v7;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (a2)
    v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a2, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v6 = 0;
  swift_retain(v4);
  v7 = a3;
  v5(v6, a3);
  swift_release(v4);

  return swift_bridgeObjectRelease(v6);
}

uint64_t sub_10000B368()
{
  return 1;
}

Swift::Int sub_10000B370()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void sub_10000B3B0()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_10000B3D4(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

id sub_10000B410()
{
  _BYTE *v0;
  _QWORD *v1;
  uint64_t v2;
  id v3;
  char *v4;
  objc_super v6;

  v0[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType] = 4;
  v1 = &v0[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_agentConnnection];
  *v1 = 0;
  v1[1] = 0;
  v2 = OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationNavigationController;
  v3 = objc_allocWithZone((Class)OBNavigationController);
  v4 = v0;
  *(_QWORD *)&v0[v2] = objc_msgSend(v3, "init");
  *(_QWORD *)&v4[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController____lazy_storage___authenicationResultsAgent] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController____lazy_storage___hostingAgent] = 0;

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AuthenticationUIServiceViewController();
  return objc_msgSendSuper2(&v6, "initWithNibName:bundle:", 0, 0);
}

uint64_t sub_10000B50C(void *a1, void (*a2)(uint64_t), uint64_t a3)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void (**v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t ObjectType;
  uint64_t *v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char v40;
  NSObject *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  _BOOL4 v55;
  void (*v56)(uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint8_t *v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  _BOOL4 v71;
  void (*v72)(uint64_t);
  uint64_t v73;
  uint64_t v74;
  uint8_t *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t result;
  __int128 *v82;
  uint64_t v83;
  uint64_t *v84;
  __int128 *v85;
  uint64_t v86;
  uint64_t v87;
  os_log_type_t v88;
  _BOOL4 v89;
  uint64_t v90;
  uint8_t *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  NSObject *v97;
  os_log_type_t v98;
  int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  void (*v105)(uint64_t, uint64_t);
  uint64_t v106;
  os_log_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  os_log_t v112;
  int v113;
  uint64_t v114;
  char *v115;
  char *v116;
  void (**v117)(uint64_t, uint64_t);
  uint64_t v118;
  uint64_t v119;
  NSObject *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void (*v124)(uint64_t);
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128[5];
  __int128 v129;
  __int128 v130;

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v111 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v111 - v12;
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v111 - v15;
  v17 = __chkstk_darwin(v14);
  v120 = ((char *)&v111 - v18);
  __chkstk_darwin(v17);
  v20 = (char *)&v111 - v19;
  v21 = sub_100004B1C(&qword_10001A0B8);
  __chkstk_darwin(v21);
  v116 = (char *)&v111 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = type metadata accessor for FamilyControlsAuthenticationUIService.ServiceType(0);
  v117 = *(unsigned int (***)(_QWORD, uint64_t, uint64_t))(v119 - 8);
  v23 = __chkstk_darwin(v119);
  __chkstk_darwin(v23);
  v118 = (uint64_t)&v111 - v25;
  if (!a1)
  {
    __break(1u);
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  v114 = v24;
  v115 = v20;
  v122 = v7;
  v123 = v6;
  v121 = a3;
  v124 = a2;
  v26 = objc_msgSend(a1, "xpcEndpoint");
  if (!v26)
  {
LABEL_60:
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001CLL, 0x8000000100012740, "FamilyControlsAuthenticationUI/AuthenticationUIServiceViewController.swift", 74, 2, 54, 0);
    __break(1u);
    return result;
  }
  v27 = v26;
  v28 = (void (**)(uint64_t, uint64_t))objc_msgSend(objc_allocWithZone((Class)NSXPCListenerEndpoint), "init");
  objc_msgSend(v28, "_setEndpoint:", v27);
  type metadata accessor for FamilyControlsAuthenticationUIService(0);
  v29 = static FamilyControlsAuthenticationUIService.connection(endpoint:)(v28);
  v31 = v30;
  ObjectType = swift_getObjectType(v29);
  dispatch thunk of XPCConnectable.resume()(ObjectType, v31);
  v33 = (uint64_t *)(v125
                  + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_agentConnnection);
  v34 = *(_QWORD *)(v125
                  + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_agentConnnection);
  *v33 = v29;
  v33[1] = v31;
  swift_unknownObjectRelease(v27);

  swift_unknownObjectRelease(v34);
  v35 = objc_msgSend(a1, "userInfo");
  if (v35)
  {
    v36 = v35;
    v37 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v35, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    v126 = static FamilyControlsAuthenticationUIService.ServiceBundleIdentifierKey.getter();
    v127 = v38;
    AnyHashable.init<A>(_:)(&v126, &type metadata for String, &protocol witness table for String);
    if (*(_QWORD *)(v37 + 16) && (v39 = sub_100006DD8((uint64_t)v128), (v40 & 1) != 0))
    {
      sub_10000EEA0(*(_QWORD *)(v37 + 56) + 32 * v39, (uint64_t)&v129);
    }
    else
    {
      v129 = 0u;
      v130 = 0u;
    }
    sub_1000081CC((uint64_t)v128);
    if (*((_QWORD *)&v130 + 1))
    {
      if ((swift_dynamicCast(&v126, &v129, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
      {
        v41 = v126;
        v42 = v127;
        v126 = static FamilyControlsAuthenticationUIService.ServiceMemberKey.getter();
        v127 = v43;
        AnyHashable.init<A>(_:)(&v126, &type metadata for String, &protocol witness table for String);
        if (*(_QWORD *)(v37 + 16) && (v44 = sub_100006DD8((uint64_t)v128), (v45 & 1) != 0))
        {
          sub_10000EEA0(*(_QWORD *)(v37 + 56) + 32 * v44, (uint64_t)&v129);
        }
        else
        {
          v129 = 0u;
          v130 = 0u;
        }
        sub_1000081CC((uint64_t)v128);
        if (*((_QWORD *)&v130 + 1))
        {
          if ((swift_dynamicCast(&v126, &v129, (char *)&type metadata for Any + 8, &type metadata for Int, 6) & 1) != 0)
          {
            v61 = FamilyControlsMember.init(rawValue:)(v126);
            if ((v62 & 1) == 0)
            {
              v63 = v61;
              v126 = static FamilyControlsAuthenticationUIService.ServiceTypeKey.getter();
              v127 = v64;
              AnyHashable.init<A>(_:)(&v126, &type metadata for String, &protocol witness table for String);
              if (*(_QWORD *)(v37 + 16) && (v65 = sub_100006DD8((uint64_t)v128), (v66 & 1) != 0))
              {
                sub_10000EEA0(*(_QWORD *)(v37 + 56) + 32 * v65, (uint64_t)&v129);
              }
              else
              {
                v129 = 0u;
                v130 = 0u;
              }
              swift_bridgeObjectRelease(v37);
              sub_1000081CC((uint64_t)v128);
              if (*((_QWORD *)&v130 + 1))
              {
                if ((swift_dynamicCast(&v126, &v129, (char *)&type metadata for Any + 8, &type metadata for Int, 6) & 1) == 0)
                {
                  v86 = swift_bridgeObjectRelease(v42);
LABEL_46:
                  v83 = (uint64_t)v120;
                  v87 = static Logger.authenticationUI.getter(v86);
                  v41 = Logger.logObject.getter(v87);
                  v88 = static os_log_type_t.error.getter();
                  v82 = (__int128 *)v88;
                  v89 = os_log_type_enabled(v41, v88);
                  v63 = v123;
                  v56 = v124;
                  v90 = v122;
                  if (v89)
                  {
                    v91 = (uint8_t *)swift_slowAlloc(2, -1);
                    *(_WORD *)v91 = 0;
                    _os_log_impl((void *)&_mh_execute_header, v41, (os_log_type_t)v82, "Context missing type", v91, 2u);
                    swift_slowDealloc(v91, -1, -1);
                  }

                  v60 = (*(uint64_t (**)(uint64_t, uint64_t))(v90 + 8))(v83, v63);
                  if (!v56)
                  {
                    __break(1u);
LABEL_50:
                    v120 = v41;
                    v92 = v118;
                    v93 = ((uint64_t (*)(uint64_t, __int128 *, uint64_t))v28[4])(v118, v82, v83);
                    v94 = v115;
                    static Logger.authenticationUI.getter(v93);
                    v95 = v114;
                    ((void (*)(uint64_t, uint64_t, uint64_t))v28[2])(v114, v92, v83);
                    v96 = swift_bridgeObjectRetain_n(v42, 2);
                    v97 = Logger.logObject.getter(v96);
                    v98 = static os_log_type_t.default.getter();
                    v99 = v98;
                    if (os_log_type_enabled(v97, v98))
                    {
                      v100 = swift_slowAlloc(22, -1);
                      v116 = (char *)swift_slowAlloc(64, -1);
                      v128[0] = (uint64_t)v116;
                      *(_DWORD *)v100 = 136446466;
                      v113 = v99;
                      v101 = sub_100003B04(&qword_10001A0C8, (uint64_t (*)(uint64_t))&type metadata accessor for FamilyControlsAuthenticationUIService.ServiceType, (uint64_t)&protocol conformance descriptor for FamilyControlsAuthenticationUIService.ServiceType);
                      v102 = dispatch thunk of CustomStringConvertible.description.getter(v83, v101);
                      v104 = v103;
                      *(_QWORD *)&v129 = sub_10000E7F0(v102, v103, v128);
                      v112 = v97;
                      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v129, (char *)&v129 + 8, v100 + 4, v100 + 12);
                      swift_bridgeObjectRelease(v104);
                      v105 = v28[1];
                      v105(v95, v83);
                      *(_WORD *)(v100 + 12) = 2082;
                      swift_bridgeObjectRetain(v42);
                      v106 = (uint64_t)v120;
                      *(_QWORD *)&v129 = sub_10000E7F0((uint64_t)v120, v42, v128);
                      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v129, (char *)&v129 + 8, v100 + 14, v100 + 22);
                      swift_bridgeObjectRelease_n(v42, 3);
                      v107 = v112;
                      _os_log_impl((void *)&_mh_execute_header, v112, (os_log_type_t)v113, "Configured for type: %{public}s, bundle identifier: %{public}s", (uint8_t *)v100, 0x16u);
                      v108 = v116;
                      swift_arrayDestroy(v116, 2, (char *)&type metadata for Any + 8);
                      swift_slowDealloc(v108, -1, -1);
                      swift_slowDealloc(v100, -1, -1);

                      (*(void (**)(char *, uint64_t))(v122 + 8))(v115, v123);
                    }
                    else
                    {
                      v105 = v28[1];
                      v105(v95, v83);

                      swift_bridgeObjectRelease_n(v42, 2);
                      (*(void (**)(char *, uint64_t))(v122 + 8))(v94, v123);
                      v106 = (uint64_t)v120;
                    }
                    v109 = v118;
                    sub_10000C0A4(v118, v63, v106, v42);
                    v110 = swift_bridgeObjectRelease(v42);
                    if (v124)
                    {
                      v124(v110);
                      return ((uint64_t (*)(uint64_t, uint64_t))v105)(v109, v83);
                    }
                    goto LABEL_59;
                  }
                  goto LABEL_22;
                }
                v82 = (__int128 *)v116;
                FamilyControlsAuthenticationUIService.ServiceType.init(rawValue:)(v126);
                v28 = (void (**)(uint64_t, uint64_t))v117;
                v83 = v119;
                if (((unsigned int (**)(__int128 *, uint64_t, uint64_t))v117)[6](v82, 1, v119) != 1)
                  goto LABEL_50;
                swift_bridgeObjectRelease(v42);
                v84 = &qword_10001A0B8;
                v85 = v82;
              }
              else
              {
                swift_bridgeObjectRelease(v42);
                v84 = &qword_10001A048;
                v85 = &v129;
              }
              v86 = sub_100004E04((uint64_t)v85, v84);
              goto LABEL_46;
            }
          }
          swift_bridgeObjectRelease(v42);
          v67 = swift_bridgeObjectRelease(v37);
        }
        else
        {
          swift_bridgeObjectRelease(v42);
          swift_bridgeObjectRelease(v37);
          v67 = sub_100004E04((uint64_t)&v129, &qword_10001A048);
        }
        v68 = static Logger.authenticationUI.getter(v67);
        v69 = Logger.logObject.getter(v68);
        v70 = static os_log_type_t.error.getter();
        v71 = os_log_type_enabled(v69, v70);
        v73 = v123;
        v72 = v124;
        v74 = v122;
        if (v71)
        {
          v75 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v75 = 0;
          _os_log_impl((void *)&_mh_execute_header, v69, v70, "Context missing type of family controls member", v75, 2u);
          swift_slowDealloc(v75, -1, -1);
        }

        v76 = (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v16, v73);
        if (v72)
        {
          v72(v76);
          goto LABEL_36;
        }
LABEL_58:
        __break(1u);
LABEL_59:
        __break(1u);
        goto LABEL_60;
      }
      v51 = swift_bridgeObjectRelease(v37);
    }
    else
    {
      swift_bridgeObjectRelease(v37);
      v51 = sub_100004E04((uint64_t)&v129, &qword_10001A048);
    }
    v52 = static Logger.authenticationUI.getter(v51);
    v53 = Logger.logObject.getter(v52);
    v54 = static os_log_type_t.error.getter();
    v55 = os_log_type_enabled(v53, v54);
    v57 = v123;
    v56 = v124;
    v58 = v122;
    if (v55)
    {
      v59 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v59 = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, v54, "Context missing bundle identifier", v59, 2u);
      swift_slowDealloc(v59, -1, -1);
    }

    v60 = (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v13, v57);
    if (v56)
    {
LABEL_22:
      v56(v60);
      goto LABEL_36;
    }
    goto LABEL_56;
  }
  v46 = static Logger.authenticationUI.getter(0);
  v47 = Logger.logObject.getter(v46);
  v48 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v47, v48))
  {
    v49 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v49 = 0;
    _os_log_impl((void *)&_mh_execute_header, v47, v48, "Context missing user info", v49, 2u);
    swift_slowDealloc(v49, -1, -1);
  }

  v50 = (*(uint64_t (**)(char *, uint64_t))(v122 + 8))(v10, v123);
  if (!v124)
    goto LABEL_57;
  v124(v50);
LABEL_36:
  v77 = sub_10000F240();
  v78 = swift_allocError(&type metadata for AuthenticationUIError, v77, 0, 0);
  v79 = (void *)sub_10000CC6C();
  v80 = (void *)_convertErrorToNSError(_:)(v78);
  objc_msgSend(v79, "didCompleteAuthenticationRequestWithStatus:error:", 0, v80);
  swift_unknownObjectRelease(v79);

  swift_errorRelease(v78);
  return sub_10000CAC4();
}

uint64_t sub_10000C0A4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  void *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void *v18;
  int v19;
  uint64_t result;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;

  v9 = type metadata accessor for FamilyControlsAuthenticationUIService.ServiceType(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  v13 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v12, v9);
  if (v13 == enum case for FamilyControlsAuthenticationUIService.ServiceType.authenticationForChildRequest(_:))
  {
    v14 = v4;
    swift_bridgeObjectRetain(a4);
    v15 = a3;
    v16 = a4;
    v17 = 0;
    v18 = v14;
    v19 = 0;
LABEL_5:
    sub_100007928(v15, v16, v17, v18, v19, a3, a4);

    return swift_bridgeObjectRelease(a4);
  }
  if (v13 == enum case for FamilyControlsAuthenticationUIService.ServiceType.authenticationForIndividualRequest(_:))
  {
    v14 = v4;
    swift_bridgeObjectRetain(a4);
    v15 = a3;
    v16 = a4;
    v17 = 1;
    v18 = v14;
    v19 = 1;
    goto LABEL_5;
  }
  if (v13 == enum case for FamilyControlsAuthenticationUIService.ServiceType.authenticationForRevoke(_:))
  {
    v21 = OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType;
    v22 = 2;
  }
  else
  {
    if (v13 != enum case for FamilyControlsAuthenticationUIService.ServiceType.authenticationForDeletion(_:))
    {
      result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000018, 0x8000000100012420, "FamilyControlsAuthenticationUI/AuthenticationUIServiceViewController.swift", 74, 2, 109, 0);
      __break(1u);
      return result;
    }
    v21 = OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType;
    v22 = 3;
  }
  *((_BYTE *)v4 + v21) = v22;
  v23 = FamilyControlsMember.rawValue.getter(a2);
  if (v23 == FamilyControlsMember.rawValue.getter(0))
    return sub_10000C2A8(a3, a4);
  else
    return sub_10000C604(a3, a4);
}

uint64_t sub_10000C2A8(uint64_t a1, uint64_t a2)
{
  _BYTE *v2;
  _BYTE *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  _BYTE *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD aBlock[5];
  uint64_t v36;

  v3 = v2;
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain(a2);
  v11 = sub_100009B74(a1, a2, 1);
  v12 = objc_msgSend(v11, "localizedName");

  static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  LOBYTE(v12) = v3[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType];
  v13 = v3;
  sub_100004EDC((char)v12);
  if (v14)
  {
    v16 = v14;
    v17 = v15;
    v18 = (_QWORD *)swift_allocObject(&unk_1000152E0, 40, 7);
    v18[2] = v13;
    v18[3] = a1;
    v18[4] = a2;
    v19 = swift_allocObject(&unk_100015308, 32, 7);
    *(_QWORD *)(v19 + 16) = sub_10000EEE4;
    *(_QWORD *)(v19 + 24) = v18;
    aBlock[4] = sub_10000EF14;
    v36 = v19;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000B204;
    aBlock[3] = &unk_100015320;
    v20 = _Block_copy(aBlock);
    v21 = v36;
    swift_bridgeObjectRetain(a2);
    v22 = v13;
    sub_10000EF1C(v16, v17);
    swift_retain(v18);
    swift_release(v21);
    objc_msgSend(v17, "authenticateWithContext:completion:", v16, v20);
    _Block_release(v20);
    sub_10000EF48(v16, v17);

    return swift_release(v18);
  }
  else
  {
    v24 = static Logger.authorization.getter(0);
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "No authentication controller provided. Canceling the request.", v27, 2u);
      swift_slowDealloc(v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v28 = type metadata accessor for FamilyControlsError(0);
    v29 = sub_100003B04((unint64_t *)&qword_100019D70, (uint64_t (*)(uint64_t))&type metadata accessor for FamilyControlsError, (uint64_t)&protocol conformance descriptor for FamilyControlsError);
    v30 = swift_allocError(v28, v29, 0, 0);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(v31, enum case for FamilyControlsError.authorizationCanceled(_:), v28);
    v32 = (void *)sub_10000CC6C();
    v33 = (void *)_convertErrorToNSError(_:)(v30);
    objc_msgSend(v32, "didCompleteAuthenticationRequestWithStatus:error:", 0, v33);
    swift_unknownObjectRelease(v32);

    swift_errorRelease(v30);
    return sub_10000CAC4();
  }
}

uint64_t sub_10000C604(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t inited;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  Class isa;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  _QWORD aBlock[5];
  uint64_t v50;
  char v51[168];

  v3 = v2;
  v6 = type metadata accessor for AuthenticationBiometric(0);
  v48 = *(_QWORD *)(v6 - 8);
  v7 = *(_QWORD *)(v48 + 64);
  v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  v10 = (uint64_t *)((char *)&v43 - v9);
  v11 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain(a2);
  v12 = sub_100009B74(a1, a2, 1);
  v13 = objc_msgSend(v12, "localizedName");

  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
  v16 = v15;

  v17 = objc_msgSend(objc_allocWithZone((Class)LAContext), "init");
  v10[2] = (uint64_t)v17;
  v10[3] = 2;
  AppleAccount.init()(v17);
  *v10 = v14;
  v10[1] = v16;
  v18 = (_QWORD *)swift_allocObject(&unk_1000153A8, 40, 7);
  v18[2] = v3;
  v18[3] = a1;
  v18[4] = a2;
  v20 = (void *)v10[2];
  v19 = v10[3];
  swift_bridgeObjectRetain_n(a2, 2);
  v21 = v3;
  if (objc_msgSend(v20, "canEvaluatePolicy:error:", v19, 0))
  {
    v22 = sub_100004B1C(&qword_10001A0B0);
    inited = swift_initStackObject(v22, v51);
    *(_OWORD *)(inited + 16) = xmmword_1000103E0;
    LODWORD(aBlock[0]) = 1021;
    v47 = v21;
    AnyHashable.init<A>(_:)(aBlock, &type metadata for Int32, &protocol witness table for Int32);
    v46 = v20;
    v44 = (uint64_t)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    v25 = *v10;
    v24 = v10[1];
    *(_QWORD *)(inited + 96) = &type metadata for String;
    *(_QWORD *)(inited + 72) = v25;
    *(_QWORD *)(inited + 80) = v24;
    v45 = v19;
    LODWORD(aBlock[0]) = 2;
    swift_bridgeObjectRetain(v24);
    AnyHashable.init<A>(_:)(aBlock, &type metadata for Int32, &protocol witness table for Int32);
    v26 = sub_100004B1C(&qword_100019D78);
    v27 = swift_allocObject(v26, 72, 7);
    *(_OWORD *)(v27 + 16) = xmmword_1000103F0;
    *(_QWORD *)(v27 + 56) = &type metadata for String;
    *(_QWORD *)(v27 + 64) = sub_1000052F0();
    *(_QWORD *)(v27 + 32) = v25;
    *(_QWORD *)(v27 + 40) = v24;
    swift_bridgeObjectRetain(v24);
    v28 = sub_10000ACA4(0xD000000000000010, 0x80000001000126B0, v27);
    v30 = v29;
    swift_bridgeObjectRelease(v27);
    *(_QWORD *)(inited + 168) = &type metadata for String;
    *(_QWORD *)(inited + 144) = v28;
    *(_QWORD *)(inited + 152) = v30;
    v31 = sub_100006608(inited);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v31);
    v33 = v44;
    sub_10000F08C((uint64_t)v10, v44);
    v34 = *(unsigned __int8 *)(v48 + 80);
    v35 = (v34 + 32) & ~v34;
    v36 = swift_allocObject(&unk_1000153D0, v35 + v7, v34 | 7);
    *(_QWORD *)(v36 + 16) = sub_10000F480;
    *(_QWORD *)(v36 + 24) = v18;
    sub_10000F16C(v33, v36 + v35);
    aBlock[4] = sub_10000F1B0;
    v50 = v36;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000B2D4;
    aBlock[3] = &unk_1000153E8;
    v37 = _Block_copy(aBlock);
    v38 = v50;
    swift_retain(v18);
    swift_release(v38);
    objc_msgSend(v46, "evaluatePolicy:options:reply:", v45, isa, v37);
    _Block_release(v37);
    swift_bridgeObjectRelease(a2);

    swift_release(v18);
  }
  else
  {
    v39 = sub_100004AD8();
    v40 = swift_allocError(&type metadata for AuthenticationError, v39, 0, 0);
    *v41 = 3;
    aBlock[0] = v40;
    LOBYTE(v50) = 1;
    sub_10000DA68((uint64_t)aBlock, (char *)v21, a1, a2);
    sub_100004E04((uint64_t)aBlock, &qword_100019D50);
    swift_bridgeObjectRelease(a2);

    swift_release(v18);
  }
  return sub_10000F050((uint64_t)v10);
}

uint64_t sub_10000CAC4()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;

  v1 = v0;
  if (qword_100019AF8 != -1)
    swift_once(&qword_100019AF8, sub_100006AB8);
  v2 = qword_100019DE8;
  v3 = swift_allocObject(&unk_100015268, 32, 7);
  *(_QWORD *)(v3 + 16) = sub_100007120;
  *(_QWORD *)(v3 + 24) = 0;
  v12[4] = sub_10000EE40;
  v13 = v3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10000B2B4;
  v12[3] = &unk_100015280;
  v4 = _Block_copy(v12);
  v5 = v13;
  swift_retain(v3);
  swift_release(v5);
  dispatch_sync(v2, v4);
  _Block_release(v4);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation(v3, "", 116, 207, 24, 1);
  result = swift_release(v3);
  if ((v2 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v7 = *(_QWORD *)(v1
                   + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_agentConnnection);
    if (v7)
    {
      v8 = *(_QWORD *)(v1
                     + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_agentConnnection
                     + 8);
      ObjectType = swift_getObjectType(*(_QWORD *)(v1
                                                 + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_agentConnnection));
      swift_unknownObjectRetain(v7);
      dispatch thunk of XPCConnectable.invalidate()(ObjectType, v8);
      swift_unknownObjectRelease(v7);
    }
    v10 = (void *)sub_10000CF1C();
    objc_msgSend(v10, "deactivate");
    swift_unknownObjectRelease(v10);
    v11 = (void *)sub_10000CF1C();
    objc_msgSend(v11, "invalidate");
    return swift_unknownObjectRelease(v11);
  }
  return result;
}

uint64_t sub_10000CC6C()
{
  return sub_10000CF30(&OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController____lazy_storage___authenicationResultsAgent, sub_10000CC80);
}

uint64_t sub_10000CC80(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  _BYTE v12[24];
  _BYTE v13[24];
  uint64_t v14;

  v2 = swift_allocObject(&unk_100015240, 48, 7);
  *(_OWORD *)(v2 + 16) = 0u;
  v3 = v2 + 16;
  *(_OWORD *)(v2 + 32) = 0u;
  v4 = a1 + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_agentConnnection;
  v5 = *(_QWORD *)(a1
                 + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_agentConnnection);
  if (v5)
  {
    v6 = *(_QWORD *)(v4 + 8);
    ObjectType = swift_getObjectType(v5);
    swift_unknownObjectRetain(v5);
    swift_retain(v2);
    XPCConnectable.synchronousRemoteObjectProxy(retryCount:proxyHandler:)(1, sub_10000E730, v2, ObjectType, v6);
    swift_release(v2);
    swift_unknownObjectRelease(v5);
  }
  swift_beginAccess(v3, v12, 0, 0);
  sub_10000814C(v3, (uint64_t)v13, &qword_10001A048);
  if (v14)
  {
    v8 = sub_100004B1C(&qword_10001A060);
    if ((swift_dynamicCast(&v11, v13, (char *)&type metadata for Any + 8, v8, 6) & 1) != 0)
    {
      v9 = v11;
      swift_release(v2);
      return v9;
    }
  }
  else
  {
    sub_100004E04((uint64_t)v13, &qword_10001A048);
  }
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000003BLL, 0x80000001000123A0, "FamilyControlsAuthenticationUI/AuthenticationUIServiceViewController.swift", 74, 2, 136, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000CE08(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  Swift::String v6;
  uint64_t v7;
  _QWORD v8[3];
  _OWORD v9[2];
  _OWORD v10[2];
  char v11;

  sub_10000814C(a1, (uint64_t)v10, &qword_10001A068);
  if ((v11 & 1) != 0)
  {
    v5 = *(_QWORD *)&v10[0];
    *(_QWORD *)&v9[0] = 0;
    *((_QWORD *)&v9[0] + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(63);
    v6._object = (void *)0x80000001000123E0;
    v6._countAndFlagsBits = 0xD00000000000003DLL;
    String.append(_:)(v6);
    v8[0] = v5;
    v7 = sub_100004B1C((uint64_t *)&unk_10001A070);
    _print_unlocked<A, B>(_:_:)(v8, v9, v7, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, *(_QWORD *)&v9[0], *((_QWORD *)&v9[0] + 1), "FamilyControlsAuthenticationUI/AuthenticationUIServiceViewController.swift", 74, 2, 131, 0);
    __break(1u);
  }
  else
  {
    v3 = a2 + 16;
    sub_100007F3C(v10, v9);
    swift_beginAccess(v3, v8, 1, 0);
    return sub_10000E738((uint64_t)v9, v3);
  }
  return result;
}

uint64_t sub_10000CF1C()
{
  return sub_10000CF30(&OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController____lazy_storage___hostingAgent, (uint64_t (*)(uint64_t))sub_10000CF90);
}

uint64_t sub_10000CF30(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  v4 = *(_QWORD *)(v2 + *a1);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v5 = a2(v2);
    v6 = *(_QWORD *)(v2 + v3);
    *(_QWORD *)(v2 + v3) = v5;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease(v6);
  }
  swift_unknownObjectRetain();
  return v5;
}

uint64_t sub_10000CF90(void *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  _QWORD aBlock[6];

  aBlock[4] = sub_10000D110;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D1CC;
  aBlock[3] = &unk_100015208;
  v2 = _Block_copy(aBlock);
  v3 = objc_msgSend(a1, "_remoteViewControllerProxyWithErrorHandler:", v2);
  _Block_release(v2);
  if (v3)
  {
    _bridgeAnyObjectToAny(_:)(&v8, v3);
    swift_unknownObjectRelease(v3);
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  sub_10000E6BC((uint64_t)&v8, (uint64_t)aBlock);
  sub_10000814C((uint64_t)aBlock, (uint64_t)&v8, &qword_10001A048);
  if (*((_QWORD *)&v9 + 1))
  {
    v4 = sub_100004B1C(&qword_10001A050);
    if ((swift_dynamicCast(&v7, &v8, (char *)&type metadata for Any + 8, v4, 6) & 1) != 0)
    {
      v5 = v7;
      sub_100004E04((uint64_t)aBlock, &qword_10001A048);
      return v5;
    }
  }
  else
  {
    sub_100004E04((uint64_t)&v8, &qword_10001A048);
  }
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000002CLL, 0x8000000100012340, "FamilyControlsAuthenticationUI/AuthenticationUIServiceViewController.swift", 74, 2, 148, 0);
  __break(1u);
  return result;
}

void sub_10000D110(uint64_t a1)
{
  uint64_t v2;
  Swift::String v3;
  void *object;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  _StringGuts.grow(_:)(49);
  swift_bridgeObjectRelease(0xE000000000000000);
  v6 = 0xD00000000000002FLL;
  v7 = 0x8000000100012370;
  v5 = a1;
  swift_errorRetain(a1);
  v2 = sub_100004B1C(&qword_10001A058);
  v3._countAndFlagsBits = String.init<A>(describing:)(&v5, v2);
  object = v3._object;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(object);
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v6, v7, "FamilyControlsAuthenticationUI/AuthenticationUIServiceViewController.swift", 74, 2, 144, 0);
  __break(1u);
}

void sub_10000D1CC(uint64_t a1, void *a2)
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

id sub_10000D250()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AuthenticationUIServiceViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AuthenticationUIServiceViewController()
{
  return objc_opt_self(_TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController);
}

void sub_10000D2F8(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint8_t *v46;
  uint64_t v47;
  char v48[31];
  char v49;
  uint64_t v50;
  uint64_t v51[3];
  uint64_t v52;

  v12 = type metadata accessor for Logger(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v45 - v17;
  if ((a2 & 1) != 0)
  {
    v52 = a1;
    v19 = swift_errorRetain(a1);
    v20 = static Logger.authorization.getter(v19);
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.error.getter();
    v23 = os_log_type_enabled(v21, v22);
    v47 = a3;
    if (v23)
    {
      v24 = (uint8_t *)swift_slowAlloc(12, -1);
      v25 = swift_slowAlloc(32, -1);
      v51[0] = v25;
      *(_DWORD *)v24 = 136446210;
      v46 = v24 + 4;
      swift_beginAccess(&v52, v48, 0, 0);
      v50 = v52;
      swift_errorRetain(v52);
      v26 = sub_100004B1C((uint64_t *)&unk_10001A070);
      v27 = String.init<A>(describing:)(&v50, v26);
      v29 = v28;
      v50 = sub_10000E7F0(v27, v28, v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, v51, v46, v24 + 12);
      swift_bridgeObjectRelease(v29);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Failed to get user response from notification: %{public}s", v24, 0xCu);
      swift_arrayDestroy(v25, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v25, -1, -1);
      swift_slowDealloc(v24, -1, -1);
    }

    v30 = *(void (**)(char *, uint64_t))(v13 + 8);
    v30(v18, v12);
    swift_beginAccess(&v52, v51, 1, 0);
    v50 = v52;
    swift_errorRetain(v52);
    v31 = sub_100004B1C((uint64_t *)&unk_10001A070);
    v32 = swift_dynamicCast(&v49, &v50, v31, &type metadata for NotificationError, 6);
    if ((v32 & 1) != 0)
    {
      if ((v49 & 1) != 0)
      {
        v33 = static Logger.authorization.getter(v32);
        v34 = Logger.logObject.getter(v33);
        v35 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v34, v35))
        {
          v36 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v36 = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, v35, "Invalid response notification error. Treating it as a cancel.", v36, 2u);
          swift_slowDealloc(v36, -1, -1);
        }

        v30(v16, v12);
      }
      v37 = type metadata accessor for FamilyControlsError(0);
      v38 = sub_100003B04((unint64_t *)&qword_100019D70, (uint64_t (*)(uint64_t))&type metadata accessor for FamilyControlsError, (uint64_t)&protocol conformance descriptor for FamilyControlsError);
      v39 = swift_allocError(v37, v38, 0, 0);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v37 - 8) + 104))(v40, enum case for FamilyControlsError.authorizationCanceled(_:), v37);
      v41 = v52;
      v52 = v39;
      swift_errorRelease(v41);
    }
    v42 = v52;
    swift_errorRetain(v52);
    v43 = (void *)sub_10000CC6C();
    v44 = (void *)_convertErrorToNSError(_:)(v42);
    objc_msgSend(v43, "didCompleteAuthenticationRequestWithStatus:error:", 0, v44);
    swift_unknownObjectRelease(v43);

    swift_errorRelease(v42);
    sub_10000CAC4();
    swift_errorRelease(v42);
  }
  else
  {
    sub_10000D6B4(a4, a1 & 1, a5, a6);
  }
}

void sub_10000D6B4(char a1, char a2, uint64_t a3, unint64_t a4)
{
  void *v4;
  void *v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char *v21;
  id v22;
  char *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  char *v39;
  id v40;

  v5 = v4;
  v39 = (char *)type metadata accessor for Logger(0);
  v10 = *((_QWORD *)v39 - 1);
  __chkstk_darwin(v39);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = _s30FamilyControlsAuthenticationUI13LSResolutionsC31resolveApplicationIconAsUIImageySo0J0CSSFZ_0(a3, a4);
  v13 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain(a4);
  v14 = sub_100009B74(a3, a4, 1);
  v15 = objc_msgSend(v14, "localizedName");

  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  v18 = v17;

  v19 = swift_allocObject(&unk_1000152B8, 56, 7);
  *(_BYTE *)(v19 + 16) = a1;
  *(_QWORD *)(v19 + 24) = v5;
  *(_BYTE *)(v19 + 32) = a2 & 1;
  *(_QWORD *)(v19 + 40) = a3;
  *(_QWORD *)(v19 + 48) = a4;
  if (!a1)
  {
    v20 = 1;
    goto LABEL_5;
  }
  if (a1 == 1)
  {
    v20 = 0;
LABEL_5:
    swift_bridgeObjectRetain(a4);
    v21 = v5;
    v22 = v40;
    v23 = (char *)sub_1000091FC(v20, v16, v18, (uint64_t)v40, (uint64_t)sub_10000EE8C, v19);
    swift_bridgeObjectRelease(v18);
    *(_QWORD *)&v23[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI27InformationalViewController_delegate + 8] = &off_1000151E8;
    swift_unknownObjectWeakAssign();
    v24 = OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationNavigationController;
    v25 = *(void **)&v21[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationNavigationController];
    v39 = v23;
    objc_msgSend(v25, "pushViewController:animated:", v39, 1);
    v26 = *(id *)&v21[v24];
    objc_msgSend(v21, "presentViewController:animated:completion:", v26, 1, 0);

    swift_release(v19);
    return;
  }
  swift_bridgeObjectRetain(a4);
  v5;
  v27 = swift_bridgeObjectRelease(v18);
  v28 = static Logger.authorization.getter(v27);
  v29 = Logger.logObject.getter(v28);
  v30 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "No informational view controller provided. Dismissing authentication UI.", v31, 2u);
    swift_slowDealloc(v31, -1, -1);
  }

  (*(void (**)(char *, char *))(v10 + 8))(v12, v39);
  v32 = type metadata accessor for FamilyControlsError(0);
  v33 = sub_100003B04((unint64_t *)&qword_100019D70, (uint64_t (*)(uint64_t))&type metadata accessor for FamilyControlsError, (uint64_t)&protocol conformance descriptor for FamilyControlsError);
  v34 = swift_allocError(v32, v33, 0, 0);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v32 - 8) + 104))(v35, enum case for FamilyControlsError.authorizationCanceled(_:), v32);
  v36 = (void *)sub_10000CC6C();
  v37 = (void *)_convertErrorToNSError(_:)(v34);
  objc_msgSend(v36, "didCompleteAuthenticationRequestWithStatus:error:", 0, v37);
  swift_unknownObjectRelease(v36);

  swift_errorRelease(v34);
  sub_10000CAC4();

  swift_release(v19);
}

uint64_t sub_10000DA68(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v20;
  uint64_t (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void *v37;
  void *v38;
  _QWORD v39[3];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD aBlock[5];
  _QWORD *v47;
  __int128 v48[2];
  _QWORD v49[5];
  __int128 v50[2];
  char v51;

  v45 = a4;
  v44 = a3;
  v40 = type metadata accessor for Logger(0);
  v39[2] = *(_QWORD *)(v40 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v39[1] = (char *)v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  v9 = type metadata accessor for DispatchWorkItemFlags(0);
  v43 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v11 = (char *)v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = type metadata accessor for DispatchQoS(0);
  v41 = *(_QWORD *)(v42 - 8);
  __chkstk_darwin(v42);
  v13 = (char *)v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for AuthorizationStatus(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000814C(a1, (uint64_t)v50, &qword_100019D50);
  if ((v51 & 1) != 0)
  {
    v18 = *(_QWORD *)&v50[0];
    aBlock[0] = *(_QWORD *)&v50[0];
    swift_errorRetain(*(_QWORD *)&v50[0]);
    v19 = sub_100004B1C((uint64_t *)&unk_10001A070);
    if ((swift_dynamicCast(v49, aBlock, v19, &type metadata for AuthenticationError, 6) & 1) != 0)
      __asm { BR              X10 }
    swift_errorRetain(v18);
    v37 = (void *)sub_10000CC6C();
    v38 = (void *)_convertErrorToNSError(_:)(v18);
    objc_msgSend(v37, "didCompleteAuthenticationRequestWithStatus:error:", 0, v38);
    swift_unknownObjectRelease(v37);

    swift_errorRelease(v18);
    sub_10000CAC4();
    return swift_errorRelease(v18);
  }
  else
  {
    sub_100004E40(v50, (uint64_t)v49);
    v20 = *(unsigned int *)*(&off_1000154C8
                           + a2[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType]);
    v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 104);
    v39[0] = v14;
    v22 = v21(v17, v20, v14);
    v23 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", AuthorizationStatus.rawValue.getter(v22));
    v24 = (void *)sub_10000CC6C();
    objc_msgSend(v24, "didCompleteAuthenticationRequestWithStatus:error:", v23, 0);

    swift_unknownObjectRelease(v24);
    sub_1000071E4();
    v25 = (void *)static OS_dispatch_queue.main.getter();
    sub_100004D7C((uint64_t)v49, (uint64_t)v48);
    v26 = (_QWORD *)swift_allocObject(&unk_100015358, 80, 7);
    v27 = v44;
    v26[2] = a2;
    v26[3] = v27;
    v28 = v45;
    v26[4] = v45;
    sub_100004E40(v48, (uint64_t)(v26 + 5));
    aBlock[4] = sub_10000EFA8;
    v47 = v26;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100008D3C;
    aBlock[3] = &unk_100015370;
    v29 = _Block_copy(aBlock);
    v30 = v47;
    v31 = a2;
    swift_bridgeObjectRetain(v28);
    v32 = swift_release(v30);
    static DispatchQoS.unspecified.getter(v32);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v33 = sub_100003B04(&qword_10001A090, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v34 = sub_100004B1C(&qword_10001A098);
    v35 = sub_10000EFD4();
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v34, v35, v9, v33);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v13, v11, v29);
    _Block_release(v29);

    (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v9);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v13, v42);
    (*(void (**)(char *, _QWORD))(v15 + 8))(v17, v39[0]);
    return sub_100004DE4(v49);
  }
}

void sub_10000E200(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  char *v23;
  char *v24;
  id v25;
  id v26;

  v4 = v3;
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = _s30FamilyControlsAuthenticationUI13LSResolutionsC31resolveApplicationIconAsUIImageySo0J0CSSFZ_0(a1, a2);
  v12 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain(a2);
  v13 = sub_100009B74(a1, a2, 1);
  v14 = objc_msgSend(v13, "localizedName");

  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  v17 = v16;

  if (*(unsigned __int8 *)(v4
                                        + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType)
     - 2 >= 3)
  {
    if (*(_BYTE *)(v4
                  + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType))
      v23 = (char *)sub_100005CFC(v15, v17, v26, a3);
    else
      v23 = (char *)sub_10000591C(v15, v17, v26, a3);
    v24 = v23;
    swift_bridgeObjectRelease(v17);
    *(_QWORD *)&v24[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI26ConfirmationViewController_delegate + 8] = &off_1000151F8;
    swift_unknownObjectWeakAssign();
    v25 = objc_retain(*(id *)(v4
                            + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationNavigationController));
    objc_msgSend(v25, "pushViewController:animated:", v24, 1);

  }
  else
  {
    v18 = swift_bridgeObjectRelease(v17);
    v19 = static Logger.authorization.getter(v18);
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "No confirmation view controller provided. Dismissing authentication UI.", v22, 2u);
      swift_slowDealloc(v22, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_10000CAC4();

  }
}

uint64_t sub_10000E474(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  void *v7;
  void *v8;

  if (a1)
  {
    v7 = (void *)sub_10000CC6C();
    v8 = (void *)_convertErrorToNSError(_:)(a1);
    objc_msgSend(v7, "didCompleteAuthenticationRequestWithStatus:error:", 0, v8);
    swift_unknownObjectRelease(v7);

    return sub_10000CAC4();
  }
  if (a2)
  {
    if (a2 == 1)
    {
      *(_BYTE *)(a3
               + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType) = (a4 & 1) == 0;
      return sub_10000C604(a5, a6);
    }
  }
  else
  {
    *(_BYTE *)(a3
             + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType) = (a4 & 1) == 0;
  }
  return sub_10000C2A8(a5, a6);
}

uint64_t storeEnumTagSinglePayload for AuthenticationRequestType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000E5DC + 4 * byte_10001080F[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10000E610 + 4 * byte_10001080A[v4]))();
}

uint64_t sub_10000E610(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000E618(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000E620);
  return result;
}

uint64_t sub_10000E62C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000E634);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_10000E638(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000E640(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AuthenticationRequestType()
{
  return &type metadata for AuthenticationRequestType;
}

unint64_t sub_10000E660()
{
  unint64_t result;

  result = qword_10001A040;
  if (!qword_10001A040)
  {
    result = swift_getWitnessTable(&unk_1000108DC, &type metadata for AuthenticationRequestType);
    atomic_store(result, (unint64_t *)&qword_10001A040);
  }
  return result;
}

uint64_t sub_10000E6A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000E6B4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000E6BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004B1C(&qword_10001A048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E704()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 40))
    sub_100004DE4((_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000E730(uint64_t a1)
{
  uint64_t v1;

  return sub_10000CE08(a1, v1);
}

uint64_t sub_10000E738(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004B1C(&qword_10001A048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E780(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v6 = a4();
  v8 = v7;
  v9 = sub_10000E7F0(v6, v7, a3);
  v10 = *a1;
  v11 = *a1 + 8;
  v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10, v11);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v11;
  return result;
}

uint64_t sub_10000E7F0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10000E8C0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000EEA0((uint64_t)v12, *a3);
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
      sub_10000EEA0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100004DE4(v12);
  return v7;
}

uint64_t sub_10000E8C0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000EA78(a5, a6);
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

uint64_t sub_10000EA78(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000EB0C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10000ECE4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000ECE4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000EB0C(uint64_t a1, unint64_t a2)
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
      v5 = sub_10000EC80(v4, 0);
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

_QWORD *sub_10000EC80(uint64_t a1, uint64_t a2)
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
  v4 = sub_100004B1C((uint64_t *)&unk_10001A080);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000ECE4(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100004B1C((uint64_t *)&unk_10001A080);
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

uint64_t sub_10000EE30()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000EE40()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000EE60()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000EE8C(uint64_t a1)
{
  uint64_t v1;

  return sub_10000E474(a1, *(_BYTE *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_BYTE *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
}

uint64_t sub_10000EEA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000EEE4(uint64_t a1)
{
  uint64_t v1;

  return sub_10000DA68(a1, *(char **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_10000EEF0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000EF14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100004010(a1, a2, *(void (**)(__int128 *))(v2 + 16), *(_QWORD *)(v2 + 24));
}

id sub_10000EF1C(id result, void *a2)
{
  id v2;

  if (result)
  {
    v2 = result;
    return a2;
  }
  return result;
}

void sub_10000EF48(void *a1, void *a2)
{
  if (a1)
  {

  }
}

uint64_t sub_10000EF74()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  sub_100004DE4((_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 80, 7);
}

void sub_10000EFA8()
{
  _QWORD *v0;

  sub_10000E200(v0[3], v0[4], v0 + 5);
}

unint64_t sub_10000EFD4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001A0A0;
  if (!qword_10001A0A0)
  {
    v1 = sub_1000072B4(&qword_10001A098);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001A0A0);
  }
  return result;
}

uint64_t sub_10000F024()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000F050(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AuthenticationBiometric(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000F08C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AuthenticationBiometric(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000F0D0()
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

  v1 = type metadata accessor for AuthenticationBiometric(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_release(*(_QWORD *)(v0 + 24));
  v7 = v0 + v4;
  swift_bridgeObjectRelease(*(_QWORD *)(v7 + 8));

  v8 = v7 + *(int *)(v1 + 28);
  v9 = type metadata accessor for AppleAccount(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000F16C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AuthenticationBiometric(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10000F1B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AuthenticationBiometric(0) - 8) + 80);
  sub_10000A3F4(a1, a2, *(void (**)(_QWORD *))(v2 + 16), *(_QWORD *)(v2 + 24), v2 + ((v5 + 32) & ~v5));
}

uint64_t sub_10000F200(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_10000F210()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000F234()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

unint64_t sub_10000F240()
{
  unint64_t result;

  result = qword_10001A0C0;
  if (!qword_10001A0C0)
  {
    result = swift_getWitnessTable(&unk_1000109C0, &type metadata for AuthenticationUIError);
    atomic_store(result, (unint64_t *)&qword_10001A0C0);
  }
  return result;
}

void sub_10000F284()
{
  _BYTE *v0;
  _QWORD *v1;
  uint64_t v2;

  v0[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType] = 4;
  v1 = &v0[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_agentConnnection];
  *v1 = 0;
  v1[1] = 0;
  v2 = OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationNavigationController;
  *(_QWORD *)&v0[v2] = objc_msgSend(objc_allocWithZone((Class)OBNavigationController), "init");
  *(_QWORD *)&v0[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController____lazy_storage___authenicationResultsAgent] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController____lazy_storage___hostingAgent] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000018, 0x8000000100012760, "FamilyControlsAuthenticationUI/AuthenticationUIServiceViewController.swift", 74, 2, 41, 0);
  __break(1u);
}

uint64_t getEnumTagSinglePayload for AuthenticationUIError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AuthenticationUIError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_10000F3D4 + 4 * byte_100010814[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10000F3F4 + 4 * byte_100010819[v4]))();
}

_BYTE *sub_10000F3D4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10000F3F4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000F3FC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000F404(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000F40C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000F414(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_10000F420()
{
  return 0;
}

ValueMetadata *type metadata accessor for AuthenticationUIError()
{
  return &type metadata for AuthenticationUIError;
}

unint64_t sub_10000F43C()
{
  unint64_t result;

  result = qword_10001A0D0;
  if (!qword_10001A0D0)
  {
    result = swift_getWitnessTable(&unk_100010998, &type metadata for AuthenticationUIError);
    atomic_store(result, (unint64_t *)&qword_10001A0D0);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC30FamilyControlsAuthenticationUIP33_29514148723CDFCAC3523BBB1C4FEEF519ResourceBundleClass);
}
