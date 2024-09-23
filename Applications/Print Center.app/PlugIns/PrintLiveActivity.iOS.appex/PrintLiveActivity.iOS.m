uint64_t initializeBufferWithCopyOfBuffer for PrintActivityAttributes.ContentState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for PrintActivityAttributes.ContentState(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 40));
}

uint64_t initializeWithCopy for PrintActivityAttributes.ContentState(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_bridgeObjectRetain(v4);
  return a1;
}

_QWORD *assignWithCopy for PrintActivityAttributes.ContentState(_QWORD *a1, _QWORD *a2)
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
  a1[3] = a2[3];
  a1[4] = a2[4];
  v6 = a2[5];
  v7 = a1[5];
  a1[5] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

__n128 initializeWithTake for PrintActivityAttributes.ContentState(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PrintActivityAttributes.ContentState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease(v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintActivityAttributes.ContentState(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PrintActivityAttributes.ContentState(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PrintActivityAttributes.ContentState()
{
  return &type metadata for PrintActivityAttributes.ContentState;
}

ValueMetadata *type metadata accessor for PrintActivityAttributes()
{
  return &type metadata for PrintActivityAttributes;
}

BOOL sub_1000029C8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000029DC()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100002A20()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100002A48(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100002A88()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_100002AB8 + 4 * byte_100006C60[*v0]))(0x656C746954626F6ALL, 0xE800000000000000);
}

uint64_t sub_100002AB8()
{
  return 0x73656761506D756ELL;
}

uint64_t sub_100002ACC()
{
  return 0x50746E6572727563;
}

uint64_t sub_100002AEC()
{
  return 0x617453726F727265;
}

uint64_t sub_100002B0C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10000334C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100002B30()
{
  return 0;
}

void sub_100002B3C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_100002B48(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000037A0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100002B70(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000037A0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100002B98(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  char v23;

  v3 = v1;
  v5 = sub_10000373C(&qword_10000C100);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_10000377C(a1, v9);
  v11 = sub_1000037A0();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for PrintActivityAttributes.ContentState.CodingKeys, &type metadata for PrintActivityAttributes.ContentState.CodingKeys, v11, v9, v10);
  v12 = *v3;
  v13 = v3[1];
  v23 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, &v23, v5);
  if (!v2)
  {
    v14 = v3[2];
    v22 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, &v22, v5);
    v15 = v3[3];
    v21 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v15, &v21, v5);
    v16 = v3[4];
    v17 = v3[5];
    v20 = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v16, v17, &v20, v5);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

double sub_100002CFC@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;

  sub_100003534(a1, (uint64_t *)v6);
  if (!v2)
  {
    v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_100002D3C(_QWORD *a1)
{
  return sub_100002B98(a1);
}

Swift::Int sub_100002D50()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  Swift::UInt v3;
  Swift::UInt v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[9];

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  v5 = v0[4];
  v6 = v0[5];
  Hasher.init(_seed:)(v8, 0);
  swift_bridgeObjectRetain(v2);
  String.hash(into:)(v8, v1, v2);
  swift_bridgeObjectRelease(v2);
  Hasher._combine(_:)(v3);
  Hasher._combine(_:)(v4);
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(v8, v5, v6);
  swift_bridgeObjectRelease(v6);
  return Hasher._finalize()();
}

uint64_t sub_100002E00(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  Swift::UInt v5;
  Swift::UInt v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *v1;
  v4 = v1[1];
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(a1, v3, v4);
  swift_bridgeObjectRelease(v4);
  Hasher._combine(_:)(v5);
  Hasher._combine(_:)(v6);
  swift_bridgeObjectRetain(v8);
  String.hash(into:)(a1, v7, v8);
  return swift_bridgeObjectRelease(v8);
}

Swift::Int sub_100002E90(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  Swift::UInt v4;
  Swift::UInt v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[9];

  v2 = *v1;
  v3 = v1[1];
  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  Hasher.init(_seed:)(v9, a1);
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v9, v2, v3);
  swift_bridgeObjectRelease(v3);
  Hasher._combine(_:)(v4);
  Hasher._combine(_:)(v5);
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v9, v6, v7);
  swift_bridgeObjectRelease(v7);
  return Hasher._finalize()();
}

uint64_t sub_100002F3C(_OWORD *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[3];
  _OWORD v8[3];

  v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  v3 = *a2;
  v4 = a2[1];
  v7[2] = a1[2];
  v8[0] = v3;
  v5 = a2[2];
  v8[1] = v4;
  v8[2] = v5;
  return sub_1000032AC(v7, v8) & 1;
}

uint64_t sub_100002F80()
{
  return 0;
}

uint64_t sub_100002F8C@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease(a1);
  *a2 = 1;
  return result;
}

