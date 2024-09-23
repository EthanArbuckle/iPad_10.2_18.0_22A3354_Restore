void static AsyncStateValue.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t TupleTypeMetadata2;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, uint64_t, uint64_t);
  char *v31;
  _QWORD v32[8];

  v32[5] = *(_QWORD *)(a3 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1, a2, a3, a4);
  v32[3] = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10);
  v32[4] = (char *)v32 - v11;
  v32[2] = v12;
  v14 = type metadata accessor for AsyncStateValue(0, v13, v12, v12);
  v15 = *(_QWORD *)(v14 - 8);
  v19 = MEMORY[0x24BDAC7A8](v14, v16, v17, v18);
  MEMORY[0x24BDAC7A8](v19, v20, v21, v22);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v32[7] = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v27 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2, v24, v25, v26);
  v29 = (char *)v32 + *(int *)(v27 + 48) - v28;
  v32[6] = v15;
  v30 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v30((char *)v32 - v28, a1, v14);
  v30(v29, a2, v14);
  v31 = (char *)sub_23A2551C8 + 4 * byte_23A276A60[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A2551C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);

  v3(v5, v2, v0);
  if (swift_getEnumCaseMultiPayload())
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 104) + 8))(v5, v1);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 88) + 8))(v2, v4);
    v8 = 0;
  }
  else
  {
    v10 = *(_QWORD *)(v7 - 112);
    v9 = *(_QWORD *)(v7 - 104);
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32);
    v11(v10, v5, v1);
    v12 = *(_QWORD *)(v7 - 120);
    v11(v12, v6, v1);
    v8 = sub_23A275FB8();
    v13 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v13(v12, v1);
    v13(v10, v1);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 96) + 8))(v2, v0);
  }
  return v8 & 1;
}

uint64_t type metadata accessor for AsyncStateValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncStateValue);
}

void AsyncStateValue.to<A>(transform:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
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
  _QWORD v22[4];

  v22[2] = a4;
  v22[3] = a5;
  v22[0] = a2;
  v22[1] = a1;
  v7 = sub_23A275E14();
  v11 = MEMORY[0x24BDAC7A8](v7, v8, v9, v10);
  v15 = MEMORY[0x24BDAC7A8](v11, v12, v13, v14);
  MEMORY[0x24BDAC7A8](v15, v16, v17, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))((char *)v22 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v5, a3);
  v21 = (char *)sub_23A255540 + 4 * byte_23A276A65[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A255540()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 32))(v3, v1, v2);
  (*(void (**)(uint64_t))(v4 - 104))(v3);
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v3, v2);
  type metadata accessor for AsyncStateValue(0, *(_QWORD *)(v4 - 96), *(_QWORD *)(v4 - 88), v5);
  return swift_storeEnumTagMultiPayload();
}

BOOL sub_23A2556E0(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23A2556F0()
{
  return sub_23A2763E4();
}

uint64_t sub_23A255714(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1701736302 && a2 == 0xE400000000000000;
  if (v3 || (sub_23A27636C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696863746566 && a2 == 0xE800000000000000 || (sub_23A27636C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6968736572666572 && a2 == 0xEA0000000000676ELL || (sub_23A27636C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x64656863746566 && a2 == 0xE700000000000000 || (sub_23A27636C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x64656C696166 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_23A27636C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_23A255900(char a1)
{
  return *(_QWORD *)&aNone_2[8 * a1];
}

BOOL sub_23A255920(char *a1, char *a2)
{
  return sub_23A2556E0(*a1, *a2);
}

uint64_t sub_23A255934()
{
  return sub_23A255B94();
}

uint64_t sub_23A255950()
{
  return sub_23A2556F0();
}

uint64_t sub_23A25595C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A255DE4(a1, a2, a3, (void (*)(_BYTE *, _QWORD, _QWORD, _QWORD))sub_23A2556F0);
}

uint64_t sub_23A255968()
{
  char *v0;

  return sub_23A255900(*v0);
}

uint64_t sub_23A255974@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A255714(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A2559A0()
{
  return 0;
}

uint64_t sub_23A2559AC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A25936C();
  *a1 = result;
  return result;
}

uint64_t sub_23A2559D4(uint64_t a1)
{
  MEMORY[0x23B846C88](&unk_23A2774E8, a1);
  return sub_23A27642C();
}

uint64_t sub_23A255A08(uint64_t a1)
{
  MEMORY[0x23B846C88](&unk_23A2774E8, a1);
  return sub_23A276438();
}

uint64_t sub_23A255A3C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6D6F44726F727265 && a2 == 0xEB000000006E6961;
  if (v3 || (sub_23A27636C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x646F43726F727265 && a2 == 0xE900000000000065 || (sub_23A27636C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000023A278980)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23A27636C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23A255B94()
{
  sub_23A2763D8();
  sub_23A2763E4();
  return sub_23A2763FC();
}

uint64_t sub_23A255BD8(char a1)
{
  if (!a1)
    return 0x6D6F44726F727265;
  if (a1 == 1)
    return 0x646F43726F727265;
  return 0xD000000000000014;
}

uint64_t sub_23A255C40(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x746C75736572 && a2 == 0xE600000000000000;
  if (v3 || (sub_23A27636C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1702125924 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23A27636C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A255D10(char a1)
{
  if ((a1 & 1) != 0)
    return 1702125924;
  else
    return 0x746C75736572;
}

uint64_t sub_23A255D3C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x73756F6976657270 && a2 == 0xEE00746C75736552)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23A27636C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23A255DD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A255DE4(a1, a2, a3, (void (*)(_BYTE *, _QWORD, _QWORD, _QWORD))sub_23A25D898);
}

uint64_t sub_23A255DE4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_BYTE *, _QWORD, _QWORD, _QWORD))
{
  unsigned __int8 *v4;
  _BYTE v8[72];

  sub_23A2763D8();
  a4(v8, *v4, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
  return sub_23A2763FC();
}

uint64_t sub_23A255E34()
{
  char *v0;

  return sub_23A255BD8(*v0);
}

uint64_t sub_23A255E40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A255A3C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A255E6C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A259374();
  *a1 = result;
  return result;
}

uint64_t sub_23A255E94(uint64_t a1)
{
  MEMORY[0x23B846C88](&unk_23A277678, a1);
  return sub_23A27642C();
}

uint64_t sub_23A255EC8(uint64_t a1)
{
  MEMORY[0x23B846C88](&unk_23A277678, a1);
  return sub_23A276438();
}

uint64_t sub_23A255EFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A2565EC(a1, a2, a3, (void (*)(_BYTE *, _QWORD, _QWORD, _QWORD))sub_23A25D888);
}

uint64_t sub_23A255F08()
{
  char *v0;

  return sub_23A255D10(*v0);
}

uint64_t sub_23A255F18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A255C40(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A255F44(uint64_t a1)
{
  MEMORY[0x23B846C88](&unk_23A277628, a1);
  return sub_23A27642C();
}

uint64_t sub_23A255F78(uint64_t a1)
{
  MEMORY[0x23B846C88](&unk_23A277628, a1);
  return sub_23A276438();
}

uint64_t sub_23A255FAC()
{
  return 0;
}

uint64_t sub_23A255FB8@<X0>(uint64_t a1@<X2>, _BYTE *a2@<X8>)
{
  return sub_23A25602C(a1, (uint64_t (*)(_QWORD, _QWORD))sub_23A256104, a2);
}

uint64_t sub_23A255FC4(uint64_t a1)
{
  MEMORY[0x23B846C88](&unk_23A277588, a1);
  return sub_23A27642C();
}

uint64_t sub_23A255FF8(uint64_t a1)
{
  MEMORY[0x23B846C88](&unk_23A277588, a1);
  return sub_23A276438();
}

uint64_t sub_23A25602C@<X0>(uint64_t a1@<X2>, uint64_t (*a2)(_QWORD, _QWORD)@<X4>, _BYTE *a3@<X8>)
{
  char v4;
  uint64_t result;

  v4 = a2(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  result = swift_bridgeObjectRelease();
  *a3 = v4 & 1;
  return result;
}

uint64_t sub_23A256070@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A256104();
  *a1 = result & 1;
  return result;
}

uint64_t sub_23A25609C(uint64_t a1)
{
  MEMORY[0x23B846C88](&unk_23A277538, a1);
  return sub_23A27642C();
}

uint64_t sub_23A2560D0(uint64_t a1)
{
  MEMORY[0x23B846C88](&unk_23A277538, a1);
  return sub_23A276438();
}

uint64_t sub_23A256104()
{
  return 1;
}

uint64_t sub_23A25610C()
{
  sub_23A2763D8();
  sub_23A2763E4();
  return sub_23A2763FC();
}

uint64_t sub_23A25614C()
{
  return sub_23A2763E4();
}

uint64_t sub_23A256170()
{
  sub_23A2763D8();
  sub_23A2763E4();
  return sub_23A2763FC();
}

uint64_t sub_23A2561B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A255D3C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23A2561E0(uint64_t a1)
{
  MEMORY[0x23B846C88](&unk_23A2775D8, a1);
  return sub_23A27642C();
}

uint64_t sub_23A256214(uint64_t a1)
{
  MEMORY[0x23B846C88](&unk_23A2775D8, a1);
  return sub_23A276438();
}

void sub_23A256248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  static AsyncStateValue.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24));
}

uint64_t AsyncState.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;

  v5 = type metadata accessor for AsyncStateValue(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v3, v5);
}

double AsyncState.ttl.getter(uint64_t a1)
{
  uint64_t v1;

  return *(double *)(v1 + *(int *)(a1 + 36));
}

uint64_t AsyncState.init(value:ttl:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v11 = type metadata accessor for AsyncStateValue(0, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a5, a1, v11);
  result = type metadata accessor for AsyncState(0, a2, a3, v12);
  *(double *)(a5 + *(int *)(result + 36)) = a6;
  return result;
}

uint64_t type metadata accessor for AsyncState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncState);
}

uint64_t AsyncState.init(ttl:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;

  v9 = type metadata accessor for AsyncStateValue(0, a1, a2, a3);
  MEMORY[0x24BDAC7A8](v9, v9, v10, v11);
  v13 = (char *)&v16 - v12;
  swift_storeEnumTagMultiPayload();
  return AsyncState.init(value:ttl:)((uint64_t)v13, a1, a2, v14, a4, a5);
}

uint64_t AsyncState.init()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  return AsyncState.init(ttl:)(a1, a2, a3, a4, 1.79769313e308);
}

BOOL static AsyncState.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  char v9;
  uint64_t v10;

  static AsyncStateValue.== infix(_:_:)(a1, a2, a3, a4);
  if ((v9 & 1) == 0)
    return 0;
  v10 = type metadata accessor for AsyncState(0, a3, a4, v8);
  return *(double *)(a1 + *(int *)(v10 + 36)) == *(double *)(a2 + *(int *)(v10 + 36));
}

BOOL sub_23A256428(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_23A256438()
{
  return sub_23A2763E4();
}

uint64_t sub_23A25645C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x65756C6176 && a2 == 0xE500000000000000;
  if (v3 || (sub_23A27636C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7107700 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23A27636C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A25652C()
{
  sub_23A2763D8();
  sub_23A2763E4();
  return sub_23A2763FC();
}

uint64_t sub_23A256570(char a1)
{
  if ((a1 & 1) != 0)
    return 7107700;
  else
    return 0x65756C6176;
}

BOOL sub_23A25659C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23A256428(*a1, *a2);
}

uint64_t sub_23A2565B0()
{
  return sub_23A25652C();
}

uint64_t sub_23A2565D0()
{
  return sub_23A256438();
}

uint64_t sub_23A2565E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A2565EC(a1, a2, a3, (void (*)(_BYTE *, _QWORD, _QWORD, _QWORD))sub_23A256438);
}

uint64_t sub_23A2565EC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_BYTE *, _QWORD, _QWORD, _QWORD))
{
  unsigned __int8 *v4;
  _BYTE v8[72];

  sub_23A2763D8();
  a4(v8, *v4, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
  return sub_23A2763FC();
}

uint64_t sub_23A25663C()
{
  char *v0;

  return sub_23A256570(*v0);
}

uint64_t sub_23A25664C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A25645C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A256678@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A2593A0();
  *a1 = result;
  return result;
}

uint64_t sub_23A2566A0(uint64_t a1)
{
  MEMORY[0x23B846C88](&unk_23A2776C8, a1);
  return sub_23A27642C();
}

uint64_t sub_23A2566D4(uint64_t a1)
{
  MEMORY[0x23B846C88](&unk_23A2776C8, a1);
  return sub_23A276438();
}

BOOL sub_23A256708(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static AsyncState.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24));
}

double AsyncKeyedState.ttl.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

uint64_t AsyncKeyedState.keys.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for AsyncState(0, *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 40), a4);
  v4 = sub_23A275F4C();
  swift_bridgeObjectRetain();
  MEMORY[0x23B846C88](MEMORY[0x24BEE0310], v4);
  return sub_23A276114();
}

double AsyncKeyedState.init()@<D0>(uint64_t a1@<X1>, uint64_t a2@<X3>, _QWORD *a3@<X8>)
{
  double result;
  uint64_t v5;
  _QWORD v6[2];

  AsyncKeyedState.init(ttl:)(a1, a2, (uint64_t)v6, 1.79769313e308);
  result = *(double *)v6;
  v5 = v6[1];
  *a3 = v6[0];
  a3[1] = v5;
  return result;
}

uint64_t AsyncKeyedState.init(ttl:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X3>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t result;

  type metadata accessor for AsyncState(255, a1, a2, a2);
  swift_getTupleTypeMetadata2();
  sub_23A27606C();
  result = sub_23A275F40();
  *(double *)a3 = a4;
  *(_QWORD *)(a3 + 8) = result;
  return result;
}

uint64_t AsyncKeyedState.subscript.getter@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  double *v4;
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
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v8 = a2[3];
  v9 = a2[5];
  v10 = type metadata accessor for AsyncState(255, v8, v9, a3);
  v11 = sub_23A27618C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13, v14, v15);
  v17 = (char *)&v22 - v16;
  v18 = *v4;
  MEMORY[0x23B8463AC](a1, *((_QWORD *)v4 + 1), a2[2], v10, a2[4]);
  v19 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v10) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v19 + 32))(a4, v17, v10);
  AsyncState.init(ttl:)(v8, v9, v20, a4, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v17, v11);
}

void sub_23A256994()
{
  type metadata accessor for AsyncKeyedState();
}

uint64_t sub_23A2569D8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return AsyncKeyedState.subscript.getter(v4, a1, a4, v5);
}

void sub_23A256A00()
{
  type metadata accessor for AsyncKeyedState();
}

uint64_t sub_23A256A38(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return sub_23A2593AC(v5, v4, a1, a4);
}

uint64_t AsyncKeyedState.subscript.setter(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;

  sub_23A2593AC(a1, a2, a3, a4);
  (*(void (**)(uint64_t))(*(_QWORD *)(a3[2] - 8) + 8))(a2);
  v8 = type metadata accessor for AsyncState(0, a3[3], a3[5], v7);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
}

void (*AsyncKeyedState.subscript.modify(_QWORD *a1, uint64_t a2, _QWORD *a3))(_QWORD ***a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = malloc(0x48uLL);
  *a1 = v7;
  *v7 = a3;
  v7[1] = v3;
  v9 = type metadata accessor for AsyncState(0, a3[3], a3[5], v8);
  v7[2] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v7[3] = v10;
  v11 = *(_QWORD *)(v10 + 64);
  v7[4] = malloc(v11);
  v12 = malloc(v11);
  v13 = a3[2];
  v7[5] = v12;
  v7[6] = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v7[7] = v14;
  v7[8] = malloc(*(_QWORD *)(v14 + 64));
  (*(void (**)(void))(v14 + 16))();
  AsyncKeyedState.subscript.getter(a2, a3, v15, (uint64_t)v12);
  return sub_23A256BAC;
}

void sub_23A256BAC(_QWORD ***a1, char a2, uint64_t a3, uint64_t a4)
{
  _QWORD **v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  void (*v14)(_QWORD *, _QWORD *);

  v4 = *a1;
  v6 = (*a1)[7];
  v5 = (*a1)[8];
  v7 = (*a1)[5];
  v8 = (*a1)[6];
  v10 = (*a1)[3];
  v9 = (*a1)[4];
  v11 = (*a1)[2];
  v12 = **a1;
  if ((a2 & 1) != 0)
  {
    ((void (*)(_QWORD *, _QWORD *, _QWORD *))v10[2])((*a1)[4], v7, v11);
    sub_23A2593AC((uint64_t)v9, (uint64_t)v5, v12, v13);
    ((void (*)(_QWORD *, _QWORD *))v6[1])(v5, v8);
    v14 = (void (*)(_QWORD *, _QWORD *))v10[1];
    v14(v9, v11);
  }
  else
  {
    sub_23A2593AC((uint64_t)(*a1)[5], (uint64_t)v5, v12, a4);
    ((void (*)(_QWORD *, _QWORD *))v6[1])(v5, v8);
    v14 = (void (*)(_QWORD *, _QWORD *))v10[1];
  }
  v14(v7, v11);
  free(v5);
  free(v7);
  free(v9);
  free(v4);
}

uint64_t static AsyncKeyedState.== infix(_:_:)(double *a1, double *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  if (*a1 != *a2)
    return 0;
  v6 = type metadata accessor for AsyncState(0, a4, a6, a4);
  MEMORY[0x23B846C88](&protocol conformance descriptor for AsyncState<A>, v6);
  return sub_23A275F7C();
}

uint64_t sub_23A256D30(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 7107700 && a2 == 0xE300000000000000;
  if (v3 || (sub_23A27636C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656761726F7473 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23A27636C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A256E08(char a1)
{
  if ((a1 & 1) != 0)
    return 0x656761726F7473;
  else
    return 7107700;
}

BOOL sub_23A256E38(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23A256428(*a1, *a2);
}

uint64_t sub_23A256E50()
{
  return sub_23A25652C();
}

uint64_t sub_23A256E64()
{
  return sub_23A256438();
}

uint64_t sub_23A256E78()
{
  sub_23A2763D8();
  sub_23A256438();
  return sub_23A2763FC();
}

uint64_t sub_23A256EC0()
{
  char *v0;

  return sub_23A256E08(*v0);
}

uint64_t sub_23A256ED4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A256D30(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A256F04@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A2593A0();
  *a1 = result;
  return result;
}

uint64_t sub_23A256F34(uint64_t a1)
{
  MEMORY[0x23B846C88](&unk_23A277718, a1);
  return sub_23A27642C();
}

uint64_t sub_23A256F68(uint64_t a1)
{
  MEMORY[0x23B846C88](&unk_23A277718, a1);
  return sub_23A276438();
}

uint64_t sub_23A256F9C(double *a1, double *a2, uint64_t *a3)
{
  return static AsyncKeyedState.== infix(_:_:)(a1, a2, a3[2], a3[3], a3[4], a3[5]);
}

void AsyncKeyedState<>.encode(to:)()
{
  type metadata accessor for AsyncKeyedState.CodingKeys();
}

uint64_t sub_23A257000(uint64_t a1)
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  MEMORY[0x23B846C88](&unk_23A277718, a1);
  v4 = sub_23A276354();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6, v7, v8);
  v10 = (char *)&v19 - v9;
  *(_QWORD *)(v3 - 224) = *(_QWORD *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_23A276414();
  *(_BYTE *)(v3 - 112) = 0;
  v11 = *(_QWORD *)(v3 - 160);
  sub_23A276330();
  if (!v11)
  {
    v13 = *(_QWORD *)(v3 - 216);
    *(_QWORD *)(v3 - 112) = *(_QWORD *)(v3 - 224);
    *(_BYTE *)(v3 - 113) = 1;
    v14 = type metadata accessor for AsyncState(255, *(_QWORD *)(v3 - 208), v13, v12);
    v15 = sub_23A275F64();
    v16 = *(_QWORD *)(v3 - 176);
    *(_QWORD *)(v3 - 136) = *(_QWORD *)(v3 - 184);
    *(_QWORD *)(v3 - 128) = v16;
    v17 = MEMORY[0x23B846C88](&protocol conformance descriptor for <> AsyncState<A>, v14, v3 - 136);
    *(_QWORD *)(v3 - 152) = *(_QWORD *)(v3 - 168);
    *(_QWORD *)(v3 - 144) = v17;
    MEMORY[0x23B846C88](MEMORY[0x24BEE04C0], v15, v3 - 152);
    sub_23A276348();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

void AsyncKeyedState<>.init(from:)()
{
  type metadata accessor for AsyncKeyedState.CodingKeys();
}

uint64_t sub_23A2571D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;

  MEMORY[0x23B846C88](&unk_23A277718, a1);
  v5 = sub_23A27630C();
  *(_QWORD *)(v4 - 160) = v5;
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7, v8, v9);
  v11 = (char *)&v26 - v10;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_23A276408();
  if (v2)
  {
    v25 = (uint64_t)v3;
  }
  else
  {
    v12 = *(_QWORD *)(v4 - 192);
    *(_QWORD *)(v4 - 232) = v3;
    *(_QWORD *)(v4 - 224) = v6;
    v13 = *(_QWORD *)(v4 - 168);
    *(_BYTE *)(v4 - 112) = 0;
    v14 = *(_QWORD *)(v4 - 160);
    sub_23A2762DC();
    v16 = v15;
    v18 = type metadata accessor for AsyncState(255, v12, v1, v17);
    v19 = sub_23A275F64();
    *(_BYTE *)(v4 - 113) = 1;
    v20 = *(_QWORD *)(v4 - 208);
    *(_QWORD *)(v4 - 136) = v13;
    *(_QWORD *)(v4 - 128) = v20;
    v21 = MEMORY[0x23B846C88](&protocol conformance descriptor for <> AsyncState<A>, v18, v4 - 136);
    *(_QWORD *)(v4 - 152) = *(_QWORD *)(v4 - 200);
    *(_QWORD *)(v4 - 144) = v21;
    MEMORY[0x23B846C88](MEMORY[0x24BEE04E0], v19, v4 - 152);
    sub_23A2762F4();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 224) + 8))(v11, v14);
    v23 = *(_QWORD *)(v4 - 112);
    v24 = *(_QWORD **)(v4 - 216);
    *v24 = v16;
    v24[1] = v23;
    v25 = *(_QWORD *)(v4 - 232);
  }
  return __swift_destroy_boxed_opaque_existential_1(v25);
}

void sub_23A2573B4()
{
  AsyncKeyedState<>.init(from:)();
}

void sub_23A2573E8()
{
  AsyncKeyedState<>.encode(to:)();
}

uint64_t AsyncState<>.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];
  char v25;

  v22 = a4;
  v19 = a2;
  v21 = a3;
  v6 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v7 = type metadata accessor for AsyncState.CodingKeys(255, v6, v5, a4);
  MEMORY[0x23B846C88](&unk_23A2776C8, v7);
  v8 = sub_23A276354();
  v20 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v9, v10, v11);
  v13 = (char *)&v19 - v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A276414();
  v25 = 0;
  v15 = type metadata accessor for AsyncStateValue(0, v6, v5, v14);
  v24[0] = v21;
  v24[1] = v22;
  MEMORY[0x23B846C88](&protocol conformance descriptor for <> AsyncStateValue<A>, v15, v24);
  v16 = v23;
  sub_23A276348();
  if (v16)
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v13, v8);
  v18 = v20;
  v25 = 1;
  sub_23A276330();
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v13, v8);
}

uint64_t AsyncState<>.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
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
  uint64_t v19;
  char *v20;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  _QWORD v49[2];
  char v50;

  v41 = a3;
  v42 = a4;
  v38 = a6;
  v46 = type metadata accessor for AsyncStateValue(0, a2, a5, a4);
  v40 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46, v9, v10, v11);
  v43 = (char *)&v38 - v12;
  v14 = type metadata accessor for AsyncState.CodingKeys(255, a2, a5, v13);
  MEMORY[0x23B846C88](&unk_23A2776C8, v14);
  v15 = sub_23A27630C();
  v44 = *(_QWORD *)(v15 - 8);
  v45 = v15;
  MEMORY[0x24BDAC7A8](v15, v16, v17, v18);
  v20 = (char *)&v38 - v19;
  v39 = type metadata accessor for AsyncState(0, a2, a5, v21);
  v22 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39, v23, v24, v25);
  v27 = (char *)&v38 - v26;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v47 = v20;
  v28 = v48;
  sub_23A276408();
  if (v28)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v48 = v22;
  v29 = v39;
  v30 = v40;
  v50 = 0;
  v49[0] = v41;
  v49[1] = v42;
  v31 = v46;
  MEMORY[0x23B846C88](&protocol conformance descriptor for <> AsyncStateValue<A>, v46, v49);
  v32 = v43;
  v33 = v45;
  sub_23A2762F4();
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v27, v32, v31);
  v50 = 1;
  sub_23A2762DC();
  v35 = v34;
  (*(void (**)(char *, uint64_t))(v44 + 8))(v47, v33);
  *(_QWORD *)&v27[*(int *)(v29 + 36)] = v35;
  v36 = v48;
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 16))(v38, v27, v29);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v27, v29);
}

uint64_t sub_23A257860@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return AsyncState<>.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a3 - 8), *(_QWORD *)(a3 - 16), *(_QWORD *)(a2 + 24), a4);
}

uint64_t sub_23A257884(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return AsyncState<>.encode(to:)(a1, a2, *(_QWORD *)(a3 - 8), *(_QWORD *)(a3 - 16));
}

void AsyncStateValue<>.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  _QWORD v68[6];
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;

  v92 = a4;
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = type metadata accessor for AsyncStateValue.FailedCodingKeys(255, v6, v7, a4);
  v83 = MEMORY[0x23B846C88](&unk_23A277678, v8);
  v84 = v8;
  v89 = sub_23A276354();
  v68[3] = *(_QWORD *)(v89 - 8);
  MEMORY[0x24BDAC7A8](v89, v9, v10, v11);
  v88 = (char *)v68 - v12;
  v14 = type metadata accessor for AsyncStateValue.FetchedCodingKeys(255, v6, v7, v13);
  v81 = MEMORY[0x23B846C88](&unk_23A277628, v14);
  v82 = v14;
  v87 = sub_23A276354();
  v68[2] = *(_QWORD *)(v87 - 8);
  MEMORY[0x24BDAC7A8](v87, v15, v16, v17);
  v85 = (char *)v68 - v18;
  v91 = sub_23A275E14();
  v86 = *(_QWORD *)(v91 - 8);
  MEMORY[0x24BDAC7A8](v91, v19, v20, v21);
  v93 = (char *)v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for AsyncStateValue.RefreshingCodingKeys(255, v6, v7, v23);
  v25 = MEMORY[0x23B846C88](&unk_23A2775D8, v24);
  v79 = v24;
  v77 = v25;
  v80 = sub_23A276354();
  v68[1] = *(_QWORD *)(v80 - 8);
  v29 = MEMORY[0x24BDAC7A8](v80, v26, v27, v28);
  v78 = (char *)v68 - v30;
  v95 = *(_QWORD *)(v6 - 8);
  v34 = MEMORY[0x24BDAC7A8](v29, v31, v32, v33);
  v90 = (char *)v68 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v34, v36, v37, v38);
  v76 = (char *)v68 - v39;
  v41 = type metadata accessor for AsyncStateValue.FetchingCodingKeys(255, v6, v7, v40);
  v42 = MEMORY[0x23B846C88](&unk_23A277588, v41);
  v75 = v41;
  v74 = v42;
  v73 = sub_23A276354();
  v72 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73, v43, v44, v45);
  v71 = (char *)v68 - v46;
  v48 = type metadata accessor for AsyncStateValue.NoneCodingKeys(255, v6, v7, v47);
  v70 = MEMORY[0x23B846C88](&unk_23A277538, v48);
  v69 = sub_23A276354();
  v68[5] = *(_QWORD *)(v69 - 8);
  v52 = MEMORY[0x24BDAC7A8](v69, v49, v50, v51);
  v68[4] = (char *)v68 - v53;
  v54 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v52, v55, v56, v57);
  v59 = (char *)v68 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = v6;
  v61 = type metadata accessor for AsyncStateValue.CodingKeys(255, v6, v7, v60);
  MEMORY[0x23B846C88](&unk_23A2774E8, v61);
  v98 = sub_23A276354();
  v96 = *(_QWORD *)(v98 - 8);
  MEMORY[0x24BDAC7A8](v98, v62, v63, v64);
  v66 = (char *)v68 - v65;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v97 = v66;
  sub_23A276414();
  (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v59, v99, a2);
  v67 = (char *)sub_23A257CE0 + 4 * byte_23A276A6A[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A257CE0()
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

  v2 = *(_QWORD *)(v1 - 152);
  v3 = *(_QWORD *)(v1 - 144);
  v4 = *(_QWORD *)(v1 - 296);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v4, v0, v2);
  *(_BYTE *)(v1 - 72) = 2;
  v5 = *(_QWORD *)(v1 - 280);
  v7 = *(_QWORD *)(v1 - 128);
  v6 = *(_QWORD *)(v1 - 120);
  sub_23A276318();
  v8 = *(_QWORD *)(v1 - 264);
  sub_23A276348();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 392) + 8))(v5, v8);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 136) + 8))(v7, v6);
}

uint64_t AsyncStateValue<>.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
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
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  _QWORD *v75;
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
  uint64_t *v86;
  uint64_t *v87;
  uint64_t v88;
  __int128 v90;
  char *v91;
  char *v92;
  char *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  char *v104;
  char *v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  _QWORD *v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  uint64_t v133;

  v120 = a3;
  v108 = a6;
  v9 = type metadata accessor for AsyncStateValue.FailedCodingKeys(255, a2, a5, a4);
  v118 = MEMORY[0x23B846C88](&unk_23A277678, v9);
  v119 = v9;
  v10 = sub_23A27630C();
  v11 = *(_QWORD *)(v10 - 8);
  v121 = v10;
  v122 = v11;
  MEMORY[0x24BDAC7A8](v10, v12, v13, v14);
  v107 = (char *)&v90 - v15;
  v17 = type metadata accessor for AsyncStateValue.FetchedCodingKeys(255, a2, a5, v16);
  v18 = MEMORY[0x23B846C88](&unk_23A277628, v17);
  v117 = v17;
  v116 = v18;
  v101 = sub_23A27630C();
  v96 = *(_QWORD *)(v101 - 8);
  MEMORY[0x24BDAC7A8](v101, v19, v20, v21);
  v106 = (char *)&v90 - v22;
  v24 = type metadata accessor for AsyncStateValue.RefreshingCodingKeys(255, a2, a5, v23);
  v25 = MEMORY[0x23B846C88](&unk_23A2775D8, v24);
  v115 = v24;
  v114 = v25;
  v100 = sub_23A27630C();
  v95 = *(_QWORD *)(v100 - 8);
  MEMORY[0x24BDAC7A8](v100, v26, v27, v28);
  v105 = (char *)&v90 - v29;
  v31 = type metadata accessor for AsyncStateValue.FetchingCodingKeys(255, a2, a5, v30);
  v32 = MEMORY[0x23B846C88](&unk_23A277588, v31);
  v113 = v31;
  v111 = v32;
  v112 = sub_23A27630C();
  v99 = *(_QWORD *)(v112 - 8);
  MEMORY[0x24BDAC7A8](v112, v33, v34, v35);
  v104 = (char *)&v90 - v36;
  v38 = type metadata accessor for AsyncStateValue.NoneCodingKeys(255, a2, a5, v37);
  v39 = MEMORY[0x23B846C88](&unk_23A277538, v38);
  v110 = v38;
  v109 = v39;
  v98 = sub_23A27630C();
  v97 = *(_QWORD *)(v98 - 8);
  MEMORY[0x24BDAC7A8](v98, v40, v41, v42);
  v103 = (char *)&v90 - v43;
  v45 = type metadata accessor for AsyncStateValue.CodingKeys(255, a2, a5, v44);
  MEMORY[0x23B846C88](&unk_23A2774E8, v45);
  v127 = sub_23A27630C();
  v124 = *(_QWORD *)(v127 - 8);
  MEMORY[0x24BDAC7A8](v127, v46, v47, v48);
  v50 = (char *)&v90 - v49;
  v126 = a2;
  v123 = type metadata accessor for AsyncStateValue(0, a2, a5, v51);
  v102 = *(_QWORD *)(v123 - 8);
  v55 = MEMORY[0x24BDAC7A8](v123, v52, v53, v54);
  v57 = (char *)&v90 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = MEMORY[0x24BDAC7A8](v55, v58, v59, v60);
  v63 = (char *)&v90 - v62;
  v67 = MEMORY[0x24BDAC7A8](v61, v64, v65, v66);
  v69 = (char *)&v90 - v68;
  MEMORY[0x24BDAC7A8](v67, v70, v71, v72);
  v74 = (char *)&v90 - v73;
  v75 = a1;
  v76 = a1[3];
  v128 = v75;
  __swift_project_boxed_opaque_existential_1(v75, v76);
  v125 = v50;
  v77 = v133;
  sub_23A276408();
  if (!v77)
  {
    v92 = v69;
    v91 = v57;
    v93 = v63;
    v94 = v74;
    v133 = 0;
    v78 = v125;
    *(_QWORD *)&v129 = sub_23A276300();
    v79 = sub_23A276084();
    MEMORY[0x23B846C88](MEMORY[0x24BEE12C8], v79);
    *(_QWORD *)&v131 = sub_23A2761BC();
    *((_QWORD *)&v131 + 1) = v80;
    *(_QWORD *)&v132 = v81;
    *((_QWORD *)&v132 + 1) = v82;
    v83 = sub_23A2761B0();
    MEMORY[0x23B846C88](MEMORY[0x24BEE2190], v83);
    sub_23A276120();
    v84 = v129;
    if (v129 != 5)
    {
      v90 = v131;
      v129 = v131;
      v130 = v132;
      if ((sub_23A27612C() & 1) != 0)
        __asm { BR              X9 }
    }
    v85 = sub_23A276228();
    swift_allocError();
    v87 = v86;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256956CE0);
    *v87 = v123;
    v88 = v127;
    sub_23A2762C4();
    sub_23A27621C();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v85 - 8) + 104))(v87, *MEMORY[0x24BEE26D0], v85);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v124 + 8))(v78, v88);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v128);
}

void sub_23A2587FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v2 - 160) = 1;
  v3 = *(_QWORD *)(v2 - 360);
  v4 = *(_QWORD *)(v2 - 176);
  v5 = *(_QWORD *)(v2 - 72);
  sub_23A2762B8();
  if (v5)
    JUMPOUT(0x23A258844);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 400) + 8))(v3, v0);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 200) + 8))(v1, v4);
  swift_storeEnumTagMultiPayload();
  JUMPOUT(0x23A258A24);
}

void sub_23A258868()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v1 - 160) = 2;
  v2 = *(_QWORD *)(v1 - 352);
  v3 = *(_QWORD *)(v1 - 176);
  v4 = *(_QWORD *)(v1 - 72);
  sub_23A2762B8();
  if (!v4)
  {
    v5 = *(_QWORD *)(v1 - 456);
    v6 = *(_QWORD *)(v1 - 392);
    sub_23A2762F4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 432) + 8))(v2, v6);
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 200) + 8))(v0, v3);
    v7 = *(_QWORD *)(v1 - 208);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v1 - 376) + 32))(*(_QWORD *)(v1 - 440), v5, v7);
    JUMPOUT(0x23A258C98);
  }
  swift_unknownObjectRelease();
  JUMPOUT(0x23A2587CCLL);
}

void sub_23A258974()
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
  void (*v18)(uint64_t, uint64_t);
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  *(_BYTE *)(v2 - 160) = 4;
  v3 = *(_QWORD *)(v2 - 336);
  v4 = v0;
  v5 = *(_QWORD *)(v2 - 176);
  v6 = *(_QWORD *)(v2 - 72);
  sub_23A2762B8();
  if (v6)
  {
    swift_unknownObjectRelease();
    JUMPOUT(0x23A2587CCLL);
  }
  v7 = v4;
  *(_BYTE *)(v2 - 160) = 0;
  v8 = v3;
  v9 = sub_23A2762D0();
  v10 = *(_QWORD *)(v2 - 200);
  v11 = v9;
  v13 = v12;
  *(_BYTE *)(v2 - 160) = 1;
  v14 = sub_23A2762E8();
  *(_BYTE *)(v2 - 160) = 2;
  v15 = sub_23A2762D0();
  *(_QWORD *)(v2 - 72) = 0;
  v17 = v16;
  v18 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 216) + 8);
  *(_QWORD *)(v2 - 184) = v15;
  v18(v8, v1);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v7, v5);
  v19 = *(uint64_t **)(v2 - 464);
  *v19 = v11;
  v19[1] = v13;
  v20 = *(_QWORD *)(v2 - 184);
  v19[2] = v14;
  v19[3] = v20;
  v19[4] = v17;
  v21 = *(_QWORD *)(v2 - 208);
  swift_storeEnumTagMultiPayload();
  v22 = *(_QWORD *)(v2 - 376);
  v23 = *(_QWORD *)(v2 - 440);
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(v22 + 32))(v23, v19, v21);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v22 + 32))(*(_QWORD *)(v2 - 328), v23, v21);
  JUMPOUT(0x23A2587D4);
}

uint64_t sub_23A258DB0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return AsyncStateValue<>.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a3 - 8), a4, *(_QWORD *)(a2 + 24), a5);
}

void sub_23A258DD0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  AsyncStateValue<>.encode(to:)(a1, a2, a3, *(_QWORD *)(a3 - 16));
}

uint64_t AsyncKeyedState<>.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  sub_23A2763F0();
  v6 = type metadata accessor for AsyncState(0, *(_QWORD *)(a2 + 24), *(_QWORD *)(a3 + 8), v5);
  v8 = a3;
  swift_bridgeObjectRetain();
  MEMORY[0x23B846C88](&protocol conformance descriptor for <> AsyncState<A>, v6, &v8);
  sub_23A275F70();
  return swift_bridgeObjectRelease();
}

uint64_t AsyncKeyedState<>.hashValue.getter(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  _BYTE v7[72];
  uint64_t v8;
  uint64_t v9;

  v5 = v2[1];
  v8 = *v2;
  v9 = v5;
  sub_23A2763D8();
  AsyncKeyedState<>.hash(into:)((uint64_t)v7, a1, a2);
  return sub_23A2763FC();
}

uint64_t sub_23A258EFC(uint64_t a1, uint64_t a2)
{
  return AsyncKeyedState<>.hashValue.getter(a1, *(_QWORD *)(a2 - 8));
}

uint64_t sub_23A258F04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return AsyncKeyedState<>.hash(into:)(a1, a2, *(_QWORD *)(a3 - 8));
}

uint64_t sub_23A258F0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE v6[72];

  v4 = *(_QWORD *)(a3 - 8);
  sub_23A2763D8();
  AsyncKeyedState<>.hash(into:)((uint64_t)v6, a2, v4);
  return sub_23A2763FC();
}

uint64_t AsyncState<>.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;

  v6 = type metadata accessor for AsyncStateValue(0, *(_QWORD *)(a2 + 16), *(_QWORD *)(a3 + 8), a4);
  AsyncStateValue<>.hash(into:)(a1, v6, a3);
  return sub_23A2763F0();
}

uint64_t AsyncState<>.hashValue.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _BYTE v6[72];

  sub_23A2763D8();
  AsyncState<>.hash(into:)((uint64_t)v6, a1, a2, v4);
  return sub_23A2763FC();
}

uint64_t sub_23A259014(uint64_t a1, uint64_t a2)
{
  return AsyncState<>.hashValue.getter(a1, *(_QWORD *)(a2 - 8));
}

uint64_t sub_23A25901C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return AsyncState<>.hash(into:)(a1, a2, *(_QWORD *)(a3 - 8), a4);
}

uint64_t sub_23A259024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A259318(a1, a2, a3, (void (*)(_BYTE *, uint64_t, uint64_t))AsyncState<>.hash(into:));
}

void AsyncStateValue<>.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
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
  char *v19;
  _QWORD v20[2];

  v20[1] = a3;
  v5 = sub_23A275E14();
  v9 = MEMORY[0x24BDAC7A8](v5, v6, v7, v8);
  v13 = MEMORY[0x24BDAC7A8](v9, v10, v11, v12);
  MEMORY[0x24BDAC7A8](v13, v14, v15, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))((char *)v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a2);
  v19 = (char *)sub_23A259130 + 4 * byte_23A276A74[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A259130()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v0, v1);
  sub_23A2763E4();
  sub_23A275FA0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v1);
}

uint64_t AsyncStateValue<>.hashValue.getter(uint64_t a1, uint64_t a2)
{
  _BYTE v5[72];

  sub_23A2763D8();
  AsyncStateValue<>.hash(into:)((uint64_t)v5, a1, a2);
  return sub_23A2763FC();
}

uint64_t sub_23A2592FC(uint64_t a1, uint64_t a2)
{
  return AsyncStateValue<>.hashValue.getter(a1, *(_QWORD *)(a2 - 8));
}

void sub_23A259304(uint64_t a1, uint64_t a2, uint64_t a3)
{
  AsyncStateValue<>.hash(into:)(a1, a2, *(_QWORD *)(a3 - 8));
}

uint64_t sub_23A25930C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A259318(a1, a2, a3, (void (*)(_BYTE *, uint64_t, uint64_t))AsyncStateValue<>.hash(into:));
}

uint64_t sub_23A259318(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_BYTE *, uint64_t, uint64_t))
{
  uint64_t v6;
  _BYTE v8[72];

  v6 = *(_QWORD *)(a3 - 8);
  sub_23A2763D8();
  a4(v8, a2, v6);
  return sub_23A2763FC();
}

uint64_t sub_23A25936C()
{
  return 5;
}

uint64_t sub_23A259374()
{
  return 3;
}

uint64_t sub_23A25937C()
{
  return 0x73756F6976657270;
}

uint64_t sub_23A2593A0()
{
  return 2;
}

uint64_t sub_23A2593AC(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v7 = type metadata accessor for AsyncState(255, a3[3], a3[5], a4);
  v8 = sub_23A27618C();
  v12 = MEMORY[0x24BDAC7A8](v8, v9, v10, v11);
  v14 = (char *)&v23 - v13;
  v15 = a3[2];
  MEMORY[0x24BDAC7A8](v12, v16, v17, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))((char *)&v23 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v15);
  v21 = *(_QWORD *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v14, a1, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v14, 0, 1, v7);
  sub_23A275F64();
  return sub_23A275F94();
}

void type metadata accessor for AsyncKeyedState.CodingKeys()
{
  JUMPOUT(0x23B846C04);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t type metadata accessor for AsyncState.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncState.CodingKeys);
}

uint64_t type metadata accessor for AsyncStateValue.FailedCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncStateValue.FailedCodingKeys);
}

uint64_t type metadata accessor for AsyncStateValue.FetchedCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncStateValue.FetchedCodingKeys);
}

uint64_t type metadata accessor for AsyncStateValue.RefreshingCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncStateValue.RefreshingCodingKeys);
}

uint64_t type metadata accessor for AsyncStateValue.FetchingCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncStateValue.FetchingCodingKeys);
}

uint64_t type metadata accessor for AsyncStateValue.NoneCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncStateValue.NoneCodingKeys);
}

uint64_t type metadata accessor for AsyncStateValue.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncStateValue.CodingKeys);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B846C70]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A2595B4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23A275E14();
    result = MEMORY[0x23B846C88](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_23A2595F4()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A259604()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A259614()
{
  JUMPOUT(0x23B846C88);
}

uint64_t sub_23A259624()
{
  return 32;
}

__n128 sub_23A259630(uint64_t a1, _OWORD *a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t sub_23A25963C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23A259644()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  char v3;
  uint64_t v4;
  char *v5;
  const char *v6;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    result = sub_23A275E14();
    if (v2 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      v5 = &v3;
      v6 = "(";
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t sub_23A2596E8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  unsigned int v17;
  uint64_t v20;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  int v28;
  unsigned int v29;
  unsigned int v30;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = sub_23A275E14();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_DWORD *)(v9 + 80);
  v11 = v7 + v10;
  v12 = ((v7 + v10) & ~v10) + *(_QWORD *)(v9 + 64);
  if (v12 <= v7)
    v12 = v7;
  if (v12 <= 0x28)
    v13 = 40;
  else
    v13 = v12;
  if (v13 > 3)
    goto LABEL_10;
  v14 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  v15 = 2;
  if (v14 > 0xFFFC)
    v15 = 4;
  if (v14 <= 0xFC)
LABEL_10:
    v15 = 1;
  v16 = v15 + v13;
  v17 = *(_DWORD *)(v6 + 80) & 0xF8 | v10;
  if (v17 > 7 || v16 > 0x18 || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) != 0)
  {
    v20 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v20 + (((v17 | 7) + 16) & ~(unint64_t)(v17 | 7));
    swift_retain();
    return a1;
  }
  if (v13 > 3)
    goto LABEL_23;
  v22 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  if (v22 <= 0xFFFC)
  {
    if (v22 > 0xFC)
    {
      v23 = *(unsigned __int16 *)((char *)a2 + v13);
      if (v23 < 3)
        goto LABEL_32;
      goto LABEL_28;
    }
LABEL_23:
    v23 = *((unsigned __int8 *)a2 + v13);
    if (v23 < 3)
      goto LABEL_32;
LABEL_28:
    if (v13 <= 3)
      v24 = v13;
    else
      v24 = 4;
    __asm { BR              X13 }
  }
  v23 = *(_DWORD *)((char *)a2 + v13);
  if (v23 >= 3)
    goto LABEL_28;
LABEL_32:
  if (v23 == 2)
  {
    v25 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v25;
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    *(_QWORD *)(a1 + 32) = a2[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13 <= 3)
    {
      v26 = ((1 << (8 * v13)) + 1) >> (8 * v13);
      if (v26 > 0xFFFC)
      {
        v28 = 2;
        goto LABEL_48;
      }
      if (v26 > 0xFC)
      {
        LOWORD(v28) = 2;
        goto LABEL_51;
      }
    }
    *(_BYTE *)(a1 + v13) = 2;
    return a1;
  }
  if (v23 == 1)
  {
    v27 = ~v10;
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v9 + 16))((v11 + a1) & v27, ((unint64_t)a2 + v11) & v27, v8);
    if (v13 > 3)
    {
LABEL_43:
      *(_BYTE *)(a1 + v13) = 1;
      return a1;
    }
    v28 = 1;
    v29 = ((1 << (8 * v13)) + 1) >> (8 * v13);
    if (v29 <= 0xFFFC)
    {
      if (v29 <= 0xFC)
        goto LABEL_43;
LABEL_51:
      *(_WORD *)(a1 + v13) = v28;
      return a1;
    }
LABEL_48:
    *(_DWORD *)(a1 + v13) = v28;
    return a1;
  }
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
  if (v13 > 3)
    goto LABEL_35;
  v30 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  if (v30 > 0xFFFC)
  {
    *(_DWORD *)(a1 + v13) = 0;
    return a1;
  }
  if (v30 <= 0xFC)
LABEL_35:
    *(_BYTE *)(a1 + v13) = 0;
  else
    *(_WORD *)(a1 + v13) = 0;
  return a1;
}

uint64_t sub_23A259A74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  unsigned int v21;
  unsigned int v22;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = sub_23A275E14();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = v7 + v10;
  v12 = ((v7 + v10) & ~v10) + *(_QWORD *)(v9 + 64);
  if (v12 <= v7)
    v12 = v7;
  if (v12 <= 0x28)
    v13 = 40;
  else
    v13 = v12;
  if (v13 > 3)
    goto LABEL_9;
  v14 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  if (v14 <= 0xFFFC)
  {
    if (v14 > 0xFC)
    {
      v15 = *(unsigned __int16 *)(a2 + v13);
      if (v15 < 3)
        goto LABEL_18;
      goto LABEL_14;
    }
LABEL_9:
    v15 = *(unsigned __int8 *)(a2 + v13);
    if (v15 < 3)
      goto LABEL_18;
LABEL_14:
    if (v13 <= 3)
      v16 = v13;
    else
      v16 = 4;
    __asm { BR              X13 }
  }
  v15 = *(_DWORD *)(a2 + v13);
  if (v15 >= 3)
    goto LABEL_14;
LABEL_18:
  if (v15 == 2)
  {
    v17 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v17;
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13 <= 3)
    {
      v18 = ((1 << (8 * v13)) + 1) >> (8 * v13);
      if (v18 > 0xFFFC)
      {
        v20 = 2;
        goto LABEL_34;
      }
      if (v18 > 0xFC)
      {
        LOWORD(v20) = 2;
        goto LABEL_37;
      }
    }
    *(_BYTE *)(a1 + v13) = 2;
    return a1;
  }
  if (v15 == 1)
  {
    v19 = ~v10;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))((v11 + a1) & v19, (v11 + a2) & v19, v8);
    if (v13 > 3)
    {
LABEL_29:
      *(_BYTE *)(a1 + v13) = 1;
      return a1;
    }
    v20 = 1;
    v21 = ((1 << (8 * v13)) + 1) >> (8 * v13);
    if (v21 <= 0xFFFC)
    {
      if (v21 <= 0xFC)
        goto LABEL_29;
LABEL_37:
      *(_WORD *)(a1 + v13) = v20;
      return a1;
    }
LABEL_34:
    *(_DWORD *)(a1 + v13) = v20;
    return a1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, a2, v5);
  if (v13 > 3)
    goto LABEL_21;
  v22 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  if (v22 > 0xFFFC)
  {
    *(_DWORD *)(a1 + v13) = 0;
    return a1;
  }
  if (v22 <= 0xFC)
LABEL_21:
    *(_BYTE *)(a1 + v13) = 0;
  else
    *(_WORD *)(a1 + v13) = 0;
  return a1;
}

_QWORD *sub_23A259D60(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  unsigned int v25;

  if (a1 == a2)
    return a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = sub_23A275E14();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = v7 + v10;
  v12 = ((v7 + v10) & ~v10) + *(_QWORD *)(v9 + 64);
  if (v12 <= v7)
    v12 = v7;
  if (v12 <= 0x28)
    v13 = 40;
  else
    v13 = v12;
  v14 = 8 * v13;
  if (v13 > 3)
    goto LABEL_10;
  v15 = ((1 << v14) + 1) >> v14;
  if (v15 <= 0xFFFC)
  {
    if (v15 > 0xFC)
    {
      v16 = *(unsigned __int16 *)((char *)a1 + v13);
      if (v16 < 3)
        goto LABEL_19;
      goto LABEL_15;
    }
LABEL_10:
    v16 = *((unsigned __int8 *)a1 + v13);
    if (v16 < 3)
      goto LABEL_19;
LABEL_15:
    if (v13 <= 3)
      v17 = v13;
    else
      v17 = 4;
    __asm { BR              X13 }
  }
  v16 = *(_DWORD *)((char *)a1 + v13);
  if (v16 >= 3)
    goto LABEL_15;
LABEL_19:
  v18 = ~v10;
  if (v16 == 2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v13 > 3)
      goto LABEL_28;
  }
  else
  {
    if (v16 == 1)
    {
      (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(a1, v5);
      (*(void (**)(unint64_t, uint64_t))(v9 + 8))(((unint64_t)a1 + v11) & v18, v8);
    }
    else
    {
      (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(a1, v5);
    }
    if (v13 > 3)
      goto LABEL_28;
  }
  v19 = ((1 << v14) + 1) >> v14;
  if (v19 <= 0xFFFC)
  {
    if (v19 > 0xFC)
    {
      v20 = *(unsigned __int16 *)((char *)a2 + v13);
      if (v20 < 3)
        goto LABEL_37;
      goto LABEL_33;
    }
LABEL_28:
    v20 = *((unsigned __int8 *)a2 + v13);
    if (v20 < 3)
      goto LABEL_37;
LABEL_33:
    if (v13 <= 3)
      v21 = v13;
    else
      v21 = 4;
    __asm { BR              X12 }
  }
  v20 = *(_DWORD *)((char *)a2 + v13);
  if (v20 >= 3)
    goto LABEL_33;
LABEL_37:
  if (v20 == 2)
  {
    *a1 = *a2;
    a1[1] = a2[1];
    a1[2] = a2[2];
    a1[3] = a2[3];
    a1[4] = a2[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13 <= 3)
    {
      v22 = ((1 << v14) + 1) >> v14;
      if (v22 > 0xFFFC)
      {
        v23 = 2;
        goto LABEL_53;
      }
      if (v22 > 0xFC)
      {
        LOWORD(v23) = 2;
        goto LABEL_56;
      }
    }
    *((_BYTE *)a1 + v13) = 2;
    return a1;
  }
  if (v20 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(((unint64_t)a1 + v11) & v18, ((unint64_t)a2 + v11) & v18, v8);
    if (v13 > 3)
    {
LABEL_48:
      *((_BYTE *)a1 + v13) = 1;
      return a1;
    }
    v23 = 1;
    v24 = ((1 << v14) + 1) >> v14;
    if (v24 <= 0xFFFC)
    {
      if (v24 <= 0xFC)
        goto LABEL_48;
LABEL_56:
      *(_WORD *)((char *)a1 + v13) = v23;
      return a1;
    }
LABEL_53:
    *(_DWORD *)((char *)a1 + v13) = v23;
    return a1;
  }
  (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
  if (v13 > 3)
    goto LABEL_40;
  v25 = ((1 << v14) + 1) >> v14;
  if (v25 > 0xFFFC)
  {
    *(_DWORD *)((char *)a1 + v13) = 0;
    return a1;
  }
  if (v25 <= 0xFC)
LABEL_40:
    *((_BYTE *)a1 + v13) = 0;
  else
    *(_WORD *)((char *)a1 + v13) = 0;
  return a1;
}

uint64_t sub_23A25A194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  __int128 v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  unsigned int v21;
  unsigned int v22;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = sub_23A275E14();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = v7 + v10;
  v12 = ((v7 + v10) & ~v10) + *(_QWORD *)(v9 + 64);
  if (v12 <= v7)
    v12 = v7;
  if (v12 <= 0x28)
    v13 = 40;
  else
    v13 = v12;
  if (v13 > 3)
    goto LABEL_9;
  v14 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  if (v14 <= 0xFFFC)
  {
    if (v14 > 0xFC)
    {
      v15 = *(unsigned __int16 *)(a2 + v13);
      if (v15 < 3)
        goto LABEL_18;
      goto LABEL_14;
    }
LABEL_9:
    v15 = *(unsigned __int8 *)(a2 + v13);
    if (v15 < 3)
      goto LABEL_18;
LABEL_14:
    if (v13 <= 3)
      v16 = v13;
    else
      v16 = 4;
    __asm { BR              X13 }
  }
  v15 = *(_DWORD *)(a2 + v13);
  if (v15 >= 3)
    goto LABEL_14;
LABEL_18:
  if (v15 == 2)
  {
    v17 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v17;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    if (v13 <= 3)
    {
      v18 = ((1 << (8 * v13)) + 1) >> (8 * v13);
      if (v18 > 0xFFFC)
      {
        v20 = 2;
        goto LABEL_34;
      }
      if (v18 > 0xFC)
      {
        LOWORD(v20) = 2;
        goto LABEL_37;
      }
    }
    *(_BYTE *)(a1 + v13) = 2;
    return a1;
  }
  if (v15 == 1)
  {
    v19 = ~v10;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))((v11 + a1) & v19, (v11 + a2) & v19, v8);
    if (v13 > 3)
    {
LABEL_29:
      *(_BYTE *)(a1 + v13) = 1;
      return a1;
    }
    v20 = 1;
    v21 = ((1 << (8 * v13)) + 1) >> (8 * v13);
    if (v21 <= 0xFFFC)
    {
      if (v21 <= 0xFC)
        goto LABEL_29;
LABEL_37:
      *(_WORD *)(a1 + v13) = v20;
      return a1;
    }
LABEL_34:
    *(_DWORD *)(a1 + v13) = v20;
    return a1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a1, a2, v5);
  if (v13 > 3)
    goto LABEL_21;
  v22 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  if (v22 > 0xFFFC)
  {
    *(_DWORD *)(a1 + v13) = 0;
    return a1;
  }
  if (v22 <= 0xFC)
LABEL_21:
    *(_BYTE *)(a1 + v13) = 0;
  else
    *(_WORD *)(a1 + v13) = 0;
  return a1;
}

uint64_t sub_23A25A46C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  __int128 v22;
  unsigned int v23;
  int v24;
  unsigned int v25;
  unsigned int v26;

  if (a1 == a2)
    return a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = sub_23A275E14();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = v7 + v10;
  v12 = ((v7 + v10) & ~v10) + *(_QWORD *)(v9 + 64);
  if (v12 <= v7)
    v12 = v7;
  if (v12 <= 0x28)
    v13 = 40;
  else
    v13 = v12;
  v14 = 8 * v13;
  if (v13 > 3)
    goto LABEL_10;
  v15 = ((1 << v14) + 1) >> v14;
  if (v15 <= 0xFFFC)
  {
    if (v15 > 0xFC)
    {
      v16 = *(unsigned __int16 *)(a1 + v13);
      if (v16 < 3)
        goto LABEL_19;
      goto LABEL_15;
    }
LABEL_10:
    v16 = *(unsigned __int8 *)(a1 + v13);
    if (v16 < 3)
      goto LABEL_19;
LABEL_15:
    if (v13 <= 3)
      v17 = v13;
    else
      v17 = 4;
    __asm { BR              X13 }
  }
  v16 = *(_DWORD *)(a1 + v13);
  if (v16 >= 3)
    goto LABEL_15;
LABEL_19:
  v18 = ~v10;
  if (v16 == 2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v13 > 3)
      goto LABEL_28;
  }
  else
  {
    if (v16 == 1)
    {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))((v11 + a1) & v18, v8);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    }
    if (v13 > 3)
      goto LABEL_28;
  }
  v19 = ((1 << v14) + 1) >> v14;
  if (v19 <= 0xFFFC)
  {
    if (v19 > 0xFC)
    {
      v20 = *(unsigned __int16 *)(a2 + v13);
      if (v20 < 3)
        goto LABEL_37;
      goto LABEL_33;
    }
LABEL_28:
    v20 = *(unsigned __int8 *)(a2 + v13);
    if (v20 < 3)
      goto LABEL_37;
LABEL_33:
    if (v13 <= 3)
      v21 = v13;
    else
      v21 = 4;
    __asm { BR              X12 }
  }
  v20 = *(_DWORD *)(a2 + v13);
  if (v20 >= 3)
    goto LABEL_33;
LABEL_37:
  if (v20 == 2)
  {
    v22 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v22;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    if (v13 <= 3)
    {
      v23 = ((1 << v14) + 1) >> v14;
      if (v23 > 0xFFFC)
      {
        v24 = 2;
        goto LABEL_53;
      }
      if (v23 > 0xFC)
      {
        LOWORD(v24) = 2;
        goto LABEL_56;
      }
    }
    *(_BYTE *)(a1 + v13) = 2;
    return a1;
  }
  if (v20 == 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))((v11 + a1) & v18, (v11 + a2) & v18, v8);
    if (v13 > 3)
    {
LABEL_48:
      *(_BYTE *)(a1 + v13) = 1;
      return a1;
    }
    v24 = 1;
    v25 = ((1 << v14) + 1) >> v14;
    if (v25 <= 0xFFFC)
    {
      if (v25 <= 0xFC)
        goto LABEL_48;
LABEL_56:
      *(_WORD *)(a1 + v13) = v24;
      return a1;
    }
LABEL_53:
    *(_DWORD *)(a1 + v13) = v24;
    return a1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a1, a2, v5);
  if (v13 > 3)
    goto LABEL_40;
  v26 = ((1 << v14) + 1) >> v14;
  if (v26 > 0xFFFC)
  {
    *(_DWORD *)(a1 + v13) = 0;
    return a1;
  }
  if (v26 <= 0xFC)
LABEL_40:
    *(_BYTE *)(a1 + v13) = 0;
  else
    *(_WORD *)(a1 + v13) = 0;
  return a1;
}

uint64_t sub_23A25A87C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  unsigned int v9;
  char v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  int v16;
  unsigned int v17;
  int v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  char v22;
  int v23;
  unsigned int v25;
  int v26;
  int v27;
  unsigned int v28;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  v6 = sub_23A275E14();
  v7 = ((v5 + *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64);
  if (v7 <= v5)
    v7 = v5;
  if (v7 <= 0x28)
    v7 = 40;
  if (v7 > 3)
  {
    v8 = 4;
LABEL_9:
    v10 = 8;
    goto LABEL_10;
  }
  v9 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v9 > 0xFFFC)
    goto LABEL_13;
  v8 = v9 + 3;
  if (v9 <= 0xFC)
    goto LABEL_9;
  v10 = 16;
LABEL_10:
  v11 = (1 << v10) - v8;
  if ((v11 & 0x80000000) == 0)
  {
    if (v7 > 3)
      goto LABEL_17;
LABEL_14:
    v12 = ((1 << (8 * v7)) + 1) >> (8 * v7);
    v13 = 2;
    if (v12 > 0xFFFC)
      v13 = 4;
    if (v12 > 0xFC)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_13:
  v11 = 0x7FFFFFFF;
  if (v7 <= 3)
    goto LABEL_14;
LABEL_17:
  v13 = 1;
LABEL_18:
  if (!a2)
    return 0;
  if (a2 <= v11)
    goto LABEL_36;
  v14 = v13 + v7;
  v15 = 8 * v14;
  if (v14 <= 3)
  {
    v17 = ((a2 - v11 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v17))
    {
      v16 = *(_DWORD *)(a1 + v14);
      if (!v16)
        goto LABEL_36;
      goto LABEL_29;
    }
    if (v17 > 0xFF)
    {
      v16 = *(unsigned __int16 *)(a1 + v14);
      if (!*(_WORD *)(a1 + v14))
        goto LABEL_36;
      goto LABEL_29;
    }
    if (v17 < 2)
    {
LABEL_36:
      if (v11)
      {
        if (v7 <= 3)
        {
          v25 = ((1 << (8 * v7)) + 1) >> (8 * v7);
          if (v25 > 0xFFFC)
          {
            v20 = *(_DWORD *)(a1 + v7);
            v21 = ~v20;
LABEL_46:
            v28 = 0x7FFFFFFF;
LABEL_47:
            if (v28 > v21)
              return -v20;
            else
              return 0;
          }
          v23 = v25 + 3;
          if (v25 > 0xFC)
          {
            v27 = *(unsigned __int16 *)(a1 + v7);
            v20 = v27 | 0xFFFF0000;
            v21 = v27 ^ 0xFFFF;
            v22 = 16;
          }
          else
          {
            v26 = *(unsigned __int8 *)(a1 + v7);
            v20 = v26 | 0xFFFFFF00;
            v21 = v26 ^ 0xFF;
            v22 = 8;
          }
        }
        else
        {
          v19 = *(unsigned __int8 *)(a1 + v7);
          v20 = v19 | 0xFFFFFF00;
          v21 = v19 ^ 0xFF;
          v22 = 8;
          v23 = 4;
        }
        v28 = (1 << v22) - v23;
        if ((v28 & 0x80000000) == 0)
          goto LABEL_47;
        goto LABEL_46;
      }
      return 0;
    }
  }
  v16 = *(unsigned __int8 *)(a1 + v14);
  if (!*(_BYTE *)(a1 + v14))
    goto LABEL_36;
LABEL_29:
  v18 = (v16 - 1) << v15;
  if (v14 > 3)
    v18 = 0;
  if ((_DWORD)v14)
  {
    if (v14 > 3)
      LODWORD(v14) = 4;
    __asm { BR              X12 }
  }
  return v11 + v18 + 1;
}

void sub_23A25AB08(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  int v11;
  char v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  size_t v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  int v21;

  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  v8 = sub_23A275E14();
  v9 = ((v7 + *(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64);
  if (v9 <= v7)
    v9 = v7;
  if (v9 <= 0x28)
    v9 = 40;
  v10 = 8 * v9;
  if (v9 <= 3)
  {
    v14 = ((1 << v10) + 1) >> v10;
    if (v14 > 0xFFFC)
      goto LABEL_14;
    v11 = v14 + 3;
    if (v14 > 0xFC)
    {
      v12 = 16;
LABEL_8:
      v13 = (1 << v12) - v11;
      if ((v13 & 0x80000000) == 0)
      {
        if (v9 > 3)
          goto LABEL_18;
LABEL_15:
        v15 = ((1 << v10) + 1) >> v10;
        v16 = 2;
        if (v15 > 0xFFFC)
          v16 = 4;
        if (v15 > 0xFC)
        {
LABEL_19:
          v17 = v16 + v9;
          if (a3 <= v13)
          {
            v18 = 0;
          }
          else if (v17 <= 3)
          {
            v20 = ((a3 - v13 + ~(-1 << (8 * v17))) >> (8 * v17)) + 1;
            if (HIWORD(v20))
            {
              v18 = 4u;
            }
            else if (v20 >= 0x100)
            {
              v18 = 2;
            }
            else
            {
              v18 = v20 > 1;
            }
          }
          else
          {
            v18 = 1u;
          }
          if (v13 < a2)
          {
            v19 = ~v13 + a2;
            if (v17 < 4)
            {
              if ((_DWORD)v17)
              {
                v21 = v19 & ~(-1 << (8 * v17));
                bzero(a1, v17);
                if ((_DWORD)v17 == 3)
                {
                  *(_WORD *)a1 = v21;
                  a1[2] = BYTE2(v21);
                }
                else if ((_DWORD)v17 == 2)
                {
                  *(_WORD *)a1 = v21;
                }
                else
                {
                  *a1 = v21;
                }
              }
            }
            else
            {
              bzero(a1, v17);
              *(_DWORD *)a1 = v19;
            }
            __asm { BR              X10 }
          }
          __asm { BR              X12 }
        }
LABEL_18:
        v16 = 1;
        goto LABEL_19;
      }
LABEL_14:
      v13 = 0x7FFFFFFF;
      if (v9 > 3)
        goto LABEL_18;
      goto LABEL_15;
    }
  }
  else
  {
    v11 = 4;
  }
  v12 = 8;
  goto LABEL_8;
}

uint64_t sub_23A25ADB8(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  unsigned int v7;
  uint64_t v8;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  v4 = sub_23A275E14();
  v5 = ((v3 + *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64);
  if (v5 <= v3)
    v5 = v3;
  if (v5 <= 0x28)
    v5 = 40;
  if (v5 > 3)
    goto LABEL_6;
  v7 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  if (v7 > 0xFFFC)
  {
    result = *(unsigned int *)(a1 + v5);
  }
  else
  {
    if (v7 <= 0xFC)
    {
LABEL_6:
      result = *(unsigned __int8 *)(a1 + v5);
      goto LABEL_11;
    }
    result = *(unsigned __int16 *)(a1 + v5);
  }
LABEL_11:
  if (result >= 3)
  {
    if (v5 <= 3)
      v8 = v5;
    else
      v8 = 4;
    __asm { BR              X12 }
  }
  return result;
}

uint64_t sub_23A25AEC4(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v5;
  uint64_t result;
  unint64_t v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int *v12;
  unsigned int v13;
  int v14;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  result = sub_23A275E14();
  v7 = ((v5 + *(unsigned __int8 *)(*(_QWORD *)(result - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(result - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(result - 8) + 64);
  if (v7 <= v5)
    v7 = v5;
  if (v7 <= 0x28)
    v8 = 40;
  else
    v8 = v7;
  if (a2 > 2)
  {
    v9 = a2 - 3;
    if (v8 < 4)
    {
      v11 = (v9 >> (8 * v8)) + 3;
      v12 = (int *)&a1[v8];
      v13 = ((1 << (8 * v8)) + 1) >> (8 * v8);
      if (v13 > 0xFFFC)
      {
        *v12 = v11;
      }
      else if (v13 > 0xFC)
      {
        *(_WORD *)v12 = v11;
      }
      else
      {
        *(_BYTE *)v12 = v11;
      }
    }
    else
    {
      a1[v8] = 3;
    }
    if (v8 <= 3)
      v14 = v8;
    else
      v14 = 4;
    bzero(a1, v8);
    __asm { BR              X10 }
  }
  if (v8 > 3)
    goto LABEL_8;
  v10 = ((1 << (8 * v8)) + 1) >> (8 * v8);
  if (v10 > 0xFFFC)
  {
    *(_DWORD *)&a1[v8] = a2;
  }
  else
  {
    if (v10 <= 0xFC)
    {
LABEL_8:
      a1[v8] = a2;
      return result;
    }
    *(_WORD *)&a1[v8] = a2;
  }
  return result;
}

uint64_t sub_23A25B040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;

  result = type metadata accessor for AsyncStateValue(319, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A25B0B8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  BOOL v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  char v24;
  uint64_t v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  BOOL v29;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = sub_23A275E14();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_DWORD *)(v9 + 80);
  v11 = v7 + v10;
  v12 = ((v7 + v10) & ~v10) + *(_QWORD *)(v9 + 64);
  if (v12 <= v7)
    v12 = v7;
  if (v12 <= 0x28)
    v13 = 40;
  else
    v13 = v12;
  if (v13 > 3)
    goto LABEL_10;
  v14 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  v15 = 2;
  if (v14 > 0xFFFC)
    v15 = 4;
  if (v14 <= 0xFC)
LABEL_10:
    v15 = 1;
  v16 = *(_DWORD *)(v6 + 80) & 0xF8 | v10;
  v17 = v16 <= 7 && ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) == 0;
  if (v17 && ((v13 + v15 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 <= 0x18)
  {
    if (v13 <= 3)
    {
      v18 = ((1 << (8 * v13)) + 1) >> (8 * v13);
      if (v18 > 0xFFFC)
      {
        v19 = *(_DWORD *)((char *)a2 + v13);
        if (v19 < 3)
        {
LABEL_30:
          if (v19 != 2)
          {
            if (v19 != 1)
            {
              (*(void (**)(uint64_t, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
              if (v13 > 3)
                goto LABEL_33;
              v23 = ((1 << (8 * v13)) + 1) >> (8 * v13);
              if (v23 > 0xFFFC)
              {
                *(_DWORD *)(a1 + v13) = 0;
              }
              else
              {
                if (v23 <= 0xFC)
                {
LABEL_33:
                  *(_BYTE *)(a1 + v13) = 0;
                  if (v13 > 3)
                    goto LABEL_47;
                  goto LABEL_44;
                }
                *(_WORD *)(a1 + v13) = 0;
              }
LABEL_56:
              v29 = v23 > 0xFFFC;
              v28 = 2;
              if (v29)
                v28 = 4;
              goto LABEL_58;
            }
            v25 = ~v10;
            (*(void (**)(uint64_t, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
            (*(void (**)(uint64_t, unint64_t, uint64_t))(v9 + 16))((v11 + a1) & v25, ((unint64_t)a2 + v11) & v25, v8);
            if (v13 > 3)
              goto LABEL_42;
            v26 = 1;
            v23 = ((1 << (8 * v13)) + 1) >> (8 * v13);
            if (v23 <= 0xFFFC)
            {
              if (v23 <= 0xFC)
              {
LABEL_42:
                v24 = 1;
LABEL_43:
                *(_BYTE *)(a1 + v13) = v24;
                if (v13 > 3)
                {
LABEL_47:
                  v28 = 1;
LABEL_58:
                  *(_QWORD *)((v28 + v13 + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2
                                                                                      + v28
                                                                                      + v13
                                                                                      + 7) & 0xFFFFFFFFFFFFF8);
                  return a1;
                }
LABEL_44:
                v27 = ((1 << (8 * v13)) + 1) >> (8 * v13);
                v28 = 2;
                if (v27 > 0xFFFC)
                  v28 = 4;
                if (v27 > 0xFC)
                  goto LABEL_58;
                goto LABEL_47;
              }
LABEL_55:
              *(_WORD *)(a1 + v13) = v26;
              goto LABEL_56;
            }
LABEL_52:
            *(_DWORD *)(a1 + v13) = v26;
            goto LABEL_56;
          }
          v22 = a2[1];
          *(_QWORD *)a1 = *a2;
          *(_QWORD *)(a1 + 8) = v22;
          *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
          *(_QWORD *)(a1 + 32) = a2[4];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v13 <= 3)
          {
            v23 = ((1 << (8 * v13)) + 1) >> (8 * v13);
            if (v23 > 0xFFFC)
            {
              v26 = 2;
              goto LABEL_52;
            }
            if (v23 > 0xFC)
            {
              LOWORD(v26) = 2;
              goto LABEL_55;
            }
          }
          v24 = 2;
          goto LABEL_43;
        }
LABEL_26:
        if (v13 <= 3)
          v21 = v13;
        else
          v21 = 4;
        __asm { BR              X13 }
      }
      if (v18 > 0xFC)
      {
        v19 = *(unsigned __int16 *)((char *)a2 + v13);
        if (v19 < 3)
          goto LABEL_30;
        goto LABEL_26;
      }
    }
    v19 = *((unsigned __int8 *)a2 + v13);
    if (v19 < 3)
      goto LABEL_30;
    goto LABEL_26;
  }
  v20 = *a2;
  *(_QWORD *)a1 = *a2;
  a1 = v20 + (((v16 | 7) + 16) & ~(unint64_t)(v16 | 7));
  swift_retain();
  return a1;
}

uint64_t sub_23A25B4CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v15;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = sub_23A275E14();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = v5 + v8;
  v10 = ((v5 + v8) & ~v8) + *(_QWORD *)(v7 + 64);
  if (v10 <= v5)
    v10 = v5;
  if (v10 <= 0x28)
    v10 = 40;
  if (v10 > 3)
    goto LABEL_6;
  v12 = ((1 << (8 * v10)) + 1) >> (8 * v10);
  if (v12 > 0xFFFC)
  {
    v11 = *(_DWORD *)(a1 + v10);
  }
  else
  {
    if (v12 <= 0xFC)
    {
LABEL_6:
      v11 = *(unsigned __int8 *)(a1 + v10);
      goto LABEL_11;
    }
    v11 = *(unsigned __int16 *)(a1 + v10);
  }
LABEL_11:
  if (v11 >= 3)
  {
    if (v10 <= 3)
      v13 = v10;
    else
      v13 = 4;
    __asm { BR              X14 }
  }
  if (v11 == 2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else if (v11 == 1)
  {
    v15 = ~v8;
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))((v9 + a1) & v15, v6);
  }
  else
  {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
}

uint64_t sub_23A25B678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  char v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  uint64_t v23;
  BOOL v24;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = sub_23A275E14();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = v7 + v10;
  v12 = ((v7 + v10) & ~v10) + *(_QWORD *)(v9 + 64);
  if (v12 <= v7)
    v12 = v7;
  if (v12 <= 0x28)
    v13 = 40;
  else
    v13 = v12;
  if (v13 > 3)
    goto LABEL_9;
  v14 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  if (v14 <= 0xFFFC)
  {
    if (v14 > 0xFC)
    {
      v15 = *(unsigned __int16 *)(a2 + v13);
      if (v15 < 3)
        goto LABEL_18;
      goto LABEL_14;
    }
LABEL_9:
    v15 = *(unsigned __int8 *)(a2 + v13);
    if (v15 < 3)
      goto LABEL_18;
LABEL_14:
    if (v13 <= 3)
      v16 = v13;
    else
      v16 = 4;
    __asm { BR              X13 }
  }
  v15 = *(_DWORD *)(a2 + v13);
  if (v15 >= 3)
    goto LABEL_14;
LABEL_18:
  if (v15 == 2)
  {
    v17 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v17;
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13 <= 3)
    {
      v18 = ((1 << (8 * v13)) + 1) >> (8 * v13);
      if (v18 > 0xFFFC)
      {
        v21 = 2;
        goto LABEL_40;
      }
      if (v18 > 0xFC)
      {
        LOWORD(v21) = 2;
        goto LABEL_43;
      }
    }
    v19 = 2;
    goto LABEL_31;
  }
  if (v15 == 1)
  {
    v20 = ~v10;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))((v11 + a1) & v20, (v11 + a2) & v20, v8);
    if (v13 > 3)
    {
LABEL_30:
      v19 = 1;
LABEL_31:
      *(_BYTE *)(a1 + v13) = v19;
      if (v13 > 3)
      {
LABEL_35:
        v23 = 1;
        goto LABEL_46;
      }
      goto LABEL_32;
    }
    v21 = 1;
    v18 = ((1 << (8 * v13)) + 1) >> (8 * v13);
    if (v18 <= 0xFFFC)
    {
      if (v18 <= 0xFC)
        goto LABEL_30;
LABEL_43:
      *(_WORD *)(a1 + v13) = v21;
LABEL_44:
      v24 = v18 > 0xFFFC;
      v23 = 2;
      if (v24)
        v23 = 4;
      goto LABEL_46;
    }
LABEL_40:
    *(_DWORD *)(a1 + v13) = v21;
    goto LABEL_44;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, a2, v5);
  if (v13 > 3)
    goto LABEL_21;
  v18 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  if (v18 > 0xFFFC)
  {
    *(_DWORD *)(a1 + v13) = 0;
    goto LABEL_44;
  }
  if (v18 > 0xFC)
  {
    *(_WORD *)(a1 + v13) = 0;
    goto LABEL_44;
  }
LABEL_21:
  *(_BYTE *)(a1 + v13) = 0;
  if (v13 > 3)
    goto LABEL_35;
LABEL_32:
  v22 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  v23 = 2;
  if (v22 > 0xFFFC)
    v23 = 4;
  if (v22 <= 0xFC)
    goto LABEL_35;
LABEL_46:
  *(_QWORD *)((v23 + v13 + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v23 + v13 + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_23A25B9F4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  unint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v30;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  if (a1 == a2)
    goto LABEL_57;
  v30 = sub_23A275E14();
  v8 = *(_QWORD *)(v30 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = ((v7 + v9) & ~v9) + *(_QWORD *)(v8 + 64);
  if (v11 <= v7)
    v11 = v7;
  if (v11 <= 0x28)
    v12 = 40;
  else
    v12 = v11;
  v13 = 8 * v12;
  if (v12 > 3)
    goto LABEL_10;
  v14 = ((1 << v13) + 1) >> v13;
  if (v14 <= 0xFFFC)
  {
    if (v14 > 0xFC)
    {
      v15 = *(unsigned __int16 *)((char *)a1 + v12);
      if (v15 < 3)
        goto LABEL_19;
      goto LABEL_15;
    }
LABEL_10:
    v15 = *((unsigned __int8 *)a1 + v12);
    if (v15 < 3)
      goto LABEL_19;
LABEL_15:
    if (v12 <= 3)
      v16 = v12;
    else
      v16 = 4;
    __asm { BR              X13 }
  }
  v15 = *(_DWORD *)((char *)a1 + v12);
  if (v15 >= 3)
    goto LABEL_15;
LABEL_19:
  v17 = ~v9;
  if (v15 == 2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v12 > 3)
      goto LABEL_28;
  }
  else
  {
    if (v15 == 1)
    {
      (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(a1, v5);
      (*(void (**)(unint64_t, uint64_t))(v8 + 8))(((unint64_t)a1 + v10) & v17, v30);
    }
    else
    {
      (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(a1, v5);
    }
    if (v12 > 3)
      goto LABEL_28;
  }
  v18 = ((1 << v13) + 1) >> v13;
  if (v18 <= 0xFFFC)
  {
    if (v18 > 0xFC)
    {
      v19 = *(unsigned __int16 *)((char *)a2 + v12);
      if (v19 < 3)
        goto LABEL_37;
      goto LABEL_33;
    }
LABEL_28:
    v19 = *((unsigned __int8 *)a2 + v12);
    if (v19 < 3)
      goto LABEL_37;
LABEL_33:
    if (v12 <= 3)
      v20 = v12;
    else
      v20 = 4;
    __asm { BR              X12 }
  }
  v19 = *(_DWORD *)((char *)a2 + v12);
  if (v19 >= 3)
    goto LABEL_33;
LABEL_37:
  if (v19 == 2)
  {
    *a1 = *a2;
    a1[1] = a2[1];
    a1[2] = a2[2];
    a1[3] = a2[3];
    a1[4] = a2[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12 <= 3)
    {
      v21 = ((1 << v13) + 1) >> v13;
      if (v21 > 0xFFFC)
      {
        v22 = 2;
        goto LABEL_53;
      }
      if (v21 > 0xFC)
      {
        LOWORD(v22) = 2;
        goto LABEL_56;
      }
    }
    *((_BYTE *)a1 + v12) = 2;
    goto LABEL_57;
  }
  if (v19 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(((unint64_t)a1 + v10) & v17, ((unint64_t)a2 + v10) & v17, v30);
    if (v12 > 3)
    {
LABEL_48:
      *((_BYTE *)a1 + v12) = 1;
      goto LABEL_57;
    }
    v22 = 1;
    v23 = ((1 << v13) + 1) >> v13;
    if (v23 <= 0xFFFC)
    {
      if (v23 <= 0xFC)
        goto LABEL_48;
LABEL_56:
      *(_WORD *)((char *)a1 + v12) = v22;
      goto LABEL_57;
    }
LABEL_53:
    *(_DWORD *)((char *)a1 + v12) = v22;
    goto LABEL_57;
  }
  (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
  if (v12 > 3)
  {
LABEL_40:
    *((_BYTE *)a1 + v12) = 0;
    goto LABEL_57;
  }
  v24 = ((1 << v13) + 1) >> v13;
  if (v24 > 0xFFFC)
  {
    *(_DWORD *)((char *)a1 + v12) = 0;
  }
  else
  {
    if (v24 <= 0xFC)
      goto LABEL_40;
    *(_WORD *)((char *)a1 + v12) = 0;
  }
LABEL_57:
  v25 = sub_23A275E14();
  v26 = ((v7 + *(unsigned __int8 *)(*(_QWORD *)(v25 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v25 - 8) + 80))
      + *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64);
  if (v26 <= v7)
    v26 = v7;
  if (v26 <= 0x28)
    v26 = 40;
  if (v26 > 3)
    goto LABEL_65;
  v27 = ((1 << (8 * v26)) + 1) >> (8 * v26);
  v28 = 2;
  if (v27 > 0xFFFC)
    v28 = 4;
  if (v27 <= 0xFC)
LABEL_65:
    v28 = 1;
  *(_QWORD *)(((unint64_t)a1 + v28 + v26 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2
                                                                                        + v28
                                                                                        + v26
                                                                                        + 7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_23A25BEC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  __int128 v17;
  unsigned int v18;
  char v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  uint64_t v23;
  BOOL v24;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = sub_23A275E14();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = v7 + v10;
  v12 = ((v7 + v10) & ~v10) + *(_QWORD *)(v9 + 64);
  if (v12 <= v7)
    v12 = v7;
  if (v12 <= 0x28)
    v13 = 40;
  else
    v13 = v12;
  if (v13 > 3)
    goto LABEL_9;
  v14 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  if (v14 <= 0xFFFC)
  {
    if (v14 > 0xFC)
    {
      v15 = *(unsigned __int16 *)(a2 + v13);
      if (v15 < 3)
        goto LABEL_18;
      goto LABEL_14;
    }
LABEL_9:
    v15 = *(unsigned __int8 *)(a2 + v13);
    if (v15 < 3)
      goto LABEL_18;
LABEL_14:
    if (v13 <= 3)
      v16 = v13;
    else
      v16 = 4;
    __asm { BR              X13 }
  }
  v15 = *(_DWORD *)(a2 + v13);
  if (v15 >= 3)
    goto LABEL_14;
LABEL_18:
  if (v15 == 2)
  {
    v17 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v17;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    if (v13 <= 3)
    {
      v18 = ((1 << (8 * v13)) + 1) >> (8 * v13);
      if (v18 > 0xFFFC)
      {
        v21 = 2;
        goto LABEL_40;
      }
      if (v18 > 0xFC)
      {
        LOWORD(v21) = 2;
        goto LABEL_43;
      }
    }
    v19 = 2;
    goto LABEL_31;
  }
  if (v15 == 1)
  {
    v20 = ~v10;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))((v11 + a1) & v20, (v11 + a2) & v20, v8);
    if (v13 > 3)
    {
LABEL_30:
      v19 = 1;
LABEL_31:
      *(_BYTE *)(a1 + v13) = v19;
      if (v13 > 3)
      {
LABEL_35:
        v23 = 1;
        goto LABEL_46;
      }
      goto LABEL_32;
    }
    v21 = 1;
    v18 = ((1 << (8 * v13)) + 1) >> (8 * v13);
    if (v18 <= 0xFFFC)
    {
      if (v18 <= 0xFC)
        goto LABEL_30;
LABEL_43:
      *(_WORD *)(a1 + v13) = v21;
LABEL_44:
      v24 = v18 > 0xFFFC;
      v23 = 2;
      if (v24)
        v23 = 4;
      goto LABEL_46;
    }
LABEL_40:
    *(_DWORD *)(a1 + v13) = v21;
    goto LABEL_44;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a1, a2, v5);
  if (v13 > 3)
    goto LABEL_21;
  v18 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  if (v18 > 0xFFFC)
  {
    *(_DWORD *)(a1 + v13) = 0;
    goto LABEL_44;
  }
  if (v18 > 0xFC)
  {
    *(_WORD *)(a1 + v13) = 0;
    goto LABEL_44;
  }
LABEL_21:
  *(_BYTE *)(a1 + v13) = 0;
  if (v13 > 3)
    goto LABEL_35;
LABEL_32:
  v22 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  v23 = 2;
  if (v22 > 0xFFFC)
    v23 = 4;
  if (v22 <= 0xFC)
    goto LABEL_35;
LABEL_46:
  *(_QWORD *)((v23 + v13 + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v23 + v13 + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_23A25C228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  __int128 v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v31;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  if (a1 == a2)
    goto LABEL_57;
  v31 = sub_23A275E14();
  v8 = *(_QWORD *)(v31 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = ((v7 + v9) & ~v9) + *(_QWORD *)(v8 + 64);
  if (v11 <= v7)
    v11 = v7;
  if (v11 <= 0x28)
    v12 = 40;
  else
    v12 = v11;
  v13 = 8 * v12;
  if (v12 > 3)
    goto LABEL_10;
  v14 = ((1 << v13) + 1) >> v13;
  if (v14 <= 0xFFFC)
  {
    if (v14 > 0xFC)
    {
      v15 = *(unsigned __int16 *)(a1 + v12);
      if (v15 < 3)
        goto LABEL_19;
      goto LABEL_15;
    }
LABEL_10:
    v15 = *(unsigned __int8 *)(a1 + v12);
    if (v15 < 3)
      goto LABEL_19;
LABEL_15:
    if (v12 <= 3)
      v16 = v12;
    else
      v16 = 4;
    __asm { BR              X13 }
  }
  v15 = *(_DWORD *)(a1 + v12);
  if (v15 >= 3)
    goto LABEL_15;
LABEL_19:
  v17 = ~v9;
  if (v15 == 2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v12 > 3)
      goto LABEL_28;
  }
  else
  {
    if (v15 == 1)
    {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))((v10 + a1) & v17, v31);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    }
    if (v12 > 3)
      goto LABEL_28;
  }
  v18 = ((1 << v13) + 1) >> v13;
  if (v18 <= 0xFFFC)
  {
    if (v18 > 0xFC)
    {
      v19 = *(unsigned __int16 *)(a2 + v12);
      if (v19 < 3)
        goto LABEL_37;
      goto LABEL_33;
    }
LABEL_28:
    v19 = *(unsigned __int8 *)(a2 + v12);
    if (v19 < 3)
      goto LABEL_37;
LABEL_33:
    if (v12 <= 3)
      v20 = v12;
    else
      v20 = 4;
    __asm { BR              X12 }
  }
  v19 = *(_DWORD *)(a2 + v12);
  if (v19 >= 3)
    goto LABEL_33;
LABEL_37:
  if (v19 == 2)
  {
    v21 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v21;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    if (v12 <= 3)
    {
      v22 = ((1 << v13) + 1) >> v13;
      if (v22 > 0xFFFC)
      {
        v23 = 2;
        goto LABEL_53;
      }
      if (v22 > 0xFC)
      {
        LOWORD(v23) = 2;
        goto LABEL_56;
      }
    }
    *(_BYTE *)(a1 + v12) = 2;
    goto LABEL_57;
  }
  if (v19 == 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))((v10 + a1) & v17, (v10 + a2) & v17, v31);
    if (v12 > 3)
    {
LABEL_48:
      *(_BYTE *)(a1 + v12) = 1;
      goto LABEL_57;
    }
    v23 = 1;
    v24 = ((1 << v13) + 1) >> v13;
    if (v24 <= 0xFFFC)
    {
      if (v24 <= 0xFC)
        goto LABEL_48;
LABEL_56:
      *(_WORD *)(a1 + v12) = v23;
      goto LABEL_57;
    }
LABEL_53:
    *(_DWORD *)(a1 + v12) = v23;
    goto LABEL_57;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a1, a2, v5);
  if (v12 > 3)
  {
LABEL_40:
    *(_BYTE *)(a1 + v12) = 0;
    goto LABEL_57;
  }
  v25 = ((1 << v13) + 1) >> v13;
  if (v25 > 0xFFFC)
  {
    *(_DWORD *)(a1 + v12) = 0;
  }
  else
  {
    if (v25 <= 0xFC)
      goto LABEL_40;
    *(_WORD *)(a1 + v12) = 0;
  }
LABEL_57:
  v26 = sub_23A275E14();
  v27 = ((v7 + *(unsigned __int8 *)(*(_QWORD *)(v26 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v26 - 8) + 80))
      + *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64);
  if (v27 <= v7)
    v27 = v7;
  if (v27 <= 0x28)
    v27 = 40;
  if (v27 > 3)
    goto LABEL_65;
  v28 = ((1 << (8 * v27)) + 1) >> (8 * v27);
  v29 = 2;
  if (v28 > 0xFFFC)
    v29 = 4;
  if (v28 <= 0xFC)
LABEL_65:
    v29 = 1;
  *(_QWORD *)((v29 + v27 + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v29 + v27 + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_23A25C6D0(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  int v9;
  char v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  char v19;
  unsigned int v20;
  int v21;
  char v22;
  int v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  char v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  unsigned int v32;
  unint64_t v33;
  char v34;
  int v35;
  unsigned int v36;
  int v37;
  int v38;
  int v39;
  unsigned int v40;
  unsigned int v41;
  char v42;
  int v43;
  unsigned int v44;
  unsigned int v46;
  int v47;
  int v48;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  v6 = sub_23A275E14();
  v7 = ((v5 + *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64);
  if (v7 <= v5)
    v7 = v5;
  if (v7 <= 0x28)
    v7 = 40;
  v8 = 8 * v7;
  if (v7 > 3)
  {
    v9 = 4;
LABEL_7:
    v10 = 8;
    goto LABEL_8;
  }
  v12 = ((1 << v8) + 1) >> v8;
  if (v12 > 0xFFFC)
    goto LABEL_14;
  v9 = v12 + 3;
  if (v12 <= 0xFC)
    goto LABEL_7;
  v10 = 16;
LABEL_8:
  v11 = (1 << v10) - v9;
  if ((v11 & 0x80000000) == 0)
  {
    if (v7 > 3)
      goto LABEL_18;
    goto LABEL_15;
  }
LABEL_14:
  v11 = 0x7FFFFFFF;
  if (v7 > 3)
  {
LABEL_18:
    v14 = 1;
    goto LABEL_19;
  }
LABEL_15:
  v13 = ((1 << v8) + 1) >> v8;
  v14 = 2;
  if (v13 > 0xFFFC)
    v14 = 4;
  if (v13 <= 0xFC)
    goto LABEL_18;
LABEL_19:
  if (!a2)
    return 0;
  if (v11 < a2)
  {
    if (((((v7 + v14 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v15 = 2;
    else
      v15 = a2 - v11 + 1;
    if (v15 >= 0x10000)
      v16 = 4;
    else
      v16 = 2;
    if (v15 < 0x100)
      v16 = 1;
    if (v15 >= 2)
      v17 = v16;
    else
      v17 = 0;
    __asm { BR              X15 }
  }
  if (!v11)
    return 0;
  if (v7 > 3)
  {
    v18 = 4;
LABEL_36:
    v19 = 8;
    goto LABEL_37;
  }
  v24 = ((1 << v8) + 1) >> v8;
  if (v24 > 0xFFFC)
  {
LABEL_47:
    v20 = 0x7FFFFFFF;
    if (v7 > 3)
      goto LABEL_39;
    goto LABEL_48;
  }
  v18 = v24 + 3;
  if (v24 <= 0xFC)
    goto LABEL_36;
  v19 = 16;
LABEL_37:
  v20 = (1 << v19) - v18;
  if ((v20 & 0x80000000) != 0)
    goto LABEL_47;
  if (v7 > 3)
  {
LABEL_39:
    v21 = 4;
LABEL_40:
    v22 = 8;
    goto LABEL_41;
  }
LABEL_48:
  v25 = ((1 << v8) + 1) >> v8;
  if (v25 > 0xFFFC)
  {
LABEL_51:
    if (v20 != 0x7FFFFFFF)
      return 0;
    goto LABEL_52;
  }
  v21 = v25 + 3;
  if (v25 <= 0xFC)
    goto LABEL_40;
  v22 = 16;
LABEL_41:
  v23 = (1 << v22) - v21;
  if (v23 < 0)
    goto LABEL_51;
  if (v23 != v20)
    return 0;
LABEL_52:
  if (v7 > 3)
  {
    v26 = 4;
LABEL_54:
    v27 = 8;
    goto LABEL_55;
  }
  v29 = ((1 << v8) + 1) >> v8;
  if (v29 > 0xFFFC)
    goto LABEL_61;
  v26 = v29 + 3;
  if (v29 <= 0xFC)
    goto LABEL_54;
  v27 = 16;
LABEL_55:
  v28 = (1 << v27) - v26;
  if ((v28 & 0x80000000) == 0)
  {
    if (v7 > 3)
      goto LABEL_65;
    goto LABEL_62;
  }
LABEL_61:
  v28 = 0x7FFFFFFF;
  if (v7 > 3)
  {
LABEL_65:
    v31 = 1;
    goto LABEL_66;
  }
LABEL_62:
  v30 = ((1 << v8) + 1) >> v8;
  v31 = 2;
  if (v30 > 0xFFFC)
    v31 = 4;
  if (v30 <= 0xFC)
    goto LABEL_65;
LABEL_66:
  if (!v20)
    return 0;
  v32 = v20 - v28;
  if (v20 <= v28)
    goto LABEL_84;
  v33 = v31 + v7;
  v34 = 8 * (v31 + v7);
  if (v33 > 3)
  {
LABEL_69:
    v35 = *(unsigned __int8 *)(a1 + v33);
    goto LABEL_76;
  }
  v36 = ((v32 + ~(-1 << v34)) >> v34) + 1;
  if (HIWORD(v36))
  {
    v35 = *(_DWORD *)(a1 + v33);
  }
  else
  {
    if (v36 <= 0xFF)
    {
      if (v36 < 2)
      {
LABEL_84:
        if (v28)
        {
          if (v7 <= 3)
          {
            v46 = ((1 << v8) + 1) >> v8;
            if (v46 > 0xFFFC)
            {
              v40 = *(_DWORD *)(a1 + v7);
              v41 = ~v40;
LABEL_94:
              v44 = 0x7FFFFFFF;
LABEL_95:
              if (v44 > v41)
                return -v40;
              else
                return 0;
            }
            v43 = v46 + 3;
            if (v46 > 0xFC)
            {
              v48 = *(unsigned __int16 *)(a1 + v7);
              v40 = v48 | 0xFFFF0000;
              v41 = v48 ^ 0xFFFF;
              v42 = 16;
            }
            else
            {
              v47 = *(unsigned __int8 *)(a1 + v7);
              v40 = v47 | 0xFFFFFF00;
              v41 = v47 ^ 0xFF;
              v42 = 8;
            }
          }
          else
          {
            v39 = *(unsigned __int8 *)(a1 + v7);
            v40 = v39 | 0xFFFFFF00;
            v41 = v39 ^ 0xFF;
            v42 = 8;
            v43 = 4;
          }
          v44 = (1 << v42) - v43;
          if ((v44 & 0x80000000) == 0)
            goto LABEL_95;
          goto LABEL_94;
        }
        return 0;
      }
      goto LABEL_69;
    }
    v35 = *(unsigned __int16 *)(a1 + v33);
  }
LABEL_76:
  if (!v35)
    goto LABEL_84;
  v37 = (v35 - 1) << v34;
  if (v33 > 3)
    v37 = 0;
  if ((_DWORD)v33)
  {
    if (v33 <= 3)
      v38 = v33;
    else
      v38 = 4;
    __asm { BR              X12 }
  }
  return v28 + v37 + 1;
}

void sub_23A25CB5C(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  int v11;
  char v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  size_t v17;
  unsigned int v18;
  int v19;
  int v20;
  unsigned int v21;

  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  v8 = sub_23A275E14();
  v9 = ((v7 + *(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64);
  if (v9 <= v7)
    v9 = v7;
  if (v9 <= 0x28)
    v9 = 40;
  v10 = 8 * v9;
  if (v9 <= 3)
  {
    v14 = ((1 << v10) + 1) >> v10;
    if (v14 > 0xFFFC)
      goto LABEL_14;
    v11 = v14 + 3;
    if (v14 > 0xFC)
    {
      v12 = 16;
LABEL_8:
      v13 = (1 << v12) - v11;
      if ((v13 & 0x80000000) == 0)
      {
        if (v9 > 3)
          goto LABEL_18;
LABEL_15:
        v15 = ((1 << v10) + 1) >> v10;
        v16 = 2;
        if (v15 > 0xFFFC)
          v16 = 4;
        if (v15 > 0xFC)
        {
LABEL_19:
          v17 = ((v9 + v16 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
          if (v13 >= a3)
          {
            v20 = 0;
            if (a2 <= v13)
              goto LABEL_32;
          }
          else
          {
            if ((((_DWORD)v9 + (_DWORD)v16 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
              v18 = a3 - v13 + 1;
            else
              v18 = 2;
            if (v18 >= 0x10000)
              v19 = 4;
            else
              v19 = 2;
            if (v18 < 0x100)
              v19 = 1;
            if (v18 >= 2)
              v20 = v19;
            else
              v20 = 0;
            if (a2 <= v13)
LABEL_32:
              __asm { BR              X12 }
          }
          if ((_DWORD)v17)
          {
            v21 = ~v13 + a2;
            bzero(a1, v17);
            *a1 = v21;
          }
          __asm { BR              X10 }
        }
LABEL_18:
        v16 = 1;
        goto LABEL_19;
      }
LABEL_14:
      v13 = 0x7FFFFFFF;
      if (v9 > 3)
        goto LABEL_18;
      goto LABEL_15;
    }
  }
  else
  {
    v11 = 4;
  }
  v12 = 8;
  goto LABEL_8;
}

void sub_23A25CD18()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_23A25CD20()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  *(_DWORD *)(v0 + v2) = 0;
  if (v1)
    JUMPOUT(0x23A25CD28);
}

void sub_23A25CE68()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_23A25CE70()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
}

void sub_23A25CE78(uint64_t a1@<X8>)
{
  int v1;
  char v2;
  int v3;
  int v4;
  char v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  *(_WORD *)(v12 + v14) = 0;
  if (!v13)
    return;
  if (a1 > 3)
  {
    v1 = 4;
LABEL_4:
    v2 = 8;
    goto LABEL_5;
  }
  v7 = ((1 << v11) + 1) >> v11;
  if (v7 > 0xFFFC)
  {
LABEL_16:
    v3 = 0x7FFFFFFF;
    if (a1 > 3)
      goto LABEL_7;
    goto LABEL_17;
  }
  v1 = v7 + 3;
  if (v7 <= 0xFC)
    goto LABEL_4;
  v2 = 16;
LABEL_5:
  v3 = (1 << v2) - v1;
  if (v3 < 0)
    goto LABEL_16;
  if (a1 > 3)
  {
LABEL_7:
    v4 = 4;
LABEL_8:
    v5 = 8;
    goto LABEL_9;
  }
LABEL_17:
  v8 = ((1 << v11) + 1) >> v11;
  if (v8 > 0xFFFC)
  {
LABEL_20:
    if (v3 == 0x7FFFFFFF)
    {
LABEL_11:
      if (a1 > 3)
        JUMPOUT(0x23A25CEECLL);
      JUMPOUT(0x23A25CE84);
    }
    goto LABEL_21;
  }
  v4 = v8 + 3;
  if (v8 <= 0xFC)
    goto LABEL_8;
  v5 = 16;
LABEL_9:
  v6 = (1 << v5) - v4;
  if (v6 < 0)
    goto LABEL_20;
  if (v6 == v3)
    goto LABEL_11;
LABEL_21:
  if (a1 > 3)
    goto LABEL_25;
  v9 = ((1 << v11) + 1) >> v11;
  v10 = 2;
  if (v9 > 0xFFFC)
    v10 = 4;
  if (v9 <= 0xFC)
LABEL_25:
    v10 = 1;
  *(_QWORD *)((v12 + a1 + v10 + 7) & 0xFFFFFFFFFFFFF8) = (v13 - 1);
}

void sub_23A25CFE0(uint64_t a1@<X8>)
{
  char v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  unsigned int v6;

  *(_WORD *)(v2 + v4) = 0;
  v5 = -v3;
  if (a1 > 3)
    goto LABEL_4;
  v6 = ((1 << v1) + 1) >> v1;
  if (v6 > 0xFFFC)
  {
    *(_DWORD *)(v2 + a1) = v5;
  }
  else
  {
    if (v6 <= 0xFC)
    {
LABEL_4:
      *(_BYTE *)(v2 + a1) = v5;
      goto LABEL_7;
    }
    *(_WORD *)(v2 + a1) = v5;
  }
LABEL_7:
  JUMPOUT(0x23A25D080);
}

void sub_23A25D06C()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  *(_BYTE *)(v0 + v2) = v1;
}

void sub_23A25D074()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;

  *(_WORD *)(v0 + v2) = v1;
}

uint64_t sub_23A25D098()
{
  return swift_allocateGenericValueMetadata();
}

_QWORD *sub_23A25D0A0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23A25D0CC()
{
  return swift_bridgeObjectRelease();
}

_QWORD *sub_23A25D0D4(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *sub_23A25D120(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23A25D158(uint64_t a1, int a2)
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

uint64_t sub_23A25D1A0(uint64_t result, int a2, int a3)
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

void type metadata accessor for AsyncKeyedState()
{
  JUMPOUT(0x23B846C04);
}

uint64_t sub_23A25D1E8()
{
  return swift_allocateGenericValueMetadata();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_23A25D200(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_23A25D290(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A25D2DC + 4 * byte_23A276AFD[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23A25D310 + 4 * byte_23A276AF8[v4]))();
}

uint64_t sub_23A25D310(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A25D318(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A25D320);
  return result;
}

uint64_t sub_23A25D32C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A25D334);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23A25D338(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A25D340(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A25D34C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A25D354(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

uint64_t getEnumTagSinglePayload for JournalEncoder.Failure(unsigned int *a1, int a2)
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

uint64_t sub_23A25D3B0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A25D3F0 + 4 * byte_23A276B02[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A25D410 + 4 * byte_23A276B07[v4]))();
}

_BYTE *sub_23A25D3F0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A25D410(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A25D418(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A25D420(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A25D428(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A25D430(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23A25D43C()
{
  return 0;
}

uint64_t getEnumTagSinglePayload for SideEffectCollisionBehavior(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_23A25D4DC(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A25D528 + 4 * byte_23A276B11[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A25D55C + 4 * byte_23A276B0C[v4]))();
}

uint64_t sub_23A25D55C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A25D564(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A25D56CLL);
  return result;
}

uint64_t sub_23A25D578(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A25D580);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A25D584(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A25D58C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23A25D598(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

uint64_t sub_23A25D5A4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t getEnumTagSinglePayload for SideEffectDisposalBehavior(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_23A25D63C(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A25D688 + 4 * byte_23A276B1B[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A25D6BC + 4 * byte_23A276B16[v4]))();
}

uint64_t sub_23A25D6BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A25D6C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A25D6CCLL);
  return result;
}

uint64_t sub_23A25D6D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A25D6E0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A25D6E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A25D6EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_23A25D6F8()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D708()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D718()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D728()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D738()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D748()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D758()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D768()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D778()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D788()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D798()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D7A8()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D7B8()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D7C8()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D7D8()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D7E8()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D7F8()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D808()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D818()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D828()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D838()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A25D848()
{
  JUMPOUT(0x23B846C88);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B846C04](a1, v6, a5);
}

uint64_t sub_23A25D8C0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A275DA8();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23A25D96C()
{
  return sub_23A276180();
}

uint64_t sub_23A25D994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + qword_256957290) = a4;
  *(double *)(v10 + 16) = a5;
  v11 = v10 + qword_256957278;
  v12 = sub_23A275DA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v11, a1, v12);
  v13 = (_QWORD *)(v10 + qword_256957280);
  *v13 = a2;
  v13[1] = a3;
  *(_QWORD *)(v10 + qword_256957288) = 0;
  return v10;
}

uint64_t sub_23A25DA48()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = qword_256957288;
  v2 = *(void **)(v0 + qword_256957288);
  if (v2)
  {
    objc_msgSend(v2, sel_close);
    v3 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = 0;

  }
  v4 = v0 + qword_256957278;
  v5 = sub_23A275DA8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_23A25DAE8()
{
  sub_23A25DA48();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for JournalFileRecorder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JournalFileRecorder);
}

void **sub_23A25DB18(void **a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void sub_23A25DB44(id *a1)
{

}

void **sub_23A25DB4C(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a2;
  v4 = *a1;
  *a1 = *a2;
  v5 = v3;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **sub_23A25DB8C(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t sub_23A25DBBC(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t sub_23A25DC0C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t sub_23A25DC60(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_23A25DC78(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

uint64_t type metadata accessor for JournalFileRecorder.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JournalFileRecorder.State);
}

uint64_t sub_23A25DCA4(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 88);
}

uint64_t sub_23A25DCAC(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 96);
}

uint64_t sub_23A25DCB8(uint64_t a1, double a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v3 + 48) = v2;
  *(double *)(v3 + 40) = a2;
  *(_QWORD *)(v3 + 32) = a1;
  v4 = (_QWORD *)*v2;
  v5 = sub_23A276000();
  *(_QWORD *)(v3 + 56) = v5;
  *(_QWORD *)(v3 + 64) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 72) = swift_task_alloc();
  v6 = sub_23A275DA8();
  *(_QWORD *)(v3 + 80) = v6;
  *(_QWORD *)(v3 + 88) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v3 + 96) = swift_task_alloc();
  *(_QWORD *)(v3 + 104) = swift_task_alloc();
  v7 = v4[10];
  *(_QWORD *)(v3 + 112) = v7;
  *(_QWORD *)(v3 + 120) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v3 + 128) = swift_task_alloc();
  v8 = v4[11];
  *(_QWORD *)(v3 + 136) = v8;
  v9 = v4[12];
  *(_QWORD *)(v3 + 144) = v9;
  v10 = type metadata accessor for JournalEntry(0, v7, v8, v9);
  *(_QWORD *)(v3 + 152) = v10;
  *(_QWORD *)(v3 + 160) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v3 + 168) = swift_task_alloc();
  MEMORY[0x23B846C88](&unk_23A277894, v4);
  sub_23A276090();
  return swift_task_switch();
}

uint64_t sub_23A25DE14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69[2];

  v69[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(v0 + 168);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 152);
  v5 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 136);
  v6 = *(_QWORD *)(v0 + 112);
  v7 = *(_QWORD *)(v0 + 48);
  v8 = *(double *)(v0 + 40);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v0 + 120) + 16))(v5, *(_QWORD *)(v0 + 32), v6);
  sub_23A2609C0(v5, v6, v4, v2, v1, v8 - *(double *)(v7 + 16));
  sub_23A275D18();
  swift_allocObject();
  sub_23A275D0C();
  MEMORY[0x23B846C88](&unk_23A277A78, v3);
  v10 = sub_23A275D00();
  v12 = v11;
  v13 = *(_QWORD *)(v0 + 48);
  swift_release();
  v14 = *(void **)(v13 + qword_256957288);
  if (v14)
  {
    v16 = *(_QWORD *)(v0 + 64);
    v15 = *(_QWORD *)(v0 + 72);
    v17 = *(_QWORD *)(v0 + 56);
    v18 = v14;
    sub_23A275FF4();
    v19 = sub_23A275FDC();
    v21 = v20;
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    if (v21 >> 60 != 15)
    {
      sub_23A25E71C(v19, v21);
      sub_23A265CE0(v19, v21);
      sub_23A25E760(v19, v21);
      __asm { BR              X9 }
    }
    v23 = *(_QWORD *)(v0 + 160);
    v22 = *(_QWORD *)(v0 + 168);
    v24 = *(_QWORD *)(v0 + 152);
    sub_23A25E694();
    swift_allocError();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);

    sub_23A25E6D8(v10, v12);
  }
  else
  {
    v68 = qword_256957288;
    v25 = *(_QWORD *)(v0 + 48);
    v26 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v27 = v25 + qword_256957278;
    v28 = (void *)sub_23A275D6C();
    *(_QWORD *)(v0 + 16) = 0;
    v29 = objc_msgSend(v26, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v28, 1, 0, v0 + 16);

    v30 = *(void **)(v0 + 16);
    if (v29)
    {
      v67 = v13;
      v31 = *(_QWORD *)(v0 + 48);
      type metadata accessor for JournalFile(0, *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 144));
      v32 = v31 + qword_256957280;
      v33 = *(_QWORD *)(v31 + qword_256957280);
      v34 = *(_QWORD *)(v32 + 8);
      v35 = v30;
      sub_23A25E948(v27, v33, v34);
      if (qword_256956CD0 != -1)
        swift_once();
      v37 = *(_QWORD *)(v0 + 96);
      v36 = *(_QWORD *)(v0 + 104);
      v38 = *(_QWORD *)(v0 + 80);
      v39 = *(_QWORD *)(v0 + 88);
      v40 = sub_23A275E38();
      __swift_project_value_buffer(v40, (uint64_t)qword_25695AE10);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v37, v36, v38);
      v41 = sub_23A275E20();
      v42 = sub_23A276138();
      v43 = os_log_type_enabled(v41, v42);
      v44 = *(_QWORD *)(v0 + 96);
      v45 = *(_QWORD *)(v0 + 80);
      if (v43)
      {
        v65 = *(_QWORD *)(v0 + 88);
        v46 = (uint8_t *)swift_slowAlloc();
        v64 = swift_slowAlloc();
        v69[0] = v64;
        *(_DWORD *)v46 = 136315138;
        sub_23A25E798();
        v47 = sub_23A276360();
        *(_QWORD *)(v0 + 24) = sub_23A26B078(v47, v48, v69);
        sub_23A276198();
        swift_bridgeObjectRelease();
        v66 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
        v66(v44, v45);
        _os_log_impl(&dword_23A253000, v41, v42, "Opening journal stream at %s", v46, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B846D30](v64, -1, -1);
        MEMORY[0x23B846D30](v46, -1, -1);

      }
      else
      {
        v66 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 88) + 8);
        v66(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));

      }
      v53 = objc_allocWithZone(MEMORY[0x24BDBCF08]);
      v54 = (void *)sub_23A275D6C();
      v55 = objc_msgSend(v53, sel_initWithURL_append_, v54, 0);

      if (v55)
      {
        objc_msgSend(v55, sel_open);
        v56 = *(void **)(v67 + v68);
        *(_QWORD *)(v67 + v68) = v55;
        v57 = v55;

        sub_23A25E71C(v10, v12);
        sub_23A265CE0(v10, v12);
        sub_23A25E6D8(v10, v12);
        __asm { BR              X9 }
      }
      v59 = *(_QWORD *)(v0 + 160);
      v58 = *(_QWORD *)(v0 + 168);
      v60 = *(_QWORD *)(v0 + 152);
      v61 = *(_QWORD *)(v0 + 104);
      v62 = *(_QWORD *)(v0 + 80);
      v63 = type metadata accessor for JournalFileRecorder.Failure(0, *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 144));
      MEMORY[0x23B846C88](&unk_23A277940, v63);
      swift_allocError();
      swift_willThrow();
      sub_23A25E6D8(v10, v12);
      v66(v61, v62);
      (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v58, v60);
    }
    else
    {
      v50 = *(_QWORD *)(v0 + 160);
      v49 = *(_QWORD *)(v0 + 168);
      v51 = *(_QWORD *)(v0 + 152);
      v52 = v30;
      sub_23A275D48();

      swift_willThrow();
      sub_23A25E6D8(v10, v12);
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v49, v51);
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_23A25E694()
{
  unint64_t result;

  result = qword_2569573C8;
  if (!qword_2569573C8)
  {
    result = MEMORY[0x23B846C88](&unk_23A277F34, &type metadata for JournalEncoder.Failure);
    atomic_store(result, (unint64_t *)&qword_2569573C8);
  }
  return result;
}

uint64_t sub_23A25E6D8(uint64_t a1, unint64_t a2)
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

uint64_t sub_23A25E71C(uint64_t a1, unint64_t a2)
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

uint64_t sub_23A25E760(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23A25E6D8(a1, a2);
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t type metadata accessor for JournalFileRecorder.Failure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JournalFileRecorder.Failure);
}

unint64_t sub_23A25E798()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569573D0[0];
  if (!qword_2569573D0[0])
  {
    v1 = sub_23A275DA8();
    result = MEMORY[0x23B846C88](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, qword_2569573D0);
  }
  return result;
}

uint64_t sub_23A25E7E0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A25E820 + 4 * byte_23A2777D0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A25E840 + 4 * byte_23A2777D5[v4]))();
}

_BYTE *sub_23A25E820(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A25E840(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A25E848(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A25E850(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A25E858(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A25E860(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_23A25E86C()
{
  JUMPOUT(0x23B846C88);
}

uint64_t sub_23A25E880(uint64_t *a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;

  result = type metadata accessor for JournalMode();
  if (v3 <= 0x3F)
  {
    type metadata accessor for JournalFilePlayer(255, a1[10], a1[11], a1[12]);
    result = sub_23A27618C();
    if (v4 <= 0x3F)
    {
      result = swift_initClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t sub_23A25E948(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _QWORD v20[2];

  v5 = sub_23A275D54();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7, v8, v9);
  v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23A275DA8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12, v14, v15, v16);
  v18 = (char *)v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[0] = a2;
  v20[1] = a3;
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v11, *MEMORY[0x24BDCD7A0], v5);
  sub_23A25F900();
  sub_23A275D9C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  sub_23A275D78();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
}

uint64_t sub_23A25EA8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  swift_allocObject();
  return sub_23A25EB04(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_23A25EB04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  uint64_t v6;
  uint64_t v7;
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
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  void (*v43)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t *v44;
  uint64_t v45;
  int EnumCaseMultiPayload;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  pid_t v70;
  uint64_t v71;
  unint64_t v72;

  v7 = v6;
  v68 = a4;
  v13 = *(_QWORD *)(*(_QWORD *)v6 + 80);
  v14 = *(_QWORD *)(*(_QWORD *)v6 + 96);
  v65 = *(_QWORD *)(*(_QWORD *)v6 + 88);
  v66 = v13;
  v64 = v14;
  v15 = type metadata accessor for JournalFilePlayer(255, v13, v65, v14);
  v16 = sub_23A27618C();
  v57 = *(_QWORD *)(v16 - 8);
  v58 = v16;
  MEMORY[0x24BDAC7A8](v16, v17, v18, v19);
  v21 = (char *)&v55 - v20;
  v22 = sub_23A275D54();
  v60 = *(_QWORD *)(v22 - 8);
  v61 = v22;
  MEMORY[0x24BDAC7A8](v22, v23, v24, v25);
  v59 = (char *)&v55 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = sub_23A275DA8();
  v69 = *(_QWORD *)(v62 - 8);
  v30 = MEMORY[0x24BDAC7A8](v62, v27, v28, v29);
  v63 = (char *)&v55 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30, v32, v33, v34);
  v36 = (char *)&v55 - v35;
  v37 = type metadata accessor for JournalMode();
  MEMORY[0x24BDAC7A8](v37, v38, v39, v40);
  v42 = (char *)&v55 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v7 + qword_256957470) = 0;
  v43 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v43(v7 + *(_QWORD *)(*(_QWORD *)v7 + 136), 1, 1, v15);
  sub_23A260358(a1, v7 + qword_256957458);
  *(double *)(v7 + qword_256957460) = a5;
  v44 = (uint64_t *)(v7 + qword_256957468);
  v67 = a2;
  *v44 = a2;
  v44[1] = a3;
  v45 = a3;
  *(_QWORD *)(v7 + *(_QWORD *)(*(_QWORD *)v7 + 144)) = v68;
  sub_23A260358(a1, (uint64_t)v42);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      swift_bridgeObjectRetain();
      sub_23A2606A8(a1);
      v47 = (uint64_t)v63;
      (*(void (**)(char *, char *, uint64_t))(v69 + 32))(v63, v42, v62);
      sub_23A265144(v47, v67, v45, v66, v65, v64, (uint64_t)v21, a6 - a5);
      v43((uint64_t)v21, 0, 1, v15);
      v48 = v7 + *(_QWORD *)(*(_QWORD *)v7 + 136);
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v57 + 40))(v48, v21, v58);
      swift_endAccess();
    }
    else
    {
      sub_23A2606A8(a1);
    }
  }
  else
  {
    v68 = *(_QWORD *)&v42[*(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256957570) + 48)];
    v49 = v62;
    (*(void (**)(char *, char *, uint64_t))(v69 + 32))(v36, v42, v62);
    v71 = 0;
    v72 = 0xE000000000000000;
    v56 = a3;
    swift_bridgeObjectRetain();
    sub_23A276030();
    v70 = getpid();
    sub_23A276360();
    sub_23A276030();
    swift_bridgeObjectRelease();
    sub_23A276030();
    sub_23A276108();
    v51 = v59;
    v50 = v60;
    v52 = v61;
    (*(void (**)(char *, _QWORD, uint64_t))(v60 + 104))(v59, *MEMORY[0x24BDCD7A0], v61);
    sub_23A25F900();
    v53 = (uint64_t)v63;
    sub_23A275D9C();
    sub_23A2606A8(a1);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v52);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v36, v49);
    swift_bridgeObjectRelease();
    type metadata accessor for JournalFileRecorder(0, v66, v65, v64);
    *(_QWORD *)(v7 + qword_256957470) = sub_23A25D994(v53, v67, v56, v68, a5);
    swift_release();
  }
  return v7;
}

uint64_t **sub_23A25EF54()
{
  uint64_t **v0;
  uint64_t *v1;
  char *v2;
  uint64_t v3;

  v1 = *v0;
  sub_23A2606A8((uint64_t)v0 + qword_256957458);
  swift_bridgeObjectRelease();
  swift_release();
  v2 = (char *)v0 + (*v0)[17];
  type metadata accessor for JournalFilePlayer(255, v1[10], v1[11], v1[12]);
  v3 = sub_23A27618C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23A25EFFC()
{
  sub_23A25EF54();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for JournalFile(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JournalFile);
}

BOOL sub_23A25F02C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v10;

  v1 = type metadata accessor for JournalMode();
  MEMORY[0x24BDAC7A8](v1, v2, v3, v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A260358(v0 + qword_256957458, (uint64_t)v6);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v8 = sub_23A275DA8();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    sub_23A2606A8((uint64_t)v6);
  }
  return EnumCaseMultiPayload == 1;
}

uint64_t sub_23A25F0E4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
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
  uint64_t result;
  _QWORD *v18;
  uint64_t v19;

  v5 = *v2;
  v6 = *(_QWORD *)(*v2 + 80);
  v7 = *(_QWORD *)(*v2 + 88);
  v8 = *(_QWORD *)(*v2 + 96);
  v9 = type metadata accessor for JournalFilePlayer(0, v6, v7, v8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11, v12, v13);
  v15 = (char *)&v19 - v14;
  v16 = (uint64_t)v2 + *(_QWORD *)(v5 + 136);
  swift_beginAccess();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v16, 1, v9);
  if (!(_DWORD)result)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v15, v16, v9);
    v18 = (_QWORD *)swift_allocObject();
    v18[2] = v6;
    v18[3] = v7;
    v18[4] = v8;
    v18[5] = a1;
    v18[6] = a2;
    swift_retain();
    sub_23A2651E4((uint64_t)sub_23A25F8E0, (uint64_t)v18, v9);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
    return swift_release();
  }
  return result;
}

uint64_t sub_23A25F290@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v4 = v3;
  v8 = type metadata accessor for JournalMode();
  MEMORY[0x24BDAC7A8](v8, v9, v10, v11);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (uint64_t *)(v3 + *(_QWORD *)(*(_QWORD *)v3 + 144));
  swift_beginAccess();
  v15 = *v14;
  if (*(_QWORD *)(*v14 + 16) && (v16 = sub_23A25FAA4(a1), (v17 & 1) != 0))
    v18 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v16);
  else
    v18 = 0;
  result = swift_endAccess();
  if (__OFADD__(v18, 1))
  {
    __break(1u);
  }
  else
  {
    v33 = sub_23A276444();
    v34 = v20;
    sub_23A276030();
    v32 = v18 + 1;
    sub_23A276360();
    sub_23A276030();
    swift_bridgeObjectRelease();
    v21 = v34;
    v31 = v33;
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v32 = *v14;
    *v14 = 0x8000000000000000;
    sub_23A26022C(v18 + 1, a1, isUniquelyReferenced_nonNull_native);
    *v14 = v32;
    swift_bridgeObjectRelease();
    swift_endAccess();
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v25 = swift_getAssociatedConformanceWitness();
    v26 = type metadata accessor for JournalFile(0, AssociatedTypeWitness, AssociatedConformanceWitness, v25);
    sub_23A260358(v4 + qword_256957458, (uint64_t)v13);
    v27 = *(double *)(v4 + qword_256957460);
    v28 = *v14;
    swift_allocObject();
    swift_bridgeObjectRetain();
    v29 = sub_23A25EB04((uint64_t)v13, v31, v21, v28, v27, a3);
    a2[3] = v26;
    result = MEMORY[0x23B846C88](&unk_23A277A20, v26);
    a2[4] = result;
    *a2 = v29;
  }
  return result;
}

uint64_t sub_23A25F52C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t *v5;
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
  unint64_t v19;
  char *v20;
  uint64_t v22;

  v8 = *v5;
  v9 = *(_QWORD *)(*v5 + 80);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](a1, a2, a3, a4);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256957548);
  MEMORY[0x24BDAC7A8](v12, v13, v14, v15);
  v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_23A2760CC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v19 = (*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v20 = (char *)swift_allocObject();
  *((_QWORD *)v20 + 2) = 0;
  *((_QWORD *)v20 + 3) = 0;
  *((_QWORD *)v20 + 4) = v9;
  *((_QWORD *)v20 + 5) = *(_QWORD *)(v8 + 88);
  *((_QWORD *)v20 + 6) = *(_QWORD *)(v8 + 96);
  *((_QWORD *)v20 + 7) = v5;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v20[v19], (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  *(double *)&v20[(v11 + v19 + 7) & 0xFFFFFFFFFFFFFFF8] = a5;
  swift_retain();
  sub_23A273D3C((uint64_t)v17, (uint64_t)&unk_256957558, (uint64_t)v20);
  return swift_release();
}

uint64_t sub_23A25F69C(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  *(double *)(v6 + 32) = a1;
  *(_QWORD *)(v6 + 16) = a5;
  *(_QWORD *)(v6 + 24) = a6;
  return swift_task_switch();
}

uint64_t sub_23A25F6B8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + qword_256957470);
  *(_QWORD *)(v0 + 40) = v1;
  if (!v1)
    return (*(uint64_t (**)(void))(v0 + 8))();
  swift_retain();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  *v2 = v0;
  v2[1] = sub_23A25F740;
  return sub_23A25DCB8(*(_QWORD *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_23A25F740()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A25F7B4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  swift_release();
  if (qword_256956CD0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 56);
  v2 = sub_23A275E38();
  __swift_project_value_buffer(v2, (uint64_t)qword_25695AE10);
  sub_23A26884C(v1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

BOOL sub_23A25F838()
{
  return sub_23A25F02C();
}

uint64_t sub_23A25F85C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  return sub_23A25F290(a1, a2, a3);
}

uint64_t sub_23A25F87C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  return sub_23A25F52C(a1, a2, a3, a4, a5);
}

uint64_t sub_23A25F89C(uint64_t a1, uint64_t a2)
{
  return sub_23A25F0E4(a1, a2);
}

uint64_t sub_23A25F8BC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A25F8E0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 40))();
}

unint64_t sub_23A25F900()
{
  unint64_t result;

  result = qword_256957540;
  if (!qword_256957540)
  {
    result = MEMORY[0x23B846C88](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256957540);
  }
  return result;
}

uint64_t sub_23A25F944()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23A25F9C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = *(_QWORD *)(*(_QWORD *)(v0 + 32) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v0 + 56);
  v5 = v0 + v3;
  v6 = *(_QWORD *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_23A25FA5C;
  v7[4] = v6;
  v7[2] = v4;
  v7[3] = v5;
  return swift_task_switch();
}

uint64_t sub_23A25FA5C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_23A25FAA4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A2763CC();
  return sub_23A25FB04(a1, v2);
}

unint64_t sub_23A25FAD4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A2761E0();
  return sub_23A25FBA0(a1, v2);
}

unint64_t sub_23A25FB04(uint64_t a1, uint64_t a2)
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

unint64_t sub_23A25FBA0(uint64_t a1, uint64_t a2)
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
      sub_23A2606E4(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x23B846610](v9, a1);
      sub_23A260720((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_23A25FC64(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  char v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256957560);
  result = sub_23A276294();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v35 = a2;
    v34 = v3;
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v32 = -1 << v10;
    v33 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v18 = v17 | (v8 << 6);
      }
      else
      {
        v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v13)
          goto LABEL_31;
        v20 = v9[v19];
        ++v8;
        if (!v20)
        {
          v8 = v19 + 1;
          if (v19 + 1 >= v13)
            goto LABEL_31;
          v20 = v9[v8];
          if (!v20)
          {
            v21 = v19 + 2;
            if (v21 >= v13)
            {
LABEL_31:
              if ((v35 & 1) == 0)
              {
                result = swift_release();
                v3 = v34;
                goto LABEL_38;
              }
              if (v33 >= 64)
                bzero((void *)(v5 + 64), 8 * v13);
              else
                *v9 = v32;
              v3 = v34;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                v8 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_40;
                if (v8 >= v13)
                  goto LABEL_31;
                v20 = v9[v8];
                ++v21;
                if (v20)
                  goto LABEL_21;
              }
            }
            v8 = v21;
          }
        }
LABEL_21:
        v12 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      v22 = 8 * v18;
      v23 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v22);
      v24 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v22);
      result = sub_23A2763CC();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      v16 = 8 * v15;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v16) = v23;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v16) = v24;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

uint64_t sub_23A25FF08(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  _OWORD *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char v39;
  unint64_t v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256957568);
  v6 = sub_23A276294();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v44 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v23 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v24 = v23 | (v14 << 6);
      goto LABEL_22;
    }
    v25 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v11)
      break;
    v26 = (_QWORD *)(v5 + 64);
    v27 = *(_QWORD *)(v44 + 8 * v25);
    ++v14;
    if (!v27)
    {
      v14 = v25 + 1;
      if (v25 + 1 >= v11)
        goto LABEL_34;
      v27 = *(_QWORD *)(v44 + 8 * v14);
      if (!v27)
      {
        v28 = v25 + 2;
        if (v28 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v27 = *(_QWORD *)(v44 + 8 * v28);
        if (!v27)
        {
          while (1)
          {
            v14 = v28 + 1;
            if (__OFADD__(v28, 1))
              goto LABEL_43;
            if (v14 >= v11)
              goto LABEL_34;
            v27 = *(_QWORD *)(v44 + 8 * v14);
            ++v28;
            if (v27)
              goto LABEL_21;
          }
        }
        v14 = v28;
      }
    }
LABEL_21:
    v10 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v14 << 6);
LABEL_22:
    v29 = *(_QWORD *)(v5 + 48) + 40 * v24;
    if ((a2 & 1) != 0)
    {
      v30 = *(_OWORD *)v29;
      v31 = *(_OWORD *)(v29 + 16);
      v51 = *(_QWORD *)(v29 + 32);
      v49 = v30;
      v50 = v31;
      v32 = (__int128 *)(*(_QWORD *)(v5 + 56) + (v24 << 6));
      v34 = v32[2];
      v33 = v32[3];
      v35 = v32[1];
      v45 = *v32;
      v46 = v35;
      v47 = v34;
      v48 = v33;
    }
    else
    {
      sub_23A2606E4(v29, (uint64_t)&v49);
      sub_23A260984(*(_QWORD *)(v5 + 56) + (v24 << 6), (uint64_t)&v45);
    }
    result = sub_23A2761E0();
    v36 = -1 << *(_BYTE *)(v7 + 32);
    v37 = result & ~v36;
    v38 = v37 >> 6;
    if (((-1 << v37) & ~*(_QWORD *)(v12 + 8 * (v37 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v37) & ~*(_QWORD *)(v12 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v39 = 0;
      v40 = (unint64_t)(63 - v36) >> 6;
      do
      {
        if (++v38 == v40 && (v39 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v41 = v38 == v40;
        if (v38 == v40)
          v38 = 0;
        v39 |= v41;
        v42 = *(_QWORD *)(v12 + 8 * v38);
      }
      while (v42 == -1);
      v15 = __clz(__rbit64(~v42)) + (v38 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v7 + 48) + 40 * v15;
    v17 = v49;
    v18 = v50;
    *(_QWORD *)(v16 + 32) = v51;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    v19 = (_OWORD *)(*(_QWORD *)(v7 + 56) + (v15 << 6));
    v20 = v45;
    v21 = v46;
    v22 = v48;
    v19[2] = v47;
    v19[3] = v22;
    *v19 = v20;
    v19[1] = v21;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v26 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v43 = 1 << *(_BYTE *)(v5 + 32);
  if (v43 >= 64)
    bzero(v26, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v26 = -1 << v43;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23A26022C(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v4 = v3;
  v8 = *v3;
  v10 = sub_23A25FAA4(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_23A26051C();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      *(_QWORD *)(v16[7] + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v18 = 8 * v10;
    *(_QWORD *)(v16[6] + v18) = a2;
    *(_QWORD *)(v16[7] + v18) = a1;
    v19 = v16[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (!v20)
    {
      v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_23A25FC64(result, a3 & 1);
  result = sub_23A25FAA4(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23A276378();
  __break(1u);
  return result;
}

uint64_t sub_23A260358(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JournalMode();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A26039C(__int128 *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t result;
  unint64_t v18;
  char v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  _OWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  _OWORD v30[2];
  uint64_t v31;

  v4 = v3;
  v8 = *v3;
  v10 = sub_23A25FAD4(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_23A260754();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      return sub_23A260948((uint64_t)a1, v16[7] + (v10 << 6));
LABEL_11:
    result = sub_23A2606E4(a2, (uint64_t)v30);
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v20 = v16[6] + 40 * v10;
    v21 = v30[0];
    v22 = v30[1];
    *(_QWORD *)(v20 + 32) = v31;
    *(_OWORD *)v20 = v21;
    *(_OWORD *)(v20 + 16) = v22;
    v23 = (_OWORD *)(v16[7] + (v10 << 6));
    v24 = *a1;
    v25 = a1[1];
    v26 = a1[3];
    v23[2] = a1[2];
    v23[3] = v26;
    *v23 = v24;
    v23[1] = v25;
    v27 = v16[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v16[2] = v29;
      return result;
    }
    goto LABEL_14;
  }
  sub_23A25FF08(v13, a3 & 1);
  v18 = sub_23A25FAD4(a2);
  if ((v14 & 1) == (v19 & 1))
  {
    v10 = v18;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      return sub_23A260948((uint64_t)a1, v16[7] + (v10 << 6));
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23A276378();
  __break(1u);
  return result;
}

void *sub_23A26051C()
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
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256957560);
  v2 = *v0;
  v3 = sub_23A276288();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v21 = __clz(__rbit64(v19));
    v12 = (v19 - 1) & v19;
    v15 = v21 + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23A2606A8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for JournalMode();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A2606E4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_23A260720(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

void *sub_23A260754()
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
  unint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  _OWORD *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  _OWORD v28[4];
  _OWORD v29[2];
  uint64_t v30;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256957568);
  v2 = *v0;
  v3 = sub_23A276288();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    sub_23A2606E4(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v29);
    v17 = v15 << 6;
    result = (void *)sub_23A260984(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v28);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v29[1];
    v20 = v29[0];
    *(_QWORD *)(v18 + 32) = v30;
    *(_OWORD *)v18 = v20;
    *(_OWORD *)(v18 + 16) = v19;
    v21 = (_OWORD *)(*(_QWORD *)(v4 + 56) + v17);
    v22 = v28[0];
    v23 = v28[1];
    v24 = v28[3];
    v21[2] = v28[2];
    v21[3] = v24;
    *v21 = v22;
    v21[1] = v23;
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23A260948(uint64_t a1, uint64_t a2)
{
  assignWithTake for SideEffectRegistry.RegistryTask(a2, a1);
  return a2;
}

uint64_t sub_23A260984(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for SideEffectRegistry.RegistryTask(a2, a1);
  return a2;
}

uint64_t sub_23A2609C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>)
{
  uint64_t result;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a5, a1, a2);
  result = type metadata accessor for JournalEntry(0, a2, a3, a4);
  *(double *)(a5 + *(int *)(result + 44)) = a6;
  return result;
}

uint64_t type metadata accessor for JournalEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JournalEntry);
}

uint64_t sub_23A260A3C()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_23A260AB4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    *(_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t sub_23A260B64(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_23A260B74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_23A260BD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_23A260C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_23A260C88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_23A260CE4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 >= a2)
  {
    if (v5)
      return (*(uint64_t (**)(void))(v4 + 48))();
    return 0;
  }
  if (((((*(_QWORD *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
    v6 = 2;
  else
    v6 = a2 - v5 + 1;
  if (v6 >= 0x10000)
    v7 = 4;
  else
    v7 = 2;
  if (v6 < 0x100)
    v7 = 1;
  if (v6 >= 2)
    v8 = v7;
  else
    v8 = 0;
  return ((uint64_t (*)(void))((char *)&loc_23A260D54 + 4 * byte_23A277A40[v8]))();
}

void sub_23A260DAC(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 >= a3)
  {
    v11 = 0;
    if (a2 <= v7)
      goto LABEL_14;
  }
  else
  {
    v8 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v9 = v8 + 1;
    else
      v9 = 2;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    if (a2 <= v7)
LABEL_14:
      __asm { BR              X11 }
  }
  if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v12 = ~v7 + a2;
    bzero(a1, ((*(_QWORD *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v12;
  }
  __asm { BR              X10 }
}

void sub_23A260E94()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_23A260E9C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x23A260EA4);
}

void sub_23A260EC0()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_23A260EC8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
}

uint64_t sub_23A260ED0(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(v4 + v5) = 0;
  if (!a2)
    JUMPOUT(0x23A260ED8);
  return (*(uint64_t (**)(uint64_t))(v3 + 56))(v4);
}

uint64_t sub_23A260EF0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E6F69746361 && a2 == 0xE600000000000000;
  if (v3 || (sub_23A27636C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23A27636C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A260FD8(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6D617473656D6974;
  else
    return 0x6E6F69746361;
}

uint64_t sub_23A261010(_QWORD *a1, _QWORD *a2)
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
  char *v13;
  uint64_t v14;
  uint64_t v16[4];
  char v17;
  char v18;

  v4 = a2[2];
  v5 = a2[3];
  v16[0] = a2[4];
  v16[1] = v4;
  v6 = type metadata accessor for JournalEntry.CodingKeys(255, v4, v5, v16[0]);
  MEMORY[0x23B846C88](&unk_23A277BA0, v6);
  v7 = sub_23A276354();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9, v10, v11);
  v13 = (char *)v16 - v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A276414();
  v18 = 0;
  v14 = v16[3];
  sub_23A276348();
  if (!v14)
  {
    v17 = 1;
    sub_23A276330();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

uint64_t sub_23A26115C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
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
  char v47;
  char v48;

  v37 = a5;
  v39 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1, a2, a3, a4);
  v43 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for JournalEntry.CodingKeys(255, v10, v11, v12);
  MEMORY[0x23B846C88](&unk_23A277BA0, v13);
  v44 = sub_23A27630C();
  v42 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44, v14, v15, v16);
  v18 = (char *)&v36 - v17;
  v40 = a3;
  v41 = a2;
  v38 = type metadata accessor for JournalEntry(0, a2, a3, a4);
  v19 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38, v20, v21, v22);
  v24 = (char *)&v36 - v23;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v45 = v18;
  v25 = v46;
  sub_23A276408();
  if (v25)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v46 = v19;
  v26 = v38;
  v27 = v39;
  v28 = v24;
  v48 = 0;
  v29 = v43;
  v30 = v44;
  v31 = v41;
  sub_23A2762F4();
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v28, v29, v31);
  v47 = 1;
  sub_23A2762DC();
  v33 = v32;
  (*(void (**)(char *, uint64_t))(v42 + 8))(v45, v30);
  *(_QWORD *)&v28[*(int *)(v26 + 44)] = v33;
  v34 = v46;
  (*(void (**)(uint64_t, char *, uint64_t))(v46 + 16))(v37, v28, v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v28, v26);
}

BOOL sub_23A2613F0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23A256428(*a1, *a2);
}

uint64_t sub_23A261408()
{
  return sub_23A25652C();
}

uint64_t sub_23A26141C()
{
  return sub_23A256438();
}

uint64_t sub_23A261430()
{
  sub_23A2763D8();
  sub_23A256438();
  return sub_23A2763FC();
}

uint64_t sub_23A261478()
{
  char *v0;

  return sub_23A260FD8(*v0);
}

uint64_t sub_23A26148C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A260EF0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A2614BC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A2593A0();
  *a1 = result;
  return result;
}

uint64_t sub_23A2614EC(uint64_t a1)
{
  MEMORY[0x23B846C88](&unk_23A277BA0, a1);
  return sub_23A27642C();
}

uint64_t sub_23A261520(uint64_t a1)
{
  MEMORY[0x23B846C88](&unk_23A277BA0, a1);
  return sub_23A276438();
}

uint64_t sub_23A261554@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23A26115C(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_23A261574(_QWORD *a1, _QWORD *a2)
{
  return sub_23A261010(a1, a2);
}

uint64_t type metadata accessor for JournalEntry.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JournalEntry.CodingKeys);
}

uint64_t sub_23A261594(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A2615E0 + 4 * byte_23A277A54[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A261614 + 4 * byte_23A277A4F[v4]))();
}

uint64_t sub_23A261614(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A26161C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A261624);
  return result;
}

uint64_t sub_23A261630(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A261638);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A26163C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A261644(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_23A261650()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A261660()
{
  JUMPOUT(0x23B846C88);
}

void sub_23A261670()
{
  JUMPOUT(0x23B846C88);
}

uint64_t sub_23A261680()
{
  return swift_initClassMetadata2();
}

uint64_t sub_23A2616F8()
{
  return sub_23A276180();
}

uint64_t sub_23A261718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v10;

  v10 = swift_allocObject();
  sub_23A26178C(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t sub_23A26178C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v22;

  v6 = v5;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256957548);
  MEMORY[0x24BDAC7A8](v12, v13, v14, v15);
  v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A275D18();
  swift_allocObject();
  v18 = sub_23A275D0C();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  *(_QWORD *)(v5 + 32) = a3;
  *(double *)(v5 + 40) = a5;
  *(_QWORD *)(v5 + 48) = v18;
  *(_QWORD *)(v5 + 56) = a4;
  v19 = sub_23A2760CC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v17, 1, 1, v19);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = a1;
  v20[5] = a2;
  v20[6] = a3;
  swift_bridgeObjectRetain();
  sub_23A273D3C((uint64_t)v17, (uint64_t)&unk_256957748, (uint64_t)v20);
  swift_release();
  return v6;
}

uint64_t sub_23A2618B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  return swift_task_switch();
}

uint64_t sub_23A2618CC()
{
  uint64_t v0;
  sqlite3 *v1;
  uint64_t v3;
  unint64_t v4;

  v1 = *(sqlite3 **)(v0 + 24);
  v3 = 0;
  v4 = 0xE000000000000000;
  sub_23A2761F8();
  sub_23A276030();
  sub_23A276030();
  sub_23A276030();
  sub_23A271724(0, 0xE000000000000000, v1);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A261B2C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();

  return v0;
}

uint64_t sub_23A261B58()
{
  sub_23A261B2C();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for JournalDatabaseRecorder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JournalDatabaseRecorder);
}

uint64_t sub_23A261B88(uint64_t a1, double a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v3 + 88) = v2;
  *(double *)(v3 + 80) = a2;
  *(_QWORD *)(v3 + 72) = a1;
  v4 = *v2;
  *(_QWORD *)(v3 + 96) = *v2;
  v5 = *(_QWORD *)(v4 + 80);
  *(_QWORD *)(v3 + 104) = v5;
  *(_QWORD *)(v3 + 112) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 120) = swift_task_alloc();
  *(_QWORD *)(v3 + 128) = swift_task_alloc();
  sub_23A276000();
  *(_QWORD *)(v3 + 136) = swift_task_alloc();
  MEMORY[0x23B846C88](&unk_23A277CC4, v4);
  sub_23A276090();
  return swift_task_switch();
}

uint64_t sub_23A261C50()
{
  uint64_t v0;
  sqlite3 *v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t inited;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  double *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  sqlite3 *v20;
  uint64_t v21;
  _QWORD v22[2];

  v1 = *(sqlite3 **)(*(_QWORD *)(v0 + 88) + 16);
  sub_23A271724(0x6E69676562, 0xE500000000000000, v1);
  v3 = sub_23A275D00();
  v5 = v4;
  v20 = v1;
  sub_23A275FF4();
  v6 = sub_23A275FE8();
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)(v0 + 88);
    v10 = *(double *)(v0 + 80);
    v21 = v6;
    sub_23A2761F8();
    swift_bridgeObjectRelease();
    HIWORD(v22[1]) = -4864;
    swift_bridgeObjectRetain();
    sub_23A276030();
    swift_bridgeObjectRelease();
    sub_23A276030();
    v18 = v22[1];
    v19 = v22[0];
    __swift_instantiateConcreteTypeFromMangledName(&qword_256957728);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23A277C00;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256957730);
    v12 = *(_QWORD *)(type metadata accessor for DatabaseBinding() - 8);
    v13 = *(_QWORD *)(v12 + 72);
    v14 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_23A277C10;
    v16 = (double *)(v15 + v14);
    *v16 = v10 - *(double *)(v9 + 40);
    swift_storeEnumTagMultiPayload();
    v17 = (uint64_t *)((char *)v16 + v13);
    *v17 = v21;
    v17[1] = v8;
    swift_storeEnumTagMultiPayload();
    *(_QWORD *)(inited + 32) = v15;
    sub_23A2717E4(v19, v18, inited, v20);
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256957738);
    swift_arrayDestroy();
    swift_bridgeObjectRelease();
    sub_23A271724(0x74696D6D6F63, 0xE600000000000000, v20);
  }
  else
  {
    sub_23A271724(0x6B6361626C6C6F72, 0xE800000000000000, v1);
  }
  sub_23A25E6D8(v3, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A262194()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A2621C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v5;

  v5 = *(_OWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_23A25FA5C;
  *(_QWORD *)(v3 + 40) = v2;
  *(_OWORD *)(v3 + 24) = v5;
  return swift_task_switch();
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalMode(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v13 = sub_23A275DA8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(a1, a2, v13);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v8 = sub_23A275DA8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256957570) + 48);
      v10 = *(void **)((char *)a2 + v9);
      *(uint64_t *)((char *)a1 + v9) = (uint64_t)v10;
      v11 = v10;
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void destroy for JournalMode(uint64_t a1)
{
  int EnumCaseMultiPayload;
  uint64_t v3;
  uint64_t v4;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v4 = sub_23A275DA8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else if (!EnumCaseMultiPayload)
  {
    v3 = sub_23A275DA8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);

  }
}

char *initializeWithCopy for JournalMode(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v11 = sub_23A275DA8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_23A275DA8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256957570) + 48);
    v9 = *(void **)&a2[v8];
    *(_QWORD *)&a1[v8] = v9;
    v10 = v9;
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithCopy for JournalMode(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;

  if (a1 != a2)
  {
    sub_23A2606A8((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v11 = sub_23A275DA8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_23A275DA8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256957570) + 48);
      v9 = *(void **)&a2[v8];
      *(_QWORD *)&a1[v8] = v9;
      v10 = v9;
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t type metadata accessor for JournalMode()
{
  uint64_t result;

  result = qword_2569577C0;
  if (!qword_2569577C0)
    return swift_getSingletonMetadata();
  return result;
}

char *initializeWithTake for JournalMode(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v9 = sub_23A275DA8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_23A275DA8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_256957570);
    *(_QWORD *)&a1[*(int *)(v8 + 48)] = *(_QWORD *)&a2[*(int *)(v8 + 48)];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithTake for JournalMode(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sub_23A2606A8((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v9 = sub_23A275DA8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_23A275DA8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      v8 = __swift_instantiateConcreteTypeFromMangledName(qword_256957570);
      *(_QWORD *)&a1[*(int *)(v8 + 48)] = *(_QWORD *)&a2[*(int *)(v8 + 48)];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalMode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for JournalMode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23A2627B4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23A2627C4()
{
  uint64_t result;
  unint64_t v1;
  uint64_t v2;
  _QWORD v3[6];

  result = sub_23A275DA8();
  if (v1 <= 0x3F)
  {
    v2 = *(_QWORD *)(result - 8) + 64;
    swift_getTupleTypeLayout2();
    v3[4] = v3;
    v3[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_23A26284C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_23A2628C4(uint64_t a1, void *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, double a8)
{
  swift_allocObject();
  return sub_23A262954(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_23A262954(uint64_t a1, void *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, double a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t *v14;
  double v15;
  __int128 v16;
  uint64_t v17;
  _OWORD v20[2];
  uint64_t v21;

  v9 = v8;
  v14 = *(uint64_t **)v9;
  *(_QWORD *)(v9 + 40) = a1;
  *(_QWORD *)(v9 + 48) = a2;
  *(_BYTE *)(v9 + 56) = a3;
  *(double *)(v9 + 32) = a7;
  *(_QWORD *)(v9 + 16) = a4;
  *(_QWORD *)(v9 + 24) = a5;
  *(_QWORD *)(v9 + 112) = a6;
  if (a3)
  {
    if (a3 == 1)
    {
      *(_QWORD *)(v9 + 64) = 0;
      v15 = a8 - a7;
      swift_bridgeObjectRetain();
      sub_23A264198(a1, a4, a5, (uint64_t)v20, v15);
      v16 = v20[1];
      v17 = v21;
      *(_OWORD *)(v9 + 72) = v20[0];
      *(_OWORD *)(v9 + 88) = v16;
      *(_QWORD *)(v9 + 104) = v17;
    }
    else
    {
      *(_OWORD *)(v9 + 80) = 0u;
      *(_OWORD *)(v9 + 96) = 0u;
      *(_OWORD *)(v9 + 64) = 0u;
    }
  }
  else
  {
    type metadata accessor for JournalDatabaseRecorder(0, v14[10], v14[11], v14[12]);
    swift_bridgeObjectRetain();
    sub_23A262B14(a1, a2, 0);
    *(_QWORD *)(v9 + 64) = sub_23A261718(a1, a4, a5, (uint64_t)a2, a7);
    *(_OWORD *)(v9 + 72) = 0u;
    *(_OWORD *)(v9 + 88) = 0u;
    *(_QWORD *)(v9 + 104) = 0;
  }
  return v9;
}

uint64_t sub_23A262A9C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_23A262B34(*(_QWORD *)(v0 + 40), *(void **)(v0 + 48), *(_BYTE *)(v0 + 56));
  swift_release();
  sub_23A263844(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23A262AE4()
{
  sub_23A262A9C();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for JournalDatabase(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JournalDatabase);
}

id sub_23A262B14(uint64_t a1, void *a2, char a3)
{
  id result;

  if (!a3)
    return a2;
  return result;
}

void destroy for JournalDatabaseMode(uint64_t a1)
{
  sub_23A262B34(*(_QWORD *)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_23A262B34(uint64_t a1, void *a2, char a3)
{
  if (!a3)

}

uint64_t _s8DataFlow19JournalDatabaseModeOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23A262B14(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for JournalDatabaseMode(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23A262B14(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23A262B34(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for JournalDatabaseMode(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  void *v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_23A262B34(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalDatabaseMode(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for JournalDatabaseMode(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_23A262CC4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_23A262CDC(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for JournalDatabaseMode()
{
  return &type metadata for JournalDatabaseMode;
}

BOOL sub_23A262D04()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + 56) == 1;
}

uint64_t sub_23A262D14(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  sqlite3 *v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v8 = type metadata accessor for JournalMode();
  MEMORY[0x24BDAC7A8](v8, v9, v10, v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A260358(a1, (uint64_t)v13);
  v14 = sub_23A263948((uint64_t)v13);
  v16 = v15;
  v18 = v17;
  v19 = sub_23A263874(MEMORY[0x24BEE4AF8]);
  swift_allocObject();
  v20 = sub_23A262954((uint64_t)v14, v16, v18, a2, a3, v19, a4, a4);
  sub_23A2606A8(a1);
  return v20;
}

uint64_t sub_23A26300C(uint64_t result, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  if (v2[11])
  {
    v4 = result;
    v5 = (_QWORD *)*v2;
    v6 = (_QWORD *)swift_allocObject();
    v7 = v5[10];
    v6[2] = v7;
    v8 = v5[11];
    v6[3] = v8;
    v9 = v5[12];
    v6[4] = v9;
    v6[5] = v4;
    v6[6] = a2;
    v10 = (_QWORD *)type metadata accessor for JournalDatabasePlayer(0, v7, v8, v9);
    swift_retain();
    sub_23A264208((uint64_t)sub_23A25F8E0, (uint64_t)v6, v10);
    return swift_release();
  }
  return result;
}

uint64_t sub_23A263140@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = v3;
  swift_beginAccess();
  v8 = *(_QWORD *)(v3 + 112);
  if (*(_QWORD *)(v8 + 16) && (v9 = sub_23A25FAA4(a1), (v10 & 1) != 0))
    v11 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v9);
  else
    v11 = 0;
  result = swift_endAccess();
  if (__OFADD__(v11, 1))
  {
    __break(1u);
  }
  else
  {
    v26 = sub_23A276444();
    v27 = v13;
    sub_23A276030();
    sub_23A276360();
    sub_23A276030();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = *(_QWORD *)(v4 + 112);
    *(_QWORD *)(v4 + 112) = 0x8000000000000000;
    sub_23A26022C(v11 + 1, a1, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v4 + 112) = v25;
    swift_bridgeObjectRelease();
    swift_endAccess();
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v17 = swift_getAssociatedConformanceWitness();
    v18 = type metadata accessor for JournalDatabase(0, AssociatedTypeWitness, AssociatedConformanceWitness, v17);
    v19 = *(_QWORD *)(v4 + 40);
    v20 = *(void **)(v4 + 48);
    v21 = *(double *)(v4 + 32);
    v22 = *(_QWORD *)(v4 + 112);
    v23 = *(_BYTE *)(v4 + 56);
    sub_23A262B14(v19, v20, v23);
    swift_allocObject();
    swift_bridgeObjectRetain();
    v24 = sub_23A262954(v19, v20, v23, v26, v27, v22, v21, a3);
    a2[3] = v18;
    result = MEMORY[0x23B846C88](&unk_23A277E04, v18);
    a2[4] = result;
    *a2 = v24;
  }
  return result;
}

uint64_t sub_23A2633A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t *v5;
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
  unint64_t v19;
  char *v20;
  uint64_t v22;

  v8 = *v5;
  v9 = *(_QWORD *)(*v5 + 80);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](a1, a2, a3, a4);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256957548);
  MEMORY[0x24BDAC7A8](v12, v13, v14, v15);
  v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_23A2760CC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v19 = (*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v20 = (char *)swift_allocObject();
  *((_QWORD *)v20 + 2) = 0;
  *((_QWORD *)v20 + 3) = 0;
  *((_QWORD *)v20 + 4) = v9;
  *((_QWORD *)v20 + 5) = *(_QWORD *)(v8 + 88);
  *((_QWORD *)v20 + 6) = *(_QWORD *)(v8 + 96);
  *((_QWORD *)v20 + 7) = v5;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v20[v19], (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  *(double *)&v20[(v11 + v19 + 7) & 0xFFFFFFFFFFFFFFF8] = a5;
  swift_retain();
  sub_23A273D3C((uint64_t)v17, (uint64_t)&unk_2569578C8, (uint64_t)v20);
  return swift_release();
}

uint64_t sub_23A263510(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  *(double *)(v6 + 32) = a1;
  *(_QWORD *)(v6 + 16) = a5;
  *(_QWORD *)(v6 + 24) = a6;
  return swift_task_switch();
}

uint64_t sub_23A26352C()
{
  uint64_t v0;
  _QWORD *v1;

  if (!*(_QWORD *)(*(_QWORD *)(v0 + 16) + 64))
    return (*(uint64_t (**)(void))(v0 + 8))();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_23A26359C;
  return sub_23A261B88(*(_QWORD *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_23A26359C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A263608()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  if (qword_256956CD0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 48);
  v2 = sub_23A275E38();
  __swift_project_value_buffer(v2, (uint64_t)qword_25695AE10);
  sub_23A26884C(v1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

BOOL sub_23A263684()
{
  return sub_23A262D04();
}

uint64_t sub_23A2636A8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  return sub_23A263140(a1, a2, a3);
}

uint64_t sub_23A2636C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  return sub_23A2633A0(a1, a2, a3, a4, a5);
}

uint64_t sub_23A2636E8(uint64_t a1, uint64_t a2)
{
  return sub_23A26300C(a1, a2);
}

uint64_t sub_23A263708()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A26372C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23A2637AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = *(_QWORD *)(*(_QWORD *)(v0 + 32) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v0 + 56);
  v5 = v0 + v3;
  v6 = *(_QWORD *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_23A25FA5C;
  v7[4] = v6;
  v7[2] = v4;
  v7[3] = v5;
  return swift_task_switch();
}

uint64_t sub_23A263844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

unint64_t sub_23A263874(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t *i;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256957560);
    v3 = (_QWORD *)sub_23A2762A0();
    for (i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      v5 = *(i - 1);
      v6 = *i;
      result = sub_23A25FAA4(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      v9 = 8 * result;
      *(_QWORD *)(v3[6] + v9) = v5;
      *(_QWORD *)(v3[7] + v9) = v6;
      v10 = v3[2];
      v11 = __OFADD__(v10, 1);
      v12 = v10 + 1;
      if (v11)
        goto LABEL_10;
      v3[2] = v12;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

sqlite3 *sub_23A263948(uint64_t a1)
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
  char *v14;
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
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  int EnumCaseMultiPayload;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  sqlite3 *v48;
  sqlite3 *v49;
  char *v50;
  uint64_t v51;
  void (*v52)(char *, _QWORD, uint64_t);
  sqlite3 *v53;
  void (*v54)(char *, uint64_t);
  sqlite3 *v55;
  id v56;
  void *v57;
  unsigned int v58;
  char *v59;
  sqlite3 *v60;
  id v61;
  id v62;
  void *v63;
  uint64_t v64;
  void *v65;
  sqlite3 *v66;
  void (*v67)(sqlite3 *, sqlite3 *);
  char *v68;
  sqlite3 *v69;
  id v70;
  void (*v71)(char *, uint64_t);
  void (*v72)(sqlite3 *, sqlite3 *);
  id v74;
  sqlite3 *v75;
  sqlite3 *v76;
  sqlite3 *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  pid_t v82;
  id v83[3];

  v83[2] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_23A275D54();
  v78 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v3, v4, v5);
  v7 = (char *)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23A275DA8();
  v80 = *(_QWORD *)(v8 - 8);
  v12 = MEMORY[0x24BDAC7A8](v8, v9, v10, v11);
  v14 = (char *)&v74 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v12, v15, v16, v17);
  v20 = (char *)&v74 - v19;
  v24 = MEMORY[0x24BDAC7A8](v18, v21, v22, v23);
  v77 = (sqlite3 *)((char *)&v74 - v25);
  v29 = MEMORY[0x24BDAC7A8](v24, v26, v27, v28);
  v76 = (sqlite3 *)((char *)&v74 - v30);
  MEMORY[0x24BDAC7A8](v29, v31, v32, v33);
  v35 = (char *)&v74 - v34;
  v36 = type metadata accessor for JournalMode();
  MEMORY[0x24BDAC7A8](v36, v37, v38, v39);
  v41 = (char *)&v74 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = a1;
  sub_23A260358(a1, (uint64_t)v41);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v43 = v80;
      (*(void (**)(char *, char *, uint64_t))(v80 + 32))(v20, v41, v8);
      strcpy((char *)v83, "action.journal");
      HIBYTE(v83[1]) = -18;
      v44 = v78;
      (*(void (**)(char *, _QWORD, uint64_t))(v78 + 104))(v7, *MEMORY[0x24BDCD798], v2);
      sub_23A25F900();
      sub_23A275D9C();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v7, v2);
      swift_bridgeObjectRelease();
      v45 = (void *)sub_23A275D90();
      v46 = v79;
      v48 = sub_23A271EE0(v45, v47, 1);
      if (v46)
      {
        swift_bridgeObjectRelease();
        sub_23A2606A8(v81);
        v49 = *(sqlite3 **)(v43 + 8);
        ((void (*)(char *, uint64_t))v49)(v14, v8);
        ((void (*)(char *, uint64_t))v49)(v20, v8);
      }
      else
      {
        v49 = v48;
        swift_bridgeObjectRelease();
        sub_23A2606A8(v81);
        v71 = *(void (**)(char *, uint64_t))(v43 + 8);
        v71(v14, v8);
        v71(v20, v8);
      }
    }
    else
    {
      sub_23A2606A8(v81);
      return 0;
    }
  }
  else
  {
    v74 = *(id *)&v41[*(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256957570) + 48)];
    v75 = (sqlite3 *)v8;
    v50 = v35;
    (*(void (**)(char *, char *, uint64_t))(v80 + 32))(v35, v41, v8);
    v83[0] = 0;
    v83[1] = (id)0xE000000000000000;
    sub_23A276030();
    v82 = getpid();
    sub_23A276360();
    sub_23A276030();
    swift_bridgeObjectRelease();
    sub_23A276030();
    sub_23A276108();
    v51 = v78;
    v52 = *(void (**)(char *, _QWORD, uint64_t))(v78 + 104);
    v52(v7, *MEMORY[0x24BDCD7A0], v2);
    sub_23A25F900();
    v53 = v76;
    sub_23A275D9C();
    v54 = *(void (**)(char *, uint64_t))(v51 + 8);
    v54(v7, v2);
    swift_bridgeObjectRelease();
    strcpy((char *)v83, "action.journal");
    HIBYTE(v83[1]) = -18;
    v52(v7, *MEMORY[0x24BDCD798], v2);
    v55 = v77;
    sub_23A275D9C();
    v54(v7, v2);
    swift_bridgeObjectRelease();
    v56 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v57 = (void *)sub_23A275D6C();
    v83[0] = 0;
    v58 = objc_msgSend(v56, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v57, 1, 0, v83);

    v59 = v50;
    if (v58)
    {
      v61 = v74;
      v60 = v75;
      v62 = v83[0];
      v49 = v55;
      v63 = (void *)sub_23A275D90();
      v64 = v79;
      v66 = sub_23A271EE0(v63, v65, 1);
      if (!v64)
      {
        v49 = v66;
        swift_bridgeObjectRelease();
        sub_23A2606A8(v81);
        v72 = *(void (**)(sqlite3 *, sqlite3 *))(v80 + 8);
        v72(v55, v60);
        v72(v53, v60);
        v72((sqlite3 *)v59, v60);
        return v49;
      }

      swift_bridgeObjectRelease();
      sub_23A2606A8(v81);
      v67 = *(void (**)(sqlite3 *, sqlite3 *))(v80 + 8);
      v67(v55, v60);
      v67(v53, v60);
      v68 = v59;
      v69 = v60;
    }
    else
    {
      v70 = v83[0];
      sub_23A275D48();

      swift_willThrow();
      sub_23A2606A8(v81);
      v67 = *(void (**)(sqlite3 *, sqlite3 *))(v80 + 8);
      v49 = v75;
      v67(v55, v75);
      v67(v53, v49);
      v68 = v50;
      v69 = v49;
    }
    v67((sqlite3 *)v68, v69);
  }
  return v49;
}

uint64_t initializeBufferWithCopyOfBuffer for SideEffectRegistry.RegistryTask(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_23A263FA4()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_23A263FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *sub_23A264010(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_23A264098(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t sub_23A2640EC(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_23A264134(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for JournalDatabasePlayer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JournalDatabasePlayer);
}

uint64_t sub_23A264188(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 24);
}

uint64_t sub_23A264190(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 32);
}

uint64_t sub_23A264198@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t result;

  sub_23A275CF4();
  swift_allocObject();
  result = sub_23A275CE8();
  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 16) = a3;
  *(double *)(a4 + 24) = a5;
  *(_QWORD *)(a4 + 32) = result;
  return result;
}

uint64_t sub_23A264208(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  sqlite3 **v3;
  sqlite3 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[16];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  sqlite3 **v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v20 = 0;
  v21 = 0xE000000000000000;
  sub_23A2761F8();
  v5 = *v3;
  swift_bridgeObjectRelease();
  v20 = 0x2A205443454C4553;
  v21 = 0xEF60204D4F524620;
  swift_bridgeObjectRetain();
  sub_23A276030();
  swift_bridgeObjectRelease();
  sub_23A276030();
  v6 = a3[3];
  v16 = a3[2];
  v17 = v6;
  v18 = a3[4];
  v19 = v3;
  v7 = type metadata accessor for JournalEntry(0, v16, v6, v18);
  v8 = v22;
  v9 = sub_23A271B98(0x2A205443454C4553, 0xEF60204D4F524620, MEMORY[0x24BEE4AF8], (void (*)(sqlite3_stmt *))sub_23A264630, (uint64_t)v15, v5, v7);
  result = swift_bridgeObjectRelease();
  if (!v8)
  {
    v20 = v9;
    MEMORY[0x24BDAC7A8](result, v11, v12, v13);
    v14 = sub_23A276084();
    MEMORY[0x23B846C88](MEMORY[0x24BEE12C8], v14);
    sub_23A276060();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23A2643DC@<X0>(sqlite3_stmt *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
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
  double v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v39 = a4;
  v36 = a6;
  v37 = a2;
  v9 = *(_QWORD *)(a3 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1, a2, a3, a4);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v13, v14, v15);
  v17 = (char *)&v34 - v16;
  v18 = sub_23A276000();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18, v20, v21, v22);
  v24 = (char *)&v34 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sqlite3_column_type(a1, 0) == 5)
  {
    sub_23A264BC4();
    swift_allocError();
    *(_DWORD *)v25 = 0;
LABEL_14:
    *(_BYTE *)(v25 + 4) = 0;
    return swift_willThrow();
  }
  v35 = a5;
  v26 = sqlite3_column_double(a1, 0);
  if (sqlite3_column_type(a1, 1) == 5 || !sqlite3_column_text(a1, 1))
  {
    sub_23A264BC4();
    swift_allocError();
    *(_DWORD *)v25 = 1;
    goto LABEL_14;
  }
  sub_23A276048();
  sub_23A275FF4();
  v34 = sub_23A275FDC();
  v28 = v27;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v24, v18);
  if (v28 >> 60 == 15)
    v29 = 0;
  else
    v29 = v34;
  if (v28 >> 60 == 15)
    v30 = 0xC000000000000000;
  else
    v30 = v28;
  v31 = v38;
  v32 = v39;
  sub_23A275CDC();
  result = sub_23A25E6D8(v29, v30);
  if (!v31)
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v17, a3);
    return sub_23A2609C0((uint64_t)v12, a3, v32, v35, v36, v26);
  }
  return result;
}

uint64_t sub_23A264630@<X0>(sqlite3_stmt *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_23A2643DC(a1, v2[5], v2[2], v2[3], v2[4], a2);
}

uint64_t sub_23A26464C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
  uint64_t v37;
  char *v38;
  double v39;
  char *v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  void *v50;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD aBlock[7];

  v55 = a6;
  v56 = a7;
  v54 = a5;
  v60 = a3;
  v61 = a4;
  v58 = a2;
  v64 = sub_23A275EEC();
  v67 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64, v11, v12, v13);
  v63 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A275F04();
  v65 = *(_QWORD *)(v15 - 8);
  v66 = v15;
  MEMORY[0x24BDAC7A8](v15, v16, v17, v18);
  v62 = (char *)&v52 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for JournalEntry(0, a5, a6, a7);
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20, v22, v23, v24);
  v53 = (char *)&v52 - v25;
  v26 = sub_23A275F1C();
  v27 = *(_QWORD *)(v26 - 8);
  v59 = v26;
  v31 = MEMORY[0x24BDAC7A8](v26, v28, v29, v30);
  v33 = (char *)&v52 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31, v34, v35, v36);
  v38 = (char *)&v52 - v37;
  if (*(double *)(a1 + *(int *)(v20 + 44)) - *(double *)(v58 + 24) > 0.0)
    v39 = *(double *)(a1 + *(int *)(v20 + 44)) - *(double *)(v58 + 24);
  else
    v39 = 0.0;
  sub_23A2649D0();
  v57 = sub_23A276168();
  sub_23A275F10();
  MEMORY[0x23B84634C](v33, v39);
  v58 = *(_QWORD *)(v27 + 8);
  ((void (*)(char *, uint64_t))v58)(v33, v26);
  v40 = v53;
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v53, a1, v20);
  v41 = (*(unsigned __int8 *)(v21 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v42 = (char *)swift_allocObject();
  v43 = v55;
  *((_QWORD *)v42 + 2) = v54;
  *((_QWORD *)v42 + 3) = v43;
  v44 = v60;
  v45 = v61;
  *((_QWORD *)v42 + 4) = v56;
  *((_QWORD *)v42 + 5) = v44;
  *((_QWORD *)v42 + 6) = v45;
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(&v42[v41], v40, v20);
  aBlock[4] = sub_23A264A8C;
  aBlock[5] = v42;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A265680;
  aBlock[3] = &block_descriptor;
  v46 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v47 = v62;
  sub_23A275EF8();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_23A264AEC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256957990);
  sub_23A264B34();
  v49 = v63;
  v48 = v64;
  sub_23A2761C8();
  v50 = (void *)v57;
  MEMORY[0x23B846580](v38, v47, v49, v46);
  _Block_release(v46);

  (*(void (**)(char *, uint64_t))(v67 + 8))(v49, v48);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v47, v66);
  return ((uint64_t (*)(char *, uint64_t))v58)(v38, v59);
}

uint64_t sub_23A2649B0(uint64_t a1)
{
  uint64_t *v1;

  return sub_23A26464C(a1, v1[5], v1[6], v1[7], v1[2], v1[3], v1[4]);
}

unint64_t sub_23A2649D0()
{
  unint64_t result;

  result = qword_256957980;
  if (!qword_256957980)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256957980);
  }
  return result;
}

uint64_t sub_23A264A0C()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *((_QWORD *)v0 + 2);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for JournalEntry(0, v1, *((_QWORD *)v0 + 3), *((_QWORD *)v0 + 4))- 8)+ 80);
  v3 = (v2 + 56) & ~v2;
  swift_release();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(&v0[v3], v1);
  return swift_deallocObject();
}

uint64_t sub_23A264A8C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for JournalEntry(0, *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32))- 8)+ 80);
  return (*(uint64_t (**)(uint64_t))(v0 + 40))(v0 + ((v1 + 56) & ~v1));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_23A264AEC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256957988;
  if (!qword_256957988)
  {
    v1 = sub_23A275EEC();
    result = MEMORY[0x23B846C88](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_256957988);
  }
  return result;
}

unint64_t sub_23A264B34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256957998;
  if (!qword_256957998)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256957990);
    result = MEMORY[0x23B846C88](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_256957998);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B846C7C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23A264BC4()
{
  unint64_t result;

  result = qword_2569579A0;
  if (!qword_2569579A0)
  {
    result = MEMORY[0x23B846C88](&unk_23A2780B0, &type metadata for DatabaseRow.Failure);
    atomic_store(result, (unint64_t *)&qword_2569579A0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for JournalEncoder.Failure(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A264C48 + 4 * asc_23A277EA8[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A264C68 + 4 * byte_23A277EAD[v4]))();
}

_BYTE *sub_23A264C48(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A264C68(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A264C70(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A264C78(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A264C80(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A264C88(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for JournalEncoder.Failure()
{
  return &type metadata for JournalEncoder.Failure;
}

unint64_t sub_23A264CA8()
{
  unint64_t result;

  result = qword_2569579A8[0];
  if (!qword_2569579A8[0])
  {
    result = MEMORY[0x23B846C88](&unk_23A277F0C, &type metadata for JournalEncoder.Failure);
    atomic_store(result, qword_2569579A8);
  }
  return result;
}

uint64_t sub_23A264CEC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A275DA8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_23A264D6C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
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
    v7 = sub_23A275DA8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 44);
    v9 = *(int *)(a3 + 48);
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_23A264E08(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A275DA8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A264E50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  v6 = sub_23A275DA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 44);
  v8 = *(int *)(a3 + 48);
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23A264EC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_23A275DA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 44);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(a3 + 48)) = *(_QWORD *)(a2 + *(int *)(a3 + 48));
  return a1;
}

uint64_t sub_23A264F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23A275DA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 48);
  *(_OWORD *)(a1 + *(int *)(a3 + 44)) = *(_OWORD *)(a2 + *(int *)(a3 + 44));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_23A264FAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_23A275DA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 44);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(a3 + 48)) = *(_QWORD *)(a2 + *(int *)(a3 + 48));
  return a1;
}

uint64_t sub_23A265024()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A265030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23A275DA8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 44) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_23A2650B0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A2650BC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23A275DA8();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 44) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for JournalFilePlayer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JournalFilePlayer);
}

uint64_t sub_23A265144@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>, double a8@<D0>)
{
  uint64_t v16;
  uint64_t result;
  _QWORD *v18;

  v16 = sub_23A275DA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(a7, a1, v16);
  result = type metadata accessor for JournalFilePlayer(0, a4, a5, a6);
  v18 = (_QWORD *)(a7 + *(int *)(result + 44));
  *v18 = a2;
  v18[1] = a3;
  *(double *)(a7 + *(int *)(result + 48)) = a8;
  return result;
}

uint64_t sub_23A2651E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void (*v30)(char *, unint64_t);
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
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
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
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
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v4 = v3;
  v68 = a1;
  v69 = a2;
  v6 = sub_23A276000();
  v70 = *(_QWORD *)(v6 - 8);
  v71 = v6;
  MEMORY[0x24BDAC7A8](v6, v7, v8, v9);
  v11 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23A275DA8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12, v14, v15, v16);
  v18 = (char *)&v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_QWORD *)(a3 + 16);
  v20 = *(_QWORD *)(a3 + 24);
  v21 = *(_QWORD *)(a3 + 32);
  type metadata accessor for JournalFile(0, v19, v20, v21);
  sub_23A25E948(v4, *(_QWORD *)(v4 + *(int *)(a3 + 44)), *(_QWORD *)(v4 + *(int *)(a3 + 44) + 8));
  v22 = v72;
  v23 = sub_23A275DB4();
  if (v22)
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
  v65 = v4;
  v66 = 0;
  v67 = v23;
  v72 = v24;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
  sub_23A275FF4();
  v26 = sub_23A275FDC();
  v28 = v27;
  v29 = v71;
  v30 = *(void (**)(char *, unint64_t))(v70 + 8);
  v30(v11, v71);
  if (v28 >> 60 == 15)
  {
    sub_23A25E694();
    swift_allocError();
    swift_willThrow();
    return sub_23A25E6D8(v67, v72);
  }
  sub_23A275FF4();
  v70 = sub_23A275FDC();
  v32 = v31;
  v30(v11, v29);
  v71 = v32;
  if (v32 >> 60 == 15)
  {
    sub_23A25E694();
    swift_allocError();
    swift_willThrow();
    sub_23A25E760(v26, v28);
    return sub_23A25E6D8(v67, v72);
  }
  sub_23A265E48(v26, v28);
  sub_23A265CE0(v26, v28);
  v34 = v33;
  sub_23A25E760(v26, v28);
  v35 = v67;
  v36 = v72;
  sub_23A25E71C(v67, v72);
  sub_23A265CE0(v35, v36);
  v38 = v37;
  sub_23A25E6D8(v35, v36);
  v74 = v34;
  sub_23A265B24(v38);
  v39 = v74;
  v41 = v70;
  v40 = v71;
  sub_23A25E71C(v70, v71);
  sub_23A265CE0(v41, v40);
  v43 = v42;
  sub_23A25E760(v41, v40);
  v74 = v39;
  sub_23A265B24(v43);
  v64 = v26;
  v44 = v74;
  sub_23A275CF4();
  swift_allocObject();
  sub_23A275CE8();
  v45 = v19;
  v63 = v20;
  v46 = v20;
  v47 = v21;
  v48 = type metadata accessor for JournalEntry(255, v19, v46, v21);
  v49 = sub_23A276084();
  v50 = sub_23A2660F8(v44);
  v51 = v28;
  v53 = v52;
  swift_bridgeObjectRelease();
  v73 = MEMORY[0x23B846C88](&unk_23A277AA0, v48);
  MEMORY[0x23B846C88](MEMORY[0x24BEE12D0], v49, &v73);
  v54 = v66;
  sub_23A275CDC();
  if (v54)
  {
    sub_23A25E760(v64, v51);
    sub_23A25E6D8(v67, v72);
    sub_23A25E760(v70, v71);
    sub_23A25E6D8(v50, v53);
    return swift_release();
  }
  else
  {
    sub_23A25E6D8(v50, v53);
    v55 = swift_release();
    MEMORY[0x24BDAC7A8](v55, v56, v57, v58);
    v59 = v63;
    *(&v62 - 6) = v45;
    *(&v62 - 5) = v59;
    v60 = v65;
    *(&v62 - 4) = v47;
    *(&v62 - 3) = v60;
    v61 = v69;
    *(&v62 - 2) = v68;
    *(&v62 - 1) = v61;
    MEMORY[0x23B846C88](MEMORY[0x24BEE12C8], v49);
    sub_23A276060();
    sub_23A25E760(v64, v51);
    sub_23A25E6D8(v67, v72);
    sub_23A25E760(v70, v71);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_23A265680(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_23A2656AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  double v38;
  uint64_t v39;
  double v40;
  char *v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  void *v50;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD aBlock[7];

  v57 = a3;
  v58 = a4;
  v56 = a2;
  v52 = a1;
  v61 = sub_23A275EEC();
  v64 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61, v11, v12, v13);
  v60 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A275F04();
  v62 = *(_QWORD *)(v15 - 8);
  v63 = v15;
  MEMORY[0x24BDAC7A8](v15, v16, v17, v18);
  v59 = (char *)&v52 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for JournalEntry(0, a5, a6, a7);
  v21 = *(_QWORD *)(v20 - 8);
  v54 = *(_QWORD *)(v21 + 64);
  MEMORY[0x24BDAC7A8](v20, v22, v23, v24);
  v53 = (char *)&v52 - v25;
  v65 = sub_23A275F1C();
  v26 = *(_QWORD *)(v65 - 8);
  v30 = MEMORY[0x24BDAC7A8](v65, v27, v28, v29);
  v32 = (char *)&v52 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30, v33, v34, v35);
  v37 = (char *)&v52 - v36;
  v38 = *(double *)(a1 + *(int *)(v20 + 44));
  v39 = *(int *)(type metadata accessor for JournalFilePlayer(0, a5, a6, a7) + 48);
  if (v38 - *(double *)(v56 + v39) > 0.0)
    v40 = v38 - *(double *)(v56 + v39);
  else
    v40 = 0.0;
  sub_23A2649D0();
  v56 = sub_23A276168();
  sub_23A275F10();
  MEMORY[0x23B84634C](v32, v40);
  v55 = *(void (**)(char *, uint64_t))(v26 + 8);
  v55(v32, v65);
  v41 = v53;
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v53, v52, v20);
  v42 = (*(unsigned __int8 *)(v21 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v43 = (char *)swift_allocObject();
  *((_QWORD *)v43 + 2) = a5;
  *((_QWORD *)v43 + 3) = a6;
  v44 = v57;
  v45 = v58;
  *((_QWORD *)v43 + 4) = a7;
  *((_QWORD *)v43 + 5) = v44;
  *((_QWORD *)v43 + 6) = v45;
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(&v43[v42], v41, v20);
  aBlock[4] = sub_23A264A8C;
  aBlock[5] = v43;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A265680;
  aBlock[3] = &block_descriptor_0;
  v46 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v47 = v59;
  sub_23A275EF8();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_23A264AEC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256957990);
  sub_23A266260((unint64_t *)&qword_256957998, &qword_256957990, MEMORY[0x24BEE12C8]);
  v48 = v60;
  v49 = v61;
  sub_23A2761C8();
  v50 = (void *)v56;
  MEMORY[0x23B846580](v37, v47, v48, v46);
  _Block_release(v46);

  (*(void (**)(char *, uint64_t))(v64 + 8))(v48, v49);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v47, v63);
  return ((uint64_t (*)(char *, uint64_t))v55)(v37, v65);
}

char *sub_23A265A2C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(qword_256957A68);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * v11 - 64;
      v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32])
          memmove(v12, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v12 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_23A265E5C(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A265B24(uint64_t a1)
{
  char **v1;
  size_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;
  char *isUniquelyReferenced_nonNull_native;
  size_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  BOOL v13;
  size_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *((_QWORD *)*v1 + 2);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= *((_QWORD *)v3 + 3) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_23A265A2C(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *((_QWORD *)v3 + 2);
  if ((*((_QWORD *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = &v3[v9 + 32];
  if (a1 + 32 < (unint64_t)&v10[v8] && (unint64_t)v10 < a1 + 32 + v8)
    goto LABEL_24;
  memcpy(v10, (const void *)(a1 + 32), v8);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = *((_QWORD *)v3 + 2);
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    *((_QWORD *)v3 + 2) = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_23A2762AC();
  __break(1u);
  return result;
}

_BYTE *sub_23A265C6C@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_23A265F40(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_23A266000((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_23A266078((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void sub_23A265CE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = sub_23A275DD8();
  MEMORY[0x24BDAC7A8](v3, v4, v5, v6);
  __asm { BR              X10 }
}

_QWORD *sub_23A265D5C()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;

  if (BYTE6(v0))
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_256957A68);
    v4 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v4);
    v4[2] = BYTE6(v0);
    v4[3] = 2 * v6 - 64;
    sub_23A25E71C(v2, v0);
    v7 = sub_23A275DC0();
    sub_23A25E6D8(v2, v0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v1);
    if (v7 != BYTE6(v0))
    {
      __break(1u);
      JUMPOUT(0x23A265E30);
    }
  }
  return v4;
}

uint64_t sub_23A265E48(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23A25E71C(a1, a2);
  return a1;
}

char *sub_23A265E5C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  result = (char *)sub_23A2762AC();
  __break(1u);
  return result;
}

uint64_t sub_23A265F40(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_23A266000(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_23A275D30();
  swift_allocObject();
  result = sub_23A275D24();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_23A275DCC();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_23A266078(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_23A275D30();
  swift_allocObject();
  result = sub_23A275D24();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_23A2660F8(uint64_t a1)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256957A58);
  v10 = sub_23A266260(&qword_256957A60, &qword_256957A58, MEMORY[0x24BDCFBE0]);
  v8[0] = a1;
  v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  v3 = (_BYTE *)(*v2 + 32);
  v4 = &v3[*(_QWORD *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_23A265C6C(v3, v4, &v7);
  v5 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

uint64_t sub_23A2661A8(uint64_t a1)
{
  uint64_t *v1;

  return sub_23A2656AC(a1, v1[5], v1[6], v1[7], v1[2], v1[3], v1[4]);
}

uint64_t sub_23A2661C8()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *((_QWORD *)v0 + 2);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for JournalEntry(0, v1, *((_QWORD *)v0 + 3), *((_QWORD *)v0 + 4))- 8)+ 80);
  v3 = (v2 + 56) & ~v2;
  swift_release();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(&v0[v3], v1);
  return swift_deallocObject();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_23A266260(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B846C88](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t Store.objectWillChange.getter()
{
  sub_23A2669A0();
  return swift_retain();
}

_QWORD *Store.__allocating_init(feature:initialLocalState:initialSharedState:journalMode:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t AssociatedTypeWitness;
  uint64_t v23;
  uint64_t v25;

  v5 = v4;
  v10 = type metadata accessor for JournalMode();
  MEMORY[0x24BDAC7A8](v10, v11, v12, v13);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(v5 + 80);
  v18 = type metadata accessor for RootStore(0, v16, *(_QWORD *)(v5 + 88), v17);
  sub_23A260358(a4, (uint64_t)v15);
  v19 = sub_23A275920(a1, a2, a3, (uint64_t)v15);
  v20 = MEMORY[0x23B846C88](&unk_23A278938, v18);
  swift_allocObject();
  v21 = sub_23A266494((uint64_t)v19, v18, v20);
  sub_23A2606A8(a4);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a3, AssociatedTypeWitness);
  v23 = swift_getAssociatedTypeWitness();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(a2, v23);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a1, v16);
  return v21;
}

_QWORD *sub_23A266444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_allocObject();
  return sub_23A266494(a1, a2, a3);
}

_QWORD *sub_23A266494(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;

  v4 = v3;
  v3[3] = a1;
  v3[4] = a3;
  sub_23A275EBC();
  swift_allocObject();
  swift_unknownObjectRetain();
  v3[2] = sub_23A275EB0();
  v3[5] = MEMORY[0x24BEE4AF8];
  (*(void (**)(uint64_t, uint64_t))(a3 + 40))(a2, a3);
  v7 = swift_allocObject();
  swift_weakInit();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_23A266CE8;
  *(_QWORD *)(v8 + 24) = v7;
  sub_23A275ED4();
  swift_release();
  swift_release();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256957AF0);
  sub_23A266D34();
  sub_23A275E50();
  swift_endAccess();
  swift_release();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_23A266608()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_23A275EA4();
    return swift_release();
  }
  return result;
}

uint64_t Store.send(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;

  v3 = *(_QWORD *)(v1 + 32);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, ObjectType, v3);
}

_QWORD *Store.fragment<A>(feature:initialLocalState:stateProjection:forwardToParent:)(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t *v7;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t ObjectType;
  __int128 v19;
  _OWORD v21[2];

  v15 = *v7;
  v17 = v7[3];
  v16 = v7[4];
  ObjectType = swift_getObjectType();
  v19 = a3[1];
  v21[0] = *a3;
  v21[1] = v19;
  return sub_23A2669A8(v17, a1, a2, v21, a4, a5, *(_QWORD *)(v15 + 80), a6, ObjectType, a7, v16);
}

uint64_t Store.subscript.getter(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;

  v3 = *(_QWORD *)(v1 + 32);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v3 + 64))(a1, *(_QWORD *)(*MEMORY[0x24BEE46A8] + *a1 + 8), ObjectType, v3);
}

{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;

  v3 = *(_QWORD *)(v1 + 32);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v3 + 56))(a1, *(_QWORD *)(*MEMORY[0x24BEE46A8] + *a1 + 8), ObjectType, v3);
}

uint64_t Store.binding<A>(keyPath:)(uint64_t a1)
{
  return sub_23A26686C(a1);
}

{
  return sub_23A26686C(a1);
}

uint64_t sub_23A26686C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v4;

  v3 = (_QWORD *)swift_allocObject();
  v3[2] = 0;
  v3[3] = 0;
  v3[4] = v1;
  v3[5] = a1;
  v4 = (_QWORD *)swift_allocObject();
  v4[2] = 0;
  v4[3] = 0;
  v4[4] = v1;
  v4[5] = a1;
  swift_retain_n();
  swift_retain_n();
  return sub_23A275EE0();
}

uint64_t Store.deinit()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Store.__deallocating_deinit()
{
  Store.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_23A26697C@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_23A2669A0();
  return swift_retain();
}

uint64_t sub_23A2669A0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

_QWORD *sub_23A2669A8(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  uint64_t v17;
  _OWORD v19[2];

  v12 = a4[1];
  v19[0] = *a4;
  v19[1] = v12;
  v13 = (*(uint64_t (**)(uint64_t, uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a11 + 88))(a2, a3, v19, a5, a6, a8, a10, a9, a11);
  v15 = v14;
  ObjectType = swift_getObjectType();
  type metadata accessor for Store(0, a8, a10, v17);
  swift_allocObject();
  return sub_23A266494(v13, ObjectType, v15);
}

uint64_t sub_23A266A64()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t ObjectType;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD **)(v0 + 40);
  v3 = *(_QWORD *)(v1 + 32);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v3 + 64))(v2, *(_QWORD *)(*MEMORY[0x24BEE46A8] + *v2 + 8), ObjectType, v3);
}

uint64_t sub_23A266AD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t ObjectType;

  v3 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD **)(v1 + 40);
  v5 = *(_QWORD *)(v3 + 32);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(_QWORD *, uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 80))(v4, a1, *(_QWORD *)(*MEMORY[0x24BEE2B70] + *v4 + 8), ObjectType, v5);
}

uint64_t sub_23A266B3C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t ObjectType;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD **)(v0 + 40);
  v3 = *(_QWORD *)(v1 + 32);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v2, *(_QWORD *)(*MEMORY[0x24BEE46A8] + *v2 + 8), ObjectType, v3);
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A266BDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t ObjectType;

  v3 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD **)(v1 + 40);
  v5 = *(_QWORD *)(v3 + 32);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(_QWORD *, uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 72))(v4, a1, *(_QWORD *)(*MEMORY[0x24BEE2B70] + *v4 + 8), ObjectType, v5);
}

uint64_t sub_23A266C44()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_23A266C50()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Store(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Store);
}

uint64_t method lookup function for Store()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_23A266CC4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23A266CE8()
{
  return sub_23A266608();
}

uint64_t sub_23A266CF0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A266D14()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_23A266D34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256957AF8;
  if (!qword_256957AF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256957AF0);
    result = MEMORY[0x23B846C88](MEMORY[0x24BEE12E8], v1);
    atomic_store(result, (unint64_t *)&qword_256957AF8);
  }
  return result;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DatabaseRow.Failure(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 4);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DatabaseRow.Failure(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 5) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 5) = 0;
    if (a2)
      *(_BYTE *)(result + 4) = -(char)a2;
  }
  return result;
}

uint64_t sub_23A266E20(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 4);
}

uint64_t sub_23A266E28(uint64_t result, char a2)
{
  *(_BYTE *)(result + 4) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DatabaseRow.Failure()
{
  return &type metadata for DatabaseRow.Failure;
}

uint64_t sub_23A266E44()
{
  uint64_t result;
  unint64_t v1;
  char v2;
  char v3;
  char *v4;
  char *v5;
  void *v6;

  result = sub_23A2760CC();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout();
    v4 = &v3;
    swift_getTupleTypeLayout();
    v5 = &v2;
    v6 = &unk_23A278148;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_23A266F40(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  __int128 v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v17 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v18 = *(_OWORD *)(a2 + 3);
      *(_OWORD *)(a1 + 24) = v18;
      (**(void (***)(uint64_t, uint64_t *))(v18 - 8))(a1, a2);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v7 = *(_OWORD *)(a2 + 3);
      *(_OWORD *)(a1 + 24) = v7;
      (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
      *(_QWORD *)(a1 + 40) = a2[5];
      *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
      v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_256957B08);
      v9 = v8[20];
      v10 = a1 + v9;
      v11 = (uint64_t)a2 + v9;
      v12 = sub_23A2760CC();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
      *(_BYTE *)(a1 + v8[24]) = *((_BYTE *)a2 + v8[24]);
      *(_BYTE *)(a1 + v8[28]) = *((_BYTE *)a2 + v8[28]);
      v13 = v8[32];
      v14 = (_QWORD *)(a1 + v13);
      v15 = (uint64_t *)((char *)a2 + v13);
      v16 = v15[1];
      *v14 = *v15;
      v14[1] = v16;
      swift_retain();
    }
    else
    {
      v19 = a2[3];
      if (v19)
      {
        v20 = a2[4];
        *(_QWORD *)(a1 + 24) = v19;
        *(_QWORD *)(a1 + 32) = v20;
        (**(void (***)(uint64_t, uint64_t *))(v19 - 8))(a1, a2);
      }
      else
      {
        v21 = *((_OWORD *)a2 + 1);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v21;
        *(_QWORD *)(a1 + 32) = a2[4];
      }
      v22 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256957B00);
      v23 = v22[12];
      v24 = a1 + v23;
      v25 = (uint64_t)a2 + v23;
      v26 = sub_23A2760CC();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
      *(_BYTE *)(a1 + v22[16]) = *((_BYTE *)a2 + v22[16]);
      *(_BYTE *)(a1 + v22[20]) = *((_BYTE *)a2 + v22[20]);
      v27 = v22[24];
      v28 = (_QWORD *)(a1 + v27);
      v29 = (uint64_t *)((char *)a2 + v27);
      v30 = v29[1];
      *v28 = *v29;
      v28[1] = v30;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23A267150(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2)
    return __swift_destroy_boxed_opaque_existential_1(a1);
  if ((_DWORD)result == 1)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    v5 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256957B08) + 80);
    v6 = sub_23A2760CC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    if ((_DWORD)result)
      return result;
    if (*(_QWORD *)(a1 + 24))
      __swift_destroy_boxed_opaque_existential_1(a1);
    v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256957B00) + 48);
    v4 = sub_23A2760CC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  }
  return swift_release();
}

uint64_t sub_23A267244(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  __int128 v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v15 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v15;
    (**(void (***)(uint64_t, uint64_t))(v15 - 8))(a1, a2);
  }
  else if (EnumCaseMultiPayload == 1)
  {
    v5 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v5;
    (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    v6 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_256957B08);
    v7 = v6[20];
    v8 = a1 + v7;
    v9 = a2 + v7;
    v10 = sub_23A2760CC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    *(_BYTE *)(a1 + v6[24]) = *(_BYTE *)(a2 + v6[24]);
    *(_BYTE *)(a1 + v6[28]) = *(_BYTE *)(a2 + v6[28]);
    v11 = v6[32];
    v12 = (_QWORD *)(a1 + v11);
    v13 = (_QWORD *)(a2 + v11);
    v14 = v13[1];
    *v12 = *v13;
    v12[1] = v14;
    swift_retain();
  }
  else
  {
    v16 = *(_QWORD *)(a2 + 24);
    if (v16)
    {
      v17 = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 24) = v16;
      *(_QWORD *)(a1 + 32) = v17;
      (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1, a2);
    }
    else
    {
      v18 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v18;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    }
    v19 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256957B00);
    v20 = v19[12];
    v21 = a1 + v20;
    v22 = a2 + v20;
    v23 = sub_23A2760CC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
    *(_BYTE *)(a1 + v19[16]) = *(_BYTE *)(a2 + v19[16]);
    *(_BYTE *)(a1 + v19[20]) = *(_BYTE *)(a2 + v19[20]);
    v24 = v19[24];
    v25 = (_QWORD *)(a1 + v24);
    v26 = (_QWORD *)(a2 + v24);
    v27 = v26[1];
    *v25 = *v26;
    v25[1] = v27;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_23A267428(uint64_t a1, __int128 *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;

  if ((__int128 *)a1 != a2)
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a1, a3);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v16 = *((_QWORD *)a2 + 3);
      *(_QWORD *)(a1 + 24) = v16;
      *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
      (**(void (***)(uint64_t, __int128 *))(v16 - 8))(a1, a2);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v6 = *((_QWORD *)a2 + 3);
      *(_QWORD *)(a1 + 24) = v6;
      *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
      (**(void (***)(uint64_t, __int128 *))(v6 - 8))(a1, a2);
      *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
      *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
      v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_256957B08);
      v8 = v7[20];
      v9 = a1 + v8;
      v10 = (uint64_t)a2 + v8;
      v11 = sub_23A2760CC();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
      *(_BYTE *)(a1 + v7[24]) = *((_BYTE *)a2 + v7[24]);
      *(_BYTE *)(a1 + v7[28]) = *((_BYTE *)a2 + v7[28]);
      v12 = v7[32];
      v13 = (_QWORD *)(a1 + v12);
      v14 = (_QWORD *)((char *)a2 + v12);
      v15 = v14[1];
      *v13 = *v14;
      v13[1] = v15;
      swift_retain();
    }
    else
    {
      v17 = *((_QWORD *)a2 + 3);
      if (v17)
      {
        *(_QWORD *)(a1 + 24) = v17;
        *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
        (**(void (***)(uint64_t, __int128 *))(v17 - 8))(a1, a2);
      }
      else
      {
        v18 = *a2;
        v19 = a2[1];
        *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
        *(_OWORD *)a1 = v18;
        *(_OWORD *)(a1 + 16) = v19;
      }
      v20 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256957B00);
      v21 = v20[12];
      v22 = a1 + v21;
      v23 = (uint64_t)a2 + v21;
      v24 = sub_23A2760CC();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
      *(_BYTE *)(a1 + v20[16]) = *((_BYTE *)a2 + v20[16]);
      *(_BYTE *)(a1 + v20[20]) = *((_BYTE *)a2 + v20[20]);
      v25 = v20[24];
      v26 = (_QWORD *)(a1 + v25);
      v27 = (_QWORD *)((char *)a2 + v25);
      v28 = v27[1];
      *v26 = *v27;
      v26[1] = v28;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23A267634(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  __int128 v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v13 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v13;
    v14 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = v14;
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    v15 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_256957B08);
    v16 = v15[20];
    v17 = a1 + v16;
    v18 = a2 + v16;
    v19 = sub_23A2760CC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
    *(_BYTE *)(a1 + v15[24]) = *(_BYTE *)(a2 + v15[24]);
    *(_BYTE *)(a1 + v15[28]) = *(_BYTE *)(a2 + v15[28]);
    *(_OWORD *)(a1 + v15[32]) = *(_OWORD *)(a2 + v15[32]);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy((void *)a1, (const void *)a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256957B00);
    v9 = v8[12];
    v10 = a1 + v9;
    v11 = a2 + v9;
    v12 = sub_23A2760CC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
    *(_BYTE *)(a1 + v8[16]) = *(_BYTE *)(a2 + v8[16]);
    *(_BYTE *)(a1 + v8[20]) = *(_BYTE *)(a2 + v8[20]);
    *(_OWORD *)(a1 + v8[24]) = *(_OWORD *)(a2 + v8[24]);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23A2677A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  int EnumCaseMultiPayload;
  __int128 v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 - 8);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, a3);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v13 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v13;
      v14 = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 40) = v14;
      *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
      v15 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_256957B08);
      v16 = v15[20];
      v17 = a1 + v16;
      v18 = a2 + v16;
      v19 = sub_23A2760CC();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
      *(_BYTE *)(a1 + v15[24]) = *(_BYTE *)(a2 + v15[24]);
      *(_BYTE *)(a1 + v15[28]) = *(_BYTE *)(a2 + v15[28]);
      *(_OWORD *)(a1 + v15[32]) = *(_OWORD *)(a2 + v15[32]);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy((void *)a1, (const void *)a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v7 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v7;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256957B00);
      v9 = v8[12];
      v10 = a1 + v9;
      v11 = a2 + v9;
      v12 = sub_23A2760CC();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
      *(_BYTE *)(a1 + v8[16]) = *(_BYTE *)(a2 + v8[16]);
      *(_BYTE *)(a1 + v8[20]) = *(_BYTE *)(a2 + v8[20]);
      *(_OWORD *)(a1 + v8[24]) = *(_OWORD *)(a2 + v8[24]);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t type metadata accessor for SideEffect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SideEffect);
}

BOOL static SideEffectCollisionBehavior.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SideEffectCollisionBehavior.hash(into:)()
{
  return sub_23A2763E4();
}

uint64_t SideEffectCollisionBehavior.hashValue.getter()
{
  sub_23A2763D8();
  sub_23A2763E4();
  return sub_23A2763FC();
}

BOOL sub_23A2679C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23A2679D4()
{
  sub_23A2763D8();
  sub_23A2763E4();
  return sub_23A2763FC();
}

uint64_t sub_23A267A18()
{
  return sub_23A2763E4();
}

uint64_t sub_23A267A40()
{
  sub_23A2763D8();
  sub_23A2763E4();
  return sub_23A2763FC();
}

BOOL static SideEffectDisposalBehavior.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SideEffectDisposalBehavior.hash(into:)()
{
  return sub_23A2763E4();
}

uint64_t SideEffectDisposalBehavior.hashValue.getter()
{
  sub_23A2763D8();
  sub_23A2763E4();
  return sub_23A2763FC();
}

BOOL sub_23A267B04(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_23A267B20()
{
  unint64_t result;

  result = qword_256957B90;
  if (!qword_256957B90)
  {
    result = MEMORY[0x23B846C88](&protocol conformance descriptor for SideEffectCollisionBehavior, &type metadata for SideEffectCollisionBehavior);
    atomic_store(result, (unint64_t *)&qword_256957B90);
  }
  return result;
}

unint64_t sub_23A267B68()
{
  unint64_t result;

  result = qword_256957B98;
  if (!qword_256957B98)
  {
    result = MEMORY[0x23B846C88](&protocol conformance descriptor for SideEffectDisposalBehavior, &type metadata for SideEffectDisposalBehavior);
    atomic_store(result, (unint64_t *)&qword_256957B98);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SideEffectCollisionBehavior(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A267BF8 + 4 * byte_23A278185[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A267C2C + 4 * byte_23A278180[v4]))();
}

uint64_t sub_23A267C2C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A267C34(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A267C3CLL);
  return result;
}

uint64_t sub_23A267C48(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A267C50);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A267C54(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A267C5C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SideEffectCollisionBehavior()
{
  return &type metadata for SideEffectCollisionBehavior;
}

uint64_t storeEnumTagSinglePayload for SideEffectDisposalBehavior(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A267CC4 + 4 * byte_23A27818F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A267CF8 + 4 * byte_23A27818A[v4]))();
}

uint64_t sub_23A267CF8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A267D00(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A267D08);
  return result;
}

uint64_t sub_23A267D14(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A267D1CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A267D20(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A267D28(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SideEffectDisposalBehavior()
{
  return &type metadata for SideEffectDisposalBehavior;
}

uint64_t destroy for DatabaseError()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s8DataFlow13DatabaseErrorVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DatabaseError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for DatabaseError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DatabaseError(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DatabaseError(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DatabaseError()
{
  return &type metadata for DatabaseError;
}

uint64_t sub_23A267EB0(uint64_t a1, void (*a2)(sqlite3_stmt *), uint64_t a3, sqlite3_stmt *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
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
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t result;
  uint64_t v40;
  int v41;
  uint64_t v42;
  void (*v43)(sqlite3_stmt *);
  uint64_t v44;
  char *v45;
  char *i;
  int v47;
  unsigned int v48;
  unsigned int v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  unint64_t *v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  void (*v62)(sqlite3_stmt *);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;

  v6 = v5;
  v62 = a2;
  v63 = a3;
  v64 = a5;
  v61 = *(_QWORD *)(a5 - 8);
  v9 = MEMORY[0x24BDAC7A8](a1, a2, a3, a4);
  v60 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9, v11, v12, v13);
  v59 = (char *)&v58 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256957BA0);
  v19 = MEMORY[0x24BDAC7A8](v15, v16, v17, v18);
  v21 = (uint64_t *)((char *)&v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  v25 = MEMORY[0x24BDAC7A8](v19, v22, v23, v24);
  v67 = (char *)&v58 - v26;
  MEMORY[0x24BDAC7A8](v25, v27, v28, v29);
  v31 = (uint64_t *)((char *)&v58 - v30);
  v32 = *(_QWORD *)(a1 + 16);
  v65 = a1;
  swift_bridgeObjectRetain();
  v66 = v32;
  if (v32)
  {
    v33 = 0;
    v34 = *(_QWORD *)(type metadata accessor for DatabaseBinding() - 8);
    v35 = v65 + ((*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80));
    v36 = *(_QWORD *)(v34 + 72);
    while (1)
    {
      v37 = (uint64_t)&v67[*(int *)(v15 + 48)];
      sub_23A268238(v35, v37);
      v38 = (uint64_t)v31 + *(int *)(v15 + 48);
      *v31 = v33;
      sub_23A26827C(v37, v38);
      result = sub_23A2682C0((uint64_t)v31, (uint64_t)v21);
      v40 = *v21 + 1;
      if (__OFADD__(*v21, 1))
      {
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
        return result;
      }
      if (v40 < (uint64_t)0xFFFFFFFF80000000)
        goto LABEL_24;
      if (v40 > 0x7FFFFFFF)
        goto LABEL_25;
      sub_23A268308((uint64_t)v21 + *(int *)(v15 + 48), v40, (uint64_t)a4);
      if (v41)
        break;
      ++v33;
      sub_23A2685CC((uint64_t)v21);
      v35 += v36;
      if (v66 == v33)
        goto LABEL_8;
    }
    v49 = v41;
    if (sqlite3_errstr(v41))
    {
      v50 = sub_23A27603C();
      v52 = v51;
    }
    else
    {
      v50 = 4271950;
      v52 = 0xE300000000000000;
    }
    sub_23A268588();
    swift_allocError();
    *v56 = v49;
    v56[1] = v50;
    v56[2] = v52;
    swift_willThrow();
    sub_23A2685CC((uint64_t)v21);
    return swift_bridgeObjectRelease();
  }
  else
  {
LABEL_8:
    swift_bridgeObjectRelease();
    v42 = v64;
    v68 = sub_23A275F34();
    v43 = v62;
    v45 = v60;
    v44 = v61;
    for (i = v59; ; (*(void (**)(char *, uint64_t))(v44 + 8))(i, v42))
    {
      v47 = sqlite3_step(a4);
      if (v47 != 100)
        break;
      v43(a4);
      if (v6)
        return swift_bridgeObjectRelease();
      (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v45, i, v42);
      sub_23A276084();
      sub_23A276078();
    }
    v48 = v47;
    if (v47 == 101)
    {
      return v68;
    }
    else
    {
      swift_bridgeObjectRelease();
      if (sqlite3_errstr(v48))
      {
        v53 = sub_23A27603C();
        v55 = v54;
      }
      else
      {
        v53 = 4271950;
        v55 = 0xE300000000000000;
      }
      sub_23A268588();
      swift_allocError();
      *v57 = v48 | 0x8000000000000000;
      v57[1] = v53;
      v57[2] = v55;
      return swift_willThrow();
    }
  }
}

uint64_t sub_23A268238(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DatabaseBinding();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A26827C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DatabaseBinding();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A2682C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256957BA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23A268308(uint64_t a1, int a2, uint64_t a3)
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
  char *v21;
  _DWORD v22[2];
  uint64_t v23;

  v23 = a3;
  v22[1] = a2;
  v4 = sub_23A275DA8();
  MEMORY[0x24BDAC7A8](v4, v5, v6, v7);
  v8 = sub_23A275E14();
  MEMORY[0x24BDAC7A8](v8, v9, v10, v11);
  v12 = type metadata accessor for DatabaseBinding();
  v16 = MEMORY[0x24BDAC7A8](v12, v13, v14, v15);
  MEMORY[0x24BDAC7A8](v16, v17, v18, v19);
  sub_23A268238(a1, (uint64_t)v22 - v20);
  v21 = (char *)sub_23A26842C + 4 * byte_23A278320[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A26842C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 32))(v3, v4, v1);
  sub_23A275DE4();
  *v2 = v6;
  swift_storeEnumTagMultiPayload();
  v7 = ((uint64_t (*)(_QWORD *, _QWORD, _QWORD))sub_23A268308)(v2, *(unsigned int *)(v5 - 92), *(_QWORD *)(v5 - 88));
  sub_23A26860C((uint64_t)v2);
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v3, v1);
  return v7;
}

unint64_t sub_23A268588()
{
  unint64_t result;

  result = qword_256957BA8[0];
  if (!qword_256957BA8[0])
  {
    result = MEMORY[0x23B846C88](&unk_23A278344, &type metadata for DatabaseStatement.Failure);
    atomic_store(result, qword_256957BA8);
  }
  return result;
}

uint64_t sub_23A2685CC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256957BA0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A26860C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DatabaseBinding();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A26864C(unint64_t result)
{
  if ((result >> 61) <= 4)
    return swift_bridgeObjectRetain();
  return result;
}

unint64_t destroy for DatabaseStatement.Failure(unint64_t *a1)
{
  return sub_23A268674(*a1);
}

unint64_t sub_23A268674(unint64_t result)
{
  if ((result >> 61) <= 4)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t *_s8DataFlow17DatabaseStatementV7FailureOwCP_0(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  sub_23A26864C(*a2);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return a1;
}

unint64_t *assignWithCopy for DatabaseStatement.Failure(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  sub_23A26864C(*a2);
  v6 = *a1;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  sub_23A268674(v6);
  return a1;
}

unint64_t *assignWithTake for DatabaseStatement.Failure(unint64_t *a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *a1;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v3;
  sub_23A268674(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DatabaseStatement.Failure(uint64_t a1, int a2)
{
  unsigned int v2;
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  HIDWORD(v3) = *(_DWORD *)(a1 + 4);
  LODWORD(v3) = HIDWORD(v3);
  v2 = v3 >> 29;
  if (v2 > 0x80000000)
    v4 = ~v2;
  else
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DatabaseStatement.Failure(uint64_t result, int a2, int a3)
{
  unint64_t v3;

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
      HIDWORD(v3) = -a2;
      LODWORD(v3) = -a2;
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = 0;
      *(_QWORD *)result = (unint64_t)(v3 >> 3) << 32;
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_23A268804(_QWORD *a1)
{
  return *a1 >> 61;
}

_QWORD *sub_23A268810(_QWORD *result)
{
  *result &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_23A268820(uint64_t result, int a2)
{
  *(_DWORD *)(result + 4) = a2 << 29;
  return result;
}

ValueMetadata *type metadata accessor for DatabaseStatement.Failure()
{
  return &type metadata for DatabaseStatement.Failure;
}

uint64_t dispatch thunk of Feature.dispose(localState:sharedState:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t dispatch thunk of Feature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 72))();
}

void sub_23A26884C(void *a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  _QWORD *v5;
  uint64_t v6;

  MEMORY[0x23B846BBC]();
  MEMORY[0x23B846BBC](a1);
  v2 = sub_23A275E20();
  v3 = sub_23A276144();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v4 = 138412290;
    MEMORY[0x23B846BBC](a1);
    v6 = _swift_stdlib_bridgeErrorToNSError();
    sub_23A276198();
    *v5 = v6;

    _os_log_impl(&dword_23A253000, v2, v3, "%@", v4, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(qword_2569578D0);
    swift_arrayDestroy();
    MEMORY[0x23B846D30](v5, -1, -1);
    MEMORY[0x23B846D30](v4, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_23A2689C0()
{
  uint64_t v0;

  v0 = sub_23A275E38();
  __swift_allocate_value_buffer(v0, qword_25695AE10);
  __swift_project_value_buffer(v0, (uint64_t)qword_25695AE10);
  return sub_23A275E2C();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
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

uint64_t sub_23A268A70()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
      return swift_initClassMetadata2();
  }
  return result;
}

uint64_t sub_23A268B50(char *a1)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_23A268BAC(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_23A268BAC(char *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t AssociatedTypeWitness;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  char *v22;
  void (*v23)(char *);
  char *v24;
  void (*v25)(char *, uint64_t);
  _QWORD v27[2];
  uint64_t v28;
  char *v29;

  v29 = a1;
  v2 = (_QWORD *)*v1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v5, v6, v7);
  v9 = (char *)v27 - v8;
  v10 = v2[12];
  v27[0] = v2[10];
  v27[1] = v10;
  v11 = swift_getAssociatedTypeWitness();
  v28 = *(_QWORD *)(v11 - 8);
  v15 = MEMORY[0x24BDAC7A8](v11, v12, v13, v14);
  v17 = (char *)v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15, v18, v19, v20);
  v22 = (char *)v27 - v21;
  v23 = *(void (**)(char *))((char *)v1 + v2[18]);
  v24 = (char *)v1 + v2[21];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v24, AssociatedTypeWitness);
  v23(v9);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, AssociatedTypeWitness);
  v23(v29);
  swift_getAssociatedConformanceWitness();
  if ((sub_23A275FB8() & 1) == 0)
    sub_23A275EA4();
  v25 = *(void (**)(char *, uint64_t))(v28 + 8);
  v25(v17, v11);
  v25(v22, v11);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 24))(v24, v29, AssociatedTypeWitness);
  return swift_endAccess();
}

uint64_t sub_23A268DAC()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_23A275EA4();
    return swift_release();
  }
  return result;
}

uint64_t sub_23A268E04(uint64_t a1)
{
  void (*v1)(char *, uint64_t);
  void (*v2)(char *, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  NSObject *v48;
  os_log_type_t v49;
  int v50;
  _BOOL4 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  __darwin_time_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (**v62)(char *, char *);
  void (*v63)(char *, char *);
  char *v64;
  char *v65;
  uint64_t v66;
  char *v67;
  char *v68;
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
  void (**v79)(uint64_t, char *, char *);
  double v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void (*v84)(char *, uint64_t);
  uint64_t v85;
  void (*v86)(char *, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void (*v91)(char *, uint64_t);
  __darwin_time_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t tv_nsec;
  __darwin_time_t tv_sec;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  _QWORD v111[3];
  __darwin_time_t v112;
  timespec __tp;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;

  v2 = v1;
  v110 = a1;
  v116 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)v1;
  v4 = *(_QWORD *)(v3 + 96);
  v5 = *(_QWORD *)(v3 + 80);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v107 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v108 = AssociatedTypeWitness;
  v10 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v7, v8, v9);
  v12 = (char *)&v91 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v13, v14, v15);
  v109 = (char *)&v91 - v16;
  v100 = v3;
  v97 = swift_getAssociatedTypeWitness();
  v95 = *(_QWORD *)(v97 - 8);
  MEMORY[0x24BDAC7A8](v97, v17, v18, v19);
  v96 = (char *)&v91 - v20;
  v21 = swift_getAssociatedTypeWitness();
  v104 = *(_QWORD *)(v21 - 8);
  v105 = v21;
  v25 = MEMORY[0x24BDAC7A8](v21, v22, v23, v24);
  v27 = (char *)&v91 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25, v28, v29, v30);
  v103 = (char *)&v91 - v31;
  v102 = v4;
  v32 = v5;
  v33 = swift_getAssociatedTypeWitness();
  v34 = *(_QWORD *)(v33 - 8);
  v38 = MEMORY[0x24BDAC7A8](v33, v35, v36, v37);
  v40 = (char *)&v91 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v38, v41, v42, v43);
  v45 = (char *)&v91 - v44;
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_MONOTONIC_RAW, &__tp);
  tv_sec = __tp.tv_sec;
  tv_nsec = __tp.tv_nsec;
  if (qword_256956CD0 != -1)
    swift_once();
  v106 = v12;
  v46 = sub_23A275E38();
  __swift_project_value_buffer(v46, (uint64_t)qword_25695AE10);
  v47 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 16);
  v47(v45, v110, v33);
  v48 = sub_23A275E20();
  v49 = sub_23A276138();
  v50 = v49;
  v51 = os_log_type_enabled(v48, v49);
  v101 = v33;
  v94 = v32;
  if (v51)
  {
    v52 = swift_slowAlloc();
    v93 = (uint64_t)v27;
    v53 = v52;
    v92 = swift_slowAlloc();
    __tp.tv_sec = v92;
    *(_DWORD *)v53 = 136315394;
    v111[0] = v32;
    swift_getMetatypeMetadata();
    v54 = sub_23A27600C();
    LODWORD(v91) = v50;
    v111[0] = sub_23A26B078(v54, v55, &__tp.tv_sec);
    v33 = v101;
    sub_23A276198();
    swift_bridgeObjectRelease();
    *(_WORD *)(v53 + 12) = 2080;
    v47(v40, (uint64_t)v45, v33);
    v56 = sub_23A27600C();
    v111[0] = sub_23A26B078(v56, v57, &__tp.tv_sec);
    sub_23A276198();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v45, v33);
    _os_log_impl(&dword_23A253000, v48, (os_log_type_t)v91, "%s.%s", (uint8_t *)v53, 0x16u);
    v58 = v92;
    swift_arrayDestroy();
    MEMORY[0x23B846D30](v58, -1, -1);
    v59 = v53;
    v27 = (char *)v93;
    MEMORY[0x23B846D30](v59, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v34 + 8))(v45, v33);
  }

  v93 = type metadata accessor for SideEffect(0, v33, v60, v61);
  v112 = sub_23A275F34();
  v62 = (void (**)(char *, char *))((char *)v2 + *(_QWORD *)(*(_QWORD *)v2 + 144));
  v63 = *v62;
  v64 = v96;
  v92 = *(_QWORD *)((char *)v2 + *(_QWORD *)(*(_QWORD *)v2 + 128));
  sub_23A275E80();
  v65 = v103;
  ((void (*)(char *))v63)(v64);
  v66 = v97;
  v91 = *(void (**)(char *, uint64_t))(v95 + 8);
  v91(v64, v97);
  v95 = *(_QWORD *)((char *)v2 + *(_QWORD *)(*(_QWORD *)v2 + 136));
  sub_23A275E80();
  (*(void (**)(char *, char *, uint64_t))(v104 + 16))(v27, v65, v105);
  v67 = v106;
  (*(void (**)(void))(v107 + 16))();
  (*(void (**)(char *, char *, __darwin_time_t *, uint64_t, uint64_t, uint64_t))(v102 + 72))(v67, v27, &v112, v110, v94, v102);
  swift_getAssociatedConformanceWitness();
  if ((sub_23A275FB8() & 1) == 0)
  {
    sub_23A275E80();
    v62[2](v64, v27);
    sub_23A275E74();
    sub_23A275EA4();
    v91(v64, v66);
  }
  swift_getAssociatedConformanceWitness();
  v68 = v106;
  if ((sub_23A275FB8() & 1) == 0)
    sub_23A275E74();
  v69 = v100;
  MEMORY[0x23B846C88](&unk_23A278500, v100);
  v70 = sub_23A276210();
  swift_retain();
  v71 = MEMORY[0x23B846C88](&unk_23A278794, v69);
  v72 = v101;
  v73 = sub_23A272634(v70, v71, v111);
  __tp.tv_sec = v112;
  MEMORY[0x24BDAC7A8](v73, v74, v75, v76);
  *(&v91 - 2) = v2;
  *(&v91 - 1) = (void (*)(char *, uint64_t))v111;
  v77 = sub_23A276084();
  swift_bridgeObjectRetain();
  MEMORY[0x23B846C88](MEMORY[0x24BEE12C8], v77);
  sub_23A276060();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v78 = *(_QWORD *)v2;
  v79 = (void (**)(uint64_t, char *, char *))((char *)v2 + *(_QWORD *)(*(_QWORD *)v2 + 152));
  if (*v79)
  {
    (*v79)(v110, v27, v68);
    v78 = *(_QWORD *)v2;
  }
  v80 = (double)tv_nsec / 1000000000.0 + (double)tv_sec;
  sub_23A26C2C8((uint64_t)v2 + *(_QWORD *)(v78 + 184), (uint64_t)&__tp);
  v81 = v114;
  v82 = v115;
  __swift_project_boxed_opaque_existential_1(&__tp, v114);
  (*(void (**)(uint64_t, uint64_t, uint64_t, double))(v82 + 56))(v110, v81, v82, v80);
  v83 = v108;
  v84 = *(void (**)(char *, uint64_t))(v107 + 8);
  v84(v68, v108);
  v85 = v105;
  v86 = *(void (**)(char *, uint64_t))(v104 + 8);
  v86(v27, v105);
  v84(v109, v83);
  v86(v103, v85);
  v89 = type metadata accessor for StoreProxy(0, v72, v87, v88);
  (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v89 - 8) + 8))(v111, v89);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&__tp);
}

uint64_t sub_23A269670()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  void *v49;
  void (*v50)(char *, uint64_t);
  uint64_t v51;
  uint64_t AssociatedTypeWitness;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  _QWORD aBlock[3];
  void *v76;
  uint64_t (*v77)();
  uint64_t v78;
  __int128 v79[2];

  v1 = v0;
  v2 = *(_QWORD **)v0;
  v70 = sub_23A275EEC();
  v73 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70, v3, v4, v5);
  v69 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A275F04();
  v71 = *(_QWORD *)(v7 - 8);
  v72 = v7;
  MEMORY[0x24BDAC7A8](v7, v8, v9, v10);
  v63 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256957548);
  v16 = MEMORY[0x24BDAC7A8](v12, v13, v14, v15);
  v18 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = v2[10];
  v20 = *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64);
  v54 = *(_QWORD *)(v19 - 8);
  v24 = MEMORY[0x24BDAC7A8](v16, v21, v22, v23);
  v25 = (char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24, v26, v27, v28);
  v30 = (char *)&v54 - v29;
  v31 = v2[18];
  v66 = v2[17];
  v32 = v0 + v31;
  v68 = v0 + v31;
  v57 = *(_QWORD *)(v0 + v31);
  v65 = v2[16];
  v33 = v2[15];
  v58 = *(_QWORD *)(v0 + v65);
  v56 = *(_QWORD *)(v32 + 24);
  v59 = *(_QWORD *)(v0 + v66);
  v64 = (char *)(v0 + v33);
  v35 = *(void (**)(char *))(v34 + 16);
  v74 = *(_OWORD *)(v32 + 8);
  v60 = (char *)&v54 - v29;
  v35((char *)&v54 - v29);
  MEMORY[0x23B846C88](&unk_23A278500, v2);
  v36 = sub_23A276210();
  v67 = *(_QWORD *)(*(_QWORD *)v0 + 160);
  v37 = *(_QWORD *)(v0 + v67);
  v76 = (void *)MEMORY[0x24BEE0940];
  v77 = (uint64_t (*)())MEMORY[0x24BEE0948];
  aBlock[0] = v36;
  v38 = sub_23A2760CC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v18, 1, 1, v38);
  sub_23A26C2C8((uint64_t)aBlock, (uint64_t)v79);
  v39 = (_QWORD *)swift_allocObject();
  v39[2] = 0;
  v39[3] = 0;
  v39[4] = v37;
  sub_23A26C340(v79, (uint64_t)(v39 + 5));
  swift_retain();
  sub_23A273D3C((uint64_t)v18, (uint64_t)&unk_256957CB8, (uint64_t)v39);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  sub_23A2649D0();
  v55 = sub_23A276168();
  ((void (*)(char *, char *, uint64_t))v35)(v25, v30, v19);
  v40 = v54;
  v41 = (*(unsigned __int8 *)(v54 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
  v42 = swift_allocObject();
  *(_QWORD *)(v42 + 16) = v19;
  v62 = v2[11];
  *(_QWORD *)(v42 + 24) = v62;
  *(_QWORD *)(v42 + 32) = v2[12];
  v61 = v2[13];
  v43 = v57;
  *(_QWORD *)(v42 + 40) = v61;
  *(_QWORD *)(v42 + 48) = v43;
  *(_OWORD *)(v42 + 56) = v74;
  v44 = v58;
  *(_QWORD *)(v42 + 72) = v56;
  *(_QWORD *)(v42 + 80) = v44;
  (*(void (**)(unint64_t, char *, uint64_t))(v40 + 32))(v42 + v41, v25, v19);
  *(_QWORD *)(v42 + ((v20 + v41 + 7) & 0xFFFFFFFFFFFFFFF8)) = v59;
  v77 = sub_23A26C46C;
  v78 = v42;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A265680;
  v76 = &block_descriptor_1;
  v45 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  v46 = v63;
  sub_23A275EF8();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_23A264AEC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256957990);
  sub_23A266260((unint64_t *)&qword_256957998, &qword_256957990, MEMORY[0x24BEE12C8]);
  v48 = v69;
  v47 = v70;
  sub_23A2761C8();
  v49 = (void *)v55;
  MEMORY[0x23B846598](0, v46, v48, v45);
  _Block_release(v45);

  (*(void (**)(char *, uint64_t))(v73 + 8))(v48, v47);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v46, v72);
  v50 = *(void (**)(char *, uint64_t))(v40 + 8);
  v50(v60, v19);
  swift_release();
  v50(v64, v19);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_23A26C2B8(*(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 152)));
  swift_release();
  v51 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 168);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(v51, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v1 + *(_QWORD *)(*(_QWORD *)v1 + 184));
  return v1;
}

uint64_t sub_23A269BFC(void (*a1)(char *), uint64_t a2, void (*a3)(char *, char *), uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7, uint64_t a8, uint64_t a9, uint64_t a10)
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
  uint64_t v21;
  char *v22;
  uint64_t AssociatedTypeWitness;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  void (*v36)(char *, uint64_t);
  uint64_t v38;
  void (*v39)(char *, char *);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *);
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v41 = a8;
  v42 = a2;
  v43 = a1;
  v44 = a7;
  v47 = a6;
  v38 = a4;
  v39 = a3;
  v46 = *(_QWORD *)(*a7 + *MEMORY[0x24BDB9CF0]);
  v45 = *(_QWORD *)(v46 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1, a2, a3, a4);
  v13 = (char *)&v38 - v12;
  v16 = *(_QWORD *)(v14 + v15);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v11, v18, v19, v20);
  v22 = (char *)&v38 - v21;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v24 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v28 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v25, v26, v27);
  v30 = (char *)&v38 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28, v31, v32, v33);
  v35 = (char *)&v38 - v34;
  v40 = a5;
  sub_23A275E80();
  v43(v22);
  v43 = *(void (**)(char *))(v17 + 8);
  ((void (*)(char *, uint64_t))v43)(v22, v16);
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v30, v35, AssociatedTypeWitness);
  sub_23A275E80();
  (*(void (**)(char *, char *, uint64_t, uint64_t))(a10 + 64))(v13, v30, v41, a10);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v13, v46);
  swift_getAssociatedConformanceWitness();
  if ((sub_23A275FB8() & 1) == 0)
  {
    sub_23A275E80();
    v39(v22, v30);
    sub_23A275E74();
    ((void (*)(char *, uint64_t))v43)(v22, v16);
  }
  v36 = *(void (**)(char *, uint64_t))(v24 + 8);
  v36(v30, AssociatedTypeWitness);
  return ((uint64_t (*)(char *, uint64_t))v36)(v35, AssociatedTypeWitness);
}

uint64_t sub_23A269E4C()
{
  sub_23A269670();
  return swift_deallocClassInstance();
}

void type metadata accessor for ChildStore()
{
  JUMPOUT(0x23B846C04);
}

uint64_t sub_23A269E7C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;

  v3 = (_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 184));
  v4 = v3[3];
  v5 = v3[4];
  v6 = __swift_project_boxed_opaque_existential_1(v3, v4);
  v7 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v6, v6, v8, v9);
  v11 = (char *)&v13 - v10;
  (*(void (**)(char *))(v7 + 16))((char *)&v13 - v10);
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 32))(v4, v5);
  result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v11, v4);
  if ((v5 & 1) == 0)
    return sub_23A268E04(a1);
  return result;
}

uint64_t sub_23A269F38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
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
  unint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[24];

  v35 = a1;
  v36 = a3;
  v3 = *(_QWORD **)a2;
  v4 = *(_QWORD *)(*(_QWORD *)a2 + 96);
  v37 = v3[10];
  v38 = v4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = type metadata accessor for SideEffect(0, AssociatedTypeWitness, v6, v7);
  v9 = *(_QWORD *)(v8 - 8);
  v33 = v8;
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8, v11, v12, v13);
  v15 = (char *)&v32 - v14;
  v34 = (char *)&v32 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256957548);
  MEMORY[0x24BDAC7A8](v16, v17, v18, v19);
  v21 = (char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_23A2760CC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v15, v35, v8);
  v26 = type metadata accessor for StoreProxy(0, AssociatedTypeWitness, v24, v25);
  v27 = *(_QWORD *)(v26 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v27 + 16))(v39, v36, v26);
  v28 = (*(unsigned __int8 *)(v9 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v29 = (char *)swift_allocObject();
  *((_QWORD *)v29 + 2) = 0;
  *((_QWORD *)v29 + 3) = 0;
  *((_QWORD *)v29 + 4) = v37;
  v30 = v38;
  *((_QWORD *)v29 + 5) = v3[11];
  *((_QWORD *)v29 + 6) = v30;
  *((_QWORD *)v29 + 7) = v3[13];
  *((_QWORD *)v29 + 8) = v23;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v29[v28], v34, v33);
  (*(void (**)(char *, _BYTE *, uint64_t))(v27 + 32))(&v29[(v10 + v28 + 7) & 0xFFFFFFFFFFFFFFF8], v39, v26);
  sub_23A26A2DC((uint64_t)v21, (uint64_t)&unk_256957C98, (uint64_t)v29);
  swift_release();
  return sub_23A26C0E0((uint64_t)v21);
}

uint64_t sub_23A26A148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v9;

  v7[9] = a7;
  v7[10] = v9;
  v7[7] = a5;
  v7[8] = a6;
  v7[5] = a1;
  v7[6] = a4;
  return swift_task_switch();
}

uint64_t sub_23A26A170()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;
  uint64_t AssociatedTypeWitness;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 88) = Strong;
  if (Strong)
  {
    *(_QWORD *)(v0 + 96) = *(_QWORD *)(Strong + *(_QWORD *)(*(_QWORD *)Strong + 160));
    swift_retain();
    swift_release();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v2;
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    *v2 = v0;
    v2[1] = sub_23A26A264;
    return sub_23A26CA90(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), AssociatedTypeWitness);
  }
  else
  {
    **(_BYTE **)(v0 + 40) = 1;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A26A264()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23A26A2C0()
{
  uint64_t v0;

  **(_BYTE **)(v0 + 40) = *(_QWORD *)(v0 + 88) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A26A2DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[4];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256957548);
  MEMORY[0x24BDAC7A8](v6, v7, v8, v9);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A26C120(a1, (uint64_t)v11);
  v12 = sub_23A2760CC();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_23A26C0E0((uint64_t)v11);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v14 = sub_23A276090();
      v16 = v15;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_23A2760C0();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v11, v12);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v14 = 0;
  v16 = 0;
LABEL_6:
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256957CB0);
  if (v16 | v14)
  {
    v19[0] = 0;
    v19[1] = 0;
    v19[2] = v14;
    v19[3] = v16;
  }
  return swift_task_create();
}

uint64_t sub_23A26A46C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = *(_QWORD *)(*a1 + *MEMORY[0x24BEE46A8]);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1, a2, a3, a4);
  v7 = (char *)&v9 - v6;
  sub_23A275E80();
  swift_getAtKeyPath();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_23A26A510@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void (*v20)(char *);
  _QWORD v22[2];

  v22[0] = a1;
  v22[1] = a2;
  v3 = *v2;
  v4 = *a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v7, v8, v9);
  v12 = (char *)v22 - v11;
  v13 = *(_QWORD *)(v4 + *MEMORY[0x24BEE46A8]);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v10, v15, v16, v17);
  v19 = (char *)v22 - v18;
  v20 = *(void (**)(char *))((char *)v2 + *(_QWORD *)(v3 + 144));
  sub_23A275E80();
  v20(v12);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v12, AssociatedTypeWitness);
  swift_getAtKeyPath();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v13);
}

uint64_t sub_23A26A638(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char v22;
  void (*v23)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;

  v25 = a2;
  v4 = *(_QWORD *)(*a1 + *MEMORY[0x24BEE2B70] + 8);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1, a2, a3, a4);
  v8 = (char *)&v25 - v7;
  v10 = *v9;
  v26 = *(_QWORD *)(*v9 - 8);
  v14 = MEMORY[0x24BDAC7A8](v6, v11, v12, v13);
  v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14, v17, v18, v19);
  v21 = (char *)&v25 - v20;
  sub_23A275E80();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v25, v4);
  swift_setAtWritableKeyPath();
  sub_23A275E80();
  swift_getAssociatedConformanceWitness();
  v22 = sub_23A275FB8();
  v23 = *(void (**)(char *, uint64_t))(v26 + 8);
  v23(v16, v10);
  if ((v22 & 1) == 0)
    sub_23A275E74();
  return ((uint64_t (*)(char *, uint64_t))v23)(v21, v10);
}

uint64_t sub_23A26A7C0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  void (*v28)(char *);
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  uint64_t v34;
  void (**v35)(char *, char *);
  uint64_t v36;
  _QWORD *v37;
  uint64_t AssociatedTypeWitness;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;

  v42 = a2;
  v43 = a1;
  v5 = *v4;
  v6 = (uint64_t *)(*a1 + *MEMORY[0x24BEE2B70]);
  v41 = v6[1];
  v40 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](a1, a2, a3, a4);
  v39 = (char *)&v34 - v7;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v9, v10, v11);
  v14 = (char *)&v34 - v13;
  v15 = *v6;
  v16 = *(_QWORD *)(*v6 - 8);
  v20 = MEMORY[0x24BDAC7A8](v12, v17, v18, v19);
  v22 = (char *)&v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20, v23, v24, v25);
  v27 = (char *)&v34 - v26;
  v28 = *(void (**)(char *))((char *)v4 + *(_QWORD *)(v5 + 144));
  v35 = (void (**)(char *, char *))((char *)v4 + *(_QWORD *)(v5 + 144));
  v29 = *(_QWORD *)(v5 + 128);
  v37 = v4;
  v36 = *(_QWORD *)((char *)v4 + v29);
  sub_23A275E80();
  v28(v14);
  v30 = *(void (**)(char *, uint64_t))(v8 + 8);
  v31 = AssociatedTypeWitness;
  v30(v14, AssociatedTypeWitness);
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v22, v27, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v39, v42, v41);
  swift_setAtWritableKeyPath();
  swift_getAssociatedConformanceWitness();
  if ((sub_23A275FB8() & 1) == 0)
  {
    sub_23A275E80();
    v35[2](v14, v22);
    sub_23A275E74();
    sub_23A275EA4();
    v30(v14, v31);
  }
  v32 = *(void (**)(char *, uint64_t))(v16 + 8);
  v32(v22, v15);
  return ((uint64_t (*)(char *, uint64_t))v32)(v27, v15);
}

void sub_23A26AA14(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t *v7;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
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
  _QWORD v23[6];
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v31 = a4;
  v32 = a5;
  v23[2] = a2;
  v23[1] = a1;
  v37 = *MEMORY[0x24BDAC8D0];
  v11 = *v7;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v27 = AssociatedTypeWitness;
  v29 = v13;
  v17 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v14, v15, v16);
  v26 = (char *)v23 - v18;
  v30 = *(_QWORD *)(a6 - 8);
  MEMORY[0x24BDAC7A8](v17, v19, v20, v21);
  v28 = (char *)v23 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23[4] = *a3;
  v23[5] = a3[1];
  v23[3] = a3[2];
  v24 = *(_QWORD *)(v11 + 88);
  v25 = *(_QWORD *)(v11 + 104);
  v33 = a6;
  v34 = v24;
  v35 = a7;
  v36 = v25;
  type metadata accessor for ChildStore();
}

char *sub_23A26AB5C(uint64_t a1)
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
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;

  *(_QWORD *)(v10 - 304) = a1;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 16))(v6, *(_QWORD *)(v10 - 360), v1);
  v11 = *(_QWORD **)(v8 + *(_QWORD *)(*(_QWORD *)v8 + 128));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 16))(v9, *(_QWORD *)(v10 - 352), v2);
  v12 = *(_QWORD *)(v8 + *(_QWORD *)(*(_QWORD *)v8 + 160));
  sub_23A26C2C8(v8 + *(_QWORD *)(*(_QWORD *)v8 + 184), v10 - 136);
  v13 = *(_QWORD *)(v10 - 112);
  v14 = *(_QWORD *)(v10 - 104);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v10 - 136), v13);
  *(_QWORD *)(v10 - 176) = 0;
  *(_QWORD *)(v10 - 168) = 0;
  v15 = v11;
  swift_retain();
  swift_retain();
  clock_gettime(_CLOCK_MONOTONIC_RAW, (timespec *)(v10 - 176));
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double))(v14 + 48))(v1, v1, v3, v13, v14, (double)*(uint64_t *)(v10 - 168) / 1000000000.0 + (double)*(uint64_t *)(v10 - 176));
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v1;
  v16[3] = v3;
  v17 = *(_QWORD *)(v10 - 336);
  v18 = *(_QWORD *)(v10 - 328);
  v16[4] = v17;
  v16[5] = v18;
  v19 = *(_QWORD *)(v10 - 344);
  v16[6] = v19;
  v16[7] = v4;
  v16[8] = v8;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = v1;
  v20[3] = v3;
  v20[4] = v8;
  v20[5] = v17;
  v20[6] = v18;
  v20[7] = v19;
  v20[8] = v4;
  StateProjection.init(get:set:)((uint64_t)sub_23A26C230, (uint64_t)v16, (uint64_t)sub_23A26C278, (uint64_t)v20, (_QWORD *)(v10 - 208));
  v21 = *(_OWORD *)(v10 - 192);
  *(_OWORD *)(v10 - 240) = *(_OWORD *)(v10 - 208);
  *(_OWORD *)(v10 - 224) = v21;
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  v23 = *(_QWORD *)(v10 - 256);
  v22 = *(_QWORD *)(v10 - 248);
  sub_23A26C2A8(v23);
  v24 = *(_QWORD *)(v10 - 304);
  swift_allocObject();
  v25 = *(_QWORD *)(v10 - 280);
  v26 = *(_QWORD *)(v10 - 296);
  v27 = sub_23A26B770(v25, v15, v26, v12, (_QWORD *)(v10 - 176), v10 - 240, v23, v22);
  sub_23A26C2B8(v23);
  __swift_destroy_boxed_opaque_existential_1(v10 - 176);
  swift_release();
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v10 - 272) + 8))(v26, *(_QWORD *)(v10 - 288));
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 264) + 8))(v25, v1);
  __swift_destroy_boxed_opaque_existential_1(v10 - 136);
  MEMORY[0x23B846C88](&unk_23A278538, v24);
  return v27;
}

uint64_t sub_23A26AE14(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v18;

  v9 = *a6;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v12, v13, v14);
  v16 = (char *)&v18 - v15;
  (*(void (**)(uint64_t))((char *)a6 + *(_QWORD *)(v9 + 144)))(a1);
  a2(v16);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, AssociatedTypeWitness);
}

uint64_t sub_23A26AEEC(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, void (*a6)(char *, uint64_t))
{
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (**v18)(uint64_t, char *);
  uint64_t v20;

  v10 = *a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v13, v14, v15);
  v17 = (char *)&v20 - v16;
  v18 = (void (**)(uint64_t, char *))((char *)a3 + *(_QWORD *)(v10 + 144));
  ((void (*)(uint64_t))*v18)(a1);
  a6(v17, a2);
  v18[2](a1, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v17, AssociatedTypeWitness);
}

uint64_t sub_23A26AFD4()
{
  return swift_retain();
}

uint64_t sub_23A26AFF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23A276210();
  *a1 = result;
  return result;
}

uint64_t sub_23A26B01C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 16);
  return swift_retain();
}

uint64_t sub_23A26B028()
{
  return MEMORY[0x24BEE0948];
}

uint64_t sub_23A26B034(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = MEMORY[0x23B846C88](&unk_23A2784C8);
  result = MEMORY[0x23B846C88](&unk_23A278500, a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_23A26B078(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23A26B148(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23A26BE54((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_23A26BE54((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23A26B148(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_23A2761A4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23A26B300(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_23A276234();
  if (!v8)
  {
    sub_23A27627C();
    __break(1u);
LABEL_17:
    result = sub_23A2762AC();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_23A26B300(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23A26B394(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23A26B56C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23A26B56C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23A26B394(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_23A26B508(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23A276204();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23A27627C();
      __break(1u);
LABEL_10:
      v2 = sub_23A276054();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23A2762AC();
    __break(1u);
LABEL_14:
    result = sub_23A27627C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23A26B508(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_256957A68);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23A26B56C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
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
    __swift_instantiateConcreteTypeFromMangledName(qword_256957A68);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23A2762AC();
  __break(1u);
  return result;
}

uint64_t sub_23A26B6B8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_23A26B720;
  return v5(v2 + 32);
}

uint64_t sub_23A26B720()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

char *sub_23A26B770(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v8;
  char *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  void (*v44)(char *, uint64_t, uint64_t);
  uint64_t v45;
  char *v46;
  __int128 v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(uint64_t (*)(uint64_t), char *, uint64_t, uint64_t);
  __int128 v65;
  uint64_t v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  _QWORD *v83;
  _QWORD *v84;

  v9 = v8;
  v72 = a7;
  v73 = a8;
  *(_QWORD *)&v67 = a6;
  v83 = a5;
  v71 = a4;
  v68 = a3;
  *(_QWORD *)&v65 = a1;
  v81 = *(_QWORD **)v8;
  v11 = *a2;
  v76 = v81[12];
  v12 = v81[10];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v66 = sub_23A275E8C();
  v14 = MEMORY[0x24BDB9D10];
  v78 = MEMORY[0x23B846C88](MEMORY[0x24BDB9D10], v66);
  v15 = sub_23A275E44();
  v16 = *(_QWORD *)(v15 - 8);
  v79 = v15;
  v80 = v16;
  MEMORY[0x24BDAC7A8](v15, v17, v18, v19);
  v77 = (char *)&v65 - v20;
  v21 = *(_QWORD *)(v11 + *MEMORY[0x24BDB9CF0]);
  v70 = sub_23A275E8C();
  v69 = MEMORY[0x23B846C88](v14, v70);
  v22 = sub_23A275E44();
  v23 = *(_QWORD *)(v22 - 8);
  v74 = v22;
  v75 = v23;
  v27 = MEMORY[0x24BDAC7A8](v22, v24, v25, v26);
  v29 = (char *)&v65 - v28;
  v30 = *(_QWORD *)(v21 - 8);
  v34 = MEMORY[0x24BDAC7A8](v27, v31, v32, v33);
  v36 = (char *)&v65 - v35;
  v37 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v34, v38, v39, v40);
  v42 = (char *)&v65 - v41;
  v43 = &v9[v81[15]];
  v82 = v12;
  (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v43, v65, v12);
  sub_23A275EBC();
  swift_allocObject();
  *((_QWORD *)v9 + 2) = sub_23A275EB0();
  *(_QWORD *)&v9[*(_QWORD *)(*(_QWORD *)v9 + 128)] = a2;
  v44 = *(void (**)(char *, uint64_t, uint64_t))(v37 + 16);
  v65 = *(_OWORD *)v67;
  v67 = *(_OWORD *)(v67 + 16);
  v44(v42, v68, AssociatedTypeWitness);
  swift_retain();
  *(_QWORD *)&v9[*(_QWORD *)(*(_QWORD *)v9 + 136)] = sub_23A275E98();
  v45 = v72;
  *(_QWORD *)&v9[*(_QWORD *)(*(_QWORD *)v9 + 160)] = v71;
  v46 = &v9[*(_QWORD *)(*(_QWORD *)v9 + 144)];
  v47 = v67;
  *(_OWORD *)v46 = v65;
  *((_OWORD *)v46 + 1) = v47;
  v48 = (uint64_t *)&v9[*(_QWORD *)(*(_QWORD *)v9 + 152)];
  v49 = v73;
  *v48 = v45;
  v48[1] = v49;
  swift_retain();
  sub_23A26C2A8(v45);
  sub_23A275E80();
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))(&v9[*(_QWORD *)(*(_QWORD *)v9 + 168)], v36, v21);
  *(_QWORD *)&v9[*(_QWORD *)(*(_QWORD *)v9 + 176)] = MEMORY[0x24BEE4AF8];
  sub_23A26C2C8((uint64_t)v83, (uint64_t)&v9[*(_QWORD *)(*(_QWORD *)v9 + 184)]);
  v84 = a2;
  sub_23A275EC8();
  v50 = swift_allocObject();
  swift_weakInit();
  v51 = (_QWORD *)swift_allocObject();
  v51[2] = v82;
  v52 = v81;
  v73 = v81[11];
  v53 = v76;
  v51[3] = v73;
  v51[4] = v53;
  v54 = v52[13];
  v51[5] = v54;
  v51[6] = v50;
  swift_retain();
  v55 = v74;
  MEMORY[0x23B846C88](MEMORY[0x24BDB96F8], v74);
  sub_23A275ED4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v75 + 8))(v29, v55);
  swift_release();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256957AF0);
  sub_23A266260((unint64_t *)&qword_256957AF8, &qword_256957AF0, MEMORY[0x24BEE12E8]);
  sub_23A275E50();
  swift_endAccess();
  swift_release();
  v84 = *(_QWORD **)&v9[*(_QWORD *)(*(_QWORD *)v9 + 136)];
  v56 = v77;
  sub_23A275EC8();
  v57 = swift_allocObject();
  swift_weakInit();
  v58 = (_QWORD *)swift_allocObject();
  v59 = v73;
  v58[2] = v82;
  v58[3] = v59;
  v58[4] = v53;
  v58[5] = v54;
  v58[6] = v57;
  swift_retain();
  v60 = v79;
  MEMORY[0x23B846C88](MEMORY[0x24BDB96F8], v79);
  sub_23A275ED4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v80 + 8))(v56, v60);
  swift_release();
  swift_beginAccess();
  sub_23A275E50();
  swift_endAccess();
  swift_release();
  v61 = v83[3];
  v62 = v83[4];
  __swift_project_boxed_opaque_existential_1(v83, v61);
  v63 = *(void (**)(uint64_t (*)(uint64_t), char *, uint64_t, uint64_t))(v62 + 64);
  swift_retain();
  v63(sub_23A26BE38, v9, v61, v62);
  swift_release();
  return v9;
}

char *sub_23A26BD34(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  swift_allocObject();
  return sub_23A26B770(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_23A26BDC4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23A26BDE8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A26BE0C(uint64_t a1)
{
  return sub_23A26BE24(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23A268B50);
}

uint64_t sub_23A26BE18(uint64_t a1)
{
  return sub_23A26BE24(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23A268DAC);
}

uint64_t sub_23A26BE24(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[6], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_23A26BE3C(uint64_t a1)
{
  uint64_t v1;

  return sub_23A269F38(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23A26BE54(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23A26BE90()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4 = *(_QWORD *)(type metadata accessor for SideEffect(0, AssociatedTypeWitness, v2, v3) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  swift_unknownObjectRelease();
  swift_release();
  v6 = v0 + v5;
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      __swift_destroy_boxed_opaque_existential_1(v0 + v5);
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_1(v0 + v5);
      v10 = v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256957B08) + 80);
      v11 = sub_23A2760CC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
LABEL_9:
      swift_release();
      break;
    case 0:
      if (*(_QWORD *)(v6 + 24))
        __swift_destroy_boxed_opaque_existential_1(v0 + v5);
      v8 = v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256957B00) + 48);
      v9 = sub_23A2760CC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
      goto LABEL_9;
  }
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23A26C008(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  _QWORD *v14;

  v4 = v1[4];
  v5 = v1[6];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(type metadata accessor for SideEffect(0, AssociatedTypeWitness, v7, v8) - 8);
  v10 = (*(unsigned __int8 *)(v9 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v11 = v1[8];
  v12 = (char *)v1 + v10;
  v13 = (char *)v1 + ((*(_QWORD *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v14;
  *v14 = v2;
  v14[1] = sub_23A25FA5C;
  v14[9] = v4;
  v14[10] = v5;
  v14[7] = v12;
  v14[8] = v13;
  v14[5] = a1;
  v14[6] = v11;
  return swift_task_switch();
}

uint64_t sub_23A26C0E0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256957548);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A26C120(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256957548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A26C168()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A26C18C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A25FA5C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256957CA0 + dword_256957CA0))(a1, v4);
}

uint64_t sub_23A26C1FC()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A26C230(uint64_t a1)
{
  uint64_t v1;

  return sub_23A26AE14(a1, *(void (**)(char *))(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(uint64_t **)(v1 + 64));
}

uint64_t sub_23A26C244()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A26C278(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A26AEEC(a1, a2, *(uint64_t **)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(void (**)(char *, uint64_t))(v2 + 56));
}

uint64_t sub_23A26C2A8(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_23A26C2B8(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_23A26C2C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23A26C30C()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  return swift_deallocObject();
}

uint64_t sub_23A26C340(__int128 *a1, uint64_t a2)
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

uint64_t sub_23A26C358(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23A26C4E4;
  return sub_23A26C9BC(a1, v4, v5, v6, (uint64_t)(v1 + 5));
}

uint64_t sub_23A26C3D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A26C46C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  return sub_23A269BFC(*(void (**)(char *))(v0 + 48), *(_QWORD *)(v0 + 56), *(void (**)(char *, char *))(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), v0 + v3, *(_QWORD **)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8)), v1, *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t StateProjection.init(get:set:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t sub_23A26C4F8()
{
  swift_release();
  return swift_release();
}

uint64_t sub_23A26C520(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_23A26C568(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *sub_23A26C5D0(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t sub_23A26C614(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_23A26C65C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for StateProjection()
{
  JUMPOUT(0x23B846C04);
}

uint64_t sub_23A26C6A8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  __int128 v4;
  __int128 v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  __int128 v9[4];

  if (*(_QWORD *)(a1 + 24))
  {
    v4 = *(_OWORD *)(a1 + 16);
    v9[0] = *(_OWORD *)a1;
    v9[1] = v4;
    v5 = *(_OWORD *)(a1 + 48);
    v9[2] = *(_OWORD *)(a1 + 32);
    v9[3] = v5;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v2;
    *v2 = 0x8000000000000000;
    sub_23A26039C(v9, a2, isUniquelyReferenced_nonNull_native);
    *v2 = v8;
    swift_bridgeObjectRelease();
    return sub_23A260720(a2);
  }
  else
  {
    sub_23A26F5D4(a1, &qword_256957E60);
    sub_23A26E9E4(a2, v9);
    sub_23A260720(a2);
    return sub_23A26F5D4((uint64_t)v9, &qword_256957E60);
  }
}

uint64_t sub_23A26C76C(uint64_t a1, uint64_t *a2, unsigned __int8 *a3, uint64_t a4)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[40];
  uint64_t v14;
  char v15;
  uint64_t v16;
  _BYTE v17[40];

  v6 = *a3;
  sub_23A2606E4(a1, (uint64_t)v17);
  v7 = *a2;
  v11 = MEMORY[0x24BEE0940];
  v12 = MEMORY[0x24BEE0948];
  *(_QWORD *)&v10 = v7;
  if (v6 == 1)
    v8 = MEMORY[0x23B846DF0](a2 + 1);
  else
    v8 = 0;
  sub_23A26C340(&v10, (uint64_t)v13);
  v14 = v8;
  v15 = v6;
  v16 = a4;
  swift_beginAccess();
  swift_retain();
  sub_23A26C6A8((uint64_t)v13, (uint64_t)v17);
  return swift_endAccess();
}

uint64_t sub_23A26C82C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  _OWORD v13[4];
  _OWORD v14[2];
  uint64_t v15;
  _OWORD v16[4];
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  sub_23A2606E4(a1, (uint64_t)&v17);
  sub_23A260984(a2, (uint64_t)&v20);
  sub_23A2606E4((uint64_t)&v17, (uint64_t)v14);
  sub_23A260984((uint64_t)&v20, (uint64_t)v16);
  sub_23A26C2C8((uint64_t)v16, (uint64_t)&v10);
  sub_23A26F610((uint64_t)v16);
  __swift_project_boxed_opaque_existential_1(&v10, *((uint64_t *)&v11 + 1));
  v5 = sub_23A275FAC();
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  v6 = sub_23A275FAC();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  sub_23A260720((uint64_t)v14);
  v14[0] = v17;
  v14[1] = v18;
  v16[0] = v20;
  v16[1] = v21;
  v16[2] = v22;
  v15 = v19;
  v16[3] = v23;
  if (v5 == v6)
  {
    v10 = v17;
    v11 = v18;
    v13[3] = v23;
    v13[0] = v20;
    v13[1] = v21;
    v12 = v19;
    v13[2] = v22;
    v7 = v23;
    sub_23A26F610((uint64_t)v13);
    v8 = v7 ^ 1;
    sub_23A260720((uint64_t)&v10);
  }
  else
  {
    sub_23A26F5D4((uint64_t)v14, qword_256957E80);
    v8 = 0;
  }
  return v8 & 1;
}

uint64_t sub_23A26C9BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 40) = a4;
  *(_QWORD *)(v5 + 48) = a5;
  return swift_task_switch();
}

uint64_t sub_23A26C9D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 112);
  v4 = swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v2;
  swift_bridgeObjectRetain();
  v6 = sub_23A26ECC4((uint64_t)sub_23A26ECA8, v4, v3, v5);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_retain();
  sub_23A26F308(v6, v1);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A26CA90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4[115] = v3;
  v4[114] = a3;
  v4[113] = a2;
  v4[112] = a1;
  v6 = sub_23A27609C();
  v4[116] = v6;
  v4[117] = *(_QWORD *)(v6 - 8);
  v4[118] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256957548);
  v4[119] = swift_task_alloc();
  v7 = sub_23A2760CC();
  v4[120] = v7;
  v4[121] = *(_QWORD *)(v7 - 8);
  v4[122] = swift_task_alloc();
  v4[123] = swift_task_alloc();
  v10 = type metadata accessor for SideEffect(0, a3, v8, v9);
  v4[124] = v10;
  v4[125] = *(_QWORD *)(v10 - 8);
  v4[126] = swift_task_alloc();
  v4[127] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A26CBA0()
{
  uint64_t v0;
  int EnumCaseMultiPayload;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  int v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  _OWORD *v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
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
  _QWORD *v54;
  uint64_t *v55;
  __int128 v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  char v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 1000) + 16))(*(_QWORD *)(v0 + 1016), *(_QWORD *)(v0 + 896), *(_QWORD *)(v0 + 992));
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v2 = *(_QWORD *)(v0 + 1016);
      v3 = *(_QWORD *)(v0 + 1008);
      v4 = *(_QWORD *)(v0 + 976);
      v5 = *(_QWORD *)(v0 + 968);
      v6 = *(_QWORD *)(v0 + 960);
      v64 = *(_QWORD *)(v0 + 912);
      v65 = *(_QWORD *)(v0 + 904);
      v7 = *(_QWORD *)(v2 + 40);
      v67 = *(_BYTE *)(v2 + 48);
      v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_256957B08);
      v9 = v2 + v8[20];
      v62 = *(_BYTE *)(v2 + v8[28]);
      v63 = *(_BYTE *)(v2 + v8[24]);
      v10 = (uint64_t *)(v2 + v8[32]);
      v11 = v10[1];
      v66 = *v10;
      *(_QWORD *)(v0 + 1064) = v11;
      v12 = *(_QWORD *)(v2 + 32);
      v13 = *(_OWORD *)(v2 + 16);
      *(_OWORD *)(v0 + 160) = *(_OWORD *)v2;
      *(_OWORD *)(v0 + 176) = v13;
      *(_QWORD *)(v0 + 192) = v12;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v4, v9, v6);
      v14 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256957B00);
      v15 = v3 + v14[12];
      v16 = v14[16];
      v17 = v14[20];
      v18 = (_QWORD *)(v3 + v14[24]);
      sub_23A2606E4(v0 + 160, v3);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v15, v4, v6);
      *(_BYTE *)(v3 + v16) = v63;
      *(_BYTE *)(v3 + v17) = v62;
      v21 = type metadata accessor for StoreProxy(0, v64, v19, v20);
      v22 = *(_QWORD *)(v21 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v0 + 768, v65, v21);
      v23 = swift_allocObject();
      *(_QWORD *)(v23 + 16) = v64;
      *(_QWORD *)(v23 + 24) = v7;
      *(_QWORD *)(v23 + 32) = v66;
      *(_QWORD *)(v23 + 40) = v11;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v23 + 48, v0 + 768, v21);
      *(_BYTE *)(v23 + 72) = v67;
      *v18 = &unk_256957E38;
      v18[1] = v23;
      swift_storeEnumTagMultiPayload();
      swift_retain();
      v24 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 1072) = v24;
      *v24 = v0;
      v24[1] = sub_23A26D4EC;
      return sub_23A26CA90(*(_QWORD *)(v0 + 1008), *(_QWORD *)(v0 + 904), *(_QWORD *)(v0 + 912));
    }
    v41 = *(_QWORD *)(v0 + 1016);
    v42 = *(_QWORD *)(v41 + 32);
    v43 = *(_OWORD *)(v41 + 16);
    *(_OWORD *)(v0 + 360) = *(_OWORD *)v41;
    *(_OWORD *)(v0 + 376) = v43;
    *(_QWORD *)(v0 + 392) = v42;
    sub_23A2606E4(v0 + 360, v0 + 80);
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    swift_beginAccess();
    sub_23A26C6A8((uint64_t)&v70, v0 + 80);
    swift_endAccess();
    v44 = v0 + 360;
    goto LABEL_9;
  }
  v26 = *(_QWORD *)(v0 + 1016);
  v27 = *(_QWORD *)(v0 + 984);
  v28 = *(_QWORD *)(v0 + 968);
  v29 = *(_QWORD *)(v0 + 960);
  v30 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256957B00);
  v31 = *(unsigned __int8 *)(v26 + v30[16]);
  v68 = *(_BYTE *)(v26 + v30[20]);
  v32 = v26 + v30[12];
  v33 = (uint64_t *)(v26 + v30[24]);
  v34 = v33[1];
  v69 = *v33;
  *(_QWORD *)(v0 + 1024) = v34;
  sub_23A26E81C(v26, v0 + 240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v27, v32, v29);
  sub_23A26E864(v0 + 240, v0 + 320);
  if (*(_QWORD *)(v0 + 344))
  {
    v35 = (_OWORD *)(v0 + 16);
    v36 = *(_QWORD *)(v0 + 920);
    v37 = *(_OWORD *)(v0 + 336);
    *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 320);
    *(_OWORD *)(v0 + 296) = v37;
    *(_QWORD *)(v0 + 312) = *(_QWORD *)(v0 + 352);
    swift_beginAccess();
    v38 = *(_QWORD *)(v36 + 112);
    if (*(_QWORD *)(v38 + 16))
    {
      swift_bridgeObjectRetain();
      v39 = sub_23A25FAD4(v0 + 280);
      if ((v40 & 1) != 0)
      {
        sub_23A260984(*(_QWORD *)(v38 + 56) + (v39 << 6), v0 + 16);
      }
      else
      {
        *(_OWORD *)(v0 + 48) = 0u;
        *(_OWORD *)(v0 + 64) = 0u;
        *v35 = 0u;
        *(_OWORD *)(v0 + 32) = 0u;
      }
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(v0 + 40))
      {
        sub_23A26F5D4(v0 + 16, &qword_256957E60);
        if (!v31)
        {
          v59 = *(_QWORD *)(v0 + 984);
          v60 = *(_QWORD *)(v0 + 968);
          v61 = *(_QWORD *)(v0 + 960);
          swift_release();
          (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v59, v61);
          sub_23A26F5D4(v0 + 240, &qword_256957E40);
          v44 = v0 + 280;
LABEL_9:
          sub_23A260720(v44);
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          return (*(uint64_t (**)(void))(v0 + 8))();
        }
        if (v31 != 1)
        {
          sub_23A2606E4(v0 + 280, v0 + 200);
          v72 = 0u;
          v73 = 0u;
          v70 = 0u;
          v71 = 0u;
          swift_beginAccess();
          sub_23A26C6A8((uint64_t)&v70, v0 + 200);
          swift_endAccess();
        }
        goto LABEL_18;
      }
    }
    else
    {
      *(_OWORD *)(v0 + 48) = 0u;
      *(_OWORD *)(v0 + 64) = 0u;
      *v35 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
    }
    sub_23A26F5D4(v0 + 16, &qword_256957E60);
LABEL_18:
    sub_23A260720(v0 + 280);
    goto LABEL_19;
  }
  sub_23A26F5D4(v0 + 320, &qword_256957E40);
LABEL_19:
  v45 = *(_QWORD *)(v0 + 968);
  v46 = *(_QWORD *)(v0 + 960);
  v47 = *(_QWORD *)(v0 + 952);
  v48 = *(_QWORD *)(v0 + 912);
  v49 = *(_QWORD *)(v0 + 904);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v45 + 16))(v47, *(_QWORD *)(v0 + 984), v46);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v45 + 56))(v47, 0, 1, v46);
  v52 = type metadata accessor for StoreProxy(0, v48, v50, v51);
  v53 = *(_QWORD *)(v52 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16))(v0 + 816, v49, v52);
  v54 = (_QWORD *)swift_allocObject();
  v54[2] = 0;
  v54[3] = 0;
  v54[4] = v48;
  v54[5] = v69;
  v54[6] = v34;
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(v53 + 32))(v54 + 7, v0 + 816, v52);
  swift_retain();
  *(_QWORD *)(v0 + 1032) = sub_23A26DCD4(v47, (uint64_t)&unk_256957E50, (uint64_t)v54);
  sub_23A26E864(v0 + 240, v0 + 440);
  if (*(_QWORD *)(v0 + 464))
  {
    v55 = *(uint64_t **)(v0 + 904);
    v56 = *(_OWORD *)(v0 + 456);
    *(_OWORD *)(v0 + 400) = *(_OWORD *)(v0 + 440);
    *(_OWORD *)(v0 + 416) = v56;
    *(_QWORD *)(v0 + 432) = *(_QWORD *)(v0 + 472);
    LOBYTE(v70) = v68;
    sub_23A275E5C();
    swift_allocObject();
    swift_retain();
    v57 = sub_23A275E68();
    sub_23A26C76C(v0 + 400, v55, (unsigned __int8 *)&v70, v57);
    swift_release();
    sub_23A260720(v0 + 400);
  }
  else
  {
    sub_23A26F5D4(v0 + 440, &qword_256957E40);
  }
  v58 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 1040) = v58;
  *(_QWORD *)(v0 + 1048) = __swift_instantiateConcreteTypeFromMangledName(&qword_256957E58);
  *v58 = v0;
  v58[1] = sub_23A26D2A8;
  return sub_23A2760D8();
}

uint64_t sub_23A26D2A8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 1056) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A26D30C()
{
  uint64_t v0;
  __int128 v1;
  char isCancelled;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  _OWORD v12[4];

  sub_23A26E864(v0 + 240, v0 + 120);
  if (*(_QWORD *)(v0 + 144))
  {
    v1 = *(_OWORD *)(v0 + 136);
    *(_OWORD *)(v0 + 560) = *(_OWORD *)(v0 + 120);
    *(_OWORD *)(v0 + 576) = v1;
    *(_QWORD *)(v0 + 592) = *(_QWORD *)(v0 + 152);
    isCancelled = swift_task_isCancelled();
    v3 = *(_QWORD *)(v0 + 984);
    v4 = *(_QWORD *)(v0 + 968);
    v5 = *(_QWORD *)(v0 + 960);
    if ((isCancelled & 1) != 0)
    {
      swift_release();
      swift_release();
      sub_23A260720(v0 + 560);
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    }
    else
    {
      v11 = *(_QWORD *)(v0 + 984);
      sub_23A2606E4(v0 + 560, v0 + 640);
      memset(v12, 0, sizeof(v12));
      swift_beginAccess();
      sub_23A26C6A8((uint64_t)v12, v0 + 640);
      swift_endAccess();
      swift_release();
      swift_release();
      sub_23A260720(v0 + 560);
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v11, v5);
    }
    v9 = v0 + 240;
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 984);
    v7 = *(_QWORD *)(v0 + 968);
    v8 = *(_QWORD *)(v0 + 960);
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    sub_23A26F5D4(v0 + 240, &qword_256957E40);
    v9 = v0 + 120;
  }
  sub_23A26F5D4(v9, &qword_256957E40);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A26D4EC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A26D544()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 1008);
  v2 = *(_QWORD *)(v0 + 1000);
  v3 = *(_QWORD *)(v0 + 992);
  v4 = *(_QWORD *)(v0 + 976);
  v5 = *(_QWORD *)(v0 + 968);
  v6 = *(_QWORD *)(v0 + 960);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  sub_23A260720(v0 + 160);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A26D614()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  char isCancelled;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v31;
  uint64_t v32;
  _OWORD v33[4];

  v1 = v0 + 120;
  v2 = v0 + 240;
  *(_QWORD *)(v0 + 872) = *(_QWORD *)(v0 + 1056);
  MEMORY[0x23B846BBC]();
  if ((swift_dynamicCast() & 1) != 0)
  {

    if (qword_256956CD0 != -1)
      swift_once();
    v3 = sub_23A275E38();
    __swift_project_value_buffer(v3, (uint64_t)qword_25695AE10);
    sub_23A26E864(v0 + 240, v0 + 600);
    v4 = sub_23A275E20();
    v5 = sub_23A276150();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      *(_QWORD *)&v33[0] = v7;
      *(_DWORD *)v6 = 136446210;
      sub_23A26E864(v0 + 600, v0 + 480);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256957E40);
      v8 = sub_23A27600C();
      *(_QWORD *)(v0 + 888) = sub_23A26B078(v8, v9, (uint64_t *)v33);
      v2 = v0 + 240;
      sub_23A276198();
      v1 = v0 + 120;
      swift_bridgeObjectRelease();
      sub_23A26F5D4(v0 + 600, &qword_256957E40);
      _os_log_impl(&dword_23A253000, v4, v5, "Cancelled effect with key: %{public}s", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B846D30](v7, -1, -1);
      MEMORY[0x23B846D30](v6, -1, -1);
    }
    else
    {
      sub_23A26F5D4(v0 + 600, &qword_256957E40);
    }

    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 936) + 8))(*(_QWORD *)(v0 + 944), *(_QWORD *)(v0 + 928));
  }
  else
  {

    if (qword_256956CD0 != -1)
      swift_once();
    v10 = *(_QWORD *)(v0 + 1056);
    v11 = sub_23A275E38();
    __swift_project_value_buffer(v11, (uint64_t)qword_25695AE10);
    sub_23A26E864(v0 + 240, v0 + 520);
    MEMORY[0x23B846BBC](v10);
    MEMORY[0x23B846BBC](v10);
    v12 = sub_23A275E20();
    v13 = sub_23A276144();
    v14 = os_log_type_enabled(v12, v13);
    v15 = *(void **)(v0 + 1056);
    if (v14)
    {
      v16 = swift_slowAlloc();
      v31 = (_QWORD *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      *(_QWORD *)&v33[0] = v32;
      *(_DWORD *)v16 = 136446466;
      sub_23A26E864(v0 + 520, v0 + 680);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256957E40);
      v17 = sub_23A27600C();
      *(_QWORD *)(v0 + 864) = sub_23A26B078(v17, v18, (uint64_t *)v33);
      sub_23A276198();
      swift_bridgeObjectRelease();
      sub_23A26F5D4(v0 + 520, &qword_256957E40);
      *(_WORD *)(v16 + 12) = 2114;
      MEMORY[0x23B846BBC](v15);
      v19 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 880) = v19;
      sub_23A276198();
      *v31 = v19;

      _os_log_impl(&dword_23A253000, v12, v13, "Effect \"%{public}s\" ended with error: %{public}@", (uint8_t *)v16, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(qword_2569578D0);
      swift_arrayDestroy();
      MEMORY[0x23B846D30](v31, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x23B846D30](v32, -1, -1);
      v20 = v16;
      v2 = v0 + 240;
      MEMORY[0x23B846D30](v20, -1, -1);

    }
    else
    {

      sub_23A26F5D4(v0 + 520, &qword_256957E40);
    }
    v1 = v0 + 120;
  }
  sub_23A26E864(v2, v1);
  if (*(_QWORD *)(v0 + 144))
  {
    v21 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)(v0 + 560) = *(_OWORD *)v1;
    *(_OWORD *)(v0 + 576) = v21;
    *(_QWORD *)(v0 + 592) = *(_QWORD *)(v1 + 32);
    isCancelled = swift_task_isCancelled();
    v23 = *(_QWORD *)(v0 + 984);
    v24 = *(_QWORD *)(v0 + 968);
    v25 = *(_QWORD *)(v0 + 960);
    if ((isCancelled & 1) == 0)
    {
      sub_23A2606E4(v0 + 560, v0 + 640);
      memset(v33, 0, sizeof(v33));
      swift_beginAccess();
      sub_23A26C6A8((uint64_t)v33, v0 + 640);
      swift_endAccess();
    }
    swift_release();
    swift_release();
    sub_23A260720(v0 + 560);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
    v26 = v2;
  }
  else
  {
    v27 = *(_QWORD *)(v0 + 984);
    v28 = *(_QWORD *)(v0 + 968);
    v29 = *(_QWORD *)(v0 + 960);
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    sub_23A26F5D4(v2, &qword_256957E40);
    v26 = v1;
  }
  sub_23A26F5D4(v26, &qword_256957E40);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A26DC70(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t);

  v10 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v8;
  *v8 = v6;
  v8[1] = sub_23A25FA5C;
  return v10(a6);
}

uint64_t sub_23A26DCD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_23A2760CC();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_23A2760C0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_23A26F5D4(a1, &qword_256957548);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23A276090();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_23A26DE08(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(v6 + 33) = a6;
  *(_QWORD *)(v6 + 72) = a4;
  *(_QWORD *)(v6 + 80) = a5;
  *(_QWORD *)(v6 + 64) = a3;
  *(double *)(v6 + 56) = a1;
  v7 = sub_23A27624C();
  *(_QWORD *)(v6 + 88) = v7;
  *(_QWORD *)(v6 + 96) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v6 + 104) = swift_task_alloc();
  *(_QWORD *)(v6 + 112) = swift_task_alloc();
  v8 = sub_23A276264();
  *(_QWORD *)(v6 + 120) = v8;
  *(_QWORD *)(v6 + 128) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v6 + 136) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A26DEAC()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  _QWORD *v9;

  if ((sub_23A2760F0() & 1) != 0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 96);
    v2 = *(_QWORD *)(v0 + 104);
    v4 = *(_QWORD *)(v0 + 88);
    v5 = sub_23A276420();
    v7 = v6;
    sub_23A276258();
    *(_QWORD *)(v0 + 40) = v5;
    *(_QWORD *)(v0 + 48) = v7;
    *(_QWORD *)(v0 + 24) = 0;
    *(_QWORD *)(v0 + 16) = 0;
    *(_BYTE *)(v0 + 32) = 1;
    sub_23A26E9A4(&qword_256957E68, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
    sub_23A276384();
    sub_23A26E9A4(&qword_256957E70, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
    sub_23A276270();
    v8 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
    *(_QWORD *)(v0 + 144) = v8;
    v8(v2, v4);
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v9;
    *v9 = v0;
    v9[1] = sub_23A26E034;
    return sub_23A276390();
  }
}

uint64_t sub_23A26E034()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  _QWORD *v8;
  uint64_t (*v9)(_QWORD);

  v2 = *v1;
  *(_QWORD *)(v2 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 144))(*(_QWORD *)(v2 + 112), *(_QWORD *)(v2 + 88));
    return swift_task_switch();
  }
  else
  {
    v4 = *(_QWORD *)(v2 + 136);
    v5 = *(_QWORD *)(v2 + 120);
    v6 = *(_QWORD *)(v2 + 128);
    v7 = *(int **)(v2 + 64);
    (*(void (**)(_QWORD, _QWORD))(v2 + 144))(*(_QWORD *)(v2 + 112), *(_QWORD *)(v2 + 88));
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    v9 = (uint64_t (*)(_QWORD))((char *)v7 + *v7);
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v2 + 168) = v8;
    *v8 = v2;
    v8[1] = sub_23A26E120;
    return v9(*(_QWORD *)(v2 + 80));
  }
}

uint64_t sub_23A26E120()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (!v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A26E1B0()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A26E210()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  _QWORD *v9;

  if ((*(_BYTE *)(v0 + 33) & 1) != 0 && (sub_23A2760F0() & 1) == 0)
  {
    v3 = *(_QWORD *)(v0 + 96);
    v2 = *(_QWORD *)(v0 + 104);
    v4 = *(_QWORD *)(v0 + 88);
    v5 = sub_23A276420();
    v7 = v6;
    sub_23A276258();
    *(_QWORD *)(v0 + 40) = v5;
    *(_QWORD *)(v0 + 48) = v7;
    *(_QWORD *)(v0 + 24) = 0;
    *(_QWORD *)(v0 + 16) = 0;
    *(_BYTE *)(v0 + 32) = 1;
    sub_23A26E9A4(&qword_256957E68, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
    sub_23A276384();
    sub_23A26E9A4(&qword_256957E70, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
    sub_23A276270();
    v8 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
    *(_QWORD *)(v0 + 144) = v8;
    v8(v2, v4);
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v9;
    *v9 = v0;
    v9[1] = sub_23A26E034;
    return sub_23A276390();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A26E3A0()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for SideEffectRegistry()
{
  return objc_opt_self();
}

uint64_t destroy for SideEffectRegistry.RegistryTask(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for SideEffectRegistry.RegistryTask(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SideEffectRegistry.RegistryTask(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for SideEffectRegistry.RegistryTask(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_unknownObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SideEffectRegistry.RegistryTask(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SideEffectRegistry.RegistryTask(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SideEffectRegistry.RegistryTask()
{
  return &type metadata for SideEffectRegistry.RegistryTask;
}

uint64_t sub_23A26E754()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23A26E760()
{
  swift_release();
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23A26E78C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _QWORD *v9;

  v4 = *(double *)(v1 + 24);
  v5 = *(_QWORD *)(v1 + 32);
  v6 = *(_QWORD *)(v1 + 40);
  v7 = v1 + 48;
  v8 = *(_BYTE *)(v1 + 72);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_23A25FA5C;
  return sub_23A26DE08(v4, a1, v5, v6, v7, v8);
}

uint64_t sub_23A26E81C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256957E40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A26E864(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256957E40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A26E8AC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23A26E8E0()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v2 = *(int **)(v0 + 40);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23A26C4E4;
  v6 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
  v4 = (_QWORD *)swift_task_alloc();
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_23A25FA5C;
  return v6(v0 + 56);
}

uint64_t sub_23A26E96C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256957E58);
  return sub_23A2760E4();
}

uint64_t sub_23A26E9A4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B846C88](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

double sub_23A26E9E4@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  double result;
  uint64_t v14;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_23A25FAD4(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v14 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_23A260754();
      v9 = v14;
    }
    sub_23A260720(*(_QWORD *)(v9 + 48) + 40 * v6);
    v10 = (_OWORD *)(*(_QWORD *)(v9 + 56) + (v6 << 6));
    v11 = v10[1];
    *a2 = *v10;
    a2[1] = v11;
    v12 = v10[3];
    a2[2] = v10[2];
    a2[3] = v12;
    sub_23A26EAD8(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

unint64_t sub_23A26EAD8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v16;
  unint64_t v17;
  __int128 *v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 *v22;
  __int128 *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  _BYTE v30[40];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_23A2761D4();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_23A2606E4(*(_QWORD *)(a2 + 48) + 40 * v6, (uint64_t)v30);
        v12 = sub_23A2761E0();
        result = sub_23A260720((uint64_t)v30);
        v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 >= v8 && v3 >= (uint64_t)v13)
          {
LABEL_16:
            v16 = *(_QWORD *)(a2 + 48);
            v17 = v16 + 40 * v3;
            v18 = (__int128 *)(v16 + 40 * v6);
            if (v3 != v6 || v17 >= (unint64_t)v18 + 40)
            {
              v19 = *v18;
              v20 = v18[1];
              *(_QWORD *)(v17 + 32) = *((_QWORD *)v18 + 4);
              *(_OWORD *)v17 = v19;
              *(_OWORD *)(v17 + 16) = v20;
            }
            v21 = *(_QWORD *)(a2 + 56);
            v22 = (__int128 *)(v21 + (v3 << 6));
            v23 = (__int128 *)(v21 + (v6 << 6));
            if (v3 != v6 || (v3 = v6, v22 >= v23 + 4))
            {
              v9 = *v23;
              v10 = v23[1];
              v11 = v23[3];
              v22[2] = v23[2];
              v22[3] = v11;
              *v22 = v9;
              v22[1] = v10;
              v3 = v6;
            }
          }
        }
        else if (v13 >= v8 || v3 >= (uint64_t)v13)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v24 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v25 = *v24;
    v26 = (-1 << v3) - 1;
  }
  else
  {
    v24 = (uint64_t *)(v4 + 8 * (result >> 6));
    v26 = *v24;
    v25 = (-1 << result) - 1;
  }
  *v24 = v26 & v25;
  v27 = *(_QWORD *)(a2 + 16);
  v28 = __OFSUB__(v27, 1);
  v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v29;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_23A26ECA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A26C82C(a1, a2, *(_QWORD **)(v2 + 16)) & 1;
}

uint64_t sub_23A26ECC4(uint64_t isStackAllocationSafe, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t (*v7)(_BYTE *, _BYTE *);
  char v8;
  unint64_t v9;
  size_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[2];

  v6 = a2;
  v7 = (uint64_t (*)(_BYTE *, _BYTE *))isStackAllocationSafe;
  v14[1] = *MEMORY[0x24BDAC8D0];
  v8 = *(_BYTE *)(a3 + 32);
  v9 = (unint64_t)((1 << v8) + 63) >> 6;
  v10 = 8 * v9;
  if ((v8 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe, a2, a3, a4);
    bzero((char *)v14 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v10);
    v11 = sub_23A26EE34((uint64_t)v14 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v9, a3, v7);
    if (v4)
      swift_willThrow();
    else
      return v11;
  }
  else
  {
    v12 = (void *)swift_slowAlloc();
    bzero(v12, v10);
    v6 = sub_23A26EE34((uint64_t)v12, v9, a3, v7);
    MEMORY[0x23B846D30](v12, -1, -1);
  }
  return v6;
}

uint64_t sub_23A26EE34(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(_BYTE *, _BYTE *))
{
  uint64_t v4;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  int64_t v16;
  char v17;
  unint64_t *v19;
  uint64_t v20;
  _BYTE v21[64];
  _BYTE v22[40];
  int64_t v23;

  v19 = (unint64_t *)result;
  v20 = 0;
  v7 = 0;
  v8 = a3 + 64;
  v9 = 1 << *(_BYTE *)(a3 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & *(_QWORD *)(a3 + 64);
  v23 = (unint64_t)(v9 + 63) >> 6;
  while (v11)
  {
    v12 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    v13 = v12 | (v7 << 6);
LABEL_17:
    sub_23A2606E4(*(_QWORD *)(a3 + 48) + 40 * v13, (uint64_t)v22);
    sub_23A260984(*(_QWORD *)(a3 + 56) + (v13 << 6), (uint64_t)v21);
    v17 = a4(v22, v21);
    sub_23A26F610((uint64_t)v21);
    result = sub_23A260720((uint64_t)v22);
    if (v4)
      return result;
    if ((v17 & 1) != 0)
    {
      *(unint64_t *)((char *)v19 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      v14 = __OFADD__(v20++, 1);
      if (v14)
        goto LABEL_30;
    }
  }
  v14 = __OFADD__(v7++, 1);
  if (v14)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v7 >= v23)
    return sub_23A26F02C(v19, a2, v20, a3);
  v15 = *(_QWORD *)(v8 + 8 * v7);
  if (v15)
  {
LABEL_16:
    v11 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v7 << 6);
    goto LABEL_17;
  }
  v16 = v7 + 1;
  if (v7 + 1 >= v23)
    return sub_23A26F02C(v19, a2, v20, a3);
  v15 = *(_QWORD *)(v8 + 8 * v16);
  if (v15)
    goto LABEL_15;
  v16 = v7 + 2;
  if (v7 + 2 >= v23)
    return sub_23A26F02C(v19, a2, v20, a3);
  v15 = *(_QWORD *)(v8 + 8 * v16);
  if (v15)
    goto LABEL_15;
  v16 = v7 + 3;
  if (v7 + 3 >= v23)
    return sub_23A26F02C(v19, a2, v20, a3);
  v15 = *(_QWORD *)(v8 + 8 * v16);
  if (v15)
  {
LABEL_15:
    v7 = v16;
    goto LABEL_16;
  }
  while (1)
  {
    v7 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v7 >= v23)
      return sub_23A26F02C(v19, a2, v20, a3);
    v15 = *(_QWORD *)(v8 + 8 * v7);
    ++v16;
    if (v15)
      goto LABEL_16;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23A26F02C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _OWORD v37[4];
  _OWORD v38[2];
  uint64_t v39;

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256957568);
  result = sub_23A2762A0();
  v8 = result;
  v28 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
    }
    else
    {
      v14 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_40;
      if (v14 >= v28)
        return v8;
      v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        v10 = v14 + 1;
        if (v14 + 1 >= v28)
          return v8;
        v15 = a1[v10];
        if (!v15)
        {
          v10 = v14 + 2;
          if (v14 + 2 >= v28)
            return v8;
          v15 = a1[v10];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v28)
              return v8;
            v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                v10 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_41;
                if (v10 >= v28)
                  return v8;
                v15 = a1[v10];
                ++v16;
                if (v15)
                  goto LABEL_24;
              }
            }
            v10 = v16;
          }
        }
      }
LABEL_24:
      v9 = (v15 - 1) & v15;
      v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    sub_23A2606E4(*(_QWORD *)(v4 + 48) + 40 * v13, (uint64_t)v38);
    sub_23A260984(*(_QWORD *)(v4 + 56) + (v13 << 6), (uint64_t)v37);
    v34 = v38[0];
    v35 = v38[1];
    v36 = v39;
    v30 = v37[0];
    v31 = v37[1];
    v32 = v37[2];
    v33 = v37[3];
    result = sub_23A2761E0();
    v17 = -1 << *(_BYTE *)(v8 + 32);
    v18 = result & ~v17;
    v19 = v18 >> 6;
    if (((-1 << v18) & ~*(_QWORD *)(v11 + 8 * (v18 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v18) & ~*(_QWORD *)(v11 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v21 = 0;
      v22 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v22 && (v21 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v23 = v19 == v22;
        if (v19 == v22)
          v19 = 0;
        v21 |= v23;
        v24 = *(_QWORD *)(v11 + 8 * v19);
      }
      while (v24 == -1);
      v20 = __clz(__rbit64(~v24)) + (v19 << 6);
    }
    *(_QWORD *)(v11 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    v25 = *(_QWORD *)(v8 + 48) + 40 * v20;
    *(_OWORD *)v25 = v34;
    *(_OWORD *)(v25 + 16) = v35;
    *(_QWORD *)(v25 + 32) = v36;
    v26 = (_OWORD *)(*(_QWORD *)(v8 + 56) + (v20 << 6));
    *v26 = v30;
    v26[1] = v31;
    v26[2] = v32;
    v26[3] = v33;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    if (!v5)
      return v8;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_23A26F308(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  char v15;
  char v16;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v18;
  __int128 *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[6];
  uint64_t v30;
  _OWORD v31[2];
  _OWORD v32[4];
  uint64_t v33;
  int64_t v34;

  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v6 = (uint64_t *)(a2 + 112);
  v34 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_24;
    }
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v11 >= v34)
      return swift_release();
    v12 = *(_QWORD *)(v23 + 8 * v11);
    ++v8;
    if (!v12)
    {
      v8 = v11 + 1;
      if (v11 + 1 >= v34)
        return swift_release();
      v12 = *(_QWORD *)(v23 + 8 * v8);
      if (!v12)
      {
        v8 = v11 + 2;
        if (v11 + 2 >= v34)
          return swift_release();
        v12 = *(_QWORD *)(v23 + 8 * v8);
        if (!v12)
        {
          v8 = v11 + 3;
          if (v11 + 3 >= v34)
            return swift_release();
          v12 = *(_QWORD *)(v23 + 8 * v8);
          if (!v12)
            break;
        }
      }
    }
LABEL_23:
    v5 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_24:
    sub_23A2606E4(*(_QWORD *)(a1 + 48) + 40 * v10, (uint64_t)v31);
    sub_23A260984(*(_QWORD *)(a1 + 56) + (v10 << 6), (uint64_t)v32 + 8);
    v29[4] = v32[2];
    v29[5] = v32[3];
    v30 = v33;
    v29[0] = v31[0];
    v29[1] = v31[1];
    v29[2] = v32[0];
    v29[3] = v32[1];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v14 = sub_23A25FAD4((uint64_t)v29);
    v16 = v15;
    swift_bridgeObjectRelease();
    if ((v16 & 1) != 0)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v18 = *v6;
      v24 = *v6;
      *v6 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_23A260754();
        v18 = v24;
      }
      sub_23A260720(*(_QWORD *)(v18 + 48) + 40 * v14);
      v19 = (__int128 *)(*(_QWORD *)(v18 + 56) + (v14 << 6));
      v21 = *v19;
      v20 = v19[1];
      v22 = v19[3];
      v27 = v19[2];
      v28 = v22;
      v25 = v21;
      v26 = v20;
      sub_23A26EAD8(v14, v18);
      *v6 = v18;
      swift_bridgeObjectRelease();
    }
    else
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
    }
    sub_23A26F5D4((uint64_t)&v25, &qword_256957E60);
    swift_endAccess();
    result = sub_23A26F5D4((uint64_t)v29, qword_256957E80);
  }
  v13 = v11 + 4;
  if (v13 >= v34)
    return swift_release();
  v12 = *(_QWORD *)(v23 + 8 * v13);
  if (v12)
  {
    v8 = v13;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v8 >= v34)
      return swift_release();
    v12 = *(_QWORD *)(v23 + 8 * v8);
    ++v13;
    if (v12)
      goto LABEL_23;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23A26F5D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23A26F610(uint64_t a1)
{
  destroy for SideEffectRegistry.RegistryTask(a1);
  return a1;
}

uint64_t Binding.init<A>(store:get:action:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  sub_23A2760B4();
  swift_retain();
  swift_retain();
  v12 = sub_23A2760A8();
  v13 = (_QWORD *)swift_allocObject();
  v14 = MEMORY[0x24BEE6930];
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = a6;
  v13[5] = a2;
  v13[6] = a3;
  v13[7] = a1;
  swift_retain();
  sub_23A26C2A8(a4);
  v15 = sub_23A2760A8();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v15;
  v16[3] = v14;
  v16[4] = a6;
  v16[5] = a4;
  v16[6] = a5;
  v16[7] = a1;
  sub_23A275EE0();
  sub_23A26C2B8(a4);
  swift_release();
  return swift_release();
}

uint64_t sub_23A26F760()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A26F794()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 40))(*(_QWORD *)(v0 + 56));
}

uint64_t sub_23A26F7BC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  uint64_t v14;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  result = MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v8, v9, v10);
  v13 = (char *)&v14 - v12;
  if (a4)
  {
    swift_retain();
    a4(a1);
    Store.send(_:)((uint64_t)v13);
    sub_23A26C2B8((uint64_t)a4);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v13, AssociatedTypeWitness);
  }
  return result;
}

uint64_t sub_23A26F890()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  if (*(_QWORD *)(v0 + 40))
    swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A26F8CC(uint64_t a1)
{
  uint64_t v1;

  return sub_23A26F7BC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(uint64_t))(v1 + 40));
}

uint64_t *sub_23A26F8DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 3)
    {
      v11 = sub_23A275DA8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v8 = sub_23A275E14();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_23A26F9F0(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 4)
    return swift_bridgeObjectRelease();
  if ((_DWORD)result == 3)
  {
    v3 = sub_23A275DA8();
  }
  else
  {
    if ((_DWORD)result)
      return result;
    v3 = sub_23A275E14();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
}

_QWORD *sub_23A26FA64(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 3)
  {
    v9 = sub_23A275DA8();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_23A275E14();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *sub_23A26FB50(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_23A26860C((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 3)
    {
      v8 = sub_23A275DA8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_23A275E14();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t type metadata accessor for DatabaseBinding()
{
  uint64_t result;

  result = qword_256957EF8;
  if (!qword_256957EF8)
    return swift_getSingletonMetadata();
  return result;
}

void *sub_23A26FC90(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    v8 = sub_23A275DA8();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_23A275E14();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_23A26FD54(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_23A26860C((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      v8 = sub_23A275DA8();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_23A275E14();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_23A26FE28()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23A275E14();
  if (v1 <= 0x3F)
  {
    result = sub_23A275DA8();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t AsyncStateResolver.init(store:keyPath:fetchValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

Swift::Void __swiftcall AsyncStateResolver.resolve()()
{
  uint64_t v0;
  uint64_t *v1;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t ObjectType;
  char *v50;
  _QWORD v51[20];

  v2 = v0;
  v3 = sub_23A275E14();
  v51[5] = *(_QWORD *)(v3 - 8);
  v51[6] = v3;
  v7 = MEMORY[0x24BDAC7A8](v3, v4, v5, v6);
  v51[4] = (char *)v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v7, v9, v10, v11);
  v51[3] = (char *)v51 - v13;
  v17 = MEMORY[0x24BDAC7A8](v12, v14, v15, v16);
  v51[8] = (char *)v51 - v18;
  v19 = *(_QWORD *)(v2 + 24);
  v51[13] = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v17, v20, v21, v22);
  v51[7] = (char *)v51 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51[12] = v2;
  v24 = *(_QWORD *)(v2 + 40);
  v26 = type metadata accessor for AsyncStateValue(0, v19, v24, v25);
  v27 = *(_QWORD *)(v26 - 8);
  v31 = MEMORY[0x24BDAC7A8](v26, v28, v29, v30);
  v51[11] = (char *)v51 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31, v33, v34, v35);
  v37 = (char *)v51 - v36;
  v39 = type metadata accessor for AsyncState(0, v19, v24, v38);
  v51[14] = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39, v40, v41, v42);
  v44 = (char *)v51 - v43;
  v46 = *v1;
  v45 = v1[1];
  v47 = v1[2];
  v51[9] = v1[3];
  v51[10] = v47;
  v48 = *(_QWORD *)(v46 + 32);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 64))(v45, v39, ObjectType, v48);
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v37, v44, v26);
  v50 = (char *)sub_23A2700C0 + 4 * byte_23A278630[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A2700C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 128) + 8))(v3, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 136) + 8))(v0, v1);
}

uint64_t sub_23A2702D8(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t *v3;
  uint64_t *v4;
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
  void (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t ObjectType;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  __int128 v62;

  v4 = v3;
  v53 = a1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256957548);
  MEMORY[0x24BDAC7A8](v7, v8, v9, v10);
  v58 = (char *)&ObjectType - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = a2;
  v12 = *(_QWORD *)(a2 + 24);
  v13 = *(_QWORD *)(a2 + 40);
  v15 = type metadata accessor for AsyncStateValue(0, v12, v13, v14);
  v16 = *(_QWORD *)(v15 - 8);
  v59 = *(_QWORD *)(v16 + 64);
  v17 = v16;
  v54 = v16;
  MEMORY[0x24BDAC7A8](v15, v18, v19, v20);
  v61 = (char *)&ObjectType - v21;
  v56 = v12;
  v57 = v13;
  v23 = type metadata accessor for AsyncState(0, v12, v13, v22);
  v51 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23, v24, v25, v26);
  v28 = (char *)&ObjectType - v27;
  v52 = *v4;
  v55 = v4[3];
  v29 = *(_QWORD *)(v52 + 32);
  ObjectType = swift_getObjectType();
  v30 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  v62 = *(_OWORD *)(v4 + 1);
  v31 = (uint64_t)v61;
  v32 = v53;
  v30(v61, v53, v15);
  AsyncState.init(value:ttl:)(v31, v12, v13, v33, (uint64_t)v28, a3);
  (*(void (**)(_QWORD, char *, uint64_t, uint64_t, uint64_t))(v29 + 80))(v62, v28, v23, ObjectType, v29);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v28, v23);
  v34 = sub_23A2760CC();
  v35 = (uint64_t)v58;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v58, 1, 1, v34);
  v36 = v61;
  v37 = v15;
  v30(v61, v32, v15);
  sub_23A2760B4();
  v38 = v52;
  swift_retain();
  swift_retain();
  v39 = v55;
  swift_retain();
  v40 = sub_23A2760A8();
  v41 = v54;
  v42 = (*(unsigned __int8 *)(v54 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
  v43 = (v59 + v42 + 7) & 0xFFFFFFFFFFFFFFF8;
  v44 = swift_allocObject();
  v45 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v44 + 16) = v40;
  *(_QWORD *)(v44 + 24) = v45;
  v46 = v60;
  v47 = v56;
  *(_QWORD *)(v44 + 32) = *(_QWORD *)(v60 + 16);
  *(_QWORD *)(v44 + 40) = v47;
  v48 = v57;
  *(_QWORD *)(v44 + 48) = *(_QWORD *)(v46 + 32);
  *(_QWORD *)(v44 + 56) = v48;
  *(_QWORD *)(v44 + 64) = v38;
  *(_OWORD *)(v44 + 72) = v62;
  *(_QWORD *)(v44 + 88) = v39;
  (*(void (**)(unint64_t, char *, uint64_t))(v41 + 32))(v44 + v42, v36, v37);
  *(double *)(v44 + v43) = a3;
  sub_23A273D3C(v35, (uint64_t)&unk_256957FB8, v44);
  return swift_release();
}

Swift::Void __swiftcall AsyncStateResolver.refresh()()
{
  uint64_t v0;
  uint64_t *v1;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t ObjectType;
  char *v31;
  _QWORD v32[14];

  v2 = *(_QWORD *)(v0 + 24);
  v32[4] = *(_QWORD *)(v2 - 8);
  v3 = ((uint64_t (*)())MEMORY[0x24BDAC7A8])();
  v32[3] = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32[8] = v3;
  v5 = *(_QWORD *)(v3 + 40);
  v7 = type metadata accessor for AsyncStateValue(0, v2, v5, v6);
  v8 = *(_QWORD *)(v7 - 8);
  v12 = MEMORY[0x24BDAC7A8](v7, v9, v10, v11);
  v32[7] = (char *)v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12, v14, v15, v16);
  v18 = (char *)v32 - v17;
  v20 = type metadata accessor for AsyncState(0, v2, v5, v19);
  v32[9] = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20, v21, v22, v23);
  v25 = (char *)v32 - v24;
  v26 = *v1;
  v27 = v1[1];
  v28 = v1[2];
  v32[5] = v1[3];
  v32[6] = v28;
  v29 = *(_QWORD *)(v26 + 32);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 64))(v27, v20, ObjectType, v29);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v18, v25, v7);
  v31 = (char *)sub_23A270724 + 4 * byte_23A278635[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A270724()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 120) + 8))(v2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 160) + 8))(v3, v0);
}

Swift::Void __swiftcall AsyncStateResolver.reset()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
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
  uint64_t ObjectType;
  uint64_t v16;
  uint64_t v17;

  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = type metadata accessor for AsyncState(0, v3, v4, v1);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7, v8, v9);
  v11 = (char *)&v17 - v10;
  v12 = *v2;
  v13 = v2[1];
  v14 = *(_QWORD *)(v12 + 32);
  ObjectType = swift_getObjectType();
  AsyncState.init()(v3, v4, v16, (uint64_t)v11);
  (*(void (**)(uint64_t, char *, uint64_t, uint64_t, uint64_t))(v14 + 80))(v13, v11, v5, ObjectType, v14);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
}

uint64_t sub_23A27098C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23A270994()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23A2709C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_23A270A20(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_23A270A94(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

void type metadata accessor for AsyncStateResolver()
{
  JUMPOUT(0x23B846C04);
}

uint64_t sub_23A270AEC(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_QWORD *)(v9 + 80) = v17;
  *(_QWORD *)(v9 + 88) = v18;
  *(_QWORD *)(v9 + 64) = v15;
  *(_QWORD *)(v9 + 72) = v16;
  *(double *)(v9 + 56) = a1;
  *(_QWORD *)(v9 + 40) = a8;
  *(_QWORD *)(v9 + 48) = a9;
  *(_QWORD *)(v9 + 24) = a6;
  *(_QWORD *)(v9 + 32) = a7;
  *(_QWORD *)(v9 + 16) = a5;
  *(_QWORD *)(v9 + 96) = *(_QWORD *)(v16 - 8);
  v11 = swift_task_alloc();
  *(_QWORD *)(v9 + 104) = v11;
  *(_QWORD *)(v9 + 112) = sub_23A2760B4();
  *(_QWORD *)(v9 + 120) = sub_23A2760A8();
  v14 = (uint64_t (*)(uint64_t))((char *)a7 + *a7);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v9 + 128) = v12;
  *v12 = v9;
  v12[1] = sub_23A270BB4;
  return v14(v11);
}

uint64_t sub_23A270BB4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    *(_QWORD *)(v2 + 152) = sub_23A276090();
    *(_QWORD *)(v2 + 160) = v3;
  }
  return swift_task_switch();
}

uint64_t sub_23A270C38()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 144) = sub_23A2760A8();
  sub_23A276090();
  return swift_task_switch();
}

void sub_23A270C98()
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

  v10 = v0[13];
  v2 = v0[10];
  v1 = v0[11];
  v4 = v0[8];
  v3 = v0[9];
  v6 = v0[5];
  v5 = v0[6];
  v7 = v0[3];
  v8 = v0[4];
  v9 = v0[2];
  swift_release();
  sub_23A2711E0(v9, v7, v8, v6, v5, v10, v4, v3, v2, v1);
}

uint64_t sub_23A270D24()
{
  sub_23A276090();
  return swift_task_switch();
}

uint64_t sub_23A270D70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 96);
  v1 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 72);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A270DC8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  if (qword_256956CD0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 136);
  v2 = sub_23A275E38();
  __swift_project_value_buffer(v2, (uint64_t)qword_25695AE10);
  sub_23A26884C(v1);
  *(_QWORD *)(v0 + 168) = sub_23A275D3C();
  return swift_task_switch();
}

uint64_t sub_23A270E54()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 176) = sub_23A2760A8();
  sub_23A276090();
  return swift_task_switch();
}

void sub_23A270EB4()
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

  v10 = v0[21];
  v1 = v0[10];
  v2 = v0[11];
  v4 = v0[8];
  v3 = v0[9];
  v6 = v0[5];
  v5 = v0[6];
  v8 = v0[3];
  v7 = v0[4];
  v9 = v0[2];
  swift_release();
  sub_23A27141C(v9, v8, v7, v6, v5, v10, v4, v3, v1, v2);
}

uint64_t sub_23A270F30()
{
  return swift_task_switch();
}

uint64_t sub_23A270F60()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 168);
  v2 = *(void **)(v0 + 136);
  swift_release();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A270FAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int EnumCaseMultiPayload;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(v4 + 40);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AsyncStateValue(0, v5, *(_QWORD *)(v4 + 56), a4) - 8)
                          + 80);
  v7 = (v6 + 96) & ~v6;
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 1:
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4 + v7, v5);
      v9 = sub_23A275E14();
      v10 = v4 + v7 + *(int *)(swift_getTupleTypeMetadata2() + 48);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v10, v9);
      break;
    case 0:
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4 + v7, v5);
      break;
  }
  return swift_deallocObject();
}

uint64_t sub_23A2710E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  double v14;
  _QWORD *v15;
  uint64_t v17;

  v6 = *(_QWORD *)(type metadata accessor for AsyncStateValue(0, v4[5], v4[7], a4) - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = v4[2];
  v9 = v4[3];
  v10 = v4[8];
  v11 = v4[9];
  v13 = (int *)v4[10];
  v12 = v4[11];
  v17 = (uint64_t)v4 + v7;
  v14 = *(double *)((char *)v4 + ((*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFF8));
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v15;
  *v15 = v5;
  v15[1] = sub_23A25FA5C;
  return sub_23A270AEC(v14, a1, v8, v9, v10, v11, v13, v12, v17);
}

void sub_23A2711E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
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
  char *v24;
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

  v26 = a6;
  v27 = a7;
  v28 = a5;
  v25 = type metadata accessor for AsyncStateValue(0, a8, a10, a4);
  MEMORY[0x24BDAC7A8](v25, v11, v12, v13);
  v15 = type metadata accessor for AsyncState(0, a8, a10, v14);
  v29 = *(_QWORD *)(v15 - 8);
  v30 = v15;
  v19 = MEMORY[0x24BDAC7A8](v15, v16, v17, v18);
  v24 = (char *)&v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19, v21, v22, v23);
  swift_getObjectType();
  v31 = v27;
  v32 = a8;
  v33 = a9;
  v34 = a10;
  type metadata accessor for AsyncStateResolver();
}

uint64_t sub_23A2712E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;

  v13 = *(void (**)(uint64_t))(v5 + 64);
  v14 = type metadata accessor for AsyncState(0, *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 40), a4);
  *(_QWORD *)(v11 - 152) = v10;
  v15 = v10;
  v16 = v14;
  v13(v15);
  static AsyncStateValue.== infix(_:_:)(v8, *(_QWORD *)(v11 - 144), v6, v7);
  if ((v17 & 1) != 0)
  {
    sub_23A275E14();
    swift_getTupleTypeMetadata2();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v4, *(_QWORD *)(v11 - 160), v6);
    sub_23A275E08();
    swift_storeEnumTagMultiPayload();
    v18 = *(_QWORD *)(v11 - 176);
    AsyncState.init(value:ttl:)(v4, v6, v7, v19, v18, v12);
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 80))(*(_QWORD *)(v11 - 152), v18, v16, v9, v5);
    v20 = *(_QWORD *)(v11 - 128);
    v21 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 136) + 8);
    v21(v18, v20);
    v22 = v20;
  }
  else
  {
    v22 = *(_QWORD *)(v11 - 128);
    v21 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 136) + 8);
  }
  return ((uint64_t (*)(uint64_t, uint64_t))v21)(v8, v22);
}

void sub_23A27141C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
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
  _QWORD v24[6];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v26 = a7;
  v27 = a5;
  v24[4] = a6;
  v25 = type metadata accessor for AsyncStateValue(0, a8, a10, a4);
  MEMORY[0x24BDAC7A8](v25, v11, v12, v13);
  v15 = type metadata accessor for AsyncState(0, a8, a10, v14);
  v28 = *(_QWORD *)(v15 - 8);
  v29 = v15;
  v19 = MEMORY[0x24BDAC7A8](v15, v16, v17, v18);
  v24[5] = (char *)v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19, v21, v22, v23);
  swift_getObjectType();
  v30 = v26;
  v31 = a8;
  v32 = a9;
  v33 = a10;
  type metadata accessor for AsyncStateResolver();
}

uint64_t sub_23A271524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  double v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  char v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  uint64_t v30;

  v14 = *(void (**)(uint64_t))(v10 + 64);
  v15 = type metadata accessor for AsyncState(0, *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 40), a4);
  *(_QWORD *)(v12 - 152) = v7;
  *(_QWORD *)(v12 - 200) = v15;
  *(_QWORD *)(v12 - 192) = v4;
  *(_QWORD *)(v12 - 184) = v5;
  v14(v7);
  static AsyncStateValue.== infix(_:_:)(v9, *(_QWORD *)(v12 - 144), v6, v8);
  if ((v16 & 1) != 0)
  {
    v17 = *(void **)(v12 - 176);
    v18 = objc_msgSend(v17, sel_domain);
    v19 = sub_23A275FD0();
    *(_QWORD *)(v12 - 144) = v20;

    *(_QWORD *)(v12 - 208) = objc_msgSend(v17, sel_code);
    v21 = objc_msgSend(v17, sel_localizedDescription);
    v22 = sub_23A275FD0();
    v24 = v23;

    v25 = *(_QWORD *)(v12 - 144);
    *v11 = v19;
    v11[1] = v25;
    v11[2] = *(_QWORD *)(v12 - 208);
    v11[3] = v22;
    v11[4] = v24;
    swift_storeEnumTagMultiPayload();
    v26 = *(_QWORD *)(v12 - 168);
    AsyncState.init(value:ttl:)((uint64_t)v11, v6, v8, v27, v26, v13);
    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, uint64_t))(v10 + 80))(*(_QWORD *)(v12 - 152), v26, *(_QWORD *)(v12 - 200), *(_QWORD *)(v12 - 184), v10);
    v28 = *(_QWORD *)(v12 - 128);
    v29 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 136) + 8);
    v29(v26, v28);
    v30 = v28;
  }
  else
  {
    v30 = *(_QWORD *)(v12 - 128);
    v29 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 136) + 8);
  }
  return ((uint64_t (*)(uint64_t, uint64_t))v29)(v9, v30);
}

uint64_t getEnumTagSinglePayload for DatabaseConnection(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)a1)
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for DatabaseConnection(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for DatabaseConnection()
{
  return &type metadata for DatabaseConnection;
}

uint64_t sub_23A271724(uint64_t a1, uint64_t a2, sqlite3 *a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v4 = sub_23A276018();
  v5 = sqlite3_exec(a3, (const char *)(v4 + 32), 0, 0, 0);
  result = swift_release();
  if (v5)
  {
    if (sqlite3_errstr(v5))
    {
      v7 = sub_23A27603C();
      v9 = v8;
    }
    else
    {
      v9 = 0xE300000000000000;
      v7 = 4271950;
    }
    sub_23A271D5C();
    swift_allocError();
    *(_QWORD *)v10 = v5;
    *(_QWORD *)(v10 + 8) = v7;
    *(_QWORD *)(v10 + 16) = v9;
    *(_BYTE *)(v10 + 24) = 1;
    return swift_willThrow();
  }
  return result;
}

void sub_23A2717E4(uint64_t a1, uint64_t a2, uint64_t a3, sqlite3 *a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
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
  _QWORD *v26;
  sqlite3_stmt *v27;
  sqlite3_stmt *v28;
  uint64_t v29;
  uint64_t v30;
  sqlite3_stmt *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  unsigned int v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  unsigned int v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unsigned int v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256957BA0);
  v13 = MEMORY[0x24BDAC7A8](v9, v10, v11, v12);
  v15 = (uint64_t *)((char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19 = MEMORY[0x24BDAC7A8](v13, v16, v17, v18);
  v21 = (char *)&v59 - v20;
  MEMORY[0x24BDAC7A8](v19, v22, v23, v24);
  v26 = (uint64_t *)((char *)&v59 - v25);
  v27 = sub_23A271C28(a1, a2, a4);
  if (v4)
    return;
  v28 = v27;
  v61 = *(_QWORD *)(a3 + 16);
  if (!v61)
    goto LABEL_21;
  v65 = v21;
  v59 = 0;
  v29 = a3 + 32;
  swift_bridgeObjectRetain();
  v30 = 0;
  v62 = a3;
  v60 = a3 + 32;
  while (1)
  {
    v31 = v28;
    v32 = *(_QWORD *)(v29 + 8 * v30);
    v33 = *(_QWORD *)(v32 + 16);
    v63 = v30;
    v64 = v32;
    swift_bridgeObjectRetain_n();
    if (v33)
    {
      v34 = 0;
      v35 = *(_QWORD *)(type metadata accessor for DatabaseBinding() - 8);
      v36 = v64 + ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80));
      v37 = *(_QWORD *)(v35 + 72);
      while (1)
      {
        v38 = (uint64_t)&v65[*(int *)(v9 + 48)];
        sub_23A268238(v36, v38);
        v39 = (uint64_t)v26 + *(int *)(v9 + 48);
        *v26 = v34;
        sub_23A26827C(v38, v39);
        sub_23A2682C0((uint64_t)v26, (uint64_t)v15);
        v40 = *v15 + 1;
        if (__OFADD__(*v15, 1))
        {
          __break(1u);
LABEL_32:
          __break(1u);
LABEL_33:
          __break(1u);
          return;
        }
        if (v40 < (uint64_t)0xFFFFFFFF80000000)
          goto LABEL_32;
        if (v40 > 0x7FFFFFFF)
          goto LABEL_33;
        sub_23A268308((uint64_t)v15 + *(int *)(v9 + 48), v40, (uint64_t)v31);
        if (v41)
          break;
        ++v34;
        sub_23A2685CC((uint64_t)v15);
        v36 += v37;
        if (v33 == v34)
          goto LABEL_11;
      }
      v44 = v41;
      if (sqlite3_errstr(v41))
      {
        v45 = sub_23A27603C();
        v47 = v46;
      }
      else
      {
        v45 = 4271950;
        v47 = 0xE300000000000000;
      }
      v28 = v31;
      sub_23A268588();
      swift_allocError();
      *v48 = v44;
      v48[1] = v45;
      v48[2] = v47;
      swift_willThrow();
      sub_23A2685CC((uint64_t)v15);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
LABEL_11:
    swift_bridgeObjectRelease_n();
    v28 = v31;
    v42 = sqlite3_step(v31);
    if (v42 != 101)
    {
      v49 = v42;
      if (sqlite3_errstr(v42))
      {
        v50 = sub_23A27603C();
        v52 = v51;
      }
      else
      {
        v50 = 4271950;
        v52 = 0xE300000000000000;
      }
      sub_23A268588();
      swift_allocError();
      *v57 = v49 | 0x4000000000000000;
      v57[1] = v50;
      v57[2] = v52;
      swift_willThrow();
LABEL_19:
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    swift_bridgeObjectRelease();
    v43 = sqlite3_reset(v31);
    if (v43)
      break;
    v30 = v63 + 1;
    v29 = v60;
    if (v63 + 1 == v61)
      goto LABEL_20;
  }
  v53 = v43;
  if (sqlite3_errstr(v43))
  {
    v54 = sub_23A27603C();
    v56 = v55;
  }
  else
  {
    v54 = 4271950;
    v56 = 0xE300000000000000;
  }
  sub_23A268588();
  swift_allocError();
  *v58 = v53 | 0x6000000000000000;
  v58[1] = v54;
  v58[2] = v56;
  swift_willThrow();
LABEL_20:
  swift_bridgeObjectRelease();
LABEL_21:
  sub_23A271DA0(v28);
}

uint64_t sub_23A271B98(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(sqlite3_stmt *), uint64_t a5, sqlite3 *a6, uint64_t a7)
{
  uint64_t v7;
  sqlite3_stmt *v12;
  sqlite3_stmt *v13;

  v12 = sub_23A271C28(a1, a2, a6);
  if (!v7)
  {
    v13 = v12;
    a7 = sub_23A267EB0(a3, a4, a5, v12, a7);
    sub_23A271DA0(v13);
  }
  return a7;
}

sqlite3_stmt *sub_23A271C28(uint64_t a1, uint64_t a2, sqlite3 *a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  sqlite3_stmt *result;
  uint64_t v10;
  char v11;
  sqlite3_stmt *v12[2];

  v12[1] = *(sqlite3_stmt **)MEMORY[0x24BDAC8D0];
  v12[0] = 0;
  v4 = sub_23A276018();
  v5 = sqlite3_prepare_v2(a3, (const char *)(v4 + 32), -1, v12, 0);
  swift_release();
  if (v5)
  {
    if (sqlite3_errstr(v5))
    {
      v6 = sub_23A27603C();
      v8 = v7;
    }
    else
    {
      v8 = 0xE300000000000000;
      v6 = 4271950;
    }
    sub_23A271D5C();
    swift_allocError();
    *(_QWORD *)v10 = v5;
    *(_QWORD *)(v10 + 8) = v6;
    *(_QWORD *)(v10 + 16) = v8;
    v11 = 2;
  }
  else
  {
    result = v12[0];
    if (v12[0])
      return result;
    sub_23A271D5C();
    swift_allocError();
    *(_QWORD *)(v10 + 8) = 0;
    *(_QWORD *)(v10 + 16) = 0;
    *(_QWORD *)v10 = 1;
    v11 = 4;
  }
  *(_BYTE *)(v10 + 24) = v11;
  return (sqlite3_stmt *)swift_willThrow();
}

unint64_t sub_23A271D5C()
{
  unint64_t result;

  result = qword_256957FC0;
  if (!qword_256957FC0)
  {
    result = MEMORY[0x23B846C88](&unk_23A2786BC, &type metadata for DatabaseConnection.Failure);
    atomic_store(result, (unint64_t *)&qword_256957FC0);
  }
  return result;
}

void sub_23A271DA0(sqlite3_stmt *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;

  v2 = sub_23A275E38();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4, v5, v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sqlite3_finalize(a1);
  if (v9)
  {
    v10 = v9;
    if (qword_256956CD0 != -1)
      swift_once();
    v11 = __swift_project_value_buffer(v2, (uint64_t)qword_25695AE10);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v11, v2);
    if (sqlite3_errstr(v10))
    {
      v12 = sub_23A27603C();
      v14 = v13;
    }
    else
    {
      v14 = 0xE300000000000000;
      v12 = 4271950;
    }
    v15 = v10 | 0x2000000000000000;
    sub_23A268588();
    v16 = (void *)swift_allocError();
    *v17 = v15;
    v17[1] = v12;
    v17[2] = v14;
    sub_23A26884C(v16);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);

  }
}

sqlite3 *sub_23A271EE0(void *a1, void *a2, char a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void (*v38)(char *, uint64_t);
  char *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  void *v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  sqlite3 *result;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  id v62[2];
  sqlite3 *ppDb[2];

  v60 = a1;
  ppDb[1] = *(sqlite3 **)MEMORY[0x24BDAC8D0];
  v6 = sub_23A275D54();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10);
  v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23A275DA8();
  v17 = MEMORY[0x24BDAC7A8](v13, v14, v15, v16);
  v19 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v17, v20, v21, v22);
  v25 = (char *)&v56 - v24;
  v29 = MEMORY[0x24BDAC7A8](v23, v26, v27, v28);
  v32 = (char *)&v56 - v31;
  ppDb[0] = 0;
  if (a3)
  {
    if (a3 == 1)
    {
      swift_bridgeObjectRetain();
      v33 = (uint64_t)v60;
    }
    else
    {
      a2 = (void *)0xE800000000000000;
      v33 = 0x3A79726F6D656D3ALL;
    }
  }
  else
  {
    v57 = v30;
    v58 = v29;
    v59 = v3;
    v34 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v62[0] = 0;
    v35 = objc_msgSend(v34, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 9, 1, 0, 0, v62);

    v36 = v62[0];
    if (!v35)
    {
      v55 = v62[0];
      sub_23A275D48();

      return (sqlite3 *)swift_willThrow();
    }
    sub_23A275D84();
    v37 = v36;

    v62[0] = v60;
    v62[1] = a2;
    (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v12, *MEMORY[0x24BDCD7A0], v6);
    sub_23A25F900();
    sub_23A275D9C();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    sub_23A275D78();
    v38 = *(void (**)(char *, uint64_t))(v57 + 8);
    v39 = v19;
    v40 = v58;
    v38(v39, v58);
    v33 = sub_23A275D90();
    a2 = v41;
    v38(v25, v40);
    v38(v32, v40);
  }
  if (qword_256956CD0 != -1)
    swift_once();
  v42 = sub_23A275E38();
  __swift_project_value_buffer(v42, (uint64_t)qword_25695AE10);
  swift_bridgeObjectRetain_n();
  v43 = sub_23A275E20();
  v44 = sub_23A276150();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = (uint8_t *)swift_slowAlloc();
    v46 = (void *)swift_slowAlloc();
    v62[0] = v46;
    *(_DWORD *)v45 = 136315138;
    swift_bridgeObjectRetain();
    v61 = sub_23A26B078(v33, (unint64_t)a2, (uint64_t *)v62);
    sub_23A276198();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A253000, v43, v44, "Opening database connection: %s", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B846D30](v46, -1, -1);
    MEMORY[0x23B846D30](v45, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v47 = sub_23A276018();
  swift_bridgeObjectRelease();
  v48 = sqlite3_open_v2((const char *)(v47 + 32), ppDb, 65542, 0);
  swift_release();
  if (v48)
  {
    if (sqlite3_errstr(v48))
    {
      v49 = sub_23A27603C();
      v51 = v50;
    }
    else
    {
      v51 = 0xE300000000000000;
      v49 = 4271950;
    }
    sub_23A271D5C();
    swift_allocError();
    *(_QWORD *)v54 = v48;
    *(_QWORD *)(v54 + 8) = v49;
    *(_QWORD *)(v54 + 16) = v51;
    *(_BYTE *)(v54 + 24) = 0;
  }
  else
  {
    result = ppDb[0];
    if (ppDb[0])
      return result;
    sub_23A271D5C();
    swift_allocError();
    *(_QWORD *)(v53 + 8) = 0;
    *(_QWORD *)(v53 + 16) = 0;
    *(_QWORD *)v53 = 0;
    *(_BYTE *)(v53 + 24) = 4;
  }
  return (sqlite3 *)swift_willThrow();
}

uint64_t sub_23A2723D4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t result;

  if (a4 < 4u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for DatabaseConnection.Failure(uint64_t a1)
{
  return sub_23A272410(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t sub_23A272410(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t result;

  if (a4 < 4u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t initializeWithCopy for DatabaseConnection.Failure(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23A2723D4(*(_QWORD *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for DatabaseConnection.Failure(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23A2723D4(*(_QWORD *)a2, v4, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_23A272410(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DatabaseConnection.Failure(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_23A272410(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DatabaseConnection.Failure(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 4)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DatabaseConnection.Failure(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 252;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_23A2725F0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 3u)
    return *(unsigned __int8 *)(a1 + 24);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_23A272608(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = a2 - 4;
  if (a2 >= 4)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    LOBYTE(a2) = 4;
    *(_QWORD *)result = v2;
  }
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DatabaseConnection.Failure()
{
  return &type metadata for DatabaseConnection.Failure;
}

uint64_t sub_23A272634@<X0>(uint64_t a1@<X0>, uint64_t a2@<X4>, _QWORD *a3@<X8>)
{
  a3[2] = 0;
  swift_unknownObjectWeakInit();
  *a3 = a1;
  a3[2] = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t StoreProxy.send(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_23A2726A4()
{
  uint64_t v0;

  sub_23A2760B4();
  *(_QWORD *)(v0 + 40) = sub_23A2760A8();
  sub_23A276090();
  return swift_task_switch();
}

uint64_t sub_23A27270C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[4];
  v2 = v0[2];
  v3 = v0[3];
  swift_release();
  sub_23A272770(v1, v2, *(_QWORD *)(v3 + 16), v4);
  return swift_task_switch();
}

uint64_t sub_23A272768()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23A272770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t ObjectType;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  _QWORD v42[2];
  uint64_t v43;
  id v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;

  v8 = *(_QWORD *)(a3 - 8);
  v9 = MEMORY[0x24BDAC7A8](a1, a2, a3, a4);
  v11 = (char *)v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v9, v12, v13, v14);
  v17 = (uint8_t *)v42 - v16;
  MEMORY[0x24BDAC7A8](v15, v18, v19, v20);
  v22 = (char *)v42 - v21;
  sub_23A2760FC();
  if (v4)
  {
    v45 = v17;
    if (qword_256956CD0 != -1)
      swift_once();
    v23 = sub_23A275E38();
    __swift_project_value_buffer(v23, (uint64_t)qword_25695AE10);
    v24 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    v24(v11, a2, a3);
    v25 = sub_23A275E20();
    v26 = sub_23A276144();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      v44 = v4;
      v29 = v28;
      v47 = v28;
      v43 = v8;
      *(_DWORD *)v27 = 136446210;
      v42[1] = v27 + 4;
      v24((char *)v45, (uint64_t)v11, a3);
      v30 = sub_23A27600C();
      v46 = sub_23A26B078(v30, v31, &v47);
      sub_23A276198();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v11, a3);
      _os_log_impl(&dword_23A253000, v25, v26, "Task cancelled, preventing store action send: %{public}s", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B846D30](v29, -1, -1);
      MEMORY[0x23B846D30](v27, -1, -1);

    }
    else
    {

      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, a3);
    }
  }
  else
  {
    if (MEMORY[0x23B846DF0](a1 + 8))
    {
      v32 = *(_QWORD *)(a1 + 16);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(a2, ObjectType, v32);
      swift_unknownObjectRelease();
      return;
    }
    if (qword_256956CD0 != -1)
      swift_once();
    v34 = sub_23A275E38();
    __swift_project_value_buffer(v34, (uint64_t)qword_25695AE10);
    v35 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    v35(v22, a2, a3);
    v25 = sub_23A275E20();
    v36 = sub_23A276144();
    if (os_log_type_enabled(v25, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      v38 = swift_slowAlloc();
      v44 = 0;
      v39 = v38;
      v47 = v38;
      v43 = v8;
      *(_DWORD *)v37 = 136446210;
      v45 = v37 + 4;
      v35((char *)v17, (uint64_t)v22, a3);
      v40 = sub_23A27600C();
      v46 = sub_23A26B078(v40, v41, &v47);
      sub_23A276198();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v22, a3);
      _os_log_impl(&dword_23A253000, v25, v36, "Store deallocated, not able to send: %{public}s", v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B846D30](v39, -1, -1);
      MEMORY[0x23B846D30](v37, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v22, a3);
    }
  }

}

uint64_t sub_23A272BB8()
{
  return swift_unknownObjectWeakDestroy();
}

_QWORD *sub_23A272BC0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectWeakCopyInit();
  a1[2] = a2[2];
  return a1;
}

_QWORD *sub_23A272BF8(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectWeakCopyAssign();
  a1[2] = a2[2];
  return a1;
}

_QWORD *sub_23A272C30(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectWeakTakeInit();
  a1[2] = a2[2];
  return a1;
}

_QWORD *sub_23A272C68(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectWeakTakeAssign();
  a1[2] = a2[2];
  return a1;
}

uint64_t sub_23A272CA0(uint64_t a1, int a2)
{
  int v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  if ((*(_QWORD *)(a1 + 16) & 0xF000000000000007) != 0)
    v2 = *(_DWORD *)(a1 + 8) & 0x7FFFFFFF;
  else
    v2 = -1;
  return (v2 + 1);
}

uint64_t sub_23A272CEC(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = 1;
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for StoreProxy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for StoreProxy);
}

void AsyncKeyedStateResolver.__allocating_init(store:keyPath:fetchValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_allocObject();
  sub_23A273874(a1, a2, a3, a4);
}

uint64_t sub_23A272D88(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

void AsyncKeyedStateResolver.init(store:keyPath:fetchValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23A273874(a1, a2, a3, a4);
}

uint64_t sub_23A272DDC(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

void AsyncKeyedStateResolver.keys.getter()
{
  swift_beginAccess();
  type metadata accessor for AsyncStateResolver();
}

uint64_t sub_23A272E60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  ((void (*)(uint64_t, uint64_t, uint64_t, _QWORD))nullsub_1)(v1, v2, a1, *(_QWORD *)(v3 + 112));
  v4 = sub_23A275F4C();
  swift_bridgeObjectRetain();
  MEMORY[0x23B846C88](MEMORY[0x24BEE0310], v4);
  return sub_23A276114();
}

void AsyncKeyedStateResolver.resolver(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MEMORY[0x24BDAC7A8](a1, a2, a3, a4);
  swift_beginAccess();
  type metadata accessor for AsyncStateResolver();
}

uint64_t sub_23A272F84(uint64_t a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(_QWORD *, uint64_t, uint64_t);
  uint64_t v31;
  void (*v32)(uint64_t, _QWORD, uint64_t);
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t result;
  _QWORD *v37;
  uint64_t v38;

  v12 = *(_QWORD *)(v4 + 112);
  v13 = v1;
  v14 = v1;
  *(_QWORD *)(v10 - 224) = a1;
  v15 = v12;
  MEMORY[0x23B8463AC](v14, v2, v6);
  v16 = *(_QWORD *)(v10 - 144);
  if (v16)
  {
    v17 = *(_QWORD *)(v10 - 128);
    v18 = *(_QWORD *)(v10 - 120);
    v19 = *(_QWORD *)(v10 - 136);
  }
  else
  {
    swift_endAccess();
    *(_QWORD *)(v10 - 272) = *(_QWORD *)(v5 + 16);
    *(_QWORD *)(v10 - 264) = *(_QWORD *)(v5 + 24);
    v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    *(_QWORD *)(v10 - 248) = v20;
    *(_QWORD *)(v10 - 240) = v13;
    v21 = v20(v8, v13, v6);
    v22 = *(unsigned __int8 *)(v7 + 80);
    MEMORY[0x24BDAC7A8](v21, v23, v24, v25);
    v26 = v8;
    v27 = (uint64_t *)((char *)&v38 - ((v9 + 63) & 0xFFFFFFFFFFFFFFF0));
    *v27 = v3;
    v27[1] = v6;
    v28 = *(_QWORD *)(v10 - 208);
    v27[2] = *(_QWORD *)(v10 - 200);
    v27[3] = v28;
    *(_QWORD *)(v10 - 232) = v15;
    v29 = *(_QWORD *)(v10 - 192);
    v27[4] = v15;
    v27[5] = v29;
    v30 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v7 + 32);
    *(_QWORD *)(v10 - 256) = v30;
    v30(v27 + 6, v26, v6);
    swift_getKeyPath();
    v31 = *(_QWORD *)(v10 - 272);
    swift_retain();
    *(_QWORD *)(v10 - 264) = sub_23A276240();
    swift_release();
    v32 = *(void (**)(uint64_t, _QWORD, uint64_t))(v10 - 248);
    v32(v26, *(_QWORD *)(v10 - 240), v6);
    v33 = (_QWORD *)swift_allocObject();
    v33[2] = v3;
    v33[3] = v6;
    v34 = *(_QWORD *)(v10 - 208);
    v33[4] = *(_QWORD *)(v10 - 200);
    v33[5] = v34;
    v35 = *(_QWORD *)(v10 - 192);
    v33[6] = *(_QWORD *)(v10 - 232);
    v33[7] = v35;
    v33[8] = v5;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 - 256))((uint64_t)v33 + ((v22 + 72) & ~v22), v26, v6);
    AsyncStateResolver.init(store:keyPath:fetchValue:)(v31, *(_QWORD *)(v10 - 264), (uint64_t)&unk_256958088, (uint64_t)v33, (_QWORD *)(v10 - 144));
    v16 = *(_QWORD *)(v10 - 144);
    v19 = *(_QWORD *)(v10 - 136);
    v17 = *(_QWORD *)(v10 - 128);
    v18 = *(_QWORD *)(v10 - 120);
    v32(v26, *(_QWORD *)(v10 - 240), v6);
    *(_QWORD *)(v10 - 144) = v16;
    *(_QWORD *)(v10 - 136) = v19;
    *(_QWORD *)(v10 - 128) = v17;
    *(_QWORD *)(v10 - 120) = v18;
    swift_beginAccess();
    sub_23A275F64();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_23A275F94();
  }
  result = swift_endAccess();
  v37 = *(_QWORD **)(v10 - 184);
  *v37 = v16;
  v37[1] = v19;
  v37[2] = v17;
  v37[3] = v18;
  return result;
}

void sub_23A2731E0()
{
  type metadata accessor for AsyncKeyedState();
}

uint64_t sub_23A273228(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return AsyncKeyedState.subscript.getter(v4, a1, a4, v5);
}

void sub_23A273250()
{
  type metadata accessor for AsyncKeyedState();
}

uint64_t sub_23A27328C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return sub_23A2593AC(v5, v4, a1, a4);
}

uint64_t sub_23A2732B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_23A2760B4();
  v3[5] = sub_23A2760A8();
  v3[6] = sub_23A276090();
  v3[7] = v4;
  return swift_task_switch();
}

uint64_t sub_23A273320()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD, _QWORD);

  v3 = (uint64_t (*)(_QWORD, _QWORD))(**(int **)(v0[3] + 40) + *(_QWORD *)(v0[3] + 40));
  v1 = (_QWORD *)swift_task_alloc();
  v0[8] = v1;
  *v1 = v0;
  v1[1] = sub_23A273384;
  return v3(v0[2], v0[4]);
}

uint64_t sub_23A273384()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A2733E4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A273418()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall AsyncKeyedStateResolver.refresh()()
{
  sub_23A273464();
}

Swift::Void __swiftcall AsyncKeyedStateResolver.resolve()()
{
  sub_23A273464();
}

void sub_23A273464()
{
  swift_beginAccess();
  type metadata accessor for AsyncStateResolver();
}

uint64_t sub_23A2734C0()
{
  uint64_t v0;

  v0 = sub_23A275F58();
  swift_bridgeObjectRetain();
  MEMORY[0x23B846C88](MEMORY[0x24BEE03C0], v0);
  sub_23A276060();
  return swift_bridgeObjectRelease();
}

void sub_23A273540()
{
  type metadata accessor for AsyncStateResolver();
}

uint64_t sub_23A273578()
{
  uint64_t (*v0)(void);

  return v0();
}

Swift::Void __swiftcall AsyncKeyedStateResolver.reset()()
{
  type metadata accessor for AsyncStateResolver();
}

void sub_23A2735E4()
{
  uint64_t v0;
  uint64_t v1;

  swift_getTupleTypeMetadata2();
  sub_23A27606C();
  v1 = sub_23A275F40();
  swift_beginAccess();
  *(_QWORD *)(v0 + 32) = v1;
  swift_bridgeObjectRelease();
  swift_getObjectType();
  swift_unknownObjectRetain();
  sub_23A273714();
}

void sub_23A273670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,double a21)
{
  uint64_t v13;
  double v14;

  swift_unknownObjectRelease();
  v14 = a21;
  swift_getObjectType();
  swift_unknownObjectRetain();
  AsyncKeyedState.init(ttl:)(a17, v13, (uint64_t)&a21, v14);
  swift_bridgeObjectRelease();
  sub_23A273794();
}

uint64_t sub_23A2736E4()
{
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

void sub_23A273714()
{
  type metadata accessor for AsyncKeyedState();
}

uint64_t sub_23A273760(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, uint64_t);

  return v4(v2, a1, v3, v1);
}

void sub_23A273794()
{
  type metadata accessor for AsyncKeyedState();
}

uint64_t sub_23A2737EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  return v4(v2, &v6, a1, v3, v1);
}

uint64_t AsyncKeyedStateResolver.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t AsyncKeyedStateResolver.__deallocating_deinit()
{
  AsyncKeyedStateResolver.deinit();
  return swift_deallocClassInstance();
}

void sub_23A273874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[2] = a1;
  v4[3] = a2;
  v4[5] = a3;
  v4[6] = a4;
  swift_retain();
  swift_retain();
  swift_retain();
  type metadata accessor for AsyncStateResolver();
}

uint64_t sub_23A2738DC()
{
  uint64_t v0;

  swift_getTupleTypeMetadata2();
  sub_23A27606C();
  *(_QWORD *)(v0 + 32) = sub_23A275F40();
  return v0;
}

unint64_t sub_23A273940(uint64_t a1)
{
  return ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 48;
}

uint64_t sub_23A273968(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + a1 - 40) - 8) + 8))();
}

__n128 sub_23A27397C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __n128 result;
  __int128 v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + a1 - 40) - 8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  v6 = (*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = a1 + v6;
  v8 = a2 + v6;
  v10 = *(_OWORD *)(v7 + 16);
  result = *(__n128 *)(v7 + 32);
  *(_OWORD *)v8 = *(_OWORD *)v7;
  *(_OWORD *)(v8 + 16) = v10;
  *(__n128 *)(v8 + 32) = result;
  return result;
}

uint64_t sub_23A2739E4()
{
  return sub_23A275FB8() & 1;
}

uint64_t sub_23A273A24()
{
  return sub_23A275FAC();
}

__n128 sub_23A273A54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __n128 result;
  __int128 v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 8) - 8);
  v5 = *(_QWORD *)(v4 + 64);
  (*(void (**)(uint64_t, unint64_t))(v4 + 32))(a2, a1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)));
  v6 = a2 + ((v5 + 7) & 0xFFFFFFFFFFFFFFF8);
  v8 = *(_OWORD *)(a1 + 16);
  result = *(__n128 *)(a1 + 32);
  *(_OWORD *)v6 = *(_OWORD *)a1;
  *(_OWORD *)(v6 + 16) = v8;
  *(__n128 *)(v6 + 32) = result;
  return result;
}

uint64_t sub_23A273AC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23A273B2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v1 + 24) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 64);
  v6 = v1 + ((v4 + 72) & ~v4);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23A25FA5C;
  return sub_23A2732B0(a1, v5, v6);
}

void sub_23A273BA8()
{
  sub_23A273BE0();
}

void sub_23A273BC4()
{
  sub_23A273BE0();
}

void sub_23A273BE0()
{
  sub_23A273540();
}

uint64_t sub_23A273C04()
{
  return swift_initClassMetadata2();
}

void type metadata accessor for AsyncKeyedStateResolver()
{
  JUMPOUT(0x23B846C04);
}

uint64_t method lookup function for AsyncKeyedStateResolver()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AsyncKeyedStateResolver.__allocating_init(store:keyPath:fetchValue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t static EmptyState.== infix(_:_:)()
{
  return 1;
}

ValueMetadata *type metadata accessor for EmptyState()
{
  return &type metadata for EmptyState;
}

uint64_t sub_23A273CA0()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23A273D3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23A2760CC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23A2760C0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23A26C0E0(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23A276090();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23A273E84(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;

  v3 = (_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 144));
  v4 = v3[3];
  v5 = v3[4];
  v6 = __swift_project_boxed_opaque_existential_1(v3, v4);
  v7 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v6, v6, v8, v9);
  v11 = (char *)&v13 - v10;
  (*(void (**)(char *))(v7 + 16))((char *)&v13 - v10);
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 32))(v4, v5);
  result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v11, v4);
  if ((v5 & 1) == 0)
    return sub_23A273F94(a1);
  return result;
}

uint64_t sub_23A273F40()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_23A275EA4();
    return swift_release();
  }
  return result;
}

uint64_t sub_23A273F94(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
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
  void (*v40)(char *, uint64_t, uint64_t);
  NSObject *v41;
  os_log_type_t v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  __darwin_time_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char v55;
  char *v56;
  uint64_t v57;
  char v58;
  void (*v59)(char *, uint64_t);
  double v60;
  uint64_t v61;
  uint64_t v62;
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
  uint64_t v76;
  __darwin_time_t v77;
  char *v78;
  int v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t tv_nsec;
  __darwin_time_t tv_sec;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t AssociatedTypeWitness;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD v94[3];
  __darwin_time_t v95;
  timespec __tp;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;

  v2 = v1;
  v99 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(*v1 + 80);
  v5 = *(_QWORD *)(*v1 + 88);
  v88 = *v1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v87 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v6, v7, v8);
  v85 = (char *)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9, v11, v12, v13);
  v15 = (char *)&v76 - v14;
  v92 = swift_getAssociatedTypeWitness();
  v82 = *(_QWORD *)(v92 - 8);
  v19 = MEMORY[0x24BDAC7A8](v92, v16, v17, v18);
  v81 = (char *)&v76 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19, v21, v22, v23);
  v25 = (char *)&v76 - v24;
  v86 = v5;
  v26 = v4;
  v27 = swift_getAssociatedTypeWitness();
  v28 = *(_QWORD *)(v27 - 8);
  v32 = MEMORY[0x24BDAC7A8](v27, v29, v30, v31);
  v80 = (char *)&v76 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v32, v34, v35, v36);
  v38 = (char *)&v76 - v37;
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_MONOTONIC_RAW, &__tp);
  tv_sec = __tp.tv_sec;
  tv_nsec = __tp.tv_nsec;
  if (qword_256956CD0 != -1)
    swift_once();
  v39 = sub_23A275E38();
  __swift_project_value_buffer(v39, (uint64_t)qword_25695AE10);
  v40 = *(void (**)(char *, uint64_t, uint64_t))(v28 + 16);
  v40(v38, a1, v27);
  v41 = sub_23A275E20();
  v42 = sub_23A276138();
  v79 = v42;
  v43 = os_log_type_enabled(v41, v42);
  v90 = v25;
  v91 = a1;
  v93 = v27;
  if (v43)
  {
    v44 = swift_slowAlloc();
    v77 = swift_slowAlloc();
    __tp.tv_sec = v77;
    *(_DWORD *)v44 = 136315394;
    v78 = v15;
    v94[0] = v26;
    swift_getMetatypeMetadata();
    v45 = sub_23A27600C();
    v94[0] = sub_23A26B078(v45, v46, &__tp.tv_sec);
    sub_23A276198();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2080;
    v40(v80, (uint64_t)v38, v93);
    v47 = sub_23A27600C();
    v94[0] = sub_23A26B078(v47, v48, &__tp.tv_sec);
    v27 = v93;
    a1 = v91;
    sub_23A276198();
    v15 = v78;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v38, v27);
    _os_log_impl(&dword_23A253000, v41, (os_log_type_t)v79, "%s.%s", (uint8_t *)v44, 0x16u);
    v49 = v77;
    swift_arrayDestroy();
    MEMORY[0x23B846D30](v49, -1, -1);
    v50 = v44;
    v25 = v90;
    MEMORY[0x23B846D30](v50, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v28 + 8))(v38, v27);
  }

  v80 = (char *)type metadata accessor for SideEffect(0, v27, v51, v52);
  v95 = sub_23A275F34();
  sub_23A275E80();
  sub_23A275E80();
  (*(void (**)(char *, char *, __darwin_time_t *, uint64_t, uint64_t, uint64_t))(v86 + 72))(v15, v25, &v95, a1, v26, v86);
  v53 = v81;
  sub_23A275E80();
  v54 = v92;
  swift_getAssociatedConformanceWitness();
  v55 = sub_23A275FB8();
  v82 = *(_QWORD *)(v82 + 8);
  ((void (*)(char *, uint64_t))v82)(v53, v54);
  if ((v55 & 1) == 0)
    sub_23A275E74();
  v56 = v85;
  sub_23A275E80();
  v57 = AssociatedTypeWitness;
  swift_getAssociatedConformanceWitness();
  v58 = sub_23A275FB8();
  v59 = *(void (**)(char *, uint64_t))(v87 + 8);
  v59(v56, v57);
  if ((v58 & 1) == 0)
    sub_23A275E74();
  v60 = (double)tv_nsec / 1000000000.0 + (double)tv_sec;
  v61 = v88;
  MEMORY[0x23B846C88](&unk_23A278900, v88);
  v62 = sub_23A276210();
  swift_retain();
  v63 = MEMORY[0x23B846C88](&unk_23A278778, v61);
  v64 = v93;
  v65 = sub_23A272634(v62, v63, v94);
  __tp.tv_sec = v95;
  MEMORY[0x24BDAC7A8](v65, v66, v67, v68);
  *(&v76 - 2) = (uint64_t)v2;
  *(&v76 - 1) = (uint64_t)v94;
  v69 = sub_23A276084();
  swift_bridgeObjectRetain();
  MEMORY[0x23B846C88](MEMORY[0x24BEE12C8], v69);
  sub_23A276060();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A26C2C8((uint64_t)v2 + *(_QWORD *)(*v2 + 144), (uint64_t)&__tp);
  v70 = v97;
  v71 = v98;
  __swift_project_boxed_opaque_existential_1(&__tp, v97);
  (*(void (**)(uint64_t, uint64_t, uint64_t, double))(v71 + 56))(v91, v70, v71, v60);
  v59(v15, v57);
  ((void (*)(char *, uint64_t))v82)(v90, v92);
  v74 = type metadata accessor for StoreProxy(0, v64, v72, v73);
  (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v74 - 8) + 8))(v94, v74);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&__tp);
}

uint64_t sub_23A2746DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE v44[24];

  v7 = *(_QWORD *)(*(_QWORD *)a2 + 80);
  v6 = *(_QWORD *)(*(_QWORD *)a2 + 88);
  v42 = v7;
  v43 = v6;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = type metadata accessor for SideEffect(0, AssociatedTypeWitness, v9, v10);
  v12 = *(_QWORD *)(v11 - 8);
  v40 = v11;
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11, v14, v15, v16);
  v18 = (char *)&v39 - v17;
  v41 = (char *)&v39 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256957548);
  MEMORY[0x24BDAC7A8](v19, v20, v21, v22);
  v24 = (char *)&v39 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_23A2760CC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v24, 1, 1, v25);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v18, a1, v11);
  v28 = type metadata accessor for StoreProxy(0, AssociatedTypeWitness, v26, v27);
  v29 = *(_QWORD *)(v28 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v29 + 16))(v44, a3, v28);
  sub_23A2760B4();
  v30 = a2;
  swift_retain();
  v31 = sub_23A2760A8();
  v32 = (*(unsigned __int8 *)(v12 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v33 = (v13 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  v34 = (char *)swift_allocObject();
  v35 = MEMORY[0x24BEE6930];
  *((_QWORD *)v34 + 2) = v31;
  *((_QWORD *)v34 + 3) = v35;
  v36 = v41;
  v37 = v43;
  *((_QWORD *)v34 + 4) = v42;
  *((_QWORD *)v34 + 5) = v37;
  *((_QWORD *)v34 + 6) = v30;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v34[v32], v36, v40);
  (*(void (**)(char *, _BYTE *, uint64_t))(v29 + 32))(&v34[v33], v44, v28);
  sub_23A273D3C((uint64_t)v24, (uint64_t)&unk_2569581F8, (uint64_t)v34);
  return swift_release();
}

uint64_t sub_23A2748DC(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  v6[5] = *a4;
  sub_23A2760B4();
  v6[6] = sub_23A2760A8();
  v6[7] = sub_23A276090();
  v6[8] = v7;
  return swift_task_switch();
}

uint64_t sub_23A274954()
{
  uint64_t *v0;
  _QWORD *v1;
  uint64_t AssociatedTypeWitness;

  v1 = (_QWORD *)swift_task_alloc();
  v0[9] = (uint64_t)v1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *v1 = v0;
  v1[1] = sub_23A2749DC;
  return sub_23A26CA90(v0[3], v0[4], AssociatedTypeWitness);
}

uint64_t sub_23A2749DC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A274A28()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A274A58(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = *(_QWORD *)(*a1 + *MEMORY[0x24BEE46A8]);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1, a2, a3, a4);
  v7 = (char *)&v9 - v6;
  sub_23A275E80();
  swift_getAtKeyPath();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_23A274AFC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = *(_QWORD *)(*a1 + *MEMORY[0x24BEE46A8]);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1, a2, a3, a4);
  v7 = (char *)&v9 - v6;
  sub_23A275E80();
  swift_getAtKeyPath();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_23A274BA0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char v22;
  void (*v23)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;

  v25 = a2;
  v4 = *(_QWORD *)(*a1 + *MEMORY[0x24BEE2B70] + 8);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1, a2, a3, a4);
  v8 = (char *)&v25 - v7;
  v10 = *v9;
  v26 = *(_QWORD *)(*v9 - 8);
  v14 = MEMORY[0x24BDAC7A8](v6, v11, v12, v13);
  v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14, v17, v18, v19);
  v21 = (char *)&v25 - v20;
  sub_23A275E80();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v25, v4);
  swift_setAtWritableKeyPath();
  sub_23A275E80();
  swift_getAssociatedConformanceWitness();
  v22 = sub_23A275FB8();
  v23 = *(void (**)(char *, uint64_t))(v26 + 8);
  v23(v16, v10);
  if ((v22 & 1) == 0)
    sub_23A275E74();
  return ((uint64_t (*)(char *, uint64_t))v23)(v21, v10);
}

uint64_t sub_23A274D24(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char v22;
  void (*v23)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;

  v25 = a2;
  v4 = *(_QWORD *)(*a1 + *MEMORY[0x24BEE2B70] + 8);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1, a2, a3, a4);
  v8 = (char *)&v25 - v7;
  v10 = *v9;
  v26 = *(_QWORD *)(*v9 - 8);
  v14 = MEMORY[0x24BDAC7A8](v6, v11, v12, v13);
  v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14, v17, v18, v19);
  v21 = (char *)&v25 - v20;
  sub_23A275E80();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v25, v4);
  swift_setAtWritableKeyPath();
  sub_23A275E80();
  swift_getAssociatedConformanceWitness();
  v22 = sub_23A275FB8();
  v23 = *(void (**)(char *, uint64_t))(v26 + 8);
  v23(v16, v10);
  if ((v22 & 1) == 0)
    sub_23A275E74();
  return ((uint64_t (*)(char *, uint64_t))v23)(v21, v10);
}

void sub_23A274EA8()
{
  type metadata accessor for ChildStore();
}

char *sub_23A274F18(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, __int128 a16, uint64_t a17, timespec __tp, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  timespec v61[2];
  _QWORD v62[3];
  uint64_t v63;
  uint64_t v64;

  v47 = *(_QWORD **)(v41 + v42[14]);
  v48 = *(_QWORD *)(v41 + v42[16]);
  sub_23A26C2C8(v41 + v42[18], (uint64_t)v62);
  v49 = v63;
  v50 = v64;
  __swift_project_boxed_opaque_existential_1(v62, v63);
  v61[0].tv_sec = 0;
  v61[0].tv_nsec = 0;
  swift_retain();
  swift_retain();
  clock_gettime(_CLOCK_MONOTONIC_RAW, v61);
  (*(void (**)(timespec *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double))(v50 + 48))(v61, v44, v44, v45, v49, v50, (double)v61[0].tv_nsec / 1000000000.0 + (double)v61[0].tv_sec);
  v58 = v53;
  v59 = *(_OWORD *)(v46 + 8);
  v60 = v54;
  swift_retain();
  swift_retain();
  sub_23A26C2A8(v43);
  v51 = sub_23A26BD34(v56, v47, v57, v48, v61, (uint64_t)&v58, v43, v40);
  sub_23A26C2B8(v43);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  MEMORY[0x23B846C88](&unk_23A278538, a1);
  return v51;
}

uint64_t *sub_23A27508C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 104));
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v0 + *(_QWORD *)(*v0 + 144));
  return v0;
}

uint64_t sub_23A275120()
{
  sub_23A27508C();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RootStore(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RootStore);
}

uint64_t sub_23A275164(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = MEMORY[0x23B846C88](&unk_23A2788C8);
  result = MEMORY[0x23B846C88](&unk_23A278900, a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_23A2751A8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A27520C;
  return v6(a1);
}

uint64_t sub_23A27520C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

char *sub_23A275258(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
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
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  double tv_sec;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t AssociatedConformanceWitness;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  char *v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(uint64_t (*)(), char *, uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  timespec __tp;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;

  v5 = v4;
  v82 = a4;
  v70 = a3;
  v71 = a2;
  v69 = a1;
  v86 = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)v4;
  v7 = *(_QWORD *)(*(_QWORD *)v4 + 80);
  v72 = *(_QWORD *)(*(_QWORD *)v4 + 88);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v81 = sub_23A275E8C();
  v9 = MEMORY[0x24BDB9D10];
  v78 = MEMORY[0x23B846C88](MEMORY[0x24BDB9D10], v81);
  v10 = sub_23A275E44();
  v11 = *(_QWORD *)(v10 - 8);
  v79 = v10;
  v80 = v11;
  MEMORY[0x24BDAC7A8](v10, v12, v13, v14);
  v77 = (char *)&v68 - v15;
  v16 = swift_getAssociatedTypeWitness();
  v17 = sub_23A275E8C();
  v74 = MEMORY[0x23B846C88](v9, v17);
  v18 = sub_23A275E44();
  v19 = *(_QWORD *)(v18 - 8);
  v75 = v18;
  v76 = v19;
  MEMORY[0x24BDAC7A8](v18, v20, v21, v22);
  v73 = (char *)&v68 - v23;
  v24 = type metadata accessor for JournalMode();
  v28 = MEMORY[0x24BDAC7A8](v24, v25, v26, v27);
  v68 = (uint64_t)&v68 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v34 = MEMORY[0x24BDAC7A8](v28, v31, v32, v33);
  v36 = (char *)&v68 - v35;
  v37 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v34, v38, v39, v40);
  v42 = (char *)&v68 - v41;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(&v5[*(_QWORD *)(v6 + 104)], v69, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v42, v70, v16);
  *(_QWORD *)&v5[*(_QWORD *)(*(_QWORD *)v5 + 112)] = sub_23A275E98();
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v36, v71, AssociatedTypeWitness);
  *(_QWORD *)&v5[*(_QWORD *)(*(_QWORD *)v5 + 120)] = sub_23A275E98();
  sub_23A275EBC();
  swift_allocObject();
  *((_QWORD *)v5 + 2) = sub_23A275EB0();
  type metadata accessor for SideEffectRegistry();
  v43 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v43 + 112) = MEMORY[0x24BEE4B00];
  *(_QWORD *)&v5[*(_QWORD *)(*(_QWORD *)v5 + 128)] = v43;
  v44 = &v5[*(_QWORD *)(*(_QWORD *)v5 + 136)];
  *(_QWORD *)v44 = MEMORY[0x24BEE4AF8];
  v45 = v44;
  v46 = v68;
  sub_23A260358(v82, v68);
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_MONOTONIC_RAW, &__tp);
  tv_sec = (double)__tp.tv_sec;
  v48 = (double)__tp.tv_nsec / 1000000000.0;
  v49 = v72;
  v50 = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v52 = swift_getAssociatedConformanceWitness();
  v53 = type metadata accessor for JournalDatabase(0, v50, AssociatedConformanceWitness, v52);
  v54 = sub_23A262D14(v46, 1953460050, 0xE400000000000000, v48 + tv_sec);
  v55 = (uint64_t *)&v5[*(_QWORD *)(*(_QWORD *)v5 + 144)];
  v55[3] = v53;
  v55[4] = MEMORY[0x23B846C88](&unk_23A277E04, v53);
  *v55 = v54;
  __tp.tv_sec = *(_QWORD *)&v5[*(_QWORD *)(*(_QWORD *)v5 + 112)];
  v56 = v73;
  sub_23A275EC8();
  v57 = swift_allocObject();
  swift_weakInit();
  v58 = (_QWORD *)swift_allocObject();
  v58[2] = v7;
  v58[3] = v49;
  v58[4] = v57;
  swift_retain();
  v59 = v75;
  MEMORY[0x23B846C88](MEMORY[0x24BDB96F8], v75);
  sub_23A275ED4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v56, v59);
  swift_release();
  v71 = v45;
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256957AF0);
  sub_23A266D34();
  sub_23A275E50();
  swift_endAccess();
  swift_release();
  __tp.tv_sec = *(_QWORD *)&v5[*(_QWORD *)(*(_QWORD *)v5 + 120)];
  v60 = v77;
  sub_23A275EC8();
  v61 = swift_allocObject();
  swift_weakInit();
  v62 = (_QWORD *)swift_allocObject();
  v62[2] = v7;
  v62[3] = v49;
  v62[4] = v61;
  swift_retain();
  v63 = v79;
  MEMORY[0x23B846C88](MEMORY[0x24BDB96F8], v79);
  sub_23A275ED4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v80 + 8))(v60, v63);
  swift_release();
  swift_beginAccess();
  sub_23A275E50();
  swift_endAccess();
  swift_release();
  sub_23A26C2C8((uint64_t)v55, (uint64_t)&__tp);
  v64 = v84;
  v65 = v85;
  __swift_project_boxed_opaque_existential_1(&__tp, v84);
  v66 = *(void (**)(uint64_t (*)(), char *, uint64_t, uint64_t))(v65 + 64);
  swift_retain();
  v66(sub_23A275CD0, v5, v64, v65);
  swift_release();
  sub_23A2606A8(v82);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&__tp);
  return v5;
}

char *sub_23A275920(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  swift_allocObject();
  return sub_23A275258(a1, a2, a3, a4);
}

uint64_t sub_23A275980(uint64_t a1)
{
  uint64_t v1;

  return sub_23A2746DC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23A275998()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4 = *(_QWORD *)(type metadata accessor for SideEffect(0, AssociatedTypeWitness, v2, v3) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  swift_unknownObjectRelease();
  swift_release();
  v6 = v0 + v5;
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      __swift_destroy_boxed_opaque_existential_1(v0 + v5);
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_1(v0 + v5);
      v10 = v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256957B08) + 80);
      v11 = sub_23A2760CC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
LABEL_9:
      swift_release();
      break;
    case 0:
      if (*(_QWORD *)(v6 + 24))
        __swift_destroy_boxed_opaque_existential_1(v0 + v5);
      v8 = v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256957B00) + 48);
      v9 = sub_23A2760CC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
      goto LABEL_9;
  }
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23A275B0C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(type metadata accessor for SideEffect(0, AssociatedTypeWitness, v5, v6) - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = v1[2];
  v10 = v1[3];
  v11 = (_QWORD *)v1[6];
  v12 = (uint64_t)v1 + v8;
  v13 = (uint64_t)v1 + ((*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v14;
  *v14 = v2;
  v14[1] = sub_23A25FA5C;
  return sub_23A2748DC(a1, v9, v10, v11, v12, v13);
}

uint64_t sub_23A275BD8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A275BFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A25FA5C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256958200 + dword_256958200))(a1, v4);
}

uint64_t sub_23A275C6C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23A275C90()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A275CB4()
{
  return sub_23A273F40();
}

uint64_t sub_23A275CDC()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_23A275CE8()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_23A275CF4()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_23A275D00()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_23A275D0C()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_23A275D18()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_23A275D24()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_23A275D30()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_23A275D3C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23A275D48()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23A275D54()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_23A275D60()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_23A275D6C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23A275D78()
{
  return MEMORY[0x24BDCD938]();
}

uint64_t sub_23A275D84()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23A275D90()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_23A275D9C()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_23A275DA8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23A275DB4()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_23A275DC0()
{
  return MEMORY[0x24BDCDBF8]();
}

uint64_t sub_23A275DCC()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_23A275DD8()
{
  return MEMORY[0x24BDCDD78]();
}

uint64_t sub_23A275DE4()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_23A275DF0()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_23A275DFC()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_23A275E08()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_23A275E14()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23A275E20()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23A275E2C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23A275E38()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23A275E44()
{
  return MEMORY[0x24BDB96E8]();
}

uint64_t sub_23A275E50()
{
  return MEMORY[0x24BDB9B48]();
}

uint64_t sub_23A275E5C()
{
  return MEMORY[0x24BDB9B60]();
}

uint64_t sub_23A275E68()
{
  return MEMORY[0x24BDB9B90]();
}

uint64_t sub_23A275E74()
{
  return MEMORY[0x24BDB9CC0]();
}

uint64_t sub_23A275E80()
{
  return MEMORY[0x24BDB9CD0]();
}

uint64_t sub_23A275E8C()
{
  return MEMORY[0x24BDB9CE0]();
}

uint64_t sub_23A275E98()
{
  return MEMORY[0x24BDB9CF8]();
}

uint64_t sub_23A275EA4()
{
  return MEMORY[0x24BDB9D68]();
}

uint64_t sub_23A275EB0()
{
  return MEMORY[0x24BDB9D78]();
}

uint64_t sub_23A275EBC()
{
  return MEMORY[0x24BDB9D80]();
}

uint64_t sub_23A275EC8()
{
  return MEMORY[0x24BDBA0C0]();
}

uint64_t sub_23A275ED4()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_23A275EE0()
{
  return MEMORY[0x24BDF47F8]();
}

uint64_t sub_23A275EEC()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_23A275EF8()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23A275F04()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23A275F10()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_23A275F1C()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_23A275F28()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_23A275F34()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_23A275F40()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_23A275F4C()
{
  return MEMORY[0x24BEE0300]();
}

uint64_t sub_23A275F58()
{
  return MEMORY[0x24BEE03B0]();
}

uint64_t sub_23A275F64()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_23A275F70()
{
  return MEMORY[0x24BEE0480]();
}

uint64_t sub_23A275F7C()
{
  return MEMORY[0x24BEE0490]();
}

uint64_t sub_23A275F88()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_23A275F94()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_23A275FA0()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23A275FAC()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_23A275FB8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23A275FC4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A275FD0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A275FDC()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_23A275FE8()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_23A275FF4()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_23A276000()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_23A27600C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23A276018()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_23A276024()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A276030()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A27603C()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_23A276048()
{
  return MEMORY[0x24BEE0BF0]();
}

uint64_t sub_23A276054()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23A276060()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_23A27606C()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_23A276078()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_23A276084()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23A276090()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23A27609C()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_23A2760A8()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23A2760B4()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23A2760C0()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23A2760CC()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23A2760D8()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_23A2760E4()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_23A2760F0()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_23A2760FC()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_23A276108()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_23A276114()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t sub_23A276120()
{
  return MEMORY[0x24BEE1930]();
}

uint64_t sub_23A27612C()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_23A276138()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23A276144()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23A276150()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23A27615C()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_23A276168()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_23A276174()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_23A276180()
{
  return MEMORY[0x24BEE59A0]();
}

uint64_t sub_23A27618C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23A276198()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23A2761A4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23A2761B0()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_23A2761BC()
{
  return MEMORY[0x24BEE2168]();
}

uint64_t sub_23A2761C8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23A2761D4()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23A2761E0()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_23A2761EC()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_23A2761F8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A276204()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23A276210()
{
  return MEMORY[0x24BEE2578]();
}

uint64_t sub_23A27621C()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23A276228()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23A276234()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A276240()
{
  return MEMORY[0x24BEE28B0]();
}

uint64_t sub_23A27624C()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_23A276258()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_23A276264()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_23A276270()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_23A27627C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23A276288()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23A276294()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23A2762A0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23A2762AC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23A2762B8()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23A2762C4()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23A2762D0()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23A2762DC()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_23A2762E8()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23A2762F4()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23A276300()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23A27630C()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_23A276318()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23A276324()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23A276330()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_23A27633C()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23A276348()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23A276354()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_23A276360()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23A27636C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A276378()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23A276384()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_23A276390()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_23A27639C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23A2763A8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23A2763B4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23A2763C0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23A2763CC()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_23A2763D8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A2763E4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A2763F0()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_23A2763FC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23A276408()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23A276414()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23A276420()
{
  return MEMORY[0x24BEE48A0]();
}

uint64_t sub_23A27642C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23A276438()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_23A276444()
{
  return MEMORY[0x24BEE4A98]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
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

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x24BDAD9B8](*(_QWORD *)&__clock_id, __tp);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x24BEDDF58](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x24BEDDF68](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE078](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x24BEDE110](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x24BEDE118](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE1E0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x24BEE4DD8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x24BEE4F28]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x24BEE7248]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x24BEE4FE8]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

