unint64_t NFCWindowSceneEvent.description.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000016;
  else
    return 0xD000000000000013;
}

BOOL static NFCWindowSceneEvent.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t NFCWindowSceneEvent.hash(into:)()
{
  return sub_23557E44C();
}

BOOL sub_23557D0DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23557D0F8()
{
  return sub_23557E44C();
}

uint64_t sub_23557D124()
{
  _BYTE *v0;

  if (*v0)
    return 0x61746E6573657270;
  else
    return 0x6544726564616572;
}

uint64_t sub_23557D174@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23557E120(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23557D198()
{
  return 0;
}

void sub_23557D1A4(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23557D1B0()
{
  sub_23557D51C();
  return sub_23557E47C();
}

uint64_t sub_23557D1D8()
{
  sub_23557D51C();
  return sub_23557E488();
}

uint64_t sub_23557D200()
{
  return 0;
}

uint64_t sub_23557D20C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_23557D238(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23557D244()
{
  sub_23557D560();
  return sub_23557E47C();
}

uint64_t sub_23557D26C()
{
  sub_23557D560();
  return sub_23557E488();
}

uint64_t sub_23557D294()
{
  sub_23557D5A4();
  return sub_23557E47C();
}

uint64_t sub_23557D2BC()
{
  sub_23557D5A4();
  return sub_23557E488();
}

uint64_t NFCWindowSceneEvent.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562477B0);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562477B8);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562477C0);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23557D51C();
  sub_23557E470();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23557D560();
    sub_23557E428();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23557D5A4();
    sub_23557E428();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7CE338]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23557D51C()
{
  unint64_t result;

  result = qword_2562477C8;
  if (!qword_2562477C8)
  {
    result = MEMORY[0x23B7CE344](&unk_23557E958, &type metadata for NFCWindowSceneEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2562477C8);
  }
  return result;
}

unint64_t sub_23557D560()
{
  unint64_t result;

  result = qword_2562477D0;
  if (!qword_2562477D0)
  {
    result = MEMORY[0x23B7CE344](&unk_23557E908, &type metadata for NFCWindowSceneEvent.PresentationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2562477D0);
  }
  return result;
}

unint64_t sub_23557D5A4()
{
  unint64_t result;

  result = qword_2562477D8;
  if (!qword_2562477D8)
  {
    result = MEMORY[0x23B7CE344](&unk_23557E8B8, &type metadata for NFCWindowSceneEvent.ReaderDetectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2562477D8);
  }
  return result;
}

uint64_t NFCWindowSceneEvent.hashValue.getter()
{
  sub_23557E440();
  sub_23557E44C();
  return sub_23557E458();
}

uint64_t NFCWindowSceneEvent.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;

  v30 = a2;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562477E0);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8]();
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562477E8);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562477F0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23557D51C();
  v11 = v33;
  sub_23557E464();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23557E41C();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23557E3F8();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2562477F8);
    *v21 = &type metadata for NFCWindowSceneEvent;
    sub_23557E410();
    sub_23557E3EC();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v15);
    a1 = v27;
LABEL_7:
    v24 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v24);
  }
  v16 = *(_BYTE *)(v14 + 32);
  if ((v16 & 1) != 0)
  {
    LODWORD(v28) = *(unsigned __int8 *)(v14 + 32);
    v35 = 1;
    sub_23557D560();
    sub_23557E404();
    v17 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v12, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v15);
    v16 = v28;
  }
  else
  {
    v34 = 0;
    sub_23557D5A4();
    v22 = v6;
    sub_23557E404();
    v23 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v15);
  }
  *v18 = v16;
  v24 = (uint64_t)v27;
  return __swift_destroy_boxed_opaque_existential_1(v24);
}

uint64_t sub_23557D984()
{
  sub_23557E440();
  sub_23557E44C();
  return sub_23557E458();
}

uint64_t sub_23557D9C8()
{
  sub_23557E440();
  sub_23557E44C();
  return sub_23557E458();
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

uint64_t sub_23557DA28@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return NFCWindowSceneEvent.init(from:)(a1, a2);
}

uint64_t sub_23557DA3C(_QWORD *a1)
{
  return NFCWindowSceneEvent.encode(to:)(a1);
}

unint64_t sub_23557DA50()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000016;
  else
    return 0xD000000000000013;
}

uint64_t UISceneConnectionOptions.nfcEvent.getter()
{
  sub_23557DACC();
  return sub_23557E3E0();
}

unint64_t sub_23557DACC()
{
  unint64_t result;

  result = qword_256247800;
  if (!qword_256247800)
  {
    result = MEMORY[0x23B7CE344](&unk_23557E850, &type metadata for NFCEventSceneConnectionOptionDefinition);
    atomic_store(result, (unint64_t *)&qword_256247800);
  }
  return result;
}

uint64_t (*sub_23557DB10())@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_23557DB20;
}

uint64_t sub_23557DB20@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  __int128 v5[2];

  sub_23557E2A0(a1, (uint64_t)v5);
  v3 = swift_allocObject();
  sub_23557E308(v5, v3 + 16);
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = sub_23557E320;
  *(_QWORD *)(result + 24) = v3;
  *a2 = sub_23557E388;
  a2[1] = result;
  return result;
}

uint64_t sub_23557DB9C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v1 = a1[1];
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  swift_retain();
  sub_23557E3D4();
  return swift_release();
}

uint64_t NFCWindowSceneEvent.asBSAction()()
{
  sub_23557DACC();
  return sub_23557E3BC();
}