void sub_100002FB8(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100002FC4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100003804();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100002FEC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100003804();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100003014(_QWORD *a1)
{
  return sub_1000037E4(a1);
}

uint64_t sub_100003038(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v2 = sub_10000373C(&qword_10000C108);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1[3];
  v7 = a1[4];
  sub_10000377C(a1, v6);
  v8 = sub_100003804();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for PrintActivityAttributes.CodingKeys, &type metadata for PrintActivityAttributes.CodingKeys, v8, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_100003100()
{
  unint64_t result;

  result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    result = swift_getWitnessTable(&unk_100006D08, &type metadata for PrintActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

unint64_t sub_100003148()
{
  unint64_t result;

  result = qword_10000C0C8;
  if (!qword_10000C0C8)
  {
    result = swift_getWitnessTable(&unk_100006CE0, &type metadata for PrintActivityAttributes);
    atomic_store(result, (unint64_t *)&qword_10000C0C8);
  }
  return result;
}

unint64_t sub_100003190()
{
  unint64_t result;

  result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    result = swift_getWitnessTable(&unk_100006CB8, &type metadata for PrintActivityAttributes);
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

unint64_t sub_1000031D8()
{
  unint64_t result;

  result = qword_10000C0D8;
  if (!qword_10000C0D8)
  {
    result = swift_getWitnessTable(&unk_100006D98, &type metadata for PrintActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_10000C0D8);
  }
  return result;
}

unint64_t sub_100003220()
{
  unint64_t result;

  result = qword_10000C0E0;
  if (!qword_10000C0E0)
  {
    result = swift_getWitnessTable(&unk_100006D70, &type metadata for PrintActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_10000C0E0);
  }
  return result;
}

unint64_t sub_100003268()
{
  unint64_t result;

  result = qword_10000C0E8;
  if (!qword_10000C0E8)
  {
    result = swift_getWitnessTable(&unk_100006D30, &type metadata for PrintActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_10000C0E8);
  }
  return result;
}

uint64_t sub_1000032AC(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  char v5;
  uint64_t result;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v5 & 1) != 0))
  {
    if (a1[2] == a2[2] && a1[3] == a2[3])
    {
      if (a1[4] == a2[4] && a1[5] == a2[5])
        return 1;
      else
        return _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000334C(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  char v9;

  if (a1 == 0x656C746954626F6ALL && a2 == 0xE800000000000000)
  {
    v5 = 0xE800000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x656C746954626F6ALL, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x73656761506D756ELL && a2 == 0xE800000000000000)
  {
    v7 = 0xE800000000000000;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x73656761506D756ELL, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x50746E6572727563 && a2 == 0xEB00000000656761)
  {
    v8 = 0xEB00000000656761;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x50746E6572727563, 0xEB00000000656761, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_20;
  }
  if (a1 == 0x617453726F727265 && a2 == 0xEB00000000737574)
  {
    swift_bridgeObjectRelease(0xEB00000000737574);
    return 3;
  }
  else
  {
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x617453726F727265, 0xEB00000000737574, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v9 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_100003534@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  char v26;
  char v27;

  v5 = sub_10000373C(&qword_10000C0F0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_10000377C(a1, v9);
  v11 = sub_1000037A0();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for PrintActivityAttributes.ContentState.CodingKeys, &type metadata for PrintActivityAttributes.ContentState.CodingKeys, v11, v9, v10);
  if (v2)
    return sub_1000037E4(a1);
  v27 = 0;
  v12 = KeyedDecodingContainer.decode(_:forKey:)(&v27, v5);
  v14 = v13;
  v26 = 1;
  swift_bridgeObjectRetain(v13);
  v23 = KeyedDecodingContainer.decode(_:forKey:)(&v26, v5);
  v25 = 2;
  v22 = KeyedDecodingContainer.decode(_:forKey:)(&v25, v5);
  v24 = 3;
  v15 = KeyedDecodingContainer.decode(_:forKey:)(&v24, v5);
  v17 = v16;
  v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  v19 = v15;
  v18(v8, v5);
  swift_bridgeObjectRetain(v17);
  sub_1000037E4(a1);
  swift_bridgeObjectRelease(v17);
  result = swift_bridgeObjectRelease(v14);
  *a2 = v12;
  a2[1] = v14;
  v21 = v22;
  a2[2] = v23;
  a2[3] = v21;
  a2[4] = v19;
  a2[5] = v17;
  return result;
}

uint64_t sub_10000373C(uint64_t *a1)
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

_QWORD *sub_10000377C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1000037A0()
{
  unint64_t result;

  result = qword_10000C0F8;
  if (!qword_10000C0F8)
  {
    result = swift_getWitnessTable(&unk_100006F74, &type metadata for PrintActivityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10000C0F8);
  }
  return result;
}

uint64_t sub_1000037E4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_100003804()
{
  unint64_t result;

  result = qword_10000C110;
  if (!qword_10000C110)
  {
    result = swift_getWitnessTable(&unk_100006F24, &type metadata for PrintActivityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10000C110);
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintActivityAttributes.CodingKeys()
{
  return &type metadata for PrintActivityAttributes.CodingKeys;
}

_BYTE *initializeBufferWithCopyOfBuffer for PrintActivityAttributes.ContentState.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PrintActivityAttributes.ContentState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PrintActivityAttributes.ContentState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100003944 + 4 * byte_100006C69[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100003978 + 4 * byte_100006C64[v4]))();
}

uint64_t sub_100003978(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100003980(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100003988);
  return result;
}

uint64_t sub_100003994(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000399CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1000039A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000039A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000039B4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1000039C0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PrintActivityAttributes.ContentState.CodingKeys()
{
  return &type metadata for PrintActivityAttributes.ContentState.CodingKeys;
}

unint64_t sub_1000039DC()
{
  unint64_t result;

  result = qword_10000C118;
  if (!qword_10000C118)
  {
    result = swift_getWitnessTable(&unk_100006EAC, &type metadata for PrintActivityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10000C118);
  }
  return result;
}

unint64_t sub_100003A24()
{
  unint64_t result;

  result = qword_10000C120;
  if (!qword_10000C120)
  {
    result = swift_getWitnessTable(&unk_100006ED4, &type metadata for PrintActivityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }
  return result;
}

unint64_t sub_100003A6C()
{
  unint64_t result;

  result = qword_10000C128;
  if (!qword_10000C128)
  {
    result = swift_getWitnessTable(&unk_100006EFC, &type metadata for PrintActivityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10000C128);
  }
  return result;
}

unint64_t sub_100003AB4()
{
  unint64_t result;

  result = qword_10000C130;
  if (!qword_10000C130)
  {
    result = swift_getWitnessTable(&unk_100006E1C, &type metadata for PrintActivityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10000C130);
  }
  return result;
}

unint64_t sub_100003AFC()
{
  unint64_t result;

  result = qword_10000C138;
  if (!qword_10000C138)
  {
    result = swift_getWitnessTable(&unk_100006E44, &type metadata for PrintActivityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10000C138);
  }
  return result;
}

uint64_t sub_100003B40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v38[12];
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;
  unsigned __int8 v50;
  uint64_t v51;
  unsigned __int8 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unsigned __int8 v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;

  v48 = a1;
  v3 = sub_10000373C(&qword_10000C220);
  v4 = __chkstk_darwin(v3);
  v47 = &v38[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  v7 = &v38[-v6];
  v8 = sub_10000373C(&qword_10000C1F0);
  __chkstk_darwin(v8);
  v10 = &v38[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = type metadata accessor for Image.ResizingMode(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = &v38[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = Image.init(systemName:)(0x2E7265746E697270, 0xEC0000006C6C6966);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v12 + 104))(v14, enum case for Image.ResizingMode.stretch(_:), v11);
  v16 = Image.resizable(capInsets:resizingMode:)(v14, v15, 0.0, 0.0, 0.0, 0.0);
  swift_release(v15);
  (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v14, v11);
  v17 = enum case for Image.TemplateRenderingMode.template(_:);
  v18 = type metadata accessor for Image.TemplateRenderingMode(0);
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v19 + 104))(v10, v17, v18);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  v20 = Image.renderingMode(_:)(v10, v16);
  swift_release(v16);
  v21 = sub_10000670C((uint64_t)v10, &qword_10000C1F0);
  v22 = static Alignment.center.getter(v21);
  v24 = _FrameLayout.init(width:height:alignment:)(&v49, 0x4044000000000000, 0, 0x4044000000000000, 0, v22, v23);
  v46 = v49;
  v45 = v50;
  v44 = v51;
  v43 = v52;
  v41 = v54;
  v42 = v53;
  v25 = static Alignment.center.getter(v24);
  v27 = _FrameLayout.init(width:height:alignment:)(&v55, 0x4028000000000000, 0, 0, 1, v25, v26);
  v40 = v55;
  v39 = v56;
  v28 = v57;
  v29 = v58;
  v30 = v59;
  v31 = v60;
  *(_QWORD *)v7 = static HorizontalAlignment.leading.getter(v27);
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  v32 = sub_10000373C(&qword_10000C228);
  sub_100003ED4(v48, &v7[*(int *)(v32 + 44)]);
  v33 = v47;
  sub_1000066C8((uint64_t)v7, (uint64_t)v47, &qword_10000C220);
  *(_QWORD *)a2 = v20;
  *(_QWORD *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  *(_QWORD *)(a2 + 24) = v46;
  *(_BYTE *)(a2 + 32) = v45;
  *(_QWORD *)(a2 + 40) = v44;
  *(_BYTE *)(a2 + 48) = v43;
  v34 = v41;
  *(_QWORD *)(a2 + 56) = v42;
  *(_QWORD *)(a2 + 64) = v34;
  *(_QWORD *)(a2 + 72) = 0x4028000000000000;
  *(_BYTE *)(a2 + 80) = 0;
  *(_QWORD *)(a2 + 88) = v40;
  *(_BYTE *)(a2 + 96) = v39;
  *(_QWORD *)(a2 + 104) = v28;
  *(_BYTE *)(a2 + 112) = v29;
  *(_QWORD *)(a2 + 120) = v30;
  *(_QWORD *)(a2 + 128) = v31;
  v35 = sub_10000373C(&qword_10000C230);
  sub_1000066C8((uint64_t)v33, a2 + *(int *)(v35 + 64), &qword_10000C220);
  v36 = a2 + *(int *)(v35 + 80);
  *(_QWORD *)v36 = 0;
  *(_BYTE *)(v36 + 8) = 1;
  swift_retain(v20);
  sub_10000670C((uint64_t)v7, &qword_10000C220);
  sub_10000670C((uint64_t)v33, &qword_10000C220);
  return swift_release(v20);
}

uint64_t sub_100003ED4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
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
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  uint64_t v52;
  char *v53;
  char *v54;
  void (*v55)(char *, uint64_t);
  _QWORD v57[2];
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;

  v58 = a2;
  v61 = sub_10000373C(&qword_10000C238);
  v59 = *(_QWORD *)(v61 - 8);
  v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v60 = (char *)v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v6 = (char *)v57 - v5;
  v7 = *(_OWORD *)(a1 + 24);
  v71 = *(_OWORD *)(a1 + 8);
  v72 = v7;
  v73 = *(_OWORD *)(a1 + 40);
  v74 = *(_QWORD *)(a1 + 56);
  v8 = *(_OWORD *)(a1 + 24);
  v62 = *(_OWORD *)(a1 + 8);
  v63 = v8;
  v64 = *(_OWORD *)(a1 + 40);
  v65 = *(_QWORD *)(a1 + 56);
  v57[0] = sub_10000373C(&qword_10000C240);
  State.wrappedValue.getter(&v66);
  v9 = v66;
  v10 = v67;
  swift_bridgeObjectRelease(v70);
  *(_QWORD *)&v62 = v9;
  *((_QWORD *)&v62 + 1) = v10;
  v57[1] = sub_100005EBC();
  v11 = Text.init<A>(_:)(&v62, &type metadata for String);
  v13 = v12;
  v15 = v14;
  v17 = v16 & 1;
  v18 = static Font.headline.getter();
  v19 = Text.font(_:)(v18, v11, v13, v17, v15);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  swift_release(v18);
  v26 = v17;
  v27 = v6;
  sub_100005F00(v11, v13, v26);
  swift_bridgeObjectRelease(v15);
  *(_QWORD *)&v62 = v19;
  *((_QWORD *)&v62 + 1) = v21;
  LOBYTE(v63) = v23 & 1;
  *((_QWORD *)&v63 + 1) = v25;
  View.privacySensitive(_:)(1, &type metadata for Text, &protocol witness table for Text);
  sub_100005F00(v19, v21, v23 & 1);
  swift_bridgeObjectRelease(v25);
  v62 = v71;
  v63 = v72;
  v64 = v73;
  v65 = v74;
  State.wrappedValue.getter(&v66);
  swift_bridgeObjectRelease(v67);
  v28 = v68;
  swift_bridgeObjectRelease(v70);
  v62 = v71;
  v63 = v72;
  v64 = v73;
  v65 = v74;
  State.wrappedValue.getter(&v66);
  swift_bridgeObjectRelease(v67);
  v29 = v69;
  swift_bridgeObjectRelease(v70);
  v30 = sub_100005CD0(v28, v29, &qword_10000C0A8, &qword_10000CB90, (uint64_t *)&qword_10000CB98, (uint64_t)sub_100005410);
  if (v31)
  {
    v32 = v30;
    v33 = v31;
  }
  else
  {
    if (qword_10000C0B8 != -1)
      swift_once(&qword_10000C0B8, sub_100005518);
    v32 = xmmword_10000CBB0;
    v33 = swift_bridgeObjectRetain(*((_QWORD *)&xmmword_10000CBB0 + 1));
  }
  *(_QWORD *)&v62 = v32;
  *((_QWORD *)&v62 + 1) = v33;
  v34 = Text.init<A>(_:)(&v62, &type metadata for String);
  v36 = v35;
  v38 = v37;
  v40 = v39 & 1;
  v41 = static Font.callout.getter();
  v42 = Text.font(_:)(v41, v34, v36, v40, v38);
  v44 = v43;
  v46 = v45;
  v48 = v47;
  swift_release(v41);
  LOBYTE(v41) = v46 & 1;
  sub_100005F00(v34, v36, v40);
  swift_bridgeObjectRelease(v38);
  v49 = v59;
  v50 = *(void (**)(char *, char *, uint64_t))(v59 + 16);
  v51 = v60;
  v52 = v61;
  v50(v60, v27, v61);
  v53 = v58;
  v50(v58, v51, v52);
  v54 = &v53[*(int *)(sub_10000373C(&qword_10000C248) + 48)];
  *(_QWORD *)v54 = v42;
  *((_QWORD *)v54 + 1) = v44;
  v54[16] = v41;
  *((_QWORD *)v54 + 3) = v48;
  sub_10000609C(v42, v44, v41);
  v55 = *(void (**)(char *, uint64_t))(v49 + 8);
  swift_bridgeObjectRetain(v48);
  v55(v27, v52);
  sub_100005F00(v42, v44, v41);
  swift_bridgeObjectRelease(v48);
  return ((uint64_t (*)(char *, uint64_t))v55)(v51, v52);
}

uint64_t sub_1000042D8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000042F0@<X0>(uint64_t a1@<X8>)
{
  _OWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD v21[4];

  v3 = sub_10000373C(&qword_10000C208);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v1[1];
  v21[0] = *v1;
  v21[1] = v7;
  v8 = v1[3];
  v21[2] = v1[2];
  v21[3] = v8;
  *(_QWORD *)v6 = static VerticalAlignment.center.getter(v4);
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v9 = sub_10000373C(&qword_10000C210);
  v10 = sub_100003B40((uint64_t)v21, (uint64_t)&v6[*(int *)(v9 + 44)]);
  v11 = static Edge.Set.all.getter(v10);
  v12 = EdgeInsets.init(_all:)(16.0);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  sub_1000066C8((uint64_t)v6, a1, &qword_10000C208);
  v19 = a1 + *(int *)(sub_10000373C(&qword_10000C218) + 36);
  *(_BYTE *)v19 = v11;
  *(double *)(v19 + 8) = v12;
  *(_QWORD *)(v19 + 16) = v14;
  *(_QWORD *)(v19 + 24) = v16;
  *(_QWORD *)(v19 + 32) = v18;
  *(_BYTE *)(v19 + 40) = 0;
  return sub_10000670C((uint64_t)v6, &qword_10000C208);
}

__n128 sub_100004404@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __n128 result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[2];
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];
  __int128 v18;
  __n128 v19;
  uint64_t v20;
  _OWORD v21[2];
  uint64_t v22;
  uint64_t v23;

  v2 = sub_10000373C(&qword_10000C158);
  ActivityViewContext.attributes.getter();
  v3 = ActivityViewContext.state.getter(v21, v2);
  v12 = v21[1];
  v13 = v21[0];
  v4 = v22;
  v5 = v23;
  State.init(wrappedValue:)(v17, v3, &type metadata for PrintActivityAttributes);
  v6 = v17[0];
  v14[0] = v13;
  v14[1] = v12;
  v15 = v4;
  v16 = v5;
  State.init(wrappedValue:)(v17, v14, &type metadata for PrintActivityAttributes.ContentState);
  v7 = v17[0];
  v8 = v17[1];
  v9 = v20;
  result = v19;
  v11 = v18;
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = v8;
  *(_OWORD *)(a1 + 24) = v11;
  *(__n128 *)(a1 + 40) = result;
  *(_QWORD *)(a1 + 56) = v9;
  return result;
}

uint64_t sub_1000044C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, char *, uint64_t);
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;

  v36 = a1;
  v37 = a4;
  v39 = a5;
  v8 = sub_10000373C(&qword_10000C158);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = __chkstk_darwin(v8);
  v38 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v34 - v12;
  v35 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v35((char *)&v34 - v12, a1, v8);
  v14 = *(unsigned __int8 *)(v9 + 80);
  v15 = (v14 + 40) & ~v14;
  v34 = v14 | 7;
  v16 = (_QWORD *)swift_allocObject(&unk_100008830, v15 + v10, v14 | 7);
  v16[2] = a2;
  v16[3] = a3;
  v17 = a2;
  v18 = a3;
  v19 = v37;
  v16[4] = v37;
  v20 = (char *)v16 + v15;
  v21 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v21(v20, v13, v8);
  v22 = (_QWORD *)swift_allocObject(&unk_100008858, 40, 7);
  v23 = v17;
  v22[2] = v17;
  v22[3] = v18;
  v24 = v18;
  v22[4] = v19;
  v25 = v38;
  v35(v38, v36, v8);
  v26 = (v14 + 16) & ~v14;
  v27 = swift_allocObject(&unk_100008880, v26 + v10, v34);
  v21((char *)(v27 + v26), v25, v8);
  v28 = (_QWORD *)swift_allocObject(&unk_1000088A8, 40, 7);
  v28[2] = v23;
  v28[3] = v24;
  v28[4] = v19;
  swift_bridgeObjectRetain_n(v24, 3);
  swift_retain_n(v19, 3);
  v29 = sub_10000373C(&qword_10000C160);
  v30 = sub_10000373C(&qword_10000C168);
  v31 = sub_1000067D0(&qword_10000C170, &qword_10000C160, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  v32 = sub_100005A9C();
  return DynamicIsland.init<A, B, C, D>(expanded:compactLeading:compactTrailing:minimal:)(sub_100005920, v16, sub_10000596C, v22, sub_1000059D4, v27, sub_10000596C, v28, v29, v30, &type metadata for Text, v30, v31, v32, &protocol witness table for Text, v32);
}

uint64_t sub_100004724@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t OpaqueTypeConformance2;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38[16];
  char *v39;
  char *v40;
  char v41[16];
  char *v42;
  char v43[16];
  uint64_t v44;
  char v45[16];
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;

  v36 = a5;
  v37 = sub_10000373C(&qword_10000C198);
  v35 = *(_QWORD *)(v37 - 8);
  __chkstk_darwin(v37);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_10000373C(&qword_10000C1A0);
  v33 = *(_QWORD *)(v34 - 8);
  __chkstk_darwin(v34);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DynamicIslandExpandedRegionPosition(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_10000373C(&qword_10000C1A8);
  v16 = *(_QWORD *)(v32 - 8);
  v17 = __chkstk_darwin(v32);
  v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DynamicIslandExpandedRegionPosition.leading.getter(v17);
  v46 = a1;
  v47 = a2;
  v48 = a3;
  v20 = sub_10000373C(&qword_10000C1B0);
  v21 = sub_100005F60();
  v22 = DynamicIslandExpandedRegion.init(_:priority:content:)(v15, sub_100005F54, v45, v20, v21, 0.0);
  static DynamicIslandExpandedRegionPosition.trailing.getter(v22);
  v44 = a4;
  v23 = sub_10000373C(&qword_10000C1C0);
  v24 = sub_100005A58(&qword_10000C1C8);
  v25 = sub_1000067D0(&qword_10000C1D0, &qword_10000C1C8, (uint64_t)&protocol conformance descriptor for HStack<A>);
  v49 = v24;
  v50 = v25;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v49, &opaque type descriptor for <<opaque return type of View.dynamicIsland(verticalPlacement:)>>, 1);
  DynamicIslandExpandedRegion.init(_:priority:content:)(v15, sub_100005FCC, v43, v23, OpaqueTypeConformance2, 100.0);
  v42 = v19;
  v27 = sub_10000373C(&qword_10000C1D8);
  v49 = v20;
  v50 = v21;
  v28 = swift_getOpaqueTypeConformance2(&v49, &opaque type descriptor for <<opaque return type of DynamicIslandExpandedRegion._viewRepresentation>>, 1);
  DynamicIslandExpandedContent.init(content:)(sub_100005FD4, v41, v27, v28);
  v39 = v10;
  v40 = v12;
  v29 = sub_10000373C(&qword_10000C160);
  v30 = sub_1000067D0(&qword_10000C170, &qword_10000C160, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  DynamicIslandExpandedContent.init(content:)(sub_100006008, v38, v29, v30);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v37);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v12, v34);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v19, v32);
}

double sub_100004A28@<D0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  double result;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  __int128 v16;

  v4 = swift_retain(a1);
  v5 = static Alignment.center.getter(v4);
  _FrameLayout.init(width:height:alignment:)(&v12, 0x404E000000000000, 0, 0x404E000000000000, 0, v5, v6);
  v7 = v12;
  v8 = v13;
  v9 = v14;
  v10 = v15;
  *(_QWORD *)a2 = a1;
  *(_QWORD *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  *(_QWORD *)(a2 + 24) = v7;
  *(_BYTE *)(a2 + 32) = v8;
  *(_QWORD *)(a2 + 40) = v9;
  *(_BYTE *)(a2 + 48) = v10;
  result = *(double *)&v16;
  *(_OWORD *)(a2 + 56) = v16;
  return result;
}

uint64_t sub_100004AB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
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
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  _OWORD v38[9];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50;
  char v51;
  char v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[32];
  __int128 v57;
  _OWORD v58[2];
  char v59;
  char v60;
  char v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _OWORD v68[2];
  _QWORD v69[2];
  char v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  unsigned __int128 v75;
  char v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  char v82;
  _BYTE v83[135];
  char v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;

  v36 = a1;
  v1 = type metadata accessor for DynamicIslandExpandedRegionVerticalPlacement(0);
  v34 = *(_QWORD *)(v1 - 8);
  v35 = v1;
  v2 = __chkstk_darwin(v1);
  v33 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = static VerticalAlignment.center.getter(v2);
  v27 = static HorizontalAlignment.trailing.getter();
  v4 = sub_100004E30((uint64_t)&v85);
  v5 = *((_QWORD *)&v85 + 1);
  v6 = v86;
  v7 = *((_QWORD *)&v86 + 1);
  v9 = *((_QWORD *)&v87 + 1);
  v8 = v87;
  v10 = v88;
  v25 = *((_QWORD *)&v88 + 1);
  v26 = v85;
  v23 = *((_QWORD *)&v89 + 1);
  v24 = v89;
  v11 = v90;
  v22 = *((_QWORD *)&v90 + 1);
  HIDWORD(v21) = v91;
  v52 = 0;
  v51 = v86;
  v50 = v88;
  v49 = v90;
  v12 = static Alignment.center.getter(v4);
  _FrameLayout.init(width:height:alignment:)(&v43, 0x4028000000000000, 0, 0, 1, v12, v13);
  v30 = v45;
  v31 = v43;
  v28 = v48;
  v29 = v47;
  *(_QWORD *)&v53 = v27;
  *((_QWORD *)&v53 + 1) = 0xC000000000000000;
  LOBYTE(v54) = 0;
  *((_QWORD *)&v54 + 1) = v26;
  *(_QWORD *)&v55 = v5;
  BYTE8(v55) = v6;
  *(_QWORD *)v56 = v7;
  *(_OWORD *)&v56[8] = __PAIR128__(v9, v8);
  v14 = v8;
  v56[24] = v10;
  *(_QWORD *)&v57 = v25;
  *((_QWORD *)&v57 + 1) = v24;
  *(_QWORD *)&v58[0] = v23;
  BYTE8(v58[0]) = v11;
  *(_QWORD *)&v58[1] = v22;
  BYTE8(v58[1]) = BYTE4(v21);
  v66 = *(_OWORD *)&v56[16];
  v67 = v57;
  v68[0] = v58[0];
  v64 = v55;
  v65 = *(_OWORD *)v56;
  v62 = v53;
  v63 = v54;
  *(_OWORD *)((char *)v68 + 9) = *(_OWORD *)((char *)v58 + 9);
  v61 = 0;
  v60 = v44;
  v15 = v44;
  v59 = v46;
  LOBYTE(v8) = v46;
  v69[0] = v27;
  v69[1] = 0xC000000000000000;
  v70 = 0;
  v71 = v26;
  v72 = v5;
  v73 = v6;
  v74 = v7;
  v75 = __PAIR128__(v9, v14);
  v76 = v10;
  v77 = v25;
  v78 = v24;
  v79 = v23;
  v80 = v11;
  v81 = v22;
  v82 = BYTE4(v21);
  sub_100006010((uint64_t)&v53);
  v16 = sub_1000060AC((uint64_t)v69);
  *(_OWORD *)&v83[71] = v66;
  *(_OWORD *)&v83[87] = v67;
  *(_OWORD *)&v83[103] = v68[0];
  *(_OWORD *)&v83[119] = v68[1];
  *(_OWORD *)&v83[7] = v62;
  *(_OWORD *)&v83[23] = v63;
  *(_OWORD *)&v83[39] = v64;
  *(_OWORD *)&v83[55] = v65;
  *(_OWORD *)((char *)&v38[5] + 1) = *(_OWORD *)&v83[80];
  *(_OWORD *)((char *)&v38[6] + 1) = *(_OWORD *)&v83[96];
  *(_OWORD *)((char *)&v38[7] + 1) = *(_OWORD *)&v83[112];
  *(_OWORD *)((char *)&v38[1] + 1) = *(_OWORD *)&v83[16];
  *(_OWORD *)((char *)&v38[2] + 1) = *(_OWORD *)&v83[32];
  *(_OWORD *)((char *)&v38[3] + 1) = *(_OWORD *)&v83[48];
  *(_OWORD *)((char *)&v38[4] + 1) = *(_OWORD *)&v83[64];
  v84 = 1;
  *(_OWORD *)((char *)v38 + 1) = *(_OWORD *)v83;
  v37 = (unint64_t)v32;
  LOBYTE(v38[0]) = 1;
  *(_QWORD *)&v38[8] = *((_QWORD *)&v68[1] + 1);
  *((_QWORD *)&v38[8] + 1) = 0x4028000000000000;
  LOBYTE(v39) = 0;
  *((_QWORD *)&v39 + 1) = v31;
  LOBYTE(v40) = v15;
  *((_QWORD *)&v40 + 1) = v30;
  LOBYTE(v41) = v8;
  *((_QWORD *)&v41 + 1) = v29;
  v42 = v28;
  v17 = v33;
  static DynamicIslandExpandedRegionVerticalPlacement.belowIfTooWide.getter(v16);
  v18 = sub_10000373C(&qword_10000C1C8);
  v19 = sub_1000067D0(&qword_10000C1D0, &qword_10000C1C8, (uint64_t)&protocol conformance descriptor for HStack<A>);
  View.dynamicIsland(verticalPlacement:)(v17, v18, v19);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v17, v35);
  v95 = v39;
  v96 = v40;
  v97 = v41;
  v98 = v42;
  v91 = v38[5];
  v92 = v38[6];
  v93 = v38[7];
  v94 = v38[8];
  v87 = v38[1];
  v88 = v38[2];
  v89 = v38[3];
  v90 = v38[4];
  v85 = v37;
  v86 = v38[0];
  return sub_100006138((uint64_t)&v85);
}

