uint64_t sub_100003384()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100003400(v0, qword_100010F68);
  sub_100003440(v0, (uint64_t)qword_100010F68);
  return Logger.init(subsystem:category:)(0xD000000000000015, 0x8000000100009DC0, 0x6E6E6F436B6E6142, 0xEB00000000746365);
}

uint64_t *sub_100003400(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100003440(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100003458()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(void);
  char *v13;

  v0 = type metadata accessor for _NameMap(0);
  sub_100003400(v0, qword_100010F80);
  sub_100003440(v0, (uint64_t)qword_100010F80);
  v1 = sub_100003B78(&qword_100010C78);
  v2 = sub_100003B78(&qword_100010C80);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 72);
  v5 = *(unsigned __int8 *)(v3 + 80);
  v6 = (v5 + 32) & ~v5;
  v7 = swift_allocObject(v1, v6 + 2 * v4, v5 | 7);
  *(_OWORD *)(v7 + 16) = xmmword_100009B00;
  v8 = (_QWORD *)(v7 + v6);
  v9 = v7 + v6 + *(int *)(v2 + 48);
  *v8 = 1;
  *(_QWORD *)v9 = "server_state";
  *(_QWORD *)(v9 + 8) = 12;
  *(_BYTE *)(v9 + 16) = 2;
  v10 = enum case for _NameMap.NameDescription.standard(_:);
  v11 = type metadata accessor for _NameMap.NameDescription(0);
  v12 = *(void (**)(void))(*(_QWORD *)(v11 - 8) + 104);
  ((void (*)(uint64_t, uint64_t, uint64_t))v12)(v9, v10, v11);
  v13 = (char *)v8 + v4 + *(int *)(v2 + 48);
  *(_QWORD *)((char *)v8 + v4) = 2;
  *(_QWORD *)v13 = "client_state";
  *((_QWORD *)v13 + 1) = 12;
  v13[16] = 2;
  v12();
  return _NameMap.init(dictionaryLiteral:)(v7);
}

uint64_t sub_1000035AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  char v8;
  uint64_t v9;

  result = dispatch thunk of Decoder.nextFieldNumber()(a2, a3);
  if (!v4)
  {
    while (1)
    {
      if ((v8 & 1) != 0)
        return result;
      if (result == 2)
        break;
      if (result == 1)
      {
        v9 = v3;
        goto LABEL_5;
      }
LABEL_6:
      result = dispatch thunk of Decoder.nextFieldNumber()(a2, a3);
    }
    v9 = v3 + 16;
LABEL_5:
    dispatch thunk of Decoder.decodeSingularBytesField(value:)(v9, a2, a3);
    goto LABEL_6;
  }
  return result;
}

void sub_10000363C()
{
  __asm { BR              X10 }
}

uint64_t sub_100003684(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((a2 & 0xFF000000000000) == 0
    || (result = ((uint64_t (*)(void))dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:))(), !v2))
  {
    __asm { BR              X10 }
  }
  return result;
}

uint64_t sub_10000377C@<X0>(_OWORD *a1@<X8>)
{
  *a1 = xmmword_100009B10;
  a1[1] = xmmword_100009B10;
  return UnknownStorage.init()();
}

uint64_t sub_1000037A4()
{
  return 0x64656E69626D6F43;
}

uint64_t sub_1000037CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 24);
  v5 = type metadata accessor for UnknownStorage(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_10000380C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 24);
  v5 = type metadata accessor for UnknownStorage(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_10000384C())()
{
  return nullsub_1;
}

uint64_t sub_100003864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000035AC(a1, a2, a3);
}

void sub_100003878()
{
  sub_10000363C();
}

uint64_t sub_100003890(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004364(&qword_100010C70, type metadata accessor for CombinedState, (uint64_t)&unk_100009BE0);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_1000038E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100010C28 != -1)
    swift_once(&qword_100010C28, sub_100003458);
  v2 = type metadata accessor for _NameMap(0);
  v3 = sub_100003440(v2, (uint64_t)qword_100010F80);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100003954(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004364(&qword_100010C58, type metadata accessor for CombinedState, (uint64_t)&unk_100009C18);
  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_100003994(uint64_t a1, uint64_t a2)
{
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, 0);
  dispatch thunk of Hashable.hash(into:)(v5, a1, a2);
  return Hasher._finalize()();
}

uint64_t sub_1000039E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004364(&qword_100010C58, type metadata accessor for CombinedState, (uint64_t)&unk_100009C18);
  return Message.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100003A38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v6[9];

  Hasher.init(_seed:)(v6, a1);
  dispatch thunk of Hashable.hash(into:)(v6, a2, a3);
  return Hasher._finalize()();
}

uint64_t sub_100003A8C()
{
  return sub_100004364(&qword_100010C50, type metadata accessor for CombinedState, (uint64_t)&unk_100009B28);
}

uint64_t type metadata accessor for CombinedState(uint64_t a1)
{
  uint64_t result;

  result = qword_100010CE8;
  if (!qword_100010CE8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CombinedState);
  return result;
}

uint64_t sub_100003AF4()
{
  return sub_100004364(&qword_100010C58, type metadata accessor for CombinedState, (uint64_t)&unk_100009C18);
}

uint64_t sub_100003B20()
{
  return sub_100004364(&qword_100010C60, type metadata accessor for CombinedState, (uint64_t)&unk_100009B50);
}

uint64_t sub_100003B4C()
{
  return sub_100004364(&qword_100010C68, type metadata accessor for CombinedState, (uint64_t)&unk_100009B90);
}

uint64_t sub_100003B78(uint64_t *a1)
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

void sub_100003BB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_100003C18(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x100003DFCLL);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

uint64_t sub_100003E20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  sub_100003BB8((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_100003EF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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
  sub_100003BB8(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_100003FA8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_100003FF4()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_100004028 + *((int *)qword_100004200 + (v0 >> 62))))();
}

