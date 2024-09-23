void Ckcode_Proto2Any.typeURL.getter()
{
  type metadata accessor for Ckcode_Proto2Any(0);
  swift_bridgeObjectRetain();
  sub_1DE204208();
  sub_1DE20425C();
}

uint64_t type metadata accessor for Ckcode_Proto2Any(uint64_t a1)
{
  return sub_1DE20064C(a1, (uint64_t *)&unk_1F0438708);
}

void sub_1DE1FF970(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  Ckcode_Proto2Any.typeURL.getter();
  *a1 = v2;
  a1[1] = v3;
}

void sub_1DE1FF998()
{
  swift_bridgeObjectRetain();
  Ckcode_Proto2Any.typeURL.setter();
}

void Ckcode_Proto2Any.typeURL.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + *(int *)(sub_1DE204384() + 20));
  swift_bridgeObjectRelease();
  *v3 = v2;
  v3[1] = v0;
  sub_1DE2041D0();
}

void Ckcode_Proto2Any.typeURL.modify(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = *(int *)(sub_1DE20434C(a1) + 20);
  *(_DWORD *)(v1 + 24) = v3;
  v4 = (uint64_t *)(v2 + v3);
  v5 = v4[1];
  if (v5)
  {
    v6 = *v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  *(_QWORD *)v1 = v6;
  *(_QWORD *)(v1 + 8) = v7;
  swift_bridgeObjectRetain();
  sub_1DE2041FC();
  sub_1DE20425C();
}

void sub_1DE1FFA58(uint64_t *a1, char a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = a1[1];
  v3 = (_QWORD *)(a1[2] + *((int *)a1 + 6));
  v4 = *a1;
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *v3 = v4;
    v3[1] = v2;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    *v3 = v4;
    v3[1] = v2;
    sub_1DE2041D0();
  }
}

BOOL Ckcode_Proto2Any.hasTypeURL.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for Ckcode_Proto2Any(0) + 20) + 8) != 0;
}

Swift::Void __swiftcall Ckcode_Proto2Any.clearTypeURL()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(v0 + *(int *)(type metadata accessor for Ckcode_Proto2Any(0) + 20));
  swift_bridgeObjectRelease();
  *v1 = 0;
  v1[1] = 0;
  sub_1DE20425C();
}

void Ckcode_Proto2Any.value.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v0 = type metadata accessor for Ckcode_Proto2Any(0);
  v1 = sub_1DE204460(*(int *)(v0 + 24));
  sub_1DE1FFB50(v1, v2);
  sub_1DE204208();
  sub_1DE20425C();
}

uint64_t sub_1DE1FFB50(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1DE1FFB64(a1, a2);
  return a1;
}

uint64_t sub_1DE1FFB64(uint64_t a1, unint64_t a2)
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

void sub_1DE1FFBA8(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  Ckcode_Proto2Any.value.getter();
  *a1 = v2;
  a1[1] = v3;
}

void sub_1DE1FFBD0(uint64_t a1)
{
  sub_1DE1FFB64(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  Ckcode_Proto2Any.value.setter();
}

void Ckcode_Proto2Any.value.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = v1 + *(int *)(sub_1DE204384() + 24);
  sub_1DE1FFC40(*(_QWORD *)v3, *(_QWORD *)(v3 + 8));
  *(_QWORD *)v3 = v2;
  *(_QWORD *)(v3 + 8) = v0;
  sub_1DE2041D0();
}

uint64_t sub_1DE1FFC40(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1DE1FFC54(a1, a2);
  return a1;
}

uint64_t sub_1DE1FFC54(uint64_t a1, unint64_t a2)
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

void Ckcode_Proto2Any.value.modify(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v2 = *(int *)(sub_1DE20434C(a1) + 24);
  *(_DWORD *)(v1 + 24) = v2;
  v5 = sub_1DE204460(v2);
  if (!v4 & v3)
    v7 = 0;
  else
    v7 = v5;
  v8 = 0xC000000000000000;
  if (!(!v4 & v3))
    v8 = v6;
  *(_QWORD *)v1 = v7;
  *(_QWORD *)(v1 + 8) = v8;
  sub_1DE1FFB50(v5, v6);
  sub_1DE20425C();
}

uint64_t sub_1DE1FFCDC(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t result;

  v2 = a1[1];
  v3 = a1[2] + *((int *)a1 + 6);
  v4 = *a1;
  v5 = *(_QWORD *)v3;
  v6 = *(_QWORD *)(v3 + 8);
  if ((a2 & 1) != 0)
  {
    v7 = sub_1DE2041FC();
    sub_1DE1FFB64(v7, v8);
    sub_1DE1FFC40(v5, v6);
    *(_QWORD *)v3 = v4;
    *(_QWORD *)(v3 + 8) = v2;
    v9 = sub_1DE2041FC();
    return sub_1DE1FFC54(v9, v10);
  }
  else
  {
    result = sub_1DE1FFC40(*(_QWORD *)v3, *(_QWORD *)(v3 + 8));
    *(_QWORD *)v3 = v4;
    *(_QWORD *)(v3 + 8) = v2;
  }
  return result;
}

BOOL Ckcode_Proto2Any.hasValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for Ckcode_Proto2Any(0) + 24) + 8) >> 60 != 15;
}

Swift::Void __swiftcall Ckcode_Proto2Any.clearValue()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + *(int *)(type metadata accessor for Ckcode_Proto2Any(0) + 24);
  sub_1DE1FFC40(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  *(_OWORD *)v1 = xmmword_1DE226500;
  sub_1DE20425C();
}

uint64_t Ckcode_Proto2Any.unknownFields.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_1DE2041F4();
  v0 = sub_1DE204208();
  return sub_1DE2041BC(v0, v1, v2, v3);
}

uint64_t Ckcode_Proto2Any.unknownFields.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_1DE2041F4();
  v0 = sub_1DE2041FC();
  return sub_1DE2041BC(v0, v1, v2, v3);
}

uint64_t (*Ckcode_Proto2Any.unknownFields.modify())()
{
  return nullsub_1;
}

void Ckcode_Proto2Any.init()(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  UnknownStorage.init()();
  v2 = type metadata accessor for Ckcode_Proto2Any(0);
  sub_1DE204474(v2);
  *(_OWORD *)(a1 + v3) = xmmword_1DE226500;
  sub_1DE20425C();
}

void Ckcode_Proto2ProtectedEnvelope.contents.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_1DE203ED0(v1, a1, &qword_1F04386A8);
}

uint64_t sub_1DE1FFE88(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0EA5A8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t Ckcode_Proto2ProtectedEnvelope.contents.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_1DE1FFED0(a1, v1);
}

uint64_t sub_1DE1FFED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1DE1FFE88(&qword_1F04386A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*Ckcode_Proto2ProtectedEnvelope.contents.modify())()
{
  return nullsub_1;
}

void Ckcode_Proto2ProtectedEnvelope.encrypted.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  int EnumCaseMultiPayload;

  sub_1DE1FFE88(&qword_1F04386A8);
  sub_1DE2041AC();
  MEMORY[0x1E0C80A78]();
  sub_1DE20430C();
  v1 = sub_1DE2041FC();
  sub_1DE203ED0(v1, v2, &qword_1F04386A8);
  v3 = sub_1DE204488();
  sub_1DE2043B4(v0, 1, v3);
  if (v4)
  {
    sub_1DE203EA8(v0, &qword_1F04386A8);
  }
  else
  {
    sub_1DE204208();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
      sub_1DE2005D4(v0, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
  }
  sub_1DE2041D0();
}

uint64_t type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(uint64_t a1)
{
  return sub_1DE20064C(a1, (uint64_t *)&unk_1F0438730);
}

uint64_t _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

void sub_1DE1FFFF4(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  Ckcode_Proto2ProtectedEnvelope.encrypted.getter();
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1DE20001C(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  sub_1DE1FFB64(*a1, v2);
  return Ckcode_Proto2ProtectedEnvelope.encrypted.setter(v1, v2);
}

uint64_t Ckcode_Proto2ProtectedEnvelope.encrypted.setter(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_1DE204344(a1, &qword_1F04386A8);
  *v2 = a1;
  v2[1] = a2;
  type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  sub_1DE2041FC();
  swift_storeEnumTagMultiPayload();
  v5 = sub_1DE204418();
  return sub_1DE2041C4(v5, v6, v7, v8);
}

uint64_t _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

void Ckcode_Proto2ProtectedEnvelope.encrypted.modify(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  __int128 *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  int v10;
  __int128 v11;

  v2 = v1;
  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[2] = v2;
  v5 = sub_1DE1FFE88(&qword_1F04386A8);
  v6 = (__int128 *)sub_1DE204440(v5);
  v4[3] = v6;
  sub_1DE2043A4();
  v7 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  v4[4] = v7;
  v8 = sub_1DE2043B4((uint64_t)v6, 1, v7);
  if (v9)
  {
    sub_1DE204344(v8, &qword_1F04386A8);
  }
  else
  {
    v10 = sub_1DE204400();
    if (v10 != 1)
    {
      v11 = *v6;
      goto LABEL_8;
    }
    sub_1DE2005D4((uint64_t)v6, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
  }
  v11 = xmmword_1DE226510;
LABEL_8:
  *(_OWORD *)v4 = v11;
  sub_1DE2041D0();
}

void sub_1DE200178(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  uint64_t v4;

  v2 = *a1;
  v3 = (void *)(*a1)[3];
  v4 = (*a1)[2];
  if ((a2 & 1) != 0)
  {
    sub_1DE1FFB64(**a1, (*a1)[1]);
    sub_1DE203EA8(v4, &qword_1F04386A8);
    sub_1DE204264();
    sub_1DE2042CC();
    sub_1DE1FFC54(*v2, v2[1]);
  }
  else
  {
    sub_1DE203EA8((*a1)[2], &qword_1F04386A8);
    sub_1DE204264();
    sub_1DE2042CC();
  }
  free(v3);
  free(v2);
}

void Ckcode_Proto2ProtectedEnvelope.value.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_QWORD);
  uint64_t v10;
  uint64_t v11;

  sub_1DE1FFE88(&qword_1F04386A8);
  sub_1DE2041AC();
  MEMORY[0x1E0C80A78]();
  sub_1DE204324();
  sub_1DE2043A4();
  v3 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  v4 = sub_1DE2043B4(v1, 1, v3);
  if (v5)
  {
    sub_1DE204344(v4, &qword_1F04386A8);
LABEL_7:
    UnknownStorage.init()();
    v10 = type metadata accessor for Ckcode_Proto2Any(0);
    sub_1DE204474(v10);
    *(_OWORD *)(a1 + v11) = xmmword_1DE226500;
    goto LABEL_8;
  }
  v6 = sub_1DE204400();
  if (v6 != 1)
  {
    sub_1DE2005D4(v1, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    goto LABEL_7;
  }
  v7 = sub_1DE2041FC();
  sub_1DE202628(v7, v8, v9);
LABEL_8:
  sub_1DE2041D0();
}

void sub_1DE2002D4(uint64_t a1@<X8>)
{
  Ckcode_Proto2ProtectedEnvelope.value.getter(a1);
}

uint64_t sub_1DE2002F4(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(_QWORD);
  uint64_t v6;

  type metadata accessor for Ckcode_Proto2Any(0);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DE2008C4(a1, (uint64_t)v3, v4);
  return Ckcode_Proto2ProtectedEnvelope.value.setter((uint64_t)v3);
}

uint64_t Ckcode_Proto2ProtectedEnvelope.value.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1DE204344(a1, &qword_1F04386A8);
  v1 = sub_1DE204208();
  sub_1DE202628(v1, v2, v3);
  type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  sub_1DE2041FC();
  swift_storeEnumTagMultiPayload();
  v4 = sub_1DE204418();
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v4, v5, v6, v7);
}

void (*Ckcode_Proto2ProtectedEnvelope.value.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  size_t v8;
  char *v9;
  uint64_t v10;
  char v11;
  int v12;
  char *v13;

  v2 = v1;
  v4 = malloc(0x28uLL);
  *a1 = v4;
  *v4 = v1;
  v5 = sub_1DE1FFE88(&qword_1F04386A8);
  v6 = sub_1DE204440(v5);
  v4[1] = v6;
  v7 = sub_1DE204490();
  v8 = *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64);
  v4[2] = malloc(v8);
  v9 = (char *)malloc(v8);
  v4[3] = v9;
  sub_1DE203ED0(v2, (uint64_t)v6, &qword_1F04386A8);
  v10 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  v4[4] = v10;
  sub_1DE2043B4((uint64_t)v6, 1, v10);
  if (v11)
  {
    sub_1DE203EA8((uint64_t)v6, &qword_1F04386A8);
LABEL_7:
    UnknownStorage.init()();
    v13 = &v9[*(int *)(v7 + 20)];
    *(_QWORD *)v13 = 0;
    *((_QWORD *)v13 + 1) = 0;
    *(_OWORD *)&v9[*(int *)(v7 + 24)] = xmmword_1DE226500;
    return sub_1DE200500;
  }
  v12 = sub_1DE20439C();
  if (v12 != 1)
  {
    sub_1DE2005D4((uint64_t)v6, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    goto LABEL_7;
  }
  sub_1DE202628((uint64_t)v6, (uint64_t)v9, type metadata accessor for Ckcode_Proto2Any);
  return sub_1DE200500;
}

void sub_1DE200500(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  v3 = (void *)(*a1)[3];
  v4 = (void *)(*a1)[1];
  v5 = (void *)(*a1)[2];
  v6 = **a1;
  if ((a2 & 1) != 0)
  {
    sub_1DE2008C4((*a1)[3], (uint64_t)v5, type metadata accessor for Ckcode_Proto2Any);
    sub_1DE20436C(v7, &qword_1F04386A8);
    sub_1DE202628((uint64_t)v5, v6, type metadata accessor for Ckcode_Proto2Any);
    sub_1DE20435C();
    sub_1DE2042A4();
    sub_1DE2005D4((uint64_t)v3, type metadata accessor for Ckcode_Proto2Any);
  }
  else
  {
    sub_1DE20436C((uint64_t)a1, &qword_1F04386A8);
    sub_1DE202628((uint64_t)v3, v6, type metadata accessor for Ckcode_Proto2Any);
    sub_1DE20435C();
    sub_1DE2042A4();
  }
  free(v3);
  free(v5);
  free(v4);
  free(v2);
}

void sub_1DE2005D4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  sub_1DE2042B8(v2);
  sub_1DE20425C();
}

uint64_t Ckcode_Proto2ProtectedEnvelope.unknownFields.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  type metadata accessor for Ckcode_Proto2ProtectedEnvelope(0);
  sub_1DE2041F4();
  v0 = sub_1DE204208();
  return sub_1DE2041BC(v0, v1, v2, v3);
}

uint64_t type metadata accessor for Ckcode_Proto2ProtectedEnvelope(uint64_t a1)
{
  return sub_1DE20064C(a1, (uint64_t *)&unk_1F0438718);
}

uint64_t sub_1DE20064C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t Ckcode_Proto2ProtectedEnvelope.unknownFields.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  type metadata accessor for Ckcode_Proto2ProtectedEnvelope(0);
  sub_1DE2041F4();
  v0 = sub_1DE2041FC();
  return sub_1DE2041BC(v0, v1, v2, v3);
}

uint64_t (*Ckcode_Proto2ProtectedEnvelope.unknownFields.modify())(_QWORD)
{
  type metadata accessor for Ckcode_Proto2ProtectedEnvelope(0);
  return nullsub_1;
}

void static Ckcode_Proto2ProtectedEnvelope.OneOf_Contents.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  sub_1DE204490();
  sub_1DE2041AC();
  MEMORY[0x1E0C80A78]();
  sub_1DE204324();
  type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  sub_1DE2041AC();
  MEMORY[0x1E0C80A78]();
  sub_1DE204214();
  v8 = v6 - v7;
  MEMORY[0x1E0C80A78]();
  v10 = (uint64_t *)((char *)&v17 - v9);
  sub_1DE1FFE88(&qword_1F04386B0);
  sub_1DE2041AC();
  MEMORY[0x1E0C80A78]();
  sub_1DE20430C();
  v12 = (uint64_t *)(v2 + *(int *)(v11 + 48));
  sub_1DE2008C4(a1, v2, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
  sub_1DE2008C4(a2, (uint64_t)v12, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
  if (sub_1DE20439C() == 1)
  {
    sub_1DE2008C4(v2, v8, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    if (sub_1DE20439C() == 1)
    {
      sub_1DE202628((uint64_t)v12, v3, type metadata accessor for Ckcode_Proto2Any);
      static Ckcode_Proto2Any.== infix(_:_:)(v8, v3);
      sub_1DE2005D4(v3, type metadata accessor for Ckcode_Proto2Any);
      sub_1DE2005D4(v8, type metadata accessor for Ckcode_Proto2Any);
LABEL_9:
      sub_1DE2005D4(v2, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
      goto LABEL_10;
    }
    sub_1DE2005D4(v8, type metadata accessor for Ckcode_Proto2Any);
  }
  else
  {
    sub_1DE2008C4(v2, (uint64_t)v10, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    v13 = *v10;
    v14 = v10[1];
    if (sub_1DE20439C() != 1)
    {
      v15 = *v12;
      v16 = v12[1];
      MEMORY[0x1DF0E9C30](v13, v14, v15, v16);
      sub_1DE1FFC54(v15, v16);
      sub_1DE20440C();
      goto LABEL_9;
    }
    sub_1DE20440C();
  }
  sub_1DE203EA8(v2, &qword_1F04386B0);
LABEL_10:
  sub_1DE2041DC();
}

void sub_1DE2008C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = sub_1DE204374(a1, a2, a3);
  sub_1DE204238(v3);
  sub_1DE20425C();
}

void static Ckcode_Proto2Any.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  int v29;

  v4 = sub_1DE2041F4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  sub_1DE204214();
  v8 = (char *)(v6 - v7);
  MEMORY[0x1E0C80A78]();
  v10 = (char *)&v28 - v9;
  v11 = sub_1DE204490();
  v12 = *(int *)(v11 + 20);
  v13 = (_QWORD *)(a1 + v12);
  v14 = *(_QWORD *)(a1 + v12 + 8);
  v15 = (_QWORD *)(a2 + v12);
  v16 = v15[1];
  if (!v14)
  {
    if (v16)
      goto LABEL_17;
LABEL_10:
    v18 = *(int *)(v11 + 24);
    v19 = *(_QWORD *)(a1 + v18);
    v20 = *(_QWORD *)(a1 + v18 + 8);
    v21 = *(_QWORD *)(a2 + v18 + 8);
    if (v20 >> 60 == 15)
    {
      if (v21 >> 60 == 15)
        goto LABEL_16;
    }
    else if (v21 >> 60 != 15)
    {
      v24 = sub_1DE204278();
      v29 = MEMORY[0x1DF0E9C30](v24);
      sub_1DE2043E0();
      sub_1DE1FFC40(v19, v20);
      if ((v29 & 1) == 0)
        goto LABEL_17;
LABEL_16:
      v25 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
      v25(v10, a1, v4);
      v25(v8, a2, v4);
      sub_1DE2025EC(&qword_1F04386B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E998], MEMORY[0x1E0D3E9A8]);
      dispatch thunk of static Equatable.== infix(_:_:)();
      v26 = *(void (**)(uint64_t))(v5 + 8);
      v27 = sub_1DE204208();
      v26(v27);
      ((void (*)(char *, uint64_t))v26)(v10, v4);
      goto LABEL_17;
    }
    v22 = sub_1DE204278();
    sub_1DE1FFC40(v22, v23);
    sub_1DE2043E0();
    goto LABEL_17;
  }
  if (v16)
  {
    v17 = *v13 == *v15 && v14 == v16;
    if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      goto LABEL_10;
  }
LABEL_17:
  sub_1DE2041DC();
}

void Ckcode_Proto2ProtectedEnvelope.init()(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_1DE204488();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(a1, 1, 1, v2);
  type metadata accessor for Ckcode_Proto2ProtectedEnvelope(0);
  UnknownStorage.init()();
  sub_1DE20425C();
}

void sub_1DE200AEC()
{
  qword_1F04385F8 = 0x65646F636B63;
  unk_1F0438600 = 0xE600000000000000;
}

void sub_1DE200B0C(uint64_t a1)
{
  sub_1DE2010D4(a1, 0xD000000000000010, qword_1F0438610, 0x80000001DE22A810, &qword_1F0438610[1]);
}

void static Ckcode_Proto2Any.protoMessageName.getter()
{
  sub_1DE20114C(&qword_1F0438608);
}

uint64_t sub_1DE200B54()
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
  sub_1DE203EFC(v0, qword_1F0438628);
  sub_1DE2025D4(v0, (uint64_t)qword_1F0438628);
  sub_1DE1FFE88(&qword_1F0438760);
  v1 = sub_1DE1FFE88(&qword_1F0438768);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DE226520;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "type_url";
  *(_QWORD *)(v7 + 8) = 8;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF20];
  v9 = type metadata accessor for _NameMap.NameDescription();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "value";
  *((_QWORD *)v11 + 1) = 5;
  v11[16] = 2;
  v10();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t static Ckcode_Proto2Any._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DE201300(&qword_1F0438620, (uint64_t)qword_1F0438628, a1);
}

void Ckcode_Proto2Any.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  sub_1DE2042E0(a1, a2);
  while (1)
  {
    v3 = dispatch thunk of Decoder.nextFieldNumber()();
    if (v2 || (v4 & 1) != 0)
      break;
    if (v3 == 2)
    {
      sub_1DE204224();
      sub_1DE200D88();
    }
    else if (v3 == 1)
    {
      sub_1DE204224();
      sub_1DE200D28();
    }
  }
  sub_1DE20444C();
}

uint64_t sub_1DE200D28()
{
  type metadata accessor for Ckcode_Proto2Any(0);
  return dispatch thunk of Decoder.decodeSingularStringField(value:)();
}

uint64_t sub_1DE200D88()
{
  type metadata accessor for Ckcode_Proto2Any(0);
  return dispatch thunk of Decoder.decodeSingularBytesField(value:)();
}

uint64_t Ckcode_Proto2Any.traverse<A>(visitor:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  v1 = sub_1DE2043EC();
  result = sub_1DE200E3C(v1);
  if (!v0)
  {
    v3 = sub_1DE2043EC();
    sub_1DE200EB0(v3);
    return UnknownStorage.traverse<A>(visitor:)();
  }
  return result;
}

uint64_t sub_1DE200E3C(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for Ckcode_Proto2Any(0);
  if (*(_QWORD *)(a1 + *(int *)(result + 20) + 8))
    return dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)();
  return result;
}

uint64_t sub_1DE200EB0(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  result = type metadata accessor for Ckcode_Proto2Any(0);
  v3 = a1 + *(int *)(result + 24);
  v4 = *(_QWORD *)(v3 + 8);
  if (v4 >> 60 != 15)
  {
    v5 = *(_QWORD *)v3;
    sub_1DE1FFB64(*(_QWORD *)v3, *(_QWORD *)(v3 + 8));
    dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
    return sub_1DE1FFC40(v5, v4);
  }
  return result;
}

Swift::Int Ckcode_Proto2Any.hashValue.getter()
{
  return sub_1DE20208C(type metadata accessor for Ckcode_Proto2Any, &qword_1F04386C0, (uint64_t)&protocol conformance descriptor for Ckcode_Proto2Any);
}

uint64_t (*sub_1DE200F7C())()
{
  return nullsub_1;
}

void sub_1DE200F8C(uint64_t a1, uint64_t a2)
{
  Ckcode_Proto2Any.decodeMessage<A>(decoder:)(a1, a2);
}

uint64_t sub_1DE200FA0()
{
  return Ckcode_Proto2Any.traverse<A>(visitor:)();
}

uint64_t sub_1DE200FB8()
{
  sub_1DE2025EC(&qword_1F0438750, type metadata accessor for Ckcode_Proto2Any, (uint64_t)&protocol conformance descriptor for Ckcode_Proto2Any);
  return _MessageImplementationBase.isEqualTo(message:)();
}

uint64_t sub_1DE201010()
{
  sub_1DE2025EC(&qword_1F04386E0, type metadata accessor for Ckcode_Proto2Any, (uint64_t)&protocol conformance descriptor for Ckcode_Proto2Any);
  return Message.debugDescription.getter();
}

uint64_t sub_1DE201054()
{
  sub_1DE2025EC(&qword_1F04386E0, type metadata accessor for Ckcode_Proto2Any, (uint64_t)&protocol conformance descriptor for Ckcode_Proto2Any);
  return Message.hash(into:)();
}

void sub_1DE2010AC(uint64_t a1)
{
  sub_1DE2010D4(a1, 0xD00000000000001ELL, qword_1F0438648, 0x80000001DE22A7E0, &qword_1F0438648[1]);
}

void sub_1DE2010D4(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5)
{
  if (qword_1F04385F0 != -1)
    swift_once();
  *a3 = a2;
  *a5 = a4;
  sub_1DE2041D0();
}

void static Ckcode_Proto2ProtectedEnvelope.protoMessageName.getter()
{
  sub_1DE20114C(&qword_1F0438640);
}

void sub_1DE20114C(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1DE2041FC();
  sub_1DE20425C();
}

uint64_t sub_1DE201194()
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
  sub_1DE203EFC(v0, qword_1F0438660);
  sub_1DE2025D4(v0, (uint64_t)qword_1F0438660);
  sub_1DE1FFE88(&qword_1F0438760);
  v1 = sub_1DE1FFE88(&qword_1F0438768);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DE226520;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "encrypted";
  *(_QWORD *)(v7 + 8) = 9;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF08];
  v9 = type metadata accessor for _NameMap.NameDescription();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "value";
  *((_QWORD *)v11 + 1) = 5;
  v11[16] = 2;
  v10();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t static Ckcode_Proto2ProtectedEnvelope._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DE201300(&qword_1F0438658, (uint64_t)qword_1F0438660, a1);
}

uint64_t sub_1DE201300@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = type metadata accessor for _NameMap();
  v6 = sub_1DE2025D4(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

void Ckcode_Proto2ProtectedEnvelope.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  __int128 *v8;
  uint64_t v9;
  uint64_t v10;

  sub_1DE2042E0(a1, a2);
  while (1)
  {
    v5 = dispatch thunk of Decoder.nextFieldNumber()();
    if (v2 || (v6 & 1) != 0)
      break;
    if (v5 == 2)
    {
      v9 = sub_1DE204208();
      sub_1DE201570(v9, v10, v4, v3);
    }
    else if (v5 == 1)
    {
      v7 = sub_1DE204224();
      sub_1DE2013D0(v7, v8);
    }
  }
  sub_1DE20444C();
}

uint64_t sub_1DE2013D0(uint64_t a1, __int128 *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  __int128 v8;
  int v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v4 = sub_1DE1FFE88(&qword_1F04386A8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = xmmword_1DE226500;
  result = dispatch thunk of Decoder.decodeSingularBytesField(value:)();
  v8 = v11;
  if (v2)
    return sub_1DE1FFC40(v11, *((unint64_t *)&v11 + 1));
  if (*((_QWORD *)&v11 + 1) >> 60 != 15)
  {
    sub_1DE203ED0((uint64_t)a2, (uint64_t)v6, &qword_1F04386A8);
    v12 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
    v9 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v6, 1, v12);
    sub_1DE1FFB64(v8, *((unint64_t *)&v8 + 1));
    sub_1DE203EA8((uint64_t)v6, &qword_1F04386A8);
    if (v9 != 1)
      dispatch thunk of Decoder.handleConflictingOneOf()();
    sub_1DE1FFC40(v8, *((unint64_t *)&v8 + 1));
    sub_1DE203EA8((uint64_t)a2, &qword_1F04386A8);
    *a2 = v8;
    v10 = v12;
    swift_storeEnumTagMultiPayload();
    return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a2, 0, 1, v10);
  }
  return result;
}

void sub_1DE201570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
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
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v34 = a2;
  v36 = a4;
  v35 = a3;
  v5 = type metadata accessor for Ckcode_Proto2Any(0);
  v6 = MEMORY[0x1E0C80A78](v5);
  v32 = (uint64_t)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v30 - v8;
  v10 = sub_1DE1FFE88(&qword_1F04386A8);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v30 - v17;
  v19 = sub_1DE1FFE88(&qword_1F0438758);
  v20 = MEMORY[0x1E0C80A78](v19);
  v22 = (char *)&v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v20);
  v24 = (char *)&v30 - v23;
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)&v30 - v23, 1, 1, v5);
  v30 = a1;
  sub_1DE203ED0(a1, (uint64_t)v12, &qword_1F04386A8);
  v31 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v12, 1, v13);
  if (v31 == 1)
  {
    sub_1DE203EA8((uint64_t)v12, &qword_1F04386A8);
    v25 = v13;
  }
  else
  {
    sub_1DE202628((uint64_t)v12, (uint64_t)v18, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    sub_1DE202628((uint64_t)v18, (uint64_t)v16, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    v25 = v13;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_1DE203EA8((uint64_t)v24, &qword_1F0438758);
      sub_1DE202628((uint64_t)v16, (uint64_t)v9, type metadata accessor for Ckcode_Proto2Any);
      sub_1DE202628((uint64_t)v9, (uint64_t)v24, type metadata accessor for Ckcode_Proto2Any);
      _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v24, 0, 1, v5);
    }
    else
    {
      sub_1DE2005D4((uint64_t)v16, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    }
  }
  v26 = v33;
  sub_1DE2025EC(&qword_1F04386E0, type metadata accessor for Ckcode_Proto2Any, (uint64_t)&protocol conformance descriptor for Ckcode_Proto2Any);
  dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
  if (v26)
  {
    v27 = (uint64_t)v24;
LABEL_10:
    sub_1DE203EA8(v27, &qword_1F0438758);
    return;
  }
  sub_1DE203ED0((uint64_t)v24, (uint64_t)v22, &qword_1F0438758);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v22, 1, v5) == 1)
  {
    sub_1DE203EA8((uint64_t)v24, &qword_1F0438758);
    v27 = (uint64_t)v22;
    goto LABEL_10;
  }
  v28 = v32;
  sub_1DE202628((uint64_t)v22, v32, type metadata accessor for Ckcode_Proto2Any);
  if (v31 != 1)
    dispatch thunk of Decoder.handleConflictingOneOf()();
  sub_1DE203EA8((uint64_t)v24, &qword_1F0438758);
  v29 = v30;
  sub_1DE203EA8(v30, &qword_1F04386A8);
  sub_1DE202628(v28, v29, type metadata accessor for Ckcode_Proto2Any);
  swift_storeEnumTagMultiPayload();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v29, 0, 1, v25);
}

void Ckcode_Proto2ProtectedEnvelope.traverse<A>(visitor:)()
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

  sub_1DE1FFE88(&qword_1F04386A8);
  sub_1DE2041AC();
  MEMORY[0x1E0C80A78](v2);
  sub_1DE2042FC();
  v5 = v4 - v3;
  sub_1DE203ED0(v0, v4 - v3, &qword_1F04386A8);
  v6 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v5, 1, v6) == 1)
    goto LABEL_2;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_1DE2043C8();
    sub_1DE201BB4(v7);
    sub_1DE2005D4(v5, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    if (!v1)
    {
LABEL_2:
      type metadata accessor for Ckcode_Proto2ProtectedEnvelope(0);
      UnknownStorage.traverse<A>(visitor:)();
    }
  }
  else
  {
    sub_1DE2005D4(v5, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    v8 = sub_1DE2043C8();
    sub_1DE201A8C(v8);
    if (!v1)
      goto LABEL_2;
  }
}

void sub_1DE201A8C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = sub_1DE1FFE88(&qword_1F04386A8);
  MEMORY[0x1E0C80A78](v2);
  v4 = (uint64_t *)((char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1DE203ED0(a1, (uint64_t)v4, &qword_1F04386A8);
  v5 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v4, 1, v5) == 1)
  {
    sub_1DE203EA8((uint64_t)v4, &qword_1F04386A8);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      v7 = *v4;
      v6 = v4[1];
      dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
      sub_1DE1FFC54(v7, v6);
      return;
    }
    sub_1DE2005D4((uint64_t)v4, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
  }
  __break(1u);
}

void sub_1DE201BB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v9[2];

  v2 = sub_1DE1FFE88(&qword_1F04386A8);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Ckcode_Proto2Any(0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DE203ED0(a1, (uint64_t)v4, &qword_1F04386A8);
  v8 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v4, 1, v8) == 1)
  {
    sub_1DE203EA8((uint64_t)v4, &qword_1F04386A8);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_1DE202628((uint64_t)v4, (uint64_t)v7, type metadata accessor for Ckcode_Proto2Any);
      sub_1DE2025EC(&qword_1F04386E0, type metadata accessor for Ckcode_Proto2Any, (uint64_t)&protocol conformance descriptor for Ckcode_Proto2Any);
      dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
      sub_1DE2005D4((uint64_t)v7, type metadata accessor for Ckcode_Proto2Any);
      return;
    }
    sub_1DE2005D4((uint64_t)v4, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
  }
  __break(1u);
}

void static Ckcode_Proto2ProtectedEnvelope.== infix(_:_:)(uint64_t a1, uint64_t a2)
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
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  char *v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;

  v35 = sub_1DE2041F4();
  v40 = *(_QWORD *)(v35 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  sub_1DE204214();
  v39 = (char *)(v4 - v5);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v37 = (char *)&v35 - v6;
  v7 = sub_1DE204488();
  sub_1DE2041AC();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  sub_1DE2042FC();
  v10 = v9 - v8;
  v11 = sub_1DE1FFE88(&qword_1F04386C8);
  sub_1DE2041AC();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  sub_1DE2042FC();
  v14 = v13 - v12;
  sub_1DE1FFE88(&qword_1F04386A8);
  sub_1DE2041AC();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  sub_1DE204214();
  v17 = v15 - v16;
  v18 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v20 = (char *)&v35 - v19;
  MEMORY[0x1E0C80A78](v18);
  v22 = (char *)&v35 - v21;
  v36 = a1;
  sub_1DE204394(a1, (uint64_t)&v35 - v21);
  v38 = a2;
  sub_1DE204394(a2, (uint64_t)v20);
  v23 = v14 + *(int *)(v11 + 48);
  sub_1DE204394((uint64_t)v22, v14);
  sub_1DE204394((uint64_t)v20, v23);
  sub_1DE2043B4(v14, 1, v7);
  if (v25)
  {
    sub_1DE20433C((uint64_t)v20);
    sub_1DE20433C((uint64_t)v22);
    v24 = sub_1DE2043B4(v23, 1, v7);
    if (v25)
    {
      sub_1DE20436C(v24, &qword_1F04386A8);
LABEL_11:
      v28 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope(0);
      v29 = v37;
      v30 = v40;
      v31 = *(void (**)(char *, uint64_t, uint64_t))(v40 + 16);
      v32 = v35;
      v31(v37, v36 + *(int *)(v28 + 20), v35);
      v33 = v39;
      v31(v39, v38 + *(int *)(v28 + 20), v32);
      sub_1DE2025EC(&qword_1F04386B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E998], MEMORY[0x1E0D3E9A8]);
      dispatch thunk of static Equatable.== infix(_:_:)();
      v34 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
      v34((uint64_t)v33, v32);
      v34((uint64_t)v29, v32);
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  sub_1DE203ED0(v14, v17, &qword_1F04386A8);
  sub_1DE2043B4(v23, 1, v7);
  if (v25)
  {
    sub_1DE20433C((uint64_t)v20);
    sub_1DE20433C((uint64_t)v22);
    sub_1DE2005D4(v17, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
LABEL_9:
    sub_1DE20436C(v24, &qword_1F04386C8);
    goto LABEL_12;
  }
  sub_1DE202628(v23, v10, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
  static Ckcode_Proto2ProtectedEnvelope.OneOf_Contents.== infix(_:_:)(v17, v10);
  v27 = v26;
  sub_1DE2005D4(v10, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
  sub_1DE204458((uint64_t)v20);
  sub_1DE204458((uint64_t)v22);
  sub_1DE2005D4(v17, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
  sub_1DE204458(v14);
  if ((v27 & 1) != 0)
    goto LABEL_11;
LABEL_12:
  sub_1DE2041DC();
}

Swift::Int Ckcode_Proto2ProtectedEnvelope.hashValue.getter()
{
  return sub_1DE20208C(type metadata accessor for Ckcode_Proto2ProtectedEnvelope, &qword_1F04386D0, (uint64_t)&protocol conformance descriptor for Ckcode_Proto2ProtectedEnvelope);
}

Swift::Int sub_1DE20208C(uint64_t (*a1)(uint64_t), unint64_t *a2, uint64_t a3)
{
  Hasher.init(_seed:)();
  a1(0);
  sub_1DE2025EC(a2, a1, a3);
  dispatch thunk of Hashable.hash(into:)();
  return Hasher._finalize()();
}

uint64_t (*sub_1DE202118())()
{
  return nullsub_1;
}

void sub_1DE20212C(uint64_t a1, uint64_t a2)
{
  Ckcode_Proto2ProtectedEnvelope.decodeMessage<A>(decoder:)(a1, a2);
}

void sub_1DE202140()
{
  Ckcode_Proto2ProtectedEnvelope.traverse<A>(visitor:)();
}

uint64_t sub_1DE202154()
{
  sub_1DE2025EC(&qword_1F0438748, type metadata accessor for Ckcode_Proto2ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_Proto2ProtectedEnvelope);
  return _MessageImplementationBase.isEqualTo(message:)();
}

uint64_t sub_1DE2021A8()
{
  sub_1DE2025EC(&qword_1F04386F8, type metadata accessor for Ckcode_Proto2ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_Proto2ProtectedEnvelope);
  return Message.debugDescription.getter();
}

uint64_t sub_1DE2021EC()
{
  sub_1DE2025EC(&qword_1F04386F8, type metadata accessor for Ckcode_Proto2ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_Proto2ProtectedEnvelope);
  return Message.hash(into:)();
}

Swift::Int sub_1DE20223C()
{
  Hasher.init(_seed:)();
  dispatch thunk of Hashable.hash(into:)();
  return Hasher._finalize()();
}

uint64_t sub_1DE202290()
{
  sub_1DE2025EC(&qword_1F0438788, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1DE226A4C);
  return Error<>._domain.getter();
}

uint64_t sub_1DE2022D0()
{
  sub_1DE2025EC(&qword_1F0438788, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1DE226A4C);
  return Error<>._code.getter();
}

uint64_t sub_1DE202314()
{
  sub_1DE2025EC((unint64_t *)&unk_1F0438CA0, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1DE226A90);
  return _BridgedStoredNSError._getEmbeddedNSError()();
}

id sub_1DE202354()
{
  id *v0;

  return *v0;
}

uint64_t sub_1DE20235C@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1DE202368()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1DE202378()
{
  sub_1DE2025EC((unint64_t *)&unk_1F0438CA0, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1DE226A90);
  return _BridgedStoredNSError.errorCode.getter();
}

uint64_t sub_1DE2023B8()
{
  sub_1DE2025EC((unint64_t *)&unk_1F0438CA0, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1DE226A90);
  return _BridgedStoredNSError.errorUserInfo.getter();
}

uint64_t sub_1DE2023F8(void *a1)
{
  id v2;

  sub_1DE2025EC((unint64_t *)&unk_1F0438CA0, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1DE226A90);
  v2 = a1;
  return _BridgedStoredNSError.init(_bridgedNSError:)();
}

uint64_t sub_1DE20245C()
{
  void **v0;

  return sub_1DE20417C(*v0);
}

uint64_t sub_1DE202464()
{
  sub_1DE2025EC((unint64_t *)&unk_1F0438CA0, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1DE226A90);
  return _BridgedStoredNSError.hash(into:)();
}

Swift::Int sub_1DE2024B4()
{
  Hasher.init(_seed:)();
  dispatch thunk of Hashable.hash(into:)();
  return Hasher._finalize()();
}

void sub_1DE202510(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  sub_1DE202540();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

uint64_t sub_1DE202548@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_1DE202570()
{
  sub_1DE2025EC((unint64_t *)&unk_1F0438CA0, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1DE226A90);
  return static _BridgedStoredNSError.== infix(_:_:)();
}

BOOL sub_1DE2025C8(uint64_t *a1, uint64_t *a2)
{
  return sub_1DE204170(*a1, *a2);
}

uint64_t sub_1DE2025D4(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_1DE2025EC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x1DF0EA5C0](a3, v5), a1);
  }
  sub_1DE20425C();
}

void sub_1DE202628(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = sub_1DE204374(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v3, v4, v5);
  sub_1DE20425C();
}

void sub_1DE20265C()
{
  sub_1DE2025EC(&qword_1F04386D8, type metadata accessor for Ckcode_Proto2Any, (uint64_t)&protocol conformance descriptor for Ckcode_Proto2Any);
}

void sub_1DE202688()
{
  sub_1DE2025EC(&qword_1F04386E0, type metadata accessor for Ckcode_Proto2Any, (uint64_t)&protocol conformance descriptor for Ckcode_Proto2Any);
}

void sub_1DE2026B4()
{
  sub_1DE2025EC(&qword_1F04386C0, type metadata accessor for Ckcode_Proto2Any, (uint64_t)&protocol conformance descriptor for Ckcode_Proto2Any);
}

void sub_1DE2026E0()
{
  sub_1DE2025EC(&qword_1F04386E8, type metadata accessor for Ckcode_Proto2Any, (uint64_t)&protocol conformance descriptor for Ckcode_Proto2Any);
}

void sub_1DE20270C()
{
  sub_1DE2025EC(&qword_1F04386F0, type metadata accessor for Ckcode_Proto2ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_Proto2ProtectedEnvelope);
}

void sub_1DE202738()
{
  sub_1DE2025EC(&qword_1F04386F8, type metadata accessor for Ckcode_Proto2ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_Proto2ProtectedEnvelope);
}

void sub_1DE202764()
{
  sub_1DE2025EC(&qword_1F04386D0, type metadata accessor for Ckcode_Proto2ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_Proto2ProtectedEnvelope);
}

void sub_1DE202790()
{
  sub_1DE2025EC(&qword_1F0438700, type metadata accessor for Ckcode_Proto2ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_Proto2ProtectedEnvelope);
}

uint64_t *initializeBufferWithCopyOfBuffer for Ckcode_Proto2Any(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  _OWORD *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for UnknownStorage();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (char *)a1 + v9;
    v14 = (_OWORD *)((char *)a2 + v9);
    v15 = *(uint64_t *)((char *)a2 + v9 + 8);
    swift_bridgeObjectRetain();
    if (v15 >> 60 == 15)
    {
      *(_OWORD *)v13 = *v14;
    }
    else
    {
      v17 = *(_QWORD *)v14;
      sub_1DE1FFB64(v17, v15);
      *(_QWORD *)v13 = v17;
      *((_QWORD *)v13 + 1) = v15;
    }
  }
  return a1;
}

uint64_t destroy for Ckcode_Proto2Any(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t *v6;
  unint64_t v7;

  v4 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  result = swift_bridgeObjectRelease();
  v6 = (uint64_t *)(a1 + *(int *)(a2 + 24));
  v7 = v6[1];
  if (v7 >> 60 != 15)
    return sub_1DE1FFC54(*v6, v7);
  return result;
}

uint64_t initializeWithCopy for Ckcode_Proto2Any(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v6 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a1 + v8;
  v13 = a2 + v8;
  v14 = *(_QWORD *)(v13 + 8);
  swift_bridgeObjectRetain();
  if (v14 >> 60 == 15)
  {
    *(_OWORD *)v12 = *(_OWORD *)v13;
  }
  else
  {
    v15 = *(_QWORD *)v13;
    sub_1DE1FFB64(v15, v14);
    *(_QWORD *)v12 = v15;
    *(_QWORD *)(v12 + 8) = v14;
  }
  return a1;
}

uint64_t assignWithCopy for Ckcode_Proto2Any(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v6 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 24);
  v11 = (uint64_t *)(a1 + v10);
  v12 = (uint64_t *)(a2 + v10);
  v13 = *(_QWORD *)(a2 + v10 + 8);
  if (*(_QWORD *)(a1 + v10 + 8) >> 60 != 15)
  {
    if (v13 >> 60 != 15)
    {
      v15 = *v12;
      sub_1DE1FFB64(v15, v13);
      v16 = *v11;
      v17 = v11[1];
      *v11 = v15;
      v11[1] = v13;
      sub_1DE1FFC54(v16, v17);
      return a1;
    }
    sub_1DE202A98((uint64_t)v11);
    goto LABEL_6;
  }
  if (v13 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)v11 = *(_OWORD *)v12;
    return a1;
  }
  v14 = *v12;
  sub_1DE1FFB64(v14, v13);
  *v11 = v14;
  v11[1] = v13;
  return a1;
}

uint64_t sub_1DE202A98(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0CB0338] - 8) + 8))();
  return a1;
}

uint64_t initializeWithTake for Ckcode_Proto2Any(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for Ckcode_Proto2Any(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v6 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = *(int *)(a3 + 24);
  v13 = (uint64_t *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v15 = *(_QWORD *)(a1 + v12 + 8);
  if (v15 >> 60 != 15)
  {
    v16 = v14[1];
    if (v16 >> 60 != 15)
    {
      v17 = *v13;
      *v13 = *v14;
      v13[1] = v16;
      sub_1DE1FFC54(v17, v15);
      return a1;
    }
    sub_1DE202A98((uint64_t)v13);
  }
  *(_OWORD *)v13 = *(_OWORD *)v14;
  return a1;
}

uint64_t getEnumTagSinglePayload for Ckcode_Proto2Any()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DE202BF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;
  int v9;

  v6 = sub_1DE2041F4();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return sub_1DE204250(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  v9 = v8 - 1;
  if (v9 < 0)
    v9 = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for Ckcode_Proto2Any()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1DE202C80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  sub_1DE20442C();
  v4 = sub_1DE2041F4();
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == v3)
  {
    sub_1DE2041C4(v1, v0, v0, v4);
  }
  else
  {
    *(_QWORD *)(v1 + *(int *)(v2 + 20) + 8) = v0;
    sub_1DE2041D0();
  }
}

uint64_t sub_1DE202CD8()
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

uint64_t *initializeBufferWithCopyOfBuffer for Ckcode_Proto2ProtectedEnvelope(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _OWORD *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
    if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v7))
    {
      v8 = sub_1DE1FFE88(&qword_1F04386A8);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v10 = type metadata accessor for UnknownStorage();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
        v11 = type metadata accessor for Ckcode_Proto2Any(0);
        v12 = *(int *)(v11 + 20);
        v13 = (uint64_t *)((char *)a1 + v12);
        v14 = (uint64_t *)((char *)a2 + v12);
        v16 = *v14;
        v15 = v14[1];
        *v13 = v16;
        v13[1] = v15;
        v17 = *(int *)(v11 + 24);
        v18 = (char *)a1 + v17;
        v19 = (_OWORD *)((char *)a2 + v17);
        v20 = *(uint64_t *)((char *)a2 + v17 + 8);
        swift_bridgeObjectRetain();
        if (v20 >> 60 == 15)
        {
          *(_OWORD *)v18 = *v19;
        }
        else
        {
          v23 = *(_QWORD *)v19;
          sub_1DE1FFB64(v23, v20);
          *(_QWORD *)v18 = v23;
          *((_QWORD *)v18 + 1) = v20;
        }
      }
      else
      {
        v21 = *a2;
        v22 = a2[1];
        sub_1DE1FFB64(*a2, v22);
        *a1 = v21;
        a1[1] = v22;
      }
      swift_storeEnumTagMultiPayload();
      _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v7);
    }
    v24 = *(int *)(a3 + 20);
    v25 = (char *)a1 + v24;
    v26 = (char *)a2 + v24;
    v27 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
  }
  return a1;
}

uint64_t destroy for Ckcode_Proto2ProtectedEnvelope(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  v4 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  if (!_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a1, 1, v4))
  {
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      v9 = *a1;
      v8 = a1[1];
      goto LABEL_6;
    }
    v5 = type metadata accessor for UnknownStorage();
    (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
    v6 = type metadata accessor for Ckcode_Proto2Any(0);
    swift_bridgeObjectRelease();
    v7 = (uint64_t *)((char *)a1 + *(int *)(v6 + 24));
    v8 = v7[1];
    if (v8 >> 60 != 15)
    {
      v9 = *v7;
LABEL_6:
      sub_1DE1FFC54(v9, v8);
    }
  }
  v10 = (char *)a1 + *(int *)(a2 + 20);
  v11 = type metadata accessor for UnknownStorage();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
}

_QWORD *initializeWithCopy for Ckcode_Proto2ProtectedEnvelope(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _OWORD *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;

  v6 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v6))
  {
    v7 = sub_1DE1FFE88(&qword_1F04386A8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v8 = type metadata accessor for UnknownStorage();
      (*(void (**)(_QWORD *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = type metadata accessor for Ckcode_Proto2Any(0);
      v10 = *(int *)(v9 + 20);
      v11 = (_QWORD *)((char *)a1 + v10);
      v12 = (uint64_t *)((char *)a2 + v10);
      v14 = *v12;
      v13 = v12[1];
      *v11 = v14;
      v11[1] = v13;
      v15 = *(int *)(v9 + 24);
      v16 = (char *)a1 + v15;
      v17 = (_OWORD *)((char *)a2 + v15);
      v18 = *(uint64_t *)((char *)a2 + v15 + 8);
      swift_bridgeObjectRetain();
      if (v18 >> 60 == 15)
      {
        *(_OWORD *)v16 = *v17;
      }
      else
      {
        v21 = *(_QWORD *)v17;
        sub_1DE1FFB64(v21, v18);
        *(_QWORD *)v16 = v21;
        *((_QWORD *)v16 + 1) = v18;
      }
    }
    else
    {
      v19 = *a2;
      v20 = a2[1];
      sub_1DE1FFB64(*a2, v20);
      *a1 = v19;
      a1[1] = v20;
    }
    swift_storeEnumTagMultiPayload();
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
  }
  v22 = *(int *)(a3 + 20);
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  v25 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
  return a1;
}

uint64_t *assignWithCopy for Ckcode_Proto2ProtectedEnvelope(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  char *v15;
  _OWORD *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  char *v25;
  _OWORD *v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;

  v6 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  v7 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a1, 1, v6);
  v8 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v6);
  if (v7)
  {
    if (!v8)
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v9 = type metadata accessor for UnknownStorage();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
        v10 = type metadata accessor for Ckcode_Proto2Any(0);
        v11 = *(int *)(v10 + 20);
        v12 = (uint64_t *)((char *)a1 + v11);
        v13 = (uint64_t *)((char *)a2 + v11);
        *v12 = *v13;
        v12[1] = v13[1];
        v14 = *(int *)(v10 + 24);
        v15 = (char *)a1 + v14;
        v16 = (_OWORD *)((char *)a2 + v14);
        v17 = *(uint64_t *)((char *)a2 + v14 + 8);
        swift_bridgeObjectRetain();
        if (v17 >> 60 == 15)
        {
          *(_OWORD *)v15 = *v16;
        }
        else
        {
          v30 = *(_QWORD *)v16;
          sub_1DE1FFB64(v30, v17);
          *(_QWORD *)v15 = v30;
          *((_QWORD *)v15 + 1) = v17;
        }
      }
      else
      {
        v28 = *a2;
        v29 = a2[1];
        sub_1DE1FFB64(*a2, v29);
        *a1 = v28;
        a1[1] = v29;
      }
      swift_storeEnumTagMultiPayload();
      _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
      goto LABEL_19;
    }
LABEL_8:
    v18 = sub_1DE1FFE88(&qword_1F04386A8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_19;
  }
  if (v8)
  {
    sub_1DE2005D4((uint64_t)a1, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    goto LABEL_8;
  }
  if (a1 != a2)
  {
    sub_1DE2005D4((uint64_t)a1, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = type metadata accessor for UnknownStorage();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(a1, a2, v19);
      v20 = type metadata accessor for Ckcode_Proto2Any(0);
      v21 = *(int *)(v20 + 20);
      v22 = (uint64_t *)((char *)a1 + v21);
      v23 = (uint64_t *)((char *)a2 + v21);
      *v22 = *v23;
      v22[1] = v23[1];
      v24 = *(int *)(v20 + 24);
      v25 = (char *)a1 + v24;
      v26 = (_OWORD *)((char *)a2 + v24);
      v27 = *(uint64_t *)((char *)a2 + v24 + 8);
      swift_bridgeObjectRetain();
      if (v27 >> 60 == 15)
      {
        *(_OWORD *)v25 = *v26;
      }
      else
      {
        v33 = *(_QWORD *)v26;
        sub_1DE1FFB64(v33, v27);
        *(_QWORD *)v25 = v33;
        *((_QWORD *)v25 + 1) = v27;
      }
    }
    else
    {
      v31 = *a2;
      v32 = a2[1];
      sub_1DE1FFB64(*a2, v32);
      *a1 = v31;
      a1[1] = v32;
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_19:
  v34 = *(int *)(a3 + 20);
  v35 = (char *)a1 + v34;
  v36 = (char *)a2 + v34;
  v37 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v37 - 8) + 24))(v35, v36, v37);
  return a1;
}

char *initializeWithTake for Ckcode_Proto2ProtectedEnvelope(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v6 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v6))
  {
    v7 = sub_1DE1FFE88(&qword_1F04386A8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v8 = type metadata accessor for UnknownStorage();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      v9 = type metadata accessor for Ckcode_Proto2Any(0);
      *(_OWORD *)&a1[*(int *)(v9 + 20)] = *(_OWORD *)&a2[*(int *)(v9 + 20)];
      *(_OWORD *)&a1[*(int *)(v9 + 24)] = *(_OWORD *)&a2[*(int *)(v9 + 24)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
  }
  v10 = *(int *)(a3 + 20);
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

char *assignWithTake for Ckcode_Proto2ProtectedEnvelope(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v6 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  v7 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a1, 1, v6);
  v8 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v6);
  if (!v7)
  {
    if (!v8)
    {
      if (a1 == a2)
        goto LABEL_14;
      sub_1DE2005D4((uint64_t)a1, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v12 = type metadata accessor for UnknownStorage();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(a1, a2, v12);
        v13 = type metadata accessor for Ckcode_Proto2Any(0);
        *(_OWORD *)&a1[*(int *)(v13 + 20)] = *(_OWORD *)&a2[*(int *)(v13 + 20)];
        *(_OWORD *)&a1[*(int *)(v13 + 24)] = *(_OWORD *)&a2[*(int *)(v13 + 24)];
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v11 = *(_QWORD *)(v6 - 8);
      goto LABEL_8;
    }
    sub_1DE2005D4((uint64_t)a1, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
LABEL_7:
    v11 = *(_QWORD *)(sub_1DE1FFE88(&qword_1F04386A8) - 8);
LABEL_8:
    memcpy(a1, a2, *(_QWORD *)(v11 + 64));
    goto LABEL_14;
  }
  if (v8)
    goto LABEL_7;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
    v10 = type metadata accessor for Ckcode_Proto2Any(0);
    *(_OWORD *)&a1[*(int *)(v10 + 20)] = *(_OWORD *)&a2[*(int *)(v10 + 20)];
    *(_OWORD *)&a1[*(int *)(v10 + 24)] = *(_OWORD *)&a2[*(int *)(v10 + 24)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
LABEL_14:
  v14 = *(int *)(a3 + 20);
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 40))(v15, v16, v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for Ckcode_Proto2ProtectedEnvelope()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DE203730(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1DE1FFE88(&qword_1F04386A8);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    v7 = sub_1DE2041F4();
    v8 = a1 + *(int *)(a3 + 20);
  }
  return sub_1DE204250(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for Ckcode_Proto2ProtectedEnvelope()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DE20379C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1DE20442C();
  v4 = sub_1DE1FFE88(&qword_1F04386A8);
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == v3)
  {
    v5 = v4;
    v6 = v1;
  }
  else
  {
    v5 = sub_1DE2041F4();
    v6 = v1 + *(int *)(v2 + 20);
  }
  return sub_1DE2041C4(v6, v0, v0, v5);
}

void sub_1DE2037F8()
{
  unint64_t v0;
  unint64_t v1;

  sub_1DE20387C();
  if (v0 <= 0x3F)
  {
    type metadata accessor for UnknownStorage();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_1DE20387C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F0438728)
  {
    type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(255);
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F0438728);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _OWORD *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

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
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = type metadata accessor for UnknownStorage();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      v7 = type metadata accessor for Ckcode_Proto2Any(0);
      v8 = *(int *)(v7 + 20);
      v9 = (uint64_t *)((char *)a1 + v8);
      v10 = (uint64_t *)((char *)a2 + v8);
      v12 = *v10;
      v11 = v10[1];
      *v9 = v12;
      v9[1] = v11;
      v13 = *(int *)(v7 + 24);
      v14 = (char *)a1 + v13;
      v15 = (_OWORD *)((char *)a2 + v13);
      v16 = *(uint64_t *)((char *)a2 + v13 + 8);
      swift_bridgeObjectRetain();
      if (v16 >> 60 == 15)
      {
        *(_OWORD *)v14 = *v15;
      }
      else
      {
        v20 = *(_QWORD *)v15;
        sub_1DE1FFB64(v20, v16);
        *(_QWORD *)v14 = v20;
        *((_QWORD *)v14 + 1) = v16;
      }
    }
    else
    {
      v19 = *a2;
      v18 = a2[1];
      sub_1DE1FFB64(v19, v18);
      *a1 = v19;
      a1[1] = v18;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;

  if (swift_getEnumCaseMultiPayload() != 1)
  {
    v5 = a1[1];
    return sub_1DE1FFC54(*a1, v5);
  }
  v2 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  v3 = type metadata accessor for Ckcode_Proto2Any(0);
  result = swift_bridgeObjectRelease();
  a1 = (uint64_t *)((char *)a1 + *(int *)(v3 + 24));
  v5 = a1[1];
  if (v5 >> 60 != 15)
    return sub_1DE1FFC54(*a1, v5);
  return result;
}

uint64_t *initializeWithCopy for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _OWORD *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = type metadata accessor for UnknownStorage();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    v5 = type metadata accessor for Ckcode_Proto2Any(0);
    v6 = *(int *)(v5 + 20);
    v7 = (uint64_t *)((char *)a1 + v6);
    v8 = (uint64_t *)((char *)a2 + v6);
    v10 = *v8;
    v9 = v8[1];
    *v7 = v10;
    v7[1] = v9;
    v11 = *(int *)(v5 + 24);
    v12 = (char *)a1 + v11;
    v13 = (_OWORD *)((char *)a2 + v11);
    v14 = *(uint64_t *)((char *)a2 + v11 + 8);
    swift_bridgeObjectRetain();
    if (v14 >> 60 == 15)
    {
      *(_OWORD *)v12 = *v13;
    }
    else
    {
      v17 = *(_QWORD *)v13;
      sub_1DE1FFB64(v17, v14);
      *(_QWORD *)v12 = v17;
      *((_QWORD *)v12 + 1) = v14;
    }
  }
  else
  {
    v16 = *a2;
    v15 = a2[1];
    sub_1DE1FFB64(v16, v15);
    *a1 = v16;
    a1[1] = v15;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t *assignWithCopy for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  _OWORD *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a1 != a2)
  {
    sub_1DE2005D4((uint64_t)a1, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = type metadata accessor for UnknownStorage();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
      v5 = type metadata accessor for Ckcode_Proto2Any(0);
      v6 = *(int *)(v5 + 20);
      v7 = (uint64_t *)((char *)a1 + v6);
      v8 = (uint64_t *)((char *)a2 + v6);
      *v7 = *v8;
      v7[1] = v8[1];
      v9 = *(int *)(v5 + 24);
      v10 = (char *)a1 + v9;
      v11 = (_OWORD *)((char *)a2 + v9);
      v12 = *(uint64_t *)((char *)a2 + v9 + 8);
      swift_bridgeObjectRetain();
      if (v12 >> 60 == 15)
      {
        *(_OWORD *)v10 = *v11;
      }
      else
      {
        v15 = *(_QWORD *)v11;
        sub_1DE1FFB64(v15, v12);
        *(_QWORD *)v10 = v15;
        *((_QWORD *)v10 + 1) = v12;
      }
    }
    else
    {
      v14 = *a2;
      v13 = a2[1];
      sub_1DE1FFB64(v14, v13);
      *a1 = v14;
      a1[1] = v13;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    v7 = type metadata accessor for Ckcode_Proto2Any(0);
    *(_OWORD *)&a1[*(int *)(v7 + 20)] = *(_OWORD *)&a2[*(int *)(v7 + 20)];
    *(_OWORD *)&a1[*(int *)(v7 + 24)] = *(_OWORD *)&a2[*(int *)(v7 + 24)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_1DE2005D4((uint64_t)a1, type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = type metadata accessor for UnknownStorage();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      v7 = type metadata accessor for Ckcode_Proto2Any(0);
      *(_OWORD *)&a1[*(int *)(v7 + 20)] = *(_OWORD *)&a2[*(int *)(v7 + 20)];
      *(_OWORD *)&a1[*(int *)(v7 + 24)] = *(_OWORD *)&a2[*(int *)(v7 + 24)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1DE203E14()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1DE203E24()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Ckcode_Proto2Any(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void type metadata accessor for Scope(uint64_t a1)
{
  sub_1DE20406C(a1, &qword_1F0438740);
}

void sub_1DE203EA8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = sub_1DE1FFE88(a2);
  sub_1DE2042B8(v2);
  sub_1DE20425C();
}

void sub_1DE203ED0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_1DE1FFE88(a3);
  sub_1DE204238(v3);
  sub_1DE20425C();
}

uint64_t *sub_1DE203EFC(uint64_t a1, uint64_t *a2)
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

void type metadata accessor for CKError(uint64_t a1)
{
  sub_1DE20406C(a1, &qword_1F0438770);
}

void sub_1DE203F50()
{
  sub_1DE2025EC(&qword_1F0438778, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1DE226964);
}

void sub_1DE203F7C()
{
  sub_1DE2025EC(&qword_1F0438780, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1DE226990);
}

void sub_1DE203FA8()
{
  sub_1DE2025EC(&qword_1F0438788, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1DE226A4C);
}

void sub_1DE203FD4()
{
  sub_1DE2025EC(&qword_1F0438790, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1DE226A18);
}

void sub_1DE204000()
{
  sub_1DE2025EC(&qword_1F0438798, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1DE2269D4);
}

void sub_1DE20402C()
{
  sub_1DE2025EC(&qword_1F04387A0, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1DE226B38);
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_1DE20406C(a1, &qword_1F04387C0);
}

void sub_1DE20406C(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
  sub_1DE20425C();
}

void sub_1DE2040AC()
{
  sub_1DE2025EC(&qword_1F04387A8, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1DE226AFC);
}

unint64_t sub_1DE2040DC()
{
  unint64_t result;

  result = qword_1F04387B0;
  if (!qword_1F04387B0)
  {
    result = MEMORY[0x1DF0EA5C0](MEMORY[0x1E0DEB470], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&qword_1F04387B0);
  }
  return result;
}

void sub_1DE204118()
{
  sub_1DE2025EC(&qword_1F04387B8, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1DE226B74);
}

void sub_1DE204144()
{
  sub_1DE2025EC((unint64_t *)&unk_1F0438CA0, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1DE226A90);
}

BOOL sub_1DE204170(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1DE20417C(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_1DE2041BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_1DE2041C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(a1, a2, a3, a4);
}

uint64_t sub_1DE2041F4()
{
  return type metadata accessor for UnknownStorage();
}

uint64_t sub_1DE2041FC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1DE204208()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1DE204224()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1DE204238(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t sub_1DE204250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(a1, a2, a3);
}

uint64_t sub_1DE204264()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  *v0 = v2;
  v0[1] = v1;
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1DE204278()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;

  sub_1DE1FFB50(v0, v1);
  sub_1DE1FFB50(v2, v3);
  return v0;
}

uint64_t sub_1DE2042A4()
{
  uint64_t v0;
  uint64_t v1;

  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v1, 0, 1, v0);
}

uint64_t sub_1DE2042B8(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t sub_1DE2042CC()
{
  uint64_t v0;
  uint64_t v1;

  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v1, 0, 1, v0);
}

uint64_t sub_1DE2042E0(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_1DE20433C(uint64_t a1)
{
  uint64_t *v1;

  sub_1DE203EA8(a1, v1);
}

void sub_1DE204344(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1DE203EA8(v2, a2);
}

uint64_t sub_1DE20434C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 16) = v1;
  return type metadata accessor for Ckcode_Proto2Any(0);
}

uint64_t sub_1DE20435C()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_1DE20436C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1DE203EA8(v2, a2);
}

uint64_t sub_1DE204374(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t sub_1DE204384()
{
  return type metadata accessor for Ckcode_Proto2Any(0);
}

void sub_1DE204394(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1DE203ED0(a1, a2, v2);
}

uint64_t sub_1DE20439C()
{
  return swift_getEnumCaseMultiPayload();
}

void sub_1DE2043A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;

  sub_1DE203ED0(v1, v0, v2);
}

uint64_t sub_1DE2043B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(a1, a2, a3);
}

uint64_t sub_1DE2043C8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1DE2043E0()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1DE1FFC40(v0, v1);
}

uint64_t sub_1DE2043EC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1DE204400()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_1DE20440C()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1DE1FFC54(v0, v1);
}

uint64_t sub_1DE204418()
{
  uint64_t v0;

  return v0;
}

void *sub_1DE204440(uint64_t a1)
{
  return malloc(*(_QWORD *)(*(_QWORD *)(a1 - 8) + 64));
}

void sub_1DE204458(uint64_t a1)
{
  uint64_t *v1;

  sub_1DE203EA8(a1, v1);
}

uint64_t sub_1DE204460@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

uint64_t sub_1DE204474(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)(v1 + *(int *)(result + 20));
  *v2 = 0;
  v2[1] = 0;
  return result;
}

uint64_t sub_1DE204488()
{
  return type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
}

uint64_t sub_1DE204490()
{
  return type metadata accessor for Ckcode_Proto2Any(0);
}

uint64_t sub_1DE204498(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return Invocable.invoke<A>(function:request:completion:)(a1, a2, a3, a4, a5, a8, a6, a9, a7);
}

uint64_t Invocable.invoke<A>(function:request:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t);
  uint64_t v18;
  unint64_t v19;

  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a4;
  *(_QWORD *)(v16 + 24) = a5;
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a8 + 8);
  v18 = type metadata accessor for Google_Protobuf_Empty();
  v19 = sub_1DE2045D4();
  swift_retain();
  v17(a1, a2, a3, sub_1DE2045B0, v16, a7, v18, a9, v19, a6, a8);
  return swift_release();
}

uint64_t sub_1DE20458C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DE2045B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 16))(a2);
}

unint64_t sub_1DE2045D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F04387C8;
  if (!qword_1F04387C8)
  {
    v1 = type metadata accessor for Google_Protobuf_Empty();
    result = MEMORY[0x1DF0EA5C0](MEMORY[0x1E0D3E848], v1);
    atomic_store(result, (unint64_t *)&qword_1F04387C8);
  }
  return result;
}

uint64_t dispatch thunk of Invocable.invoke<A, B>(function:request:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return (*(uint64_t (**)(void))(a11 + 8))();
}

uint64_t dispatch thunk of Invocable.invoke<A>(function:request:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(void))(a9 + 16))();
}

void CKDeclineSharesOperation.perShareResultBlock.getter()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v1 = objc_msgSend(v0, sel_perShareCompletionBlock);
  if (v1)
  {
    v2 = v1;
    v3 = sub_1DE205168();
    *(_QWORD *)(v3 + 16) = v2;
    v4 = sub_1DE20513C();
    *(_QWORD *)(v4 + 16) = sub_1DE204910;
    *(_QWORD *)(v4 + 24) = v3;
  }
  sub_1DE20425C();
}

void sub_1DE2046B0(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD *, uint64_t);

  CKDeclineSharesOperation.perShareResultBlock.getter();
  if (v2)
  {
    v4 = v2;
    v5 = v3;
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 16) = v4;
    *(_QWORD *)(v2 + 24) = v5;
    v6 = sub_1DE2050BC;
  }
  else
  {
    v6 = 0;
  }
  *a1 = v6;
  a1[1] = v2;
}

void sub_1DE204714(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, char);

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_1DE2050B0;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_1DE204B48(v1);
  CKDeclineSharesOperation.perShareResultBlock.setter((uint64_t)v4, v3);
}

uint64_t sub_1DE204794(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(uint64_t *, uint64_t *))
{
  uint64_t v5;
  char v6;
  uint64_t v7;

  v7 = a1;
  v5 = a2;
  v6 = a3 & 1;
  return a4(&v7, &v5);
}

void CKDeclineSharesOperation.perShareResultBlock.setter(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1)
  {
    v5 = sub_1DE20513C();
    *(_QWORD *)(v5 + 16) = a1;
    *(_QWORD *)(v5 + 24) = a2;
    v6 = sub_1DE205174((uint64_t)sub_1DE204A60, MEMORY[0x1E0C809B0], 1107296256, v8, v9);
    swift_retain();
    v7 = swift_release();
    sub_1DE205180(v7, sel_setPerShareCompletionBlock_);
    _Block_release(v6);
    sub_1DE20515C();
    sub_1DE205148();
  }
  else
  {
    sub_1DE205128(v2, sel_setPerShareCompletionBlock_);
  }
}

void sub_1DE204894(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = _convertErrorToNSError(_:)();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_1DE2048EC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1DE204910(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1DE204894(a1, a2, *(_QWORD *)(v2 + 16));
}

void sub_1DE204918(uint64_t a1, id a2, char a3, void (*a4)(uint64_t, id))
{
  id v7;

  if ((a3 & 1) != 0)
  {
    v7 = a2;
    a4(a1, a2);
    sub_1DE2050EC(a2, 1);
  }
  else
  {
    a4(a1, 0);
  }
}

void sub_1DE204984(uint64_t a1, void *a2, char a3)
{
  uint64_t v3;

  sub_1DE204918(a1, a2, a3 & 1, *(void (**)(uint64_t, id))(v3 + 16));
}

void sub_1DE204990(uint64_t a1, void *a2, void (*a3)(uint64_t, void *, uint64_t))
{
  id v6;
  id v7;

  if (!a2)
    goto LABEL_4;
  swift_getErrorValue();
  v6 = a2;
  if ((Error.ckIsPartialError.getter() & 1) != 0)
  {

LABEL_4:
    a3(a1, 0, 0);
    return;
  }
  v7 = a2;
  a3(a1, a2, 1);

}

void sub_1DE204A58(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_1DE204990(a1, a2, *(void (**)(uint64_t, void *, uint64_t))(v2 + 16));
}

void sub_1DE204A60(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(id, void *);
  id v6;
  id v7;

  v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(v7, a3);
  swift_release();

}

uint64_t sub_1DE204AD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1DE204AE4()
{
  return swift_release();
}

uint64_t sub_1DE204AEC(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

void CKDeclineSharesOperation.perShareResultBlock.modify(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  a1[2] = v1;
  CKDeclineSharesOperation.perShareResultBlock.getter();
  *a1 = v3;
  a1[1] = v4;
  sub_1DE20425C();
}

uint64_t sub_1DE204B2C(_QWORD *a1, char a2)
{
  return sub_1DE204FCC(a1, a2, (uint64_t)CKDeclineSharesOperation.perShareResultBlock.setter, (void (*)(_QWORD, uint64_t))sub_1DE204B48, (uint64_t (*)(uint64_t, uint64_t))sub_1DE204AEC);
}

uint64_t sub_1DE204B48(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

void CKDeclineSharesOperation.declineSharesResultBlock.getter()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v1 = objc_msgSend(v0, sel_declineSharesCompletionBlock);
  if (v1)
  {
    v2 = v1;
    v3 = sub_1DE205168();
    *(_QWORD *)(v3 + 16) = v2;
    v4 = sub_1DE20513C();
    *(_QWORD *)(v4 + 16) = sub_1DE204DE0;
    *(_QWORD *)(v4 + 24) = v3;
  }
  sub_1DE20425C();
}

void sub_1DE204BCC(uint64_t (**a1)(uint64_t a1)@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);

  CKDeclineSharesOperation.declineSharesResultBlock.getter();
  if (v2)
  {
    v4 = v2;
    v5 = v3;
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 16) = v4;
    *(_QWORD *)(v2 + 24) = v5;
    v6 = sub_1DE205084;
  }
  else
  {
    v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)(uint64_t))v2;
}

void sub_1DE204C30(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, char);

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_1DE20504C;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_1DE204B48(v1);
  CKDeclineSharesOperation.declineSharesResultBlock.setter((uint64_t)v4, v3);
}

void CKDeclineSharesOperation.declineSharesResultBlock.setter(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = v2;
  if (a1)
  {
    v6 = sub_1DE20513C();
    *(_QWORD *)(v6 + 16) = a1;
    *(_QWORD *)(v6 + 24) = a2;
    v7 = sub_1DE205174((uint64_t)sub_1DE204F2C, MEMORY[0x1E0C809B0], 1107296256, v9, v10);
    sub_1DE204B48(a1);
    swift_retain();
    v8 = swift_release();
    sub_1DE205180(v8, sel_setDeclineSharesCompletionBlock_);
    _Block_release(v7);
    objc_msgSend(v3, sel_setCanDropItemResultsEarly_, 1);
    sub_1DE20515C();
    sub_1DE20515C();
    sub_1DE205148();
  }
  else
  {
    sub_1DE205128(v2, sel_setDeclineSharesCompletionBlock_);
  }
}

void sub_1DE204D94(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = _convertErrorToNSError(_:)();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

void sub_1DE204DE0(uint64_t a1)
{
  uint64_t v1;

  sub_1DE204D94(a1, *(_QWORD *)(v1 + 16));
}

void sub_1DE204DE8(void *a1, char a2, void (*a3)(void *))
{
  id v5;

  if ((a2 & 1) != 0)
  {
    v5 = a1;
    a3(a1);
    sub_1DE2050EC(a1, 1);
  }
  else
  {
    a3(0);
  }
}

uint64_t sub_1DE204E44()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1DE204E68(void *a1, char a2)
{
  uint64_t v2;

  sub_1DE204DE8(a1, a2 & 1, *(void (**)(void *))(v2 + 16));
}

void sub_1DE204E74(void *a1, void (*a2)(void *, uint64_t))
{
  id v4;
  id v5;

  if (!a1)
    goto LABEL_4;
  swift_getErrorValue();
  v4 = a1;
  if ((Error.ckIsPartialError.getter() & 1) != 0)
  {

LABEL_4:
    a2(0, 0);
    return;
  }
  v5 = a1;
  a2(a1, 1);

}

void sub_1DE204F24(void *a1)
{
  uint64_t v1;

  sub_1DE204E74(a1, *(void (**)(void *, uint64_t))(v1 + 16));
}

void sub_1DE204F2C(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void CKDeclineSharesOperation.declineSharesResultBlock.modify(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  a1[2] = v1;
  CKDeclineSharesOperation.declineSharesResultBlock.getter();
  *a1 = v3;
  a1[1] = v4;
  sub_1DE20425C();
}

uint64_t sub_1DE204FB0(_QWORD *a1, char a2)
{
  return sub_1DE204FCC(a1, a2, (uint64_t)CKDeclineSharesOperation.declineSharesResultBlock.setter, (void (*)(_QWORD, uint64_t))sub_1DE2050F8, (uint64_t (*)(uint64_t, uint64_t))sub_1DE2050FC);
}

uint64_t sub_1DE204FCC(_QWORD *a1, char a2, uint64_t a3, void (*a4)(_QWORD, uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;

  v5 = *a1;
  v6 = a1[1];
  if ((a2 & 1) == 0)
    return sub_1DE20518C();
  a4(*a1, v6);
  sub_1DE20518C();
  return a5(v5, v6);
}

uint64_t sub_1DE20504C(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *);
  uint64_t v5;
  char v6;

  v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  v5 = a1;
  v6 = a2 & 1;
  return v3(&v5);
}

uint64_t sub_1DE205084(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_1DE2050B0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  return sub_1DE204794(a1, a2, a3 & 1, *(uint64_t (**)(uint64_t *, uint64_t *))(v3 + 16));
}

uint64_t sub_1DE2050BC(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v2 + 16))(*a1, *(_QWORD *)a2, *(unsigned __int8 *)(a2 + 8));
}

void sub_1DE2050EC(id a1, char a2)
{
  if ((a2 & 1) != 0)

}

id sub_1DE205128(id a1, SEL a2)
{
  return objc_msgSend(a1, a2);
}

uint64_t sub_1DE20513C()
{
  return swift_allocObject();
}

uint64_t sub_1DE20515C()
{
  uint64_t v0;

  return sub_1DE204AEC(v0);
}

uint64_t sub_1DE205168()
{
  return swift_allocObject();
}

void *sub_1DE205174@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  a4 = a1;
  a5 = v5;
  return _Block_copy(&a2);
}

id sub_1DE205180(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_1DE20518C()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

void Ckcode_RecordTransport.init(_:)(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  Class isa;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[6];

  *(_OWORD *)a2 = xmmword_1DE226BD0;
  v4 = type metadata accessor for Ckcode_RecordTransport();
  UnknownStorage.init()();
  *(_OWORD *)((char *)a2 + *(int *)(v4 + 24)) = xmmword_1DE226500;
  v5 = objc_msgSend(a1, sel_valueStore);
  sub_1DE1FFE88(&qword_1F04387D0);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1DE226BE0;
  *(_QWORD *)(v6 + 32) = sub_1DE205400();
  sub_1DE1FFE88(&qword_1F04387E0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v18[4] = sub_1DE2054BC;
  v18[5] = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 1107296256;
  v18[2] = sub_1DE2054C0;
  v18[3] = &unk_1EA8C90F0;
  v8 = _Block_copy(v18);
  swift_release();
  v9 = objc_msgSend(v5, sel_containsValueOfClasses_options_passingTest_, isa, 1, v8);

  _Block_release(v8);
  if ((swift_isEscapingClosureAtFileLocation() & 1) != 0)
  {
    __break(1u);
  }
  else if ((v9 & 1) != 0)
  {
    v10 = (void *)*MEMORY[0x1E0C99778];
    v11 = objc_allocWithZone(MEMORY[0x1E0C99DA0]);
    v12 = sub_1DE205678(v10, 0xD000000000000045, 0x80000001DE22A8A0, 0);
    objc_msgSend(v12, sel_raise);

  }
  else
  {
    v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB36F8]), sel_initRequiringSecureCoding_, 1);
    objc_msgSend(a1, sel_encodeWithCoder_, v13);
    v14 = objc_msgSend(v13, sel_encodedData);
    v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v17 = v16;

    sub_1DE205560(*a2, a2[1]);
    *a2 = v15;
    a2[1] = v17;
  }
}

unint64_t sub_1DE205400()
{
  unint64_t result;

  result = qword_1F04387D8;
  if (!qword_1F04387D8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F04387D8);
  }
  return result;
}

id sub_1DE20543C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3;
  id v5;
  _BYTE v6[32];

  sub_1DE20587C(a3, (uint64_t)v6);
  sub_1DE205400();
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  v3 = objc_msgSend(v5, sel_shouldReadAssetContentUsingClientProxy);

  return v3;
}

uint64_t sub_1DE2054C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v4)(uint64_t, uint64_t, _QWORD *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[4];

  v4 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD *))(a1 + 32);
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;
  v9[3] = swift_getObjectType();
  v9[0] = a3;
  swift_unknownObjectRetain();
  LOBYTE(a3) = v4(v5, v7, v9);
  swift_bridgeObjectRelease();
  sub_1DE20585C((uint64_t)v9);
  return a3 & 1;
}

uint64_t sub_1DE205548(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1DE205558()
{
  return swift_release();
}

uint64_t sub_1DE205560(uint64_t a1, uint64_t a2)
{
  if ((~a2 & 0x3000000000000000) != 0)
    return sub_1DE205574(a1, a2);
  return a1;
}

uint64_t sub_1DE205574(uint64_t a1, uint64_t a2)
{
  return sub_1DE1FFC54(a1, a2 & 0xDFFFFFFFFFFFFFFFLL);
}

id CKRecord.init(_:)(uint64_t *a1)
{
  unint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  void *v8;
  id v9;

  v2 = a1[1];
  if ((~v2 & 0x3000000000000000) == 0 || (v2 & 0x2000000000000000) != 0)
    goto LABEL_4;
  v3 = *a1;
  v4 = objc_allocWithZone(MEMORY[0x1E0CB3710]);
  sub_1DE205854(v3, v2);
  sub_1DE205854(v3, v2);
  v5 = sub_1DE205778(v3, v2);
  v8 = v5;
  if (!v5)
  {
    sub_1DE2058B8();
LABEL_4:
    sub_1DE20573C((uint64_t)a1);
    return 0;
  }
  v9 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, v5);

  v6 = v9;
  sub_1DE2058B8();
  sub_1DE20573C((uint64_t)a1);
  if (v6)

  return v6;
}

id sub_1DE205678(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v7;
  NSDictionary v8;
  id v9;

  if (!a3)
  {
    v7 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v8.super.isa = 0;
    goto LABEL_6;
  }
  v7 = (void *)MEMORY[0x1DF0E9E7C](a2, a3);
  swift_bridgeObjectRelease();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v8.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
LABEL_6:
  v9 = objc_msgSend(v4, sel_initWithName_reason_userInfo_, a1, v7, v8.super.isa);

  return v9;
}

uint64_t sub_1DE20573C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Ckcode_RecordTransport();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_1DE205778(uint64_t a1, unint64_t a2)
{
  void *v2;
  void *v3;
  Class isa;
  id v7;
  id v8;
  id v9;
  id v11[2];

  v3 = v2;
  v11[1] = *(id *)MEMORY[0x1E0C80C00];
  isa = Data._bridgeToObjectiveC()().super.isa;
  v11[0] = 0;
  v7 = objc_msgSend(v3, sel_initForReadingFromData_error_, isa, v11);

  if (v7)
  {
    v8 = v11[0];
  }
  else
  {
    v9 = v11[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  sub_1DE1FFC54(a1, a2);
  return v7;
}

uint64_t sub_1DE205854(uint64_t a1, uint64_t a2)
{
  return sub_1DE1FFB64(a1, a2 & 0xDFFFFFFFFFFFFFFFLL);
}

uint64_t sub_1DE20585C(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1DE20587C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1DE2058B8()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1DE205560(v1, v0);
}

void CKContainer.decline(_:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v7;
  id v8;

  v7 = sub_1DE2061CC(a1, sel_implementation);
  v8 = sub_1DE2061CC((uint64_t)v7, sel_convenienceConfiguration);
  sub_1DE205954(a1, v3, (uint64_t)v8, a2, a3);

}

uint64_t sub_1DE205954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  id v11;
  uint64_t v12;
  _QWORD *v13;

  v6 = v5;
  sub_1DE20617C(0, &qword_1F0438808);
  swift_bridgeObjectRetain();
  v11 = sub_1DE205D3C();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = MEMORY[0x1E0DEE9E0];
  swift_retain();
  CKDeclineSharesOperation.perShareResultBlock.setter((uint64_t)sub_1DE20611C, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v12;
  v13[3] = a4;
  v13[4] = a5;
  swift_retain();
  swift_retain();
  CKDeclineSharesOperation.declineSharesResultBlock.setter((uint64_t)sub_1DE206154, (uint64_t)v13);
  objc_msgSend(v6, sel__scheduleConvenienceOperation_wrappingContainer_convenienceConfiguration_, v11, a2, a3);

  return swift_release();
}

uint64_t CKContainer.decline(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return sub_1DE2061C0();
}

uint64_t sub_1DE205A78(uint64_t a1)
{
  uint64_t *v1;
  id v2;
  id v3;
  _QWORD *v4;

  v2 = sub_1DE2061CC(a1, sel_implementation);
  v1[4] = (uint64_t)v2;
  v3 = sub_1DE2061CC((uint64_t)v2, sel_convenienceConfiguration);
  v1[5] = (uint64_t)v3;
  v4 = (_QWORD *)swift_task_alloc();
  v1[6] = (uint64_t)v4;
  *v4 = v1;
  v4[1] = sub_1DE205B08;
  return sub_1DE205BC8(v1[2], v1[3], (uint64_t)v3);
}

uint64_t sub_1DE205B08(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  void *v6;

  v4 = *v2;
  *(_QWORD *)(v4 + 56) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  v6 = *(void **)(v4 + 32);

  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_1DE205B98()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 32);

  return sub_1DE2061B4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1DE205BC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return sub_1DE2061C0();
}

uint64_t sub_1DE205BDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  v4 = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v4;
  *(_QWORD *)(v3 + 40) = v2;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v5;
  sub_1DE1FFE88(&qword_1F04387F8);
  *v5 = v0;
  v5[1] = sub_1DE205C98;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

uint64_t sub_1DE205C98()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DE205D04()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1DE205D10()
{
  uint64_t v0;

  swift_task_dealloc();
  return sub_1DE2061B4(*(uint64_t (**)(void))(v0 + 8));
}

id sub_1DE205D3C()
{
  id v0;
  Class isa;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_1DE20617C(0, &qword_1F0438810);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithShareMetadatas_, isa);

  return v2;
}

void sub_1DE205DC0(void *a1, void *a2, char a3)
{
  id v6;

  swift_beginAccess();
  v6 = a1;
  a3 &= 1u;
  sub_1DE206170(a2, a3);
  sub_1DE220E0C((uint64_t)a2, a3, v6);
  swift_endAccess();

}

void sub_1DE205E44(void *a1, char a2, uint64_t a3, void (*a4)(void *, uint64_t))
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = a2 & 1;
  if ((a2 & 1) != 0)
  {
    v6 = a1;
    v7 = a1;
  }
  else
  {
    swift_beginAccess();
    v6 = *(void **)(a3 + 16);
    swift_bridgeObjectRetain();
  }
  a4(v6, v5);
  sub_1DE206164(v6, v5);
}

uint64_t sub_1DE205ECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v9 = sub_1DE1FFE88(&qword_1F0438800);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x1E0C80A78](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  sub_1DE205954(a3, a4, a5, (uint64_t)sub_1DE2060A8, v13);
  return swift_release();
}

uint64_t sub_1DE205FCC(uint64_t a1)
{
  uint64_t *v1;

  return sub_1DE205ECC(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1DE205FD8(void *a1, char a2)
{
  id v3;

  if ((a2 & 1) != 0)
  {
    v3 = a1;
    sub_1DE1FFE88(&qword_1F0438800);
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1DE1FFE88(&qword_1F0438800);
    return CheckedContinuation.resume(returning:)();
  }
}

uint64_t sub_1DE206044()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1DE1FFE88(&qword_1F0438800);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1DE2060A8(void *a1, char a2)
{
  char v3;

  v3 = a2 & 1;
  sub_1DE1FFE88(&qword_1F0438800);
  return sub_1DE205FD8(a1, v3);
}

uint64_t sub_1DE2060F8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1DE20611C(void *a1, void *a2, char a3)
{
  sub_1DE205DC0(a1, a2, a3 & 1);
}

uint64_t sub_1DE206128()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1DE206154(void *a1, char a2)
{
  uint64_t v2;

  sub_1DE205E44(a1, a2 & 1, *(_QWORD *)(v2 + 16), *(void (**)(void *, uint64_t))(v2 + 24));
}

void sub_1DE206164(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

id sub_1DE206170(id result, char a2)
{
  if ((a2 & 1) != 0)
    return result;
  return result;
}

uint64_t sub_1DE20617C(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1DE2061B4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1DE2061C0()
{
  return swift_task_switch();
}

id sub_1DE2061CC(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_1DE2061D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
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
  void (*v20)(char *, uint64_t, uint64_t);
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
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

  v32 = a5;
  v34 = a4;
  v8 = type metadata accessor for Optional();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v32 - v11;
  v13 = MEMORY[0x1E0C80A78](v10);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](v13);
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v33 = v5;
  v20(v15, v5, a2);
  if (swift_dynamicCast())
  {
    sub_1DE20660C((uint64_t)v12, 0);
    v21 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
    v21(v18, v12, a3);
    sub_1DE2065A0(a3, a3);
    swift_allocObject();
    v22 = static Array._adoptStorage(_:count:)();
    v21(v23, v18, a3);
    type metadata accessor for Array();
  }
  else
  {
    sub_1DE20660C((uint64_t)v12, 1);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = static Array._allocateUninitialized(_:)();
    v25 = (_QWORD *)swift_allocObject();
    v25[2] = a2;
    v25[3] = a3;
    v26 = v32;
    v25[4] = v34;
    v25[5] = v26;
    v25[6] = v24;
    v35 = nullsub_1(sub_1DE206590);
    v36 = v27;
    v29 = type metadata accessor for ExtractingVisitor(0, a3, v26, v28);
    swift_retain();
    MEMORY[0x1DF0EA5C0](&unk_1DE226BF0, v29);
    v30 = v37;
    dispatch thunk of Message.traverse<A>(visitor:)();
    v22 = v36;
    swift_release();
    if (!v30)
    {
      swift_beginAccess();
      v22 = *(_QWORD *)(v24 + 16);
      swift_bridgeObjectRetain();
    }
    swift_release();
  }
  return v22;
}

uint64_t sub_1DE20649C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DE2064C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))((char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0), v4, v3);
  swift_beginAccess();
  type metadata accessor for Array();
  Array.append(_:)();
  return swift_endAccess();
}

uint64_t sub_1DE20656C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DE206590(uint64_t a1)
{
  return sub_1DE2064C0(a1);
}

uint64_t sub_1DE2065A0(uint64_t a1, uint64_t a2)
{
  if (sub_1DE2065E0(a2))
    return sub_1DE1FFE88(&qword_1F0438818);
  else
    return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t sub_1DE2065E0(uint64_t a1)
{
  if (swift_isClassType())
    return a1;
  else
    return 0;
}

uint64_t sub_1DE20660C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(a1, a2, 1, v2);
}

uint64_t sub_1DE206618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v21;
  _QWORD v22[3];
  uint64_t v23;
  void (*v24)(char *);
  uint64_t v25;

  v22[2] = a4;
  v22[0] = a2;
  v6 = *(_QWORD *)(a2 + 16);
  v7 = type metadata accessor for Optional();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)v22 - v10;
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v12);
  v17 = (char *)v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v22[1] = a1;
  v19(v14, a1, a3);
  if (swift_dynamicCast())
  {
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v11, 0, 1, v6);
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v11, v6);
    (*(void (**)(char *))v23)(v17);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v6);
  }
  else
  {
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v11, 1, 1, v6);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    v21 = *(_QWORD *)(v23 + 8);
    v24 = *(void (**)(char *))v23;
    v25 = v21;
    swift_retain();
    MEMORY[0x1DF0EA5C0](&unk_1DE226BF0, v22[0]);
    dispatch thunk of Message.traverse<A>(visitor:)();
    return swift_release();
  }
}

uint64_t sub_1DE2067F8()
{
  uint64_t v0;

  v0 = type metadata accessor for Array();
  MEMORY[0x1DF0EA5C0](MEMORY[0x1E0DEAF38], v0);
  return Sequence.forEach(_:)();
}

uint64_t sub_1DE206878(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;

  v9 = type metadata accessor for ExtractingVisitor(0, a3, a5, a4);
  return sub_1DE206618(a1, v9, a4, a6);
}

uint64_t sub_1DE2068E0()
{
  uint64_t v0;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v0 = type metadata accessor for Dictionary();
  MEMORY[0x1DF0EA5C0](MEMORY[0x1E0DEA0D0], v0);
  return Sequence.forEach(_:)();
}

uint64_t sub_1DE2069E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11;

  v11 = type metadata accessor for ExtractingVisitor(0, a4, a7, a4);
  return sub_1DE206618(a2, v11, a6, a9);
}

uint64_t sub_1DE206A48(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t TupleTypeMetadata2;

  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(a1, a1 + *(int *)(TupleTypeMetadata2 + 48));
}

uint64_t sub_1DE206ADC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_1DE206E0C();
  return sub_1DE206618(v0, v1, v2, v3);
}

uint64_t sub_1DE206AF4()
{
  sub_1DE206E0C();
  return sub_1DE2067F8();
}

uint64_t sub_1DE206B0C()
{
  sub_1DE206E0C();
  return sub_1DE2068E0();
}

void sub_1DE206B30()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_1DE206B88()
{
  return sub_1DE206ADC();
}

uint64_t sub_1DE206BAC()
{
  return sub_1DE206AF4();
}

uint64_t sub_1DE206BD0()
{
  return sub_1DE206B0C();
}

void sub_1DE206C00()
{
  sub_1DE206B30();
}

uint64_t sub_1DE206C0C()
{
  return Visitor.visitExtensionFieldsAsMessageSet(fields:start:end:)();
}

uint64_t sub_1DE206C20(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_1DE2069E0(a1, a2, v2[9], v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_1DE206C50(uint64_t a1)
{
  uint64_t v1;

  return sub_1DE206A48(a1, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 72));
}

uint64_t type metadata accessor for ExtractingVisitor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1DE206DDC(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ExtractingVisitor);
}

uint64_t sub_1DE206C90(uint64_t a1)
{
  uint64_t *v1;

  return sub_1DE206878(a1, v1[6], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1DE206CB0()
{
  return swift_allocateGenericValueMetadata();
}

_QWORD *sub_1DE206CB8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_1DE206CE4()
{
  return swift_release();
}

_QWORD *sub_1DE206CEC(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for RemoteMeasurement(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *sub_1DE206D30(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_1DE206D60(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 16))
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

uint64_t sub_1DE206DA0(uint64_t result, int a2, int a3)
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

uint64_t sub_1DE206DDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1DF0EA560](a1, v6, a5);
}

uint64_t sub_1DE206E1C()
{
  return -1;
}

uint64_t CKVersionedMergeable.deltaDeliveryRequirements.getter()
{
  return -1;
}

void CKMergeable.merge(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t);
  int v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  uint8_t *v34;
  id v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  unint64_t v49;
  void *v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  _QWORD *v55;
  unint64_t v56;
  id v57;
  id v58;
  id v59;
  NSObject *v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  id v75;
  uint64_t v76;
  id v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  id v81;
  _BYTE v82[4];
  int v83;
  _QWORD *v84;
  os_log_t v85;
  void *v86;
  id v87;
  _QWORD *v88;
  _QWORD *v89;
  uint8_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  _BYTE *v96;
  uint64_t v97;
  uint64_t v98;
  __int128 v99[2];
  uint64_t v100;
  id v101[3];
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;

  v5 = v3;
  v93 = a3;
  v104 = *MEMORY[0x1E0C80C00];
  v8 = type metadata accessor for Logger();
  v95 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = &v82[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = MEMORY[0x1E0C80A78](v9);
  v90 = &v82[-v13];
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = &v82[-v15];
  v17 = MEMORY[0x1E0C80A78](v14);
  v19 = &v82[-v18];
  v20 = MEMORY[0x1E0C80A78](v17);
  v22 = &v82[-v21];
  MEMORY[0x1E0C80A78](v20);
  sub_1DE2042FC();
  v25 = v24 - v23;
  v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16);
  v91 = v5;
  v27(v25, v5, a2);
  sub_1DE1FFE88(&qword_1F0438820);
  v92 = a2;
  v28 = swift_dynamicCast();
  v96 = v11;
  v97 = v8;
  if (v28)
  {
    v29 = v8;
    sub_1DE20885C(v99, (uint64_t)v101);
    CKLogDistributedSync.getter();
    v30 = a1;
    v31 = Logger.logObject.getter();
    v32 = static os_log_type_t.debug.getter();
    v33 = os_log_type_enabled(v31, v32);
    v94 = a1;
    if (v33)
    {
      v34 = (uint8_t *)sub_1DE208880();
      v89 = (_QWORD *)sub_1DE208880();
      v90 = v34;
      *(_DWORD *)v34 = 138412290;
      *(_QWORD *)&v99[0] = v30;
      v35 = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v89 = v30;

      sub_1DE2089AC(&dword_1DE1FE000, v31, v32, "Merging record value into versioned mergeable %@", v90);
      sub_1DE1FFE88(qword_1EDB81DB0);
      sub_1DE208930();
      sub_1DE208874();
    }

    (*(void (**)(_BYTE *, uint64_t))(v95 + 8))(v22, v29);
    v41 = v102;
    v42 = v103;
    v43 = (_QWORD *)sub_1DE208964();
    sub_1DE2084DC(v43, v44);
    v45 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v42 + 16))(v41, v42);
    v46 = v102;
    v47 = v103;
    sub_1DE2084DC(v101, v102);
    v48 = objc_msgSend(v30, sel_deliverableDeltasWithCurrentStateVector_usingDeliveryRequirements_, v45, (*(uint64_t (**)(uint64_t, uint64_t))(v47 + 24))(v46, v47));

    if (!v48)
    {
      v11 = v96;
      a1 = v94;
LABEL_34:
      sub_1DE20585C((uint64_t)v101);
      goto LABEL_37;
    }
    sub_1DE2084A0();
    v49 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = v96;
    a1 = v94;
    if (v49 >> 62)
    {
      if (_CocoaArrayWrapper.endIndex.getter())
        goto LABEL_9;
    }
    else if (*(_QWORD *)((v49 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_9:
      sub_1DE208980(*(uint64_t (**)(void))(v93 + 16));
      swift_bridgeObjectRelease();
      v98 = v4;
      if (v4)
      {

        sub_1DE20585C((uint64_t)v101);
        return;
      }
      objc_msgSend(v30, sel_didMergeDeltas_, v48);
      goto LABEL_33;
    }
    swift_bridgeObjectRelease();
LABEL_33:

    goto LABEL_34;
  }
  v89 = v16;
  v100 = 0;
  memset(v99, 0, sizeof(v99));
  sub_1DE208460((uint64_t)v99);
  CKLogDistributedSync.getter();
  v36 = a1;
  v37 = Logger.logObject.getter();
  v38 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)sub_1DE208880();
    v88 = (_QWORD *)sub_1DE208880();
    *(_DWORD *)v39 = 138412290;
    v94 = a1;
    v101[0] = v36;
    v40 = v36;
    sub_1DE208964();
    sub_1DE208944();
    *v88 = v36;

    sub_1DE2089AC(&dword_1DE1FE000, v37, v38, "Merging record value into non-versioned mergeable %@", v39);
    sub_1DE1FFE88(qword_1EDB81DB0);
    sub_1DE208930();
    sub_1DE208874();
  }

  v50 = v36;
  v51 = *(_QWORD *)(v95 + 8);
  sub_1DE208978((uint64_t)v19);
  v52 = objc_msgSend(v36, sel_multiValueRegister);
  v53 = objc_msgSend(v52, sel_stateVector);
  v54 = objc_msgSend(v36, sel_deliverableDeltasWithCurrentStateVector_usingDeliveryRequirements_, v53, objc_msgSend(v52, sel_deltaDeliveryRequirements));

  v55 = v89;
  if (!v54)
  {

    goto LABEL_37;
  }
  v95 = v51;
  v88 = (_QWORD *)sub_1DE2084A0();
  v56 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (v56 >> 62)
  {
    sub_1DE2088B4();
    v76 = _CocoaArrayWrapper.endIndex.getter();
    sub_1DE208894();
    if (v76)
      goto LABEL_14;
LABEL_36:
    sub_1DE208894();

    goto LABEL_37;
  }
  if (!*(_QWORD *)((v56 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_36;
LABEL_14:
  v101[0] = 0;
  if (!objc_msgSend(v52, sel_mergeDeltas_error_, v54, v101))
  {
    v65 = v101[0];
    sub_1DE208894();

    v66 = _convertNSErrorToError(_:)();
    v98 = v66;
    swift_willThrow();

    return;
  }
  v87 = v54;
  v57 = v101[0];
  CKLogDistributedSync.getter();
  v58 = v52;
  swift_bridgeObjectRetain();
  v59 = v58;
  v60 = Logger.logObject.getter();
  v61 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v60, (os_log_type_t)v61))
  {
    v83 = v61;
    v85 = v60;
    v62 = sub_1DE208880();
    v63 = sub_1DE208880();
    *(_DWORD *)v62 = 134218242;
    v94 = a1;
    v86 = v50;
    v84 = (_QWORD *)v63;
    if (v56 >> 62)
    {
      sub_1DE2088B4();
      v64 = (void *)_CocoaArrayWrapper.endIndex.getter();
      sub_1DE208894();
    }
    else
    {
      v64 = *(void **)((v56 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    sub_1DE208894();
    v101[0] = v64;
    sub_1DE208964();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    sub_1DE208894();
    *(_WORD *)(v62 + 12) = 2112;
    v101[0] = v59;
    v67 = v59;
    sub_1DE208964();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v84 = v59;

    _os_log_impl(&dword_1DE1FE000, v85, (os_log_type_t)v83, "Merged %ld deltas into multi-value register %@", (uint8_t *)v62, 0x16u);
    sub_1DE1FFE88(qword_1EDB81DB0);
    sub_1DE208930();
    sub_1DE208874();
  }

  swift_bridgeObjectRelease_n();
  ((void (*)(_QWORD *, uint64_t))v95)(v55, v97);
  v68 = objc_msgSend(v59, sel_contents);
  if (!v68)
  {

    __break(1u);
    return;
  }
  v69 = v68;
  v70 = v59;
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  sub_1DE208980(*(uint64_t (**)(void))(v93 + 16));
  v98 = (uint64_t)v58;
  v71 = v87;
  if (v58)
  {

    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRelease();
  CKLogDistributedSync.getter();
  v72 = Logger.logObject.getter();
  v73 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v72, v73))
  {
    v74 = (uint8_t *)sub_1DE208880();
    v86 = v50;
    *(_WORD *)v74 = 0;
    _os_log_impl(&dword_1DE1FE000, v72, v73, "Merged multi-value register changes into mergeable", v74, 2u);
    sub_1DE208874();
  }

  sub_1DE208978((uint64_t)v90);
  v75 = objc_msgSend(v70, sel_persistedState);
  objc_msgSend(v50, sel_setMultiValueRegisterState_, v75);

  objc_msgSend(v50, sel_didMergeDeltas_, v71);
LABEL_37:
  CKLogDistributedSync.getter();
  v77 = a1;
  v78 = Logger.logObject.getter();
  v79 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v78, v79))
  {
    v80 = (uint8_t *)sub_1DE208880();
    v95 = sub_1DE208880();
    *(_DWORD *)v80 = 138412290;
    v101[0] = v77;
    v81 = v77;
    sub_1DE208944();
    *(_QWORD *)v95 = v77;

    sub_1DE2089AC(&dword_1DE1FE000, v78, v79, "Done merging record value %@", v80);
    sub_1DE1FFE88(qword_1EDB81DB0);
    sub_1DE208930();
    sub_1DE208874();
  }

  sub_1DE208978((uint64_t)v11);
}

id CKMergeable.merge(_:)(void *a1)
{
  uint64_t v1;
  void *v2;
  id v4;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x1E0C80C00];
  v5[0] = 0;
  if (objc_msgSend(a1, sel_mergeIntoMergeable_error_, v1, v5))
    return v5[0];
  v4 = v5[0];
  sub_1DE20898C();

  return (id)sub_1DE208970();
}

id CKMergeableRecordValue.addDeltasToSave(from:)(_QWORD *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id result;
  id v9[2];

  v2 = v1;
  v9[1] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a1[3];
  v4 = a1[4];
  sub_1DE2084DC(a1, v3);
  CKMergeable.boxed.getter(v3, v4);
  v6 = v5;
  v9[0] = 0;
  v7 = objc_msgSend(v2, sel_addDeltasToSaveFromMergeable_error_, v5, v9);

  result = v9[0];
  if (!(_DWORD)v7)
  {
    sub_1DE20898C();

    return (id)sub_1DE208970();
  }
  return result;
}

void CKMergeable.boxed.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  __int128 v10[2];
  uint64_t v11;
  _BYTE v12[40];

  v4 = MEMORY[0x1E0C80A78](a1);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  sub_1DE208938((uint64_t)v10 - v7);
  sub_1DE1FFE88(&qword_1F0438820);
  if (swift_dynamicCast())
  {
    sub_1DE20885C(v10, (uint64_t)v12);
    sub_1DE208680((uint64_t)v12, (uint64_t)v10);
    v8 = objc_allocWithZone((Class)type metadata accessor for BoxedCKVersionedMergeable());
    BoxedCKVersionedMergeable.init(_:)(v10);
    sub_1DE20585C((uint64_t)v12);
  }
  else
  {
    v11 = 0;
    memset(v10, 0, sizeof(v10));
    sub_1DE208460((uint64_t)v10);
    v9 = type metadata accessor for BoxedCKMergeable();
    sub_1DE208938((uint64_t)v6);
    sub_1DE2085B0((uint64_t)v6, v9, a1, a2);
  }
  sub_1DE2088F8();
}

void *CKMergeableDelta.data.getter()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v1 = objc_msgSend(v0, sel_dataWithError_, v5);
  v2 = v5[0];
  if (v1)
  {
    v3 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();

  }
  else
  {
    v3 = v2;
    _convertNSErrorToError(_:)();

    sub_1DE208970();
  }
  return v3;
}

void sub_1DE207C10(uint64_t a1)
{
  __int128 v1[2];

  sub_1DE208680(a1, (uint64_t)v1);
  sub_1DE207C8C(v1);
}

void sub_1DE207C48(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC12CloudKitCode16BoxedCKMergeable_mergeable;
  sub_1DE208888();
  sub_1DE208680(v3, a1);
  sub_1DE208950();
}

void sub_1DE207C8C(__int128 *a1)
{
  uint64_t v1;

  sub_1DE208908(OBJC_IVAR____TtC12CloudKitCode16BoxedCKMergeable_mergeable);
  swift_beginAccess();
  sub_1DE20585C(v1);
  sub_1DE20885C(a1, v1);
  swift_endAccess();
  sub_1DE208950();
}

void BoxedCKMergeable.__allocating_init(_:)(uint64_t a1)
{
  sub_1DE207CF0(a1, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1DE2085B0);
}

void BoxedCKMergeable.init(_:)(uint64_t a1)
{
  sub_1DE207CF0(a1, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1DE208520);
}

void sub_1DE207CF0(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = sub_1DE2086C0(a1, v5);
  MEMORY[0x1E0C80A78](v7);
  sub_1DE2042FC();
  v10 = v9 - v8;
  (*(void (**)(uint64_t))(v11 + 16))(v9 - v8);
  a2(v10, v2, v5, v6);
  sub_1DE20585C(a1);
  sub_1DE2088F8();
}

uint64_t sub_1DE207D80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  _QWORD v6[4];

  v1 = v0 + OBJC_IVAR____TtC12CloudKitCode16BoxedCKMergeable_mergeable;
  swift_beginAccess();
  sub_1DE208680(v1, (uint64_t)v6);
  sub_1DE2084DC(v6, v6[3]);
  v2 = sub_1DE208998();
  v4 = v3(v2);
  sub_1DE20585C((uint64_t)v6);
  return v4;
}

uint64_t sub_1DE207EE8()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t);

  sub_1DE208908(OBJC_IVAR____TtC12CloudKitCode16BoxedCKMergeable_mergeable);
  swift_beginAccess();
  sub_1DE2086C0(v0, *(_QWORD *)(v0 + 24));
  v1 = sub_1DE208998();
  v2(v1);
  return swift_endAccess();
}

uint64_t sub_1DE208058()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  Swift::String v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v8 = 0x203A6465786F42;
  v9 = 0xE700000000000000;
  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC12CloudKitCode16BoxedCKMergeable_mergeable);
  sub_1DE208888();
  v2 = sub_1DE2084DC(v1, v1[3]);
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *))(v3 + 16))((char *)&v7 - v4);
  v5._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  return v8;
}

id BoxedCKMergeable.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void BoxedCKMergeable.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BoxedCKMergeable.__deallocating_deinit()
{
  return sub_1DE208430(type metadata accessor for BoxedCKMergeable);
}

void BoxedCKVersionedMergeable.__allocating_init(_:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  BoxedCKVersionedMergeable.init(_:)(a1);
  sub_1DE20425C();
}

id BoxedCKVersionedMergeable.init(_:)(_QWORD *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15[5];

  v3 = a1[3];
  v4 = a1[4];
  v5 = sub_1DE2084DC(a1, v3);
  v15[3] = v3;
  v6 = *(_QWORD *)(v4 + 8);
  v15[4] = v6;
  v7 = sub_1DE2086E8(v15);
  v8 = *(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v3 - 8) + 16);
  v9 = v8(v7, v5, v3);
  MEMORY[0x1E0C80A78](v9);
  sub_1DE2042FC();
  v12 = v11 - v10;
  v8((uint64_t *)(v11 - v10), v7, v3);
  v13 = sub_1DE208520(v12, v1, v3, v6);
  sub_1DE20585C((uint64_t)v15);
  sub_1DE20585C((uint64_t)a1);
  return v13;
}

void sub_1DE20829C()
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
  uint64_t v19[5];

  v1 = sub_1DE208888();
  sub_1DE208958(v1, v2, v3, v4, v5, v6, v7, v8, v17);
  sub_1DE1FFE88((uint64_t *)&unk_1F0438848);
  sub_1DE1FFE88(&qword_1F0438820);
  v9 = sub_1DE20889C();
  sub_1DE2088E8(v9, v10, v11, v12, v13, v14, v15, v16, v18, v19[0], v19[1], v19[2], v19[3]);
  sub_1DE208920(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 16));
  sub_1DE20585C((uint64_t)v19);
  sub_1DE2088D8();
}

void sub_1DE208340()
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
  uint64_t v19[5];

  v1 = sub_1DE208888();
  sub_1DE208958(v1, v2, v3, v4, v5, v6, v7, v8, v17);
  sub_1DE1FFE88((uint64_t *)&unk_1F0438848);
  sub_1DE1FFE88(&qword_1F0438820);
  v9 = sub_1DE20889C();
  sub_1DE2088E8(v9, v10, v11, v12, v13, v14, v15, v16, v18, v19[0], v19[1], v19[2], v19[3]);
  sub_1DE208920(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 24));
  sub_1DE20585C((uint64_t)v19);
  sub_1DE2088D8();
}

void BoxedCKVersionedMergeable.__allocating_init(_:)()
{
  sub_1DE2088C8();
  __break(1u);
}

void BoxedCKVersionedMergeable.init(_:)()
{
  sub_1DE2088C8();
  __break(1u);
}

id BoxedCKVersionedMergeable.__deallocating_deinit()
{
  return sub_1DE208430(type metadata accessor for BoxedCKVersionedMergeable);
}

id sub_1DE208430(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1DE208460(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1DE1FFE88((uint64_t *)&unk_1F0438828);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1DE2084A0()
{
  unint64_t result;

  result = qword_1F0438838;
  if (!qword_1F0438838)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F0438838);
  }
  return result;
}

_QWORD *sub_1DE2084DC(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t type metadata accessor for BoxedCKMergeable()
{
  return objc_opt_self();
}

id sub_1DE208520(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v7;
  id v8;
  objc_super v10;
  uint64_t v11[5];

  v11[3] = a3;
  v11[4] = a4;
  v7 = sub_1DE2086E8(v11);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(v7, a1, a3);
  sub_1DE208680((uint64_t)v11, (uint64_t)a2 + OBJC_IVAR____TtC12CloudKitCode16BoxedCKMergeable_mergeable);
  v10.receiver = a2;
  v10.super_class = (Class)type metadata accessor for BoxedCKMergeable();
  v8 = objc_msgSendSuper2(&v10, sel_init);
  sub_1DE20585C((uint64_t)v11);
  return v8;
}

id sub_1DE2085B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v13;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](a1);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_allocWithZone((Class)type metadata accessor for BoxedCKMergeable());
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  v11 = sub_1DE208520((uint64_t)v9, v10, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, a3);
  return v11;
}

uint64_t type metadata accessor for BoxedCKVersionedMergeable()
{
  return objc_opt_self();
}

void sub_1DE208680(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  sub_1DE20425C();
}

uint64_t sub_1DE2086C0(uint64_t a1, uint64_t a2)
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

uint64_t *sub_1DE2086E8(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void sub_1DE208724(uint64_t a1@<X8>)
{
  sub_1DE207C48(a1);
}

uint64_t dispatch thunk of CKMergeable.mergeableDeltas(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of CKMergeable.merge(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of CKVersionedMergeable.stateVector.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of CKVersionedMergeable.deltaDeliveryRequirements.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t method lookup function for BoxedCKMergeable()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BoxedCKMergeable.mergeable.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of BoxedCKMergeable.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of BoxedCKMergeable.mergeableDeltas(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of BoxedCKMergeable.merge(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t method lookup function for BoxedCKVersionedMergeable()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BoxedCKVersionedMergeable.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of BoxedCKVersionedMergeable.stateVector()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of BoxedCKVersionedMergeable.deltaDeliveryRequirements()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t sub_1DE20885C(__int128 *a1, uint64_t a2)
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

void sub_1DE208874()
{
  JUMPOUT(0x1DF0EA668);
}

uint64_t sub_1DE208880()
{
  return swift_slowAlloc();
}

uint64_t sub_1DE208888()
{
  return swift_beginAccess();
}

uint64_t sub_1DE208894()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DE20889C()
{
  return swift_dynamicCast();
}

uint64_t sub_1DE2088B4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DE2088C8()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

_QWORD *sub_1DE2088E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return sub_1DE2084DC(&a10, a13);
}

uint64_t sub_1DE208908@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return v1 + a1;
}

uint64_t sub_1DE208920@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_1DE208930()
{
  return swift_arrayDestroy();
}

uint64_t sub_1DE208938(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t sub_1DE208944()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void sub_1DE208958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  sub_1DE208680(v9, (uint64_t)va);
}

uint64_t sub_1DE208964()
{
  uint64_t v0;

  return v0 - 136;
}

uint64_t sub_1DE208970()
{
  return swift_willThrow();
}

uint64_t sub_1DE208978(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t sub_1DE208980@<X0>(uint64_t (*a1)(void)@<X8>)
{
  return a1();
}

uint64_t sub_1DE20898C()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_1DE208998()
{
  uint64_t v0;

  return v0;
}

void sub_1DE2089AC(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

void CKDeserializeRecordModificationsOperation.deserializeResultBlock.getter()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v1 = objc_msgSend(v0, sel_deserializeCompletionBlock);
  if (v1)
  {
    v2 = v1;
    v3 = sub_1DE2090B0();
    *(_QWORD *)(v3 + 16) = v2;
    v4 = sub_1DE2090B0();
    *(_QWORD *)(v4 + 16) = sub_1DE208D00;
    *(_QWORD *)(v4 + 24) = v3;
  }
  sub_1DE20425C();
}

void sub_1DE208A30(uint64_t (**a1)(uint64_t a1)@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);

  CKDeserializeRecordModificationsOperation.deserializeResultBlock.getter();
  if (v2)
  {
    v4 = v2;
    v5 = v3;
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 16) = v4;
    *(_QWORD *)(v2 + 24) = v5;
    v6 = sub_1DE20900C;
  }
  else
  {
    v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)(uint64_t))v2;
}

id sub_1DE208A94(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, char);

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_1DE208FB0;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_1DE204B48(v1);
  return CKDeserializeRecordModificationsOperation.deserializeResultBlock.setter((uint64_t)v4, v3);
}

id CKDeserializeRecordModificationsOperation.deserializeResultBlock.setter(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  void *v7;
  _QWORD v9[6];

  v3 = v2;
  if (!a1)
    return objc_msgSend(v2, sel_setDeserializeCompletionBlock_, 0);
  v6 = sub_1DE2090B0();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v9[4] = sub_1DE208E38;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1DE208E40;
  v9[3] = &unk_1EA8C9118;
  v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_setDeserializeCompletionBlock_, v7);
  _Block_release(v7);
  return (id)sub_1DE204AEC(a1);
}

void sub_1DE208C10(objc_class *a1, Class a2, uint64_t a3, uint64_t a4)
{
  Class isa;
  uint64_t v8;
  id v9;

  isa = a1;
  if (a1)
  {
    sub_1DE209038(0, &qword_1F0438C60);
    isa = Array._bridgeToObjectiveC()().super.isa;
  }
  if (a2)
  {
    sub_1DE209038(0, &qword_1F0438980);
    a2 = Array._bridgeToObjectiveC()().super.isa;
  }
  if (a3)
    v8 = _convertErrorToNSError(_:)();
  else
    v8 = 0;
  v9 = (id)v8;
  (*(void (**)(uint64_t, Class, Class))(a4 + 16))(a4, isa, a2);

}

uint64_t sub_1DE208CDC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1DE208D00(objc_class *a1, objc_class *a2, uint64_t a3)
{
  uint64_t v3;

  sub_1DE208C10(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

void sub_1DE208D08(id a1, uint64_t a2, char a3, void (*a4)(id, uint64_t, id))
{
  id v7;

  if ((a3 & 1) != 0)
  {
    v7 = a1;
    a4(0, 0, a1);
    sub_1DE20906C(a1, a2, 1);
  }
  else
  {
    a4(a1, a2, 0);
  }
}

void sub_1DE208D80(void *a1, uint64_t a2, char a3)
{
  uint64_t v3;

  sub_1DE208D08(a1, a2, a3 & 1, *(void (**)(id, uint64_t, id))(v3 + 16));
}

void sub_1DE208D8C(void *a1, uint64_t a2, id a3, void (*a4)(id, uint64_t, uint64_t))
{
  id v6;
  void *v7;
  uint64_t v8;

  if (a3)
  {
    v6 = a3;
    a4(a3, 0, 1);

  }
  else
  {
    if (a1)
      v7 = a1;
    else
      v7 = (void *)MEMORY[0x1E0DEE9D8];
    if (a2)
      v8 = a2;
    else
      v8 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a4(v7, v8, 0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_1DE208E38(void *a1, uint64_t a2, void *a3)
{
  uint64_t v3;

  sub_1DE208D8C(a1, a2, a3, *(void (**)(id, uint64_t, uint64_t))(v3 + 16));
}

uint64_t sub_1DE208E40(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, void *);
  id v8;

  v6 = a2;
  v7 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_1DE209038(0, &qword_1F0438C60);
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a3)
  {
    sub_1DE209038(0, &qword_1F0438980);
    a3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  v8 = a4;
  v7(v6, a3, a4);
  swift_release();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DE208F08(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1DE208F18()
{
  return swift_release();
}

void CKDeserializeRecordModificationsOperation.deserializeResultBlock.modify(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  a1[2] = v1;
  CKDeserializeRecordModificationsOperation.deserializeResultBlock.getter();
  *a1 = v3;
  a1[1] = v4;
  sub_1DE20425C();
}

id sub_1DE208F50(uint64_t *a1, char a2)
{
  uint64_t v2;

  v2 = *a1;
  if ((a2 & 1) == 0)
    return sub_1DE2090A4();
  sub_1DE204B48(*a1);
  sub_1DE2090A4();
  return (id)sub_1DE204AEC(v2);
}

uint64_t sub_1DE208FB0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t (*v4)(_QWORD *);
  _QWORD v6[2];
  char v7;

  v4 = *(uint64_t (**)(_QWORD *))(v3 + 16);
  v6[0] = a1;
  v6[1] = a2;
  v7 = a3 & 1;
  return v4(v6);
}

uint64_t sub_1DE208FE8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DE20900C(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v1 + 16))(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
}

void sub_1DE209038(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  sub_1DE20425C();
}

void sub_1DE20906C(void *a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
  {

  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

id sub_1DE2090A4()
{
  uint64_t v0;
  uint64_t v1;

  return CKDeserializeRecordModificationsOperation.deserializeResultBlock.setter(v0, v1);
}

uint64_t sub_1DE2090B0()
{
  return swift_allocObject();
}

uint64_t RemoteMeasurement.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_1DE1FFB64(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t RemoteMeasurement.init(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(char a1@<W0>, char a2@<W1>, char a3@<W2>, char a4@<W3>, char a5@<W4>, char a6@<W5>, char a7@<W6>, char a8@<W7>, uint64_t *a9@<X8>, uint64_t a10, __int128 a11)
{
  uint64_t v17;
  uint64_t result;
  uint64_t v19;

  sub_1DE1FFE88(&qword_1EDB81A40);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_1DE226ED0;
  *(_BYTE *)(v17 + 32) = a1;
  *(_BYTE *)(v17 + 33) = a2;
  *(_BYTE *)(v17 + 34) = a3;
  *(_BYTE *)(v17 + 35) = a4;
  *(_BYTE *)(v17 + 36) = a5;
  *(_BYTE *)(v17 + 37) = a6;
  *(_BYTE *)(v17 + 38) = a7;
  *(_BYTE *)(v17 + 39) = a8;
  *(_QWORD *)(v17 + 40) = a10;
  *(_OWORD *)(v17 + 48) = a11;
  result = sub_1DE2091C0(v17);
  *a9 = result;
  a9[1] = v19;
  return result;
}

uint64_t sub_1DE2091C0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  unint64_t v10;

  v9 = sub_1DE1FFE88(&qword_1EDB81A18);
  v10 = sub_1DE20945C();
  v8[0] = a1;
  v2 = sub_1DE2084DC(v8, v9);
  v3 = *v2 + 32;
  v4 = v3 + *(_QWORD *)(*v2 + 16);
  swift_bridgeObjectRetain();
  sub_1DE2094E4(v3, v4, &v7);
  swift_bridgeObjectRelease();
  v5 = v7;
  sub_1DE20585C((uint64_t)v8);
  return v5;
}

void RemoteMeasurement.init(data:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1DE20928C(uint64_t result, unint64_t a2)
{
  uint64_t *v2;

  if (BYTE6(a2) != 32)
  {
    sub_1DE1FFC54(result, a2);
    result = 0;
    a2 = 0xF000000000000000;
  }
  *v2 = result;
  v2[1] = a2;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for RemoteMeasurement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  sub_1DE1FFB64(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t destroy for RemoteMeasurement(uint64_t a1)
{
  return sub_1DE1FFC54(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t *assignWithCopy for RemoteMeasurement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = *a2;
  v4 = a2[1];
  sub_1DE1FFB64(*a2, v4);
  v5 = *a1;
  v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_1DE1FFC54(v5, v6);
  return a1;
}

uint64_t *assignWithTake for RemoteMeasurement(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_1DE1FFC54(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for RemoteMeasurement(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0xD && *(_BYTE *)(a1 + 16))
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

uint64_t storeEnumTagSinglePayload for RemoteMeasurement(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)result = a2 - 13;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteMeasurement()
{
  return &type metadata for RemoteMeasurement;
}

unint64_t sub_1DE20945C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDB81A20;
  if (!qword_1EDB81A20)
  {
    v1 = sub_1DE2094A0(&qword_1EDB81A18);
    result = MEMORY[0x1DF0EA5C0](MEMORY[0x1E0CB1B08], v1);
    atomic_store(result, (unint64_t *)&qword_1EDB81A20);
  }
  return result;
}

uint64_t sub_1DE2094A0(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0EA5B4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1DE2094E4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
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
    result = Data.InlineData.init(_:)();
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = MEMORY[0x1DF0E9C0C]();
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = MEMORY[0x1DF0E9C18]();
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

id CKRecordChange.changeType.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  id result;
  char v5;

  v3 = sub_1DE2061CC(a1, sel_changeType);
  if (v3 == (id)3)
  {
    result = 0;
    v5 = 2;
    goto LABEL_9;
  }
  if (v3 == (id)2)
  {
    result = sub_1DE2061CC(2, sel_record);
    if (result)
    {
      v5 = 1;
LABEL_9:
      *(_QWORD *)a2 = result;
      *(_BYTE *)(a2 + 8) = v5;
      return result;
    }
  }
  else if (v3 == (id)1)
  {
    result = sub_1DE2061CC(1, sel_record);
    if (result)
    {
      v5 = 0;
      goto LABEL_9;
    }
  }
  result = (id)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t CKRecordObserver.RecordChanges.Iterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  sub_1DE1FFE88(&qword_1F0438990);
  *v1 = v0;
  v1[1] = sub_1DE2096B4;
  return AsyncStream.Iterator.next()();
}

uint64_t sub_1DE2096B4()
{
  sub_1DE20A468();
  return sub_1DE20A4A4();
}

uint64_t sub_1DE2096E4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_1DE20972C;
  return CKRecordObserver.RecordChanges.Iterator.next()();
}

uint64_t sub_1DE20972C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  sub_1DE20A4CC();
  sub_1DE20A4E0(v4);
  if (!v1)
    **(_QWORD **)(v2 + 16) = v0;
  return sub_1DE20A494(*(uint64_t (**)(void))(v3 + 8));
}

uint64_t sub_1DE209768(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (__cdecl *v7)();

  v4[2] = a1;
  v4[3] = a4;
  v7 = (uint64_t (__cdecl *)())((char *)&dword_1F04389F8 + dword_1F04389F8);
  v5 = (_QWORD *)swift_task_alloc();
  v4[4] = v5;
  *v5 = v4;
  v5[1] = sub_1DE2097DC;
  return v7();
}

uint64_t sub_1DE2097DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  sub_1DE20A4CC();
  sub_1DE20A4E0(v4);
  if (v1)
    **(_QWORD **)(v2 + 24) = v1;
  else
    **(_QWORD **)(v2 + 16) = v0;
  return sub_1DE20A494(*(uint64_t (**)(void))(v3 + 8));
}

uint64_t sub_1DE20982C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  sub_1DE1FFE88(&qword_1F0438990);
  *v1 = v0;
  v1[1] = sub_1DE209898;
  return AsyncStream.Iterator.next()();
}

uint64_t sub_1DE209898()
{
  sub_1DE20A468();
  return sub_1DE20A4A4();
}

uint64_t CKRecordObserver.RecordChanges.makeAsyncIterator()()
{
  sub_1DE1FFE88(&qword_1F0438998);
  return AsyncStream.makeAsyncIterator()();
}

uint64_t sub_1DE2098F4()
{
  uint64_t v0;

  CKRecordObserver.RecordChanges.makeAsyncIterator()();
  return sub_1DE20A22C(v0);
}

id CKRecordObserver.init(container:recordType:)(void *a1, uint64_t a2, uint64_t a3)
{
  id v6;
  void *v7;
  id v8;
  id v9;

  if (a3)
  {
    v6 = a1;
    v7 = (void *)MEMORY[0x1DF0E9E7C](a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a1;
    v7 = 0;
  }
  v9 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithContainer_recordType_, a1, v7);

  return v9;
}

uint64_t CKRecordObserver.recordChanges.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE v6[16];
  uint64_t v7;

  v1 = sub_1DE1FFE88(&qword_1F04389A0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = &v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = v0;
  sub_1DE20617C(0, qword_1F04389A8);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0DF07B8], v1);
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

uint64_t sub_1DE209A64(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD aBlock[7];

  v4 = sub_1DE1FFE88(&qword_1F0438A00);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a2, sel_copy);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1DE20617C(0, &qword_1F0438A08);
  swift_dynamicCast();
  v8 = (void *)aBlock[6];
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, v7, v4);
  aBlock[4] = sub_1DE20A374;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DE20A3B4;
  aBlock[3] = &unk_1EA8C9140;
  v11 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v8, sel_registerWithBlock_, v11);
  _Block_release(v11);
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  return AsyncStream.Continuation.onTermination.setter();
}

uint64_t sub_1DE209C20(uint64_t a1)
{
  uint64_t v1;

  return sub_1DE209A64(a1, *(void **)(v1 + 16));
}

uint64_t sub_1DE209C28()
{
  return MEMORY[0x1E0DEDB38];
}

unint64_t sub_1DE209C38()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F04389C0;
  if (!qword_1F04389C0)
  {
    v1 = type metadata accessor for CKRecordObserver.RecordChanges.Iterator(255);
    result = MEMORY[0x1DF0EA5C0](&protocol conformance descriptor for CKRecordObserver.RecordChanges.Iterator, v1);
    atomic_store(result, (unint64_t *)&qword_1F04389C0);
  }
  return result;
}

uint64_t type metadata accessor for CKRecordObserver.RecordChanges.Iterator(uint64_t a1)
{
  return sub_1DE20064C(a1, (uint64_t *)&unk_1F04389E0);
}

uint64_t _s10ChangeTypeOwCP(uint64_t a1, uint64_t a2)
{
  id v3;
  unsigned __int8 v4;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_1DE209CD0(*(id *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

id sub_1DE209CD0(id result, unsigned __int8 a2)
{
  if (a2 <= 1u)
    return result;
  return result;
}

void _s10ChangeTypeOwxx(uint64_t a1)
{
  sub_1DE209CF4(*(id *)a1, *(_BYTE *)(a1 + 8));
}

void sub_1DE209CF4(id a1, unsigned __int8 a2)
{
  if (a2 <= 1u)

}

uint64_t _s10ChangeTypeOwca(uint64_t a1, uint64_t a2)
{
  id v3;
  unsigned __int8 v4;
  void *v5;
  unsigned __int8 v6;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_1DE209CD0(*(id *)a2, v4);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v3;
  v6 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v4;
  sub_1DE209CF4(v5, v6);
  return a1;
}

uint64_t _s10ChangeTypeOwtk(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t _s10ChangeTypeOwta(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  unsigned __int8 v5;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  sub_1DE209CF4(v4, v5);
  return a1;
}

uint64_t _s10ChangeTypeOwet(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 2)
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

uint64_t _s10ChangeTypeOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_1DE209E2C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_1DE209E44(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CKRecordChange.ChangeType()
{
  return &type metadata for CKRecordChange.ChangeType;
}

uint64_t _s13RecordChangesVwCP(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1DE1FFE88(&qword_1F0438998);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t _s13RecordChangesVwxx(uint64_t a1, uint64_t a2)
{
  return sub_1DE209FCC(a1, a2, &qword_1F0438998);
}

void _s13RecordChangesVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1DE20A00C(a1, a2, a3, &qword_1F0438998);
}

void _s13RecordChangesVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1DE20A040(a1, a2, a3, &qword_1F0438998);
}

void _s13RecordChangesVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1DE20A074(a1, a2, a3, &qword_1F0438998);
}

void _s13RecordChangesVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1DE20A0A8(a1, a2, a3, &qword_1F0438998);
}

uint64_t _s13RecordChangesVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DE209EF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1DE20A4C0();
  v2 = sub_1DE1FFE88(&qword_1F0438998);
  return sub_1DE20A4B0(v1, v0, v2);
}

uint64_t _s13RecordChangesVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DE209F30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_1DE20A4C0();
  sub_1DE1FFE88(&qword_1F0438998);
  v0 = sub_1DE20A4EC();
  return sub_1DE20A4B8(v0, v1, v2, v3);
}

uint64_t type metadata accessor for CKRecordObserver.RecordChanges(uint64_t a1)
{
  return sub_1DE20064C(a1, (uint64_t *)&unk_1F04389C8);
}

void sub_1DE209F6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1DE20A154(a1, a2, a3, &qword_1F04389D8, MEMORY[0x1E0DF0838]);
}

uint64_t _s13RecordChangesV8IteratorVwCP(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1DE1FFE88(&qword_1F0438990);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t _s13RecordChangesV8IteratorVwxx(uint64_t a1, uint64_t a2)
{
  return sub_1DE209FCC(a1, a2, &qword_1F0438990);
}

uint64_t sub_1DE209FCC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;

  v4 = sub_1DE1FFE88(a3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
}

void _s13RecordChangesV8IteratorVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1DE20A00C(a1, a2, a3, &qword_1F0438990);
}

void sub_1DE20A00C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;

  sub_1DE20A458(a1, a2, a3, a4);
  sub_1DE20A500();
  sub_1DE20A488(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16));
  sub_1DE20425C();
}

void _s13RecordChangesV8IteratorVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1DE20A040(a1, a2, a3, &qword_1F0438990);
}

void sub_1DE20A040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;

  sub_1DE20A458(a1, a2, a3, a4);
  sub_1DE20A500();
  sub_1DE20A488(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 24));
  sub_1DE20425C();
}

void _s13RecordChangesV8IteratorVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1DE20A074(a1, a2, a3, &qword_1F0438990);
}

void sub_1DE20A074(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;

  sub_1DE20A458(a1, a2, a3, a4);
  sub_1DE20A500();
  sub_1DE20A488(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 32));
  sub_1DE20425C();
}

void _s13RecordChangesV8IteratorVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1DE20A0A8(a1, a2, a3, &qword_1F0438990);
}

void sub_1DE20A0A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;

  sub_1DE20A458(a1, a2, a3, a4);
  sub_1DE20A500();
  sub_1DE20A488(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 40));
  sub_1DE20425C();
}

uint64_t _s13RecordChangesV8IteratorVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DE20A0DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1DE20A4C0();
  v2 = sub_1DE1FFE88(&qword_1F0438990);
  return sub_1DE20A4B0(v1, v0, v2);
}

uint64_t _s13RecordChangesV8IteratorVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DE20A118()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_1DE20A4C0();
  sub_1DE1FFE88(&qword_1F0438990);
  v0 = sub_1DE20A4EC();
  return sub_1DE20A4B8(v0, v1, v2, v3);
}

void sub_1DE20A140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1DE20A154(a1, a2, a3, &qword_1F04389F0, MEMORY[0x1E0DF0820]);
}

void sub_1DE20A154(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  unint64_t v5;

  sub_1DE20A1C4(319, a4, a5);
  if (v5 <= 0x3F)
    swift_initStructMetadata();
}

void sub_1DE20A1C4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1DE20617C(255, qword_1F04389A8);
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_1DE20A22C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CKRecordObserver.RecordChanges(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DE20A268(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  _QWORD v8[2];

  v2 = sub_1DE1FFE88(&qword_1F0438A10);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = a1;
  v6 = a1;
  sub_1DE1FFE88(&qword_1F0438A00);
  AsyncStream.Continuation.yield(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1DE20A310()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1DE1FFE88(&qword_1F0438A00);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1DE20A374(void *a1)
{
  sub_1DE1FFE88(&qword_1F0438A00);
  return sub_1DE20A268(a1);
}

void sub_1DE20A3B4(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_1DE20A404(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1DE20A414()
{
  return swift_release();
}

uint64_t sub_1DE20A41C()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1DE20A440()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_invalidate);
}

uint64_t sub_1DE20A458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sub_1DE1FFE88(a4);
}

uint64_t sub_1DE20A468()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t sub_1DE20A488@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_1DE20A494(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1DE20A4A4()
{
  return swift_task_switch();
}

uint64_t sub_1DE20A4B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(a1, a2, a3);
}

uint64_t sub_1DE20A4B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(a1, a2, a3, a4);
}

void sub_1DE20A4CC()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t sub_1DE20A4E0@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_task_dealloc();
}

uint64_t sub_1DE20A4EC()
{
  uint64_t v0;

  return v0;
}

void CKDatabase.serialize(recordsToSave:recordIDsToDelete:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE20A7F4(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t, id, uint64_t, uint64_t))sub_1DE20A518);
}

void sub_1DE20A518()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  sub_1DE20B008();
  sub_1DE20617C(0, &qword_1F0438A58);
  swift_bridgeObjectRetain();
  v3 = swift_bridgeObjectRetain();
  CKSerializeRecordModificationsOperation.init(recordsToSave:recordIDsToDelete:)(v3, v0);
  sub_1DE20B068();
  v4 = CKSerializeRecordModificationsOperation.serializeResultBlock.setter(v2, v1);
  sub_1DE20B034(v4, sel__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_, v5, v6, v7, v8, v9, v10, v11, v12);
  sub_1DE20AF5C(v13);
}

uint64_t CKDatabase.serializedModifications(recordsToSave:recordIDsToDelete:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_1DE2061C0();
}

uint64_t sub_1DE20A5B0(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = sub_1DE2061CC(a1, sel_implementation);
  *(_QWORD *)(v1 + 40) = v2;
  v3 = objc_msgSend(sub_1DE2061CC((uint64_t)v2, sel_container), sel_convenienceConfiguration);
  sub_1DE20B05C((uint64_t)v3);
  v4 = (_QWORD *)swift_task_alloc();
  v5 = sub_1DE20AFD4(v4, (uint64_t)sub_1DE20A644);
  return sub_1DE20A6C8(v5, v6, v7, v8);
}

uint64_t sub_1DE20A644()
{
  uint64_t v0;
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  sub_1DE20AF7C();
  if (v0)
  {
    sub_1DE20B028();
    return sub_1DE20AF74();
  }
  else
  {
    v3 = *(void **)(v1 + 40);

    v4 = sub_1DE20B048();
    return sub_1DE20AFC4(v4, v5, v6);
  }
}

uint64_t sub_1DE20A698()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 40);

  return sub_1DE2061B4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1DE20A6C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[7] = a4;
  v5[8] = v4;
  v5[5] = a2;
  v5[6] = a3;
  v5[4] = a1;
  return sub_1DE2061C0();
}

uint64_t sub_1DE20A6E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  _QWORD *v6;

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v4;
  v5 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v4 + 16) = v1;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 40) = v3;
  *(_QWORD *)(v4 + 48) = v2;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v6;
  *v6 = v0;
  v6[1] = sub_1DE20A79C;
  sub_1DE20B028();
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

uint64_t sub_1DE20A79C()
{
  uint64_t v0;

  sub_1DE20AFA4();
  if (!v0)
    swift_task_dealloc();
  sub_1DE20B028();
  return sub_1DE20AF74();
}

void CKDatabase.deserialize(serializedModifications:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE20A7F4(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t, id, uint64_t, uint64_t))sub_1DE20A8A0);
}

void sub_1DE20A7F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t, id, uint64_t, uint64_t))
{
  uint64_t v5;
  id v11;
  id v12;
  id v13;

  v11 = sub_1DE2061CC(a1, sel_implementation);
  v12 = sub_1DE2061CC((uint64_t)v11, sel_container);
  v13 = objc_msgSend(v12, sel_convenienceConfiguration);

  a5(a1, a2, v5, v13, a3, a4);
  sub_1DE20AF5C(v13);
}

void sub_1DE20A8A0()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  sub_1DE20B008();
  sub_1DE20617C(0, &qword_1F0438A48);
  sub_1DE1FFB64(v3, v0);
  sub_1DE20ABE4(v3, v0);
  sub_1DE20B068();
  v4 = CKDeserializeRecordModificationsOperation.deserializeResultBlock.setter(v2, v1);
  sub_1DE20B034(v4, sel__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_, v5, v6, v7, v8, v9, v10, v11, v12);
  sub_1DE20AF5C(v13);
}

uint64_t CKDatabase.deserializedModifications(from:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_1DE2061C0();
}

uint64_t sub_1DE20A938(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = sub_1DE2061CC(a1, sel_implementation);
  *(_QWORD *)(v1 + 40) = v2;
  v3 = objc_msgSend(sub_1DE2061CC((uint64_t)v2, sel_container), sel_convenienceConfiguration);
  sub_1DE20B05C((uint64_t)v3);
  v4 = (_QWORD *)swift_task_alloc();
  v5 = sub_1DE20AFD4(v4, (uint64_t)sub_1DE20A9CC);
  return sub_1DE20AA20(v5, v6, v7, v8);
}

uint64_t sub_1DE20A9CC()
{
  uint64_t v0;
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  sub_1DE20AF7C();
  if (v0)
  {
    sub_1DE20B028();
    return sub_1DE20AF74();
  }
  else
  {
    v3 = *(void **)(v1 + 40);

    v4 = sub_1DE20B048();
    return sub_1DE20AFC4(v4, v5, v6);
  }
}

uint64_t sub_1DE20AA20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[7] = a4;
  v5[8] = v4;
  v5[5] = a2;
  v5[6] = a3;
  v5[4] = a1;
  return sub_1DE2061C0();
}

uint64_t sub_1DE20AA38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  __int128 v7;

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v7 = *(_OWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v4;
  *(_QWORD *)(v4 + 16) = v1;
  *(_QWORD *)(v4 + 24) = v3;
  *(_OWORD *)(v4 + 32) = v7;
  *(_QWORD *)(v4 + 48) = v2;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v5;
  sub_1DE1FFE88(&qword_1F0438A38);
  *v5 = v0;
  v5[1] = sub_1DE20AB04;
  sub_1DE20B028();
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

uint64_t sub_1DE20AB04()
{
  uint64_t v0;

  sub_1DE20AFA4();
  if (!v0)
    swift_task_dealloc();
  sub_1DE20B028();
  return sub_1DE20AF74();
}

uint64_t sub_1DE20AB4C()
{
  uint64_t v0;

  swift_task_dealloc();
  return sub_1DE2061B4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1DE20AB78(void *a1, unint64_t a2, char a3)
{
  id v4;

  if ((a3 & 1) != 0)
  {
    v4 = a1;
    sub_1DE1FFE88(&qword_1F0438A50);
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    sub_1DE1FFB64((uint64_t)a1, a2);
    sub_1DE1FFE88(&qword_1F0438A50);
    return CheckedContinuation.resume(returning:)();
  }
}

id sub_1DE20ABE4(uint64_t a1, unint64_t a2)
{
  id v4;
  Class isa;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  isa = Data._bridgeToObjectiveC()().super.isa;
  v6 = objc_msgSend(v4, sel_initWithSerializedModifications_, isa);
  sub_1DE1FFC54(a1, a2);

  return v6;
}

uint64_t sub_1DE20AC58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, uint64_t a9, void (*a10)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v21 = a2;
  v22 = a6;
  v20 = a5;
  v13 = sub_1DE1FFE88(a7);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x1E0C80A78](v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v13);
  v16 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v17 + v16, (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
  a10(a3, a4, v20, v22, a9, v17);
  return swift_release();
}

uint64_t sub_1DE20AD58(uint64_t a1)
{
  return sub_1DE20AE38(a1, &qword_1F0438A40, (uint64_t)&unk_1EA8C9AF0, (uint64_t)sub_1DE20AE00, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1DE20A8A0);
}

uint64_t sub_1DE20AD7C(void *a1, uint64_t a2, char a3)
{
  id v4;

  if ((a3 & 1) != 0)
  {
    v4 = a1;
    sub_1DE1FFE88(&qword_1F0438A40);
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1DE1FFE88(&qword_1F0438A40);
    return CheckedContinuation.resume(returning:)();
  }
}

uint64_t sub_1DE20ADF4()
{
  return sub_1DE20AE80(&qword_1F0438A40);
}

uint64_t sub_1DE20AE00(uint64_t a1, uint64_t a2, char a3)
{
  return sub_1DE20AEF0(a1, a2, a3, &qword_1F0438A40, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1DE20AD7C);
}

uint64_t sub_1DE20AE14(uint64_t a1)
{
  return sub_1DE20AE38(a1, &qword_1F0438A50, (uint64_t)&unk_1EA8C9B18, (uint64_t)sub_1DE20AEDC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1DE20A518);
}

uint64_t sub_1DE20AE38(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v5;

  return sub_1DE20AC58(a1, v5[2], v5[3], v5[4], v5[5], v5[6], a2, a3, a4, a5);
}

uint64_t sub_1DE20AE74()
{
  return sub_1DE20AE80(&qword_1F0438A50);
}

uint64_t sub_1DE20AE80(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = sub_1DE1FFE88(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_1DE20AEDC(uint64_t a1, uint64_t a2, char a3)
{
  return sub_1DE20AEF0(a1, a2, a3, &qword_1F0438A50, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1DE20AB78);
}

uint64_t sub_1DE20AEF0(uint64_t a1, uint64_t a2, char a3, uint64_t *a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;

  v8 = a3 & 1;
  v9 = *(unsigned __int8 *)(*(_QWORD *)(sub_1DE1FFE88(a4) - 8) + 80);
  return a5(a1, a2, v8, v5 + ((v9 + 16) & ~v9));
}

void sub_1DE20AF5C(id a1)
{

}

uint64_t sub_1DE20AF74()
{
  return swift_task_switch();
}

uint64_t sub_1DE20AF7C()
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
  *(_QWORD *)(v3 + 64) = v0;
  return swift_task_dealloc();
}

uint64_t sub_1DE20AFA4()
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
  *(_QWORD *)(v3 + 88) = v0;
  return swift_task_dealloc();
}

uint64_t sub_1DE20AFC4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_1DE20AFD4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = a1;
  *a1 = v2;
  a1[1] = a2;
  return *(_QWORD *)(v2 + 16);
}

uint64_t sub_1DE20AFF8()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

id sub_1DE20B034(int a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void *v10;
  uint64_t v11;
  uint64_t v12;

  return objc_msgSend(v10, a2, a10, v12, v11);
}

uint64_t sub_1DE20B048()
{
  uint64_t v0;

  return v0;
}

void sub_1DE20B05C(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;

}

uint64_t sub_1DE20B068()
{
  return swift_retain();
}

id CKCodeService.databaseScope.getter()
{
  void *v0;
  id v1;
  id v2;
  id v3;

  v1 = objc_msgSend(v0, sel_implementation);
  v2 = objc_msgSend(v1, sel_boxedDatabaseScope);

  if (!v2)
    return 0;
  v3 = objc_msgSend(v2, sel_integerValue);

  return v3;
}

void CKCodeService.add<A, B>(_:)(void *a1)
{
  void *v1;
  id v3;
  id v4;
  id v5;

  v3 = objc_msgSend(v1, sel_implementation);
  v4 = objc_msgSend(v1, sel_container);
  v5 = objc_msgSend(v4, sel_convenienceConfiguration);

  sub_1DE20B190(a1, v1, (uint64_t)v5);
}

id sub_1DE20B190(void *a1, void *a2, uint64_t a3)
{
  void *v3;
  void *v4;
  id v8;

  v4 = v3;
  v8 = a2;
  sub_1DE219D3C(a2);
  objc_msgSend(a1, sel_applyConvenienceConfiguration_, a3);
  return objc_msgSend(v4, sel__addPreparedOperation_, a1);
}

void *CKSerializeRecordModificationsOperation.init(recordsToSave:recordIDsToDelete:)(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  NSArray v7;
  id v8;
  NSArray v9;

  v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v5 = v4;
  if (a1)
  {
    sub_1DE209038(0, &qword_1F0438C60);
    v6 = v5;
    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = v4;
    v7.super.isa = 0;
  }
  objc_msgSend(v5, sel_setRecordsToSave_, v7.super.isa);

  if (a2)
  {
    sub_1DE209038(0, &qword_1F0438980);
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  objc_msgSend(v5, sel_setRecordIDsToDelete_, v9.super.isa);

  return v5;
}

id CKSerializeRecordModificationsOperation.serializeResultBlock.setter(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  void *v7;
  _QWORD v9[6];

  v3 = v2;
  if (!a1)
    return objc_msgSend(v2, sel_setSerializeCompletionBlock_, 0);
  v6 = sub_1DE2090B0();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v9[4] = sub_1DE20B6FC;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1DE20B704;
  v9[3] = &unk_1EA8C9168;
  v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_setSerializeCompletionBlock_, v7);
  _Block_release(v7);
  return (id)sub_1DE204AEC(a1);
}

void CKSerializeRecordModificationsOperation.serializeResultBlock.getter()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v1 = objc_msgSend(v0, sel_serializeCompletionBlock);
  if (v1)
  {
    v2 = v1;
    v3 = sub_1DE2090B0();
    *(_QWORD *)(v3 + 16) = v2;
    v4 = sub_1DE2090B0();
    *(_QWORD *)(v4 + 16) = sub_1DE20B7D4;
    *(_QWORD *)(v4 + 24) = v3;
  }
  sub_1DE20425C();
}

void sub_1DE20B470(uint64_t (**a1)(uint64_t a1)@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);

  CKSerializeRecordModificationsOperation.serializeResultBlock.getter();
  if (v2)
  {
    v4 = v2;
    v5 = v3;
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 16) = v4;
    *(_QWORD *)(v2 + 24) = v5;
    v6 = sub_1DE20900C;
  }
  else
  {
    v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)(uint64_t))v2;
}

id sub_1DE20B4D4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, char);

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_1DE208FB0;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_1DE204B48(v1);
  return CKSerializeRecordModificationsOperation.serializeResultBlock.setter((uint64_t)v4, v3);
}

void sub_1DE20B554(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  Class isa;
  uint64_t v7;
  id v8;

  if (a2 >> 60 != 15)
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    if (a3)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  isa = 0;
  if (!a3)
    goto LABEL_5;
LABEL_3:
  v7 = _convertErrorToNSError(_:)();
LABEL_6:
  v8 = (id)v7;
  (*(void (**)(uint64_t, Class))(a4 + 16))(a4, isa);

}

void sub_1DE20B5D4(void *a1, unint64_t a2, char a3, void (*a4)(void *, unint64_t, void *))
{
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;

  if ((a3 & 1) != 0)
  {
    v8 = a1;
    v9 = 0;
    v10 = 0xF000000000000000;
    v11 = a1;
  }
  else
  {
    sub_1DE1FFB64((uint64_t)a1, a2);
    v9 = a1;
    v10 = a2;
    v11 = 0;
  }
  a4(v9, v10, v11);
  sub_1DE20B878(a1, a2, a3 & 1);
}

void sub_1DE20B64C(uint64_t a1, unint64_t a2, id a3, void (*a4)(id, unint64_t, uint64_t))
{
  id v6;
  uint64_t v7;
  unint64_t v8;

  if (a3)
  {
    v6 = a3;
    a4(a3, 0, 1);

  }
  else
  {
    if (a2 >> 60 == 15)
      v7 = 0;
    else
      v7 = a1;
    if (a2 >> 60 == 15)
      v8 = 0xC000000000000000;
    else
      v8 = a2;
    sub_1DE1FFB50(a1, a2);
    a4((id)v7, v8, 0);
    sub_1DE1FFC54(v7, v8);
  }
}

uint64_t sub_1DE20B6D8()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1DE20B6FC(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;

  sub_1DE20B64C(a1, a2, a3, *(void (**)(id, unint64_t, uint64_t))(v3 + 16));
}

uint64_t sub_1DE20B704(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void (*v5)(void *, unint64_t, void *);
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v4 = a2;
  v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v6 = v4;
    v4 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;

  }
  else
  {
    swift_retain();
    v8 = 0xF000000000000000;
  }
  v9 = a3;
  v5(v4, v8, a3);

  sub_1DE1FFC40((uint64_t)v4, v8);
  return swift_release();
}

uint64_t sub_1DE20B798(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1DE20B7A8()
{
  return swift_release();
}

uint64_t sub_1DE20B7B0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1DE20B7D4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_1DE20B554(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

void sub_1DE20B7DC(void *a1, unint64_t a2, char a3)
{
  uint64_t v3;

  sub_1DE20B5D4(a1, a2, a3 & 1, *(void (**)(void *, unint64_t, void *))(v3 + 16));
}

void CKSerializeRecordModificationsOperation.serializeResultBlock.modify(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  a1[2] = v1;
  CKSerializeRecordModificationsOperation.serializeResultBlock.getter();
  *a1 = v3;
  a1[1] = v4;
  sub_1DE20425C();
}

id sub_1DE20B818(uint64_t *a1, char a2)
{
  uint64_t v2;

  v2 = *a1;
  if ((a2 & 1) == 0)
    return sub_1DE20B890();
  sub_1DE204B48(*a1);
  sub_1DE20B890();
  return (id)sub_1DE204AEC(v2);
}

void sub_1DE20B878(id a1, unint64_t a2, char a3)
{
  if ((a3 & 1) != 0)

  else
    sub_1DE1FFC54((uint64_t)a1, a2);
}

id sub_1DE20B890()
{
  uint64_t v0;
  uint64_t v1;

  return CKSerializeRecordModificationsOperation.serializeResultBlock.setter(v0, v1);
}

void Message.substituteMessages<A>(substitutionType:substitutions:)()
{
  type metadata accessor for SubstitutingVisitor();
}

uint64_t sub_1DE20B8EC(uint64_t a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  void (*v24)(_BYTE *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v35;
  _BYTE v36[96];

  *(_QWORD *)(v5 - 136) = a1;
  *(_QWORD *)(v5 - 160) = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  *(_QWORD *)(v5 - 144) = &v36[-v6];
  v7 = type metadata accessor for Optional();
  *(_QWORD *)(v5 - 208) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v5 - 200) = v7;
  v8 = MEMORY[0x1E0C80A78](v7);
  *(_QWORD *)(v5 - 216) = &v36[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = MEMORY[0x1E0C80A78](v8);
  *(_QWORD *)(v5 - 224) = &v36[-v11];
  v12 = *(_QWORD *)(v3 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = MEMORY[0x1E0C80A78](v10);
  *(_QWORD *)(v5 - 240) = &v36[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = MEMORY[0x1E0C80A78](v14);
  *(_QWORD *)(v5 - 232) = &v36[-v16];
  v17 = MEMORY[0x1E0C80A78](v15);
  v19 = &v36[-v18];
  v20 = MEMORY[0x1E0C80A78](v17);
  v22 = &v36[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v20);
  v24 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v23 + 16);
  *(_QWORD *)(v5 - 176) = v4;
  *(_QWORD *)(v5 - 152) = v24;
  v24(&v36[-v25], v4, v1);
  if (!swift_dynamicCast())
  {
    *(_QWORD *)(v5 - 248) = v12;
    v28 = swift_allocObject();
    swift_bridgeObjectRetain();
    v29 = Array.startIndex.getter();
    *(_QWORD *)(v28 + 16) = v2;
    *(_QWORD *)(v5 - 224) = v28 + 16;
    *(_QWORD *)(v28 + 24) = v29;
    *(_QWORD *)(v5 - 232) = v28 + 24;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v5 - 152))(v22, *(_QWORD *)(v5 - 176), v1);
    v30 = (_QWORD *)swift_allocObject();
    v30[2] = v1;
    v30[3] = v3;
    v31 = *(_QWORD *)(v5 - 184);
    v30[4] = *(_QWORD *)(v5 - 168);
    v30[5] = v31;
    v30[6] = v28;
    sub_1DE223FE0((uint64_t)v22, v1, *(_QWORD *)(v5 - 144));
  }
  (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v19, v3);
  v26 = MEMORY[0x1DF0E9F30](v2, v3);
  if (v26 == 1)
  {
    *(_QWORD *)(v5 - 120) = v2;
    v32 = type metadata accessor for Array();
    MEMORY[0x1DF0EA5C0](MEMORY[0x1E0DEAF50], v32);
    v33 = *(_QWORD *)(v5 - 224);
    Collection.first.getter();
    if (sub_1DE20C080(v33) == 1)
    {
      __break(1u);
      JUMPOUT(0x1DE20BE68);
    }
    sub_1DE20C078(*(_QWORD *)(v5 - 232), v33, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 32));
    return swift_dynamicCast();
  }
  else
  {
    if (v26)
    {
      sub_1DE20C030();
      sub_1DE20C06C();
      *v35 = 1;
    }
    else
    {
      sub_1DE20C030();
      sub_1DE20C06C();
      *v27 = 0;
    }
    return swift_willThrow();
  }
}

uint64_t sub_1DE20BE6C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DE20BE90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Bool IsNativeType;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;

  v6 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  v7 = (uint64_t *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 24);
  if (v8 == MEMORY[0x1DF0E9F48](*(_QWORD *)(a1 + 16), a2))
  {
    v9 = a3;
    v10 = 1;
LABEL_6:
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v9, v10, 1, a2);
    return swift_endAccess();
  }
  v11 = *v7;
  v12 = *v6;
  IsNativeType = Array._hoistableIsNativeTypeChecked()();
  Array._checkSubscript(_:wasNativeTypeChecked:)();
  if (IsNativeType)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, v12+ ((*(unsigned __int8 *)(*(_QWORD *)(a2 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a2 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(a2 - 8) + 72) * v11, a2);
LABEL_5:
    v14 = *v6;
    swift_bridgeObjectRetain();
    MEMORY[0x1DF0E9F54](v7, v14, a2);
    swift_bridgeObjectRelease();
    v9 = a3;
    v10 = 0;
    goto LABEL_6;
  }
  result = _ArrayBuffer._getElementSlowPath(_:)();
  v16 = *(_QWORD *)(a2 - 8);
  if (*(_QWORD *)(v16 + 64) == 8)
  {
    v17 = result;
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v16 + 16))(a3, &v17, a2);
    swift_unknownObjectRelease();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DE20BFFC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DE20C020@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DE20BE90(*(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_1DE20C030()
{
  unint64_t result;

  result = qword_1F0438A60;
  if (!qword_1F0438A60)
  {
    result = MEMORY[0x1DF0EA5C0](&unk_1DE227A80, &type metadata for SubstitutingVisitorError);
    atomic_store(result, (unint64_t *)&qword_1F0438A60);
  }
  return result;
}

uint64_t sub_1DE20C06C()
{
  return swift_allocError();
}

uint64_t sub_1DE20C078@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t sub_1DE20C080(uint64_t a1)
{
  uint64_t v1;

  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(a1, 1, v1);
}

void Ckcode_ProtectedEnvelope.contents.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_1DE20EA10(v1, a1, (uint64_t *)&unk_1EDB822A0);
}

uint64_t Ckcode_ProtectedEnvelope.contents.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_1DE20C0B8(a1, v1);
}

uint64_t sub_1DE20C0B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*Ckcode_ProtectedEnvelope.contents.modify())(_QWORD)
{
  return nullsub_1;
}

void Ckcode_ProtectedEnvelope.encrypted.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  int EnumCaseMultiPayload;

  sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
  sub_1DE2041AC();
  MEMORY[0x1E0C80A78](v2);
  sub_1DE20430C();
  sub_1DE20EA10(v1, v0, (uint64_t *)&unk_1EDB822A0);
  v3 = sub_1DE20EA5C();
  v4 = sub_1DE2043B4(v0, 1, v3);
  if (v5)
  {
    sub_1DE20EAB8(v4, (uint64_t *)&unk_1EDB822A0);
  }
  else
  {
    sub_1DE204208();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
      sub_1DE20EACC();
  }
  sub_1DE2041D0();
}

uint64_t type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(uint64_t a1)
{
  return sub_1DE20064C(a1, qword_1EDB82288);
}

uint64_t sub_1DE20C1C4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DE20C200(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  sub_1DE1FFB64(*a1, v2);
  return Ckcode_ProtectedEnvelope.encrypted.setter(v1, v2);
}

uint64_t Ckcode_ProtectedEnvelope.encrypted.setter(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_1DE20EA84(a1, (uint64_t *)&unk_1EDB822A0);
  *v2 = a1;
  v2[1] = a2;
  type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  sub_1DE2041FC();
  swift_storeEnumTagMultiPayload();
  v5 = sub_1DE204418();
  return sub_1DE2041C4(v5, v6, v7, v8);
}

void Ckcode_ProtectedEnvelope.encrypted.modify(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  __int128 *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  int v10;
  __int128 v11;

  v2 = v1;
  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[2] = v2;
  v5 = sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
  v6 = (__int128 *)sub_1DE204440(v5);
  v4[3] = v6;
  sub_1DE20EA74();
  v7 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  v4[4] = v7;
  v8 = sub_1DE2043B4((uint64_t)v6, 1, v7);
  if (v9)
  {
    sub_1DE20EA84(v8, (uint64_t *)&unk_1EDB822A0);
  }
  else
  {
    v10 = sub_1DE204400();
    if (v10 != 1)
    {
      v11 = *v6;
      goto LABEL_8;
    }
    sub_1DE20C1C4((uint64_t)v6);
  }
  v11 = xmmword_1DE226510;
LABEL_8:
  *(_OWORD *)v4 = v11;
  sub_1DE2041D0();
}

void sub_1DE20C348(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  uint64_t v4;

  v2 = *a1;
  v3 = (void *)(*a1)[3];
  v4 = (*a1)[2];
  if ((a2 & 1) != 0)
  {
    sub_1DE1FFB64(**a1, (*a1)[1]);
    sub_1DE20E9D8(v4, (uint64_t *)&unk_1EDB822A0);
    sub_1DE204264();
    sub_1DE2042CC();
    sub_1DE1FFC54(*v2, v2[1]);
  }
  else
  {
    sub_1DE20E9D8((*a1)[2], (uint64_t *)&unk_1EDB822A0);
    sub_1DE204264();
    sub_1DE2042CC();
  }
  free(v3);
  free(v2);
}

uint64_t Ckcode_ProtectedEnvelope.value.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  int v7;
  uint64_t v8;

  sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
  sub_1DE2041AC();
  MEMORY[0x1E0C80A78](v0);
  sub_1DE2042FC();
  v3 = v2 - v1;
  sub_1DE20EA74();
  v4 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  v5 = sub_1DE2043B4(v3, 1, v4);
  if (v6)
  {
    sub_1DE20EA84(v5, (uint64_t *)&unk_1EDB822A0);
  }
  else
  {
    v7 = sub_1DE204400();
    if (v7 == 1)
    {
      v8 = sub_1DE20EA94();
      return sub_1DE20EAC0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32));
    }
    sub_1DE20C1C4(v3);
  }
  return Google_Protobuf_Any.init()();
}

uint64_t sub_1DE20C498(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = type metadata accessor for Google_Protobuf_Any();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return Ckcode_ProtectedEnvelope.value.setter((uint64_t)v4);
}

uint64_t Ckcode_ProtectedEnvelope.value.setter(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1DE20EA84(a1, (uint64_t *)&unk_1EDB822A0);
  sub_1DE20EA94();
  v1 = sub_1DE2041FC();
  v2(v1);
  type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  sub_1DE2041FC();
  swift_storeEnumTagMultiPayload();
  v3 = sub_1DE204418();
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v3, v4, v5, v6);
}

void (*Ckcode_ProtectedEnvelope.value.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  int EnumCaseMultiPayload;

  v2 = v1;
  v4 = malloc(0x38uLL);
  *a1 = v4;
  *v4 = v1;
  v5 = sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
  v6 = sub_1DE204440(v5);
  v4[1] = v6;
  v7 = sub_1DE20EA94();
  v4[2] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v4[3] = v8;
  v9 = *(_QWORD *)(v8 + 64);
  v4[4] = malloc(v9);
  v10 = malloc(v9);
  v4[5] = v10;
  sub_1DE20EA10(v2, (uint64_t)v6, (uint64_t *)&unk_1EDB822A0);
  v11 = sub_1DE20EA5C();
  v4[6] = v11;
  v12 = sub_1DE2043B4((uint64_t)v6, 1, v11);
  if (v13)
  {
    sub_1DE20EAB8(v12, (uint64_t *)&unk_1EDB822A0);
LABEL_7:
    Google_Protobuf_Any.init()();
    return sub_1DE20C690;
  }
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload != 1)
  {
    sub_1DE20EACC();
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v8 + 32))(v10, v6, v7);
  return sub_1DE20C690;
}

void sub_1DE20C690(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *a1;
  v3 = (void *)(*a1)[5];
  v5 = (*a1)[3];
  v4 = (void *)(*a1)[4];
  v6 = (void *)(*a1)[1];
  v7 = (*a1)[2];
  v8 = **a1;
  if ((a2 & 1) != 0)
  {
    sub_1DE20C078((*a1)[4], (uint64_t)v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
    sub_1DE20E9D8(v8, (uint64_t *)&unk_1EDB822A0);
    sub_1DE20C078(v8, (uint64_t)v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32));
    sub_1DE20EA64();
    sub_1DE20EA48();
    (*(void (**)(void *, uint64_t))(v5 + 8))(v3, v7);
  }
  else
  {
    sub_1DE20E9D8(**a1, (uint64_t *)&unk_1EDB822A0);
    sub_1DE20C078(v8, (uint64_t)v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32));
    sub_1DE20EA64();
    sub_1DE20EA48();
  }
  free(v3);
  free(v4);
  free(v6);
  free(v2);
}

uint64_t Ckcode_ProtectedEnvelope.unknownFields.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  type metadata accessor for Ckcode_ProtectedEnvelope(0);
  sub_1DE2041F4();
  v0 = sub_1DE204208();
  return sub_1DE2041BC(v0, v1, v2, v3);
}

uint64_t type metadata accessor for Ckcode_ProtectedEnvelope(uint64_t a1)
{
  return sub_1DE20064C(a1, (uint64_t *)&unk_1EDB822C0);
}

uint64_t Ckcode_ProtectedEnvelope.unknownFields.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  type metadata accessor for Ckcode_ProtectedEnvelope(0);
  sub_1DE2041F4();
  v0 = sub_1DE2041FC();
  return sub_1DE2041BC(v0, v1, v2, v3);
}

uint64_t (*Ckcode_ProtectedEnvelope.unknownFields.modify())(_QWORD)
{
  type metadata accessor for Ckcode_ProtectedEnvelope(0);
  return nullsub_1;
}

void static Ckcode_ProtectedEnvelope.OneOf_Contents.== infix(_:_:)(uint64_t a1, uint64_t a2)
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;

  v5 = sub_1DE20EA94();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  sub_1DE2042FC();
  v9 = v8 - v7;
  sub_1DE20EA5C();
  sub_1DE2041AC();
  MEMORY[0x1E0C80A78](v10);
  sub_1DE204214();
  v13 = v11 - v12;
  MEMORY[0x1E0C80A78](v14);
  v16 = (uint64_t *)((char *)&v26 - v15);
  sub_1DE1FFE88(&qword_1F0438AA0);
  sub_1DE2041AC();
  MEMORY[0x1E0C80A78](v17);
  sub_1DE20430C();
  v19 = (uint64_t *)(v2 + *(int *)(v18 + 48));
  sub_1DE20C9E4(a1, v2);
  sub_1DE20C9E4(a2, (uint64_t)v19);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1DE20C9E4(v2, v13);
    if (sub_1DE20EAA4() == 1)
    {
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(v6 + 32))(v9, v19, v5);
      static Google_Protobuf_Any.== infix(_:_:)();
      v20 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
      v20(v9, v5);
      v20(v13, v5);
LABEL_9:
      sub_1DE20EACC();
      goto LABEL_10;
    }
    v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v13, v5);
  }
  else
  {
    sub_1DE20C9E4(v2, (uint64_t)v16);
    v21 = *v16;
    v22 = v16[1];
    if (sub_1DE20EAA4() != 1)
    {
      v24 = *v19;
      v25 = v19[1];
      MEMORY[0x1DF0E9C30](v21, v22, *v19, v25);
      sub_1DE1FFC54(v24, v25);
      sub_1DE20440C();
      goto LABEL_9;
    }
    v23 = sub_1DE20440C();
  }
  sub_1DE20EAB8(v23, &qword_1F0438AA0);
LABEL_10:
  sub_1DE2041DC();
}

uint64_t sub_1DE20C9E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void Ckcode_ProtectedEnvelope.init()(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_1DE20EA5C();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(a1, 1, 1, v2);
  type metadata accessor for Ckcode_ProtectedEnvelope(0);
  UnknownStorage.init()();
  sub_1DE20425C();
}

void sub_1DE20CA70()
{
  qword_1F0438A68 = 0x65646F636B63;
  unk_1F0438A70 = 0xE600000000000000;
}

uint64_t sub_1DE20CA90()
{
  uint64_t result;

  if (qword_1F0438678 != -1)
    result = swift_once();
  qword_1F0438A78 = 0xD000000000000018;
  unk_1F0438A80 = 0x80000001DE22AC30;
  return result;
}

uint64_t static Ckcode_ProtectedEnvelope.protoMessageName.getter()
{
  if (qword_1F0438680 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_1DE204208();
}

uint64_t sub_1DE20CB44()
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
  sub_1DE203EFC(v0, qword_1F0438A88);
  sub_1DE2025D4(v0, (uint64_t)qword_1F0438A88);
  sub_1DE1FFE88(&qword_1F0438760);
  v1 = sub_1DE1FFE88(&qword_1F0438768);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DE226520;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "encrypted";
  *(_QWORD *)(v7 + 8) = 9;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF08];
  v9 = type metadata accessor for _NameMap.NameDescription();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "value";
  *((_QWORD *)v11 + 1) = 5;
  v11[16] = 2;
  v10();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t static Ckcode_ProtectedEnvelope._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F0438688 != -1)
    swift_once();
  v2 = type metadata accessor for _NameMap();
  v3 = sub_1DE2025D4(v2, (uint64_t)qword_1F0438A88);
  return sub_1DE2041BC(a1, v3, v2, *(uint64_t (**)(void))(*(_QWORD *)(v2 - 8) + 16));
}

void Ckcode_ProtectedEnvelope.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  char v7;
  uint64_t v8;
  __int128 *v9;
  uint64_t v10;
  uint64_t v11;

  while (1)
  {
    v6 = dispatch thunk of Decoder.nextFieldNumber()();
    if (v3 || (v7 & 1) != 0)
      break;
    if (v6 == 2)
    {
      v10 = sub_1DE204208();
      sub_1DE20CF2C(v10, v11, a2, a3);
    }
    else if (v6 == 1)
    {
      v8 = sub_1DE2041FC();
      sub_1DE20CD8C(v8, v9);
    }
  }
}

uint64_t sub_1DE20CD8C(uint64_t a1, __int128 *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  __int128 v8;
  int v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v4 = sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = xmmword_1DE226500;
  result = dispatch thunk of Decoder.decodeSingularBytesField(value:)();
  v8 = v11;
  if (v2)
    return sub_1DE1FFC40(v11, *((unint64_t *)&v11 + 1));
  if (*((_QWORD *)&v11 + 1) >> 60 != 15)
  {
    sub_1DE20EA10((uint64_t)a2, (uint64_t)v6, (uint64_t *)&unk_1EDB822A0);
    v12 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
    v9 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v6, 1, v12);
    sub_1DE1FFB64(v8, *((unint64_t *)&v8 + 1));
    sub_1DE20E9D8((uint64_t)v6, (uint64_t *)&unk_1EDB822A0);
    if (v9 != 1)
      dispatch thunk of Decoder.handleConflictingOneOf()();
    sub_1DE1FFC40(v8, *((unint64_t *)&v8 + 1));
    sub_1DE20E9D8((uint64_t)a2, (uint64_t *)&unk_1EDB822A0);
    *a2 = v8;
    v10 = v12;
    swift_storeEnumTagMultiPayload();
    return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a2, 0, 1, v10);
  }
  return result;
}

void sub_1DE20CF2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  int v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
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

  v38 = a3;
  v39 = a4;
  v40 = a2;
  v5 = type metadata accessor for Google_Protobuf_Any();
  v36 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x1E0C80A78](v5);
  v35 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v32 - v8;
  v10 = sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v32 - v17;
  v19 = sub_1DE1FFE88((uint64_t *)&unk_1F0438AC8);
  v20 = MEMORY[0x1E0C80A78](v19);
  v22 = (char *)&v32 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v20);
  v24 = (char *)&v32 - v23;
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)&v32 - v23, 1, 1, v5);
  v34 = a1;
  sub_1DE20EA10(a1, (uint64_t)v12, (uint64_t *)&unk_1EDB822A0);
  v25 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v12, 1, v13);
  v33 = v13;
  if (v25 == 1)
  {
    sub_1DE20E9D8((uint64_t)v12, (uint64_t *)&unk_1EDB822A0);
  }
  else
  {
    sub_1DE20D9D8((uint64_t)v12, (uint64_t)v18);
    sub_1DE20D9D8((uint64_t)v18, (uint64_t)v16);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_1DE20E9D8((uint64_t)v24, (uint64_t *)&unk_1F0438AC8);
      v26 = *(void (**)(char *, char *, uint64_t))(v36 + 32);
      v26(v9, v16, v5);
      v26(v24, v9, v5);
      _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v24, 0, 1, v5);
    }
    else
    {
      sub_1DE20C1C4((uint64_t)v16);
    }
  }
  v27 = v37;
  sub_1DE2025EC(&qword_1EDB81A10, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E828], MEMORY[0x1E0D3E818]);
  dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
  if (v27)
  {
    v28 = (uint64_t)v24;
LABEL_10:
    sub_1DE20E9D8(v28, (uint64_t *)&unk_1F0438AC8);
    return;
  }
  sub_1DE20EA10((uint64_t)v24, (uint64_t)v22, (uint64_t *)&unk_1F0438AC8);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v22, 1, v5) == 1)
  {
    sub_1DE20E9D8((uint64_t)v24, (uint64_t *)&unk_1F0438AC8);
    v28 = (uint64_t)v22;
    goto LABEL_10;
  }
  v29 = *(void (**)(char *, char *, uint64_t))(v36 + 32);
  v29(v35, v22, v5);
  if (v25 != 1)
    dispatch thunk of Decoder.handleConflictingOneOf()();
  sub_1DE20E9D8((uint64_t)v24, (uint64_t *)&unk_1F0438AC8);
  v30 = v34;
  sub_1DE20E9D8(v34, (uint64_t *)&unk_1EDB822A0);
  v29((char *)v30, v35, v5);
  v31 = v33;
  swift_storeEnumTagMultiPayload();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v30, 0, 1, v31);
}

void Ckcode_ProtectedEnvelope.traverse<A>(visitor:)()
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

  sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
  sub_1DE2041AC();
  MEMORY[0x1E0C80A78](v2);
  sub_1DE2042FC();
  v5 = v4 - v3;
  sub_1DE20EA10(v0, v4 - v3, (uint64_t *)&unk_1EDB822A0);
  v6 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v5, 1, v6) == 1)
    goto LABEL_2;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_1DE2043C8();
    sub_1DE20D534(v7, v8, v9, v10);
    sub_1DE20C1C4(v5);
    if (!v1)
    {
LABEL_2:
      type metadata accessor for Ckcode_ProtectedEnvelope(0);
      UnknownStorage.traverse<A>(visitor:)();
    }
  }
  else
  {
    sub_1DE20C1C4(v5);
    v11 = sub_1DE2043C8();
    sub_1DE20D414(v11);
    if (!v1)
      goto LABEL_2;
  }
}

void sub_1DE20D414(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (uint64_t *)((char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1DE20EA10(a1, (uint64_t)v4, (uint64_t *)&unk_1EDB822A0);
  v5 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v4, 1, v5) == 1)
  {
    sub_1DE20E9D8((uint64_t)v4, (uint64_t *)&unk_1EDB822A0);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      v7 = *v4;
      v6 = v4[1];
      dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
      sub_1DE1FFC54(v7, v6);
      return;
    }
    sub_1DE20C1C4((uint64_t)v4);
  }
  __break(1u);
}

void sub_1DE20D534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  v5 = sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Google_Protobuf_Any();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DE20EA10(a1, (uint64_t)v7, (uint64_t *)&unk_1EDB822A0);
  v12 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v7, 1, v12) == 1)
  {
    sub_1DE20E9D8((uint64_t)v7, (uint64_t *)&unk_1EDB822A0);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
      sub_1DE2025EC(&qword_1EDB81A10, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E828], MEMORY[0x1E0D3E818]);
      dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      return;
    }
    sub_1DE20C1C4((uint64_t)v7);
  }
  __break(1u);
}

void static Ckcode_ProtectedEnvelope.== infix(_:_:)(uint64_t a1, uint64_t a2)
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
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char v29;
  char v30;
  char v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  char *v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;

  v39 = sub_1DE2041F4();
  v44 = *(_QWORD *)(v39 - 8);
  MEMORY[0x1E0C80A78](v39);
  sub_1DE204214();
  v43 = (char *)(v4 - v5);
  MEMORY[0x1E0C80A78](v6);
  v41 = (char *)&v39 - v7;
  v8 = sub_1DE20EA5C();
  sub_1DE2041AC();
  MEMORY[0x1E0C80A78](v9);
  sub_1DE2042FC();
  v12 = v11 - v10;
  v13 = sub_1DE1FFE88(&qword_1F0438AA8);
  sub_1DE2041AC();
  MEMORY[0x1E0C80A78](v14);
  sub_1DE2042FC();
  v17 = v16 - v15;
  sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
  sub_1DE2041AC();
  MEMORY[0x1E0C80A78](v18);
  sub_1DE204214();
  v21 = v19 - v20;
  v23 = MEMORY[0x1E0C80A78](v22);
  v25 = (char *)&v39 - v24;
  MEMORY[0x1E0C80A78](v23);
  v27 = (char *)&v39 - v26;
  v40 = a1;
  sub_1DE20EA8C(a1, (uint64_t)&v39 - v26);
  v42 = a2;
  sub_1DE20EA8C(a2, (uint64_t)v25);
  v28 = v17 + *(int *)(v13 + 48);
  sub_1DE20EA8C((uint64_t)v27, v17);
  sub_1DE20EA8C((uint64_t)v25, v28);
  sub_1DE2043B4(v17, 1, v8);
  if (v29)
  {
    sub_1DE20EA9C((uint64_t)v25);
    sub_1DE20EA9C((uint64_t)v27);
    sub_1DE2043B4(v28, 1, v8);
    if (v29)
    {
      sub_1DE20E9D8(v17, (uint64_t *)&unk_1EDB822A0);
LABEL_11:
      v32 = type metadata accessor for Ckcode_ProtectedEnvelope(0);
      v33 = v41;
      v34 = v44;
      v35 = *(void (**)(char *, uint64_t, uint64_t))(v44 + 16);
      v36 = v39;
      v35(v41, v40 + *(int *)(v32 + 20), v39);
      v37 = v43;
      v35(v43, v42 + *(int *)(v32 + 20), v36);
      sub_1DE2025EC(&qword_1F04386B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E998], MEMORY[0x1E0D3E9A8]);
      dispatch thunk of static Equatable.== infix(_:_:)();
      v38 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
      v38((uint64_t)v37, v36);
      v38((uint64_t)v33, v36);
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  sub_1DE20EA10(v17, v21, (uint64_t *)&unk_1EDB822A0);
  sub_1DE2043B4(v28, 1, v8);
  if (v29)
  {
    sub_1DE20EA9C((uint64_t)v25);
    sub_1DE20EA9C((uint64_t)v27);
    sub_1DE20C1C4(v21);
LABEL_9:
    sub_1DE20E9D8(v17, &qword_1F0438AA8);
    goto LABEL_12;
  }
  sub_1DE20D9D8(v28, v12);
  static Ckcode_ProtectedEnvelope.OneOf_Contents.== infix(_:_:)(v21, v12);
  v31 = v30;
  sub_1DE20C1C4(v12);
  sub_1DE20EAB0((uint64_t)v25);
  sub_1DE20EAB0((uint64_t)v27);
  sub_1DE20C1C4(v21);
  sub_1DE20EAB0(v17);
  if ((v31 & 1) != 0)
    goto LABEL_11;
LABEL_12:
  sub_1DE2041DC();
}

uint64_t sub_1DE20D9D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

Swift::Int Ckcode_ProtectedEnvelope.hashValue.getter()
{
  Hasher.init(_seed:)();
  type metadata accessor for Ckcode_ProtectedEnvelope(0);
  sub_1DE2025EC(&qword_1F0438AB0, type metadata accessor for Ckcode_ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_ProtectedEnvelope);
  dispatch thunk of Hashable.hash(into:)();
  return Hasher._finalize()();
}

void sub_1DE20DA98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Ckcode_ProtectedEnvelope.decodeMessage<A>(decoder:)(a1, a2, a3);
}

void sub_1DE20DAAC()
{
  Ckcode_ProtectedEnvelope.traverse<A>(visitor:)();
}

uint64_t sub_1DE20DAC0()
{
  sub_1DE2025EC(&qword_1F0438AC0, type metadata accessor for Ckcode_ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_ProtectedEnvelope);
  return _MessageImplementationBase.isEqualTo(message:)();
}

uint64_t sub_1DE20DB14()
{
  sub_1DE2025EC(&qword_1EDB822B0, type metadata accessor for Ckcode_ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_ProtectedEnvelope);
  return Message.debugDescription.getter();
}

uint64_t sub_1DE20DB58()
{
  sub_1DE2025EC(&qword_1EDB822B0, type metadata accessor for Ckcode_ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_ProtectedEnvelope);
  return Message.hash(into:)();
}

void sub_1DE20DBA8()
{
  sub_1DE2025EC(&qword_1EDB822B8, type metadata accessor for Ckcode_ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_ProtectedEnvelope);
}

void sub_1DE20DBD4()
{
  sub_1DE2025EC(&qword_1EDB822B0, type metadata accessor for Ckcode_ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_ProtectedEnvelope);
}

void sub_1DE20DC00()
{
  sub_1DE2025EC(&qword_1F0438AB0, type metadata accessor for Ckcode_ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_ProtectedEnvelope);
}

void sub_1DE20DC2C()
{
  sub_1DE2025EC(&qword_1F0438AB8, type metadata accessor for Ckcode_ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_ProtectedEnvelope);
}

void sub_1DE20DC5C(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  Ckcode_ProtectedEnvelope.encrypted.getter();
  *a1 = v2;
  a1[1] = v3;
  sub_1DE20425C();
}

void sub_1DE20DC84()
{
  Ckcode_ProtectedEnvelope.value.getter();
  sub_1DE20425C();
}

uint64_t *initializeBufferWithCopyOfBuffer for Ckcode_ProtectedEnvelope(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
    if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v7))
    {
      v8 = sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v10 = type metadata accessor for Google_Protobuf_Any();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
      }
      else
      {
        v11 = *a2;
        v12 = a2[1];
        sub_1DE1FFB64(*a2, v12);
        *a1 = v11;
        a1[1] = v12;
      }
      swift_storeEnumTagMultiPayload();
      _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v7);
    }
    v13 = *(int *)(a3 + 20);
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t destroy for Ckcode_ProtectedEnvelope(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  if (!_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(a1, 1, v4))
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v5 = type metadata accessor for Google_Protobuf_Any();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
    }
    else
    {
      sub_1DE1FFC54(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
    }
  }
  v6 = a1 + *(int *)(a2 + 20);
  v7 = type metadata accessor for UnknownStorage();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

_QWORD *initializeWithCopy for Ckcode_ProtectedEnvelope(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v6 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v6))
  {
    v7 = sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v8 = type metadata accessor for Google_Protobuf_Any();
      (*(void (**)(_QWORD *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    }
    else
    {
      v9 = *a2;
      v10 = a2[1];
      sub_1DE1FFB64(*a2, v10);
      *a1 = v9;
      a1[1] = v10;
    }
    swift_storeEnumTagMultiPayload();
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
  }
  v11 = *(int *)(a3 + 20);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t *assignWithCopy for Ckcode_ProtectedEnvelope(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  v7 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a1, 1, v6);
  v8 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v6);
  if (v7)
  {
    if (!v8)
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v9 = type metadata accessor for Google_Protobuf_Any();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
      }
      else
      {
        v12 = *a2;
        v13 = a2[1];
        sub_1DE1FFB64(*a2, v13);
        *a1 = v12;
        a1[1] = v13;
      }
      swift_storeEnumTagMultiPayload();
      _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
      goto LABEL_15;
    }
LABEL_7:
    v10 = sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_15;
  }
  if (v8)
  {
    sub_1DE20C1C4((uint64_t)a1);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_1DE20C1C4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = type metadata accessor for Google_Protobuf_Any();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
    }
    else
    {
      v14 = *a2;
      v15 = a2[1];
      sub_1DE1FFB64(*a2, v15);
      *a1 = v14;
      a1[1] = v15;
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_15:
  v16 = *(int *)(a3 + 20);
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

char *initializeWithTake for Ckcode_ProtectedEnvelope(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v6))
  {
    v7 = sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v8 = type metadata accessor for Google_Protobuf_Any();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
  }
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  return a1;
}

char *assignWithTake for Ckcode_ProtectedEnvelope(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v6 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  v7 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a1, 1, v6);
  v8 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v6);
  if (!v7)
  {
    if (!v8)
    {
      if (a1 == a2)
        goto LABEL_14;
      sub_1DE20C1C4((uint64_t)a1);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v11 = type metadata accessor for Google_Protobuf_Any();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v10 = *(_QWORD *)(v6 - 8);
      goto LABEL_8;
    }
    sub_1DE20C1C4((uint64_t)a1);
LABEL_7:
    v10 = *(_QWORD *)(sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0) - 8);
LABEL_8:
    memcpy(a1, a2, *(_QWORD *)(v10 + 64));
    goto LABEL_14;
  }
  if (v8)
    goto LABEL_7;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = type metadata accessor for Google_Protobuf_Any();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
LABEL_14:
  v12 = *(int *)(a3 + 20);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for Ckcode_ProtectedEnvelope()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DE20E438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    v7 = sub_1DE2041F4();
    v8 = a1 + *(int *)(a3 + 20);
  }
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for Ckcode_ProtectedEnvelope()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DE20E4AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    v9 = sub_1DE2041F4();
    v10 = a1 + *(int *)(a4 + 20);
  }
  return sub_1DE2041C4(v10, a2, a2, v9);
}

void sub_1DE20E514()
{
  unint64_t v0;
  unint64_t v1;

  sub_1DE20E598();
  if (v0 <= 0x3F)
  {
    type metadata accessor for UnknownStorage();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_1DE20E598()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EDB822D8)
  {
    type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(255);
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EDB822D8);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for Ckcode_ProtectedEnvelope.OneOf_Contents(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = type metadata accessor for Google_Protobuf_Any();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      v9 = *a2;
      v8 = a2[1];
      sub_1DE1FFB64(v9, v8);
      *a1 = v9;
      a1[1] = v8;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for Ckcode_ProtectedEnvelope.OneOf_Contents(uint64_t a1)
{
  uint64_t v2;

  if (swift_getEnumCaseMultiPayload() != 1)
    return sub_1DE1FFC54(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  v2 = type metadata accessor for Google_Protobuf_Any();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t *initializeWithCopy for Ckcode_ProtectedEnvelope.OneOf_Contents(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = type metadata accessor for Google_Protobuf_Any();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    v6 = *a2;
    v5 = a2[1];
    sub_1DE1FFB64(v6, v5);
    *a1 = v6;
    a1[1] = v5;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t *assignWithCopy for Ckcode_ProtectedEnvelope.OneOf_Contents(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (a1 != a2)
  {
    sub_1DE20C1C4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = type metadata accessor for Google_Protobuf_Any();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      v6 = *a2;
      v5 = a2[1];
      sub_1DE1FFB64(v6, v5);
      *a1 = v6;
      a1[1] = v5;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for Ckcode_ProtectedEnvelope.OneOf_Contents(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = type metadata accessor for Google_Protobuf_Any();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for Ckcode_ProtectedEnvelope.OneOf_Contents(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_1DE20C1C4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = type metadata accessor for Google_Protobuf_Any();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1DE20E968()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Google_Protobuf_Any();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void sub_1DE20E9D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1DE1FFE88(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  sub_1DE20425C();
}

void sub_1DE20EA10(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_1DE1FFE88(a3);
  sub_1DE20EAC0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  sub_1DE20425C();
}

uint64_t sub_1DE20EA48()
{
  uint64_t v0;
  uint64_t v1;

  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v1, 0, 1, v0);
}

uint64_t sub_1DE20EA5C()
{
  return type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
}

uint64_t sub_1DE20EA64()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_1DE20EA74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;

  sub_1DE20EA10(v1, v0, v2);
}

void sub_1DE20EA84(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1DE20E9D8(v2, a2);
}

void sub_1DE20EA8C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1DE20EA10(a1, a2, v2);
}

uint64_t sub_1DE20EA94()
{
  return type metadata accessor for Google_Protobuf_Any();
}

void sub_1DE20EA9C(uint64_t a1)
{
  uint64_t *v1;

  sub_1DE20E9D8(a1, v1);
}

uint64_t sub_1DE20EAA4()
{
  return swift_getEnumCaseMultiPayload();
}

void sub_1DE20EAB0(uint64_t a1)
{
  uint64_t *v1;

  sub_1DE20E9D8(a1, v1);
}

void sub_1DE20EAB8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1DE20E9D8(v2, a2);
}

uint64_t sub_1DE20EAC0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_1DE20EACC()
{
  uint64_t v0;

  return sub_1DE20C1C4(v0);
}

uint64_t sub_1DE20EAD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  *(_QWORD *)(v5 + 32) = a3;
  *(_QWORD *)(v5 + 40) = a4;
  *(_BYTE *)(v5 + 48) = a5;
  return v5;
}

void sub_1DE20EAE8()
{
  type metadata accessor for CodeOperation.DestinationServer();
}

void sub_1DE20EB3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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
  char *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  sub_1DE20ED60();
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&a9 - v17;
  type metadata accessor for Optional();
  sub_1DE20ED60();
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&a9 - v20;
  *(_QWORD *)(v15 - 152) = *(_QWORD *)(v9 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))((char *)&a9 - v20, v11, v14);
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v21, 0, 1, v14);
  v22 = *(unsigned __int8 *)(v9 + 48);
  v23 = type metadata accessor for URL();
  if (v22)
    v24 = 2;
  else
    v24 = 1;
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v18, v24, 2, v23);
  *(_QWORD *)(v15 - 112) = v14;
  *(_QWORD *)(v15 - 104) = v13;
  *(_QWORD *)(v15 - 96) = v12;
  *(_QWORD *)(v15 - 88) = v10;
  type metadata accessor for CodeOperation();
}

void sub_1DE20EBF0()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  CodeOperation.__allocating_init(service:functionName:request:destinationServer:)();
}

void sub_1DE20EC28(void *a1)
{
  uint64_t v1;
  id v3;

  swift_retain();
  sub_1DE210754();
  objc_msgSend(a1, sel_configureConvenience_, 0);
  v3 = objc_msgSend(*(id *)(v1 + 32), sel_databaseWithDatabaseScope_, *(_QWORD *)(v1 + 40));
  objc_msgSend(v3, sel_addOperation_, a1);

}

uint64_t CodeConnection.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return v0;
}

uint64_t CodeConnection.__deallocating_deinit()
{
  CodeConnection.deinit();
  return swift_deallocClassInstance();
}

void sub_1DE20ECF0()
{
  sub_1DE20EAE8();
}

uint64_t type metadata accessor for CodeConnection()
{
  return objc_opt_self();
}

uint64_t method lookup function for CodeConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CodeConnection.invoke<A, B>(function:request:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

void CodeOperation.__allocating_init(service:functionName:request:destinationServer:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1DE2170C4();
  v0 = sub_1DE21726C();
  CodeOperation.init(service:functionName:request:destinationServer:)(v0, v1, v2, v3, v4);
}

void sub_1DE20EDA0()
{
  sub_1DE217068();
}

void sub_1DE20EDA8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = type metadata accessor for Optional();
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v5 - v4, a1);
  sub_1DE20EE70();
}

void sub_1DE20EE2C()
{
  uint64_t v0;
  uint64_t v1;

  sub_1DE2174E4();
  sub_1DE217330(v0);
  sub_1DE216F58();
  v1 = sub_1DE217320();
  sub_1DE204238(v1);
  sub_1DE216F80();
}

void sub_1DE20EE70()
{
  uint64_t *v0;
  uint64_t v1;

  sub_1DE217330(*v0);
  sub_1DE216F58();
  v1 = sub_1DE217320();
  sub_1DE217188(v1);
  swift_endAccess();
  sub_1DE216F80();
}

void sub_1DE20EEC0()
{
  sub_1DE217098();
  sub_1DE216F58();
  sub_1DE20425C();
}

void sub_1DE20EF08()
{
  uint64_t v0;
  uint64_t v1;

  sub_1DE2174E4();
  sub_1DE217348(v0);
  sub_1DE216F58();
  v1 = sub_1DE217320();
  sub_1DE204238(v1);
  sub_1DE216F80();
}

void sub_1DE20EF4C()
{
  uint64_t *v0;
  uint64_t v1;

  sub_1DE217348(*v0);
  sub_1DE216F58();
  v1 = sub_1DE217320();
  sub_1DE217188(v1);
  swift_endAccess();
  sub_1DE216F80();
}

void sub_1DE20EF9C()
{
  sub_1DE2172F8();
  sub_1DE204208();
  sub_1DE20425C();
}

void sub_1DE20EFD0()
{
  sub_1DE2172F8();
  sub_1DE204208();
  sub_1DE20425C();
}

void sub_1DE20F004()
{
  sub_1DE2174E4();
  sub_1DE21716C();
  type metadata accessor for CodeOperation.DestinationServer();
}

void sub_1DE20F03C(uint64_t a1)
{
  sub_1DE204238(a1);
  sub_1DE217040();
}

uint64_t sub_1DE20F048()
{
  return sub_1DE217240();
}

uint64_t sub_1DE20F064(uint64_t a1)
{
  return sub_1DE2170B4(a1);
}

uint64_t sub_1DE20F080()
{
  return sub_1DE217240();
}

uint64_t sub_1DE20F09C(uint64_t a1)
{
  return sub_1DE2170B4(a1);
}

void sub_1DE20F0B8()
{
  _QWORD *v0;
  id v1;

  v1 = *(id *)((char *)v0 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8));
  sub_1DE20425C();
}

void sub_1DE20F0F4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0xA8);
  v3 = *(void **)((char *)v1 + v2);
  *(_QWORD *)((char *)v1 + v2) = a1;

}

double sub_1DE20F11C@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  char v5;

  sub_1DE20F1AC();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_1DE20F15C(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v6[4];
  char v7;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_BYTE *)(a1 + 32);
  v6[0] = *(_QWORD *)a1;
  v6[1] = v1;
  v6[2] = v2;
  v6[3] = v3;
  v7 = v4;
  sub_1DE20FE6C(v6[0], v1, v2, v3, v4);
  return sub_1DE20F20C(v6);
}

void sub_1DE20F1AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  sub_1DE2174E4();
  v3 = v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & v2) + 0xB0);
  sub_1DE216F58();
  v4 = *(_QWORD *)v3;
  v5 = *(_QWORD *)(v3 + 8);
  v6 = *(_QWORD *)(v3 + 16);
  v7 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)v0 = *(_QWORD *)v3;
  *(_QWORD *)(v0 + 8) = v5;
  *(_QWORD *)(v0 + 16) = v6;
  *(_QWORD *)(v0 + 24) = v7;
  v8 = *(_BYTE *)(v3 + 32);
  *(_BYTE *)(v0 + 32) = v8;
  sub_1DE20FE6C(v4, v5, v6, v7, v8);
  sub_1DE217040();
}

uint64_t sub_1DE20F20C(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v12;

  v2 = *a1;
  v12 = *(_OWORD *)(a1 + 1);
  v3 = a1[3];
  v4 = *((_BYTE *)a1 + 32);
  v5 = (char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0xB0);
  sub_1DE216F58();
  v6 = *(_QWORD *)v5;
  v7 = *((_QWORD *)v5 + 1);
  v8 = *((_QWORD *)v5 + 2);
  v9 = *((_QWORD *)v5 + 3);
  *(_QWORD *)v5 = v2;
  *(_OWORD *)(v5 + 8) = v12;
  *((_QWORD *)v5 + 3) = v3;
  v10 = v5[32];
  v5[32] = v4;
  return sub_1DE20FEAC(v6, v7, v8, v9, v10);
}

void sub_1DE20F2A0()
{
  sub_1DE217098();
  sub_1DE216F58();
  sub_1DE20425C();
}

double sub_1DE20F2E8@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_1DE20F360((uint64_t *)&v3);
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

void sub_1DE20F320(uint64_t *a1)
{
  unint64_t v1;
  uint64_t v2[2];

  v1 = a1[1];
  v2[0] = *a1;
  v2[1] = v1;
  sub_1DE1FFB50(v2[0], v1);
  sub_1DE20F3AC(v2);
}

uint64_t sub_1DE20F360@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  sub_1DE20F1AC();
  result = v4;
  v3 = v5;
  if (v8)
  {
    sub_1DE20FEAC(v4, v5, v6, v7, v8);
    result = 0;
    v3 = 0xF000000000000000;
  }
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_1DE20F3AC(_QWORD *a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  char v8;

  v1 = a1[1];
  if (v1 >> 60 == 15)
  {
    v6 = 0u;
    v7 = 0u;
    v8 = 2;
    sub_1DE20F20C((uint64_t *)&v6);
  }
  else
  {
    *(_QWORD *)&v6 = *a1;
    *((_QWORD *)&v6 + 1) = v1;
    v7 = 0uLL;
    v8 = 0;
    v2 = sub_1DE217440();
    sub_1DE1FFB64(v2, v3);
    sub_1DE20F20C((uint64_t *)&v6);
    v4 = sub_1DE217440();
    sub_1DE1FFC40(v4, v5);
  }
  sub_1DE2172B8();
}

void sub_1DE20F41C(uint64_t *a1)
{
  uint64_t v1;

  a1[2] = v1;
  sub_1DE20F360(a1);
  sub_1DE20425C();
}

void sub_1DE20F44C(_QWORD *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD v7[2];

  v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  if ((a2 & 1) != 0)
  {
    v3 = sub_1DE217440();
    sub_1DE1FFB50(v3, v4);
    sub_1DE20F3AC(v7);
    v5 = sub_1DE217440();
    sub_1DE1FFC40(v5, v6);
  }
  else
  {
    sub_1DE20F3AC(v7);
  }
}

void sub_1DE20F4B8()
{
  sub_1DE216F40();
  sub_1DE217040();
}

void sub_1DE20F4F0(char a1)
{
  _QWORD *v1;
  _BYTE *v3;

  v3 = (char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0xB8);
  sub_1DE216F58();
  *v3 = a1;
  sub_1DE217040();
}

void sub_1DE20F53C()
{
  sub_1DE217098();
  sub_1DE216F58();
  sub_1DE20425C();
}

void sub_1DE20F584()
{
  _QWORD *v0;
  id v1;

  v1 = *(id *)((char *)v0 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0));
  sub_1DE20425C();
}

void sub_1DE20F5BC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v8 = *v4;
  v9 = a1;
  sub_1DE21931C((uint64_t)v9, v8);
  v11 = v10;

  if (v11)
  {
    sub_1DE2172C8();
    v12 = sub_1DE21729C();
    sub_1DE219350(v12, v13, v11);
    v15 = v14;
    swift_bridgeObjectRelease();
    if (v15)
    {
      sub_1DE21938C(a4, v15);
      v17 = v16;
      swift_bridgeObjectRelease();
      sub_1DE21722C();
      if (v17)
        goto LABEL_7;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  v18 = objc_allocWithZone(MEMORY[0x1E0C94FA0]);
  v19 = v9;
  sub_1DE2172C8();
  sub_1DE20F710(objc_msgSend(v18, sel_init), v19, a2, a3, a4);
  v17 = 0;
LABEL_7:
  v20 = *v4;
  v21 = v9;
  sub_1DE2172C8();
  sub_1DE21931C((uint64_t)v21, v20);
  v23 = v22;

  if (!v23)
  {
    __break(1u);
    goto LABEL_12;
  }
  v24 = sub_1DE21729C();
  sub_1DE219350(v24, v25, v23);
  v27 = v26;
  swift_bridgeObjectRelease();
  sub_1DE21707C();
  if (!v27)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  sub_1DE21938C(a4, v27);
  v29 = v28;
  swift_bridgeObjectRelease();
  if (v29)
  {

    sub_1DE217068();
    return;
  }
LABEL_13:
  __break(1u);
}

void sub_1DE20F710(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  _BOOL8 v20;
  id v21;
  id v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  Swift::Int v26;
  unint64_t v27;
  char v28;
  char v29;
  _QWORD *v30;
  char v31;
  id v32;
  id v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  Swift::Int v37;
  unint64_t v38;
  char v39;
  char v40;
  _QWORD *v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  Swift::Int v46;
  unint64_t v47;
  char v48;
  char v49;
  uint64_t v50;
  char v51;
  id v53;
  id v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD *v57;

  v6 = v5;
  sub_1DE21931C((uint64_t)a2, *v5);
  v12 = v11;
  swift_bridgeObjectRelease();
  if (!v12)
  {
    v13 = a2;
    sub_1DE220E88();

  }
  v14 = *v6;
  v15 = a2;
  sub_1DE217248();
  sub_1DE21931C((uint64_t)v15, v14);
  v17 = v16;

  if (!v17)
    goto LABEL_28;
  sub_1DE219350(a3, a4, v17);
  v20 = v19;
  sub_1DE217060();
  sub_1DE21707C();
  sub_1DE2173C0();
  if (!v20)
  {
    v53 = a1;
    v21 = v15;
    sub_1DE217248();
    swift_isUniquelyReferenced_nonNull_native();
    v22 = sub_1DE2171E0();
    sub_1DE220FE0((uint64_t)v22);
    sub_1DE217368();
    v26 = v24 + v25;
    if (__OFADD__(v24, v25))
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v27 = v18;
    v28 = v23;
    sub_1DE1FFE88(&qword_1F0438C88);
    v18 = _NativeDictionary.ensureUnique(isUnique:capacity:)(0, v26);
    if ((v18 & 1) != 0)
    {
      v18 = sub_1DE220FE0((uint64_t)v22);
      if ((v28 & 1) != (v29 & 1))
        goto LABEL_29;
      v27 = v18;
    }
    if ((v28 & 1) == 0)
    {
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    v30 = *(_QWORD **)(v57[7] + 8 * v27);
    v31 = sub_1DE217504();
    v55 = v30;
    sub_1DE221248(MEMORY[0x1E0DEE9E0], a3, a4, v31);
    v56 = v30;
    sub_1DE217060();
    swift_bridgeObjectRelease();
    sub_1DE221854((uint64_t *)&v56, 1, &v57, v27, v22);

    sub_1DE21707C();
    *v6 = (uint64_t)v57;

    a1 = v53;
  }
  v32 = v15;
  sub_1DE217248();
  v54 = a1;
  swift_isUniquelyReferenced_nonNull_native();
  v33 = sub_1DE2171E0();
  sub_1DE220FE0((uint64_t)v33);
  sub_1DE217368();
  v37 = v35 + v36;
  if (__OFADD__(v35, v36))
  {
    __break(1u);
    goto LABEL_23;
  }
  v38 = v18;
  v39 = v34;
  sub_1DE1FFE88(&qword_1F0438C88);
  v18 = _NativeDictionary.ensureUnique(isUnique:capacity:)(v20, v37);
  if ((v18 & 1) != 0)
  {
    v18 = sub_1DE220FE0((uint64_t)v33);
    if ((v39 & 1) == (v40 & 1))
    {
      v38 = v18;
      goto LABEL_15;
    }
LABEL_29:
    sub_1DE217328(v18, &qword_1F0438980);
    goto LABEL_30;
  }
LABEL_15:
  if ((v39 & 1) == 0)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v41 = *(_QWORD **)(v57[7] + 8 * v38);
  sub_1DE217248();
  v42 = sub_1DE217504();
  v55 = v41;
  sub_1DE217248();
  sub_1DE2173EC();
  sub_1DE217368();
  v46 = v44 + v45;
  if (__OFADD__(v44, v45))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v47 = v18;
  v48 = v43;
  sub_1DE1FFE88((uint64_t *)&unk_1F0438C90);
  v18 = _NativeDictionary.ensureUnique(isUnique:capacity:)(v42, v46);
  if ((v18 & 1) == 0)
    goto LABEL_20;
  v18 = sub_1DE2173EC();
  if ((v48 & 1) == (v49 & 1))
  {
    v47 = v18;
LABEL_20:
    if ((v48 & 1) != 0)
    {
      v50 = *(_QWORD *)(v55[7] + 8 * v47);
      v51 = sub_1DE217504();
      sub_1DE221168((uint64_t)v54, a5, v51);
      v56 = (_QWORD *)v50;
      swift_bridgeObjectRelease();
      sub_1DE221794((uint64_t *)&v56, 1, &v55, v47, a3, a4);
      sub_1DE217060();
      sub_1DE21707C();
      v56 = v55;
      sub_1DE217060();
      sub_1DE217060();
      sub_1DE221854((uint64_t *)&v56, 1, &v57, v38, v33);

      sub_1DE21707C();
      *v6 = (uint64_t)v57;

      sub_1DE217060();
      return;
    }
    goto LABEL_25;
  }
LABEL_30:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
}

void sub_1DE20FAD8(void *a1, uint64_t a2)
{
  id v2;
  char v3;

  if (*(_QWORD *)(a2 + 16))
  {
    v2 = a1;
    sub_1DE220FE0((uint64_t)v2);
    if ((v3 & 1) != 0)
      swift_bridgeObjectRetain();

  }
  sub_1DE20425C();
}

void sub_1DE20FB30(uint64_t a1, void *a2)
{
  if (a1)
  {
    sub_1DE220E88();
    sub_1DE217150(a2);
  }
  else
  {
    sub_1DE220CF4((uint64_t)a2);

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1DE20FB80()
{
  sub_1DE216F40();
  return swift_bridgeObjectRetain();
}

void CodeOperation.init(service:functionName:request:destinationServer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v8;
  char *v9;
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
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t);
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;

  v8 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v9 = (char *)v5 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v5) + 0x70);
  v10 = *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v5) + 0x50);
  sub_1DE217250();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v11, v12, v13, v10);
  sub_1DE216F70();
  sub_1DE217250();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v14, v15, v16, v17);
  sub_1DE216F70();
  v19 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)((char *)v5 + *(_QWORD *)(v18 + 152)) = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)((char *)v5 + *(_QWORD *)((*v8 & *v5) + 0xA0)) = v19;
  sub_1DE216F70();
  *(_QWORD *)((char *)v5 + *(_QWORD *)(v20 + 168)) = 0;
  sub_1DE216F70();
  v22 = (char *)v5 + *(_QWORD *)(v21 + 176);
  *(_OWORD *)v22 = 0u;
  *((_OWORD *)v22 + 1) = 0u;
  v22[32] = 2;
  sub_1DE216F70();
  *((_BYTE *)v5 + *(_QWORD *)(v23 + 184)) = 0;
  sub_1DE216F70();
  *(_QWORD *)((char *)v5 + *(_QWORD *)(v24 + 192)) = 0;
  sub_1DE216F70();
  *(_QWORD *)((char *)v5 + *(_QWORD *)(v25 + 200)) = MEMORY[0x1E0DEE9E0];
  sub_1DE216F70();
  v27 = (_QWORD *)((char *)v5 + *(_QWORD *)(v26 + 208));
  *v27 = 0;
  v27[1] = 0;
  sub_1DE216F70();
  v29 = (_QWORD *)((char *)v5 + *(_QWORD *)(v28 + 216));
  *v29 = 0;
  v29[1] = 0;
  sub_1DE216F70();
  v31 = (_QWORD *)((char *)v5 + *(_QWORD *)(v30 + 224));
  *v31 = 0;
  v31[1] = 0;
  sub_1DE216F70();
  v33 = (_QWORD *)((char *)v5 + *(_QWORD *)(v32 + 248));
  *v33 = 0;
  v33[1] = 0;
  sub_1DE216F70();
  v35 = (_QWORD *)((char *)v5 + *(_QWORD *)(v34 + 256));
  *v35 = 0;
  v35[1] = 0;
  sub_1DE216F58();
  v36 = sub_1DE2174C4();
  v37 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 24);
  v38 = v5;
  v37(v9, a5, v36);
  swift_endAccess();
  sub_1DE216F70();
  v40 = (_QWORD *)((char *)v38 + *(_QWORD *)(v39 + 128));
  *v40 = a1;
  v40[1] = a2;
  sub_1DE216F70();
  v42 = (_QWORD *)((char *)v38 + *(_QWORD *)(v41 + 136));
  *v42 = a3;
  v42[1] = a4;
  sub_1DE216F70();
  sub_1DE2170F8();
  type metadata accessor for CodeOperation.DestinationServer();
}

void sub_1DE20FD98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  sub_1DE217360(v17, a16, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16));
  sub_1DE216F70();
  v16[*(_QWORD *)(v18 + 240)] = 0;
  sub_1DE216F70();
  v16[*(_QWORD *)(v19 + 232)] = 1;

  sub_1DE2170F8();
  type metadata accessor for CodeOperation();
}

void sub_1DE20FDDC(objc_class *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, objc_super a17)
{
  a17.super_class = a1;
  -[objc_class init](&a17, sel_init);
  sub_1DE2170F8();
  type metadata accessor for CodeOperation.CallbackRelay();
}

void sub_1DE20FDFC()
{
  void *v0;
  id v1;

  v1 = v0;
  sub_1DE20FF10();
}

_QWORD *sub_1DE20FE10(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v2);
  sub_1DE217404(v10, v11);
  v7 = *(_QWORD *)((*v1 & *v3) + 0xC0);
  v8 = *(void **)((char *)v3 + v7);
  *(_QWORD *)((char *)v3 + v7) = a1;

  return v3;
}

uint64_t sub_1DE20FE6C(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 == 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  else if (!a5)
  {
    return sub_1DE1FFB64(result, a2);
  }
  return result;
}

uint64_t sub_1DE20FEAC(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 == 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else if (!a5)
  {
    return sub_1DE1FFC54(result, a2);
  }
  return result;
}

void type metadata accessor for CodeOperation.DestinationServer()
{
  JUMPOUT(0x1DF0EA560);
}

void type metadata accessor for CodeOperation()
{
  JUMPOUT(0x1DF0EA560);
}

void type metadata accessor for CodeOperation.CallbackRelay()
{
  JUMPOUT(0x1DF0EA560);
}

void sub_1DE20FF10()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  sub_1DE21400C();
}

void CodeOperation.__allocating_init(serviceName:functionName:request:local:)()
{
  sub_1DE2170C4();
  sub_1DE21726C();
  CodeOperation.init(serviceName:functionName:request:local:)();
}

void sub_1DE20FF6C()
{
  sub_1DE217068();
}

void CodeOperation.init(serviceName:functionName:request:local:)()
{
  sub_1DE216FF0();
  sub_1DE21725C();
}

void sub_1DE20FFD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
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
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  void (*v42)(uint64_t, _QWORD, uint64_t);
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  *(_QWORD *)(v15 - 160) = a1;
  *(_QWORD *)(v15 - 176) = *(_QWORD *)(a1 - 8);
  sub_1DE217014();
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&a9 - v17;
  v19 = (uint64_t)v9 + *(_QWORD *)(v12 + 112);
  sub_1DE217234(v19, 1);
  sub_1DE216F60();
  sub_1DE217250();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v20, v21, v22, v10);
  sub_1DE216F60();
  v24 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)((char *)v9 + *(_QWORD *)(v23 + 152)) = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)((char *)v9 + *(_QWORD *)((*v13 & *v9) + 0xA0)) = v24;
  sub_1DE216F60();
  *(_QWORD *)((char *)v9 + *(_QWORD *)(v25 + 168)) = 0;
  sub_1DE216F60();
  v27 = (char *)v9 + *(_QWORD *)(v26 + 176);
  *(_OWORD *)v27 = 0u;
  *((_OWORD *)v27 + 1) = 0u;
  v27[32] = 2;
  sub_1DE216F60();
  *((_BYTE *)v9 + *(_QWORD *)(v28 + 184)) = 0;
  sub_1DE216F60();
  *(_QWORD *)((char *)v9 + *(_QWORD *)(v29 + 192)) = 0;
  sub_1DE216F60();
  *(_QWORD *)((char *)v9 + *(_QWORD *)(v30 + 200)) = MEMORY[0x1E0DEE9E0];
  sub_1DE216F60();
  v32 = (_QWORD *)((char *)v9 + *(_QWORD *)(v31 + 208));
  *v32 = 0;
  v32[1] = 0;
  sub_1DE216F60();
  v34 = (_QWORD *)((char *)v9 + *(_QWORD *)(v33 + 216));
  *v34 = 0;
  v34[1] = 0;
  sub_1DE216F60();
  v36 = (_QWORD *)((char *)v9 + *(_QWORD *)(v35 + 224));
  *v36 = 0;
  v36[1] = 0;
  sub_1DE216F60();
  v38 = (_QWORD *)((char *)v9 + *(_QWORD *)(v37 + 248));
  *v38 = 0;
  v38[1] = 0;
  sub_1DE216F60();
  v40 = (_QWORD *)((char *)v9 + *(_QWORD *)(v39 + 256));
  *v40 = 0;
  v40[1] = 0;
  sub_1DE216F58();
  v41 = sub_1DE2174B8();
  v42 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v41 - 8) + 24);
  v43 = v9;
  v42(v19, *(_QWORD *)(v15 - 200), v41);
  swift_endAccess();
  sub_1DE216F60();
  v45 = &v43[*(_QWORD *)(v44 + 128)];
  v46 = *(_QWORD *)(v15 - 184);
  *(_QWORD *)v45 = *(_QWORD *)(v15 - 192);
  *((_QWORD *)v45 + 1) = v46;
  sub_1DE216F60();
  v48 = &v43[*(_QWORD *)(v47 + 136)];
  v49 = *(_QWORD *)(v15 - 152);
  *(_QWORD *)v48 = *(_QWORD *)(v15 - 168);
  *((_QWORD *)v48 + 1) = v49;
  v50 = sub_1DE217318();
  if ((*(_DWORD *)(v15 - 140) & 1) != 0)
    v51 = 2;
  else
    v51 = 1;
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v18, v51, 2, v50);
  sub_1DE216F60();
  (*(void (**)(char *, char *, _QWORD))(*(_QWORD *)(v15 - 176) + 32))(&v43[*(_QWORD *)(v52 + 144)], v18, *(_QWORD *)(v15 - 160));
  sub_1DE216F60();
  v43[*(_QWORD *)(v53 + 240)] = 0;
  sub_1DE216F60();
  v43[*(_QWORD *)(v54 + 232)] = 1;

  *(_QWORD *)(v15 - 112) = v11;
  *(_QWORD *)(v15 - 104) = v10;
  *(_QWORD *)(v15 - 96) = *(_QWORD *)(v15 - 136);
  *(_QWORD *)(v15 - 88) = v14;
  sub_1DE2171A0();
}

void sub_1DE2101D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 - 128) = v2;
  *(_QWORD *)(v6 - 120) = a1;
  objc_msgSendSuper2((objc_super *)(v6 - 128), sel_init);
  *(_QWORD *)(v6 - 112) = v4;
  *(_QWORD *)(v6 - 104) = v3;
  *(_QWORD *)(v6 - 96) = v1;
  *(_QWORD *)(v6 - 88) = v5;
  type metadata accessor for CodeOperation.CallbackRelay();
}

void sub_1DE210204()
{
  void *v0;
  id v1;

  v1 = v0;
  sub_1DE20FF10();
}

_QWORD *sub_1DE210218(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  void *v8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  v7 = *(_QWORD *)((*v5 & *v1) + 0xC0);
  v8 = *(void **)((char *)v1 + v7);
  *(_QWORD *)((char *)v1 + v7) = a1;

  return v1;
}

void sub_1DE21026C(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD *, _QWORD *, _QWORD *);

  sub_1DE21038C();
  if (v2)
  {
    v4 = v2;
    v5 = v3;
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 16) = v4;
    *(_QWORD *)(v2 + 24) = v5;
    v6 = sub_1DE216EA8;
  }
  else
  {
    v6 = 0;
  }
  *a1 = v6;
  a1[1] = v2;
}

void sub_1DE2102D0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
  }
  sub_1DE204B48(v1);
  sub_1DE2103C4();
}

uint64_t sub_1DE210350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t *, uint64_t *, uint64_t *))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v6 = a2;
  v7 = a1;
  v5 = a3;
  return a4(&v7, &v6, &v5);
}

void sub_1DE21038C()
{
  sub_1DE216F40();
  sub_1DE216FB8();
  sub_1DE217040();
}

void sub_1DE2103C4()
{
  sub_1DE2171B0();
  sub_1DE216F58();
  sub_1DE217034();
  sub_1DE216F80();
}

void sub_1DE210410()
{
  sub_1DE217098();
  sub_1DE216F58();
  sub_1DE20425C();
}

void sub_1DE210458(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD *, double *);

  sub_1DE21053C();
  if (v2)
  {
    v4 = v2;
    v5 = v3;
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 16) = v4;
    *(_QWORD *)(v2 + 24) = v5;
    v6 = sub_1DE216E98;
  }
  else
  {
    v6 = 0;
  }
  *a1 = v6;
  a1[1] = v2;
}

void sub_1DE2104BC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
  }
  sub_1DE204B48(v1);
  sub_1DE210574();
}

void sub_1DE21053C()
{
  sub_1DE216F40();
  sub_1DE216FB8();
  sub_1DE217040();
}

void sub_1DE210574()
{
  sub_1DE2171B0();
  sub_1DE216F58();
  sub_1DE217034();
  sub_1DE216F80();
}

void sub_1DE2105C0()
{
  sub_1DE217098();
  sub_1DE216F58();
  sub_1DE20425C();
}

void sub_1DE210608(uint64_t a1@<X1>, uint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, _QWORD *);
  __int128 v9;
  __int128 v10;

  v9 = *(_OWORD *)(a2 + a1 - 16);
  v10 = *(_OWORD *)(a2 + a1 - 32);
  sub_1DE21071C();
  if (v4)
  {
    v6 = v4;
    v7 = v5;
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = v10;
    *(_OWORD *)(v4 + 32) = v9;
    *(_QWORD *)(v4 + 48) = v6;
    *(_QWORD *)(v4 + 56) = v7;
    v8 = sub_1DE216E54;
  }
  else
  {
    v8 = 0;
  }
  *a3 = v8;
  a3[1] = v4;
}

void sub_1DE210690(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v4 = *a1;
  v5 = a1[1];
  if (*a1)
  {
    v6 = a4 + a3;
    v7 = swift_allocObject();
    v8 = *(_OWORD *)(v6 - 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)(v6 - 32);
    *(_OWORD *)(v7 + 32) = v8;
    *(_QWORD *)(v7 + 48) = v4;
    *(_QWORD *)(v7 + 56) = v5;
  }
  sub_1DE204B48(v4);
  sub_1DE210754();
}

void sub_1DE21071C()
{
  sub_1DE216F40();
  sub_1DE216FB8();
  sub_1DE217040();
}

void sub_1DE210754()
{
  sub_1DE2171B0();
  sub_1DE216F58();
  sub_1DE217034();
  sub_1DE216F80();
}

void sub_1DE2107A0()
{
  sub_1DE217098();
  sub_1DE216F58();
  sub_1DE20425C();
}

void sub_1DE2107EC()
{
  sub_1DE216F40();
  sub_1DE217040();
}

void sub_1DE210824(char a1)
{
  _QWORD *v1;
  _BYTE *v3;

  v3 = (char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0xE8);
  sub_1DE216F58();
  *v3 = a1;
  sub_1DE217040();
}

void sub_1DE210870()
{
  sub_1DE217098();
  sub_1DE216F58();
  sub_1DE20425C();
}

void sub_1DE2108B8()
{
  sub_1DE216F40();
  sub_1DE217040();
}

void sub_1DE2108F0(char a1)
{
  _QWORD *v1;
  _BYTE *v3;

  v3 = (char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0xF0);
  sub_1DE216F58();
  *v3 = a1;
  sub_1DE217040();
}

void sub_1DE21093C()
{
  sub_1DE217098();
  sub_1DE216F58();
  sub_1DE20425C();
}

void sub_1DE210984(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t (**a3)(uint64_t a1)@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  __int128 v9;
  __int128 v10;

  v9 = *(_OWORD *)(a2 + a1 - 16);
  v10 = *(_OWORD *)(a2 + a1 - 32);
  sub_1DE210A98();
  if (v4)
  {
    v6 = v4;
    v7 = v5;
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = v10;
    *(_OWORD *)(v4 + 32) = v9;
    *(_QWORD *)(v4 + 48) = v6;
    *(_QWORD *)(v4 + 56) = v7;
    v8 = sub_1DE216DE0;
  }
  else
  {
    v8 = 0;
  }
  *a3 = v8;
  a3[1] = (uint64_t (*)(uint64_t))v4;
}

void sub_1DE210A0C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v4 = *a1;
  v5 = a1[1];
  if (*a1)
  {
    v6 = a4 + a3;
    v7 = swift_allocObject();
    v8 = *(_OWORD *)(v6 - 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)(v6 - 32);
    *(_OWORD *)(v7 + 32) = v8;
    *(_QWORD *)(v7 + 48) = v4;
    *(_QWORD *)(v7 + 56) = v5;
  }
  sub_1DE204B48(v4);
  sub_1DE210AD0();
}

void sub_1DE210A98()
{
  sub_1DE216F40();
  sub_1DE216FB8();
  sub_1DE217040();
}

void sub_1DE210AD0()
{
  sub_1DE2171B0();
  sub_1DE216F58();
  sub_1DE217034();
  sub_1DE216F80();
}

void sub_1DE210B1C()
{
  sub_1DE217098();
  sub_1DE216F58();
  sub_1DE20425C();
}

void sub_1DE210B64(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t (**a3)(uint64_t a1)@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  __int128 v9;
  __int128 v10;

  v9 = *(_OWORD *)(a2 + a1 - 16);
  v10 = *(_OWORD *)(a2 + a1 - 32);
  sub_1DE210C78();
  if (v4)
  {
    v6 = v4;
    v7 = v5;
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = v10;
    *(_OWORD *)(v4 + 32) = v9;
    *(_QWORD *)(v4 + 48) = v6;
    *(_QWORD *)(v4 + 56) = v7;
    v8 = sub_1DE216DE0;
  }
  else
  {
    v8 = 0;
  }
  *a3 = v8;
  a3[1] = (uint64_t (*)(uint64_t))v4;
}

void sub_1DE210BEC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t (*v9)(uint64_t);

  v4 = *a1;
  v5 = a1[1];
  if (*a1)
  {
    v6 = a4 + a3;
    v7 = swift_allocObject();
    v8 = *(_OWORD *)(v6 - 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)(v6 - 32);
    *(_OWORD *)(v7 + 32) = v8;
    *(_QWORD *)(v7 + 48) = v4;
    *(_QWORD *)(v7 + 56) = v5;
    v9 = sub_1DE216DE0;
  }
  else
  {
    v9 = 0;
  }
  sub_1DE204B48(v4);
  sub_1DE210CB0((uint64_t)v9);
}

void sub_1DE210C78()
{
  sub_1DE216F40();
  sub_1DE216FB8();
  sub_1DE217040();
}

void sub_1DE210CB0(uint64_t a1)
{
  if (a1 && !*MEMORY[0x1E0C95280])
  {
    __break(1u);
  }
  else
  {
    sub_1DE216F58();
    sub_1DE217034();
    sub_1DE216F80();
  }
}

void (*sub_1DE210D1C(_QWORD *a1))(uint64_t **a1, char a2)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  v4 = (_QWORD *)((char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x100));
  sub_1DE216F58();
  v5 = *v4;
  v6 = v4[1];
  v3[3] = *v4;
  v3[4] = v6;
  sub_1DE204B48(v5);
  return sub_1DE210D98;
}

void sub_1DE210D98(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = sub_1DE21729C();
    sub_1DE204B48(v3);
    sub_1DE2173F8();
    sub_1DE204AEC(v2[3]);
  }
  else
  {
    sub_1DE2173F8();
  }
  free(v2);
}

void sub_1DE210DEC()
{
  sub_1DE2171A0();
}

void sub_1DE210E1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 - 16) = v1;
  *(_QWORD *)(v2 - 8) = a1;
  if ((objc_msgSendSuper2((objc_super *)(v2 - 16), sel_hasCKOperationCallbacksSet) & 1) == 0)
  {
    sub_1DE21038C();
    if (v3 || (sub_1DE21071C(), v3) || (sub_1DE21053C(), v3) || (sub_1DE210A98(), v3))
      sub_1DE204AEC(v3);
  }
}

void sub_1DE210E68(void *a1)
{
  id v1;

  v1 = a1;
  sub_1DE210DEC();
}

uint64_t sub_1DE210E80(char a1)
{
  void *v1;

  return a1 & 1;
}

uint64_t sub_1DE210E98()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int v7;
  id v8;
  unsigned __int8 v9;
  uint64_t v11;
  objc_super v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0DEEDD8] & *v0;
  v2 = *(_QWORD *)(v1 + 0x50);
  v3 = type metadata accessor for Optional();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v12 - v5;
  sub_1DE20EE2C();
  v7 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v6, 1, v2);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (v7 != 1)
  {
    v8 = objc_msgSend(v0, sel_resolvedConfiguration);
    v9 = objc_msgSend(v8, sel_isLongLived);

    if ((v9 & 1) == 0)
    {
      v13 = 0;
      v14 = v2;
      v11 = *(_QWORD *)(v1 + 104);
      v15 = *(_OWORD *)(v1 + 88);
      v16 = v11;
      type metadata accessor for CodeOperation();
    }
  }
  sub_1DE21715C();
  related decl 'e' for CKErrorCode.init(_:description:)();
  return swift_willThrow();
}

uint64_t sub_1DE211060(void *a1)
{
  id v1;

  v1 = a1;
  sub_1DE210E98();

  return 1;
}

char *sub_1DE2110D8()
{
  return sel_performCodeOperation_withBlock_;
}

char *sub_1DE2110E4()
{
  return sub_1DE2110D8();
}

void sub_1DE2110F8()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
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
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(_QWORD);
  unint64_t v42;
  unint64_t v43;
  char *v44;
  char *v45;
  int64_t v46;
  char v47;
  _BOOL8 v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
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
  unint64_t v65;
  unint64_t v66;
  char *v67;
  char *v68;
  int64_t v69;
  char v70;
  uint64_t v71;
  _BOOL8 v72;
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
  char *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;

  sub_1DE216FF0();
  v2 = *MEMORY[0x1E0DEEDD8] & *v0;
  v3 = type metadata accessor for Google_Protobuf_Any();
  v86 = *(_QWORD *)(v3 - 8);
  v87 = v3;
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v4);
  sub_1DE2042FC();
  v85 = v6 - v5;
  sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v7);
  sub_1DE217084();
  v90 = v8;
  sub_1DE21712C();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v77 - v10;
  v12 = type metadata accessor for Ckcode_ProtectedEnvelope(0);
  v88 = *(_QWORD *)(v12 - 8);
  v89 = (char *)v12;
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v13);
  sub_1DE217390();
  v14 = sub_1DE2171A8();
  v91 = *(_QWORD *)(v14 - 8);
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v15);
  sub_1DE2042FC();
  v18 = (uint64_t *)(v17 - v16);
  v19 = *(_QWORD *)(v2 + 80);
  type metadata accessor for Optional();
  sub_1DE217014();
  v21 = MEMORY[0x1E0C80A78](v20);
  v23 = (char *)&v77 - v22;
  v24 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v21);
  v26 = (char *)&v77 - v25;
  v84 = v0;
  sub_1DE20EE2C();
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v23, 1, v19) == 1)
  {
    __break(1u);
    goto LABEL_33;
  }
  v80 = v24;
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v26, v23, v19);
  v79 = v2;
  v27 = *(_QWORD *)(v2 + 96);
  sub_1DE2025EC(&qword_1EDB82278, (uint64_t (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport, (uint64_t)&protocol conformance descriptor for Ckcode_RecordTransport);
  v81 = v27;
  v83 = v26;
  v28 = 0;
  v30 = sub_1DE2061D4(v14, v19, v14, v27, v29);
  v31 = *(_QWORD *)(v30 + 16);
  v32 = v90;
  v82 = v19;
  if (!v31)
  {
    swift_bridgeObjectRelease();
    v37 = (char *)MEMORY[0x1E0DEE9D8];
LABEL_15:
    sub_1DE2025EC(&qword_1EDB822B0, type metadata accessor for Ckcode_ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_ProtectedEnvelope);
    v49 = v83;
    v51 = sub_1DE2061D4((uint64_t)v89, v19, (uint64_t)v89, v81, v50);
    v52 = v84;
    v53 = v79;
    if (!v28)
    {
      v54 = *(_QWORD *)(v51 + 16);
      if (!v54)
      {
        swift_bridgeObjectRelease();
        v74 = MEMORY[0x1E0DEE9D8];
LABEL_31:
        sub_1DE20F064((uint64_t)v37);
        sub_1DE20F09C(v74);
        v75 = *(_QWORD *)(v53 + 88);
        v76 = *(_QWORD *)(v53 + 104);
        v92 = v82;
        v93 = v75;
        v94 = v81;
        v95 = v76;
        sub_1DE2171A0();
      }
      v55 = sub_1DE217418(v51);
      v57 = v55 + v56;
      v91 = *(_QWORD *)(v58 + 72);
      v88 = 0x80000001DE22AD70;
      v89 = (char *)MEMORY[0x1E0DEE9D8];
      while (1)
      {
        sub_1DE2008C4(v57, v1, type metadata accessor for Ckcode_ProtectedEnvelope);
        v59 = sub_1DE217454();
        sub_1DE21570C(v59, v60);
        sub_1DE215794(v1, type metadata accessor for Ckcode_ProtectedEnvelope);
        v61 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
        if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v11, 1, v61) != 1)
        {
          sub_1DE21570C((uint64_t)v11, v32);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v86 + 32))(v85, v32, v87);
            sub_1DE2025EC(&qword_1EDB81A10, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E828], MEMORY[0x1E0D3E818]);
            v49 = (void *)Message.serializedData(partial:)();
            v63 = v62;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
            {
              v64 = v89;
            }
            else
            {
              v68 = (char *)sub_1DE2170E8();
              v64 = sub_1DE215624(v68, v69, v70, v71);
            }
            v66 = *((_QWORD *)v64 + 2);
            v65 = *((_QWORD *)v64 + 3);
            if (v66 >= v65 >> 1)
            {
              v72 = sub_1DE217288(v65);
              v64 = sub_1DE215624((char *)v72, v66 + 1, 1, v73);
            }
            *((_QWORD *)v64 + 2) = v66 + 1;
            v89 = v64;
            v67 = &v64[16 * v66];
            *((_QWORD *)v67 + 4) = v49;
            *((_QWORD *)v67 + 5) = v63;
            (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v85, v87);
            v52 = v84;
            v32 = v90;
            goto LABEL_27;
          }
          sub_1DE215794(v32, type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents);
        }
        related decl 'e' for CKErrorCode.init(_:description:)();
        sub_1DE217498();
        sub_1DE2174FC();
        sub_1DE2170E0(v52, sel_finishWithError_);

LABEL_27:
        sub_1DE215754((uint64_t)v11);
        v57 += v91;
        if (!--v54)
        {
          sub_1DE2173D0();
          v53 = v79;
          v74 = (uint64_t)v89;
          goto LABEL_31;
        }
      }
    }
LABEL_33:
    sub_1DE217024();
    swift_unexpectedError();
    __break(1u);
    return;
  }
  v78 = 0;
  v33 = sub_1DE217418(v30);
  v35 = (char *)(v33 + v34);
  v91 = *(_QWORD *)(v36 + 72);
  v37 = (char *)MEMORY[0x1E0DEE9D8];
  while (1)
  {
    sub_1DE2008C4((uint64_t)v35, (uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for Ckcode_RecordTransport);
    v38 = *v18;
    v39 = v18[1];
    sub_1DE211704(*v18, v39);
    v40 = sub_1DE21729C();
    sub_1DE215794(v40, v41);
    if ((~v39 & 0x3000000000000000) == 0)
      goto LABEL_14;
    if ((v39 & 0x2000000000000000) != 0)
      break;
    sub_1DE205854(v38, v39);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v45 = (char *)sub_1DE2170E8();
      v37 = sub_1DE215624(v45, v46, v47, (uint64_t)v37);
    }
    v43 = *((_QWORD *)v37 + 2);
    v42 = *((_QWORD *)v37 + 3);
    if (v43 >= v42 >> 1)
    {
      v48 = sub_1DE217288(v42);
      v37 = sub_1DE215624((char *)v48, v43 + 1, 1, (uint64_t)v37);
    }
    *((_QWORD *)v37 + 2) = v43 + 1;
    v44 = &v37[16 * v43];
    *((_QWORD *)v44 + 4) = v38;
    *((_QWORD *)v44 + 5) = v39;
    sub_1DE2174AC();
    v32 = v90;
    v35 += v91;
    if (!--v31)
    {
      sub_1DE2173D0();
      v19 = v82;
      v28 = v78;
      goto LABEL_15;
    }
  }
  sub_1DE2174AC();
LABEL_14:
  sub_1DE2173C0();
  sub_1DE2173D0();
  sub_1DE21715C();
  related decl 'e' for CKErrorCode.init(_:description:)();
  sub_1DE217498();
  sub_1DE2174FC();
  sub_1DE2170E0(v84, sel_finishWithError_);

  sub_1DE217404((uint64_t)v83, v80);
  sub_1DE2041DC();
}

uint64_t sub_1DE211704(uint64_t a1, uint64_t a2)
{
  if ((~a2 & 0x3000000000000000) != 0)
    return sub_1DE205854(a1, a2);
  return a1;
}

void sub_1DE211718(void *a1)
{
  id v1;

  v1 = a1;
  sub_1DE2110F8();

}

void sub_1DE21174C(uint64_t a1)
{
  sub_1DE217328(a1, &qword_1EDB822D0);
}

uint64_t sub_1DE211770(uint64_t a1)
{
  sub_1DE21174C(a1);
  return swift_getObjCClassFromMetadata();
}

void *sub_1DE211784()
{
  return &unk_1F043D6E0;
}

void *sub_1DE211790()
{
  return sub_1DE211784();
}

uint64_t sub_1DE2117A4()
{
  return CKOperationSignpostBegin(_:_:)();
}

void sub_1DE2117BC(void *a1)
{
  id v1;

  v1 = a1;
  sub_1DE2117A4();

}

uint64_t sub_1DE2117F0()
{
  return CKOperationSignpostEnd(_:_:error:)();
}

void sub_1DE21180C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a1;
  v5 = a3;
  sub_1DE2117F0();

}

uint64_t sub_1DE211850()
{
  return CKActivityCreate(_:dso:)();
}

id sub_1DE21186C(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  v2 = (void *)sub_1DE211850();

  return v2;
}

void sub_1DE21189C()
{
  uint64_t v0;

  sub_1DE216FF0();
  sub_1DE217318();
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v0);
  sub_1DE2042FC();
  sub_1DE21725C();
}

void sub_1DE21191C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  Class isa;
  Class v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  Class v22;
  char v23;

  sub_1DE217014();
  MEMORY[0x1E0C80A78](v2);
  objc_opt_self();
  v3 = (void *)swift_dynamicCastObjCClassUnconditional();
  sub_1DE20EF9C();
  v5 = v4;
  v7 = v6;
  *(_QWORD *)(v1 - 176) = v0;
  v8 = (void *)MEMORY[0x1DF0E9E7C](v5, v7);
  sub_1DE21722C();
  sub_1DE2170E0(v3, sel_setServiceName_);

  sub_1DE20EFD0();
  v9 = (void *)MEMORY[0x1DF0E9E7C]();
  v10 = sub_1DE21707C();
  sub_1DE217220(v10, sel_setFunctionName_);

  sub_1DE20F048();
  isa = Array._bridgeToObjectiveC()().super.isa;
  sub_1DE21707C();
  objc_msgSend(v3, sel_setRequestLocalSerializations_, isa);

  sub_1DE20F080();
  v12 = Array._bridgeToObjectiveC()().super.isa;
  v13 = sub_1DE21707C();
  sub_1DE217220(v13, sel_setRequestLocalEnvelopes_);

  sub_1DE20F1AC();
  v15 = *(_QWORD *)(v1 - 104);
  v14 = *(_QWORD *)(v1 - 96);
  if (*(_BYTE *)(v1 - 88))
  {
    if (*(_BYTE *)(v1 - 88) == 1)
    {
      objc_msgSend(v3, sel_setDataProtectionType_, 2);
      v16 = sub_1DE217454();
      v17 = (void *)MEMORY[0x1DF0E9E7C](v16);
      swift_bridgeObjectRelease();
      objc_msgSend(v3, sel_setTrustedTargetDomain_, v17);

      v18 = (void *)MEMORY[0x1DF0E9E7C](v15, v14);
      v19 = sub_1DE21707C();
      sub_1DE217220(v19, sel_setTrustedTargetOID_);

    }
    else
    {
      objc_msgSend(v3, sel_setDataProtectionType_, 0);
    }
  }
  else
  {
    v20 = sub_1DE217454();
    sub_1DE1FFB64(v20, v21);
    sub_1DE217454();
    v22 = Data._bridgeToObjectiveC()().super.isa;
    sub_1DE217138();
    objc_msgSend(v3, sel_setPermittedRemoteMeasurement_, v22);

    objc_msgSend(v3, sel_setDataProtectionType_, 1);
    sub_1DE217138();
  }
  sub_1DE20F4B8();
  sub_1DE217474(v23, sel_setShouldSendRecordPCSKeys_);
  sub_1DE20F004();
}

void sub_1DE211B3C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  NSURL *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  v5 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v3, 2, v0);
  if (v5)
  {
    if (v5 == 1)
      objc_msgSend(v2, sel_setLegacyIsLocalBit_, 0);
    else
      objc_msgSend(v2, sel_setLegacyIsLocalBit_, 1);
  }
  else
  {
    v6 = *(_QWORD *)(v4 - 184);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v1, v3, v0);
    objc_msgSend(v2, sel_setLegacyIsLocalBit_, 1);
    URL._bridgeToObjectiveC()(v7);
    v9 = v8;
    sub_1DE2170E0(v2, sel_setClientRuntimeProvidedServiceURL_);

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v0);
  }
  sub_1DE2108B8();
  sub_1DE217474(v10, sel_setShouldFetchAssetContentInMemory_);
  v11 = *(_QWORD *)(v4 - 152);
  *(_QWORD *)(v4 - 120) = *(_QWORD *)(v4 - 144);
  *(_QWORD *)(v4 - 112) = v11;
  v12 = *(_QWORD *)(v4 - 168);
  *(_QWORD *)(v4 - 104) = *(_QWORD *)(v4 - 160);
  *(_QWORD *)(v4 - 96) = v12;
  sub_1DE2171A0();
}

void sub_1DE211C10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  *(_QWORD *)(v2 - 136) = v1;
  *(_QWORD *)(v2 - 128) = a1;
  v3 = *(void **)(v2 - 176);
  objc_msgSendSuper2((objc_super *)(v2 - 136), sel_fillOutOperationInfo_, v3);

  sub_1DE2041DC();
}

void sub_1DE211C3C(void *a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  a1;
  sub_1DE21189C();
}

void sub_1DE211C74()
{
  void *v0;
  void *v1;

}

void sub_1DE211C90()
{
  sub_1DE217460();
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_1DE211CEC()
{
  sub_1DE211C90();
}

void sub_1DE211CF8(uint64_t a1)
{
  void *ObjCClassFromMetadata;
  id v2;
  void *v3;

  sub_1DE217328(a1, (unint64_t *)&unk_1EDB81D90);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v2 = sub_1DE217264(ObjCClassFromMetadata, sel_applyDaemonCallbackInterfaceTweaks_);
  sub_1DE217328((uint64_t)v2, (unint64_t *)&unk_1EDB81DA0);
  v3 = (void *)swift_getObjCClassFromMetadata();
  sub_1DE217264(v3, sel_applyDaemonCallbackInterfaceTweaks_);
  swift_getObjCClassFromMetadata();
  sub_1DE2171A0();
}

void sub_1DE211D70(_QWORD *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, objc_super a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;

  v22 = (objc_class *)(*MEMORY[0x1E0DEEDD8] & *a1);
  a13.receiver = v20;
  a13.super_class = v22;
  objc_msgSendSuper2(&a13, *(SEL *)(v21 + 3504), v19);
  sub_1DE2172B8();
}

void sub_1DE211DA0(uint64_t a1, uint64_t a2, void *a3)
{
  swift_getObjCClassMetadata();
  sub_1DE211CF8((uint64_t)a3);
}

void sub_1DE211DC8()
{
  void *v0;

}

void sub_1DE211DDC()
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  _QWORD v39[4];
  uint64_t (*v40)(char *, char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  sub_1DE216FF0();
  v46 = v2;
  v44 = v3;
  v42 = v4;
  v6 = v5;
  v8 = v7;
  v9 = *MEMORY[0x1E0DEEDD8] & *v0;
  v10 = type metadata accessor for Ckcode_ProtectedEnvelope(0);
  v47 = *(_QWORD *)(v10 - 8);
  v48 = v10;
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v11);
  sub_1DE217390();
  v12 = *(_QWORD *)(v9 + 80);
  sub_1DE2174D0();
  sub_1DE217014();
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (char *)v39 - v15;
  v17 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v14);
  sub_1DE217084();
  v41 = v18;
  sub_1DE21712C();
  MEMORY[0x1E0C80A78](v19);
  v43 = (char *)v39 - v20;
  sub_1DE21712C();
  MEMORY[0x1E0C80A78](v21);
  v23 = (char *)v39 - v22;
  v45 = v0;
  sub_1DE20EE2C();
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v16, 1, v12) == 1)
  {
    __break(1u);
  }
  else
  {
    v40 = *(uint64_t (**)(char *, char *, uint64_t))(v17 + 32);
    v24 = v40(v23, v16, v12);
    if (*(_QWORD *)(v8 + 16))
    {
      MEMORY[0x1E0C80A78](v24);
      v39[-2] = v6;
      v25 = swift_bridgeObjectRetain();
      sub_1DE21943C(v25, (void (*)(uint64_t, uint64_t, unint64_t))sub_1DE216DA4);
      swift_bridgeObjectRelease();
      sub_1DE2171A8();
      sub_1DE2025EC(&qword_1EDB82278, (uint64_t (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport, (uint64_t)&protocol conformance descriptor for Ckcode_RecordTransport);
      Message.substituteMessages<A>(substitutionType:substitutions:)();
    }
    v39[3] = v17;
    v26 = v42;
    v27 = *(_QWORD *)(v42 + 16);
    if (v27)
    {
      v39[1] = v9;
      v39[2] = v23;
      v43 = (char *)v12;
      v49 = MEMORY[0x1E0DEE9D8];
      sub_1DE221988();
      v29 = (unint64_t *)(v26 + 40);
      while (1)
      {
        v30 = *(v29 - 1);
        v31 = *v29;
        MEMORY[0x1E0C80A78](v28);
        v39[-2] = v30;
        v39[-1] = v31;
        sub_1DE1FFB64(v30, v31);
        sub_1DE2025EC(&qword_1EDB822B0, type metadata accessor for Ckcode_ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_ProtectedEnvelope);
        static Message.with(_:)();
        sub_1DE1FFC54(v30, v31);
        v32 = v49;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1DE221988();
          v32 = v49;
        }
        v34 = *(_QWORD *)(v32 + 16);
        v33 = *(_QWORD *)(v32 + 24);
        if (v34 >= v33 >> 1)
        {
          sub_1DE217288(v33);
          sub_1DE221988();
          v32 = v49;
        }
        v29 += 2;
        *(_QWORD *)(v32 + 16) = v34 + 1;
        sub_1DE2172A8();
        sub_1DE202628(v1, v32 + v35 + *(_QWORD *)(v36 + 72) * v34, type metadata accessor for Ckcode_ProtectedEnvelope);
        if (!--v27)
          Message.substituteMessages<A>(substitutionType:substitutions:)();
      }
    }
    sub_1DE219434();
    v37 = Message.serializedData(partial:)();
    sub_1DE1FFB64(v37, v38);
    sub_1DE21742C();
    sub_1DE2174A0();
    sub_1DE2174A0();
    sub_1DE21720C();
    sub_1DE2041DC();
  }
}

uint64_t sub_1DE2122AC()
{
  type metadata accessor for Ckcode_RecordTransport();
  sub_1DE2025EC(&qword_1EDB82278, (uint64_t (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport, (uint64_t)&protocol conformance descriptor for Ckcode_RecordTransport);
  return static Message.with(_:)();
}

uint64_t sub_1DE212344(uint64_t *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[32];

  v9 = a3 | 0x2000000000000000;
  v10 = *a1;
  v11 = a1[1];
  sub_1DE1FFB64(a2, a3);
  result = sub_1DE205560(v10, v11);
  *a1 = a2;
  a1[1] = v9;
  if (*(_QWORD *)(a5 + 16) > a4)
  {
    if (a4 < 0)
    {
      __break(1u);
    }
    else
    {
      sub_1DE20587C(a5 + 32 * a4 + 32, (uint64_t)v16);
      result = swift_dynamicCast();
      if ((result & 1) != 0)
      {
        v13 = (char *)a1 + *(int *)(type metadata accessor for Ckcode_RecordTransport() + 24);
        result = sub_1DE1FFC40(*(_QWORD *)v13, *((_QWORD *)v13 + 1));
        *(_QWORD *)v13 = v14;
        *((_QWORD *)v13 + 1) = v15;
      }
    }
  }
  return result;
}

uint64_t sub_1DE212424(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;

  sub_1DE215754((uint64_t)a1);
  *a1 = a2;
  a1[1] = a3;
  v6 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  swift_storeEnumTagMultiPayload();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
  return sub_1DE1FFB64(a2, a3);
}

void sub_1DE2124A4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
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
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(_QWORD);
  unint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  int64_t v48;
  char v49;
  _BOOL8 v50;
  id v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[3];
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _OWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  unint64_t v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;

  sub_1DE216FF0();
  v67 = v2;
  v68 = v1;
  v69 = v0;
  v70 = v3;
  v5 = v4;
  v6 = *MEMORY[0x1E0DEEDD8] & *v0;
  v7 = sub_1DE2171A8();
  v64 = *(_QWORD *)(v7 - 8);
  v65 = v7;
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v8);
  sub_1DE217084();
  v71 = v9;
  sub_1DE21712C();
  MEMORY[0x1E0C80A78](v10);
  v63 = (_OWORD *)((char *)v55 - v11);
  sub_1DE21712C();
  MEMORY[0x1E0C80A78](v12);
  v14 = (_QWORD *)((char *)v55 - v13);
  v15 = *(_QWORD *)(v6 + 88);
  v16 = sub_1DE2174C4();
  v61 = *(_QWORD *)(v16 - 8);
  v62 = v16;
  sub_1DE217014();
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)v55 - v18;
  type metadata accessor for BinaryDecodingOptions();
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v20);
  sub_1DE204324();
  v66 = *(_QWORD *)(v15 - 8);
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v21);
  sub_1DE204214();
  v24 = v22 - v23;
  MEMORY[0x1E0C80A78](v25);
  v27 = (char *)v55 - v26;
  v74 = 0;
  v72 = 0u;
  v73 = 0u;
  v28 = *(_QWORD *)(v6 + 104);
  sub_1DE219434();
  sub_1DE1FFB64(v5, v70);
  j___s21InternalSwiftProtobuf21BinaryDecodingOptionsVACycfC();
  Message.init(serializedData:extensions:partial:options:)();
  v70 = v24;
  v29 = *(void (**)(char *, char *, uint64_t))(v66 + 16);
  v29(v19, v27, v15);
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v19, 0, 1, v15);
  sub_1DE20EF4C();
  sub_1DE2025EC(&qword_1EDB82278, (uint64_t (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport, (uint64_t)&protocol conformance descriptor for Ckcode_RecordTransport);
  v59 = v28;
  v60 = v15;
  v58 = v30;
  v31 = sub_1DE2061D4(v65, v15, v65, v28, v30);
  v57 = 0;
  v55[0] = v29;
  v55[1] = v19;
  v32 = *(_QWORD *)(v31 + 16);
  v33 = v71;
  if (!v32)
  {
    swift_bridgeObjectRelease();
    v39 = (char *)MEMORY[0x1E0DEE9D8];
LABEL_14:
    v53 = (uint64_t)v63;
    *v63 = xmmword_1DE226BD0;
    v54 = v65;
    UnknownStorage.init()();
    *(_OWORD *)(v53 + *(int *)(v54 + 24)) = xmmword_1DE226500;
    sub_1DE2008C4(v53, v33, (uint64_t (*)(_QWORD))type metadata accessor for Ckcode_RecordTransport);
    sub_1DE2195A8(v33, *((_QWORD *)v39 + 2));
    Message.substituteMessages<A>(substitutionType:substitutions:)();
  }
  v56 = v27;
  sub_1DE2172A8();
  v55[2] = v34;
  v36 = v34 + v35;
  v38 = *(_QWORD *)(v37 + 72);
  v39 = (char *)MEMORY[0x1E0DEE9D8];
  while (1)
  {
    sub_1DE2008C4(v36, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for Ckcode_RecordTransport);
    v40 = *v14;
    v41 = v14[1];
    sub_1DE211704(*v14, v41);
    v42 = sub_1DE204208();
    sub_1DE215794(v42, v43);
    if ((~v41 & 0x3000000000000000) == 0)
      goto LABEL_13;
    if ((v41 & 0x2000000000000000) == 0)
      break;
    sub_1DE205854(v40, v41);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v47 = (char *)sub_1DE2170E8();
      v39 = sub_1DE215624(v47, v48, v49, (uint64_t)v39);
    }
    v45 = *((_QWORD *)v39 + 2);
    v44 = *((_QWORD *)v39 + 3);
    if (v45 >= v44 >> 1)
    {
      v50 = sub_1DE217288(v44);
      v39 = sub_1DE215624((char *)v50, v45 + 1, 1, (uint64_t)v39);
    }
    *((_QWORD *)v39 + 2) = v45 + 1;
    v46 = &v39[16 * v45];
    *((_QWORD *)v46 + 4) = v40;
    *((_QWORD *)v46 + 5) = v41 & 0xDFFFFFFFFFFFFFFFLL;
    sub_1DE2174F0();
    v36 += v38;
    --v32;
    v33 = v71;
    if (!v32)
    {
      sub_1DE217480();
      goto LABEL_14;
    }
  }
  sub_1DE2174F0();
LABEL_13:
  sub_1DE21722C();
  sub_1DE217480();
  sub_1DE21715C();
  v51 = (id)related decl 'e' for CKErrorCode.init(_:description:)();
  sub_1DE217498();
  sub_1DE2174FC();
  sub_1DE2170E0(v69, sel_finishWithError_);

  v52 = v14;
  sub_1DE2174DC();

  (*(void (**)(char *, uint64_t))(v66 + 8))(v56, v60);
  sub_1DE2041DC();
}

void sub_1DE212A04()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t (*v8)();
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
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  int64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)();
  uint64_t v45;
  unint64_t v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  _QWORD *v52;

  sub_1DE216FF0();
  v52 = v0;
  v1 = *MEMORY[0x1E0DEEDD8] & *v0;
  v2 = *(_QWORD *)(v1 + 88);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v38 - v5;
  v7 = type metadata accessor for Optional();
  v8 = *(uint64_t (**)())(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  sub_1DE204214();
  v11 = v9 - v10;
  MEMORY[0x1E0C80A78](v12);
  v47 = (char *)&v38 - v13;
  sub_1DE21712C();
  MEMORY[0x1E0C80A78](v14);
  v16 = (uint64_t)&v38 - v15;
  v50 = *(_QWORD *)(sub_1DE2171A8() - 8);
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v17);
  sub_1DE204214();
  v20 = v18 - v19;
  v22 = (char *)MEMORY[0x1E0C80A78](v21);
  v25 = (uint64_t *)((char *)&v38 - v24);
  if (v23 >> 62)
  {
LABEL_18:
    v40 = v22;
    v41 = v1;
    v51 = v23;
    swift_bridgeObjectRetain();
    v1 = v41;
    v48 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    v26 = v48;
    v22 = v40;
    v23 = v51;
    if (!v48)
      goto LABEL_16;
  }
  else
  {
    v26 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v26)
      goto LABEL_16;
  }
  v40 = v22;
  v41 = v1;
  v38 = v6;
  v39 = v3;
  v42 = v11;
  v43 = v16;
  v44 = v8;
  v45 = v7;
  v46 = v2;
  v48 = v26;
  v49 = v23 & 0xC000000000000001;
  v51 = v23;
  swift_bridgeObjectRetain();
  v7 = 0;
  v11 = MEMORY[0x1E0DEE9D8];
  v16 = 4;
  v8 = type metadata accessor for Ckcode_RecordTransport;
  do
  {
    v1 = v16 - 4;
    if (v49)
      v22 = (char *)MEMORY[0x1DF0EA080](v16 - 4, v51);
    else
      v22 = (char *)*(id *)(v51 + 8 * v16);
    v6 = v22;
    v3 = v16 - 3;
    if (__OFADD__(v1, 1))
    {
      __break(1u);
      goto LABEL_18;
    }
    sub_1DE212E00(v22);
    v27 = v6;
    Ckcode_RecordTransport.init(_:)(v27, v25);
    sub_1DE2008C4((uint64_t)v25, v20, (uint64_t (*)(_QWORD))type metadata accessor for Ckcode_RecordTransport);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v31 = sub_1DE2170E8();
      v11 = sub_1DE2157CC(v31, v32, v33, v11);
    }
    v2 = *(_QWORD *)(v11 + 16);
    v28 = *(_QWORD *)(v11 + 24);
    if (v2 >= v28 >> 1)
    {
      v34 = sub_1DE217288(v28);
      v11 = sub_1DE2157CC(v34, v2 + 1, 1, v11);
    }
    *(_QWORD *)(v11 + 16) = v2 + 1;
    sub_1DE2172A8();
    sub_1DE202628(v20, v11 + v29 + *(_QWORD *)(v30 + 72) * v2, (uint64_t (*)(_QWORD))type metadata accessor for Ckcode_RecordTransport);

    sub_1DE215794((uint64_t)v25, (uint64_t (*)(_QWORD))type metadata accessor for Ckcode_RecordTransport);
    ++v16;
  }
  while (v3 != v48);
  swift_bridgeObjectRelease();
  v35 = (uint64_t)v47;
  sub_1DE20EF08();
  v36 = v46;
  if (!_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v35, 1, v46))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v38, v35, v36);
    sub_1DE217114();
    sub_1DE2025EC(&qword_1EDB82278, (uint64_t (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport, (uint64_t)&protocol conformance descriptor for Ckcode_RecordTransport);
    Message.substituteMessages<A>(substitutionType:substitutions:)();
  }
  sub_1DE2173E4();
  sub_1DE217114();
  v37 = v43;
  sub_1DE217234(v43, 1);
  sub_1DE217360(v42, v37, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 16));
  sub_1DE20EF4C();
  ((void (*)(uint64_t, uint64_t))v2)(v37, v35);
LABEL_16:
  sub_1DE2041DC();
}

void sub_1DE212E00(void *a1)
{
  void *v1;
  uint64_t v2;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  void *v41;
  unsigned int v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  Swift::String v48;
  void *v49;
  int64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  int64_t v55;
  uint64_t v56;
  id v57;
  int64_t v58;
  void *v59;
  id v60[5];

  v60[4] = *(id *)MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1, sel_recordID);
  v57 = v1;
  sub_1DE20FB80();
  v5 = (void *)sub_1DE204208();
  sub_1DE20FAD8(v5, v6);
  v8 = v7;

  swift_bridgeObjectRelease();
  if (!v8)
    return;
  v9 = 0;
  v10 = v8 + 64;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  if (v11 < 64)
    v12 = ~(-1 << v11);
  else
    v12 = -1;
  v13 = v12 & *(_QWORD *)(v8 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  v52 = a1;
  v53 = v2;
  v56 = v8;
  v50 = v14;
  v51 = v8 + 64;
  if (!v13)
    goto LABEL_7;
LABEL_6:
  v54 = (v13 - 1) & v13;
  v55 = v9;
  for (i = __clz(__rbit64(v13)) | (v9 << 6); ; i = __clz(__rbit64(v17)) + (v18 << 6))
  {
    v20 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * i);
    v21 = *v20;
    v22 = (void *)v20[1];
    v23 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * i);
    sub_1DE2172C8();
    swift_bridgeObjectRetain();
    v24 = CKRecord.subscript.getter();
    v25 = *(_QWORD *)(v23 + 64);
    v26 = 1 << *(_BYTE *)(v23 + 32);
    if (v26 < 64)
      v27 = ~(-1 << v26);
    else
      v27 = -1;
    v58 = (unint64_t)(v26 + 63) >> 6;
    if ((v27 & v25) != 0)
    {
      v28 = __clz(__rbit64(v27 & v25));
      goto LABEL_39;
    }
    if ((unint64_t)(v26 + 63) >> 6 > 1)
    {
      v29 = *(_QWORD *)(v23 + 72);
      v30 = 1;
      if (v29)
        goto LABEL_38;
      v30 = 2;
      if (v58 > 2)
      {
        v29 = *(_QWORD *)(v23 + 80);
        if (v29)
          goto LABEL_38;
        v30 = 3;
        if (v58 > 3)
        {
          v29 = *(_QWORD *)(v23 + 88);
          if (v29)
            goto LABEL_38;
          v31 = 4;
          if (v58 > 4)
            break;
        }
      }
    }
LABEL_50:
    sub_1DE217294();
    sub_1DE217378();
    sub_1DE2172F0();
    v8 = v56;
    v14 = v50;
    v10 = v51;
    v13 = v54;
    v9 = v55;
    if (v54)
      goto LABEL_6;
LABEL_7:
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
      goto LABEL_60;
    if (v16 >= v14)
    {
LABEL_58:
      swift_release();
      return;
    }
    v17 = *(_QWORD *)(v10 + 8 * v16);
    v18 = v9 + 1;
    if (!v17)
    {
      v18 = v9 + 2;
      if (v9 + 2 >= v14)
        goto LABEL_58;
      v17 = *(_QWORD *)(v10 + 8 * v18);
      if (!v17)
      {
        v18 = v9 + 3;
        if (v9 + 3 >= v14)
          goto LABEL_58;
        v17 = *(_QWORD *)(v10 + 8 * v18);
        if (!v17)
        {
          v19 = v9 + 4;
          if (v9 + 4 >= v14)
            goto LABEL_58;
          v17 = *(_QWORD *)(v10 + 8 * v19);
          if (!v17)
          {
            while (1)
            {
              v18 = v19 + 1;
              if (__OFADD__(v19, 1))
                goto LABEL_61;
              if (v18 >= v14)
                goto LABEL_58;
              v17 = *(_QWORD *)(v10 + 8 * v18);
              ++v19;
              if (v17)
                goto LABEL_20;
            }
          }
          v18 = v9 + 4;
        }
      }
    }
LABEL_20:
    v54 = (v17 - 1) & v17;
    v55 = v18;
  }
  v29 = *(_QWORD *)(v23 + 96);
  if (!v29)
  {
    while (1)
    {
      v30 = v31 + 1;
      if (__OFADD__(v31, 1))
        break;
      if (v30 >= v58)
        goto LABEL_50;
      v29 = *(_QWORD *)(v23 + 64 + 8 * v30);
      ++v31;
      if (v29)
        goto LABEL_38;
    }
    __break(1u);
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
    JUMPOUT(0x1DE2134E0);
  }
  v30 = 4;
LABEL_38:
  v28 = __clz(__rbit64(v29)) + (v30 << 6);
LABEL_39:
  v32 = *(void **)(*(_QWORD *)(v23 + 56) + 8 * v28);
  if (!v24)
    goto LABEL_52;
  v33 = *(_QWORD *)(*(_QWORD *)(v23 + 48) + 8 * v28);
  objc_opt_self();
  v34 = sub_1DE21748C();
  if (v34)
  {
    v35 = (void *)v34;
    v36 = v32;
    swift_unknownObjectRetain();
    if (v33 < 0 || v33 >= (uint64_t)objc_msgSend(v35, sel_count))
    {
      sub_1DE2172F0();
      related decl 'e' for CKErrorCode.init(_:description:)();
      sub_1DE2173B4();
      sub_1DE21746C();
      sub_1DE217378();

      swift_unknownObjectRelease_n();
      return;
    }
    v37 = objc_msgSend(v35, sel_objectAtIndexedSubscript_, v33);
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_1DE217294();
    sub_1DE209038(0, (unint64_t *)&qword_1F04387D8);
    swift_dynamicCast();
    v38 = v59;
    goto LABEL_46;
  }
  objc_opt_self();
  v39 = sub_1DE21748C();
  if (!v39)
  {
LABEL_52:
    v47 = v32;
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    v60[0] = (id)0xD00000000000002CLL;
    v60[1] = (id)0x80000001DE22B3F0;
    v48._countAndFlagsBits = v21;
    v48._object = v22;
    String.append(_:)(v48);
    swift_bridgeObjectRelease();
    related decl 'e' for CKErrorCode.init(_:description:)();
    sub_1DE2173B4();
    sub_1DE21746C();
    sub_1DE217378();
    sub_1DE217294();

    return;
  }
  v38 = (id)v39;
  swift_unknownObjectRetain_n();
  v40 = v32;
LABEL_46:
  if (*MEMORY[0x1E0C95280]
    && (v41 = (void *)MEMORY[0x1DF0E9E7C](0xD000000000000018, 0x80000001DE22B420),
        v42 = objc_msgSend(v57, sel__BOOLForUnitTestOverride_defaultValue_, v41, 0),
        v41,
        v42))
  {
    sub_1DE2172F0();
    objc_msgSend(v38, sel_setAssetContent_, 0);
    type metadata accessor for CKError(0);
    sub_1DE21FDF0(MEMORY[0x1E0DEE9D8]);
    sub_1DE2025EC((unint64_t *)&unk_1F0438CA0, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1DE226A90);
    _BridgedStoredNSError.init(_:userInfo:)();
  }
  else
  {
    v60[0] = 0;
    v43 = objc_msgSend(v32, sel_assetContentWithExpectedSignature_verificationKey_error_, 0, 0, v60, v50, v51, v52, v53);
    v44 = v60[0];
    if (v43)
    {
      static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v46 = v45;

      __asm { BR              X9 }
    }
    v49 = v44;
    sub_1DE2172F0();
    _convertNSErrorToError(_:)();

  }
  swift_willThrow();
  sub_1DE21746C();
  sub_1DE217378();
  sub_1DE217294();

}

void sub_1DE2134F8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void *, id, uint64_t);
  void (*v10)(void *, id, uint64_t);
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  id v18;
  char v19;
  char v20;
  id v21;
  _QWORD *v22;
  uint8_t *v23;

  sub_1DE216FF0();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v7 = type metadata accessor for Logger();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  sub_1DE204324();
  if (v6)
  {
    sub_1DE21038C();
    if (v9)
    {
      v10 = v9;
      v11 = v6;
      if (v4)
      {
        v12 = v4;
        sub_1DE212E00(v12);

      }
      sub_1DE2173C8();
      v10(v4, v11, v2);
      sub_1DE204AEC((uint64_t)v10);
    }
    else
    {
      v18 = v6;
      sub_1DE2173C8();
    }
    sub_1DE2108B8();
    if ((v19 & 1) != 0)
    {
      sub_1DE2107EC();
      if ((v20 & 1) != 0)
      {
        sub_1DE216F58();
        v21 = v6;
        type metadata accessor for CodeOperation.AssetInfo();
      }
    }
    if (v2)
      sub_1DE20F0F4(v2);

  }
  else
  {
    CKLog.getter();
    v13 = v0;
    v14 = Logger.logObject.getter();
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)sub_1DE208880();
      v22 = (_QWORD *)sub_1DE208880();
      v23 = v16;
      *(_DWORD *)v16 = 138412290;
      v17 = v13;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v22 = v13;

      sub_1DE2089AC(&dword_1DE1FE000, v14, v15, "Ignoring handleFetch with nil recordID %@", v23);
      sub_1DE1FFE88(qword_1EDB81DB0);
      sub_1DE208930();
      sub_1DE208874();
    }

    (*(void (**)(void *, uint64_t))(v8 + 8))(v0, v7);
  }
  sub_1DE2041DC();
}

void sub_1DE213790(uint64_t a1, double a2)
{
  void (*v4)(uint64_t, double);
  uint64_t v5;

  sub_1DE21053C();
  if (v4)
  {
    v4(a1, a2);
    v5 = sub_1DE204208();
    sub_1DE204AEC(v5);
  }
}

void sub_1DE2137F4()
{
  sub_1DE216F58();
  sub_1DE21716C();
  type metadata accessor for CodeOperation.AssetInfo();
}

void sub_1DE213868()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  Class isa;

  sub_1DE20F5BC(v4, v3, v2, v1);
  v6 = v5;
  swift_endAccess();
  sub_1DE21729C();
  isa = Data._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v6, sel_writeData_atOffset_, isa, v0);

}

void sub_1DE2138D8()
{
  _QWORD *v0;
  void *v1;
  void *v2;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint8_t *v23;
  _QWORD *v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  _QWORD *v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  _QWORD *v42;
  _QWORD *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[2];
  uint64_t v60;
  uint64_t v61;
  char *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  _QWORD *v68;
  _QWORD *v69;

  sub_1DE216FF0();
  v2 = v1;
  v3 = *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58);
  v4 = sub_1DE2174D0();
  v64 = *(_QWORD *)(v4 - 8);
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v5);
  sub_1DE204214();
  v8 = v6 - v7;
  MEMORY[0x1E0C80A78](v9);
  v62 = (char *)v59 - v10;
  v61 = *(_QWORD *)(v3 - 8);
  sub_1DE217014();
  MEMORY[0x1E0C80A78](v11);
  v60 = (uint64_t)v59 - v12;
  v13 = type metadata accessor for Logger();
  v68 = *(_QWORD **)(v13 - 8);
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v14);
  sub_1DE217084();
  v67 = v15;
  sub_1DE21712C();
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)v59 - v17;
  CKLog.getter();
  v19 = v0;
  v20 = Logger.logObject.getter();
  v21 = static os_log_type_t.info.getter();
  v22 = os_log_type_enabled(v20, v21);
  v65 = v8;
  v66 = v4;
  if (v22)
  {
    v59[1] = v3;
    v23 = (uint8_t *)sub_1DE208880();
    v59[0] = sub_1DE208880();
    *(_DWORD *)v23 = 138412290;
    v63 = v2;
    v69 = v19;
    v24 = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_QWORD *)v59[0] = v19;

    sub_1DE2089AC(&dword_1DE1FE000, v20, v21, "In CodeOperation._finishOnCallbackQueueWithError() for %@", v23);
    sub_1DE1FFE88(qword_1EDB81DB0);
    sub_1DE208930();
    sub_1DE208874();
  }

  v25 = (void (*)(char *, uint64_t))v68[1];
  v25(v18, v13);
  sub_1DE21071C();
  if (v26)
  {
    v27 = v26;
    v28 = v2;
    if (v2 || (sub_1DE20F0B8(), (v28 = v29) != 0))
    {
      v30 = v2;
      v31 = v28;
      v32 = (void *)_convertErrorToNSError(_:)();

      v33 = v65;
      sub_1DE217250();
      _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v34, v35, v36, v3);
      v37 = objc_msgSend(v32, sel_CKClientSuitableError);
      sub_1DE217410();
      sub_1DE204AEC(v27);

      (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v33, v66);
    }
    else
    {
      v45 = (uint64_t)v62;
      sub_1DE20EF08();
      v46 = v45;
      v47 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v45, 1, v3);
      v48 = v3;
      v50 = v65;
      v49 = v66;
      v51 = v64;
      if (v47 == 1)
      {
        v52 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
        v52(v46, v66);
        sub_1DE217250();
        _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v53, v54, v55, v48);
        v56 = (void *)related decl 'e' for CKErrorCode.init(_:description:)();
        sub_1DE217410();
        sub_1DE204AEC(v27);

        v52(v50, v49);
        v2 = 0;
      }
      else
      {
        v57 = v60;
        v58 = v61;
        sub_1DE217360(v60, v46, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v61 + 32));
        sub_1DE217360(v50, v57, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v58 + 16));
        _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v50, 0, 1, v48);
        sub_1DE217410();
        sub_1DE204AEC(v27);
        (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v50, v66);
        (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v48);
      }
    }
  }
  else
  {
    CKLog.getter();
    v38 = v19;
    v39 = Logger.logObject.getter();
    v40 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v39, v40))
    {
      v63 = v2;
      v41 = (uint8_t *)sub_1DE208880();
      v42 = (_QWORD *)sub_1DE208880();
      v66 = v13;
      *(_DWORD *)v41 = 138412290;
      v69 = v38;
      v43 = v38;
      v68 = v19;
      v44 = v43;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v42 = v38;

      sub_1DE2089AC(&dword_1DE1FE000, v39, v40, "In CodeOperation._finishOnCallbackQueueWithError(), no completion block set for %@", v41);
      sub_1DE1FFE88(qword_1EDB81DB0);
      sub_1DE208930();
      sub_1DE208874();
    }

    v25(v67, v13);
  }
  sub_1DE213E04((uint64_t)v19, (uint64_t)v2);
}

void sub_1DE213E04(uint64_t a1, uint64_t a2)
{
  if (a2)
    _convertErrorToNSError(_:)();
  type metadata accessor for CodeOperation();
}

void sub_1DE213E5C(objc_class *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, objc_super a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = v19;
  v21.super_class = a1;
  -[objc_class _finishOnCallbackQueueWithError:](&v21, sel__finishOnCallbackQueueWithError_, v20);

}

void sub_1DE213E8C(void *a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a1;
  a3;
  sub_1DE2138D8();
}

void sub_1DE213EB8()
{
  void *v0;
  void *v1;

}

void sub_1DE213ED0(_OWORD *a1@<X8>)
{
  uint64_t v2;

  sub_1DE20F584();
  if (v2)
  {
    sub_1DE21716C();
    type metadata accessor for CodeOperation.CallbackRelay();
  }
  *a1 = 0u;
  a1[1] = 0u;
  sub_1DE216F80();
}

id sub_1DE213F30()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  __int128 v7;
  uint64_t v8;

  sub_1DE213ED0(&v7);
  v0 = v8;
  if (!v8)
    return 0;
  v1 = sub_1DE2084DC(&v7, v8);
  v2 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v2 + 16))(v4);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v0);
  sub_1DE20585C((uint64_t)&v7);
  return v5;
}

void sub_1DE213FFC()
{
  JUMPOUT(0x1DF0EA71CLL);
}

void sub_1DE21400C()
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  type metadata accessor for CodeOperation.CallbackRelay();
}

id sub_1DE214068(objc_class *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, objc_super a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  void *v19;
  void *v20;
  id v21;
  objc_super v23;

  v23.receiver = v20;
  v23.super_class = a1;
  v21 = -[objc_class init](&v23, sel_init);

  return v21;
}

uint64_t sub_1DE21409C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = v0;
  return swift_task_switch();
}

void sub_1DE2140B4()
{
  sub_1DE213FFC();
}

uint64_t sub_1DE2140D0(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  *(_QWORD *)(v1 + 128) = result;
  if (result)
  {
    v2 = sub_1DE217308((uint64_t)sub_1DE214138);
    *(_QWORD *)(v1 + 80) = MEMORY[0x1E0C809B0];
    v3 = (_QWORD *)(v1 + 80);
    v3[1] = 0x40000000;
    v3[2] = sub_1DE2196D0;
    v3[3] = &unk_1EA8C8810;
    v3[4] = v2;
    sub_1DE21750C(v2, sel_handleWillStart_);
    return sub_1DE21717C();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DE214138()
{
  sub_1DE2171C0();
  return sub_1DE20A4A4();
}

uint64_t sub_1DE214178(void *a1, int a2, void *aBlock)
{
  return sub_1DE214350(a1, a2, aBlock);
}

uint64_t sub_1DE21418C(const void *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_1DE216F28;
  return sub_1DE21409C();
}

uint64_t sub_1DE2141EC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = v0;
  return swift_task_switch();
}

void sub_1DE214204()
{
  sub_1DE213FFC();
}

uint64_t sub_1DE214220(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  *(_QWORD *)(v1 + 128) = result;
  if (result)
  {
    v2 = sub_1DE217308((uint64_t)sub_1DE214288);
    *(_QWORD *)(v1 + 80) = MEMORY[0x1E0C809B0];
    v3 = (_QWORD *)(v1 + 80);
    v3[1] = 0x40000000;
    v3[2] = sub_1DE2196D0;
    v3[3] = &unk_1EA8C8718;
    v3[4] = v2;
    sub_1DE21750C(v2, sel_handleDidStart_);
    return sub_1DE21717C();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DE214288()
{
  sub_1DE2171C0();
  return sub_1DE20A4A4();
}

uint64_t sub_1DE2142C8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DE2142FC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 128);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DE21433C(void *a1, int a2, void *aBlock)
{
  return sub_1DE214350(a1, a2, aBlock);
}

uint64_t sub_1DE214350(void *a1, int a2, void *aBlock)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v4 = _Block_copy(aBlock);
  sub_1DE217380();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = a1;
  v6 = a1;
  v7 = sub_1DE204208();
  return sub_1DE219760(v7, v8);
}

uint64_t sub_1DE2143A0(const void *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_1DE214400;
  return sub_1DE2141EC();
}

uint64_t sub_1DE214400()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*v1 + 16);
  v3 = *v1;
  swift_task_dealloc();

  v4 = *(_QWORD *)(v3 + 24);
  if (v0)
  {
    v5 = (void *)_convertErrorToNSError(_:)();

    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(v3 + 24), 0);
  }
  _Block_release(*(const void **)(v3 + 24));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

void sub_1DE2144A0()
{
  sub_1DE214974();
}

void sub_1DE2144AC(void *a1)
{
  a1;
  sub_1DE2144A0();
}

void sub_1DE2144CC()
{
  void *v0;

}

void sub_1DE2144E0()
{
  sub_1DE21454C();
}

void sub_1DE2144EC(void *a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  a1;
  sub_1DE2144E0();
}

void sub_1DE214524()
{
  void *v0;
  void *v1;

}

void sub_1DE214540()
{
  sub_1DE21454C();
}

void sub_1DE21454C()
{
  sub_1DE213FFC();
}

void sub_1DE21456C(void *a1)
{
  SEL *v1;

  if (a1)
  {
    sub_1DE217264(a1, *v1);

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE214598(void *a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  a1;
  sub_1DE214540();
}

void sub_1DE2145D0()
{
  void *v0;
  void *v1;

}

void sub_1DE2145EC()
{
  sub_1DE214640();
}

void sub_1DE214608(void *a1, int a2, void *a3, void *a4)
{
  sub_1DE21471C(a1, a2, a3, a4, (uint64_t)&unk_1EA8C9FE0, (uint64_t)sub_1DE216C80, (void (*)(id, uint64_t, uint64_t))sub_1DE2145EC);
}

void sub_1DE214624()
{
  sub_1DE214640();
}

void sub_1DE214640()
{
  sub_1DE213FFC();
}

void sub_1DE214678(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  SEL *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;
  _QWORD v32[16];

  if (a1)
  {
    v32[4] = v29;
    v32[5] = v26;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 1107296256;
    v32[2] = v28;
    v32[3] = v27;
    v31 = _Block_copy(v32);
    swift_retain();
    swift_release();
    objc_msgSend(a1, *v24, v25, v31);
    _Block_release(v31);

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE214700(void *a1, int a2, void *a3, void *a4)
{
  sub_1DE21471C(a1, a2, a3, a4, (uint64_t)&unk_1EA8C9FB8, (uint64_t)sub_1DE216C78, (void (*)(id, uint64_t, uint64_t))sub_1DE214624);
}

void sub_1DE21471C(void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(id, uint64_t, uint64_t))
{
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v11 = _Block_copy(aBlock);
  v12 = sub_1DE2172D0();
  *(_QWORD *)(v12 + 16) = v11;
  v13 = a3;
  v14 = a1;
  a7(v13, a6, v12);
  JUMPOUT(0x1DE214780);
}

void sub_1DE2147A0()
{
  sub_1DE213FFC();
}

void sub_1DE2147C0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    if (v2)
      v4 = _convertErrorToNSError(_:)();
    else
      v4 = 0;
    v5 = (void *)v4;
    objc_msgSend(a1, sel_handleOperationDidCompleteWithMetrics_error_, v1);

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE214818(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;

  v6 = a3;
  a1;
  a4;
  sub_1DE2147A0();
}

void sub_1DE214860()
{
  void *v0;
  void *v1;
  void *v2;

}

void sub_1DE214880()
{
  sub_1DE213FFC();
}

void sub_1DE2148A8(void *a1)
{
  char v1;
  char v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    if (v3)
      v5 = _convertErrorToNSError(_:)();
    else
      v5 = 0;
    v6 = (void *)v5;
    objc_msgSend(a1, sel_handleDiscretionaryOperationShouldStart_nonDiscretionary_error_, v2 & 1, v1 & 1);

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE214908(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a1;
  a5;
  sub_1DE214880();
}

void sub_1DE21494C()
{
  void *v0;
  void *v1;

}

void sub_1DE214968()
{
  sub_1DE214974();
}

void sub_1DE214974()
{
  sub_1DE213FFC();
}

void sub_1DE21498C(void *a1)
{
  SEL *v1;

  if (a1)
  {
    objc_msgSend(a1, *v1);
    sub_1DE217150(a1);
  }
  else
  {
    __break(1u);
  }
}

void sub_1DE2149AC(void *a1)
{
  a1;
  sub_1DE214968();
}

void sub_1DE2149CC()
{
  void *v0;

}

void sub_1DE2149E0()
{
  sub_1DE213FFC();
}

void sub_1DE214A14(void *a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  _QWORD v9[16];

  if (a1)
  {
    v7 = (void *)MEMORY[0x1DF0E9E7C](v5, v4);
    v9[4] = v3;
    v9[5] = v2;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 1107296256;
    v9[2] = sub_1DE219A68;
    v9[3] = &unk_1EA8C8798;
    v8 = _Block_copy(v9);
    swift_retain();
    swift_release();
    objc_msgSend(a1, sel_handleDaemonOperationWillStartWithClassName_isTopLevelDaemonOperation_replyBlock_, v7, v1 & 1, v8);
    _Block_release(v8);

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE214AC8(void *a1, int a2, int a3, int a4, void *aBlock)
{
  void *v6;
  id v7;

  v6 = _Block_copy(aBlock);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v7 = a1;
  sub_1DE2149E0();
}

uint64_t sub_1DE214B48()
{
  void *v0;

  swift_bridgeObjectRelease();
  return swift_release();
}

void sub_1DE214B6C()
{
  sub_1DE214BB0();
}

void sub_1DE214B80(void *a1, int a2, int a3, void *a4, void *a5)
{
  sub_1DE214CB8(a1, a2, a3, a4, a5, (uint64_t)&unk_1EA8C9F68, (uint64_t)sub_1DE216ED0, (void (*)(uint64_t, uint64_t, id, uint64_t, uint64_t))sub_1DE214B6C);
}

void sub_1DE214B9C()
{
  sub_1DE214BB0();
}

void sub_1DE214BB0()
{
  sub_1DE213FFC();
}

void sub_1DE214BF0(void *a1)
{
  uint64_t v1;
  SEL *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;
  _QWORD v11[18];

  if (a1)
  {
    v9 = (void *)MEMORY[0x1DF0E9E7C](v7, v6);
    v11[4] = v5;
    v11[5] = v3;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 1107296256;
    v11[2] = sub_1DE219A68;
    v11[3] = v4;
    v10 = _Block_copy(v11);
    swift_retain();
    swift_release();
    objc_msgSend(a1, *v2, v9, v1, v10);
    _Block_release(v10);

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE214C9C(void *a1, int a2, int a3, void *a4, void *a5)
{
  sub_1DE214CB8(a1, a2, a3, a4, a5, (uint64_t)&unk_1EA8C9F40, (uint64_t)sub_1DE216C70, (void (*)(uint64_t, uint64_t, id, uint64_t, uint64_t))sub_1DE214B9C);
}

void sub_1DE214CB8(void *a1, int a2, int a3, void *a4, void *aBlock, uint64_t a6, uint64_t a7, void (*a8)(uint64_t, uint64_t, id, uint64_t, uint64_t))
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;

  v12 = _Block_copy(aBlock);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = v14;
  v16 = sub_1DE2172D0();
  *(_QWORD *)(v16 + 16) = v12;
  v17 = a4;
  v18 = a1;
  a8(v13, v15, v17, a7, v16);
  JUMPOUT(0x1DE214D3CLL);
}

void sub_1DE214D64()
{
  sub_1DE213FFC();
}

void sub_1DE214D94(void *a1)
{
  if (a1)
  {
    sub_1DE211DDC();

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE214DDC(void *a1, int a2, int a3, int a4, int a5, void *aBlock)
{
  void *v7;
  id v8;

  v7 = _Block_copy(aBlock);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(swift_allocObject() + 16) = v7;
  v8 = a1;
  sub_1DE214D64();
}

uint64_t sub_1DE214E90()
{
  void *v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

void sub_1DE214EC8()
{
  sub_1DE213FFC();
}

void sub_1DE214EF4(void *a1)
{
  if (a1)
  {
    sub_1DE2124A4();

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE214F38(void *a1, int a2, void *a3, void *aBlock)
{
  void *v6;
  id v7;

  v6 = _Block_copy(aBlock);
  v7 = a3;
  a1;
  static Data._unconditionallyBridgeFromObjectiveC(_:)();

  *(_QWORD *)(swift_allocObject() + 16) = v6;
  sub_1DE214EC8();
}

void sub_1DE214FC0()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;

  swift_release();
  sub_1DE1FFC54(v0, v1);

}

void sub_1DE214FF0()
{
  sub_1DE213FFC();
}

void sub_1DE215008(void *a1)
{
  if (a1)
  {
    sub_1DE212A04();

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE215038(void *a1)
{
  id v2;

  sub_1DE209038(0, &qword_1F0438C60);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v2 = a1;
  sub_1DE214FF0();
}

uint64_t sub_1DE215084()
{
  void *v0;

  return swift_bridgeObjectRelease();
}

void sub_1DE215098()
{
  sub_1DE213FFC();
}

void sub_1DE2150BC(void *a1)
{
  if (a1)
  {
    sub_1DE2134F8();

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE2150F8(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;

  v8 = a3;
  v9 = a4;
  a1;
  a5;
  sub_1DE215098();
}

void sub_1DE215154()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

}

void sub_1DE21517C()
{
  sub_1DE213FFC();
}

void sub_1DE21519C(void *a1)
{
  uint64_t v1;
  double v2;

  if (a1)
  {
    sub_1DE213790(v1, v2);

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE2151D4(void *a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  a1;
  sub_1DE21517C();
}

void sub_1DE215218()
{
  void *v0;
  void *v1;

}

void sub_1DE215238()
{
  sub_1DE213FFC();
}

void sub_1DE215274(uint64_t a1)
{
  if (a1)
    sub_1DE2137F4();
  __break(1u);
}

void sub_1DE2152C8(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  id v10;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = a3;
  v10 = a6;
  a1;
  static Data._unconditionallyBridgeFromObjectiveC(_:)();

  sub_1DE215238();
}

uint64_t sub_1DE215358()
{
  void *v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;

  sub_1DE1FFC54(v2, v3);

  return swift_bridgeObjectRelease();
}

void sub_1DE21538C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1DE2153B8()
{
  sub_1DE21538C();
}

id sub_1DE2153D8()
{
  return sub_1DE215458();
}

uint64_t sub_1DE2153E4()
{
  return swift_unknownObjectWeakDestroy();
}

id CodeOperation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CodeOperation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1DE215440()
{
  CodeOperation.init()();
}

id CodeOperation.__deallocating_deinit()
{
  return sub_1DE215458();
}

id sub_1DE215458()
{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  objc_super v4;

  v1 = sub_1DE21716C();
  v4.receiver = v0;
  v4.super_class = (Class)v2(v1);
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

void sub_1DE2154A8()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for Optional();
  sub_1DE21704C(v0);
  sub_1DE216F90();
  v1 = sub_1DE2174B8();
  sub_1DE21704C(v1);
  sub_1DE216F90();
  sub_1DE2173D8();
  sub_1DE216F90();
  sub_1DE2173D8();
  sub_1DE216F90();
  sub_1DE21725C();
}

uint64_t sub_1DE215544(uint64_t a1)
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

  sub_1DE21704C(a1);
  sub_1DE216F90();
  sub_1DE217438();
  sub_1DE216F90();
  sub_1DE217438();
  sub_1DE216F90();

  sub_1DE216F90();
  sub_1DE20FEAC(*(_QWORD *)(v1 + *(_QWORD *)(v3 + 176)), *(_QWORD *)(v1 + *(_QWORD *)(v3 + 176) + 8), *(_QWORD *)(v1 + *(_QWORD *)(v3 + 176) + 16), *(_QWORD *)(v1 + *(_QWORD *)(v3 + 176) + 24), *(_BYTE *)(v1 + *(_QWORD *)(v3 + 176) + 32));
  sub_1DE216F90();

  sub_1DE216F90();
  sub_1DE217438();
  sub_1DE216F90();
  sub_1DE204AEC(*(_QWORD *)(v1 + *(_QWORD *)(v5 + 208)));
  sub_1DE216F90();
  sub_1DE204AEC(*(_QWORD *)(v1 + *(_QWORD *)(v6 + 216)));
  sub_1DE216F90();
  sub_1DE204AEC(*(_QWORD *)(v1 + *(_QWORD *)(v7 + 224)));
  sub_1DE216F90();
  sub_1DE204AEC(*(_QWORD *)(v1 + *(_QWORD *)(v8 + 248)));
  sub_1DE216F90();
  return sub_1DE204AEC(*(_QWORD *)(v1 + *(_QWORD *)(v9 + 256)));
}

char *sub_1DE215624(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

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
    sub_1DE1FFE88((uint64_t *)&unk_1EDB81A30);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_1DE215B8C((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    sub_1DE217060();
  }
  else
  {
    sub_1DE215978(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_1DE21570C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DE215754(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1DE215794(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  sub_1DE20425C();
}

uint64_t sub_1DE2157CC(char a1, int64_t a2, char a3, uint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
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
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  sub_1DE1FFE88(&qword_1F0438C58);
  v10 = *(_QWORD *)(sub_1DE2171A8() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_24:
    sub_1DE216FDC();
    sub_1DE217460();
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(unsigned __int8 *)(*(_QWORD *)(sub_1DE2171A8() - 8) + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    sub_1DE215C28(a4 + v17, v8, v18, (void (*)(_QWORD))type metadata accessor for Ckcode_RecordTransport);
    *(_QWORD *)(a4 + 16) = 0;
    sub_1DE217060();
  }
  else
  {
    sub_1DE215A6C(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_1DE215978(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1DE215A6C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(type metadata accessor for Ckcode_RecordTransport() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_1DE215B8C(char *__src, uint64_t a2, char *__dst)
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

void sub_1DE215C10(unint64_t a1, uint64_t a2, unint64_t a3)
{
  sub_1DE215C28(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for Ckcode_ProtectedEnvelope);
}

void sub_1DE215C1C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  sub_1DE215C28(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for Ckcode_RecordTransport);
}

void sub_1DE215C28(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD))
{
  if (a2 < 0)
  {
    sub_1DE216FDC();
    sub_1DE217460();
    sub_1DE2173A8();
    __break(1u);
  }
  else if (a3 < a1 || a1 + *(_QWORD *)(*(_QWORD *)(((uint64_t (*)(_QWORD))a4)(0) - 8) + 72) * a2 <= a3)
  {
    a4(0);
    sub_1DE217518();
    swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 == a1)
  {
    sub_1DE216F80();
  }
  else
  {
    sub_1DE217518();
    swift_arrayInitWithTakeBackToFront();
  }
}

uint64_t sub_1DE215CEC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_1DE215D04(a1, a2, a3, type metadata accessor for Ckcode_ProtectedEnvelope);
}

uint64_t sub_1DE215CF8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_1DE215D04(a1, a2, a3, (uint64_t (*)(_QWORD))type metadata accessor for Ckcode_RecordTransport);
}

uint64_t sub_1DE215D04(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a4(0) - 8) + 72) * a2;
    v7 = a3 + v6;
    v8 = a1 + v6;
    if (v7 <= a1 || v8 <= a3)
      return swift_arrayInitWithCopy();
  }
  sub_1DE216FDC();
  sub_1DE217460();
  result = sub_1DE2173A8();
  __break(1u);
  return result;
}

void sub_1DE215DD0()
{
  sub_1DE20EE2C();
  sub_1DE20425C();
}

void sub_1DE215E18(_BYTE *a1@<X8>)
{
  char v2;

  sub_1DE20F4B8();
  *a1 = v2 & 1;
  sub_1DE20425C();
}

void sub_1DE215E40(char *a1)
{
  sub_1DE20F4F0(*a1);
  sub_1DE20425C();
}

void sub_1DE215E98(_BYTE *a1@<X8>)
{
  char v2;

  sub_1DE2107EC();
  *a1 = v2 & 1;
  sub_1DE20425C();
}

void sub_1DE215EC0(char *a1)
{
  sub_1DE210824(*a1);
  sub_1DE20425C();
}

void sub_1DE215EE8(_BYTE *a1@<X8>)
{
  char v2;

  sub_1DE2108B8();
  *a1 = v2 & 1;
  sub_1DE20425C();
}

void sub_1DE215F10(char *a1)
{
  sub_1DE2108F0(*a1);
  sub_1DE20425C();
}

uint64_t sub_1DE215F5C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for Optional();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for Optional();
    if (v2 <= 0x3F)
      type metadata accessor for CodeOperation.DestinationServer();
  }
  return result;
}

uint64_t method lookup function for CodeOperation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CodeOperation.request.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of CodeOperation.request.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of CodeOperation.request.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of CodeOperation.dataProtectionType.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of CodeOperation.dataProtectionType.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of CodeOperation.dataProtectionType.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of CodeOperation.permittedRemoteMeasurement.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of CodeOperation.permittedRemoteMeasurement.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of CodeOperation.permittedRemoteMeasurement.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of CodeOperation.shouldSendRecordPCSKeys.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of CodeOperation.shouldSendRecordPCSKeys.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x200))();
}

uint64_t dispatch thunk of CodeOperation.shouldSendRecordPCSKeys.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x208))();
}

uint64_t dispatch thunk of CodeOperation.__allocating_init(service:functionName:request:destinationServer:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 576))();
}

uint64_t dispatch thunk of CodeOperation.__allocating_init(serviceName:functionName:request:local:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 584))();
}

uint64_t dispatch thunk of CodeOperation.perRecordCompletionBlock.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x250))();
}

uint64_t dispatch thunk of CodeOperation.perRecordCompletionBlock.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x258))();
}

uint64_t dispatch thunk of CodeOperation.perRecordCompletionBlock.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x260))();
}

uint64_t dispatch thunk of CodeOperation.perRecordProgressBlock.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x268))();
}

uint64_t dispatch thunk of CodeOperation.perRecordProgressBlock.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x270))();
}

uint64_t dispatch thunk of CodeOperation.perRecordProgressBlock.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x278))();
}

uint64_t dispatch thunk of CodeOperation.codeOperationCompletionBlock.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x280))();
}

uint64_t dispatch thunk of CodeOperation.codeOperationCompletionBlock.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x288))();
}

uint64_t dispatch thunk of CodeOperation.codeOperationCompletionBlock.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x290))();
}

uint64_t dispatch thunk of CodeOperation.dropInMemoryAssetContentASAP.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x298))();
}

uint64_t dispatch thunk of CodeOperation.dropInMemoryAssetContentASAP.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of CodeOperation.dropInMemoryAssetContentASAP.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of CodeOperation.shouldFetchAssetContentInMemory.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of CodeOperation.shouldFetchAssetContentInMemory.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of CodeOperation.shouldFetchAssetContentInMemory.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of CodeOperation.incompleteResponsePreviewBlock.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2C8))();
}

uint64_t dispatch thunk of CodeOperation.incompleteResponsePreviewBlock.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of CodeOperation.incompleteResponsePreviewBlock.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of CodeOperation.didSubstituteRequestRecordTransportsBlock.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of CodeOperation.didSubstituteRequestRecordTransportsBlock.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of CodeOperation.didSubstituteRequestRecordTransportsBlock.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2F0))();
}

uint64_t sub_1DE216430()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t initializeBufferWithCopyOfBuffer for OneFieldDecoder(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_1DE216468(uint64_t a1)
{
  return sub_1DE20FEAC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t sub_1DE21647C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1DE20FE6C(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t sub_1DE2164DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1DE20FE6C(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_1DE20FEAC(v8, v9, v10, v11, v12);
  return a1;
}

__n128 sub_1DE21654C(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_1DE216560(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  __int128 v8;
  char v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_1DE20FEAC(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t sub_1DE2165A8(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 33))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 32);
      if (v3 <= 2)
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

uint64_t sub_1DE2165E8(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_1DE216630(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 1u)
    return *(unsigned __int8 *)(a1 + 32);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_1DE216648(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
  }
  *(_BYTE *)(result + 32) = a2;
  return result;
}

void type metadata accessor for CodeOperation.DataProtectionType()
{
  JUMPOUT(0x1DF0EA560);
}

uint64_t sub_1DE216670()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_1DE2166C4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for URL();
    if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 2, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t sub_1DE21677C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = type metadata accessor for URL();
  result = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(a1, 2, v2);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return result;
}

void *sub_1DE2167D4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for URL();
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 2, v6);
  }
  return a1;
}

void *sub_1DE216868(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;

  v6 = type metadata accessor for URL();
  v7 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a1, 2, v6);
  v8 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 2, v6);
  if (!v7)
  {
    v9 = *(_QWORD *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 2, v6);
  return a1;
}

void *sub_1DE21694C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for URL();
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 2, v6);
  }
  return a1;
}

void *sub_1DE2169E0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;

  v6 = type metadata accessor for URL();
  v7 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a1, 2, v6);
  v8 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 2, v6);
  if (!v7)
  {
    v9 = *(_QWORD *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 2, v6);
  return a1;
}

uint64_t sub_1DE216AC4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DE216AD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = sub_1DE217318();
  v5 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(a1, a2, v4);
  if (v5 >= 3)
    return v5 - 2;
  else
    return 0;
}

uint64_t sub_1DE216B10()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DE216B1C(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 2);
  else
    v5 = 0;
  v6 = sub_1DE217318();
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(a1, v5, a3, v6);
}

uint64_t sub_1DE216B64(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for URL();
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(a1, 2, v2);
}

uint64_t sub_1DE216B94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for URL();
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(a1, a2, 2, v4);
}

uint64_t sub_1DE216BCC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1DE216C0C()
{
  return swift_allocateGenericValueMetadata();
}

void type metadata accessor for CodeOperation.AssetInfo()
{
  JUMPOUT(0x1DF0EA560);
}

uint64_t sub_1DE216C24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1DE216C34()
{
  return swift_release();
}

uint64_t sub_1DE216C3C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1DE216C60(uint64_t a1, uint64_t a2)
{
  sub_1DE219B1C(a1, a2);
}

void sub_1DE216C68(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_1DE219ABC(a1, a2, a3);
}

uint64_t sub_1DE216C70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1DE219A6C(a1, a2, *(_QWORD *)(v2 + 16));
}

void sub_1DE216C78(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;

  sub_1DE219988(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

void sub_1DE216C80(uint64_t a1, uint64_t a2)
{
  sub_1DE21986C(a1, a2);
}

uint64_t sub_1DE216C8C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DE216CE0;
  v2 = sub_1DE204208();
  return sub_1DE2170A4(v2, v3, v4);
}

uint64_t sub_1DE216CE0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1DE216D2C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  sub_1DE217380();
  return swift_deallocObject();
}

uint64_t sub_1DE216D50()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DE216EDC;
  v2 = sub_1DE204208();
  return sub_1DE2170A4(v2, v3, v4);
}

uint64_t sub_1DE216DA4()
{
  return sub_1DE2122AC();
}

uint64_t sub_1DE216DAC(uint64_t *a1)
{
  uint64_t v1;

  return sub_1DE212424(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1DE216DC4(uint64_t *a1)
{
  uint64_t v1;

  return sub_1DE212344(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_1DE216DE0(uint64_t a1)
{
  return sub_1DE216DEC(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1DE219418);
}

uint64_t sub_1DE216DEC(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[6], v2[7], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_1DE216E00()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DE216E24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t *);
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, uint64_t *))(v2 + 48);
  v5 = a2;
  return v3(a1, &v5);
}

void sub_1DE216E54(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  (*(void (**)(uint64_t, _QWORD))(v2 + 48))(a1, *a2);
  sub_1DE20425C();
}

uint64_t sub_1DE216E74()
{
  swift_release();
  sub_1DE217380();
  return swift_deallocObject();
}

void sub_1DE216E90()
{
  sub_1DE2193F0();
}

void sub_1DE216E98(_QWORD *a1, double *a2)
{
  uint64_t v2;

  sub_1DE2193CC(a1, a2, *(void (**)(_QWORD, double))(v2 + 16));
}

uint64_t sub_1DE216EA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DE210350(a1, a2, a3, *(uint64_t (**)(uint64_t *, uint64_t *, uint64_t *))(v3 + 16));
}

void sub_1DE216EA8(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v3 + 16))(*a1, *a2, *a3);
  sub_1DE20425C();
}

uint64_t sub_1DE216F40()
{
  return swift_beginAccess();
}

uint64_t sub_1DE216F58()
{
  return swift_beginAccess();
}

__n128 sub_1DE216FA0(uint64_t a1, _OWORD *a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t sub_1DE216FAC()
{
  return 32;
}

uint64_t sub_1DE216FB8()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1DE204B48(*v0);
  return v1;
}

uint64_t sub_1DE217024()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1DE217034()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *v1 = v2;
  v1[1] = v0;
  return sub_1DE204AEC(v3);
}

uint64_t sub_1DE21704C(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t sub_1DE217060()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DE21707C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DE2170A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_1DE2170B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + v1) = a1;
  return swift_bridgeObjectRelease();
}

id sub_1DE2170C4()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

id sub_1DE2170E0(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t sub_1DE2170E8()
{
  return 0;
}

uint64_t sub_1DE2170F8()
{
  return 0;
}

void sub_1DE21710C()
{
  void *v0;

}

uint64_t sub_1DE217114()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 160) + 8))(v0, *(_QWORD *)(v1 - 152));
}

uint64_t sub_1DE217138()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  return sub_1DE20FEAC(v3, v2, v1, v0, 0);
}

void sub_1DE217150(id a1)
{

}

uint64_t sub_1DE21715C()
{
  return 12;
}

uint64_t sub_1DE21716C()
{
  return 0;
}

uint64_t sub_1DE21717C()
{
  return swift_continuation_await();
}

uint64_t sub_1DE217188(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 40))(v2, v1, a1);
}

void sub_1DE2171A0()
{
  type metadata accessor for CodeOperation();
}

uint64_t sub_1DE2171A8()
{
  return type metadata accessor for Ckcode_RecordTransport();
}

void sub_1DE2171C0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;

  v2 = *v0;
  v3 = (uint64_t *)(v1 - 8);
  *v3 = *v0;
  *v3 = *v0;
  *(_QWORD *)(v2 + 136) = *(_QWORD *)(v2 + 48);
}

id sub_1DE2171E0()
{
  _QWORD *v0;
  void *v1;

  *v0 = 0x8000000000000000;
  return v1;
}

uint64_t sub_1DE2171F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 184) + 8))(v1, v0);
}

uint64_t sub_1DE21720C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 184) + 8))(v1, v0);
}

id sub_1DE217220(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_1DE21722C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DE217234(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(a1, a2, 1, v2);
}

uint64_t sub_1DE217240()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DE217248()
{
  return swift_bridgeObjectRetain();
}

void sub_1DE21725C()
{
  type metadata accessor for CodeOperation.DestinationServer();
}

id sub_1DE217264(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t sub_1DE21726C()
{
  uint64_t v0;

  return v0;
}

BOOL sub_1DE217288@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_1DE217294()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_1DE21729C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1DE2172C8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DE2172D0()
{
  return swift_allocObject();
}

uint64_t sub_1DE2172E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_1DE2172F0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DE2172F8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DE217308@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v1;
  *(_QWORD *)(v1 + 24) = a1;
  return swift_continuation_init();
}

uint64_t sub_1DE217318()
{
  return type metadata accessor for URL();
}

uint64_t sub_1DE217320()
{
  return type metadata accessor for Optional();
}

void sub_1DE217328(uint64_t a1, unint64_t *a2)
{
  sub_1DE209038(0, a2);
}

uint64_t sub_1DE217330@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return v2 + *(_QWORD *)((v1 & a1) + 0x70);
}

uint64_t sub_1DE217348@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return v2 + *(_QWORD *)((v1 & a1) + 0x78);
}

uint64_t sub_1DE217360@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t sub_1DE217378()
{
  return swift_release();
}

uint64_t sub_1DE217380()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1DE2173A8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1DE2173B4()
{
  return swift_willThrow();
}

uint64_t sub_1DE2173C0()
{
  return swift_bridgeObjectRelease();
}

id sub_1DE2173C8()
{
  void *v0;

  return v0;
}

uint64_t sub_1DE2173D0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DE2173D8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DE2173E4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DE2173EC()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1DE220F6C(v1, v0);
}

void sub_1DE2173F8()
{
  uint64_t v0;

  sub_1DE210CB0(v0);
}

uint64_t sub_1DE217404@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(a1, v2);
}

uint64_t sub_1DE217410()
{
  uint64_t (*v0)(void);

  return v0();
}

uint64_t sub_1DE217418(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = result;
  return result;
}

uint64_t sub_1DE21742C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 - 144))();
}

uint64_t sub_1DE217438()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DE217440()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1DE21744C()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1DE217454()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1DE21746C()
{
  return swift_release();
}

id sub_1DE217474(char a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2, a1 & 1);
}

uint64_t sub_1DE217480()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DE21748C()
{
  return swift_dynamicCastObjCClass();
}

uint64_t sub_1DE217498()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1DE2174A0()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1DE1FFC54(v0, v1);
}

uint64_t sub_1DE2174AC()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1DE205560(v0, v1);
}

uint64_t sub_1DE2174B8()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1DE2174C4()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1DE2174D0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1DE2174DC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 - 168))();
}

uint64_t sub_1DE2174F0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1DE205560(v0, v1);
}

void sub_1DE2174FC()
{
  void *v0;

}

uint64_t sub_1DE217504()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

id sub_1DE21750C(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_1DE217518()
{
  uint64_t v0;

  return v0;
}

id CKDatabase.codeConnection(toService:local:)(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  void *v4;
  id result;
  uint64_t v9;
  id v10;
  uint64_t v11;

  v4 = v3;
  result = objc_msgSend(v4, sel_container);
  if (result)
  {
    v9 = (uint64_t)result;
    v10 = objc_msgSend(v4, sel_databaseScope);
    type metadata accessor for CodeConnection();
    swift_allocObject();
    v11 = sub_1DE20EAD4(a1, a2, v9, (uint64_t)v10, a3 & 1);
    swift_bridgeObjectRetain();
    return (id)v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void Ckcode_RecordTransport.localSerialization.setter(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1DE205560(*v2, v2[1]);
  *v2 = a1;
  v2[1] = a2;
  sub_1DE2041D0();
}

void Ckcode_RecordTransport.encryptedMasterKey.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = v2 + *(int *)(sub_1DE2171A8() + 24);
  sub_1DE1FFC40(*(_QWORD *)v5, *(_QWORD *)(v5 + 8));
  *(_QWORD *)v5 = a1;
  *(_QWORD *)(v5 + 8) = a2;
  sub_1DE2041D0();
}

uint64_t type metadata accessor for Ckcode_RecordTransport()
{
  uint64_t result;

  result = qword_1EDB822E0;
  if (!qword_1EDB822E0)
    return swift_getSingletonMetadata();
  return result;
}

void Ckcode_RecordTransport.init()(_OWORD *a1@<X8>)
{
  uint64_t v2;

  *a1 = xmmword_1DE226BD0;
  v2 = sub_1DE2171A8();
  UnknownStorage.init()();
  *(_OWORD *)((char *)a1 + *(int *)(v2 + 24)) = xmmword_1DE226500;
  sub_1DE20425C();
}

uint64_t Ckcode_RecordTransport.contents.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_1DE211704(v2, v3);
}

void Ckcode_RecordTransport.contents.setter(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = a1[1];
  sub_1DE205560(*v1, v1[1]);
  *v1 = v2;
  v1[1] = v3;
  sub_1DE2041D0();
}

uint64_t (*Ckcode_RecordTransport.contents.modify())(_QWORD)
{
  return nullsub_1;
}

void Ckcode_RecordTransport.localSerialization.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if ((*(_QWORD *)(v0 + 8) & 0x2000000000000000) == 0)
  {
    v1 = sub_1DE2041FC();
    sub_1DE205854(v1, v2);
  }
  sub_1DE2041FC();
  sub_1DE20425C();
}

void sub_1DE217740(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  sub_1DE1FFB64(*a1, v2);
  Ckcode_RecordTransport.localSerialization.setter(v1, v2);
}

void Ckcode_RecordTransport.localSerialization.modify(uint64_t *a1)
{
  uint64_t *v1;
  unint64_t v3;
  uint64_t v4;

  a1[2] = (uint64_t)v1;
  v3 = v1[1];
  if ((v3 & 0x2000000000000000) != 0)
  {
    v4 = 0;
    v3 = 0xC000000000000000;
  }
  else
  {
    v4 = *v1;
    sub_1DE205854(*v1, v1[1]);
  }
  *a1 = v4;
  a1[1] = v3;
  sub_1DE2041D0();
}

void sub_1DE2177D4(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v2 = a1[1];
  v3 = (uint64_t *)a1[2];
  v4 = *a1;
  v5 = *v3;
  v6 = v3[1];
  if ((a2 & 1) != 0)
  {
    sub_1DE2192EC();
    sub_1DE205560(v5, v6);
    *v3 = v4;
    v3[1] = v2;
    v7 = sub_1DE2041FC();
    sub_1DE2191F0(v7, v8);
  }
  else
  {
    sub_1DE205560(*v3, v3[1]);
    *v3 = v4;
    v3[1] = v2;
    sub_1DE2088F8();
  }
}

void Ckcode_RecordTransport.wireSerialization.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = v0[1];
  if ((~v1 & 0x3000000000000000) != 0 && (v1 & 0x2000000000000000) != 0)
    sub_1DE205854(*v0, v1);
  sub_1DE2041D0();
}

void sub_1DE21787C(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  sub_1DE1FFB64(*a1, v2);
  Ckcode_RecordTransport.wireSerialization.setter(v1, v2);
}

void Ckcode_RecordTransport.wireSerialization.setter(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;

  v4 = a2 | 0x2000000000000000;
  sub_1DE205560(*v2, v2[1]);
  *v2 = a1;
  v2[1] = v4;
  sub_1DE2041D0();
}

void Ckcode_RecordTransport.wireSerialization.modify(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = 0;
  a1[2] = (uint64_t)v1;
  v4 = v1[1];
  v5 = 0xC000000000000000;
  if ((~v4 & 0x3000000000000000) != 0 && (v4 & 0x2000000000000000) != 0)
  {
    v3 = *v1;
    v5 = v4 & 0xDFFFFFFFFFFFFFFFLL;
    sub_1DE205854(*v1, v4);
  }
  *a1 = v3;
  a1[1] = v5;
  sub_1DE2041D0();
}

void sub_1DE217944(uint64_t *a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v2 = (uint64_t *)a1[2];
  v3 = *a1;
  v4 = a1[1] | 0x2000000000000000;
  v5 = *v2;
  v6 = v2[1];
  if ((a2 & 1) != 0)
  {
    v7 = sub_1DE204208();
    sub_1DE1FFB64(v7, v8);
    sub_1DE205560(v5, v6);
    *v2 = v3;
    v2[1] = v4;
    v9 = sub_1DE204208();
    sub_1DE2191F0(v9, v10);
  }
  else
  {
    sub_1DE205560(*v2, v2[1]);
    *v2 = v3;
    v2[1] = v4;
    sub_1DE2088F8();
  }
}

void Ckcode_RecordTransport.encryptedMasterKey.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v0 = sub_1DE2171A8();
  v1 = sub_1DE204460(*(int *)(v0 + 24));
  sub_1DE1FFB50(v1, v2);
  sub_1DE204208();
  sub_1DE20425C();
}

void sub_1DE2179DC(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  sub_1DE1FFB64(*a1, v2);
  Ckcode_RecordTransport.encryptedMasterKey.setter(v1, v2);
}

void Ckcode_RecordTransport.encryptedMasterKey.modify(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(sub_1DE2171A8() + 24);
  *(_DWORD *)(a1 + 24) = v3;
  v6 = sub_1DE204460(v3);
  if (!v5 & v4)
    v8 = 0;
  else
    v8 = v6;
  v9 = 0xC000000000000000;
  if (!(!v5 & v4))
    v9 = v7;
  *(_QWORD *)a1 = v8;
  *(_QWORD *)(a1 + 8) = v9;
  sub_1DE1FFB50(v6, v7);
  sub_1DE20425C();
}

void sub_1DE217A68(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v2 = a1[1];
  v3 = a1[2] + *((int *)a1 + 6);
  v4 = *a1;
  v5 = *(_QWORD *)v3;
  v6 = *(_QWORD *)(v3 + 8);
  if ((a2 & 1) != 0)
  {
    sub_1DE2192EC();
    sub_1DE1FFC40(v5, v6);
    *(_QWORD *)v3 = v4;
    *(_QWORD *)(v3 + 8) = v2;
    v7 = sub_1DE2041FC();
    sub_1DE2191F0(v7, v8);
  }
  else
  {
    sub_1DE1FFC40(*(_QWORD *)v3, *(_QWORD *)(v3 + 8));
    *(_QWORD *)v3 = v4;
    *(_QWORD *)(v3 + 8) = v2;
    sub_1DE2088F8();
  }
}

BOOL Ckcode_RecordTransport.hasEncryptedMasterKey.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(sub_1DE2171A8() + 24) + 8) >> 60 != 15;
}

Swift::Void __swiftcall Ckcode_RecordTransport.clearEncryptedMasterKey()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + *(int *)(sub_1DE2171A8() + 24);
  sub_1DE1FFC40(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  *(_OWORD *)v1 = xmmword_1DE226500;
  sub_1DE20425C();
}

uint64_t Ckcode_RecordTransport.unknownFields.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_1DE2171A8();
  sub_1DE2041F4();
  v0 = sub_1DE204208();
  return sub_1DE2041BC(v0, v1, v2, v3);
}

uint64_t Ckcode_RecordTransport.unknownFields.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_1DE2171A8();
  sub_1DE2041F4();
  v0 = sub_1DE2041FC();
  return sub_1DE2041BC(v0, v1, v2, v3);
}

uint64_t (*Ckcode_RecordTransport.unknownFields.modify())(_QWORD)
{
  sub_1DE2171A8();
  return nullsub_1;
}

uint64_t static Ckcode_RecordTransport.OneOf_Contents.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  if ((v3 & 0x2000000000000000) != 0)
  {
    if ((v5 & 0x2000000000000000) != 0)
    {
      v6 = sub_1DE2192AC();
      v7 = v3 & 0xDFFFFFFFFFFFFFFFLL;
      v8 = v4;
      v9 = v5 & 0xDFFFFFFFFFFFFFFFLL;
      goto LABEL_7;
    }
  }
  else if ((v5 & 0x2000000000000000) == 0)
  {
    v6 = sub_1DE2192AC();
    v7 = v3;
    v8 = v4;
    v9 = v5;
LABEL_7:
    v10 = MEMORY[0x1DF0E9C30](v6, v7, v8, v9);
    goto LABEL_8;
  }
  sub_1DE205854(*a2, a2[1]);
  sub_1DE205854(v2, v3);
  v10 = 0;
LABEL_8:
  sub_1DE205574(v2, v3);
  sub_1DE205574(v4, v5);
  return v10 & 1;
}

void sub_1DE217C70()
{
  qword_1F0438DD0 = 0x65646F636B63;
  *(_QWORD *)algn_1F0438DD8 = 0xE600000000000000;
}

uint64_t sub_1DE217C90()
{
  uint64_t result;

  if (qword_1F0438690 != -1)
    result = swift_once();
  qword_1F0438DE0 = 0xD000000000000016;
  *(_QWORD *)algn_1F0438DE8 = 0x80000001DE22B500;
  return result;
}

void static Ckcode_RecordTransport.protoMessageName.getter()
{
  if (qword_1F0438698 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1DE204208();
  sub_1DE20425C();
}

uint64_t sub_1DE217D40()
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
  sub_1DE203EFC(v0, qword_1F0438DF0);
  sub_1DE2025D4(v0, (uint64_t)qword_1F0438DF0);
  sub_1DE1FFE88(&qword_1F0438760);
  v1 = sub_1DE1FFE88(&qword_1F0438768);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DE2273D0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "localSerialization";
  *(_QWORD *)(v7 + 8) = 18;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF08];
  v9 = type metadata accessor for _NameMap.NameDescription();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "wireSerialization";
  *((_QWORD *)v11 + 1) = 17;
  v11[16] = 2;
  v10();
  v12 = (_QWORD *)((char *)v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "encryptedMasterKey";
  *((_QWORD *)v13 + 1) = 18;
  v13[16] = 2;
  v10();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t static Ckcode_RecordTransport._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F04386A0 != -1)
    swift_once();
  v2 = type metadata accessor for _NameMap();
  v3 = sub_1DE2025D4(v2, (uint64_t)qword_1F0438DF0);
  return sub_1DE2041BC(a1, v3, v2, *(uint64_t (**)(void))(*(_QWORD *)(v2 - 8) + 16));
}

uint64_t Ckcode_RecordTransport.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = dispatch thunk of Decoder.nextFieldNumber()();
    if (v0 || (v2 & 1) != 0)
      break;
    switch(result)
    {
      case 3:
        sub_1DE204224();
        sub_1DE218160();
        break;
      case 2:
        sub_1DE204224();
        sub_1DE218094();
        break;
      case 1:
        sub_1DE204224();
        sub_1DE217FCC();
        break;
    }
  }
  return result;
}

uint64_t sub_1DE217FCC()
{
  uint64_t v0;
  uint64_t result;

  result = dispatch thunk of Decoder.decodeSingularBytesField(value:)();
  if (v0)
    return sub_1DE1FFC40(0, 0xF000000000000000);
  return result;
}

uint64_t sub_1DE218094()
{
  uint64_t v0;
  uint64_t result;

  result = dispatch thunk of Decoder.decodeSingularBytesField(value:)();
  if (v0)
    return sub_1DE1FFC40(0, 0xF000000000000000);
  return result;
}

uint64_t sub_1DE218160()
{
  type metadata accessor for Ckcode_RecordTransport();
  return dispatch thunk of Decoder.decodeSingularBytesField(value:)();
}

uint64_t Ckcode_RecordTransport.traverse<A>(visitor:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  if ((~*(_QWORD *)(v0 + 8) & 0x3000000000000000) == 0
    || ((v2 = (uint64_t *)sub_1DE2192D4(), (v3 & 0x2000000000000000) != 0)
      ? (result = (uint64_t)sub_1DE2182E8(v2))
      : (result = (uint64_t)sub_1DE218264(v2)),
        !v1))
  {
    v5 = sub_1DE2192D4();
    result = sub_1DE218384(v5);
    if (!v1)
    {
      type metadata accessor for Ckcode_RecordTransport();
      return UnknownStorage.traverse<A>(visitor:)();
    }
  }
  return result;
}

uint64_t *sub_1DE218264(uint64_t *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result[1];
  if ((v1 & 0x2000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v2 = *result;
    sub_1DE205854(*result, v1);
    dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
    return (uint64_t *)sub_1DE205560(v2, v1);
  }
  return result;
}

uint64_t *sub_1DE2182E8(uint64_t *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result[1];
  if ((~v1 & 0x3000000000000000) != 0 && (v1 & 0x2000000000000000) != 0)
  {
    v2 = *result;
    sub_1DE205854(*result, v1);
    dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
    return (uint64_t *)sub_1DE205560(v2, v1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DE218384(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  result = type metadata accessor for Ckcode_RecordTransport();
  v3 = a1 + *(int *)(result + 24);
  v4 = *(_QWORD *)(v3 + 8);
  if (v4 >> 60 != 15)
  {
    v5 = *(_QWORD *)v3;
    sub_1DE1FFB64(*(_QWORD *)v3, *(_QWORD *)(v3 + 8));
    dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
    return sub_1DE1FFC40(v5, v4);
  }
  return result;
}

uint64_t static Ckcode_RecordTransport.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
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
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;

  v4 = sub_1DE2041F4();
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v10 = (char *)&v41 - v9;
  v12 = *a1;
  v11 = a1[1];
  v14 = *a2;
  v13 = a2[1];
  v15 = v13 & 0x3000000000000000;
  if ((~v11 & 0x3000000000000000) != 0)
  {
    if (v15 == 0x3000000000000000)
      goto LABEL_5;
    if ((v11 & 0x2000000000000000) != 0)
    {
      if ((v13 & 0x2000000000000000) != 0)
      {
        v41 = v13 & 0xDFFFFFFFFFFFFFFFLL;
        v42 = v8;
        v19 = sub_1DE219200(v12);
        v20 = v11 & 0xDFFFFFFFFFFFFFFFLL;
        v21 = v14;
        v22 = v41;
LABEL_12:
        v25 = MEMORY[0x1DF0E9C30](v19, v20, v21, v22);
        sub_1DE205574(v12, v11);
        sub_1DE219304();
        sub_1DE2192F8();
        sub_1DE2192A0();
        sub_1DE2192A0();
        v8 = v42;
        if ((v25 & 1) == 0)
          goto LABEL_18;
        goto LABEL_13;
      }
    }
    else if ((v13 & 0x2000000000000000) == 0)
    {
      v18 = *a1;
      v42 = v8;
      v19 = sub_1DE219200(v18);
      v20 = v11;
      v21 = v14;
      v22 = v13;
      goto LABEL_12;
    }
    v23 = sub_1DE219248();
    sub_1DE205574(v23, v24);
    sub_1DE219304();
    goto LABEL_18;
  }
  if (v15 != 0x3000000000000000)
  {
LABEL_5:
    v16 = sub_1DE219248();
    sub_1DE205560(v16, v17);
    sub_1DE2192F8();
    goto LABEL_18;
  }
LABEL_13:
  v42 = v8;
  v26 = sub_1DE2171A8();
  v27 = *(int *)(v26 + 24);
  v28 = *(uint64_t *)((char *)a1 + v27);
  v29 = *(uint64_t *)((char *)a1 + v27 + 8);
  v30 = *(uint64_t *)((char *)a2 + v27 + 8);
  if (v29 >> 60 == 15)
  {
    if (v30 >> 60 == 15)
      goto LABEL_21;
    goto LABEL_17;
  }
  if (v30 >> 60 == 15)
  {
LABEL_17:
    v31 = sub_1DE219274();
    sub_1DE1FFC40(v31, v32);
    sub_1DE219310();
    goto LABEL_18;
  }
  v35 = sub_1DE219274();
  LODWORD(v41) = MEMORY[0x1DF0E9C30](v35);
  sub_1DE219310();
  sub_1DE1FFC40(v28, v29);
  if ((v41 & 1) != 0)
  {
LABEL_21:
    v36 = (char *)a1 + *(int *)(v26 + 20);
    v37 = v42;
    v38 = *(void (**)(char *, char *, uint64_t))(v42 + 16);
    v38(v10, v36, v4);
    v38(v7, (char *)a2 + *(int *)(v26 + 20), v4);
    sub_1DE2191AC(&qword_1F04386B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E998], MEMORY[0x1E0D3E9A8]);
    v33 = dispatch thunk of static Equatable.== infix(_:_:)();
    v39 = *(void (**)(uint64_t))(v37 + 8);
    v40 = sub_1DE204208();
    v39(v40);
    ((void (*)(char *, uint64_t))v39)(v10, v4);
    return v33 & 1;
  }
LABEL_18:
  v33 = 0;
  return v33 & 1;
}

Swift::Int Ckcode_RecordTransport.hashValue.getter()
{
  Hasher.init(_seed:)();
  sub_1DE2171A8();
  sub_1DE2191AC(&qword_1F0438E08, (uint64_t (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport, (uint64_t)&protocol conformance descriptor for Ckcode_RecordTransport);
  dispatch thunk of Hashable.hash(into:)();
  return Hasher._finalize()();
}

uint64_t sub_1DE2186F8()
{
  return Ckcode_RecordTransport.decodeMessage<A>(decoder:)();
}

uint64_t sub_1DE21870C()
{
  return Ckcode_RecordTransport.traverse<A>(visitor:)();
}

uint64_t sub_1DE218720()
{
  sub_1DE2191AC(qword_1F0438E18, (uint64_t (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport, (uint64_t)&protocol conformance descriptor for Ckcode_RecordTransport);
  return _MessageImplementationBase.isEqualTo(message:)();
}

uint64_t sub_1DE218774()
{
  sub_1DE2191AC(&qword_1EDB82278, (uint64_t (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport, (uint64_t)&protocol conformance descriptor for Ckcode_RecordTransport);
  return Message.debugDescription.getter();
}

uint64_t sub_1DE2187B8()
{
  sub_1DE2191AC(&qword_1EDB82278, (uint64_t (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport, (uint64_t)&protocol conformance descriptor for Ckcode_RecordTransport);
  return Message.hash(into:)();
}

uint64_t sub_1DE218808()
{
  return sub_1DE2191AC(&qword_1EDB82280, (uint64_t (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport, (uint64_t)&protocol conformance descriptor for Ckcode_RecordTransport);
}

uint64_t sub_1DE218834()
{
  return sub_1DE2191AC(&qword_1EDB82278, (uint64_t (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport, (uint64_t)&protocol conformance descriptor for Ckcode_RecordTransport);
}

uint64_t sub_1DE218860()
{
  return sub_1DE2191AC(&qword_1F0438E08, (uint64_t (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport, (uint64_t)&protocol conformance descriptor for Ckcode_RecordTransport);
}

uint64_t sub_1DE21888C()
{
  return sub_1DE2191AC(&qword_1F0438E10, (uint64_t (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport, (uint64_t)&protocol conformance descriptor for Ckcode_RecordTransport);
}

void sub_1DE2188BC(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  Ckcode_RecordTransport.localSerialization.getter();
  *a1 = v2;
  a1[1] = v3;
  sub_1DE20425C();
}

void sub_1DE2188E4(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  Ckcode_RecordTransport.wireSerialization.getter();
  *a1 = v2;
  a1[1] = v3;
  sub_1DE20425C();
}

void sub_1DE21890C(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  Ckcode_RecordTransport.encryptedMasterKey.getter();
  *a1 = v2;
  a1[1] = v3;
  sub_1DE20425C();
}

uint64_t *initializeBufferWithCopyOfBuffer for Ckcode_RecordTransport(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  uint64_t v14;
  char *v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    if ((~v7 & 0x3000000000000000) != 0)
    {
      v9 = *a2;
      sub_1DE205854(*a2, a2[1]);
      *v4 = v9;
      v4[1] = v7;
    }
    else
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    v10 = *(int *)(a3 + 20);
    v11 = (char *)v4 + v10;
    v12 = (char *)a2 + v10;
    v13 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    v14 = *(int *)(a3 + 24);
    v15 = (char *)v4 + v14;
    v16 = (char *)a2 + v14;
    v17 = *((_QWORD *)v16 + 1);
    if (v17 >> 60 == 15)
    {
      *(_OWORD *)v15 = *(_OWORD *)v16;
    }
    else
    {
      v18 = *(_QWORD *)v16;
      sub_1DE1FFB64(*(_QWORD *)v16, *((_QWORD *)v16 + 1));
      *(_QWORD *)v15 = v18;
      *((_QWORD *)v15 + 1) = v17;
    }
  }
  return v4;
}

uint64_t destroy for Ckcode_RecordTransport(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t *v8;
  unint64_t v9;

  v4 = a1[1];
  if ((~v4 & 0x3000000000000000) != 0)
    sub_1DE205574(*a1, v4);
  v5 = (char *)a1 + *(int *)(a2 + 20);
  v6 = type metadata accessor for UnknownStorage();
  result = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v8 = (uint64_t *)((char *)a1 + *(int *)(a2 + 24));
  v9 = v8[1];
  if (v9 >> 60 != 15)
    return sub_1DE1FFC54(*v8, v9);
  return result;
}

uint64_t *initializeWithCopy for Ckcode_RecordTransport(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;

  v6 = a2[1];
  if ((~v6 & 0x3000000000000000) != 0)
  {
    v7 = *a2;
    sub_1DE205854(*a2, a2[1]);
    *a1 = v7;
    a1[1] = v6;
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v12 = *(int *)(a3 + 24);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = *((_QWORD *)v14 + 1);
  if (v15 >> 60 == 15)
  {
    *(_OWORD *)v13 = *(_OWORD *)v14;
  }
  else
  {
    v16 = *(_QWORD *)v14;
    sub_1DE1FFB64(*(_QWORD *)v14, *((_QWORD *)v14 + 1));
    *(_QWORD *)v13 = v16;
    *((_QWORD *)v13 + 1) = v15;
  }
  return a1;
}

uint64_t *assignWithCopy for Ckcode_RecordTransport(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v6 = a2[1];
  v7 = v6 & 0x3000000000000000;
  if ((~a1[1] & 0x3000000000000000) == 0)
  {
    if (v7 != 0x3000000000000000)
    {
      v8 = *a2;
      sub_1DE205854(*a2, a2[1]);
      *a1 = v8;
      a1[1] = v6;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v7 == 0x3000000000000000)
  {
    sub_1DE218CE4(a1);
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  v9 = *a2;
  sub_1DE205854(*a2, a2[1]);
  v10 = *a1;
  v11 = a1[1];
  *a1 = v9;
  a1[1] = v6;
  sub_1DE205574(v10, v11);
LABEL_8:
  v12 = *(int *)(a3 + 20);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = *(int *)(a3 + 24);
  v17 = (uint64_t *)((char *)a1 + v16);
  v18 = (uint64_t *)((char *)a2 + v16);
  v19 = *(uint64_t *)((char *)a2 + v16 + 8);
  if (*(unint64_t *)((char *)a1 + v16 + 8) >> 60 != 15)
  {
    if (v19 >> 60 != 15)
    {
      v21 = *v18;
      sub_1DE1FFB64(v21, v19);
      v22 = *v17;
      v23 = v17[1];
      *v17 = v21;
      v17[1] = v19;
      sub_1DE1FFC54(v22, v23);
      return a1;
    }
    sub_1DE202A98((uint64_t)v17);
    goto LABEL_13;
  }
  if (v19 >> 60 == 15)
  {
LABEL_13:
    *(_OWORD *)v17 = *(_OWORD *)v18;
    return a1;
  }
  v20 = *v18;
  sub_1DE1FFB64(v20, v19);
  *v17 = v20;
  v17[1] = v19;
  return a1;
}

uint64_t *sub_1DE218CE4(uint64_t *a1)
{
  destroy for Ckcode_RecordTransport.OneOf_Contents(a1);
  return a1;
}

_OWORD *initializeWithTake for Ckcode_RecordTransport(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t *assignWithTake for Ckcode_RecordTransport(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v6 = a1[1];
  if ((~v6 & 0x3000000000000000) == 0)
    goto LABEL_4;
  v7 = a2[1];
  if ((~v7 & 0x3000000000000000) == 0)
  {
    sub_1DE218CE4(a1);
LABEL_4:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_6;
  }
  v8 = *a1;
  *a1 = *a2;
  a1[1] = v7;
  sub_1DE205574(v8, v6);
LABEL_6:
  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  v13 = *(int *)(a3 + 24);
  v14 = (uint64_t *)((char *)a1 + v13);
  v15 = (uint64_t *)((char *)a2 + v13);
  v16 = *(uint64_t *)((char *)a1 + v13 + 8);
  if (v16 >> 60 != 15)
  {
    v17 = v15[1];
    if (v17 >> 60 != 15)
    {
      v18 = *v14;
      *v14 = *v15;
      v14[1] = v17;
      sub_1DE1FFC54(v18, v16);
      return a1;
    }
    sub_1DE202A98((uint64_t)v14);
  }
  *(_OWORD *)v14 = *(_OWORD *)v15;
  return a1;
}

uint64_t getEnumTagSinglePayload for Ckcode_RecordTransport()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DE218E88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v8;
  BOOL v9;
  unsigned int v10;

  v6 = sub_1DE2041F4();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(a1 + *(int *)(a3 + 20), a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8) >> 60;
  v9 = ((4 * (_DWORD)v8) & 0xC) == 0;
  v10 = ((4 * v8) & 0xC | (v8 >> 2)) ^ 0xF;
  if (v9)
    return 0;
  else
    return v10;
}

uint64_t storeEnumTagSinglePayload for Ckcode_RecordTransport()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1DE218F18(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  _QWORD *v9;

  v8 = sub_1DE2041F4();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(a1 + *(int *)(a4 + 20), a2, a2, v8);
  }
  else
  {
    v9 = (_QWORD *)(a1 + *(int *)(a4 + 24));
    *v9 = 0;
    v9[1] = (unint64_t)((~(_DWORD)a2 >> 2) & 3 | (4 * ~(_DWORD)a2)) << 60;
    sub_1DE2041D0();
  }
}

uint64_t sub_1DE218F94()
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

uint64_t *initializeBufferWithCopyOfBuffer for Ckcode_RecordTransport.OneOf_Contents(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  sub_1DE205854(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t destroy for Ckcode_RecordTransport.OneOf_Contents(uint64_t *a1)
{
  return sub_1DE205574(*a1, a1[1]);
}

uint64_t *assignWithCopy for Ckcode_RecordTransport.OneOf_Contents(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a2;
  v4 = a2[1];
  sub_1DE205854(*a2, v4);
  v5 = *a1;
  v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_1DE205574(v5, v6);
  return a1;
}

uint64_t *assignWithTake for Ckcode_RecordTransport.OneOf_Contents(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_1DE205574(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for Ckcode_RecordTransport.OneOf_Contents(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 3 && *(_BYTE *)(a1 + 16))
    {
      v2 = *(_DWORD *)a1 + 2;
    }
    else
    {
      v2 = ((2 * ((*(_QWORD *)(a1 + 8) & 0x1000000000000000) != 0)) | ((*(_QWORD *)(a1 + 8) >> 60) >> 1) & 1) ^ 3;
      if (v2 >= 2)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for Ckcode_RecordTransport.OneOf_Contents(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 2)
  {
    *(_QWORD *)result = a2 - 3;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 3)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 3)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)((2 * (a2 & 1)) | 1) << 60;
    }
  }
  return result;
}

uint64_t sub_1DE219168(uint64_t a1)
{
  return (*(_QWORD *)(a1 + 8) >> 61) & 1;
}

uint64_t sub_1DE219174(uint64_t result)
{
  *(_QWORD *)(result + 8) &= ~0x2000000000000000uLL;
  return result;
}

uint64_t sub_1DE219184(uint64_t result, char a2)
{
  *(_QWORD *)(result + 8) = *(_QWORD *)(result + 8) & 0xCFFFFFFFFFFFFFFFLL | ((unint64_t)(a2 & 1) << 61);
  return result;
}

ValueMetadata *type metadata accessor for Ckcode_RecordTransport.OneOf_Contents()
{
  return &type metadata for Ckcode_RecordTransport.OneOf_Contents;
}

uint64_t sub_1DE2191AC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1DF0EA5C0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DE2191F0(uint64_t a1, unint64_t a2)
{
  return sub_1DE1FFC54(a1, a2);
}

uint64_t sub_1DE219200(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1DE211704(a1, v1);
  sub_1DE211704(v2, v1);
  sub_1DE211704(v4, v3);
  sub_1DE211704(v2, v1);
  sub_1DE211704(v4, v3);
  return v2;
}

uint64_t sub_1DE219248()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_1DE211704(v1, v0);
  sub_1DE211704(v3, v2);
  return v1;
}

uint64_t sub_1DE219274()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;

  sub_1DE1FFB50(v0, v1);
  sub_1DE1FFB50(v2, v3);
  return v0;
}

uint64_t sub_1DE2192A0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1DE205560(v1, v0);
}

uint64_t sub_1DE2192AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_1DE205854(v0, v2);
  sub_1DE205854(v1, v3);
  return v1;
}

uint64_t sub_1DE2192D4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1DE2192EC()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1DE1FFB64(v1, v0);
}

uint64_t sub_1DE2192F8()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1DE205560(v1, v0);
}

uint64_t sub_1DE219304()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1DE205574(v1, v0);
}

uint64_t sub_1DE219310()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1DE1FFC40(v0, v1);
}

void sub_1DE21931C(uint64_t a1, uint64_t a2)
{
  char v2;

  if (*(_QWORD *)(a2 + 16))
  {
    sub_1DE220FE0(a1);
    if ((v2 & 1) != 0)
      sub_1DE221F70();
  }
  sub_1DE20425C();
}

void sub_1DE219350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_1DE220F78(a1, a2, (uint64_t (*)(uint64_t))sub_1DE2215D8);
    if ((v3 & 1) != 0)
      sub_1DE221F70();
  }
  sub_1DE20425C();
}

void sub_1DE21938C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  char v4;
  id v5;

  if (*(_QWORD *)(a2 + 16))
  {
    v3 = sub_1DE220F3C(a1);
    if ((v4 & 1) != 0)
      v5 = *(id *)(*(_QWORD *)(a2 + 56) + 8 * v3);
  }
  sub_1DE20425C();
}

void sub_1DE2193CC(_QWORD *a1, double *a2, void (*a3)(_QWORD, double))
{
  a3(*a1, *a2);
  sub_1DE20425C();
}

void sub_1DE2193F0()
{
  void (*v0)(void);

  sub_1DE221F54();
  v0();
  sub_1DE221F48();
}

void sub_1DE219418(uint64_t a1, void (*a2)(void))
{
  a2();
  sub_1DE20425C();
}

uint64_t sub_1DE219434()
{
  return 0;
}

uint64_t sub_1DE21943C(uint64_t a1, void (*a2)(uint64_t, uint64_t, unint64_t))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;

  v4 = type metadata accessor for Ckcode_RecordTransport();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  sub_1DE221E00();
  v14 = MEMORY[0x1E0DEE9D8];
  sub_1DE2219DC();
  v6 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v6)
  {
    v7 = 0;
    v8 = (unint64_t *)(a1 + 40);
    do
    {
      v10 = *(v8 - 1);
      v9 = *v8;
      sub_1DE1FFB64(v10, *v8);
      a2(v7, v10, v9);
      sub_1DE1FFC54(v10, v9);
      v11 = *(_QWORD *)(v14 + 16);
      if (v11 >= *(_QWORD *)(v14 + 24) >> 1)
        sub_1DE2219DC();
      ++v7;
      v8 += 2;
      *(_QWORD *)(v14 + 16) = v11 + 1;
      sub_1DE202628(v2, v14+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v11, (uint64_t (*)(_QWORD))type metadata accessor for Ckcode_RecordTransport);
    }
    while (v6 != v7);
  }
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1DE2195A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  if (a2 < 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      v4 = sub_1DE2171A8();
      v5 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(_QWORD *)(v5 + 16) = a2;
      v6 = *(_QWORD *)(v4 - 8);
      v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      sub_1DE2008C4(a1, v5 + v7, (uint64_t (*)(_QWORD))type metadata accessor for Ckcode_RecordTransport);
      v8 = a2 - 1;
      if (a2 != 1)
      {
        v9 = *(_QWORD *)(v6 + 72);
        v10 = v5 + v9 + v7;
        do
        {
          v11 = sub_1DE221E30();
          sub_1DE2008C4(v11, v12, (uint64_t (*)(_QWORD))type metadata accessor for Ckcode_RecordTransport);
          v10 += v9;
          --v8;
        }
        while (v8);
      }
    }
    else
    {
      v5 = MEMORY[0x1E0DEE9D8];
    }
    sub_1DE2005D4(a1, (uint64_t (*)(_QWORD))type metadata accessor for Ckcode_RecordTransport);
    return v5;
  }
  return result;
}

uint64_t sub_1DE2196D0(uint64_t a1, void *a2)
{
  if (a2)
    return sub_1DE21970C(*(_QWORD *)(a1 + 32), (uint64_t)a2);
  else
    return j__swift_continuation_throwingResume();
}

uint64_t sub_1DE21970C(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  sub_1DE1FFE88(qword_1EDB81D00);
  swift_allocError();
  *v3 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_1DE219760(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  sub_1DE1FFE88(&qword_1F0438F50);
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v4);
  sub_1DE2042FC();
  v7 = v6 - v5;
  type metadata accessor for TaskPriority();
  sub_1DE217250();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v8, v9, v10, v11);
  v12 = (_QWORD *)sub_1DE2090B0();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a1;
  v12[5] = a2;
  v13 = (_QWORD *)sub_1DE2090B0();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1F0438F60;
  v13[5] = v12;
  sub_1DE220124(v7, (uint64_t)&unk_1F0438F70, (uint64_t)v13);
  return swift_release();
}

void sub_1DE219824()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  sub_1DE221DA4();
  v5 = v1;
  v3 = v0;
  v4 = sub_1DE221EBC();
  sub_1DE221F08(v4);
  swift_release();

  sub_1DE221D30(v5);
}

void sub_1DE21986C(uint64_t a1, uint64_t a2)
{
  void *v2;

  if (a2)
    _convertErrorToNSError(_:)();
  sub_1DE221CFC();
  sub_1DE217150(v2);
}

void sub_1DE2198AC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v4;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;

  sub_1DE1FFE88(qword_1EDB81C68);
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v9);
  sub_1DE20430C();
  v10 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = sub_1DE217318();
    v12 = 0;
  }
  else
  {
    v11 = sub_1DE217318();
    v12 = 1;
  }
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v4, v12, 1, v11);
  swift_retain();
  v13 = a3;
  v14 = a4;
  v15 = sub_1DE221E30();
  v10(v15);

  swift_release();
  sub_1DE203EA8(v4, qword_1EDB81C68);
  sub_1DE217068();
}

void sub_1DE219988(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSURL *v13;
  void *v14;
  void *v15;

  sub_1DE1FFE88(qword_1EDB81C68);
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v8);
  sub_1DE2042FC();
  v11 = v10 - v9;
  sub_1DE203ED0(a1, v10 - v9, qword_1EDB81C68);
  v12 = sub_1DE217318();
  v14 = 0;
  if (sub_1DE221E4C() != 1)
  {
    URL._bridgeToObjectiveC()(v13);
    v14 = v15;
    sub_1DE221D90(v11, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8));
  }
  if (a3)
    a3 = (void *)_convertErrorToNSError(_:)();
  (*(void (**)(uint64_t, void *, uint64_t, void *))(a4 + 16))(a4, v14, a2, a3);

}

void sub_1DE219A70()
{
  void *v0;
  void *v1;
  id v2;
  id v3;

  sub_1DE221DA4();
  v3 = v1;
  v2 = v0;
  sub_1DE221F08((uint64_t)v3);
  swift_release();

  sub_1DE221D30(v3);
}

void sub_1DE219ABC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  Class isa;
  void *v5;

  if (a2 >> 60 != 15)
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    if (!a3)
      goto LABEL_5;
    goto LABEL_3;
  }
  isa = 0;
  if (a3)
LABEL_3:
    sub_1DE21744C();
LABEL_5:
  sub_1DE221CFC();

  sub_1DE221D10(v5);
}

void sub_1DE219B1C(uint64_t a1, uint64_t a2)
{
  NSArray v3;
  void *v4;

  if (!a1)
  {
    v3.super.isa = 0;
    if (!a2)
      goto LABEL_5;
    goto LABEL_3;
  }
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  if (a2)
LABEL_3:
    sub_1DE21744C();
LABEL_5:
  sub_1DE221CFC();

  sub_1DE221D10(v4);
}

void sub_1DE219B7C()
{
  uint64_t *v0;
  uint64_t v1;

  sub_1DE217330(*v0);
  sub_1DE216F58();
  v1 = sub_1DE217320();
  sub_1DE204238(v1);
  sub_1DE216F80();
}

void sub_1DE219BC4()
{
  uint64_t *v0;
  uint64_t v1;

  sub_1DE217348(*v0);
  sub_1DE216F58();
  v1 = sub_1DE217320();
  sub_1DE204238(v1);
  sub_1DE216F80();
}

void sub_1DE219C0C()
{
  swift_bridgeObjectRetain();
  sub_1DE204208();
  sub_1DE20425C();
}

void sub_1DE219C4C(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_1DE219D3C(v1);
}

void sub_1DE219C78(void *a1)
{
  void *v1;
  void *v2;
  id v4;
  void *v5;
  id v6;

  v2 = v1;
  v4 = objc_msgSend(v2, sel_configuration);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(a1, sel_container);
    objc_msgSend(v5, sel_setContainer_, v6);

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE219CFC()
{
  id *v0;
  id v1;

  sub_1DE216F40();
  v1 = *v0;
  sub_1DE217040();
}

void sub_1DE219D3C(void *a1)
{
  void **v1;
  void *v3;

  sub_1DE219C78(a1);
  sub_1DE221CA4();
  v3 = *v1;
  *v1 = a1;

  sub_1DE217040();
}

void sub_1DE219D84(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v3;
  void **v4;
  void *v5;
  id v6;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  v4 = (void **)((char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x88));
  sub_1DE216F58();
  v5 = *v4;
  v3[3] = *v4;
  v6 = v5;
  sub_1DE221E30();
  sub_1DE2041D0();
}

void sub_1DE219DF8(uint64_t a1, char a2)
{
  void *v2;
  id v3;
  id *v4;
  id v5;

  v2 = *(void **)a1;
  v4 = (id *)(*(_QWORD *)a1 + 24);
  v3 = *v4;
  if ((a2 & 1) != 0)
  {
    v5 = v3;
    sub_1DE219D3C(v3);

  }
  else
  {
    sub_1DE219D3C(*(void **)(*(_QWORD *)a1 + 24));
  }
  sub_1DE221D84(v2);
}

uint64_t sub_1DE219E48()
{
  return sub_1DE217240();
}

uint64_t sub_1DE219E64(uint64_t a1)
{
  return sub_1DE2170B4(a1);
}

void sub_1DE219E80()
{
  _QWORD *v0;
  id v1;

  v1 = *(id *)((char *)v0 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0));
  sub_1DE20425C();
}

void sub_1DE219EBC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0xA0);
  v3 = *(void **)((char *)v1 + v2);
  *(_QWORD *)((char *)v1 + v2) = a1;

}

double sub_1DE219EE4@<D0>(uint64_t a1@<X8>)
{
  char v2;
  double result;
  __int128 v4;
  _OWORD v5[2];
  char v6;

  sub_1DE219F74((uint64_t)v5);
  v2 = v6;
  result = *(double *)v5;
  v4 = v5[1];
  *(_OWORD *)a1 = v5[0];
  *(_OWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 32) = v2;
  return result;
}

uint64_t sub_1DE219F24(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v6[4];
  char v7;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_BYTE *)(a1 + 32);
  v6[0] = *(_QWORD *)a1;
  v6[1] = v1;
  v6[2] = v2;
  v6[3] = v3;
  v7 = v4;
  sub_1DE20FE6C(v6[0], v1, v2, v3, v4);
  return sub_1DE219FD8(v6);
}

void sub_1DE219F74(uint64_t a1@<X8>)
{
  _QWORD *v1;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = (char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0xA8);
  sub_1DE216F58();
  v4 = *(_QWORD *)v3;
  v5 = *((_QWORD *)v3 + 1);
  v6 = *((_QWORD *)v3 + 2);
  v7 = *((_QWORD *)v3 + 3);
  *(_QWORD *)a1 = *(_QWORD *)v3;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  v8 = v3[32];
  *(_BYTE *)(a1 + 32) = v8;
  sub_1DE20FE6C(v4, v5, v6, v7, v8);
  sub_1DE217040();
}

uint64_t sub_1DE219FD8(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v12;

  v2 = *a1;
  v12 = *(_OWORD *)(a1 + 1);
  v3 = a1[3];
  v4 = *((_BYTE *)a1 + 32);
  v5 = (char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0xA8);
  sub_1DE216F58();
  v6 = *(_QWORD *)v5;
  v7 = *((_QWORD *)v5 + 1);
  v8 = *((_QWORD *)v5 + 2);
  v9 = *((_QWORD *)v5 + 3);
  *(_QWORD *)v5 = v2;
  *(_OWORD *)(v5 + 8) = v12;
  *((_QWORD *)v5 + 3) = v3;
  v10 = v5[32];
  v5[32] = v4;
  return sub_1DE20FEAC(v6, v7, v8, v9, v10);
}

void sub_1DE21A06C()
{
  sub_1DE217098();
  sub_1DE216F58();
  sub_1DE20425C();
}

double sub_1DE21A0B4@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_1DE21A12C((uint64_t *)&v3);
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

void sub_1DE21A0EC(uint64_t *a1)
{
  unint64_t v1;
  uint64_t v2[2];

  v1 = a1[1];
  v2[0] = *a1;
  v2[1] = v1;
  sub_1DE1FFB50(v2[0], v1);
  sub_1DE21A178(v2);
}

uint64_t sub_1DE21A12C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  sub_1DE219F74((uint64_t)&v4);
  result = v4;
  v3 = v5;
  if (v8)
  {
    sub_1DE20FEAC(v4, v5, v6, v7, v8);
    result = 0;
    v3 = 0xF000000000000000;
  }
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_1DE21A178(_QWORD *a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  char v8;

  v1 = a1[1];
  if (v1 >> 60 == 15)
  {
    v6 = 0u;
    v7 = 0u;
    v8 = 2;
    sub_1DE219FD8((uint64_t *)&v6);
  }
  else
  {
    *(_QWORD *)&v6 = *a1;
    *((_QWORD *)&v6 + 1) = v1;
    v7 = 0uLL;
    v8 = 0;
    v2 = sub_1DE217440();
    sub_1DE1FFB64(v2, v3);
    sub_1DE219FD8((uint64_t *)&v6);
    v4 = sub_1DE217440();
    sub_1DE1FFC40(v4, v5);
  }
  sub_1DE2172B8();
}

void sub_1DE21A1E8(uint64_t *a1)
{
  uint64_t v1;

  a1[2] = v1;
  sub_1DE21A12C(a1);
  sub_1DE20425C();
}

void sub_1DE21A218(_QWORD *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD v7[2];

  v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  if ((a2 & 1) != 0)
  {
    v3 = sub_1DE217440();
    sub_1DE1FFB50(v3, v4);
    sub_1DE21A178(v7);
    v5 = sub_1DE217440();
    sub_1DE1FFC40(v5, v6);
  }
  else
  {
    sub_1DE21A178(v7);
  }
}

void sub_1DE21A284()
{
  sub_1DE216F40();
  sub_1DE217040();
}

void sub_1DE21A2BC(char a1)
{
  _BYTE *v1;

  sub_1DE221CA4();
  *v1 = a1;
  sub_1DE217040();
}

void sub_1DE21A2F8()
{
  _QWORD *v0;
  id v1;

  v1 = *(id *)((char *)v0 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8));
  sub_1DE20425C();
}

void sub_1DE21A330(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v8 = *v4;
  v9 = a1;
  sub_1DE21931C((uint64_t)v9, v8);
  v11 = v10;

  if (v11)
  {
    swift_bridgeObjectRetain();
    sub_1DE219350(a2, a3, v11);
    v13 = v12;
    swift_bridgeObjectRelease();
    if (v13)
    {
      sub_1DE21938C(a4, v13);
      v15 = v14;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v15)
        goto LABEL_7;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  v16 = objc_allocWithZone(MEMORY[0x1E0C94FA0]);
  v17 = v9;
  swift_bridgeObjectRetain();
  sub_1DE21A4C0(objc_msgSend(v16, sel_init), v17, a2, a3, a4);
  v15 = 0;
LABEL_7:
  v18 = *v4;
  v19 = v9;
  swift_bridgeObjectRetain();
  sub_1DE21931C((uint64_t)v19, v18);
  v21 = v20;

  if (!v21)
  {
    __break(1u);
    goto LABEL_12;
  }
  sub_1DE219350(a2, a3, v21);
  v23 = v22;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v23)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  sub_1DE21938C(a4, v23);
  v25 = v24;
  swift_bridgeObjectRelease();
  if (v25)
  {

    return;
  }
LABEL_13:
  __break(1u);
}

void sub_1DE21A4C0(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t isUniquelyReferenced_nonNull_native;
  _QWORD *v22;
  id v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  _BOOL8 v27;
  Swift::Int v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  _QWORD *v33;
  char v34;
  id v35;
  char v36;
  _QWORD *v37;
  id v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  _BOOL8 v42;
  Swift::Int v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  char v47;
  _QWORD *v48;
  char v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  _BOOL8 v53;
  Swift::Int v54;
  unint64_t v55;
  char v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  char v60;
  id v62;
  id v63;
  _QWORD *v64;
  _QWORD *v65;
  _QWORD *v66;

  v6 = v5;
  sub_1DE21931C((uint64_t)a2, *v5);
  v12 = v11;
  swift_bridgeObjectRelease();
  if (!v12)
  {
    v13 = a2;
    sub_1DE220E88();

  }
  v14 = (_QWORD *)*v6;
  v15 = a2;
  swift_bridgeObjectRetain();
  sub_1DE21931C((uint64_t)v15, (uint64_t)v14);
  v17 = v16;

  if (!v17)
    goto LABEL_28;
  sub_1DE219350(a3, a4, v17);
  v19 = v18;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v19)
  {
    v62 = a1;
    v20 = v15;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v66 = (_QWORD *)*v6;
    v22 = v66;
    *v6 = 0x8000000000000000;
    v23 = v20;
    v24 = sub_1DE220FE0((uint64_t)v23);
    v26 = v22[2];
    v27 = (v25 & 1) == 0;
    v28 = v26 + v27;
    if (__OFADD__(v26, v27))
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v29 = v24;
    v30 = v25;
    sub_1DE1FFE88(&qword_1F0438C88);
    if (_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v28))
    {
      v31 = sub_1DE220FE0((uint64_t)v23);
      if ((v30 & 1) != (v32 & 1))
        goto LABEL_29;
      v29 = v31;
    }
    if ((v30 & 1) == 0)
    {
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    v33 = *(_QWORD **)(v66[7] + 8 * v29);
    v34 = swift_isUniquelyReferenced_nonNull_native();
    v64 = v33;
    sub_1DE221248(MEMORY[0x1E0DEE9E0], a3, a4, v34);
    v65 = v33;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1DE221854((uint64_t *)&v65, 1, &v66, v29, v23);

    swift_bridgeObjectRelease();
    *v6 = (uint64_t)v66;

    a1 = v62;
  }
  v35 = v15;
  swift_bridgeObjectRetain();
  v63 = a1;
  v36 = swift_isUniquelyReferenced_nonNull_native();
  v66 = (_QWORD *)*v6;
  v37 = v66;
  *v6 = 0x8000000000000000;
  v38 = v35;
  v39 = sub_1DE220FE0((uint64_t)v38);
  v41 = v37[2];
  v42 = (v40 & 1) == 0;
  v43 = v41 + v42;
  if (__OFADD__(v41, v42))
  {
    __break(1u);
    goto LABEL_23;
  }
  v44 = v39;
  v45 = v40;
  sub_1DE1FFE88(&qword_1F0438C88);
  if (_NativeDictionary.ensureUnique(isUnique:capacity:)(v36, v43))
  {
    v46 = sub_1DE220FE0((uint64_t)v38);
    if ((v45 & 1) == (v47 & 1))
    {
      v44 = v46;
      goto LABEL_15;
    }
LABEL_29:
    sub_1DE209038(0, &qword_1F0438980);
    goto LABEL_30;
  }
LABEL_15:
  if ((v45 & 1) == 0)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v48 = *(_QWORD **)(v66[7] + 8 * v44);
  swift_bridgeObjectRetain();
  v49 = swift_isUniquelyReferenced_nonNull_native();
  v64 = v48;
  swift_bridgeObjectRetain();
  v50 = sub_1DE220F78(a3, a4, (uint64_t (*)(uint64_t))sub_1DE2215D8);
  v52 = v48[2];
  v53 = (v51 & 1) == 0;
  v54 = v52 + v53;
  if (__OFADD__(v52, v53))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v55 = v50;
  v56 = v51;
  sub_1DE1FFE88((uint64_t *)&unk_1F0438C90);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(v49, v54))
    goto LABEL_20;
  v57 = sub_1DE220F78(a3, a4, (uint64_t (*)(uint64_t))sub_1DE2215D8);
  if ((v56 & 1) == (v58 & 1))
  {
    v55 = v57;
LABEL_20:
    if ((v56 & 1) != 0)
    {
      v59 = *(_QWORD *)(v64[7] + 8 * v55);
      v60 = swift_isUniquelyReferenced_nonNull_native();
      sub_1DE221168((uint64_t)v63, a5, v60);
      v65 = (_QWORD *)v59;
      swift_bridgeObjectRelease();
      sub_1DE221794((uint64_t *)&v65, 1, &v64, v55, a3, a4);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v65 = v64;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1DE221854((uint64_t *)&v65, 1, &v66, v44, v38);

      swift_bridgeObjectRelease();
      *v6 = (uint64_t)v66;

      swift_bridgeObjectRelease();
      return;
    }
    goto LABEL_25;
  }
LABEL_30:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
}

uint64_t sub_1DE21A938(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  char v5;
  uint64_t v6;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  v3 = a1;
  v4 = sub_1DE220FE0((uint64_t)v3);
  if ((v5 & 1) != 0)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v4);
    swift_bridgeObjectRetain();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_1DE21A994(uint64_t a1, void *a2)
{
  if (a1)
  {
    sub_1DE220E88();

  }
  else
  {
    sub_1DE220CF4((uint64_t)a2);

    swift_bridgeObjectRelease();
  }
}

void sub_1DE21A9EC()
{
  sub_1DE216F40();
  swift_bridgeObjectRetain();
  sub_1DE217040();
}

void CKCodeOperation.__allocating_init(functionName:request:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_allocWithZone((Class)sub_1DE221EBC());
  v5 = sub_1DE21729C();
  CKCodeOperation.init(functionName:request:)(v5, v6, a3);
}

void CKCodeOperation.init(functionName:request:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  char *v6;
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;

  v4 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v5 = (_QWORD *)(*MEMORY[0x1E0DEEDD8] & *v3);
  v6 = (char *)v3 + v5[14];
  v7 = v5[10];
  sub_1DE217250();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v8, v9, v10, v7);
  sub_1DE221CBC();
  v11 = v5[11];
  sub_1DE217250();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v12, v13, v14, v11);
  sub_1DE221CBC();
  *(_QWORD *)((char *)v3 + *(_QWORD *)(v15 + 136)) = 0;
  sub_1DE221CBC();
  v17 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)((char *)v3 + *(_QWORD *)(v16 + 144)) = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)((char *)v3 + *(_QWORD *)((*v4 & *v3) + 0x98)) = v17;
  sub_1DE221CBC();
  *(_QWORD *)((char *)v3 + *(_QWORD *)(v18 + 160)) = 0;
  sub_1DE221CBC();
  v20 = (char *)v3 + *(_QWORD *)(v19 + 168);
  *(_OWORD *)v20 = 0u;
  *((_OWORD *)v20 + 1) = 0u;
  v20[32] = 2;
  sub_1DE221CBC();
  *((_BYTE *)v3 + *(_QWORD *)(v21 + 176)) = 0;
  sub_1DE221CBC();
  *(_QWORD *)((char *)v3 + *(_QWORD *)(v22 + 184)) = 0;
  sub_1DE221CBC();
  *(_QWORD *)((char *)v3 + *(_QWORD *)(v23 + 192)) = MEMORY[0x1E0DEE9E0];
  sub_1DE221CBC();
  v25 = (_QWORD *)((char *)v3 + *(_QWORD *)(v24 + 200));
  *v25 = 0;
  v25[1] = 0;
  sub_1DE221CBC();
  v27 = (_QWORD *)((char *)v3 + *(_QWORD *)(v26 + 208));
  *v27 = 0;
  v27[1] = 0;
  sub_1DE221CBC();
  v29 = (_QWORD *)((char *)v3 + *(_QWORD *)(v28 + 216));
  *v29 = 0;
  v29[1] = 0;
  sub_1DE221CBC();
  v31 = (_QWORD *)((char *)v3 + *(_QWORD *)(v30 + 240));
  *v31 = 0;
  v31[1] = 0;
  sub_1DE221CBC();
  v33 = (_QWORD *)((char *)v3 + *(_QWORD *)(v32 + 248));
  *v33 = 0;
  v33[1] = 0;
  sub_1DE216F58();
  v34 = sub_1DE2174D0();
  v35 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 24);
  v36 = v3;
  v35(v6, a3, v34);
  swift_endAccess();
  sub_1DE221CBC();
  v38 = (_QWORD *)((char *)v36 + *(_QWORD *)(v37 + 128));
  *v38 = a1;
  v38[1] = a2;
  sub_1DE221CBC();
  *((_BYTE *)v36 + *(_QWORD *)(v39 + 232)) = 0;
  sub_1DE221CBC();
  *((_BYTE *)v36 + *(_QWORD *)(v40 + 224)) = 1;

  sub_1DE221D7C();
}

void sub_1DE21AC44(objc_class *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, objc_super a17)
{
  a17.super_class = a1;
  -[objc_class init](&a17, sel_init);
  type metadata accessor for CKCodeOperation.CallbackRelay();
}

void sub_1DE21AC70()
{
  void *v0;
  id v1;

  v1 = v0;
  sub_1DE21ACF0();
}

_QWORD *sub_1DE21AC84(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  void *v8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  v7 = *(_QWORD *)((*v5 & *v1) + 0xB8);
  v8 = *(void **)((char *)v1 + v7);
  *(_QWORD *)((char *)v1 + v7) = a1;

  return v1;
}

void type metadata accessor for CKCodeOperation()
{
  JUMPOUT(0x1DF0EA560);
}

void type metadata accessor for CKCodeOperation.CallbackRelay()
{
  JUMPOUT(0x1DF0EA560);
}

void sub_1DE21ACF0()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  sub_1DE21E8D0();
}

void sub_1DE21AD20(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD *, uint64_t);

  sub_1DE21AE04();
  if (v2)
  {
    v4 = v2;
    v5 = v3;
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 16) = v4;
    *(_QWORD *)(v2 + 24) = v5;
    v6 = sub_1DE221C08;
  }
  else
  {
    v6 = 0;
  }
  *a1 = v6;
  a1[1] = v2;
}

void sub_1DE21AD84(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
  }
  sub_1DE204B48(v1);
  sub_1DE21AE3C();
}

void sub_1DE21AE04()
{
  sub_1DE216F40();
  sub_1DE216FB8();
  sub_1DE217040();
}

void sub_1DE21AE3C()
{
  sub_1DE2171B0();
  sub_1DE221CA4();
  sub_1DE217034();
  sub_1DE216F80();
}

void sub_1DE21AE78()
{
  sub_1DE217098();
  sub_1DE216F58();
  sub_1DE20425C();
}

void sub_1DE21AEC0(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD *, double *);

  sub_1DE21038C();
  if (v2)
  {
    v4 = v2;
    v5 = v3;
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 16) = v4;
    *(_QWORD *)(v2 + 24) = v5;
    v6 = sub_1DE221BE4;
  }
  else
  {
    v6 = 0;
  }
  *a1 = v6;
  a1[1] = v2;
}

void sub_1DE21AF24(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
  }
  sub_1DE204B48(v1);
  sub_1DE21AFA4();
}

void sub_1DE21AFA4()
{
  sub_1DE2171B0();
  sub_1DE221CA4();
  sub_1DE217034();
  sub_1DE216F80();
}

void sub_1DE21AFE0(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t (**a3)()@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();
  __int128 v9;
  __int128 v10;

  v9 = *(_OWORD *)(a2 + a1 - 16);
  v10 = *(_OWORD *)(a2 + a1 - 32);
  sub_1DE21053C();
  if (v4)
  {
    v6 = v4;
    v7 = v5;
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = v10;
    *(_OWORD *)(v4 + 32) = v9;
    *(_QWORD *)(v4 + 48) = v6;
    *(_QWORD *)(v4 + 56) = v7;
    v8 = sub_1DE221CA0;
  }
  else
  {
    v8 = 0;
  }
  *a3 = v8;
  a3[1] = (uint64_t (*)())v4;
}

void sub_1DE21B068(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v4 = *a1;
  v5 = a1[1];
  if (*a1)
  {
    v6 = a4 + a3;
    v7 = swift_allocObject();
    v8 = *(_OWORD *)(v6 - 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)(v6 - 32);
    *(_OWORD *)(v7 + 32) = v8;
    *(_QWORD *)(v7 + 48) = v4;
    *(_QWORD *)(v7 + 56) = v5;
  }
  sub_1DE204B48(v4);
  sub_1DE21B0F4();
}

void sub_1DE21B0F4()
{
  sub_1DE2171B0();
  sub_1DE221CA4();
  sub_1DE217034();
  sub_1DE216F80();
}

void sub_1DE21B130()
{
  sub_1DE217098();
  sub_1DE216F58();
  sub_1DE20425C();
}

void sub_1DE21B178()
{
  sub_1DE216F40();
  sub_1DE217040();
}

void sub_1DE21B1B0(char a1)
{
  _BYTE *v1;

  sub_1DE221CA4();
  *v1 = a1;
  sub_1DE217040();
}

void sub_1DE21B1EC()
{
  sub_1DE217098();
  sub_1DE216F58();
  sub_1DE20425C();
}

void sub_1DE21B234(char a1)
{
  _BYTE *v1;

  sub_1DE221CA4();
  *v1 = a1;
  sub_1DE217040();
}

void sub_1DE21B270(uint64_t a1@<X1>, uint64_t a2@<X2>, void (**a3)()@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)();
  __int128 v9;
  __int128 v10;

  v9 = *(_OWORD *)(a2 + a1 - 16);
  v10 = *(_OWORD *)(a2 + a1 - 32);
  sub_1DE21B384();
  if (v4)
  {
    v6 = v4;
    v7 = v5;
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = v10;
    *(_OWORD *)(v4 + 32) = v9;
    *(_QWORD *)(v4 + 48) = v6;
    *(_QWORD *)(v4 + 56) = v7;
    v8 = sub_1DE221B80;
  }
  else
  {
    v8 = 0;
  }
  *a3 = v8;
  a3[1] = (void (*)())v4;
}

void sub_1DE21B2F8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v4 = *a1;
  v5 = a1[1];
  if (*a1)
  {
    v6 = a4 + a3;
    v7 = swift_allocObject();
    v8 = *(_OWORD *)(v6 - 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)(v6 - 32);
    *(_OWORD *)(v7 + 32) = v8;
    *(_QWORD *)(v7 + 48) = v4;
    *(_QWORD *)(v7 + 56) = v5;
  }
  sub_1DE204B48(v4);
  sub_1DE21B3BC();
}

void sub_1DE21B384()
{
  sub_1DE216F40();
  sub_1DE216FB8();
  sub_1DE217040();
}

void sub_1DE21B3BC()
{
  sub_1DE2171B0();
  sub_1DE221CA4();
  sub_1DE217034();
  sub_1DE216F80();
}

void sub_1DE21B3F8(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t (**a3)()@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();
  __int128 v9;
  __int128 v10;

  v9 = *(_OWORD *)(a2 + a1 - 16);
  v10 = *(_OWORD *)(a2 + a1 - 32);
  sub_1DE210A98();
  if (v4)
  {
    v6 = v4;
    v7 = v5;
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = v10;
    *(_OWORD *)(v4 + 32) = v9;
    *(_QWORD *)(v4 + 48) = v6;
    *(_QWORD *)(v4 + 56) = v7;
    v8 = sub_1DE221CA0;
  }
  else
  {
    v8 = 0;
  }
  *a3 = v8;
  a3[1] = (uint64_t (*)())v4;
}

void sub_1DE21B480(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t (*v9)();

  v4 = *a1;
  v5 = a1[1];
  if (*a1)
  {
    v6 = a4 + a3;
    v7 = swift_allocObject();
    v8 = *(_OWORD *)(v6 - 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)(v6 - 32);
    *(_OWORD *)(v7 + 32) = v8;
    *(_QWORD *)(v7 + 48) = v4;
    *(_QWORD *)(v7 + 56) = v5;
    v9 = sub_1DE221CA0;
  }
  else
  {
    v9 = 0;
  }
  sub_1DE204B48(v4);
  sub_1DE21B50C((uint64_t)v9);
}

void sub_1DE21B50C(uint64_t a1)
{
  if (a1 && !*MEMORY[0x1E0C95280])
  {
    __break(1u);
  }
  else
  {
    sub_1DE221CA4();
    sub_1DE217034();
    sub_1DE216F80();
  }
}

void sub_1DE21B568(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  v4 = (_QWORD *)((char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0xF8));
  sub_1DE216F58();
  v5 = *v4;
  v6 = v4[1];
  v3[3] = *v4;
  v3[4] = v6;
  sub_1DE204B48(v5);
  sub_1DE2041D0();
}

void sub_1DE21B5DC(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = sub_1DE21729C();
    sub_1DE204B48(v3);
    sub_1DE221F14();
    sub_1DE204AEC(v2[3]);
  }
  else
  {
    sub_1DE221F14();
  }
  sub_1DE221D84(v2);
}

void sub_1DE21B628()
{
  sub_1DE221D7C();
}

void sub_1DE21B658(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 - 16) = v1;
  *(_QWORD *)(v2 - 8) = a1;
  if ((objc_msgSendSuper2((objc_super *)(v2 - 16), sel_hasCKOperationCallbacksSet) & 1) == 0)
  {
    sub_1DE21AE04();
    if (v3 || (sub_1DE21053C(), v3) || (sub_1DE21038C(), v3) || (sub_1DE21B384(), v3))
      sub_1DE204AEC(v3);
  }
}

void sub_1DE21B6A4(void *a1)
{
  id v1;

  v1 = a1;
  sub_1DE21B628();
}

uint64_t sub_1DE21B6BC(char a1)
{
  void *v1;

  return a1 & 1;
}

uint64_t sub_1DE21B6D4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  unsigned __int8 v12;
  uint64_t v14;
  objc_super v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0DEEDD8] & *v0;
  v2 = *(_QWORD *)(v1 + 0x50);
  v3 = type metadata accessor for Optional();
  v4 = *(_QWORD *)(v3 - 8);
  sub_1DE221D44();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v15 - v6;
  sub_1DE219CFC();
  v9 = v8;

  if (v9)
  {
    sub_1DE219B7C();
    v10 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v7, 1, v2);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    if (v10 != 1)
    {
      v11 = objc_msgSend(v0, sel_resolvedConfiguration);
      v12 = objc_msgSend(v11, sel_isLongLived);

      if ((v12 & 1) == 0)
      {
        v16 = 0;
        v17 = v2;
        v14 = *(_QWORD *)(v1 + 104);
        v18 = *(_OWORD *)(v1 + 88);
        v19 = v14;
        type metadata accessor for CKCodeOperation();
      }
    }
  }
  sub_1DE21715C();
  related decl 'e' for CKErrorCode.init(_:description:)();
  return swift_willThrow();
}

uint64_t sub_1DE21B8C0(void *a1)
{
  id v1;

  v1 = a1;
  sub_1DE21B6D4();

  return 1;
}

char *sub_1DE21B938()
{
  return sub_1DE2110D8();
}

void sub_1DE21B94C()
{
  uint64_t *v0;
  _QWORD *v1;
  id v2;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  char *v35;
  int64_t v36;
  char v37;
  void *v38;
  void *v39;
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
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  unint64_t v57;
  unint64_t v58;
  char *v59;
  void *v60;
  void *v61;
  char *v62;
  int64_t v63;
  char v64;
  uint64_t v65;
  _BOOL8 v66;
  int64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73[2];
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
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

  sub_1DE216FF0();
  v2 = v1;
  v3 = *MEMORY[0x1E0DEEDD8] & *v1;
  v4 = type metadata accessor for Google_Protobuf_Any();
  v83 = *(_QWORD *)(v4 - 8);
  v84 = v4;
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v5);
  sub_1DE221F28();
  v82 = v6;
  sub_1DE1FFE88((uint64_t *)&unk_1EDB822A0);
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v7);
  sub_1DE217084();
  v80 = v8;
  sub_1DE21712C();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v73 - v10;
  v85 = type metadata accessor for Ckcode_ProtectedEnvelope(0);
  v73[1] = *(id *)(v85 - 8);
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v12);
  sub_1DE221F28();
  v81 = v13;
  v14 = sub_1DE2171A8();
  v87 = *(_QWORD *)(v14 - 8);
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v15);
  sub_1DE20430C();
  v16 = *(_QWORD *)(v3 + 80);
  sub_1DE2174D0();
  sub_1DE221D44();
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)v73 - v18;
  v20 = *(_QWORD *)(v16 - 8);
  sub_1DE221D44();
  MEMORY[0x1E0C80A78](v21);
  v23 = (char *)v73 - v22;
  sub_1DE219B7C();
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v19, 1, v16) == 1)
  {
    __break(1u);
    goto LABEL_33;
  }
  v76 = v20;
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v23, v19, v16);
  v24 = *(_QWORD *)(v3 + 96);
  sub_1DE2025EC(&qword_1EDB82278, (uint64_t (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport, (uint64_t)&protocol conformance descriptor for Ckcode_RecordTransport);
  v77 = v24;
  v78 = v16;
  v79 = v23;
  v86 = sub_1DE2061D4(v14, v16, v14, v24, v25);
  v74 = 0;
  v75 = v3;
  v26 = *(_QWORD *)(v86 + 16);
  v27 = v81;
  if (!v26)
  {
    sub_1DE221E78();
    v29 = (char *)MEMORY[0x1E0DEE9D8];
LABEL_15:
    sub_1DE2025EC(&qword_1EDB822B0, type metadata accessor for Ckcode_ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_ProtectedEnvelope);
    v40 = v78;
    v41 = v74;
    v43 = sub_1DE2061D4(v85, v78, v85, v77, v42);
    if (!v41)
    {
      v44 = *(_QWORD *)(v43 + 16);
      if (!v44)
      {
        swift_bridgeObjectRelease();
        v70 = MEMORY[0x1E0DEE9D8];
LABEL_31:
        sub_1DE219E64((uint64_t)v29);
        sub_1DE20F064(v70);
        v71 = *(_QWORD *)(v75 + 88);
        v72 = *(_QWORD *)(v75 + 104);
        v88 = v40;
        v89 = v71;
        v90 = v77;
        v91 = v72;
        sub_1DE221D7C();
      }
      sub_1DE2172A8();
      v74 = v45;
      v47 = v45 + v46;
      v49 = *(_QWORD *)(v48 + 72);
      v86 = MEMORY[0x1E0DEE9D8];
      v87 = v49;
      v85 = 0x80000001DE22AD70;
      v50 = v80;
      while (1)
      {
        sub_1DE221F7C(v47, v27);
        sub_1DE203ED0(v27, (uint64_t)v11, (uint64_t *)&unk_1EDB822A0);
        sub_1DE221E5C(v27);
        v51 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
        if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v11, 1, v51) != 1)
        {
          sub_1DE203ED0((uint64_t)v11, v50, (uint64_t *)&unk_1EDB822A0);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            v52 = v2;
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 32))(v82, v50, v84);
            sub_1DE2025EC(&qword_1EDB81A10, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E828], MEMORY[0x1E0D3E818]);
            v53 = Message.serializedData(partial:)();
            v55 = v54;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
            {
              v56 = (char *)v86;
            }
            else
            {
              v62 = (char *)sub_1DE2170E8();
              v56 = sub_1DE215624(v62, v63, v64, v65);
            }
            v58 = *((_QWORD *)v56 + 2);
            v57 = *((_QWORD *)v56 + 3);
            if (v58 >= v57 >> 1)
            {
              v66 = sub_1DE221E80(v57);
              v56 = sub_1DE215624((char *)v66, v67, v68, v69);
            }
            *((_QWORD *)v56 + 2) = v58 + 1;
            v86 = (uint64_t)v56;
            v59 = &v56[16 * v58];
            *((_QWORD *)v59 + 4) = v53;
            *((_QWORD *)v59 + 5) = v55;
            (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v82, v84);
            v2 = v52;
            v50 = v80;
            v27 = v81;
            goto LABEL_27;
          }
          sub_1DE2005D4(v50, type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents);
        }
        v60 = (void *)related decl 'e' for CKErrorCode.init(_:description:)();
        v61 = (void *)_convertErrorToNSError(_:)();

        objc_msgSend(v2, sel_finishWithError_, v61);
LABEL_27:
        sub_1DE203EA8((uint64_t)v11, (uint64_t *)&unk_1EDB822A0);
        v47 += v87;
        if (!--v44)
        {
          swift_bridgeObjectRelease();
          v40 = v78;
          v70 = v86;
          goto LABEL_31;
        }
      }
    }
LABEL_33:
    sub_1DE221D20();
    swift_unexpectedError();
    __break(1u);
    return;
  }
  v73[0] = v2;
  v28 = v86 + ((*(unsigned __int8 *)(v87 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v87 + 80));
  v87 = *(_QWORD *)(v87 + 72);
  v29 = (char *)MEMORY[0x1E0DEE9D8];
  while (1)
  {
    sub_1DE221F7C(v28, (uint64_t)v0);
    v31 = *v0;
    v30 = v0[1];
    sub_1DE211704(*v0, v30);
    sub_1DE221E5C((uint64_t)v0);
    if ((~v30 & 0x3000000000000000) == 0)
      goto LABEL_14;
    if ((v30 & 0x2000000000000000) != 0)
      break;
    sub_1DE205854(v31, v30);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v35 = (char *)sub_1DE2170E8();
      v29 = sub_1DE215624(v35, v36, v37, (uint64_t)v29);
    }
    v33 = *((_QWORD *)v29 + 2);
    v32 = *((_QWORD *)v29 + 3);
    if (v33 >= v32 >> 1)
      v29 = sub_1DE215624((char *)(v32 > 1), v33 + 1, 1, (uint64_t)v29);
    *((_QWORD *)v29 + 2) = v33 + 1;
    v34 = &v29[16 * v33];
    *((_QWORD *)v34 + 4) = v31;
    *((_QWORD *)v34 + 5) = v30;
    sub_1DE221EC8();
    v28 += v87;
    if (!--v26)
    {
      sub_1DE221E78();
      v2 = v73[0];
      goto LABEL_15;
    }
  }
  sub_1DE221EC8();
LABEL_14:
  swift_bridgeObjectRelease();
  sub_1DE221E78();
  sub_1DE21715C();
  v38 = (void *)related decl 'e' for CKErrorCode.init(_:description:)();
  v39 = (void *)_convertErrorToNSError(_:)();

  sub_1DE2170E0(v73[0], sel_finishWithError_);
  (*(void (**)(char *, uint64_t))(v76 + 8))(v79, v78);
  sub_1DE2041DC();
}

void sub_1DE21BFA8(void *a1)
{
  id v1;

  v1 = a1;
  sub_1DE21B94C();

}

uint64_t sub_1DE21BFDC(uint64_t a1)
{
  sub_1DE21174C(a1);
  return swift_getObjCClassFromMetadata();
}

void *sub_1DE21BFF0()
{
  return sub_1DE211784();
}

uint64_t sub_1DE21C004()
{
  return CKOperationSignpostBegin(_:_:)();
}

void sub_1DE21C01C(void *a1)
{
  id v1;

  v1 = a1;
  sub_1DE21C004();

}

uint64_t sub_1DE21C050()
{
  return CKOperationSignpostEnd(_:_:error:)();
}

void sub_1DE21C06C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a1;
  v5 = a3;
  sub_1DE21C050();

}

id sub_1DE21C0B0(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  v2 = (void *)sub_1DE211850();

  return v2;
}

void sub_1DE21C0E0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSURL *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  char v32;
  char v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  Class isa;
  Class v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  void *v42;
  void *v43;
  uint64_t v44;
  Class v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  char v53;

  sub_1DE216FF0();
  v4 = v3;
  v50 = *v0;
  v5 = *MEMORY[0x1E0DEEDD8];
  v6 = sub_1DE217318();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  sub_1DE221E00();
  sub_1DE1FFE88(qword_1EDB81C68);
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v8);
  sub_1DE221E18();
  objc_opt_self();
  v9 = (void *)swift_dynamicCastObjCClassUnconditional();
  sub_1DE219CFC();
  if (!v10)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v11 = v10;
  v12 = v4;
  v13 = objc_msgSend(v11, sel_serviceName);

  if (!v13)
  {
    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v13 = (id)MEMORY[0x1DF0E9E7C](v15);
    v14 = sub_1DE21707C();
  }
  sub_1DE221EB0(v14, sel_setServiceName_);

  sub_1DE221F20();
  if (!v16)
    goto LABEL_22;
  v17 = v16;
  v18 = objc_msgSend(v16, sel_serviceInstanceURL);

  if (v18)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v1, v2, v6);
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v1, 0, 1, v6);
    if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v1, 1, v6) != 1)
    {
      URL._bridgeToObjectiveC()(v19);
      v21 = v20;
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v6);
      goto LABEL_10;
    }
  }
  else
  {
    sub_1DE217250();
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v22, v23, v24, v6);
  }
  v21 = 0;
LABEL_10:
  sub_1DE2170E0(v9, sel_setClientRuntimeProvidedServiceURL_);

  sub_1DE221F20();
  if (!v25)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v26 = v25;
  CKCodeService.databaseScope.getter();

  sub_1DE221EA8(v27, sel_setEnqueuedOnContainerService_);
  sub_1DE221F20();
  if (v28)
  {
    v29 = v28;
    v30 = v12;
    v31 = CKCodeService.databaseScope.getter();
    v33 = v32;

    if ((v33 & 1) != 0)
      v34 = 1;
    else
      v34 = (uint64_t)v31;
    objc_msgSend(v9, sel_setDatabaseScope_, v34);

    sub_1DE219C0C();
    v35 = (void *)MEMORY[0x1DF0E9E7C]();
    v36 = sub_1DE21707C();
    sub_1DE221DD8(v36, sel_setFunctionName_);

    sub_1DE219E48();
    isa = Array._bridgeToObjectiveC()().super.isa;
    sub_1DE21707C();
    objc_msgSend(v9, sel_setRequestLocalSerializations_, isa);

    sub_1DE20F048();
    v38 = Array._bridgeToObjectiveC()().super.isa;
    v39 = sub_1DE21707C();
    sub_1DE221DD8(v39, sel_setRequestLocalEnvelopes_);

    sub_1DE219F74((uint64_t)&v51);
    v40 = v51;
    v41 = v52;
    if (v53)
    {
      if (v53 == 1)
      {
        objc_msgSend(v9, sel_setDataProtectionType_, 2);
        v42 = (void *)MEMORY[0x1DF0E9E7C](v40, *((_QWORD *)&v40 + 1));
        sub_1DE2173E4();
        objc_msgSend(v9, sel_setTrustedTargetDomain_, v42);

        v43 = (void *)MEMORY[0x1DF0E9E7C](v41, *((_QWORD *)&v41 + 1));
        v44 = sub_1DE21707C();
        sub_1DE221DD8(v44, sel_setTrustedTargetOID_);

      }
      else
      {
        objc_msgSend(v9, sel_setDataProtectionType_, 0);
      }
    }
    else
    {
      sub_1DE1FFB64(v51, *((unint64_t *)&v51 + 1));
      v45 = Data._bridgeToObjectiveC()().super.isa;
      v46 = sub_1DE221D64();
      sub_1DE221EB0(v46, sel_setPermittedRemoteMeasurement_);

      objc_msgSend(v9, sel_setDataProtectionType_, 1);
      sub_1DE221D64();
    }
    sub_1DE21A284();
    sub_1DE221EA8(v47, sel_setShouldSendRecordPCSKeys_);
    sub_1DE2107EC();
    sub_1DE221EA8(v48, sel_setShouldFetchAssetContentInMemory_);
    v49 = *(_OWORD *)((v5 & v50) + 0x60);
    v51 = *(_OWORD *)((v5 & v50) + 0x50);
    v52 = v49;
    sub_1DE221D7C();
  }
LABEL_24:
  __break(1u);
}

void sub_1DE21C508(void *a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  a1;
  sub_1DE21C0E0();
}

void sub_1DE21C540()
{
  void *v0;
  void *v1;

}

void sub_1DE21C55C()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_1DE21C5B4()
{
  sub_1DE21C55C();
}

void sub_1DE21C5C0(uint64_t a1)
{
  void *ObjCClassFromMetadata;
  id v2;
  void *v3;

  sub_1DE217328(a1, (unint64_t *)&unk_1EDB81D90);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v2 = sub_1DE217264(ObjCClassFromMetadata, sel_applyDaemonCallbackInterfaceTweaks_);
  sub_1DE217328((uint64_t)v2, (unint64_t *)&unk_1EDB81DA0);
  v3 = (void *)swift_getObjCClassFromMetadata();
  sub_1DE217264(v3, sel_applyDaemonCallbackInterfaceTweaks_);
  swift_getObjCClassFromMetadata();
  sub_1DE221D7C();
}

void sub_1DE21C638(_QWORD *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, objc_super a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;

  v22 = (objc_class *)(*MEMORY[0x1E0DEEDD8] & *a1);
  a13.receiver = v20;
  a13.super_class = v22;
  objc_msgSendSuper2(&a13, *(SEL *)(v21 + 3504), v19);
  sub_1DE2172B8();
}

void sub_1DE21C668(uint64_t a1, uint64_t a2, void *a3)
{
  swift_getObjCClassMetadata();
  sub_1DE21C5C0((uint64_t)a3);
}

void sub_1DE21C690()
{
  void *v0;

}

void sub_1DE21C6A4()
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
  uint64_t v12;
  uint64_t v13;
  char *v14;
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
  uint64_t v30;
  unint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _QWORD v40[3];
  uint64_t v41;
  uint64_t (*v42)(char *, char *, char *);
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  sub_1DE216FF0();
  v48 = v1;
  v46 = v2;
  v44 = v3;
  v5 = v4;
  v7 = v6;
  v8 = *MEMORY[0x1E0DEEDD8] & *v0;
  v9 = type metadata accessor for Ckcode_ProtectedEnvelope(0);
  v49 = *(_QWORD *)(v9 - 8);
  v50 = v9;
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v10);
  sub_1DE2042FC();
  v13 = v12 - v11;
  v14 = *(char **)(v8 + 80);
  sub_1DE2174D0();
  sub_1DE221D44();
  v16 = MEMORY[0x1E0C80A78](v15);
  v18 = (char *)v40 - v17;
  v19 = *((_QWORD *)v14 - 1);
  MEMORY[0x1E0C80A78](v16);
  sub_1DE217084();
  v43 = v20;
  sub_1DE21712C();
  MEMORY[0x1E0C80A78](v21);
  v45 = (char *)v40 - v22;
  sub_1DE21712C();
  MEMORY[0x1E0C80A78](v23);
  v25 = (char *)v40 - v24;
  v47 = v0;
  sub_1DE219B7C();
  if (sub_1DE221E4C() == 1)
  {
    __break(1u);
  }
  else
  {
    v42 = *(uint64_t (**)(char *, char *, char *))(v19 + 32);
    v26 = v42(v25, v18, v14);
    if (*(_QWORD *)(v7 + 16))
    {
      MEMORY[0x1E0C80A78](v26);
      v40[-2] = v5;
      v27 = swift_bridgeObjectRetain();
      sub_1DE21943C(v27, (void (*)(uint64_t, uint64_t, unint64_t))sub_1DE216DA4);
      swift_bridgeObjectRelease();
      sub_1DE2171A8();
      sub_1DE2025EC(&qword_1EDB82278, (uint64_t (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport, (uint64_t)&protocol conformance descriptor for Ckcode_RecordTransport);
      Message.substituteMessages<A>(substitutionType:substitutions:)();
    }
    v41 = v19;
    v28 = v44;
    v29 = *(_QWORD *)(v44 + 16);
    if (v29)
    {
      v40[1] = v8;
      v40[2] = v25;
      v45 = v14;
      v51 = MEMORY[0x1E0DEE9D8];
      sub_1DE221988();
      v31 = (unint64_t *)(v28 + 40);
      while (1)
      {
        v32 = *(v31 - 1);
        v33 = *v31;
        MEMORY[0x1E0C80A78](v30);
        v40[-2] = v32;
        v40[-1] = v33;
        sub_1DE1FFB64(v32, v33);
        sub_1DE2025EC(&qword_1EDB822B0, type metadata accessor for Ckcode_ProtectedEnvelope, (uint64_t)&protocol conformance descriptor for Ckcode_ProtectedEnvelope);
        static Message.with(_:)();
        sub_1DE1FFC54(v32, v33);
        v34 = v51;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1DE221988();
          v34 = v51;
        }
        v35 = *(_QWORD *)(v34 + 16);
        if (v35 >= *(_QWORD *)(v34 + 24) >> 1)
        {
          sub_1DE221988();
          v34 = v51;
        }
        v31 += 2;
        *(_QWORD *)(v34 + 16) = v35 + 1;
        sub_1DE2172A8();
        sub_1DE202628(v13, v34 + v36 + *(_QWORD *)(v37 + 72) * v35, type metadata accessor for Ckcode_ProtectedEnvelope);
        if (!--v29)
          Message.substituteMessages<A>(substitutionType:substitutions:)();
      }
    }
    v38 = Message.serializedData(partial:)();
    sub_1DE1FFB64(v38, v39);
    sub_1DE21742C();
    sub_1DE2174A0();
    sub_1DE2174A0();
    sub_1DE221D90((uint64_t)v25, *(uint64_t (**)(uint64_t, uint64_t))(v41 + 8));
    sub_1DE2041DC();
  }
}

uint64_t sub_1DE21CB7C(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;

  sub_1DE203EA8((uint64_t)a1, (uint64_t *)&unk_1EDB822A0);
  *a1 = a2;
  a1[1] = a3;
  v6 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  swift_storeEnumTagMultiPayload();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
  return sub_1DE1FFB64(a2, a3);
}

void sub_1DE21CC04()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
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
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  char *v45;
  int64_t v46;
  char v47;
  _BOOL8 v48;
  int64_t v49;
  char v50;
  id v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[3];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  _OWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  unint64_t v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;

  sub_1DE216FF0();
  v70 = v2;
  v71 = v1;
  v72 = v0;
  v73 = v3;
  v5 = v4;
  v6 = *MEMORY[0x1E0DEEDD8] & *v0;
  v7 = sub_1DE2171A8();
  v67 = *(_QWORD *)(v7 - 8);
  v68 = v7;
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v8);
  sub_1DE217084();
  v64 = v9;
  sub_1DE21712C();
  MEMORY[0x1E0C80A78](v10);
  v65 = (_OWORD *)((char *)v57 - v11);
  sub_1DE21712C();
  MEMORY[0x1E0C80A78](v12);
  v14 = (_QWORD *)((char *)v57 - v13);
  v15 = *(_QWORD *)(v6 + 88);
  v66 = type metadata accessor for Optional();
  v16 = *(_QWORD *)(v66 - 8);
  sub_1DE221D44();
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)v57 - v18;
  type metadata accessor for BinaryDecodingOptions();
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v20);
  sub_1DE221E18();
  v69 = *(_QWORD *)(v15 - 8);
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v21);
  sub_1DE204214();
  v24 = v22 - v23;
  MEMORY[0x1E0C80A78](v25);
  v76 = 0;
  v74 = 0u;
  v75 = 0u;
  v26 = *(_QWORD *)(v6 + 104);
  v28 = (char *)v57 - v27;
  sub_1DE1FFB64(v5, v73);
  BinaryDecodingOptions.init()();
  Message.init(serializedData:extensions:partial:options:)();
  v73 = v24;
  v62 = v16;
  v29 = *(void (**)(char *, char *, uint64_t))(v69 + 16);
  v29(v19, v28, v15);
  sub_1DE221E3C((uint64_t)v19);
  sub_1DE20EF4C();
  sub_1DE2025EC(&qword_1EDB82278, (uint64_t (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport, (uint64_t)&protocol conformance descriptor for Ckcode_RecordTransport);
  v31 = v30;
  v61 = v26;
  v63 = v28;
  v32 = sub_1DE2061D4(v68, v15, v68, v26, v30);
  v59 = 0;
  v60 = v31;
  v57[0] = v29;
  v57[1] = v19;
  v33 = *(_QWORD *)(v32 + 16);
  if (!v33)
  {
    swift_bridgeObjectRelease();
    v39 = (char *)MEMORY[0x1E0DEE9D8];
LABEL_14:
    v54 = (uint64_t)v65;
    *v65 = xmmword_1DE226BD0;
    v55 = v68;
    UnknownStorage.init()();
    *(_OWORD *)(v54 + *(int *)(v55 + 24)) = xmmword_1DE226500;
    v56 = v64;
    sub_1DE2008C4(v54, v64, (uint64_t (*)(_QWORD))type metadata accessor for Ckcode_RecordTransport);
    sub_1DE2195A8(v56, *((_QWORD *)v39 + 2));
    Message.substituteMessages<A>(substitutionType:substitutions:)();
  }
  v58 = v15;
  sub_1DE2172A8();
  v57[2] = v34;
  v36 = v34 + v35;
  v38 = *(_QWORD *)(v37 + 72);
  v39 = (char *)MEMORY[0x1E0DEE9D8];
  while (1)
  {
    sub_1DE221F7C(v36, (uint64_t)v14);
    v40 = *v14;
    v41 = v14[1];
    sub_1DE211704(*v14, v41);
    sub_1DE221E5C((uint64_t)v14);
    if ((~v41 & 0x3000000000000000) == 0)
      goto LABEL_13;
    if ((v41 & 0x2000000000000000) == 0)
      break;
    sub_1DE205854(v40, v41);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v45 = (char *)sub_1DE2170E8();
      v39 = sub_1DE215624(v45, v46, v47, (uint64_t)v39);
    }
    v43 = *((_QWORD *)v39 + 2);
    v42 = *((_QWORD *)v39 + 3);
    if (v43 >= v42 >> 1)
    {
      v48 = sub_1DE221E80(v42);
      v39 = sub_1DE215624((char *)v48, v49, v50, (uint64_t)v39);
    }
    *((_QWORD *)v39 + 2) = v43 + 1;
    v44 = &v39[16 * v43];
    *((_QWORD *)v44 + 4) = v40;
    *((_QWORD *)v44 + 5) = v41 & 0xDFFFFFFFFFFFFFFFLL;
    sub_1DE221EFC();
    v36 += v38;
    if (!--v33)
    {
      sub_1DE217480();
      goto LABEL_14;
    }
  }
  sub_1DE221EFC();
LABEL_13:
  sub_1DE21722C();
  sub_1DE217480();
  sub_1DE21715C();
  v51 = (id)related decl 'e' for CKErrorCode.init(_:description:)();
  v52 = (void *)_convertErrorToNSError(_:)();

  sub_1DE2170E0(v72, sel_finishWithError_);
  v53 = v51;
  sub_1DE221F84();

  (*(void (**)(char *, uint64_t))(v69 + 8))(v63, v58);
  sub_1DE2041DC();
}

void sub_1DE21D158()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  int64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)();
  uint64_t v45;
  unint64_t v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  _QWORD *v52;

  sub_1DE216FF0();
  v52 = v0;
  v3 = *MEMORY[0x1E0DEEDD8] & *v0;
  v4 = *(_QWORD *)(v3 + 88);
  v5 = *(_QWORD *)(v4 - 8);
  sub_1DE221D44();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v38 - v7;
  type metadata accessor for Optional();
  sub_1DE221EE8();
  MEMORY[0x1E0C80A78](v9);
  sub_1DE204214();
  v12 = v10 - v11;
  MEMORY[0x1E0C80A78](v13);
  v47 = (char *)&v38 - v14;
  sub_1DE21712C();
  MEMORY[0x1E0C80A78](v15);
  v17 = (uint64_t)&v38 - v16;
  v50 = *(_QWORD *)(sub_1DE2171A8() - 8);
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v18);
  sub_1DE204214();
  v21 = v19 - v20;
  v23 = (char *)MEMORY[0x1E0C80A78](v22);
  v26 = (uint64_t *)((char *)&v38 - v25);
  if (v24 >> 62)
  {
LABEL_18:
    v40 = v23;
    v41 = v3;
    v51 = v24;
    swift_bridgeObjectRetain();
    v3 = v41;
    v48 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    v27 = v48;
    v23 = v40;
    v24 = v51;
    if (!v48)
      goto LABEL_16;
  }
  else
  {
    v27 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v27)
      goto LABEL_16;
  }
  v40 = v23;
  v41 = v3;
  v38 = v8;
  v39 = v5;
  v42 = v12;
  v43 = v17;
  v44 = v2;
  v45 = v1;
  v46 = v4;
  v48 = v27;
  v49 = v24 & 0xC000000000000001;
  v51 = v24;
  swift_bridgeObjectRetain();
  v1 = 0;
  v12 = MEMORY[0x1E0DEE9D8];
  v17 = 4;
  v2 = type metadata accessor for Ckcode_RecordTransport;
  do
  {
    v3 = v17 - 4;
    if (v49)
      v23 = (char *)MEMORY[0x1DF0EA080](v17 - 4, v51);
    else
      v23 = (char *)*(id *)(v51 + 8 * v17);
    v8 = v23;
    v5 = v17 - 3;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_18;
    }
    sub_1DE21D550(v23);
    v28 = v8;
    Ckcode_RecordTransport.init(_:)(v28, v26);
    sub_1DE2008C4((uint64_t)v26, v21, (uint64_t (*)(_QWORD))type metadata accessor for Ckcode_RecordTransport);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v32 = sub_1DE2170E8();
      v12 = sub_1DE2157CC(v32, v33, v34, v12);
    }
    v4 = *(_QWORD *)(v12 + 16);
    v29 = *(_QWORD *)(v12 + 24);
    if (v4 >= v29 >> 1)
      v12 = sub_1DE2157CC(v29 > 1, v4 + 1, 1, v12);
    *(_QWORD *)(v12 + 16) = v4 + 1;
    sub_1DE2172A8();
    sub_1DE202628(v21, v12 + v30 + *(_QWORD *)(v31 + 72) * v4, (uint64_t (*)(_QWORD))type metadata accessor for Ckcode_RecordTransport);

    sub_1DE2005D4((uint64_t)v26, (uint64_t (*)(_QWORD))type metadata accessor for Ckcode_RecordTransport);
    ++v17;
  }
  while (v5 != v48);
  swift_bridgeObjectRelease();
  v35 = (uint64_t)v47;
  sub_1DE219BC4();
  v36 = v46;
  if (!_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v35, 1, v46))
  {
    sub_1DE221EA0((uint64_t)v38, v35, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 16));
    sub_1DE217114();
    sub_1DE2025EC(&qword_1EDB82278, (uint64_t (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport, (uint64_t)&protocol conformance descriptor for Ckcode_RecordTransport);
    Message.substituteMessages<A>(substitutionType:substitutions:)();
  }
  sub_1DE2173E4();
  sub_1DE217114();
  v37 = v43;
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v43, 1, 1, v36);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v42, v37, v35);
  sub_1DE20EF4C();
  ((void (*)(uint64_t, uint64_t))v4)(v37, v35);
LABEL_16:
  sub_1DE2041DC();
}

void sub_1DE21D550(void *a1)
{
  void *v1;
  uint64_t v2;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  void *v40;
  unsigned int v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  Swift::String v47;
  void *v48;
  int64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  int64_t v54;
  uint64_t v55;
  id v56;
  int64_t v57;
  void *v58;
  id v59[5];

  v59[4] = *(id *)MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1, sel_recordID);
  v56 = v1;
  sub_1DE21A9EC();
  v5 = (void *)sub_1DE204208();
  v7 = sub_1DE21A938(v5, v6);

  swift_bridgeObjectRelease();
  if (!v7)
    return;
  v8 = 0;
  v9 = v7 + 64;
  v10 = 1 << *(_BYTE *)(v7 + 32);
  if (v10 < 64)
    v11 = ~(-1 << v10);
  else
    v11 = -1;
  v12 = v11 & *(_QWORD *)(v7 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  v51 = a1;
  v52 = v2;
  v55 = v7;
  v49 = v13;
  v50 = v7 + 64;
  if (!v12)
    goto LABEL_7;
LABEL_6:
  v53 = (v12 - 1) & v12;
  v54 = v8;
  for (i = __clz(__rbit64(v12)) | (v8 << 6); ; i = __clz(__rbit64(v16)) + (v17 << 6))
  {
    v19 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * i);
    v20 = *v19;
    v21 = (void *)v19[1];
    v22 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v23 = CKRecord.subscript.getter();
    v24 = *(_QWORD *)(v22 + 64);
    v25 = 1 << *(_BYTE *)(v22 + 32);
    if (v25 < 64)
      v26 = ~(-1 << v25);
    else
      v26 = -1;
    v57 = (unint64_t)(v25 + 63) >> 6;
    if ((v26 & v24) != 0)
    {
      v27 = __clz(__rbit64(v26 & v24));
      goto LABEL_39;
    }
    if ((unint64_t)(v25 + 63) >> 6 > 1)
    {
      v28 = *(_QWORD *)(v22 + 72);
      v29 = 1;
      if (v28)
        goto LABEL_38;
      v29 = 2;
      if (v57 > 2)
      {
        v28 = *(_QWORD *)(v22 + 80);
        if (v28)
          goto LABEL_38;
        v29 = 3;
        if (v57 > 3)
        {
          v28 = *(_QWORD *)(v22 + 88);
          if (v28)
            goto LABEL_38;
          v30 = 4;
          if (v57 > 4)
            break;
        }
      }
    }
LABEL_50:
    sub_1DE217294();
    sub_1DE217378();
    sub_1DE2172F0();
    v7 = v55;
    v13 = v49;
    v9 = v50;
    v12 = v53;
    v8 = v54;
    if (v53)
      goto LABEL_6;
LABEL_7:
    v15 = v8 + 1;
    if (__OFADD__(v8, 1))
      goto LABEL_60;
    if (v15 >= v13)
    {
LABEL_58:
      swift_release();
      return;
    }
    v16 = *(_QWORD *)(v9 + 8 * v15);
    v17 = v8 + 1;
    if (!v16)
    {
      v17 = v8 + 2;
      if (v8 + 2 >= v13)
        goto LABEL_58;
      v16 = *(_QWORD *)(v9 + 8 * v17);
      if (!v16)
      {
        v17 = v8 + 3;
        if (v8 + 3 >= v13)
          goto LABEL_58;
        v16 = *(_QWORD *)(v9 + 8 * v17);
        if (!v16)
        {
          v18 = v8 + 4;
          if (v8 + 4 >= v13)
            goto LABEL_58;
          v16 = *(_QWORD *)(v9 + 8 * v18);
          if (!v16)
          {
            while (1)
            {
              v17 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_61;
              if (v17 >= v13)
                goto LABEL_58;
              v16 = *(_QWORD *)(v9 + 8 * v17);
              ++v18;
              if (v16)
                goto LABEL_20;
            }
          }
          v17 = v8 + 4;
        }
      }
    }
LABEL_20:
    v53 = (v16 - 1) & v16;
    v54 = v17;
  }
  v28 = *(_QWORD *)(v22 + 96);
  if (!v28)
  {
    while (1)
    {
      v29 = v30 + 1;
      if (__OFADD__(v30, 1))
        break;
      if (v29 >= v57)
        goto LABEL_50;
      v28 = *(_QWORD *)(v22 + 64 + 8 * v29);
      ++v30;
      if (v28)
        goto LABEL_38;
    }
    __break(1u);
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
    JUMPOUT(0x1DE21DC64);
  }
  v29 = 4;
LABEL_38:
  v27 = __clz(__rbit64(v28)) + (v29 << 6);
LABEL_39:
  v31 = *(void **)(*(_QWORD *)(v22 + 56) + 8 * v27);
  if (!v23)
    goto LABEL_52;
  v32 = *(_QWORD *)(*(_QWORD *)(v22 + 48) + 8 * v27);
  objc_opt_self();
  v33 = sub_1DE21748C();
  if (v33)
  {
    v34 = (void *)v33;
    v35 = v31;
    swift_unknownObjectRetain();
    if (v32 < 0 || v32 >= (uint64_t)objc_msgSend(v34, sel_count))
    {
      sub_1DE2172F0();
      related decl 'e' for CKErrorCode.init(_:description:)();
      swift_willThrow();
      sub_1DE21746C();
      sub_1DE217378();

      swift_unknownObjectRelease_n();
      return;
    }
    v36 = objc_msgSend(v34, sel_objectAtIndexedSubscript_, v32);
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_1DE217294();
    sub_1DE209038(0, (unint64_t *)&qword_1F04387D8);
    swift_dynamicCast();
    v37 = v58;
    goto LABEL_46;
  }
  objc_opt_self();
  v38 = sub_1DE21748C();
  if (!v38)
  {
LABEL_52:
    v46 = v31;
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    v59[0] = (id)0xD00000000000002CLL;
    v59[1] = (id)0x80000001DE22B3F0;
    v47._countAndFlagsBits = v20;
    v47._object = v21;
    String.append(_:)(v47);
    swift_bridgeObjectRelease();
    related decl 'e' for CKErrorCode.init(_:description:)();
    swift_willThrow();
    sub_1DE21746C();
    sub_1DE217378();
    sub_1DE217294();

    return;
  }
  v37 = (id)v38;
  swift_unknownObjectRetain_n();
  v39 = v31;
LABEL_46:
  if (*MEMORY[0x1E0C95280]
    && (v40 = (void *)MEMORY[0x1DF0E9E7C](0xD000000000000018, 0x80000001DE22B420),
        v41 = objc_msgSend(v56, sel__BOOLForUnitTestOverride_defaultValue_, v40, 0),
        v40,
        v41))
  {
    sub_1DE2172F0();
    objc_msgSend(v37, sel_setAssetContent_, 0);
    type metadata accessor for CKError(0);
    sub_1DE21FDF0(MEMORY[0x1E0DEE9D8]);
    sub_1DE2025EC((unint64_t *)&unk_1F0438CA0, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1DE226A90);
    _BridgedStoredNSError.init(_:userInfo:)();
  }
  else
  {
    v59[0] = 0;
    v42 = objc_msgSend(v31, sel_assetContentWithExpectedSignature_verificationKey_error_, 0, 0, v59, v49, v50, v51, v52);
    v43 = v59[0];
    if (v42)
    {
      static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v45 = v44;

      __asm { BR              X9 }
    }
    v48 = v43;
    sub_1DE2172F0();
    _convertNSErrorToError(_:)();

  }
  swift_willThrow();
  sub_1DE21746C();
  sub_1DE217378();
  sub_1DE217294();

}

void sub_1DE21DC7C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, _QWORD);
  void (*v15)(uint64_t, void *, _QWORD);
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  id v24;
  id v25;
  Swift::String v26;
  void *v27;
  id v28;
  char v29;
  char v30;
  id v31;
  id v32;
  _QWORD *v33;

  sub_1DE216FF0();
  v3 = v0;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  type metadata accessor for Logger();
  sub_1DE221EE8();
  MEMORY[0x1E0C80A78](v10);
  sub_1DE2042FC();
  v13 = v12 - v11;
  if (v9)
  {
    sub_1DE21AE04();
    if (!v14)
    {
      v25 = v9;
      sub_1DE221DF8();
      goto LABEL_13;
    }
    v15 = v14;
    v16 = v9;
    v17 = (uint64_t)v16;
    if (v7)
    {
      v18 = (uint64_t)v16;
      v19 = v7;
      sub_1DE21D550(v19);

      v17 = v18;
      if (!v5)
      {
        v32 = v19;
        v15(v18, v7, 0);
        sub_1DE204AEC((uint64_t)v15);

LABEL_13:
        sub_1DE2107EC();
        if ((v29 & 1) != 0)
        {
          sub_1DE21B178();
          if ((v30 & 1) != 0)
          {
            sub_1DE216F58();
            v31 = v9;
            type metadata accessor for CKCodeOperation.AssetInfo();
          }
        }
        if (v5)
          sub_1DE219EBC(v5);

        goto LABEL_19;
      }
    }
    else if (!v5)
    {
      _StringGuts.grow(_:)(67);
      v26._object = (void *)0x80000001DE22B6C0;
      v26._countAndFlagsBits = 0xD00000000000003DLL;
      String.append(_:)(v26);
      sub_1DE221D7C();
    }
    sub_1DE221DF8();
    sub_1DE221DF8();
    v27 = (void *)_convertErrorToNSError(_:)();
    sub_1DE221EE0();
    v28 = objc_msgSend(v27, sel_CKClientSuitableError);
    sub_1DE221ED4(v17, (uint64_t)v28);

    sub_1DE204AEC((uint64_t)v15);
    goto LABEL_13;
  }
  CKLog.getter();
  v20 = v3;
  v21 = Logger.logObject.getter();
  v22 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)sub_1DE208880();
    v33 = (_QWORD *)sub_1DE208880();
    *(_DWORD *)v23 = 138412290;
    v24 = v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v33 = v20;

    sub_1DE2089AC(&dword_1DE1FE000, v21, v22, "Ignoring handleFetch with nil recordID %@", v23);
    sub_1DE1FFE88(qword_1EDB81DB0);
    sub_1DE208930();
    sub_1DE208874();
  }

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v13, v1);
LABEL_19:
  sub_1DE2041DC();
}

void sub_1DE21E090(uint64_t a1, double a2)
{
  void (*v4)(uint64_t, double);
  uint64_t v5;

  sub_1DE21038C();
  if (v4)
  {
    v4(a1, a2);
    v5 = sub_1DE204208();
    sub_1DE204AEC(v5);
  }
}

void sub_1DE21E0F4()
{
  sub_1DE216F58();
  sub_1DE21716C();
  type metadata accessor for CKCodeOperation.AssetInfo();
}

void sub_1DE21E168()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  Class isa;

  sub_1DE21A330(v4, v3, v2, v1);
  v6 = v5;
  swift_endAccess();
  sub_1DE21729C();
  isa = Data._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v6, sel_writeData_atOffset_, isa, v0);

}

void sub_1DE21E1D8()
{
  _QWORD *v0;
  void *v1;
  void *v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _QWORD *v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint8_t *v25;
  _QWORD *v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  char *v34;
  _QWORD *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t, uint64_t);
  _QWORD v52[2];
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  _QWORD *v62;
  uint64_t v63;
  _QWORD *v64;

  sub_1DE216FF0();
  v2 = v1;
  v3 = *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58);
  sub_1DE2094A0(qword_1EDB81D00);
  v4 = type metadata accessor for Result();
  v5 = *(_QWORD *)(v4 - 8);
  sub_1DE221D44();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v52 - v7;
  v9 = type metadata accessor for Optional();
  v53 = *(_QWORD *)(v9 - 8);
  v54 = v9;
  sub_1DE221D44();
  MEMORY[0x1E0C80A78](v10);
  v57 = (char *)v52 - v11;
  v56 = *(_QWORD *)(v3 - 8);
  sub_1DE221D44();
  MEMORY[0x1E0C80A78](v12);
  v55 = (uint64_t)v52 - v13;
  v14 = type metadata accessor for Logger();
  v62 = *(_QWORD **)(v14 - 8);
  v63 = v14;
  sub_1DE217008();
  MEMORY[0x1E0C80A78](v15);
  sub_1DE217084();
  v61 = v16;
  sub_1DE21712C();
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)v52 - v18;
  CKLog.getter();
  v20 = v0;
  v21 = Logger.logObject.getter();
  v22 = static os_log_type_t.info.getter();
  v23 = os_log_type_enabled(v21, v22);
  v59 = v8;
  v60 = v5;
  v58 = v3;
  if (v23)
  {
    v24 = sub_1DE208880();
    v52[1] = v2;
    v25 = (uint8_t *)v24;
    v52[0] = sub_1DE208880();
    *(_DWORD *)v25 = 138412290;
    v64 = v20;
    v26 = v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_QWORD *)v52[0] = v20;

    sub_1DE2089AC(&dword_1DE1FE000, v21, v22, "In CKCodeOperation._finishOnCallbackQueueWithError() for %@", v25);
    sub_1DE1FFE88(qword_1EDB81DB0);
    sub_1DE208930();
    sub_1DE208874();
  }

  v27 = v63;
  v28 = (void (*)(char *, uint64_t))v62[1];
  v28(v19, v63);
  sub_1DE21053C();
  if (v29)
  {
    if (v2 || (sub_1DE219E80(), v30))
    {
      v31 = v2;
      sub_1DE221DF8();
      v32 = (void *)_convertErrorToNSError(_:)();
      sub_1DE221EE0();
      v33 = objc_msgSend(v32, sel_CKClientSuitableError);
      v34 = v59;
      sub_1DE221DE4((uint64_t)v33);
      sub_1DE221DCC();
      sub_1DE221D98();

      sub_1DE221EE0();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v34, v4);
    }
    else
    {
      v40 = (uint64_t)v57;
      sub_1DE219BC4();
      v41 = v58;
      v42 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v40, 1, v58);
      v43 = (uint64_t)v59;
      v44 = v60;
      if (v42 == 1)
      {
        (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v40, v54);
        v45 = related decl 'e' for CKErrorCode.init(_:description:)();
        sub_1DE221DE4(v45);
        sub_1DE221DCC();
        sub_1DE221D98();
        sub_1DE221D90(v43, *(uint64_t (**)(uint64_t, uint64_t))(v44 + 8));
        v2 = 0;
      }
      else
      {
        v46 = v40;
        v47 = v55;
        v48 = v56;
        sub_1DE221EA0(v55, v46, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v56 + 32));
        v49 = sub_1DE217440();
        sub_1DE221EA0(v49, v50, v51);
        swift_storeEnumTagMultiPayload();
        sub_1DE221DCC();
        sub_1DE221D98();
        sub_1DE221D90(v43, *(uint64_t (**)(uint64_t, uint64_t))(v60 + 8));
        (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v41);
      }
    }
  }
  else
  {
    CKLog.getter();
    v62 = v20;
    v35 = v20;
    v36 = Logger.logObject.getter();
    v37 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)sub_1DE208880();
      v60 = sub_1DE208880();
      *(_DWORD *)v38 = 138412290;
      v64 = v35;
      v39 = v35;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_QWORD *)v60 = v35;

      sub_1DE2089AC(&dword_1DE1FE000, v36, v37, "In CKCodeOperation._finishOnCallbackQueueWithError(), no result block set for %@", v38);
      sub_1DE1FFE88(qword_1EDB81DB0);
      sub_1DE208930();
      sub_1DE208874();
    }

    v28(v61, v27);
    v20 = v62;
  }
  sub_1DE21E6C8((uint64_t)v20, (uint64_t)v2);
}

void sub_1DE21E6C8(uint64_t a1, uint64_t a2)
{
  if (a2)
    _convertErrorToNSError(_:)();
  type metadata accessor for CKCodeOperation();
}

void sub_1DE21E720(objc_class *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, objc_super a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = v19;
  v21.super_class = a1;
  -[objc_class _finishOnCallbackQueueWithError:](&v21, sel__finishOnCallbackQueueWithError_, v20);

}

void sub_1DE21E750(void *a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a1;
  a3;
  sub_1DE21E1D8();
}

void sub_1DE21E77C()
{
  void *v0;
  void *v1;

}

void sub_1DE21E794(_OWORD *a1@<X8>)
{
  uint64_t v2;

  sub_1DE21A2F8();
  if (v2)
  {
    sub_1DE21716C();
    type metadata accessor for CKCodeOperation.CallbackRelay();
  }
  *a1 = 0u;
  a1[1] = 0u;
  sub_1DE216F80();
}

id sub_1DE21E7F4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  __int128 v7;
  uint64_t v8;

  sub_1DE21E794(&v7);
  v0 = v8;
  if (!v8)
    return 0;
  v1 = sub_1DE2084DC(&v7, v8);
  v2 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v2 + 16))(v4);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v0);
  sub_1DE20585C((uint64_t)&v7);
  return v5;
}

void sub_1DE21E8C0()
{
  JUMPOUT(0x1DF0EA71CLL);
}

void sub_1DE21E8D0()
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  type metadata accessor for CKCodeOperation.CallbackRelay();
}

id sub_1DE21E92C(objc_class *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, objc_super a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  void *v19;
  void *v20;
  id v21;
  objc_super v23;

  v23.receiver = v20;
  v23.super_class = a1;
  v21 = -[objc_class init](&v23, sel_init);

  return v21;
}

uint64_t sub_1DE21E960()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = v0;
  return swift_task_switch();
}

void sub_1DE21E978()
{
  sub_1DE21E8C0();
}

uint64_t sub_1DE21E994(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  *(_QWORD *)(v1 + 128) = result;
  if (result)
  {
    v2 = sub_1DE217308((uint64_t)sub_1DE21E9FC);
    *(_QWORD *)(v1 + 80) = MEMORY[0x1E0C809B0];
    v3 = (_QWORD *)(v1 + 80);
    v3[1] = 0x40000000;
    v3[2] = sub_1DE2196D0;
    v3[3] = &unk_1EA8C8780;
    v3[4] = v2;
    sub_1DE21750C(v2, sel_handleWillStart_);
    return sub_1DE21717C();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DE21E9FC()
{
  sub_1DE2171C0();
  return sub_1DE20A4A4();
}

uint64_t sub_1DE21EA3C(void *a1, int a2, void *aBlock)
{
  return sub_1DE21EBCC(a1, a2, aBlock);
}

uint64_t sub_1DE21EA50(const void *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_1DE221C8C;
  return sub_1DE21E960();
}

uint64_t sub_1DE21EAB0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = v0;
  return swift_task_switch();
}

void sub_1DE21EAC8()
{
  sub_1DE21E8C0();
}

uint64_t sub_1DE21EAE4(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  *(_QWORD *)(v1 + 128) = result;
  if (result)
  {
    v2 = sub_1DE217308((uint64_t)sub_1DE21EB4C);
    *(_QWORD *)(v1 + 80) = MEMORY[0x1E0C809B0];
    v3 = (_QWORD *)(v1 + 80);
    v3[1] = 0x40000000;
    v3[2] = sub_1DE2196D0;
    v3[3] = &unk_1EA8CA490;
    v3[4] = v2;
    sub_1DE21750C(v2, sel_handleDidStart_);
    return sub_1DE21717C();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DE21EB4C()
{
  sub_1DE2171C0();
  return sub_1DE20A4A4();
}

uint64_t sub_1DE21EB8C()
{
  uint64_t v0;

  return sub_1DE2061B4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1DE21EBB8(void *a1, int a2, void *aBlock)
{
  return sub_1DE21EBCC(a1, a2, aBlock);
}

uint64_t sub_1DE21EBCC(void *a1, int a2, void *aBlock)
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  _Block_copy(aBlock);
  sub_1DE221EBC();
  v5 = sub_1DE2090B0();
  *(_QWORD *)(v5 + 16) = v3;
  *(_QWORD *)(v5 + 24) = a1;
  v6 = a1;
  v7 = sub_1DE204208();
  return sub_1DE219760(v7, v8);
}

uint64_t sub_1DE21EC1C(const void *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_1DE21EC7C;
  return sub_1DE21EAB0();
}

uint64_t sub_1DE21EC7C()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void (*v6)(uint64_t);

  v2 = *(void **)(*v1 + 16);
  v3 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v4 = (void *)_convertErrorToNSError(_:)();

    v5 = sub_1DE221E30();
    v6(v5);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v3 + 24) + 16))(*(_QWORD *)(v3 + 24), 0);
  }
  _Block_release(*(const void **)(v3 + 24));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

void sub_1DE21ED18()
{
  sub_1DE21F1E8();
}

void sub_1DE21ED24(void *a1)
{
  a1;
  sub_1DE21ED18();
}

void sub_1DE21ED44()
{
  void *v0;

}

void sub_1DE21ED58()
{
  sub_1DE21EDC4();
}

void sub_1DE21ED64(void *a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  a1;
  sub_1DE21ED58();
}

void sub_1DE21ED9C()
{
  void *v0;
  void *v1;

}

void sub_1DE21EDB8()
{
  sub_1DE21EDC4();
}

void sub_1DE21EDC4()
{
  sub_1DE21E8C0();
}

void sub_1DE21EDE4(void *a1)
{
  SEL *v1;

  if (a1)
  {
    sub_1DE217264(a1, *v1);
    sub_1DE221D10(a1);
  }
  else
  {
    __break(1u);
  }
}

void sub_1DE21EE04(void *a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  a1;
  sub_1DE21EDB8();
}

void sub_1DE21EE3C()
{
  void *v0;
  void *v1;

}

void sub_1DE21EE58()
{
  sub_1DE21EEAC();
}

void sub_1DE21EE74(void *a1, int a2, void *a3, void *a4)
{
  sub_1DE21EF88(a1, a2, a3, a4, (uint64_t)&unk_1EA8CA5A8, (uint64_t)sub_1DE216C80, (void (*)(id, uint64_t, uint64_t))sub_1DE21EE58);
}

void sub_1DE21EE90()
{
  sub_1DE21EEAC();
}

void sub_1DE21EEAC()
{
  sub_1DE21E8C0();
}

void sub_1DE21EEE4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  SEL *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;
  _QWORD v32[16];

  if (a1)
  {
    v32[4] = v29;
    v32[5] = v26;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 1107296256;
    v32[2] = v28;
    v32[3] = v27;
    v31 = _Block_copy(v32);
    swift_retain();
    swift_release();
    objc_msgSend(a1, *v24, v25, v31);
    _Block_release(v31);

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE21EF6C(void *a1, int a2, void *a3, void *a4)
{
  sub_1DE21EF88(a1, a2, a3, a4, (uint64_t)&unk_1EA8CA580, (uint64_t)sub_1DE216C78, (void (*)(id, uint64_t, uint64_t))sub_1DE21EE90);
}

void sub_1DE21EF88(void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(id, uint64_t, uint64_t))
{
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v11 = _Block_copy(aBlock);
  v12 = sub_1DE2090B0();
  *(_QWORD *)(v12 + 16) = v11;
  v13 = a3;
  v14 = a1;
  a7(v13, a6, v12);
  JUMPOUT(0x1DE21EFF4);
}

void sub_1DE21F014()
{
  sub_1DE21E8C0();
}

void sub_1DE21F034(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    if (v2)
      v4 = _convertErrorToNSError(_:)();
    else
      v4 = 0;
    v5 = (void *)v4;
    objc_msgSend(a1, sel_handleOperationDidCompleteWithMetrics_error_, v1);

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE21F08C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;

  v6 = a3;
  a1;
  a4;
  sub_1DE21F014();
}

void sub_1DE21F0D4()
{
  void *v0;
  void *v1;
  void *v2;

}

void sub_1DE21F0F4()
{
  sub_1DE21E8C0();
}

void sub_1DE21F11C(void *a1)
{
  char v1;
  char v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    if (v3)
      v5 = _convertErrorToNSError(_:)();
    else
      v5 = 0;
    v6 = (void *)v5;
    objc_msgSend(a1, sel_handleDiscretionaryOperationShouldStart_nonDiscretionary_error_, v2 & 1, v1 & 1);

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE21F17C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a1;
  a5;
  sub_1DE21F0F4();
}

void sub_1DE21F1C0()
{
  void *v0;
  void *v1;

}

void sub_1DE21F1DC()
{
  sub_1DE21F1E8();
}

void sub_1DE21F1E8()
{
  sub_1DE21E8C0();
}

void sub_1DE21F200(void *a1)
{
  SEL *v1;

  if (a1)
  {
    objc_msgSend(a1, *v1);
    sub_1DE217150(a1);
  }
  else
  {
    __break(1u);
  }
}

void sub_1DE21F220(void *a1)
{
  a1;
  sub_1DE21F1DC();
}

void sub_1DE21F240()
{
  void *v0;

}

void sub_1DE21F254()
{
  sub_1DE21E8C0();
}

void sub_1DE21F288(void *a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  _QWORD v9[16];

  if (a1)
  {
    v7 = (void *)MEMORY[0x1DF0E9E7C](v5, v4);
    v9[4] = v3;
    v9[5] = v2;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 1107296256;
    v9[2] = sub_1DE219A68;
    v9[3] = &unk_1EA8C86F0;
    v8 = _Block_copy(v9);
    swift_retain();
    swift_release();
    objc_msgSend(a1, sel_handleDaemonOperationWillStartWithClassName_isTopLevelDaemonOperation_replyBlock_, v7, v1 & 1, v8);
    _Block_release(v8);

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE21F33C(void *a1, int a2, int a3, int a4, void *aBlock)
{
  void *v6;
  id v7;

  v6 = _Block_copy(aBlock);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v7 = a1;
  sub_1DE21F254();
}

uint64_t sub_1DE21F3BC()
{
  void *v0;

  swift_bridgeObjectRelease();
  return swift_release();
}

void sub_1DE21F3E0()
{
  sub_1DE21F424();
}

void sub_1DE21F3F4(void *a1, int a2, int a3, void *a4, void *a5)
{
  sub_1DE21F52C(a1, a2, a3, a4, a5, (uint64_t)&unk_1EA8CA530, (uint64_t)sub_1DE221C34, (void (*)(uint64_t, uint64_t, id, uint64_t, uint64_t))sub_1DE21F3E0);
}

void sub_1DE21F410()
{
  sub_1DE21F424();
}

void sub_1DE21F424()
{
  sub_1DE21E8C0();
}

void sub_1DE21F464(void *a1)
{
  uint64_t v1;
  SEL *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;
  _QWORD v11[18];

  if (a1)
  {
    v9 = (void *)MEMORY[0x1DF0E9E7C](v7, v6);
    v11[4] = v5;
    v11[5] = v3;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 1107296256;
    v11[2] = sub_1DE219A68;
    v11[3] = v4;
    v10 = _Block_copy(v11);
    swift_retain();
    swift_release();
    objc_msgSend(a1, *v2, v9, v1, v10);
    _Block_release(v10);

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE21F510(void *a1, int a2, int a3, void *a4, void *a5)
{
  sub_1DE21F52C(a1, a2, a3, a4, a5, (uint64_t)&unk_1EA8CA508, (uint64_t)sub_1DE221C34, (void (*)(uint64_t, uint64_t, id, uint64_t, uint64_t))sub_1DE21F410);
}

void sub_1DE21F52C(void *a1, int a2, int a3, void *a4, void *aBlock, uint64_t a6, uint64_t a7, void (*a8)(uint64_t, uint64_t, id, uint64_t, uint64_t))
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;

  v12 = _Block_copy(aBlock);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = v14;
  v16 = sub_1DE2090B0();
  *(_QWORD *)(v16 + 16) = v12;
  v17 = a4;
  v18 = a1;
  a8(v13, v15, v17, a7, v16);
  JUMPOUT(0x1DE21F5B8);
}

void sub_1DE21F5E0()
{
  sub_1DE21E8C0();
}

void sub_1DE21F610(void *a1)
{
  if (a1)
  {
    sub_1DE21C6A4();

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE21F658(void *a1, int a2, int a3, int a4, int a5, void *aBlock)
{
  void *v7;
  id v8;

  v7 = _Block_copy(aBlock);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(swift_allocObject() + 16) = v7;
  v8 = a1;
  sub_1DE21F5E0();
}

uint64_t sub_1DE21F70C()
{
  void *v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

void sub_1DE21F744()
{
  sub_1DE21E8C0();
}

void sub_1DE21F770(void *a1)
{
  if (a1)
  {
    sub_1DE21CC04();

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE21F7B4(void *a1, int a2, void *a3, void *aBlock)
{
  void *v6;
  id v7;

  v6 = _Block_copy(aBlock);
  v7 = a3;
  a1;
  static Data._unconditionallyBridgeFromObjectiveC(_:)();

  *(_QWORD *)(swift_allocObject() + 16) = v6;
  sub_1DE21F744();
}

void sub_1DE21F83C()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;

  swift_release();
  sub_1DE1FFC54(v0, v1);

}

void sub_1DE21F86C()
{
  sub_1DE21E8C0();
}

void sub_1DE21F884(void *a1)
{
  if (a1)
  {
    sub_1DE21D158();

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE21F8B4(void *a1)
{
  id v2;

  sub_1DE209038(0, &qword_1F0438C60);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v2 = a1;
  sub_1DE21F86C();
}

uint64_t sub_1DE21F900()
{
  void *v0;

  return swift_bridgeObjectRelease();
}

void sub_1DE21F914()
{
  sub_1DE21E8C0();
}

void sub_1DE21F938(void *a1)
{
  if (a1)
  {
    sub_1DE21DC7C();

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE21F974(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;

  v8 = a3;
  v9 = a4;
  a1;
  a5;
  sub_1DE21F914();
}

void sub_1DE21F9D0()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

}

void sub_1DE21F9F8()
{
  sub_1DE21E8C0();
}

void sub_1DE21FA18(void *a1)
{
  uint64_t v1;
  double v2;

  if (a1)
  {
    sub_1DE21E090(v1, v2);

  }
  else
  {
    __break(1u);
  }
}

void sub_1DE21FA50(void *a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  a1;
  sub_1DE21F9F8();
}

void sub_1DE21FA94()
{
  void *v0;
  void *v1;

}

void sub_1DE21FAB4()
{
  sub_1DE21E8C0();
}

void sub_1DE21FAF0(uint64_t a1)
{
  if (a1)
    sub_1DE21E0F4();
  __break(1u);
}

void sub_1DE21FB44(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  id v10;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = a3;
  v10 = a6;
  a1;
  static Data._unconditionallyBridgeFromObjectiveC(_:)();

  sub_1DE21FAB4();
}

uint64_t sub_1DE21FBD4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;

  sub_1DE1FFC54(v2, v3);

  return swift_bridgeObjectRelease();
}

void sub_1DE21FC08()
{
  sub_1DE21538C();
}

id sub_1DE21FC28()
{
  return sub_1DE215458();
}

uint64_t sub_1DE21FC34()
{
  return swift_unknownObjectWeakDestroy();
}

id CKCodeOperation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CKCodeOperation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1DE21FC90()
{
  CKCodeOperation.init()();
}

id CKCodeOperation.__deallocating_deinit()
{
  return sub_1DE215458();
}

uint64_t sub_1DE21FCA8(uint64_t a1)
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

  v2 = sub_1DE217320();
  sub_1DE221DB8(v2);
  sub_1DE221CCC();
  v3 = sub_1DE217320();
  sub_1DE221DB8(v3);
  sub_1DE221CCC();
  swift_bridgeObjectRelease();
  sub_1DE221CCC();

  sub_1DE221CCC();
  sub_1DE217438();
  sub_1DE221CCC();
  sub_1DE217438();
  sub_1DE221CCC();

  sub_1DE221CCC();
  sub_1DE20FEAC(*(_QWORD *)(a1 + *(_QWORD *)(v6 + 168)), *(_QWORD *)(a1 + *(_QWORD *)(v6 + 168) + 8), *(_QWORD *)(a1 + *(_QWORD *)(v6 + 168) + 16), *(_QWORD *)(a1 + *(_QWORD *)(v6 + 168) + 24), *(_BYTE *)(a1 + *(_QWORD *)(v6 + 168) + 32));
  sub_1DE221CCC();

  sub_1DE221CCC();
  sub_1DE217438();
  sub_1DE221CCC();
  sub_1DE204AEC(*(_QWORD *)(a1 + *(_QWORD *)(v8 + 200)));
  sub_1DE221CCC();
  sub_1DE204AEC(*(_QWORD *)(a1 + *(_QWORD *)(v9 + 208)));
  sub_1DE221CCC();
  sub_1DE204AEC(*(_QWORD *)(a1 + *(_QWORD *)(v10 + 216)));
  sub_1DE221CCC();
  sub_1DE204AEC(*(_QWORD *)(a1 + *(_QWORD *)(v11 + 240)));
  sub_1DE221CCC();
  return sub_1DE204AEC(*(_QWORD *)(a1 + *(_QWORD *)(v12 + 248)));
}

unint64_t sub_1DE21FDF0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  sub_1DE1FFE88(&qword_1F0438FC0);
  v2 = static _DictionaryStorage.allocate(capacity:)();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1DE203ED0(v6, (uint64_t)&v15, &qword_1F0438FC8);
    v7 = v15;
    v8 = v16;
    result = sub_1DE220F78(v15, v16, (uint64_t (*)(uint64_t))sub_1DE21FF38);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1DE221978(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1DE21FF38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_1DE22007C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1DE221C3C;
  return v6();
}

uint64_t sub_1DE2200D0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1DE221C3C;
  return v7();
}

uint64_t sub_1DE220124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for TaskPriority();
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(a1, 1, v6) == 1)
  {
    sub_1DE203EA8(a1, &qword_1F0438F50);
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
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1DE220268(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1DE2202CC;
  return v6(a1);
}

uint64_t sub_1DE2202CC()
{
  uint64_t v0;

  sub_1DE221CDC();
  return sub_1DE2061B4(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1DE2202F4()
{
  sub_1DE219B7C();
  sub_1DE20425C();
}

void sub_1DE22031C()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1DE221F3C();
  sub_1DE219CFC();
  *v0 = v1;
  sub_1DE20425C();
}

void sub_1DE220368()
{
  _BYTE *v0;
  char v1;

  sub_1DE221F3C();
  sub_1DE21A284();
  *v0 = v1 & 1;
  sub_1DE20425C();
}

void sub_1DE22038C(char *a1)
{
  sub_1DE21A2BC(*a1);
  sub_1DE20425C();
}

void sub_1DE2203E4()
{
  _BYTE *v0;
  char v1;

  sub_1DE221F3C();
  sub_1DE21B178();
  *v0 = v1 & 1;
  sub_1DE20425C();
}

void sub_1DE220408(char *a1)
{
  sub_1DE21B1B0(*a1);
  sub_1DE20425C();
}

void sub_1DE220430()
{
  _BYTE *v0;
  char v1;

  sub_1DE221F3C();
  sub_1DE2107EC();
  *v0 = v1 & 1;
  sub_1DE20425C();
}

void sub_1DE220454(char *a1)
{
  sub_1DE21B234(*a1);
  sub_1DE20425C();
}

uint64_t sub_1DE22049C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for Optional();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for Optional();
    if (v2 <= 0x3F)
      return swift_initClassMetadata2();
  }
  return result;
}

uint64_t method lookup function for CKCodeOperation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CKCodeOperation.request.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of CKCodeOperation.request.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of CKCodeOperation.request.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of CKCodeOperation.codeService.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of CKCodeOperation.codeService.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of CKCodeOperation.codeService.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of CKCodeOperation.dataProtectionType.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of CKCodeOperation.dataProtectionType.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of CKCodeOperation.dataProtectionType.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of CKCodeOperation.permittedRemoteMeasurement.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of CKCodeOperation.permittedRemoteMeasurement.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of CKCodeOperation.permittedRemoteMeasurement.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of CKCodeOperation.shouldSendRecordPCSKeys.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of CKCodeOperation.shouldSendRecordPCSKeys.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of CKCodeOperation.shouldSendRecordPCSKeys.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of CKCodeOperation.__allocating_init(functionName:request:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 544))();
}

uint64_t dispatch thunk of CKCodeOperation.perRecordResultBlock.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x228))();
}

uint64_t dispatch thunk of CKCodeOperation.perRecordResultBlock.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x230))();
}

uint64_t dispatch thunk of CKCodeOperation.perRecordResultBlock.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x238))();
}

uint64_t dispatch thunk of CKCodeOperation.perRecordProgressBlock.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x240))();
}

uint64_t dispatch thunk of CKCodeOperation.perRecordProgressBlock.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x248))();
}

uint64_t dispatch thunk of CKCodeOperation.perRecordProgressBlock.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x250))();
}

uint64_t dispatch thunk of CKCodeOperation.codeOperationResultBlock.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x258))();
}

uint64_t dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x260))();
}

uint64_t dispatch thunk of CKCodeOperation.codeOperationResultBlock.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x268))();
}

uint64_t dispatch thunk of CKCodeOperation.dropInMemoryAssetContentASAP.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x270))();
}

uint64_t dispatch thunk of CKCodeOperation.dropInMemoryAssetContentASAP.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x278))();
}

uint64_t dispatch thunk of CKCodeOperation.dropInMemoryAssetContentASAP.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x280))();
}

uint64_t dispatch thunk of CKCodeOperation.shouldFetchAssetContentInMemory.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x288))();
}

uint64_t dispatch thunk of CKCodeOperation.shouldFetchAssetContentInMemory.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x290))();
}

uint64_t dispatch thunk of CKCodeOperation.shouldFetchAssetContentInMemory.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x298))();
}

uint64_t dispatch thunk of CKCodeOperation.incompleteResponsePreviewBlock.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of CKCodeOperation.incompleteResponsePreviewBlock.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of CKCodeOperation.incompleteResponsePreviewBlock.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of CKCodeOperation.didSubstituteRequestRecordTransportsBlock.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of CKCodeOperation.didSubstituteRequestRecordTransportsBlock.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of CKCodeOperation.didSubstituteRequestRecordTransportsBlock.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2C8))();
}

void type metadata accessor for CKCodeOperation.DataProtectionType()
{
  JUMPOUT(0x1DF0EA560);
}

uint64_t sub_1DE22098C()
{
  return swift_initClassMetadata2();
}

void type metadata accessor for CKCodeOperation.AssetInfo()
{
  JUMPOUT(0x1DF0EA560);
}

uint64_t sub_1DE2209D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1DE2209E8()
{
  return swift_release();
}

uint64_t sub_1DE2209F0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1DE220A14(uint64_t a1, uint64_t a2)
{
  sub_1DE21986C(a1, a2);
}

uint64_t sub_1DE220A30()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DE220A84;
  v2 = sub_1DE204208();
  return sub_1DE2170A4(v2, v3, v4);
}

uint64_t sub_1DE220A84()
{
  uint64_t v0;

  sub_1DE221CDC();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DE220AB4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DE221C3C;
  v2 = sub_1DE221E30();
  return v3(v2);
}

uint64_t sub_1DE220B2C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DE220B58(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1DE221C3C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1F0438F68 + dword_1F0438F68))(a1, v4, v5, v6);
}

uint64_t sub_1DE220BDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DE220C4C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1F0438F78 + dword_1F0438F78))(a1, v4);
}

uint64_t sub_1DE220C4C()
{
  uint64_t v0;

  sub_1DE221CDC();
  return sub_1DE2061B4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1DE220C74()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_1DE220CA0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DE221C3C;
  v2 = sub_1DE204208();
  return sub_1DE2170A4(v2, v3, v4);
}

uint64_t sub_1DE220CF4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  char v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_1DE220FE0(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v12 = *v2;
  v7 = *v2;
  *v2 = 0x8000000000000000;
  v8 = *(_QWORD *)(v7 + 24);
  sub_1DE1FFE88(&qword_1F0438C88);
  _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v8);

  v9 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v4);
  sub_1DE217328(v10, &qword_1F0438980);
  sub_1DE1FFE88(&qword_1F0438FA0);
  sub_1DE221928();
  _NativeDictionary._delete(at:)();
  *v2 = v12;
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1DE220E0C(uint64_t a1, char a2, void *a3)
{
  uint64_t *v3;
  char v6;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;

  v6 = a2 & 1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  *v3 = 0x8000000000000000;
  sub_1DE22102C(a1, v6, a3, isUniquelyReferenced_nonNull_native);
  *v3 = v9;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DE220E88()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  char v3;
  uint64_t v5;

  swift_isUniquelyReferenced_nonNull_native();
  v5 = *v0;
  *v0 = 0x8000000000000000;
  v1 = sub_1DE21729C();
  sub_1DE22134C(v1, v2, v3);
  *v0 = v5;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DE220EF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_1DE2216B8(a1, v4);
}

unint64_t sub_1DE220F3C(uint64_t a1)
{
  uint64_t v2;

  v2 = static Hasher._hash(seed:_:)();
  return sub_1DE22153C(a1, v2);
}

uint64_t sub_1DE220F6C(uint64_t a1, uint64_t a2)
{
  return sub_1DE220F78(a1, a2, (uint64_t (*)(uint64_t))sub_1DE2215D8);
}

uint64_t sub_1DE220F78(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v3;

  Hasher.init(_seed:)();
  String.hash(into:)();
  Hasher._finalize()();
  v3 = sub_1DE21729C();
  return a3(v3);
}

uint64_t sub_1DE220FE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_1DE2216B8(a1, v4);
}

void sub_1DE22102C(uint64_t a1, char a2, void *a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _BOOL8 v13;
  Swift::Int v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  int v19;
  _QWORD *v20;
  BOOL v21;
  uint64_t v22;
  id v23;

  v5 = (_QWORD **)v4;
  v9 = (_QWORD *)*v4;
  v10 = sub_1DE220EF0((uint64_t)a3);
  v12 = v9[2];
  v13 = (v11 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
    goto LABEL_9;
  }
  v15 = v10;
  v16 = v11;
  sub_1DE1FFE88(&qword_1F0438FE0);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v14))
    goto LABEL_5;
  v17 = sub_1DE220EF0((uint64_t)a3);
  if ((v16 & 1) != (v18 & 1))
  {
LABEL_9:
    sub_1DE209038(0, &qword_1F0438810);
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  v15 = v17;
LABEL_5:
  v19 = a2 & 1;
  v20 = *v5;
  if ((v16 & 1) != 0)
  {
    v21 = v19 != 0;
    v22 = v20[7] + 16 * v15;
    sub_1DE2050EC(*(id *)v22, *(_BYTE *)(v22 + 8));
    *(_QWORD *)v22 = a1;
    *(_BYTE *)(v22 + 8) = v21;
  }
  else
  {
    sub_1DE221460(v15, (uint64_t)a3, a1, v19, v20);
    v23 = a3;
  }
}

void sub_1DE221168(uint64_t a1, uint64_t a2, char a3)
{
  Swift::Int *v3;
  Swift::Int *v4;
  Swift::Int v8;
  unint64_t v9;
  char v10;
  char v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  char v15;
  _QWORD *v16;
  uint64_t v17;

  v4 = v3;
  v8 = *v3;
  sub_1DE220F3C(a2);
  sub_1DE221E64();
  if (v11)
  {
    __break(1u);
    goto LABEL_9;
  }
  v12 = v9;
  v13 = v10;
  sub_1DE1FFE88(&qword_1F0438FB8);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v8))
    goto LABEL_5;
  v14 = sub_1DE220F3C(a2);
  if ((v13 & 1) != (v15 & 1))
  {
LABEL_9:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  v12 = v14;
LABEL_5:
  v16 = (_QWORD *)*v4;
  if ((v13 & 1) != 0)
  {
    v17 = v16[7];

    *(_QWORD *)(v17 + 8 * v12) = a1;
    sub_1DE217068();
  }
  else
  {
    sub_1DE2214B0(v12, a2, a1, v16);
  }
}

void sub_1DE221248(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  Swift::Int *v4;
  Swift::Int *v5;
  Swift::Int v10;
  unint64_t v11;
  char v12;
  char v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;

  v5 = v4;
  v10 = *v4;
  sub_1DE220F78(a2, a3, (uint64_t (*)(uint64_t))sub_1DE2215D8);
  sub_1DE221E64();
  if (v13)
  {
    __break(1u);
    goto LABEL_9;
  }
  v14 = v11;
  v15 = v12;
  sub_1DE1FFE88((uint64_t *)&unk_1F0438C90);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v10))
    goto LABEL_5;
  v16 = sub_1DE21729C();
  v19 = sub_1DE220F78(v16, v17, v18);
  if ((v15 & 1) != (v20 & 1))
  {
LABEL_9:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  v14 = v19;
LABEL_5:
  v21 = (_QWORD *)*v5;
  if ((v15 & 1) != 0)
  {
    v22 = v21[7];
    swift_bridgeObjectRelease();
    *(_QWORD *)(v22 + 8 * v14) = a1;
    sub_1DE217068();
  }
  else
  {
    sub_1DE2214F4(v14, a2, a3, a1, v21);
    swift_bridgeObjectRetain();
  }
}

id sub_1DE22134C(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _BOOL8 v11;
  Swift::Int v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  id result;

  v4 = (_QWORD **)v3;
  v7 = (_QWORD *)*v3;
  v8 = sub_1DE220FE0((uint64_t)a2);
  v10 = v7[2];
  v11 = (v9 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_9;
  }
  v13 = v8;
  v14 = v9;
  sub_1DE1FFE88(&qword_1F0438C88);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v12))
    goto LABEL_5;
  v15 = sub_1DE220FE0((uint64_t)a2);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_9:
    sub_1DE209038(0, &qword_1F0438980);
    result = (id)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  v13 = v15;
LABEL_5:
  v17 = *v4;
  if ((v14 & 1) != 0)
  {
    v18 = v17[7];
    result = (id)swift_bridgeObjectRelease();
    *(_QWORD *)(v18 + 8 * v13) = a1;
  }
  else
  {
    sub_1DE2214B0(v13, (uint64_t)a2, a1, v17);
    return a2;
  }
  return result;
}

unint64_t sub_1DE221460(unint64_t result, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  *(_QWORD *)(a5[6] + 8 * result) = a2;
  v5 = a5[7] + 16 * result;
  *(_QWORD *)v5 = a3;
  *(_BYTE *)(v5 + 8) = a4 & 1;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

unint64_t sub_1DE2214B0(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_QWORD *)(a4[6] + 8 * result) = a2;
  *(_QWORD *)(a4[7] + 8 * result) = a3;
  v4 = a4[2];
  v5 = __OFADD__(v4, 1);
  v6 = v4 + 1;
  if (v5)
    __break(1u);
  else
    a4[2] = v6;
  return result;
}

unint64_t sub_1DE2214F4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

unint64_t sub_1DE22153C(uint64_t a1, uint64_t a2)
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

unint64_t sub_1DE2215D8(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_1DE2216B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  char v6;
  id v7;
  char v8;
  uint64_t v9;
  char v10;
  id v11;
  char v12;
  char v13;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  sub_1DE221D50();
  if ((v6 & 1) != 0)
  {
    sub_1DE209038(0, v5);
    v7 = sub_1DE221E94();
    v8 = static NSObject.== infix(_:_:)();

    if ((v8 & 1) == 0)
    {
      v9 = ~v3;
      v4 = (v4 + 1) & v9;
      sub_1DE221D50();
      if ((v10 & 1) != 0)
      {
        do
        {
          v11 = sub_1DE221E94();
          v12 = static NSObject.== infix(_:_:)();

          if ((v12 & 1) != 0)
            break;
          v4 = (v4 + 1) & v9;
          sub_1DE221D50();
        }
        while ((v13 & 1) != 0);
      }
    }
  }
  return v4;
}

uint64_t sub_1DE221794(uint64_t *a1, char a2, _QWORD **a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  v6 = *a1;
  if (*a1)
  {
    if ((a2 & 1) != 0)
    {
      *(_QWORD *)((*a3)[7] + 8 * a4) = v6;
    }
    else
    {
      sub_1DE2214F4(a4, a5, a6, v6, *a3);
      swift_bridgeObjectRetain();
    }
  }
  else if ((a2 & 1) != 0)
  {
    swift_arrayDestroy();
    sub_1DE1FFE88(&qword_1F0438FB0);
    _NativeDictionary._delete(at:)();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DE221854(uint64_t *a1, char a2, _QWORD **a3, unint64_t a4, void *a5)
{
  uint64_t v6;
  _QWORD *v7;
  id v9;

  v6 = *a1;
  if (*a1)
  {
    v7 = *a3;
    if ((a2 & 1) != 0)
    {
      *(_QWORD *)(v7[7] + 8 * a4) = v6;
    }
    else
    {
      sub_1DE2214B0(a4, (uint64_t)a5, v6, v7);
      v9 = a5;
    }
  }
  else if ((a2 & 1) != 0)
  {
    sub_1DE217328((uint64_t)a1, &qword_1F0438980);
    swift_arrayDestroy();
    sub_1DE1FFE88(&qword_1F0438FA0);
    sub_1DE221928();
    _NativeDictionary._delete(at:)();
  }
  return swift_bridgeObjectRetain();
}

unint64_t sub_1DE221928()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F0438FA8;
  if (!qword_1F0438FA8)
  {
    sub_1DE209038(255, &qword_1F0438980);
    result = MEMORY[0x1DF0EA5C0](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1F0438FA8);
  }
  return result;
}

_OWORD *sub_1DE221978(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_1DE221988()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1DE221A18();
  *v0 = v1;
}

uint64_t sub_1DE2219C4(uint64_t *a1)
{
  uint64_t v1;

  return sub_1DE21CB7C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_1DE2219DC()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1DE221A18();
  *v0 = v1;
}

void sub_1DE221A18()
{
  int64_t v0;
  uint64_t v1;
  uint64_t *v2;
  void (*v3)(uint64_t, uint64_t, char *);
  void (*v4)(uint64_t, uint64_t, char *);
  void (*v5)(uint64_t, uint64_t, char *);
  void (*v6)(uint64_t, uint64_t, char *);
  uint64_t (*v7)(_QWORD);
  uint64_t (*v8)(_QWORD);
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  size_t v21;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;

  sub_1DE216FF0();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = v1;
  v11 = v10;
  if ((v12 & 1) != 0)
  {
    v13 = *(_QWORD *)(v1 + 24);
    v14 = v13 >> 1;
    if ((uint64_t)(v13 >> 1) < v0)
    {
      if (v14 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return;
      }
      v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v13 & 0xFFFFFFFFFFFFFFFELL) <= v0)
        v14 = v0;
    }
  }
  else
  {
    v14 = v0;
  }
  v15 = *(_QWORD *)(v1 + 16);
  if (v14 <= v15)
    v16 = *(_QWORD *)(v1 + 16);
  else
    v16 = v14;
  if (!v16)
  {
    v20 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  sub_1DE1FFE88(v2);
  v17 = *(_QWORD *)(v8(0) - 8);
  v18 = *(_QWORD *)(v17 + 72);
  v19 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v20 = (_QWORD *)swift_allocObject();
  v21 = j__malloc_size(v20);
  if (!v18)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v21 - v19 == 0x8000000000000000 && v18 == -1)
    goto LABEL_24;
  v20[2] = v15;
  v20[3] = 2 * ((uint64_t)(v21 - v19) / v18);
LABEL_19:
  v23 = *(unsigned __int8 *)(*(_QWORD *)(v8(0) - 8) + 80);
  v24 = (v23 + 32) & ~v23;
  v25 = (char *)v20 + v24;
  v26 = v9 + v24;
  if ((v11 & 1) != 0)
  {
    v6(v26, v15, v25);
    *(_QWORD *)(v9 + 16) = 0;
  }
  else
  {
    v4(v26, v15, v25);
  }
  sub_1DE221F68();
}

uint64_t sub_1DE221B5C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1DE221B80()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 48))();
  sub_1DE20425C();
}

uint64_t sub_1DE221B9C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1DE221BC0()
{
  void (*v0)(void);

  sub_1DE221F54();
  v0();
  sub_1DE221F48();
}

void sub_1DE221BE4(_QWORD *a1, double *a2)
{
  uint64_t v2;

  (*(void (**)(_QWORD, double))(v2 + 16))(*a1, *a2);
  sub_1DE20425C();
}

void sub_1DE221C08(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v2 + 16))(*a1, *(_QWORD *)a2, *(unsigned __int8 *)(a2 + 8));
  sub_1DE20425C();
}

uint64_t sub_1DE221CA4()
{
  return swift_beginAccess();
}

uint64_t sub_1DE221CDC()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t sub_1DE221CFC()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 16))(v0, v1);
}

void sub_1DE221D10(id a1)
{

}

uint64_t sub_1DE221D20()
{
  uint64_t v0;

  return v0;
}

void sub_1DE221D30(id a1)
{

}

uint64_t sub_1DE221D64()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  return sub_1DE20FEAC(v3, v2, v1, v0, 0);
}

void sub_1DE221D7C()
{
  type metadata accessor for CKCodeOperation();
}

void sub_1DE221D84(void *a1)
{
  free(a1);
}

uint64_t sub_1DE221D90@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_1DE221D98()
{
  uint64_t v0;

  return sub_1DE204AEC(v0);
}

uint64_t sub_1DE221DA4()
{
  return swift_retain();
}

uint64_t sub_1DE221DB8(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t sub_1DE221DCC()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  return v1(v0);
}

id sub_1DE221DD8(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_1DE221DE4(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  return swift_storeEnumTagMultiPayload();
}

id sub_1DE221DF8()
{
  void *v0;

  return v0;
}

uint64_t sub_1DE221E30()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1DE221E3C(uint64_t a1)
{
  uint64_t v1;

  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(a1, 0, 1, v1);
}

uint64_t sub_1DE221E4C()
{
  uint64_t v0;
  uint64_t v1;

  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v0, 1, v1);
}

void sub_1DE221E5C(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_1DE2005D4(a1, v1);
}

uint64_t sub_1DE221E78()
{
  return swift_bridgeObjectRelease();
}

BOOL sub_1DE221E80@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

id sub_1DE221E94()
{
  uint64_t v0;
  uint64_t v1;

  return *(id *)(*(_QWORD *)(v1 + 48) + 8 * v0);
}

uint64_t sub_1DE221EA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

id sub_1DE221EA8(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id sub_1DE221EB0(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_1DE221EBC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1DE221EC8()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1DE205560(v1, v0);
}

uint64_t sub_1DE221ED4(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);

  return v2(a1, a2, 1);
}

void sub_1DE221EE0()
{
  void *v0;

}

uint64_t sub_1DE221EFC()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1DE205560(v0, v1);
}

uint64_t sub_1DE221F08(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

void sub_1DE221F14()
{
  uint64_t v0;

  sub_1DE21B50C(v0);
}

void sub_1DE221F20()
{
  sub_1DE219CFC();
}

uint64_t sub_1DE221F68()
{
  return swift_release();
}

uint64_t sub_1DE221F70()
{
  return swift_bridgeObjectRetain();
}

void sub_1DE221F7C(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_1DE2008C4(a1, a2, v2);
}

uint64_t sub_1DE221F84()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 - 160))();
}

uint64_t sub_1DE221F8C(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[32];
  _BYTE v11[24];
  uint64_t v12;

  sub_1DE223190((uint64_t)(v1 + 2), (uint64_t)v11);
  if (!v12)
    goto LABEL_5;
  sub_1DE223190((uint64_t)v11, (uint64_t)v10);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_1DE20585C((uint64_t)v10);
LABEL_5:
    v3 = MEMORY[0x1E0DEA968];
    v4 = *v1;
    v5 = *((_BYTE *)v1 + 8);
    sub_1DE2231D8();
    swift_allocError();
    *(_QWORD *)v6 = v3;
    *(_QWORD *)(v6 + 8) = v4;
    *(_BYTE *)(v6 + 16) = v5;
    swift_willThrow();
    return sub_1DE223214((uint64_t)v11);
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  a1[1] = v9;
  sub_1DE20585C((uint64_t)v10);
  return sub_1DE223214((uint64_t)v11);
}

uint64_t sub_1DE222074(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  __int128 v8;
  _BYTE v9[32];
  _BYTE v10[24];
  uint64_t v11;

  sub_1DE223190((uint64_t)(v1 + 2), (uint64_t)v10);
  if (!v11)
    goto LABEL_5;
  sub_1DE223190((uint64_t)v10, (uint64_t)v9);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_1DE20585C((uint64_t)v9);
LABEL_5:
    v3 = MEMORY[0x1E0CB0338];
    v4 = *v1;
    v5 = *((_BYTE *)v1 + 8);
    sub_1DE2231D8();
    swift_allocError();
    *(_QWORD *)v6 = v3;
    *(_QWORD *)(v6 + 8) = v4;
    *(_BYTE *)(v6 + 16) = v5;
    swift_willThrow();
    return sub_1DE223214((uint64_t)v10);
  }
  sub_1DE1FFC54(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  *(_OWORD *)a1 = v8;
  sub_1DE20585C((uint64_t)v9);
  return sub_1DE223214((uint64_t)v10);
}

uint64_t sub_1DE22215C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _BYTE v12[32];
  _BYTE v13[24];
  uint64_t v14;

  v5 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DE223190((uint64_t)(v2 + 2), (uint64_t)v13);
  if (!v14)
    goto LABEL_5;
  sub_1DE223190((uint64_t)v13, (uint64_t)v12);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_1DE20585C((uint64_t)v12);
LABEL_5:
    v8 = *v2;
    v9 = *((_BYTE *)v2 + 8);
    sub_1DE2231D8();
    swift_allocError();
    *(_QWORD *)v10 = a2;
    *(_QWORD *)(v10 + 8) = v8;
    *(_BYTE *)(v10 + 16) = v9;
    swift_willThrow();
    return sub_1DE223214((uint64_t)v13);
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, a2);
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v5 + 32))(a1, v7, a2);
  sub_1DE20585C((uint64_t)v12);
  return sub_1DE223214((uint64_t)v13);
}

uint64_t sub_1DE222284(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  _BYTE v13[32];

  v5 = type metadata accessor for Optional();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = &v13[-v7];
  sub_1DE223190((uint64_t)(v2 + 2), (uint64_t)v13);
  sub_1DE1FFE88(qword_1EDB81A50);
  if ((swift_dynamicCast() & 1) != 0)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v6 + 32))(a1, v8, v5);
  }
  else
  {
    v9 = *v2;
    v10 = *((_BYTE *)v2 + 8) | 0x40;
    sub_1DE2231D8();
    swift_allocError();
    *(_QWORD *)v11 = a2;
    *(_QWORD *)(v11 + 8) = v9;
    *(_BYTE *)(v11 + 16) = v10;
    swift_willThrow();
  }
  return sub_1DE223214((uint64_t)v13);
}

void sub_1DE2223A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  char v40;
  uint64_t v41;
  uint64_t v42;

  v5 = sub_1DE223748(a1, a2, a3, a4);
  if (!v41)
    goto LABEL_5;
  sub_1DE223804(v5, v6, v7, v8, v9, v10, v11, v12, v35, v37, v38, v39, v40);
  sub_1DE223890();
  v13 = sub_1DE223764();
  if ((v13 & 1) == 0)
  {
    sub_1DE2237E8(v13, v14, v15, v16, v17, v18, v19, v20, v36);
LABEL_5:
    sub_1DE2231D8();
    v33 = sub_1DE20C06C();
    v29 = sub_1DE223728(v33, v34);
    goto LABEL_6;
  }
  v21 = swift_bridgeObjectRelease();
  *v4 = v42;
  v29 = sub_1DE2237E8(v21, v22, v23, v24, v25, v26, v27, v28, v36);
LABEL_6:
  sub_1DE223898(v29, v30, v31, v32);
  sub_1DE22376C();
}

uint64_t sub_1DE22243C(_QWORD *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v9;
  _BYTE v10[32];
  _BYTE v11[24];
  uint64_t v12;

  sub_1DE223190((uint64_t)(v2 + 2), (uint64_t)v11);
  if (!v12)
    goto LABEL_5;
  sub_1DE223190((uint64_t)v11, (uint64_t)v10);
  type metadata accessor for Array();
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_1DE20585C((uint64_t)v10);
LABEL_5:
    v5 = *v2;
    v6 = *((_BYTE *)v2 + 8) | 0x80;
    sub_1DE2231D8();
    swift_allocError();
    *(_QWORD *)v7 = a2;
    *(_QWORD *)(v7 + 8) = v5;
    *(_BYTE *)(v7 + 16) = v6;
    swift_willThrow();
    return sub_1DE223214((uint64_t)v11);
  }
  swift_bridgeObjectRelease();
  *a1 = v9;
  sub_1DE20585C((uint64_t)v10);
  return sub_1DE223214((uint64_t)v11);
}

uint64_t sub_1DE222538()
{
  uint64_t *v0;
  uint64_t result;

  result = *v0;
  if ((v0[1] & 1) == 0)
  {
    *v0 = 0;
    *((_BYTE *)v0 + 8) = 1;
  }
  return result;
}

void sub_1DE222554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _DWORD *v6;
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
  int v19;
  _BYTE v20[24];
  uint64_t v21;

  sub_1DE22378C(a1, a2, a3, a4, a5, a6);
  if (!v21)
    goto LABEL_5;
  sub_1DE2237B8((uint64_t)v20, v7, v8);
  v9 = sub_1DE223764();
  if ((v9 & 1) == 0)
  {
    sub_1DE2237E0(v9, v10);
LABEL_5:
    sub_1DE2237AC();
    v17 = sub_1DE20C06C();
    v11 = sub_1DE223728(v17, v18);
    goto LABEL_6;
  }
  *v6 = v19;
  v11 = sub_1DE2237E0(v9, v10);
LABEL_6:
  sub_1DE2238A0(v11, v12, v13, v14, v15, v16);
  sub_1DE2237C0();
}

void sub_1DE2225E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE2223A0(a1, (uint64_t)&unk_1F0439070, MEMORY[0x1E0DEB188], a4);
}

void sub_1DE222608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
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
  _BYTE v20[24];
  uint64_t v21;

  sub_1DE22378C(a1, a2, a3, a4, a5, a6);
  if (!v21)
    goto LABEL_5;
  sub_1DE2237B8((uint64_t)v20, v7, v8);
  v9 = sub_1DE223764();
  if ((v9 & 1) == 0)
  {
    sub_1DE2237E0(v9, v10);
LABEL_5:
    sub_1DE2237AC();
    v17 = sub_1DE20C06C();
    v11 = sub_1DE223728(v17, v18);
    goto LABEL_6;
  }
  *v6 = v19;
  v11 = sub_1DE2237E0(v9, v10);
LABEL_6:
  sub_1DE2238A0(v11, v12, v13, v14, v15, v16);
  sub_1DE2237C0();
}

void sub_1DE222698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE2223A0(a1, (uint64_t)&unk_1F0439060, MEMORY[0x1E0DEB070], a4);
}

void sub_1DE2226BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE2223A0(a1, (uint64_t)&unk_1F0439030, MEMORY[0x1E0DEDBC8], a4);
}

void sub_1DE2226E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE2223A0(a1, (uint64_t)&unk_1F0439020, MEMORY[0x1E0DEDC60], a4);
}

void sub_1DE222704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE2223A0(a1, (uint64_t)&unk_1F0439050, MEMORY[0x1E0DEE0F8], a4);
}

void sub_1DE222728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE2223A0(a1, (uint64_t)&unk_1F0439040, MEMORY[0x1E0DEE190], a4);
}

void sub_1DE22274C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _DWORD *v4;
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
  char v32;
  uint64_t v33;
  int v34;

  v5 = sub_1DE223748(a1, a2, a3, a4);
  if (!v33)
    goto LABEL_5;
  sub_1DE223804(v5, v6, v7, v8, v9, v10, v11, v12, v27, v29, v30, v31, v32);
  v13 = sub_1DE223764();
  if ((v13 & 1) == 0)
  {
    sub_1DE2237E8(v13, v14, v15, v16, v17, v18, v19, v20, v28);
LABEL_5:
    sub_1DE2237AC();
    v25 = sub_1DE20C06C();
    v21 = sub_1DE223728(v25, v26);
    goto LABEL_6;
  }
  *v4 = v34;
  v21 = sub_1DE2237E8(v13, v14, v15, v16, v17, v18, v19, v20, v28);
LABEL_6:
  sub_1DE223898(v21, v22, v23, v24);
  sub_1DE22376C();
}

void sub_1DE2227D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char v8;

  sub_1DE223780(a1, a2);
  sub_1DE1FFE88(qword_1EDB81A50);
  sub_1DE223890();
  v3 = sub_1DE223764();
  if ((v3 & 1) != 0)
  {
    *(_DWORD *)a1 = v7;
    *(_BYTE *)(a1 + 4) = v8;
  }
  else
  {
    sub_1DE2237A0();
    v5 = sub_1DE20C06C();
    v3 = sub_1DE223728(v5, v6);
  }
  sub_1DE223824(v3, v4);
  sub_1DE223810();
}

void sub_1DE222868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  char v32;
  uint64_t v33;
  uint64_t v34;

  v5 = sub_1DE223748(a1, a2, a3, a4);
  if (!v33)
    goto LABEL_5;
  sub_1DE223804(v5, v6, v7, v8, v9, v10, v11, v12, v27, v29, v30, v31, v32);
  v13 = sub_1DE223764();
  if ((v13 & 1) == 0)
  {
    sub_1DE2237E8(v13, v14, v15, v16, v17, v18, v19, v20, v28);
LABEL_5:
    sub_1DE2237AC();
    v25 = sub_1DE20C06C();
    v21 = sub_1DE223728(v25, v26);
    goto LABEL_6;
  }
  *v4 = v34;
  v21 = sub_1DE2237E8(v13, v14, v15, v16, v17, v18, v19, v20, v28);
LABEL_6:
  sub_1DE223898(v21, v22, v23, v24);
  sub_1DE22376C();
}

void sub_1DE2228EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  sub_1DE223780(a1, a2);
  sub_1DE1FFE88(qword_1EDB81A50);
  sub_1DE223890();
  v3 = sub_1DE223764();
  if ((v3 & 1) != 0)
  {
    *(_QWORD *)a1 = v7;
    *(_BYTE *)(a1 + 8) = v8;
  }
  else
  {
    sub_1DE2237A0();
    v5 = sub_1DE20C06C();
    v3 = sub_1DE223728(v5, v6);
  }
  sub_1DE223824(v3, v4);
  sub_1DE223810();
}

void sub_1DE222984(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BYTE *v6;
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
  char v19;
  _BYTE v20[24];
  uint64_t v21;

  sub_1DE22378C(a1, a2, a3, a4, a5, a6);
  if (!v21)
    goto LABEL_5;
  sub_1DE2237B8((uint64_t)v20, v7, v8);
  v9 = sub_1DE223764();
  if ((v9 & 1) == 0)
  {
    sub_1DE2237E0(v9, v10);
LABEL_5:
    sub_1DE2237AC();
    v17 = sub_1DE20C06C();
    v11 = sub_1DE223728(v17, v18);
    goto LABEL_6;
  }
  *v6 = v19;
  v11 = sub_1DE2237E0(v9, v10);
LABEL_6:
  sub_1DE2238A0(v11, v12, v13, v14, v15, v16);
  sub_1DE2237C0();
}

void sub_1DE222A14(_BYTE *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char v9;

  sub_1DE223780((uint64_t)a1, a2);
  sub_1DE1FFE88(qword_1EDB81A50);
  sub_1DE1FFE88(&qword_1F0439018);
  v4 = sub_1DE223764();
  if ((v4 & 1) != 0)
  {
    *a1 = v9;
  }
  else
  {
    v6 = *v2;
    sub_1DE2237A0();
    v7 = sub_1DE20C06C();
    *v8 = MEMORY[0x1E0DEAFA0];
    v8[1] = v6;
    v4 = sub_1DE22373C(v7, (uint64_t)v8);
  }
  sub_1DE223824(v4, v5);
  sub_1DE2237D0();
}

void sub_1DE222AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE2223A0(a1, (uint64_t)&unk_1F0439010, MEMORY[0x1E0DEAFA0], a4);
}

uint64_t sub_1DE222AD4(_QWORD *a1)
{
  return sub_1DE221F8C(a1);
}

void sub_1DE222AE8(_OWORD *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  __int128 v9;

  sub_1DE223780((uint64_t)a1, a2);
  sub_1DE1FFE88(qword_1EDB81A50);
  sub_1DE1FFE88(&qword_1F0439008);
  if ((sub_1DE223764() & 1) != 0)
  {
    v4 = swift_bridgeObjectRelease();
    *a1 = v9;
  }
  else
  {
    v6 = *v2;
    sub_1DE2237A0();
    v7 = sub_1DE20C06C();
    *v8 = MEMORY[0x1E0DEA968];
    v8[1] = v6;
    v4 = sub_1DE22373C(v7, (uint64_t)v8);
  }
  sub_1DE223824(v4, v5);
  sub_1DE2237D0();
}

void sub_1DE222B8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE2223A0(a1, (uint64_t)&unk_1F0439000, MEMORY[0x1E0DEA968], a4);
}

uint64_t sub_1DE222BB0(uint64_t a1)
{
  return sub_1DE222074(a1);
}

void sub_1DE222BC4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  __int128 v9;

  sub_1DE223780(a1, a2);
  sub_1DE1FFE88(qword_1EDB81A50);
  sub_1DE1FFE88(&qword_1F0438FF8);
  if ((sub_1DE223764() & 1) != 0)
  {
    v4 = sub_1DE1FFC40(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
    *(_OWORD *)a1 = v9;
  }
  else
  {
    v6 = *v2;
    sub_1DE2237A0();
    v7 = sub_1DE20C06C();
    *v8 = MEMORY[0x1E0CB0338];
    v8[1] = v6;
    v4 = sub_1DE22373C(v7, (uint64_t)v8);
  }
  sub_1DE223824(v4, v5);
  sub_1DE2237D0();
}

void sub_1DE222C68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE2223A0(a1, (uint64_t)&unk_1F0438FF0, MEMORY[0x1E0CB0338], a4);
}

uint64_t sub_1DE222C8C(uint64_t a1, uint64_t a2)
{
  return sub_1DE22215C(a1, a2);
}

uint64_t sub_1DE222CA0(uint64_t a1, uint64_t a2)
{
  return sub_1DE222284(a1, a2);
}

uint64_t sub_1DE222CB4(_QWORD *a1, uint64_t a2)
{
  return sub_1DE22243C(a1, a2);
}

uint64_t sub_1DE222CC8(uint64_t a1)
{
  uint64_t v2;

  sub_1DE2238A8();
  sub_1DE2238A8();
  swift_getAssociatedConformanceWitness();
  v2 = type metadata accessor for Dictionary();
  return sub_1DE22215C(a1, v2);
}

void sub_1DE222D90()
{
  uint64_t v0;

  sub_1DE223868();
  sub_1DE223854();
  sub_1DE22382C();
  v0 = sub_1DE2237F0();
  sub_1DE223880(v0);
  sub_1DE223840();
}

void sub_1DE222DE0()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_1DE222E38()
{
  return sub_1DE222538();
}

void sub_1DE222E60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_1DE222554(a1, a2, a3, a4, a5, a6);
}

void sub_1DE222E74(uint64_t a1)
{
  sub_1DE2227D0(a1, (uint64_t)&unk_1F0439078);
}

void sub_1DE222E98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE2225E4(a1, a2, a3, a4);
}

void sub_1DE222EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_1DE222608(a1, a2, a3, a4, a5, a6);
}

void sub_1DE222EC0(uint64_t a1)
{
  sub_1DE2228EC(a1, (uint64_t)&unk_1F0439068);
}

void sub_1DE222EE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE222698(a1, a2, a3, a4);
}

void sub_1DE222EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE22274C(a1, MEMORY[0x1E0DEDBC8], MEMORY[0x1E0DEDBC8], a4);
}

void sub_1DE222F18(uint64_t a1)
{
  sub_1DE2227D0(a1, (uint64_t)&unk_1F0439038);
}

void sub_1DE222F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE2226BC(a1, a2, a3, a4);
}

void sub_1DE222F50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE222868(a1, MEMORY[0x1E0DEDC60], MEMORY[0x1E0DEDC60], a4);
}

void sub_1DE222F70(uint64_t a1)
{
  sub_1DE2228EC(a1, (uint64_t)&unk_1F0439028);
}

void sub_1DE222F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE2226E0(a1, a2, a3, a4);
}

void sub_1DE222FA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE22274C(a1, MEMORY[0x1E0DEE0F8], MEMORY[0x1E0DEE0F8], a4);
}

void sub_1DE222FC8(uint64_t a1)
{
  sub_1DE2227D0(a1, (uint64_t)&unk_1F0439058);
}

void sub_1DE222FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE222704(a1, a2, a3, a4);
}

void sub_1DE223000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE222868(a1, MEMORY[0x1E0DEE190], MEMORY[0x1E0DEE190], a4);
}

void sub_1DE223020(uint64_t a1)
{
  sub_1DE2228EC(a1, (uint64_t)&unk_1F0439048);
}

void sub_1DE223044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE222728(a1, a2, a3, a4);
}

void sub_1DE223058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_1DE222984(a1, a2, a3, a4, a5, a6);
}

void sub_1DE22306C(_BYTE *a1, uint64_t a2)
{
  sub_1DE222A14(a1, a2);
}

void sub_1DE223080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE222AB0(a1, a2, a3, a4);
}

uint64_t sub_1DE223094(_QWORD *a1)
{
  return sub_1DE222AD4(a1);
}

void sub_1DE2230A8(_OWORD *a1, uint64_t a2)
{
  sub_1DE222AE8(a1, a2);
}

void sub_1DE2230BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE222B8C(a1, a2, a3, a4);
}

uint64_t sub_1DE2230D0(uint64_t a1)
{
  return sub_1DE222BB0(a1);
}

void sub_1DE2230E4(uint64_t a1, uint64_t a2)
{
  sub_1DE222BC4(a1, a2);
}

void sub_1DE2230F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DE222C68(a1, a2, a3, a4);
}

uint64_t sub_1DE22310C(uint64_t a1, uint64_t a2)
{
  return sub_1DE222C8C(a1, a2);
}

uint64_t sub_1DE223120(uint64_t a1, uint64_t a2)
{
  return sub_1DE222CA0(a1, a2);
}

uint64_t sub_1DE223134(_QWORD *a1, uint64_t a2)
{
  return sub_1DE222CB4(a1, a2);
}

uint64_t sub_1DE223148(uint64_t a1)
{
  return sub_1DE222CC8(a1);
}

void sub_1DE22315C()
{
  sub_1DE222D90();
}

void sub_1DE223170()
{
  sub_1DE222DE0();
}

uint64_t sub_1DE22317C()
{
  return Decoder.decodeExtensionFieldsAsMessageSet(values:messageType:)();
}

uint64_t sub_1DE223190(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1DE1FFE88(qword_1EDB81A50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1DE2231D8()
{
  unint64_t result;

  result = qword_1F0438FE8;
  if (!qword_1F0438FE8)
  {
    result = MEMORY[0x1DF0EA5C0](&unk_1DE227968, &type metadata for OneFieldDecoderError);
    atomic_store(result, (unint64_t *)&qword_1F0438FE8);
  }
  return result;
}

uint64_t sub_1DE223214(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1DE1FFE88(qword_1EDB81A50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

__n128 initializeBufferWithCopyOfBuffer for OneFieldDecoderError(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for OneFieldDecoderError(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x3FFE && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 16381;
    }
    else
    {
      v2 = ((*(unsigned __int8 *)(a1 + 16) >> 6) | (4
                                                  * ((*(_QWORD *)a1 >> 57) & 0x78 | *(_QWORD *)a1 & 7 | (((*(unsigned __int8 *)(a1 + 16) >> 1) & 0x1F) << 7)))) ^ 0x3FFF;
      if (v2 >= 0x3FFD)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for OneFieldDecoderError(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x3FFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 16382;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x3FFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x3FFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
    {
      v3 = (-a2 >> 2) & 0xFFF | ((-a2 & 0x3FFF) << 12);
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
      *(_QWORD *)(result + 8) = 0;
      *(_BYTE *)(result + 16) = (v3 >> 6) & 0xFE;
    }
  }
  return result;
}

uint64_t sub_1DE223348(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16) >> 6;
}

uint64_t sub_1DE223354(uint64_t result)
{
  *(_BYTE *)(result + 16) &= 0x3Fu;
  return result;
}

uint64_t sub_1DE223364(uint64_t result, char a2)
{
  char v2;

  v2 = *(_BYTE *)(result + 16) & 1 | (a2 << 6);
  *(_QWORD *)result &= 0xFFFFFFFFFFFFFF8uLL;
  *(_BYTE *)(result + 16) = v2;
  return result;
}

ValueMetadata *type metadata accessor for OneFieldDecoderError()
{
  return &type metadata for OneFieldDecoderError;
}

uint64_t destroy for OneFieldDecoder(uint64_t result)
{
  if (*(_QWORD *)(result + 40))
    return sub_1DE20585C(result + 16);
  return result;
}

uint64_t initializeWithCopy for OneFieldDecoder(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  _OWORD *v5;
  uint64_t v6;
  __int128 v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = (_OWORD *)(a1 + 16);
  v5 = (_OWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 40);
  if (v6)
  {
    *(_QWORD *)(a1 + 40) = v6;
    (**(void (***)(_OWORD *, _OWORD *))(v6 - 8))(v4, v5);
  }
  else
  {
    v7 = v5[1];
    *v4 = *v5;
    v4[1] = v7;
  }
  return a1;
}

uint64_t assignWithCopy for OneFieldDecoder(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  _OWORD *v4;
  _OWORD *v5;
  uint64_t v6;
  __int128 v7;

  v3 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v3;
  v4 = (_OWORD *)(a1 + 16);
  v5 = a2 + 2;
  v6 = a2[5];
  if (!*(_QWORD *)(a1 + 40))
  {
    if (v6)
    {
      *(_QWORD *)(a1 + 40) = v6;
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 16, (uint64_t)(a2 + 2));
      return a1;
    }
LABEL_7:
    v7 = v5[1];
    *v4 = *v5;
    v4[1] = v7;
    return a1;
  }
  if (!v6)
  {
    sub_1DE20585C(a1 + 16);
    goto LABEL_7;
  }
  sub_1DE223498((uint64_t *)(a1 + 16), a2 + 2);
  return a1;
}

uint64_t *sub_1DE223498(uint64_t *result, uint64_t *a2)
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

__n128 initializeWithTake for OneFieldDecoder(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for OneFieldDecoder(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  __int128 v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = (_OWORD *)(a1 + 16);
  if (*(_QWORD *)(a1 + 40))
    sub_1DE20585C(a1 + 16);
  v5 = *(_OWORD *)(a2 + 32);
  *v4 = *(_OWORD *)(a2 + 16);
  v4[1] = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for OneFieldDecoder(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 48))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 40);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OneFieldDecoder(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
      *(_QWORD *)(result + 40) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for OneFieldDecoder()
{
  return &type metadata for OneFieldDecoder;
}

uint64_t sub_1DE223728(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)a2 = v3;
  *(_QWORD *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 16) = v2;
  return swift_willThrow();
}

uint64_t sub_1DE22373C(uint64_t a1, uint64_t a2)
{
  char v2;

  *(_BYTE *)(a2 + 16) = v2;
  return swift_willThrow();
}

uint64_t sub_1DE223748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v4;
  va_list va;

  va_start(va, a4);
  return sub_1DE223190(v4 + 16, (uint64_t)va);
}

uint64_t sub_1DE223764()
{
  return swift_dynamicCast();
}

uint64_t sub_1DE223780(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  return sub_1DE223190(v2 + 16, (uint64_t)va);
}

uint64_t sub_1DE22378C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  va_list va;

  va_start(va, a6);
  return sub_1DE223190(v6 + 16, (uint64_t)va);
}

unint64_t sub_1DE2237A0()
{
  return sub_1DE2231D8();
}

unint64_t sub_1DE2237AC()
{
  return sub_1DE2231D8();
}

uint64_t sub_1DE2237B8(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  return sub_1DE223190(a1, (uint64_t)va);
}

uint64_t sub_1DE2237E0(uint64_t a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  return sub_1DE20585C((uint64_t)va);
}

uint64_t sub_1DE2237E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1DE20585C((uint64_t)&a9);
}

uint64_t sub_1DE2237F0()
{
  return type metadata accessor for Dictionary();
}

uint64_t sub_1DE223804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  return sub_1DE223190((uint64_t)&a13, (uint64_t)&a9);
}

uint64_t sub_1DE223824(uint64_t a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  return sub_1DE223214((uint64_t)va);
}

uint64_t sub_1DE22382C()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_1DE223854()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_1DE223880(uint64_t a1)
{
  uint64_t v1;

  return sub_1DE22215C(v1, a1);
}

uint64_t sub_1DE223890()
{
  uint64_t *v0;

  return sub_1DE1FFE88(v0);
}

uint64_t sub_1DE223898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  return sub_1DE223214((uint64_t)va);
}

uint64_t sub_1DE2238A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  return sub_1DE223214((uint64_t)va);
}

uint64_t sub_1DE2238A8()
{
  return swift_getAssociatedTypeWitness();
}

_BYTE *initializeBufferWithCopyOfBuffer for SubstitutingVisitorError(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SubstitutingVisitorError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SubstitutingVisitorError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DE223994 + 4 * byte_1DE2279B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1DE2239C8 + 4 * byte_1DE2279B0[v4]))();
}

uint64_t sub_1DE2239C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DE2239D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DE2239D8);
  return result;
}

uint64_t sub_1DE2239E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DE2239ECLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1DE2239F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DE2239F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DE223A04(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1DE223A0C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SubstitutingVisitorError()
{
  return &type metadata for SubstitutingVisitorError;
}

uint64_t sub_1DE223A28()
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

uint64_t *sub_1DE223AA0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v11 = v10[1];
    v12 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v12 = *v10;
    v12[1] = v11;
  }
  swift_retain();
  return v4;
}

uint64_t sub_1DE223B50(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
  return swift_release();
}

uint64_t sub_1DE223B90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  swift_retain();
  return a1;
}

uint64_t sub_1DE223BF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1DE223C5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1DE223CB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_1DE223D1C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v13;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(_QWORD *)(v5 + 64);
  if (v7 >= a2)
  {
    if (v6 < 0x7FFFFFFF)
    {
      v13 = *(_QWORD *)((a1 + v8 + 7) & 0xFFFFFFFFFFFFF8);
      if (v13 >= 0xFFFFFFFF)
        LODWORD(v13) = -1;
      return (v13 + 1);
    }
    else
    {
      return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(a1, v6, v4);
    }
  }
  else
  {
    if (((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v7 + 1;
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
    return ((uint64_t (*)(void))((char *)&loc_1DE223D98 + 4 * byte_1DE2279BA[v11]))();
  }
}

void sub_1DE223E18(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0u;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
  }
  if (a2 > v6)
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      v10 = ~v6 + a2;
      bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
      *a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t sub_1DE223F04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _QWORD *v8;
  uint64_t v9;

  *(_BYTE *)(v5 + v6) = 0;
  if ((_DWORD)a2)
  {
    if (a3 < 0x7FFFFFFF)
    {
      v8 = (_QWORD *)((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
      if ((a2 & 0x80000000) != 0)
      {
        v9 = a2 ^ 0x80000000;
        v8[1] = 0;
      }
      else
      {
        v9 = (a2 - 1);
      }
      *v8 = v9;
    }
    else
    {
      return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v5, a2, a3, a4);
    }
  }
  return result;
}

void type metadata accessor for SubstitutingVisitor()
{
  JUMPOUT(0x1DF0EA560);
}

unint64_t sub_1DE223FA4()
{
  unint64_t result;

  result = qword_1F0439080;
  if (!qword_1F0439080)
  {
    result = MEMORY[0x1DF0EA5C0](&unk_1DE227A58, &type metadata for SubstitutingVisitorError);
    atomic_store(result, (unint64_t *)&qword_1F0439080);
  }
  return result;
}

void sub_1DE223FE0(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1, a2);
  type metadata accessor for SubstitutingVisitor();
}

uint64_t sub_1DE224044(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v4 = (_QWORD *)(v3 + *(int *)(result + 52));
  *v4 = v2;
  v4[1] = v1;
  return result;
}

uint64_t sub_1DE22406C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _BYTE *v11;
  uint64_t v13;

  v5 = *(_QWORD *)(a1 + 24);
  v6 = type metadata accessor for Optional();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v13 - v9;
  (*(void (**)(uint64_t))(v2 + *(int *)(a1 + 52)))(v8);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v10, 1, v5) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, v10, v5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  sub_1DE20C030();
  swift_allocError();
  *v11 = 0;
  return swift_willThrow();
}

void sub_1DE224170(uint64_t a1)
{
  MEMORY[0x1E0C80A78](a1);
  type metadata accessor for SubstitutingVisitor();
}

uint64_t sub_1DE2241F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v15;

  MEMORY[0x1E0C80A78](a1);
  v9 = (char *)&v15 - v8;
  if (v1 != v5)
  {
    *(_QWORD *)(v6 - 144) = v7;
    v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    v11 = *(_QWORD *)(v6 - 128);
    *(_QWORD *)(v6 - 160) = v10;
    v10(v4, v11, v5);
    *(_QWORD *)(v6 - 152) = v3;
    sub_1DE223FE0(v4, v5, (uint64_t)v9);
  }
  *(_QWORD *)(v6 - 88) = v5;
  v12 = sub_1DE2086E8((uint64_t *)(v6 - 112));
  v13 = *(_QWORD *)(v6 - 120);
  sub_1DE22406C(v3, (uint64_t)v12);
  if (v13)
    return sub_1DE225354(v6 - 112);
  sub_1DE2253C0(*(_QWORD *)(v6 - 136), v6 - 112);
  return sub_1DE223214(v6 - 112);
}

uint64_t sub_1DE2243B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  Swift::Int v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 *v13;
  uint64_t v14;
  _QWORD v15[4];
  uint64_t v16;

  v14 = a2;
  v16 = static Array._allocateUninitialized(_:)();
  v8 = MEMORY[0x1DF0E9F30](a1, a4);
  v9 = type metadata accessor for Array();
  Array.reserveCapacity(_:)(v8);
  v13 = &v12;
  v15[0] = a1;
  MEMORY[0x1E0C80A78](v10);
  v12 = *(_OWORD *)(a3 + 32);
  MEMORY[0x1DF0EA5C0](MEMORY[0x1E0DEAF38], v9);
  Sequence.forEach(_:)();
  if (!v4)
  {
    v15[3] = v9;
    v15[0] = v16;
    swift_bridgeObjectRetain();
    sub_1DE2253C0(v14, (uint64_t)v15);
    sub_1DE223214((uint64_t)v15);
  }
  return swift_bridgeObjectRelease();
}

void sub_1DE22459C(uint64_t a1)
{
  uint64_t v1;

  v1 = MEMORY[0x1E0C80A78](a1);
  MEMORY[0x1E0C80A78](v1);
  type metadata accessor for SubstitutingVisitor();
}

uint64_t sub_1DE224638(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = sub_1DE22406C(a1, v2);
  if (!v1)
  {
    swift_dynamicCast();
    type metadata accessor for Array();
    return Array.append(_:)();
  }
  return result;
}

void sub_1DE2246A0(uint64_t a1)
{
  MEMORY[0x1E0C80A78](a1);
  type metadata accessor for SubstitutingVisitor();
}

void sub_1DE224724(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v7 - 120) = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  *(_QWORD *)(v7 - 160) = v8;
  v8(v4, v5, v3);
  *(_QWORD *)(v7 - 112) = *(_QWORD *)(v7 - 144);
  *(_QWORD *)(v7 - 104) = v1;
  *(_QWORD *)(v7 - 96) = *(_QWORD *)(v7 - 136);
  *(_QWORD *)(v7 - 88) = v6;
  type metadata accessor for SubstitutingVisitor();
}

void sub_1DE22478C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1DE223FE0(v1, v0, v2);
}

uint64_t sub_1DE2247BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_retain();
  MEMORY[0x1DF0EA5C0](&unk_1DE227AC0, v2);
  v5 = *(_QWORD *)(v4 - 72);
  dispatch thunk of Message.traverse<A>(visitor:)();
  if (!v5)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 - 160))(v1, v3, v0);
    type metadata accessor for Array();
    Array.append(_:)();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 120) + 8))(v3, v2);
}

uint64_t sub_1DE224860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  uint64_t v22;

  v18 = a2;
  v19 = a8;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  MEMORY[0x1DF0E9E40](a1, AssociatedTypeWitness, a5, AssociatedConformanceWitness);
  v22 = Dictionary.init(minimumCapacity:)();
  v17[1] = v17;
  v21[0] = a1;
  v12 = MEMORY[0x1E0C80A78](v22);
  MEMORY[0x1E0C80A78](v12);
  v13 = type metadata accessor for Dictionary();
  MEMORY[0x1DF0EA5C0](MEMORY[0x1E0DEA0D0], v13);
  v14 = v20;
  Sequence.forEach(_:)();
  if (!v14)
  {
    v15 = v22;
    type metadata accessor for Dictionary();
    v21[3] = v13;
    v21[0] = v15;
    swift_bridgeObjectRetain();
    sub_1DE2253C0(v18, (uint64_t)v21);
    sub_1DE223214((uint64_t)v21);
  }
  return swift_bridgeObjectRelease();
}

void sub_1DE224B60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t AssociatedTypeWitness;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v20 = a5;
  v21 = a4;
  v18[2] = a3;
  v19 = a10;
  MEMORY[0x1E0C80A78](a1);
  v18[1] = v13;
  v14 = type metadata accessor for Optional();
  MEMORY[0x1E0C80A78](v14);
  v18[0] = a7;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v16 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)v18 - v17, a1, AssociatedTypeWitness);
  v22 = v20;
  v23 = a6;
  v24 = a9;
  v25 = v19;
  type metadata accessor for SubstitutingVisitor();
}

uint64_t sub_1DE224C88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v7 = *(_QWORD *)(v6 - 72);
  sub_1DE22406C(a1, v1);
  if (v7)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v5, v4);
  v9 = *(_QWORD *)(v6 - 152);
  swift_dynamicCast();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v3, 0, 1, v9);
  swift_getAssociatedConformanceWitness();
  type metadata accessor for Dictionary();
  return Dictionary.subscript.setter();
}

uint64_t sub_1DE224D50(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t TupleTypeMetadata2;

  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(a1, a1 + *(int *)(TupleTypeMetadata2 + 48));
}

void sub_1DE224DE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t AssociatedTypeWitness;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v27 = a5;
  v28 = a3;
  v22 = a1;
  v25 = a4;
  v26 = a9;
  v15 = type metadata accessor for Optional();
  MEMORY[0x1E0C80A78](v15);
  v23 = (char *)v19 - v16;
  v21 = *(_QWORD *)(a11 + 8);
  v24 = a7;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v19[1] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v17 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v19[2] = (char *)v19 - v18;
  MEMORY[0x1E0C80A78](v17);
  v29 = a8;
  v30 = a6;
  v31 = a12;
  v32 = a10;
  type metadata accessor for SubstitutingVisitor();
}

void sub_1DE224F00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v7 - 128) = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  *(_QWORD *)(v7 - 224) = v8;
  v8(v3, v1, v2);
  *(_QWORD *)(v7 - 120) = *(_QWORD *)(v7 - 144);
  *(_QWORD *)(v7 - 112) = v4;
  *(_QWORD *)(v7 - 104) = *(_QWORD *)(v7 - 152);
  *(_QWORD *)(v7 - 96) = v6;
  type metadata accessor for SubstitutingVisitor();
}

void sub_1DE224F64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1DE223FE0(v2, v1, v0);
}

uint64_t sub_1DE224F94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_retain();
  MEMORY[0x1DF0EA5C0](&unk_1DE227AC0, v2);
  v4 = *(_QWORD *)(v3 - 72);
  dispatch thunk of Message.traverse<A>(visitor:)();
  if (!v4)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v3 - 216) + 16))(*(_QWORD *)(v3 - 208), *(_QWORD *)(v3 - 184), *(_QWORD *)(v3 - 200));
    v5 = *(_QWORD *)(v3 - 176);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 - 224))(v5, v0, v1);
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v5, 0, 1, v1);
    swift_getAssociatedConformanceWitness();
    type metadata accessor for Dictionary();
    Dictionary.subscript.setter();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 128) + 8))(v0, v2);
}

BOOL sub_1DE225098(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_1DE2250A8(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

Swift::Int sub_1DE2250CC(char a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

BOOL sub_1DE225110(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1DE225098(*a1, *a2);
}

Swift::Int sub_1DE22511C()
{
  char *v0;

  return sub_1DE2250CC(*v0);
}

void sub_1DE225124(uint64_t a1)
{
  char *v1;

  sub_1DE2250A8(a1, *v1);
}

Swift::Int sub_1DE22512C()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1DE22516C(uint64_t a1)
{
  sub_1DE224170(a1);
}

uint64_t sub_1DE225180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1DE2243B0(a1, a2, a3, a4);
}

uint64_t sub_1DE225194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1DE224860(a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_1DE2251A8()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_1DE225200(uint64_t a1)
{
  sub_1DE22516C(a1);
}

uint64_t sub_1DE225224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1DE225180(a1, a2, a5, a3);
}

uint64_t sub_1DE225248(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1DE225194(a1, a2, a8, a3, a4, a5, a6, a7);
}

void sub_1DE225278()
{
  sub_1DE2251A8();
}

void sub_1DE225284()
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

  sub_1DE225388();
  sub_1DE224DE4(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_1DE2252A4(uint64_t a1)
{
  return sub_1DE2252D8(a1);
}

void sub_1DE2252B8()
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

  sub_1DE225388();
  sub_1DE224B60(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_1DE2252D8(uint64_t a1)
{
  uint64_t v1;

  return sub_1DE224D50(a1, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 88));
}

void sub_1DE225314()
{
  uint64_t v0;

  sub_1DE2253A8();
  sub_1DE2246A0(v0);
}

void sub_1DE225334()
{
  uint64_t v0;

  sub_1DE2253A8();
  sub_1DE22459C(v0);
}

uint64_t sub_1DE225354(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x1DF0EA668);
  return result;
}

__n128 sub_1DE225388()
{
  __n128 *v0;

  return v0[3];
}

uint64_t sub_1DE2253C0(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _BYTE v7[32];
  _OWORD v8[3];

  sub_1DE223190(a2, (uint64_t)v7);
  v5 = 0u;
  v6 = 0u;
  *(_QWORD *)&v4 = a1;
  BYTE8(v4) = 0;
  sub_1DE22546C((uint64_t)v7, (uint64_t)&v5);
  v8[0] = v4;
  v8[1] = v5;
  v8[2] = v6;
  sub_1DE2254B4();
  dispatch thunk of Message.decodeMessage<A>(decoder:)();
  return sub_1DE2254F0((uint64_t)v8);
}

uint64_t sub_1DE22546C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1DE1FFE88(qword_1EDB81A50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_1DE2254B4()
{
  unint64_t result;

  result = qword_1EDB81A48;
  if (!qword_1EDB81A48)
  {
    result = MEMORY[0x1DF0EA5C0](&unk_1DE227740, &type metadata for OneFieldDecoder);
    atomic_store(result, (unint64_t *)&qword_1EDB81A48);
  }
  return result;
}

uint64_t sub_1DE2254F0(uint64_t a1)
{
  destroy for OneFieldDecoder(a1);
  return a1;
}

uint64_t _BridgedStoredNSError._getEmbeddedNSError()()
{
  return MEMORY[0x1E0CAF8D8]();
}

uint64_t _BridgedStoredNSError.init(_bridgedNSError:)()
{
  return MEMORY[0x1E0CAF8E8]();
}

uint64_t _BridgedStoredNSError.errorUserInfo.getter()
{
  return MEMORY[0x1E0CAF8F8]();
}

uint64_t static _BridgedStoredNSError.== infix(_:_:)()
{
  return MEMORY[0x1E0CAF900]();
}

uint64_t _BridgedStoredNSError.hash(into:)()
{
  return MEMORY[0x1E0CAF920]();
}

uint64_t _BridgedStoredNSError.errorCode.getter()
{
  return MEMORY[0x1E0CAF930]();
}

uint64_t _BridgedStoredNSError.init(_:userInfo:)()
{
  return MEMORY[0x1E0CAF940]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x1E0CAF990]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x1E0CAFE38](retstr);
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t Data.InlineData.init(_:)()
{
  return MEMORY[0x1E0CB0080]();
}

uint64_t Data.LargeSlice.init(_:)()
{
  return MEMORY[0x1E0CB0098]();
}

uint64_t Data.InlineSlice.init(_:)()
{
  return MEMORY[0x1E0CB00F8]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x1E0CB01F0]();
}

uint64_t static Data.== infix(_:_:)()
{
  return MEMORY[0x1E0CB0218]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t static Google_Protobuf_Any.== infix(_:_:)()
{
  return MEMORY[0x1E0D3E7F0]();
}

uint64_t Google_Protobuf_Any.init()()
{
  return MEMORY[0x1E0D3E820]();
}

uint64_t type metadata accessor for Google_Protobuf_Any()
{
  return MEMORY[0x1E0D3E828]();
}

uint64_t type metadata accessor for Google_Protobuf_Empty()
{
  return MEMORY[0x1E0D3E858]();
}

uint64_t UnknownStorage.traverse<A>(visitor:)()
{
  return MEMORY[0x1E0D3E988]();
}

uint64_t UnknownStorage.init()()
{
  return MEMORY[0x1E0D3E990]();
}

uint64_t type metadata accessor for UnknownStorage()
{
  return MEMORY[0x1E0D3E998]();
}

uint64_t BinaryDecodingOptions.init()()
{
  return MEMORY[0x1E0D3EA60]();
}

uint64_t type metadata accessor for BinaryDecodingOptions()
{
  return MEMORY[0x1E0D3EA68]();
}

uint64_t _MessageImplementationBase._protobuf_generated_isEqualTo(other:)()
{
  return MEMORY[0x1E0D3EA80]();
}

uint64_t _MessageImplementationBase.isEqualTo(message:)()
{
  return MEMORY[0x1E0D3EA90]();
}

uint64_t dispatch thunk of Decoder.nextFieldNumber()()
{
  return MEMORY[0x1E0D3EAB8]();
}

uint64_t dispatch thunk of Decoder.handleConflictingOneOf()()
{
  return MEMORY[0x1E0D3EAC0]();
}

uint64_t dispatch thunk of Decoder.decodeSingularBytesField(value:)()
{
  return MEMORY[0x1E0D3EB10]();
}

uint64_t dispatch thunk of Decoder.decodeSingularStringField(value:)()
{
  return MEMORY[0x1E0D3EB88]();
}

uint64_t dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)()
{
  return MEMORY[0x1E0D3EBD8]();
}

uint64_t Decoder.decodeExtensionFieldsAsMessageSet(values:messageType:)()
{
  return MEMORY[0x1E0D3EBE8]();
}

uint64_t dispatch thunk of Message.decodeMessage<A>(decoder:)()
{
  return MEMORY[0x1E0D3EC00]();
}

uint64_t dispatch thunk of Message.traverse<A>(visitor:)()
{
  return MEMORY[0x1E0D3EC08]();
}

uint64_t Message.isInitialized.getter()
{
  return MEMORY[0x1E0D3EC48]();
}

uint64_t Message.init(serializedData:extensions:partial:options:)()
{
  return MEMORY[0x1E0D3EC50]();
}

uint64_t Message.serializedData(partial:)()
{
  return MEMORY[0x1E0D3EC58]();
}

uint64_t Message.debugDescription.getter()
{
  return MEMORY[0x1E0D3EC68]();
}

uint64_t Message.hash(into:)()
{
  return MEMORY[0x1E0D3EC80]();
}

uint64_t static Message.with(_:)()
{
  return MEMORY[0x1E0D3EC88]();
}

uint64_t dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)()
{
  return MEMORY[0x1E0D3ED28]();
}

uint64_t dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)()
{
  return MEMORY[0x1E0D3ED68]();
}

uint64_t dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)()
{
  return MEMORY[0x1E0D3ED98]();
}

uint64_t Visitor.visitExtensionFieldsAsMessageSet(fields:start:end:)()
{
  return MEMORY[0x1E0D3EF00]();
}

uint64_t type metadata accessor for _NameMap.NameDescription()
{
  return MEMORY[0x1E0D3EF28]();
}

uint64_t _NameMap.init(dictionaryLiteral:)()
{
  return MEMORY[0x1E0D3EF38]();
}

uint64_t type metadata accessor for _NameMap()
{
  return MEMORY[0x1E0D3EF48]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t CKActivityCreate(_:dso:)()
{
  return MEMORY[0x1E0C94598]();
}

uint64_t CKLogDistributedSync.getter()
{
  return MEMORY[0x1E0C945A8]();
}

uint64_t CKOperationSignpostEnd(_:_:error:)()
{
  return MEMORY[0x1E0C945B8]();
}

uint64_t CKOperationSignpostBegin(_:_:)()
{
  return MEMORY[0x1E0C945C0]();
}

uint64_t CKLog.getter()
{
  return MEMORY[0x1E0C945E0]();
}

uint64_t related decl 'e' for CKErrorCode.init(_:description:)()
{
  return MEMORY[0x1E0C945F0]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x1E0CB17D8]();
}

uint64_t Dictionary.init(minimumCapacity:)()
{
  return MEMORY[0x1E0DE9E58]();
}

uint64_t Dictionary.count.getter()
{
  return MEMORY[0x1E0DE9F38]();
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x1E0DEA568]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x1E0CB1940]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1E0DEA758]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x1E0DEA800](a1._countAndFlagsBits, a1._object);
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x1E0DEAB40]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x1E0CB1AC0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t Array.startIndex.getter()
{
  return MEMORY[0x1E0DEADA8]();
}

uint64_t static Array._adoptStorage(_:count:)()
{
  return MEMORY[0x1E0DEADC0]();
}

uint64_t Array._checkSubscript(_:wasNativeTypeChecked:)()
{
  return MEMORY[0x1E0DEADC8]();
}

Swift::Void __swiftcall Array.reserveCapacity(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEADD8](a1);
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x1E0DEAE28]();
}

Swift::Bool __swiftcall Array._hoistableIsNativeTypeChecked()()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t Array.endIndex.getter()
{
  return MEMORY[0x1E0DEAE98]();
}

Swift::Void __swiftcall Array.formIndex(after:)(Swift::Int *after)
{
  MEMORY[0x1E0DEAEA8](after);
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t AsyncStream.Continuation.onTermination.setter()
{
  return MEMORY[0x1E0DF07A0]();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t AsyncStream.Iterator.next()()
{
  return MEMORY[0x1E0DF0810]();
}

uint64_t AsyncStream.init(_:bufferingPolicy:_:)()
{
  return MEMORY[0x1E0DF0840]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x1E0DEB620]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t CKRecord.subscript.getter()
{
  return MEMORY[0x1E0C94678]();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x1E0DEFCD8](seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t NSObject.hashValue.getter()
{
  return MEMORY[0x1E0DEFCF0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x1E0DEBE50]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEC2A8](a1);
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1E0DEC3E0]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x1E0DECAE0](isUnique, capacity);
}

uint64_t _NativeDictionary._delete(at:)()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECBE0]();
}

{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t type metadata accessor for _ContiguousArrayStorage()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x1E0DED550]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t withCheckedThrowingContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t Error<>._code.getter()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t Error<>._domain.getter()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t Error.ckIsPartialError.getter()
{
  return MEMORY[0x1E0C94688]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1E0DEDEF8]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x1E0DEDF10](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t type metadata accessor for Result()
{
  return MEMORY[0x1E0DEE030]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1E0DEED90]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