uint64_t sub_100004E30@<X0>(uint64_t a1@<X8>)
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
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t KeyPath;
  uint64_t v48;
  char v50;
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

  v2 = sub_10000373C(&qword_10000C158);
  ActivityViewContext.state.getter(&v59, v2);
  swift_bridgeObjectRelease(v60);
  v3 = v61;
  swift_bridgeObjectRelease(v62);
  v54 = v2;
  ActivityViewContext.state.getter(&v55, v2);
  swift_bridgeObjectRelease(v56);
  v4 = v57;
  swift_bridgeObjectRelease(v58);
  v5 = sub_100005CD0(v3, v4, &qword_10000C0A8, &qword_10000CB90, (uint64_t *)&qword_10000CB98, (uint64_t)sub_100005410);
  if (v6)
  {
    v7 = v5;
    v8 = v6;
  }
  else
  {
    if (qword_10000C0B8 != -1)
      swift_once(&qword_10000C0B8, sub_100005518);
    v7 = xmmword_10000CBB0;
    v8 = swift_bridgeObjectRetain(*((_QWORD *)&xmmword_10000CBB0 + 1));
  }
  v59 = v7;
  v60 = v8;
  sub_100005EBC();
  v9 = Text.init<A>(_:)(&v59, &type metadata for String);
  v11 = v10;
  v13 = v12;
  v15 = v14 & 1;
  v16 = static Font.footnote.getter();
  v17 = Text.font(_:)(v16, v9, v11, v15, v13);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  swift_release(v16);
  v24 = v21 & 1;
  sub_100005F00(v9, v11, v15);
  v25 = swift_bridgeObjectRelease(v13);
  v26 = static Color.secondary.getter(v25);
  v27 = Text.foregroundColor(_:)(v26, v17, v19, v24, v23);
  v51 = v28;
  v52 = v27;
  LOBYTE(v16) = v29;
  v53 = v30;
  swift_release(v26);
  v50 = v16 & 1;
  sub_100005F00(v17, v19, v24);
  swift_bridgeObjectRelease(v23);
  ActivityViewContext.state.getter(&v59, v54);
  v31 = v59;
  v32 = v60;
  swift_bridgeObjectRelease(v62);
  v55 = v31;
  v56 = v32;
  v33 = Text.init<A>(_:)(&v55, &type metadata for String);
  v35 = v34;
  v37 = v36;
  v39 = v38 & 1;
  v40 = static Font.body.getter();
  v41 = Text.font(_:)(v40, v33, v35, v39, v37);
  v43 = v42;
  LOBYTE(v26) = v44;
  v46 = v45;
  swift_release(v40);
  sub_100005F00(v33, v35, v39);
  swift_bridgeObjectRelease(v37);
  KeyPath = swift_getKeyPath(&unk_100007058);
  v48 = swift_getKeyPath(&unk_100007088);
  LOBYTE(v59) = v50;
  *(_QWORD *)a1 = v52;
  *(_QWORD *)(a1 + 8) = v51;
  *(_BYTE *)(a1 + 16) = v50;
  *(_QWORD *)(a1 + 24) = v53;
  *(_QWORD *)(a1 + 32) = v41;
  *(_QWORD *)(a1 + 40) = v43;
  *(_BYTE *)(a1 + 48) = v26 & 1;
  *(_QWORD *)(a1 + 56) = v46;
  *(_QWORD *)(a1 + 64) = KeyPath;
  *(_QWORD *)(a1 + 72) = 1;
  *(_BYTE *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = v48;
  *(_BYTE *)(a1 + 96) = 2;
  sub_10000609C(v52, v51, v50);
  swift_bridgeObjectRetain(v53);
  sub_10000609C(v41, v43, v26 & 1);
  swift_bridgeObjectRetain(v46);
  swift_retain(KeyPath);
  swift_retain(v48);
  sub_100005F00(v41, v43, v26 & 1);
  swift_release(v48);
  swift_release(KeyPath);
  swift_bridgeObjectRelease(v46);
  sub_100005F00(v52, v51, v59);
  return swift_bridgeObjectRelease(v53);
}

