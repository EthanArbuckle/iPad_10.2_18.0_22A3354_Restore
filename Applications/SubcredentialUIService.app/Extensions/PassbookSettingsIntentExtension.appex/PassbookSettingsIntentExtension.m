uint64_t sub_10000455C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;

  v0 = sub_100005B44(&qword_10000C0D8);
  sub_100005B9C(v0, qword_10000C188);
  sub_100005B84(v0, (uint64_t)qword_10000C188);
  v1 = sub_100005B44(&qword_10000C0E0);
  v2 = *(_QWORD *)(sub_100005B44(&qword_10000C0E8) - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = *(unsigned __int8 *)(v2 + 80);
  v5 = (v4 + 32) & ~v4;
  v6 = swift_allocObject(v1, v5 + 2 * v3, v4 | 7);
  *(_OWORD *)(v6 + 16) = xmmword_100006F00;
  v7 = (_BYTE *)(v6 + v5);
  *v7 = 0;
  v8 = sub_100004DC4();
  _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD00000000000002FLL, 0x8000000100007630, &type metadata for WalletDeepLinks, v8);
  v7[v3] = 1;
  _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD00000000000003ALL, 0x8000000100007660, &type metadata for WalletDeepLinks, v8);
  v9 = sub_1000046B4(v6);
  return _EnumURLRepresentation.init(_:)(v9, &type metadata for WalletDeepLinks, v8);
}

unint64_t sub_1000046B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = sub_100005B44(&qword_10000C0E8);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v24 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v24);
    return (unint64_t)v8;
  }
  sub_100005B44(&qword_10000C0F0);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = &v5[*(int *)(v2 + 48)];
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v26 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_100005C34(v13, (uint64_t)v5, &qword_10000C0E8);
    v15 = *v5;
    result = sub_100005538(*v5);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v8[6] + result) = v15;
    v19 = v8[7];
    v20 = sub_100005B44(&qword_10000C0F8);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v18, v10, v20);
    v21 = v8[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_12;
    v8[2] = v23;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      v24 = v26;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_100004854(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = sub_100005B44(&qword_10000C0B8);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v24 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v24);
    return (unint64_t)v8;
  }
  sub_100005B44(&qword_10000C0C8);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = &v5[*(int *)(v2 + 48)];
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v26 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_100005C34(v13, (uint64_t)v5, &qword_10000C0B8);
    v15 = *v5;
    result = sub_100005538(*v5);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v8[6] + result) = v15;
    v19 = v8[7];
    v20 = type metadata accessor for DisplayRepresentation(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v18, v10, v20);
    v21 = v8[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_12;
    v8[2] = v23;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      v24 = v26;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_1000049EC()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  sub_100005B44(&qword_10000C0A8);
  __chkstk_darwin();
  v1 = (char *)&v8 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_100005B9C(v6, qword_10000C1A0);
  sub_100005B84(v6, (uint64_t)qword_10000C1A0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000012, 0x8000000100007610);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v5, v1);
}

uint64_t sub_100004AFC(char *a1, char *a2)
{
  return sub_100004B50(*a1, *a2);
}