uint64_t sub_100004038@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (v1 == BYTE6(v2))
  {
    if (v1 >= 1)
      __asm { BR              X10 }
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

uint64_t sub_100004220(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char v11;
  char v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t);
  uint64_t v20;

  v4 = type metadata accessor for UnknownStorage(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v20 - v9;
  sub_100003FA8(*a1, a1[1]);
  if ((v11 & 1) != 0 && (sub_100003FA8(a1[2], a1[3]), (v12 & 1) != 0))
  {
    v13 = type metadata accessor for CombinedState(0);
    v14 = (char *)a1 + *(int *)(v13 + 24);
    v15 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v15(v10, v14, v4);
    v15(v8, (char *)(a2 + *(int *)(v13 + 24)), v4);
    v16 = sub_100004364(&qword_100010C88, (uint64_t (*)(uint64_t))&type metadata accessor for UnknownStorage, (uint64_t)&protocol conformance descriptor for UnknownStorage);
    v17 = dispatch thunk of static Equatable.== infix(_:_:)(v10, v8, v4, v16);
    v18 = *(void (**)(char *, uint64_t))(v5 + 8);
    v18(v8, v4);
    v18(v10, v4);
  }
  else
  {
    v17 = 0;
  }
  return v17 & 1;
}

uint64_t sub_100004364(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_1000043A4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    ((void (*)(void))swift_retain)();
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000043E8(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    ((void (*)(void))swift_release)();
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t *sub_10000442C(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    swift_retain(v15);
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    sub_1000043A4(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    v9 = a2[2];
    v10 = a2[3];
    sub_1000043A4(v9, v10);
    a1[2] = v9;
    a1[3] = v10;
    v11 = *(int *)(a3 + 24);
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = type metadata accessor for UnknownStorage(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  }
  return a1;
}

uint64_t sub_1000044E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_1000043E8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  sub_1000043E8(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for UnknownStorage(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t *sub_100004538(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  sub_1000043A4(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  v8 = a2[2];
  v9 = a2[3];
  sub_1000043A4(v8, v9);
  a1[2] = v8;
  a1[3] = v9;
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for UnknownStorage(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

uint64_t *sub_1000045C4(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  sub_1000043A4(*a2, v7);
  v8 = *a1;
  v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_1000043E8(v8, v9);
  v10 = a2[2];
  v11 = a2[3];
  sub_1000043A4(v10, v11);
  v12 = a1[2];
  v13 = a1[3];
  a1[2] = v10;
  a1[3] = v11;
  sub_1000043E8(v12, v13);
  v14 = *(int *)(a3 + 24);
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = type metadata accessor for UnknownStorage(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

_OWORD *sub_100004660(_OWORD *a1, _OWORD *a2, uint64_t a3)
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
  v8 = type metadata accessor for UnknownStorage(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t *sub_1000046BC(uint64_t *a1, _OWORD *a2, uint64_t a3)
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
  sub_1000043E8(v6, v7);
  v8 = a1[2];
  v9 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_1000043E8(v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for UnknownStorage(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_10000473C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100004748);
}

uint64_t sub_100004748(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 12)
  {
    v4 = *(_QWORD *)(a1 + 8) >> 60;
    if (((4 * (_DWORD)v4) & 0xC) != 0)
      return 16 - ((4 * (_DWORD)v4) & 0xC | (v4 >> 2));
    else
      return 0;
  }
  else
  {
    v8 = type metadata accessor for UnknownStorage(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_1000047D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000047DC);
}

char *sub_1000047DC(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 12)
  {
    *(_QWORD *)result = 0;
    *((_QWORD *)result + 1) = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * (_DWORD)a2) << 60;
  }
  else
  {
    v7 = type metadata accessor for UnknownStorage(0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_100004858(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = &unk_100009CB0;
  v4[1] = &unk_100009CB0;
  result = type metadata accessor for UnknownStorage(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
    return 0;
  }
  return result;
}

id sub_1000048CC(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_100005E18(a1) & 1) != 0)
    return sub_100004B18(a1, a2);
  if (qword_100010C20 != -1)
    swift_once(&qword_100010C20, sub_100003384);
  v9 = type metadata accessor for Logger(0);
  sub_100003440(v9, (uint64_t)qword_100010F68);
  v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(12, -1);
    v14 = swift_slowAlloc(32, -1);
    v20 = v14;
    *(_DWORD *)v13 = 136315138;
    v15 = sub_100004364((unint64_t *)&qword_100010E30, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v16 = dispatch thunk of CustomStringConvertible.description.getter(v4, v15);
    v18 = v17;
    v19 = sub_100006F94(v16, v17, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20, v13 + 4, v13 + 12);
    swift_bridgeObjectRelease(v18);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "URL is not a BankConnect universal link: %s", v13, 0xCu);
    swift_arrayDestroy(v14, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v13, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  return 0;
}

id sub_100004B18(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  id v41;
  NSURL *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  Class isa;
  uint64_t v48;
  uint8_t *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&v48 - v10;
  __chkstk_darwin(v9);
  v13 = (char *)&v48 - v12;
  v14 = sub_100003B78(&qword_100010D58);
  v15 = __chkstk_darwin(v14);
  v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v19 = (char *)&v48 - v18;
  if ((unsigned __int16)sub_100006594(a1) == 1)
    sub_1000052E8((uint64_t)v19);
  else
    sub_100005510((uint64_t)v19);
  sub_100006D70((uint64_t)v19, (uint64_t)v17, &qword_100010D58);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v17, 1, v4) == 1)
  {
    sub_100006E48((uint64_t)v17, &qword_100010D58);
    if (qword_100010C20 != -1)
      swift_once(&qword_100010C20, sub_100003384);
    v20 = type metadata accessor for Logger(0);
    sub_100003440(v20, (uint64_t)qword_100010F68);
    v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(12, -1);
      v25 = swift_slowAlloc(32, -1);
      v53 = v25;
      *(_DWORD *)v24 = 136315138;
      v51 = v24 + 4;
      v26 = sub_100004364((unint64_t *)&qword_100010E30, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v27 = dispatch thunk of CustomStringConvertible.description.getter(v4, v26);
      v29 = v28;
      v52 = sub_100006F94(v27, v28, &v53);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v51, v24 + 12);
      swift_bridgeObjectRelease(v29);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Failed to create authorization URL from universalLink: %s", v24, 0xCu);
      swift_arrayDestroy(v25, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v25, -1, -1);
      swift_slowDealloc(v24, -1, -1);

    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    sub_100006E48((uint64_t)v19, &qword_100010D58);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v13, v17, v4);
    if (qword_100010C20 != -1)
      swift_once(&qword_100010C20, sub_100003384);
    v51 = a2;
    v30 = type metadata accessor for Logger(0);
    sub_100003440(v30, (uint64_t)qword_100010F68);
    v31 = (*(uint64_t (**)(char *, char *, uint64_t))(v5 + 16))(v11, v13, v4);
    v32 = Logger.logObject.getter(v31);
    v33 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc(12, -1);
      v50 = swift_slowAlloc(32, -1);
      v53 = v50;
      *(_DWORD *)v34 = 136315138;
      v49 = v34 + 4;
      v35 = sub_100004364((unint64_t *)&qword_100010E30, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v36 = dispatch thunk of CustomStringConvertible.description.getter(v4, v35);
      v38 = v37;
      v52 = sub_100006F94(v36, v37, &v53);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v49, v34 + 12);
      swift_bridgeObjectRelease(v38);
      v39 = *(void (**)(char *, uint64_t))(v5 + 8);
      v39(v11, v4);
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Opening BankConnect authorization URL: %s", v34, 0xCu);
      v40 = v50;
      swift_arrayDestroy(v50, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v40, -1, -1);
      swift_slowDealloc(v34, -1, -1);
    }
    else
    {
      v39 = *(void (**)(char *, uint64_t))(v5 + 8);
      v39(v11, v4);
    }

    URL._bridgeToObjectiveC()(v42);
    v44 = v43;
    v45 = sub_1000051B4((uint64_t)&_swiftEmptyArrayStorage);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v45);
    v41 = objc_msgSend(v51, "openSensitiveURL:withOptions:", v44, isa);

    v39(v13, v4);
    sub_100006E48((uint64_t)v19, &qword_100010D58);
  }
  return v41;
}

uint64_t sub_100005090(uint64_t a1)
{
  return sub_1000050D8(a1, qword_100010D28, 0xD00000000000001DLL, 0x8000000100009E30);
}

uint64_t sub_1000050B4(uint64_t a1)
{
  return sub_1000050D8(a1, qword_100010D40, 0xD000000000000039, 0x8000000100009DF0);
}

uint64_t sub_1000050D8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v7 = sub_100003B78(&qword_100010D58);
  __chkstk_darwin(v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for URL(0);
  sub_100003400(v10, a2);
  v11 = sub_100003440(v10, (uint64_t)a2);
  URL.init(string:)(a3, a4);
  v12 = *(_QWORD *)(v10 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v10);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(v11, v9, v10);
  __break(1u);
  return result;
}

unint64_t sub_1000051B4(uint64_t a1)
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
  sub_100003B78(&qword_100010D68);
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
    sub_100006D70(v7, (uint64_t)&v16, &qword_100010D70);
    v8 = v16;
    v9 = v17;
    result = sub_100005C38(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_100006DB4(&v18, (_OWORD *)(v4[7] + 32 * result));
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

uint64_t sub_1000052E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  Swift::String v24;
  Swift::String v25;
  Swift::String v26;
  Swift::String v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v30 = a1;
  v1 = type metadata accessor for CharacterSet(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v3);
  v8 = (char *)&v29 - v7;
  __chkstk_darwin(v6);
  v10 = (char *)&v29 - v9;
  if (qword_100010C38 != -1)
    swift_once(&qword_100010C38, sub_1000050B4);
  v11 = type metadata accessor for URL(0);
  sub_100003440(v11, (uint64_t)qword_100010D40);
  v12 = ((uint64_t (*)(void))URL.absoluteString.getter)();
  v14 = v13;
  static CharacterSet.alphanumerics.getter();
  CharacterSet.init(charactersIn:)(0x3F2F7E5F2E2DLL, 0xE600000000000000);
  CharacterSet.union(_:)(v5);
  v15 = *(void (**)(char *, uint64_t))(v2 + 8);
  v15(v5, v1);
  v16 = ((uint64_t (*)(char *, uint64_t))v15)(v8, v1);
  v17 = URL.absoluteString.getter(v16);
  v19 = v18;
  v31 = v17;
  v32 = v18;
  v20 = sub_100006D2C();
  v21 = StringProtocol.addingPercentEncoding(withAllowedCharacters:)(v10, &type metadata for String, v20);
  v23 = v22;
  swift_bridgeObjectRelease(v19);
  v15(v10, v1);
  if (v23)
  {
    v31 = v12;
    v32 = v14;
    v24._countAndFlagsBits = 38;
    v24._object = (void *)0xE100000000000000;
    String.append(_:)(v24);
    v25._countAndFlagsBits = 0x7463657269646572;
    v25._object = (void *)0xEB000000004C5255;
    String.append(_:)(v25);
    v26._countAndFlagsBits = 61;
    v26._object = (void *)0xE100000000000000;
    String.append(_:)(v26);
    v27._countAndFlagsBits = v21;
    v27._object = v23;
    String.append(_:)(v27);
    swift_bridgeObjectRelease(v23);
    v14 = v32;
    URL.init(string:)(v31, v32);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v30, 1, 1, v11);
  }
  return swift_bridgeObjectRelease(v14);
}

uint64_t sub_100005510@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v2 = type metadata accessor for URLComponents(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100003B78(&qword_100010D78);
  __chkstk_darwin(v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100010C30 != -1)
    swift_once(&qword_100010C30, sub_100005090);
  v9 = type metadata accessor for URL(0);
  v10 = sub_100003440(v9, (uint64_t)qword_100010D28);
  URLComponents.init(url:resolvingAgainstBaseURL:)(v10, 0);
  v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  if (!v11(v8, 1, v2))
  {
    v12 = sub_100003B78(&qword_100010D80);
    v13 = *(_QWORD *)(type metadata accessor for URLQueryItem(0) - 8);
    v14 = swift_allocObject(v12, ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(_QWORD *)(v13 + 72), *(unsigned __int8 *)(v13 + 80) | 7);
    *(_OWORD *)(v14 + 16) = xmmword_100009CE0;
    v15 = URL.absoluteString.getter(v14);
    v17 = v16;
    URLQueryItem.init(name:value:)(0x7463657269646572, 0xEB000000004C5255, v15, v16);
    swift_bridgeObjectRelease(v17);
    URLComponents.queryItems.setter(v14);
  }
  if (v11(v8, 1, v2))
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(a1, 1, 1, v9);
  }
  else
  {
    v18 = (*(uint64_t (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
    URLComponents.url.getter(v18);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return sub_100006E48((uint64_t)v8, &qword_100010D78);
}

uint64_t sub_100005734(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(char *, unint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;

  v4 = type metadata accessor for URLQueryItem(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100003B78((uint64_t *)&unk_100010D90);
  __chkstk_darwin(v8);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for URLComponents(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    URLComponents.init()(v13);
    swift_bridgeObjectRetain(a2);
    v16 = URLComponents.query.setter(a1, a2);
    v17 = URLComponents.queryItems.getter(v16);
    a1 = v17;
    if (v17)
    {
      v34 = v12;
      v18 = *(_QWORD *)(v17 + 16);
      if (v18)
      {
        v32 = v11;
        v33 = v10;
        v19 = v17 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
        v20 = *(_QWORD *)(v5 + 72);
        v21 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v5 + 16);
        v31 = v17;
        swift_bridgeObjectRetain(v17);
        while (1)
        {
          v22 = v21(v7, v19, v4);
          v23 = URLQueryItem.name.getter(v22);
          v25 = v24;
          if (v23 == 0x6574617473 && v24 == 0xE500000000000000)
          {
            a1 = v31;
            swift_bridgeObjectRelease(v31);
            v29 = 0xE500000000000000;
            goto LABEL_16;
          }
          v26 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease(v25);
          if ((v26 & 1) != 0)
            break;
          (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
          v19 += v20;
          if (!--v18)
          {
            a1 = v31;
            swift_bridgeObjectRelease(v31);
            v27 = 1;
            v11 = v32;
            v10 = v33;
            goto LABEL_13;
          }
        }
        a1 = v31;
        v29 = v31;
LABEL_16:
        v28 = v34;
        swift_bridgeObjectRelease(v29);
        v10 = v33;
        (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v33, v7, v4);
        v27 = 0;
        v11 = v32;
      }
      else
      {
        v27 = 1;
LABEL_13:
        v28 = v34;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, v27, 1, v4);
      swift_bridgeObjectRelease(a1);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
      {
        (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v11);
        sub_100006E48((uint64_t)v10, (uint64_t *)&unk_100010D90);
        return 0;
      }
      else
      {
        a1 = URLQueryItem.value.getter();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v11);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    }
  }
  return a1;
}

_QWORD *sub_100005A30(uint64_t a1, unint64_t a2)
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
      v5 = sub_100005BA4(v4, 0);
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

_QWORD *sub_100005BA4(uint64_t a1, uint64_t a2)
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
  v4 = sub_100003B78((uint64_t *)&unk_100010E40);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

unint64_t sub_100005C08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = static Hasher._hash(seed:_:)(*(_QWORD *)(v1 + 40), a1);
  return sub_100005C9C(a1, v3);
}

unint64_t sub_100005C38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100005D38(a1, a2, v5);
}

unint64_t sub_100005C9C(uint64_t a1, uint64_t a2)
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

unint64_t sub_100005D38(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_100005E18(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  NSURL *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  char v37;
  char v38;
  Swift::String v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_allocWithZone((Class)NSURLComponents);
  URL._bridgeToObjectiveC()(v7);
  v9 = v8;
  v10 = objc_msgSend(v6, "initWithURL:resolvingAgainstBaseURL:", v8, 1);

  if (v10)
  {
    v11 = objc_msgSend(v10, "scheme");
    if (v11)
    {
      v12 = v11;
      v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v15 = v14;

    }
    else
    {
      v13 = 0;
      v15 = 0;
    }
    v26 = objc_msgSend(v10, "host");
    if (v26)
    {
      v27 = v26;
      v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v30 = v29;

    }
    else
    {
      v28 = 0;
      v30 = 0;
    }
    v31 = objc_msgSend(v10, "path");
    if (v31)
    {
      v32 = v31;
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      v34 = v33;

      if (v15)
      {
LABEL_14:
        if (v13 == 0x7370747468 && v15 == 0xE500000000000000)
          v35 = 1;
        else
          v35 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v15, 0x7370747468, 0xE500000000000000, 0);
        swift_bridgeObjectRelease(v15);
        if (v30)
        {
LABEL_22:
          if (v28 == 0x6562626131342E61 && v30 == 0xEF747365742E3565)
          {
            v37 = 1;
          }
          else
          {
            v37 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v30, 0x6562626131342E61, 0xEF747365742E3565, 0);
            if (v28 == 0xD000000000000018 && v30 == 0x8000000100009FB0)
            {
              v36 = 1;
              v30 = 0x8000000100009FB0;
              goto LABEL_31;
            }
          }
          v36 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v30, 0xD000000000000018, 0x8000000100009FB0, 0);
          if (v28 == 0xD000000000000010 && v30 == 0x8000000100009F70)
          {
            swift_bridgeObjectRelease(v30);
            goto LABEL_32;
          }
LABEL_31:
          v38 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v30, 0xD000000000000010, 0x8000000100009F70, 0);
          swift_bridgeObjectRelease(v30);
          if ((v38 & 1) == 0)
          {
            swift_bridgeObjectRelease(v34);
            goto LABEL_37;
          }
LABEL_32:
          if (v34)
          {
            v39._countAndFlagsBits = 0xD000000000000015;
            v39._object = (void *)0x8000000100009F90;
            LOBYTE(v30) = String.hasPrefix(_:)(v39);
            swift_bridgeObjectRelease(v34);
            goto LABEL_38;
          }
LABEL_37:
          LOBYTE(v30) = 0;
          goto LABEL_38;
        }
LABEL_19:
        swift_bridgeObjectRelease(v34);
        v36 = 0;
        v37 = 0;
LABEL_38:
        if (qword_100010C20 != -1)
          swift_once(&qword_100010C20, sub_100003384);
        v41 = type metadata accessor for Logger(0);
        v42 = sub_100003440(v41, (uint64_t)qword_100010F68);
        v43 = Logger.logObject.getter(v42);
        v44 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v43, v44))
        {
          v45 = swift_slowAlloc(20, -1);
          *(_DWORD *)v45 = 67109632;
          LODWORD(v48) = v35 & 1;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, (char *)&v48 + 4, v45 + 4, v45 + 8);
          *(_WORD *)(v45 + 8) = 1024;
          LODWORD(v48) = v37 & 1;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, (char *)&v48 + 4, v45 + 10, v45 + 14);
          *(_WORD *)(v45 + 14) = 1024;
          LODWORD(v48) = v30 & 1;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, (char *)&v48 + 4, v45 + 16, v45 + 20);
          _os_log_impl((void *)&_mh_execute_header, v43, v44, "Universal link validation: isValidScheme: %{BOOL}d, isValidUndisclosedUniversalLink: %{BOOL}d, isValidDefaultUniversalLink: %{BOOL}d.", (uint8_t *)v45, 0x14u);
          swift_slowDealloc(v45, -1, -1);
        }

        v40 = v35 & (v37 | v30 | v36);
        return v40 & 1;
      }
    }
    else
    {
      v34 = 0;
      if (v15)
        goto LABEL_14;
    }
    v35 = 0;
    if (v30)
      goto LABEL_22;
    goto LABEL_19;
  }
  if (qword_100010C20 != -1)
    swift_once(&qword_100010C20, sub_100003384);
  v16 = type metadata accessor for Logger(0);
  sub_100003440(v16, (uint64_t)qword_100010F68);
  v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc(12, -1);
    v21 = swift_slowAlloc(32, -1);
    v48 = v21;
    *(_DWORD *)v20 = 136315138;
    v22 = sub_100004364((unint64_t *)&qword_100010E30, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v23 = dispatch thunk of CustomStringConvertible.description.getter(v2, v22);
    v25 = v24;
    v47 = sub_100006F94(v23, v24, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48, v20 + 4, v20 + 12);
    swift_bridgeObjectRelease(v25);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Failed to create URL components from universalLink:%s", v20, 0xCu);
    swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v21, -1, -1);
    swift_slowDealloc(v20, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

  v40 = 0;
  return v40 & 1;
}

uint64_t sub_100006428(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;

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

uint64_t sub_1000064E8(_BYTE *__src, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return sub_100006428(__src, &__src[a2]);
  v4 = type metadata accessor for __DataStorage(0);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  __DataStorage.init(bytes:length:)(__src, a2);
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  v6 = type metadata accessor for Data.RangeReference(0);
  result = swift_allocObject(v6, 32, 7);
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_100006594(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  Swift::String v28;
  _QWORD *v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;
  char *v69;
  void (*v70)(char *, uint64_t);
  uint64_t (*v71)(char *, uint64_t, uint64_t);
  uint64_t v72;
  _OWORD v73[2];
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v2 = type metadata accessor for BinaryDecodingOptions(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v69 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CombinedState(0);
  __chkstk_darwin(v5);
  v69 = (char *)&v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v69 - v13;
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v69 - v16;
  v18 = URL.query.getter(v15);
  v20 = v19;
  v72 = sub_100005734(v18, v19);
  v22 = v21;
  swift_bridgeObjectRelease(v20);
  v71 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v23 = v71(v17, a1, v7);
  if (v22)
  {
    v70 = *(void (**)(char *, uint64_t))(v8 + 8);
    v70(v17, v7);
  }
  else
  {
    v24 = URL.fragment.getter(v23);
    v26 = v25;
    v72 = sub_100005734(v24, v25);
    v22 = v27;
    swift_bridgeObjectRelease(v26);
    v70 = *(void (**)(char *, uint64_t))(v8 + 8);
    v70(v17, v7);
    if (!v22)
    {
      if (qword_100010C20 != -1)
        swift_once(&qword_100010C20, sub_100003384);
      v54 = type metadata accessor for Logger(0);
      sub_100003440(v54, (uint64_t)qword_100010F68);
      v55 = v71(v14, a1, v7);
      v41 = Logger.logObject.getter(v55);
      v56 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v41, v56))
      {
        v57 = (uint8_t *)swift_slowAlloc(12, -1);
        v58 = swift_slowAlloc(32, -1);
        *(_QWORD *)&v73[0] = v58;
        *(_DWORD *)v57 = 136315138;
        v59 = sub_100004364((unint64_t *)&qword_100010E30, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
        v60 = dispatch thunk of CustomStringConvertible.description.getter(v7, v59);
        v62 = v61;
        v75 = sub_100006F94(v60, v61, (uint64_t *)v73);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v57 + 4, v57 + 12);
        swift_bridgeObjectRelease(v62);
        v70(v14, v7);
        _os_log_impl((void *)&_mh_execute_header, v41, v56, "State parameter is missed in the redirect url %s.", v57, 0xCu);
        swift_arrayDestroy(v58, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v58, -1, -1);
        swift_slowDealloc(v57, -1, -1);
      }
      else
      {
        v70(v14, v7);
      }
      goto LABEL_12;
    }
  }
  v28 = String.uppercased()();
  v29 = sub_100005A30(v28._countAndFlagsBits, (unint64_t)v28._object);
  swift_bridgeObjectRelease(v28._object);
  v30 = sub_100008B90((uint64_t)v29);
  swift_release(v29);
  if (!v30)
  {
    v37 = sub_100006DC4();
    v38 = swift_allocError(&_s5ErrorON, v37, 0, 0);
    swift_willThrow();
    swift_bridgeObjectRelease(v22);
    if (qword_100010C20 != -1)
      swift_once(&qword_100010C20, sub_100003384);
    v39 = type metadata accessor for Logger(0);
    sub_100003440(v39, (uint64_t)qword_100010F68);
    v40 = v71(v11, a1, v7);
    v41 = Logger.logObject.getter(v40);
    v42 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc(12, -1);
      v44 = swift_slowAlloc(32, -1);
      *(_QWORD *)&v73[0] = v44;
      *(_DWORD *)v43 = 136315138;
      v45 = sub_100004364((unint64_t *)&qword_100010E30, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v46 = dispatch thunk of CustomStringConvertible.description.getter(v7, v45);
      v48 = v47;
      v75 = sub_100006F94(v46, v47, (uint64_t *)v73);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v43 + 4, v43 + 12);
      swift_bridgeObjectRelease(v48);
      v70(v11, v7);
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Failed to decode client state on redirect to %s.", v43, 0xCu);
      swift_arrayDestroy(v44, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v44, -1, -1);
      swift_slowDealloc(v43, -1, -1);
    }
    else
    {
      v70(v11, v7);
    }
    swift_errorRelease(v38);
LABEL_12:

    return 0;
  }
  v31 = sub_1000064E8(v30 + 32, *((_QWORD *)v30 + 2));
  v33 = v32;
  swift_bridgeObjectRelease(v30);
  v74 = 0;
  memset(v73, 0, sizeof(v73));
  v34 = sub_1000043A4(v31, v33);
  BinaryDecodingOptions.init()(v34);
  v35 = sub_100004364(&qword_100010C58, type metadata accessor for CombinedState, (uint64_t)&unk_100009C18);
  v36 = (uint64_t)v69;
  Message.init(serializedData:extensions:partial:options:)(v31, v33, v73, 0, v4, v5, v35);
  v51 = *(_QWORD *)(v36 + 16);
  v52 = *(_QWORD *)(v36 + 24);
  sub_1000043A4(v51, v52);
  v53 = BankConnectAuthorizationSession.AuthSource.init(with:)(v51, v52);
  if ((v53 & 0x10000) == 0)
  {
    v49 = v53;
    sub_100006E08(v36);
    sub_1000043E8(v31, v33);
    swift_bridgeObjectRelease(v22);
    return v49;
  }
  if (qword_100010C20 != -1)
    swift_once(&qword_100010C20, sub_100003384);
  v63 = type metadata accessor for Logger(0);
  sub_100003440(v63, (uint64_t)qword_100010F68);
  v64 = swift_bridgeObjectRetain(v22);
  v65 = Logger.logObject.getter(v64);
  v66 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v65, v66))
  {
    v67 = (uint8_t *)swift_slowAlloc(12, -1);
    v68 = swift_slowAlloc(32, -1);
    *(_QWORD *)&v73[0] = v68;
    *(_DWORD *)v67 = 136315138;
    swift_bridgeObjectRetain(v22);
    v75 = sub_100006F94(v72, v22, (uint64_t *)v73);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v67 + 4, v67 + 12);
    swift_bridgeObjectRelease_n(v22, 3);
    _os_log_impl((void *)&_mh_execute_header, v65, v66, "Failed to decode AuthSource from state %s.", v67, 0xCu);
    swift_arrayDestroy(v68, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v68, -1, -1);
    swift_slowDealloc(v67, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(v22, 2);
  }

  sub_1000043E8(v31, v33);
  sub_100006E08(v36);
  return 0;
}