uint64_t sub_100005174@<X0>(uint64_t a1@<X8>)
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  _QWORD v33[6];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v2 = sub_10000373C(&qword_10000C158);
  ActivityViewContext.state.getter(&v34, v2);
  swift_bridgeObjectRelease(v35);
  v3 = v36;
  swift_bridgeObjectRelease(v37);
  ActivityViewContext.state.getter(v33, v2);
  swift_bridgeObjectRelease(v33[1]);
  v4 = v33[3];
  swift_bridgeObjectRelease(v33[5]);
  v5 = sub_100005CD0(v3, v4, &qword_10000C0B0, &qword_10000CBA0, (uint64_t *)&qword_10000CBA8, (uint64_t)sub_100005438);
  if (v6)
  {
    v7 = v5;
    v8 = v6;
  }
  else
  {
    if (qword_10000C0B8 != -1)
      swift_once(&qword_10000C0B8, sub_100005518);
    v7 = xmmword_10000CBB0;
    v8 = swift_bridgeObjectRetain(*((_QWORD *)&xmmword_10000CBB0 + 1));
  }
  v34 = v7;
  v35 = v8;
  sub_100005EBC();
  v9 = Text.init<A>(_:)(&v34, &type metadata for String);
  v11 = v10;
  v13 = v12;
  v15 = v14 & 1;
  v16 = Text.monospacedDigit()();
  v18 = v17;
  v20 = v19;
  v22 = v21 & 1;
  sub_100005F00(v9, v11, v15);
  v23 = swift_bridgeObjectRelease(v13);
  v24 = static Font.caption2.getter(v23);
  v25 = Text.font(_:)(v24, v16, v18, v22, v20);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  swift_release(v24);
  sub_100005F00(v16, v18, v22);
  result = swift_bridgeObjectRelease(v20);
  *(_QWORD *)a1 = v25;
  *(_QWORD *)(a1 + 8) = v27;
  *(_BYTE *)(a1 + 16) = v29 & 1;
  *(_QWORD *)(a1 + 24) = v31;
  return result;
}