unint64_t sub_100004B0C()
{
  unint64_t result;

  result = qword_10000C020;
  if (!qword_10000C020)
  {
    result = swift_getWitnessTable(&unk_100006F3C, &type metadata for WalletDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

uint64_t sub_100004B50(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x64726143646461;
  else
    v3 = 1953460082;
  if (v2)
    v4 = 0xE400000000000000;
  else
    v4 = 0xE700000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x64726143646461;
  else
    v5 = 1953460082;
  if ((a2 & 1) != 0)
    v6 = 0xE700000000000000;
  else
    v6 = 0xE400000000000000;
  if (v3 == v5 && v4 == v6)
  {
    v7 = 1;
    v6 = v4;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v7 & 1;
}

Swift::Int sub_100004BEC()
{
  unsigned __int8 *v0;
  int v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD v5[9];

  v1 = *v0;
  Hasher.init(_seed:)(v5, 0);
  if (v1)
    v2 = 0x64726143646461;
  else
    v2 = 1953460082;
  if (v1)
    v3 = 0xE700000000000000;
  else
    v3 = 0xE400000000000000;
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_100004C64(uint64_t a1)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  if (*v1)
    v2 = 0x64726143646461;
  else
    v2 = 1953460082;
  if (*v1)
    v3 = 0xE700000000000000;
  else
    v3 = 0xE400000000000000;
  String.hash(into:)(a1, v2, v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_100004CB8(uint64_t a1)
{
  unsigned __int8 *v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD v6[9];

  v2 = *v1;
  Hasher.init(_seed:)(v6, a1);
  if (v2)
    v3 = 0x64726143646461;
  else
    v3 = 1953460082;
  if (v2)
    v4 = 0xE700000000000000;
  else
    v4 = 0xE400000000000000;
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_100004D2C@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;
  char v7;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100008310, v3);
  result = swift_bridgeObjectRelease(v4);
  if (v5 == 1)
    v7 = 1;
  else
    v7 = 2;
  if (!v5)
    v7 = 0;
  *a2 = v7;
  return result;
}

void sub_100004D88(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 1953460082;
  if (*v1)
    v2 = 0x64726143646461;
  v3 = 0xE400000000000000;
  if (*v1)
    v3 = 0xE700000000000000;
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_100004DC4()
{
  unint64_t result;

  result = qword_10000C028;
  if (!qword_10000C028)
  {
    result = swift_getWitnessTable(&unk_100007014, &type metadata for WalletDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10000C028);
  }
  return result;
}

unint64_t sub_100004E0C()
{
  unint64_t result;

  result = qword_10000C030;
  if (!qword_10000C030)
  {
    result = swift_getWitnessTable(&unk_100007054, &type metadata for WalletDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }
  return result;
}

uint64_t sub_100004E50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10000C000 != -1)
    swift_once(&qword_10000C000, sub_10000455C);
  v2 = sub_100005B44(&qword_10000C0D8);
  v3 = sub_100005B84(v2, (uint64_t)qword_10000C188);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_100004EC8()
{
  unint64_t result;

  result = qword_10000C038;
  if (!qword_10000C038)
  {
    result = swift_getWitnessTable(&unk_10000707C, &type metadata for WalletDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

unint64_t sub_100004F10()
{
  unint64_t result;

  result = qword_10000C040;
  if (!qword_10000C040)
  {
    result = swift_getWitnessTable(&unk_1000070B4, &type metadata for WalletDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

unint64_t sub_100004F58()
{
  unint64_t result;

  result = qword_10000C048;
  if (!qword_10000C048)
  {
    result = swift_getWitnessTable(&unk_100006FA4, &type metadata for WalletDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

void *sub_100004F9C()
{
  return &protocol witness table for String;
}

uint64_t sub_100004FA8(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_100005BDC();
  v4 = _URLRepresentableEnum.urlRepresentationParameter.getter(a1, v3);
  return sub_100005C20(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

unint64_t sub_100004FF4()
{
  unint64_t result;

  result = qword_10000C058;
  if (!qword_10000C058)
  {
    result = swift_getWitnessTable(&unk_1000070E4, &type metadata for WalletDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

unint64_t sub_10000503C()
{
  unint64_t result;

  result = qword_10000C060;
  if (!qword_10000C060)
  {
    result = swift_getWitnessTable(&unk_10000710C, &type metadata for WalletDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

unint64_t sub_100005084()
{
  unint64_t result;

  result = qword_10000C068;
  if (!qword_10000C068)
  {
    result = swift_getWitnessTable(&unk_100007134, &type metadata for WalletDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

unint64_t sub_1000050CC()
{
  unint64_t result;

  result = qword_10000C070;
  if (!qword_10000C070)
  {
    result = swift_getWitnessTable(&unk_10000718C, &type metadata for WalletDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

uint64_t sub_100005114@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10000C008 != -1)
    swift_once(&qword_10000C008, sub_1000049EC);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_100005B84(v2, (uint64_t)qword_10000C1A0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100005184(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100004DC4();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>, 1);
}

uint64_t sub_1000051C4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100004DC4();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100005200()
{
  unint64_t result;

  result = qword_10000C078;
  if (!qword_10000C078)
  {
    result = swift_getWitnessTable(&unk_1000071CC, &type metadata for WalletDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

unint64_t sub_100005248()
{
  unint64_t result;

  result = qword_10000C080;
  if (!qword_10000C080)
  {
    result = swift_getWitnessTable(&unk_1000071F4, &type metadata for WalletDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

unint64_t sub_100005290()
{
  unint64_t result;

  result = qword_10000C088;
  if (!qword_10000C088)
  {
    result = swift_getWitnessTable(&unk_100006F64, &type metadata for WalletDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

uint64_t sub_1000052D8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000050CC();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100005314()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C090;
  if (!qword_10000C090)
  {
    v1 = sub_100005360(&qword_10000C098);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

uint64_t sub_100005360(uint64_t *a1)
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

void sub_1000053A4(_QWORD *a1@<X8>)
{
  *a1 = &off_100008360;
}

_BYTE *initializeBufferWithCopyOfBuffer for WalletDeepLinks(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WalletDeepLinks(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for WalletDeepLinks(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000054A0 + 4 * byte_100006F35[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1000054D4 + 4 * byte_100006F30[v4]))();
}

uint64_t sub_1000054D4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000054DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000054E4);
  return result;
}

uint64_t sub_1000054F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000054F8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1000054FC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100005504(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100005510(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000551C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for WalletDeepLinks()
{
  return &type metadata for WalletDeepLinks;
}

unint64_t sub_100005538(char a1)
{
  uint64_t v1;
  uint64_t v2;
  char v4;
  uint64_t v5;
  unint64_t v6;
  Swift::Int v7;
  _QWORD v9[9];

  v2 = v1;
  Hasher.init(_seed:)(v9, *(_QWORD *)(v2 + 40));
  v4 = a1 & 1;
  if ((a1 & 1) != 0)
    v5 = 0x64726143646461;
  else
    v5 = 1953460082;
  if ((a1 & 1) != 0)
    v6 = 0xE700000000000000;
  else
    v6 = 0xE400000000000000;
  String.hash(into:)(v9, v5, v6);
  swift_bridgeObjectRelease(v6);
  v7 = Hasher._finalize()();
  return sub_1000055C4(v4, v7);
}

unint64_t sub_1000055C4(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v11;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    if ((a1 & 1) != 0)
      v6 = 0x64726143646461;
    else
      v6 = 1953460082;
    if ((a1 & 1) != 0)
      v7 = 0xE700000000000000;
    else
      v7 = 0xE400000000000000;
    while (1)
    {
      v8 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v4) ? 0x64726143646461 : 1953460082;
      v9 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v4) ? 0xE700000000000000 : 0xE400000000000000;
      if (v8 == v6 && v9 == v7)
        break;
      v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease(v9);
      swift_bridgeObjectRelease(v7);
      if ((v11 & 1) == 0)
      {
        v4 = (v4 + 1) & v5;
        if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
          continue;
      }
      return v4;
    }
    swift_bridgeObjectRelease_n(v7, 2);
  }
  return v4;
}

unint64_t sub_1000056F8()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  char *v3;
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
  char *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v30;
  unint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  sub_100005B44(&qword_10000C0A0);
  __chkstk_darwin();
  v1 = (char *)&v24 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B44(&qword_10000C0A8);
  __chkstk_darwin();
  v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for LocalizedStringResource(0);
  v5 = *(_QWORD *)(v4 - 8);
  v33 = v4;
  __chkstk_darwin();
  v27 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100005B44(&qword_10000C0B0);
  v8 = sub_100005B44(&qword_10000C0B8);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = v8;
  v30 = v8;
  v34 = *(_QWORD *)(v9 + 72);
  v11 = *(unsigned __int8 *)(v9 + 80);
  v12 = (v11 + 32) & ~v11;
  v13 = swift_allocObject(v7, v12 + 2 * v34, v11 | 7);
  v35 = v13;
  *(_OWORD *)(v13 + 16) = xmmword_100006F00;
  v14 = v13 + v12;
  v28 = v13 + v12 + *(int *)(v10 + 48);
  *(_BYTE *)(v13 + v12) = 0;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000010, 0x8000000100007590);
  v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v32(v3, 1, 1, v4);
  v31 = 0x80000001000075B0;
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000012);
  v15 = type metadata accessor for DisplayRepresentation.Image(0);
  v29 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v29(v1, 0, 1, v15);
  v16 = sub_100005B44(&qword_10000C0C0);
  v17 = *(_QWORD *)(v5 + 72);
  v18 = *(unsigned __int8 *)(v5 + 80);
  v19 = (v18 + 32) & ~v18;
  v25 = v18 | 7;
  v26 = v16;
  v20 = swift_allocObject(v16, v19 + 8 * v17, v18 | 7);
  *(_OWORD *)(v20 + 16) = xmmword_100006F10;
  LocalizedStringResource.init(stringLiteral:)(0x20746E656D796150, 0xED00007364726143);
  LocalizedStringResource.init(stringLiteral:)(0x614320656C707041, 0xEA00000000006873);
  LocalizedStringResource.init(stringLiteral:)(0x614320656C707041, 0xEA00000000006472);
  LocalizedStringResource.init(stringLiteral:)(0x73676E69766153, 0xE700000000000000);
  LocalizedStringResource.init(stringLiteral:)(0x7469736E617254, 0xE700000000000000);
  LocalizedStringResource.init(stringLiteral:)(0x6574614C20796150, 0xE900000000000072);
  LocalizedStringResource.init(stringLiteral:)(0x746964657243, 0xE600000000000000);
  LocalizedStringResource.init(stringLiteral:)(0x7469626544, 0xE500000000000000);
  v21 = v27;
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v27, v3, v1, v20);
  *(_BYTE *)(v14 + v34) = 1;
  LocalizedStringResource.init(stringLiteral:)(0x6472614320646441, 0xE800000000000000);
  LocalizedStringResource.init(stringLiteral:)(0x100000000000001FLL, 0x80000001000075D0);
  v32(v3, 0, 1, v33);
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000012);
  v29(v1, 0, 1, v15);
  v22 = swift_allocObject(v26, v19 + v17, v25);
  *(_OWORD *)(v22 + 16) = xmmword_100006F20;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000012, 0x80000001000075F0);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v21, v3, v1, v22);
  return sub_100004854(v35);
}

uint64_t sub_100005B44(uint64_t *a1)
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

uint64_t sub_100005B84(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_100005B9C(uint64_t a1, uint64_t *a2)
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

unint64_t sub_100005BDC()
{
  unint64_t result;

  result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    result = swift_getWitnessTable(&unk_100006FDC, &type metadata for WalletDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

uint64_t sub_100005C20(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100005C34(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100005B44(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_100005C7C()
{
  unint64_t result;

  result = qword_10000C100;
  if (!qword_10000C100)
  {
    result = swift_getWitnessTable(&unk_100007340, &type metadata for OpenWalletDeepLinksIntent);
    atomic_store(result, (unint64_t *)&qword_10000C100);
  }
  return result;
}

uint64_t sub_100005CC0()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_100005B9C(v0, qword_10000C1B8);
  sub_100005B84(v0, (uint64_t)qword_10000C1B8);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000020, 0x80000001000076C0);
}

uint64_t sub_100005D20()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

_QWORD *sub_100005D50@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100005D88(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

void (*sub_100005DBC(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100005E04;
}

void sub_100005E04(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

unint64_t sub_100005E38()
{
  unint64_t result;

  result = qword_10000C108;
  if (!qword_10000C108)
  {
    result = swift_getWitnessTable(&unk_100007368, &type metadata for OpenWalletDeepLinksIntent);
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

unint64_t sub_100005E80()
{
  unint64_t result;

  result = qword_10000C110;
  if (!qword_10000C110)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Never, &type metadata for Never);
    atomic_store(result, (unint64_t *)&qword_10000C110);
  }
  return result;
}

uint64_t sub_100005EC4(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = sub_1000063F0();
  v5 = sub_100005BDC();
  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100005F1C()
{
  return 0xD000000000000015;
}

unint64_t sub_100005F40()
{
  unint64_t result;

  result = qword_10000C118;
  if (!qword_10000C118)
  {
    result = swift_getWitnessTable(&unk_1000073F8, &type metadata for OpenWalletDeepLinksIntent);
    atomic_store(result, (unint64_t *)&qword_10000C118);
  }
  return result;
}

unint64_t sub_100005F88()
{
  unint64_t result;

  result = qword_10000C120;
  if (!qword_10000C120)
  {
    result = swift_getWitnessTable(&unk_100007420, &type metadata for OpenWalletDeepLinksIntent);
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }
  return result;
}

uint64_t sub_100005FCC(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100005E38();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_10000600C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10000C010 != -1)
    swift_once(&qword_10000C010, sub_100005CC0);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_100005B84(v2, (uint64_t)qword_10000C1B8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000607C()
{
  return 0;
}

uint64_t sub_100006088()
{
  return 1;
}

uint64_t sub_100006098(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _URLRepresentableIntent<>.perform()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_1000063F0();
  v7 = sub_100006434();
  v8 = sub_100005BDC();
  *v5 = v2;
  v5[1] = sub_100006124;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100006124()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v5 = *v1;
  v2 = *(_QWORD *)(v5 + 16);
  v3 = *v1;
  v5 = v3;
  result = swift_task_dealloc(v2);
  if (v0)
    return (*(uint64_t (**)(void))(v3 + 8))();
  return result;
}

uint64_t sub_100006180@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1000061DC();
  *a1 = result;
  return result;
}

uint64_t sub_1000061A4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100005E38();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenWalletDeepLinksIntent()
{
  return &type metadata for OpenWalletDeepLinksIntent;
}

uint64_t sub_1000061DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  void (*v17)(_BYTE *, uint64_t, uint64_t, uint64_t);
  unint64_t v18;
  _BYTE v20[15];
  char v21;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v1 = *(_QWORD *)(v0 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v3 = &v20[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100005B44(&qword_10000C130);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  v8 = &v20[-v7];
  v9 = sub_100005B44(&qword_10000C0A8);
  __chkstk_darwin(v9);
  v11 = &v20[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = &v20[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100005B44(&qword_10000C138);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001BLL, 0x80000001000076A0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v21 = 2;
  v16 = type metadata accessor for IntentDialog(0);
  v17 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v17(v8, 1, 1, v16);
  v17(v6, 1, 1, v16);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  v18 = sub_100004DC4();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v15, v11, &v21, v8, v6, v3, &off_100008388, v18);
}

unint64_t sub_1000063F0()
{
  unint64_t result;

  result = qword_10000C140;
  if (!qword_10000C140)
  {
    result = swift_getWitnessTable(&unk_100007270, &type metadata for OpenWalletDeepLinksIntent);
    atomic_store(result, (unint64_t *)&qword_10000C140);
  }
  return result;
}

unint64_t sub_100006434()
{
  unint64_t result;

  result = qword_10000C148;
  if (!qword_10000C148)
  {
    result = swift_getWitnessTable(&unk_1000072C0, &type metadata for OpenWalletDeepLinksIntent);
    atomic_store(result, (unint64_t *)&qword_10000C148);
  }
  return result;
}

uint64_t sub_100006478()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v0 = sub_100005B44(&qword_10000C168);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100005E38();
  _AssistantIntent.Phrase.init(stringLiteral:)(0xD000000000000020, 0x8000000100007710, &type metadata for OpenWalletDeepLinksIntent, v4);
  v5 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenWalletDeepLinksIntent, v4);
  v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  _AssistantIntent.Phrase.init(stringLiteral:)(0xD000000000000012, 0x8000000100007740, &type metadata for OpenWalletDeepLinksIntent, v4);
  v7 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenWalletDeepLinksIntent, v4);
  v6(v3, v0);
  _AssistantIntent.Phrase.init(stringLiteral:)(0xD000000000000012, 0x8000000100007760, &type metadata for OpenWalletDeepLinksIntent, v4);
  v8 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenWalletDeepLinksIntent, v4);
  v6(v3, v0);
  _AssistantIntent.Phrase.init(stringLiteral:)(0xD000000000000018, 0x8000000100007780, &type metadata for OpenWalletDeepLinksIntent, v4);
  v9 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenWalletDeepLinksIntent, v4);
  v6(v3, v0);
  _AssistantIntent.Phrase.init(stringLiteral:)(0xD000000000000022, 0x80000001000077A0, &type metadata for OpenWalletDeepLinksIntent, v4);
  v10 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenWalletDeepLinksIntent, v4);
  v6(v3, v0);
  v11 = sub_100005B44(&qword_10000C170);
  v12 = swift_allocObject(v11, 72, 7);
  *(_OWORD *)(v12 + 16) = xmmword_100007460;
  *(_QWORD *)(v12 + 32) = v5;
  *(_QWORD *)(v12 + 40) = v7;
  *(_QWORD *)(v12 + 48) = v8;
  *(_QWORD *)(v12 + 56) = v9;
  *(_QWORD *)(v12 + 64) = v10;
  v13 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v12);
  return v13;
}

uint64_t sub_1000066B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t KeyPath;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v0 = type metadata accessor for _AssistantIntent.Value(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_1000074E0);
  v5 = sub_100005084();
  v6 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v5);
  swift_release(KeyPath);
  v7 = sub_100005E38();
  _AssistantIntent.Value.init<A>(for:builder:)(v6, sub_1000067C8, 0, v7);
  v8 = static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)(v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v9 = sub_100005B44(&qword_10000C158);
  v10 = swift_allocObject(v9, 40, 7);
  *(_OWORD *)(v10 + 16) = xmmword_100006F20;
  *(_QWORD *)(v10 + 32) = v8;
  v11 = static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v10);
  return v11;
}

uint64_t sub_1000067C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x74656C6C6157, 0xE600000000000000);
  v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x615020656C707041, 0xE900000000000079);
  v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6472614320646441, 0xE800000000000000);
  v3 = sub_100005B44(&qword_10000C160);
  v4 = swift_allocObject(v3, 56, 7);
  *(_OWORD *)(v4 + 16) = xmmword_100007470;
  *(_QWORD *)(v4 + 32) = v0;
  *(_QWORD *)(v4 + 40) = v1;
  *(_QWORD *)(v4 + 48) = v2;
  v5 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v4);
  return v5;
}

void sub_100006880()
{
  qword_10000C1D0 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_100006894()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v0 = type metadata accessor for _AssistantIntent(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000061DC();
  v4 = sub_100005E38();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v11, sub_100006478, 0, sub_1000066B8, 0, &type metadata for OpenWalletDeepLinksIntent, v4);
  v5 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v6 = sub_100005B44(&qword_10000C150);
  v7 = swift_allocObject(v6, 40, 7);
  *(_OWORD *)(v7 + 16) = xmmword_100006F20;
  *(_QWORD *)(v7 + 32) = v5;
  v8 = static _AssistantIntent.Builder.buildBlock(_:)();
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_100006990()
{
  if (qword_10000C018 != -1)
    swift_once(&qword_10000C018, sub_100006880);
  return swift_bridgeObjectRetain(qword_10000C1D0);
}

ValueMetadata *type metadata accessor for PassbookAssistantIntents()
{
  return &type metadata for PassbookAssistantIntents;
}

_QWORD *sub_1000069E0@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100006A18(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

uint64_t sub_100006A4C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100006B64();
  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100006ADC();
  static AppExtension.main()();
  return 0;
}

unint64_t sub_100006ADC()
{
  unint64_t result;

  result = qword_10000C178;
  if (!qword_10000C178)
  {
    result = swift_getWitnessTable(&unk_100007538, &type metadata for PassbookSettingsIntentExtension);
    atomic_store(result, (unint64_t *)&qword_10000C178);
  }
  return result;
}

uint64_t sub_100006B24(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100006B64();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of AppIntentsExtension.configuration>>, 1);
}

unint64_t sub_100006B64()
{
  unint64_t result;

  result = qword_10000C180;
  if (!qword_10000C180)
  {
    result = swift_getWitnessTable(&unk_100007510, &type metadata for PassbookSettingsIntentExtension);
    atomic_store(result, (unint64_t *)&qword_10000C180);
  }
  return result;
}

ValueMetadata *type metadata accessor for PassbookSettingsIntentExtension()
{
  return &type metadata for PassbookSettingsIntentExtension;
}
