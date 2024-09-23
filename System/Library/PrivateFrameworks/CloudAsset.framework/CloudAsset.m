uint64_t AssetDownloadResponse.id.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_237F18108();
  v0 = sub_237F18128();
  return sub_237F180F8(v0, v1, v2, v3);
}

void AssetDownloadResponse.asset.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_237F180F0();
  sub_237F17320(v1 + *(int *)(v3 + 20), a1, type metadata accessor for Asset);
}

uint64_t type metadata accessor for AssetDownloadResponse()
{
  uint64_t result;

  result = qword_2568A8FE8;
  if (!qword_2568A8FE8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t AssetDownloadResponse.fileURL.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_237F180F0();
  sub_237F18100();
  v0 = sub_237F18128();
  return sub_237F180F8(v0, v1, v2, v3);
}

uint64_t AssetDownloadResponse.range.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(sub_237F180F0() + 28));
}

uint64_t AssetDownloadResponse.init(id:asset:fileURL:range:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X8>)
{
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;

  v14 = sub_237F18108();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(a7, a1, v14);
  v15 = (int *)sub_237F180F0();
  sub_237F16480(a2, a7 + v15[5]);
  v16 = a7 + v15[6];
  v17 = sub_237F18100();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v16, a3, v17);
  v19 = a7 + v15[7];
  *(_QWORD *)v19 = a4;
  *(_QWORD *)(v19 + 8) = a5;
  *(_BYTE *)(v19 + 16) = a6 & 1;
  return result;
}

uint64_t sub_237F16480(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Asset(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void AssetDownloadResponse.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  Swift::UInt v11;
  Swift::UInt v12;

  v1 = v0;
  sub_237F18108();
  sub_237F173F0(&qword_2568A8F70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  dispatch thunk of Hashable.hash(into:)();
  v2 = sub_237F180F0();
  v3 = v0 + *(int *)(v2 + 20);
  Asset.ID.hash(into:)();
  v4 = sub_237F1815C();
  v5 = (uint64_t *)(v3 + *(int *)(v4 + 20));
  v6 = *v5;
  v7 = v5[1];
  v8 = v5[2];
  v9 = v5[3];
  sub_237F17134(*v5, v7);
  Data.hash(into:)();
  sub_237F17178(v6, v7);
  sub_237F17134(v8, v9);
  Data.hash(into:)();
  sub_237F17178(v8, v9);
  Hasher._combine(_:)(*(_QWORD *)(v3 + *(int *)(v4 + 24)));
  sub_237F18100();
  sub_237F173F0(&qword_2568A8F78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  dispatch thunk of Hashable.hash(into:)();
  v10 = v1 + *(int *)(v2 + 28);
  if (*(_BYTE *)(v10 + 16) == 1)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    v12 = *(_QWORD *)v10;
    v11 = *(_QWORD *)(v10 + 8);
    Hasher._combine(_:)(1u);
    Hasher._combine(_:)(v12);
    Hasher._combine(_:)(v11);
  }
}

uint64_t static AssetDownloadResponse.== infix(_:_:)()
{
  if ((static UUID.== infix(_:_:)() & 1) != 0)
  {
    sub_237F180F0();
    static Asset.== infix(_:_:)();
  }
  return 0;
}

BOOL sub_237F166EC(char a1, char a2)
{
  return a1 == a2;
}

void sub_237F166FC(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

uint64_t sub_237F16720(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  char v9;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x7465737361 && a2 == 0xE500000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x4C5255656C6966 && a2 == 0xE700000000000000;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x65676E6172 && a2 == 0xE500000000000000)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t sub_237F168A4()
{
  return 4;
}

Swift::Int sub_237F168AC(unsigned __int8 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

uint64_t sub_237F168F0()
{
  return 0;
}

uint64_t sub_237F168FC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_237F16924 + 4 * byte_237F5CC20[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_237F16924()
{
  return 0x7465737361;
}

uint64_t sub_237F16938()
{
  return 0x4C5255656C6966;
}

uint64_t sub_237F16950()
{
  return 0x65676E6172;
}

BOOL sub_237F16964(char *a1, char *a2)
{
  return sub_237F166EC(*a1, *a2);
}

Swift::Int sub_237F16970()
{
  unsigned __int8 *v0;

  return sub_237F168AC(*v0);
}

void sub_237F16978(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_237F166FC(a1, *v1);
}

Swift::Int sub_237F16980()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_237F169C0()
{
  unsigned __int8 *v0;

  return sub_237F168FC(*v0);
}

uint64_t sub_237F169C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F16720(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237F169EC()
{
  return sub_237F168F0();
}

uint64_t sub_237F16A08@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_237F168A4();
  *a1 = result;
  return result;
}

uint64_t sub_237F16A2C()
{
  sub_237F17220();
  return CodingKey.description.getter();
}

uint64_t sub_237F16A54()
{
  sub_237F17220();
  return CodingKey.debugDescription.getter();
}

uint64_t AssetDownloadResponse.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = sub_237F171BC(&qword_2568A8F80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  sub_237F18110();
  sub_237F171FC(a1, a1[3]);
  sub_237F17220();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  type metadata accessor for UUID();
  sub_237F173F0(&qword_2568A8F90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_237F18148();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v1)
  {
    type metadata accessor for AssetDownloadResponse();
    type metadata accessor for Asset(0);
    sub_237F173F0(&qword_2568A8F98, type metadata accessor for Asset, (uint64_t)&protocol conformance descriptor for Asset);
    sub_237F180BC();
    type metadata accessor for URL();
    sub_237F173F0(&qword_2568A8FA0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
    sub_237F180BC();
    sub_237F171BC(&qword_2568A8FA8);
    sub_237F172C0(&qword_2568A8FB0, MEMORY[0x24BEE1770], MEMORY[0x24BEE1B98]);
    sub_237F18148();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

Swift::Int AssetDownloadResponse.hashValue.getter()
{
  Hasher.init(_seed:)();
  AssetDownloadResponse.hash(into:)();
  return Hasher._finalize()();
}

void AssetDownloadResponse.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD v23[3];
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
  _QWORD *v34;
  __int128 v35;
  char v36;
  char v37;

  v24 = a2;
  v4 = type metadata accessor for URL();
  v5 = *(_QWORD *)(v4 - 8);
  v26 = v4;
  v27 = v5;
  MEMORY[0x24BDAC7A8]();
  sub_237F180DC();
  v25 = v6;
  v29 = type metadata accessor for Asset(0);
  MEMORY[0x24BDAC7A8]();
  sub_237F180DC();
  v28 = v7;
  v31 = type metadata accessor for UUID();
  v8 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8]();
  sub_237F180DC();
  v30 = v9;
  v33 = sub_237F171BC(&qword_2568A8FB8);
  v10 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8]();
  sub_237F18110();
  v11 = (int *)type metadata accessor for AssetDownloadResponse();
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237F171FC(a1, a1[3]);
  sub_237F17220();
  v32 = v2;
  v14 = (uint64_t)v34;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v14)
  {
    sub_237F172A0((uint64_t)a1);
  }
  else
  {
    v15 = v28;
    v23[2] = v10;
    v34 = a1;
    v16 = (uint64_t)v13;
    LOBYTE(v35) = 0;
    sub_237F173F0(&qword_2568A8FC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    v18 = v30;
    v17 = v31;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v23[1] = v8;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v16, v18, v17);
    LOBYTE(v35) = 1;
    sub_237F173F0(&qword_2568A8FC8, type metadata accessor for Asset, (uint64_t)&protocol conformance descriptor for Asset);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    sub_237F16480(v15, v16 + v11[5]);
    LOBYTE(v35) = 2;
    sub_237F173F0(&qword_2568A8FD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
    v20 = v25;
    v19 = v26;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v16 + v11[6], v20, v19);
    sub_237F171BC(&qword_2568A8FA8);
    v37 = 3;
    sub_237F172C0(&qword_2568A8FD8, MEMORY[0x24BEE1798], MEMORY[0x24BEE1BC8]);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    sub_237F180AC();
    v21 = v36;
    v22 = v16 + v11[7];
    *(_OWORD *)v22 = v35;
    *(_BYTE *)(v22 + 16) = v21;
    sub_237F17320(v16, v24, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
    sub_237F172A0((uint64_t)v34);
    sub_237F17360(v16, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
  }
}

Swift::Int sub_237F170D0()
{
  Hasher.init(_seed:)();
  AssetDownloadResponse.hash(into:)();
  return Hasher._finalize()();
}

void sub_237F17108(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  AssetDownloadResponse.init(from:)(a1, a2);
}

uint64_t sub_237F1711C(_QWORD *a1)
{
  return AssetDownloadResponse.encode(to:)(a1);
}

uint64_t sub_237F17134(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_237F17178(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_237F171BC(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B828314]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *sub_237F171FC(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_237F17220()
{
  unint64_t result;

  result = qword_2568A8F88;
  if (!qword_2568A8F88)
  {
    result = MEMORY[0x23B82832C](&unk_237F5CE44, &type metadata for AssetDownloadResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A8F88);
  }
  return result;
}

uint64_t sub_237F1725C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B828320](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_237F172A0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_237F172C0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = sub_237F1725C(&qword_2568A8FA8);
    v8 = a2;
    result = MEMORY[0x23B82832C](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

void sub_237F17320(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  sub_237F18140();
}

void sub_237F17360(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  sub_237F18140();
}

void sub_237F17398()
{
  sub_237F173F0(&qword_2568A8F70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

void sub_237F173C4()
{
  sub_237F173F0(&qword_2568A8FE0, (uint64_t (*)(uint64_t))type metadata accessor for AssetDownloadResponse, (uint64_t)&protocol conformance descriptor for AssetDownloadResponse);
}

void sub_237F173F0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x23B82832C](a3, v5), a1);
  }
  sub_237F18140();
}

char *initializeBufferWithCopyOfBuffer for AssetDownloadResponse(char *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  void (*v40)(char *, char *, uint64_t);
  uint64_t v41;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v38 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = (char *)(v38 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for URL();
    v40 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v41 = v11;
    v40(v9, v10, v11);
    v12 = (int *)type metadata accessor for Asset.ID(0);
    v13 = v12[5];
    v14 = &v9[v13];
    v15 = &v10[v13];
    v16 = *((_QWORD *)v15 + 1);
    *(_QWORD *)v14 = *(_QWORD *)v15;
    *((_QWORD *)v14 + 1) = v16;
    v17 = v12[6];
    v18 = (uint64_t *)&v9[v17];
    v19 = (uint64_t *)&v10[v17];
    v20 = *v19;
    v21 = v19[1];
    swift_bridgeObjectRetain();
    sub_237F17134(v20, v21);
    *v18 = v20;
    v18[1] = v21;
    v22 = v12[7];
    v23 = (uint64_t *)&v9[v22];
    v24 = (uint64_t *)&v10[v22];
    v25 = *v24;
    v26 = v24[1];
    sub_237F17134(*v24, v26);
    *v23 = v25;
    v23[1] = v26;
    v27 = type metadata accessor for Asset(0);
    v28 = *(int *)(v27 + 20);
    v29 = (uint64_t *)&v9[v28];
    v30 = &v10[v28];
    v31 = *(_QWORD *)&v10[v28];
    v32 = *(_QWORD *)&v10[v28 + 8];
    sub_237F17134(v31, v32);
    *v29 = v31;
    v29[1] = v32;
    v33 = *((_QWORD *)v30 + 2);
    v34 = *((_QWORD *)v30 + 3);
    sub_237F17134(v33, v34);
    v29[2] = v33;
    v29[3] = v34;
    *(_QWORD *)&v9[*(int *)(v27 + 24)] = *(_QWORD *)&v10[*(int *)(v27 + 24)];
    v40(&a1[a3[6]], (char *)a2 + a3[6], v41);
    v35 = a3[7];
    v36 = &a1[v35];
    v37 = (char *)a2 + v35;
    *(_OWORD *)v36 = *(_OWORD *)v37;
    v36[16] = v37[16];
  }
  return a1;
}

uint64_t destroy for AssetDownloadResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v10)(uint64_t, uint64_t);

  v4 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = type metadata accessor for URL();
  v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v10(v5, v6);
  v7 = type metadata accessor for Asset.ID(0);
  swift_bridgeObjectRelease();
  sub_237F17178(*(_QWORD *)(v5 + *(int *)(v7 + 24)), *(_QWORD *)(v5 + *(int *)(v7 + 24) + 8));
  sub_237F17178(*(_QWORD *)(v5 + *(int *)(v7 + 28)), *(_QWORD *)(v5 + *(int *)(v7 + 28) + 8));
  v8 = v5 + *(int *)(type metadata accessor for Asset(0) + 20);
  sub_237F17178(*(_QWORD *)v8, *(_QWORD *)(v8 + 8));
  sub_237F17178(*(_QWORD *)(v8 + 16), *(_QWORD *)(v8 + 24));
  return ((uint64_t (*)(uint64_t, uint64_t))v10)(a1 + *(int *)(a2 + 24), v6);
}

uint64_t initializeWithCopy for AssetDownloadResponse(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v38)(uint64_t, uint64_t, uint64_t);

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for URL();
  v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v38(v8, v9, v10);
  v11 = (int *)type metadata accessor for Asset.ID(0);
  v12 = v11[5];
  v13 = (_QWORD *)(v8 + v12);
  v14 = (_QWORD *)(v9 + v12);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = v11[6];
  v17 = (uint64_t *)(v8 + v16);
  v18 = (uint64_t *)(v9 + v16);
  v19 = *v18;
  v20 = v18[1];
  swift_bridgeObjectRetain();
  sub_237F17134(v19, v20);
  *v17 = v19;
  v17[1] = v20;
  v21 = v11[7];
  v22 = (uint64_t *)(v8 + v21);
  v23 = (uint64_t *)(v9 + v21);
  v24 = *v23;
  v25 = v23[1];
  sub_237F17134(*v23, v25);
  *v22 = v24;
  v22[1] = v25;
  v26 = type metadata accessor for Asset(0);
  v27 = *(int *)(v26 + 20);
  v28 = (uint64_t *)(v8 + v27);
  v29 = v9 + v27;
  v30 = *(_QWORD *)(v9 + v27);
  v31 = *(_QWORD *)(v9 + v27 + 8);
  sub_237F17134(v30, v31);
  *v28 = v30;
  v28[1] = v31;
  v32 = *(_QWORD *)(v29 + 16);
  v33 = *(_QWORD *)(v29 + 24);
  sub_237F17134(v32, v33);
  v28[2] = v32;
  v28[3] = v33;
  *(_QWORD *)(v8 + *(int *)(v26 + 24)) = *(_QWORD *)(v9 + *(int *)(v26 + 24));
  v38(a1 + a3[6], a2 + a3[6], v10);
  v34 = a3[7];
  v35 = a1 + v34;
  v36 = a2 + v34;
  *(_OWORD *)v35 = *(_OWORD *)v36;
  *(_BYTE *)(v35 + 16) = *(_BYTE *)(v36 + 16);
  return a1;
}

uint64_t assignWithCopy for AssetDownloadResponse(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  void (*v46)(uint64_t, uint64_t, uint64_t);

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for URL();
  v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24);
  v46(v8, v9, v10);
  v11 = (int *)type metadata accessor for Asset.ID(0);
  v12 = v11[5];
  v13 = (_QWORD *)(v8 + v12);
  v14 = (_QWORD *)(v9 + v12);
  *v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = v11[6];
  v16 = (uint64_t *)(v8 + v15);
  v17 = (uint64_t *)(v9 + v15);
  v18 = *v17;
  v19 = v17[1];
  sub_237F17134(*v17, v19);
  v20 = *v16;
  v21 = v16[1];
  *v16 = v18;
  v16[1] = v19;
  sub_237F17178(v20, v21);
  v22 = v11[7];
  v23 = (uint64_t *)(v8 + v22);
  v24 = (uint64_t *)(v9 + v22);
  v25 = *v24;
  v26 = v24[1];
  sub_237F17134(*v24, v26);
  v27 = *v23;
  v28 = v23[1];
  *v23 = v25;
  v23[1] = v26;
  sub_237F17178(v27, v28);
  v29 = type metadata accessor for Asset(0);
  v30 = *(int *)(v29 + 20);
  v31 = (uint64_t *)(v8 + v30);
  v32 = v9 + v30;
  v33 = *(_QWORD *)(v9 + v30);
  v34 = *(_QWORD *)(v9 + v30 + 8);
  sub_237F17134(v33, v34);
  v35 = *v31;
  v36 = v31[1];
  *v31 = v33;
  v31[1] = v34;
  sub_237F17178(v35, v36);
  v37 = *(_QWORD *)(v32 + 16);
  v38 = *(_QWORD *)(v32 + 24);
  sub_237F17134(v37, v38);
  v39 = v31[2];
  v40 = v31[3];
  v31[2] = v37;
  v31[3] = v38;
  sub_237F17178(v39, v40);
  *(_QWORD *)(v8 + *(int *)(v29 + 24)) = *(_QWORD *)(v9 + *(int *)(v29 + 24));
  v46(a1 + a3[6], a2 + a3[6], v10);
  v41 = a3[7];
  v42 = a1 + v41;
  v43 = a2 + v41;
  v44 = *(_BYTE *)(v43 + 16);
  *(_OWORD *)v42 = *(_OWORD *)v43;
  *(_BYTE *)(v42 + 16) = v44;
  return a1;
}

uint64_t initializeWithTake for AssetDownloadResponse(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  int *v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for URL();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v12 = (int *)type metadata accessor for Asset.ID(0);
  *(_OWORD *)(v8 + v12[5]) = *(_OWORD *)(v9 + v12[5]);
  *(_OWORD *)(v8 + v12[6]) = *(_OWORD *)(v9 + v12[6]);
  *(_OWORD *)(v8 + v12[7]) = *(_OWORD *)(v9 + v12[7]);
  v13 = type metadata accessor for Asset(0);
  v14 = *(int *)(v13 + 20);
  v15 = (_OWORD *)(v8 + v14);
  v16 = (_OWORD *)(v9 + v14);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  *(_QWORD *)(v8 + *(int *)(v13 + 24)) = *(_QWORD *)(v9 + *(int *)(v13 + 24));
  v11(a1 + a3[6], a2 + a3[6], v10);
  v18 = a3[7];
  v19 = a1 + v18;
  v20 = a2 + v18;
  *(_OWORD *)v19 = *(_OWORD *)v20;
  *(_BYTE *)(v19 + 16) = *(_BYTE *)(v20 + 16);
  return a1;
}

uint64_t assignWithTake for AssetDownloadResponse(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  int *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for URL();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v12 = (int *)type metadata accessor for Asset.ID(0);
  v13 = v12[5];
  v14 = (_QWORD *)(v8 + v13);
  v15 = (uint64_t *)(v9 + v13);
  v17 = *v15;
  v16 = v15[1];
  *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  v18 = v12[6];
  v19 = *(_QWORD *)(v8 + v18);
  v20 = *(_QWORD *)(v8 + v18 + 8);
  *(_OWORD *)(v8 + v18) = *(_OWORD *)(v9 + v18);
  sub_237F17178(v19, v20);
  v21 = v12[7];
  v22 = *(_QWORD *)(v8 + v21);
  v23 = *(_QWORD *)(v8 + v21 + 8);
  *(_OWORD *)(v8 + v21) = *(_OWORD *)(v9 + v21);
  sub_237F17178(v22, v23);
  v24 = type metadata accessor for Asset(0);
  v25 = *(int *)(v24 + 20);
  v26 = v8 + v25;
  v27 = v9 + v25;
  v28 = *(_QWORD *)(v8 + v25);
  v29 = *(_QWORD *)(v8 + v25 + 8);
  *(_OWORD *)(v8 + v25) = *(_OWORD *)(v9 + v25);
  sub_237F17178(v28, v29);
  v30 = *(_QWORD *)(v26 + 16);
  v31 = *(_QWORD *)(v26 + 24);
  *(_OWORD *)(v26 + 16) = *(_OWORD *)(v27 + 16);
  sub_237F17178(v30, v31);
  *(_QWORD *)(v8 + *(int *)(v24 + 24)) = *(_QWORD *)(v9 + *(int *)(v24 + 24));
  v11(a1 + a3[6], a2 + a3[6], v10);
  v32 = a3[7];
  v33 = a1 + v32;
  v34 = a2 + v32;
  *(_OWORD *)v33 = *(_OWORD *)v34;
  *(_BYTE *)(v33 + 16) = *(_BYTE *)(v34 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AssetDownloadResponse()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237F17CA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_237F18108();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    v9 = sub_237F1815C();
    if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
    {
      v7 = v9;
      v10 = *(int *)(a3 + 20);
    }
    else
    {
      v7 = sub_237F18100();
      v10 = *(int *)(a3 + 24);
    }
    v8 = a1 + v10;
  }
  return _s10CloudAsset21UploadResponseMessageOwet_0(v8, a2, v7);
}

uint64_t _s10CloudAsset21UploadResponseMessageOwet_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for AssetDownloadResponse()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237F17D38(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = sub_237F18108();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    v11 = sub_237F1815C();
    if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == a3)
    {
      v9 = v11;
      v12 = *(int *)(a4 + 20);
    }
    else
    {
      v9 = sub_237F18100();
      v12 = *(int *)(a4 + 24);
    }
    v10 = a1 + v12;
  }
  return _s10CloudAsset21UploadResponseMessageOwst_0(v10, a2, a2, v9);
}

uint64_t _s10CloudAsset21UploadResponseMessageOwst_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_237F17DCC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for Asset(319);
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for URL();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for AssetDownloadResponse.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AssetDownloadResponse.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AssetDownloadResponse.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237F17F58 + 4 * byte_237F5CC29[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_237F17F8C + 4 * byte_237F5CC24[v4]))();
}

uint64_t sub_237F17F8C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F17F94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237F17F9CLL);
  return result;
}

uint64_t sub_237F17FA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237F17FB0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_237F17FB4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F17FBC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F17FC8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_237F17FD4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AssetDownloadResponse.CodingKeys()
{
  return &type metadata for AssetDownloadResponse.CodingKeys;
}

unint64_t sub_237F17FF0()
{
  unint64_t result;

  result = qword_2568A8FF8;
  if (!qword_2568A8FF8)
  {
    result = MEMORY[0x23B82832C](&unk_237F5CE1C, &type metadata for AssetDownloadResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A8FF8);
  }
  return result;
}

unint64_t sub_237F18030()
{
  unint64_t result;

  result = qword_2568A9000;
  if (!qword_2568A9000)
  {
    result = MEMORY[0x23B82832C](&unk_237F5CD8C, &type metadata for AssetDownloadResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9000);
  }
  return result;
}

unint64_t sub_237F18070()
{
  unint64_t result;

  result = qword_2568A9008;
  if (!qword_2568A9008)
  {
    result = MEMORY[0x23B82832C](&unk_237F5CDB4, &type metadata for AssetDownloadResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9008);
  }
  return result;
}

uint64_t sub_237F180AC()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 208) + 8))(*(_QWORD *)(v0 - 136), *(_QWORD *)(v0 - 128));
}

uint64_t sub_237F180BC()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_237F180F0()
{
  return type metadata accessor for AssetDownloadResponse();
}

uint64_t sub_237F180F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_237F18100()
{
  return type metadata accessor for URL();
}

uint64_t sub_237F18108()
{
  return type metadata accessor for UUID();
}

uint64_t sub_237F18128()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F1815C()
{
  return type metadata accessor for Asset(0);
}

void static Asset.== infix(_:_:)()
{
  sub_237F1BD54();
}

uint64_t sub_237F18188(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  char v5;
  uint64_t result;

  if ((a1 & 1) == 0)
    return 0;
  v1 = type metadata accessor for Asset.ID(0);
  sub_237F1BAA8(v1);
  v4 = v4 && v2 == v3;
  if (v4 || (v5 = sub_237F1BD24(), result = 0, (v5 & 1) != 0))
    sub_237F1BA14();
  return result;
}

uint64_t Asset.ID.Builder.__allocating_init(partition:ownerID:signature:)()
{
  uint64_t v0;

  sub_237F1BC14();
  v0 = swift_allocObject();
  Asset.ID.Builder.init(partition:ownerID:signature:)();
  return v0;
}

uint64_t Asset.ID.Builder.init(partition:ownerID:signature:)()
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
  _QWORD *v9;
  _QWORD *v10;

  sub_237F1BC14();
  v6 = v1 + OBJC_IVAR____TtCVV10CloudAsset5Asset2ID7Builder_partition;
  v7 = sub_237F18100();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
  v9 = (_QWORD *)(v1 + OBJC_IVAR____TtCVV10CloudAsset5Asset2ID7Builder_ownerID);
  *v9 = v4;
  v9[1] = v3;
  v10 = (_QWORD *)(v1 + OBJC_IVAR____TtCVV10CloudAsset5Asset2ID7Builder_signature);
  *v10 = v2;
  v10[1] = v0;
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
  *(_OWORD *)(v1 + OBJC_IVAR____TtCVV10CloudAsset5Asset2ID7Builder_referenceSignature) = xmmword_237F5CEA0;
  return v1;
}

uint64_t Asset.ID.Builder.setReferenceSignature(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;

  v3 = (uint64_t *)(v2 + OBJC_IVAR____TtCVV10CloudAsset5Asset2ID7Builder_referenceSignature);
  *v3 = a1;
  v3[1] = a2;
  sub_237F17134(a1, a2);
  sub_237F1BB90();
  return sub_237F1BB10();
}

uint64_t Asset.ID.Builder.build()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t *v14;

  v3 = v1 + OBJC_IVAR____TtCVV10CloudAsset5Asset2ID7Builder_partition;
  v4 = sub_237F18100();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
  v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtCVV10CloudAsset5Asset2ID7Builder_ownerID);
  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtCVV10CloudAsset5Asset2ID7Builder_ownerID + 8);
  v7 = (int *)type metadata accessor for Asset.ID(0);
  v8 = (_QWORD *)(a1 + v7[5]);
  *v8 = v6;
  v8[1] = v5;
  v9 = *(_QWORD *)(v1 + OBJC_IVAR____TtCVV10CloudAsset5Asset2ID7Builder_signature + 8);
  v10 = (_QWORD *)(a1 + v7[6]);
  *v10 = *(_QWORD *)(v1 + OBJC_IVAR____TtCVV10CloudAsset5Asset2ID7Builder_signature);
  v10[1] = v9;
  v11 = v1 + OBJC_IVAR____TtCVV10CloudAsset5Asset2ID7Builder_referenceSignature;
  v12 = *(_QWORD *)(v1 + OBJC_IVAR____TtCVV10CloudAsset5Asset2ID7Builder_referenceSignature);
  v13 = *(_QWORD *)(v11 + 8);
  v14 = (uint64_t *)(a1 + v7[7]);
  *v14 = v12;
  v14[1] = v13;
  swift_bridgeObjectRetain();
  sub_237F1BB28();
  return sub_237F17134(v12, v13);
}

void Asset.ID.Builder.deinit()
{
  uint64_t v0;

  v0 = sub_237F18100();
  sub_237F1BA00(v0);
  swift_bridgeObjectRelease();
  sub_237F1BD78(OBJC_IVAR____TtCVV10CloudAsset5Asset2ID7Builder_signature);
  sub_237F1BD78(OBJC_IVAR____TtCVV10CloudAsset5Asset2ID7Builder_referenceSignature);
  sub_237F18140();
}

uint64_t Asset.ID.Builder.__deallocating_deinit()
{
  Asset.ID.Builder.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_237F1854C()
{
  return 1;
}

void sub_237F18554()
{
  sub_237F19750();
}

uint64_t sub_237F18570()
{
  return 0x6675626F746F7270;
}

void sub_237F18590(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_237F1859C()
{
  sub_237F194F0();
  return CodingKey.description.getter();
}

uint64_t sub_237F185C4()
{
  sub_237F194F0();
  return CodingKey.debugDescription.getter();
}

uint64_t Asset.ID.partition.getter()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  sub_237F18100();
  v0 = sub_237F1BA5C();
  return v1(v0);
}

void Asset.ID.storageLocation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[2];

  v0 = type metadata accessor for URL.DirectoryHint();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Asset.ID(0);
  sub_237F1BC08();
  v5 = v4[1];
  v6[0] = *v4;
  v6[1] = v5;
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDCD7A0], v0);
  sub_237F194B4();
  swift_bridgeObjectRetain();
  URL.appending<A>(path:directoryHint:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_bridgeObjectRelease();
  sub_237F1B9EC();
}

void Asset.ID.ownerID.getter()
{
  type metadata accessor for Asset.ID(0);
  sub_237F1BC08();
  swift_bridgeObjectRetain();
  sub_237F1BA5C();
  sub_237F18140();
}

void Asset.ID.signature.getter()
{
  type metadata accessor for Asset.ID(0);
  sub_237F1BA68();
  sub_237F1BA5C();
  sub_237F18140();
}

void Asset.ID.referenceSignature.getter()
{
  type metadata accessor for Asset.ID(0);
  sub_237F1BA68();
  sub_237F1BA5C();
  sub_237F18140();
}

void Asset.ID.init(storageLocation:signature:referenceSignature:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t *v17;
  _QWORD *v18;
  _QWORD *v19;

  URL.deletingLastPathComponent()();
  v12 = URL.lastPathComponent.getter();
  v14 = v13;
  v15 = sub_237F18100();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(a1, v15);
  v16 = (int *)type metadata accessor for Asset.ID(0);
  v17 = (uint64_t *)(a6 + v16[5]);
  *v17 = v12;
  v17[1] = v14;
  v18 = (_QWORD *)(a6 + v16[6]);
  *v18 = a2;
  v18[1] = a3;
  v19 = (_QWORD *)(a6 + v16[7]);
  *v19 = a4;
  v19[1] = a5;
  sub_237F1B9EC();
}

void Asset.ID.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  _QWORD *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;

  sub_237F1B9D4();
  v4 = v3;
  v44 = v5;
  sub_237F171BC(&qword_2568A9018);
  sub_237F1B968();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  sub_237F180DC();
  v46 = v6;
  sub_237F1BBB0();
  v45 = type metadata accessor for URL();
  v42 = *(_QWORD *)(v45 - 8);
  sub_237F1B990();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  sub_237F180DC();
  v43 = v7;
  v8 = sub_237F1BBB0();
  v41 = type metadata accessor for Asset.ID(v8);
  sub_237F1B968();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  sub_237F180DC();
  v40 = v9;
  sub_237F1BBB0();
  type metadata accessor for BinaryDecodingOptions();
  sub_237F1B968();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = sub_237F1B9B4(v10, v37);
  v47 = type metadata accessor for CloudAssets_Asset.ID(v11);
  sub_237F1B968();
  v12 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v37 - v15;
  v17 = sub_237F171BC(&qword_2568A9020);
  sub_237F1BBF8();
  MEMORY[0x24BDAC7A8](v18);
  sub_237F1B99C();
  sub_237F171FC(v4, v4[3]);
  sub_237F194F0();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v0)
  {
    v38 = v14;
    v39 = v16;
    v49 = v4;
    sub_237F1952C();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    sub_237F1BBD0();
    BinaryDecodingOptions.init()();
    sub_237F173F0(&qword_2568A9038, type metadata accessor for CloudAssets_Asset.ID, (uint64_t)&unk_237F5E9A8);
    v19 = (uint64_t)v39;
    sub_237F1BD60();
    v48 = v2;
    v21 = v38;
    sub_237F19900(v19, (uint64_t)v38, type metadata accessor for CloudAssets_Asset.ID);
    v22 = v46;
    URL.init(string:)();
    v23 = v45;
    if (_s10CloudAsset21UploadResponseMessageOwet_0(v22, 1, v45) != 1)
    {
      v24 = v22;
      v25 = v43;
      v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 32);
      v26(v43, v24, v23);
      v47 = v1;
      v27 = v40;
      v26(v40, v25, v23);
      v28 = v21[3];
      v29 = v41;
      v30 = (_QWORD *)(v27 + *(int *)(v41 + 20));
      *v30 = v21[2];
      v30[1] = v28;
      v31 = v21[5];
      v32 = (_QWORD *)(v27 + *(int *)(v29 + 24));
      *v32 = v21[4];
      v32[1] = v31;
      v33 = v19;
      v35 = v21[6];
      v34 = v21[7];
      swift_bridgeObjectRetain();
      sub_237F1BCF4();
      sub_237F1BBE0(v35);
      sub_237F1BC88((uint64_t)v21);
      v36 = (uint64_t *)(v27 + *(int *)(v29 + 28));
      *v36 = v35;
      v36[1] = v34;
      sub_237F1BC88(v33);
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v17);
      sub_237F19FD4(v27, v44, type metadata accessor for Asset.ID);
      v20 = (uint64_t)v49;
      goto LABEL_4;
    }
    sub_237F1B910(v22, &qword_2568A9018);
    sub_237F19568();
    sub_237F1BD00();
    swift_willThrow();
    sub_237F1BC88((uint64_t)v21);
    sub_237F1BC88(v19);
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v1, v17);
    v4 = v49;
  }
  v20 = (uint64_t)v4;
LABEL_4:
  sub_237F172A0(v20);
  sub_237F1B978();
}

void Asset.ID.encode(to:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;

  sub_237F1B9D4();
  v3 = v0;
  v4 = sub_237F1BC5C();
  type metadata accessor for CloudAssets_Asset.ID(v4);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v5);
  sub_237F1B99C();
  sub_237F171BC(&qword_2568A9048);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v6);
  sub_237F171FC(v0, v0[3]);
  sub_237F194F0();
  sub_237F1BB9C();
  UnknownStorage.init()();
  *v2 = URL.absoluteString.getter();
  v2[1] = v7;
  v8 = (int *)type metadata accessor for Asset.ID(0);
  v9 = (_QWORD *)((char *)v0 + v8[5]);
  v11 = *v9;
  v10 = v9[1];
  v2[2] = v11;
  v2[3] = v10;
  v12 = (_QWORD *)((char *)v0 + v8[6]);
  v13 = v12[1];
  v2[4] = *v12;
  v2[5] = v13;
  v14 = (_QWORD *)((char *)v3 + v8[7]);
  v15 = *v14;
  v16 = v14[1];
  v2[6] = *v14;
  v2[7] = v16;
  swift_bridgeObjectRetain();
  sub_237F1BCF4();
  sub_237F17134(v15, v16);
  sub_237F173F0(&qword_2568A9038, type metadata accessor for CloudAssets_Asset.ID, (uint64_t)&unk_237F5E9A8);
  sub_237F1BAE0();
  sub_237F1BA90();
  if (!v1)
  {
    sub_237F1BCD4();
    sub_237F1BB54();
    sub_237F1BA74();
  }
  sub_237F1BB40();
  sub_237F1BD0C();
  sub_237F1B978();
}

uint64_t Asset.ID.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;

  v1 = sub_237F18100();
  sub_237F173F0(&qword_2568A8F78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  dispatch thunk of Hashable.hash(into:)();
  type metadata accessor for Asset.ID(0);
  sub_237F1BD2C();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(v0 + *(int *)(v1 + 24));
  sub_237F1BB28();
  sub_237F1BC78();
  sub_237F1BBE8(v2);
  v3 = (uint64_t *)(v0 + *(int *)(v1 + 28));
  v4 = *v3;
  v5 = v3[1];
  sub_237F1BBF0(*v3);
  Data.hash(into:)();
  return sub_237F1BA40(v4, v5);
}

void static Asset.ID.== infix(_:_:)()
{
  sub_237F1BD54();
}

void sub_237F18DCC(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  if ((a1 & 1) != 0)
  {
    v1 = type metadata accessor for Asset.ID(0);
    sub_237F1BAA8(v1);
    v4 = v4 && v2 == v3;
    if (v4 || (sub_237F1BD24() & 1) != 0)
      sub_237F1BA14();
  }
  sub_237F1BA50();
}

void Asset.ID.hashValue.getter()
{
  sub_237F1BA84();
  Asset.ID.hash(into:)();
  sub_237F1BBC8();
  sub_237F1BBBC();
}

Swift::Int sub_237F18E50()
{
  Hasher.init(_seed:)();
  Asset.ID.hash(into:)();
  return Hasher._finalize()();
}

void sub_237F18E88()
{
  Asset.ID.init(from:)();
}

void sub_237F18E9C()
{
  Asset.ID.encode(to:)();
}

double Asset.Protector.Builder.__allocating_init(securityKey:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  double result;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  result = 0.0;
  *(_OWORD *)(v4 + 32) = xmmword_237F5CEA0;
  return result;
}

uint64_t Asset.Protector.Builder.init(securityKey:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  *(_OWORD *)(v2 + 32) = xmmword_237F5CEA0;
  return v2;
}

uint64_t Asset.Protector.Builder.setPrivacyKey(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  sub_237F17134(a1, a2);
  sub_237F1BB90();
  return sub_237F1BB10();
}

uint64_t Asset.Protector.Builder.build()@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v2 = v1[2];
  v3 = v1[3];
  v4 = v1[4];
  v5 = v1[5];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  sub_237F17134(v2, v3);
  v6 = sub_237F1BA5C();
  return sub_237F17134(v6, v7);
}

uint64_t Asset.Protector.Builder.deinit()
{
  uint64_t v0;

  sub_237F17178(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  sub_237F17178(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  return v0;
}

uint64_t Asset.Protector.Builder.__deallocating_deinit()
{
  Asset.Protector.Builder.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_237F18FB4()
{
  sub_237F195E0();
  return CodingKey.description.getter();
}

uint64_t sub_237F18FDC()
{
  sub_237F195E0();
  return CodingKey.debugDescription.getter();
}

void Asset.Protector.securityKey.getter()
{
  sub_237F1BA68();
  sub_237F1BA5C();
  sub_237F18140();
}

void Asset.Protector.privacyKey.getter()
{
  sub_237F1BA68();
  sub_237F1BA5C();
  sub_237F18140();
}

uint64_t Asset.Protector.init(securityKey:privacyKey:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

void Asset.Protector.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t *v6;
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
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  _QWORD *v22;

  sub_237F1B9D4();
  v5 = v4;
  v21 = v6;
  type metadata accessor for BinaryDecodingOptions();
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v7);
  v9 = sub_237F1B9B4(v8, v20);
  type metadata accessor for CloudAssets_Asset.Protector(v9);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v10);
  sub_237F1BA28();
  v11 = sub_237F171BC(&qword_2568A9058);
  sub_237F1BBF8();
  MEMORY[0x24BDAC7A8](v12);
  sub_237F1BC2C();
  sub_237F171FC(v5, v5[3]);
  sub_237F195E0();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    v19 = (uint64_t)v5;
  }
  else
  {
    v22 = v5;
    v13 = v3;
    v14 = v2;
    sub_237F1952C();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    sub_237F1BBD0();
    BinaryDecodingOptions.init()();
    sub_237F173F0(&qword_2568A9068, type metadata accessor for CloudAssets_Asset.Protector, (uint64_t)&unk_237F5E930);
    sub_237F1BD60();
    v15 = *v2;
    v16 = v2[1];
    v18 = v2[2];
    v17 = v2[3];
    sub_237F1BBE0(*v14);
    sub_237F17134(v18, v17);
    sub_237F1A3D8((uint64_t)v14, type metadata accessor for CloudAssets_Asset.Protector);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v0, v11);
    *v21 = v15;
    v21[1] = v16;
    v21[2] = v18;
    v21[3] = v17;
    v19 = (uint64_t)v22;
  }
  sub_237F172A0(v19);
  sub_237F1B978();
}

void Asset.Protector.encode(to:)()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  sub_237F1B9D4();
  v5 = v4;
  type metadata accessor for CloudAssets_Asset.Protector(0);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v6);
  sub_237F1B99C();
  v13 = sub_237F171BC(&qword_2568A9070);
  v12 = *(_QWORD *)(v13 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v7);
  sub_237F1BC2C();
  v9 = *v1;
  v8 = v1[1];
  v10 = v1[2];
  v11 = v1[3];
  sub_237F171FC(v5, v5[3]);
  sub_237F195E0();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  UnknownStorage.init()();
  *v3 = v9;
  v3[1] = v8;
  v3[2] = v10;
  v3[3] = v11;
  sub_237F17134(v9, v8);
  sub_237F17134(v10, v11);
  sub_237F173F0(&qword_2568A9068, type metadata accessor for CloudAssets_Asset.Protector, (uint64_t)&unk_237F5E930);
  Message.serializedData(partial:)();
  sub_237F1A3D8((uint64_t)v3, type metadata accessor for CloudAssets_Asset.Protector);
  if (!v2)
  {
    sub_237F1BCD4();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    sub_237F1BA74();
  }
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v0, v13);
  sub_237F1BD0C();
  sub_237F1B978();
}

uint64_t Asset.Protector.hash(into:)()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  sub_237F1BCE8();
  sub_237F1BCA8();
  sub_237F1BCDC();
  sub_237F17134(v2, v1);
  Data.hash(into:)();
  return sub_237F1BA40(v2, v1);
}

void static Asset.Protector.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if ((MEMORY[0x23B8279F0](*a1, a1[1], *a2, a2[1]) & 1) != 0)
    sub_237F1BB1C();
  sub_237F1BA50();
}

uint64_t type metadata accessor for Asset.ID(uint64_t a1)
{
  return sub_237F1B2B4(a1, (uint64_t *)&unk_2568A90C0);
}

uint64_t type metadata accessor for Asset(uint64_t a1)
{
  return sub_237F1B2B4(a1, (uint64_t *)&unk_2568A90B0);
}

unint64_t sub_237F194B4()
{
  unint64_t result;

  result = qword_2568A9010;
  if (!qword_2568A9010)
  {
    result = MEMORY[0x23B82832C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2568A9010);
  }
  return result;
}

unint64_t sub_237F194F0()
{
  unint64_t result;

  result = qword_2568A9028;
  if (!qword_2568A9028)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D4A4, &unk_2509CC768);
    atomic_store(result, (unint64_t *)&qword_2568A9028);
  }
  return result;
}

unint64_t sub_237F1952C()
{
  unint64_t result;

  result = qword_2568A9030;
  if (!qword_2568A9030)
  {
    result = MEMORY[0x23B82832C](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2568A9030);
  }
  return result;
}

unint64_t sub_237F19568()
{
  unint64_t result;

  result = qword_2568A9040;
  if (!qword_2568A9040)
  {
    result = MEMORY[0x23B82832C](&unk_237F5FEE4, &type metadata for AssetManager.AssetError);
    atomic_store(result, (unint64_t *)&qword_2568A9040);
  }
  return result;
}

unint64_t sub_237F195A4()
{
  unint64_t result;

  result = qword_2568A9050;
  if (!qword_2568A9050)
  {
    result = MEMORY[0x23B82832C](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2568A9050);
  }
  return result;
}

unint64_t sub_237F195E0()
{
  unint64_t result;

  result = qword_2568A9060;
  if (!qword_2568A9060)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D454, &unk_2509CC7F8);
    atomic_store(result, (unint64_t *)&qword_2568A9060);
  }
  return result;
}

Swift::Int Asset.Protector.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = *v0;
  v3 = v0[2];
  v2 = v0[3];
  sub_237F1BA84();
  sub_237F1BBF0(v1);
  Data.hash(into:)();
  sub_237F1BB90();
  sub_237F17134(v3, v2);
  Data.hash(into:)();
  sub_237F17178(v3, v2);
  return sub_237F1BBC8();
}

void sub_237F19698()
{
  Swift::UInt v0;

  v0 = sub_237F1BC5C();
  Hasher._combine(_:)(v0);
}

uint64_t sub_237F196B8(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6675626F746F7270 && a2 == 0xEC00000061746144)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_237F1BD24();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_237F19750()
{
  sub_237F1BA84();
  sub_237F1BD6C();
  sub_237F1BBC8();
  sub_237F1BBBC();
}

Swift::Int sub_237F1977C()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v1 = *v0;
  v2 = v0[1];
  v4 = v0[2];
  v3 = v0[3];
  Hasher.init(_seed:)();
  sub_237F17134(v1, v2);
  Data.hash(into:)();
  sub_237F17178(v1, v2);
  sub_237F17134(v4, v3);
  Data.hash(into:)();
  sub_237F17178(v4, v3);
  return Hasher._finalize()();
}

void sub_237F1980C()
{
  Asset.Protector.init(from:)();
}

void sub_237F19820()
{
  Asset.Protector.encode(to:)();
}

void sub_237F19838()
{
  Hasher.init(_seed:)();
  sub_237F1BD6C();
  sub_237F1BBC8();
  sub_237F1BBBC();
}

uint64_t sub_237F19860@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result;

  result = sub_237F196B8(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_237F1988C()
{
  sub_237F19F98();
  return CodingKey.description.getter();
}

uint64_t sub_237F198B4()
{
  sub_237F19F98();
  return CodingKey.debugDescription.getter();
}

void Asset.id.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_237F19900(v1, a1, type metadata accessor for Asset.ID);
}

void sub_237F19900(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = sub_237F1BC68(a1, a2, a3);
  sub_237F1BAC8(v3);
  sub_237F18140();
}

uint64_t Asset.protector.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  type metadata accessor for Asset(0);
  sub_237F1BC08();
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  *a1 = *v2;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  sub_237F17134(v3, v4);
  return sub_237F17134(v5, v6);
}

uint64_t Asset.size.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(sub_237F1815C() + 24));
}

void sub_237F19988()
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
  int *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
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
  uint64_t *v46;

  sub_237F1B9D4();
  v45 = v4;
  v6 = v5;
  sub_237F171BC(&qword_2568A9130);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v7);
  sub_237F180DC();
  v43 = v8;
  v42 = type metadata accessor for CloudAssets_Asset.Protector(0);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v9);
  sub_237F180DC();
  v44 = v10;
  sub_237F171BC(&qword_2568A9018);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v11);
  sub_237F1BA28();
  v12 = type metadata accessor for URL();
  v40 = *(_QWORD *)(v12 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v13);
  sub_237F180DC();
  v41 = v14;
  sub_237F171BC(&qword_2568A9128);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v15);
  sub_237F1BC44();
  v16 = type metadata accessor for CloudAssets_Asset.ID(0);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v17);
  v18 = sub_237F1BB74();
  v19 = (int *)type metadata accessor for Asset.ID(v18);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v20);
  sub_237F1B99C();
  v39 = type metadata accessor for CloudAssets_Asset(0);
  v46 = (uint64_t *)v6;
  sub_237F1B938(v6 + *(int *)(v39 + 24), v0, &qword_2568A9128);
  if (_s10CloudAsset21UploadResponseMessageOwet_0(v0, 1, v16) == 1)
  {
    *(_QWORD *)v2 = 0;
    *(_QWORD *)(v2 + 8) = 0xE000000000000000;
    *(_QWORD *)(v2 + 16) = 0;
    *(_QWORD *)(v2 + 24) = 0xE000000000000000;
    *(_OWORD *)(v2 + 32) = xmmword_237F5CEA0;
    *(_OWORD *)(v2 + 48) = xmmword_237F5CEA0;
    UnknownStorage.init()();
    sub_237F1B910(v0, &qword_2568A9128);
  }
  else
  {
    sub_237F19FD4(v0, v2, type metadata accessor for CloudAssets_Asset.ID);
  }
  URL.init(string:)();
  if (_s10CloudAsset21UploadResponseMessageOwet_0(v3, 1, v12) == 1)
  {
    sub_237F1B910(v3, &qword_2568A9018);
    sub_237F19568();
    sub_237F1BD00();
    swift_willThrow();
    sub_237F1A3D8(v2, type metadata accessor for CloudAssets_Asset.ID);
    sub_237F1A3D8(v6, type metadata accessor for CloudAssets_Asset);
  }
  else
  {
    v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32);
    v21(v41, v3, v12);
    v21(v1, v41, v12);
    v22 = *(_QWORD *)(v2 + 24);
    v23 = (_QWORD *)(v1 + v19[5]);
    *v23 = *(_QWORD *)(v2 + 16);
    v23[1] = v22;
    v25 = *(_QWORD *)(v2 + 32);
    v24 = *(_QWORD *)(v2 + 40);
    v26 = (uint64_t *)(v1 + v19[6]);
    *v26 = v25;
    v26[1] = v24;
    v27 = *(_QWORD *)(v2 + 48);
    v28 = *(_QWORD *)(v2 + 56);
    swift_bridgeObjectRetain();
    sub_237F17134(v25, v24);
    sub_237F1BBE0(v27);
    sub_237F1A3D8(v2, type metadata accessor for CloudAssets_Asset.ID);
    v29 = (uint64_t *)(v1 + v19[7]);
    *v29 = v27;
    v29[1] = v28;
    sub_237F19FD4(v1, v45, type metadata accessor for Asset.ID);
    sub_237F1B938((uint64_t)v46 + *(int *)(v39 + 28), v43, &qword_2568A9130);
    if (_s10CloudAsset21UploadResponseMessageOwet_0(v43, 1, v42) == 1)
    {
      *(_OWORD *)v44 = xmmword_237F5CEA0;
      *(_OWORD *)(v44 + 16) = xmmword_237F5CEA0;
      UnknownStorage.init()();
      sub_237F1B910(v43, &qword_2568A9130);
    }
    else
    {
      sub_237F19FD4(v43, v44, type metadata accessor for CloudAssets_Asset.Protector);
    }
    v30 = *(_QWORD *)v44;
    v31 = *(_QWORD *)(v44 + 8);
    v32 = *(_QWORD *)(v44 + 16);
    v33 = *(_QWORD *)(v44 + 24);
    v34 = sub_237F1BA5C();
    sub_237F17134(v34, v35);
    sub_237F1BBE0(v32);
    sub_237F1A3D8(v44, type metadata accessor for CloudAssets_Asset.Protector);
    v36 = type metadata accessor for Asset(0);
    v37 = (_QWORD *)(v45 + *(int *)(v36 + 20));
    *v37 = v30;
    v37[1] = v31;
    v37[2] = v32;
    v37[3] = v33;
    v38 = *v46;
    sub_237F1A3D8((uint64_t)v46, type metadata accessor for CloudAssets_Asset);
    *(_QWORD *)(v45 + *(int *)(v36 + 24)) = v38;
  }
  sub_237F1B978();
}

__n128 Asset.init(id:protector:size:)@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  unint64_t v7;
  __n128 result;
  __n128 *v9;
  uint64_t v10;
  __n128 v11;

  v11 = *a2;
  v6 = a2[1].n128_u64[0];
  v7 = a2[1].n128_u64[1];
  sub_237F19FD4(a1, a4, type metadata accessor for Asset.ID);
  type metadata accessor for Asset(0);
  sub_237F1BC08();
  result = v11;
  *v9 = v11;
  v9[1].n128_u64[0] = v6;
  v9[1].n128_u64[1] = v7;
  *(_QWORD *)(a4 + *(int *)(v10 + 24)) = a3;
  return result;
}

void Asset.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
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

  sub_237F1B9D4();
  v5 = v4;
  v16 = v6;
  type metadata accessor for BinaryDecodingOptions();
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v7);
  v9 = sub_237F1B9B4(v8, v15);
  type metadata accessor for CloudAssets_Asset(v9);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v10);
  v11 = sub_237F1BB74();
  type metadata accessor for Asset(v11);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v12);
  sub_237F1BA28();
  v13 = sub_237F171BC(&qword_2568A9078);
  sub_237F1BBF8();
  MEMORY[0x24BDAC7A8](v14);
  sub_237F1BC44();
  sub_237F171FC(v5, v5[3]);
  sub_237F19F98();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v0)
  {
    sub_237F1952C();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    sub_237F1BBD0();
    BinaryDecodingOptions.init()();
    sub_237F173F0(&qword_2568A9088, type metadata accessor for CloudAssets_Asset, (uint64_t)&unk_237F5E8B8);
    Message.init(serializedData:extensions:partial:options:)();
    sub_237F19988();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v13);
    sub_237F19FD4(v2, v16, type metadata accessor for Asset);
  }
  sub_237F172A0((uint64_t)v5);
  sub_237F1BD0C();
  sub_237F1B978();
}

unint64_t sub_237F19F98()
{
  unint64_t result;

  result = qword_2568A9080;
  if (!qword_2568A9080)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D404, &unk_2509CC6D8);
    atomic_store(result, (unint64_t *)&qword_2568A9080);
  }
  return result;
}

void sub_237F19FD4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = sub_237F1BC68(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v3, v4, v5);
  sub_237F18140();
}

void sub_237F1A008(_QWORD *a1@<X8>)
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
  uint64_t *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;

  v44 = a1;
  v47 = type metadata accessor for CloudAssets_Asset.Protector(0);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v2);
  sub_237F1BD40();
  v45 = v3;
  MEMORY[0x24BDAC7A8](v4);
  v46 = (_QWORD *)((char *)v39 - v5);
  v6 = sub_237F1BBB0();
  v40 = type metadata accessor for CloudAssets_Asset.ID(v6);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v7);
  sub_237F1BD40();
  v43 = v8;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (_QWORD *)((char *)v39 - v10);
  UnknownStorage.init()();
  *v11 = URL.absoluteString.getter();
  v11[1] = v12;
  v13 = (int *)type metadata accessor for Asset.ID(0);
  v14 = v1;
  v15 = (uint64_t *)(v1 + v13[5]);
  v16 = v15[1];
  v11[2] = *v15;
  v11[3] = v16;
  v17 = (uint64_t *)(v14 + v13[6]);
  v19 = *v17;
  v18 = v17[1];
  v11[4] = *v17;
  v11[5] = v18;
  v20 = (uint64_t *)(v14 + v13[7]);
  v21 = v14;
  v42 = v14;
  v22 = *v20;
  v23 = v20[1];
  v11[6] = *v20;
  v11[7] = v23;
  v41 = sub_237F1815C();
  v24 = (uint64_t *)(v21 + *(int *)(v41 + 20));
  v25 = *v24;
  v26 = v24[1];
  v27 = v24[2];
  v28 = v24[3];
  v39[1] = (char *)v46 + *(int *)(v47 + 24);
  swift_bridgeObjectRetain();
  sub_237F1BBF0(v19);
  sub_237F17134(v22, v23);
  sub_237F1BCA0(v25);
  sub_237F1BB68();
  UnknownStorage.init()();
  v29 = v46;
  *v46 = v25;
  v29[1] = v26;
  v29[2] = v27;
  v29[3] = v28;
  sub_237F1BCA0(v25);
  sub_237F1BB68();
  sub_237F1BC98(v25);
  sub_237F1BD18();
  v30 = v44;
  *v44 = 0;
  v31 = type metadata accessor for CloudAssets_Asset(0);
  UnknownStorage.init()();
  v32 = (uint64_t)v30 + *(int *)(v31 + 24);
  v33 = v40;
  _s10CloudAsset21UploadResponseMessageOwst_0(v32, 1, 1, v40);
  v34 = (uint64_t)v30 + *(int *)(v31 + 28);
  v35 = v47;
  _s10CloudAsset21UploadResponseMessageOwst_0(v34, 1, 1, v47);
  v36 = v43;
  sub_237F19900((uint64_t)v11, v43, type metadata accessor for CloudAssets_Asset.ID);
  sub_237F1B910(v32, &qword_2568A9128);
  sub_237F19FD4(v36, v32, type metadata accessor for CloudAssets_Asset.ID);
  _s10CloudAsset21UploadResponseMessageOwst_0(v32, 0, 1, v33);
  v37 = v45;
  sub_237F19900((uint64_t)v29, v45, type metadata accessor for CloudAssets_Asset.Protector);
  sub_237F1B910(v34, &qword_2568A9130);
  sub_237F19FD4(v37, v34, type metadata accessor for CloudAssets_Asset.Protector);
  _s10CloudAsset21UploadResponseMessageOwst_0(v34, 0, 1, v35);
  v38 = *(_QWORD *)(v42 + *(int *)(v41 + 24));
  sub_237F1A3D8((uint64_t)v29, type metadata accessor for CloudAssets_Asset.Protector);
  sub_237F1A3D8((uint64_t)v11, type metadata accessor for CloudAssets_Asset.ID);
  *v30 = v38;
}

void Asset.encode(to:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_237F1B9D4();
  v3 = sub_237F1BC5C();
  type metadata accessor for CloudAssets_Asset(v3);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v4);
  sub_237F1B99C();
  sub_237F171BC(&qword_2568A9090);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v5);
  sub_237F171FC(v0, v0[3]);
  sub_237F19F98();
  sub_237F1BB9C();
  sub_237F1A008(v2);
  sub_237F173F0(&qword_2568A9088, type metadata accessor for CloudAssets_Asset, (uint64_t)&unk_237F5E8B8);
  sub_237F1BAE0();
  sub_237F1BA90();
  if (!v1)
  {
    sub_237F1BCD4();
    sub_237F1BB54();
    sub_237F1BA74();
  }
  sub_237F1BB40();
  sub_237F1BD0C();
  sub_237F1B978();
}

void sub_237F1A3D8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  sub_237F1BA00(v2);
  sub_237F18140();
}

void Asset.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  Asset.ID.hash(into:)();
  sub_237F1815C();
  sub_237F1BD2C();
  sub_237F1BB28();
  sub_237F1BC78();
  sub_237F1BBE8(v2);
  sub_237F1BCC8();
  Data.hash(into:)();
  sub_237F1BB34();
  Hasher._combine(_:)(*(_QWORD *)(v0 + *(int *)(v1 + 24)));
  sub_237F1B9EC();
}

Swift::Int Asset.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  sub_237F1BA84();
  Asset.ID.hash(into:)();
  v1 = sub_237F1815C();
  sub_237F1BC08();
  sub_237F1BCE8();
  sub_237F1BCA8();
  sub_237F1BCDC();
  sub_237F1BB68();
  Data.hash(into:)();
  sub_237F1BD18();
  Hasher._combine(_:)(*(_QWORD *)(v0 + *(int *)(v1 + 24)));
  return sub_237F1BBC8();
}

Swift::Int sub_237F1A500(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  Hasher.init(_seed:)();
  Asset.ID.hash(into:)();
  v4 = (uint64_t *)(v2 + *(int *)(a2 + 20));
  v5 = *v4;
  v6 = v4[1];
  v7 = v4[2];
  v8 = v4[3];
  sub_237F17134(*v4, v6);
  Data.hash(into:)();
  sub_237F17178(v5, v6);
  sub_237F17134(v7, v8);
  Data.hash(into:)();
  sub_237F17178(v7, v8);
  Hasher._combine(_:)(*(_QWORD *)(v2 + *(int *)(a2 + 24)));
  return Hasher._finalize()();
}

void sub_237F1A5BC()
{
  sub_237F173F0(&qword_2568A9098, type metadata accessor for Asset.ID, (uint64_t)&protocol conformance descriptor for Asset.ID);
}

unint64_t sub_237F1A5EC()
{
  unint64_t result;

  result = qword_2568A90A0;
  if (!qword_2568A90A0)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for Asset.Protector, &type metadata for Asset.Protector);
    atomic_store(result, (unint64_t *)&qword_2568A90A0);
  }
  return result;
}

void sub_237F1A628()
{
  sub_237F173F0(&qword_2568A90A8, type metadata accessor for Asset, (uint64_t)&protocol conformance descriptor for Asset);
}

void sub_237F1A654()
{
  Asset.init(from:)();
}

void sub_237F1A668()
{
  Asset.encode(to:)();
}

uint64_t *initializeBufferWithCopyOfBuffer for Asset(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v30 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v30 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for URL();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = (int *)type metadata accessor for Asset.ID(0);
    v9 = v8[5];
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = v8[6];
    v14 = (uint64_t *)((char *)a1 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = *v15;
    v17 = v15[1];
    swift_bridgeObjectRetain();
    sub_237F17134(v16, v17);
    *v14 = v16;
    v14[1] = v17;
    v18 = v8[7];
    v19 = (uint64_t *)((char *)a1 + v18);
    v20 = (uint64_t *)((char *)a2 + v18);
    v21 = *v20;
    v22 = v20[1];
    sub_237F17134(*v20, v22);
    *v19 = v21;
    v19[1] = v22;
    v23 = *(int *)(a3 + 20);
    v24 = (uint64_t *)((char *)a1 + v23);
    v25 = (char *)a2 + v23;
    v26 = *(uint64_t *)((char *)a2 + v23);
    v27 = *(uint64_t *)((char *)a2 + v23 + 8);
    sub_237F17134(v26, v27);
    *v24 = v26;
    v24[1] = v27;
    v28 = *((_QWORD *)v25 + 2);
    v29 = *((_QWORD *)v25 + 3);
    sub_237F17134(v28, v29);
    v24[2] = v28;
    v24[3] = v29;
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t destroy for Asset(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = type metadata accessor for Asset.ID(0);
  swift_bridgeObjectRelease();
  sub_237F17178(*(_QWORD *)(a1 + *(int *)(v5 + 24)), *(_QWORD *)(a1 + *(int *)(v5 + 24) + 8));
  sub_237F17178(*(_QWORD *)(a1 + *(int *)(v5 + 28)), *(_QWORD *)(a1 + *(int *)(v5 + 28) + 8));
  v6 = a1 + *(int *)(a2 + 20);
  sub_237F17178(*(_QWORD *)v6, *(_QWORD *)(v6 + 8));
  return sub_237F17178(*(_QWORD *)(v6 + 16), *(_QWORD *)(v6 + 24));
}

uint64_t initializeWithCopy for Asset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = (int *)type metadata accessor for Asset.ID(0);
  v8 = v7[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = v7[6];
  v13 = (uint64_t *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v15 = *v14;
  v16 = v14[1];
  swift_bridgeObjectRetain();
  sub_237F17134(v15, v16);
  *v13 = v15;
  v13[1] = v16;
  v17 = v7[7];
  v18 = (uint64_t *)(a1 + v17);
  v19 = (uint64_t *)(a2 + v17);
  v20 = *v19;
  v21 = v19[1];
  sub_237F17134(*v19, v21);
  *v18 = v20;
  v18[1] = v21;
  v22 = *(int *)(a3 + 20);
  v23 = (uint64_t *)(a1 + v22);
  v24 = a2 + v22;
  v25 = *(_QWORD *)(a2 + v22);
  v26 = *(_QWORD *)(a2 + v22 + 8);
  sub_237F17134(v25, v26);
  *v23 = v25;
  v23[1] = v26;
  v27 = *(_QWORD *)(v24 + 16);
  v28 = *(_QWORD *)(v24 + 24);
  sub_237F17134(v27, v28);
  v23[2] = v27;
  v23[3] = v28;
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithCopy for Asset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = (int *)type metadata accessor for Asset.ID(0);
  v8 = v7[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  *v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = v7[6];
  v12 = (uint64_t *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v14 = *v13;
  v15 = v13[1];
  sub_237F17134(*v13, v15);
  v16 = *v12;
  v17 = v12[1];
  *v12 = v14;
  v12[1] = v15;
  sub_237F17178(v16, v17);
  v18 = v7[7];
  v19 = (uint64_t *)(a1 + v18);
  v20 = (uint64_t *)(a2 + v18);
  v21 = *v20;
  v22 = v20[1];
  sub_237F17134(*v20, v22);
  v23 = *v19;
  v24 = v19[1];
  *v19 = v21;
  v19[1] = v22;
  sub_237F17178(v23, v24);
  v25 = *(int *)(a3 + 20);
  v26 = (uint64_t *)(a1 + v25);
  v27 = a2 + v25;
  v28 = *(_QWORD *)(a2 + v25);
  v29 = *(_QWORD *)(a2 + v25 + 8);
  sub_237F17134(v28, v29);
  v30 = *v26;
  v31 = v26[1];
  *v26 = v28;
  v26[1] = v29;
  sub_237F17178(v30, v31);
  v32 = *(_QWORD *)(v27 + 16);
  v33 = *(_QWORD *)(v27 + 24);
  sub_237F17134(v32, v33);
  v34 = v26[2];
  v35 = v26[3];
  v26[2] = v32;
  v26[3] = v33;
  sub_237F17178(v34, v35);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for Asset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = (int *)type metadata accessor for Asset.ID(0);
  *(_OWORD *)(a1 + v7[5]) = *(_OWORD *)(a2 + v7[5]);
  *(_OWORD *)(a1 + v7[6]) = *(_OWORD *)(a2 + v7[6]);
  *(_OWORD *)(a1 + v7[7]) = *(_OWORD *)(a2 + v7[7]);
  v8 = *(int *)(a3 + 20);
  v9 = *(int *)(a3 + 24);
  v10 = (_OWORD *)(a1 + v8);
  v11 = (_OWORD *)(a2 + v8);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  *(_QWORD *)(a1 + v9) = *(_QWORD *)(a2 + v9);
  return a1;
}

uint64_t assignWithTake for Asset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = (int *)type metadata accessor for Asset.ID(0);
  v8 = v7[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v12 = *v10;
  v11 = v10[1];
  *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  v13 = v7[6];
  v14 = *(_QWORD *)(a1 + v13);
  v15 = *(_QWORD *)(a1 + v13 + 8);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  sub_237F17178(v14, v15);
  v16 = v7[7];
  v17 = *(_QWORD *)(a1 + v16);
  v18 = *(_QWORD *)(a1 + v16 + 8);
  *(_OWORD *)(a1 + v16) = *(_OWORD *)(a2 + v16);
  sub_237F17178(v17, v18);
  v19 = *(int *)(a3 + 20);
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = *(_QWORD *)(a1 + v19);
  v23 = *(_QWORD *)(a1 + v19 + 8);
  *(_OWORD *)(a1 + v19) = *(_OWORD *)(a2 + v19);
  sub_237F17178(v22, v23);
  v24 = *(_QWORD *)(v20 + 16);
  v25 = *(_QWORD *)(v20 + 24);
  *(_OWORD *)(v20 + 16) = *(_OWORD *)(v21 + 16);
  sub_237F17178(v24, v25);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for Asset()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_237F1AC0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Asset.ID(0);
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == (_DWORD)a2)
    sub_237F1BAF8(a1, a2, v4);
  else
    sub_237F1BA50();
}

uint64_t storeEnumTagSinglePayload for Asset()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_237F1AC94(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v8 = sub_237F1BC5C();
  if (*(_DWORD *)(*(_QWORD *)(type metadata accessor for Asset.ID(v8) - 8) + 84) == a3)
  {
    v9 = sub_237F1BCB4();
    sub_237F1BB04(v9, v10, v11, v12);
  }
  else
  {
    v13 = (_QWORD *)(v4 + *(int *)(a4 + 20));
    *v13 = 0;
    v13[1] = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    sub_237F1BA50();
  }
}

uint64_t sub_237F1ACF8()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Asset.ID(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Asset.ID(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for URL();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (uint64_t *)((char *)a1 + v9);
    v14 = *(uint64_t *)((char *)a2 + v9);
    v15 = *(uint64_t *)((char *)a2 + v9 + 8);
    swift_bridgeObjectRetain();
    sub_237F17134(v14, v15);
    *v13 = v14;
    v13[1] = v15;
    v16 = a3[7];
    v17 = (uint64_t *)((char *)a1 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = *v18;
    v20 = v18[1];
    sub_237F17134(*v18, v20);
    *v17 = v19;
    v17[1] = v20;
  }
  return a1;
}

uint64_t destroy for Asset.ID(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  sub_237F17178(*(_QWORD *)(a1 + *(int *)(a2 + 24)), *(_QWORD *)(a1 + *(int *)(a2 + 24) + 8));
  return sub_237F17178(*(_QWORD *)(a1 + *(int *)(a2 + 28)), *(_QWORD *)(a1 + *(int *)(a2 + 28) + 8));
}

uint64_t initializeWithCopy for Asset.ID(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (uint64_t *)(a1 + v8);
  v13 = *(_QWORD *)(a2 + v8);
  v14 = *(_QWORD *)(a2 + v8 + 8);
  swift_bridgeObjectRetain();
  sub_237F17134(v13, v14);
  *v12 = v13;
  v12[1] = v14;
  v15 = a3[7];
  v16 = (uint64_t *)(a1 + v15);
  v17 = (uint64_t *)(a2 + v15);
  v18 = *v17;
  v19 = v17[1];
  sub_237F17134(*v17, v19);
  *v16 = v18;
  v16[1] = v19;
  return a1;
}

uint64_t assignWithCopy for Asset.ID(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[6];
  v11 = (uint64_t *)(a1 + v10);
  v12 = (uint64_t *)(a2 + v10);
  v13 = *v12;
  v14 = v12[1];
  sub_237F17134(*v12, v14);
  v15 = *v11;
  v16 = v11[1];
  *v11 = v13;
  v11[1] = v14;
  sub_237F17178(v15, v16);
  v17 = a3[7];
  v18 = (uint64_t *)(a1 + v17);
  v19 = (uint64_t *)(a2 + v17);
  v20 = *v19;
  v21 = v19[1];
  sub_237F17134(*v19, v21);
  v22 = *v18;
  v23 = v18[1];
  *v18 = v20;
  v18[1] = v21;
  sub_237F17178(v22, v23);
  return a1;
}

uint64_t initializeWithTake for Asset.ID(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for Asset.ID(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[6];
  v13 = *(_QWORD *)(a1 + v12);
  v14 = *(_QWORD *)(a1 + v12 + 8);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  sub_237F17178(v13, v14);
  v15 = a3[7];
  v16 = *(_QWORD *)(a1 + v15);
  v17 = *(_QWORD *)(a1 + v15 + 8);
  *(_OWORD *)(a1 + v15) = *(_OWORD *)(a2 + v15);
  sub_237F17178(v16, v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for Asset.ID()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_237F1B150(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237F18100();
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == (_DWORD)a2)
    sub_237F1BAF8(a1, a2, v4);
  else
    sub_237F1BA50();
}

uint64_t storeEnumTagSinglePayload for Asset.ID()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_237F1B1C4(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_DWORD *)(*(_QWORD *)(sub_237F18100() - 8) + 84) == a3)
  {
    v7 = sub_237F1BCB4();
    sub_237F1BB04(v7, v8, v9, v10);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
    sub_237F1BA50();
  }
}

uint64_t sub_237F1B21C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_237F1B298()
{
  return type metadata accessor for Asset.ID.Builder(0);
}

uint64_t type metadata accessor for Asset.ID.Builder(uint64_t a1)
{
  return sub_237F1B2B4(a1, (uint64_t *)&unk_2568A90D0);
}

uint64_t sub_237F1B2B4(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237F1B2E4()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for Asset.ID.Builder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Asset.ID.Builder.__allocating_init(partition:ownerID:signature:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t initializeBufferWithCopyOfBuffer for Asset.Protector(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for Asset.Protector(uint64_t a1)
{
  sub_237F17178(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return sub_237F17178(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t *initializeWithCopy for Asset.Protector(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  sub_237F17134(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  v7 = a2[2];
  v6 = a2[3];
  sub_237F17134(v7, v6);
  a1[2] = v7;
  a1[3] = v6;
  return a1;
}

uint64_t *assignWithCopy for Asset.Protector(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v4 = *a2;
  v5 = a2[1];
  sub_237F17134(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_237F17178(v6, v7);
  v9 = a2[2];
  v8 = a2[3];
  sub_237F17134(v9, v8);
  v10 = a1[2];
  v11 = a1[3];
  a1[2] = v9;
  a1[3] = v8;
  sub_237F17178(v10, v11);
  return a1;
}

__n128 initializeWithTake for Asset.Protector(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t *assignWithTake for Asset.Protector(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *a1;
  v5 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_237F17178(v4, v5);
  v6 = a1[2];
  v7 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_237F17178(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for Asset.Protector(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0xD && *(_BYTE *)(a1 + 32))
    {
      v2 = *(_DWORD *)a1 + 12;
    }
    else
    {
      v2 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xC)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for Asset.Protector(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 13;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

void type metadata accessor for Asset.Protector()
{
  sub_237F1BC90();
}

uint64_t type metadata accessor for Asset.Protector.Builder()
{
  return objc_opt_self();
}

uint64_t method lookup function for Asset.Protector.Builder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Asset.Protector.Builder.__allocating_init(securityKey:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_237F1B5C8()
{
  return 0;
}

void type metadata accessor for Asset.CodingKeys()
{
  sub_237F1BC90();
}

void type metadata accessor for Asset.Protector.CodingKeys()
{
  sub_237F1BC90();
}

uint64_t getEnumTagSinglePayload for AssetSkeleton.CodingKeys(unsigned int *a1, int a2)
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

uint64_t sub_237F1B638(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_237F1B678 + 4 * byte_237F5CEB0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_237F1B698 + 4 * byte_237F5CEB5[v4]))();
}

_BYTE *sub_237F1B678(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_237F1B698(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F1B6A0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F1B6A8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F1B6B0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F1B6B8(_DWORD *result)
{
  *result = 0;
  return result;
}

void type metadata accessor for Asset.ID.CodingKeys()
{
  sub_237F1BC90();
}

unint64_t sub_237F1B6D4()
{
  unint64_t result;

  result = qword_2568A90E0;
  if (!qword_2568A90E0)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D26C, &unk_2509CC768);
    atomic_store(result, (unint64_t *)&qword_2568A90E0);
  }
  return result;
}

unint64_t sub_237F1B714()
{
  unint64_t result;

  result = qword_2568A90E8;
  if (!qword_2568A90E8)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D324, &unk_2509CC7F8);
    atomic_store(result, (unint64_t *)&qword_2568A90E8);
  }
  return result;
}

unint64_t sub_237F1B754()
{
  unint64_t result;

  result = qword_2568A90F0;
  if (!qword_2568A90F0)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D3DC, &unk_2509CC6D8);
    atomic_store(result, (unint64_t *)&qword_2568A90F0);
  }
  return result;
}

unint64_t sub_237F1B794()
{
  unint64_t result;

  result = qword_2568A90F8;
  if (!qword_2568A90F8)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D34C, &unk_2509CC6D8);
    atomic_store(result, (unint64_t *)&qword_2568A90F8);
  }
  return result;
}

unint64_t sub_237F1B7D4()
{
  unint64_t result;

  result = qword_2568A9100;
  if (!qword_2568A9100)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D374, &unk_2509CC6D8);
    atomic_store(result, (unint64_t *)&qword_2568A9100);
  }
  return result;
}

unint64_t sub_237F1B814()
{
  unint64_t result;

  result = qword_2568A9108;
  if (!qword_2568A9108)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D294, &unk_2509CC7F8);
    atomic_store(result, (unint64_t *)&qword_2568A9108);
  }
  return result;
}

unint64_t sub_237F1B854()
{
  unint64_t result;

  result = qword_2568A9110;
  if (!qword_2568A9110)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D2BC, &unk_2509CC7F8);
    atomic_store(result, (unint64_t *)&qword_2568A9110);
  }
  return result;
}

unint64_t sub_237F1B894()
{
  unint64_t result;

  result = qword_2568A9118;
  if (!qword_2568A9118)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D1DC, &unk_2509CC768);
    atomic_store(result, (unint64_t *)&qword_2568A9118);
  }
  return result;
}

unint64_t sub_237F1B8D4()
{
  unint64_t result;

  result = qword_2568A9120;
  if (!qword_2568A9120)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D204, &unk_2509CC768);
    atomic_store(result, (unint64_t *)&qword_2568A9120);
  }
  return result;
}

void sub_237F1B910(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = sub_237F171BC(a2);
  sub_237F1BA00(v2);
  sub_237F18140();
}

void sub_237F1B938(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_237F171BC(a3);
  sub_237F1BAC8(v3);
  sub_237F18140();
}

uint64_t sub_237F1B9B4@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return 0;
}

uint64_t sub_237F1BA00(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

void sub_237F1BA14()
{
  JUMPOUT(0x23B8279F0);
}

uint64_t sub_237F1BA40(uint64_t a1, unint64_t a2)
{
  return sub_237F17178(a1, a2);
}

uint64_t sub_237F1BA5C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F1BA68()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F17134(v0, v1);
}

uint64_t sub_237F1BA74()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F17178(v0, v1);
}

uint64_t sub_237F1BA84()
{
  return Hasher.init(_seed:)();
}

void sub_237F1BA90()
{
  uint64_t (*v0)(_QWORD);
  uint64_t v1;

  sub_237F1A3D8(v1, v0);
}

uint64_t sub_237F1BAA8(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 20));
}

uint64_t sub_237F1BAC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t sub_237F1BAE0()
{
  return Message.serializedData(partial:)();
}

uint64_t sub_237F1BAF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s10CloudAsset21UploadResponseMessageOwet_0(a1, a2, a3);
}

uint64_t sub_237F1BB04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s10CloudAsset21UploadResponseMessageOwst_0(a1, a2, a3, a4);
}

uint64_t sub_237F1BB10()
{
  return swift_retain();
}

void sub_237F1BB1C()
{
  JUMPOUT(0x23B8279F0);
}

uint64_t sub_237F1BB28()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F17134(v0, v1);
}

uint64_t sub_237F1BB34()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F17178(v0, v1);
}

uint64_t sub_237F1BB40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 72) + 8))(v1, v0);
}

uint64_t sub_237F1BB54()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_237F1BB68()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F17134(v0, v1);
}

uint64_t sub_237F1BB74()
{
  return 0;
}

uint64_t sub_237F1BB90()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F17178(v0, v1);
}

uint64_t sub_237F1BB9C()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t sub_237F1BBB0()
{
  return 0;
}

Swift::Int sub_237F1BBC8()
{
  return Hasher._finalize()();
}

double sub_237F1BBD0()
{
  uint64_t v0;
  double result;

  *(_QWORD *)(v0 - 112) = 0;
  result = 0.0;
  *(_OWORD *)(v0 - 144) = 0u;
  *(_OWORD *)(v0 - 128) = 0u;
  return result;
}

uint64_t sub_237F1BBE0(uint64_t a1)
{
  unint64_t v1;

  return sub_237F17134(a1, v1);
}

uint64_t sub_237F1BBE8(uint64_t a1)
{
  unint64_t v1;

  return sub_237F17178(a1, v1);
}

uint64_t sub_237F1BBF0(uint64_t a1)
{
  unint64_t v1;

  return sub_237F17134(a1, v1);
}

uint64_t sub_237F1BC5C()
{
  return 0;
}

uint64_t sub_237F1BC68(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t sub_237F1BC78()
{
  return Data.hash(into:)();
}

void sub_237F1BC88(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_237F1A3D8(a1, v1);
}

uint64_t sub_237F1BC98(uint64_t a1)
{
  unint64_t v1;

  return sub_237F17178(a1, v1);
}

uint64_t sub_237F1BCA0(uint64_t a1)
{
  unint64_t v1;

  return sub_237F17134(a1, v1);
}

uint64_t sub_237F1BCA8()
{
  return Data.hash(into:)();
}

uint64_t sub_237F1BCB4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F1BCC8()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F17134(v0, v1);
}

unint64_t sub_237F1BCD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = v0;
  *(_QWORD *)(v2 - 88) = v1;
  return sub_237F195A4();
}

uint64_t sub_237F1BCDC()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F17178(v0, v1);
}

uint64_t sub_237F1BCE8()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F17134(v0, v1);
}

uint64_t sub_237F1BCF4()
{
  unint64_t v0;
  uint64_t v1;

  return sub_237F17134(v1, v0);
}

uint64_t sub_237F1BD00()
{
  return swift_allocError();
}

uint64_t sub_237F1BD18()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F17178(v0, v1);
}

uint64_t sub_237F1BD24()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

void sub_237F1BD54()
{
  JUMPOUT(0x23B8279B4);
}

uint64_t sub_237F1BD60()
{
  return Message.init(serializedData:extensions:partial:options:)();
}

void sub_237F1BD6C()
{
  Hasher._combine(_:)(0);
}

uint64_t sub_237F1BD78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_237F17178(*(_QWORD *)(v1 + a1), *(_QWORD *)(v1 + a1 + 8));
}

void sub_237F1BD84()
{
  Hasher._combine(_:)(0);
}

uint64_t sub_237F1BDA8(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6675626F746F7270 && a2 == 0xEC00000061746144)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    sub_237F18570();
    v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

Swift::Int sub_237F1BE2C()
{
  sub_237F1BA84();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

Swift::Int sub_237F1BE6C()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_237F1BEA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result;

  result = sub_237F1BDA8(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_237F1BED4()
{
  sub_237F1C1DC();
  return CodingKey.description.getter();
}

uint64_t sub_237F1BEFC()
{
  sub_237F1C1DC();
  return CodingKey.debugDescription.getter();
}

void AssetSkeleton.asset.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_237F19900(v1, a1, type metadata accessor for Asset);
}

void AssetSkeleton.assetID.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_237F19900(v1, a1, type metadata accessor for Asset.ID);
}

void AssetSkeleton.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
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

  type metadata accessor for BinaryDecodingOptions();
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v3);
  sub_237F1DD54();
  type metadata accessor for CloudAssets_SimultaneousDownloadableAssets(0);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v4);
  sub_237F1DD54();
  v7 = (uint64_t *)(v6 - v5);
  type metadata accessor for AssetSkeleton();
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v8);
  sub_237F1DD54();
  v11 = v10 - v9;
  v12 = sub_237F171BC(&qword_2568A9138);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  sub_237F1DD54();
  v16 = v15 - v14;
  sub_237F171FC(a1, a1[3]);
  sub_237F1C1DC();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v18)
  {
    sub_237F1952C();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    BinaryDecodingOptions.init()();
    sub_237F173F0(&qword_2568A9148, type metadata accessor for CloudAssets_SimultaneousDownloadableAssets, (uint64_t)&unk_237F5E840);
    Message.init(serializedData:extensions:partial:options:)();
    sub_237F1C218(v7, v11);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v16, v12);
    sub_237F19FD4(v11, a2, (uint64_t (*)(_QWORD))type metadata accessor for AssetSkeleton);
  }
  sub_237F172A0((uint64_t)a1);
  sub_237F1B978();
}

uint64_t type metadata accessor for AssetSkeleton()
{
  uint64_t result;

  result = qword_2568A9160;
  if (!qword_2568A9160)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_237F1C1DC()
{
  unint64_t result;

  result = qword_2568A9140;
  if (!qword_2568A9140)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D6D4, &type metadata for AssetSkeleton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9140);
  }
  return result;
}

void sub_237F1C218(uint64_t *a1@<X0>, uint64_t a2@<X8>)
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
  char *v12;
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
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;

  v78 = a2;
  v3 = type metadata accessor for Date();
  v4 = *(_QWORD *)(v3 - 8);
  v73 = v3;
  v74 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v72 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_237F171BC(&qword_2568A9190);
  MEMORY[0x24BDAC7A8](v6);
  v70 = (uint64_t)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = type metadata accessor for Google_Protobuf_Timestamp();
  v71 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v75 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_237F171BC(&qword_2568A9198);
  MEMORY[0x24BDAC7A8](v9);
  v69 = (uint64_t)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = type metadata accessor for CloudAssets_Credential(0);
  MEMORY[0x24BDAC7A8](v68);
  v12 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Credential(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for Asset(0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_237F171BC(&qword_2568A91A0);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v62 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for CloudAssets_Asset(0);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v62 - v26;
  sub_237F34460(*a1, (uint64_t)v21);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v21, 1, v22) == 1)
  {
    sub_237F1B910((uint64_t)v21, &qword_2568A91A0);
    sub_237F19568();
    swift_allocError();
    swift_willThrow();
    v28 = type metadata accessor for CloudAssets_SimultaneousDownloadableAssets;
    v29 = (uint64_t)a1;
LABEL_5:
    sub_237F1A3D8(v29, v28);
    return;
  }
  v64 = v13;
  v65 = v12;
  v66 = v15;
  v67 = a1;
  v30 = v76;
  v31 = v78;
  sub_237F19FD4((uint64_t)v21, (uint64_t)v27, type metadata accessor for CloudAssets_Asset);
  sub_237F19900((uint64_t)v27, (uint64_t)v25, type metadata accessor for CloudAssets_Asset);
  v32 = (uint64_t)v77;
  sub_237F19988();
  if (v32)
  {
    sub_237F1A3D8((uint64_t)v67, type metadata accessor for CloudAssets_SimultaneousDownloadableAssets);
    v28 = type metadata accessor for CloudAssets_Asset;
    v29 = (uint64_t)v27;
    goto LABEL_5;
  }
  v77 = v27;
  sub_237F19FD4((uint64_t)v18, v31, type metadata accessor for Asset);
  v33 = v67;
  v34 = v67[1];
  v35 = v67[2];
  v63 = type metadata accessor for AssetSkeleton();
  v36 = (uint64_t *)(v31 + *(int *)(v63 + 20));
  *v36 = v34;
  v36[1] = v35;
  v37 = (uint64_t)v33 + *(int *)(type metadata accessor for CloudAssets_SimultaneousDownloadableAssets(0) + 32);
  v38 = v69;
  sub_237F1B938(v37, v69, &qword_2568A9198);
  v39 = v68;
  v40 = _s10CloudAsset21UploadResponseMessageOwet_0(v38, 1, v68);
  v41 = v30;
  v42 = v71;
  v43 = v65;
  v44 = v66;
  if (v40 == 1)
  {
    *v65 = 0;
    v43[1] = 0xE000000000000000;
    v43[2] = 0;
    v43[3] = 0xE000000000000000;
    v43[4] = 0;
    v43[5] = 0xE000000000000000;
    sub_237F17134(v34, v35);
    UnknownStorage.init()();
    _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v43 + *(int *)(v39 + 32), 1, 1, v41);
    sub_237F1B910(v38, &qword_2568A9198);
  }
  else
  {
    sub_237F19FD4(v38, (uint64_t)v65, type metadata accessor for CloudAssets_Credential);
    sub_237F17134(v34, v35);
  }
  v45 = v74;
  v46 = v39;
  v47 = v43[1];
  *v44 = *v43;
  v44[1] = v47;
  v48 = v43;
  v49 = v43[2];
  v50 = v43[3];
  v44[2] = v49;
  v44[3] = v50;
  v51 = v48[5];
  v44[4] = v48[4];
  v44[5] = v51;
  v52 = v70;
  sub_237F1B938((uint64_t)v48 + *(int *)(v46 + 32), v70, &qword_2568A9190);
  if (_s10CloudAsset21UploadResponseMessageOwet_0(v52, 1, v41) == 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v53 = v75;
    Google_Protobuf_Timestamp.init()();
    sub_237F1B910(v52, &qword_2568A9190);
  }
  else
  {
    v53 = v75;
    (*(void (**)(char *, uint64_t, uint64_t))(v42 + 32))(v75, v52, v41);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  v54 = v72;
  Google_Protobuf_Timestamp.date.getter();
  sub_237F1A3D8((uint64_t)v65, type metadata accessor for CloudAssets_Credential);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v53, v41);
  v55 = (uint64_t)v66;
  (*(void (**)(char *, char *, uint64_t))(v45 + 32))((char *)v66 + *(int *)(v64 + 28), v54, v73);
  sub_237F1A3D8((uint64_t)v77, type metadata accessor for CloudAssets_Asset);
  v56 = v63;
  v57 = v78;
  sub_237F19FD4(v55, v78 + *(int *)(v63 + 28), type metadata accessor for Credential);
  v58 = v67;
  v59 = v67[3];
  v60 = v67[4];
  sub_237F17134(v59, v60);
  sub_237F1A3D8((uint64_t)v58, type metadata accessor for CloudAssets_SimultaneousDownloadableAssets);
  v61 = (uint64_t *)(v57 + *(int *)(v56 + 24));
  *v61 = v59;
  v61[1] = v60;
}

void AssetSkeleton.init(asset:credential:storageReference:storageReferenceSignature:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  int *v13;
  _QWORD *v14;
  _QWORD *v15;

  sub_237F19FD4(a1, a7, type metadata accessor for Asset);
  v13 = (int *)sub_237F1DD94();
  sub_237F19FD4(a2, a7 + v13[7], type metadata accessor for Credential);
  v14 = (_QWORD *)(a7 + v13[5]);
  *v14 = a3;
  v14[1] = a4;
  v15 = (_QWORD *)(a7 + v13[6]);
  *v15 = a5;
  v15[1] = a6;
  sub_237F1B9EC();
}

uint64_t sub_237F1C85C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v3 = type metadata accessor for Date();
  v39 = *(_QWORD *)(v3 - 8);
  v40 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v37 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Google_Protobuf_Timestamp();
  v41 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v38 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for CloudAssets_Credential(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (uint64_t *)((char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(_OWORD *)(a1 + 3) = xmmword_237F5CEA0;
  v10 = type metadata accessor for CloudAssets_SimultaneousDownloadableAssets(0);
  UnknownStorage.init()();
  v36 = (uint64_t)a1 + *(int *)(v10 + 32);
  _s10CloudAsset21UploadResponseMessageOwst_0(v36, 1, 1, v7);
  sub_237F171BC(&qword_2568A9188);
  v11 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CloudAssets_Asset(0) - 8) + 80);
  v12 = (v11 + 32) & ~v11;
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_237F5D500;
  sub_237F1A008((_QWORD *)(v13 + v12));
  *a1 = v13;
  v14 = (int *)type metadata accessor for AssetSkeleton();
  v15 = v14[5];
  v35 = v1;
  v16 = (uint64_t *)(v1 + v15);
  v17 = *v16;
  v18 = v16[1];
  a1[1] = *v16;
  a1[2] = v18;
  v19 = (char *)(v1 + v14[7]);
  sub_237F17134(v17, v18);
  UnknownStorage.init()();
  v20 = (uint64_t)v9 + *(int *)(v7 + 32);
  v21 = v5;
  _s10CloudAsset21UploadResponseMessageOwst_0(v20, 1, 1, v5);
  v22 = *((_QWORD *)v19 + 1);
  *v9 = *(_QWORD *)v19;
  v9[1] = v22;
  v23 = *((_QWORD *)v19 + 3);
  v9[2] = *((_QWORD *)v19 + 2);
  v9[3] = v23;
  v24 = *((_QWORD *)v19 + 5);
  v9[4] = *((_QWORD *)v19 + 4);
  v9[5] = v24;
  v25 = type metadata accessor for Credential(0);
  (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v37, &v19[*(int *)(v25 + 28)], v40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v26 = v38;
  Google_Protobuf_Timestamp.init(date:)();
  sub_237F1B910(v20, &qword_2568A9190);
  (*(void (**)(uint64_t, char *, uint64_t))(v41 + 32))(v20, v26, v21);
  _s10CloudAsset21UploadResponseMessageOwst_0(v20, 0, 1, v21);
  v27 = v36;
  sub_237F1B910(v36, &qword_2568A9198);
  sub_237F19FD4((uint64_t)v9, v27, type metadata accessor for CloudAssets_Credential);
  _s10CloudAsset21UploadResponseMessageOwst_0(v27, 0, 1, v7);
  v28 = (uint64_t *)(v35 + v14[6]);
  v29 = *v28;
  v30 = v28[1];
  v31 = a1[3];
  v32 = a1[4];
  sub_237F17134(*v28, v30);
  result = sub_237F17178(v31, v32);
  a1[3] = v29;
  a1[4] = v30;
  return result;
}

void AssetSkeleton.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;

  type metadata accessor for CloudAssets_SimultaneousDownloadableAssets(0);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v3);
  sub_237F1DD54();
  v6 = (uint64_t *)(v5 - v4);
  v7 = sub_237F171BC(&qword_2568A9150);
  v14 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  sub_237F1DD54();
  v10 = v9 - v8;
  sub_237F171FC(a1, a1[3]);
  sub_237F1C1DC();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  sub_237F1C85C(v6);
  sub_237F173F0(&qword_2568A9148, type metadata accessor for CloudAssets_SimultaneousDownloadableAssets, (uint64_t)&unk_237F5E840);
  v11 = Message.serializedData(partial:)();
  v13 = v12;
  sub_237F1A3D8((uint64_t)v6, type metadata accessor for CloudAssets_SimultaneousDownloadableAssets);
  if (!v1)
  {
    sub_237F195A4();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    sub_237F17178(v11, v13);
  }
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v10, v7);
  sub_237F1B978();
}

void AssetSkeleton.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  Asset.ID.hash(into:)();
  sub_237F1815C();
  sub_237F1DD9C();
  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  sub_237F1BB28();
  sub_237F1BC78();
  sub_237F1DD88();
  sub_237F17134(v2, v3);
  Data.hash(into:)();
  sub_237F17178(v2, v3);
  Hasher._combine(_:)(*(_QWORD *)(v0 + *(int *)(v0 + 24)));
  sub_237F1DD94();
  sub_237F1DD9C();
  sub_237F1BB28();
  sub_237F1BC78();
  sub_237F1DD88();
  sub_237F1BB28();
  sub_237F1BC78();
  sub_237F1DD88();
  Credential.hash(into:)();
  sub_237F1B9EC();
}

void static AssetSkeleton.== infix(_:_:)()
{
  static Asset.== infix(_:_:)();
}

void sub_237F1CDA8(char a1)
{
  if ((a1 & 1) != 0)
  {
    sub_237F1DD94();
    sub_237F1BA14();
  }
  sub_237F1BA50();
}

Swift::Int AssetSkeleton.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = v0;
  sub_237F1BA84();
  Asset.ID.hash(into:)();
  v2 = sub_237F1815C();
  v3 = (uint64_t *)(v1 + *(int *)(v2 + 20));
  v4 = v3[2];
  v5 = v3[3];
  sub_237F17134(*v3, v3[1]);
  sub_237F1DD64();
  sub_237F1BCDC();
  sub_237F17134(v4, v5);
  Data.hash(into:)();
  sub_237F17178(v4, v5);
  Hasher._combine(_:)(*(_QWORD *)(v1 + *(int *)(v2 + 24)));
  v6 = sub_237F1DD94();
  sub_237F1DD74(*(int *)(v6 + 20));
  sub_237F1DD64();
  sub_237F1BCDC();
  sub_237F1DD74(*(int *)(v6 + 24));
  sub_237F1DD64();
  sub_237F1BCDC();
  Credential.hash(into:)();
  return Hasher._finalize()();
}

Swift::Int sub_237F1CEE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;

  v4 = v2;
  Hasher.init(_seed:)();
  Asset.ID.hash(into:)();
  v5 = type metadata accessor for Asset(0);
  v6 = (uint64_t *)(v4 + *(int *)(v5 + 20));
  v7 = *v6;
  v8 = v6[1];
  v9 = v6[2];
  v10 = v6[3];
  sub_237F17134(*v6, v8);
  Data.hash(into:)();
  sub_237F17178(v7, v8);
  sub_237F17134(v9, v10);
  Data.hash(into:)();
  sub_237F17178(v9, v10);
  Hasher._combine(_:)(*(_QWORD *)(v4 + *(int *)(v5 + 24)));
  v11 = (uint64_t *)(v4 + *(int *)(a2 + 20));
  v12 = *v11;
  v13 = v11[1];
  sub_237F17134(*v11, v13);
  Data.hash(into:)();
  sub_237F17178(v12, v13);
  v14 = (uint64_t *)(v4 + *(int *)(a2 + 24));
  v15 = *v14;
  v16 = v14[1];
  sub_237F17134(*v14, v16);
  Data.hash(into:)();
  sub_237F17178(v15, v16);
  Credential.hash(into:)();
  return Hasher._finalize()();
}

void sub_237F1D02C(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  AssetSkeleton.init(from:)(a1, a2);
}

void sub_237F1D040(_QWORD *a1)
{
  AssetSkeleton.encode(to:)(a1);
}

void sub_237F1D058()
{
  sub_237F173F0(&qword_2568A9158, (uint64_t (*)(uint64_t))type metadata accessor for AssetSkeleton, (uint64_t)&protocol conformance descriptor for AssetSkeleton);
}

uint64_t *initializeBufferWithCopyOfBuffer for AssetSkeleton(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  void (*v52)(char *, char *, uint64_t);
  uint64_t v53;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v53 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v53 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for URL();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = (int *)type metadata accessor for Asset.ID(0);
    v9 = v8[5];
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = v8[6];
    v14 = (uint64_t *)((char *)a1 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = *v15;
    v17 = v15[1];
    swift_bridgeObjectRetain();
    sub_237F17134(v16, v17);
    *v14 = v16;
    v14[1] = v17;
    v18 = v8[7];
    v19 = (uint64_t *)((char *)a1 + v18);
    v20 = (uint64_t *)((char *)a2 + v18);
    v21 = *v20;
    v22 = v20[1];
    sub_237F17134(*v20, v22);
    *v19 = v21;
    v19[1] = v22;
    v23 = type metadata accessor for Asset(0);
    v24 = *(int *)(v23 + 20);
    v25 = (uint64_t *)((char *)a1 + v24);
    v26 = (char *)a2 + v24;
    v27 = *(uint64_t *)((char *)a2 + v24);
    v28 = *(uint64_t *)((char *)a2 + v24 + 8);
    sub_237F17134(v27, v28);
    *v25 = v27;
    v25[1] = v28;
    v29 = *((_QWORD *)v26 + 2);
    v30 = *((_QWORD *)v26 + 3);
    sub_237F17134(v29, v30);
    v25[2] = v29;
    v25[3] = v30;
    *(uint64_t *)((char *)a1 + *(int *)(v23 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v23 + 24));
    v31 = a3[5];
    v32 = (uint64_t *)((char *)a1 + v31);
    v33 = (uint64_t *)((char *)a2 + v31);
    v34 = *v33;
    v35 = v33[1];
    sub_237F17134(*v33, v35);
    *v32 = v34;
    v32[1] = v35;
    v36 = a3[6];
    v37 = (uint64_t *)((char *)a1 + v36);
    v38 = (uint64_t *)((char *)a2 + v36);
    v39 = *v38;
    v40 = v38[1];
    sub_237F17134(*v38, v40);
    *v37 = v39;
    v37[1] = v40;
    v41 = a3[7];
    v42 = (uint64_t *)((char *)a1 + v41);
    v43 = (uint64_t *)((char *)a2 + v41);
    v44 = *(uint64_t *)((char *)a2 + v41);
    v45 = v43[1];
    *v42 = v44;
    v42[1] = v45;
    v46 = v43[3];
    v42[2] = v43[2];
    v42[3] = v46;
    v47 = v43[5];
    v42[4] = v43[4];
    v42[5] = v47;
    v48 = *(int *)(type metadata accessor for Credential(0) + 28);
    v49 = (char *)v42 + v48;
    v50 = (char *)v43 + v48;
    v51 = type metadata accessor for Date();
    v52 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v51 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v52(v49, v50, v51);
  }
  return a1;
}

uint64_t destroy for AssetSkeleton(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = type metadata accessor for Asset.ID(0);
  swift_bridgeObjectRelease();
  sub_237F17178(*(_QWORD *)(a1 + *(int *)(v5 + 24)), *(_QWORD *)(a1 + *(int *)(v5 + 24) + 8));
  sub_237F17178(*(_QWORD *)(a1 + *(int *)(v5 + 28)), *(_QWORD *)(a1 + *(int *)(v5 + 28) + 8));
  v6 = a1 + *(int *)(type metadata accessor for Asset(0) + 20);
  sub_237F17178(*(_QWORD *)v6, *(_QWORD *)(v6 + 8));
  sub_237F17178(*(_QWORD *)(v6 + 16), *(_QWORD *)(v6 + 24));
  sub_237F17178(*(_QWORD *)(a1 + a2[5]), *(_QWORD *)(a1 + a2[5] + 8));
  sub_237F17178(*(_QWORD *)(a1 + a2[6]), *(_QWORD *)(a1 + a2[6] + 8));
  v7 = a1 + a2[7];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = v7 + *(int *)(type metadata accessor for Credential(0) + 28);
  v9 = type metadata accessor for Date();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

uint64_t initializeWithCopy for AssetSkeleton(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  void (*v51)(char *, char *, uint64_t);

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = (int *)type metadata accessor for Asset.ID(0);
  v8 = v7[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = v7[6];
  v13 = (uint64_t *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v15 = *v14;
  v16 = v14[1];
  swift_bridgeObjectRetain();
  sub_237F17134(v15, v16);
  *v13 = v15;
  v13[1] = v16;
  v17 = v7[7];
  v18 = (uint64_t *)(a1 + v17);
  v19 = (uint64_t *)(a2 + v17);
  v20 = *v19;
  v21 = v19[1];
  sub_237F17134(*v19, v21);
  *v18 = v20;
  v18[1] = v21;
  v22 = type metadata accessor for Asset(0);
  v23 = *(int *)(v22 + 20);
  v24 = (uint64_t *)(a1 + v23);
  v25 = a2 + v23;
  v26 = *(_QWORD *)(a2 + v23);
  v27 = *(_QWORD *)(a2 + v23 + 8);
  sub_237F17134(v26, v27);
  *v24 = v26;
  v24[1] = v27;
  v28 = *(_QWORD *)(v25 + 16);
  v29 = *(_QWORD *)(v25 + 24);
  sub_237F17134(v28, v29);
  v24[2] = v28;
  v24[3] = v29;
  *(_QWORD *)(a1 + *(int *)(v22 + 24)) = *(_QWORD *)(a2 + *(int *)(v22 + 24));
  v30 = a3[5];
  v31 = (uint64_t *)(a1 + v30);
  v32 = (uint64_t *)(a2 + v30);
  v33 = *v32;
  v34 = v32[1];
  sub_237F17134(*v32, v34);
  *v31 = v33;
  v31[1] = v34;
  v35 = a3[6];
  v36 = (uint64_t *)(a1 + v35);
  v37 = (uint64_t *)(a2 + v35);
  v38 = *v37;
  v39 = v37[1];
  sub_237F17134(*v37, v39);
  *v36 = v38;
  v36[1] = v39;
  v40 = a3[7];
  v41 = (_QWORD *)(a1 + v40);
  v42 = (_QWORD *)(a2 + v40);
  v43 = *(_QWORD *)(a2 + v40);
  v44 = v42[1];
  *v41 = v43;
  v41[1] = v44;
  v45 = v42[3];
  v41[2] = v42[2];
  v41[3] = v45;
  v46 = v42[5];
  v41[4] = v42[4];
  v41[5] = v46;
  v47 = *(int *)(type metadata accessor for Credential(0) + 28);
  v48 = (char *)v41 + v47;
  v49 = (char *)v42 + v47;
  v50 = type metadata accessor for Date();
  v51 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v50 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v51(v48, v49, v50);
  return a1;
}

uint64_t assignWithCopy for AssetSkeleton(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = (int *)type metadata accessor for Asset.ID(0);
  v8 = v7[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  *v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = v7[6];
  v12 = (uint64_t *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v14 = *v13;
  v15 = v13[1];
  sub_237F17134(*v13, v15);
  v16 = *v12;
  v17 = v12[1];
  *v12 = v14;
  v12[1] = v15;
  sub_237F17178(v16, v17);
  v18 = v7[7];
  v19 = (uint64_t *)(a1 + v18);
  v20 = (uint64_t *)(a2 + v18);
  v21 = *v20;
  v22 = v20[1];
  sub_237F17134(*v20, v22);
  v23 = *v19;
  v24 = v19[1];
  *v19 = v21;
  v19[1] = v22;
  sub_237F17178(v23, v24);
  v25 = type metadata accessor for Asset(0);
  v26 = *(int *)(v25 + 20);
  v27 = (uint64_t *)(a1 + v26);
  v28 = a2 + v26;
  v29 = *(_QWORD *)(a2 + v26);
  v30 = *(_QWORD *)(a2 + v26 + 8);
  sub_237F17134(v29, v30);
  v31 = *v27;
  v32 = v27[1];
  *v27 = v29;
  v27[1] = v30;
  sub_237F17178(v31, v32);
  v33 = *(_QWORD *)(v28 + 16);
  v34 = *(_QWORD *)(v28 + 24);
  sub_237F17134(v33, v34);
  v35 = v27[2];
  v36 = v27[3];
  v27[2] = v33;
  v27[3] = v34;
  sub_237F17178(v35, v36);
  *(_QWORD *)(a1 + *(int *)(v25 + 24)) = *(_QWORD *)(a2 + *(int *)(v25 + 24));
  v37 = a3[5];
  v38 = (uint64_t *)(a1 + v37);
  v39 = (uint64_t *)(a2 + v37);
  v40 = *v39;
  v41 = v39[1];
  sub_237F17134(*v39, v41);
  v42 = *v38;
  v43 = v38[1];
  *v38 = v40;
  v38[1] = v41;
  sub_237F17178(v42, v43);
  v44 = a3[6];
  v45 = (uint64_t *)(a1 + v44);
  v46 = (uint64_t *)(a2 + v44);
  v47 = *v46;
  v48 = v46[1];
  sub_237F17134(*v46, v48);
  v49 = *v45;
  v50 = v45[1];
  *v45 = v47;
  v45[1] = v48;
  sub_237F17178(v49, v50);
  v51 = a3[7];
  v52 = (_QWORD *)(a1 + v51);
  v53 = (_QWORD *)(a2 + v51);
  *v52 = *(_QWORD *)(a2 + v51);
  v52[1] = *(_QWORD *)(a2 + v51 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v52[2] = v53[2];
  v52[3] = v53[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v52[4] = v53[4];
  v52[5] = v53[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v54 = *(int *)(type metadata accessor for Credential(0) + 28);
  v55 = (char *)v52 + v54;
  v56 = (char *)v53 + v54;
  v57 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v57 - 8) + 24))(v55, v56, v57);
  return a1;
}

uint64_t initializeWithTake for AssetSkeleton(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  __int128 v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = (int *)type metadata accessor for Asset.ID(0);
  *(_OWORD *)(a1 + v7[5]) = *(_OWORD *)(a2 + v7[5]);
  *(_OWORD *)(a1 + v7[6]) = *(_OWORD *)(a2 + v7[6]);
  *(_OWORD *)(a1 + v7[7]) = *(_OWORD *)(a2 + v7[7]);
  v8 = type metadata accessor for Asset(0);
  v9 = *(int *)(v8 + 20);
  v10 = (_OWORD *)(a1 + v9);
  v11 = (_OWORD *)(a2 + v9);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  *(_QWORD *)(a1 + *(int *)(v8 + 24)) = *(_QWORD *)(a2 + *(int *)(v8 + 24));
  v13 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  v14 = a3[7];
  v15 = (_OWORD *)(a1 + v14);
  v16 = (_OWORD *)(a2 + v14);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  v15[2] = v16[2];
  v18 = *(int *)(type metadata accessor for Credential(0) + 28);
  v19 = (char *)v15 + v18;
  v20 = (char *)v16 + v18;
  v21 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v19, v20, v21);
  return a1;
}

uint64_t assignWithTake for AssetSkeleton(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = (int *)type metadata accessor for Asset.ID(0);
  v8 = v7[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v12 = *v10;
  v11 = v10[1];
  *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  v13 = v7[6];
  v14 = *(_QWORD *)(a1 + v13);
  v15 = *(_QWORD *)(a1 + v13 + 8);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  sub_237F17178(v14, v15);
  v16 = v7[7];
  v17 = *(_QWORD *)(a1 + v16);
  v18 = *(_QWORD *)(a1 + v16 + 8);
  *(_OWORD *)(a1 + v16) = *(_OWORD *)(a2 + v16);
  sub_237F17178(v17, v18);
  v19 = type metadata accessor for Asset(0);
  v20 = *(int *)(v19 + 20);
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = *(_QWORD *)(a1 + v20);
  v24 = *(_QWORD *)(a1 + v20 + 8);
  *(_OWORD *)(a1 + v20) = *(_OWORD *)(a2 + v20);
  sub_237F17178(v23, v24);
  v25 = *(_QWORD *)(v21 + 16);
  v26 = *(_QWORD *)(v21 + 24);
  *(_OWORD *)(v21 + 16) = *(_OWORD *)(v22 + 16);
  sub_237F17178(v25, v26);
  *(_QWORD *)(a1 + *(int *)(v19 + 24)) = *(_QWORD *)(a2 + *(int *)(v19 + 24));
  v27 = a3[5];
  v28 = *(_QWORD *)(a1 + v27);
  v29 = *(_QWORD *)(a1 + v27 + 8);
  *(_OWORD *)(a1 + v27) = *(_OWORD *)(a2 + v27);
  sub_237F17178(v28, v29);
  v30 = a3[6];
  v31 = *(_QWORD *)(a1 + v30);
  v32 = *(_QWORD *)(a1 + v30 + 8);
  *(_OWORD *)(a1 + v30) = *(_OWORD *)(a2 + v30);
  sub_237F17178(v31, v32);
  v33 = a3[7];
  v34 = (_QWORD *)(a1 + v33);
  v35 = (_QWORD *)(a2 + v33);
  v36 = *(_QWORD *)(a2 + v33 + 8);
  *v34 = *(_QWORD *)(a2 + v33);
  v34[1] = v36;
  swift_bridgeObjectRelease();
  v37 = v35[3];
  v34[2] = v35[2];
  v34[3] = v37;
  swift_bridgeObjectRelease();
  v38 = v35[5];
  v34[4] = v35[4];
  v34[5] = v38;
  swift_bridgeObjectRelease();
  v39 = *(int *)(type metadata accessor for Credential(0) + 28);
  v40 = (char *)v34 + v39;
  v41 = (char *)v35 + v39;
  v42 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v42 - 8) + 40))(v40, v41, v42);
  return a1;
}

uint64_t getEnumTagSinglePayload for AssetSkeleton()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_237F1DA1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_237F1815C();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    if ((_DWORD)a2 == 12)
    {
      sub_237F1BA50();
      return;
    }
    v7 = type metadata accessor for Credential(0);
    v8 = a1 + *(int *)(a3 + 28);
  }
  _s10CloudAsset21UploadResponseMessageOwet_0(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for AssetSkeleton()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237F1DAC8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  result = sub_237F1815C();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = a1;
  }
  else
  {
    if (a3 == 12)
    {
      v11 = (_QWORD *)(a1 + *(int *)(a4 + 20));
      *v11 = 0;
      v11[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * (_DWORD)a2) << 60;
      return result;
    }
    v9 = type metadata accessor for Credential(0);
    v10 = a1 + *(int *)(a4 + 28);
  }
  return _s10CloudAsset21UploadResponseMessageOwst_0(v10, a2, a2, v9);
}

uint64_t sub_237F1DB68()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for Asset(319);
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for Credential(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for AssetSkeleton.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_237F1DC38 + 4 * byte_237F5D510[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_237F1DC58 + 4 * byte_237F5D515[v4]))();
}

_BYTE *sub_237F1DC38(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_237F1DC58(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F1DC60(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F1DC68(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F1DC70(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F1DC78(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AssetSkeleton.CodingKeys()
{
  return &type metadata for AssetSkeleton.CodingKeys;
}

unint64_t sub_237F1DC98()
{
  unint64_t result;

  result = qword_2568A9170;
  if (!qword_2568A9170)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D6AC, &type metadata for AssetSkeleton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9170);
  }
  return result;
}

unint64_t sub_237F1DCD8()
{
  unint64_t result;

  result = qword_2568A9178;
  if (!qword_2568A9178)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D61C, &type metadata for AssetSkeleton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9178);
  }
  return result;
}

unint64_t sub_237F1DD18()
{
  unint64_t result;

  result = qword_2568A9180;
  if (!qword_2568A9180)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D644, &type metadata for AssetSkeleton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9180);
  }
  return result;
}

uint64_t sub_237F1DD64()
{
  return Data.hash(into:)();
}

uint64_t sub_237F1DD74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_237F17134(*(_QWORD *)(v1 + a1), *(_QWORD *)(v1 + a1 + 8));
}

uint64_t sub_237F1DD88()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F17178(v0, v1);
}

uint64_t sub_237F1DD94()
{
  return type metadata accessor for AssetSkeleton();
}

uint64_t sub_237F1DDB0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_237F1DDB8@<X0>(uint64_t a1@<X8>)
{
  return sub_237F1DDE0(&OBJC_IVAR____TtC10CloudAsset23AssetsUploadCoordinator__signals, &qword_2568A91B0, a1);
}

uint64_t sub_237F1DDCC@<X0>(uint64_t a1@<X8>)
{
  return sub_237F1DDE0(&OBJC_IVAR____TtC10CloudAsset23AssetsUploadCoordinator__results, &qword_2568A91C0, a1);
}

uint64_t sub_237F1DDE0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = v3 + *a1;
  v6 = sub_237F171BC(a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a3, v5, v6);
}

uint64_t sub_237F1DE20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  swift_defaultActor_initialize();
  *(_QWORD *)(v3 + 112) = a1;
  v7 = v3 + OBJC_IVAR____TtC10CloudAsset23AssetsUploadCoordinator__signals;
  v8 = sub_237F171BC(&qword_2568A91B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a2, v8);
  v9 = v3 + OBJC_IVAR____TtC10CloudAsset23AssetsUploadCoordinator__results;
  v10 = sub_237F171BC(&qword_2568A91C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, a3, v10);
  return v3;
}

uint64_t AssetsUploadCoordinator.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = sub_237F171BC(&qword_2568A91B0);
  sub_237F1BA00(v1);
  v2 = sub_237F171BC(&qword_2568A91C0);
  sub_237F1BA00(v2);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t AssetsUploadCoordinator.__deallocating_deinit()
{
  AssetsUploadCoordinator.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t AssetsUploadCoordinator.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F1DF44()
{
  return AssetsUploadCoordinator.unownedExecutor.getter();
}

uint64_t sub_237F1DF5C()
{
  return type metadata accessor for AssetsUploadCoordinator();
}

uint64_t type metadata accessor for AssetsUploadCoordinator()
{
  uint64_t result;

  result = qword_2568A91C8;
  if (!qword_2568A91C8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_237F1DF9C()
{
  unint64_t v0;
  unint64_t v1;

  sub_237F1E06C();
  if (v0 <= 0x3F)
  {
    sub_237F1E0D4();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AssetsUploadCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AssetsUploadCoordinator.assetSkeletons.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of AssetsUploadCoordinator.signals.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of AssetsUploadCoordinator.results.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

void sub_237F1E06C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2568A91D8)
  {
    sub_237F1725C(&qword_2568A91E0);
    v0 = type metadata accessor for AsyncThrowingStream();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2568A91D8);
  }
}

void sub_237F1E0D4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2568A91E8)
  {
    sub_237F1725C(&qword_2568A91F0);
    sub_237F1725C(&qword_2568A91E0);
    v0 = type metadata accessor for AsyncThrowingStream();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2568A91E8);
  }
}

uint64_t XPCAsyncSequenceRequest.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_237F18108();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t XPCAsyncSequenceRequest.data.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for XPCAsyncSequenceRequest() + 20);
  v2 = *(_QWORD *)v1;
  sub_237F17134(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t type metadata accessor for XPCAsyncSequenceRequest()
{
  uint64_t result;

  result = qword_2568A9210;
  if (!qword_2568A9210)
    return swift_getSingletonMetadata();
  return result;
}

BOOL sub_237F1E1F4(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_237F1E204(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

uint64_t sub_237F1E228(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1635017060 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_237F1E2EC()
{
  return 2;
}

Swift::Int sub_237F1E2F4(char a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

uint64_t sub_237F1E338(char a1)
{
  if ((a1 & 1) != 0)
    return 1635017060;
  else
    return 25705;
}

BOOL sub_237F1E35C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_237F1E1F4(*a1, *a2);
}

Swift::Int sub_237F1E368()
{
  char *v0;

  return sub_237F1E2F4(*v0);
}

void sub_237F1E370(uint64_t a1)
{
  char *v1;

  sub_237F1E204(a1, *v1);
}

uint64_t sub_237F1E378()
{
  char *v0;

  return sub_237F1E338(*v0);
}

uint64_t sub_237F1E380@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F1E228(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237F1E3A4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_237F1E2EC();
  *a1 = result;
  return result;
}

uint64_t sub_237F1E3C8()
{
  sub_237F1E560();
  return CodingKey.description.getter();
}

uint64_t sub_237F1E3F0()
{
  sub_237F1E560();
  return CodingKey.debugDescription.getter();
}

uint64_t XPCAsyncSequenceRequest.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = sub_237F171BC(&qword_2568A91F8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  sub_237F1DD54();
  v7 = v6 - v5;
  sub_237F171FC(a1, a1[3]);
  sub_237F1E560();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  type metadata accessor for UUID();
  sub_237F1E868(&qword_2568A8F90, MEMORY[0x24BDCEA70]);
  sub_237F1EF34();
  if (!v1)
  {
    type metadata accessor for XPCAsyncSequenceRequest();
    sub_237F195A4();
    sub_237F1EF34();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_237F1E560()
{
  unint64_t result;

  result = qword_2568A9200;
  if (!qword_2568A9200)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D964, &type metadata for XPCAsyncSequenceRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9200);
  }
  return result;
}

uint64_t XPCAsyncSequenceRequest.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;

  v15 = type metadata accessor for UUID();
  v12 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  sub_237F1DD54();
  v13 = v5 - v4;
  v14 = sub_237F171BC(&qword_2568A9208);
  MEMORY[0x24BDAC7A8](v14);
  sub_237F1DD54();
  v6 = type metadata accessor for XPCAsyncSequenceRequest();
  MEMORY[0x24BDAC7A8](v6);
  sub_237F1DD54();
  v9 = v8 - v7;
  sub_237F171FC(a1, a1[3]);
  sub_237F1E560();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return sub_237F172A0((uint64_t)a1);
  LOBYTE(v16) = 0;
  sub_237F1E868(&qword_2568A8FC0, MEMORY[0x24BDCEAA8]);
  sub_237F1EF28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v9, v13, v15);
  sub_237F1952C();
  sub_237F1EF28();
  sub_237F1EF14();
  *(_OWORD *)(v9 + *(int *)(v6 + 20)) = v16;
  sub_237F1E7C4(v9, a2);
  sub_237F172A0((uint64_t)a1);
  return sub_237F1E808(v9);
}

uint64_t sub_237F1E7C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for XPCAsyncSequenceRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237F1E808(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for XPCAsyncSequenceRequest();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_237F1E844()
{
  return sub_237F1E868(&qword_2568A8F70, MEMORY[0x24BDCEA88]);
}

uint64_t sub_237F1E868(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for UUID();
    result = MEMORY[0x23B82832C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_237F1E8AC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return XPCAsyncSequenceRequest.init(from:)(a1, a2);
}

uint64_t sub_237F1E8C0(_QWORD *a1)
{
  return XPCAsyncSequenceRequest.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for XPCAsyncSequenceRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for UUID();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = *v10;
    v12 = v10[1];
    sub_237F17134(*v10, v12);
    *v9 = v11;
    v9[1] = v12;
  }
  return a1;
}

uint64_t destroy for XPCAsyncSequenceRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return sub_237F17178(*(_QWORD *)(a1 + *(int *)(a2 + 20)), *(_QWORD *)(a1 + *(int *)(a2 + 20) + 8));
}

uint64_t initializeWithCopy for XPCAsyncSequenceRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v10 = *v9;
  v11 = v9[1];
  sub_237F17134(*v9, v11);
  *v8 = v10;
  v8[1] = v11;
  return a1;
}

uint64_t assignWithCopy for XPCAsyncSequenceRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v10 = *v9;
  v11 = v9[1];
  sub_237F17134(*v9, v11);
  v12 = *v8;
  v13 = v8[1];
  *v8 = v10;
  v8[1] = v11;
  sub_237F17178(v12, v13);
  return a1;
}

uint64_t initializeWithTake for XPCAsyncSequenceRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for XPCAsyncSequenceRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(_QWORD *)(a1 + v7);
  v9 = *(_QWORD *)(a1 + v7 + 8);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  sub_237F17178(v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCAsyncSequenceRequest()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237F1EB70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v8;

  v6 = sub_237F18108();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return _s10CloudAsset21UploadResponseMessageOwet_0(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8) >> 60;
  if (((4 * (_DWORD)v8) & 0xC) != 0)
    return 16 - ((4 * (_DWORD)v8) & 0xC | (v8 >> 2));
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for XPCAsyncSequenceRequest()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237F1EC04(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  _QWORD *v9;

  result = sub_237F18108();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return _s10CloudAsset21UploadResponseMessageOwst_0(a1, a2, a2, result);
  v9 = (_QWORD *)(a1 + *(int *)(a4 + 20));
  *v9 = 0;
  v9[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * (_DWORD)a2) << 60;
  return result;
}

uint64_t sub_237F1EC84()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for XPCAsyncSequenceRequest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for XPCAsyncSequenceRequest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237F1EDC8 + 4 * byte_237F5D7C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_237F1EDFC + 4 * byte_237F5D7C0[v4]))();
}

uint64_t sub_237F1EDFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F1EE04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237F1EE0CLL);
  return result;
}

uint64_t sub_237F1EE18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237F1EE20);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_237F1EE24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F1EE2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_237F1EE38(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for XPCAsyncSequenceRequest.CodingKeys()
{
  return &type metadata for XPCAsyncSequenceRequest.CodingKeys;
}

unint64_t sub_237F1EE58()
{
  unint64_t result;

  result = qword_2568A9220;
  if (!qword_2568A9220)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D93C, &type metadata for XPCAsyncSequenceRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9220);
  }
  return result;
}

unint64_t sub_237F1EE98()
{
  unint64_t result;

  result = qword_2568A9228;
  if (!qword_2568A9228)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D8AC, &type metadata for XPCAsyncSequenceRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9228);
  }
  return result;
}

unint64_t sub_237F1EED8()
{
  unint64_t result;

  result = qword_2568A9230;
  if (!qword_2568A9230)
  {
    result = MEMORY[0x23B82832C](&unk_237F5D8D4, &type metadata for XPCAsyncSequenceRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9230);
  }
  return result;
}

uint64_t sub_237F1EF14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 144) + 8))(v0, v1);
}

uint64_t sub_237F1EF28()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_237F1EF34()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t AssetDownloadRequest.id.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  type metadata accessor for UUID();
  v0 = sub_237F18128();
  return sub_237F180F8(v0, v1, v2, v3);
}

void AssetDownloadRequest.tenantName.getter()
{
  sub_237F221C0();
  sub_237F22324();
  sub_237F1BA5C();
  sub_237F18140();
}

uint64_t type metadata accessor for AssetDownloadRequest()
{
  uint64_t result;

  result = qword_2568A9288;
  if (!qword_2568A9288)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t AssetDownloadRequest.workingDirectory.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_237F221C0();
  sub_237F18100();
  v0 = sub_237F18128();
  return sub_237F180F8(v0, v1, v2, v3);
}

void AssetDownloadRequest.asset.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_237F221C0();
  sub_237F20E2C(v1 + *(int *)(v3 + 28), a1, type metadata accessor for Asset);
}

uint64_t AssetDownloadRequest.range.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(sub_237F221C0() + 32));
}

uint64_t AssetDownloadRequest.fileURL.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_237F221C0();
  sub_237F18100();
  v0 = sub_237F18128();
  return sub_237F180F8(v0, v1, v2, v3);
}

void AssetDownloadRequest.credential.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_237F221C0();
  sub_237F20E2C(v1 + *(int *)(v3 + 40), a1, type metadata accessor for Credential);
}

void AssetDownloadRequest.storageReference.getter()
{
  uint64_t v0;

  v0 = sub_237F221C0();
  sub_237F2229C(*(int *)(v0 + 44));
  sub_237F1BA5C();
  sub_237F18140();
}

void AssetDownloadRequest.storageReferenceSignature.getter()
{
  uint64_t v0;

  v0 = sub_237F221C0();
  sub_237F2229C(*(int *)(v0 + 48));
  sub_237F1BA5C();
  sub_237F18140();
}

void AssetDownloadRequest.applicationID.getter()
{
  sub_237F221C0();
  sub_237F22324();
  sub_237F1BA5C();
  sub_237F18140();
}

void AssetDownloadRequest.init(asset:fileURL:credential:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9)
{
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_237F222C8();
  v12 = v11;
  v14 = v13;
  sub_237F222B0();
  v15 = sub_237F221C0();
  sub_237F22174(v15);
  sub_237F22418();
  sub_237F22410(v14, v16);
  v17 = sub_237F18100();
  sub_237F221D4(v17);
  sub_237F223F0(v12, v9 + v10[10]);
  sub_237F2226C(v10[11], (__n128)xmmword_237F5CEA0);
  sub_237F2221C();
  sub_237F223A4(v14);
  *(_OWORD *)(v9 + v10[12]) = a9;
  sub_237F22150();
  sub_237F221F0();
}

void sub_237F1F1B8(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSString *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, _QWORD, uint64_t);
  unint64_t v27;
  char *v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(char *, uint64_t);
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, _QWORD, uint64_t);
  id v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  char *v52;
  void (*v53)(char *, uint64_t);
  unint64_t v54;
  void (*v55)(uint64_t, uint64_t);
  char *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;

  v49 = a1;
  v50 = a2;
  v51 = a3;
  v4 = type metadata accessor for URL.DirectoryHint();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  sub_237F18110();
  sub_237F171BC(&qword_2568A9018);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_237F18100();
  v55 = *(void (**)(uint64_t, uint64_t))(v9 - 8);
  v57 = v9;
  sub_237F1B990();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  sub_237F22424();
  v52 = v14;
  sub_237F223E4();
  MEMORY[0x24BDAC7A8](v15);
  sub_237F22424();
  v53 = v16;
  sub_237F223E4();
  MEMORY[0x24BDAC7A8](v17);
  sub_237F22424();
  v56 = v18;
  sub_237F223E4();
  MEMORY[0x24BDAC7A8](v19);
  sub_237F22424();
  v47 = v20;
  sub_237F223E4();
  MEMORY[0x24BDAC7A8](v21);
  v48 = (char *)&v46 - v22;
  v23 = NSHomeDirectory();
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v8, 1, 1, v9);
  v24 = *MEMORY[0x24BDCD7A0];
  v25 = v5;
  v26 = *(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104);
  sub_237F2220C();
  URL.init(filePath:directoryHint:relativeTo:)();
  v58 = 0x7972617262694CLL;
  v59 = 0xE700000000000000;
  sub_237F2220C();
  v27 = sub_237F194B4();
  v28 = v52;
  URL.appending<A>(path:directoryHint:)();
  v29 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
  sub_237F22260();
  sub_237F22294();
  v30 = (void (*)(char *, uint64_t))*((_QWORD *)v55 + 1);
  v30(v13, v57);
  v58 = 0x736568636143;
  v59 = 0xE600000000000000;
  sub_237F2220C();
  v31 = (char *)v53;
  URL.appending<A>(path:directoryHint:)();
  sub_237F22260();
  sub_237F22294();
  v32 = v28;
  v33 = v57;
  v30(v32, v57);
  v58 = 0x74694B64756F6C43;
  v59 = 0xE800000000000000;
  LODWORD(v52) = v24;
  v34 = v24;
  v35 = v26;
  v26(v3, v34, v4);
  v54 = v27;
  URL.appending<A>(path:directoryHint:)();
  v55 = v29;
  v29(v3, v4);
  sub_237F22294();
  v53 = v30;
  v30(v31, v33);
  v36 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v37 = objc_msgSend(v36, sel_bundleIdentifier);

  if (v37)
  {
    v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v40 = v39;

    v58 = v38;
    v59 = v40;
    v35(v3, v52, v4);
    v41 = v47;
    v42 = v56;
    URL.appending<A>(path:directoryHint:)();
    v55(v3, v4);
    sub_237F22294();
    v43 = v57;
    v44 = (void (*)(uint64_t, uint64_t))v53;
    v53(v42, v57);
    v58 = 0x73734164756F6C43;
    v59 = 0xEB00000000737465;
    sub_237F222B8();
    v45 = v48;
    URL.appending<A>(path:directoryHint:)();
    v55(v3, v4);
    sub_237F22294();
    v44(v41, v43);
    v58 = v49;
    v59 = v50;
    sub_237F222B8();
    URL.appending<A>(path:directoryHint:)();
    sub_237F22260();
    v44((uint64_t)v45, v43);
  }
  else
  {
    __break(1u);
  }
}

void AssetDownloadRequest.init(tenantName:asset:fileURL:credential:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  sub_237F222C8();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  sub_237F222B0();
  v18 = (int *)sub_237F221C0();
  v19 = (uint64_t *)(v9 + v18[5]);
  *v19 = v17;
  v19[1] = v15;
  v20 = v9 + v18[6];
  swift_bridgeObjectRetain();
  sub_237F1F1B8(v17, v15, v20);
  swift_bridgeObjectRelease();
  sub_237F22418();
  sub_237F22410(v13, v21);
  v22 = sub_237F18100();
  sub_237F221D4(v22);
  sub_237F223F0(v11, v9 + v18[10]);
  sub_237F2226C(v18[11], (__n128)xmmword_237F5CEA0);
  sub_237F2221C();
  sub_237F223A4(v13);
  *(_OWORD *)(v9 + v18[12]) = a9;
  sub_237F22150();
  sub_237F221F0();
}

void AssetDownloadRequest.init(skeleton:fileURL:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_237F222B0();
  v6 = sub_237F221C0();
  sub_237F22174(v6);
  sub_237F22418();
  sub_237F1F798(a1, v7, type metadata accessor for Asset);
  v8 = sub_237F18100();
  sub_237F22248(v8);
  v9 = type metadata accessor for AssetSkeleton();
  v10 = sub_237F22374(v9);
  sub_237F1F798(v10, v11, type metadata accessor for Credential);
  *(_OWORD *)(v2 + *(int *)(v3 + 44)) = *(_OWORD *)(a1 + *(int *)(a2 + 20));
  *(_OWORD *)(v2 + *(int *)(v3 + 48)) = *(_OWORD *)(a1 + *(int *)(a2 + 24));
  sub_237F22150();
}

void sub_237F1F798(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = sub_237F1BC68(a1, a2, a3);
  sub_237F22430(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  sub_237F18140();
}

void AssetDownloadRequest.init(tenantName:skeleton:fileURL:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  int *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  sub_237F222B0();
  v9 = (int *)sub_237F221C0();
  v10 = (uint64_t *)(v4 + v9[5]);
  *v10 = a1;
  v10[1] = a2;
  v11 = v4 + v9[6];
  swift_bridgeObjectRetain();
  sub_237F1F1B8(a1, a2, v11);
  swift_bridgeObjectRelease();
  sub_237F22418();
  sub_237F1F798(a3, v12, type metadata accessor for Asset);
  v13 = sub_237F18100();
  sub_237F22248(v13);
  v14 = type metadata accessor for AssetSkeleton();
  v15 = sub_237F22374(v14);
  sub_237F1F798(v15, v16, type metadata accessor for Credential);
  *(_OWORD *)(v4 + v9[11]) = *(_OWORD *)(a3 + *(int *)(a4 + 20));
  *(_OWORD *)(v4 + v9[12]) = *(_OWORD *)(a3 + *(int *)(a4 + 24));
  sub_237F22150();
}

__n128 AssetDownloadRequest.init(asset:destination:credential:range:applicationID:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v13;
  unint64_t v14;
  int *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  __n128 result;

  sub_237F222B0();
  v13 = *a3;
  v14 = a3[1];
  v15 = (int *)sub_237F221C0();
  v16 = (uint64_t *)(v8 + v15[5]);
  *v16 = v13;
  v16[1] = v14;
  v17 = v8 + v15[6];
  swift_bridgeObjectRetain();
  sub_237F1F1B8(v13, v14, v17);
  sub_237F22410(a1, v8 + v15[7]);
  v18 = v8 + v15[8];
  *(_QWORD *)v18 = a4;
  *(_QWORD *)(v18 + 8) = a5;
  *(_BYTE *)(v18 + 16) = a6 & 1;
  v19 = sub_237F18100();
  sub_237F221D4(v19);
  sub_237F223F0((uint64_t)a3, v8 + v15[10]);
  v20 = (_QWORD *)(v8 + v15[13]);
  *v20 = a7;
  v20[1] = a8;
  *(_OWORD *)(v8 + v15[11]) = xmmword_237F5CEA0;
  sub_237F2221C();
  sub_237F223A4(a1);
  sub_237F17360((uint64_t)a3, type metadata accessor for Credential);
  result = (__n128)xmmword_237F5CEA0;
  *(_OWORD *)(v8 + v15[12]) = xmmword_237F5CEA0;
  return result;
}

void AssetDownloadRequest.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::UInt v11;
  Swift::UInt v12;
  uint64_t v13;

  sub_237F222C8();
  v1 = v0;
  type metadata accessor for UUID();
  sub_237F173F0(&qword_2568A8F70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  dispatch thunk of Hashable.hash(into:)();
  v2 = (int *)sub_237F221C0();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  sub_237F18100();
  sub_237F173F0(&qword_2568A8F78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  dispatch thunk of Hashable.hash(into:)();
  v3 = v0 + v2[7];
  Asset.ID.hash(into:)();
  v4 = sub_237F1815C();
  v5 = (uint64_t *)(v3 + *(int *)(v4 + 20));
  v6 = *v5;
  v7 = v5[1];
  v9 = v5[2];
  v8 = v5[3];
  sub_237F17134(*v5, v7);
  Data.hash(into:)();
  sub_237F17178(v6, v7);
  sub_237F17134(v9, v8);
  Data.hash(into:)();
  sub_237F1BBE8(v9);
  Hasher._combine(_:)(*(_QWORD *)(v3 + *(int *)(v4 + 24)));
  v10 = v1 + v2[8];
  if (*(_BYTE *)(v10 + 16) == 1)
  {
    sub_237F22304(0);
  }
  else
  {
    v12 = *(_QWORD *)v10;
    v11 = *(_QWORD *)(v10 + 8);
    sub_237F22304(1u);
    Hasher._combine(_:)(v12);
    Hasher._combine(_:)(v11);
  }
  dispatch thunk of Hashable.hash(into:)();
  v13 = v1 + v2[10];
  Credential.hash(into:)();
  sub_237F22280(v2[11]);
  sub_237F22344();
  sub_237F1BBE8(v13);
  sub_237F22280(v2[12]);
  sub_237F22344();
  sub_237F1BBE8(v13);
  if (*(_QWORD *)(v1 + v2[13] + 8))
  {
    sub_237F22304(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_237F22304(0);
    sub_237F221F0();
  }
}

void static AssetDownloadRequest.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  BOOL v8;

  if ((static UUID.== infix(_:_:)() & 1) != 0)
  {
    v4 = *(int *)(sub_237F221C0() + 20);
    v5 = *(_QWORD *)(a1 + v4);
    v6 = *(_QWORD *)(a1 + v4 + 8);
    v7 = (_QWORD *)(a2 + v4);
    v8 = v5 == *v7 && v6 == v7[1];
    if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      sub_237F22404();
  }
  sub_237F1BA50();
}

uint64_t sub_237F1FD64(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  char v12;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x614E746E616E6574 && a2 == 0xEA0000000000656DLL;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x8000000237F647E0
           || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = a1 == 0x7465737361 && a2 == 0xE500000000000000;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v8 = a1 == 0x65676E6172 && a2 == 0xE500000000000000;
        if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v9 = a1 == 0x4C5255656C6966 && a2 == 0xE700000000000000;
          if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            v10 = a1 == 0x69746E6564657263 && a2 == 0xEA00000000006C61;
            if (v10 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else if (a1 == 0xD000000000000010 && a2 == 0x8000000237F64800
                   || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else if (a1 == 0xD000000000000019 && a2 == 0x8000000237F64820
                   || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 8;
            }
            else if (a1 == 0x746163696C707061 && a2 == 0xED000044496E6F69)
            {
              swift_bridgeObjectRelease();
              return 9;
            }
            else
            {
              v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              if ((v12 & 1) != 0)
                return 9;
              else
                return 10;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_237F2014C()
{
  return 10;
}

uint64_t sub_237F20154(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_237F2017C
                                                            + 4 * asc_237F5D9D0[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_237F2017C()
{
  return 0x614E746E616E6574;
}

unint64_t sub_237F20198()
{
  return 0xD000000000000010;
}

unint64_t sub_237F20220()
{
  return 0xD000000000000019;
}

uint64_t sub_237F20244()
{
  return 0x746163696C707061;
}

uint64_t sub_237F20268()
{
  unsigned __int8 *v0;

  return sub_237F20154(*v0);
}

uint64_t sub_237F20270@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F1FD64(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237F20294@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_237F2014C();
  *a1 = result;
  return result;
}

uint64_t sub_237F202B8()
{
  sub_237F20DF0();
  return CodingKey.description.getter();
}

uint64_t sub_237F202E0()
{
  sub_237F20DF0();
  return CodingKey.debugDescription.getter();
}

void AssetDownloadRequest.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = sub_237F171BC(&qword_2568A9238);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  sub_237F18110();
  sub_237F222E4();
  sub_237F223F8();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  type metadata accessor for UUID();
  sub_237F173F0(&qword_2568A8F90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_237F223CC();
  sub_237F221C8();
  if (!v0)
  {
    type metadata accessor for AssetDownloadRequest();
    sub_237F2238C(1);
    KeyedEncodingContainer.encode(_:forKey:)();
    type metadata accessor for URL();
    sub_237F173F0(&qword_2568A8FA0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
    sub_237F223AC();
    sub_237F221C8();
    type metadata accessor for Asset(0);
    sub_237F173F0(&qword_2568A8F98, type metadata accessor for Asset, (uint64_t)&protocol conformance descriptor for Asset);
    sub_237F223AC();
    sub_237F221C8();
    sub_237F171BC(&qword_2568A8FA8);
    sub_237F172C0(&qword_2568A8FB0, MEMORY[0x24BEE1770], MEMORY[0x24BEE1B98]);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    sub_237F221C8();
    type metadata accessor for Credential(0);
    sub_237F173F0(&qword_2568A9248, type metadata accessor for Credential, (uint64_t)&protocol conformance descriptor for Credential);
    sub_237F221C8();
    sub_237F195A4();
    sub_237F221C8();
    sub_237F221C8();
    sub_237F2238C(9);
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  sub_237F1B978();
}

Swift::Int AssetDownloadRequest.hashValue.getter()
{
  Hasher.init(_seed:)();
  AssetDownloadRequest.hash(into:)();
  return Hasher._finalize()();
}

void AssetDownloadRequest.init(from:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, char *, uint64_t);
  char v31;
  uint64_t v32;
  char *v33;
  void (*v34)(uint64_t, char *, uint64_t);
  int *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(_QWORD);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  int *v64;
  __int128 v65;
  char v66;
  char v67;

  v50 = a2;
  v51 = type metadata accessor for Credential(0);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v4);
  sub_237F180DC();
  v52 = v5;
  v53 = type metadata accessor for Asset(0);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v6);
  sub_237F180DC();
  v54 = v7;
  v8 = type metadata accessor for URL();
  v62 = *(_QWORD *)(v8 - 8);
  v63 = v8;
  sub_237F1B990();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v49 - v13;
  v15 = type metadata accessor for UUID();
  v58 = *(_QWORD *)(v15 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v16);
  sub_237F18110();
  v56 = sub_237F171BC(&qword_2568A9250);
  v17 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = (int *)type metadata accessor for AssetDownloadRequest();
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v20);
  sub_237F180DC();
  v59 = a1;
  v60 = v21;
  sub_237F222E4();
  v55 = v19;
  v22 = v61;
  sub_237F223F8();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  v57 = v15;
  if (v22)
  {
    v61 = v22;
    sub_237F172A0(v59);
  }
  else
  {
    v23 = v54;
    v61 = v12;
    LOBYTE(v65) = 0;
    sub_237F173F0(&qword_2568A8FC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    sub_237F223CC();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v24 = v15;
    v25 = v60;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 32))(v60, v2, v24);
    LOBYTE(v65) = 1;
    v26 = KeyedDecodingContainer.decode(_:forKey:)();
    v27 = (uint64_t *)(v25 + v64[5]);
    *v27 = v26;
    v27[1] = v28;
    LOBYTE(v65) = 2;
    sub_237F173F0(&qword_2568A8FD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
    v29 = v63;
    sub_237F223F8();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v30 = *(void (**)(uint64_t, char *, uint64_t))(v62 + 32);
    v30(v25 + v64[6], v14, v29);
    LOBYTE(v65) = 3;
    sub_237F173F0(&qword_2568A8FC8, type metadata accessor for Asset, (uint64_t)&protocol conformance descriptor for Asset);
    sub_237F223CC();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    sub_237F1F798(v23, v25 + v64[7], type metadata accessor for Asset);
    sub_237F171BC(&qword_2568A8FA8);
    v67 = 4;
    sub_237F172C0(&qword_2568A8FD8, MEMORY[0x24BEE1798], MEMORY[0x24BEE1BC8]);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    v31 = v66;
    v32 = v25 + v64[8];
    *(_OWORD *)v32 = v65;
    *(_BYTE *)(v32 + 16) = v31;
    LOBYTE(v65) = 5;
    v33 = v61;
    sub_237F223F8();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v34 = v30;
    v35 = v64;
    v34(v25 + v64[9], v33, v29);
    LOBYTE(v65) = 6;
    sub_237F173F0(&qword_2568A9258, type metadata accessor for Credential, (uint64_t)&protocol conformance descriptor for Credential);
    sub_237F223CC();
    v36 = v52;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    sub_237F1F798(v36, v25 + v35[10], type metadata accessor for Credential);
    v67 = 7;
    sub_237F1952C();
    sub_237F2230C();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v61 = 0;
    *(_OWORD *)(v25 + v35[11]) = v65;
    v67 = 8;
    sub_237F2230C();
    v38 = v61;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v61 = v38;
    if (v38)
    {
      sub_237F2223C(*(uint64_t (**)(uint64_t, _QWORD))(v17 + 8));
      v39 = 0;
      v37 = v59;
    }
    else
    {
      *(_OWORD *)(v25 + v35[12]) = v65;
      LOBYTE(v65) = 9;
      v40 = v61;
      v41 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
      v61 = v40;
      if (!v40)
      {
        v43 = v41;
        v44 = v42;
        sub_237F223C0();
        v45 = v60;
        v46 = (uint64_t *)(v60 + v64[13]);
        *v46 = v43;
        v46[1] = v44;
        sub_237F20E2C(v45, v50, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadRequest);
        sub_237F172A0(v59);
        v47 = sub_237F1BA5C();
        sub_237F17360(v47, v48);
        goto LABEL_6;
      }
      sub_237F223C0();
      v39 = 1;
      v35 = v64;
      v37 = v59;
      v25 = v60;
    }
    sub_237F172A0(v37);
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v25, v57);
    swift_bridgeObjectRelease();
    sub_237F223D8(v25 + v35[6], v62);
    sub_237F17360(v25 + v35[7], type metadata accessor for Asset);
    sub_237F223D8(v25 + v35[9], v62);
    sub_237F17360(v25 + v35[10], type metadata accessor for Credential);
    sub_237F2243C(v35[11]);
    if ((v39 & 1) != 0)
      sub_237F2243C(v35[12]);
  }
LABEL_6:
  sub_237F1B978();
}

Swift::Int sub_237F20D88()
{
  Hasher.init(_seed:)();
  AssetDownloadRequest.hash(into:)();
  return Hasher._finalize()();
}

void sub_237F20DC0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  AssetDownloadRequest.init(from:)(a1, a2);
}

void sub_237F20DD4()
{
  AssetDownloadRequest.encode(to:)();
}

unint64_t sub_237F20DF0()
{
  unint64_t result;

  result = qword_2568A9240;
  if (!qword_2568A9240)
  {
    result = MEMORY[0x23B82832C](&unk_237F5DC8C, &type metadata for AssetDownloadRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9240);
  }
  return result;
}

void sub_237F20E2C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = sub_237F1BC68(a1, a2, a3);
  sub_237F22430(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  sub_237F18140();
}

void sub_237F20E58(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_237F173F0(&qword_2568A9260, (uint64_t (*)(uint64_t))type metadata accessor for AssetDownloadRequest, (uint64_t)&protocol conformance descriptor for AssetDownloadRequest);
  a1[1] = v2;
  sub_237F173F0(&qword_2568A9268, (uint64_t (*)(uint64_t))type metadata accessor for AssetDownloadRequest, (uint64_t)&protocol conformance descriptor for AssetDownloadRequest);
  a1[2] = v3;
  sub_237F173F0(&qword_2568A9270, (uint64_t (*)(uint64_t))type metadata accessor for AssetDownloadRequest, (uint64_t)&protocol conformance descriptor for AssetDownloadRequest);
  a1[3] = v4;
  sub_237F173F0(&qword_2568A9278, (uint64_t (*)(uint64_t))type metadata accessor for AssetDownloadRequest, (uint64_t)&protocol conformance descriptor for AssetDownloadRequest);
  a1[4] = v5;
}

void sub_237F20EEC()
{
  sub_237F173F0(&qword_2568A9280, (uint64_t (*)(uint64_t))type metadata accessor for AssetDownloadRequest, (uint64_t)&protocol conformance descriptor for AssetDownloadRequest);
}

char *initializeBufferWithCopyOfBuffer for AssetDownloadRequest(char *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  char *v18;
  char *v19;
  int *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  uint64_t v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  char *v69;
  _QWORD *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v74;
  void (*v75)(char *, char *, uint64_t);

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v72 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = (char *)(v72 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = &a1[v8];
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *(_QWORD *)v10 = *v11;
    *((_QWORD *)v10 + 1) = v12;
    v13 = &a1[v9];
    v14 = (char *)a2 + v9;
    v15 = type metadata accessor for URL();
    v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    v74 = v15;
    v75 = v16;
    swift_bridgeObjectRetain();
    v16(v13, v14, v15);
    v17 = a3[7];
    v18 = &a1[v17];
    v19 = (char *)a2 + v17;
    v16(&a1[v17], (char *)a2 + v17, v15);
    v20 = (int *)type metadata accessor for Asset.ID(0);
    v21 = v20[5];
    v22 = &v18[v21];
    v23 = &v19[v21];
    v24 = *((_QWORD *)v23 + 1);
    *(_QWORD *)v22 = *(_QWORD *)v23;
    *((_QWORD *)v22 + 1) = v24;
    v25 = v20[6];
    v26 = (uint64_t *)&v18[v25];
    v27 = (uint64_t *)&v19[v25];
    v28 = *v27;
    v29 = v27[1];
    swift_bridgeObjectRetain();
    sub_237F17134(v28, v29);
    *v26 = v28;
    v26[1] = v29;
    v30 = v20[7];
    v31 = (uint64_t *)&v18[v30];
    v32 = (uint64_t *)&v19[v30];
    v33 = *v32;
    v34 = v32[1];
    sub_237F17134(*v32, v34);
    *v31 = v33;
    v31[1] = v34;
    v35 = type metadata accessor for Asset(0);
    v36 = *(int *)(v35 + 20);
    v37 = (uint64_t *)&v18[v36];
    v38 = &v19[v36];
    v39 = *(_QWORD *)&v19[v36];
    v40 = *(_QWORD *)&v19[v36 + 8];
    sub_237F17134(v39, v40);
    *v37 = v39;
    v37[1] = v40;
    v41 = *((_QWORD *)v38 + 2);
    v42 = *((_QWORD *)v38 + 3);
    sub_237F17134(v41, v42);
    v37[2] = v41;
    v37[3] = v42;
    *(_QWORD *)&v18[*(int *)(v35 + 24)] = *(_QWORD *)&v19[*(int *)(v35 + 24)];
    v43 = a3[8];
    v44 = a3[9];
    v45 = &a1[v43];
    v46 = (char *)a2 + v43;
    *(_OWORD *)v45 = *(_OWORD *)v46;
    v45[16] = v46[16];
    v75(&a1[v44], (char *)a2 + v44, v74);
    v47 = a3[10];
    v48 = &a1[v47];
    v49 = (char *)a2 + v47;
    v50 = *(uint64_t *)((char *)a2 + v47 + 8);
    *(_QWORD *)v48 = *(uint64_t *)((char *)a2 + v47);
    *((_QWORD *)v48 + 1) = v50;
    v51 = *(uint64_t *)((char *)a2 + v47 + 24);
    *((_QWORD *)v48 + 2) = *(uint64_t *)((char *)a2 + v47 + 16);
    *((_QWORD *)v48 + 3) = v51;
    v52 = *(uint64_t *)((char *)a2 + v47 + 40);
    *((_QWORD *)v48 + 4) = *(uint64_t *)((char *)a2 + v47 + 32);
    *((_QWORD *)v48 + 5) = v52;
    v53 = *(int *)(type metadata accessor for Credential(0) + 28);
    v54 = &v48[v53];
    v55 = &v49[v53];
    v56 = type metadata accessor for Date();
    v57 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v56 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v57(v54, v55, v56);
    v58 = a3[11];
    v59 = (uint64_t *)&a1[v58];
    v60 = (uint64_t *)((char *)a2 + v58);
    v61 = *v60;
    v62 = v60[1];
    sub_237F17134(*v60, v62);
    *v59 = v61;
    v59[1] = v62;
    v63 = a3[12];
    v64 = (uint64_t *)&a1[v63];
    v65 = (uint64_t *)((char *)a2 + v63);
    v66 = *v65;
    v67 = v65[1];
    sub_237F17134(*v65, v67);
    *v64 = v66;
    v64[1] = v67;
    v68 = a3[13];
    v69 = &a1[v68];
    v70 = (uint64_t *)((char *)a2 + v68);
    v71 = v70[1];
    *(_QWORD *)v69 = *v70;
    *((_QWORD *)v69 + 1) = v71;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for AssetDownloadRequest(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  v5 = a1 + a2[6];
  v6 = type metadata accessor for URL();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v8 = a1 + a2[7];
  v7(v8, v6);
  v9 = type metadata accessor for Asset.ID(0);
  swift_bridgeObjectRelease();
  sub_237F17178(*(_QWORD *)(v8 + *(int *)(v9 + 24)), *(_QWORD *)(v8 + *(int *)(v9 + 24) + 8));
  sub_237F17178(*(_QWORD *)(v8 + *(int *)(v9 + 28)), *(_QWORD *)(v8 + *(int *)(v9 + 28) + 8));
  v10 = v8 + *(int *)(type metadata accessor for Asset(0) + 20);
  sub_237F17178(*(_QWORD *)v10, *(_QWORD *)(v10 + 8));
  sub_237F17178(*(_QWORD *)(v10 + 16), *(_QWORD *)(v10 + 24));
  v7(a1 + a2[9], v6);
  v11 = a1 + a2[10];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = v11 + *(int *)(type metadata accessor for Credential(0) + 28);
  v13 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  sub_237F17178(*(_QWORD *)(a1 + a2[11]), *(_QWORD *)(a1 + a2[11] + 8));
  sub_237F17178(*(_QWORD *)(a1 + a2[12]), *(_QWORD *)(a1 + a2[12] + 8));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AssetDownloadRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
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
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t, uint64_t);
  uint64_t v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v72;
  void (*v73)(uint64_t, uint64_t, uint64_t);

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a1 + v8;
  v13 = a2 + v8;
  v14 = type metadata accessor for URL();
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  v72 = v14;
  v73 = v15;
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  v16 = a3[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v15(a1 + v16, a2 + v16, v14);
  v19 = (int *)type metadata accessor for Asset.ID(0);
  v20 = v19[5];
  v21 = (_QWORD *)(v17 + v20);
  v22 = (_QWORD *)(v18 + v20);
  v23 = v22[1];
  *v21 = *v22;
  v21[1] = v23;
  v24 = v19[6];
  v25 = (uint64_t *)(v17 + v24);
  v26 = (uint64_t *)(v18 + v24);
  v27 = *v26;
  v28 = v26[1];
  swift_bridgeObjectRetain();
  sub_237F17134(v27, v28);
  *v25 = v27;
  v25[1] = v28;
  v29 = v19[7];
  v30 = (uint64_t *)(v17 + v29);
  v31 = (uint64_t *)(v18 + v29);
  v32 = *v31;
  v33 = v31[1];
  sub_237F17134(*v31, v33);
  *v30 = v32;
  v30[1] = v33;
  v34 = type metadata accessor for Asset(0);
  v35 = *(int *)(v34 + 20);
  v36 = (uint64_t *)(v17 + v35);
  v37 = v18 + v35;
  v38 = *(_QWORD *)(v18 + v35);
  v39 = *(_QWORD *)(v18 + v35 + 8);
  sub_237F17134(v38, v39);
  *v36 = v38;
  v36[1] = v39;
  v40 = *(_QWORD *)(v37 + 16);
  v41 = *(_QWORD *)(v37 + 24);
  sub_237F17134(v40, v41);
  v36[2] = v40;
  v36[3] = v41;
  *(_QWORD *)(v17 + *(int *)(v34 + 24)) = *(_QWORD *)(v18 + *(int *)(v34 + 24));
  v42 = a3[8];
  v43 = a3[9];
  v44 = a1 + v42;
  v45 = a2 + v42;
  *(_OWORD *)v44 = *(_OWORD *)v45;
  *(_BYTE *)(v44 + 16) = *(_BYTE *)(v45 + 16);
  v73(a1 + v43, a2 + v43, v72);
  v46 = a3[10];
  v47 = (_QWORD *)(a1 + v46);
  v48 = a2 + v46;
  v49 = *(_QWORD *)(a2 + v46 + 8);
  *v47 = *(_QWORD *)(a2 + v46);
  v47[1] = v49;
  v50 = *(_QWORD *)(a2 + v46 + 24);
  v47[2] = *(_QWORD *)(a2 + v46 + 16);
  v47[3] = v50;
  v51 = *(_QWORD *)(a2 + v46 + 40);
  v47[4] = *(_QWORD *)(a2 + v46 + 32);
  v47[5] = v51;
  v52 = *(int *)(type metadata accessor for Credential(0) + 28);
  v53 = (char *)v47 + v52;
  v54 = v48 + v52;
  v55 = type metadata accessor for Date();
  v56 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v56(v53, v54, v55);
  v57 = a3[11];
  v58 = (uint64_t *)(a1 + v57);
  v59 = (uint64_t *)(a2 + v57);
  v60 = *v59;
  v61 = v59[1];
  sub_237F17134(*v59, v61);
  *v58 = v60;
  v58[1] = v61;
  v62 = a3[12];
  v63 = (uint64_t *)(a1 + v62);
  v64 = (uint64_t *)(a2 + v62);
  v65 = *v64;
  v66 = v64[1];
  sub_237F17134(*v64, v66);
  *v63 = v65;
  v63[1] = v66;
  v67 = a3[13];
  v68 = (_QWORD *)(a1 + v67);
  v69 = (_QWORD *)(a2 + v67);
  v70 = v69[1];
  *v68 = *v69;
  v68[1] = v70;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AssetDownloadRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  _QWORD *v73;
  uint64_t v75;
  void (*v76)(uint64_t, uint64_t, uint64_t);

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[6];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v75 = type metadata accessor for URL();
  v76 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v75 - 8) + 24);
  v76(v11, v12, v75);
  v13 = a3[7];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v76(a1 + v13, a2 + v13, v75);
  v16 = (int *)type metadata accessor for Asset.ID(0);
  v17 = v16[5];
  v18 = (_QWORD *)(v14 + v17);
  v19 = (_QWORD *)(v15 + v17);
  *v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v20 = v16[6];
  v21 = (uint64_t *)(v14 + v20);
  v22 = (uint64_t *)(v15 + v20);
  v23 = *v22;
  v24 = v22[1];
  sub_237F17134(*v22, v24);
  v25 = *v21;
  v26 = v21[1];
  *v21 = v23;
  v21[1] = v24;
  sub_237F17178(v25, v26);
  v27 = v16[7];
  v28 = (uint64_t *)(v14 + v27);
  v29 = (uint64_t *)(v15 + v27);
  v30 = *v29;
  v31 = v29[1];
  sub_237F17134(*v29, v31);
  v32 = *v28;
  v33 = v28[1];
  *v28 = v30;
  v28[1] = v31;
  sub_237F17178(v32, v33);
  v34 = type metadata accessor for Asset(0);
  v35 = *(int *)(v34 + 20);
  v36 = (uint64_t *)(v14 + v35);
  v37 = v15 + v35;
  v38 = *(_QWORD *)(v15 + v35);
  v39 = *(_QWORD *)(v15 + v35 + 8);
  sub_237F17134(v38, v39);
  v40 = *v36;
  v41 = v36[1];
  *v36 = v38;
  v36[1] = v39;
  sub_237F17178(v40, v41);
  v42 = *(_QWORD *)(v37 + 16);
  v43 = *(_QWORD *)(v37 + 24);
  sub_237F17134(v42, v43);
  v44 = v36[2];
  v45 = v36[3];
  v36[2] = v42;
  v36[3] = v43;
  sub_237F17178(v44, v45);
  *(_QWORD *)(v14 + *(int *)(v34 + 24)) = *(_QWORD *)(v15 + *(int *)(v34 + 24));
  v46 = a3[8];
  v47 = a1 + v46;
  v48 = a2 + v46;
  v49 = *(_BYTE *)(v48 + 16);
  *(_OWORD *)v47 = *(_OWORD *)v48;
  *(_BYTE *)(v47 + 16) = v49;
  v76(a1 + a3[9], a2 + a3[9], v75);
  v50 = a3[10];
  v51 = (_QWORD *)(a1 + v50);
  v52 = (_QWORD *)(a2 + v50);
  *v51 = *(_QWORD *)(a2 + v50);
  v51[1] = *(_QWORD *)(a2 + v50 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v51[2] = v52[2];
  v51[3] = v52[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v51[4] = v52[4];
  v51[5] = v52[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v53 = *(int *)(type metadata accessor for Credential(0) + 28);
  v54 = (char *)v51 + v53;
  v55 = (char *)v52 + v53;
  v56 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v56 - 8) + 24))(v54, v55, v56);
  v57 = a3[11];
  v58 = (uint64_t *)(a1 + v57);
  v59 = (uint64_t *)(a2 + v57);
  v60 = *v59;
  v61 = v59[1];
  sub_237F17134(*v59, v61);
  v62 = *v58;
  v63 = v58[1];
  *v58 = v60;
  v58[1] = v61;
  sub_237F17178(v62, v63);
  v64 = a3[12];
  v65 = (uint64_t *)(a1 + v64);
  v66 = (uint64_t *)(a2 + v64);
  v67 = *v66;
  v68 = v66[1];
  sub_237F17134(*v66, v68);
  v69 = *v65;
  v70 = v65[1];
  *v65 = v67;
  v65[1] = v68;
  sub_237F17178(v69, v70);
  v71 = a3[13];
  v72 = (_QWORD *)(a1 + v71);
  v73 = (_QWORD *)(a2 + v71);
  *v72 = *v73;
  v72[1] = v73[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for AssetDownloadRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  _OWORD *v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for URL();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v11(a1 + v12, a2 + v12, v10);
  v15 = (int *)type metadata accessor for Asset.ID(0);
  *(_OWORD *)(v13 + v15[5]) = *(_OWORD *)(v14 + v15[5]);
  *(_OWORD *)(v13 + v15[6]) = *(_OWORD *)(v14 + v15[6]);
  *(_OWORD *)(v13 + v15[7]) = *(_OWORD *)(v14 + v15[7]);
  v16 = type metadata accessor for Asset(0);
  v17 = *(int *)(v16 + 20);
  v18 = (_OWORD *)(v13 + v17);
  v19 = (_OWORD *)(v14 + v17);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  *(_QWORD *)(v13 + *(int *)(v16 + 24)) = *(_QWORD *)(v14 + *(int *)(v16 + 24));
  v21 = a3[8];
  v22 = a3[9];
  v23 = a1 + v21;
  v24 = a2 + v21;
  *(_BYTE *)(v23 + 16) = *(_BYTE *)(v24 + 16);
  *(_OWORD *)v23 = *(_OWORD *)v24;
  v11(a1 + v22, a2 + v22, v10);
  v25 = a3[10];
  v26 = (_OWORD *)(a1 + v25);
  v27 = a2 + v25;
  v28 = *(_OWORD *)(a2 + v25 + 16);
  *v26 = *(_OWORD *)(a2 + v25);
  v26[1] = v28;
  v26[2] = *(_OWORD *)(a2 + v25 + 32);
  v29 = *(int *)(type metadata accessor for Credential(0) + 28);
  v30 = (char *)v26 + v29;
  v31 = v27 + v29;
  v32 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 32))(v30, v31, v32);
  v33 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v33) = *(_OWORD *)(a2 + v33);
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  return a1;
}

uint64_t assignWithTake for AssetDownloadRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = type metadata accessor for URL();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40);
  v16(v13, v14, v15);
  v17 = a3[7];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v16(a1 + v17, a2 + v17, v15);
  v20 = (int *)type metadata accessor for Asset.ID(0);
  v21 = v20[5];
  v22 = (_QWORD *)(v18 + v21);
  v23 = (uint64_t *)(v19 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  v26 = v20[6];
  v27 = *(_QWORD *)(v18 + v26);
  v28 = *(_QWORD *)(v18 + v26 + 8);
  *(_OWORD *)(v18 + v26) = *(_OWORD *)(v19 + v26);
  sub_237F17178(v27, v28);
  v29 = v20[7];
  v30 = *(_QWORD *)(v18 + v29);
  v31 = *(_QWORD *)(v18 + v29 + 8);
  *(_OWORD *)(v18 + v29) = *(_OWORD *)(v19 + v29);
  sub_237F17178(v30, v31);
  v32 = type metadata accessor for Asset(0);
  v33 = *(int *)(v32 + 20);
  v34 = v18 + v33;
  v35 = v19 + v33;
  v36 = *(_QWORD *)(v18 + v33);
  v37 = *(_QWORD *)(v18 + v33 + 8);
  *(_OWORD *)(v18 + v33) = *(_OWORD *)(v19 + v33);
  sub_237F17178(v36, v37);
  v38 = *(_QWORD *)(v34 + 16);
  v39 = *(_QWORD *)(v34 + 24);
  *(_OWORD *)(v34 + 16) = *(_OWORD *)(v35 + 16);
  sub_237F17178(v38, v39);
  *(_QWORD *)(v18 + *(int *)(v32 + 24)) = *(_QWORD *)(v19 + *(int *)(v32 + 24));
  v40 = a3[8];
  v41 = a3[9];
  v42 = a1 + v40;
  v43 = a2 + v40;
  *(_OWORD *)v42 = *(_OWORD *)v43;
  *(_BYTE *)(v42 + 16) = *(_BYTE *)(v43 + 16);
  v16(a1 + v41, a2 + v41, v15);
  v44 = a3[10];
  v45 = (_QWORD *)(a1 + v44);
  v46 = (_QWORD *)(a2 + v44);
  v47 = *(_QWORD *)(a2 + v44 + 8);
  *v45 = *(_QWORD *)(a2 + v44);
  v45[1] = v47;
  swift_bridgeObjectRelease();
  v48 = v46[3];
  v45[2] = v46[2];
  v45[3] = v48;
  swift_bridgeObjectRelease();
  v49 = v46[5];
  v45[4] = v46[4];
  v45[5] = v49;
  swift_bridgeObjectRelease();
  v50 = *(int *)(type metadata accessor for Credential(0) + 28);
  v51 = (char *)v45 + v50;
  v52 = (char *)v46 + v50;
  v53 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v53 - 8) + 40))(v51, v52, v53);
  v54 = a3[11];
  v55 = *(_QWORD *)(a1 + v54);
  v56 = *(_QWORD *)(a1 + v54 + 8);
  *(_OWORD *)(a1 + v54) = *(_OWORD *)(a2 + v54);
  sub_237F17178(v55, v56);
  v57 = a3[12];
  v58 = *(_QWORD *)(a1 + v57);
  v59 = *(_QWORD *)(a1 + v57 + 8);
  *(_OWORD *)(a1 + v57) = *(_OWORD *)(a2 + v57);
  sub_237F17178(v58, v59);
  v60 = a3[13];
  v61 = (_QWORD *)(a1 + v60);
  v62 = (uint64_t *)(a2 + v60);
  v64 = *v62;
  v63 = v62[1];
  *v61 = v64;
  v61[1] = v63;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AssetDownloadRequest()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_237F21CE0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  sub_237F22334();
  sub_237F22364();
  if (v11)
  {
    v7 = v6;
    v8 = v4;
  }
  else
  {
    if ((_DWORD)v3 == 0x7FFFFFFF)
    {
      sub_237F1BA50();
      return;
    }
    sub_237F18100();
    sub_237F22364();
    if (v11)
    {
      v7 = v9;
      v10 = a3[6];
    }
    else
    {
      sub_237F1815C();
      sub_237F22364();
      if (v11)
      {
        v7 = v12;
        v10 = a3[7];
      }
      else
      {
        v7 = type metadata accessor for Credential(0);
        v10 = a3[10];
      }
    }
    v8 = v4 + v10;
  }
  _s10CloudAsset21UploadResponseMessageOwet_0(v8, v3, v7);
}

uint64_t storeEnumTagSinglePayload for AssetDownloadRequest()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_237F21DA0(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  sub_237F22334();
  sub_237F22354();
  if (v13)
  {
    v9 = v8;
    v10 = v5;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(v5 + a4[5] + 8) = (v4 - 1);
      return;
    }
    sub_237F18100();
    sub_237F22354();
    if (v13)
    {
      v9 = v11;
      v12 = a4[6];
    }
    else
    {
      sub_237F1815C();
      sub_237F22354();
      if (v13)
      {
        v9 = v14;
        v12 = a4[7];
      }
      else
      {
        v9 = type metadata accessor for Credential(0);
        v12 = a4[10];
      }
    }
    v10 = v5 + v12;
  }
  _s10CloudAsset21UploadResponseMessageOwst_0(v10, v4, v4, v9);
}

uint64_t sub_237F21E58()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for URL();
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for Asset(319);
      if (v3 <= 0x3F)
      {
        result = type metadata accessor for Credential(319);
        if (v4 <= 0x3F)
        {
          swift_initStructMetadata();
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AssetDownloadRequest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF7)
  {
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
    v5 = (*a1 | (v4 << 8)) - 10;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v5 = v6 - 10;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AssetDownloadRequest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237F22010 + 4 * byte_237F5D9DF[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_237F22044 + 4 * byte_237F5D9DA[v4]))();
}

uint64_t sub_237F22044(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F2204C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237F22054);
  return result;
}

uint64_t sub_237F22060(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237F22068);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_237F2206C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F22074(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AssetDownloadRequest.CodingKeys()
{
  return &type metadata for AssetDownloadRequest.CodingKeys;
}

unint64_t sub_237F22094()
{
  unint64_t result;

  result = qword_2568A9298;
  if (!qword_2568A9298)
  {
    result = MEMORY[0x23B82832C](&unk_237F5DC64, &type metadata for AssetDownloadRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9298);
  }
  return result;
}

unint64_t sub_237F220D4()
{
  unint64_t result;

  result = qword_2568A92A0;
  if (!qword_2568A92A0)
  {
    result = MEMORY[0x23B82832C](&unk_237F5DBD4, &type metadata for AssetDownloadRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A92A0);
  }
  return result;
}

unint64_t sub_237F22114()
{
  unint64_t result;

  result = qword_2568A92A8;
  if (!qword_2568A92A8)
  {
    result = MEMORY[0x23B82832C](&unk_237F5DBFC, &type metadata for AssetDownloadRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A92A8);
  }
  return result;
}

void sub_237F22150()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)(v0 + *(int *)(v1 + 52));
  *v2 = 0;
  v2[1] = 0;
  v3 = v0 + *(int *)(v1 + 32);
  *(_QWORD *)v3 = 0;
  *(_QWORD *)(v3 + 8) = 0;
  *(_BYTE *)(v3 + 16) = 1;
}

void sub_237F22174(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)(v1 + *(int *)(a1 + 20));
  *v2 = 0x616C506572616853;
  v2[1] = 0xE900000000000079;
  sub_237F1F1B8(0x616C506572616853, 0xE900000000000079, v1 + *(int *)(a1 + 24));
}

uint64_t sub_237F221C0()
{
  return type metadata accessor for AssetDownloadRequest();
}

uint64_t sub_237F221C8()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_237F221D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v2, v1, a1);
}

uint64_t sub_237F2220C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v1, v2, v0);
}

uint64_t sub_237F2221C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_237F2222C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_237F2223C@<X0>(uint64_t (*a1)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, *(_QWORD *)(v2 - 184));
}

uint64_t sub_237F22248(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v2, v1, a1);
}

uint64_t sub_237F22260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

void sub_237F2226C(uint64_t a1@<X8>, __n128 a2@<Q0>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);

  *(__n128 *)(v2 + a1) = a2;
  sub_237F17360(v3, v4);
}

uint64_t sub_237F22280@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_237F17134(*(_QWORD *)(v1 + a1), *(_QWORD *)(v1 + a1 + 8));
}

uint64_t sub_237F22294()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_237F2229C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_237F17134(*(_QWORD *)(v1 + a1), *(_QWORD *)(v1 + a1 + 8));
}

uint64_t sub_237F222B0()
{
  return UUID.init()();
}

uint64_t sub_237F222B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v2, v1, v0);
}

unint64_t sub_237F222E4()
{
  _QWORD *v0;

  sub_237F171FC(v0, v0[3]);
  return sub_237F20DF0();
}

void sub_237F22304(Swift::UInt8 a1)
{
  Hasher._combine(_:)(a1);
}

uint64_t sub_237F22324()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_237F22334()
{
  return type metadata accessor for UUID();
}

uint64_t sub_237F22344()
{
  return Data.hash(into:)();
}

uint64_t sub_237F22374(uint64_t a1)
{
  uint64_t v1;

  return v1 + *(int *)(a1 + 28);
}

void sub_237F2238C(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 112) = a1;
}

void sub_237F223A4(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_237F17360(a1, v1);
}

uint64_t sub_237F223AC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F223C0()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v1 - 192), *(_QWORD *)(v1 - 184));
}

uint64_t sub_237F223D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(a1, v2);
}

void sub_237F223F0(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_237F20E2C(a1, a2, v2);
}

void sub_237F22404()
{
  JUMPOUT(0x23B8279B4);
}

void sub_237F22410(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_237F20E2C(a1, a2, v2);
}

uint64_t sub_237F22430@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_237F2243C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_237F17178(*(_QWORD *)(v1 + a1), *(_QWORD *)(v1 + a1 + 8));
}

uint64_t sub_237F22448@<X0>(uint64_t a1@<X8>)
{
  return sub_237F1DDE0(&OBJC_IVAR____TtC10CloudAsset25AssetsDownloadCoordinator__results, &qword_2568A91C0, a1);
}

uint64_t sub_237F2245C@<X0>(uint64_t a1@<X8>)
{
  return sub_237F1DDE0(&OBJC_IVAR____TtC10CloudAsset25AssetsDownloadCoordinator__signals, &qword_2568A91B0, a1);
}

uint64_t sub_237F22470(uint64_t *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[3] = v1;
  v4 = sub_237F171BC(&qword_2568A92C8);
  v2[4] = v4;
  v2[5] = *(_QWORD *)(v4 - 8);
  v5 = swift_task_alloc();
  v6 = *a1;
  v2[6] = v5;
  v2[7] = v6;
  return swift_task_switch();
}

uint64_t sub_237F224DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  sub_237F171BC(&qword_2568A92D8);
  AsyncThrowingStream.Continuation.yield(_:)();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237F22570(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;

  v22 = sub_237F171BC(&qword_2568A9300);
  v3 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_237F171BC(&qword_2568A91B0);
  v21 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_237F171BC(&qword_2568A9308);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v20 - v12;
  swift_defaultActor_initialize();
  v14 = v1 + OBJC_IVAR____TtC10CloudAsset25AssetsDownloadCoordinator__results;
  v15 = sub_237F171BC(&qword_2568A91C0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  v20 = a1;
  v17(v14, a1, v15);
  v18 = sub_237F171BC(&qword_2568A92D8);
  _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v13, 1, 1, v18);
  v24 = v13;
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE6CA0], v22);
  AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v21 + 32))(v1 + OBJC_IVAR____TtC10CloudAsset25AssetsDownloadCoordinator__signals, v7, v23);
  sub_237F22B1C((uint64_t)v13, (uint64_t)v11);
  result = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v11, 1, v18);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v20, v15);
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v1 + OBJC_IVAR____TtC10CloudAsset25AssetsDownloadCoordinator_continutation, v11, v18);
    sub_237F22B64((uint64_t)v13);
    return v1;
  }
  return result;
}

uint64_t sub_237F227B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_237F22B64(a2);
  v4 = sub_237F171BC(&qword_2568A92D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return _s10CloudAsset21UploadResponseMessageOwst_0(a2, 0, 1, v4);
}

uint64_t AssetsDownloadCoordinator.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_237F171BC(&qword_2568A91C0);
  sub_237F1BA00(v1);
  v2 = sub_237F171BC(&qword_2568A91B0);
  sub_237F1BA00(v2);
  v3 = sub_237F171BC(&qword_2568A92D8);
  sub_237F1BA00(v3);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t AssetsDownloadCoordinator.__deallocating_deinit()
{
  AssetsDownloadCoordinator.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t AssetsDownloadCoordinator.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F228B4()
{
  return AssetsDownloadCoordinator.unownedExecutor.getter();
}

uint64_t sub_237F228CC()
{
  return type metadata accessor for AssetsDownloadCoordinator();
}

uint64_t type metadata accessor for AssetsDownloadCoordinator()
{
  uint64_t result;

  result = qword_2568A92E0;
  if (!qword_2568A92E0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_237F2290C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_237F1E0D4();
  if (v0 <= 0x3F)
  {
    sub_237F22AA8(319, (unint64_t *)&qword_2568A91D8, (uint64_t (*)(uint64_t, ValueMetadata *, uint64_t, _QWORD))MEMORY[0x24BEE6D28]);
    if (v1 <= 0x3F)
    {
      sub_237F22AA8(319, &qword_2568A92F8, (uint64_t (*)(uint64_t, ValueMetadata *, uint64_t, _QWORD))MEMORY[0x24BEE6CD0]);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for AssetsDownloadCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AssetsDownloadCoordinator.results.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of AssetsDownloadCoordinator.signals.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of AssetsDownloadCoordinator.receive(signal:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 128) + *(_QWORD *)(*(_QWORD *)v1 + 128));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_237F22A60;
  return v6(a1);
}

uint64_t sub_237F22A60()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_237F22AA8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, uint64_t, _QWORD))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_237F1725C(&qword_2568A91E0);
    v7 = a3(a1, &type metadata for Signal, v6, MEMORY[0x24BEE3F20]);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_237F22B14(uint64_t a1)
{
  uint64_t v1;

  return sub_237F227B0(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_237F22B1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237F171BC(&qword_2568A9308);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237F22B64(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_237F171BC(&qword_2568A9308);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t static XPCServiceNames.userService.getter()
{
  return 0xD00000000000001BLL;
}

unint64_t static XPCServiceNames.systemService.getter()
{
  return sub_237F22BE8();
}

unint64_t static XPCServiceNames.testService.getter()
{
  return sub_237F22BE8();
}

ValueMetadata *type metadata accessor for XPCServiceNames()
{
  return &type metadata for XPCServiceNames;
}

unint64_t sub_237F22BE8()
{
  return 0xD000000000000022;
}

uint64_t *sub_237F22BFC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a2[5];
    v10 = *(int *)(a3 + 28);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    a1[4] = a2[4];
    a1[5] = v9;
    v13 = type metadata accessor for UnknownStorage();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v11, v12, v13);
    v15 = *(int *)(a3 + 32);
    v16 = (char *)v4 + v15;
    v17 = (char *)a2 + v15;
    v18 = type metadata accessor for Google_Protobuf_Timestamp();
    if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v17, 1, v18))
    {
      v19 = sub_237F171BC(&qword_2568A9190);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v16, 0, 1, v18);
    }
  }
  return v4;
}

uint64_t sub_237F22D4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + *(int *)(a2 + 32);
  v7 = type metadata accessor for Google_Protobuf_Timestamp();
  result = _s10CloudAsset21UploadResponseMessageOwet_0(v6, 1, v7);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  return result;
}

_QWORD *sub_237F22DF8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a2[5];
  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  a1[4] = a2[4];
  a1[5] = v8;
  v12 = type metadata accessor for UnknownStorage();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  v14 = *(int *)(a3 + 32);
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = type metadata accessor for Google_Protobuf_Timestamp();
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v16, 1, v17))
  {
    v18 = sub_237F171BC(&qword_2568A9190);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
    _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v15, 0, 1, v17);
  }
  return a1;
}

_QWORD *sub_237F22F1C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 32);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for Google_Protobuf_Timestamp();
  LODWORD(v8) = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v11, 1, v13);
  v14 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v12, 1, v13);
  if (!(_DWORD)v8)
  {
    v15 = *(_QWORD *)(v13 - 8);
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 24))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v16 = sub_237F171BC(&qword_2568A9190);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v11, 0, 1, v13);
  return a1;
}

_OWORD *sub_237F230A4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = *(int *)(a3 + 28);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = *(int *)(a3 + 32);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = type metadata accessor for Google_Protobuf_Timestamp();
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v13, 1, v14))
  {
    v15 = sub_237F171BC(&qword_2568A9190);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
    _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v12, 0, 1, v14);
  }
  return a1;
}

_QWORD *sub_237F23194(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  v13 = *(int *)(a3 + 32);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = type metadata accessor for Google_Protobuf_Timestamp();
  LODWORD(v11) = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v14, 1, v16);
  v17 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v15, 1, v16);
  if (!(_DWORD)v11)
  {
    v18 = *(_QWORD *)(v16 - 8);
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 40))(v14, v15, v16);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v14, v16);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v19 = sub_237F171BC(&qword_2568A9190);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v14, 0, 1, v16);
  return a1;
}

uint64_t sub_237F232EC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_237F232F8()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_237F2D678();
  if (v1)
  {
    sub_237F2D584(*(_QWORD *)(v0 + 8));
    sub_237F1BA50();
  }
  else
  {
    sub_237F2D48C();
    sub_237F22364();
    if (v1)
    {
      sub_237F2D948();
    }
    else
    {
      sub_237F171BC(&qword_2568A9190);
      sub_237F2D93C();
    }
    v3 = sub_237F2D754(v2);
    sub_237F1BAF8(v3, v4, v5);
  }
}

uint64_t sub_237F23358()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_237F23364()
{
  int v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_237F2D570();
  if (v2)
  {
    *(_QWORD *)(v1 + 8) = (v0 - 1);
    sub_237F1BA50();
  }
  else
  {
    sub_237F2D48C();
    sub_237F22354();
    if (v2)
    {
      sub_237F2D930();
    }
    else
    {
      sub_237F171BC(&qword_2568A9190);
      sub_237F2D924();
    }
    v4 = sub_237F2D5C8(v3);
    sub_237F1BB04(v4, v5, v6, v7);
  }
}

uint64_t type metadata accessor for CloudAssets_Credential(uint64_t a1)
{
  return sub_237F1B2B4(a1, (uint64_t *)&unk_2568A9310);
}

void sub_237F233D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_237F24570(a1, a2, a3, (uint64_t)&unk_237F5DDD8, (uint64_t)&unk_237F5DDD8, &qword_2568A9320, (void (*)(uint64_t))MEMORY[0x24BE5B990]);
}

uint64_t *sub_237F233F8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = type metadata accessor for UnknownStorage();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_237F23490(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = type metadata accessor for UnknownStorage();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_237F234D8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = type metadata accessor for UnknownStorage();
  v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

_QWORD *sub_237F23548(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_QWORD *sub_237F235BC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_237F23618(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_237F23684()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_237F23690()
{
  unint64_t *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_237F2D678();
  if (v2)
  {
    sub_237F2D584(*v0);
    sub_237F1BA50();
  }
  else
  {
    v3 = v1;
    sub_237F2D48C();
    v4 = sub_237F2D754(*(int *)(v3 + 20));
    sub_237F1BAF8(v4, v5, v6);
  }
}

uint64_t sub_237F236D8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_237F236E4()
{
  int v0;
  _QWORD *v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_237F2D570();
  if (v3)
  {
    *v1 = (v0 - 1);
    sub_237F1BA50();
  }
  else
  {
    v4 = v2;
    sub_237F2D48C();
    v5 = sub_237F2D5C8(*(int *)(v4 + 20));
    sub_237F1BB04(v5, v6, v7, v8);
  }
}

uint64_t type metadata accessor for CloudAssets_Signal(uint64_t a1)
{
  return sub_237F1B2B4(a1, (uint64_t *)&unk_2568A9328);
}

uint64_t sub_237F2373C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UnknownStorage();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_237F237B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v8 = a2[1];
    v9 = a2[2];
    swift_bridgeObjectRetain();
    sub_237F17134(v8, v9);
    a1[1] = v8;
    a1[2] = v9;
    v10 = a2[3];
    v11 = a2[4];
    sub_237F17134(v10, v11);
    a1[3] = v10;
    a1[4] = v11;
    v12 = *(int *)(a3 + 28);
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = type metadata accessor for UnknownStorage();
    v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    v16(v13, v14, v15);
    v17 = *(int *)(a3 + 32);
    v18 = (uint64_t *)((char *)a1 + v17);
    v19 = (uint64_t *)((char *)a2 + v17);
    v20 = type metadata accessor for CloudAssets_Credential(0);
    if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v19, 1, v20))
    {
      v21 = sub_237F171BC(&qword_2568A9198);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      v22 = v19[1];
      *v18 = *v19;
      v18[1] = v22;
      v23 = v19[3];
      v18[2] = v19[2];
      v18[3] = v23;
      v24 = v19[5];
      v18[4] = v19[4];
      v18[5] = v24;
      v25 = *(int *)(v20 + 28);
      v26 = (char *)v18 + v25;
      v27 = (char *)v19 + v25;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v16(v26, v27, v15);
      v28 = *(int *)(v20 + 32);
      v29 = (char *)v18 + v28;
      v30 = (char *)v19 + v28;
      v31 = type metadata accessor for Google_Protobuf_Timestamp();
      if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v30, 1, v31))
      {
        v32 = sub_237F171BC(&qword_2568A9190);
        memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16))(v29, v30, v31);
        _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v29, 0, 1, v31);
      }
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v18, 0, 1, v20);
    }
  }
  return a1;
}

uint64_t sub_237F239AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  swift_bridgeObjectRelease();
  sub_237F17178(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
  sub_237F17178(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32));
  v4 = a1 + *(int *)(a2 + 28);
  v5 = type metadata accessor for UnknownStorage();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v7 = a1 + *(int *)(a2 + 32);
  v8 = type metadata accessor for CloudAssets_Credential(0);
  result = _s10CloudAsset21UploadResponseMessageOwet_0(v7, 1, v8);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6(v7 + *(int *)(v8 + 28), v5);
    v10 = v7 + *(int *)(v8 + 32);
    v11 = type metadata accessor for Google_Protobuf_Timestamp();
    result = _s10CloudAsset21UploadResponseMessageOwet_0(v10, 1, v11);
    if (!(_DWORD)result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  }
  return result;
}

_QWORD *sub_237F23AB8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;

  v6 = a2[1];
  *a1 = *a2;
  v7 = a2[2];
  swift_bridgeObjectRetain();
  sub_237F17134(v6, v7);
  a1[1] = v6;
  a1[2] = v7;
  v8 = a2[3];
  v9 = a2[4];
  sub_237F17134(v8, v9);
  a1[3] = v8;
  a1[4] = v9;
  v10 = *(int *)(a3 + 28);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for UnknownStorage();
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  v14(v11, v12, v13);
  v15 = *(int *)(a3 + 32);
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  v18 = type metadata accessor for CloudAssets_Credential(0);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v17, 1, v18))
  {
    v19 = sub_237F171BC(&qword_2568A9198);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    v20 = v17[1];
    *v16 = *v17;
    v16[1] = v20;
    v21 = v17[3];
    v16[2] = v17[2];
    v16[3] = v21;
    v22 = v17[5];
    v16[4] = v17[4];
    v16[5] = v22;
    v23 = *(int *)(v18 + 28);
    v24 = (char *)v16 + v23;
    v25 = (char *)v17 + v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v24, v25, v13);
    v26 = *(int *)(v18 + 32);
    v27 = (char *)v16 + v26;
    v28 = (char *)v17 + v26;
    v29 = type metadata accessor for Google_Protobuf_Timestamp();
    if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v28, 1, v29))
    {
      v30 = sub_237F171BC(&qword_2568A9190);
      memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v27, v28, v29);
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v27, 0, 1, v29);
    }
    _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v16, 0, 1, v18);
  }
  return a1;
}

_QWORD *sub_237F23C8C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  char *v26;
  char *v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  size_t v34;
  void *v35;
  const void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a2[1];
  v7 = a2[2];
  sub_237F17134(v6, v7);
  v8 = a1[1];
  v9 = a1[2];
  a1[1] = v6;
  a1[2] = v7;
  sub_237F17178(v8, v9);
  v10 = a2[3];
  v11 = a2[4];
  sub_237F17134(v10, v11);
  v12 = a1[3];
  v13 = a1[4];
  a1[3] = v10;
  a1[4] = v11;
  sub_237F17178(v12, v13);
  v14 = *(int *)(a3 + 28);
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = type metadata accessor for UnknownStorage();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(void (**)(char *, char *, uint64_t))(v18 + 24);
  v19(v15, v16, v17);
  v20 = *(int *)(a3 + 32);
  v21 = (_QWORD *)((char *)a1 + v20);
  v22 = (_QWORD *)((char *)a2 + v20);
  v23 = type metadata accessor for CloudAssets_Credential(0);
  LODWORD(v16) = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v21, 1, v23);
  v24 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v22, 1, v23);
  if ((_DWORD)v16)
  {
    if (!v24)
    {
      *v21 = *v22;
      v21[1] = v22[1];
      v21[2] = v22[2];
      v21[3] = v22[3];
      v21[4] = v22[4];
      v21[5] = v22[5];
      v25 = *(int *)(v23 + 28);
      v26 = (char *)v21 + v25;
      v27 = (char *)v22 + v25;
      v28 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28(v26, v27, v17);
      v29 = *(int *)(v23 + 32);
      v30 = (char *)v21 + v29;
      v31 = (char *)v22 + v29;
      v32 = type metadata accessor for Google_Protobuf_Timestamp();
      if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v31, 1, v32))
      {
        v33 = sub_237F171BC(&qword_2568A9190);
        memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v30, v31, v32);
        _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v30, 0, 1, v32);
      }
      v43 = (uint64_t)v21;
      v44 = v23;
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  if (v24)
  {
    sub_237F1A3D8((uint64_t)v21, type metadata accessor for CloudAssets_Credential);
LABEL_7:
    v34 = *(_QWORD *)(*(_QWORD *)(sub_237F171BC(&qword_2568A9198) - 8) + 64);
    v35 = v21;
    v36 = v22;
    goto LABEL_8;
  }
  *v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21[2] = v22[2];
  v21[3] = v22[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21[4] = v22[4];
  v21[5] = v22[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19((char *)v21 + *(int *)(v23 + 28), (char *)v22 + *(int *)(v23 + 28), v17);
  v37 = *(int *)(v23 + 32);
  v38 = (uint64_t)v21 + v37;
  v39 = (uint64_t)v22 + v37;
  v40 = type metadata accessor for Google_Protobuf_Timestamp();
  v41 = _s10CloudAsset21UploadResponseMessageOwet_0(v38, 1, v40);
  v42 = _s10CloudAsset21UploadResponseMessageOwet_0(v39, 1, v40);
  if (v41)
  {
    if (!v42)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 16))(v38, v39, v40);
      v43 = v38;
      v44 = v40;
LABEL_14:
      _s10CloudAsset21UploadResponseMessageOwst_0(v43, 0, 1, v44);
      return a1;
    }
  }
  else
  {
    v46 = *(_QWORD *)(v40 - 8);
    if (!v42)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 24))(v38, v39, v40);
      return a1;
    }
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v38, v40);
  }
  v34 = *(_QWORD *)(*(_QWORD *)(sub_237F171BC(&qword_2568A9190) - 8) + 64);
  v35 = (void *)v38;
  v36 = (const void *)v39;
LABEL_8:
  memcpy(v35, v36, v34);
  return a1;
}

uint64_t sub_237F23FF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v6 = *(int *)(a3 + 28);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = type metadata accessor for UnknownStorage();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v11 = *(int *)(a3 + 32);
  v12 = (_OWORD *)(a1 + v11);
  v13 = (_OWORD *)(a2 + v11);
  v14 = type metadata accessor for CloudAssets_Credential(0);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v13, 1, v14))
  {
    v15 = sub_237F171BC(&qword_2568A9198);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    v16 = v13[1];
    *v12 = *v13;
    v12[1] = v16;
    v12[2] = v13[2];
    v10((uint64_t)v12 + *(int *)(v14 + 28), (uint64_t)v13 + *(int *)(v14 + 28), v9);
    v17 = *(int *)(v14 + 32);
    v18 = (char *)v12 + v17;
    v19 = (char *)v13 + v17;
    v20 = type metadata accessor for Google_Protobuf_Timestamp();
    if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v19, 1, v20))
    {
      v21 = sub_237F171BC(&qword_2568A9190);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v18, 0, 1, v20);
    }
    _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v12, 0, 1, v14);
  }
  return a1;
}

_QWORD *sub_237F24184(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  __int128 v21;
  uint64_t v22;
  void *v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  size_t v27;
  void *v28;
  const void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;

  *a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v6 = a1[1];
  v7 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  sub_237F17178(v6, v7);
  v8 = a1[3];
  v9 = a1[4];
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 24);
  sub_237F17178(v8, v9);
  v10 = *(int *)(a3 + 28);
  v11 = (char *)a1 + v10;
  v12 = a2 + v10;
  v13 = type metadata accessor for UnknownStorage();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 40);
  v15(v11, v12, v13);
  v16 = *(int *)(a3 + 32);
  v17 = (uint64_t)a1 + v16;
  v18 = a2 + v16;
  v19 = type metadata accessor for CloudAssets_Credential(0);
  LODWORD(v12) = _s10CloudAsset21UploadResponseMessageOwet_0(v17, 1, v19);
  v20 = _s10CloudAsset21UploadResponseMessageOwet_0(v18, 1, v19);
  if ((_DWORD)v12)
  {
    if (!v20)
    {
      v21 = *(_OWORD *)(v18 + 16);
      *(_OWORD *)v17 = *(_OWORD *)v18;
      *(_OWORD *)(v17 + 16) = v21;
      *(_OWORD *)(v17 + 32) = *(_OWORD *)(v18 + 32);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v17 + *(int *)(v19 + 28), v18 + *(int *)(v19 + 28), v13);
      v22 = *(int *)(v19 + 32);
      v23 = (void *)(v17 + v22);
      v24 = (const void *)(v18 + v22);
      v25 = type metadata accessor for Google_Protobuf_Timestamp();
      if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v24, 1, v25))
      {
        v26 = sub_237F171BC(&qword_2568A9190);
        memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v23, v24, v25);
        _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v23, 0, 1, v25);
      }
      v39 = v17;
      v40 = v19;
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  if (v20)
  {
    sub_237F1A3D8(v17, type metadata accessor for CloudAssets_Credential);
LABEL_7:
    v27 = *(_QWORD *)(*(_QWORD *)(sub_237F171BC(&qword_2568A9198) - 8) + 64);
    v28 = (void *)v17;
    v29 = (const void *)v18;
    goto LABEL_8;
  }
  v30 = *(_QWORD *)(v18 + 8);
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *(_QWORD *)(v17 + 8) = v30;
  swift_bridgeObjectRelease();
  v31 = *(_QWORD *)(v18 + 24);
  *(_QWORD *)(v17 + 16) = *(_QWORD *)(v18 + 16);
  *(_QWORD *)(v17 + 24) = v31;
  swift_bridgeObjectRelease();
  v32 = *(_QWORD *)(v18 + 40);
  *(_QWORD *)(v17 + 32) = *(_QWORD *)(v18 + 32);
  *(_QWORD *)(v17 + 40) = v32;
  swift_bridgeObjectRelease();
  v15((char *)(v17 + *(int *)(v19 + 28)), v18 + *(int *)(v19 + 28), v13);
  v33 = *(int *)(v19 + 32);
  v34 = v17 + v33;
  v35 = v18 + v33;
  v36 = type metadata accessor for Google_Protobuf_Timestamp();
  v37 = _s10CloudAsset21UploadResponseMessageOwet_0(v34, 1, v36);
  v38 = _s10CloudAsset21UploadResponseMessageOwet_0(v35, 1, v36);
  if (v37)
  {
    if (!v38)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 32))(v34, v35, v36);
      v39 = v34;
      v40 = v36;
LABEL_14:
      _s10CloudAsset21UploadResponseMessageOwst_0(v39, 0, 1, v40);
      return a1;
    }
  }
  else
  {
    v42 = *(_QWORD *)(v36 - 8);
    if (!v38)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 40))(v34, v35, v36);
      return a1;
    }
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v34, v36);
  }
  v27 = *(_QWORD *)(*(_QWORD *)(sub_237F171BC(&qword_2568A9190) - 8) + 64);
  v28 = (void *)v34;
  v29 = (const void *)v35;
LABEL_8:
  memcpy(v28, v29, v27);
  return a1;
}

uint64_t sub_237F2445C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_237F24468()
{
  unint64_t *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_237F2D678();
  if (v1)
  {
    sub_237F2D584(*v0);
    sub_237F1BA50();
  }
  else
  {
    sub_237F2D48C();
    sub_237F22364();
    if (v1)
    {
      sub_237F2D948();
    }
    else
    {
      sub_237F171BC(&qword_2568A9198);
      sub_237F2D93C();
    }
    v3 = sub_237F2D754(v2);
    sub_237F1BAF8(v3, v4, v5);
  }
}

uint64_t sub_237F244C8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_237F244D4()
{
  int v0;
  _QWORD *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_237F2D570();
  if (v2)
  {
    *v1 = (v0 - 1);
    sub_237F1BA50();
  }
  else
  {
    sub_237F2D48C();
    sub_237F22354();
    if (v2)
    {
      sub_237F2D930();
    }
    else
    {
      sub_237F171BC(&qword_2568A9198);
      sub_237F2D924();
    }
    v4 = sub_237F2D5C8(v3);
    sub_237F1BB04(v4, v5, v6, v7);
  }
}

uint64_t type metadata accessor for CloudAssets_SimultaneousDownloadableAssets(uint64_t a1)
{
  return sub_237F1B2B4(a1, (uint64_t *)&unk_2568A9338);
}

void sub_237F24548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_237F24570(a1, a2, a3, MEMORY[0x24BEE0158] + 64, (uint64_t)&unk_237F5DE40, &qword_2568A9348, (void (*)(uint64_t))type metadata accessor for CloudAssets_Credential);
}

void sub_237F24570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6, void (*a7)(uint64_t))
{
  unint64_t v9;
  unint64_t v10;

  type metadata accessor for UnknownStorage();
  if (v9 <= 0x3F)
  {
    sub_237F24614(319, a6, a7);
    if (v10 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_237F24614(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = type metadata accessor for Optional();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t *sub_237F24660(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void (*v34)(char *, char *, uint64_t);

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v7 = a3[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = type metadata accessor for UnknownStorage();
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    v11(v8, v9, v10);
    v12 = a3[6];
    v13 = (uint64_t *)((char *)v4 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    v15 = type metadata accessor for CloudAssets_Asset.ID(0);
    if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v14, 1, v15))
    {
      v16 = sub_237F171BC(&qword_2568A9128);
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      v18 = v14[1];
      *v13 = *v14;
      v13[1] = v18;
      v34 = v11;
      v19 = v14[3];
      v13[2] = v14[2];
      v13[3] = v19;
      v20 = v14[4];
      v21 = v14[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_237F17134(v20, v21);
      v13[4] = v20;
      v13[5] = v21;
      v22 = v14[6];
      v23 = v14[7];
      sub_237F17134(v22, v23);
      v13[6] = v22;
      v13[7] = v23;
      v11 = v34;
      v34((char *)v13 + *(int *)(v15 + 32), (char *)v14 + *(int *)(v15 + 32), v10);
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v13, 0, 1, v15);
    }
    v24 = a3[7];
    v25 = (uint64_t *)((char *)v4 + v24);
    v26 = (uint64_t *)((char *)a2 + v24);
    v27 = type metadata accessor for CloudAssets_Asset.Protector(0);
    if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v26, 1, v27))
    {
      v28 = sub_237F171BC(&qword_2568A9130);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      v29 = *v26;
      v30 = v26[1];
      sub_237F17134(*v26, v30);
      *v25 = v29;
      v25[1] = v30;
      v31 = v26[2];
      v32 = v26[3];
      sub_237F17134(v31, v32);
      v25[2] = v31;
      v25[3] = v32;
      v11((char *)v25 + *(int *)(v27 + 24), (char *)v26 + *(int *)(v27 + 24), v10);
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v25, 0, 1, v27);
    }
  }
  return v4;
}

uint64_t type metadata accessor for CloudAssets_Asset.ID(uint64_t a1)
{
  return sub_237F1B2B4(a1, (uint64_t *)&unk_2568A9380);
}

uint64_t type metadata accessor for CloudAssets_Asset.Protector(uint64_t a1)
{
  return sub_237F1B2B4(a1, (uint64_t *)&unk_2568A9370);
}

uint64_t sub_237F248A0(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  void (*v11)(uint64_t, uint64_t);

  v4 = a1 + a2[5];
  v5 = type metadata accessor for UnknownStorage();
  v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v11(v4, v5);
  v6 = a1 + a2[6];
  v7 = type metadata accessor for CloudAssets_Asset.ID(0);
  if (!_s10CloudAsset21UploadResponseMessageOwet_0(v6, 1, v7))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_237F17178(*(_QWORD *)(v6 + 32), *(_QWORD *)(v6 + 40));
    sub_237F17178(*(_QWORD *)(v6 + 48), *(_QWORD *)(v6 + 56));
    v11(v6 + *(int *)(v7 + 32), v5);
  }
  v8 = a1 + a2[7];
  v9 = type metadata accessor for CloudAssets_Asset.Protector(0);
  result = _s10CloudAsset21UploadResponseMessageOwet_0(v8, 1, v9);
  if (!(_DWORD)result)
  {
    sub_237F17178(*(_QWORD *)v8, *(_QWORD *)(v8 + 8));
    sub_237F17178(*(_QWORD *)(v8 + 16), *(_QWORD *)(v8 + 24));
    return ((uint64_t (*)(uint64_t, uint64_t))v11)(v8 + *(int *)(v9 + 24), v5);
  }
  return result;
}

_QWORD *sub_237F249C0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void (*v32)(char *, char *, uint64_t);

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for UnknownStorage();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  v10(v7, v8, v9);
  v11 = a3[6];
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v14 = type metadata accessor for CloudAssets_Asset.ID(0);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v13, 1, v14))
  {
    v15 = sub_237F171BC(&qword_2568A9128);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    v16 = v13[1];
    *v12 = *v13;
    v12[1] = v16;
    v32 = v10;
    v17 = v13[3];
    v12[2] = v13[2];
    v12[3] = v17;
    v18 = v13[4];
    v19 = v13[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_237F17134(v18, v19);
    v12[4] = v18;
    v12[5] = v19;
    v20 = v13[6];
    v21 = v13[7];
    sub_237F17134(v20, v21);
    v12[6] = v20;
    v12[7] = v21;
    v10 = v32;
    v32((char *)v12 + *(int *)(v14 + 32), (char *)v13 + *(int *)(v14 + 32), v9);
    _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v12, 0, 1, v14);
  }
  v22 = a3[7];
  v23 = (_QWORD *)((char *)a1 + v22);
  v24 = (_QWORD *)((char *)a2 + v22);
  v25 = type metadata accessor for CloudAssets_Asset.Protector(0);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v24, 1, v25))
  {
    v26 = sub_237F171BC(&qword_2568A9130);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    v27 = *v24;
    v28 = v24[1];
    sub_237F17134(*v24, v28);
    *v23 = v27;
    v23[1] = v28;
    v29 = v24[2];
    v30 = v24[3];
    sub_237F17134(v29, v30);
    v23[2] = v29;
    v23[3] = v30;
    v10((char *)v23 + *(int *)(v25 + 24), (char *)v24 + *(int *)(v25 + 24), v9);
    _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v23, 0, 1, v25);
  }
  return a1;
}

_QWORD *sub_237F24BAC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for UnknownStorage();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  v12 = a3[6];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = type metadata accessor for CloudAssets_Asset.ID(0);
  v16 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v13, 1, v15);
  v17 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v14, 1, v15);
  if (v16)
  {
    if (!v17)
    {
      *(_QWORD *)v13 = *(_QWORD *)v14;
      *((_QWORD *)v13 + 1) = *((_QWORD *)v14 + 1);
      *((_QWORD *)v13 + 2) = *((_QWORD *)v14 + 2);
      *((_QWORD *)v13 + 3) = *((_QWORD *)v14 + 3);
      v52 = v9;
      v53 = v10;
      v18 = v11;
      v19 = *((_QWORD *)v14 + 4);
      v20 = *((_QWORD *)v14 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_237F17134(v19, v20);
      *((_QWORD *)v13 + 4) = v19;
      *((_QWORD *)v13 + 5) = v20;
      v11 = v18;
      v9 = v52;
      v21 = *((_QWORD *)v14 + 6);
      v22 = *((_QWORD *)v14 + 7);
      sub_237F17134(v21, v22);
      *((_QWORD *)v13 + 6) = v21;
      *((_QWORD *)v13 + 7) = v22;
      v10 = v53;
      (*(void (**)(char *, char *, uint64_t))(v53 + 16))(&v13[*(int *)(v15 + 32)], &v14[*(int *)(v15 + 32)], v52);
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    sub_237F1A3D8((uint64_t)v13, type metadata accessor for CloudAssets_Asset.ID);
LABEL_6:
    v23 = sub_237F171BC(&qword_2568A9128);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *((_QWORD *)v13 + 1) = *((_QWORD *)v14 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v13 + 2) = *((_QWORD *)v14 + 2);
  *((_QWORD *)v13 + 3) = *((_QWORD *)v14 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v54 = v10;
  v36 = *((_QWORD *)v14 + 4);
  v37 = *((_QWORD *)v14 + 5);
  sub_237F17134(v36, v37);
  v38 = *((_QWORD *)v13 + 4);
  v39 = *((_QWORD *)v13 + 5);
  *((_QWORD *)v13 + 4) = v36;
  *((_QWORD *)v13 + 5) = v37;
  sub_237F17178(v38, v39);
  v40 = *((_QWORD *)v14 + 6);
  v41 = *((_QWORD *)v14 + 7);
  sub_237F17134(v40, v41);
  v42 = *((_QWORD *)v13 + 6);
  v43 = *((_QWORD *)v13 + 7);
  *((_QWORD *)v13 + 6) = v40;
  *((_QWORD *)v13 + 7) = v41;
  v10 = v54;
  sub_237F17178(v42, v43);
  v11(&v13[*(int *)(v15 + 32)], &v14[*(int *)(v15 + 32)], v9);
LABEL_7:
  v24 = a3[7];
  v25 = (_QWORD *)((char *)a1 + v24);
  v26 = (_QWORD *)((char *)a2 + v24);
  v27 = type metadata accessor for CloudAssets_Asset.Protector(0);
  v28 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v25, 1, v27);
  v29 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v26, 1, v27);
  if (!v28)
  {
    if (!v29)
    {
      v44 = *v26;
      v45 = v26[1];
      sub_237F17134(*v26, v45);
      v46 = *v25;
      v47 = v25[1];
      *v25 = v44;
      v25[1] = v45;
      sub_237F17178(v46, v47);
      v48 = v26[2];
      v49 = v26[3];
      sub_237F17134(v48, v49);
      v50 = v25[2];
      v51 = v25[3];
      v25[2] = v48;
      v25[3] = v49;
      sub_237F17178(v50, v51);
      v11((char *)v25 + *(int *)(v27 + 24), (char *)v26 + *(int *)(v27 + 24), v9);
      return a1;
    }
    sub_237F1A3D8((uint64_t)v25, type metadata accessor for CloudAssets_Asset.Protector);
    goto LABEL_12;
  }
  if (v29)
  {
LABEL_12:
    v34 = sub_237F171BC(&qword_2568A9130);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    return a1;
  }
  v30 = *v26;
  v31 = v26[1];
  sub_237F17134(*v26, v31);
  *v25 = v30;
  v25[1] = v31;
  v32 = v26[2];
  v33 = v26[3];
  sub_237F17134(v32, v33);
  v25[2] = v32;
  v25[3] = v33;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)v25 + *(int *)(v27 + 24), (char *)v26 + *(int *)(v27 + 24), v9);
  _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v25, 0, 1, v27);
  return a1;
}

_QWORD *sub_237F24EFC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _OWORD *v19;
  _OWORD *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for UnknownStorage();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v11 = a3[6];
  v12 = (_OWORD *)((char *)a1 + v11);
  v13 = (_OWORD *)((char *)a2 + v11);
  v14 = type metadata accessor for CloudAssets_Asset.ID(0);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v13, 1, v14))
  {
    v15 = sub_237F171BC(&qword_2568A9128);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    v16 = v13[1];
    *v12 = *v13;
    v12[1] = v16;
    v17 = v13[3];
    v12[2] = v13[2];
    v12[3] = v17;
    v10((char *)v12 + *(int *)(v14 + 32), (char *)v13 + *(int *)(v14 + 32), v9);
    _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v12, 0, 1, v14);
  }
  v18 = a3[7];
  v19 = (_OWORD *)((char *)a1 + v18);
  v20 = (_OWORD *)((char *)a2 + v18);
  v21 = type metadata accessor for CloudAssets_Asset.Protector(0);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v20, 1, v21))
  {
    v22 = sub_237F171BC(&qword_2568A9130);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    v23 = v20[1];
    *v19 = *v20;
    v19[1] = v23;
    v10((char *)v19 + *(int *)(v21 + 24), (char *)v20 + *(int *)(v21 + 24), v9);
    _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v19, 0, 1, v21);
  }
  return a1;
}

_QWORD *sub_237F2507C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  _QWORD *v13;
  char *v14;
  uint64_t v15;
  int v16;
  int v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  char *v23;
  uint64_t v24;
  int v25;
  int v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for UnknownStorage();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(char *, char *, uint64_t))(v10 + 40);
  v11(v7, v8, v9);
  v12 = a3[6];
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (char *)a2 + v12;
  v15 = type metadata accessor for CloudAssets_Asset.ID(0);
  v16 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v13, 1, v15);
  v17 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v14, 1, v15);
  if (v16)
  {
    if (!v17)
    {
      v18 = *((_OWORD *)v14 + 1);
      *(_OWORD *)v13 = *(_OWORD *)v14;
      *((_OWORD *)v13 + 1) = v18;
      v19 = *((_OWORD *)v14 + 3);
      *((_OWORD *)v13 + 2) = *((_OWORD *)v14 + 2);
      *((_OWORD *)v13 + 3) = v19;
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))((char *)v13 + *(int *)(v15 + 32), &v14[*(int *)(v15 + 32)], v9);
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    sub_237F1A3D8((uint64_t)v13, type metadata accessor for CloudAssets_Asset.ID);
LABEL_6:
    v20 = sub_237F171BC(&qword_2568A9128);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  v30 = *((_QWORD *)v14 + 1);
  *v13 = *(_QWORD *)v14;
  v13[1] = v30;
  swift_bridgeObjectRelease();
  v31 = *((_QWORD *)v14 + 3);
  v13[2] = *((_QWORD *)v14 + 2);
  v13[3] = v31;
  swift_bridgeObjectRelease();
  v32 = v13[4];
  v33 = v13[5];
  *((_OWORD *)v13 + 2) = *((_OWORD *)v14 + 2);
  sub_237F17178(v32, v33);
  v34 = v13[6];
  v35 = v13[7];
  *((_OWORD *)v13 + 3) = *((_OWORD *)v14 + 3);
  sub_237F17178(v34, v35);
  v11((char *)v13 + *(int *)(v15 + 32), &v14[*(int *)(v15 + 32)], v9);
LABEL_7:
  v21 = a3[7];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (char *)a2 + v21;
  v24 = type metadata accessor for CloudAssets_Asset.Protector(0);
  v25 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v22, 1, v24);
  v26 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v23, 1, v24);
  if (!v25)
  {
    if (!v26)
    {
      v36 = *v22;
      v37 = v22[1];
      *(_OWORD *)v22 = *(_OWORD *)v23;
      sub_237F17178(v36, v37);
      v38 = v22[2];
      v39 = v22[3];
      *((_OWORD *)v22 + 1) = *((_OWORD *)v23 + 1);
      sub_237F17178(v38, v39);
      v11((char *)v22 + *(int *)(v24 + 24), &v23[*(int *)(v24 + 24)], v9);
      return a1;
    }
    sub_237F1A3D8((uint64_t)v22, type metadata accessor for CloudAssets_Asset.Protector);
    goto LABEL_12;
  }
  if (v26)
  {
LABEL_12:
    v28 = sub_237F171BC(&qword_2568A9130);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    return a1;
  }
  v27 = *((_OWORD *)v23 + 1);
  *(_OWORD *)v22 = *(_OWORD *)v23;
  *((_OWORD *)v22 + 1) = v27;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))((char *)v22 + *(int *)(v24 + 24), &v23[*(int *)(v24 + 24)], v9);
  _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v22, 0, 1, v24);
  return a1;
}

uint64_t sub_237F252F4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237F25300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_237F2D48C();
  sub_237F22364();
  if (v5)
  {
    v4 = *(int *)(a3 + 20);
  }
  else
  {
    sub_237F171BC(&qword_2568A9128);
    sub_237F22364();
    if (v5)
    {
      v4 = *(int *)(a3 + 24);
    }
    else
    {
      sub_237F171BC(&qword_2568A9130);
      sub_237F2D948();
    }
  }
  v6 = sub_237F2D754(v4);
  return sub_237F1BAF8(v6, v7, v8);
}

uint64_t sub_237F25370()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237F2537C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_237F2D48C();
  sub_237F22354();
  if (v6)
  {
    v5 = *(int *)(a4 + 20);
  }
  else
  {
    sub_237F171BC(&qword_2568A9128);
    sub_237F22354();
    if (v6)
    {
      v5 = *(int *)(a4 + 24);
    }
    else
    {
      sub_237F171BC(&qword_2568A9130);
      sub_237F2D930();
    }
  }
  v7 = sub_237F2D5C8(v5);
  return sub_237F1BB04(v7, v8, v9, v10);
}

uint64_t type metadata accessor for CloudAssets_Asset(uint64_t a1)
{
  return sub_237F1B2B4(a1, (uint64_t *)&unk_2568A9350);
}

void sub_237F25404()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  type metadata accessor for UnknownStorage();
  if (v0 <= 0x3F)
  {
    sub_237F24614(319, &qword_2568A9360, (void (*)(uint64_t))type metadata accessor for CloudAssets_Asset.ID);
    if (v1 <= 0x3F)
    {
      sub_237F24614(319, &qword_2568A9368, (void (*)(uint64_t))type metadata accessor for CloudAssets_Asset.Protector);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t *sub_237F254D4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    sub_237F17134(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    v9 = a2[2];
    v10 = a2[3];
    sub_237F17134(v9, v10);
    a1[2] = v9;
    a1[3] = v10;
    v11 = *(int *)(a3 + 24);
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  }
  return a1;
}

uint64_t sub_237F2558C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_237F17178(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  sub_237F17178(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for UnknownStorage();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t *sub_237F255E0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v6 = *a2;
  v7 = a2[1];
  sub_237F17134(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  v8 = a2[2];
  v9 = a2[3];
  sub_237F17134(v8, v9);
  a1[2] = v8;
  a1[3] = v9;
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

uint64_t *sub_237F2566C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v6 = *a2;
  v7 = a2[1];
  sub_237F17134(*a2, v7);
  v8 = *a1;
  v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_237F17178(v8, v9);
  v10 = a2[2];
  v11 = a2[3];
  sub_237F17134(v10, v11);
  v12 = a1[2];
  v13 = a1[3];
  a1[2] = v10;
  a1[3] = v11;
  sub_237F17178(v12, v13);
  v14 = *(int *)(a3 + 24);
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

_OWORD *sub_237F25708(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t *sub_237F25764(uint64_t *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v6 = *a1;
  v7 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_237F17178(v6, v7);
  v8 = a1[2];
  v9 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_237F17178(v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_237F257E4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_237F257F0(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a2 == 12)
  {
    sub_237F1BA50();
  }
  else
  {
    sub_237F2D48C();
    v4 = sub_237F2D754(*(int *)(a3 + 24));
    sub_237F1BAF8(v4, v5, v6);
  }
}

uint64_t sub_237F25858()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_237F25864(_QWORD *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 12)
  {
    *a1 = 0;
    a1[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * (_DWORD)a2) << 60;
    sub_237F1BA50();
  }
  else
  {
    v7 = sub_237F2D48C();
    sub_237F1BB04((uint64_t)a1 + *(int *)(a4 + 24), a2, a2, v7);
  }
}

uint64_t sub_237F258C4()
{
  return sub_237F2D344();
}

uint64_t *sub_237F258D4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a2[4];
    v10 = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_237F17134(v9, v10);
    a1[4] = v9;
    a1[5] = v10;
    v11 = a2[6];
    v12 = a2[7];
    sub_237F17134(v11, v12);
    a1[6] = v11;
    a1[7] = v12;
    v13 = *(int *)(a3 + 32);
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t sub_237F259A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237F17178(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  sub_237F17178(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v4 = a1 + *(int *)(a2 + 32);
  v5 = type metadata accessor for UnknownStorage();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_237F25A08(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a2[4];
  v9 = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_237F17134(v8, v9);
  a1[4] = v8;
  a1[5] = v9;
  v10 = a2[6];
  v11 = a2[7];
  sub_237F17134(v10, v11);
  a1[6] = v10;
  a1[7] = v11;
  v12 = *(int *)(a3 + 32);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

_QWORD *sub_237F25AB0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a2[4];
  v7 = a2[5];
  sub_237F17134(v6, v7);
  v8 = a1[4];
  v9 = a1[5];
  a1[4] = v6;
  a1[5] = v7;
  sub_237F17178(v8, v9);
  v10 = a2[6];
  v11 = a2[7];
  sub_237F17134(v10, v11);
  v12 = a1[6];
  v13 = a1[7];
  a1[6] = v10;
  a1[7] = v11;
  sub_237F17178(v12, v13);
  v14 = *(int *)(a3 + 32);
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

_OWORD *sub_237F25B8C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(a3 + 32);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

_QWORD *sub_237F25BF0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a1[4];
  v9 = a1[5];
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  sub_237F17178(v8, v9);
  v10 = a1[6];
  v11 = a1[7];
  *((_OWORD *)a1 + 3) = *(_OWORD *)(a2 + 48);
  sub_237F17178(v10, v11);
  v12 = *(int *)(a3 + 32);
  v13 = (char *)a1 + v12;
  v14 = a2 + v12;
  v15 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_237F25C8C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_237F25C98()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_237F2D678();
  if (v1)
  {
    sub_237F2D584(*(_QWORD *)(v0 + 8));
    sub_237F1BA50();
  }
  else
  {
    sub_237F2D48C();
    sub_237F2D93C();
    v3 = sub_237F2D754(v2);
    sub_237F1BAF8(v3, v4, v5);
  }
}

uint64_t sub_237F25CDC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_237F25CE8()
{
  int v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_237F2D570();
  if (v2)
  {
    *(_QWORD *)(v1 + 8) = (v0 - 1);
    sub_237F1BA50();
  }
  else
  {
    sub_237F2D48C();
    sub_237F2D924();
    v4 = sub_237F2D5C8(v3);
    sub_237F1BB04(v4, v5, v6, v7);
  }
}

uint64_t sub_237F25D28()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UnknownStorage();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_237F25DA8(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_237F2D788(a1);
  *(_OWORD *)(v1 + 32) = xmmword_237F5CEA0;
  *(_OWORD *)(v1 + 48) = xmmword_237F5CEA0;
  sub_237F2D884();
  sub_237F2D688();
  sub_237F18140();
}

void sub_237F25DD8(_OWORD *a1@<X8>)
{
  *a1 = xmmword_237F5CEA0;
  a1[1] = xmmword_237F5CEA0;
  sub_237F2D88C();
  sub_237F2D688();
  sub_237F18140();
}

uint64_t sub_237F25E08@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *a1 = 0;
  type metadata accessor for CloudAssets_Asset(0);
  sub_237F2D688();
  v1 = sub_237F2D884();
  sub_237F2D7DC(v1);
  sub_237F2D88C();
  v2 = sub_237F2D5F4();
  return sub_237F1BB04(v2, v3, v4, v5);
}

uint64_t sub_237F25E5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)a1 = MEMORY[0x24BEE4AF8];
  *(_OWORD *)(a1 + 8) = xmmword_237F5CEA0;
  *(_OWORD *)(a1 + 24) = xmmword_237F5CEA0;
  type metadata accessor for CloudAssets_SimultaneousDownloadableAssets(0);
  sub_237F2D688();
  type metadata accessor for CloudAssets_Credential(0);
  v1 = sub_237F2D5F4();
  return sub_237F2D5D8(v1, v2, v3, v4);
}

uint64_t sub_237F25EB8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_237F2D788(a1);
  *(_QWORD *)(v1 + 32) = 0;
  *(_QWORD *)(v1 + 40) = v2;
  sub_237F2D894();
  sub_237F2D688();
  type metadata accessor for Google_Protobuf_Timestamp();
  v3 = sub_237F2D5F4();
  return sub_237F2D5D8(v3, v4, v5, v6);
}

BOOL sub_237F25F0C(_BOOL8 result, char a2)
{
  if ((a2 & 1) != 0)
    return result;
  return result;
}

void sub_237F25F20(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

void sub_237F25F30(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  char v4;

  sub_237F25EF8();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 9) = v4 & 1;
}

BOOL sub_237F25F60()
{
  uint64_t v0;

  return sub_237F25F0C(*(_QWORD *)v0, *(_BYTE *)(v0 + 8));
}

void sub_237F25F6C(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  char v4;

  sub_237F25EF8();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 9) = v4 & 1;
}

void sub_237F25FA0(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = sub_237F25F0C(*(_QWORD *)v1, *(_BYTE *)(v1 + 8));
  sub_237F18140();
}

Swift::Int sub_237F25FC8()
{
  return sub_237F25FD4();
}

Swift::Int sub_237F25FD4()
{
  Hasher.init(_seed:)();
  sub_237F2D3F4();
  dispatch thunk of Hashable.hash(into:)();
  return Hasher._finalize()();
}

uint64_t sub_237F26030()
{
  sub_237F2B068();
  return Enum.hash(into:)();
}

Swift::Int sub_237F26068()
{
  return sub_237F26074();
}

Swift::Int sub_237F26074()
{
  Hasher.init(_seed:)();
  sub_237F2D3F4();
  dispatch thunk of Hashable.hash(into:)();
  return Hasher._finalize()();
}

BOOL sub_237F260CC(uint64_t a1, uint64_t a2)
{
  return sub_237F2D974(*(_QWORD *)a1, *(_BYTE *)(a1 + 8), *(_QWORD *)a2, *(_BYTE *)(a2 + 8));
}

void sub_237F260E8(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  *(_QWORD *)(a1 + 16) = 0;
  type metadata accessor for CloudAssets_Signal.Event(0);
  sub_237F2D688();
  sub_237F18140();
}

void sub_237F26120(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4AF8];
  type metadata accessor for CloudAssets_Signal(0);
  sub_237F2D688();
  sub_237F18140();
}

void sub_237F26154()
{
  qword_2568B5B60 = (uint64_t)&unk_2509CC5D8;
}

uint64_t *sub_237F26168()
{
  if (qword_2568A8EE0 != -1)
    swift_once();
  return &qword_2568B5B60;
}

uint64_t sub_237F261A8@<X0>(_QWORD *a1@<X8>)
{
  sub_237F26168();
  *a1 = qword_2568B5B60;
  return swift_bridgeObjectRetain();
}

uint64_t sub_237F261D4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_237F2D788(a1);
  type metadata accessor for CloudAssets_AssetStreamHandle(0);
  sub_237F2D688();
  v1 = type metadata accessor for CloudAssets_Asset(0);
  sub_237F2D7DC(v1);
  type metadata accessor for CloudAssets_Credential(0);
  v2 = sub_237F2D5F4();
  return sub_237F1BB04(v2, v3, v4, v5);
}

uint64_t sub_237F2622C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  _QWORD *v12;
  char *v13;

  v0 = type metadata accessor for _NameMap();
  sub_237F2B028(v0, qword_2568B5B68);
  sub_237F2B010(v0, (uint64_t)qword_2568B5B68);
  sub_237F171BC(&qword_2568A94B8);
  v1 = sub_237F171BC(&qword_2568A94C0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_237F5DD70;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "id";
  *(_QWORD *)(v7 + 8) = 2;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = type metadata accessor for _NameMap.NameDescription();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "protector";
  *((_QWORD *)v11 + 1) = 9;
  v11[16] = 2;
  v10();
  v12 = (_QWORD *)((char *)v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "size";
  *((_QWORD *)v13 + 1) = 4;
  v13[16] = 2;
  v10();
  return _NameMap.init(dictionaryLiteral:)();
}

void sub_237F263B0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = sub_237F2D470();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(v1)
      {
        case 3:
          sub_237F2D8F0();
          break;
        case 2:
          sub_237F2D714();
          sub_237F29E28();
          break;
        case 1:
          sub_237F2D55C();
          sub_237F26450();
          break;
      }
      v1 = sub_237F2D4C0();
    }
  }
  sub_237F2D504();
}

uint64_t sub_237F26450()
{
  type metadata accessor for CloudAssets_Asset(0);
  type metadata accessor for CloudAssets_Asset.ID(0);
  sub_237F173F0(&qword_2568A9038, type metadata accessor for CloudAssets_Asset.ID, (uint64_t)&unk_237F5E9A8);
  return dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
}

void sub_237F264E4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = sub_237F2D698();
  sub_237F26560(v2);
  if (!v0)
  {
    v3 = sub_237F2D804();
    sub_237F266D0(v3);
    if (*v1)
      dispatch thunk of Visitor.visitSingularInt64Field(value:fieldNumber:)();
    type metadata accessor for CloudAssets_Asset(0);
    sub_237F2D770();
  }
  sub_237F2D6E0();
}

void sub_237F26560(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v9[2];

  v2 = sub_237F171BC(&qword_2568A9128);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CloudAssets_Asset.ID(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for CloudAssets_Asset(0);
  sub_237F2B0A4(a1 + *(int *)(v8 + 24), (uint64_t)v4, &qword_2568A9128);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v4, 1, v5) == 1)
  {
    sub_237F1B910((uint64_t)v4, &qword_2568A9128);
  }
  else
  {
    sub_237F2AFD8((uint64_t)v4, (uint64_t)v7, type metadata accessor for CloudAssets_Asset.ID);
    sub_237F173F0(&qword_2568A9038, type metadata accessor for CloudAssets_Asset.ID, (uint64_t)&unk_237F5E9A8);
    dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
    sub_237F1A3D8((uint64_t)v7, type metadata accessor for CloudAssets_Asset.ID);
  }
}

void sub_237F266D0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v9[2];

  v2 = sub_237F171BC(&qword_2568A9130);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CloudAssets_Asset.Protector(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for CloudAssets_Asset(0);
  sub_237F2B0A4(a1 + *(int *)(v8 + 28), (uint64_t)v4, &qword_2568A9130);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v4, 1, v5) == 1)
  {
    sub_237F1B910((uint64_t)v4, &qword_2568A9130);
  }
  else
  {
    sub_237F2AFD8((uint64_t)v4, (uint64_t)v7, type metadata accessor for CloudAssets_Asset.Protector);
    sub_237F173F0(&qword_2568A9068, type metadata accessor for CloudAssets_Asset.Protector, (uint64_t)&unk_237F5E930);
    dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
    sub_237F1A3D8((uint64_t)v7, type metadata accessor for CloudAssets_Asset.Protector);
  }
}

void sub_237F26840()
{
  uint64_t v0;
  _QWORD *v1;
  char *v2;
  char *v3;
  char *v4;
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
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(char *, char *, uint64_t);
  char *v57;
  char *v58;
  void (*v59)(uint64_t, uint64_t);
  _QWORD *v60;
  char v61;
  _QWORD *v62;
  char v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  char *v77;

  sub_237F2D8B4();
  v77 = v2;
  v4 = (char *)v3;
  v5 = sub_237F2D48C();
  v66 = *(_QWORD *)(v5 - 8);
  v67 = v5;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v6);
  sub_237F1BD40();
  v65 = v7;
  sub_237F223E4();
  MEMORY[0x24BDAC7A8](v8);
  v64 = (char *)&v64 - v9;
  v10 = sub_237F1BBB0();
  v73 = type metadata accessor for CloudAssets_Asset.Protector(v10);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v11);
  sub_237F180DC();
  v68 = (_QWORD *)v12;
  v70 = sub_237F171BC(&qword_2568A94C8);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v13);
  sub_237F180DC();
  v74 = v14;
  sub_237F171BC(&qword_2568A9130);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v15);
  sub_237F1BD40();
  v69 = (_QWORD *)v16;
  sub_237F223E4();
  MEMORY[0x24BDAC7A8](v17);
  v71 = (uint64_t)&v64 - v18;
  sub_237F223E4();
  MEMORY[0x24BDAC7A8](v19);
  v72 = (uint64_t)&v64 - v20;
  v21 = sub_237F1BBB0();
  v22 = type metadata accessor for CloudAssets_Asset.ID(v21);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v23);
  sub_237F2D89C();
  v24 = sub_237F171BC(&qword_2568A94D0);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v25);
  sub_237F18110();
  sub_237F171BC(&qword_2568A9128);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v26);
  sub_237F2D760();
  v29 = (_QWORD *)(v27 - v28);
  v31 = MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v64 - v32;
  MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)&v64 - v34;
  v36 = type metadata accessor for CloudAssets_Asset(0);
  v37 = *(int *)(v36 + 24);
  v75 = v4;
  sub_237F2D690((uint64_t)&v4[v37], (uint64_t)v35);
  v76 = v36;
  sub_237F2D690((uint64_t)&v77[*(int *)(v36 + 24)], (uint64_t)v33);
  v38 = v0 + *(int *)(v24 + 48);
  sub_237F2D690((uint64_t)v35, v0);
  sub_237F2D690((uint64_t)v33, v38);
  sub_237F2D4CC(v0, 1, v22);
  if (v40)
  {
    sub_237F2D4FC((uint64_t)v33);
    sub_237F2D4FC((uint64_t)v35);
    v39 = sub_237F2D4CC(v38, 1, v22);
    if (v40)
    {
      sub_237F2D83C(v39, &qword_2568A9128);
      goto LABEL_11;
    }
LABEL_9:
    v41 = &qword_2568A94D0;
    v42 = v0;
    goto LABEL_27;
  }
  sub_237F2B0A4(v0, (uint64_t)v29, &qword_2568A9128);
  sub_237F2D4CC(v38, 1, v22);
  if (v40)
  {
    sub_237F2D4FC((uint64_t)v33);
    sub_237F2D4FC((uint64_t)v35);
    sub_237F1A3D8((uint64_t)v29, type metadata accessor for CloudAssets_Asset.ID);
    goto LABEL_9;
  }
  sub_237F2AFD8(v38, (uint64_t)v1, type metadata accessor for CloudAssets_Asset.ID);
  sub_237F273D8(v29, v1);
  v44 = v43;
  sub_237F2D734((uint64_t)v1);
  sub_237F2D8FC((uint64_t)v33);
  sub_237F2D8FC((uint64_t)v35);
  sub_237F2D734((uint64_t)v29);
  sub_237F2D8FC(v0);
  if ((v44 & 1) == 0)
    goto LABEL_28;
LABEL_11:
  v46 = v75;
  v45 = v76;
  v47 = v72;
  sub_237F2D630((uint64_t)&v75[*(int *)(v76 + 28)], v72);
  v48 = v77;
  v49 = v71;
  sub_237F2D630((uint64_t)&v77[*(int *)(v45 + 28)], v71);
  v50 = v74;
  v51 = v74 + *(int *)(v70 + 48);
  sub_237F2D630(v47, v74);
  sub_237F2D630(v49, v51);
  v52 = v73;
  sub_237F2D4CC(v50, 1, v73);
  if (!v40)
  {
    v60 = v69;
    sub_237F2B0A4(v50, (uint64_t)v69, &qword_2568A9130);
    sub_237F2D4CC(v51, 1, v52);
    if (!v61)
    {
      v62 = v68;
      sub_237F2AFD8(v51, (uint64_t)v68, type metadata accessor for CloudAssets_Asset.Protector);
      if ((MEMORY[0x23B8279F0](*v60, v60[1], *v62, v62[1]) & 1) != 0
        && (MEMORY[0x23B8279F0](v60[2], v60[3], v62[2], v62[3]) & 1) != 0)
      {
        sub_237F173F0(&qword_2568A94D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
        v63 = dispatch thunk of static Equatable.== infix(_:_:)();
        sub_237F1BC88((uint64_t)v62);
        sub_237F2D598(v49);
        sub_237F2D598(v47);
        sub_237F1BC88((uint64_t)v60);
        sub_237F2D598(v50);
        if ((v63 & 1) == 0)
          goto LABEL_28;
        goto LABEL_16;
      }
      sub_237F2D734((uint64_t)v62);
      sub_237F2D5A0(v49);
      sub_237F2D5A0(v47);
      sub_237F2D734((uint64_t)v60);
      v42 = v50;
      v41 = &qword_2568A9130;
LABEL_27:
      sub_237F1B910(v42, v41);
      goto LABEL_28;
    }
    sub_237F2D4FC(v49);
    sub_237F2D4FC(v47);
    sub_237F1A3D8((uint64_t)v60, type metadata accessor for CloudAssets_Asset.Protector);
LABEL_21:
    v41 = &qword_2568A94C8;
    v42 = v50;
    goto LABEL_27;
  }
  sub_237F2D5A0(v49);
  sub_237F2D5A0(v47);
  sub_237F2D4CC(v51, 1, v52);
  if (!v40)
    goto LABEL_21;
  sub_237F1B910(v50, &qword_2568A9130);
LABEL_16:
  if (*(_QWORD *)v46 == *(_QWORD *)v48)
  {
    v53 = v76;
    v55 = v66;
    v54 = v67;
    v56 = *(void (**)(char *, char *, uint64_t))(v66 + 16);
    v57 = v64;
    v56(v64, &v46[*(int *)(v76 + 20)], v67);
    v58 = v65;
    v56(v65, &v48[*(int *)(v53 + 20)], v54);
    sub_237F173F0(&qword_2568A94D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    dispatch thunk of static Equatable.== infix(_:_:)();
    v59 = *(void (**)(uint64_t, uint64_t))(v55 + 8);
    v59((uint64_t)v58, v54);
    v59((uint64_t)v57, v54);
  }
LABEL_28:
  sub_237F2D4A8();
}

unint64_t sub_237F26E18()
{
  return 0xD000000000000011;
}

uint64_t (*sub_237F26E40())()
{
  return nullsub_1;
}

void sub_237F26E54()
{
  sub_237F263B0();
}

void sub_237F26E68()
{
  sub_237F264E4();
}

uint64_t sub_237F26E80()
{
  sub_237F173F0(&qword_2568A9490, type metadata accessor for CloudAssets_Asset, (uint64_t)&unk_237F5E6E0);
  return _MessageImplementationBase.isEqualTo(message:)();
}

uint64_t sub_237F26ED4(uint64_t a1, uint64_t a2)
{
  return sub_237F2A8A0(a1, a2, &qword_2568A8EE8, (uint64_t)qword_2568B5B68);
}

uint64_t sub_237F26EF0()
{
  sub_237F173F0(&qword_2568A9088, type metadata accessor for CloudAssets_Asset, (uint64_t)&unk_237F5E8B8);
  return Message.debugDescription.getter();
}

Swift::Int sub_237F26F30()
{
  return sub_237F2A720(type metadata accessor for CloudAssets_Asset, &qword_2568A9438, (uint64_t)&unk_237F5E650);
}

uint64_t sub_237F26F5C()
{
  sub_237F173F0(&qword_2568A9088, type metadata accessor for CloudAssets_Asset, (uint64_t)&unk_237F5E8B8);
  return Message.hash(into:)();
}

void sub_237F26FB4(int a1)
{
  Swift::String v1;

  v1._countAndFlagsBits = 4475182;
  v1._object = (void *)0xE300000000000000;
  sub_237F27714(a1, v1, qword_2568B5B80, &qword_2568B5B80[1]);
}

_QWORD *sub_237F26FD0()
{
  if (qword_2568A8EF0 != -1)
    swift_once();
  return qword_2568B5B80;
}

uint64_t sub_237F27010()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;

  v0 = type metadata accessor for _NameMap();
  sub_237F2B028(v0, qword_2568B5B90);
  sub_237F2B010(v0, (uint64_t)qword_2568B5B90);
  sub_237F171BC(&qword_2568A94B8);
  v1 = sub_237F171BC(&qword_2568A94C0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_237F5DD80;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "partition";
  *(_QWORD *)(v7 + 8) = 9;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = type metadata accessor for _NameMap.NameDescription();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "owner_id";
  *(_QWORD *)(v11 + 8) = 8;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "signature";
  *((_QWORD *)v13 + 1) = 9;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "reference_signature";
  *((_QWORD *)v15 + 1) = 19;
  v15[16] = 2;
  v10();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t sub_237F271DC(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = type metadata accessor for _NameMap();
  return sub_237F2B010(v3, a2);
}

void sub_237F2721C()
{
  uint64_t v0;
  char v1;
  char v3;
  char v4;

  sub_237F2D470();
  if (!v0)
  {
    while ((v1 & 1) == 0)
    {
      sub_237F2D968();
      if (!(!v4 & v3))
        __asm { BR              X9 }
      sub_237F2D4C0();
    }
  }
  sub_237F2D504();
}

void sub_237F272AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_237F2D954();
  sub_237F2D494();
  if (!v2 || (v0 = v1, sub_237F2D6CC(), !v1))
  {
    sub_237F2D494();
    if (!v3 || (v0 = v1, sub_237F2D6CC(), !v1))
    {
      if ((sub_237F2D700() & 1) != 0 || (sub_237F2D5B8(), !v0))
      {
        if ((sub_237F2D700() & 1) != 0 || (sub_237F2D5B8(), !v0))
        {
          type metadata accessor for CloudAssets_Asset.ID(0);
          UnknownStorage.traverse<A>(visitor:)();
        }
      }
    }
  }
  sub_237F2D7C8();
}

uint64_t sub_237F2738C(uint64_t a1, unint64_t a2)
{
  return ((uint64_t (*)(void))((char *)sub_237F273B0 + 4 * byte_237F5DDA4[a2 >> 62]))();
}

BOOL sub_237F273B0(uint64_t a1, uint64_t a2)
{
  return BYTE6(a2) == 0;
}

void sub_237F273D8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);

  sub_237F2D48C();
  sub_237F2D608();
  MEMORY[0x24BDAC7A8](v8);
  sub_237F2D4E0();
  MEMORY[0x24BDAC7A8](v9);
  v10 = sub_237F2D86C();
  v14 = v10 == v13 && v11 == v12;
  if (v14 || (sub_237F1BD24() & 1) != 0)
  {
    v15 = a1[2] == a2[2] && a1[3] == a2[3];
    if ((v15 || (sub_237F1BD24() & 1) != 0)
      && (MEMORY[0x23B8279F0](a1[4], a1[5], a2[4], a2[5]) & 1) != 0
      && (MEMORY[0x23B8279F0](a1[6], a1[7], a2[6], a2[7]) & 1) != 0)
    {
      v16 = sub_237F2D884();
      sub_237F2D518(*(int *)(v16 + 32));
      sub_237F2D5A8(*(int *)(v16 + 32));
      sub_237F173F0(&qword_2568A94D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      sub_237F2D52C();
      v17 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
      v17(v2, v3);
      v17(v4, v3);
    }
  }
  sub_237F1B9EC();
}

uint64_t sub_237F274EC(uint64_t a1, uint64_t a2)
{
  return sub_237F29A14(a1, a2, (void (*)(void))sub_237F26FD0, qword_2568B5B80);
}

uint64_t sub_237F27504@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 32);
  v5 = type metadata accessor for UnknownStorage();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_237F27544(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 32);
  v5 = type metadata accessor for UnknownStorage();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_237F27584())()
{
  return nullsub_1;
}

void sub_237F27598()
{
  sub_237F2721C();
}

void sub_237F275AC()
{
  sub_237F272AC();
}

uint64_t sub_237F275C0()
{
  sub_237F173F0(&qword_2568A9480, type metadata accessor for CloudAssets_Asset.ID, (uint64_t)&unk_237F5E5F0);
  return _MessageImplementationBase.isEqualTo(message:)();
}

uint64_t sub_237F27610(uint64_t a1, uint64_t a2)
{
  return sub_237F2A8A0(a1, a2, &qword_2568A8EF8, (uint64_t)qword_2568B5B90);
}

uint64_t sub_237F2762C()
{
  sub_237F173F0(&qword_2568A9038, type metadata accessor for CloudAssets_Asset.ID, (uint64_t)&unk_237F5E9A8);
  return Message.debugDescription.getter();
}

Swift::Int sub_237F2766C()
{
  return sub_237F2A720(type metadata accessor for CloudAssets_Asset.ID, &qword_2568A9428, (uint64_t)&unk_237F5E560);
}

uint64_t sub_237F27698()
{
  sub_237F173F0(&qword_2568A9038, type metadata accessor for CloudAssets_Asset.ID, (uint64_t)&unk_237F5E9A8);
  return Message.hash(into:)();
}

void sub_237F276EC(int a1)
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x746365746F72502ELL;
  v1._object = (void *)0xEA0000000000726FLL;
  sub_237F27714(a1, v1, qword_2568B5BA8, &qword_2568B5BA8[1]);
}

void sub_237F27714(int a1, Swift::String a2, _QWORD *a3, _QWORD *a4)
{
  String.append(_:)(a2);
  *a3 = 0xD000000000000011;
  *a4 = 0x8000000237F64910;
}

_QWORD *sub_237F2777C()
{
  if (qword_2568A8F00 != -1)
    swift_once();
  return qword_2568B5BA8;
}

uint64_t sub_237F277BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = type metadata accessor for _NameMap();
  sub_237F2B028(v0, qword_2568B5BB8);
  sub_237F2B010(v0, (uint64_t)qword_2568B5BB8);
  sub_237F171BC(&qword_2568A94B8);
  v1 = sub_237F171BC(&qword_2568A94C0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_237F5DD90;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "security_key";
  *(_QWORD *)(v7 + 8) = 12;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C328];
  v9 = type metadata accessor for _NameMap.NameDescription();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "privacy_key";
  *((_QWORD *)v11 + 1) = 11;
  v11[16] = 2;
  v10();
  return _NameMap.init(dictionaryLiteral:)();
}

void sub_237F2790C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = sub_237F2D470();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (v1 == 2 || v1 == 1)
        sub_237F2D7B0();
      v1 = sub_237F2D4C0();
    }
  }
  sub_237F2D6F0();
}

void sub_237F27968()
{
  __asm { BR              X10 }
}

void sub_237F279B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if ((a2 & 0xFF000000000000) != 0 && (sub_237F2D7F0(), v2))
    sub_237F2D6E0();
  else
    ((void (*)(_QWORD))((char *)&loc_237F27A04 + 4 * byte_237F5DDAC[*(_QWORD *)(v3 + 24) >> 62]))(*(_QWORD *)(v3 + 16));
}

void sub_237F27A60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_237F2D48C();
  sub_237F2D608();
  MEMORY[0x24BDAC7A8](v5);
  sub_237F2D4E0();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_237F2D86C();
  if ((MEMORY[0x23B8279F0](v7) & 1) != 0
    && (MEMORY[0x23B8279F0](*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24)) & 1) != 0)
  {
    v8 = sub_237F2D88C();
    sub_237F2D518(*(int *)(v8 + 24));
    sub_237F2D5A8(*(int *)(v8 + 24));
    sub_237F173F0(&qword_2568A94D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    sub_237F2D52C();
    sub_237F2D61C();
    sub_237F2D70C(v2);
  }
  sub_237F1B9EC();
}

uint64_t sub_237F27B20(uint64_t a1, uint64_t a2)
{
  return sub_237F29A14(a1, a2, (void (*)(void))sub_237F2777C, qword_2568B5BA8);
}

uint64_t (*sub_237F27B40())()
{
  return nullsub_1;
}

void sub_237F27B54()
{
  sub_237F2790C();
}

void sub_237F27B68()
{
  sub_237F27968();
}

uint64_t sub_237F27B7C()
{
  sub_237F173F0(&qword_2568A9488, type metadata accessor for CloudAssets_Asset.Protector, (uint64_t)&unk_237F5E500);
  return _MessageImplementationBase.isEqualTo(message:)();
}

uint64_t sub_237F27BCC(uint64_t a1, uint64_t a2)
{
  return sub_237F2A8A0(a1, a2, &qword_2568A8F08, (uint64_t)qword_2568B5BB8);
}

uint64_t sub_237F27BE8()
{
  sub_237F173F0(&qword_2568A9068, type metadata accessor for CloudAssets_Asset.Protector, (uint64_t)&unk_237F5E930);
  return Message.debugDescription.getter();
}

Swift::Int sub_237F27C28()
{
  return sub_237F2A720(type metadata accessor for CloudAssets_Asset.Protector, &qword_2568A9418, (uint64_t)&unk_237F5E470);
}

uint64_t sub_237F27C54()
{
  sub_237F173F0(&qword_2568A9068, type metadata accessor for CloudAssets_Asset.Protector, (uint64_t)&unk_237F5E930);
  return Message.hash(into:)();
}

uint64_t sub_237F27CA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;

  v0 = type metadata accessor for _NameMap();
  sub_237F2B028(v0, qword_2568B5BD0);
  sub_237F2B010(v0, (uint64_t)qword_2568B5BD0);
  sub_237F171BC(&qword_2568A94B8);
  v1 = sub_237F171BC(&qword_2568A94C0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_237F5DD80;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "tenant_name";
  *(_QWORD *)(v7 + 8) = 11;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C328];
  v9 = type metadata accessor for _NameMap.NameDescription();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "requestor_id";
  *(_QWORD *)(v11 + 8) = 12;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "access_token";
  *((_QWORD *)v13 + 1) = 12;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "expiration_date";
  *((_QWORD *)v15 + 1) = 15;
  v15[16] = 2;
  v10();
  return _NameMap.init(dictionaryLiteral:)();
}

void sub_237F27E60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;

  sub_237F1B9D4();
  sub_237F2D470();
  if (!v12)
  {
    while ((v13 & 1) == 0)
    {
      sub_237F2D968();
      if (!(!v24 & v23))
      {
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_237F27EC0 + 4 * byte_237F5DDB0[v22]))(v14, v15, v16, v17, v18, v19, v20, v21, a9, a10, a11, a12);
        return;
      }
      sub_237F2D4C0();
    }
  }
  sub_237F1B978();
}

void sub_237F27F10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = v3;
  sub_237F2D494();
  if (!v9 || (sub_237F2D6D8(), !v4))
  {
    sub_237F2D494();
    if (!v10 || (sub_237F2D6D8(), !v4))
    {
      sub_237F2D494();
      if (!v11 || (sub_237F2D6D8(), !v4))
      {
        sub_237F27FFC(v5, a1, a2, a3);
        if (!v4)
        {
          type metadata accessor for CloudAssets_Credential(0);
          UnknownStorage.traverse<A>(visitor:)();
        }
      }
    }
  }
  sub_237F2D6F0();
}

void sub_237F27FFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = a4;
  v5 = sub_237F171BC(&qword_2568A9190);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Google_Protobuf_Timestamp();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for CloudAssets_Credential(0);
  sub_237F2B0A4(a1 + *(int *)(v12 + 32), (uint64_t)v7, &qword_2568A9190);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v7, 1, v8) == 1)
  {
    sub_237F1B910((uint64_t)v7, &qword_2568A9190);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    sub_237F173F0(&qword_2568A94B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B980]);
    dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

void sub_237F28170()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
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
  _BYTE *v22;
  uint64_t v23;
  _BYTE *v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  void (*v35)(_BYTE *, char *, uint64_t);
  uint64_t v36;
  char *v37;
  uint64_t v38;
  _BYTE v39[4];
  int v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  sub_237F2D8B4();
  v3 = v2;
  v5 = v4;
  v6 = sub_237F2D48C();
  v45 = *(_QWORD *)(v6 - 8);
  v46 = v6;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v7);
  sub_237F1BD40();
  v44 = v8;
  sub_237F223E4();
  MEMORY[0x24BDAC7A8](v9);
  v43 = &v39[-v10];
  sub_237F1BBB0();
  v11 = type metadata accessor for Google_Protobuf_Timestamp();
  v47 = *(_QWORD *)(v11 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v12);
  sub_237F2D89C();
  v13 = sub_237F171BC(&qword_2568A94E0);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v14);
  sub_237F1B99C();
  sub_237F171BC(&qword_2568A9190);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v15);
  sub_237F2D760();
  v18 = v16 - v17;
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = &v39[-v21];
  MEMORY[0x24BDAC7A8](v20);
  v24 = &v39[-v23];
  v25 = *v5 == *v3 && v5[1] == v3[1];
  if (!v25 && (sub_237F1BD24() & 1) == 0)
    goto LABEL_27;
  v26 = v5[2] == v3[2] && v5[3] == v3[3];
  if (!v26 && (sub_237F1BD24() & 1) == 0)
    goto LABEL_27;
  v27 = v5[4] == v3[4] && v5[5] == v3[5];
  if (!v27 && (sub_237F1BD24() & 1) == 0)
    goto LABEL_27;
  v41 = v1;
  v28 = sub_237F2D894();
  sub_237F2D630((uint64_t)v5 + *(int *)(v28 + 32), (uint64_t)v24);
  v42 = v28;
  sub_237F2D630((uint64_t)v3 + *(int *)(v28 + 32), (uint64_t)v22);
  v29 = v0 + *(int *)(v13 + 48);
  sub_237F2D630((uint64_t)v24, v0);
  sub_237F2D630((uint64_t)v22, v29);
  sub_237F2D4CC(v0, 1, v11);
  if (v25)
  {
    sub_237F2D598((uint64_t)v22);
    sub_237F2D598((uint64_t)v24);
    sub_237F2D4CC(v29, 1, v11);
    if (v25)
    {
      sub_237F1B910(v0, &qword_2568A9190);
LABEL_26:
      v32 = v42;
      v33 = (char *)v5 + *(int *)(v42 + 28);
      v34 = v46;
      v35 = *(void (**)(_BYTE *, char *, uint64_t))(v45 + 16);
      v36 = (uint64_t)v43;
      v35(v43, v33, v46);
      v37 = (char *)v3 + *(int *)(v32 + 28);
      v38 = v44;
      v35((_BYTE *)v44, v37, v34);
      sub_237F173F0(&qword_2568A94D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      dispatch thunk of static Equatable.== infix(_:_:)();
      sub_237F2D81C(v38);
      sub_237F2D81C(v36);
      goto LABEL_27;
    }
    goto LABEL_24;
  }
  sub_237F2B0A4(v0, v18, &qword_2568A9190);
  sub_237F2D4CC(v29, 1, v11);
  if (v30)
  {
    sub_237F2D4FC((uint64_t)v22);
    sub_237F2D4FC((uint64_t)v24);
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v18, v11);
LABEL_24:
    sub_237F1B910(v0, &qword_2568A94E0);
    goto LABEL_27;
  }
  v31 = v41;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 32))(v41, v29, v11);
  sub_237F173F0(&qword_2568A94E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B9A0]);
  v40 = dispatch thunk of static Equatable.== infix(_:_:)();
  sub_237F2D81C(v31);
  sub_237F2D598((uint64_t)v22);
  sub_237F2D598((uint64_t)v24);
  sub_237F2D81C(v18);
  sub_237F2D598(v0);
  if ((v40 & 1) != 0)
    goto LABEL_26;
LABEL_27:
  sub_237F2D4A8();
}

unint64_t sub_237F28514()
{
  return 0xD000000000000016;
}

uint64_t (*sub_237F28538())()
{
  return nullsub_1;
}

#error "237F28554: call analysis failed (funcsize=5)"

void sub_237F28560(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_237F27F10(a1, a2, a3);
}

uint64_t sub_237F28574()
{
  sub_237F173F0(&qword_2568A94A8, type metadata accessor for CloudAssets_Credential, (uint64_t)&unk_237F5E410);
  return _MessageImplementationBase.isEqualTo(message:)();
}

uint64_t sub_237F285C4(uint64_t a1, uint64_t a2)
{
  return sub_237F2A8A0(a1, a2, &qword_2568A8F10, (uint64_t)qword_2568B5BD0);
}

uint64_t sub_237F285E0()
{
  sub_237F173F0(&qword_2568A9400, type metadata accessor for CloudAssets_Credential, (uint64_t)&unk_237F5E750);
  return Message.debugDescription.getter();
}

Swift::Int sub_237F28620()
{
  return sub_237F2A720(type metadata accessor for CloudAssets_Credential, &qword_2568A9408, (uint64_t)&unk_237F5E380);
}

uint64_t sub_237F2864C()
{
  sub_237F173F0(&qword_2568A9400, type metadata accessor for CloudAssets_Credential, (uint64_t)&unk_237F5E750);
  return Message.hash(into:)();
}

uint64_t sub_237F286A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;

  v0 = type metadata accessor for _NameMap();
  sub_237F2B028(v0, qword_2568B5BE8);
  sub_237F2B010(v0, (uint64_t)qword_2568B5BE8);
  sub_237F171BC(&qword_2568A94B8);
  v1 = sub_237F171BC(&qword_2568A94C0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_237F5DD80;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "assets";
  *(_QWORD *)(v7 + 8) = 6;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = type metadata accessor for _NameMap.NameDescription();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "storage_reference";
  *(_QWORD *)(v11 + 8) = 17;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "credential";
  *((_QWORD *)v13 + 1) = 10;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "storage_reference_signature";
  *((_QWORD *)v15 + 1) = 27;
  v15[16] = 2;
  v10();
  return _NameMap.init(dictionaryLiteral:)();
}

void sub_237F28868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;

  sub_237F1B9D4();
  sub_237F2D470();
  if (!v12)
  {
    while ((v13 & 1) == 0)
    {
      sub_237F2D968();
      if (!(!v24 & v23))
      {
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_237F288C8 + 4 * byte_237F5DDB4[v22]))(v14, v15, v16, v17, v18, v19, v20, v21, a9, a10, a11, a12);
        return;
      }
      sub_237F2D4C0();
    }
  }
  sub_237F1B978();
}

void sub_237F28938()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_237F2D954();
  if (!*(_QWORD *)(*(_QWORD *)v0 + 16)
    || (type metadata accessor for CloudAssets_Asset(0),
        sub_237F173F0(&qword_2568A9088, type metadata accessor for CloudAssets_Asset, (uint64_t)&unk_237F5E8B8),
        sub_237F2D844(),
        v1 = v2,
        dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)(),
        !v2))
  {
    if ((sub_237F2D700() & 1) != 0 || (sub_237F2D5B8(), (v2 = v1) == 0))
    {
      sub_237F2A0BC();
      if (!v2)
      {
        if ((sub_237F2D700() & 1) == 0)
          sub_237F2D5B8();
        type metadata accessor for CloudAssets_SimultaneousDownloadableAssets(0);
        UnknownStorage.traverse<A>(visitor:)();
      }
    }
  }
  sub_237F2D504();
}

#error "237F28B68: call analysis failed (funcsize=189)"

unint64_t sub_237F28D78()
{
  return 0xD00000000000002ALL;
}

uint64_t sub_237F28D94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_237F2D48C();
  v0 = sub_237F18128();
  return sub_237F180F8(v0, v1, v2, v3);
}

uint64_t sub_237F28DBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_237F2D48C();
  v0 = sub_237F2D640();
  return sub_237F180F8(v0, v1, v2, v3);
}

#error "237F28DEC: call analysis failed (funcsize=5)"

void sub_237F28DF8()
{
  sub_237F28938();
}

uint64_t sub_237F28E0C()
{
  sub_237F173F0(&qword_2568A9498, type metadata accessor for CloudAssets_SimultaneousDownloadableAssets, (uint64_t)&unk_237F5E320);
  return _MessageImplementationBase.isEqualTo(message:)();
}

uint64_t sub_237F28E5C(uint64_t a1, uint64_t a2)
{
  return sub_237F2A8A0(a1, a2, &qword_2568A8F18, (uint64_t)qword_2568B5BE8);
}

uint64_t sub_237F28E78()
{
  sub_237F173F0(&qword_2568A9148, type metadata accessor for CloudAssets_SimultaneousDownloadableAssets, (uint64_t)&unk_237F5E840);
  return Message.debugDescription.getter();
}

Swift::Int sub_237F28EB8()
{
  return sub_237F2A720(type metadata accessor for CloudAssets_SimultaneousDownloadableAssets, &qword_2568A93F0, (uint64_t)&unk_237F5E290);
}

uint64_t sub_237F28EE4()
{
  sub_237F173F0(&qword_2568A9148, type metadata accessor for CloudAssets_SimultaneousDownloadableAssets, (uint64_t)&unk_237F5E840);
  return Message.hash(into:)();
}

uint64_t sub_237F28F38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = type metadata accessor for _NameMap();
  sub_237F2B028(v0, qword_2568B5C00);
  sub_237F2B010(v0, (uint64_t)qword_2568B5C00);
  sub_237F171BC(&qword_2568A94B8);
  v1 = sub_237F171BC(&qword_2568A94C0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 32) & ~v2;
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_237F5D500;
  v5 = v4 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v4 + v3) = 1;
  *(_QWORD *)v5 = "events";
  *(_QWORD *)(v5 + 8) = 6;
  *(_BYTE *)(v5 + 16) = 2;
  v6 = *MEMORY[0x24BE5C318];
  v7 = type metadata accessor for _NameMap.NameDescription();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  return _NameMap.init(dictionaryLiteral:)();
}

void sub_237F2903C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = sub_237F2D470();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (v1 == 1)
      {
        sub_237F2D714();
        sub_237F2909C();
      }
      v1 = sub_237F2D4C0();
    }
  }
  sub_237F2D7C8();
}

void sub_237F2909C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);

  sub_237F1B9D4();
  sub_237F2D540(v0, v1, v2, v3, v4);
  sub_237F2D5E0();
  dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)();
  sub_237F1B978();
}

void sub_237F290EC()
{
  uint64_t v0;
  uint64_t v1;

  sub_237F2D8DC();
  if (!*(_QWORD *)(*(_QWORD *)v1 + 16)
    || (type metadata accessor for CloudAssets_Signal.Event(0),
        sub_237F173F0(&qword_2568A93B8, type metadata accessor for CloudAssets_Signal.Event, (uint64_t)&unk_237F5E0D8),
        sub_237F2D844(),
        dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)(),
        !v0))
  {
    type metadata accessor for CloudAssets_Signal(0);
    sub_237F2D6BC();
  }
  sub_237F2D504();
}

void sub_237F29184()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;

  sub_237F2D48C();
  sub_237F2D608();
  MEMORY[0x24BDAC7A8](v1);
  sub_237F2D4E0();
  MEMORY[0x24BDAC7A8](v2);
  sub_237F2D85C();
  sub_237F31D88();
  if ((v3 & 1) != 0)
  {
    v4 = type metadata accessor for CloudAssets_Signal(0);
    sub_237F2D518(*(int *)(v4 + 20));
    sub_237F2D5A8(*(int *)(v4 + 20));
    sub_237F173F0(&qword_2568A94D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    sub_237F2D52C();
    sub_237F2D61C();
    sub_237F2D70C(v0);
  }
  sub_237F1B9EC();
}

unint64_t sub_237F29240()
{
  return 0xD000000000000012;
}

uint64_t sub_237F2925C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_237F2D48C();
  v0 = sub_237F18128();
  return sub_237F180F8(v0, v1, v2, v3);
}

uint64_t sub_237F29284()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_237F2D48C();
  v0 = sub_237F2D640();
  return sub_237F180F8(v0, v1, v2, v3);
}

void sub_237F292AC()
{
  sub_237F2903C();
}

void sub_237F292C0()
{
  sub_237F290EC();
}

uint64_t sub_237F292D4()
{
  sub_237F173F0(&qword_2568A94A0, type metadata accessor for CloudAssets_Signal, (uint64_t)&unk_237F5E230);
  return _MessageImplementationBase.isEqualTo(message:)();
}

uint64_t sub_237F29324(uint64_t a1, uint64_t a2)
{
  return sub_237F2A8A0(a1, a2, &qword_2568A8F20, (uint64_t)qword_2568B5C00);
}

uint64_t sub_237F29340()
{
  sub_237F173F0((unint64_t *)&qword_2568A93D8, type metadata accessor for CloudAssets_Signal, (uint64_t)&unk_237F5E7C8);
  return Message.debugDescription.getter();
}

Swift::Int sub_237F29380()
{
  return sub_237F2A720(type metadata accessor for CloudAssets_Signal, &qword_2568A93E0, (uint64_t)&unk_237F5E1A0);
}

uint64_t sub_237F293AC()
{
  sub_237F173F0((unint64_t *)&qword_2568A93D8, type metadata accessor for CloudAssets_Signal, (uint64_t)&unk_237F5E7C8);
  return Message.hash(into:)();
}

uint64_t sub_237F29400()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = type metadata accessor for _NameMap();
  sub_237F2B028(v0, qword_2568B5C18);
  sub_237F2B010(v0, (uint64_t)qword_2568B5C18);
  sub_237F171BC(&qword_2568A94B8);
  v1 = sub_237F171BC(&qword_2568A94C0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_237F5DD90;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 0;
  *(_QWORD *)v7 = "STORAGE_CONTAINER_UPLOAD_START";
  *(_QWORD *)(v7 + 8) = 30;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = type metadata accessor for _NameMap.NameDescription();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 1;
  *(_QWORD *)v11 = "ALL_UPLOADS_FINISH";
  *((_QWORD *)v11 + 1) = 18;
  v11[16] = 2;
  v10();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t sub_237F29550(uint64_t a1, uint64_t a2)
{
  return sub_237F2A8A0(a1, a2, &qword_2568A8F28, (uint64_t)qword_2568B5C18);
}

void sub_237F2956C()
{
  Swift::String v0;

  v0._countAndFlagsBits = 0x746E6576452ELL;
  v0._object = (void *)0xE600000000000000;
  String.append(_:)(v0);
  qword_2568B5C30 = 0xD000000000000012;
  *(_QWORD *)algn_2568B5C38 = 0x8000000237F64960;
}

uint64_t *sub_237F295D0()
{
  if (qword_2568A8F30 != -1)
    swift_once();
  return &qword_2568B5C30;
}

uint64_t sub_237F29610()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = type metadata accessor for _NameMap();
  sub_237F2B028(v0, qword_2568B5C40);
  sub_237F2B010(v0, (uint64_t)qword_2568B5C40);
  sub_237F171BC(&qword_2568A94B8);
  v1 = sub_237F171BC(&qword_2568A94C0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_237F5DD90;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "type";
  *(_QWORD *)(v7 + 8) = 4;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = type metadata accessor for _NameMap.NameDescription();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "container_index";
  *((_QWORD *)v11 + 1) = 15;
  v11[16] = 2;
  v10();
  return _NameMap.init(dictionaryLiteral:)();
}

void sub_237F29768()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = sub_237F2D470();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (v1 == 2)
      {
        sub_237F2D8F0();
      }
      else if (v1 == 1)
      {
        sub_237F2D55C();
        sub_237F297CC();
      }
      v1 = sub_237F2D4C0();
    }
  }
  sub_237F2D6F0();
}

uint64_t sub_237F297CC()
{
  sub_237F2B068();
  return dispatch thunk of Decoder.decodeSingularEnumField<A>(value:)();
}

uint64_t sub_237F29830()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t result;

  sub_237F2D8DC();
  if (!*v1
    || (sub_237F2B068(), result = dispatch thunk of Visitor.visitSingularEnumField<A>(value:fieldNumber:)(), !v0))
  {
    if (!*(_QWORD *)(v2 + 16)
      || (result = dispatch thunk of Visitor.visitSingularInt64Field(value:fieldNumber:)(), !v0))
    {
      type metadata accessor for CloudAssets_Signal.Event(0);
      return sub_237F2D6BC();
    }
  }
  return result;
}

void sub_237F298F8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_237F2D48C();
  sub_237F2D608();
  MEMORY[0x24BDAC7A8](v5);
  sub_237F2D4E0();
  MEMORY[0x24BDAC7A8](v6);
  sub_237F2D85C();
  v7 = *a1;
  v8 = *a2;
  if (*((_BYTE *)a1 + 8))
    v7 = *a1 != 0;
  if (*((_BYTE *)a2 + 8) == 1)
  {
    if (v8)
    {
      if (v7 != 1)
        goto LABEL_12;
    }
    else if (v7)
    {
      goto LABEL_12;
    }
  }
  else if (v7 != v8)
  {
    goto LABEL_12;
  }
  if (a1[2] == a2[2])
  {
    v9 = type metadata accessor for CloudAssets_Signal.Event(0);
    sub_237F2D518(*(int *)(v9 + 24));
    sub_237F2D5A8(*(int *)(v9 + 24));
    sub_237F173F0(&qword_2568A94D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    sub_237F2D52C();
    sub_237F2D61C();
    sub_237F2D70C(v2);
  }
LABEL_12:
  sub_237F1B9EC();
}

uint64_t sub_237F299FC(uint64_t a1, uint64_t a2)
{
  return sub_237F29A14(a1, a2, (void (*)(void))sub_237F295D0, &qword_2568B5C30);
}

uint64_t sub_237F29A14(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t *a4)
{
  uint64_t v5;

  a3();
  v5 = *a4;
  swift_bridgeObjectRetain();
  return v5;
}

void sub_237F29A50()
{
  sub_237F29768();
}

uint64_t sub_237F29A64()
{
  return sub_237F29830();
}

uint64_t sub_237F29A78()
{
  sub_237F173F0(&qword_2568A94F8, type metadata accessor for CloudAssets_Signal.Event, (uint64_t)&unk_237F5E0A0);
  return _MessageImplementationBase.isEqualTo(message:)();
}

uint64_t sub_237F29AC8(uint64_t a1, uint64_t a2)
{
  return sub_237F2A8A0(a1, a2, &qword_2568A8F38, (uint64_t)qword_2568B5C40);
}

uint64_t sub_237F29AE4()
{
  sub_237F173F0(&qword_2568A93B8, type metadata accessor for CloudAssets_Signal.Event, (uint64_t)&unk_237F5E0D8);
  return Message.debugDescription.getter();
}

Swift::Int sub_237F29B24()
{
  return sub_237F2A720(type metadata accessor for CloudAssets_Signal.Event, &qword_2568A93C0, (uint64_t)&unk_237F5E010);
}

uint64_t sub_237F29B50()
{
  sub_237F173F0(&qword_2568A93B8, type metadata accessor for CloudAssets_Signal.Event, (uint64_t)&unk_237F5E0D8);
  return Message.hash(into:)();
}

uint64_t sub_237F29BA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;

  v0 = type metadata accessor for _NameMap();
  sub_237F2B028(v0, qword_2568B5C58);
  sub_237F2B010(v0, (uint64_t)qword_2568B5C58);
  sub_237F171BC(&qword_2568A94B8);
  v1 = sub_237F171BC(&qword_2568A94C0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_237F5DD80;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "asset";
  *(_QWORD *)(v7 + 8) = 5;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = type metadata accessor for _NameMap.NameDescription();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "credential";
  *(_QWORD *)(v11 + 8) = 10;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "type";
  *((_QWORD *)v13 + 1) = 4;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "applicationID";
  *((_QWORD *)v15 + 1) = 13;
  v15[16] = 2;
  v10();
  return _NameMap.init(dictionaryLiteral:)();
}

void sub_237F29D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;

  sub_237F1B9D4();
  sub_237F2D470();
  if (!v12)
  {
    while ((v13 & 1) == 0)
    {
      sub_237F2D968();
      if (!(!v24 & v23))
      {
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_237F29DC0 + 4 * byte_237F5DDB8[v22]))(v14, v15, v16, v17, v18, v19, v20, v21, a9, a10, a11, a12);
        return;
      }
      sub_237F2D4C0();
    }
  }
  sub_237F1B978();
}

void sub_237F29E28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);

  sub_237F1B9D4();
  sub_237F2D540(v0, v1, v2, v3, v4);
  sub_237F2D918();
  sub_237F2D5E0();
  sub_237F2D658();
  sub_237F1B978();
}

void sub_237F29E64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);

  sub_237F1B9D4();
  sub_237F2D540(v0, v1, v2, v3, v4);
  sub_237F2D918();
  sub_237F2D5E0();
  sub_237F2D658();
  sub_237F1B978();
}

void sub_237F29EA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_237F2D698();
  sub_237F29F4C(v1);
  if (!v0)
  {
    sub_237F2D804();
    sub_237F2A0BC();
    sub_237F2D494();
    if (v2)
      sub_237F2D6CC();
    sub_237F2D494();
    if (v3)
      sub_237F2D6CC();
    type metadata accessor for CloudAssets_AssetStreamHandle(0);
    sub_237F2D770();
  }
  sub_237F2D6E0();
}

void sub_237F29F4C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v9[2];

  v2 = sub_237F171BC(&qword_2568A91A0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CloudAssets_Asset(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for CloudAssets_AssetStreamHandle(0);
  sub_237F2B0A4(a1 + *(int *)(v8 + 28), (uint64_t)v4, &qword_2568A91A0);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v4, 1, v5) == 1)
  {
    sub_237F1B910((uint64_t)v4, &qword_2568A91A0);
  }
  else
  {
    sub_237F2AFD8((uint64_t)v4, (uint64_t)v7, type metadata accessor for CloudAssets_Asset);
    sub_237F173F0(&qword_2568A9088, type metadata accessor for CloudAssets_Asset, (uint64_t)&unk_237F5E8B8);
    dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
    sub_237F1A3D8((uint64_t)v7, type metadata accessor for CloudAssets_Asset);
  }
}

void sub_237F2A0BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(_QWORD);
  uint64_t (*v3)(_QWORD);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_237F1B9D4();
  v3 = v2;
  v5 = v4;
  sub_237F171BC(&qword_2568A9198);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v6);
  sub_237F1BA28();
  v7 = type metadata accessor for CloudAssets_Credential(0);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v8);
  sub_237F1B99C();
  v9 = v3(0);
  sub_237F2B0A4(v5 + *(int *)(v9 + 32), v1, &qword_2568A9198);
  if (_s10CloudAsset21UploadResponseMessageOwet_0(v1, 1, v7) == 1)
  {
    sub_237F1B910(v1, &qword_2568A9198);
  }
  else
  {
    sub_237F2AFD8(v1, v0, type metadata accessor for CloudAssets_Credential);
    sub_237F173F0(&qword_2568A9400, type metadata accessor for CloudAssets_Credential, (uint64_t)&unk_237F5E750);
    dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
    sub_237F1A3D8(v0, type metadata accessor for CloudAssets_Credential);
  }
  sub_237F1B978();
}

void sub_237F2A1F0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  char v48;
  _QWORD *v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  char v59;
  char v60;
  BOOL v61;
  BOOL v62;
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
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  _QWORD *v76;

  sub_237F2D8B4();
  v3 = v2;
  v5 = v4;
  v6 = sub_237F2D48C();
  v66 = *(_QWORD *)(v6 - 8);
  v67 = v6;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v7);
  sub_237F1BD40();
  v65 = v8;
  sub_237F223E4();
  MEMORY[0x24BDAC7A8](v9);
  v64 = (uint64_t)&v63 - v10;
  v11 = sub_237F1BBB0();
  v73 = type metadata accessor for CloudAssets_Credential(v11);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v12);
  sub_237F180DC();
  v68 = v13;
  v70 = sub_237F171BC(&qword_2568A94F0);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v14);
  sub_237F180DC();
  v74 = v15;
  sub_237F171BC(&qword_2568A9198);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v16);
  sub_237F1BD40();
  v69 = v17;
  sub_237F223E4();
  MEMORY[0x24BDAC7A8](v18);
  v71 = (uint64_t)&v63 - v19;
  sub_237F223E4();
  MEMORY[0x24BDAC7A8](v20);
  v72 = (uint64_t)&v63 - v21;
  v22 = sub_237F1BBB0();
  v23 = type metadata accessor for CloudAssets_Asset(v22);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v24);
  sub_237F1BA28();
  v25 = sub_237F171BC(&qword_2568A9510);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v26);
  sub_237F18110();
  sub_237F171BC(&qword_2568A91A0);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v27);
  sub_237F2D760();
  v30 = v28 - v29;
  v32 = MEMORY[0x24BDAC7A8](v31);
  v34 = (char *)&v63 - v33;
  MEMORY[0x24BDAC7A8](v32);
  v36 = (char *)&v63 - v35;
  v37 = type metadata accessor for CloudAssets_AssetStreamHandle(0);
  v38 = *(int *)(v37 + 28);
  v75 = v5;
  v39 = (uint64_t)v5 + v38;
  v40 = (int *)v37;
  sub_237F2D690(v39, (uint64_t)v36);
  v41 = v40[7];
  v76 = v3;
  sub_237F2D690((uint64_t)v3 + v41, (uint64_t)v34);
  v42 = v0 + *(int *)(v25 + 48);
  sub_237F2D690((uint64_t)v36, v0);
  sub_237F2D690((uint64_t)v34, v42);
  sub_237F2D4CC(v0, 1, v23);
  if (v44)
  {
    sub_237F2D4FC((uint64_t)v34);
    sub_237F2D4FC((uint64_t)v36);
    v43 = sub_237F2D4CC(v42, 1, v23);
    if (v44)
    {
      sub_237F2D83C(v43, &qword_2568A91A0);
      goto LABEL_11;
    }
LABEL_9:
    v45 = &qword_2568A9510;
    v46 = v0;
LABEL_20:
    sub_237F1B910(v46, v45);
    goto LABEL_21;
  }
  sub_237F2B0A4(v0, v30, &qword_2568A91A0);
  sub_237F2D4CC(v42, 1, v23);
  if (v44)
  {
    sub_237F2D4FC((uint64_t)v34);
    sub_237F2D4FC((uint64_t)v36);
    sub_237F1A3D8(v30, type metadata accessor for CloudAssets_Asset);
    goto LABEL_9;
  }
  sub_237F2AFD8(v42, v1, type metadata accessor for CloudAssets_Asset);
  sub_237F26840();
  v48 = v47;
  sub_237F2D734(v1);
  sub_237F2D910((uint64_t)v34);
  sub_237F2D910((uint64_t)v36);
  sub_237F2D734(v30);
  sub_237F2D910(v0);
  if ((v48 & 1) == 0)
    goto LABEL_21;
LABEL_11:
  v49 = v75;
  v50 = v72;
  sub_237F2D638((uint64_t)v75 + v40[8], v72);
  v51 = v76;
  v52 = v71;
  sub_237F2D638((uint64_t)v76 + v40[8], v71);
  v53 = v74;
  v54 = v74 + *(int *)(v70 + 48);
  sub_237F2D638(v50, v74);
  sub_237F2D638(v52, v54);
  v55 = v73;
  sub_237F2D4CC(v53, 1, v73);
  if (!v44)
  {
    v56 = v69;
    sub_237F2B0A4(v53, v69, &qword_2568A9198);
    sub_237F2D4CC(v54, 1, v55);
    if (!v57)
    {
      v58 = v68;
      sub_237F2AFD8(v54, v68, type metadata accessor for CloudAssets_Credential);
      sub_237F28170();
      v60 = v59;
      sub_237F1BC88(v58);
      sub_237F2D598(v52);
      sub_237F2D598(v50);
      sub_237F1BC88(v56);
      sub_237F2D598(v53);
      if ((v60 & 1) == 0)
        goto LABEL_21;
      goto LABEL_23;
    }
    sub_237F2D4FC(v52);
    sub_237F2D4FC(v50);
    sub_237F1A3D8(v56, type metadata accessor for CloudAssets_Credential);
    goto LABEL_19;
  }
  sub_237F2D5A0(v52);
  sub_237F2D5A0(v50);
  sub_237F2D4CC(v54, 1, v55);
  if (!v44)
  {
LABEL_19:
    v45 = &qword_2568A94F0;
    v46 = v53;
    goto LABEL_20;
  }
  sub_237F1B910(v53, &qword_2568A9198);
LABEL_23:
  v61 = *v49 == *v51 && v49[1] == v51[1];
  if (v61 || (sub_237F1BD24() & 1) != 0)
  {
    v62 = v49[2] == v51[2] && v49[3] == v51[3];
    if (v62 || (sub_237F1BD24() & 1) != 0)
    {
      sub_237F2D8CC(v64, (uint64_t)v49 + v40[6]);
      sub_237F2D8CC(v65, (uint64_t)v51 + v40[6]);
      sub_237F173F0(&qword_2568A94D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      sub_237F2D73C();
      sub_237F2D79C();
      sub_237F2D904();
    }
  }
LABEL_21:
  sub_237F2D4A8();
}

Swift::Int sub_237F2A720(uint64_t (*a1)(uint64_t), unint64_t *a2, uint64_t a3)
{
  Hasher.init(_seed:)();
  a1(0);
  sub_237F173F0(a2, a1, a3);
  dispatch thunk of Hashable.hash(into:)();
  return Hasher._finalize()();
}

unint64_t sub_237F2A7A0()
{
  return 0xD00000000000001DLL;
}

uint64_t sub_237F2A7BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_237F2D48C();
  v0 = sub_237F18128();
  return sub_237F180F8(v0, v1, v2, v3);
}

uint64_t sub_237F2A7E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_237F2D48C();
  v0 = sub_237F2D640();
  return sub_237F180F8(v0, v1, v2, v3);
}

#error "237F2A814: call analysis failed (funcsize=5)"

void sub_237F2A820()
{
  sub_237F29EA0();
}

uint64_t sub_237F2A834()
{
  sub_237F173F0(&qword_2568A9508, type metadata accessor for CloudAssets_AssetStreamHandle, (uint64_t)&unk_237F5DF38);
  return _MessageImplementationBase.isEqualTo(message:)();
}

uint64_t sub_237F2A884(uint64_t a1, uint64_t a2)
{
  return sub_237F2A8A0(a1, a2, &qword_2568A8F40, (uint64_t)qword_2568B5C58);
}

uint64_t sub_237F2A8A0(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  sub_237F271DC(a3, a4);
  type metadata accessor for _NameMap();
  v4 = sub_237F18128();
  return sub_237F180F8(v4, v5, v6, v7);
}

uint64_t sub_237F2A8D8()
{
  sub_237F173F0(&qword_2568A9398, type metadata accessor for CloudAssets_AssetStreamHandle, (uint64_t)&unk_237F5DF70);
  return Message.debugDescription.getter();
}

Swift::Int sub_237F2A918()
{
  return sub_237F2A720(type metadata accessor for CloudAssets_AssetStreamHandle, &qword_2568A93A0, (uint64_t)&unk_237F5DEA8);
}

uint64_t sub_237F2A944()
{
  sub_237F173F0(&qword_2568A9398, type metadata accessor for CloudAssets_AssetStreamHandle, (uint64_t)&unk_237F5DF70);
  return Message.hash(into:)();
}

Swift::Int sub_237F2A994()
{
  Hasher.init(_seed:)();
  dispatch thunk of Hashable.hash(into:)();
  return Hasher._finalize()();
}

void sub_237F2A9E8()
{
  sub_237F173F0(&qword_2568A9390, type metadata accessor for CloudAssets_AssetStreamHandle, (uint64_t)&unk_237F5DE80);
}

uint64_t type metadata accessor for CloudAssets_AssetStreamHandle(uint64_t a1)
{
  return sub_237F1B2B4(a1, (uint64_t *)&unk_2568A9518);
}

void sub_237F2AA28()
{
  sub_237F173F0(&qword_2568A9398, type metadata accessor for CloudAssets_AssetStreamHandle, (uint64_t)&unk_237F5DF70);
}

void sub_237F2AA54()
{
  sub_237F173F0(&qword_2568A93A0, type metadata accessor for CloudAssets_AssetStreamHandle, (uint64_t)&unk_237F5DEA8);
}

void sub_237F2AA80()
{
  sub_237F173F0(&qword_2568A93A8, type metadata accessor for CloudAssets_AssetStreamHandle, (uint64_t)&unk_237F5DEE8);
}

void sub_237F2AAAC()
{
  sub_237F173F0(&qword_2568A93B0, type metadata accessor for CloudAssets_Signal.Event, (uint64_t)&unk_237F5DFE8);
}

uint64_t type metadata accessor for CloudAssets_Signal.Event(uint64_t a1)
{
  return sub_237F1B2B4(a1, (uint64_t *)&unk_2568A9530);
}

void sub_237F2AAEC()
{
  sub_237F173F0(&qword_2568A93B8, type metadata accessor for CloudAssets_Signal.Event, (uint64_t)&unk_237F5E0D8);
}

void sub_237F2AB18()
{
  sub_237F173F0(&qword_2568A93C0, type metadata accessor for CloudAssets_Signal.Event, (uint64_t)&unk_237F5E010);
}

void sub_237F2AB44()
{
  sub_237F173F0(&qword_2568A93C8, type metadata accessor for CloudAssets_Signal.Event, (uint64_t)&unk_237F5E050);
}

void sub_237F2AB70()
{
  sub_237F173F0(&qword_2568A93D0, type metadata accessor for CloudAssets_Signal, (uint64_t)&unk_237F5E178);
}

void sub_237F2AB9C()
{
  sub_237F173F0((unint64_t *)&qword_2568A93D8, type metadata accessor for CloudAssets_Signal, (uint64_t)&unk_237F5E7C8);
}

void sub_237F2ABC8()
{
  sub_237F173F0(&qword_2568A93E0, type metadata accessor for CloudAssets_Signal, (uint64_t)&unk_237F5E1A0);
}

void sub_237F2ABF4()
{
  sub_237F173F0(&qword_2568A93E8, type metadata accessor for CloudAssets_SimultaneousDownloadableAssets, (uint64_t)&unk_237F5E268);
}

void sub_237F2AC20()
{
  sub_237F173F0(&qword_2568A9148, type metadata accessor for CloudAssets_SimultaneousDownloadableAssets, (uint64_t)&unk_237F5E840);
}

void sub_237F2AC4C()
{
  sub_237F173F0(&qword_2568A93F0, type metadata accessor for CloudAssets_SimultaneousDownloadableAssets, (uint64_t)&unk_237F5E290);
}

void sub_237F2AC78()
{
  sub_237F173F0(&qword_2568A93F8, type metadata accessor for CloudAssets_Credential, (uint64_t)&unk_237F5E358);
}

void sub_237F2ACA4()
{
  sub_237F173F0(&qword_2568A9400, type metadata accessor for CloudAssets_Credential, (uint64_t)&unk_237F5E750);
}

void sub_237F2ACD0()
{
  sub_237F173F0(&qword_2568A9408, type metadata accessor for CloudAssets_Credential, (uint64_t)&unk_237F5E380);
}

void sub_237F2ACFC()
{
  sub_237F173F0(&qword_2568A9410, type metadata accessor for CloudAssets_Asset.Protector, (uint64_t)&unk_237F5E448);
}

void sub_237F2AD28()
{
  sub_237F173F0(&qword_2568A9068, type metadata accessor for CloudAssets_Asset.Protector, (uint64_t)&unk_237F5E930);
}

void sub_237F2AD54()
{
  sub_237F173F0(&qword_2568A9418, type metadata accessor for CloudAssets_Asset.Protector, (uint64_t)&unk_237F5E470);
}

void sub_237F2AD80()
{
  sub_237F173F0(&qword_2568A9420, type metadata accessor for CloudAssets_Asset.ID, (uint64_t)&unk_237F5E538);
}

void sub_237F2ADAC()
{
  sub_237F173F0(&qword_2568A9038, type metadata accessor for CloudAssets_Asset.ID, (uint64_t)&unk_237F5E9A8);
}

void sub_237F2ADD8()
{
  sub_237F173F0(&qword_2568A9428, type metadata accessor for CloudAssets_Asset.ID, (uint64_t)&unk_237F5E560);
}

void sub_237F2AE04()
{
  sub_237F173F0(&qword_2568A9430, type metadata accessor for CloudAssets_Asset, (uint64_t)&unk_237F5E628);
}

void sub_237F2AE30()
{
  sub_237F173F0(&qword_2568A9088, type metadata accessor for CloudAssets_Asset, (uint64_t)&unk_237F5E8B8);
}

void sub_237F2AE5C()
{
  sub_237F173F0(&qword_2568A9438, type metadata accessor for CloudAssets_Asset, (uint64_t)&unk_237F5E650);
}

unint64_t sub_237F2AE8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568A9440;
  if (!qword_2568A9440)
  {
    v1 = sub_237F1725C(&qword_2568A9448);
    result = MEMORY[0x23B82832C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2568A9440);
  }
  return result;
}

void sub_237F2AED0()
{
  sub_237F173F0(&qword_2568A9450, type metadata accessor for CloudAssets_Credential, (uint64_t)&unk_237F5E3C0);
}

void sub_237F2AEFC()
{
  sub_237F173F0(&qword_2568A9458, type metadata accessor for CloudAssets_Signal, (uint64_t)&unk_237F5E1E0);
}

void sub_237F2AF28()
{
  sub_237F173F0(&qword_2568A9460, type metadata accessor for CloudAssets_SimultaneousDownloadableAssets, (uint64_t)&unk_237F5E2D0);
}

void sub_237F2AF54()
{
  sub_237F173F0(&qword_2568A9468, type metadata accessor for CloudAssets_Asset, (uint64_t)&unk_237F5E690);
}

void sub_237F2AF80()
{
  sub_237F173F0(&qword_2568A9470, type metadata accessor for CloudAssets_Asset.Protector, (uint64_t)&unk_237F5E4B0);
}

void sub_237F2AFAC()
{
  sub_237F173F0(&qword_2568A9478, type metadata accessor for CloudAssets_Asset.ID, (uint64_t)&unk_237F5E5A0);
}

void sub_237F2AFD8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  sub_237F22430(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  sub_237F18140();
}

uint64_t sub_237F2B010(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_237F2B028(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_237F2B068()
{
  unint64_t result;

  result = qword_2568A9500;
  if (!qword_2568A9500)
  {
    result = MEMORY[0x23B82832C](&unk_237F5EB10, &type metadata for CloudAssets_Signal.EventType);
    atomic_store(result, (unint64_t *)&qword_2568A9500);
  }
  return result;
}

void sub_237F2B0A4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_237F171BC(a3);
  sub_237F22430(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  sub_237F18140();
}

uint64_t initializeBufferWithCopyOfBuffer for Signal.Event(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for Signal.Event(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Signal.Event(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_237F2B140(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_237F2B15C(uint64_t result, int a2)
{
  char v2;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    v2 = 1;
  }
  else
  {
    v2 = 0;
  }
  *(_BYTE *)(result + 8) = v2;
  return result;
}

ValueMetadata *type metadata accessor for CloudAssets_Signal.EventType()
{
  return &type metadata for CloudAssets_Signal.EventType;
}

uint64_t *sub_237F2B18C(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, char *, uint64_t);

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a3[6];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = type metadata accessor for UnknownStorage();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v59 = v13;
    v13(v10, v11, v12);
    v14 = a3[7];
    v15 = (uint64_t *)((char *)v4 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    v17 = (int *)type metadata accessor for CloudAssets_Asset(0);
    if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v16, 1, (uint64_t)v17))
    {
      v18 = sub_237F171BC(&qword_2568A91A0);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      *v15 = *v16;
      v13((char *)v15 + v17[5], (char *)v16 + v17[5], v12);
      v20 = v17[6];
      v21 = (_QWORD *)((char *)v15 + v20);
      v22 = (_QWORD *)((char *)v16 + v20);
      v56 = type metadata accessor for CloudAssets_Asset.ID(0);
      if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v22, 1, v56))
      {
        v23 = sub_237F171BC(&qword_2568A9128);
        memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
      }
      else
      {
        v24 = v22[1];
        *v21 = *v22;
        v21[1] = v24;
        v57 = v12;
        v25 = v22[3];
        v21[2] = v22[2];
        v21[3] = v25;
        v26 = v22[5];
        v55 = v22[4];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_237F17134(v55, v26);
        v21[4] = v55;
        v21[5] = v26;
        v28 = v22[6];
        v27 = v22[7];
        sub_237F17134(v28, v27);
        v21[6] = v28;
        v21[7] = v27;
        v12 = v57;
        v59((char *)v21 + *(int *)(v56 + 32), (char *)v22 + *(int *)(v56 + 32), v57);
        _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v21, 0, 1, v56);
      }
      v29 = v17[7];
      v30 = (_QWORD *)((char *)v15 + v29);
      v31 = (_QWORD *)((char *)v16 + v29);
      v32 = type metadata accessor for CloudAssets_Asset.Protector(0);
      if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v31, 1, v32))
      {
        v33 = sub_237F171BC(&qword_2568A9130);
        memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
      }
      else
      {
        v58 = v12;
        v34 = *v31;
        v35 = v31[1];
        sub_237F17134(*v31, v35);
        *v30 = v34;
        v30[1] = v35;
        v36 = v31[2];
        v37 = v31[3];
        sub_237F17134(v36, v37);
        v30[2] = v36;
        v30[3] = v37;
        v12 = v58;
        v59((char *)v30 + *(int *)(v32 + 24), (char *)v31 + *(int *)(v32 + 24), v58);
        _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v30, 0, 1, v32);
      }
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v15, 0, 1, (uint64_t)v17);
    }
    v38 = a3[8];
    v39 = (uint64_t *)((char *)v4 + v38);
    v40 = (uint64_t *)((char *)a2 + v38);
    v41 = type metadata accessor for CloudAssets_Credential(0);
    if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v40, 1, v41))
    {
      v42 = sub_237F171BC(&qword_2568A9198);
      memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    }
    else
    {
      v43 = v40[1];
      *v39 = *v40;
      v39[1] = v43;
      v44 = v40[3];
      v39[2] = v40[2];
      v39[3] = v44;
      v45 = v40[5];
      v39[4] = v40[4];
      v39[5] = v45;
      v46 = *(int *)(v41 + 28);
      v47 = (char *)v39 + v46;
      v48 = (char *)v40 + v46;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v59(v47, v48, v12);
      v49 = *(int *)(v41 + 32);
      v50 = (char *)v39 + v49;
      v51 = (char *)v40 + v49;
      v52 = type metadata accessor for Google_Protobuf_Timestamp();
      if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v51, 1, v52))
      {
        v53 = sub_237F171BC(&qword_2568A9190);
        memcpy(v50, v51, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v52 - 8) + 16))(v50, v51, v52);
        _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v50, 0, 1, v52);
      }
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v39, 0, 1, v41);
    }
  }
  return v4;
}

uint64_t sub_237F2B588(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + a2[6];
  v5 = type metadata accessor for UnknownStorage();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v7 = a1 + a2[7];
  v8 = (int *)type metadata accessor for CloudAssets_Asset(0);
  if (!_s10CloudAsset21UploadResponseMessageOwet_0(v7, 1, (uint64_t)v8))
  {
    v6(v7 + v8[5], v5);
    v9 = v7 + v8[6];
    v10 = type metadata accessor for CloudAssets_Asset.ID(0);
    if (!_s10CloudAsset21UploadResponseMessageOwet_0(v9, 1, v10))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_237F17178(*(_QWORD *)(v9 + 32), *(_QWORD *)(v9 + 40));
      sub_237F17178(*(_QWORD *)(v9 + 48), *(_QWORD *)(v9 + 56));
      v6(v9 + *(int *)(v10 + 32), v5);
    }
    v11 = v7 + v8[7];
    v12 = type metadata accessor for CloudAssets_Asset.Protector(0);
    if (!_s10CloudAsset21UploadResponseMessageOwet_0(v11, 1, v12))
    {
      sub_237F17178(*(_QWORD *)v11, *(_QWORD *)(v11 + 8));
      sub_237F17178(*(_QWORD *)(v11 + 16), *(_QWORD *)(v11 + 24));
      v6(v11 + *(int *)(v12 + 24), v5);
    }
  }
  v13 = a1 + a2[8];
  v14 = type metadata accessor for CloudAssets_Credential(0);
  result = _s10CloudAsset21UploadResponseMessageOwet_0(v13, 1, v14);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6(v13 + *(int *)(v14 + 28), v5);
    v16 = v13 + *(int *)(v14 + 32);
    v17 = type metadata accessor for Google_Protobuf_Timestamp();
    result = _s10CloudAsset21UploadResponseMessageOwet_0(v16, 1, v17);
    if (!(_DWORD)result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
  }
  return result;
}

_QWORD *sub_237F2B770(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a3[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for UnknownStorage();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v57 = v12;
  v12(v9, v10, v11);
  v13 = a3[7];
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (_QWORD *)((char *)a2 + v13);
  v16 = (int *)type metadata accessor for CloudAssets_Asset(0);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v15, 1, (uint64_t)v16))
  {
    v17 = sub_237F171BC(&qword_2568A91A0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    *v14 = *v15;
    v12((char *)v14 + v16[5], (char *)v15 + v16[5], v11);
    v18 = v16[6];
    v19 = (_QWORD *)((char *)v14 + v18);
    v20 = (_QWORD *)((char *)v15 + v18);
    v54 = type metadata accessor for CloudAssets_Asset.ID(0);
    if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v20, 1, v54))
    {
      v21 = sub_237F171BC(&qword_2568A9128);
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      v22 = v20[1];
      *v19 = *v20;
      v19[1] = v22;
      v55 = v11;
      v23 = v20[3];
      v19[2] = v20[2];
      v19[3] = v23;
      v24 = v20[5];
      v53 = v20[4];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_237F17134(v53, v24);
      v19[4] = v53;
      v19[5] = v24;
      v26 = v20[6];
      v25 = v20[7];
      sub_237F17134(v26, v25);
      v19[6] = v26;
      v19[7] = v25;
      v11 = v55;
      v57((char *)v19 + *(int *)(v54 + 32), (char *)v20 + *(int *)(v54 + 32), v55);
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v19, 0, 1, v54);
    }
    v27 = v16[7];
    v28 = (_QWORD *)((char *)v14 + v27);
    v29 = (_QWORD *)((char *)v15 + v27);
    v30 = type metadata accessor for CloudAssets_Asset.Protector(0);
    if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v29, 1, v30))
    {
      v31 = sub_237F171BC(&qword_2568A9130);
      memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    }
    else
    {
      v56 = v11;
      v32 = *v29;
      v33 = v29[1];
      sub_237F17134(*v29, v33);
      *v28 = v32;
      v28[1] = v33;
      v34 = v29[2];
      v35 = v29[3];
      sub_237F17134(v34, v35);
      v28[2] = v34;
      v28[3] = v35;
      v11 = v56;
      v57((char *)v28 + *(int *)(v30 + 24), (char *)v29 + *(int *)(v30 + 24), v56);
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v28, 0, 1, v30);
    }
    _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v14, 0, 1, (uint64_t)v16);
  }
  v36 = a3[8];
  v37 = (_QWORD *)((char *)a1 + v36);
  v38 = (_QWORD *)((char *)a2 + v36);
  v39 = type metadata accessor for CloudAssets_Credential(0);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v38, 1, v39))
  {
    v40 = sub_237F171BC(&qword_2568A9198);
    memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
  }
  else
  {
    v41 = v38[1];
    *v37 = *v38;
    v37[1] = v41;
    v42 = v38[3];
    v37[2] = v38[2];
    v37[3] = v42;
    v43 = v38[5];
    v37[4] = v38[4];
    v37[5] = v43;
    v44 = *(int *)(v39 + 28);
    v45 = (char *)v37 + v44;
    v46 = (char *)v38 + v44;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v57(v45, v46, v11);
    v47 = *(int *)(v39 + 32);
    v48 = (char *)v37 + v47;
    v49 = (char *)v38 + v47;
    v50 = type metadata accessor for Google_Protobuf_Timestamp();
    if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v49, 1, v50))
    {
      v51 = sub_237F171BC(&qword_2568A9190);
      memcpy(v48, v49, *(_QWORD *)(*(_QWORD *)(v51 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v50 - 8) + 16))(v48, v49, v50);
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v48, 0, 1, v50);
    }
    _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v37, 0, 1, v39);
  }
  return a1;
}

_QWORD *sub_237F2BB40(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  int *v14;
  int v15;
  int v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  int v28;
  int v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  int *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  uint64_t v62;
  int v63;
  int v64;
  uint64_t v65;
  char *v66;
  char *v67;
  void (*v68)(char *, char *, uint64_t);
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  size_t v74;
  void *v75;
  const void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  uint64_t v106;
  void (*v107)(char *, char *, uint64_t);
  void (*v108)(char *, char *, uint64_t);
  int *v109;
  int *v110;
  void (*v111)(char *, char *, uint64_t);
  void (*v112)(char *, char *, uint64_t);
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for UnknownStorage();
  v115 = *(_QWORD *)(v9 - 8);
  v10 = *(void (**)(char *, char *, uint64_t))(v115 + 24);
  v10(v7, v8, v9);
  v11 = a3[7];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = (int *)type metadata accessor for CloudAssets_Asset(0);
  v15 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v12, 1, (uint64_t)v14);
  v16 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v13, 1, (uint64_t)v14);
  if (!v15)
  {
    if (v16)
    {
      sub_237F1A3D8((uint64_t)v12, type metadata accessor for CloudAssets_Asset);
      goto LABEL_7;
    }
    v109 = a3;
    v112 = v10;
    *(_QWORD *)v12 = *(_QWORD *)v13;
    v114 = v9;
    v10(&v12[v14[5]], &v13[v14[5]], v9);
    v24 = v14[6];
    v25 = &v12[v24];
    v26 = &v13[v24];
    v27 = type metadata accessor for CloudAssets_Asset.ID(0);
    v28 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v25, 1, v27);
    v106 = v27;
    v29 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v26, 1, v27);
    if (v28)
    {
      if (!v29)
      {
        *(_QWORD *)v25 = *(_QWORD *)v26;
        *((_QWORD *)v25 + 1) = *((_QWORD *)v26 + 1);
        *((_QWORD *)v25 + 2) = *((_QWORD *)v26 + 2);
        *((_QWORD *)v25 + 3) = *((_QWORD *)v26 + 3);
        v31 = *((_QWORD *)v26 + 4);
        v30 = *((_QWORD *)v26 + 5);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_237F17134(v31, v30);
        *((_QWORD *)v25 + 4) = v31;
        *((_QWORD *)v25 + 5) = v30;
        v33 = *((_QWORD *)v26 + 6);
        v32 = *((_QWORD *)v26 + 7);
        sub_237F17134(v33, v32);
        *((_QWORD *)v25 + 6) = v33;
        *((_QWORD *)v25 + 7) = v32;
        v9 = v114;
        (*(void (**)(char *, char *, uint64_t))(v115 + 16))(&v25[*(int *)(v106 + 32)], &v26[*(int *)(v106 + 32)], v114);
        _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v25, 0, 1, v106);
LABEL_19:
        v10 = v112;
        goto LABEL_20;
      }
    }
    else
    {
      if (!v29)
      {
        *(_QWORD *)v25 = *(_QWORD *)v26;
        *((_QWORD *)v25 + 1) = *((_QWORD *)v26 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((_QWORD *)v25 + 2) = *((_QWORD *)v26 + 2);
        *((_QWORD *)v25 + 3) = *((_QWORD *)v26 + 3);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v88 = *((_QWORD *)v26 + 4);
        v87 = *((_QWORD *)v26 + 5);
        sub_237F17134(v88, v87);
        v89 = *((_QWORD *)v25 + 4);
        v90 = *((_QWORD *)v25 + 5);
        *((_QWORD *)v25 + 4) = v88;
        *((_QWORD *)v25 + 5) = v87;
        sub_237F17178(v89, v90);
        v92 = *((_QWORD *)v26 + 6);
        v91 = *((_QWORD *)v26 + 7);
        sub_237F17134(v92, v91);
        v93 = *((_QWORD *)v25 + 6);
        v94 = *((_QWORD *)v25 + 7);
        *((_QWORD *)v25 + 6) = v92;
        *((_QWORD *)v25 + 7) = v91;
        sub_237F17178(v93, v94);
        v95 = *(int *)(v27 + 32);
        v96 = &v26[v95];
        v10 = v112;
        v9 = v114;
        v112(&v25[v95], v96, v114);
LABEL_20:
        v48 = v14[7];
        v49 = (uint64_t *)&v12[v48];
        v50 = (uint64_t *)&v13[v48];
        v51 = type metadata accessor for CloudAssets_Asset.Protector(0);
        v52 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v49, 1, v51);
        v53 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v50, 1, v51);
        if (v52)
        {
          if (!v53)
          {
            v54 = *v50;
            v55 = v50[1];
            sub_237F17134(*v50, v55);
            *v49 = v54;
            v49[1] = v55;
            v56 = v50[2];
            v57 = v50[3];
            sub_237F17134(v56, v57);
            v49[2] = v56;
            v49[3] = v57;
            v10 = v112;
            (*(void (**)(char *, char *, uint64_t))(v115 + 16))((char *)v49 + *(int *)(v51 + 24), (char *)v50 + *(int *)(v51 + 24), v9);
            _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v49, 0, 1, v51);
LABEL_26:
            a3 = v109;
            goto LABEL_27;
          }
        }
        else
        {
          if (!v53)
          {
            v97 = *v50;
            v98 = v50[1];
            sub_237F17134(*v50, v98);
            v99 = *v49;
            v100 = v49[1];
            *v49 = v97;
            v49[1] = v98;
            sub_237F17178(v99, v100);
            v101 = v50[2];
            v102 = v50[3];
            sub_237F17134(v101, v102);
            v103 = v49[2];
            v104 = v49[3];
            v49[2] = v101;
            v49[3] = v102;
            v10 = v112;
            sub_237F17178(v103, v104);
            v112((char *)v49 + *(int *)(v51 + 24), (char *)v50 + *(int *)(v51 + 24), v9);
            goto LABEL_26;
          }
          sub_237F1A3D8((uint64_t)v49, type metadata accessor for CloudAssets_Asset.Protector);
        }
        v58 = sub_237F171BC(&qword_2568A9130);
        memcpy(v49, v50, *(_QWORD *)(*(_QWORD *)(v58 - 8) + 64));
        goto LABEL_26;
      }
      sub_237F1A3D8((uint64_t)v25, type metadata accessor for CloudAssets_Asset.ID);
    }
    v47 = sub_237F171BC(&qword_2568A9128);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
    v9 = v114;
    goto LABEL_19;
  }
  if (v16)
  {
LABEL_7:
    v23 = sub_237F171BC(&qword_2568A91A0);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_27;
  }
  v111 = v10;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  v17 = *(void (**)(char *, char *, uint64_t))(v115 + 16);
  v17(&v12[v14[5]], &v13[v14[5]], v9);
  v18 = v14[6];
  v19 = &v12[v18];
  v20 = &v13[v18];
  v113 = v9;
  v21 = type metadata accessor for CloudAssets_Asset.ID(0);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v20, 1, v21))
  {
    v22 = sub_237F171BC(&qword_2568A9128);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    *(_QWORD *)v19 = *(_QWORD *)v20;
    *((_QWORD *)v19 + 1) = *((_QWORD *)v20 + 1);
    *((_QWORD *)v19 + 2) = *((_QWORD *)v20 + 2);
    v107 = v17;
    v110 = a3;
    *((_QWORD *)v19 + 3) = *((_QWORD *)v20 + 3);
    v34 = *((_QWORD *)v20 + 4);
    v105 = *((_QWORD *)v20 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_237F17134(v34, v105);
    *((_QWORD *)v19 + 4) = v34;
    *((_QWORD *)v19 + 5) = v105;
    v35 = *((_QWORD *)v20 + 6);
    v36 = *((_QWORD *)v20 + 7);
    sub_237F17134(v35, v36);
    *((_QWORD *)v19 + 6) = v35;
    *((_QWORD *)v19 + 7) = v36;
    v17 = v107;
    a3 = v110;
    v107(&v19[*(int *)(v21 + 32)], &v20[*(int *)(v21 + 32)], v113);
    _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v19, 0, 1, v21);
  }
  v37 = v14[7];
  v38 = &v12[v37];
  v39 = (uint64_t *)&v13[v37];
  v40 = type metadata accessor for CloudAssets_Asset.Protector(0);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v39, 1, v40))
  {
    v41 = sub_237F171BC(&qword_2568A9130);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
    v9 = v113;
  }
  else
  {
    v108 = v17;
    v42 = a3;
    v43 = *v39;
    v44 = v39[1];
    sub_237F17134(*v39, v44);
    *(_QWORD *)v38 = v43;
    *((_QWORD *)v38 + 1) = v44;
    v45 = v39[2];
    v46 = v39[3];
    sub_237F17134(v45, v46);
    *((_QWORD *)v38 + 2) = v45;
    *((_QWORD *)v38 + 3) = v46;
    a3 = v42;
    v9 = v113;
    v108(&v38[*(int *)(v40 + 24)], (char *)v39 + *(int *)(v40 + 24), v113);
    _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v38, 0, 1, v40);
  }
  v10 = v111;
  _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v12, 0, 1, (uint64_t)v14);
LABEL_27:
  v59 = a3[8];
  v60 = (_QWORD *)((char *)a1 + v59);
  v61 = (_QWORD *)((char *)a2 + v59);
  v62 = type metadata accessor for CloudAssets_Credential(0);
  v63 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v60, 1, v62);
  v64 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v61, 1, v62);
  if (v63)
  {
    if (!v64)
    {
      *v60 = *v61;
      v60[1] = v61[1];
      v60[2] = v61[2];
      v60[3] = v61[3];
      v60[4] = v61[4];
      v60[5] = v61[5];
      v65 = *(int *)(v62 + 28);
      v66 = (char *)v60 + v65;
      v67 = (char *)v61 + v65;
      v68 = *(void (**)(char *, char *, uint64_t))(v115 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v68(v66, v67, v9);
      v69 = *(int *)(v62 + 32);
      v70 = (char *)v60 + v69;
      v71 = (char *)v61 + v69;
      v72 = type metadata accessor for Google_Protobuf_Timestamp();
      if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v71, 1, v72))
      {
        v73 = sub_237F171BC(&qword_2568A9190);
        memcpy(v70, v71, *(_QWORD *)(*(_QWORD *)(v73 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v72 - 8) + 16))(v70, v71, v72);
        _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v70, 0, 1, v72);
      }
      v83 = (uint64_t)v60;
      v84 = v62;
      goto LABEL_40;
    }
    goto LABEL_33;
  }
  if (v64)
  {
    sub_237F1A3D8((uint64_t)v60, type metadata accessor for CloudAssets_Credential);
LABEL_33:
    v74 = *(_QWORD *)(*(_QWORD *)(sub_237F171BC(&qword_2568A9198) - 8) + 64);
    v75 = v60;
    v76 = v61;
    goto LABEL_34;
  }
  *v60 = *v61;
  v60[1] = v61[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v60[2] = v61[2];
  v60[3] = v61[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v60[4] = v61[4];
  v60[5] = v61[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10((char *)v60 + *(int *)(v62 + 28), (char *)v61 + *(int *)(v62 + 28), v9);
  v77 = *(int *)(v62 + 32);
  v78 = (uint64_t)v60 + v77;
  v79 = (uint64_t)v61 + v77;
  v80 = type metadata accessor for Google_Protobuf_Timestamp();
  v81 = _s10CloudAsset21UploadResponseMessageOwet_0(v78, 1, v80);
  v82 = _s10CloudAsset21UploadResponseMessageOwet_0(v79, 1, v80);
  if (v81)
  {
    if (!v82)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v80 - 8) + 16))(v78, v79, v80);
      v83 = v78;
      v84 = v80;
LABEL_40:
      _s10CloudAsset21UploadResponseMessageOwst_0(v83, 0, 1, v84);
      return a1;
    }
  }
  else
  {
    v86 = *(_QWORD *)(v80 - 8);
    if (!v82)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v86 + 24))(v78, v79, v80);
      return a1;
    }
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v78, v80);
  }
  v74 = *(_QWORD *)(*(_QWORD *)(sub_237F171BC(&qword_2568A9190) - 8) + 64);
  v75 = (void *)v78;
  v76 = (const void *)v79;
LABEL_34:
  memcpy(v75, v76, v74);
  return a1;
}

_OWORD *sub_237F2C400(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  _OWORD *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _OWORD *v25;
  _OWORD *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  _OWORD *v31;
  _OWORD *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v42)(char *, char *, uint64_t);

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for UnknownStorage();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v12 = a3[7];
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = (int *)type metadata accessor for CloudAssets_Asset(0);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v14, 1, (uint64_t)v15))
  {
    v16 = sub_237F171BC(&qword_2568A91A0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    *v13 = *v14;
    v11((char *)v13 + v15[5], (char *)v14 + v15[5], v10);
    v17 = v15[6];
    v18 = (_OWORD *)((char *)v13 + v17);
    v19 = (_OWORD *)((char *)v14 + v17);
    v42 = v11;
    v20 = type metadata accessor for CloudAssets_Asset.ID(0);
    if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v19, 1, v20))
    {
      v21 = sub_237F171BC(&qword_2568A9128);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      v22 = v19[1];
      *v18 = *v19;
      v18[1] = v22;
      v23 = v19[3];
      v18[2] = v19[2];
      v18[3] = v23;
      v42((char *)v18 + *(int *)(v20 + 32), (char *)v19 + *(int *)(v20 + 32), v10);
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v18, 0, 1, v20);
    }
    v24 = v15[7];
    v25 = (_OWORD *)((char *)v13 + v24);
    v26 = (_OWORD *)((char *)v14 + v24);
    v27 = type metadata accessor for CloudAssets_Asset.Protector(0);
    if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v26, 1, v27))
    {
      v28 = sub_237F171BC(&qword_2568A9130);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
      v11 = v42;
    }
    else
    {
      v29 = v26[1];
      *v25 = *v26;
      v25[1] = v29;
      v11 = v42;
      v42((char *)v25 + *(int *)(v27 + 24), (char *)v26 + *(int *)(v27 + 24), v10);
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v25, 0, 1, v27);
    }
    _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v13, 0, 1, (uint64_t)v15);
  }
  v30 = a3[8];
  v31 = (_OWORD *)((char *)a1 + v30);
  v32 = (_OWORD *)((char *)a2 + v30);
  v33 = type metadata accessor for CloudAssets_Credential(0);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v32, 1, v33))
  {
    v34 = sub_237F171BC(&qword_2568A9198);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
  }
  else
  {
    v35 = v32[1];
    *v31 = *v32;
    v31[1] = v35;
    v31[2] = v32[2];
    v11((char *)v31 + *(int *)(v33 + 28), (char *)v32 + *(int *)(v33 + 28), v10);
    v36 = *(int *)(v33 + 32);
    v37 = (char *)v31 + v36;
    v38 = (char *)v32 + v36;
    v39 = type metadata accessor for Google_Protobuf_Timestamp();
    if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v38, 1, v39))
    {
      v40 = sub_237F171BC(&qword_2568A9190);
      memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 32))(v37, v38, v39);
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v37, 0, 1, v39);
    }
    _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v31, 0, 1, v33);
  }
  return a1;
}

_QWORD *sub_237F2C728(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  int *v17;
  int v18;
  int v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  size_t v26;
  void *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  int v33;
  size_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  int v51;
  __int128 v52;
  uint64_t v53;
  void *v54;
  const void *v55;
  uint64_t v56;
  uint64_t v57;
  size_t v58;
  void *v59;
  const void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  int v80;
  int v81;
  __int128 v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  void (*v94)(char *, char *, uint64_t);
  _QWORD *v95;
  int *__src;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(char *, char *, uint64_t);
  void (*v100)(char *, char *, uint64_t);

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a3[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for UnknownStorage();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(void (**)(char *, char *, uint64_t))(v12 + 40);
  v13(v9, v10, v11);
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = (int *)type metadata accessor for CloudAssets_Asset(0);
  v18 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v15, 1, (uint64_t)v17);
  v19 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v16, 1, (uint64_t)v17);
  if (v18)
  {
    if (!v19)
    {
      __src = a3;
      v97 = v12;
      v99 = v13;
      *(_QWORD *)v15 = *(_QWORD *)v16;
      v20 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
      v20(&v15[v17[5]], &v16[v17[5]], v11);
      v21 = v17[6];
      v22 = &v15[v21];
      v23 = &v16[v21];
      v24 = type metadata accessor for CloudAssets_Asset.ID(0);
      v94 = v20;
      if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v23, 1, v24))
      {
        v25 = sub_237F171BC(&qword_2568A9128);
        memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
      }
      else
      {
        v36 = *((_OWORD *)v23 + 1);
        *(_OWORD *)v22 = *(_OWORD *)v23;
        *((_OWORD *)v22 + 1) = v36;
        v37 = *((_OWORD *)v23 + 3);
        *((_OWORD *)v22 + 2) = *((_OWORD *)v23 + 2);
        *((_OWORD *)v22 + 3) = v37;
        v20(&v22[*(int *)(v24 + 32)], &v23[*(int *)(v24 + 32)], v11);
        _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v22, 0, 1, v24);
      }
      v38 = v17[7];
      v39 = &v15[v38];
      v40 = &v16[v38];
      v41 = type metadata accessor for CloudAssets_Asset.Protector(0);
      v12 = v97;
      a3 = __src;
      if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v40, 1, v41))
      {
        v42 = sub_237F171BC(&qword_2568A9130);
        memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
      }
      else
      {
        v43 = *((_OWORD *)v40 + 1);
        *(_OWORD *)v39 = *(_OWORD *)v40;
        *((_OWORD *)v39 + 1) = v43;
        v94(&v39[*(int *)(v41 + 24)], &v40[*(int *)(v41 + 24)], v11);
        _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v39, 0, 1, v41);
      }
      v13 = v99;
      v44 = (uint64_t)v15;
      v45 = (uint64_t)v17;
      goto LABEL_17;
    }
    goto LABEL_7;
  }
  if (v19)
  {
    sub_237F1A3D8((uint64_t)v15, type metadata accessor for CloudAssets_Asset);
LABEL_7:
    v26 = *(_QWORD *)(*(_QWORD *)(sub_237F171BC(&qword_2568A91A0) - 8) + 64);
    v27 = v15;
    v28 = v16;
LABEL_8:
    memcpy(v27, v28, v26);
    goto LABEL_18;
  }
  v98 = v12;
  v100 = v13;
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v13(&v15[v17[5]], &v16[v17[5]], v11);
  v29 = v17[6];
  v30 = (uint64_t)&v15[v29];
  v31 = &v16[v29];
  v32 = type metadata accessor for CloudAssets_Asset.ID(0);
  v95 = (_QWORD *)v30;
  LODWORD(v30) = _s10CloudAsset21UploadResponseMessageOwet_0(v30, 1, v32);
  v93 = v32;
  v33 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v31, 1, v32);
  if (!(_DWORD)v30)
  {
    if (!v33)
    {
      v83 = *((_QWORD *)v31 + 1);
      *v95 = *(_QWORD *)v31;
      v95[1] = v83;
      swift_bridgeObjectRelease();
      v84 = *((_QWORD *)v31 + 3);
      v95[2] = *((_QWORD *)v31 + 2);
      v95[3] = v84;
      swift_bridgeObjectRelease();
      v85 = v95[4];
      v86 = v95[5];
      *((_OWORD *)v95 + 2) = *((_OWORD *)v31 + 2);
      sub_237F17178(v85, v86);
      v87 = v95[6];
      v88 = v95[7];
      *((_OWORD *)v95 + 3) = *((_OWORD *)v31 + 3);
      sub_237F17178(v87, v88);
      v13 = v100;
      v100((char *)v95 + *(int *)(v93 + 32), &v31[*(int *)(v93 + 32)], v11);
      goto LABEL_36;
    }
    sub_237F1A3D8((uint64_t)v95, type metadata accessor for CloudAssets_Asset.ID);
    v34 = *(_QWORD *)(*(_QWORD *)(sub_237F171BC(&qword_2568A9128) - 8) + 64);
    v35 = v95;
LABEL_35:
    memcpy(v35, v31, v34);
    v13 = v100;
LABEL_36:
    v12 = v98;
    goto LABEL_41;
  }
  if (v33)
  {
    v34 = *(_QWORD *)(*(_QWORD *)(sub_237F171BC(&qword_2568A9128) - 8) + 64);
    v35 = v95;
    goto LABEL_35;
  }
  v74 = *((_OWORD *)v31 + 1);
  *(_OWORD *)v95 = *(_OWORD *)v31;
  *((_OWORD *)v95 + 1) = v74;
  v75 = *((_OWORD *)v31 + 3);
  *((_OWORD *)v95 + 2) = *((_OWORD *)v31 + 2);
  *((_OWORD *)v95 + 3) = v75;
  v12 = v98;
  (*(void (**)(char *, char *, uint64_t))(v98 + 32))((char *)v95 + *(int *)(v32 + 32), &v31[*(int *)(v32 + 32)], v11);
  _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v95, 0, 1, v32);
  v13 = v100;
LABEL_41:
  v76 = v17[7];
  v77 = (uint64_t)&v15[v76];
  v78 = &v16[v76];
  v79 = type metadata accessor for CloudAssets_Asset.Protector(0);
  v80 = _s10CloudAsset21UploadResponseMessageOwet_0(v77, 1, v79);
  v81 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v78, 1, v79);
  if (v80)
  {
    if (!v81)
    {
      v82 = *((_OWORD *)v78 + 1);
      *(_OWORD *)v77 = *(_OWORD *)v78;
      *(_OWORD *)(v77 + 16) = v82;
      (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v77 + *(int *)(v79 + 24), &v78[*(int *)(v79 + 24)], v11);
      v44 = v77;
      v45 = v79;
LABEL_17:
      _s10CloudAsset21UploadResponseMessageOwst_0(v44, 0, 1, v45);
      goto LABEL_18;
    }
    goto LABEL_46;
  }
  if (v81)
  {
    sub_237F1A3D8(v77, type metadata accessor for CloudAssets_Asset.Protector);
LABEL_46:
    v26 = *(_QWORD *)(*(_QWORD *)(sub_237F171BC(&qword_2568A9130) - 8) + 64);
    v27 = (void *)v77;
    v28 = v78;
    goto LABEL_8;
  }
  v89 = *(_QWORD *)v77;
  v90 = *(_QWORD *)(v77 + 8);
  *(_OWORD *)v77 = *(_OWORD *)v78;
  sub_237F17178(v89, v90);
  v91 = *(_QWORD *)(v77 + 16);
  v92 = *(_QWORD *)(v77 + 24);
  *(_OWORD *)(v77 + 16) = *((_OWORD *)v78 + 1);
  sub_237F17178(v91, v92);
  v13((char *)(v77 + *(int *)(v79 + 24)), &v78[*(int *)(v79 + 24)], v11);
LABEL_18:
  v46 = a3[8];
  v47 = (uint64_t)a1 + v46;
  v48 = (uint64_t)a2 + v46;
  v49 = type metadata accessor for CloudAssets_Credential(0);
  v50 = _s10CloudAsset21UploadResponseMessageOwet_0(v47, 1, v49);
  v51 = _s10CloudAsset21UploadResponseMessageOwet_0(v48, 1, v49);
  if (v50)
  {
    if (!v51)
    {
      v52 = *(_OWORD *)(v48 + 16);
      *(_OWORD *)v47 = *(_OWORD *)v48;
      *(_OWORD *)(v47 + 16) = v52;
      *(_OWORD *)(v47 + 32) = *(_OWORD *)(v48 + 32);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v47 + *(int *)(v49 + 28), v48 + *(int *)(v49 + 28), v11);
      v53 = *(int *)(v49 + 32);
      v54 = (void *)(v47 + v53);
      v55 = (const void *)(v48 + v53);
      v56 = type metadata accessor for Google_Protobuf_Timestamp();
      if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v55, 1, v56))
      {
        v57 = sub_237F171BC(&qword_2568A9190);
        memcpy(v54, v55, *(_QWORD *)(*(_QWORD *)(v57 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v56 - 8) + 32))(v54, v55, v56);
        _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v54, 0, 1, v56);
      }
      v70 = v47;
      v71 = v49;
      goto LABEL_31;
    }
    goto LABEL_24;
  }
  if (v51)
  {
    sub_237F1A3D8(v47, type metadata accessor for CloudAssets_Credential);
LABEL_24:
    v58 = *(_QWORD *)(*(_QWORD *)(sub_237F171BC(&qword_2568A9198) - 8) + 64);
    v59 = (void *)v47;
    v60 = (const void *)v48;
    goto LABEL_25;
  }
  v61 = *(_QWORD *)(v48 + 8);
  *(_QWORD *)v47 = *(_QWORD *)v48;
  *(_QWORD *)(v47 + 8) = v61;
  swift_bridgeObjectRelease();
  v62 = *(_QWORD *)(v48 + 24);
  *(_QWORD *)(v47 + 16) = *(_QWORD *)(v48 + 16);
  *(_QWORD *)(v47 + 24) = v62;
  swift_bridgeObjectRelease();
  v63 = *(_QWORD *)(v48 + 40);
  *(_QWORD *)(v47 + 32) = *(_QWORD *)(v48 + 32);
  *(_QWORD *)(v47 + 40) = v63;
  swift_bridgeObjectRelease();
  v13((char *)(v47 + *(int *)(v49 + 28)), (char *)(v48 + *(int *)(v49 + 28)), v11);
  v64 = *(int *)(v49 + 32);
  v65 = v47 + v64;
  v66 = v48 + v64;
  v67 = type metadata accessor for Google_Protobuf_Timestamp();
  v68 = _s10CloudAsset21UploadResponseMessageOwet_0(v65, 1, v67);
  v69 = _s10CloudAsset21UploadResponseMessageOwet_0(v66, 1, v67);
  if (v68)
  {
    if (!v69)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 32))(v65, v66, v67);
      v70 = v65;
      v71 = v67;
LABEL_31:
      _s10CloudAsset21UploadResponseMessageOwst_0(v70, 0, 1, v71);
      return a1;
    }
  }
  else
  {
    v73 = *(_QWORD *)(v67 - 8);
    if (!v69)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v73 + 40))(v65, v66, v67);
      return a1;
    }
    (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v65, v67);
  }
  v58 = *(_QWORD *)(*(_QWORD *)(sub_237F171BC(&qword_2568A9190) - 8) + 64);
  v59 = (void *)v65;
  v60 = (const void *)v66;
LABEL_25:
  memcpy(v59, v60, v58);
  return a1;
}

uint64_t sub_237F2CE48()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_237F2CE54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_237F2D678();
  if (v3)
  {
    sub_237F2D584(*(_QWORD *)(v0 + 8));
    sub_237F1BA50();
  }
  else
  {
    v2 = v1;
    sub_237F2D48C();
    sub_237F22364();
    if (v3)
    {
      v4 = *(int *)(v2 + 24);
    }
    else
    {
      sub_237F171BC(&qword_2568A91A0);
      sub_237F22364();
      if (v5)
      {
        sub_237F2D948();
      }
      else
      {
        sub_237F171BC(&qword_2568A9198);
        sub_237F2D93C();
      }
    }
    v6 = sub_237F2D754(v4);
    sub_237F1BAF8(v6, v7, v8);
  }
}

uint64_t sub_237F2CED4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_237F2CEE0()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_237F2D570();
  if (v4)
  {
    *(_QWORD *)(v1 + 8) = (v0 - 1);
    sub_237F1BA50();
  }
  else
  {
    v3 = v2;
    sub_237F2D48C();
    sub_237F22354();
    if (v4)
    {
      v5 = *(int *)(v3 + 24);
    }
    else
    {
      sub_237F171BC(&qword_2568A91A0);
      sub_237F22354();
      if (v6)
      {
        sub_237F2D930();
      }
      else
      {
        sub_237F171BC(&qword_2568A9198);
        sub_237F2D924();
      }
    }
    v7 = sub_237F2D5C8(v5);
    sub_237F1BB04(v7, v8, v9, v10);
  }
}

void sub_237F2CF60()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  type metadata accessor for UnknownStorage();
  if (v0 <= 0x3F)
  {
    sub_237F24614(319, &qword_2568A9528, (void (*)(uint64_t))type metadata accessor for CloudAssets_Asset);
    if (v1 <= 0x3F)
    {
      sub_237F24614(319, &qword_2568A9348, (void (*)(uint64_t))type metadata accessor for CloudAssets_Credential);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

_QWORD *sub_237F2D02C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_QWORD *)a1 = *a2;
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    *(_QWORD *)(a1 + 16) = a2[2];
    v5 = *(int *)(a3 + 24);
    v6 = a1 + v5;
    v7 = (uint64_t)a2 + v5;
    v8 = type metadata accessor for UnknownStorage();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_237F2D0C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 24);
  v3 = type metadata accessor for UnknownStorage();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

uint64_t sub_237F2D0FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

uint64_t sub_237F2D168(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 16) = a2[2];
  v5 = *(int *)(a3 + 24);
  v6 = a1 + v5;
  v7 = (uint64_t)a2 + v5;
  v8 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 24))(v6, v7, v8);
  return a1;
}

uint64_t sub_237F2D1D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_237F2D240(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_237F2D2AC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237F2D2B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 24);
  v5 = sub_237F2D48C();
  return _s10CloudAsset21UploadResponseMessageOwet_0(v4, a2, v5);
}

uint64_t sub_237F2D2EC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237F2D2F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 24);
  v6 = sub_237F2D48C();
  return sub_237F2D5D8(v5, a2, a2, v6);
}

uint64_t sub_237F2D32C()
{
  return sub_237F2D344();
}

uint64_t sub_237F2D344()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UnknownStorage();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_237F2D3B4()
{
  unint64_t result;

  result = qword_2568A9540;
  if (!qword_2568A9540)
  {
    result = MEMORY[0x23B82832C](&unk_237F5EA70, &type metadata for CloudAssets_Signal.EventType);
    atomic_store(result, (unint64_t *)&qword_2568A9540);
  }
  return result;
}

unint64_t sub_237F2D3F4()
{
  unint64_t result;

  result = qword_2568A9548;
  if (!qword_2568A9548)
  {
    result = MEMORY[0x23B82832C](&unk_237F5EA98, &type metadata for CloudAssets_Signal.EventType);
    atomic_store(result, (unint64_t *)&qword_2568A9548);
  }
  return result;
}

unint64_t sub_237F2D434()
{
  unint64_t result;

  result = qword_2568A9550;
  if (!qword_2568A9550)
  {
    result = MEMORY[0x23B82832C](&unk_237F5EAD8, &type metadata for CloudAssets_Signal.EventType);
    atomic_store(result, (unint64_t *)&qword_2568A9550);
  }
  return result;
}

uint64_t sub_237F2D470()
{
  return dispatch thunk of Decoder.nextFieldNumber()();
}

uint64_t sub_237F2D48C()
{
  return type metadata accessor for UnknownStorage();
}

uint64_t sub_237F2D4C0()
{
  return dispatch thunk of Decoder.nextFieldNumber()();
}

uint64_t sub_237F2D4CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s10CloudAsset21UploadResponseMessageOwet_0(a1, a2, a3);
}

void sub_237F2D4FC(uint64_t a1)
{
  uint64_t *v1;

  sub_237F1B910(a1, v1);
}

uint64_t sub_237F2D518@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v3 + a1, v1);
}

uint64_t sub_237F2D52C()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_237F2D540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  return a5(0);
}

uint64_t sub_237F2D55C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F2D584@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF)
    LODWORD(a1) = -1;
  return (a1 + 1);
}

void sub_237F2D598(uint64_t a1)
{
  uint64_t *v1;

  sub_237F1B910(a1, v1);
}

void sub_237F2D5A0(uint64_t a1)
{
  uint64_t *v1;

  sub_237F1B910(a1, v1);
}

uint64_t sub_237F2D5A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);

  return v4(v1, v3 + a1, v2);
}

uint64_t sub_237F2D5B8()
{
  return dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
}

uint64_t sub_237F2D5C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return v1 + a1;
}

uint64_t sub_237F2D5D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s10CloudAsset21UploadResponseMessageOwst_0(a1, a2, a3, a4);
}

void sub_237F2D5E0()
{
  uint64_t v0;
  unint64_t *v1;
  uint64_t (*v2)(uint64_t);

  sub_237F173F0(v1, v2, v0);
}

uint64_t sub_237F2D5F4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F2D61C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

void sub_237F2D630(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_237F2B0A4(a1, a2, v2);
}

void sub_237F2D638(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_237F2B0A4(a1, a2, v2);
}

uint64_t sub_237F2D640()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F2D658()
{
  return dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
}

uint64_t sub_237F2D688()
{
  return UnknownStorage.init()();
}

void sub_237F2D690(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_237F2B0A4(a1, a2, v2);
}

uint64_t sub_237F2D698()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F2D6BC()
{
  return UnknownStorage.traverse<A>(visitor:)();
}

uint64_t sub_237F2D6CC()
{
  return dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)();
}

uint64_t sub_237F2D6D8()
{
  return dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)();
}

uint64_t sub_237F2D700()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F2738C(v0, v1);
}

uint64_t sub_237F2D70C(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t sub_237F2D714()
{
  uint64_t v0;

  return v0;
}

void sub_237F2D734(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_237F1A3D8(a1, v1);
}

uint64_t sub_237F2D73C()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_237F2D754@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return v1 + a1;
}

uint64_t sub_237F2D770()
{
  return UnknownStorage.traverse<A>(visitor:)();
}

void sub_237F2D788(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
}

uint64_t sub_237F2D79C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_237F2D7B0()
{
  return dispatch thunk of Decoder.decodeSingularBytesField(value:)();
}

uint64_t sub_237F2D7BC()
{
  return dispatch thunk of Decoder.decodeSingularStringField(value:)();
}

uint64_t sub_237F2D7DC(uint64_t a1)
{
  uint64_t v1;

  return _s10CloudAsset21UploadResponseMessageOwst_0(v1, 1, 1, a1);
}

uint64_t sub_237F2D7F0()
{
  return dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
}

uint64_t sub_237F2D804()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F2D81C(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t sub_237F2D824()
{
  uint64_t v0;

  return v0;
}

void sub_237F2D83C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_237F1B910(v2, a2);
}

uint64_t sub_237F2D844()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F2D86C()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_237F2D884()
{
  return type metadata accessor for CloudAssets_Asset.ID(0);
}

uint64_t sub_237F2D88C()
{
  return type metadata accessor for CloudAssets_Asset.Protector(0);
}

uint64_t sub_237F2D894()
{
  return type metadata accessor for CloudAssets_Credential(0);
}

uint64_t sub_237F2D8CC(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

void sub_237F2D8D4(uint64_t a1)
{
  uint64_t *v1;

  sub_237F1B910(a1, v1);
}

uint64_t sub_237F2D8F0()
{
  return dispatch thunk of Decoder.decodeSingularInt64Field(value:)();
}

void sub_237F2D8FC(uint64_t a1)
{
  uint64_t *v1;

  sub_237F1B910(a1, v1);
}

uint64_t sub_237F2D904()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

void sub_237F2D910(uint64_t a1)
{
  uint64_t *v1;

  sub_237F1B910(a1, v1);
}

uint64_t sub_237F2D918()
{
  uint64_t (*v0)(_QWORD);

  return v0(0);
}

BOOL sub_237F2D974(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 != 0;
  if ((a2 & 1) == 0)
    v4 = a1;
  v5 = a3 != 0;
  if ((a4 & 1) == 0)
    v5 = a3;
  return v4 == v5;
}

void DownloadRequestMessage.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)v1;
  Hasher._combine(_:)(*(unsigned __int8 *)(v1 + 8));
  sub_237F32FDC(a1, v3);
}

uint64_t static DownloadRequestMessage.== infix(_:_:)(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v2 = *a1;
  v3 = *((unsigned __int8 *)a1 + 8);
  v4 = *a2;
  v5 = *((unsigned __int8 *)a2 + 8);
  if ((v3 & 1) == 0)
  {
    if ((v5 & 1) == 0)
    {
      j__swift_bridgeObjectRetain(*a2, 0);
      j__swift_bridgeObjectRetain(v2, 0);
      v6 = sub_237F34418();
      v3 = 0;
      v5 = 0;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if ((v5 & 1) == 0)
  {
LABEL_5:
    j__swift_bridgeObjectRetain(*a2, *((unsigned __int8 *)a2 + 8));
    j__swift_bridgeObjectRetain(v2, v3);
    v6 = 0;
    goto LABEL_7;
  }
  v3 = 1;
  j__swift_bridgeObjectRetain(*a2, 1);
  j__swift_bridgeObjectRetain(v2, 1);
  v6 = sub_237F34418();
  v5 = 1;
LABEL_7:
  j__swift_bridgeObjectRelease(v2, v3);
  j__swift_bridgeObjectRelease(v4, v5);
  return v6 & 1;
}

uint64_t sub_237F2DAB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BYTE *v3;
  char *v4;
  char v5;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    v3 = (_BYTE *)(a1 + 40);
    v4 = (char *)(a2 + 40);
    do
    {
      v5 = *v4;
      if ((*v3 & 1) != 0)
      {
        if (!*v4)
          return 0;
      }
      else
      {
        if (*((_QWORD *)v3 - 1) != *((_QWORD *)v4 - 1))
          v5 = 1;
        if ((v5 & 1) != 0)
          return 0;
      }
      v3 += 16;
      v4 += 16;
      --v2;
    }
    while (v2);
  }
  return 1;
}

uint64_t sub_237F2DB1C(_QWORD *a1, _QWORD *a2)
{
  unint64_t v2;
  uint64_t result;
  char v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  result = a1[4];
  if (result != a2[4] || a1[5] != a2[5])
  {
    v7 = sub_237F1BD24();
    result = 0;
    if ((v7 & 1) == 0)
      return result;
  }
  if (v2 == 1)
    return 1;
  v8 = a2 + 7;
  v9 = a1 + 7;
  v10 = 1;
  while (v10 < v2)
  {
    result = *(v9 - 1);
    if (result != *(v8 - 1) || *v9 != *v8)
    {
      result = sub_237F1BD24();
      if ((result & 1) == 0)
        return 0;
    }
    ++v10;
    v8 += 2;
    v9 += 2;
    if (v2 == v10)
      return 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_237F2DBE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  BOOL v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  BOOL v24;
  _QWORD v26[18];
  char *v27;
  int *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v28 = (int *)type metadata accessor for AssetDownloadRequest();
  v4 = MEMORY[0x24BDAC7A8](v28);
  v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)v26 - v8;
  v10 = *(_QWORD *)(a1 + 16);
  if (v10 == *(_QWORD *)(a2 + 16))
  {
    if (!v10 || a1 == a2)
      return 1;
    v26[17] = 0;
    v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v26[8] = *(_QWORD *)(v7 + 72);
    v26[9] = a1;
    v26[16] = v6;
    v26[10] = a2;
    v26[12] = v10;
    sub_237F17320(a1 + v11, (uint64_t)v26 - v8, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadRequest);
    v26[11] = v11;
    sub_237F17320(a2 + v11, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadRequest);
    if ((static UUID.== infix(_:_:)() & 1) != 0)
    {
      v12 = v28[5];
      v13 = *(_QWORD *)&v9[v12];
      v14 = *(_QWORD *)&v9[v12 + 8];
      v15 = &v6[v12];
      v16 = v13 == *(_QWORD *)v15 && v14 == *((_QWORD *)v15 + 1);
      if ((v16 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        && (MEMORY[0x23B8279B4](&v9[v28[6]], &v6[v28[6]]) & 1) != 0)
      {
        v17 = v28[7];
        v18 = &v9[v17];
        v27 = &v6[v17];
        if ((MEMORY[0x23B8279B4](&v9[v17]) & 1) != 0)
        {
          v19 = type metadata accessor for Asset.ID(0);
          v20 = *(int *)(v19 + 20);
          v21 = *(_QWORD *)&v18[v20];
          v22 = *(_QWORD *)&v18[v20 + 8];
          v23 = &v27[v20];
          v24 = v21 == *(_QWORD *)v23 && v22 == *((_QWORD *)v23 + 1);
          if (v24 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            __asm { BR              X11 }
        }
      }
    }
    sub_237F17360((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadRequest);
    sub_237F17360((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadRequest);
  }
  return 0;
}

void sub_237F2F8E8()
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
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  _QWORD v20[20];

  sub_237F2D8B4();
  v1 = v0;
  v3 = v2;
  v20[18] = *MEMORY[0x24BDAC8D0];
  v20[11] = type metadata accessor for AssetSkeleton();
  sub_237F341A0();
  MEMORY[0x24BDAC7A8](v4);
  sub_237F341E0();
  v7 = v5 - v6;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v20 - v10;
  v12 = *(_QWORD *)(v3 + 16);
  if (v12 == *(_QWORD *)(v1 + 16) && v12 && v3 != v1)
  {
    v20[12] = 0;
    v13 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v20[2] = *(_QWORD *)(v9 + 72);
    v20[3] = v3;
    v20[4] = v1;
    v20[5] = v7;
    v20[9] = (char *)v20 - v10;
    v20[7] = v12;
    sub_237F3431C(v3 + v13, (uint64_t)v20 - v10);
    v20[6] = v13;
    sub_237F3431C(v1 + v13, v7);
    if ((MEMORY[0x23B8279B4](v11, v7) & 1) != 0)
    {
      v14 = type metadata accessor for Asset.ID(0);
      v15 = *(int *)(v14 + 20);
      v16 = *(_QWORD *)&v11[v15];
      v17 = *(_QWORD *)&v11[v15 + 8];
      v18 = (_QWORD *)(v7 + v15);
      v19 = v16 == *v18 && v17 == v18[1];
      if (v19 || (sub_237F1BD24() & 1) != 0)
        __asm { BR              X8 }
    }
    sub_237F34314(v7);
    sub_237F34314((uint64_t)v11);
  }
  sub_237F2D4A8();
}

void sub_237F31064()
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
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  _QWORD v20[14];
  uint64_t v21;
  uint64_t v22;

  sub_237F2D8B4();
  v1 = v0;
  v3 = v2;
  v22 = *MEMORY[0x24BDAC8D0];
  v21 = type metadata accessor for AssetUploadRequest();
  sub_237F341A0();
  MEMORY[0x24BDAC7A8](v4);
  sub_237F341E0();
  v7 = v5 - v6;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v20 - v10;
  v12 = *(_QWORD *)(v3 + 16);
  if (v12 == *(_QWORD *)(v1 + 16) && v12 && v3 != v1)
  {
    v20[5] = 0;
    v13 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v14 = *(_QWORD *)(v9 + 72);
    v20[2] = v1;
    v20[3] = v14;
    v20[4] = v3;
    v20[7] = v12;
    sub_237F17320(v3 + v13, (uint64_t)v20 - v10, (uint64_t (*)(_QWORD))type metadata accessor for AssetUploadRequest);
    sub_237F17320(v1 + v13, v7, (uint64_t (*)(_QWORD))type metadata accessor for AssetUploadRequest);
    if ((static UUID.== infix(_:_:)() & 1) != 0)
    {
      v15 = *(int *)(v21 + 20);
      v16 = *(_QWORD *)&v11[v15];
      v17 = *(_QWORD *)&v11[v15 + 8];
      v18 = (_QWORD *)(v7 + v15);
      v19 = v16 == *v18 && v17 == v18[1];
      if (v19 || (sub_237F1BD24() & 1) != 0)
        sub_237F34264();
    }
    sub_237F342E4(v7);
    sub_237F342E4((uint64_t)v11);
  }
  sub_237F2D4A8();
}

void sub_237F31C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  BOOL v41;

  sub_237F2D8B4();
  a19 = v20;
  a20 = v21;
  v23 = v22;
  v25 = v24;
  type metadata accessor for CloudAssets_Asset(0);
  sub_237F341A0();
  MEMORY[0x24BDAC7A8](v26);
  sub_237F341E0();
  v29 = v27 - v28;
  MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&a9 - v32;
  v34 = *(_QWORD *)(v25 + 16);
  if (v34 == *(_QWORD *)(v23 + 16) && v34 && v25 != v23)
  {
    v35 = (*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
    v36 = *(_QWORD *)(v31 + 72);
    v37 = v34 - 1;
    do
    {
      sub_237F3431C(v25 + v35, (uint64_t)v33);
      sub_237F3431C(v23 + v35, v29);
      sub_237F26840();
      v39 = v38;
      sub_237F342CC(v29);
      sub_237F342CC((uint64_t)v33);
      v41 = v37-- != 0;
      if ((v39 & 1) == 0)
        break;
      v35 += v36;
    }
    while (v41);
  }
  sub_237F2D4A8();
}

void sub_237F31D88()
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
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char *v18;

  sub_237F2D8B4();
  v1 = v0;
  v3 = v2;
  type metadata accessor for CloudAssets_Signal.Event(0);
  sub_237F341A0();
  MEMORY[0x24BDAC7A8](v4);
  sub_237F341E0();
  v7 = v5 - v6;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - v10;
  v12 = *(_QWORD *)(v3 + 16);
  if (v12 == *(_QWORD *)(v1 + 16) && v12 && v3 != v1)
  {
    v13 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v17 = *(_QWORD *)(v9 + 72);
    v18 = (char *)&v17 - v10;
    while (1)
    {
      sub_237F34398(v3 + v13, (uint64_t)v11);
      sub_237F34398(v1 + v13, v7);
      v14 = *(_QWORD *)v11;
      v15 = *(_QWORD *)v7;
      if (v11[8])
        v14 = *(_QWORD *)v11 != 0;
      if (*(_BYTE *)(v7 + 8) == 1)
      {
        if (v15)
        {
          if (v14 != 1)
            break;
        }
        else if (v14)
        {
          break;
        }
      }
      else if (v14 != v15)
      {
        break;
      }
      if (*((_QWORD *)v11 + 2) != *(_QWORD *)(v7 + 16))
        break;
      type metadata accessor for UnknownStorage();
      sub_237F173F0(&qword_2568A94D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v16 = dispatch thunk of static Equatable.== infix(_:_:)();
      v11 = v18;
      if ((v16 & 1) == 0)
        break;
      sub_237F34390(v7);
      sub_237F34390((uint64_t)v11);
      v13 += v17;
      if (!--v12)
        goto LABEL_19;
    }
    sub_237F34314(v7);
    sub_237F34314((uint64_t)v11);
  }
LABEL_19:
  sub_237F2D4A8();
}

uint64_t sub_237F31F60()
{
  return 0x7374736575716572;
}

uint64_t sub_237F31F78(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x7165526863746162 && a2 == 0xED00007374736575;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65526D6165727473 && a2 == 0xEE00737473657571)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_237F320AC(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65526D6165727473;
  else
    return 0x7165526863746162;
}

uint64_t sub_237F320FC(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x7374736575716572 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_237F1BD24();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_237F3217C()
{
  sub_237F1BA84();
  sub_237F3435C();
  sub_237F1BBC8();
  sub_237F1BBBC();
}

void sub_237F321A8()
{
  sub_237F3217C();
}

uint64_t sub_237F321C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F320FC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_237F321EC()
{
  return sub_237F168F0();
}

uint64_t sub_237F32204@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_237F1854C();
  *a1 = result & 1;
  return result;
}

uint64_t sub_237F3222C()
{
  sub_237F33504();
  return CodingKey.description.getter();
}

uint64_t sub_237F32254()
{
  sub_237F33504();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F3227C()
{
  char *v0;

  return sub_237F320AC(*v0);
}

uint64_t sub_237F32284@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F31F78(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237F322A8()
{
  sub_237F3348C();
  return CodingKey.description.getter();
}

uint64_t sub_237F322D0()
{
  sub_237F3348C();
  return CodingKey.debugDescription.getter();
}

void sub_237F322F8()
{
  Hasher.init(_seed:)();
  sub_237F3435C();
  sub_237F1BBC8();
  sub_237F1BBBC();
}

uint64_t sub_237F32324()
{
  sub_237F334C8();
  return CodingKey.description.getter();
}

uint64_t sub_237F3234C()
{
  sub_237F334C8();
  return CodingKey.debugDescription.getter();
}

void DownloadRequestMessage.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
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

  v3 = sub_237F171BC(&qword_2568A9558);
  v19 = *(_QWORD *)(v3 - 8);
  v20 = v3;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v4);
  sub_237F1DD54();
  v7 = v6 - v5;
  v8 = sub_237F171BC(&qword_2568A9560);
  v18 = *(_QWORD *)(v8 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v9);
  sub_237F1DD54();
  v12 = v11 - v10;
  v21 = *(_QWORD *)(sub_237F171BC(&qword_2568A9568) - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v13);
  sub_237F1DD54();
  v16 = v15 - v14;
  v17 = *(unsigned __int8 *)(v1 + 8);
  sub_237F171FC(a1, a1[3]);
  sub_237F3348C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if ((v17 & 1) != 0)
  {
    sub_237F343E0();
    sub_237F34220();
    sub_237F171BC(&qword_2568A9580);
    sub_237F3391C(&qword_2568A9588, &qword_2568A9268, (uint64_t)&protocol conformance descriptor for AssetDownloadRequest, MEMORY[0x24BEE12A0]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v7, v20);
  }
  else
  {
    sub_237F33504();
    sub_237F34220();
    sub_237F171BC(&qword_2568A9580);
    sub_237F3391C(&qword_2568A9588, &qword_2568A9268, (uint64_t)&protocol conformance descriptor for AssetDownloadRequest, MEMORY[0x24BEE12A0]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v12, v8);
  }
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v16, v17);
  sub_237F1B978();
}

Swift::Int DownloadRequestMessage.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  Swift::UInt v2;
  _BYTE v4[72];

  v1 = *(_QWORD *)v0;
  v2 = *(unsigned __int8 *)(v0 + 8);
  sub_237F1BA84();
  Hasher._combine(_:)(v2);
  sub_237F32FDC((uint64_t)v4, v1);
  return sub_237F1BBC8();
}

void DownloadRequestMessage.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v24 = *(_QWORD *)(sub_237F171BC(&qword_2568A9598) - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v3);
  sub_237F1DD54();
  v23 = sub_237F171BC(&qword_2568A95A0);
  v4 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  sub_237F1DD54();
  v5 = sub_237F171BC(&qword_2568A95A8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  sub_237F1DD54();
  v9 = v8 - v7;
  sub_237F171FC(a1, a1[3]);
  sub_237F3348C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v25)
    goto LABEL_10;
  v26 = v6;
  v10 = KeyedDecodingContainer.allKeys.getter();
  v11 = *(_QWORD *)(v10 + 16);
  v12 = v5;
  if (!v11)
  {
LABEL_8:
    v18 = type metadata accessor for DecodingError();
    swift_allocError();
    v20 = v19;
    sub_237F171BC(&qword_2568A95B0);
    *v20 = &type metadata for DownloadRequestMessage;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v20, *MEMORY[0x24BEE26D0], v18);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v9, v12);
LABEL_10:
    v21 = (uint64_t)a1;
    goto LABEL_11;
  }
  v13 = *(_BYTE *)(v10 + 32);
  sub_237F33F28(1, v11, v10, v10 + 32, 0, (2 * v11) | 1);
  v15 = v14;
  v17 = v16;
  swift_bridgeObjectRelease();
  if (v15 != v17 >> 1)
  {
    v12 = v5;
    goto LABEL_8;
  }
  if ((v13 & 1) != 0)
  {
    sub_237F343E0();
    sub_237F34404();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    sub_237F171BC(&qword_2568A9580);
    sub_237F3391C(&qword_2568A95B8, &qword_2568A9260, (uint64_t)&protocol conformance descriptor for AssetDownloadRequest, MEMORY[0x24BEE12D0]);
    sub_237F34270();
    sub_237F340A4(v24);
  }
  else
  {
    LOBYTE(v27) = 0;
    sub_237F33504();
    sub_237F34404();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    sub_237F171BC(&qword_2568A9580);
    sub_237F3391C(&qword_2568A95B8, &qword_2568A9260, (uint64_t)&protocol conformance descriptor for AssetDownloadRequest, MEMORY[0x24BEE12D0]);
    sub_237F34270();
    sub_237F340A4(v4);
  }
  sub_237F342BC();
  sub_237F34214(*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8));
  v21 = (uint64_t)a1;
  *(_QWORD *)a2 = v27;
  *(_BYTE *)(a2 + 8) = v13;
LABEL_11:
  sub_237F172A0(v21);
  sub_237F1B978();
}

Swift::Int sub_237F32A18()
{
  uint64_t v0;
  uint64_t v1;
  Swift::UInt v2;
  _BYTE v4[72];

  v1 = *(_QWORD *)v0;
  v2 = *(unsigned __int8 *)(v0 + 8);
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v2);
  sub_237F32FDC((uint64_t)v4, v1);
  return Hasher._finalize()();
}

void sub_237F32A70(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  DownloadRequestMessage.init(from:)(a1, a2);
}

void sub_237F32A84(_QWORD *a1)
{
  DownloadRequestMessage.encode(to:)(a1);
}

void sub_237F32A9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_237F32AFC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  BOOL *v35;
  const void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t result;
  uint64_t v40;
  __int16 v41;
  char v42;
  char v43;
  char v44;
  char v45;

  v40 = v37;
  v41 = v38;
  v42 = BYTE2(v38);
  v43 = BYTE3(v38);
  v44 = BYTE4(v38);
  v45 = BYTE5(v38);
  if (!v36)
  {
    __break(1u);
    JUMPOUT(0x237F32C80);
  }
  result = memcmp(v36, &v40, BYTE6(v38));
  *v35 = (_DWORD)result == 0;
  return result;
}

uint64_t sub_237F32CB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = __DataStorage._bytes.getter();
  v11 = result;
  if (result)
  {
    result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = __DataStorage._length.getter();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_237F32A9C(v11, v17, a4, a5);
  sub_237F17178(a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

uint64_t sub_237F32D80(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t result;
  char *v8;
  BOOL v9;
  int64_t v10;
  size_t v11;

  result = __DataStorage._bytes.getter();
  v8 = (char *)result;
  if (result)
  {
    result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
    v8 += a1 - result;
  }
  v9 = __OFSUB__(a2, a1);
  v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_12;
  }
  result = __DataStorage._length.getter();
  if (!a4)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!v8)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  if (result >= v10)
    v11 = v10;
  else
    v11 = result;
  return memcmp(a4, v8, v11) == 0;
}

uint64_t sub_237F32E1C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  char v7;
  char v9;
  uint64_t v10;
  __int16 v11;
  char v12;
  char v13;
  char v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v10 = a1;
  v11 = a2;
  v12 = BYTE2(a2);
  v13 = BYTE3(a2);
  v14 = BYTE4(a2);
  v15 = BYTE5(a2);
  sub_237F32A9C((uint64_t)&v10, (uint64_t)&v10 + BYTE6(a2), a3, a4);
  sub_237F17178(a3, a4);
  if (!v4)
    v7 = v9;
  return v7 & 1;
}

void sub_237F32F1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  Swift::UInt64 v5;

  sub_237F34298(a1, a2);
  if (v2)
  {
    v4 = (_BYTE *)(v3 + 40);
    do
    {
      if ((*v4 & 1) != 0)
      {
        Hasher._combine(_:)(1uLL);
      }
      else
      {
        v5 = *((_QWORD *)v4 - 1);
        sub_237F3435C();
        Hasher._combine(_:)(v5);
      }
      v4 += 16;
      --v2;
    }
    while (v2);
  }
}

void sub_237F32F78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_237F34298(a1, a2);
  if (v2)
  {
    v4 = v3 + 40;
    do
    {
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      v4 += 16;
      --v2;
    }
    while (v2);
  }
}

void sub_237F32FDC(uint64_t a1, uint64_t a2)
{
  int *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  Swift::UInt v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  Swift::UInt v25;
  Swift::UInt v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  Swift::UInt v34;
  uint64_t v35;
  int *v36;
  uint64_t v37;
  Swift::UInt v38;

  v3 = (int *)type metadata accessor for AssetDownloadRequest();
  v4 = *((_QWORD *)v3 - 1);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a2 + 16);
  Hasher._combine(_:)(v7);
  if (v7)
  {
    v8 = a2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v35 = *(_QWORD *)(v4 + 72);
    v36 = v3;
    do
    {
      v37 = v8;
      v38 = v7;
      sub_237F17320(v8, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadRequest);
      type metadata accessor for UUID();
      sub_237F173F0(&qword_2568A8F70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      dispatch thunk of Hashable.hash(into:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      type metadata accessor for URL();
      sub_237F173F0(&qword_2568A8F78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
      dispatch thunk of Hashable.hash(into:)();
      v9 = &v6[v3[7]];
      dispatch thunk of Hashable.hash(into:)();
      v10 = type metadata accessor for Asset.ID(0);
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      v11 = (uint64_t *)&v9[*(int *)(v10 + 24)];
      v12 = *v11;
      v13 = v11[1];
      sub_237F17134(*v11, v13);
      Data.hash(into:)();
      sub_237F17178(v12, v13);
      v14 = (uint64_t *)&v9[*(int *)(v10 + 28)];
      v15 = *v14;
      v16 = v14[1];
      sub_237F17134(*v14, v16);
      Data.hash(into:)();
      sub_237F17178(v15, v16);
      v17 = type metadata accessor for Asset(0);
      v18 = (uint64_t *)&v9[*(int *)(v17 + 20)];
      v19 = *v18;
      v20 = v18[1];
      v22 = v18[2];
      v21 = v18[3];
      sub_237F17134(*v18, v20);
      Data.hash(into:)();
      v23 = v19;
      v3 = v36;
      sub_237F17178(v23, v20);
      sub_237F17134(v22, v21);
      Data.hash(into:)();
      sub_237F17178(v22, v21);
      Hasher._combine(_:)(*(_QWORD *)&v9[*(int *)(v17 + 24)]);
      v24 = &v6[v3[8]];
      if (v24[16] == 1)
      {
        Hasher._combine(_:)(0);
      }
      else
      {
        v26 = *(_QWORD *)v24;
        v25 = *((_QWORD *)v24 + 1);
        Hasher._combine(_:)(1u);
        Hasher._combine(_:)(v26);
        Hasher._combine(_:)(v25);
      }
      dispatch thunk of Hashable.hash(into:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      type metadata accessor for Credential(0);
      type metadata accessor for Date();
      sub_237F173F0((unint64_t *)&unk_2568A9610, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
      dispatch thunk of Hashable.hash(into:)();
      v27 = (uint64_t *)&v6[v3[11]];
      v28 = *v27;
      v29 = v27[1];
      sub_237F17134(*v27, v29);
      Data.hash(into:)();
      sub_237F17178(v28, v29);
      v30 = (uint64_t *)&v6[v3[12]];
      v31 = *v30;
      v32 = v30[1];
      sub_237F17134(*v30, v32);
      Data.hash(into:)();
      sub_237F17178(v31, v32);
      if (*(_QWORD *)&v6[v3[13] + 8])
      {
        Hasher._combine(_:)(1u);
        swift_bridgeObjectRetain();
        String.hash(into:)();
        swift_bridgeObjectRelease();
      }
      else
      {
        Hasher._combine(_:)(0);
      }
      v33 = v37;
      v34 = v38;
      sub_237F17360((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadRequest);
      v8 = v33 + v35;
      v7 = v34 - 1;
    }
    while (v7);
  }
}

unint64_t sub_237F3348C()
{
  unint64_t result;

  result = qword_2568A9570;
  if (!qword_2568A9570)
  {
    result = MEMORY[0x23B82832C](&unk_237F5EF64, &type metadata for DownloadRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9570);
  }
  return result;
}

unint64_t sub_237F334C8()
{
  unint64_t result;

  result = qword_2568A9578;
  if (!qword_2568A9578)
  {
    result = MEMORY[0x23B82832C](&unk_237F5EF14, &type metadata for DownloadRequestMessage.StreamRequestsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9578);
  }
  return result;
}

unint64_t sub_237F33504()
{
  unint64_t result;

  result = qword_2568A9590;
  if (!qword_2568A9590)
  {
    result = MEMORY[0x23B82832C](&unk_237F5EEC4, &type metadata for DownloadRequestMessage.BatchRequestsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9590);
  }
  return result;
}

void sub_237F33540()
{
  uint64_t v0;
  int *v1;
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

  sub_237F2D8B4();
  v5 = v4;
  type metadata accessor for AssetSkeleton();
  sub_237F3444C();
  MEMORY[0x24BDAC7A8](v6);
  sub_237F34120();
  if (v3)
  {
    sub_237F341F0();
    do
    {
      sub_237F17320(v5, v2, (uint64_t (*)(_QWORD))type metadata accessor for AssetSkeleton);
      type metadata accessor for URL();
      sub_237F173F0(&qword_2568A8F78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
      sub_237F34284();
      type metadata accessor for Asset.ID(0);
      sub_237F3437C();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      sub_237F34364();
      sub_237F34344();
      sub_237F34370();
      v7 = *(_QWORD *)(v2 + *(int *)(v0 + 28));
      sub_237F34424();
      sub_237F34324();
      sub_237F34430();
      type metadata accessor for Asset(0);
      sub_237F3437C();
      v9 = *(_QWORD *)(v8 + 16);
      sub_237F34364();
      sub_237F34344();
      sub_237F34370();
      sub_237F34144(v9);
      Data.hash(into:)();
      sub_237F340F4(v9);
      Hasher._combine(_:)(*(_QWORD *)(v2 + *(int *)(v7 + 24)));
      v10 = *(_QWORD *)(v2 + v1[5]);
      sub_237F34144(v10);
      sub_237F34334();
      sub_237F340F4(v10);
      v11 = *(_QWORD *)(v2 + v1[6]);
      sub_237F34144(v11);
      sub_237F34334();
      sub_237F340F4(v11);
      v12 = v2 + v1[7];
      sub_237F3443C();
      sub_237F34180();
      sub_237F34444();
      sub_237F3443C();
      sub_237F34180();
      sub_237F34444();
      sub_237F3443C();
      sub_237F34180();
      sub_237F34444();
      v0 = v12 + *(int *)(sub_237F342AC() + 28);
      type metadata accessor for Date();
      sub_237F173F0((unint64_t *)&unk_2568A9610, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
      dispatch thunk of Hashable.hash(into:)();
      sub_237F17360(v2, (uint64_t (*)(_QWORD))type metadata accessor for AssetSkeleton);
      v5 += v13;
      --v3;
    }
    while (v3);
  }
  sub_237F2D4A8();
}

void sub_237F33754()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_237F2D8B4();
  v4 = v3;
  type metadata accessor for AssetUploadRequest();
  sub_237F3444C();
  MEMORY[0x24BDAC7A8](v5);
  sub_237F34120();
  if (v2)
  {
    sub_237F341F0();
    do
    {
      sub_237F34398(v4, v1);
      type metadata accessor for UUID();
      sub_237F173F0(&qword_2568A8F70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      sub_237F34284();
      sub_237F342B4();
      sub_237F340E4();
      sub_237F342C4();
      type metadata accessor for URL();
      sub_237F173F0(&qword_2568A8F78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
      sub_237F34190();
      sub_237F34190();
      sub_237F34190();
      v6 = *(_QWORD *)(v1 + *(int *)(v0 + 36) + 16);
      sub_237F34424();
      sub_237F34324();
      sub_237F34430();
      sub_237F34010(v6);
      Data.hash(into:)();
      sub_237F33FF0(v6);
      sub_237F342B4();
      sub_237F340E4();
      sub_237F342C4();
      sub_237F342B4();
      sub_237F340E4();
      sub_237F342C4();
      sub_237F342B4();
      sub_237F340E4();
      sub_237F342C4();
      sub_237F342AC();
      type metadata accessor for Date();
      sub_237F173F0((unint64_t *)&unk_2568A9610, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
      dispatch thunk of Hashable.hash(into:)();
      sub_237F34390(v1);
      v4 += v7;
      --v2;
    }
    while (v2);
  }
  sub_237F2D4A8();
}

uint64_t sub_237F3391C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = *a1;
  if (!result)
  {
    v9 = sub_237F1725C(&qword_2568A9580);
    sub_237F173F0(a2, (uint64_t (*)(uint64_t))type metadata accessor for AssetDownloadRequest, a3);
    v11 = v10;
    result = MEMORY[0x23B82832C](a4, v9, &v11);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_237F339A4()
{
  unint64_t result;

  result = qword_2568A95C0;
  if (!qword_2568A95C0)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for DownloadRequestMessage, &type metadata for DownloadRequestMessage);
    atomic_store(result, (unint64_t *)&qword_2568A95C0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DownloadRequestMessage(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  unsigned __int8 v4;

  v3 = *a2;
  v4 = *((_BYTE *)a2 + 8);
  j__swift_bridgeObjectRetain(*a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

uint64_t destroy for DownloadRequestMessage(uint64_t a1)
{
  return j__swift_bridgeObjectRelease(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t *assignWithCopy for DownloadRequestMessage(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a2;
  v4 = *((_BYTE *)a2 + 8);
  j__swift_bridgeObjectRetain(*a2, v4);
  v5 = *a1;
  v6 = *((unsigned __int8 *)a1 + 8);
  *a1 = v3;
  *((_BYTE *)a1 + 8) = v4;
  j__swift_bridgeObjectRelease(v5, v6);
  return a1;
}

uint64_t *assignWithTake for DownloadRequestMessage(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a2;
  v4 = *((_BYTE *)a2 + 8);
  v5 = *a1;
  v6 = *((unsigned __int8 *)a1 + 8);
  *a1 = v3;
  *((_BYTE *)a1 + 8) = v4;
  j__swift_bridgeObjectRelease(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DownloadRequestMessage(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 1)
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

uint64_t storeEnumTagSinglePayload for DownloadRequestMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_237F33B44(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_237F33B4C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DownloadRequestMessage()
{
  return &type metadata for DownloadRequestMessage;
}

uint64_t storeEnumTagSinglePayload for DownloadRequestMessage.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237F33BB4 + 4 * byte_237F5EB65[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_237F33BE8 + 4 * byte_237F5EB60[v4]))();
}

uint64_t sub_237F33BE8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F33BF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237F33BF8);
  return result;
}

uint64_t sub_237F33C04(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237F33C0CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_237F33C10(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F33C18(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DownloadRequestMessage.CodingKeys()
{
  return &type metadata for DownloadRequestMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for DownloadRequestMessage.BatchRequestsCodingKeys()
{
  return &type metadata for DownloadRequestMessage.BatchRequestsCodingKeys;
}

uint64_t _s10CloudAsset22DownloadRequestMessageO23BatchRequestsCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_237F33C88 + 4 * byte_237F5EB6A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_237F33CA8 + 4 * byte_237F5EB6F[v4]))();
}

_BYTE *sub_237F33C88(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_237F33CA8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F33CB0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F33CB8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F33CC0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F33CC8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DownloadRequestMessage.StreamRequestsCodingKeys()
{
  return &type metadata for DownloadRequestMessage.StreamRequestsCodingKeys;
}

unint64_t sub_237F33CE8()
{
  unint64_t result;

  result = qword_2568A95C8;
  if (!qword_2568A95C8)
  {
    result = MEMORY[0x23B82832C](&unk_237F5ED2C, &type metadata for DownloadRequestMessage.StreamRequestsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A95C8);
  }
  return result;
}

unint64_t sub_237F33D28()
{
  unint64_t result;

  result = qword_2568A95D0;
  if (!qword_2568A95D0)
  {
    result = MEMORY[0x23B82832C](&unk_237F5EDE4, &type metadata for DownloadRequestMessage.BatchRequestsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A95D0);
  }
  return result;
}

unint64_t sub_237F33D68()
{
  unint64_t result;

  result = qword_2568A95D8;
  if (!qword_2568A95D8)
  {
    result = MEMORY[0x23B82832C](&unk_237F5EE9C, &type metadata for DownloadRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A95D8);
  }
  return result;
}

unint64_t sub_237F33DA8()
{
  unint64_t result;

  result = qword_2568A95E0;
  if (!qword_2568A95E0)
  {
    result = MEMORY[0x23B82832C](&unk_237F5ED54, &type metadata for DownloadRequestMessage.BatchRequestsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A95E0);
  }
  return result;
}

unint64_t sub_237F33DE8()
{
  unint64_t result;

  result = qword_2568A95E8;
  if (!qword_2568A95E8)
  {
    result = MEMORY[0x23B82832C](&unk_237F5ED7C, &type metadata for DownloadRequestMessage.BatchRequestsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A95E8);
  }
  return result;
}

unint64_t sub_237F33E28()
{
  unint64_t result;

  result = qword_2568A95F0;
  if (!qword_2568A95F0)
  {
    result = MEMORY[0x23B82832C](&unk_237F5EC9C, &type metadata for DownloadRequestMessage.StreamRequestsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A95F0);
  }
  return result;
}

unint64_t sub_237F33E68()
{
  unint64_t result;

  result = qword_2568A95F8;
  if (!qword_2568A95F8)
  {
    result = MEMORY[0x23B82832C](&unk_237F5ECC4, &type metadata for DownloadRequestMessage.StreamRequestsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A95F8);
  }
  return result;
}

unint64_t sub_237F33EA8()
{
  unint64_t result;

  result = qword_2568A9600;
  if (!qword_2568A9600)
  {
    result = MEMORY[0x23B82832C](&unk_237F5EE0C, &type metadata for DownloadRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9600);
  }
  return result;
}

unint64_t sub_237F33EE8()
{
  unint64_t result;

  result = qword_2568A9608;
  if (!qword_2568A9608)
  {
    result = MEMORY[0x23B82832C](&unk_237F5EE34, &type metadata for DownloadRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9608);
  }
  return result;
}

uint64_t sub_237F33F28(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2)
    goto LABEL_10;
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0)
    return swift_unknownObjectRetain();
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_237F33FB0()
{
  unint64_t v0;
  uint64_t v1;

  return sub_237F17178(v1, v0);
}

uint64_t sub_237F33FBC()
{
  unint64_t v0;
  uint64_t v1;

  return sub_237F17134(v1, v0);
}

uint64_t sub_237F33FC8(uint64_t a1)
{
  unint64_t v1;

  return sub_237F17134(a1, v1);
}

uint64_t sub_237F33FD0()
{
  unint64_t v0;
  uint64_t v1;

  return sub_237F17178(v1, v0);
}

uint64_t sub_237F33FDC(uint64_t a1)
{
  unint64_t v1;

  return sub_237F17178(a1, v1);
}

uint64_t sub_237F33FE4()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F17178(v0, v1);
}

uint64_t sub_237F33FF0(uint64_t a1)
{
  unint64_t v1;

  return sub_237F17178(a1, v1);
}

uint64_t sub_237F33FF8()
{
  unint64_t v0;
  uint64_t v1;

  return sub_237F17134(v1, v0);
}

uint64_t sub_237F34004()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F17134(v0, v1);
}

uint64_t sub_237F34010(uint64_t a1)
{
  unint64_t v1;

  return sub_237F17134(a1, v1);
}

void sub_237F34018(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  sub_237F32A9C(a1, a2, v3, v2);
}

uint64_t sub_237F34028()
{
  unint64_t v0;
  uint64_t v1;

  return sub_237F17178(v1, v0);
}

uint64_t sub_237F34034()
{
  unint64_t v0;
  uint64_t v1;

  return sub_237F17134(v1, v0);
}

void sub_237F34040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_237F32A9C(a1, a2, a3, a4);
}

void sub_237F34048(uint64_t a1@<X1>, char a2@<W8>)
{
  char v2;
  char v3;
  uint64_t v4;

  *(_BYTE *)(v4 - 115) = v3;
  *(_BYTE *)(v4 - 114) = a2;
  *(_BYTE *)(v4 - 113) = v2;
  *(_WORD *)(v4 - 112) = a1;
  *(_BYTE *)(v4 - 110) = BYTE2(a1);
  *(_BYTE *)(v4 - 109) = BYTE3(a1);
  *(_BYTE *)(v4 - 108) = BYTE4(a1);
  *(_BYTE *)(v4 - 107) = BYTE5(a1);
}

uint64_t sub_237F3408C()
{
  unint64_t v0;
  uint64_t v1;

  return sub_237F17178(v1, v0);
}

uint64_t sub_237F34098()
{
  uint64_t v0;
  uint64_t v1;

  return sub_237F17178(v0, *(_QWORD *)(v1 - 176));
}

uint64_t sub_237F340A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t sub_237F340B4()
{
  uint64_t v0;

  return v0 - 120;
}

uint64_t sub_237F340C4()
{
  uint64_t v0;

  return sub_237F17134(*(_QWORD *)(v0 - 176), *(_QWORD *)(v0 - 160));
}

uint64_t sub_237F340D4()
{
  return swift_release();
}

uint64_t sub_237F340DC()
{
  return swift_retain();
}

uint64_t sub_237F340E4()
{
  return String.hash(into:)();
}

uint64_t sub_237F340F4(uint64_t a1)
{
  unint64_t v1;

  return sub_237F17178(a1, v1);
}

void sub_237F340FC(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = v3 + a1;
  if (v3)
    v5 = v4;
  else
    v5 = 0;
  sub_237F32A9C(v3, v5, v2, v1);
}

void sub_237F34120()
{
  uint64_t v0;

  Hasher._combine(_:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_237F34144(uint64_t a1)
{
  unint64_t v1;

  return sub_237F17134(a1, v1);
}

uint64_t sub_237F3414C()
{
  uint64_t v0;

  return sub_237F17178(*(_QWORD *)(v0 - 184), *(_QWORD *)(v0 - 192));
}

void sub_237F34154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_237F32A9C(a1, a2, a3, a4);
}

uint64_t sub_237F3415C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F34180()
{
  return String.hash(into:)();
}

uint64_t sub_237F34190()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_237F341B0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F341D0()
{
  return swift_release();
}

uint64_t sub_237F341D8()
{
  return swift_retain();
}

void sub_237F341F0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = *(_QWORD *)(v0 + 72);
}

uint64_t sub_237F3420C(uint64_t a1)
{
  unint64_t v1;

  return sub_237F17134(a1, v1);
}

uint64_t sub_237F34214@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_237F34220()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_237F34234()
{
  uint64_t v0;
  uint64_t v1;

  return sub_237F17178(v0, *(_QWORD *)(v1 - 160));
}

uint64_t sub_237F34240(uint64_t a1)
{
  uint64_t v1;

  return sub_237F17134(a1, *(_QWORD *)(v1 - 152));
}

void sub_237F34264()
{
  JUMPOUT(0x23B8279B4);
}

uint64_t sub_237F34270()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_237F34284()
{
  return dispatch thunk of Hashable.hash(into:)();
}

void sub_237F34298(uint64_t a1, uint64_t a2)
{
  Hasher._combine(_:)(*(_QWORD *)(a2 + 16));
}

uint64_t sub_237F342AC()
{
  return type metadata accessor for Credential(0);
}

uint64_t sub_237F342B4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_237F342BC()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_237F342C4()
{
  return swift_bridgeObjectRelease();
}

void sub_237F342CC(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_237F17360(a1, v1);
}

uint64_t sub_237F342D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;

  return sub_237F32CB8(a1, a2, a3, v4, v3);
}

void sub_237F342E4(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_237F17360(a1, v1);
}

uint64_t sub_237F342EC()
{
  uint64_t v0;

  return v0 - 120;
}

void sub_237F342FC(char a1@<W8>)
{
  char v1;
  char v2;
  uint64_t v3;

  *(_BYTE *)(v3 - 109) = v1;
  *(_BYTE *)(v3 - 108) = v2;
  *(_BYTE *)(v3 - 107) = a1;
}

void sub_237F34314(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_237F17360(a1, v1);
}

void sub_237F3431C(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_237F17320(a1, a2, v2);
}

uint64_t sub_237F34324()
{
  return Data.hash(into:)();
}

uint64_t sub_237F34334()
{
  return Data.hash(into:)();
}

uint64_t sub_237F34344()
{
  return Data.hash(into:)();
}

uint64_t sub_237F34354(uint64_t a1, unint64_t a2)
{
  return sub_237F17134(a1, a2);
}

void sub_237F3435C()
{
  Hasher._combine(_:)(0);
}

uint64_t sub_237F34364()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F17134(v0, v1);
}

uint64_t sub_237F34370()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F17178(v0, v1);
}

void sub_237F34390(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_237F17360(a1, v1);
}

void sub_237F34398(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_237F17320(a1, a2, v2);
}

uint64_t sub_237F343A0(uint64_t a1, uint64_t a2, size_t a3)
{
  const void *v3;
  uint64_t v4;

  return memcmp((const void *)(v4 - 120), v3, a3);
}

uint64_t sub_237F343AC(uint64_t a1, uint64_t a2, size_t a3)
{
  const void *v3;
  uint64_t v4;

  return memcmp((const void *)(v4 - 120), v3, a3);
}

uint64_t sub_237F343B8()
{
  uint64_t v0;

  return sub_237F17178(*(_QWORD *)(v0 - 168), *(_QWORD *)(v0 - 152));
}

void sub_237F343C4()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 114) = 0;
  *(_QWORD *)(v0 - 120) = 0;
}

uint64_t sub_237F343D0(uint64_t a1)
{
  unint64_t v1;

  return sub_237F17134(a1, v1);
}

uint64_t sub_237F343D8(uint64_t a1)
{
  unint64_t v1;

  return sub_237F17178(a1, v1);
}

unint64_t sub_237F343E0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 72) = 1;
  return sub_237F334C8();
}

void sub_237F343EC(char a1@<W8>)
{
  char v1;
  uint64_t v2;

  *(_BYTE *)(v2 - 117) = v1;
  *(_BYTE *)(v2 - 116) = a1;
}

void sub_237F343F8()
{
  char v0;
  char v1;
  uint64_t v2;

  *(_BYTE *)(v2 - 119) = v0;
  *(_BYTE *)(v2 - 118) = v1;
}

uint64_t sub_237F34418()
{
  uint64_t v0;
  uint64_t v1;

  return sub_237F2DBE0(v1, v0);
}

uint64_t sub_237F34424()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F17134(v0, v1);
}

uint64_t sub_237F34430()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F17178(v0, v1);
}

uint64_t sub_237F3443C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_237F34444()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_237F34460@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_237F3446C(a1, type metadata accessor for CloudAssets_Asset, a2);
}

uint64_t sub_237F3446C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = *(_QWORD *)(a1 + 16);
  v7 = a2(0);
  v8 = v7;
  if (v6)
  {
    v9 = *(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80);
    sub_237F34CA4(a1 + ((v9 + 32) & ~v9), a3, a2);
    v10 = 0;
  }
  else
  {
    v10 = 1;
  }
  return _s10CloudAsset21UploadResponseMessageOwst_0(a3, v10, 1, v8);
}

uint64_t sub_237F344EC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = v1;
  sub_237F171BC(qword_2568A9620);
  v2[4] = sub_237F34CEC();
  sub_237F34D7C();
  return sub_237F34CD8();
}

uint64_t sub_237F34530()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = *(_QWORD *)(*(_QWORD *)(v0 + 24) + 112);
  return sub_237F34CE4();
}

uint64_t sub_237F34548()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 48) = *(_QWORD *)(*(_QWORD *)(v0 + 40) + 112);
  swift_bridgeObjectRetain();
  sub_237F34D7C();
  return sub_237F34CD8();
}

uint64_t sub_237F34584()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 32);
  sub_237F3446C(*(_QWORD *)(v0 + 48), (uint64_t (*)(_QWORD))type metadata accessor for AssetSkeleton, v1);
  swift_bridgeObjectRelease();
  v2 = type metadata accessor for AssetSkeleton();
  result = _s10CloudAsset21UploadResponseMessageOwet_0(v1, 1, v2);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_237F34B04(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 16), (uint64_t (*)(_QWORD))type metadata accessor for AssetSkeleton);
    swift_task_dealloc();
    return sub_237F34D3C(*(uint64_t (**)(void))(v0 + 8));
  }
  return result;
}

uint64_t sub_237F3460C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return sub_237F34CE4();
}

uint64_t sub_237F34620()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 32) = *(_QWORD *)(*(_QWORD *)(v0 + 24) + 112);
  return sub_237F34CE4();
}

uint64_t sub_237F34638()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 32) + OBJC_IVAR____TtC10CloudAsset23AssetsUploadCoordinator__signals;
  v3 = sub_237F171BC(&qword_2568A91B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(v1, v2, v3);
  return sub_237F34D3C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F34690(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[4] = a1;
  v2[5] = v1;
  v2[6] = sub_237F171BC(&qword_2568A91F0);
  v2[7] = sub_237F34CEC();
  sub_237F171BC(&qword_2568A9638);
  v2[8] = sub_237F34CEC();
  v3 = sub_237F171BC(&qword_2568A9640);
  v2[9] = v3;
  v2[10] = *(_QWORD *)(v3 - 8);
  v2[11] = sub_237F34CEC();
  v4 = sub_237F171BC(&qword_2568A91C0);
  v2[12] = v4;
  v2[13] = *(_QWORD *)(v4 - 8);
  v2[14] = sub_237F34CEC();
  sub_237F34D7C();
  return sub_237F34CD8();
}

uint64_t sub_237F34730()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 120) = *(_QWORD *)(*(_QWORD *)(v0 + 40) + 112);
  return sub_237F34CE4();
}

uint64_t sub_237F34748()
{
  _QWORD *v0;

  (*(void (**)(_QWORD, uint64_t, _QWORD))(v0[13] + 16))(v0[14], v0[15] + OBJC_IVAR____TtC10CloudAsset23AssetsUploadCoordinator__results, v0[12]);
  sub_237F34D7C();
  return sub_237F34CD8();
}

uint64_t sub_237F34790()
{
  uint64_t v0;
  _QWORD *v1;

  MEMORY[0x23B827DB0](*(_QWORD *)(v0 + 96));
  sub_237F34A60();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v1;
  *v1 = v0;
  v1[1] = sub_237F34814;
  return _sScs8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF();
}

uint64_t sub_237F34814()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_237F34878()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int EnumCaseMultiPayload;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  v1 = v0[8];
  if (_s10CloudAsset21UploadResponseMessageOwet_0(v1, 1, v0[6]) == 1)
  {
    v3 = v0[13];
    v2 = v0[14];
    v4 = v0[12];
    sub_237F34D88(v0[11]);
    sub_237F19568();
    swift_allocError();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  }
  else
  {
    sub_237F34ABC(v1, v0[7]);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v7 = v0[13];
    v6 = v0[14];
    v8 = v0[12];
    if (EnumCaseMultiPayload != 1)
    {
      sub_237F34B04(v0[7], v0[4], type metadata accessor for Asset);
      sub_237F34D6C();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
      sub_237F34D9C();
      sub_237F34D94();
      swift_task_dealloc();
      swift_task_dealloc();
      v9 = (uint64_t (*)(void))v0[1];
      return v9();
    }
    v0[3] = *(_QWORD *)v0[7];
    sub_237F171BC(&qword_2568A91E0);
    swift_willThrowTypedImpl();
    sub_237F34D6C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }
  sub_237F34D5C();
  sub_237F34D9C();
  swift_task_dealloc();
  sub_237F34D94();
  v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_237F349FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 96);
  sub_237F34D88(*(_QWORD *)(v0 + 88));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_237F34D5C();
  sub_237F34D9C();
  swift_task_dealloc();
  sub_237F34D94();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_237F34A60()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568A9648;
  if (!qword_2568A9648)
  {
    v1 = type metadata accessor for AssetUploadCoordinator();
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for AssetUploadCoordinator, v1);
    atomic_store(result, (unint64_t *)&qword_2568A9648);
  }
  return result;
}

uint64_t type metadata accessor for AssetUploadCoordinator()
{
  return objc_opt_self();
}

uint64_t sub_237F34ABC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237F171BC(&qword_2568A91F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237F34B04(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  v4 = sub_237F1BC68(a1, a2, a3);
  sub_237F22430(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32));
  return v3;
}

uint64_t AssetUploadCoordinator.deinit()
{
  uint64_t v0;

  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t AssetUploadCoordinator.__deallocating_deinit()
{
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t AssetUploadCoordinator.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F34B88()
{
  return AssetUploadCoordinator.unownedExecutor.getter();
}

uint64_t method lookup function for AssetUploadCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AssetUploadCoordinator.assetSkeleton.getter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)sub_237F34D08();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = sub_237F34D48(v1);
  return sub_237F34CFC(v2, v3);
}

uint64_t sub_237F34BF0()
{
  uint64_t v0;

  sub_237F34D1C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t dispatch thunk of AssetUploadCoordinator.signals.getter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)sub_237F34D08();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = sub_237F34D48(v1);
  return sub_237F34CFC(v2, v3);
}

uint64_t dispatch thunk of AssetUploadCoordinator.result()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)sub_237F34D08();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = sub_237F34D48(v1);
  return sub_237F34CFC(v2, v3);
}

uint64_t sub_237F34CA4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  v4 = sub_237F1BC68(a1, a2, a3);
  sub_237F22430(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
  return v3;
}

uint64_t sub_237F34CD8()
{
  return swift_task_switch();
}

uint64_t sub_237F34CE4()
{
  return swift_task_switch();
}

uint64_t sub_237F34CEC()
{
  return swift_task_alloc();
}

uint64_t sub_237F34CFC(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_237F34D08()
{
  return swift_task_alloc();
}

uint64_t sub_237F34D1C()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t sub_237F34D3C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_237F34D48(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t sub_237F34D5C()
{
  return swift_task_dealloc();
}

uint64_t sub_237F34D6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_237F34D88(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 + 80) + 8))(a1, *(_QWORD *)(v1 + 72));
}

uint64_t sub_237F34D94()
{
  return swift_task_dealloc();
}

uint64_t sub_237F34D9C()
{
  return swift_task_dealloc();
}

void SimultaneousTransferError.hash(into:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  Hasher._combine(_:)(0);
  sub_237F32F78(a1, v3);
}

uint64_t static SimultaneousTransferError.== infix(_:_:)(_QWORD **a1, _QWORD **a2)
{
  return sub_237F2DB1C(*a1, *a2);
}

uint64_t sub_237F34DEC(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x746163696C707061 && a2 == 0xEE007344496E6F69)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_237F34E94()
{
  return 0x746163696C707061;
}

uint64_t sub_237F34EB8(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000013 && a2 == 0x8000000237F64BA0)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_237F34F3C()
{
  return 0xD000000000000013;
}

uint64_t sub_237F34F5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F34DEC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_237F34F84()
{
  sub_237F355C4();
  return CodingKey.description.getter();
}

uint64_t sub_237F34FAC()
{
  sub_237F355C4();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F34FD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F34EB8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_237F35000()
{
  sub_237F35588();
  return CodingKey.description.getter();
}

uint64_t sub_237F35028()
{
  sub_237F35588();
  return CodingKey.debugDescription.getter();
}

void SimultaneousTransferError.encode(to:)(_QWORD *a1)
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

  v2 = sub_237F171BC(&qword_2568A9668);
  v11 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  sub_237F1DD54();
  v5 = v4 - v3;
  v6 = sub_237F171BC(&qword_2568A9670);
  v10 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  sub_237F1DD54();
  v9 = v8 - v7;
  sub_237F171FC(a1, a1[3]);
  sub_237F35588();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  sub_237F355C4();
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  sub_237F171BC(&qword_2568A9688);
  sub_237F35600(&qword_2568A9690, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v5, v2);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v6);
  sub_237F1B978();
}

void SimultaneousTransferError.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v2[72];

  v1 = *v0;
  sub_237F1BA84();
  sub_237F1BD6C();
  sub_237F32F78((uint64_t)v2, v1);
  sub_237F1BBC8();
  sub_237F1BBBC();
}

void SimultaneousTransferError.init(from:)(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
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
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;

  v21 = sub_237F171BC(&qword_2568A9698);
  MEMORY[0x24BDAC7A8](v21);
  sub_237F1DD54();
  v3 = sub_237F171BC(&qword_2568A96A0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  sub_237F1DD54();
  v7 = v6 - v5;
  sub_237F171FC(a1, a1[3]);
  sub_237F35588();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v22)
    goto LABEL_6;
  v23 = a1;
  v8 = KeyedDecodingContainer.allKeys.getter();
  v9 = *(_QWORD *)(v8 + 16);
  if (!v9
    || (sub_237F33F24(1, v9, v8, v8 + 32, 0, (2 * v9) | 1),
        v11 = v10,
        v13 = v12,
        swift_bridgeObjectRelease(),
        v11 != v13 >> 1))
  {
    v14 = type metadata accessor for DecodingError();
    swift_allocError();
    v16 = v15;
    sub_237F171BC(&qword_2568A95B0);
    *v16 = &type metadata for SimultaneousTransferError;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x24BEE26D0], v14);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
    a1 = v23;
LABEL_6:
    v19 = (uint64_t)a1;
    goto LABEL_7;
  }
  sub_237F355C4();
  KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  sub_237F171BC(&qword_2568A9688);
  sub_237F35600(&qword_2568A96A8, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  sub_237F35A48();
  swift_unknownObjectRelease();
  v17 = sub_237F35A5C();
  v18(v17);
  *a2 = v24;
  v19 = (uint64_t)v23;
LABEL_7:
  sub_237F172A0(v19);
  sub_237F1B978();
}

Swift::Int sub_237F35500()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  sub_237F32F78((uint64_t)v3, v1);
  return Hasher._finalize()();
}

void sub_237F3554C(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  SimultaneousTransferError.init(from:)(a1, a2);
}

void sub_237F35560(_QWORD *a1)
{
  SimultaneousTransferError.encode(to:)(a1);
}

unint64_t sub_237F35588()
{
  unint64_t result;

  result = qword_2568A9678;
  if (!qword_2568A9678)
  {
    result = MEMORY[0x23B82832C](&unk_237F5F390, &type metadata for SimultaneousTransferError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9678);
  }
  return result;
}

unint64_t sub_237F355C4()
{
  unint64_t result;

  result = qword_2568A9680;
  if (!qword_2568A9680)
  {
    result = MEMORY[0x23B82832C](&unk_237F5F340, &type metadata for SimultaneousTransferError.ApplicationsBlockedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9680);
  }
  return result;
}

uint64_t sub_237F35600(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = sub_237F1725C(&qword_2568A9688);
    v8 = a2;
    result = MEMORY[0x23B82832C](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_237F35664()
{
  unint64_t result;

  result = qword_2568A96B0;
  if (!qword_2568A96B0)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for SimultaneousTransferError, &type metadata for SimultaneousTransferError);
    atomic_store(result, (unint64_t *)&qword_2568A96B0);
  }
  return result;
}

unint64_t sub_237F356A4()
{
  unint64_t result;

  result = qword_2568A96B8;
  if (!qword_2568A96B8)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for SimultaneousTransferError, &type metadata for SimultaneousTransferError);
    atomic_store(result, (unint64_t *)&qword_2568A96B8);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for SimultaneousTransferError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SimultaneousTransferError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for SimultaneousTransferError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *initializeWithTake for SimultaneousTransferError(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for SimultaneousTransferError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SimultaneousTransferError(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 8))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SimultaneousTransferError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 8) = 1;
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
    *(_BYTE *)(result + 8) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SimultaneousTransferError()
{
  return &type metadata for SimultaneousTransferError;
}

ValueMetadata *type metadata accessor for SimultaneousTransferError.CodingKeys()
{
  return &type metadata for SimultaneousTransferError.CodingKeys;
}

uint64_t _s10CloudAsset25SimultaneousTransferErrorO10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_237F35868 + 4 * byte_237F5F030[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_237F35888 + 4 * byte_237F5F035[v4]))();
}

_BYTE *sub_237F35868(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_237F35888(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F35890(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F35898(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F358A0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F358A8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SimultaneousTransferError.ApplicationsBlockedCodingKeys()
{
  return &type metadata for SimultaneousTransferError.ApplicationsBlockedCodingKeys;
}

unint64_t sub_237F358C8()
{
  unint64_t result;

  result = qword_2568A96C0;
  if (!qword_2568A96C0)
  {
    result = MEMORY[0x23B82832C](&unk_237F5F260, &type metadata for SimultaneousTransferError.ApplicationsBlockedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A96C0);
  }
  return result;
}

unint64_t sub_237F35908()
{
  unint64_t result;

  result = qword_2568A96C8;
  if (!qword_2568A96C8)
  {
    result = MEMORY[0x23B82832C](&unk_237F5F318, &type metadata for SimultaneousTransferError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A96C8);
  }
  return result;
}

unint64_t sub_237F35948()
{
  unint64_t result;

  result = qword_2568A96D0;
  if (!qword_2568A96D0)
  {
    result = MEMORY[0x23B82832C](&unk_237F5F1D0, &type metadata for SimultaneousTransferError.ApplicationsBlockedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A96D0);
  }
  return result;
}

unint64_t sub_237F35988()
{
  unint64_t result;

  result = qword_2568A96D8;
  if (!qword_2568A96D8)
  {
    result = MEMORY[0x23B82832C](&unk_237F5F1F8, &type metadata for SimultaneousTransferError.ApplicationsBlockedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A96D8);
  }
  return result;
}

unint64_t sub_237F359C8()
{
  unint64_t result;

  result = qword_2568A96E0;
  if (!qword_2568A96E0)
  {
    result = MEMORY[0x23B82832C](&unk_237F5F288, &type metadata for SimultaneousTransferError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A96E0);
  }
  return result;
}

unint64_t sub_237F35A08()
{
  unint64_t result;

  result = qword_2568A96E8[0];
  if (!qword_2568A96E8[0])
  {
    result = MEMORY[0x23B82832C](&unk_237F5F2B0, &type metadata for SimultaneousTransferError.CodingKeys);
    atomic_store(result, qword_2568A96E8);
  }
  return result;
}

uint64_t sub_237F35A48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 120) + 8))(v0, v1);
}

uint64_t sub_237F35A5C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F35A70(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x73736563637573 && a2 == 0xE700000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6572756C696166 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_237F35B64(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6572756C696166;
  else
    return 0x73736563637573;
}

uint64_t sub_237F35B94()
{
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_237F35BB0()
{
  return 0;
}

uint64_t sub_237F35BBC(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

Swift::Int sub_237F35C28()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_237F35C68()
{
  return 12383;
}

BOOL sub_237F35C74(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_237F1E1F4(*a1, *a2);
}

Swift::Int sub_237F35C8C()
{
  char *v0;

  return sub_237F1E2F4(*v0);
}

void sub_237F35CA0(uint64_t a1)
{
  char *v1;

  sub_237F1E204(a1, *v1);
}

Swift::Int sub_237F35CB4()
{
  char *v0;
  _BYTE v2[72];

  Hasher.init(_seed:)();
  sub_237F1E204((uint64_t)v2, *v0);
  return Hasher._finalize()();
}

uint64_t sub_237F35CFC()
{
  char *v0;

  return sub_237F35B64(*v0);
}

uint64_t sub_237F35D10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F35A70(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237F35D40()
{
  return sub_237F168F0();
}

uint64_t sub_237F35D68@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_237F1E2EC();
  *a1 = result;
  return result;
}

uint64_t sub_237F35D98(uint64_t a1)
{
  MEMORY[0x23B82832C](&unk_237F5F748, a1);
  return CodingKey.description.getter();
}

uint64_t sub_237F35DCC(uint64_t a1)
{
  MEMORY[0x23B82832C](&unk_237F5F748, a1);
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F35E00()
{
  return sub_237F35BB0();
}

uint64_t sub_237F35E10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_237F35F28(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))sub_237F35B94, a4);
}

uint64_t sub_237F35E1C(_QWORD *a1, uint64_t a2)
{
  return sub_237F35F6C(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD))sub_237F168F0);
}

uint64_t sub_237F35E28@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, _BYTE *a3@<X8>)
{
  return sub_237F35FA0(a1, a2, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD))sub_237F1854C, a3);
}

uint64_t sub_237F35E34(uint64_t a1)
{
  MEMORY[0x23B82832C](&unk_237F5F7E8, a1);
  return CodingKey.description.getter();
}

uint64_t sub_237F35E68(uint64_t a1)
{
  MEMORY[0x23B82832C](&unk_237F5F7E8, a1);
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F35E9C()
{
  return sub_237F1854C();
}

Swift::Int sub_237F35EA8()
{
  return sub_237F35C28();
}

void sub_237F35EB8()
{
  sub_237F1BD84();
}

Swift::Int sub_237F35EC8()
{
  Hasher.init(_seed:)();
  sub_237F1BD84();
  return Hasher._finalize()();
}

uint64_t sub_237F35F0C()
{
  return sub_237F35C68();
}

uint64_t sub_237F35F1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_237F35F28(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))sub_237F35BBC, a4);
}

uint64_t sub_237F35F28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD)@<X4>, _BYTE *a5@<X8>)
{
  uint64_t result;

  result = a4(a1, a2, a3[2], a3[3], a3[4]);
  *a5 = result & 1;
  return result;
}

uint64_t sub_237F35F60(_QWORD *a1, uint64_t a2)
{
  return sub_237F35F6C(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD))sub_237F37604);
}

uint64_t sub_237F35F6C(_QWORD *a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD, _QWORD))
{
  return a3(a1[2], a1[3], a1[4]);
}

uint64_t sub_237F35F94@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, _BYTE *a3@<X8>)
{
  return sub_237F35FA0(a1, a2, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD))sub_237F321A4, a3);
}

uint64_t sub_237F35FA0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t (*a3)(uint64_t, _QWORD, _QWORD, _QWORD)@<X3>, _BYTE *a4@<X8>)
{
  uint64_t result;

  result = a3(a1, a2[2], a2[3], a2[4]);
  *a4 = result & 1;
  return result;
}

uint64_t sub_237F35FD8(uint64_t a1)
{
  MEMORY[0x23B82832C](&unk_237F5F798, a1);
  return CodingKey.description.getter();
}

uint64_t sub_237F3600C(uint64_t a1)
{
  MEMORY[0x23B82832C](&unk_237F5F798, a1);
  return CodingKey.debugDescription.getter();
}

void XPCResult.encode(to:)(_QWORD *a1, _QWORD *a2)
{
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[3];
  char *v43;
  char *v44;
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
  char *v58;
  char v59;
  char v60;

  v5 = a2[2];
  v4 = a2[3];
  v6 = a2[4];
  v7 = sub_237F37688();
  v11 = type metadata accessor for XPCResult.FailureCodingKeys(v7, v8, v9, v10);
  MEMORY[0x23B82832C](&unk_237F5F7E8, v11);
  sub_237F376AC();
  v51 = v12;
  v52 = v11;
  v13 = type metadata accessor for KeyedEncodingContainer();
  v48 = *(_QWORD *)(v13 - 8);
  v49 = v13;
  sub_237F37608();
  MEMORY[0x24BDAC7A8](v14);
  v44 = (char *)v42 - v15;
  v16 = sub_237F37688();
  v20 = type metadata accessor for XPCResult.SuccessCodingKeys(v16, v17, v18, v19);
  MEMORY[0x23B82832C](&unk_237F5F798, v20);
  sub_237F376AC();
  v42[1] = v21;
  v42[2] = v20;
  v50 = type metadata accessor for KeyedEncodingContainer();
  v46 = *(_QWORD *)(v50 - 8);
  sub_237F37608();
  MEMORY[0x24BDAC7A8](v22);
  v43 = (char *)v42 - v23;
  v47 = *(_QWORD *)(v5 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v24);
  sub_237F180DC();
  v45 = v25;
  v54 = *(a2 - 1);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)v42 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = v6;
  v29 = type metadata accessor for XPCResult.CodingKeys(255, v5, v4, v6);
  MEMORY[0x23B82832C](&unk_237F5F748, v29);
  v57 = type metadata accessor for KeyedEncodingContainer();
  v55 = *(_QWORD *)(v57 - 8);
  sub_237F37608();
  MEMORY[0x24BDAC7A8](v30);
  v32 = (char *)v42 - v31;
  sub_237F171FC(a1, a1[3]);
  v58 = v32;
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  (*(void (**)(char *, uint64_t, _QWORD *))(v54 + 16))(v28, v56, a2);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v28, 1, v5) == 1)
  {
    v60 = 1;
    v33 = v44;
    v34 = v57;
    v35 = v58;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v33, v49);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v35, v34);
  }
  else
  {
    v36 = v55;
    v37 = v47;
    v38 = v45;
    (*(void (**)(uint64_t, char *, uint64_t))(v47 + 32))(v45, v28, v5);
    v59 = 0;
    v39 = v43;
    v40 = v57;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    v41 = v50;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v39, v41);
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v38, v5);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v58, v40);
  }
  sub_237F1B978();
}

uint64_t type metadata accessor for XPCResult.FailureCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_237F375D8(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for XPCResult.FailureCodingKeys);
}

uint64_t type metadata accessor for XPCResult.SuccessCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_237F375D8(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for XPCResult.SuccessCodingKeys);
}

uint64_t type metadata accessor for XPCResult.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_237F375D8(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for XPCResult.CodingKeys);
}

void XPCResult.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for XPCResult.FailureCodingKeys(255, a2, a3, a4);
  sub_237F3769C();
}

void sub_237F363BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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

  sub_237F376AC();
  *(_QWORD *)(v10 - 208) = v11;
  *(_QWORD *)(v10 - 200) = v9;
  v12 = type metadata accessor for KeyedDecodingContainer();
  *(_QWORD *)(v10 - 288) = v12;
  *(_QWORD *)(v10 - 296) = *(_QWORD *)(v12 - 8);
  sub_237F37608();
  MEMORY[0x24BDAC7A8](v13);
  *(_QWORD *)(v10 - 216) = (char *)&a9 - v14;
  v15 = sub_237F3762C();
  type metadata accessor for XPCResult.SuccessCodingKeys(v15, v16, v17, v18);
  sub_237F3769C();
}

void sub_237F36414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;

  sub_237F376AC();
  *(_QWORD *)(v14 - 240) = v15;
  *(_QWORD *)(v14 - 232) = v9;
  v16 = type metadata accessor for KeyedDecodingContainer();
  *(_QWORD *)(v14 - 304) = v16;
  *(_QWORD *)(v14 - 272) = *(_QWORD *)(v16 - 8);
  sub_237F37608();
  MEMORY[0x24BDAC7A8](v17);
  *(_QWORD *)(v14 - 224) = (char *)&a9 - v18;
  v19 = sub_237F3762C();
  v23 = type metadata accessor for XPCResult.CodingKeys(v19, v20, v21, v22);
  MEMORY[0x23B82832C](&unk_237F5F748, v23);
  v24 = type metadata accessor for KeyedDecodingContainer();
  *(_QWORD *)(v14 - 184) = *(_QWORD *)(v24 - 8);
  *(_QWORD *)(v14 - 176) = v24;
  sub_237F37608();
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&a9 - v26;
  *(_QWORD *)(v14 - 248) = v11;
  *(_QWORD *)(v14 - 280) = v12;
  v28 = type metadata accessor for XPCResult(0, v11, v12, v10);
  *(_QWORD *)(v14 - 192) = v28;
  *(_QWORD *)(v14 - 264) = *(_QWORD *)(v28 - 8);
  sub_237F1B990();
  v30 = MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&a9 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&a9 - v33;
  sub_237F171FC(v13, v13[3]);
  *(_QWORD *)(v14 - 168) = v27;
  v35 = *(_QWORD *)(v14 - 72);
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v35)
  {
    *(_QWORD *)(v14 - 320) = v32;
    *(_QWORD *)(v14 - 312) = v34;
    *(_QWORD *)(v14 - 72) = v13;
    *(_QWORD *)(v14 - 160) = KeyedDecodingContainer.allKeys.getter();
    type metadata accessor for Array();
    sub_237F3769C();
  }
  sub_237F172A0((uint64_t)v13);
  sub_237F1B978();
}

uint64_t type metadata accessor for XPCResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_237F375D8(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for XPCResult);
}

void sub_237F368A8(uint64_t a1, uint64_t *a2)
{
  XPCResult.init(from:)(a1, a2[2], a2[3], a2[4]);
}

void sub_237F368C8(_QWORD *a1, _QWORD *a2)
{
  XPCResult.encode(to:)(a1, a2);
}

uint64_t static XPCResult<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  uint64_t TupleTypeMetadata2;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  char v24;
  char v25;
  uint64_t v26;
  char *v27;
  void (*v28)(char *, uint64_t);
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32;

  v32 = a2;
  v8 = *(_QWORD *)(a3 - 8);
  v30[1] = a6;
  v31 = v8;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v9);
  sub_237F180DC();
  v30[0] = v10;
  v14 = type metadata accessor for XPCResult(0, v11, v12, v13);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v30 - v16;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v19 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v20 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v22 = (char *)v30 - v21;
  v23 = (char *)v30 + *(int *)(v20 + 48) - v21;
  sub_237F37674((uint64_t)v30 - v21, a1);
  sub_237F37674((uint64_t)v23, v32);
  sub_237F37644((uint64_t)v22);
  if (v25)
  {
    v24 = 1;
    sub_237F37644((uint64_t)v23);
    if (v25)
      goto LABEL_10;
    goto LABEL_9;
  }
  sub_237F37674((uint64_t)v17, (uint64_t)v22);
  sub_237F37644((uint64_t)v23);
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v31 + 8))(v17, a3);
LABEL_9:
    v24 = 0;
    v15 = v19;
    v14 = TupleTypeMetadata2;
    goto LABEL_10;
  }
  v26 = v31;
  v27 = (char *)v30[0];
  (*(void (**)(_QWORD, char *, uint64_t))(v31 + 32))(v30[0], v23, a3);
  v24 = dispatch thunk of static Equatable.== infix(_:_:)();
  v28 = *(void (**)(char *, uint64_t))(v26 + 8);
  v28(v27, a3);
  v28(v17, a3);
LABEL_10:
  (*(void (**)(char *, uint64_t))(v15 + 8))(v22, v14);
  return v24 & 1;
}

uint64_t sub_237F36AB8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  return static XPCResult<>.== infix(_:_:)(a1, a2, a3[2], a3[3], a3[4], *(_QWORD *)(a4 - 8));
}

void XPCResult<>.hash(into:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a2 + 16);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v9 + 16))(v8, v10);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v8, 1, v2) == 1)
  {
    Hasher._combine(_:)(1uLL);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v2);
    Hasher._combine(_:)(0);
    dispatch thunk of Hashable.hash(into:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
}

Swift::Int XPCResult<>.hashValue.getter(uint64_t a1)
{
  _BYTE v3[72];

  Hasher.init(_seed:)();
  XPCResult<>.hash(into:)((uint64_t)v3, a1);
  return Hasher._finalize()();
}

Swift::Int sub_237F36C2C(uint64_t a1)
{
  return XPCResult<>.hashValue.getter(a1);
}

void sub_237F36C34(uint64_t a1, uint64_t a2)
{
  XPCResult<>.hash(into:)(a1, a2);
}

Swift::Int sub_237F36C3C(uint64_t a1, uint64_t a2)
{
  _BYTE v4[72];

  Hasher.init(_seed:)();
  XPCResult<>.hash(into:)((uint64_t)v4, a2);
  return Hasher._finalize()();
}

uint64_t sub_237F36C8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a3 - 8);
  return MEMORY[0x23B82832C](&protocol conformance descriptor for <> XPCResult<A>, a1, &v4);
}

uint64_t sub_237F36CC0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_237F36CC8()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_237F36D20(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (*(_DWORD *)(v6 + 84))
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if (*(_DWORD *)(v6 + 80) > 7u || (v7 & 0x100000) != 0 || v8 > 0x18)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v7 + 16) & ~(unint64_t)v7));
    swift_retain();
  }
  else if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)a2, 1, *(_QWORD *)(a3 + 16)))
  {
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_237F36DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *(_QWORD *)(a2 + 16);
  result = _s10CloudAsset21UploadResponseMessageOwet_0(a1, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return result;
}

void *sub_237F36E3C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  size_t v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)a2, 1, v5);
  v7 = *(_QWORD *)(v5 - 8);
  if (v6)
  {
    v8 = *(_DWORD *)(v7 + 84);
    v9 = *(_QWORD *)(v7 + 64);
    if (v8)
      v10 = v9;
    else
      v10 = v9 + 1;
    memcpy(a1, a2, v10);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v5);
    _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

void *sub_237F36ECC(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  size_t v9;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)a1, 1, v5);
  v7 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)a2, 1, v5);
  v8 = *(_QWORD *)(v5 - 8);
  if (v6)
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(a1, a2, v5);
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 24))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v8 + 84))
    v9 = *(_QWORD *)(v8 + 64);
  else
    v9 = *(_QWORD *)(v8 + 64) + 1;
  memcpy(a1, a2, v9);
  return a1;
}

void *sub_237F36FA4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  size_t v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)a2, 1, v5);
  v7 = *(_QWORD *)(v5 - 8);
  if (v6)
  {
    v8 = *(_DWORD *)(v7 + 84);
    v9 = *(_QWORD *)(v7 + 64);
    if (v8)
      v10 = v9;
    else
      v10 = v9 + 1;
    memcpy(a1, a2, v10);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v5);
    _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

void *sub_237F37034(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  size_t v9;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)a1, 1, v5);
  v7 = _s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)a2, 1, v5);
  v8 = *(_QWORD *)(v5 - 8);
  if (v6)
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a1, a2, v5);
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v8 + 84))
    v9 = *(_QWORD *)(v8 + 64);
  else
    v9 = *(_QWORD *)(v8 + 64) + 1;
  memcpy(a1, a2, v9);
  return a1;
}

uint64_t sub_237F3710C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  char v10;
  int v11;
  unsigned int v12;
  int v13;
  unsigned int v15;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = v6 - 1;
  if (!(_DWORD)v6)
    v7 = 0;
  v8 = *(_QWORD *)(v5 + 64);
  if (!(_DWORD)v6)
    ++v8;
  if (!a2)
    return 0;
  v9 = a2 - v7;
  if (a2 > v7)
  {
    v10 = 8 * v8;
    if (v8 > 3)
      goto LABEL_8;
    v12 = ((v9 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v12))
    {
      v11 = *(_DWORD *)(a1 + v8);
      if (v11)
        goto LABEL_15;
    }
    else
    {
      if (v12 <= 0xFF)
      {
        if (v12 < 2)
          goto LABEL_22;
LABEL_8:
        v11 = *(unsigned __int8 *)(a1 + v8);
        if (!*(_BYTE *)(a1 + v8))
          goto LABEL_22;
LABEL_15:
        v13 = (v11 - 1) << v10;
        if (v8 > 3)
          v13 = 0;
        if ((_DWORD)v8)
        {
          if (v8 > 3)
            LODWORD(v8) = 4;
          __asm { BR              X12 }
        }
        return v7 + v13 + 1;
      }
      v11 = *(unsigned __int16 *)(a1 + v8);
      if (*(_WORD *)(a1 + v8))
        goto LABEL_15;
    }
  }
LABEL_22:
  if (v6 < 2)
    return 0;
  v15 = _s10CloudAsset21UploadResponseMessageOwet_0(a1, v6, v4);
  if (v15 >= 2)
    return v15 - 1;
  else
    return 0;
}

void sub_237F37238(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  size_t v10;
  size_t v11;
  char v12;
  BOOL v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = v8 - 1;
  if (!v8)
    v9 = 0;
  v10 = *(_QWORD *)(v7 + 64);
  if (v8)
    v11 = v10;
  else
    v11 = v10 + 1;
  v12 = 8 * v11;
  v13 = a3 >= v9;
  v14 = a3 - v9;
  if (v14 != 0 && v13)
  {
    if (v11 <= 3)
    {
      v15 = ((v14 + ~(-1 << v12)) >> v12) + 1;
      if (HIWORD(v15))
      {
        v6 = 4u;
      }
      else if (v15 >= 0x100)
      {
        v6 = 2;
      }
      else
      {
        v6 = v15 > 1;
      }
    }
    else
    {
      v6 = 1u;
    }
  }
  if (v9 < a2)
  {
    v16 = ~v9 + a2;
    if (v11 < 4)
    {
      if ((_DWORD)v11)
      {
        v17 = v16 & ~(-1 << v12);
        bzero(a1, v11);
        if ((_DWORD)v11 == 3)
        {
          *a1 = v17;
          *((_BYTE *)a1 + 2) = BYTE2(v17);
        }
        else if ((_DWORD)v11 == 2)
        {
          *a1 = v17;
        }
        else
        {
          *(_BYTE *)a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v16;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X10 }
}

void sub_237F373CC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_237F373D4()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

uint64_t sub_237F373F8(uint64_t a1, uint64_t a2)
{
  return _s10CloudAsset21UploadResponseMessageOwet_0(a1, 1, *(_QWORD *)(a2 + 16));
}

uint64_t sub_237F37404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s10CloudAsset21UploadResponseMessageOwst_0(a1, a2, 1, *(_QWORD *)(a3 + 16));
}

uint64_t sub_237F37410(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237F3745C + 4 * byte_237F5F3F3[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_237F37490 + 4 * byte_237F5F3EE[v4]))();
}

uint64_t sub_237F37490(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F37498(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237F374A0);
  return result;
}

uint64_t sub_237F374AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237F374B4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_237F374B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F374C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F374CC(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_237F3750C + 4 * byte_237F5F3F8[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_237F3752C + 4 * byte_237F5F3FD[v4]))();
}

_BYTE *sub_237F3750C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_237F3752C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F37534(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F3753C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F37544(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F3754C(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_237F37558()
{
  JUMPOUT(0x23B82832CLL);
}

void sub_237F37568()
{
  JUMPOUT(0x23B82832CLL);
}

void sub_237F37578()
{
  JUMPOUT(0x23B82832CLL);
}

void sub_237F37588()
{
  JUMPOUT(0x23B82832CLL);
}

void sub_237F37598()
{
  JUMPOUT(0x23B82832CLL);
}

void sub_237F375A8()
{
  JUMPOUT(0x23B82832CLL);
}

void sub_237F375B8()
{
  JUMPOUT(0x23B82832CLL);
}

void sub_237F375C8()
{
  JUMPOUT(0x23B82832CLL);
}

uint64_t sub_237F375D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B8282D8](a1, v6, a5);
}

uint64_t sub_237F37618@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 256) + 8))(v2, v1);
}

uint64_t sub_237F3762C()
{
  return 255;
}

uint64_t sub_237F37644(uint64_t a1)
{
  uint64_t v1;

  return _s10CloudAsset21UploadResponseMessageOwet_0(a1, 1, v1);
}

uint64_t sub_237F37660()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F37674(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t sub_237F3767C()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_237F37688()
{
  return 255;
}

void sub_237F3769C()
{
  JUMPOUT(0x23B82832CLL);
}

uint64_t sub_237F376A4()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_237F376AC()
{
  return 0;
}

void Signal.Event.hash(into:)()
{
  uint64_t v0;
  Swift::UInt64 v1;

  if ((*(_BYTE *)(v0 + 8) & 1) != 0)
  {
    sub_237F39124();
  }
  else
  {
    v1 = *(_QWORD *)v0;
    sub_237F3435C();
    Hasher._combine(_:)(v1);
  }
  sub_237F18140();
}

uint64_t static Signal.Event.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 8) & 1) != 0)
      return sub_237F1854C();
    return 0;
  }
  if ((*(_BYTE *)(a2 + 8) & 1) != 0)
    return 0;
  return *(_QWORD *)a1 == *(_QWORD *)a2;
}

uint64_t sub_237F37728(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD00000000000001BLL && a2 == 0x8000000237F64BC0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000237F64BE0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

unint64_t sub_237F37814(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000010;
  else
    return 0xD00000000000001BLL;
}

uint64_t sub_237F37854(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x656E6961746E6F63 && a2 == 0xEE007865646E4972)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_237F378FC()
{
  return 0x656E6961746E6F63;
}

uint64_t sub_237F37924@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_237F35B94();
  *a1 = result & 1;
  return result;
}

uint64_t sub_237F3794C()
{
  sub_237F37C5C();
  return CodingKey.description.getter();
}

uint64_t sub_237F37974()
{
  sub_237F37C5C();
  return CodingKey.debugDescription.getter();
}

unint64_t sub_237F3799C()
{
  char *v0;

  return sub_237F37814(*v0);
}

uint64_t sub_237F379A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F37728(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237F379C8()
{
  sub_237F37C20();
  return CodingKey.description.getter();
}

uint64_t sub_237F379F0()
{
  sub_237F37C20();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F37A20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F37854(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_237F37A48()
{
  sub_237F37C98();
  return CodingKey.description.getter();
}

uint64_t sub_237F37A70()
{
  sub_237F37C98();
  return CodingKey.debugDescription.getter();
}

void Signal.Event.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  sub_237F1B9D4();
  v1 = v0;
  v3 = v2;
  v4 = sub_237F171BC(&qword_2568A98F0);
  v13 = *(_QWORD *)(v4 - 8);
  v14 = v4;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v5);
  sub_237F1DD54();
  v8 = v7 - v6;
  v12 = *(_QWORD *)(sub_237F171BC(&qword_2568A98F8) - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v9);
  sub_237F1DD54();
  sub_237F171BC(&qword_2568A9900);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v10);
  sub_237F390EC();
  v11 = *(_BYTE *)(v1 + 8);
  sub_237F171FC(v3, v3[3]);
  sub_237F37C20();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if ((v11 & 1) != 0)
  {
    sub_237F39104();
    sub_237F390CC();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v8, v14);
  }
  else
  {
    sub_237F37C98();
    sub_237F390CC();
    KeyedEncodingContainer.encode(_:forKey:)();
    sub_237F390A0(v12);
  }
  sub_237F390B8();
  sub_237F1B978();
}

unint64_t sub_237F37C20()
{
  unint64_t result;

  result = qword_2568A9908;
  if (!qword_2568A9908)
  {
    result = MEMORY[0x23B82832C](&unk_237F5FDB4, &type metadata for Signal.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9908);
  }
  return result;
}

unint64_t sub_237F37C5C()
{
  unint64_t result;

  result = qword_2568A9910;
  if (!qword_2568A9910)
  {
    result = MEMORY[0x23B82832C](&unk_237F5FD64, &type metadata for Signal.Event.AllUploadsFinishCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9910);
  }
  return result;
}

unint64_t sub_237F37C98()
{
  unint64_t result;

  result = qword_2568A9918;
  if (!qword_2568A9918)
  {
    result = MEMORY[0x23B82832C](&unk_237F5FD14, &type metadata for Signal.Event.StorageContainerUploadStartCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9918);
  }
  return result;
}

void Signal.Event.hashValue.getter()
{
  uint64_t v0;
  Swift::UInt64 v1;
  char v2;

  v1 = *(_QWORD *)v0;
  v2 = *(_BYTE *)(v0 + 8);
  sub_237F1BA84();
  if ((v2 & 1) != 0)
  {
    sub_237F39124();
  }
  else
  {
    sub_237F3435C();
    Hasher._combine(_:)(v1);
  }
  sub_237F1BBC8();
  sub_237F1BBBC();
}

void Signal.Event.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
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
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;

  sub_237F1B9D4();
  v3 = v2;
  v31 = v4;
  v5 = sub_237F171BC(&qword_2568A9920);
  v28 = *(_QWORD *)(v5 - 8);
  v29 = v5;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v6);
  sub_237F180DC();
  v32 = v7;
  v30 = sub_237F171BC(&qword_2568A9928);
  v8 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  sub_237F1DD54();
  v9 = sub_237F171BC(&qword_2568A9930);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  sub_237F18110();
  sub_237F171FC(v3, v3[3]);
  sub_237F37C20();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v0)
    goto LABEL_9;
  v11 = KeyedDecodingContainer.allKeys.getter();
  v12 = *(_QWORD *)(v11 + 16);
  v13 = v9;
  v27 = v3;
  if (!v12)
  {
    v19 = v1;
LABEL_8:
    v20 = type metadata accessor for DecodingError();
    swift_allocError();
    v22 = v21;
    sub_237F171BC(&qword_2568A95B0);
    *v22 = &type metadata for Signal.Event;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v22, *MEMORY[0x24BEE26D0], v20);
    swift_willThrow();
    sub_237F390B0();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v19, v13);
    v3 = v27;
LABEL_9:
    v23 = (uint64_t)v3;
    goto LABEL_10;
  }
  v14 = *(_BYTE *)(v11 + 32);
  sub_237F33F24(1, v12, v11, v11 + 32, 0, (2 * v12) | 1);
  v16 = v15;
  v18 = v17;
  swift_bridgeObjectRelease();
  if (v16 != v18 >> 1)
  {
    v19 = v1;
    v13 = v9;
    goto LABEL_8;
  }
  if ((v14 & 1) != 0)
  {
    v33 = v14;
    sub_237F39104();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v32, v29);
    sub_237F390B0();
    v24 = sub_237F39110();
    v25(v24);
    v26 = 0;
  }
  else
  {
    sub_237F37C98();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    v33 = v14;
    v26 = KeyedDecodingContainer.decode(_:forKey:)();
    sub_237F390A0(v8);
    sub_237F390B0();
    sub_237F390DC();
  }
  v23 = (uint64_t)v3;
  *(_QWORD *)v31 = v26;
  *(_BYTE *)(v31 + 8) = v33;
LABEL_10:
  sub_237F172A0(v23);
  sub_237F1B978();
}

void sub_237F380AC()
{
  sub_237F3435C();
  sub_237F18140();
}

Swift::Int sub_237F380D0()
{
  uint64_t v0;
  Swift::UInt64 v1;
  char v2;

  v1 = *(_QWORD *)v0;
  v2 = *(_BYTE *)(v0 + 8);
  Hasher.init(_seed:)();
  if ((v2 & 1) != 0)
  {
    Hasher._combine(_:)(1uLL);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v1);
  }
  return Hasher._finalize()();
}

void sub_237F38134()
{
  Signal.Event.init(from:)();
}

void sub_237F38148()
{
  Signal.Event.encode(to:)();
}

uint64_t sub_237F38160()
{
  sub_237F38A70();
  return CodingKey.description.getter();
}

uint64_t sub_237F38188()
{
  sub_237F38A70();
  return CodingKey.debugDescription.getter();
}

uint64_t Signal.events.getter()
{
  return swift_bridgeObjectRetain();
}

void Signal.events.setter(uint64_t a1)
{
  _QWORD *v1;

  swift_bridgeObjectRelease();
  *v1 = a1;
  sub_237F18140();
}

uint64_t (*Signal.events.modify())()
{
  return nullsub_1;
}

uint64_t sub_237F381EC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v5 = type metadata accessor for CloudAssets_Signal.Event(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v23 - v10;
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (v13)
  {
    v24 = a2;
    v25 = v2;
    v27 = a1;
    v29 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_237F42E28(0, v13, 0);
    v14 = *(unsigned __int8 *)(v6 + 80);
    v26 = v12;
    v15 = v12 + ((v14 + 32) & ~v14);
    v28 = *(_QWORD *)(v6 + 72);
    while (1)
    {
      sub_237F39010(v15, (uint64_t)v11);
      sub_237F39010((uint64_t)v11, (uint64_t)v9);
      if (v9[8] != 1)
        break;
      v16 = *(_QWORD *)v9;
      if (*(_QWORD *)v9)
        v17 = 0;
      else
        v17 = *((_QWORD *)v9 + 2);
      sub_237F39054((uint64_t)v9, type metadata accessor for CloudAssets_Signal.Event);
      sub_237F39054((uint64_t)v11, type metadata accessor for CloudAssets_Signal.Event);
      v18 = v29;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_237F42E28(0, *(_QWORD *)(v18 + 16) + 1, 1);
        v18 = v29;
      }
      v20 = *(_QWORD *)(v18 + 16);
      v19 = *(_QWORD *)(v18 + 24);
      if (v20 >= v19 >> 1)
      {
        sub_237F42E28((char *)(v19 > 1), v20 + 1, 1);
        v18 = v29;
      }
      *(_QWORD *)(v18 + 16) = v20 + 1;
      v21 = v18 + 16 * v20;
      *(_QWORD *)(v21 + 32) = v17;
      *(_BYTE *)(v21 + 40) = v16 != 0;
      v15 += v28;
      if (!--v13)
      {
        a1 = v27;
        a2 = v24;
        goto LABEL_15;
      }
    }
    sub_237F19568();
    swift_allocError();
    swift_willThrow();
    sub_237F39054((uint64_t)v9, type metadata accessor for CloudAssets_Signal.Event);
    sub_237F39054((uint64_t)v11, type metadata accessor for CloudAssets_Signal.Event);
    swift_release();
    sub_237F39054(v27, type metadata accessor for CloudAssets_Signal);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    v18 = MEMORY[0x24BEE4AF8];
LABEL_15:
    sub_237F39054(a1, type metadata accessor for CloudAssets_Signal);
    result = swift_bridgeObjectRelease();
    *a2 = v18;
  }
  return result;
}

void Signal.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  sub_237F1B9D4();
  a19 = v22;
  a20 = v23;
  v25 = v24;
  v30 = v26;
  type metadata accessor for BinaryDecodingOptions();
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v27);
  sub_237F180DC();
  type metadata accessor for CloudAssets_Signal(0);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v28);
  sub_237F390EC();
  v29 = sub_237F171BC(&qword_2568A9938);
  MEMORY[0x24BDAC7A8](v29);
  sub_237F1B99C();
  sub_237F171FC(v25, v25[3]);
  sub_237F38A70();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v20)
  {
    sub_237F1952C();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    BinaryDecodingOptions.init()();
    sub_237F38AAC();
    Message.init(serializedData:extensions:partial:options:)();
    sub_237F381EC(v21, &a10);
    sub_237F39090();
    *v30 = a10;
  }
  sub_237F172A0((uint64_t)v25);
  sub_237F1B978();
}

CloudAsset::Signal __swiftcall Signal.init()()
{
  _QWORD *v0;
  CloudAsset::Signal result;

  *v0 = MEMORY[0x24BEE4AF8];
  return result;
}

uint64_t sub_237F38658@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD v19[2];
  _QWORD *v20;
  uint64_t v21;

  v3 = type metadata accessor for CloudAssets_Signal.Event(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v19 - v8;
  v10 = *v1;
  type metadata accessor for CloudAssets_Signal(0);
  result = UnknownStorage.init()();
  v12 = *(_QWORD *)(v10 + 16);
  v13 = MEMORY[0x24BEE4AF8];
  if (v12)
  {
    v20 = a1;
    v21 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_237F42E44(0, v12, 0);
    v13 = v21;
    v19[1] = v10;
    v14 = (_BYTE *)(v10 + 40);
    do
    {
      v15 = *((_QWORD *)v14 - 1);
      v16 = *v14;
      *((_QWORD *)v7 + 2) = 0;
      UnknownStorage.init()();
      if ((v16 & 1) != 0)
      {
        *(_QWORD *)v7 = 1;
        v7[8] = 1;
      }
      else
      {
        *(_QWORD *)v7 = 0;
        v7[8] = 1;
        *((_QWORD *)v7 + 2) = v15;
      }
      sub_237F38FCC((uint64_t)v7, (uint64_t)v9);
      v21 = v13;
      v18 = *(_QWORD *)(v13 + 16);
      v17 = *(_QWORD *)(v13 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_237F42E44(v17 > 1, v18 + 1, 1);
        v13 = v21;
      }
      *(_QWORD *)(v13 + 16) = v18 + 1;
      sub_237F38FCC((uint64_t)v9, v13+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(_QWORD *)(v4 + 72) * v18);
      v14 += 16;
      --v12;
    }
    while (v12);
    result = swift_bridgeObjectRelease();
    a1 = v20;
  }
  *a1 = v13;
  return result;
}

void Signal.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  sub_237F1B9D4();
  v4 = v3;
  type metadata accessor for CloudAssets_Signal(0);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v5);
  sub_237F1B99C();
  v6 = sub_237F171BC(&qword_2568A9948);
  v11 = *(_QWORD *)(v6 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v7);
  sub_237F18110();
  sub_237F171FC(v4, v4[3]);
  sub_237F38A70();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  sub_237F38658(v2);
  sub_237F38AAC();
  v8 = Message.serializedData(partial:)();
  v10 = v9;
  sub_237F39054((uint64_t)v2, type metadata accessor for CloudAssets_Signal);
  if (!v0)
  {
    sub_237F195A4();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    sub_237F17178(v8, v10);
  }
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v6);
  sub_237F1B978();
}

void Signal.hash(into:)()
{
  uint64_t *v0;
  uint64_t v1;
  Swift::UInt v2;
  _BYTE *v3;
  Swift::UInt64 v4;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    v3 = (_BYTE *)(v1 + 40);
    do
    {
      if ((*v3 & 1) != 0)
      {
        sub_237F39124();
      }
      else
      {
        v4 = *((_QWORD *)v3 - 1);
        sub_237F3435C();
        Hasher._combine(_:)(v4);
      }
      v3 += 16;
      --v2;
    }
    while (v2);
  }
}

uint64_t static Signal.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_237F2DAB0(*a1, *a2);
}

void Signal.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v2[72];

  v1 = *v0;
  sub_237F1BA84();
  sub_237F32F1C((uint64_t)v2, v1);
  sub_237F1BBC8();
  sub_237F1BBBC();
}

Swift::Int sub_237F38A04()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  Hasher.init(_seed:)();
  sub_237F32F1C((uint64_t)v3, v1);
  return Hasher._finalize()();
}

#error "237F38A4C: call analysis failed (funcsize=5)"

void sub_237F38A58()
{
  Signal.encode(to:)();
}

unint64_t sub_237F38A70()
{
  unint64_t result;

  result = qword_2568A9940;
  if (!qword_2568A9940)
  {
    result = MEMORY[0x23B82832C](&unk_237F5FCC4, &unk_2509CCC78);
    atomic_store(result, (unint64_t *)&qword_2568A9940);
  }
  return result;
}

unint64_t sub_237F38AAC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568A93D8;
  if (!qword_2568A93D8)
  {
    v1 = type metadata accessor for CloudAssets_Signal(255);
    result = MEMORY[0x23B82832C](&unk_237F5E7C8, v1);
    atomic_store(result, (unint64_t *)&qword_2568A93D8);
  }
  return result;
}

unint64_t sub_237F38AF0()
{
  unint64_t result;

  result = qword_2568A9950;
  if (!qword_2568A9950)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for Signal.Event, &type metadata for Signal.Event);
    atomic_store(result, (unint64_t *)&qword_2568A9950);
  }
  return result;
}

unint64_t sub_237F38B30()
{
  unint64_t result;

  result = qword_2568A9958;
  if (!qword_2568A9958)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for Signal, &type metadata for Signal);
    atomic_store(result, (unint64_t *)&qword_2568A9958);
  }
  return result;
}

void type metadata accessor for Signal()
{
  sub_237F1BC90();
}

void type metadata accessor for Signal.Event()
{
  sub_237F1BC90();
}

void type metadata accessor for Signal.CodingKeys()
{
  sub_237F1BC90();
}

uint64_t storeEnumTagSinglePayload for Signal.Event.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237F38BE0 + 4 * byte_237F5F845[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_237F38C14 + 4 * byte_237F5F840[v4]))();
}

uint64_t sub_237F38C14(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F38C1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237F38C24);
  return result;
}

uint64_t sub_237F38C30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237F38C38);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_237F38C3C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F38C44(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Signal.Event.CodingKeys()
{
  return &type metadata for Signal.Event.CodingKeys;
}

uint64_t _s10CloudAsset6SignalV5EventO37StorageContainerUploadStartCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_237F38CA0 + 4 * byte_237F5F84A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_237F38CC0 + 4 * byte_237F5F84F[v4]))();
}

_BYTE *sub_237F38CA0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_237F38CC0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F38CC8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F38CD0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F38CD8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F38CE0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for Signal.Event.StorageContainerUploadStartCodingKeys()
{
  return &type metadata for Signal.Event.StorageContainerUploadStartCodingKeys;
}

ValueMetadata *type metadata accessor for Signal.Event.AllUploadsFinishCodingKeys()
{
  return &type metadata for Signal.Event.AllUploadsFinishCodingKeys;
}

unint64_t sub_237F38D10()
{
  unint64_t result;

  result = qword_2568A9960;
  if (!qword_2568A9960)
  {
    result = MEMORY[0x23B82832C](&unk_237F5FB2C, &type metadata for Signal.Event.StorageContainerUploadStartCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9960);
  }
  return result;
}

unint64_t sub_237F38D50()
{
  unint64_t result;

  result = qword_2568A9968;
  if (!qword_2568A9968)
  {
    result = MEMORY[0x23B82832C](&unk_237F5FBE4, &type metadata for Signal.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9968);
  }
  return result;
}

unint64_t sub_237F38D90()
{
  unint64_t result;

  result = qword_2568A9970;
  if (!qword_2568A9970)
  {
    result = MEMORY[0x23B82832C](&unk_237F5FC9C, &unk_2509CCC78);
    atomic_store(result, (unint64_t *)&qword_2568A9970);
  }
  return result;
}

unint64_t sub_237F38DD0()
{
  unint64_t result;

  result = qword_2568A9978;
  if (!qword_2568A9978)
  {
    result = MEMORY[0x23B82832C](&unk_237F5FC0C, &unk_2509CCC78);
    atomic_store(result, (unint64_t *)&qword_2568A9978);
  }
  return result;
}

unint64_t sub_237F38E10()
{
  unint64_t result;

  result = qword_2568A9980;
  if (!qword_2568A9980)
  {
    result = MEMORY[0x23B82832C](&unk_237F5FC34, &unk_2509CCC78);
    atomic_store(result, (unint64_t *)&qword_2568A9980);
  }
  return result;
}

unint64_t sub_237F38E50()
{
  unint64_t result;

  result = qword_2568A9988;
  if (!qword_2568A9988)
  {
    result = MEMORY[0x23B82832C](&unk_237F5FA9C, &type metadata for Signal.Event.StorageContainerUploadStartCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9988);
  }
  return result;
}

unint64_t sub_237F38E90()
{
  unint64_t result;

  result = qword_2568A9990;
  if (!qword_2568A9990)
  {
    result = MEMORY[0x23B82832C](&unk_237F5FAC4, &type metadata for Signal.Event.StorageContainerUploadStartCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9990);
  }
  return result;
}

unint64_t sub_237F38ED0()
{
  unint64_t result;

  result = qword_2568A9998;
  if (!qword_2568A9998)
  {
    result = MEMORY[0x23B82832C](&unk_237F5FA4C, &type metadata for Signal.Event.AllUploadsFinishCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9998);
  }
  return result;
}

unint64_t sub_237F38F10()
{
  unint64_t result;

  result = qword_2568A99A0;
  if (!qword_2568A99A0)
  {
    result = MEMORY[0x23B82832C](&unk_237F5FA74, &type metadata for Signal.Event.AllUploadsFinishCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A99A0);
  }
  return result;
}

unint64_t sub_237F38F50()
{
  unint64_t result;

  result = qword_2568A99A8;
  if (!qword_2568A99A8)
  {
    result = MEMORY[0x23B82832C](&unk_237F5FB54, &type metadata for Signal.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A99A8);
  }
  return result;
}

unint64_t sub_237F38F90()
{
  unint64_t result;

  result = qword_2568A99B0;
  if (!qword_2568A99B0)
  {
    result = MEMORY[0x23B82832C](&unk_237F5FB7C, &type metadata for Signal.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A99B0);
  }
  return result;
}

uint64_t sub_237F38FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CloudAssets_Signal.Event(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237F39010(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CloudAssets_Signal.Event(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237F39054(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_237F39090()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_237F390A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t sub_237F390B0()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_237F390B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v1, v0);
}

uint64_t sub_237F390CC()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_237F390DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

unint64_t sub_237F39104()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 1;
  return sub_237F37C5C();
}

uint64_t sub_237F39110()
{
  uint64_t v0;

  return v0;
}

void sub_237F39124()
{
  Hasher._combine(_:)(1uLL);
}

unint64_t static LoggerSubsystem.client.getter()
{
  return sub_237F39154();
}

unint64_t static LoggerSubsystem.server.getter()
{
  return sub_237F39154();
}

ValueMetadata *type metadata accessor for LoggerSubsystem()
{
  return &type metadata for LoggerSubsystem;
}

unint64_t sub_237F39154()
{
  return 0xD000000000000025;
}

void sub_237F39168()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  Hasher._finalize()();
  sub_237F45A54();
}

uint64_t sub_237F391A8()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  sub_237F2B028(v0, qword_2568A99B8);
  sub_237F2B010(v0, (uint64_t)qword_2568A99B8);
  type metadata accessor for AssetManager();
  sub_237F171BC(&qword_2568A9C80);
  String.init<A>(describing:)();
  return Logger.init(subsystem:category:)();
}

void sub_237F3923C()
{
  uint64_t v0;

  type metadata accessor for AssetManager();
  v0 = swift_allocObject();
  AssetManager.init(serviceName:)(0xD00000000000001BLL, 0x8000000237F64890);
  qword_2568A99D0 = v0;
}

uint64_t AssetManager.__allocating_init(serviceName:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237F45A28();
  AssetManager.init(serviceName:)(a1, a2);
  return v4;
}

uint64_t static AssetManager.shared.getter()
{
  return sub_237F39408(&qword_2568A8F50);
}

void sub_237F392F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = sub_237F39370();
  v2 = v1;
  type metadata accessor for AssetManager();
  v3 = swift_allocObject();
  AssetManager.init(serviceName:)(v0, v2);
  qword_2568A99D8 = v3;
}

uint64_t sub_237F39370()
{
  uint64_t v1;

  swift_bridgeObjectRetain();
  v1 = String.init<A>(_:)();
  String.append<A>(contentsOf:)();
  return v1;
}

uint64_t static AssetManager.testable.getter()
{
  return sub_237F39408(&qword_2568A8F58);
}

uint64_t sub_237F39408(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  return swift_retain();
}

void AssetManager.init(serviceName:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  _UNKNOWN **v9;

  v3 = v2;
  v6 = type metadata accessor for XPCMessageSender();
  sub_237F45A28();
  v8 = v6;
  v9 = &off_2509CD488;
  *(_QWORD *)&v7 = XPCMessageSender.init(machServiceName:)(a1, a2);
  sub_237F40068(&v7, v3 + 16);
  sub_237F45A54();
}

void sub_237F394C4()
{
  sub_237F456A0();
  __break(1u);
}

uint64_t sub_237F39504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[5] = a4;
  v5[6] = a5;
  v5[7] = sub_237F171BC(&qword_2568A91F0);
  v5[8] = swift_task_alloc();
  v6 = sub_237F171BC(&qword_2568A9B08);
  v5[9] = v6;
  v5[10] = *(_QWORD *)(v6 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = type metadata accessor for Asset(0);
  v5[13] = swift_task_alloc();
  v5[14] = sub_237F171BC(&qword_2568A9AA8);
  v5[15] = swift_task_alloc();
  sub_237F171BC(&qword_2568A9B10);
  v5[16] = swift_task_alloc();
  v7 = sub_237F171BC(&qword_2568A9B18);
  v5[17] = v7;
  v5[18] = *(_QWORD *)(v7 - 8);
  v5[19] = swift_task_alloc();
  return swift_task_switch();
}

void sub_237F3962C()
{
  sub_237F171BC(&qword_2568A9AA0);
  sub_237F455F8();
}

uint64_t sub_237F39660()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v1;
  *v1 = v0;
  v1[1] = sub_237F3969C;
  sub_237F44A18();
  return sub_237F44A90();
}

uint64_t sub_237F3969C()
{
  sub_237F449A0();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F396E8()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  char v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  _QWORD *v11;

  sub_237F4562C();
  sub_237F2D4CC(*(_QWORD *)(v0 + 128), 1, *(_QWORD *)(v0 + 112));
  if (v7)
  {
    sub_237F44BF8(*(_QWORD *)(v0 + 144));
    *(_QWORD *)(v0 + 32) = 0;
    sub_237F171BC(&qword_2568A9AF0);
    AsyncThrowingStream.Continuation.finish(throwing:)();
    sub_237F34D9C();
    sub_237F449EC();
    sub_237F34D94();
    sub_237F44A9C();
    sub_237F44A80();
    sub_237F44AC0();
    return sub_237F44A88(*(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    v2 = *(_QWORD *)(v0 + 120);
    v3 = *(_QWORD *)(v0 + 96);
    v4 = sub_237F45494();
    sub_237F43510(v4, v5, v6);
    sub_237F2D4CC(v2, 1, v3);
    if (v7)
    {
      v8 = *(_QWORD *)(v0 + 80);
      v9 = *(uint64_t **)(v0 + 64);
      sub_237F19568();
      *v9 = sub_237F1BD00();
      sub_237F4523C();
      sub_237F171BC(&qword_2568A9AF0);
      sub_237F45594();
      sub_237F44B90(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
    }
    else
    {
      v10 = *(_QWORD *)(v0 + 80);
      sub_237F1F798(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104), type metadata accessor for Asset);
      sub_237F456C0();
      sub_237F4556C();
      sub_237F171BC(&qword_2568A9AF0);
      sub_237F450B0();
      sub_237F451B8(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
      sub_237F459A0();
    }
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v11;
    *v11 = v0;
    v11[1] = sub_237F39944;
    sub_237F44A18();
    return sub_237F44B3C();
  }
}

uint64_t sub_237F398A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  _QWORD *v12;
  uint64_t (*v13)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  sub_237F44C4C();
  sub_237F44BF8(v12[18]);
  v12[3] = v12[2];
  sub_237F171BC(&qword_2568A9AF0);
  sub_237F458B0();
  v12[4] = 0;
  sub_237F171BC(&qword_2568A9AF0);
  sub_237F44EF8();
  sub_237F34D9C();
  sub_237F34D94();
  sub_237F44A9C();
  sub_237F44A80();
  sub_237F44AC0();
  sub_237F44BF0();
  sub_237F454DC();
  return v13(v13, v14, v15, v16, v17, v18, v19, v20, a9, a10, a11, a12);
}

uint64_t sub_237F39944()
{
  sub_237F449A0();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t AssetManager.process(request:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  v3[6] = sub_237F171BC(&qword_2568A91F0);
  v3[7] = sub_237F34CEC();
  sub_237F171BC(&qword_2568A9638);
  v3[8] = sub_237F34CEC();
  v4 = sub_237F171BC(&qword_2568A9640);
  v3[9] = v4;
  v3[10] = *(_QWORD *)(v4 - 8);
  v3[11] = sub_237F34CEC();
  v5 = sub_237F171BC(&qword_2568A91C0);
  v3[12] = v5;
  v3[13] = *(_QWORD *)(v5 - 8);
  v3[14] = sub_237F34CEC();
  sub_237F449B0();
  return sub_237F34CD8();
}

{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  v3[6] = sub_237F171BC(&qword_2568A91F0);
  v3[7] = sub_237F34CEC();
  sub_237F171BC(&qword_2568A9638);
  v3[8] = sub_237F34CEC();
  v4 = sub_237F171BC(&qword_2568A9640);
  v3[9] = v4;
  v3[10] = *(_QWORD *)(v4 - 8);
  v3[11] = sub_237F34CEC();
  v5 = sub_237F171BC(&qword_2568A91C0);
  v3[12] = v5;
  v3[13] = *(_QWORD *)(v5 - 8);
  v3[14] = sub_237F34CEC();
  sub_237F449B0();
  return sub_237F34CD8();
}

{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  v3[7] = sub_237F171BC(&qword_2568A9A48);
  v3[8] = sub_237F34CEC();
  sub_237F171BC(&qword_2568A9A50);
  v3[9] = sub_237F34CEC();
  v4 = sub_237F171BC(&qword_2568A9A58);
  v3[10] = v4;
  v3[11] = *(_QWORD *)(v4 - 8);
  v3[12] = sub_237F34CEC();
  v5 = sub_237F171BC(&qword_2568A9A30);
  v3[13] = v5;
  v3[14] = *(_QWORD *)(v5 - 8);
  v3[15] = sub_237F34CEC();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F39A34()
{
  uint64_t v0;
  __n128 *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  sub_237F171BC(&qword_2568A99E8);
  sub_237F45344();
  v1 = (__n128 *)sub_237F449C8();
  *(_QWORD *)(v0 + 120) = v1;
  sub_237F44B5C(v1, (__n128)xmmword_237F5D500);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v2;
  *v2 = v0;
  v2[1] = sub_237F39AC4;
  sub_237F455EC();
  return AssetManager.process(requests:)(v3, v4);
}

uint64_t sub_237F39AC4()
{
  uint64_t v0;

  sub_237F44FC0();
  if (!v0)
    swift_bridgeObjectRelease();
  sub_237F449B0();
  return sub_237F449BC();
}

void sub_237F39B08()
{
  sub_237F45600();
}

uint64_t sub_237F39B20()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v1;
  *v1 = v0;
  v1[1] = sub_237F39B5C;
  sub_237F44A18();
  return sub_237F44B3C();
}

uint64_t sub_237F39B5C()
{
  sub_237F449A0();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F39BA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_log_type_t v7;
  _WORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void);

  sub_237F44C4C();
  v3 = *(_QWORD *)(v0 + 64);
  v4 = sub_237F44B1C();
  if (v14)
  {
    sub_237F44BF8(*(_QWORD *)(v0 + 80));
    if (qword_2568A8F48 != -1)
      swift_once();
    v6 = sub_237F44A50();
    sub_237F459F4(v6, (uint64_t)qword_2568A99B8);
    v7 = sub_237F44F18();
    if (sub_237F44E6C(v7))
    {
      v8 = (_WORD *)sub_237F44998();
      sub_237F45A3C(v8);
      sub_237F44C68(&dword_237F15000, v9, v10, "result stream for upload terminated unexpectedly");
      sub_237F4498C();
    }
    sub_237F459D4();
    sub_237F19568();
    sub_237F1BD00();
    sub_237F454C8();
    v11 = sub_237F456D0();
  }
  else
  {
    sub_237F4544C(v4, v5, &qword_2568A91F0);
    sub_237F451C4();
    sub_237F4594C();
    if (!v14)
    {
      v15 = *(_QWORD *)(v0 + 56);
      sub_237F44E5C();
      sub_237F44EAC(v3, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
      sub_237F45800(v15, v16, type metadata accessor for Asset);
      sub_237F34D9C();
      sub_237F34D94();
      sub_237F44A48();
      sub_237F449EC();
      v17 = (uint64_t (*)(void))sub_237F44B7C();
      return sub_237F44A2C(v17);
    }
    sub_237F456B0();
    sub_237F44E5C();
    v13 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
    v11 = v3;
    v12 = v1;
  }
  v13(v11, v12);
  sub_237F34D5C();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  return sub_237F44A2C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F39CFC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_237F34D5C();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  return sub_237F44A88(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F39D44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  sub_237F44BF8(*(_QWORD *)(v0 + 80));
  sub_237F44D34(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_237F34D5C();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  return sub_237F44A88(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t AssetManager.process(requests:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_237F45930(a1, a2);
  v3 = sub_237F171BC(&qword_2568A99F8);
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = sub_237F34CEC();
  v4 = sub_237F171BC(&qword_2568A9A00);
  v2[11] = v4;
  v2[12] = *(_QWORD *)(v4 - 8);
  v2[13] = sub_237F34CEC();
  v5 = sub_237F44FE0();
  v2[14] = v5;
  v2[15] = *(_QWORD *)(v5 - 8);
  v2[16] = sub_237F34CEC();
  sub_237F449B0();
  return sub_237F34CD8();
}

{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_237F45930(a1, a2);
  v3 = sub_237F171BC(&qword_2568A9A60);
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = sub_237F34CEC();
  v4 = sub_237F171BC(&qword_2568A9A68);
  v2[11] = v4;
  v2[12] = *(_QWORD *)(v4 - 8);
  v2[13] = sub_237F34CEC();
  v5 = sub_237F171BC(&qword_2568A9A70);
  v2[14] = v5;
  v2[15] = *(_QWORD *)(v5 - 8);
  v2[16] = sub_237F34CEC();
  v6 = sub_237F44FE0();
  v2[17] = v6;
  v2[18] = *(_QWORD *)(v6 - 8);
  v2[19] = sub_237F34CEC();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F39E24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,_QWORD *a22,uint64_t a23,uint64_t a24)
{
  NSObject *v24;
  os_log_type_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  os_log_type_t v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t (*v46)(void);

  sub_237F44B00();
  a23 = v27;
  a24 = v28;
  a22 = v26;
  if (qword_2568A8F48 != -1)
    swift_once();
  v29 = sub_237F44A50();
  sub_237F44D18(v29, (uint64_t)qword_2568A99B8);
  sub_237F45418();
  v30 = sub_237F44EA4();
  if (sub_237F44E0C(v30))
  {
    v31 = v26[16];
    v45 = v26[15];
    v32 = (uint8_t *)sub_237F44998();
    a13 = sub_237F44998();
    *(_DWORD *)v32 = 136315394;
    v33 = sub_237F45344();
    v34 = sub_237F4557C();
    MEMORY[0x23B827CFC](v34, v33);
    v35 = sub_237F44F54();
    v26[2] = sub_237F455A4(v35, v36, v37, v38);
    sub_237F450F4();
    sub_237F342C4();
    sub_237F44A58();
    sub_237F453C4();
    sub_237F173F0(&qword_2568A9A10, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6990], MEMORY[0x24BEE69A0]);
    sub_237F453B8();
    v39 = sub_237F44EAC(v31, *(uint64_t (**)(uint64_t, uint64_t))(v45 + 8));
    v26[3] = sub_237F4508C(v39, v40, &a13);
    sub_237F450F4();
    sub_237F44F54();
    sub_237F44B88(&dword_237F15000, v24, v25, "start processing %s with priority %s", v32);
    sub_237F44F0C();
    sub_237F4498C();
  }
  sub_237F44A58();

  sub_237F45538(v26[6]);
  v46 = (uint64_t (*)(void))((char *)&dword_2568A9A08 + dword_2568A9A08);
  sub_237F45980();
  v41 = (_QWORD *)swift_task_alloc();
  v26[17] = v41;
  *v41 = v26;
  v41[1] = sub_237F3A018;
  sub_237F455EC();
  return sub_237F44DAC(v42, v43, 0, v46);
}

uint64_t sub_237F3A018()
{
  uint64_t v0;
  uint64_t v1;

  sub_237F44A60();
  sub_237F4540C();
  *(_QWORD *)(v1 + 144) = v0;
  swift_task_dealloc();
  sub_237F45960();
  sub_237F449B0();
  return sub_237F449BC();
}

uint64_t sub_237F3A06C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);

  sub_237F44C4C();
  v2 = v0[12];
  v1 = v0[13];
  v3 = v0[10];
  v5 = v0[8];
  v4 = v0[9];
  v6 = v0[7];
  v7 = sub_237F45814();
  *(_QWORD *)(v7 + 16) = v1;
  *(_QWORD *)(v7 + 24) = v6;
  sub_237F171BC(&qword_2568A91F0);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v3, *MEMORY[0x24BEE6CA0], v5);
  AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
  sub_237F44B90(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_237F44AC0();
  swift_task_dealloc();
  sub_237F34D9C();
  sub_237F34D94();
  v8 = (uint64_t (*)(void))sub_237F44B7C();
  return sub_237F44A2C(v8);
}

uint64_t sub_237F3A120()
{
  uint64_t v0;

  swift_task_dealloc();
  sub_237F44A48();
  sub_237F34D9C();
  return sub_237F44A88(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F3A204()
{
  uint64_t v0;
  __n128 *v1;
  _QWORD *v2;
  uint64_t v3;

  sub_237F171BC(&qword_2568A9A20);
  sub_237F221C0();
  v1 = (__n128 *)sub_237F449C8();
  *(_QWORD *)(v0 + 120) = v1;
  sub_237F44B5C(v1, (__n128)xmmword_237F5D500);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v2;
  *v2 = v0;
  v2[1] = sub_237F3A294;
  sub_237F455EC();
  return AssetManager.process(requests:)(v3);
}

uint64_t sub_237F3A294()
{
  uint64_t v0;

  sub_237F44FC0();
  if (!v0)
    swift_bridgeObjectRelease();
  sub_237F449B0();
  return sub_237F449BC();
}

void sub_237F3A2D8()
{
  sub_237F45600();
}

uint64_t sub_237F3A2F0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v1;
  *v1 = v0;
  v1[1] = sub_237F3A32C;
  sub_237F44A18();
  return sub_237F44B3C();
}

uint64_t sub_237F3A32C()
{
  sub_237F449A0();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F3A378()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_log_type_t v7;
  _WORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void);

  sub_237F44C4C();
  v3 = *(_QWORD *)(v0 + 64);
  v4 = sub_237F44B1C();
  if (v14)
  {
    sub_237F44BF8(*(_QWORD *)(v0 + 80));
    if (qword_2568A8F48 != -1)
      swift_once();
    v6 = sub_237F44A50();
    sub_237F459F4(v6, (uint64_t)qword_2568A99B8);
    v7 = sub_237F44F18();
    if (sub_237F44E6C(v7))
    {
      v8 = (_WORD *)sub_237F44998();
      sub_237F45A3C(v8);
      sub_237F44C68(&dword_237F15000, v9, v10, "result stream for download terminated unexpectedly");
      sub_237F4498C();
    }
    sub_237F459D4();
    sub_237F19568();
    sub_237F1BD00();
    sub_237F454C8();
    v11 = sub_237F456D0();
  }
  else
  {
    sub_237F4544C(v4, v5, &qword_2568A91F0);
    sub_237F451C4();
    sub_237F4594C();
    if (!v14)
    {
      v15 = *(_QWORD *)(v0 + 56);
      sub_237F44E5C();
      sub_237F44EAC(v3, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
      sub_237F45800(v15, v16, type metadata accessor for Asset);
      sub_237F34D9C();
      sub_237F34D94();
      sub_237F44A48();
      sub_237F449EC();
      v17 = (uint64_t (*)(void))sub_237F44B7C();
      return sub_237F44A2C(v17);
    }
    sub_237F456B0();
    sub_237F44E5C();
    v13 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
    v11 = v3;
    v12 = v1;
  }
  v13(v11, v12);
  sub_237F34D5C();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  return sub_237F44A2C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t AssetManager.process(requests:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v1[2] = a1;
  v2 = sub_237F171BC(&qword_2568A99F8);
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = sub_237F34CEC();
  v3 = sub_237F171BC(&qword_2568A9A30);
  v1[6] = v3;
  v1[7] = *(_QWORD *)(v3 - 8);
  v1[8] = sub_237F34CEC();
  v4 = (_QWORD *)swift_task_alloc();
  v1[9] = v4;
  *v4 = v1;
  v4[1] = sub_237F3A56C;
  sub_237F455EC();
  return AssetManager.process(requests:)(v5, v6);
}

{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2[6] = a1;
  v2[7] = v1;
  v2[8] = *v1;
  v3 = sub_237F171BC(&qword_2568A99F8);
  v2[9] = v3;
  v2[10] = *(_QWORD *)(v3 - 8);
  v2[11] = sub_237F34CEC();
  sub_237F171BC(&qword_2568A91C0);
  v2[12] = sub_237F34CEC();
  v4 = sub_237F171BC(&qword_2568A9A90);
  v2[13] = v4;
  v2[14] = *(_QWORD *)(v4 - 8);
  v2[15] = sub_237F34CEC();
  v5 = sub_237F171BC(&qword_2568A9A98);
  v2[16] = v5;
  v2[17] = *(_QWORD *)(v5 - 8);
  v2[18] = sub_237F44C14();
  v2[19] = sub_237F44FB8();
  v6 = sub_237F171BC(&qword_2568A9AA0);
  v2[20] = v6;
  v2[21] = *(_QWORD *)(v6 - 8);
  v2[22] = sub_237F34CEC();
  v7 = sub_237F171BC(&qword_2568A9300);
  v2[23] = v7;
  v2[24] = *(_QWORD *)(v7 - 8);
  v2[25] = sub_237F34CEC();
  v8 = sub_237F171BC(&qword_2568A92D8);
  v2[26] = v8;
  v2[27] = *(_QWORD *)(v8 - 8);
  v2[28] = sub_237F44C14();
  v2[29] = sub_237F44FB8();
  v9 = sub_237F171BC(&qword_2568A91B0);
  v2[30] = v9;
  v2[31] = *(_QWORD *)(v9 - 8);
  v2[32] = sub_237F44C14();
  v2[33] = sub_237F44FB8();
  v10 = sub_237F171BC(&qword_2568A9A00);
  v2[34] = v10;
  v2[35] = *(_QWORD *)(v10 - 8);
  v2[36] = sub_237F34CEC();
  v11 = sub_237F44FE0();
  v2[37] = v11;
  v2[38] = *(_QWORD *)(v11 - 8);
  v2[39] = sub_237F34CEC();
  sub_237F449B0();
  return sub_237F34CD8();
}

{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[4] = a1;
  v2[5] = v1;
  v2[6] = *v1;
  sub_237F171BC(&qword_2568A9AC8);
  v2[7] = sub_237F34CEC();
  v3 = sub_237F171BC(&qword_2568A91C0);
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = sub_237F44C14();
  v2[11] = sub_237F44FB8();
  v4 = sub_237F44FE0();
  v2[12] = v4;
  v2[13] = *(_QWORD *)(v4 - 8);
  v2[14] = sub_237F34CEC();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F3A56C()
{
  uint64_t v0;
  uint64_t v1;

  sub_237F44A60();
  sub_237F4540C();
  *(_QWORD *)(v1 + 80) = v0;
  swift_task_dealloc();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F3A5B8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  sub_237F44C4C();
  v2 = v0[7];
  v1 = v0[8];
  v3 = v0[5];
  v4 = v0[3];
  v5 = v0[4];
  *(_QWORD *)(sub_237F45814() + 16) = v1;
  sub_237F171BC(&qword_2568A91F0);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v3, *MEMORY[0x24BEE6CA0], v4);
  AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
  sub_237F44D34(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_237F44A80();
  sub_237F44A48();
  sub_237F449EC();
  v6 = (uint64_t (*)(void))sub_237F44B7C();
  return sub_237F44A2C(v6);
}

uint64_t sub_237F3A65C()
{
  uint64_t v0;

  swift_task_dealloc();
  sub_237F44A48();
  return sub_237F44D0C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F3A734()
{
  uint64_t v0;
  __n128 *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  sub_237F171BC(&qword_2568A9A20);
  sub_237F221C0();
  v1 = (__n128 *)sub_237F449C8();
  *(_QWORD *)(v0 + 128) = v1;
  sub_237F44B5C(v1, (__n128)xmmword_237F5D500);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v2;
  *v2 = v0;
  v2[1] = sub_237F3A7C4;
  sub_237F455EC();
  return AssetManager.process(requests:)(v3, v4);
}

uint64_t sub_237F3A7C4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  sub_237F449B0();
  return sub_237F449BC();
}

uint64_t sub_237F3A824()
{
  uint64_t v0;
  _QWORD *v1;

  MEMORY[0x23B827DB0](*(_QWORD *)(v0 + 104));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v1;
  *v1 = v0;
  v1[1] = sub_237F3A884;
  sub_237F44A18();
  return sub_237F44B3C();
}

uint64_t sub_237F3A884()
{
  sub_237F44A60();
  sub_237F449A0();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F3A8C8()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  os_log_type_t v6;
  _WORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void);

  v1 = (void *)v0[7];
  v2 = sub_237F44B1C();
  if (v4)
  {
    sub_237F44BF8(v0[11]);
    if (qword_2568A8F48 != -1)
      swift_once();
    v5 = sub_237F44A50();
    sub_237F459F4(v5, (uint64_t)qword_2568A99B8);
    v6 = sub_237F44F18();
    if (sub_237F44E6C(v6))
    {
      v7 = (_WORD *)sub_237F44998();
      sub_237F45A3C(v7);
      sub_237F44C68(&dword_237F15000, v8, v9, "result stream for download terminated unexpectedly");
      sub_237F4498C();
    }

    sub_237F19568();
    sub_237F1BD00();
    sub_237F454C8();
    v10 = sub_237F456D0();
  }
  else
  {
    sub_237F4544C(v2, v3, &qword_2568A9A48);
    v12 = sub_237F451C4();
    v13 = v0[14];
    v14 = v0[12];
    v15 = v0[11];
    if (v12 != 1)
    {
      sub_237F1F798(v0[8], v0[4], (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
      sub_237F44EAC(v14, *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
      sub_237F44B90(*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
      sub_237F34D9C();
      sub_237F34D94();
      sub_237F44A48();
      sub_237F44A80();
      v16 = (uint64_t (*)(void))sub_237F44B7C();
      return v16();
    }
    v0[3] = *(_QWORD *)v0[8];
    sub_237F171BC(&qword_2568A91E0);
    swift_willThrowTypedImpl();
    sub_237F44EAC(v14, *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
    v10 = sub_237F45988();
  }
  v11(v10);
  sub_237F45058();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_237F3AA88()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_237F45058();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  return sub_237F44A88(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F3AAD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 112);
  v1 = *(_QWORD *)(v0 + 120);
  sub_237F44BF8(*(_QWORD *)(v0 + 88));
  sub_237F44D34(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_237F45058();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  return sub_237F44A88(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F3ABD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,_QWORD *a22,uint64_t a23,uint64_t a24)
{
  NSObject *v24;
  os_log_type_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  os_log_type_t v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v44;
  uint64_t (*v45)(void);

  sub_237F44B00();
  a23 = v27;
  a24 = v28;
  a22 = v26;
  if (qword_2568A8F48 != -1)
    swift_once();
  v29 = sub_237F44A50();
  sub_237F44D18(v29, (uint64_t)qword_2568A99B8);
  sub_237F45418();
  v30 = sub_237F44EA4();
  if (sub_237F44E0C(v30))
  {
    v31 = v26[19];
    v44 = v26[18];
    v32 = (uint8_t *)sub_237F44998();
    a13 = sub_237F44998();
    *(_DWORD *)v32 = 136315394;
    v33 = sub_237F221C0();
    v34 = sub_237F4557C();
    MEMORY[0x23B827CFC](v34, v33);
    v35 = sub_237F44F54();
    v26[2] = sub_237F455A4(v35, v36, v37, v38);
    sub_237F450F4();
    sub_237F342C4();
    sub_237F44A58();
    sub_237F453C4();
    sub_237F173F0(&qword_2568A9A10, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6990], MEMORY[0x24BEE69A0]);
    sub_237F453B8();
    v39 = sub_237F44EAC(v31, *(uint64_t (**)(uint64_t, uint64_t))(v44 + 8));
    v26[3] = sub_237F4508C(v39, v40, &a13);
    sub_237F450F4();
    sub_237F44F54();
    sub_237F44B88(&dword_237F15000, v24, v25, "start processing %s with priority %s", v32);
    sub_237F44F0C();
    sub_237F4498C();
  }
  sub_237F44A58();

  v41 = v26[5];
  sub_237F45538(v26[6]);
  v45 = (uint64_t (*)(void))((char *)&dword_2568A9A78 + dword_2568A9A78);
  v42 = (_QWORD *)swift_task_alloc();
  v26[20] = v42;
  *v42 = v26;
  v42[1] = sub_237F3ADC0;
  return sub_237F44DAC(v26[16], v41, 1, v45);
}

uint64_t sub_237F3ADC0()
{
  uint64_t v0;
  uint64_t v1;

  sub_237F4540C();
  *(_QWORD *)(v1 + 168) = v0;
  swift_task_dealloc();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F3AE14()
{
  _QWORD *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t (*v22)(void);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  sub_237F44B00();
  v1 = v0[5];
  v2 = *(_QWORD *)(v1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v5 = v0[8];
    v4 = v0[9];
    v26 = MEMORY[0x24BEE4AF8];
    sub_237F42E60(0, v2, 0);
    v3 = v26;
    v6 = *(_QWORD *)(sub_237F221C0() - 8);
    v7 = v1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v8 = *(_QWORD *)(v6 + 72);
    do
    {
      v9 = v0[10];
      v10 = v9 + *(int *)(v5 + 48);
      sub_237F20E2C(v7, v10, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadRequest);
      v11 = sub_237F18108();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
      v13 = *(_QWORD *)(v26 + 16);
      v12 = *(_QWORD *)(v26 + 24);
      if (v13 >= v12 >> 1)
        sub_237F42E60(v12 > 1, v13 + 1, 1);
      v14 = v0[10];
      *(_QWORD *)(v26 + 16) = v13 + 1;
      sub_237F457F8(v14, v26+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(_QWORD *)(v4 + 72) * v13);
      v7 += v8;
      --v2;
    }
    while (v2);
    v1 = v0[5];
  }
  v15 = v0[16];
  v24 = v0[15];
  v16 = v0[13];
  v25 = v0[14];
  v18 = v0[11];
  v17 = v0[12];
  v19 = v0[7];
  v20 = sub_237F3B960(v3);
  v21 = (_QWORD *)swift_task_alloc();
  v21[2] = v15;
  v21[3] = v20;
  v21[4] = v1;
  v21[5] = v19;
  sub_237F171BC(&qword_2568A9A48);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v17 + 104))(v16, *MEMORY[0x24BEE6CA0], v18);
  sub_237F45988();
  AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
  sub_237F4548C();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v15, v25);
  sub_237F44F44();
  sub_237F45444();
  sub_237F34D94();
  sub_237F449EC();
  sub_237F4543C();
  v22 = (uint64_t (*)(void))sub_237F44B7C();
  return sub_237F44D90(v22);
}

uint64_t sub_237F3AFF0()
{
  uint64_t v0;

  swift_task_dealloc();
  sub_237F44A48();
  sub_237F34D9C();
  sub_237F449EC();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237F3B044(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v23 = a1;
  v24 = a3;
  v4 = sub_237F171BC(&qword_2568A9AF0);
  v5 = *(_QWORD *)(v4 - 8);
  v22 = v4;
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_237F171BC(&qword_2568A9A00);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_237F171BC(&qword_2568A9AC8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for TaskPriority();
  _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v23, v4);
  v16 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v17 = (v10 + *(unsigned __int8 *)(v5 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v18 = (v6 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = 0;
  *(_QWORD *)(v19 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v19 + v16, v11, v8);
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v19 + v17, v7, v22);
  *(_QWORD *)(v19 + v18) = v24;
  sub_237F3B844((uint64_t)v14, (uint64_t)&unk_2568A9C38, v19);
  return swift_release();
}

uint64_t sub_237F3B214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[3] = a4;
  v5[4] = a5;
  v5[5] = sub_237F171BC(&qword_2568A91F0);
  v5[6] = swift_task_alloc();
  v6 = sub_237F171BC(&qword_2568A9B08);
  v5[7] = v6;
  v5[8] = *(_QWORD *)(v6 - 8);
  v5[9] = swift_task_alloc();
  v5[10] = type metadata accessor for Asset(0);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  v5[13] = swift_task_alloc();
  sub_237F171BC(&qword_2568A9AA8);
  v5[14] = swift_task_alloc();
  v5[15] = swift_task_alloc();
  v5[16] = type metadata accessor for UploadResponseMessage();
  v5[17] = swift_task_alloc();
  sub_237F171BC(&qword_2568A9B40);
  v5[18] = swift_task_alloc();
  v7 = sub_237F171BC(&qword_2568A9B48);
  v5[19] = v7;
  v5[20] = *(_QWORD *)(v7 - 8);
  v5[21] = swift_task_alloc();
  return swift_task_switch();
}

void sub_237F3B388()
{
  sub_237F171BC(&qword_2568A9A00);
  sub_237F455F8();
}

uint64_t sub_237F3B3BC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 176) = v1;
  *v1 = v0;
  v1[1] = sub_237F3B3F8;
  sub_237F44A18();
  return sub_237F44A90();
}

uint64_t sub_237F3B3F8()
{
  sub_237F44A60();
  sub_237F449A0();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F3B43C()
{
  _QWORD *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;

  sub_237F44B00();
  v1 = v0[18];
  sub_237F2D4CC(v1, 1, v0[16]);
  if (v2)
  {
    sub_237F45420();
    sub_237F450E8(v3);
    sub_237F34D9C();
    sub_237F44A48();
    sub_237F449EC();
    sub_237F34D94();
    sub_237F44A9C();
    sub_237F44A80();
    sub_237F44AC0();
    sub_237F44BF0();
    sub_237F44F44();
    sub_237F4543C();
    v4 = (uint64_t (*)(void))sub_237F44B7C();
    return sub_237F44D90(v4);
  }
  else
  {
    sub_237F1F798(v1, v0[17], (uint64_t (*)(_QWORD))type metadata accessor for UploadResponseMessage);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v7 = v0[14];
      v8 = v0[10];
      sub_237F43510(v0[17], v0[15], &qword_2568A9AA8);
      v9 = sub_237F45494();
      sub_237F44534(v9, v10, &qword_2568A9AA8);
      sub_237F2D4CC(v7, 1, v8);
      if (v2)
      {
        v11 = v0[8];
        v12 = (uint64_t *)v0[6];
        sub_237F19568();
        *v12 = sub_237F1BD00();
        sub_237F4523C();
        sub_237F171BC(&qword_2568A9AF0);
        sub_237F45594();
        sub_237F44B90(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
      }
      else
      {
        sub_237F1F798(v0[14], v0[13], type metadata accessor for Asset);
        if (qword_2568A8F48 != -1)
          swift_once();
        v13 = sub_237F44A50();
        v14 = sub_237F2B010(v13, (uint64_t)qword_2568A99B8);
        sub_237F454A0(v14, v15, type metadata accessor for Asset);
        v16 = v14;
        Logger.logObject.getter();
        v17 = sub_237F454D4();
        v18 = sub_237F44F5C(v16);
        v19 = v0[12];
        if (v18)
        {
          v20 = v0[11];
          v21 = sub_237F44998();
          sub_237F44998();
          *(_DWORD *)v21 = 136315138;
          sub_237F20E2C(v19, v20, type metadata accessor for Asset);
          v22 = String.init<A>(describing:)();
          *(_QWORD *)(v21 + 4) = sub_237F458E0(v22, v23, v24, v25, v26, v27);
          sub_237F34444();
          sub_237F4436C(v19, type metadata accessor for Asset);
          sub_237F44C44(&dword_237F15000, v16, v17, "successfully uploaded asset %s", (uint8_t *)v21);
          sub_237F449F4();
          sub_237F4498C();
        }
        sub_237F45868(v18, type metadata accessor for Asset);

        v28 = v0[8];
        sub_237F456C0();
        sub_237F4556C();
        sub_237F171BC(&qword_2568A9AF0);
        sub_237F450B0();
        sub_237F451B8(*(uint64_t (**)(uint64_t, uint64_t))(v28 + 8));
        sub_237F459A0();
      }
      sub_237F44560(v0[15], &qword_2568A9AA8);
      v29 = (_QWORD *)swift_task_alloc();
      v0[23] = v29;
      *v29 = v0;
      v29[1] = sub_237F3B794;
      sub_237F44A18();
      return sub_237F44D74();
    }
    else
    {
      return sub_237F456A0();
    }
  }
}

uint64_t sub_237F3B794()
{
  sub_237F44A60();
  sub_237F449A0();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F3B7D8()
{
  uint64_t v0;
  uint64_t v1;

  sub_237F4567C();
  sub_237F45420();
  sub_237F453EC(v1);
  sub_237F44A48();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  sub_237F44A9C();
  sub_237F44A80();
  sub_237F44AC0();
  sub_237F44BF0();
  sub_237F44F44();
  sub_237F45444();
  return sub_237F44AC8(*(uint64_t (**)(void))(v0 + 8));
}

void sub_237F3B844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  char v6;

  v5 = sub_237F44FE0();
  sub_237F2D4CC(a1, 1, v5);
  if (v6)
  {
    sub_237F44560(a1, &qword_2568A9AC8);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  swift_task_create();
  sub_237F45A54();
}

uint64_t sub_237F3B960(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  if (*(_QWORD *)(a1 + 16))
  {
    sub_237F171BC(&qword_2568A9BA0);
    v1 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v1 = MEMORY[0x24BEE4B00];
  }
  v4 = v1;
  v2 = swift_bridgeObjectRetain();
  sub_237F438A4(v2, 1, &v4);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_237F3BA08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v30 = a4;
  v31 = a5;
  v28 = a1;
  v29 = a3;
  v6 = sub_237F171BC(&qword_2568A9B58);
  v7 = *(_QWORD *)(v6 - 8);
  v26 = v6;
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v27 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_237F171BC(&qword_2568A9A70);
  v10 = *(_QWORD *)(v9 - 8);
  v25 = v9;
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_237F171BC(&qword_2568A9AC8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TaskPriority();
  _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v15, 1, 1, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a2, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v28, v6);
  v17 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v18 = (v11 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = (*(unsigned __int8 *)(v7 + 80) + v18 + 8) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v20 = (v8 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = 0;
  *(_QWORD *)(v21 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v21 + v17, v12, v25);
  *(_QWORD *)(v21 + v18) = v29;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v21 + v19, v27, v26);
  v22 = v31;
  *(_QWORD *)(v21 + v20) = v30;
  *(_QWORD *)(v21 + ((v20 + 15) & 0xFFFFFFFFFFFFFFF8)) = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_237F4BAA4((uint64_t)v15, (uint64_t)&unk_2568A9B68, v21);
  return swift_release();
}

uint64_t sub_237F3BC10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7[13] = a6;
  v7[14] = a7;
  v7[11] = a4;
  v7[12] = a5;
  v7[15] = sub_237F171BC(&qword_2568A9A48);
  v7[16] = swift_task_alloc();
  v8 = sub_237F171BC(&qword_2568A9B70);
  v7[17] = v8;
  v7[18] = *(_QWORD *)(v8 - 8);
  v7[19] = swift_task_alloc();
  v9 = type metadata accessor for AssetDownloadRequest();
  v7[20] = v9;
  v7[21] = *(_QWORD *)(v9 - 8);
  v7[22] = swift_task_alloc();
  sub_237F171BC(&qword_2568A9018);
  v7[23] = swift_task_alloc();
  v10 = type metadata accessor for URL();
  v7[24] = v10;
  v7[25] = *(_QWORD *)(v10 - 8);
  v7[26] = swift_task_alloc();
  v7[27] = swift_task_alloc();
  v11 = type metadata accessor for TaskPriority();
  v7[28] = v11;
  v7[29] = *(_QWORD *)(v11 - 8);
  v7[30] = swift_task_alloc();
  v7[31] = type metadata accessor for AssetDownloadResponse();
  v7[32] = swift_task_alloc();
  v7[33] = swift_task_alloc();
  v7[34] = swift_task_alloc();
  sub_237F171BC(&qword_2568A9B78);
  v7[35] = swift_task_alloc();
  v7[36] = swift_task_alloc();
  v7[37] = type metadata accessor for DownloadResponseMessage();
  v7[38] = swift_task_alloc();
  sub_237F171BC(&qword_2568A9B80);
  v7[39] = swift_task_alloc();
  v12 = sub_237F171BC(&qword_2568A9B88);
  v7[40] = v12;
  v7[41] = *(_QWORD *)(v12 - 8);
  v7[42] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237F3BE60()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = sub_237F171BC(&qword_2568A9A70);
  MEMORY[0x23B827DB0](v1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 344) = v2;
  *v2 = v0;
  v2[1] = sub_237F3BF04;
  sub_237F449B0();
  return sub_237F44A90();
}

uint64_t sub_237F3BF04()
{
  sub_237F44A60();
  sub_237F449A0();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F3BF8C()
{
  _QWORD *v0;
  _QWORD *v1;
  char v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD);
  int v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  os_log_type_t v27;
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
  NSObject *v38;
  os_log_type_t v39;
  _BOOL8 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  _BOOL8 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  void *v81;
  os_log_type_t v82;
  _WORD *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  NSObject *v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  void *v94;
  void *v95;
  NSURL *v96;
  void *v97;
  void *v98;
  unsigned int v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  os_log_type_t v105;
  uint8_t *v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t (*v119)(uint64_t, uint64_t);
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t (*v144)(uint64_t, uint64_t);
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148[2];

  v1 = v0;
  v148[1] = *MEMORY[0x24BDAC8D0];
  sub_237F44B1C();
  if (v2)
  {
LABEL_3:
    sub_237F44BF8(v1[41]);
    sub_237F449EC();
    sub_237F34D94();
    sub_237F44A9C();
    sub_237F44A80();
    sub_237F44AC0();
    sub_237F44BF0();
    sub_237F44F44();
    sub_237F44A48();
    sub_237F34D9C();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return ((uint64_t (*)(void))v1[1])();
  }
  v4 = sub_237F45988();
  sub_237F1F798(v4, v5, v6);
  v7 = sub_237F451C4();
  v8 = (uint64_t *)v0[38];
  if (v7 == 1)
  {
    v9 = *v8;
    if (qword_2568A8F48 != -1)
      swift_once();
    v10 = sub_237F44A50();
    v11 = sub_237F2B010(v10, (uint64_t)qword_2568A99B8);
    swift_bridgeObjectRetain_n();
    Logger.logObject.getter();
    v12 = sub_237F44F18();
    if (sub_237F454C0(v11))
    {
      v13 = sub_237F44998();
      v14 = (_QWORD *)sub_237F44998();
      *(_DWORD *)v13 = 138412290;
      sub_237F35664();
      sub_237F1BD00();
      *v15 = v9;
      sub_237F44FB0();
      v16 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v13 + 4) = v16;
      *v14 = v16;
      sub_237F44A58();
      sub_237F44C44(&dword_237F15000, v11, v12, "requests failed due to server blocking %@", (uint8_t *)v13);
      sub_237F171BC(&qword_2568A9B50);
      sub_237F449F4();
      sub_237F4498C();
    }
    sub_237F44A58();

    sub_237F35664();
    v34 = sub_237F1BD00();
    *v35 = v9;
    v0[4] = v34;
    sub_237F171BC(&qword_2568A9B58);
    AsyncThrowingStream.Continuation.finish(throwing:)();
    goto LABEL_22;
  }
  v18 = v0[35];
  v17 = v0[36];
  v19 = v0[31];
  v20 = (uint64_t *)((char *)v8 + *(int *)(sub_237F171BC(&qword_2568A9B90) + 48));
  v22 = *v20;
  v21 = v20[1];
  v23 = sub_237F45494();
  sub_237F457F8(v23, v24);
  sub_237F44534(v17, v18, &qword_2568A9B78);
  sub_237F2D4CC(v18, 1, v19);
  if (v2)
  {
    sub_237F34444();
    if (qword_2568A8F48 != -1)
      swift_once();
    v25 = v0[14];
    v26 = sub_237F44A50();
    sub_237F44D18(v26, (uint64_t)qword_2568A99B8);
    sub_237F45418();
    v27 = sub_237F44F18();
    if (sub_237F44F5C(v25))
    {
      v28 = v0[20];
      v29 = sub_237F44998();
      v148[0] = sub_237F44998();
      *(_DWORD *)v29 = 136315138;
      v30 = swift_bridgeObjectRetain();
      v31 = MEMORY[0x23B827CFC](v30, v28);
      v33 = v32;
      sub_237F34444();
      *(_QWORD *)(v29 + 4) = sub_237F42698(v31, v33, v148);
      swift_bridgeObjectRelease();
      sub_237F44A58();
      sub_237F44C44(&dword_237F15000, v25, v27, "failed to process requests %s", (uint8_t *)v29);
      sub_237F449F4();
      sub_237F4498C();
    }
    sub_237F44A58();

    v49 = v0[36];
    v50 = v0[18];
    v51 = (uint64_t *)v1[16];
    sub_237F19568();
    *v51 = sub_237F1BD00();
    sub_237F4523C();
    sub_237F171BC(&qword_2568A9B58);
    sub_237F450B0();
    sub_237F451B8(*(uint64_t (**)(uint64_t, uint64_t))(v50 + 8));
    v52 = v49;
    goto LABEL_21;
  }
  v143 = v22;
  sub_237F1F798(v0[35], v0[34], (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
  if (qword_2568A8F48 != -1)
    swift_once();
  v141 = sub_237F44A50();
  v36 = sub_237F2B010(v141, (uint64_t)qword_2568A99B8);
  sub_237F454A0(v36, v37, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
  v38 = Logger.logObject.getter();
  v39 = static os_log_type_t.default.getter();
  v40 = os_log_type_enabled(v38, v39);
  v140 = (uint64_t)(v0 + 4);
  if (v40)
  {
    v41 = v0[30];
    v137 = v0[29];
    v42 = sub_237F44998();
    v148[0] = sub_237F44998();
    *(_DWORD *)v42 = 136315394;
    sub_237F173F0(&qword_2568A9B98, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v43 = sub_237F453B8();
    v0[9] = sub_237F45480(v43, v44);
    sub_237F4583C();
    v45 = sub_237F4548C();
    sub_237F45564(v45, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
    *(_WORD *)(v42 + 12) = 2080;
    static Task<>.currentPriority.getter();
    sub_237F173F0(&qword_2568A9A10, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6990], MEMORY[0x24BEE69A0]);
    v46 = sub_237F45850();
    v48 = v47;
    sub_237F44F4C(v41, *(uint64_t (**)(uint64_t, uint64_t))(v137 + 8));
    v0[10] = sub_237F42698(v46, v48, v148);
    sub_237F4583C();
    sub_237F45858();
    sub_237F44B88(&dword_237F15000, v38, v39, "successfully downloaded asset at %s with priority %s", (uint8_t *)v42);
    swift_arrayDestroy();
    sub_237F4498C();
  }
  sub_237F45564(v40, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);

  if (!*(_QWORD *)(v0[12] + 16) || (v56 = sub_237F4EEE8(v0[34]), (v54 & 1) == 0))
  {
    sub_237F450FC(v0[23], v54, v55, v0[24]);
    goto LABEL_29;
  }
  v57 = v0[24];
  v58 = v0[25];
  v60 = v1[22];
  v59 = v1[23];
  v61 = v1[20];
  sub_237F20E2C(*(_QWORD *)(v1[12] + 56) + *(_QWORD *)(v1[21] + 72) * v56, v60, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadRequest);
  v62 = *(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 16);
  v62(v59, v60 + *(int *)(v61 + 36), v57);
  sub_237F45A1C();
  _s10CloudAsset21UploadResponseMessageOwst_0(v59, 0, 1, v57);
  sub_237F44B1C();
  if (v2)
  {
LABEL_29:
    v78 = v1[23];
    v79 = v1[18];
    v80 = (uint64_t *)v1[16];
    v81 = (void *)v1[13];
    swift_bridgeObjectRelease();
    sub_237F44560(v78, &qword_2568A9018);
    sub_237F19568();
    *v80 = sub_237F1BD00();
    sub_237F4523C();
    sub_237F171BC(&qword_2568A9B58);
    AsyncThrowingStream.Continuation.yield(_:)();
    sub_237F44B90(*(uint64_t (**)(uint64_t, uint64_t))(v79 + 8));
    sub_237F4591C();
    v82 = sub_237F44F18();
    if (sub_237F44E6C(v82))
    {
      v83 = (_WORD *)sub_237F44998();
      sub_237F45A3C(v83);
      sub_237F44C68(&dword_237F15000, v84, v85, "invalid request id");
      sub_237F4498C();
    }
    v86 = v1[36];

    sub_237F45A14(v87, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
    sub_237F44560(v86, &qword_2568A9B78);
    goto LABEL_3;
  }
  v64 = v1[26];
  v63 = v1[27];
  v65 = v1[24];
  v66 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v1[25] + 32))(v63, v1[23], v65);
  sub_237F454A0(v66, v67, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
  v62(v64, v63, v65);
  v68 = sub_237F4591C();
  v69 = static os_log_type_t.default.getter();
  v70 = os_log_type_enabled(v68, v69);
  if (v70)
  {
    v134 = v1[26];
    v71 = v1[24];
    v138 = v1[25];
    v72 = sub_237F44998();
    v148[0] = sub_237F44998();
    *(_DWORD *)v72 = 136315394;
    sub_237F173F0(&qword_2568A9B98, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v73 = sub_237F4587C();
    v1[7] = sub_237F45480(v73, v74);
    sub_237F450F4();
    v75 = sub_237F4548C();
    sub_237F45A14(v75, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
    *(_WORD *)(v72 + 12) = 2080;
    v76 = sub_237F4587C();
    v1[8] = sub_237F45480(v76, v77);
    sub_237F4583C();
    sub_237F4548C();
    (*(void (**)(uint64_t, uint64_t))(v138 + 8))(v134, v71);
    sub_237F44B88(&dword_237F15000, v68, v69, "moving file from %s to %s", (uint8_t *)v72);
    sub_237F44EE4();
    sub_237F4498C();
  }
  sub_237F45A14(v70, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
  v88 = sub_237F45494();
  v144 = v89;
  ((void (*)(uint64_t))v89)(v88);

  v90 = String.utf8CString.getter();
  v91 = sandbox_extension_consume();
  sub_237F340D4();
  if (v91 < 0)
  {
    sub_237F4557C();
    sub_237F4591C();
    v105 = sub_237F44F18();
    if (sub_237F44F5C(v90))
    {
      v106 = (uint8_t *)sub_237F44998();
      v148[0] = sub_237F44998();
      *(_DWORD *)v106 = 136315138;
      sub_237F4557C();
      v1[6] = sub_237F42698(v143, v21, v148);
      sub_237F457C8();
      swift_bridgeObjectRelease_n();
      sub_237F44C44(&dword_237F15000, v90, v105, "failed to consume extension token %s", v106);
      sub_237F449F4();
      sub_237F4498C();
    }
    sub_237F44A58();

    v122 = v1[41];
    v121 = v1[42];
    sub_237F4521C();
    sub_237F19568();
    sub_237F1BD00();
    v123 = swift_willThrow();
    v131 = sub_237F45554(v123, v124, v125, v126, v127, v128, v129, v130, v132, v133, v135, v136, v139, v140, v141, v143, v144);
    sub_237F45564(v131, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
    sub_237F44560(v91, &qword_2568A9B78);
    v119 = *(uint64_t (**)(uint64_t, uint64_t))(v122 + 8);
    v120 = v121;
LABEL_39:
    sub_237F44D34(v120, v119);
    if (qword_2568A8F48 != -1)
      swift_once();
    sub_237F2B010(v142, (uint64_t)qword_2568A99B8);
    sub_237F45860();
  }
  v92 = v1[31];
  sub_237F44F54();
  v93 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  URL._bridgeToObjectiveC()((NSURL *)*(int *)(v92 + 24));
  v95 = v94;
  URL._bridgeToObjectiveC()(v96);
  v98 = v97;
  v1[5] = 0;
  v99 = objc_msgSend(v93, sel_moveItemAtURL_toURL_error_, v95, v97, v1 + 5);

  v100 = (void *)v1[5];
  if (!v99)
  {
    v108 = v1[41];
    v107 = v1[42];
    sub_237F4521C();
    v109 = v100;
    _convertNSErrorToError(_:)();

    v110 = swift_willThrow();
    v118 = sub_237F45554(v110, v111, v112, v113, v114, v115, v116, v117, v132, v133, v135, v136, v139, v140, v141, v143, v144);
    sub_237F45564(v118, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
    sub_237F44560(v91, &qword_2568A9B78);
    v119 = *(uint64_t (**)(uint64_t, uint64_t))(v108 + 8);
    v120 = v107;
    goto LABEL_39;
  }
  v101 = v1[34];
  v146 = v1[27];
  v147 = v1[36];
  v145 = v1[24];
  v102 = v1[18];
  v103 = v1[19];
  sub_237F20E2C(v101, v1[16], (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
  swift_storeEnumTagMultiPayload();
  v104 = v100;
  sub_237F171BC(&qword_2568A9B58);
  AsyncThrowingStream.Continuation.yield(_:)();
  sub_237F4589C(v103, *(uint64_t (**)(uint64_t, uint64_t))(v102 + 8));
  sandbox_extension_release();
  v144(v146, v145);
  sub_237F4436C(v101, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
  v52 = v147;
LABEL_21:
  sub_237F44560(v52, &qword_2568A9B78);
LABEL_22:
  v53 = (_QWORD *)swift_task_alloc();
  v1[44] = v53;
  *v53 = v1;
  v53[1] = sub_237F3CE50;
  sub_237F449B0();
  return _sScs8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF();
}

uint64_t sub_237F3CE50()
{
  sub_237F44A60();
  sub_237F449A0();
  sub_237F449B0();
  return sub_237F34CD8();
}

void sub_237F3CED8()
{
  uint64_t v0;
  uint64_t v1;

  sub_237F45660();
  sub_237F44BF8(*(_QWORD *)(v0 + 328));
  if (qword_2568A8F48 != -1)
    swift_once();
  v1 = sub_237F44A50();
  sub_237F2B010(v1, (uint64_t)qword_2568A99B8);
  sub_237F44F78();
}

void sub_237F3D130()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  sub_237F2D8B4();
  v25 = v0;
  v26 = v1;
  v3 = v2;
  v5 = v4;
  v24 = v6;
  v7 = sub_237F171BC(&qword_2568A9AF0);
  v8 = *(_QWORD *)(v7 - 8);
  v23 = v7;
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = sub_237F171BC(v3);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_237F171BC(&qword_2568A9AC8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_237F44FE0();
  sub_237F450FC((uint64_t)v16, v18, v19, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v5, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v24, v7);
  v20 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v21 = (v12 + *(unsigned __int8 *)(v8 + 80) + v20) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = 0;
  *(_QWORD *)(v22 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v22 + v20, v13, v10);
  sub_237F45944(v22 + v21, (uint64_t)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v8 + 32));
  sub_237F4BAA4((uint64_t)v16, v26, v22);
  swift_release();
  sub_237F2D4A8();
}

uint64_t sub_237F3D2BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[4] = a4;
  v5[5] = a5;
  v5[6] = type metadata accessor for AssetDownloadResponse();
  v5[7] = swift_task_alloc();
  v5[8] = sub_237F171BC(&qword_2568A91F0);
  v5[9] = swift_task_alloc();
  v6 = sub_237F171BC(&qword_2568A9B08);
  v5[10] = v6;
  v5[11] = *(_QWORD *)(v6 - 8);
  v5[12] = swift_task_alloc();
  v5[13] = sub_237F171BC(&qword_2568A9A48);
  v5[14] = swift_task_alloc();
  v5[15] = swift_task_alloc();
  sub_237F171BC(&qword_2568A9A50);
  v5[16] = swift_task_alloc();
  v7 = sub_237F171BC(&qword_2568A9A58);
  v5[17] = v7;
  v5[18] = *(_QWORD *)(v7 - 8);
  v5[19] = swift_task_alloc();
  return swift_task_switch();
}

void sub_237F3D3F4()
{
  sub_237F171BC(&qword_2568A9A30);
  sub_237F455F8();
}

uint64_t sub_237F3D428()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v1;
  *v1 = v0;
  v1[1] = sub_237F3D464;
  sub_237F44A18();
  return sub_237F44A90();
}

uint64_t sub_237F3D464()
{
  sub_237F449A0();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F3D4B0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v4;
  uint64_t v5;
  int EnumCaseMultiPayload;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v1 = *(_QWORD *)(v0 + 128);
  sub_237F44B1C();
  if (v2)
  {
    sub_237F44BF8(*(_QWORD *)(v0 + 144));
    sub_237F45160();
    sub_237F44A48();
    sub_237F34D9C();
    sub_237F449EC();
    sub_237F34D94();
    sub_237F44A9C();
    sub_237F44A80();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 112);
    v4 = *(_QWORD *)(v0 + 120);
    sub_237F457F8(v1, v4);
    sub_237F44534(v4, v5, &qword_2568A9A48);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v7 = *(_QWORD **)(v0 + 112);
    v8 = *(_QWORD **)(v0 + 72);
    if (EnumCaseMultiPayload == 1)
    {
      *v8 = *v7;
    }
    else
    {
      v10 = *(_QWORD *)(v0 + 48);
      v9 = *(_QWORD *)(v0 + 56);
      sub_237F1F798((uint64_t)v7, v9, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
      sub_237F20E2C(v9 + *(int *)(v10 + 20), (uint64_t)v8, type metadata accessor for Asset);
      sub_237F45A1C();
    }
    sub_237F45494();
    swift_storeEnumTagMultiPayload();
    v11 = *(_QWORD *)(v0 + 120);
    v13 = *(_QWORD *)(v0 + 88);
    v12 = *(_QWORD *)(v0 + 96);
    sub_237F171BC(&qword_2568A9AF0);
    AsyncThrowingStream.Continuation.yield(_:)();
    sub_237F44EAC(v12, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
    sub_237F44560(v11, &qword_2568A9A48);
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v14;
    *v14 = v0;
    v14[1] = sub_237F3D648;
    sub_237F44A18();
    return sub_237F44ECC();
  }
}

uint64_t sub_237F3D648()
{
  sub_237F449A0();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F3D694()
{
  uint64_t v0;

  sub_237F44BF8(*(_QWORD *)(v0 + 144));
  *(_QWORD *)(v0 + 24) = *(_QWORD *)(v0 + 16);
  sub_237F171BC(&qword_2568A9AF0);
  sub_237F458B0();
  sub_237F45160();
  sub_237F44A48();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  sub_237F44A9C();
  sub_237F44A80();
  return sub_237F44A88(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t AssetManager.process(request:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return sub_237F452AC();
}

{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return sub_237F452AC();
}

uint64_t sub_237F3D720()
{
  uint64_t v0;
  __n128 *v1;
  _QWORD *v2;
  uint64_t v3;

  sub_237F171BC(&qword_2568A99E8);
  sub_237F45344();
  v1 = (__n128 *)sub_237F449C8();
  *(_QWORD *)(v0 + 32) = v1;
  sub_237F44B5C(v1, (__n128)xmmword_237F5D500);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  v3 = sub_237F458F4(v2, (uint64_t)sub_237F3D7A0);
  return AssetManager.process(requests:)(v3);
}

uint64_t sub_237F3D7A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_237F44F20();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)(v2 + 56) = v0;
  }
  sub_237F449B0();
  return sub_237F44B70();
}

uint64_t sub_237F3D7F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = *(_QWORD *)(v0 + 56);
  type metadata accessor for AssetUploadCoordinator();
  v2 = sub_237F458E8();
  swift_defaultActor_initialize();
  *(_QWORD *)(v2 + 112) = v1;
  v3 = sub_237F45284();
  return sub_237F45328(v3, v4);
}

uint64_t sub_237F3D82C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237F3D9DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  os_log_type_t v21;
  _DWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v33;

  sub_237F45660();
  if (qword_2568A8F48 != -1)
    swift_once();
  v19 = sub_237F44A50();
  v20 = (void *)sub_237F2B010(v19, (uint64_t)qword_2568A99B8);
  v18[40] = (uint64_t)v20;
  sub_237F44D44();
  sub_237F45418();
  v21 = sub_237F44EA4();
  if (sub_237F455CC(v21))
  {
    v22 = (_DWORD *)sub_237F44998();
    sub_237F44998();
    *v22 = 136315394;
    sub_237F45344();
    sub_237F45808();
    sub_237F45894();
  }
  sub_237F44A58();

  sub_237F45538(v18[7]);
  v33 = (char *)&dword_2568A9A08 + dword_2568A9A08;
  sub_237F45980();
  v23 = (_QWORD *)swift_task_alloc();
  v18[41] = (uint64_t)v23;
  *v23 = v18;
  v23[1] = sub_237F3DBCC;
  sub_237F45728();
  return v27(v24, v25, v26, v27, v28, v29, v30, v31, a9, a10, a11, a12, a13, v33, a15, a16, a17, a18);
}

uint64_t sub_237F3DBCC()
{
  uint64_t v0;
  uint64_t v1;

  sub_237F44A60();
  sub_237F4540C();
  *(_QWORD *)(v1 + 336) = v0;
  swift_task_dealloc();
  sub_237F45960();
  sub_237F449B0();
  return sub_237F449BC();
}

uint64_t sub_237F3DC20()
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
  _QWORD *v9;
  _QWORD *v10;
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

  v21 = *(_QWORD *)(v0 + 288);
  v1 = *(_QWORD *)(v0 + 224);
  v12 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 200);
  v13 = *(_QWORD *)(v0 + 208);
  v14 = *(_QWORD *)(v0 + 232);
  v3 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 192);
  v15 = *(_QWORD *)(v0 + 144);
  v16 = *(_QWORD *)(v0 + 136);
  v5 = *(_QWORD *)(v0 + 120);
  v17 = *(_QWORD *)(v0 + 128);
  v18 = *(_QWORD *)(v0 + 152);
  v7 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 112);
  v19 = *(_QWORD *)(v0 + 48);
  v20 = *(_QWORD *)(v0 + 64);
  v8 = *MEMORY[0x24BEE6CA0];
  *(_DWORD *)(v0 + 368) = v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v2, v8, v3);
  static AsyncThrowingStream.makeStream<>(of:throwing:bufferingPolicy:)();
  sub_237F44D34(v2, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v14, v1, v13);
  sub_237F171BC(&qword_2568A9AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 104))(v5, v8, v7);
  static AsyncThrowingStream.makeStream<>(of:throwing:bufferingPolicy:)();
  sub_237F453A4(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v18, v15, v17);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 344) = v9;
  v9[2] = v21;
  v9[3] = v18;
  v9[4] = v14;
  v9[5] = v19;
  v9[6] = v20;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 352) = v10;
  sub_237F171BC(&qword_2568A9AB0);
  *v10 = v0;
  v10[1] = sub_237F3DE0C;
  sub_237F449B0();
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

uint64_t sub_237F3DE0C()
{
  uint64_t v0;
  uint64_t v1;

  sub_237F44A60();
  sub_237F4540C();
  *(_QWORD *)(v1 + 360) = v0;
  swift_task_dealloc();
  sub_237F34D9C();
  sub_237F449B0();
  return sub_237F449BC();
}

uint64_t sub_237F3DE5C()
{
  uint64_t v0;

  sub_237F44B00();
  sub_237F44CA0();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  sub_237F44A9C();
  sub_237F44A80();
  sub_237F44AC0();
  sub_237F44BF0();
  sub_237F44F44();
  sub_237F44A48();
  sub_237F45744();
  sub_237F45444();
  sub_237F4543C();
  return sub_237F44D90(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F3DEBC()
{
  uint64_t v0;
  NSObject *v1;
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
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

  v1 = *(NSObject **)(v0 + 320);
  v27 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain_n();
  Logger.logObject.getter();
  sub_237F454D4();
  if (sub_237F454C0(v1))
  {
    v2 = (_DWORD *)sub_237F44998();
    sub_237F44998();
    *v2 = 136315138;
    type metadata accessor for AssetSkeleton();
    sub_237F45980();
    sub_237F45894();
  }
  sub_237F44A58();

  v3 = *(unsigned int *)(v0 + 368);
  v26 = *(_QWORD *)(v0 + 288);
  v4 = *(_QWORD *)(v0 + 264);
  v24 = *(_QWORD *)(v0 + 280);
  v25 = *(_QWORD *)(v0 + 272);
  v5 = *(_QWORD *)(v0 + 256);
  v14 = *(_QWORD *)(v0 + 240);
  v15 = *(_QWORD *)(v0 + 248);
  v21 = *(_QWORD *)(v0 + 216);
  v22 = *(_QWORD *)(v0 + 208);
  v23 = *(_QWORD *)(v0 + 232);
  v6 = *(_QWORD *)(v0 + 176);
  v16 = *(_QWORD *)(v0 + 168);
  v17 = *(_QWORD *)(v0 + 160);
  v20 = *(_QWORD *)(v0 + 152);
  v18 = *(_QWORD *)(v0 + 136);
  v19 = *(_QWORD *)(v0 + 128);
  v8 = *(_QWORD *)(v0 + 88);
  v7 = *(_QWORD *)(v0 + 96);
  v9 = *(_QWORD *)(v0 + 72);
  v10 = *(_QWORD *)(v0 + 80);
  (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v5, v4);
  *(_QWORD *)(sub_237F45814() + 16) = v6;
  sub_237F171BC(&qword_2568A91F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 104))(v8, v3, v9);
  AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
  sub_237F34D9C();
  type metadata accessor for AssetsUploadCoordinator();
  sub_237F4517C();
  sub_237F1DE20(v27, v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v6, v17);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v4, v14);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v22);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v25);
  swift_task_dealloc();
  sub_237F44A80();
  sub_237F44A9C();
  sub_237F44F44();
  sub_237F34D94();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_237F44BF0();
  sub_237F449EC();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_237F34D9C();
  sub_237F44AC0();
  v11 = sub_237F45284();
  return v12(v11);
}

uint64_t sub_237F3E1C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_237F44B00();
  v7 = *(_QWORD *)(v0 + 280);
  v8 = *(_QWORD *)(v0 + 272);
  v9 = *(_QWORD *)(v0 + 288);
  v1 = *(_QWORD *)(v0 + 248);
  v2 = *(_QWORD *)(v0 + 232);
  v3 = *(_QWORD *)(v0 + 216);
  v4 = *(_QWORD *)(v0 + 152);
  v5 = *(_QWORD *)(v0 + 136);
  sub_237F44BF8(*(_QWORD *)(v0 + 168));
  sub_237F451B8(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_237F4589C(v4, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  sub_237F44F4C(v2, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v8);
  sub_237F44CA0();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  sub_237F44A9C();
  sub_237F44A80();
  sub_237F44AC0();
  sub_237F44BF0();
  sub_237F44F44();
  sub_237F44A48();
  sub_237F45744();
  sub_237F45444();
  sub_237F4543C();
  return sub_237F44D90(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F3E298()
{
  uint64_t v0;
  __n128 *v1;
  _QWORD *v2;
  uint64_t v3;

  sub_237F171BC(&qword_2568A9A20);
  sub_237F221C0();
  v1 = (__n128 *)sub_237F449C8();
  *(_QWORD *)(v0 + 32) = v1;
  sub_237F44B5C(v1, (__n128)xmmword_237F5D500);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  v3 = sub_237F458F4(v2, (uint64_t)sub_237F3E318);
  return AssetManager.process(requests:)(v3);
}

uint64_t sub_237F3E318()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_237F44F20();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)(v2 + 56) = v0;
  }
  sub_237F449B0();
  return sub_237F44B70();
}

uint64_t sub_237F3E368()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = *(_QWORD *)(v0 + 56);
  type metadata accessor for AssetDownloadCoordinator();
  v2 = sub_237F458E8();
  swift_defaultActor_initialize();
  *(_QWORD *)(v2 + 112) = v1;
  v3 = sub_237F45284();
  return sub_237F45328(v3, v4);
}

uint64_t sub_237F3E430()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  _DWORD *v4;
  _QWORD *v5;
  uint64_t v6;

  sub_237F45660();
  if (qword_2568A8F48 != -1)
    swift_once();
  v2 = sub_237F44A50();
  sub_237F44D18(v2, (uint64_t)qword_2568A99B8);
  sub_237F45418();
  v3 = sub_237F44EA4();
  if (sub_237F455CC(v3))
  {
    v4 = (_DWORD *)sub_237F44998();
    sub_237F44998();
    *v4 = 136315394;
    sub_237F221C0();
    sub_237F45808();
    sub_237F45894();
  }
  sub_237F44A58();

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 120) = v5;
  *v5 = v1;
  v5[1] = sub_237F3E5EC;
  sub_237F45728();
  return AssetManager.process(requests:)(v6);
}

uint64_t sub_237F3E5EC()
{
  uint64_t v0;
  uint64_t v1;

  sub_237F44A60();
  sub_237F4540C();
  *(_QWORD *)(v1 + 128) = v0;
  swift_task_dealloc();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F3E638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  sub_237F44C4C();
  v13 = v12[11];
  v14 = v12[12];
  v16 = v12[9];
  v15 = v12[10];
  v17 = v12[7];
  v18 = v12[6];
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v16 + 16))(v15, v13, v12[8]);
  type metadata accessor for AssetsDownloadCoordinator();
  sub_237F4517C();
  v19 = sub_237F22570(v15);
  _s10CloudAsset21UploadResponseMessageOwst_0(v17, 1, 1, v14);
  v20 = (_QWORD *)sub_237F45A28();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = v19;
  v20[5] = v18;
  swift_retain();
  sub_237F3B844(v17, (uint64_t)&unk_2568A9AD8, (uint64_t)v20);
  swift_release();
  sub_237F44F4C(v13, *(uint64_t (**)(uint64_t, uint64_t))(v16 + 8));
  sub_237F44A9C();
  sub_237F34D94();
  sub_237F449EC();
  sub_237F34D9C();
  sub_237F45284();
  sub_237F454DC();
  return v22(v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12);
}

uint64_t sub_237F3E718()
{
  uint64_t v0;

  swift_task_dealloc();
  sub_237F44A48();
  sub_237F34D9C();
  sub_237F449EC();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237F3E768(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;

  v39 = a5;
  v40 = a6;
  v36 = a4;
  v37 = a1;
  v33 = a2;
  v34 = a3;
  v46 = sub_237F171BC(&qword_2568A9B20);
  v42 = *(_QWORD *)(v46 - 8);
  v38 = *(_QWORD *)(v42 + 64);
  MEMORY[0x24BDAC7A8](v46);
  v45 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = sub_237F171BC(&qword_2568A92D8);
  v41 = *(_QWORD *)(v44 - 8);
  v7 = *(_QWORD *)(v41 + 64);
  MEMORY[0x24BDAC7A8](v44);
  v43 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_237F171BC(&qword_2568A9A98);
  v9 = *(_QWORD *)(v8 - 8);
  v31 = v8;
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v32 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_237F171BC(&qword_2568A9A00);
  v12 = *(_QWORD *)(v11 - 8);
  v30 = v11;
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_237F171BC(&qword_2568A9AC8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = v17;
  v18 = type metadata accessor for TaskPriority();
  _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v17, 1, 1, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v33, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v34, v8);
  v19 = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v43, v36, v44);
  v20 = v42;
  (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v45, v37, v46);
  v21 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v22 = (v13 + *(unsigned __int8 *)(v9 + 80) + v21) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v23 = (v10 + *(unsigned __int8 *)(v19 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v24 = (v7 + *(unsigned __int8 *)(v20 + 80) + v23) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v25 = (v38 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = 0;
  *(_QWORD *)(v26 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v26 + v21, v14, v30);
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v26 + v22, v32, v31);
  (*(void (**)(unint64_t, char *, uint64_t))(v41 + 32))(v26 + v23, v43, v44);
  (*(void (**)(unint64_t, char *, uint64_t))(v42 + 32))(v26 + v24, v45, v46);
  v27 = v40;
  *(_QWORD *)(v26 + v25) = v39;
  *(_QWORD *)(v26 + ((v25 + 15) & 0xFFFFFFFFFFFFFFF8)) = v27;
  swift_bridgeObjectRetain();
  sub_237F4BAA4((uint64_t)v35, (uint64_t)&unk_2568A9B30, v26);
  return swift_release();
}

uint64_t sub_237F3EA5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8[19] = a7;
  v8[20] = a8;
  v8[17] = a5;
  v8[18] = a6;
  v8[16] = a4;
  v9 = sub_237F171BC(&qword_2568A92C8);
  v8[21] = v9;
  v8[22] = *(_QWORD *)(v9 - 8);
  v8[23] = swift_task_alloc();
  v10 = sub_237F171BC(&qword_2568A9B38);
  v8[24] = v10;
  v8[25] = *(_QWORD *)(v10 - 8);
  v8[26] = swift_task_alloc();
  v8[27] = sub_237F171BC(&qword_2568A9AA8);
  v8[28] = swift_task_alloc();
  v8[29] = swift_task_alloc();
  v8[30] = swift_task_alloc();
  v8[31] = type metadata accessor for UploadResponseMessage();
  v8[32] = swift_task_alloc();
  sub_237F171BC(&qword_2568A9B40);
  v8[33] = swift_task_alloc();
  v11 = sub_237F171BC(&qword_2568A9B48);
  v8[34] = v11;
  v8[35] = *(_QWORD *)(v11 - 8);
  v8[36] = swift_task_alloc();
  return swift_task_switch();
}

void sub_237F3EBAC()
{
  sub_237F171BC(&qword_2568A9A00);
  sub_237F455F8();
}

uint64_t sub_237F3EBE0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 296) = v1;
  *v1 = v0;
  v1[1] = sub_237F3EC1C;
  sub_237F44A18();
  return sub_237F44A90();
}

uint64_t sub_237F3EC1C()
{
  _BYTE *v0;
  uint64_t v1;

  sub_237F45908();
  sub_237F449A0();
  if (v1)
    v0[1] = 0;
  else
    *v0 = 0;
  sub_237F449B0();
  return sub_237F449BC();
}

uint64_t sub_237F3EC68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  NSObject *v32;
  uint64_t v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t EnumCaseMultiPayload;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  sub_237F44B00();
  a23 = v25;
  a24 = v26;
  a22 = v24;
  v27 = *(_QWORD *)(v24 + 264);
  v28 = *(_QWORD *)(v24 + 248);
  sub_237F2D4CC(v27, 1, v28);
  if (v30)
  {
    v31 = *(_BYTE *)(v24 + 320);
    sub_237F44BF8(*(_QWORD *)(v24 + 280));
    if ((v31 & 1) == 0)
    {
      if (qword_2568A8F48 != -1)
        swift_once();
      v32 = *(NSObject **)(v24 + 160);
      v33 = sub_237F44A50();
      sub_237F2B010(v33, (uint64_t)qword_2568A99B8);
      sub_237F44D44();
      sub_237F45834();
      v34 = sub_237F44F18();
      if (sub_237F44DC8(v34))
      {
        v35 = (uint8_t *)sub_237F44998();
        a13 = sub_237F44998();
        *(_DWORD *)v35 = 136315138;
        v36 = sub_237F45344();
        v37 = swift_bridgeObjectRetain();
        v38 = MEMORY[0x23B827CFC](v37, v36);
        v40 = v39;
        sub_237F342C4();
        *(_QWORD *)(v24 + 88) = sub_237F42698(v38, v40, &a13);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        sub_237F44F54();
        sub_237F44A58();
        sub_237F44C44(&dword_237F15000, v32, (os_log_type_t)v28, "ephemeral asset not received for request %s", v35);
        sub_237F449F4();
        sub_237F4498C();
      }
      sub_237F44A58();

      sub_237F19568();
      *(_QWORD *)(v24 + 64) = sub_237F1BD00();
      sub_237F171BC(&qword_2568A9B20);
      CheckedContinuation.resume(throwing:)();
    }
    *(_QWORD *)(v24 + 72) = 0;
    sub_237F171BC(&qword_2568A92D8);
    sub_237F458BC();
    *(_QWORD *)(v24 + 80) = 0;
    sub_237F171BC(&qword_2568A9A98);
    AsyncThrowingStream.Continuation.finish(throwing:)();
    sub_237F45068();
    sub_237F44A48();
    sub_237F34D9C();
    sub_237F449EC();
    sub_237F34D94();
    sub_237F44A9C();
    sub_237F44A80();
    sub_237F44AC0();
    return sub_237F44D90(*(uint64_t (**)(void))(v24 + 8));
  }
  else
  {
    sub_237F45800(v27, v29, (uint64_t (*)(_QWORD))type metadata accessor for UploadResponseMessage);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_237F3EE24 + 4 * byte_237F5FE38[EnumCaseMultiPayload]))(EnumCaseMultiPayload, v42, v43, v44, v45, v46, v47, v48, a9, a10, a11, a12, a13, a14, a15, a16);
  }
}

uint64_t sub_237F3F2BC()
{
  _BYTE *v0;
  uint64_t v1;

  sub_237F45908();
  sub_237F449A0();
  if (v1)
    v0[1] = 1;
  else
    *v0 = 1;
  sub_237F449B0();
  return sub_237F449BC();
}

uint64_t sub_237F3F30C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_BYTE *)(v2 + 321) = *(_BYTE *)(v2 + 320);
  sub_237F449B0();
  return sub_237F449BC();
}

void sub_237F3F36C()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  sub_237F44B00();
  v1 = *(_BYTE *)(v0 + 321);
  sub_237F44BF8(*(_QWORD *)(v0 + 280));
  if ((v1 & 1) == 0)
  {
    if (qword_2568A8F48 != -1)
      swift_once();
    v2 = sub_237F44A50();
    sub_237F2B010(v2, (uint64_t)qword_2568A99B8);
    swift_bridgeObjectRetain();
    sub_237F44F78();
  }
  *(_QWORD *)(v0 + 32) = *(_QWORD *)(v0 + 16);
  sub_237F44F78();
}

uint64_t sub_237F3F608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[5] = a4;
  v5 = sub_237F171BC(&qword_2568A9AE8);
  v4[6] = v5;
  v4[7] = *(_QWORD *)(v5 - 8);
  v6 = swift_task_alloc();
  v7 = OBJC_IVAR____TtC10CloudAsset25AssetsDownloadCoordinator__signals;
  v4[8] = v6;
  v4[9] = v7;
  return swift_task_switch();
}

uint64_t sub_237F3F674()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = sub_237F171BC(&qword_2568A91B0);
  MEMORY[0x23B827DB0](v1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v2;
  sub_237F45130(v2);
  return sub_237F44B3C();
}

uint64_t sub_237F3F6E8()
{
  sub_237F44A60();
  sub_237F449A0();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F3F72C()
{
  _QWORD *v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t (*v9)(void);
  _QWORD *v11;
  uint64_t v12;

  v2 = v0[2];
  if (v2)
  {
    if (qword_2568A8F48 != -1)
      swift_once();
    v3 = sub_237F44A50();
    v4 = sub_237F2B010(v3, (uint64_t)qword_2568A99B8);
    sub_237F44FB0();
    Logger.logObject.getter();
    v5 = sub_237F454D4();
    if (sub_237F44DC8(v5))
    {
      v6 = sub_237F44998();
      v12 = sub_237F44998();
      *(_DWORD *)v6 = 136315138;
      v0[4] = v2;
      sub_237F44FB0();
      v7 = String.init<A>(describing:)();
      *(_QWORD *)(v6 + 4) = sub_237F42698(v7, v8, &v12);
      sub_237F342C4();
      sub_237F44A58();
      sub_237F44C44(&dword_237F15000, v4, v1, "received signal %s", (uint8_t *)v6);
      sub_237F449F4();
      sub_237F4498C();
    }
    sub_237F44A58();

    v11 = (_QWORD *)swift_task_alloc();
    v0[11] = v11;
    sub_237F45130(v11);
    return sub_237F44ECC();
  }
  else
  {
    sub_237F453EC(v0[7]);
    sub_237F44A48();
    v9 = (uint64_t (*)(void))sub_237F44B7C();
    return v9();
  }
}

uint64_t sub_237F3F8BC()
{
  sub_237F44A60();
  sub_237F449A0();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F3F900()
{
  uint64_t v0;

  sub_237F450E8(*(_QWORD *)(v0 + 56));
  sub_237F34D9C();
  return sub_237F44A88(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t AssetManager.deinit()
{
  uint64_t v0;

  sub_237F172A0(v0 + 16);
  return v0;
}

uint64_t AssetManager.__deallocating_deinit()
{
  uint64_t v0;

  sub_237F172A0(v0 + 16);
  return swift_deallocClassInstance();
}

void sub_237F3F978()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  sub_237F2D8B4();
  v22 = v0;
  v23 = v1;
  v20 = v2;
  v21 = v3;
  v24 = sub_237F171BC(v4);
  v5 = *(_QWORD *)(v24 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v24);
  v19 = (uint64_t)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_237F18108();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v18 - v12;
  sub_237F45828((uint64_t)&v18 - v12);
  sub_237F45944((uint64_t)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v20, *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v5 + 16));
  sub_237F45828((uint64_t)v11);
  v14 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v15 = (v6 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  v16 = (*(unsigned __int8 *)(v8 + 80) + v15 + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v17 = swift_allocObject();
  sub_237F45944(v17 + v14, v19, *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v5 + 32));
  *(_QWORD *)(v17 + v15) = v22;
  sub_237F45084(v17 + v16, (uint64_t)v11, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 32));
  swift_beginAccess();
  swift_retain();
  sub_237F4F33C(v23, v17, (uint64_t)v13);
  sub_237F44C3C((uint64_t)v13, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  swift_endAccess();
  sub_237F2D4A8();
}

uint64_t sub_237F3FB08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  _QWORD v18[3];
  uint64_t v19;

  v6 = type metadata accessor for UploadResponseMessage();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_237F171BC(&qword_2568A9C70);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t *)(a1 + *(int *)(type metadata accessor for XPCAsyncSequenceResponse() + 20));
  v12 = v11[1];
  if (v12 >> 60 == 11)
  {
    sub_237F443BC();
    v13 = swift_allocError();
    *v14 = 1;
    v19 = v13;
  }
  else
  {
    if (v12 >> 60 != 15)
    {
      v18[1] = a4;
      v17 = *v11;
      type metadata accessor for JSONDecoder();
      swift_allocObject();
      sub_237F17134(v17, v12);
      JSONDecoder.init()();
      sub_237F173F0(&qword_2568A9C78, (uint64_t (*)(uint64_t))type metadata accessor for UploadResponseMessage, (uint64_t)&protocol conformance descriptor for UploadResponseMessage);
      dispatch thunk of JSONDecoder.decode<A>(_:from:)();
      swift_release();
      sub_237F171BC(&qword_2568A9C48);
      AsyncThrowingStream.Continuation.yield(_:)();
      sub_237F44408(v17, v12);
      return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
    v19 = 0;
  }
  sub_237F171BC(&qword_2568A9C48);
  AsyncThrowingStream.Continuation.finish(throwing:)();
  swift_beginAccess();
  v15 = sub_237F4F1F4(a4);
  result = swift_endAccess();
  if (v15)
    return sub_237F443F8(v15);
  return result;
}

uint64_t sub_237F3FDB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  _QWORD v18[3];
  uint64_t v19;

  v6 = type metadata accessor for DownloadResponseMessage();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_237F171BC(&qword_2568A9C00);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t *)(a1 + *(int *)(type metadata accessor for XPCAsyncSequenceResponse() + 20));
  v12 = v11[1];
  if (v12 >> 60 == 11)
  {
    sub_237F443BC();
    v13 = swift_allocError();
    *v14 = 1;
    v19 = v13;
  }
  else
  {
    if (v12 >> 60 != 15)
    {
      v18[1] = a4;
      v17 = *v11;
      type metadata accessor for JSONDecoder();
      swift_allocObject();
      sub_237F17134(v17, v12);
      JSONDecoder.init()();
      sub_237F173F0(&qword_2568A9C10, (uint64_t (*)(uint64_t))type metadata accessor for DownloadResponseMessage, (uint64_t)&protocol conformance descriptor for DownloadResponseMessage);
      dispatch thunk of JSONDecoder.decode<A>(_:from:)();
      swift_release();
      sub_237F171BC(&qword_2568A9BC0);
      AsyncThrowingStream.Continuation.yield(_:)();
      sub_237F44408(v17, v12);
      return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
    v19 = 0;
  }
  sub_237F171BC(&qword_2568A9BC0);
  AsyncThrowingStream.Continuation.finish(throwing:)();
  swift_beginAccess();
  v15 = sub_237F4F1F4(a4);
  result = swift_endAccess();
  if (v15)
    return sub_237F443F8(v15);
  return result;
}

uint64_t sub_237F40068(__int128 *a1, uint64_t a2)
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

uint64_t sub_237F40080(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v4 + 40) = a2;
  *(_QWORD *)(v4 + 48) = v3;
  *(_BYTE *)(v4 + 25) = a3;
  *(_QWORD *)(v4 + 32) = a1;
  *(_QWORD *)(v4 + 56) = *v3;
  sub_237F171BC(&qword_2568A9AC8);
  *(_QWORD *)(v4 + 64) = swift_task_alloc();
  v5 = sub_237F171BC(&qword_2568A9C40);
  *(_QWORD *)(v4 + 72) = v5;
  *(_QWORD *)(v4 + 80) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 88) = swift_task_alloc();
  v6 = sub_237F171BC(&qword_2568A9C48);
  *(_QWORD *)(v4 + 96) = v6;
  v7 = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 104) = v7;
  *(_QWORD *)(v4 + 112) = *(_QWORD *)(v7 + 64);
  *(_QWORD *)(v4 + 120) = swift_task_alloc();
  *(_QWORD *)(v4 + 128) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237F40158()
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
  unint64_t v11;
  char *v12;
  uint64_t (*v13)(void);
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  sub_237F45644();
  v2 = *(_QWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 64);
  v7 = *(_QWORD *)(v0 + 72);
  v20 = *(_QWORD *)(v0 + 56);
  v18 = *(_QWORD *)(v0 + 112);
  v19 = *(_QWORD *)(v0 + 48);
  v17 = *(_BYTE *)(v0 + 25);
  v15 = *(_QWORD *)(v0 + 40);
  v16 = *(_QWORD *)(v0 + 104);
  type metadata accessor for UploadResponseMessage();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v5, *MEMORY[0x24BEE6CA0], v7);
  static AsyncThrowingStream.makeStream<>(of:throwing:bufferingPolicy:)();
  sub_237F4589C(v5, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  v8 = sub_237F44FE0();
  sub_237F450FC(v6, v9, v10, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v2, v1, v3);
  *(_QWORD *)(v0 + 16) = v15;
  *(_BYTE *)(v0 + 24) = v17 & 1;
  v11 = (*(unsigned __int8 *)(v16 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v12 = (char *)swift_allocObject();
  *((_QWORD *)v12 + 2) = 0;
  *((_QWORD *)v12 + 3) = 0;
  *((_QWORD *)v12 + 4) = v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 32))(&v12[v11], v2, v3);
  sub_237F44780((uint64_t *)(v0 + 16), (uint64_t)&v12[(v11 + v18 + 7) & 0xFFFFFFFFFFFFFFF8]);
  *(_QWORD *)&v12[(v11 + v18 + 23) & 0xFFFFFFFFFFFFFFF8] = v20;
  sub_237F44FB0();
  swift_retain();
  sub_237F3B844(v6, (uint64_t)&unk_2568A9C58, (uint64_t)v12);
  swift_release();
  sub_237F44EAC(v1, *(uint64_t (**)(uint64_t, uint64_t))(v16 + 8));
  sub_237F44A48();
  sub_237F45744();
  swift_task_dealloc();
  sub_237F34D9C();
  v13 = (uint64_t (*)(void))sub_237F44B7C();
  return sub_237F44AE4(v13);
}

uint64_t sub_237F40310(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v4 + 40) = a2;
  *(_QWORD *)(v4 + 48) = v3;
  *(_BYTE *)(v4 + 25) = a3;
  *(_QWORD *)(v4 + 32) = a1;
  *(_QWORD *)(v4 + 56) = *v3;
  sub_237F171BC(&qword_2568A9AC8);
  *(_QWORD *)(v4 + 64) = swift_task_alloc();
  v5 = sub_237F171BC(&qword_2568A9BB8);
  *(_QWORD *)(v4 + 72) = v5;
  *(_QWORD *)(v4 + 80) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 88) = swift_task_alloc();
  v6 = sub_237F171BC(&qword_2568A9BC0);
  *(_QWORD *)(v4 + 96) = v6;
  v7 = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 104) = v7;
  *(_QWORD *)(v4 + 112) = *(_QWORD *)(v7 + 64);
  *(_QWORD *)(v4 + 120) = swift_task_alloc();
  *(_QWORD *)(v4 + 128) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237F403E8()
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
  unint64_t v10;
  _QWORD *v11;
  uint64_t (*v12)(void);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;

  sub_237F45610();
  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 88);
  v5 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 80);
  v6 = *(_QWORD *)(v0 + 64);
  v15 = *(_QWORD *)(v0 + 120);
  v18 = *(_QWORD *)(v0 + 56);
  v16 = *(_QWORD *)(v0 + 112);
  v17 = *(_QWORD *)(v0 + 48);
  v19 = *(_BYTE *)(v0 + 25) & 1;
  v14 = *(_QWORD *)(v0 + 40);
  type metadata accessor for DownloadResponseMessage();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v3, *MEMORY[0x24BEE6CA0], v5);
  static AsyncThrowingStream.makeStream<>(of:throwing:bufferingPolicy:)();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  v7 = sub_237F44FE0();
  sub_237F450FC(v6, v8, v9, v7);
  sub_237F45084(v15, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
  *(_QWORD *)(v0 + 16) = v14;
  *(_BYTE *)(v0 + 24) = v19;
  v10 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v17;
  sub_237F45084((uint64_t)v11 + v10, v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 32));
  sub_237F442A0((uint64_t *)(v0 + 16), (uint64_t)v11 + ((v10 + v16 + 7) & 0xFFFFFFFFFFFFFFF8));
  *(_QWORD *)((char *)v11 + ((v10 + v16 + 23) & 0xFFFFFFFFFFFFFFF8)) = v18;
  j__swift_bridgeObjectRetain(v14, v19);
  swift_retain();
  sub_237F3B844(v6, (uint64_t)&unk_2568A9BD0, (uint64_t)v11);
  swift_release();
  sub_237F44B90(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_237F34D9C();
  sub_237F44AC0();
  swift_task_dealloc();
  sub_237F44A48();
  v12 = (uint64_t (*)(void))sub_237F44B7C();
  return sub_237F44AA4(v12);
}

uint64_t sub_237F405A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v7 + 96) = a4;
  *(_QWORD *)(v7 + 104) = a5;
  v10 = type metadata accessor for XPCRichError();
  *(_QWORD *)(v7 + 112) = v10;
  *(_QWORD *)(v7 + 120) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v7 + 128) = swift_task_alloc();
  *(_QWORD *)(v7 + 136) = swift_task_alloc();
  *(_QWORD *)(v7 + 144) = swift_task_alloc();
  *(_QWORD *)(v7 + 152) = type metadata accessor for XPCAsyncSequenceRequest();
  *(_QWORD *)(v7 + 160) = swift_task_alloc();
  v11 = type metadata accessor for UUID();
  *(_QWORD *)(v7 + 168) = v11;
  *(_QWORD *)(v7 + 176) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v7 + 184) = swift_task_alloc();
  *(_QWORD *)(v7 + 192) = swift_task_alloc();
  *(_QWORD *)(v7 + 200) = swift_task_alloc();
  *(_QWORD *)(v7 + 208) = swift_task_alloc();
  *(_QWORD *)(v7 + 216) = swift_task_alloc();
  *(_QWORD *)(v7 + 16) = a6;
  *(_BYTE *)(v7 + 24) = a7 & 1;
  return swift_task_switch();
}

uint64_t sub_237F406B8()
{
  uint64_t v0;
  uint64_t v1;

  sub_237F457E4();
  *(_QWORD *)(v1 + 224) = *(_QWORD *)(v0 + 56);
  return sub_237F34CD8();
}

uint64_t sub_237F406EC()
{
  sub_237F3F978();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F40738()
{
  sub_237F45A5C();
  return sub_237F34CD8();
}

uint64_t sub_237F40764()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 240) = sub_237F45508();
  *(_QWORD *)(v1 + 248) = v0;
  sub_237F449B0();
  return sub_237F44B70();
}

uint64_t sub_237F407AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t (*v8)(void);

  sub_237F45644();
  sub_237F45204();
  type metadata accessor for JSONEncoder();
  sub_237F4517C();
  JSONEncoder.init()();
  sub_237F44810();
  sub_237F45870();
  sub_237F457D0();
  if (v4)
  {
    sub_237F453A4(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
    swift_release();
    goto LABEL_5;
  }
  sub_237F45294();
  sub_237F45390();
  v6 = (_QWORD *)*(int *)(v5 + 20);
  *v6 = v2;
  v6[1] = v3;
  sub_237F173F0(&qword_2568A9BF8, (uint64_t (*)(uint64_t))type metadata accessor for XPCAsyncSequenceRequest, (uint64_t)&protocol conformance descriptor for XPCAsyncSequenceRequest);
  sub_237F4546C();
  if (v0)
  {
    v4 = v0;
    sub_237F4436C(*(_QWORD *)(v1 + 160), (uint64_t (*)(_QWORD))type metadata accessor for XPCAsyncSequenceRequest);
LABEL_5:
    sub_237F340D4();
    *(_QWORD *)(v1 + 32) = v4;
    sub_237F45244();
  }
  v7 = sub_237F45458();
  sub_237F45868(v7, (uint64_t (*)(_QWORD))type metadata accessor for XPCAsyncSequenceRequest);
  sub_237F44B90(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  sub_237F449FC();
  sub_237F44A48();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  sub_237F44A9C();
  sub_237F44A80();
  sub_237F44AC0();
  sub_237F44BF0();
  v8 = (uint64_t (*)(void))sub_237F44B7C();
  return sub_237F44AE4(v8);
}

void sub_237F40D2C()
{
  uint64_t v0;

  sub_237F45610();
  *(_QWORD *)(v0 + 32) = *(_QWORD *)(v0 + 248);
  sub_237F44E8C();
}

void sub_237F40D60()
{
  sub_237F171BC(&qword_2568A91E0);
  if ((sub_237F452F0() & 1) != 0)
    sub_237F44D3C();
  sub_237F45924();
}

void sub_237F40F30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (qword_2568A8F60 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 176);
  v2 = sub_237F44A50();
  sub_237F2B010(v2, (uint64_t)qword_2568A9FA0);
  sub_237F44A70(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
  sub_237F44E8C();
}

#error "237F40FEC: call analysis failed (funcsize=43)"

void sub_237F41018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t *a13)
{
  uint64_t *v13;
  uint64_t v14;

  v14 = sub_237F45700();
  *v13 = v14;
  sub_237F44FA8();
  *a13 = v14;
  sub_237F44D3C();
}

void sub_237F41044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, os_log_type_t a11, NSObject *a12)
{
  uint8_t *v12;

  sub_237F44B88(&dword_237F15000, a12, a11, "[message id = %s] failed to send message over XPC due to non-XPC error %@", v12);
  sub_237F171BC(&qword_2568A9B50);
  sub_237F449F4();
  sub_237F4498C();
}

void sub_237F4108C()
{
  sub_237F449F4();
  sub_237F4498C();
}

void sub_237F410AC()
{
  sub_237F4498C();
}

uint64_t sub_237F410B4()
{
  void *v0;
  uint64_t (*v1)(void);

  sub_237F459AC();
  sub_237F171BC(&qword_2568A9C48);
  sub_237F44EF8();
  sub_237F45974();
  sub_237F449FC();
  sub_237F44A48();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  sub_237F44A9C();
  sub_237F44A80();
  sub_237F44AC0();
  sub_237F44BF0();
  v1 = (uint64_t (*)(void))sub_237F44B7C();
  return sub_237F44AA4(v1);
}

uint64_t sub_237F411D0()
{
  sub_237F45844();
  sub_237F449B0();
  return sub_237F34CD8();
}

#error "237F4129C: call analysis failed (funcsize=76)"

uint64_t sub_237F4134C()
{
  uint64_t (*v0)(void);

  sub_237F449FC();
  sub_237F44A48();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  sub_237F44A9C();
  sub_237F44A80();
  sub_237F44AC0();
  sub_237F44BF0();
  v0 = (uint64_t (*)(void))sub_237F44B7C();
  return sub_237F44AC8(v0);
}

uint64_t sub_237F4137C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v7 + 96) = a4;
  *(_QWORD *)(v7 + 104) = a5;
  v10 = type metadata accessor for XPCRichError();
  *(_QWORD *)(v7 + 112) = v10;
  *(_QWORD *)(v7 + 120) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v7 + 128) = swift_task_alloc();
  *(_QWORD *)(v7 + 136) = swift_task_alloc();
  *(_QWORD *)(v7 + 144) = swift_task_alloc();
  *(_QWORD *)(v7 + 152) = type metadata accessor for XPCAsyncSequenceRequest();
  *(_QWORD *)(v7 + 160) = swift_task_alloc();
  v11 = type metadata accessor for UUID();
  *(_QWORD *)(v7 + 168) = v11;
  *(_QWORD *)(v7 + 176) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v7 + 184) = swift_task_alloc();
  *(_QWORD *)(v7 + 192) = swift_task_alloc();
  *(_QWORD *)(v7 + 200) = swift_task_alloc();
  *(_QWORD *)(v7 + 208) = swift_task_alloc();
  *(_QWORD *)(v7 + 216) = swift_task_alloc();
  *(_QWORD *)(v7 + 16) = a6;
  *(_BYTE *)(v7 + 24) = a7 & 1;
  return swift_task_switch();
}

uint64_t sub_237F41494()
{
  uint64_t v0;
  uint64_t v1;

  sub_237F457E4();
  *(_QWORD *)(v1 + 224) = *(_QWORD *)(v0 + 56);
  return sub_237F34CD8();
}

uint64_t sub_237F414C8()
{
  sub_237F3F978();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F41514()
{
  sub_237F45A5C();
  return sub_237F34CD8();
}

uint64_t sub_237F41540()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 240) = sub_237F45508();
  *(_QWORD *)(v1 + 248) = v0;
  sub_237F449B0();
  return sub_237F44B70();
}

uint64_t sub_237F41588()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t (*v8)(void);

  sub_237F45644();
  sub_237F45204();
  type metadata accessor for JSONEncoder();
  sub_237F4517C();
  JSONEncoder.init()();
  sub_237F44330();
  sub_237F45870();
  sub_237F457D0();
  if (v4)
  {
    sub_237F453A4(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
    swift_release();
    goto LABEL_5;
  }
  sub_237F45294();
  sub_237F45390();
  v6 = (_QWORD *)*(int *)(v5 + 20);
  *v6 = v2;
  v6[1] = v3;
  sub_237F173F0(&qword_2568A9BF8, (uint64_t (*)(uint64_t))type metadata accessor for XPCAsyncSequenceRequest, (uint64_t)&protocol conformance descriptor for XPCAsyncSequenceRequest);
  sub_237F4546C();
  if (v0)
  {
    v4 = v0;
    sub_237F4436C(*(_QWORD *)(v1 + 160), (uint64_t (*)(_QWORD))type metadata accessor for XPCAsyncSequenceRequest);
LABEL_5:
    sub_237F340D4();
    *(_QWORD *)(v1 + 32) = v4;
    sub_237F45244();
  }
  v7 = sub_237F45458();
  sub_237F45868(v7, (uint64_t (*)(_QWORD))type metadata accessor for XPCAsyncSequenceRequest);
  sub_237F44B90(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  sub_237F449FC();
  sub_237F44A48();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  sub_237F44A9C();
  sub_237F44A80();
  sub_237F44AC0();
  sub_237F44BF0();
  v8 = (uint64_t (*)(void))sub_237F44B7C();
  return sub_237F44AE4(v8);
}

void sub_237F41B08()
{
  uint64_t v0;

  sub_237F45610();
  *(_QWORD *)(v0 + 32) = *(_QWORD *)(v0 + 248);
  sub_237F44E8C();
}

void sub_237F41B3C()
{
  sub_237F171BC(&qword_2568A91E0);
  if ((sub_237F452F0() & 1) != 0)
    sub_237F44D3C();
  sub_237F45924();
}

void sub_237F41D0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (qword_2568A8F60 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 176);
  v2 = sub_237F44A50();
  sub_237F2B010(v2, (uint64_t)qword_2568A9FA0);
  sub_237F44A70(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
  sub_237F44E8C();
}

#error "237F41DC8: call analysis failed (funcsize=43)"

void sub_237F41DF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t *a13)
{
  uint64_t *v13;
  uint64_t v14;

  v14 = sub_237F45700();
  *v13 = v14;
  sub_237F44FA8();
  *a13 = v14;
  sub_237F44D3C();
}

void sub_237F41E20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, os_log_type_t a11, NSObject *a12)
{
  uint8_t *v12;

  sub_237F44B88(&dword_237F15000, a12, a11, "[message id = %s] failed to send message over XPC due to non-XPC error %@", v12);
  sub_237F171BC(&qword_2568A9B50);
  sub_237F449F4();
  sub_237F4498C();
}

void sub_237F41E68()
{
  sub_237F449F4();
  sub_237F4498C();
}

void sub_237F41E88()
{
  sub_237F4498C();
}

uint64_t sub_237F41E90()
{
  void *v0;
  uint64_t (*v1)(void);

  sub_237F459AC();
  sub_237F171BC(&qword_2568A9BC0);
  sub_237F44EF8();
  sub_237F45974();
  sub_237F449FC();
  sub_237F44A48();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  sub_237F44A9C();
  sub_237F44A80();
  sub_237F44AC0();
  sub_237F44BF0();
  v1 = (uint64_t (*)(void))sub_237F44B7C();
  return sub_237F44AA4(v1);
}

uint64_t sub_237F41FAC()
{
  sub_237F45844();
  sub_237F449B0();
  return sub_237F34CD8();
}

#error "237F42078: call analysis failed (funcsize=76)"

uint64_t sub_237F42128()
{
  uint64_t (*v0)(void);

  sub_237F449FC();
  sub_237F44A48();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  sub_237F44A9C();
  sub_237F44A80();
  sub_237F44AC0();
  sub_237F44BF0();
  v0 = (uint64_t (*)(void))sub_237F44B7C();
  return sub_237F44AC8(v0);
}

char *sub_237F42158(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_237F421DC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (a3 < a1
         || (result = type metadata accessor for CloudAssets_Signal.Event(0),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    type metadata accessor for CloudAssets_Signal.Event(0);
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

uint64_t sub_237F422D8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (a3 < a1
         || (result = sub_237F171BC(&qword_2568A9A60), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    sub_237F171BC(&qword_2568A9A60);
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

void *sub_237F423DC(char *__src, uint64_t a2, char *__dst)
{
  void *result;

  if ((a2 & 0x8000000000000000) == 0 && (&__dst[16 * a2] <= __src || &__src[16 * a2] <= __dst))
    return memcpy(__dst, __src, 16 * a2);
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_237F424A4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for CloudAssets_Signal.Event(0) - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
      return swift_arrayInitWithCopy();
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_237F42598(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(sub_237F171BC(&qword_2568A9A60) - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
      return swift_arrayInitWithCopy();
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_237F42690(uint64_t a1)
{
  uint64_t v1;

  return sub_237F3B044(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_237F42698(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[3];
  uint64_t ObjectType;

  sub_237F449B0();
  v9 = sub_237F42760(v6, v7, v8, 1, a1, a2);
  v10 = v15[0];
  if (v9)
  {
    v11 = v9;
    ObjectType = swift_getObjectType();
    v15[0] = v11;
    v12 = *a3;
    if (*a3)
    {
      sub_237F44590((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v15[0] = a1;
    v15[1] = a2;
    v13 = *a3;
    if (*a3)
    {
      sub_237F44590((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    sub_237F44FB0();
  }
  sub_237F172A0((uint64_t)v15);
  return v10;
}

uint64_t sub_237F42760(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_237F428B4((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_237F42978(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_237F428B4(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_237F42978(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_237F42A0C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_237F42BE0(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_237F42BE0((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_237F42A0C(uint64_t a1, unint64_t a2)
{
  Swift::Int v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = String.UTF8View._foreignCount()();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_237F42B7C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_QWORD *sub_237F42B7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  sub_237F171BC(&qword_2568A9C28);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_237F42BE0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_237F171BC(&qword_2568A9C28);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_237F42D78(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_237F42CB4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_237F42CB4(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_237F42D78(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void sub_237F42DF8()
{
  sub_237F3D130();
}

char *sub_237F42E28(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_237F4353C(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

size_t sub_237F42E44(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_237F4361C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

size_t sub_237F42E60(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_237F4375C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t sub_237F42E7C(uint64_t a1)
{
  uint64_t *v1;

  return sub_237F3BA08(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_237F42E88(uint64_t a1)
{
  uint64_t *v1;

  return sub_237F3E768(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

void sub_237F42E98()
{
  sub_237F3D130();
}

uint64_t sub_237F42EC8()
{
  sub_237F45050();
  sub_237F457F0();
  return swift_deallocObject();
}

uint64_t sub_237F42EEC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_237F45154(v0);
  v2 = sub_237F44CEC(v1);
  return sub_237F3F608(v2, v3, v4, v5);
}

uint64_t sub_237F42F48()
{
  uint64_t v0;

  sub_237F449A0();
  return sub_237F44D0C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t type metadata accessor for AssetManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for AssetManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AssetManager.__allocating_init(serviceName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t storeEnumTagSinglePayload for AssetManager.AssetError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_237F42FF0 + 4 * byte_237F5FE3C[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_237F43010 + 4 * byte_237F5FE41[v4]))();
}

_BYTE *sub_237F42FF0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_237F43010(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F43018(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F43020(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F43028(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F43030(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AssetManager.AssetError()
{
  return &type metadata for AssetManager.AssetError;
}

unint64_t sub_237F43050()
{
  unint64_t result;

  result = qword_2568A9AE0;
  if (!qword_2568A9AE0)
  {
    result = MEMORY[0x23B82832C](&unk_237F5FEBC, &type metadata for AssetManager.AssetError);
    atomic_store(result, (unint64_t *)&qword_2568A9AE0);
  }
  return result;
}

uint64_t sub_237F4308C()
{
  return sub_237F4442C();
}

uint64_t sub_237F43098()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_237F171BC(&qword_2568A9AA0);
  sub_237F44CD4();
  sub_237F171BC(&qword_2568A9AF0);
  sub_237F45010();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_237F45154(v0);
  v2 = sub_237F44CEC(v1);
  return sub_237F39504(v2, v3, v4, v5, v6);
}

uint64_t sub_237F4310C()
{
  uint64_t v0;

  sub_237F449A0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237F43148()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = sub_237F171BC(&qword_2568A9A00);
  v1 = *(_QWORD *)(v17 - 8);
  v13 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v2 = *(_QWORD *)(v1 + 64);
  v16 = sub_237F171BC(&qword_2568A9A98);
  v3 = *(_QWORD *)(v16 - 8);
  v4 = (v13 + v2 + *(unsigned __int8 *)(v3 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v12 = v4;
  v5 = *(_QWORD *)(v3 + 64);
  v15 = sub_237F171BC(&qword_2568A92D8);
  v6 = *(_QWORD *)(v15 - 8);
  v7 = (v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64);
  v14 = sub_237F171BC(&qword_2568A9B20);
  v9 = *(_QWORD *)(v14 - 8);
  v10 = (v7 + v8 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  sub_237F45050();
  (*(void (**)(unint64_t, uint64_t))(v1 + 8))(v0 + v13, v17);
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + v12, v16);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v15);
  (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v0 + v10, v14);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_237F432B4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_237F171BC(&qword_2568A9A00);
  sub_237F44CD4();
  sub_237F171BC(&qword_2568A9A98);
  sub_237F457B4();
  sub_237F171BC(&qword_2568A92D8);
  sub_237F171BC(&qword_2568A9B20);
  sub_237F44F80();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)sub_237F45154(v1);
  *v2 = v0;
  v2[1] = sub_237F44984;
  sub_237F45188();
  sub_237F454DC();
  return sub_237F3EA5C(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_237F43398()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_237F171BC(&qword_2568A9A70);
  sub_237F45764();
  sub_237F459E0();
  sub_237F171BC(&qword_2568A9B58);
  sub_237F45308();
  sub_237F45050();
  sub_237F44D34(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  swift_bridgeObjectRelease();
  sub_237F44C3C(v0 + v4, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_237F43458()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_237F4562C();
  sub_237F171BC(&qword_2568A9A70);
  sub_237F171BC(&qword_2568A9B58);
  sub_237F44F80();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)sub_237F45154(v1);
  *v2 = v0;
  v2[1] = sub_237F44984;
  v3 = sub_237F45188();
  return sub_237F3BC10(v3, v4, v5, v6, v7, v8, v9);
}

void sub_237F43510(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_237F45718(a1, a2, a3);
  sub_237F22430(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  sub_237F18140();
}

char *sub_237F4353C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_237F171BC(&qword_2568A9C90);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_237F42158(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_237F423DC(v13, v8, v12);
  }
  swift_release();
  return v10;
}

size_t sub_237F4361C(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  sub_237F171BC(&qword_2568A9C88);
  v10 = *(_QWORD *)(type metadata accessor for CloudAssets_Signal.Event(0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_24;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CloudAssets_Signal.Event(0) - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = (unint64_t)v13 + v16;
  v18 = a4 + v16;
  if ((v5 & 1) != 0)
  {
    sub_237F421DC(v18, v8, v17);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_237F424A4(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

size_t sub_237F4375C(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  sub_237F171BC(&qword_2568A9BB0);
  v10 = *(_QWORD *)(sub_237F171BC(&qword_2568A9A60) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_24;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(sub_237F171BC(&qword_2568A9A60) - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = (unint64_t)v13 + v16;
  v18 = a4 + v16;
  if ((v5 & 1) != 0)
  {
    sub_237F422D8(v18, v8, v17);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_237F42598(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_237F438A4(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v3;
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
  void (*v17)(uint64_t, char *, uint64_t);
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  _QWORD *v22;
  char v23;
  unint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t result;
  Swift::String v38;
  Swift::String v39;
  _QWORD v40[3];
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;

  v46 = a3;
  v6 = type metadata accessor for AssetDownloadRequest();
  v43 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v45 = (uint64_t)v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for UUID();
  v44 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v47 = (uint64_t)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_237F171BC(&qword_2568A9A60);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(a1 + 16);
  if (!v15)
    return swift_bridgeObjectRelease();
  v40[1] = v3;
  v40[2] = a1;
  v42 = &v14[*(int *)(v11 + 48)];
  v16 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  v41 = *(_QWORD *)(v12 + 72);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_237F44534(v16, (uint64_t)v14, &qword_2568A9A60);
    v17 = *(void (**)(uint64_t, char *, uint64_t))(v44 + 32);
    v18 = v47;
    v19 = v14;
    v20 = v14;
    v21 = v8;
    v17(v47, v20, v8);
    sub_237F1F798((uint64_t)v42, v45, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadRequest);
    v22 = (_QWORD *)*v46;
    v24 = sub_237F4EEE8(v18);
    v25 = v22[2];
    v26 = (v23 & 1) == 0;
    v27 = v25 + v26;
    if (__OFADD__(v25, v26))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
      goto LABEL_20;
    }
    v28 = v23;
    if (v22[3] < v27)
      break;
    if ((a2 & 1) != 0)
    {
      if ((v23 & 1) != 0)
        goto LABEL_14;
    }
    else
    {
      sub_237F171BC(&qword_2568A9BA8);
      _NativeDictionary.copy()();
      if ((v28 & 1) != 0)
        goto LABEL_14;
    }
LABEL_10:
    v31 = v47;
    v32 = (_QWORD *)*v46;
    *(_QWORD *)(*v46 + 8 * (v24 >> 6) + 64) |= 1 << v24;
    v8 = v21;
    v17(v32[6] + *(_QWORD *)(v44 + 72) * v24, (char *)v31, v21);
    sub_237F1F798(v45, v32[7] + *(_QWORD *)(v43 + 72) * v24, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadRequest);
    v33 = v32[2];
    v34 = __OFADD__(v33, 1);
    v35 = v33 + 1;
    if (v34)
      goto LABEL_18;
    v32[2] = v35;
    v16 += v41;
    a2 = 1;
    --v15;
    v14 = v19;
    if (!v15)
      return swift_bridgeObjectRelease_n();
  }
  sub_237F43CBC(v27, a2 & 1);
  v29 = sub_237F4EEE8(v47);
  if ((v28 & 1) != (v30 & 1))
    goto LABEL_19;
  v24 = v29;
  if ((v28 & 1) == 0)
    goto LABEL_10;
LABEL_14:
  v36 = swift_allocError();
  swift_willThrow();
  v50 = v36;
  MEMORY[0x23B8282B4](v36);
  sub_237F171BC(&qword_2568A91E0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_237F4436C(v45, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadRequest);
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v47, v21);
    swift_bridgeObjectRelease();
    return MEMORY[0x23B8282A8](v50);
  }
LABEL_20:
  v48 = 0;
  v49 = 0xE000000000000000;
  _StringGuts.grow(_:)(30);
  v38._object = (void *)0x8000000237F64D50;
  v38._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v38);
  _print_unlocked<A, B>(_:_:)();
  v39._countAndFlagsBits = 39;
  v39._object = (void *)0xE100000000000000;
  String.append(_:)(v39);
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_237F43CBC(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  unint64_t v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t i;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  int64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;

  v3 = v2;
  v5 = type metadata accessor for AssetDownloadRequest();
  v46 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v49 = (uint64_t)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for UUID();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v2;
  sub_237F171BC(&qword_2568A9BA0);
  v48 = a2;
  v12 = static _DictionaryStorage.resize(original:capacity:move:)();
  v13 = v12;
  if (!*(_QWORD *)(v11 + 16))
    goto LABEL_42;
  v14 = 1 << *(_BYTE *)(v11 + 32);
  v15 = *(_QWORD *)(v11 + 64);
  v45 = (_QWORD *)(v11 + 64);
  if (v14 < 64)
    v16 = ~(-1 << v14);
  else
    v16 = -1;
  v17 = v16 & v15;
  v43 = v2;
  v44 = (unint64_t)(v14 + 63) >> 6;
  v18 = v12 + 64;
  swift_retain();
  v19 = 0;
  v20 = v11;
  v47 = v11;
  if (!v17)
    goto LABEL_7;
LABEL_6:
  v21 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (i = v21 | (v19 << 6); ; i = __clz(__rbit64(v25)) + (v19 << 6))
  {
    v27 = *(_QWORD *)(v8 + 72);
    v28 = *(_QWORD *)(v20 + 48) + v27 * i;
    if ((v48 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 32))(v10, v28, v7);
      v29 = *(_QWORD *)(v20 + 56);
      v30 = *(_QWORD *)(v46 + 72);
      sub_237F1F798(v29 + v30 * i, v49, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadRequest);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v10, v28, v7);
      v31 = *(_QWORD *)(v20 + 56);
      v30 = *(_QWORD *)(v46 + 72);
      sub_237F20E2C(v31 + v30 * i, v49, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadRequest);
    }
    sub_237F173F0(&qword_2568A8F70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    v32 = dispatch thunk of Hashable._rawHashValue(seed:)();
    v33 = -1 << *(_BYTE *)(v13 + 32);
    v34 = v32 & ~v33;
    v35 = v34 >> 6;
    if (((-1 << v34) & ~*(_QWORD *)(v18 + 8 * (v34 >> 6))) == 0)
    {
      v37 = 0;
      v38 = (unint64_t)(63 - v33) >> 6;
      while (++v35 != v38 || (v37 & 1) == 0)
      {
        v39 = v35 == v38;
        if (v35 == v38)
          v35 = 0;
        v37 |= v39;
        v40 = *(_QWORD *)(v18 + 8 * v35);
        if (v40 != -1)
        {
          v36 = __clz(__rbit64(~v40)) + (v35 << 6);
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return;
    }
    v36 = __clz(__rbit64((-1 << v34) & ~*(_QWORD *)(v18 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
    *(_QWORD *)(v18 + ((v36 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v36;
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(*(_QWORD *)(v13 + 48) + v27 * v36, v10, v7);
    sub_237F1F798(v49, *(_QWORD *)(v13 + 56) + v30 * v36, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadRequest);
    ++*(_QWORD *)(v13 + 16);
    v20 = v47;
    if (v17)
      goto LABEL_6;
LABEL_7:
    v23 = v19 + 1;
    if (__OFADD__(v19, 1))
      goto LABEL_44;
    if (v23 >= v44)
    {
      swift_release();
      v3 = v43;
      v24 = v45;
      goto LABEL_36;
    }
    v24 = v45;
    v25 = v45[v23];
    ++v19;
    if (!v25)
    {
      v19 = v23 + 1;
      if (v23 + 1 >= v44)
        goto LABEL_34;
      v25 = v45[v19];
      if (!v25)
        break;
    }
LABEL_18:
    v17 = (v25 - 1) & v25;
  }
  v26 = v23 + 2;
  if (v26 < v44)
  {
    v25 = v45[v26];
    if (!v25)
    {
      while (1)
      {
        v19 = v26 + 1;
        if (__OFADD__(v26, 1))
          goto LABEL_45;
        if (v19 >= v44)
          goto LABEL_34;
        v25 = v45[v19];
        ++v26;
        if (v25)
          goto LABEL_18;
      }
    }
    v19 = v26;
    goto LABEL_18;
  }
LABEL_34:
  swift_release();
  v3 = v43;
LABEL_36:
  if ((v48 & 1) != 0)
  {
    v41 = 1 << *(_BYTE *)(v47 + 32);
    if (v41 >= 64)
      sub_237F440D0(0, (unint64_t)(v41 + 63) >> 6, v24);
    else
      *v24 = -1 << v41;
    *(_QWORD *)(v47 + 16) = 0;
  }
LABEL_42:
  swift_release();
  *v3 = v13;
}

uint64_t sub_237F440D0(uint64_t result, uint64_t a2, _QWORD *a3)
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

uint64_t sub_237F440F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v12;
  char v13;
  _QWORD *v14;

  v12 = *(_QWORD *)a6;
  v13 = *(_BYTE *)(a6 + 8);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v14;
  *v14 = v6;
  v14[1] = sub_237F42F48;
  return sub_237F405A0(a1, a2, a3, a4, a5, v12, v13);
}

uint64_t sub_237F44190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v12;
  char v13;
  _QWORD *v14;

  v12 = *(_QWORD *)a6;
  v13 = *(_BYTE *)(a6 + 8);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v14;
  *v14 = v6;
  v14[1] = sub_237F4497C;
  return sub_237F4137C(a1, a2, a3, a4, a5, v12, v13);
}

uint64_t sub_237F44230()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  sub_237F171BC(&qword_2568A9BC0);
  sub_237F44FE8();
  v4 = v3 & 0xFFFFFFFFFFFFFFF8;
  sub_237F45050();
  sub_237F457F0();
  sub_237F44D34(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  j__swift_bridgeObjectRelease(*(_QWORD *)(v0 + v4), *(unsigned __int8 *)(v0 + v4 + 8));
  return sub_237F44F64();
}

uint64_t sub_237F442A0(uint64_t *a1, uint64_t a2)
{
  initializeBufferWithCopyOfBuffer for Signal.Event(a2, a1);
  return a2;
}

uint64_t sub_237F442DC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  sub_237F4562C();
  sub_237F171BC(&qword_2568A9BC0);
  sub_237F44BB0();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_237F45154(v0);
  v2 = sub_237F44E2C(v1);
  return sub_237F44EB4(v2, v3, v4, v5, v6, v7, v8, v9);
}

unint64_t sub_237F44330()
{
  unint64_t result;

  result = qword_2568A9BF0;
  if (!qword_2568A9BF0)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for DownloadRequestMessage, &type metadata for DownloadRequestMessage);
    atomic_store(result, (unint64_t *)&qword_2568A9BF0);
  }
  return result;
}

void sub_237F4436C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  sub_237F450E8(*(_QWORD *)(v2 - 8));
  sub_237F18140();
}

uint64_t sub_237F4439C()
{
  return sub_237F44858();
}

uint64_t sub_237F443A8(uint64_t a1)
{
  return sub_237F448E4(a1, &qword_2568A9BC0, (uint64_t (*)(uint64_t, unint64_t, _QWORD, unint64_t))sub_237F3FDB8);
}

unint64_t sub_237F443BC()
{
  unint64_t result;

  result = qword_2568A9C08;
  if (!qword_2568A9C08)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for XPCError, &type metadata for XPCError);
    atomic_store(result, (unint64_t *)&qword_2568A9C08);
  }
  return result;
}

uint64_t sub_237F443F8(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_237F44408(uint64_t a1, unint64_t a2)
{
  if (((a2 >> 60) | 4) != 0xF)
    return sub_237F17178(a1, a2);
  return a1;
}

uint64_t sub_237F44420()
{
  return sub_237F4442C();
}

uint64_t sub_237F4442C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  sub_237F2D8B4();
  v2 = *(_QWORD *)(sub_237F171BC(v1) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  v5 = *(_QWORD *)(sub_237F171BC(&qword_2568A9AF0) - 8);
  v6 = (v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_237F45050();
  sub_237F44D34(v0 + v3, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_237F44C3C(v0 + v6, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  return sub_237F44B44();
}

uint64_t sub_237F444C0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_237F171BC(&qword_2568A9A30);
  sub_237F44CD4();
  sub_237F171BC(&qword_2568A9AF0);
  sub_237F45010();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_237F45154(v0);
  v2 = sub_237F44CEC(v1);
  return sub_237F3D2BC(v2, v3, v4, v5, v6);
}

void sub_237F44534(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_237F45718(a1, a2, a3);
  sub_237F22430(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  sub_237F18140();
}

void sub_237F44560(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = sub_237F171BC(a2);
  sub_237F450E8(*(_QWORD *)(v2 - 8));
  sub_237F18140();
}

uint64_t sub_237F44590(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_237F445CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  sub_237F2D8B4();
  sub_237F171BC(&qword_2568A9A00);
  sub_237F45764();
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(_QWORD *)(sub_237F171BC(&qword_2568A9AF0) - 8);
  v5 = (v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  sub_237F45050();
  sub_237F44D34(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_237F44C3C(v0 + v5, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  return sub_237F44B44();
}

uint64_t sub_237F44664(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  sub_237F171BC(&qword_2568A9A00);
  sub_237F44CD4();
  sub_237F171BC(&qword_2568A9AF0);
  sub_237F457B4();
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v1 + 24);
  v9 = v1 + (v6 & ~v5);
  v10 = swift_task_alloc();
  v11 = (_QWORD *)sub_237F45154(v10);
  *v11 = v2;
  v11[1] = sub_237F4497C;
  return sub_237F3B214(a1, v7, v8, v1 + v3, v9);
}

uint64_t sub_237F44718()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_237F171BC(&qword_2568A9C48);
  sub_237F44FE8();
  sub_237F45050();
  sub_237F457F0();
  sub_237F44D34(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  swift_bridgeObjectRelease();
  return sub_237F44F64();
}

uint64_t sub_237F44780(uint64_t *a1, uint64_t a2)
{
  initializeBufferWithCopyOfBuffer for Signal.Event(a2, a1);
  return a2;
}

uint64_t sub_237F447BC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  sub_237F4562C();
  sub_237F171BC(&qword_2568A9C48);
  sub_237F44BB0();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_237F45154(v0);
  v2 = sub_237F44E2C(v1);
  return sub_237F44EB4(v2, v3, v4, v5, v6, v7, v8, v9);
}

unint64_t sub_237F44810()
{
  unint64_t result;

  result = qword_2568A9C68;
  if (!qword_2568A9C68)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for UploadRequestMessage, &type metadata for UploadRequestMessage);
    atomic_store(result, (unint64_t *)&qword_2568A9C68);
  }
  return result;
}

uint64_t sub_237F4484C()
{
  return sub_237F44858();
}

uint64_t sub_237F44858()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;

  sub_237F2D8B4();
  v4 = *(_QWORD *)(sub_237F171BC(v3) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  sub_237F459E0();
  sub_237F18108();
  sub_237F45308();
  sub_237F44D34(v0 + v5, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  swift_release();
  sub_237F44C3C(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  return sub_237F44B44();
}

uint64_t sub_237F448D0(uint64_t a1)
{
  return sub_237F448E4(a1, &qword_2568A9C48, (uint64_t (*)(uint64_t, unint64_t, _QWORD, unint64_t))sub_237F3FB08);
}

uint64_t sub_237F448E4(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t, unint64_t, _QWORD, unint64_t))
{
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(sub_237F171BC(a2) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  v8 = *(unsigned __int8 *)(*(_QWORD *)(sub_237F18108() - 8) + 80);
  return a3(a1, v3 + v6, *(_QWORD *)(v3 + v7), v3 + ((v7 + v8 + 8) & ~v8));
}

void sub_237F4498C()
{
  JUMPOUT(0x23B8283BCLL);
}

uint64_t sub_237F44998()
{
  return swift_slowAlloc();
}

uint64_t sub_237F449A0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t sub_237F449BC()
{
  return swift_task_switch();
}

uint64_t sub_237F449C8()
{
  return swift_allocObject();
}

uint64_t sub_237F449EC()
{
  return swift_task_dealloc();
}

uint64_t sub_237F449F4()
{
  return swift_arrayDestroy();
}

uint64_t sub_237F449FC()
{
  return swift_task_dealloc();
}

uint64_t sub_237F44A2C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_237F44A48()
{
  return swift_task_dealloc();
}

uint64_t sub_237F44A50()
{
  return type metadata accessor for Logger();
}

uint64_t sub_237F44A58()
{
  return swift_bridgeObjectRelease_n();
}

void sub_237F44A60()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t sub_237F44A70@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v1, v2, v3);
}

uint64_t sub_237F44A80()
{
  return swift_task_dealloc();
}

uint64_t sub_237F44A88(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_237F44A90()
{
  return _sScs8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF();
}

uint64_t sub_237F44A9C()
{
  return swift_task_dealloc();
}

uint64_t sub_237F44AA4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_237F44AC0()
{
  return swift_task_dealloc();
}

uint64_t sub_237F44AC8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_237F44AE4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_237F44B1C()
{
  uint64_t v0;
  uint64_t v1;

  return _s10CloudAsset21UploadResponseMessageOwet_0(v0, 1, v1);
}

uint64_t sub_237F44B3C()
{
  return _sScs8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF();
}

uint64_t sub_237F44B44()
{
  return swift_deallocObject();
}

void sub_237F44B5C(__n128 *a1, __n128 a2)
{
  uint64_t v2;
  uint64_t (*v3)(_QWORD);
  uint64_t v4;

  a1[1] = a2;
  sub_237F20E2C(v2, (uint64_t)a1 + v4, v3);
}

uint64_t sub_237F44B70()
{
  return swift_task_switch();
}

uint64_t sub_237F44B7C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

void sub_237F44B88(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x16u);
}

uint64_t sub_237F44B90@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_237F44BF0()
{
  return swift_task_dealloc();
}

uint64_t sub_237F44BF8@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t sub_237F44C00@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 264) = a1;
  return a1(v1, v2, v3);
}

uint64_t sub_237F44C14()
{
  return swift_task_alloc();
}

uint64_t sub_237F44C28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);

  return v4(a2, v2, v3);
}

uint64_t sub_237F44C3C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void sub_237F44C44(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

void sub_237F44C68(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  NSObject *v5;
  uint8_t *v6;

  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

_QWORD *sub_237F44C7C()
{
  uint64_t v0;
  _QWORD *result;

  result = sub_237F171FC((_QWORD *)(*(_QWORD *)(v0 + 96) + 16), *(_QWORD *)(*(_QWORD *)(v0 + 96) + 40));
  *(_QWORD *)(v0 + 296) = result;
  return result;
}

uint64_t sub_237F44CA0()
{
  return swift_task_dealloc();
}

uint64_t sub_237F44CEC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t sub_237F44D0C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_237F44D18(uint64_t a1, uint64_t a2)
{
  sub_237F2B010(a1, a2);
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_237F44D34@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void sub_237F44D3C()
{
  JUMPOUT(0x23B8282A8);
}

uint64_t sub_237F44D44()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_237F44D50()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_237F44D58()
{
  return swift_task_switch();
}

uint64_t sub_237F44D74()
{
  return _sScs8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF();
}

uint64_t sub_237F44D90(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_237F44DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

BOOL sub_237F44DC8(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void sub_237F44DD8()
{
  JUMPOUT(0x23B8282A8);
}

uint64_t sub_237F44DE0()
{
  return swift_task_switch();
}

uint64_t sub_237F44DFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

BOOL sub_237F44E0C(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_237F44E1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_237F44E2C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t sub_237F44E5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

BOOL sub_237F44E6C(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_237F44E7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

void sub_237F44E8C()
{
  JUMPOUT(0x23B8282B4);
}

uint64_t sub_237F44E94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_237F44EA4()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_237F44EAC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_237F44EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(void))
{
  return a8();
}

uint64_t sub_237F44ECC()
{
  return _sScs8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF();
}

uint64_t sub_237F44EE4()
{
  return swift_arrayDestroy();
}

uint64_t sub_237F44EF8()
{
  return AsyncThrowingStream.Continuation.finish(throwing:)();
}

void sub_237F44F04()
{
  JUMPOUT(0x23B8282A8);
}

uint64_t sub_237F44F0C()
{
  return swift_arrayDestroy();
}

uint64_t sub_237F44F18()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_237F44F20()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 48) = v0;
  return swift_task_dealloc();
}

uint64_t sub_237F44F44()
{
  return swift_task_dealloc();
}

uint64_t sub_237F44F4C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_237F44F54()
{
  return swift_bridgeObjectRelease();
}

BOOL sub_237F44F5C(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t sub_237F44F64()
{
  return swift_deallocObject();
}

void sub_237F44F78()
{
  JUMPOUT(0x23B8282B4);
}

uint64_t sub_237F44FA8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_237F44FB0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_237F44FB8()
{
  return swift_task_alloc();
}

uint64_t sub_237F44FC0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 136) = v0;
  return swift_task_dealloc();
}

uint64_t sub_237F44FE0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_237F45034(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_237F45050()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_237F45058()
{
  return swift_task_dealloc();
}

uint64_t sub_237F45068()
{
  return swift_task_dealloc();
}

uint64_t sub_237F45084@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t sub_237F4508C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;

  return sub_237F42698(v3, v4, a3);
}

uint64_t sub_237F45098()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t sub_237F450A4()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_237F450B0()
{
  return AsyncThrowingStream.Continuation.yield(_:)();
}

uint64_t sub_237F450C0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_237F450CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a12 + 8))(v12, v13);
}

uint64_t sub_237F450E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t sub_237F450F4()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_237F450FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s10CloudAsset21UploadResponseMessageOwst_0(a1, 1, 1, a4);
}

uint64_t sub_237F45108()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_237F45114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  *a11 = v15;
  return (*(uint64_t (**)(uint64_t, uint64_t))(a15 + 8))(v16, v17);
}

uint64_t sub_237F45130(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t sub_237F45154(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t sub_237F45160()
{
  return swift_task_dealloc();
}

uint64_t sub_237F4517C()
{
  return swift_allocObject();
}

uint64_t sub_237F45188()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F451AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t sub_237F451B8@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_237F451C4()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_237F451D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _QWORD *a13)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *a13 = v13;
  return (*(uint64_t (**)(uint64_t, uint64_t))(a11 + 8))(v14, v15);
}

uint64_t sub_237F451EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *(_QWORD *)(v0 + 272) = v5;
  return v5(v2, v1, v3);
}

uint64_t sub_237F45204()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0[22] + 16))(v0[26], v0[27], v0[21]);
}

uint64_t sub_237F4523C()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_237F45244()
{
  JUMPOUT(0x23B8282B4);
}

uint64_t sub_237F4524C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 80) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_237F45264(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 80) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void sub_237F4527C()
{
  JUMPOUT(0x23B8282A8);
}

uint64_t sub_237F45284()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F45294()
{
  return swift_release();
}

uint64_t sub_237F452AC()
{
  return swift_task_switch();
}

uint64_t sub_237F452B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t);

  v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  *(_QWORD *)(v15 + 272) = v19;
  return v19(v17, a15, v18);
}

uint64_t sub_237F452D0()
{
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_237F452D8()
{
  return swift_dynamicCast();
}

uint64_t sub_237F452F0()
{
  return swift_dynamicCast();
}

uint64_t sub_237F45328(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void sub_237F45334()
{
  uint64_t v0;

  *(_WORD *)(v0 + 12) = 2112;
}

uint64_t sub_237F45344()
{
  return type metadata accessor for AssetUploadRequest();
}

uint64_t sub_237F4534C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;

  return v14(a2, a14, v15);
}

uint64_t sub_237F45364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;

  return v12(a2, a12, v13);
}

uint64_t sub_237F4537C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);

  return v4(a2, v2, v3);
}

uint64_t sub_237F45390()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 32))(v3, v1, v2);
}

uint64_t sub_237F453A4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

void sub_237F453B0()
{
  JUMPOUT(0x23B8282A8);
}

uint64_t sub_237F453B8()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_237F453C4()
{
  uint64_t v0;

  *(_WORD *)(v0 + 12) = 2080;
  return static Task<>.currentPriority.getter();
}

uint64_t sub_237F453D8()
{
  uint64_t v0;

  *(_WORD *)(v0 + 12) = 2080;
  return static Task<>.currentPriority.getter();
}

uint64_t sub_237F453EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t sub_237F453F8()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0 + 264))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 168));
}

void sub_237F4540C()
{
  _QWORD *v0;
  _QWORD *v1;

  *v0 = *v1;
}

uint64_t sub_237F45418()
{
  return Logger.logObject.getter();
}

uint64_t sub_237F4543C()
{
  return swift_task_dealloc();
}

uint64_t sub_237F45444()
{
  return swift_task_dealloc();
}

void sub_237F4544C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_237F43510(v3, v4, a3);
}

uint64_t sub_237F45458()
{
  return swift_release();
}

uint64_t sub_237F4546C()
{
  return dispatch thunk of XPCSession.send<A>(_:)();
}

uint64_t sub_237F45480(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_237F42698(a1, a2, (uint64_t *)(v2 - 88));
}

uint64_t sub_237F4548C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_237F45494()
{
  uint64_t v0;

  return v0;
}

void sub_237F454A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  sub_237F20E2C(v4, v3, a3);
}

uint64_t sub_237F454AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a15 + 8))(v15, v16);
}

BOOL sub_237F454C0(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t sub_237F454C8()
{
  return swift_willThrow();
}

uint64_t sub_237F454D4()
{
  return static os_log_type_t.default.getter();
}

BOOL sub_237F454F8(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_237F45508()
{
  return sub_237F54254();
}

uint64_t sub_237F45518()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 288))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 168));
}

uint64_t sub_237F45528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  unint64_t v6;
  uint64_t v7;
  va_list va;

  va_start(va, a6);
  return sub_237F42698(v7, v6, (uint64_t *)va);
}

_QWORD *sub_237F45538@<X0>(uint64_t a1@<X8>)
{
  return sub_237F171FC((_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 40));
}

uint64_t sub_237F45554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t (*a17)(uint64_t, uint64_t))
{
  uint64_t v17;
  uint64_t v18;

  return a17(v17, v18);
}

void sub_237F45564(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_237F4436C(v2, a2);
}

uint64_t sub_237F4556C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_237F4557C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_237F45584()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_237F45594()
{
  return AsyncThrowingStream.Continuation.yield(_:)();
}

uint64_t sub_237F455A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  unint64_t v4;
  uint64_t v5;
  va_list va;

  va_start(va, a4);
  return sub_237F42698(v5, v4, (uint64_t *)va);
}

uint64_t sub_237F455B4()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_237F455BC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  return sub_237F42698(a1, a2, (uint64_t *)va);
}

BOOL sub_237F455CC(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_237F455DC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  return sub_237F42698(a1, a2, (uint64_t *)va);
}

void sub_237F455F8()
{
  JUMPOUT(0x23B827DB0);
}

void sub_237F45600()
{
  JUMPOUT(0x23B827DB0);
}

uint64_t sub_237F45698()
{
  return XPCRichError.canRetry.getter();
}

uint64_t sub_237F456A0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_237F456B0()
{
  return swift_willThrow();
}

void sub_237F456C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(_QWORD);

  sub_237F20E2C(v0, v1, v2);
}

uint64_t sub_237F456D0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F456E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

BOOL sub_237F456F0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_237F45700()
{
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_237F45708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t, uint64_t))
{
  uint64_t v10;
  uint64_t v11;

  return a10(v10, v11);
}

uint64_t sub_237F45718(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_237F171BC(a3);
}

uint64_t sub_237F45744()
{
  return swift_task_dealloc();
}

uint64_t sub_237F4574C()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_237F4575C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  return sub_237F42698(a1, a2, (uint64_t *)va);
}

void sub_237F45794(float a1)
{
  float *v1;

  *v1 = a1;
}

BOOL sub_237F457A4(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_237F457C8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_237F457E4()
{
  return UUID.init()();
}

uint64_t sub_237F457F0()
{
  return swift_release();
}

void sub_237F457F8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_237F43510(a1, a2, v2);
}

void sub_237F45800(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_237F1F798(a1, v3, a3);
}

uint64_t sub_237F45808()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_237F45814()
{
  return swift_task_alloc();
}

uint64_t sub_237F45828(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t sub_237F45834()
{
  return Logger.logObject.getter();
}

uint64_t sub_237F4583C()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_237F45844()
{
  return sub_237F541A8();
}

uint64_t sub_237F45850()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_237F45858()
{
  return swift_bridgeObjectRelease();
}

void sub_237F45860()
{
  JUMPOUT(0x23B8282B4);
}

void sub_237F45868(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_237F4436C(v2, a2);
}

uint64_t sub_237F45870()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_237F4587C()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_237F45888()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

void sub_237F45894()
{
  JUMPOUT(0x23B827CFCLL);
}

uint64_t sub_237F4589C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_237F458A4()
{
  return AsyncThrowingStream.Continuation.finish(throwing:)();
}

uint64_t sub_237F458B0()
{
  return AsyncThrowingStream.Continuation.finish(throwing:)();
}

uint64_t sub_237F458BC()
{
  return AsyncThrowingStream.Continuation.finish(throwing:)();
}

uint64_t sub_237F458C8()
{
  return AsyncThrowingStream.Continuation.finish(throwing:)();
}

uint64_t sub_237F458D4()
{
  return AsyncThrowingStream.Continuation.finish(throwing:)();
}

uint64_t sub_237F458E0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  return sub_237F42698(a1, a2, (uint64_t *)va);
}

uint64_t sub_237F458E8()
{
  return swift_allocObject();
}

uint64_t sub_237F458F4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

void sub_237F45908()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t sub_237F4591C()
{
  return Logger.logObject.getter();
}

void sub_237F45924()
{
  JUMPOUT(0x23B8282A8);
}

uint64_t sub_237F45930(uint64_t result, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = result;
  v3[7] = *v2;
  return result;
}

uint64_t sub_237F45944@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, _QWORD)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, *(_QWORD *)(v3 - 112));
}

uint64_t sub_237F45960()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_237F45968()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t sub_237F45974()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t sub_237F45980()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_237F45988()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F45994()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

void sub_237F459A0()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);

  sub_237F4436C(v0, v1);
}

void sub_237F459AC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = v0;
}

void sub_237F459C0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 40) = v1;
}

void sub_237F459D4()
{
  void *v0;

}

uint64_t sub_237F459F4(uint64_t a1, uint64_t a2)
{
  sub_237F2B010(a1, a2);
  return Logger.logObject.getter();
}

uint64_t sub_237F45A08(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  return sub_237F42698(a1, a2, (uint64_t *)va);
}

void sub_237F45A14(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_237F4436C(v2, a2);
}

void sub_237F45A1C()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);

  sub_237F4436C(v0, v1);
}

uint64_t sub_237F45A28()
{
  return swift_allocObject();
}

_WORD *sub_237F45A3C(_WORD *result)
{
  *result = 0;
  return result;
}

void sub_237F45A48()
{
  JUMPOUT(0x23B8282A8);
}

_QWORD *sub_237F45A5C()
{
  uint64_t v0;
  _QWORD *result;

  result = sub_237F171FC((_QWORD *)(*(_QWORD *)(v0 + 96) + 16), *(_QWORD *)(*(_QWORD *)(v0 + 96) + 40));
  *(_QWORD *)(v0 + 232) = result;
  return result;
}

void sub_237F45A94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  char v14;
  char v15;

  type metadata accessor for AssetDownloadResponse();
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v7);
  sub_237F48BB8();
  sub_237F171BC(&qword_2568A9B78);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v8);
  sub_237F48BA0();
  sub_237F171BC(&qword_2568A9E00);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v9);
  sub_237F48C0C();
  v11 = v2 + v10;
  sub_237F2B0A4(a1, v2, &qword_2568A9B78);
  sub_237F2B0A4(a2, v11, &qword_2568A9B78);
  sub_237F48BD8(v2);
  if (v14)
  {
    v12 = sub_237F48BD8(v11);
    if (v14)
      v13 = &qword_2568A9B78;
    else
      v13 = &qword_2568A9E00;
  }
  else
  {
    sub_237F2B0A4(v2, v4, &qword_2568A9B78);
    sub_237F48BD8(v11);
    if (v14)
    {
      sub_237F1A3D8(v4, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
      v13 = &qword_2568A9E00;
    }
    else
    {
      sub_237F2AFD8(v11, v3, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
      v15 = static UUID.== infix(_:_:)();
      if ((v15 & 1) != 0)
        static Asset.== infix(_:_:)();
      sub_237F48C5C(v3);
      sub_237F48C5C(v4);
      v13 = &qword_2568A9B78;
    }
  }
  sub_237F48C90(v12, v13);
  sub_237F2D4A8();
}

uint64_t sub_237F45C80(uint64_t a1, uint64_t a2)
{
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
  int v15;
  uint64_t *v16;
  char v17;
  uint64_t v19;

  v4 = type metadata accessor for Asset(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_237F171BC(&qword_2568A9AA8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_237F171BC(&qword_2568A9E08);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (uint64_t)&v13[*(int *)(v11 + 48)];
  sub_237F2B0A4(a1, (uint64_t)v13, &qword_2568A9AA8);
  sub_237F2B0A4(a2, v14, &qword_2568A9AA8);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v13, 1, v4) == 1)
  {
    v15 = _s10CloudAsset21UploadResponseMessageOwet_0(v14, 1, v4);
    if (v15 == 1)
      v16 = &qword_2568A9AA8;
    else
      v16 = &qword_2568A9E08;
    if (v15 == 1)
      v17 = -1;
    else
      v17 = 0;
  }
  else
  {
    sub_237F2B0A4((uint64_t)v13, (uint64_t)v9, &qword_2568A9AA8);
    if (_s10CloudAsset21UploadResponseMessageOwet_0(v14, 1, v4) != 1)
    {
      sub_237F2AFD8(v14, (uint64_t)v6, type metadata accessor for Asset);
      static Asset.== infix(_:_:)();
    }
    sub_237F1A3D8((uint64_t)v9, type metadata accessor for Asset);
    v17 = 0;
    v16 = &qword_2568A9E08;
  }
  sub_237F1B910((uint64_t)v13, v16);
  return v17 & 1;
}

void sub_237F45E74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Swift::UInt v15;
  Swift::UInt v16;

  v3 = type metadata accessor for AssetDownloadResponse();
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v4);
  sub_237F48BA0();
  sub_237F171BC(&qword_2568A9B78);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v5);
  sub_237F48BB8();
  sub_237F2B0A4(v0, v0, &qword_2568A9B78);
  sub_237F48BD8(v0);
  if (v6)
  {
    sub_237F48C98(1uLL);
  }
  else
  {
    sub_237F2AFD8(v0, v1, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
    sub_237F48C98(0);
    type metadata accessor for UUID();
    sub_237F48B2C(&qword_2568A8F70, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
    dispatch thunk of Hashable.hash(into:)();
    v7 = v1 + *(int *)(v3 + 20);
    type metadata accessor for URL();
    sub_237F48B2C(&qword_2568A8F78, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
    dispatch thunk of Hashable.hash(into:)();
    type metadata accessor for Asset.ID(0);
    sub_237F48C7C();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    sub_237F34364();
    sub_237F34344();
    sub_237F34370();
    v8 = (uint64_t *)(v7 + *(int *)(v2 + 28));
    v9 = *v8;
    v10 = v8[1];
    sub_237F17134(*v8, v10);
    sub_237F48C50();
    Data.hash(into:)();
    sub_237F17178(v9, v10);
    type metadata accessor for Asset(0);
    sub_237F48C7C();
    v13 = *(_QWORD *)(v11 + 16);
    v12 = *(_QWORD *)(v11 + 24);
    sub_237F34364();
    sub_237F34344();
    sub_237F34370();
    sub_237F17134(v13, v12);
    Data.hash(into:)();
    sub_237F17178(v13, v12);
    sub_237F48C98(*(_QWORD *)(v7 + *(int *)(v9 + 24)));
    dispatch thunk of Hashable.hash(into:)();
    v14 = v1 + *(int *)(v3 + 28);
    if (*(_BYTE *)(v14 + 16) == 1)
    {
      Hasher._combine(_:)(0);
    }
    else
    {
      v16 = *(_QWORD *)v14;
      v15 = *(_QWORD *)(v14 + 8);
      Hasher._combine(_:)(1u);
      Hasher._combine(_:)(v16);
      Hasher._combine(_:)(v15);
    }
    sub_237F1A3D8(v1, (uint64_t (*)(_QWORD))type metadata accessor for AssetDownloadResponse);
  }
}

void sub_237F460F8()
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
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;

  v1 = v0;
  v2 = type metadata accessor for Asset(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_237F171BC(&qword_2568A9AA8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237F2B0A4(v1, (uint64_t)v7, &qword_2568A9AA8);
  if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)v7, 1, v2) == 1)
  {
    Hasher._combine(_:)(1uLL);
  }
  else
  {
    sub_237F2AFD8((uint64_t)v7, (uint64_t)v4, type metadata accessor for Asset);
    Hasher._combine(_:)(0);
    type metadata accessor for URL();
    sub_237F48B2C(&qword_2568A8F78, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
    dispatch thunk of Hashable.hash(into:)();
    v8 = type metadata accessor for Asset.ID(0);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    v9 = (uint64_t *)&v4[*(int *)(v8 + 24)];
    v10 = *v9;
    v11 = v9[1];
    sub_237F17134(*v9, v11);
    Data.hash(into:)();
    sub_237F17178(v10, v11);
    v12 = (uint64_t *)&v4[*(int *)(v8 + 28)];
    v13 = *v12;
    v14 = v12[1];
    sub_237F17134(*v12, v14);
    Data.hash(into:)();
    sub_237F17178(v13, v14);
    v15 = (uint64_t *)&v4[*(int *)(v2 + 20)];
    v16 = *v15;
    v17 = v15[1];
    v18 = v15[2];
    v19 = v15[3];
    sub_237F17134(*v15, v17);
    Data.hash(into:)();
    sub_237F17178(v16, v17);
    sub_237F17134(v18, v19);
    Data.hash(into:)();
    sub_237F17178(v18, v19);
    Hasher._combine(_:)(*(_QWORD *)&v4[*(int *)(v2 + 24)]);
    sub_237F1A3D8((uint64_t)v4, type metadata accessor for Asset);
  }
}

void UploadResponseMessage.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;

  sub_237F171BC(&qword_2568A9AA8);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v2);
  type metadata accessor for UploadResponseMessage();
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v3);
  sub_237F48BA0();
  sub_237F464D4(v0, v1);
  v4 = (char *)sub_237F463FC + 4 * byte_237F5FF30[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_237F463FC()
{
  sub_237F3435C();
  sub_237F33540();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for UploadResponseMessage()
{
  uint64_t result;

  result = qword_2568A9D70;
  if (!qword_2568A9D70)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237F464D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UploadResponseMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void static UploadResponseMessage.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;

  sub_237F171BC(&qword_2568A9AA8);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v5);
  sub_237F48BB8();
  type metadata accessor for UploadResponseMessage();
  sub_237F1B968();
  v7 = MEMORY[0x24BDAC7A8](v6);
  MEMORY[0x24BDAC7A8](v7);
  sub_237F48CAC();
  v9 = MEMORY[0x24BDAC7A8](v8);
  MEMORY[0x24BDAC7A8](v9);
  sub_237F171BC(&qword_2568A9C98);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v10);
  sub_237F48C0C();
  v12 = v2 + v11;
  sub_237F464D4(a1, v2);
  sub_237F464D4(a2, v12);
  v13 = (char *)sub_237F46638 + 4 * byte_237F5FF34[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_237F46638()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_237F464D4(v0, v1);
  if (sub_237F48BF4())
  {
    v2 = swift_bridgeObjectRelease();
    sub_237F48C90(v2, &qword_2568A9C98);
  }
  else
  {
    sub_237F48C64();
    sub_237F2F8E8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_237F1A3D8(v0, (uint64_t (*)(_QWORD))type metadata accessor for UploadResponseMessage);
  }
  sub_237F2D4A8();
}

uint64_t sub_237F4677C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  char v8;

  v2 = a1 == 0x6172656D65687065 && a2 == 0xEE0074657373416CLL;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6574736973726570 && a2 == 0xEE00746573734164;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6C616E676973 && a2 == 0xE600000000000000;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000019 && a2 == 0x8000000237F650A0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v8 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t sub_237F4694C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_237F46990 + 4 * byte_237F5FF38[a1]))(0x6172656D65687065, 0xEE0074657373416CLL);
}

uint64_t sub_237F46990()
{
  return 0x6574736973726570;
}

uint64_t sub_237F469B4()
{
  return 0x6C616E676973;
}

unint64_t sub_237F469C8()
{
  return 0xD000000000000019;
}

uint64_t sub_237F469E4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x726F727265 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_237F46A60()
{
  return 0x726F727265;
}

uint64_t sub_237F46A74()
{
  unsigned __int8 *v0;

  return sub_237F4694C(*v0);
}

uint64_t sub_237F46A7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F4677C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237F46AA0()
{
  sub_237F4781C();
  return CodingKey.description.getter();
}

uint64_t sub_237F46AC8()
{
  sub_237F4781C();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F46AF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F35BBC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_237F46B1C()
{
  sub_237F47984();
  return CodingKey.description.getter();
}

uint64_t sub_237F46B44()
{
  sub_237F47984();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F46B6C()
{
  sub_237F47948();
  return CodingKey.description.getter();
}

uint64_t sub_237F46B94()
{
  sub_237F47948();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F46BBC()
{
  sub_237F478D0();
  return CodingKey.description.getter();
}

uint64_t sub_237F46BE4()
{
  sub_237F478D0();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F46C10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F469E4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_237F46C38()
{
  sub_237F47858();
  return CodingKey.description.getter();
}

uint64_t sub_237F46C60()
{
  sub_237F47858();
  return CodingKey.debugDescription.getter();
}

void UploadResponseMessage.encode(to:)(_QWORD *a1)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;

  sub_237F171BC(&qword_2568A9CA0);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v2);
  sub_237F180DC();
  sub_237F171BC(&qword_2568A9CA8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v3);
  sub_237F48C28(v4, v14);
  sub_237F171BC(&qword_2568A9CB0);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v5);
  sub_237F180DC();
  sub_237F171BC(&qword_2568A9AA8);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v6);
  sub_237F1DD54();
  sub_237F171BC(&qword_2568A9CB8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v7);
  sub_237F1DD54();
  type metadata accessor for UploadResponseMessage();
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v8);
  sub_237F1DD54();
  v11 = v10 - v9;
  sub_237F171BC(&qword_2568A9CC0);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v12);
  sub_237F1DD54();
  sub_237F171FC(a1, a1[3]);
  sub_237F4781C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  sub_237F464D4(v15, v11);
  v13 = (char *)sub_237F46E5C + 4 * byte_237F5FF3C[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_237F46E5C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *v0;
  *(_BYTE *)(v4 - 72) = 0;
  sub_237F47984();
  sub_237F48B8C();
  *(_QWORD *)(v4 - 72) = v5;
  sub_237F171BC(&qword_2568A9AB0);
  sub_237F47A70(&qword_2568A9D08, &qword_2568A9D10, (uint64_t)&protocol conformance descriptor for AssetSkeleton, MEMORY[0x24BEE12A0]);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 200) + 8))(v3, v2);
  sub_237F48BD0(v1, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 112) + 8));
  swift_bridgeObjectRelease();
  sub_237F1B978();
}

void UploadResponseMessage.hashValue.getter()
{
  sub_237F1BA84();
  UploadResponseMessage.hash(into:)();
  sub_237F1BBC8();
  sub_237F1BBBC();
}

void UploadResponseMessage.init(from:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49[19];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v49[13] = a2;
  v52 = sub_237F171BC(&qword_2568A9D18);
  v49[18] = *(_QWORD *)(v52 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v4);
  sub_237F180DC();
  v49[17] = v5;
  v6 = sub_237F171BC(&qword_2568A9D20);
  v49[11] = *(_QWORD *)(v6 - 8);
  v49[12] = v6;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v7);
  sub_237F48C28(v8, v49[0]);
  v9 = sub_237F171BC(&qword_2568A9D28);
  v49[9] = *(_QWORD *)(v9 - 8);
  v49[10] = v9;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v10);
  sub_237F180DC();
  v49[15] = v11;
  v12 = sub_237F171BC(&qword_2568A9D30);
  v49[7] = *(_QWORD *)(v12 - 8);
  v49[8] = v12;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v13);
  sub_237F180DC();
  v49[14] = v14;
  v53 = sub_237F171BC(&qword_2568A9D38);
  v50 = *(_QWORD *)(v53 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v15);
  sub_237F1DD54();
  v18 = v17 - v16;
  v51 = type metadata accessor for UploadResponseMessage();
  sub_237F1B968();
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)v49 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  sub_237F48CAC();
  v24 = MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)v49 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = (char *)v49 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)v49 - v30;
  v54 = a1;
  v32 = (_QWORD *)sub_237F48C64();
  sub_237F171FC(v32, v33);
  sub_237F4781C();
  v34 = v55;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v34)
  {
    v49[2] = (uint64_t)v29;
    v49[5] = (uint64_t)v26;
    v49[3] = v2;
    v49[4] = (uint64_t)v22;
    v35 = v51;
    v49[6] = (uint64_t)v31;
    v55 = v18;
    v36 = KeyedDecodingContainer.allKeys.getter();
    v37 = *(_QWORD *)(v36 + 16);
    if (v37)
    {
      v49[1] = 0;
      v38 = *(unsigned __int8 *)(v36 + 32);
      sub_237F33F24(1, v37, v36, v36 + 32, 0, (2 * v37) | 1);
      v40 = v39;
      v42 = v41;
      swift_bridgeObjectRelease();
      v43 = v35;
      if (v40 == v42 >> 1)
        __asm { BR              X9 }
    }
    else
    {
      v43 = v35;
    }
    v44 = type metadata accessor for DecodingError();
    swift_allocError();
    v46 = v45;
    sub_237F171BC(&qword_2568A95B0);
    *v46 = v43;
    v47 = v53;
    v48 = v55;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v44 - 8) + 104))(v46, *MEMORY[0x24BEE26D0], v44);
    swift_willThrow();
    sub_237F342BC();
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v48, v47);
  }
  sub_237F172A0(v54);
  sub_237F1B978();
}

void sub_237F474AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_237F48CC0();
  sub_237F48B64();
  if (!v1)
  {
    sub_237F171BC(&qword_2568A9AA8);
    sub_237F47A38(&qword_2568A9D50);
    sub_237F48C00();
    sub_237F48B7C(*(_QWORD *)(v2 - 216));
    sub_237F342BC();
    sub_237F48BD0(*(_QWORD *)(v2 - 96), *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 136) + 8));
    v3 = *(_QWORD *)(v2 - 248);
    sub_237F48C50();
    swift_storeEnumTagMultiPayload();
    v4 = v3;
    v5 = *(_QWORD *)(v2 - 240);
    sub_237F2AFD8(v4, v5, (uint64_t (*)(_QWORD))type metadata accessor for UploadResponseMessage);
    sub_237F2AFD8(v5, *(_QWORD *)(v2 - 184), (uint64_t (*)(_QWORD))type metadata accessor for UploadResponseMessage);
    sub_237F172A0(*(_QWORD *)(v2 - 104));
    JUMPOUT(0x237F4749CLL);
  }
  sub_237F342BC();
  sub_237F48BD0(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 136) + 8));
  JUMPOUT(0x237F47498);
}

void sub_237F4753C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  sub_237F48C70();
  sub_237F48B64();
  if (v1)
    JUMPOUT(0x237F47564);
  sub_237F479FC();
  sub_237F48C00();
  v3 = *(_QWORD *)(v2 - 136);
  sub_237F48B7C(*(_QWORD *)(v2 - 200));
  sub_237F342BC();
  sub_237F48BD0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  v4 = *(_QWORD **)(v2 - 264);
  *v4 = *(_QWORD *)(v2 - 72);
  sub_237F48C50();
  swift_storeEnumTagMultiPayload();
  v5 = (uint64_t)v4;
  v6 = *(_QWORD *)(v2 - 240);
  sub_237F2AFD8(v5, v6, (uint64_t (*)(_QWORD))type metadata accessor for UploadResponseMessage);
  sub_237F2AFD8(v6, *(_QWORD *)(v2 - 184), (uint64_t (*)(_QWORD))type metadata accessor for UploadResponseMessage);
  sub_237F172A0(*(_QWORD *)(v2 - 104));
  JUMPOUT(0x237F4749CLL);
}

void sub_237F47584()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_237F48CCC();
  sub_237F48B64();
  if (v1)
  {
    sub_237F342BC();
    JUMPOUT(0x237F47648);
  }
  sub_237F479C0();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v6 = *(_QWORD *)(v5 - 136);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v2);
  sub_237F342BC();
  sub_237F48BD0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  **(_QWORD **)(v5 - 256) = *(_QWORD *)(v5 - 72);
  sub_237F48C50();
  JUMPOUT(0x237F47728);
}

Swift::Int sub_237F47770()
{
  Hasher.init(_seed:)();
  UploadResponseMessage.hash(into:)();
  return Hasher._finalize()();
}

void sub_237F477A8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  UploadResponseMessage.init(from:)(a1, a2);
}

void sub_237F477BC(_QWORD *a1)
{
  UploadResponseMessage.encode(to:)(a1);
}

uint64_t sub_237F477D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237F171BC(&qword_2568A9AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_237F4781C()
{
  unint64_t result;

  result = qword_2568A9CC8;
  if (!qword_2568A9CC8)
  {
    result = MEMORY[0x23B82832C](&unk_237F605CC, &type metadata for UploadResponseMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9CC8);
  }
  return result;
}

unint64_t sub_237F47858()
{
  unint64_t result;

  result = qword_2568A9CD0;
  if (!qword_2568A9CD0)
  {
    result = MEMORY[0x23B82832C](&unk_237F6057C, &type metadata for UploadResponseMessage.SimultaneousTransferErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9CD0);
  }
  return result;
}

unint64_t sub_237F47894()
{
  unint64_t result;

  result = qword_2568A9CD8;
  if (!qword_2568A9CD8)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for SimultaneousTransferError, &type metadata for SimultaneousTransferError);
    atomic_store(result, (unint64_t *)&qword_2568A9CD8);
  }
  return result;
}

unint64_t sub_237F478D0()
{
  unint64_t result;

  result = qword_2568A9CE0;
  if (!qword_2568A9CE0)
  {
    result = MEMORY[0x23B82832C](&unk_237F6052C, &type metadata for UploadResponseMessage.SignalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9CE0);
  }
  return result;
}

unint64_t sub_237F4790C()
{
  unint64_t result;

  result = qword_2568A9CE8;
  if (!qword_2568A9CE8)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for Signal, &type metadata for Signal);
    atomic_store(result, (unint64_t *)&qword_2568A9CE8);
  }
  return result;
}

unint64_t sub_237F47948()
{
  unint64_t result;

  result = qword_2568A9CF0;
  if (!qword_2568A9CF0)
  {
    result = MEMORY[0x23B82832C](&unk_237F604DC, &type metadata for UploadResponseMessage.PersistedAssetCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9CF0);
  }
  return result;
}

unint64_t sub_237F47984()
{
  unint64_t result;

  result = qword_2568A9D00;
  if (!qword_2568A9D00)
  {
    result = MEMORY[0x23B82832C](&unk_237F6048C, &type metadata for UploadResponseMessage.EphemeralAssetCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9D00);
  }
  return result;
}

unint64_t sub_237F479C0()
{
  unint64_t result;

  result = qword_2568A9D40;
  if (!qword_2568A9D40)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for SimultaneousTransferError, &type metadata for SimultaneousTransferError);
    atomic_store(result, (unint64_t *)&qword_2568A9D40);
  }
  return result;
}

unint64_t sub_237F479FC()
{
  unint64_t result;

  result = qword_2568A9D48;
  if (!qword_2568A9D48)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for Signal, &type metadata for Signal);
    atomic_store(result, (unint64_t *)&qword_2568A9D48);
  }
  return result;
}

void sub_237F47A38(_QWORD *a1)
{
  if (!*a1)
  {
    sub_237F1725C(&qword_2568A9AA8);
    sub_237F48CA0();
  }
  sub_237F18140();
}

uint64_t sub_237F47A70(unint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v8 = sub_237F1725C(&qword_2568A9AB0);
    sub_237F48B2C(a2, (void (*)(uint64_t))type metadata accessor for AssetSkeleton);
    v10 = v9;
    result = MEMORY[0x23B82832C](a4, v8, &v10);
    atomic_store(result, a1);
  }
  return result;
}

void sub_237F47AF4()
{
  sub_237F48B2C(&qword_2568A9D68, (void (*)(uint64_t))type metadata accessor for UploadResponseMessage);
}

uint64_t initializeBufferWithCopyOfBuffer for UploadResponseMessage(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_237F47B78 + 4 * byte_237F5FF44[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for UploadResponseMessage(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 2:
    case 3:
      result = swift_bridgeObjectRelease();
      break;
    case 1:
      v3 = type metadata accessor for Asset(0);
      result = _s10CloudAsset21UploadResponseMessageOwet_0(a1, 1, v3);
      if (!(_DWORD)result)
      {
        v4 = type metadata accessor for URL();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
        v5 = type metadata accessor for Asset.ID(0);
        swift_bridgeObjectRelease();
        sub_237F17178(*(_QWORD *)(a1 + *(int *)(v5 + 24)), *(_QWORD *)(a1 + *(int *)(v5 + 24) + 8));
        sub_237F17178(*(_QWORD *)(a1 + *(int *)(v5 + 28)), *(_QWORD *)(a1 + *(int *)(v5 + 28) + 8));
        v6 = a1 + *(int *)(v3 + 20);
        sub_237F17178(*(_QWORD *)v6, *(_QWORD *)(v6 + 8));
        result = sub_237F17178(*(_QWORD *)(v6 + 16), *(_QWORD *)(v6 + 24));
      }
      break;
    default:
      return result;
  }
  return result;
}

void initializeWithCopy for UploadResponseMessage()
{
  char *v0;

  v0 = (char *)sub_237F47E7C + 4 * byte_237F5FF4C[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

_QWORD *sub_237F47E7C()
{
  _QWORD *v0;
  _QWORD *v1;

  *v0 = *v1;
  swift_bridgeObjectRetain();
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithCopy for UploadResponseMessage(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_237F1A3D8(result, (uint64_t (*)(_QWORD))type metadata accessor for UploadResponseMessage);
    v2 = (char *)&loc_237F4807C + 4 * byte_237F5FF50[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

char *initializeWithTake for UploadResponseMessage(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  __int128 v13;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = type metadata accessor for Asset(0);
    if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)a2, 1, v6))
    {
      v7 = sub_237F171BC(&qword_2568A9AA8);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
    }
    else
    {
      v8 = type metadata accessor for URL();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      v9 = (int *)type metadata accessor for Asset.ID(0);
      *(_OWORD *)&a1[v9[5]] = *(_OWORD *)&a2[v9[5]];
      *(_OWORD *)&a1[v9[6]] = *(_OWORD *)&a2[v9[6]];
      *(_OWORD *)&a1[v9[7]] = *(_OWORD *)&a2[v9[7]];
      v10 = *(int *)(v6 + 20);
      v11 = &a1[v10];
      v12 = &a2[v10];
      v13 = *((_OWORD *)v12 + 1);
      *(_OWORD *)v11 = *(_OWORD *)v12;
      *((_OWORD *)v11 + 1) = v13;
      *(_QWORD *)&a1[*(int *)(v6 + 24)] = *(_QWORD *)&a2[*(int *)(v6 + 24)];
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)a1, 0, 1, v6);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for UploadResponseMessage(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  __int128 v13;

  if (a1 != a2)
  {
    sub_237F1A3D8((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for UploadResponseMessage);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = type metadata accessor for Asset(0);
      if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)a2, 1, v6))
      {
        v7 = sub_237F171BC(&qword_2568A9AA8);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
      }
      else
      {
        v8 = type metadata accessor for URL();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
        v9 = (int *)type metadata accessor for Asset.ID(0);
        *(_OWORD *)&a1[v9[5]] = *(_OWORD *)&a2[v9[5]];
        *(_OWORD *)&a1[v9[6]] = *(_OWORD *)&a2[v9[6]];
        *(_OWORD *)&a1[v9[7]] = *(_OWORD *)&a2[v9[7]];
        v10 = *(int *)(v6 + 20);
        v11 = &a1[v10];
        v12 = &a2[v10];
        v13 = *((_OWORD *)v12 + 1);
        *(_OWORD *)v11 = *(_OWORD *)v12;
        *((_OWORD *)v11 + 1) = v13;
        *(_QWORD *)&a1[*(int *)(v6 + 24)] = *(_QWORD *)&a2[*(int *)(v6 + 24)];
        _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)a1, 0, 1, v6);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_237F484A4()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_237F484B4()
{
  unint64_t v0;

  sub_237F4852C(319);
  if (v0 <= 0x3F)
    swift_initEnumMetadataMultiPayload();
}

void sub_237F4852C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!qword_2568A9D80)
  {
    v2 = type metadata accessor for Asset(255);
    sub_237F48B2C(&qword_2568A8FC8, (void (*)(uint64_t))type metadata accessor for Asset);
    v4 = v3;
    sub_237F48B2C(&qword_2568A8F98, (void (*)(uint64_t))type metadata accessor for Asset);
    v6 = type metadata accessor for XPCResult(a1, v2, v4, v5);
    if (!v7)
      atomic_store(v6, (unint64_t *)&qword_2568A9D80);
  }
}

uint64_t storeEnumTagSinglePayload for UploadResponseMessage.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237F4861C + 4 * byte_237F5FF59[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_237F48650 + 4 * byte_237F5FF54[v4]))();
}

uint64_t sub_237F48650(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F48658(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237F48660);
  return result;
}

uint64_t sub_237F4866C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237F48674);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_237F48678(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F48680(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UploadResponseMessage.CodingKeys()
{
  return &type metadata for UploadResponseMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for UploadResponseMessage.EphemeralAssetCodingKeys()
{
  return &type metadata for UploadResponseMessage.EphemeralAssetCodingKeys;
}

ValueMetadata *type metadata accessor for UploadResponseMessage.PersistedAssetCodingKeys()
{
  return &type metadata for UploadResponseMessage.PersistedAssetCodingKeys;
}

ValueMetadata *type metadata accessor for UploadResponseMessage.SignalCodingKeys()
{
  return &type metadata for UploadResponseMessage.SignalCodingKeys;
}

uint64_t _s10CloudAsset21UploadResponseMessageO24EphemeralAssetCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_237F48710 + 4 * byte_237F5FF5E[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_237F48730 + 4 * byte_237F5FF63[v4]))();
}

_BYTE *sub_237F48710(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_237F48730(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F48738(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F48740(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F48748(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F48750(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for UploadResponseMessage.SimultaneousTransferErrorCodingKeys()
{
  return &type metadata for UploadResponseMessage.SimultaneousTransferErrorCodingKeys;
}

unint64_t sub_237F48770()
{
  unint64_t result;

  result = qword_2568A9D88;
  if (!qword_2568A9D88)
  {
    result = MEMORY[0x23B82832C](&unk_237F60184, &type metadata for UploadResponseMessage.SimultaneousTransferErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9D88);
  }
  return result;
}

unint64_t sub_237F487B0()
{
  unint64_t result;

  result = qword_2568A9D90;
  if (!qword_2568A9D90)
  {
    result = MEMORY[0x23B82832C](&unk_237F6023C, &type metadata for UploadResponseMessage.SignalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9D90);
  }
  return result;
}

unint64_t sub_237F487F0()
{
  unint64_t result;

  result = qword_2568A9D98;
  if (!qword_2568A9D98)
  {
    result = MEMORY[0x23B82832C](&unk_237F602F4, &type metadata for UploadResponseMessage.PersistedAssetCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9D98);
  }
  return result;
}

unint64_t sub_237F48830()
{
  unint64_t result;

  result = qword_2568A9DA0;
  if (!qword_2568A9DA0)
  {
    result = MEMORY[0x23B82832C](&unk_237F603AC, &type metadata for UploadResponseMessage.EphemeralAssetCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9DA0);
  }
  return result;
}

unint64_t sub_237F48870()
{
  unint64_t result;

  result = qword_2568A9DA8;
  if (!qword_2568A9DA8)
  {
    result = MEMORY[0x23B82832C](&unk_237F60464, &type metadata for UploadResponseMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9DA8);
  }
  return result;
}

unint64_t sub_237F488B0()
{
  unint64_t result;

  result = qword_2568A9DB0;
  if (!qword_2568A9DB0)
  {
    result = MEMORY[0x23B82832C](&unk_237F6031C, &type metadata for UploadResponseMessage.EphemeralAssetCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9DB0);
  }
  return result;
}

unint64_t sub_237F488F0()
{
  unint64_t result;

  result = qword_2568A9DB8;
  if (!qword_2568A9DB8)
  {
    result = MEMORY[0x23B82832C](&unk_237F60344, &type metadata for UploadResponseMessage.EphemeralAssetCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9DB8);
  }
  return result;
}

unint64_t sub_237F48930()
{
  unint64_t result;

  result = qword_2568A9DC0;
  if (!qword_2568A9DC0)
  {
    result = MEMORY[0x23B82832C](&unk_237F60264, &type metadata for UploadResponseMessage.PersistedAssetCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9DC0);
  }
  return result;
}

unint64_t sub_237F48970()
{
  unint64_t result;

  result = qword_2568A9DC8;
  if (!qword_2568A9DC8)
  {
    result = MEMORY[0x23B82832C](&unk_237F6028C, &type metadata for UploadResponseMessage.PersistedAssetCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9DC8);
  }
  return result;
}

unint64_t sub_237F489B0()
{
  unint64_t result;

  result = qword_2568A9DD0;
  if (!qword_2568A9DD0)
  {
    result = MEMORY[0x23B82832C](&unk_237F601AC, &type metadata for UploadResponseMessage.SignalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9DD0);
  }
  return result;
}

unint64_t sub_237F489F0()
{
  unint64_t result;

  result = qword_2568A9DD8;
  if (!qword_2568A9DD8)
  {
    result = MEMORY[0x23B82832C](&unk_237F601D4, &type metadata for UploadResponseMessage.SignalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9DD8);
  }
  return result;
}

unint64_t sub_237F48A30()
{
  unint64_t result;

  result = qword_2568A9DE0;
  if (!qword_2568A9DE0)
  {
    result = MEMORY[0x23B82832C](&unk_237F600F4, &type metadata for UploadResponseMessage.SimultaneousTransferErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9DE0);
  }
  return result;
}

unint64_t sub_237F48A70()
{
  unint64_t result;

  result = qword_2568A9DE8;
  if (!qword_2568A9DE8)
  {
    result = MEMORY[0x23B82832C](&unk_237F6011C, &type metadata for UploadResponseMessage.SimultaneousTransferErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9DE8);
  }
  return result;
}

unint64_t sub_237F48AB0()
{
  unint64_t result;

  result = qword_2568A9DF0;
  if (!qword_2568A9DF0)
  {
    result = MEMORY[0x23B82832C](&unk_237F603D4, &type metadata for UploadResponseMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9DF0);
  }
  return result;
}

unint64_t sub_237F48AF0()
{
  unint64_t result;

  result = qword_2568A9DF8;
  if (!qword_2568A9DF8)
  {
    result = MEMORY[0x23B82832C](&unk_237F603FC, &type metadata for UploadResponseMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9DF8);
  }
  return result;
}

void sub_237F48B2C(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    sub_237F48CA0();
  }
  sub_237F18140();
}

uint64_t sub_237F48B64()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_237F48B7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t sub_237F48B8C()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_237F48BD0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_237F48BD8(uint64_t a1)
{
  uint64_t v1;

  return _s10CloudAsset21UploadResponseMessageOwet_0(a1, 1, v1);
}

uint64_t sub_237F48BF4()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_237F48C00()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

void sub_237F48C28(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 160) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_237F48C44()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_237F48C50()
{
  uint64_t v0;

  return v0;
}

void sub_237F48C5C(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_237F1A3D8(a1, v1);
}

uint64_t sub_237F48C64()
{
  uint64_t v0;

  return v0;
}

unint64_t sub_237F48C70()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 72) = 2;
  return sub_237F478D0();
}

void sub_237F48C90(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_237F1B910(v2, a2);
}

void sub_237F48C98(Swift::UInt a1)
{
  Hasher._combine(_:)(a1);
}

void sub_237F48CA0()
{
  JUMPOUT(0x23B82832CLL);
}

unint64_t sub_237F48CC0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 72) = 1;
  return sub_237F47948();
}

unint64_t sub_237F48CCC()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 72) = 3;
  return sub_237F47858();
}

void UploadRequestMessage.hash(into:)()
{
  uint64_t v0;

  Hasher._combine(_:)(*(unsigned __int8 *)(v0 + 8));
  sub_237F33754();
}

uint64_t static UploadRequestMessage.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
  {
    if ((*(_BYTE *)(a2 + 8) & 1) == 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 & 1;
  }
  if ((*(_BYTE *)(a2 + 8) & 1) == 0)
    goto LABEL_5;
LABEL_3:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_237F31064();
  v3 = v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_237F48D88()
{
  sub_237F49618();
  return CodingKey.description.getter();
}

uint64_t sub_237F48DB0()
{
  sub_237F49618();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F48DD8()
{
  sub_237F495A0();
  return CodingKey.description.getter();
}

uint64_t sub_237F48E00()
{
  sub_237F495A0();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F48E28()
{
  sub_237F495DC();
  return CodingKey.description.getter();
}

uint64_t sub_237F48E50()
{
  sub_237F495DC();
  return CodingKey.debugDescription.getter();
}

void UploadRequestMessage.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
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

  v3 = sub_237F171BC(&qword_2568A9E10);
  v19 = *(_QWORD *)(v3 - 8);
  v20 = v3;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v4);
  sub_237F1DD54();
  v7 = v6 - v5;
  v8 = sub_237F171BC(&qword_2568A9E18);
  v18 = *(_QWORD *)(v8 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v9);
  sub_237F1DD54();
  v12 = v11 - v10;
  v21 = *(_QWORD *)(sub_237F171BC(&qword_2568A9E20) - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v13);
  sub_237F1DD54();
  v16 = v15 - v14;
  v17 = *(unsigned __int8 *)(v1 + 8);
  sub_237F171FC(a1, a1[3]);
  sub_237F495A0();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if ((v17 & 1) != 0)
  {
    sub_237F49BCC();
    sub_237F34220();
    sub_237F171BC(&qword_2568A9E38);
    sub_237F49654(&qword_2568A9E40, &qword_2568A9E48, (uint64_t)&protocol conformance descriptor for AssetUploadRequest, MEMORY[0x24BEE12A0]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v7, v20);
  }
  else
  {
    sub_237F49618();
    sub_237F34220();
    sub_237F171BC(&qword_2568A9E38);
    sub_237F49654(&qword_2568A9E40, &qword_2568A9E48, (uint64_t)&protocol conformance descriptor for AssetUploadRequest, MEMORY[0x24BEE12A0]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v12, v8);
  }
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v16, v17);
  sub_237F1B978();
}

Swift::Int UploadRequestMessage.hashValue.getter()
{
  uint64_t v0;
  Swift::UInt v1;

  v1 = *(unsigned __int8 *)(v0 + 8);
  sub_237F1BA84();
  Hasher._combine(_:)(v1);
  sub_237F33754();
  return sub_237F1BBC8();
}

void UploadRequestMessage.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v24 = *(_QWORD *)(sub_237F171BC(&qword_2568A9E58) - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v3);
  sub_237F1DD54();
  v23 = sub_237F171BC(&qword_2568A9E60);
  v4 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  sub_237F1DD54();
  v5 = sub_237F171BC(&qword_2568A9E68);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  sub_237F1DD54();
  v9 = v8 - v7;
  sub_237F171FC(a1, a1[3]);
  sub_237F495A0();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v25)
    goto LABEL_10;
  v26 = v6;
  v10 = KeyedDecodingContainer.allKeys.getter();
  v11 = *(_QWORD *)(v10 + 16);
  v12 = v5;
  if (!v11)
  {
LABEL_8:
    v18 = type metadata accessor for DecodingError();
    swift_allocError();
    v20 = v19;
    sub_237F171BC(&qword_2568A95B0);
    *v20 = &type metadata for UploadRequestMessage;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v20, *MEMORY[0x24BEE26D0], v18);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v9, v12);
LABEL_10:
    v21 = (uint64_t)a1;
    goto LABEL_11;
  }
  v13 = *(_BYTE *)(v10 + 32);
  sub_237F33F24(1, v11, v10, v10 + 32, 0, (2 * v11) | 1);
  v15 = v14;
  v17 = v16;
  swift_bridgeObjectRelease();
  if (v15 != v17 >> 1)
  {
    v12 = v5;
    goto LABEL_8;
  }
  if ((v13 & 1) != 0)
  {
    sub_237F49BCC();
    sub_237F34404();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    sub_237F171BC(&qword_2568A9E38);
    sub_237F49654(&qword_2568A9E70, &qword_2568A9E78, (uint64_t)&protocol conformance descriptor for AssetUploadRequest, MEMORY[0x24BEE12D0]);
    sub_237F34270();
    sub_237F340A4(v24);
  }
  else
  {
    LOBYTE(v27) = 0;
    sub_237F49618();
    sub_237F34404();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    sub_237F171BC(&qword_2568A9E38);
    sub_237F49654(&qword_2568A9E70, &qword_2568A9E78, (uint64_t)&protocol conformance descriptor for AssetUploadRequest, MEMORY[0x24BEE12D0]);
    sub_237F34270();
    sub_237F340A4(v4);
  }
  sub_237F342BC();
  sub_237F34214(*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8));
  v21 = (uint64_t)a1;
  *(_QWORD *)a2 = v27;
  *(_BYTE *)(a2 + 8) = v13;
LABEL_11:
  sub_237F172A0(v21);
  sub_237F1B978();
}

Swift::Int sub_237F4951C()
{
  uint64_t v0;
  Swift::UInt v1;

  v1 = *(unsigned __int8 *)(v0 + 8);
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  sub_237F33754();
  return Hasher._finalize()();
}

void sub_237F49574(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  UploadRequestMessage.init(from:)(a1, a2);
}

void sub_237F49588(_QWORD *a1)
{
  UploadRequestMessage.encode(to:)(a1);
}

unint64_t sub_237F495A0()
{
  unint64_t result;

  result = qword_2568A9E28;
  if (!qword_2568A9E28)
  {
    result = MEMORY[0x23B82832C](&unk_237F60A24, &type metadata for UploadRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9E28);
  }
  return result;
}

unint64_t sub_237F495DC()
{
  unint64_t result;

  result = qword_2568A9E30;
  if (!qword_2568A9E30)
  {
    result = MEMORY[0x23B82832C](&unk_237F609D4, &type metadata for UploadRequestMessage.StreamRequestsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9E30);
  }
  return result;
}

unint64_t sub_237F49618()
{
  unint64_t result;

  result = qword_2568A9E50;
  if (!qword_2568A9E50)
  {
    result = MEMORY[0x23B82832C](&unk_237F60984, &type metadata for UploadRequestMessage.BatchRequestsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9E50);
  }
  return result;
}

uint64_t sub_237F49654(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = sub_237F1725C(&qword_2568A9E38);
    v10 = sub_237F496D0(a2, a3);
    result = MEMORY[0x23B82832C](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_237F496D0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for AssetUploadRequest();
    result = MEMORY[0x23B82832C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_237F49714()
{
  unint64_t result;

  result = qword_2568A9E80;
  if (!qword_2568A9E80)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for UploadRequestMessage, &type metadata for UploadRequestMessage);
    atomic_store(result, (unint64_t *)&qword_2568A9E80);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for UploadRequestMessage(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UploadRequestMessage(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for UploadRequestMessage(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for UploadRequestMessage()
{
  return &type metadata for UploadRequestMessage;
}

uint64_t storeEnumTagSinglePayload for UploadRequestMessage.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237F49858 + 4 * byte_237F60625[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_237F4988C + 4 * byte_237F60620[v4]))();
}

uint64_t sub_237F4988C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F49894(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237F4989CLL);
  return result;
}

uint64_t sub_237F498A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237F498B0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_237F498B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F498BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UploadRequestMessage.CodingKeys()
{
  return &type metadata for UploadRequestMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for UploadRequestMessage.BatchRequestsCodingKeys()
{
  return &type metadata for UploadRequestMessage.BatchRequestsCodingKeys;
}

uint64_t _s10CloudAsset20UploadRequestMessageO23BatchRequestsCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_237F4992C + 4 * byte_237F6062A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_237F4994C + 4 * byte_237F6062F[v4]))();
}

_BYTE *sub_237F4992C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_237F4994C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F49954(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F4995C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F49964(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F4996C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for UploadRequestMessage.StreamRequestsCodingKeys()
{
  return &type metadata for UploadRequestMessage.StreamRequestsCodingKeys;
}

unint64_t sub_237F4998C()
{
  unint64_t result;

  result = qword_2568A9E88;
  if (!qword_2568A9E88)
  {
    result = MEMORY[0x23B82832C](&unk_237F607EC, &type metadata for UploadRequestMessage.StreamRequestsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9E88);
  }
  return result;
}

unint64_t sub_237F499CC()
{
  unint64_t result;

  result = qword_2568A9E90;
  if (!qword_2568A9E90)
  {
    result = MEMORY[0x23B82832C](&unk_237F608A4, &type metadata for UploadRequestMessage.BatchRequestsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9E90);
  }
  return result;
}

unint64_t sub_237F49A0C()
{
  unint64_t result;

  result = qword_2568A9E98;
  if (!qword_2568A9E98)
  {
    result = MEMORY[0x23B82832C](&unk_237F6095C, &type metadata for UploadRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9E98);
  }
  return result;
}

unint64_t sub_237F49A4C()
{
  unint64_t result;

  result = qword_2568A9EA0;
  if (!qword_2568A9EA0)
  {
    result = MEMORY[0x23B82832C](&unk_237F60814, &type metadata for UploadRequestMessage.BatchRequestsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9EA0);
  }
  return result;
}

unint64_t sub_237F49A8C()
{
  unint64_t result;

  result = qword_2568A9EA8;
  if (!qword_2568A9EA8)
  {
    result = MEMORY[0x23B82832C](&unk_237F6083C, &type metadata for UploadRequestMessage.BatchRequestsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9EA8);
  }
  return result;
}

unint64_t sub_237F49ACC()
{
  unint64_t result;

  result = qword_2568A9EB0;
  if (!qword_2568A9EB0)
  {
    result = MEMORY[0x23B82832C](&unk_237F6075C, &type metadata for UploadRequestMessage.StreamRequestsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9EB0);
  }
  return result;
}

unint64_t sub_237F49B0C()
{
  unint64_t result;

  result = qword_2568A9EB8;
  if (!qword_2568A9EB8)
  {
    result = MEMORY[0x23B82832C](&unk_237F60784, &type metadata for UploadRequestMessage.StreamRequestsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9EB8);
  }
  return result;
}

unint64_t sub_237F49B4C()
{
  unint64_t result;

  result = qword_2568A9EC0;
  if (!qword_2568A9EC0)
  {
    result = MEMORY[0x23B82832C](&unk_237F608CC, &type metadata for UploadRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9EC0);
  }
  return result;
}

unint64_t sub_237F49B8C()
{
  unint64_t result;

  result = qword_2568A9EC8;
  if (!qword_2568A9EC8)
  {
    result = MEMORY[0x23B82832C](&unk_237F608F4, &type metadata for UploadRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9EC8);
  }
  return result;
}

unint64_t sub_237F49BCC()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 72) = 1;
  return sub_237F495DC();
}

uint64_t sub_237F49BD8(uint64_t a1, uint64_t a2)
{
  BOOL v5;
  char v7;

  if (a1 == 0xD000000000000011 && a2 == 0x8000000237F650C0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v5 = a1 == 0x6552746C75736572 && a2 == 0xEE00646576696563;
    if (v5 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x65526C616E676973 && a2 == 0xEE00646576696563)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v7 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_237F49D60()
{
  return 3;
}

uint64_t sub_237F49D68(char a1)
{
  if (!a1)
    return 0xD000000000000011;
  if (a1 == 1)
    return 0x6552746C75736572;
  return 0x65526C616E676973;
}

void sub_237F49DDC()
{
  Hasher.init(_seed:)();
  sub_237F1BD6C();
  Hasher._finalize()();
  sub_237F1BBBC();
}

uint64_t sub_237F49E0C()
{
  char *v0;

  return sub_237F49D68(*v0);
}

uint64_t sub_237F49E14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F49BD8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237F49E38@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_237F49D60();
  *a1 = result;
  return result;
}

uint64_t sub_237F49E5C()
{
  sub_237F4A37C();
  return CodingKey.description.getter();
}

uint64_t sub_237F49E84()
{
  sub_237F4A37C();
  return CodingKey.debugDescription.getter();
}

void sub_237F49EAC()
{
  sub_237F49DDC();
}

uint64_t sub_237F49EC4()
{
  sub_237F4A438();
  return CodingKey.description.getter();
}

uint64_t sub_237F49EEC()
{
  sub_237F4A438();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F49F14()
{
  sub_237F4A3FC();
  return CodingKey.description.getter();
}

uint64_t sub_237F49F3C()
{
  sub_237F4A3FC();
  return CodingKey.debugDescription.getter();
}

void sub_237F49F64()
{
  Hasher.init(_seed:)();
  sub_237F1BD6C();
  Hasher._finalize()();
  sub_237F1BBBC();
}

uint64_t sub_237F49F90()
{
  sub_237F4A4B4();
  return CodingKey.description.getter();
}

uint64_t sub_237F49FB8()
{
  sub_237F4A4B4();
  return CodingKey.debugDescription.getter();
}

void AssetUploadEvent.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
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
  int EnumCaseMultiPayload;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v3 = sub_237F171BC(&qword_2568A9ED0);
  v27 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v4);
  sub_237F4BA04(v5, v22);
  v25 = *(_QWORD *)(sub_237F171BC(&qword_2568A9ED8) - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v6);
  sub_237F180DC();
  v24 = v7;
  sub_237F171BC(&qword_2568A9AA8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v8);
  sub_237F1DD54();
  v11 = v10 - v9;
  v23 = *(_QWORD *)(sub_237F171BC(&qword_2568A9EE0) - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v12);
  sub_237F1DD54();
  v15 = v14 - v13;
  type metadata accessor for AssetUploadEvent();
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v16);
  sub_237F1BC2C();
  v30 = *(_QWORD *)(sub_237F171BC(&qword_2568A9EE8) - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v17);
  sub_237F1DD54();
  v20 = v19 - v18;
  sub_237F171FC(a1, a1[3]);
  sub_237F4A37C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  sub_237F4A3B8(v29, v1);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_237F4A4B4();
    sub_237F4B9E4();
    sub_237F171BC(&qword_2568A9AB0);
    sub_237F4AB74(&qword_2568A9D08, &qword_2568A9D10, (uint64_t)&protocol conformance descriptor for AssetSkeleton, MEMORY[0x24BEE12A0]);
    sub_237F4BA20();
    sub_237F44EAC(v15, *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
    sub_237F48BD0(v20, *(uint64_t (**)(uint64_t, uint64_t))(v30 + 8));
LABEL_6:
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  if (EnumCaseMultiPayload != 1)
  {
    sub_237F4BA4C();
    sub_237F4B9E4();
    sub_237F4790C();
    sub_237F4BA20();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
    sub_237F44EAC(v20, *(uint64_t (**)(uint64_t, uint64_t))(v30 + 8));
    goto LABEL_6;
  }
  sub_237F477D4(v1, v11);
  sub_237F4BA2C();
  sub_237F4B9E4();
  sub_237F4AB38(&qword_2568A9CF8);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  sub_237F44EAC(v24, *(uint64_t (**)(uint64_t, uint64_t))(v25 + 8));
  sub_237F4A474(v11);
  sub_237F48BD0(v20, *(uint64_t (**)(uint64_t, uint64_t))(v30 + 8));
LABEL_7:
  sub_237F1B978();
}

uint64_t type metadata accessor for AssetUploadEvent()
{
  uint64_t result;

  result = qword_2568A9F30;
  if (!qword_2568A9F30)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_237F4A37C()
{
  unint64_t result;

  result = qword_2568A9EF0;
  if (!qword_2568A9EF0)
  {
    result = MEMORY[0x23B82832C](&unk_237F60F4C, &type metadata for AssetUploadEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9EF0);
  }
  return result;
}

uint64_t sub_237F4A3B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AssetUploadEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_237F4A3FC()
{
  unint64_t result;

  result = qword_2568A9EF8;
  if (!qword_2568A9EF8)
  {
    result = MEMORY[0x23B82832C](&unk_237F60EFC, &type metadata for AssetUploadEvent.SignalReceivedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9EF8);
  }
  return result;
}

unint64_t sub_237F4A438()
{
  unint64_t result;

  result = qword_2568A9F00;
  if (!qword_2568A9F00)
  {
    result = MEMORY[0x23B82832C](&unk_237F60EAC, &type metadata for AssetUploadEvent.ResultReceivedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9F00);
  }
  return result;
}

uint64_t sub_237F4A474(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_237F171BC(&qword_2568A9AA8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_237F4A4B4()
{
  unint64_t result;

  result = qword_2568A9F08;
  if (!qword_2568A9F08)
  {
    result = MEMORY[0x23B82832C](&unk_237F60E5C, &type metadata for AssetUploadEvent.SkeletonsReceivedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9F08);
  }
  return result;
}

void AssetUploadEvent.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  char *v16;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  void (*v48)(uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51[2];
  _QWORD *v52;
  _QWORD *v53;
  char *v54;
  char *v55;
  uint64_t v56;
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
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;

  v63 = a2;
  v62 = sub_237F171BC(&qword_2568A9F10);
  v59 = *(_QWORD *)(v62 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v4);
  sub_237F180DC();
  v66 = v5;
  v61 = sub_237F171BC(&qword_2568A9F18);
  v58 = *(_QWORD *)(v61 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v6);
  sub_237F4BA04(v7, v51[0]);
  v60 = sub_237F171BC(&qword_2568A9F20);
  v57 = *(_QWORD *)(v60 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v8);
  sub_237F180DC();
  v64 = v9;
  v10 = sub_237F171BC(&qword_2568A9F28);
  v67 = *(_QWORD *)(v10 - 8);
  v68 = v10;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v11);
  sub_237F1BC2C();
  v12 = type metadata accessor for AssetUploadEvent();
  sub_237F1B990();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)v51 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)v51 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v51 - v23;
  v25 = a1[3];
  v69 = a1;
  sub_237F171FC(a1, v25);
  sub_237F4A37C();
  v26 = v70;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v26)
  {
    v27 = (uint64_t)v69;
    goto LABEL_11;
  }
  v52 = v22;
  v53 = v16;
  v54 = v24;
  v55 = v19;
  v56 = v12;
  v28 = v68;
  v70 = v2;
  v29 = KeyedDecodingContainer.allKeys.getter();
  v30 = *(_QWORD *)(v29 + 16);
  if (!v30)
  {
    v27 = (uint64_t)v69;
LABEL_10:
    v38 = v67;
    v39 = v56;
    v40 = type metadata accessor for DecodingError();
    swift_allocError();
    v42 = v41;
    sub_237F171BC(&qword_2568A95B0);
    *v42 = v39;
    v43 = v70;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v40 - 8) + 104))(v42, *MEMORY[0x24BEE26D0], v40);
    swift_willThrow();
    sub_237F4B9A4();
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v43, v28);
    goto LABEL_11;
  }
  v31 = v28;
  v51[1] = 0;
  v32 = *(unsigned __int8 *)(v29 + 32);
  sub_237F33F24(1, v30, v29, v29 + 32, 0, (2 * v30) | 1);
  v34 = v33;
  v36 = v35;
  swift_bridgeObjectRelease();
  if (v34 != v36 >> 1)
  {
    v27 = (uint64_t)v69;
    v28 = v31;
    goto LABEL_10;
  }
  if (v32)
  {
    if (v32 == 1)
    {
      sub_237F4BA2C();
      v37 = v65;
      sub_237F4BA44();
      sub_237F171BC(&qword_2568A9AA8);
      sub_237F4AB38(&qword_2568A9D50);
      sub_237F4BA38();
      v27 = (uint64_t)v69;
      sub_237F48BD0(v37, *(uint64_t (**)(uint64_t, uint64_t))(v58 + 8));
      sub_237F4B9A4();
      sub_237F4B9AC(v67);
      v46 = v55;
    }
    else
    {
      sub_237F4BA4C();
      sub_237F4BA44();
      sub_237F479FC();
      KeyedDecodingContainer.decode<A>(_:forKey:)();
      v27 = (uint64_t)v69;
      sub_237F4B9AC(v59);
      sub_237F4B9A4();
      v47 = sub_237F4B9D0();
      v48(v47);
      v46 = v53;
      *v53 = v71;
    }
  }
  else
  {
    LOBYTE(v71) = 0;
    sub_237F4A4B4();
    v44 = v70;
    sub_237F4BA44();
    sub_237F171BC(&qword_2568A9AB0);
    sub_237F4AB74(&qword_2568A9D58, &qword_2568A9D60, (uint64_t)&protocol conformance descriptor for AssetSkeleton, MEMORY[0x24BEE12D0]);
    sub_237F4BA38();
    v27 = (uint64_t)v69;
    v45 = v67;
    sub_237F4B9F0();
    sub_237F4B9A4();
    sub_237F48BD0(v44, *(uint64_t (**)(uint64_t, uint64_t))(v45 + 8));
    v46 = v52;
    *v52 = v71;
  }
  swift_storeEnumTagMultiPayload();
  v49 = (uint64_t)v46;
  v50 = (uint64_t)v54;
  sub_237F4AAF4(v49, (uint64_t)v54);
  sub_237F4AAF4(v50, v63);
LABEL_11:
  sub_237F172A0(v27);
  sub_237F1B978();
}

void sub_237F4AACC(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  AssetUploadEvent.init(from:)(a1, a2);
}

void sub_237F4AAE0(_QWORD *a1)
{
  AssetUploadEvent.encode(to:)(a1);
}

uint64_t sub_237F4AAF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AssetUploadEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237F4AB38(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    sub_237F1725C(&qword_2568A9AA8);
    sub_237F48CA0();
  }
  return result;
}

uint64_t sub_237F4AB74(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = sub_237F1725C(&qword_2568A9AB0);
    v9 = sub_237F4B458(a2, (void (*)(uint64_t))type metadata accessor for AssetSkeleton);
    result = MEMORY[0x23B82832C](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AssetUploadEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = type metadata accessor for Asset(0);
      if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)a2, 1, v6))
      {
        v7 = sub_237F171BC(&qword_2568A9AA8);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
      }
      else
      {
        v9 = type metadata accessor for URL();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
        v10 = (int *)type metadata accessor for Asset.ID(0);
        v11 = v10[5];
        v12 = (uint64_t *)((char *)a1 + v11);
        v13 = (uint64_t *)((char *)a2 + v11);
        v14 = v13[1];
        *v12 = *v13;
        v12[1] = v14;
        v15 = v10[6];
        v16 = (uint64_t *)((char *)a1 + v15);
        v17 = (uint64_t *)((char *)a2 + v15);
        v18 = *v17;
        v19 = v17[1];
        swift_bridgeObjectRetain();
        sub_237F17134(v18, v19);
        *v16 = v18;
        v16[1] = v19;
        v20 = v10[7];
        v21 = (uint64_t *)((char *)a1 + v20);
        v22 = (uint64_t *)((char *)a2 + v20);
        v23 = *v22;
        v24 = v22[1];
        sub_237F17134(*v22, v24);
        *v21 = v23;
        v21[1] = v24;
        v25 = *(int *)(v6 + 20);
        v26 = (uint64_t *)((char *)a1 + v25);
        v27 = (char *)a2 + v25;
        v28 = *(uint64_t *)((char *)a2 + v25);
        v29 = *(uint64_t *)((char *)a2 + v25 + 8);
        sub_237F17134(v28, v29);
        *v26 = v28;
        v26[1] = v29;
        v30 = *((_QWORD *)v27 + 2);
        v31 = *((_QWORD *)v27 + 3);
        sub_237F17134(v30, v31);
        v26[2] = v30;
        v26[3] = v31;
        *(uint64_t *)((char *)a1 + *(int *)(v6 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v6 + 24));
        _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for AssetUploadEvent(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = swift_getEnumCaseMultiPayload();
  switch((_DWORD)result)
  {
    case 2:
      return swift_bridgeObjectRelease();
    case 1:
      v3 = type metadata accessor for Asset(0);
      result = _s10CloudAsset21UploadResponseMessageOwet_0(a1, 1, v3);
      if (!(_DWORD)result)
      {
        v4 = type metadata accessor for URL();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
        v5 = type metadata accessor for Asset.ID(0);
        swift_bridgeObjectRelease();
        sub_237F17178(*(_QWORD *)(a1 + *(int *)(v5 + 24)), *(_QWORD *)(a1 + *(int *)(v5 + 24) + 8));
        sub_237F17178(*(_QWORD *)(a1 + *(int *)(v5 + 28)), *(_QWORD *)(a1 + *(int *)(v5 + 28) + 8));
        v6 = a1 + *(int *)(v3 + 20);
        sub_237F17178(*(_QWORD *)v6, *(_QWORD *)(v6 + 8));
        return sub_237F17178(*(_QWORD *)(v6 + 16), *(_QWORD *)(v6 + 24));
      }
      break;
    case 0:
      return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *initializeWithCopy for AssetUploadEvent(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = type metadata accessor for Asset(0);
    if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)a2, 1, v4))
    {
      v5 = sub_237F171BC(&qword_2568A9AA8);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
    }
    else
    {
      v6 = type metadata accessor for URL();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      v7 = (int *)type metadata accessor for Asset.ID(0);
      v8 = v7[5];
      v9 = (_QWORD *)((char *)a1 + v8);
      v10 = (_QWORD *)((char *)a2 + v8);
      v11 = v10[1];
      *v9 = *v10;
      v9[1] = v11;
      v12 = v7[6];
      v13 = (_QWORD *)((char *)a1 + v12);
      v14 = (_QWORD *)((char *)a2 + v12);
      v15 = *v14;
      v16 = v14[1];
      swift_bridgeObjectRetain();
      sub_237F17134(v15, v16);
      *v13 = v15;
      v13[1] = v16;
      v17 = v7[7];
      v18 = (_QWORD *)((char *)a1 + v17);
      v19 = (_QWORD *)((char *)a2 + v17);
      v20 = *v19;
      v21 = v19[1];
      sub_237F17134(*v19, v21);
      *v18 = v20;
      v18[1] = v21;
      v22 = *(int *)(v4 + 20);
      v23 = (_QWORD *)((char *)a1 + v22);
      v24 = (char *)a2 + v22;
      v25 = *(_QWORD *)((char *)a2 + v22);
      v26 = *(_QWORD *)((char *)a2 + v22 + 8);
      sub_237F17134(v25, v26);
      *v23 = v25;
      v23[1] = v26;
      v27 = *((_QWORD *)v24 + 2);
      v28 = *((_QWORD *)v24 + 3);
      sub_237F17134(v27, v28);
      v23[2] = v27;
      v23[3] = v28;
      *(_QWORD *)((char *)a1 + *(int *)(v4 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(v4 + 24));
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)a1, 0, 1, v4);
    }
  }
  else
  {
    *a1 = *a2;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for AssetUploadEvent(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;

  if (a1 != a2)
  {
    sub_237F4B268((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = type metadata accessor for Asset(0);
      if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)a2, 1, v4))
      {
        v5 = sub_237F171BC(&qword_2568A9AA8);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
      }
      else
      {
        v6 = type metadata accessor for URL();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
        v7 = (int *)type metadata accessor for Asset.ID(0);
        v8 = v7[5];
        v9 = (_QWORD *)((char *)a1 + v8);
        v10 = (_QWORD *)((char *)a2 + v8);
        *v9 = *v10;
        v9[1] = v10[1];
        v11 = v7[6];
        v12 = (_QWORD *)((char *)a1 + v11);
        v13 = (_QWORD *)((char *)a2 + v11);
        v14 = *v13;
        v15 = v13[1];
        swift_bridgeObjectRetain();
        sub_237F17134(v14, v15);
        *v12 = v14;
        v12[1] = v15;
        v16 = v7[7];
        v17 = (_QWORD *)((char *)a1 + v16);
        v18 = (_QWORD *)((char *)a2 + v16);
        v19 = *v18;
        v20 = v18[1];
        sub_237F17134(*v18, v20);
        *v17 = v19;
        v17[1] = v20;
        v21 = *(int *)(v4 + 20);
        v22 = (_QWORD *)((char *)a1 + v21);
        v23 = (char *)a2 + v21;
        v24 = *(_QWORD *)((char *)a2 + v21);
        v25 = *(_QWORD *)((char *)a2 + v21 + 8);
        sub_237F17134(v24, v25);
        *v22 = v24;
        v22[1] = v25;
        v26 = *((_QWORD *)v23 + 2);
        v27 = *((_QWORD *)v23 + 3);
        sub_237F17134(v26, v27);
        v22[2] = v26;
        v22[3] = v27;
        *(_QWORD *)((char *)a1 + *(int *)(v4 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(v4 + 24));
        _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)a1, 0, 1, v4);
      }
    }
    else
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_237F4B268(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AssetUploadEvent();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *assignWithTake for AssetUploadEvent(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  __int128 v13;

  if (a1 != a2)
  {
    sub_237F4B268((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = type metadata accessor for Asset(0);
      if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)a2, 1, v6))
      {
        v7 = sub_237F171BC(&qword_2568A9AA8);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
      }
      else
      {
        v8 = type metadata accessor for URL();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
        v9 = (int *)type metadata accessor for Asset.ID(0);
        *(_OWORD *)&a1[v9[5]] = *(_OWORD *)&a2[v9[5]];
        *(_OWORD *)&a1[v9[6]] = *(_OWORD *)&a2[v9[6]];
        *(_OWORD *)&a1[v9[7]] = *(_OWORD *)&a2[v9[7]];
        v10 = *(int *)(v6 + 20);
        v11 = &a1[v10];
        v12 = &a2[v10];
        v13 = *((_OWORD *)v12 + 1);
        *(_OWORD *)v11 = *(_OWORD *)v12;
        *((_OWORD *)v11 + 1) = v13;
        *(_QWORD *)&a1[*(int *)(v6 + 24)] = *(_QWORD *)&a2[*(int *)(v6 + 24)];
        _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)a1, 0, 1, v6);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void sub_237F4B3E4()
{
  unint64_t v0;

  sub_237F4852C(319);
  if (v0 <= 0x3F)
    swift_initEnumMetadataMultiPayload();
}

uint64_t sub_237F4B458(uint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    a2(255);
    sub_237F48CA0();
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AssetUploadEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFE)
  {
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
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AssetUploadEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237F4B564 + 4 * byte_237F60A85[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_237F4B598 + 4 * byte_237F60A80[v4]))();
}

uint64_t sub_237F4B598(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F4B5A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237F4B5A8);
  return result;
}

uint64_t sub_237F4B5B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237F4B5BCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_237F4B5C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F4B5C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AssetUploadEvent.CodingKeys()
{
  return &type metadata for AssetUploadEvent.CodingKeys;
}

ValueMetadata *type metadata accessor for AssetUploadEvent.SkeletonsReceivedCodingKeys()
{
  return &type metadata for AssetUploadEvent.SkeletonsReceivedCodingKeys;
}

ValueMetadata *type metadata accessor for AssetUploadEvent.ResultReceivedCodingKeys()
{
  return &type metadata for AssetUploadEvent.ResultReceivedCodingKeys;
}

uint64_t _s10CloudAsset16AssetUploadEventO27SkeletonsReceivedCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_237F4B648 + 4 * byte_237F60A8A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_237F4B668 + 4 * byte_237F60A8F[v4]))();
}

_BYTE *sub_237F4B648(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_237F4B668(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F4B670(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F4B678(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F4B680(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F4B688(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AssetUploadEvent.SignalReceivedCodingKeys()
{
  return &type metadata for AssetUploadEvent.SignalReceivedCodingKeys;
}

unint64_t sub_237F4B6A8()
{
  unint64_t result;

  result = qword_2568A9F40;
  if (!qword_2568A9F40)
  {
    result = MEMORY[0x23B82832C](&unk_237F60C0C, &type metadata for AssetUploadEvent.SignalReceivedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9F40);
  }
  return result;
}

unint64_t sub_237F4B6E8()
{
  unint64_t result;

  result = qword_2568A9F48;
  if (!qword_2568A9F48)
  {
    result = MEMORY[0x23B82832C](&unk_237F60CC4, &type metadata for AssetUploadEvent.ResultReceivedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9F48);
  }
  return result;
}

unint64_t sub_237F4B728()
{
  unint64_t result;

  result = qword_2568A9F50;
  if (!qword_2568A9F50)
  {
    result = MEMORY[0x23B82832C](&unk_237F60D7C, &type metadata for AssetUploadEvent.SkeletonsReceivedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9F50);
  }
  return result;
}

unint64_t sub_237F4B768()
{
  unint64_t result;

  result = qword_2568A9F58;
  if (!qword_2568A9F58)
  {
    result = MEMORY[0x23B82832C](&unk_237F60E34, &type metadata for AssetUploadEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9F58);
  }
  return result;
}

unint64_t sub_237F4B7A8()
{
  unint64_t result;

  result = qword_2568A9F60;
  if (!qword_2568A9F60)
  {
    result = MEMORY[0x23B82832C](&unk_237F60CEC, &type metadata for AssetUploadEvent.SkeletonsReceivedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9F60);
  }
  return result;
}

unint64_t sub_237F4B7E8()
{
  unint64_t result;

  result = qword_2568A9F68;
  if (!qword_2568A9F68)
  {
    result = MEMORY[0x23B82832C](&unk_237F60D14, &type metadata for AssetUploadEvent.SkeletonsReceivedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9F68);
  }
  return result;
}

unint64_t sub_237F4B828()
{
  unint64_t result;

  result = qword_2568A9F70;
  if (!qword_2568A9F70)
  {
    result = MEMORY[0x23B82832C](&unk_237F60C34, &type metadata for AssetUploadEvent.ResultReceivedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9F70);
  }
  return result;
}

unint64_t sub_237F4B868()
{
  unint64_t result;

  result = qword_2568A9F78;
  if (!qword_2568A9F78)
  {
    result = MEMORY[0x23B82832C](&unk_237F60C5C, &type metadata for AssetUploadEvent.ResultReceivedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9F78);
  }
  return result;
}

unint64_t sub_237F4B8A8()
{
  unint64_t result;

  result = qword_2568A9F80;
  if (!qword_2568A9F80)
  {
    result = MEMORY[0x23B82832C](&unk_237F60B7C, &type metadata for AssetUploadEvent.SignalReceivedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9F80);
  }
  return result;
}

unint64_t sub_237F4B8E8()
{
  unint64_t result;

  result = qword_2568A9F88;
  if (!qword_2568A9F88)
  {
    result = MEMORY[0x23B82832C](&unk_237F60BA4, &type metadata for AssetUploadEvent.SignalReceivedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9F88);
  }
  return result;
}

unint64_t sub_237F4B928()
{
  unint64_t result;

  result = qword_2568A9F90;
  if (!qword_2568A9F90)
  {
    result = MEMORY[0x23B82832C](&unk_237F60DA4, &type metadata for AssetUploadEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9F90);
  }
  return result;
}

unint64_t sub_237F4B968()
{
  unint64_t result;

  result = qword_2568A9F98;
  if (!qword_2568A9F98)
  {
    result = MEMORY[0x23B82832C](&unk_237F60DCC, &type metadata for AssetUploadEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568A9F98);
  }
  return result;
}

uint64_t sub_237F4B9A4()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_237F4B9AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t sub_237F4B9BC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F4B9D0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F4B9E4()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_237F4B9F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 200) + 8))(v1, v0);
}

void sub_237F4BA04(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 136) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_237F4BA20()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

unint64_t sub_237F4BA2C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 72) = 1;
  return sub_237F4A438();
}

uint64_t sub_237F4BA38()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_237F4BA44()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

unint64_t sub_237F4BA4C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 72) = 2;
  return sub_237F4A3FC();
}

uint64_t XPCMessageSender.__allocating_init(machServiceName:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_237F4FD70();
  v4 = swift_allocObject();
  XPCMessageSender.init(machServiceName:)(a1, a2);
  return v4;
}

uint64_t sub_237F4BAA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_237F44FE0();
  if (_s10CloudAsset21UploadResponseMessageOwet_0(a1, 1, v6) == 1)
  {
    sub_237F4F944(a1, &qword_2568A9AC8);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  v7 = sub_237F45A28();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_237F4BBE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BEE6CA0];
  sub_237F1725C(&qword_2568A91E0);
  v3 = type metadata accessor for AsyncThrowingStream.Continuation.BufferingPolicy();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_237F4BC4C()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  void (*v19)(uint64_t);
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  sub_237F2D8B4();
  v34 = v1;
  v35 = v2;
  v31 = v3;
  v32 = v0;
  v29 = v4;
  v30 = v5;
  v7 = v6;
  sub_237F1725C(&qword_2568A91E0);
  v33 = sub_237F4FE04();
  v8 = *(_QWORD *)(v33 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v33);
  v11 = (char *)&v27 - v10;
  v28 = (char *)&v27 - v10;
  v12 = sub_237F18108();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v27 - v17;
  v19 = *(void (**)(uint64_t))(v13 + 16);
  v20 = sub_237F4FD54();
  v19(v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v29, v33);
  ((void (*)(char *, uint64_t, uint64_t))v19)(v16, v7, v12);
  v21 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v22 = (v9 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (*(unsigned __int8 *)(v13 + 80) + v22 + 8) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v24 = swift_allocObject();
  v25 = v31;
  *(_QWORD *)(v24 + 16) = v30;
  *(_QWORD *)(v24 + 24) = v25;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v24 + v21, v28, v33);
  *(_QWORD *)(v24 + v22) = v32;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v24 + v23, v16, v12);
  swift_beginAccess();
  swift_retain();
  sub_237F4F33C((uint64_t)sub_237F4F140, v24, (uint64_t)v18);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
  return swift_endAccess();
}

uint64_t sub_237F4BE38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  _QWORD v21[5];
  uint64_t v22;

  v21[3] = a6;
  MEMORY[0x24BDAC7A8](a1);
  sub_237F1725C(&qword_2568A91E0);
  v10 = type metadata accessor for AsyncThrowingStream.Continuation.YieldResult();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v21 - v12;
  v14 = (uint64_t *)(a1 + *(int *)(type metadata accessor for XPCAsyncSequenceResponse() + 20));
  v15 = v14[1];
  if (v15 >> 60 == 11)
  {
    sub_237F443BC();
    v16 = swift_allocError();
    *v17 = 1;
    v22 = v16;
    type metadata accessor for AsyncThrowingStream.Continuation();
    AsyncThrowingStream.Continuation.finish(throwing:)();
  }
  else
  {
    v21[2] = a3;
    if (v15 >> 60 != 15)
    {
      v21[0] = a4;
      v21[1] = a2;
      v20 = *v14;
      type metadata accessor for JSONDecoder();
      swift_allocObject();
      sub_237F17134(v20, v15);
      JSONDecoder.init()();
      dispatch thunk of JSONDecoder.decode<A>(_:from:)();
      swift_release();
      type metadata accessor for AsyncThrowingStream.Continuation();
      AsyncThrowingStream.Continuation.yield(_:)();
      sub_237F44408(v20, v15);
      return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
    v22 = 0;
    type metadata accessor for AsyncThrowingStream.Continuation();
    AsyncThrowingStream.Continuation.finish(throwing:)();
  }
  swift_beginAccess();
  v18 = sub_237F4F1F4(a4);
  result = swift_endAccess();
  if (v18)
    return sub_237F443F8(v18);
  return result;
}

uint64_t sub_237F4C134(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  char v6;
  void (*v7)(uint64_t);

  result = swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 112);
  if (*(_QWORD *)(v4 + 16))
  {
    swift_bridgeObjectRetain();
    v5 = sub_237F4EEE8(a1);
    if ((v6 & 1) != 0)
    {
      v7 = *(void (**)(uint64_t))(*(_QWORD *)(v4 + 56) + 16 * v5);
      swift_retain_n();
      swift_bridgeObjectRelease();
      v7(a1);
      return swift_release_n();
    }
    else
    {
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_237F4C1D8()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_237F4C1FC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F4C20C()
{
  uint64_t v0;

  v0 = sub_237F44A50();
  sub_237F2B028(v0, qword_2568A9FA0);
  sub_237F2B010(v0, (uint64_t)qword_2568A9FA0);
  type metadata accessor for XPCMessageSender();
  sub_237F171BC(&qword_2568AA000);
  String.init<A>(describing:)();
  return Logger.init(subsystem:category:)();
}

uint64_t XPCMessageSender.init(machServiceName:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  _QWORD *v9;
  __int128 v11;
  uint64_t v12;
  _UNKNOWN **v13;

  v3 = v2;
  type metadata accessor for XPCMessageSender.AsyncSequenceDispatcher();
  v6 = swift_allocObject();
  swift_defaultActor_initialize();
  type metadata accessor for UUID();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  sub_237F171BC(&qword_2568A9FB8);
  sub_237F4F5C8(&qword_2568A8F70, v7, MEMORY[0x24BDCEA88]);
  *(_QWORD *)(v6 + 112) = Dictionary.init(dictionaryLiteral:)();
  *(_QWORD *)(v3 + 56) = v6;
  v8 = type metadata accessor for XPCSessionCacheImplementation();
  swift_allocObject();
  swift_retain_n();
  v9 = sub_237F54158(a1, a2, (uint64_t)sub_237F4C528, v6);
  v12 = v8;
  v13 = &off_2509CC618;
  swift_release();
  *(_QWORD *)&v11 = v9;
  sub_237F40068(&v11, v3 + 16);
  return v3;
}

uint64_t type metadata accessor for XPCMessageSender.AsyncSequenceDispatcher()
{
  return objc_opt_self();
}

double sub_237F4C3F0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  double result;
  uint64_t v16;

  v6 = type metadata accessor for XPCAsyncSequenceResponse();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = sub_237F171BC(&qword_2568A9AC8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for TaskPriority();
  _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v11, 1, 1, v12);
  sub_237F4FA10(a1, (uint64_t)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = a2;
  sub_237F4FAF8((uint64_t)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v14 + v13);
  swift_retain();
  sub_237F4BAA4((uint64_t)v11, (uint64_t)&unk_2568AA048, (uint64_t)v14);
  swift_release();
  *(_QWORD *)(a3 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  return result;
}

double sub_237F4C528@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_237F4C3F0(a1, v2, a2);
}

uint64_t sub_237F4C530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_237F4C548()
{
  uint64_t v0;

  sub_237F4C134(*(_QWORD *)(v0 + 24));
  return sub_237F44D0C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t XPCMessageSender.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  __int128 v10[2];

  v1 = sub_237F171BC(&qword_2568A9AC8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_237F44FE0();
  sub_237F450FC((uint64_t)v3, v5, v6, v4);
  sub_237F4EBD4(v0 + 16, (uint64_t)v10);
  v7 = sub_237F45A28();
  *(_QWORD *)(v7 + 16) = 0;
  *(_QWORD *)(v7 + 24) = 0;
  sub_237F40068(v10, v7 + 32);
  sub_237F4BAA4((uint64_t)v3, (uint64_t)&unk_2568A9FC8, v7);
  swift_release();
  sub_237F172A0(v0 + 16);
  swift_release();
  return v0;
}

uint64_t sub_237F4C640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_237F4C658()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = sub_237F171FC(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
  return sub_237F34CD8();
}

uint64_t sub_237F4C694()
{
  uint64_t v0;

  sub_237F54680();
  return sub_237F44D0C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t XPCMessageSender.__deallocating_deinit()
{
  XPCMessageSender.deinit();
  sub_237F4FD70();
  return swift_deallocClassInstance();
}

uint64_t XPCMessageSender.send<A, B>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_237F4FDB4(a1, a2, a3, a4, a5, a6);
  sub_237F449B0();
  return swift_task_switch();
}

{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_237F4FDB4(a1, a2, a3, a4, a5, a6);
  v8 = *(_QWORD *)(v7 - 8);
  v6[10] = v8;
  v6[11] = *(_QWORD *)(v8 + 64);
  v6[12] = sub_237F4FCE4();
  sub_237F171BC(&qword_2568A9AC8);
  v6[13] = sub_237F4FCE4();
  sub_237F1725C(&qword_2568A91E0);
  sub_237F4FE10();
  v9 = type metadata accessor for AsyncThrowingStream.Continuation.BufferingPolicy();
  v6[14] = v9;
  v6[15] = *(_QWORD *)(v9 - 8);
  v6[16] = sub_237F4FCE4();
  sub_237F4FE10();
  v10 = type metadata accessor for AsyncThrowingStream.Continuation();
  v6[17] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v6[18] = v11;
  v6[19] = *(_QWORD *)(v11 + 64);
  v6[20] = swift_task_alloc();
  v6[21] = swift_task_alloc();
  sub_237F449B0();
  return sub_237F44B70();
}

uint64_t sub_237F4C6FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  _QWORD *v6;

  v2 = *(_QWORD *)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v4;
  v5 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v4 + 16) = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 48) = v2;
  *(_QWORD *)(v4 + 56) = v3;
  *(_QWORD *)(v4 + 64) = v1;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v6;
  *v6 = v0;
  v6[1] = sub_237F4C7A4;
  sub_237F449B0();
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

uint64_t sub_237F4C7A4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_237F449B0();
    return swift_task_switch();
  }
  else
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
}

uint64_t sub_237F4C814()
{
  uint64_t v0;

  swift_task_dealloc();
  return sub_237F44D0C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F4C840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  unint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v34 = a8;
  v35 = a7;
  v36 = a4;
  v31 = a3;
  v32 = a1;
  v33 = a2;
  sub_237F1725C(&qword_2568A91E0);
  v10 = type metadata accessor for CheckedContinuation();
  v11 = *(_QWORD *)(v10 - 8);
  v29 = v10;
  v12 = *(_QWORD *)(v11 + 64);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v29 - v14;
  v30 = (char *)&v29 - v14;
  v16 = *(_QWORD *)(a5 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_237F171BC(&qword_2568A9AC8);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for TaskPriority();
  _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)v21, 1, 1, v22);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v31, a5);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v15, v32, v10);
  v23 = (*(unsigned __int8 *)(v16 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v24 = (v17 + v23 + *(unsigned __int8 *)(v11 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v25 = (char *)swift_allocObject();
  *((_QWORD *)v25 + 2) = 0;
  *((_QWORD *)v25 + 3) = 0;
  *((_QWORD *)v25 + 4) = a5;
  *((_QWORD *)v25 + 5) = a6;
  v27 = v33;
  v26 = v34;
  *((_QWORD *)v25 + 6) = v35;
  *((_QWORD *)v25 + 7) = v26;
  *((_QWORD *)v25 + 8) = v27;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(&v25[v23], v18, a5);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v25[v24], v30, v29);
  *(_QWORD *)&v25[(v12 + v24 + 7) & 0xFFFFFFFFFFFFFFF8] = v36;
  swift_retain();
  sub_237F4BAA4((uint64_t)v21, (uint64_t)&unk_2568AA010, (uint64_t)v25);
  return swift_release();
}

uint64_t sub_237F4CA44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8[20] = v13;
  v8[21] = v14;
  v8[18] = a8;
  v8[19] = v12;
  v8[16] = a6;
  v8[17] = a7;
  v8[14] = a4;
  v8[15] = a5;
  sub_237F1725C(&qword_2568A91E0);
  v9 = type metadata accessor for CheckedContinuation();
  v8[22] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v8[23] = v10;
  v8[24] = *(_QWORD *)(v10 + 64);
  v8[25] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237F4CAD8()
{
  _QWORD *v0;

  sub_237F4EBD4(v0[14] + 16, (uint64_t)(v0 + 2));
  v0[26] = sub_237F171FC(v0 + 2, v0[5]);
  return sub_237F34CD8();
}

uint64_t sub_237F4CB28()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 216) = sub_237F4FDE4();
  *(_QWORD *)(v1 + 224) = v0;
  sub_237F449B0();
  return sub_237F44B70();
}

void sub_237F4CB74()
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
  unint64_t v9;
  unint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v17 = *(_QWORD *)(v0 + 224);
  v1 = *(_QWORD *)(v0 + 192);
  v15 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 184);
  v14 = *(_QWORD *)(v0 + 176);
  v4 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 168);
  v6 = *(_QWORD *)(v0 + 144);
  v5 = *(_QWORD *)(v0 + 152);
  v16 = *(_QWORD *)(v0 + 136);
  (*(void (**)(void))(v2 + 16))();
  v18 = v0 + 16;
  v7 = sub_237F4FD54();
  sub_237F4EBD4(v7, v8);
  v9 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v10 = (v1 + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  v11 = (char *)swift_allocObject();
  *((_QWORD *)v11 + 2) = v6;
  *((_QWORD *)v11 + 3) = v5;
  *((_QWORD *)v11 + 4) = v4;
  *((_QWORD *)v11 + 5) = v3;
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 32))(&v11[v9], v15, v14);
  sub_237F40068((__int128 *)(v0 + 56), (uint64_t)&v11[v10]);
  *(_QWORD *)&v11[(v10 + 47) & 0xFFFFFFFFFFFFFFF8] = v16;
  v12 = (_QWORD *)sub_237F45A28();
  v12[2] = v6;
  v12[3] = v5;
  v12[4] = v4;
  v12[5] = v3;
  v12[6] = sub_237F4F800;
  v12[7] = v11;
  dispatch thunk of XPCSession.send<A, B>(_:replyHandler:)();
  if (v17)
  {
    swift_release();
    swift_release();
    sub_237F172A0(v18);
    *(_QWORD *)(v0 + 96) = v17;
    sub_237F44E8C();
  }
  swift_release();
  swift_release();
  sub_237F172A0(v18);
  swift_task_dealloc();
  sub_237F4FD10();
  __asm { BR              X0 }
}

void sub_237F4CE20()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 224);
  sub_237F172A0(v0 + 16);
  *(_QWORD *)(v0 + 96) = v1;
  sub_237F44F78();
}

void sub_237F4CE64()
{
  uint64_t v0;

  CheckedContinuation.resume(throwing:)();
  if (qword_2568A8F60 != -1)
    swift_once();
  v0 = sub_237F44A50();
  sub_237F2B010(v0, (uint64_t)qword_2568A9FA0);
  sub_237F44F78();
}

uint64_t sub_237F4CF90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  _QWORD *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  BOOL v53;
  uint64_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint8_t *v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(char *, char *, uint64_t);
  char *v74;
  uint64_t v75;
  __int128 v76[3];

  v71 = a3;
  v75 = a2;
  v8 = sub_237F171BC(&qword_2568A9AC8);
  MEMORY[0x24BDAC7A8](v8);
  v72 = (uint64_t)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_237F171BC(&qword_2568AA018);
  MEMORY[0x24BDAC7A8](v10);
  v73 = (void (*)(char *, char *, uint64_t))((char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = type metadata accessor for XPCRichError();
  v70 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v69 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v74 = (char *)&v62 - v16;
  v17 = *(_QWORD *)(a6 - 8);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v62 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v62 - v21;
  v23 = sub_237F1725C(&qword_2568A91E0);
  v24 = type metadata accessor for Result();
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (uint64_t *)((char *)&v62 - v26);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))((char *)&v62 - v26, a1, v24);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v66 = v25;
    v67 = v24;
    v68 = a6;
    v28 = a1;
    v29 = *v27;
    *(_QWORD *)&v76[0] = v29;
    MEMORY[0x23B8282B4](v29);
    v30 = (uint64_t)v73;
    v31 = swift_dynamicCast();
    v65 = v23;
    v32 = v12;
    if ((v31 & 1) != 0)
    {
      _s10CloudAsset21UploadResponseMessageOwst_0(v30, 0, 1, v12);
      v33 = v70;
      v34 = v74;
      (*(void (**)(char *, uint64_t, uint64_t))(v70 + 32))(v74, v30, v12);
      if (qword_2568A8F60 != -1)
        swift_once();
      v35 = type metadata accessor for Logger();
      sub_237F2B010(v35, (uint64_t)qword_2568A9FA0);
      v36 = v69;
      v73 = *(void (**)(char *, char *, uint64_t))(v33 + 16);
      v73(v69, v34, v12);
      v37 = Logger.logObject.getter();
      v38 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v37, v38))
      {
        v39 = (uint8_t *)swift_slowAlloc();
        v40 = (_QWORD *)swift_slowAlloc();
        v63 = v39;
        v64 = v29;
        *(_DWORD *)v39 = 138412290;
        v62 = v39 + 4;
        sub_237F4F5C8(&qword_2568A9BE8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6678], MEMORY[0x24BEE6688]);
        swift_allocError();
        v41 = v33;
        v73(v42, v36, v32);
        v43 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)&v76[0] = v43;
        v29 = v64;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *v40 = v43;
        v44 = *(void (**)(char *, uint64_t))(v41 + 8);
        v44(v36, v32);
        v45 = v38;
        v46 = v63;
        _os_log_impl(&dword_237F15000, v37, v45, "received xpc error %@ from xpc session", v63, 0xCu);
        sub_237F171BC(&qword_2568A9B50);
        swift_arrayDestroy();
        MEMORY[0x23B8283BC](v40, -1, -1);
        MEMORY[0x23B8283BC](v46, -1, -1);
      }
      else
      {
        v44 = *(void (**)(char *, uint64_t))(v33 + 8);
        v44(v36, v12);
      }

      v56 = type metadata accessor for TaskPriority();
      v57 = v72;
      _s10CloudAsset21UploadResponseMessageOwst_0(v72, 1, 1, v56);
      sub_237F4EBD4(v71, (uint64_t)v76);
      v58 = swift_allocObject();
      *(_QWORD *)(v58 + 16) = 0;
      *(_QWORD *)(v58 + 24) = 0;
      sub_237F40068(v76, v58 + 32);
      sub_237F3B844(v57, (uint64_t)&unk_2568AA028, v58);
      swift_release();
      sub_237F4F5C8(&qword_2568A9BE8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6678], MEMORY[0x24BEE6688]);
      v59 = swift_allocError();
      v60 = v74;
      v73(v61, v74, v32);
      *(_QWORD *)&v76[0] = v59;
      type metadata accessor for CheckedContinuation();
      CheckedContinuation.resume(throwing:)();
      MEMORY[0x23B8282A8](v29);
      v44(v60, v32);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v66 + 8))(v28, v67);
    }
    else
    {
      _s10CloudAsset21UploadResponseMessageOwst_0(v30, 1, 1, v12);
      sub_237F4F944(v30, &qword_2568AA018);
      v48 = v28;
      v49 = v66;
      if (qword_2568A8F60 != -1)
        swift_once();
      v50 = type metadata accessor for Logger();
      sub_237F2B010(v50, (uint64_t)qword_2568A9FA0);
      v51 = Logger.logObject.getter();
      v52 = static os_log_type_t.error.getter();
      v53 = os_log_type_enabled(v51, v52);
      v54 = v67;
      if (v53)
      {
        v55 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v55 = 0;
        _os_log_impl(&dword_237F15000, v51, v52, "error received from xpc session is not XPC error type.", v55, 2u);
        MEMORY[0x23B8283BC](v55, -1, -1);
      }

      *(_QWORD *)&v76[0] = v29;
      type metadata accessor for CheckedContinuation();
      CheckedContinuation.resume(throwing:)();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v49 + 8))(v48, v54);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v17 + 32))(v22, v27, a6);
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v22, a6);
    type metadata accessor for CheckedContinuation();
    CheckedContinuation.resume(returning:)();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v22, a6);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(a1, v24);
  }
}

uint64_t sub_237F4D648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_237F4D660()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = sub_237F171FC(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
  return sub_237F34CD8();
}

uint64_t sub_237F4D69C()
{
  uint64_t (*v0)(void);

  sub_237F541A8();
  v0 = (uint64_t (*)(void))sub_237F44B7C();
  return sub_237F44D0C(v0);
}

uint64_t sub_237F4D6C8(uint64_t a1, uint64_t (*a2)(char *))
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  sub_237F1725C(&qword_2568A91E0);
  v4 = type metadata accessor for Result();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - v5;
  (*(void (**)(char *, uint64_t))(v7 + 16))((char *)&v9 - v5, a1);
  return a2(v6);
}

uint64_t sub_237F4D844()
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
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = *(_QWORD *)(v0 + 168);
  v18 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 128);
  v19 = *(_QWORD *)(v0 + 136);
  v20 = *(_QWORD *)(v0 + 160);
  v4 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 104);
  v22 = *(_QWORD *)(v0 + 152);
  v7 = *(_QWORD *)(v0 + 80);
  v21 = *(_QWORD *)(v0 + 88);
  v25 = *(_QWORD *)(v0 + 64);
  v26 = *(_QWORD *)(v0 + 72);
  v24 = *(_QWORD *)(v0 + 56);
  v17 = *(_QWORD *)(v0 + 32);
  v23 = *(_OWORD *)(v0 + 40);
  v16 = *(_QWORD *)(v0 + 24);
  sub_237F4BBE0(v2);
  static AsyncThrowingStream.makeStream<>(of:throwing:bufferingPolicy:)();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v8 = sub_237F44FE0();
  sub_237F450FC(v5, v9, v10, v8);
  sub_237F4FD3C(v20, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 16));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v16, v17);
  v11 = (*(unsigned __int8 *)(v18 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v12 = (v22 + *(unsigned __int8 *)(v7 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = 0;
  *(_QWORD *)(v13 + 24) = 0;
  *(_QWORD *)(v13 + 32) = v17;
  *(_OWORD *)(v13 + 40) = v23;
  *(_QWORD *)(v13 + 56) = v24;
  *(_QWORD *)(v13 + 64) = v25;
  sub_237F4FD3C(v13 + v11, v20, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 32));
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(v13 + v12, v6, v17);
  *(_QWORD *)(v13 + ((v21 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)) = v26;
  swift_retain();
  sub_237F3B844(v5, (uint64_t)&unk_2568A9FE8, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v1, v19);
  sub_237F44A48();
  sub_237F34D94();
  swift_task_dealloc();
  sub_237F44A80();
  sub_237F34D9C();
  v14 = (uint64_t (*)(void))sub_237F44B7C();
  return v14();
}

uint64_t sub_237F4DA5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;

  *(_QWORD *)(v8 + 128) = v13;
  *(_OWORD *)(v8 + 112) = v12;
  *(_QWORD *)(v8 + 96) = a6;
  *(_QWORD *)(v8 + 104) = a8;
  *(_QWORD *)(v8 + 80) = a4;
  *(_QWORD *)(v8 + 88) = a5;
  v9 = type metadata accessor for XPCRichError();
  *(_QWORD *)(v8 + 136) = v9;
  *(_QWORD *)(v8 + 144) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 152) = swift_task_alloc();
  *(_QWORD *)(v8 + 160) = swift_task_alloc();
  *(_QWORD *)(v8 + 168) = swift_task_alloc();
  *(_QWORD *)(v8 + 176) = type metadata accessor for XPCAsyncSequenceRequest();
  *(_QWORD *)(v8 + 184) = swift_task_alloc();
  v10 = type metadata accessor for UUID();
  *(_QWORD *)(v8 + 192) = v10;
  *(_QWORD *)(v8 + 200) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 208) = swift_task_alloc();
  *(_QWORD *)(v8 + 216) = swift_task_alloc();
  *(_QWORD *)(v8 + 224) = swift_task_alloc();
  *(_QWORD *)(v8 + 232) = swift_task_alloc();
  *(_QWORD *)(v8 + 240) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237F4DB6C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  UUID.init()();
  *(_QWORD *)(v0 + 248) = *(_QWORD *)(v1 + 56);
  return sub_237F34CD8();
}

uint64_t sub_237F4DBA8()
{
  sub_237F4BC4C();
  sub_237F449B0();
  return sub_237F34CD8();
}

uint64_t sub_237F4DBE4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 256) = sub_237F171FC((_QWORD *)(*(_QWORD *)(v0 + 80) + 16), *(_QWORD *)(*(_QWORD *)(v0 + 80) + 40));
  return sub_237F34CD8();
}

uint64_t sub_237F4DC24()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 264) = sub_237F4FDE4();
  *(_QWORD *)(v1 + 272) = v0;
  sub_237F449B0();
  return sub_237F44B70();
}

uint64_t sub_237F4DC70()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void);

  v1 = v0[34];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[25] + 16))(v0[29], v0[30], v0[24]);
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  v2 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  v4 = v1;
  v5 = v0[29];
  v7 = v0[24];
  v6 = v0[25];
  if (v4)
  {
    (*(void (**)(_QWORD, _QWORD))(v6 + 8))(v0[29], v0[24]);
    swift_release();
    swift_release();
    v0[2] = v4;
    sub_237F45244();
  }
  v8 = v2;
  v9 = v3;
  v11 = v0[22];
  v10 = v0[23];
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v10, v5, v7);
  v12 = (uint64_t *)(v10 + *(int *)(v11 + 20));
  *v12 = v8;
  v12[1] = v9;
  sub_237F4F5C8(&qword_2568A9BF8, (uint64_t (*)(uint64_t))type metadata accessor for XPCAsyncSequenceRequest, (uint64_t)&protocol conformance descriptor for XPCAsyncSequenceRequest);
  dispatch thunk of XPCSession.send<A>(_:)();
  v13 = v0[30];
  v14 = v0[25];
  v15 = v0[23];
  swift_release();
  sub_237F1E808(v15);
  sub_237F44C3C(v13, *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8));
  sub_237F4FBD0();
  sub_237F44A48();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  sub_237F44A9C();
  sub_237F44A80();
  sub_237F44AC0();
  sub_237F44BF0();
  v16 = (uint64_t (*)(void))sub_237F44B7C();
  return v16();
}

void sub_237F4E3B4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 272);
  sub_237F44E8C();
}

void sub_237F4E3F8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[33] = sub_237F171BC(&qword_2568A91E0);
  if ((swift_dynamicCast() & 1) != 0)
    sub_237F44D3C();
  MEMORY[0x23B8282A8](*v1);
  if (qword_2568A8F60 != -1)
    swift_once();
  v2 = v0[30];
  v4 = v0[25];
  v3 = v0[26];
  v5 = sub_237F44A50();
  sub_237F2B010(v5, (uint64_t)qword_2568A9FA0);
  sub_237F4FD3C(v3, v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
  sub_237F44E8C();
}

uint64_t sub_237F4E994()
{
  sub_237F541A8();
  sub_237F449B0();
  return sub_237F34CD8();
}

void sub_237F4E9C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(NSObject *, uint64_t);
  uint64_t v17;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v2 + 296))(*(_QWORD *)(v2 + 216), *(_QWORD *)(v2 + 240), *(_QWORD *)(v2 + 192));
  Logger.logObject.getter();
  v4 = sub_237F44EA4();
  if (os_log_type_enabled(v0, v4))
  {
    v15 = *(void (**)(uint64_t, uint64_t))(v2 + 320);
    v5 = *(_QWORD *)(v2 + 216);
    v6 = *(_QWORD *)(v2 + 192);
    v7 = (_DWORD *)sub_237F44998();
    v17 = sub_237F44998();
    *v7 = 136315138;
    sub_237F4F5C8(&qword_2568A9BE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v8 = dispatch thunk of CustomStringConvertible.description.getter();
    *(_QWORD *)(v2 + 56) = sub_237F42698(v8, v9, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    sub_237F44D50();
    v15(v5, v6);
    sub_237F4FD2C(&dword_237F15000, v0, v10, "[message id = %s] evict xpc session from cache as it is no longer usable");
    sub_237F449F4();
    sub_237F4498C();
  }
  (*(void (**)(_QWORD, _QWORD))(v2 + 320))(*(_QWORD *)(v2 + 216), *(_QWORD *)(v2 + 192));

  v14 = *(void (**)(uint64_t))(v2 + 312);
  v16 = *(void (**)(NSObject *, uint64_t))(v2 + 320);
  sub_237F4FC24();
  sub_237F4F5C8(&qword_2568A9BE8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6678], MEMORY[0x24BEE6688]);
  v11 = sub_237F4FC58();
  sub_237F4FC44(v11, v12);
  *(_QWORD *)(v2 + 48) = v3;
  sub_237F4FCA4();
  AsyncThrowingStream.Continuation.finish(throwing:)();
  v13 = sub_237F4FD54();
  v14(v13);
  v16(v0, v1);
  sub_237F4FDF0();
}

uint64_t sub_237F4EB8C()
{
  uint64_t (*v0)(void);

  sub_237F4FBD0();
  sub_237F44A48();
  sub_237F34D9C();
  sub_237F449EC();
  sub_237F34D94();
  sub_237F44A9C();
  sub_237F44A80();
  sub_237F44AC0();
  sub_237F44BF0();
  v0 = (uint64_t (*)(void))sub_237F44B7C();
  return v0();
}

uint64_t sub_237F4EBD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_237F4EC1C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_237F45154(v0);
  v2 = sub_237F4FCB4(v1);
  return sub_237F4C640(v2, v3, v4, v5);
}

uint64_t sub_237F4EC70(uint64_t a1)
{
  uint64_t *v1;

  return sub_237F4C840(a1, v1[6], v1[7], v1[8], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_237F4EC84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  sub_237F2D8B4();
  v1 = *(_QWORD *)(v0 + 32);
  sub_237F1725C(&qword_2568A91E0);
  v2 = *(_QWORD *)(type metadata accessor for AsyncThrowingStream.Continuation() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v1 - 8);
  v5 = (v3 + *(_QWORD *)(v2 + 64) + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  sub_237F4FC6C();
  swift_release();
  sub_237F44C3C(v0 + v3, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v5, v1);
  return sub_237F44B44();
}

uint64_t sub_237F4ED30(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
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
  uint64_t v19;

  sub_237F4FD94(a1);
  sub_237F1725C(&qword_2568A91E0);
  type metadata accessor for AsyncThrowingStream.Continuation();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)sub_237F45154(v1);
  sub_237F4FBEC(v2, v3, v4, v5, v6, v7, v8, v9, v19);
  sub_237F454DC();
  return sub_237F4DA5C(v10, v11, v12, v13, v14, v15, v16, v17);
}

uint64_t sub_237F4EDF8()
{
  uint64_t v0;

  sub_237F34D1C();
  return sub_237F44D0C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t type metadata accessor for XPCMessageSender()
{
  return objc_opt_self();
}

uint64_t method lookup function for XPCMessageSender()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCMessageSender.__allocating_init(machServiceName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_237F4EE60(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_237F4EEC4;
  return v6(a1);
}

uint64_t sub_237F4EEC4()
{
  uint64_t (*v0)(void);

  sub_237F34D1C();
  v0 = (uint64_t (*)(void))sub_237F44B7C();
  return sub_237F44D0C(v0);
}

unint64_t sub_237F4EEE8(uint64_t a1)
{
  uint64_t v2;

  sub_237F18108();
  sub_237F4F5C8(&qword_2568A8F70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return sub_237F4EF50(a1, v2);
}

unint64_t sub_237F4EF50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = type metadata accessor for UUID();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_237F4F5C8(&qword_2568A9FF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v14 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_237F4F090()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;

  sub_237F2D8B4();
  sub_237F1725C(&qword_2568A91E0);
  v1 = *(_QWORD *)(sub_237F4FE04() - 8);
  v2 = (*(_QWORD *)(v1 + 64)
      + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
      + 7) & 0xFFFFFFFFFFFFFFF8;
  v3 = *(_QWORD *)(sub_237F18108() - 8);
  v4 = (v2 + *(unsigned __int8 *)(v3 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_237F4FD00();
  swift_release();
  sub_237F44C3C(v0 + v4, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  return sub_237F44B44();
}

uint64_t sub_237F4F140(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  sub_237F1725C(&qword_2568A91E0);
  v5 = *(_QWORD *)(type metadata accessor for AsyncThrowingStream.Continuation() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  v8 = *(unsigned __int8 *)(*(_QWORD *)(sub_237F18108() - 8) + 80);
  return sub_237F4BE38(a1, v1 + v6, *(_QWORD *)(v1 + v7), v1 + ((v7 + v8 + 8) & ~v8), v3, v4);
}

uint64_t sub_237F4F1F4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v14;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_237F4EEE8(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v14 = *v2;
  v7 = *v2;
  *v2 = 0x8000000000000000;
  v8 = *(_QWORD *)(v7 + 24);
  sub_237F171BC(&qword_2568A9FF8);
  _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v8);
  v9 = *(_QWORD *)(v14 + 48);
  v10 = sub_237F18108();
  v11 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * v4, v10);
  v12 = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 16 * v4);
  sub_237F171BC(&qword_2568A9FB8);
  sub_237F4F5C8(&qword_2568A8F70, v11, MEMORY[0x24BDCEA88]);
  _NativeDictionary._delete(at:)();
  *v2 = v14;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_237F4F33C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  *v3 = 0x8000000000000000;
  sub_237F4F3B8(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *v3 = v9;
  return swift_bridgeObjectRelease();
}

uint64_t sub_237F4F3B8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  _BOOL8 v17;
  Swift::Int v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;

  v5 = (_QWORD **)v4;
  v28 = a2;
  v9 = type metadata accessor for UUID();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (_QWORD *)*v4;
  v14 = sub_237F4EEE8(a3);
  v16 = v13[2];
  v17 = (v15 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_9;
  }
  v19 = v14;
  v20 = v15;
  sub_237F171BC(&qword_2568A9FF8);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v18))
    goto LABEL_5;
  v21 = sub_237F4EEE8(a3);
  if ((v20 & 1) != (v22 & 1))
  {
LABEL_9:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  v19 = v21;
LABEL_5:
  v23 = *v5;
  if ((v20 & 1) != 0)
  {
    v24 = (uint64_t *)(v23[7] + 16 * v19);
    v25 = v28;
    *v24 = a1;
    v24[1] = v25;
    return swift_release();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v9);
    return sub_237F4F528(v19, (uint64_t)v12, a1, v28, v23);
  }
}

uint64_t sub_237F4F528(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  _QWORD *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v10 = a5[6];
  v11 = type metadata accessor for UUID();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a2, v11);
  v13 = (_QWORD *)(a5[7] + 16 * a1);
  *v13 = a3;
  v13[1] = a4;
  v14 = a5[2];
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (v15)
    __break(1u);
  else
    a5[2] = v16;
  return result;
}

uint64_t sub_237F4F5C8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B82832C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_237F4F608()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;

  sub_237F2D8B4();
  v1 = ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 64);
  sub_237F1725C(&qword_2568A91E0);
  v2 = *(_QWORD *)(type metadata accessor for CheckedContinuation() - 8);
  v3 = (v1 + *(unsigned __int8 *)(v2 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  sub_237F4FC6C();
  swift_release();
  sub_237F4FD00();
  sub_237F44C3C(v0 + v3, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  return sub_237F44B44();
}

uint64_t sub_237F4F6A8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
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
  uint64_t v19;

  sub_237F4FD94(a1);
  sub_237F1725C(&qword_2568A91E0);
  type metadata accessor for CheckedContinuation();
  sub_237F4FE48();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)sub_237F45154(v1);
  sub_237F4FBEC(v2, v3, v4, v5, v6, v7, v8, v9, v19);
  sub_237F454DC();
  return sub_237F4CA44(v10, v11, v12, v13, v14, v15, v16, v17);
}

uint64_t sub_237F4F764()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_237F1725C(&qword_2568A91E0);
  v1 = type metadata accessor for CheckedContinuation();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  sub_237F172A0(v0 + v4);
  return swift_deallocObject();
}

uint64_t sub_237F4F800(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  sub_237F1725C(&qword_2568A91E0);
  type metadata accessor for CheckedContinuation();
  sub_237F4FE48();
  return sub_237F4CF90(a1, v1 + v6, v1 + (v5 & 0xFFFFFFFFFFFFFFF8), *(_QWORD *)(v1 + (((v5 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFF8)), v3, v4);
}

uint64_t sub_237F4F894()
{
  swift_release();
  sub_237F4FD70();
  return swift_deallocObject();
}

uint64_t sub_237F4F8B0(uint64_t a1)
{
  uint64_t v1;

  return sub_237F4D6C8(a1, *(uint64_t (**)(char *))(v1 + 48));
}

uint64_t sub_237F4F8C4()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  sub_237F172A0(v0 + 32);
  return swift_deallocObject();
}

uint64_t sub_237F4F8F0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_237F45154(v0);
  v2 = sub_237F4FCB4(v1);
  return sub_237F4D648(v2, v3, v4, v5);
}

uint64_t sub_237F4F944(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_237F171BC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_237F4F980()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237F4F9A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(int **)(v1 + 16);
  v5 = swift_task_alloc();
  v6 = (_QWORD *)sub_237F45154(v5);
  *v6 = v2;
  v6[1] = sub_237F4FBCC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2568AA030 + dword_2568AA030))(a1, v4);
}

uint64_t sub_237F4FA10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for XPCAsyncSequenceResponse();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237F4FA54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;

  v1 = type metadata accessor for XPCAsyncSequenceResponse();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_unknownObjectRelease();
  swift_release();
  v3 = v0 + ((v2 + 40) & ~v2);
  v4 = sub_237F18108();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (uint64_t *)(v3 + *(int *)(v1 + 20));
  v6 = v5[1];
  if (((v6 >> 60) | 4) != 0xF)
    sub_237F17178(*v5, v6);
  return swift_deallocObject();
}

uint64_t sub_237F4FAF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for XPCAsyncSequenceResponse();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237F4FB3C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for XPCAsyncSequenceResponse() - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = swift_task_alloc();
  v10 = (_QWORD *)sub_237F45154(v9);
  *v10 = v2;
  v10[1] = sub_237F4EDF8;
  return sub_237F4C530(a1, v5, v6, v7, v8);
}

uint64_t sub_237F4FBD0()
{
  return swift_task_dealloc();
}

uint64_t sub_237F4FBEC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  *a1 = v11;
  a1[1] = v9;
  v13[4] = v10;
  v13[2] = v12;
  v13[3] = a9;
  return v13[5];
}

uint64_t sub_237F4FC44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);

  return v4(a2, v2, v3);
}

uint64_t sub_237F4FC58()
{
  return swift_allocError();
}

uint64_t sub_237F4FC6C()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_237F4FC88(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 104) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_237F4FCA4()
{
  return type metadata accessor for AsyncThrowingStream.Continuation();
}

uint64_t sub_237F4FCB4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t sub_237F4FCD0@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 296) = a1;
  return a1(v1, v2, v3);
}

uint64_t sub_237F4FCE4()
{
  return swift_task_alloc();
}

uint64_t sub_237F4FCF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t sub_237F4FD00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1 + v3, v0);
}

void sub_237F4FD2C(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  os_log_type_t v5;

  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

uint64_t sub_237F4FD3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

BOOL sub_237F4FD44(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_237F4FD54()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F4FD60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_237F4FD70()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F4FD80(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = result;
  return result;
}

uint64_t sub_237F4FD94(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = result;
  return result;
}

uint64_t sub_237F4FDA8()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_237F4FDB4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;

  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = result;
  v7[9] = *v6;
  return result;
}

uint64_t sub_237F4FDE4()
{
  return sub_237F54254();
}

void sub_237F4FDF0()
{
  JUMPOUT(0x23B8282A8);
}

uint64_t sub_237F4FDF8()
{
  return type metadata accessor for AsyncThrowingStream.Continuation();
}

uint64_t sub_237F4FE04()
{
  return type metadata accessor for AsyncThrowingStream.Continuation();
}

uint64_t sub_237F4FE10()
{
  return 0;
}

_QWORD *sub_237F4FE24()
{
  uint64_t v0;
  _QWORD *result;

  result = sub_237F171FC((_QWORD *)(*(_QWORD *)(v0 + 80) + 16), *(_QWORD *)(*(_QWORD *)(v0 + 80) + 40));
  *(_QWORD *)(v0 + 328) = result;
  return result;
}

uint64_t dispatch thunk of AssetRequest.tenantName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of AssetRequest.workingDirectory.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of AssetRequest.credential.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t DownloadResponseMessage.hash(into:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_237F171BC(&qword_2568A9B78);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v3);
  sub_237F1DD54();
  v6 = v5 - v4;
  type metadata accessor for DownloadResponseMessage();
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v7);
  sub_237F48BB8();
  sub_237F4FFCC((uint64_t)v1, (uint64_t)v1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = *v1;
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(0);
    sub_237F32F78(a1, v8);
  }
  else
  {
    sub_237F171BC(&qword_2568A9B90);
    sub_237F50EE4((uint64_t)v1, v6);
    Hasher._combine(_:)(0);
    sub_237F45E74();
    v9 = String.hash(into:)();
    sub_237F521F8(v9, &qword_2568A9B78);
  }
  return sub_237F521E4();
}

uint64_t type metadata accessor for DownloadResponseMessage()
{
  uint64_t result;

  result = qword_2568AA0B8;
  if (!qword_2568AA0B8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237F4FFCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DownloadResponseMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static DownloadResponseMessage.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD **v17;
  _QWORD *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;

  sub_237F171BC(&qword_2568A9B78);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v5);
  sub_237F48BB8();
  type metadata accessor for DownloadResponseMessage();
  sub_237F1B968();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (uint64_t *)((char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v35 - v10;
  sub_237F171BC(&qword_2568AA050);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v12);
  sub_237F1DD54();
  v15 = v14 - v13;
  v17 = (_QWORD **)(v14 - v13 + *(int *)(v16 + 48));
  sub_237F4FFCC(a1, v14 - v13);
  sub_237F4FFCC(a2, (uint64_t)v17);
  if (sub_237F52200() != 1)
  {
    sub_237F4FFCC(v15, (uint64_t)v11);
    v20 = *(int *)(sub_237F171BC(&qword_2568A9B90) + 48);
    v22 = *(_QWORD *)&v11[v20];
    v21 = *(_QWORD *)&v11[v20 + 8];
    if (sub_237F52200() == 1)
    {
      v23 = sub_237F52238();
      sub_237F521F8(v23, &qword_2568A9B78);
LABEL_7:
      sub_237F50F2C(v15, &qword_2568AA050);
LABEL_17:
      v19 = 0;
      return v19 & 1;
    }
    v24 = (char *)v17 + v20;
    v26 = *(uint64_t *)((char *)v17 + v20);
    v25 = *((_QWORD *)v24 + 1);
    sub_237F50EE4((uint64_t)v17, v2);
    sub_237F45A94((uint64_t)v11, v2);
    v28 = v27;
    sub_237F521F8(v27, &qword_2568A9B78);
    if ((v28 & 1) != 0)
    {
      if (v22 == v26 && v21 == v25)
      {
        v34 = swift_bridgeObjectRelease_n();
        sub_237F52230(v34, &qword_2568A9B78);
LABEL_20:
        sub_237F52208();
        v19 = 1;
        return v19 & 1;
      }
      v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_237F521E4();
      v32 = sub_237F52238();
      sub_237F52230(v32, &qword_2568A9B78);
      if ((v31 & 1) != 0)
        goto LABEL_20;
    }
    else
    {
      sub_237F52230(v29, &qword_2568A9B78);
      sub_237F521E4();
      sub_237F52238();
    }
    sub_237F52208();
    goto LABEL_17;
  }
  sub_237F4FFCC(v15, (uint64_t)v9);
  v18 = (_QWORD *)*v9;
  if (sub_237F52200() != 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  v19 = sub_237F2DB1C(v18, *v17);
  swift_bridgeObjectRelease();
  sub_237F521E4();
  sub_237F52208();
  return v19 & 1;
}

uint64_t sub_237F50278(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x65736E6F70736572 && a2 == 0xE800000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x8000000237F650A0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_237F50364(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000019;
  else
    return 0x65736E6F70736572;
}

uint64_t sub_237F503A0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x746C75736572 && a2 == 0xE600000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000237F651A0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

void sub_237F50484(char a1)
{
  sub_237F1BA84();
  Hasher._combine(_:)(a1 & 1);
  sub_237F1BBC8();
  sub_237F1BBBC();
}

uint64_t sub_237F504B4(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000015;
  else
    return 0x746C75736572;
}

uint64_t sub_237F504F0()
{
  char *v0;

  return sub_237F50364(*v0);
}

uint64_t sub_237F504F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F50278(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237F5051C()
{
  sub_237F50FA0();
  return CodingKey.description.getter();
}

uint64_t sub_237F50544()
{
  sub_237F50FA0();
  return CodingKey.debugDescription.getter();
}

void sub_237F5056C()
{
  char *v0;

  sub_237F50484(*v0);
}

void sub_237F50584()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  sub_237F1BBC8();
  sub_237F1BBBC();
}

uint64_t sub_237F505B8()
{
  char *v0;

  return sub_237F504B4(*v0);
}

uint64_t sub_237F505C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F503A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237F505E4()
{
  sub_237F51018();
  return CodingKey.description.getter();
}

uint64_t sub_237F5060C()
{
  sub_237F51018();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F50638()
{
  sub_237F50FDC();
  return CodingKey.description.getter();
}

uint64_t sub_237F50660()
{
  sub_237F50FDC();
  return CodingKey.debugDescription.getter();
}

void DownloadResponseMessage.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
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

  v3 = sub_237F171BC(&qword_2568AA058);
  v20 = *(_QWORD *)(v3 - 8);
  v21 = v3;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v4);
  sub_237F1DD54();
  v7 = v6 - v5;
  v8 = sub_237F171BC(&qword_2568AA060);
  v23 = *(_QWORD *)(v8 - 8);
  v24 = v8;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v9);
  sub_237F1DD54();
  v12 = v11 - v10;
  sub_237F171BC(&qword_2568A9B78);
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v13);
  sub_237F180DC();
  v22 = v14;
  type metadata accessor for DownloadResponseMessage();
  sub_237F1B968();
  MEMORY[0x24BDAC7A8](v15);
  sub_237F1BC44();
  v27 = sub_237F171BC(&qword_2568AA068);
  v16 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  sub_237F1DD54();
  v19 = v18 - v17;
  sub_237F171FC(a1, a1[3]);
  sub_237F50FA0();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  sub_237F4FFCC(v25, v1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_237F52224();
    sub_237F4B9E4();
    sub_237F47894();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v7, v21);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v19, v27);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_237F171BC(&qword_2568A9B90);
    sub_237F50EE4(v1, v22);
    sub_237F51018();
    sub_237F4B9E4();
    sub_237F51098(&qword_2568AA088);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    if (!v26)
      KeyedEncodingContainer.encode(_:forKey:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v12, v24);
    sub_237F50F2C(v22, &qword_2568A9B78);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v19, v27);
  }
  sub_237F1B978();
}

void DownloadResponseMessage.hashValue.getter()
{
  _BYTE v0[72];

  sub_237F1BA84();
  DownloadResponseMessage.hash(into:)((uint64_t)v0);
  sub_237F1BBC8();
  sub_237F1BBBC();
}

void DownloadResponseMessage.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t);
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  char *v50;
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
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  char v65;
  char v66;

  v53 = a2;
  v4 = sub_237F171BC(&qword_2568AA090);
  v54 = *(_QWORD *)(v4 - 8);
  v55 = v4;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v5);
  sub_237F180DC();
  v58 = v6;
  v7 = sub_237F171BC(&qword_2568AA098);
  v8 = *(_QWORD *)(v7 - 8);
  v56 = v7;
  v57 = v8;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v9);
  sub_237F180DC();
  v60 = v10;
  v11 = sub_237F171BC(&qword_2568AA0A0);
  v59 = *(_QWORD *)(v11 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v12);
  sub_237F1BC44();
  v13 = type metadata accessor for DownloadResponseMessage();
  sub_237F1B968();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v48 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v48 - v21;
  v23 = a1[3];
  v61 = a1;
  sub_237F171FC(a1, v23);
  sub_237F50FA0();
  v24 = v62;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v24)
    goto LABEL_9;
  v49 = (uint64_t *)v17;
  v50 = v22;
  v51 = v20;
  v52 = 0;
  v62 = v13;
  v25 = KeyedDecodingContainer.allKeys.getter();
  v26 = *(_QWORD *)(v25 + 16);
  v27 = v11;
  if (!v26)
  {
LABEL_7:
    v33 = v62;
    v34 = type metadata accessor for DecodingError();
    swift_allocError();
    v36 = v35;
    sub_237F171BC(&qword_2568A95B0);
    *v36 = v33;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v34 - 8) + 104))(v36, *MEMORY[0x24BEE26D0], v34);
    swift_willThrow();
    sub_237F4B9A4();
    (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v2, v27);
    goto LABEL_9;
  }
  v28 = *(_BYTE *)(v25 + 32);
  sub_237F33F24(1, v26, v25, v25 + 32, 0, (2 * v26) | 1);
  v30 = v29;
  v32 = v31;
  swift_bridgeObjectRelease();
  if (v30 != v32 >> 1)
  {
    v27 = v11;
    goto LABEL_7;
  }
  if ((v28 & 1) != 0)
  {
    sub_237F52224();
    sub_237F521C4();
    sub_237F479C0();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v37 = sub_237F52210();
    v38(v37);
    sub_237F4B9A4();
    sub_237F521D8(*(uint64_t (**)(uint64_t, uint64_t))(v59 + 8));
    v39 = v49;
    *v49 = v63;
    swift_storeEnumTagMultiPayload();
    sub_237F521EC((uint64_t)v39);
  }
  else
  {
    v66 = 0;
    sub_237F51018();
    sub_237F521C4();
    sub_237F171BC(&qword_2568A9B78);
    v65 = 0;
    sub_237F51098(&qword_2568AA0A8);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v64 = 1;
    v40 = KeyedDecodingContainer.decode(_:forKey:)();
    v41 = v59;
    v52 = 0;
    v42 = v57;
    v44 = v43;
    v58 = v40;
    v45 = sub_237F171BC(&qword_2568A9B90);
    v46 = v42;
    v47 = (uint64_t)v51;
    v39 = (uint64_t *)&v51[*(int *)(v45 + 48)];
    sub_237F52240(*(uint64_t (**)(uint64_t, uint64_t))(v46 + 8));
    sub_237F4B9A4();
    sub_237F521D8(*(uint64_t (**)(uint64_t, uint64_t))(v41 + 8));
    *v39 = v58;
    v39[1] = v44;
    swift_storeEnumTagMultiPayload();
    sub_237F521EC(v47);
  }
  sub_237F51054((uint64_t)v39, v53);
LABEL_9:
  sub_237F172A0((uint64_t)v61);
  sub_237F1B978();
}

Swift::Int sub_237F50E80()
{
  _BYTE v1[72];

  Hasher.init(_seed:)();
  DownloadResponseMessage.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

void sub_237F50EB8(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  DownloadResponseMessage.init(from:)(a1, a2);
}

void sub_237F50ECC(_QWORD *a1)
{
  DownloadResponseMessage.encode(to:)(a1);
}

uint64_t sub_237F50EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237F171BC(&qword_2568A9B78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_237F50F2C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_237F171BC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  sub_237F18140();
}

uint64_t sub_237F50F64(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DownloadResponseMessage();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_237F50FA0()
{
  unint64_t result;

  result = qword_2568AA070;
  if (!qword_2568AA070)
  {
    result = MEMORY[0x23B82832C](&unk_237F6146C, &type metadata for DownloadResponseMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA070);
  }
  return result;
}

unint64_t sub_237F50FDC()
{
  unint64_t result;

  result = qword_2568AA078;
  if (!qword_2568AA078)
  {
    result = MEMORY[0x23B82832C](&unk_237F6141C, &type metadata for DownloadResponseMessage.SimultaneousTransferErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA078);
  }
  return result;
}

unint64_t sub_237F51018()
{
  unint64_t result;

  result = qword_2568AA080;
  if (!qword_2568AA080)
  {
    result = MEMORY[0x23B82832C](&unk_237F613CC, &type metadata for DownloadResponseMessage.ResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA080);
  }
  return result;
}

uint64_t sub_237F51054(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DownloadResponseMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_237F51098(_QWORD *a1)
{
  if (!*a1)
  {
    sub_237F1725C(&qword_2568A9B78);
    sub_237F48CA0();
  }
  sub_237F18140();
}

void sub_237F510D0()
{
  sub_237F48B2C(&qword_2568AA0B0, (void (*)(uint64_t))type metadata accessor for DownloadResponseMessage);
}

uint64_t *initializeBufferWithCopyOfBuffer for DownloadResponseMessage(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v45;
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v6 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v6 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
    }
    else
    {
      v7 = type metadata accessor for AssetDownloadResponse();
      if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)a2, 1, v7))
      {
        v8 = sub_237F171BC(&qword_2568A9B78);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
      }
      else
      {
        v9 = type metadata accessor for UUID();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
        v10 = *(int *)(v7 + 20);
        v11 = (char *)a1 + v10;
        v12 = (char *)a2 + v10;
        v13 = type metadata accessor for URL();
        v46 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
        v47 = v13;
        v46(v11, v12, v13);
        v14 = (int *)type metadata accessor for Asset.ID(0);
        v15 = v14[5];
        v16 = &v11[v15];
        v17 = &v12[v15];
        v18 = *((_QWORD *)v17 + 1);
        *(_QWORD *)v16 = *(_QWORD *)v17;
        *((_QWORD *)v16 + 1) = v18;
        v19 = v14[6];
        v20 = (uint64_t *)&v11[v19];
        v21 = (uint64_t *)&v12[v19];
        v22 = *v21;
        v23 = v21[1];
        swift_bridgeObjectRetain();
        sub_237F17134(v22, v23);
        *v20 = v22;
        v20[1] = v23;
        v24 = v14[7];
        v25 = (uint64_t *)&v11[v24];
        v26 = (uint64_t *)&v12[v24];
        v27 = *v26;
        v28 = v26[1];
        sub_237F17134(*v26, v28);
        *v25 = v27;
        v25[1] = v28;
        v29 = type metadata accessor for Asset(0);
        v30 = *(int *)(v29 + 20);
        v31 = (uint64_t *)&v11[v30];
        v45 = v7;
        v32 = &v12[v30];
        v33 = *(_QWORD *)&v12[v30];
        v34 = *(_QWORD *)&v12[v30 + 8];
        sub_237F17134(v33, v34);
        *v31 = v33;
        v31[1] = v34;
        v35 = *((_QWORD *)v32 + 2);
        v36 = *((_QWORD *)v32 + 3);
        sub_237F17134(v35, v36);
        v31[2] = v35;
        v31[3] = v36;
        *(_QWORD *)&v11[*(int *)(v29 + 24)] = *(_QWORD *)&v12[*(int *)(v29 + 24)];
        v46((char *)a1 + *(int *)(v45 + 24), (char *)a2 + *(int *)(v45 + 24), v47);
        v37 = *(int *)(v45 + 28);
        v38 = (char *)a1 + v37;
        v39 = (char *)a2 + v37;
        *(_OWORD *)v38 = *(_OWORD *)v39;
        v38[16] = v39[16];
        _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)a1, 0, 1, v45);
      }
      v40 = *(int *)(sub_237F171BC(&qword_2568A9B90) + 48);
      v41 = (uint64_t *)((char *)a1 + v40);
      v42 = (uint64_t *)((char *)a2 + v40);
      v43 = v42[1];
      *v41 = *v42;
      v41[1] = v43;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for DownloadResponseMessage(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  if (swift_getEnumCaseMultiPayload() != 1)
  {
    v2 = type metadata accessor for AssetDownloadResponse();
    if (!_s10CloudAsset21UploadResponseMessageOwet_0(a1, 1, v2))
    {
      v3 = type metadata accessor for UUID();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      v4 = a1 + *(int *)(v2 + 20);
      v5 = type metadata accessor for URL();
      v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
      v6(v4, v5);
      v7 = type metadata accessor for Asset.ID(0);
      swift_bridgeObjectRelease();
      sub_237F17178(*(_QWORD *)(v4 + *(int *)(v7 + 24)), *(_QWORD *)(v4 + *(int *)(v7 + 24) + 8));
      sub_237F17178(*(_QWORD *)(v4 + *(int *)(v7 + 28)), *(_QWORD *)(v4 + *(int *)(v7 + 28) + 8));
      v8 = v4 + *(int *)(type metadata accessor for Asset(0) + 20);
      sub_237F17178(*(_QWORD *)v8, *(_QWORD *)(v8 + 8));
      sub_237F17178(*(_QWORD *)(v8 + 16), *(_QWORD *)(v8 + 24));
      v6(a1 + *(int *)(v2 + 24), v5);
    }
    sub_237F171BC(&qword_2568A9B90);
  }
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for DownloadResponseMessage(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v42;
  void (*v43)(char *, char *, uint64_t);
  uint64_t v44;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *a1 = *a2;
    swift_bridgeObjectRetain();
  }
  else
  {
    v4 = type metadata accessor for AssetDownloadResponse();
    if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)a2, 1, v4))
    {
      v5 = sub_237F171BC(&qword_2568A9B78);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
    }
    else
    {
      v6 = type metadata accessor for UUID();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      v7 = *(int *)(v4 + 20);
      v8 = (char *)a1 + v7;
      v9 = (char *)a2 + v7;
      v10 = type metadata accessor for URL();
      v43 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
      v44 = v10;
      v43(v8, v9, v10);
      v11 = (int *)type metadata accessor for Asset.ID(0);
      v12 = v11[5];
      v13 = &v8[v12];
      v14 = &v9[v12];
      v15 = *((_QWORD *)v14 + 1);
      *(_QWORD *)v13 = *(_QWORD *)v14;
      *((_QWORD *)v13 + 1) = v15;
      v16 = v11[6];
      v17 = (uint64_t *)&v8[v16];
      v18 = (uint64_t *)&v9[v16];
      v19 = *v18;
      v20 = v18[1];
      swift_bridgeObjectRetain();
      sub_237F17134(v19, v20);
      *v17 = v19;
      v17[1] = v20;
      v21 = v11[7];
      v22 = (uint64_t *)&v8[v21];
      v23 = (uint64_t *)&v9[v21];
      v24 = *v23;
      v25 = v23[1];
      sub_237F17134(*v23, v25);
      *v22 = v24;
      v22[1] = v25;
      v26 = type metadata accessor for Asset(0);
      v27 = *(int *)(v26 + 20);
      v28 = (uint64_t *)&v8[v27];
      v42 = v4;
      v29 = &v9[v27];
      v30 = *(_QWORD *)&v9[v27];
      v31 = *(_QWORD *)&v9[v27 + 8];
      sub_237F17134(v30, v31);
      *v28 = v30;
      v28[1] = v31;
      v32 = *((_QWORD *)v29 + 2);
      v33 = *((_QWORD *)v29 + 3);
      sub_237F17134(v32, v33);
      v28[2] = v32;
      v28[3] = v33;
      *(_QWORD *)&v8[*(int *)(v26 + 24)] = *(_QWORD *)&v9[*(int *)(v26 + 24)];
      v43((char *)a1 + *(int *)(v42 + 24), (char *)a2 + *(int *)(v42 + 24), v44);
      v34 = *(int *)(v42 + 28);
      v35 = (char *)a1 + v34;
      v36 = (char *)a2 + v34;
      *(_OWORD *)v35 = *(_OWORD *)v36;
      v35[16] = v36[16];
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)a1, 0, 1, v42);
    }
    v37 = *(int *)(sub_237F171BC(&qword_2568A9B90) + 48);
    v38 = (_QWORD *)((char *)a1 + v37);
    v39 = (_QWORD *)((char *)a2 + v37);
    v40 = v39[1];
    *v38 = *v39;
    v38[1] = v40;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for DownloadResponseMessage(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  char v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  uint64_t v43;

  if (a1 != a2)
  {
    sub_237F50F64((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
    }
    else
    {
      v4 = type metadata accessor for AssetDownloadResponse();
      if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)a2, 1, v4))
      {
        v5 = sub_237F171BC(&qword_2568A9B78);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
      }
      else
      {
        v6 = type metadata accessor for UUID();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
        v7 = *(int *)(v4 + 20);
        v8 = (char *)a1 + v7;
        v9 = (char *)a2 + v7;
        v10 = type metadata accessor for URL();
        v42 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
        v43 = v10;
        v42(v8, v9, v10);
        v11 = (int *)type metadata accessor for Asset.ID(0);
        v12 = v11[5];
        v13 = &v8[v12];
        v14 = &v9[v12];
        *(_QWORD *)v13 = *(_QWORD *)v14;
        *((_QWORD *)v13 + 1) = *((_QWORD *)v14 + 1);
        v15 = v11[6];
        v16 = (uint64_t *)&v8[v15];
        v17 = (uint64_t *)&v9[v15];
        v18 = *v17;
        v19 = v17[1];
        swift_bridgeObjectRetain();
        sub_237F17134(v18, v19);
        *v16 = v18;
        v16[1] = v19;
        v20 = v11[7];
        v21 = (uint64_t *)&v8[v20];
        v22 = (uint64_t *)&v9[v20];
        v23 = *v22;
        v24 = v22[1];
        sub_237F17134(*v22, v24);
        *v21 = v23;
        v21[1] = v24;
        v25 = type metadata accessor for Asset(0);
        v26 = *(int *)(v25 + 20);
        v27 = (uint64_t *)&v8[v26];
        v41 = v4;
        v28 = &v9[v26];
        v29 = *(_QWORD *)&v9[v26];
        v30 = *(_QWORD *)&v9[v26 + 8];
        sub_237F17134(v29, v30);
        *v27 = v29;
        v27[1] = v30;
        v31 = *((_QWORD *)v28 + 2);
        v32 = *((_QWORD *)v28 + 3);
        sub_237F17134(v31, v32);
        v27[2] = v31;
        v27[3] = v32;
        *(_QWORD *)&v8[*(int *)(v25 + 24)] = *(_QWORD *)&v9[*(int *)(v25 + 24)];
        v42((char *)a1 + *(int *)(v41 + 24), (char *)a2 + *(int *)(v41 + 24), v43);
        v33 = *(int *)(v41 + 28);
        v34 = (char *)a1 + v33;
        v35 = (char *)a2 + v33;
        v36 = v35[16];
        *(_OWORD *)v34 = *(_OWORD *)v35;
        v34[16] = v36;
        _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)a1, 0, 1, v41);
      }
      v37 = *(int *)(sub_237F171BC(&qword_2568A9B90) + 48);
      v38 = (_QWORD *)((char *)a1 + v37);
      v39 = (_QWORD *)((char *)a2 + v37);
      *v38 = *v39;
      v38[1] = v39[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for DownloadResponseMessage(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  int *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  __int128 v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = (int *)type metadata accessor for AssetDownloadResponse();
    if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)a2, 1, (uint64_t)v6))
    {
      v7 = sub_237F171BC(&qword_2568A9B78);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
    }
    else
    {
      v8 = type metadata accessor for UUID();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      v9 = v6[5];
      v10 = &a1[v9];
      v11 = &a2[v9];
      v12 = type metadata accessor for URL();
      v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32);
      v13(v10, v11, v12);
      v14 = (int *)type metadata accessor for Asset.ID(0);
      *(_OWORD *)&v10[v14[5]] = *(_OWORD *)&v11[v14[5]];
      *(_OWORD *)&v10[v14[6]] = *(_OWORD *)&v11[v14[6]];
      *(_OWORD *)&v10[v14[7]] = *(_OWORD *)&v11[v14[7]];
      v15 = type metadata accessor for Asset(0);
      v16 = *(int *)(v15 + 20);
      v17 = &v10[v16];
      v18 = &v11[v16];
      v19 = *((_OWORD *)v18 + 1);
      *(_OWORD *)v17 = *(_OWORD *)v18;
      *((_OWORD *)v17 + 1) = v19;
      *(_QWORD *)&v10[*(int *)(v15 + 24)] = *(_QWORD *)&v11[*(int *)(v15 + 24)];
      v13(&a1[v6[6]], &a2[v6[6]], v12);
      v20 = v6[7];
      v21 = &a1[v20];
      v22 = &a2[v20];
      *(_OWORD *)v21 = *(_OWORD *)v22;
      v21[16] = v22[16];
      _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)a1, 0, 1, (uint64_t)v6);
    }
    v23 = sub_237F171BC(&qword_2568A9B90);
    *(_OWORD *)&a1[*(int *)(v23 + 48)] = *(_OWORD *)&a2[*(int *)(v23 + 48)];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithTake for DownloadResponseMessage(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  int *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  __int128 v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;

  if (a1 != a2)
  {
    sub_237F50F64((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = (int *)type metadata accessor for AssetDownloadResponse();
      if (_s10CloudAsset21UploadResponseMessageOwet_0((uint64_t)a2, 1, (uint64_t)v6))
      {
        v7 = sub_237F171BC(&qword_2568A9B78);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
      }
      else
      {
        v8 = type metadata accessor for UUID();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
        v9 = v6[5];
        v10 = &a1[v9];
        v11 = &a2[v9];
        v12 = type metadata accessor for URL();
        v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32);
        v13(v10, v11, v12);
        v14 = (int *)type metadata accessor for Asset.ID(0);
        *(_OWORD *)&v10[v14[5]] = *(_OWORD *)&v11[v14[5]];
        *(_OWORD *)&v10[v14[6]] = *(_OWORD *)&v11[v14[6]];
        *(_OWORD *)&v10[v14[7]] = *(_OWORD *)&v11[v14[7]];
        v15 = type metadata accessor for Asset(0);
        v16 = *(int *)(v15 + 20);
        v17 = &v10[v16];
        v18 = &v11[v16];
        v19 = *((_OWORD *)v18 + 1);
        *(_OWORD *)v17 = *(_OWORD *)v18;
        *((_OWORD *)v17 + 1) = v19;
        *(_QWORD *)&v10[*(int *)(v15 + 24)] = *(_QWORD *)&v11[*(int *)(v15 + 24)];
        v13(&a1[v6[6]], &a2[v6[6]], v12);
        v20 = v6[7];
        v21 = &a1[v20];
        v22 = &a2[v20];
        *(_OWORD *)v21 = *(_OWORD *)v22;
        v21[16] = v22[16];
        _s10CloudAsset21UploadResponseMessageOwst_0((uint64_t)a1, 0, 1, (uint64_t)v6);
      }
      v23 = sub_237F171BC(&qword_2568A9B90);
      *(_OWORD *)&a1[*(int *)(v23 + 48)] = *(_OWORD *)&a2[*(int *)(v23 + 48)];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void sub_237F51CC0()
{
  unint64_t v0;
  _QWORD v1[6];

  sub_237F51D44(319);
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v1[4] = v1;
    v1[5] = MEMORY[0x24BEE0158] + 64;
    swift_initEnumMetadataMultiPayload();
  }
}

void sub_237F51D44(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!qword_2568AA0C8)
  {
    v2 = type metadata accessor for AssetDownloadResponse();
    sub_237F48B2C(&qword_2568AA0D0, (void (*)(uint64_t))type metadata accessor for AssetDownloadResponse);
    v4 = v3;
    sub_237F48B2C(&qword_2568AA0D8, (void (*)(uint64_t))type metadata accessor for AssetDownloadResponse);
    v6 = type metadata accessor for XPCResult(a1, v2, v4, v5);
    if (!v7)
      atomic_store(v6, (unint64_t *)&qword_2568AA0C8);
  }
}

ValueMetadata *type metadata accessor for DownloadResponseMessage.CodingKeys()
{
  return &type metadata for DownloadResponseMessage.CodingKeys;
}

uint64_t _s10CloudAsset23DownloadResponseMessageO10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237F51E4C + 4 * byte_237F61045[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_237F51E80 + 4 * asc_237F61040[v4]))();
}

uint64_t sub_237F51E80(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F51E88(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237F51E90);
  return result;
}

uint64_t sub_237F51E9C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237F51EA4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_237F51EA8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F51EB0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DownloadResponseMessage.ResponseCodingKeys()
{
  return &type metadata for DownloadResponseMessage.ResponseCodingKeys;
}

uint64_t storeEnumTagSinglePayload for DownloadResponseMessage.SimultaneousTransferErrorCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_237F51F0C + 4 * byte_237F6104A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_237F51F2C + 4 * byte_237F6104F[v4]))();
}

_BYTE *sub_237F51F0C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_237F51F2C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F51F34(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F51F3C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F51F44(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F51F4C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DownloadResponseMessage.SimultaneousTransferErrorCodingKeys()
{
  return &type metadata for DownloadResponseMessage.SimultaneousTransferErrorCodingKeys;
}

unint64_t sub_237F51F6C()
{
  unint64_t result;

  result = qword_2568AA0E0;
  if (!qword_2568AA0E0)
  {
    result = MEMORY[0x23B82832C](&unk_237F61234, &type metadata for DownloadResponseMessage.SimultaneousTransferErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA0E0);
  }
  return result;
}

unint64_t sub_237F51FAC()
{
  unint64_t result;

  result = qword_2568AA0E8;
  if (!qword_2568AA0E8)
  {
    result = MEMORY[0x23B82832C](&unk_237F612EC, &type metadata for DownloadResponseMessage.ResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA0E8);
  }
  return result;
}

unint64_t sub_237F51FEC()
{
  unint64_t result;

  result = qword_2568AA0F0;
  if (!qword_2568AA0F0)
  {
    result = MEMORY[0x23B82832C](&unk_237F613A4, &type metadata for DownloadResponseMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA0F0);
  }
  return result;
}

unint64_t sub_237F5202C()
{
  unint64_t result;

  result = qword_2568AA0F8;
  if (!qword_2568AA0F8)
  {
    result = MEMORY[0x23B82832C](&unk_237F6125C, &type metadata for DownloadResponseMessage.ResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA0F8);
  }
  return result;
}

unint64_t sub_237F5206C()
{
  unint64_t result;

  result = qword_2568AA100;
  if (!qword_2568AA100)
  {
    result = MEMORY[0x23B82832C](&unk_237F61284, &type metadata for DownloadResponseMessage.ResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA100);
  }
  return result;
}

unint64_t sub_237F520AC()
{
  unint64_t result;

  result = qword_2568AA108;
  if (!qword_2568AA108)
  {
    result = MEMORY[0x23B82832C](&unk_237F611A4, &type metadata for DownloadResponseMessage.SimultaneousTransferErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA108);
  }
  return result;
}

unint64_t sub_237F520EC()
{
  unint64_t result;

  result = qword_2568AA110;
  if (!qword_2568AA110)
  {
    result = MEMORY[0x23B82832C](&unk_237F611CC, &type metadata for DownloadResponseMessage.SimultaneousTransferErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA110);
  }
  return result;
}

unint64_t sub_237F5212C()
{
  unint64_t result;

  result = qword_2568AA118;
  if (!qword_2568AA118)
  {
    result = MEMORY[0x23B82832C](&unk_237F61314, &type metadata for DownloadResponseMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA118);
  }
  return result;
}

unint64_t sub_237F5216C()
{
  unint64_t result;

  result = qword_2568AA120;
  if (!qword_2568AA120)
  {
    result = MEMORY[0x23B82832C](&unk_237F6133C, &type metadata for DownloadResponseMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA120);
  }
  return result;
}

uint64_t sub_237F521C4()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_237F521D8@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_237F521E4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_237F521EC(uint64_t a1)
{
  uint64_t v1;

  return sub_237F51054(a1, *(_QWORD *)(v1 - 192));
}

void sub_237F521F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_237F50F2C(v2, a2);
}

uint64_t sub_237F52200()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_237F52208()
{
  uint64_t v0;

  return sub_237F50F64(v0);
}

uint64_t sub_237F52210()
{
  uint64_t v0;

  return v0;
}

unint64_t sub_237F52224()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 1;
  return sub_237F50FDC();
}

void sub_237F52230(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_237F50F2C(v2, a2);
}

uint64_t sub_237F52238()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_237F52240@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_237F5224C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v8;

  v2 = a1 == 0x646C656979 && a2 == 0xE500000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6873696E6966 && a2 == 0xE600000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x726F727265 && a2 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_237F52380(char a1)
{
  if (!a1)
    return 0x646C656979;
  if (a1 == 1)
    return 0x6873696E6966;
  return 0x726F727265;
}

uint64_t sub_237F523CC()
{
  char *v0;

  return sub_237F52380(*v0);
}

uint64_t sub_237F523D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F5224C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237F523F8()
{
  sub_237F5276C();
  return CodingKey.description.getter();
}

uint64_t sub_237F52420()
{
  sub_237F5276C();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F52448()
{
  sub_237F527A8();
  return CodingKey.description.getter();
}

uint64_t sub_237F52470()
{
  sub_237F527A8();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F52498()
{
  sub_237F527E4();
  return CodingKey.description.getter();
}

uint64_t sub_237F524C0()
{
  sub_237F527E4();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F524E8()
{
  sub_237F52820();
  return CodingKey.description.getter();
}

uint64_t sub_237F52510()
{
  sub_237F52820();
  return CodingKey.debugDescription.getter();
}

void XPCAsyncSequenceResponse.Event.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
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
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = sub_237F171BC(&qword_2568AA128);
  v21 = *(_QWORD *)(v23 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v3);
  sub_237F180DC();
  v19 = v4;
  v5 = sub_237F171BC(&qword_2568AA130);
  v17 = *(_QWORD *)(v5 - 8);
  v18 = v5;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v6);
  sub_237F1DD54();
  v9 = v8 - v7;
  v22 = sub_237F171BC(&qword_2568AA138);
  v20 = *(_QWORD *)(v22 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v10);
  sub_237F1DD54();
  v13 = v12 - v11;
  sub_237F171BC(&qword_2568AA140);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v14);
  sub_237F390EC();
  v15 = v1[1];
  v16 = *v1;
  sub_237F171FC(a1, a1[3]);
  sub_237F5276C();
  sub_237F5409C();
  if (v15 >> 60 == 11)
  {
    sub_237F540AC();
    sub_237F390CC();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v19, v23);
  }
  else
  {
    if (v15 >> 60 != 15)
    {
      sub_237F17134(v16, v15);
      sub_237F52820();
      sub_237F390CC();
      sub_237F195A4();
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v13, v22);
      sub_237F5406C();
      sub_237F44408(v16, v15);
      goto LABEL_7;
    }
    sub_237F540B8();
    sub_237F390CC();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v9, v18);
  }
  sub_237F5406C();
LABEL_7:
  sub_237F1B978();
}

unint64_t sub_237F5276C()
{
  unint64_t result;

  result = qword_2568AA148;
  if (!qword_2568AA148)
  {
    result = MEMORY[0x23B82832C](&unk_237F61A8C, &type metadata for XPCAsyncSequenceResponse.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA148);
  }
  return result;
}

unint64_t sub_237F527A8()
{
  unint64_t result;

  result = qword_2568AA150;
  if (!qword_2568AA150)
  {
    result = MEMORY[0x23B82832C](&unk_237F61A3C, &type metadata for XPCAsyncSequenceResponse.Event.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA150);
  }
  return result;
}

unint64_t sub_237F527E4()
{
  unint64_t result;

  result = qword_2568AA158;
  if (!qword_2568AA158)
  {
    result = MEMORY[0x23B82832C](&unk_237F619EC, &type metadata for XPCAsyncSequenceResponse.Event.FinishCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA158);
  }
  return result;
}

unint64_t sub_237F52820()
{
  unint64_t result;

  result = qword_2568AA160;
  if (!qword_2568AA160)
  {
    result = MEMORY[0x23B82832C](&unk_237F6199C, &type metadata for XPCAsyncSequenceResponse.Event.YieldCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA160);
  }
  return result;
}

void XPCAsyncSequenceResponse.Event.init(from:)(_QWORD *a1@<X0>, __int128 *a2@<X8>)
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
  int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  __int128 v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;

  v27 = sub_237F171BC(&qword_2568AA168);
  v31 = *(_QWORD *)(v27 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v3);
  sub_237F180DC();
  v30 = v4;
  v5 = sub_237F171BC(&qword_2568AA170);
  v24 = *(_QWORD *)(v5 - 8);
  v25 = v5;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v6);
  sub_237F54050(v7, v22);
  v26 = sub_237F171BC(&qword_2568AA178);
  MEMORY[0x24BDAC7A8](v26);
  sub_237F390EC();
  v8 = sub_237F171BC(&qword_2568AA180);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  sub_237F1BC44();
  sub_237F171FC(a1, a1[3]);
  sub_237F5276C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v33)
    goto LABEL_10;
  v23 = v9;
  v10 = KeyedDecodingContainer.allKeys.getter();
  v11 = *(_QWORD *)(v10 + 16);
  if (!v11
    || (v12 = *(unsigned __int8 *)(v10 + 32),
        sub_237F33F24(1, v11, v10, v10 + 32, 0, (2 * v11) | 1),
        v14 = v13,
        v16 = v15,
        swift_bridgeObjectRelease(),
        v14 != v16 >> 1))
  {
    v18 = type metadata accessor for DecodingError();
    swift_allocError();
    v20 = v19;
    sub_237F171BC(&qword_2568A95B0);
    *v20 = &type metadata for XPCAsyncSequenceResponse.Event;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v20, *MEMORY[0x24BEE26D0], v18);
    swift_willThrow();
    swift_unknownObjectRelease();
    sub_237F521D8(*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
LABEL_10:
    v21 = (uint64_t)a1;
    goto LABEL_11;
  }
  if (v12)
  {
    if (v12 == 1)
    {
      sub_237F540B8();
      sub_237F5403C();
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v29, v25);
      sub_237F54080();
      sub_237F521D8(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
      v17 = xmmword_237F614D0;
    }
    else
    {
      sub_237F540AC();
      sub_237F5403C();
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v27);
      sub_237F54080();
      sub_237F521D8(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
      v17 = xmmword_237F614C0;
    }
  }
  else
  {
    LOBYTE(v32) = 0;
    sub_237F52820();
    sub_237F5403C();
    sub_237F1952C();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    sub_237F54088();
    sub_237F54080();
    sub_237F521D8(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
    v17 = v32;
  }
  *a2 = v17;
  v21 = (uint64_t)a1;
LABEL_11:
  sub_237F172A0(v21);
  sub_237F1B978();
}

void sub_237F52C20(_QWORD *a1@<X0>, __int128 *a2@<X8>)
{
  XPCAsyncSequenceResponse.Event.init(from:)(a1, a2);
}

void sub_237F52C34(_QWORD *a1)
{
  XPCAsyncSequenceResponse.Event.encode(to:)(a1);
}

uint64_t XPCAsyncSequenceResponse.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_237F18108();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t XPCAsyncSequenceResponse.event.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;

  v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for XPCAsyncSequenceResponse() + 20));
  v4 = *v3;
  v5 = v3[1];
  *a1 = *v3;
  a1[1] = v5;
  return sub_237F53204(v4, v5);
}

void XPCAsyncSequenceResponse.init(id:event:)(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = *a2;
  v6 = a2[1];
  v7 = sub_237F18108();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a3, a1, v7);
  v8 = (_QWORD *)(a3 + *(int *)(type metadata accessor for XPCAsyncSequenceResponse() + 20));
  *v8 = v5;
  v8[1] = v6;
  sub_237F1BA50();
}

uint64_t sub_237F52D04(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E657665 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_237F52DD0(char a1)
{
  if ((a1 & 1) != 0)
    return 0x746E657665;
  else
    return 25705;
}

uint64_t sub_237F52DF8()
{
  char *v0;

  return sub_237F52DD0(*v0);
}

uint64_t sub_237F52E00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F52D04(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237F52E24()
{
  sub_237F5321C();
  return CodingKey.description.getter();
}

uint64_t sub_237F52E4C()
{
  sub_237F5321C();
  return CodingKey.debugDescription.getter();
}

uint64_t XPCAsyncSequenceResponse.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = sub_237F171BC(&qword_2568AA188);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  sub_237F1DD54();
  v7 = v6 - v5;
  sub_237F171FC(a1, a1[3]);
  sub_237F5321C();
  sub_237F5409C();
  type metadata accessor for UUID();
  sub_237F1E868(&qword_2568A8F90, MEMORY[0x24BDCEA70]);
  sub_237F1EF34();
  if (!v1)
  {
    type metadata accessor for XPCAsyncSequenceResponse();
    sub_237F53258();
    sub_237F1EF34();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
}

void XPCAsyncSequenceResponse.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v14 = type metadata accessor for UUID();
  v11 = *(_QWORD *)(v14 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v5);
  sub_237F54050(v6, v9);
  v13 = sub_237F171BC(&qword_2568AA1A0);
  MEMORY[0x24BDAC7A8](v13);
  sub_237F390EC();
  v7 = type metadata accessor for XPCAsyncSequenceResponse();
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v8);
  sub_237F1BC44();
  sub_237F171FC(a1, a1[3]);
  sub_237F5321C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    sub_237F172A0((uint64_t)a1);
  }
  else
  {
    LOBYTE(v15) = 0;
    sub_237F1E868(&qword_2568A8FC0, MEMORY[0x24BDCEAA8]);
    sub_237F1EF28();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v3, v12, v14);
    sub_237F53294();
    sub_237F1EF28();
    sub_237F1EF14();
    *(_OWORD *)(v3 + *(int *)(v7 + 20)) = v15;
    sub_237F4FA10(v3, a2);
    sub_237F172A0((uint64_t)a1);
    sub_237F532D0(v3);
  }
  sub_237F1B978();
}

void sub_237F531A4(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  XPCAsyncSequenceResponse.init(from:)(a1, a2);
}

uint64_t sub_237F531B8(_QWORD *a1)
{
  return XPCAsyncSequenceResponse.encode(to:)(a1);
}

uint64_t type metadata accessor for XPCAsyncSequenceResponse()
{
  uint64_t result;

  result = qword_2568AA1B0;
  if (!qword_2568AA1B0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237F53204(uint64_t a1, unint64_t a2)
{
  if (((a2 >> 60) | 4) != 0xF)
    return sub_237F17134(a1, a2);
  return a1;
}

unint64_t sub_237F5321C()
{
  unint64_t result;

  result = qword_2568AA190;
  if (!qword_2568AA190)
  {
    result = MEMORY[0x23B82832C](&unk_237F6194C, &type metadata for XPCAsyncSequenceResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA190);
  }
  return result;
}

unint64_t sub_237F53258()
{
  unint64_t result;

  result = qword_2568AA198;
  if (!qword_2568AA198)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for XPCAsyncSequenceResponse.Event, &type metadata for XPCAsyncSequenceResponse.Event);
    atomic_store(result, (unint64_t *)&qword_2568AA198);
  }
  return result;
}

unint64_t sub_237F53294()
{
  unint64_t result;

  result = qword_2568AA1A8;
  if (!qword_2568AA1A8)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for XPCAsyncSequenceResponse.Event, &type metadata for XPCAsyncSequenceResponse.Event);
    atomic_store(result, (unint64_t *)&qword_2568AA1A8);
  }
  return result;
}

uint64_t sub_237F532D0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for XPCAsyncSequenceResponse();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for XPCAsyncSequenceResponse(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for UUID();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = *((_QWORD *)v10 + 1);
    if (((v11 >> 60) | 4) == 0xF)
    {
      *(_OWORD *)v9 = *(_OWORD *)v10;
    }
    else
    {
      v13 = *(_QWORD *)v10;
      sub_237F17134(*(_QWORD *)v10, *((_QWORD *)v10 + 1));
      *(_QWORD *)v9 = v13;
      *((_QWORD *)v9 + 1) = v11;
    }
  }
  return a1;
}

uint64_t destroy for XPCAsyncSequenceResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t *v6;
  unint64_t v7;

  v4 = type metadata accessor for UUID();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v6 = (uint64_t *)(a1 + *(int *)(a2 + 20));
  v7 = v6[1];
  if (((v7 >> 60) | 4) != 0xF)
    return sub_237F17178(*v6, v7);
  return result;
}

uint64_t initializeWithCopy for XPCAsyncSequenceResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (uint64_t *)(a2 + v7);
  v10 = v9[1];
  if (((v10 >> 60) | 4) == 0xF)
  {
    *(_OWORD *)v8 = *(_OWORD *)v9;
  }
  else
  {
    v11 = *v9;
    sub_237F17134(*v9, v9[1]);
    *(_QWORD *)v8 = v11;
    *(_QWORD *)(v8 + 8) = v10;
  }
  return a1;
}

uint64_t assignWithCopy for XPCAsyncSequenceResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  if (((*(_QWORD *)(a1 + v7 + 8) >> 60) | 4) != 0xF)
  {
    v12 = v9[1];
    if (((v12 >> 60) | 4) != 0xF)
    {
      v14 = *v9;
      sub_237F17134(v14, v12);
      v15 = *v8;
      v16 = v8[1];
      *v8 = v14;
      v8[1] = v12;
      sub_237F17178(v15, v16);
      return a1;
    }
    sub_237F535A0((uint64_t)v8);
    goto LABEL_6;
  }
  v10 = v9[1];
  if (((v10 >> 60) | 4) == 0xF)
  {
LABEL_6:
    *(_OWORD *)v8 = *(_OWORD *)v9;
    return a1;
  }
  v11 = *v9;
  sub_237F17134(v11, v10);
  *v8 = v11;
  v8[1] = v10;
  return a1;
}

uint64_t sub_237F535A0(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
  return a1;
}

uint64_t assignWithTake for XPCAsyncSequenceResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v10 = *(_QWORD *)(a1 + v7 + 8);
  if (((v10 >> 60) | 4) != 0xF)
  {
    v11 = v9[1];
    if (((v11 >> 60) | 4) != 0xF)
    {
      v13 = *v8;
      *v8 = *v9;
      v8[1] = v11;
      sub_237F17178(v13, v10);
      return a1;
    }
    sub_237F535A0((uint64_t)v8);
  }
  *(_OWORD *)v8 = *(_OWORD *)v9;
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCAsyncSequenceResponse()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237F5369C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v8;
  int v9;
  BOOL v10;
  int v11;

  v6 = sub_237F18108();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return _s10CloudAsset21UploadResponseMessageOwet_0(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8) >> 60;
  v9 = (4 * v8) & 0xC | (v8 >> 2);
  v10 = __OFSUB__(13, v9);
  v11 = 13 - v9;
  if (v11 < 0 != v10)
    v11 = -1;
  if (((4 * (_DWORD)v8) & 0xC) != 0)
    return (v11 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for XPCAsyncSequenceResponse()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_237F53734(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  _QWORD *v9;

  v8 = sub_237F18108();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    _s10CloudAsset21UploadResponseMessageOwst_0(a1, a2, a2, v8);
  }
  else
  {
    v9 = (_QWORD *)(a1 + *(int *)(a4 + 20));
    *v9 = 0;
    v9[1] = (unint64_t)(((14 - a2) >> 2) & 3 | (4 * (14 - (_DWORD)a2))) << 60;
    sub_237F1BA50();
  }
}

uint64_t sub_237F537B0()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *destroy for XPCAsyncSequenceResponse.Event(uint64_t *result)
{
  unint64_t v1;

  v1 = result[1];
  if ((v1 & 0x3000000000000000) == 0)
    return (uint64_t *)sub_237F17178(*result, v1);
  return result;
}

uint64_t _s10CloudAsset24XPCAsyncSequenceResponseV5EventOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  if ((v3 & 0x3000000000000000) != 0)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v4 = *a2;
    sub_237F17134(*a2, a2[1]);
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = v3;
  }
  return a1;
}

uint64_t *assignWithCopy for XPCAsyncSequenceResponse.Event(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v4 = a1[1];
  v5 = a2[1];
  v6 = v5 & 0x3000000000000000;
  if ((v4 & 0x3000000000000000) == 0)
  {
    if (!v6)
    {
      v9 = *a2;
      sub_237F17134(v9, v5);
      v10 = *a1;
      v11 = a1[1];
      *a1 = v9;
      a1[1] = v5;
      sub_237F17178(v10, v11);
      return a1;
    }
    sub_237F17178(*a1, v4);
    goto LABEL_6;
  }
  if (v6)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  v7 = *a2;
  sub_237F17134(v7, v5);
  *a1 = v7;
  a1[1] = v5;
  return a1;
}

__n128 initializeWithTake for XPCAsyncSequenceResponse.Event(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t *assignWithTake for XPCAsyncSequenceResponse.Event(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = a1[1];
  if ((v4 & 0x3000000000000000) == 0)
  {
    v5 = a2[1];
    if ((v5 & 0x3000000000000000) == 0)
    {
      v7 = *a1;
      *a1 = *a2;
      a1[1] = v5;
      sub_237F17178(v7, v4);
      return a1;
    }
    sub_237F17178(*a1, v4);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCAsyncSequenceResponse.Event(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xB && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 11);
  v3 = *(_QWORD *)(a1 + 8) >> 60;
  if (((4 * (_DWORD)v3) & 0xC) != 0)
    v4 = 16 - ((4 * v3) & 0xC | (v3 >> 2));
  else
    v4 = 0;
  if (v4 >= 3)
    return v4 - 2;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for XPCAsyncSequenceResponse.Event(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xA)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 11;
    if (a3 >= 0xB)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xB)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)((4 * (14 - a2)) | ((14 - a2) >> 2)) << 60;
    }
  }
  return result;
}

uint64_t sub_237F53A3C(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 8) >> 60;
  if (((4 * (_DWORD)v1) & 0xC) != 0)
    return 16 - ((4 * (_DWORD)v1) & 0xC | (v1 >> 2));
  else
    return 0;
}

_QWORD *sub_237F53A64(_QWORD *result, unsigned int a2)
{
  if (a2 > 0xC)
  {
    *result = a2 - 13;
    result[1] = 0;
  }
  else if (a2)
  {
    *result = 0;
    result[1] = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCAsyncSequenceResponse.Event()
{
  return &type metadata for XPCAsyncSequenceResponse.Event;
}

uint64_t storeEnumTagSinglePayload for XPCAsyncSequenceResponse.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237F53AF0 + 4 * byte_237F614E5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_237F53B24 + 4 * byte_237F614E0[v4]))();
}

uint64_t sub_237F53B24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F53B2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237F53B34);
  return result;
}

uint64_t sub_237F53B40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237F53B48);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_237F53B4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F53B54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for XPCAsyncSequenceResponse.CodingKeys()
{
  return &type metadata for XPCAsyncSequenceResponse.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for XPCAsyncSequenceResponse.Event.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237F53BBC + 4 * byte_237F614EF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_237F53BF0 + 4 * byte_237F614EA[v4]))();
}

uint64_t sub_237F53BF0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F53BF8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237F53C00);
  return result;
}

uint64_t sub_237F53C0C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237F53C14);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_237F53C18(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F53C20(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for XPCAsyncSequenceResponse.Event.CodingKeys()
{
  return &type metadata for XPCAsyncSequenceResponse.Event.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for XPCAsyncSequenceResponse.Event.YieldCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_237F53C7C + 4 * byte_237F614F4[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_237F53C9C + 4 * byte_237F614F9[v4]))();
}

_BYTE *sub_237F53C7C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_237F53C9C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F53CA4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F53CAC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F53CB4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F53CBC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for XPCAsyncSequenceResponse.Event.YieldCodingKeys()
{
  return &type metadata for XPCAsyncSequenceResponse.Event.YieldCodingKeys;
}

ValueMetadata *type metadata accessor for XPCAsyncSequenceResponse.Event.FinishCodingKeys()
{
  return &type metadata for XPCAsyncSequenceResponse.Event.FinishCodingKeys;
}

ValueMetadata *type metadata accessor for XPCAsyncSequenceResponse.Event.ErrorCodingKeys()
{
  return &type metadata for XPCAsyncSequenceResponse.Event.ErrorCodingKeys;
}

unint64_t sub_237F53CFC()
{
  unint64_t result;

  result = qword_2568AA1C0;
  if (!qword_2568AA1C0)
  {
    result = MEMORY[0x23B82832C](&unk_237F617B4, &type metadata for XPCAsyncSequenceResponse.Event.YieldCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA1C0);
  }
  return result;
}

unint64_t sub_237F53D3C()
{
  unint64_t result;

  result = qword_2568AA1C8;
  if (!qword_2568AA1C8)
  {
    result = MEMORY[0x23B82832C](&unk_237F6186C, &type metadata for XPCAsyncSequenceResponse.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA1C8);
  }
  return result;
}

unint64_t sub_237F53D7C()
{
  unint64_t result;

  result = qword_2568AA1D0;
  if (!qword_2568AA1D0)
  {
    result = MEMORY[0x23B82832C](&unk_237F61924, &type metadata for XPCAsyncSequenceResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA1D0);
  }
  return result;
}

unint64_t sub_237F53DBC()
{
  unint64_t result;

  result = qword_2568AA1D8;
  if (!qword_2568AA1D8)
  {
    result = MEMORY[0x23B82832C](&unk_237F61894, &type metadata for XPCAsyncSequenceResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA1D8);
  }
  return result;
}

unint64_t sub_237F53DFC()
{
  unint64_t result;

  result = qword_2568AA1E0;
  if (!qword_2568AA1E0)
  {
    result = MEMORY[0x23B82832C](&unk_237F618BC, &type metadata for XPCAsyncSequenceResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA1E0);
  }
  return result;
}

unint64_t sub_237F53E3C()
{
  unint64_t result;

  result = qword_2568AA1E8;
  if (!qword_2568AA1E8)
  {
    result = MEMORY[0x23B82832C](&unk_237F61724, &type metadata for XPCAsyncSequenceResponse.Event.YieldCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA1E8);
  }
  return result;
}

unint64_t sub_237F53E7C()
{
  unint64_t result;

  result = qword_2568AA1F0;
  if (!qword_2568AA1F0)
  {
    result = MEMORY[0x23B82832C](&unk_237F6174C, &type metadata for XPCAsyncSequenceResponse.Event.YieldCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA1F0);
  }
  return result;
}

unint64_t sub_237F53EBC()
{
  unint64_t result;

  result = qword_2568AA1F8;
  if (!qword_2568AA1F8)
  {
    result = MEMORY[0x23B82832C](&unk_237F616D4, &type metadata for XPCAsyncSequenceResponse.Event.FinishCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA1F8);
  }
  return result;
}

unint64_t sub_237F53EFC()
{
  unint64_t result;

  result = qword_2568AA200;
  if (!qword_2568AA200)
  {
    result = MEMORY[0x23B82832C](&unk_237F616FC, &type metadata for XPCAsyncSequenceResponse.Event.FinishCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA200);
  }
  return result;
}

unint64_t sub_237F53F3C()
{
  unint64_t result;

  result = qword_2568AA208;
  if (!qword_2568AA208)
  {
    result = MEMORY[0x23B82832C](&unk_237F61684, &type metadata for XPCAsyncSequenceResponse.Event.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA208);
  }
  return result;
}

unint64_t sub_237F53F7C()
{
  unint64_t result;

  result = qword_2568AA210;
  if (!qword_2568AA210)
  {
    result = MEMORY[0x23B82832C](&unk_237F616AC, &type metadata for XPCAsyncSequenceResponse.Event.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA210);
  }
  return result;
}

unint64_t sub_237F53FBC()
{
  unint64_t result;

  result = qword_2568AA218;
  if (!qword_2568AA218)
  {
    result = MEMORY[0x23B82832C](&unk_237F617DC, &type metadata for XPCAsyncSequenceResponse.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA218);
  }
  return result;
}

unint64_t sub_237F53FFC()
{
  unint64_t result;

  result = qword_2568AA220;
  if (!qword_2568AA220)
  {
    result = MEMORY[0x23B82832C](&unk_237F61804, &type metadata for XPCAsyncSequenceResponse.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA220);
  }
  return result;
}

uint64_t sub_237F5403C()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

void sub_237F54050(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_237F5406C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 104) + 8))(v1, v0);
}

uint64_t sub_237F54080()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_237F54088()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 184) + 8))(v1, v0);
}

uint64_t sub_237F5409C()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

unint64_t sub_237F540AC()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 96) = 2;
  return sub_237F527A8();
}

unint64_t sub_237F540B8()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 96) = 1;
  return sub_237F527E4();
}

uint64_t sub_237F540C4()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  sub_237F2B028(v0, qword_2568AA228);
  sub_237F2B010(v0, (uint64_t)qword_2568AA228);
  type metadata accessor for XPCSessionCacheImplementation();
  sub_237F171BC(&qword_2568AA240);
  String.init<A>(describing:)();
  return Logger.init(subsystem:category:)();
}

_QWORD *sub_237F54158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  swift_defaultActor_initialize();
  v4[14] = a1;
  v4[15] = a2;
  v4[16] = a3;
  v4[17] = a4;
  v4[18] = 0;
  return v4;
}

uint64_t sub_237F541A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0;
  if (qword_2568A8F68 != -1)
    swift_once();
  v2 = sub_237F44A50();
  sub_237F2B010(v2, (uint64_t)qword_2568AA228);
  v3 = (void *)Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (sub_237F54804(v4))
  {
    *(_WORD *)sub_237F44998() = 0;
    sub_237F547E0(&dword_237F15000, v5, v6, "evict xpc session");
    sub_237F4498C();
  }

  *(_QWORD *)(v1 + 144) = 0;
  return swift_release();
}

uint64_t sub_237F54254()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (*(_QWORD *)(v1 + 144))
  {
    v0 = *(_QWORD *)(v1 + 144);
  }
  else
  {
    v3 = sub_237F54298();
    if (v2)
      return v0;
    v0 = v3;
  }
  swift_retain();
  return v0;
}

uint64_t sub_237F54298()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = v0;
  v3 = type metadata accessor for XPCSession.InitializationOptions();
  MEMORY[0x24BDAC7A8](v3);
  if (qword_2568A8F68 != -1)
    swift_once();
  v4 = type metadata accessor for Logger();
  sub_237F2B010(v4, (uint64_t)qword_2568AA228);
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_237F15000, v5, v6, "establish xpc session", v7, 2u);
    MEMORY[0x23B8283BC](v7, -1, -1);
  }

  type metadata accessor for XPCSession();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  static XPCSession.InitializationOptions.none.getter();
  type metadata accessor for XPCAsyncSequenceResponse();
  sub_237F4F5C8(&qword_2568AA248, (uint64_t (*)(uint64_t))type metadata accessor for XPCAsyncSequenceResponse, (uint64_t)&protocol conformance descriptor for XPCAsyncSequenceResponse);
  v8 = XPCSession.__allocating_init<A>(machService:targetQueue:options:incomingMessageHandler:cancellationHandler:)();
  v9 = v8;
  if (!v1)
  {
    *(_QWORD *)(v2 + 144) = v8;
    swift_retain();
    swift_release();
  }
  return v9;
}

uint64_t sub_237F54478(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t, uint64_t);
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;
  _QWORD v18[4];

  v2 = v1;
  v4 = type metadata accessor for XPCRichError();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2568A8F68 != -1)
    swift_once();
  v8 = sub_237F44A50();
  sub_237F2B010(v8, (uint64_t)qword_2568AA228);
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v9(v7, a1, v4);
  v10 = Logger.logObject.getter();
  v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)sub_237F44998();
    v13 = sub_237F44998();
    v18[2] = v2;
    v14 = (_QWORD *)v13;
    *(_DWORD *)v12 = 138412290;
    v18[1] = v12 + 4;
    sub_237F4F5C8(&qword_2568A9BE8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6678], MEMORY[0x24BEE6688]);
    swift_allocError();
    v9(v15, (uint64_t)v7, v4);
    v16 = _swift_stdlib_bridgeErrorToNSError();
    v18[3] = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v14 = v16;
    sub_237F547F4();
    _os_log_impl(&dword_237F15000, v10, v11, "cached xpc connection disconnected due to error %@", v12, 0xCu);
    sub_237F171BC(&qword_2568A9B50);
    swift_arrayDestroy();
    sub_237F4498C();
  }
  sub_237F547F4();

  return sub_237F541A8();
}

uint64_t sub_237F54680()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0;
  if (qword_2568A8F68 != -1)
    swift_once();
  v2 = sub_237F44A50();
  sub_237F2B010(v2, (uint64_t)qword_2568AA228);
  v3 = (void *)Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (sub_237F54804(v4))
  {
    *(_WORD *)sub_237F44998() = 0;
    sub_237F547E0(&dword_237F15000, v5, v6, "cancel xpc session");
    sub_237F4498C();
  }

  if (*(_QWORD *)(v1 + 144))
  {
    swift_retain();
    dispatch thunk of XPCSession.cancel(reason:)();
    swift_release();
  }
  return sub_237F541A8();
}

uint64_t sub_237F54758()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_237F5478C()
{
  sub_237F54758();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for XPCSessionCacheImplementation()
{
  return objc_opt_self();
}

uint64_t sub_237F547C4()
{
  return sub_237F4C1FC();
}

void sub_237F547E0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_237F547F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

BOOL sub_237F54804(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_237F54814@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v22;
  uint64_t v23;

  v5 = sub_237F55C84();
  v22 = *(_QWORD *)(v5 - 8);
  v23 = v5;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v6);
  sub_237F1DD54();
  v9 = v8 - v7;
  sub_237F171BC(&qword_2568A9190);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v10);
  sub_237F1B99C();
  v11 = type metadata accessor for Google_Protobuf_Timestamp();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  sub_237F1DD54();
  v15 = v14 - v13;
  v16 = a1[1];
  *(_QWORD *)a2 = *a1;
  *((_QWORD *)a2 + 1) = v16;
  v17 = a1[3];
  *((_QWORD *)a2 + 2) = a1[2];
  *((_QWORD *)a2 + 3) = v17;
  v18 = a1[5];
  *((_QWORD *)a2 + 4) = a1[4];
  *((_QWORD *)a2 + 5) = v18;
  v19 = type metadata accessor for CloudAssets_Credential(0);
  sub_237F55C3C((uint64_t)a1 + *(int *)(v19 + 32), v2);
  if (_s10CloudAsset21UploadResponseMessageOwet_0(v2, 1, v11) == 1)
  {
    sub_237F55CF0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    Google_Protobuf_Timestamp.init()();
    sub_237F553A4(v2);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v15, v2, v11);
    sub_237F55CF0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  Google_Protobuf_Timestamp.date.getter();
  sub_237F553E4((uint64_t)a1);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v11);
  v20 = type metadata accessor for Credential(0);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 32))(&a2[*(int *)(v20 + 28)], v9, v23);
}

uint64_t static Credential.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  BOOL v5;
  BOOL v6;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_237F1BD24() & 1) == 0)
    return 0;
  v5 = a1[2] == a2[2] && a1[3] == a2[3];
  if (!v5 && (sub_237F1BD24() & 1) == 0)
    return 0;
  v6 = a1[4] == a2[4] && a1[5] == a2[5];
  if (!v6 && (sub_237F1BD24() & 1) == 0)
    return 0;
  type metadata accessor for Credential(0);
  return static Date.== infix(_:_:)();
}

uint64_t type metadata accessor for Credential(uint64_t a1)
{
  return sub_237F1B2B4(a1, (uint64_t *)&unk_2568AA270);
}

uint64_t Credential.Builder.__allocating_init(tenantName:requestorID:accessToken:)()
{
  uint64_t v0;

  sub_237F55CA4();
  v0 = swift_allocObject();
  Credential.Builder.init(tenantName:requestorID:accessToken:)();
  return v0;
}

_QWORD *Credential.Builder.init(tenantName:requestorID:accessToken:)()
{
  uint64_t v0;
  _QWORD *v1;
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

  sub_237F55CA4();
  v7 = sub_237F55C84();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  sub_237F1DD54();
  v11 = v10 - v9;
  v1[2] = v6;
  v1[3] = v5;
  v1[6] = v2;
  v1[7] = v0;
  v1[4] = v4;
  v1[5] = v3;
  static Date.distantFuture.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))((uint64_t)v1 + OBJC_IVAR____TtCV10CloudAsset10Credential7Builder_expirationDate, v11, v7);
  return v1;
}

uint64_t Credential.Builder.setExpirationDate(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtCV10CloudAsset10Credential7Builder_expirationDate;
  swift_beginAccess();
  sub_237F55C84();
  sub_237F55CE4();
  (*(void (**)(uint64_t, uint64_t))(v4 + 24))(v3, a1);
  swift_endAccess();
  return swift_retain();
}

uint64_t Credential.Builder.build()@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v3 = v1[3];
  *a1 = v1[2];
  a1[1] = v3;
  v4 = v1[5];
  a1[2] = v1[4];
  a1[3] = v4;
  v5 = (char *)v1 + OBJC_IVAR____TtCV10CloudAsset10Credential7Builder_expirationDate;
  v6 = v1[6];
  v7 = v1[7];
  a1[4] = v6;
  a1[5] = v7;
  swift_beginAccess();
  v8 = (char *)a1 + *(int *)(type metadata accessor for Credential(0) + 28);
  sub_237F55C84();
  sub_237F55CE4();
  (*(void (**)(char *, char *))(v9 + 16))(v8, v5);
  swift_bridgeObjectRetain();
  sub_237F55C9C();
  return sub_237F55CD0();
}

uint64_t Credential.Builder.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtCV10CloudAsset10Credential7Builder_expirationDate;
  v2 = sub_237F55C84();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t Credential.Builder.__deallocating_deinit()
{
  Credential.Builder.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_237F54CFC(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6675626F746F7270 && a2 == 0xEC00000061746144)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    sub_237F18570();
    v3 = sub_237F1BD24();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_237F54D7C()
{
  sub_237F1BA84();
  Hasher._combine(_:)(0);
  Hasher._finalize()();
  sub_237F1BBBC();
}

uint64_t sub_237F54DB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result;

  result = sub_237F54CFC(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_237F54DDC()
{
  sub_237F550F8();
  return CodingKey.description.getter();
}

uint64_t sub_237F54E04()
{
  sub_237F550F8();
  return CodingKey.debugDescription.getter();
}

void Credential.tenantName.getter()
{
  sub_237F55CD0();
  sub_237F1BA5C();
  sub_237F18140();
}

void Credential.requestorID.getter()
{
  sub_237F55CD0();
  sub_237F1BA5C();
  sub_237F18140();
}

void Credential.accessToken.getter()
{
  sub_237F55CD0();
  sub_237F1BA5C();
  sub_237F18140();
}

uint64_t Credential.expirationDate.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  type metadata accessor for Credential(0);
  sub_237F55C84();
  sub_237F55CE4();
  v0 = sub_237F1BA5C();
  return sub_237F180F8(v0, v1, v2, v3);
}

uint64_t Credential.init(accessToken:expiryDate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a4 = 0x616C506572616853;
  a4[1] = 0xE900000000000079;
  a4[2] = 0;
  a4[3] = 0xE000000000000000;
  a4[4] = a1;
  a4[5] = a2;
  v5 = (uint64_t)a4 + *(int *)(type metadata accessor for Credential(0) + 28);
  sub_237F55C84();
  sub_237F55CE4();
  return sub_237F180F8(v5, a3, v7, *(uint64_t (**)(void))(v6 + 32));
}

void Credential.init(from:)(_QWORD *a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  type metadata accessor for BinaryDecodingOptions();
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v4);
  sub_237F180DC();
  type metadata accessor for CloudAssets_Credential(0);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v5);
  sub_237F1DD54();
  v8 = (_QWORD *)(v7 - v6);
  v9 = sub_237F171BC(&qword_2568AA250);
  MEMORY[0x24BDAC7A8](v9);
  sub_237F1BC2C();
  sub_237F171FC(a1, a1[3]);
  sub_237F550F8();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    sub_237F1952C();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    BinaryDecodingOptions.init()();
    sub_237F4F5C8(&qword_2568A9400, type metadata accessor for CloudAssets_Credential, (uint64_t)&unk_237F5E750);
    Message.init(serializedData:extensions:partial:options:)();
    sub_237F54814(v8, a2);
    sub_237F55CC0();
  }
  sub_237F172A0((uint64_t)a1);
  sub_237F1B978();
}

unint64_t sub_237F550F8()
{
  unint64_t result;

  result = qword_2568AA258;
  if (!qword_2568AA258)
  {
    result = MEMORY[0x23B82832C](&unk_237F61D54, &type metadata for Credential.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA258);
  }
  return result;
}

void Credential.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
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

  v4 = v2;
  v6 = type metadata accessor for Date();
  v27 = *(_QWORD *)(v6 - 8);
  v28 = v6;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v7);
  sub_237F180DC();
  v26 = v8;
  v9 = type metadata accessor for Google_Protobuf_Timestamp();
  v29 = *(_QWORD *)(v9 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v10);
  sub_237F1BC2C();
  v11 = type metadata accessor for CloudAssets_Credential(0);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v12);
  sub_237F1B99C();
  v13 = sub_237F171BC(&qword_2568AA260);
  v31 = *(_QWORD *)(v13 - 8);
  v32 = v13;
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v14);
  sub_237F1DD54();
  v17 = v16 - v15;
  sub_237F171FC(a1, a1[3]);
  sub_237F550F8();
  v30 = v17;
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  UnknownStorage.init()();
  v18 = (uint64_t)v3 + *(int *)(v11 + 32);
  sub_237F55CD8(v18, 1);
  v19 = v4[1];
  *v3 = *v4;
  v3[1] = v19;
  v20 = v4[3];
  v3[2] = v4[2];
  v3[3] = v20;
  v21 = v4[5];
  v3[4] = v4[4];
  v3[5] = v21;
  v22 = (char *)v4 + *(int *)(type metadata accessor for Credential(0) + 28);
  (*(void (**)(uint64_t, char *, uint64_t))(v27 + 16))(v26, v22, v28);
  sub_237F55C9C();
  swift_bridgeObjectRetain();
  sub_237F55CF0();
  Google_Protobuf_Timestamp.init(date:)();
  sub_237F553A4(v18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(v18, v1, v9);
  sub_237F55CD8(v18, 0);
  sub_237F4F5C8(&qword_2568A9400, type metadata accessor for CloudAssets_Credential, (uint64_t)&unk_237F5E750);
  v23 = Message.serializedData(partial:)();
  v25 = v24;
  sub_237F553E4((uint64_t)v3);
  if (!v33)
  {
    sub_237F195A4();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    sub_237F17178(v23, v25);
  }
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
  sub_237F1B978();
}

uint64_t sub_237F553A4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_237F171BC(&qword_2568A9190);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_237F553E4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CloudAssets_Credential(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void Credential.hash(into:)()
{
  sub_237F55C9C();
  sub_237F55C8C();
  sub_237F521E4();
  sub_237F55C9C();
  sub_237F55C8C();
  sub_237F521E4();
  sub_237F55C9C();
  sub_237F55C8C();
  sub_237F521E4();
  type metadata accessor for Credential(0);
  sub_237F55C84();
  sub_237F4F5C8((unint64_t *)&unk_2568A9610, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  dispatch thunk of Hashable.hash(into:)();
  sub_237F1BA50();
}

void Credential.hashValue.getter()
{
  sub_237F1BA84();
  Credential.hash(into:)();
  Hasher._finalize()();
  sub_237F1BBBC();
}

Swift::Int sub_237F554E4()
{
  Hasher.init(_seed:)();
  Credential.hash(into:)();
  return Hasher._finalize()();
}

uint64_t sub_237F5551C()
{
  return sub_237F4F5C8(&qword_2568AA268, type metadata accessor for Credential, (uint64_t)&protocol conformance descriptor for Credential);
}

void sub_237F55548(_QWORD *a1@<X0>, char *a2@<X8>)
{
  Credential.init(from:)(a1, a2);
}

void sub_237F5555C(_QWORD *a1)
{
  Credential.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for Credential(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = a2[5];
    v8 = *(int *)(a3 + 28);
    v9 = (char *)a2 + v8;
    v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    v11 = type metadata accessor for Date();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v10, v9, v11);
  }
  return v3;
}

uint64_t destroy for Credential(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = type metadata accessor for Date();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for Credential(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  v7 = *(int *)(a3 + 28);
  v8 = (char *)a2 + v7;
  v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  v10 = type metadata accessor for Date();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v9, v8, v10);
  return a1;
}

_QWORD *assignWithCopy for Credential(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for Credential(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(int *)(a3 + 28);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_QWORD *assignWithTake for Credential(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for Credential()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237F558E0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_237F55C84();
    return _s10CloudAsset21UploadResponseMessageOwet_0(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for Credential()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_237F5595C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 8) = (a2 - 1);
    sub_237F1BA50();
  }
  else
  {
    v7 = sub_237F55C84();
    _s10CloudAsset21UploadResponseMessageOwst_0(a1 + *(int *)(a4 + 28), a2, a2, v7);
  }
}

uint64_t sub_237F559BC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_237F55A34()
{
  return type metadata accessor for Credential.Builder(0);
}

uint64_t type metadata accessor for Credential.Builder(uint64_t a1)
{
  return sub_237F1B2B4(a1, (uint64_t *)&unk_2568AA280);
}

uint64_t sub_237F55A50()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for Credential.Builder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Credential.Builder.__allocating_init(tenantName:requestorID:accessToken:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t storeEnumTagSinglePayload for Credential.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_237F55B20 + 4 * byte_237F61B58[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_237F55B40 + 4 * byte_237F61B5D[v4]))();
}

_BYTE *sub_237F55B20(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_237F55B40(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F55B48(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F55B50(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F55B58(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F55B60(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for Credential.CodingKeys()
{
  return &type metadata for Credential.CodingKeys;
}

unint64_t sub_237F55B80()
{
  unint64_t result;

  result = qword_2568AA290;
  if (!qword_2568AA290)
  {
    result = MEMORY[0x23B82832C](&unk_237F61D2C, &type metadata for Credential.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA290);
  }
  return result;
}

unint64_t sub_237F55BC0()
{
  unint64_t result;

  result = qword_2568AA298;
  if (!qword_2568AA298)
  {
    result = MEMORY[0x23B82832C](&unk_237F61C9C, &type metadata for Credential.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA298);
  }
  return result;
}

unint64_t sub_237F55C00()
{
  unint64_t result;

  result = qword_2568AA2A0;
  if (!qword_2568AA2A0)
  {
    result = MEMORY[0x23B82832C](&unk_237F61CC4, &type metadata for Credential.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA2A0);
  }
  return result;
}

uint64_t sub_237F55C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237F171BC(&qword_2568A9190);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237F55C84()
{
  return type metadata accessor for Date();
}

uint64_t sub_237F55C8C()
{
  return String.hash(into:)();
}

uint64_t sub_237F55C9C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_237F55CC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t sub_237F55CD0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_237F55CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return _s10CloudAsset21UploadResponseMessageOwst_0(a1, a2, 1, v2);
}

uint64_t sub_237F55CF0()
{
  return swift_bridgeObjectRetain();
}

uint64_t AssetUploadRequest.id.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  type metadata accessor for UUID();
  v0 = sub_237F18128();
  return sub_237F180F8(v0, v1, v2, v3);
}

uint64_t AssetUploadRequest.tenantName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(sub_237F45344() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for AssetUploadRequest()
{
  uint64_t result;

  result = qword_2568AA2E8;
  if (!qword_2568AA2E8)
    return swift_getSingletonMetadata();
  return result;
}

void AssetUploadRequest.tenantName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + *(int *)(sub_237F45344() + 20));
  swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  sub_237F1BA50();
}

uint64_t (*AssetUploadRequest.tenantName.modify())()
{
  sub_237F45344();
  return nullsub_1;
}

uint64_t AssetUploadRequest.workingDirectory.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_237F45344();
  sub_237F18100();
  v0 = sub_237F18128();
  return sub_237F180F8(v0, v1, v2, v3);
}

uint64_t AssetUploadRequest.workingDirectory.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(sub_237F45344() + 24);
  v4 = sub_237F18100();
  return sub_237F180F8(v3, a1, v4, *(uint64_t (**)(void))(*(_QWORD *)(v4 - 8) + 40));
}

uint64_t (*AssetUploadRequest.workingDirectory.modify())()
{
  sub_237F45344();
  return nullsub_1;
}

uint64_t AssetUploadRequest.fileURL.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_237F45344();
  sub_237F18100();
  v0 = sub_237F18128();
  return sub_237F180F8(v0, v1, v2, v3);
}

uint64_t AssetUploadRequest.storageLocation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_237F45344();
  sub_237F18100();
  v0 = sub_237F18128();
  return sub_237F180F8(v0, v1, v2, v3);
}

uint64_t AssetUploadRequest.protector.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = (uint64_t *)(v1 + *(int *)(sub_237F45344() + 36));
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  *a1 = *v3;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  sub_237F17134(v4, v5);
  return sub_237F17134(v6, v7);
}

uint64_t AssetUploadRequest.credential.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_237F45344();
  return sub_237F57258(v1 + *(int *)(v3 + 40), a1, type metadata accessor for Credential);
}

uint64_t AssetUploadRequest.init(fileURL:storageLocation:protector:credential:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  int *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  __int128 v18;

  v18 = *a3;
  v9 = *((_QWORD *)a3 + 2);
  v10 = *((_QWORD *)a3 + 3);
  UUID.init()();
  v11 = (int *)sub_237F45344();
  v12 = (_QWORD *)(a5 + v11[5]);
  *v12 = 0x616C506572616853;
  v12[1] = 0xE900000000000079;
  sub_237F1F1B4(0x616C506572616853, 0xE900000000000079);
  v13 = a5 + v11[7];
  v14 = sub_237F18100();
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32);
  v15(v13, a1, v14);
  v15(a5 + v11[8], a2, v14);
  v16 = a5 + v11[9];
  *(_OWORD *)v16 = v18;
  *(_QWORD *)(v16 + 16) = v9;
  *(_QWORD *)(v16 + 24) = v10;
  return sub_237F580A8(a4, a5 + v11[10]);
}

uint64_t sub_237F56044(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Credential(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t AssetUploadRequest.init(tenantName:fileURL:storageLocation:protector:credential:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __int128 *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  int *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  __int128 v22;

  v22 = *a5;
  v13 = *((_QWORD *)a5 + 2);
  v14 = *((_QWORD *)a5 + 3);
  UUID.init()();
  v15 = (int *)sub_237F45344();
  v16 = (_QWORD *)(a7 + v15[5]);
  *v16 = a1;
  v16[1] = a2;
  swift_bridgeObjectRetain();
  sub_237F1F1B4(a1, a2);
  swift_bridgeObjectRelease();
  v17 = a7 + v15[7];
  v18 = sub_237F18100();
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32);
  v19(v17, a3, v18);
  v19(a7 + v15[8], a4, v18);
  v20 = a7 + v15[9];
  *(_OWORD *)v20 = v22;
  *(_QWORD *)(v20 + 16) = v13;
  *(_QWORD *)(v20 + 24) = v14;
  return sub_237F580A8(a6, a7 + v15[10]);
}

void AssetUploadRequest.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  type metadata accessor for UUID();
  sub_237F4F5C8(&qword_2568A8F70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  dispatch thunk of Hashable.hash(into:)();
  v1 = sub_237F45344();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  sub_237F18100();
  sub_237F4F5C8(&qword_2568A8F78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_237F580D8();
  sub_237F580D8();
  sub_237F580D8();
  v2 = (uint64_t *)(v0 + *(int *)(v1 + 36));
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  sub_237F17134(*v2, v4);
  Data.hash(into:)();
  sub_237F17178(v3, v4);
  sub_237F17134(v5, v6);
  Data.hash(into:)();
  sub_237F340F4(v5);
  Credential.hash(into:)();
}

uint64_t static AssetUploadRequest.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  BOOL v8;

  if ((static UUID.== infix(_:_:)() & 1) != 0)
  {
    v4 = *(int *)(sub_237F45344() + 20);
    v5 = *(_QWORD *)(a1 + v4);
    v6 = *(_QWORD *)(a1 + v4 + 8);
    v7 = (_QWORD *)(a2 + v4);
    v8 = v5 == *v7 && v6 == v7[1];
    if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      sub_237F22404();
  }
  return 0;
}

uint64_t sub_237F56478(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v11;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x614E746E616E6574 && a2 == 0xEA0000000000656DLL;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x8000000237F647E0
           || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = a1 == 0x4C5255656C6966 && a2 == 0xE700000000000000;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v8 = a1 == 0x4C656761726F7473 && a2 == 0xEF6E6F697461636FLL;
        if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v9 = a1 == 0x6F746365746F7270 && a2 == 0xE900000000000072;
          if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else if (a1 == 0x69746E6564657263 && a2 == 0xEA00000000006C61)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            if ((v11 & 1) != 0)
              return 6;
            else
              return 7;
          }
        }
      }
    }
  }
}

uint64_t sub_237F56768()
{
  return 7;
}

uint64_t sub_237F56770(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_237F56798 + 4 * byte_237F61DB0[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_237F56798()
{
  return 0x614E746E616E6574;
}

unint64_t sub_237F567B4()
{
  return 0xD000000000000010;
}

uint64_t sub_237F567D0()
{
  return 0x4C5255656C6966;
}

uint64_t sub_237F567E8()
{
  return 0x4C656761726F7473;
}

uint64_t sub_237F5680C()
{
  return 0x6F746365746F7270;
}

uint64_t sub_237F56828()
{
  return 0x69746E6564657263;
}

uint64_t sub_237F56848()
{
  unsigned __int8 *v0;

  return sub_237F56770(*v0);
}

uint64_t sub_237F56850@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F56478(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237F56874@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_237F56768();
  *a1 = result;
  return result;
}

uint64_t sub_237F56898()
{
  sub_237F56B64();
  return CodingKey.description.getter();
}

uint64_t sub_237F568C0()
{
  sub_237F56B64();
  return CodingKey.debugDescription.getter();
}

void AssetUploadRequest.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = sub_237F171BC(&qword_2568AA2A8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  sub_237F1DD54();
  v7 = v6 - v5;
  sub_237F171FC(a1, a1[3]);
  sub_237F56B64();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  type metadata accessor for UUID();
  sub_237F4F5C8(&qword_2568A8F90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_237F223CC();
  sub_237F221C8();
  if (!v1)
  {
    type metadata accessor for AssetUploadRequest();
    KeyedEncodingContainer.encode(_:forKey:)();
    type metadata accessor for URL();
    sub_237F4F5C8(&qword_2568A8FA0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
    sub_237F221C8();
    sub_237F221C8();
    sub_237F221C8();
    sub_237F56BA0();
    sub_237F221C8();
    type metadata accessor for Credential(0);
    sub_237F4F5C8(&qword_2568A9248, type metadata accessor for Credential, (uint64_t)&protocol conformance descriptor for Credential);
    sub_237F223CC();
    sub_237F221C8();
  }
  sub_237F44D34(v7, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  sub_237F1B978();
}

unint64_t sub_237F56B64()
{
  unint64_t result;

  result = qword_2568AA2B0;
  if (!qword_2568AA2B0)
  {
    result = MEMORY[0x23B82832C](&unk_237F6201C, &type metadata for AssetUploadRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA2B0);
  }
  return result;
}

unint64_t sub_237F56BA0()
{
  unint64_t result;

  result = qword_2568AA2B8;
  if (!qword_2568AA2B8)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for Asset.Protector, &type metadata for Asset.Protector);
    atomic_store(result, (unint64_t *)&qword_2568AA2B8);
  }
  return result;
}

Swift::Int AssetUploadRequest.hashValue.getter()
{
  Hasher.init(_seed:)();
  AssetUploadRequest.hash(into:)();
  return Hasher._finalize()();
}

void AssetUploadRequest.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int *v37;
  _OWORD *v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, char *, uint64_t);
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
  _QWORD *v53;
  uint64_t v54;
  int *v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  char v59;

  v43 = a2;
  v46 = type metadata accessor for Credential(0);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v3);
  sub_237F180DC();
  v44 = v4;
  v5 = type metadata accessor for URL();
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  sub_237F1B990();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v45 = (uint64_t)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v41 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v41 - v12;
  v14 = type metadata accessor for UUID();
  v50 = *(_QWORD *)(v14 - 8);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v15);
  sub_237F1DD54();
  v18 = v17 - v16;
  v47 = sub_237F171BC(&qword_2568AA2C0);
  v19 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  sub_237F1DD54();
  v22 = v21 - v20;
  v55 = (int *)type metadata accessor for AssetUploadRequest();
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v23);
  sub_237F180DC();
  v56 = v24;
  v25 = a1[3];
  v53 = a1;
  sub_237F171FC(a1, v25);
  sub_237F56B64();
  v48 = v22;
  v26 = v54;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  v49 = v14;
  if (v26)
  {
    sub_237F58108();
  }
  else
  {
    LOBYTE(v57) = 0;
    sub_237F4F5C8(&qword_2568A8FC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    sub_237F223CC();
    sub_237F580E8();
    v27 = v14;
    v28 = v56;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 32))(v56, v18, v27);
    LOBYTE(v57) = 1;
    v29 = KeyedDecodingContainer.decode(_:forKey:)();
    v54 = v19;
    v30 = (uint64_t *)(v28 + v55[5]);
    *v30 = v29;
    v30[1] = v31;
    LOBYTE(v57) = 2;
    sub_237F4F5C8(&qword_2568A8FD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
    v32 = v52;
    sub_237F580E8();
    v33 = v55;
    v34 = v56 + v55[6];
    v42 = *(void (**)(uint64_t, char *, uint64_t))(v51 + 32);
    v42(v34, v13, v32);
    LOBYTE(v57) = 3;
    sub_237F580E8();
    v35 = v33[7];
    v36 = v56;
    sub_237F58110(v56 + v35, (uint64_t)v11);
    LOBYTE(v57) = 4;
    sub_237F580E8();
    v37 = v55;
    sub_237F58110(v36 + v55[8], v45);
    v59 = 5;
    sub_237F5721C();
    sub_237F580E8();
    v38 = (_OWORD *)(v36 + v37[9]);
    v39 = v58;
    *v38 = v57;
    v38[1] = v39;
    LOBYTE(v57) = 6;
    sub_237F4F5C8(&qword_2568A9258, type metadata accessor for Credential, (uint64_t)&protocol conformance descriptor for Credential);
    sub_237F223CC();
    v40 = v44;
    sub_237F580E8();
    sub_237F580F0();
    sub_237F56044(v40, v36 + v37[10]);
    sub_237F57258(v36, v43, (uint64_t (*)(_QWORD))type metadata accessor for AssetUploadRequest);
    sub_237F58108();
    sub_237F5729C(v36);
  }
  sub_237F1B978();
}

Swift::Int sub_237F571E4()
{
  Hasher.init(_seed:)();
  AssetUploadRequest.hash(into:)();
  return Hasher._finalize()();
}

unint64_t sub_237F5721C()
{
  unint64_t result;

  result = qword_2568AA2C8;
  if (!qword_2568AA2C8)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for Asset.Protector, &type metadata for Asset.Protector);
    atomic_store(result, (unint64_t *)&qword_2568AA2C8);
  }
  return result;
}

uint64_t sub_237F57258(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_237F5729C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AssetUploadRequest();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_237F572D8(_QWORD *a1)
{
  uint64_t result;

  a1[1] = sub_237F4F5C8(&qword_2568A9E78, (uint64_t (*)(uint64_t))type metadata accessor for AssetUploadRequest, (uint64_t)&protocol conformance descriptor for AssetUploadRequest);
  a1[2] = sub_237F4F5C8(&qword_2568A9E48, (uint64_t (*)(uint64_t))type metadata accessor for AssetUploadRequest, (uint64_t)&protocol conformance descriptor for AssetUploadRequest);
  a1[3] = sub_237F4F5C8(&qword_2568AA2D0, (uint64_t (*)(uint64_t))type metadata accessor for AssetUploadRequest, (uint64_t)&protocol conformance descriptor for AssetUploadRequest);
  result = sub_237F4F5C8(&qword_2568AA2D8, (uint64_t (*)(uint64_t))type metadata accessor for AssetUploadRequest, (uint64_t)&protocol conformance descriptor for AssetUploadRequest);
  a1[4] = result;
  return result;
}

uint64_t sub_237F5736C()
{
  return sub_237F4F5C8(&qword_2568AA2E0, (uint64_t (*)(uint64_t))type metadata accessor for AssetUploadRequest, (uint64_t)&protocol conformance descriptor for AssetUploadRequest);
}

void sub_237F57398(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  AssetUploadRequest.init(from:)(a1, a2);
}

void sub_237F573AC(_QWORD *a1)
{
  AssetUploadRequest.encode(to:)(a1);
}

uint64_t sub_237F573C0()
{
  return sub_237F4F5C8(&qword_2568A8F70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

char *initializeBufferWithCopyOfBuffer for AssetUploadRequest(char *a1, char *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  uint64_t *v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v36 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v36 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for UUID();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = &a1[v8];
    v11 = &a2[v8];
    v12 = *((_QWORD *)v11 + 1);
    *(_QWORD *)v10 = *(_QWORD *)v11;
    *((_QWORD *)v10 + 1) = v12;
    v13 = &a1[v9];
    v14 = &a2[v9];
    v15 = type metadata accessor for URL();
    v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    v16(v13, v14, v15);
    v16(&a1[a3[7]], &a2[a3[7]], v15);
    v16(&a1[a3[8]], &a2[a3[8]], v15);
    v17 = a3[9];
    v18 = (uint64_t *)&a1[v17];
    v19 = &a2[v17];
    v20 = *(_QWORD *)&a2[v17];
    v21 = *(_QWORD *)&a2[v17 + 8];
    sub_237F17134(v20, v21);
    *v18 = v20;
    v18[1] = v21;
    v22 = *((_QWORD *)v19 + 2);
    v23 = *((_QWORD *)v19 + 3);
    sub_237F17134(v22, v23);
    v18[2] = v22;
    v18[3] = v23;
    v24 = a3[10];
    v25 = &a1[v24];
    v26 = &a2[v24];
    v27 = *(_QWORD *)&a2[v24];
    v28 = *((_QWORD *)v26 + 1);
    *(_QWORD *)v25 = v27;
    *((_QWORD *)v25 + 1) = v28;
    v29 = *((_QWORD *)v26 + 3);
    *((_QWORD *)v25 + 2) = *((_QWORD *)v26 + 2);
    *((_QWORD *)v25 + 3) = v29;
    v30 = *((_QWORD *)v26 + 5);
    *((_QWORD *)v25 + 4) = *((_QWORD *)v26 + 4);
    *((_QWORD *)v25 + 5) = v30;
    v31 = *(int *)(type metadata accessor for Credential(0) + 28);
    v32 = &v25[v31];
    v33 = &v26[v31];
    v34 = type metadata accessor for Date();
    v35 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v35(v32, v33, v34);
  }
  return a1;
}

uint64_t destroy for AssetUploadRequest(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  v5 = a1 + a2[6];
  v6 = type metadata accessor for URL();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(a1 + a2[7], v6);
  v7(a1 + a2[8], v6);
  v8 = a1 + a2[9];
  sub_237F17178(*(_QWORD *)v8, *(_QWORD *)(v8 + 8));
  sub_237F17178(*(_QWORD *)(v8 + 16), *(_QWORD *)(v8 + 24));
  v9 = a1 + a2[10];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = v9 + *(int *)(type metadata accessor for Credential(0) + 28);
  v11 = type metadata accessor for Date();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
}

uint64_t initializeWithCopy for AssetUploadRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a1 + v8;
  v13 = a2 + v8;
  v14 = type metadata accessor for URL();
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  v15(a1 + a3[7], a2 + a3[7], v14);
  v15(a1 + a3[8], a2 + a3[8], v14);
  v16 = a3[9];
  v17 = (uint64_t *)(a1 + v16);
  v18 = a2 + v16;
  v19 = *(_QWORD *)(a2 + v16);
  v20 = *(_QWORD *)(a2 + v16 + 8);
  sub_237F17134(v19, v20);
  *v17 = v19;
  v17[1] = v20;
  v21 = *(_QWORD *)(v18 + 16);
  v22 = *(_QWORD *)(v18 + 24);
  sub_237F17134(v21, v22);
  v17[2] = v21;
  v17[3] = v22;
  v23 = a3[10];
  v24 = (_QWORD *)(a1 + v23);
  v25 = (_QWORD *)(a2 + v23);
  v26 = *(_QWORD *)(a2 + v23);
  v27 = v25[1];
  *v24 = v26;
  v24[1] = v27;
  v28 = v25[3];
  v24[2] = v25[2];
  v24[3] = v28;
  v29 = v25[5];
  v24[4] = v25[4];
  v24[5] = v29;
  v30 = *(int *)(type metadata accessor for Credential(0) + 28);
  v31 = (char *)v24 + v30;
  v32 = (char *)v25 + v30;
  v33 = type metadata accessor for Date();
  v34 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v34(v31, v32, v33);
  return a1;
}

uint64_t assignWithCopy for AssetUploadRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[6];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = type metadata accessor for URL();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 24);
  v14(v11, v12, v13);
  v14(a1 + a3[7], a2 + a3[7], v13);
  v14(a1 + a3[8], a2 + a3[8], v13);
  v15 = a3[9];
  v16 = (uint64_t *)(a1 + v15);
  v17 = a2 + v15;
  v18 = *(_QWORD *)(a2 + v15);
  v19 = *(_QWORD *)(a2 + v15 + 8);
  sub_237F17134(v18, v19);
  v20 = *v16;
  v21 = v16[1];
  *v16 = v18;
  v16[1] = v19;
  sub_237F17178(v20, v21);
  v22 = *(_QWORD *)(v17 + 16);
  v23 = *(_QWORD *)(v17 + 24);
  sub_237F17134(v22, v23);
  v24 = v16[2];
  v25 = v16[3];
  v16[2] = v22;
  v16[3] = v23;
  sub_237F17178(v24, v25);
  v26 = a3[10];
  v27 = (_QWORD *)(a1 + v26);
  v28 = (_QWORD *)(a2 + v26);
  *v27 = *(_QWORD *)(a2 + v26);
  v27[1] = *(_QWORD *)(a2 + v26 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v27[2] = v28[2];
  v27[3] = v28[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v27[4] = v28[4];
  v27[5] = v28[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v29 = *(int *)(type metadata accessor for Credential(0) + 28);
  v30 = (char *)v27 + v29;
  v31 = (char *)v28 + v29;
  v32 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 24))(v30, v31, v32);
  return a1;
}

uint64_t initializeWithTake for AssetUploadRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  __int128 v16;
  _OWORD *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for URL();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(a1 + a3[7], a2 + a3[7], v10);
  v11(a1 + a3[8], a2 + a3[8], v10);
  v12 = a3[9];
  v13 = a3[10];
  v14 = (_OWORD *)(a1 + v12);
  v15 = (_OWORD *)(a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = (_OWORD *)(a1 + v13);
  v18 = a2 + v13;
  v19 = *(_OWORD *)(a2 + v13 + 16);
  *v17 = *(_OWORD *)(a2 + v13);
  v17[1] = v19;
  v17[2] = *(_OWORD *)(a2 + v13 + 32);
  v20 = *(int *)(type metadata accessor for Credential(0) + 28);
  v21 = (char *)v17 + v20;
  v22 = v18 + v20;
  v23 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v21, v22, v23);
  return a1;
}

uint64_t assignWithTake for AssetUploadRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = type metadata accessor for URL();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40);
  v16(v13, v14, v15);
  v16(a1 + a3[7], a2 + a3[7], v15);
  v16(a1 + a3[8], a2 + a3[8], v15);
  v17 = a3[9];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = *(_QWORD *)(a1 + v17);
  v21 = *(_QWORD *)(a1 + v17 + 8);
  *(_OWORD *)(a1 + v17) = *(_OWORD *)(a2 + v17);
  sub_237F17178(v20, v21);
  v22 = *(_QWORD *)(v18 + 16);
  v23 = *(_QWORD *)(v18 + 24);
  *(_OWORD *)(v18 + 16) = *(_OWORD *)(v19 + 16);
  sub_237F17178(v22, v23);
  v24 = a3[10];
  v25 = (_QWORD *)(a1 + v24);
  v26 = (_QWORD *)(a2 + v24);
  v27 = *(_QWORD *)(a2 + v24 + 8);
  *v25 = *(_QWORD *)(a2 + v24);
  v25[1] = v27;
  swift_bridgeObjectRelease();
  v28 = v26[3];
  v25[2] = v26[2];
  v25[3] = v28;
  swift_bridgeObjectRelease();
  v29 = v26[5];
  v25[4] = v26[4];
  v25[5] = v29;
  swift_bridgeObjectRelease();
  v30 = *(int *)(type metadata accessor for Credential(0) + 28);
  v31 = (char *)v25 + v30;
  v32 = (char *)v26 + v30;
  v33 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 40))(v31, v32, v33);
  return a1;
}

uint64_t getEnumTagSinglePayload for AssetUploadRequest()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237F57C78(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_237F22334();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
    return _s10CloudAsset21UploadResponseMessageOwet_0(v8, v3, v7);
  }
  if ((_DWORD)v3 != 0x7FFFFFFF)
  {
    v11 = sub_237F18100();
    if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == (_DWORD)v3)
    {
      v7 = v11;
      v12 = a3[6];
    }
    else
    {
      v7 = type metadata accessor for Credential(0);
      v12 = a3[10];
    }
    v8 = v4 + v12;
    return _s10CloudAsset21UploadResponseMessageOwet_0(v8, v3, v7);
  }
  v9 = *(_QWORD *)(v4 + a3[5] + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for AssetUploadRequest()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_237F57D38(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = sub_237F22334();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v5;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(v5 + a4[5] + 8) = (v4 - 1);
      sub_237F1BA50();
      return;
    }
    v11 = sub_237F18100();
    if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == a3)
    {
      v9 = v11;
      v12 = a4[6];
    }
    else
    {
      v9 = type metadata accessor for Credential(0);
      v12 = a4[10];
    }
    v10 = v5 + v12;
  }
  _s10CloudAsset21UploadResponseMessageOwst_0(v10, v4, v4, v9);
}

uint64_t sub_237F57DE0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for URL();
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for Credential(319);
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AssetUploadRequest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFA)
  {
    if (a2 + 6 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 6) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v5 = v6 - 7;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AssetUploadRequest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_237F57F68 + 4 * byte_237F61DBC[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_237F57F9C + 4 * byte_237F61DB7[v4]))();
}

uint64_t sub_237F57F9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F57FA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237F57FACLL);
  return result;
}

uint64_t sub_237F57FB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237F57FC0);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_237F57FC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F57FCC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AssetUploadRequest.CodingKeys()
{
  return &type metadata for AssetUploadRequest.CodingKeys;
}

unint64_t sub_237F57FEC()
{
  unint64_t result;

  result = qword_2568AA2F8;
  if (!qword_2568AA2F8)
  {
    result = MEMORY[0x23B82832C](&unk_237F61FF4, &type metadata for AssetUploadRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA2F8);
  }
  return result;
}

unint64_t sub_237F5802C()
{
  unint64_t result;

  result = qword_2568AA300;
  if (!qword_2568AA300)
  {
    result = MEMORY[0x23B82832C](&unk_237F61F64, &type metadata for AssetUploadRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA300);
  }
  return result;
}

unint64_t sub_237F5806C()
{
  unint64_t result;

  result = qword_2568AA308;
  if (!qword_2568AA308)
  {
    result = MEMORY[0x23B82832C](&unk_237F61F8C, &type metadata for AssetUploadRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA308);
  }
  return result;
}

uint64_t sub_237F580A8(uint64_t a1, uint64_t a2)
{
  return sub_237F56044(a1, a2);
}

uint64_t sub_237F580C4()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(v1 - 136) + 8))(*(_QWORD *)(v1 - 184), v0);
}

uint64_t sub_237F580D8()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_237F580E8()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_237F580F0()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 136) + 8))(*(_QWORD *)(v0 - 184), *(_QWORD *)(v0 - 192));
}

uint64_t sub_237F58100(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t sub_237F58108()
{
  uint64_t v0;

  return sub_237F172A0(*(_QWORD *)(v0 - 144));
}

uint64_t sub_237F58110(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 - 232))(a1, a2, v2);
}

uint64_t sub_237F5811C()
{
  uint64_t v0;
  unint64_t v1;

  return sub_237F17178(v0, v1);
}

uint64_t sub_237F58128()
{
  unint64_t v0;
  uint64_t v1;

  return sub_237F17178(v1, v0);
}

BOOL static XPCError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void XPCError.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

uint64_t sub_237F58170(uint64_t a1, uint64_t a2)
{
  BOOL v5;
  BOOL v6;
  char v8;

  if (a1 == 0xD000000000000015 && a2 == 0x8000000237F652C0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v5 = a1 == 0x636552726F727265 && a2 == 0xED00006465766965;
    if (v5 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x8000000237F652E0
           || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v6 = a1 == 0x456E776F6E6B6E75 && a2 == 0xEF746E696F70646ELL;
      if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0x6C616E7265746E69 && a2 == 0xED0000726F727245)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v8 & 1) != 0)
          return 4;
        else
          return 5;
      }
    }
  }
}

uint64_t sub_237F583E4()
{
  return 5;
}

uint64_t sub_237F583EC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_237F5842C + 4 * byte_237F62070[a1]))(0xD000000000000015, 0x8000000237F652C0);
}

uint64_t sub_237F5842C()
{
  return 0x636552726F727265;
}

unint64_t sub_237F58450()
{
  return 0xD000000000000010;
}

uint64_t sub_237F5846C()
{
  return 0x456E776F6E6B6E75;
}

uint64_t sub_237F58490()
{
  return 0x6C616E7265746E69;
}

uint64_t sub_237F584B8()
{
  unsigned __int8 *v0;

  return sub_237F583EC(*v0);
}

uint64_t sub_237F584C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237F58170(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237F584E4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_237F583E4();
  *a1 = result;
  return result;
}

uint64_t sub_237F58508()
{
  sub_237F58990();
  return CodingKey.description.getter();
}

uint64_t sub_237F58530()
{
  sub_237F58990();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F58558()
{
  sub_237F58A44();
  return CodingKey.description.getter();
}

uint64_t sub_237F58580()
{
  sub_237F58A44();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F585A8()
{
  sub_237F58A80();
  return CodingKey.description.getter();
}

uint64_t sub_237F585D0()
{
  sub_237F58A80();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F585F8()
{
  sub_237F58ABC();
  return CodingKey.description.getter();
}

uint64_t sub_237F58620()
{
  sub_237F58ABC();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F58648()
{
  sub_237F589CC();
  return CodingKey.description.getter();
}

uint64_t sub_237F58670()
{
  sub_237F589CC();
  return CodingKey.debugDescription.getter();
}

uint64_t sub_237F58698()
{
  sub_237F58A08();
  return CodingKey.description.getter();
}

uint64_t sub_237F586C0()
{
  sub_237F58A08();
  return CodingKey.debugDescription.getter();
}

void XPCError.encode(to:)(_QWORD *a1)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_237F171BC(&qword_2568AA310);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v3);
  sub_237F180DC();
  sub_237F171BC(&qword_2568AA318);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v4);
  sub_237F59534(v5, v11);
  sub_237F171BC(&qword_2568AA320);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v6);
  sub_237F180DC();
  sub_237F171BC(&qword_2568AA328);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v7);
  sub_237F180DC();
  v8 = sub_237F171BC(&qword_2568AA330);
  MEMORY[0x24BDAC7A8](v8);
  sub_237F1DD54();
  sub_237F171BC(&qword_2568AA338);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v9);
  sub_237F1DD54();
  v10 = *v1;
  sub_237F171FC(a1, a1[3]);
  sub_237F58990();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  __asm { BR              X9 }
}

void sub_237F58880()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 - 69) = 0;
  sub_237F58ABC();
  v5 = *(_QWORD *)(v4 - 88);
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 96) + 8))(v1, v5);
  sub_237F1B978();
}

unint64_t sub_237F58990()
{
  unint64_t result;

  result = qword_2568AA340;
  if (!qword_2568AA340)
  {
    result = MEMORY[0x23B82832C](&unk_237F62630, &type metadata for XPCError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA340);
  }
  return result;
}

unint64_t sub_237F589CC()
{
  unint64_t result;

  result = qword_2568AA348;
  if (!qword_2568AA348)
  {
    result = MEMORY[0x23B82832C](&unk_237F625E0, &type metadata for XPCError.InternalErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA348);
  }
  return result;
}

unint64_t sub_237F58A08()
{
  unint64_t result;

  result = qword_2568AA350;
  if (!qword_2568AA350)
  {
    result = MEMORY[0x23B82832C](&unk_237F62590, &type metadata for XPCError.UnknownEndpointCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA350);
  }
  return result;
}

unint64_t sub_237F58A44()
{
  unint64_t result;

  result = qword_2568AA358;
  if (!qword_2568AA358)
  {
    result = MEMORY[0x23B82832C](&unk_237F62540, &type metadata for XPCError.CorruptedMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA358);
  }
  return result;
}

unint64_t sub_237F58A80()
{
  unint64_t result;

  result = qword_2568AA360;
  if (!qword_2568AA360)
  {
    result = MEMORY[0x23B82832C](&unk_237F624F0, &type metadata for XPCError.ErrorReceivedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA360);
  }
  return result;
}

unint64_t sub_237F58ABC()
{
  unint64_t result;

  result = qword_2568AA368;
  if (!qword_2568AA368)
  {
    result = MEMORY[0x23B82832C](&unk_237F624A0, &type metadata for XPCError.InitializationFailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA368);
  }
  return result;
}

void XPCError.hashValue.getter()
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
  char v9;

  v0 = Hasher.init(_seed:)();
  sub_237F59570(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9);
  Hasher._finalize()();
  sub_237F1BBBC();
}

void XPCError.init(from:)(_QWORD *a1)
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
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  sub_237F171BC(&qword_2568AA370);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v2);
  sub_237F180DC();
  sub_237F171BC(&qword_2568AA378);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v3);
  sub_237F59534(v4, v19);
  sub_237F171BC(&qword_2568AA380);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v5);
  sub_237F180DC();
  sub_237F171BC(&qword_2568AA388);
  sub_237F1B990();
  MEMORY[0x24BDAC7A8](v6);
  sub_237F180DC();
  v7 = sub_237F171BC(&qword_2568AA390);
  MEMORY[0x24BDAC7A8](v7);
  sub_237F1DD54();
  v8 = sub_237F171BC(&qword_2568AA398);
  MEMORY[0x24BDAC7A8](v8);
  sub_237F1DD54();
  sub_237F171FC(a1, a1[3]);
  sub_237F58990();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v20)
  {
    v9 = KeyedDecodingContainer.allKeys.getter();
    v10 = *(_QWORD *)(v9 + 16);
    if (v10)
    {
      v11 = *(unsigned __int8 *)(v9 + 32);
      sub_237F33F24(1, v10, v9, v9 + 32, 0, (2 * v10) | 1);
      v13 = v12;
      v15 = v14;
      swift_bridgeObjectRelease();
      if (v13 == v15 >> 1)
        __asm { BR              X9 }
    }
    v16 = type metadata accessor for DecodingError();
    swift_allocError();
    v18 = v17;
    sub_237F171BC(&qword_2568A95B0);
    *v18 = &type metadata for XPCError;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x24BEE26D0], v16);
    swift_willThrow();
    swift_unknownObjectRelease();
    sub_237F59550();
  }
  sub_237F172A0((uint64_t)a1);
  sub_237F1B978();
}

void sub_237F58E6C()
{
  uint64_t v0;

  sub_237F59594();
  sub_237F59520();
  if (!v0)
    JUMPOUT(0x237F58F44);
  JUMPOUT(0x237F58E48);
}

void sub_237F58E9C()
{
  uint64_t v0;

  sub_237F59588();
  sub_237F59520();
  if (!v0)
    JUMPOUT(0x237F58EC8);
  JUMPOUT(0x237F58E48);
}

void sub_237F58ED4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_237F5957C();
  v3 = *(_QWORD *)(v2 - 152);
  sub_237F59520();
  if (!v0)
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 176) + 8))(v3, v1);
    swift_unknownObjectRelease();
    sub_237F59550();
    **(_BYTE **)(v2 - 136) = *(_QWORD *)(v2 - 248);
    JUMPOUT(0x237F58E54);
  }
  JUMPOUT(0x237F58E48);
}

void sub_237F58F10()
{
  uint64_t v0;

  sub_237F59564();
  sub_237F59520();
  if (!v0)
    JUMPOUT(0x237F58F44);
  JUMPOUT(0x237F58E48);
}

void sub_237F58F70()
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
  char v9;

  v0 = Hasher.init(_seed:)();
  sub_237F59570(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9);
  Hasher._finalize()();
  sub_237F1BBBC();
}

void sub_237F58FA0(_QWORD *a1)
{
  XPCError.init(from:)(a1);
}

void sub_237F58FB4(_QWORD *a1)
{
  XPCError.encode(to:)(a1);
}

unint64_t sub_237F58FCC()
{
  unint64_t result;

  result = qword_2568AA3A0;
  if (!qword_2568AA3A0)
  {
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for XPCError, &type metadata for XPCError);
    atomic_store(result, (unint64_t *)&qword_2568AA3A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCError()
{
  return &type metadata for XPCError;
}

uint64_t _s10CloudAsset8XPCErrorOwet_0(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFC)
  {
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
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s10CloudAsset8XPCErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237F590F4 + 4 * byte_237F62084[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_237F59128 + 4 * byte_237F6207F[v4]))();
}

uint64_t sub_237F59128(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F59130(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237F59138);
  return result;
}

uint64_t sub_237F59144(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237F5914CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_237F59150(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237F59158(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for XPCError.CodingKeys()
{
  return &type metadata for XPCError.CodingKeys;
}

ValueMetadata *type metadata accessor for XPCError.InitializationFailureCodingKeys()
{
  return &type metadata for XPCError.InitializationFailureCodingKeys;
}

ValueMetadata *type metadata accessor for XPCError.ErrorReceivedCodingKeys()
{
  return &type metadata for XPCError.ErrorReceivedCodingKeys;
}

ValueMetadata *type metadata accessor for XPCError.CorruptedMessageCodingKeys()
{
  return &type metadata for XPCError.CorruptedMessageCodingKeys;
}

ValueMetadata *type metadata accessor for XPCError.UnknownEndpointCodingKeys()
{
  return &type metadata for XPCError.UnknownEndpointCodingKeys;
}

ValueMetadata *type metadata accessor for XPCError.InternalErrorCodingKeys()
{
  return &type metadata for XPCError.InternalErrorCodingKeys;
}

unint64_t sub_237F591C8()
{
  unint64_t result;

  result = qword_2568AA3A8;
  if (!qword_2568AA3A8)
  {
    result = MEMORY[0x23B82832C](&unk_237F62478, &type metadata for XPCError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA3A8);
  }
  return result;
}

unint64_t sub_237F59208()
{
  unint64_t result;

  result = qword_2568AA3B0;
  if (!qword_2568AA3B0)
  {
    result = MEMORY[0x23B82832C](&unk_237F62398, &type metadata for XPCError.InitializationFailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA3B0);
  }
  return result;
}

unint64_t sub_237F59248()
{
  unint64_t result;

  result = qword_2568AA3B8;
  if (!qword_2568AA3B8)
  {
    result = MEMORY[0x23B82832C](&unk_237F623C0, &type metadata for XPCError.InitializationFailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA3B8);
  }
  return result;
}

unint64_t sub_237F59288()
{
  unint64_t result;

  result = qword_2568AA3C0;
  if (!qword_2568AA3C0)
  {
    result = MEMORY[0x23B82832C](&unk_237F62348, &type metadata for XPCError.ErrorReceivedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA3C0);
  }
  return result;
}

unint64_t sub_237F592C8()
{
  unint64_t result;

  result = qword_2568AA3C8;
  if (!qword_2568AA3C8)
  {
    result = MEMORY[0x23B82832C](&unk_237F62370, &type metadata for XPCError.ErrorReceivedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA3C8);
  }
  return result;
}

unint64_t sub_237F59308()
{
  unint64_t result;

  result = qword_2568AA3D0;
  if (!qword_2568AA3D0)
  {
    result = MEMORY[0x23B82832C](&unk_237F622F8, &type metadata for XPCError.CorruptedMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA3D0);
  }
  return result;
}

unint64_t sub_237F59348()
{
  unint64_t result;

  result = qword_2568AA3D8;
  if (!qword_2568AA3D8)
  {
    result = MEMORY[0x23B82832C](&unk_237F62320, &type metadata for XPCError.CorruptedMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA3D8);
  }
  return result;
}

unint64_t sub_237F59388()
{
  unint64_t result;

  result = qword_2568AA3E0;
  if (!qword_2568AA3E0)
  {
    result = MEMORY[0x23B82832C](&unk_237F622A8, &type metadata for XPCError.UnknownEndpointCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA3E0);
  }
  return result;
}

unint64_t sub_237F593C8()
{
  unint64_t result;

  result = qword_2568AA3E8;
  if (!qword_2568AA3E8)
  {
    result = MEMORY[0x23B82832C](&unk_237F622D0, &type metadata for XPCError.UnknownEndpointCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA3E8);
  }
  return result;
}

unint64_t sub_237F59408()
{
  unint64_t result;

  result = qword_2568AA3F0;
  if (!qword_2568AA3F0)
  {
    result = MEMORY[0x23B82832C](&unk_237F62258, &type metadata for XPCError.InternalErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA3F0);
  }
  return result;
}

unint64_t sub_237F59448()
{
  unint64_t result;

  result = qword_2568AA3F8;
  if (!qword_2568AA3F8)
  {
    result = MEMORY[0x23B82832C](&unk_237F62280, &type metadata for XPCError.InternalErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA3F8);
  }
  return result;
}

unint64_t sub_237F59488()
{
  unint64_t result;

  result = qword_2568AA400;
  if (!qword_2568AA400)
  {
    result = MEMORY[0x23B82832C](&unk_237F623E8, &type metadata for XPCError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA400);
  }
  return result;
}

unint64_t sub_237F594C8()
{
  unint64_t result;

  result = qword_2568AA408;
  if (!qword_2568AA408)
  {
    result = MEMORY[0x23B82832C](&unk_237F62410, &type metadata for XPCError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568AA408);
  }
  return result;
}

uint64_t sub_237F59508()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_237F59520()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

void sub_237F59534(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_237F59550()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v0, v1);
}

unint64_t sub_237F59564()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 4;
  return sub_237F589CC();
}

void sub_237F59570(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  Swift::UInt v10;

  Hasher._combine(_:)(v10);
}

unint64_t sub_237F5957C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 3;
  return sub_237F58A08();
}

unint64_t sub_237F59588()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 2;
  return sub_237F58A44();
}

unint64_t sub_237F59594()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 68) = 1;
  return sub_237F58A80();
}

uint64_t sub_237F595A0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[4] = a1;
  v2[5] = v1;
  v2[6] = sub_237F171BC(&qword_2568A91F0);
  v2[7] = sub_237F34CEC();
  sub_237F171BC(&qword_2568A9638);
  v2[8] = sub_237F34CEC();
  v3 = sub_237F171BC(&qword_2568A91C0);
  v2[9] = v3;
  v2[10] = *(_QWORD *)(v3 - 8);
  v2[11] = sub_237F34CEC();
  v4 = sub_237F171BC(&qword_2568A9640);
  v2[12] = v4;
  v2[13] = *(_QWORD *)(v4 - 8);
  v2[14] = sub_237F34CEC();
  return sub_237F34CD8();
}

uint64_t sub_237F59644()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 120) = *(_QWORD *)(*(_QWORD *)(v0 + 40) + 112);
  return sub_237F34CE4();
}

uint64_t sub_237F5965C()
{
  _QWORD *v0;

  (*(void (**)(_QWORD, uint64_t, _QWORD))(v0[10] + 16))(v0[11], v0[15] + OBJC_IVAR____TtC10CloudAsset25AssetsDownloadCoordinator__results, v0[9]);
  return sub_237F34CD8();
}

uint64_t sub_237F596AC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[10];
  v1 = v0[11];
  v3 = v0[9];
  MEMORY[0x23B827DB0](v3);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_237F59938();
  v4 = (_QWORD *)swift_task_alloc();
  v0[16] = v4;
  *v4 = v0;
  v4[1] = sub_237F59754;
  return _sScs8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF();
}

uint64_t sub_237F59754()
{
  swift_task_dealloc();
  return sub_237F449BC();
}

uint64_t sub_237F597B0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  v1 = v0[8];
  if (_s10CloudAsset21UploadResponseMessageOwet_0(v1, 1, v0[6]) == 1)
  {
    sub_237F59BA8();
    sub_237F19568();
    swift_allocError();
    swift_willThrow();
  }
  else
  {
    sub_237F34ABC(v1, v0[7]);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      sub_237F16480(v0[7], v0[4]);
      sub_237F59B98();
      sub_237F34D9C();
      swift_task_dealloc();
      sub_237F34D94();
      swift_task_dealloc();
      v2 = (uint64_t (*)(void))v0[1];
      return v2();
    }
    v0[3] = *(_QWORD *)v0[7];
    sub_237F171BC(&qword_2568A91E0);
    swift_willThrowTypedImpl();
    sub_237F59B98();
  }
  sub_237F34D5C();
  sub_237F34D9C();
  swift_task_dealloc();
  sub_237F34D94();
  v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_237F598F0()
{
  uint64_t v0;

  sub_237F59BA8();
  sub_237F34D5C();
  sub_237F34D9C();
  swift_task_dealloc();
  sub_237F34D94();
  return sub_237F44A88(*(uint64_t (**)(void))(v0 + 8));
}

unint64_t sub_237F59938()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568AA418;
  if (!qword_2568AA418)
  {
    v1 = type metadata accessor for AssetDownloadCoordinator();
    result = MEMORY[0x23B82832C](&protocol conformance descriptor for AssetDownloadCoordinator, v1);
    atomic_store(result, (unint64_t *)&qword_2568AA418);
  }
  return result;
}

uint64_t type metadata accessor for AssetDownloadCoordinator()
{
  return objc_opt_self();
}

uint64_t sub_237F59994(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *a1;
  *(_QWORD *)(v2 + 24) = v1;
  *(_QWORD *)(v2 + 32) = v3;
  return sub_237F34CE4();
}

uint64_t sub_237F599AC()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[2] = v0[4];
  v1 = (_QWORD *)swift_task_alloc();
  v0[5] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_237F59A04;
  return sub_237F22470(v0 + 2);
}

uint64_t sub_237F59A04()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
    return sub_237F449BC();
  else
    return sub_237F44A88(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_237F59A64()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AssetDownloadCoordinator.deinit()
{
  uint64_t v0;

  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t AssetDownloadCoordinator.__deallocating_deinit()
{
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t AssetDownloadCoordinator.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F59AC4()
{
  return AssetDownloadCoordinator.unownedExecutor.getter();
}

uint64_t method lookup function for AssetDownloadCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AssetDownloadCoordinator.result()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v3 = (_QWORD *)sub_237F34D08();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_237F22A60;
  return v5(a1);
}

uint64_t dispatch thunk of AssetDownloadCoordinator.receive(signal:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v3 = (_QWORD *)sub_237F34D08();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_237F59B94;
  return v5(a1);
}

uint64_t sub_237F59B98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_237F59BA8()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[13] + 8))(v0[14], v0[12]);
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t JSONEncoder.init()()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t LocalizedError.failureReason.getter()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t LocalizedError.errorDescription.getter()
{
  return MEMORY[0x24BDCBE78]();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t URL.absoluteString.getter()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t URL.lastPathComponent.getter()
{
  return MEMORY[0x24BDCD898]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

uint64_t URL.deletingLastPathComponent()()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t static URL.== infix(_:_:)()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t URL.init(string:)()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t URL.appending<A>(path:directoryHint:)()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t static Data.== infix(_:_:)()
{
  return MEMORY[0x24BDCDCC8]();
}

uint64_t Data.hash(into:)()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t static Date.distantFuture.getter()
{
  return MEMORY[0x24BDCE2F8]();
}

uint64_t static Date.== infix(_:_:)()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t static UUID.== infix(_:_:)()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t Google_Protobuf_Timestamp.date.getter()
{
  return MEMORY[0x24BE5B970]();
}

uint64_t Google_Protobuf_Timestamp.init(date:)()
{
  return MEMORY[0x24BE5B978]();
}

uint64_t Google_Protobuf_Timestamp.init()()
{
  return MEMORY[0x24BE5B988]();
}

uint64_t type metadata accessor for Google_Protobuf_Timestamp()
{
  return MEMORY[0x24BE5B990]();
}

uint64_t UnknownStorage.traverse<A>(visitor:)()
{
  return MEMORY[0x24BE5BF00]();
}

uint64_t UnknownStorage.init()()
{
  return MEMORY[0x24BE5BF08]();
}

uint64_t type metadata accessor for UnknownStorage()
{
  return MEMORY[0x24BE5BF10]();
}

uint64_t BinaryDecodingOptions.init()()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t type metadata accessor for BinaryDecodingOptions()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t _MessageImplementationBase._protobuf_generated_isEqualTo(other:)()
{
  return MEMORY[0x24BE5C008]();
}

uint64_t _MessageImplementationBase.isEqualTo(message:)()
{
  return MEMORY[0x24BE5C010]();
}

uint64_t Enum.hash(into:)()
{
  return MEMORY[0x24BE5C018]();
}

uint64_t dispatch thunk of Decoder.nextFieldNumber()()
{
  return MEMORY[0x24BE5C038]();
}

uint64_t dispatch thunk of Decoder.decodeSingularEnumField<A>(value:)()
{
  return MEMORY[0x24BE5C078]();
}

uint64_t dispatch thunk of Decoder.decodeSingularBytesField(value:)()
{
  return MEMORY[0x24BE5C0A8]();
}

uint64_t dispatch thunk of Decoder.decodeSingularInt64Field(value:)()
{
  return MEMORY[0x24BE5C0D8]();
}

uint64_t dispatch thunk of Decoder.decodeSingularStringField(value:)()
{
  return MEMORY[0x24BE5C120]();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)()
{
  return MEMORY[0x24BE5C148]();
}

uint64_t dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)()
{
  return MEMORY[0x24BE5C160]();
}

uint64_t Message.isInitialized.getter()
{
  return MEMORY[0x24BE5C1B0]();
}

uint64_t Message.init(serializedData:extensions:partial:options:)()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t Message.serializedData(partial:)()
{
  return MEMORY[0x24BE5C1C0]();
}

uint64_t Message.debugDescription.getter()
{
  return MEMORY[0x24BE5C1D0]();
}

uint64_t Message.hash(into:)()
{
  return MEMORY[0x24BE5C1E8]();
}

uint64_t dispatch thunk of Visitor.visitSingularEnumField<A>(value:fieldNumber:)()
{
  return MEMORY[0x24BE5C278]();
}

uint64_t dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)()
{
  return MEMORY[0x24BE5C298]();
}

uint64_t dispatch thunk of Visitor.visitSingularInt64Field(value:fieldNumber:)()
{
  return MEMORY[0x24BE5C2B0]();
}

uint64_t dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)()
{
  return MEMORY[0x24BE5C2E8]();
}

uint64_t dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)()
{
  return MEMORY[0x24BE5C300]();
}

uint64_t dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)()
{
  return MEMORY[0x24BE5C310]();
}

uint64_t type metadata accessor for _NameMap.NameDescription()
{
  return MEMORY[0x24BE5C330]();
}

uint64_t _NameMap.init(dictionaryLiteral:)()
{
  return MEMORY[0x24BE5C340]();
}

uint64_t type metadata accessor for _NameMap()
{
  return MEMORY[0x24BE5C350]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t XPCSession.__allocating_init<A>(machService:targetQueue:options:incomingMessageHandler:cancellationHandler:)()
{
  return MEMORY[0x24BEE64F8]();
}

uint64_t static XPCSession.InitializationOptions.none.getter()
{
  return MEMORY[0x24BEE6520]();
}

uint64_t type metadata accessor for XPCSession.InitializationOptions()
{
  return MEMORY[0x24BEE6530]();
}

uint64_t dispatch thunk of XPCSession.send<A, B>(_:replyHandler:)()
{
  return MEMORY[0x24BEE6568]();
}

uint64_t dispatch thunk of XPCSession.send<A>(_:)()
{
  return MEMORY[0x24BEE6570]();
}

uint64_t dispatch thunk of XPCSession.cancel(reason:)()
{
  return MEMORY[0x24BEE6578]();
}

uint64_t type metadata accessor for XPCSession()
{
  return MEMORY[0x24BEE65A8]();
}

uint64_t XPCRichError.canRetry.getter()
{
  return MEMORY[0x24BEE6670]();
}

uint64_t type metadata accessor for XPCRichError()
{
  return MEMORY[0x24BEE6678]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t String.append<A>(contentsOf:)()
{
  return MEMORY[0x24BEE0BB0]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t type metadata accessor for CheckedContinuation()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t static Task<>.currentPriority.getter()
{
  return MEMORY[0x24BEE6B18]();
}

uint64_t static AsyncThrowingStream.makeStream<>(of:throwing:bufferingPolicy:)()
{
  return MEMORY[0x24BEE6C50]();
}

uint64_t type metadata accessor for AsyncThrowingStream.Continuation.YieldResult()
{
  return MEMORY[0x24BEE6C80]();
}

uint64_t type metadata accessor for AsyncThrowingStream.Continuation.BufferingPolicy()
{
  return MEMORY[0x24BEE6CA8]();
}

uint64_t AsyncThrowingStream.Continuation.yield(_:)()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t AsyncThrowingStream.Continuation.finish(throwing:)()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t type metadata accessor for AsyncThrowingStream.Continuation()
{
  return MEMORY[0x24BEE6CD0]();
}

uint64_t AsyncThrowingStream.makeAsyncIterator()()
{
  return MEMORY[0x24BEE6CE0]();
}

uint64_t _sScs8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF()
{
  return MEMORY[0x24BEE6CE8]();
}

uint64_t type metadata accessor for AsyncThrowingStream()
{
  return MEMORY[0x24BEE6D28]();
}

uint64_t AsyncThrowingStream.init<>(_:bufferingPolicy:_:)()
{
  return MEMORY[0x24BEE6D30]();
}

uint64_t Collection<>.popFirst()()
{
  return MEMORY[0x24BEE1930]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t type metadata accessor for ArraySlice()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t ArraySlice.init<A>(_:)()
{
  return MEMORY[0x24BEE2168]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x24BEE2E58](isUnique, capacity);
}

Swift::Void __swiftcall _NativeDictionary.copy()()
{
  MEMORY[0x24BEE2E68]();
}

uint64_t _NativeDictionary._delete(at:)()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

{
  return MEMORY[0x24BEE2F48]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x24BEE3350]();
}

{
  return MEMORY[0x24BEE33A0]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t type metadata accessor for KeyedDecodingContainer()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x24BEE34A0]();
}

{
  return MEMORY[0x24BEE34F0]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t type metadata accessor for KeyedEncodingContainer()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t withCheckedThrowingContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
  MEMORY[0x24BEE4300](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
  MEMORY[0x24BEE4318](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t type metadata accessor for Result()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x24BEE4A10]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x24BDAFC20]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