unint64_t sub_100005330@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;
  unint64_t v3;
  unint64_t v4;

  result = sub_10000626C();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_100005358()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;

  v2 = *v0;
  v1 = v0[1];
  v3 = v0[2];
  v4 = (_QWORD *)swift_allocObject(&unk_100008808, 40, 7);
  v4[2] = v2;
  v4[3] = v1;
  v4[4] = v3;
  v5 = sub_100005818();
  v6 = sub_10000585C();
  swift_bridgeObjectRetain(v1);
  swift_retain(v3);
  return ActivityConfiguration.init<A>(for:content:dynamicIsland:)(&type metadata for PrintActivityAttributes, sub_100004404, 0, sub_10000580C, v4, &type metadata for PrintActivityAttributes, &type metadata for PrintLiveActivityEntryView, v5, v6);
}

void sub_100005410(uint64_t a1)
{
  sub_100005464(a1, 0xD000000000000015, (void *)0x8000000100007BF0, &qword_10000CB90, &qword_10000CB98);
}

void sub_100005438(uint64_t a1)
{
  sub_100005464(a1, 0x20666F2040243125, (void *)0xEC00000040243225, &qword_10000CBA0, &qword_10000CBA8);
}

void sub_100005464(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, void **a5)
{
  id v9;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;

  v9 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v13._object = (void *)0x8000000100007BB0;
  v10._countAndFlagsBits = a2;
  v10._object = a3;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  v13._countAndFlagsBits = 0xD000000000000035;
  v12 = NSLocalizedString(_:tableName:bundle:value:comment:)(v10, (Swift::String_optional)0, (NSBundle)v9, v11, v13);

  *a4 = v12._countAndFlagsBits;
  *a5 = v12._object;
}