unint64_t sub_23557DC80()
{
  unint64_t result;

  result = qword_256247808;
  if (!qword_256247808)
  {
    result = MEMORY[0x23B7CE344](&protocol conformance descriptor for NFCWindowSceneEvent, &type metadata for NFCWindowSceneEvent);
    atomic_store(result, (unint64_t *)&qword_256247808);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for NFCWindowSceneEvent()
{
  return &type metadata for NFCWindowSceneEvent;
}

uint64_t dispatch thunk of NFCWindowSceneDelegate.windowScene(_:didReceiveNFCWindowSceneEvent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

ValueMetadata *type metadata accessor for NFCEventSceneConnectionOptionDefinition()
{
  return &type metadata for NFCEventSceneConnectionOptionDefinition;
}

uint64_t _s14_CoreNFC_UIKit19NFCWindowSceneEventOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s14_CoreNFC_UIKit19NFCWindowSceneEventOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23557DDE4 + 4 * byte_23557E545[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23557DE18 + 4 * byte_23557E540[v4]))();
}

uint64_t sub_23557DE18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23557DE20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23557DE28);
  return result;
}

uint64_t sub_23557DE34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23557DE3CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23557DE40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23557DE48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23557DE54(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23557DE5C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NFCWindowSceneEvent.CodingKeys()
{
  return &type metadata for NFCWindowSceneEvent.CodingKeys;
}

ValueMetadata *type metadata accessor for NFCWindowSceneEvent.ReaderDetectedCodingKeys()
{
  return &type metadata for NFCWindowSceneEvent.ReaderDetectedCodingKeys;
}

ValueMetadata *type metadata accessor for NFCWindowSceneEvent.PresentationCodingKeys()
{
  return &type metadata for NFCWindowSceneEvent.PresentationCodingKeys;
}

unint64_t sub_23557DE9C()
{
  unint64_t result;

  result = qword_256247810;
  if (!qword_256247810)
  {
    result = MEMORY[0x23B7CE344](&unk_23557E828, &type metadata for NFCWindowSceneEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256247810);
  }
  return result;
}

unint64_t sub_23557DEE4()
{
  unint64_t result;

  result = qword_256247818;
  if (!qword_256247818)
  {
    result = MEMORY[0x23B7CE344](&protocol conformance descriptor for NFCWindowSceneEvent, &type metadata for NFCWindowSceneEvent);
    atomic_store(result, (unint64_t *)&qword_256247818);
  }
  return result;
}

unint64_t sub_23557DF2C()
{
  unint64_t result;

  result = qword_256247820;
  if (!qword_256247820)
  {
    result = MEMORY[0x23B7CE344](&protocol conformance descriptor for NFCWindowSceneEvent, &type metadata for NFCWindowSceneEvent);
    atomic_store(result, (unint64_t *)&qword_256247820);
  }
  return result;
}

unint64_t sub_23557DF74()
{
  unint64_t result;

  result = qword_256247828;
  if (!qword_256247828)
  {
    result = MEMORY[0x23B7CE344](&unk_23557E748, &type metadata for NFCWindowSceneEvent.ReaderDetectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256247828);
  }
  return result;
}

unint64_t sub_23557DFBC()
{
  unint64_t result;

  result = qword_256247830;
  if (!qword_256247830)
  {
    result = MEMORY[0x23B7CE344](&unk_23557E770, &type metadata for NFCWindowSceneEvent.ReaderDetectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256247830);
  }
  return result;
}

unint64_t sub_23557E004()
{
  unint64_t result;

  result = qword_256247838;
  if (!qword_256247838)
  {
    result = MEMORY[0x23B7CE344](&unk_23557E6F8, &type metadata for NFCWindowSceneEvent.PresentationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256247838);
  }
  return result;
}

unint64_t sub_23557E04C()
{
  unint64_t result;

  result = qword_256247840;
  if (!qword_256247840)
  {
    result = MEMORY[0x23B7CE344](&unk_23557E720, &type metadata for NFCWindowSceneEvent.PresentationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256247840);
  }
  return result;
}

unint64_t sub_23557E094()
{
  unint64_t result;

  result = qword_256247848;
  if (!qword_256247848)
  {
    result = MEMORY[0x23B7CE344](&unk_23557E798, &type metadata for NFCWindowSceneEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256247848);
  }
  return result;
}

unint64_t sub_23557E0DC()
{
  unint64_t result;

  result = qword_256247850;
  if (!qword_256247850)
  {
    result = MEMORY[0x23B7CE344](&unk_23557E7C0, &type metadata for NFCWindowSceneEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256247850);
  }
  return result;
}

uint64_t sub_23557E120(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6544726564616572 && a2 == 0xEE00646574636574;
  if (v2 || (sub_23557E434() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x61746E6573657270 && a2 == 0xEC0000006E6F6974)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23557E434();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23557E24C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23557E270(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_23557E2A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23557E2E4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_23557E308(__int128 *a1, uint64_t a2)
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

uint64_t sub_23557E320(uint64_t a1, char *a2)
{
  _QWORD *v2;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v4 = *a2;
  v5 = v2[5];
  v6 = v2[6];
  __swift_project_boxed_opaque_existential_1(v2 + 2, v5);
  v8 = v4;
  return (*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t))(v6 + 8))(a1, &v8, v5, v6);
}

uint64_t sub_23557E388(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_23557E3BC()
{
  return MEMORY[0x24BEBC9A8]();
}

uint64_t sub_23557E3C8()
{
  return MEMORY[0x24BEBC9B0]();
}

uint64_t sub_23557E3D4()
{
  return MEMORY[0x24BEBC9B8]();
}

uint64_t sub_23557E3E0()
{
  return MEMORY[0x24BEBCDD0]();
}

uint64_t sub_23557E3EC()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23557E3F8()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23557E404()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23557E410()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23557E41C()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23557E428()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23557E434()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23557E440()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23557E44C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23557E458()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23557E464()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23557E470()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23557E47C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23557E488()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

