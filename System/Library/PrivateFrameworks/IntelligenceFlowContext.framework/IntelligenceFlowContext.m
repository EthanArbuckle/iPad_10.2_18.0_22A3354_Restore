uint64_t UIContextCacheRepresentation.hierarchy.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  sub_23F2C48C0();
  return v1;
}

uint64_t UIContextCacheRepresentation.elements.getter()
{
  return swift_bridgeObjectRetain();
}

IntelligenceFlowContext::UIContextCacheRepresentation __swiftcall UIContextCacheRepresentation.init(hierarchy:elements:)(Swift::String_optional hierarchy, Swift::OpaquePointer elements)
{
  uint64_t v2;
  IntelligenceFlowContext::UIContextCacheRepresentation result;

  *(Swift::String_optional *)v2 = hierarchy;
  *(Swift::OpaquePointer *)(v2 + 16) = elements;
  result.hierarchy = hierarchy;
  result.elements = elements;
  return result;
}

BOOL sub_23F2C3B70(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_23F2C3B80()
{
  return sub_23F2DFC80();
}

uint64_t sub_23F2C3BA4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x6863726172656968 && a2 == 0xE900000000000079;
  if (v2 || (sub_23F2DFC5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73746E656D656C65 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_23F2DFC5C();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23F2C3C9C()
{
  return 2;
}

uint64_t sub_23F2C3CA4()
{
  sub_23F2DFC74();
  sub_23F2DFC80();
  return sub_23F2DFC98();
}

uint64_t sub_23F2C3CE8()
{
  return 0;
}

uint64_t sub_23F2C3CF4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x73746E656D656C65;
  else
    return 0x6863726172656968;
}

BOOL sub_23F2C3D30(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23F2C3B70(*a1, *a2);
}

uint64_t sub_23F2C3D3C()
{
  return sub_23F2C3CA4();
}

uint64_t sub_23F2C3D44()
{
  return sub_23F2C3B80();
}

uint64_t sub_23F2C3D4C()
{
  sub_23F2DFC74();
  sub_23F2DFC80();
  return sub_23F2DFC98();
}

uint64_t sub_23F2C3D8C()
{
  char *v0;

  return sub_23F2C3CF4(*v0);
}

uint64_t sub_23F2C3D94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2C3BA4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F2C3DB8()
{
  return sub_23F2C3CE8();
}

uint64_t sub_23F2C3DD4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23F2C3C9C();
  *a1 = result;
  return result;
}

uint64_t sub_23F2C3DF8()
{
  sub_23F2C4004();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2C3E20()
{
  sub_23F2C4004();
  return sub_23F2DFCC8();
}

void UIContextCacheRepresentation.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;

  v4 = sub_23F2C3FA0(&qword_256E619D0);
  v9 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 16);
  sub_23F2C3FE0(a1, a1[3]);
  sub_23F2C4004();
  sub_23F2DFCB0();
  v12 = 0;
  sub_23F2DFC14();
  if (!v2)
  {
    v10 = v8;
    v11 = 1;
    sub_23F2C3FA0(qword_254344B60);
    sub_23F2C4274(&qword_256E619E0, (uint64_t (*)(void))sub_23F2C4084, MEMORY[0x24BEE12A0]);
    sub_23F2DFC44();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v4);
  sub_23F2C4890();
}

uint64_t sub_23F2C3FA0(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426678D4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *sub_23F2C3FE0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23F2C4004()
{
  unint64_t result;

  result = qword_256E619D8;
  if (!qword_256E619D8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E00FC, &type metadata for UIContextCacheRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E619D8);
  }
  return result;
}

uint64_t sub_23F2C4040(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426678E0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23F2C4084()
{
  unint64_t result;

  result = qword_256E619E8;
  if (!qword_256E619E8)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for UIContextElement, &type metadata for UIContextElement);
    atomic_store(result, (unint64_t *)&qword_256E619E8);
  }
  return result;
}

void UIContextCacheRepresentation.init(from:)(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_23F2C3FA0(&qword_256E619F0);
  MEMORY[0x24BDAC7A8]();
  sub_23F2C3FE0(a1, a1[3]);
  sub_23F2C4004();
  sub_23F2DFCA4();
  if (v2)
  {
    sub_23F2C48B8();
  }
  else
  {
    v5 = sub_23F2DFBC0();
    v7 = v6;
    sub_23F2C3FA0(qword_254344B60);
    sub_23F2C4274(&qword_254344BA8, (uint64_t (*)(void))sub_23F2C42DC, MEMORY[0x24BEE12D0]);
    swift_bridgeObjectRetain();
    sub_23F2DFBF0();
    sub_23F2C48A8();
    *a2 = v5;
    a2[1] = v7;
    a2[2] = v8;
    sub_23F2C48C0();
    sub_23F2C48B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_23F2C4890();
}

uint64_t sub_23F2C4254(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23F2C4274(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = sub_23F2C4040(qword_254344B60);
    v8 = a2();
    result = MEMORY[0x2426678EC](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23F2C42DC()
{
  unint64_t result;

  result = qword_254344B90;
  if (!qword_254344B90)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for UIContextElement, &type metadata for UIContextElement);
    atomic_store(result, (unint64_t *)&qword_254344B90);
  }
  return result;
}

void sub_23F2C4318(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  UIContextCacheRepresentation.init(from:)(a1, a2);
}

void sub_23F2C432C(_QWORD *a1)
{
  UIContextCacheRepresentation.encode(to:)(a1);
}

uint64_t destroy for UIContextCacheRepresentation()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s23IntelligenceFlowContext28UIContextCacheRepresentationVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  sub_23F2C48C0();
  return a1;
}

_QWORD *assignWithCopy for UIContextCacheRepresentation(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for UIContextCacheRepresentation(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for UIContextCacheRepresentation(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UIContextCacheRepresentation(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UIContextCacheRepresentation(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for UIContextCacheRepresentation()
{
  return &type metadata for UIContextCacheRepresentation;
}

uint64_t initializeBufferWithCopyOfBuffer for DetectedPerson(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_23F2C4524(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_23F2C4530(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23F2C4550(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_23F2C4844(a1, &qword_256E619F8);
}

_BYTE *initializeBufferWithCopyOfBuffer for UIContextCacheRepresentation.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UIContextCacheRepresentation.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for UIContextCacheRepresentation.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23F2C4670 + 4 * byte_23F2DFF85[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23F2C46A4 + 4 * byte_23F2DFF80[v4]))();
}

uint64_t sub_23F2C46A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2C46AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F2C46B4);
  return result;
}

uint64_t sub_23F2C46C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F2C46C8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23F2C46CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2C46D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2C46E0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23F2C46EC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for UIContextCacheRepresentation.CodingKeys()
{
  return &type metadata for UIContextCacheRepresentation.CodingKeys;
}

unint64_t sub_23F2C470C()
{
  unint64_t result;

  result = qword_256E61A00;
  if (!qword_256E61A00)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E00D4, &type metadata for UIContextCacheRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61A00);
  }
  return result;
}

unint64_t sub_23F2C474C()
{
  unint64_t result;

  result = qword_256E61A08;
  if (!qword_256E61A08)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E0044, &type metadata for UIContextCacheRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61A08);
  }
  return result;
}

unint64_t sub_23F2C478C()
{
  unint64_t result;

  result = qword_256E61A10;
  if (!qword_256E61A10)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E006C, &type metadata for UIContextCacheRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61A10);
  }
  return result;
}

__n128 initializeWithTake for DetectedPhoneNumber(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23F2C47D4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23F2C47F4(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_23F2C4844(a1, &qword_256E61A18);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_23F2C4844(a1, &qword_256E61A20);
}

void sub_23F2C4844(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_23F2C48A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_23F2C48B8()
{
  uint64_t v0;

  return sub_23F2C4254(v0);
}

uint64_t sub_23F2C48C0()
{
  return swift_bridgeObjectRetain();
}

void ContextRetrieval.__allocating_init()()
{
  swift_allocObject();
  ContextRetrieval.init()();
  sub_23F2C53A4();
}

void ContextRetrieval.init()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  type metadata accessor for ContextClient();
  v1 = swift_allocObject();
  v0[2] = sub_23F2C5590(v1, v2);
  sub_23F2DF950();
  sub_23F2C5384();
  v0[3] = sub_23F2DF944();
  sub_23F2DF974();
  sub_23F2C5384();
  v0[4] = sub_23F2DF968();
  sub_23F2C53A4();
}

uint64_t ContextRetrieval.refresh(contextTypes:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return sub_23F2C52B4();
}

uint64_t sub_23F2C4974()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t (*v5)(void);

  v2 = v1[3];
  if (!v2)
  {
    sub_23F2C5320();
    if (!v0)
      goto LABEL_4;
LABEL_6:
    v5 = (uint64_t (*)(void))sub_23F2C53B8();
    return v5();
  }
  v1[2] = v2;
  sub_23F2C3FA0(&qword_256E61A30);
  sub_23F2C539C();
  v3 = sub_23F2C52C0();
  if (v0)
    goto LABEL_6;
  sub_23F2C50F0(v3, v4);
  sub_23F2C561C();
  sub_23F2C533C();
  sub_23F2C533C();
LABEL_4:
  v5 = (uint64_t (*)(void))v1[1];
  return v5();
}

uint64_t ContextRetrieval.refresh(contextTypes:interactionId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return sub_23F2C52B4();
}

uint64_t sub_23F2C4A34()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t (*v5)(void);

  v2 = v1[3];
  if (!v2)
  {
    sub_23F2C5320();
    if (!v0)
      goto LABEL_4;
LABEL_6:
    v5 = (uint64_t (*)(void))sub_23F2C53B8();
    return v5();
  }
  v1[2] = v2;
  sub_23F2C3FA0(&qword_256E61A30);
  sub_23F2C539C();
  v3 = sub_23F2C52C0();
  if (v0)
    goto LABEL_6;
  sub_23F2C50F0(v3, v4);
  sub_23F2C561C();
  sub_23F2C533C();
  sub_23F2C533C();
LABEL_4:
  v5 = (uint64_t (*)(void))v1[1];
  return v5();
}

uint64_t ContextRetrieval.refreshAndRetrieve(contextTypes:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return sub_23F2C52B4();
}

uint64_t sub_23F2C4B00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t (*v7)(void);

  v2 = *(_QWORD *)(v1 + 24);
  if (v2 && (*(_QWORD *)(v1 + 16) = v2, sub_23F2C3FA0(&qword_256E61A30), sub_23F2C539C(), sub_23F2C52C0(), v0))
  {
    v7 = (uint64_t (*)(void))sub_23F2C53B8();
    return v7();
  }
  else
  {
    sub_23F2C58DC();
    v4 = v3;
    v6 = v5;
    sub_23F2C3FA0(&qword_256E61A58);
    sub_23F2C518C();
    sub_23F2DF938();
    sub_23F2C5134(v4, v6);
    sub_23F2C5390();
    return (*(uint64_t (**)(_QWORD))(v1 + 8))(*(_QWORD *)(v1 + 16));
  }
}

uint64_t ContextRetrieval.retrieveContextValues(contextTypes:timeoutInSecs:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t result;
  void *v6;

  sub_23F2C3FA0(&qword_256E61A30);
  sub_23F2C5074();
  result = sub_23F2C5348();
  if (!v3)
  {
    if ((a3 & 1) != 0)
      v6 = 0;
    else
      v6 = (void *)sub_23F2DFB18();
    sub_23F2C5C4C();

    sub_23F2C3FA0(&qword_256E61A58);
    sub_23F2C536C();
    sub_23F2C5300();
    sub_23F2C53AC();
    sub_23F2C52D4();
    return a1;
  }
  return result;
}

uint64_t ContextRetrieval.retrieveContextValues(query:timeoutInSecs:)()
{
  return MEMORY[0x24BEE4AF8];
}

void ContextRetrieval.retrieveContextValues(query:)()
{
  uint64_t v0;

  sub_23F2C5A54();
  if (!v0)
  {
    sub_23F2C3FA0(&qword_256E61A58);
    sub_23F2C536C();
    sub_23F2C52E0();
    sub_23F2C535C();
  }
  sub_23F2C5374();
}

void ContextRetrieval.retrieveRequiredContextValues()()
{
  uint64_t v0;

  sub_23F2C5E44();
  if (!v0)
  {
    sub_23F2C3FA0(&qword_256E61A58);
    sub_23F2C536C();
    sub_23F2C52E0();
    sub_23F2C535C();
  }
  sub_23F2C5374();
}

uint64_t ContextRetrieval.retrieveAndRankContextValues(query:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_23F2C52B4();
}

uint64_t sub_23F2C4E0C()
{
  uint64_t v0;
  uint64_t v1;

  ContextRetrieval.retrieveContextValues(query:)();
  v1 = sub_23F2DFB0C();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

IntelligenceFlowContext::UIContextCacheRepresentation __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ContextRetrieval.dumpUIContextFromCache()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  __int128 v8;
  uint64_t v9;
  IntelligenceFlowContext::UIContextCacheRepresentation result;

  v2 = v0;
  v3 = sub_23F2C5EE8();
  if (!v1)
  {
    v6 = v3;
    v7 = (unint64_t)v4;
    sub_23F2C5244();
    sub_23F2DF938();
    v3 = sub_23F2C5134(v6, v7);
    *(_OWORD *)v2 = v8;
    *(_QWORD *)(v2 + 16) = v9;
  }
  result.elements._rawValue = v5;
  result.hierarchy.value._object = v4;
  result.hierarchy.value._countAndFlagsBits = v3;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ContextRetrieval.prewarm()()
{
  sub_23F2C561C();
}

uint64_t ContextRetrieval.retrieveContextValues(contextTypes:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  unint64_t v3;

  sub_23F2C3FA0(&qword_256E61A30);
  sub_23F2C5074();
  result = sub_23F2C5348();
  if (!v1)
  {
    sub_23F2C50F0(result, v3);
    sub_23F2C58DC();
    sub_23F2C52D4();
    sub_23F2C3FA0(&qword_256E61A58);
    sub_23F2C536C();
    sub_23F2C5300();
    sub_23F2C52D4();
    sub_23F2C53AC();
    return a1;
  }
  return result;
}

uint64_t ContextRetrieval.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t ContextRetrieval.__deallocating_deinit()
{
  ContextRetrieval.deinit();
  return swift_deallocClassInstance();
}

unint64_t sub_23F2C5074()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256E61A38;
  if (!qword_256E61A38)
  {
    v1 = sub_23F2C4040(&qword_256E61A30);
    sub_23F2C5208(&qword_256E61A40, MEMORY[0x24BE57320], MEMORY[0x24BE57330]);
    v3 = v2;
    result = MEMORY[0x2426678EC](MEMORY[0x24BEE12A0], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256E61A38);
  }
  return result;
}

uint64_t sub_23F2C50F0(uint64_t a1, unint64_t a2)
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

uint64_t sub_23F2C5134(uint64_t a1, unint64_t a2)
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

uint64_t sub_23F2C5178(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23F2C5134(a1, a2);
  return a1;
}

unint64_t sub_23F2C518C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256E61A60;
  if (!qword_256E61A60)
  {
    v1 = sub_23F2C4040(&qword_256E61A58);
    sub_23F2C5208(&qword_256E61A68, MEMORY[0x24BE577B0], MEMORY[0x24BE577D0]);
    v3 = v2;
    result = MEMORY[0x2426678EC](MEMORY[0x24BEE12D0], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256E61A60);
  }
  return result;
}

void sub_23F2C5208(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x2426678EC](a3, v5), a1);
  }
  sub_23F2C53A4();
}

unint64_t sub_23F2C5244()
{
  unint64_t result;

  result = qword_256E61A78;
  if (!qword_256E61A78)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for UIContextCacheRepresentation, &type metadata for UIContextCacheRepresentation);
    atomic_store(result, (unint64_t *)&qword_256E61A78);
  }
  return result;
}

uint64_t type metadata accessor for ContextRetrieval()
{
  return objc_opt_self();
}

uint64_t method lookup function for ContextRetrieval()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ContextRetrieval.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_23F2C52B4()
{
  return swift_task_switch();
}

uint64_t sub_23F2C52C0()
{
  return sub_23F2DF95C();
}

uint64_t sub_23F2C52D4()
{
  unint64_t v0;
  uint64_t v1;

  return sub_23F2C5134(v1, v0);
}

uint64_t sub_23F2C52E0()
{
  return sub_23F2DF938();
}

uint64_t sub_23F2C5300()
{
  return sub_23F2DF938();
}

void sub_23F2C5320()
{
  sub_23F2C561C();
}

uint64_t sub_23F2C533C()
{
  uint64_t v0;
  unint64_t v1;

  return sub_23F2C5134(v0, v1);
}

uint64_t sub_23F2C5348()
{
  return sub_23F2DF95C();
}

uint64_t sub_23F2C535C()
{
  uint64_t v0;
  unint64_t v1;

  return sub_23F2C5134(v0, v1);
}

unint64_t sub_23F2C536C()
{
  return sub_23F2C518C();
}

uint64_t sub_23F2C5384()
{
  return swift_allocObject();
}

uint64_t sub_23F2C5390()
{
  unint64_t v0;
  uint64_t v1;

  return sub_23F2C5178(v1, v0);
}

unint64_t sub_23F2C539C()
{
  return sub_23F2C5074();
}

uint64_t sub_23F2C53AC()
{
  uint64_t v0;
  unint64_t v1;

  return sub_23F2C5134(v0, v1);
}

uint64_t sub_23F2C53B8()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

void *sub_23F2C53C4()
{
  qword_256E61A80 = (uint64_t)&unk_256E6B260;
  return &unk_256E6B260;
}

id static ContextXPCService.interface.getter()
{
  if (qword_256E619B8 != -1)
    swift_once();
  return (id)qword_256E61A80;
}

unint64_t static ContextXPCService.serviceName.getter()
{
  return sub_23F2C62FC();
}

unint64_t static ContextXPCService.entitlementName.getter()
{
  return sub_23F2C62FC();
}

void sub_23F2C5430()
{
  qword_256E61A88 = MEMORY[0x24BEE4AF8];
}

uint64_t static ContextXPCService.selectorClasses.getter()
{
  if (qword_256E619C0 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F2C5484()
{
  uint64_t v0;

  v0 = sub_23F2DFA58();
  sub_23F2C6158(v0, qword_256E61A90);
  sub_23F2C553C(v0, (uint64_t)qword_256E61A90);
  return sub_23F2DF9F8();
}

uint64_t static ContextXPCService.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256E619C8 != -1)
    swift_once();
  v2 = sub_23F2DFA58();
  v3 = sub_23F2C553C(v2, (uint64_t)qword_256E61A90);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_23F2C553C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_23F2C5558()
{
  static ContextXPCService.serviceName.getter();
  return 0xD000000000000022;
}

ValueMetadata *type metadata accessor for ContextXPCService()
{
  return &type metadata for ContextXPCService;
}

uint64_t sub_23F2C5590(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = 0;
  sub_23F2C6270(&qword_254344FD8, a2, (uint64_t (*)(uint64_t))type metadata accessor for ContextClient, (uint64_t)&unk_23F2E0250);
  sub_23F2C3FA0(&qword_254344FD0);
  swift_allocObject();
  swift_retain();
  *(_QWORD *)(v2 + 16) = sub_23F2DFA28();
  swift_release();
  return v2;
}

void sub_23F2C561C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  if (*(_QWORD *)(v0 + 16))
  {
    MEMORY[0x24BDAC7A8]();
    sub_23F2C6204();
    sub_23F2C6310();
    sub_23F2DFA1C();
    if (v1)
    {
      sub_23F2C62F4();
    }
    else
    {
      sub_23F2C62F4();

    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23F2C56CC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v14;

  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a2;
  *(_QWORD *)(v14 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_23F2C5774(a4, a5, a6, a7, (uint64_t)sub_23F2C6240, v14, a1);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_23F2C5774(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];

  v10 = a4;
  if (a2 >> 60 == 15)
  {
    v11 = 0;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v11 = (void *)sub_23F2DF9E0();
  if (v10)
LABEL_5:
    v10 = (void *)sub_23F2DFAAC();
LABEL_6:
  v13[4] = a5;
  v13[5] = a6;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_23F2C5868;
  v13[3] = &unk_250FBFC70;
  v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(a7, sel_refreshWithContextTypes_interactionId_with_, v11, v10, v12);
  _Block_release(v12);

}

void sub_23F2C5868(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

void sub_23F2C58DC()
{
  sub_23F2C5A70();
}

uint64_t sub_23F2C58F8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v10;

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_23F2C5988(a4, a5, (uint64_t)sub_23F2C62DC, v10, a1);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_23F2C5988(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;
  void *v9;
  _QWORD v10[6];

  if (a2 >> 60 == 15)
    v8 = 0;
  else
    v8 = (void *)sub_23F2DF9E0();
  v10[4] = a3;
  v10[5] = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_23F2DF010;
  v10[3] = &unk_250FBFC20;
  v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(a5, sel_refreshAndRetrieveWithContextTypes_with_, v8, v9);
  _Block_release(v9);

}

void sub_23F2C5A54()
{
  sub_23F2C5A70();
}

void sub_23F2C5A70()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
  {
    MEMORY[0x24BDAC7A8]();
    sub_23F2C6310();
    sub_23F2DFA1C();
    sub_23F2C62F4();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23F2C5B04(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_23F2C5B94(a4, a5, (uint64_t)sub_23F2C62DC, v10, a1);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_23F2C5B94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;
  void *v9;
  _QWORD v10[6];

  v8 = (void *)sub_23F2DFAAC();
  v10[4] = a3;
  v10[5] = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_23F2DF010;
  v10[3] = &unk_250FBFB80;
  v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(a5, sel_retrieveContextValuesWithQuery_with_, v8, v9);
  _Block_release(v9);

}

void sub_23F2C5C4C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
  {
    MEMORY[0x24BDAC7A8]();
    sub_23F2C6310();
    sub_23F2DFA1C();
    sub_23F2C62F4();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23F2C5CE4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;

  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_23F2C5D84(a4, a5, a6, (uint64_t)sub_23F2C62DC, v12, a1);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_23F2C5D84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  void *v10;
  void *v11;
  _QWORD v12[6];

  v10 = (void *)sub_23F2DF9E0();
  v12[4] = a4;
  v12[5] = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_23F2DF010;
  v12[3] = &unk_250FBFBD0;
  v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  objc_msgSend(a6, sel_retrieveContextValuesWithContextTypes_timeout_with_, v10, a3, v11);
  _Block_release(v11);

}

uint64_t sub_23F2C5E44()
{
  return sub_23F2C5F04();
}

uint64_t sub_23F2C5E60(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_23F2C5FF0((uint64_t)sub_23F2C62DC, v6, a1, (uint64_t)&unk_250FBFB30, (SEL *)&selRef_retrieveRequiredContextValuesWith_);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_23F2C5EE8()
{
  return sub_23F2C5F04();
}

uint64_t sub_23F2C5F04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  if (*(_QWORD *)(v0 + 16))
  {
    sub_23F2C6310();
    sub_23F2DFA1C();
    result = sub_23F2C62F4();
    if (!v1)
      return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23F2C5F68(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_23F2C5FF0((uint64_t)sub_23F2C61BC, v6, a1, (uint64_t)&unk_250FBFAE0, (SEL *)&selRef_dumpUIContextFromCacheWith_);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_23F2C5FF0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, SEL *a5)
{
  void *v7;
  _QWORD v8[6];

  v8[4] = a1;
  v8[5] = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_23F2DF010;
  v8[3] = a4;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(a3, *a5, v7);
  _Block_release(v7);
}

uint64_t sub_23F2C608C()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ContextClient()
{
  return objc_opt_self();
}

uint64_t sub_23F2C60D0()
{
  return sub_23F2C6270(&qword_256E61AA8, 255, MEMORY[0x24BE797D0], MEMORY[0x24BE797E0]);
}

uint64_t sub_23F2C6100()
{
  type metadata accessor for ContextClient();
  return sub_23F2DFA4C();
}

uint64_t sub_23F2C6140()
{
  return sub_23F2DFA40();
}

uint64_t *sub_23F2C6158(uint64_t a1, uint64_t *a2)
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

uint64_t sub_23F2C6198()
{
  swift_release();
  return swift_deallocObject();
}

void sub_23F2C61BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_23F2DEFE4(a1, a2, a3, *(void (**)(_QWORD *, uint64_t))(v3 + 16));
}

uint64_t sub_23F2C61C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_23F2C61D4()
{
  return swift_release();
}

uint64_t sub_23F2C61DC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_23F2C5B04(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

uint64_t sub_23F2C61E4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  return sub_23F2C5CE4(a1, a2, a3, v3[2], v3[3], v3[4]);
}

uint64_t sub_23F2C61F0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_23F2C58F8(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

uint64_t sub_23F2C61F8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_23F2C56CC(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(void **)(v3 + 40));
}

unint64_t sub_23F2C6204()
{
  unint64_t result;

  result = qword_256E61AB0;
  if (!qword_256E61AB0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256E61AB0);
  }
  return result;
}

uint64_t sub_23F2C6240(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_23F2C6270(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x2426678EC](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23F2C62F4()
{
  return swift_release();
}

unint64_t sub_23F2C62FC()
{
  return 0xD000000000000022;
}

uint64_t sub_23F2C6310()
{
  return swift_retain();
}

void DetectedEntityDetails.entity.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_23F2CA8B8(v1, a1, type metadata accessor for DetectedEntity);
}

uint64_t type metadata accessor for DetectedEntity(uint64_t a1)
{
  return sub_23F2C9A38(a1, (uint64_t *)&unk_254344DD0);
}

uint64_t DetectedEntityDetails.entity.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_23F2C6358(a1, v1);
}

uint64_t sub_23F2C6358(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DetectedEntity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*DetectedEntityDetails.entity.modify())()
{
  return nullsub_1;
}

uint64_t DetectedEntityDetails.isSelected.getter()
{
  return sub_23F2D6050();
}

uint64_t type metadata accessor for DetectedEntityDetails(uint64_t a1)
{
  return sub_23F2C9A38(a1, (uint64_t *)&unk_254344E00);
}

void DetectedEntityDetails.isSelected.setter(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + *(int *)(type metadata accessor for DetectedEntityDetails(0) + 20)) = a1;
  sub_23F2C53A4();
}

uint64_t (*DetectedEntityDetails.isSelected.modify())()
{
  type metadata accessor for DetectedEntityDetails(0);
  return nullsub_1;
}

void DetectedEntityDetails.init(_:isSelected:)(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  sub_23F2C9A88(a1, a3, type metadata accessor for DetectedEntity);
  *(_BYTE *)(a3 + *(int *)(type metadata accessor for DetectedEntityDetails(0) + 20)) = a2;
  sub_23F2C53A4();
}

void DetectedEntityDetails.hash(into:)()
{
  DetectedEntity.hash(into:)();
  sub_23F2D6050();
  sub_23F2D627C();
  sub_23F2C53A4();
}

uint64_t static DetectedEntityDetails.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  char v6;

  static DetectedEntity.== infix(_:_:)();
  if ((v4 & 1) != 0)
  {
    v5 = type metadata accessor for DetectedEntityDetails(0);
    v6 = *(_BYTE *)(a1 + *(int *)(v5 + 20)) ^ *(_BYTE *)(a2 + *(int *)(v5 + 20)) ^ 1;
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

void static DetectedEntity.== infix(_:_:)()
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  _QWORD v23[8];
  uint64_t v24;
  uint64_t v25;

  sub_23F2D58DC();
  v25 = v1;
  v24 = v2;
  type metadata accessor for DetectedAppEntity(0);
  sub_23F2D5704();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v23[3] = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23F2D5C3C();
  type metadata accessor for DetectedLink(v4);
  sub_23F2D5704();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  sub_23F2D5714();
  v23[2] = v5;
  v6 = sub_23F2D5C3C();
  type metadata accessor for DetectedDate(v6);
  sub_23F2D5704();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  sub_23F2D5714();
  v23[1] = v7;
  v8 = sub_23F2D5C3C();
  type metadata accessor for DetectedEntity(v8);
  sub_23F2D5704();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  sub_23F2D622C();
  v23[4] = v9;
  sub_23F2D5AB4();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  sub_23F2D5C5C();
  v23[7] = v10;
  sub_23F2D5AB4();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  sub_23F2D5F68();
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  MEMORY[0x24BDAC7A8](v11);
  sub_23F2D5C48();
  MEMORY[0x24BDAC7A8](v12);
  sub_23F2D5C5C();
  v23[6] = v13;
  sub_23F2D5AB4();
  MEMORY[0x24BDAC7A8](v14);
  sub_23F2D5C5C();
  v23[5] = v15;
  sub_23F2D5AB4();
  v17 = MEMORY[0x24BDAC7A8](v16);
  MEMORY[0x24BDAC7A8](v17);
  sub_23F2C3FA0(&qword_256E61AB8);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v18);
  sub_23F2D596C();
  v20 = v0 + *(int *)(v19 + 48);
  sub_23F2CA8B8(v24, v0, type metadata accessor for DetectedEntity);
  v21 = v25;
  v25 = v20;
  sub_23F2CA8B8(v21, v20, type metadata accessor for DetectedEntity);
  v22 = (char *)sub_23F2C66D4 + 4 * byte_23F2E02A0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_23F2C66D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F2CA8B8(v1, v2, type metadata accessor for DetectedEntity);
  if (sub_23F2D5848())
  {
    sub_23F2C9A68(v2, type metadata accessor for DetectedDate);
    sub_23F2CFF80(v1, &qword_256E61AB8);
  }
  else
  {
    sub_23F2D5D20(v0);
    static DetectedDate.== infix(_:_:)();
    sub_23F2D5EF0();
    sub_23F2C9A68(v2, type metadata accessor for DetectedDate);
    sub_23F2C9A68(v1, type metadata accessor for DetectedEntity);
  }
  sub_23F2D5830();
}

uint64_t sub_23F2C6AA8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x797469746E65 && a2 == 0xE600000000000000;
  if (v2 || (sub_23F2DFC5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7463656C65537369 && a2 == 0xEA00000000006465)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_23F2DFC5C();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23F2C6B98(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7463656C65537369;
  else
    return 0x797469746E65;
}

uint64_t sub_23F2C6BD4()
{
  char *v0;

  return sub_23F2C6B98(*v0);
}

uint64_t sub_23F2C6BDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2C6AA8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F2C6C00()
{
  sub_23F2CA848();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2C6C28()
{
  sub_23F2CA848();
  return sub_23F2DFCC8();
}

void DetectedEntityDetails.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;

  sub_23F2D60A0();
  sub_23F2C3FA0(&qword_256E61AC0);
  sub_23F2D5A38();
  MEMORY[0x24BDAC7A8](v1);
  sub_23F2D58F4();
  sub_23F2CA848();
  sub_23F2D5944();
  sub_23F2D606C();
  sub_23F2CA884(&qword_256E61AD0, (void (*)(uint64_t))type metadata accessor for DetectedEntity);
  sub_23F2DFC44();
  if (!v0)
  {
    type metadata accessor for DetectedEntityDetails(0);
    sub_23F2DFC38();
  }
  sub_23F2D5BB4();
  sub_23F2D581C();
}

void DetectedEntityDetails.hashValue.getter()
{
  sub_23F2D57D0();
  DetectedEntity.hash(into:)();
  sub_23F2D6050();
  sub_23F2DFC8C();
  sub_23F2D5888();
  sub_23F2D578C();
}

void DetectedEntityDetails.init(from:)()
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
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  sub_23F2D57B8();
  v4 = v3;
  v13 = v5;
  sub_23F2D606C();
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v6);
  sub_23F2D5714();
  v14 = v7;
  v15 = sub_23F2C3FA0(&qword_256E61AD8);
  v8 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v9 = sub_23F2D5D94();
  v10 = type metadata accessor for DetectedEntityDetails(v9);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v11);
  sub_23F2D5FA8();
  sub_23F2C3FE0(v4, v4[3]);
  sub_23F2CA848();
  sub_23F2DFCA4();
  if (v0)
  {
    sub_23F2C48B8();
  }
  else
  {
    sub_23F2CA884(&qword_256E61AE0, (void (*)(uint64_t))type metadata accessor for DetectedEntity);
    sub_23F2DFBF0();
    sub_23F2C9A88(v14, v2, type metadata accessor for DetectedEntity);
    v12 = sub_23F2DFBE4();
    sub_23F2D5B58(v1, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
    *(_BYTE *)(v2 + *(int *)(v10 + 20)) = v12 & 1;
    sub_23F2D6154(v2, v13);
    sub_23F2C48B8();
    sub_23F2C9A68(v2, type metadata accessor for DetectedEntityDetails);
  }
  sub_23F2C4890();
}

uint64_t sub_23F2C6F80()
{
  sub_23F2DFC74();
  DetectedEntity.hash(into:)();
  sub_23F2DFC8C();
  return sub_23F2DFC98();
}

void sub_23F2C6FCC()
{
  DetectedEntityDetails.init(from:)();
}

void sub_23F2C6FE0()
{
  DetectedEntityDetails.encode(to:)();
}

void DetectedEntity.type.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD);
  char *v4;

  type metadata accessor for DetectedEntity(0);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v1);
  sub_23F2D62E4(v0, v2, v3);
  v4 = (char *)sub_23F2C7078 + 4 * byte_23F2E02A9[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_23F2C7078(uint64_t a1)
{
  _BYTE *v1;

  *v1 = 0;
  sub_23F2D5BCC(a1, type metadata accessor for DetectedEntity);
  sub_23F2D5750();
}

void DetectedEntity.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD);
  char *v9;

  sub_23F2D58DC();
  type metadata accessor for DetectedAppEntity(0);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v1);
  v2 = sub_23F2D5D78();
  type metadata accessor for DetectedLink(v2);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v3);
  v4 = sub_23F2D5DB0();
  type metadata accessor for DetectedDate(v4);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v5);
  type metadata accessor for DetectedEntity(0);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v6);
  sub_23F2D5858();
  sub_23F2D5F10(v0, v7, v8);
  v9 = (char *)sub_23F2C71F8 + 4 * byte_23F2E02B2[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_23F2C71F8()
{
  uint64_t v0;
  uint64_t v1;

  sub_23F2C9A88(v0, v1, type metadata accessor for DetectedDate);
  DetectedDate.description.getter();
  sub_23F2C9A68(v1, type metadata accessor for DetectedDate);
  sub_23F2D5830();
}

void DetectedEntity.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD);
  char *v8;
  _QWORD v9[36];

  sub_23F2D58DC();
  v9[2] = v2;
  type metadata accessor for DetectedAppEntity(0);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8]();
  v3 = sub_23F2D5D5C();
  type metadata accessor for DetectedLink(v3);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8]();
  v9[1] = *(_QWORD *)(sub_23F2D5BC4() - 8);
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8]();
  v9[0] = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F2C3FA0(&qword_256E61AF0);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8]();
  v5 = sub_23F2D5A04();
  type metadata accessor for DetectedDate(v5);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8]();
  v6 = sub_23F2D5D94();
  type metadata accessor for DetectedEntity(v6);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8]();
  sub_23F2D5870();
  sub_23F2CA8B8(v0, v1, v7);
  v8 = (char *)sub_23F2C7570 + 4 * byte_23F2E02BB[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_23F2C7570()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_23F2C9A88(v1, v3, type metadata accessor for DetectedDate);
  sub_23F2DFC80();
  sub_23F2CA884(&qword_256E61B00, (void (*)(uint64_t))MEMORY[0x24BDCBDE0]);
  sub_23F2D61F0();
  sub_23F2CFF54(v3 + *(int *)(v5 + 20), v4, &qword_256E61AF0);
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0(v4, 1, v2) == 1)
  {
    sub_23F2DFC8C();
  }
  else
  {
    v7 = *v0;
    v6 = v0[1];
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v6 + 32))(*v0, v4, v2);
    sub_23F2DFC8C();
    sub_23F2D61F0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v2);
  }
  sub_23F2C9A68(v3, type metadata accessor for DetectedDate);
  sub_23F2D5830();
}

void static DetectedDate.== infix(_:_:)()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _QWORD v16[2];

  sub_23F2D58DC();
  v4 = v3;
  v6 = v5;
  sub_23F2D5BC4();
  sub_23F2D5C88();
  MEMORY[0x24BDAC7A8]();
  sub_23F2D5870();
  v7 = sub_23F2C3FA0(&qword_256E61B08);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8]();
  sub_23F2D5984();
  sub_23F2C3FA0(&qword_256E61AF0);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8]();
  sub_23F2D5D40();
  MEMORY[0x24BDAC7A8]();
  sub_23F2D5FD8();
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v16 - v8;
  if ((MEMORY[0x2426673B8](v6, v4) & 1) != 0)
  {
    v16[1] = v2;
    v10 = type metadata accessor for DetectedDate(0);
    sub_23F2D5AC8(v6 + *(int *)(v10 + 20), (uint64_t)v9);
    sub_23F2D5AC8(v4 + *(int *)(v10 + 20), v1);
    v11 = v0 + *(int *)(v7 + 48);
    sub_23F2D5AC8((uint64_t)v9, v0);
    sub_23F2D5AC8(v1, v11);
    v12 = sub_23F2D5914(v0);
    if (!v15)
    {
      sub_23F2D6240(v12, v13, &qword_256E61AF0);
      sub_23F2D5914(v11);
      if (!v15)
      {
        sub_23F2D5C68();
        sub_23F2CA884(&qword_256E61B10, (void (*)(uint64_t))MEMORY[0x24BDCBDE0]);
        sub_23F2D5D2C();
        sub_23F2D5DE8();
        sub_23F2D58B0(v1);
        sub_23F2D58B0((uint64_t)v9);
        sub_23F2D61BC();
        sub_23F2D58B0(v0);
        goto LABEL_11;
      }
      sub_23F2D58B0(v1);
      sub_23F2D58B0((uint64_t)v9);
      v14 = sub_23F2D5E10();
LABEL_10:
      sub_23F2D5FC0(v14, &qword_256E61B08);
      goto LABEL_11;
    }
    sub_23F2D58B0(v1);
    sub_23F2D58B0((uint64_t)v9);
    v14 = sub_23F2D5914(v11);
    if (!v15)
      goto LABEL_10;
    sub_23F2D5FC0(v14, &qword_256E61AF0);
  }
LABEL_11:
  sub_23F2D5830();
}

uint64_t static DetectedPerson.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
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
  BOOL v11;
  uint64_t v12;
  uint64_t result;
  char v14;
  BOOL v15;
  char v16;
  char v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;

  v2 = a1[2];
  v4 = a1[3];
  v3 = a1[4];
  v5 = a1[5];
  v6 = a1[7];
  v8 = a2[2];
  v7 = a2[3];
  v10 = a2[4];
  v9 = a2[5];
  v11 = *a1 == *a2 && a1[1] == a2[1];
  v12 = a2[7];
  v20 = a2[6];
  v21 = a1[6];
  if (!v11)
  {
    sub_23F2D59A4();
    result = sub_23F2D5B70();
    if ((v14 & 1) == 0)
      return result;
  }
  if (!v4)
  {
    if (v7)
      return 0;
    goto LABEL_15;
  }
  if (!v7)
    return 0;
  v15 = v2 == v8 && v4 == v7;
  if (v15 || (sub_23F2D59A4(), result = sub_23F2D5B70(), (v16 & 1) != 0))
  {
LABEL_15:
    if (v5)
    {
      if (!v9)
        return 0;
      if (v3 != v10 || v5 != v9)
      {
        sub_23F2D59A4();
        result = sub_23F2D5B70();
        if ((v18 & 1) == 0)
          return result;
      }
    }
    else if (v9)
    {
      return 0;
    }
    if (v6)
    {
      if (v12)
      {
        v19 = v21 == v20 && v6 == v12;
        if (v19 || (sub_23F2D59A4() & 1) != 0)
          return 1;
      }
    }
    else if (!v12)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

void static DetectedAppEntity.== infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  _QWORD v24[2];

  sub_23F2D58DC();
  v4 = v3;
  v6 = v5;
  sub_23F2D5E60();
  sub_23F2D5C88();
  MEMORY[0x24BDAC7A8]();
  sub_23F2D5870();
  v7 = sub_23F2C3FA0(&qword_256E61B18);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8]();
  sub_23F2D5984();
  sub_23F2C3FA0(&qword_256E61B20);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8]();
  sub_23F2D5D40();
  MEMORY[0x24BDAC7A8]();
  sub_23F2D5FD8();
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v24 - v8;
  v10 = v6[1];
  v11 = v4[1];
  if (!v10)
  {
    if (v11)
      goto LABEL_28;
LABEL_10:
    v14 = v6[3];
    v15 = v4[3];
    if (v14)
    {
      if (!v15)
        goto LABEL_28;
      if (v6[2] != v4[2] || v14 != v15)
      {
        sub_23F2D59A4();
        sub_23F2D5B70();
        if ((v17 & 1) == 0)
          goto LABEL_28;
      }
    }
    else if (v15)
    {
      goto LABEL_28;
    }
    v24[1] = v2;
    v18 = sub_23F2D62DC();
    sub_23F2D5AC8((uint64_t)v6 + *(int *)(v18 + 24), (uint64_t)v9);
    sub_23F2D5AC8((uint64_t)v4 + *(int *)(v18 + 24), v1);
    v19 = v0 + *(int *)(v7 + 48);
    sub_23F2D5AC8((uint64_t)v9, v0);
    sub_23F2D5AC8(v1, v19);
    v20 = sub_23F2D5914(v0);
    if (v12)
    {
      sub_23F2D58B0(v1);
      sub_23F2D58B0((uint64_t)v9);
      v22 = sub_23F2D5914(v19);
      if (v12)
      {
        sub_23F2D5FC0(v22, &qword_256E61B20);
        goto LABEL_28;
      }
    }
    else
    {
      sub_23F2D6240(v20, v21, &qword_256E61B20);
      sub_23F2D5914(v19);
      if (!v23)
      {
        sub_23F2D5C68();
        sub_23F2CA884(&qword_256E61B28, (void (*)(uint64_t))MEMORY[0x24BEB9760]);
        sub_23F2D5D2C();
        sub_23F2D5DE8();
        sub_23F2D58B0(v1);
        sub_23F2D58B0((uint64_t)v9);
        sub_23F2D61BC();
        sub_23F2D58B0(v0);
        goto LABEL_28;
      }
      sub_23F2D58B0(v1);
      sub_23F2D58B0((uint64_t)v9);
      v22 = sub_23F2D5E10();
    }
    sub_23F2D5FC0(v22, &qword_256E61B18);
    goto LABEL_28;
  }
  if (v11)
  {
    v12 = *v6 == *v4 && v10 == v11;
    if (v12)
      goto LABEL_10;
    sub_23F2D59A4();
    sub_23F2D5B70();
    if ((v13 & 1) != 0)
      goto LABEL_10;
  }
LABEL_28:
  sub_23F2D5830();
}

uint64_t _s23IntelligenceFlowContext19DetectedPhoneNumberV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_23F2DFC5C();
}

uint64_t sub_23F2C7DA4()
{
  return 12383;
}

BOOL sub_23F2C7DB0(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23F2C7DC0()
{
  return sub_23F2DFC80();
}

uint64_t sub_23F2C7DE4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  char v14;

  v2 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v2 || (sub_23F2DFC5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6D754E656E6F6870 && a2 == 0xEB00000000726562;
    if (v6 || (sub_23F2DFC5C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 1802398060 && a2 == 0xE400000000000000;
      if (v7 || (sub_23F2DFC5C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x73736572646461 && a2 == 0xE700000000000000;
        if (v8 || (sub_23F2DFC5C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x6E6F73726570 && a2 == 0xE600000000000000;
          if (v9 || (sub_23F2DFC5C() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 0x6563616C70 && a2 == 0xE500000000000000;
            if (v10 || (sub_23F2DFC5C() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              v11 = a1 == 0x617A696E6167726FLL && a2 == 0xEC0000006E6F6974;
              if (v11 || (sub_23F2DFC5C() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                v12 = a1 == 0x7469746E45707061 && a2 == 0xE900000000000079;
                if (v12 || (sub_23F2DFC5C() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else if (a1 == 0x6E65746E49707061 && a2 == 0xE900000000000074)
                {
                  swift_bridgeObjectRelease();
                  return 8;
                }
                else
                {
                  v14 = sub_23F2DFC5C();
                  swift_bridgeObjectRelease();
                  if ((v14 & 1) != 0)
                    return 8;
                  else
                    return 9;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_23F2C8180()
{
  return 9;
}

uint64_t sub_23F2C8188(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23F2C81B4 + 4 * byte_23F2E02C4[a1]))(1702125924, 0xE400000000000000);
}

uint64_t sub_23F2C81B4()
{
  return 0x6D754E656E6F6870;
}

uint64_t sub_23F2C81D4()
{
  return 1802398060;
}

uint64_t sub_23F2C81E0()
{
  return 0x73736572646461;
}

uint64_t sub_23F2C81F8()
{
  return 0x6E6F73726570;
}

uint64_t sub_23F2C820C()
{
  return 0x6563616C70;
}

uint64_t sub_23F2C8220()
{
  return 0x617A696E6167726FLL;
}

uint64_t sub_23F2C8240()
{
  return 0x7469746E45707061;
}

uint64_t sub_23F2C8260()
{
  return 0x6E65746E49707061;
}

uint64_t sub_23F2C827C(uint64_t a1, uint64_t a2)
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
    v3 = sub_23F2D59A4();
    sub_23F2D5AC0();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_23F2C82E4()
{
  sub_23F2CEAAC();
}

uint64_t sub_23F2C8304()
{
  sub_23F2CF0A8();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2C832C()
{
  sub_23F2CF0A8();
  return sub_23F2DFCC8();
}

uint64_t sub_23F2C8354@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2C827C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23F2C837C()
{
  sub_23F2CEF04();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2C83A4()
{
  sub_23F2CEF04();
  return sub_23F2DFCC8();
}

uint64_t sub_23F2C83CC()
{
  sub_23F2CEE8C();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2C83F4()
{
  sub_23F2CEE8C();
  return sub_23F2DFCC8();
}

BOOL sub_23F2C841C(char *a1, char *a2)
{
  return sub_23F2C7DB0(*a1, *a2);
}

void sub_23F2C8428()
{
  sub_23F2CE430();
}

uint64_t sub_23F2C8440()
{
  return sub_23F2C7DC0();
}

uint64_t sub_23F2C8448()
{
  unsigned __int8 *v0;

  return sub_23F2C8188(*v0);
}

uint64_t sub_23F2C8450@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2C7DE4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F2C8474@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23F2C8180();
  *a1 = result;
  return result;
}

uint64_t sub_23F2C8498()
{
  sub_23F2CEE50();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2C84C0()
{
  sub_23F2CEE50();
  return sub_23F2DFCC8();
}

uint64_t sub_23F2C84E8()
{
  sub_23F2CF1D4();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2C8510()
{
  sub_23F2CF1D4();
  return sub_23F2DFCC8();
}

uint64_t sub_23F2C8538()
{
  sub_23F2CF120();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2C8560()
{
  sub_23F2CF120();
  return sub_23F2DFCC8();
}

uint64_t sub_23F2C8588()
{
  sub_23F2CEF40();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2C85B0()
{
  sub_23F2CEF40();
  return sub_23F2DFCC8();
}

uint64_t sub_23F2C85D8()
{
  sub_23F2CF030();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2C8600()
{
  sub_23F2CF030();
  return sub_23F2DFCC8();
}

uint64_t sub_23F2C8628()
{
  sub_23F2CF15C();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2C8650()
{
  sub_23F2CF15C();
  return sub_23F2DFCC8();
}

uint64_t sub_23F2C8678()
{
  sub_23F2CEFB8();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2C86A0()
{
  sub_23F2CEFB8();
  return sub_23F2DFCC8();
}

void DetectedEntity.encode(to:)()
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
  char *v39;
  _QWORD v40[18];
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

  sub_23F2D57B8();
  v56 = v0;
  v3 = v2;
  v4 = sub_23F2C3FA0(&qword_256E61B30);
  v52 = *(_QWORD *)(v4 - 8);
  v53 = v4;
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v5);
  sub_23F2D5714();
  v51 = v6;
  v7 = sub_23F2C3FA0(&qword_256E61B38);
  v49 = *(_QWORD *)(v7 - 8);
  v50 = v7;
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v8);
  sub_23F2D5714();
  v48 = v9;
  v10 = sub_23F2D5C3C();
  v46 = type metadata accessor for DetectedAppEntity(v10);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v11);
  sub_23F2D5714();
  v47 = v12;
  v13 = sub_23F2C3FA0(&qword_256E61B40);
  v44 = *(_QWORD *)(v13 - 8);
  v45 = v13;
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v14);
  sub_23F2D5714();
  v43 = v15;
  v42 = sub_23F2C3FA0(&qword_256E61B48);
  v40[17] = *(_QWORD *)(v42 - 8);
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v16);
  sub_23F2D5714();
  v40[16] = v17;
  v41 = sub_23F2C3FA0(&qword_256E61B50);
  v40[15] = *(_QWORD *)(v41 - 8);
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v18);
  sub_23F2D5714();
  v40[14] = v19;
  v20 = sub_23F2C3FA0(&qword_256E61B58);
  v40[12] = *(_QWORD *)(v20 - 8);
  v40[13] = v20;
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v21);
  sub_23F2D5714();
  v40[11] = v22;
  v23 = sub_23F2C3FA0(&qword_256E61B60);
  v40[9] = *(_QWORD *)(v23 - 8);
  v40[10] = v23;
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v24);
  sub_23F2D5714();
  v40[8] = v25;
  v26 = sub_23F2D5C3C();
  v40[6] = type metadata accessor for DetectedLink(v26);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v27);
  sub_23F2D5714();
  v40[7] = v28;
  v29 = sub_23F2C3FA0(&qword_256E61B68);
  v40[4] = *(_QWORD *)(v29 - 8);
  v40[5] = v29;
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v30);
  v40[3] = (char *)v40 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_23F2C3FA0(&qword_256E61B70);
  v40[1] = *(_QWORD *)(v32 - 8);
  v40[2] = v32;
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v33);
  v40[0] = (char *)v40 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_23F2D5C3C();
  type metadata accessor for DetectedDate(v35);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v36);
  sub_23F2D5FA8();
  sub_23F2D606C();
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v37);
  sub_23F2D5954();
  v55 = sub_23F2C3FA0(&qword_256E61B78);
  v54 = *(_QWORD *)(v55 - 8);
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v38);
  sub_23F2D5F78();
  sub_23F2C3FE0(v3, v3[3]);
  sub_23F2CEE50();
  sub_23F2DFCB0();
  sub_23F2CA8B8(v56, v1, type metadata accessor for DetectedEntity);
  sub_23F2D5EB4();
  v39 = (char *)sub_23F2C89E0 + 4 * word_23F2E02CE[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_23F2C89E0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_23F2D6108(v1, v2);
  *(_BYTE *)(v3 - 216) = 0;
  sub_23F2CF1D4();
  v4 = *v0;
  sub_23F2D5A50();
  sub_23F2D61E8(&qword_256E61C10);
  sub_23F2D59D0();
  sub_23F2D58A8(v4, *(uint64_t (**)(uint64_t, uint64_t))(v0[1] + 8));
  sub_23F2C9A68(v2, type metadata accessor for DetectedDate);
  sub_23F2D5CF4(v1, *(uint64_t (**)(uint64_t, uint64_t))(v0[31] + 8));
  sub_23F2C4890();
}

void DetectedEntity.hashValue.getter()
{
  sub_23F2CE6A8((void (*)(_BYTE *))DetectedEntity.hash(into:));
}

void DetectedEntity.init(from:)()
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
  char *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t v78;
  _QWORD v79[38];
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
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

  sub_23F2D57B8();
  v5 = v4;
  v79[35] = v6;
  v7 = sub_23F2C3FA0(&qword_256E61C18);
  sub_23F2D5B10(v7, (uint64_t)&v93);
  v79[37] = v8;
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v9);
  sub_23F2D5714();
  sub_23F2D5B1C(v10);
  v11 = sub_23F2C3FA0(&qword_256E61C20);
  sub_23F2D5B10(v11, (uint64_t)&v92);
  v79[15] = v12;
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v13);
  sub_23F2D5714();
  sub_23F2D5B1C(v14);
  v15 = sub_23F2C3FA0(&qword_256E61C28);
  sub_23F2D5B10(v15, (uint64_t)&v91);
  v79[14] = v16;
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v17);
  sub_23F2D5714();
  sub_23F2D5B1C(v18);
  v19 = sub_23F2C3FA0(&qword_256E61C30);
  sub_23F2D5B10(v19, (uint64_t)&v90);
  v82 = v20;
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v21);
  sub_23F2D5714();
  sub_23F2D5B1C(v22);
  v23 = sub_23F2C3FA0(&qword_256E61C38);
  sub_23F2D5B10(v23, (uint64_t)&v89);
  v79[13] = v24;
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v25);
  sub_23F2D5714();
  sub_23F2D5B1C(v26);
  v27 = sub_23F2C3FA0(&qword_256E61C40);
  sub_23F2D5B10(v27, (uint64_t)&v88);
  v79[36] = v28;
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v29);
  sub_23F2D5714();
  sub_23F2D5B1C(v30);
  v31 = sub_23F2C3FA0(&qword_256E61C48);
  sub_23F2D5B10(v31, (uint64_t)&v87);
  v79[12] = v32;
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v33);
  sub_23F2D5714();
  sub_23F2D5B1C(v34);
  v35 = sub_23F2C3FA0(&qword_256E61C50);
  sub_23F2D5B10(v35, (uint64_t)&v86);
  v79[11] = v36;
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v37);
  sub_23F2D5714();
  sub_23F2D5B1C(v38);
  v39 = sub_23F2C3FA0(&qword_256E61C58);
  sub_23F2D5B10(v39, (uint64_t)&v85);
  v79[10] = v40;
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v41);
  sub_23F2D5714();
  sub_23F2D5B1C(v42);
  v83 = sub_23F2C3FA0(&qword_256E61C60);
  v81 = *(_QWORD *)(v83 - 8);
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v43);
  v44 = sub_23F2D5D5C();
  v80 = type metadata accessor for DetectedEntity(v44);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v45);
  sub_23F2D622C();
  v79[9] = v46;
  sub_23F2D5AB4();
  MEMORY[0x24BDAC7A8](v47);
  sub_23F2D5C5C();
  v79[16] = v48;
  sub_23F2D5AB4();
  MEMORY[0x24BDAC7A8](v49);
  sub_23F2D5C5C();
  v79[8] = v50;
  sub_23F2D5AB4();
  MEMORY[0x24BDAC7A8](v51);
  sub_23F2D5C5C();
  v79[7] = v52;
  sub_23F2D5AB4();
  MEMORY[0x24BDAC7A8](v53);
  sub_23F2D5C5C();
  v79[6] = v54;
  sub_23F2D5AB4();
  MEMORY[0x24BDAC7A8](v55);
  sub_23F2D5C48();
  v57 = MEMORY[0x24BDAC7A8](v56);
  v59 = (char *)v79 - v58;
  MEMORY[0x24BDAC7A8](v57);
  sub_23F2D5F68();
  v61 = MEMORY[0x24BDAC7A8](v60);
  v63 = (char *)v79 - v62;
  MEMORY[0x24BDAC7A8](v61);
  v65 = (char *)v79 - v64;
  v66 = v5[3];
  v84 = v5;
  sub_23F2C3FE0(v5, v66);
  sub_23F2CEE50();
  sub_23F2DFCA4();
  if (!v0)
  {
    v79[3] = v63;
    v79[1] = v3;
    v79[4] = v59;
    v79[2] = v1;
    v79[5] = v65;
    v94 = v2;
    v67 = sub_23F2DFBFC();
    v68 = *(_QWORD *)(v67 + 16);
    if (v68)
    {
      v79[0] = 0;
      v69 = *(unsigned __int8 *)(v67 + 32);
      sub_23F2D5620(1, v68, v67, v67 + 32, 0, (2 * v68) | 1);
      v71 = v70;
      v73 = v72;
      swift_bridgeObjectRelease();
      if (v71 == v73 >> 1)
        __asm { BR              X9 }
    }
    v74 = v80;
    v75 = sub_23F2DFB84();
    swift_allocError();
    v77 = v76;
    sub_23F2C3FA0(&qword_256E61C68);
    *v77 = v74;
    v78 = v83;
    sub_23F2DFBB4();
    sub_23F2DFB78();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v75 - 8) + 104))(v77, *MEMORY[0x24BEE26D0], v75);
    swift_willThrow();
    sub_23F2D5890();
    (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v94, v78);
  }
  sub_23F2C4254((uint64_t)v84);
  sub_23F2C4890();
}

uint64_t type metadata accessor for DetectedAppEntity(uint64_t a1)
{
  return sub_23F2C9A38(a1, (uint64_t *)&unk_254344DE0);
}

uint64_t type metadata accessor for DetectedLink(uint64_t a1)
{
  return sub_23F2C9A38(a1, qword_256E61EE0);
}

uint64_t type metadata accessor for DetectedDate(uint64_t a1)
{
  return sub_23F2C9A38(a1, (uint64_t *)&unk_254344DC0);
}

uint64_t sub_23F2C9A38(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23F2C9A68(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = sub_23F2D6284(a1, a2);
  sub_23F2D5E68(v2);
  sub_23F2C53A4();
}

void sub_23F2C9A88(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23F2D6018(a1, a2, a3);
  sub_23F2D608C();
  sub_23F2D5B7C(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 32));
  sub_23F2C53A4();
}

void sub_23F2C9AB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F2CE8F8(a1, a2, a3, (void (*)(_BYTE *))DetectedEntity.hash(into:));
}

void sub_23F2C9AC0()
{
  DetectedEntity.init(from:)();
}

void sub_23F2C9AD4()
{
  DetectedEntity.encode(to:)();
}

void AddressComponents.name.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

void AddressComponents.name.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  sub_23F2D5A20();
  *v1 = v2;
  v1[1] = v0;
  sub_23F2D5750();
}

uint64_t (*AddressComponents.name.modify())()
{
  return nullsub_1;
}

void AddressComponents.jobTitle.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

void AddressComponents.jobTitle.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F2D5BA4();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  sub_23F2D5750();
}

uint64_t (*AddressComponents.jobTitle.modify())()
{
  return nullsub_1;
}

void AddressComponents.organization.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

void AddressComponents.organization.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F2D6008();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v0;
  sub_23F2D5750();
}

uint64_t (*AddressComponents.organization.modify())()
{
  return nullsub_1;
}

void AddressComponents.street.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

void AddressComponents.street.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F2D5FF8();
  *(_QWORD *)(v1 + 48) = v2;
  *(_QWORD *)(v1 + 56) = v0;
  sub_23F2D5750();
}

uint64_t (*AddressComponents.street.modify())()
{
  return nullsub_1;
}

void AddressComponents.city.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

void AddressComponents.city.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F2D6270();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 64) = v2;
  *(_QWORD *)(v1 + 72) = v0;
  sub_23F2D5750();
}

uint64_t (*AddressComponents.city.modify())()
{
  return nullsub_1;
}

void AddressComponents.state.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

void AddressComponents.state.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F2D6270();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 80) = v2;
  *(_QWORD *)(v1 + 88) = v0;
  sub_23F2D5750();
}

uint64_t (*AddressComponents.state.modify())()
{
  return nullsub_1;
}

void AddressComponents.zipCode.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

void AddressComponents.zipCode.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F2D6270();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 96) = v2;
  *(_QWORD *)(v1 + 104) = v0;
  sub_23F2D5750();
}

uint64_t (*AddressComponents.zipCode.modify())()
{
  return nullsub_1;
}

void AddressComponents.country.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

void AddressComponents.country.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F2D6270();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 112) = v2;
  *(_QWORD *)(v1 + 120) = v0;
  sub_23F2D5750();
}

uint64_t (*AddressComponents.country.modify())()
{
  return nullsub_1;
}

void __swiftcall AddressComponents.init(name:jobTitle:organization:street:city:state:zipCode:country:)(IntelligenceFlowContext::AddressComponents *__return_ptr retstr, Swift::String_optional name, Swift::String_optional jobTitle, Swift::String_optional organization, Swift::String_optional street, Swift::String_optional city, Swift::String_optional state, Swift::String_optional zipCode, Swift::String_optional country)
{
  retstr->name = name;
  retstr->jobTitle = jobTitle;
  retstr->organization = organization;
  retstr->street = street;
  retstr->city = city;
  retstr->state = state;
  retstr->zipCode = zipCode;
  retstr->country = country;
}

uint64_t AddressComponents.description.getter()
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
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v1 = v0[3];
  v2 = v0[7];
  v3 = v0[9];
  v31 = v0[5];
  v32 = v0[11];
  v33 = v0[13];
  v4 = v0[15];
  if (!v0[1])
  {
    v10 = MEMORY[0x24BEE4AF8];
    if (!v1)
      goto LABEL_12;
    goto LABEL_7;
  }
  v30 = v0[7];
  v5 = v0[9];
  v6 = v0[15];
  sub_23F2D5B98();
  v7 = sub_23F2DFADC();
  v10 = sub_23F2D5B28(v7, v8, v9, MEMORY[0x24BEE4AF8]);
  v12 = *(_QWORD *)(v10 + 16);
  v11 = *(_QWORD *)(v10 + 24);
  if (v12 >= v11 >> 1)
    v10 = sub_23F2D575C(v11);
  *(_QWORD *)(v10 + 16) = v12 + 1;
  v13 = v10 + 16 * v12;
  *(_QWORD *)(v13 + 32) = v34;
  *(_QWORD *)(v13 + 40) = v35;
  v4 = v6;
  v3 = v5;
  v2 = v30;
  if (v1)
  {
LABEL_7:
    sub_23F2D5B98();
    sub_23F2DFADC();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v10 = sub_23F2D5774();
    v15 = *(_QWORD *)(v10 + 16);
    v14 = *(_QWORD *)(v10 + 24);
    if (v15 >= v14 >> 1)
      v10 = sub_23F2D575C(v14);
    *(_QWORD *)(v10 + 16) = v15 + 1;
    v16 = v10 + 16 * v15;
    *(_QWORD *)(v16 + 32) = v34;
    *(_QWORD *)(v16 + 40) = v35;
  }
LABEL_12:
  v17 = v32;
  if (v31)
  {
    sub_23F2DFB6C();
    swift_bridgeObjectRelease();
    sub_23F2D5CB0();
    sub_23F2D5B98();
    sub_23F2DFADC();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v10 = sub_23F2D5774();
    v19 = *(_QWORD *)(v10 + 16);
    v18 = *(_QWORD *)(v10 + 24);
    if (v19 >= v18 >> 1)
      v10 = sub_23F2D575C(v18);
    *(_QWORD *)(v10 + 16) = v19 + 1;
    v20 = v10 + 16 * v19;
    *(_QWORD *)(v20 + 32) = 0;
    *(_QWORD *)(v20 + 40) = 0xE000000000000000;
  }
  v21 = v33;
  if (v2)
  {
    sub_23F2D5B98();
    sub_23F2DFADC();
    if ((sub_23F2D5A80() & 1) == 0)
      sub_23F2D5774();
    sub_23F2D5AA4();
    if (v23)
      sub_23F2D575C(v22);
    sub_23F2D5AD0();
    v17 = v32;
    v21 = v33;
  }
  if (v3)
  {
    sub_23F2D5B98();
    sub_23F2DFADC();
    if ((sub_23F2D5A80() & 1) == 0)
      sub_23F2D5774();
    sub_23F2D5AA4();
    if (v23)
      sub_23F2D575C(v24);
    sub_23F2D5AD0();
  }
  if (v17)
  {
    sub_23F2D5E9C();
    sub_23F2D5B98();
    sub_23F2DFADC();
    if ((sub_23F2D5A80() & 1) == 0)
      sub_23F2D5774();
    sub_23F2D5AA4();
    if (v23)
      sub_23F2D575C(v25);
    sub_23F2D5AD0();
  }
  if (v21)
  {
    sub_23F2D5B98();
    sub_23F2DFADC();
    if ((sub_23F2D5A80() & 1) == 0)
      sub_23F2D5774();
    sub_23F2D5AA4();
    if (v23)
      sub_23F2D575C(v26);
    sub_23F2D5AD0();
  }
  if (v4)
  {
    sub_23F2D5B98();
    sub_23F2DFADC();
    if ((sub_23F2D5A80() & 1) == 0)
      sub_23F2D5774();
    sub_23F2D5AA4();
    if (v23)
      sub_23F2D575C(v27);
    sub_23F2D5AD0();
  }
  sub_23F2C3FA0(&qword_254344E18);
  sub_23F2D0364(&qword_254344E20, &qword_254344E18);
  v28 = sub_23F2DFA94();
  sub_23F2D5AC0();
  return v28;
}

void AddressComponents.hash(into:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = v0[3];
  v2 = v0[5];
  v3 = v0[7];
  v4 = v0[9];
  v5 = v0[13];
  v6 = v0[15];
  v7 = v0[11];
  if (v0[1])
  {
    sub_23F2D59DC();
    swift_bridgeObjectRetain();
    sub_23F2D6304();
    sub_23F2DFAD0();
    sub_23F2D5ED8();
    if (v1)
    {
LABEL_3:
      sub_23F2D59DC();
      swift_bridgeObjectRetain();
      sub_23F2DFAD0();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_23F2D599C();
    if (v1)
      goto LABEL_3;
  }
  sub_23F2D599C();
LABEL_6:
  if (v2)
  {
    sub_23F2D59DC();
    sub_23F2D6144();
    sub_23F2DFAD0();
    sub_23F2D5A9C();
    if (v3)
      goto LABEL_8;
  }
  else
  {
    sub_23F2D599C();
    if (v3)
    {
LABEL_8:
      sub_23F2D59DC();
      swift_bridgeObjectRetain();
      sub_23F2DFAD0();
      sub_23F2D5F18();
      if (v4)
        goto LABEL_9;
      goto LABEL_15;
    }
  }
  sub_23F2D599C();
  if (v4)
  {
LABEL_9:
    sub_23F2D59DC();
    swift_bridgeObjectRetain();
    sub_23F2DFAD0();
    sub_23F2D6178();
    if (v7)
      goto LABEL_10;
    goto LABEL_16;
  }
LABEL_15:
  sub_23F2D599C();
  if (v7)
  {
LABEL_10:
    sub_23F2D59DC();
    sub_23F2D5C24();
    sub_23F2DFAD0();
    sub_23F2D59EC();
    if (v5)
      goto LABEL_11;
LABEL_17:
    sub_23F2D599C();
    if (v6)
      goto LABEL_12;
    goto LABEL_18;
  }
LABEL_16:
  sub_23F2D599C();
  if (!v5)
    goto LABEL_17;
LABEL_11:
  sub_23F2D59DC();
  sub_23F2D5CFC();
  sub_23F2DFAD0();
  sub_23F2D5814();
  if (v6)
  {
LABEL_12:
    sub_23F2D59DC();
    swift_bridgeObjectRetain();
    sub_23F2D62CC();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_18:
  sub_23F2D599C();
  sub_23F2D60EC();
}

uint64_t static AddressComponents.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  uint64_t result;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50;
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
  char v62;
  char v63;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  char v74;
  char v76;
  char v78;
  char v80;
  BOOL v81;
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
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;

  v3 = a1[1];
  v4 = a1[2];
  v6 = a1[3];
  v5 = a1[4];
  v8 = a1[5];
  v7 = a1[6];
  v9 = a1[7];
  v10 = a1[8];
  v12 = a1[9];
  v11 = a1[10];
  v13 = a1[11];
  v108 = a1[12];
  v112 = a1[13];
  v14 = a1[14];
  v111 = a1[15];
  v15 = a2[1];
  v16 = a2[2];
  v18 = a2[3];
  v17 = a2[4];
  v20 = a2[5];
  v19 = a2[6];
  v22 = a2[7];
  v21 = a2[8];
  v24 = a2[9];
  v23 = a2[10];
  v25 = a2[11];
  v109 = a2[12];
  v26 = a2[13];
  v107 = a2[14];
  v110 = a2[15];
  if (!v3)
  {
    if (v15)
      return 0;
    goto LABEL_10;
  }
  if (!v15)
    return 0;
  if (*a1 == *a2 && v3 == v15)
    goto LABEL_10;
  v100 = a2[7];
  v103 = a2[8];
  v84 = a1[11];
  v85 = a2[13];
  v82 = a2[2];
  v83 = a1[2];
  v28 = a1[14];
  v89 = a2[5];
  v91 = a1[5];
  v29 = a1[10];
  v95 = a1[6];
  v97 = a2[6];
  v30 = a2[11];
  v31 = a2[10];
  v93 = a1[4];
  v32 = a1[8];
  v33 = a1[9];
  v87 = a2[4];
  v34 = a2[9];
  v35 = a1[7];
  v36 = sub_23F2DFC5C();
  v22 = v100;
  v21 = v103;
  v9 = v35;
  v24 = v34;
  v12 = v33;
  v8 = v91;
  v10 = v32;
  v5 = v93;
  v7 = v95;
  v23 = v31;
  v4 = v83;
  v13 = v84;
  v25 = v30;
  v19 = v97;
  v11 = v29;
  v17 = v87;
  v20 = v89;
  v14 = v28;
  v16 = v82;
  v26 = v85;
  v37 = v36;
  result = 0;
  if ((v37 & 1) != 0)
  {
LABEL_10:
    if (v6)
    {
      if (!v18)
        return 0;
      if (v4 != v16 || v6 != v18)
      {
        v101 = v22;
        v104 = v21;
        v40 = v14;
        v88 = v17;
        v90 = v20;
        v41 = v11;
        v42 = v13;
        v43 = v25;
        v44 = v23;
        v92 = v8;
        v94 = v5;
        v45 = v10;
        v46 = v12;
        v47 = v24;
        v96 = v7;
        v98 = v19;
        v48 = v9;
        v49 = sub_23F2DFC5C();
        v9 = v48;
        v19 = v98;
        v22 = v101;
        v21 = v104;
        v24 = v47;
        v12 = v46;
        v20 = v90;
        v8 = v92;
        v10 = v45;
        v5 = v94;
        v7 = v96;
        v23 = v44;
        v25 = v43;
        v13 = v42;
        v11 = v41;
        v17 = v88;
        v14 = v40;
        v50 = v49;
        result = 0;
        if ((v50 & 1) == 0)
          return result;
      }
    }
    else if (v18)
    {
      return 0;
    }
    if (v8)
    {
      if (!v20)
        return 0;
      if (v5 != v17 || v8 != v20)
      {
        v102 = v22;
        v105 = v21;
        v86 = v26;
        v99 = v19;
        v52 = v14;
        v53 = v11;
        v54 = v13;
        v55 = v25;
        v56 = v23;
        v57 = v10;
        v58 = v12;
        v59 = v24;
        v60 = v7;
        v61 = v9;
        v62 = sub_23F2DFC5C();
        v22 = v102;
        v21 = v105;
        v9 = v61;
        v7 = v60;
        v24 = v59;
        v12 = v58;
        v10 = v57;
        v23 = v56;
        v25 = v55;
        v13 = v54;
        v11 = v53;
        v14 = v52;
        v19 = v99;
        v26 = v86;
        v63 = v62;
        result = 0;
        if ((v63 & 1) == 0)
          return result;
      }
    }
    else if (v20)
    {
      return 0;
    }
    if (v9)
    {
      if (!v22)
        return 0;
      if (v7 != v19 || v9 != v22)
      {
        v106 = v21;
        v65 = v14;
        v66 = v11;
        v67 = v13;
        v68 = v25;
        v69 = v23;
        v70 = v10;
        v71 = v12;
        v72 = v24;
        v73 = sub_23F2DFC5C();
        v21 = v106;
        v24 = v72;
        v12 = v71;
        v10 = v70;
        v23 = v69;
        v25 = v68;
        v13 = v67;
        v11 = v66;
        v14 = v65;
        v74 = v73;
        result = 0;
        if ((v74 & 1) == 0)
          return result;
      }
    }
    else if (v22)
    {
      return 0;
    }
    if (v12)
    {
      if (!v24)
        return 0;
      if (v10 != v21 || v12 != v24)
      {
        sub_23F2DFC5C();
        result = sub_23F2D5B70();
        if ((v76 & 1) == 0)
          return result;
      }
    }
    else if (v24)
    {
      return 0;
    }
    if (v13)
    {
      if (!v25)
        return 0;
      if (v11 != v23 || v13 != v25)
      {
        sub_23F2D60D8();
        result = sub_23F2D5B70();
        if ((v78 & 1) == 0)
          return result;
      }
    }
    else if (v25)
    {
      return 0;
    }
    if (v112)
    {
      if (!v26)
        return 0;
      if (v108 != v109 || v112 != v26)
      {
        sub_23F2D60D8();
        result = sub_23F2D5B70();
        if ((v80 & 1) == 0)
          return result;
      }
    }
    else if (v26)
    {
      return 0;
    }
    if (v111)
    {
      if (v110)
      {
        v81 = v14 == v107 && v111 == v110;
        if (v81 || (sub_23F2D59A4() & 1) != 0)
          return 1;
      }
    }
    else if (!v110)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t sub_23F2CA848()
{
  unint64_t result;

  result = qword_256E61AC8;
  if (!qword_256E61AC8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E27CC, &type metadata for DetectedEntityDetails.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61AC8);
  }
  return result;
}

void sub_23F2CA884(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    sub_23F2D62EC();
  }
  sub_23F2C53A4();
}

void sub_23F2CA8B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = sub_23F2D6018(a1, a2, a3);
  sub_23F2D5B7C(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  sub_23F2C53A4();
}

uint64_t sub_23F2CA8E4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  char v13;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_23F2DFC5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x656C746954626F6ALL && a2 == 0xE800000000000000;
    if (v6 || (sub_23F2DFC5C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x617A696E6167726FLL && a2 == 0xEC0000006E6F6974;
      if (v7 || (sub_23F2DFC5C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x746565727473 && a2 == 0xE600000000000000;
        if (v8 || (sub_23F2DFC5C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 2037672291 && a2 == 0xE400000000000000;
          if (v9 || (sub_23F2DFC5C() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 0x6574617473 && a2 == 0xE500000000000000;
            if (v10 || (sub_23F2DFC5C() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              v11 = a1 == 0x65646F4370697ALL && a2 == 0xE700000000000000;
              if (v11 || (sub_23F2DFC5C() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else if (a1 == 0x7972746E756F63 && a2 == 0xE700000000000000)
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else
              {
                v13 = sub_23F2DFC5C();
                swift_bridgeObjectRelease();
                if ((v13 & 1) != 0)
                  return 7;
                else
                  return 8;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_23F2CAC00()
{
  return 8;
}

uint64_t sub_23F2CAC08(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23F2CAC34 + 4 * byte_23F2E02F2[a1]))(1701667182, 0xE400000000000000);
}

uint64_t sub_23F2CAC34()
{
  return 0x656C746954626F6ALL;
}

uint64_t sub_23F2CAC4C()
{
  return 0x617A696E6167726FLL;
}

uint64_t sub_23F2CAC6C()
{
  return 0x746565727473;
}

uint64_t sub_23F2CAC80()
{
  return 2037672291;
}

uint64_t sub_23F2CAC8C()
{
  return 0x6574617473;
}

uint64_t sub_23F2CACA0()
{
  return 0x65646F4370697ALL;
}

uint64_t sub_23F2CACB8()
{
  return 0x7972746E756F63;
}

uint64_t sub_23F2CACD0()
{
  unsigned __int8 *v0;

  return sub_23F2CAC08(*v0);
}

uint64_t sub_23F2CACD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2CA8E4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F2CACFC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23F2CAC00();
  *a1 = result;
  return result;
}

uint64_t sub_23F2CAD20()
{
  sub_23F2CFBEC();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2CAD48()
{
  sub_23F2CFBEC();
  return sub_23F2DFCC8();
}

void AddressComponents.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  sub_23F2D57B8();
  v3 = v2;
  v4 = sub_23F2C3FA0(&qword_256E61CB8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  sub_23F2D596C();
  sub_23F2D5AE8();
  sub_23F2C3FE0(v3, v3[3]);
  sub_23F2CFBEC();
  sub_23F2DFCB0();
  sub_23F2D5EB4();
  sub_23F2DFC14();
  if (!v0)
  {
    sub_23F2D62B0();
    sub_23F2D57AC();
    sub_23F2D57AC();
    sub_23F2D6180();
    sub_23F2D57AC();
    sub_23F2D57AC();
    sub_23F2D57AC();
    sub_23F2D57AC();
    sub_23F2D57AC();
  }
  sub_23F2D58A8(v1, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  sub_23F2C4890();
}

void AddressComponents.hashValue.getter()
{
  sub_23F2D57D0();
  AddressComponents.hash(into:)();
  sub_23F2D5888();
  sub_23F2D578C();
}

void AddressComponents.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
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
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[16];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  sub_23F2D57B8();
  v4 = v3;
  v33 = v5;
  sub_23F2C3FA0(&qword_256E61CC8);
  sub_23F2D5C88();
  MEMORY[0x24BDAC7A8](v6);
  sub_23F2D5954();
  v7 = v4[3];
  v8 = v4[4];
  v9 = sub_23F2C3FE0(v4, v7);
  sub_23F2CFBEC();
  sub_23F2DFCA4();
  v34 = (uint64_t)v4;
  if (v0)
  {
    sub_23F2D58B8();
    sub_23F2C4254((uint64_t)v4);
    v43 = 0;
    v44 = 0;
    v45 = 0;
    v46 = 0;
    v47 = v7;
    v48 = v39;
    v49 = v4;
    v50 = v38;
    v51 = v9;
    v52 = v37;
    v53 = v1;
    v54 = v0;
    v55 = v8;
    v56 = v35;
    v57 = 0;
    v58 = 0;
  }
  else
  {
    v10 = sub_23F2DFBC0();
    v12 = v11;
    v32 = v10;
    sub_23F2D5A78();
    v41 = v12;
    v31 = sub_23F2D59AC();
    v14 = v13;
    sub_23F2D5A78();
    v40 = v14;
    v15 = sub_23F2D59AC();
    v17 = v16;
    v30 = v15;
    sub_23F2D5A78();
    v29 = sub_23F2D59AC();
    sub_23F2D5EE0(4);
    v28 = sub_23F2D59AC();
    sub_23F2D5EE0(5);
    v18 = sub_23F2D59AC();
    v20 = v19;
    v27 = v18;
    LOBYTE(v43) = 6;
    sub_23F2D5A78();
    v26 = sub_23F2D59AC();
    v36 = v21;
    sub_23F2D5A78();
    v22 = sub_23F2DFBC0();
    v24 = v23;
    v25 = v22;
    sub_23F2D57DC(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
    sub_23F2D5C24();
    sub_23F2D62D4();
    v42[0] = v32;
    v42[1] = v41;
    v42[2] = v31;
    v42[3] = v40;
    v42[4] = v30;
    v42[5] = v17;
    v42[6] = v29;
    v42[7] = v17;
    v42[8] = v28;
    v42[9] = v17;
    v42[10] = v27;
    v42[11] = v20;
    v42[12] = v26;
    v42[13] = v36;
    v42[14] = v25;
    v42[15] = v24;
    sub_23F2CEDB0((uint64_t)v42);
    sub_23F2D59E4();
    sub_23F2D5F18();
    swift_bridgeObjectRelease();
    sub_23F2D5EAC();
    swift_bridgeObjectRelease();
    sub_23F2D59E4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23F2D5930(v33, v42);
    sub_23F2C4254(v34);
    v43 = v32;
    v44 = v41;
    v45 = v31;
    v46 = v40;
    v47 = v30;
    v48 = v17;
    v49 = (_QWORD *)v29;
    v50 = v17;
    v51 = (_QWORD *)v28;
    v52 = v17;
    v53 = v27;
    v54 = v20;
    v55 = v26;
    v56 = v36;
    v57 = v25;
    v58 = v24;
  }
  sub_23F2CFC28();
  sub_23F2C4890();
}

uint64_t sub_23F2CB3E4()
{
  sub_23F2DFC74();
  AddressComponents.hash(into:)();
  return sub_23F2DFC98();
}

void sub_23F2CB420()
{
  AddressComponents.init(from:)();
}

void sub_23F2CB434()
{
  AddressComponents.encode(to:)();
}

uint64_t DetectedDate.startDateComponents.getter()
{
  return sub_23F2CC014((void (*)(_QWORD))MEMORY[0x24BDCBDE0]);
}

uint64_t DetectedDate.startDateComponents.setter(uint64_t a1)
{
  return sub_23F2CC050(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDCBDE0]);
}

uint64_t (*DetectedDate.startDateComponents.modify())()
{
  return nullsub_1;
}

void DetectedDate.endDateComponents.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for DetectedDate(0);
  sub_23F2CFF54(v1 + *(int *)(v3 + 20), a1, &qword_256E61AF0);
  sub_23F2C53A4();
}

void DetectedDate.endDateComponents.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for DetectedDate(0);
  sub_23F2CFF00(a1, v1 + *(int *)(v3 + 20), &qword_256E61AF0);
  sub_23F2C53A4();
}

uint64_t (*DetectedDate.endDateComponents.modify())()
{
  type metadata accessor for DetectedDate(0);
  return nullsub_1;
}

void DetectedDate.init(startDateComponents:endDateComponents:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a3 + *(int *)(type metadata accessor for DetectedDate(0) + 20);
  v7 = sub_23F2D5BC4();
  v8 = sub_23F2D5F38();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v8, v9, v10, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a3, a1, v7);
  sub_23F2CFF00(a2, v6, &qword_256E61AF0);
  sub_23F2D5EC8();
}

void DetectedDate.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  sub_23F2D58DC();
  sub_23F2C3FA0(&qword_256E61AF0);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v2);
  sub_23F2D5858();
  v3 = sub_23F2D5BC4();
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v4);
  sub_23F2D5870();
  sub_23F2CA884(&qword_256E61CD0, v5);
  sub_23F2D624C();
  sub_23F2DFADC();
  v6 = sub_23F2D59EC();
  v9 = sub_23F2D5B28(v6, v7, v8, MEMORY[0x24BEE4AF8]);
  v11 = *(_QWORD *)(v9 + 16);
  v10 = *(_QWORD *)(v9 + 24);
  if (v11 >= v10 >> 1)
    v9 = sub_23F2D5C0C(v10);
  *(_QWORD *)(v9 + 16) = v11 + 1;
  v12 = v9 + 16 * v11;
  *(_QWORD *)(v12 + 32) = 0x203A7472617453;
  *(_QWORD *)(v12 + 40) = 0xE700000000000000;
  v13 = type metadata accessor for DetectedDate(0);
  sub_23F2CFF54(v0 + *(int *)(v13 + 20), v1, &qword_256E61AF0);
  v14 = _s23IntelligenceFlowContext14DetectedEntityOwet_0(v1, 1, v3);
  if ((_DWORD)v14 == 1)
  {
    sub_23F2D614C(v14, &qword_256E61AF0);
  }
  else
  {
    sub_23F2D5DFC();
    sub_23F2D624C();
    sub_23F2DFADC();
    sub_23F2D5A9C();
    v16 = *(_QWORD *)(v9 + 16);
    v15 = *(_QWORD *)(v9 + 24);
    if (v16 >= v15 >> 1)
      v9 = sub_23F2D5C0C(v15);
    *(_QWORD *)(v9 + 16) = v16 + 1;
    v17 = v9 + 16 * v16;
    *(_QWORD *)(v17 + 32) = 0x203A646E45;
    *(_QWORD *)(v17 + 40) = 0xE500000000000000;
    sub_23F2D5F48();
  }
  sub_23F2C3FA0(&qword_254344E18);
  sub_23F2D0364(&qword_254344E20, &qword_254344E18);
  sub_23F2DFA94();
  sub_23F2D59EC();
  sub_23F2D57E8();
  sub_23F2D5830();
}

void DetectedDate.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_23F2D5BC4();
  v5 = (void (*)(uint64_t))MEMORY[0x24BDCBDE0];
  sub_23F2D5E8C();
  MEMORY[0x24BDAC7A8](v6);
  sub_23F2D596C();
  sub_23F2C3FA0(&qword_256E61AF0);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v7);
  sub_23F2D5954();
  sub_23F2CA884(&qword_256E61B00, v5);
  sub_23F2D612C();
  v8 = type metadata accessor for DetectedDate(0);
  sub_23F2CFF54(v0 + *(int *)(v8 + 20), v2, &qword_256E61AF0);
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0(v2, 1, v4) == 1)
  {
    sub_23F2D627C();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v2, v4);
    sub_23F2D627C();
    sub_23F2D612C();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v4);
  }
  sub_23F2D5E44();
}

uint64_t sub_23F2CB888(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000013 && a2 == 0x800000023F2E39F0 || (sub_23F2DFC5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023F2E3A10)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_23F2DFC5C();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

void sub_23F2CB970()
{
  sub_23F2D57D0();
  sub_23F2DFC80();
  sub_23F2D5888();
  sub_23F2D578C();
}

unint64_t sub_23F2CB9A0(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000011;
  else
    return 0xD000000000000013;
}

void sub_23F2CB9DC()
{
  sub_23F2CB970();
}

void sub_23F2CB9F4()
{
  sub_23F2D5C80();
  sub_23F2D6264();
  sub_23F2D5888();
  sub_23F2D578C();
}

unint64_t sub_23F2CBA1C()
{
  char *v0;

  return sub_23F2CB9A0(*v0);
}

uint64_t sub_23F2CBA24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2CB888(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F2CBA48()
{
  sub_23F2CFC9C();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2CBA70()
{
  sub_23F2CFC9C();
  return sub_23F2DFCC8();
}

void DetectedDate.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;

  sub_23F2D60A0();
  sub_23F2C3FA0(&qword_256E61CD8);
  sub_23F2D5A38();
  MEMORY[0x24BDAC7A8](v1);
  sub_23F2D58F4();
  sub_23F2CFC9C();
  sub_23F2D5944();
  sub_23F2DF98C();
  sub_23F2CA884(&qword_256E61CE8, (void (*)(uint64_t))MEMORY[0x24BDCBDE0]);
  sub_23F2D6038();
  sub_23F2DFC44();
  if (!v0)
  {
    type metadata accessor for DetectedDate(0);
    sub_23F2D6038();
    sub_23F2DFC20();
  }
  sub_23F2D5BB4();
  sub_23F2D581C();
}

void DetectedDate.hashValue.getter()
{
  sub_23F2CE6A8((void (*)(_BYTE *))DetectedDate.hash(into:));
}

void DetectedDate.init(from:)()
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
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(_QWORD);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  sub_23F2D57B8();
  v4 = v3;
  v17 = v5;
  sub_23F2C3FA0(&qword_256E61AF0);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v6);
  sub_23F2D5714();
  v19 = v7;
  sub_23F2D5C3C();
  v8 = sub_23F2DF98C();
  sub_23F2D5E7C();
  MEMORY[0x24BDAC7A8](v9);
  sub_23F2D5DCC(v10, v17);
  sub_23F2C3FA0(&qword_256E61CF0);
  sub_23F2D5E8C();
  MEMORY[0x24BDAC7A8](v11);
  v12 = sub_23F2D5D78();
  type metadata accessor for DetectedDate(v12);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v13);
  sub_23F2D5984();
  v21 = v0 + *(int *)(v14 + 20);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v21, 1, 1, v8);
  sub_23F2C3FE0(v4, v4[3]);
  sub_23F2CFC9C();
  sub_23F2DFCA4();
  if (v1)
  {
    sub_23F2D60E4();
    sub_23F2CFF80(v21, &qword_256E61AF0);
  }
  else
  {
    sub_23F2CA884(&qword_256E61CF8, (void (*)(uint64_t))MEMORY[0x24BDCBDE0]);
    sub_23F2DFBF0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v0, v20, v8);
    sub_23F2DFBCC();
    sub_23F2D5B60();
    sub_23F2CFF00(v19, v21, &qword_256E61AF0);
    sub_23F2D6154(v0, v18);
    sub_23F2D60E4();
    v15 = sub_23F2D57E8();
    sub_23F2C9A68(v15, v16);
  }
  sub_23F2C4890();
}

void sub_23F2CBDCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F2CE8F8(a1, a2, a3, (void (*)(_BYTE *))DetectedDate.hash(into:));
}

void sub_23F2CBDD8()
{
  DetectedDate.init(from:)();
}

void sub_23F2CBDEC()
{
  DetectedDate.encode(to:)();
}

uint64_t (*DetectedPhoneNumber.phoneNumber.modify())()
{
  return nullsub_1;
}

void DetectedPhoneNumber.description.getter()
{
  sub_23F2D5C98();
}

uint64_t sub_23F2CBE38(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6D754E656E6F6870 && a2 == 0xEB00000000726562)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23F2DFC5C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23F2CBED4()
{
  return 0x6D754E656E6F6870;
}

uint64_t sub_23F2CBEF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2CBE38(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23F2CBF20()
{
  sub_23F2CFCD8();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2CBF48()
{
  sub_23F2CFCD8();
  return sub_23F2DFCC8();
}

void DetectedPhoneNumber.encode(to:)()
{
  sub_23F2CEBB8();
}

void DetectedPhoneNumber.init(from:)()
{
  sub_23F2CECD4();
}

void sub_23F2CBFDC()
{
  DetectedPhoneNumber.init(from:)();
}

void sub_23F2CBFF0()
{
  DetectedPhoneNumber.encode(to:)();
}

uint64_t DetectedLink.url.getter()
{
  return sub_23F2CC014((void (*)(_QWORD))MEMORY[0x24BDCDAC0]);
}

uint64_t sub_23F2CC014(void (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  a1(0);
  sub_23F2D608C();
  v1 = sub_23F2D57E8();
  return sub_23F2D5A8C(v1, v2, v3, v4);
}

uint64_t DetectedLink.url.setter(uint64_t a1)
{
  return sub_23F2CC050(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0]);
}

uint64_t sub_23F2CC050(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  sub_23F2D6284(a1, a2);
  sub_23F2D608C();
  v2 = sub_23F2D6304();
  return sub_23F2D5A8C(v2, v3, v4, v5);
}

uint64_t (*DetectedLink.url.modify())()
{
  return nullsub_1;
}

uint64_t DetectedLink.init(url:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_23F2D5AE0();
  sub_23F2D608C();
  v0 = sub_23F2D6304();
  return sub_23F2D5A8C(v0, v1, v2, v3);
}

void DetectedLink.description.getter()
{
  sub_23F2D60F4();
  sub_23F2D5AE0();
  sub_23F2CA884(&qword_256E61AE8, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  sub_23F2DFC50();
  sub_23F2D5E24();
  sub_23F2D5AC0();
  sub_23F2D616C();
}

uint64_t DetectedLink.hash(into:)()
{
  sub_23F2D5AE0();
  sub_23F2CA884(&qword_256E61AF8, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  return sub_23F2DFA88();
}

uint64_t sub_23F2CC160()
{
  return 1;
}

uint64_t sub_23F2CC168()
{
  return sub_23F2DFC80();
}

uint64_t sub_23F2CC18C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 7107189 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23F2DFC5C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23F2CC200()
{
  return 7107189;
}

uint64_t sub_23F2CC214@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2CC18C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23F2CC23C()
{
  return sub_23F2C3CE8();
}

uint64_t sub_23F2CC254@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23F2CC160();
  *a1 = result & 1;
  return result;
}

uint64_t sub_23F2CC27C()
{
  sub_23F2CFD14();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2CC2A4()
{
  sub_23F2CFD14();
  return sub_23F2DFCC8();
}

void DetectedLink.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;

  sub_23F2D60A0();
  sub_23F2C3FA0(&qword_256E61D18);
  sub_23F2D5A38();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F2D58F4();
  sub_23F2CFD14();
  sub_23F2D5944();
  sub_23F2DF9D4();
  sub_23F2CA884(&qword_256E61D28, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  sub_23F2D6138();
  sub_23F2D5898((uint64_t)v3, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  sub_23F2D581C();
}

void DetectedLink.hashValue.getter()
{
  sub_23F2D57D0();
  sub_23F2D5AE0();
  sub_23F2CA884(&qword_256E61AF8, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  sub_23F2DFA88();
  sub_23F2D5888();
  sub_23F2D578C();
}

void DetectedLink.init(from:)()
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

  sub_23F2D57B8();
  v5 = v4;
  v13 = v6;
  v15 = sub_23F2DF9D4();
  v12 = *(_QWORD *)(v15 - 8);
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v7);
  sub_23F2D5714();
  v14 = v8;
  sub_23F2C3FA0(&qword_256E61D30);
  sub_23F2D5E7C();
  MEMORY[0x24BDAC7A8](v9);
  v10 = sub_23F2D5A04();
  type metadata accessor for DetectedLink(v10);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v11);
  sub_23F2D5F90();
  sub_23F2C3FE0(v5, v5[3]);
  sub_23F2CFD14();
  sub_23F2DFCA4();
  if (!v0)
  {
    sub_23F2CA884(&qword_256E61D38, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
    sub_23F2DFBF0();
    sub_23F2D58A8(v3, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v2, v14, v15);
    sub_23F2C9A88(v2, v13, type metadata accessor for DetectedLink);
  }
  sub_23F2C48B8();
  sub_23F2C4890();
}

uint64_t sub_23F2CC55C()
{
  sub_23F2DFC74();
  sub_23F2DF9D4();
  sub_23F2CA884(&qword_256E61AF8, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  sub_23F2DFA88();
  return sub_23F2DFC98();
}

void sub_23F2CC5C4()
{
  DetectedLink.init(from:)();
}

void sub_23F2CC5D8()
{
  DetectedLink.encode(to:)();
}

void DetectedAddress.addressComponents.getter()
{
  const void *v0;
  void *v1;
  const void *v2;
  _BYTE v3[128];

  sub_23F2D5930(v3, v0);
  v1 = (void *)sub_23F2D57E8();
  sub_23F2D5930(v1, v2);
  sub_23F2CEDB0((uint64_t)v3);
  sub_23F2D60EC();
}

void DetectedAddress.addressComponents.setter()
{
  const void *v0;
  void *v1;
  const void *v2;
  uint64_t v3;

  sub_23F2D5930(&v3, v0);
  sub_23F2CFC28();
  v1 = (void *)sub_23F2D6304();
  sub_23F2D5930(v1, v2);
  sub_23F2D60EC();
}

uint64_t (*DetectedAddress.addressComponents.modify())()
{
  return nullsub_1;
}

void __swiftcall DetectedAddress.init(addressComponents:)(IntelligenceFlowContext::DetectedAddress *__return_ptr retstr, IntelligenceFlowContext::AddressComponents *addressComponents)
{
  memcpy(retstr, addressComponents, sizeof(IntelligenceFlowContext::DetectedAddress));
}

uint64_t DetectedAddress.description.getter()
{
  const void *v0;
  uint64_t v1;
  uint64_t v3;
  _BYTE v4[128];

  sub_23F2D5930(v4, v0);
  sub_23F2D5CD8();
  v3 = v1;
  sub_23F2CEDB0((uint64_t)v4);
  AddressComponents.description.getter();
  sub_23F2D5E24();
  sub_23F2D5AC0();
  sub_23F2CFC28();
  return v3;
}

uint64_t sub_23F2CC6E0(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000011 && a2 == 0x800000023F2E3A30)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_23F2DFC5C();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_23F2CC764()
{
  return 0xD000000000000011;
}

uint64_t sub_23F2CC784@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2CC6E0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23F2CC7AC()
{
  sub_23F2CFD50();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2CC7D4()
{
  sub_23F2CFD50();
  return sub_23F2DFCC8();
}

void DetectedAddress.encode(to:)()
{
  const void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE v5[128];

  sub_23F2D60A0();
  sub_23F2C3FA0(&qword_256E61D40);
  sub_23F2D5A38();
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v5[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23F2D58F4();
  sub_23F2CFD50();
  sub_23F2D5944();
  sub_23F2D5930(v5, v0);
  sub_23F2CFD8C();
  sub_23F2D6138();
  sub_23F2D5898((uint64_t)v4, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_23F2D581C();
}

void DetectedAddress.hashValue.getter()
{
  sub_23F2D57D0();
  AddressComponents.hash(into:)();
  sub_23F2D5888();
  sub_23F2D578C();
}

void DetectedAddress.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  sub_23F2D57B8();
  v4 = v3;
  v6 = v5;
  sub_23F2C3FA0(&qword_256E61D58);
  sub_23F2D5C88();
  MEMORY[0x24BDAC7A8](v7);
  sub_23F2D5F78();
  sub_23F2C3FE0(v4, v4[3]);
  sub_23F2CFD50();
  sub_23F2DFCA4();
  if (!v0)
  {
    sub_23F2CFDC8();
    sub_23F2D5A30();
    sub_23F2D5CF4(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
    sub_23F2D5930(v6, &v8);
  }
  sub_23F2C48B8();
  sub_23F2C4890();
}

void sub_23F2CC9D0()
{
  DetectedAddress.init(from:)();
}

void sub_23F2CC9E4()
{
  DetectedAddress.encode(to:)();
}

void DetectedPerson.name.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

void DetectedPerson.name.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  sub_23F2D5A20();
  *v1 = v2;
  v1[1] = v0;
  sub_23F2D5750();
}

uint64_t (*DetectedPerson.name.modify())()
{
  return nullsub_1;
}

void DetectedPerson.emailAddress.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

void DetectedPerson.emailAddress.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F2D5BA4();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  sub_23F2D5750();
}

uint64_t (*DetectedPerson.emailAddress.modify())()
{
  return nullsub_1;
}

void DetectedPerson.phoneNumber.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

void DetectedPerson.phoneNumber.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F2D6008();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v0;
  sub_23F2D5750();
}

uint64_t (*DetectedPerson.phoneNumber.modify())()
{
  return nullsub_1;
}

void DetectedPerson.contactId.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

void DetectedPerson.contactId.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F2D5FF8();
  *(_QWORD *)(v1 + 48) = v2;
  *(_QWORD *)(v1 + 56) = v0;
  sub_23F2D5750();
}

uint64_t (*DetectedPerson.contactId.modify())()
{
  return nullsub_1;
}

void __swiftcall DetectedPerson.init(name:)(IntelligenceFlowContext::DetectedPerson *__return_ptr retstr, Swift::String name)
{
  retstr->name = name;
  retstr->emailAddress = 0u;
  retstr->phoneNumber = 0u;
  retstr->contactId = 0u;
}

void __swiftcall DetectedPerson.init(name:emailAddress:phoneNumber:)(IntelligenceFlowContext::DetectedPerson *__return_ptr retstr, Swift::String name, Swift::String_optional emailAddress, Swift::String_optional phoneNumber)
{
  retstr->name = name;
  retstr->emailAddress = emailAddress;
  retstr->phoneNumber = phoneNumber;
  retstr->contactId.value._countAndFlagsBits = 0;
  retstr->contactId.value._object = 0;
}

void __swiftcall DetectedPerson.init(inPerson:)(IntelligenceFlowContext::DetectedPerson_optional *__return_ptr retstr, INPerson inPerson)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t inited;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
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
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[10];

  sub_23F2D58DC();
  v5 = v4;
  v7 = v6;
  sub_23F2C3FA0(&qword_256E61D68);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v8);
  sub_23F2D5FD8();
  MEMORY[0x24BDAC7A8](v9);
  sub_23F2D5C48();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v66 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v66 - v14;
  sub_23F2C3FA0(&qword_256E61D70);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23F2E2820;
  v17 = sub_23F2D615C(inited, sel_nameComponents);
  if (v17)
  {
    v18 = v17;
    sub_23F2DF9B0();

    sub_23F2DF9BC();
    v19 = (uint64_t)v13;
    v20 = 0;
  }
  else
  {
    sub_23F2DF9BC();
    v19 = (uint64_t)v13;
    v20 = 1;
  }
  sub_23F2D6120(v19, v20);
  sub_23F2CFE04((uint64_t)v13, (uint64_t)v15);
  sub_23F2DF9BC();
  if (sub_23F2D60AC((uint64_t)v15))
  {
    sub_23F2CFF80((uint64_t)v15, &qword_256E61D68);
    *(_QWORD *)(inited + 32) = 0;
    *(_QWORD *)(inited + 40) = 0;
  }
  else
  {
    *(_QWORD *)(inited + 32) = sub_23F2DF998();
    *(_QWORD *)(inited + 40) = v22;
    sub_23F2CFF80((uint64_t)v15, &qword_256E61D68);
  }
  v23 = sub_23F2D615C(v21, sel_nameComponents);
  if (v23)
  {
    v24 = v23;
    sub_23F2DF9B0();

    v25 = 0;
  }
  else
  {
    v25 = 1;
  }
  sub_23F2D6120(v3, v25);
  v26 = sub_23F2D5EB4();
  sub_23F2CFE04(v26, v27);
  v28 = sub_23F2D60AC(v2);
  if ((_DWORD)v28)
  {
    sub_23F2D614C(v28, &qword_256E61D68);
    *(_QWORD *)(inited + 48) = 0;
    *(_QWORD *)(inited + 56) = 0;
  }
  else
  {
    v29 = sub_23F2DF9A4();
    *(_QWORD *)(inited + 48) = v29;
    *(_QWORD *)(inited + 56) = v30;
    sub_23F2D614C(v29, &qword_256E61D68);
  }
  v31 = *(_QWORD *)(inited + 40);
  if (v31)
  {
    v32 = *(_QWORD *)(inited + 32);
    v33 = sub_23F2C48C0();
    v36 = sub_23F2D5B28(v33, v34, v35, MEMORY[0x24BEE4AF8]);
    v38 = *(_QWORD *)(v36 + 16);
    v37 = *(_QWORD *)(v36 + 24);
    if (v38 >= v37 >> 1)
      v36 = sub_23F2D5BF4(v37);
    *(_QWORD *)(v36 + 16) = v38 + 1;
    v39 = v36 + 16 * v38;
    *(_QWORD *)(v39 + 32) = v32;
    *(_QWORD *)(v39 + 40) = v31;
  }
  else
  {
    v36 = MEMORY[0x24BEE4AF8];
  }
  v40 = *(_QWORD *)(inited + 56);
  if (v40)
  {
    v41 = *(_QWORD *)(inited + 48);
    sub_23F2C48C0();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v36 = sub_23F2CF85C(0, *(_QWORD *)(v36 + 16) + 1, 1, v36);
    v43 = *(_QWORD *)(v36 + 16);
    v42 = *(_QWORD *)(v36 + 24);
    if (v43 >= v42 >> 1)
      v36 = sub_23F2D5BF4(v42);
    *(_QWORD *)(v36 + 16) = v43 + 1;
    v44 = v36 + 16 * v43;
    *(_QWORD *)(v44 + 32) = v41;
    *(_QWORD *)(v44 + 40) = v40;
  }
  sub_23F2D59EC();
  v66[1] = v36;
  sub_23F2C3FA0(&qword_254344E18);
  sub_23F2D0364(&qword_254344E20, &qword_254344E18);
  v45 = sub_23F2DFA94();
  v47 = v46;
  sub_23F2D5A9C();
  v48 = HIBYTE(v47) & 0xF;
  if ((v47 & 0x2000000000000000) == 0)
    v48 = v45 & 0xFFFFFFFFFFFFLL;
  if (v48)
  {
    sub_23F2C48C0();
    v49 = sub_23F2CFA24(v5);
    v51 = v50;
    sub_23F2D5A78();
    v52 = sub_23F2D62D4();
    v53 = sub_23F2D615C(v52, sel_personHandle);
    v66[0] = v49;
    if (v53)
    {
      v54 = v53;
      v55 = objc_msgSend(v53, sel_type);
      if (v55 == (id)1)
      {
        v61 = objc_msgSend(v54, sel_value);
        if (v61)
        {
          v62 = v61;
          v63 = sub_23F2DFAB8();
          v65 = v64;

        }
        else
        {

          v63 = 0;
          v65 = 0;
        }
        sub_23F2D62D4();
        goto LABEL_41;
      }
      if (v55 == (id)2)
      {
        v56 = objc_msgSend(v54, sel_value);
        if (v56)
        {
          v57 = v56;
          v58 = sub_23F2DFAB8();
          v60 = v59;

        }
        else
        {

          v58 = 0;
          v60 = 0;
        }
        sub_23F2D62D4();
        v63 = 0;
        v65 = 0;
        goto LABEL_42;
      }

    }
    v63 = 0;
    v65 = 0;
LABEL_41:
    v58 = 0;
    v60 = 0;
LABEL_42:
    swift_bridgeObjectRetain();
    *v7 = v45;
    v7[1] = v47;
    v7[2] = v63;
    v7[3] = v65;
    v7[4] = v58;
    v7[5] = v60;
    v7[6] = v66[0];
    v7[7] = v51;
    sub_23F2D5A9C();
    swift_bridgeObjectRelease();
    sub_23F2D58A0();
    goto LABEL_43;
  }
  swift_bridgeObjectRelease_n();
  sub_23F2D58A0();

  *((_OWORD *)v7 + 2) = 0u;
  *((_OWORD *)v7 + 3) = 0u;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
LABEL_43:
  sub_23F2D5830();
}

void DetectedPerson.description.getter()
{
  sub_23F2D5F00();
  sub_23F2DFB6C();
  sub_23F2D6110();
  sub_23F2D5CFC();
  sub_23F2D5B88();
  sub_23F2D5814();
  sub_23F2DFADC();
  sub_23F2D5C24();
  sub_23F2D5B88();
  sub_23F2D5814();
  sub_23F2DFADC();
  sub_23F2D5E30();
}

void DetectedPerson.hash(into:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23F2D58DC();
  v1 = v0[3];
  v2 = v0[5];
  v3 = v0[7];
  swift_bridgeObjectRetain();
  sub_23F2D6180();
  sub_23F2DFAD0();
  sub_23F2D5F18();
  if (v1)
  {
    sub_23F2D5C34();
    sub_23F2D5BD4();
    sub_23F2D5CCC();
    sub_23F2D59E4();
    if (v2)
      goto LABEL_3;
LABEL_6:
    sub_23F2D5C34();
    if (v3)
      goto LABEL_4;
    goto LABEL_7;
  }
  sub_23F2D5C34();
  if (!v2)
    goto LABEL_6;
LABEL_3:
  sub_23F2D5C34();
  sub_23F2D5C24();
  sub_23F2DFAD0();
  sub_23F2D59EC();
  if (v3)
  {
LABEL_4:
    sub_23F2D5C34();
    swift_bridgeObjectRetain();
    sub_23F2D62CC();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_7:
  sub_23F2D5C34();
  sub_23F2D5830();
}

uint64_t sub_23F2CD17C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  char v9;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_23F2DFC5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6464416C69616D65 && a2 == 0xEC00000073736572;
    if (v6 || (sub_23F2DFC5C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6D754E656E6F6870 && a2 == 0xEB00000000726562;
      if (v7 || (sub_23F2DFC5C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x49746361746E6F63 && a2 == 0xE900000000000064)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v9 = sub_23F2DFC5C();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t sub_23F2CD354()
{
  return 4;
}

uint64_t sub_23F2CD35C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23F2CD388 + 4 * byte_23F2E02FA[a1]))(1701667182, 0xE400000000000000);
}

uint64_t sub_23F2CD388()
{
  return 0x6464416C69616D65;
}

uint64_t sub_23F2CD3A8()
{
  return 0x6D754E656E6F6870;
}

uint64_t sub_23F2CD3C8()
{
  return 0x49746361746E6F63;
}

uint64_t sub_23F2CD3E4()
{
  unsigned __int8 *v0;

  return sub_23F2CD35C(*v0);
}

uint64_t sub_23F2CD3EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2CD17C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F2CD410@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23F2CD354();
  *a1 = result;
  return result;
}

uint64_t sub_23F2CD434()
{
  sub_23F2CFE4C();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2CD45C()
{
  sub_23F2CFE4C();
  return sub_23F2DFCC8();
}

void DetectedPerson.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  sub_23F2D57B8();
  v3 = v2;
  v4 = sub_23F2C3FA0(&qword_256E61D78);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  sub_23F2D596C();
  sub_23F2D5AE8();
  sub_23F2C3FE0(v3, v3[3]);
  sub_23F2CFE4C();
  sub_23F2DFCB0();
  sub_23F2D6180();
  sub_23F2DFC2C();
  if (!v0)
  {
    sub_23F2D62B0();
    sub_23F2D57AC();
    sub_23F2D57AC();
    sub_23F2D57AC();
  }
  sub_23F2D5B58(v1, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  sub_23F2C4890();
}

uint64_t DetectedPerson.hashValue.getter()
{
  sub_23F2D57D0();
  DetectedPerson.hash(into:)();
  return sub_23F2D5888();
}

void DetectedPerson.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t *v4;
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
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;

  sub_23F2D57B8();
  v2 = v1;
  v4 = v3;
  v5 = sub_23F2C3FA0(&qword_256E61D88);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F2C3FE0(v2, v2[3]);
  sub_23F2CFE4C();
  sub_23F2DFCA4();
  if (v0)
  {
    sub_23F2C48B8();
    sub_23F2D62D4();
  }
  else
  {
    v9 = sub_23F2DFBD8();
    v11 = v10;
    v27 = v9;
    sub_23F2D5A78();
    v12 = sub_23F2D5B38();
    v14 = v13;
    v25 = v12;
    v26 = v4;
    sub_23F2D5A78();
    v15 = sub_23F2D5B38();
    v17 = v16;
    v24 = v15;
    sub_23F2D5A78();
    v18 = sub_23F2D5B38();
    v20 = v19;
    v21 = *(void (**)(char *, uint64_t))(v6 + 8);
    v22 = v18;
    v21(v8, v5);
    sub_23F2C48C0();
    sub_23F2D62D4();
    v23 = v26;
    *v26 = v27;
    v23[1] = v11;
    v23[2] = v25;
    v23[3] = v14;
    v23[4] = v24;
    v23[5] = v17;
    v23[6] = v22;
    v23[7] = v20;
    sub_23F2C48B8();
    swift_bridgeObjectRelease();
    sub_23F2D5F18();
  }
  sub_23F2D59E4();
  swift_bridgeObjectRelease();
  sub_23F2C4890();
}

uint64_t sub_23F2CD808()
{
  sub_23F2DFC74();
  DetectedPerson.hash(into:)();
  return sub_23F2DFC98();
}

void sub_23F2CD85C()
{
  DetectedPerson.init(from:)();
}

void sub_23F2CD870()
{
  DetectedPerson.encode(to:)();
}

void DetectedPlace.place.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

void DetectedPlace.place.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  sub_23F2D5A20();
  *v1 = v2;
  v1[1] = v0;
  sub_23F2D5750();
}

uint64_t (*DetectedPlace.place.modify())()
{
  return nullsub_1;
}

IntelligenceFlowContext::DetectedPlace __swiftcall DetectedPlace.init(place:)(IntelligenceFlowContext::DetectedPlace place)
{
  IntelligenceFlowContext::DetectedPlace *v1;

  *v1 = place;
  return place;
}

uint64_t DetectedPlace.description.getter()
{
  uint64_t v0;
  uint64_t v2;

  sub_23F2D5E9C();
  v2 = v0;
  sub_23F2D5CFC();
  sub_23F2D5B88();
  sub_23F2D5814();
  return v2;
}

uint64_t sub_23F2CD930(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6563616C70 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23F2DFC5C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23F2CD9AC()
{
  return 0x6563616C70;
}

uint64_t sub_23F2CD9C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2CD930(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23F2CD9EC()
{
  sub_23F2CFE88();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2CDA14()
{
  sub_23F2CFE88();
  return sub_23F2DFCC8();
}

void DetectedPlace.encode(to:)()
{
  sub_23F2CEBB8();
}

void DetectedPlace.init(from:)()
{
  sub_23F2CECD4();
}

void sub_23F2CDA9C()
{
  DetectedPlace.init(from:)();
}

void sub_23F2CDAB0()
{
  DetectedPlace.encode(to:)();
}

uint64_t (*DetectedOrganization.organization.modify())()
{
  return nullsub_1;
}

void DetectedOrganization.description.getter()
{
  sub_23F2D5C98();
}

uint64_t sub_23F2CDAF8(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x617A696E6167726FLL && a2 == 0xEC0000006E6F6974)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23F2DFC5C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23F2CDB94()
{
  return 0x617A696E6167726FLL;
}

uint64_t sub_23F2CDBB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2CDAF8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23F2CDBE0()
{
  sub_23F2CFEC4();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2CDC08()
{
  sub_23F2CFEC4();
  return sub_23F2DFCC8();
}

void DetectedOrganization.encode(to:)()
{
  sub_23F2CEBB8();
}

void DetectedOrganization.init(from:)()
{
  sub_23F2CECD4();
}

void sub_23F2CDC90()
{
  DetectedOrganization.init(from:)();
}

void sub_23F2CDCA4()
{
  DetectedOrganization.encode(to:)();
}

void DetectedAppEntity.typeIdentifier.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

void DetectedAppEntity.typeIdentifier.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  sub_23F2D5A20();
  *v1 = v2;
  v1[1] = v0;
  sub_23F2D5750();
}

uint64_t (*DetectedAppEntity.typeIdentifier.modify())()
{
  return nullsub_1;
}

void DetectedAppEntity.instanceIdentifier.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

void DetectedAppEntity.instanceIdentifier.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F2D5BA4();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  sub_23F2D5750();
}

uint64_t (*DetectedAppEntity.instanceIdentifier.modify())()
{
  return nullsub_1;
}

void DetectedAppEntity.entityIdentifier.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  sub_23F2D6074();
  sub_23F2CFF54(v1 + v3, a1, &qword_256E61B20);
  sub_23F2C53A4();
}

void DetectedAppEntity.entityIdentifier.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for DetectedAppEntity(0);
  sub_23F2CFF00(a1, v1 + *(int *)(v3 + 24), &qword_256E61B20);
  sub_23F2C53A4();
}

uint64_t (*DetectedAppEntity.entityIdentifier.modify())()
{
  type metadata accessor for DetectedAppEntity(0);
  return nullsub_1;
}

void DetectedAppEntity.init(typeId:instanceId:displayRepresentation:appBundleId:)()
{
  uint64_t v0;
  uint64_t v1;
  _OWORD *v2;
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
  _QWORD *v22;
  _QWORD *v23;
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

  sub_23F2D58DC();
  v5 = v4;
  v32 = v7;
  v33 = v6;
  v9 = v8;
  v34 = v10;
  v31 = v11;
  v13 = v12;
  v36 = v14;
  v35 = sub_23F2D62DC();
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v15);
  sub_23F2D5858();
  sub_23F2C3FA0(&qword_256E61DC0);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v16);
  sub_23F2D5984();
  sub_23F2C3FA0(&qword_256E61B20);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v17);
  sub_23F2D5DB0();
  v18 = sub_23F2DFA7C();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  sub_23F2D5F68();
  MEMORY[0x24BDAC7A8](v20);
  v22 = (uint64_t *)((char *)&v31 - v21);
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = v32;
  v23[3] = v5;
  v24 = v31;
  v23[4] = v13;
  v23[5] = v24;
  *v22 = v23;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v19 + 104))(v22, *MEMORY[0x24BEB9CF8], v18);
  (*(void (**)(uint64_t, _QWORD *, uint64_t))(v19 + 16))(v3, v22, v18);
  v25 = v9;
  sub_23F2CFF54(v9, v0, &qword_256E61DC0);
  sub_23F2DFA64();
  v26 = sub_23F2D5E60();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v1, 0, 1, v26);
  *v2 = 0u;
  v2[1] = 0u;
  v27 = (uint64_t)v2 + *(int *)(v35 + 24);
  v28 = sub_23F2D5F38();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v28, v29, v30, v26);
  sub_23F2CFF00(v1, v27, &qword_256E61B20);
  sub_23F2C9A88((uint64_t)v2, v36, type metadata accessor for DetectedAppEntity);
  sub_23F2CFF80(v25, &qword_256E61DC0);
  (*(void (**)(_QWORD *, uint64_t))(v19 + 8))(v22, v18);
  sub_23F2D5830();
}

uint64_t DetectedAppEntity.init(identifier:)@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  sub_23F2D62DC();
  *a1 = 0u;
  a1[1] = 0u;
  sub_23F2D5E60();
  v2 = sub_23F2D5F38();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v2, v3, v4, v5);
  v6 = sub_23F2CFFA8();
  v7 = MEMORY[0x242667580](47, 0xE100000000000000, 1, 1, MEMORY[0x24BEE0D00], v6);
  sub_23F2D5814();
  if (*(_QWORD *)(v7 + 16) == 2)
  {
    sub_23F2D5BD4();
    sub_23F2D5D04();
  }
  return sub_23F2D58A0();
}

void DetectedAppEntity.init(typeIdentifier:instanceIdentifier:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_23F2D6074();
  v11 = (uint64_t)a5 + v10;
  v12 = sub_23F2D5E60();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v11, 1, 1, v12);
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  sub_23F2D5EC8();
}

void DetectedAppEntity.description.getter()
{
  sub_23F2D5F00();
  sub_23F2DFB6C();
  sub_23F2D6110();
  sub_23F2D6074();
  sub_23F2C3FA0(&qword_256E61B20);
  sub_23F2DFB30();
  sub_23F2D5E24();
  sub_23F2D5AC0();
  sub_23F2D616C();
}

void DetectedAppEntity.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = sub_23F2D5E60();
  sub_23F2D5E8C();
  MEMORY[0x24BDAC7A8]();
  sub_23F2D5870();
  sub_23F2C3FA0(&qword_256E61B20);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8]();
  sub_23F2D5858();
  if (*(_QWORD *)(v0 + 8))
  {
    sub_23F2D59DC();
    sub_23F2D5BD4();
    sub_23F2D5CCC();
    sub_23F2D59E4();
  }
  else
  {
    sub_23F2D599C();
  }
  if (*(_QWORD *)(v0 + 24))
  {
    sub_23F2D59DC();
    sub_23F2D5BD4();
    sub_23F2D5CCC();
    sub_23F2D59E4();
  }
  else
  {
    sub_23F2D599C();
  }
  sub_23F2D6074();
  sub_23F2CFF54(v0 + v3, v1, &qword_256E61B20);
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0(v1, 1, v2) == 1)
  {
    sub_23F2D599C();
  }
  else
  {
    sub_23F2D5DFC();
    sub_23F2D59DC();
    sub_23F2CA884(&qword_256E61DD0, (void (*)(uint64_t))MEMORY[0x24BEB9760]);
    sub_23F2D62F8();
    sub_23F2DFA88();
    sub_23F2D5F48();
  }
  sub_23F2D5E44();
}

uint64_t sub_23F2CE2BC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E65644965707974 && a2 == 0xEE00726569666974;
  if (v2 || (sub_23F2DFC5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000023F2E3A50 || (sub_23F2DFC5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023F2E3A70)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23F2DFC5C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23F2CE428()
{
  return 3;
}

void sub_23F2CE430()
{
  sub_23F2D57D0();
  sub_23F2DFC80();
  sub_23F2D5888();
  sub_23F2D578C();
}

uint64_t sub_23F2CE460(char a1)
{
  if (!a1)
    return 0x6E65644965707974;
  if (a1 == 1)
    return 0xD000000000000012;
  return 0xD000000000000010;
}

uint64_t sub_23F2CE4D0()
{
  char *v0;

  return sub_23F2CE460(*v0);
}

uint64_t sub_23F2CE4D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2CE2BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F2CE4FC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23F2CE428();
  *a1 = result;
  return result;
}

uint64_t sub_23F2CE520()
{
  sub_23F2CFFE4();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2CE548()
{
  sub_23F2CFFE4();
  return sub_23F2DFCC8();
}

void DetectedAppEntity.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;

  sub_23F2C3FA0(&qword_256E61DD8);
  sub_23F2D5A38();
  MEMORY[0x24BDAC7A8](v1);
  sub_23F2D58F4();
  sub_23F2CFFE4();
  sub_23F2D5944();
  sub_23F2D57AC();
  if (!v0)
  {
    sub_23F2D57AC();
    type metadata accessor for DetectedAppEntity(0);
    sub_23F2DFA70();
    sub_23F2CA884(&qword_256E61DE8, (void (*)(uint64_t))MEMORY[0x24BEB9760]);
    sub_23F2DFC20();
  }
  sub_23F2D5BB4();
  sub_23F2D581C();
}

void DetectedAppEntity.hashValue.getter()
{
  sub_23F2CE6A8((void (*)(_BYTE *))DetectedAppEntity.hash(into:));
}

void sub_23F2CE6A8(void (*a1)(_BYTE *))
{
  _BYTE v2[72];

  sub_23F2D57D0();
  a1(v2);
  sub_23F2D5888();
  sub_23F2D578C();
}

void DetectedAppEntity.init(from:)()
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  sub_23F2D57B8();
  v3 = v2;
  v16 = v4;
  sub_23F2C3FA0(&qword_256E61B20);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v5);
  sub_23F2D5DCC(v6, v15);
  v18 = sub_23F2C3FA0(&qword_256E61DF0);
  v7 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v8 = sub_23F2D5A04();
  type metadata accessor for DetectedAppEntity(v8);
  sub_23F2D5704();
  MEMORY[0x24BDAC7A8](v9);
  sub_23F2D5858();
  *(_OWORD *)v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  v11 = v1 + *(int *)(v10 + 24);
  v12 = sub_23F2DFA70();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v11, 1, 1, v12);
  sub_23F2C3FE0(v3, v3[3]);
  sub_23F2CFFE4();
  sub_23F2DFCA4();
  if (!v0)
  {
    *(_QWORD *)v1 = sub_23F2D5F20();
    *(_QWORD *)(v1 + 8) = v13;
    *(_QWORD *)(v1 + 16) = sub_23F2D5F20();
    *(_QWORD *)(v1 + 24) = v14;
    sub_23F2CA884(&qword_256E61DF8, (void (*)(uint64_t))MEMORY[0x24BEB9760]);
    sub_23F2DFBCC();
    sub_23F2D57DC(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
    sub_23F2CFF00(v17, v11, &qword_256E61B20);
    sub_23F2D6154(v1, v16);
  }
  sub_23F2C4254((uint64_t)v3);
  sub_23F2C9A68(v1, type metadata accessor for DetectedAppEntity);
  sub_23F2C4890();
}

void sub_23F2CE8EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F2CE8F8(a1, a2, a3, (void (*)(_BYTE *))DetectedAppEntity.hash(into:));
}

void sub_23F2CE8F8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_BYTE *))
{
  _BYTE v5[72];

  sub_23F2D5C80();
  a4(v5);
  sub_23F2D5888();
  sub_23F2D578C();
}

void sub_23F2CE924()
{
  DetectedAppEntity.init(from:)();
}

void sub_23F2CE938()
{
  DetectedAppEntity.encode(to:)();
}

uint64_t (*DetectedAppIntent.identifier.modify())()
{
  return nullsub_1;
}

void DetectedAppIntent.description.getter()
{
  sub_23F2CE980();
}

void sub_23F2CE980()
{
  sub_23F2D5F00();
  sub_23F2DFB6C();
  sub_23F2D6110();
  sub_23F2D6144();
  sub_23F2DFADC();
  sub_23F2D5A9C();
  sub_23F2D5E30();
}

uint64_t _s23IntelligenceFlowContext19DetectedPhoneNumberV4hash4intoys6HasherVz_tF_0()
{
  sub_23F2C48C0();
  sub_23F2DFAD0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2CEA1C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23F2DFC5C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_23F2CEAAC()
{
  sub_23F2D57D0();
  sub_23F2D6258();
  sub_23F2D5888();
  sub_23F2D578C();
}

uint64_t sub_23F2CEAD0()
{
  return 0x696669746E656469;
}

void sub_23F2CEAEC()
{
  sub_23F2D5C80();
  sub_23F2D6258();
  sub_23F2D5888();
  sub_23F2D578C();
}

uint64_t sub_23F2CEB14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2CEA1C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23F2CEB3C()
{
  sub_23F2D0020();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2CEB64()
{
  sub_23F2D0020();
  return sub_23F2DFCC8();
}

void DetectedAppIntent.encode(to:)()
{
  sub_23F2CEBB8();
}

void sub_23F2CEBB8()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(void);
  uint64_t *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void (*v7)(void);

  sub_23F2D57B8();
  v7 = v2;
  sub_23F2C3FA0(v3);
  sub_23F2D5A38();
  MEMORY[0x24BDAC7A8](v4);
  sub_23F2D5F90();
  v5 = (_QWORD *)sub_23F2D5EB4();
  sub_23F2C3FE0(v5, v6);
  v7();
  sub_23F2DFCB0();
  sub_23F2DFC2C();
  sub_23F2D58A8(v0, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_23F2C4890();
}

void _s23IntelligenceFlowContext19DetectedPhoneNumberV9hashValueSivg_0()
{
  sub_23F2D57D0();
  sub_23F2C48C0();
  sub_23F2D5FE8();
  sub_23F2D58A0();
  sub_23F2D5888();
  sub_23F2D578C();
}

void DetectedAppIntent.init(from:)()
{
  sub_23F2CECD4();
}

void sub_23F2CECD4()
{
  uint64_t v0;
  void (*v1)(void);
  void (*v2)(void);
  _QWORD *v3;
  _QWORD *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;

  sub_23F2D57B8();
  v2 = v1;
  v4 = v3;
  v11 = v5;
  sub_23F2C3FA0(v6);
  sub_23F2D5E7C();
  MEMORY[0x24BDAC7A8](v7);
  sub_23F2D5954();
  sub_23F2C3FE0(v4, v4[3]);
  v2();
  sub_23F2DFCA4();
  if (!v0)
  {
    v8 = sub_23F2DFBD8();
    v10 = v9;
    sub_23F2D5FC8();
    *v11 = v8;
    v11[1] = v10;
  }
  sub_23F2C48B8();
  sub_23F2C4890();
}

uint64_t sub_23F2CEDB0(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s23IntelligenceFlowContext14DetectedEntityOwet_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

unint64_t sub_23F2CEE50()
{
  unint64_t result;

  result = qword_256E61B80;
  if (!qword_256E61B80)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E277C, &type metadata for DetectedEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61B80);
  }
  return result;
}

unint64_t sub_23F2CEE8C()
{
  unint64_t result;

  result = qword_256E61B88;
  if (!qword_256E61B88)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E272C, &type metadata for DetectedEntity.AppIntentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61B88);
  }
  return result;
}

unint64_t sub_23F2CEEC8()
{
  unint64_t result;

  result = qword_256E61B90;
  if (!qword_256E61B90)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectedAppIntent, &type metadata for DetectedAppIntent);
    atomic_store(result, (unint64_t *)&qword_256E61B90);
  }
  return result;
}

unint64_t sub_23F2CEF04()
{
  unint64_t result;

  result = qword_256E61B98;
  if (!qword_256E61B98)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E26DC, &type metadata for DetectedEntity.AppEntityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61B98);
  }
  return result;
}

unint64_t sub_23F2CEF40()
{
  unint64_t result;

  result = qword_256E61BA8;
  if (!qword_256E61BA8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E268C, &type metadata for DetectedEntity.OrganizationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61BA8);
  }
  return result;
}

unint64_t sub_23F2CEF7C()
{
  unint64_t result;

  result = qword_256E61BB0;
  if (!qword_256E61BB0)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectedOrganization, &type metadata for DetectedOrganization);
    atomic_store(result, (unint64_t *)&qword_256E61BB0);
  }
  return result;
}

unint64_t sub_23F2CEFB8()
{
  unint64_t result;

  result = qword_256E61BB8;
  if (!qword_256E61BB8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E263C, &type metadata for DetectedEntity.PlaceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61BB8);
  }
  return result;
}

unint64_t sub_23F2CEFF4()
{
  unint64_t result;

  result = qword_256E61BC0;
  if (!qword_256E61BC0)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectedPlace, &type metadata for DetectedPlace);
    atomic_store(result, (unint64_t *)&qword_256E61BC0);
  }
  return result;
}

unint64_t sub_23F2CF030()
{
  unint64_t result;

  result = qword_256E61BC8;
  if (!qword_256E61BC8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E25EC, &type metadata for DetectedEntity.PersonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61BC8);
  }
  return result;
}

unint64_t sub_23F2CF06C()
{
  unint64_t result;

  result = qword_256E61BD0;
  if (!qword_256E61BD0)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectedPerson, &type metadata for DetectedPerson);
    atomic_store(result, (unint64_t *)&qword_256E61BD0);
  }
  return result;
}

unint64_t sub_23F2CF0A8()
{
  unint64_t result;

  result = qword_256E61BD8;
  if (!qword_256E61BD8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E259C, &type metadata for DetectedEntity.AddressCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61BD8);
  }
  return result;
}

unint64_t sub_23F2CF0E4()
{
  unint64_t result;

  result = qword_256E61BE0;
  if (!qword_256E61BE0)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectedAddress, &type metadata for DetectedAddress);
    atomic_store(result, (unint64_t *)&qword_256E61BE0);
  }
  return result;
}

unint64_t sub_23F2CF120()
{
  unint64_t result;

  result = qword_256E61BE8;
  if (!qword_256E61BE8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E254C, &type metadata for DetectedEntity.LinkCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61BE8);
  }
  return result;
}

unint64_t sub_23F2CF15C()
{
  unint64_t result;

  result = qword_256E61BF8;
  if (!qword_256E61BF8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E24FC, &type metadata for DetectedEntity.PhoneNumberCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61BF8);
  }
  return result;
}

unint64_t sub_23F2CF198()
{
  unint64_t result;

  result = qword_256E61C00;
  if (!qword_256E61C00)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectedPhoneNumber, &type metadata for DetectedPhoneNumber);
    atomic_store(result, (unint64_t *)&qword_256E61C00);
  }
  return result;
}

unint64_t sub_23F2CF1D4()
{
  unint64_t result;

  result = qword_256E61C08;
  if (!qword_256E61C08)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E24AC, &type metadata for DetectedEntity.DateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61C08);
  }
  return result;
}

void sub_23F2CF210()
{
  sub_23F2D5C80();
  sub_23F2C48C0();
  sub_23F2D5FE8();
  sub_23F2D58A0();
  sub_23F2D5888();
  sub_23F2D578C();
}

void sub_23F2CF240()
{
  DetectedAppIntent.init(from:)();
}

void sub_23F2CF254()
{
  DetectedAppIntent.encode(to:)();
}

IntelligenceFlowContext::DetectableEntityType_optional __swiftcall DetectableEntityType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  char v4;
  IntelligenceFlowContext::DetectableEntityType_optional result;

  v2 = v1;
  v3 = sub_23F2DFB9C();
  sub_23F2D5AC0();
  v4 = 9;
  if (v3 < 9)
    v4 = v3;
  *v2 = v4;
  sub_23F2D5750();
  return result;
}

void *static DetectableEntityType.allCases.getter()
{
  return &unk_250FBF660;
}

uint64_t DetectableEntityType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23F2CF2E8 + 4 * byte_23F2E02FE[*v0]))(1702125924, 0xE400000000000000);
}

uint64_t sub_23F2CF2E8()
{
  return 0x6D754E656E6F6870;
}

uint64_t sub_23F2CF308()
{
  return 1802398060;
}

uint64_t sub_23F2CF314()
{
  return 0x73736572646461;
}

uint64_t sub_23F2CF32C()
{
  return 0x6E6F73726570;
}

uint64_t sub_23F2CF340()
{
  return 0x6563616C70;
}

uint64_t sub_23F2CF354()
{
  return 0x617A696E6167726FLL;
}

uint64_t sub_23F2CF374()
{
  return 0x7469746E45707061;
}

uint64_t sub_23F2CF394()
{
  return 0x6E65746E49707061;
}

void sub_23F2CF3B0(char *a1)
{
  sub_23F2CF3BC(*a1);
}

void sub_23F2CF3BC(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23F2CF3FC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23F2CF4E0 + 4 * byte_23F2E0310[a2]))(0x6D754E656E6F6870);
}

void sub_23F2CF4E0(uint64_t a1)
{
  uint64_t v1;

  if (a1 != 0x6D754E656E6F6870 || v1 != 0xEB00000000726562)
    sub_23F2D59A4();
  sub_23F2D5AC0();
  sub_23F2D58A0();
  sub_23F2D5750();
}

IntelligenceFlowContext::DetectableEntityType_optional sub_23F2CF5E0(Swift::String *a1)
{
  return DetectableEntityType.init(rawValue:)(*a1);
}

void sub_23F2CF5EC(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = DetectableEntityType.rawValue.getter();
  a1[1] = v2;
  sub_23F2C53A4();
}

uint64_t sub_23F2CF60C()
{
  char *v0;

  return sub_23F2CF614(*v0);
}

uint64_t sub_23F2CF614(char a1)
{
  _BYTE v3[72];

  sub_23F2DFC74();
  sub_23F2CF660((uint64_t)v3, a1);
  return sub_23F2DFC98();
}

void sub_23F2CF658(uint64_t a1)
{
  char *v1;

  sub_23F2CF660(a1, *v1);
}

void sub_23F2CF660(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23F2CF698()
{
  sub_23F2D62CC();
  return sub_23F2D5E58();
}

void sub_23F2CF76C(uint64_t a1)
{
  char *v1;

  sub_23F2CF774(a1, *v1);
}

void sub_23F2CF774(uint64_t a1, char a2)
{
  _BYTE v3[72];

  sub_23F2D5C80();
  sub_23F2CF660((uint64_t)v3, a2);
  sub_23F2D5888();
  sub_23F2D578C();
}

void sub_23F2CF7A4(_QWORD *a1@<X8>)
{
  *a1 = &unk_250FBF660;
}

uint64_t sub_23F2CF7B4()
{
  sub_23F2D55DC();
  return sub_23F2DFAF4();
}

uint64_t sub_23F2CF810()
{
  sub_23F2D55DC();
  return sub_23F2DFAE8();
}

uint64_t sub_23F2CF85C(uint64_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;

  v5 = result;
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
    sub_23F2C3FA0(&qword_256E62118);
    v10 = swift_allocObject();
    v11 = j__malloc_size((const void *)v10);
    *(_QWORD *)(v10 + 16) = v8;
    *(_QWORD *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    sub_23F2DC314((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void sub_23F2CF950(char a1, int64_t a2, char a3, uint64_t a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  size_t v11;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
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
    sub_23F2C3FA0(&qword_256E62110);
    v10 = swift_allocObject();
    v11 = j__malloc_size((const void *)v10);
    *(_QWORD *)(v10 + 16) = v8;
    *(_QWORD *)(v10 + 24) = 2 * v11 - 64;
  }
  else
  {
    v10 = MEMORY[0x24BEE4AF8];
  }
  if ((a1 & 1) != 0)
  {
    sub_23F2DC3C4((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    memcpy((void *)(v10 + 32), (const void *)(a4 + 32), v8);
  }
  sub_23F2D5AC0();
  sub_23F2D5750();
}

uint64_t sub_23F2CFA24(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_contactIdentifier);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_23F2DFAB8();

  return v3;
}

unint64_t sub_23F2CFA84()
{
  unint64_t result;

  result = qword_256E61C70;
  if (!qword_256E61C70)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectedAppIntent, &type metadata for DetectedAppIntent);
    atomic_store(result, (unint64_t *)&qword_256E61C70);
  }
  return result;
}

unint64_t sub_23F2CFAC0()
{
  unint64_t result;

  result = qword_256E61C80;
  if (!qword_256E61C80)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectedOrganization, &type metadata for DetectedOrganization);
    atomic_store(result, (unint64_t *)&qword_256E61C80);
  }
  return result;
}

unint64_t sub_23F2CFAFC()
{
  unint64_t result;

  result = qword_256E61C88;
  if (!qword_256E61C88)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectedPlace, &type metadata for DetectedPlace);
    atomic_store(result, (unint64_t *)&qword_256E61C88);
  }
  return result;
}

unint64_t sub_23F2CFB38()
{
  unint64_t result;

  result = qword_256E61C90;
  if (!qword_256E61C90)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectedPerson, &type metadata for DetectedPerson);
    atomic_store(result, (unint64_t *)&qword_256E61C90);
  }
  return result;
}

unint64_t sub_23F2CFB74()
{
  unint64_t result;

  result = qword_256E61C98;
  if (!qword_256E61C98)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectedAddress, &type metadata for DetectedAddress);
    atomic_store(result, (unint64_t *)&qword_256E61C98);
  }
  return result;
}

unint64_t sub_23F2CFBB0()
{
  unint64_t result;

  result = qword_256E61CA8;
  if (!qword_256E61CA8)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectedPhoneNumber, &type metadata for DetectedPhoneNumber);
    atomic_store(result, (unint64_t *)&qword_256E61CA8);
  }
  return result;
}

unint64_t sub_23F2CFBEC()
{
  unint64_t result;

  result = qword_256E61CC0;
  if (!qword_256E61CC0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E245C, &type metadata for AddressComponents.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61CC0);
  }
  return result;
}

void sub_23F2CFC28()
{
  swift_bridgeObjectRelease();
  sub_23F2D58A0();
  sub_23F2D5814();
  sub_23F2D59EC();
  sub_23F2D5A9C();
  sub_23F2D59E4();
  sub_23F2D5ED8();
  sub_23F2D6178();
  sub_23F2D5E44();
}

uint64_t _s23IntelligenceFlowContext14DetectedEntityOwst_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

unint64_t sub_23F2CFC9C()
{
  unint64_t result;

  result = qword_256E61CE0;
  if (!qword_256E61CE0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E240C, &type metadata for DetectedDate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61CE0);
  }
  return result;
}

unint64_t sub_23F2CFCD8()
{
  unint64_t result;

  result = qword_256E61D08;
  if (!qword_256E61D08)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E23BC, &type metadata for DetectedPhoneNumber.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61D08);
  }
  return result;
}

unint64_t sub_23F2CFD14()
{
  unint64_t result;

  result = qword_256E61D20;
  if (!qword_256E61D20)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E236C, &type metadata for DetectedLink.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61D20);
  }
  return result;
}

unint64_t sub_23F2CFD50()
{
  unint64_t result;

  result = qword_256E61D48;
  if (!qword_256E61D48)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E231C, &type metadata for DetectedAddress.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61D48);
  }
  return result;
}

unint64_t sub_23F2CFD8C()
{
  unint64_t result;

  result = qword_256E61D50;
  if (!qword_256E61D50)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for AddressComponents, &type metadata for AddressComponents);
    atomic_store(result, (unint64_t *)&qword_256E61D50);
  }
  return result;
}

unint64_t sub_23F2CFDC8()
{
  unint64_t result;

  result = qword_256E61D60;
  if (!qword_256E61D60)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for AddressComponents, &type metadata for AddressComponents);
    atomic_store(result, (unint64_t *)&qword_256E61D60);
  }
  return result;
}

uint64_t sub_23F2CFE04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23F2C3FA0(&qword_256E61D68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23F2CFE4C()
{
  unint64_t result;

  result = qword_256E61D80;
  if (!qword_256E61D80)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E22CC, &type metadata for DetectedPerson.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61D80);
  }
  return result;
}

unint64_t sub_23F2CFE88()
{
  unint64_t result;

  result = qword_256E61D98;
  if (!qword_256E61D98)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E227C, &type metadata for DetectedPlace.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61D98);
  }
  return result;
}

unint64_t sub_23F2CFEC4()
{
  unint64_t result;

  result = qword_256E61DB0;
  if (!qword_256E61DB0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E222C, &type metadata for DetectedOrganization.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61DB0);
  }
  return result;
}

void sub_23F2CFF00(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_23F2D6028(a1, a2, a3);
  sub_23F2D608C();
  sub_23F2D5B7C(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 40));
  sub_23F2C53A4();
}

uint64_t sub_23F2CFF28()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_23F2CFF54(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_23F2D6028(a1, a2, a3);
  sub_23F2D5B7C(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  sub_23F2C53A4();
}

void sub_23F2CFF80(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = sub_23F2C3FA0(a2);
  sub_23F2D5E68(v2);
  sub_23F2C53A4();
}

unint64_t sub_23F2CFFA8()
{
  unint64_t result;

  result = qword_256E61DC8;
  if (!qword_256E61DC8)
  {
    result = MEMORY[0x2426678EC](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256E61DC8);
  }
  return result;
}

unint64_t sub_23F2CFFE4()
{
  unint64_t result;

  result = qword_256E61DE0;
  if (!qword_256E61DE0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E21DC, &type metadata for DetectedAppEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61DE0);
  }
  return result;
}

unint64_t sub_23F2D0020()
{
  unint64_t result;

  result = qword_256E61E08;
  if (!qword_256E61E08)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E218C, &type metadata for DetectedAppIntent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61E08);
  }
  return result;
}

void sub_23F2D005C()
{
  sub_23F2CA884(&qword_256E61E18, (void (*)(uint64_t))type metadata accessor for DetectedEntityDetails);
}

void sub_23F2D0088()
{
  sub_23F2CA884(&qword_256E61E20, (void (*)(uint64_t))type metadata accessor for DetectedEntity);
}

unint64_t sub_23F2D00B8()
{
  unint64_t result;

  result = qword_256E61E28;
  if (!qword_256E61E28)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for AddressComponents, &type metadata for AddressComponents);
    atomic_store(result, (unint64_t *)&qword_256E61E28);
  }
  return result;
}

void sub_23F2D00F4()
{
  sub_23F2CA884(&qword_256E61E30, (void (*)(uint64_t))type metadata accessor for DetectedDate);
}

unint64_t sub_23F2D0124()
{
  unint64_t result;

  result = qword_256E61E38;
  if (!qword_256E61E38)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectedPhoneNumber, &type metadata for DetectedPhoneNumber);
    atomic_store(result, (unint64_t *)&qword_256E61E38);
  }
  return result;
}

void sub_23F2D0160()
{
  sub_23F2CA884(&qword_256E61E40, (void (*)(uint64_t))type metadata accessor for DetectedLink);
}

unint64_t sub_23F2D0190()
{
  unint64_t result;

  result = qword_256E61E48;
  if (!qword_256E61E48)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectedAddress, &type metadata for DetectedAddress);
    atomic_store(result, (unint64_t *)&qword_256E61E48);
  }
  return result;
}

unint64_t sub_23F2D01D0()
{
  unint64_t result;

  result = qword_256E61E50;
  if (!qword_256E61E50)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectedPerson, &type metadata for DetectedPerson);
    atomic_store(result, (unint64_t *)&qword_256E61E50);
  }
  return result;
}

unint64_t sub_23F2D0210()
{
  unint64_t result;

  result = qword_256E61E58;
  if (!qword_256E61E58)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectedPlace, &type metadata for DetectedPlace);
    atomic_store(result, (unint64_t *)&qword_256E61E58);
  }
  return result;
}

unint64_t sub_23F2D0250()
{
  unint64_t result;

  result = qword_256E61E60;
  if (!qword_256E61E60)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectedOrganization, &type metadata for DetectedOrganization);
    atomic_store(result, (unint64_t *)&qword_256E61E60);
  }
  return result;
}

void sub_23F2D028C()
{
  sub_23F2CA884(&qword_256E61E68, (void (*)(uint64_t))type metadata accessor for DetectedAppEntity);
}

unint64_t sub_23F2D02BC()
{
  unint64_t result;

  result = qword_256E61E70;
  if (!qword_256E61E70)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectedAppIntent, &type metadata for DetectedAppIntent);
    atomic_store(result, (unint64_t *)&qword_256E61E70);
  }
  return result;
}

unint64_t sub_23F2D02FC()
{
  unint64_t result;

  result = qword_254345270;
  if (!qword_254345270)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectableEntityType, &type metadata for DetectableEntityType);
    atomic_store(result, (unint64_t *)&qword_254345270);
  }
  return result;
}

void sub_23F2D0338()
{
  sub_23F2D0364(&qword_256E61E78, &qword_256E61E80);
}

void sub_23F2D0364(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    sub_23F2C4040(a2);
    sub_23F2D62EC();
  }
  sub_23F2C53A4();
}

uint64_t initializeBufferWithCopyOfBuffer for DetectedEntityDetails(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    type metadata accessor for DetectedEntity(0);
    v5 = (char *)&loc_23F2D0404 + 4 * byte_23F2E0322[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for DetectedEntityDetails(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);

  type metadata accessor for DetectedEntity(0);
  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      v3 = sub_23F2DF98C();
      v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8);
      v10(a1, v3);
      v4 = a1 + *(int *)(type metadata accessor for DetectedDate(0) + 20);
      result = _s23IntelligenceFlowContext14DetectedEntityOwet_0(v4, 1, v3);
      if (!(_DWORD)result)
      {
        v5 = v4;
        v6 = v3;
        v7 = (uint64_t (*)(uint64_t, uint64_t))v10;
        goto LABEL_11;
      }
      return result;
    case 1:
    case 5:
    case 6:
    case 8:
      goto LABEL_2;
    case 2:
      v6 = sub_23F2DF9D4();
      v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
      v5 = a1;
      goto LABEL_11;
    case 3:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_2;
    case 4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_2:
      result = swift_bridgeObjectRelease();
      break;
    case 7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v8 = a1 + *(int *)(type metadata accessor for DetectedAppEntity(0) + 24);
      v9 = sub_23F2DFA70();
      result = _s23IntelligenceFlowContext14DetectedEntityOwet_0(v8, 1, v9);
      if (!(_DWORD)result)
      {
        v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
        v5 = v8;
        v6 = v9;
LABEL_11:
        result = v7(v5, v6);
      }
      break;
    default:
      return result;
  }
  return result;
}

void initializeWithCopy for DetectedEntityDetails()
{
  char *v0;

  type metadata accessor for DetectedEntity(0);
  v0 = (char *)sub_23F2D092C + 4 * byte_23F2E0334[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

char *sub_23F2D092C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(void *, const void *, uint64_t);
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v3 = sub_23F2DF98C();
  v4 = *(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v3 - 8) + 16);
  v4(v0, v1, v3);
  v5 = *(int *)(type metadata accessor for DetectedDate(0) + 20);
  v6 = &v0[v5];
  v7 = &v1[v5];
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)&v1[v5], 1, v3))
  {
    v8 = sub_23F2C3FA0(&qword_256E61AF0);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    v4(v6, v7, v3);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v6, 0, 1, v3);
  }
  swift_storeEnumTagMultiPayload();
  v0[*(int *)(v2 + 20)] = v1[*(int *)(v2 + 20)];
  return v0;
}

uint64_t assignWithCopy for DetectedEntityDetails(uint64_t result, uint64_t a2, uint64_t a3)
{
  char *v3;

  if (result != a2)
  {
    sub_23F2C9A68(result, type metadata accessor for DetectedEntity);
    type metadata accessor for DetectedEntity(0);
    v3 = (char *)&loc_23F2D0CAC + 4 * byte_23F2E033D[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  *(_BYTE *)(result + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return result;
}

char *initializeWithTake for DetectedEntityDetails(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = type metadata accessor for DetectedEntity(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 7:
      v14 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v14;
      v15 = *(int *)(type metadata accessor for DetectedAppEntity(0) + 24);
      v16 = &a1[v15];
      v17 = &a2[v15];
      v18 = sub_23F2DFA70();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v17, 1, v18))
      {
        v19 = sub_23F2C3FA0(&qword_256E61B20);
        memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v16, 0, 1, v18);
      }
      goto LABEL_13;
    case 2:
      v20 = sub_23F2DF9D4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(a1, a2, v20);
LABEL_13:
      swift_storeEnumTagMultiPayload();
      goto LABEL_14;
    case 0:
      v8 = sub_23F2DF98C();
      v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32);
      v9(a1, a2, v8);
      v10 = *(int *)(type metadata accessor for DetectedDate(0) + 20);
      v11 = &a1[v10];
      v12 = &a2[v10];
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)&a2[v10], 1, v8))
      {
        v13 = sub_23F2C3FA0(&qword_256E61AF0);
        memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
      }
      else
      {
        v9(v11, v12, v8);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v11, 0, 1, v8);
      }
      goto LABEL_13;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
LABEL_14:
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  return a1;
}

char *assignWithTake for DetectedEntityDetails(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (a1 != a2)
  {
    sub_23F2C9A68((uint64_t)a1, type metadata accessor for DetectedEntity);
    v6 = type metadata accessor for DetectedEntity(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 7:
        v14 = *((_OWORD *)a2 + 1);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *((_OWORD *)a1 + 1) = v14;
        v15 = *(int *)(type metadata accessor for DetectedAppEntity(0) + 24);
        v16 = &a1[v15];
        v17 = &a2[v15];
        v18 = sub_23F2DFA70();
        if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v17, 1, v18))
        {
          v19 = sub_23F2C3FA0(&qword_256E61B20);
          memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
          _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v16, 0, 1, v18);
        }
        goto LABEL_14;
      case 2:
        v20 = sub_23F2DF9D4();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(a1, a2, v20);
LABEL_14:
        swift_storeEnumTagMultiPayload();
        goto LABEL_15;
      case 0:
        v8 = sub_23F2DF98C();
        v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32);
        v9(a1, a2, v8);
        v10 = *(int *)(type metadata accessor for DetectedDate(0) + 20);
        v11 = &a1[v10];
        v12 = &a2[v10];
        if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)&a2[v10], 1, v8))
        {
          v13 = sub_23F2C3FA0(&qword_256E61AF0);
          memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
        }
        else
        {
          v9(v11, v12, v8);
          _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v11, 0, 1, v8);
        }
        goto LABEL_14;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
LABEL_15:
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  return a1;
}

uint64_t getEnumTagSinglePayload for DetectedEntityDetails()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23F2D1464(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DetectedEntity(0);
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == (_DWORD)a2)
    sub_23F2D59B8(a1, a2, v4);
  else
    sub_23F2D5750();
}

uint64_t storeEnumTagSinglePayload for DetectedEntityDetails()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23F2D14E8(uint64_t a1, char a2, int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_DWORD *)(*(_QWORD *)(type metadata accessor for DetectedEntity(0) - 8) + 84) == a3)
  {
    sub_23F2D60C4();
    sub_23F2D59C4(v7, v8, v9, v10);
  }
  else
  {
    *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
    sub_23F2D5750();
  }
}

uint64_t sub_23F2D1548()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for DetectedEntity(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DetectedEntity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_23F2D1614 + 4 * byte_23F2E0346[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for DetectedEntity(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      v3 = sub_23F2DF98C();
      v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8);
      v10(a1, v3);
      v4 = a1 + *(int *)(type metadata accessor for DetectedDate(0) + 20);
      result = _s23IntelligenceFlowContext14DetectedEntityOwet_0(v4, 1, v3);
      if (!(_DWORD)result)
      {
        v5 = v4;
        v6 = v3;
        v7 = (uint64_t (*)(uint64_t, uint64_t))v10;
        goto LABEL_11;
      }
      return result;
    case 1:
    case 5:
    case 6:
    case 8:
      goto LABEL_2;
    case 2:
      v6 = sub_23F2DF9D4();
      v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
      v5 = a1;
      goto LABEL_11;
    case 3:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_2;
    case 4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_2:
      result = swift_bridgeObjectRelease();
      break;
    case 7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v8 = a1 + *(int *)(type metadata accessor for DetectedAppEntity(0) + 24);
      v9 = sub_23F2DFA70();
      result = _s23IntelligenceFlowContext14DetectedEntityOwet_0(v8, 1, v9);
      if (!(_DWORD)result)
      {
        v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
        v5 = v8;
        v6 = v9;
LABEL_11:
        result = v7(v5, v6);
      }
      break;
    default:
      return result;
  }
  return result;
}

void initializeWithCopy for DetectedEntity()
{
  char *v0;

  v0 = (char *)sub_23F2D1B08 + 4 * byte_23F2E0358[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

char *sub_23F2D1B08()
{
  char *v0;
  char *v1;
  uint64_t v2;
  void (*v3)(void *, const void *, uint64_t);
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  v2 = sub_23F2DF98C();
  v3 = *(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v2 - 8) + 16);
  v3(v0, v1, v2);
  v4 = *(int *)(type metadata accessor for DetectedDate(0) + 20);
  v5 = &v0[v4];
  v6 = &v1[v4];
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v6, 1, v2))
  {
    v7 = sub_23F2C3FA0(&qword_256E61AF0);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    v3(v5, v6, v2);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v5, 0, 1, v2);
  }
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithCopy for DetectedEntity(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_23F2C9A68(result, type metadata accessor for DetectedEntity);
    v2 = (char *)&loc_23F2D1E60 + 4 * byte_23F2E0361[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

char *initializeWithTake for DetectedEntity(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 7:
      v13 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v13;
      v14 = *(int *)(type metadata accessor for DetectedAppEntity(0) + 24);
      v15 = &a1[v14];
      v16 = &a2[v14];
      v17 = sub_23F2DFA70();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v16, 1, v17))
      {
        v18 = sub_23F2C3FA0(&qword_256E61B20);
        memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v15, 0, 1, v17);
      }
      goto LABEL_13;
    case 2:
      v19 = sub_23F2DF9D4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(a1, a2, v19);
LABEL_13:
      swift_storeEnumTagMultiPayload();
      return a1;
    case 0:
      v7 = sub_23F2DF98C();
      v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32);
      v8(a1, a2, v7);
      v9 = *(int *)(type metadata accessor for DetectedDate(0) + 20);
      v10 = &a1[v9];
      v11 = &a2[v9];
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v11, 1, v7))
      {
        v12 = sub_23F2C3FA0(&qword_256E61AF0);
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
      }
      else
      {
        v8(v10, v11, v7);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v10, 0, 1, v7);
      }
      goto LABEL_13;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

char *assignWithTake for DetectedEntity(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a1 != a2)
  {
    sub_23F2C9A68((uint64_t)a1, type metadata accessor for DetectedEntity);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 7:
        v13 = *((_OWORD *)a2 + 1);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *((_OWORD *)a1 + 1) = v13;
        v14 = *(int *)(type metadata accessor for DetectedAppEntity(0) + 24);
        v15 = &a1[v14];
        v16 = &a2[v14];
        v17 = sub_23F2DFA70();
        if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v16, 1, v17))
        {
          v18 = sub_23F2C3FA0(&qword_256E61B20);
          memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
          _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v15, 0, 1, v17);
        }
        goto LABEL_14;
      case 2:
        v19 = sub_23F2DF9D4();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(a1, a2, v19);
LABEL_14:
        swift_storeEnumTagMultiPayload();
        return a1;
      case 0:
        v7 = sub_23F2DF98C();
        v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32);
        v8(a1, a2, v7);
        v9 = *(int *)(type metadata accessor for DetectedDate(0) + 20);
        v10 = &a1[v9];
        v11 = &a2[v9];
        if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v11, 1, v7))
        {
          v12 = sub_23F2C3FA0(&qword_256E61AF0);
          memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
        }
        else
        {
          v8(v10, v11, v7);
          _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v10, 0, 1, v7);
        }
        goto LABEL_14;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_23F2D25C4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23F2D25D4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = type metadata accessor for DetectedDate(319);
  if (v1 <= 0x3F)
  {
    result = sub_23F2DF9D4();
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for DetectedAppEntity(319);
      if (v3 <= 0x3F)
      {
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

void *initializeWithTake for AddressComponents(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x80uLL);
}

void type metadata accessor for AddressComponents()
{
  sub_23F2D5A94();
}

char *initializeBufferWithCopyOfBuffer for DetectedDate(char *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = (char *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23F2DF98C();
    v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, (char *)a2, v7);
    v9 = *(int *)(a3 + 20);
    v10 = &a1[v9];
    v11 = (char *)a2 + v9;
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v11, 1, v7))
    {
      v12 = sub_23F2C3FA0(&qword_256E61AF0);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      v8(v10, v11, v7);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v10, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for DetectedDate(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t (*v7)(uint64_t, uint64_t);

  v4 = sub_23F2DF98C();
  v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v7(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  result = _s23IntelligenceFlowContext14DetectedEntityOwet_0(v5, 1, v4);
  if (!(_DWORD)result)
    return v7(v5, v4);
  return result;
}

char *initializeWithCopy for DetectedDate(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(void *, const void *, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = sub_23F2DF98C();
  v7 = *(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v10, 1, v6))
  {
    v11 = sub_23F2C3FA0(&qword_256E61AF0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    v7(v9, v10, v6);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v9, 0, 1, v6);
  }
  return a1;
}

char *assignWithCopy for DetectedDate(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  int v12;
  int v13;
  uint64_t v14;

  v6 = sub_23F2DF98C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)&a1[v9], 1, v6);
  v13 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v11, 1, v6);
  if (!v12)
  {
    if (!v13)
    {
      v8(v10, v11, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = sub_23F2C3FA0(&qword_256E61AF0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v11, v6);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v10, 0, 1, v6);
  return a1;
}

char *initializeWithTake for DetectedDate(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(void *, const void *, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = sub_23F2DF98C();
  v7 = *(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v10, 1, v6))
  {
    v11 = sub_23F2C3FA0(&qword_256E61AF0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    v7(v9, v10, v6);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v9, 0, 1, v6);
  }
  return a1;
}

char *assignWithTake for DetectedDate(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  int v12;
  int v13;
  uint64_t v14;

  v6 = sub_23F2DF98C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)&a1[v9], 1, v6);
  v13 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v11, 1, v6);
  if (!v12)
  {
    if (!v13)
    {
      v8(v10, v11, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = sub_23F2C3FA0(&qword_256E61AF0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v11, v6);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v10, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DetectedDate()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23F2D2BF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (*(_DWORD *)(*(_QWORD *)(sub_23F2D5BC4() - 8) + 84) == (_DWORD)a2)
  {
    v6 = sub_23F2D62F8();
  }
  else
  {
    v7 = sub_23F2C3FA0(&qword_256E61AF0);
    v6 = a1 + *(int *)(a3 + 20);
  }
  return sub_23F2D59B8(v6, a2, v7);
}

uint64_t storeEnumTagSinglePayload for DetectedDate()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23F2D2C58(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_DWORD *)(*(_QWORD *)(sub_23F2D5BC4() - 8) + 84) != a3)
    sub_23F2C3FA0(&qword_256E61AF0);
  sub_23F2D60C4();
  return sub_23F2D59C4(v3, v4, v5, v6);
}

void sub_23F2D2CBC()
{
  unint64_t v0;
  unint64_t v1;

  sub_23F2DF98C();
  if (v0 <= 0x3F)
  {
    sub_23F2D3C70(319, &qword_254344DB8, (void (*)(uint64_t))MEMORY[0x24BDCBDE0]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void type metadata accessor for DetectedPhoneNumber()
{
  sub_23F2D5A94();
}

uint64_t initializeBufferWithCopyOfBuffer for DetectedLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23F2DF9D4();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for DetectedLink(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23F2DF9D4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for DetectedLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23F2DF9D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for DetectedLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23F2DF9D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for DetectedLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23F2DF9D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for DetectedLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23F2DF9D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DetectedLink()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23F2D2EF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  sub_23F2D5AE0();
  v3 = sub_23F2D62F8();
  return _s23IntelligenceFlowContext14DetectedEntityOwet_0(v3, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DetectedLink()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23F2D2F2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23F2D5AE0();
  sub_23F2D60C4();
  return _s23IntelligenceFlowContext14DetectedEntityOwst_0(v0, v1, v2, v3);
}

uint64_t sub_23F2D2F5C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23F2DF9D4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t _s23IntelligenceFlowContext17AddressComponentsVwxx_0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_23F2D5E58();
}

void _s23IntelligenceFlowContext17AddressComponentsVwcp_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  v9 = a2[13];
  a1[12] = a2[12];
  a1[13] = v9;
  v10 = a2[15];
  a1[14] = a2[14];
  a1[15] = v10;
  swift_bridgeObjectRetain();
  sub_23F2C48C0();
  sub_23F2D5CFC();
  sub_23F2D5C24();
  sub_23F2D6144();
  sub_23F2D5BD4();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23F2D5E44();
}

void _s23IntelligenceFlowContext17AddressComponentsVwca_0(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v2;

  v2[1] = sub_23F2D6290(a1, a2);
  swift_bridgeObjectRetain();
  sub_23F2D5814();
  v2[2] = a2[2];
  v2[3] = a2[3];
  swift_bridgeObjectRetain();
  sub_23F2D5814();
  v2[4] = a2[4];
  v2[5] = a2[5];
  swift_bridgeObjectRetain();
  sub_23F2D5814();
  v2[6] = a2[6];
  v2[7] = a2[7];
  swift_bridgeObjectRetain();
  sub_23F2D5814();
  v2[8] = a2[8];
  v2[9] = a2[9];
  swift_bridgeObjectRetain();
  sub_23F2D5814();
  v2[10] = a2[10];
  v2[11] = a2[11];
  swift_bridgeObjectRetain();
  sub_23F2D5814();
  v2[12] = a2[12];
  v2[13] = a2[13];
  swift_bridgeObjectRetain();
  sub_23F2D5814();
  v2[14] = a2[14];
  v2[15] = a2[15];
  swift_bridgeObjectRetain();
  sub_23F2D58A0();
  sub_23F2D5750();
}

void _s23IntelligenceFlowContext17AddressComponentsVwta_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_bridgeObjectRelease();
  v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  swift_bridgeObjectRelease();
  v11 = a2[15];
  a1[14] = a2[14];
  a1[15] = v11;
  swift_bridgeObjectRelease();
  sub_23F2C53A4();
}

uint64_t _s23IntelligenceFlowContext17AddressComponentsVwet_0(uint64_t a1, unsigned int a2)
{
  int v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 128))
      return sub_23F2D62C4(*(_DWORD *)a1 + 2147483646);
    sub_23F2D61FC();
  }
  else
  {
    v3 = -1;
  }
  return sub_23F2D62C4(v3);
}

uint64_t _s23IntelligenceFlowContext17AddressComponentsVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 128) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 128) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

void type metadata accessor for DetectedAddress()
{
  sub_23F2D5A94();
}

uint64_t destroy for DetectedPerson()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for DetectedPerson(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for DetectedPerson(_QWORD *a1, _QWORD *a2)
{
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
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for DetectedPerson(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithTake for DetectedPerson(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DetectedPerson(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DetectedPerson(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for DetectedPerson()
{
  sub_23F2D5A94();
}

_QWORD *initializeBufferWithCopyOfBuffer for DetectedPlace(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for DetectedPlace()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithTake for DetectedPlace(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for DetectedPlace()
{
  sub_23F2D5A94();
}

void type metadata accessor for DetectedOrganization()
{
  sub_23F2D5A94();
}

uint64_t *initializeBufferWithCopyOfBuffer for DetectedAppEntity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
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
    v7 = *(int *)(a3 + 24);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_23F2DFA70();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v9, 1, v10))
    {
      v11 = sub_23F2C3FA0(&qword_256E61B20);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v8, 0, 1, v10);
    }
  }
  return v3;
}

uint64_t destroy for DetectedAppEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_23F2DFA70();
  result = _s23IntelligenceFlowContext14DetectedEntityOwet_0(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return result;
}

_QWORD *initializeWithCopy for DetectedAppEntity(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23F2DFA70();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v8, 1, v9))
  {
    v10 = sub_23F2C3FA0(&qword_256E61B20);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v7, 0, 1, v9);
  }
  return a1;
}

_QWORD *assignWithCopy for DetectedAppEntity(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23F2DFA70();
  v10 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v7, 1, v9);
  v11 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v8, 1, v9);
  if (!v10)
  {
    v12 = *(_QWORD *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v13 = sub_23F2C3FA0(&qword_256E61B20);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v7, 0, 1, v9);
  return a1;
}

_OWORD *initializeWithTake for DetectedAppEntity(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_23F2DFA70();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v7, 1, v8))
  {
    v9 = sub_23F2C3FA0(&qword_256E61B20);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v6, 0, 1, v8);
  }
  return a1;
}

_QWORD *assignWithTake for DetectedAppEntity(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_23F2DFA70();
  v12 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v9, 1, v11);
  v13 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v10, 1, v11);
  if (!v12)
  {
    v14 = *(_QWORD *)(v11 - 8);
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v15 = sub_23F2C3FA0(&qword_256E61B20);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v9, 0, 1, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for DetectedAppEntity()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23F2D3B24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 2147483646)
  {
    sub_23F2D61FC();
    sub_23F2D5750();
  }
  else
  {
    v6 = sub_23F2C3FA0(&qword_256E61B20);
    sub_23F2D59B8(a1 + *(int *)(a3 + 24), a2, v6);
  }
}

uint64_t storeEnumTagSinglePayload for DetectedAppEntity()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23F2D3B90(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a3 == 2147483646)
  {
    *(_QWORD *)(a1 + 8) = a2;
    sub_23F2D5750();
  }
  else
  {
    sub_23F2C3FA0(&qword_256E61B20);
    sub_23F2D60C4();
    sub_23F2D59C4(v3, v4, v5, v6);
  }
}

void sub_23F2D3BEC()
{
  unint64_t v0;

  sub_23F2D3C70(319, &qword_254344E10, (void (*)(uint64_t))MEMORY[0x24BEB9760]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23F2D3C70(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_23F2DFB3C();
    if (!v5)
      atomic_store(v4, a2);
  }
  sub_23F2C53A4();
}

void _s23IntelligenceFlowContext19DetectedPhoneNumberVwca_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 8) = sub_23F2D6290(a1, a2);
  swift_bridgeObjectRetain();
  sub_23F2D58A0();
  sub_23F2C53A4();
}

uint64_t _s23IntelligenceFlowContext19DetectedPhoneNumberVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_23F2D3D24(uint64_t result, int a2, int a3)
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

void type metadata accessor for DetectedAppIntent()
{
  sub_23F2D5A94();
}

void type metadata accessor for DetectableEntityType()
{
  sub_23F2D5A94();
}

uint64_t sub_23F2D3D8C()
{
  return 0;
}

ValueMetadata *type metadata accessor for DetectedAppIntent.CodingKeys()
{
  return &type metadata for DetectedAppIntent.CodingKeys;
}

uint64_t getEnumTagSinglePayload for DetectedAppEntity.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DetectedAppEntity.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23F2D3E78 + 4 * byte_23F2E036F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23F2D3EAC + 4 * byte_23F2E036A[v4]))();
}

uint64_t sub_23F2D3EAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2D3EB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F2D3EBCLL);
  return result;
}

uint64_t sub_23F2D3EC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F2D3ED0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23F2D3ED4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2D3EDC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DetectedAppEntity.CodingKeys()
{
  return &type metadata for DetectedAppEntity.CodingKeys;
}

ValueMetadata *type metadata accessor for DetectedOrganization.CodingKeys()
{
  return &type metadata for DetectedOrganization.CodingKeys;
}

ValueMetadata *type metadata accessor for DetectedPlace.CodingKeys()
{
  return &type metadata for DetectedPlace.CodingKeys;
}

uint64_t getEnumTagSinglePayload for DetectedPerson.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DetectedPerson.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23F2D3FEC + 4 * byte_23F2E0379[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23F2D4020 + 4 * byte_23F2E0374[v4]))();
}

uint64_t sub_23F2D4020(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2D4028(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F2D4030);
  return result;
}

uint64_t sub_23F2D403C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F2D4044);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23F2D4048(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2D4050(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DetectedPerson.CodingKeys()
{
  return &type metadata for DetectedPerson.CodingKeys;
}

ValueMetadata *type metadata accessor for DetectedAddress.CodingKeys()
{
  return &type metadata for DetectedAddress.CodingKeys;
}

ValueMetadata *type metadata accessor for DetectedLink.CodingKeys()
{
  return &type metadata for DetectedLink.CodingKeys;
}

ValueMetadata *type metadata accessor for DetectedPhoneNumber.CodingKeys()
{
  return &type metadata for DetectedPhoneNumber.CodingKeys;
}

ValueMetadata *type metadata accessor for DetectedDate.CodingKeys()
{
  return &type metadata for DetectedDate.CodingKeys;
}

uint64_t getEnumTagSinglePayload for AddressComponents.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 7) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v5 = v6 - 8;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AddressComponents.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_23F2D4188 + 4 * byte_23F2E0383[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_23F2D41BC + 4 * byte_23F2E037E[v4]))();
}

uint64_t sub_23F2D41BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2D41C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F2D41CCLL);
  return result;
}

uint64_t sub_23F2D41D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F2D41E0);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_23F2D41E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2D41EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AddressComponents.CodingKeys()
{
  return &type metadata for AddressComponents.CodingKeys;
}

uint64_t _s23IntelligenceFlowContext20DetectableEntityTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return sub_23F2D62C4(-1);
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return sub_23F2D62C4((*a1 | (v4 << 8)) - 9);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return sub_23F2D62C4((*a1 | (v4 << 8)) - 9);
    }
    v4 = a1[1];
    if (a1[1])
      return sub_23F2D62C4((*a1 | (v4 << 8)) - 9);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return sub_23F2D62C4(v8);
}

uint64_t _s23IntelligenceFlowContext20DetectableEntityTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_23F2D42D8 + 4 * byte_23F2E038D[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_23F2D430C + 4 * byte_23F2E0388[v4]))();
}

uint64_t sub_23F2D430C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2D4314(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F2D431CLL);
  return result;
}

uint64_t sub_23F2D4328(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F2D4330);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_23F2D4334(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2D433C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23F2D4348(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DetectedEntity.CodingKeys()
{
  return &type metadata for DetectedEntity.CodingKeys;
}

ValueMetadata *type metadata accessor for DetectedEntity.DateCodingKeys()
{
  return &type metadata for DetectedEntity.DateCodingKeys;
}

ValueMetadata *type metadata accessor for DetectedEntity.PhoneNumberCodingKeys()
{
  return &type metadata for DetectedEntity.PhoneNumberCodingKeys;
}

ValueMetadata *type metadata accessor for DetectedEntity.LinkCodingKeys()
{
  return &type metadata for DetectedEntity.LinkCodingKeys;
}

ValueMetadata *type metadata accessor for DetectedEntity.AddressCodingKeys()
{
  return &type metadata for DetectedEntity.AddressCodingKeys;
}

ValueMetadata *type metadata accessor for DetectedEntity.PersonCodingKeys()
{
  return &type metadata for DetectedEntity.PersonCodingKeys;
}

ValueMetadata *type metadata accessor for DetectedEntity.PlaceCodingKeys()
{
  return &type metadata for DetectedEntity.PlaceCodingKeys;
}

ValueMetadata *type metadata accessor for DetectedEntity.OrganizationCodingKeys()
{
  return &type metadata for DetectedEntity.OrganizationCodingKeys;
}

ValueMetadata *type metadata accessor for DetectedEntity.AppEntityCodingKeys()
{
  return &type metadata for DetectedEntity.AppEntityCodingKeys;
}

uint64_t getEnumTagSinglePayload for UIContextOptions.CodingKeys(unsigned int *a1, int a2)
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

uint64_t _s23IntelligenceFlowContext17DetectedAppIntentV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23F2D4470 + 4 * byte_23F2E0392[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23F2D4490 + 4 * byte_23F2E0397[v4]))();
}

_BYTE *sub_23F2D4470(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23F2D4490(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23F2D4498(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23F2D44A0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23F2D44A8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23F2D44B0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DetectedEntity.AppIntentCodingKeys()
{
  return &type metadata for DetectedEntity.AppIntentCodingKeys;
}

uint64_t _s23IntelligenceFlowContext12DetectedDateV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return sub_23F2D62C4(-1);
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
      return sub_23F2D62C4((*a1 | (v4 << 8)) - 2);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return sub_23F2D62C4((*a1 | (v4 << 8)) - 2);
    }
    v4 = a1[1];
    if (a1[1])
      return sub_23F2D62C4((*a1 | (v4 << 8)) - 2);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return sub_23F2D62C4(v8);
}

uint64_t _s23IntelligenceFlowContext12DetectedDateV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23F2D459C + 4 * byte_23F2E03A1[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23F2D45D0 + 4 * byte_23F2E039C[v4]))();
}

uint64_t sub_23F2D45D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2D45D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F2D45E0);
  return result;
}

uint64_t sub_23F2D45EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F2D45F4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23F2D45F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2D4600(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DetectedEntityDetails.CodingKeys()
{
  return &type metadata for DetectedEntityDetails.CodingKeys;
}

unint64_t sub_23F2D4620()
{
  unint64_t result;

  result = qword_256E61F18;
  if (!qword_256E61F18)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1304, &type metadata for DetectedEntityDetails.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61F18);
  }
  return result;
}

unint64_t sub_23F2D4660()
{
  unint64_t result;

  result = qword_256E61F20;
  if (!qword_256E61F20)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E13BC, &type metadata for DetectedEntity.AppIntentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61F20);
  }
  return result;
}

unint64_t sub_23F2D46A0()
{
  unint64_t result;

  result = qword_256E61F28;
  if (!qword_256E61F28)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1474, &type metadata for DetectedEntity.AppEntityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61F28);
  }
  return result;
}

unint64_t sub_23F2D46E0()
{
  unint64_t result;

  result = qword_256E61F30;
  if (!qword_256E61F30)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E152C, &type metadata for DetectedEntity.OrganizationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61F30);
  }
  return result;
}

unint64_t sub_23F2D4720()
{
  unint64_t result;

  result = qword_256E61F38;
  if (!qword_256E61F38)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E15E4, &type metadata for DetectedEntity.PlaceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61F38);
  }
  return result;
}

unint64_t sub_23F2D4760()
{
  unint64_t result;

  result = qword_256E61F40;
  if (!qword_256E61F40)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E169C, &type metadata for DetectedEntity.PersonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61F40);
  }
  return result;
}

unint64_t sub_23F2D47A0()
{
  unint64_t result;

  result = qword_256E61F48;
  if (!qword_256E61F48)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1754, &type metadata for DetectedEntity.AddressCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61F48);
  }
  return result;
}

unint64_t sub_23F2D47E0()
{
  unint64_t result;

  result = qword_256E61F50;
  if (!qword_256E61F50)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E180C, &type metadata for DetectedEntity.LinkCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61F50);
  }
  return result;
}

unint64_t sub_23F2D4820()
{
  unint64_t result;

  result = qword_256E61F58;
  if (!qword_256E61F58)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E18C4, &type metadata for DetectedEntity.PhoneNumberCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61F58);
  }
  return result;
}

unint64_t sub_23F2D4860()
{
  unint64_t result;

  result = qword_256E61F60;
  if (!qword_256E61F60)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E197C, &type metadata for DetectedEntity.DateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61F60);
  }
  return result;
}

unint64_t sub_23F2D48A0()
{
  unint64_t result;

  result = qword_256E61F68;
  if (!qword_256E61F68)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1A34, &type metadata for DetectedEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61F68);
  }
  return result;
}

unint64_t sub_23F2D48E0()
{
  unint64_t result;

  result = qword_256E61F70;
  if (!qword_256E61F70)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1AEC, &type metadata for AddressComponents.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61F70);
  }
  return result;
}

unint64_t sub_23F2D4920()
{
  unint64_t result;

  result = qword_256E61F78;
  if (!qword_256E61F78)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1BA4, &type metadata for DetectedDate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61F78);
  }
  return result;
}

unint64_t sub_23F2D4960()
{
  unint64_t result;

  result = qword_256E61F80;
  if (!qword_256E61F80)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1C5C, &type metadata for DetectedPhoneNumber.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61F80);
  }
  return result;
}

unint64_t sub_23F2D49A0()
{
  unint64_t result;

  result = qword_256E61F88;
  if (!qword_256E61F88)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1D14, &type metadata for DetectedLink.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61F88);
  }
  return result;
}

unint64_t sub_23F2D49E0()
{
  unint64_t result;

  result = qword_256E61F90;
  if (!qword_256E61F90)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1DCC, &type metadata for DetectedAddress.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61F90);
  }
  return result;
}

unint64_t sub_23F2D4A20()
{
  unint64_t result;

  result = qword_256E61F98;
  if (!qword_256E61F98)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1E84, &type metadata for DetectedPerson.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61F98);
  }
  return result;
}

unint64_t sub_23F2D4A60()
{
  unint64_t result;

  result = qword_256E61FA0;
  if (!qword_256E61FA0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1F3C, &type metadata for DetectedPlace.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61FA0);
  }
  return result;
}

unint64_t sub_23F2D4AA0()
{
  unint64_t result;

  result = qword_256E61FA8;
  if (!qword_256E61FA8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1FF4, &type metadata for DetectedOrganization.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61FA8);
  }
  return result;
}

unint64_t sub_23F2D4AE0()
{
  unint64_t result;

  result = qword_256E61FB0;
  if (!qword_256E61FB0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E20AC, &type metadata for DetectedAppEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61FB0);
  }
  return result;
}

unint64_t sub_23F2D4B20()
{
  unint64_t result;

  result = qword_256E61FB8;
  if (!qword_256E61FB8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2164, &type metadata for DetectedAppIntent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61FB8);
  }
  return result;
}

unint64_t sub_23F2D4B60()
{
  unint64_t result;

  result = qword_256E61FC0;
  if (!qword_256E61FC0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E20D4, &type metadata for DetectedAppIntent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61FC0);
  }
  return result;
}

unint64_t sub_23F2D4BA0()
{
  unint64_t result;

  result = qword_256E61FC8;
  if (!qword_256E61FC8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E20FC, &type metadata for DetectedAppIntent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61FC8);
  }
  return result;
}

unint64_t sub_23F2D4BE0()
{
  unint64_t result;

  result = qword_256E61FD0;
  if (!qword_256E61FD0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E201C, &type metadata for DetectedAppEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61FD0);
  }
  return result;
}

unint64_t sub_23F2D4C20()
{
  unint64_t result;

  result = qword_256E61FD8;
  if (!qword_256E61FD8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2044, &type metadata for DetectedAppEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61FD8);
  }
  return result;
}

unint64_t sub_23F2D4C60()
{
  unint64_t result;

  result = qword_256E61FE0;
  if (!qword_256E61FE0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1F64, &type metadata for DetectedOrganization.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61FE0);
  }
  return result;
}

unint64_t sub_23F2D4CA0()
{
  unint64_t result;

  result = qword_256E61FE8;
  if (!qword_256E61FE8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1F8C, &type metadata for DetectedOrganization.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61FE8);
  }
  return result;
}

unint64_t sub_23F2D4CE0()
{
  unint64_t result;

  result = qword_256E61FF0;
  if (!qword_256E61FF0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1EAC, &type metadata for DetectedPlace.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61FF0);
  }
  return result;
}

unint64_t sub_23F2D4D20()
{
  unint64_t result;

  result = qword_256E61FF8;
  if (!qword_256E61FF8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1ED4, &type metadata for DetectedPlace.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E61FF8);
  }
  return result;
}

unint64_t sub_23F2D4D60()
{
  unint64_t result;

  result = qword_256E62000;
  if (!qword_256E62000)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1DF4, &type metadata for DetectedPerson.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62000);
  }
  return result;
}

unint64_t sub_23F2D4DA0()
{
  unint64_t result;

  result = qword_256E62008;
  if (!qword_256E62008)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1E1C, &type metadata for DetectedPerson.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62008);
  }
  return result;
}

unint64_t sub_23F2D4DE0()
{
  unint64_t result;

  result = qword_256E62010;
  if (!qword_256E62010)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1D3C, &type metadata for DetectedAddress.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62010);
  }
  return result;
}

unint64_t sub_23F2D4E20()
{
  unint64_t result;

  result = qword_256E62018;
  if (!qword_256E62018)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1D64, &type metadata for DetectedAddress.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62018);
  }
  return result;
}

unint64_t sub_23F2D4E60()
{
  unint64_t result;

  result = qword_256E62020;
  if (!qword_256E62020)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1C84, &type metadata for DetectedLink.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62020);
  }
  return result;
}

unint64_t sub_23F2D4EA0()
{
  unint64_t result;

  result = qword_256E62028;
  if (!qword_256E62028)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1CAC, &type metadata for DetectedLink.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62028);
  }
  return result;
}

unint64_t sub_23F2D4EE0()
{
  unint64_t result;

  result = qword_256E62030;
  if (!qword_256E62030)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1BCC, &type metadata for DetectedPhoneNumber.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62030);
  }
  return result;
}

unint64_t sub_23F2D4F20()
{
  unint64_t result;

  result = qword_256E62038;
  if (!qword_256E62038)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1BF4, &type metadata for DetectedPhoneNumber.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62038);
  }
  return result;
}

unint64_t sub_23F2D4F60()
{
  unint64_t result;

  result = qword_256E62040;
  if (!qword_256E62040)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1B14, &type metadata for DetectedDate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62040);
  }
  return result;
}

unint64_t sub_23F2D4FA0()
{
  unint64_t result;

  result = qword_256E62048;
  if (!qword_256E62048)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1B3C, &type metadata for DetectedDate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62048);
  }
  return result;
}

unint64_t sub_23F2D4FE0()
{
  unint64_t result;

  result = qword_256E62050;
  if (!qword_256E62050)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1A5C, &type metadata for AddressComponents.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62050);
  }
  return result;
}

unint64_t sub_23F2D5020()
{
  unint64_t result;

  result = qword_256E62058;
  if (!qword_256E62058)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1A84, &type metadata for AddressComponents.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62058);
  }
  return result;
}

unint64_t sub_23F2D5060()
{
  unint64_t result;

  result = qword_256E62060;
  if (!qword_256E62060)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E18EC, &type metadata for DetectedEntity.DateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62060);
  }
  return result;
}

unint64_t sub_23F2D50A0()
{
  unint64_t result;

  result = qword_256E62068;
  if (!qword_256E62068)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1914, &type metadata for DetectedEntity.DateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62068);
  }
  return result;
}

unint64_t sub_23F2D50E0()
{
  unint64_t result;

  result = qword_256E62070;
  if (!qword_256E62070)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1834, &type metadata for DetectedEntity.PhoneNumberCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62070);
  }
  return result;
}

unint64_t sub_23F2D5120()
{
  unint64_t result;

  result = qword_256E62078;
  if (!qword_256E62078)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E185C, &type metadata for DetectedEntity.PhoneNumberCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62078);
  }
  return result;
}

unint64_t sub_23F2D5160()
{
  unint64_t result;

  result = qword_256E62080;
  if (!qword_256E62080)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E177C, &type metadata for DetectedEntity.LinkCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62080);
  }
  return result;
}

unint64_t sub_23F2D51A0()
{
  unint64_t result;

  result = qword_256E62088;
  if (!qword_256E62088)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E17A4, &type metadata for DetectedEntity.LinkCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62088);
  }
  return result;
}

unint64_t sub_23F2D51E0()
{
  unint64_t result;

  result = qword_256E62090;
  if (!qword_256E62090)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E16C4, &type metadata for DetectedEntity.AddressCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62090);
  }
  return result;
}

unint64_t sub_23F2D5220()
{
  unint64_t result;

  result = qword_256E62098;
  if (!qword_256E62098)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E16EC, &type metadata for DetectedEntity.AddressCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62098);
  }
  return result;
}

unint64_t sub_23F2D5260()
{
  unint64_t result;

  result = qword_256E620A0;
  if (!qword_256E620A0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E160C, &type metadata for DetectedEntity.PersonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E620A0);
  }
  return result;
}

unint64_t sub_23F2D52A0()
{
  unint64_t result;

  result = qword_256E620A8;
  if (!qword_256E620A8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1634, &type metadata for DetectedEntity.PersonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E620A8);
  }
  return result;
}

unint64_t sub_23F2D52E0()
{
  unint64_t result;

  result = qword_256E620B0;
  if (!qword_256E620B0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1554, &type metadata for DetectedEntity.PlaceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E620B0);
  }
  return result;
}

unint64_t sub_23F2D5320()
{
  unint64_t result;

  result = qword_256E620B8;
  if (!qword_256E620B8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E157C, &type metadata for DetectedEntity.PlaceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E620B8);
  }
  return result;
}

unint64_t sub_23F2D5360()
{
  unint64_t result;

  result = qword_256E620C0;
  if (!qword_256E620C0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E149C, &type metadata for DetectedEntity.OrganizationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E620C0);
  }
  return result;
}

unint64_t sub_23F2D53A0()
{
  unint64_t result;

  result = qword_256E620C8;
  if (!qword_256E620C8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E14C4, &type metadata for DetectedEntity.OrganizationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E620C8);
  }
  return result;
}

unint64_t sub_23F2D53E0()
{
  unint64_t result;

  result = qword_256E620D0;
  if (!qword_256E620D0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E13E4, &type metadata for DetectedEntity.AppEntityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E620D0);
  }
  return result;
}

unint64_t sub_23F2D5420()
{
  unint64_t result;

  result = qword_256E620D8;
  if (!qword_256E620D8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E140C, &type metadata for DetectedEntity.AppEntityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E620D8);
  }
  return result;
}

unint64_t sub_23F2D5460()
{
  unint64_t result;

  result = qword_256E620E0;
  if (!qword_256E620E0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E132C, &type metadata for DetectedEntity.AppIntentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E620E0);
  }
  return result;
}

unint64_t sub_23F2D54A0()
{
  unint64_t result;

  result = qword_256E620E8;
  if (!qword_256E620E8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1354, &type metadata for DetectedEntity.AppIntentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E620E8);
  }
  return result;
}

unint64_t sub_23F2D54E0()
{
  unint64_t result;

  result = qword_256E620F0;
  if (!qword_256E620F0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E19A4, &type metadata for DetectedEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E620F0);
  }
  return result;
}

unint64_t sub_23F2D5520()
{
  unint64_t result;

  result = qword_256E620F8;
  if (!qword_256E620F8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E19CC, &type metadata for DetectedEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E620F8);
  }
  return result;
}

unint64_t sub_23F2D5560()
{
  unint64_t result;

  result = qword_256E62100;
  if (!qword_256E62100)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E1274, &type metadata for DetectedEntityDetails.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62100);
  }
  return result;
}

unint64_t sub_23F2D55A0()
{
  unint64_t result;

  result = qword_256E62108;
  if (!qword_256E62108)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E129C, &type metadata for DetectedEntityDetails.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62108);
  }
  return result;
}

unint64_t sub_23F2D55DC()
{
  unint64_t result;

  result = qword_254345278;
  if (!qword_254345278)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectableEntityType, &type metadata for DetectableEntityType);
    atomic_store(result, (unint64_t *)&qword_254345278);
  }
  return result;
}

uint64_t sub_23F2D5620(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
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

uint64_t sub_23F2D5734()
{
  return sub_23F2DFBA8();
}

uint64_t sub_23F2D575C@<X0>(unint64_t a1@<X8>)
{
  uint64_t v1;
  int64_t v2;

  return sub_23F2CF85C(a1 > 1, v2, 1, v1);
}

uint64_t sub_23F2D5774()
{
  uint64_t v0;

  return sub_23F2CF85C(0, *(_QWORD *)(v0 + 16) + 1, 1, v0);
}

uint64_t sub_23F2D5798@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 256) + 8))(v2, v1);
}

uint64_t sub_23F2D57AC()
{
  return sub_23F2DFC14();
}

uint64_t sub_23F2D57D0()
{
  return sub_23F2DFC74();
}

uint64_t sub_23F2D57DC@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_23F2D57E8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2D57F4()
{
  return sub_23F2DFC08();
}

uint64_t sub_23F2D5808@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_23F2D5814()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D5848()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_23F2D5888()
{
  return sub_23F2DFC98();
}

uint64_t sub_23F2D5890()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_23F2D5898@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_23F2D58A0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D58A8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void sub_23F2D58B0(uint64_t a1)
{
  uint64_t *v1;

  sub_23F2CFF80(a1, v1);
}

void sub_23F2D58B8()
{
  _QWORD *v0;

  v0[13] = 0;
  v0[14] = 0;
  v0[15] = 0;
  v0[16] = 0;
}

_QWORD *sub_23F2D58F4()
{
  _QWORD *v0;

  return sub_23F2C3FE0(v0, v0[3]);
}

uint64_t sub_23F2D5914(uint64_t a1)
{
  uint64_t v1;

  return _s23IntelligenceFlowContext14DetectedEntityOwet_0(a1, 1, v1);
}

void *sub_23F2D5930(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x80uLL);
}

uint64_t sub_23F2D5938()
{
  return sub_23F2DFBF0();
}

uint64_t sub_23F2D5944()
{
  return sub_23F2DFCB0();
}

uint64_t sub_23F2D599C()
{
  return sub_23F2DFC8C();
}

uint64_t sub_23F2D59A4()
{
  return sub_23F2DFC5C();
}

uint64_t sub_23F2D59AC()
{
  return sub_23F2DFBC0();
}

uint64_t sub_23F2D59B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s23IntelligenceFlowContext14DetectedEntityOwet_0(a1, a2, a3);
}

uint64_t sub_23F2D59C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s23IntelligenceFlowContext14DetectedEntityOwst_0(a1, a2, a3, a4);
}

uint64_t sub_23F2D59D0()
{
  return sub_23F2DFC44();
}

uint64_t sub_23F2D59DC()
{
  return sub_23F2DFC8C();
}

uint64_t sub_23F2D59E4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D59EC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D59F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_23F2D5A04()
{
  return 0;
}

uint64_t sub_23F2D5A20()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D5A30()
{
  return sub_23F2DFBF0();
}

uint64_t sub_23F2D5A48()
{
  return sub_23F2DFC44();
}

uint64_t sub_23F2D5A50()
{
  return sub_23F2DFC08();
}

_QWORD *sub_23F2D5A64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v3 = *(_QWORD **)(v2 - 256);
  *v3 = a1;
  v3[1] = v1;
  return v3;
}

uint64_t sub_23F2D5A78()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F2D5A80()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t sub_23F2D5A8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_23F2D5A9C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D5AC0()
{
  return swift_bridgeObjectRelease();
}

void sub_23F2D5AC8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23F2CFF54(a1, a2, v2);
}

void sub_23F2D5AD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v0 + 16) = v1;
  v5 = v0 + 16 * v4;
  *(_QWORD *)(v5 + 32) = v2;
  *(_QWORD *)(v5 + 40) = v3;
}

uint64_t sub_23F2D5AE0()
{
  return sub_23F2DF9D4();
}

void sub_23F2D5AE8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v0[2];
  *(_QWORD *)(v1 - 104) = v0[3];
  *(_QWORD *)(v1 - 96) = v2;
  v3 = v0[4];
  *(_QWORD *)(v1 - 120) = v0[5];
  *(_QWORD *)(v1 - 112) = v3;
  v4 = v0[6];
  *(_QWORD *)(v1 - 136) = v0[7];
  *(_QWORD *)(v1 - 128) = v4;
}

uint64_t sub_23F2D5B10@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = result;
  return result;
}

void sub_23F2D5B1C(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

uint64_t sub_23F2D5B28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23F2CF85C(0, 1, 1, a4);
}

uint64_t sub_23F2D5B38()
{
  return sub_23F2DFBC0();
}

uint64_t sub_23F2D5B48()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_23F2D5B58@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_23F2D5B60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 8))(v0, *(_QWORD *)(v2 - 104));
}

uint64_t sub_23F2D5B70()
{
  return 0;
}

uint64_t sub_23F2D5B7C@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_23F2D5B88()
{
  return sub_23F2DFADC();
}

uint64_t sub_23F2D5BA4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D5BB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_23F2D5BC4()
{
  return sub_23F2DF98C();
}

void sub_23F2D5BCC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_23F2C9A68(v2, a2);
}

uint64_t sub_23F2D5BD4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F2D5BDC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 176) = 0;
  *(_QWORD *)(v0 + 184) = 0xE000000000000000;
  return sub_23F2DFB6C();
}

uint64_t sub_23F2D5BF4@<X0>(unint64_t a1@<X8>)
{
  uint64_t v1;
  int64_t v2;

  return sub_23F2CF85C(a1 > 1, v2, 1, v1);
}

uint64_t sub_23F2D5C0C@<X0>(unint64_t a1@<X8>)
{
  int64_t v1;
  uint64_t v2;

  return sub_23F2CF85C(a1 > 1, v1, 1, v2);
}

uint64_t sub_23F2D5C24()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F2D5C2C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D5C34()
{
  return sub_23F2DFC8C();
}

uint64_t sub_23F2D5C3C()
{
  return 0;
}

uint64_t sub_23F2D5C68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 88) + 32))(v1, v2, v0);
}

uint64_t sub_23F2D5C80()
{
  return sub_23F2DFC74();
}

void sub_23F2D5C98()
{
  sub_23F2CE980();
}

uint64_t sub_23F2D5CCC()
{
  return sub_23F2DFAD0();
}

uint64_t sub_23F2D5CF4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_23F2D5CFC()
{
  return swift_bridgeObjectRetain();
}

void sub_23F2D5D04()
{
  JUMPOUT(0x2426674FCLL);
}

uint64_t sub_23F2D5D18()
{
  return swift_bridgeObjectRelease();
}

void sub_23F2D5D20(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  sub_23F2C9A88(a1, v2, v1);
}

uint64_t sub_23F2D5D2C()
{
  return sub_23F2DFAA0();
}

uint64_t sub_23F2D5D5C()
{
  return 0;
}

uint64_t sub_23F2D5D78()
{
  return 0;
}

uint64_t sub_23F2D5D94()
{
  return 0;
}

uint64_t sub_23F2D5DB0()
{
  return 0;
}

void sub_23F2D5DCC(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_23F2D5DE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_23F2D5DFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v2, v0);
}

uint64_t sub_23F2D5E10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 88) + 8))(v1, v0);
}

uint64_t sub_23F2D5E24()
{
  return sub_23F2DFADC();
}

uint64_t sub_23F2D5E58()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D5E60()
{
  return sub_23F2DFA70();
}

uint64_t sub_23F2D5E68(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t sub_23F2D5EAC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D5EB4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2D5EC0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D5ED8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D5EE0@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 216) = a1;
  return swift_bridgeObjectRetain();
}

void sub_23F2D5EF0()
{
  uint64_t (*v0)(_QWORD);
  uint64_t v1;

  sub_23F2C9A68(v1, v0);
}

void sub_23F2D5F10(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23F2CA8B8(a1, v3, a3);
}

uint64_t sub_23F2D5F18()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D5F20()
{
  return sub_23F2DFBC0();
}

uint64_t sub_23F2D5F30()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D5F38()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2D5F48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_23F2D5F58()
{
  uint64_t v0;

  return v0;
}

void sub_23F2D5FC0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_23F2CFF80(v2, a2);
}

uint64_t sub_23F2D5FC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_23F2D5FE8()
{
  return sub_23F2DFAD0();
}

uint64_t sub_23F2D5FF8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D6008()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D6018(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t sub_23F2D6028(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_23F2C3FA0(a3);
}

uint64_t sub_23F2D6050()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for DetectedEntityDetails(0) + 20));
}

uint64_t sub_23F2D606C()
{
  return type metadata accessor for DetectedEntity(0);
}

uint64_t sub_23F2D6074()
{
  return type metadata accessor for DetectedAppEntity(0);
}

uint64_t sub_23F2D6098()
{
  return sub_23F2DFC80();
}

uint64_t sub_23F2D60AC(uint64_t a1)
{
  uint64_t v1;

  return _s23IntelligenceFlowContext14DetectedEntityOwet_0(a1, 1, v1);
}

unint64_t sub_23F2D60B8()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 216) = 7;
  return sub_23F2CEF04();
}

uint64_t sub_23F2D60D0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_23F2D60D8()
{
  return sub_23F2DFC5C();
}

uint64_t sub_23F2D60E4()
{
  uint64_t v0;

  return sub_23F2C4254(v0);
}

void sub_23F2D6108(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_23F2C9A88(a1, a2, v2);
}

uint64_t sub_23F2D6110()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D6118()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D6120(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return _s23IntelligenceFlowContext14DetectedEntityOwst_0(a1, a2, 1, v2);
}

uint64_t sub_23F2D612C()
{
  return sub_23F2DFA88();
}

uint64_t sub_23F2D6138()
{
  return sub_23F2DFC44();
}

uint64_t sub_23F2D6144()
{
  return swift_bridgeObjectRetain();
}

void sub_23F2D614C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_23F2CFF80(v2, a2);
}

void sub_23F2D6154(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_23F2CA8B8(a1, a2, v2);
}

id sub_23F2D615C(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_23F2D6164()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D6178()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D6180()
{
  uint64_t v0;

  return v0;
}

unint64_t sub_23F2D618C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 216) = 8;
  return sub_23F2CEE8C();
}

unint64_t sub_23F2D6198()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 216) = 6;
  return sub_23F2CEF40();
}

unint64_t sub_23F2D61A4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 216) = 5;
  return sub_23F2CEFB8();
}

unint64_t sub_23F2D61B0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 216) = 4;
  return sub_23F2CF030();
}

uint64_t sub_23F2D61BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

unint64_t sub_23F2D61C8()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 216) = 2;
  return sub_23F2CF120();
}

void sub_23F2D61E8(_QWORD *a1)
{
  void (*v1)(uint64_t);

  sub_23F2CA884(a1, v1);
}

uint64_t sub_23F2D61F0()
{
  return sub_23F2DFA88();
}

void sub_23F2D6240(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_23F2CFF54(v3, v4, a3);
}

uint64_t sub_23F2D624C()
{
  return sub_23F2DFC50();
}

uint64_t sub_23F2D6258()
{
  return sub_23F2DFC80();
}

uint64_t sub_23F2D6264()
{
  return sub_23F2DFC80();
}

uint64_t sub_23F2D627C()
{
  return sub_23F2DFC8C();
}

uint64_t sub_23F2D6284(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  return a2(0);
}

uint64_t sub_23F2D6290(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  return a2[1];
}

unint64_t sub_23F2D62A4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 216) = 1;
  return sub_23F2CF15C();
}

uint64_t sub_23F2D62B0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return *(_QWORD *)(v0 - 96);
}

uint64_t sub_23F2D62C4@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t sub_23F2D62CC()
{
  return sub_23F2DFAD0();
}

uint64_t sub_23F2D62D4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D62DC()
{
  return type metadata accessor for DetectedAppEntity(0);
}

void sub_23F2D62E4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23F2CA8B8(a1, v3, a3);
}

void sub_23F2D62EC()
{
  JUMPOUT(0x2426678ECLL);
}

uint64_t sub_23F2D62F8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2D6304()
{
  uint64_t v0;

  return v0;
}

uint64_t UIContextClient.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  UIContextClient.init()();
  return v0;
}

_QWORD *UIContextClient.init()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  type metadata accessor for UIContextXPCClient();
  v1 = swift_allocObject();
  v0[2] = sub_23F2DF254(v1, v2);
  sub_23F2DF950();
  sub_23F2C5384();
  v0[3] = sub_23F2DF944();
  sub_23F2DF974();
  sub_23F2C5384();
  v0[4] = sub_23F2DF968();
  return v0;
}

void UIContextClient.retrieveElementHierarchy(verbose:args:)(uint64_t a1)
{
  sub_23F2DF61C(a1);
}

uint64_t UIContextClient.retrieve(options:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  type metadata accessor for UIContextOptions();
  sub_23F2D65F0();
  result = sub_23F2DF95C();
  if (!v1)
  {
    sub_23F2DF2E0(result);
    v4 = v3;
    v6 = v5;
    sub_23F2C3FA0(qword_254344B60);
    sub_23F2D6630(&qword_254344BA8, qword_254344B60, (uint64_t (*)(void))sub_23F2C42DC);
    sub_23F2DF938();
    sub_23F2C5134(v4, v6);
    sub_23F2C52D4();
    return a1;
  }
  return result;
}

uint64_t UIContextClient.retrieveUIElements()()
{
  uint64_t v0;
  uint64_t result;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  result = sub_23F2DF4A8();
  if (!v0)
  {
    v3 = result;
    v4 = v2;
    sub_23F2C3FA0(&qword_256E62120);
    sub_23F2D6630(&qword_256E62128, &qword_256E62120, (uint64_t (*)(void))sub_23F2D6694);
    sub_23F2DF938();
    sub_23F2C5134(v3, v4);
    return v5;
  }
  return result;
}

uint64_t UIContextClient.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t UIContextClient.__deallocating_deinit()
{
  UIContextClient.deinit();
  return swift_deallocClassInstance();
}

unint64_t sub_23F2D65F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254344B98;
  if (!qword_254344B98)
  {
    v1 = type metadata accessor for UIContextOptions();
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for UIContextOptions, v1);
    atomic_store(result, (unint64_t *)&qword_254344B98);
  }
  return result;
}

uint64_t sub_23F2D6630(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v6 = sub_23F2C4040(a2);
    v7 = a3();
    result = MEMORY[0x2426678EC](MEMORY[0x24BEE12D0], v6, &v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23F2D6694()
{
  unint64_t result;

  result = qword_256E62130;
  if (!qword_256E62130)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for UIElement, &type metadata for UIElement);
    atomic_store(result, (unint64_t *)&qword_256E62130);
  }
  return result;
}

uint64_t type metadata accessor for UIContextClient()
{
  return objc_opt_self();
}

uint64_t method lookup function for UIContextClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UIContextClient.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

void ElementContent.Text.text.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

IntelligenceFlowContext::ElementContent::Text __swiftcall ElementContent.Text.init(text:)(IntelligenceFlowContext::ElementContent::Text text)
{
  IntelligenceFlowContext::ElementContent::Text *v1;

  *v1 = text;
  return text;
}

uint64_t static ElementContent.Text.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  v3 = a1[1];
  v4 = a2[1];
  if (v3)
  {
    if (v4)
    {
      v5 = *a1 == *a2 && v3 == v4;
      if (v5 || (sub_23F2D59A4() & 1) != 0)
        return 1;
    }
  }
  else if (!v4)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_23F2D677C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 1954047348 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23F2DFC5C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23F2D67F0()
{
  return 1954047348;
}

void sub_23F2D6800()
{
  sub_23F2D7EC8();
}

uint64_t sub_23F2D681C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2D677C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23F2D6844()
{
  sub_23F2D694C();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2D686C()
{
  sub_23F2D694C();
  return sub_23F2DFCC8();
}

void ElementContent.Text.encode(to:)()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  sub_23F2D57B8();
  v1 = v0;
  v2 = sub_23F2C3FA0(&qword_256E62138);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  sub_23F2D5954();
  sub_23F2C3FE0(v1, v1[3]);
  sub_23F2D694C();
  sub_23F2DFCB0();
  sub_23F2DFC14();
  sub_23F2D97B8(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  sub_23F2C4890();
}

unint64_t sub_23F2D694C()
{
  unint64_t result;

  result = qword_256E62140;
  if (!qword_256E62140)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2FBC, &type metadata for ElementContent.Text.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62140);
  }
  return result;
}

void ElementContent.Text.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_23F2D57B8();
  v2 = v1;
  v4 = v3;
  v5 = sub_23F2C3FA0(&qword_256E62148);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  sub_23F2D5954();
  sub_23F2C3FE0(v2, v2[3]);
  sub_23F2D694C();
  sub_23F2D98E4();
  if (!v0)
  {
    v7 = sub_23F2DFBC0();
    v9 = v8;
    sub_23F2D97B8(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    *v4 = v7;
    v4[1] = v9;
  }
  sub_23F2C48B8();
  sub_23F2C4890();
}

void sub_23F2D6A5C()
{
  ElementContent.Text.init(from:)();
}

void sub_23F2D6A70()
{
  ElementContent.Text.encode(to:)();
}

void ElementContent.Command.title.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

void ElementContent.Command.standaloneTitle.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

void ElementContent.Command.identifier.getter()
{
  sub_23F2C48C0();
  sub_23F2D57E8();
  sub_23F2C53A4();
}

uint64_t ElementContent.Command.menuHierarchyComponents.getter()
{
  return swift_bridgeObjectRetain();
}

void __swiftcall ElementContent.Command.init(title:standaloneTitle:identifier:menuHierarchyComponents:)(IntelligenceFlowContext::ElementContent::Command *__return_ptr retstr, Swift::String_optional title, Swift::String_optional standaloneTitle, Swift::String_optional identifier, Swift::OpaquePointer menuHierarchyComponents)
{
  retstr->title = title;
  retstr->standaloneTitle = standaloneTitle;
  retstr->identifier = identifier;
  retstr->menuHierarchyComponents = menuHierarchyComponents;
}

void static ElementContent.Command.== infix(_:_:)()
{
  _QWORD *v0;
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
  uint64_t v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  _QWORD *v16;
  _QWORD *v17;

  sub_23F2D58DC();
  v2 = v1;
  v3 = v0[1];
  v4 = v0[2];
  v6 = v0[3];
  v5 = v0[4];
  v7 = v0[5];
  v8 = v2[1];
  v9 = v2[2];
  v11 = v2[3];
  v10 = v2[4];
  v12 = v2[5];
  if (v3)
  {
    if (!v8)
      goto LABEL_28;
    v13 = *v0 == *v2 && v3 == v8;
    if (!v13 && (sub_23F2D59A4() & 1) == 0)
      goto LABEL_28;
  }
  else if (v8)
  {
    goto LABEL_28;
  }
  if (v6)
  {
    if (!v11)
      goto LABEL_28;
    v14 = v4 == v9 && v6 == v11;
    if (!v14 && (sub_23F2D59A4() & 1) == 0)
      goto LABEL_28;
  }
  else if (v11)
  {
    goto LABEL_28;
  }
  if (v7)
  {
    if (v12)
    {
      v15 = v5 == v10 && v7 == v12;
      if (v15 || (sub_23F2D59A4() & 1) != 0)
        goto LABEL_26;
    }
  }
  else if (!v12)
  {
LABEL_26:
    v16 = (_QWORD *)sub_23F2D57E8();
    sub_23F2D70F0(v16, v17);
    return;
  }
LABEL_28:
  sub_23F2D5830();
}

void sub_23F2D6BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
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
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  BOOL v39;

  sub_23F2D58DC();
  a19 = v24;
  a20 = v25;
  v26 = sub_23F2D9874();
  v27 = type metadata accessor for DetectedEntity(v26);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&a9 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&a9 - v31;
  v33 = *(_QWORD *)(v21 + 16);
  if (v33 == *(_QWORD *)(v20 + 16) && v33 && v21 != v20)
  {
    sub_23F2D98F0();
    v35 = v34 - 1;
    do
    {
      sub_23F2D9730();
      sub_23F2D9730();
      static DetectedEntity.== infix(_:_:)();
      v37 = v36;
      sub_23F2D9768((uint64_t)v30, type metadata accessor for DetectedEntity);
      sub_23F2D9768((uint64_t)v32, type metadata accessor for DetectedEntity);
      v39 = v35-- != 0;
      if ((v37 & 1) == 0)
        break;
      v22 += v23;
    }
    while (v39);
  }
  sub_23F2D5830();
}

void sub_23F2D6CFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
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
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;

  sub_23F2D58DC();
  a19 = v24;
  a20 = v25;
  v26 = sub_23F2D9874();
  v27 = type metadata accessor for DetectedEntityDetails(v26);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&a9 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&a9 - v31;
  v33 = *(_QWORD *)(v21 + 16);
  if (v33 == *(_QWORD *)(v20 + 16) && v33 && v21 != v20)
  {
    sub_23F2D98F0();
    v35 = v34 - 1;
    while (1)
    {
      v36 = v35;
      sub_23F2D9730();
      sub_23F2D9730();
      static DetectedEntity.== infix(_:_:)();
      if ((v37 & 1) == 0)
        break;
      v38 = v32[*(int *)(v27 + 20)] ^ v30[*(int *)(v27 + 20)];
      sub_23F2D9768((uint64_t)v30, type metadata accessor for DetectedEntityDetails);
      sub_23F2D9768((uint64_t)v32, type metadata accessor for DetectedEntityDetails);
      if ((v38 & 1) == 0)
      {
        v35 = v36 - 1;
        v22 += v23;
        if (v36)
          continue;
      }
      goto LABEL_11;
    }
    sub_23F2D9768((uint64_t)v30, type metadata accessor for DetectedEntityDetails);
    sub_23F2D9768((uint64_t)v32, type metadata accessor for DetectedEntityDetails);
  }
LABEL_11:
  sub_23F2D5830();
}

void sub_23F2D6E48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42[19];
  _BYTE v43[152];
  _QWORD v44[3];
  uint64_t v45;
  _QWORD v46[3];
  uint64_t v47;

  sub_23F2D58DC();
  v1 = v0;
  v3 = v2;
  v4 = type metadata accessor for DetectedEntity(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v33 - v9;
  v11 = *(_QWORD *)(v3 + 16);
  if (v11 != *(_QWORD *)(v1 + 16))
    goto LABEL_22;
  if (!v11)
    goto LABEL_22;
  if (v3 == v1)
    goto LABEL_22;
  v36 = v3 + 32;
  v37 = v11;
  sub_23F2D9864(v44, (const void *)(v3 + 32));
  v12 = v44[0];
  v35 = v1 + 32;
  sub_23F2D9864(v46, (const void *)(v1 + 32));
  v40 = v46[0];
  v41 = v12;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = (unint64_t *)(v46[0] + 16);
  if (v13 != *(_QWORD *)(v46[0] + 16))
  {
LABEL_22:
    sub_23F2D5830();
    return;
  }
  v33 = &v47;
  v34 = &v45;
  v38 = v5;
  v39 = 1;
  while (1)
  {
    if (!v13)
    {
      sub_23F2D95A8((uint64_t)v44);
      sub_23F2D95A8((uint64_t)v46);
      goto LABEL_14;
    }
    v15 = *(unsigned __int8 *)(v5 + 80);
    sub_23F2D95A8((uint64_t)v44);
    sub_23F2D95A8((uint64_t)v46);
    if (v41 != v40)
      break;
LABEL_14:
    sub_23F2D6CFC(v44[1], v46[1], v16, v17, v18, v19, v20, v21, (uint64_t)v33, (uint64_t)v34, v35, v36, v37, v38, v39, v40, v41, v42[0], v42[1],
      v42[2]);
    if ((v27 & 1) == 0 || (sub_23F2D6E48(v44[2], v46[2]) & 1) == 0)
    {
LABEL_21:
      sub_23F2D966C((uint64_t)v46);
      sub_23F2D966C((uint64_t)v44);
      goto LABEL_22;
    }
    memcpy(v43, v34, 0x92uLL);
    memcpy(v42, v33, 0x92uLL);
    v28 = static UIElement.== infix(_:_:)((uint64_t)v43, (uint64_t)v42);
    sub_23F2D966C((uint64_t)v46);
    sub_23F2D966C((uint64_t)v44);
    v5 = v38;
    if ((v28 & 1) != 0 && v39 != v37)
    {
      v29 = v39 + 1;
      v30 = 176 * v39;
      sub_23F2D9864(v44, (const void *)(v36 + 176 * v39));
      v31 = v44[0];
      sub_23F2D9864(v46, (const void *)(v35 + v30));
      v40 = v46[0];
      v41 = v31;
      v13 = *(_QWORD *)(v31 + 16);
      v14 = (unint64_t *)(v46[0] + 16);
      v32 = *(_QWORD *)(v46[0] + 16);
      v39 = v29;
      if (v13 == v32)
        continue;
    }
    goto LABEL_22;
  }
  v22 = 0;
  v23 = (v15 + 32) & ~v15;
  v24 = *(_QWORD *)(v38 + 72);
  while (1)
  {
    sub_23F2D9730();
    if (v22 >= *v14)
      break;
    sub_23F2D9730();
    static DetectedEntity.== infix(_:_:)();
    v26 = v25;
    sub_23F2D9768((uint64_t)v8, type metadata accessor for DetectedEntity);
    sub_23F2D9768((uint64_t)v10, type metadata accessor for DetectedEntity);
    if ((v26 & 1) == 0)
      goto LABEL_21;
    ++v22;
    v23 += v24;
    if (v13 == v22)
      goto LABEL_14;
  }
  __break(1u);
}

uint64_t sub_23F2D70F0(_QWORD *a1, _QWORD *a2)
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
    v7 = sub_23F2DFC5C();
    result = 0;
    if ((v7 & 1) == 0)
      return result;
  }
  if (v2 == 1)
    return 1;
  v8 = a1 + 7;
  v9 = a2 + 7;
  v10 = 1;
  while (v10 < v2)
  {
    result = *(v8 - 1);
    if (result != *(v9 - 1) || *v8 != *v9)
    {
      result = sub_23F2DFC5C();
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

uint64_t sub_23F2D71BC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  char v8;

  v2 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v2 || (sub_23F2DFC5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6F6C61646E617473 && a2 == 0xEF656C746954656ELL;
    if (v6 || (sub_23F2DFC5C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
      if (v7 || (sub_23F2DFC5C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000017 && a2 == 0x800000023F2E3AF0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v8 = sub_23F2DFC5C();
        swift_bridgeObjectRelease();
        if ((v8 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t sub_23F2D7390()
{
  sub_23F2DFC74();
  sub_23F2DFC80();
  return sub_23F2DFC98();
}

uint64_t sub_23F2D73D4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23F2D7404 + 4 * byte_23F2E2880[a1]))(0x656C746974, 0xE500000000000000);
}

uint64_t sub_23F2D7404()
{
  return 0x6F6C61646E617473;
}

uint64_t sub_23F2D7428()
{
  return 0x696669746E656469;
}

unint64_t sub_23F2D7444()
{
  return 0xD000000000000017;
}

uint64_t sub_23F2D7460()
{
  return sub_23F2D7390();
}

uint64_t sub_23F2D7468()
{
  unsigned __int8 *v0;

  return sub_23F2D73D4(*v0);
}

uint64_t sub_23F2D7470@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2D71BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F2D7494()
{
  sub_23F2D767C();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2D74BC()
{
  sub_23F2D767C();
  return sub_23F2DFCC8();
}

void ElementContent.Command.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_23F2D57B8();
  v2 = v1;
  v3 = sub_23F2C3FA0(&qword_256E62150);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  sub_23F2D983C();
  v7 = v6 - v5;
  sub_23F2C3FE0(v2, v2[3]);
  sub_23F2D767C();
  sub_23F2DFCB0();
  sub_23F2DFC14();
  if (!v0)
  {
    sub_23F2D98C4();
    sub_23F2D98C4();
    sub_23F2C3FA0(&qword_254344E18);
    sub_23F2D7920(&qword_256E62160, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_23F2DFC44();
  }
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
  sub_23F2C4890();
}

unint64_t sub_23F2D767C()
{
  unint64_t result;

  result = qword_256E62158;
  if (!qword_256E62158)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2F6C, &type metadata for ElementContent.Command.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62158);
  }
  return result;
}

void ElementContent.Command.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t *v4;
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

  sub_23F2D57B8();
  v2 = v1;
  v4 = v3;
  v5 = sub_23F2C3FA0(&qword_256E62168);
  MEMORY[0x24BDAC7A8](v5);
  sub_23F2D984C();
  sub_23F2C3FE0(v2, v2[3]);
  sub_23F2D767C();
  sub_23F2DFCA4();
  if (v0)
  {
    sub_23F2C48B8();
  }
  else
  {
    v6 = sub_23F2D5B38();
    v8 = v7;
    swift_bridgeObjectRetain();
    v9 = sub_23F2D5B38();
    v16 = v10;
    v14 = v9;
    v15 = v6;
    swift_bridgeObjectRetain();
    v13 = sub_23F2DFBC0();
    v12 = v11;
    sub_23F2C3FA0(&qword_254344E18);
    sub_23F2D7920(&qword_256E62170, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    swift_bridgeObjectRetain();
    sub_23F2DFBF0();
    sub_23F2D97A8();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23F2C48C0();
    sub_23F2D5A9C();
    sub_23F2D59E4();
    *v4 = v15;
    v4[1] = v8;
    v4[2] = v14;
    v4[3] = v16;
    v4[4] = v13;
    v4[5] = v12;
    v4[6] = v17;
    sub_23F2C48B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23F2D59E4();
    swift_bridgeObjectRelease();
  }
  sub_23F2C4890();
}

uint64_t sub_23F2D7920(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = sub_23F2C4040(&qword_254344E18);
    v8 = a2;
    result = MEMORY[0x2426678EC](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

void sub_23F2D7980()
{
  ElementContent.Command.init(from:)();
}

void sub_23F2D7994()
{
  ElementContent.Command.encode(to:)();
}

uint64_t static ElementContent.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
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
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
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
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
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
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;

  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(_BYTE *)(a1 + 56);
  v11 = *(_QWORD *)(a2 + 8);
  v13 = *(_QWORD *)(a2 + 16);
  v12 = *(_QWORD *)(a2 + 24);
  v14 = *(unsigned __int8 *)(a2 + 56);
  v132 = *(_QWORD *)a1;
  if ((v10 & 1) == 0)
  {
    if ((v14 & 1) == 0)
    {
      v125 = *(_QWORD *)a1;
      v126 = *(_QWORD *)(a1 + 8);
      v127 = *(_QWORD *)(a1 + 16);
      v128 = *(_QWORD *)(a1 + 24);
      v129 = *(_QWORD *)(a1 + 32);
      v130 = *(_QWORD *)(a1 + 40);
      v131 = *(_QWORD *)(a1 + 48);
      v118 = *(_QWORD *)a2;
      v119 = *(_QWORD *)(a2 + 8);
      v120 = *(_QWORD *)(a2 + 16);
      v121 = *(_QWORD *)(a2 + 24);
      v122 = *(_QWORD *)(a2 + 32);
      v123 = *(_QWORD *)(a2 + 40);
      v124 = *(_QWORD *)(a2 + 48);
      v115 = v130;
      v117 = v131;
      v111 = v128;
      v113 = v129;
      v109 = v127;
      static ElementContent.Command.== infix(_:_:)();
      v16 = v67;
      v68 = sub_23F2D97F0();
      sub_23F2D7C1C(v68, v69, v70, v71, v72, v73, v74, 0);
      v75 = sub_23F2D9884();
      v82 = 0;
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  if (!*(_BYTE *)(a2 + 56))
  {
LABEL_12:
    v39 = *(_QWORD *)(a1 + 24);
    v40 = *(_QWORD *)(a1 + 32);
    sub_23F2D98AC();
    v42 = v41;
    sub_23F2D7C1C(v43, v44, v45, v46, v47, v48, v49, v50);
    v51 = v42;
    v52 = v8;
    v53 = v9;
    v54 = v39;
    v55 = v40;
    v56 = v13;
    v57 = v12;
    v58 = v10;
    goto LABEL_13;
  }
  if (!v8)
  {
    if (!v11)
    {
      sub_23F2D986C(a1, a2, a3, a4, a5, a6, a7, v14, v105, v106, v108, v110, v112, v114, v116, v118, v119, v120, v121,
        v122,
        v123,
        v124,
        v125,
        v126,
        v127,
        v128,
        v129,
        v130,
        v131,
        v132);
      v16 = 1;
      return v16 & 1;
    }
    v59 = swift_bridgeObjectRetain();
    goto LABEL_14;
  }
  if (v11)
  {
    v109 = *(_QWORD *)(a1 + 16);
    v111 = *(_QWORD *)(a1 + 24);
    v113 = *(_QWORD *)(a1 + 32);
    v115 = *(_QWORD *)(a1 + 40);
    v117 = *(_QWORD *)(a1 + 48);
    if (v7 != *(_QWORD *)a2 || v8 != v11)
    {
      HIDWORD(v106) = sub_23F2DFC5C();
      v16 = 1;
      v17 = sub_23F2D97F0();
      sub_23F2D7C1C(v17, v18, v19, v20, v21, v22, v23, 1);
      v24 = sub_23F2D9884();
      v31 = sub_23F2D7C1C(v24, v25, v26, v27, v28, v29, v30, 1);
      sub_23F2D986C(v31, v32, v33, v34, v35, v36, v37, v38, v105, v106, v9, v111, v113, v115, v117, v118, v119, v120, v121,
        v122,
        v123,
        v124,
        v125,
        v126,
        v127,
        v128,
        v129,
        v130,
        v131,
        v132);
      if ((v107 & 1) != 0)
        return v16 & 1;
      goto LABEL_15;
    }
    v16 = 1;
    v104 = *(_QWORD *)a1;
    sub_23F2D7C1C(v7, v8, v13, *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 32), *(_QWORD *)(a2 + 40), *(_QWORD *)(a2 + 48), 1);
    v75 = v104;
    v76 = v8;
    v77 = v9;
    v78 = v111;
    v79 = v113;
    v80 = v115;
    v81 = v117;
    v82 = 1;
LABEL_17:
    v83 = sub_23F2D7C1C(v75, v76, v77, v78, v79, v80, v81, v82);
    sub_23F2D986C(v83, v84, v85, v86, v87, v88, v89, v90, v105, v106, v109, v111, v113, v115, v117, v118, v119, v120, v121,
      v122,
      v123,
      v124,
      v125,
      v126,
      v127,
      v128,
      v129,
      v130,
      v131,
      v132);
    return v16 & 1;
  }
  v92 = *(_QWORD *)(a1 + 16);
  v93 = *(_QWORD *)(a1 + 24);
  v94 = *(_QWORD *)(a1 + 32);
  sub_23F2D98AC();
  v96 = v95;
  sub_23F2D7C1C(v97, v98, v99, v100, v101, v102, v103, 1);
  v51 = v96;
  v52 = v8;
  v53 = v92;
  v54 = v93;
  v55 = v94;
  v56 = v13;
  v57 = v12;
  v58 = 1;
LABEL_13:
  v59 = sub_23F2D7C1C(v51, v52, v53, v54, v55, v56, v57, v58);
LABEL_14:
  sub_23F2D986C(v59, v60, v61, v62, v63, v64, v65, v66, v105, v106, v108, v110, v112, v114, v116, v118, v119, v120, v121,
    v122,
    v123,
    v124,
    v125,
    v126,
    v127,
    v128,
    v129,
    v130,
    v131,
    v132);
LABEL_15:
  v16 = 0;
  return v16 & 1;
}

uint64_t sub_23F2D7C1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if ((a8 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F2D7C70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 96);
  v7 = *(_QWORD *)(a1 + 104);
  v8 = *(_QWORD *)(a1 + 112);
  v9 = *(_BYTE *)(a1 + 120);
  sub_23F2D7D00(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
  sub_23F2D7D00(v2, v3, v4, v5, v6, v7, v8, v9);
  return a1;
}

uint64_t sub_23F2D7D00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if ((a8 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2D7D54(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x646E616D6D6F63 && a2 == 0xE700000000000000;
  if (v2 || (sub_23F2DFC5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1954047348 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_23F2DFC5C();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23F2D7E30(char a1)
{
  if ((a1 & 1) != 0)
    return 1954047348;
  else
    return 0x646E616D6D6F63;
}

uint64_t sub_23F2D7E60(uint64_t a1, uint64_t a2)
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
    v3 = sub_23F2D59A4();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_23F2D7EC8()
{
  sub_23F2DFC74();
  sub_23F2D6258();
  sub_23F2DFC98();
  sub_23F2D578C();
}

uint64_t sub_23F2D7EF8()
{
  char *v0;

  return sub_23F2D7E30(*v0);
}

uint64_t sub_23F2D7F00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2D7D54(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F2D7F24()
{
  sub_23F2D8294();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2D7F4C()
{
  sub_23F2D8294();
  return sub_23F2DFCC8();
}

uint64_t sub_23F2D7F74()
{
  sub_23F2D8348();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2D7F9C()
{
  sub_23F2D8348();
  return sub_23F2DFCC8();
}

void sub_23F2D7FC4()
{
  sub_23F2DFC74();
  sub_23F2D6258();
  sub_23F2DFC98();
  sub_23F2D578C();
}

uint64_t sub_23F2D7FF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2D7E60(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23F2D8018()
{
  sub_23F2D82D0();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2D8040()
{
  sub_23F2D82D0();
  return sub_23F2DFCC8();
}

void ElementContent.encode(to:)()
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
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  sub_23F2D57B8();
  v4 = v3;
  v5 = sub_23F2C3FA0(&qword_256E62178);
  v17 = *(_QWORD *)(v5 - 8);
  v18 = v5;
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v6);
  sub_23F2D983C();
  v9 = v8 - v7;
  v10 = sub_23F2C3FA0(&qword_256E62180);
  v15 = *(_QWORD *)(v10 - 8);
  v16 = v10;
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v11);
  sub_23F2D984C();
  v12 = sub_23F2C3FA0(&qword_256E62188);
  v19 = *(_QWORD *)(v12 - 8);
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v13);
  sub_23F2D5858();
  v14 = *(_BYTE *)(v0 + 56);
  sub_23F2C3FE0(v4, v4[3]);
  sub_23F2D8294();
  sub_23F2DFCB0();
  if ((v14 & 1) != 0)
  {
    sub_23F2D82D0();
    sub_23F2D982C();
    sub_23F2D830C();
    sub_23F2DFC44();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v9, v18);
  }
  else
  {
    sub_23F2D8348();
    sub_23F2D982C();
    sub_23F2D8384();
    sub_23F2DFC44();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v2, v16);
  }
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v1, v12);
  sub_23F2C4890();
}

unint64_t sub_23F2D8294()
{
  unint64_t result;

  result = qword_256E62190;
  if (!qword_256E62190)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2F1C, &type metadata for ElementContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62190);
  }
  return result;
}

unint64_t sub_23F2D82D0()
{
  unint64_t result;

  result = qword_256E62198;
  if (!qword_256E62198)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2ECC, &type metadata for ElementContent.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62198);
  }
  return result;
}

unint64_t sub_23F2D830C()
{
  unint64_t result;

  result = qword_256E621A0;
  if (!qword_256E621A0)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for ElementContent.Text, &type metadata for ElementContent.Text);
    atomic_store(result, (unint64_t *)&qword_256E621A0);
  }
  return result;
}

unint64_t sub_23F2D8348()
{
  unint64_t result;

  result = qword_256E621A8;
  if (!qword_256E621A8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2E7C, &type metadata for ElementContent.CommandCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E621A8);
  }
  return result;
}

unint64_t sub_23F2D8384()
{
  unint64_t result;

  result = qword_256E621B0;
  if (!qword_256E621B0)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for ElementContent.Command, &type metadata for ElementContent.Command);
    atomic_store(result, (unint64_t *)&qword_256E621B0);
  }
  return result;
}

void ElementContent.init(from:)()
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
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  sub_23F2D57B8();
  v3 = v2;
  v26 = v4;
  sub_23F2C3FA0(&qword_256E621B8);
  sub_23F2D5728();
  MEMORY[0x24BDAC7A8](v5);
  sub_23F2D983C();
  v27 = sub_23F2C3FA0(&qword_256E621C0);
  MEMORY[0x24BDAC7A8](v27);
  sub_23F2D5954();
  v6 = sub_23F2C3FA0(&qword_256E621C8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  sub_23F2D5858();
  sub_23F2C3FE0(v3, v3[3]);
  sub_23F2D8294();
  sub_23F2D98E4();
  if (v0)
    goto LABEL_7;
  v25 = (uint64_t)v3;
  v8 = v1;
  v9 = sub_23F2DFBFC();
  v10 = *(_QWORD *)(v9 + 16);
  if (!v10
    || (v11 = *(_BYTE *)(v9 + 32),
        sub_23F2D561C(1, v10, v9, v9 + 32, 0, (2 * v10) | 1),
        v13 = v12,
        v15 = v14,
        swift_bridgeObjectRelease(),
        v13 != v15 >> 1))
  {
    v16 = sub_23F2DFB84();
    swift_allocError();
    v18 = v17;
    sub_23F2C3FA0(&qword_256E61C68);
    *v18 = &type metadata for ElementContent;
    sub_23F2DFBB4();
    sub_23F2DFB78();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x24BEE26D0], v16);
    swift_willThrow();
    swift_unknownObjectRelease();
    sub_23F2D9824(v8, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
    v3 = (_QWORD *)v25;
LABEL_7:
    sub_23F2C4254((uint64_t)v3);
    goto LABEL_8;
  }
  if ((v11 & 1) != 0)
  {
    LOBYTE(v28) = 1;
    sub_23F2D82D0();
    sub_23F2D9910();
    sub_23F2DFBA8();
    sub_23F2D8958();
    sub_23F2DFBF0();
    sub_23F2D9810();
    sub_23F2D97E8();
    sub_23F2D9824(v1, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
    v19 = 0;
    v20 = v28;
    v21 = 0uLL;
    v22 = 0uLL;
  }
  else
  {
    LOBYTE(v28) = 0;
    sub_23F2D8348();
    sub_23F2D9910();
    sub_23F2DFBA8();
    sub_23F2D8994();
    sub_23F2DFBF0();
    sub_23F2D97B8(MEMORY[8]);
    sub_23F2D97E8();
    v23 = sub_23F2D98D4();
    sub_23F2D9824(v23, v24);
    v20 = v28;
    v21 = v29;
    v22 = v30;
    v19 = v31;
  }
  *(_OWORD *)v26 = v20;
  *(_OWORD *)(v26 + 16) = v21;
  *(_OWORD *)(v26 + 32) = v22;
  *(_QWORD *)(v26 + 48) = v19;
  *(_BYTE *)(v26 + 56) = v11;
  sub_23F2C4254(v25);
LABEL_8:
  sub_23F2C4890();
}

void sub_23F2D87C0()
{
  ElementContent.init(from:)();
}

void sub_23F2D87D4()
{
  ElementContent.encode(to:)();
}

uint64_t ElementContent.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*(_BYTE *)(v0 + 56) != 1)
    return 0x646E616D6D6F43;
  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v6 = *(_QWORD *)(v0 + 8);
  v5 = *(_QWORD *)(v0 + 16);
  v7 = *(_QWORD *)v0;
  swift_bridgeObjectRetain();
  sub_23F2D9904();
  swift_bridgeObjectRelease();
  sub_23F2D97C4();
  swift_bridgeObjectRetain();
  sub_23F2DFADC();
  swift_bridgeObjectRelease();
  sub_23F2D989C();
  sub_23F2D7D00(v7, v6, v5, v4, v3, v2, v1, 1);
  return 0;
}

uint64_t ElementContent.Text.description.getter()
{
  sub_23F2D9904();
  swift_bridgeObjectRelease();
  sub_23F2D97C4();
  swift_bridgeObjectRetain();
  sub_23F2DFADC();
  swift_bridgeObjectRelease();
  sub_23F2D989C();
  return 0;
}

unint64_t sub_23F2D8958()
{
  unint64_t result;

  result = qword_256E621D0;
  if (!qword_256E621D0)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for ElementContent.Text, &type metadata for ElementContent.Text);
    atomic_store(result, (unint64_t *)&qword_256E621D0);
  }
  return result;
}

unint64_t sub_23F2D8994()
{
  unint64_t result;

  result = qword_256E621D8;
  if (!qword_256E621D8)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for ElementContent.Command, &type metadata for ElementContent.Command);
    atomic_store(result, (unint64_t *)&qword_256E621D8);
  }
  return result;
}

uint64_t destroy for ElementContent(uint64_t a1)
{
  return sub_23F2D7D00(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
}

uint64_t initializeWithCopy for ElementContent(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_BYTE *)(a2 + 56);
  sub_23F2D7C1C(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_BYTE *)(a1 + 56) = v10;
  return a1;
}

uint64_t assignWithCopy for ElementContent(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_BYTE *)(a2 + 56);
  sub_23F2D7C1C(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10);
  v11 = *(_QWORD *)a1;
  v12 = *(_QWORD *)(a1 + 8);
  v13 = *(_QWORD *)(a1 + 16);
  v14 = *(_QWORD *)(a1 + 24);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 48);
  v18 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_BYTE *)(a1 + 56) = v10;
  sub_23F2D7D00(v11, v12, v13, v14, v15, v16, v17, v18);
  return a1;
}

__n128 initializeWithTake for ElementContent(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ElementContent(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __int128 v13;

  v3 = *(_QWORD *)(a2 + 48);
  v4 = *(_BYTE *)(a2 + 56);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_BYTE *)(a1 + 56);
  v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = v3;
  *(_BYTE *)(a1 + 56) = v4;
  sub_23F2D7D00(v5, v7, v6, v8, v9, v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for ElementContent(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 57))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 56);
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

uint64_t storeEnumTagSinglePayload for ElementContent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 57) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 57) = 0;
    if (a2)
      *(_BYTE *)(result + 56) = -(char)a2;
  }
  return result;
}

uint64_t sub_23F2D8C28(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 56);
}

uint64_t sub_23F2D8C30(uint64_t result, char a2)
{
  *(_BYTE *)(result + 56) = a2 & 1;
  return result;
}

void type metadata accessor for ElementContent()
{
  sub_23F2D5A94();
}

_QWORD *assignWithCopy for ElementContent.Text(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ElementContent.Text(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for ElementContent.Text(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

void type metadata accessor for ElementContent.Text()
{
  sub_23F2D5A94();
}

uint64_t destroy for ElementContent.Command()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ElementContent.Command(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ElementContent.Command(_QWORD *a1, _QWORD *a2)
{
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
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for ElementContent.Command(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ElementContent.Command(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ElementContent.Command(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 48);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ElementContent.Command(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 48) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for ElementContent.Command()
{
  sub_23F2D5A94();
}

uint64_t storeEnumTagSinglePayload for ElementContent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23F2D8FDC + 4 * byte_23F2E2889[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23F2D9010 + 4 * byte_23F2E2884[v4]))();
}

uint64_t sub_23F2D9010(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2D9018(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F2D9020);
  return result;
}

uint64_t sub_23F2D902C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F2D9034);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23F2D9038(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2D9040(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ElementContent.CodingKeys()
{
  return &type metadata for ElementContent.CodingKeys;
}

ValueMetadata *type metadata accessor for ElementContent.CommandCodingKeys()
{
  return &type metadata for ElementContent.CommandCodingKeys;
}

ValueMetadata *type metadata accessor for ElementContent.TextCodingKeys()
{
  return &type metadata for ElementContent.TextCodingKeys;
}

uint64_t storeEnumTagSinglePayload for ElementContent.Command.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23F2D90CC + 4 * byte_23F2E2893[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23F2D9100 + 4 * byte_23F2E288E[v4]))();
}

uint64_t sub_23F2D9100(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2D9108(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F2D9110);
  return result;
}

uint64_t sub_23F2D911C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F2D9124);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23F2D9128(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2D9130(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ElementContent.Command.CodingKeys()
{
  return &type metadata for ElementContent.Command.CodingKeys;
}

uint64_t _s23IntelligenceFlowContext14ElementContentO17CommandCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23F2D918C + 4 * byte_23F2E2898[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23F2D91AC + 4 * byte_23F2E289D[v4]))();
}

_BYTE *sub_23F2D918C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23F2D91AC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23F2D91B4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23F2D91BC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23F2D91C4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23F2D91CC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ElementContent.Text.CodingKeys()
{
  return &type metadata for ElementContent.Text.CodingKeys;
}

unint64_t sub_23F2D91EC()
{
  unint64_t result;

  result = qword_256E621E0;
  if (!qword_256E621E0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2B74, &type metadata for ElementContent.Text.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E621E0);
  }
  return result;
}

unint64_t sub_23F2D922C()
{
  unint64_t result;

  result = qword_256E621E8;
  if (!qword_256E621E8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2C2C, &type metadata for ElementContent.Command.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E621E8);
  }
  return result;
}

unint64_t sub_23F2D926C()
{
  unint64_t result;

  result = qword_256E621F0;
  if (!qword_256E621F0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2CE4, &type metadata for ElementContent.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E621F0);
  }
  return result;
}

unint64_t sub_23F2D92AC()
{
  unint64_t result;

  result = qword_256E621F8;
  if (!qword_256E621F8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2D9C, &type metadata for ElementContent.CommandCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E621F8);
  }
  return result;
}

unint64_t sub_23F2D92EC()
{
  unint64_t result;

  result = qword_256E62200;
  if (!qword_256E62200)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2E54, &type metadata for ElementContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62200);
  }
  return result;
}

unint64_t sub_23F2D932C()
{
  unint64_t result;

  result = qword_256E62208;
  if (!qword_256E62208)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2D0C, &type metadata for ElementContent.CommandCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62208);
  }
  return result;
}

unint64_t sub_23F2D936C()
{
  unint64_t result;

  result = qword_256E62210;
  if (!qword_256E62210)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2D34, &type metadata for ElementContent.CommandCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62210);
  }
  return result;
}

unint64_t sub_23F2D93AC()
{
  unint64_t result;

  result = qword_256E62218;
  if (!qword_256E62218)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2C54, &type metadata for ElementContent.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62218);
  }
  return result;
}

unint64_t sub_23F2D93EC()
{
  unint64_t result;

  result = qword_256E62220;
  if (!qword_256E62220)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2C7C, &type metadata for ElementContent.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62220);
  }
  return result;
}

unint64_t sub_23F2D942C()
{
  unint64_t result;

  result = qword_256E62228;
  if (!qword_256E62228)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2DC4, &type metadata for ElementContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62228);
  }
  return result;
}

unint64_t sub_23F2D946C()
{
  unint64_t result;

  result = qword_256E62230;
  if (!qword_256E62230)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2DEC, &type metadata for ElementContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62230);
  }
  return result;
}

unint64_t sub_23F2D94AC()
{
  unint64_t result;

  result = qword_256E62238;
  if (!qword_256E62238)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2B9C, &type metadata for ElementContent.Command.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62238);
  }
  return result;
}

unint64_t sub_23F2D94EC()
{
  unint64_t result;

  result = qword_256E62240;
  if (!qword_256E62240)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2BC4, &type metadata for ElementContent.Command.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62240);
  }
  return result;
}

unint64_t sub_23F2D952C()
{
  unint64_t result;

  result = qword_256E62248;
  if (!qword_256E62248)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2AE4, &type metadata for ElementContent.Text.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62248);
  }
  return result;
}

unint64_t sub_23F2D956C()
{
  unint64_t result;

  result = qword_256E62250;
  if (!qword_256E62250)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E2B0C, &type metadata for ElementContent.Text.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62250);
  }
  return result;
}

uint64_t sub_23F2D95A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 104);
  v4 = *(_QWORD *)(a1 + 112);
  v5 = *(_QWORD *)(a1 + 120);
  v6 = *(_QWORD *)(a1 + 128);
  v7 = *(_QWORD *)(a1 + 136);
  v10 = *(_QWORD *)(a1 + 88);
  v8 = *(_BYTE *)(a1 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23F2D9654(v10, v2, v3, v4, v5, v6, v7, v8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23F2D9654(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned __int8 a8)
{
  if (a8 != 255)
    return sub_23F2D7C1C(result, a2, a3, a4, a5, a6, a7, a8 & 1);
  return result;
}

uint64_t sub_23F2D966C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 104);
  v4 = *(_QWORD *)(a1 + 112);
  v5 = *(_QWORD *)(a1 + 120);
  v6 = *(_QWORD *)(a1 + 128);
  v7 = *(_QWORD *)(a1 + 136);
  v10 = *(_QWORD *)(a1 + 88);
  v8 = *(_BYTE *)(a1 + 144);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23F2D9718(v10, v2, v3, v4, v5, v6, v7, v8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23F2D9718(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned __int8 a8)
{
  if (a8 != 255)
    return sub_23F2D7D00(result, a2, a3, a4, a5, a6, a7, a8 & 1);
  return result;
}

uint64_t sub_23F2D9730()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  void (*v4)(uint64_t);

  v1 = sub_23F2D9874();
  v2(v1);
  v3 = sub_23F2D57E8();
  v4(v3);
  return v0;
}

uint64_t sub_23F2D9768(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23F2D97A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_23F2D97B8@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_23F2D97E8()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_23F2D97F0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2D9810()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 160) + 8))(v0, v1);
}

uint64_t sub_23F2D9824@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_23F2D982C()
{
  return sub_23F2DFC08();
}

void *sub_23F2D9864(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xAAuLL);
}

uint64_t sub_23F2D986C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  return sub_23F2D7C70((uint64_t)&a30);
}

uint64_t sub_23F2D9874()
{
  return 0;
}

uint64_t sub_23F2D9884()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2D989C()
{
  return sub_23F2DFADC();
}

uint64_t sub_23F2D98C4()
{
  return sub_23F2DFC14();
}

uint64_t sub_23F2D98D4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2D98E4()
{
  return sub_23F2DFCA4();
}

uint64_t sub_23F2D9904()
{
  return sub_23F2DFB6C();
}

uint64_t UIContextElement.detectedEntities.getter()
{
  return swift_bridgeObjectRetain();
}

void UIContextElement.detectedEntities.setter(uint64_t a1)
{
  _QWORD *v1;

  swift_bridgeObjectRelease();
  *v1 = a1;
  sub_23F2C53A4();
}

uint64_t (*UIContextElement.detectedEntities.modify())()
{
  return nullsub_1;
}

uint64_t UIContextElement.entities.getter()
{
  return swift_bridgeObjectRetain();
}

void UIContextElement.entities.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  sub_23F2C53A4();
}

uint64_t (*UIContextElement.entities.modify())()
{
  return nullsub_1;
}

void UIContextElement.surroundingElements.setter(uint64_t a1)
{
  uint64_t v1;

  sub_23F2DEFD0();
  *(_QWORD *)(v1 + 16) = a1;
  sub_23F2C53A4();
}

uint64_t (*UIContextElement.surroundingElements.modify())()
{
  return nullsub_1;
}

void UIContextElement.uiElement.getter(void *a1@<X8>)
{
  uint64_t v1;
  const void *v3;
  _BYTE v4[152];

  v3 = (const void *)(v1 + 24);
  sub_23F2DEE04(v4, v3);
  sub_23F2DEE04(a1, v3);
  sub_23F2D9A10((uint64_t)v4);
  sub_23F2DEFC4();
}

uint64_t sub_23F2D9A10(uint64_t a1)
{
  sub_23F2D9654(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_BYTE *)(a1 + 120));
  swift_bridgeObjectRetain();
  return a1;
}

void UIContextElement.uiElement.setter(const void *a1)
{
  uint64_t v1;
  void *v3;
  _BYTE v4[152];

  v3 = (void *)(v1 + 24);
  sub_23F2DEE04(v4, v3);
  sub_23F2D9A94((uint64_t)v4);
  sub_23F2DEE04(v3, a1);
  sub_23F2DEFC4();
}

uint64_t sub_23F2D9A94(uint64_t a1)
{
  sub_23F2D9718(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_BYTE *)(a1 + 120));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t (*UIContextElement.uiElement.modify())()
{
  return nullsub_1;
}

void UIContextElement.init(detectedEntities:surroundingElements:uiElement:)(uint64_t (*a1)(uint64_t a1)@<X0>, uint64_t (*a2)(uint64_t a1)@<X1>, const void *a3@<X2>, uint64_t (**a4)(uint64_t a1)@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t (**v26)(uint64_t);
  uint64_t (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[160];

  v9 = type metadata accessor for DetectedEntity(0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = sub_23F2DEE78();
  v28 = type metadata accessor for DetectedEntityDetails(v11);
  v12 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  sub_23F2D983C();
  v15 = v14 - v13;
  sub_23F2DEE04(v30, a3);
  v16 = *((_QWORD *)a1 + 2);
  v17 = MEMORY[0x24BEE4AF8];
  if (v16)
  {
    v26 = a4;
    v27 = a2;
    sub_23F2DEF90();
    sub_23F2DC3EC(0, v16, 0);
    sub_23F2DEF7C();
    v19 = (uint64_t)a1 + v18;
    v20 = *(_QWORD *)(v10 + 72);
    v17 = v29;
    a1 = type metadata accessor for DetectedEntity;
    do
    {
      sub_23F2DEF74(v19, v4);
      sub_23F2DEF74(v4, v15);
      *(_BYTE *)(v15 + *(int *)(v28 + 20)) = 0;
      sub_23F2DC444(v4, type metadata accessor for DetectedEntity);
      if ((sub_23F2DEFBC() & 1) == 0)
      {
        v21 = sub_23F2DEEB8();
        sub_23F2DC3EC(v21, v22, v23);
        v17 = v29;
      }
      v25 = *(_QWORD *)(v17 + 16);
      v24 = *(_QWORD *)(v17 + 24);
      if (v25 >= v24 >> 1)
      {
        sub_23F2DC3EC(v24 > 1, v25 + 1, 1);
        v17 = v29;
      }
      *(_QWORD *)(v17 + 16) = v25 + 1;
      sub_23F2DC47C(v15, v17+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(_QWORD *)(v12 + 72) * v25, type metadata accessor for DetectedEntityDetails);
      v19 += v20;
      --v16;
    }
    while (v16);
    sub_23F2DEF2C();
    a2 = v27;
    a4 = v26;
  }
  sub_23F2DEE04(a4 + 3, v30);
  *a4 = a1;
  a4[1] = (uint64_t (*)(uint64_t))v17;
  a4[2] = a2;
  sub_23F2D5830();
}

void UIContextElement.init(entities:surroundingElements:uiElement:)(uint64_t (*a1)(uint64_t a1)@<X0>, uint64_t a2@<X1>, const void *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  int64_t v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[160];

  v10 = type metadata accessor for DetectedEntityDetails(0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = sub_23F2DEE78();
  v13 = type metadata accessor for DetectedEntity(v12);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  sub_23F2D5954();
  sub_23F2DEE04(v27, a3);
  v15 = *((_QWORD *)a1 + 2);
  v16 = MEMORY[0x24BEE4AF8];
  if (v15)
  {
    v24 = a2;
    sub_23F2DEF90();
    sub_23F2DC418(0, v15, 0);
    sub_23F2DEF7C();
    v18 = (uint64_t)a1 + v17;
    v25 = *(_QWORD *)(v11 + 72);
    v16 = v26;
    a1 = type metadata accessor for DetectedEntity;
    do
    {
      sub_23F2CA8B8(v18, v4, type metadata accessor for DetectedEntityDetails);
      sub_23F2DEF74(v4, v5);
      sub_23F2DC444(v4, type metadata accessor for DetectedEntityDetails);
      if ((sub_23F2DEFBC() & 1) == 0)
      {
        v19 = sub_23F2DEEB8();
        sub_23F2DC418(v19, v20, v21);
        v16 = v26;
      }
      v23 = *(_QWORD *)(v16 + 16);
      v22 = *(_QWORD *)(v16 + 24);
      if (v23 >= v22 >> 1)
      {
        sub_23F2DC418(v22 > 1, v23 + 1, 1);
        v16 = v26;
      }
      *(_QWORD *)(v16 + 16) = v23 + 1;
      sub_23F2DC47C(v5, v16+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(_QWORD *)(v14 + 72) * v23, type metadata accessor for DetectedEntity);
      v18 += v25;
      --v15;
    }
    while (v15);
    sub_23F2DEF2C();
    a2 = v24;
  }
  sub_23F2DEE04(a4 + 3, v27);
  *a4 = v16;
  a4[1] = a1;
  a4[2] = a2;
  sub_23F2D5830();
}

#error "23F2D9E94: call analysis failed (funcsize=34)"

uint64_t static UIElement.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  uint64_t v6;
  int v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t result;
  char v21;
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
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v43;
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
  char v59;
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
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
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
  _QWORD v96[7];
  char v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char v113;
  CGRect v114;
  CGRect v115;

  v2 = *(double *)(a1 + 32);
  v3 = *(double *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v89 = *(_QWORD *)(a1 + 64);
  v91 = *(_QWORD *)(a1 + 72);
  v92 = *(_QWORD *)(a1 + 80);
  v93 = *(_QWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 112);
  v94 = *(_QWORD *)(a1 + 96);
  v95 = *(_QWORD *)(a1 + 104);
  v7 = *(unsigned __int8 *)(a1 + 120);
  v81 = *(_QWORD *)(a1 + 128);
  v87 = *(_QWORD *)(a1 + 136);
  HIDWORD(v83) = *(unsigned __int8 *)(a1 + 144);
  HIDWORD(v77) = *(unsigned __int8 *)(a1 + 145);
  v8 = *(double *)(a2 + 32);
  v9 = *(double *)(a2 + 40);
  v10 = *(double *)(a2 + 48);
  v11 = *(double *)(a2 + 56);
  v13 = *(_QWORD *)(a2 + 64);
  v12 = *(_QWORD *)(a2 + 72);
  v15 = *(_QWORD *)(a2 + 80);
  v14 = *(_QWORD *)(a2 + 88);
  v17 = *(_QWORD *)(a2 + 96);
  v16 = *(_QWORD *)(a2 + 104);
  v18 = *(_QWORD *)(a2 + 112);
  v19 = *(unsigned __int8 *)(a2 + 120);
  v79 = *(_QWORD *)(a2 + 128);
  v85 = *(_QWORD *)(a2 + 136);
  LODWORD(v83) = *(unsigned __int8 *)(a2 + 144);
  LODWORD(v77) = *(unsigned __int8 *)(a2 + 145);
  result = CGRectEqualToRect(*(CGRect *)a1, *(CGRect *)a2);
  if ((_DWORD)result)
  {
    v114.origin.x = v2;
    v114.origin.y = v3;
    v114.size.width = v4;
    v114.size.height = v5;
    v115.origin.x = v8;
    v115.origin.y = v9;
    v115.size.width = v10;
    v115.size.height = v11;
    result = CGRectEqualToRect(v114, v115);
    if ((_DWORD)result)
    {
      v21 = v7;
      if (v7 == 255)
      {
        if (v19 == 255)
        {
LABEL_8:
          if (!v87)
          {
            result = 0;
            if (v85)
              return result;
LABEL_21:
            if (((HIDWORD(v83) ^ v83) & 1) != 0)
              return result;
            return HIDWORD(v77) ^ v77 ^ 1;
          }
          if (v85)
          {
            if (v81 != v79 || v87 != v85)
            {
              v43 = sub_23F2DFC5C();
              result = 0;
              if ((v43 & 1) == 0)
                return result;
              goto LABEL_21;
            }
            if (HIDWORD(v83) == (_DWORD)v83)
              return HIDWORD(v77) ^ v77 ^ 1;
          }
          return 0;
        }
      }
      else
      {
        v98 = v89;
        v99 = v91;
        v100 = v92;
        v101 = v93;
        v102 = v94;
        v103 = v95;
        v104 = v6;
        v105 = v7;
        if (v19 != 255)
        {
          v96[0] = v13;
          v96[1] = v12;
          v96[2] = v15;
          v96[3] = v14;
          v96[4] = v17;
          v96[5] = v16;
          v96[6] = v18;
          v97 = v19 & 1;
          sub_23F2D7C1C(v89, v91, v92, v93, v94, v95, v6, v7 & 1);
          v22 = sub_23F2DEE18();
          sub_23F2D7C1C(v22, v23, v24, v25, v26, v27, v28, v7 & 1);
          v34 = static ElementContent.== infix(_:_:)((uint64_t)&v98, (uint64_t)v96, v29, v30, v31, v32, v33);
          sub_23F2D7D00(v98, v99, v100, v101, v102, v103, v104, v105);
          v35 = sub_23F2DEE18();
          sub_23F2D9718(v35, v36, v37, v38, v39, v40, v41, v7);
          if ((v34 & 1) == 0)
            return 0;
          goto LABEL_8;
        }
        LODWORD(v87) = v7 & 1;
        v44 = sub_23F2D7C1C(v89, v91, v92, v93, v94, v95, v6, v7 & 1);
        v52 = sub_23F2DEEE0(v44, v45, v46, v47, v48, v49, v50, v51, v6, v77, v79, v81, v83, v85, v87, v89);
        v60 = sub_23F2D7C1C(v52, v53, v54, v55, v56, v57, v58, v59);
        v68 = sub_23F2DEEE0(v60, v61, v62, v63, v64, v65, v66, v67, v76, v78, v80, v82, v84, v86, v88, v90);
        sub_23F2D7D00(v68, v69, v70, v71, v72, v73, v74, v75);
        v21 = v7;
      }
      v98 = v89;
      v99 = v91;
      v100 = v92;
      v101 = v93;
      v102 = v94;
      v103 = v95;
      v104 = v6;
      v105 = v21;
      v106 = v13;
      v107 = v12;
      v108 = v15;
      v109 = v14;
      v110 = v17;
      v111 = v16;
      v112 = v18;
      v113 = v19;
      sub_23F2D9654(v13, v12, v15, v14, v17, v16, v18, v19);
      sub_23F2DC4A8((uint64_t)&v98);
      return 0;
    }
  }
  return result;
}

uint64_t sub_23F2DA224(uint64_t a1, uint64_t a2)
{
  BOOL v5;
  char v7;

  if (a1 == 0xD000000000000010 && a2 == 0x800000023F2E3B80 || (sub_23F2DFC5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v5 = a1 == 0x7365697469746E65 && a2 == 0xE800000000000000;
    if (v5 || (sub_23F2DFC5C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000013 && a2 == 0x800000023F2E3BA0 || (sub_23F2DFC5C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x6E656D656C456975 && a2 == 0xE900000000000074)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      v7 = sub_23F2DFC5C();
      swift_bridgeObjectRelease();
      if ((v7 & 1) != 0)
        return 3;
      else
        return 4;
    }
  }
}

uint64_t sub_23F2DA3D8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23F2DA410 + 4 * byte_23F2E3010[a1]))(0xD000000000000010, 0x800000023F2E3B80);
}

uint64_t sub_23F2DA410()
{
  return 0x7365697469746E65;
}

uint64_t sub_23F2DA428(uint64_t a1)
{
  return a1 + 3;
}

uint64_t sub_23F2DA440()
{
  return 0x6E656D656C456975;
}

void sub_23F2DA45C()
{
  sub_23F2DAEA4();
}

uint64_t sub_23F2DA478()
{
  unsigned __int8 *v0;

  return sub_23F2DA3D8(*v0);
}

uint64_t sub_23F2DA480@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2DA224(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F2DA4A4()
{
  sub_23F2DC538();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2DA4CC()
{
  sub_23F2DC538();
  return sub_23F2DFCC8();
}

void UIContextElement.encode(to:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[20];
  char v9;

  v3 = sub_23F2C3FA0(&qword_256E62258);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  sub_23F2D596C();
  v5 = *v0;
  v6 = v0[2];
  v7 = v0[1];
  sub_23F2DEEF8();
  sub_23F2DC538();
  sub_23F2D5944();
  v8[0] = v5;
  v9 = 0;
  sub_23F2C3FA0(&qword_256E62268);
  sub_23F2DC610((uint64_t)&unk_256E62270);
  sub_23F2DEDC4();
  if (!v1)
  {
    v8[0] = v7;
    v9 = 1;
    sub_23F2C3FA0(&qword_256E62278);
    sub_23F2DC668((uint64_t)&unk_256E62280);
    sub_23F2DEDC4();
    v8[0] = v6;
    v9 = 2;
    sub_23F2DEF14();
    sub_23F2DEF3C((uint64_t)&qword_256E619E0);
    sub_23F2DEE0C();
    sub_23F2DEE04(v8, v0 + 3);
    v9 = 3;
    sub_23F2DC5D4();
    sub_23F2DEE0C();
  }
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  sub_23F2C4890();
}

void UIContextElement.init(from:)(_QWORD *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[22];
  _QWORD v17[3];
  uint64_t v18;
  _BYTE v19[152];
  _BYTE v20[176];

  v15 = sub_23F2C3FA0(&qword_256E62298);
  MEMORY[0x24BDAC7A8](v15);
  sub_23F2D983C();
  sub_23F2C3FE0(a1, a1[3]);
  sub_23F2DC538();
  sub_23F2DFCA4();
  if (v2)
  {
    sub_23F2C4254((uint64_t)a1);
  }
  else
  {
    v13 = a2;
    v14 = (uint64_t)a1;
    sub_23F2C3FA0(&qword_256E62268);
    LOBYTE(v16[0]) = 0;
    sub_23F2DC610((uint64_t)&unk_256E622A0);
    sub_23F2DEE6C();
    v5 = v17[0];
    sub_23F2C3FA0(&qword_256E62278);
    LOBYTE(v16[0]) = 1;
    sub_23F2DC668((uint64_t)&unk_256E622A8);
    v7 = v6;
    swift_bridgeObjectRetain();
    sub_23F2DEE6C();
    v8 = v7;
    if (v7)
    {
      sub_23F2D59F4();
      sub_23F2D59E4();
      v9 = 0;
    }
    else
    {
      v10 = v17[0];
      sub_23F2DEF14();
      LOBYTE(v16[0]) = 2;
      sub_23F2DEF3C((uint64_t)&qword_254344BA8);
      swift_bridgeObjectRetain();
      sub_23F2DFBF0();
      v20[175] = 3;
      v11 = sub_23F2D6694();
      v12 = v17[0];
      swift_bridgeObjectRetain();
      sub_23F2DEE6C();
      if (!v11)
      {
        sub_23F2D59F4();
        sub_23F2DEE04(&v16[3], v19);
        sub_23F2DEE04(v20, v19);
        v16[0] = v5;
        v16[1] = v10;
        v16[2] = v12;
        sub_23F2D95A8((uint64_t)v16);
        sub_23F2D59E4();
        sub_23F2D59EC();
        swift_bridgeObjectRelease();
        memcpy(v13, v16, 0xAAuLL);
        sub_23F2C4254(v14);
        v17[0] = v5;
        v17[1] = v10;
        v17[2] = v12;
        sub_23F2DEE04(&v18, v20);
        sub_23F2D966C((uint64_t)v17);
        goto LABEL_4;
      }
      sub_23F2D59F4();
      sub_23F2D59E4();
      sub_23F2D59EC();
      swift_bridgeObjectRelease();
      v9 = 1;
    }
    sub_23F2C4254(v14);
    sub_23F2D59E4();
    if (!v8)
      sub_23F2D59EC();
    if (v9)
      swift_bridgeObjectRelease();
  }
LABEL_4:
  sub_23F2C4890();
}

void sub_23F2DAA00(_QWORD *a1@<X0>, void *a2@<X8>)
{
  UIContextElement.init(from:)(a1, a2);
}

void sub_23F2DAA14()
{
  UIContextElement.encode(to:)();
}

double UIElement.frame.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void UIElement.frame.setter(double a1, double a2, double a3, double a4)
{
  double *v4;

  *v4 = a1;
  v4[1] = a2;
  v4[2] = a3;
  v4[3] = a4;
}

uint64_t (*UIElement.frame.modify())()
{
  return nullsub_1;
}

double UIElement.screenSize.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

void UIElement.screenSize.setter(double a1, double a2, double a3, double a4)
{
  double *v4;

  v4[4] = a1;
  v4[5] = a2;
  v4[6] = a3;
  v4[7] = a4;
}

uint64_t (*UIElement.screenSize.modify())()
{
  return nullsub_1;
}

uint64_t UIElement.content.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;

  v2 = *(_QWORD *)(v1 + 64);
  v3 = *(_QWORD *)(v1 + 72);
  v4 = *(_QWORD *)(v1 + 80);
  v5 = *(_QWORD *)(v1 + 88);
  v6 = *(_QWORD *)(v1 + 96);
  v7 = *(_QWORD *)(v1 + 104);
  v8 = *(_QWORD *)(v1 + 112);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  v9 = *(_BYTE *)(v1 + 120);
  *(_BYTE *)(a1 + 56) = v9;
  return sub_23F2D9654(v2, v3, v4, v5, v6, v7, v8, v9);
}

__n128 UIElement.content.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  __n128 result;
  __n128 v5;
  __int128 v6;
  __int128 v7;

  v6 = a1[1];
  v7 = *a1;
  v5 = (__n128)a1[2];
  v2 = *((_QWORD *)a1 + 6);
  v3 = *((_BYTE *)a1 + 56);
  sub_23F2D9718(*(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 112), *(_BYTE *)(v1 + 120));
  *(_OWORD *)(v1 + 64) = v7;
  *(_OWORD *)(v1 + 80) = v6;
  result = v5;
  *(__n128 *)(v1 + 96) = v5;
  *(_QWORD *)(v1 + 112) = v2;
  *(_BYTE *)(v1 + 120) = v3;
  return result;
}

uint64_t (*UIElement.content.modify())()
{
  return nullsub_1;
}

uint64_t UIElement.appBundleId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 128);
  swift_bridgeObjectRetain();
  return v1;
}

void UIElement.appBundleId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = a2;
  sub_23F2D5750();
}

uint64_t (*UIElement.appBundleId.modify())()
{
  return nullsub_1;
}

uint64_t UIElement.isSelected.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 144);
}

uint64_t UIElement.isSelected.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 144) = result;
  return result;
}

uint64_t (*UIElement.isSelected.modify())()
{
  return nullsub_1;
}

uint64_t UIElement.isPrimary.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 145);
}

uint64_t UIElement.isPrimary.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 145) = result;
  return result;
}

uint64_t (*UIElement.isPrimary.modify())()
{
  return nullsub_1;
}

void UIElement.init(frame:screenSize:content:appBundleId:isSelected:isPrimary:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>, double a11@<D6>, double a12@<D7>)
{
  char v12;
  uint64_t v13;
  char v14;

  sub_23F2DED8C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
  *(_BYTE *)(v13 + 144) = v12;
  *(_BYTE *)(v13 + 145) = v14;
}

void UIElement.init(frame:screenSize:content:appBundleId:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>, double a11@<D6>, double a12@<D7>)
{
  uint64_t v12;

  sub_23F2DED8C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
  *(_WORD *)(v12 + 144) = 0;
}

uint64_t sub_23F2DAC04(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v11;

  v2 = a1 == 0x656D617266 && a2 == 0xE500000000000000;
  if (v2 || (sub_23F2DFC5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x69536E6565726373 && a2 == 0xEA0000000000657ALL;
    if (v6 || (sub_23F2DFC5C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x746E65746E6F63 && a2 == 0xE700000000000000;
      if (v7 || (sub_23F2DFC5C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x6C646E7542707061 && a2 == 0xEB00000000644965;
        if (v8 || (sub_23F2DFC5C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x7463656C65537369 && a2 == 0xEA00000000006465;
          if (v9 || (sub_23F2DFC5C() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x72616D6972507369 && a2 == 0xE900000000000079)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            v11 = sub_23F2DFC5C();
            swift_bridgeObjectRelease();
            if ((v11 & 1) != 0)
              return 5;
            else
              return 6;
          }
        }
      }
    }
  }
}

uint64_t sub_23F2DAE9C()
{
  return 6;
}

void sub_23F2DAEA4()
{
  sub_23F2DFC74();
  sub_23F2DFC80();
  sub_23F2DFC98();
  sub_23F2D578C();
}

uint64_t sub_23F2DAEE0(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23F2DAF10 + 4 * byte_23F2E3014[a1]))(0x656D617266, 0xE500000000000000);
}

uint64_t sub_23F2DAF10()
{
  return 0x69536E6565726373;
}

uint64_t sub_23F2DAF30()
{
  return 0x746E65746E6F63;
}

uint64_t sub_23F2DAF48()
{
  return 0x6C646E7542707061;
}

uint64_t sub_23F2DAF68()
{
  return 0x7463656C65537369;
}

uint64_t sub_23F2DAF84()
{
  return 0x72616D6972507369;
}

void sub_23F2DAFA0()
{
  sub_23F2DFC74();
  sub_23F2DFC80();
  sub_23F2DFC98();
  sub_23F2D578C();
}

uint64_t sub_23F2DAFD8()
{
  unsigned __int8 *v0;

  return sub_23F2DAEE0(*v0);
}

uint64_t sub_23F2DAFE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2DAC04(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F2DB004@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23F2DAE9C();
  *a1 = result;
  return result;
}

uint64_t sub_23F2DB028()
{
  sub_23F2DC6C0();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2DB050()
{
  sub_23F2DC6C0();
  return sub_23F2DFCC8();
}

uint64_t UIElement.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = sub_23F2C3FA0(&qword_256E622B8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  sub_23F2D596C();
  sub_23F2C3FE0(a1, a1[3]);
  sub_23F2DC6C0();
  sub_23F2DFCB0();
  type metadata accessor for CGRect(0);
  sub_23F2DC738((uint64_t)&unk_256E622C8);
  sub_23F2DEDE4();
  if (!v1)
  {
    sub_23F2DEDE4();
    sub_23F2DC6FC();
    sub_23F2DFC20();
    sub_23F2DFC14();
    sub_23F2DEED0();
    sub_23F2DEED0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

uint64_t UIElement.init(from:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int8 v36;
  char v37;
  uint64_t v38;
  char v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[15];
  char v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
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
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  _BYTE v68[7];
  uint64_t v69;
  uint64_t v70;
  char v71;
  char v72;
  char v73;
  _DWORD v74[3];
  uint64_t v75;

  v5 = sub_23F2C3FA0(&qword_256E622D8);
  MEMORY[0x24BDAC7A8](v5);
  sub_23F2D5954();
  v45 = a1;
  sub_23F2DEEF8();
  sub_23F2DC6C0();
  sub_23F2DFCA4();
  if (v2)
  {
    v75 = v2;
    sub_23F2C4254(a1);
    sub_23F2D9718(0, 0, 0, 0, 0, 0, 0, 0xFFu);
    return swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for CGRect(0);
    sub_23F2DC738((uint64_t)&unk_256E622E0);
    sub_23F2DEE38();
    sub_23F2DFBF0();
    v6 = v52;
    v7 = v53;
    v8 = v54;
    v9 = v55;
    sub_23F2DEE38();
    sub_23F2DFBF0();
    v10 = v52;
    v11 = v53;
    v12 = v54;
    v13 = v55;
    sub_23F2DC770();
    sub_23F2DFBCC();
    v40 = a2;
    v15 = v57;
    v16 = v58;
    v43 = v52;
    v44 = v53;
    v41 = v55;
    v42 = v54;
    sub_23F2DEF44();
    sub_23F2D9654(v17, v18, v19, v20, v21, v22, v23, v24);
    v38 = sub_23F2DFBC0();
    v39 = v59;
    v25 = v56;
    LOBYTE(v52) = 4;
    v27 = v26;
    swift_bridgeObjectRetain();
    v37 = sub_23F2DEF68();
    v73 = 5;
    v75 = 0;
    v28 = sub_23F2DEF68();
    v37 &= 1u;
    sub_23F2DED7C();
    v46[0] = v6;
    v46[1] = v53;
    v46[2] = v54;
    v46[3] = v55;
    v46[4] = v10;
    v46[5] = v53;
    v46[6] = v54;
    v46[7] = v55;
    v46[8] = v43;
    v46[9] = v53;
    v46[10] = v54;
    v46[11] = v55;
    v46[12] = v56;
    v46[13] = v57;
    v46[14] = v58;
    v47 = v59;
    v48 = v38;
    v49 = v27;
    v50 = v37;
    v51 = v28 & 1;
    sub_23F2D9A10((uint64_t)v46);
    swift_bridgeObjectRelease();
    sub_23F2DEF44();
    sub_23F2D9718(v29, v30, v31, v32, v33, v34, v35, v36);
    sub_23F2DEE04(v40, v46);
    sub_23F2C4254(v45);
    v52 = v6;
    v53 = v7;
    v54 = v8;
    v55 = v9;
    v56 = v10;
    v57 = v11;
    v58 = v12;
    v59 = v13;
    v60 = v43;
    v61 = v44;
    v62 = v42;
    v63 = v41;
    v64 = v25;
    v65 = v15;
    v66 = v16;
    v67 = v39;
    *(_DWORD *)v68 = v74[0];
    *(_DWORD *)&v68[3] = *(_DWORD *)((char *)v74 + 3);
    v69 = v38;
    v70 = v27;
    v71 = v37;
    v72 = v28 & 1;
    return sub_23F2D9A94((uint64_t)&v52);
  }
}

uint64_t sub_23F2DB708@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return UIElement.init(from:)(a1, a2);
}

uint64_t sub_23F2DB71C(_QWORD *a1)
{
  return UIElement.encode(to:)(a1);
}

void UIContextOptions.__allocating_init(detectableTypes:)(uint64_t a1)
{
  sub_23F2DEF1C();
  *(_QWORD *)(swift_allocObject() + 16) = a1;
  sub_23F2C53A4();
}

uint64_t UIContextOptions.init(detectableTypes:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t sub_23F2DB768(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6261746365746564 && a2 == 0xEF7365707954656CLL)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23F2DFC5C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23F2DB810()
{
  sub_23F2DFC74();
  sub_23F2DFC80();
  return sub_23F2DFC98();
}

uint64_t sub_23F2DB850()
{
  return 0x6261746365746564;
}

uint64_t sub_23F2DB878()
{
  sub_23F2DFC74();
  sub_23F2DFC80();
  return sub_23F2DFC98();
}

uint64_t sub_23F2DB8B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2DB768(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23F2DB8E0()
{
  sub_23F2DC7AC();
  return sub_23F2DFCBC();
}

uint64_t sub_23F2DB908()
{
  sub_23F2DC7AC();
  return sub_23F2DFCC8();
}

uint64_t UIContextOptions.deinit()
{
  uint64_t v0;

  sub_23F2DEFD0();
  return v0;
}

uint64_t UIContextOptions.__deallocating_deinit()
{
  sub_23F2DEFD0();
  sub_23F2DEF1C();
  return swift_deallocClassInstance();
}

uint64_t UIContextOptions.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  _QWORD v6[2];

  v1 = sub_23F2C3FA0(&qword_254344BB8);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F2DEEF8();
  sub_23F2DC7AC();
  sub_23F2D5944();
  v6[1] = *(_QWORD *)(v0 + 16);
  sub_23F2DEF14();
  sub_23F2DEF3C((uint64_t)&unk_254344BB0);
  sub_23F2DFC44();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t UIContextOptions.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  sub_23F2DEF1C();
  v2 = swift_allocObject();
  UIContextOptions.init(from:)(a1);
  return v2;
}

uint64_t UIContextOptions.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v4 = sub_23F2C3FA0(&qword_254344E30);
  v9 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  sub_23F2D983C();
  v7 = v6 - v5;
  sub_23F2C3FE0(a1, a1[3]);
  sub_23F2DC7AC();
  sub_23F2DFCA4();
  if (v2)
  {
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_23F2DEF14();
    sub_23F2DEF3C((uint64_t)&unk_254344E28);
    sub_23F2DFBF0();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v4);
    *(_QWORD *)(v1 + 16) = v10;
  }
  sub_23F2C4254((uint64_t)a1);
  return v1;
}

uint64_t sub_23F2DBC10@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = UIContextOptions.__allocating_init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_23F2DBC38()
{
  return UIContextOptions.encode(to:)();
}

void Array<A>.loggingDescription.getter(uint64_t a1)
{
  int64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char EnumCaseMultiPayload;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  int64_t v22;
  int isUniquelyReferenced_nonNull_native;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  int64_t v32;
  int v33;
  int v34;
  char v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  int64_t v43;
  uint64_t v44;
  char v45;
  _QWORD *v46;
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
  _QWORD *v57;
  char v58;
  _QWORD *v59;
  _QWORD __dst[22];

  v57 = (_QWORD *)type metadata accessor for DetectedEntity(0);
  v51 = *(v57 - 1);
  v3 = MEMORY[0x24BDAC7A8](v57);
  v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v49 - v6;
  v8 = *(_QWORD *)(a1 + 16);
  v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v53 = v8;
  v50 = a1;
  if (v8)
  {
    swift_bridgeObjectRetain();
    v52 = a1 + 32;
    memcpy(__dst, (const void *)(a1 + 32), 0xAAuLL);
    v10 = 1;
    v11 = (uint64_t)v9;
    while (1)
    {
      v56 = v10;
      v12 = __dst[0];
      v13 = *(_QWORD *)(__dst[0] + 16);
      if (v13)
      {
        v55 = v11;
        sub_23F2D95A8((uint64_t)__dst);
        v59 = v9;
        swift_bridgeObjectRetain();
        sub_23F2DC87C(0, v13, 0);
        v14 = (*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80);
        v54 = v12;
        v15 = v12 + v14;
        v16 = *(_QWORD *)(v51 + 72);
        do
        {
          sub_23F2CA8B8(v15, (uint64_t)v7, type metadata accessor for DetectedEntity);
          sub_23F2CA8B8((uint64_t)v7, (uint64_t)v5, type metadata accessor for DetectedEntity);
          EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
          sub_23F2DC444((uint64_t)v5, type metadata accessor for DetectedEntity);
          sub_23F2DC444((uint64_t)v7, type metadata accessor for DetectedEntity);
          v18 = v59;
          if ((sub_23F2DEFBC() & 1) == 0)
          {
            sub_23F2DC87C(0, v18[2] + 1, 1);
            v18 = v59;
          }
          v20 = v18[2];
          v19 = v18[3];
          if (v20 >= v19 >> 1)
          {
            sub_23F2DC87C((char *)(v19 > 1), v20 + 1, 1);
            v18 = v59;
          }
          v18[2] = v20 + 1;
          *((_BYTE *)v18 + v20 + 32) = EnumCaseMultiPayload;
          v15 += v16;
          --v13;
        }
        while (v13);
        swift_bridgeObjectRelease();
        sub_23F2D966C((uint64_t)__dst);
        v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
        v11 = v55;
      }
      else
      {
        v18 = v9;
      }
      v21 = v18[2];
      v1 = *(_QWORD *)(v11 + 16);
      v22 = v1 + v21;
      if (__OFADD__(v1, v21))
        break;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v22 > *(_QWORD *)(v11 + 24) >> 1)
      {
        if (v1 <= v22)
          v24 = v1 + v21;
        else
          v24 = v1;
        sub_23F2CF950(isUniquelyReferenced_nonNull_native, v24, 1, v11);
        v11 = v25;
      }
      v8 = v53;
      if (v18[2])
      {
        v26 = *(_QWORD *)(v11 + 16);
        if ((*(_QWORD *)(v11 + 24) >> 1) - v26 < v21)
          goto LABEL_51;
        memcpy((void *)(v11 + v26 + 32), v18 + 4, v21);
        if (v21)
        {
          v27 = *(_QWORD *)(v11 + 16);
          v28 = __OFADD__(v27, v21);
          v29 = v27 + v21;
          if (v28)
            goto LABEL_52;
          *(_QWORD *)(v11 + 16) = v29;
        }
      }
      else if (v21)
      {
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      if (v56 == v8)
      {
        swift_bridgeObjectRelease();
        goto LABEL_29;
      }
      memcpy(__dst, (const void *)(v52 + 176 * v56), 0xAAuLL);
      v10 = v56 + 1;
    }
    __break(1u);
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  v11 = MEMORY[0x24BEE4AF8];
LABEL_29:
  v30 = sub_23F2DC27C(v11);
  v31 = *(_QWORD *)(v30 + 16);
  if (v31)
  {
    v59 = v9;
    v56 = v30;
    sub_23F2DC860(0, v31, 0);
    sub_23F2DEFA8();
    v32 = sub_23F2DDCC8((uint64_t)&v59);
    v34 = v33;
    v57 = &__dst[6];
    v36 = v35 & 1;
    while ((v32 & 0x8000000000000000) == 0 && v32 < 1 << SLOBYTE(__dst[3]))
    {
      if (((*(_QWORD *)((char *)v57 + (((unint64_t)v32 >> 3) & 0xFFFFFFFFFFFFF8)) >> v32) & 1) == 0)
        goto LABEL_48;
      if (HIDWORD(__dst[3]) != v34)
        goto LABEL_49;
      v37 = *(_BYTE *)(__dst[5] + v32);
      __dst[0] = 0;
      __dst[1] = 0xE000000000000000;
      v58 = v37;
      sub_23F2DFB90();
      v38 = __dst[0];
      v39 = __dst[1];
      v59 = (_QWORD *)v1;
      v41 = *(_QWORD *)(v1 + 16);
      v40 = *(_QWORD *)(v1 + 24);
      if (v41 >= v40 >> 1)
      {
        sub_23F2DC860((char *)(v40 > 1), v41 + 1, 1);
        sub_23F2DEFA8();
      }
      *(_QWORD *)(v1 + 16) = v41 + 1;
      v42 = v1 + 16 * v41;
      *(_QWORD *)(v42 + 32) = v38;
      *(_QWORD *)(v42 + 40) = v39;
      v43 = sub_23F2DDBE4(v32, v34, v36 & 1, (uint64_t)&v59);
      v32 = v43;
      v34 = v44;
      v36 = v45 & 1;
      if (!--v31)
      {
        sub_23F2DDD48(v43, v44, v45 & 1);
        swift_bridgeObjectRelease();
        v8 = v53;
        goto LABEL_40;
      }
    }
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  swift_bridgeObjectRelease();
  v1 = MEMORY[0x24BEE4AF8];
LABEL_40:
  __dst[0] = v1;
  sub_23F2C3FA0(&qword_254344E18);
  sub_23F2DDD54();
  sub_23F2DFA94();
  swift_bridgeObjectRelease();
  v46 = 0;
  if (!v8)
  {
LABEL_44:
    __dst[0] = 0;
    __dst[1] = 0xE000000000000000;
    sub_23F2DFB6C();
    swift_bridgeObjectRelease();
    __dst[0] = 0x6465746365746564;
    __dst[1] = 0xE900000000000020;
    v59 = v46;
    sub_23F2DFC50();
    sub_23F2DFADC();
    swift_bridgeObjectRelease();
    sub_23F2DFADC();
    sub_23F2DFADC();
    swift_bridgeObjectRelease();
    sub_23F2DFADC();
    return;
  }
  v47 = v50 + 32;
  while (1)
  {
    v48 = *(_QWORD *)(*(_QWORD *)v47 + 16);
    v28 = __OFADD__(v46, v48);
    v46 = (_QWORD *)((char *)v46 + v48);
    if (v28)
      break;
    v47 += 176;
    if (!--v8)
      goto LABEL_44;
  }
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
}

uint64_t sub_23F2DC27C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;

  sub_23F2DED3C();
  v2 = sub_23F2DFB24();
  v9 = v2;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      v5 = a1 + i;
      sub_23F2DCBD0(&v8, *(unsigned __int8 *)(v5 + 32));
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    v6 = v2;
    swift_bridgeObjectRelease();
  }
  return v6;
}

char *sub_23F2DC314(char *__src, uint64_t a2, char *__dst)
{
  if (__dst != __src || &__src[16 * a2] <= __dst)
    return (char *)memmove(__dst, __src, 16 * a2);
  return __src;
}

void sub_23F2DC340(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD))
{
  if (a3 < a1 || a1 + *(_QWORD *)(*(_QWORD *)(((uint64_t (*)(_QWORD))a4)(0) - 8) + 72) * a2 <= a3)
  {
    a4(0);
    sub_23F2DEF54();
    swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 == a1)
  {
    sub_23F2D5750();
  }
  else
  {
    sub_23F2DEF54();
    swift_arrayInitWithTakeBackToFront();
  }
}

char *sub_23F2DC3C4(char *__src, size_t __len, char *__dst)
{
  if (__dst != __src || &__src[__len] <= __dst)
    return (char *)memmove(__dst, __src, __len);
  return __src;
}

size_t sub_23F2DC3EC(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_23F2DC898(a1, a2, a3, *v3, &qword_256E62338, (void (*)(_QWORD))type metadata accessor for DetectedEntityDetails);
  *v3 = result;
  return result;
}

size_t sub_23F2DC418(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_23F2DC898(a1, a2, a3, *v3, &qword_256E62330, (void (*)(_QWORD))type metadata accessor for DetectedEntity);
  *v3 = result;
  return result;
}

void sub_23F2DC444(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  sub_23F2C53A4();
}

void sub_23F2DC47C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = sub_23F2D6018(a1, a2, a3);
  sub_23F2D5B7C(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  sub_23F2C53A4();
}

uint64_t sub_23F2DC4A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 96);
  v7 = *(_QWORD *)(a1 + 104);
  v8 = *(_QWORD *)(a1 + 112);
  v9 = *(_BYTE *)(a1 + 120);
  sub_23F2D9718(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
  sub_23F2D9718(v2, v3, v4, v5, v6, v7, v8, v9);
  return a1;
}

unint64_t sub_23F2DC538()
{
  unint64_t result;

  result = qword_256E62260;
  if (!qword_256E62260)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E34EC, &type metadata for UIContextElement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62260);
  }
  return result;
}

unint64_t sub_23F2DC574(uint64_t a1)
{
  unint64_t *v1;
  unint64_t result;
  uint64_t *v3;
  uint64_t (*v4)(void);
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  uint64_t v8;
  uint64_t v9;

  result = sub_23F2DEFD8(a1);
  if (!result)
  {
    v6 = v5;
    v7 = v4;
    v8 = sub_23F2C4040(v3);
    v9 = v7();
    result = MEMORY[0x2426678EC](v6, v8, &v9);
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_23F2DC5D4()
{
  unint64_t result;

  result = qword_256E62290;
  if (!qword_256E62290)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for UIElement, &type metadata for UIElement);
    atomic_store(result, (unint64_t *)&qword_256E62290);
  }
  return result;
}

void sub_23F2DC610(uint64_t a1)
{
  if (!sub_23F2DEFD8(a1))
  {
    sub_23F2C4040(&qword_256E62268);
    sub_23F2DEF9C();
    sub_23F2DEE58();
  }
  sub_23F2D5E30();
}

void sub_23F2DC668(uint64_t a1)
{
  if (!sub_23F2DEFD8(a1))
  {
    sub_23F2C4040(&qword_256E62278);
    sub_23F2DEF9C();
    sub_23F2DEE58();
  }
  sub_23F2D5E30();
}

unint64_t sub_23F2DC6C0()
{
  unint64_t result;

  result = qword_256E622C0;
  if (!qword_256E622C0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E349C, &type metadata for UIElement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E622C0);
  }
  return result;
}

unint64_t sub_23F2DC6FC()
{
  unint64_t result;

  result = qword_256E622D0;
  if (!qword_256E622D0)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for ElementContent, &type metadata for ElementContent);
    atomic_store(result, (unint64_t *)&qword_256E622D0);
  }
  return result;
}

void sub_23F2DC738(uint64_t a1)
{
  unint64_t *v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!sub_23F2DEFD8(a1))
  {
    v4 = v3;
    v5 = v2(255);
    atomic_store(MEMORY[0x2426678EC](v4, v5), v1);
  }
  sub_23F2C53A4();
}

unint64_t sub_23F2DC770()
{
  unint64_t result;

  result = qword_256E622E8;
  if (!qword_256E622E8)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for ElementContent, &type metadata for ElementContent);
    atomic_store(result, (unint64_t *)&qword_256E622E8);
  }
  return result;
}

unint64_t sub_23F2DC7AC()
{
  unint64_t result;

  result = qword_254345220;
  if (!qword_254345220)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E344C, &type metadata for UIContextOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254345220);
  }
  return result;
}

unint64_t sub_23F2DC7E8()
{
  unint64_t result;

  result = qword_254344BA0;
  if (!qword_254344BA0)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectableEntityType, &type metadata for DetectableEntityType);
    atomic_store(result, (unint64_t *)&qword_254344BA0);
  }
  return result;
}

unint64_t sub_23F2DC824()
{
  unint64_t result;

  result = qword_254344DF8;
  if (!qword_254344DF8)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectableEntityType, &type metadata for DetectableEntityType);
    atomic_store(result, (unint64_t *)&qword_254344DF8);
  }
  return result;
}

char *sub_23F2DC860(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_23F2DC9EC(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_23F2DC87C(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_23F2DCAE8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

size_t sub_23F2DC898(size_t result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD))
{
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  uint64_t v19;

  v8 = result;
  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return result;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  sub_23F2C3FA0(a5);
  v13 = *(_QWORD *)(((uint64_t (*)(_QWORD))a6)(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  result = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_24;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  v18 = *(unsigned __int8 *)(*(_QWORD *)(((uint64_t (*)(_QWORD))a6)(0) - 8) + 80);
  v19 = (v18 + 32) & ~v18;
  if ((v8 & 1) != 0)
  {
    sub_23F2DC340(a4 + v19, v11, (unint64_t)v16 + v19, a6);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v16;
}

char *sub_23F2DC9EC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    sub_23F2C3FA0(&qword_256E62118);
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
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_23F2DCAE8(char *result, int64_t a2, char a3, char *a4)
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
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    sub_23F2C3FA0(&qword_256E62110);
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
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[v8] <= v12)
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_23F2DCBD0(_BYTE *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  unint64_t v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  _QWORD *v8;
  _QWORD v10[9];

  v4 = *v2;
  sub_23F2DFC74();
  swift_bridgeObjectRetain();
  sub_23F2CF660((uint64_t)v10, a2);
  v5 = sub_23F2DFC98() & ~(-1 << *(_BYTE *)(v4 + 32));
  if (((*(_QWORD *)(v4 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
    __asm { BR              X9 }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10[0] = *v8;
  *v8 = 0x8000000000000000;
  sub_23F2DD2F8(a2, v5, isUniquelyReferenced_nonNull_native);
  *v8 = v10[0];
  swift_bridgeObjectRelease();
  result = 1;
  *a1 = a2;
  return result;
}

uint64_t sub_23F2DCF30()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;

  v1 = v0;
  v2 = *v0;
  sub_23F2C3FA0(&qword_256E62328);
  v3 = sub_23F2DFB60();
  if (!*(_QWORD *)(v2 + 16))
    goto LABEL_25;
  v4 = 1 << *(_BYTE *)(v2 + 32);
  v5 = (_QWORD *)(v2 + 56);
  if (v4 < 64)
    v6 = ~(-1 << v4);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v8 = (unint64_t)(v4 + 63) >> 6;
  swift_retain();
  if (v7)
  {
    v9 = __clz(__rbit64(v7));
    goto LABEL_20;
  }
  if (v8 > 1)
  {
    v10 = *(_QWORD *)(v2 + 64);
    v11 = 1;
    if (v10)
      goto LABEL_19;
    v11 = 2;
    if (v8 > 2)
    {
      v10 = *(_QWORD *)(v2 + 72);
      if (v10)
        goto LABEL_19;
      v11 = 3;
      if (v8 > 3)
      {
        v10 = *(_QWORD *)(v2 + 80);
        if (!v10)
        {
          v12 = 4;
          if (v8 > 4)
          {
            v10 = *(_QWORD *)(v2 + 88);
            if (v10)
            {
              v11 = 4;
              goto LABEL_19;
            }
            while (1)
            {
              v11 = v12 + 1;
              if (__OFADD__(v12, 1))
              {
                __break(1u);
                JUMPOUT(0x23F2DD2D4);
              }
              if (v11 >= v8)
                break;
              v10 = v5[v11];
              ++v12;
              if (v10)
                goto LABEL_19;
            }
          }
          goto LABEL_21;
        }
LABEL_19:
        v9 = __clz(__rbit64(v10)) + (v11 << 6);
LABEL_20:
        v13 = *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + v9);
        sub_23F2DFC74();
        __asm { BR              X8 }
      }
    }
  }
LABEL_21:
  swift_release();
  v1 = v0;
  v14 = 1 << *(_BYTE *)(v2 + 32);
  if (v14 > 63)
    sub_23F2DD6A0(0, (unint64_t)(v14 + 63) >> 6, (_QWORD *)(v2 + 56));
  else
    *v5 = -1 << v14;
  *(_QWORD *)(v2 + 16) = 0;
LABEL_25:
  result = swift_release();
  *v1 = v3;
  return result;
}

uint64_t sub_23F2DD2F8(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  char v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  char v14;
  _BYTE v15[72];

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if ((a3 & 1) != 0)
    {
      sub_23F2DCF30();
    }
    else
    {
      if (v7 > v6)
      {
        result = (uint64_t)sub_23F2DD6BC();
        goto LABEL_10;
      }
      sub_23F2DD850();
    }
    v8 = *v3;
    sub_23F2DFC74();
    sub_23F2CF660((uint64_t)v15, v5);
    result = sub_23F2DFC98();
    a2 = result & ~(-1 << *(_BYTE *)(v8 + 32));
    if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
      __asm { BR              X9 }
  }
LABEL_10:
  v9 = *v13;
  *(_QWORD *)(*v13 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_BYTE *)(*(_QWORD *)(v9 + 48) + a2) = v14;
  v10 = *(_QWORD *)(v9 + 16);
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
  {
    __break(1u);
    JUMPOUT(0x23F2DD63CLL);
  }
  *(_QWORD *)(v9 + 16) = v12;
  return result;
}

uint64_t sub_23F2DD6A0(uint64_t result, uint64_t a2, _QWORD *a3)
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

void *sub_23F2DD6BC()
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
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  sub_23F2C3FA0(&qword_256E62328);
  v2 = *v0;
  v3 = sub_23F2DFB54();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  if (!v12)
    goto LABEL_12;
LABEL_11:
  v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v14 | (v9 << 6); ; i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + i) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + i);
    if (v12)
      goto LABEL_11;
LABEL_12:
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_25:
    v12 = (v17 - 1) & v17;
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23F2DD850()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v1 = v0;
  v2 = *v0;
  sub_23F2C3FA0(&qword_256E62328);
  v3 = sub_23F2DFB60();
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
    goto LABEL_23;
  }
  v4 = 1 << *(_BYTE *)(v2 + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(v2 + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  swift_retain();
  if (v6)
  {
    v8 = __clz(__rbit64(v6));
    goto LABEL_20;
  }
  if (v7 > 1)
  {
    v9 = *(_QWORD *)(v2 + 64);
    v10 = 1;
    if (v9)
      goto LABEL_19;
    v10 = 2;
    if (v7 > 2)
    {
      v9 = *(_QWORD *)(v2 + 72);
      if (v9)
        goto LABEL_19;
      v10 = 3;
      if (v7 > 3)
      {
        v9 = *(_QWORD *)(v2 + 80);
        if (!v9)
        {
          v11 = 4;
          if (v7 > 4)
          {
            v9 = *(_QWORD *)(v2 + 88);
            if (v9)
            {
              v10 = 4;
              goto LABEL_19;
            }
            while (1)
            {
              v10 = v11 + 1;
              if (__OFADD__(v11, 1))
              {
                __break(1u);
                JUMPOUT(0x23F2DDBC0);
              }
              if (v10 >= v7)
                break;
              v9 = *(_QWORD *)(v2 + 56 + 8 * v10);
              ++v11;
              if (v9)
                goto LABEL_19;
            }
          }
          goto LABEL_21;
        }
LABEL_19:
        v8 = __clz(__rbit64(v9)) + (v10 << 6);
LABEL_20:
        v12 = *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + v8);
        sub_23F2DFC74();
        __asm { BR              X8 }
      }
    }
  }
LABEL_21:
  result = swift_release_n();
  v1 = v0;
LABEL_23:
  *v1 = v3;
  return result;
}

int64_t sub_23F2DDBE4(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  if (v5 + 1 < (unint64_t)(result + 63) >> 6)
  {
    v10 = *(_QWORD *)(v6 + 8 * v9);
    if (v10)
      return __clz(__rbit64(v10)) + (v9 << 6);
    v11 = (unint64_t)(result + 63) >> 6;
    v9 = v5 + 2;
    if (v5 + 2 < v11)
    {
      v10 = *(_QWORD *)(v6 + 8 * v9);
      if (v10)
        return __clz(__rbit64(v10)) + (v9 << 6);
      while (v5 + 3 < v11)
      {
        v10 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v10)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v10)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_23F2DDCC8(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

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
  v2 = 64;
  for (i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_23F2DDD48(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_23F2DDD54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254344E20;
  if (!qword_254344E20)
  {
    v1 = sub_23F2C4040(&qword_254344E18);
    result = MEMORY[0x2426678EC](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_254344E20);
  }
  return result;
}

uint64_t destroy for UIContextElement(uint64_t a1)
{
  int v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = *(unsigned __int8 *)(a1 + 144);
  if (v2 != 255)
    sub_23F2D7D00(*(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), v2 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UIContextElement(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  __int128 v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  v5 = *(unsigned __int8 *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v5 == 255)
  {
    v6 = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 104) = v6;
    *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 129) = *(_OWORD *)(a2 + 129);
  }
  else
  {
    v7 = v5 & 1;
    v8 = *(_QWORD *)(a2 + 88);
    v9 = *(_QWORD *)(a2 + 96);
    v10 = *(_QWORD *)(a2 + 104);
    v11 = *(_QWORD *)(a2 + 112);
    v12 = *(_QWORD *)(a2 + 120);
    v13 = *(_QWORD *)(a2 + 128);
    v14 = *(_QWORD *)(a2 + 136);
    sub_23F2D7C1C(v8, v9, v10, v11, v12, v13, v14, v7);
    *(_QWORD *)(a1 + 88) = v8;
    *(_QWORD *)(a1 + 96) = v9;
    *(_QWORD *)(a1 + 104) = v10;
    *(_QWORD *)(a1 + 112) = v11;
    *(_QWORD *)(a1 + 120) = v12;
    *(_QWORD *)(a1 + 128) = v13;
    *(_QWORD *)(a1 + 136) = v14;
    *(_BYTE *)(a1 + 144) = v7;
  }
  v15 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v15;
  *(_WORD *)(a1 + 168) = *(_WORD *)(a2 + 168);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UIContextElement(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  __int128 *v5;
  int v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  v4 = (_OWORD *)(a1 + 88);
  v5 = (__int128 *)(a2 + 88);
  v6 = *(unsigned __int8 *)(a2 + 144);
  if (*(unsigned __int8 *)(a1 + 144) == 255)
  {
    if (v6 == 255)
    {
      v10 = *v5;
      v11 = *(_OWORD *)(a2 + 104);
      v12 = *(_OWORD *)(a2 + 120);
      *(_OWORD *)(a1 + 129) = *(_OWORD *)(a2 + 129);
      *(_OWORD *)(a1 + 104) = v11;
      *(_OWORD *)(a1 + 120) = v12;
      *v4 = v10;
    }
    else
    {
      v29 = v6 & 1;
      v30 = *(_QWORD *)(a2 + 88);
      v31 = *(_QWORD *)(a2 + 96);
      v32 = *(_QWORD *)(a2 + 104);
      v33 = *(_QWORD *)(a2 + 112);
      v34 = *(_QWORD *)(a2 + 120);
      v35 = *(_QWORD *)(a2 + 128);
      v36 = *(_QWORD *)(a2 + 136);
      sub_23F2D7C1C(v30, v31, v32, v33, v34, v35, v36, v6 & 1);
      *(_QWORD *)(a1 + 88) = v30;
      *(_QWORD *)(a1 + 96) = v31;
      *(_QWORD *)(a1 + 104) = v32;
      *(_QWORD *)(a1 + 112) = v33;
      *(_QWORD *)(a1 + 120) = v34;
      *(_QWORD *)(a1 + 128) = v35;
      *(_QWORD *)(a1 + 136) = v36;
      *(_BYTE *)(a1 + 144) = v29;
    }
  }
  else if (v6 == 255)
  {
    sub_23F2DE124(a1 + 88);
    v8 = *(_OWORD *)(a2 + 104);
    v7 = *(_OWORD *)(a2 + 120);
    v9 = *v5;
    *(_OWORD *)(a1 + 129) = *(_OWORD *)(a2 + 129);
    *(_OWORD *)(a1 + 104) = v8;
    *(_OWORD *)(a1 + 120) = v7;
    *v4 = v9;
  }
  else
  {
    v13 = v6 & 1;
    v14 = *(_QWORD *)(a2 + 88);
    v15 = *(_QWORD *)(a2 + 96);
    v16 = *(_QWORD *)(a2 + 104);
    v17 = *(_QWORD *)(a2 + 112);
    v18 = *(_QWORD *)(a2 + 120);
    v19 = *(_QWORD *)(a2 + 128);
    v20 = *(_QWORD *)(a2 + 136);
    sub_23F2D7C1C(v14, v15, v16, v17, v18, v19, v20, v6 & 1);
    v21 = *(_QWORD *)(a1 + 88);
    v22 = *(_QWORD *)(a1 + 96);
    v23 = *(_QWORD *)(a1 + 104);
    v24 = *(_QWORD *)(a1 + 112);
    v25 = *(_QWORD *)(a1 + 120);
    v26 = *(_QWORD *)(a1 + 128);
    v27 = *(_QWORD *)(a1 + 136);
    v28 = *(_BYTE *)(a1 + 144);
    *(_QWORD *)(a1 + 88) = v14;
    *(_QWORD *)(a1 + 96) = v15;
    *(_QWORD *)(a1 + 104) = v16;
    *(_QWORD *)(a1 + 112) = v17;
    *(_QWORD *)(a1 + 120) = v18;
    *(_QWORD *)(a1 + 128) = v19;
    *(_QWORD *)(a1 + 136) = v20;
    *(_BYTE *)(a1 + 144) = v13;
    sub_23F2D7D00(v21, v22, v23, v24, v25, v26, v27, v28);
  }
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  *(_BYTE *)(a1 + 169) = *(_BYTE *)(a2 + 169);
  return a1;
}

uint64_t sub_23F2DE124(uint64_t a1)
{
  destroy for ElementContent(a1);
  return a1;
}

void *initializeWithTake for UIContextElement(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xAAuLL);
}

uint64_t assignWithTake for UIContextElement(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  __int128 v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  v4 = *(unsigned __int8 *)(a1 + 144);
  if (v4 != 255)
  {
    v5 = *(unsigned __int8 *)(a2 + 144);
    if (v5 != 255)
    {
      v7 = v4 & 1;
      v8 = *(_QWORD *)(a2 + 136);
      v9 = *(_QWORD *)(a1 + 88);
      v10 = *(_QWORD *)(a1 + 96);
      v11 = *(_QWORD *)(a1 + 104);
      v12 = *(_QWORD *)(a1 + 112);
      v13 = *(_QWORD *)(a1 + 120);
      v14 = *(_QWORD *)(a1 + 128);
      v15 = *(_QWORD *)(a1 + 136);
      *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
      *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
      *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
      *(_QWORD *)(a1 + 136) = v8;
      *(_BYTE *)(a1 + 144) = v5 & 1;
      sub_23F2D7D00(v9, v10, v11, v12, v13, v14, v15, v7);
      goto LABEL_6;
    }
    sub_23F2DE124(a1 + 88);
  }
  v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = v6;
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 129) = *(_OWORD *)(a2 + 129);
LABEL_6:
  v16 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v16;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  *(_BYTE *)(a1 + 169) = *(_BYTE *)(a2 + 169);
  return a1;
}

uint64_t getEnumTagSinglePayload for UIContextElement(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 170))
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

uint64_t storeEnumTagSinglePayload for UIContextElement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 168) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 170) = 1;
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
    *(_BYTE *)(result + 170) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UIContextElement()
{
  return &type metadata for UIContextElement;
}

uint64_t destroy for UIElement(uint64_t a1)
{
  int v1;

  v1 = *(unsigned __int8 *)(a1 + 120);
  if (v1 != 255)
    sub_23F2D7D00(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), v1 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UIElement(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  int v6;
  __int128 v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  v6 = *(unsigned __int8 *)(a2 + 120);
  if (v6 == 255)
  {
    v7 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v7;
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 105) = *(_OWORD *)(a2 + 105);
  }
  else
  {
    v8 = v6 & 1;
    v9 = *(_QWORD *)(a2 + 64);
    v10 = *(_QWORD *)(a2 + 72);
    v11 = *(_QWORD *)(a2 + 80);
    v12 = *(_QWORD *)(a2 + 88);
    v13 = *(_QWORD *)(a2 + 96);
    v14 = *(_QWORD *)(a2 + 104);
    v15 = *(_QWORD *)(a2 + 112);
    sub_23F2D7C1C(v9, v10, v11, v12, v13, v14, v15, v6 & 1);
    *(_QWORD *)(a1 + 64) = v9;
    *(_QWORD *)(a1 + 72) = v10;
    *(_QWORD *)(a1 + 80) = v11;
    *(_QWORD *)(a1 + 88) = v12;
    *(_QWORD *)(a1 + 96) = v13;
    *(_QWORD *)(a1 + 104) = v14;
    *(_QWORD *)(a1 + 112) = v15;
    *(_BYTE *)(a1 + 120) = v8;
  }
  v16 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v16;
  *(_WORD *)(a1 + 144) = *(_WORD *)(a2 + 144);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UIElement(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  __int128 *v5;
  int v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  v4 = (_OWORD *)(a1 + 64);
  v5 = (__int128 *)(a2 + 64);
  v6 = *(unsigned __int8 *)(a2 + 120);
  if (*(unsigned __int8 *)(a1 + 120) == 255)
  {
    if (v6 == 255)
    {
      v10 = *v5;
      v11 = *(_OWORD *)(a2 + 80);
      v12 = *(_OWORD *)(a2 + 96);
      *(_OWORD *)(a1 + 105) = *(_OWORD *)(a2 + 105);
      *(_OWORD *)(a1 + 80) = v11;
      *(_OWORD *)(a1 + 96) = v12;
      *v4 = v10;
    }
    else
    {
      v29 = v6 & 1;
      v30 = *(_QWORD *)(a2 + 64);
      v31 = *(_QWORD *)(a2 + 72);
      v32 = *(_QWORD *)(a2 + 80);
      v33 = *(_QWORD *)(a2 + 88);
      v34 = *(_QWORD *)(a2 + 96);
      v35 = *(_QWORD *)(a2 + 104);
      v36 = *(_QWORD *)(a2 + 112);
      sub_23F2D7C1C(v30, v31, v32, v33, v34, v35, v36, v6 & 1);
      *(_QWORD *)(a1 + 64) = v30;
      *(_QWORD *)(a1 + 72) = v31;
      *(_QWORD *)(a1 + 80) = v32;
      *(_QWORD *)(a1 + 88) = v33;
      *(_QWORD *)(a1 + 96) = v34;
      *(_QWORD *)(a1 + 104) = v35;
      *(_QWORD *)(a1 + 112) = v36;
      *(_BYTE *)(a1 + 120) = v29;
    }
  }
  else if (v6 == 255)
  {
    sub_23F2DE124(a1 + 64);
    v8 = v5[1];
    v7 = v5[2];
    v9 = *v5;
    *(_OWORD *)((char *)v4 + 41) = *(__int128 *)((char *)v5 + 41);
    v4[1] = v8;
    v4[2] = v7;
    *v4 = v9;
  }
  else
  {
    v13 = v6 & 1;
    v14 = *(_QWORD *)(a2 + 64);
    v15 = *(_QWORD *)(a2 + 72);
    v16 = *(_QWORD *)(a2 + 80);
    v17 = *(_QWORD *)(a2 + 88);
    v18 = *(_QWORD *)(a2 + 96);
    v19 = *(_QWORD *)(a2 + 104);
    v20 = *(_QWORD *)(a2 + 112);
    sub_23F2D7C1C(v14, v15, v16, v17, v18, v19, v20, v6 & 1);
    v21 = *(_QWORD *)(a1 + 64);
    v22 = *(_QWORD *)(a1 + 72);
    v23 = *(_QWORD *)(a1 + 80);
    v24 = *(_QWORD *)(a1 + 88);
    v25 = *(_QWORD *)(a1 + 96);
    v26 = *(_QWORD *)(a1 + 104);
    v27 = *(_QWORD *)(a1 + 112);
    v28 = *(_BYTE *)(a1 + 120);
    *(_QWORD *)(a1 + 64) = v14;
    *(_QWORD *)(a1 + 72) = v15;
    *(_QWORD *)(a1 + 80) = v16;
    *(_QWORD *)(a1 + 88) = v17;
    *(_QWORD *)(a1 + 96) = v18;
    *(_QWORD *)(a1 + 104) = v19;
    *(_QWORD *)(a1 + 112) = v20;
    *(_BYTE *)(a1 + 120) = v13;
    sub_23F2D7D00(v21, v22, v23, v24, v25, v26, v27, v28);
  }
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_BYTE *)(a1 + 145) = *(_BYTE *)(a2 + 145);
  return a1;
}

void *initializeWithTake for UIElement(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x92uLL);
}

uint64_t assignWithTake for UIElement(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  _OWORD *v6;
  _OWORD *v7;
  int v8;
  int v9;
  __int128 v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  v6 = (_OWORD *)(a1 + 64);
  v7 = (_OWORD *)(a2 + 64);
  v8 = *(unsigned __int8 *)(a1 + 120);
  if (v8 != 255)
  {
    v9 = *(unsigned __int8 *)(a2 + 120);
    if (v9 != 255)
    {
      v11 = v8 & 1;
      v12 = *(_QWORD *)(a2 + 112);
      v13 = *(_QWORD *)(a1 + 64);
      v14 = *(_QWORD *)(a1 + 72);
      v15 = *(_QWORD *)(a1 + 80);
      v16 = *(_QWORD *)(a1 + 88);
      v17 = *(_QWORD *)(a1 + 96);
      v18 = *(_QWORD *)(a1 + 104);
      v19 = *(_QWORD *)(a1 + 112);
      v20 = *(_OWORD *)(a2 + 80);
      *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
      *(_OWORD *)(a1 + 80) = v20;
      *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
      *(_QWORD *)(a1 + 112) = v12;
      *(_BYTE *)(a1 + 120) = v9 & 1;
      sub_23F2D7D00(v13, v14, v15, v16, v17, v18, v19, v11);
      goto LABEL_6;
    }
    sub_23F2DE124(a1 + 64);
  }
  v10 = v7[1];
  *v6 = *v7;
  v6[1] = v10;
  v6[2] = v7[2];
  *(_OWORD *)((char *)v6 + 41) = *(_OWORD *)((char *)v7 + 41);
LABEL_6:
  v21 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v21;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_BYTE *)(a1 + 145) = *(_BYTE *)(a2 + 145);
  return a1;
}

uint64_t getEnumTagSinglePayload for UIElement(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 146))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 136);
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

uint64_t storeEnumTagSinglePayload for UIElement(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 144) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 146) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 146) = 0;
    if (a2)
      *(_QWORD *)(result + 136) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for UIElement()
{
  return &type metadata for UIElement;
}

uint64_t type metadata accessor for UIContextOptions()
{
  return objc_opt_self();
}

uint64_t method lookup function for UIContextOptions()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UIContextOptions.__allocating_init(detectableTypes:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of UIContextOptions.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t storeEnumTagSinglePayload for UIContextOptions.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23F2DE880 + 4 * byte_23F2E302C[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23F2DE8A0 + 4 * byte_23F2E3031[v4]))();
}

_BYTE *sub_23F2DE880(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23F2DE8A0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23F2DE8A8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23F2DE8B0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23F2DE8B8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23F2DE8C0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for UIContextOptions.CodingKeys()
{
  return &type metadata for UIContextOptions.CodingKeys;
}

uint64_t getEnumTagSinglePayload for UIElement.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFB)
  {
    if (a2 + 5 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 5) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v5 = v6 - 6;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for UIElement.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_23F2DE9B0 + 4 * byte_23F2E303B[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23F2DE9E4 + 4 * byte_23F2E3036[v4]))();
}

uint64_t sub_23F2DE9E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2DE9EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F2DE9F4);
  return result;
}

uint64_t sub_23F2DEA00(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F2DEA08);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23F2DEA0C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2DEA14(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UIElement.CodingKeys()
{
  return &type metadata for UIElement.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for UIContextElement.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23F2DEA7C + 4 * byte_23F2E3045[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23F2DEAB0 + 4 * byte_23F2E3040[v4]))();
}

uint64_t sub_23F2DEAB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2DEAB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F2DEAC0);
  return result;
}

uint64_t sub_23F2DEACC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F2DEAD4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23F2DEAD8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2DEAE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UIContextElement.CodingKeys()
{
  return &type metadata for UIContextElement.CodingKeys;
}

unint64_t sub_23F2DEB00()
{
  unint64_t result;

  result = qword_256E622F0;
  if (!qword_256E622F0)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E32B4, &type metadata for UIContextElement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E622F0);
  }
  return result;
}

unint64_t sub_23F2DEB40()
{
  unint64_t result;

  result = qword_256E622F8;
  if (!qword_256E622F8)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E336C, &type metadata for UIElement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E622F8);
  }
  return result;
}

unint64_t sub_23F2DEB80()
{
  unint64_t result;

  result = qword_256E62300;
  if (!qword_256E62300)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E3424, &type metadata for UIContextOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62300);
  }
  return result;
}

unint64_t sub_23F2DEBC0()
{
  unint64_t result;

  result = qword_254345230;
  if (!qword_254345230)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E3394, &type metadata for UIContextOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254345230);
  }
  return result;
}

unint64_t sub_23F2DEC00()
{
  unint64_t result;

  result = qword_254345228;
  if (!qword_254345228)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E33BC, &type metadata for UIContextOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254345228);
  }
  return result;
}

unint64_t sub_23F2DEC40()
{
  unint64_t result;

  result = qword_256E62308;
  if (!qword_256E62308)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E32DC, &type metadata for UIElement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62308);
  }
  return result;
}

unint64_t sub_23F2DEC80()
{
  unint64_t result;

  result = qword_256E62310;
  if (!qword_256E62310)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E3304, &type metadata for UIElement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62310);
  }
  return result;
}

unint64_t sub_23F2DECC0()
{
  unint64_t result;

  result = qword_256E62318;
  if (!qword_256E62318)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E3224, &type metadata for UIContextElement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62318);
  }
  return result;
}

unint64_t sub_23F2DED00()
{
  unint64_t result;

  result = qword_256E62320;
  if (!qword_256E62320)
  {
    result = MEMORY[0x2426678EC](&unk_23F2E324C, &type metadata for UIContextElement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E62320);
  }
  return result;
}

unint64_t sub_23F2DED3C()
{
  unint64_t result;

  result = qword_254344DF0;
  if (!qword_254344DF0)
  {
    result = MEMORY[0x2426678EC](&protocol conformance descriptor for DetectableEntityType, &type metadata for DetectableEntityType);
    atomic_store(result, (unint64_t *)&qword_254344DF0);
  }
  return result;
}

uint64_t sub_23F2DED7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

__n128 sub_23F2DED8C@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>, double a11@<D6>, double a12@<D7>)
{
  uint64_t v12;
  char v13;
  __int128 v14;
  __n128 result;

  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(_BYTE *)(a1 + 56);
  *(double *)a4 = a5;
  *(double *)(a4 + 8) = a6;
  *(double *)(a4 + 16) = a7;
  *(double *)(a4 + 24) = a8;
  *(double *)(a4 + 32) = a9;
  *(double *)(a4 + 40) = a10;
  *(double *)(a4 + 48) = a11;
  *(double *)(a4 + 56) = a12;
  v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a4 + 64) = *(_OWORD *)a1;
  *(_OWORD *)(a4 + 80) = v14;
  result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a4 + 96) = result;
  *(_QWORD *)(a4 + 112) = v12;
  *(_BYTE *)(a4 + 120) = v13;
  *(_QWORD *)(a4 + 128) = a2;
  *(_QWORD *)(a4 + 136) = a3;
  return result;
}

uint64_t sub_23F2DEDC4()
{
  return sub_23F2DFC44();
}

uint64_t sub_23F2DEDE4()
{
  return sub_23F2DFC44();
}

void *sub_23F2DEE04(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x92uLL);
}

uint64_t sub_23F2DEE0C()
{
  return sub_23F2DFC44();
}

uint64_t sub_23F2DEE18()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2DEE38()
{
  uint64_t v0;

  return v0;
}

void sub_23F2DEE58()
{
  JUMPOUT(0x2426678ECLL);
}

uint64_t sub_23F2DEE6C()
{
  return sub_23F2DFBF0();
}

uint64_t sub_23F2DEE78()
{
  return 0;
}

uint64_t sub_23F2DEE94()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t _s23IntelligenceFlowContext16UIContextElementV19surroundingElementsSayACGvg_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F2DEEB8()
{
  return 0;
}

uint64_t sub_23F2DEED0()
{
  return sub_23F2DFC38();
}

uint64_t sub_23F2DEEE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  return a16;
}

_QWORD *sub_23F2DEEF8()
{
  _QWORD *v0;
  uint64_t v1;

  return sub_23F2C3FE0(v0, v1);
}

uint64_t sub_23F2DEF14()
{
  uint64_t *v0;

  return sub_23F2C3FA0(v0);
}

uint64_t sub_23F2DEF1C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2DEF2C()
{
  return swift_bridgeObjectRelease();
}

unint64_t sub_23F2DEF3C(uint64_t a1)
{
  return sub_23F2DC574(a1);
}

uint64_t sub_23F2DEF54()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2DEF68()
{
  return sub_23F2DFBE4();
}

void sub_23F2DEF74(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_23F2CA8B8(a1, a2, v2);
}

void sub_23F2DEF7C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 280) = v0;
}

uint64_t sub_23F2DEF90()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 248) = v0;
  return swift_bridgeObjectRetain();
}

void sub_23F2DEF9C()
{
  uint64_t v0;

  sub_23F2DC738(v0);
}

uint64_t sub_23F2DEFBC()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t sub_23F2DEFD0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2DEFD8(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void sub_23F2DEFE4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD *, uint64_t))
{
  _QWORD v4[2];

  v4[0] = a1;
  v4[1] = a2;
  a4(v4, a3);
  sub_23F2D616C();
}

uint64_t sub_23F2DF010(uint64_t a1, void *a2, void *a3)
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
    v4 = (void *)sub_23F2DF9EC();
    v8 = v7;

  }
  else
  {
    swift_retain();
    v8 = 0xF000000000000000;
  }
  v9 = a3;
  v5(v4, v8, a3);

  sub_23F2C5178((uint64_t)v4, v8);
  return swift_release();
}

void *sub_23F2DF0A4()
{
  qword_254345260 = (uint64_t)&unk_256E6B2C0;
  return &unk_256E6B2C0;
}

id static UIContextXPCService.interface.getter()
{
  if (qword_254345268 != -1)
    swift_once();
  return (id)qword_254345260;
}

unint64_t static UIContextXPCService.serviceName.getter()
{
  return sub_23F2DF900();
}

unint64_t static UIContextXPCService.entitlementName.getter()
{
  return sub_23F2DF900();
}

void sub_23F2DF110()
{
  qword_254345240 = MEMORY[0x24BEE4AF8];
}

uint64_t static UIContextXPCService.selectorClasses.getter()
{
  if (qword_254345238 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F2DF164()
{
  uint64_t v0;

  v0 = sub_23F2DFA58();
  sub_23F2C6158(v0, qword_254345248);
  sub_23F2C553C(v0, (uint64_t)qword_254345248);
  return sub_23F2DFA04();
}

uint64_t static UIContextXPCService.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_254345040 != -1)
    swift_once();
  v2 = sub_23F2DFA58();
  v3 = sub_23F2C553C(v2, (uint64_t)qword_254345248);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_23F2DF220()
{
  static UIContextXPCService.serviceName.getter();
  return 0xD000000000000024;
}

ValueMetadata *type metadata accessor for UIContextXPCService()
{
  return &type metadata for UIContextXPCService;
}

uint64_t sub_23F2DF254(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = 0;
  sub_23F2C6270(&qword_254345010, a2, (uint64_t (*)(uint64_t))type metadata accessor for UIContextXPCClient, (uint64_t)&unk_23F2E35D4);
  sub_23F2C3FA0(&qword_254345008);
  swift_allocObject();
  swift_retain();
  *(_QWORD *)(v2 + 16) = sub_23F2DFA28();
  swift_release();
  return v2;
}

void sub_23F2DF2E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (*(_QWORD *)(v1 + 16))
  {
    v3 = MEMORY[0x24BDAC7A8](a1);
    v4 = v2;
    sub_23F2C6310();
    sub_23F2DF92C();
    sub_23F2DF914();
    sub_23F2DF920();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23F2DF360(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_23F2DF3F0(a4, a5, (uint64_t)sub_23F2DF888, v10, a1);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_23F2DF3F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;
  void *v9;
  _QWORD v10[6];

  v8 = (void *)sub_23F2DF9E0();
  v10[4] = a3;
  v10[5] = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_23F2DF010;
  v10[3] = &unk_250FC1748;
  v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(a5, sel_retrieveUIContextElementsWithOptions_with_, v8, v9);
  _Block_release(v9);

}

uint64_t sub_23F2DF4A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  if (*(_QWORD *)(v1 + 16))
  {
    sub_23F2C6310();
    sub_23F2DFA1C();
    result = sub_23F2DF914();
    if (!v0)
      return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23F2DF508(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_23F2DF580((uint64_t)sub_23F2DF888, v6, a1);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_23F2DF580(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  _QWORD v5[6];

  v5[4] = a1;
  v5[5] = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_23F2DF010;
  v5[3] = &unk_250FC16F8;
  v4 = _Block_copy(v5);
  swift_retain();
  swift_release();
  objc_msgSend(a3, sel_retrieveUIElementsWith_, v4);
  _Block_release(v4);
}

void sub_23F2DF61C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;

  if (*(_QWORD *)(v1 + 16))
  {
    v3 = MEMORY[0x24BDAC7A8](a1) & 1;
    v4 = v2;
    sub_23F2C6310();
    sub_23F2DF92C();
    sub_23F2DF914();
    sub_23F2DF920();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23F2DF6A4(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v10;

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_23F2DF734(a4, a5, (uint64_t)sub_23F2DF888, v10, a1);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_23F2DF734(char a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v9;
  void *v10;
  _QWORD v11[6];

  v9 = (void *)sub_23F2DFB00();
  v11[4] = a3;
  v11[5] = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_23F2DF010;
  v11[3] = &unk_250FC1798;
  v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(a5, sel_retrieveElementHierarchyWithVerbose_args_with_, a1 & 1, v9, v10);
  _Block_release(v10);

}

uint64_t type metadata accessor for UIContextXPCClient()
{
  return objc_opt_self();
}

uint64_t sub_23F2DF824()
{
  type metadata accessor for UIContextXPCClient();
  return sub_23F2DFA4C();
}

uint64_t sub_23F2DF864()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23F2DF88C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_23F2DF89C()
{
  return swift_release();
}

uint64_t sub_23F2DF8A4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_23F2DF360(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

uint64_t sub_23F2DF8AC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_23F2DF6A4(a1, a2, a3, *(_BYTE *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

void sub_23F2DF8B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void (*v4)(_QWORD *, uint64_t);
  _QWORD v5[2];

  v4 = *(void (**)(_QWORD *, uint64_t))(v3 + 16);
  v5[0] = a1;
  v5[1] = a2;
  v4(v5, a3);
  sub_23F2D616C();
}

unint64_t sub_23F2DF900()
{
  return 0xD000000000000024;
}

uint64_t sub_23F2DF914()
{
  return swift_release();
}

uint64_t sub_23F2DF92C()
{
  return sub_23F2DFA1C();
}

uint64_t sub_23F2DF938()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_23F2DF944()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_23F2DF950()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_23F2DF95C()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_23F2DF968()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_23F2DF974()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_23F2DF980()
{
  return MEMORY[0x24BDCBCB0]();
}

uint64_t sub_23F2DF98C()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_23F2DF998()
{
  return MEMORY[0x24BDCCB20]();
}

uint64_t sub_23F2DF9A4()
{
  return MEMORY[0x24BDCCB30]();
}

uint64_t sub_23F2DF9B0()
{
  return MEMORY[0x24BDCCBD0]();
}

uint64_t sub_23F2DF9BC()
{
  return MEMORY[0x24BDCCC10]();
}

uint64_t sub_23F2DF9C8()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_23F2DF9D4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23F2DF9E0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23F2DF9EC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23F2DF9F8()
{
  return MEMORY[0x24BE57F30]();
}

uint64_t sub_23F2DFA04()
{
  return MEMORY[0x24BE57F78]();
}

uint64_t sub_23F2DFA10()
{
  return MEMORY[0x24BE797A8]();
}

uint64_t sub_23F2DFA1C()
{
  return MEMORY[0x24BE79890]();
}

uint64_t sub_23F2DFA28()
{
  return MEMORY[0x24BE798A8]();
}

uint64_t sub_23F2DFA34()
{
  return MEMORY[0x24BE798D0]();
}

uint64_t sub_23F2DFA40()
{
  return MEMORY[0x24BE798D8]();
}

uint64_t sub_23F2DFA4C()
{
  return MEMORY[0x24BE798E0]();
}

uint64_t sub_23F2DFA58()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23F2DFA64()
{
  return MEMORY[0x24BEB9750]();
}

uint64_t sub_23F2DFA70()
{
  return MEMORY[0x24BEB9760]();
}

uint64_t sub_23F2DFA7C()
{
  return MEMORY[0x24BEB9D20]();
}

uint64_t sub_23F2DFA88()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23F2DFA94()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23F2DFAA0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23F2DFAAC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23F2DFAB8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23F2DFAC4()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_23F2DFAD0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23F2DFADC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23F2DFAE8()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23F2DFAF4()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23F2DFB00()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23F2DFB0C()
{
  return MEMORY[0x24BE57F80]();
}

uint64_t sub_23F2DFB18()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_23F2DFB24()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23F2DFB30()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_23F2DFB3C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23F2DFB48()
{
  return MEMORY[0x24BEE5E68]();
}

uint64_t sub_23F2DFB54()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23F2DFB60()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23F2DFB6C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23F2DFB78()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23F2DFB84()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23F2DFB90()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23F2DFB9C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23F2DFBA8()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23F2DFBB4()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23F2DFBC0()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23F2DFBCC()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23F2DFBD8()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23F2DFBE4()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23F2DFBF0()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23F2DFBFC()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23F2DFC08()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23F2DFC14()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23F2DFC20()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23F2DFC2C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23F2DFC38()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23F2DFC44()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23F2DFC50()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23F2DFC5C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23F2DFC68()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23F2DFC74()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23F2DFC80()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23F2DFC8C()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23F2DFC98()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23F2DFCA4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23F2DFCB0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23F2DFCBC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23F2DFCC8()
{
  return MEMORY[0x24BEE4A10]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