void sub_100005518()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v4._object = (void *)0x8000000100007B80;
  v1._countAndFlagsBits = 0x676E69746E697250;
  v1._object = (void *)0xE800000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD00000000000002ELL;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_10000CBB0 = (__int128)v3;
}

int main(int argc, const char **argv, const char **envp)
{
  sub_1000055F8();
  static Widget.main()();
  return 0;
}

unint64_t sub_1000055F8()
{
  unint64_t result;

  result = qword_10000C140;
  if (!qword_10000C140)
  {
    result = swift_getWitnessTable(&unk_100007014, &type metadata for PrintLiveActivity);
    atomic_store(result, (unint64_t *)&qword_10000C140);
  }
  return result;
}

uint64_t destroy for PrintLiveActivity(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_release(*(_QWORD *)(a1 + 16));
}

_QWORD *_s21PrintLiveActivity_iOS17PrintLiveActivityVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain(v3);
  swift_retain(v4);
  return a1;
}

_QWORD *assignWithCopy for PrintLiveActivity(_QWORD *a1, _QWORD *a2)
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
  v6 = a2[2];
  v7 = a1[2];
  a1[2] = v6;
  swift_retain(v6);
  swift_release(v7);
  return a1;
}

__n128 initializeWithTake for PrintLiveActivity(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *assignWithTake for PrintLiveActivity(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;

  *a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease(a1[1]);
  v4 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintLiveActivity(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrintLiveActivity(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintLiveActivity()
{
  return &type metadata for PrintLiveActivity;
}

uint64_t sub_1000057F8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100007228, 1);
}

uint64_t sub_10000580C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_1000044C4(a1, v2[2], v2[3], v2[4], a2);
}

unint64_t sub_100005818()
{
  unint64_t result;

  result = qword_10000C148;
  if (!qword_10000C148)
  {
    result = swift_getWitnessTable(&unk_100006DC0, &type metadata for PrintActivityAttributes);
    atomic_store(result, (unint64_t *)&qword_10000C148);
  }
  return result;
}

unint64_t sub_10000585C()
{
  unint64_t result;

  result = qword_10000C150;
  if (!qword_10000C150)
  {
    result = swift_getWitnessTable(&unk_1000070DC, &type metadata for PrintLiveActivityEntryView);
    atomic_store(result, (unint64_t *)&qword_10000C150);
  }
  return result;
}

uint64_t sub_1000058A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_10000373C(&qword_10000C158);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100005920@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_10000373C(&qword_10000C158) - 8) + 80);
  return sub_100004724(v1[2], v1[3], v1[4], (uint64_t)v1 + ((v3 + 40) & ~v3), a1);
}