unint64_t sub_100006D2C()
{
  unint64_t result;

  result = qword_100010D60;
  if (!qword_100010D60)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100010D60);
  }
  return result;
}

uint64_t sub_100006D70(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100003B78(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_100006DB4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100006DC4()
{
  unint64_t result;

  result = qword_100010D88;
  if (!qword_100010D88)
  {
    result = swift_getWitnessTable(&unk_100009D7C, &_s5ErrorON);
    atomic_store(result, (unint64_t *)&qword_100010D88);
  }
  return result;
}

uint64_t sub_100006E08(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CombinedState(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006E48(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100003B78(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_100006F44()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC11FinanceStub11AppDelegate);
}

uint64_t sub_100006F94(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100007064(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000812C((uint64_t)v12, *a3);
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
      sub_10000812C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000810C(v12);
  return v7;
}

uint64_t sub_100007064(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000721C(a5, a6);
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

uint64_t sub_10000721C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100005A30(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000072B0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000072B0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1000072B0(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100003B78((uint64_t *)&unk_100010E40);
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

void sub_1000073FC(uint64_t a1)
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
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void (*v21)(char *, uint64_t);
  void *v22;
  id v23;
  NSURL *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  char *v46;
  uint64_t *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v45 - v7;
  if (qword_100010C20 != -1)
    swift_once(&qword_100010C20, sub_100003384);
  v9 = type metadata accessor for Logger(0);
  v10 = sub_100003440(v9, (uint64_t)qword_100010F68);
  v47 = *(uint64_t **)(v3 + 16);
  v11 = ((uint64_t (*)(char *, uint64_t, uint64_t))v47)(v8, a1, v2);
  v48 = (void *)v10;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v15 = (void *)swift_slowAlloc(32, -1);
    v46 = v6;
    v16 = v15;
    v51 = v15;
    v45 = a1;
    *(_DWORD *)v14 = 136315138;
    v17 = sub_1000080C4();
    v18 = dispatch thunk of CustomStringConvertible.description.getter(v2, v17);
    v20 = v19;
    v49 = sub_100006F94(v18, v19, (uint64_t *)&v51);
    a1 = v45;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease(v20);
    v21 = *(void (**)(char *, uint64_t))(v3 + 8);
    v21(v8, v2);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Cannot handle universal link to URL: %s", v14, 0xCu);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    v22 = v16;
    v6 = v46;
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v14, -1, -1);
  }
  else
  {
    v21 = *(void (**)(char *, uint64_t))(v3 + 8);
    v21(v8, v2);
  }

  v23 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
  if (!v23)
    __break(1u);
  v25 = v23;
  URL._bridgeToObjectiveC()(v24);
  v27 = v26;
  v51 = 0;
  v28 = objc_msgSend(v25, "openURL:configuration:error:", v26, 0, &v51);

  v29 = v51;
  if (v28)
  {
    v30 = v51;

  }
  else
  {
    v31 = v51;
    v32 = _convertNSErrorToError(_:)(v29);

    swift_willThrow();
    ((void (*)(char *, uint64_t, uint64_t))v47)(v6, a1, v2);
    swift_errorRetain(v32);
    v33 = swift_errorRetain(v32);
    v34 = Logger.logObject.getter(v33);
    v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = swift_slowAlloc(22, -1);
      v47 = (uint64_t *)swift_slowAlloc(8, -1);
      v48 = (void *)swift_slowAlloc(32, -1);
      v51 = v48;
      *(_DWORD *)v36 = 136315394;
      v37 = sub_1000080C4();
      v38 = dispatch thunk of CustomStringConvertible.description.getter(v2, v37);
      v40 = v39;
      v49 = sub_100006F94(v38, v39, (uint64_t *)&v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50, v36 + 4, v36 + 12);
      swift_bridgeObjectRelease(v40);
      v21(v6, v2);
      *(_WORD *)(v36 + 12) = 2112;
      swift_errorRetain(v32);
      v41 = _swift_stdlib_bridgeErrorToNSError(v32);
      v49 = v41;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50, v36 + 14, v36 + 22);
      v42 = v47;
      *v47 = v41;
      swift_errorRelease(v32);
      swift_errorRelease(v32);
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Failed to re-direct URL: %s to Safari with error: %@", (uint8_t *)v36, 0x16u);
      v43 = sub_100003B78(&qword_100010E38);
      swift_arrayDestroy(v42, 1, v43);
      swift_slowDealloc(v42, -1, -1);
      v44 = v48;
      swift_arrayDestroy(v48, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v44, -1, -1);
      swift_slowDealloc(v36, -1, -1);

      swift_errorRelease(v32);
    }
    else
    {
      swift_errorRelease(v32);
      v21(v6, v2);
      swift_errorRelease(v32);
      swift_errorRelease(v32);

    }
  }
}

uint64_t sub_1000078E4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  id v34;
  void *v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  void (*v48)(char *, uint64_t);
  uint8_t *v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  os_log_type_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t result;
  void *v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v2 = sub_100003B78(&qword_100010D58);
  v3 = __chkstk_darwin(v2);
  v73 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v71 - v6;
  __chkstk_darwin(v5);
  v9 = (char *)&v71 - v8;
  v74 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v74 - 8);
  v11 = __chkstk_darwin(v74);
  v13 = (char *)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v71 - v15;
  __chkstk_darwin(v14);
  v72 = (char *)&v71 - v17;
  v18 = type metadata accessor for DeviceType(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = __chkstk_darwin(v18);
  v22 = (char *)&v71 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = static DeviceInfo.deviceType.getter(v20);
  v24 = DeviceType.isiPhone.getter(v23);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
  if ((v24 & 1) == 0)
    return 0;
  v25 = objc_msgSend(a1, "activityType");
  v26 = ((uint64_t (*)(void))static String._unconditionallyBridgeFromObjectiveC(_:))();
  v28 = v27;

  v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSUserActivityTypeBrowsingWeb);
  v31 = v29;
  if (v26 == v30 && v28 == v29)
  {
    swift_bridgeObjectRelease_n(v28, 2);
    v32 = v74;
  }
  else
  {
    v33 = _stringCompareWithSmolCheck(_:_:expecting:)(v26, v28, v30, v29, 0);
    swift_bridgeObjectRelease(v28);
    swift_bridgeObjectRelease(v31);
    v32 = v74;
    if ((v33 & 1) == 0)
    {
LABEL_14:
      if (qword_100010C20 != -1)
        swift_once(&qword_100010C20, sub_100003384);
      v50 = type metadata accessor for Logger(0);
      sub_100003440(v50, (uint64_t)qword_100010F68);
      v51 = a1;
      v52 = Logger.logObject.getter(v51);
      v53 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v52, v53))
      {
        v54 = swift_slowAlloc(22, -1);
        v74 = swift_slowAlloc(64, -1);
        v76 = v74;
        *(_DWORD *)v54 = 136315394;
        v55 = objc_msgSend(v51, "webpageURL");
        if (v55)
        {
          v56 = v55;
          v57 = v73;
          static URL._unconditionallyBridgeFromObjectiveC(_:)();

          v58 = (uint64_t)v57;
          v59 = 0;
        }
        else
        {
          v59 = 1;
          v58 = (uint64_t)v73;
        }
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v58, v59, 1, v32);
        sub_10000803C(v58, (uint64_t)v7);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v32))
        {
          sub_100008084((uint64_t)v7);
          v60 = 0;
          v61 = 0xE000000000000000;
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v7, v32);
          v62 = sub_100008084((uint64_t)v7);
          v60 = URL.absoluteString.getter(v62);
          v61 = v63;
          (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v32);
        }
        v64 = v74;
        v75 = sub_100006F94(v60, v61, &v76);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v54 + 4, v54 + 12);

        swift_bridgeObjectRelease(v61);
        *(_WORD *)(v54 + 12) = 2080;
        v65 = objc_msgSend(v51, "activityType");
        v66 = static String._unconditionallyBridgeFromObjectiveC(_:)(v65);
        v68 = v67;

        v75 = sub_100006F94(v66, v68, &v76);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v54 + 14, v54 + 22);

        swift_bridgeObjectRelease(v68);
        _os_log_impl((void *)&_mh_execute_header, v52, v53, "The activity didn't continue from a universal link: %s activityType: %s", (uint8_t *)v54, 0x16u);
        swift_arrayDestroy(v64, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v64, -1, -1);
        swift_slowDealloc(v54, -1, -1);

      }
      else
      {

      }
      return 0;
    }
  }
  v34 = objc_msgSend(a1, "webpageURL");
  if (!v34)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v9, 1, 1, v32);
    goto LABEL_13;
  }
  v35 = v34;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  v36 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v36(v9, v16, v32);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v9, 0, 1, v32);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v9, 1, v32) == 1)
  {
LABEL_13:
    sub_100008084((uint64_t)v9);
    goto LABEL_14;
  }
  v37 = (uint64_t)v72;
  v36(v72, v9, v32);
  if (qword_100010C20 != -1)
    swift_once(&qword_100010C20, sub_100003384);
  v38 = type metadata accessor for Logger(0);
  sub_100003440(v38, (uint64_t)qword_100010F68);
  v39 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v37, v32);
  v40 = Logger.logObject.getter(v39);
  v41 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = (uint8_t *)swift_slowAlloc(12, -1);
    v43 = swift_slowAlloc(32, -1);
    v76 = v43;
    *(_DWORD *)v42 = 136315138;
    v44 = sub_1000080C4();
    v45 = dispatch thunk of CustomStringConvertible.description.getter(v74, v44);
    v47 = v46;
    v75 = sub_100006F94(v45, v46, &v76);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v42 + 4, v42 + 12);
    swift_bridgeObjectRelease(v47);
    v48 = *(void (**)(char *, uint64_t))(v10 + 8);
    v48(v13, v74);
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "Handling universal link: %s", v42, 0xCu);
    swift_arrayDestroy(v43, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v43, -1, -1);
    v49 = v42;
    v32 = v74;
    swift_slowDealloc(v49, -1, -1);
  }
  else
  {
    v48 = *(void (**)(char *, uint64_t))(v10 + 8);
    v48(v13, v32);
  }

  result = (uint64_t)objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
  if (result)
  {
    v70 = (void *)result;
    if ((sub_1000048CC(v37, (void *)result) & 1) != 0)
    {
      v48((char *)v37, v32);

      return 1;
    }
    sub_1000073FC(v37);

    v48((char *)v37, v32);
    return 0;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000803C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003B78(&qword_100010D58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008084(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003B78(&qword_100010D58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000080C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010E30;
  if (!qword_100010E30)
  {
    v1 = type metadata accessor for URL(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for URL, v1);
    atomic_store(result, (unint64_t *)&qword_100010E30);
  }
  return result;
}

uint64_t sub_10000810C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000812C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100008168()
{
  off_100010EB0 = &off_10000C568;
}

uint64_t sub_10000817C()
{
  unsigned int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v5;
  unint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  if (qword_100010C40 != -1)
    goto LABEL_23;
  while (1)
  {
    v0 = (unsigned int *)off_100010EB0;
    v1 = *((_QWORD *)off_100010EB0 + 2);
    if (!v1)
      break;
    v2 = *((unsigned int *)off_100010EB0 + 8);
    swift_bridgeObjectRetain_n(off_100010EB0, 2);
    v3 = 0;
    while (1)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(_swiftEmptyDictionarySingleton);
      v6 = sub_100005C08(v2);
      v7 = _swiftEmptyDictionarySingleton[2];
      v8 = (v5 & 1) == 0;
      v9 = v7 + v8;
      if (__OFADD__(v7, v8))
        break;
      v10 = v5;
      if (_swiftEmptyDictionarySingleton[3] >= v9)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          if ((v5 & 1) == 0)
            goto LABEL_13;
        }
        else
        {
          sub_1000087E0();
          if ((v10 & 1) == 0)
            goto LABEL_13;
        }
      }
      else
      {
        sub_10000854C(v9, isUniquelyReferenced_nonNull_native);
        v11 = sub_100005C08(v2);
        if ((v10 & 1) != (v12 & 1))
        {
          result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Int);
          __break(1u);
          return result;
        }
        v6 = v11;
        if ((v10 & 1) == 0)
        {
LABEL_13:
          _swiftEmptyDictionarySingleton[(v6 >> 6) + 8] |= 1 << v6;
          *(_QWORD *)(_swiftEmptyDictionarySingleton[6] + 8 * v6) = v2;
          *(_BYTE *)(_swiftEmptyDictionarySingleton[7] + v6) = v3;
          v13 = _swiftEmptyDictionarySingleton[2];
          v14 = __OFADD__(v13, 1);
          v15 = v13 + 1;
          if (v14)
            goto LABEL_22;
          _swiftEmptyDictionarySingleton[2] = v15;
          goto LABEL_15;
        }
      }
      *(_BYTE *)(_swiftEmptyDictionarySingleton[7] + v6) = v3;
LABEL_15:
      swift_bridgeObjectRelease(0x8000000000000000);
      if (v1 - 1 == v3)
        goto LABEL_18;
      v2 = v0[v3++ + 9];
      if (v3 == 256)
      {
        _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Not enough bits to represent the passed value", 45, 2, "Swift/Integers.swift", 20, 2, 3455, 0);
        __break(1u);
LABEL_18:
        swift_bridgeObjectRelease(v0);
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    swift_once(&qword_100010C40, sub_100008168);
  }
  swift_bridgeObjectRetain(off_100010EB0);
LABEL_20:
  off_100010EB8 = _swiftEmptyDictionarySingleton;
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000839C()
{
  return 1;
}

Swift::Int sub_1000083A4()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void sub_1000083E4()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_100008408(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

char *sub_100008454(char *result, int64_t a2, char a3, char *a4)
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
      v10 = sub_100003B78((uint64_t *)&unk_100010E40);
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
    sub_100008AAC(0, v8, v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000854C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  char v33;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100003B78(&qword_100010EC0);
  result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v33 = a2;
    v32 = v3;
    v9 = 0;
    v10 = (_QWORD *)(v5 + 64);
    v11 = 1 << *(_BYTE *)(v5 + 32);
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v13 = v12 & *(_QWORD *)(v5 + 64);
    v14 = (unint64_t)(v11 + 63) >> 6;
    v15 = result + 64;
    while (1)
    {
      if (v13)
      {
        v17 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v18 = v17 | (v9 << 6);
      }
      else
      {
        if (__OFADD__(v9++, 1))
          goto LABEL_41;
        if (v9 >= v14)
        {
LABEL_32:
          if ((v33 & 1) == 0)
          {
            result = swift_release(v5);
            v3 = v32;
            goto LABEL_39;
          }
          v31 = 1 << *(_BYTE *)(v5 + 32);
          if (v31 >= 64)
            bzero((void *)(v5 + 64), ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
          else
            *v10 = -1 << v31;
          v3 = v32;
          *(_QWORD *)(v5 + 16) = 0;
          break;
        }
        v20 = v10[v9];
        if (!v20)
        {
          v21 = v9 + 1;
          if (v9 + 1 >= v14)
            goto LABEL_32;
          v20 = v10[v21];
          if (!v20)
          {
            while (1)
            {
              v9 = v21 + 1;
              if (__OFADD__(v21, 1))
                break;
              if (v9 >= v14)
                goto LABEL_32;
              v20 = v10[v9];
              ++v21;
              if (v20)
                goto LABEL_22;
            }
LABEL_40:
            __break(1u);
LABEL_41:
            __break(1u);
            return result;
          }
          ++v9;
        }
LABEL_22:
        v13 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v9 << 6);
      }
      v22 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v18);
      v23 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v18);
      result = static Hasher._hash(seed:_:)(*(_QWORD *)(v8 + 40), v22);
      v24 = -1 << *(_BYTE *)(v8 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v15 + 8 * (v25 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v15 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_40;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v15 + 8 * v26);
        }
        while (v30 == -1);
        v16 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v15 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v16) = v22;
      *(_BYTE *)(*(_QWORD *)(v8 + 56) + v16) = v23;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
LABEL_39:
  *v3 = v8;
  return result;
}

void *sub_1000087E0()
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
  char v16;
  unint64_t v18;
  int64_t v19;

  v1 = v0;
  sub_100003B78(&qword_100010EC0);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
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
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    if (!v18)
      break;
LABEL_23:
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = v16;
  }
  v19 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

