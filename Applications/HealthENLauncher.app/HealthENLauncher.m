uint64_t sub_1000029B0()
{
  return 1;
}

Swift::Int sub_1000029B8()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void sub_1000029F8()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_100002A1C(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

BOOL sub_100002A58(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100002A70()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100002AB4()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100002ADC(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100002B2C(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];
  _BYTE v10[24];

  swift_beginAccess(a1 + 16, v10, 0, 0);
  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    v3 = objc_msgSend(v2, "description");
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v6 = v5;

  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v9[0] = v4;
  v9[1] = v6;
  v7 = sub_10000937C(&qword_100025A68);
  return String.init<A>(describing:)(v9, v7);
}

uint64_t sub_100002BC4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = type metadata accessor for URLQueryItem(0);
  v3 = swift_bridgeObjectRetain(a1);
  v4 = Array.description.getter(v3, v2);
  swift_bridgeObjectRelease(a1);
  return v4;
}

unint64_t sub_100002C1C(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unint64_t v8;
  char v9;
  int v10;
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
  unsigned __int8 *v23;
  unsigned int v24;
  uint64_t v25;
  _QWORD v26[2];
  char v27;

  v3 = HIBYTE(a2) & 0xF;
  v4 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v5 = v3;
  else
    v5 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v5)
  {
    swift_bridgeObjectRelease(a2);
    v21 = 0;
    LOBYTE(v20) = 1;
    return v21 | ((unint64_t)v20 << 32);
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((a1 & 0x1000000000000000) != 0)
        v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v6 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(a1, a2);
      v7 = sub_10000402C(v6, v4, 10);
      LODWORD(v8) = (_DWORD)v7;
      v27 = BYTE4(v7) & 1;
      v9 = BYTE4(v7) & 1;
      goto LABEL_38;
    }
    v26[0] = a1;
    v26[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    v10 = a1;
    if (a1 == 43)
    {
      if (v3)
      {
        if (v3 != 1)
        {
          LODWORD(v8) = (BYTE1(a1) - 48);
          if (v8 <= 9)
          {
            v15 = v3 - 2;
            if (v15)
            {
              v16 = (unsigned __int8 *)v26 + 2;
              while (1)
              {
                v17 = *v16 - 48;
                if (v17 > 9)
                  goto LABEL_35;
                v18 = 10 * v8;
                if ((v18 & 0xFFFFFFFF00000000) != 0)
                  goto LABEL_35;
                LODWORD(v8) = v18 + v17;
                if (__CFADD__((_DWORD)v18, v17))
                  goto LABEL_35;
                v9 = 0;
                ++v16;
                if (!--v15)
                  goto LABEL_38;
              }
            }
            goto LABEL_37;
          }
        }
        goto LABEL_35;
      }
    }
    else
    {
      if (a1 != 45)
      {
        if (v3)
        {
          LODWORD(v8) = (a1 - 48);
          if (v8 <= 9)
          {
            v19 = v3 - 1;
            if (v19)
            {
              v23 = (unsigned __int8 *)v26 + 1;
              while (1)
              {
                v24 = *v23 - 48;
                if (v24 > 9)
                  goto LABEL_35;
                v25 = 10 * v8;
                if ((v25 & 0xFFFFFFFF00000000) != 0)
                  goto LABEL_35;
                LODWORD(v8) = v25 + v24;
                if (__CFADD__((_DWORD)v25, v24))
                  goto LABEL_35;
                v9 = 0;
                ++v23;
                if (!--v19)
                  goto LABEL_38;
              }
            }
            goto LABEL_37;
          }
        }
        goto LABEL_35;
      }
      if (v3)
      {
        if (v3 != 1 && (BYTE1(a1) - 48) <= 9u)
        {
          v10 = 0;
          LODWORD(v8) = -(BYTE1(a1) - 48);
          if (BYTE1(a1) == 48)
          {
            v11 = v3 - 2;
            if (v11)
            {
              v12 = (unsigned __int8 *)v26 + 2;
              while (1)
              {
                v13 = *v12 - 48;
                if (v13 > 9)
                  goto LABEL_35;
                v14 = 10 * v8;
                if ((v14 & 0xFFFFFFFF00000000) != 0)
                  goto LABEL_35;
                LODWORD(v8) = v14 - v13;
                if (v14 < v13)
                  goto LABEL_35;
                v9 = 0;
                ++v12;
                if (!--v11)
                  goto LABEL_38;
              }
            }
LABEL_37:
            v9 = 0;
            goto LABEL_38;
          }
LABEL_53:
          v9 = 1;
          LODWORD(v8) = v10;
          goto LABEL_38;
        }
LABEL_35:
        LODWORD(v8) = 0;
        v9 = 1;
LABEL_38:
        swift_bridgeObjectRelease(a2);
        LODWORD(v20) = v9 & 1;
        goto LABEL_39;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_53;
  }
  v8 = sub_100003F48(a1, a2, 10);
  swift_bridgeObjectRelease(a2);
  v20 = HIDWORD(v8) & 1;
LABEL_39:
  v21 = v8;
  if ((_DWORD)v20)
    v21 = 0;
  return v21 | ((unint64_t)v20 << 32);
}

uint64_t sub_100002E78()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for URL(0);
  v1 = sub_100003574(&qword_1000260C0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
  return dispatch thunk of CustomStringConvertible.description.getter(v0, v1);
}

uint64_t sub_100002EC8()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for URLParser()
{
  return objc_opt_self(_TtC16HealthENLauncher9URLParser);
}

void type metadata accessor for UIBackgroundTaskIdentifier(uint64_t a1)
{
  sub_100009DD4(a1, &qword_100025A20, (uint64_t)&unk_100020A00);
}

void type metadata accessor for CFRunLoopSource(uint64_t a1)
{
  sub_100009DD4(a1, &qword_100025A28, (uint64_t)&unk_100020A28);
}

void type metadata accessor for CFUserNotification(uint64_t a1)
{
  sub_100009DD4(a1, &qword_100025A30, (uint64_t)&unk_100020A58);
}

uint64_t sub_100002F34(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_10001AADC, a1);
  return _CFObject.hashValue.getter(a1, WitnessTable);
}

uint64_t sub_100002F70(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_10001AADC, a2);
  return _CFObject.hash(into:)(a1, a2, WitnessTable);
}

Swift::Int sub_100002FB8(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, a1);
  WitnessTable = swift_getWitnessTable(&unk_10001AADC, a2);
  _CFObject.hash(into:)(v5, a2, WitnessTable);
  return Hasher._finalize()();
}

NSNumber sub_100003010()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_100003018(uint64_t a1, uint64_t a2)
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

uint64_t sub_100003068(uint64_t a1, uint64_t a2)
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

uint64_t sub_1000030BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static Int._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  return result;
}

uint64_t sub_1000030E0@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

id sub_1000030E8()
{
  id *v0;

  return *v0;
}

uint64_t sub_1000030F0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t WitnessTable;

  v4 = *a1;
  v5 = *a2;
  WitnessTable = swift_getWitnessTable(&unk_10001AADC, a3);
  return static _CFObject.== infix(_:_:)(v4, v5, a3, WitnessTable);
}

uint64_t sub_10000313C()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(ENTestResultErrorDomain);
}

uint64_t sub_10000314C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003574(&qword_100025B08, (uint64_t (*)(uint64_t))type metadata accessor for ENTestResultError, (uint64_t)&unk_10001AD3C);
  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_10000318C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003574(&qword_100025B08, (uint64_t (*)(uint64_t))type metadata accessor for ENTestResultError, (uint64_t)&unk_10001AD3C);
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_1000031CC(void *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003574(&qword_100025B08, (uint64_t (*)(uint64_t))type metadata accessor for ENTestResultError, (uint64_t)&unk_10001AD3C);
  return _BridgedStoredNSError.init(_bridgedNSError:)(a1, a2, v4);
}

uint64_t sub_100003230(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003574(&qword_100025B08, (uint64_t (*)(uint64_t))type metadata accessor for ENTestResultError, (uint64_t)&unk_10001AD3C);
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

uint64_t sub_100003284()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(ENErrorDomain);
}

uint64_t sub_100003294(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003574(&qword_100025AB8, (uint64_t (*)(uint64_t))type metadata accessor for ENError, (uint64_t)&unk_10001AB84);
  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_1000032D4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003574(&qword_100025AB8, (uint64_t (*)(uint64_t))type metadata accessor for ENError, (uint64_t)&unk_10001AB84);
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100003314(void *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003574(&qword_100025AB8, (uint64_t (*)(uint64_t))type metadata accessor for ENError, (uint64_t)&unk_10001AB84);
  return _BridgedStoredNSError.init(_bridgedNSError:)(a1, a2, v4);
}

uint64_t sub_100003378()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_1000033AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003574(&qword_100025AB8, (uint64_t (*)(uint64_t))type metadata accessor for ENError, (uint64_t)&unk_10001AB84);
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_1000033FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD v7[10];

  v7[9] = *v3;
  Hasher.init(_seed:)(v7, a1);
  dispatch thunk of Hashable.hash(into:)(v7, a2, a3);
  return Hasher._finalize()();
}

_QWORD *sub_100003458@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100003468(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_100003474(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100003488(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100003574(&qword_100025A50, (uint64_t (*)(uint64_t))type metadata accessor for UIBackgroundTaskIdentifier, (uint64_t)&unk_10001A800);
  v3 = sub_100003574(&qword_100025A58, (uint64_t (*)(uint64_t))type metadata accessor for UIBackgroundTaskIdentifier, (uint64_t)&unk_10001A7A0);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for Int);
}

uint64_t sub_10000351C()
{
  return sub_100003574(&qword_100025A38, (uint64_t (*)(uint64_t))type metadata accessor for UIBackgroundTaskIdentifier, (uint64_t)&unk_10001A764);
}

uint64_t sub_100003548()
{
  return sub_100003574(&qword_100025A40, (uint64_t (*)(uint64_t))type metadata accessor for UIBackgroundTaskIdentifier, (uint64_t)"yp");
}

uint64_t sub_100003574(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_1000035B4()
{
  return sub_100003574(&qword_100025A48, (uint64_t (*)(uint64_t))type metadata accessor for UIBackgroundTaskIdentifier, (uint64_t)&unk_10001A7D4);
}

uint64_t sub_1000035E0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003574(&qword_100025B10, (uint64_t (*)(uint64_t))type metadata accessor for ENTestResultError, (uint64_t)&unk_10001AE7C);
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100003620(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003574(&qword_100025B10, (uint64_t (*)(uint64_t))type metadata accessor for ENTestResultError, (uint64_t)&unk_10001AE7C);
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100003660(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003574(&qword_100025B08, (uint64_t (*)(uint64_t))type metadata accessor for ENTestResultError, (uint64_t)&unk_10001AD3C);
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_1000036A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_100003574(&qword_100025B08, (uint64_t (*)(uint64_t))type metadata accessor for ENTestResultError, (uint64_t)&unk_10001AD3C);
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_1000036F8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003574(&qword_100025AC0, (uint64_t (*)(uint64_t))type metadata accessor for ENError, (uint64_t)&unk_10001ACC4);
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100003738(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003574(&qword_100025AC0, (uint64_t (*)(uint64_t))type metadata accessor for ENError, (uint64_t)&unk_10001ACC4);
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100003778(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003574(&qword_100025AB8, (uint64_t (*)(uint64_t))type metadata accessor for ENError, (uint64_t)&unk_10001AB84);
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_1000037B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_100003574(&qword_100025AB8, (uint64_t (*)(uint64_t))type metadata accessor for ENError, (uint64_t)&unk_10001AB84);
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_100003810()
{
  _QWORD *v0;

  return Int.hashValue.getter(*v0);
}

void sub_100003818()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

uint64_t sub_100003840(uint64_t a1)
{
  _QWORD *v1;

  return static Hasher._hash(seed:_:)(a1, *v1);
}

uint64_t sub_100003848(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
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
  unint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t result;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  unint64_t v55;
  _QWORD v57[4];

  v57[3] = a4;
  if (a1 < 0)
    goto LABEL_44;
  v10 = swift_allocObject(&unk_1000214B0, 24, 7);
  *(_QWORD *)(v10 + 16) = &_swiftEmptyArrayStorage;
  v54 = swift_allocObject(&unk_1000214D8, 24, 7);
  *(_QWORD *)(v54 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v33 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v33 = 11;
    sub_100003CE4(v33 | (v11 << 16), v54, a2 & 1, v10, a5, a6);
    swift_bridgeObjectRelease(a6);
    v14 = *(char **)(v10 + 16);
    swift_bridgeObjectRetain(v14);
    swift_release(v10);
    v34 = v54;
LABEL_41:
    swift_release(v34);
    return (uint64_t)v14;
  }
  v49 = a1;
  v50 = v10;
  v13 = 7;
  if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
    v13 = 11;
  v48 = v13 | (v12 << 16);
  v55 = 4 * v12;
  v14 = (char *)&_swiftEmptyArrayStorage;
  v15 = 15;
  v16 = 15;
  v17 = 15;
  while (1)
  {
    v18 = String.subscript.getter(v15, a5, a6);
    v20 = v19;
    v57[0] = v18;
    v57[1] = v19;
    v21 = a3(v57);
    if (v6)
    {
      swift_release(v50);
      swift_release(v54);
      swift_bridgeObjectRelease(v20);
      swift_bridgeObjectRelease(a6);
      return (uint64_t)v14;
    }
    v22 = v21;
    swift_bridgeObjectRelease(v20);
    if ((v22 & 1) != 0)
      break;
    v15 = String.index(after:)(v15, a5, a6);
LABEL_11:
    if (v55 == v15 >> 14)
      goto LABEL_31;
  }
  if (v16 >> 14 == v15 >> 14 && (a2 & 1) != 0)
  {
    v15 = String.index(after:)(v15, a5, a6);
    *(_QWORD *)(v54 + 16) = v15;
    v16 = v15;
    v17 = v15;
    goto LABEL_11;
  }
  if (v15 >> 14 < v16 >> 14)
    goto LABEL_43;
  v23 = String.subscript.getter(v16, v15, a5, a6);
  v51 = v24;
  v52 = v23;
  v26 = v25;
  v28 = v27;
  if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) == 0)
    v14 = sub_100003E3C(0, *((_QWORD *)v14 + 2) + 1, 1, v14);
  v30 = *((_QWORD *)v14 + 2);
  v29 = *((_QWORD *)v14 + 3);
  if (v30 >= v29 >> 1)
    v14 = sub_100003E3C((char *)(v29 > 1), v30 + 1, 1, v14);
  *((_QWORD *)v14 + 2) = v30 + 1;
  v31 = &v14[32 * v30];
  *((_QWORD *)v31 + 4) = v52;
  *((_QWORD *)v31 + 5) = v26;
  *((_QWORD *)v31 + 6) = v28;
  *((_QWORD *)v31 + 7) = v51;
  *(_QWORD *)(v50 + 16) = v14;
  v32 = String.index(after:)(v15, a5, a6);
  v15 = v32;
  *(_QWORD *)(v54 + 16) = v32;
  if (*((_QWORD *)v14 + 2) != v49)
  {
    v16 = v32;
    v17 = v32;
    goto LABEL_11;
  }
  v17 = v32;
  v16 = v32;
LABEL_31:
  if (v55 == v16 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease(a6);
    v35 = v50;
LABEL_40:
    swift_bridgeObjectRetain(v14);
    swift_release(v35);
    v34 = v54;
    goto LABEL_41;
  }
  if (v55 >= v17 >> 14)
  {
    v36 = String.subscript.getter(v17, v48, a5, a6);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    swift_bridgeObjectRelease(a6);
    if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) == 0)
      v14 = sub_100003E3C(0, *((_QWORD *)v14 + 2) + 1, 1, v14);
    v44 = *((_QWORD *)v14 + 2);
    v43 = *((_QWORD *)v14 + 3);
    if (v44 >= v43 >> 1)
      v14 = sub_100003E3C((char *)(v43 > 1), v44 + 1, 1, v14);
    *((_QWORD *)v14 + 2) = v44 + 1;
    v45 = &v14[32 * v44];
    *((_QWORD *)v45 + 4) = v36;
    *((_QWORD *)v45 + 5) = v38;
    *((_QWORD *)v45 + 6) = v40;
    *((_QWORD *)v45 + 7) = v42;
    v35 = v50;
    *(_QWORD *)(v50 + 16) = v14;
    goto LABEL_40;
  }
LABEL_43:
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Range requires lowerBound <= upperBound", 39, 2, "Swift/Range.swift", 17, 2, 754, 0);
  __break(1u);
LABEL_44:
  LOBYTE(v47) = 2;
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Must take zero or more splits", 29, 2, "Swift/Collection.swift", 22, v47, 1552, 0);
  __break(1u);
  return result;
}

uint64_t sub_100003CE4(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v7;
  int v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t result;

  v7 = *(_QWORD *)(a2 + 16);
  v8 = (v7 >> 14 == a1 >> 14) & a3;
  if (v8 == 1)
    return v8 ^ 1u;
  if (a1 >> 14 >= v7 >> 14)
  {
    v10 = String.subscript.getter(v7, a1, a5, a6);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v17 = *(char **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v17);
    *(_QWORD *)(a4 + 16) = v17;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v17 = sub_100003E3C(0, *((_QWORD *)v17 + 2) + 1, 1, v17);
      *(_QWORD *)(a4 + 16) = v17;
    }
    v20 = *((_QWORD *)v17 + 2);
    v19 = *((_QWORD *)v17 + 3);
    if (v20 >= v19 >> 1)
    {
      v17 = sub_100003E3C((char *)(v19 > 1), v20 + 1, 1, v17);
      *(_QWORD *)(a4 + 16) = v17;
    }
    *((_QWORD *)v17 + 2) = v20 + 1;
    v21 = &v17[32 * v20];
    *((_QWORD *)v21 + 4) = v10;
    *((_QWORD *)v21 + 5) = v12;
    *((_QWORD *)v21 + 6) = v14;
    *((_QWORD *)v21 + 7) = v16;
    return v8 ^ 1u;
  }
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Range requires lowerBound <= upperBound", 39, 2, "Swift/Range.swift", 17, 2, 754, 0);
  __break(1u);
  return result;
}

char *sub_100003E3C(char *result, int64_t a2, char a3, char *a4)
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
      v10 = sub_10000937C(&qword_100025A70);
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
    sub_100004768(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_100003F48(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v6 = sub_1000042AC(v4, v5);
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
  v12 = sub_10000402C(v8, v9, a3);
  swift_bridgeObjectRelease(v7);
  return v12 | ((((unint64_t)v12 >> 32) & 1) << 32);
}

unsigned __int8 *sub_10000402C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned int v12;
  unsigned __int8 v13;
  unint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  unint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned int v28;
  unsigned int v29;
  char v30;
  unint64_t v31;
  unsigned __int8 v32;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v16 = a2 - 1;
      if (a2 != 1)
      {
        v17 = a3 + 87;
        if (a3 > 10)
        {
          v18 = a3 + 55;
        }
        else
        {
          v17 = 97;
          v18 = 65;
        }
        if (a3 <= 10)
          v19 = a3 + 48;
        else
          v19 = 58;
        if (result)
        {
          v8 = 0;
          v20 = result + 1;
          do
          {
            v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                v12 = 0;
                v13 = 1;
                if (v21 < 0x61 || v21 >= v17)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v22 = -87;
              }
              else
              {
                v22 = -55;
              }
            }
            else
            {
              v22 = -48;
            }
            v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v24 = v21 + v22;
            v8 = v23 + v24;
            if (__CFADD__((_DWORD)v23, v24))
              goto LABEL_72;
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v26 = a3 + 55;
        }
        else
        {
          v25 = 97;
          v26 = 65;
        }
        if (a3 <= 10)
          v27 = a3 + 48;
        else
          v27 = 58;
        if (result)
        {
          v28 = 0;
          do
          {
            v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                v12 = 0;
                v13 = 1;
                if (v29 < 0x61 || v29 >= v25)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v30 = -87;
              }
              else
              {
                v30 = -55;
              }
            }
            else
            {
              v30 = -48;
            }
            v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v32 = v29 + v30;
            v28 = v31 + v32;
            if (__CFADD__((_DWORD)v31, v32))
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          v8 = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v15 = v10 + v11;
            v8 = v14 - v15;
            if (v14 < v15)
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000042AC(uint64_t a1, unint64_t a2)
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
  v9 = sub_100004328(v4, v7, v8, v5);
  swift_bridgeObjectRelease(v6);
  return v9;
}

uint64_t sub_100004328(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
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
    v12 = sub_10000446C(a1, a2, a3, a4);
    if (v12)
    {
      v9 = v12;
      v8 = (unint64_t)sub_100017EE4(v12, 0);
      v5 = sub_100004558((unint64_t)v15, v8 + 32, v9, a1, a2, v5, a4);
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

unint64_t sub_10000446C(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_100017F48(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_100017F48(a2, a3, a4);
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

unint64_t sub_100004558(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      result = sub_100017F48(v12, a6, a7);
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
    result = sub_100017F48(v12, a6, a7);
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

uint64_t sub_100004768(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_100004858(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = static ENUIPublicHealthAgencyModel.activeRegion;
  if (static ENUIPublicHealthAgencyModel.activeRegion)
  {
    if (*(_BYTE *)(static ENUIPublicHealthAgencyModel.activeRegion
                  + direct field offset for ENUIPublicHealthAgencyModel.isAssociatedDomainAllowed) == 1)
    {
      objc_msgSend(static ENUIPublicHealthAgencyModel.activeRegion, "supportsFeatures:", 2);
      return 1;
    }
    else
    {
      v11 = Logger.launcher.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v11, v6);
      v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
      v13 = Logger.logObject.getter(v12);
      v14 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)swift_slowAlloc(12, -1);
        v25 = swift_slowAlloc(32, -1);
        v27 = v25;
        v24 = v15;
        *(_DWORD *)v15 = 136315138;
        v23 = v15 + 4;
        v16 = sub_100003574(&qword_1000260C0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
        v17 = dispatch thunk of CustomStringConvertible.description.getter(v2, v16);
        v19 = v18;
        v26 = sub_100017A54(v17, v18, &v27);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v23);
        swift_bridgeObjectRelease(v19);
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        v20 = v24;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "URL not enabled: %s", v24, 0xCu);
        v21 = v25;
        swift_arrayDestroy(v25, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v21, -1, -1);
        swift_slowDealloc(v20, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      return 4;
    }
  }
  return result;
}

uint64_t sub_100004B30(NSObject *a1)
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
  _QWORD *v17;
  unsigned __int8 *v18;
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
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
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
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  unsigned int (**v100)(char *, uint64_t, uint64_t);
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  unsigned __int8 *v105;
  uint64_t (*v106)(_QWORD, _QWORD);
  uint64_t v107;
  NSObject *v108;
  os_log_type_t v109;
  uint64_t v110;
  uint8_t *v111;
  uint64_t v112;
  uint64_t v113;
  NSObject *v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  Swift::String v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t (*v127)(_QWORD, _QWORD);
  uint64_t v128;
  uint64_t (*v129)(void);
  id v130;
  int v131;
  uint64_t v132;
  uint64_t v133;
  unsigned __int8 *v134;
  uint64_t (*v135)(_QWORD, _QWORD);
  NSObject *v136;
  uint64_t v137;
  NSObject *v138;
  os_log_type_t v139;
  uint8_t *v140;
  uint64_t v141;
  uint64_t v142;
  unint64_t v143;
  unint64_t v144;
  NSObject *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t countAndFlagsBits;
  unsigned __int8 *v151;
  void *object;
  uint64_t v153;
  NSObject *v154;
  os_log_type_t v155;
  uint64_t v156;
  void *v157;
  uint8_t *v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  unint64_t v162;
  NSObject *v163;
  char *v164;
  NSObject *v165;
  uint64_t v166;
  uint64_t v167;
  void (*v168)(char *, uint64_t);
  uint64_t (*v169)(_QWORD, _QWORD);
  unsigned __int8 *v170;
  char *v171;
  uint64_t v172;
  NSObject *v173;
  os_log_type_t v174;
  _BOOL4 v175;
  uint8_t *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  unint64_t v180;
  unint64_t v181;
  uint64_t v182;
  char *v183;
  uint64_t v184;
  char *v185;
  void (**v186)(char *, uint64_t);
  uint64_t v187;
  char *v188;
  char *v189;
  void *v190;
  uint64_t v191;
  uint64_t v192;
  NSObject *v193;
  uint64_t v194;
  _QWORD *v195;
  id *v196;
  char *v197;
  uint64_t v198;
  uint64_t v199;
  Swift::String v200;
  Swift::Bool v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  Swift::String v205;
  Swift::Bool v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  Swift::String v210;
  Swift::Bool v211;
  uint64_t v212;
  char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  char *v217;
  NSObject *v218;
  uint64_t (*v219)(_QWORD, _QWORD);
  char *v220;
  unsigned __int8 *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  NSObject *v226;
  uint64_t v227;
  os_log_type_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  _QWORD *v236;
  os_log_type_t v237;
  uint8_t *v238;
  uint64_t v239;
  id *v240;
  uint64_t (*v241)(_QWORD, _QWORD);
  uint64_t v242;
  unint64_t v243;
  unint64_t v244;
  NSObject *v245;
  unsigned __int8 *v246;
  char *v247;
  uint64_t v248;
  uint64_t result;
  uint64_t v250;
  uint64_t v251;
  char *v252;
  unsigned __int8 *v253;
  char *v254;
  char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  NSObject *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  _QWORD *v267;
  os_log_type_t v268;
  uint8_t *v269;
  uint64_t v270;
  uint64_t (*v271)(_QWORD, _QWORD);
  uint64_t v272;
  char *v273;
  uint64_t v274;
  unint64_t v275;
  unint64_t v276;
  NSObject *v277;
  uint64_t v278;
  unint64_t v279;
  uint64_t v280;
  uint64_t v281;
  char *v282;
  char *v283;
  char *v284;
  void *v285;
  uint64_t v286;
  void *v287;
  _QWORD *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  char *v293;
  uint64_t (*v294)(_QWORD, _QWORD);
  char *v295;
  uint64_t v296;
  uint64_t v297;
  NSObject *v298;
  os_log_type_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  _QWORD *v305;
  os_log_type_t v306;
  uint8_t *v307;
  uint64_t v308;
  char *v309;
  uint64_t v310;
  unint64_t v311;
  unint64_t v312;
  id v313;
  NSObject *v314;
  char *v315;
  uint64_t v316;
  char *v317;
  char *v318;
  char *v319;
  uint64_t v320;
  unint64_t v321;
  uint64_t v322;
  unint64_t v323;
  uint64_t v324;
  uint64_t (*v325)(char *, unint64_t, uint64_t);
  char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  char v331;
  uint64_t v332;
  uint64_t v333;
  char *v334;
  uint64_t (*v335)(_QWORD, _QWORD);
  char *v336;
  unsigned __int8 *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  NSObject *v342;
  uint64_t v343;
  os_log_type_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  _QWORD *v351;
  os_log_type_t v352;
  uint8_t *v353;
  uint64_t v354;
  char *v355;
  uint64_t (*v356)(_QWORD, _QWORD);
  uint64_t v357;
  unint64_t v358;
  unint64_t v359;
  NSObject *v360;
  unsigned __int8 *v361;
  char *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  Swift::String v366;
  Swift::Bool v367;
  unint64_t v368;
  char v369;
  char v370;
  uint64_t v371;
  uint64_t v372;
  unsigned __int8 *v373;
  void (*v374)(char *, NSObject *, uint64_t (*)(_QWORD, _QWORD));
  char *v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  NSObject *v380;
  os_log_type_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t inited;
  uint64_t v387;
  _QWORD *v388;
  os_log_type_t v389;
  uint8_t *v390;
  uint64_t v391;
  char *v392;
  uint64_t v393;
  unint64_t v394;
  unint64_t v395;
  NSObject *v396;
  NSObject *v397;
  char *v398;
  uint64_t v399;
  void *v400;
  unint64_t v401;
  uint64_t v402;
  uint64_t v403;
  char *v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  char v410;
  uint64_t v411;
  char *v412;
  uint64_t (*v413)(_QWORD, _QWORD);
  char *v414;
  unsigned __int8 *v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  NSObject *v420;
  os_log_type_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  _QWORD *v428;
  os_log_type_t v429;
  uint8_t *v430;
  uint64_t v431;
  char *v432;
  uint64_t (*v433)(_QWORD, _QWORD);
  uint64_t v434;
  unint64_t v435;
  unint64_t v436;
  NSObject *v437;
  unsigned __int8 *v438;
  unint64_t v439;
  unint64_t v440;
  uint64_t v441;
  char v442;
  NSObject *v443;
  uint64_t v444;
  char *v445;
  uint64_t v446;
  uint64_t (*v447)(char *, char *, uint64_t);
  unsigned __int8 *v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  char v453;
  uint64_t v454;
  char *v455;
  uint64_t (*v456)(_QWORD, _QWORD);
  char *v457;
  unsigned __int8 *v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  NSObject *v463;
  os_log_type_t v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  _QWORD *v471;
  os_log_type_t v472;
  uint8_t *v473;
  uint64_t v474;
  char *v475;
  uint64_t (*v476)(_QWORD, _QWORD);
  uint64_t v477;
  unint64_t v478;
  unint64_t v479;
  id v480;
  NSObject *v481;
  uint64_t v482;
  char *v483;
  uint64_t (*v484)(_QWORD, _QWORD);
  char *v485;
  unsigned __int8 *v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  NSObject *v491;
  os_log_type_t v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  uint64_t v497;
  uint64_t v498;
  _QWORD *v499;
  os_log_type_t v500;
  uint8_t *v501;
  uint64_t v502;
  char *v503;
  uint64_t (*v504)(_QWORD, _QWORD);
  uint64_t v505;
  unint64_t v506;
  unint64_t v507;
  id v508;
  NSObject *v509;
  NSObject *v510;
  uint64_t v511;
  char *v512;
  uint64_t v513;
  uint64_t v514;
  unint64_t v515;
  unint64_t v516;
  uint64_t v517;
  uint64_t v518;
  NSObject *v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  _QWORD *v526;
  os_log_type_t v527;
  uint8_t *v528;
  NSObject *v529;
  char *v530;
  uint64_t v531;
  uint64_t v532;
  NSObject *v533;
  os_log_type_t v534;
  uint8_t *v535;
  char *v536;
  NSString v537;
  objc_class *v538;
  NSObject *v539;
  Class v540;
  uint64_t v541;
  NSObject *v542;
  int v543;
  uint64_t v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  _QWORD *v550;
  uint8_t *v551;
  uint64_t v552;
  id *v553;
  id v554;
  uint64_t v555;
  unint64_t v556;
  unint64_t v557;
  uint64_t v558;
  uint64_t v559;
  unint64_t v560;
  unint64_t v561;
  uint64_t v562;
  char *v563;
  uint64_t v564;
  uint64_t (*v565)(char *, char *, uint64_t);
  char *v566;
  unsigned __int8 *v567;
  uint64_t v568;
  uint64_t v569;
  uint64_t v570;
  uint64_t v571;
  char v572;
  NSObject *v573;
  uint64_t v574;
  char *v575;
  uint64_t v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  uint64_t v580;
  unsigned __int8 *v581;
  uint64_t v582;
  uint64_t v583;
  uint64_t v584;
  uint64_t v585;
  char v586;
  uint64_t v587;
  uint64_t v588;
  uint64_t v589;
  NSObject *v590;
  uint64_t v591;
  NSObject *v592;
  os_log_type_t v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  uint64_t v598;
  uint64_t v599;
  uint64_t v600;
  _QWORD *v601;
  os_log_type_t v602;
  uint8_t *v603;
  NSObject *v604;
  uint64_t v605;
  uint64_t v606;
  unint64_t v607;
  unint64_t v608;
  id v609;
  uint64_t (*v610)(_QWORD, _QWORD);
  NSObject *v611;
  uint64_t v612;
  uint64_t v613;
  uint64_t v614;
  uint64_t v615;
  uint64_t v616;
  unint64_t v617;
  unint64_t v618;
  uint64_t v619;
  uint64_t v620;
  uint64_t v621;
  uint64_t v622;
  uint64_t v623;
  uint64_t v624;
  uint64_t v625;
  uint64_t v626;
  uint64_t v627;
  _QWORD *v628;
  uint8_t *v629;
  id v630;
  uint64_t v631;
  unint64_t v632;
  unsigned int v633;
  uint64_t v634;
  uint64_t v635;
  uint64_t v636;
  uint64_t v637;
  uint64_t v638;
  uint64_t v639;
  uint64_t v640;
  _QWORD *v641;
  uint8_t *v642;
  const char *v643;
  uint64_t v644;
  unint64_t v645;
  unint64_t v646;
  id v647;
  NSObject *v648;
  NSObject *v649;
  Class v650;
  objc_class *v651;
  uint64_t v652;
  uint64_t v653;
  uint64_t v654;
  uint64_t v655;
  uint64_t v656;
  uint64_t v657;
  int v658;
  uint64_t v659;
  char *v660;
  char *v661;
  char *v662;
  char *v663;
  char *v664;
  char *v665;
  char *v666;
  char *v667;
  char *v668;
  uint64_t v669;
  char *v670;
  char *v671;
  char *v672;
  char *v673;
  char *v674;
  char *v675;
  char *v676;
  char *v677;
  char *v678;
  char *v679;
  char *v680;
  char *v681;
  char *v682;
  char *v683;
  char *v684;
  char *v685;
  char *v686;
  char *v687;
  char *v688;
  char *v689;
  char *v690;
  char *v691;
  char *v692;
  uint64_t v693;
  char *v694;
  Swift::String v695;
  char *v696;
  char *v697;
  NSObject *v698;
  uint64_t v699;
  char *v700;
  char *v701;
  char *v702;
  id *v703;
  NSObject *v704;
  uint64_t v705;
  char *v706;
  NSObject *v707;
  void (**v708)(char *, uint64_t);
  uint64_t (*v709)(_QWORD, _QWORD);
  unsigned __int8 *isa;
  uint64_t v711;
  uint64_t v712;
  uint64_t v713;
  uint64_t v714;
  _BYTE v715[16];
  uint64_t v716;
  unint64_t v717;
  int v718;
  uint64_t v719;
  uint64_t v720;
  uint64_t v721;
  uint64_t v722;
  char v723[80];
  char v724[88];

  v699 = type metadata accessor for URLQueryItem(0);
  v693 = *(_QWORD *)(v699 - 8);
  v2 = __chkstk_darwin(v699);
  v676 = (char *)&v652 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __chkstk_darwin(v2);
  v678 = (char *)&v652 - v5;
  v6 = __chkstk_darwin(v4);
  v664 = (char *)&v652 - v7;
  v8 = __chkstk_darwin(v6);
  v677 = (char *)&v652 - v9;
  v10 = __chkstk_darwin(v8);
  v663 = (char *)&v652 - v11;
  __chkstk_darwin(v10);
  v692 = (char *)&v652 - v12;
  v13 = sub_10000937C(&qword_100025A60);
  v14 = __chkstk_darwin(v13);
  v669 = (uint64_t)&v652 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v682 = (char *)&v652 - v16;
  v17 = (_QWORD *)type metadata accessor for URL(0);
  v18 = (unsigned __int8 *)*(v17 - 1);
  v709 = (uint64_t (*)(_QWORD, _QWORD))v17;
  isa = v18;
  v19 = *((_QWORD *)v18 + 8);
  v20 = __chkstk_darwin(v17);
  v707 = ((char *)&v652 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = __chkstk_darwin(v20);
  v698 = ((char *)&v652 - v22);
  v23 = __chkstk_darwin(v21);
  v695._object = (char *)&v652 - v24;
  v25 = __chkstk_darwin(v23);
  v671 = (char *)&v652 - v26;
  v27 = __chkstk_darwin(v25);
  v665 = (char *)&v652 - v28;
  v29 = __chkstk_darwin(v27);
  v673 = (char *)&v652 - v30;
  v31 = __chkstk_darwin(v29);
  v668 = (char *)&v652 - v32;
  v33 = __chkstk_darwin(v31);
  v697 = (char *)&v652 - v34;
  v35 = __chkstk_darwin(v33);
  v679 = (char *)&v652 - v36;
  v37 = __chkstk_darwin(v35);
  v687 = (char *)&v652 - v38;
  v39 = __chkstk_darwin(v37);
  v683 = (char *)&v652 - v40;
  v41 = __chkstk_darwin(v39);
  v703 = (id *)((char *)&v652 - v42);
  v43 = __chkstk_darwin(v41);
  v694 = (char *)&v652 - v44;
  v45 = __chkstk_darwin(v43);
  v700 = (char *)&v652 - v46;
  v47 = __chkstk_darwin(v45);
  v680 = (char *)&v652 - v48;
  v49 = __chkstk_darwin(v47);
  v689 = (char *)&v652 - v50;
  v51 = __chkstk_darwin(v49);
  v684 = (char *)&v652 - v52;
  v53 = __chkstk_darwin(v51);
  v691 = (char *)&v652 - v54;
  v55 = __chkstk_darwin(v53);
  v685 = (char *)&v652 - v56;
  __chkstk_darwin(v55);
  v701 = (char *)&v652 - v57;
  v58 = type metadata accessor for Logger(0);
  v59 = *(_QWORD *)(v58 - 8);
  v60 = __chkstk_darwin(v58);
  v706 = (char *)&v652 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __chkstk_darwin(v60);
  v64 = (char *)&v652 - v63;
  v65 = __chkstk_darwin(v62);
  v695._countAndFlagsBits = (uint64_t)&v652 - v66;
  v67 = __chkstk_darwin(v65);
  v670 = (char *)&v652 - v68;
  v69 = __chkstk_darwin(v67);
  v672 = (char *)&v652 - v70;
  v71 = __chkstk_darwin(v69);
  v675 = (char *)&v652 - v72;
  v73 = __chkstk_darwin(v71);
  v661 = (char *)&v652 - v74;
  v75 = __chkstk_darwin(v73);
  v662 = (char *)&v652 - v76;
  v77 = __chkstk_darwin(v75);
  v674 = (char *)&v652 - v78;
  v79 = __chkstk_darwin(v77);
  v667 = (char *)&v652 - v80;
  v81 = __chkstk_darwin(v79);
  v666 = (char *)&v652 - v82;
  v83 = __chkstk_darwin(v81);
  v696 = (char *)&v652 - v84;
  v85 = __chkstk_darwin(v83);
  v686 = (char *)&v652 - v86;
  v87 = __chkstk_darwin(v85);
  v702 = (char *)&v652 - v88;
  v89 = __chkstk_darwin(v87);
  v681 = (char *)&v652 - v90;
  v91 = __chkstk_darwin(v89);
  v688 = (char *)&v652 - v92;
  v93 = __chkstk_darwin(v91);
  v690 = (char *)&v652 - v94;
  __chkstk_darwin(v93);
  v704 = ((char *)&v652 - v95);
  v96 = sub_10000937C(&qword_1000260D0);
  __chkstk_darwin(v96);
  v98 = (char *)&v652 - ((v97 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = type metadata accessor for URLComponents(0);
  v100 = *(unsigned int (***)(char *, uint64_t, uint64_t))(v99 - 8);
  __chkstk_darwin(v99);
  v102 = (char *)&v652 - ((v101 + 15) & 0xFFFFFFFFFFFFFFF0);
  URLComponents.init(url:resolvingAgainstBaseURL:)(a1, 0);
  if (v100[6](v98, 1, v99) == 1)
  {
    v103 = sub_100009580((uint64_t)v98, &qword_1000260D0);
    v104 = Logger.launcher.unsafeMutableAddressor(v103);
    (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v706, v104, v58);
    v106 = v709;
    v105 = isa;
    v107 = (*((uint64_t (**)(NSObject *, NSObject *, uint64_t (*)(_QWORD, _QWORD)))isa + 2))(v707, a1, v709);
    v108 = Logger.logObject.getter(v107);
    v109 = static os_log_type_t.error.getter();
    v110 = v58;
    if (os_log_type_enabled(v108, v109))
    {
      v111 = (uint8_t *)swift_slowAlloc(12, -1);
      v112 = swift_slowAlloc(32, -1);
      v716 = v112;
      v708 = (void (**)(char *, uint64_t))v59;
      *(_DWORD *)v111 = 136315138;
      v705 = v110;
      v113 = sub_100003574(&qword_1000260C0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v114 = v707;
      v115 = dispatch thunk of CustomStringConvertible.description.getter(v106, v113);
      v117 = v116;
      v714 = sub_100017A54(v115, v116, &v716);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v714, v715, v111 + 4);
      swift_bridgeObjectRelease(v117);
      (*((void (**)(NSObject *, uint64_t (*)(_QWORD, _QWORD)))isa + 1))(v114, v106);
      _os_log_impl((void *)&_mh_execute_header, v108, v109, "Could not get components from url: %s", v111, 0xCu);
      swift_arrayDestroy(v112, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v112, -1, -1);
      swift_slowDealloc(v111, -1, -1);

      v708[1](v706, v705);
LABEL_12:
      v146 = 3;
      LOBYTE(v147) = 1;
      goto LABEL_52;
    }
    (*((void (**)(NSObject *, uint64_t (*)(_QWORD, _QWORD)))v105 + 1))(v707, v106);

    (*(void (**)(char *, uint64_t))(v59 + 8))(v706, v58);
    goto LABEL_22;
  }
  v707 = a1;
  v708 = (void (**)(char *, uint64_t))v59;
  v705 = v58;
  v706 = (char *)v100;
  v118 = ((uint64_t (*)(char *, char *, uint64_t))v100[4])(v102, v98, v99);
  v119 = URLComponents.scheme.getter(v118);
  v121 = v102;
  if (!v120)
  {
    v660 = v102;
    v132 = Logger.launcher.unsafeMutableAddressor(v119);
    v133 = v705;
    ((void (*)(char *, uint64_t, uint64_t))v708[2])(v64, v132, v705);
    v135 = v709;
    v134 = isa;
    v136 = v698;
    v137 = (*((uint64_t (**)(NSObject *, NSObject *, uint64_t (*)(_QWORD, _QWORD)))isa + 2))(v698, v707, v709);
    v138 = Logger.logObject.getter(v137);
    v139 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v138, v139))
    {
      v140 = (uint8_t *)swift_slowAlloc(12, -1);
      v707 = swift_slowAlloc(32, -1);
      v716 = (uint64_t)v707;
      v659 = v99;
      *(_DWORD *)v140 = 136315138;
      v141 = sub_100003574(&qword_1000260C0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v142 = dispatch thunk of CustomStringConvertible.description.getter(v135, v141);
      v144 = v143;
      v714 = sub_100017A54(v142, v143, &v716);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v714, v715, v140 + 4);
      swift_bridgeObjectRelease(v144);
      (*((void (**)(NSObject *, uint64_t (*)(_QWORD, _QWORD)))isa + 1))(v136, v135);
      _os_log_impl((void *)&_mh_execute_header, v138, v139, "Could not get scheme from components: %s", v140, 0xCu);
      v145 = v707;
      swift_arrayDestroy(v707, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v145, -1, -1);
      swift_slowDealloc(v140, -1, -1);

      v708[1](v64, v705);
      (*((void (**)(char *, uint64_t))v706 + 1))(v660, v659);
      goto LABEL_12;
    }

    (*((void (**)(NSObject *, uint64_t (*)(_QWORD, _QWORD)))v134 + 1))(v136, v135);
    v708[1](v64, v133);
    (*((void (**)(char *, uint64_t))v706 + 1))(v660, v99);
LABEL_22:
    LOBYTE(v147) = 1;
    v146 = 3;
    goto LABEL_52;
  }
  v122 = v120;
  v659 = v99;
  v123 = String.lowercased()();
  v124 = swift_bridgeObjectRelease(v122);
  URLComponents.host.getter(v124);
  v126 = v705;
  v127 = v709;
  if (!v125)
  {
    v148 = swift_bridgeObjectRelease(v123._object);
    v149 = Logger.launcher.unsafeMutableAddressor(v148);
    countAndFlagsBits = v695._countAndFlagsBits;
    ((void (*)(uint64_t, uint64_t, uint64_t))v708[2])(v695._countAndFlagsBits, v149, v126);
    v151 = isa;
    object = v695._object;
    v153 = (*((uint64_t (**)(void *, NSObject *, uint64_t (*)(_QWORD, _QWORD)))isa + 2))(v695._object, v707, v127);
    v154 = Logger.logObject.getter(v153);
    v155 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v154, v155))
    {

      (*((void (**)(void *, uint64_t (*)(_QWORD, _QWORD)))v151 + 1))(object, v127);
      v708[1]((char *)countAndFlagsBits, v126);
      (*((void (**)(char *, uint64_t))v706 + 1))(v121, v659);
      goto LABEL_22;
    }
    v156 = swift_slowAlloc(12, -1);
    v660 = v121;
    v157 = object;
    v158 = (uint8_t *)v156;
    v707 = swift_slowAlloc(32, -1);
    v716 = (uint64_t)v707;
    *(_DWORD *)v158 = 136315138;
    v704 = (v158 + 4);
    v159 = sub_100003574(&qword_1000260C0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v160 = dispatch thunk of CustomStringConvertible.description.getter(v127, v159);
    v162 = v161;
    v714 = sub_100017A54(v160, v161, &v716);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v714, v715, v704);
    swift_bridgeObjectRelease(v162);
    (*((void (**)(void *, uint64_t (*)(_QWORD, _QWORD)))v151 + 1))(v157, v127);
    _os_log_impl((void *)&_mh_execute_header, v154, v155, "Could not get host from components: %s", v158, 0xCu);
    LOBYTE(v147) = 1;
    v163 = v707;
    swift_arrayDestroy(v707, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v163, -1, -1);
    swift_slowDealloc(v158, -1, -1);

    v708[1]((char *)countAndFlagsBits, v705);
LABEL_15:
    (*((void (**)(char *, uint64_t))v706 + 1))(v660, v659);
    v146 = 3;
    goto LABEL_52;
  }
  v128 = v125;
  v660 = v102;
  v695 = String.lowercased()();
  swift_bridgeObjectRelease(v128);
  if (!static ENUIPublicHealthAgencyModel.activeRegion)
  {
    v131 = 1;
    LODWORD(v698) = 1;
    goto LABEL_18;
  }
  LODWORD(v698) = *(unsigned __int8 *)(static ENUIPublicHealthAgencyModel.activeRegion
                                     + direct field offset for ENUIPublicHealthAgencyModel.isAssociatedDomainAllowed);
  v129 = *(uint64_t (**)(void))((swift_isaMask & *static ENUIPublicHealthAgencyModel.activeRegion) + 0x160);
  v130 = static ENUIPublicHealthAgencyModel.activeRegion;
  LOBYTE(v129) = v129();

  if ((v129 & 1) != 0)
  {
    v131 = 1;
LABEL_18:
    v164 = v700;
    v165 = v704;
    goto LABEL_25;
  }
  v165 = v704;
  if (static ENUIPublicHealthAgencyModel.activeRegion)
    v131 = *(unsigned __int8 *)(static ENUIPublicHealthAgencyModel.activeRegion
                              + direct field offset for ENUIPublicHealthAgencyModel.isPreauthorizationDomainAllowed);
  else
    v131 = 1;
  v164 = v700;
LABEL_25:
  v658 = v131;
  if (v123._countAndFlagsBits == 7564901 && v123._object == (void *)0xE300000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(7564901, 0xE300000000000000, v123._countAndFlagsBits, v123._object, 0) & 1) != 0)
  {
    v166 = swift_bridgeObjectRelease(v123._object);
    v167 = Logger.launcher.unsafeMutableAddressor(v166);
    v168 = v708[2];
    ((void (*)(NSObject *, uint64_t, uint64_t))v168)(v165, v167, v126);
    v169 = v709;
    v170 = isa;
    v171 = v701;
    v681 = (char *)*((_QWORD *)isa + 2);
    v172 = ((uint64_t (*)(char *, NSObject *, uint64_t (*)(_QWORD, _QWORD)))v681)(v701, v707, v709);
    v173 = Logger.logObject.getter(v172);
    v174 = static os_log_type_t.info.getter();
    v175 = os_log_type_enabled(v173, v174);
    v700 = (char *)v168;
    if (v175)
    {
      v176 = (uint8_t *)swift_slowAlloc(12, -1);
      v177 = swift_slowAlloc(32, -1);
      v716 = v177;
      *(_DWORD *)v176 = 136315138;
      v691 = (char *)(v176 + 4);
      v178 = sub_100003574(&qword_1000260C0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v179 = dispatch thunk of CustomStringConvertible.description.getter(v169, v178);
      v181 = v180;
      v714 = sub_100017A54(v179, v180, &v716);
      v182 = v705;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v714, v715, v691);
      swift_bridgeObjectRelease(v181);
      v183 = (char *)*((_QWORD *)v170 + 1);
      v184 = v182;
      v185 = v701;
      v701 = v183;
      ((void (*)(char *, uint64_t (*)(_QWORD, _QWORD)))v183)(v185, v169);
      _os_log_impl((void *)&_mh_execute_header, v173, v174, "Received deep link: %s", v176, 0xCu);
      swift_arrayDestroy(v177, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v177, -1, -1);
      swift_slowDealloc(v176, -1, -1);

      v186 = (void (**)(char *, uint64_t))v708[1];
      ((void (*)(NSObject *, uint64_t))v186)(v704, v182);
      v187 = v699;
    }
    else
    {
      v701 = (char *)*((_QWORD *)v170 + 1);
      ((void (*)(char *, uint64_t (*)(_QWORD, _QWORD)))v701)(v171, v169);

      v186 = (void (**)(char *, uint64_t))v708[1];
      ((void (*)(NSObject *, uint64_t))v186)(v704, v126);
      v187 = v699;
      v184 = v126;
    }
    v189 = v696;
    v188 = v697;
    v190 = v695._object;
    goto LABEL_32;
  }
  if (v123._countAndFlagsBits == 0x7370747468 && v123._object == (void *)0xE500000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x7370747468, 0xE500000000000000, v123._countAndFlagsBits, v123._object, 0) & 1) != 0|| v123._countAndFlagsBits == 1886680168 && v123._object == (void *)0xE400000000000000)
  {
    v250 = swift_bridgeObjectRelease(v123._object);
  }
  else
  {
    v370 = _stringCompareWithSmolCheck(_:_:expecting:)(1886680168, 0xE400000000000000, v123._countAndFlagsBits, v123._object, 0);
    v250 = swift_bridgeObjectRelease(v123._object);
    if ((v370 & 1) == 0)
    {
      v371 = swift_bridgeObjectRelease(v695._object);
      v372 = Logger.launcher.unsafeMutableAddressor(v371);
      ((void (*)(char *, uint64_t, uint64_t))v708[2])(v681, v372, v126);
      v373 = isa;
      v374 = (void (*)(char *, NSObject *, uint64_t (*)(_QWORD, _QWORD)))*((_QWORD *)isa + 2);
      v375 = v680;
      v374(v680, v707, v127);
      v374(v164, v375, v127);
      v376 = v373[80];
      v377 = (v376 + 16) & ~v376;
      v378 = swift_allocObject(&unk_100020A88, v377 + v19, v376 | 7);
      v379 = (*((uint64_t (**)(uint64_t, char *, uint64_t (*)(_QWORD, _QWORD)))v373 + 4))(v378 + v377, v375, v127);
      v380 = Logger.logObject.getter(v379);
      v381 = static os_log_type_t.error.getter();
      v382 = swift_allocObject(&unk_100020AB0, 17, 7);
      *(_BYTE *)(v382 + 16) = 32;
      v383 = swift_allocObject(&unk_100020AD8, 17, 7);
      *(_BYTE *)(v383 + 16) = 8;
      v384 = swift_allocObject(&unk_100020B00, 32, 7);
      *(_QWORD *)(v384 + 16) = sub_1000093C0;
      *(_QWORD *)(v384 + 24) = v378;
      v147 = swift_allocObject(&unk_100020B28, 32, 7);
      *(_QWORD *)(v147 + 16) = sub_1000093EC;
      *(_QWORD *)(v147 + 24) = v384;
      v385 = sub_10000937C(&qword_100026080);
      inited = swift_initStackObject(v385, v724);
      v387 = sub_1000179B4(inited, 3);
      *v388 = sub_1000093D4;
      v388[1] = v382;
      v388[2] = sub_10000A114;
      v388[3] = v383;
      v388[4] = sub_1000093F4;
      v388[5] = v147;
      swift_retain(v378);
      swift_retain(v384);
      swift_retain(v382);
      swift_retain(v383);
      swift_retain(v147);
      swift_bridgeObjectRelease(v387);
      v389 = v381;
      v707 = v380;
      if (os_log_type_enabled(v380, v381))
      {
        v390 = (uint8_t *)swift_slowAlloc(12, -1);
        v704 = swift_slowAlloc(32, -1);
        v716 = (uint64_t)v704;
        *(_WORD *)v390 = 258;
        v390[2] = 32;
        swift_release(v382);
        v390[3] = 8;
        swift_release(v383);
        v391 = sub_100003574(&qword_1000260C0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
        v392 = v700;
        v393 = dispatch thunk of CustomStringConvertible.description.getter(v127, v391);
        v395 = v394;
        v714 = sub_100017A54(v393, v394, &v716);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v714, v715, v390 + 4);
        swift_release(v378);
        swift_release(v384);
        swift_release(v147);
        swift_bridgeObjectRelease(v395);
        (*((void (**)(char *, uint64_t (*)(_QWORD, _QWORD)))isa + 1))(v392, v127);
        v396 = v707;
        _os_log_impl((void *)&_mh_execute_header, v707, v389, "URL not supported: %s", v390, 0xCu);
        LOBYTE(v147) = 1;
        v397 = v704;
        swift_arrayDestroy(v704, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v397, -1, -1);
        swift_slowDealloc(v390, -1, -1);

        v708[1](v681, v705);
LABEL_105:
        (*((void (**)(char *, uint64_t))v706 + 1))(v660, v659);
        v146 = 2;
        goto LABEL_52;
      }
      swift_release(v378);
      swift_release(v384);
      swift_release(v147);

      (*((void (**)(char *, uint64_t (*)(_QWORD, _QWORD)))isa + 1))(v700, v127);
      swift_release(v382);
      swift_release(v383);
      v708[1](v681, v705);
LABEL_125:
      (*((void (**)(char *, uint64_t))v706 + 1))(v660, v659);
      LOBYTE(v147) = 1;
      v146 = 2;
      goto LABEL_52;
    }
  }
  v251 = Logger.launcher.unsafeMutableAddressor(v250);
  v252 = (char *)v708[2];
  v657 = v251;
  v700 = v252;
  ((void (*)(char *))v252)(v690);
  v253 = isa;
  v254 = (char *)*((_QWORD *)isa + 2);
  v255 = v685;
  ((void (*)(char *, NSObject *, uint64_t (*)(_QWORD, _QWORD)))v254)(v685, v707, v127);
  v681 = v254;
  ((void (*)(char *, char *, uint64_t (*)(_QWORD, _QWORD)))v254)(v691, v255, v127);
  v256 = v253[80];
  v257 = (v256 + 16) & ~v256;
  v655 = v256 | 7;
  v656 = v257 + v19;
  v258 = swift_allocObject(&unk_100020B50, v257 + v19, v256 | 7);
  v680 = (char *)v257;
  v685 = (char *)*((_QWORD *)v253 + 4);
  v259 = ((uint64_t (*)(uint64_t, char *, uint64_t (*)(_QWORD, _QWORD)))v685)(v258 + v257, v255, v127);
  v260 = Logger.logObject.getter(v259);
  LODWORD(v704) = static os_log_type_t.info.getter();
  v261 = swift_allocObject(&unk_100020B78, 17, 7);
  *(_BYTE *)(v261 + 16) = 32;
  v262 = swift_allocObject(&unk_100020BA0, 17, 7);
  *(_BYTE *)(v262 + 16) = 8;
  v263 = swift_allocObject(&unk_100020BC8, 32, 7);
  *(_QWORD *)(v263 + 16) = sub_1000093C0;
  *(_QWORD *)(v263 + 24) = v258;
  v264 = swift_allocObject(&unk_100020BF0, 32, 7);
  *(_QWORD *)(v264 + 16) = sub_10000A108;
  *(_QWORD *)(v264 + 24) = v263;
  v654 = sub_10000937C(&qword_100026080);
  v265 = swift_initStackObject(v654, v723);
  v266 = sub_1000179B4(v265, 3);
  *v267 = sub_10000A114;
  v267[1] = v261;
  v267[2] = sub_10000A114;
  v267[3] = v262;
  v267[4] = sub_10000A110;
  v267[5] = v264;
  swift_retain(v258);
  swift_retain(v263);
  swift_retain(v261);
  swift_retain(v262);
  swift_retain(v264);
  swift_bridgeObjectRelease(v266);
  v268 = v704;
  v704 = v260;
  if (os_log_type_enabled(v260, v268))
  {
    v269 = (uint8_t *)swift_slowAlloc(12, -1);
    v270 = swift_slowAlloc(32, -1);
    v271 = v709;
    v653 = v270;
    v716 = v270;
    *(_WORD *)v269 = 258;
    v269[2] = 32;
    swift_release(v261);
    v269[3] = 8;
    swift_release(v262);
    v701 = (char *)(v269 + 4);
    v272 = sub_100003574(&qword_1000260C0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v273 = v691;
    v274 = dispatch thunk of CustomStringConvertible.description.getter(v271, v272);
    v276 = v275;
    v714 = sub_100017A54(v274, v275, &v716);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v714, v715, v701);
    swift_release(v258);
    swift_release(v263);
    swift_release(v264);
    swift_bridgeObjectRelease(v276);
    v701 = (char *)*((_QWORD *)isa + 1);
    ((void (*)(char *, uint64_t (*)(_QWORD, _QWORD)))v701)(v273, v271);
    v277 = v704;
    _os_log_impl((void *)&_mh_execute_header, v704, v268, "Received associated domain link: %s", v269, 0xCu);
    v278 = v653;
    swift_arrayDestroy(v653, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v278, -1, -1);
    swift_slowDealloc(v269, -1, -1);

  }
  else
  {
    swift_release(v258);
    swift_release(v263);
    swift_release(v264);
    swift_release(v262);
    swift_release(v261);
    v701 = (char *)*((_QWORD *)v253 + 1);
    ((void (*)(char *, uint64_t (*)(_QWORD, _QWORD)))v701)(v691, v709);

  }
  v186 = (void (**)(char *, uint64_t))v708[1];
  v280 = v705;
  v281 = ((uint64_t (*)(char *, uint64_t))v186)(v690, v705);
  v283 = v688;
  v282 = v689;
  v187 = v699;
  v284 = v700;
  v285 = v695._object;
  if (!(_DWORD)v698)
  {
    v708 = v186;
    swift_bridgeObjectRelease(v695._object);
    ((void (*)(char *, uint64_t, uint64_t))v284)(v283, v657, v280);
    v293 = v684;
    v294 = v709;
    v295 = v681;
    ((void (*)(char *, NSObject *, uint64_t (*)(_QWORD, _QWORD)))v681)(v684, v707, v709);
    ((void (*)(char *, char *, uint64_t (*)(_QWORD, _QWORD)))v295)(v282, v293, v294);
    v296 = swift_allocObject(&unk_100020C18, v656, v655);
    v297 = ((uint64_t (*)(char *, char *, uint64_t (*)(_QWORD, _QWORD)))v685)(&v680[v296], v293, v294);
    v298 = Logger.logObject.getter(v297);
    v299 = static os_log_type_t.error.getter();
    v300 = swift_allocObject(&unk_100020C40, 17, 7);
    *(_BYTE *)(v300 + 16) = 32;
    v301 = swift_allocObject(&unk_100020C68, 17, 7);
    *(_BYTE *)(v301 + 16) = 8;
    v302 = swift_allocObject(&unk_100020C90, 32, 7);
    *(_QWORD *)(v302 + 16) = sub_1000093C0;
    *(_QWORD *)(v302 + 24) = v296;
    v147 = swift_allocObject(&unk_100020CB8, 32, 7);
    *(_QWORD *)(v147 + 16) = sub_10000A108;
    *(_QWORD *)(v147 + 24) = v302;
    v303 = swift_initStackObject(v654, &v722);
    v304 = sub_1000179B4(v303, 3);
    *v305 = sub_10000A114;
    v305[1] = v300;
    v305[2] = sub_10000A114;
    v305[3] = v301;
    v305[4] = sub_10000A110;
    v305[5] = v147;
    swift_retain(v296);
    swift_retain(v302);
    swift_retain(v300);
    swift_retain(v301);
    swift_retain(v147);
    swift_bridgeObjectRelease(v304);
    v306 = v299;
    isa = (unsigned __int8 *)v298;
    if (os_log_type_enabled(v298, v299))
    {
      v307 = (uint8_t *)swift_slowAlloc(12, -1);
      v707 = swift_slowAlloc(32, -1);
      v716 = (uint64_t)v707;
      *(_WORD *)v307 = 258;
      v307[2] = 32;
      swift_release(v300);
      v307[3] = 8;
      swift_release(v301);
      v308 = sub_100003574(&qword_1000260C0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v309 = v689;
      v310 = dispatch thunk of CustomStringConvertible.description.getter(v294, v308);
      v312 = v311;
      v714 = sub_100017A54(v310, v311, &v716);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v714, v715, v307 + 4);
      swift_release(v296);
      swift_release(v302);
      swift_release(v147);
      swift_bridgeObjectRelease(v312);
      ((void (*)(char *, uint64_t (*)(_QWORD, _QWORD)))v701)(v309, v294);
      v313 = isa;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)isa, v306, "Associated URL support not enabled: %s", v307, 0xCu);
      LOBYTE(v147) = 1;
      v314 = v707;
      swift_arrayDestroy(v707, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v314, -1, -1);
      swift_slowDealloc(v307, -1, -1);

      v315 = v688;
LABEL_91:
      ((void (*)(char *, uint64_t))v708)(v315, v705);
      (*((void (**)(char *, uint64_t))v706 + 1))(v660, v659);
      v146 = 4;
      goto LABEL_52;
    }
    swift_release(v296);
    swift_release(v302);
    swift_release(v147);

    ((void (*)(char *, uint64_t (*)(_QWORD, _QWORD)))v701)(v689, v294);
    swift_release(v300);
    swift_release(v301);
    v362 = v688;
    v363 = v705;
    goto LABEL_94;
  }
  v716 = 46;
  v717 = 0xE100000000000000;
  __chkstk_darwin(v281);
  *(&v652 - 2) = (uint64_t)&v716;
  swift_bridgeObjectRetain_n(v285, 2);
  v191 = v695._countAndFlagsBits;
  v286 = sub_100003848(0x7FFFFFFFFFFFFFFFLL, 1, sub_100009474, (uint64_t)(&v652 - 4), v695._countAndFlagsBits, (unint64_t)v285);
  v287 = v285;
  v288 = (_QWORD *)v286;
  swift_bridgeObjectRelease(v287);
  if (v288[2])
  {
    v704 = 0;
    v708 = v186;
    v289 = v288[4];
    v290 = v288[5];
    v292 = v288[6];
    v291 = v288[7];
    swift_bridgeObjectRetain(v291);
    swift_bridgeObjectRelease(v288);
    v190 = v695._object;
    if (v191 == 1868770919 && v695._object == (void *)0xE400000000000000)
    {
      swift_bridgeObjectRelease(v291);
      v190 = (void *)0xE400000000000000;
      v186 = v708;
      v184 = v705;
      v191 = 1868770919;
    }
    else
    {
      v369 = _stringCompareWithSmolCheck(_:_:expecting:)(v695._countAndFlagsBits, v695._object, 1868770919, 0xE400000000000000, 0);
      v184 = v705;
      if ((v369 & 1) != 0)
      {
        swift_bridgeObjectRelease(v291);
        v186 = v708;
        v189 = v696;
        v188 = v697;
LABEL_32:
        v191 = v695._countAndFlagsBits;
        goto LABEL_33;
      }
      swift_bridgeObjectRelease(v190);
      v191 = static String._fromSubstring(_:)(v289, v290, v292, v291);
      v190 = v400;
      swift_bridgeObjectRelease(v291);
      v186 = v708;
    }
    v189 = v696;
    v188 = v697;
  }
  else
  {
    swift_bridgeObjectRelease(v288);
    v184 = v705;
    v189 = v696;
    v188 = v697;
    v190 = v695._object;
  }
LABEL_33:
  if (v191 == 1868770919 && v190 == (void *)0xE400000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(1868770919, 0xE400000000000000, v191, v190, 0) & 1) != 0)
  {
    v192 = swift_bridgeObjectRelease(v190);
    v193 = v707;
    v194 = URL.pathComponents.getter(v192);
    v195 = (_QWORD *)v194;
    v197 = v702;
    v196 = v703;
    if (!(_DWORD)v698
      || !*(_QWORD *)(v194 + 16)
      || (((void (*)(void))URL.path.getter)(),
          v199 = v198,
          v200._countAndFlagsBits = 1936614703,
          v200._object = (void *)0xE400000000000000,
          v201 = String.hasPrefix(_:)(v200),
          v202 = swift_bridgeObjectRelease(v199),
          !v201))
    {
      v708 = v186;
      v215 = swift_bridgeObjectRelease(v195);
      v216 = Logger.launcher.unsafeMutableAddressor(v215);
      ((void (*)(char *, uint64_t, uint64_t))v700)(v197, v216, v184);
      v217 = v694;
      v218 = v193;
      v219 = v709;
      v220 = v681;
      ((void (*)(char *, NSObject *, uint64_t (*)(_QWORD, _QWORD)))v681)(v694, v218, v709);
      ((void (*)(id *, char *, uint64_t (*)(_QWORD, _QWORD)))v220)(v196, v217, v219);
      v221 = isa;
      v222 = isa[80];
      v223 = (v222 + 16) & ~v222;
      v224 = swift_allocObject(&unk_1000213E8, v223 + v19, v222 | 7);
      v225 = (*((uint64_t (**)(uint64_t, char *, uint64_t (*)(_QWORD, _QWORD)))v221 + 4))(v224 + v223, v217, v219);
      v226 = Logger.logObject.getter(v225);
      v227 = v184;
      v228 = static os_log_type_t.error.getter();
      v229 = swift_allocObject(&unk_100021410, 17, 7);
      *(_BYTE *)(v229 + 16) = 32;
      v230 = swift_allocObject(&unk_100021438, 17, 7);
      *(_BYTE *)(v230 + 16) = 8;
      v231 = swift_allocObject(&unk_100021460, 32, 7);
      *(_QWORD *)(v231 + 16) = sub_1000093C0;
      *(_QWORD *)(v231 + 24) = v224;
      v232 = swift_allocObject(&unk_100021488, 32, 7);
      *(_QWORD *)(v232 + 16) = sub_10000A108;
      *(_QWORD *)(v232 + 24) = v231;
      v233 = sub_10000937C(&qword_100026080);
      v234 = swift_allocObject(v233, 80, 7);
      v235 = sub_1000179B4(v234, 3);
      *v236 = sub_10000A114;
      v236[1] = v229;
      v236[2] = sub_10000A114;
      v236[3] = v230;
      v236[4] = sub_10000A110;
      v236[5] = v232;
      swift_retain(v224);
      swift_retain(v231);
      swift_retain(v229);
      swift_retain(v230);
      swift_retain(v232);
      swift_bridgeObjectRelease(v235);
      v237 = v228;
      if (os_log_type_enabled(v226, v228))
      {
        v238 = (uint8_t *)swift_slowAlloc(12, -1);
        isa = (unsigned __int8 *)swift_slowAlloc(32, -1);
        v716 = (uint64_t)isa;
        *(_WORD *)v238 = 258;
        v238[2] = 32;
        swift_release(v229);
        v238[3] = 8;
        swift_release(v230);
        v239 = sub_100003574(&qword_1000260C0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
        v240 = v703;
        v707 = v226;
        v241 = v709;
        v242 = dispatch thunk of CustomStringConvertible.description.getter(v709, v239);
        v244 = v243;
        v714 = sub_100017A54(v242, v243, &v716);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v714, v715, v238 + 4);
        swift_release(v224);
        swift_release(v231);
        swift_release(v232);
        swift_bridgeObjectRelease(v244);
        ((void (*)(id *, uint64_t (*)(_QWORD, _QWORD)))v701)(v240, v241);
        v245 = v707;
        _os_log_impl((void *)&_mh_execute_header, v707, v237, "URL not supported: %s", v238, 0xCu);
        v246 = isa;
        swift_arrayDestroy(isa, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v246, -1, -1);
        swift_slowDealloc(v238, -1, -1);

        v247 = v702;
        v248 = v705;
      }
      else
      {
        swift_release(v224);
        swift_release(v231);
        swift_release(v232);

        ((void (*)(id *, uint64_t (*)(_QWORD, _QWORD)))v701)(v703, v709);
        swift_release(v229);
        swift_release(v230);
        v247 = v702;
        v248 = v227;
      }
      ((void (*)(char *, uint64_t))v708)(v247, v248);
      (*((void (**)(char *, uint64_t))v706 + 1))(v660, v659);
      if ((_DWORD)v698)
        v146 = 4;
      else
        v146 = 3;
      LOBYTE(v147) = 1;
      goto LABEL_52;
    }
    URL.path.getter(v202);
    v204 = v203;
    v205._countAndFlagsBits = 0x2F722F736E652FLL;
    v205._object = (void *)0xE700000000000000;
    v206 = String.hasPrefix(_:)(v205);
    swift_bridgeObjectRelease(v204);
    if (!v206 || v195[2] < 4uLL)
    {
      v207 = swift_bridgeObjectRelease(v195);
      URL.path.getter(v207);
      v209 = v208;
      v210._object = (void *)0x800000010001B220;
      v210._countAndFlagsBits = 0xD000000000000011;
      v211 = String.hasPrefix(_:)(v210);
      v212 = swift_bridgeObjectRelease(v209);
      v213 = v706;
      if (v211)
      {
        v214 = static ENUIPublicHealthAgencyModel.activeRegion;
        (*((void (**)(char *, uint64_t))v706 + 1))(v660, v659);
        if (!v214)
        {
          v146 = 0;
          goto LABEL_114;
        }
        if ((v658 & 1) == 0)
          goto LABEL_22;
LABEL_44:
        v146 = 0;
LABEL_114:
        LOBYTE(v147) = 0;
        goto LABEL_52;
      }
      URL.path.getter(v212);
      v365 = v364;
      v366._countAndFlagsBits = 0x7065722F736E652FLL;
      v366._object = (void *)0xEB0000000074726FLL;
      v367 = String.hasPrefix(_:)(v366);
      swift_bridgeObjectRelease(v365);
      if (v367)
      {
        v146 = sub_100004858((uint64_t)v193);
        v147 = (v368 >> 40) & 1;
        (*((void (**)(char *, uint64_t))v213 + 1))(v660, v659);
        goto LABEL_52;
      }
      (*((void (**)(char *, uint64_t))v213 + 1))(v660, v659);
      goto LABEL_119;
    }
    v146 = v195[10];
    swift_bridgeObjectRetain(v195[11]);
    swift_bridgeObjectRelease(v195);
    (*((void (**)(char *, uint64_t))v706 + 1))(v660, v659);
    goto LABEL_120;
  }
  if (v191 == 111 && v190 == (void *)0xE100000000000000)
  {
    v279 = 0xE100000000000000;
LABEL_80:
    v316 = swift_bridgeObjectRelease(v279);
    v318 = v686;
    v317 = v687;
    if ((_DWORD)v698)
    {
      v319 = v660;
      v320 = URLComponents.queryItems.getter(v316);
      v321 = v320;
      if (v320)
      {
        v322 = *(_QWORD *)(v320 + 16);
        if (v322)
        {
          v323 = v320 + ((*(unsigned __int8 *)(v693 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v693 + 80));
          v324 = *(_QWORD *)(v693 + 72);
          v325 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v693 + 16);
          swift_bridgeObjectRetain(v320);
          v326 = v692;
          while (1)
          {
            v327 = v325(v326, v323, v187);
            v328 = URLQueryItem.name.getter(v327);
            v330 = v329;
            if (v328 == 114 && v329 == 0xE100000000000000)
            {
              swift_bridgeObjectRelease(v321);
              v401 = 0xE100000000000000;
              goto LABEL_116;
            }
            v331 = _stringCompareWithSmolCheck(_:_:expecting:)(v328, v329, 114, 0xE100000000000000, 0);
            swift_bridgeObjectRelease(v330);
            if ((v331 & 1) != 0)
              break;
            v326 = v692;
            (*(void (**)(char *, uint64_t))(v693 + 8))(v692, v187);
            v323 += v324;
            if (!--v322)
            {
              swift_bridgeObjectRelease(v321);
              v332 = 1;
              v319 = v660;
              goto LABEL_108;
            }
          }
          v401 = v321;
LABEL_116:
          swift_bridgeObjectRelease(v401);
          v147 = v693;
          v399 = (uint64_t)v682;
          (*(void (**)(char *, char *, uint64_t))(v693 + 32))(v682, v692, v187);
          v332 = 0;
          v319 = v660;
          v398 = v706;
        }
        else
        {
          v332 = 1;
LABEL_108:
          v398 = v706;
          v147 = v693;
          v399 = (uint64_t)v682;
        }
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v147 + 56))(v399, v332, 1, v187);
        swift_bridgeObjectRelease(v321);
        v402 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v147 + 48))(v399, 1, v187);
        if ((_DWORD)v402 != 1)
        {
          v403 = URLQueryItem.value.getter(v402);
          v404 = v319;
          v405 = v403;
          v407 = v406;
          (*((void (**)(char *, uint64_t))v398 + 1))(v404, v659);
          (*(void (**)(uint64_t, uint64_t))(v147 + 8))(v399, v187);
          LOBYTE(v147) = 0;
          if (v407)
            v146 = v405;
          else
            v146 = 0;
          goto LABEL_52;
        }
        (*((void (**)(char *, uint64_t))v398 + 1))(v319, v659);
        sub_100009580(v399, &qword_100025A60);
LABEL_119:
        v146 = 0;
        goto LABEL_120;
      }
      (*((void (**)(char *, uint64_t))v706 + 1))(v319, v659);
      v146 = 0;
LABEL_120:
      LOBYTE(v147) = 0;
      goto LABEL_52;
    }
    v708 = v186;
    v333 = Logger.launcher.unsafeMutableAddressor(v316);
    ((void (*)(char *, uint64_t, uint64_t))v700)(v318, v333, v184);
    v334 = v683;
    v335 = v709;
    v336 = v681;
    ((void (*)(char *, NSObject *, uint64_t (*)(_QWORD, _QWORD)))v681)(v683, v707, v709);
    ((void (*)(char *, char *, uint64_t (*)(_QWORD, _QWORD)))v336)(v317, v334, v335);
    v337 = isa;
    v338 = isa[80];
    v339 = (v338 + 16) & ~v338;
    v340 = swift_allocObject(&unk_100021320, v339 + v19, v338 | 7);
    v341 = (*((uint64_t (**)(uint64_t, char *, uint64_t (*)(_QWORD, _QWORD)))v337 + 4))(v340 + v339, v334, v335);
    v342 = Logger.logObject.getter(v341);
    v343 = v184;
    v344 = static os_log_type_t.error.getter();
    v345 = swift_allocObject(&unk_100021348, 17, 7);
    *(_BYTE *)(v345 + 16) = 32;
    v346 = swift_allocObject(&unk_100021370, 17, 7);
    *(_BYTE *)(v346 + 16) = 8;
    v347 = swift_allocObject(&unk_100021398, 32, 7);
    *(_QWORD *)(v347 + 16) = sub_1000093C0;
    *(_QWORD *)(v347 + 24) = v340;
    v147 = swift_allocObject(&unk_1000213C0, 32, 7);
    *(_QWORD *)(v147 + 16) = sub_10000A108;
    *(_QWORD *)(v147 + 24) = v347;
    v348 = sub_10000937C(&qword_100026080);
    v349 = swift_allocObject(v348, 80, 7);
    v350 = sub_1000179B4(v349, 3);
    *v351 = sub_10000A114;
    v351[1] = v345;
    v351[2] = sub_10000A114;
    v351[3] = v346;
    v351[4] = sub_10000A110;
    v351[5] = v147;
    swift_retain(v340);
    swift_retain(v347);
    swift_retain(v345);
    swift_retain(v346);
    swift_retain(v147);
    swift_bridgeObjectRelease(v350);
    v352 = v344;
    if (os_log_type_enabled(v342, v344))
    {
      v353 = (uint8_t *)swift_slowAlloc(12, -1);
      isa = (unsigned __int8 *)swift_slowAlloc(32, -1);
      v716 = (uint64_t)isa;
      *(_WORD *)v353 = 258;
      v353[2] = 32;
      swift_release(v345);
      v353[3] = 8;
      swift_release(v346);
      v354 = sub_100003574(&qword_1000260C0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v707 = v342;
      v355 = v687;
      v356 = v709;
      v357 = dispatch thunk of CustomStringConvertible.description.getter(v709, v354);
      v359 = v358;
      v714 = sub_100017A54(v357, v358, &v716);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v714, v715, v353 + 4);
      swift_release(v340);
      swift_release(v347);
      swift_release(v147);
      swift_bridgeObjectRelease(v359);
      ((void (*)(char *, uint64_t (*)(_QWORD, _QWORD)))v701)(v355, v356);
      v360 = v707;
      _os_log_impl((void *)&_mh_execute_header, v707, v352, "URL not enabled: %s", v353, 0xCu);
      LOBYTE(v147) = 1;
      v361 = isa;
      swift_arrayDestroy(isa, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v361, -1, -1);
      swift_slowDealloc(v353, -1, -1);

      v315 = v686;
      goto LABEL_91;
    }
    swift_release(v340);
    swift_release(v347);
    swift_release(v147);

    ((void (*)(char *, uint64_t (*)(_QWORD, _QWORD)))v701)(v687, v709);
    swift_release(v345);
    swift_release(v346);
    v362 = v686;
    v363 = v343;
LABEL_94:
    ((void (*)(char *, uint64_t))v708)(v362, v363);
    (*((void (**)(char *, uint64_t))v706 + 1))(v660, v659);
    goto LABEL_95;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(111, 0xE100000000000000, v191, v190, 0) & 1) != 0
    || v191 == 0x696472616F626E6FLL && v190 == (void *)0xEA0000000000676ELL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x696472616F626E6FLL, 0xEA0000000000676ELL, v191, v190, 0) & 1) != 0
    || v191 == 0x6472616F626E6FLL && v190 == (void *)0xE700000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6472616F626E6FLL, 0xE700000000000000, v191, v190, 0) & 1) != 0)
  {
    v279 = (unint64_t)v190;
    goto LABEL_80;
  }
  if (v191 == 97 && v190 == (void *)0xE100000000000000)
  {
    v408 = swift_bridgeObjectRelease(0xE100000000000000);
    v409 = v659;
LABEL_134:
    if ((v698 & v658) == 1)
    {
      (*((void (**)(char *, uint64_t))v706 + 1))(v660, v409);
      goto LABEL_44;
    }
    v708 = v186;
    v411 = Logger.launcher.unsafeMutableAddressor(v408);
    ((void (*)(char *, uint64_t, uint64_t))v700)(v189, v411, v184);
    v412 = v679;
    v413 = v709;
    v414 = v681;
    ((void (*)(char *, NSObject *, uint64_t (*)(_QWORD, _QWORD)))v681)(v679, v707, v709);
    ((void (*)(char *, char *, uint64_t (*)(_QWORD, _QWORD)))v414)(v188, v412, v413);
    v415 = isa;
    v416 = isa[80];
    v417 = (v416 + 16) & ~v416;
    v418 = swift_allocObject(&unk_100021258, v417 + v19, v416 | 7);
    v419 = (*((uint64_t (**)(uint64_t, char *, uint64_t (*)(_QWORD, _QWORD)))v415 + 4))(v418 + v417, v412, v413);
    v420 = Logger.logObject.getter(v419);
    v421 = static os_log_type_t.error.getter();
    v422 = swift_allocObject(&unk_100021280, 17, 7);
    *(_BYTE *)(v422 + 16) = 32;
    v423 = swift_allocObject(&unk_1000212A8, 17, 7);
    *(_BYTE *)(v423 + 16) = 8;
    v424 = swift_allocObject(&unk_1000212D0, 32, 7);
    *(_QWORD *)(v424 + 16) = sub_1000093C0;
    *(_QWORD *)(v424 + 24) = v418;
    v147 = swift_allocObject(&unk_1000212F8, 32, 7);
    *(_QWORD *)(v147 + 16) = sub_10000A108;
    *(_QWORD *)(v147 + 24) = v424;
    v425 = sub_10000937C(&qword_100026080);
    v426 = swift_allocObject(v425, 80, 7);
    v427 = sub_1000179B4(v426, 3);
    *v428 = sub_10000A114;
    v428[1] = v422;
    v428[2] = sub_10000A114;
    v428[3] = v423;
    v428[4] = sub_10000A110;
    v428[5] = v147;
    swift_retain(v418);
    swift_retain(v424);
    swift_retain(v422);
    swift_retain(v423);
    swift_retain(v147);
    swift_bridgeObjectRelease(v427);
    v429 = v421;
    if (os_log_type_enabled(v420, v421))
    {
      v430 = (uint8_t *)swift_slowAlloc(12, -1);
      isa = (unsigned __int8 *)swift_slowAlloc(32, -1);
      v716 = (uint64_t)isa;
      *(_WORD *)v430 = 258;
      v430[2] = 32;
      swift_release(v422);
      v430[3] = 8;
      swift_release(v423);
      v431 = sub_100003574(&qword_1000260C0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v707 = v420;
      v432 = v697;
      v433 = v709;
      v434 = dispatch thunk of CustomStringConvertible.description.getter(v709, v431);
      v436 = v435;
      v714 = sub_100017A54(v434, v435, &v716);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v714, v715, v430 + 4);
      swift_release(v418);
      swift_release(v424);
      swift_release(v147);
      swift_bridgeObjectRelease(v436);
      ((void (*)(char *, uint64_t (*)(_QWORD, _QWORD)))v701)(v432, v433);
      v437 = v707;
      _os_log_impl((void *)&_mh_execute_header, v707, v429, "URL not enabled: %s", v430, 0xCu);
      LOBYTE(v147) = 1;
      v438 = isa;
      swift_arrayDestroy(isa, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v438, -1, -1);
      swift_slowDealloc(v430, -1, -1);

      v315 = v696;
      goto LABEL_91;
    }
    swift_release(v418);
    swift_release(v424);
    swift_release(v147);

    ((void (*)(char *, uint64_t (*)(_QWORD, _QWORD)))v701)(v697, v709);
    swift_release(v422);
    swift_release(v423);
    ((void (*)(char *, uint64_t))v708)(v696, v705);
    (*((void (**)(char *, uint64_t))v706 + 1))(v660, v409);
LABEL_95:
    LOBYTE(v147) = 1;
    v146 = 4;
    goto LABEL_52;
  }
  v410 = _stringCompareWithSmolCheck(_:_:expecting:)(97, 0xE100000000000000, v191, v190, 0);
  v409 = v659;
  if ((v410 & 1) != 0
    || v191 == 0x7A69726F68747561 && v190 == (void *)0xE900000000000065
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x7A69726F68747561, 0xE900000000000065, v191, v190, 0) & 1) != 0)
  {
    v408 = swift_bridgeObjectRelease(v190);
    goto LABEL_134;
  }
  v708 = v186;
  if (v191 == 0x6F68747561657270 && v190 == (void *)0xEC000000657A6972)
  {
    v439 = 0xEC000000657A6972;
LABEL_144:
    v408 = swift_bridgeObjectRelease(v439);
    v409 = v659;
    v184 = v705;
    v186 = v708;
    v189 = v696;
    v188 = v697;
    goto LABEL_134;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6F68747561657270, 0xEC000000657A6972, v191, v190, 0) & 1) != 0)
  {
    v439 = (unint64_t)v190;
    goto LABEL_144;
  }
  if (v191 == 0x74726F706572 && v190 == (void *)0xE600000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x74726F706572, 0xE600000000000000, v191, v190, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(v190);
    v146 = sub_100004858((uint64_t)v707);
    v147 = (v440 >> 40) & 1;
    (*((void (**)(char *, uint64_t))v706 + 1))(v660, v659);
    goto LABEL_52;
  }
  if (v191 == 118 && v190 == (void *)0xE100000000000000)
  {
    v441 = swift_bridgeObjectRelease(0xE100000000000000);
    goto LABEL_153;
  }
  v442 = _stringCompareWithSmolCheck(_:_:expecting:)(118, 0xE100000000000000, v191, v190, 0);
  v441 = swift_bridgeObjectRelease(v190);
  if ((v442 & 1) == 0)
  {
    v482 = Logger.launcher.unsafeMutableAddressor(v441);
    ((void (*)(char *, uint64_t, uint64_t))v700)(v670, v482, v705);
    v483 = v665;
    v484 = v709;
    v485 = v681;
    ((void (*)(char *, NSObject *, uint64_t (*)(_QWORD, _QWORD)))v681)(v665, v707, v709);
    ((void (*)(char *, char *, uint64_t (*)(_QWORD, _QWORD)))v485)(v671, v483, v484);
    v486 = isa;
    v487 = isa[80];
    v488 = (v487 + 16) & ~v487;
    v489 = swift_allocObject(&unk_100020CE0, v488 + v19, v487 | 7);
    v490 = (*((uint64_t (**)(uint64_t, char *, uint64_t (*)(_QWORD, _QWORD)))v486 + 4))(v489 + v488, v483, v484);
    v491 = Logger.logObject.getter(v490);
    v492 = static os_log_type_t.error.getter();
    v493 = swift_allocObject(&unk_100020D08, 17, 7);
    *(_BYTE *)(v493 + 16) = 32;
    v494 = swift_allocObject(&unk_100020D30, 17, 7);
    *(_BYTE *)(v494 + 16) = 8;
    v495 = swift_allocObject(&unk_100020D58, 32, 7);
    *(_QWORD *)(v495 + 16) = sub_1000093C0;
    *(_QWORD *)(v495 + 24) = v489;
    v147 = swift_allocObject(&unk_100020D80, 32, 7);
    *(_QWORD *)(v147 + 16) = sub_10000A108;
    *(_QWORD *)(v147 + 24) = v495;
    v496 = sub_10000937C(&qword_100026080);
    v497 = swift_initStackObject(v496, &v721);
    v498 = sub_1000179B4(v497, 3);
    *v499 = sub_10000A114;
    v499[1] = v493;
    v499[2] = sub_10000A114;
    v499[3] = v494;
    v499[4] = sub_10000A110;
    v499[5] = v147;
    swift_retain(v489);
    swift_retain(v495);
    swift_retain(v493);
    swift_retain(v494);
    swift_retain(v147);
    swift_bridgeObjectRelease(v498);
    v500 = v492;
    isa = (unsigned __int8 *)v491;
    if (os_log_type_enabled(v491, v492))
    {
      v501 = (uint8_t *)swift_slowAlloc(12, -1);
      v707 = swift_slowAlloc(32, -1);
      v716 = (uint64_t)v707;
      *(_WORD *)v501 = 258;
      v501[2] = 32;
      swift_release(v493);
      v501[3] = 8;
      swift_release(v494);
      v502 = sub_100003574(&qword_1000260C0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v503 = v671;
      v504 = v709;
      v505 = dispatch thunk of CustomStringConvertible.description.getter(v709, v502);
      v507 = v506;
      v714 = sub_100017A54(v505, v506, &v716);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v714, v715, v501 + 4);
      swift_release(v489);
      swift_release(v495);
      swift_release(v147);
      swift_bridgeObjectRelease(v507);
      ((void (*)(char *, uint64_t (*)(_QWORD, _QWORD)))v701)(v503, v504);
      v508 = isa;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)isa, v500, "Unknown URL %s", v501, 0xCu);
      LOBYTE(v147) = 1;
      v509 = v707;
      swift_arrayDestroy(v707, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v509, -1, -1);
      swift_slowDealloc(v501, -1, -1);

      ((void (*)(char *, uint64_t))v708)(v670, v705);
      goto LABEL_105;
    }
    swift_release(v489);
    swift_release(v495);
    swift_release(v147);

    ((void (*)(char *, uint64_t (*)(_QWORD, _QWORD)))v701)(v671, v709);
    swift_release(v493);
    swift_release(v494);
    ((void (*)(char *, uint64_t))v708)(v670, v705);
    goto LABEL_125;
  }
LABEL_153:
  v704 = URLComponents.queryItems.getter(v441);
  if (!v704)
  {
    v454 = Logger.testVerification.unsafeMutableAddressor(0);
    ((void (*)(char *, uint64_t, uint64_t))v700)(v672, v454, v705);
    v455 = v668;
    v456 = v709;
    v457 = v681;
    ((void (*)(char *, NSObject *, uint64_t (*)(_QWORD, _QWORD)))v681)(v668, v707, v709);
    ((void (*)(char *, char *, uint64_t (*)(_QWORD, _QWORD)))v457)(v673, v455, v456);
    v458 = isa;
    v459 = isa[80];
    v460 = (v459 + 16) & ~v459;
    v461 = swift_allocObject(&unk_100020DA8, v460 + v19, v459 | 7);
    v462 = (*((uint64_t (**)(uint64_t, char *, uint64_t (*)(_QWORD, _QWORD)))v458 + 4))(v461 + v460, v455, v456);
    v463 = Logger.logObject.getter(v462);
    v464 = static os_log_type_t.error.getter();
    v465 = swift_allocObject(&unk_100020DD0, 17, 7);
    *(_BYTE *)(v465 + 16) = 32;
    v466 = swift_allocObject(&unk_100020DF8, 17, 7);
    *(_BYTE *)(v466 + 16) = 8;
    v467 = swift_allocObject(&unk_100020E20, 32, 7);
    *(_QWORD *)(v467 + 16) = sub_1000093C0;
    *(_QWORD *)(v467 + 24) = v461;
    v147 = swift_allocObject(&unk_100020E48, 32, 7);
    *(_QWORD *)(v147 + 16) = sub_10000A108;
    *(_QWORD *)(v147 + 24) = v467;
    v468 = sub_10000937C(&qword_100026080);
    v469 = swift_initStackObject(v468, &v720);
    v470 = sub_1000179B4(v469, 3);
    *v471 = sub_10000A114;
    v471[1] = v465;
    v471[2] = sub_10000A114;
    v471[3] = v466;
    v471[4] = sub_10000A110;
    v471[5] = v147;
    swift_retain(v461);
    swift_retain(v467);
    swift_retain(v465);
    swift_retain(v466);
    swift_retain(v147);
    swift_bridgeObjectRelease(v470);
    v472 = v464;
    isa = (unsigned __int8 *)v463;
    if (!os_log_type_enabled(v463, v464))
    {
      swift_release(v461);
      swift_release(v467);
      swift_release(v147);

      ((void (*)(char *, uint64_t (*)(_QWORD, _QWORD)))v701)(v673, v709);
      swift_release(v465);
      swift_release(v466);
      ((void (*)(char *, uint64_t))v708)(v672, v705);
      (*((void (**)(char *, uint64_t))v706 + 1))(v660, v659);
      goto LABEL_22;
    }
    v473 = (uint8_t *)swift_slowAlloc(12, -1);
    v707 = swift_slowAlloc(32, -1);
    v716 = (uint64_t)v707;
    *(_WORD *)v473 = 258;
    v473[2] = 32;
    swift_release(v465);
    v473[3] = 8;
    swift_release(v466);
    v474 = sub_100003574(&qword_1000260C0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v475 = v673;
    v476 = v709;
    v477 = dispatch thunk of CustomStringConvertible.description.getter(v709, v474);
    v479 = v478;
    v714 = sub_100017A54(v477, v478, &v716);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v714, v715, v473 + 4);
    swift_release(v461);
    swift_release(v467);
    swift_release(v147);
    swift_bridgeObjectRelease(v479);
    ((void (*)(char *, uint64_t (*)(_QWORD, _QWORD)))v701)(v475, v476);
    v480 = isa;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)isa, v472, "Could not get query items from url: %s", v473, 0xCu);
    LOBYTE(v147) = 1;
    v481 = v707;
    swift_arrayDestroy(v707, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v481, -1, -1);
    swift_slowDealloc(v473, -1, -1);

    ((void (*)(char *, uint64_t))v708)(v672, v705);
    goto LABEL_15;
  }
  v443 = swift_allocObject(&unk_100020E70, 24, 7);
  v707 = v443;
  v443[2].isa = 0;
  v444 = (uint64_t)&v443[2];
  v703 = (id *)v444;
  isa = (unsigned __int8 *)v704[2].isa;
  if (!isa)
    goto LABEL_172;
  v445 = (char *)v704 + ((*(unsigned __int8 *)(v693 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v693 + 80));
  v446 = *(_QWORD *)(v693 + 72);
  v447 = *(uint64_t (**)(char *, char *, uint64_t))(v693 + 16);
  swift_bridgeObjectRetain(v704);
  v448 = isa;
  while (1)
  {
    v449 = v447(v677, v445, v699);
    v450 = URLQueryItem.name.getter(v449);
    v452 = v451;
    if (v450 == 114 && v451 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease(v704);
      v510 = 0xE100000000000000;
      goto LABEL_169;
    }
    v453 = _stringCompareWithSmolCheck(_:_:expecting:)(v450, v451, 114, 0xE100000000000000, 0);
    swift_bridgeObjectRelease(v452);
    if ((v453 & 1) != 0)
      break;
    (*(void (**)(char *, uint64_t))(v693 + 8))(v677, v699);
    v445 += v446;
    if (!--v448)
    {
      v444 = swift_bridgeObjectRelease(v704);
      goto LABEL_172;
    }
  }
  v510 = v704;
LABEL_169:
  swift_bridgeObjectRelease(v510);
  v511 = v693;
  v512 = v663;
  v513 = v699;
  v514 = (*(uint64_t (**)(char *, char *, uint64_t))(v693 + 32))(v663, v677, v699);
  v709 = (uint64_t (*)(_QWORD, _QWORD))URLQueryItem.value.getter(v514);
  v516 = v515;
  v444 = (*(uint64_t (**)(char *, uint64_t))(v511 + 8))(v512, v513);
  if (v516)
  {
    v702 = (char *)Logger.testVerification.unsafeMutableAddressor(v444);
    ((void (*)(char *))v700)(v666);
    v517 = swift_allocObject(&unk_1000210F0, 32, 7);
    *(_QWORD *)(v517 + 16) = v709;
    *(_QWORD *)(v517 + 24) = v516;
    v518 = swift_bridgeObjectRetain_n(v516, 2);
    v519 = Logger.logObject.getter(v518);
    LODWORD(v698) = static os_log_type_t.info.getter();
    v520 = swift_allocObject(&unk_100021118, 17, 7);
    *(_BYTE *)(v520 + 16) = 32;
    v521 = swift_allocObject(&unk_100021140, 17, 7);
    *(_BYTE *)(v521 + 16) = 8;
    v522 = swift_allocObject(&unk_100021168, 32, 7);
    *(_QWORD *)(v522 + 16) = sub_10000966C;
    *(_QWORD *)(v522 + 24) = v517;
    v523 = swift_allocObject(&unk_100021190, 32, 7);
    *(_QWORD *)(v523 + 16) = sub_10000A108;
    *(_QWORD *)(v523 + 24) = v522;
    v701 = (char *)sub_10000937C(&qword_100026080);
    v524 = swift_allocObject(v701, 80, 7);
    v525 = sub_1000179B4(v524, 3);
    *v526 = sub_10000A114;
    v526[1] = v520;
    v526[2] = sub_10000A114;
    v526[3] = v521;
    v526[4] = sub_10000A110;
    v526[5] = v523;
    swift_retain(v517);
    swift_retain(v522);
    swift_retain(v520);
    swift_retain(v521);
    swift_retain(v523);
    swift_bridgeObjectRelease(v525);
    v527 = v698;
    v698 = v519;
    if (os_log_type_enabled(v519, v527))
    {
      v528 = (uint8_t *)swift_slowAlloc(12, -1);
      v697 = (char *)swift_slowAlloc(32, -1);
      v716 = (uint64_t)v697;
      *(_WORD *)v528 = 258;
      v528[2] = 32;
      swift_release(v520);
      v528[3] = 8;
      swift_release(v521);
      swift_bridgeObjectRetain(v516);
      v714 = sub_100017A54((uint64_t)v709, v516, &v716);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v714, v715, v528 + 4);
      swift_release(v517);
      swift_release(v522);
      swift_release(v523);
      swift_bridgeObjectRelease_n(v516, 2);
      v529 = v698;
      _os_log_impl((void *)&_mh_execute_header, v698, v527, "Recieved region string %s", v528, 0xCu);
      v530 = v697;
      swift_arrayDestroy(v697, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v530, -1, -1);
      swift_slowDealloc(v528, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease(v516);
      swift_release(v517);
      swift_release(v522);
      swift_release(v523);
      swift_release(v521);
      swift_release(v520);
    }
    ((void (*)(char *, uint64_t))v708)(v666, v705);
    v537 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v516);
    v538 = (objc_class *)objc_msgSend((id)objc_opt_self(ENRegion), "regionWithCode:", v537);

    v539 = v707;
    v540 = v707[2].isa;
    v707[2].isa = v538;

    ((void (*)(char *, char *, uint64_t))v700)(v667, v702, v705);
    v541 = swift_retain_n(v539, 2);
    v542 = Logger.logObject.getter(v541);
    v543 = static os_log_type_t.info.getter();
    v544 = swift_allocObject(&unk_1000211B8, 17, 7);
    *(_BYTE *)(v544 + 16) = 32;
    v545 = swift_allocObject(&unk_1000211E0, 17, 7);
    *(_BYTE *)(v545 + 16) = 8;
    v546 = swift_allocObject(&unk_100021208, 32, 7);
    *(_QWORD *)(v546 + 16) = sub_1000096B8;
    *(_QWORD *)(v546 + 24) = v539;
    v547 = swift_allocObject(&unk_100021230, 32, 7);
    *(_QWORD *)(v547 + 16) = sub_10000A108;
    *(_QWORD *)(v547 + 24) = v546;
    v548 = swift_allocObject(v701, 80, 7);
    v549 = sub_1000179B4(v548, 3);
    *v550 = sub_10000A114;
    v550[1] = v544;
    v550[2] = sub_10000A114;
    v550[3] = v545;
    v550[4] = sub_10000A110;
    v550[5] = v547;
    swift_retain(v539);
    swift_retain(v546);
    swift_retain(v544);
    swift_retain(v545);
    swift_retain(v547);
    swift_bridgeObjectRelease(v549);
    LODWORD(v709) = v543;
    if (os_log_type_enabled(v542, (os_log_type_t)v543))
    {
      v551 = (uint8_t *)swift_slowAlloc(12, -1);
      v552 = swift_slowAlloc(32, -1);
      v714 = v552;
      *(_WORD *)v551 = 258;
      v551[2] = 32;
      swift_release(v544);
      v551[3] = 8;
      swift_release(v545);
      v553 = v703;
      swift_beginAccess(v703, &v711, 0, 0);
      if (*v553)
      {
        v554 = objc_msgSend(*v553, "description");
        v555 = static String._unconditionallyBridgeFromObjectiveC(_:)(v554);
        v557 = v556;

      }
      else
      {
        v555 = 0;
        v557 = 0;
      }
      v716 = v555;
      v717 = v557;
      v558 = sub_10000937C(&qword_100025A68);
      v559 = String.init<A>(describing:)(&v716, v558);
      v561 = v560;
      v716 = sub_100017A54(v559, v560, &v714);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v716, &v717, v551 + 4);
      swift_release_n(v707, 2);
      swift_release(v546);
      swift_release(v547);
      swift_bridgeObjectRelease(v561);
      _os_log_impl((void *)&_mh_execute_header, v542, (os_log_type_t)v709, "Got ENRegion %s", v551, 0xCu);
      swift_arrayDestroy(v552, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v552, -1, -1);
      swift_slowDealloc(v551, -1, -1);

    }
    else
    {

      swift_release_n(v707, 2);
      swift_release(v546);
      swift_release(v547);
      swift_release(v545);
      swift_release(v544);
    }
    v536 = v667;
  }
  else
  {
LABEL_172:
    v531 = Logger.testVerification.unsafeMutableAddressor(v444);
    v532 = ((uint64_t (*)(char *, uint64_t, uint64_t))v700)(v674, v531, v705);
    v533 = Logger.logObject.getter(v532);
    v534 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v533, v534))
    {
      v535 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v535 = 0;
      _os_log_impl((void *)&_mh_execute_header, v533, v534, "Did not receive region string", v535, 2u);
      swift_slowDealloc(v535, -1, -1);
    }

    v536 = v674;
  }
  v562 = ((uint64_t (*)(char *, uint64_t))v708)(v536, v705);
  if (!isa)
    goto LABEL_200;
  v563 = (char *)v704 + ((*(unsigned __int8 *)(v693 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v693 + 80));
  v564 = *(_QWORD *)(v693 + 72);
  v565 = *(uint64_t (**)(char *, char *, uint64_t))(v693 + 16);
  swift_bridgeObjectRetain(v704);
  v566 = v563;
  v567 = isa;
  while (1)
  {
    v568 = v565(v678, v566, v699);
    v569 = URLQueryItem.name.getter(v568);
    v571 = v570;
    if (v569 == 99 && v570 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease(v704);
      v573 = 0xE100000000000000;
      goto LABEL_192;
    }
    v572 = _stringCompareWithSmolCheck(_:_:expecting:)(v569, v570, 99, 0xE100000000000000, 0);
    swift_bridgeObjectRelease(v571);
    if ((v572 & 1) != 0)
      break;
    (*(void (**)(char *, uint64_t))(v693 + 8))(v678, v699);
    v566 += v564;
    if (!--v567)
    {
      v562 = swift_bridgeObjectRelease(v704);
      goto LABEL_200;
    }
  }
  v573 = v704;
LABEL_192:
  swift_bridgeObjectRelease(v573);
  v574 = v693;
  v575 = v664;
  v576 = v699;
  v702 = *(char **)(v693 + 32);
  v577 = ((uint64_t (*)(char *, char *, uint64_t))v702)(v664, v678, v699);
  v146 = URLQueryItem.value.getter(v577);
  v579 = v578;
  v709 = *(uint64_t (**)(_QWORD, _QWORD))(v574 + 8);
  v562 = v709(v575, v576);
  if (!v579)
  {
LABEL_200:
    v588 = Logger.testVerification.unsafeMutableAddressor(v562);
    ((void (*)(char *, uint64_t, uint64_t))v700)(v675, v588, v705);
    v589 = swift_allocObject(&unk_100020E98, 24, 7);
    v590 = v704;
    *(_QWORD *)(v589 + 16) = v704;
    v591 = swift_bridgeObjectRetain(v590);
    v592 = Logger.logObject.getter(v591);
    v593 = static os_log_type_t.error.getter();
    v594 = swift_allocObject(&unk_100020EC0, 17, 7);
    *(_BYTE *)(v594 + 16) = 32;
    v595 = swift_allocObject(&unk_100020EE8, 17, 7);
    *(_BYTE *)(v595 + 16) = 8;
    v596 = swift_allocObject(&unk_100020F10, 32, 7);
    *(_QWORD *)(v596 + 16) = sub_100009534;
    *(_QWORD *)(v596 + 24) = v589;
    v597 = swift_allocObject(&unk_100020F38, 32, 7);
    *(_QWORD *)(v597 + 16) = sub_10000A108;
    *(_QWORD *)(v597 + 24) = v596;
    v598 = sub_10000937C(&qword_100026080);
    v599 = swift_initStackObject(v598, &v719);
    v600 = sub_1000179B4(v599, 3);
    *v601 = sub_10000A114;
    v601[1] = v594;
    v601[2] = sub_10000A114;
    v601[3] = v595;
    v601[4] = sub_10000A110;
    v601[5] = v597;
    swift_retain(v589);
    swift_retain(v596);
    swift_retain(v594);
    swift_retain(v595);
    swift_retain(v597);
    swift_bridgeObjectRelease(v600);
    v602 = v593;
    isa = (unsigned __int8 *)v592;
    if (os_log_type_enabled(v592, v593))
    {
      v603 = (uint8_t *)swift_slowAlloc(12, -1);
      v709 = (uint64_t (*)(_QWORD, _QWORD))swift_slowAlloc(32, -1);
      v716 = (uint64_t)v709;
      *(_WORD *)v603 = 258;
      v603[2] = 32;
      swift_release(v594);
      v603[3] = 8;
      swift_release(v595);
      v604 = v704;
      v605 = swift_bridgeObjectRetain(v704);
      v606 = Array.description.getter(v605, v699);
      v608 = v607;
      swift_bridgeObjectRelease(v604);
      v714 = sub_100017A54(v606, v608, &v716);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v714, v715, v603 + 4);
      swift_bridgeObjectRelease(v604);
      swift_release(v589);
      swift_release(v596);
      swift_release(v597);
      swift_bridgeObjectRelease(v608);
      v609 = isa;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)isa, v602, "Did not receive a verification code in URL: %s", v603, 0xCu);
      v610 = v709;
      swift_arrayDestroy(v709, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v610, -1, -1);
      swift_slowDealloc(v603, -1, -1);

      ((void (*)(char *, uint64_t))v708)(v675, v705);
      (*((void (**)(char *, uint64_t))v706 + 1))(v660, v659);
      swift_release(v707);
      goto LABEL_12;
    }
    swift_release(v594);
    swift_release(v595);
    swift_bridgeObjectRelease(v704);
    swift_release(v589);
    swift_release(v596);
    swift_release(v597);

    ((void (*)(char *, uint64_t))v708)(v675, v705);
    (*((void (**)(char *, uint64_t))v706 + 1))(v660, v659);
    swift_release(v707);
    goto LABEL_22;
  }
  v718 = 0;
  result = swift_bridgeObjectRetain(v704);
  v580 = 0;
  while (1)
  {
    v581 = (unsigned __int8 *)(v580 + 1);
    if (__OFADD__(v580, 1))
    {
      __break(1u);
      return result;
    }
    v582 = v565(v676, v563, v699);
    v583 = URLQueryItem.name.getter(v582);
    v585 = v584;
    if (v583 == 116 && v584 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease(v704);
      v611 = 0xE100000000000000;
      goto LABEL_205;
    }
    v586 = _stringCompareWithSmolCheck(_:_:expecting:)(v583, v584, 116, 0xE100000000000000, 0);
    swift_bridgeObjectRelease(v585);
    if ((v586 & 1) != 0)
      break;
    result = v709(v676, v699);
    ++v580;
    v563 += v564;
    if (v581 == isa)
    {
      swift_bridgeObjectRelease(v704);
      v587 = 1;
      goto LABEL_206;
    }
  }
  v611 = v704;
LABEL_205:
  swift_bridgeObjectRelease(v611);
  ((void (*)(uint64_t, char *, uint64_t))v702)(v669, v676, v699);
  v587 = 0;
LABEL_206:
  v612 = v693;
  v613 = v669;
  v614 = v699;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v693 + 56))(v669, v587, 1, v699);
  swift_bridgeObjectRelease(v704);
  v615 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v612 + 48))(v613, 1, v614);
  if ((_DWORD)v615 == 1)
  {
    sub_100009580(v669, &qword_100025A60);
  }
  else
  {
    v616 = v669;
    isa = (unsigned __int8 *)URLQueryItem.value.getter(v615);
    v618 = v617;
    v619 = v709(v616, v699);
    if (v618)
    {
      v702 = (char *)Logger.testVerification.unsafeMutableAddressor(v619);
      ((void (*)(char *))v700)(v662);
      v620 = swift_allocObject(&unk_100020F60, 32, 7);
      *(_QWORD *)(v620 + 16) = isa;
      *(_QWORD *)(v620 + 24) = v618;
      v621 = swift_bridgeObjectRetain_n(v618, 2);
      v709 = (uint64_t (*)(_QWORD, _QWORD))Logger.logObject.getter(v621);
      LODWORD(v704) = static os_log_type_t.info.getter();
      v622 = swift_allocObject(&unk_100020F88, 17, 7);
      *(_BYTE *)(v622 + 16) = 32;
      v623 = swift_allocObject(&unk_100020FB0, 17, 7);
      *(_BYTE *)(v623 + 16) = 8;
      v624 = swift_allocObject(&unk_100020FD8, 32, 7);
      *(_QWORD *)(v624 + 16) = sub_10000A18C;
      *(_QWORD *)(v624 + 24) = v620;
      v625 = swift_allocObject(&unk_100021000, 32, 7);
      *(_QWORD *)(v625 + 16) = sub_10000A108;
      *(_QWORD *)(v625 + 24) = v624;
      v701 = (char *)sub_10000937C(&qword_100026080);
      v626 = swift_initStackObject(v701, &v713);
      v627 = sub_1000179B4(v626, 3);
      *v628 = sub_10000A114;
      v628[1] = v622;
      v628[2] = sub_10000A114;
      v628[3] = v623;
      v628[4] = sub_10000A110;
      v628[5] = v625;
      swift_retain(v620);
      swift_retain(v624);
      swift_retain(v622);
      swift_retain(v623);
      swift_retain(v625);
      swift_bridgeObjectRelease(v627);
      LODWORD(v704) = v704;
      if (os_log_type_enabled((os_log_t)v709, (os_log_type_t)v704))
      {
        v629 = (uint8_t *)swift_slowAlloc(12, -1);
        v699 = swift_slowAlloc(32, -1);
        v716 = v699;
        *(_WORD *)v629 = 258;
        v629[2] = 32;
        swift_release(v622);
        v629[3] = 8;
        swift_release(v623);
        swift_bridgeObjectRetain(v618);
        v714 = sub_100017A54((uint64_t)isa, v618, &v716);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v714, v715, v629 + 4);
        swift_release(v620);
        swift_release(v624);
        swift_release(v625);
        swift_bridgeObjectRelease_n(v618, 2);
        v630 = v709;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v709, (os_log_type_t)v704, "Got report type string: %s", v629, 0xCu);
        v631 = v699;
        swift_arrayDestroy(v699, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v631, -1, -1);
        swift_slowDealloc(v629, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease(v618);
        swift_release(v620);
        swift_release(v624);
        swift_release(v625);
        swift_release(v623);
        swift_release(v622);
      }
      ((void (*)(char *, uint64_t))v708)(v662, v705);
      v632 = sub_100002C1C((uint64_t)isa, v618);
      if ((v632 & 0x100000000) == 0)
      {
        v633 = v632;
        v718 = v632;
        ((void (*)(char *, char *, uint64_t))v700)(v661, v702, v705);
        v634 = swift_allocObject(&unk_100021028, 20, 7);
        *(_DWORD *)(v634 + 16) = v633;
        isa = (unsigned __int8 *)Logger.logObject.getter(v634);
        LODWORD(v709) = static os_log_type_t.info.getter();
        v635 = swift_allocObject(&unk_100021050, 17, 7);
        *(_BYTE *)(v635 + 16) = 32;
        v636 = swift_allocObject(&unk_100021078, 17, 7);
        *(_BYTE *)(v636 + 16) = 8;
        v637 = swift_allocObject(&unk_1000210A0, 32, 7);
        *(_QWORD *)(v637 + 16) = sub_100009610;
        *(_QWORD *)(v637 + 24) = v634;
        v638 = swift_allocObject(&unk_1000210C8, 32, 7);
        *(_QWORD *)(v638 + 16) = sub_10000A108;
        *(_QWORD *)(v638 + 24) = v637;
        v639 = swift_initStackObject(v701, &v712);
        v640 = sub_1000179B4(v639, 3);
        *v641 = sub_10000A114;
        v641[1] = v635;
        v641[2] = sub_10000A114;
        v641[3] = v636;
        v641[4] = sub_10000A110;
        v641[5] = v638;
        swift_retain(v634);
        swift_retain(v637);
        swift_retain(v635);
        swift_retain(v636);
        swift_retain(v638);
        swift_bridgeObjectRelease(v640);
        LODWORD(v709) = v709;
        if (os_log_type_enabled((os_log_t)isa, (os_log_type_t)v709))
        {
          v642 = (uint8_t *)swift_slowAlloc(12, -1);
          v704 = swift_slowAlloc(32, -1);
          v716 = (uint64_t)v704;
          *(_WORD *)v642 = 258;
          v642[2] = 32;
          swift_release(v635);
          v642[3] = 8;
          swift_release(v636);
          v643 = sub_100009648(v633);
          v644 = String.init(cString:)(v643);
          v646 = v645;
          v714 = sub_100017A54(v644, v645, &v716);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v714, v715, v642 + 4);
          swift_release(v634);
          swift_release(v637);
          swift_release(v638);
          swift_bridgeObjectRelease(v646);
          v647 = isa;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)isa, (os_log_type_t)v709, "Got report type: %s", v642, 0xCu);
          v648 = v704;
          swift_arrayDestroy(v704, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v648, -1, -1);
          swift_slowDealloc(v642, -1, -1);

        }
        else
        {
          swift_release(v635);
          swift_release(v636);
          swift_release(v634);
          swift_release(v637);
          swift_release(v638);

        }
        ((void (*)(char *, uint64_t))v708)(v661, v705);
      }
    }
  }
  (*((void (**)(char *, uint64_t))v706 + 1))(v660, v659);
  swift_beginAccess(v703, &v716, 0, 0);
  v649 = v707;
  v650 = v707[2].isa;
  swift_beginAccess(&v718, &v714, 0, 0);
  v651 = v650;
  swift_release(v649);
  LOBYTE(v147) = 0;
LABEL_52:
  LOBYTE(v718) = v147;
  return v146;
}

uint64_t sub_10000937C(uint64_t *a1)
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

uint64_t sub_1000093C4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE **sub_1000093D4(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_10001810C(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1000093DC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000093EC()
{
  uint64_t v0;

  return sub_1000179C4(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1000093F4(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1000179E4(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_100009400()
{
  type metadata accessor for URL(0);
  return sub_100002E78();
}

uint64_t sub_100009430()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100009440()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100009454()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100009464()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100009474(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)() & 1;
}

uint64_t sub_1000094CC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000094DC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000094F0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100009500()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100009510()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100009534()
{
  uint64_t v0;

  return sub_100002BC4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_10000953C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000954C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000955C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100009580(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10000937C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000095BC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000095E0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000095F0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100009600()
{
  uint64_t v0;

  return swift_deallocObject(v0, 20, 7);
}

uint64_t sub_100009610()
{
  uint64_t v0;
  const char *v1;

  v1 = sub_100009648(*(_DWORD *)(v0 + 16));
  return String.init(cString:)(v1);
}

uint64_t sub_100009628()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100009638()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

const char *sub_100009648(unsigned int a1)
{
  if (a1 > 5)
    return "?";
  else
    return off_100021780[a1];
}

uint64_t sub_10000966C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 24));
  return v1;
}

uint64_t sub_100009698()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000096A8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000096B8()
{
  uint64_t v0;

  return sub_100002B2C(v0);
}

uint64_t sub_1000096C0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000096D0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000096E4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000096F4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100009708()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100009718()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000972C()
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
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000978C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000979C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000097AC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000097D0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_100009DD4(a1, &qword_100025A78, (uint64_t)&unk_100021500);
}

_BYTE *initializeBufferWithCopyOfBuffer for URLParser.UserReportErrorType(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for URLParser.URLParserError(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
  {
    v6 = *a1;
    if (v6 >= 2)
      v7 = v6 - 1;
    else
      v7 = 0;
    if (v7 >= 4)
      return v7 - 3;
    else
      return 0;
  }
  else
  {
    v2 = a2 + 4;
    if (a2 + 4 >= 0xFFFF00)
      v3 = 4;
    else
      v3 = 2;
    if (v2 >> 8 < 0xFF)
      v3 = 1;
    if (v2 >= 0x100)
      v4 = v3;
    else
      v4 = 0;
    return ((uint64_t (*)(void))((char *)&loc_100009858 + 4 * byte_10001A660[v4]))();
  }
}

uint64_t storeEnumTagSinglePayload for URLParser.URLParserError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 4;
  if (a3 + 4 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFC)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_100009904 + 4 * byte_10001A66A[v5]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_100009938 + 4 * byte_10001A665[v5]))();
}

uint64_t sub_100009938(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100009940(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100009948);
  return result;
}

uint64_t sub_100009954(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000995CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_100009960(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100009968(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100009974(unsigned __int8 *a1)
{
  unsigned int v1;

  v1 = *a1;
  if (v1 >= 2)
    return v1 - 1;
  else
    return 0;
}

_BYTE *sub_10000998C(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 1;
  return result;
}

ValueMetadata *type metadata accessor for URLParser.URLParserError()
{
  return &type metadata for URLParser.URLParserError;
}

uint64_t getEnumTagSinglePayload for URLParser.PreAuthorizationType(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for URLParser.PreAuthorizationType(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100009A40 + 4 * byte_10001A66F[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100009A60 + 4 * byte_10001A674[v4]))();
}

_BYTE *sub_100009A40(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100009A60(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100009A68(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100009A70(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100009A78(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100009A80(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_100009A8C()
{
  return 0;
}

ValueMetadata *type metadata accessor for URLParser.PreAuthorizationType()
{
  return &type metadata for URLParser.PreAuthorizationType;
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_100009DD4(a1, &qword_100025A80, (uint64_t)&unk_100021650);
}

void _s3__C4CodeOMa_0(uint64_t a1)
{
  sub_100009DD4(a1, &qword_100025A88, (uint64_t)&unk_100021670);
}

void type metadata accessor for ENDiagnosisReportType(uint64_t a1)
{
  sub_100009DD4(a1, &qword_100025A90, (uint64_t)&unk_100021690);
}

unint64_t sub_100009AE4()
{
  unint64_t result;

  result = qword_100025A98;
  if (!qword_100025A98)
  {
    result = swift_getWitnessTable(&unk_10001AA38, &type metadata for URLParser.PreAuthorizationType);
    atomic_store(result, (unint64_t *)&qword_100025A98);
  }
  return result;
}

uint64_t sub_100009B28()
{
  return sub_100003574((unint64_t *)&qword_100025AA0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10001AB08);
}

uint64_t sub_100009B54()
{
  return sub_100003574(&qword_100025AA8, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10001AAB0);
}

uint64_t sub_100009B80()
{
  return sub_100003574(&qword_100025AB0, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_10001A998);
}

uint64_t sub_100009BAC()
{
  return sub_100003574(&qword_100025AB8, (uint64_t (*)(uint64_t))type metadata accessor for ENError, (uint64_t)&unk_10001AB84);
}

void type metadata accessor for ENError(uint64_t a1)
{
  sub_100009DD4(a1, &qword_100025B40, (uint64_t)&unk_100021740);
}

uint64_t sub_100009BEC()
{
  return sub_100003574(&qword_100025AC0, (uint64_t (*)(uint64_t))type metadata accessor for ENError, (uint64_t)&unk_10001ACC4);
}

uint64_t sub_100009C18()
{
  return sub_100003574(&qword_100025AC8, (uint64_t (*)(uint64_t))type metadata accessor for ENError, (uint64_t)&unk_10001AC54);
}

uint64_t sub_100009C44()
{
  return sub_100003574(&qword_100025AD0, (uint64_t (*)(uint64_t))type metadata accessor for ENError, (uint64_t)&unk_10001ABEC);
}

uint64_t sub_100009C70()
{
  return sub_100003574(&qword_100025AD8, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_10001AB4C);
}

uint64_t sub_100009C9C()
{
  return sub_100003574(&qword_100025AE0, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_10001A9C0);
}

unint64_t sub_100009CCC()
{
  unint64_t result;

  result = qword_100025AE8;
  if (!qword_100025AE8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_100025AE8);
  }
  return result;
}

uint64_t sub_100009D10()
{
  return sub_100003574(&qword_100025AF0, (uint64_t (*)(uint64_t))type metadata accessor for ENError, (uint64_t)&unk_10001AC2C);
}

uint64_t sub_100009D3C()
{
  return sub_100003574(&qword_100025AF8, (uint64_t (*)(uint64_t))type metadata accessor for ENError, (uint64_t)&unk_10001AC84);
}

uint64_t sub_100009D68()
{
  return sub_100003574(&qword_100025B00, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_10001A938);
}

uint64_t sub_100009D94()
{
  return sub_100003574(&qword_100025B08, (uint64_t (*)(uint64_t))type metadata accessor for ENTestResultError, (uint64_t)&unk_10001AD3C);
}

void type metadata accessor for ENTestResultError(uint64_t a1)
{
  sub_100009DD4(a1, &qword_100025B48, (uint64_t)&unk_100021768);
}

void sub_100009DD4(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_100009E18()
{
  return sub_100003574(&qword_100025B10, (uint64_t (*)(uint64_t))type metadata accessor for ENTestResultError, (uint64_t)&unk_10001AE7C);
}

uint64_t sub_100009E44()
{
  return sub_100003574(&qword_100025B18, (uint64_t (*)(uint64_t))type metadata accessor for ENTestResultError, (uint64_t)&unk_10001AE0C);
}

uint64_t sub_100009E70()
{
  return sub_100003574(&qword_100025B20, (uint64_t (*)(uint64_t))type metadata accessor for ENTestResultError, (uint64_t)&unk_10001ADA4);
}

uint64_t sub_100009E9C()
{
  return sub_100003574((unint64_t *)&unk_100026070, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_10001AD04);
}

uint64_t sub_100009EC8()
{
  return sub_100003574(&qword_100025B28, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_10001A960);
}

uint64_t sub_100009EF4()
{
  return sub_100003574(&qword_100025B30, (uint64_t (*)(uint64_t))type metadata accessor for ENTestResultError, (uint64_t)&unk_10001ADE4);
}

uint64_t sub_100009F20()
{
  return sub_100003574(&qword_100025B38, (uint64_t (*)(uint64_t))type metadata accessor for ENTestResultError, (uint64_t)&unk_10001AE3C);
}

uint64_t getEnumTagSinglePayload for URLParser.UserReportErrorType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for URLParser.UserReportErrorType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000A028 + 4 * byte_10001A67E[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10000A05C + 4 * byte_10001A679[v4]))();
}

uint64_t sub_10000A05C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A064(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000A06CLL);
  return result;
}

uint64_t sub_10000A078(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000A080);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10000A084(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A08C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A098(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000A0A0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for URLParser.UserReportErrorType()
{
  return &type metadata for URLParser.UserReportErrorType;
}

unint64_t sub_10000A0C0()
{
  unint64_t result;

  result = qword_100025B50;
  if (!qword_100025B50)
  {
    result = swift_getWitnessTable(&unk_10001AF80, &type metadata for URLParser.UserReportErrorType);
    atomic_store(result, (unint64_t *)&qword_100025B50);
  }
  return result;
}

id sub_10000A2B0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ViewController()
{
  return objc_opt_self(_TtC16HealthENLauncher14ViewController);
}

id sub_10000A428()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
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
  return objc_opt_self(_TtC16HealthENLauncher11AppDelegate);
}

void sub_10000A4D0(void *a1, char a2)
{
  uint64_t v3;
  id v4;
  void (*v5)(_QWORD *);
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[3];

  if (a1)
  {
    v3 = qword_100025960;
    v4 = a1;
    if (v3 != -1)
      swift_once(&qword_100025960, sub_10000A588);
    swift_beginAccess(&qword_100025C70, v8, 33, 0);
    v5 = (void (*)(_QWORD *))sub_10000BB50((uint64_t)v4);
    v7 = v6;
    swift_endAccess(v8);
    if (v5)
    {
      v8[0] = a2 & 3;
      v5(v8);
      sub_10000B024((uint64_t)v5, v7);
    }

  }
}

unint64_t sub_10000A588()
{
  unint64_t result;

  result = sub_100018C14((uint64_t)&_swiftEmptyArrayStorage);
  qword_100025C70 = result;
  return result;
}

uint64_t sub_10000A5AC()
{
  uint64_t v0;
  uint64_t result;

  v0 = type metadata accessor for ErrorDialog();
  result = swift_allocObject(v0, 32, 7);
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = 0;
  qword_100027210 = result;
  return result;
}

void sub_10000A5D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint8_t *v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t inited;
  uint64_t v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  unint64_t v39;
  uint64_t v40;
  __CFString *v41;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v43;
  uint64_t v44;
  const __CFDictionary *isa;
  CFUserNotificationRef v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint8_t *v56;
  __CFUserNotification *v57;
  CFRunLoopSourceRef RunLoopSource;
  void *v59;
  uint64_t v60;
  void *v61;
  __CFRunLoopSource *v62;
  __CFRunLoop *v63;
  __CFString *v64;
  uint64_t v65;
  _QWORD *v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  void *v74;
  void *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  SInt32 error;
  _QWORD v86[3];
  char v87[104];

  v82 = a5;
  v83 = a8;
  v17 = type metadata accessor for Logger(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = __chkstk_darwin(v17);
  v21 = (char *)&v76 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __chkstk_darwin(v19);
  v23 = __chkstk_darwin(v22);
  if (*(_QWORD *)(v10 + 16))
  {
    v26 = Logger.testVerification.unsafeMutableAddressor(v23);
    v27 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 16))(v21, v26, v17);
    v28 = Logger.logObject.getter(v27);
    v29 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = v17;
      v31 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Error dialog is already visible. Don't show a second one.", v31, 2u);
      v32 = v31;
      v17 = v30;
      swift_slowDealloc(v32, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
  }
  else
  {
    v77 = a7;
    v81 = v25;
    v76 = (char *)&v76 - v24;
    v78 = v10;
    v79 = v18;
    v80 = v17;
    error = 0;
    v33 = sub_10000937C(&qword_100025D60);
    inited = swift_initStackObject(v33, v87);
    *(_QWORD *)(inited + 32) = kCFUserNotificationAlertHeaderKey;
    *(_QWORD *)(inited + 40) = a1;
    *(_OWORD *)(inited + 16) = xmmword_10001B000;
    *(_QWORD *)(inited + 48) = a2;
    *(_QWORD *)(inited + 56) = kCFUserNotificationAlertMessageKey;
    *(_QWORD *)(inited + 64) = a3;
    *(_QWORD *)(inited + 72) = a4;
    v35 = v82;
    *(_QWORD *)(inited + 80) = kCFUserNotificationDefaultButtonTitleKey;
    *(_QWORD *)(inited + 88) = v35;
    *(_QWORD *)(inited + 96) = a6;
    v36 = (id)kCFUserNotificationDefaultButtonTitleKey;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a4);
    swift_bridgeObjectRetain(a6);
    v37 = (id)kCFUserNotificationAlertHeaderKey;
    v38 = (id)kCFUserNotificationAlertMessageKey;
    v39 = sub_10000DD40(inited);
    v40 = v83;
    if (v83)
    {
      v41 = (id)kCFUserNotificationAlternateButtonTitleKey;
      swift_bridgeObjectRetain(v40);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v39);
      v86[0] = v39;
      sub_10000C854(v77, v40, (void *)kCFUserNotificationAlternateButtonTitleKey, isUniquelyReferenced_nonNull_native);
      v39 = v86[0];

      swift_bridgeObjectRelease(0x8000000000000000);
    }
    v43 = v79;
    v44 = v78;
    sub_10000937C(&qword_100025D68);
    sub_10000AEC0();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v39);
    v46 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, isa);

    v47 = *(void **)(v44 + 16);
    *(_QWORD *)(v44 + 16) = v46;

    v49 = *(void **)(v44 + 16);
    v50 = v80;
    if (v49 && !error)
    {
      v57 = v49;
      RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v57, (CFUserNotificationCallBack)sub_10000AC58, 0);
      v59 = *(void **)(v44 + 24);
      *(_QWORD *)(v44 + 24) = RunLoopSource;

      v61 = *(void **)(v44 + 24);
      if (v61)
      {
        v62 = v61;
        v63 = CFRunLoopGetCurrent();
        v64 = (__CFString *)CFRunLoopCopyCurrentMode(v63);
        if (!v64)
          v64 = (id)kCFRunLoopCommonModes;
        if (qword_100025960 != -1)
          swift_once(&qword_100025960, sub_10000A588);
        v65 = swift_allocObject(&unk_100021958, 24, 7);
        swift_weakInit(v65 + 16, v44);
        v66 = (_QWORD *)swift_allocObject(&unk_100021980, 40, 7);
        v66[2] = v65;
        v66[3] = a9;
        v66[4] = a10;
        swift_beginAccess(&qword_100025C70, v86, 33, 0);
        swift_retain(v65);
        sub_10000B014(a9, a10);
        v67 = swift_isUniquelyReferenced_nonNull_native(qword_100025C70);
        v84 = qword_100025C70;
        qword_100025C70 = 0x8000000000000000;
        sub_10000C718((uint64_t)sub_10000B008, (uint64_t)v66, (uint64_t)v57, v67);
        v68 = qword_100025C70;
        qword_100025C70 = v84;
        swift_bridgeObjectRelease(v68);
        swift_endAccess(v86);
        swift_release(v65);
        CFRunLoopAddSource(v63, v62, v64);

      }
      else
      {
        v69 = Logger.testVerification.unsafeMutableAddressor(v60);
        v70 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v43 + 16))(v76, v69, v50);
        v71 = Logger.logObject.getter(v70);
        v72 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v71, v72))
        {
          v73 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v73 = 0;
          _os_log_impl((void *)&_mh_execute_header, v71, v72, "Could not create CFRunLoopSource.", v73, 2u);
          swift_slowDealloc(v73, -1, -1);
          v74 = v57;
        }
        else
        {
          v74 = v71;
          v71 = v57;
        }

        (*(void (**)(char *, uint64_t))(v43 + 8))(v76, v50);
        v75 = *(void **)(v44 + 16);
        *(_QWORD *)(v44 + 16) = 0;

      }
    }
    else
    {
      v51 = Logger.testVerification.unsafeMutableAddressor(v48);
      v52 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v43 + 16))(v81, v51, v50);
      v53 = Logger.logObject.getter(v52);
      v54 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v53, v54))
      {
        v55 = (uint8_t *)swift_slowAlloc(8, -1);
        *(_DWORD *)v55 = 67109120;
        swift_beginAccess(&error, v86, 0, 0);
        LODWORD(v84) = error;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v84, (char *)&v84 + 4, v55 + 4);
        _os_log_impl((void *)&_mh_execute_header, v53, v54, "Could not create CFUserNotification: %d", v55, 8u);
        v56 = v55;
        v50 = v80;
        swift_slowDealloc(v56, -1, -1);
      }

      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v81, v50);
    }
  }
}

void sub_10000AC58(void *a1, char a2)
{
  id v4;

  v4 = a1;
  sub_10000A4D0(a1, a2);

}

uint64_t sub_10000AC98(uint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  __CFRunLoopSource *v13;
  void *v14;
  __CFUserNotification *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  _BYTE v24[24];

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = &v24[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v10 = *a1;
  a2 += 16;
  swift_beginAccess(a2, v24, 0, 0);
  result = swift_weakLoadStrong(a2);
  if (result)
  {
    v12 = result;
    v13 = *(__CFRunLoopSource **)(result + 24);
    if (v13)
    {
      CFRunLoopSourceInvalidate(v13);
      v14 = *(void **)(v12 + 24);
      *(_QWORD *)(v12 + 24) = 0;

    }
    v15 = *(__CFUserNotification **)(v12 + 16);
    if (v15)
    {
      CFUserNotificationCancel(v15);
      v16 = *(void **)(v12 + 16);
      *(_QWORD *)(v12 + 16) = 0;

    }
    if (v10 == 1)
    {
      if (a3)
      {
        v17 = 1;
        goto LABEL_12;
      }
      return swift_release(v12);
    }
    if (!v10)
    {
      if (a3)
      {
        v17 = 0;
LABEL_12:
        a3(v17);
        return swift_release(v12);
      }
      return swift_release(v12);
    }
    v18 = Logger.testVerification.unsafeMutableAddressor();
    v19 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, v18, v6);
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v22 = 134217984;
      v23 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24, v22 + 4);
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Unexpected response from validating notification: %lu", v22, 0xCu);
      swift_slowDealloc(v22, -1, -1);
    }

    swift_release(v12);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
  }
  return result;
}

uint64_t sub_10000AE74()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for ErrorDialog()
{
  return objc_opt_self(_TtC16HealthENLauncher11ErrorDialog);
}

unint64_t sub_10000AEC0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025D70;
  if (!qword_100025D70)
  {
    v1 = sub_10000AF24(&qword_100025D68);
    sub_10000AF68();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100025D70);
  }
  return result;
}

uint64_t sub_10000AF24(uint64_t *a1)
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

unint64_t sub_10000AF68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025AA0;
  if (!qword_100025AA0)
  {
    type metadata accessor for CFString(255);
    result = swift_getWitnessTable(&unk_10001AB08, v1);
    atomic_store(result, (unint64_t *)&qword_100025AA0);
  }
  return result;
}

uint64_t sub_10000AFB0()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000AFD4()
{
  _QWORD *v0;

  swift_release(v0[2]);
  if (v0[3])
    swift_release(v0[4]);
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000B008(uint64_t *a1)
{
  uint64_t v1;

  return sub_10000AC98(a1, *(_QWORD *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24));
}

uint64_t sub_10000B014(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_10000B024(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

void sub_10000B034(void *a1, char a2)
{
  uint64_t v3;
  id v4;
  void (*v5)(_QWORD *);
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[3];

  if (a1)
  {
    v3 = qword_100025970;
    v4 = a1;
    if (v3 != -1)
      swift_once(&qword_100025970, sub_10000B0EC);
    swift_beginAccess(&qword_100025D78, v8, 33, 0);
    v5 = (void (*)(_QWORD *))sub_10000BB50((uint64_t)v4);
    v7 = v6;
    swift_endAccess(v8);
    if (v5)
    {
      v8[0] = a2 & 3;
      v5(v8);
      sub_10000B024((uint64_t)v5, v7);
    }

  }
}

unint64_t sub_10000B0EC()
{
  unint64_t result;

  result = sub_100018C14((uint64_t)&_swiftEmptyArrayStorage);
  qword_100025D78 = result;
  return result;
}

void sub_10000B110()
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
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t inited;
  void *v19;
  const __CFString *v20;
  id v21;
  Swift::String v22;
  Swift::String v23;
  Swift::String v24;
  const __CFString *v25;
  id v26;
  Swift::String v27;
  Swift::String v28;
  Swift::String v29;
  unint64_t v30;
  const __CFDictionary *isa;
  CFUserNotificationRef v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  __CFUserNotification *v41;
  CFRunLoopSourceRef RunLoopSource;
  void *v43;
  uint64_t v44;
  void *v45;
  __CFRunLoopSource *v46;
  __CFRunLoop *v47;
  __CFString *v48;
  uint64_t v49;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  SInt32 error;
  _BYTE v64[24];
  char v65[80];
  Swift::String v66;
  Swift::String v67;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v9 = (char *)&v60 - v8;
  v10 = __chkstk_darwin(v7);
  if (*(_QWORD *)(v0 + 32))
  {
    v12 = Logger.testVerification.unsafeMutableAddressor(v10);
    v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v12, v2);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Validating dialog is already visible. Don't show a second one.", v16, 2u);
      swift_slowDealloc(v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    v61 = (char *)&v60 - v11;
    error = 0;
    v17 = sub_10000937C(&qword_100025D60);
    inited = swift_initStackObject(v17, v65);
    *(_OWORD *)(inited + 16) = xmmword_10001B060;
    *(_QWORD *)(inited + 32) = kCFUserNotificationAlertHeaderKey;
    v19 = (void *)objc_opt_self(NSBundle);
    v20 = (id)kCFUserNotificationAlertHeaderKey;
    v21 = objc_msgSend(v19, "mainBundle");
    v66._object = (void *)0xE500000000000000;
    v22._object = (void *)0x800000010001B4D0;
    v22._countAndFlagsBits = 0xD000000000000022;
    v23._countAndFlagsBits = 0;
    v23._object = (void *)0xE000000000000000;
    v66._countAndFlagsBits = 0x656C746954;
    v24 = NSLocalizedString(_:tableName:bundle:value:comment:)(v22, (Swift::String_optional)0, (NSBundle)v21, v23, v66);

    *(Swift::String *)(inited + 40) = v24;
    *(_QWORD *)(inited + 56) = kCFUserNotificationDefaultButtonTitleKey;
    v25 = (id)kCFUserNotificationDefaultButtonTitleKey;
    v26 = objc_msgSend(v19, "mainBundle");
    v67._object = (void *)0xE600000000000000;
    v27._countAndFlagsBits = 0x6C65636E6143;
    v27._object = (void *)0xE600000000000000;
    v28._countAndFlagsBits = 0;
    v28._object = (void *)0xE000000000000000;
    v67._countAndFlagsBits = 0x6E6F74747542;
    v29 = NSLocalizedString(_:tableName:bundle:value:comment:)(v27, (Swift::String_optional)0, (NSBundle)v26, v28, v67);

    *(Swift::String *)(inited + 64) = v29;
    v30 = sub_10000DD40(inited);
    sub_10000937C(&qword_100025D68);
    sub_10000AEC0();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v30);
    v32 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, isa);

    v33 = *(void **)(v0 + 32);
    *(_QWORD *)(v0 + 32) = v32;

    v35 = *(void **)(v0 + 32);
    if (v35 && !error)
    {
      v41 = v35;
      RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v41, (CFUserNotificationCallBack)sub_10000B73C, 0);
      v43 = *(void **)(v0 + 40);
      *(_QWORD *)(v0 + 40) = RunLoopSource;

      v45 = *(void **)(v0 + 40);
      if (v45)
      {
        v46 = v45;
        v47 = CFRunLoopGetCurrent();
        v48 = (__CFString *)CFRunLoopCopyCurrentMode(v47);
        if (!v48)
          v48 = (id)kCFRunLoopCommonModes;
        if (qword_100025970 != -1)
          swift_once(&qword_100025970, sub_10000B0EC);
        v49 = swift_allocObject(&unk_1000219A8, 24, 7);
        swift_weakInit(v49 + 16, v0);
        swift_beginAccess(&qword_100025D78, v64, 33, 0);
        swift_retain(v49);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(qword_100025D78);
        v62 = qword_100025D78;
        qword_100025D78 = 0x8000000000000000;
        sub_10000C718((uint64_t)sub_10000BB20, v49, (uint64_t)v41, isUniquelyReferenced_nonNull_native);
        v51 = qword_100025D78;
        qword_100025D78 = v62;
        swift_bridgeObjectRelease(v51);
        swift_endAccess(v64);
        swift_release(v49);
        CFRunLoopAddSource(v47, v46, v48);

      }
      else
      {
        v52 = Logger.testVerification.unsafeMutableAddressor(v44);
        v53 = v61;
        v54 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v61, v52, v2);
        v55 = Logger.logObject.getter(v54);
        v56 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v55, v56))
        {
          v57 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v57 = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, v56, "Could not create CFRunLoopSource.", v57, 2u);
          swift_slowDealloc(v57, -1, -1);
          v58 = v41;
        }
        else
        {
          v58 = v55;
          v55 = v41;
        }

        (*(void (**)(char *, uint64_t))(v3 + 8))(v53, v2);
        v59 = *(void **)(v1 + 32);
        *(_QWORD *)(v1 + 32) = 0;

      }
    }
    else
    {
      v36 = Logger.testVerification.unsafeMutableAddressor(v34);
      v37 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v36, v2);
      v38 = Logger.logObject.getter(v37);
      v39 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v38, v39))
      {
        v40 = (uint8_t *)swift_slowAlloc(8, -1);
        *(_DWORD *)v40 = 67109120;
        swift_beginAccess(&error, v64, 0, 0);
        LODWORD(v62) = error;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, (char *)&v62 + 4, v40 + 4);
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "Could not create CFUserNotification: %d", v40, 8u);
        swift_slowDealloc(v40, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
    }
  }
}

void sub_10000B73C(void *a1, char a2)
{
  id v4;

  v4 = a1;
  sub_10000B034(a1, a2);

}

uint64_t sub_10000B77C(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t Strong;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  _BYTE v27[24];

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = &v27[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v6);
  v10 = &v27[-v9 - 8];
  v11 = *a1;
  a2 += 16;
  swift_beginAccess(a2, v27, 0, 0);
  result = swift_weakLoadStrong(a2);
  if (result)
  {
    v13 = result;
    if (v11)
    {
      v14 = Logger.testVerification.unsafeMutableAddressor(result);
      v15 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v8, v14, v4);
      v16 = Logger.logObject.getter(v15);
      v17 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc(12, -1);
        *(_DWORD *)v18 = 134217984;
        v26 = v11;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, v27, v18 + 4);
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "Unexpected response from validating notification: %lu", v18, 0xCu);
        swift_slowDealloc(v18, -1, -1);
        swift_release(v13);

      }
      else
      {

        swift_release(v13);
      }
      return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v8, v4);
    }
    else
    {
      Strong = swift_unknownObjectWeakLoadStrong(result + 16);
      if (Strong)
      {
        v20 = Strong;
        v21 = Logger.testVerification.unsafeMutableAddressor(Strong);
        v22 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v10, v21, v4);
        v23 = Logger.logObject.getter(v22);
        v24 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v23, v24))
        {
          v25 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v25 = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, v24, "Cancelling validating dialog", v25, 2u);
          swift_slowDealloc(v25, -1, -1);
        }

        (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v10, v4);
        sub_10000D6D0();
        swift_release(v13);
        return swift_unknownObjectRelease(v20);
      }
      else
      {
        return swift_release(v13);
      }
    }
  }
  return result;
}

uint64_t sub_10000B9EC()
{
  uint64_t v0;

  sub_10000C9B8(v0 + 16);

  return swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for ValidatingDialog()
{
  return objc_opt_self(_TtC16HealthENLauncher16ValidatingDialog);
}

void *sub_10000BA40(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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

uint64_t sub_10000BAD4@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_10000BAFC()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000BB20(uint64_t *a1)
{
  uint64_t v1;

  return sub_10000B77C(a1, v1);
}

uint64_t sub_10000BB28@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_10000BB50(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v3;
  char v4;
  unint64_t v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v2 = v1;
  v3 = sub_100018244(a1);
  if ((v4 & 1) == 0)
    return 0;
  v5 = v3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  v7 = *v1;
  v11 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000C3BC();
    v7 = v11;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 16 * v5);
  sub_10000C228(v5, v7);
  v9 = *v2;
  *v2 = v7;
  swift_bridgeObjectRelease(v9);
  return v8;
}

uint64_t sub_10000BBF8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  __int128 v33;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_10000937C(&qword_100025E88);
  result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v9 = 0;
    v10 = (uint64_t *)(v5 + 64);
    v11 = 1 << *(_BYTE *)(v5 + 32);
    v30 = -1 << v11;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v13 = v12 & *(_QWORD *)(v5 + 64);
    v31 = 1 << *(_BYTE *)(v5 + 32);
    v32 = v3;
    v14 = (unint64_t)(v11 + 63) >> 6;
    v15 = result + 64;
    while (1)
    {
      if (v13)
      {
        v20 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v21 = v20 | (v9 << 6);
      }
      else
      {
        v22 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
          return result;
        }
        if (v22 >= v14)
          goto LABEL_36;
        v23 = v10[v22];
        ++v9;
        if (!v23)
        {
          v9 = v22 + 1;
          if (v22 + 1 >= v14)
            goto LABEL_36;
          v23 = v10[v9];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v14)
            {
LABEL_36:
              if ((a2 & 1) == 0)
              {
                result = swift_release(v5);
                v3 = v32;
                goto LABEL_43;
              }
              if (v31 >= 64)
                bzero((void *)(v5 + 64), 8 * v14);
              else
                *v10 = v30;
              v3 = v32;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v23 = v10[v24];
            if (!v23)
            {
              while (1)
              {
                v9 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_45;
                if (v9 >= v14)
                  goto LABEL_36;
                v23 = v10[v9];
                ++v24;
                if (v23)
                  goto LABEL_33;
              }
            }
            v9 = v24;
          }
        }
LABEL_33:
        v13 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v9 << 6);
      }
      v29 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v21);
      v33 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + 16 * v21);
      if ((a2 & 1) == 0)
        swift_retain(*((_QWORD *)&v33 + 1));
      result = static Hasher._hash(seed:_:)(*(_QWORD *)(v8 + 40), v29);
      v16 = -1 << *(_BYTE *)(v8 + 32);
      v17 = result & ~v16;
      v18 = v17 >> 6;
      if (((-1 << v17) & ~*(_QWORD *)(v15 + 8 * (v17 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v15 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_44;
          }
          v27 = v18 == v26;
          if (v18 == v26)
            v18 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v15 + 8 * v18);
        }
        while (v28 == -1);
        v19 = __clz(__rbit64(~v28)) + (v18 << 6);
      }
      *(_QWORD *)(v15 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v19) = v29;
      *(_OWORD *)(*(_QWORD *)(v8 + 56) + 16 * v19) = v33;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
LABEL_43:
  *v3 = v8;
  return result;
}

Swift::Int sub_10000BEA8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  unint64_t v21;
  int64_t v22;
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char v41;
  unint64_t v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  int64_t v47;
  _QWORD *v48;
  char v49;
  uint64_t v50;
  _QWORD v51[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_10000937C((uint64_t *)&unk_100026100);
  v49 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_46;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v48 = (_QWORD *)(v5 + 64);
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v46 = v3;
  v47 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v17 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v18 = v17 | (v14 << 6);
      goto LABEL_25;
    }
    v19 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
      return result;
    }
    if (v19 >= v47)
      break;
    v20 = v48;
    v21 = v48[v19];
    ++v14;
    if (!v21)
    {
      v14 = v19 + 1;
      if (v19 + 1 >= v47)
        goto LABEL_39;
      v21 = v48[v14];
      if (!v21)
      {
        v22 = v19 + 2;
        if (v22 >= v47)
        {
LABEL_39:
          swift_release(v5);
          v3 = v46;
          if ((v49 & 1) == 0)
            goto LABEL_46;
          goto LABEL_42;
        }
        v21 = v48[v22];
        if (!v21)
        {
          while (1)
          {
            v14 = v22 + 1;
            if (__OFADD__(v22, 1))
              goto LABEL_48;
            if (v14 >= v47)
              goto LABEL_39;
            v21 = v48[v14];
            ++v22;
            if (v21)
              goto LABEL_24;
          }
        }
        v14 = v22;
      }
    }
LABEL_24:
    v11 = (v21 - 1) & v21;
    v18 = __clz(__rbit64(v21)) + (v14 << 6);
LABEL_25:
    v23 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v18);
    v24 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * v18);
    v25 = *v24;
    v26 = v24[1];
    if ((v49 & 1) == 0)
    {
      v27 = v23;
      swift_bridgeObjectRetain(v26);
    }
    Hasher.init(_seed:)(v51, *(_QWORD *)(v8 + 40));
    if (v23)
    {
      Hasher._combine(_:)(1u);
      type metadata accessor for CFString(0);
      v50 = v25;
      v29 = v28;
      v30 = v8;
      v31 = v14;
      v32 = v26;
      v33 = v5;
      v34 = sub_10000C9DC(&qword_100025E90, (uint64_t)&unk_10001AADC);
      v35 = v23;
      v36 = v29;
      v25 = v50;
      v37 = v34;
      v5 = v33;
      v26 = v32;
      v14 = v31;
      v8 = v30;
      _CFObject.hash(into:)(v51, v36, v37);

    }
    else
    {
      Hasher._combine(_:)(0);
    }
    result = Hasher._finalize()();
    v38 = -1 << *(_BYTE *)(v8 + 32);
    v39 = result & ~v38;
    v40 = v39 >> 6;
    if (((-1 << v39) & ~*(_QWORD *)(v12 + 8 * (v39 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v39) & ~*(_QWORD *)(v12 + 8 * (v39 >> 6)))) | v39 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v41 = 0;
      v42 = (unint64_t)(63 - v38) >> 6;
      do
      {
        if (++v40 == v42 && (v41 & 1) != 0)
        {
          __break(1u);
          goto LABEL_47;
        }
        v43 = v40 == v42;
        if (v40 == v42)
          v40 = 0;
        v41 |= v43;
        v44 = *(_QWORD *)(v12 + 8 * v40);
      }
      while (v44 == -1);
      v15 = __clz(__rbit64(~v44)) + (v40 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v15) = v23;
    v16 = (_QWORD *)(*(_QWORD *)(v8 + 56) + 16 * v15);
    *v16 = v25;
    v16[1] = v26;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v46;
  v20 = v48;
  if ((v49 & 1) == 0)
    goto LABEL_46;
LABEL_42:
  v45 = 1 << *(_BYTE *)(v5 + 32);
  if (v45 >= 64)
    bzero(v20, ((unint64_t)(v45 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v20 = -1 << v45;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_46:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

unint64_t sub_10000C228(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = static Hasher._hash(seed:_:)(*(_QWORD *)(a2 + 40), *v10);
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            v14 = (_QWORD *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1)
              *v14 = *v10;
            v15 = *(_QWORD *)(a2 + 56);
            v16 = (_OWORD *)(v15 + 16 * v3);
            v17 = (_OWORD *)(v15 + 16 * v6);
            if (v3 != v6 || (v3 = v6, v16 >= v17 + 1))
            {
              *v16 = *v17;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_10000C3BC()
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
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_10000937C(&qword_100025E88);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
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
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    v19 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v18);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v18) = v19;
    result = (void *)swift_retain(*((_QWORD *)&v19 + 1));
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000C564()
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
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  id v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;

  v1 = v0;
  sub_10000937C((uint64_t *)&unk_100026100);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
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
    v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13)
      goto LABEL_26;
    v25 = *(_QWORD *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      v9 = v24 + 1;
      if (v24 + 1 >= v13)
        goto LABEL_26;
      v25 = *(_QWORD *)(v6 + 8 * v9);
      if (!v25)
        break;
    }
LABEL_25:
    v12 = (v25 - 1) & v25;
    v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v18);
    v20 = *v19;
    v21 = v19[1];
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v18);
    *v22 = v20;
    v22[1] = v21;
    v23 = v17;
    result = (void *)swift_bridgeObjectRetain(v21);
  }
  v26 = v24 + 2;
  if (v26 >= v13)
    goto LABEL_26;
  v25 = *(_QWORD *)(v6 + 8 * v26);
  if (v25)
  {
    v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v25 = *(_QWORD *)(v6 + 8 * v9);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10000C718(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v10 = *v4;
  v12 = sub_100018244(a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_10000C3BC();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = (_QWORD *)(v18[7] + 16 * v12);
      result = swift_release(v19[1]);
      *v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(_QWORD *)(v18[6] + 8 * v12) = a3;
    v21 = (_QWORD *)(v18[7] + 16 * v12);
    *v21 = a1;
    v21[1] = a2;
    v22 = v18[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_10000BBF8(result, a4 & 1);
  result = sub_100018244(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for ObjectIdentifier);
  __break(1u);
  return result;
}

id sub_10000C854(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  id result;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;

  v5 = v4;
  v9 = *v4;
  v11 = sub_100018274(a3);
  v12 = *(_QWORD *)(v9 + 16);
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v15 = v10;
  v16 = *(_QWORD *)(v9 + 24);
  if (v16 >= v14 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v16 >= v14 && (a4 & 1) == 0)
  {
    sub_10000C564();
LABEL_7:
    v17 = (_QWORD *)*v5;
    if ((v15 & 1) != 0)
    {
LABEL_8:
      v18 = (_QWORD *)(v17[7] + 16 * v11);
      result = (id)swift_bridgeObjectRelease(v18[1]);
      *v18 = a1;
      v18[1] = a2;
      return result;
    }
LABEL_11:
    v17[(v11 >> 6) + 8] |= 1 << v11;
    *(_QWORD *)(v17[6] + 8 * v11) = a3;
    v22 = (_QWORD *)(v17[7] + 16 * v11);
    *v22 = a1;
    v22[1] = a2;
    v23 = v17[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v17[2] = v25;
      return a3;
    }
    goto LABEL_14;
  }
  sub_10000BEA8(v14, a4 & 1);
  v20 = sub_100018274(a3);
  if ((v15 & 1) == (v21 & 1))
  {
    v11 = v20;
    v17 = (_QWORD *)*v5;
    if ((v15 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  v26 = sub_10000937C(&qword_100025D68);
  result = (id)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v26);
  __break(1u);
  return result;
}

uint64_t sub_10000C9B8(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_10000C9DC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CFString(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000CA1C(uint64_t a1, unint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD **v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void (*v47)(uint64_t, unint64_t, void *, uint64_t (*)(uint64_t), _QWORD *);
  _QWORD *v48;
  id v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  void (*v57)(char *);
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66[3];

  v7 = v6;
  v62 = a4;
  v63 = a6;
  v61 = a5;
  v11 = type metadata accessor for Logger(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v51 - v17;
  v19 = Logger.testVerification.unsafeMutableAddressor(v16);
  v57 = *(void (**)(char *))(v12 + 16);
  v58 = v19;
  v57(v18);
  v20 = a3;
  swift_bridgeObjectRetain_n(a2, 2);
  v21 = v20;
  v22 = Logger.logObject.getter(v21);
  v56 = static os_log_type_t.info.getter();
  v23 = os_log_type_enabled(v22, (os_log_type_t)v56);
  v64 = a3;
  v59 = v15;
  v60 = v11;
  if (v23)
  {
    v53 = v12;
    v54 = v7;
    v24 = swift_slowAlloc(22, -1);
    v52 = swift_slowAlloc(64, -1);
    v66[0] = v52;
    *(_DWORD *)v24 = 136315394;
    swift_bridgeObjectRetain(a2);
    v55 = a1;
    v65 = sub_100017A54(a1, a2, v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, v66, v24 + 4);
    swift_bridgeObjectRelease_n(a2, 3);
    *(_WORD *)(v24 + 12) = 2080;
    v25 = a2;
    if (a3)
    {
      v26 = objc_msgSend(v21, "description");
      v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
      v29 = v28;

    }
    else
    {
      v29 = 0xE300000000000000;
      v27 = 7104878;
    }
    v65 = sub_100017A54(v27, v29, v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, v66, v24 + 14);

    swift_bridgeObjectRelease(v29);
    _os_log_impl((void *)&_mh_execute_header, v22, (os_log_type_t)v56, "Validate Verification Code %s in region %s", (uint8_t *)v24, 0x16u);
    v32 = v52;
    swift_arrayDestroy(v52, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1, -1);
    swift_slowDealloc(v24, -1, -1);

    v31 = *(void (**)(char *, uint64_t))(v53 + 8);
    v11 = v60;
    v31(v18, v60);
    v7 = v54;
    v30 = v55;
    v15 = v59;
  }
  else
  {
    v30 = a1;

    swift_bridgeObjectRelease_n(a2, 2);
    v31 = *(void (**)(char *, uint64_t))(v12 + 8);
    v31(v18, v11);
    v25 = a2;
  }
  sub_10000D568();
  ((void (*)(char *, uint64_t, uint64_t))v57)(v15, v58, v11);
  v33 = swift_bridgeObjectRetain_n(v25, 2);
  v34 = Logger.logObject.getter(v33);
  v35 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)swift_slowAlloc(12, -1);
    v37 = swift_slowAlloc(32, -1);
    v66[0] = v37;
    *(_DWORD *)v36 = 136315138;
    swift_bridgeObjectRetain(v25);
    v65 = sub_100017A54(v30, v25, v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, v66, v36 + 4);
    swift_bridgeObjectRelease_n(v25, 3);
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "Validate Verification Code with server %s", v36, 0xCu);
    swift_arrayDestroy(v37, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v37, -1, -1);
    swift_slowDealloc(v36, -1, -1);

    v38 = v59;
    v39 = v60;
  }
  else
  {

    swift_bridgeObjectRelease_n(v25, 2);
    v38 = v15;
    v39 = v11;
  }
  v40 = ((uint64_t (*)(char *, uint64_t))v31)(v38, v39);
  v41 = (_QWORD **)ENManagerAdapter.defaultAdapter.unsafeMutableAddressor(v40);
  swift_beginAccess(v41, v66, 0, 0);
  v42 = *v41;
  v43 = (_QWORD *)swift_allocObject(&unk_1000219E0, 48, 7);
  v44 = v61;
  v45 = v62;
  v43[2] = v62;
  v43[3] = v7;
  v46 = v63;
  v43[4] = v44;
  v43[5] = v46;
  v47 = *(void (**)(uint64_t, unint64_t, void *, uint64_t (*)(uint64_t), _QWORD *))((swift_isaMask & *v42) + 0x1F8);
  v48 = v42;
  v49 = v45;
  swift_retain(v7);
  swift_retain(v46);
  v47(v30, v25, v64, sub_10000D8C0, v43);

  return swift_release(v43);
}

uint64_t sub_10000CEDC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _QWORD aBlock[5];
  _QWORD *v34;

  v28 = a4;
  v9 = type metadata accessor for DispatchWorkItemFlags(0);
  v31 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for DispatchQoS(0);
  v29 = *(_QWORD *)(v12 - 8);
  v30 = v12;
  __chkstk_darwin(v12);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_10000937C(&qword_100025F90);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  __chkstk_darwin(v15);
  sub_10000D8CC(a1, (uint64_t)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = *(unsigned __int8 *)(v16 + 80);
  v19 = (v18 + 48) & ~v18;
  v20 = (_QWORD *)swift_allocObject(&unk_100021A08, v19 + v17, v18 | 7);
  v21 = v28;
  v20[2] = a3;
  v20[3] = v21;
  v20[4] = a5;
  v20[5] = a2;
  sub_10000D9C4((uint64_t)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v20 + v19);
  aBlock[4] = sub_10000DA0C;
  v34 = v20;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000DF84;
  aBlock[3] = &unk_100021A20;
  v22 = _Block_copy(aBlock);
  swift_retain(a3);
  swift_retain(a5);
  static DispatchQoS.unspecified.getter(a2);
  v32 = &_swiftEmptyArrayStorage;
  v23 = sub_10000DA5C();
  v24 = sub_10000937C(&qword_100025FA0);
  v25 = sub_10000DAA4();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v32, v24, v25, v9, v23);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v14, v11, v22);
  _Block_release(v22);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v9);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v30);
  return swift_release(v34);
}

uint64_t sub_10000D11C(uint64_t a1, void (*a2)(_QWORD *), uint64_t a3, uint64_t a4, uint64_t a5)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char *v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  uint64_t v38;
  _QWORD *v40;
  void (*v41)(_QWORD *);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  NSString v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(_QWORD *);
  uint64_t v64;
  void *v65;
  _QWORD aBlock[5];
  uint64_t v67;

  v55 = a5;
  v62 = a4;
  v63 = a2;
  v64 = a3;
  v54 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v54 - 8);
  __chkstk_darwin(v54);
  v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchWorkItemFlags(0);
  v60 = *(_QWORD *)(v9 - 8);
  v61 = v9;
  __chkstk_darwin(v9);
  v57 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchQoS(0);
  v58 = *(_QWORD *)(v11 - 8);
  v59 = v11;
  __chkstk_darwin(v11);
  v56 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_10000937C(&qword_100025F90);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  __chkstk_darwin(v13);
  v16 = type metadata accessor for DispatchTime(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __chkstk_darwin(v18);
  v23 = (char *)&v54 - v22;
  if (*(_QWORD *)(a1 + 32))
  {
    v24 = v21;
    v25 = sub_10000D6D0();
    static DispatchTime.now()(v25);
    + infix(_:_:)(v20, 0.5);
    v26 = *(void (**)(char *, uint64_t))(v17 + 8);
    v26(v20, v24);
    sub_10000D8CC(v55, (uint64_t)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
    v27 = *(unsigned __int8 *)(v14 + 80);
    v28 = (v27 + 32) & ~v27;
    v29 = swift_allocObject(&unk_100021A58, v28 + v15, v27 | 7);
    v30 = v64;
    *(_QWORD *)(v29 + 16) = v63;
    *(_QWORD *)(v29 + 24) = v30;
    sub_10000D9C4((uint64_t)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v29 + v28);
    aBlock[4] = sub_10000DBD0;
    v67 = v29;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000DF84;
    aBlock[3] = &unk_100021A70;
    v31 = _Block_copy(aBlock);
    v32 = swift_retain(v30);
    v33 = v56;
    static DispatchQoS.unspecified.getter(v32);
    v65 = &_swiftEmptyArrayStorage;
    v34 = sub_10000DA5C();
    v35 = sub_10000937C(&qword_100025FA0);
    v36 = sub_10000DAA4();
    v37 = v57;
    v38 = v61;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v65, v35, v36, v61, v34);
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v23, v33, v37, v31);
    _Block_release(v31);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v37, v38);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v33, v59);
    v26(v23, v24);
    return swift_release(v67);
  }
  else
  {
    v40 = (uint64_t *)((char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
    v41 = v63;
    v42 = Logger.testVerification.unsafeMutableAddressor(v21);
    v43 = v54;
    v44 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v42, v54);
    v45 = Logger.logObject.getter(v44);
    v46 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v47 = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, v46, "User cancelled verification code validation", v47, 2u);
      swift_slowDealloc(v47, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v43);
    static String._unconditionallyBridgeFromObjectiveC(_:)(NSCocoaErrorDomain);
    v49 = v48;
    v50 = objc_allocWithZone((Class)NSError);
    v51 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v49);
    v52 = objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 3072, 0);

    *v40 = v52;
    swift_storeEnumTagMultiPayload(v40, v13, 1);
    v53 = v52;
    v41(v40);

    return sub_10000DAF0((uint64_t)v40);
  }
}

uint64_t sub_10000D568()
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
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = Logger.testVerification.unsafeMutableAddressor(v4);
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Show Validating Dialog", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v12 = type metadata accessor for ValidatingDialog();
  v13 = (_QWORD *)swift_allocObject(v12, 48, 7);
  v13[3] = 0;
  v14 = swift_unknownObjectWeakInit(v13 + 2, 0);
  v13[4] = 0;
  v13[5] = 0;
  v13[3] = &off_1000219C0;
  swift_unknownObjectWeakAssign(v14, v1);
  v15 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)(v1 + 32) = v13;
  swift_retain(v13);
  swift_release(v15);
  sub_10000B110();
  return swift_release(v13);
}

uint64_t sub_10000D6D0()
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
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t result;
  uint64_t v13;
  __CFRunLoopSource *v14;
  void *v15;
  __CFUserNotification *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin();
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = Logger.testVerification.unsafeMutableAddressor(v4);
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Hide Validating Dialog", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v13 = *(_QWORD *)(v1 + 32);
  if (v13)
  {
    v14 = *(__CFRunLoopSource **)(v13 + 40);
    if (v14)
    {
      swift_retain(*(_QWORD *)(v1 + 32));
      CFRunLoopSourceInvalidate(v14);
      v15 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = 0;

      v16 = *(__CFUserNotification **)(v13 + 32);
      if (v16)
      {
LABEL_6:
        CFUserNotificationCancel(v16);
        v17 = *(void **)(v13 + 32);
        *(_QWORD *)(v13 + 32) = 0;
        swift_release(v13);

LABEL_9:
        v18 = *(_QWORD *)(v1 + 32);
        *(_QWORD *)(v1 + 32) = 0;
        return swift_release(v18);
      }
    }
    else
    {
      swift_retain(*(_QWORD *)(v1 + 32));
      v16 = *(__CFUserNotification **)(v13 + 32);
      if (v16)
        goto LABEL_6;
    }
    swift_release(v13);
    goto LABEL_9;
  }
  return result;
}

uint64_t sub_10000D848()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for VerificationCodeValidator()
{
  return objc_opt_self(_TtC16HealthENLauncher25VerificationCodeValidator);
}

uint64_t sub_10000D88C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000D8C0(uint64_t a1)
{
  uint64_t v1;

  return sub_10000CEDC(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_10000D8CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000937C(&qword_100025F90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D914()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_10000937C(&qword_100025F90);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 48) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));

  if (swift_getEnumCaseMultiPayload(v0 + v4, v1) == 1)
  {
    swift_errorRelease(*(_QWORD *)(v0 + v4));
  }
  else
  {
    v6 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v0 + v4, v6);
  }
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10000D9C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000937C(&qword_100025F90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000DA0C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_10000937C(&qword_100025F90) - 8) + 80);
  return sub_10000D11C(*(_QWORD *)(v0 + 16), *(void (**)(_QWORD *))(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), v0 + ((v1 + 48) & ~v1));
}

uint64_t sub_10000DA44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000DA54(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_10000DA5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025F98;
  if (!qword_100025F98)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_100025F98);
  }
  return result;
}

unint64_t sub_10000DAA4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025FA8;
  if (!qword_100025FA8)
  {
    v1 = sub_10000AF24(&qword_100025FA0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100025FA8);
  }
  return result;
}

uint64_t sub_10000DAF0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000937C(&qword_100025F90);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000DB30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_10000937C(&qword_100025F90);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  swift_release(*(_QWORD *)(v0 + 24));
  if (swift_getEnumCaseMultiPayload(v0 + v4, v1) == 1)
  {
    swift_errorRelease(*(_QWORD *)(v0 + v4));
  }
  else
  {
    v6 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v0 + v4, v6);
  }
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10000DBD0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_10000937C(&qword_100025F90) - 8) + 80);
  return (*(uint64_t (**)(uint64_t))(v0 + 16))(v0 + ((v1 + 32) & ~v1));
}

uint64_t sub_10000DC1C(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v6 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v7 = a1;
    else
      v7 = a1 & 0xFFFFFFFFFFFFFF8;
    v8 = __CocoaSet.startIndex.getter(v7);
    v10 = v9;
    v11 = __CocoaSet.endIndex.getter(v7);
    v13 = static __CocoaSet.Index.== infix(_:_:)(v8, v10, v11, v12);
    swift_bridgeObjectRelease(v11);
    if ((v13 & 1) != 0)
      goto LABEL_6;
    goto LABEL_10;
  }
  result = sub_100018B8C(a1);
  if ((v17 & 1) == 0)
  {
    v10 = v16;
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v16)
    {
      v8 = result;
      if (result == 1 << *(_BYTE *)(a1 + 32))
      {
LABEL_6:
        sub_100019978(v8, v10, v6 != 0);
        return 0;
      }
LABEL_10:
      sub_10001892C(v8, v10, v6 != 0, a1, a2, a3);
      v14 = v18;
      sub_100019978(v8, v10, v6 != 0);
      return v14;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_10000DD40(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  unint64_t result;
  char v12;
  _QWORD *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000937C((uint64_t *)&unk_100026100);
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
  v6 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v7 = (void *)*(v6 - 2);
    v8 = *(v6 - 1);
    v9 = *v6;
    v10 = v7;
    swift_bridgeObjectRetain(v9);
    result = sub_100018274(v7);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v7;
    v13 = (_QWORD *)(v4[7] + 16 * result);
    *v13 = v8;
    v13[1] = v9;
    v14 = v4[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v6 += 3;
    v4[2] = v16;
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

unint64_t sub_10000DE50(uint64_t a1)
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
  sub_10000937C(&qword_1000260A8);
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
    sub_100018844(v7, (uint64_t)&v16, (uint64_t *)&unk_1000260B0);
    v8 = v16;
    v9 = v17;
    result = sub_100018330(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_100018888(&v18, (_OWORD *)(v4[7] + 32 * result));
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

uint64_t sub_10000DF84(uint64_t a1)
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

id sub_10000E17C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char v22;
  id v23;
  void *v24;
  void (*v25)(char *, char *, uint64_t);
  char *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  char *v39;

  v2 = sub_10000937C(&qword_1000260D0);
  __chkstk_darwin(v2);
  v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_10000937C((uint64_t *)&unk_100026050);
  __chkstk_darwin(v5);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = __chkstk_darwin(v8);
  v12 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v39 = (char *)&v38 - v13;
  v14 = objc_msgSend(a1, "activityType");
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  v17 = v16;

  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSUserActivityTypeBrowsingWeb);
  if (v15 == v18 && v17 == v19)
  {
    swift_bridgeObjectRelease_n(v17, 2);
  }
  else
  {
    v21 = v19;
    v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v17, v18, v19, 0);
    swift_bridgeObjectRelease(v17);
    swift_bridgeObjectRelease(v21);
    if ((v22 & 1) == 0)
      return objc_msgSend(a1, "invalidate");
  }
  v23 = objc_msgSend(a1, "webpageURL");
  if (v23)
  {
    v24 = v23;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v25 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v25(v7, v12, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
    {
      v26 = v39;
      v25(v39, v7, v8);
      URLComponents.init(url:resolvingAgainstBaseURL:)(v26, 1);
      v27 = type metadata accessor for URLComponents(0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 48))(v4, 1, v27) != 1)
      {
        sub_100009580((uint64_t)v4, &qword_1000260D0);
        type metadata accessor for ENUIPublicHealthAgencyModel(0);
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v26, v8);
        v31 = *(unsigned __int8 *)(v9 + 80);
        v32 = (v31 + 24) & ~v31;
        v33 = (v10 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
        v34 = swift_allocObject(&unk_100022578, v33 + 8, v31 | 7);
        *(_QWORD *)(v34 + 16) = a1;
        v25((char *)(v34 + v32), v12, v8);
        v35 = v38;
        *(_QWORD *)(v34 + v33) = v38;
        v36 = a1;
        v37 = v35;
        static ENUIPublicHealthAgencyModel.refreshRegions(completion:)(sub_1000198EC, v34);
        swift_release(v34);
        return (id)(*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v26, v8);
      }
      (*(void (**)(char *, uint64_t))(v9 + 8))(v26, v8);
      v28 = &qword_1000260D0;
      v29 = (uint64_t)v4;
      goto LABEL_14;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  }
  v28 = (uint64_t *)&unk_100026050;
  v29 = (uint64_t)v7;
LABEL_14:
  sub_100009580(v29, v28);
  return objc_msgSend(a1, "invalidate");
}

void sub_10000E4E4(void *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t (**v5)(char *, NSObject *, uint64_t);
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t *v18;
  char v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint8_t *v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  id v39;
  NSURL *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t inited;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  Class isa;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  id v65;
  NSURL *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  Class v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  uint8_t *v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  id v89;
  uint8_t *v90;
  NSObject *v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char v100[32];

  v93 = a1;
  v94 = a3;
  v4 = type metadata accessor for URL(0);
  v5 = *(uint64_t (***)(char *, NSObject *, uint64_t))(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v90 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Logger(0);
  v95 = *(_QWORD *)(v8 - 8);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v90 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v90 - v13;
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v90 - v16;
  v18 = (uint64_t *)ENUIPublicHealthAgencyModel.availableRegions.unsafeMutableAddressor(v15);
  swift_beginAccess(v18, v100, 0, 0);
  if (static ENUIPublicHealthAgencyModel.activeRegion)
  {
    v19 = *(_BYTE *)(static ENUIPublicHealthAgencyModel.activeRegion
                   + direct field offset for ENUIPublicHealthAgencyModel.isAssociatedDomainAllowed);
    v20 = static ENUIPublicHealthAgencyModel.activeRegion;
    v21 = v20;
    if ((v19 & 1) != 0)
    {
      sub_10000EE6C(a2);

    }
    else
    {
      v27 = Logger.launcher.unsafeMutableAddressor(v20);
      v28 = v95;
      (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))(v17, v27, v8);
      v29 = v21;
      v30 = Logger.logObject.getter(v29);
      v31 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v30, v31))
      {
        v91 = a2;
        v32 = swift_slowAlloc(12, -1);
        v92 = v8;
        v33 = (uint8_t *)v32;
        v94 = swift_slowAlloc(32, -1);
        v99 = v94;
        *(_DWORD *)v33 = 136315138;
        v90 = v33 + 4;
        v34 = objc_msgSend(*(id *)&v29[direct field offset for ENUIPublicHealthAgencyModel.region], "regionCode");
        v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
        v37 = v36;

        v98 = sub_100017A54(v35, v37, &v99);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v98, &v99, v90);

        swift_bridgeObjectRelease(v37);
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "Intercepted associated link is not allowed for %s", v33, 0xCu);
        v38 = v94;
        swift_arrayDestroy(v94, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v38, -1, -1);
        swift_slowDealloc(v33, -1, -1);

        (*(void (**)(char *, uint64_t))(v95 + 8))(v17, v92);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v8);
      }
      objc_msgSend(v93, "invalidate");
      v39 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
      if (v39)
      {
        v41 = v39;
        URL._bridgeToObjectiveC()(v40);
        v43 = v42;
        v44 = sub_10000937C(&qword_100026060);
        inited = swift_initStackObject(v44, &v96);
        *(_OWORD *)(inited + 16) = xmmword_10001B060;
        *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyUnlockDevice);
        *(_QWORD *)(inited + 40) = v46;
        *(_QWORD *)(inited + 72) = &type metadata for Bool;
        *(_BYTE *)(inited + 48) = 1;
        *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyPromptUnlockDevice);
        *(_QWORD *)(inited + 88) = v47;
        *(_QWORD *)(inited + 120) = &type metadata for Bool;
        *(_BYTE *)(inited + 96) = 1;
        v48 = sub_10000DE50(inited);
        isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v48);
        objc_msgSend(v41, "openURL:withOptions:", v43, isa);

      }
    }
  }
  else
  {
    v92 = v8;
    v22 = *v18;
    if ((unint64_t)*v18 >> 62)
      goto LABEL_31;
    v23 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(*v18);
    if (v23)
    {
      v91 = a2;
      swift_bridgeObjectRetain(v22);
      do
      {
        a2 = (v22 & 0xC000000000000001);
        if ((v22 & 0xC000000000000001) != 0)
          v24 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v22);
        else
          v24 = *(id *)(v22 + 32);
        v25 = v24;
        v5 = (uint64_t (**)(char *, NSObject *, uint64_t))&direct field offset for ENUIPublicHealthAgencyModel.isAssociatedDomainAllowed;
        if ((*((_BYTE *)v24 + direct field offset for ENUIPublicHealthAgencyModel.isAssociatedDomainAllowed) & 1) != 0)
        {
LABEL_10:
          swift_bridgeObjectRelease_n(v22, 2);

          v26 = v91;
          goto LABEL_41;
        }

        if (v23 == 1)
          break;
        v4 = 5;
        while (1)
        {
          v50 = a2
              ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, v22)
              : *(id *)(v22 + 8 * v4);
          v25 = v50;
          v11 = (char *)(v4 - 3);
          if (__OFADD__(v4 - 4, 1))
            break;
          if ((*((_BYTE *)v50 + direct field offset for ENUIPublicHealthAgencyModel.isAssociatedDomainAllowed) & 1) != 0)
            goto LABEL_10;

          ++v4;
          if (v11 == (char *)v23)
            goto LABEL_25;
        }
        __break(1u);
LABEL_31:
        if (v22 < 0)
          v76 = v22;
        else
          v76 = v22 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain_n(v22, 2);
        v77 = _CocoaArrayWrapper.endIndex.getter(v76);
        swift_bridgeObjectRelease(v22);
        if (v77 <= 0)
          goto LABEL_37;
        v91 = a2;
        swift_bridgeObjectRetain(v22);
        v23 = _CocoaArrayWrapper.endIndex.getter(v76);
      }
      while (v23);
LABEL_25:
      v51 = swift_bridgeObjectRelease(v22);
      v52 = Logger.launcher.unsafeMutableAddressor(v51);
      v53 = v95;
      v54 = v92;
      (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))(v14, v52, v92);
      v55 = swift_bridgeObjectRetain(v22);
      v56 = Logger.logObject.getter(v55);
      v57 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v56, v57))
      {
        v58 = (uint8_t *)swift_slowAlloc(12, -1);
        v59 = swift_slowAlloc(32, -1);
        v99 = v59;
        *(_DWORD *)v58 = 136315138;
        v94 = (uint64_t)(v58 + 4);
        v60 = type metadata accessor for ENUIPublicHealthAgencyModel(0);
        v61 = swift_bridgeObjectRetain(v22);
        v62 = Array.description.getter(v61, v60);
        v64 = v63;
        swift_bridgeObjectRelease(v22);
        v98 = sub_100017A54(v62, v64, &v99);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v98, &v99, v94);
        swift_bridgeObjectRelease_n(v22, 2);
        swift_bridgeObjectRelease(v64);
        _os_log_impl((void *)&_mh_execute_header, v56, v57, "Intercepted associated link is not available in %s", v58, 0xCu);
        swift_arrayDestroy(v59, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v59, -1, -1);
        swift_slowDealloc(v58, -1, -1);

        (*(void (**)(char *, uint64_t))(v95 + 8))(v14, v92);
      }
      else
      {

        swift_bridgeObjectRelease_n(v22, 2);
        (*(void (**)(char *, uint64_t))(v53 + 8))(v14, v54);
      }
      objc_msgSend(v93, "invalidate");
      v65 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
      if (v65)
      {
        v67 = v65;
        URL._bridgeToObjectiveC()(v66);
        v69 = v68;
        v70 = sub_10000937C(&qword_100026060);
        v71 = swift_initStackObject(v70, &v97);
        *(_OWORD *)(v71 + 16) = xmmword_10001B060;
        *(_QWORD *)(v71 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyUnlockDevice);
        *(_QWORD *)(v71 + 40) = v72;
        *(_QWORD *)(v71 + 72) = &type metadata for Bool;
        *(_BYTE *)(v71 + 48) = 1;
        *(_QWORD *)(v71 + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyPromptUnlockDevice);
        *(_QWORD *)(v71 + 88) = v73;
        *(_QWORD *)(v71 + 120) = &type metadata for Bool;
        *(_BYTE *)(v71 + 96) = 1;
        v74 = sub_10000DE50(v71);
        v75 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v74);
        objc_msgSend(v67, "openURL:withOptions:", v69, v75);

      }
    }
    else
    {
LABEL_37:
      v78 = swift_bridgeObjectRelease(v22);
      v79 = Logger.launcher.unsafeMutableAddressor(v78);
      v80 = v92;
      (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))(v11, v79, v92);
      v81 = v5[2](v7, a2, v4);
      v82 = Logger.logObject.getter(v81);
      v83 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v82, v83))
      {
        v84 = (uint8_t *)swift_slowAlloc(12, -1);
        v93 = (id)swift_slowAlloc(32, -1);
        v99 = (uint64_t)v93;
        v91 = a2;
        *(_DWORD *)v84 = 136315138;
        v90 = v84 + 4;
        v85 = sub_100003574(&qword_1000260C0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
        v86 = dispatch thunk of CustomStringConvertible.description.getter(v4, v85);
        v88 = v87;
        v98 = sub_100017A54(v86, v87, &v99);
        a2 = v91;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v98, &v99, v90);
        swift_bridgeObjectRelease(v88);
        ((void (*)(char *, uint64_t))v5[1])(v7, v4);
        _os_log_impl((void *)&_mh_execute_header, v82, v83, "Intercepted associated link %s", v84, 0xCu);
        v89 = v93;
        swift_arrayDestroy(v93, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v89, -1, -1);
        swift_slowDealloc(v84, -1, -1);

        (*(void (**)(char *, uint64_t))(v95 + 8))(v11, v92);
      }
      else
      {
        ((void (*)(char *, uint64_t))v5[1])(v7, v4);

        (*(void (**)(char *, uint64_t))(v95 + 8))(v11, v80);
      }
      v26 = a2;
LABEL_41:
      sub_10000EE6C(v26);
    }
  }
}

void sub_10000EE6C(NSObject *a1)
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v14;
  char *v15;
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
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  const char *v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  os_log_t v61;
  uint64_t v62;
  unsigned __int8 v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint64_t v68;
  uint8_t *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  id v77;
  Swift::String v78;
  Swift::String v79;
  Swift::String v80;
  id v81;
  Swift::String v82;
  Swift::String v83;
  Swift::String v84;
  id v85;
  Swift::String v86;
  Swift::String v87;
  Swift::String v88;
  uint64_t v89;
  uint64_t v90;
  Swift::String v91;
  Swift::Bool v92;
  id v93;
  NSURL *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t inited;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  Class isa;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  NSObject *v112;
  os_log_type_t v113;
  uint8_t *v114;
  void *v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  NSObject *v120;
  os_log_type_t v121;
  uint8_t *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  NSObject *v131;
  os_log_type_t v132;
  uint8_t *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  unint64_t v139;
  void (*v140)(char *, uint64_t);
  uint64_t v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  char *v145;
  char *v146;
  uint64_t v147;
  uint64_t v148;
  NSObject *v149;
  os_log_type_t v150;
  uint64_t v151;
  uint8_t *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  unint64_t v158;
  uint64_t v159;
  id v160;
  os_log_t v161;
  void *v162;
  NSURL *v163;
  void *v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  unint64_t v170;
  Class v171;
  uint64_t v172;
  uint64_t v173;
  char *v174;
  char *v175;
  char *v176;
  os_log_t v177;
  uint64_t v178;
  char *v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  char v186[136];
  Swift::String v187;
  Swift::String v188;
  Swift::String v189;

  v2 = sub_10000937C((uint64_t *)&unk_100026050);
  v3 = __chkstk_darwin(v2);
  v177 = (os_log_t)((char *)&v172 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v3);
  v174 = (char *)&v172 - v5;
  v6 = type metadata accessor for URL(0);
  v7 = *(char **)(v6 - 8);
  v178 = v6;
  v179 = v7;
  v8 = __chkstk_darwin(v6);
  v176 = (char *)&v172 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v175 = (char *)&v172 - v10;
  v11 = type metadata accessor for Logger(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v172 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v172 - v17;
  v19 = __chkstk_darwin(v16);
  v21 = (char *)&v172 - v20;
  v22 = __chkstk_darwin(v19);
  v24 = (char *)&v172 - v23;
  v25 = __chkstk_darwin(v22);
  v27 = (char *)&v172 - v26;
  __chkstk_darwin(v25);
  v29 = (char *)&v172 - v28;
  v180 = a1;
  v30 = sub_100004B30(a1);
  if ((v33 & 0x10000000000) != 0)
  {
    v63 = v30;
    v64 = Logger.launcher.unsafeMutableAddressor(v30);
    v65 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v64, v11);
    v66 = Logger.logObject.getter(v65);
    v67 = static os_log_type_t.error.getter();
    v68 = v12;
    if (os_log_type_enabled(v66, v67))
    {
      v69 = (uint8_t *)swift_slowAlloc(12, -1);
      v70 = swift_slowAlloc(32, -1);
      v185 = v70;
      v182 = v68;
      *(_DWORD *)v69 = 136315138;
      LOBYTE(v184) = v63;
      v71 = String.init<A>(describing:)(&v184, &type metadata for URLParser.URLParserError);
      v173 = v11;
      v73 = v72;
      v184 = sub_100017A54(v71, v72, &v185);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v184, &v185, v69 + 4);
      swift_bridgeObjectRelease(v73);
      _os_log_impl((void *)&_mh_execute_header, v66, v67, "URL failed %s", v69, 0xCu);
      swift_arrayDestroy(v70, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v70, -1, -1);
      swift_slowDealloc(v69, -1, -1);

      v74 = (*(uint64_t (**)(char *, uint64_t))(v182 + 8))(v15, v173);
    }
    else
    {

      v74 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    }
    if (v63 - 2 < 2)
      goto LABEL_10;
    if (v63 != 4)
    {
      sub_10001077C(v63 & 1);
      return;
    }
    URL.scheme.getter(v74);
    if (v89
      && (v90 = v89,
          v91._countAndFlagsBits = 1886680168,
          v91._object = (void *)0xE400000000000000,
          v92 = String.hasPrefix(_:)(v91),
          swift_bridgeObjectRelease(v90),
          v92))
    {
      v93 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
      if (v93)
      {
        v95 = v93;
        URL._bridgeToObjectiveC()(v94);
        v97 = v96;
        v98 = sub_10000937C(&qword_100026060);
        inited = swift_initStackObject(v98, v186);
        *(_OWORD *)(inited + 16) = xmmword_10001B060;
        *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyUnlockDevice);
        *(_QWORD *)(inited + 40) = v100;
        *(_QWORD *)(inited + 72) = &type metadata for Bool;
        *(_BYTE *)(inited + 48) = 1;
        *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyPromptUnlockDevice);
        *(_QWORD *)(inited + 88) = v101;
        *(_QWORD *)(inited + 120) = &type metadata for Bool;
        *(_BYTE *)(inited + 96) = 1;
        v102 = sub_10000DE50(inited);
        isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v102);
        objc_msgSend(v95, "openURL:withOptions:", v97, isa);

      }
    }
    else
    {
LABEL_10:
      if (qword_100025968 != -1)
        swift_once(&qword_100025968, sub_10000A5AC);
      v75 = qword_100027210;
      v76 = (void *)objc_opt_self(NSBundle);
      swift_retain(v75);
      v77 = objc_msgSend(v76, "mainBundle");
      v187._object = (void *)0xEB00000000656C74;
      v78._object = (void *)0x800000010001BC30;
      v78._countAndFlagsBits = 0xD000000000000011;
      v79._countAndFlagsBits = 0;
      v79._object = (void *)0xE000000000000000;
      v187._countAndFlagsBits = 0x6974207472656C41;
      v80 = NSLocalizedString(_:tableName:bundle:value:comment:)(v78, (Swift::String_optional)0, (NSBundle)v77, v79, v187);

      v81 = objc_msgSend(v76, "mainBundle");
      v82._countAndFlagsBits = 0xD000000000000013;
      v188._object = (void *)0xED00006567617373;
      v82._object = (void *)0x800000010001BC50;
      v83._countAndFlagsBits = 0;
      v83._object = (void *)0xE000000000000000;
      v188._countAndFlagsBits = 0x656D207472656C41;
      v84 = NSLocalizedString(_:tableName:bundle:value:comment:)(v82, (Swift::String_optional)0, (NSBundle)v81, v83, v188);

      v85 = objc_msgSend(v76, "mainBundle");
      v189._object = (void *)0xE600000000000000;
      v86._countAndFlagsBits = 19279;
      v86._object = (void *)0xE200000000000000;
      v87._countAndFlagsBits = 0;
      v87._object = (void *)0xE000000000000000;
      v189._countAndFlagsBits = 0x6E6F74747542;
      v88 = NSLocalizedString(_:tableName:bundle:value:comment:)(v86, (Swift::String_optional)0, (NSBundle)v85, v87, v189);

      sub_10000A5D8(v80._countAndFlagsBits, (uint64_t)v80._object, v84._countAndFlagsBits, (uint64_t)v84._object, v88._countAndFlagsBits, (uint64_t)v88._object, 0, 0, 0, 0);
      swift_release(v75);
      swift_bridgeObjectRelease(v80._object);
      swift_bridgeObjectRelease(v84._object);
      swift_bridgeObjectRelease(v88._object);
    }
  }
  else
  {
    v34 = v31;
    v182 = v12;
    v35 = v11;
    if (BYTE4(v33))
    {
      if (BYTE4(v33) == 1)
      {
        v180 = (void *)v30;
        v36 = (void *)v32;
        v37 = v33;
        sub_1000197E8(v30, v31, (void *)v32, v33, 0);
        v38 = v36;
        v39 = swift_bridgeObjectRetain(v34);
        v40 = Logger.testVerification.unsafeMutableAddressor(v39);
        v41 = v182;
        v42 = v21;
        v43 = v35;
        (*(void (**)(char *, uint64_t, uint64_t))(v182 + 16))(v21, v40, v35);
        swift_bridgeObjectRetain_n(v34, 2);
        v44 = v38;
        v45 = Logger.logObject.getter(v44);
        v46 = static os_log_type_t.info.getter();
        v47 = v46;
        if (os_log_type_enabled(v45, v46))
        {
          v48 = swift_slowAlloc(32, -1);
          v177 = v45;
          v49 = v48;
          v178 = swift_slowAlloc(96, -1);
          v185 = v178;
          *(_DWORD *)v49 = 136315650;
          v179 = v42;
          swift_bridgeObjectRetain(v34);
          v184 = sub_100017A54((uint64_t)v180, v34, &v185);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v184, &v185, v49 + 4);
          swift_bridgeObjectRelease_n(v34, 3);
          *(_WORD *)(v49 + 12) = 2080;
          v184 = (uint64_t)v36;
          v50 = v44;
          LODWORD(v176) = v47;
          v51 = v44;
          v52 = v50;
          v53 = sub_10000937C(&qword_1000260C8);
          v54 = String.init<A>(describing:)(&v184, v53);
          v173 = v43;
          v56 = v55;
          v184 = sub_100017A54(v54, v55, &v185);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v184, &v185, v49 + 14);

          v44 = v51;
          swift_bridgeObjectRelease(v56);
          *(_WORD *)(v49 + 22) = 2080;
          v57 = sub_100019838(v37);
          v58 = String.init(cString:)(v57);
          v60 = v59;
          v184 = sub_100017A54(v58, v59, &v185);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v184, &v185, v49 + 24);
          swift_bridgeObjectRelease(v60);
          v61 = v177;
          _os_log_impl((void *)&_mh_execute_header, v177, (os_log_type_t)v176, "Verification code: %s, region: %s, reportType: %s", (uint8_t *)v49, 0x20u);
          v62 = v178;
          swift_arrayDestroy(v178, 3, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v62, -1, -1);
          swift_slowDealloc(v49, -1, -1);

          (*(void (**)(char *, uint64_t))(v182 + 8))(v179, v173);
        }
        else
        {

          swift_bridgeObjectRelease_n(v34, 2);
          (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v43);
        }
        v123 = (uint64_t)v180;
        sub_1000119C0((uint64_t)v180, v34, v36, v37);
        sub_100019794(v123, v34, v36, v37, 0);
        sub_100019794(v123, v34, v36, v37, 0);
        swift_bridgeObjectRelease(v34);

      }
      else
      {
        v116 = v32 | v31;
        if ((_DWORD)v33 || v116 | v30)
        {
          v181 = v33;
          if ((_DWORD)v33 || v30 != 1 || v116)
          {
            v141 = Logger.launcher.unsafeMutableAddressor(v30);
            v142 = v182;
            v143 = v18;
            v144 = v35;
            (*(void (**)(char *, uint64_t, uint64_t))(v182 + 16))(v18, v141, v35);
            v145 = v179;
            v146 = v176;
            v147 = v178;
            v148 = (*((uint64_t (**)(char *, void *, uint64_t))v179 + 2))(v176, v180, v178);
            v149 = Logger.logObject.getter(v148);
            v150 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v149, v150))
            {
              v151 = swift_slowAlloc(12, -1);
              v180 = v143;
              v152 = (uint8_t *)v151;
              v153 = swift_slowAlloc(32, -1);
              v173 = v144;
              v154 = v153;
              v185 = v153;
              *(_DWORD *)v152 = 136315138;
              v155 = sub_100003574(&qword_1000260C0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
              v156 = dispatch thunk of CustomStringConvertible.description.getter(v147, v155);
              v158 = v157;
              v184 = sub_100017A54(v156, v157, &v185);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v184, &v185, v152 + 4);
              swift_bridgeObjectRelease(v158);
              (*((void (**)(char *, uint64_t))v179 + 1))(v146, v147);
              _os_log_impl((void *)&_mh_execute_header, v149, v150, "Unknown link %s", v152, 0xCu);
              swift_arrayDestroy(v154, 1, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v154, -1, -1);
              swift_slowDealloc(v152, -1, -1);

              sub_100019794(2, 0, 0, v181, 0);
              (*(void (**)(void *, uint64_t))(v182 + 8))(v180, v173);
            }
            else
            {
              (*((void (**)(char *, uint64_t))v145 + 1))(v146, v147);

              sub_100019794(2, 0, 0, v181, 0);
              (*(void (**)(char *, uint64_t))(v142 + 8))(v143, v144);
            }
          }
          else
          {
            v124 = Logger.launcher.unsafeMutableAddressor(1);
            v125 = v182;
            v126 = v11;
            (*(void (**)(char *, uint64_t, uint64_t))(v182 + 16))(v24, v124, v11);
            v127 = v179;
            v128 = v175;
            v129 = v178;
            v130 = (*((uint64_t (**)(char *, void *, uint64_t))v179 + 2))(v175, v180, v178);
            v131 = Logger.logObject.getter(v130);
            v132 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v131, v132))
            {
              v133 = (uint8_t *)swift_slowAlloc(12, -1);
              v134 = swift_slowAlloc(32, -1);
              v173 = v126;
              v135 = v134;
              v185 = v134;
              *(_DWORD *)v133 = 136315138;
              v136 = sub_100003574(&qword_1000260C0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
              v137 = dispatch thunk of CustomStringConvertible.description.getter(v178, v136);
              v139 = v138;
              v184 = sub_100017A54(v137, v138, &v185);
              v129 = v178;
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v184, &v185, v133 + 4);
              swift_bridgeObjectRelease(v139);
              v140 = (void (*)(char *, uint64_t))*((_QWORD *)v179 + 1);
              v140(v128, v129);
              _os_log_impl((void *)&_mh_execute_header, v131, v132, "Report link %s", v133, 0xCu);
              swift_arrayDestroy(v135, 1, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v135, -1, -1);
              swift_slowDealloc(v133, -1, -1);

              (*(void (**)(char *, uint64_t))(v182 + 8))(v24, v173);
            }
            else
            {
              v140 = (void (*)(char *, uint64_t))*((_QWORD *)v127 + 1);
              v140(v128, v129);

              (*(void (**)(char *, uint64_t))(v125 + 8))(v24, v126);
            }
            v159 = (uint64_t)v174;
            URL.init(string:)(0xD00000000000002CLL, 0x800000010001BCF0);
            v160 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
            v161 = v177;
            if (v160)
            {
              v162 = v160;
              sub_100018844(v159, (uint64_t)v177, (uint64_t *)&unk_100026050);
              if ((*((unsigned int (**)(os_log_t, uint64_t, uint64_t))v179 + 6))(v161, 1, v129) == 1)
              {
                v164 = 0;
              }
              else
              {
                URL._bridgeToObjectiveC()(v163);
                v164 = v165;
                v140((char *)v161, v129);
              }
              v166 = sub_10000937C(&qword_100026060);
              v167 = swift_initStackObject(v166, &v183);
              *(_OWORD *)(v167 + 16) = xmmword_10001B060;
              *(_QWORD *)(v167 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyUnlockDevice);
              *(_QWORD *)(v167 + 40) = v168;
              *(_QWORD *)(v167 + 72) = &type metadata for Bool;
              *(_BYTE *)(v167 + 48) = 1;
              *(_QWORD *)(v167 + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyPromptUnlockDevice);
              *(_QWORD *)(v167 + 88) = v169;
              *(_QWORD *)(v167 + 120) = &type metadata for Bool;
              *(_BYTE *)(v167 + 96) = 1;
              v170 = sub_10000DE50(v167);
              v171 = Dictionary._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease(v170);
              objc_msgSend(v162, "openSensitiveURL:withOptions:", v164, v171);

            }
            sub_100019794(1, 0, 0, v181, 0);
            sub_100009580(v159, (uint64_t *)&unk_100026050);
          }
        }
        else
        {
          v117 = v33;
          v118 = Logger.launcher.unsafeMutableAddressor(v30);
          v119 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v182 + 16))(v27, v118, v11);
          v120 = Logger.logObject.getter(v119);
          v121 = static os_log_type_t.info.getter();
          if (os_log_type_enabled(v120, v121))
          {
            v122 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v122 = 0;
            _os_log_impl((void *)&_mh_execute_header, v120, v121, "preAuthorization", v122, 2u);
            swift_slowDealloc(v122, -1, -1);
          }

          (*(void (**)(char *, uint64_t))(v182 + 8))(v27, v11);
          sub_10001110C();
          sub_100019794(0, 0, 0, v117, 0);
          sub_100019794(0, 0, 0, v117, 0);
        }
      }
    }
    else
    {
      v104 = v30;
      v105 = (void *)v32;
      v106 = v33;
      sub_1000197F8(v30, v31, (void *)v32, v33, 0);
      v107 = v104;
      v180 = v105;
      v108 = v106;
      v109 = sub_1000197F8(v104, v34, v105, v106, 0);
      v110 = Logger.launcher.unsafeMutableAddressor(v109);
      v111 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v182 + 16))(v29, v110, v11);
      v112 = Logger.logObject.getter(v111);
      v113 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v112, v113))
      {
        v114 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v114 = 0;
        _os_log_impl((void *)&_mh_execute_header, v112, v113, "onboarding", v114, 2u);
        swift_slowDealloc(v114, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v182 + 8))(v29, v11);
      sub_10000FF48(v107, v34);
      v115 = v180;
      sub_100019794(v107, v34, v180, v108, 0);
      sub_100019794(v107, v34, v115, v108, 0);
      sub_1000197A4(v107, v34, v115, v108, 0);
    }
  }
}

uint64_t sub_10000FF48(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  _QWORD **v17;
  _QWORD *v18;
  _QWORD *v19;
  void (*v20)(uint64_t (*)(uint64_t, uint64_t), _QWORD *);
  id v21;
  _QWORD *v22;
  _BYTE v25[24];

  v3 = v2;
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = &v25[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v11 = Logger.launcher.unsafeMutableAddressor(v8);
  v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Start onboarding...", v15, 2u);
    swift_slowDealloc(v15, -1, -1);
  }

  v16 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  v17 = (_QWORD **)ENManagerAdapter.defaultAdapter.unsafeMutableAddressor(v16);
  swift_beginAccess(v17, v25, 0, 0);
  v18 = *v17;
  v19 = (_QWORD *)swift_allocObject(&unk_100022528, 40, 7);
  v19[2] = a1;
  v19[3] = a2;
  v19[4] = v3;
  v20 = *(void (**)(uint64_t (*)(uint64_t, uint64_t), _QWORD *))((swift_isaMask & *v18) + 0x198);
  swift_bridgeObjectRetain(a2);
  v21 = v3;
  v22 = v18;
  v20(sub_100018920, v19);

  return swift_release(v19);
}

uint64_t sub_1000100E4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD **v15;
  _QWORD *v16;
  _QWORD *v17;
  void (*v18)(uint64_t, uint64_t, void (*)(void *), _QWORD *);
  _QWORD *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;

  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v15 = (_QWORD **)ENManagerAdapter.defaultAdapter.unsafeMutableAddressor(v12);
    swift_beginAccess(v15, &v34, 0, 0);
    v16 = *v15;
    v17 = (_QWORD *)swift_allocObject(&unk_100022550, 56, 7);
    v17[2] = a3;
    v17[3] = a4;
    v17[4] = a5;
    v17[5] = a1;
    v17[6] = a2;
    v18 = *(void (**)(uint64_t, uint64_t, void (*)(void *), _QWORD *))((swift_isaMask & *v16)
                                                                                         + 0x190);
    swift_bridgeObjectRetain(a4);
    v19 = v16;
    v20 = a5;
    swift_bridgeObjectRetain(a2);
    v18(a1, a2, sub_100019784, v17);

    return swift_release(v17);
  }
  else
  {
    v22 = Logger.launcher.unsafeMutableAddressor(v12);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v22, v10);
    v23 = swift_bridgeObjectRetain_n(a4, 2);
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc(12, -1);
      v33 = swift_slowAlloc(32, -1);
      v34 = a3;
      v36 = v33;
      *(_DWORD *)v26 = 136315138;
      v32 = v26 + 4;
      v35 = a4;
      swift_bridgeObjectRetain(a4);
      v27 = sub_10000937C(&qword_100025A68);
      v28 = String.init<A>(describing:)(&v34, v27);
      v30 = v29;
      v34 = sub_100017A54(v28, v29, &v36);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v32);
      swift_bridgeObjectRelease_n(a4, 2);
      swift_bridgeObjectRelease(v30);
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Start onboarding (query param: %s)", v26, 0xCu);
      v31 = v33;
      swift_arrayDestroy(v33, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v31, -1, -1);
      swift_slowDealloc(v26, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a4, 2);
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    return sub_1000192A8(a3, a4);
  }
}

void sub_100010388(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  uint64_t v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint8_t *v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;

  v11 = type metadata accessor for Logger(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v45 - v17;
  if (a1)
  {
    v19 = a1;
    v20 = Logger.launcher.unsafeMutableAddressor(v19);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v20, v11);
    v21 = (char *)v19;
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v49 = v11;
      v24 = (uint8_t *)swift_slowAlloc(12, -1);
      v47 = swift_slowAlloc(32, -1);
      v50 = v47;
      v46 = v24;
      *(_DWORD *)v24 = 136315138;
      v45 = v24 + 4;
      v25 = a5;
      v26 = a6;
      v27 = objc_msgSend(*(id *)&v21[direct field offset for ENUIPublicHealthAgencyModel.region], "regionCode");
      v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
      v48 = v12;
      v29 = v28;
      v31 = v30;

      a6 = v26;
      a5 = v25;
      v52 = sub_100017A54(v29, v31, &v50);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v45);

      swift_bridgeObjectRelease(v31);
      v32 = v46;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Start onboarding for last visited region %s", v46, 0xCu);
      v33 = v47;
      swift_arrayDestroy(v47, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v33, -1, -1);
      swift_slowDealloc(v32, -1, -1);

      (*(void (**)(char *, uint64_t))(v48 + 8))(v15, v49);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    }
    sub_1000192A8(a5, a6);

  }
  else
  {
    v34 = Logger.launcher.unsafeMutableAddressor(v16);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v18, v34, v11);
    v35 = swift_bridgeObjectRetain_n(a3, 2);
    v36 = Logger.logObject.getter(v35);
    v37 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = swift_slowAlloc(12, -1);
      v48 = v12;
      v39 = (uint8_t *)v38;
      v40 = swift_slowAlloc(32, -1);
      v51 = a3;
      v52 = v40;
      v49 = v11;
      v50 = a2;
      *(_DWORD *)v39 = 136315138;
      swift_bridgeObjectRetain(a3);
      v41 = sub_10000937C(&qword_100025A68);
      v42 = String.init<A>(describing:)(&v50, v41);
      v44 = v43;
      v50 = sub_100017A54(v42, v43, &v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, &v51, v39 + 4);
      swift_bridgeObjectRelease_n(a3, 2);
      swift_bridgeObjectRelease(v44);
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Using onboarding (query param: %s)", v39, 0xCu);
      swift_arrayDestroy(v40, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v40, -1, -1);
      swift_slowDealloc(v39, -1, -1);

      (*(void (**)(char *, uint64_t))(v48 + 8))(v18, v49);
    }
    else
    {

      swift_bridgeObjectRelease_n(a3, 2);
      (*(void (**)(char *, uint64_t))(v12 + 8))(v18, v11);
    }
    sub_1000192A8(a2, a3);
  }
}

uint64_t sub_10001077C(char a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  void *object;
  id v8;
  Swift::String v9;
  Swift::String v10;
  Swift::String v11;
  uint64_t v12;
  void *v13;
  id v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  void *v19;
  id v20;
  Swift::String v21;
  Swift::String v22;
  Swift::String v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t (*v27)(char);
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  Swift::String v32;
  Swift::String v33;
  Swift::String v34;
  id v35;
  Swift::String v36;
  Swift::String v37;
  Swift::String v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  Swift::String v44;
  Swift::String v45;
  Swift::String v46;
  id v47;
  Swift::String v48;
  Swift::String v49;
  Swift::String v50;
  id v51;
  Swift::String v52;
  Swift::String v53;
  Swift::String v54;
  uint64_t v55;
  uint64_t countAndFlagsBits;
  Swift::String v58;
  Swift::String v59;
  Swift::String v60;
  Swift::String v61;
  Swift::String v62;
  Swift::String v63;
  Swift::String v64;
  Swift::String v65;
  Swift::String v66;

  if ((a1 & 1) != 0)
  {
    if (static ENUIPublicHealthAgencyModel.activeRegion)
    {
      v29 = *(_QWORD *)(static ENUIPublicHealthAgencyModel.activeRegion
                      + direct field offset for ENUIPublicHealthAgencyModel.name);
      v28 = *(_QWORD *)(static ENUIPublicHealthAgencyModel.activeRegion
                      + direct field offset for ENUIPublicHealthAgencyModel.name
                      + 8);
      v30 = (void *)objc_opt_self(NSBundle);
      swift_bridgeObjectRetain(v28);
      v31 = objc_msgSend(v30, "mainBundle");
      v62._object = (void *)0xEB00000000656C74;
      v32._object = (void *)0x800000010001BC70;
      v32._countAndFlagsBits = 0xD00000000000001ALL;
      v33._countAndFlagsBits = 0;
      v33._object = (void *)0xE000000000000000;
      v62._countAndFlagsBits = 0x6974207472656C41;
      v34 = NSLocalizedString(_:tableName:bundle:value:comment:)(v32, (Swift::String_optional)0, (NSBundle)v31, v33, v62);
      countAndFlagsBits = v34._countAndFlagsBits;
      object = v34._object;

      v35 = objc_msgSend(v30, "mainBundle");
      v36._countAndFlagsBits = 0xD00000000000001CLL;
      v63._object = (void *)0xED00006567617373;
      v36._object = (void *)0x800000010001BC90;
      v37._countAndFlagsBits = 0;
      v37._object = (void *)0xE000000000000000;
      v63._countAndFlagsBits = 0x656D207472656C41;
      v38 = NSLocalizedString(_:tableName:bundle:value:comment:)(v36, (Swift::String_optional)0, (NSBundle)v35, v37, v63);

      v39 = sub_10000937C(&qword_100026098);
      v40 = swift_allocObject(v39, 72, 7);
      *(_OWORD *)(v40 + 16) = xmmword_10001B170;
      *(_QWORD *)(v40 + 56) = &type metadata for String;
      *(_QWORD *)(v40 + 64) = sub_100018394();
      *(_QWORD *)(v40 + 32) = v29;
      *(_QWORD *)(v40 + 40) = v28;
      v12 = String.init(format:_:)(v38._countAndFlagsBits, v38._object, v40);
      v13 = v41;
      swift_bridgeObjectRelease(v38._object);
    }
    else
    {
      v42 = (void *)objc_opt_self(NSBundle);
      v43 = objc_msgSend(v42, "mainBundle");
      v44._countAndFlagsBits = 0xD000000000000011;
      v64._object = (void *)0xEB00000000656C74;
      v44._object = (void *)0x800000010001BC30;
      v45._countAndFlagsBits = 0;
      v45._object = (void *)0xE000000000000000;
      v64._countAndFlagsBits = 0x6974207472656C41;
      v46 = NSLocalizedString(_:tableName:bundle:value:comment:)(v44, (Swift::String_optional)0, (NSBundle)v43, v45, v64);
      countAndFlagsBits = v46._countAndFlagsBits;
      object = v46._object;

      v47 = objc_msgSend(v42, "mainBundle");
      v48._countAndFlagsBits = 0xD000000000000013;
      v65._object = (void *)0xED00006567617373;
      v48._object = (void *)0x800000010001BC50;
      v49._countAndFlagsBits = 0;
      v49._object = (void *)0xE000000000000000;
      v65._countAndFlagsBits = 0x656D207472656C41;
      v50 = NSLocalizedString(_:tableName:bundle:value:comment:)(v48, (Swift::String_optional)0, (NSBundle)v47, v49, v65);
      v12 = v50._countAndFlagsBits;
      v13 = v50._object;

    }
    v51 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v66._object = (void *)0xE600000000000000;
    v52._countAndFlagsBits = 19279;
    v52._object = (void *)0xE200000000000000;
    v53._countAndFlagsBits = 0;
    v53._object = (void *)0xE000000000000000;
    v66._countAndFlagsBits = 0x6E6F74747542;
    v54 = NSLocalizedString(_:tableName:bundle:value:comment:)(v52, (Swift::String_optional)0, (NSBundle)v51, v53, v66);
    v18 = v54._countAndFlagsBits;
    v19 = v54._object;

    v27 = 0;
    v26 = 0;
    v24 = 0;
    v25 = 0;
  }
  else
  {
    v2 = (void *)objc_opt_self(NSBundle);
    v3 = objc_msgSend(v2, "mainBundle");
    v58._object = (void *)0xEB00000000656C74;
    v4._object = (void *)0x800000010001BCB0;
    v4._countAndFlagsBits = 0xD00000000000001ALL;
    v5._countAndFlagsBits = 0;
    v5._object = (void *)0xE000000000000000;
    v58._countAndFlagsBits = 0x6974207472656C41;
    v6 = NSLocalizedString(_:tableName:bundle:value:comment:)(v4, (Swift::String_optional)0, (NSBundle)v3, v5, v58);
    countAndFlagsBits = v6._countAndFlagsBits;
    object = v6._object;

    v8 = objc_msgSend(v2, "mainBundle");
    v9._countAndFlagsBits = 0xD00000000000001CLL;
    v59._object = (void *)0xED00006567617373;
    v9._object = (void *)0x800000010001BCD0;
    v10._countAndFlagsBits = 0;
    v10._object = (void *)0xE000000000000000;
    v59._countAndFlagsBits = 0x656D207472656C41;
    v11 = NSLocalizedString(_:tableName:bundle:value:comment:)(v9, (Swift::String_optional)0, (NSBundle)v8, v10, v59);
    v12 = v11._countAndFlagsBits;
    v13 = v11._object;

    v14 = objc_msgSend(v2, "mainBundle");
    v15._countAndFlagsBits = 0xD000000000000020;
    v60._object = (void *)0xE600000000000000;
    v15._object = (void *)0x800000010001B980;
    v16._countAndFlagsBits = 0;
    v16._object = (void *)0xE000000000000000;
    v60._countAndFlagsBits = 0x6E6F74747542;
    v17 = NSLocalizedString(_:tableName:bundle:value:comment:)(v15, (Swift::String_optional)0, (NSBundle)v14, v16, v60);
    v18 = v17._countAndFlagsBits;
    v19 = v17._object;

    v20 = objc_msgSend(v2, "mainBundle");
    v61._object = (void *)0xE600000000000000;
    v21._countAndFlagsBits = 0x6C65636E6143;
    v21._object = (void *)0xE600000000000000;
    v22._countAndFlagsBits = 0;
    v22._object = (void *)0xE000000000000000;
    v61._countAndFlagsBits = 0x6E6F74747542;
    v23 = NSLocalizedString(_:tableName:bundle:value:comment:)(v21, (Swift::String_optional)0, (NSBundle)v20, v22, v61);
    v24 = v23._countAndFlagsBits;
    v25 = v23._object;

    v26 = swift_allocObject(&unk_100022500, 24, 7);
    swift_unknownObjectWeakInit(v26 + 16, v1);
    v27 = sub_1000188E8;
  }
  if (qword_100025968 != -1)
    swift_once(&qword_100025968, sub_10000A5AC);
  v55 = qword_100027210;
  swift_retain(qword_100027210);
  sub_10000A5D8(countAndFlagsBits, (uint64_t)object, v12, (uint64_t)v13, v18, (uint64_t)v19, v24, (uint64_t)v25, (uint64_t)v27, v26);
  sub_10000B024((uint64_t)v27, v26);
  swift_release(v55);
  swift_bridgeObjectRelease(object);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v19);
  return swift_bridgeObjectRelease(v25);
}

uint64_t sub_100010D34(char a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSURL *v29;
  void *v30;
  void *v31;
  uint64_t Strong;
  void *v33;
  uint64_t v34;
  uint64_t inited;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  Class isa;
  _BYTE v46[128];
  _BYTE v47[24];

  v4 = sub_10000937C((uint64_t *)&unk_100026050);
  v5 = __chkstk_darwin(v4);
  v7 = &v46[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v5);
  v9 = &v46[-v8 - 8];
  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = &v46[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v15 = __chkstk_darwin(v12);
  v17 = &v46[-v16 - 8];
  v18 = Logger.testVerification.unsafeMutableAddressor(v15);
  v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 16);
  if ((a1 & 1) != 0)
  {
    v39 = v19(v14, v18, v10);
    v40 = Logger.logObject.getter(v39);
    v41 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "User chose Cancel", v42, 2u);
      swift_slowDealloc(v42, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }
  else
  {
    v20 = v19(v17, v18, v10);
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "User chose to turn on EN", v23, 2u);
      swift_slowDealloc(v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v17, v10);
    URL.init(string:)(0xD00000000000002CLL, 0x800000010001BCF0);
    v24 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
    if (v24)
    {
      v25 = v24;
      v26 = a2 + 16;
      sub_100018844((uint64_t)v9, (uint64_t)v7, (uint64_t *)&unk_100026050);
      v27 = type metadata accessor for URL(0);
      v28 = *(_QWORD *)(v27 - 8);
      v30 = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v7, 1, v27) != 1)
      {
        URL._bridgeToObjectiveC()(v29);
        v30 = v31;
        (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v27);
      }
      swift_beginAccess(v26, v47, 0, 0);
      Strong = swift_unknownObjectWeakLoadStrong(v26);
      if (Strong)
      {
        v33 = (void *)Strong;
        v34 = sub_10000937C(&qword_100026060);
        inited = swift_initStackObject(v34, v46);
        *(_OWORD *)(inited + 16) = xmmword_10001B060;
        *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyUnlockDevice);
        *(_QWORD *)(inited + 40) = v36;
        *(_QWORD *)(inited + 72) = &type metadata for Bool;
        *(_BYTE *)(inited + 48) = 1;
        *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyPromptUnlockDevice);
        *(_QWORD *)(inited + 88) = v37;
        *(_QWORD *)(inited + 120) = &type metadata for Bool;
        *(_BYTE *)(inited + 96) = 1;
        v38 = sub_10000DE50(inited);

      }
      else
      {
        v38 = sub_10000DE50((uint64_t)&_swiftEmptyArrayStorage);
      }
      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v38);
      objc_msgSend(v25, "openSensitiveURL:withOptions:", v30, isa);

    }
    return sub_100009580((uint64_t)v9, (uint64_t *)&unk_100026050);
  }
}

uint64_t sub_10001110C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  id v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = Logger.launcher.unsafeMutableAddressor(v4);
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc(12, -1);
    v22 = v1;
    v12 = (uint8_t *)v11;
    v13 = swift_slowAlloc(32, -1);
    v24 = v13;
    *(_DWORD *)v12 = 136315138;
    v14 = String.init<A>(describing:)(v13, &type metadata for URLParser.PreAuthorizationType);
    v16 = v15;
    v23 = sub_100017A54(v14, v15, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v12 + 4);
    swift_bridgeObjectRelease(v16);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Start pre-authorization for %s", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    v17 = v12;
    v1 = v22;
    swift_slowDealloc(v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  type metadata accessor for ENUIPublicHealthAgencyModel(0);
  v18 = swift_allocObject(&unk_1000224D8, 24, 7);
  *(_QWORD *)(v18 + 16) = v1;
  v19 = v1;
  static ENUIPublicHealthAgencyModel.refreshRegions(completion:)(sub_1000188BC, v18);
  return swift_release(v18);
}

void sub_1000112F4()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t (*v17)(void);
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  NSURL *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t inited;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  Class isa;
  id v57;
  void *v58;
  uint64_t v59;
  NSString v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE v68[136];

  v63 = sub_10000937C((uint64_t *)&unk_100026050);
  v0 = __chkstk_darwin(v63);
  v64 = (uint64_t)&v61 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v61 - v3;
  v5 = __chkstk_darwin(v2);
  v7 = (char *)&v61 - v6;
  __chkstk_darwin(v5);
  v9 = (char *)&v61 - v8;
  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v61 - v15;
  if (static ENUIPublicHealthAgencyModel.activeRegion)
  {
    v17 = *(uint64_t (**)(void))((swift_isaMask & *static ENUIPublicHealthAgencyModel.activeRegion) + 0x160);
    v18 = static ENUIPublicHealthAgencyModel.activeRegion;
    if ((v17() & 1) != 0)
    {
      v19 = (*(uint64_t (**)(void))((swift_isaMask & *v18) + 0x158))();
      if ((v19 & 1) != 0)
      {
        v20 = Logger.testVerification.unsafeMutableAddressor(v19);
        (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v16, v20, v10);
        v21 = v18;
        v22 = Logger.logObject.getter(v21);
        v23 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v22, v23))
        {
          v62 = v10;
          v24 = (uint8_t *)swift_slowAlloc(12, -1);
          v25 = swift_slowAlloc(32, -1);
          v67 = v25;
          *(_DWORD *)v24 = 136315138;
          v26 = *(_QWORD *)((char *)v21 + direct field offset for ENUIPublicHealthAgencyModel.appBundleId + 8);
          v65 = *(_QWORD *)((char *)v21 + direct field offset for ENUIPublicHealthAgencyModel.appBundleId);
          v66 = v26;
          swift_bridgeObjectRetain(v26);
          v27 = sub_10000937C(&qword_100025A68);
          v61 = v11;
          v28 = String.init<A>(describing:)(&v65, v27);
          v30 = v29;
          v65 = sub_100017A54(v28, v29, &v67);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66, v24 + 4);

          swift_bridgeObjectRelease(v30);
          _os_log_impl((void *)&_mh_execute_header, v22, v23, "Opening app: %s", v24, 0xCu);
          swift_arrayDestroy(v25, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v25, -1, -1);
          swift_slowDealloc(v24, -1, -1);

          (*(void (**)(char *, uint64_t))(v61 + 8))(v16, v62);
        }
        else
        {

          (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
        }
        v57 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
        if (v57)
        {
          v58 = v57;
          v59 = *(_QWORD *)((char *)v21 + direct field offset for ENUIPublicHealthAgencyModel.appBundleId + 8);
          if (v59)
          {
            swift_bridgeObjectRetain(*(_QWORD *)((char *)v21
                                               + direct field offset for ENUIPublicHealthAgencyModel.appBundleId
                                               + 8));
            v60 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease(v59);
          }
          else
          {
            v60 = 0;
          }
          objc_msgSend(v58, "openApplicationWithBundleID:", v60);

        }
        else
        {

        }
        return;
      }
    }

  }
  v31 = URL.init(string:)(0xD00000000000002FLL, 0x800000010001BC00);
  v32 = Logger.testVerification.unsafeMutableAddressor(v31);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v32, v10);
  v33 = sub_100018844((uint64_t)v9, (uint64_t)v7, (uint64_t *)&unk_100026050);
  v34 = Logger.logObject.getter(v33);
  v35 = v11;
  v36 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v34, v36))
  {
    v62 = v10;
    v37 = (uint8_t *)swift_slowAlloc(12, -1);
    v38 = swift_slowAlloc(32, -1);
    v61 = v35;
    v39 = v38;
    v65 = v38;
    *(_DWORD *)v37 = 136315138;
    sub_100018844((uint64_t)v7, (uint64_t)v4, (uint64_t *)&unk_100026050);
    v40 = String.init<A>(describing:)(v4, v63);
    v42 = v41;
    v67 = sub_100017A54(v40, v41, &v65);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, v68, v37 + 4);
    swift_bridgeObjectRelease(v42);
    sub_100009580((uint64_t)v7, (uint64_t *)&unk_100026050);
    _os_log_impl((void *)&_mh_execute_header, v34, v36, "Opening Settings to %s", v37, 0xCu);
    swift_arrayDestroy(v39, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v39, -1, -1);
    swift_slowDealloc(v37, -1, -1);

    (*(void (**)(char *, uint64_t))(v61 + 8))(v14, v62);
  }
  else
  {
    sub_100009580((uint64_t)v7, (uint64_t *)&unk_100026050);

    (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v10);
  }
  v43 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
  v44 = v64;
  if (v43)
  {
    v45 = v43;
    sub_100018844((uint64_t)v9, v64, (uint64_t *)&unk_100026050);
    v46 = type metadata accessor for URL(0);
    v47 = *(_QWORD *)(v46 - 8);
    v49 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v44, 1, v46) != 1)
    {
      URL._bridgeToObjectiveC()(v48);
      v49 = v50;
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v44, v46);
    }
    v51 = sub_10000937C(&qword_100026060);
    inited = swift_initStackObject(v51, v68);
    *(_OWORD *)(inited + 16) = xmmword_10001B060;
    *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyUnlockDevice);
    *(_QWORD *)(inited + 40) = v53;
    *(_QWORD *)(inited + 72) = &type metadata for Bool;
    *(_BYTE *)(inited + 48) = 1;
    *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyPromptUnlockDevice);
    *(_QWORD *)(inited + 88) = v54;
    *(_QWORD *)(inited + 120) = &type metadata for Bool;
    *(_BYTE *)(inited + 96) = 1;
    v55 = sub_10000DE50(inited);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v55);
    objc_msgSend(v45, "openSensitiveURL:withOptions:", v49, isa);

  }
  sub_100009580((uint64_t)v9, (uint64_t *)&unk_100026050);
}

void sub_1000119C0(uint64_t a1, unint64_t a2, void *a3, int a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSString v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t aBlock[5];
  uint64_t v38;

  v35 = a1;
  v33 = a4;
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = Logger.testVerification.unsafeMutableAddressor(v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  v12 = swift_bridgeObjectRetain_n(a2, 2);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(12, -1);
    v16 = swift_slowAlloc(32, -1);
    aBlock[0] = v16;
    v32 = a3;
    *(_DWORD *)v15 = 136315138;
    swift_bridgeObjectRetain(a2);
    v36 = sub_100017A54(v35, a2, aBlock);
    a3 = v32;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, aBlock, v15 + 4);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Verification code %s", v15, 0xCu);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    swift_slowDealloc(v15, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  v17 = type metadata accessor for VerificationCodeValidator();
  v18 = swift_allocObject(v17, 40, 7);
  *(_QWORD *)(v18 + 16) = 0;
  *(_BYTE *)(v18 + 24) = 1;
  *(_QWORD *)(v18 + 32) = 0;
  v19 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v20 = String._bridgeToObjectiveC()();
  aBlock[4] = (uint64_t)sub_10001782C;
  v38 = v18;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10000DF84;
  aBlock[3] = (uint64_t)&unk_100021AA0;
  v21 = _Block_copy(aBlock);
  v22 = v38;
  swift_retain(v18);
  swift_release(v22);
  v23 = objc_msgSend(v19, "beginBackgroundTaskWithName:expirationHandler:", v20, v21);
  _Block_release(v21);

  *(_QWORD *)(v18 + 16) = v23;
  *(_BYTE *)(v18 + 24) = 0;
  v24 = swift_allocObject(&unk_100021AD8, 68, 7);
  *(_QWORD *)(v24 + 16) = v23;
  *(_BYTE *)(v24 + 24) = 0;
  v26 = v34;
  v25 = v35;
  *(_QWORD *)(v24 + 32) = v35;
  *(_QWORD *)(v24 + 40) = a2;
  *(_QWORD *)(v24 + 48) = a3;
  *(_QWORD *)(v24 + 56) = v26;
  *(_DWORD *)(v24 + 64) = v33;
  sub_100019984(0, &qword_100026040, OS_dispatch_queue_ptr);
  v27 = a3;
  v28 = v26;
  v29 = swift_bridgeObjectRetain(a2);
  v30 = (void *)static OS_dispatch_queue.main.getter(v29);
  sub_10000CA1C(v25, a2, a3, v30, (uint64_t)sub_100017880, v24);
  swift_release(v18);
  swift_release(v24);

}

void sub_100011D2C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 16);
    v8 = Logger.testVerification.unsafeMutableAddressor(v4);
    v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v8, v2);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      v13 = swift_slowAlloc(32, -1);
      v23 = v7;
      v24 = v13;
      *(_DWORD *)v12 = 136315138;
      v22 = v12 + 4;
      type metadata accessor for UIBackgroundTaskIdentifier(0);
      v15 = String.init<A>(describing:)(&v23, v14);
      v16 = v7;
      v18 = v17;
      v23 = sub_100017A54(v15, v17, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v22);
      v19 = v18;
      v7 = v16;
      swift_bridgeObjectRelease(v19);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "The time given to complete the verification code validation task %s to complete while the app is in the background has expired.", v12, 0xCu);
      swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v13, -1, -1);
      swift_slowDealloc(v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v20 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    objc_msgSend(v20, "endBackgroundTask:", v7);

  }
}

uint64_t sub_100011F24(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unint64_t a5, void *a6, void *a7, int a8)
{
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
  char *v21;
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
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t EnumCaseMultiPayload;
  uint64_t v61;
  void *v62;
  void (*v63)(char *);
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t (**v77)(char *, char *, uint64_t);
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  _BOOL4 v84;
  uint64_t v85;
  uint8_t *v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  char *v93;
  void (*v94)(char *, uint64_t);
  char *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  uint64_t v101;
  id v102;
  char *v103;
  void (*v104)(uint64_t, uint64_t);
  uint64_t v105;
  uint64_t v106;
  Swift::String v107;
  Swift::String v108;
  void *v109;
  id v110;
  id v111;
  uint64_t v112;
  void *v113;
  void *v114;
  Swift::String v115;
  void *v116;
  Swift::String v117;
  void *v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  NSObject *v123;
  os_log_type_t v124;
  uint8_t *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  unint64_t v133;
  unint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char v139;
  char *v140;
  uint64_t v141;
  NSObject *v142;
  os_log_type_t v143;
  uint64_t v144;
  uint8_t *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
  unint64_t v151;
  uint64_t v152;
  id v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  uint64_t v157;
  NSURL *v158;
  void *v159;
  void *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  Class isa;
  id v167;
  char v169;
  char *v170;
  uint64_t v171;
  uint64_t v172;
  NSObject *v173;
  os_log_type_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  os_log_type_t v181;
  uint8_t *v182;
  uint64_t v183;
  char *v184;
  uint64_t v185;
  uint64_t v186;
  unint64_t v187;
  unint64_t v188;
  void *v189;
  char *v190;
  void *v191;
  id v192;
  Swift::String v193;
  Swift::String v194;
  id v195;
  Swift::String v196;
  Swift::String v197;
  Swift::String v198;
  id v199;
  char v200;
  char *v201;
  uint64_t v202;
  uint64_t v203;
  NSObject *v204;
  os_log_type_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  os_log_type_t v212;
  uint8_t *v213;
  uint64_t v214;
  char *v215;
  uint64_t v216;
  uint64_t v217;
  unint64_t v218;
  unint64_t v219;
  void *v220;
  char *v221;
  void *v222;
  id v223;
  Swift::String v224;
  Swift::String v225;
  id v226;
  Swift::String v227;
  Swift::String v228;
  Swift::String v229;
  char v230;
  char *v231;
  uint64_t v232;
  uint64_t v233;
  NSObject *v234;
  os_log_type_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  os_log_type_t v242;
  uint8_t *v243;
  uint64_t v244;
  char *v245;
  uint64_t v246;
  uint64_t v247;
  unint64_t v248;
  unint64_t v249;
  void *v250;
  char *v251;
  void *v252;
  id v253;
  Swift::String v254;
  Swift::String v255;
  id v256;
  Swift::String v257;
  Swift::String v258;
  Swift::String v259;
  char v260;
  uint64_t v261;
  NSObject *v262;
  os_log_type_t v263;
  uint64_t v264;
  uint64_t v265;
  os_log_type_t v266;
  uint8_t *v267;
  uint64_t v268;
  char *v269;
  uint64_t v270;
  uint64_t v271;
  unint64_t v272;
  unint64_t v273;
  void *v274;
  void *v275;
  id v276;
  Swift::String v277;
  Swift::String v278;
  id v279;
  Swift::String v280;
  Swift::String v281;
  Swift::String v282;
  char v283;
  char *v284;
  uint64_t v285;
  uint64_t v286;
  NSObject *v287;
  os_log_type_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  os_log_type_t v295;
  uint8_t *v296;
  uint64_t v297;
  char *v298;
  uint64_t v299;
  uint64_t v300;
  unint64_t v301;
  unint64_t v302;
  void *v303;
  char *v304;
  char v305;
  char *v306;
  uint64_t v307;
  uint64_t v308;
  NSObject *v309;
  os_log_type_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  os_log_type_t v317;
  uint8_t *v318;
  uint64_t v319;
  char *v320;
  uint64_t v321;
  uint64_t v322;
  unint64_t v323;
  unint64_t v324;
  void *v325;
  char *v326;
  void *v327;
  id v328;
  Swift::String v329;
  Swift::String v330;
  id v331;
  Swift::String v332;
  Swift::String v333;
  Swift::String v334;
  char v335;
  char *v336;
  uint64_t v337;
  uint64_t v338;
  NSObject *v339;
  os_log_type_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  os_log_type_t v347;
  uint8_t *v348;
  uint64_t v349;
  char *v350;
  uint64_t v351;
  uint64_t v352;
  unint64_t v353;
  unint64_t v354;
  void *v355;
  char *v356;
  void *v357;
  id v358;
  Swift::String v359;
  Swift::String v360;
  id v361;
  Swift::String v362;
  Swift::String v363;
  Swift::String v364;
  char v365;
  uint64_t v366;
  uint64_t v367;
  NSObject *v368;
  os_log_type_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  os_log_type_t v376;
  uint8_t *v377;
  uint64_t v378;
  char *v379;
  uint64_t v380;
  uint64_t v381;
  unint64_t v382;
  unint64_t v383;
  void *v384;
  char *v385;
  void *v386;
  id v387;
  Swift::String v388;
  Swift::String v389;
  id v390;
  Swift::String v391;
  Swift::String v392;
  Swift::String v393;
  char v394;
  char *v395;
  uint64_t v396;
  uint64_t v397;
  NSObject *v398;
  os_log_type_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  os_log_type_t v406;
  uint8_t *v407;
  uint64_t v408;
  char *v409;
  uint64_t v410;
  uint64_t v411;
  unint64_t v412;
  unint64_t v413;
  void *v414;
  char *v415;
  void *v416;
  id v417;
  Swift::String v418;
  Swift::String v419;
  id v420;
  Swift::String v421;
  Swift::String v422;
  Swift::String v423;
  id v424;
  Swift::String v425;
  Swift::String v426;
  Swift::String v427;
  void *v428;
  void *v429;
  uint64_t v430;
  uint64_t v431;
  void *v432;
  char v433;
  uint64_t v434;
  void *v435;
  void *v436;
  uint64_t v437;
  char *v438;
  id v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  char v443;
  char *v444;
  uint64_t v445;
  uint64_t v446;
  NSObject *v447;
  os_log_type_t v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  os_log_type_t v455;
  uint8_t *v456;
  char *v457;
  uint64_t v458;
  uint64_t v459;
  unint64_t v460;
  unint64_t v461;
  void *v462;
  void *v463;
  void *v464;
  id v465;
  Swift::String v466;
  Swift::String v467;
  uint64_t v468;
  Swift::String v469;
  Swift::String v470;
  uint64_t v471;
  void *v472;
  id v473;
  Swift::String v474;
  Swift::String v475;
  Swift::String v476;
  id v477;
  Swift::String v478;
  Swift::String v479;
  Swift::String v480;
  id v481;
  Swift::String v482;
  Swift::String v483;
  Swift::String v484;
  char v485;
  uint64_t v486;
  uint64_t v487;
  NSObject *v488;
  os_log_type_t v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t inited;
  os_log_type_t v496;
  uint8_t *v497;
  uint64_t v498;
  char *v499;
  uint64_t v500;
  uint64_t v501;
  unint64_t v502;
  unint64_t v503;
  void *v504;
  char *v505;
  void *v506;
  id v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  unint64_t v512;
  char v513;
  char *v514;
  void *v515;
  id v516;
  id v517;
  uint64_t v518;
  uint64_t v519;
  NSObject *v520;
  os_log_type_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  os_log_type_t v528;
  uint8_t *v529;
  uint64_t v530;
  char *v531;
  uint64_t v532;
  uint64_t v533;
  unint64_t v534;
  unint64_t v535;
  void *v536;
  void *v537;
  id v538;
  Swift::String v539;
  Swift::String v540;
  id v541;
  Swift::String v542;
  Swift::String v543;
  Swift::String v544;
  id v545;
  Swift::String v546;
  Swift::String v547;
  Swift::String v548;
  id v549;
  Swift::String v550;
  Swift::String v551;
  Swift::String v552;
  id v553;
  void *v554;
  id v555;
  id v556;
  void *v557;
  id v558;
  Swift::String v559;
  Swift::String v560;
  id v561;
  Swift::String v562;
  Swift::String v563;
  Swift::String v564;
  void *v565;
  id v566;
  uint64_t v567;
  void *v568;
  void *v569;
  id v570;
  Swift::String v571;
  Swift::String v572;
  Swift::String v573;
  uint64_t v574;
  uint64_t v575;
  unint64_t v576;
  void *v577;
  void *v578;
  id v579;
  Swift::String v580;
  Swift::String v581;
  Swift::String v582;
  uint64_t v583;
  void *v584;
  void *v585;
  id v586;
  Swift::String v587;
  Swift::String v588;
  Swift::String v589;
  id v590;
  Swift::String v591;
  Swift::String v592;
  Swift::String v593;
  char *v594;
  uint64_t v595;
  void *v596;
  char *v597;
  char *v598;
  char *v599;
  char *v600;
  char *v601;
  char *v602;
  char *v603;
  char *v604;
  char *v605;
  char *v606;
  char *v607;
  char *v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  char *v612;
  uint64_t v613;
  char *v614;
  uint64_t v615;
  uint64_t v616;
  int v617;
  char *v618;
  char *v619;
  id v620;
  char *v621;
  uint64_t countAndFlagsBits;
  __int128 v623;
  uint64_t v624;
  int v625;
  char *v626;
  void *object;
  Swift::String v628;
  __int128 v629;
  __int128 v630;
  uint64_t v631;
  uint64_t v632;
  uint64_t v633;
  uint64_t v634;
  _BYTE v635[128];
  Swift::String v636;
  Swift::String v637;
  Swift::String v638;
  Swift::String v639;
  Swift::String v640;
  Swift::String v641;
  Swift::String v642;
  Swift::String v643;
  Swift::String v644;
  Swift::String v645;
  Swift::String v646;
  Swift::String v647;
  Swift::String v648;
  Swift::String v649;
  Swift::String v650;
  Swift::String v651;
  Swift::String v652;
  Swift::String v653;
  Swift::String v654;
  Swift::String v655;
  Swift::String v656;
  Swift::String v657;
  Swift::String v658;
  Swift::String v659;
  Swift::String v660;
  Swift::String v661;
  Swift::String v662;
  Swift::String v663;
  Swift::String v664;
  Swift::String v665;
  Swift::String v666;
  Swift::String v667;

  v617 = a8;
  v596 = a7;
  v620 = a6;
  v609 = a4;
  v625 = a3;
  v624 = a2;
  v611 = sub_10000937C((uint64_t *)&unk_100026050);
  v10 = __chkstk_darwin(v611);
  v619 = (char *)&v595 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v10);
  v610 = (uint64_t)&v595 - v13;
  v14 = __chkstk_darwin(v12);
  v618 = (char *)&v595 - v15;
  __chkstk_darwin(v14);
  *(_QWORD *)&v623 = (char *)&v595 - v16;
  v17 = type metadata accessor for UUID(0);
  object = *(void **)(v17 - 8);
  v18 = __chkstk_darwin(v17);
  v626 = (char *)&v595 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v21 = (char *)&v595 - v20;
  v22 = type metadata accessor for CocoaError.Code(0);
  v615 = *(_QWORD *)(v22 - 8);
  v616 = v22;
  __chkstk_darwin(v22);
  v614 = (char *)&v595 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for Logger(0);
  v628._object = *(void **)(v24 - 8);
  v25 = __chkstk_darwin(v24);
  countAndFlagsBits = (uint64_t)&v595 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __chkstk_darwin(v25);
  v628._countAndFlagsBits = (uint64_t)&v595 - v28;
  v29 = __chkstk_darwin(v27);
  v598 = (char *)&v595 - v30;
  v31 = __chkstk_darwin(v29);
  v597 = (char *)&v595 - v32;
  v33 = __chkstk_darwin(v31);
  v599 = (char *)&v595 - v34;
  v35 = __chkstk_darwin(v33);
  v600 = (char *)&v595 - v36;
  v37 = __chkstk_darwin(v35);
  v621 = (char *)&v595 - v38;
  v39 = __chkstk_darwin(v37);
  v601 = (char *)&v595 - v40;
  v41 = __chkstk_darwin(v39);
  v602 = (char *)&v595 - v42;
  v43 = __chkstk_darwin(v41);
  v603 = (char *)&v595 - v44;
  v45 = __chkstk_darwin(v43);
  v604 = (char *)&v595 - v46;
  v47 = __chkstk_darwin(v45);
  v605 = (char *)&v595 - v48;
  v49 = __chkstk_darwin(v47);
  v606 = (char *)&v595 - v50;
  v51 = __chkstk_darwin(v49);
  v607 = (char *)&v595 - v52;
  v53 = __chkstk_darwin(v51);
  v608 = (char *)&v595 - v54;
  __chkstk_darwin(v53);
  v56 = (char *)&v595 - v55;
  v57 = sub_10000937C(&qword_100025F90);
  __chkstk_darwin(v57);
  v59 = (uint64_t *)((char *)&v595 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100018844(a1, (uint64_t)v59, &qword_100025F90);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v59, v57);
  if ((_DWORD)EnumCaseMultiPayload == 1)
  {
    v61 = *v59;
    v62 = (void *)Logger.testVerification.unsafeMutableAddressor(EnumCaseMultiPayload);
    v63 = (void (*)(char *))*((_QWORD *)v628._object + 2);
    object = v62;
    v628._countAndFlagsBits = (uint64_t)v63;
    v63(v56);
    swift_bridgeObjectRetain(a5);
    swift_errorRetain(v61);
    swift_bridgeObjectRetain(a5);
    v64 = swift_errorRetain(v61);
    v65 = Logger.logObject.getter(v64);
    v66 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v65, v66))
    {
      v67 = v61;
      v68 = swift_slowAlloc(22, -1);
      v69 = swift_slowAlloc(64, -1);
      v613 = v24;
      v70 = v69;
      *(_QWORD *)&v629 = v69;
      *(_DWORD *)v68 = 136315394;
      swift_bridgeObjectRetain(a5);
      v636._countAndFlagsBits = sub_100017A54(v609, a5, (uint64_t *)&v629);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v636, &v636._object, v68 + 4);
      swift_bridgeObjectRelease_n(a5, 3);
      *(_WORD *)(v68 + 12) = 2080;
      v636._countAndFlagsBits = v67;
      swift_errorRetain(v67);
      v71 = sub_10000937C(&qword_100026088);
      v72 = String.init<A>(describing:)(&v636, v71);
      v74 = v73;
      v636._countAndFlagsBits = sub_100017A54(v72, v73, (uint64_t *)&v629);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v636, &v636._object, v68 + 14);
      swift_bridgeObjectRelease(v74);
      swift_errorRelease(v67);
      swift_errorRelease(v67);
      _os_log_impl((void *)&_mh_execute_header, v65, v66, "Failed to validate verification code %s: %s", (uint8_t *)v68, 0x16u);
      swift_arrayDestroy(v70, 2, (char *)&type metadata for Any + 8);
      v75 = v70;
      v24 = v613;
      swift_slowDealloc(v75, -1, -1);
      v76 = v68;
      v61 = v67;
      swift_slowDealloc(v76, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(a5, 2);
      swift_errorRelease(v61);
      swift_errorRelease(v61);
    }

    v94 = (void (*)(char *, uint64_t))*((_QWORD *)v628._object + 1);
    v94(v56, v24);
    v95 = v621;
    v96 = swift_errorRetain(v61);
    v97 = v614;
    static CocoaError.userCancelled.getter(v96);
    v98 = sub_100003574(&qword_100026068, (uint64_t (*)(uint64_t))&type metadata accessor for CocoaError.Code, (uint64_t)&protocol conformance descriptor for CocoaError.Code);
    v99 = v616;
    v100 = static _ErrorCodeProtocol.~= infix(_:_:)(v97, v61, v616, v98);
    swift_errorRelease(v61);
    (*(void (**)(char *, uint64_t))(v615 + 8))(v97, v99);
    if ((v100 & 1) != 0)
    {
      v101 = v624;
      if ((v625 & 1) == 0 && UIBackgroundTaskInvalid != v624)
      {
        v102 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
        objc_msgSend(v102, "endBackgroundTask:", v101);

      }
      v103 = (char *)v61;
      return swift_errorRelease(v103);
    }
    _s3__C4CodeOMa_0(0);
    v137 = v136;
    *(_QWORD *)&v629 = 1;
    swift_errorRetain(v61);
    v138 = sub_100003574((unint64_t *)&unk_100026070, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_10001AD04);
    v139 = static _ErrorCodeProtocol.~= infix(_:_:)(&v629, v61, v137, v138);
    swift_errorRelease(v61);
    v626 = (char *)v61;
    if ((v139 & 1) != 0)
    {
      v140 = v608;
      ((void (*)(char *, void *, uint64_t))v628._countAndFlagsBits)(v608, object, v24);
      swift_errorRetain(v61);
      v141 = swift_errorRetain(v61);
      v142 = Logger.logObject.getter(v141);
      v143 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v142, v143))
      {
        v613 = v24;
        v144 = swift_slowAlloc(12, -1);
        v628._object = v94;
        v145 = (uint8_t *)v144;
        v146 = swift_slowAlloc(32, -1);
        *(_QWORD *)&v629 = v146;
        *(_DWORD *)v145 = 136315138;
        v636._countAndFlagsBits = v61;
        swift_errorRetain(v61);
        v147 = sub_10000937C(&qword_100026088);
        v148 = String.init<A>(describing:)(&v636, v147);
        v149 = v61;
        v151 = v150;
        v636._countAndFlagsBits = sub_100017A54(v148, v150, (uint64_t *)&v629);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v636, &v636._object, v145 + 4);
        swift_bridgeObjectRelease(v151);
        swift_errorRelease(v149);
        swift_errorRelease(v149);
        _os_log_impl((void *)&_mh_execute_header, v142, v143, "Test Verification Unknown error %s", v145, 0xCu);
        swift_arrayDestroy(v146, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v146, -1, -1);
        swift_slowDealloc(v145, -1, -1);

        ((void (*)(char *, uint64_t))v628._object)(v608, v613);
      }
      else
      {
        swift_errorRelease(v61);
        swift_errorRelease(v61);

        v94(v140, v24);
      }
LABEL_35:
      v191 = (void *)objc_opt_self(NSBundle);
      v192 = objc_msgSend(v191, "mainBundle");
      v637._object = (void *)0xEB00000000656C74;
      v193._object = (void *)0x800000010001B8E0;
      v193._countAndFlagsBits = 0xD000000000000027;
      v194._countAndFlagsBits = 0;
      v194._object = (void *)0xE000000000000000;
      v637._countAndFlagsBits = 0x6974207472656C41;
      v628 = NSLocalizedString(_:tableName:bundle:value:comment:)(v193, (Swift::String_optional)0, (NSBundle)v192, v194, v637);

      v195 = objc_msgSend(v191, "mainBundle");
      v196._countAndFlagsBits = 0xD000000000000029;
      v638._object = (void *)0xED00006567617373;
      v196._object = (void *)0x800000010001B910;
      v197._countAndFlagsBits = 0;
      v197._object = (void *)0xE000000000000000;
      v638._countAndFlagsBits = 0x656D207472656C41;
      v198 = NSLocalizedString(_:tableName:bundle:value:comment:)(v196, (Swift::String_optional)0, (NSBundle)v195, v197, v638);
      *(_QWORD *)&v623 = v198._countAndFlagsBits;
      object = v198._object;

      v199 = objc_msgSend(v191, "mainBundle");
LABEL_75:
      v424 = v199;
      v653._object = (void *)0xE600000000000000;
      v425._countAndFlagsBits = 19279;
      v425._object = (void *)0xE200000000000000;
      v426._countAndFlagsBits = 0;
      v426._object = (void *)0xE000000000000000;
      v653._countAndFlagsBits = 0x6E6F74747542;
      v427 = NSLocalizedString(_:tableName:bundle:value:comment:)(v425, (Swift::String_optional)0, (NSBundle)v424, v426, v653);
      countAndFlagsBits = v427._countAndFlagsBits;
      v428 = v427._object;

      v429 = 0;
      v430 = 0;
      v431 = 0;
      v432 = 0;
      v433 = 1;
LABEL_76:
      if (qword_100025968 != -1)
        swift_once(&qword_100025968, sub_10000A5AC);
      v434 = qword_100027210;
      swift_retain(qword_100027210);
      v435 = v628._object;
      v436 = object;
      sub_10000A5D8(v628._countAndFlagsBits, (uint64_t)v628._object, v623, (uint64_t)object, countAndFlagsBits, (uint64_t)v428, v431, (uint64_t)v432, (uint64_t)v429, v430);
      swift_release(v434);
      swift_bridgeObjectRelease(v435);
      swift_bridgeObjectRelease(v436);
      swift_bridgeObjectRelease(v428);
      swift_bridgeObjectRelease(v432);
      if ((v433 & 1) != 0)
      {
        if ((v625 & 1) == 0)
        {
          v437 = v624;
          v438 = v626;
          if (UIBackgroundTaskInvalid != v624)
          {
            v439 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
            objc_msgSend(v439, "endBackgroundTask:", v437);

          }
          v103 = v438;
          return swift_errorRelease(v103);
        }
      }
      else
      {
        sub_10000B024((uint64_t)v429, v430);
      }
      v103 = v626;
      return swift_errorRelease(v103);
    }
    *(_QWORD *)&v629 = 2;
    swift_errorRetain(v61);
    v169 = static _ErrorCodeProtocol.~= infix(_:_:)(&v629, v61, v137, v138);
    swift_errorRelease(v61);
    v613 = v24;
    v628._object = v94;
    if ((v169 & 1) != 0)
    {
      v170 = v607;
      ((void (*)(char *, void *, uint64_t))v628._countAndFlagsBits)(v607, object, v24);
      v171 = swift_allocObject(&unk_100022410, 24, 7);
      *(_QWORD *)(v171 + 16) = v61;
      swift_errorRetain(v61);
      v172 = swift_errorRetain(v61);
      v173 = Logger.logObject.getter(v172);
      v174 = static os_log_type_t.error.getter();
      v175 = swift_allocObject(&unk_100022438, 17, 7);
      *(_BYTE *)(v175 + 16) = 32;
      v176 = swift_allocObject(&unk_100022460, 17, 7);
      *(_BYTE *)(v176 + 16) = 8;
      v177 = swift_allocObject(&unk_100022488, 32, 7);
      *(_QWORD *)(v177 + 16) = sub_100019B00;
      *(_QWORD *)(v177 + 24) = v171;
      v178 = swift_allocObject(&unk_1000224B0, 32, 7);
      *(_QWORD *)(v178 + 16) = sub_100019A74;
      *(_QWORD *)(v178 + 24) = v177;
      v179 = sub_10000937C(&qword_100026080);
      v180 = swift_allocObject(v179, 80, 7);
      *(_OWORD *)(v180 + 16) = xmmword_10001B000;
      *(_QWORD *)(v180 + 32) = sub_100019B04;
      *(_QWORD *)(v180 + 40) = v175;
      *(_QWORD *)(v180 + 48) = sub_100019B04;
      *(_QWORD *)(v180 + 56) = v176;
      *(_QWORD *)(v180 + 64) = sub_10000A110;
      *(_QWORD *)(v180 + 72) = v178;
      swift_retain(v171);
      swift_retain(v177);
      swift_retain(v175);
      swift_retain(v176);
      swift_retain(v178);
      swift_bridgeObjectRelease(v180);
      v181 = v174;
      v628._countAndFlagsBits = (uint64_t)v173;
      if (os_log_type_enabled(v173, v174))
      {
        v182 = (uint8_t *)swift_slowAlloc(12, -1);
        v183 = swift_slowAlloc(32, -1);
        *(_QWORD *)&v629 = v183;
        *(_WORD *)v182 = 258;
        v182[2] = 32;
        swift_release(v175);
        v182[3] = 8;
        swift_release(v176);
        v184 = v626;
        v636._countAndFlagsBits = (uint64_t)v626;
        swift_errorRetain(v626);
        v185 = sub_10000937C(&qword_100026088);
        v186 = String.init<A>(describing:)(&v636, v185);
        v188 = v187;
        v636._countAndFlagsBits = sub_100017A54(v186, v187, (uint64_t *)&v629);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v636, &v636._object, v182 + 4);
        swift_release(v171);
        swift_release(v177);
        swift_release(v178);
        swift_bridgeObjectRelease(v188);
        swift_errorRelease(v184);
        v189 = (void *)v628._countAndFlagsBits;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v628._countAndFlagsBits, v181, "Verification Code Invalid error: %s", v182, 0xCu);
        swift_arrayDestroy(v183, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v183, -1, -1);
        swift_slowDealloc(v182, -1, -1);

        v190 = v607;
      }
      else
      {
        swift_release(v171);
        swift_release(v177);
        swift_release(v178);
        swift_release(v176);
        swift_release(v175);
        swift_errorRelease(v626);

        v190 = v170;
      }
      ((void (*)(char *, uint64_t))v628._object)(v190, v613);
      v222 = (void *)objc_opt_self(NSBundle);
      v223 = objc_msgSend(v222, "mainBundle");
      v224._countAndFlagsBits = 0xD000000000000012;
      v639._object = (void *)0xEB00000000656C74;
      v224._object = (void *)0x800000010001BB60;
      v225._countAndFlagsBits = 0;
      v225._object = (void *)0xE000000000000000;
      v639._countAndFlagsBits = 0x6974207472656C41;
      v628 = NSLocalizedString(_:tableName:bundle:value:comment:)(v224, (Swift::String_optional)0, (NSBundle)v223, v225, v639);

      v226 = objc_msgSend(v222, "mainBundle");
      v227._countAndFlagsBits = 0xD000000000000014;
      v640._object = (void *)0xED00006567617373;
      v227._object = (void *)0x800000010001BB80;
      v228._countAndFlagsBits = 0;
      v228._object = (void *)0xE000000000000000;
      v640._countAndFlagsBits = 0x656D207472656C41;
      v229 = NSLocalizedString(_:tableName:bundle:value:comment:)(v227, (Swift::String_optional)0, (NSBundle)v226, v228, v640);
      *(_QWORD *)&v623 = v229._countAndFlagsBits;
      object = v229._object;

      v199 = objc_msgSend(v222, "mainBundle");
      goto LABEL_75;
    }
    *(_QWORD *)&v629 = 3;
    swift_errorRetain(v61);
    v200 = static _ErrorCodeProtocol.~= infix(_:_:)(&v629, v61, v137, v138);
    swift_errorRelease(v61);
    if ((v200 & 1) != 0)
    {
      v201 = v606;
      ((void (*)(char *, void *, uint64_t))v628._countAndFlagsBits)(v606, object, v24);
      v202 = swift_allocObject(&unk_100022348, 24, 7);
      *(_QWORD *)(v202 + 16) = v61;
      swift_errorRetain(v61);
      v203 = swift_errorRetain(v61);
      v204 = Logger.logObject.getter(v203);
      v205 = static os_log_type_t.error.getter();
      v206 = swift_allocObject(&unk_100022370, 17, 7);
      *(_BYTE *)(v206 + 16) = 32;
      v207 = swift_allocObject(&unk_100022398, 17, 7);
      *(_BYTE *)(v207 + 16) = 8;
      v208 = swift_allocObject(&unk_1000223C0, 32, 7);
      *(_QWORD *)(v208 + 16) = sub_100019B00;
      *(_QWORD *)(v208 + 24) = v202;
      v209 = swift_allocObject(&unk_1000223E8, 32, 7);
      *(_QWORD *)(v209 + 16) = sub_100019A74;
      *(_QWORD *)(v209 + 24) = v208;
      v210 = sub_10000937C(&qword_100026080);
      v211 = swift_allocObject(v210, 80, 7);
      *(_OWORD *)(v211 + 16) = xmmword_10001B000;
      *(_QWORD *)(v211 + 32) = sub_100019B04;
      *(_QWORD *)(v211 + 40) = v206;
      *(_QWORD *)(v211 + 48) = sub_100019B04;
      *(_QWORD *)(v211 + 56) = v207;
      *(_QWORD *)(v211 + 64) = sub_10000A110;
      *(_QWORD *)(v211 + 72) = v209;
      swift_retain(v202);
      swift_retain(v208);
      swift_retain(v206);
      swift_retain(v207);
      swift_retain(v209);
      swift_bridgeObjectRelease(v211);
      v212 = v205;
      v628._countAndFlagsBits = (uint64_t)v204;
      if (os_log_type_enabled(v204, v205))
      {
        v213 = (uint8_t *)swift_slowAlloc(12, -1);
        v214 = swift_slowAlloc(32, -1);
        *(_QWORD *)&v629 = v214;
        *(_WORD *)v213 = 258;
        v213[2] = 32;
        swift_release(v206);
        v213[3] = 8;
        swift_release(v207);
        v215 = v626;
        v636._countAndFlagsBits = (uint64_t)v626;
        swift_errorRetain(v626);
        v216 = sub_10000937C(&qword_100026088);
        v217 = String.init<A>(describing:)(&v636, v216);
        v219 = v218;
        v636._countAndFlagsBits = sub_100017A54(v217, v218, (uint64_t *)&v629);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v636, &v636._object, v213 + 4);
        swift_release(v202);
        swift_release(v208);
        swift_release(v209);
        swift_bridgeObjectRelease(v219);
        swift_errorRelease(v215);
        v220 = (void *)v628._countAndFlagsBits;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v628._countAndFlagsBits, v212, "Verification Code Expired error: %s", v213, 0xCu);
        swift_arrayDestroy(v214, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v214, -1, -1);
        swift_slowDealloc(v213, -1, -1);

        v221 = v606;
      }
      else
      {
        swift_release(v202);
        swift_release(v208);
        swift_release(v209);
        swift_release(v207);
        swift_release(v206);
        swift_errorRelease(v626);

        v221 = v201;
      }
      ((void (*)(char *, uint64_t))v628._object)(v221, v613);
      v252 = (void *)objc_opt_self(NSBundle);
      v253 = objc_msgSend(v252, "mainBundle");
      v254._countAndFlagsBits = 0xD000000000000012;
      v641._object = (void *)0xEB00000000656C74;
      v254._object = (void *)0x800000010001BB20;
      v255._countAndFlagsBits = 0;
      v255._object = (void *)0xE000000000000000;
      v641._countAndFlagsBits = 0x6974207472656C41;
      v628 = NSLocalizedString(_:tableName:bundle:value:comment:)(v254, (Swift::String_optional)0, (NSBundle)v253, v255, v641);

      v256 = objc_msgSend(v252, "mainBundle");
      v257._countAndFlagsBits = 0xD000000000000014;
      v642._object = (void *)0xED00006567617373;
      v257._object = (void *)0x800000010001BB40;
      v258._countAndFlagsBits = 0;
      v258._object = (void *)0xE000000000000000;
      v642._countAndFlagsBits = 0x656D207472656C41;
      v259 = NSLocalizedString(_:tableName:bundle:value:comment:)(v257, (Swift::String_optional)0, (NSBundle)v256, v258, v642);
      *(_QWORD *)&v623 = v259._countAndFlagsBits;
      object = v259._object;

      v199 = objc_msgSend(v252, "mainBundle");
      goto LABEL_75;
    }
    *(_QWORD *)&v629 = 4;
    swift_errorRetain(v61);
    v230 = static _ErrorCodeProtocol.~= infix(_:_:)(&v629, v61, v137, v138);
    swift_errorRelease(v61);
    if ((v230 & 1) != 0)
    {
      v231 = v605;
      ((void (*)(char *, void *, uint64_t))v628._countAndFlagsBits)(v605, object, v24);
      v232 = swift_allocObject(&unk_100022280, 24, 7);
      *(_QWORD *)(v232 + 16) = v61;
      swift_errorRetain(v61);
      v233 = swift_errorRetain(v61);
      v234 = Logger.logObject.getter(v233);
      v235 = static os_log_type_t.error.getter();
      v236 = swift_allocObject(&unk_1000222A8, 17, 7);
      *(_BYTE *)(v236 + 16) = 32;
      v237 = swift_allocObject(&unk_1000222D0, 17, 7);
      *(_BYTE *)(v237 + 16) = 8;
      v238 = swift_allocObject(&unk_1000222F8, 32, 7);
      *(_QWORD *)(v238 + 16) = sub_100019B00;
      *(_QWORD *)(v238 + 24) = v232;
      v239 = swift_allocObject(&unk_100022320, 32, 7);
      *(_QWORD *)(v239 + 16) = sub_100019A74;
      *(_QWORD *)(v239 + 24) = v238;
      v240 = sub_10000937C(&qword_100026080);
      v241 = swift_allocObject(v240, 80, 7);
      *(_OWORD *)(v241 + 16) = xmmword_10001B000;
      *(_QWORD *)(v241 + 32) = sub_100019B04;
      *(_QWORD *)(v241 + 40) = v236;
      *(_QWORD *)(v241 + 48) = sub_100019B04;
      *(_QWORD *)(v241 + 56) = v237;
      *(_QWORD *)(v241 + 64) = sub_10000A110;
      *(_QWORD *)(v241 + 72) = v239;
      swift_retain(v232);
      swift_retain(v238);
      swift_retain(v236);
      swift_retain(v237);
      swift_retain(v239);
      swift_bridgeObjectRelease(v241);
      v242 = v235;
      v628._countAndFlagsBits = (uint64_t)v234;
      if (os_log_type_enabled(v234, v235))
      {
        v243 = (uint8_t *)swift_slowAlloc(12, -1);
        v244 = swift_slowAlloc(32, -1);
        *(_QWORD *)&v629 = v244;
        *(_WORD *)v243 = 258;
        v243[2] = 32;
        swift_release(v236);
        v243[3] = 8;
        swift_release(v237);
        v245 = v626;
        v636._countAndFlagsBits = (uint64_t)v626;
        swift_errorRetain(v626);
        v246 = sub_10000937C(&qword_100026088);
        v247 = String.init<A>(describing:)(&v636, v246);
        v249 = v248;
        v636._countAndFlagsBits = sub_100017A54(v247, v248, (uint64_t *)&v629);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v636, &v636._object, v243 + 4);
        swift_release(v232);
        swift_release(v238);
        swift_release(v239);
        swift_bridgeObjectRelease(v249);
        swift_errorRelease(v245);
        v250 = (void *)v628._countAndFlagsBits;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v628._countAndFlagsBits, v242, "Test Verification Invalid Server Response error: %s", v243, 0xCu);
        swift_arrayDestroy(v244, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v244, -1, -1);
        swift_slowDealloc(v243, -1, -1);

        v251 = v605;
LABEL_50:
        ((void (*)(char *, uint64_t))v628._object)(v251, v613);
        v275 = (void *)objc_opt_self(NSBundle);
        v276 = objc_msgSend(v275, "mainBundle");
        v643._object = (void *)0xEB00000000656C74;
        v277._object = (void *)0x800000010001B8E0;
        v277._countAndFlagsBits = 0xD000000000000027;
        v278._countAndFlagsBits = 0;
        v278._object = (void *)0xE000000000000000;
        v643._countAndFlagsBits = 0x6974207472656C41;
        v628 = NSLocalizedString(_:tableName:bundle:value:comment:)(v277, (Swift::String_optional)0, (NSBundle)v276, v278, v643);

        v279 = objc_msgSend(v275, "mainBundle");
        v280._countAndFlagsBits = 0xD000000000000029;
        v644._object = (void *)0xED00006567617373;
        v280._object = (void *)0x800000010001B910;
        v281._countAndFlagsBits = 0;
        v281._object = (void *)0xE000000000000000;
        v644._countAndFlagsBits = 0x656D207472656C41;
        v282 = NSLocalizedString(_:tableName:bundle:value:comment:)(v280, (Swift::String_optional)0, (NSBundle)v279, v281, v644);
        *(_QWORD *)&v623 = v282._countAndFlagsBits;
        object = v282._object;

        v199 = objc_msgSend(v275, "mainBundle");
        goto LABEL_75;
      }
    }
    else
    {
      *(_QWORD *)&v629 = 6;
      swift_errorRetain(v61);
      v260 = static _ErrorCodeProtocol.~= infix(_:_:)(&v629, v61, v137, v138);
      swift_errorRelease(v61);
      if ((v260 & 1) == 0)
      {
        *(_QWORD *)&v629 = 7;
        swift_errorRetain(v61);
        v283 = static _ErrorCodeProtocol.~= infix(_:_:)(&v629, v61, v137, v138);
        swift_errorRelease(v61);
        if ((v283 & 1) != 0)
        {
          v284 = v603;
          ((void (*)(char *, void *, uint64_t))v628._countAndFlagsBits)(v603, object, v24);
          v285 = swift_allocObject(&unk_1000220F0, 24, 7);
          *(_QWORD *)(v285 + 16) = v61;
          swift_errorRetain(v61);
          v286 = swift_errorRetain(v61);
          v287 = Logger.logObject.getter(v286);
          v288 = static os_log_type_t.error.getter();
          v289 = swift_allocObject(&unk_100022118, 17, 7);
          *(_BYTE *)(v289 + 16) = 32;
          v290 = swift_allocObject(&unk_100022140, 17, 7);
          *(_BYTE *)(v290 + 16) = 8;
          v291 = swift_allocObject(&unk_100022168, 32, 7);
          *(_QWORD *)(v291 + 16) = sub_100019B00;
          *(_QWORD *)(v291 + 24) = v285;
          v292 = swift_allocObject(&unk_100022190, 32, 7);
          *(_QWORD *)(v292 + 16) = sub_100019A74;
          *(_QWORD *)(v292 + 24) = v291;
          v293 = sub_10000937C(&qword_100026080);
          v294 = swift_allocObject(v293, 80, 7);
          *(_OWORD *)(v294 + 16) = xmmword_10001B000;
          *(_QWORD *)(v294 + 32) = sub_100019B04;
          *(_QWORD *)(v294 + 40) = v289;
          *(_QWORD *)(v294 + 48) = sub_100019B04;
          *(_QWORD *)(v294 + 56) = v290;
          *(_QWORD *)(v294 + 64) = sub_10000A110;
          *(_QWORD *)(v294 + 72) = v292;
          swift_retain(v285);
          swift_retain(v291);
          swift_retain(v289);
          swift_retain(v290);
          swift_retain(v292);
          swift_bridgeObjectRelease(v294);
          v295 = v288;
          v628._countAndFlagsBits = (uint64_t)v287;
          if (os_log_type_enabled(v287, v288))
          {
            v296 = (uint8_t *)swift_slowAlloc(12, -1);
            v297 = swift_slowAlloc(32, -1);
            *(_QWORD *)&v629 = v297;
            *(_WORD *)v296 = 258;
            v296[2] = 32;
            swift_release(v289);
            v296[3] = 8;
            swift_release(v290);
            v298 = v626;
            v636._countAndFlagsBits = (uint64_t)v626;
            swift_errorRetain(v626);
            v299 = sub_10000937C(&qword_100026088);
            v300 = String.init<A>(describing:)(&v636, v299);
            v302 = v301;
            v636._countAndFlagsBits = sub_100017A54(v300, v301, (uint64_t *)&v629);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v636, &v636._object, v296 + 4);
            swift_release(v285);
            swift_release(v291);
            swift_release(v292);
            swift_bridgeObjectRelease(v302);
            swift_errorRelease(v298);
            v303 = (void *)v628._countAndFlagsBits;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v628._countAndFlagsBits, v295, "Test Verification Server Rate Limit error: %s", v296, 0xCu);
            swift_arrayDestroy(v297, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v297, -1, -1);
            swift_slowDealloc(v296, -1, -1);

            v304 = v603;
          }
          else
          {
            swift_release(v285);
            swift_release(v291);
            swift_release(v292);
            swift_release(v290);
            swift_release(v289);
            swift_errorRelease(v626);

            v304 = v284;
          }
          ((void (*)(char *, uint64_t))v628._object)(v304, v613);
          v327 = (void *)objc_opt_self(NSBundle);
          v328 = objc_msgSend(v327, "mainBundle");
          v329._countAndFlagsBits = 0xD000000000000016;
          v645._object = (void *)0xEB00000000656C74;
          v329._object = (void *)0x800000010001BAE0;
          v330._countAndFlagsBits = 0;
          v330._object = (void *)0xE000000000000000;
          v645._countAndFlagsBits = 0x6974207472656C41;
          v628 = NSLocalizedString(_:tableName:bundle:value:comment:)(v329, (Swift::String_optional)0, (NSBundle)v328, v330, v645);

          v331 = objc_msgSend(v327, "mainBundle");
          v332._countAndFlagsBits = 0xD000000000000018;
          v646._object = (void *)0xED00006567617373;
          v332._object = (void *)0x800000010001BB00;
          v333._countAndFlagsBits = 0;
          v333._object = (void *)0xE000000000000000;
          v646._countAndFlagsBits = 0x656D207472656C41;
          v334 = NSLocalizedString(_:tableName:bundle:value:comment:)(v332, (Swift::String_optional)0, (NSBundle)v331, v333, v646);
          *(_QWORD *)&v623 = v334._countAndFlagsBits;
          object = v334._object;

          v199 = objc_msgSend(v327, "mainBundle");
          goto LABEL_75;
        }
        *(_QWORD *)&v629 = 8;
        swift_errorRetain(v61);
        v305 = static _ErrorCodeProtocol.~= infix(_:_:)(&v629, v61, v137, v138);
        swift_errorRelease(v61);
        if ((v305 & 1) != 0)
        {
          v306 = v602;
          ((void (*)(char *, void *, uint64_t))v628._countAndFlagsBits)(v602, object, v24);
          v307 = swift_allocObject(&unk_100022028, 24, 7);
          *(_QWORD *)(v307 + 16) = v61;
          swift_errorRetain(v61);
          v308 = swift_errorRetain(v61);
          v309 = Logger.logObject.getter(v308);
          v310 = static os_log_type_t.error.getter();
          v311 = swift_allocObject(&unk_100022050, 17, 7);
          *(_BYTE *)(v311 + 16) = 32;
          v312 = swift_allocObject(&unk_100022078, 17, 7);
          *(_BYTE *)(v312 + 16) = 8;
          v313 = swift_allocObject(&unk_1000220A0, 32, 7);
          *(_QWORD *)(v313 + 16) = sub_100019B00;
          *(_QWORD *)(v313 + 24) = v307;
          v314 = swift_allocObject(&unk_1000220C8, 32, 7);
          *(_QWORD *)(v314 + 16) = sub_100019A74;
          *(_QWORD *)(v314 + 24) = v313;
          v315 = sub_10000937C(&qword_100026080);
          v316 = swift_allocObject(v315, 80, 7);
          *(_OWORD *)(v316 + 16) = xmmword_10001B000;
          *(_QWORD *)(v316 + 32) = sub_100019B04;
          *(_QWORD *)(v316 + 40) = v311;
          *(_QWORD *)(v316 + 48) = sub_100019B04;
          *(_QWORD *)(v316 + 56) = v312;
          *(_QWORD *)(v316 + 64) = sub_10000A110;
          *(_QWORD *)(v316 + 72) = v314;
          swift_retain(v307);
          swift_retain(v313);
          swift_retain(v311);
          swift_retain(v312);
          swift_retain(v314);
          swift_bridgeObjectRelease(v316);
          v317 = v310;
          v628._countAndFlagsBits = (uint64_t)v309;
          if (os_log_type_enabled(v309, v310))
          {
            v318 = (uint8_t *)swift_slowAlloc(12, -1);
            v319 = swift_slowAlloc(32, -1);
            *(_QWORD *)&v629 = v319;
            *(_WORD *)v318 = 258;
            v318[2] = 32;
            swift_release(v311);
            v318[3] = 8;
            swift_release(v312);
            v320 = v626;
            v636._countAndFlagsBits = (uint64_t)v626;
            swift_errorRetain(v626);
            v321 = sub_10000937C(&qword_100026088);
            v322 = String.init<A>(describing:)(&v636, v321);
            v324 = v323;
            v636._countAndFlagsBits = sub_100017A54(v322, v323, (uint64_t *)&v629);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v636, &v636._object, v318 + 4);
            swift_release(v307);
            swift_release(v313);
            swift_release(v314);
            swift_bridgeObjectRelease(v324);
            swift_errorRelease(v320);
            v325 = (void *)v628._countAndFlagsBits;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v628._countAndFlagsBits, v317, "Test Verification Server Timeout error: %s", v318, 0xCu);
            swift_arrayDestroy(v319, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v319, -1, -1);
            swift_slowDealloc(v318, -1, -1);

            v326 = v602;
          }
          else
          {
            swift_release(v307);
            swift_release(v313);
            swift_release(v314);
            swift_release(v312);
            swift_release(v311);
            swift_errorRelease(v626);

            v326 = v306;
          }
          ((void (*)(char *, uint64_t))v628._object)(v326, v613);
          v357 = (void *)objc_opt_self(NSBundle);
          v358 = objc_msgSend(v357, "mainBundle");
          v647._object = (void *)0xEB00000000656C74;
          v359._object = (void *)0x800000010001B8E0;
          v359._countAndFlagsBits = 0xD000000000000027;
          v360._countAndFlagsBits = 0;
          v360._object = (void *)0xE000000000000000;
          v647._countAndFlagsBits = 0x6974207472656C41;
          v628 = NSLocalizedString(_:tableName:bundle:value:comment:)(v359, (Swift::String_optional)0, (NSBundle)v358, v360, v647);

          v361 = objc_msgSend(v357, "mainBundle");
          v362._countAndFlagsBits = 0xD00000000000001CLL;
          v648._object = (void *)0xED00006567617373;
          v362._object = (void *)0x800000010001BAC0;
          v363._countAndFlagsBits = 0;
          v363._object = (void *)0xE000000000000000;
          v648._countAndFlagsBits = 0x656D207472656C41;
          v364 = NSLocalizedString(_:tableName:bundle:value:comment:)(v362, (Swift::String_optional)0, (NSBundle)v361, v363, v648);
          *(_QWORD *)&v623 = v364._countAndFlagsBits;
          object = v364._object;

          v199 = objc_msgSend(v357, "mainBundle");
          goto LABEL_75;
        }
        *(_QWORD *)&v629 = 9;
        swift_errorRetain(v61);
        v335 = static _ErrorCodeProtocol.~= infix(_:_:)(&v629, v61, v137, v138);
        swift_errorRelease(v61);
        if ((v335 & 1) != 0)
        {
          v336 = v601;
          ((void (*)(char *, void *, uint64_t))v628._countAndFlagsBits)(v601, object, v24);
          v337 = swift_allocObject(&unk_100021F60, 24, 7);
          *(_QWORD *)(v337 + 16) = v61;
          swift_errorRetain(v61);
          v338 = swift_errorRetain(v61);
          v339 = Logger.logObject.getter(v338);
          v340 = static os_log_type_t.error.getter();
          v341 = swift_allocObject(&unk_100021F88, 17, 7);
          *(_BYTE *)(v341 + 16) = 32;
          v342 = swift_allocObject(&unk_100021FB0, 17, 7);
          *(_BYTE *)(v342 + 16) = 8;
          v343 = swift_allocObject(&unk_100021FD8, 32, 7);
          *(_QWORD *)(v343 + 16) = sub_100019B00;
          *(_QWORD *)(v343 + 24) = v337;
          v344 = swift_allocObject(&unk_100022000, 32, 7);
          *(_QWORD *)(v344 + 16) = sub_100019A74;
          *(_QWORD *)(v344 + 24) = v343;
          v345 = sub_10000937C(&qword_100026080);
          v346 = swift_allocObject(v345, 80, 7);
          *(_OWORD *)(v346 + 16) = xmmword_10001B000;
          *(_QWORD *)(v346 + 32) = sub_100019B04;
          *(_QWORD *)(v346 + 40) = v341;
          *(_QWORD *)(v346 + 48) = sub_100019B04;
          *(_QWORD *)(v346 + 56) = v342;
          *(_QWORD *)(v346 + 64) = sub_10000A110;
          *(_QWORD *)(v346 + 72) = v344;
          swift_retain(v337);
          swift_retain(v343);
          swift_retain(v341);
          swift_retain(v342);
          swift_retain(v344);
          swift_bridgeObjectRelease(v346);
          v347 = v340;
          v628._countAndFlagsBits = (uint64_t)v339;
          if (os_log_type_enabled(v339, v340))
          {
            v348 = (uint8_t *)swift_slowAlloc(12, -1);
            v349 = swift_slowAlloc(32, -1);
            *(_QWORD *)&v629 = v349;
            *(_WORD *)v348 = 258;
            v348[2] = 32;
            swift_release(v341);
            v348[3] = 8;
            swift_release(v342);
            v350 = v626;
            v636._countAndFlagsBits = (uint64_t)v626;
            swift_errorRetain(v626);
            v351 = sub_10000937C(&qword_100026088);
            v352 = String.init<A>(describing:)(&v636, v351);
            v354 = v353;
            v636._countAndFlagsBits = sub_100017A54(v352, v353, (uint64_t *)&v629);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v636, &v636._object, v348 + 4);
            swift_release(v337);
            swift_release(v343);
            swift_release(v344);
            swift_bridgeObjectRelease(v354);
            swift_errorRelease(v350);
            v355 = (void *)v628._countAndFlagsBits;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v628._countAndFlagsBits, v347, "Test Verification Region Unavailable error: %s", v348, 0xCu);
            swift_arrayDestroy(v349, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v349, -1, -1);
            swift_slowDealloc(v348, -1, -1);

            v356 = v601;
          }
          else
          {
            swift_release(v337);
            swift_release(v343);
            swift_release(v344);
            swift_release(v342);
            swift_release(v341);
            swift_errorRelease(v626);

            v356 = v336;
          }
          ((void (*)(char *, uint64_t))v628._object)(v356, v613);
          v386 = (void *)objc_opt_self(NSBundle);
          v387 = objc_msgSend(v386, "mainBundle");
          v388._countAndFlagsBits = 0xD00000000000001ELL;
          v649._object = (void *)0xEB00000000656C74;
          v388._object = (void *)0x800000010001BA70;
          v389._countAndFlagsBits = 0;
          v389._object = (void *)0xE000000000000000;
          v649._countAndFlagsBits = 0x6974207472656C41;
          v628 = NSLocalizedString(_:tableName:bundle:value:comment:)(v388, (Swift::String_optional)0, (NSBundle)v387, v389, v649);

          v390 = objc_msgSend(v386, "mainBundle");
          v391._countAndFlagsBits = 0xD000000000000020;
          v650._object = (void *)0xED00006567617373;
          v391._object = (void *)0x800000010001BA90;
          v392._countAndFlagsBits = 0;
          v392._object = (void *)0xE000000000000000;
          v650._countAndFlagsBits = 0x656D207472656C41;
          v393 = NSLocalizedString(_:tableName:bundle:value:comment:)(v391, (Swift::String_optional)0, (NSBundle)v390, v392, v650);
          *(_QWORD *)&v623 = v393._countAndFlagsBits;
          object = v393._object;

          v199 = objc_msgSend(v386, "mainBundle");
          goto LABEL_75;
        }
        *(_QWORD *)&v629 = 10;
        swift_errorRetain(v61);
        v365 = static _ErrorCodeProtocol.~= infix(_:_:)(&v629, v61, v137, v138);
        swift_errorRelease(v61);
        if ((v365 & 1) != 0)
        {
          ((void (*)(char *, void *, uint64_t))v628._countAndFlagsBits)(v95, object, v24);
          v366 = swift_allocObject(&unk_100021E98, 24, 7);
          *(_QWORD *)(v366 + 16) = v61;
          swift_errorRetain(v61);
          v367 = swift_errorRetain(v61);
          v368 = Logger.logObject.getter(v367);
          v369 = static os_log_type_t.error.getter();
          v370 = swift_allocObject(&unk_100021EC0, 17, 7);
          *(_BYTE *)(v370 + 16) = 32;
          v371 = swift_allocObject(&unk_100021EE8, 17, 7);
          *(_BYTE *)(v371 + 16) = 8;
          v372 = swift_allocObject(&unk_100021F10, 32, 7);
          *(_QWORD *)(v372 + 16) = sub_100019B00;
          *(_QWORD *)(v372 + 24) = v366;
          v373 = swift_allocObject(&unk_100021F38, 32, 7);
          *(_QWORD *)(v373 + 16) = sub_100019A74;
          *(_QWORD *)(v373 + 24) = v372;
          v374 = sub_10000937C(&qword_100026080);
          v375 = swift_allocObject(v374, 80, 7);
          *(_OWORD *)(v375 + 16) = xmmword_10001B000;
          *(_QWORD *)(v375 + 32) = sub_100019B04;
          *(_QWORD *)(v375 + 40) = v370;
          *(_QWORD *)(v375 + 48) = sub_100019B04;
          *(_QWORD *)(v375 + 56) = v371;
          *(_QWORD *)(v375 + 64) = sub_10000A110;
          *(_QWORD *)(v375 + 72) = v373;
          swift_retain(v366);
          swift_retain(v372);
          swift_retain(v370);
          swift_retain(v371);
          swift_retain(v373);
          swift_bridgeObjectRelease(v375);
          v376 = v369;
          v628._countAndFlagsBits = (uint64_t)v368;
          if (os_log_type_enabled(v368, v369))
          {
            v377 = (uint8_t *)swift_slowAlloc(12, -1);
            v378 = swift_slowAlloc(32, -1);
            *(_QWORD *)&v629 = v378;
            *(_WORD *)v377 = 258;
            v377[2] = 32;
            swift_release(v370);
            v377[3] = 8;
            swift_release(v371);
            v379 = v626;
            v636._countAndFlagsBits = (uint64_t)v626;
            swift_errorRetain(v626);
            v380 = sub_10000937C(&qword_100026088);
            v381 = String.init<A>(describing:)(&v636, v380);
            v383 = v382;
            v636._countAndFlagsBits = sub_100017A54(v381, v382, (uint64_t *)&v629);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v636, &v636._object, v377 + 4);
            swift_release(v366);
            swift_release(v372);
            swift_release(v373);
            swift_bridgeObjectRelease(v383);
            swift_errorRelease(v379);
            v384 = (void *)v628._countAndFlagsBits;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v628._countAndFlagsBits, v376, "Test Verification Region Unsupported error: %s", v377, 0xCu);
            swift_arrayDestroy(v378, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v378, -1, -1);
            swift_slowDealloc(v377, -1, -1);

            v385 = v621;
          }
          else
          {
            swift_release(v366);
            swift_release(v372);
            swift_release(v373);
            swift_release(v371);
            swift_release(v370);
            swift_errorRelease(v626);

            v385 = v95;
          }
          ((void (*)(char *, uint64_t))v628._object)(v385, v613);
          v416 = (void *)objc_opt_self(NSBundle);
          v417 = objc_msgSend(v416, "mainBundle");
          v418._countAndFlagsBits = 0xD00000000000001ELL;
          v651._object = (void *)0xEB00000000656C74;
          v418._object = (void *)0x800000010001BA20;
          v419._countAndFlagsBits = 0;
          v419._object = (void *)0xE000000000000000;
          v651._countAndFlagsBits = 0x6974207472656C41;
          v628 = NSLocalizedString(_:tableName:bundle:value:comment:)(v418, (Swift::String_optional)0, (NSBundle)v417, v419, v651);

          v420 = objc_msgSend(v416, "mainBundle");
          v421._countAndFlagsBits = 0xD000000000000020;
          v652._object = (void *)0xED00006567617373;
          v421._object = (void *)0x800000010001BA40;
          v422._countAndFlagsBits = 0;
          v422._object = (void *)0xE000000000000000;
          v652._countAndFlagsBits = 0x656D207472656C41;
          v423 = NSLocalizedString(_:tableName:bundle:value:comment:)(v421, (Swift::String_optional)0, (NSBundle)v420, v422, v652);
          *(_QWORD *)&v623 = v423._countAndFlagsBits;
          object = v423._object;

          v199 = objc_msgSend(v416, "mainBundle");
          goto LABEL_75;
        }
        *(_QWORD *)&v629 = 11;
        swift_errorRetain(v61);
        v394 = static _ErrorCodeProtocol.~= infix(_:_:)(&v629, v61, v137, v138);
        swift_errorRelease(v61);
        if ((v394 & 1) != 0)
        {
          v395 = v600;
          ((void (*)(char *, void *, uint64_t))v628._countAndFlagsBits)(v600, object, v24);
          v396 = swift_allocObject(&unk_100021DA8, 24, 7);
          *(_QWORD *)(v396 + 16) = v61;
          swift_errorRetain(v61);
          v397 = swift_errorRetain(v61);
          v398 = Logger.logObject.getter(v397);
          v399 = static os_log_type_t.error.getter();
          v400 = swift_allocObject(&unk_100021DD0, 17, 7);
          *(_BYTE *)(v400 + 16) = 32;
          v401 = swift_allocObject(&unk_100021DF8, 17, 7);
          *(_BYTE *)(v401 + 16) = 8;
          v402 = swift_allocObject(&unk_100021E20, 32, 7);
          *(_QWORD *)(v402 + 16) = sub_100018420;
          *(_QWORD *)(v402 + 24) = v396;
          v403 = swift_allocObject(&unk_100021E48, 32, 7);
          *(_QWORD *)(v403 + 16) = sub_100019A74;
          *(_QWORD *)(v403 + 24) = v402;
          v404 = sub_10000937C(&qword_100026080);
          v405 = swift_allocObject(v404, 80, 7);
          *(_OWORD *)(v405 + 16) = xmmword_10001B000;
          *(_QWORD *)(v405 + 32) = sub_100019B04;
          *(_QWORD *)(v405 + 40) = v400;
          *(_QWORD *)(v405 + 48) = sub_100019B04;
          *(_QWORD *)(v405 + 56) = v401;
          *(_QWORD *)(v405 + 64) = sub_10000A110;
          *(_QWORD *)(v405 + 72) = v403;
          swift_retain(v396);
          swift_retain(v402);
          swift_retain(v400);
          swift_retain(v401);
          swift_retain(v403);
          swift_bridgeObjectRelease(v405);
          v406 = v399;
          v628._countAndFlagsBits = (uint64_t)v398;
          if (os_log_type_enabled(v398, v399))
          {
            v407 = (uint8_t *)swift_slowAlloc(12, -1);
            v408 = swift_slowAlloc(32, -1);
            *(_QWORD *)&v629 = v408;
            *(_WORD *)v407 = 258;
            v407[2] = 32;
            swift_release(v400);
            v407[3] = 8;
            swift_release(v401);
            v409 = v626;
            v636._countAndFlagsBits = (uint64_t)v626;
            swift_errorRetain(v626);
            v410 = sub_10000937C(&qword_100026088);
            v411 = String.init<A>(describing:)(&v636, v410);
            v413 = v412;
            v636._countAndFlagsBits = sub_100017A54(v411, v412, (uint64_t *)&v629);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v636, &v636._object, v407 + 4);
            swift_release(v396);
            swift_release(v402);
            swift_release(v403);
            swift_bridgeObjectRelease(v413);
            swift_errorRelease(v409);
            v414 = (void *)v628._countAndFlagsBits;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v628._countAndFlagsBits, v406, "Test Verification Network error: %s", v407, 0xCu);
            swift_arrayDestroy(v408, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v408, -1, -1);
            swift_slowDealloc(v407, -1, -1);

            v415 = v600;
          }
          else
          {
            swift_release(v396);
            swift_release(v402);
            swift_release(v403);
            swift_release(v401);
            swift_release(v400);
            swift_errorRelease(v626);

            v415 = v395;
          }
          ((void (*)(char *, uint64_t))v628._object)(v415, v613);
          v464 = (void *)objc_opt_self(NSBundle);
          v465 = objc_msgSend(v464, "mainBundle");
          v466._countAndFlagsBits = 0xD000000000000013;
          v654._object = (void *)0xEB00000000656C74;
          v466._object = (void *)0x800000010001BA00;
          v467._countAndFlagsBits = 0;
          v467._object = (void *)0xE000000000000000;
          v654._countAndFlagsBits = 0x6974207472656C41;
          v628 = NSLocalizedString(_:tableName:bundle:value:comment:)(v466, (Swift::String_optional)0, (NSBundle)v465, v467, v654);

          if (objc_msgSend((id)objc_opt_self(MobileGestaltBridge), "wapiCapability"))
            v468 = 1312902231;
          else
            v468 = 1229343063;
          *(_QWORD *)&v629 = 0;
          *((_QWORD *)&v629 + 1) = 0xE000000000000000;
          _StringGuts.grow(_:)(24);
          swift_bridgeObjectRelease(*((_QWORD *)&v629 + 1));
          *(_QWORD *)&v629 = 0x5F4B524F5754454ELL;
          *((_QWORD *)&v629 + 1) = 0xE800000000000000;
          v469._countAndFlagsBits = v468;
          v469._object = (void *)0xE400000000000000;
          String.append(_:)(v469);
          swift_bridgeObjectRelease(0xE400000000000000);
          v470._countAndFlagsBits = 0x4D5F524F5252455FLL;
          v470._object = (void *)0xEE00454741535345;
          String.append(_:)(v470);
          v472 = (void *)*((_QWORD *)&v629 + 1);
          v471 = v629;
          v473 = objc_msgSend(v464, "mainBundle");
          v655._object = (void *)0xED00006567617373;
          v474._countAndFlagsBits = v471;
          v474._object = v472;
          v475._countAndFlagsBits = 0;
          v475._object = (void *)0xE000000000000000;
          v655._countAndFlagsBits = 0x656D207472656C41;
          v476 = NSLocalizedString(_:tableName:bundle:value:comment:)(v474, (Swift::String_optional)0, (NSBundle)v473, v475, v655);
          *(_QWORD *)&v623 = v476._countAndFlagsBits;
          object = v476._object;
          swift_bridgeObjectRelease(v472);

          v477 = objc_msgSend(v464, "mainBundle");
          v656._object = (void *)0xE600000000000000;
          v478._countAndFlagsBits = 19279;
          v478._object = (void *)0xE200000000000000;
          v479._countAndFlagsBits = 0;
          v479._object = (void *)0xE000000000000000;
          v656._countAndFlagsBits = 0x6E6F74747542;
          v480 = NSLocalizedString(_:tableName:bundle:value:comment:)(v478, (Swift::String_optional)0, (NSBundle)v477, v479, v656);
          countAndFlagsBits = v480._countAndFlagsBits;
          v428 = v480._object;

          v481 = objc_msgSend(v464, "mainBundle");
          v657._object = (void *)0xE600000000000000;
          v482._countAndFlagsBits = 0x53474E4954544553;
          v482._object = (void *)0xE800000000000000;
          v483._countAndFlagsBits = 0;
          v483._object = (void *)0xE000000000000000;
          v657._countAndFlagsBits = 0x6E6F74747542;
          v484 = NSLocalizedString(_:tableName:bundle:value:comment:)(v482, (Swift::String_optional)0, (NSBundle)v481, v483, v657);
          v431 = v484._countAndFlagsBits;
          v432 = v484._object;

          v430 = swift_allocObject(&unk_100021E70, 25, 7);
          v433 = 0;
          *(_QWORD *)(v430 + 16) = v624;
          *(_BYTE *)(v430 + 24) = v625 & 1;
          v429 = sub_100018468;
          goto LABEL_76;
        }
        type metadata accessor for Code(0);
        v441 = v440;
        *(_QWORD *)&v629 = 5;
        swift_errorRetain(v61);
        v442 = sub_100003574(&qword_100025AD8, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_10001AB4C);
        v443 = static _ErrorCodeProtocol.~= infix(_:_:)(&v629, v61, v441, v442);
        swift_errorRelease(v61);
        if ((v443 & 1) == 0)
        {
          *(_QWORD *)&v629 = 9;
          swift_errorRetain(v61);
          v485 = static _ErrorCodeProtocol.~= infix(_:_:)(&v629, v61, v441, v442);
          swift_errorRelease(v61);
          if ((v485 & 1) != 0)
          {
            ((void (*)(char *, void *, uint64_t))v628._countAndFlagsBits)(v597, object, v24);
            v486 = swift_allocObject(&unk_100021BC8, 24, 7);
            *(_QWORD *)(v486 + 16) = v61;
            swift_errorRetain(v61);
            v487 = swift_errorRetain(v61);
            v488 = Logger.logObject.getter(v487);
            v489 = static os_log_type_t.error.getter();
            v490 = swift_allocObject(&unk_100021BF0, 17, 7);
            *(_BYTE *)(v490 + 16) = 32;
            v491 = swift_allocObject(&unk_100021C18, 17, 7);
            *(_BYTE *)(v491 + 16) = 8;
            v492 = swift_allocObject(&unk_100021C40, 32, 7);
            *(_QWORD *)(v492 + 16) = sub_100019B00;
            *(_QWORD *)(v492 + 24) = v486;
            v493 = swift_allocObject(&unk_100021C68, 32, 7);
            *(_QWORD *)(v493 + 16) = sub_100019A74;
            *(_QWORD *)(v493 + 24) = v492;
            v494 = sub_10000937C(&qword_100026080);
            inited = swift_initStackObject(v494, &v632);
            *(_OWORD *)(inited + 16) = xmmword_10001B000;
            *(_QWORD *)(inited + 32) = sub_100019B04;
            *(_QWORD *)(inited + 40) = v490;
            *(_QWORD *)(inited + 48) = sub_100019B04;
            *(_QWORD *)(inited + 56) = v491;
            *(_QWORD *)(inited + 64) = sub_10000A110;
            *(_QWORD *)(inited + 72) = v493;
            swift_retain(v486);
            swift_retain(v492);
            swift_retain(v490);
            swift_retain(v491);
            swift_retain(v493);
            swift_bridgeObjectRelease(inited);
            v496 = v489;
            v628._countAndFlagsBits = (uint64_t)v488;
            if (os_log_type_enabled(v488, v489))
            {
              v497 = (uint8_t *)swift_slowAlloc(12, -1);
              v498 = swift_slowAlloc(32, -1);
              *(_QWORD *)&v629 = v498;
              *(_WORD *)v497 = 258;
              v497[2] = 32;
              swift_release(v490);
              v497[3] = 8;
              swift_release(v491);
              v499 = v626;
              v636._countAndFlagsBits = (uint64_t)v626;
              swift_errorRetain(v626);
              v500 = sub_10000937C(&qword_100026088);
              v501 = String.init<A>(describing:)(&v636, v500);
              v503 = v502;
              v636._countAndFlagsBits = sub_100017A54(v501, v502, (uint64_t *)&v629);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v636, &v636._object, v497 + 4);
              swift_release(v486);
              swift_release(v492);
              swift_release(v493);
              swift_bridgeObjectRelease(v503);
              swift_errorRelease(v499);
              v504 = (void *)v628._countAndFlagsBits;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)v628._countAndFlagsBits, v496, "Test Verification Not Enabled error: %s", v497, 0xCu);
              swift_arrayDestroy(v498, 1, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v498, -1, -1);
              swift_slowDealloc(v497, -1, -1);

            }
            else
            {
              swift_release(v486);
              swift_release(v492);
              swift_release(v493);
              swift_release(v491);
              swift_release(v490);
              swift_errorRelease(v626);

            }
            ((void (*)(char *, uint64_t))v628._object)(v597, v613);
            v537 = (void *)objc_opt_self(NSBundle);
            v538 = objc_msgSend(v537, "mainBundle");
            v539._countAndFlagsBits = 0xD000000000000011;
            v658._object = (void *)0xEB00000000656C74;
            v539._object = (void *)0x800000010001B940;
            v540._countAndFlagsBits = 0;
            v540._object = (void *)0xE000000000000000;
            v658._countAndFlagsBits = 0x6974207472656C41;
            v628 = NSLocalizedString(_:tableName:bundle:value:comment:)(v539, (Swift::String_optional)0, (NSBundle)v538, v540, v658);

            v541 = objc_msgSend(v537, "mainBundle");
            v542._countAndFlagsBits = 0xD000000000000013;
            v659._object = (void *)0xED00006567617373;
            v542._object = (void *)0x800000010001B960;
            v543._countAndFlagsBits = 0;
            v543._object = (void *)0xE000000000000000;
            v659._countAndFlagsBits = 0x656D207472656C41;
            v544 = NSLocalizedString(_:tableName:bundle:value:comment:)(v542, (Swift::String_optional)0, (NSBundle)v541, v543, v659);
            *(_QWORD *)&v623 = v544._countAndFlagsBits;
            object = v544._object;

            v545 = objc_msgSend(v537, "mainBundle");
            v546._countAndFlagsBits = 0xD000000000000020;
            v660._object = (void *)0xE600000000000000;
            v546._object = (void *)0x800000010001B980;
            v547._countAndFlagsBits = 0;
            v547._object = (void *)0xE000000000000000;
            v660._countAndFlagsBits = 0x6E6F74747542;
            v548 = NSLocalizedString(_:tableName:bundle:value:comment:)(v546, (Swift::String_optional)0, (NSBundle)v545, v547, v660);
            countAndFlagsBits = v548._countAndFlagsBits;
            v428 = v548._object;

            v549 = objc_msgSend(v537, "mainBundle");
            v661._object = (void *)0xE600000000000000;
            v550._countAndFlagsBits = 0x6C65636E6143;
            v550._object = (void *)0xE600000000000000;
            v551._countAndFlagsBits = 0;
            v551._object = (void *)0xE000000000000000;
            v661._countAndFlagsBits = 0x6E6F74747542;
            v552 = NSLocalizedString(_:tableName:bundle:value:comment:)(v550, (Swift::String_optional)0, (NSBundle)v549, v551, v661);
            v431 = v552._countAndFlagsBits;
            v432 = v552._object;

            v430 = swift_allocObject(&unk_100021C90, 41, 7);
            v553 = v620;
            v554 = v596;
            *(_QWORD *)(v430 + 16) = v620;
            *(_QWORD *)(v430 + 24) = v554;
            *(_QWORD *)(v430 + 32) = v624;
            *(_BYTE *)(v430 + 40) = v625 & 1;
            v555 = v553;
            v556 = v554;
            v433 = 0;
            v429 = sub_100018218;
            goto LABEL_76;
          }
          ((void (*)(char *, void *, uint64_t))v628._countAndFlagsBits)(v598, object, v24);
          v518 = swift_allocObject(&unk_100021B00, 24, 7);
          *(_QWORD *)(v518 + 16) = v61;
          swift_errorRetain(v61);
          v519 = swift_errorRetain(v61);
          v520 = Logger.logObject.getter(v519);
          v521 = static os_log_type_t.error.getter();
          v522 = swift_allocObject(&unk_100021B28, 17, 7);
          *(_BYTE *)(v522 + 16) = 32;
          v523 = swift_allocObject(&unk_100021B50, 17, 7);
          *(_BYTE *)(v523 + 16) = 8;
          v524 = swift_allocObject(&unk_100021B78, 32, 7);
          *(_QWORD *)(v524 + 16) = sub_100019B00;
          *(_QWORD *)(v524 + 24) = v518;
          v525 = swift_allocObject(&unk_100021BA0, 32, 7);
          *(_QWORD *)(v525 + 16) = sub_1000181AC;
          *(_QWORD *)(v525 + 24) = v524;
          v526 = sub_10000937C(&qword_100026080);
          v527 = swift_initStackObject(v526, &v633);
          *(_OWORD *)(v527 + 16) = xmmword_10001B000;
          *(_QWORD *)(v527 + 32) = sub_100018188;
          *(_QWORD *)(v527 + 40) = v522;
          *(_QWORD *)(v527 + 48) = sub_100019B04;
          *(_QWORD *)(v527 + 56) = v523;
          *(_QWORD *)(v527 + 64) = sub_1000093F4;
          *(_QWORD *)(v527 + 72) = v525;
          swift_retain(v518);
          swift_retain(v524);
          swift_retain(v522);
          swift_retain(v523);
          swift_retain(v525);
          swift_bridgeObjectRelease(v527);
          v528 = v521;
          v628._countAndFlagsBits = (uint64_t)v520;
          if (os_log_type_enabled(v520, v521))
          {
            v529 = (uint8_t *)swift_slowAlloc(12, -1);
            v530 = swift_slowAlloc(32, -1);
            *(_QWORD *)&v629 = v530;
            *(_WORD *)v529 = 258;
            v529[2] = 32;
            swift_release(v522);
            v529[3] = 8;
            swift_release(v523);
            v531 = v626;
            v636._countAndFlagsBits = (uint64_t)v626;
            swift_errorRetain(v626);
            v532 = sub_10000937C(&qword_100026088);
            v533 = String.init<A>(describing:)(&v636, v532);
            v535 = v534;
            v636._countAndFlagsBits = sub_100017A54(v533, v534, (uint64_t *)&v629);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v636, &v636._object, v529 + 4);
            swift_release(v518);
            swift_release(v524);
            swift_release(v525);
            swift_bridgeObjectRelease(v535);
            swift_errorRelease(v531);
            v536 = (void *)v628._countAndFlagsBits;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v628._countAndFlagsBits, v528, "Unhandled Test Verification error: %s", v529, 0xCu);
            swift_arrayDestroy(v530, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v530, -1, -1);
            swift_slowDealloc(v529, -1, -1);

          }
          else
          {
            swift_release(v518);
            swift_release(v524);
            swift_release(v525);
            swift_release(v523);
            swift_release(v522);
            swift_errorRelease(v626);

          }
          ((void (*)(char *, uint64_t))v628._object)(v598, v613);
          v557 = (void *)objc_opt_self(NSBundle);
          v558 = objc_msgSend(v557, "mainBundle");
          v662._object = (void *)0xEB00000000656C74;
          v559._object = (void *)0x800000010001B8E0;
          v559._countAndFlagsBits = 0xD000000000000027;
          v560._countAndFlagsBits = 0;
          v560._object = (void *)0xE000000000000000;
          v662._countAndFlagsBits = 0x6974207472656C41;
          v628 = NSLocalizedString(_:tableName:bundle:value:comment:)(v559, (Swift::String_optional)0, (NSBundle)v558, v560, v662);

          v561 = objc_msgSend(v557, "mainBundle");
          v562._countAndFlagsBits = 0xD000000000000029;
          v663._object = (void *)0xED00006567617373;
          v562._object = (void *)0x800000010001B910;
          v563._countAndFlagsBits = 0;
          v563._object = (void *)0xE000000000000000;
          v663._countAndFlagsBits = 0x656D207472656C41;
          v564 = NSLocalizedString(_:tableName:bundle:value:comment:)(v562, (Swift::String_optional)0, (NSBundle)v561, v563, v663);
          *(_QWORD *)&v623 = v564._countAndFlagsBits;
          object = v564._object;

          v199 = objc_msgSend(v557, "mainBundle");
          goto LABEL_75;
        }
        v444 = v599;
        ((void (*)(char *, void *, uint64_t))v628._countAndFlagsBits)(v599, object, v24);
        v445 = swift_allocObject(&unk_100021CB8, 24, 7);
        *(_QWORD *)(v445 + 16) = v61;
        swift_errorRetain(v61);
        v446 = swift_errorRetain(v61);
        v447 = Logger.logObject.getter(v446);
        v448 = static os_log_type_t.error.getter();
        v449 = swift_allocObject(&unk_100021CE0, 17, 7);
        *(_BYTE *)(v449 + 16) = 32;
        v450 = swift_allocObject(&unk_100021D08, 17, 7);
        *(_BYTE *)(v450 + 16) = 8;
        v451 = swift_allocObject(&unk_100021D30, 32, 7);
        *(_QWORD *)(v451 + 16) = sub_100019B00;
        *(_QWORD *)(v451 + 24) = v445;
        v452 = swift_allocObject(&unk_100021D58, 32, 7);
        *(_QWORD *)(v452 + 16) = sub_100019A74;
        *(_QWORD *)(v452 + 24) = v451;
        v453 = sub_10000937C(&qword_100026080);
        v454 = swift_initStackObject(v453, &v631);
        *(_OWORD *)(v454 + 16) = xmmword_10001B000;
        *(_QWORD *)(v454 + 32) = sub_100019B04;
        *(_QWORD *)(v454 + 40) = v449;
        *(_QWORD *)(v454 + 48) = sub_100019B04;
        *(_QWORD *)(v454 + 56) = v450;
        *(_QWORD *)(v454 + 64) = sub_10000A110;
        *(_QWORD *)(v454 + 72) = v452;
        swift_retain(v445);
        swift_retain(v451);
        swift_retain(v449);
        swift_retain(v450);
        swift_retain(v452);
        swift_bridgeObjectRelease(v454);
        v455 = v448;
        v628._countAndFlagsBits = (uint64_t)v447;
        if (os_log_type_enabled(v447, v448))
        {
          v456 = (uint8_t *)swift_slowAlloc(12, -1);
          object = (void *)swift_slowAlloc(32, -1);
          *(_QWORD *)&v629 = object;
          *(_WORD *)v456 = 258;
          v456[2] = 32;
          swift_release(v449);
          v456[3] = 8;
          swift_release(v450);
          v457 = v626;
          v636._countAndFlagsBits = (uint64_t)v626;
          swift_errorRetain(v626);
          v458 = sub_10000937C(&qword_100026088);
          v459 = String.init<A>(describing:)(&v636, v458);
          v461 = v460;
          v636._countAndFlagsBits = sub_100017A54(v459, v460, (uint64_t *)&v629);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v636, &v636._object, v456 + 4);
          swift_release(v445);
          swift_release(v451);
          swift_release(v452);
          swift_bridgeObjectRelease(v461);
          swift_errorRelease(v457);
          v462 = (void *)v628._countAndFlagsBits;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v628._countAndFlagsBits, v455, "Test Verification Unsupported error: %s", v456, 0xCu);
          v463 = object;
          swift_arrayDestroy(object, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v463, -1, -1);
          swift_slowDealloc(v456, -1, -1);

          ((void (*)(char *, uint64_t))v628._object)(v599, v613);
        }
        else
        {
          swift_release(v445);
          swift_release(v451);
          swift_release(v452);
          swift_release(v450);
          swift_release(v449);
          v505 = v626;
          swift_errorRelease(v626);

          ((void (*)(char *, uint64_t))v628._object)(v444, v613);
          v457 = v505;
        }
        v506 = (void *)_convertErrorToNSError(_:)(v457);
        v507 = objc_msgSend(v506, "userInfo");

        v508 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v507, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
        v509 = static String._unconditionallyBridgeFromObjectiveC(_:)(ENErrorUserInfoKeyAppBundleIdentifier);
        v511 = v510;
        if (*(_QWORD *)(v508 + 16) && (v512 = sub_100018330(v509, v510), (v513 & 1) != 0))
        {
          sub_10001813C(*(_QWORD *)(v508 + 56) + 32 * v512, (uint64_t)&v629);
        }
        else
        {
          v629 = 0u;
          v630 = 0u;
        }
        swift_bridgeObjectRelease(v511);
        swift_bridgeObjectRelease(v508);
        if (*((_QWORD *)&v630 + 1))
        {
          if ((swift_dynamicCast(&v636, &v629, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
          {
            v515 = (void *)v636._countAndFlagsBits;
            v514 = (char *)v636._object;
            v516 = objc_allocWithZone((Class)LSApplicationRecord);
            swift_bridgeObjectRetain(v514);
            v620 = v515;
            v621 = v514;
            v517 = sub_100017898((uint64_t)v515, (uint64_t)v514, 0);
            v565 = v517;
            if (v517)
            {
              v566 = objc_msgSend(v517, "localizedName");
              v567 = static String._unconditionallyBridgeFromObjectiveC(_:)(v566);
              object = v568;

              v569 = (void *)objc_opt_self(NSBundle);
              v570 = objc_msgSend(v569, "mainBundle");
              v571._countAndFlagsBits = 0xD00000000000001CLL;
              v664._object = (void *)0xEB00000000656C74;
              v571._object = (void *)0x800000010001B9B0;
              v572._countAndFlagsBits = 0;
              v572._object = (void *)0xE000000000000000;
              v664._countAndFlagsBits = 0x6974207472656C41;
              v573 = NSLocalizedString(_:tableName:bundle:value:comment:)(v571, (Swift::String_optional)0, (NSBundle)v570, v572, v664);

              v574 = sub_10000937C(&qword_100026098);
              v575 = swift_allocObject(v574, 72, 7);
              v623 = xmmword_10001B170;
              *(_OWORD *)(v575 + 16) = xmmword_10001B170;
              *(_QWORD *)(v575 + 56) = &type metadata for String;
              v576 = sub_100018394();
              *(_QWORD *)(v575 + 64) = v576;
              v577 = object;
              *(_QWORD *)(v575 + 32) = v567;
              *(_QWORD *)(v575 + 40) = v577;
              swift_bridgeObjectRetain(v577);
              v628._countAndFlagsBits = String.init(format:_:)(v573._countAndFlagsBits, v573._object, v575);
              v628._object = v578;
              swift_bridgeObjectRelease(v573._object);
              v579 = objc_msgSend(v569, "mainBundle");
              v580._countAndFlagsBits = 0xD000000000000029;
              v665._object = (void *)0xED00006567617373;
              v580._object = (void *)0x800000010001B910;
              v581._countAndFlagsBits = 0;
              v581._object = (void *)0xE000000000000000;
              v665._countAndFlagsBits = 0x656D207472656C41;
              v582 = NSLocalizedString(_:tableName:bundle:value:comment:)(v580, (Swift::String_optional)0, (NSBundle)v579, v581, v665);

              v583 = swift_allocObject(v574, 72, 7);
              *(_OWORD *)(v583 + 16) = v623;
              *(_QWORD *)(v583 + 56) = &type metadata for String;
              *(_QWORD *)(v583 + 64) = v576;
              v584 = object;
              *(_QWORD *)(v583 + 32) = v567;
              *(_QWORD *)(v583 + 40) = v584;
              *(_QWORD *)&v623 = String.init(format:_:)(v582._countAndFlagsBits, v582._object, v583);
              object = v585;
              swift_bridgeObjectRelease(v582._object);
              v586 = objc_msgSend(v569, "mainBundle");
              v587._countAndFlagsBits = 0xD000000000000026;
              v666._object = (void *)0xE600000000000000;
              v587._object = (void *)0x800000010001B9D0;
              v588._countAndFlagsBits = 0;
              v588._object = (void *)0xE000000000000000;
              v666._countAndFlagsBits = 0x6E6F74747542;
              v589 = NSLocalizedString(_:tableName:bundle:value:comment:)(v587, (Swift::String_optional)0, (NSBundle)v586, v588, v666);
              countAndFlagsBits = v589._countAndFlagsBits;
              v428 = v589._object;

              v590 = objc_msgSend(v569, "mainBundle");
              v667._object = (void *)0xE600000000000000;
              v591._countAndFlagsBits = 0x6C65636E6143;
              v591._object = (void *)0xE600000000000000;
              v592._countAndFlagsBits = 0;
              v592._object = (void *)0xE000000000000000;
              v667._countAndFlagsBits = 0x6E6F74747542;
              v593 = NSLocalizedString(_:tableName:bundle:value:comment:)(v591, (Swift::String_optional)0, (NSBundle)v590, v592, v667);
              v431 = v593._countAndFlagsBits;
              v432 = v593._object;

              v430 = swift_allocObject(&unk_100021D80, 41, 7);
              v433 = 0;
              v594 = v621;
              *(_QWORD *)(v430 + 16) = v620;
              *(_QWORD *)(v430 + 24) = v594;
              *(_QWORD *)(v430 + 32) = v624;
              *(_BYTE *)(v430 + 40) = v625 & 1;
              v429 = sub_1000183FC;
              goto LABEL_76;
            }
            swift_bridgeObjectRelease(v621);
          }
        }
        else
        {
          sub_100009580((uint64_t)&v629, &qword_100026090);
        }
        goto LABEL_35;
      }
      v231 = v604;
      ((void (*)(char *, void *, uint64_t))v628._countAndFlagsBits)(v604, object, v24);
      v232 = swift_allocObject(&unk_1000221B8, 24, 7);
      *(_QWORD *)(v232 + 16) = v61;
      swift_errorRetain(v61);
      v261 = swift_errorRetain(v61);
      v262 = Logger.logObject.getter(v261);
      v263 = static os_log_type_t.error.getter();
      v236 = swift_allocObject(&unk_1000221E0, 17, 7);
      *(_BYTE *)(v236 + 16) = 32;
      v237 = swift_allocObject(&unk_100022208, 17, 7);
      *(_BYTE *)(v237 + 16) = 8;
      v238 = swift_allocObject(&unk_100022230, 32, 7);
      *(_QWORD *)(v238 + 16) = sub_100019B00;
      *(_QWORD *)(v238 + 24) = v232;
      v239 = swift_allocObject(&unk_100022258, 32, 7);
      *(_QWORD *)(v239 + 16) = sub_100019A74;
      *(_QWORD *)(v239 + 24) = v238;
      v264 = sub_10000937C(&qword_100026080);
      v265 = swift_allocObject(v264, 80, 7);
      *(_OWORD *)(v265 + 16) = xmmword_10001B000;
      *(_QWORD *)(v265 + 32) = sub_100019B04;
      *(_QWORD *)(v265 + 40) = v236;
      *(_QWORD *)(v265 + 48) = sub_100019B04;
      *(_QWORD *)(v265 + 56) = v237;
      *(_QWORD *)(v265 + 64) = sub_10000A110;
      *(_QWORD *)(v265 + 72) = v239;
      swift_retain(v232);
      swift_retain(v238);
      swift_retain(v236);
      swift_retain(v237);
      swift_retain(v239);
      swift_bridgeObjectRelease(v265);
      v266 = v263;
      v628._countAndFlagsBits = (uint64_t)v262;
      if (os_log_type_enabled(v262, v263))
      {
        v267 = (uint8_t *)swift_slowAlloc(12, -1);
        v268 = swift_slowAlloc(32, -1);
        *(_QWORD *)&v629 = v268;
        *(_WORD *)v267 = 258;
        v267[2] = 32;
        swift_release(v236);
        v267[3] = 8;
        swift_release(v237);
        v269 = v626;
        v636._countAndFlagsBits = (uint64_t)v626;
        swift_errorRetain(v626);
        v270 = sub_10000937C(&qword_100026088);
        v271 = String.init<A>(describing:)(&v636, v270);
        v273 = v272;
        v636._countAndFlagsBits = sub_100017A54(v271, v272, (uint64_t *)&v629);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v636, &v636._object, v267 + 4);
        swift_release(v232);
        swift_release(v238);
        swift_release(v239);
        swift_bridgeObjectRelease(v273);
        swift_errorRelease(v269);
        v274 = (void *)v628._countAndFlagsBits;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v628._countAndFlagsBits, v266, "Test Verification Server error: %s", v267, 0xCu);
        swift_arrayDestroy(v268, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v268, -1, -1);
        swift_slowDealloc(v267, -1, -1);

        v251 = v604;
        goto LABEL_50;
      }
    }
    swift_release(v232);
    swift_release(v238);
    swift_release(v239);
    swift_release(v237);
    swift_release(v236);
    swift_errorRelease(v626);

    v251 = v231;
    goto LABEL_50;
  }
  v77 = (uint64_t (**)(char *, char *, uint64_t))object;
  v78 = (*((uint64_t (**)(char *, uint64_t *, uint64_t))object + 4))(v21, v59, v17);
  v79 = Logger.testVerification.unsafeMutableAddressor(v78);
  v80 = (char *)*((_QWORD *)v628._object + 2);
  v616 = v79;
  v621 = v80;
  ((void (*)(uint64_t))v80)(v628._countAndFlagsBits);
  v81 = v77[2](v626, v21, v17);
  v82 = Logger.logObject.getter(v81);
  v83 = static os_log_type_t.info.getter();
  v84 = os_log_type_enabled(v82, v83);
  v85 = v17;
  v612 = v21;
  if (v84)
  {
    v86 = (uint8_t *)swift_slowAlloc(12, -1);
    v87 = swift_slowAlloc(32, -1);
    *(_QWORD *)&v629 = v87;
    *(_DWORD *)v86 = 136315138;
    v615 = v85;
    v88 = v626;
    v89 = UUID.uuidString.getter();
    v91 = v90;
    v636._countAndFlagsBits = sub_100017A54(v89, v90, (uint64_t *)&v629);
    v92 = v615;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v636, &v636._object, v86 + 4);
    swift_bridgeObjectRelease(v91);
    v93 = v88;
    v85 = v92;
    object = (void *)*((_QWORD *)object + 1);
    ((void (*)(char *, uint64_t))object)(v93, v92);
    _os_log_impl((void *)&_mh_execute_header, v82, v83, "Test Verification Session Identifier: %s", v86, 0xCu);
    swift_arrayDestroy(v87, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v87, -1, -1);
    swift_slowDealloc(v86, -1, -1);
  }
  else
  {
    object = (void *)*((_QWORD *)object + 1);
    ((void (*)(char *, uint64_t))object)(v626, v17);
  }

  v104 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v628._object + 1);
  v104(v628._countAndFlagsBits, v24);
  v105 = v623;
  v106 = (uint64_t)v618;
  *(_QWORD *)&v629 = 0;
  *((_QWORD *)&v629 + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(76);
  v107._countAndFlagsBits = 0xD00000000000004ALL;
  v107._object = (void *)0x800000010001B890;
  String.append(_:)(v107);
  v108._countAndFlagsBits = UUID.uuidString.getter();
  v109 = v108._object;
  String.append(_:)(v108);
  swift_bridgeObjectRelease(v109);
  if (v620)
  {
    v110 = v620;
    v111 = objc_msgSend(v110, "subdivisionCode");
    if (!v111)
      v111 = objc_msgSend(v110, "countryCode");
    v112 = static String._unconditionallyBridgeFromObjectiveC(_:)(v111);
    v114 = v113;

    strcpy((char *)&v636, "&region=");
    BYTE1(v636._object) = 0;
    WORD1(v636._object) = 0;
    HIDWORD(v636._object) = -402653184;
    v115._countAndFlagsBits = v112;
    v115._object = v114;
    String.append(_:)(v115);
    swift_bridgeObjectRelease(v114);
    v116 = v636._object;
    String.append(_:)(v636);

    swift_bridgeObjectRelease(v116);
  }
  strcpy((char *)&v636, "&reportType=");
  BYTE5(v636._object) = 0;
  HIWORD(v636._object) = -5120;
  LODWORD(v634) = v617;
  v117._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt32, &protocol witness table for UInt32);
  v118 = v117._object;
  String.append(_:)(v117);
  swift_bridgeObjectRelease(v118);
  v119 = v636._object;
  String.append(_:)(v636);
  swift_bridgeObjectRelease(v119);
  v120 = *((_QWORD *)&v629 + 1);
  URL.init(string:)(v629, *((_QWORD *)&v629 + 1));
  swift_bridgeObjectRelease(v120);
  v121 = countAndFlagsBits;
  ((void (*)(uint64_t, uint64_t, uint64_t))v621)(countAndFlagsBits, v616, v24);
  v122 = sub_100018844(v105, v106, (uint64_t *)&unk_100026050);
  v123 = Logger.logObject.getter(v122);
  v124 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v123, v124))
  {
    v613 = v24;
    v125 = (uint8_t *)swift_slowAlloc(12, -1);
    v126 = swift_slowAlloc(32, -1);
    v628._object = v104;
    v127 = v126;
    v636._countAndFlagsBits = v126;
    *(_DWORD *)v125 = 136315138;
    v128 = v610;
    sub_100018844(v106, v610, (uint64_t *)&unk_100026050);
    v129 = String.init<A>(describing:)(v128, v611);
    v130 = v106;
    v131 = v85;
    v133 = v132;
    v634 = sub_100017A54(v129, v132, &v636._countAndFlagsBits);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v634, v635, v125 + 4);
    v134 = v133;
    v85 = v131;
    swift_bridgeObjectRelease(v134);
    v135 = v130;
    v105 = v623;
    sub_100009580(v135, (uint64_t *)&unk_100026050);
    _os_log_impl((void *)&_mh_execute_header, v123, v124, "Opening Settings to %s", v125, 0xCu);
    swift_arrayDestroy(v127, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v127, -1, -1);
    swift_slowDealloc(v125, -1, -1);

    ((void (*)(uint64_t, uint64_t))v628._object)(countAndFlagsBits, v613);
  }
  else
  {
    sub_100009580(v106, (uint64_t *)&unk_100026050);

    v104(v121, v24);
  }
  v152 = (uint64_t)v619;
  v153 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
  v154 = v624;
  if (v153)
  {
    v155 = v153;
    sub_100018844(v105, v152, (uint64_t *)&unk_100026050);
    v156 = type metadata accessor for URL(0);
    v157 = *(_QWORD *)(v156 - 8);
    v159 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v157 + 48))(v152, 1, v156) != 1)
    {
      URL._bridgeToObjectiveC()(v158);
      v159 = v160;
      (*(void (**)(uint64_t, uint64_t))(v157 + 8))(v152, v156);
    }
    v161 = sub_10000937C(&qword_100026060);
    v162 = swift_initStackObject(v161, v635);
    *(_OWORD *)(v162 + 16) = xmmword_10001B060;
    *(_QWORD *)(v162 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyUnlockDevice);
    *(_QWORD *)(v162 + 40) = v163;
    *(_QWORD *)(v162 + 72) = &type metadata for Bool;
    *(_BYTE *)(v162 + 48) = 1;
    *(_QWORD *)(v162 + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyPromptUnlockDevice);
    *(_QWORD *)(v162 + 88) = v164;
    *(_QWORD *)(v162 + 120) = &type metadata for Bool;
    *(_BYTE *)(v162 + 96) = 1;
    v165 = sub_10000DE50(v162);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v165);
    objc_msgSend(v155, "openSensitiveURL:withOptions:", v159, isa);

  }
  if ((v625 & 1) == 0 && UIBackgroundTaskInvalid != v154)
  {
    v167 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    objc_msgSend(v167, "endBackgroundTask:", v154);

  }
  sub_100009580(v105, (uint64_t *)&unk_100026050);
  return ((uint64_t (*)(char *, uint64_t))object)(v612, v85);
}

void sub_100016A64(char a1, uint64_t a2, char a3)
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
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  id v24;
  void *v25;
  NSString v26;
  id v27;
  uint64_t v28;

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v28 - v12;
  v14 = Logger.testVerification.unsafeMutableAddressor(v11);
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16);
  if ((a1 & 1) != 0)
  {
    v20 = v15(v10, v14, v6);
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "User chose Settings", v23, 2u);
      swift_slowDealloc(v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    v24 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
    if (v24)
    {
      v25 = v24;
      v26 = String._bridgeToObjectiveC()();
      objc_msgSend(v25, "openApplicationWithBundleID:", v26);

    }
  }
  else
  {
    v16 = v15(v13, v14, v6);
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "User chose OK", v19, 2u);
      swift_slowDealloc(v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  }
  if ((a3 & 1) == 0 && UIBackgroundTaskInvalid != a2)
  {
    v27 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    objc_msgSend(v27, "endBackgroundTask:", a2);

  }
}

void sub_100016CD4(char a1, uint64_t a2, unint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t (*v19)(_BYTE *, uint64_t, uint64_t);
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  id v32;
  void *v33;
  NSString v34;
  id v35;
  _BYTE v36[12];
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  LODWORD(v5) = a5;
  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = &v36[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = __chkstk_darwin(v12);
  v17 = &v36[-v16];
  v18 = Logger.testVerification.unsafeMutableAddressor(v15);
  v19 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v11 + 16);
  if ((a1 & 1) != 0)
  {
    v28 = v19(v14, v18, v10);
    v29 = Logger.logObject.getter(v28);
    v30 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "User chose Cancel", v31, 2u);
      swift_slowDealloc(v31, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v14, v10);
  }
  else
  {
    v39 = a2;
    v19(v17, v18, v10);
    v20 = swift_bridgeObjectRetain_n(a3, 2);
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = swift_slowAlloc(12, -1);
      v38 = a4;
      v24 = (uint8_t *)v23;
      v25 = swift_slowAlloc(32, -1);
      v37 = v5;
      v5 = v25;
      v41 = v25;
      *(_DWORD *)v24 = 136315138;
      swift_bridgeObjectRetain(a3);
      v40 = sub_100017A54(v39, a3, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41, v24 + 4);
      swift_bridgeObjectRelease_n(a3, 3);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "User chose Open App, launching: %s", v24, 0xCu);
      swift_arrayDestroy(v5, 1, (char *)&type metadata for Any + 8);
      v26 = v5;
      LOBYTE(v5) = v37;
      swift_slowDealloc(v26, -1, -1);
      v27 = v24;
      a4 = v38;
      swift_slowDealloc(v27, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a3, 2);
    }
    (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v17, v10);
    v32 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
    if (v32)
    {
      v33 = v32;
      v34 = String._bridgeToObjectiveC()();
      objc_msgSend(v33, "openApplicationWithBundleID:", v34);

    }
  }
  if ((v5 & 1) == 0 && UIBackgroundTaskInvalid != a4)
  {
    v35 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    objc_msgSend(v35, "endBackgroundTask:", a4);

  }
}

void sub_10001700C(int a1, void *a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  void *v34;
  uint8_t *v35;
  unint64_t v36;
  void (*v37)(char *, uint64_t);
  unint64_t v38;
  char *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  Swift::String v44;
  void *object;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  uint64_t v66;
  id v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  NSURL *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t inited;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  Class isa;
  id v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  void (*v84)(char *, id);
  char *v85;
  void (*v86)(char *, uint64_t, uint64_t);
  char *v87;
  char *v88;
  id v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  Swift::String v93;
  uint64_t v94;
  _BYTE v95[128];
  unint64_t v96;
  unint64_t v97;

  v90 = a5;
  v91 = a4;
  v89 = a2;
  LODWORD(v92) = a1;
  v5 = sub_10000937C((uint64_t *)&unk_100026050);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v81 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&v81 - v10;
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v81 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v81 - v15;
  v17 = type metadata accessor for Logger(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = __chkstk_darwin(v17);
  v21 = (char *)&v81 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __chkstk_darwin(v19);
  v24 = (char *)&v81 - v23;
  v25 = __chkstk_darwin(v22);
  v27 = (char *)&v81 - v26;
  v28 = Logger.testVerification.unsafeMutableAddressor(v25);
  v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 16);
  if ((v92 & 1) != 0)
  {
    v62 = v29(v21, v28, v17);
    v63 = Logger.logObject.getter(v62);
    v64 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v63, v64))
    {
      v65 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v65 = 0;
      _os_log_impl((void *)&_mh_execute_header, v63, v64, "User chose Cancel", v65, 2u);
      swift_slowDealloc(v65, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
    v66 = v91;
    if ((v90 & 1) == 0)
      goto LABEL_18;
  }
  else
  {
    v82 = v11;
    v83 = v5;
    v87 = v24;
    v88 = v14;
    v85 = v8;
    v92 = (uint64_t)v16;
    v30 = v28;
    v86 = (void (*)(char *, uint64_t, uint64_t))v29;
    v31 = ((uint64_t (*)(char *))v29)(v27);
    v32 = Logger.logObject.getter(v31);
    v33 = static os_log_type_t.info.getter();
    v34 = (void *)v17;
    if (os_log_type_enabled(v32, v33))
    {
      v35 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v35 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "User chose Set Up", v35, 2u);
      swift_slowDealloc(v35, -1, -1);
    }
    v36 = 0xD000000000000039;

    v37 = *(void (**)(char *, uint64_t))(v18 + 8);
    v37(v27, v17);
    v38 = 0x800000010001BBC0;
    v96 = 0xD000000000000039;
    v97 = 0x800000010001BBC0;
    v39 = v87;
    v84 = (void (*)(char *, id))v37;
    if (v89)
    {
      v40 = objc_msgSend(v89, "regionCode");
      v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
      v43 = v42;

      v93._countAndFlagsBits = 47;
      v93._object = (void *)0xE100000000000000;
      v44._countAndFlagsBits = v41;
      v44._object = v43;
      String.append(_:)(v44);
      swift_bridgeObjectRelease(v43);
      object = v93._object;
      String.append(_:)(v93);
      swift_bridgeObjectRelease(object);
      v36 = v96;
      v38 = v97;
    }
    v46 = v92;
    URL.init(string:)(v36, v38);
    swift_bridgeObjectRelease(v38);
    v86(v39, v30, v17);
    v47 = (uint64_t)v88;
    v48 = sub_100018844(v46, (uint64_t)v88, (uint64_t *)&unk_100026050);
    v49 = Logger.logObject.getter(v48);
    v50 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc(12, -1);
      v52 = swift_slowAlloc(32, -1);
      v93._countAndFlagsBits = v52;
      *(_DWORD *)v51 = 136315138;
      v89 = v34;
      v53 = v92;
      v54 = (uint64_t)v82;
      sub_100018844(v47, (uint64_t)v82, (uint64_t *)&unk_100026050);
      v55 = String.init<A>(describing:)(v54, v83);
      v56 = v47;
      v58 = v57;
      v94 = sub_100017A54(v55, v57, &v93._countAndFlagsBits);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v94, v95, v51 + 4);
      swift_bridgeObjectRelease(v58);
      v59 = v56;
      v46 = v53;
      sub_100009580(v59, (uint64_t *)&unk_100026050);
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "Opening Settings to %s", v51, 0xCu);
      swift_arrayDestroy(v52, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v52, -1, -1);
      swift_slowDealloc(v51, -1, -1);

      v84(v39, v89);
    }
    else
    {
      sub_100009580(v47, (uint64_t *)&unk_100026050);

      v84(v39, v34);
    }
    v66 = v91;
    v60 = v90;
    v61 = (uint64_t)v85;
    v67 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
    if (v67)
    {
      v68 = v67;
      sub_100018844(v46, v61, (uint64_t *)&unk_100026050);
      v69 = type metadata accessor for URL(0);
      v70 = *(_QWORD *)(v69 - 8);
      v72 = 0;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v70 + 48))(v61, 1, v69) != 1)
      {
        URL._bridgeToObjectiveC()(v71);
        v72 = v73;
        (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v61, v69);
      }
      v74 = sub_10000937C(&qword_100026060);
      inited = swift_initStackObject(v74, v95);
      *(_OWORD *)(inited + 16) = xmmword_10001B060;
      *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyUnlockDevice);
      *(_QWORD *)(inited + 40) = v76;
      *(_QWORD *)(inited + 72) = &type metadata for Bool;
      *(_BYTE *)(inited + 48) = 1;
      *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyPromptUnlockDevice);
      *(_QWORD *)(inited + 88) = v77;
      *(_QWORD *)(inited + 120) = &type metadata for Bool;
      *(_BYTE *)(inited + 96) = 1;
      v78 = sub_10000DE50(inited);
      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v78);
      objc_msgSend(v68, "openSensitiveURL:withOptions:", v72, isa);

    }
    sub_100009580(v46, (uint64_t *)&unk_100026050);
    if ((v60 & 1) == 0)
    {
LABEL_18:
      if (UIBackgroundTaskInvalid != v66)
      {
        v80 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
        objc_msgSend(v80, "endBackgroundTask:", v66);

      }
    }
  }
}

uint64_t sub_10001774C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = a1;
  swift_errorRetain();
  v1 = sub_10000937C(&qword_100026088);
  return String.init<A>(describing:)(&v3, v1);
}

id sub_1000177CC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(_TtC16HealthENLauncher13SceneDelegate);
}

void sub_10001782C()
{
  uint64_t v0;

  sub_100011D2C(v0);
}

uint64_t sub_100017834(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100017844(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001784C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));

  return swift_deallocObject(v0, 68, 7);
}

uint64_t sub_100017880(uint64_t a1)
{
  uint64_t v1;

  return sub_100011F24(a1, *(_QWORD *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(void **)(v1 + 48), *(void **)(v1 + 56), *(_DWORD *)(v1 + 64));
}

id sub_100017898(uint64_t a1, uint64_t a2, char a3)
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

uint64_t sub_100017970(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100017980(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1000179B4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 16) = a2;
  *(_QWORD *)(result + 24) = 2 * a2;
  return result;
}

uint64_t sub_1000179C4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000179E4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
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
  v9 = sub_100017A54(v6, v7, a3);
  v10 = *a1;
  v11 = *a1 + 8;
  v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v11;
  return result;
}

uint64_t sub_100017A54(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100017B24(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10001813C((uint64_t)v12, *a3);
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
      sub_10001813C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10001811C(v12);
  return v7;
}

uint64_t sub_100017B24(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100017CDC(a5, a6);
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

uint64_t sub_100017CDC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100017D70(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_100017FC0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100017FC0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100017D70(uint64_t a1, unint64_t a2)
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
      v5 = sub_100017EE4(v4, 0);
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

_QWORD *sub_100017EE4(uint64_t a1, uint64_t a2)
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
  v4 = sub_10000937C(&qword_100026048);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100017F48(unint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_100017FC0(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000937C(&qword_100026048);
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

_BYTE **sub_10001810C(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_10001811C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10001813C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100018178()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE **sub_100018188(_BYTE **result)
{
  uint64_t v1;
  _BYTE *v2;

  v2 = *result;
  *v2 = *(_BYTE *)(v1 + 16);
  *result = v2 + 1;
  return result;
}

uint64_t sub_10001819C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000181AC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000181CC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000181DC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000181EC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 41, 7);
}

uint64_t sub_100018218(char a1)
{
  return sub_100018408(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10001700C);
}

uint64_t sub_100018224()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100018234()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

unint64_t sub_100018244(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = static Hasher._hash(seed:_:)(*(_QWORD *)(v1 + 40), a1);
  return sub_1000185C0(a1, v3);
}

unint64_t sub_100018274(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  Swift::Int v7;
  _QWORD v9[9];

  Hasher.init(_seed:)(v9, *(_QWORD *)(v1 + 40));
  if (a1)
  {
    Hasher._combine(_:)(1u);
    type metadata accessor for CFString(0);
    v4 = v3;
    v5 = sub_100003574(&qword_100025E90, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10001AADC);
    v6 = a1;
    _CFObject.hash(into:)(v9, v4, v5);

  }
  else
  {
    Hasher._combine(_:)(0);
  }
  v7 = Hasher._finalize()();
  return sub_10001865C((uint64_t)a1, v7);
}

unint64_t sub_100018330(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100018764(a1, a2, v5);
}

unint64_t sub_100018394()
{
  unint64_t result;

  result = qword_1000260A0;
  if (!qword_1000260A0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000260A0);
  }
  return result;
}

uint64_t sub_1000183D8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 41, 7);
}

uint64_t sub_1000183FC(char a1)
{
  return sub_100018408(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100016CD4);
}

uint64_t sub_100018408(char a1, uint64_t (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v2;

  return a2(a1 & 1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(unsigned __int8 *)(v2 + 40));
}

uint64_t sub_100018420()
{
  uint64_t v0;

  return sub_10001774C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100018438()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100018448()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100018458()
{
  uint64_t v0;

  return swift_deallocObject(v0, 25, 7);
}

void sub_100018468(char a1)
{
  uint64_t v1;

  sub_100016A64(a1 & 1, *(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24));
}

uint64_t sub_100018478()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100018488()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100018498()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000184BC()
{
  uint64_t v0;

  swift_errorRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000184E0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000184F0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100018500()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100018510()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100018520()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100018530()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100018540()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100018550()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100018560()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100018570()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100018580()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100018590()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000185A0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000185B0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

unint64_t sub_1000185C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_10001865C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = v2;
    v8 = ~v4;
    do
    {
      v9 = *(void **)(*(_QWORD *)(v6 + 48) + 8 * v5);
      if (v9)
      {
        if (a1)
        {
          type metadata accessor for CFString(0);
          v11 = v10;
          v12 = sub_100003574(&qword_100025E90, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10001AADC);
          v13 = v9;
          LOBYTE(v11) = static _CFObject.== infix(_:_:)(v13, a1, v11, v12);

          if ((v11 & 1) != 0)
            return v5;
        }
      }
      else if (!a1)
      {
        return v5;
      }
      v5 = (v5 + 1) & v8;
    }
    while (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t sub_100018764(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_100018844(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000937C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_100018888(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100018898()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_1000188BC()
{
  sub_1000112F4();
}

uint64_t sub_1000188C4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000188E8(char a1)
{
  uint64_t v1;

  return sub_100010D34(a1 & 1, v1);
}

uint64_t sub_1000188F4()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100018920(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1000100E4(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24), *(void **)(v2 + 32));
}

void sub_10001892C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unint64_t *a5, _QWORD *a6)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Swift::Int v16;
  uint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  id v21;
  char v22;
  id v23;
  uint64_t v24;
  unint64_t *v25;

  v10 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (__CocoaSet.Index.age.getter(a1, a2) == *(_DWORD *)(a4 + 36))
      {
        v14 = __CocoaSet.Index.element.getter(v10, a2);
        v24 = v14;
        v15 = sub_100019984(0, a5, a6);
        swift_unknownObjectRetain(v14);
        swift_dynamicCast(&v25, &v24, (char *)&type metadata for Swift.AnyObject + 8, v15, 7);
        a5 = v25;
        swift_unknownObjectRelease(v14);
        v16 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a4 + 40));
        v17 = -1 << *(_BYTE *)(a4 + 32);
        v10 = v16 & ~v17;
        if (((*(_QWORD *)(a4 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
        {
          v18 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v10);
          v19 = static NSObject.== infix(_:_:)(v18);

          if ((v19 & 1) == 0)
          {
            v20 = ~v17;
            do
            {
              v10 = (v10 + 1) & v20;
              if (((*(_QWORD *)(a4 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
                goto LABEL_24;
              v21 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v10);
              v22 = static NSObject.== infix(_:_:)(v21);

            }
            while ((v22 & 1) == 0);
          }

LABEL_20:
          v23 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v10);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v11 = a4;
  else
    v11 = a4 & 0xFFFFFFFFFFFFFF8;
  v12 = __CocoaSet.element(at:)(a1, a2, v11);
  v24 = v12;
  v13 = sub_100019984(0, a5, a6);
  swift_unknownObjectRetain(v12);
  swift_dynamicCast(&v25, &v24, (char *)&type metadata for Swift.AnyObject + 8, v13, 7);
  swift_unknownObjectRelease(v12);
}

uint64_t sub_100018B8C(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

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
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 72);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

unint64_t sub_100018C14(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  unint64_t result;
  char v6;
  _OWORD *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  _OWORD *v12;
  char v13;
  __int128 v14;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  sub_10000937C(&qword_100025E88);
  v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v1);
  v4 = *(_QWORD *)(a1 + 32);
  v14 = *(_OWORD *)(a1 + 40);
  result = sub_100018244(v4);
  if ((v6 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain(result);
    return (unint64_t)v3;
  }
  v7 = (_OWORD *)(a1 + 64);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v4;
    v8 = *((_QWORD *)&v14 + 1);
    *(_OWORD *)(v3[7] + 16 * result) = v14;
    v9 = v3[2];
    v10 = __OFADD__(v9, 1);
    v11 = v9 + 1;
    if (v10)
      break;
    v3[2] = v11;
    result = *((_QWORD *)&v14 + 1);
    if (!--v1)
      goto LABEL_8;
    v12 = (_OWORD *)((char *)v7 + 24);
    v4 = *((_QWORD *)v7 - 1);
    v14 = *v7;
    swift_retain(v8);
    result = sub_100018244(v4);
    v7 = v12;
    if ((v13 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_100018D18(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t result;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char *v26;
  id v27;
  void (*v28)(char *, char *, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  char *v34;
  char *v35;

  v5 = sub_10000937C((uint64_t *)&unk_100026050);
  __chkstk_darwin(v5);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = __chkstk_darwin(v8);
  __chkstk_darwin(v11);
  v13 = (char *)&v34 - v12;
  v14 = objc_opt_self(UIWindowScene);
  result = swift_dynamicCastObjCClass(a1, v14);
  if (result)
  {
    v34 = v13;
    v35 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = objc_msgSend(a2, "userActivities");
    v17 = sub_100019984(0, &qword_1000260E8, NSUserActivity_ptr);
    v18 = sub_100019930((unint64_t *)&unk_1000260F0, &qword_1000260E8, NSUserActivity_ptr);
    v19 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v16, v17, v18);

    v20 = (void *)sub_10000DC1C(v19, &qword_1000260E8, NSUserActivity_ptr);
    swift_bridgeObjectRelease(v19);
    if (v20)
    {
      sub_10000E17C(v20);

    }
    v21 = objc_msgSend(a2, "URLContexts");
    v22 = sub_100019984(0, &qword_1000260D8, UIOpenURLContext_ptr);
    v23 = sub_100019930(&qword_1000260E0, &qword_1000260D8, UIOpenURLContext_ptr);
    v24 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v21, v22, v23);

    v25 = (void *)sub_10000DC1C(v24, &qword_1000260D8, UIOpenURLContext_ptr);
    swift_bridgeObjectRelease(v24);
    v26 = v35;
    if (v25)
    {
      v27 = objc_msgSend(v25, "URL");

      static URL._unconditionallyBridgeFromObjectiveC(_:)(v27);
      v28 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
      v28(v7, v26, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
      {
        v29 = v34;
        v28(v34, v7, v8);
        type metadata accessor for ENUIPublicHealthAgencyModel(0);
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v26, v29, v8);
        v30 = *(unsigned __int8 *)(v9 + 80);
        v31 = (v30 + 24) & ~v30;
        v32 = swift_allocObject(&unk_1000225C8, v31 + v10, v30 | 7);
        *(_QWORD *)(v32 + 16) = v2;
        v28((char *)(v32 + v31), v26, v8);
        v33 = v2;
        static ENUIPublicHealthAgencyModel.refreshRegions(completion:)(sub_100019974, v32);
        swift_release(v32);
        return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v29, v8);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
    }
    return sub_100009580((uint64_t)v7, (uint64_t *)&unk_100026050);
  }
  return result;
}

uint64_t sub_100019074(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v22;

  v3 = sub_10000937C((uint64_t *)&unk_100026050);
  __chkstk_darwin(v3);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = __chkstk_darwin(v6);
  v10 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - v11;
  v13 = swift_bridgeObjectRetain(a1);
  v14 = (void *)sub_10000DC1C(v13, &qword_1000260D8, UIOpenURLContext_ptr);
  swift_bridgeObjectRelease(a1);
  if (v14)
  {
    v15 = objc_msgSend(v14, "URL");

    static URL._unconditionallyBridgeFromObjectiveC(_:)(v15);
    v16 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v16(v5, v10, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      v16(v12, v5, v6);
      type metadata accessor for ENUIPublicHealthAgencyModel(0);
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
      v17 = *(unsigned __int8 *)(v7 + 80);
      v18 = (v17 + 24) & ~v17;
      v19 = swift_allocObject(&unk_1000225A0, v18 + v8, v17 | 7);
      *(_QWORD *)(v19 + 16) = v1;
      v16((char *)(v19 + v18), v10, v6);
      v20 = v1;
      static ENUIPublicHealthAgencyModel.refreshRegions(completion:)(sub_100019974, v19);
      swift_release(v19);
      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  }
  return sub_100009580((uint64_t)v5, (uint64_t *)&unk_100026050);
}

uint64_t sub_1000192A8(uint64_t a1, void *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v18;
  unint64_t v19;
  Swift::String v20;
  void *object;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint8_t *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSURL *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t inited;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  Class isa;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  Swift::String v53;
  uint64_t v54;
  _BYTE v55[128];
  unint64_t v56;
  unint64_t v57;

  v4 = 0xD000000000000039;
  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = sub_10000937C((uint64_t *)&unk_100026050);
  v9 = __chkstk_darwin(v51);
  v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v49 - v13;
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v49 - v16;
  __chkstk_darwin(v15);
  v52 = (char *)&v49 - v18;
  v19 = 0x800000010001BBC0;
  v56 = 0xD000000000000039;
  v57 = 0x800000010001BBC0;
  if (a2)
  {
    v53._countAndFlagsBits = 47;
    v53._object = (void *)0xE100000000000000;
    v20._countAndFlagsBits = a1;
    v20._object = a2;
    String.append(_:)(v20);
    object = v53._object;
    String.append(_:)(v53);
    swift_bridgeObjectRelease(object);
    v4 = v56;
    v19 = v57;
  }
  v22 = (uint64_t)v52;
  URL.init(string:)(v4, v19);
  v23 = swift_bridgeObjectRelease(v19);
  v24 = Logger.launcher.unsafeMutableAddressor(v23);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v24, v5);
  v25 = sub_100018844(v22, (uint64_t)v17, (uint64_t *)&unk_100026050);
  v26 = Logger.logObject.getter(v25);
  v27 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v26, v27))
  {
    v49 = v5;
    v28 = swift_slowAlloc(12, -1);
    v50 = v11;
    v29 = (uint8_t *)v28;
    v30 = swift_slowAlloc(32, -1);
    v53._countAndFlagsBits = v30;
    *(_DWORD *)v29 = 136315138;
    sub_100018844((uint64_t)v17, (uint64_t)v14, (uint64_t *)&unk_100026050);
    v31 = String.init<A>(describing:)(v14, v51);
    v33 = v32;
    v54 = sub_100017A54(v31, v32, &v53._countAndFlagsBits);
    v22 = (uint64_t)v52;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, v55, v29 + 4);
    swift_bridgeObjectRelease(v33);
    sub_100009580((uint64_t)v17, (uint64_t *)&unk_100026050);
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Opening Settings to %s", v29, 0xCu);
    swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v30, -1, -1);
    v34 = v29;
    v11 = v50;
    swift_slowDealloc(v34, -1, -1);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v49);
  }
  else
  {
    sub_100009580((uint64_t)v17, (uint64_t *)&unk_100026050);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  v35 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
  if (v35)
  {
    v36 = v35;
    sub_100018844(v22, (uint64_t)v11, (uint64_t *)&unk_100026050);
    v37 = type metadata accessor for URL(0);
    v38 = *(_QWORD *)(v37 - 8);
    v40 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v11, 1, v37) != 1)
    {
      URL._bridgeToObjectiveC()(v39);
      v40 = v41;
      (*(void (**)(char *, uint64_t))(v38 + 8))(v11, v37);
    }
    v42 = sub_10000937C(&qword_100026060);
    inited = swift_initStackObject(v42, v55);
    *(_OWORD *)(inited + 16) = xmmword_10001B060;
    *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyUnlockDevice);
    *(_QWORD *)(inited + 40) = v44;
    *(_QWORD *)(inited + 72) = &type metadata for Bool;
    *(_BYTE *)(inited + 48) = 1;
    *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyPromptUnlockDevice);
    *(_QWORD *)(inited + 88) = v45;
    *(_QWORD *)(inited + 120) = &type metadata for Bool;
    *(_BYTE *)(inited + 96) = 1;
    v46 = sub_10000DE50(inited);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v46);
    objc_msgSend(v36, "openSensitiveURL:withOptions:", v40, isa);

  }
  return sub_100009580(v22, (uint64_t *)&unk_100026050);
}

uint64_t sub_100019750()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

void sub_100019784(void *a1)
{
  uint64_t v1;

  sub_100010388(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(void **)(v1 + 48));
}

void sub_100019794(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  if ((a5 & 1) == 0)
    sub_1000197A4(a1, a2, a3, a4, SBYTE4(a4));
}

void sub_1000197A4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  if (a5 == 1)
  {
    swift_bridgeObjectRelease(a2);

  }
  else if (!a5)
  {
    swift_bridgeObjectRelease(a2);
  }
}

uint64_t sub_1000197E8(uint64_t result, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  if ((a5 & 1) == 0)
    return sub_1000197F8(result, a2, a3, a4, SBYTE4(a4));
  return result;
}

uint64_t sub_1000197F8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  id v6;
  uint64_t result;

  if (a5)
  {
    if (a5 != 1)
      return result;
    v6 = a3;
  }
  return swift_bridgeObjectRetain(a2);
}

const char *sub_100019838(unsigned int a1)
{
  if (a1 > 5)
    return "?";
  else
    return (&off_1000225E0)[a1];
}

uint64_t sub_10001985C()
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
  v4 = (v3 + 24) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v6 + 8, v5);
}

void sub_1000198EC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(type metadata accessor for URL(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  sub_10000E4E4(*(void **)(v0 + 16), (v0 + v2), *(_QWORD *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_100019930(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_100019984(255, a2, a3);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100019978(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease(result);
  return result;
}

uint64_t sub_100019984(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_1000199C0()
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
  v4 = (v3 + 24) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_100019A34()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for URL(0) - 8) + 80);
  sub_10000EE6C((v0 + ((v1 + 24) & ~v1)));
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC16HealthENLauncherP33_204BFE53B37867AD681D5265A2C738D519ResourceBundleClass);
}