uint64_t sub_100005970()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_10000373C(&qword_10000C158);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000059D4@<X0>(uint64_t a1@<X8>)
{
  sub_10000373C(&qword_10000C158);
  return sub_100005174(a1);
}

uint64_t sub_100005A18()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100005A44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
  return swift_retain(v2);
}

uint64_t sub_100005A58(uint64_t *a1)
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

unint64_t sub_100005A9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C178;
  if (!qword_10000C178)
  {
    v1 = sub_100005A58(&qword_10000C168);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C178);
  }
  return result;
}

uint64_t sub_100005B00@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  void (*v23)(char *, uint64_t);
  uint64_t v25;
  char *v26;

  v26 = a1;
  v1 = sub_10000373C(&qword_10000C1E0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v25 - v6;
  v8 = sub_10000373C(&qword_10000C1D8);
  v25 = *(_QWORD *)(v8 - 8);
  v9 = v25;
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v25 - v13;
  v15 = sub_10000373C(&qword_10000C198);
  DynamicIslandExpandedContent.content.getter(v15);
  v16 = sub_10000373C(&qword_10000C1A0);
  DynamicIslandExpandedRegion._viewRepresentation.getter(v16);
  v17 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v17(v12, v14, v8);
  v18 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v19 = v2;
  v18(v5, v7, v1);
  v20 = v26;
  v17(v26, v12, v8);
  v21 = sub_10000373C(&qword_10000C1E8);
  v18(&v20[*(int *)(v21 + 48)], v5, v1);
  v22 = *(void (**)(char *, uint64_t))(v19 + 8);
  v22(v7, v1);
  v23 = *(void (**)(char *, uint64_t))(v25 + 8);
  v23(v14, v8);
  v22(v5, v1);
  return ((uint64_t (*)(char *, uint64_t))v23)(v12, v8);
}