_QWORD *sub_100008954(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  int64_t v5;
  uint64_t v8;
  _QWORD *v9;
  size_t v10;
  void *v11;
  _QWORD *result;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
    goto LABEL_16;
  if (!v5)
    return &_swiftEmptyArrayStorage;
  if (v5 > 0)
  {
    v8 = sub_100003B78((uint64_t *)&unk_100010E40);
    v9 = (_QWORD *)swift_allocObject(v8, v5 + 32, 7);
    v10 = j__malloc_size(v9);
    v9[2] = v5;
    v9[3] = 2 * v10 - 64;
    if (v4 != a3)
      goto LABEL_5;
    goto LABEL_15;
  }
  v9 = &_swiftEmptyArrayStorage;
  if (v4 == a3)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
LABEL_5:
  if (v5 < 0)
  {
LABEL_17:
    result = (_QWORD *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_18;
  }
  v11 = v9 + 4;
  if (a2 + a3 >= (unint64_t)v9 + v5 + 32 || (unint64_t)v11 >= a2 + a3 + v5)
  {
    memcpy(v11, (const void *)(a2 + a3), v5);
    return v9;
  }
  result = (_QWORD *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_18:
  __break(1u);
  return result;
}

char *sub_100008AAC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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

char *sub_100008B90(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char *v17;
  unint64_t v18;
  char v19;
  char v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  char v24;
  char v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unsigned int v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char v46;
  unsigned int v47;
  unint64_t v48;
  unint64_t v49;
  char v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v54;
  uint64_t v55;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (char *)&_swiftEmptyArrayStorage;
  v2 = a1;
  v3 = 0;
  v54 = a1 + 32;
  v4 = (char *)&_swiftEmptyArrayStorage;
  v55 = *(_QWORD *)(a1 + 16);
LABEL_4:
  v5 = v3 + 8;
  if (__OFADD__(v3, 8))
  {
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
    JUMPOUT(0x10000918CLL);
  }
  if (v1 >= v5)
    v6 = v3 + 8;
  else
    v6 = v1;
  if (v6 < v3)
    goto LABEL_70;
  v7 = type metadata accessor for __ContiguousArrayStorageBase(0);
  v8 = swift_bridgeObjectRetain(v2);
  v9 = swift_unknownObjectRetain_n(v8, 2);
  v10 = (_QWORD *)swift_dynamicCastClass(v9, v7);
  if (!v10)
  {
    swift_bridgeObjectRelease(v2);
    v10 = &_swiftEmptyArrayStorage;
  }
  v11 = v10[2];
  swift_release(v10);
  if (v11 == v6 - v3)
  {
    v12 = (_QWORD *)swift_dynamicCastClass(v2, v7);
    if (!v12)
    {
      swift_bridgeObjectRelease(v2);
      v12 = &_swiftEmptyArrayStorage;
    }
  }
  else
  {
    swift_bridgeObjectRelease(v2);
    v12 = sub_100008954(v2, v54, v3, (2 * v6) | 1);
  }
  swift_bridgeObjectRelease(v2);
  v13 = v12[2];
  if (v13)
  {
    v14 = qword_100010C48;
    swift_retain(v12);
    if (v14 != -1)
      swift_once(&qword_100010C48, sub_10000817C);
    v15 = 0;
    v16 = off_100010EB8;
    v17 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      if (v16[2])
      {
        v18 = sub_100005C08(*((unsigned __int8 *)v12 + v15 + 32));
        if ((v19 & 1) != 0)
        {
          v20 = *(_BYTE *)(v16[7] + v18);
          if ((swift_isUniquelyReferenced_nonNull_native(v17) & 1) == 0)
            v17 = sub_100008454(0, *((_QWORD *)v17 + 2) + 1, 1, v17);
          v22 = *((_QWORD *)v17 + 2);
          v21 = *((_QWORD *)v17 + 3);
          if (v22 >= v21 >> 1)
            v17 = sub_100008454((char *)(v21 > 1), v22 + 1, 1, v17);
          *((_QWORD *)v17 + 2) = v22 + 1;
          v17[v22 + 32] = v20;
        }
      }
      ++v15;
    }
    while (v13 != v15);
    swift_release_n(v12, 2);
  }
  else
  {
    swift_release(v12);
    v17 = (char *)&_swiftEmptyArrayStorage;
  }
  v23 = (char *)&_swiftEmptyArrayStorage;
  switch(*((_QWORD *)v17 + 2))
  {
    case 2:
      goto LABEL_53;
    case 4:
      goto LABEL_47;
    case 5:
      goto LABEL_40;
    case 7:
      goto LABEL_34;
    case 8:
      v24 = v17[38];
      v25 = v17[39];
      v23 = sub_100008454(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
      v27 = *((_QWORD *)v23 + 2);
      v26 = *((_QWORD *)v23 + 3);
      if (v27 >= v26 >> 1)
        v23 = sub_100008454((char *)(v26 > 1), v27 + 1, 1, v23);
      *((_QWORD *)v23 + 2) = v27 + 1;
      v23[v27 + 32] = v25 | (32 * v24);
      v28 = *((_QWORD *)v17 + 2);
      if (v28 < 5)
        goto LABEL_78;
      if (v28 == 5)
        goto LABEL_79;
      if (v28 < 7)
        goto LABEL_80;
LABEL_34:
      v29 = v17[36];
      v30 = v17[37];
      v31 = v17[38];
      if ((swift_isUniquelyReferenced_nonNull_native(v23) & 1) == 0)
        v23 = sub_100008454(0, *((_QWORD *)v23 + 2) + 1, 1, v23);
      v33 = *((_QWORD *)v23 + 2);
      v32 = *((_QWORD *)v23 + 3);
      if (v33 >= v32 >> 1)
        v23 = sub_100008454((char *)(v32 > 1), v33 + 1, 1, v23);
      *((_QWORD *)v23 + 2) = v33 + 1;
      v23[v33 + 32] = (4 * v30) | (v29 << 7) | (v31 >> 3);
      v34 = *((_QWORD *)v17 + 2);
      if (v34 < 4)
        goto LABEL_76;
      if (v34 == 4)
        goto LABEL_77;
LABEL_40:
      v35 = v17[35];
      v36 = v17[36];
      if ((swift_isUniquelyReferenced_nonNull_native(v23) & 1) == 0)
        v23 = sub_100008454(0, *((_QWORD *)v23 + 2) + 1, 1, v23);
      v38 = *((_QWORD *)v23 + 2);
      v37 = *((_QWORD *)v23 + 3);
      if (v38 >= v37 >> 1)
        v23 = sub_100008454((char *)(v37 > 1), v38 + 1, 1, v23);
      *((_QWORD *)v23 + 2) = v38 + 1;
      v23[v38 + 32] = (v36 >> 1) | (16 * v35);
      v39 = *((_QWORD *)v17 + 2);
      if (v39 < 2)
        goto LABEL_73;
      if (v39 == 2)
        goto LABEL_74;
      if (v39 < 4)
        goto LABEL_75;
LABEL_47:
      v40 = v17[33];
      v41 = v17[34];
      v42 = v17[35];
      if ((swift_isUniquelyReferenced_nonNull_native(v23) & 1) == 0)
        v23 = sub_100008454(0, *((_QWORD *)v23 + 2) + 1, 1, v23);
      v44 = *((_QWORD *)v23 + 2);
      v43 = *((_QWORD *)v23 + 3);
      if (v44 >= v43 >> 1)
        v23 = sub_100008454((char *)(v43 > 1), v44 + 1, 1, v23);
      *((_QWORD *)v23 + 2) = v44 + 1;
      v23[v44 + 32] = (2 * v41) | (v40 << 6) | (v42 >> 4);
      v45 = *((_QWORD *)v17 + 2);
      if (v45 == 1)
        goto LABEL_71;
      if (!v45)
        goto LABEL_72;
LABEL_53:
      v46 = v17[32];
      v47 = v17[33];
      swift_bridgeObjectRelease(v17);
      if ((swift_isUniquelyReferenced_nonNull_native(v23) & 1) == 0)
        v23 = sub_100008454(0, *((_QWORD *)v23 + 2) + 1, 1, v23);
      v49 = *((_QWORD *)v23 + 2);
      v48 = *((_QWORD *)v23 + 3);
      v17 = (char *)(v49 + 1);
      if (v49 >= v48 >> 1)
        v23 = sub_100008454((char *)(v48 > 1), v49 + 1, 1, v23);
      *((_QWORD *)v23 + 2) = v17;
      v23[v49 + 32] = (v47 >> 2) | (8 * v46);
      if ((swift_isUniquelyReferenced_nonNull_native(v4) & 1) == 0)
        v4 = sub_100008454(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
      break;
    default:
      goto LABEL_68;
  }
  while (v49 < *((_QWORD *)v23 + 2))
  {
    v50 = v23[v49 + 32];
    v52 = *((_QWORD *)v4 + 2);
    v51 = *((_QWORD *)v4 + 3);
    v17 = (char *)(v52 + 1);
    if (v52 >= v51 >> 1)
      v4 = sub_100008454((char *)(v51 > 1), v52 + 1, 1, v4);
    --v49;
    *((_QWORD *)v4 + 2) = v17;
    v4[v52 + 32] = v50;
    if (v49 == -1)
    {
      swift_bridgeObjectRelease(v23);
      v3 = v5;
      v1 = v55;
      v2 = a1;
      if (v5 >= v55)
        return v4;
      goto LABEL_4;
    }
  }
  __break(1u);
LABEL_68:
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v4);
  return 0;
}

uint64_t _s5ErrorOwet(unsigned int *a1, int a2)
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

uint64_t _s5ErrorOwst(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100009240 + 4 * asc_100009D04[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100009260 + 4 * byte_100009D09[v4]))();
}

_BYTE *sub_100009240(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100009260(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100009268(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100009270(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100009278(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100009280(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_10000928C()
{
  return 0;
}

ValueMetadata *_s5ErrorOMa()
{
  return &_s5ErrorON;
}

unint64_t sub_1000092A8()
{
  unint64_t result;

  result = qword_100010EC8;
  if (!qword_100010EC8)
  {
    result = swift_getWitnessTable(&unk_100009D54, &_s5ErrorON);
    atomic_store(result, (unint64_t *)&qword_100010EC8);
  }
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  int v3;
  char **v4;
  uint64_t v5;
  objc_class *ObjCClassFromMetadata;
  NSString *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = static CommandLine.argc.getter(*(_QWORD *)&argc, argv, envp);
  v4 = (char **)static CommandLine.unsafeArgv.getter();
  v5 = type metadata accessor for AppDelegate();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v5);
  v7 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v7)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v9 = v8;
    v7 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  UIApplicationMain(v3, v4, 0, v7);

  return 0;
}

uint64_t sub_100009370()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC11FinanceStubP33_FE6414ED9DEEC6C79787A7068F70F19319ResourceBundleClass);
}