uint64_t sub_100005CD0(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t *a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;

  if (a1 && a2)
  {
    if (*a3 != -1)
      swift_once(a3, a6);
    v26 = *a5;
    v27 = *a4;
    v10 = sub_10000373C(&qword_10000C188);
    v11 = swift_allocObject(v10, 112, 7);
    *(_OWORD *)(v11 + 16) = xmmword_100006FD0;
    v12 = (void *)objc_opt_self(NSNumberFormatter);
    v13 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", a2);
    v14 = objc_msgSend(v12, "localizedStringFromNumber:numberStyle:", v13, 1);

    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    v17 = v16;

    *(_QWORD *)(v11 + 56) = &type metadata for String;
    v18 = sub_100005F10();
    *(_QWORD *)(v11 + 64) = v18;
    *(_QWORD *)(v11 + 32) = v15;
    *(_QWORD *)(v11 + 40) = v17;
    v19 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", a1);
    v20 = objc_msgSend(v12, "localizedStringFromNumber:numberStyle:", v19, 1);

    v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
    v23 = v22;

    *(_QWORD *)(v11 + 96) = &type metadata for String;
    *(_QWORD *)(v11 + 104) = v18;
    *(_QWORD *)(v11 + 72) = v21;
    *(_QWORD *)(v11 + 80) = v23;
    v24 = static String.localizedStringWithFormat(_:_:)(v27, v26, v11);
    swift_bridgeObjectRelease(v11);
  }
  else
  {
    if (qword_10000C0B8 != -1)
      swift_once(&qword_10000C0B8, sub_100005518);
    v24 = xmmword_10000CBB0;
    swift_bridgeObjectRetain(*((_QWORD *)&xmmword_10000CBB0 + 1));
  }
  return v24;
}

unint64_t sub_100005EBC()
{
  unint64_t result;

  result = qword_10000C180;
  if (!qword_10000C180)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10000C180);
  }
  return result;
}

uint64_t sub_100005F00(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

unint64_t sub_100005F10()
{
  unint64_t result;

  result = qword_10000C190;
  if (!qword_10000C190)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10000C190);
  }
  return result;
}

double sub_100005F54@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100004A28(*(_QWORD *)(v1 + 32), a1);
}

unint64_t sub_100005F60()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C1B8;
  if (!qword_10000C1B8)
  {
    v1 = sub_100005A58(&qword_10000C1B0);
    sub_100005A9C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C1B8);
  }
  return result;
}

uint64_t sub_100005FCC@<X0>(uint64_t a1@<X8>)
{
  return sub_100004AB0(a1);
}

uint64_t sub_100005FD4()
{
  uint64_t v0;

  v0 = sub_10000373C(&qword_10000C1A8);
  return DynamicIslandExpandedRegion._viewRepresentation.getter(v0);
}

uint64_t sub_100006008@<X0>(char *a1@<X8>)
{
  return sub_100005B00(a1);
}

uint64_t sub_100006010(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_BYTE *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 112);
  sub_10000609C(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain(v2);
  sub_10000609C(v3, v4, v5);
  swift_bridgeObjectRetain(v6);
  swift_retain(v7);
  swift_retain(v8);
  return a1;
}

uint64_t sub_10000609C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_1000060AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_BYTE *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 112);
  sub_100005F00(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRelease(v2);
  sub_100005F00(v3, v4, v5);
  swift_release(v8);
  swift_release(v7);
  swift_bridgeObjectRelease(v6);
  return a1;
}

uint64_t sub_100006138(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 80);
  v4 = *(_QWORD *)(a1 + 88);
  v5 = *(_BYTE *)(a1 + 96);
  v6 = *(_QWORD *)(a1 + 104);
  v7 = *(_QWORD *)(a1 + 112);
  v8 = *(_QWORD *)(a1 + 136);
  sub_100005F00(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 64));
  swift_bridgeObjectRelease(v2);
  sub_100005F00(v3, v4, v5);
  swift_release(v8);
  swift_release(v7);
  swift_bridgeObjectRelease(v6);
  return a1;
}

uint64_t sub_1000061C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1000061F4(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_100006220@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100006248(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

unint64_t sub_10000626C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v0 = sub_10000373C(&qword_10000C1F0);
  __chkstk_darwin(v0);
  v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Image.ResizingMode(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = Image.init(systemName:)(0x2E7265746E697270, 0xEC0000006C6C6966);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for Image.ResizingMode.stretch(_:), v3);
  v8 = Image.resizable(capInsets:resizingMode:)(v6, v7, 0.0, 0.0, 0.0, 0.0);
  swift_release(v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v9 = enum case for Image.TemplateRenderingMode.template(_:);
  v10 = type metadata accessor for Image.TemplateRenderingMode(0);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v2, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v2, 0, 1, v10);
  Image.renderingMode(_:)(v2, v8);
  swift_release(v8);
  sub_10000670C((uint64_t)v2, &qword_10000C1F0);
  return 0xD000000000000011;
}

uint64_t destroy for PrintLiveActivityEntryView(_QWORD *a1)
{
  swift_release(*a1);
  swift_bridgeObjectRelease(a1[2]);
  swift_bridgeObjectRelease(a1[6]);
  return swift_release(a1[7]);
}

uint64_t initializeWithCopy for PrintLiveActivityEntryView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *a2;
  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = a2[2];
  *(_QWORD *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
  v6 = a2[6];
  *(_QWORD *)(a1 + 40) = a2[5];
  *(_QWORD *)(a1 + 48) = v6;
  v7 = a2[7];
  *(_QWORD *)(a1 + 56) = v7;
  swift_retain(v3);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_retain(v7);
  return a1;
}

uint64_t *assignWithCopy for PrintLiveActivityEntryView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  a1[1] = a2[1];
  v6 = a2[2];
  v7 = a1[2];
  a1[2] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  v8 = a2[6];
  v9 = a1[6];
  a1[6] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = a1[7];
  v11 = a2[7];
  a1[7] = v11;
  swift_retain(v11);
  swift_release(v10);
  return a1;
}

__n128 initializeWithTake for PrintLiveActivityEntryView(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t *assignWithTake for PrintLiveActivityEntryView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  v5 = a2[2];
  v6 = a1[2];
  a1[1] = a2[1];
  a1[2] = v5;
  swift_bridgeObjectRelease(v6);
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
  a1[5] = a2[5];
  swift_bridgeObjectRelease(a1[6]);
  v7 = a1[7];
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
  swift_release(v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintLiveActivityEntryView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrintLiveActivityEntryView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintLiveActivityEntryView()
{
  return &type metadata for PrintLiveActivityEntryView;
}

uint64_t sub_10000668C()
{
  return sub_1000067D0(&qword_10000C1F8, &qword_10000C200, (uint64_t)&protocol conformance descriptor for ActivityConfiguration<A>);
}

uint64_t sub_1000066B8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100007250, 1);
}

uint64_t sub_1000066C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000373C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000670C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10000373C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10000674C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C250;
  if (!qword_10000C250)
  {
    v1 = sub_100005A58(&qword_10000C218);
    sub_1000067D0(&qword_10000C258, &qword_10000C208, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C250);
  }
  return result;
}

uint64_t sub_1000067D0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100005A58(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006810()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC21PrintLiveActivity_iOSP33_F08AD9E7F73D6B704958D9FFCD39148C19ResourceBundleClass);
}
