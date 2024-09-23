uint64_t CanvasPlaceholder.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CanvasPlaceholder.referenceIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CanvasPlaceholder.editorialCardIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CanvasPlaceholder.markerType.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t CanvasPlaceholder.referenceType.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 49);
}

uint64_t CanvasPlaceholder.displayStyle.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 50);
}

uint64_t CanvasPlaceholder.reason.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CanvasPlaceholder.planMetadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for CanvasPlaceholder();
  return sub_23C100138(v1 + *(int *)(v3 + 44), a1, (uint64_t (*)(_QWORD))type metadata accessor for PlanMetadata);
}

uint64_t type metadata accessor for CanvasPlaceholder()
{
  uint64_t result;

  result = qword_256B21950;
  if (!qword_256B21950)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t CanvasPlaceholder.init(identifier:referenceIdentifier:editorialCardIdentifier:markerType:referenceType:displayStyle:reason:planMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, char a8@<W7>, uint64_t a9@<X8>, char a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;

  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_BYTE *)(a9 + 48) = a7;
  *(_BYTE *)(a9 + 49) = a8;
  *(_BYTE *)(a9 + 50) = a10;
  *(_QWORD *)(a9 + 56) = a11;
  *(_QWORD *)(a9 + 64) = a12;
  v13 = a9 + *(int *)(type metadata accessor for CanvasPlaceholder() + 44);
  return sub_23C0FF558(a13, v13);
}

uint64_t sub_23C0FF558(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PlanMetadata();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C0FF59C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C0FF5D4 + 4 * byte_23C139720[a1]))(0xD000000000000013, 0x800000023C140360);
}

uint64_t sub_23C0FF5D4()
{
  return 0x696669746E656469;
}

uint64_t sub_23C0FF5F4(uint64_t a1)
{
  return a1 + 4;
}

uint64_t sub_23C0FF60C()
{
  return 0x795472656B72616DLL;
}

uint64_t sub_23C0FF628()
{
  return 0x636E657265666572;
}

uint64_t sub_23C0FF64C()
{
  return 0x5379616C70736964;
}

uint64_t sub_23C0FF66C()
{
  return 0x6E6F73616572;
}

uint64_t sub_23C0FF680()
{
  return 0x6174654D6E616C70;
}

BOOL sub_23C0FF6A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C0FF6B4()
{
  sub_23C1392F0();
  sub_23C1392FC();
  return sub_23C139320();
}

uint64_t sub_23C0FF6F8()
{
  return sub_23C1392FC();
}

uint64_t sub_23C0FF720()
{
  sub_23C1392F0();
  sub_23C1392FC();
  return sub_23C139320();
}

uint64_t sub_23C0FF760()
{
  unsigned __int8 *v0;

  return sub_23C0FF59C(*v0);
}

uint64_t sub_23C0FF768@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1005D8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C0FF78C()
{
  return 0;
}

void sub_23C0FF798(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_23C0FF7A4()
{
  sub_23C0FFAE4();
  return sub_23C139350();
}

uint64_t sub_23C0FF7CC()
{
  sub_23C0FFAE4();
  return sub_23C13935C();
}

uint64_t CanvasPlaceholder.encode(to:)(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21888);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C0FFAE4();
  sub_23C139338();
  v10[15] = 0;
  sub_23C139248();
  if (!v2)
  {
    v10[14] = 1;
    sub_23C139248();
    v10[13] = 2;
    sub_23C139224();
    v10[12] = v3[48];
    v10[11] = 3;
    sub_23C0FFB28();
    sub_23C13923C();
    v10[10] = v3[49];
    v10[9] = 4;
    sub_23C0FFB6C();
    sub_23C139278();
    v10[8] = v3[50];
    v10[7] = 5;
    sub_23C0FFBB0();
    sub_23C139278();
    v10[6] = 6;
    sub_23C139224();
    type metadata accessor for CanvasPlaceholder();
    v10[5] = 7;
    type metadata accessor for PlanMetadata();
    sub_23C100BA4(&qword_256B218B0, (uint64_t (*)(uint64_t))type metadata accessor for PlanMetadata, (uint64_t)&protocol conformance descriptor for PlanMetadata);
    sub_23C139278();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426179C4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

unint64_t sub_23C0FFAE4()
{
  unint64_t result;

  result = qword_256B21890;
  if (!qword_256B21890)
  {
    result = MEMORY[0x2426179DC](&unk_23C139990, &type metadata for CanvasPlaceholder.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21890);
  }
  return result;
}

unint64_t sub_23C0FFB28()
{
  unint64_t result;

  result = qword_256B21898;
  if (!qword_256B21898)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for PlaceholderMarkerType, &type metadata for PlaceholderMarkerType);
    atomic_store(result, (unint64_t *)&qword_256B21898);
  }
  return result;
}

unint64_t sub_23C0FFB6C()
{
  unint64_t result;

  result = qword_256B218A0;
  if (!qword_256B218A0)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for PlaceholderReferenceType, &type metadata for PlaceholderReferenceType);
    atomic_store(result, (unint64_t *)&qword_256B218A0);
  }
  return result;
}

unint64_t sub_23C0FFBB0()
{
  unint64_t result;

  result = qword_256B218A8;
  if (!qword_256B218A8)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for DisplayStyle, &type metadata for DisplayStyle);
    atomic_store(result, (unint64_t *)&qword_256B218A8);
  }
  return result;
}

uint64_t CanvasPlaceholder.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  char *v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;

  v20 = a2;
  type metadata accessor for PlanMetadata();
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218B8);
  v5 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for CanvasPlaceholder();
  MEMORY[0x24BDAC7A8]();
  v22 = a1;
  v23 = (uint64_t *)((char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C0FFAE4();
  v10 = v24;
  sub_23C13932C();
  if (v10)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  v24 = v4;
  v35 = 0;
  v11 = v21;
  v12 = sub_23C1391D0();
  v13 = (uint64_t)v23;
  *v23 = v12;
  *(_QWORD *)(v13 + 8) = v14;
  v34 = 1;
  *(_QWORD *)(v13 + 16) = sub_23C1391D0();
  *(_QWORD *)(v13 + 24) = v15;
  v33 = 2;
  *(_QWORD *)(v13 + 32) = sub_23C1391AC();
  *(_QWORD *)(v13 + 40) = v16;
  v31 = 3;
  sub_23C10006C();
  sub_23C1391C4();
  *(_BYTE *)(v13 + 48) = v32;
  v29 = 4;
  sub_23C1000B0();
  sub_23C139200();
  *(_BYTE *)(v13 + 49) = v30;
  v27 = 5;
  sub_23C1000F4();
  sub_23C139200();
  *(_BYTE *)(v13 + 50) = v28;
  v26 = 6;
  *(_QWORD *)(v13 + 56) = sub_23C1391AC();
  *(_QWORD *)(v13 + 64) = v17;
  v25 = 7;
  sub_23C100BA4(&qword_256B218D8, (uint64_t (*)(uint64_t))type metadata accessor for PlanMetadata, (uint64_t)&protocol conformance descriptor for PlanMetadata);
  v18 = (uint64_t)v24;
  sub_23C139200();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v11);
  sub_23C0FF558(v18, v13 + *(int *)(v8 + 44));
  sub_23C100138(v13, v20, (uint64_t (*)(_QWORD))type metadata accessor for CanvasPlaceholder);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  return sub_23C10017C(v13);
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

unint64_t sub_23C10006C()
{
  unint64_t result;

  result = qword_256B218C0;
  if (!qword_256B218C0)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for PlaceholderMarkerType, &type metadata for PlaceholderMarkerType);
    atomic_store(result, (unint64_t *)&qword_256B218C0);
  }
  return result;
}

unint64_t sub_23C1000B0()
{
  unint64_t result;

  result = qword_256B218C8;
  if (!qword_256B218C8)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for PlaceholderReferenceType, &type metadata for PlaceholderReferenceType);
    atomic_store(result, (unint64_t *)&qword_256B218C8);
  }
  return result;
}

unint64_t sub_23C1000F4()
{
  unint64_t result;

  result = qword_256B218D0;
  if (!qword_256B218D0)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for DisplayStyle, &type metadata for DisplayStyle);
    atomic_store(result, (unint64_t *)&qword_256B218D0);
  }
  return result;
}

uint64_t sub_23C100138(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23C10017C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CanvasPlaceholder();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C1001B8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CanvasPlaceholder.init(from:)(a1, a2);
}

uint64_t sub_23C1001CC(_QWORD *a1)
{
  return CanvasPlaceholder.encode(to:)(a1);
}

uint64_t CanvasPlaceholder.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v1 = sub_23C138BC4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PlanMetadata();
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_23C139008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C139008();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 40))
  {
    sub_23C139308();
    swift_bridgeObjectRetain();
    sub_23C139008();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23C139308();
  }
  if (*(_BYTE *)(v0 + 48) == 2)
  {
    sub_23C139308();
  }
  else
  {
    sub_23C139308();
    sub_23C139008();
    swift_bridgeObjectRelease();
  }
  sub_23C139008();
  swift_bridgeObjectRelease();
  DisplayStyle.rawValue.getter(*(_BYTE *)(v0 + 50));
  sub_23C139008();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 64))
  {
    sub_23C139308();
    swift_bridgeObjectRetain();
    sub_23C139008();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23C139308();
  }
  v7 = type metadata accessor for CanvasPlaceholder();
  sub_23C100138(v0 + *(int *)(v7 + 44), (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for PlanMetadata);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v6, 1, v8) == 1)
    return sub_23C1392FC();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v6, v1);
  sub_23C1392FC();
  sub_23C100BA4((unint64_t *)&qword_256B218E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23C138FC0();
  sub_23C139308();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t CanvasPlaceholder.hashValue.getter()
{
  sub_23C1392F0();
  CanvasPlaceholder.hash(into:)();
  return sub_23C139320();
}

uint64_t sub_23C10055C()
{
  sub_23C1392F0();
  CanvasPlaceholder.hash(into:)();
  return sub_23C139320();
}

uint64_t sub_23C10059C()
{
  sub_23C1392F0();
  CanvasPlaceholder.hash(into:)();
  return sub_23C139320();
}

uint64_t sub_23C1005D8(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023C140360 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000023C140380 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x795472656B72616DLL && a2 == 0xEA00000000006570 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x636E657265666572 && a2 == 0xED00006570795465 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x5379616C70736964 && a2 == 0xEC000000656C7974 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6E6F73616572 && a2 == 0xE600000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6174654D6E616C70 && a2 == 0xEC00000061746164)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    v5 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 7;
    else
      return 8;
  }
}

uint64_t _s13FitnessForYou17CanvasPlaceholderV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (!v4 && (sub_23C139284() & 1) == 0)
    return 0;
  v5 = *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
  if (!v5 && (sub_23C139284() & 1) == 0)
    return 0;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a2 + 40);
  if (v6)
  {
    if (!v7 || (*(_QWORD *)(a1 + 32) != *(_QWORD *)(a2 + 32) || v6 != v7) && (sub_23C139284() & 1) == 0)
      return 0;
  }
  else if (v7)
  {
    return 0;
  }
  v8 = *(unsigned __int8 *)(a1 + 48);
  v9 = *(unsigned __int8 *)(a2 + 48);
  if (v8 == 2)
  {
    if (v9 != 2)
      return 0;
  }
  else
  {
    if (v9 == 2)
      return 0;
    if ((v8 & 1) != 0)
      v10 = 0xD000000000000018;
    else
      v10 = 0x737543646C697562;
    if ((v8 & 1) != 0)
      v11 = 0x800000023C1402E0;
    else
      v11 = 0xEF6E616C506D6F74;
    if ((v9 & 1) != 0)
      v12 = 0xD000000000000018;
    else
      v12 = 0x737543646C697562;
    if ((v9 & 1) != 0)
      v13 = 0x800000023C1402E0;
    else
      v13 = 0xEF6E616C506D6F74;
    if (v10 == v12 && v11 == v13)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v14 = sub_23C139284();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
        return 0;
    }
  }
  if ((sub_23C12B9A0(*(_BYTE *)(a1 + 49), *(_BYTE *)(a2 + 49)) & 1) != 0)
  {
    v15 = *(_BYTE *)(a2 + 50);
    v16 = DisplayStyle.rawValue.getter(*(_BYTE *)(a1 + 50));
    v18 = v17;
    if (v16 == DisplayStyle.rawValue.getter(v15) && v18 == v19)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v20 = sub_23C139284();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0)
        return 0;
    }
    v21 = *(_QWORD *)(a1 + 64);
    v22 = *(_QWORD *)(a2 + 64);
    if (v21)
    {
      if (!v22 || (*(_QWORD *)(a1 + 56) != *(_QWORD *)(a2 + 56) || v21 != v22) && (sub_23C139284() & 1) == 0)
        return 0;
LABEL_48:
      v23 = *(int *)(type metadata accessor for CanvasPlaceholder() + 44);
      return _s13FitnessForYou12PlanMetadataO2eeoiySbAC_ACtFZ_0(a1 + v23, a2 + v23);
    }
    if (!v22)
      goto LABEL_48;
  }
  return 0;
}

uint64_t sub_23C100B78()
{
  return sub_23C100BA4(&qword_256B218F0, (uint64_t (*)(uint64_t))type metadata accessor for CanvasPlaceholder, (uint64_t)&protocol conformance descriptor for CanvasPlaceholder);
}

uint64_t sub_23C100BA4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2426179DC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for CanvasPlaceholder(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v15 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v15 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    v6 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v6;
    v7 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v7;
    *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
    *(_WORD *)(a1 + 49) = *(_WORD *)((char *)a2 + 49);
    v8 = a2[8];
    v9 = *(int *)(a3 + 44);
    v10 = (char *)a2 + v9;
    v11 = (void *)(a1 + v9);
    *(_QWORD *)(a1 + 56) = a2[7];
    *(_QWORD *)(a1 + 64) = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
    {
      v14 = type metadata accessor for PlanMetadata();
      memcpy(v11, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v16 = sub_23C138BC4();
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v11, v10, v16);
      *((_BYTE *)v11 + *(int *)(v12 + 48)) = v10[*(int *)(v12 + 48)];
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t destroy for CanvasPlaceholder(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 44);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5);
  if (!(_DWORD)result)
  {
    v7 = sub_23C138BC4();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v4, v7);
  }
  return result;
}

uint64_t initializeWithCopy for CanvasPlaceholder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_WORD *)(a1 + 49) = *(_WORD *)(a2 + 49);
  v7 = *(_QWORD *)(a2 + 64);
  v8 = *(int *)(a3 + 44);
  v9 = (const void *)(a2 + v8);
  v10 = (void *)(a1 + v8);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11))
  {
    v13 = type metadata accessor for PlanMetadata();
    memcpy(v10, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v14 = sub_23C138BC4();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v10, v9, v14);
    *((_BYTE *)v10 + *(int *)(v11 + 48)) = *((_BYTE *)v9 + *(int *)(v11 + 48));
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithCopy for CanvasPlaceholder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_BYTE *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_BYTE *)(a1 + 50) = *(_BYTE *)(a2 + 50);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 44);
  v7 = (_BYTE *)(a1 + v6);
  v8 = (_BYTE *)(a2 + v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      v17 = sub_23C138BC4();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v7, v8, v17);
      v7[*(int *)(v9 + 48)] = v8[*(int *)(v9 + 48)];
      return a1;
    }
    sub_23C10109C((uint64_t)v7);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v15 = type metadata accessor for PlanMetadata();
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  v14 = sub_23C138BC4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v7, v8, v14);
  v7[*(int *)(v9 + 48)] = v8[*(int *)(v9 + 48)];
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t sub_23C10109C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for CanvasPlaceholder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_WORD *)(a1 + 49) = *(_WORD *)(a2 + 49);
  v5 = *(int *)(a3 + 44);
  v6 = (void *)(a1 + v5);
  v7 = (const void *)(a2 + v5);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    v10 = type metadata accessor for PlanMetadata();
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    v11 = sub_23C138BC4();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v6, v7, v11);
    *((_BYTE *)v6 + *(int *)(v8 + 48)) = *((_BYTE *)v7 + *(int *)(v8 + 48));
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithTake for CanvasPlaceholder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(_BYTE *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_WORD *)(a1 + 49) = *(_WORD *)(a2 + 49);
  v9 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v9;
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 44);
  v11 = (_BYTE *)(a1 + v10);
  v12 = (_BYTE *)(a2 + v10);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      v21 = sub_23C138BC4();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v21 - 8) + 40))(v11, v12, v21);
      v11[*(int *)(v13 + 48)] = v12[*(int *)(v13 + 48)];
      return a1;
    }
    sub_23C10109C((uint64_t)v11);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v19 = type metadata accessor for PlanMetadata();
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    return a1;
  }
  v18 = sub_23C138BC4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v11, v12, v18);
  v11[*(int *)(v13 + 48)] = v12[*(int *)(v13 + 48)];
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for CanvasPlaceholder()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C10135C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for PlanMetadata();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 44), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for CanvasPlaceholder()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1013E4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for PlanMetadata();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 44), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23C101458()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for PlanMetadata();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23C101508(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23C101528(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_256B219A0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256B219A0);
  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CanvasPlaceholder.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CanvasPlaceholder.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C10168C + 4 * byte_23C13972D[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_23C1016C0 + 4 * byte_23C139728[v4]))();
}

uint64_t sub_23C1016C0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1016C8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1016D0);
  return result;
}

uint64_t sub_23C1016DC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1016E4);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_23C1016E8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1016F0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1016FC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23C101708(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CanvasPlaceholder.CodingKeys()
{
  return &type metadata for CanvasPlaceholder.CodingKeys;
}

unint64_t sub_23C101724()
{
  unint64_t result;

  result = qword_256B219A8;
  if (!qword_256B219A8)
  {
    result = MEMORY[0x2426179DC](&unk_23C139968, &type metadata for CanvasPlaceholder.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B219A8);
  }
  return result;
}

unint64_t sub_23C10176C()
{
  unint64_t result;

  result = qword_256B219B0;
  if (!qword_256B219B0)
  {
    result = MEMORY[0x2426179DC](&unk_23C1398D8, &type metadata for CanvasPlaceholder.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B219B0);
  }
  return result;
}

unint64_t sub_23C1017B4()
{
  unint64_t result;

  result = qword_256B219B8;
  if (!qword_256B219B8)
  {
    result = MEMORY[0x2426179DC](&unk_23C139900, &type metadata for CanvasPlaceholder.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B219B8);
  }
  return result;
}

uint64_t sub_23C1017F8()
{
  uint64_t v0;

  v0 = sub_23C138C18();
  __swift_allocate_value_buffer(v0, qword_256B2FCD0);
  __swift_project_value_buffer(v0, (uint64_t)qword_256B2FCD0);
  return sub_23C138C0C();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

BOOL static DeviceType.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23C1018E0(char a1)
{
  return *(_QWORD *)&aPhone_0[8 * a1];
}

uint64_t sub_23C101908()
{
  char *v0;

  return sub_23C1018E0(*v0);
}

uint64_t sub_23C101910@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C102010(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C101934(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_23C101940()
{
  sub_23C101E00();
  return sub_23C139350();
}

uint64_t sub_23C101968()
{
  sub_23C101E00();
  return sub_23C13935C();
}

uint64_t sub_23C101990()
{
  return 0;
}

void sub_23C10199C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23C1019A8()
{
  sub_23C101F10();
  return sub_23C139350();
}

uint64_t sub_23C1019D0()
{
  sub_23C101F10();
  return sub_23C13935C();
}

uint64_t sub_23C1019F8()
{
  sub_23C101E88();
  return sub_23C139350();
}

uint64_t sub_23C101A20()
{
  sub_23C101E88();
  return sub_23C13935C();
}

uint64_t sub_23C101A48@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_23C101A74()
{
  sub_23C101E44();
  return sub_23C139350();
}

uint64_t sub_23C101A9C()
{
  sub_23C101E44();
  return sub_23C13935C();
}

uint64_t sub_23C101AC4()
{
  sub_23C101ECC();
  return sub_23C139350();
}

uint64_t sub_23C101AEC()
{
  sub_23C101ECC();
  return sub_23C13935C();
}

void DeviceType.encode(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[10];
  uint64_t v9;

  v9 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B219C0);
  v8[7] = *(_QWORD *)(v3 - 8);
  v8[8] = v3;
  MEMORY[0x24BDAC7A8]();
  v8[6] = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B219C8);
  v8[4] = *(_QWORD *)(v5 - 8);
  v8[5] = v5;
  MEMORY[0x24BDAC7A8]();
  v8[3] = (char *)v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B219D0);
  v8[1] = *(_QWORD *)(v7 - 8);
  v8[2] = v7;
  MEMORY[0x24BDAC7A8]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B219D8);
  MEMORY[0x24BDAC7A8]();
  v8[9] = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B219E0) - 8);
  MEMORY[0x24BDAC7A8]();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C101E00();
  sub_23C139338();
  __asm { BR              X10 }
}

uint64_t sub_23C101CCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v5 - 68) = 0;
  sub_23C101F10();
  sub_23C139218();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 104) + 8))(v1, v0);
}

unint64_t sub_23C101E00()
{
  unint64_t result;

  result = qword_256B219E8;
  if (!qword_256B219E8)
  {
    result = MEMORY[0x2426179DC](&unk_23C139EF8, &type metadata for DeviceType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B219E8);
  }
  return result;
}

unint64_t sub_23C101E44()
{
  unint64_t result;

  result = qword_256B219F0;
  if (!qword_256B219F0)
  {
    result = MEMORY[0x2426179DC](&unk_23C139EA8, &type metadata for DeviceType.TvCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B219F0);
  }
  return result;
}

unint64_t sub_23C101E88()
{
  unint64_t result;

  result = qword_256B219F8;
  if (!qword_256B219F8)
  {
    result = MEMORY[0x2426179DC](&unk_23C139E58, &type metadata for DeviceType.TabletCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B219F8);
  }
  return result;
}

unint64_t sub_23C101ECC()
{
  unint64_t result;

  result = qword_256B21A00;
  if (!qword_256B21A00)
  {
    result = MEMORY[0x2426179DC](&unk_23C139E08, &type metadata for DeviceType.WatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21A00);
  }
  return result;
}

unint64_t sub_23C101F10()
{
  unint64_t result;

  result = qword_256B21A08;
  if (!qword_256B21A08)
  {
    result = MEMORY[0x2426179DC](&unk_23C139DB8, &type metadata for DeviceType.PhoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21A08);
  }
  return result;
}

uint64_t DeviceType.init(from:)(_QWORD *a1)
{
  return sub_23C102180(a1);
}

uint64_t sub_23C101F68@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23C102180(a1);
  if (!v2)
    *a2 = result;
  return result;
}

void sub_23C101F90(_QWORD *a1)
{
  unsigned __int8 *v1;

  DeviceType.encode(to:)(a1, *v1);
}

uint64_t DeviceType.hash(into:)()
{
  return sub_23C1392FC();
}

uint64_t DeviceType.hashValue.getter()
{
  sub_23C1392F0();
  sub_23C1392FC();
  return sub_23C139320();
}

uint64_t sub_23C102010(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x656E6F6870 && a2 == 0xE500000000000000;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6863746177 && a2 == 0xE500000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74656C626174 && a2 == 0xE600000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 30324 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23C102180(_QWORD *a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v23[12];
  _QWORD *v24;
  uint64_t v25;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21A70);
  v23[10] = *(_QWORD *)(v2 - 8);
  v23[11] = v2;
  MEMORY[0x24BDAC7A8]();
  v23[9] = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21A78);
  v23[5] = *(_QWORD *)(v4 - 8);
  v23[6] = v4;
  MEMORY[0x24BDAC7A8]();
  v23[8] = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21A80);
  v23[3] = *(_QWORD *)(v6 - 8);
  v23[4] = v6;
  MEMORY[0x24BDAC7A8]();
  v23[7] = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21A88);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21A90);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = a1[3];
  v24 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_23C101E00();
  v17 = v25;
  sub_23C13932C();
  if (!v17)
  {
    v23[1] = v8;
    v23[2] = v11;
    v23[0] = v9;
    v25 = v13;
    v18 = sub_23C13920C();
    if (*(_QWORD *)(v18 + 16) == 1)
      __asm { BR              X9 }
    v19 = sub_23C139110();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B21A98);
    *v21 = &type metadata for DeviceType;
    sub_23C1391A0();
    sub_23C139104();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v15, v12);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  return v12;
}

void sub_23C1024A4()
{
  uint64_t v0;
  uint64_t v1;

  *(_BYTE *)(v1 - 67) = 1;
  sub_23C101ECC();
  sub_23C139194();
  if (!v0)
    JUMPOUT(0x23C102578);
  JUMPOUT(0x23C102458);
}

void sub_23C1024E8()
{
  uint64_t v0;
  uint64_t v1;

  *(_BYTE *)(v1 - 66) = 2;
  sub_23C101E88();
  sub_23C139194();
  if (!v0)
    JUMPOUT(0x23C102528);
  JUMPOUT(0x23C102458);
}

void sub_23C102534()
{
  uint64_t v0;
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = 3;
  sub_23C101E44();
  sub_23C139194();
  if (!v0)
    JUMPOUT(0x23C102578);
  JUMPOUT(0x23C102458);
}

unint64_t sub_23C1025A8()
{
  unint64_t result;

  result = qword_256B21A10;
  if (!qword_256B21A10)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for DeviceType, &type metadata for DeviceType);
    atomic_store(result, (unint64_t *)&qword_256B21A10);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceType()
{
  return &type metadata for DeviceType;
}

uint64_t getEnumTagSinglePayload for ForYouAction.LoadedCodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s13FitnessForYou10DeviceTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1026E0 + 4 * byte_23C139A8D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C102714 + 4 * byte_23C139A88[v4]))();
}

uint64_t sub_23C102714(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C10271C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C102724);
  return result;
}

uint64_t sub_23C102730(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C102738);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C10273C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C102744(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DeviceType.CodingKeys()
{
  return &type metadata for DeviceType.CodingKeys;
}

ValueMetadata *type metadata accessor for DeviceType.PhoneCodingKeys()
{
  return &type metadata for DeviceType.PhoneCodingKeys;
}

ValueMetadata *type metadata accessor for DeviceType.WatchCodingKeys()
{
  return &type metadata for DeviceType.WatchCodingKeys;
}

ValueMetadata *type metadata accessor for DeviceType.TabletCodingKeys()
{
  return &type metadata for DeviceType.TabletCodingKeys;
}

ValueMetadata *type metadata accessor for DeviceType.TvCodingKeys()
{
  return &type metadata for DeviceType.TvCodingKeys;
}

unint64_t sub_23C1027A4()
{
  unint64_t result;

  result = qword_256B21A18;
  if (!qword_256B21A18)
  {
    result = MEMORY[0x2426179DC](&unk_23C139D90, &type metadata for DeviceType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21A18);
  }
  return result;
}

unint64_t sub_23C1027EC()
{
  unint64_t result;

  result = qword_256B21A20;
  if (!qword_256B21A20)
  {
    result = MEMORY[0x2426179DC](&unk_23C139CB0, &type metadata for DeviceType.PhoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21A20);
  }
  return result;
}

unint64_t sub_23C102834()
{
  unint64_t result;

  result = qword_256B21A28;
  if (!qword_256B21A28)
  {
    result = MEMORY[0x2426179DC](&unk_23C139CD8, &type metadata for DeviceType.PhoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21A28);
  }
  return result;
}

unint64_t sub_23C10287C()
{
  unint64_t result;

  result = qword_256B21A30;
  if (!qword_256B21A30)
  {
    result = MEMORY[0x2426179DC](&unk_23C139C60, &type metadata for DeviceType.WatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21A30);
  }
  return result;
}

unint64_t sub_23C1028C4()
{
  unint64_t result;

  result = qword_256B21A38;
  if (!qword_256B21A38)
  {
    result = MEMORY[0x2426179DC](&unk_23C139C88, &type metadata for DeviceType.WatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21A38);
  }
  return result;
}

unint64_t sub_23C10290C()
{
  unint64_t result;

  result = qword_256B21A40;
  if (!qword_256B21A40)
  {
    result = MEMORY[0x2426179DC](&unk_23C139C10, &type metadata for DeviceType.TabletCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21A40);
  }
  return result;
}

unint64_t sub_23C102954()
{
  unint64_t result;

  result = qword_256B21A48;
  if (!qword_256B21A48)
  {
    result = MEMORY[0x2426179DC](&unk_23C139C38, &type metadata for DeviceType.TabletCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21A48);
  }
  return result;
}

unint64_t sub_23C10299C()
{
  unint64_t result;

  result = qword_256B21A50;
  if (!qword_256B21A50)
  {
    result = MEMORY[0x2426179DC](&unk_23C139BC0, &type metadata for DeviceType.TvCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21A50);
  }
  return result;
}

unint64_t sub_23C1029E4()
{
  unint64_t result;

  result = qword_256B21A58;
  if (!qword_256B21A58)
  {
    result = MEMORY[0x2426179DC](&unk_23C139BE8, &type metadata for DeviceType.TvCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21A58);
  }
  return result;
}

unint64_t sub_23C102A2C()
{
  unint64_t result;

  result = qword_256B21A60;
  if (!qword_256B21A60)
  {
    result = MEMORY[0x2426179DC](&unk_23C139D00, &type metadata for DeviceType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21A60);
  }
  return result;
}

unint64_t sub_23C102A74()
{
  unint64_t result;

  result = qword_256B21A68;
  if (!qword_256B21A68)
  {
    result = MEMORY[0x2426179DC](&unk_23C139D28, &type metadata for DeviceType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21A68);
  }
  return result;
}

BOOL static ForYouError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ForYouError.hash(into:)()
{
  return sub_23C1392FC();
}

uint64_t ForYouError.hashValue.getter()
{
  sub_23C1392F0();
  sub_23C1392FC();
  return sub_23C139320();
}

unint64_t sub_23C102B50()
{
  unint64_t result;

  result = qword_256B21AA0;
  if (!qword_256B21AA0)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for ForYouError, &type metadata for ForYouError);
    atomic_store(result, (unint64_t *)&qword_256B21AA0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ForYouError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ForYouError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C102C80 + 4 * byte_23C139F95[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C102CB4 + 4 * byte_23C139F90[v4]))();
}

uint64_t sub_23C102CB4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C102CBC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C102CC4);
  return result;
}

uint64_t sub_23C102CD0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C102CD8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C102CDC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C102CE4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ForYouError()
{
  return &type metadata for ForYouError;
}

__n128 ForYouEnvironment.init(fetchSectionDescriptors:makeAchievementEnvironmentCacheUpdatedStream:makeActiveWorkoutPlanUpdatedStream:makeAllowedContentRatingsUpdatedStream:makeAppDidBecomeActiveStream:makeCatalogDeletedStream:makeContentAvailabilityStream:makeOnboardingSurveyResultsUpdatedStream:makePersonalizationPrivacyPreferenceUpdatedStream:makeSignificantTimeChangeStream:makeWheelchairStatusUpdatedStream:navigateToExplore:presentToastIfNeeded:queryActiveParticipantDeviceType:reloadCanvas:requirePersonalizationSupported:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __int128 a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14, __int128 a15, __int128 a16, __int128 a17, __int128 a18, __int128 a19, __n128 a20,uint64_t a21,uint64_t a22)
{
  __n128 result;

  result = a20;
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(_OWORD *)(a9 + 64) = a10;
  *(_OWORD *)(a9 + 80) = a11;
  *(_OWORD *)(a9 + 96) = a12;
  *(_OWORD *)(a9 + 112) = a13;
  *(_OWORD *)(a9 + 128) = a14;
  *(_OWORD *)(a9 + 144) = a15;
  *(_OWORD *)(a9 + 160) = a16;
  *(_OWORD *)(a9 + 176) = a17;
  *(_OWORD *)(a9 + 192) = a18;
  *(_OWORD *)(a9 + 208) = a19;
  *(__n128 *)(a9 + 224) = a20;
  *(_QWORD *)(a9 + 240) = a21;
  *(_QWORD *)(a9 + 248) = a22;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for AwardCanvasPlaceholder(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ForYouEnvironment()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for ForYouEnvironment(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  v3 = *(_QWORD *)(a2 + 248);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 248) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for ForYouEnvironment(_QWORD *a1, _QWORD *a2)
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
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_retain();
  swift_release();
  v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_retain();
  swift_release();
  v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  swift_retain();
  swift_release();
  v11 = a2[15];
  a1[14] = a2[14];
  a1[15] = v11;
  swift_retain();
  swift_release();
  v12 = a2[17];
  a1[16] = a2[16];
  a1[17] = v12;
  swift_retain();
  swift_release();
  v13 = a2[19];
  a1[18] = a2[18];
  a1[19] = v13;
  swift_retain();
  swift_release();
  v14 = a2[21];
  a1[20] = a2[20];
  a1[21] = v14;
  swift_retain();
  swift_release();
  v15 = a2[23];
  a1[22] = a2[22];
  a1[23] = v15;
  swift_retain();
  swift_release();
  v16 = a2[25];
  a1[24] = a2[24];
  a1[25] = v16;
  swift_retain();
  swift_release();
  v17 = a2[27];
  a1[26] = a2[26];
  a1[27] = v17;
  swift_retain();
  swift_release();
  v18 = a2[29];
  a1[28] = a2[28];
  a1[29] = v18;
  swift_retain();
  swift_release();
  v19 = a2[31];
  a1[30] = a2[30];
  a1[31] = v19;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy256_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __n128 result;
  __int128 v12;
  __int128 v13;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  v5 = a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  v8 = a2[8];
  v9 = a2[9];
  v10 = a2[11];
  *(_OWORD *)(a1 + 160) = a2[10];
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  result = (__n128)a2[12];
  v12 = a2[13];
  v13 = a2[15];
  *(_OWORD *)(a1 + 224) = a2[14];
  *(_OWORD *)(a1 + 240) = v13;
  *(__n128 *)(a1 + 192) = result;
  *(_OWORD *)(a1 + 208) = v12;
  return result;
}

_OWORD *assignWithTake for ForYouEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  a1[4] = a2[4];
  swift_release();
  a1[5] = a2[5];
  swift_release();
  a1[6] = a2[6];
  swift_release();
  a1[7] = a2[7];
  swift_release();
  a1[8] = a2[8];
  swift_release();
  a1[9] = a2[9];
  swift_release();
  a1[10] = a2[10];
  swift_release();
  a1[11] = a2[11];
  swift_release();
  a1[12] = a2[12];
  swift_release();
  a1[13] = a2[13];
  swift_release();
  a1[14] = a2[14];
  swift_release();
  a1[15] = a2[15];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ForYouEnvironment(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 256))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ForYouEnvironment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 248) = 0;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
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
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 256) = 1;
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
    *(_BYTE *)(result + 256) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouEnvironment()
{
  return &type metadata for ForYouEnvironment;
}

uint64_t DisplayStyle.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C1033E8 + 4 * byte_23C13A0C4[a1]))(0xD000000000000018, 0x800000023C1401C0);
}

uint64_t sub_23C1033E8()
{
  return 0x736472617761;
}

uint64_t sub_23C1033FC()
{
  return 0x6972427472616863;
}

uint64_t sub_23C103578(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = DisplayStyle.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == DisplayStyle.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_23C139284();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23C103600@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s13FitnessForYou12DisplayStyleO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_23C10362C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = DisplayStyle.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23C103654()
{
  sub_23C1039E4();
  return sub_23C13902C();
}

uint64_t sub_23C1036B0()
{
  sub_23C1039E4();
  return sub_23C139020();
}

uint64_t sub_23C1036FC()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_23C1392F0();
  DisplayStyle.rawValue.getter(v1);
  sub_23C139008();
  swift_bridgeObjectRelease();
  return sub_23C139320();
}

uint64_t sub_23C10375C()
{
  unsigned __int8 *v0;

  DisplayStyle.rawValue.getter(*v0);
  sub_23C139008();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C10379C()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_23C1392F0();
  DisplayStyle.rawValue.getter(v1);
  sub_23C139008();
  swift_bridgeObjectRelease();
  return sub_23C139320();
}

uint64_t _s13FitnessForYou12DisplayStyleO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_23C139188();
  swift_bridgeObjectRelease();
  if (v0 >= 0x10)
    return 16;
  else
    return v0;
}

unint64_t sub_23C103844()
{
  unint64_t result;

  result = qword_256B21AA8;
  if (!qword_256B21AA8)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for DisplayStyle, &type metadata for DisplayStyle);
    atomic_store(result, (unint64_t *)&qword_256B21AA8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DisplayStyle(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF1)
    goto LABEL_17;
  if (a2 + 15 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 15) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 15;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 15;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 15;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x10;
  v8 = v6 - 16;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DisplayStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 15 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 15) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF1)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF0)
    return ((uint64_t (*)(void))((char *)&loc_23C103964 + 4 * byte_23C13A0D9[v4]))();
  *a1 = a2 + 15;
  return ((uint64_t (*)(void))((char *)sub_23C103998 + 4 * byte_23C13A0D4[v4]))();
}

uint64_t sub_23C103998(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1039A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1039A8);
  return result;
}

uint64_t sub_23C1039B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1039BCLL);
  *(_BYTE *)result = a2 + 15;
  return result;
}

uint64_t sub_23C1039C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1039C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DisplayStyle()
{
  return &type metadata for DisplayStyle;
}

unint64_t sub_23C1039E4()
{
  unint64_t result;

  result = qword_256B21AB0;
  if (!qword_256B21AB0)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for DisplayStyle, &type metadata for DisplayStyle);
    atomic_store(result, (unint64_t *)&qword_256B21AB0);
  }
  return result;
}

void __swiftcall SectionDescriptors.init(awardDescriptors:forYouDescriptors:recoId:requestStartTime:responseEndTime:)(FitnessForYou::SectionDescriptors *__return_ptr retstr, Swift::OpaquePointer awardDescriptors, Swift::OpaquePointer forYouDescriptors, Swift::String recoId, Swift::Double requestStartTime, Swift::Double responseEndTime)
{
  retstr->awardDescriptors = awardDescriptors;
  retstr->forYouDescriptors = forYouDescriptors;
  retstr->recoId = recoId;
  retstr->requestStartTime = requestStartTime;
  retstr->responseEndTime = responseEndTime;
}

uint64_t sub_23C103A38(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C103A70 + 4 * byte_23C13A1F0[a1]))(0xD000000000000010, 0x800000023C1403F0);
}

uint64_t sub_23C103A70(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_23C103AA8()
{
  return 0x65736E6F70736572;
}

uint64_t sub_23C103ACC()
{
  unsigned __int8 *v0;

  return sub_23C103A38(*v0);
}

uint64_t sub_23C103AD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C105208(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C103AF8(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_23C103B04()
{
  sub_23C103D90();
  return sub_23C139350();
}

uint64_t sub_23C103B2C()
{
  sub_23C103D90();
  return sub_23C13935C();
}

uint64_t SectionDescriptors.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];
  uint64_t v12;
  char v13;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21AB8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v11[1] = v1[2];
  v12 = v8;
  v11[0] = v1[3];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C103D90();
  sub_23C139338();
  v14 = v9;
  v13 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B21AC8);
  sub_23C104248(&qword_256B21AD0, &qword_256B21AC8, (uint64_t (*)(void))sub_23C103E18, MEMORY[0x24BEE12A0]);
  sub_23C139278();
  if (!v2)
  {
    v14 = v12;
    v13 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B21AE0);
    sub_23C104248(&qword_256B21AE8, &qword_256B21AE0, (uint64_t (*)(void))sub_23C103E5C, MEMORY[0x24BEE12A0]);
    sub_23C139278();
    LOBYTE(v14) = 2;
    sub_23C139248();
    LOBYTE(v14) = 3;
    sub_23C139260();
    LOBYTE(v14) = 4;
    sub_23C139260();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23C103D90()
{
  unint64_t result;

  result = qword_256B21AC0;
  if (!qword_256B21AC0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13A3A8, &type metadata for SectionDescriptors.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21AC0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426179D0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23C103E18()
{
  unint64_t result;

  result = qword_256B21AD8;
  if (!qword_256B21AD8)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for AwardCanvasSectionDescriptor, &type metadata for AwardCanvasSectionDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B21AD8);
  }
  return result;
}

unint64_t sub_23C103E5C()
{
  unint64_t result;

  result = qword_256B21AF0;
  if (!qword_256B21AF0)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for CanvasSectionDescriptor, &type metadata for CanvasSectionDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B21AF0);
  }
  return result;
}

uint64_t SectionDescriptors.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  char v22;
  uint64_t v23;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21AF8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C103D90();
  sub_23C13932C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B21AC8);
  v22 = 0;
  sub_23C104248(&qword_256B21B00, &qword_256B21AC8, (uint64_t (*)(void))sub_23C104204, MEMORY[0x24BEE12D0]);
  sub_23C139200();
  v9 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B21AE0);
  v22 = 1;
  sub_23C104248(&qword_256B21B10, &qword_256B21AE0, (uint64_t (*)(void))sub_23C1042AC, MEMORY[0x24BEE12D0]);
  swift_bridgeObjectRetain();
  sub_23C139200();
  v20 = v9;
  v10 = v23;
  LOBYTE(v23) = 2;
  swift_bridgeObjectRetain();
  v19 = sub_23C1391D0();
  LOBYTE(v23) = 3;
  v21 = v11;
  swift_bridgeObjectRetain();
  sub_23C1391E8();
  v13 = v12;
  LOBYTE(v23) = 4;
  sub_23C1391E8();
  v16 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v17 = v19;
  *a2 = v20;
  a2[1] = v10;
  v18 = v21;
  a2[2] = v17;
  a2[3] = v18;
  a2[4] = v13;
  a2[5] = v16;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_23C104204()
{
  unint64_t result;

  result = qword_256B21B08;
  if (!qword_256B21B08)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for AwardCanvasSectionDescriptor, &type metadata for AwardCanvasSectionDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B21B08);
  }
  return result;
}

uint64_t sub_23C104248(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x2426179DC](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C1042AC()
{
  unint64_t result;

  result = qword_256B21B18;
  if (!qword_256B21B18)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for CanvasSectionDescriptor, &type metadata for CanvasSectionDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B21B18);
  }
  return result;
}

uint64_t sub_23C1042F0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return SectionDescriptors.init(from:)(a1, a2);
}

uint64_t sub_23C104304(_QWORD *a1)
{
  return SectionDescriptors.encode(to:)(a1);
}

uint64_t SectionDescriptors.hash(into:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *v1;
  v3 = v1[1];
  swift_bridgeObjectRetain();
  sub_23C104BC8(a1, v4);
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v3 + 16);
  sub_23C1392FC();
  if (v5)
  {
    swift_bridgeObjectRetain();
    v6 = 0;
    do
    {
      CanvasSectionDescriptor.hash(into:)(a1);
      v6 += 104;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_23C139008();
  swift_bridgeObjectRelease();
  sub_23C139314();
  return sub_23C139314();
}

uint64_t SectionDescriptors.hashValue.getter()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v1 = *((_QWORD *)v0 + 2);
  v2 = *((_QWORD *)v0 + 3);
  v5 = *v0;
  v6 = v1;
  v7 = v2;
  v8 = v0[2];
  sub_23C1392F0();
  SectionDescriptors.hash(into:)((uint64_t)v4);
  return sub_23C139320();
}

uint64_t sub_23C10449C()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v1 = *((_QWORD *)v0 + 2);
  v2 = *((_QWORD *)v0 + 3);
  v5 = *v0;
  v6 = v1;
  v7 = v2;
  v8 = v0[2];
  sub_23C1392F0();
  SectionDescriptors.hash(into:)((uint64_t)v4);
  return sub_23C139320();
}

uint64_t sub_23C1044F8()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v1 = *((_QWORD *)v0 + 2);
  v2 = *((_QWORD *)v0 + 3);
  v5 = *v0;
  v6 = v1;
  v7 = v2;
  v8 = v0[2];
  sub_23C1392F0();
  SectionDescriptors.hash(into:)((uint64_t)v4);
  return sub_23C139320();
}

uint64_t sub_23C104550(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  unsigned __int8 *v5;
  int v6;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_23C1392FC();
  if (v3)
  {
    v5 = (unsigned __int8 *)(a2 + 64);
    do
    {
      v6 = *v5;
      swift_bridgeObjectRetain();
      sub_23C139008();
      sub_23C139008();
      swift_bridgeObjectRelease();
      sub_23C139308();
      if (v6 != 1)
        sub_23C139314();
      result = swift_bridgeObjectRelease();
      v5 += 40;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_23C10463C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[7];
  uint64_t v11;

  v10[4] = *(_QWORD *)(sub_23C138BC4() - 8);
  MEMORY[0x24BDAC7A8]();
  type metadata accessor for PlanMetadata();
  MEMORY[0x24BDAC7A8]();
  v11 = type metadata accessor for CanvasPlaceholder();
  v3 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a2 + 16);
  result = sub_23C1392FC();
  if (v6)
  {
    v8 = a2 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v9 = *(_QWORD *)(v3 + 72);
    v10[5] = "k";
    v10[6] = v9;
    v10[1] = "smallDynamicBrick";
    v10[2] = "arketing";
    v10[3] = 0x800000023C1402E0;
    sub_23C100138(v8, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for CanvasPlaceholder);
    swift_bridgeObjectRetain();
    sub_23C139008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_23C139008();
    swift_bridgeObjectRelease();
    if (*((_QWORD *)v5 + 5))
    {
      sub_23C139308();
      swift_bridgeObjectRetain();
      sub_23C139008();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_23C139308();
    }
    if (v5[48] == 2)
    {
      sub_23C139308();
    }
    else
    {
      sub_23C139308();
      sub_23C139008();
      swift_bridgeObjectRelease();
    }
    sub_23C139008();
    swift_bridgeObjectRelease();
    __asm { BR              X9 }
  }
  return result;
}

uint64_t sub_23C104BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t *v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 16);
  result = sub_23C1392FC();
  if (v4)
  {
    v6 = (uint64_t *)(a2 + 64);
    do
    {
      v7 = *v6;
      v6 += 5;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23C139008();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_23C139008();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_23C104550(a1, v7);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease_n();
      --v4;
    }
    while (v4);
  }
  return result;
}

BOOL _s13FitnessForYou18SectionDescriptorsV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  _BOOL8 result;
  char v13;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v6 = *(double *)(a1 + 32);
  v5 = *(double *)(a1 + 40);
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a2 + 24);
  v11 = *(double *)(a2 + 32);
  v10 = *(double *)(a2 + 40);
  if ((sub_23C12BD9C(*(_QWORD *)a1, *(_QWORD *)a2) & 1) == 0 || (sub_23C12BA24(v2, v7) & 1) == 0)
    return 0;
  if (v3 == v8 && v4 == v9)
  {
    if (v6 != v11)
      return 0;
    return v5 == v10;
  }
  v13 = sub_23C139284();
  result = 0;
  if ((v13 & 1) != 0 && v6 == v11)
    return v5 == v10;
  return result;
}

unint64_t sub_23C104D74()
{
  unint64_t result;

  result = qword_256B21B20;
  if (!qword_256B21B20)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for SectionDescriptors, &type metadata for SectionDescriptors);
    atomic_store(result, (unint64_t *)&qword_256B21B20);
  }
  return result;
}

uint64_t destroy for SectionDescriptors()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SectionDescriptors(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SectionDescriptors(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for SectionDescriptors(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SectionDescriptors(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SectionDescriptors(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SectionDescriptors()
{
  return &type metadata for SectionDescriptors;
}

uint64_t getEnumTagSinglePayload for PersonalizationInferenceRequestTrigger(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SectionDescriptors.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1050B0 + 4 * byte_23C13A20A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23C1050E4 + 4 * byte_23C13A205[v4]))();
}

uint64_t sub_23C1050E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1050EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1050F4);
  return result;
}

uint64_t sub_23C105100(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C105108);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23C10510C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C105114(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SectionDescriptors.CodingKeys()
{
  return &type metadata for SectionDescriptors.CodingKeys;
}

unint64_t sub_23C105134()
{
  unint64_t result;

  result = qword_256B21B28;
  if (!qword_256B21B28)
  {
    result = MEMORY[0x2426179DC](&unk_23C13A380, &type metadata for SectionDescriptors.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21B28);
  }
  return result;
}

unint64_t sub_23C10517C()
{
  unint64_t result;

  result = qword_256B21B30;
  if (!qword_256B21B30)
  {
    result = MEMORY[0x2426179DC](&unk_23C13A2F0, &type metadata for SectionDescriptors.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21B30);
  }
  return result;
}

unint64_t sub_23C1051C4()
{
  unint64_t result;

  result = qword_256B21B38;
  if (!qword_256B21B38)
  {
    result = MEMORY[0x2426179DC](&unk_23C13A318, &type metadata for SectionDescriptors.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21B38);
  }
  return result;
}

uint64_t sub_23C105208(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x800000023C1403F0 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C140410 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64496F636572 && a2 == 0xE600000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023C140430 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x65736E6F70736572 && a2 == 0xEF656D6954646E45)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v5 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

unint64_t sub_23C105414()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B218E8;
  if (!qword_256B218E8)
  {
    v1 = sub_23C138BC4();
    result = MEMORY[0x2426179DC](MEMORY[0x24BDCEA88], v1);
    atomic_store(result, (unint64_t *)&qword_256B218E8);
  }
  return result;
}

uint64_t PersonalizationInferenceRequestTrigger.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C105498 + 4 * byte_23C13A490[a1]))(0xD000000000000011, 0x800000023C140280);
}

uint64_t sub_23C105498()
{
  return 0x6E65704F707061;
}

uint64_t sub_23C1054B0()
{
  return 0x6F54736472617761;
}

uint64_t sub_23C1054D0()
{
  return 0x44676F6C61746163;
}

uint64_t sub_23C1054F4()
{
  return 0x616470556E616C70;
}

uint64_t sub_23C105514(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = PersonalizationInferenceRequestTrigger.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == PersonalizationInferenceRequestTrigger.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_23C139284();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23C10559C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s13FitnessForYou38PersonalizationInferenceRequestTriggerO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_23C1055C8@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = PersonalizationInferenceRequestTrigger.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23C1055F0()
{
  sub_23C1058F0();
  return sub_23C13902C();
}

uint64_t sub_23C10564C()
{
  sub_23C1058F0();
  return sub_23C139020();
}

uint64_t sub_23C105698()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_23C1392F0();
  PersonalizationInferenceRequestTrigger.rawValue.getter(v1);
  sub_23C139008();
  swift_bridgeObjectRelease();
  return sub_23C139320();
}

uint64_t sub_23C1056F8()
{
  unsigned __int8 *v0;

  PersonalizationInferenceRequestTrigger.rawValue.getter(*v0);
  sub_23C139008();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C105738()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_23C1392F0();
  PersonalizationInferenceRequestTrigger.rawValue.getter(v1);
  sub_23C139008();
  swift_bridgeObjectRelease();
  return sub_23C139320();
}

uint64_t _s13FitnessForYou38PersonalizationInferenceRequestTriggerO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_23C139188();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

unint64_t sub_23C1057E0()
{
  unint64_t result;

  result = qword_256B21B40;
  if (!qword_256B21B40)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for PersonalizationInferenceRequestTrigger, &type metadata for PersonalizationInferenceRequestTrigger);
    atomic_store(result, (unint64_t *)&qword_256B21B40);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for PersonalizationInferenceRequestTrigger(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C105870 + 4 * byte_23C13A49A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23C1058A4 + 4 * byte_23C13A495[v4]))();
}

uint64_t sub_23C1058A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1058AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1058B4);
  return result;
}

uint64_t sub_23C1058C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1058C8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23C1058CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1058D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PersonalizationInferenceRequestTrigger()
{
  return &type metadata for PersonalizationInferenceRequestTrigger;
}

unint64_t sub_23C1058F0()
{
  unint64_t result;

  result = qword_256B21B48;
  if (!qword_256B21B48)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for PersonalizationInferenceRequestTrigger, &type metadata for PersonalizationInferenceRequestTrigger);
    atomic_store(result, (unint64_t *)&qword_256B21B48);
  }
  return result;
}

uint64_t ForYouToastView.init(store:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)a3 = sub_23C1059B4;
  *(_QWORD *)(a3 + 8) = result;
  *(_BYTE *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0x4034000000000000;
  return result;
}

uint64_t sub_23C105990()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C1059B4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t ForYouToastView.body.getter@<X0>(uint64_t a1@<X8>)
{
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
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  _BYTE *v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t KeyPath;
  uint64_t v42;
  _BYTE *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  _OWORD *v48;
  _BYTE *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  char v67;
  unint64_t v68;
  _BYTE *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t OpaqueTypeConformance2;
  uint64_t v74;
  _BYTE *v75;
  uint64_t v76;
  _BYTE *v77;
  uint64_t v78;
  _BYTE *v79;
  uint64_t v80;
  _BYTE *v81;
  uint64_t v82;
  uint64_t v83;
  _BYTE *v84;
  _BYTE v86[4];
  int v87;
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
  int v99;
  int v100;
  _BYTE *v101;
  _BYTE *v102;
  _BYTE *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  _BYTE *v108;
  uint64_t v109;
  int v110;
  uint64_t v111;
  uint64_t v112;
  _BYTE *v113;
  uint64_t v114;
  _BYTE *v115;
  uint64_t v116;
  uint64_t v117;
  _BYTE *v118;
  _BYTE *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  _BYTE *v125;
  _BYTE *v126;
  _BYTE *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  _BYTE *v136;
  uint64_t v137;
  unint64_t v138;
  char v139;
  char v140;
  char v141;
  char v142;
  char v143;
  _OWORD v144[19];
  uint64_t v145;
  char v146;
  uint64_t v147;
  char v148;
  uint64_t v149;
  char v150;
  uint64_t v151;
  char v152;
  uint64_t v153;
  char v154;
  uint64_t v155;
  char v156;
  __int128 v157;

  v133 = a1;
  v128 = sub_23C138D50();
  MEMORY[0x24BDAC7A8](v128);
  v126 = &v86[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = sub_23C138C54();
  v4 = *(_QWORD *)(v3 - 8);
  v129 = v3;
  v130 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v125 = &v86[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21B50);
  v7 = *(_QWORD *)(v6 - 8);
  v131 = v6;
  v132 = v7;
  MEMORY[0x24BDAC7A8](v6);
  v127 = &v86[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v120 = sub_23C138CB4();
  MEMORY[0x24BDAC7A8](v120);
  v119 = &v86[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_23C138C24();
  v116 = *(_QWORD *)(v10 - 8);
  v117 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v115 = &v86[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21B58);
  MEMORY[0x24BDAC7A8](v107);
  v101 = &v86[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = sub_23C138F18();
  v105 = *(_QWORD *)(v13 - 8);
  v106 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v102 = &v86[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21B60);
  MEMORY[0x24BDAC7A8](v104);
  v103 = &v86[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21B68);
  MEMORY[0x24BDAC7A8](v109);
  v108 = &v86[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21B70);
  MEMORY[0x24BDAC7A8](v114);
  v113 = &v86[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21B78);
  v19 = *(_QWORD *)(v18 - 8);
  v121 = v18;
  v122 = v19;
  MEMORY[0x24BDAC7A8](v18);
  v118 = &v86[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21B80);
  v22 = *(_QWORD *)(v21 - 8);
  v123 = v21;
  v124 = v22;
  MEMORY[0x24BDAC7A8](v21);
  v136 = &v86[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v24 = *v1;
  v111 = v1[1];
  v112 = v24;
  v110 = *((unsigned __int8 *)v1 + 16);
  v25 = v1[3];
  v93 = sub_23C138D08();
  sub_23C106380((uint64_t)v144);
  v91 = *((_QWORD *)&v144[0] + 1);
  v92 = *(_QWORD *)&v144[0];
  LOBYTE(v24) = v144[1];
  v88 = *((_QWORD *)&v144[1] + 1);
  v26 = BYTE8(v144[2]);
  v134 = *((_QWORD *)&v144[3] + 1);
  v27 = *(_QWORD *)&v144[3];
  v135 = *(_QWORD *)&v144[2];
  v28 = *(_QWORD *)&v144[4];
  v94 = *(_QWORD *)&v144[3];
  v95 = *(_QWORD *)&v144[4];
  v29 = BYTE8(v144[4]);
  v99 = BYTE8(v144[2]);
  v100 = BYTE8(v144[4]);
  v30 = v144[5];
  v97 = *((_QWORD *)&v144[5] + 1);
  v98 = *(_QWORD *)&v144[5];
  v31 = *(_QWORD *)&v144[6];
  v96 = *(_QWORD *)&v144[6];
  v89 = *(_QWORD *)&v144[7];
  v90 = *((_QWORD *)&v144[6] + 1);
  v87 = sub_23C138D80();
  sub_23C138F24();
  v142 = 1;
  v141 = v24;
  v140 = v26;
  v139 = v29;
  v32 = v26;
  v33 = v139;
  v143 = 1;
  sub_23C138CC0();
  v144[0] = (unint64_t)v93;
  LOBYTE(v144[1]) = 1;
  *((_QWORD *)&v144[1] + 1) = v92;
  *(_QWORD *)&v144[2] = v91;
  BYTE8(v144[2]) = v24;
  v34 = v88;
  *(_QWORD *)&v144[3] = v88;
  *((_QWORD *)&v144[3] + 1) = v135;
  LOBYTE(v144[4]) = v32;
  *((_QWORD *)&v144[4] + 1) = v27;
  *(_QWORD *)&v144[5] = v134;
  *((_QWORD *)&v144[5] + 1) = v28;
  LOBYTE(v144[6]) = v33;
  *(_OWORD *)((char *)&v144[6] + 8) = v30;
  *((_QWORD *)&v144[7] + 1) = v31;
  *(_QWORD *)&v144[8] = v90;
  *((_QWORD *)&v144[8] + 1) = v89;
  LOBYTE(v144[9]) = v87;
  *(_OWORD *)((char *)&v144[10] + 8) = 0u;
  *(_OWORD *)((char *)&v144[9] + 8) = 0u;
  BYTE8(v144[11]) = v143;
  *(_QWORD *)&v144[12] = v145;
  BYTE8(v144[12]) = v146;
  *(_QWORD *)&v144[13] = v147;
  BYTE8(v144[13]) = v148;
  *(_QWORD *)&v144[14] = v149;
  BYTE8(v144[14]) = v150;
  *(_QWORD *)&v144[15] = v151;
  BYTE8(v144[15]) = v152;
  *(_QWORD *)&v144[16] = v153;
  BYTE8(v144[16]) = v154;
  *(_QWORD *)&v144[17] = v155;
  BYTE8(v144[17]) = v156;
  v144[18] = v157;
  v35 = v102;
  sub_23C138F0C();
  v36 = sub_23C138D80();
  v38 = v105;
  v37 = v106;
  v39 = (uint64_t)v101;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v105 + 16))(v101, v35, v106);
  *(_BYTE *)(v39 + *(int *)(v107 + 36)) = v36;
  v40 = v103;
  sub_23C106BC4(v39, (uint64_t)&v103[*(int *)(v104 + 36)], &qword_256B21B58);
  memcpy(v40, v144, 0x130uLL);
  sub_23C106564((uint64_t)v144);
  sub_23C106ED8(v39, &qword_256B21B58);
  (*(void (**)(_BYTE *, uint64_t))(v38 + 8))(v35, v37);
  sub_23C10661C(v34, v135, v99);
  swift_bridgeObjectRelease();
  sub_23C10661C(v134, v95, v100);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  KeyPath = swift_getKeyPath();
  v43 = v115;
  v42 = v116;
  v44 = v117;
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v116 + 104))(v115, *MEMORY[0x24BDEB3F0], v117);
  v45 = (uint64_t)v108;
  v46 = (uint64_t *)&v108[*(int *)(v109 + 36)];
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21B88);
  (*(void (**)(char *, _BYTE *, uint64_t))(v42 + 16))((char *)v46 + *(int *)(v47 + 28), v43, v44);
  *v46 = KeyPath;
  sub_23C106BC4((uint64_t)v40, v45, &qword_256B21B60);
  (*(void (**)(_BYTE *, uint64_t))(v42 + 8))(v43, v44);
  sub_23C106ED8((uint64_t)v40, &qword_256B21B60);
  v48 = v119;
  v49 = &v119[*(int *)(v120 + 20)];
  v50 = *MEMORY[0x24BDEEB68];
  v51 = sub_23C138D14();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 104))(v49, v50, v51);
  __asm { FMOV            V0.2D, #14.0 }
  v57 = (uint64_t)v48;
  *v48 = _Q0;
  v59 = (uint64_t)v113;
  v58 = v114;
  v60 = (uint64_t)&v113[*(int *)(v114 + 36)];
  sub_23C106B80(v57, v60);
  *(_WORD *)(v60 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B21B90) + 36)) = 256;
  v61 = v59;
  sub_23C106BC4(v45, v59, &qword_256B21B68);
  sub_23C106C08(v57);
  sub_23C106ED8(v45, &qword_256B21B68);
  v62 = swift_allocObject();
  v63 = v111;
  v64 = v112;
  *(_QWORD *)(v62 + 16) = v112;
  *(_QWORD *)(v62 + 24) = v63;
  v65 = v110;
  *(_BYTE *)(v62 + 32) = v110;
  *(_QWORD *)(v62 + 40) = v25;
  v66 = v63;
  v67 = v65;
  sub_23C106C54();
  v68 = sub_23C106C5C();
  v69 = v118;
  sub_23C138E04();
  swift_release();
  sub_23C106ED8(v61, &qword_256B21B70);
  v70 = swift_allocObject();
  *(_QWORD *)(v70 + 16) = v64;
  *(_QWORD *)(v70 + 24) = v66;
  v71 = v66;
  LOBYTE(v66) = v67;
  *(_BYTE *)(v70 + 32) = v67;
  *(_QWORD *)(v70 + 40) = v25;
  v72 = v71;
  sub_23C106C54();
  v137 = v58;
  v138 = v68;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v74 = v121;
  sub_23C138E1C();
  swift_release();
  v75 = v69;
  v76 = v74;
  (*(void (**)(_BYTE *, uint64_t))(v122 + 8))(v75, v74);
  sub_23C138D74();
  v77 = v125;
  sub_23C138C30();
  v78 = swift_allocObject();
  *(_QWORD *)(v78 + 16) = v64;
  *(_QWORD *)(v78 + 24) = v72;
  *(_BYTE *)(v78 + 32) = v66;
  *(_QWORD *)(v78 + 40) = v25;
  sub_23C106C54();
  sub_23C107124();
  v79 = v127;
  v80 = v129;
  sub_23C138F00();
  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v130 + 8))(v77, v80);
  sub_23C138C60();
  v137 = v76;
  v138 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_23C107448(&qword_256B21C00, &qword_256B21B50, MEMORY[0x24BDEC410]);
  v81 = v79;
  v82 = v123;
  v83 = v131;
  v84 = v136;
  sub_23C138E4C();
  (*(void (**)(_BYTE *, uint64_t))(v132 + 8))(v81, v83);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v124 + 8))(v84, v82);
}

uint64_t sub_23C106380@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t KeyPath;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24[2];
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 v29;
  uint64_t v30;

  v2 = sub_23C138E7C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_23C138D20();
  sub_23C10662C(v24);
  v6 = v24[0];
  v7 = v24[1];
  v8 = v25;
  v9 = v26;
  v10 = v27;
  v11 = v28;
  v21 = v29;
  v22 = v30;
  v20 = sub_23C138EB8();
  v19 = sub_23C138D8C();
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDF3C28], v2);
  v12 = MEMORY[0x242617280](v5, 0.650980392, 1.0, 0.0, 1.0);
  v13 = v22;
  *(_QWORD *)a1 = v23;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  LOBYTE(v3) = v21;
  *(_BYTE *)(a1 + 72) = v21;
  v14 = v20;
  *(_QWORD *)(a1 + 80) = v13;
  *(_QWORD *)(a1 + 88) = v14;
  v15 = v19;
  *(_QWORD *)(a1 + 96) = KeyPath;
  *(_QWORD *)(a1 + 104) = v15;
  *(_QWORD *)(a1 + 112) = v12;
  sub_23C10660C(v6, v7, v8);
  swift_bridgeObjectRetain();
  sub_23C10660C(v10, v11, v3);
  swift_bridgeObjectRetain();
  sub_23C10661C(v6, v7, v8);
  swift_bridgeObjectRelease();
  sub_23C10661C(v10, v11, v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C106564(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 80);
  v3 = *(_QWORD *)(a1 + 88);
  v4 = *(_BYTE *)(a1 + 96);
  sub_23C10660C(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 64));
  swift_bridgeObjectRetain();
  sub_23C10660C(v2, v3, v4);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23C10660C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_23C10661C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_23C10662C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  char v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v40[5];
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;

  v48 = a1;
  v1 = sub_23C138E7C();
  v45 = *(_QWORD *)(v1 - 8);
  v46 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v47 = (char *)v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23C138BDC();
  MEMORY[0x24BDAC7A8](v3);
  v4 = sub_23C138FD8();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C138FCC();
  if (qword_256B21878 != -1)
    swift_once();
  v7 = (id)qword_256B2FCE8;
  sub_23C106C54();
  v40[4] = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21C08);
  v40[3] = sub_23C107448(&qword_256B21C10, &qword_256B21C08, MEMORY[0x24BE2B5E8]);
  sub_23C138C6C();
  sub_23C106C48();
  swift_getKeyPath();
  sub_23C138F9C();
  swift_release();
  swift_release();
  v49 = sub_23C138FFC();
  v50 = v8;
  v40[2] = sub_23C1074D8();
  v9 = sub_23C138DD4();
  v40[1] = v6;
  v11 = v10;
  v13 = v12 & 1;
  sub_23C138DB0();
  sub_23C138D98();
  sub_23C138DA4();
  swift_release();
  v14 = sub_23C138DC8();
  v43 = v15;
  v44 = v14;
  v42 = v16;
  v18 = v17;
  swift_release();
  v41 = v18 & 1;
  sub_23C10661C(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_23C138FCC();
  v19 = (void *)qword_256B2FCE8;
  sub_23C106C54();
  v20 = v19;
  sub_23C138C6C();
  sub_23C106C48();
  swift_getKeyPath();
  sub_23C138F9C();
  swift_release();
  swift_release();
  v49 = sub_23C138FFC();
  v50 = v21;
  v22 = sub_23C138DD4();
  v24 = v23;
  LOBYTE(v11) = v25 & 1;
  v26 = v47;
  (*(void (**)(char *, _QWORD, uint64_t))(v45 + 104))(v47, *MEMORY[0x24BDF3C28], v46);
  v49 = MEMORY[0x242617280](v26, 0.650980392, 1.0, 0.0, 1.0);
  v27 = sub_23C138DBC();
  v29 = v28;
  v31 = v30;
  v33 = v32 & 1;
  sub_23C10661C(v22, v24, v11);
  swift_release();
  swift_bridgeObjectRelease();
  v34 = v41;
  LOBYTE(v49) = v41;
  v35 = v48;
  v36 = v43;
  v37 = v44;
  v38 = v42;
  *v48 = v44;
  v35[1] = v38;
  *((_BYTE *)v35 + 16) = v34;
  v35[3] = v36;
  v35[4] = v27;
  v35[5] = v29;
  *((_BYTE *)v35 + 48) = v33;
  v35[7] = v31;
  sub_23C10660C(v37, v38, v34);
  swift_bridgeObjectRetain();
  sub_23C10660C(v27, v29, v33);
  swift_bridgeObjectRetain();
  sub_23C10661C(v27, v29, v33);
  swift_bridgeObjectRelease();
  sub_23C10661C(v37, v38, v49);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C106AE0()
{
  return sub_23C138CCC();
}

uint64_t sub_23C106B00(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_23C138C24();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_23C138CD8();
}

uint64_t sub_23C106B80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C138CB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C106BC4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23C106C08(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23C138CB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C106C48()
{
  return swift_release();
}

uint64_t sub_23C106C54()
{
  return swift_retain();
}

unint64_t sub_23C106C5C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B21B98;
  if (!qword_256B21B98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B21B70);
    v2[0] = sub_23C106CE0();
    v2[1] = sub_23C107448(&qword_256B21BF0, &qword_256B21B90, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B21B98);
  }
  return result;
}

unint64_t sub_23C106CE0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B21BA0;
  if (!qword_256B21BA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B21B68);
    v2[0] = sub_23C106D64();
    v2[1] = sub_23C107448(&qword_256B21BE8, &qword_256B21B88, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B21BA0);
  }
  return result;
}

unint64_t sub_23C106D64()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B21BA8;
  if (!qword_256B21BA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B21B60);
    v2[0] = sub_23C106DE8();
    v2[1] = sub_23C107448(&qword_256B21BE0, &qword_256B21B58, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B21BA8);
  }
  return result;
}

unint64_t sub_23C106DE8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B21BB0;
  if (!qword_256B21BB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B21BB8);
    v2[0] = sub_23C106E54();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B21BB0);
  }
  return result;
}

unint64_t sub_23C106E54()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B21BC0;
  if (!qword_256B21BC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B21BC8);
    v2[0] = sub_23C107448(&qword_256B21BD0, &qword_256B21BD8, MEMORY[0x24BDF4498]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B21BC0);
  }
  return result;
}

uint64_t sub_23C106ED8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23C106F14()
{
  sub_23C106C54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B21C08);
  sub_23C107448(&qword_256B21C10, &qword_256B21C08, MEMORY[0x24BE2B5E8]);
  sub_23C138C6C();
  sub_23C106C48();
  sub_23C138FA8();
  return swift_release();
}

uint64_t sub_23C106FD0()
{
  return sub_23C106F14();
}

uint64_t sub_23C106FF8(double a1)
{
  double v2;
  double v3;
  uint64_t result;
  double v5;

  sub_23C138C48();
  v3 = v2;
  result = sub_23C138C3C();
  if (v3 - v5 > a1)
  {
    sub_23C106C54();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B21C08);
    sub_23C107448(&qword_256B21C10, &qword_256B21C08, MEMORY[0x24BE2B5E8]);
    sub_23C138C6C();
    sub_23C106C48();
    sub_23C138FA8();
    return swift_release();
  }
  return result;
}

uint64_t objectdestroy_2Tm()
{
  sub_23C106C48();
  return swift_deallocObject();
}

uint64_t sub_23C10710C()
{
  uint64_t v0;

  return sub_23C106FF8(*(double *)(v0 + 40));
}

unint64_t sub_23C107124()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B21BF8;
  if (!qword_256B21BF8)
  {
    v1 = sub_23C138C54();
    result = MEMORY[0x2426179DC](MEMORY[0x24BDEB530], v1);
    atomic_store(result, (unint64_t *)&qword_256B21BF8);
  }
  return result;
}

uint64_t sub_23C10716C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C107184()
{
  return sub_23C138E10();
}

uint64_t destroy for ForYouToastView()
{
  return sub_23C106C48();
}

uint64_t initializeWithCopy for ForYouToastView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_23C106C54();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = a2[3];
  return a1;
}

uint64_t assignWithCopy for ForYouToastView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_23C106C54();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_23C106C48();
  *(_QWORD *)(a1 + 24) = a2[3];
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

uint64_t assignWithTake for ForYouToastView(uint64_t a1, uint64_t a2)
{
  char v4;

  v4 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_23C106C48();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ForYouToastView(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ForYouToastView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouToastView()
{
  return &type metadata for ForYouToastView;
}

uint64_t sub_23C107368()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B21B80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B21B50);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B21B78);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B21B70);
  sub_23C106C5C();
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeConformance2();
  sub_23C107448(&qword_256B21C00, &qword_256B21B50, MEMORY[0x24BDEC410]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C107448(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2426179DC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C107488@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23C138CE4();
  *a1 = result;
  return result;
}

uint64_t sub_23C1074B0()
{
  swift_retain();
  return sub_23C138CF0();
}

unint64_t sub_23C1074D8()
{
  unint64_t result;

  result = qword_256B21C18;
  if (!qword_256B21C18)
  {
    result = MEMORY[0x2426179DC](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256B21C18);
  }
  return result;
}

uint64_t ForYouToastState.init(locale:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_23C138BDC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t sub_23C107558()
{
  return 1;
}

uint64_t sub_23C107560()
{
  sub_23C1392F0();
  sub_23C1392FC();
  return sub_23C139320();
}

uint64_t sub_23C1075A0()
{
  return sub_23C1392FC();
}

uint64_t sub_23C1075C4()
{
  sub_23C1392F0();
  sub_23C1392FC();
  return sub_23C139320();
}

uint64_t sub_23C107604@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C107FB4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C10762C()
{
  sub_23C107784();
  return sub_23C139350();
}

uint64_t sub_23C107654()
{
  sub_23C107784();
  return sub_23C13935C();
}

uint64_t ForYouToastState.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21C20);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C107784();
  sub_23C139338();
  sub_23C138BDC();
  sub_23C1079C0(&qword_256B21C30, MEMORY[0x24BDCEEC8]);
  sub_23C139278();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_23C107784()
{
  unint64_t result;

  result = qword_256B21C28;
  if (!qword_256B21C28)
  {
    result = MEMORY[0x2426179DC](&unk_23C13A824, &type metadata for ForYouToastState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21C28);
  }
  return result;
}

uint64_t ForYouToastState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;

  v15 = a2;
  v17 = sub_23C138BDC();
  v14 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v16 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21C38);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for ForYouToastState();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C107784();
  sub_23C13932C();
  if (!v2)
  {
    sub_23C1079C0(&qword_256B21C40, MEMORY[0x24BDCEEE8]);
    sub_23C139200();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v16, v17);
    sub_23C107A00((uint64_t)v11, v15);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t type metadata accessor for ForYouToastState()
{
  uint64_t result;

  result = qword_256B21CA0;
  if (!qword_256B21CA0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23C1079C0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23C138BDC();
    result = MEMORY[0x2426179DC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C107A00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ForYouToastState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C107A44@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ForYouToastState.init(from:)(a1, a2);
}

uint64_t sub_23C107A58(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21C20);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C107784();
  sub_23C139338();
  sub_23C138BDC();
  sub_23C1079C0(&qword_256B21C30, MEMORY[0x24BDCEEC8]);
  sub_23C139278();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t initializeBufferWithCopyOfBuffer for ForYouToastState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C138BDC();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for ForYouToastState(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23C138BDC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for ForYouToastState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C138BDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for ForYouToastState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C138BDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for ForYouToastState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C138BDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for ForYouToastState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C138BDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ForYouToastState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C107CF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C138BDC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ForYouToastState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C107D3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C138BDC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_23C107D7C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23C138BDC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ForYouToastState.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ForYouToastState.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C107E78 + 4 * byte_23C13A6C0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C107E98 + 4 * byte_23C13A6C5[v4]))();
}

_BYTE *sub_23C107E78(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C107E98(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C107EA0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C107EA8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C107EB0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C107EB8(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23C107EC4()
{
  return 0;
}

ValueMetadata *type metadata accessor for ForYouToastState.CodingKeys()
{
  return &type metadata for ForYouToastState.CodingKeys;
}

unint64_t sub_23C107EE0()
{
  unint64_t result;

  result = qword_256B21CD8;
  if (!qword_256B21CD8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13A7FC, &type metadata for ForYouToastState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21CD8);
  }
  return result;
}

unint64_t sub_23C107F28()
{
  unint64_t result;

  result = qword_256B21CE0;
  if (!qword_256B21CE0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13A76C, &type metadata for ForYouToastState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21CE0);
  }
  return result;
}

unint64_t sub_23C107F70()
{
  unint64_t result;

  result = qword_256B21CE8;
  if (!qword_256B21CE8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13A794, &type metadata for ForYouToastState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21CE8);
  }
  return result;
}

uint64_t sub_23C107FB4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23C139284();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C108030()
{
  return 0x656C61636F6CLL;
}

uint64_t sub_23C108044(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C108080 + 4 * byte_23C13A880[a1]))(0xD000000000000012, 0x800000023C140490);
}

uint64_t sub_23C108080()
{
  uint64_t v0;

  return v0 + 6;
}

uint64_t sub_23C10819C()
{
  return 0x4164694477656976;
}

uint64_t sub_23C1081C0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C1081F8 + 4 * byte_23C13A88F[a1]))(0xD000000000000010, 0x800000023C140430);
}

uint64_t sub_23C1081F8()
{
  return 0x64496F636572;
}

uint64_t sub_23C10820C()
{
  return 0x65736E6F70736572;
}

uint64_t sub_23C108230(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_23C108248()
{
  sub_23C109B84();
  return sub_23C139350();
}

uint64_t sub_23C108270()
{
  sub_23C109B84();
  return sub_23C13935C();
}

uint64_t sub_23C1082A4()
{
  sub_23C109AFC();
  return sub_23C139350();
}

uint64_t sub_23C1082CC()
{
  sub_23C109AFC();
  return sub_23C13935C();
}

uint64_t sub_23C1082F4()
{
  sub_23C109AB8();
  return sub_23C139350();
}

uint64_t sub_23C10831C()
{
  sub_23C109AB8();
  return sub_23C13935C();
}

uint64_t sub_23C108344()
{
  unsigned __int8 *v0;

  return sub_23C108044(*v0);
}

uint64_t sub_23C10834C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C109C9C(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C108370(_BYTE *a1@<X8>)
{
  *a1 = 15;
}

uint64_t sub_23C10837C()
{
  sub_23C1095E0();
  return sub_23C139350();
}

uint64_t sub_23C1083A4()
{
  sub_23C1095E0();
  return sub_23C13935C();
}

uint64_t sub_23C1083CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C10A5A8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C1083F4()
{
  sub_23C109A30();
  return sub_23C139350();
}

uint64_t sub_23C10841C()
{
  sub_23C109A30();
  return sub_23C13935C();
}

uint64_t sub_23C108448@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C10A258(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C108470()
{
  sub_23C10996C();
  return sub_23C139350();
}

uint64_t sub_23C108498()
{
  sub_23C10996C();
  return sub_23C13935C();
}

unint64_t sub_23C1084C0()
{
  return 0xD000000000000014;
}

uint64_t sub_23C1084DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C10A2F4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C108504()
{
  sub_23C109928();
  return sub_23C139350();
}

uint64_t sub_23C10852C()
{
  sub_23C109928();
  return sub_23C13935C();
}

unint64_t sub_23C108554()
{
  return 0xD000000000000012;
}

uint64_t sub_23C108570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C10A378(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C108598()
{
  sub_23C1098E4();
  return sub_23C139350();
}

uint64_t sub_23C1085C0()
{
  sub_23C1098E4();
  return sub_23C13935C();
}

uint64_t sub_23C1085E8()
{
  unsigned __int8 *v0;

  return sub_23C1081C0(*v0);
}

uint64_t sub_23C1085F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C10A3FC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C108614()
{
  sub_23C1098A0();
  return sub_23C139350();
}

uint64_t sub_23C10863C()
{
  sub_23C1098A0();
  return sub_23C13935C();
}

uint64_t sub_23C108664()
{
  sub_23C10985C();
  return sub_23C139350();
}

uint64_t sub_23C10868C()
{
  sub_23C10985C();
  return sub_23C13935C();
}

uint64_t sub_23C1086B4()
{
  sub_23C1097D4();
  return sub_23C139350();
}

uint64_t sub_23C1086DC()
{
  sub_23C1097D4();
  return sub_23C13935C();
}

uint64_t sub_23C108704()
{
  sub_23C109790();
  return sub_23C139350();
}

uint64_t sub_23C10872C()
{
  sub_23C109790();
  return sub_23C13935C();
}

uint64_t sub_23C108754()
{
  sub_23C10974C();
  return sub_23C139350();
}

uint64_t sub_23C10877C()
{
  sub_23C10974C();
  return sub_23C13935C();
}

uint64_t sub_23C1087A4()
{
  sub_23C109708();
  return sub_23C139350();
}

uint64_t sub_23C1087CC()
{
  sub_23C109708();
  return sub_23C13935C();
}

uint64_t sub_23C1087F4()
{
  sub_23C109680();
  return sub_23C139350();
}

uint64_t sub_23C10881C()
{
  sub_23C109680();
  return sub_23C13935C();
}

uint64_t sub_23C108844()
{
  sub_23C10963C();
  return sub_23C139350();
}

uint64_t sub_23C10886C()
{
  sub_23C10963C();
  return sub_23C13935C();
}

void ForYouAction.encode(to:)(_QWORD *a1)
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _QWORD v20[2];
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  __int128 *v62;
  __int128 v63;

  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21CF0);
  v23 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v22 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21CF8);
  v57 = *(_QWORD *)(v3 - 8);
  v58 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v56 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21D00);
  v20[1] = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v20[0] = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21D08);
  v26 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v25 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21D10);
  v29 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v28 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21D18);
  v38 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v52 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21D20);
  v32 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v31 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21D28);
  v37 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v54 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21D30);
  v50 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51);
  v49 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21D38);
  v47 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v46 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21D40);
  v44 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v42 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21D48);
  v41 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v40 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21D50);
  v35 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v34 = (char *)v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21D58);
  v39 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21D60);
  MEMORY[0x24BDAC7A8](v17);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21D68);
  v59 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v19 = (char *)v20 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1095E0();
  v60 = v19;
  sub_23C139338();
  sub_23C109624(v62, &v63);
  __asm { BR              X10 }
}

uint64_t sub_23C108DEC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v3 - 200) = 1;
  sub_23C109AFC();
  v5 = *(_QWORD *)(v3 - 232);
  v4 = *(_QWORD *)(v3 - 224);
  sub_23C139218();
  *(_BYTE *)(v3 - 200) = v2 & 1;
  sub_23C109B40();
  sub_23C139278();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 400) + 8))(v1, v0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 240) + 8))(v5, v4);
}

void sub_23C109330()
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
  void (*v12)(uint64_t, _QWORD);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = *(_QWORD *)(v4 - 168);
  v5 = *(_QWORD *)(v4 - 160);
  v7 = *(_QWORD *)(v4 - 152) | *(_QWORD *)(v4 - 144);
  if (v7 | v2 | v5 | v6)
  {
    v8 = v7 | v5 | v6;
    if (v2 != 1 || v8)
    {
      if (v2 != 2 || v8)
      {
        if (v2 != 3 || v8)
        {
          if (v2 != 4 || v8)
          {
            if (v2 != 5 || v8)
            {
              *(_BYTE *)(v4 - 200) = 14;
              sub_23C10963C();
              v19 = *(_QWORD *)(v4 - 536);
              sub_23C139218();
              (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 - 528) + 8))(v19, *(_QWORD *)(v4 - 520));
            }
            else
            {
              *(_BYTE *)(v4 - 200) = 12;
              sub_23C109708();
              v18 = *(_QWORD *)(v4 - 560);
              sub_23C139218();
              (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 - 552) + 8))(v18, *(_QWORD *)(v4 - 544));
            }
            JUMPOUT(0x23C109300);
          }
          *(_BYTE *)(v4 - 200) = 11;
          sub_23C10974C();
          v17 = *(_QWORD *)(v4 - 512);
          v11 = *(_QWORD *)(v4 - 232);
          v10 = *(_QWORD *)(v4 - 224);
          sub_23C139218();
          v12 = *(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 - 504) + 8);
          v13 = v17;
          v14 = v4 - 240;
        }
        else
        {
          *(_BYTE *)(v4 - 200) = 10;
          sub_23C109790();
          v16 = *(_QWORD *)(v4 - 488);
          v11 = *(_QWORD *)(v4 - 232);
          v10 = *(_QWORD *)(v4 - 224);
          sub_23C139218();
          v12 = *(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 - 480) + 8);
          v13 = v16;
          v14 = v4 - 216;
        }
      }
      else
      {
        *(_BYTE *)(v4 - 200) = 8;
        sub_23C10985C();
        v15 = *(_QWORD *)(v4 - 464);
        v11 = *(_QWORD *)(v4 - 232);
        v10 = *(_QWORD *)(v4 - 224);
        sub_23C139218();
        v12 = *(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 - 456) + 8);
        v13 = v15;
        v14 = v4 - 192;
      }
    }
    else
    {
      *(_BYTE *)(v4 - 200) = 2;
      sub_23C109AB8();
      v9 = *(_QWORD *)(v4 - 440);
      v11 = *(_QWORD *)(v4 - 232);
      v10 = *(_QWORD *)(v4 - 224);
      sub_23C139218();
      v12 = *(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 - 432) + 8);
      v13 = v9;
      v14 = v4 - 168;
    }
    v12(v13, *(_QWORD *)(v14 - 256));
  }
  else
  {
    *(_BYTE *)(v4 - 200) = 0;
    sub_23C109B84();
    v11 = *(_QWORD *)(v4 - 232);
    v10 = *(_QWORD *)(v4 - 224);
    sub_23C139218();
    (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v1, v3);
  }
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 240) + 8))(v11, v10);
  JUMPOUT(0x23C109308);
}

unint64_t sub_23C1095E0()
{
  unint64_t result;

  result = qword_256B21D70;
  if (!qword_256B21D70)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B8F0, &type metadata for ForYouAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21D70);
  }
  return result;
}

_OWORD *sub_23C109624(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(__int128 *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

unint64_t sub_23C10963C()
{
  unint64_t result;

  result = qword_256B21D78;
  if (!qword_256B21D78)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B8A0, &type metadata for ForYouAction.ViewDidAppearCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21D78);
  }
  return result;
}

unint64_t sub_23C109680()
{
  unint64_t result;

  result = qword_256B21D80;
  if (!qword_256B21D80)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B850, &type metadata for ForYouAction.SubscriptionStateUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21D80);
  }
  return result;
}

unint64_t sub_23C1096C4()
{
  unint64_t result;

  result = qword_256B21D88;
  if (!qword_256B21D88)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for SubscriptionState, &type metadata for SubscriptionState);
    atomic_store(result, (unint64_t *)&qword_256B21D88);
  }
  return result;
}

unint64_t sub_23C109708()
{
  unint64_t result;

  result = qword_256B21D90;
  if (!qword_256B21D90)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B800, &type metadata for ForYouAction.StartSyncTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21D90);
  }
  return result;
}

unint64_t sub_23C10974C()
{
  unint64_t result;

  result = qword_256B21D98;
  if (!qword_256B21D98)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B7B0, &type metadata for ForYouAction.RetryButtonTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21D98);
  }
  return result;
}

unint64_t sub_23C109790()
{
  unint64_t result;

  result = qword_256B21DA0;
  if (!qword_256B21DA0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B760, &type metadata for ForYouAction.PresentToastIfNeededCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21DA0);
  }
  return result;
}

unint64_t sub_23C1097D4()
{
  unint64_t result;

  result = qword_256B21DA8;
  if (!qword_256B21DA8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B710, &type metadata for ForYouAction.NetworkConditionsUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21DA8);
  }
  return result;
}

unint64_t sub_23C109818()
{
  unint64_t result;

  result = qword_256B21DB0;
  if (!qword_256B21DB0)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for NetworkConditions, &type metadata for NetworkConditions);
    atomic_store(result, (unint64_t *)&qword_256B21DB0);
  }
  return result;
}

unint64_t sub_23C10985C()
{
  unint64_t result;

  result = qword_256B21DB8;
  if (!qword_256B21DB8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B6C0, &type metadata for ForYouAction.NavigateToExploreCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21DB8);
  }
  return result;
}

unint64_t sub_23C1098A0()
{
  unint64_t result;

  result = qword_256B21DC0;
  if (!qword_256B21DC0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B670, &type metadata for ForYouAction.LoadedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21DC0);
  }
  return result;
}

unint64_t sub_23C1098E4()
{
  unint64_t result;

  result = qword_256B21DC8;
  if (!qword_256B21DC8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B620, &type metadata for ForYouAction.LoadedAwardDescriptorsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21DC8);
  }
  return result;
}

unint64_t sub_23C109928()
{
  unint64_t result;

  result = qword_256B21DD0;
  if (!qword_256B21DD0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B5D0, &type metadata for ForYouAction.HandleFetchErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21DD0);
  }
  return result;
}

unint64_t sub_23C10996C()
{
  unint64_t result;

  result = qword_256B21DD8;
  if (!qword_256B21DD8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B580, &type metadata for ForYouAction.FetchSectionDescriptorsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21DD8);
  }
  return result;
}

unint64_t sub_23C1099B0()
{
  unint64_t result;

  result = qword_256B21DE0;
  if (!qword_256B21DE0)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for PersonalizationInferenceRequestTrigger, &type metadata for PersonalizationInferenceRequestTrigger);
    atomic_store(result, (unint64_t *)&qword_256B21DE0);
  }
  return result;
}

__n128 *sub_23C1099F4(__n128 *a1, __n128 *a2)
{
  __swift_memcpy17_8(a2, a1);
  return a2;
}

unint64_t sub_23C109A30()
{
  unint64_t result;

  result = qword_256B21DE8;
  if (!qword_256B21DE8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B530, &type metadata for ForYouAction.FailedToLoadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21DE8);
  }
  return result;
}

unint64_t sub_23C109A74()
{
  unint64_t result;

  result = qword_256B21DF0;
  if (!qword_256B21DF0)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for LoadFailureReason, &type metadata for LoadFailureReason);
    atomic_store(result, (unint64_t *)&qword_256B21DF0);
  }
  return result;
}

unint64_t sub_23C109AB8()
{
  unint64_t result;

  result = qword_256B21DF8;
  if (!qword_256B21DF8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B4E0, &type metadata for ForYouAction.CancelSyncTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21DF8);
  }
  return result;
}

unint64_t sub_23C109AFC()
{
  unint64_t result;

  result = qword_256B21E00;
  if (!qword_256B21E00)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B490, &type metadata for ForYouAction.BrowsingIdentityUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E00);
  }
  return result;
}

unint64_t sub_23C109B40()
{
  unint64_t result;

  result = qword_256B21E08;
  if (!qword_256B21E08)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for BrowsingIdentity, &type metadata for BrowsingIdentity);
    atomic_store(result, (unint64_t *)&qword_256B21E08);
  }
  return result;
}

unint64_t sub_23C109B84()
{
  unint64_t result;

  result = qword_256B21E10;
  if (!qword_256B21E10)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B440, &type metadata for ForYouAction.AppDidBecomeActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E10);
  }
  return result;
}

_OWORD *ForYouAction.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  _OWORD *result;
  __int128 v5[3];

  result = (_OWORD *)sub_23C10A614(a1, (uint64_t)v5);
  if (!v2)
    return sub_23C109624(v5, a2);
  return result;
}

_OWORD *sub_23C109C0C@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  _OWORD *result;
  __int128 v5[3];

  result = (_OWORD *)sub_23C10A614(a1, (uint64_t)v5);
  if (!v2)
    return sub_23C109624(v5, a2);
  return result;
}

void sub_23C109C50(_QWORD *a1)
{
  __int128 *v1;
  _OWORD v3[3];

  sub_23C109624(v1, v3);
  ForYouAction.encode(to:)(a1);
}

uint64_t sub_23C109C9C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000012 && a2 == 0x800000023C140490 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000023C1404B0 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x79536C65636E6163 && a2 == 0xEF72656D6954636ELL || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6F5464656C696166 && a2 == 0xEC00000064616F4CLL || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000023C1404D0 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023C1404F0 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000023C140510 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x646564616F6CLL && a2 == 0xE600000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C140530 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000023C140550 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000023C140570 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C140590 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x6E79537472617473 && a2 == 0xEE0072656D695463 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000023C1405B0 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x4164694477656976 && a2 == 0xED00007261657070)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else
  {
    v5 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 14;
    else
      return 15;
  }
}

uint64_t sub_23C10A24C()
{
  return 12383;
}

uint64_t sub_23C10A258(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x72656767697274 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23C139284();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C10A2DC()
{
  return 0x72656767697274;
}

uint64_t sub_23C10A2F4(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000014 && a2 == 0x800000023C1405F0)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_23C139284();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_23C10A378(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000012 && a2 == 0x800000023C1405D0)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_23C139284();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_23C10A3FC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x64496F636572 && a2 == 0xE600000000000000;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023C140430 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65736E6F70736572 && a2 == 0xEF656D6954646E45 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000023C1405D0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23C10A5A8(uint64_t a1, uint64_t a2)
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
    v3 = sub_23C139284();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C10A614@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD v33[13];
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
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;

  v62 = a2;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21F60);
  v51 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v61 = (char *)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21F68);
  v33[10] = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v67 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21F70);
  v48 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v66 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21F78);
  v45 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v65 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21F80);
  v42 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v59 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21F88);
  v33[9] = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v60 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21F90);
  v39 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v58 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21F98);
  v53 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v57 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21FA0);
  v33[8] = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v64 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21FA8);
  v33[7] = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v63 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21FB0);
  v33[6] = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v56 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21FB8);
  v33[5] = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v55 = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21FC0);
  v33[11] = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v54 = (char *)v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21FC8);
  v33[12] = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v17 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21FD0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B21FD8);
  v21 = *(_QWORD *)(v68 - 8);
  MEMORY[0x24BDAC7A8](v68);
  v23 = (char *)v33 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = a1[3];
  v69 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v24);
  sub_23C1095E0();
  v25 = v70;
  sub_23C13932C();
  if (v25)
  {
    v26 = (uint64_t)v69;
  }
  else
  {
    v33[2] = v20;
    v33[1] = v18;
    v33[3] = v17;
    v33[4] = 0;
    v70 = v21;
    v27 = sub_23C13920C();
    if (*(_QWORD *)(v27 + 16) == 1)
      __asm { BR              X10 }
    v28 = sub_23C139110();
    swift_allocError();
    v30 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B21A98);
    *v30 = &type metadata for ForYouAction;
    v31 = v68;
    sub_23C1391A0();
    sub_23C139104();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(v30, *MEMORY[0x24BEE26D0], v28);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v70 + 8))(v23, v31);
    v26 = (uint64_t)v69;
  }
  return __swift_destroy_boxed_opaque_existential_1(v26);
}

uint64_t sub_23C10BA6C(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  switch(a6)
  {
    case 1:
      result = sub_23C10BACC(result, a2, a3);
      break;
    case 3:
    case 4:
      goto LABEL_3;
    case 5:
      swift_bridgeObjectRetain();
LABEL_3:
      result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23C10BACC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (!a3)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for ForYouAction(uint64_t a1)
{
  return sub_23C10BAF8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
}

uint64_t sub_23C10BAF8(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  switch(a6)
  {
    case 1:
      result = sub_23C10BB58(result, a2, a3);
      break;
    case 3:
    case 4:
      goto LABEL_3;
    case 5:
      swift_bridgeObjectRelease();
LABEL_3:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23C10BB58(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (!a3)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t initializeWithCopy for ForYouAction(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_23C10BA6C(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  return a1;
}

uint64_t assignWithCopy for ForYouAction(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_23C10BA6C(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  v9 = *(_QWORD *)a1;
  v10 = *(_QWORD *)(a1 + 8);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  v14 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v8;
  sub_23C10BAF8(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ForYouAction(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 32) = v3;
  v11 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v4;
  sub_23C10BAF8(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for ForYouAction(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xF8 && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 248);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 8)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ForYouAction(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF7)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 248;
    if (a3 >= 0xF8)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xF8)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_23C10BD64(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 40) <= 7u)
    return *(unsigned __int8 *)(a1 + 40);
  else
    return (*(_DWORD *)a1 + 8);
}

uint64_t sub_23C10BD7C(uint64_t result, unsigned int a2)
{
  if (a2 >= 8)
  {
    *(_QWORD *)result = a2 - 8;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    LOBYTE(a2) = 8;
  }
  *(_BYTE *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ForYouAction()
{
  return &type metadata for ForYouAction;
}

uint64_t getEnumTagSinglePayload for ForYouAction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF2)
    goto LABEL_17;
  if (a2 + 14 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 14) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 14;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 14;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 14;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xF;
  v8 = v6 - 15;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ForYouAction.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 14 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 14) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF2)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF1)
    return ((uint64_t (*)(void))((char *)&loc_23C10BE8C + 4 * byte_23C13A8D3[v4]))();
  *a1 = a2 + 14;
  return ((uint64_t (*)(void))((char *)sub_23C10BEC0 + 4 * byte_23C13A8CE[v4]))();
}

uint64_t sub_23C10BEC0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C10BEC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C10BED0);
  return result;
}

uint64_t sub_23C10BEDC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C10BEE4);
  *(_BYTE *)result = a2 + 14;
  return result;
}

uint64_t sub_23C10BEE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C10BEF0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ForYouAction.CodingKeys()
{
  return &type metadata for ForYouAction.CodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.AppDidBecomeActiveCodingKeys()
{
  return &type metadata for ForYouAction.AppDidBecomeActiveCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.BrowsingIdentityUpdatedCodingKeys()
{
  return &type metadata for ForYouAction.BrowsingIdentityUpdatedCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.CancelSyncTimerCodingKeys()
{
  return &type metadata for ForYouAction.CancelSyncTimerCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.FailedToLoadCodingKeys()
{
  return &type metadata for ForYouAction.FailedToLoadCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.FetchSectionDescriptorsCodingKeys()
{
  return &type metadata for ForYouAction.FetchSectionDescriptorsCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.HandleFetchErrorCodingKeys()
{
  return &type metadata for ForYouAction.HandleFetchErrorCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.LoadedAwardDescriptorsCodingKeys()
{
  return &type metadata for ForYouAction.LoadedAwardDescriptorsCodingKeys;
}

uint64_t storeEnumTagSinglePayload for ForYouAction.LoadedCodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C10BFD0 + 4 * byte_23C13A8DD[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C10C004 + 4 * byte_23C13A8D8[v4]))();
}

uint64_t sub_23C10C004(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C10C00C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C10C014);
  return result;
}

uint64_t sub_23C10C020(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C10C028);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C10C02C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C10C034(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ForYouAction.LoadedCodingKeys()
{
  return &type metadata for ForYouAction.LoadedCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.NavigateToExploreCodingKeys()
{
  return &type metadata for ForYouAction.NavigateToExploreCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.NetworkConditionsUpdatedCodingKeys()
{
  return &type metadata for ForYouAction.NetworkConditionsUpdatedCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.PresentToastIfNeededCodingKeys()
{
  return &type metadata for ForYouAction.PresentToastIfNeededCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.RetryButtonTappedCodingKeys()
{
  return &type metadata for ForYouAction.RetryButtonTappedCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.StartSyncTimerCodingKeys()
{
  return &type metadata for ForYouAction.StartSyncTimerCodingKeys;
}

uint64_t _s13FitnessForYou12ForYouActionO33BrowsingIdentityUpdatedCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C10C0E0 + 4 * byte_23C13A8E2[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C10C100 + 4 * byte_23C13A8E7[v4]))();
}

_BYTE *sub_23C10C0E0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C10C100(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C10C108(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C10C110(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C10C118(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C10C120(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ForYouAction.SubscriptionStateUpdatedCodingKeys()
{
  return &type metadata for ForYouAction.SubscriptionStateUpdatedCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.ViewDidAppearCodingKeys()
{
  return &type metadata for ForYouAction.ViewDidAppearCodingKeys;
}

unint64_t sub_23C10C150()
{
  unint64_t result;

  result = qword_256B21E18;
  if (!qword_256B21E18)
  {
    result = MEMORY[0x2426179DC](&unk_23C13AC78, &type metadata for ForYouAction.SubscriptionStateUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E18);
  }
  return result;
}

unint64_t sub_23C10C198()
{
  unint64_t result;

  result = qword_256B21E20;
  if (!qword_256B21E20)
  {
    result = MEMORY[0x2426179DC](&unk_23C13AE20, &type metadata for ForYouAction.NetworkConditionsUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E20);
  }
  return result;
}

unint64_t sub_23C10C1E0()
{
  unint64_t result;

  result = qword_256B21E28;
  if (!qword_256B21E28)
  {
    result = MEMORY[0x2426179DC](&unk_23C13AF28, &type metadata for ForYouAction.LoadedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E28);
  }
  return result;
}

unint64_t sub_23C10C228()
{
  unint64_t result;

  result = qword_256B21E30;
  if (!qword_256B21E30)
  {
    result = MEMORY[0x2426179DC](&unk_23C13AFE0, &type metadata for ForYouAction.LoadedAwardDescriptorsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E30);
  }
  return result;
}

unint64_t sub_23C10C270()
{
  unint64_t result;

  result = qword_256B21E38;
  if (!qword_256B21E38)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B098, &type metadata for ForYouAction.HandleFetchErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E38);
  }
  return result;
}

unint64_t sub_23C10C2B8()
{
  unint64_t result;

  result = qword_256B21E40;
  if (!qword_256B21E40)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B150, &type metadata for ForYouAction.FetchSectionDescriptorsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E40);
  }
  return result;
}

unint64_t sub_23C10C300()
{
  unint64_t result;

  result = qword_256B21E48;
  if (!qword_256B21E48)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B208, &type metadata for ForYouAction.FailedToLoadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E48);
  }
  return result;
}

unint64_t sub_23C10C348()
{
  unint64_t result;

  result = qword_256B21E50;
  if (!qword_256B21E50)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B310, &type metadata for ForYouAction.BrowsingIdentityUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E50);
  }
  return result;
}

unint64_t sub_23C10C390()
{
  unint64_t result;

  result = qword_256B21E58;
  if (!qword_256B21E58)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B418, &type metadata for ForYouAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E58);
  }
  return result;
}

unint64_t sub_23C10C3D8()
{
  unint64_t result;

  result = qword_256B21E60;
  if (!qword_256B21E60)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B338, &type metadata for ForYouAction.AppDidBecomeActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E60);
  }
  return result;
}

unint64_t sub_23C10C420()
{
  unint64_t result;

  result = qword_256B21E68;
  if (!qword_256B21E68)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B360, &type metadata for ForYouAction.AppDidBecomeActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E68);
  }
  return result;
}

unint64_t sub_23C10C468()
{
  unint64_t result;

  result = qword_256B21E70;
  if (!qword_256B21E70)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B280, &type metadata for ForYouAction.BrowsingIdentityUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E70);
  }
  return result;
}

unint64_t sub_23C10C4B0()
{
  unint64_t result;

  result = qword_256B21E78;
  if (!qword_256B21E78)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B2A8, &type metadata for ForYouAction.BrowsingIdentityUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E78);
  }
  return result;
}

unint64_t sub_23C10C4F8()
{
  unint64_t result;

  result = qword_256B21E80;
  if (!qword_256B21E80)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B230, &type metadata for ForYouAction.CancelSyncTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E80);
  }
  return result;
}

unint64_t sub_23C10C540()
{
  unint64_t result;

  result = qword_256B21E88;
  if (!qword_256B21E88)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B258, &type metadata for ForYouAction.CancelSyncTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E88);
  }
  return result;
}

unint64_t sub_23C10C588()
{
  unint64_t result;

  result = qword_256B21E90;
  if (!qword_256B21E90)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B178, &type metadata for ForYouAction.FailedToLoadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E90);
  }
  return result;
}

unint64_t sub_23C10C5D0()
{
  unint64_t result;

  result = qword_256B21E98;
  if (!qword_256B21E98)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B1A0, &type metadata for ForYouAction.FailedToLoadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21E98);
  }
  return result;
}

unint64_t sub_23C10C618()
{
  unint64_t result;

  result = qword_256B21EA0;
  if (!qword_256B21EA0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B0C0, &type metadata for ForYouAction.FetchSectionDescriptorsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21EA0);
  }
  return result;
}

unint64_t sub_23C10C660()
{
  unint64_t result;

  result = qword_256B21EA8;
  if (!qword_256B21EA8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B0E8, &type metadata for ForYouAction.FetchSectionDescriptorsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21EA8);
  }
  return result;
}

unint64_t sub_23C10C6A8()
{
  unint64_t result;

  result = qword_256B21EB0;
  if (!qword_256B21EB0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B008, &type metadata for ForYouAction.HandleFetchErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21EB0);
  }
  return result;
}

unint64_t sub_23C10C6F0()
{
  unint64_t result;

  result = qword_256B21EB8;
  if (!qword_256B21EB8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B030, &type metadata for ForYouAction.HandleFetchErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21EB8);
  }
  return result;
}

unint64_t sub_23C10C738()
{
  unint64_t result;

  result = qword_256B21EC0;
  if (!qword_256B21EC0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13AF50, &type metadata for ForYouAction.LoadedAwardDescriptorsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21EC0);
  }
  return result;
}

unint64_t sub_23C10C780()
{
  unint64_t result;

  result = qword_256B21EC8;
  if (!qword_256B21EC8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13AF78, &type metadata for ForYouAction.LoadedAwardDescriptorsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21EC8);
  }
  return result;
}

unint64_t sub_23C10C7C8()
{
  unint64_t result;

  result = qword_256B21ED0;
  if (!qword_256B21ED0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13AE98, &type metadata for ForYouAction.LoadedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21ED0);
  }
  return result;
}

unint64_t sub_23C10C810()
{
  unint64_t result;

  result = qword_256B21ED8;
  if (!qword_256B21ED8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13AEC0, &type metadata for ForYouAction.LoadedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21ED8);
  }
  return result;
}

unint64_t sub_23C10C858()
{
  unint64_t result;

  result = qword_256B21EE0;
  if (!qword_256B21EE0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13AE48, &type metadata for ForYouAction.NavigateToExploreCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21EE0);
  }
  return result;
}

unint64_t sub_23C10C8A0()
{
  unint64_t result;

  result = qword_256B21EE8;
  if (!qword_256B21EE8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13AE70, &type metadata for ForYouAction.NavigateToExploreCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21EE8);
  }
  return result;
}

unint64_t sub_23C10C8E8()
{
  unint64_t result;

  result = qword_256B21EF0;
  if (!qword_256B21EF0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13AD90, &type metadata for ForYouAction.NetworkConditionsUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21EF0);
  }
  return result;
}

unint64_t sub_23C10C930()
{
  unint64_t result;

  result = qword_256B21EF8;
  if (!qword_256B21EF8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13ADB8, &type metadata for ForYouAction.NetworkConditionsUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21EF8);
  }
  return result;
}

unint64_t sub_23C10C978()
{
  unint64_t result;

  result = qword_256B21F00;
  if (!qword_256B21F00)
  {
    result = MEMORY[0x2426179DC](&unk_23C13AD40, &type metadata for ForYouAction.PresentToastIfNeededCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21F00);
  }
  return result;
}

unint64_t sub_23C10C9C0()
{
  unint64_t result;

  result = qword_256B21F08;
  if (!qword_256B21F08)
  {
    result = MEMORY[0x2426179DC](&unk_23C13AD68, &type metadata for ForYouAction.PresentToastIfNeededCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21F08);
  }
  return result;
}

unint64_t sub_23C10CA08()
{
  unint64_t result;

  result = qword_256B21F10;
  if (!qword_256B21F10)
  {
    result = MEMORY[0x2426179DC](&unk_23C13ACF0, &type metadata for ForYouAction.RetryButtonTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21F10);
  }
  return result;
}

unint64_t sub_23C10CA50()
{
  unint64_t result;

  result = qword_256B21F18;
  if (!qword_256B21F18)
  {
    result = MEMORY[0x2426179DC](&unk_23C13AD18, &type metadata for ForYouAction.RetryButtonTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21F18);
  }
  return result;
}

unint64_t sub_23C10CA98()
{
  unint64_t result;

  result = qword_256B21F20;
  if (!qword_256B21F20)
  {
    result = MEMORY[0x2426179DC](&unk_23C13ACA0, &type metadata for ForYouAction.StartSyncTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21F20);
  }
  return result;
}

unint64_t sub_23C10CAE0()
{
  unint64_t result;

  result = qword_256B21F28;
  if (!qword_256B21F28)
  {
    result = MEMORY[0x2426179DC](&unk_23C13ACC8, &type metadata for ForYouAction.StartSyncTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21F28);
  }
  return result;
}

unint64_t sub_23C10CB28()
{
  unint64_t result;

  result = qword_256B21F30;
  if (!qword_256B21F30)
  {
    result = MEMORY[0x2426179DC](&unk_23C13ABE8, &type metadata for ForYouAction.SubscriptionStateUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21F30);
  }
  return result;
}

unint64_t sub_23C10CB70()
{
  unint64_t result;

  result = qword_256B21F38;
  if (!qword_256B21F38)
  {
    result = MEMORY[0x2426179DC](&unk_23C13AC10, &type metadata for ForYouAction.SubscriptionStateUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21F38);
  }
  return result;
}

unint64_t sub_23C10CBB8()
{
  unint64_t result;

  result = qword_256B21F40;
  if (!qword_256B21F40)
  {
    result = MEMORY[0x2426179DC](&unk_23C13AB98, &type metadata for ForYouAction.ViewDidAppearCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21F40);
  }
  return result;
}

unint64_t sub_23C10CC00()
{
  unint64_t result;

  result = qword_256B21F48;
  if (!qword_256B21F48)
  {
    result = MEMORY[0x2426179DC](&unk_23C13ABC0, &type metadata for ForYouAction.ViewDidAppearCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21F48);
  }
  return result;
}

unint64_t sub_23C10CC48()
{
  unint64_t result;

  result = qword_256B21F50;
  if (!qword_256B21F50)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B388, &type metadata for ForYouAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21F50);
  }
  return result;
}

unint64_t sub_23C10CC90()
{
  unint64_t result;

  result = qword_256B21F58;
  if (!qword_256B21F58)
  {
    result = MEMORY[0x2426179DC](&unk_23C13B3B0, &type metadata for ForYouAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B21F58);
  }
  return result;
}

unint64_t sub_23C10CCD4()
{
  unint64_t result;

  result = qword_256B21FE0;
  if (!qword_256B21FE0)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for SubscriptionState, &type metadata for SubscriptionState);
    atomic_store(result, (unint64_t *)&qword_256B21FE0);
  }
  return result;
}

unint64_t sub_23C10CD18()
{
  unint64_t result;

  result = qword_256B21FE8;
  if (!qword_256B21FE8)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for NetworkConditions, &type metadata for NetworkConditions);
    atomic_store(result, (unint64_t *)&qword_256B21FE8);
  }
  return result;
}

unint64_t sub_23C10CD5C()
{
  unint64_t result;

  result = qword_256B21FF0;
  if (!qword_256B21FF0)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for PersonalizationInferenceRequestTrigger, &type metadata for PersonalizationInferenceRequestTrigger);
    atomic_store(result, (unint64_t *)&qword_256B21FF0);
  }
  return result;
}

unint64_t sub_23C10CDA0()
{
  unint64_t result;

  result = qword_256B21FF8;
  if (!qword_256B21FF8)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for LoadFailureReason, &type metadata for LoadFailureReason);
    atomic_store(result, (unint64_t *)&qword_256B21FF8);
  }
  return result;
}

unint64_t sub_23C10CDE4()
{
  unint64_t result;

  result = qword_256B22000;
  if (!qword_256B22000)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for BrowsingIdentity, &type metadata for BrowsingIdentity);
    atomic_store(result, (unint64_t *)&qword_256B22000);
  }
  return result;
}

BOOL static NetworkConditions.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23C10CE40(char a1)
{
  return *(_QWORD *)&aAvailablunavai[8 * a1];
}

uint64_t sub_23C10CE60()
{
  sub_23C10D308();
  return sub_23C139350();
}

uint64_t sub_23C10CE88()
{
  sub_23C10D308();
  return sub_23C13935C();
}

uint64_t sub_23C10CEB0()
{
  char *v0;

  return sub_23C10CE40(*v0);
}

uint64_t sub_23C10CEB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C10D408(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C10CEDC(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23C10CEE8()
{
  sub_23C10D23C();
  return sub_23C139350();
}

uint64_t sub_23C10CF10()
{
  sub_23C10D23C();
  return sub_23C13935C();
}

uint64_t sub_23C10CF38()
{
  sub_23C10D2C4();
  return sub_23C139350();
}

uint64_t sub_23C10CF60()
{
  sub_23C10D2C4();
  return sub_23C13935C();
}

uint64_t sub_23C10CF88()
{
  sub_23C10D280();
  return sub_23C139350();
}

uint64_t sub_23C10CFB0()
{
  sub_23C10D280();
  return sub_23C13935C();
}

uint64_t NetworkConditions.encode(to:)(_QWORD *a1, int a2)
{
  uint64_t v3;
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
  char *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  char v25;
  char v26;
  char v27;

  v24 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22008);
  v21 = *(_QWORD *)(v3 - 8);
  v22 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v20 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22010);
  v18 = *(_QWORD *)(v5 - 8);
  v19 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22018);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22020);
  v23 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C10D23C();
  sub_23C139338();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      v26 = 1;
      sub_23C10D2C4();
      sub_23C139218();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v19);
    }
    else
    {
      v27 = 2;
      sub_23C10D280();
      v15 = v20;
      sub_23C139218();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v15, v22);
    }
  }
  else
  {
    v25 = 0;
    sub_23C10D308();
    sub_23C139218();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v14, v12);
}

unint64_t sub_23C10D23C()
{
  unint64_t result;

  result = qword_256B22028;
  if (!qword_256B22028)
  {
    result = MEMORY[0x2426179DC](&unk_23C13BD1C, &type metadata for NetworkConditions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22028);
  }
  return result;
}

unint64_t sub_23C10D280()
{
  unint64_t result;

  result = qword_256B22030;
  if (!qword_256B22030)
  {
    result = MEMORY[0x2426179DC](&unk_23C13BCCC, &type metadata for NetworkConditions.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22030);
  }
  return result;
}

unint64_t sub_23C10D2C4()
{
  unint64_t result;

  result = qword_256B22038;
  if (!qword_256B22038)
  {
    result = MEMORY[0x2426179DC](&unk_23C13BC7C, &type metadata for NetworkConditions.UnavailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22038);
  }
  return result;
}

unint64_t sub_23C10D308()
{
  unint64_t result;

  result = qword_256B22040;
  if (!qword_256B22040)
  {
    result = MEMORY[0x2426179DC](&unk_23C13BC2C, &type metadata for NetworkConditions.AvailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22040);
  }
  return result;
}

_QWORD *NetworkConditions.init(from:)(_QWORD *a1)
{
  return sub_23C10D564(a1);
}

_QWORD *sub_23C10D360@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_23C10D564(a1);
  if (!v2)
    *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_23C10D388(_QWORD *a1)
{
  unsigned __int8 *v1;

  return NetworkConditions.encode(to:)(a1, *v1);
}

uint64_t NetworkConditions.hash(into:)()
{
  return sub_23C1392FC();
}

uint64_t NetworkConditions.hashValue.getter()
{
  sub_23C1392F0();
  sub_23C1392FC();
  return sub_23C139320();
}

uint64_t sub_23C10D408(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6C62616C69617661 && a2 == 0xE900000000000065;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x616C696176616E75 && a2 == 0xEB00000000656C62 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

_QWORD *sub_23C10D564(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  _QWORD *v30;
  char v31;
  char v32;
  char v33;

  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22098);
  v25 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B220A0);
  v23 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B220A8);
  v4 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B220B0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (uint64_t *)((char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C10D23C();
  v11 = (uint64_t)v30;
  sub_23C13932C();
  if (v11)
    goto LABEL_7;
  v21 = v4;
  v22 = v8;
  v12 = v29;
  v30 = a1;
  v13 = v10;
  v14 = sub_23C13920C();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v18 = sub_23C139110();
    swift_allocError();
    v10 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B21A98);
    *v10 = &type metadata for NetworkConditions;
    sub_23C1391A0();
    sub_23C139104();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v10, *MEMORY[0x24BEE26D0], v18);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v22 + 8))(v13, v7);
    a1 = v30;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v10;
  }
  v10 = (_QWORD *)*(unsigned __int8 *)(v14 + 32);
  if (*(_BYTE *)(v14 + 32))
  {
    if ((_DWORD)v10 == 1)
    {
      v32 = 1;
      sub_23C10D2C4();
      v16 = v28;
      sub_23C139194();
      v17 = v22;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v16, v26);
    }
    else
    {
      v33 = 2;
      sub_23C10D280();
      sub_23C139194();
      v17 = v22;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v27);
    }
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v17 + 8))(v13, v15);
  }
  else
  {
    v31 = 0;
    sub_23C10D308();
    sub_23C139194();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v24);
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v22 + 8))(v13, v7);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return v10;
}

unint64_t sub_23C10D940()
{
  unint64_t result;

  result = qword_256B22048;
  if (!qword_256B22048)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for NetworkConditions, &type metadata for NetworkConditions);
    atomic_store(result, (unint64_t *)&qword_256B22048);
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkConditions()
{
  return &type metadata for NetworkConditions;
}

uint64_t _s13FitnessForYou17NetworkConditionsOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C10D9E8 + 4 * byte_23C13B945[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C10DA1C + 4 * byte_23C13B940[v4]))();
}

uint64_t sub_23C10DA1C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C10DA24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C10DA2CLL);
  return result;
}

uint64_t sub_23C10DA38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C10DA40);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C10DA44(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C10DA4C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NetworkConditions.CodingKeys()
{
  return &type metadata for NetworkConditions.CodingKeys;
}

ValueMetadata *type metadata accessor for NetworkConditions.AvailableCodingKeys()
{
  return &type metadata for NetworkConditions.AvailableCodingKeys;
}

ValueMetadata *type metadata accessor for NetworkConditions.UnavailableCodingKeys()
{
  return &type metadata for NetworkConditions.UnavailableCodingKeys;
}

ValueMetadata *type metadata accessor for NetworkConditions.UnknownCodingKeys()
{
  return &type metadata for NetworkConditions.UnknownCodingKeys;
}

unint64_t sub_23C10DA9C()
{
  unint64_t result;

  result = qword_256B22050;
  if (!qword_256B22050)
  {
    result = MEMORY[0x2426179DC](&unk_23C13BC04, &type metadata for NetworkConditions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22050);
  }
  return result;
}

unint64_t sub_23C10DAE4()
{
  unint64_t result;

  result = qword_256B22058;
  if (!qword_256B22058)
  {
    result = MEMORY[0x2426179DC](&unk_23C13BB24, &type metadata for NetworkConditions.AvailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22058);
  }
  return result;
}

unint64_t sub_23C10DB2C()
{
  unint64_t result;

  result = qword_256B22060;
  if (!qword_256B22060)
  {
    result = MEMORY[0x2426179DC](&unk_23C13BB4C, &type metadata for NetworkConditions.AvailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22060);
  }
  return result;
}

unint64_t sub_23C10DB74()
{
  unint64_t result;

  result = qword_256B22068;
  if (!qword_256B22068)
  {
    result = MEMORY[0x2426179DC](&unk_23C13BAD4, &type metadata for NetworkConditions.UnavailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22068);
  }
  return result;
}

unint64_t sub_23C10DBBC()
{
  unint64_t result;

  result = qword_256B22070;
  if (!qword_256B22070)
  {
    result = MEMORY[0x2426179DC](&unk_23C13BAFC, &type metadata for NetworkConditions.UnavailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22070);
  }
  return result;
}

unint64_t sub_23C10DC04()
{
  unint64_t result;

  result = qword_256B22078;
  if (!qword_256B22078)
  {
    result = MEMORY[0x2426179DC](&unk_23C13BA84, &type metadata for NetworkConditions.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22078);
  }
  return result;
}

unint64_t sub_23C10DC4C()
{
  unint64_t result;

  result = qword_256B22080;
  if (!qword_256B22080)
  {
    result = MEMORY[0x2426179DC](&unk_23C13BAAC, &type metadata for NetworkConditions.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22080);
  }
  return result;
}

unint64_t sub_23C10DC94()
{
  unint64_t result;

  result = qword_256B22088;
  if (!qword_256B22088)
  {
    result = MEMORY[0x2426179DC](&unk_23C13BB74, &type metadata for NetworkConditions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22088);
  }
  return result;
}

unint64_t sub_23C10DCDC()
{
  unint64_t result;

  result = qword_256B22090;
  if (!qword_256B22090)
  {
    result = MEMORY[0x2426179DC](&unk_23C13BB9C, &type metadata for NetworkConditions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22090);
  }
  return result;
}

FitnessForYou::SubtitleTextType_optional __swiftcall SubtitleTextType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1;
  FitnessForYou::SubtitleTextType_optional v2;

  v1 = sub_23C139188();
  swift_bridgeObjectRelease();
  if (v1 == 1)
    v2.value = FitnessForYou_SubtitleTextType_text;
  else
    v2.value = FitnessForYou_SubtitleTextType_unknownDefault;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t SubtitleTextType.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 1954047348;
  else
    return 0x657069636572;
}

uint64_t sub_23C10DD9C(char *a1, char *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = SubtitleTextType.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == SubtitleTextType.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_23C139284();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23C10DE24@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_23C139188();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_23C10DE80@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = SubtitleTextType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23C10DEA8()
{
  sub_23C10E1FC();
  return sub_23C13902C();
}

uint64_t sub_23C10DF04()
{
  sub_23C10E1FC();
  return sub_23C139020();
}

unint64_t sub_23C10DF54()
{
  unint64_t result;

  result = qword_256B220B8;
  if (!qword_256B220B8)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for SubtitleTextType, &type metadata for SubtitleTextType);
    atomic_store(result, (unint64_t *)&qword_256B220B8);
  }
  return result;
}

uint64_t sub_23C10DF98()
{
  char *v0;
  char v1;

  v1 = *v0;
  sub_23C1392F0();
  SubtitleTextType.rawValue.getter(v1);
  sub_23C139008();
  swift_bridgeObjectRelease();
  return sub_23C139320();
}

uint64_t sub_23C10DFF8()
{
  char *v0;

  SubtitleTextType.rawValue.getter(*v0);
  sub_23C139008();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C10E038()
{
  char *v0;
  char v1;

  v1 = *v0;
  sub_23C1392F0();
  SubtitleTextType.rawValue.getter(v1);
  sub_23C139008();
  swift_bridgeObjectRelease();
  return sub_23C139320();
}

uint64_t getEnumTagSinglePayload for PlaceholderMarkerType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SubtitleTextType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C10E170 + 4 * byte_23C13BDA5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C10E1A4 + 4 * byte_23C13BDA0[v4]))();
}

uint64_t sub_23C10E1A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C10E1AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C10E1B4);
  return result;
}

uint64_t sub_23C10E1C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C10E1C8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C10E1CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C10E1D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23C10E1E0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SubtitleTextType()
{
  return &type metadata for SubtitleTextType;
}

unint64_t sub_23C10E1FC()
{
  unint64_t result;

  result = qword_256B220C0;
  if (!qword_256B220C0)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for SubtitleTextType, &type metadata for SubtitleTextType);
    atomic_store(result, (unint64_t *)&qword_256B220C0);
  }
  return result;
}

BOOL static RemoteBrowsingIdentity.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_23C10E250(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7069636974726170;
  else
    return 0x756F6D796E6F6E61;
}

uint64_t sub_23C10E294()
{
  sub_23C10E62C();
  return sub_23C139350();
}

uint64_t sub_23C10E2BC()
{
  sub_23C10E62C();
  return sub_23C13935C();
}

BOOL sub_23C10E2E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23C10E2FC()
{
  char *v0;

  return sub_23C10E250(*v0);
}

uint64_t sub_23C10E304@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C10E734(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C10E328(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23C10E334()
{
  sub_23C10E5A4();
  return sub_23C139350();
}

uint64_t sub_23C10E35C()
{
  sub_23C10E5A4();
  return sub_23C13935C();
}

uint64_t sub_23C10E384()
{
  sub_23C10E5E8();
  return sub_23C139350();
}

uint64_t sub_23C10E3AC()
{
  sub_23C10E5E8();
  return sub_23C13935C();
}

uint64_t RemoteBrowsingIdentity.encode(to:)(_QWORD *a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  char v18;
  char v19;

  v17 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B220C8);
  v15 = *(_QWORD *)(v3 - 8);
  v16 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B220D0);
  v6 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B220D8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C10E5A4();
  sub_23C139338();
  if ((v17 & 1) != 0)
  {
    v19 = 1;
    sub_23C10E5E8();
    sub_23C139218();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v16);
  }
  else
  {
    v18 = 0;
    sub_23C10E62C();
    sub_23C139218();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v14);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

unint64_t sub_23C10E5A4()
{
  unint64_t result;

  result = qword_256B220E0;
  if (!qword_256B220E0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C1F0, &type metadata for RemoteBrowsingIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B220E0);
  }
  return result;
}

unint64_t sub_23C10E5E8()
{
  unint64_t result;

  result = qword_256B220E8;
  if (!qword_256B220E8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C1A0, &type metadata for RemoteBrowsingIdentity.ParticipantCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B220E8);
  }
  return result;
}

unint64_t sub_23C10E62C()
{
  unint64_t result;

  result = qword_256B220F0;
  if (!qword_256B220F0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C150, &type metadata for RemoteBrowsingIdentity.AnonymousCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B220F0);
  }
  return result;
}

uint64_t RemoteBrowsingIdentity.init(from:)(_QWORD *a1)
{
  return sub_23C10E834(a1) & 1;
}

uint64_t sub_23C10E688@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23C10E834(a1);
  if (!v2)
    *a2 = result & 1;
  return result;
}

uint64_t sub_23C10E6B4(_QWORD *a1)
{
  unsigned __int8 *v1;

  return RemoteBrowsingIdentity.encode(to:)(a1, *v1);
}

uint64_t RemoteBrowsingIdentity.hash(into:)()
{
  return sub_23C1392FC();
}

uint64_t RemoteBrowsingIdentity.hashValue.getter()
{
  sub_23C1392F0();
  sub_23C1392FC();
  return sub_23C139320();
}

uint64_t sub_23C10E734(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x756F6D796E6F6E61 && a2 == 0xE900000000000073;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7069636974726170 && a2 == 0xEB00000000746E61)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C10E834(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char v27;
  char v28;

  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22138);
  v22 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v25 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22140);
  v3 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22148);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C10E5A4();
  v10 = v26;
  sub_23C13932C();
  if (v10)
    goto LABEL_7;
  v11 = v5;
  v12 = v25;
  v21 = a1;
  v26 = v7;
  v13 = sub_23C13920C();
  v14 = v6;
  if (*(_QWORD *)(v13 + 16) != 1)
  {
    v16 = sub_23C139110();
    swift_allocError();
    v17 = v9;
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B21A98);
    *v19 = &type metadata for RemoteBrowsingIdentity;
    sub_23C1391A0();
    sub_23C139104();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v19, *MEMORY[0x24BEE26D0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v17, v6);
    a1 = v21;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v6;
  }
  v6 = *(unsigned __int8 *)(v13 + 32);
  if ((v6 & 1) != 0)
  {
    v28 = 1;
    sub_23C10E5E8();
    sub_23C139194();
    v15 = v26;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v24);
  }
  else
  {
    v27 = 0;
    sub_23C10E62C();
    sub_23C139194();
    v15 = v26;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v23);
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  return v6;
}

unint64_t sub_23C10EB64()
{
  unint64_t result;

  result = qword_256B220F8;
  if (!qword_256B220F8)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for RemoteBrowsingIdentity, &type metadata for RemoteBrowsingIdentity);
    atomic_store(result, (unint64_t *)&qword_256B220F8);
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdentity()
{
  return &type metadata for RemoteBrowsingIdentity;
}

uint64_t _s13FitnessForYou22RemoteBrowsingIdentityOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C10EC0C + 4 * byte_23C13BEC5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C10EC40 + 4 * asc_23C13BEC0[v4]))();
}

uint64_t sub_23C10EC40(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C10EC48(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C10EC50);
  return result;
}

uint64_t sub_23C10EC5C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C10EC64);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C10EC68(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C10EC70(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdentity.CodingKeys()
{
  return &type metadata for RemoteBrowsingIdentity.CodingKeys;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdentity.AnonymousCodingKeys()
{
  return &type metadata for RemoteBrowsingIdentity.AnonymousCodingKeys;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdentity.ParticipantCodingKeys()
{
  return &type metadata for RemoteBrowsingIdentity.ParticipantCodingKeys;
}

unint64_t sub_23C10ECB0()
{
  unint64_t result;

  result = qword_256B22100;
  if (!qword_256B22100)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C128, &type metadata for RemoteBrowsingIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22100);
  }
  return result;
}

unint64_t sub_23C10ECF8()
{
  unint64_t result;

  result = qword_256B22108;
  if (!qword_256B22108)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C048, &type metadata for RemoteBrowsingIdentity.AnonymousCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22108);
  }
  return result;
}

unint64_t sub_23C10ED40()
{
  unint64_t result;

  result = qword_256B22110;
  if (!qword_256B22110)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C070, &type metadata for RemoteBrowsingIdentity.AnonymousCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22110);
  }
  return result;
}

unint64_t sub_23C10ED88()
{
  unint64_t result;

  result = qword_256B22118;
  if (!qword_256B22118)
  {
    result = MEMORY[0x2426179DC](&unk_23C13BFF8, &type metadata for RemoteBrowsingIdentity.ParticipantCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22118);
  }
  return result;
}

unint64_t sub_23C10EDD0()
{
  unint64_t result;

  result = qword_256B22120;
  if (!qword_256B22120)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C020, &type metadata for RemoteBrowsingIdentity.ParticipantCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22120);
  }
  return result;
}

unint64_t sub_23C10EE18()
{
  unint64_t result;

  result = qword_256B22128;
  if (!qword_256B22128)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C098, &type metadata for RemoteBrowsingIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22128);
  }
  return result;
}

unint64_t sub_23C10EE60()
{
  unint64_t result;

  result = qword_256B22130;
  if (!qword_256B22130)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C0C0, &type metadata for RemoteBrowsingIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22130);
  }
  return result;
}

uint64_t ForYouPerformanceMetric.pageAppearTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t ForYouPerformanceMetric.pageAppearTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*ForYouPerformanceMetric.pageAppearTime.modify())()
{
  return nullsub_1;
}

uint64_t ForYouPerformanceMetric.pageRequestTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t ForYouPerformanceMetric.pageRequestTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = result;
  *(_BYTE *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*ForYouPerformanceMetric.pageRequestTime.modify())()
{
  return nullsub_1;
}

uint64_t ForYouPerformanceMetric.resourceRequestStartTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t ForYouPerformanceMetric.resourceRequestStartTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = result;
  *(_BYTE *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*ForYouPerformanceMetric.resourceRequestStartTime.modify())()
{
  return nullsub_1;
}

uint64_t ForYouPerformanceMetric.secondaryDataRequestStartTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t ForYouPerformanceMetric.secondaryDataRequestStartTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = result;
  *(_BYTE *)(v2 + 56) = a2 & 1;
  return result;
}

uint64_t (*ForYouPerformanceMetric.secondaryDataRequestStartTime.modify())()
{
  return nullsub_1;
}

uint64_t ForYouPerformanceMetric.secondaryDataResponseEndTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t ForYouPerformanceMetric.secondaryDataResponseEndTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = result;
  *(_BYTE *)(v2 + 72) = a2 & 1;
  return result;
}

uint64_t (*ForYouPerformanceMetric.secondaryDataResponseEndTime.modify())()
{
  return nullsub_1;
}

void __swiftcall ForYouPerformanceMetric.init(pageAppearTime:pageRequestTime:resourceRequestStartTime:secondaryDataRequestStartTime:secondaryDataResponseEndTime:)(FitnessForYou::ForYouPerformanceMetric *__return_ptr retstr, Swift::Double_optional pageAppearTime, Swift::Double_optional pageRequestTime, Swift::Double_optional resourceRequestStartTime, Swift::Double_optional secondaryDataRequestStartTime, Swift::Double_optional secondaryDataResponseEndTime)
{
  char v6;
  Swift::Double v7;
  char v8;
  Swift::Double v9;
  char v10;

  retstr->pageAppearTime.value = *(Swift::Double *)&pageAppearTime.is_nil;
  retstr->pageAppearTime.is_nil = pageRequestTime.is_nil;
  retstr->pageRequestTime.value = *(Swift::Double *)&resourceRequestStartTime.is_nil;
  retstr->pageRequestTime.is_nil = secondaryDataRequestStartTime.is_nil;
  retstr->resourceRequestStartTime.value = *(Swift::Double *)&secondaryDataResponseEndTime.is_nil;
  retstr->resourceRequestStartTime.is_nil = v6 & 1;
  retstr->secondaryDataRequestStartTime.value = v7;
  retstr->secondaryDataRequestStartTime.is_nil = v8 & 1;
  retstr->secondaryDataResponseEndTime.value = v9;
  retstr->secondaryDataResponseEndTime.is_nil = v10 & 1;
}

uint64_t sub_23C10EFD0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C10F008 + 4 * byte_23C13C240[a1]))(0xD000000000000018, 0x800000023C140610);
}

uint64_t sub_23C10F008()
{
  return 0x6570704165676170;
}

uint64_t sub_23C10F02C()
{
  return 0x7571655265676170;
}

uint64_t sub_23C10F050(uint64_t a1)
{
  return a1 + 5;
}

uint64_t sub_23C10F078()
{
  unsigned __int8 *v0;

  return sub_23C10EFD0(*v0);
}

uint64_t sub_23C10F080@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C10FBB0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C10F0A4()
{
  sub_23C10F2F0();
  return sub_23C139350();
}

uint64_t sub_23C10F0CC()
{
  sub_23C10F2F0();
  return sub_23C13935C();
}

uint64_t ForYouPerformanceMetric.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _DWORD v9[4];
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22150);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(v1 + 16);
  v15 = *(unsigned __int8 *)(v1 + 24);
  v14 = *(_QWORD *)(v1 + 32);
  v13 = *(unsigned __int8 *)(v1 + 40);
  v12 = *(_QWORD *)(v1 + 48);
  v11 = *(unsigned __int8 *)(v1 + 56);
  v10 = *(_QWORD *)(v1 + 64);
  v9[3] = *(unsigned __int8 *)(v1 + 72);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C10F2F0();
  sub_23C139338();
  v22 = 0;
  v7 = v17;
  sub_23C139230();
  if (!v7)
  {
    v21 = 1;
    sub_23C139230();
    v20 = 2;
    sub_23C139230();
    v19 = 3;
    sub_23C139230();
    v18 = 4;
    sub_23C139230();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23C10F2F0()
{
  unint64_t result;

  result = qword_256B22158;
  if (!qword_256B22158)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C3FC, &type metadata for ForYouPerformanceMetric.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22158);
  }
  return result;
}

uint64_t ForYouPerformanceMetric.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v19;
  char *v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22160);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C10F2F0();
  sub_23C13932C();
  if (!v2)
  {
    v33 = 0;
    v9 = sub_23C1391B8();
    v11 = v10;
    v32 = 1;
    v12 = sub_23C1391B8();
    v27 = v13;
    v28 = v12;
    v31 = 2;
    v14 = sub_23C1391B8();
    v25 = v15;
    v26 = v14;
    v30 = 3;
    v16 = sub_23C1391B8();
    HIDWORD(v23) = v17;
    v24 = v16;
    v29 = 4;
    v19 = sub_23C1391B8();
    v20 = v8;
    v22 = v21;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v20, v5);
    *(_QWORD *)a2 = v9;
    *(_BYTE *)(a2 + 8) = v11 & 1;
    *(_QWORD *)(a2 + 16) = v28;
    *(_BYTE *)(a2 + 24) = v27 & 1;
    *(_QWORD *)(a2 + 32) = v26;
    *(_BYTE *)(a2 + 40) = v25 & 1;
    *(_QWORD *)(a2 + 48) = v24;
    *(_BYTE *)(a2 + 56) = BYTE4(v23) & 1;
    *(_QWORD *)(a2 + 64) = v19;
    *(_BYTE *)(a2 + 72) = v22 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23C10F55C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ForYouPerformanceMetric.init(from:)(a1, a2);
}

uint64_t sub_23C10F570(_QWORD *a1)
{
  return ForYouPerformanceMetric.encode(to:)(a1);
}

uint64_t ForYouPerformanceMetric.hash(into:)()
{
  _BYTE *v0;
  int v1;
  int v2;
  int v3;
  int v4;

  v1 = v0[24];
  v2 = v0[40];
  v3 = v0[56];
  v4 = v0[72];
  if (v0[8] == 1)
  {
    sub_23C139308();
    if (!v1)
      goto LABEL_3;
  }
  else
  {
    sub_23C139308();
    sub_23C139314();
    if (!v1)
    {
LABEL_3:
      sub_23C139308();
      sub_23C139314();
      if (!v2)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  sub_23C139308();
  if (!v2)
  {
LABEL_4:
    sub_23C139308();
    sub_23C139314();
    if (!v3)
      goto LABEL_5;
LABEL_10:
    sub_23C139308();
    if (!v4)
      goto LABEL_6;
    return sub_23C139308();
  }
LABEL_9:
  sub_23C139308();
  if (v3)
    goto LABEL_10;
LABEL_5:
  sub_23C139308();
  sub_23C139314();
  if (!v4)
  {
LABEL_6:
    sub_23C139308();
    return sub_23C139314();
  }
  return sub_23C139308();
}

uint64_t ForYouPerformanceMetric.hashValue.getter()
{
  sub_23C1392F0();
  ForYouPerformanceMetric.hash(into:)();
  return sub_23C139320();
}

uint64_t sub_23C10F738()
{
  sub_23C1392F0();
  ForYouPerformanceMetric.hash(into:)();
  return sub_23C139320();
}

uint64_t sub_23C10F7CC()
{
  sub_23C1392F0();
  ForYouPerformanceMetric.hash(into:)();
  return sub_23C139320();
}

BOOL _s13FitnessForYou0bC17PerformanceMetricV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;
  char v4;
  char v5;
  char v7;

  v2 = *(_BYTE *)(a2 + 8);
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 8))
      return 0;
  }
  else
  {
    if (*(double *)a1 != *(double *)a2)
      v2 = 1;
    if ((v2 & 1) != 0)
      return 0;
  }
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 24))
      return 0;
  }
  else
  {
    if (*(double *)(a1 + 16) == *(double *)(a2 + 16))
      v3 = *(_BYTE *)(a2 + 24);
    else
      v3 = 1;
    if ((v3 & 1) != 0)
      return 0;
  }
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 40))
      return 0;
  }
  else
  {
    if (*(double *)(a1 + 32) == *(double *)(a2 + 32))
      v4 = *(_BYTE *)(a2 + 40);
    else
      v4 = 1;
    if ((v4 & 1) != 0)
      return 0;
  }
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 56))
      return 0;
  }
  else
  {
    if (*(double *)(a1 + 48) == *(double *)(a2 + 48))
      v5 = *(_BYTE *)(a2 + 56);
    else
      v5 = 1;
    if ((v5 & 1) != 0)
      return 0;
  }
  if ((*(_BYTE *)(a1 + 72) & 1) == 0)
  {
    if (*(double *)(a1 + 64) == *(double *)(a2 + 64))
      v7 = *(_BYTE *)(a2 + 72);
    else
      v7 = 1;
    return (v7 & 1) == 0;
  }
  return (*(_BYTE *)(a2 + 72) & 1) != 0;
}

unint64_t sub_23C10F934()
{
  unint64_t result;

  result = qword_256B22168;
  if (!qword_256B22168)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for ForYouPerformanceMetric, &type metadata for ForYouPerformanceMetric);
    atomic_store(result, (unint64_t *)&qword_256B22168);
  }
  return result;
}

__n128 __swift_memcpy73_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ForYouPerformanceMetric(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 73))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ForYouPerformanceMetric(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 72) = 0;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 73) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ForYouPerformanceMetric()
{
  return &type metadata for ForYouPerformanceMetric;
}

uint64_t storeEnumTagSinglePayload for ForYouPerformanceMetric.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C10FA58 + 4 * byte_23C13C24A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23C10FA8C + 4 * byte_23C13C245[v4]))();
}

uint64_t sub_23C10FA8C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C10FA94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C10FA9CLL);
  return result;
}

uint64_t sub_23C10FAA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C10FAB0);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23C10FAB4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C10FABC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ForYouPerformanceMetric.CodingKeys()
{
  return &type metadata for ForYouPerformanceMetric.CodingKeys;
}

unint64_t sub_23C10FADC()
{
  unint64_t result;

  result = qword_256B22170;
  if (!qword_256B22170)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C3D4, &type metadata for ForYouPerformanceMetric.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22170);
  }
  return result;
}

unint64_t sub_23C10FB24()
{
  unint64_t result;

  result = qword_256B22178;
  if (!qword_256B22178)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C344, &type metadata for ForYouPerformanceMetric.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22178);
  }
  return result;
}

unint64_t sub_23C10FB6C()
{
  unint64_t result;

  result = qword_256B22180;
  if (!qword_256B22180)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C36C, &type metadata for ForYouPerformanceMetric.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22180);
  }
  return result;
}

uint64_t sub_23C10FBB0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6570704165676170 && a2 == 0xEE00656D69547261;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7571655265676170 && a2 == 0xEF656D6954747365 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000023C140610 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x800000023C140630 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x800000023C140650)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

FitnessForYou::PlaceholderMarkerType_optional __swiftcall PlaceholderMarkerType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1;
  FitnessForYou::PlaceholderMarkerType_optional v2;

  v1 = sub_23C139188();
  swift_bridgeObjectRelease();
  if (v1 == 1)
    v2.value = FitnessForYou_PlaceholderMarkerType_buildYourFirstCustomPlan;
  else
    v2.value = FitnessForYou_PlaceholderMarkerType_unknownDefault;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t PlaceholderMarkerType.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000018;
  else
    return 0x737543646C697562;
}

uint64_t sub_23C10FE6C(char *a1, char *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = PlaceholderMarkerType.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == PlaceholderMarkerType.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_23C139284();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23C10FEF4@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_23C139188();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_23C10FF50@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = PlaceholderMarkerType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23C10FF78()
{
  sub_23C110230();
  return sub_23C13902C();
}

uint64_t sub_23C10FFD4()
{
  sub_23C110230();
  return sub_23C139020();
}

unint64_t sub_23C110024()
{
  unint64_t result;

  result = qword_256B22188;
  if (!qword_256B22188)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for PlaceholderMarkerType, &type metadata for PlaceholderMarkerType);
    atomic_store(result, (unint64_t *)&qword_256B22188);
  }
  return result;
}

uint64_t sub_23C110068()
{
  char *v0;
  char v1;

  v1 = *v0;
  sub_23C1392F0();
  PlaceholderMarkerType.rawValue.getter(v1);
  sub_23C139008();
  swift_bridgeObjectRelease();
  return sub_23C139320();
}

uint64_t sub_23C1100C8()
{
  char *v0;

  PlaceholderMarkerType.rawValue.getter(*v0);
  sub_23C139008();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C110108()
{
  char *v0;
  char v1;

  v1 = *v0;
  sub_23C1392F0();
  PlaceholderMarkerType.rawValue.getter(v1);
  sub_23C139008();
  swift_bridgeObjectRelease();
  return sub_23C139320();
}

uint64_t storeEnumTagSinglePayload for PlaceholderMarkerType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1101B0 + 4 * byte_23C13C455[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C1101E4 + 4 * byte_23C13C450[v4]))();
}

uint64_t sub_23C1101E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1101EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1101F4);
  return result;
}

uint64_t sub_23C110200(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C110208);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C11020C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C110214(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PlaceholderMarkerType()
{
  return &type metadata for PlaceholderMarkerType;
}

unint64_t sub_23C110230()
{
  unint64_t result;

  result = qword_256B22190;
  if (!qword_256B22190)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for PlaceholderMarkerType, &type metadata for PlaceholderMarkerType);
    atomic_store(result, (unint64_t *)&qword_256B22190);
  }
  return result;
}

BOOL static SizeClass.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23C110284(char a1)
{
  return *(_QWORD *)&aExtrasmasmall[8 * a1];
}

uint64_t sub_23C1102A4()
{
  char *v0;

  return sub_23C110284(*v0);
}

uint64_t sub_23C1102AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C110C10(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C1102D0(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_23C1102DC()
{
  sub_23C110918();
  return sub_23C139350();
}

uint64_t sub_23C110304()
{
  sub_23C110918();
  return sub_23C13935C();
}

uint64_t sub_23C11032C()
{
  sub_23C11095C();
  return sub_23C139350();
}

uint64_t sub_23C110354()
{
  sub_23C11095C();
  return sub_23C13935C();
}

uint64_t sub_23C11037C()
{
  sub_23C110AB0();
  return sub_23C139350();
}

uint64_t sub_23C1103A4()
{
  sub_23C110AB0();
  return sub_23C13935C();
}

uint64_t sub_23C1103CC()
{
  sub_23C1109A0();
  return sub_23C139350();
}

uint64_t sub_23C1103F4()
{
  sub_23C1109A0();
  return sub_23C13935C();
}

uint64_t sub_23C11041C()
{
  sub_23C1109E4();
  return sub_23C139350();
}

uint64_t sub_23C110444()
{
  sub_23C1109E4();
  return sub_23C13935C();
}

uint64_t sub_23C11046C()
{
  sub_23C110A28();
  return sub_23C139350();
}

uint64_t sub_23C110494()
{
  sub_23C110A28();
  return sub_23C13935C();
}

uint64_t sub_23C1104BC()
{
  sub_23C110A6C();
  return sub_23C139350();
}

uint64_t sub_23C1104E4()
{
  sub_23C110A6C();
  return sub_23C13935C();
}

void SizeClass.encode(to:)(_QWORD *a1, uint64_t a2)
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22198);
  v25 = *(_QWORD *)(v3 - 8);
  v26 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v24 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B221A0);
  v22 = *(_QWORD *)(v5 - 8);
  v23 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v21 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B221A8);
  v19 = *(_QWORD *)(v7 - 8);
  v20 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v18 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B221B0);
  v16 = *(_QWORD *)(v9 - 8);
  v17 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v15 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B221B8);
  MEMORY[0x24BDAC7A8](v14);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B221C0);
  MEMORY[0x24BDAC7A8](v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B221C8);
  v27 = *(_QWORD *)(v12 - 8);
  v28 = v12;
  MEMORY[0x24BDAC7A8](v12);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C110918();
  sub_23C139338();
  __asm { BR              X10 }
}

uint64_t sub_23C110740()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 - 70) = 0;
  sub_23C110AB0();
  v5 = *(_QWORD *)(v4 - 104);
  sub_23C139218();
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 112) + 8))(v1, v5);
}

unint64_t sub_23C110918()
{
  unint64_t result;

  result = qword_256B221D0;
  if (!qword_256B221D0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13CBC0, &type metadata for SizeClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B221D0);
  }
  return result;
}

unint64_t sub_23C11095C()
{
  unint64_t result;

  result = qword_256B221D8;
  if (!qword_256B221D8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13CB70, &type metadata for SizeClass.ExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B221D8);
  }
  return result;
}

unint64_t sub_23C1109A0()
{
  unint64_t result;

  result = qword_256B221E0;
  if (!qword_256B221E0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13CB20, &type metadata for SizeClass.LargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B221E0);
  }
  return result;
}

unint64_t sub_23C1109E4()
{
  unint64_t result;

  result = qword_256B221E8;
  if (!qword_256B221E8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13CAD0, &type metadata for SizeClass.MediumCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B221E8);
  }
  return result;
}

unint64_t sub_23C110A28()
{
  unint64_t result;

  result = qword_256B221F0;
  if (!qword_256B221F0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13CA80, &type metadata for SizeClass.RegularCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B221F0);
  }
  return result;
}

unint64_t sub_23C110A6C()
{
  unint64_t result;

  result = qword_256B221F8;
  if (!qword_256B221F8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13CA30, &type metadata for SizeClass.SmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B221F8);
  }
  return result;
}

unint64_t sub_23C110AB0()
{
  unint64_t result;

  result = qword_256B22200;
  if (!qword_256B22200)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C9E0, &type metadata for SizeClass.ExtraSmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22200);
  }
  return result;
}

uint64_t SizeClass.init(from:)(_QWORD *a1)
{
  return sub_23C110E60(a1);
}

uint64_t sub_23C110B08@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23C110E60(a1);
  if (!v2)
    *a2 = result;
  return result;
}

void sub_23C110B30(_QWORD *a1)
{
  unsigned __int8 *v1;

  SizeClass.encode(to:)(a1, *v1);
}

BOOL static SizeClass.< infix(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  return a1 < a2;
}

BOOL sub_23C110B58(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_23C110B6C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_23C110B80(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_23C110B94(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

uint64_t SizeClass.hash(into:)()
{
  return sub_23C1392FC();
}

uint64_t SizeClass.hashValue.getter()
{
  sub_23C1392F0();
  sub_23C1392FC();
  return sub_23C139320();
}

uint64_t sub_23C110C10(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0x616D536172747865 && a2 == 0xEA00000000006C6CLL || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C6C616D73 && a2 == 0xE500000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x72616C75676572 && a2 == 0xE700000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6D756964656DLL && a2 == 0xE600000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656772616CLL && a2 == 0xE500000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x72614C6172747865 && a2 == 0xEA00000000006567)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v5 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_23C110E60(_QWORD *a1)
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD v25[3];
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
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  _QWORD *v42;
  char *v43;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22288);
  v27 = *(_QWORD *)(v2 - 8);
  v28 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v41 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22290);
  v34 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v40 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22298);
  v31 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v39 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B222A0);
  v32 = *(_QWORD *)(v6 - 8);
  v33 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v38 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B222A8);
  v29 = *(_QWORD *)(v8 - 8);
  v30 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v37 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B222B0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B222B8);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1[3];
  v42 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_23C110918();
  v19 = v43;
  sub_23C13932C();
  if (!v19)
  {
    v43 = v13;
    v25[1] = v11;
    v25[2] = v10;
    v26 = v15;
    v20 = sub_23C13920C();
    if (*(_QWORD *)(v20 + 16) == 1)
      __asm { BR              X9 }
    v21 = sub_23C139110();
    swift_allocError();
    v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B21A98);
    *v23 = &type metadata for SizeClass;
    sub_23C1391A0();
    sub_23C139104();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x24BEE26D0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v17, v14);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  return v14;
}

void sub_23C111358()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v2 - 65) = 5;
  sub_23C11095C();
  sub_23C139194();
  if (v0)
  {
    swift_bridgeObjectRelease();
    JUMPOUT(0x23C11131CLL);
  }
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 224) + 8))(v1, *(_QWORD *)(v2 - 216));
  swift_bridgeObjectRelease();
  JUMPOUT(0x23C1113C4);
}

unint64_t sub_23C111404()
{
  unint64_t result;

  result = qword_256B22208;
  if (!qword_256B22208)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for SizeClass, &type metadata for SizeClass);
    atomic_store(result, (unint64_t *)&qword_256B22208);
  }
  return result;
}

ValueMetadata *type metadata accessor for SizeClass()
{
  return &type metadata for SizeClass;
}

uint64_t _s13FitnessForYou9SizeClassOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s13FitnessForYou9SizeClassOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C11153C + 4 * byte_23C13C581[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23C111570 + 4 * byte_23C13C57C[v4]))();
}

uint64_t sub_23C111570(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C111578(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C111580);
  return result;
}

uint64_t sub_23C11158C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C111594);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23C111598(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1115A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SizeClass.CodingKeys()
{
  return &type metadata for SizeClass.CodingKeys;
}

ValueMetadata *type metadata accessor for SizeClass.ExtraSmallCodingKeys()
{
  return &type metadata for SizeClass.ExtraSmallCodingKeys;
}

ValueMetadata *type metadata accessor for SizeClass.SmallCodingKeys()
{
  return &type metadata for SizeClass.SmallCodingKeys;
}

ValueMetadata *type metadata accessor for SizeClass.RegularCodingKeys()
{
  return &type metadata for SizeClass.RegularCodingKeys;
}

ValueMetadata *type metadata accessor for SizeClass.MediumCodingKeys()
{
  return &type metadata for SizeClass.MediumCodingKeys;
}

ValueMetadata *type metadata accessor for SizeClass.LargeCodingKeys()
{
  return &type metadata for SizeClass.LargeCodingKeys;
}

ValueMetadata *type metadata accessor for SizeClass.ExtraLargeCodingKeys()
{
  return &type metadata for SizeClass.ExtraLargeCodingKeys;
}

unint64_t sub_23C111620()
{
  unint64_t result;

  result = qword_256B22210;
  if (!qword_256B22210)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C9B8, &type metadata for SizeClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22210);
  }
  return result;
}

unint64_t sub_23C111668()
{
  unint64_t result;

  result = qword_256B22218;
  if (!qword_256B22218)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C8D8, &type metadata for SizeClass.ExtraSmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22218);
  }
  return result;
}

unint64_t sub_23C1116B0()
{
  unint64_t result;

  result = qword_256B22220;
  if (!qword_256B22220)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C900, &type metadata for SizeClass.ExtraSmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22220);
  }
  return result;
}

unint64_t sub_23C1116F8()
{
  unint64_t result;

  result = qword_256B22228;
  if (!qword_256B22228)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C888, &type metadata for SizeClass.SmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22228);
  }
  return result;
}

unint64_t sub_23C111740()
{
  unint64_t result;

  result = qword_256B22230;
  if (!qword_256B22230)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C8B0, &type metadata for SizeClass.SmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22230);
  }
  return result;
}

unint64_t sub_23C111788()
{
  unint64_t result;

  result = qword_256B22238;
  if (!qword_256B22238)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C838, &type metadata for SizeClass.RegularCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22238);
  }
  return result;
}

unint64_t sub_23C1117D0()
{
  unint64_t result;

  result = qword_256B22240;
  if (!qword_256B22240)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C860, &type metadata for SizeClass.RegularCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22240);
  }
  return result;
}

unint64_t sub_23C111818()
{
  unint64_t result;

  result = qword_256B22248;
  if (!qword_256B22248)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C7E8, &type metadata for SizeClass.MediumCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22248);
  }
  return result;
}

unint64_t sub_23C111860()
{
  unint64_t result;

  result = qword_256B22250;
  if (!qword_256B22250)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C810, &type metadata for SizeClass.MediumCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22250);
  }
  return result;
}

unint64_t sub_23C1118A8()
{
  unint64_t result;

  result = qword_256B22258;
  if (!qword_256B22258)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C798, &type metadata for SizeClass.LargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22258);
  }
  return result;
}

unint64_t sub_23C1118F0()
{
  unint64_t result;

  result = qword_256B22260;
  if (!qword_256B22260)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C7C0, &type metadata for SizeClass.LargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22260);
  }
  return result;
}

unint64_t sub_23C111938()
{
  unint64_t result;

  result = qword_256B22268;
  if (!qword_256B22268)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C748, &type metadata for SizeClass.ExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22268);
  }
  return result;
}

unint64_t sub_23C111980()
{
  unint64_t result;

  result = qword_256B22270;
  if (!qword_256B22270)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C770, &type metadata for SizeClass.ExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22270);
  }
  return result;
}

unint64_t sub_23C1119C8()
{
  unint64_t result;

  result = qword_256B22278;
  if (!qword_256B22278)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C928, &type metadata for SizeClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22278);
  }
  return result;
}

unint64_t sub_23C111A10()
{
  unint64_t result;

  result = qword_256B22280;
  if (!qword_256B22280)
  {
    result = MEMORY[0x2426179DC](&unk_23C13C950, &type metadata for SizeClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22280);
  }
  return result;
}

double ContentMargins.bottom.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double ContentMargins.leading.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

double ContentMargins.top.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

double ContentMargins.trailing.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

void ContentMargins.init(top:leading:bottom:trailing:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  *a1 = a4;
  a1[1] = a3;
  a1[2] = a2;
  a1[3] = a5;
}

uint64_t sub_23C111A80(char a1)
{
  return *(_QWORD *)&aBottom_0[8 * a1];
}

uint64_t sub_23C111AA0()
{
  char *v0;

  return sub_23C111A80(*v0);
}

uint64_t sub_23C111AA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1123A4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C111ACC()
{
  sub_23C111CDC();
  return sub_23C139350();
}

uint64_t sub_23C111AF4()
{
  sub_23C111CDC();
  return sub_23C13935C();
}

uint64_t ContentMargins.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B222C0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v11 = v1[2];
  v10 = v1[3];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C111CDC();
  sub_23C139338();
  v14 = v9;
  HIBYTE(v13) = 0;
  sub_23C111D20();
  sub_23C139278();
  if (!v2)
  {
    v14 = v8;
    HIBYTE(v13) = 1;
    sub_23C139278();
    v14 = v11;
    HIBYTE(v13) = 2;
    sub_23C139278();
    v14 = v10;
    HIBYTE(v13) = 3;
    sub_23C139278();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23C111CDC()
{
  unint64_t result;

  result = qword_256B222C8;
  if (!qword_256B222C8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13CE28, &type metadata for ContentMargins.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B222C8);
  }
  return result;
}

unint64_t sub_23C111D20()
{
  unint64_t result;

  result = qword_256B222D0;
  if (!qword_256B222D0)
  {
    result = MEMORY[0x2426179DC](MEMORY[0x24BEE50C0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_256B222D0);
  }
  return result;
}

uint64_t ContentMargins.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B222D8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C111CDC();
  sub_23C13932C();
  if (!v2)
  {
    HIBYTE(v14) = 0;
    sub_23C111F6C();
    sub_23C139200();
    v9 = v15;
    HIBYTE(v14) = 1;
    sub_23C139200();
    v10 = v15;
    HIBYTE(v14) = 2;
    sub_23C139200();
    v12 = v15;
    HIBYTE(v14) = 3;
    sub_23C139200();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v13 = v15;
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v12;
    a2[3] = v13;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_23C111F6C()
{
  unint64_t result;

  result = qword_256B222E0;
  if (!qword_256B222E0)
  {
    result = MEMORY[0x2426179DC](MEMORY[0x24BEE50E8], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_256B222E0);
  }
  return result;
}

uint64_t sub_23C111FB0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return ContentMargins.init(from:)(a1, a2);
}

uint64_t sub_23C111FC4(_QWORD *a1)
{
  return ContentMargins.encode(to:)(a1);
}

uint64_t ContentMargins.hash(into:)()
{
  sub_23C139314();
  sub_23C139314();
  sub_23C139314();
  return sub_23C139314();
}

uint64_t ContentMargins.hashValue.getter()
{
  sub_23C1392F0();
  ContentMargins.hash(into:)();
  return sub_23C139320();
}

uint64_t sub_23C11208C()
{
  sub_23C1392F0();
  ContentMargins.hash(into:)();
  return sub_23C139320();
}

uint64_t sub_23C1120D8()
{
  sub_23C1392F0();
  ContentMargins.hash(into:)();
  return sub_23C139320();
}

BOOL _s13FitnessForYou14ContentMarginsV2eeoiySbAC_ACtFZ_0(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

unint64_t sub_23C112160()
{
  unint64_t result;

  result = qword_256B222E8;
  if (!qword_256B222E8)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for ContentMargins, &type metadata for ContentMargins);
    atomic_store(result, (unint64_t *)&qword_256B222E8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ContentMargins(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ContentMargins(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ContentMargins()
{
  return &type metadata for ContentMargins;
}

uint64_t storeEnumTagSinglePayload for ContentMargins.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C11224C + 4 * byte_23C13CC7D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C112280 + 4 * byte_23C13CC78[v4]))();
}

uint64_t sub_23C112280(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C112288(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C112290);
  return result;
}

uint64_t sub_23C11229C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1122A4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C1122A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1122B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ContentMargins.CodingKeys()
{
  return &type metadata for ContentMargins.CodingKeys;
}

unint64_t sub_23C1122D0()
{
  unint64_t result;

  result = qword_256B222F0;
  if (!qword_256B222F0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13CE00, &type metadata for ContentMargins.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B222F0);
  }
  return result;
}

unint64_t sub_23C112318()
{
  unint64_t result;

  result = qword_256B222F8;
  if (!qword_256B222F8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13CD70, &type metadata for ContentMargins.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B222F8);
  }
  return result;
}

unint64_t sub_23C112360()
{
  unint64_t result;

  result = qword_256B22300;
  if (!qword_256B22300)
  {
    result = MEMORY[0x2426179DC](&unk_23C13CD98, &type metadata for ContentMargins.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22300);
  }
  return result;
}

uint64_t sub_23C1123A4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6D6F74746F62 && a2 == 0xE600000000000000;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696461656CLL && a2 == 0xE700000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 7368564 && a2 == 0xE300000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x676E696C69617274 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

BOOL sub_23C11252C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = type metadata accessor for ForYouState();
  return *(_QWORD *)(v0 + *(int *)(v1 + 64)) < *(_QWORD *)(v0 + *(int *)(v1 + 56));
}

uint64_t AwardCanvasPlaceholder.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AwardCanvasPlaceholder.referenceType.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t AwardCanvasPlaceholder.score.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

void __swiftcall AwardCanvasPlaceholder.init(identifier:referenceType:score:)(FitnessForYou::AwardCanvasPlaceholder *__return_ptr retstr, Swift::String identifier, FitnessForYou::PlaceholderReferenceType referenceType, Swift::Double_optional score)
{
  char v4;

  retstr->identifier = identifier;
  retstr->referenceType = referenceType;
  retstr->score.value = *(Swift::Double *)&score.is_nil;
  retstr->score.is_nil = v4 & 1;
}

uint64_t sub_23C1125B4(char a1)
{
  return *(_QWORD *)&aIdentifirefere[8 * a1];
}

uint64_t sub_23C1125D4()
{
  char *v0;

  return sub_23C1125B4(*v0);
}

uint64_t sub_23C1125DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C11315C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C112600()
{
  sub_23C1127D8();
  return sub_23C139350();
}

uint64_t sub_23C112628()
{
  sub_23C1127D8();
  return sub_23C13935C();
}

uint64_t AwardCanvasPlaceholder.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _DWORD v9[4];
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v13;
  char v14;
  char v15;
  char v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22308);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(unsigned __int8 *)(v1 + 16);
  v10 = *(_QWORD *)(v1 + 24);
  v9[3] = *(unsigned __int8 *)(v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1127D8();
  sub_23C139338();
  v16 = 0;
  v7 = v11;
  sub_23C139248();
  if (!v7)
  {
    v15 = v12;
    v14 = 1;
    sub_23C0FFB6C();
    sub_23C139278();
    v13 = 2;
    sub_23C139230();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23C1127D8()
{
  unint64_t result;

  result = qword_256B22310;
  if (!qword_256B22310)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D07C, &type metadata for AwardCanvasPlaceholder.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22310);
  }
  return result;
}

uint64_t AwardCanvasPlaceholder.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char *v14;
  char v15;
  char v16;
  uint64_t v17;
  int v18;
  char v19;
  char v20;
  unsigned __int8 v21;
  char v22;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22318);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1127D8();
  sub_23C13932C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v22 = 0;
  v9 = sub_23C1391D0();
  v11 = v10;
  v20 = 1;
  sub_23C1000B0();
  swift_bridgeObjectRetain();
  sub_23C139200();
  v18 = v21;
  v19 = 2;
  v13 = sub_23C1391B8();
  v14 = v8;
  v16 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_BYTE *)(a2 + 16) = v18;
  *(_QWORD *)(a2 + 24) = v13;
  *(_BYTE *)(a2 + 32) = v16 & 1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C1129FC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AwardCanvasPlaceholder.init(from:)(a1, a2);
}

uint64_t sub_23C112A10(_QWORD *a1)
{
  return AwardCanvasPlaceholder.encode(to:)(a1);
}

uint64_t AwardCanvasPlaceholder.hash(into:)()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 32);
  swift_bridgeObjectRetain();
  sub_23C139008();
  swift_bridgeObjectRelease();
  sub_23C139008();
  swift_bridgeObjectRelease();
  if (v1 == 1)
    return sub_23C139308();
  sub_23C139308();
  return sub_23C139314();
}

uint64_t AwardCanvasPlaceholder.hashValue.getter()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 32);
  sub_23C1392F0();
  sub_23C139008();
  sub_23C139008();
  swift_bridgeObjectRelease();
  sub_23C139308();
  if (v1 != 1)
    sub_23C139314();
  return sub_23C139320();
}

uint64_t sub_23C112BB8()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 32);
  sub_23C139008();
  sub_23C139008();
  swift_bridgeObjectRelease();
  if (v1 == 1)
    return sub_23C139308();
  sub_23C139308();
  return sub_23C139314();
}

uint64_t sub_23C112C58()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 32);
  sub_23C1392F0();
  sub_23C139008();
  sub_23C139008();
  swift_bridgeObjectRelease();
  sub_23C139308();
  if (v1 != 1)
    sub_23C139314();
  return sub_23C139320();
}

uint64_t _s13FitnessForYou22AwardCanvasPlaceholderV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  char v2;
  double v3;
  char v4;
  char v5;
  double v6;
  char v7;
  BOOL v8;
  char v9;
  uint64_t result;
  char v11;

  v2 = *(_BYTE *)(a1 + 16);
  v3 = *(double *)(a1 + 24);
  v4 = *(_BYTE *)(a1 + 32);
  v5 = *(_BYTE *)(a2 + 16);
  v6 = *(double *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  v8 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v8 || (v9 = sub_23C139284(), result = 0, (v9 & 1) != 0))
  {
    if ((sub_23C12B9A0(v2, v5) & 1) == 0)
      return 0;
    if ((v4 & 1) != 0)
    {
      if ((v7 & 1) == 0)
        return 0;
    }
    else
    {
      if (v3 == v6)
        v11 = v7;
      else
        v11 = 1;
      if ((v11 & 1) != 0)
        return 0;
    }
    return 1;
  }
  return result;
}

unint64_t sub_23C112DC8()
{
  unint64_t result;

  result = qword_256B22320;
  if (!qword_256B22320)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for AwardCanvasPlaceholder, &type metadata for AwardCanvasPlaceholder);
    atomic_store(result, (unint64_t *)&qword_256B22320);
  }
  return result;
}

uint64_t destroy for AwardCanvasPlaceholder()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AwardCanvasPlaceholder(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AwardCanvasPlaceholder(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v4;
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for AwardCanvasPlaceholder(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for AwardCanvasPlaceholder(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 33))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AwardCanvasPlaceholder(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 33) = 1;
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
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AwardCanvasPlaceholder()
{
  return &type metadata for AwardCanvasPlaceholder;
}

uint64_t storeEnumTagSinglePayload for AwardCanvasPlaceholder.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C113004 + 4 * byte_23C13CEC5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C113038 + 4 * byte_23C13CEC0[v4]))();
}

uint64_t sub_23C113038(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C113040(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C113048);
  return result;
}

uint64_t sub_23C113054(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C11305CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C113060(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C113068(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AwardCanvasPlaceholder.CodingKeys()
{
  return &type metadata for AwardCanvasPlaceholder.CodingKeys;
}

unint64_t sub_23C113088()
{
  unint64_t result;

  result = qword_256B22328;
  if (!qword_256B22328)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D054, &type metadata for AwardCanvasPlaceholder.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22328);
  }
  return result;
}

unint64_t sub_23C1130D0()
{
  unint64_t result;

  result = qword_256B22330;
  if (!qword_256B22330)
  {
    result = MEMORY[0x2426179DC](&unk_23C13CFC4, &type metadata for AwardCanvasPlaceholder.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22330);
  }
  return result;
}

unint64_t sub_23C113118()
{
  unint64_t result;

  result = qword_256B22338;
  if (!qword_256B22338)
  {
    result = MEMORY[0x2426179DC](&unk_23C13CFEC, &type metadata for AwardCanvasPlaceholder.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22338);
  }
  return result;
}

uint64_t sub_23C11315C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x636E657265666572 && a2 == 0xED00006570795465 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65726F6373 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23C1132B8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LocalizationBundle()
{
  return objc_opt_self();
}

id sub_23C1132E8()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for LocalizationBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_256B2FCE8 = (uint64_t)result;
  return result;
}

BOOL static ForYouToastAction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ForYouToastAction.hash(into:)()
{
  return sub_23C1392FC();
}

uint64_t sub_23C11337C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7061547473616F74;
  else
    return 0x6977537473616F74;
}

uint64_t sub_23C1133B4()
{
  char *v0;

  return sub_23C11337C(*v0);
}

uint64_t sub_23C1133BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C113E74(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C1133E0()
{
  sub_23C1136E8();
  return sub_23C139350();
}

uint64_t sub_23C113408()
{
  sub_23C1136E8();
  return sub_23C13935C();
}

uint64_t sub_23C113430()
{
  sub_23C113770();
  return sub_23C139350();
}

uint64_t sub_23C113458()
{
  sub_23C113770();
  return sub_23C13935C();
}

uint64_t sub_23C113480()
{
  sub_23C11372C();
  return sub_23C139350();
}

uint64_t sub_23C1134A8()
{
  sub_23C11372C();
  return sub_23C13935C();
}

uint64_t ForYouToastAction.hashValue.getter()
{
  sub_23C1392F0();
  sub_23C1392FC();
  return sub_23C139320();
}

uint64_t ForYouToastAction.encode(to:)(_QWORD *a1)
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B223D8);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B223E0);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B223E8);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1136E8();
  sub_23C139338();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23C11372C();
    sub_23C139218();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23C113770();
    sub_23C139218();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_23C1136E8()
{
  unint64_t result;

  result = qword_256B223F0;
  if (!qword_256B223F0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D4E0, &type metadata for ForYouToastAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B223F0);
  }
  return result;
}

unint64_t sub_23C11372C()
{
  unint64_t result;

  result = qword_256B223F8;
  if (!qword_256B223F8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D490, &type metadata for ForYouToastAction.ToastTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B223F8);
  }
  return result;
}

unint64_t sub_23C113770()
{
  unint64_t result;

  result = qword_256B22400;
  if (!qword_256B22400)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D440, &type metadata for ForYouToastAction.ToastSwipedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22400);
  }
  return result;
}

uint64_t ForYouToastAction.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22408);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22410);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22418);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1136E8();
  v11 = v33;
  sub_23C13932C();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23C13920C();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23C139110();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B21A98);
    *v21 = &type metadata for ForYouToastAction;
    sub_23C1391A0();
    sub_23C139104();
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
    sub_23C11372C();
    sub_23C139194();
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
    sub_23C113770();
    v22 = v6;
    sub_23C139194();
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

unint64_t sub_23C113B10()
{
  unint64_t result;

  result = qword_256B22420;
  if (!qword_256B22420)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for ForYouToastAction, &type metadata for ForYouToastAction);
    atomic_store(result, (unint64_t *)&qword_256B22420);
  }
  return result;
}

uint64_t sub_23C113B54@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return ForYouToastAction.init(from:)(a1, a2);
}

uint64_t sub_23C113B68(_QWORD *a1)
{
  return ForYouToastAction.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for ForYouToastAction()
{
  return &type metadata for ForYouToastAction;
}

uint64_t _s13FitnessForYou17ForYouToastActionOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C113BDC + 4 * byte_23C13D1B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C113C10 + 4 * asc_23C13D1B0[v4]))();
}

uint64_t sub_23C113C10(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C113C18(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C113C20);
  return result;
}

uint64_t sub_23C113C2C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C113C34);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C113C38(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C113C40(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ForYouToastAction.CodingKeys()
{
  return &type metadata for ForYouToastAction.CodingKeys;
}

ValueMetadata *type metadata accessor for ForYouToastAction.ToastSwipedCodingKeys()
{
  return &type metadata for ForYouToastAction.ToastSwipedCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouToastAction.ToastTappedCodingKeys()
{
  return &type metadata for ForYouToastAction.ToastTappedCodingKeys;
}

unint64_t sub_23C113C80()
{
  unint64_t result;

  result = qword_256B22428;
  if (!qword_256B22428)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D418, &type metadata for ForYouToastAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22428);
  }
  return result;
}

unint64_t sub_23C113CC8()
{
  unint64_t result;

  result = qword_256B22430;
  if (!qword_256B22430)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D338, &type metadata for ForYouToastAction.ToastSwipedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22430);
  }
  return result;
}

unint64_t sub_23C113D10()
{
  unint64_t result;

  result = qword_256B22438;
  if (!qword_256B22438)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D360, &type metadata for ForYouToastAction.ToastSwipedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22438);
  }
  return result;
}

unint64_t sub_23C113D58()
{
  unint64_t result;

  result = qword_256B22440;
  if (!qword_256B22440)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D2E8, &type metadata for ForYouToastAction.ToastTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22440);
  }
  return result;
}

unint64_t sub_23C113DA0()
{
  unint64_t result;

  result = qword_256B22448;
  if (!qword_256B22448)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D310, &type metadata for ForYouToastAction.ToastTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22448);
  }
  return result;
}

unint64_t sub_23C113DE8()
{
  unint64_t result;

  result = qword_256B22450;
  if (!qword_256B22450)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D388, &type metadata for ForYouToastAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22450);
  }
  return result;
}

unint64_t sub_23C113E30()
{
  unint64_t result;

  result = qword_256B22458;
  if (!qword_256B22458)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D3B0, &type metadata for ForYouToastAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22458);
  }
  return result;
}

uint64_t sub_23C113E74(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6977537473616F74 && a2 == 0xEB00000000646570;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7061547473616F74 && a2 == 0xEB00000000646570)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C113F7C(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000010;
  else
    return 0x696669746E656469;
}

uint64_t sub_23C113FBC(char a1)
{
  if ((a1 & 1) != 0)
    return 0x657669746361;
  else
    return 1701736302;
}

uint64_t sub_23C113FE8()
{
  char *v0;

  return sub_23C113F7C(*v0);
}

uint64_t sub_23C113FF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C115B68(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C114014()
{
  sub_23C1150C4();
  return sub_23C139350();
}

uint64_t sub_23C11403C()
{
  sub_23C1150C4();
  return sub_23C13935C();
}

uint64_t sub_23C114064()
{
  char *v0;

  return sub_23C113FBC(*v0);
}

uint64_t sub_23C11406C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C115C54(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C114090()
{
  sub_23C11503C();
  return sub_23C139350();
}

uint64_t sub_23C1140B8()
{
  sub_23C11503C();
  return sub_23C13935C();
}

uint64_t sub_23C1140E0()
{
  sub_23C115108();
  return sub_23C139350();
}

uint64_t sub_23C114108()
{
  sub_23C115108();
  return sub_23C13935C();
}

uint64_t PlanMetadata.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v14;
  uint64_t v15;
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
  char *v30;
  char v31;
  char v32;
  char v33;
  char v34;

  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22460);
  v24 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23C138BC4();
  v25 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v28 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22468);
  v22 = *(_QWORD *)(v5 - 8);
  v23 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for PlanMetadata();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22470);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C11503C();
  sub_23C139338();
  sub_23C115080(v29, (uint64_t)v10);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 48))(v10, 1, v15) == 1)
  {
    v31 = 0;
    sub_23C115108();
    sub_23C139218();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v23);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {
    v29 = v12;
    v18 = v24;
    v17 = v25;
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v28, v10, v3);
    v34 = 1;
    sub_23C1150C4();
    sub_23C139218();
    v33 = 0;
    sub_23C100BA4(&qword_256B22488, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
    v20 = v26;
    v19 = v27;
    sub_23C139278();
    if (!v19)
    {
      v32 = 1;
      sub_23C139254();
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v30, v20);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v28, v3);
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v14, v11);
  }
}

uint64_t PlanMetadata.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  char v46;
  char v47;
  char v48;
  char v49;

  v40 = a2;
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22498);
  v37 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v42 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B224A0);
  v38 = *(_QWORD *)(v4 - 8);
  v39 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v41 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B224A8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for PlanMetadata();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v34 - v14;
  v16 = a1[3];
  v44 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_23C11503C();
  v17 = v45;
  sub_23C13932C();
  if (!v17)
  {
    v35 = v13;
    v36 = v10;
    v19 = v41;
    v18 = v42;
    v20 = v43;
    v45 = v7;
    v21 = sub_23C13920C();
    if (*(_QWORD *)(v21 + 16) == 1)
    {
      if ((*(_BYTE *)(v21 + 32) & 1) != 0)
      {
        v49 = 1;
        sub_23C1150C4();
        sub_23C139194();
        sub_23C138BC4();
        v48 = 0;
        sub_23C100BA4(&qword_256B224B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
        sub_23C139200();
        v41 = (char *)v6;
        v47 = 1;
        v27 = sub_23C1391DC();
        v28 = v45;
        v29 = v27;
        v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
        v31 = *(int *)(v30 + 48);
        (*(void (**)(char *, uint64_t))(v37 + 8))(v18, v20);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, char *))(v28 + 8))(v9, v41);
        v32 = v29 & 1;
        v33 = (uint64_t)v35;
        v35[v31] = v32;
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v33, 0, 1, v30);
        sub_23C0FF558(v33, (uint64_t)v15);
      }
      else
      {
        v46 = 0;
        sub_23C115108();
        sub_23C139194();
        (*(void (**)(char *, uint64_t))(v38 + 8))(v19, v39);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v45 + 8))(v9, v6);
        v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v15, 1, 1, v26);
      }
      sub_23C0FF558((uint64_t)v15, v40);
    }
    else
    {
      v22 = sub_23C139110();
      swift_allocError();
      v24 = v23;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B21A98);
      *v24 = v36;
      sub_23C1391A0();
      sub_23C139104();
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v24, *MEMORY[0x24BEE26D0], v22);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v45 + 8))(v9, v6);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
}

uint64_t sub_23C11496C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return PlanMetadata.init(from:)(a1, a2);
}

uint64_t sub_23C114980(_QWORD *a1)
{
  return PlanMetadata.encode(to:)(a1);
}

uint64_t PlanMetadata.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v1 = v0;
  v2 = sub_23C138BC4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for PlanMetadata();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C115080(v1, (uint64_t)v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 1, v9) == 1)
    return sub_23C1392FC();
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
  sub_23C1392FC();
  sub_23C100BA4((unint64_t *)&qword_256B218E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23C138FC0();
  sub_23C139308();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t PlanMetadata.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v1 = v0;
  v2 = sub_23C138BC4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for PlanMetadata();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C1392F0();
  sub_23C115080(v1, (uint64_t)v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 1, v9) == 1)
  {
    sub_23C1392FC();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_23C1392FC();
    sub_23C100BA4((unint64_t *)&qword_256B218E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23C138FC0();
    sub_23C139308();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return sub_23C139320();
}

uint64_t sub_23C114C6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v1 = v0;
  v2 = sub_23C138BC4();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C1392F0();
  sub_23C115080(v1, (uint64_t)v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 1, v9) == 1)
  {
    sub_23C1392FC();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v2);
    sub_23C1392FC();
    sub_23C100BA4((unint64_t *)&qword_256B218E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23C138FC0();
    sub_23C139308();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return sub_23C139320();
}

uint64_t _s13FitnessForYou12PlanMetadataO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  int v18;
  int v19;
  char v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;

  v4 = sub_23C138BC4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PlanMetadata();
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22580);
  v10 = MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (uint64_t)&v12[*(int *)(v10 + 48)];
  sub_23C115080(a1, (uint64_t)v12);
  sub_23C115080(a2, v13);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 48);
  if (v15((uint64_t)v12, 1, v14) == 1)
  {
    if (v15(v13, 1, v14) == 1)
    {
      sub_23C115D24((uint64_t)v12);
      return 1;
    }
    goto LABEL_6;
  }
  sub_23C115080((uint64_t)v12, (uint64_t)v9);
  v17 = *(int *)(v14 + 48);
  v18 = v9[v17];
  if (v15(v13, 1, v14) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
LABEL_6:
    sub_23C106ED8((uint64_t)v12, &qword_256B22580);
    return 0;
  }
  v19 = *(unsigned __int8 *)(v13 + v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v13, v4);
  v20 = sub_23C138BB8();
  v21 = *(void (**)(char *, uint64_t))(v5 + 8);
  v21(v7, v4);
  v21(v9, v4);
  if ((v20 & 1) != 0)
  {
    sub_23C115D24((uint64_t)v12);
    return v18 ^ v19 ^ 1u;
  }
  sub_23C115D24((uint64_t)v12);
  return 0;
}

uint64_t type metadata accessor for PlanMetadata()
{
  uint64_t result;

  result = qword_256B22530;
  if (!qword_256B22530)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23C11503C()
{
  unint64_t result;

  result = qword_256B22478;
  if (!qword_256B22478)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D8C4, &type metadata for PlanMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22478);
  }
  return result;
}

uint64_t sub_23C115080(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PlanMetadata();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23C1150C4()
{
  unint64_t result;

  result = qword_256B22480;
  if (!qword_256B22480)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D874, &type metadata for PlanMetadata.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22480);
  }
  return result;
}

unint64_t sub_23C115108()
{
  unint64_t result;

  result = qword_256B22490;
  if (!qword_256B22490)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D824, &type metadata for PlanMetadata.NoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22490);
  }
  return result;
}

uint64_t sub_23C11514C()
{
  return sub_23C100BA4(&qword_256B224B8, (uint64_t (*)(uint64_t))type metadata accessor for PlanMetadata, (uint64_t)&protocol conformance descriptor for PlanMetadata);
}

uint64_t *initializeBufferWithCopyOfBuffer for PlanMetadata(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v10 = sub_23C138BC4();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
      *((_BYTE *)a1 + *(int *)(v7 + 48)) = *((_BYTE *)a2 + *(int *)(v7 + 48));
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for PlanMetadata(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
  if (!(_DWORD)result)
  {
    v4 = sub_23C138BC4();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  return result;
}

void *initializeWithCopy for PlanMetadata(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = sub_23C138BC4();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    *((_BYTE *)a1 + *(int *)(v6 + 48)) = *((_BYTE *)a2 + *(int *)(v6 + 48));
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

_BYTE *assignWithCopy for PlanMetadata(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_BYTE *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      v13 = sub_23C138BC4();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(a1, a2, v13);
      a1[*(int *)(v6 + 48)] = a2[*(int *)(v6 + 48)];
      return a1;
    }
    sub_23C106ED8((uint64_t)a1, &qword_256B218E0);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = sub_23C138BC4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
  a1[*(int *)(v6 + 48)] = a2[*(int *)(v6 + 48)];
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

void *initializeWithTake for PlanMetadata(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = sub_23C138BC4();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    *((_BYTE *)a1 + *(int *)(v6 + 48)) = *((_BYTE *)a2 + *(int *)(v6 + 48));
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

_BYTE *assignWithTake for PlanMetadata(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_BYTE *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      v13 = sub_23C138BC4();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(a1, a2, v13);
      a1[*(int *)(v6 + 48)] = a2[*(int *)(v6 + 48)];
      return a1;
    }
    sub_23C106ED8((uint64_t)a1, &qword_256B218E0);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = sub_23C138BC4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
  a1[*(int *)(v6 + 48)] = a2[*(int *)(v6 + 48)];
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PlanMetadata()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C115698(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2)
    return v5 - 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PlanMetadata()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1156F4(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 1);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_23C115748(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
}

uint64_t sub_23C115784(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B218E0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 1, v4);
}

uint64_t sub_23C1157C8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23C138BC4();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for PlanMetadata.CodingKeys()
{
  return &type metadata for PlanMetadata.CodingKeys;
}

ValueMetadata *type metadata accessor for PlanMetadata.NoneCodingKeys()
{
  return &type metadata for PlanMetadata.NoneCodingKeys;
}

uint64_t _s13FitnessForYou12PlanMetadataO10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1158A8 + 4 * byte_23C13D535[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C1158DC + 4 * byte_23C13D530[v4]))();
}

uint64_t sub_23C1158DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1158E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1158ECLL);
  return result;
}

uint64_t sub_23C1158F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C115900);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C115904(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C11590C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PlanMetadata.ActiveCodingKeys()
{
  return &type metadata for PlanMetadata.ActiveCodingKeys;
}

unint64_t sub_23C11592C()
{
  unint64_t result;

  result = qword_256B22540;
  if (!qword_256B22540)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D6F4, &type metadata for PlanMetadata.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22540);
  }
  return result;
}

unint64_t sub_23C115974()
{
  unint64_t result;

  result = qword_256B22548;
  if (!qword_256B22548)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D7FC, &type metadata for PlanMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22548);
  }
  return result;
}

unint64_t sub_23C1159BC()
{
  unint64_t result;

  result = qword_256B22550;
  if (!qword_256B22550)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D71C, &type metadata for PlanMetadata.NoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22550);
  }
  return result;
}

unint64_t sub_23C115A04()
{
  unint64_t result;

  result = qword_256B22558;
  if (!qword_256B22558)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D744, &type metadata for PlanMetadata.NoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22558);
  }
  return result;
}

unint64_t sub_23C115A4C()
{
  unint64_t result;

  result = qword_256B22560;
  if (!qword_256B22560)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D664, &type metadata for PlanMetadata.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22560);
  }
  return result;
}

unint64_t sub_23C115A94()
{
  unint64_t result;

  result = qword_256B22568;
  if (!qword_256B22568)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D68C, &type metadata for PlanMetadata.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22568);
  }
  return result;
}

unint64_t sub_23C115ADC()
{
  unint64_t result;

  result = qword_256B22570;
  if (!qword_256B22570)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D76C, &type metadata for PlanMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22570);
  }
  return result;
}

unint64_t sub_23C115B24()
{
  unint64_t result;

  result = qword_256B22578;
  if (!qword_256B22578)
  {
    result = MEMORY[0x2426179DC](&unk_23C13D794, &type metadata for PlanMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22578);
  }
  return result;
}

uint64_t sub_23C115B68(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023C1406C0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C115C54(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1701736302 && a2 == 0xE400000000000000;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657669746361 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C115D24(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PlanMetadata();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL static BrowsingIdentity.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_23C115D70(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65746F6D6572;
  else
    return 0x6C61636F6CLL;
}

uint64_t sub_23C115DA0()
{
  char *v0;

  return sub_23C115D70(*v0);
}

uint64_t sub_23C115DA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C11621C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C115DCC()
{
  sub_23C11608C();
  return sub_23C139350();
}

uint64_t sub_23C115DF4()
{
  sub_23C11608C();
  return sub_23C13935C();
}

uint64_t sub_23C115E1C()
{
  sub_23C116114();
  return sub_23C139350();
}

uint64_t sub_23C115E44()
{
  sub_23C116114();
  return sub_23C13935C();
}

uint64_t sub_23C115E6C()
{
  sub_23C1160D0();
  return sub_23C139350();
}

uint64_t sub_23C115E94()
{
  sub_23C1160D0();
  return sub_23C13935C();
}

uint64_t BrowsingIdentity.encode(to:)(_QWORD *a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  char v18;
  char v19;

  v17 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22588);
  v15 = *(_QWORD *)(v3 - 8);
  v16 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22590);
  v6 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22598);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C11608C();
  sub_23C139338();
  if ((v17 & 1) != 0)
  {
    v19 = 1;
    sub_23C1160D0();
    sub_23C139218();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v16);
  }
  else
  {
    v18 = 0;
    sub_23C116114();
    sub_23C139218();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v14);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

unint64_t sub_23C11608C()
{
  unint64_t result;

  result = qword_256B225A0;
  if (!qword_256B225A0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13DC2C, &type metadata for BrowsingIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B225A0);
  }
  return result;
}

unint64_t sub_23C1160D0()
{
  unint64_t result;

  result = qword_256B225A8;
  if (!qword_256B225A8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13DBDC, &type metadata for BrowsingIdentity.RemoteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B225A8);
  }
  return result;
}

unint64_t sub_23C116114()
{
  unint64_t result;

  result = qword_256B225B0;
  if (!qword_256B225B0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13DB8C, &type metadata for BrowsingIdentity.LocalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B225B0);
  }
  return result;
}

uint64_t BrowsingIdentity.init(from:)(_QWORD *a1)
{
  return sub_23C1162F4(a1) & 1;
}

uint64_t sub_23C116170@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23C1162F4(a1);
  if (!v2)
    *a2 = result & 1;
  return result;
}

uint64_t sub_23C11619C(_QWORD *a1)
{
  unsigned __int8 *v1;

  return BrowsingIdentity.encode(to:)(a1, *v1);
}

uint64_t BrowsingIdentity.hash(into:)()
{
  return sub_23C1392FC();
}

uint64_t BrowsingIdentity.hashValue.getter()
{
  sub_23C1392F0();
  sub_23C1392FC();
  return sub_23C139320();
}

uint64_t sub_23C11621C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6C61636F6CLL && a2 == 0xE500000000000000;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65746F6D6572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C1162F4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char v27;
  char v28;

  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B225F8);
  v22 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v25 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22600);
  v3 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22608);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C11608C();
  v10 = v26;
  sub_23C13932C();
  if (v10)
    goto LABEL_7;
  v11 = v5;
  v12 = v25;
  v21 = a1;
  v26 = v7;
  v13 = sub_23C13920C();
  v14 = v6;
  if (*(_QWORD *)(v13 + 16) != 1)
  {
    v16 = sub_23C139110();
    swift_allocError();
    v17 = v9;
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B21A98);
    *v19 = &type metadata for BrowsingIdentity;
    sub_23C1391A0();
    sub_23C139104();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v19, *MEMORY[0x24BEE26D0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v17, v6);
    a1 = v21;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v6;
  }
  v6 = *(unsigned __int8 *)(v13 + 32);
  if ((v6 & 1) != 0)
  {
    v28 = 1;
    sub_23C1160D0();
    sub_23C139194();
    v15 = v26;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v24);
  }
  else
  {
    v27 = 0;
    sub_23C116114();
    sub_23C139194();
    v15 = v26;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v23);
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  return v6;
}

unint64_t sub_23C116624()
{
  unint64_t result;

  result = qword_256B225B8;
  if (!qword_256B225B8)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for BrowsingIdentity, &type metadata for BrowsingIdentity);
    atomic_store(result, (unint64_t *)&qword_256B225B8);
  }
  return result;
}

ValueMetadata *type metadata accessor for BrowsingIdentity()
{
  return &type metadata for BrowsingIdentity;
}

uint64_t _s13FitnessForYou16BrowsingIdentityOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1166C8 + 4 * byte_23C13D925[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C1166FC + 4 * byte_23C13D920[v4]))();
}

uint64_t sub_23C1166FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C116704(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C11670CLL);
  return result;
}

uint64_t sub_23C116718(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C116720);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C116724(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C11672C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BrowsingIdentity.CodingKeys()
{
  return &type metadata for BrowsingIdentity.CodingKeys;
}

ValueMetadata *type metadata accessor for BrowsingIdentity.LocalCodingKeys()
{
  return &type metadata for BrowsingIdentity.LocalCodingKeys;
}

ValueMetadata *type metadata accessor for BrowsingIdentity.RemoteCodingKeys()
{
  return &type metadata for BrowsingIdentity.RemoteCodingKeys;
}

unint64_t sub_23C11676C()
{
  unint64_t result;

  result = qword_256B225C0;
  if (!qword_256B225C0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13DB64, &type metadata for BrowsingIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B225C0);
  }
  return result;
}

unint64_t sub_23C1167B4()
{
  unint64_t result;

  result = qword_256B225C8;
  if (!qword_256B225C8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13DA84, &type metadata for BrowsingIdentity.LocalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B225C8);
  }
  return result;
}

unint64_t sub_23C1167FC()
{
  unint64_t result;

  result = qword_256B225D0;
  if (!qword_256B225D0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13DAAC, &type metadata for BrowsingIdentity.LocalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B225D0);
  }
  return result;
}

unint64_t sub_23C116844()
{
  unint64_t result;

  result = qword_256B225D8;
  if (!qword_256B225D8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13DA34, &type metadata for BrowsingIdentity.RemoteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B225D8);
  }
  return result;
}

unint64_t sub_23C11688C()
{
  unint64_t result;

  result = qword_256B225E0;
  if (!qword_256B225E0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13DA5C, &type metadata for BrowsingIdentity.RemoteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B225E0);
  }
  return result;
}

unint64_t sub_23C1168D4()
{
  unint64_t result;

  result = qword_256B225E8;
  if (!qword_256B225E8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13DAD4, &type metadata for BrowsingIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B225E8);
  }
  return result;
}

unint64_t sub_23C11691C()
{
  unint64_t result;

  result = qword_256B225F0;
  if (!qword_256B225F0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13DAFC, &type metadata for BrowsingIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B225F0);
  }
  return result;
}

uint64_t CanvasSectionDescriptor.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CanvasSectionDescriptor.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CanvasSectionDescriptor.subtitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CanvasSectionDescriptor.subtitleType.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t CanvasSectionDescriptor.detail.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CanvasSectionDescriptor.items.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CanvasSectionDescriptor.displayStyle.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 80);
}

uint64_t CanvasSectionDescriptor.recoId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall CanvasSectionDescriptor.init(identifier:title:subtitle:subtitleType:detail:items:displayStyle:recoId:)(FitnessForYou::CanvasSectionDescriptor *__return_ptr retstr, Swift::String identifier, Swift::String_optional title, Swift::String_optional subtitle, FitnessForYou::SubtitleTextType subtitleType, Swift::String_optional detail, Swift::OpaquePointer items, FitnessForYou::DisplayStyle displayStyle, Swift::String recoId)
{
  retstr->identifier = identifier;
  retstr->title = title;
  retstr->subtitle = subtitle;
  retstr->subtitleType = subtitleType & 1;
  retstr->detail = detail;
  retstr->items = items;
  retstr->displayStyle = displayStyle;
  retstr->recoId = recoId;
}

uint64_t sub_23C116A88(char a1)
{
  return *(_QWORD *)&aIdentifititle[8 * a1];
}

uint64_t sub_23C116AA8()
{
  char *v0;

  return sub_23C116A88(*v0);
}

uint64_t sub_23C116AB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C11810C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C116AD4()
{
  sub_23C116DE4();
  return sub_23C139350();
}

uint64_t sub_23C116AFC()
{
  sub_23C116DE4();
  return sub_23C13935C();
}

uint64_t CanvasSectionDescriptor.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  _QWORD v14[2];
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  char v26;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22610);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v21 = *(_QWORD *)(v1 + 24);
  v22 = v7;
  v8 = *(_QWORD *)(v1 + 32);
  v19 = *(_QWORD *)(v1 + 40);
  v20 = v8;
  v25 = *(unsigned __int8 *)(v1 + 48);
  v9 = *(_QWORD *)(v1 + 56);
  v17 = *(_QWORD *)(v1 + 64);
  v18 = v9;
  v16 = *(_QWORD *)(v1 + 72);
  v15 = *(unsigned __int8 *)(v1 + 80);
  v10 = *(_QWORD *)(v1 + 88);
  v14[0] = *(_QWORD *)(v1 + 96);
  v14[1] = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C116DE4();
  sub_23C139338();
  LOBYTE(v24) = 0;
  v11 = v23;
  sub_23C139248();
  if (!v11)
  {
    v12 = v25;
    LOBYTE(v24) = 1;
    sub_23C139224();
    LOBYTE(v24) = 2;
    sub_23C139224();
    LOBYTE(v24) = v12;
    v26 = 3;
    sub_23C116E28();
    sub_23C139278();
    LOBYTE(v24) = 4;
    sub_23C139224();
    v24 = v16;
    v26 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B22628);
    sub_23C11748C(&qword_256B22630, &qword_256B22638, (uint64_t)&protocol conformance descriptor for CanvasPlaceholder, MEMORY[0x24BEE12A0]);
    sub_23C139278();
    LOBYTE(v24) = v15;
    v26 = 6;
    sub_23C0FFBB0();
    sub_23C139278();
    LOBYTE(v24) = 7;
    sub_23C139248();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23C116DE4()
{
  unint64_t result;

  result = qword_256B22618;
  if (!qword_256B22618)
  {
    result = MEMORY[0x2426179DC](&unk_23C13DE4C, &type metadata for CanvasSectionDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22618);
  }
  return result;
}

unint64_t sub_23C116E28()
{
  unint64_t result;

  result = qword_256B22620;
  if (!qword_256B22620)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for SubtitleTextType, &type metadata for SubtitleTextType);
    atomic_store(result, (unint64_t *)&qword_256B22620);
  }
  return result;
}

uint64_t CanvasSectionDescriptor.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
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
  int v41;
  char v42;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22640);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C116DE4();
  sub_23C13932C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v40) = 0;
  v10 = sub_23C1391D0();
  v12 = v11;
  LOBYTE(v40) = 1;
  swift_bridgeObjectRetain();
  v37 = sub_23C1391AC();
  v38 = v10;
  LOBYTE(v40) = 2;
  v14 = v13;
  swift_bridgeObjectRetain();
  v15 = sub_23C1391AC();
  v39 = v14;
  v17 = v16;
  v36 = v15;
  v42 = 3;
  sub_23C117448();
  swift_bridgeObjectRetain();
  sub_23C139200();
  v35 = v17;
  LODWORD(v14) = v40;
  LOBYTE(v40) = 4;
  v18 = sub_23C1391AC();
  v34 = v19;
  v32 = v18;
  v41 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22628);
  v42 = 5;
  sub_23C11748C(&qword_256B22650, &qword_256B22658, (uint64_t)&protocol conformance descriptor for CanvasPlaceholder, MEMORY[0x24BEE12D0]);
  swift_bridgeObjectRetain();
  v33 = 0;
  sub_23C139200();
  v20 = v40;
  v42 = 6;
  sub_23C1000F4();
  v31 = v20;
  swift_bridgeObjectRetain();
  sub_23C139200();
  LODWORD(v14) = v40;
  LOBYTE(v40) = 7;
  v21 = sub_23C1391D0();
  v23 = v22;
  v24 = *(void (**)(char *, uint64_t))(v6 + 8);
  v33 = v21;
  v24(v8, v5);
  swift_bridgeObjectRetain();
  v30 = v14;
  v25 = v39;
  swift_bridgeObjectRetain();
  v26 = v35;
  swift_bridgeObjectRetain();
  v27 = v34;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v38;
  *(_QWORD *)(a2 + 8) = v12;
  *(_QWORD *)(a2 + 16) = v37;
  *(_QWORD *)(a2 + 24) = v25;
  *(_QWORD *)(a2 + 32) = v36;
  *(_QWORD *)(a2 + 40) = v26;
  *(_BYTE *)(a2 + 48) = v41;
  v28 = v31;
  *(_QWORD *)(a2 + 56) = v32;
  *(_QWORD *)(a2 + 64) = v27;
  *(_QWORD *)(a2 + 72) = v28;
  *(_BYTE *)(a2 + 80) = v30;
  *(_QWORD *)(a2 + 88) = v33;
  *(_QWORD *)(a2 + 96) = v23;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_23C117448()
{
  unint64_t result;

  result = qword_256B22648;
  if (!qword_256B22648)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for SubtitleTextType, &type metadata for SubtitleTextType);
    atomic_store(result, (unint64_t *)&qword_256B22648);
  }
  return result;
}

uint64_t sub_23C11748C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22628);
    v10 = sub_23C117508(a2, a3);
    result = MEMORY[0x2426179DC](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C117508(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for CanvasPlaceholder();
    result = MEMORY[0x2426179DC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C117548@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CanvasSectionDescriptor.init(from:)(a1, a2);
}

uint64_t sub_23C11755C(_QWORD *a1)
{
  return CanvasSectionDescriptor.encode(to:)(a1);
}

uint64_t CanvasSectionDescriptor.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v8;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 40);
  v5 = *(_QWORD *)(v1 + 64);
  v6 = *(_QWORD *)(v1 + 72);
  v8 = *(_BYTE *)(v1 + 80);
  swift_bridgeObjectRetain();
  sub_23C139008();
  swift_bridgeObjectRelease();
  if (v3)
  {
    sub_23C139308();
    swift_bridgeObjectRetain();
    sub_23C139008();
    swift_bridgeObjectRelease();
    if (v4)
    {
LABEL_3:
      sub_23C139308();
      swift_bridgeObjectRetain();
      sub_23C139008();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_23C139308();
    if (v4)
      goto LABEL_3;
  }
  sub_23C139308();
LABEL_6:
  sub_23C139008();
  swift_bridgeObjectRelease();
  sub_23C139308();
  if (v5)
  {
    swift_bridgeObjectRetain();
    sub_23C139008();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_23C10463C(a1, v6);
  swift_bridgeObjectRelease();
  DisplayStyle.rawValue.getter(v8);
  sub_23C139008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C139008();
  return swift_bridgeObjectRelease();
}

uint64_t CanvasSectionDescriptor.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _QWORD v9[11];
  __int128 v10;
  __int128 v11;
  char v12;
  __int128 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_BYTE *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(_BYTE *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 96);
  v9[9] = *(_QWORD *)v0;
  v9[10] = v1;
  v7 = *(_OWORD *)(v0 + 32);
  v10 = *(_OWORD *)(v0 + 16);
  v11 = v7;
  v12 = v2;
  v13 = *(_OWORD *)(v0 + 56);
  v14 = v3;
  v15 = v4;
  v16 = v5;
  v17 = v6;
  sub_23C1392F0();
  CanvasSectionDescriptor.hash(into:)((uint64_t)v9);
  return sub_23C139320();
}

uint64_t sub_23C1177E0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _QWORD v9[11];
  __int128 v10;
  __int128 v11;
  char v12;
  __int128 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_BYTE *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(_BYTE *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 96);
  v9[9] = *(_QWORD *)v0;
  v9[10] = v1;
  v7 = *(_OWORD *)(v0 + 32);
  v10 = *(_OWORD *)(v0 + 16);
  v11 = v7;
  v12 = v2;
  v13 = *(_OWORD *)(v0 + 56);
  v14 = v3;
  v15 = v4;
  v16 = v5;
  v17 = v6;
  sub_23C1392F0();
  CanvasSectionDescriptor.hash(into:)((uint64_t)v9);
  return sub_23C139320();
}

uint64_t sub_23C117860()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _QWORD v9[11];
  __int128 v10;
  __int128 v11;
  char v12;
  __int128 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_BYTE *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(_BYTE *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 96);
  v9[9] = *(_QWORD *)v0;
  v9[10] = v1;
  v7 = *(_OWORD *)(v0 + 32);
  v10 = *(_OWORD *)(v0 + 16);
  v11 = v7;
  v12 = v2;
  v13 = *(_OWORD *)(v0 + 56);
  v14 = v3;
  v15 = v4;
  v16 = v5;
  v17 = v6;
  sub_23C1392F0();
  CanvasSectionDescriptor.hash(into:)((uint64_t)v9);
  return sub_23C139320();
}

uint64_t _s13FitnessForYou23CanvasSectionDescriptorV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char v12;
  uint64_t result;
  char v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;
  unsigned __int8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v2 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(unsigned __int8 *)(a1 + 48);
  v38 = *(_QWORD *)(a1 + 64);
  v34 = *(_QWORD *)(a1 + 72);
  v32 = *(_BYTE *)(a1 + 80);
  v29 = *(_QWORD *)(a1 + 96);
  v30 = *(_QWORD *)(a1 + 88);
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v11 = *(unsigned __int8 *)(a2 + 48);
  v35 = *(_QWORD *)(a2 + 56);
  v36 = *(_QWORD *)(a1 + 56);
  v37 = *(_QWORD *)(a2 + 64);
  v33 = *(_QWORD *)(a2 + 72);
  v31 = *(_BYTE *)(a2 + 80);
  v27 = *(_QWORD *)(a2 + 96);
  v28 = *(_QWORD *)(a2 + 88);
  if (*(_QWORD *)a1 != *(_QWORD *)a2 || *(_QWORD *)(a1 + 8) != *(_QWORD *)(a2 + 8))
  {
    v12 = sub_23C139284();
    result = 0;
    if ((v12 & 1) == 0)
      return result;
  }
  if (v4)
  {
    if (!v8)
      return 0;
    if (v2 != v7 || v4 != v8)
    {
      v14 = sub_23C139284();
      result = 0;
      if ((v14 & 1) == 0)
        return result;
    }
  }
  else if (v8)
  {
    return 0;
  }
  if (v5)
  {
    if (!v9)
      return 0;
    if (v3 != v10 || v5 != v9)
    {
      v15 = sub_23C139284();
      result = 0;
      if ((v15 & 1) == 0)
        return result;
    }
  }
  else if (v9)
  {
    return 0;
  }
  if (v6)
    v16 = 1954047348;
  else
    v16 = 0x657069636572;
  if (v6)
    v17 = 0xE400000000000000;
  else
    v17 = 0xE600000000000000;
  if (v11)
    v18 = 1954047348;
  else
    v18 = 0x657069636572;
  if (v11)
    v19 = 0xE400000000000000;
  else
    v19 = 0xE600000000000000;
  if (v16 == v18 && v17 == v19)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v20 = sub_23C139284();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v20 & 1) == 0)
      return result;
  }
  if (!v38)
  {
    if (!v37)
      goto LABEL_41;
    return 0;
  }
  if (!v37)
    return 0;
  if (v36 != v35 || v38 != v37)
  {
    v21 = sub_23C139284();
    result = 0;
    if ((v21 & 1) == 0)
      return result;
  }
LABEL_41:
  if ((sub_23C12BC80(v34, v33) & 1) == 0)
    return 0;
  v22 = DisplayStyle.rawValue.getter(v32);
  v24 = v23;
  if (v22 == DisplayStyle.rawValue.getter(v31) && v24 == v25)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v26 = sub_23C139284();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v26 & 1) == 0)
      return result;
  }
  if (v30 == v28 && v29 == v27)
    return 1;
  else
    return sub_23C139284();
}

unint64_t sub_23C117BDC()
{
  unint64_t result;

  result = qword_256B22660;
  if (!qword_256B22660)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for CanvasSectionDescriptor, &type metadata for CanvasSectionDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B22660);
  }
  return result;
}

uint64_t destroy for CanvasSectionDescriptor()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CanvasSectionDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v7 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CanvasSectionDescriptor(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for CanvasSectionDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v7 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CanvasSectionDescriptor(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 104))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CanvasSectionDescriptor(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 104) = 1;
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
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CanvasSectionDescriptor()
{
  return &type metadata for CanvasSectionDescriptor;
}

uint64_t storeEnumTagSinglePayload for CanvasSectionDescriptor.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C117FB4 + 4 * byte_23C13DC85[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_23C117FE8 + 4 * byte_23C13DC80[v4]))();
}

uint64_t sub_23C117FE8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C117FF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C117FF8);
  return result;
}

uint64_t sub_23C118004(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C11800CLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_23C118010(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C118018(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CanvasSectionDescriptor.CodingKeys()
{
  return &type metadata for CanvasSectionDescriptor.CodingKeys;
}

unint64_t sub_23C118038()
{
  unint64_t result;

  result = qword_256B22668;
  if (!qword_256B22668)
  {
    result = MEMORY[0x2426179DC](&unk_23C13DE24, &type metadata for CanvasSectionDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22668);
  }
  return result;
}

unint64_t sub_23C118080()
{
  unint64_t result;

  result = qword_256B22670;
  if (!qword_256B22670)
  {
    result = MEMORY[0x2426179DC](&unk_23C13DD94, &type metadata for CanvasSectionDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22670);
  }
  return result;
}

unint64_t sub_23C1180C8()
{
  unint64_t result;

  result = qword_256B22678;
  if (!qword_256B22678)
  {
    result = MEMORY[0x2426179DC](&unk_23C13DDBC, &type metadata for CanvasSectionDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22678);
  }
  return result;
}

uint64_t sub_23C11810C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xE800000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xEC00000065707954 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C6961746564 && a2 == 0xE600000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x736D657469 && a2 == 0xE500000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x5379616C70736964 && a2 == 0xEC000000656C7974 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x64496F636572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 7;
    else
      return 8;
  }
}

uint64_t sub_23C11841C(char a1)
{
  return *(_QWORD *)&aError_0[8 * a1];
}

uint64_t sub_23C11843C()
{
  char *v0;

  return sub_23C11841C(*v0);
}

uint64_t sub_23C118444@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C118F60(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C118468()
{
  sub_23C118998();
  return sub_23C139350();
}

uint64_t sub_23C118490()
{
  sub_23C118998();
  return sub_23C13935C();
}

uint64_t sub_23C1184B8()
{
  sub_23C118AEC();
  return sub_23C139350();
}

uint64_t sub_23C1184E0()
{
  sub_23C118AEC();
  return sub_23C13935C();
}

uint64_t sub_23C11850C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C119118(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C118534()
{
  sub_23C118A64();
  return sub_23C139350();
}

uint64_t sub_23C11855C()
{
  sub_23C118A64();
  return sub_23C13935C();
}

uint64_t sub_23C118584()
{
  sub_23C118A20();
  return sub_23C139350();
}

uint64_t sub_23C1185AC()
{
  sub_23C118A20();
  return sub_23C13935C();
}

uint64_t sub_23C1185D4()
{
  sub_23C1189DC();
  return sub_23C139350();
}

uint64_t sub_23C1185FC()
{
  sub_23C1189DC();
  return sub_23C13935C();
}

uint64_t LoadFailureReason.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, int a4)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  int v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;

  *((_QWORD *)&v37 + 1) = a3;
  v38 = a4;
  *(_QWORD *)&v37 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22680);
  v32 = *(_QWORD *)(v5 - 8);
  v33 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v31 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22688);
  v29 = *(_QWORD *)(v7 - 8);
  v30 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v28 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22690);
  v35 = *(_QWORD *)(v9 - 8);
  v36 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22698);
  v34 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B226A0);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C118998();
  sub_23C139338();
  if ((_BYTE)v38)
  {
    v19 = v37;
    v20 = v16;
    v21 = v15;
    if (v38 == 1)
    {
      v41 = 1;
      sub_23C118A64();
      sub_23C139218();
      v40 = v19;
      sub_23C118AA8();
      v22 = v36;
      sub_23C13923C();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v22);
      return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v18, v21);
    }
    else
    {
      if (v37 == 0)
      {
        v42 = 2;
        sub_23C118A20();
        v24 = v28;
        sub_23C139218();
        v26 = v29;
        v25 = v30;
      }
      else
      {
        v43 = 3;
        sub_23C1189DC();
        v24 = v31;
        sub_23C139218();
        v26 = v32;
        v25 = v33;
      }
      (*(void (**)(char *, uint64_t))(v26 + 8))(v24, v25);
      return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v18, v21);
    }
  }
  else
  {
    v39 = 0;
    sub_23C118AEC();
    sub_23C139218();
    sub_23C139248();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v14, v12);
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
}

unint64_t sub_23C118998()
{
  unint64_t result;

  result = qword_256B226A8;
  if (!qword_256B226A8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E490, &type metadata for LoadFailureReason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B226A8);
  }
  return result;
}

unint64_t sub_23C1189DC()
{
  unint64_t result;

  result = qword_256B226B0;
  if (!qword_256B226B0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E440, &type metadata for LoadFailureReason.UnavailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B226B0);
  }
  return result;
}

unint64_t sub_23C118A20()
{
  unint64_t result;

  result = qword_256B226B8;
  if (!qword_256B226B8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E3F0, &type metadata for LoadFailureReason.SyncingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B226B8);
  }
  return result;
}

unint64_t sub_23C118A64()
{
  unint64_t result;

  result = qword_256B226C0;
  if (!qword_256B226C0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E3A0, &type metadata for LoadFailureReason.NotSupportedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B226C0);
  }
  return result;
}

unint64_t sub_23C118AA8()
{
  unint64_t result;

  result = qword_256B226C8;
  if (!qword_256B226C8)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for DeviceType, &type metadata for DeviceType);
    atomic_store(result, (unint64_t *)&qword_256B226C8);
  }
  return result;
}

unint64_t sub_23C118AEC()
{
  unint64_t result;

  result = qword_256B226D0;
  if (!qword_256B226D0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E350, &type metadata for LoadFailureReason.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B226D0);
  }
  return result;
}

_QWORD *LoadFailureReason.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *result;
  uint64_t v3;

  result = sub_23C1191C0(a1);
  if (v1)
    return (_QWORD *)v3;
  return result;
}

_QWORD *sub_23C118B50@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;
  char v6;

  result = sub_23C1191C0(a1);
  if (!v2)
  {
    *(_QWORD *)a2 = result;
    *(_QWORD *)(a2 + 8) = v5;
    *(_BYTE *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_23C118B7C(_QWORD *a1)
{
  uint64_t v1;

  return LoadFailureReason.encode(to:)(a1, *(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t LoadFailureReason.hash(into:)(uint64_t a1, char a2, uint64_t a3, char a4)
{
  if (a4)
  {
    if (a4 == 1)
    {
      sub_23C1392FC();
      if (a2 == 4)
        return sub_23C139308();
      sub_23C139308();
    }
    return sub_23C1392FC();
  }
  else
  {
    sub_23C1392FC();
    return sub_23C139008();
  }
}

uint64_t LoadFailureReason.hashValue.getter(char a1, uint64_t a2, char a3)
{
  sub_23C1392F0();
  if (!a3)
  {
    sub_23C1392FC();
    sub_23C139008();
    return sub_23C139320();
  }
  if (a3 != 1)
  {
LABEL_8:
    sub_23C1392FC();
    return sub_23C139320();
  }
  sub_23C1392FC();
  if (a1 != 4)
  {
    sub_23C139308();
    goto LABEL_8;
  }
  sub_23C139308();
  return sub_23C139320();
}

uint64_t sub_23C118D10()
{
  uint64_t v0;

  return LoadFailureReason.hashValue.getter(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t sub_23C118D1C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  if (*((_BYTE *)v0 + 16))
  {
    if (*((_BYTE *)v0 + 16) == 1)
    {
      sub_23C1392FC();
      if (v1 == 4)
        return sub_23C139308();
      sub_23C139308();
    }
    return sub_23C1392FC();
  }
  else
  {
    sub_23C1392FC();
    return sub_23C139008();
  }
}

uint64_t sub_23C118DC4()
{
  uint64_t *v0;
  uint64_t v1;
  int v2;

  v1 = *v0;
  v2 = *((unsigned __int8 *)v0 + 16);
  sub_23C1392F0();
  if (!v2)
  {
    sub_23C1392FC();
    sub_23C139008();
    return sub_23C139320();
  }
  if (v2 != 1)
  {
LABEL_8:
    sub_23C1392FC();
    return sub_23C139320();
  }
  sub_23C1392FC();
  if (v1 != 4)
  {
    sub_23C139308();
    goto LABEL_8;
  }
  sub_23C139308();
  return sub_23C139320();
}

uint64_t sub_23C118E88(uint64_t a1, uint64_t a2)
{
  return _s13FitnessForYou17LoadFailureReasonO2eeoiySbAC_ACtFZ_0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_BYTE *)(a2 + 16));
}

uint64_t _s13FitnessForYou17LoadFailureReasonO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a3)
  {
    if (a3 != 1)
    {
      if (a1 | a2)
      {
        if (a6 != 2 || a4 != 1 || a5)
          return 0;
      }
      else if (a6 != 2 || a5 | a4)
      {
        return 0;
      }
      return 1;
    }
    if (a6 == 1)
    {
      if (a1 == 4)
      {
        if (a4 != 4)
          return 0;
      }
      else if (a4 == 4 || a4 != a1)
      {
        return 0;
      }
      return 1;
    }
  }
  else if (!a6)
  {
    if (a1 != a4 || a2 != a5)
      return sub_23C139284();
    return 1;
  }
  return 0;
}

uint64_t sub_23C118F60(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x726F727265 && a2 == 0xE500000000000000;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F70707553746F6ELL && a2 == 0xEC00000064657472 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x676E69636E7973 && a2 == 0xE700000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x616C696176616E75 && a2 == 0xEB00000000656C62)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23C119118(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x7954656369766564 && a2 == 0xEA00000000006570)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23C139284();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C1191A4()
{
  return 0x7954656369766564;
}

_QWORD *sub_23C1191C0(_QWORD *a1)
{
  uint64_t v2;
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
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v24[3];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;

  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22748);
  v33 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v32 = (char *)v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22750);
  v26 = *(_QWORD *)(v3 - 8);
  v27 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v31 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22758);
  v28 = *(_QWORD *)(v5 - 8);
  v29 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v30 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22760);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22768);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a1[3];
  v34 = a1;
  v16 = __swift_project_boxed_opaque_existential_1(a1, v15);
  sub_23C118998();
  v17 = v35;
  sub_23C13932C();
  if (!v17)
  {
    v24[1] = v8;
    v24[2] = v10;
    v35 = 0;
    v18 = v12;
    v19 = sub_23C13920C();
    if (*(_QWORD *)(v19 + 16) == 1)
      __asm { BR              X10 }
    v20 = sub_23C139110();
    swift_allocError();
    v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B21A98);
    *v22 = &type metadata for LoadFailureReason;
    v16 = v14;
    sub_23C1391A0();
    sub_23C139104();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v22, *MEMORY[0x24BEE26D0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v14, v11);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  return v16;
}

void sub_23C119610()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v5 - 120) = v3;
  *(_BYTE *)(v5 - 65) = 3;
  sub_23C1189DC();
  v6 = *(_QWORD *)(v5 - 88);
  sub_23C139194();
  if (v6)
  {
    swift_bridgeObjectRelease();
    JUMPOUT(0x23C1196A8);
  }
  (*(void (**)(uint64_t, _QWORD))(v2 + 8))(v1, *(_QWORD *)(v5 - 168));
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 120) + 8))(v4, v0);
  JUMPOUT(0x23C11976CLL);
}

unint64_t sub_23C119780()
{
  unint64_t result;

  result = qword_256B226D8;
  if (!qword_256B226D8)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for LoadFailureReason, &type metadata for LoadFailureReason);
    atomic_store(result, (unint64_t *)&qword_256B226D8);
  }
  return result;
}

uint64_t destroy for LoadFailureReason(uint64_t a1)
{
  return sub_23C10BB58(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s13FitnessForYou17LoadFailureReasonOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23C10BACC(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LoadFailureReason(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23C10BACC(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23C10BB58(v6, v7, v8);
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

uint64_t assignWithTake for LoadFailureReason(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_23C10BB58(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for LoadFailureReason(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LoadFailureReason(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_23C119958(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_23C119970(uint64_t result, unsigned int a2)
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

ValueMetadata *type metadata accessor for LoadFailureReason()
{
  return &type metadata for LoadFailureReason;
}

uint64_t storeEnumTagSinglePayload for LoadFailureReason.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1199E4 + 4 * byte_23C13DF29[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C119A18 + 4 * byte_23C13DF24[v4]))();
}

uint64_t sub_23C119A18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C119A20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C119A28);
  return result;
}

uint64_t sub_23C119A34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C119A3CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C119A40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C119A48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LoadFailureReason.CodingKeys()
{
  return &type metadata for LoadFailureReason.CodingKeys;
}

ValueMetadata *type metadata accessor for LoadFailureReason.ErrorCodingKeys()
{
  return &type metadata for LoadFailureReason.ErrorCodingKeys;
}

uint64_t _s13FitnessForYou17LoadFailureReasonO15ErrorCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C119AB8 + 4 * byte_23C13DF2E[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C119AD8 + 4 * byte_23C13DF33[v4]))();
}

_BYTE *sub_23C119AB8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C119AD8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C119AE0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C119AE8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C119AF0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C119AF8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LoadFailureReason.NotSupportedCodingKeys()
{
  return &type metadata for LoadFailureReason.NotSupportedCodingKeys;
}

ValueMetadata *type metadata accessor for LoadFailureReason.SyncingCodingKeys()
{
  return &type metadata for LoadFailureReason.SyncingCodingKeys;
}

ValueMetadata *type metadata accessor for LoadFailureReason.UnavailableCodingKeys()
{
  return &type metadata for LoadFailureReason.UnavailableCodingKeys;
}

unint64_t sub_23C119B38()
{
  unint64_t result;

  result = qword_256B226E0;
  if (!qword_256B226E0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E1B8, &type metadata for LoadFailureReason.NotSupportedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B226E0);
  }
  return result;
}

unint64_t sub_23C119B80()
{
  unint64_t result;

  result = qword_256B226E8;
  if (!qword_256B226E8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E270, &type metadata for LoadFailureReason.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B226E8);
  }
  return result;
}

unint64_t sub_23C119BC8()
{
  unint64_t result;

  result = qword_256B226F0;
  if (!qword_256B226F0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E328, &type metadata for LoadFailureReason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B226F0);
  }
  return result;
}

unint64_t sub_23C119C10()
{
  unint64_t result;

  result = qword_256B226F8;
  if (!qword_256B226F8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E1E0, &type metadata for LoadFailureReason.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B226F8);
  }
  return result;
}

unint64_t sub_23C119C58()
{
  unint64_t result;

  result = qword_256B22700;
  if (!qword_256B22700)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E208, &type metadata for LoadFailureReason.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22700);
  }
  return result;
}

unint64_t sub_23C119CA0()
{
  unint64_t result;

  result = qword_256B22708;
  if (!qword_256B22708)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E128, &type metadata for LoadFailureReason.NotSupportedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22708);
  }
  return result;
}

unint64_t sub_23C119CE8()
{
  unint64_t result;

  result = qword_256B22710;
  if (!qword_256B22710)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E150, &type metadata for LoadFailureReason.NotSupportedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22710);
  }
  return result;
}

unint64_t sub_23C119D30()
{
  unint64_t result;

  result = qword_256B22718;
  if (!qword_256B22718)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E0D8, &type metadata for LoadFailureReason.SyncingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22718);
  }
  return result;
}

unint64_t sub_23C119D78()
{
  unint64_t result;

  result = qword_256B22720;
  if (!qword_256B22720)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E100, &type metadata for LoadFailureReason.SyncingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22720);
  }
  return result;
}

unint64_t sub_23C119DC0()
{
  unint64_t result;

  result = qword_256B22728;
  if (!qword_256B22728)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E088, &type metadata for LoadFailureReason.UnavailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22728);
  }
  return result;
}

unint64_t sub_23C119E08()
{
  unint64_t result;

  result = qword_256B22730;
  if (!qword_256B22730)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E0B0, &type metadata for LoadFailureReason.UnavailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22730);
  }
  return result;
}

unint64_t sub_23C119E50()
{
  unint64_t result;

  result = qword_256B22738;
  if (!qword_256B22738)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E298, &type metadata for LoadFailureReason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22738);
  }
  return result;
}

unint64_t sub_23C119E98()
{
  unint64_t result;

  result = qword_256B22740;
  if (!qword_256B22740)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E2C0, &type metadata for LoadFailureReason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22740);
  }
  return result;
}

unint64_t sub_23C119EDC()
{
  unint64_t result;

  result = qword_256B22770;
  if (!qword_256B22770)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for DeviceType, &type metadata for DeviceType);
    atomic_store(result, (unint64_t *)&qword_256B22770);
  }
  return result;
}

uint64_t ForYouToastEnvironment.init(requestToastDismissal:navigateToForYou:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t ForYouToastEnvironment.requestToastDismissal.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t ForYouToastEnvironment.navigateToForYou.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t destroy for ForYouToastEnvironment()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for ForYouToastEnvironment(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for ForYouToastEnvironment(_QWORD *a1, _QWORD *a2)
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

_OWORD *assignWithTake for ForYouToastEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ForYouToastEnvironment(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ForYouToastEnvironment(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ForYouToastEnvironment()
{
  return &type metadata for ForYouToastEnvironment;
}

uint64_t AwardCanvasSectionDescriptor.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AwardCanvasSectionDescriptor.templateUniqueName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AwardCanvasSectionDescriptor.items.getter()
{
  return swift_bridgeObjectRetain();
}

void __swiftcall AwardCanvasSectionDescriptor.init(identifier:templateUniqueName:items:)(FitnessForYou::AwardCanvasSectionDescriptor *__return_ptr retstr, Swift::String identifier, Swift::String templateUniqueName, Swift::OpaquePointer items)
{
  retstr->identifier = identifier;
  retstr->templateUniqueName = templateUniqueName;
  retstr->items = items;
}

uint64_t sub_23C11A19C(char a1)
{
  if (!a1)
    return 0x696669746E656469;
  if (a1 == 1)
    return 0xD000000000000012;
  return 0x736D657469;
}

uint64_t sub_23C11A1F8()
{
  char *v0;

  return sub_23C11A19C(*v0);
}

uint64_t sub_23C11A200@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C11AFB4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C11A224()
{
  sub_23C11A410();
  return sub_23C139350();
}

uint64_t sub_23C11A24C()
{
  sub_23C11A410();
  return sub_23C13935C();
}

uint64_t AwardCanvasSectionDescriptor.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  char v19;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22778);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v1[2];
  v13 = v1[3];
  v14 = v7;
  v12 = v1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C11A410();
  sub_23C139338();
  v19 = 0;
  v8 = v15;
  sub_23C139248();
  if (!v8)
  {
    v9 = v12;
    v18 = 1;
    sub_23C139248();
    v16 = v9;
    v17 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B22788);
    sub_23C11A714(&qword_256B22790, (uint64_t (*)(void))sub_23C11A454, MEMORY[0x24BEE12A0]);
    sub_23C139278();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23C11A410()
{
  unint64_t result;

  result = qword_256B22780;
  if (!qword_256B22780)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E720, &type metadata for AwardCanvasSectionDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22780);
  }
  return result;
}

unint64_t sub_23C11A454()
{
  unint64_t result;

  result = qword_256B22798;
  if (!qword_256B22798)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for AwardCanvasPlaceholder, &type metadata for AwardCanvasPlaceholder);
    atomic_store(result, (unint64_t *)&qword_256B22798);
  }
  return result;
}

uint64_t AwardCanvasSectionDescriptor.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  char v24;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B227A0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C11A410();
  sub_23C13932C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v24 = 0;
  v9 = sub_23C1391D0();
  v11 = v10;
  v20 = v9;
  v23 = 1;
  swift_bridgeObjectRetain();
  v12 = sub_23C1391D0();
  v14 = v13;
  v18 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22788);
  v22 = 2;
  sub_23C11A714(&qword_256B227A8, (uint64_t (*)(void))sub_23C11A77C, MEMORY[0x24BEE12D0]);
  v19 = v14;
  swift_bridgeObjectRetain();
  sub_23C139200();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v15 = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16 = v19;
  *a2 = v20;
  a2[1] = v11;
  a2[2] = v18;
  a2[3] = v16;
  a2[4] = v15;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C11A714(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22788);
    v8 = a2();
    result = MEMORY[0x2426179DC](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C11A77C()
{
  unint64_t result;

  result = qword_256B227B0;
  if (!qword_256B227B0)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for AwardCanvasPlaceholder, &type metadata for AwardCanvasPlaceholder);
    atomic_store(result, (unint64_t *)&qword_256B227B0);
  }
  return result;
}

uint64_t sub_23C11A7C0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return AwardCanvasSectionDescriptor.init(from:)(a1, a2);
}

uint64_t sub_23C11A7D4(_QWORD *a1)
{
  return AwardCanvasSectionDescriptor.encode(to:)(a1);
}

uint64_t AwardCanvasSectionDescriptor.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 32);
  swift_bridgeObjectRetain();
  sub_23C139008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C139008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C104550(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t AwardCanvasSectionDescriptor.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 32);
  sub_23C1392F0();
  swift_bridgeObjectRetain();
  sub_23C139008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C139008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C104550((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_23C139320();
}

uint64_t sub_23C11A928()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 32);
  sub_23C1392F0();
  swift_bridgeObjectRetain();
  sub_23C139008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C139008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C104550((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_23C139320();
}

uint64_t sub_23C11A9D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 32);
  swift_bridgeObjectRetain();
  sub_23C139008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C139008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C104550(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C11AA64()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 32);
  sub_23C1392F0();
  swift_bridgeObjectRetain();
  sub_23C139008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C139008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C104550((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_23C139320();
}

uint64_t _s13FitnessForYou28AwardCanvasSectionDescriptorV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  BOOL v9;

  v2 = a1[2];
  v4 = a1[3];
  v3 = a1[4];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = *a1 == *a2 && a1[1] == a2[1];
  if ((v8 || (sub_23C139284() & 1) != 0) && (v2 == v5 ? (v9 = v4 == v6) : (v9 = 0), v9 || (sub_23C139284() & 1) != 0))
    return sub_23C12BB34(v3, v7);
  else
    return 0;
}

unint64_t sub_23C11ABBC()
{
  unint64_t result;

  result = qword_256B227B8;
  if (!qword_256B227B8)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for AwardCanvasSectionDescriptor, &type metadata for AwardCanvasSectionDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B227B8);
  }
  return result;
}

uint64_t destroy for AwardCanvasSectionDescriptor()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AwardCanvasSectionDescriptor(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AwardCanvasSectionDescriptor(_QWORD *a1, _QWORD *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for AwardCanvasSectionDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AwardCanvasSectionDescriptor(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AwardCanvasSectionDescriptor(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AwardCanvasSectionDescriptor()
{
  return &type metadata for AwardCanvasSectionDescriptor;
}

uint64_t storeEnumTagSinglePayload for AwardCanvasSectionDescriptor.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C11AE5C + 4 * byte_23C13E565[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C11AE90 + 4 * asc_23C13E560[v4]))();
}

uint64_t sub_23C11AE90(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C11AE98(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C11AEA0);
  return result;
}

uint64_t sub_23C11AEAC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C11AEB4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C11AEB8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C11AEC0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AwardCanvasSectionDescriptor.CodingKeys()
{
  return &type metadata for AwardCanvasSectionDescriptor.CodingKeys;
}

unint64_t sub_23C11AEE0()
{
  unint64_t result;

  result = qword_256B227C0;
  if (!qword_256B227C0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E6F8, &type metadata for AwardCanvasSectionDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B227C0);
  }
  return result;
}

unint64_t sub_23C11AF28()
{
  unint64_t result;

  result = qword_256B227C8;
  if (!qword_256B227C8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E668, &type metadata for AwardCanvasSectionDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B227C8);
  }
  return result;
}

unint64_t sub_23C11AF70()
{
  unint64_t result;

  result = qword_256B227D0;
  if (!qword_256B227D0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E690, &type metadata for AwardCanvasSectionDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B227D0);
  }
  return result;
}

uint64_t sub_23C11AFB4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000023C1406E0 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x736D657469 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t ForYouState.activeStorefrontLocale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23C138BDC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t ForYouState.awardLoadStates.getter()
{
  type metadata accessor for ForYouState();
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for ForYouState()
{
  uint64_t result;

  result = qword_256B228B0;
  if (!qword_256B228B0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ForYouState.awardLoadStates.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for ForYouState() + 20);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*ForYouState.awardLoadStates.modify())()
{
  type metadata accessor for ForYouState();
  return nullsub_1;
}

uint64_t ForYouState.browsingIdentity.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 24));
}

uint64_t ForYouState.hasExistingDescriptors.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 28));
}

uint64_t ForYouState.isFixedWidth.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 32));
}

uint64_t ForYouState.isInternalBuild.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 36));
}

uint64_t ForYouState.isShowingCreatePlanAlert.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 40));
}

uint64_t ForYouState.isShowingCreatePlanAlert.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for ForYouState();
  *(_BYTE *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*ForYouState.isShowingCreatePlanAlert.modify())()
{
  type metadata accessor for ForYouState();
  return nullsub_1;
}

__n128 ForYouState.layout.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;
  __n128 result;

  v3 = v1 + *(int *)(type metadata accessor for ForYouState() + 44);
  v4 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(_OWORD *)(a1 + 16) = v4;
  result = *(__n128 *)(v3 + 32);
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t ForYouState.loadState.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for ForYouState() + 48);
  v2 = *(_QWORD *)v1;
  sub_23C11B380(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24));
  return v2;
}

uint64_t sub_23C11B380(uint64_t result, uint64_t a2, char a3, char a4)
{
  if (a4 == 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  else if (!a4)
  {
    return sub_23C10BACC(result, a2, a3);
  }
  return result;
}

uint64_t ForYouState.loadState.setter(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t result;

  v9 = v4 + *(int *)(type metadata accessor for ForYouState() + 48);
  result = sub_23C11B438(*(_QWORD *)v9, *(_QWORD *)(v9 + 8), *(_QWORD *)(v9 + 16), *(_BYTE *)(v9 + 24));
  *(_QWORD *)v9 = a1;
  *(_QWORD *)(v9 + 8) = a2;
  *(_QWORD *)(v9 + 16) = a3;
  *(_BYTE *)(v9 + 24) = a4;
  return result;
}

uint64_t sub_23C11B438(uint64_t result, uint64_t a2, char a3, char a4)
{
  if (a4 == 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else if (!a4)
  {
    return sub_23C10BB58(result, a2, a3);
  }
  return result;
}

uint64_t (*ForYouState.loadState.modify())()
{
  type metadata accessor for ForYouState();
  return nullsub_1;
}

uint64_t ForYouState.metrics.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  result = type metadata accessor for ForYouState();
  v4 = (uint64_t *)(v1 + *(int *)(result + 52));
  v5 = *v4;
  v6 = *((_BYTE *)v4 + 8);
  v7 = v4[2];
  v8 = *((_BYTE *)v4 + 24);
  v9 = v4[4];
  v10 = *((_BYTE *)v4 + 40);
  v11 = v4[6];
  v12 = *((_BYTE *)v4 + 56);
  v13 = v4[8];
  LOBYTE(v4) = *((_BYTE *)v4 + 72);
  *(_QWORD *)a1 = v5;
  *(_BYTE *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  *(_BYTE *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 32) = v9;
  *(_BYTE *)(a1 + 40) = v10;
  *(_QWORD *)(a1 + 48) = v11;
  *(_BYTE *)(a1 + 56) = v12;
  *(_QWORD *)(a1 + 64) = v13;
  *(_BYTE *)(a1 + 72) = (_BYTE)v4;
  return result;
}

uint64_t ForYouState.metrics.setter(uint64_t *a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v1 = *a1;
  v2 = *((_BYTE *)a1 + 8);
  v3 = a1[2];
  v4 = *((_BYTE *)a1 + 24);
  v5 = a1[4];
  v6 = *((_BYTE *)a1 + 40);
  v7 = a1[6];
  v8 = *((_BYTE *)a1 + 56);
  v9 = a1[8];
  v10 = *((_BYTE *)a1 + 72);
  result = type metadata accessor for ForYouState();
  v12 = v13 + *(int *)(result + 52);
  *(_QWORD *)v12 = v1;
  *(_BYTE *)(v12 + 8) = v2;
  *(_QWORD *)(v12 + 16) = v3;
  *(_BYTE *)(v12 + 24) = v4;
  *(_QWORD *)(v12 + 32) = v5;
  *(_BYTE *)(v12 + 40) = v6;
  *(_QWORD *)(v12 + 48) = v7;
  *(_BYTE *)(v12 + 56) = v8;
  *(_QWORD *)(v12 + 64) = v9;
  *(_BYTE *)(v12 + 72) = v10;
  return result;
}

uint64_t (*ForYouState.metrics.modify())()
{
  type metadata accessor for ForYouState();
  return nullsub_1;
}

uint64_t ForYouState.maxRetryCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for ForYouState() + 56));
}

uint64_t ForYouState.networkConditions.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 60));
}

uint64_t ForYouState.networkConditions.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for ForYouState();
  *(_BYTE *)(v1 + *(int *)(result + 60)) = a1;
  return result;
}

uint64_t (*ForYouState.networkConditions.modify())()
{
  type metadata accessor for ForYouState();
  return nullsub_1;
}

uint64_t ForYouState.retryCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for ForYouState() + 64));
}

uint64_t ForYouState.retryCount.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for ForYouState();
  *(_QWORD *)(v1 + *(int *)(result + 64)) = a1;
  return result;
}

uint64_t (*ForYouState.retryCount.modify())()
{
  type metadata accessor for ForYouState();
  return nullsub_1;
}

uint64_t ForYouState.shouldShowExploreButton.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 68));
}

uint64_t ForYouState.sizeClass.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 72));
}

uint64_t ForYouState.sizeClass.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for ForYouState();
  *(_BYTE *)(v1 + *(int *)(result + 72)) = a1;
  return result;
}

uint64_t (*ForYouState.sizeClass.modify())()
{
  type metadata accessor for ForYouState();
  return nullsub_1;
}

uint64_t ForYouState.subscriptionState.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 76));
}

uint64_t ForYouState.subscriptionState.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for ForYouState();
  *(_BYTE *)(v1 + *(int *)(result + 76)) = a1;
  return result;
}

uint64_t (*ForYouState.subscriptionState.modify())()
{
  type metadata accessor for ForYouState();
  return nullsub_1;
}

uint64_t ForYouState.supportsLocalDataSource.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 80));
}

__n128 ForYouState.init(activeStorefrontLocale:awardLoadStates:browsingIdentity:hasExistingDescriptors:isFixedWidth:isInternalBuild:isShowingCreatePlanAlert:layout:loadState:metrics:maxRetryCount:networkConditions:shouldShowExploreButton:sizeClass:subscriptionState:supportsLocalDataSource:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, char a5@<W4>, char a6@<W5>, char a7@<W6>, __int128 *a8@<X7>, uint64_t a9@<X8>, __n128 a10, unint64_t a11, unsigned __int8 a12, uint64_t *a13, uint64_t a14, char a15, char a16, char a17, char a18, char a19)
{
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  int *v30;
  uint64_t v31;
  uint64_t v32;
  __n128 *v33;
  __n128 result;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  char v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  char v42;
  uint64_t v43;

  v23 = a3 & 1;
  v36 = a8[1];
  v37 = *a8;
  v24 = *((_QWORD *)a8 + 4);
  v25 = *((_QWORD *)a8 + 5);
  v26 = *a13;
  v27 = *((_BYTE *)a13 + 8);
  v28 = a13[2];
  v29 = *((_BYTE *)a13 + 24);
  v43 = a13[4];
  v42 = *((_BYTE *)a13 + 40);
  v41 = a13[6];
  v40 = *((_BYTE *)a13 + 56);
  v39 = a13[8];
  v38 = *((_BYTE *)a13 + 72);
  v30 = (int *)type metadata accessor for ForYouState();
  *(_QWORD *)(a9 + v30[16]) = 0;
  v31 = sub_23C138BDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(a9, a1, v31);
  *(_QWORD *)(a9 + v30[5]) = a2;
  *(_BYTE *)(a9 + v30[6]) = v23;
  *(_BYTE *)(a9 + v30[7]) = a4;
  *(_BYTE *)(a9 + v30[8]) = a5;
  *(_BYTE *)(a9 + v30[9]) = a6;
  *(_BYTE *)(a9 + v30[10]) = a7;
  v32 = a9 + v30[11];
  *(_OWORD *)v32 = v37;
  *(_OWORD *)(v32 + 16) = v36;
  *(_QWORD *)(v32 + 32) = v24;
  *(_QWORD *)(v32 + 40) = v25;
  v33 = (__n128 *)(a9 + v30[12]);
  result = a10;
  *v33 = a10;
  v33[1].n128_u64[0] = a11;
  v33[1].n128_u8[8] = a12;
  v35 = a9 + v30[13];
  *(_QWORD *)v35 = v26;
  *(_BYTE *)(v35 + 8) = v27;
  *(_QWORD *)(v35 + 16) = v28;
  *(_BYTE *)(v35 + 24) = v29;
  *(_QWORD *)(v35 + 32) = v43;
  *(_BYTE *)(v35 + 40) = v42;
  *(_QWORD *)(v35 + 48) = v41;
  *(_BYTE *)(v35 + 56) = v40;
  *(_QWORD *)(v35 + 64) = v39;
  *(_BYTE *)(v35 + 72) = v38;
  *(_QWORD *)(a9 + v30[14]) = a14;
  *(_BYTE *)(a9 + v30[15]) = a15;
  *(_BYTE *)(a9 + v30[17]) = a16;
  *(_BYTE *)(a9 + v30[18]) = a17;
  *(_BYTE *)(a9 + v30[19]) = a18;
  *(_BYTE *)(a9 + v30[20]) = a19;
  return result;
}

uint64_t sub_23C11BA60(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C11BA9C + 4 * byte_23C13E770[a1]))(0xD000000000000016, 0x800000023C140700);
}

uint64_t sub_23C11BA9C()
{
  return 0x616F4C6472617761;
}

uint64_t sub_23C11BAC0()
{
  uint64_t v0;

  return v0 - 1;
}

uint64_t sub_23C11BC2C()
{
  unsigned __int8 *v0;

  return sub_23C11BA60(*v0);
}

uint64_t sub_23C11BC34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C11DF54(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C11BC58(_BYTE *a1@<X8>)
{
  *a1 = 17;
}

uint64_t sub_23C11BC64()
{
  sub_23C11C1EC();
  return sub_23C139350();
}

uint64_t sub_23C11BC8C()
{
  sub_23C11C1EC();
  return sub_23C13935C();
}

uint64_t ForYouState.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  __int128 *v10;
  __int128 v11;
  __int128 *v12;
  uint64_t v13;
  char v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  char v33;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B227D8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C11C1EC();
  sub_23C139338();
  LOBYTE(v26) = 0;
  sub_23C138BDC();
  sub_23C1079C0(&qword_256B21C30, MEMORY[0x24BDCEEC8]);
  sub_23C139278();
  if (!v2)
  {
    v9 = (int *)type metadata accessor for ForYouState();
    *(_QWORD *)&v26 = *(_QWORD *)(v3 + v9[5]);
    v33 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B227E8);
    sub_23C11CACC(&qword_256B227F0, (uint64_t (*)(void))sub_23C11C230, MEMORY[0x24BEE0D08], MEMORY[0x24BEE04C0]);
    sub_23C139278();
    LOBYTE(v26) = *(_BYTE *)(v3 + v9[6]);
    v33 = 2;
    sub_23C109B40();
    sub_23C139278();
    LOBYTE(v26) = 3;
    sub_23C139254();
    LOBYTE(v26) = 4;
    sub_23C139254();
    LOBYTE(v26) = 5;
    sub_23C139254();
    LOBYTE(v26) = 6;
    sub_23C139254();
    v10 = (__int128 *)(v3 + v9[11]);
    v11 = v10[1];
    v26 = *v10;
    v27 = v11;
    v28 = v10[2];
    v33 = 7;
    sub_23C11C274();
    sub_23C139278();
    v12 = (__int128 *)(v3 + v9[12]);
    v13 = *((_QWORD *)v12 + 2);
    v14 = *((_BYTE *)v12 + 24);
    v26 = *v12;
    *(_QWORD *)&v27 = v13;
    BYTE8(v27) = v14;
    v33 = 8;
    sub_23C11C2B8();
    sub_23C139278();
    v15 = (uint64_t *)(v3 + v9[13]);
    v16 = *v15;
    v17 = *((_BYTE *)v15 + 8);
    v18 = v15[2];
    v19 = *((_BYTE *)v15 + 24);
    v20 = v15[4];
    v21 = *((_BYTE *)v15 + 40);
    v22 = v15[6];
    v23 = *((_BYTE *)v15 + 56);
    v24 = v15[8];
    LOBYTE(v15) = *((_BYTE *)v15 + 72);
    *(_QWORD *)&v26 = v16;
    BYTE8(v26) = v17;
    *(_QWORD *)&v27 = v18;
    BYTE8(v27) = v19;
    *(_QWORD *)&v28 = v20;
    BYTE8(v28) = v21;
    v29 = v22;
    v30 = v23;
    v31 = v24;
    v32 = (char)v15;
    v33 = 9;
    sub_23C11C2FC();
    sub_23C139278();
    LOBYTE(v26) = 10;
    sub_23C13926C();
    LOBYTE(v26) = *(_BYTE *)(v3 + v9[15]);
    v33 = 11;
    sub_23C109818();
    sub_23C139278();
    LOBYTE(v26) = 12;
    sub_23C13926C();
    LOBYTE(v26) = 13;
    sub_23C139254();
    LOBYTE(v26) = *(_BYTE *)(v3 + v9[18]);
    v33 = 14;
    sub_23C11C340();
    sub_23C139278();
    LOBYTE(v26) = *(_BYTE *)(v3 + v9[19]);
    v33 = 15;
    sub_23C1096C4();
    sub_23C139278();
    LOBYTE(v26) = 16;
    sub_23C139254();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_23C11C1EC()
{
  unint64_t result;

  result = qword_256B227E0;
  if (!qword_256B227E0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E9F4, &type metadata for ForYouState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B227E0);
  }
  return result;
}

unint64_t sub_23C11C230()
{
  unint64_t result;

  result = qword_256B227F8;
  if (!qword_256B227F8)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for AwardLoadState, &type metadata for AwardLoadState);
    atomic_store(result, (unint64_t *)&qword_256B227F8);
  }
  return result;
}

unint64_t sub_23C11C274()
{
  unint64_t result;

  result = qword_256B22800;
  if (!qword_256B22800)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for Layout, &type metadata for Layout);
    atomic_store(result, (unint64_t *)&qword_256B22800);
  }
  return result;
}

unint64_t sub_23C11C2B8()
{
  unint64_t result;

  result = qword_256B22808;
  if (!qword_256B22808)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for LoadState, &type metadata for LoadState);
    atomic_store(result, (unint64_t *)&qword_256B22808);
  }
  return result;
}

unint64_t sub_23C11C2FC()
{
  unint64_t result;

  result = qword_256B22810;
  if (!qword_256B22810)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for ForYouPerformanceMetric, &type metadata for ForYouPerformanceMetric);
    atomic_store(result, (unint64_t *)&qword_256B22810);
  }
  return result;
}

unint64_t sub_23C11C340()
{
  unint64_t result;

  result = qword_256B22818;
  if (!qword_256B22818)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for SizeClass, &type metadata for SizeClass);
    atomic_store(result, (unint64_t *)&qword_256B22818);
  }
  return result;
}

uint64_t ForYouState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  char *v14;
  int *v15;
  char *v16;
  __int128 v17;
  uint64_t v18;
  char v19;
  char *v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  char *v30;
  char v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  int *v42;
  char *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  char v50;
  char v51;

  v37 = a2;
  v4 = sub_23C138BDC();
  v40 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22820);
  v7 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for ForYouState();
  v42 = (int *)MEMORY[0x24BDAC7A8](v10);
  v43 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v42[16];
  *(_QWORD *)&v43[v12] = 0;
  v13 = a1[3];
  v41 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_23C11C1EC();
  v38 = v9;
  sub_23C13932C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  v35 = v12;
  v36 = v7;
  LOBYTE(v44) = 0;
  sub_23C1079C0(&qword_256B21C40, MEMORY[0x24BDCEEE8]);
  sub_23C139200();
  v14 = v43;
  (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v43, v6, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B227E8);
  v51 = 1;
  sub_23C11CACC(&qword_256B22828, (uint64_t (*)(void))sub_23C11CB40, MEMORY[0x24BEE0D38], MEMORY[0x24BEE04E0]);
  sub_23C139200();
  v15 = v42;
  *(_QWORD *)&v14[v42[5]] = v44;
  v51 = 2;
  sub_23C10CDE4();
  sub_23C139200();
  v14[v15[6]] = v44;
  LOBYTE(v44) = 3;
  v14[v15[7]] = sub_23C1391DC() & 1;
  LOBYTE(v44) = 4;
  v14[v15[8]] = sub_23C1391DC() & 1;
  LOBYTE(v44) = 5;
  v14[v15[9]] = sub_23C1391DC() & 1;
  LOBYTE(v44) = 6;
  v14[v15[10]] = sub_23C1391DC() & 1;
  v51 = 7;
  sub_23C11CB84();
  sub_23C139200();
  v16 = &v14[v15[11]];
  v17 = v45;
  *(_OWORD *)v16 = v44;
  *((_OWORD *)v16 + 1) = v17;
  *((_OWORD *)v16 + 2) = v46;
  v51 = 8;
  sub_23C11CBC8();
  sub_23C139200();
  v18 = v45;
  v19 = BYTE8(v45);
  v20 = &v14[v15[12]];
  *(_OWORD *)v20 = v44;
  *((_QWORD *)v20 + 2) = v18;
  v20[24] = v19;
  v51 = 9;
  sub_23C11CC0C();
  sub_23C139200();
  v21 = BYTE8(v44);
  v22 = v45;
  v23 = BYTE8(v45);
  v24 = v46;
  v25 = BYTE8(v46);
  v26 = v47;
  v27 = v48;
  v28 = v49;
  v29 = v50;
  v30 = &v43[v42[13]];
  *(_QWORD *)v30 = v44;
  v30[8] = v21;
  *((_QWORD *)v30 + 2) = v22;
  v30[24] = v23;
  *((_QWORD *)v30 + 4) = v24;
  v30[40] = v25;
  *((_QWORD *)v30 + 6) = v26;
  v30[56] = v27;
  *((_QWORD *)v30 + 8) = v28;
  v30[72] = v29;
  LOBYTE(v44) = 10;
  *(_QWORD *)&v43[v42[14]] = sub_23C1391F4();
  v51 = 11;
  sub_23C10CD18();
  sub_23C139200();
  v43[v42[15]] = v44;
  LOBYTE(v44) = 12;
  *(_QWORD *)&v43[v35] = sub_23C1391F4();
  LOBYTE(v44) = 13;
  v43[v42[17]] = sub_23C1391DC() & 1;
  v51 = 14;
  sub_23C11CC50();
  sub_23C139200();
  v43[v42[18]] = v44;
  v51 = 15;
  sub_23C10CCD4();
  sub_23C139200();
  v43[v42[19]] = v44;
  LOBYTE(v44) = 16;
  v31 = sub_23C1391DC();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v39);
  v32 = (uint64_t)v43;
  v43[v42[20]] = v31 & 1;
  sub_23C11CC94(v32, v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  return sub_23C11CCD8(v32);
}

uint64_t sub_23C11CACC(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B227E8);
    v10[0] = a3;
    v10[1] = a2();
    result = MEMORY[0x2426179DC](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C11CB40()
{
  unint64_t result;

  result = qword_256B22830;
  if (!qword_256B22830)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for AwardLoadState, &type metadata for AwardLoadState);
    atomic_store(result, (unint64_t *)&qword_256B22830);
  }
  return result;
}

unint64_t sub_23C11CB84()
{
  unint64_t result;

  result = qword_256B22838;
  if (!qword_256B22838)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for Layout, &type metadata for Layout);
    atomic_store(result, (unint64_t *)&qword_256B22838);
  }
  return result;
}

unint64_t sub_23C11CBC8()
{
  unint64_t result;

  result = qword_256B22840;
  if (!qword_256B22840)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for LoadState, &type metadata for LoadState);
    atomic_store(result, (unint64_t *)&qword_256B22840);
  }
  return result;
}

unint64_t sub_23C11CC0C()
{
  unint64_t result;

  result = qword_256B22848;
  if (!qword_256B22848)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for ForYouPerformanceMetric, &type metadata for ForYouPerformanceMetric);
    atomic_store(result, (unint64_t *)&qword_256B22848);
  }
  return result;
}

unint64_t sub_23C11CC50()
{
  unint64_t result;

  result = qword_256B22850;
  if (!qword_256B22850)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for SizeClass, &type metadata for SizeClass);
    atomic_store(result, (unint64_t *)&qword_256B22850);
  }
  return result;
}

uint64_t sub_23C11CC94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ForYouState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C11CCD8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ForYouState();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C11CD14@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ForYouState.init(from:)(a1, a2);
}

uint64_t sub_23C11CD28(_QWORD *a1)
{
  return ForYouState.encode(to:)(a1);
}

unint64_t sub_23C11CD40(unint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t i;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  int64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  unint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  int64_t v34;
  uint64_t v35;
  unint64_t v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;

  if (result == a2)
    return 1;
  v2 = a2;
  v3 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v33 = result + 64;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v37 = 0;
  v34 = (unint64_t)(v4 + 63) >> 6;
  v6 = v5 & *(_QWORD *)(result + 64);
  if (v6)
    goto LABEL_9;
LABEL_10:
  v8 = v37 + 1;
  if (!__OFADD__(v37, 1))
  {
    if (v8 < v34)
    {
      v9 = *(_QWORD *)(v33 + 8 * v8);
      v10 = v37 + 1;
      if (v9)
        goto LABEL_25;
      v10 = v37 + 2;
      if (v37 + 2 >= v34)
        return 1;
      v9 = *(_QWORD *)(v33 + 8 * v10);
      if (v9)
        goto LABEL_25;
      v10 = v37 + 3;
      if (v37 + 3 >= v34)
        return 1;
      v9 = *(_QWORD *)(v33 + 8 * v10);
      if (v9)
        goto LABEL_25;
      v10 = v37 + 4;
      if (v37 + 4 >= v34)
        return 1;
      v9 = *(_QWORD *)(v33 + 8 * v10);
      if (v9)
      {
LABEL_25:
        v37 = v10;
        v38 = (v9 - 1) & v9;
        for (i = __clz(__rbit64(v9)) + (v10 << 6); ; i = __clz(__rbit64(v6)) | (v37 << 6))
        {
          v12 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * i);
          v13 = *v12;
          v14 = v12[1];
          v15 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * i);
          swift_bridgeObjectRetain();
          sub_23C11E5D4(v15);
          v16 = sub_23C137C30(v13, v14);
          v18 = v17;
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
LABEL_52:
            sub_23C11E5E4(v15);
            return 0;
          }
          result = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v16);
          if (!result)
            break;
          if (result == 1)
          {
            if (v15 != 1)
              goto LABEL_52;
LABEL_8:
            v6 = v38;
            if (!v38)
              goto LABEL_10;
            goto LABEL_9;
          }
          if (v15 < 2)
            goto LABEL_52;
          v19 = *(_QWORD *)(result + 16);
          if (v19 != *(_QWORD *)(v15 + 16))
            goto LABEL_52;
          if (v19)
            v20 = result == v15;
          else
            v20 = 1;
          if (!v20)
          {
            v30 = v3;
            v31 = v2;
            result = swift_bridgeObjectRetain();
            v21 = 0;
            v22 = (uint64_t *)(v15 + 64);
            v32 = result;
            v23 = (uint64_t *)(result + 64);
            v35 = v19;
            v36 = v15;
            while (v21 < *(_QWORD *)(v15 + 16))
            {
              v24 = *(v23 - 2);
              v25 = *(v23 - 1);
              v26 = *v23;
              v27 = *(v22 - 2);
              v28 = *(v22 - 1);
              v39 = *v22;
              if ((*(v23 - 4) != *(v22 - 4) || *(v23 - 3) != *(v22 - 3)) && (sub_23C139284() & 1) == 0)
                goto LABEL_51;
              if ((v24 != v27 || v25 != v28) && (sub_23C139284() & 1) == 0)
                goto LABEL_51;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v29 = sub_23C12BB34(v26, v39);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              result = swift_bridgeObjectRelease();
              if ((v29 & 1) == 0)
              {
LABEL_51:
                sub_23C11E5E4(v32);
                v15 = v36;
                goto LABEL_52;
              }
              ++v21;
              v22 += 5;
              v23 += 5;
              v15 = v36;
              if (v35 == v21)
              {
                sub_23C11E5E4(v32);
                v3 = v30;
                v2 = v31;
                goto LABEL_36;
              }
            }
            __break(1u);
            goto LABEL_55;
          }
LABEL_36:
          result = sub_23C11E5E4(v15);
          v6 = v38;
          if (!v38)
            goto LABEL_10;
LABEL_9:
          v38 = (v6 - 1) & v6;
        }
        if (v15)
          goto LABEL_52;
        goto LABEL_8;
      }
      v11 = v37 + 5;
      if (v37 + 5 < v34)
      {
        v9 = *(_QWORD *)(v33 + 8 * v11);
        if (v9)
        {
          v10 = v37 + 5;
          goto LABEL_25;
        }
        while (1)
        {
          v10 = v11 + 1;
          if (__OFADD__(v11, 1))
            goto LABEL_56;
          if (v10 >= v34)
            return 1;
          v9 = *(_QWORD *)(v33 + 8 * v10);
          ++v11;
          if (v9)
            goto LABEL_25;
        }
      }
    }
    return 1;
  }
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
  return result;
}

uint64_t _s13FitnessForYou0bC5StateV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  float64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  float64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  float64x2_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  float64x2_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char v45;

  if ((MEMORY[0x242616FBC]() & 1) == 0)
    goto LABEL_18;
  v4 = (int *)type metadata accessor for ForYouState();
  if ((sub_23C11CD40(*(_QWORD *)(a1 + v4[5]), *(_QWORD *)(a2 + v4[5])) & 1) == 0)
    goto LABEL_18;
  if (*(unsigned __int8 *)(a1 + v4[6]) != *(unsigned __int8 *)(a2 + v4[6]))
    goto LABEL_18;
  if (*(unsigned __int8 *)(a1 + v4[7]) != *(unsigned __int8 *)(a2 + v4[7]))
    goto LABEL_18;
  if (*(unsigned __int8 *)(a1 + v4[8]) != *(unsigned __int8 *)(a2 + v4[8]))
    goto LABEL_18;
  if (*(unsigned __int8 *)(a1 + v4[9]) != *(unsigned __int8 *)(a2 + v4[9]))
    goto LABEL_18;
  if (*(unsigned __int8 *)(a1 + v4[10]) != *(unsigned __int8 *)(a2 + v4[10]))
    goto LABEL_18;
  v5 = a1 + v4[11];
  v6 = *(_OWORD *)(v5 + 16);
  v39 = *(float64x2_t *)v5;
  v40 = v6;
  v41 = *(_OWORD *)(v5 + 32);
  v7 = a2 + v4[11];
  v8 = *(_OWORD *)(v7 + 16);
  v32 = *(float64x2_t *)v7;
  v33 = v8;
  v34 = *(_OWORD *)(v7 + 32);
  if (!_s13FitnessForYou6LayoutV2eeoiySbAC_ACtFZ_0(&v39, &v32))
    goto LABEL_18;
  v9 = v4[12];
  if ((_s13FitnessForYou9LoadStateO2eeoiySbAC_ACtFZ_0(*(_QWORD *)(a1 + v9), *(_QWORD *)(a1 + v9 + 8), *(_QWORD *)(a1 + v9 + 16), *(_BYTE *)(a1 + v9 + 24), *(_QWORD *)(a2 + v9), *(_QWORD *)(a2 + v9 + 8), *(_QWORD *)(a2 + v9 + 16), *(_BYTE *)(a2 + v9 + 24)) & 1) == 0)goto LABEL_18;
  v10 = a1 + v4[13];
  v11 = *(double *)v10;
  v12 = *(_BYTE *)(v10 + 8);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = *(_BYTE *)(v10 + 24);
  v15 = *(_QWORD *)(v10 + 32);
  v16 = *(_BYTE *)(v10 + 40);
  v17 = *(_QWORD *)(v10 + 48);
  v18 = *(_BYTE *)(v10 + 56);
  v19 = *(_QWORD *)(v10 + 64);
  LOBYTE(v10) = *(_BYTE *)(v10 + 72);
  v39.f64[0] = v11;
  LOBYTE(v39.f64[1]) = v12;
  *(_QWORD *)&v40 = v13;
  BYTE8(v40) = v14;
  *(_QWORD *)&v41 = v15;
  BYTE8(v41) = v16;
  v42 = v17;
  v43 = v18;
  v44 = v19;
  v45 = v10;
  v20 = a2 + v4[13];
  v21 = *(double *)v20;
  v22 = *(_BYTE *)(v20 + 8);
  v23 = *(_QWORD *)(v20 + 16);
  v24 = *(_BYTE *)(v20 + 24);
  v25 = *(_QWORD *)(v20 + 32);
  v26 = *(_BYTE *)(v20 + 40);
  v27 = *(_QWORD *)(v20 + 48);
  v28 = *(_BYTE *)(v20 + 56);
  v29 = *(_QWORD *)(v20 + 64);
  LOBYTE(v20) = *(_BYTE *)(v20 + 72);
  v32.f64[0] = v21;
  LOBYTE(v32.f64[1]) = v22;
  *(_QWORD *)&v33 = v23;
  BYTE8(v33) = v24;
  *(_QWORD *)&v34 = v25;
  BYTE8(v34) = v26;
  v35 = v27;
  v36 = v28;
  v37 = v29;
  v38 = v20;
  if (!_s13FitnessForYou0bC17PerformanceMetricV2eeoiySbAC_ACtFZ_0((uint64_t)&v39, (uint64_t)&v32))
    goto LABEL_18;
  if (*(_QWORD *)(a1 + v4[14]) == *(_QWORD *)(a2 + v4[14])
    && *(unsigned __int8 *)(a1 + v4[15]) == *(unsigned __int8 *)(a2 + v4[15])
    && *(_QWORD *)(a1 + v4[16]) == *(_QWORD *)(a2 + v4[16])
    && *(unsigned __int8 *)(a1 + v4[17]) == *(unsigned __int8 *)(a2 + v4[17])
    && *(unsigned __int8 *)(a1 + v4[18]) == *(unsigned __int8 *)(a2 + v4[18])
    && *(unsigned __int8 *)(a1 + v4[19]) == *(unsigned __int8 *)(a2 + v4[19]))
  {
    v30 = *(_BYTE *)(a1 + v4[20]) ^ *(_BYTE *)(a2 + v4[20]) ^ 1;
  }
  else
  {
LABEL_18:
    v30 = 0;
  }
  return v30 & 1;
}

_QWORD *initializeBufferWithCopyOfBuffer for ForYouState(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  __int128 *v14;
  __int128 v15;
  __int128 v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  _OWORD *v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v31 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v31 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23C138BDC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
    *((_BYTE *)a1 + v8) = *((_BYTE *)a2 + v8);
    v9 = a3[8];
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    *((_BYTE *)a1 + v9) = *((_BYTE *)a2 + v9);
    v10 = a3[10];
    *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
    *((_BYTE *)a1 + v10) = *((_BYTE *)a2 + v10);
    v11 = a3[11];
    v12 = a3[12];
    v13 = (_OWORD *)((char *)a1 + v11);
    v14 = (__int128 *)((char *)a2 + v11);
    v15 = v14[2];
    v16 = *v14;
    v13[1] = v14[1];
    v13[2] = v15;
    *v13 = v16;
    v17 = (char *)a1 + v12;
    v18 = *(_QWORD *)((char *)a2 + v12);
    v19 = *(_QWORD *)((char *)a2 + v12 + 8);
    v20 = *(_QWORD *)((char *)a2 + v12 + 16);
    v21 = *((_BYTE *)a2 + v12 + 24);
    swift_bridgeObjectRetain();
    sub_23C11B380(v18, v19, v20, v21);
    *(_QWORD *)v17 = v18;
    *((_QWORD *)v17 + 1) = v19;
    *((_QWORD *)v17 + 2) = v20;
    v17[24] = v21;
    v22 = a3[13];
    v23 = a3[14];
    v24 = (_OWORD *)((char *)a1 + v22);
    v25 = (_OWORD *)((char *)a2 + v22);
    v26 = v25[3];
    v24[2] = v25[2];
    v24[3] = v26;
    *(_OWORD *)((char *)v24 + 57) = *(_OWORD *)((char *)v25 + 57);
    v27 = v25[1];
    *v24 = *v25;
    v24[1] = v27;
    *(_QWORD *)((char *)a1 + v23) = *(_QWORD *)((char *)a2 + v23);
    v28 = a3[16];
    *((_BYTE *)a1 + a3[15]) = *((_BYTE *)a2 + a3[15]);
    *(_QWORD *)((char *)a1 + v28) = *(_QWORD *)((char *)a2 + v28);
    v29 = a3[18];
    *((_BYTE *)a1 + a3[17]) = *((_BYTE *)a2 + a3[17]);
    *((_BYTE *)a1 + v29) = *((_BYTE *)a2 + v29);
    v30 = a3[20];
    *((_BYTE *)a1 + a3[19]) = *((_BYTE *)a2 + a3[19]);
    *((_BYTE *)a1 + v30) = *((_BYTE *)a2 + v30);
  }
  return a1;
}

uint64_t destroy for ForYouState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C138BDC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  return sub_23C11B438(*(_QWORD *)(a1 + *(int *)(a2 + 48)), *(_QWORD *)(a1 + *(int *)(a2 + 48) + 8), *(_QWORD *)(a1 + *(int *)(a2 + 48) + 16), *(_BYTE *)(a1 + *(int *)(a2 + 48) + 24));
}

uint64_t initializeWithCopy for ForYouState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  __int128 *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD *v23;
  _OWORD *v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = sub_23C138BDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  v9 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v9) = *(_BYTE *)(a2 + v9);
  v10 = a3[11];
  v11 = a3[12];
  v12 = (_OWORD *)(a1 + v10);
  v13 = (__int128 *)(a2 + v10);
  v14 = v13[2];
  v15 = *v13;
  v12[1] = v13[1];
  v12[2] = v14;
  *v12 = v15;
  v16 = a1 + v11;
  v17 = *(_QWORD *)(a2 + v11);
  v18 = *(_QWORD *)(a2 + v11 + 8);
  v19 = *(_QWORD *)(a2 + v11 + 16);
  v20 = *(_BYTE *)(a2 + v11 + 24);
  swift_bridgeObjectRetain();
  sub_23C11B380(v17, v18, v19, v20);
  *(_QWORD *)v16 = v17;
  *(_QWORD *)(v16 + 8) = v18;
  *(_QWORD *)(v16 + 16) = v19;
  *(_BYTE *)(v16 + 24) = v20;
  v21 = a3[13];
  v22 = a3[14];
  v23 = (_OWORD *)(a1 + v21);
  v24 = (_OWORD *)(a2 + v21);
  v25 = v24[3];
  v23[2] = v24[2];
  v23[3] = v25;
  *(_OWORD *)((char *)v23 + 57) = *(_OWORD *)((char *)v24 + 57);
  v26 = v24[1];
  *v23 = *v24;
  v23[1] = v26;
  *(_QWORD *)(a1 + v22) = *(_QWORD *)(a2 + v22);
  v27 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_QWORD *)(a1 + v27) = *(_QWORD *)(a2 + v27);
  v28 = a3[18];
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  *(_BYTE *)(a1 + v28) = *(_BYTE *)(a2 + v28);
  v29 = a3[20];
  *(_BYTE *)(a1 + a3[19]) = *(_BYTE *)(a2 + a3[19]);
  *(_BYTE *)(a1 + v29) = *(_BYTE *)(a2 + v29);
  return a1;
}

uint64_t assignWithCopy for ForYouState(uint64_t a1, uint64_t a2, int *a3)
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
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v6 = sub_23C138BDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  v7 = a3[11];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  v8[4] = v9[4];
  v8[5] = v9[5];
  v10 = a3[12];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = *(_QWORD *)v12;
  v14 = *(_QWORD *)(v12 + 8);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = *(_BYTE *)(v12 + 24);
  sub_23C11B380(*(_QWORD *)v12, v14, v15, v16);
  v17 = *(_QWORD *)v11;
  v18 = *(_QWORD *)(v11 + 8);
  v19 = *(_QWORD *)(v11 + 16);
  *(_QWORD *)v11 = v13;
  *(_QWORD *)(v11 + 8) = v14;
  *(_QWORD *)(v11 + 16) = v15;
  v20 = *(_BYTE *)(v11 + 24);
  *(_BYTE *)(v11 + 24) = v16;
  sub_23C11B438(v17, v18, v19, v20);
  v21 = a3[13];
  v22 = a1 + v21;
  v23 = (uint64_t *)(a2 + v21);
  v24 = *v23;
  *(_BYTE *)(v22 + 8) = *((_BYTE *)v23 + 8);
  *(_QWORD *)v22 = v24;
  v25 = v23[2];
  *(_BYTE *)(v22 + 24) = *((_BYTE *)v23 + 24);
  *(_QWORD *)(v22 + 16) = v25;
  v26 = v23[4];
  *(_BYTE *)(v22 + 40) = *((_BYTE *)v23 + 40);
  *(_QWORD *)(v22 + 32) = v26;
  v27 = v23[6];
  *(_BYTE *)(v22 + 56) = *((_BYTE *)v23 + 56);
  *(_QWORD *)(v22 + 48) = v27;
  v28 = v23[8];
  *(_BYTE *)(v22 + 72) = *((_BYTE *)v23 + 72);
  *(_QWORD *)(v22 + 64) = v28;
  *(_QWORD *)(a1 + a3[14]) = *(_QWORD *)(a2 + a3[14]);
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_QWORD *)(a1 + a3[16]) = *(_QWORD *)(a2 + a3[16]);
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  *(_BYTE *)(a1 + a3[18]) = *(_BYTE *)(a2 + a3[18]);
  *(_BYTE *)(a1 + a3[19]) = *(_BYTE *)(a2 + a3[19]);
  *(_BYTE *)(a1 + a3[20]) = *(_BYTE *)(a2 + a3[20]);
  return a1;
}

uint64_t initializeWithTake for ForYouState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  __int128 v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _OWORD *v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = sub_23C138BDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  v9 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v9) = *(_BYTE *)(a2 + v9);
  v10 = a3[11];
  v11 = a3[12];
  v12 = (_OWORD *)(a1 + v10);
  v13 = (_OWORD *)(a2 + v10);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v12[2] = v13[2];
  v15 = (_OWORD *)(a1 + v11);
  v16 = (_OWORD *)(a2 + v11);
  *v15 = *v16;
  *(_OWORD *)((char *)v15 + 9) = *(_OWORD *)((char *)v16 + 9);
  v17 = a3[13];
  v18 = a3[14];
  v19 = (_OWORD *)(a1 + v17);
  v20 = (_OWORD *)(a2 + v17);
  *(_OWORD *)((char *)v19 + 57) = *(_OWORD *)((char *)v20 + 57);
  v21 = v20[3];
  v19[2] = v20[2];
  v19[3] = v21;
  v22 = v20[1];
  *v19 = *v20;
  v19[1] = v22;
  *(_QWORD *)(a1 + v18) = *(_QWORD *)(a2 + v18);
  v23 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_QWORD *)(a1 + v23) = *(_QWORD *)(a2 + v23);
  v24 = a3[18];
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  *(_BYTE *)(a1 + v24) = *(_BYTE *)(a2 + v24);
  v25 = a3[20];
  *(_BYTE *)(a1 + a3[19]) = *(_BYTE *)(a2 + a3[19]);
  *(_BYTE *)(a1 + v25) = *(_BYTE *)(a2 + v25);
  return a1;
}

uint64_t assignWithTake for ForYouState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
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
  uint64_t v28;

  v6 = sub_23C138BDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  swift_bridgeObjectRelease();
  v7 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  v9 = a3[11];
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  v10 = (_OWORD *)(a1 + v9);
  v11 = (_OWORD *)(a2 + v9);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  v10[2] = v11[2];
  v13 = a3[12];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = *(_QWORD *)(v15 + 16);
  v17 = *(_BYTE *)(v15 + 24);
  v18 = *(_QWORD *)v14;
  v19 = *(_QWORD *)(v14 + 8);
  v20 = *(_QWORD *)(v14 + 16);
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *(_QWORD *)(v14 + 16) = v16;
  v21 = *(_BYTE *)(v14 + 24);
  *(_BYTE *)(v14 + 24) = v17;
  sub_23C11B438(v18, v19, v20, v21);
  v22 = a3[13];
  v23 = a3[14];
  v24 = a1 + v22;
  v25 = a2 + v22;
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *(_BYTE *)(v24 + 8) = *(_BYTE *)(v25 + 8);
  *(_QWORD *)(v24 + 16) = *(_QWORD *)(v25 + 16);
  *(_BYTE *)(v24 + 24) = *(_BYTE *)(v25 + 24);
  *(_QWORD *)(v24 + 32) = *(_QWORD *)(v25 + 32);
  *(_BYTE *)(v24 + 40) = *(_BYTE *)(v25 + 40);
  *(_BYTE *)(v24 + 56) = *(_BYTE *)(v25 + 56);
  *(_QWORD *)(v24 + 48) = *(_QWORD *)(v25 + 48);
  *(_BYTE *)(v24 + 72) = *(_BYTE *)(v25 + 72);
  *(_QWORD *)(v24 + 64) = *(_QWORD *)(v25 + 64);
  *(_QWORD *)(a1 + v23) = *(_QWORD *)(a2 + v23);
  v26 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_QWORD *)(a1 + v26) = *(_QWORD *)(a2 + v26);
  v27 = a3[18];
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  *(_BYTE *)(a1 + v27) = *(_BYTE *)(a2 + v27);
  v28 = a3[20];
  *(_BYTE *)(a1 + a3[19]) = *(_BYTE *)(a2 + a3[19]);
  *(_BYTE *)(a1 + v28) = *(_BYTE *)(a2 + v28);
  return a1;
}

uint64_t getEnumTagSinglePayload for ForYouState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C11DB50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23C138BDC();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for ForYouState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C11DBD8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23C138BDC();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_23C11DC50()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23C138BDC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ForYouState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF0)
    goto LABEL_17;
  if (a2 + 16 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 16) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 16;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 16;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 16;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x11;
  v8 = v6 - 17;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ForYouState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 16 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 16) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF0)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEF)
    return ((uint64_t (*)(void))((char *)&loc_23C11DDFC + 4 * byte_23C13E786[v4]))();
  *a1 = a2 + 16;
  return ((uint64_t (*)(void))((char *)sub_23C11DE30 + 4 * byte_23C13E781[v4]))();
}

uint64_t sub_23C11DE30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C11DE38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C11DE40);
  return result;
}

uint64_t sub_23C11DE4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C11DE54);
  *(_BYTE *)result = a2 + 16;
  return result;
}

uint64_t sub_23C11DE58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C11DE60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ForYouState.CodingKeys()
{
  return &type metadata for ForYouState.CodingKeys;
}

unint64_t sub_23C11DE80()
{
  unint64_t result;

  result = qword_256B22928;
  if (!qword_256B22928)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E9CC, &type metadata for ForYouState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22928);
  }
  return result;
}

unint64_t sub_23C11DEC8()
{
  unint64_t result;

  result = qword_256B22930;
  if (!qword_256B22930)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E93C, &type metadata for ForYouState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22930);
  }
  return result;
}

unint64_t sub_23C11DF10()
{
  unint64_t result;

  result = qword_256B22938;
  if (!qword_256B22938)
  {
    result = MEMORY[0x2426179DC](&unk_23C13E964, &type metadata for ForYouState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22938);
  }
  return result;
}

uint64_t sub_23C11DF54(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000016 && a2 == 0x800000023C140700 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x616F4C6472617761 && a2 == 0xEF73657461745364 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023C140720 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000023C140740 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x5764657869467369 && a2 == 0xEC00000068746469 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E7265746E497369 && a2 == 0xEF646C6975426C61 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000023C140760 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x74756F79616CLL && a2 == 0xE600000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x7461745364616F6CLL && a2 == 0xE900000000000065 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x7363697274656DLL && a2 == 0xE700000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x797274655278616DLL && a2 == 0xED0000746E756F43 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C140780 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x756F437972746572 && a2 == 0xEA0000000000746ELL || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000023C1407A0 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x73616C43657A6973 && a2 == 0xE900000000000073 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C1407C0 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000023C1407E0)
  {
    swift_bridgeObjectRelease();
    return 16;
  }
  else
  {
    v5 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 16;
    else
      return 17;
  }
}

unint64_t sub_23C11E5D4(unint64_t result)
{
  if (result >= 2)
    return swift_bridgeObjectRetain();
  return result;
}

unint64_t sub_23C11E5E4(unint64_t result)
{
  if (result >= 2)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23C11E5F8(char a1)
{
  return *(_QWORD *)&aIdle_1[8 * a1];
}

uint64_t sub_23C11E618(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000012;
  else
    return 0x64496F636572;
}

uint64_t sub_23C11E650()
{
  char *v0;

  return sub_23C11E5F8(*v0);
}

uint64_t sub_23C11E658@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C11EFAC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C11E67C()
{
  sub_23C11EE58();
  return sub_23C139350();
}

uint64_t sub_23C11E6A4()
{
  sub_23C11EE58();
  return sub_23C13935C();
}

uint64_t sub_23C11E6D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C11F14C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C11E6F8()
{
  sub_23C11EF24();
  return sub_23C139350();
}

uint64_t sub_23C11E720()
{
  sub_23C11EF24();
  return sub_23C13935C();
}

uint64_t sub_23C11E748()
{
  char *v0;

  return sub_23C11E618(*v0);
}

uint64_t sub_23C11E750@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C11F1DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C11E774()
{
  sub_23C11EEE0();
  return sub_23C139350();
}

uint64_t sub_23C11E79C()
{
  sub_23C11EEE0();
  return sub_23C13935C();
}

uint64_t sub_23C11E7C4()
{
  sub_23C11EE9C();
  return sub_23C139350();
}

uint64_t sub_23C11E7EC()
{
  sub_23C11EE9C();
  return sub_23C13935C();
}

uint64_t sub_23C11E814()
{
  sub_23C11EF68();
  return sub_23C139350();
}

uint64_t sub_23C11E83C()
{
  sub_23C11EF68();
  return sub_23C13935C();
}

uint64_t LoadState.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  int v42;
  char v43;

  v36 = a2;
  v42 = a5;
  v37 = a3;
  v38 = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22940);
  v29 = *(_QWORD *)(v6 - 8);
  v30 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v28 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22948);
  v33 = *(_QWORD *)(v8 - 8);
  v34 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v32 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22950);
  v31 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22958);
  v26 = *(_QWORD *)(v13 - 8);
  v27 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22960);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C11EE58();
  sub_23C139338();
  if ((_BYTE)v42)
  {
    v20 = v38;
    if (v42 == 1)
    {
      LOBYTE(v39) = 2;
      sub_23C11EEE0();
      v21 = v32;
      sub_23C139218();
      LOBYTE(v39) = 0;
      v23 = v34;
      v22 = v35;
      sub_23C139248();
      if (!v22)
      {
        v39 = v20;
        v43 = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256B21AE0);
        sub_23C1200BC(&qword_256B21AE8, (uint64_t (*)(void))sub_23C103E5C, MEMORY[0x24BEE12A0]);
        sub_23C139278();
      }
      (*(void (**)(char *, uint64_t))(v33 + 8))(v21, v23);
    }
    else if (v38 | v37 | v36)
    {
      LOBYTE(v39) = 3;
      sub_23C11EE9C();
      v24 = v28;
      sub_23C139218();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v24, v30);
    }
    else
    {
      LOBYTE(v39) = 0;
      sub_23C11EF68();
      sub_23C139218();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v15, v27);
    }
  }
  else
  {
    LOBYTE(v39) = 1;
    sub_23C11EF24();
    sub_23C139218();
    v39 = v36;
    v40 = v37;
    v41 = v38;
    sub_23C109A74();
    sub_23C139278();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v10);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

uint64_t LoadState.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  result = sub_23C11F2B8(a1);
  if (v1)
    return v3;
  return result;
}

uint64_t sub_23C11EC68@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  char v7;

  result = sub_23C11F2B8(a1);
  if (!v2)
  {
    *(_QWORD *)a2 = result;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v6;
    *(_BYTE *)(a2 + 24) = v7;
  }
  return result;
}

uint64_t sub_23C11EC98(_QWORD *a1)
{
  uint64_t v1;

  return LoadState.encode(to:)(a1, *(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(unsigned __int8 *)(v1 + 24));
}

uint64_t sub_23C11ECB8(uint64_t a1, uint64_t a2)
{
  return _s13FitnessForYou9LoadStateO2eeoiySbAC_ACtFZ_0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24), *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), *(_BYTE *)(a2 + 24));
}

uint64_t _s13FitnessForYou9LoadStateO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  char v10;
  uint64_t result;

  if (!a4)
  {
    if (a8)
      return 0;
    if ((_BYTE)a3)
    {
      if (a3 == 1)
      {
        if (a7 != 1)
          return 0;
        if (a1 == 4)
        {
          if (a5 != 4)
            return 0;
        }
        else if (a5 == 4 || a5 != a1)
        {
          return 0;
        }
      }
      else if (a1 | a2)
      {
        if (a7 != 2 || a5 != 1 || a6)
          return 0;
      }
      else if (a7 != 2 || a6 | a5)
      {
        return 0;
      }
    }
    else if ((_BYTE)a7 || (a1 != a5 || a2 != a6) && (sub_23C139284() & 1) == 0)
    {
      return 0;
    }
    return 1;
  }
  if (a4 != 1)
  {
    if (a3 | a2 | a1)
    {
      if (a8 != 2 || a5 != 1 || a7 | a6)
        return 0;
    }
    else if (a8 != 2 || a6 | a5 | a7)
    {
      return 0;
    }
    return 1;
  }
  if (a8 != 1)
    return 0;
  if (a1 == a5 && a2 == a6)
    return sub_23C12BA24(a3, a7);
  v10 = sub_23C139284();
  result = 0;
  if ((v10 & 1) != 0)
    return sub_23C12BA24(a3, a7);
  return result;
}

unint64_t sub_23C11EE58()
{
  unint64_t result;

  result = qword_256B22968;
  if (!qword_256B22968)
  {
    result = MEMORY[0x2426179DC](&unk_23C13EF7C, &type metadata for LoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22968);
  }
  return result;
}

unint64_t sub_23C11EE9C()
{
  unint64_t result;

  result = qword_256B22970;
  if (!qword_256B22970)
  {
    result = MEMORY[0x2426179DC](&unk_23C13EF2C, &type metadata for LoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22970);
  }
  return result;
}

unint64_t sub_23C11EEE0()
{
  unint64_t result;

  result = qword_256B22978;
  if (!qword_256B22978)
  {
    result = MEMORY[0x2426179DC](&unk_23C13EEDC, &type metadata for LoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22978);
  }
  return result;
}

unint64_t sub_23C11EF24()
{
  unint64_t result;

  result = qword_256B22980;
  if (!qword_256B22980)
  {
    result = MEMORY[0x2426179DC](&unk_23C13EE8C, &type metadata for LoadState.FailedToLoadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22980);
  }
  return result;
}

unint64_t sub_23C11EF68()
{
  unint64_t result;

  result = qword_256B22988;
  if (!qword_256B22988)
  {
    result = MEMORY[0x2426179DC](&unk_23C13EE3C, &type metadata for LoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22988);
  }
  return result;
}

uint64_t sub_23C11EFAC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1701602409 && a2 == 0xE400000000000000;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F5464656C696166 && a2 == 0xEC00000064616F4CLL || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64656863746566 && a2 == 0xE700000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x676E696863746566 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23C11F14C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6E6F73616572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23C139284();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C11F1C8()
{
  return 0x6E6F73616572;
}

uint64_t sub_23C11F1DC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x64496F636572 && a2 == 0xE600000000000000;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000023C1405D0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C11F2B8(_QWORD *a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;

  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B229F8);
  v23 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v25 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22A00);
  v24 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v27 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22A08);
  v21 = *(_QWORD *)(v4 - 8);
  v22 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v26 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22A10);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22A18);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v29 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_23C11EE58();
  v13 = v30;
  sub_23C13932C();
  if (!v13)
  {
    v19[0] = v7;
    v19[1] = v6;
    v30 = v9;
    v14 = sub_23C13920C();
    if (*(_QWORD *)(v14 + 16) == 1)
      __asm { BR              X10 }
    v15 = sub_23C139110();
    swift_allocError();
    v17 = v16;
    v6 = (uint64_t)v16 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B21A98) + 48);
    *v17 = &type metadata for LoadState;
    sub_23C1391A0();
    sub_23C139104();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v17, *MEMORY[0x24BEE26D0], v15);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v8);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  return v6;
}

uint64_t destroy for LoadState(uint64_t a1)
{
  return sub_23C11B438(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t initializeWithCopy for LoadState(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23C11B380(*(_QWORD *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for LoadState(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23C11B380(*(_QWORD *)a2, v4, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_23C11B438(v7, v8, v9, v10);
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

uint64_t assignWithTake for LoadState(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_23C11B438(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for LoadState(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LoadState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_23C11FA7C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 1u)
    return *(unsigned __int8 *)(a1 + 24);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_23C11FA94(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = a2 - 2;
  if (a2 >= 2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    LOBYTE(a2) = 2;
    *(_QWORD *)result = v2;
  }
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LoadState()
{
  return &type metadata for LoadState;
}

uint64_t storeEnumTagSinglePayload for LoadState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C11FB0C + 4 * byte_23C13EA59[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C11FB40 + 4 * byte_23C13EA54[v4]))();
}

uint64_t sub_23C11FB40(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C11FB48(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C11FB50);
  return result;
}

uint64_t sub_23C11FB5C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C11FB64);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C11FB68(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C11FB70(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LoadState.CodingKeys()
{
  return &type metadata for LoadState.CodingKeys;
}

ValueMetadata *type metadata accessor for LoadState.IdleCodingKeys()
{
  return &type metadata for LoadState.IdleCodingKeys;
}

uint64_t storeEnumTagSinglePayload for LoadState.FailedToLoadCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C11FBDC + 4 * byte_23C13EA5E[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C11FBFC + 4 * byte_23C13EA63[v4]))();
}

_BYTE *sub_23C11FBDC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C11FBFC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C11FC04(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C11FC0C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C11FC14(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C11FC1C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LoadState.FailedToLoadCodingKeys()
{
  return &type metadata for LoadState.FailedToLoadCodingKeys;
}

uint64_t storeEnumTagSinglePayload for LoadState.FetchedCodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C11FC84 + 4 * byte_23C13EA6D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C11FCB8 + 4 * byte_23C13EA68[v4]))();
}

uint64_t sub_23C11FCB8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C11FCC0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C11FCC8);
  return result;
}

uint64_t sub_23C11FCD4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C11FCDCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C11FCE0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C11FCE8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LoadState.FetchedCodingKeys()
{
  return &type metadata for LoadState.FetchedCodingKeys;
}

ValueMetadata *type metadata accessor for LoadState.FetchingCodingKeys()
{
  return &type metadata for LoadState.FetchingCodingKeys;
}

unint64_t sub_23C11FD18()
{
  unint64_t result;

  result = qword_256B22990;
  if (!qword_256B22990)
  {
    result = MEMORY[0x2426179DC](&unk_23C13EC54, &type metadata for LoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22990);
  }
  return result;
}

unint64_t sub_23C11FD60()
{
  unint64_t result;

  result = qword_256B22998;
  if (!qword_256B22998)
  {
    result = MEMORY[0x2426179DC](&unk_23C13ED0C, &type metadata for LoadState.FailedToLoadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22998);
  }
  return result;
}

unint64_t sub_23C11FDA8()
{
  unint64_t result;

  result = qword_256B229A0;
  if (!qword_256B229A0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13EE14, &type metadata for LoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B229A0);
  }
  return result;
}

unint64_t sub_23C11FDF0()
{
  unint64_t result;

  result = qword_256B229A8;
  if (!qword_256B229A8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13ED34, &type metadata for LoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B229A8);
  }
  return result;
}

unint64_t sub_23C11FE38()
{
  unint64_t result;

  result = qword_256B229B0;
  if (!qword_256B229B0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13ED5C, &type metadata for LoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B229B0);
  }
  return result;
}

unint64_t sub_23C11FE80()
{
  unint64_t result;

  result = qword_256B229B8;
  if (!qword_256B229B8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13EC7C, &type metadata for LoadState.FailedToLoadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B229B8);
  }
  return result;
}

unint64_t sub_23C11FEC8()
{
  unint64_t result;

  result = qword_256B229C0;
  if (!qword_256B229C0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13ECA4, &type metadata for LoadState.FailedToLoadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B229C0);
  }
  return result;
}

unint64_t sub_23C11FF10()
{
  unint64_t result;

  result = qword_256B229C8;
  if (!qword_256B229C8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13EBC4, &type metadata for LoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B229C8);
  }
  return result;
}

unint64_t sub_23C11FF58()
{
  unint64_t result;

  result = qword_256B229D0;
  if (!qword_256B229D0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13EBEC, &type metadata for LoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B229D0);
  }
  return result;
}

unint64_t sub_23C11FFA0()
{
  unint64_t result;

  result = qword_256B229D8;
  if (!qword_256B229D8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13EB74, &type metadata for LoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B229D8);
  }
  return result;
}

unint64_t sub_23C11FFE8()
{
  unint64_t result;

  result = qword_256B229E0;
  if (!qword_256B229E0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13EB9C, &type metadata for LoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B229E0);
  }
  return result;
}

unint64_t sub_23C120030()
{
  unint64_t result;

  result = qword_256B229E8;
  if (!qword_256B229E8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13ED84, &type metadata for LoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B229E8);
  }
  return result;
}

unint64_t sub_23C120078()
{
  unint64_t result;

  result = qword_256B229F0;
  if (!qword_256B229F0)
  {
    result = MEMORY[0x2426179DC](&unk_23C13EDAC, &type metadata for LoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B229F0);
  }
  return result;
}

uint64_t sub_23C1200BC(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B21AE0);
    v8 = a2();
    result = MEMORY[0x2426179DC](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t AssetBundle.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t AssetBundle.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

id sub_23C12013C()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for AssetBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_256B22A20 = (uint64_t)result;
  return result;
}

id static NSBundle.asset.getter()
{
  if (qword_256B21880 != -1)
    swift_once();
  swift_beginAccess();
  return (id)qword_256B22A20;
}

void static NSBundle.asset.setter(uint64_t a1)
{
  void *v2;

  if (qword_256B21880 != -1)
    swift_once();
  swift_beginAccess();
  v2 = (void *)qword_256B22A20;
  qword_256B22A20 = a1;

}

uint64_t (*static NSBundle.asset.modify())()
{
  if (qword_256B21880 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t type metadata accessor for AssetBundle()
{
  return objc_opt_self();
}

uint64_t method lookup function for AssetBundle()
{
  return swift_lookUpClassMethod();
}

__n128 Layout.contentMargins.getter@<Q0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)v1;
  v3 = *(_OWORD *)(v1 + 16);
  *a1 = *(_OWORD *)v1;
  a1[1] = v3;
  return result;
}

double Layout.imageSequenceViewSize.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

_OWORD *Layout.init(contentMargins:imageSequenceViewSize:)@<X0>(_OWORD *result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  __int128 v4;

  v4 = result[1];
  *(_OWORD *)a2 = *result;
  *(_OWORD *)(a2 + 16) = v4;
  *(double *)(a2 + 32) = a3;
  *(double *)(a2 + 40) = a4;
  return result;
}

uint64_t sub_23C120330(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000015;
  else
    return 0x4D746E65746E6F63;
}

uint64_t sub_23C120378()
{
  char *v0;

  return sub_23C120330(*v0);
}

uint64_t sub_23C120380@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C120AB0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C1203A4()
{
  sub_23C120798();
  return sub_23C139350();
}

uint64_t sub_23C1203CC()
{
  sub_23C120798();
  return sub_23C13935C();
}

uint64_t Layout.encode(to:)(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  char v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22AC0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *v1;
  v8 = *((_QWORD *)v1 + 2);
  v9 = *((_QWORD *)v1 + 3);
  v10 = *((_QWORD *)v1 + 4);
  v11 = *((_QWORD *)v1 + 5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C120798();
  sub_23C139338();
  v15 = v13;
  v16 = v8;
  v17 = v9;
  v14 = 0;
  sub_23C1207DC();
  sub_23C139278();
  if (!v2)
  {
    *(_QWORD *)&v15 = v10;
    *((_QWORD *)&v15 + 1) = v11;
    v14 = 1;
    type metadata accessor for CGSize();
    sub_23C120864(&qword_256B22AD8, MEMORY[0x24BDBD848]);
    sub_23C139278();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t Layout.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22AE0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C120798();
  sub_23C13932C();
  if (!v2)
  {
    v17 = 0;
    sub_23C120820();
    sub_23C139200();
    v9 = v14;
    v10 = v15;
    v11 = v16;
    type metadata accessor for CGSize();
    v17 = 1;
    sub_23C120864(&qword_256B22AF0, MEMORY[0x24BDBD860]);
    sub_23C139200();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v12 = v14;
    *(_OWORD *)a2 = v9;
    *(_QWORD *)(a2 + 16) = v10;
    *(_QWORD *)(a2 + 24) = v11;
    *(_OWORD *)(a2 + 32) = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23C12071C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return Layout.init(from:)(a1, a2);
}

uint64_t sub_23C120730(_QWORD *a1)
{
  return Layout.encode(to:)(a1);
}

BOOL _s13FitnessForYou6LayoutV2eeoiySbAC_ACtFZ_0(float64x2_t *a1, float64x2_t *a2)
{
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*a1, *a2), (int32x4_t)vceqq_f64(a1[1], a2[1]))), 0xFuLL))) & 1) == 0)return 0;
  if (a1[2].f64[1] == a2[2].f64[1])
    return a1[2].f64[0] == a2[2].f64[0];
  return 0;
}

unint64_t sub_23C120798()
{
  unint64_t result;

  result = qword_256B22AC8;
  if (!qword_256B22AC8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13F190, &type metadata for Layout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22AC8);
  }
  return result;
}

unint64_t sub_23C1207DC()
{
  unint64_t result;

  result = qword_256B22AD0;
  if (!qword_256B22AD0)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for ContentMargins, &type metadata for ContentMargins);
    atomic_store(result, (unint64_t *)&qword_256B22AD0);
  }
  return result;
}

unint64_t sub_23C120820()
{
  unint64_t result;

  result = qword_256B22AE8;
  if (!qword_256B22AE8)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for ContentMargins, &type metadata for ContentMargins);
    atomic_store(result, (unint64_t *)&qword_256B22AE8);
  }
  return result;
}

uint64_t sub_23C120864(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CGSize();
    result = MEMORY[0x2426179DC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Layout(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Layout(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

ValueMetadata *type metadata accessor for Layout()
{
  return &type metadata for Layout;
}

uint64_t storeEnumTagSinglePayload for Layout.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C120958 + 4 * byte_23C13F03D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C12098C + 4 * byte_23C13F038[v4]))();
}

uint64_t sub_23C12098C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C120994(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C12099CLL);
  return result;
}

uint64_t sub_23C1209A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1209B0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C1209B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1209BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Layout.CodingKeys()
{
  return &type metadata for Layout.CodingKeys;
}

unint64_t sub_23C1209DC()
{
  unint64_t result;

  result = qword_256B22AF8;
  if (!qword_256B22AF8)
  {
    result = MEMORY[0x2426179DC](&unk_23C13F168, &type metadata for Layout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22AF8);
  }
  return result;
}

unint64_t sub_23C120A24()
{
  unint64_t result;

  result = qword_256B22B00;
  if (!qword_256B22B00)
  {
    result = MEMORY[0x2426179DC](&unk_23C13F0D8, &type metadata for Layout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22B00);
  }
  return result;
}

unint64_t sub_23C120A6C()
{
  unint64_t result;

  result = qword_256B22B08;
  if (!qword_256B22B08)
  {
    result = MEMORY[0x2426179DC](&unk_23C13F100, &type metadata for Layout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22B08);
  }
  return result;
}

uint64_t sub_23C120AB0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x4D746E65746E6F63 && a2 == 0xEE00736E69677261;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000023C140830)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

ValueMetadata *type metadata accessor for AwardEnvironmentUpdatedEvent()
{
  return &type metadata for AwardEnvironmentUpdatedEvent;
}

BOOL static SubscriptionState.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23C120BD0(char a1)
{
  return *(_QWORD *)&aUnknown_1[8 * a1];
}

uint64_t sub_23C120BF0()
{
  char *v0;

  return sub_23C120BD0(*v0);
}

uint64_t sub_23C120BF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C12118C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C120C1C()
{
  sub_23C120FC0();
  return sub_23C139350();
}

uint64_t sub_23C120C44()
{
  sub_23C120FC0();
  return sub_23C13935C();
}

uint64_t sub_23C120C6C()
{
  sub_23C121048();
  return sub_23C139350();
}

uint64_t sub_23C120C94()
{
  sub_23C121048();
  return sub_23C13935C();
}

uint64_t sub_23C120CBC()
{
  sub_23C12108C();
  return sub_23C139350();
}

uint64_t sub_23C120CE4()
{
  sub_23C12108C();
  return sub_23C13935C();
}

uint64_t sub_23C120D0C()
{
  sub_23C121004();
  return sub_23C139350();
}

uint64_t sub_23C120D34()
{
  sub_23C121004();
  return sub_23C13935C();
}

uint64_t SubscriptionState.encode(to:)(_QWORD *a1, int a2)
{
  uint64_t v3;
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
  char *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  char v25;
  char v26;
  char v27;

  v24 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22B10);
  v21 = *(_QWORD *)(v3 - 8);
  v22 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v20 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22B18);
  v18 = *(_QWORD *)(v5 - 8);
  v19 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22B20);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22B28);
  v23 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C120FC0();
  sub_23C139338();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      v26 = 1;
      sub_23C121048();
      sub_23C139218();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v19);
    }
    else
    {
      v27 = 2;
      sub_23C121004();
      v15 = v20;
      sub_23C139218();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v15, v22);
    }
  }
  else
  {
    v25 = 0;
    sub_23C12108C();
    sub_23C139218();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v14, v12);
}

unint64_t sub_23C120FC0()
{
  unint64_t result;

  result = qword_256B22B30;
  if (!qword_256B22B30)
  {
    result = MEMORY[0x2426179DC](&unk_23C13F5E0, &type metadata for SubscriptionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22B30);
  }
  return result;
}

unint64_t sub_23C121004()
{
  unint64_t result;

  result = qword_256B22B38;
  if (!qword_256B22B38)
  {
    result = MEMORY[0x2426179DC](&unk_23C13F590, &type metadata for SubscriptionState.UnsubscribedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22B38);
  }
  return result;
}

unint64_t sub_23C121048()
{
  unint64_t result;

  result = qword_256B22B40;
  if (!qword_256B22B40)
  {
    result = MEMORY[0x2426179DC](&unk_23C13F540, &type metadata for SubscriptionState.SubscribedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22B40);
  }
  return result;
}

unint64_t sub_23C12108C()
{
  unint64_t result;

  result = qword_256B22B48;
  if (!qword_256B22B48)
  {
    result = MEMORY[0x2426179DC](&unk_23C13F4F0, &type metadata for SubscriptionState.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22B48);
  }
  return result;
}

_QWORD *SubscriptionState.init(from:)(_QWORD *a1)
{
  return sub_23C1212E8(a1);
}

_QWORD *sub_23C1210E4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_23C1212E8(a1);
  if (!v2)
    *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_23C12110C(_QWORD *a1)
{
  unsigned __int8 *v1;

  return SubscriptionState.encode(to:)(a1, *v1);
}

uint64_t SubscriptionState.hash(into:)()
{
  return sub_23C1392FC();
}

uint64_t SubscriptionState.hashValue.getter()
{
  sub_23C1392F0();
  sub_23C1392FC();
  return sub_23C139320();
}

uint64_t sub_23C12118C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6269726373627573 && a2 == 0xEA00000000006465 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7263736275736E75 && a2 == 0xEC00000064656269)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

_QWORD *sub_23C1212E8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  _QWORD *v30;
  char v31;
  char v32;
  char v33;

  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22BA0);
  v25 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22BA8);
  v23 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22BB0);
  v4 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22BB8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (uint64_t *)((char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C120FC0();
  v11 = (uint64_t)v30;
  sub_23C13932C();
  if (v11)
    goto LABEL_7;
  v21 = v4;
  v22 = v8;
  v12 = v29;
  v30 = a1;
  v13 = v10;
  v14 = sub_23C13920C();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v18 = sub_23C139110();
    swift_allocError();
    v10 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B21A98);
    *v10 = &type metadata for SubscriptionState;
    sub_23C1391A0();
    sub_23C139104();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v10, *MEMORY[0x24BEE26D0], v18);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v22 + 8))(v13, v7);
    a1 = v30;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v10;
  }
  v10 = (_QWORD *)*(unsigned __int8 *)(v14 + 32);
  if (*(_BYTE *)(v14 + 32))
  {
    if ((_DWORD)v10 == 1)
    {
      v32 = 1;
      sub_23C121048();
      v16 = v28;
      sub_23C139194();
      v17 = v22;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v16, v26);
    }
    else
    {
      v33 = 2;
      sub_23C121004();
      sub_23C139194();
      v17 = v22;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v27);
    }
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v17 + 8))(v13, v15);
  }
  else
  {
    v31 = 0;
    sub_23C12108C();
    sub_23C139194();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v24);
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v22 + 8))(v13, v7);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return v10;
}

unint64_t sub_23C1216C4()
{
  unint64_t result;

  result = qword_256B22B50;
  if (!qword_256B22B50)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for SubscriptionState, &type metadata for SubscriptionState);
    atomic_store(result, (unint64_t *)&qword_256B22B50);
  }
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionState()
{
  return &type metadata for SubscriptionState;
}

uint64_t _s13FitnessForYou17SubscriptionStateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C121768 + 4 * byte_23C13F205[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C12179C + 4 * asc_23C13F200[v4]))();
}

uint64_t sub_23C12179C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1217A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1217ACLL);
  return result;
}

uint64_t sub_23C1217B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1217C0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C1217C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1217CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionState.CodingKeys()
{
  return &type metadata for SubscriptionState.CodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionState.UnknownCodingKeys()
{
  return &type metadata for SubscriptionState.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionState.SubscribedCodingKeys()
{
  return &type metadata for SubscriptionState.SubscribedCodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionState.UnsubscribedCodingKeys()
{
  return &type metadata for SubscriptionState.UnsubscribedCodingKeys;
}

unint64_t sub_23C12181C()
{
  unint64_t result;

  result = qword_256B22B58;
  if (!qword_256B22B58)
  {
    result = MEMORY[0x2426179DC](&unk_23C13F4C8, &type metadata for SubscriptionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22B58);
  }
  return result;
}

unint64_t sub_23C121864()
{
  unint64_t result;

  result = qword_256B22B60;
  if (!qword_256B22B60)
  {
    result = MEMORY[0x2426179DC](&unk_23C13F3E8, &type metadata for SubscriptionState.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22B60);
  }
  return result;
}

unint64_t sub_23C1218AC()
{
  unint64_t result;

  result = qword_256B22B68;
  if (!qword_256B22B68)
  {
    result = MEMORY[0x2426179DC](&unk_23C13F410, &type metadata for SubscriptionState.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22B68);
  }
  return result;
}

unint64_t sub_23C1218F4()
{
  unint64_t result;

  result = qword_256B22B70;
  if (!qword_256B22B70)
  {
    result = MEMORY[0x2426179DC](&unk_23C13F398, &type metadata for SubscriptionState.SubscribedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22B70);
  }
  return result;
}

unint64_t sub_23C12193C()
{
  unint64_t result;

  result = qword_256B22B78;
  if (!qword_256B22B78)
  {
    result = MEMORY[0x2426179DC](&unk_23C13F3C0, &type metadata for SubscriptionState.SubscribedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22B78);
  }
  return result;
}

unint64_t sub_23C121984()
{
  unint64_t result;

  result = qword_256B22B80;
  if (!qword_256B22B80)
  {
    result = MEMORY[0x2426179DC](&unk_23C13F348, &type metadata for SubscriptionState.UnsubscribedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22B80);
  }
  return result;
}

unint64_t sub_23C1219CC()
{
  unint64_t result;

  result = qword_256B22B88;
  if (!qword_256B22B88)
  {
    result = MEMORY[0x2426179DC](&unk_23C13F370, &type metadata for SubscriptionState.UnsubscribedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22B88);
  }
  return result;
}

unint64_t sub_23C121A14()
{
  unint64_t result;

  result = qword_256B22B90;
  if (!qword_256B22B90)
  {
    result = MEMORY[0x2426179DC](&unk_23C13F438, &type metadata for SubscriptionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22B90);
  }
  return result;
}

unint64_t sub_23C121A5C()
{
  unint64_t result;

  result = qword_256B22B98;
  if (!qword_256B22B98)
  {
    result = MEMORY[0x2426179DC](&unk_23C13F460, &type metadata for SubscriptionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22B98);
  }
  return result;
}

uint64_t sub_23C121AA0(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t TupleTypeMetadata;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v4 = a1;
  v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    TupleTypeMetadata = *v5;
    MEMORY[0x24BDAC7A8](a1);
    v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
LABEL_12:
    v22 = 32;
    v23 = a2;
    do
    {
      if (a2 == 1)
        v24 = 0;
      else
        v24 = *(_DWORD *)(TupleTypeMetadata + v22);
      v26 = *v5++;
      v25 = v26;
      v27 = *v4++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(&v8[v24], v27);
      v22 += 16;
      --v23;
    }
    while (v23);
    return sub_23C138F6C();
  }
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v11 = 0;
    if (a2 < 4)
      goto LABEL_9;
    if ((unint64_t)(v10 - (char *)v5) < 0x20)
      goto LABEL_9;
    v11 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    v12 = (__int128 *)(v5 + 2);
    v13 = v10 + 16;
    v14 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 4;
    }
    while (v14);
    if (v11 != a2)
    {
LABEL_9:
      v16 = a2 - v11;
      v17 = v11;
      v18 = &v10[8 * v11];
      v19 = &v5[v17];
      do
      {
        v20 = *v19++;
        *(_QWORD *)v18 = v20;
        v18 += 8;
        --v16;
      }
      while (v16);
    }
  }
  TupleTypeMetadata = swift_getTupleTypeMetadata();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata);
  v8 = (char *)&v29 - v21;
  if (a2)
    goto LABEL_12;
  return sub_23C138F6C();
}

uint64_t sub_23C121C54()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22CD0);
  sub_23C107448(&qword_256B22CD8, &qword_256B22CD0, MEMORY[0x24BE2B5E8]);
  return sub_23C138C6C();
}

uint64_t sub_23C121CC4()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DA0);
  sub_23C138EDC();
  return v1;
}

__n128 ForYouView.init(store:canvasViewBuilder:marketingForYouViewBuilder:imageSequenceViewBuilder:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v14;
  __n128 result;
  __n128 v20;
  uint64_t v21;

  sub_23C138F30();
  sub_23C138ED0();
  sub_23C138ED0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DF8);
  sub_23C138ED0();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a1;
  *(_QWORD *)(v14 + 24) = a2;
  *(_QWORD *)a9 = sub_23C1059B4;
  *(_QWORD *)(a9 + 8) = v14;
  *(_BYTE *)(a9 + 16) = 0;
  *(_QWORD *)(a9 + 24) = a3;
  *(_QWORD *)(a9 + 32) = a4;
  *(_QWORD *)(a9 + 40) = a5;
  *(_QWORD *)(a9 + 48) = a6;
  *(_QWORD *)(a9 + 56) = a7;
  *(_QWORD *)(a9 + 64) = a8;
  result = v20;
  *(__n128 *)(a9 + 72) = v20;
  *(_QWORD *)(a9 + 88) = v21;
  *(_BYTE *)(a9 + 96) = v20.n128_u8[0];
  *(_QWORD *)(a9 + 104) = v20.n128_u64[1];
  *(__n128 *)(a9 + 112) = v20;
  return result;
}

uint64_t sub_23C121E3C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C121E60()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22CF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22BF8);
  sub_23C107448(&qword_256B22CF8, &qword_256B22CF0, MEMORY[0x24BDF5428]);
  sub_23C127C5C();
  return sub_23C138D5C();
}

void sub_23C121F88()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v0 = sub_23C138BDC();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_23C138FD8();
  MEMORY[0x24BDAC7A8](v1);
  sub_23C138FCC();
  if (qword_256B21878 != -1)
    swift_once();
  v2 = (id)qword_256B2FCE8;
  type metadata accessor for ForYouView();
}

uint64_t sub_23C1222C4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22D00);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22D08);
  sub_23C12A8FC();
  sub_23C12AAD4();
  return sub_23C138D5C();
}

void sub_23C1223D4(char a1@<W0>, uint64_t a2@<X8>)
{
  __int128 *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v19 = a2;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22D80);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22D88);
  MEMORY[0x24BDAC7A8](v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22D90);
  MEMORY[0x24BDAC7A8](v6);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22D30);
  MEMORY[0x24BDAC7A8](v14);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22D20);
  MEMORY[0x24BDAC7A8](v17);
  v15 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22D40);
  MEMORY[0x24BDAC7A8](v8);
  v9 = v2[5];
  v24 = v2[4];
  v25 = v9;
  v10 = v2[7];
  v26 = v2[6];
  v27 = v10;
  v11 = v2[1];
  v20 = *v2;
  v21 = v11;
  v12 = v2[3];
  v22 = v2[2];
  v23 = v12;
  __asm { BR              X10 }
}

uint64_t sub_23C1225B8(uint64_t a1)
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

  MEMORY[0x24BDAC7A8](a1);
  v8 = v7;
  *(_QWORD *)(v6 - 288) = v7;
  sub_23C138EC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v3, v4, v2);
  swift_storeEnumTagMultiPayload();
  sub_23C107448(&qword_256B22D38, &qword_256B22D40, MEMORY[0x24BDF41A8]);
  sub_23C138D38();
  sub_23C106BC4(v1, v5, &qword_256B22D30);
  swift_storeEnumTagMultiPayload();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22D50);
  sub_23C12AA04();
  sub_23C12AA80(&qword_256B22D48, &qword_256B22D50, MEMORY[0x24BDF5138]);
  v9 = *(_QWORD *)(v6 - 272);
  sub_23C138D38();
  sub_23C106ED8(v1, &qword_256B22D30);
  sub_23C106BC4(v9, *(_QWORD *)(v6 - 248), &qword_256B22D20);
  swift_storeEnumTagMultiPayload();
  sub_23C12A980();
  sub_23C138D38();
  sub_23C106ED8(v9, &qword_256B22D20);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 288) + 8))(v4, v2);
}

void sub_23C122A80()
{
  type metadata accessor for ForYouView();
}

double sub_23C122AD4()
{
  char v0;
  uint64_t v1;
  double result;
  __int128 v3;
  __int128 v4;
  __int16 v5;
  char v6;

  sub_23C122B14(v0);
  result = *(double *)&v3;
  *(_OWORD *)v1 = v3;
  *(_OWORD *)(v1 + 16) = v4;
  *(_WORD *)(v1 + 32) = v5;
  *(_BYTE *)(v1 + 34) = v6;
  return result;
}

void sub_23C122B14(char a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_23C138BDC();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_23C138FD8();
  MEMORY[0x24BDAC7A8](v3);
  __asm { BR              X10 }
}

__n128 sub_23C122BC8()
{
  uint64_t v0;
  _OWORD *v1;
  _OWORD *v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 v19;
  __int128 v20;
  __int16 v21;
  __int16 v22;
  __int128 v23;
  __n128 result;
  __int128 v25;
  __int16 v26;
  char v27;

  sub_23C138FCC();
  if (qword_256B21878 != -1)
    swift_once();
  v4 = (void *)qword_256B2FCE8;
  v5 = v1[4];
  v6 = v1[6];
  v7 = v1[7];
  v2[5] = v1[5];
  v2[6] = v6;
  v2[7] = v7;
  v8 = v1[1];
  *(_OWORD *)(v3 - 224) = *v1;
  *(_OWORD *)(v3 - 208) = v8;
  v9 = v1[3];
  *(_OWORD *)(v3 - 192) = v1[2];
  *(_OWORD *)(v3 - 176) = v9;
  *(_OWORD *)(v3 - 160) = v5;
  v10 = v4;
  sub_23C121C54();
  swift_getKeyPath();
  sub_23C138F9C();
  swift_release();
  swift_release();
  *(_QWORD *)(v3 - 224) = sub_23C138FFC();
  *(_QWORD *)(v3 - 216) = v11;
  sub_23C1074D8();
  v12 = sub_23C138DD4();
  v14 = v13;
  *(_QWORD *)(v3 - 272) = v12;
  *(_QWORD *)(v3 - 264) = v13;
  v16 = v15 & 1;
  *(_QWORD *)(v3 - 256) = v16;
  *(_QWORD *)(v3 - 248) = v17;
  *(_BYTE *)(v3 - 240) = 0;
  sub_23C10660C(v12, v13, v15 & 1);
  swift_bridgeObjectRetain();
  v18 = MEMORY[0x24BDF1F80];
  sub_23C138D38();
  v19 = *(_BYTE *)(v3 - 192);
  v20 = *(_OWORD *)(v3 - 208);
  *(_OWORD *)(v3 - 272) = *(_OWORD *)(v3 - 224);
  *(_OWORD *)(v3 - 256) = v20;
  *(_WORD *)(v3 - 240) = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22D78);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22D50);
  sub_23C12AA80(&qword_256B22D70, &qword_256B22D78, v18);
  sub_23C12AA80(&qword_256B22D48, &qword_256B22D50, MEMORY[0x24BDF5138]);
  sub_23C138D38();
  v21 = *(unsigned __int8 *)(v3 - 192);
  if (*(_BYTE *)(v3 - 191))
    v22 = 256;
  else
    v22 = 0;
  v23 = *(_OWORD *)(v3 - 208);
  *(_OWORD *)(v3 - 272) = *(_OWORD *)(v3 - 224);
  *(_OWORD *)(v3 - 256) = v23;
  *(_WORD *)(v3 - 240) = v22 | v21;
  *(_BYTE *)(v3 - 238) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22D68);
  sub_23C12AB40();
  sub_23C138D38();
  sub_23C10661C(v12, v14, v16);
  swift_bridgeObjectRelease();
  result = *(__n128 *)(v3 - 224);
  v25 = *(_OWORD *)(v3 - 208);
  v26 = *(_WORD *)(v3 - 192);
  v27 = *(_BYTE *)(v3 - 190);
  *(__n128 *)v0 = result;
  *(_OWORD *)(v0 + 16) = v25;
  *(_WORD *)(v0 + 32) = v26;
  *(_BYTE *)(v0 + 34) = v27;
  return result;
}

uint64_t sub_23C123214@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  __int128 *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  void (*v36)(char *, uint64_t);
  _QWORD v38[2];
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __int128 *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 *v63;
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;

  v41 = a1[4];
  v42 = a2;
  v39 = a1;
  v4 = sub_23C138CA8();
  sub_23C138CA8();
  sub_23C138CA8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BD0);
  sub_23C138CA8();
  sub_23C138CA8();
  sub_23C138CA8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BD8);
  sub_23C138D44();
  sub_23C138EAC();
  v38[1] = sub_23C138CA8();
  v5 = sub_23C138CA8();
  v6 = sub_23C138CA8();
  v7 = sub_23C138CA8();
  v8 = sub_23C138CA8();
  v40 = a1[7];
  v69[0] = v40;
  v69[1] = MEMORY[0x24BDF0910];
  v9 = MEMORY[0x24BDED308];
  v10 = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v4, v69);
  v11 = MEMORY[0x24BDEBEE0];
  v68[0] = v10;
  v68[1] = MEMORY[0x24BDEBEE0];
  v67[0] = MEMORY[0x2426179DC](v9, v5, v68);
  v67[1] = sub_23C107448(&qword_256B22BE0, &qword_256B22BD0, MEMORY[0x24BDEEC10]);
  v66[0] = MEMORY[0x2426179DC](v9, v6, v67);
  v66[1] = MEMORY[0x24BDEC438];
  v65[0] = MEMORY[0x2426179DC](v9, v7, v66);
  v65[1] = v11;
  v12 = MEMORY[0x2426179DC](v9, v8, v65);
  v13 = sub_23C127BB4();
  v14 = MEMORY[0x24BEE50B0];
  *(_QWORD *)&v70 = v8;
  *((_QWORD *)&v70 + 1) = MEMORY[0x24BEE50B0];
  *(_QWORD *)&v71 = v12;
  *((_QWORD *)&v71 + 1) = v13;
  MEMORY[0x242617988](255, &v70, MEMORY[0x24BDF38E8], 0);
  v15 = sub_23C138D44();
  *(_QWORD *)&v70 = v8;
  *((_QWORD *)&v70 + 1) = v14;
  *(_QWORD *)&v71 = v12;
  *((_QWORD *)&v71 + 1) = v13;
  v64[0] = swift_getOpaqueTypeConformance2();
  v64[1] = sub_23C127BF8();
  MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v15, v64);
  sub_23C138C9C();
  sub_23C138CA8();
  sub_23C138D44();
  v16 = MEMORY[0x24BDF1FA8];
  swift_getTupleTypeMetadata2();
  v17 = sub_23C138F60();
  v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BF8);
  v19 = MEMORY[0x2426179DC](MEMORY[0x24BDF5428], v17);
  v20 = sub_23C127C5C();
  *(_QWORD *)&v70 = v17;
  *((_QWORD *)&v70 + 1) = v16;
  *(_QWORD *)&v71 = v18;
  *((_QWORD *)&v71 + 1) = v19;
  *(_QWORD *)&v72 = MEMORY[0x24BDF1F80];
  *((_QWORD *)&v72 + 1) = v20;
  v21 = sub_23C138D68();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)v38 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)v38 - v26;
  v28 = v2[5];
  v74 = v2[4];
  v75 = v28;
  v29 = v2[7];
  v76 = v2[6];
  v77 = v29;
  v30 = v2[1];
  v70 = *v2;
  v71 = v30;
  v31 = v2[3];
  v72 = v2[2];
  v73 = v31;
  v32 = v39[3];
  v57 = v39[2];
  v58 = v32;
  v33 = v39[5];
  v34 = v39[6];
  v59 = v41;
  v60 = v33;
  v61 = v34;
  v62 = v40;
  v63 = &v70;
  v50 = v57;
  v51 = v32;
  v52 = v41;
  v53 = v33;
  v54 = v34;
  v55 = v40;
  v56 = &v70;
  v43 = v57;
  v44 = v32;
  v45 = v41;
  v46 = v33;
  v47 = v34;
  v48 = v40;
  v49 = &v70;
  sub_23C138D5C();
  MEMORY[0x2426179DC](MEMORY[0x24BDEFC28], v21);
  v35 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
  v35(v27, v25, v21);
  v36 = *(void (**)(char *, uint64_t))(v22 + 8);
  v36(v25, v21);
  v35(v42, v27, v21);
  return ((uint64_t (*)(char *, uint64_t))v36)(v27, v21);
}

void sub_23C1236BC(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
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
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t OpaqueTypeConformance2;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[7];
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  unint64_t v61;
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
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[3];

  v52 = a5;
  v53 = a6;
  v49 = a4;
  v50 = a2;
  v51 = a3;
  v59 = a8;
  v10 = sub_23C138BDC();
  MEMORY[0x24BDAC7A8](v10);
  v58 = (char *)v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23C138FD8();
  MEMORY[0x24BDAC7A8](v12);
  v57 = (char *)v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23C138CA8();
  v74 = sub_23C138CA8();
  v15 = sub_23C138CA8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BD0);
  v73 = v15;
  v71 = sub_23C138CA8();
  v72 = sub_23C138CA8();
  v16 = sub_23C138CA8();
  v67 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BD8);
  v70 = v16;
  v69 = sub_23C138D44();
  v17 = sub_23C138EAC();
  v48[3] = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v48[2] = (char *)v48 - v18;
  v68 = v19;
  v20 = sub_23C138CA8();
  v48[4] = *(_QWORD *)(v20 - 8);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v48[6] = (char *)v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v48[5] = (char *)v48 - v23;
  v24 = sub_23C138CA8();
  v25 = sub_23C138CA8();
  v26 = sub_23C138CA8();
  v27 = sub_23C138CA8();
  v94[0] = a7;
  v94[1] = MEMORY[0x24BDF0910];
  v28 = a7;
  v29 = MEMORY[0x24BDED308];
  v30 = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v14, v94);
  v31 = MEMORY[0x24BDEBEE0];
  v65 = v30;
  v93[0] = v30;
  v93[1] = MEMORY[0x24BDEBEE0];
  v32 = MEMORY[0x2426179DC](v29, v24, v93);
  v33 = sub_23C107448(&qword_256B22BE0, &qword_256B22BD0, MEMORY[0x24BDEEC10]);
  v92[0] = v32;
  v92[1] = v33;
  v66 = v33;
  v91[0] = MEMORY[0x2426179DC](v29, v25, v92);
  v91[1] = MEMORY[0x24BDEC438];
  v90[0] = MEMORY[0x2426179DC](v29, v26, v91);
  v90[1] = v31;
  v34 = MEMORY[0x2426179DC](v29, v27, v90);
  v35 = sub_23C127BB4();
  v36 = MEMORY[0x24BEE50B0];
  *(_QWORD *)&v81 = v27;
  *((_QWORD *)&v81 + 1) = MEMORY[0x24BEE50B0];
  *(_QWORD *)&v82 = v34;
  *((_QWORD *)&v82 + 1) = v35;
  MEMORY[0x242617988](255, &v81, MEMORY[0x24BDF38E8], 0);
  v37 = sub_23C138D44();
  *(_QWORD *)&v81 = v27;
  *((_QWORD *)&v81 + 1) = v36;
  *(_QWORD *)&v82 = v34;
  *((_QWORD *)&v82 + 1) = v35;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v39 = sub_23C127BF8();
  v89[0] = OpaqueTypeConformance2;
  v89[1] = v39;
  v61 = v39;
  v48[0] = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v37, v89);
  v48[1] = v37;
  v62 = sub_23C138C9C();
  v40 = sub_23C138CA8();
  v55 = v20;
  v63 = v40;
  v56 = sub_23C138D44();
  v67 = *(_QWORD *)(v56 - 8);
  v41 = MEMORY[0x24BDAC7A8](v56);
  v64 = (char *)v48 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v41);
  v60 = (char *)v48 - v43;
  v44 = a1[5];
  v85 = a1[4];
  v86 = v44;
  v45 = a1[7];
  v87 = a1[6];
  v88 = v45;
  v46 = a1[1];
  v81 = *a1;
  v82 = v46;
  v47 = a1[3];
  v83 = a1[2];
  v84 = v47;
  v75 = v50;
  v76 = v51;
  v77 = v49;
  v78 = v52;
  v79 = v53;
  v54 = v28;
  v80 = v28;
  type metadata accessor for ForYouView();
}

uint64_t sub_23C123B88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _OWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t);
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  char v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  char v77;
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
  void (*v90)(_QWORD, uint64_t);
  uint64_t v92;

  sub_23C121C54();
  swift_getKeyPath();
  sub_23C138F9C();
  swift_release();
  v9 = swift_release();
  v10 = *(unsigned __int8 *)(v1 + 848);
  *(_QWORD *)(v1 + 104) = a1;
  if (v10 == 1)
  {
    *(_QWORD *)(v1 + 8) = &v92;
    MEMORY[0x24BDAC7A8](v9);
    *(_QWORD *)(v1 + 392) = *(_QWORD *)(v1 + 192);
    *(_QWORD *)(v1 + 400) = MEMORY[0x24BDF0910];
    v11 = MEMORY[0x24BDED308];
    *(_QWORD *)(v1 + 376) = MEMORY[0x2426179DC](MEMORY[0x24BDED308], *(_QWORD *)(v1 + 264), v1 + 392);
    v12 = MEMORY[0x24BDEBEE0];
    *(_QWORD *)(v1 + 384) = MEMORY[0x24BDEBEE0];
    v13 = v12;
    v14 = MEMORY[0x2426179DC](v11, *(_QWORD *)(v1 + 256), v1 + 376);
    v15 = *(_QWORD *)(v1 + 200);
    *(_QWORD *)(v1 + 360) = v14;
    *(_QWORD *)(v1 + 368) = v15;
    *(_QWORD *)(v1 + 344) = MEMORY[0x2426179DC](v11, *(_QWORD *)(v1 + 240), v1 + 360);
    *(_QWORD *)(v1 + 352) = MEMORY[0x24BDEC438];
    *(_QWORD *)(v1 + 328) = MEMORY[0x2426179DC](v11, *(_QWORD *)(v1 + 248), v1 + 344);
    *(_QWORD *)(v1 + 336) = v13;
    v16 = MEMORY[0x2426179DC](v11, *(_QWORD *)(v1 + 232), v1 + 328);
    v17 = *(_QWORD *)(v1 + 160);
    *(_QWORD *)(v1 + 312) = v16;
    *(_QWORD *)(v1 + 320) = v17;
    v18 = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], *(_QWORD *)(v1 + 224), v1 + 312);
    v19 = *(_QWORD *)(v1 + 16);
    sub_23C138EA0();
    v20 = v3[5];
    *(_OWORD *)(v1 + 912) = v3[4];
    *(_OWORD *)(v1 + 928) = v20;
    v21 = v3[7];
    *(_OWORD *)(v1 + 944) = v3[6];
    *(_OWORD *)(v1 + 960) = v21;
    v22 = v3[1];
    *(_OWORD *)(v1 + 848) = *v3;
    *(_OWORD *)(v1 + 864) = v22;
    v23 = v3[3];
    *(_OWORD *)(v1 + 880) = v3[2];
    *(_OWORD *)(v1 + 896) = v23;
    sub_23C121C54();
    swift_getKeyPath();
    sub_23C138F9C();
    swift_release();
    swift_release();
    sub_23C138F24();
    *(_QWORD *)(v1 + 304) = v18;
    v24 = *(_QWORD *)(v1 + 216);
    v25 = MEMORY[0x2426179DC](MEMORY[0x24BDF3F50], v24, v1 + 304);
    v26 = *(_QWORD *)(v1 + 48);
    sub_23C138E34();
    v27 = MEMORY[0x24BDEBEE0];
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 24) + 8))(v19, v24);
    *(_QWORD *)(v1 + 288) = v25;
    *(_QWORD *)(v1 + 296) = v27;
    v28 = *(_QWORD *)(v1 + 112);
    MEMORY[0x2426179DC](v11, v28, v1 + 288);
    v29 = *(_QWORD *)(v1 + 32);
    v30 = *(_QWORD *)(v1 + 40);
    v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16);
    v31(v30, v26, v28);
    v32 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
    v32(v26, v28);
    v31(v26, v30, v28);
    *(_QWORD *)(v1 + 272) = MEMORY[0x2426179DC](MEMORY[0x24BDEC6F8], *(_QWORD *)(v1 + 168));
    *(_QWORD *)(v1 + 280) = v27;
    MEMORY[0x2426179DC](v11, *(_QWORD *)(v1 + 176), v1 + 272);
    sub_23C125314(v26, v28);
    v32(v26, v28);
    v32(v30, v28);
  }
  else
  {
    v33 = swift_allocObject();
    *(_QWORD *)(v33 + 16) = v2;
    *(_QWORD *)(v33 + 24) = v5;
    *(_QWORD *)(v33 + 32) = v4;
    *(_QWORD *)(v33 + 40) = v6;
    v34 = *(_QWORD *)(v1 + 96);
    *(_QWORD *)(v33 + 48) = v7;
    *(_QWORD *)(v33 + 56) = v34;
    v35 = v3[5];
    *(_OWORD *)(v33 + 128) = v3[4];
    *(_OWORD *)(v33 + 144) = v35;
    v36 = v3[7];
    *(_OWORD *)(v33 + 160) = v3[6];
    *(_OWORD *)(v33 + 176) = v36;
    v37 = v3[1];
    *(_OWORD *)(v33 + 64) = *v3;
    *(_OWORD *)(v33 + 80) = v37;
    v38 = v3[3];
    *(_OWORD *)(v33 + 96) = v3[2];
    *(_OWORD *)(v33 + 112) = v38;
    sub_23C1299CC((uint64_t)v3);
    *(_QWORD *)(v1 + 720) = sub_23C138C90();
    *(_QWORD *)(v1 + 728) = v39;
    v40 = v3[5];
    *(_OWORD *)(v1 + 912) = v3[4];
    *(_OWORD *)(v1 + 928) = v40;
    v41 = v3[7];
    *(_OWORD *)(v1 + 944) = v3[6];
    *(_OWORD *)(v1 + 960) = v41;
    v42 = v3[1];
    *(_OWORD *)(v1 + 848) = *v3;
    *(_OWORD *)(v1 + 864) = v42;
    v43 = v3[3];
    *(_OWORD *)(v1 + 880) = v3[2];
    *(_OWORD *)(v1 + 896) = v43;
    sub_23C121C54();
    swift_getKeyPath();
    sub_23C138F9C();
    swift_release();
    swift_release();
    sub_23C138F24();
    v44 = MEMORY[0x2426179DC](MEMORY[0x24BDEC6F8], *(_QWORD *)(v1 + 168));
    sub_23C138E34();
    swift_release();
    v45 = *(_QWORD *)(v1 + 792);
    v46 = *(_QWORD *)(v1 + 800);
    v47 = *(_BYTE *)(v1 + 808);
    v48 = *(_QWORD *)(v1 + 816);
    v49 = *(_BYTE *)(v1 + 824);
    *(_QWORD *)(v1 + 720) = *(_QWORD *)(v1 + 784);
    *(_QWORD *)(v1 + 728) = v45;
    *(_QWORD *)(v1 + 736) = v46;
    *(_BYTE *)(v1 + 744) = v47;
    *(_QWORD *)(v1 + 752) = v48;
    *(_BYTE *)(v1 + 760) = v49;
    *(_OWORD *)(v1 + 768) = *(_OWORD *)(v1 + 832);
    *(_QWORD *)(v1 + 704) = v44;
    v50 = MEMORY[0x24BDEBEE0];
    *(_QWORD *)(v1 + 712) = MEMORY[0x24BDEBEE0];
    v51 = MEMORY[0x24BDED308];
    v52 = *(_QWORD *)(v1 + 176);
    *(_QWORD *)(v1 + 96) = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v52, v1 + 704);
    v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 16);
    v53(v1 + 848, v1 + 720, v52);
    swift_release();
    v54 = *(_QWORD *)(v1 + 856);
    v55 = *(_QWORD *)(v1 + 864);
    v56 = *(_BYTE *)(v1 + 872);
    v57 = *(_QWORD *)(v1 + 880);
    v58 = *(_BYTE *)(v1 + 888);
    *(_QWORD *)(v1 + 720) = *(_QWORD *)(v1 + 848);
    *(_QWORD *)(v1 + 728) = v54;
    *(_QWORD *)(v1 + 736) = v55;
    *(_BYTE *)(v1 + 744) = v56;
    *(_QWORD *)(v1 + 752) = v57;
    *(_BYTE *)(v1 + 760) = v58;
    *(_OWORD *)(v1 + 768) = *(_OWORD *)(v1 + 896);
    v53(v1 + 784, v1 + 720, v52);
    v59 = *(_QWORD *)(v1 + 792);
    v60 = *(_QWORD *)(v1 + 800);
    v61 = *(_BYTE *)(v1 + 808);
    v62 = *(_QWORD *)(v1 + 816);
    v63 = *(_BYTE *)(v1 + 824);
    *(_QWORD *)(v1 + 720) = *(_QWORD *)(v1 + 784);
    *(_QWORD *)(v1 + 728) = v59;
    *(_QWORD *)(v1 + 736) = v60;
    *(_BYTE *)(v1 + 744) = v61;
    *(_QWORD *)(v1 + 752) = v62;
    *(_BYTE *)(v1 + 760) = v63;
    *(_OWORD *)(v1 + 768) = *(_OWORD *)(v1 + 832);
    *(_QWORD *)(v1 + 688) = *(_QWORD *)(v1 + 192);
    *(_QWORD *)(v1 + 696) = MEMORY[0x24BDF0910];
    *(_QWORD *)(v1 + 672) = MEMORY[0x2426179DC](v51, *(_QWORD *)(v1 + 264), v1 + 688);
    *(_QWORD *)(v1 + 680) = v50;
    *(_QWORD *)(v1 + 656) = MEMORY[0x2426179DC](v51, *(_QWORD *)(v1 + 256), v1 + 672);
    *(_QWORD *)(v1 + 664) = *(_QWORD *)(v1 + 200);
    *(_QWORD *)(v1 + 640) = MEMORY[0x2426179DC](v51, *(_QWORD *)(v1 + 240), v1 + 656);
    *(_QWORD *)(v1 + 648) = MEMORY[0x24BDEC438];
    *(_QWORD *)(v1 + 624) = MEMORY[0x2426179DC](v51, *(_QWORD *)(v1 + 248), v1 + 640);
    *(_QWORD *)(v1 + 632) = v50;
    *(_QWORD *)(v1 + 608) = MEMORY[0x2426179DC](v51, *(_QWORD *)(v1 + 232), v1 + 624);
    *(_QWORD *)(v1 + 616) = *(_QWORD *)(v1 + 160);
    *(_QWORD *)(v1 + 600) = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], *(_QWORD *)(v1 + 224), v1 + 608);
    *(_QWORD *)(v1 + 584) = MEMORY[0x2426179DC](MEMORY[0x24BDF3F50], *(_QWORD *)(v1 + 216), v1 + 600);
    *(_QWORD *)(v1 + 592) = v50;
    v28 = *(_QWORD *)(v1 + 112);
    MEMORY[0x2426179DC](v51, v28, v1 + 584);
    sub_23C1257C4(v1 + 720, v28, v52);
    swift_release();
    swift_release();
  }
  sub_23C138FCC();
  if (qword_256B21878 != -1)
    swift_once();
  v64 = (void *)qword_256B2FCE8;
  v65 = v3[5];
  *(_OWORD *)(v1 + 912) = v3[4];
  *(_OWORD *)(v1 + 928) = v65;
  v66 = v3[7];
  *(_OWORD *)(v1 + 944) = v3[6];
  *(_OWORD *)(v1 + 960) = v66;
  v67 = v3[1];
  *(_OWORD *)(v1 + 848) = *v3;
  *(_OWORD *)(v1 + 864) = v67;
  v68 = v3[3];
  *(_OWORD *)(v1 + 880) = v3[2];
  *(_OWORD *)(v1 + 896) = v68;
  v69 = v64;
  sub_23C121C54();
  swift_getKeyPath();
  sub_23C138F9C();
  swift_release();
  swift_release();
  *(_QWORD *)(v1 + 848) = sub_23C138FFC();
  *(_QWORD *)(v1 + 856) = v70;
  sub_23C1074D8();
  v71 = sub_23C138DD4();
  v73 = v72;
  v75 = v74;
  v77 = v76 & 1;
  v78 = *(_QWORD *)(v1 + 184);
  v79 = *(_QWORD *)(v1 + 120);
  (*(void (**)(void))(*(_QWORD *)(v1 + 208) + 16))();
  *(_QWORD *)(v1 + 848) = v71;
  *(_QWORD *)(v1 + 856) = v73;
  *(_BYTE *)(v1 + 864) = v77;
  *(_QWORD *)(v1 + 872) = v75;
  *(_QWORD *)(v1 + 784) = v78;
  *(_QWORD *)(v1 + 792) = v1 + 848;
  sub_23C10660C(v71, v73, v77);
  swift_bridgeObjectRetain();
  v80 = MEMORY[0x24BDF1FA8];
  *(_QWORD *)(v1 + 720) = v79;
  *(_QWORD *)(v1 + 728) = v80;
  *(_QWORD *)(v1 + 544) = *(_QWORD *)(v1 + 192);
  *(_QWORD *)(v1 + 552) = MEMORY[0x24BDF0910];
  v81 = MEMORY[0x24BDED308];
  *(_QWORD *)(v1 + 528) = MEMORY[0x2426179DC](MEMORY[0x24BDED308], *(_QWORD *)(v1 + 264), v1 + 544);
  v82 = MEMORY[0x24BDEBEE0];
  *(_QWORD *)(v1 + 536) = MEMORY[0x24BDEBEE0];
  *(_QWORD *)(v1 + 512) = MEMORY[0x2426179DC](v81, *(_QWORD *)(v1 + 256), v1 + 528);
  *(_QWORD *)(v1 + 520) = *(_QWORD *)(v1 + 200);
  *(_QWORD *)(v1 + 496) = MEMORY[0x2426179DC](v81, *(_QWORD *)(v1 + 240), v1 + 512);
  *(_QWORD *)(v1 + 504) = MEMORY[0x24BDEC438];
  *(_QWORD *)(v1 + 480) = MEMORY[0x2426179DC](v81, *(_QWORD *)(v1 + 248), v1 + 496);
  *(_QWORD *)(v1 + 488) = v82;
  v83 = MEMORY[0x2426179DC](v81, *(_QWORD *)(v1 + 232), v1 + 480);
  v84 = *(_QWORD *)(v1 + 160);
  *(_QWORD *)(v1 + 464) = v83;
  *(_QWORD *)(v1 + 472) = v84;
  v85 = MEMORY[0x24BDEF3E0];
  *(_QWORD *)(v1 + 456) = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], *(_QWORD *)(v1 + 224), v1 + 464);
  *(_QWORD *)(v1 + 440) = MEMORY[0x2426179DC](MEMORY[0x24BDF3F50], *(_QWORD *)(v1 + 216), v1 + 456);
  *(_QWORD *)(v1 + 448) = v82;
  v86 = MEMORY[0x2426179DC](v81, v28, v1 + 440);
  *(_QWORD *)(v1 + 424) = MEMORY[0x2426179DC](MEMORY[0x24BDEC6F8], *(_QWORD *)(v1 + 168));
  *(_QWORD *)(v1 + 432) = v82;
  v87 = MEMORY[0x2426179DC](v81, *(_QWORD *)(v1 + 176), v1 + 424);
  *(_QWORD *)(v1 + 408) = v86;
  *(_QWORD *)(v1 + 416) = v87;
  v88 = MEMORY[0x2426179DC](v85, v79, v1 + 408);
  v89 = MEMORY[0x24BDF1F80];
  *(_QWORD *)(v1 + 560) = v88;
  *(_QWORD *)(v1 + 568) = v89;
  sub_23C121AA0((uint64_t *)(v1 + 784), 2uLL, v1 + 720);
  sub_23C10661C(v71, v73, v77);
  swift_bridgeObjectRelease();
  v90 = *(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v1 + 208) + 8);
  v90(*(_QWORD *)(v1 + 152), v79);
  sub_23C10661C(*(_QWORD *)(v1 + 848), *(_QWORD *)(v1 + 856), *(_BYTE *)(v1 + 864));
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(_QWORD, uint64_t))v90)(*(_QWORD *)(v1 + 184), v79);
}

void sub_23C1244EC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
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
  _QWORD v34[30];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v35 = a6;
  v36 = a7;
  v34[25] = a8;
  v34[1] = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v34[2] = (char *)v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23C138CA8();
  v34[3] = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v34[18] = (char *)v34 - v14;
  v34[27] = v15;
  v16 = sub_23C138CA8();
  v34[6] = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v34[5] = (char *)v34 - v17;
  v34[29] = v18;
  v19 = sub_23C138CA8();
  v34[8] = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v34[7] = (char *)v34 - v20;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BD0);
  v34[26] = v19;
  v21 = sub_23C138CA8();
  v34[10] = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v34[9] = (char *)v34 - v22;
  v34[24] = v23;
  v24 = sub_23C138CA8();
  v34[12] = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v34[11] = (char *)v34 - v25;
  v34[28] = v26;
  v27 = sub_23C138CA8();
  v34[13] = *(_QWORD *)(v27 - 8);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v34[15] = (char *)v34 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v34[14] = (char *)v34 - v30;
  v31 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BD8);
  v34[23] = v27;
  v34[19] = v31;
  v32 = sub_23C138D44();
  v34[21] = *(_QWORD *)(v32 - 8);
  v34[22] = v32;
  MEMORY[0x24BDAC7A8](v32);
  v34[20] = (char *)v34 - v33;
  v37 = a2;
  v38 = a3;
  v34[16] = a4;
  v34[17] = a5;
  v39 = a4;
  v40 = a5;
  v41 = v35;
  v42 = v36;
  type metadata accessor for ForYouView();
}

uint64_t sub_23C1247CC(uint64_t a1)
{
  uint64_t v1;
  char v2;
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
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(uint64_t, uint64_t, uint64_t);
  void (*v75)(uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
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
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;

  *(_QWORD *)(v1 + 32) = a1;
  *(_BYTE *)(v1 + 336) = v2 & 1;
  *(_QWORD *)(v1 + 344) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DB0);
  v8 = sub_23C138EDC();
  if (*(_BYTE *)(v7 - 112) == 1)
  {
    v9 = *(_QWORD *)(v1 + 16);
    (*(void (**)(uint64_t))(v3 + 56))(v8);
    v10 = swift_allocObject();
    v11 = v5;
    *(_QWORD *)(v10 + 16) = v5;
    *(_QWORD *)(v10 + 24) = v6;
    v12 = v6;
    v13 = *(_QWORD *)(v1 + 128);
    v14 = *(_QWORD *)(v1 + 136);
    *(_QWORD *)(v10 + 32) = v13;
    *(_QWORD *)(v10 + 40) = v14;
    v15 = *(_QWORD *)(v1 + 248);
    *(_QWORD *)(v10 + 48) = *(_QWORD *)(v1 + 240);
    *(_QWORD *)(v10 + 56) = v15;
    v16 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v10 + 128) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v10 + 144) = v16;
    v17 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v10 + 160) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v10 + 176) = v17;
    v18 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v10 + 64) = *(_OWORD *)v3;
    *(_OWORD *)(v10 + 80) = v18;
    v19 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v10 + 96) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v10 + 112) = v19;
    sub_23C1299CC(v3);
    sub_23C138E58();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 8) + 8))(v9, v13);
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v11;
    *(_QWORD *)(v20 + 24) = v12;
    *(_QWORD *)(v20 + 32) = v13;
    *(_QWORD *)(v20 + 40) = v14;
    *(_QWORD *)(v20 + 48) = *(_QWORD *)(v1 + 240);
    *(_QWORD *)(v20 + 56) = v15;
    v21 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v20 + 128) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v20 + 144) = v21;
    v22 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v20 + 160) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v20 + 176) = v22;
    v23 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v20 + 64) = *(_OWORD *)v3;
    *(_OWORD *)(v20 + 80) = v23;
    v24 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v20 + 96) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v20 + 112) = v24;
    sub_23C1299CC(v3);
    *(_QWORD *)(v1 + 464) = v15;
    *(_QWORD *)(v1 + 472) = MEMORY[0x24BDF0910];
    v25 = MEMORY[0x24BDED308];
    v26 = *(_QWORD *)(v1 + 216);
    v27 = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v26, v1 + 464);
    v28 = *(_QWORD *)(v1 + 40);
    v29 = *(_QWORD *)(v1 + 144);
    sub_23C138DF8();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 24) + 8))(v29, v26);
    v30 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v1 + 400) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v1 + 416) = v30;
    v31 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v1 + 432) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v1 + 448) = v31;
    v32 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v1 + 336) = *(_OWORD *)v3;
    *(_OWORD *)(v1 + 352) = v32;
    v33 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v1 + 368) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v1 + 384) = v33;
    sub_23C121C54();
    swift_getKeyPath();
    sub_23C138F9C();
    swift_release();
    swift_release();
    sub_23C138F24();
    *(_QWORD *)(v1 + 320) = v27;
    *(_QWORD *)(v1 + 328) = MEMORY[0x24BDF0910];
    v34 = *(_QWORD *)(v1 + 232);
    v35 = MEMORY[0x2426179DC](v25, v34, v1 + 320);
    v36 = *(_QWORD *)(v1 + 56);
    sub_23C138E34();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 48) + 8))(v28, v34);
    *(_OWORD *)(v1 + 336) = *(_OWORD *)(v3 + 112);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DA8);
    sub_23C138EDC();
    v37 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v1 + 400) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v1 + 416) = v37;
    v38 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v1 + 432) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v1 + 448) = v38;
    v39 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v1 + 336) = *(_OWORD *)v3;
    *(_OWORD *)(v1 + 352) = v39;
    v40 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v1 + 368) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v1 + 384) = v40;
    *(_QWORD *)(v1 + 336) = sub_23C121CC4();
    *(_QWORD *)(v1 + 344) = v41;
    *(_QWORD *)(v1 + 304) = v35;
    *(_QWORD *)(v1 + 312) = MEMORY[0x24BDEBEE0];
    v42 = MEMORY[0x24BDED308];
    v43 = *(_QWORD *)(v1 + 208);
    v44 = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v43, v1 + 304);
    sub_23C12AD68();
    v45 = *(_QWORD *)(v1 + 72);
    sub_23C138E70();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 64) + 8))(v36, v43);
    v46 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v1 + 400) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v1 + 416) = v46;
    v47 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v1 + 432) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v1 + 448) = v47;
    v48 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v1 + 336) = *(_OWORD *)v3;
    *(_OWORD *)(v1 + 352) = v48;
    v49 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v1 + 368) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v1 + 384) = v49;
    sub_23C121C54();
    swift_getKeyPath();
    sub_23C138F9C();
    swift_release();
    swift_release();
    v50 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v1 + 400) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v1 + 416) = v50;
    v51 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v1 + 432) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v1 + 448) = v51;
    v52 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v1 + 336) = *(_OWORD *)v3;
    *(_OWORD *)(v1 + 352) = v52;
    v53 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v1 + 368) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v1 + 384) = v53;
    sub_23C121C54();
    swift_getKeyPath();
    sub_23C138F9C();
    swift_release();
    swift_release();
    v54 = sub_23C107448(&qword_256B22BE0, &qword_256B22BD0, MEMORY[0x24BDEEC10]);
    *(_QWORD *)(v1 + 288) = v44;
    *(_QWORD *)(v1 + 296) = v54;
    v55 = *(_QWORD *)(v1 + 192);
    v56 = MEMORY[0x2426179DC](v42, v55, v1 + 288);
    v57 = *(_QWORD *)(v1 + 88);
    sub_23C138E40();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 80) + 8))(v45, v55);
    v58 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v1 + 400) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v1 + 416) = v58;
    v59 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v1 + 432) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v1 + 448) = v59;
    v60 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v1 + 336) = *(_OWORD *)v3;
    *(_OWORD *)(v1 + 352) = v60;
    v61 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v1 + 368) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v1 + 384) = v61;
    sub_23C121C54();
    swift_getKeyPath();
    sub_23C138F9C();
    swift_release();
    swift_release();
    v62 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v1 + 400) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v1 + 416) = v62;
    v63 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v1 + 432) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v1 + 448) = v63;
    v64 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v1 + 336) = *(_OWORD *)v3;
    *(_OWORD *)(v1 + 352) = v64;
    v65 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v1 + 368) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v1 + 384) = v65;
    sub_23C121CC4();
    *(_QWORD *)(v1 + 272) = v56;
    *(_QWORD *)(v1 + 280) = MEMORY[0x24BDEC438];
    v66 = *(_QWORD *)(v1 + 224);
    v67 = MEMORY[0x2426179DC](v42, v66, v1 + 272);
    v68 = *(_QWORD *)(v1 + 120);
    sub_23C138E34();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 96) + 8))(v57, v66);
    *(_QWORD *)(v1 + 256) = v67;
    *(_QWORD *)(v1 + 264) = MEMORY[0x24BDEBEE0];
    v69 = v42;
    v70 = *(_QWORD *)(v1 + 208);
    v71 = *(_QWORD *)(v1 + 184);
    MEMORY[0x2426179DC](v69, v71, v1 + 256);
    v72 = *(_QWORD *)(v1 + 104);
    v73 = *(_QWORD *)(v1 + 112);
    v74 = *(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 16);
    v74(v73, v68, v71);
    v75 = *(void (**)(uint64_t, uint64_t))(v72 + 8);
    v75(v68, v71);
    v74(v68, v73, v71);
    sub_23C127BF8();
    v76 = *(_QWORD *)(v1 + 160);
    sub_23C125314(v68, v71);
    v77 = v68;
    v78 = *(_QWORD *)(v1 + 248);
    v75(v77, v71);
    v79 = v73;
    v80 = *(_QWORD *)(v1 + 216);
    v75(v79, v71);
  }
  else
  {
    v81 = sub_23C138E88();
    v82 = swift_allocObject();
    *(_QWORD *)(v82 + 16) = v5;
    *(_QWORD *)(v82 + 24) = v6;
    v83 = *(_QWORD *)(v1 + 136);
    *(_QWORD *)(v82 + 32) = *(_QWORD *)(v1 + 128);
    *(_QWORD *)(v82 + 40) = v83;
    v78 = *(_QWORD *)(v1 + 248);
    *(_QWORD *)(v82 + 48) = *(_QWORD *)(v1 + 240);
    *(_QWORD *)(v82 + 56) = v78;
    v84 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v82 + 128) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v82 + 144) = v84;
    v85 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v82 + 160) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v82 + 176) = v85;
    v86 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v82 + 64) = *(_OWORD *)v3;
    *(_OWORD *)(v82 + 80) = v86;
    v87 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v82 + 96) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v82 + 112) = v87;
    *(_QWORD *)(v1 + 336) = v81;
    *(_QWORD *)(v1 + 344) = sub_23C12ACE4;
    *(_QWORD *)(v1 + 360) = 0;
    *(_QWORD *)(v1 + 368) = 0;
    *(_QWORD *)(v1 + 352) = v82;
    sub_23C1299CC(v3);
    *(_QWORD *)(v7 - 128) = v78;
    v88 = MEMORY[0x24BDF0910];
    *(_QWORD *)(v7 - 120) = MEMORY[0x24BDF0910];
    v89 = MEMORY[0x24BDED308];
    v80 = *(_QWORD *)(v1 + 216);
    *(_QWORD *)(v7 - 144) = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v80, v7 - 128);
    *(_QWORD *)(v7 - 136) = v88;
    *(_QWORD *)(v7 - 160) = MEMORY[0x2426179DC](v89, *(_QWORD *)(v1 + 232), v7 - 144);
    v90 = MEMORY[0x24BDEBEE0];
    *(_QWORD *)(v7 - 152) = MEMORY[0x24BDEBEE0];
    v70 = *(_QWORD *)(v1 + 208);
    v91 = MEMORY[0x2426179DC](v89, v70, v7 - 160);
    v92 = sub_23C107448(&qword_256B22BE0, &qword_256B22BD0, MEMORY[0x24BDEEC10]);
    *(_QWORD *)(v7 - 176) = v91;
    *(_QWORD *)(v7 - 168) = v92;
    v55 = *(_QWORD *)(v1 + 192);
    *(_QWORD *)(v7 - 192) = MEMORY[0x2426179DC](v89, v55, v7 - 176);
    *(_QWORD *)(v7 - 184) = MEMORY[0x24BDEC438];
    *(_QWORD *)(v7 - 208) = MEMORY[0x2426179DC](v89, *(_QWORD *)(v1 + 224), v7 - 192);
    *(_QWORD *)(v7 - 200) = v90;
    v71 = *(_QWORD *)(v1 + 184);
    MEMORY[0x2426179DC](v89, v71, v7 - 208);
    sub_23C127BF8();
    v76 = *(_QWORD *)(v1 + 160);
    sub_23C1257C4(v1 + 336, v71, *(_QWORD *)(v1 + 152));
    swift_release();
    swift_release();
  }
  *(_QWORD *)(v7 - 224) = v78;
  v93 = MEMORY[0x24BDF0910];
  *(_QWORD *)(v7 - 216) = MEMORY[0x24BDF0910];
  v94 = MEMORY[0x24BDED308];
  *(_QWORD *)(v7 - 240) = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v80, v7 - 224);
  *(_QWORD *)(v7 - 232) = v93;
  *(_QWORD *)(v7 - 256) = MEMORY[0x2426179DC](v94, *(_QWORD *)(v1 + 232), v7 - 240);
  v95 = MEMORY[0x24BDEBEE0];
  *(_QWORD *)(v7 - 248) = MEMORY[0x24BDEBEE0];
  v96 = MEMORY[0x2426179DC](v94, v70, v7 - 256);
  v97 = sub_23C107448(&qword_256B22BE0, &qword_256B22BD0, MEMORY[0x24BDEEC10]);
  *(_QWORD *)(v1 + 528) = v96;
  *(_QWORD *)(v1 + 536) = v97;
  *(_QWORD *)(v1 + 512) = MEMORY[0x2426179DC](v94, v55, v1 + 528);
  *(_QWORD *)(v1 + 520) = MEMORY[0x24BDEC438];
  *(_QWORD *)(v1 + 496) = MEMORY[0x2426179DC](v94, *(_QWORD *)(v1 + 224), v1 + 512);
  *(_QWORD *)(v1 + 504) = v95;
  v98 = MEMORY[0x2426179DC](v94, v71, v1 + 496);
  v99 = sub_23C127BF8();
  *(_QWORD *)(v1 + 480) = v98;
  *(_QWORD *)(v1 + 488) = v99;
  v100 = *(_QWORD *)(v1 + 176);
  MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v100, v1 + 480);
  v101 = *(_QWORD *)(v1 + 168);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v101 + 16))(*(_QWORD *)(v1 + 200), v76, v100);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v101 + 8))(v76, v100);
}

void sub_23C1250A4(uint64_t a1)
{
  sub_23C1299CC(a1);
  type metadata accessor for ForYouView();
}

uint64_t sub_23C125140()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[7];
  uint64_t v12;
  uint64_t v13;

  sub_23C121C54();
  swift_getKeyPath();
  sub_23C138F9C();
  swift_release();
  swift_release();
  sub_23C138F54();
  sub_23C138F48();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DA8);
  sub_23C138EE8();
  v11[4] = v8;
  v11[5] = v9;
  v11[6] = v10;
  v11[0] = v4;
  v11[1] = v5;
  v11[2] = v6;
  v11[3] = v7;
  v12 = v2;
  v13 = v1;
  sub_23C12ADAC((uint64_t)v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DB0);
  sub_23C138EE8();
  sub_23C1299CC(v0);
  sub_23C138F3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DA0);
  sub_23C138EE8();
  return sub_23C12ADAC(v0);
}

void sub_23C1252A8()
{
  type metadata accessor for ForYouView();
}

uint64_t sub_23C1252D8()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 17) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DB0);
  return sub_23C138EE8();
}

uint64_t sub_23C125314(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_23C138D2C();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_23C138D38();
}

uint64_t sub_23C1253D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v8[13] = v12;
  v8[14] = v13;
  v8[11] = a7;
  v8[12] = a8;
  v8[9] = a5;
  v8[10] = a6;
  v8[8] = a4;
  v9 = sub_23C139140();
  v8[15] = v9;
  v8[16] = *(_QWORD *)(v9 - 8);
  v8[17] = swift_task_alloc();
  sub_23C139068();
  v8[18] = sub_23C13905C();
  v8[19] = sub_23C139044();
  v8[20] = v10;
  return swift_task_switch();
}

uint64_t sub_23C125480()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  v1 = sub_23C139344();
  v3 = v2;
  sub_23C139134();
  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_256B22DD0 + dword_256B22DD0);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 168) = v4;
  *v4 = v0;
  v4[1] = sub_23C125518;
  return v6(v1, v3, 0, 0, 1);
}

uint64_t sub_23C125518()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 128);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 136);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 120);
  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch();
}

void sub_23C1255A0()
{
  _OWORD *v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;

  v2 = *(_OWORD *)((char *)v0 + 88);
  v3 = *(_OWORD *)((char *)v0 + 72);
  v1 = *(_OWORD *)((char *)v0 + 104);
  swift_release();
  v0[1] = v3;
  v0[2] = v2;
  v0[3] = v1;
  type metadata accessor for ForYouView();
}

uint64_t sub_23C125600()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 - 40) = v1 & 1;
  *(_QWORD *)(v3 - 32) = v0;
  *(_BYTE *)(v3 - 41) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DB0);
  sub_23C138EE8();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23C125654()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C125690(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_23C13908C();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_23C139080();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_23C106ED8(a1, &qword_256B22DB8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23C139044();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_23C1257C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_23C138D2C();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_23C138D38();
}

void sub_23C125888(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, unint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[18];
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[3];

  v62 = a4;
  v63 = a6;
  v59 = a3;
  v60 = a5;
  v57 = a8;
  v58 = a2;
  v51 = a1;
  v10 = sub_23C138C84();
  v37[5] = *(_QWORD *)(v10 - 8);
  v37[6] = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v37[3] = v12;
  v37[4] = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37[8] = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v47 = (char *)v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23C138CA8();
  v37[10] = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v37[9] = (char *)v37 - v15;
  v16 = sub_23C138CA8();
  v37[13] = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v37[12] = (char *)v37 - v17;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BD0);
  v18 = sub_23C138CA8();
  v37[16] = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v37[15] = (char *)v37 - v19;
  v20 = sub_23C138CA8();
  v43 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v40 = (char *)v37 - v21;
  v22 = sub_23C138CA8();
  v46 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v45 = (char *)v37 - v23;
  v74[0] = a7;
  v74[1] = MEMORY[0x24BDF0910];
  v24 = MEMORY[0x24BDED308];
  v37[11] = v14;
  v25 = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v14, v74);
  v26 = MEMORY[0x24BDEBEE0];
  v37[2] = v25;
  v73[0] = v25;
  v73[1] = MEMORY[0x24BDEBEE0];
  v37[14] = v16;
  v27 = MEMORY[0x2426179DC](v24, v16, v73);
  v28 = sub_23C107448(&qword_256B22BE0, &qword_256B22BD0, MEMORY[0x24BDEEC10]);
  v37[7] = v27;
  v72[0] = v27;
  v72[1] = v28;
  v37[17] = v18;
  v71[0] = MEMORY[0x2426179DC](v24, v18, v72);
  v71[1] = MEMORY[0x24BDEC438];
  v44 = v20;
  v38 = MEMORY[0x2426179DC](v24, v20, v71);
  v70[0] = v38;
  v70[1] = v26;
  v29 = MEMORY[0x2426179DC](v24, v22, v70);
  v30 = sub_23C127BB4();
  v55 = v29;
  v56 = v22;
  v64 = v22;
  v65 = MEMORY[0x24BEE50B0];
  v66 = v29;
  v67 = v30;
  v54 = v30;
  v31 = MEMORY[0x242617988](0, &v64, MEMORY[0x24BDF38E8], 0);
  v39 = *(_QWORD *)(v31 - 8);
  v32 = MEMORY[0x24BDAC7A8](v31);
  v42 = (char *)v37 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v32);
  v41 = (char *)v37 - v34;
  v48 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BD8);
  v49 = v31;
  v35 = sub_23C138D44();
  v52 = *(_QWORD *)(v35 - 8);
  v53 = v35;
  MEMORY[0x24BDAC7A8](v35);
  v50 = (char *)v37 - v36;
  v64 = v58;
  v65 = v59;
  v66 = v62;
  v67 = v60;
  v68 = v63;
  v69 = a7;
  v61 = a7;
  type metadata accessor for ForYouView();
}

uint64_t sub_23C125C9C(uint64_t a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(uint64_t, uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  void (*v83)(uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint64_t OpaqueTypeConformance2;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;

  *(_BYTE *)(v1 + 352) = v2 & 1;
  *(_QWORD *)(v1 + 360) = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DB0);
  v11 = sub_23C138EDC();
  if (*(_BYTE *)(v9 - 216) == 1)
  {
    (*(void (**)(uint64_t))(v3 + 56))(v11);
    v12 = *(_QWORD *)(v1 + 32);
    v13 = *(_QWORD *)(v1 + 40);
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
    v15 = *(_QWORD *)(v1 + 248);
    *(_QWORD *)(v1 + 8) = a1;
    v16 = *(_QWORD *)(v1 + 48);
    v14(v12, v15, v16);
    v17 = (*(unsigned __int8 *)(v13 + 80) + 192) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    v18 = swift_allocObject();
    *(_QWORD *)(v1 + 24) = v7;
    *(_QWORD *)(v18 + 16) = v4;
    *(_QWORD *)(v18 + 24) = v5;
    v20 = *(_QWORD *)(v1 + 336);
    v19 = *(_QWORD *)(v1 + 344);
    *(_QWORD *)(v18 + 32) = v20;
    *(_QWORD *)(v18 + 40) = v6;
    v21 = *(_QWORD *)(v1 + 328);
    *(_QWORD *)(v18 + 48) = v19;
    *(_QWORD *)(v18 + 56) = v21;
    v22 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v18 + 128) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v18 + 144) = v22;
    v23 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v18 + 160) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v18 + 176) = v23;
    v24 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v18 + 64) = *(_OWORD *)v3;
    *(_OWORD *)(v18 + 80) = v24;
    v25 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v18 + 96) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v18 + 112) = v25;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v13 + 32))(v18 + v17, v12, v16);
    sub_23C1299CC(v3);
    v26 = *(_QWORD *)(v1 + 72);
    v27 = *(_QWORD *)(v1 + 216);
    sub_23C138E58();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 64) + 8))(v27, v20);
    v28 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v1 + 416) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v1 + 432) = v28;
    v29 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v1 + 448) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v1 + 464) = v29;
    v30 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v1 + 352) = *(_OWORD *)v3;
    *(_OWORD *)(v1 + 368) = v30;
    v31 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v1 + 384) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v1 + 400) = v31;
    sub_23C121C54();
    swift_getKeyPath();
    sub_23C138F9C();
    swift_release();
    swift_release();
    sub_23C138F24();
    v33 = *(_QWORD *)(v1 + 88);
    v32 = *(_QWORD *)(v1 + 96);
    sub_23C138E34();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 80) + 8))(v26, v33);
    *(_OWORD *)(v1 + 352) = *(_OWORD *)(v3 + 112);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DA8);
    sub_23C138EDC();
    v34 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v1 + 416) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v1 + 432) = v34;
    v35 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v1 + 448) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v1 + 464) = v35;
    v36 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v1 + 352) = *(_OWORD *)v3;
    *(_OWORD *)(v1 + 368) = v36;
    v37 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v1 + 384) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v1 + 400) = v37;
    *(_QWORD *)(v1 + 352) = sub_23C121CC4();
    *(_QWORD *)(v1 + 360) = v38;
    sub_23C12AD68();
    v39 = *(_QWORD *)(v1 + 112);
    v40 = *(_QWORD *)(v1 + 120);
    sub_23C138E70();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 104) + 8))(v32, v39);
    v41 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v1 + 416) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v1 + 432) = v41;
    v42 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v1 + 448) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v1 + 464) = v42;
    v43 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v1 + 352) = *(_OWORD *)v3;
    *(_OWORD *)(v1 + 368) = v43;
    v44 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v1 + 384) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v1 + 400) = v44;
    sub_23C121C54();
    swift_getKeyPath();
    sub_23C138F9C();
    swift_release();
    swift_release();
    v45 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v1 + 416) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v1 + 432) = v45;
    v46 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v1 + 448) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v1 + 464) = v46;
    v47 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v1 + 352) = *(_OWORD *)v3;
    *(_OWORD *)(v1 + 368) = v47;
    v48 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v1 + 384) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v1 + 400) = v48;
    sub_23C121C54();
    swift_getKeyPath();
    sub_23C138F9C();
    swift_release();
    swift_release();
    v49 = *(_QWORD *)(v1 + 160);
    v50 = *(_QWORD *)(v1 + 136);
    sub_23C138E40();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 128) + 8))(v40, v50);
    sub_23C138C78();
    v51 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v1 + 416) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v1 + 432) = v51;
    v52 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v1 + 448) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v1 + 464) = v52;
    v53 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v1 + 352) = *(_OWORD *)v3;
    *(_OWORD *)(v1 + 368) = v53;
    v54 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v1 + 384) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v1 + 400) = v54;
    sub_23C121C54();
    swift_getKeyPath();
    sub_23C138F9C();
    swift_release();
    swift_release();
    v55 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v1 + 416) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v1 + 432) = v55;
    v56 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v1 + 448) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v1 + 464) = v56;
    v57 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v1 + 352) = *(_OWORD *)v3;
    *(_OWORD *)(v1 + 368) = v57;
    v58 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v1 + 384) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v1 + 400) = v58;
    sub_23C121C54();
    swift_getKeyPath();
    sub_23C138F9C();
    swift_release();
    swift_release();
    v59 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v1 + 416) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v1 + 432) = v59;
    v60 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v1 + 448) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v1 + 464) = v60;
    v61 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v1 + 352) = *(_OWORD *)v3;
    *(_OWORD *)(v1 + 368) = v61;
    v62 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v1 + 384) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v1 + 400) = v62;
    sub_23C121CC4();
    v63 = *(_QWORD *)(v1 + 192);
    v64 = *(_QWORD *)(v1 + 200);
    sub_23C138E34();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 184) + 8))(v49, v63);
    sub_23C138C78();
    *(_QWORD *)(v1 + 352) = v65;
    v66 = swift_allocObject();
    v67 = *(_QWORD *)(v1 + 312);
    *(_QWORD *)(v66 + 16) = *(_QWORD *)(v1 + 304);
    *(_QWORD *)(v66 + 24) = v67;
    v68 = *(_QWORD *)(v1 + 320);
    *(_QWORD *)(v66 + 32) = *(_QWORD *)(v1 + 336);
    *(_QWORD *)(v66 + 40) = v68;
    v69 = *(_QWORD *)(v1 + 328);
    *(_QWORD *)(v66 + 48) = *(_QWORD *)(v1 + 344);
    *(_QWORD *)(v66 + 56) = v69;
    v70 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v66 + 128) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v66 + 144) = v70;
    v71 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v66 + 160) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v66 + 176) = v71;
    v72 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v66 + 64) = *(_OWORD *)v3;
    *(_OWORD *)(v66 + 80) = v72;
    v73 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v66 + 96) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v66 + 112) = v73;
    sub_23C1299CC(v3);
    v74 = *(_QWORD *)(v1 + 176);
    v76 = *(_QWORD *)(v1 + 280);
    v75 = *(_QWORD *)(v1 + 288);
    v77 = MEMORY[0x24BEE50B0];
    v78 = *(_QWORD *)(v1 + 272);
    sub_23C138E64();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 208) + 8))(v64, v75);
    *(_QWORD *)(v1 + 352) = v75;
    *(_QWORD *)(v1 + 360) = v77;
    *(_QWORD *)(v1 + 368) = v76;
    *(_QWORD *)(v1 + 376) = v78;
    *(_QWORD *)(v1 + 344) = swift_getOpaqueTypeConformance2();
    v79 = *(_QWORD *)(v1 + 152);
    v80 = *(void (**)(uint64_t, uint64_t, uint64_t))(v79 + 16);
    v81 = *(_QWORD *)(v1 + 168);
    v82 = *(_QWORD *)(v1 + 232);
    v80(v81, v74, v82);
    v83 = *(void (**)(uint64_t, uint64_t))(v79 + 8);
    v83(v74, v82);
    v80(v74, v81, v82);
    sub_23C127BF8();
    v84 = *(_QWORD *)(v1 + 240);
    sub_23C125314(v74, v82);
    v85 = v74;
    v86 = MEMORY[0x24BEE50B0];
    v83(v85, v82);
    v83(v81, v82);
  }
  else
  {
    v87 = sub_23C138E88();
    v88 = swift_allocObject();
    *(_QWORD *)(v88 + 16) = v4;
    *(_QWORD *)(v88 + 24) = v5;
    *(_QWORD *)(v88 + 32) = *(_QWORD *)(v1 + 336);
    *(_QWORD *)(v88 + 40) = v6;
    v89 = *(_QWORD *)(v1 + 328);
    *(_QWORD *)(v88 + 48) = *(_QWORD *)(v1 + 344);
    *(_QWORD *)(v88 + 56) = v89;
    v90 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v88 + 128) = *(_OWORD *)(v3 + 64);
    *(_OWORD *)(v88 + 144) = v90;
    v91 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v88 + 160) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v88 + 176) = v91;
    v92 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v88 + 64) = *(_OWORD *)v3;
    *(_OWORD *)(v88 + 80) = v92;
    v93 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v88 + 96) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v88 + 112) = v93;
    *(_QWORD *)(v1 + 352) = v87;
    *(_QWORD *)(v1 + 360) = sub_23C12B1E0;
    *(_QWORD *)(v1 + 376) = 0;
    *(_QWORD *)(v1 + 384) = 0;
    *(_QWORD *)(v1 + 368) = v88;
    sub_23C1299CC(v3);
    v76 = *(_QWORD *)(v1 + 280);
    v75 = *(_QWORD *)(v1 + 288);
    *(_QWORD *)(v9 - 216) = v75;
    v86 = MEMORY[0x24BEE50B0];
    *(_QWORD *)(v9 - 208) = MEMORY[0x24BEE50B0];
    *(_QWORD *)(v9 - 200) = v76;
    v78 = *(_QWORD *)(v1 + 272);
    *(_QWORD *)(v9 - 192) = v78;
    swift_getOpaqueTypeConformance2();
    sub_23C127BF8();
    v84 = *(_QWORD *)(v1 + 240);
    sub_23C1257C4(v1 + 352, *(_QWORD *)(v1 + 232), *(_QWORD *)(v1 + 224));
    swift_release();
    swift_release();
  }
  *(_QWORD *)(v1 + 352) = v75;
  *(_QWORD *)(v1 + 360) = v86;
  *(_QWORD *)(v1 + 368) = v76;
  *(_QWORD *)(v1 + 376) = v78;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v95 = sub_23C127BF8();
  *(_QWORD *)(v9 - 232) = OpaqueTypeConformance2;
  *(_QWORD *)(v9 - 224) = v95;
  v96 = *(_QWORD *)(v1 + 264);
  MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v96, v9 - 232);
  v97 = *(_QWORD *)(v1 + 256);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v97 + 16))(*(_QWORD *)(v1 + 296), v84, v96);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v97 + 8))(v84, v96);
}

void sub_23C126418(uint64_t a1)
{
  sub_23C1299CC(a1);
  sub_23C138C78();
  type metadata accessor for ForYouView();
}

uint64_t sub_23C1264C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[7];
  uint64_t v12;
  uint64_t v13;

  sub_23C121C54();
  swift_getKeyPath();
  sub_23C138F9C();
  swift_release();
  swift_release();
  sub_23C138F54();
  sub_23C138F48();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DA8);
  sub_23C138EE8();
  v11[4] = v8;
  v11[5] = v9;
  v11[6] = v10;
  v11[0] = v4;
  v11[1] = v5;
  v11[2] = v6;
  v11[3] = v7;
  v12 = v1;
  v13 = v2;
  sub_23C12ADAC((uint64_t)v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DB0);
  sub_23C138EE8();
  sub_23C1299CC(v0);
  sub_23C138F3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DA0);
  sub_23C138EE8();
  return sub_23C12ADAC(v0);
}

void sub_23C126628()
{
  type metadata accessor for ForYouView();
}

uint64_t sub_23C12665C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 17) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DB0);
  return sub_23C138EE8();
}

void sub_23C126698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v20 = a8;
  v21 = a9;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DB8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v18 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(_OWORD *)(a1 + 72);
  sub_23C1299CC(a1);
  sub_23C138F30();
  v22 = a2;
  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v27 = a7;
  type metadata accessor for ForYouView();
}

uint64_t sub_23C126750()
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
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  *(_OWORD *)(v10 - 144) = *(_OWORD *)(v10 - 192);
  *(_QWORD *)(v10 - 128) = v3;
  *(_QWORD *)(v10 - 96) = v1;
  *(_QWORD *)(v10 - 88) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DA0);
  sub_23C138EE8();
  sub_23C12ADAC((uint64_t)v2);
  v11 = sub_23C13908C();
  v12 = *(_QWORD *)(v10 - 168);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v12, 1, 1, v11);
  sub_23C139068();
  sub_23C1299CC((uint64_t)v2);
  v13 = sub_23C13905C();
  v14 = swift_allocObject();
  v15 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v14 + 16) = v13;
  *(_QWORD *)(v14 + 24) = v15;
  *(_QWORD *)(v14 + 32) = v6;
  *(_QWORD *)(v14 + 40) = v9;
  *(_QWORD *)(v14 + 48) = v8;
  *(_QWORD *)(v14 + 56) = v7;
  *(_QWORD *)(v14 + 64) = v5;
  *(_QWORD *)(v14 + 72) = v4;
  v16 = v2[5];
  *(_OWORD *)(v14 + 144) = v2[4];
  *(_OWORD *)(v14 + 160) = v16;
  v17 = v2[7];
  *(_OWORD *)(v14 + 176) = v2[6];
  *(_OWORD *)(v14 + 192) = v17;
  v18 = v2[1];
  *(_OWORD *)(v14 + 80) = *v2;
  *(_OWORD *)(v14 + 96) = v18;
  v19 = v2[3];
  *(_OWORD *)(v14 + 112) = v2[2];
  *(_OWORD *)(v14 + 128) = v19;
  sub_23C125690(v12, *(_QWORD *)(v10 - 152), v14);
  return swift_release();
}

uint64_t sub_23C126844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v8[13] = v12;
  v8[14] = v13;
  v8[11] = a7;
  v8[12] = a8;
  v8[9] = a5;
  v8[10] = a6;
  v8[8] = a4;
  v9 = sub_23C139140();
  v8[15] = v9;
  v8[16] = *(_QWORD *)(v9 - 8);
  v8[17] = swift_task_alloc();
  sub_23C139068();
  v8[18] = sub_23C13905C();
  v8[19] = sub_23C139044();
  v8[20] = v10;
  return swift_task_switch();
}

uint64_t sub_23C1268EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  v1 = sub_23C139344();
  v3 = v2;
  sub_23C139134();
  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_256B22DD0 + dword_256B22DD0);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 168) = v4;
  *v4 = v0;
  v4[1] = sub_23C126984;
  return v6(v1, v3, 0, 0, 1);
}

uint64_t sub_23C126984()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 128);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 136);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 120);
  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch();
}

void sub_23C126A0C()
{
  type metadata accessor for ForYouView();
}

uint64_t sub_23C126A94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _OWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  sub_23C121C54();
  swift_getKeyPath();
  sub_23C138F9C();
  swift_release();
  swift_release();
  if (*(_BYTE *)(v8 - 224) == 1)
  {
    *(_QWORD *)(v8 - 280) = *(_QWORD *)(v8 + 32);
    *(_QWORD *)(v8 - 288) = *(_QWORD *)(v8 + 24);
    v9 = swift_allocObject();
    *(_QWORD *)(v8 - 296) = &v17;
    *(_QWORD *)(v9 + 16) = v7;
    *(_QWORD *)(v9 + 24) = v6;
    *(_QWORD *)(v9 + 32) = v5;
    *(_QWORD *)(v9 + 40) = v4;
    *(_QWORD *)(v9 + 48) = v2;
    *(_QWORD *)(v9 + 56) = v1;
    v10 = v3[5];
    *(_OWORD *)(v9 + 128) = v3[4];
    *(_OWORD *)(v9 + 144) = v10;
    v11 = v3[7];
    *(_OWORD *)(v9 + 160) = v3[6];
    *(_OWORD *)(v9 + 176) = v11;
    v12 = v3[1];
    *(_OWORD *)(v9 + 64) = *v3;
    *(_OWORD *)(v9 + 80) = v12;
    v13 = v3[3];
    *(_OWORD *)(v9 + 96) = v3[2];
    *(_OWORD *)(v9 + 112) = v13;
    MEMORY[0x24BDAC7A8](v9);
    sub_23C1299CC((uint64_t)v3);
    sub_23C138EF4();
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22C10);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v0, 0, 1, v14);
  }
  else
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22C10);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v0, 1, 1, v16);
  }
}

uint64_t sub_23C126C10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23C138EB8();
  *a1 = result;
  return result;
}

uint64_t sub_23C126C44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23C138EB8();
  *a1 = result;
  return result;
}

void sub_23C126C80()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v0 = sub_23C138BDC();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_23C138FD8();
  MEMORY[0x24BDAC7A8](v1);
  sub_23C138FCC();
  if (qword_256B21878 != -1)
    swift_once();
  v2 = (id)qword_256B2FCE8;
  type metadata accessor for ForYouView();
}

uint64_t sub_23C126E8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23C138EB8();
  *a1 = result;
  return result;
}

uint64_t ForYouView.body.getter@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
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
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t OpaqueTypeConformance2;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
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
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  char *v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void (*v124)(char *, char *, uint64_t);
  char *v125;
  void (*v126)(char *, uint64_t);
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  char *v132;
  char *v133;
  char *v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  uint64_t v140;
  char *v141;
  uint64_t v142;
  unint64_t v143;
  uint64_t v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  __int128 *v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  char *v157;
  uint64_t v158;
  char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  _QWORD *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  __int128 *v174;
  char v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  _QWORD v184[2];
  uint64_t v185;
  _QWORD v186[2];
  _QWORD v187[2];
  _QWORD v188[2];
  _QWORD v189[2];
  _QWORD v190[2];
  _QWORD v191[2];
  _QWORD v192[2];
  _QWORD v193[2];
  _QWORD v194[2];
  _QWORD v195[2];
  _QWORD v196[2];
  _QWORD v197[2];
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;

  v157 = a2;
  v3 = sub_23C138CFC();
  v155 = *(_QWORD *)(v3 - 8);
  v156 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v154 = (char *)&v128 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v166 = a1[3];
  v159 = (char *)sub_23C138D44();
  v163 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BC0);
  v162 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BC8);
  v161 = sub_23C138BF4();
  v165 = a1[4];
  v167 = a1;
  v5 = sub_23C138CA8();
  sub_23C138CA8();
  sub_23C138CA8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BD0);
  sub_23C138CA8();
  sub_23C138CA8();
  sub_23C138CA8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BD8);
  sub_23C138D44();
  sub_23C138EAC();
  v160 = sub_23C138CA8();
  v6 = sub_23C138CA8();
  v7 = sub_23C138CA8();
  v8 = sub_23C138CA8();
  v9 = sub_23C138CA8();
  v164 = a1[7];
  v197[0] = v164;
  v197[1] = MEMORY[0x24BDF0910];
  v10 = MEMORY[0x24BDED308];
  v11 = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v5, v197);
  v12 = MEMORY[0x24BDEBEE0];
  v196[0] = v11;
  v196[1] = MEMORY[0x24BDEBEE0];
  v13 = MEMORY[0x2426179DC](v10, v6, v196);
  v14 = sub_23C107448(&qword_256B22BE0, &qword_256B22BD0, MEMORY[0x24BDEEC10]);
  v195[0] = v13;
  v195[1] = v14;
  v194[0] = MEMORY[0x2426179DC](v10, v7, v195);
  v194[1] = MEMORY[0x24BDEC438];
  v193[0] = MEMORY[0x2426179DC](v10, v8, v194);
  v193[1] = v12;
  v15 = MEMORY[0x2426179DC](v10, v9, v193);
  v16 = sub_23C127BB4();
  v17 = MEMORY[0x24BEE50B0];
  *(_QWORD *)&v198 = v9;
  *((_QWORD *)&v198 + 1) = MEMORY[0x24BEE50B0];
  *(_QWORD *)&v199 = v15;
  *((_QWORD *)&v199 + 1) = v16;
  MEMORY[0x242617988](255, &v198, MEMORY[0x24BDF38E8], 0);
  v18 = sub_23C138D44();
  *(_QWORD *)&v198 = v9;
  *((_QWORD *)&v198 + 1) = v17;
  *(_QWORD *)&v199 = v15;
  *((_QWORD *)&v199 + 1) = v16;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v20 = sub_23C127BF8();
  v192[0] = OpaqueTypeConformance2;
  v192[1] = v20;
  v21 = MEMORY[0x24BDEF3E0];
  MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v18, v192);
  sub_23C138C9C();
  sub_23C138CA8();
  sub_23C138D44();
  v22 = MEMORY[0x24BDF1FA8];
  swift_getTupleTypeMetadata2();
  v23 = sub_23C138F60();
  v24 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BF8);
  v25 = MEMORY[0x2426179DC](MEMORY[0x24BDF5428], v23);
  v26 = sub_23C127C5C();
  *(_QWORD *)&v198 = v23;
  *((_QWORD *)&v198 + 1) = v22;
  *(_QWORD *)&v199 = v24;
  *((_QWORD *)&v199 + 1) = v25;
  *(_QWORD *)&v200 = MEMORY[0x24BDF1F80];
  *((_QWORD *)&v200 + 1) = v26;
  v27 = sub_23C138D68();
  v28 = sub_23C138D44();
  v29 = sub_23C138D44();
  v30 = v167;
  v162 = v167[2];
  v151 = sub_23C138D44();
  v152 = sub_23C138D44();
  v31 = v159;
  v161 = sub_23C138D44();
  v32 = sub_23C138EAC();
  v138 = *(_QWORD *)(v32 - 8);
  v163 = v32;
  MEMORY[0x24BDAC7A8](v32);
  v132 = (char *)&v128 - v33;
  v160 = sub_23C138CA8();
  v150 = *(_QWORD *)(v160 - 8);
  MEMORY[0x24BDAC7A8](v160);
  v133 = (char *)&v128 - v34;
  v158 = v30[6];
  v191[0] = MEMORY[0x24BDF3E20];
  v191[1] = v158;
  v35 = MEMORY[0x2426179DC](v21, v31, v191);
  v36 = sub_23C127CD8();
  v37 = sub_23C127D5C();
  v38 = sub_23C100BA4(&qword_256B22C20, (uint64_t (*)(uint64_t))MEMORY[0x24BE35078], MEMORY[0x24BE35068]);
  v39 = MEMORY[0x2426179DC](MEMORY[0x24BDEFC28], v27);
  v190[0] = v38;
  v190[1] = v39;
  v40 = MEMORY[0x2426179DC](v21, v28, v190);
  v189[0] = v37;
  v189[1] = v40;
  v41 = MEMORY[0x2426179DC](v21, v29, v189);
  v42 = v30[5];
  v188[0] = v41;
  v188[1] = v42;
  v43 = v42;
  v44 = MEMORY[0x2426179DC](v21, v151, v188);
  v187[0] = v36;
  v187[1] = v44;
  v45 = MEMORY[0x2426179DC](v21, v152, v187);
  v186[0] = v35;
  v186[1] = v45;
  v185 = MEMORY[0x2426179DC](v21, v161, v186);
  v129 = MEMORY[0x2426179DC](MEMORY[0x24BDF3F50], v163, &v185);
  v184[0] = v129;
  v184[1] = MEMORY[0x24BDF0910];
  v46 = v160;
  v47 = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v160, v184);
  v48 = sub_23C116624();
  *(_QWORD *)&v198 = v46;
  *((_QWORD *)&v198 + 1) = &type metadata for BrowsingIdentity;
  *(_QWORD *)&v199 = v47;
  *((_QWORD *)&v199 + 1) = v48;
  v49 = v47;
  v130 = v48;
  v131 = v47;
  v50 = v48;
  v51 = MEMORY[0x24BDF38E8];
  v52 = MEMORY[0x242617988](0, &v198, MEMORY[0x24BDF38E8], 0);
  v140 = *(_QWORD *)(v52 - 8);
  v53 = v52;
  MEMORY[0x24BDAC7A8](v52);
  v159 = (char *)&v128 - v54;
  *(_QWORD *)&v198 = v46;
  *((_QWORD *)&v198 + 1) = &type metadata for BrowsingIdentity;
  *(_QWORD *)&v199 = v49;
  *((_QWORD *)&v199 + 1) = v50;
  v55 = swift_getOpaqueTypeConformance2();
  v56 = sub_23C10D940();
  *(_QWORD *)&v198 = v53;
  *((_QWORD *)&v198 + 1) = &type metadata for NetworkConditions;
  v57 = v53;
  v135 = v53;
  v136 = v56;
  *(_QWORD *)&v199 = v55;
  *((_QWORD *)&v199 + 1) = v56;
  v137 = v55;
  v58 = v56;
  v59 = MEMORY[0x242617988](0, &v198, v51, 0);
  v152 = *(_QWORD *)(v59 - 8);
  v60 = v59;
  MEMORY[0x24BDAC7A8](v59);
  v134 = (char *)&v128 - v61;
  *(_QWORD *)&v198 = v57;
  *((_QWORD *)&v198 + 1) = &type metadata for NetworkConditions;
  *(_QWORD *)&v199 = v55;
  *((_QWORD *)&v199 + 1) = v58;
  v62 = swift_getOpaqueTypeConformance2();
  v63 = sub_23C1216C4();
  *(_QWORD *)&v198 = v60;
  *((_QWORD *)&v198 + 1) = &type metadata for SubscriptionState;
  v64 = v60;
  v142 = v60;
  v143 = v63;
  *(_QWORD *)&v199 = v62;
  *((_QWORD *)&v199 + 1) = v63;
  v144 = v62;
  v65 = v63;
  v66 = MEMORY[0x242617988](0, &v198, v51, 0);
  v151 = *(_QWORD *)(v66 - 8);
  v67 = v66;
  v146 = v66;
  MEMORY[0x24BDAC7A8](v66);
  v141 = (char *)&v128 - v68;
  *(_QWORD *)&v198 = v64;
  *((_QWORD *)&v198 + 1) = &type metadata for SubscriptionState;
  *(_QWORD *)&v199 = v62;
  *((_QWORD *)&v199 + 1) = v65;
  v147 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)&v198 = v67;
  *((_QWORD *)&v198 + 1) = v147;
  v69 = MEMORY[0x242617988](0, &v198, MEMORY[0x24BDF33A8], 0);
  v148 = *(_QWORD *)(v69 - 8);
  v149 = v69;
  v70 = MEMORY[0x24BDAC7A8](v69);
  v139 = (char *)&v128 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v70);
  v145 = (char *)&v128 - v72;
  v73 = v153[5];
  v202 = v153[4];
  v203 = v73;
  v74 = v153[7];
  v204 = v153[6];
  v205 = v74;
  v75 = v153[1];
  v198 = *v153;
  v199 = v75;
  v76 = v153[3];
  v200 = v153[2];
  v201 = v76;
  v77 = v162;
  v79 = v165;
  v78 = v166;
  v168 = v162;
  v169 = v166;
  v170 = v165;
  v171 = v43;
  v80 = v43;
  v128 = v43;
  v81 = v158;
  v82 = v164;
  v172 = v158;
  v173 = v164;
  v174 = &v198;
  v83 = v132;
  sub_23C138EA0();
  v84 = swift_allocObject();
  *(_QWORD *)(v84 + 16) = v77;
  *(_QWORD *)(v84 + 24) = v78;
  *(_QWORD *)(v84 + 32) = v79;
  *(_QWORD *)(v84 + 40) = v80;
  *(_QWORD *)(v84 + 48) = v81;
  *(_QWORD *)(v84 + 56) = v82;
  v85 = v203;
  *(_OWORD *)(v84 + 128) = v202;
  *(_OWORD *)(v84 + 144) = v85;
  v86 = v205;
  *(_OWORD *)(v84 + 160) = v204;
  *(_OWORD *)(v84 + 176) = v86;
  v87 = v199;
  *(_OWORD *)(v84 + 64) = v198;
  *(_OWORD *)(v84 + 80) = v87;
  v88 = v201;
  *(_OWORD *)(v84 + 96) = v200;
  *(_OWORD *)(v84 + 112) = v88;
  sub_23C1299CC((uint64_t)&v198);
  v89 = v133;
  v90 = v163;
  sub_23C138E58();
  swift_release();
  (*(void (**)(char *, uint64_t))(v138 + 8))(v83, v90);
  v180 = v202;
  v181 = v203;
  v182 = v204;
  v183 = v205;
  v176 = v198;
  v177 = v199;
  v178 = v200;
  v179 = v201;
  sub_23C121C54();
  swift_getKeyPath();
  sub_23C138F9C();
  swift_release();
  swift_release();
  v175 = v176;
  v91 = swift_allocObject();
  *(_QWORD *)(v91 + 16) = v77;
  *(_QWORD *)(v91 + 24) = v78;
  v92 = v128;
  *(_QWORD *)(v91 + 32) = v79;
  *(_QWORD *)(v91 + 40) = v92;
  v93 = v158;
  *(_QWORD *)(v91 + 48) = v158;
  *(_QWORD *)(v91 + 56) = v82;
  v94 = v203;
  *(_OWORD *)(v91 + 128) = v202;
  *(_OWORD *)(v91 + 144) = v94;
  v95 = v205;
  *(_OWORD *)(v91 + 160) = v204;
  *(_OWORD *)(v91 + 176) = v95;
  v96 = v199;
  *(_OWORD *)(v91 + 64) = v198;
  *(_OWORD *)(v91 + 80) = v96;
  v97 = v201;
  *(_OWORD *)(v91 + 96) = v200;
  *(_OWORD *)(v91 + 112) = v97;
  sub_23C1299CC((uint64_t)&v198);
  v98 = v160;
  sub_23C138E64();
  swift_release();
  (*(void (**)(char *, uint64_t))(v150 + 8))(v89, v98);
  v180 = v202;
  v181 = v203;
  v182 = v204;
  v183 = v205;
  v176 = v198;
  v177 = v199;
  v178 = v200;
  v179 = v201;
  sub_23C121C54();
  swift_getKeyPath();
  sub_23C138F9C();
  swift_release();
  swift_release();
  v175 = v176;
  v99 = swift_allocObject();
  v100 = v162;
  v101 = v166;
  *(_QWORD *)(v99 + 16) = v162;
  *(_QWORD *)(v99 + 24) = v101;
  *(_QWORD *)(v99 + 32) = v79;
  *(_QWORD *)(v99 + 40) = v92;
  v102 = v164;
  *(_QWORD *)(v99 + 48) = v93;
  *(_QWORD *)(v99 + 56) = v102;
  v103 = v203;
  *(_OWORD *)(v99 + 128) = v202;
  *(_OWORD *)(v99 + 144) = v103;
  v104 = v205;
  *(_OWORD *)(v99 + 160) = v204;
  *(_OWORD *)(v99 + 176) = v104;
  v105 = v199;
  *(_OWORD *)(v99 + 64) = v198;
  *(_OWORD *)(v99 + 80) = v105;
  v106 = v201;
  *(_OWORD *)(v99 + 96) = v200;
  *(_OWORD *)(v99 + 112) = v106;
  sub_23C1299CC((uint64_t)&v198);
  v107 = v134;
  v108 = v135;
  v109 = v159;
  sub_23C138E64();
  swift_release();
  (*(void (**)(char *, uint64_t))(v140 + 8))(v109, v108);
  v180 = v202;
  v181 = v203;
  v182 = v204;
  v183 = v205;
  v176 = v198;
  v177 = v199;
  v178 = v200;
  v179 = v201;
  sub_23C121C54();
  swift_getKeyPath();
  sub_23C138F9C();
  swift_release();
  swift_release();
  v175 = v176;
  v110 = swift_allocObject();
  *(_QWORD *)(v110 + 16) = v100;
  *(_QWORD *)(v110 + 24) = v101;
  *(_QWORD *)(v110 + 32) = v165;
  *(_QWORD *)(v110 + 40) = v92;
  *(_QWORD *)(v110 + 48) = v93;
  *(_QWORD *)(v110 + 56) = v102;
  v111 = v203;
  *(_OWORD *)(v110 + 128) = v202;
  *(_OWORD *)(v110 + 144) = v111;
  v112 = v205;
  *(_OWORD *)(v110 + 160) = v204;
  *(_OWORD *)(v110 + 176) = v112;
  v113 = v199;
  *(_OWORD *)(v110 + 64) = v198;
  *(_OWORD *)(v110 + 80) = v113;
  v114 = v201;
  *(_OWORD *)(v110 + 96) = v200;
  *(_OWORD *)(v110 + 112) = v114;
  sub_23C1299CC((uint64_t)&v198);
  v116 = v141;
  v115 = v142;
  sub_23C138E64();
  swift_release();
  (*(void (**)(char *, uint64_t))(v152 + 8))(v107, v115);
  v118 = v154;
  v117 = v155;
  v119 = v156;
  (*(void (**)(char *, _QWORD, uint64_t))(v155 + 104))(v154, *MEMORY[0x24BDEE5F0], v156);
  v120 = v139;
  v121 = v146;
  sub_23C120304();
  (*(void (**)(char *, uint64_t))(v117 + 8))(v118, v119);
  (*(void (**)(char *, uint64_t))(v151 + 8))(v116, v121);
  v122 = v148;
  v123 = v149;
  v124 = *(void (**)(char *, char *, uint64_t))(v148 + 16);
  v125 = v145;
  v124(v145, v120, v149);
  v126 = *(void (**)(char *, uint64_t))(v122 + 8);
  v126(v120, v123);
  v124(v157, v125, v123);
  return ((uint64_t (*)(char *, uint64_t))v126)(v125, v123);
}

unint64_t sub_23C127BB4()
{
  unint64_t result;

  result = qword_256B22BE8;
  if (!qword_256B22BE8)
  {
    result = MEMORY[0x2426179DC](MEMORY[0x24BEE50E0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_256B22BE8);
  }
  return result;
}

unint64_t sub_23C127BF8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B22BF0;
  if (!qword_256B22BF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BD8);
    v2[0] = MEMORY[0x24BDF3E20];
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B22BF0);
  }
  return result;
}

unint64_t sub_23C127C5C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256B22C00;
  if (!qword_256B22C00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BF8);
    v2 = sub_23C107448(&qword_256B22C08, &qword_256B22C10, MEMORY[0x24BDF43B0]);
    result = MEMORY[0x2426179DC](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256B22C00);
  }
  return result;
}

unint64_t sub_23C127CD8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256B22C18;
  if (!qword_256B22C18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BC0);
    v2 = sub_23C100BA4(&qword_256B22C20, (uint64_t (*)(uint64_t))MEMORY[0x24BE35078], MEMORY[0x24BE35068]);
    v3[0] = MEMORY[0x24BDF3E20];
    v3[1] = v2;
    result = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256B22C18);
  }
  return result;
}

unint64_t sub_23C127D5C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256B22C28;
  if (!qword_256B22C28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BC8);
    v2 = MEMORY[0x24BDEFC28];
    v3[0] = sub_23C107448(&qword_256B22C30, &qword_256B22C38, MEMORY[0x24BDEFC28]);
    v3[1] = sub_23C107448(&qword_256B22C40, qword_256B22C48, v2);
    result = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256B22C28);
  }
  return result;
}

void sub_23C127E00(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t OpaqueTypeConformance2;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
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
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[10];
  uint64_t v85;
  char *v86;
  uint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  char *v93;
  char *v94;
  char *v95;
  uint64_t v96;
  char *v97;
  char *v98;
  uint64_t v99;
  char *v100;
  char *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
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
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _QWORD v144[2];
  _QWORD v145[2];
  _QWORD v146[2];
  _QWORD v147[2];
  _QWORD v148[2];
  _QWORD v149[4];

  v112 = a7;
  v113 = a3;
  v128 = a6;
  v129 = a5;
  v114 = a4;
  v123 = a2;
  v120 = a8;
  v99 = *(_QWORD *)(a2 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v100 = (char *)v84 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v101 = (char *)v84 - v12;
  v121 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BC8);
  v122 = sub_23C138BF4();
  v13 = sub_23C138CA8();
  sub_23C138CA8();
  sub_23C138CA8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BD0);
  sub_23C138CA8();
  sub_23C138CA8();
  sub_23C138CA8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BD8);
  sub_23C138D44();
  sub_23C138EAC();
  v127 = sub_23C138CA8();
  v14 = sub_23C138CA8();
  v15 = sub_23C138CA8();
  v16 = sub_23C138CA8();
  v17 = sub_23C138CA8();
  v149[0] = a7;
  v149[1] = MEMORY[0x24BDF0910];
  v18 = MEMORY[0x24BDED308];
  v19 = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v13, v149);
  v20 = MEMORY[0x24BDEBEE0];
  v148[0] = v19;
  v148[1] = MEMORY[0x24BDEBEE0];
  v21 = MEMORY[0x2426179DC](v18, v14, v148);
  v22 = sub_23C107448(&qword_256B22BE0, &qword_256B22BD0, MEMORY[0x24BDEEC10]);
  v147[0] = v21;
  v147[1] = v22;
  v146[0] = MEMORY[0x2426179DC](v18, v15, v147);
  v146[1] = MEMORY[0x24BDEC438];
  v145[0] = MEMORY[0x2426179DC](v18, v16, v146);
  v145[1] = v20;
  v23 = MEMORY[0x2426179DC](v18, v17, v145);
  v24 = sub_23C127BB4();
  v25 = MEMORY[0x24BEE50B0];
  *(_QWORD *)&v136 = v17;
  *((_QWORD *)&v136 + 1) = MEMORY[0x24BEE50B0];
  *(_QWORD *)&v137 = v23;
  *((_QWORD *)&v137 + 1) = v24;
  MEMORY[0x242617988](255, &v136, MEMORY[0x24BDF38E8], 0);
  v26 = sub_23C138D44();
  *(_QWORD *)&v136 = v17;
  v27 = v123;
  *((_QWORD *)&v136 + 1) = v25;
  *(_QWORD *)&v137 = v23;
  *((_QWORD *)&v137 + 1) = v24;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v29 = sub_23C127BF8();
  v144[0] = OpaqueTypeConformance2;
  v144[1] = v29;
  MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v26, v144);
  sub_23C138C9C();
  sub_23C138CA8();
  sub_23C138D44();
  v30 = MEMORY[0x24BDF1FA8];
  swift_getTupleTypeMetadata2();
  v31 = sub_23C138F60();
  v32 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BF8);
  v33 = MEMORY[0x2426179DC](MEMORY[0x24BDF5428], v31);
  v34 = sub_23C127C5C();
  *(_QWORD *)&v136 = v31;
  *((_QWORD *)&v136 + 1) = v30;
  *(_QWORD *)&v137 = v32;
  *((_QWORD *)&v137 + 1) = v33;
  *(_QWORD *)&v138 = MEMORY[0x24BDF1F80];
  *((_QWORD *)&v138 + 1) = v34;
  v35 = sub_23C138D68();
  v36 = v122;
  v37 = sub_23C138D44();
  v38 = sub_23C138D44();
  v39 = sub_23C138D44();
  v106 = *(_QWORD *)(v39 - 8);
  v40 = MEMORY[0x24BDAC7A8](v39);
  v105 = (char *)v84 - v41;
  v125 = v35;
  v84[3] = *(_QWORD *)(v35 - 8);
  v42 = MEMORY[0x24BDAC7A8](v40);
  v84[4] = (char *)v84 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = MEMORY[0x24BDAC7A8](v42);
  v84[5] = (char *)v84 - v45;
  v124 = v37;
  v84[8] = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v84[7] = (char *)v84 - v46;
  v91 = __swift_instantiateConcreteTypeFromMangledName(qword_256B22C48);
  v84[6] = *(_QWORD *)(v91 - 8);
  MEMORY[0x24BDAC7A8](v91);
  v89 = (char *)v84 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22CE0);
  v48 = MEMORY[0x24BDAC7A8](v85);
  v88 = (char *)v84 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v48);
  v92 = (char *)v84 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22C38);
  v87 = *(_QWORD *)(v90 - 8);
  v51 = MEMORY[0x24BDAC7A8](v90);
  v86 = (char *)v84 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  v127 = v38;
  v103 = *(_QWORD *)(v38 - 8);
  v53 = MEMORY[0x24BDAC7A8](v51);
  v102 = (char *)v84 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = MEMORY[0x24BDAC7A8](v53);
  v98 = (char *)v84 - v56;
  v104 = *(_QWORD *)(v36 - 8);
  v57 = MEMORY[0x24BDAC7A8](v55);
  v84[2] = (char *)v84 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v57);
  v84[9] = (char *)v84 - v59;
  v60 = sub_23C138BDC();
  MEMORY[0x24BDAC7A8](v60);
  v94 = (char *)v84 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = sub_23C138FD8();
  MEMORY[0x24BDAC7A8](v62);
  v93 = (char *)v84 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22CE8);
  MEMORY[0x24BDAC7A8](v96);
  v95 = (char *)v84 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22BC0);
  MEMORY[0x24BDAC7A8](v65);
  v97 = (char *)v84 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = v67;
  v126 = v39;
  v68 = sub_23C138D44();
  v109 = *(_QWORD *)(v68 - 8);
  v69 = MEMORY[0x24BDAC7A8](v68);
  v108 = (char *)v84 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = MEMORY[0x24BDAC7A8](v69);
  v110 = (char *)v84 - v72;
  v73 = MEMORY[0x24BDAC7A8](v71);
  MEMORY[0x24BDAC7A8](v73);
  v75 = v74;
  v76 = sub_23C138D44();
  v111 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v115 = v77;
  v119 = v68;
  v78 = sub_23C138D44();
  v117 = *(_QWORD *)(v78 - 8);
  v118 = v78;
  MEMORY[0x24BDAC7A8](v78);
  v116 = (char *)v84 - v79;
  v80 = a1[5];
  v140 = a1[4];
  v141 = v80;
  v81 = a1[7];
  v142 = a1[6];
  v143 = v81;
  v82 = a1[1];
  v136 = *a1;
  v137 = v82;
  v83 = a1[3];
  v138 = a1[2];
  v139 = v83;
  v130 = v27;
  v131 = v75;
  v132 = v114;
  v133 = v129;
  v134 = v128;
  v135 = v112;
  type metadata accessor for ForYouView();
}

uint64_t sub_23C128704(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  unint64_t v28;
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
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t, uint64_t);
  void (*v60)(uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
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
  void *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
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
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  void (*v125)(uint64_t, char *, uint64_t);
  char *v126;
  uint64_t v127;
  void (*v128)(char *, uint64_t);
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void (*v157)(uint64_t, uint64_t);
  uint64_t v158;
  unint64_t v159;
  unint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void (*v169)(uint64_t, uint64_t);
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  unint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;

  sub_23C121C54();
  swift_getKeyPath();
  sub_23C138F9C();
  swift_release();
  v9 = swift_release();
  v10 = MEMORY[0x24BDF3E20];
  if (*((_BYTE *)v1 + 1055))
  {
    if (*((_BYTE *)v1 + 1055) == 1)
    {
      v11 = *(_OWORD *)(v6 + 80);
      *((_OWORD *)v1 + 73) = *(_OWORD *)(v6 + 64);
      *((_OWORD *)v1 + 74) = v11;
      v12 = *(_OWORD *)(v6 + 112);
      *((_OWORD *)v1 + 75) = *(_OWORD *)(v6 + 96);
      *((_OWORD *)v1 + 76) = v12;
      v13 = *(_OWORD *)(v6 + 16);
      *((_OWORD *)v1 + 69) = *(_OWORD *)v6;
      *((_OWORD *)v1 + 70) = v13;
      v14 = *(_OWORD *)(v6 + 48);
      *((_OWORD *)v1 + 71) = *(_OWORD *)(v6 + 32);
      *((_OWORD *)v1 + 72) = v14;
      sub_23C121C54();
      swift_getKeyPath();
      sub_23C138F9C();
      swift_release();
      swift_release();
      v15 = v1[132];
      v16 = v1[133];
      v17 = v1[134];
      if (*((_BYTE *)v1 + 1080))
      {
        v18 = v1[51];
        v19 = v1[35];
        if (*((_BYTE *)v1 + 1080) == 1)
        {
          v20 = v1[52];
          swift_bridgeObjectRelease();
          v21 = swift_bridgeObjectRelease();
          v22 = v1[25];
          (*(void (**)(uint64_t))(v6 + 24))(v21);
          v23 = v1[24];
          v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
          v25 = v1[26];
          v26 = v1[48];
          v24(v25, v22, v26);
          v27 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
          v27(v22, v26);
          v24(v22, v25, v26);
          v28 = sub_23C127D5C();
          v29 = sub_23C100BA4(&qword_256B22C20, (uint64_t (*)(uint64_t))MEMORY[0x24BE35078], MEMORY[0x24BE35068]);
          v30 = MEMORY[0x2426179DC](MEMORY[0x24BDEFC28], v1[50]);
          v1[129] = v29;
          v1[130] = v30;
          v31 = MEMORY[0x24BDEF3E0];
          v32 = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v1[49], v1 + 129);
          v1[127] = v28;
          v1[128] = v32;
          v33 = v20;
          v34 = MEMORY[0x2426179DC](v31, v20, v1 + 127);
          v35 = v1[30];
          v36 = v33;
          v37 = v1[54];
          sub_23C1257C4(v22, v36, v26);
          v27(v22, v26);
          sub_23C127CD8();
          v1[125] = v34;
          v1[126] = v37;
          MEMORY[0x2426179DC](v31, v18, v1 + 125);
          v38 = v1[35];
          sub_23C1257C4(v35, v1[32], v18);
          (*(void (**)(uint64_t, uint64_t))(v1[31] + 8))(v35, v18);
          v27(v25, v26);
          v19 = v38;
          v39 = v1[44];
          v40 = v18;
          v41 = v1[52];
          v42 = v1[53];
LABEL_24:
          v159 = sub_23C127CD8();
          v160 = sub_23C127D5C();
          v161 = sub_23C100BA4(&qword_256B22C20, (uint64_t (*)(uint64_t))MEMORY[0x24BE35078], MEMORY[0x24BE35068]);
          v162 = MEMORY[0x2426179DC](MEMORY[0x24BDEFC28], v1[50]);
          v1[123] = v161;
          v1[124] = v162;
          v163 = MEMORY[0x24BDEF3E0];
          v53 = v1[49];
          v164 = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v53, v1 + 123);
          v1[121] = v160;
          v1[122] = v164;
          v1[119] = MEMORY[0x2426179DC](v163, v41, v1 + 121);
          v1[120] = v1[54];
          v165 = MEMORY[0x2426179DC](v163, v40, v1 + 119);
          v1[117] = v159;
          v1[118] = v165;
          MEMORY[0x2426179DC](v163, v39, v1 + 117);
          v167 = v1[33];
          v166 = v1[34];
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v166 + 16))(v167, v19, v39);
          v1[115] = MEMORY[0x24BDF3E20];
          v1[116] = v42;
          v47 = v1[40];
          MEMORY[0x2426179DC](v163, v47, v1 + 115);
          v168 = v1[41];
          sub_23C1257C4(v167, v47, v39);
          v169 = *(void (**)(uint64_t, uint64_t))(v166 + 8);
          v169(v167, v39);
          v169(v19, v39);
          v51 = v1[50];
          v58 = v168;
          goto LABEL_25;
        }
        if (!(v17 | v16 | v15))
        {
          *(_QWORD *)v1[20] = sub_23C138E88();
          swift_storeEnumTagMultiPayload();
          v104 = sub_23C100BA4(&qword_256B22C20, (uint64_t (*)(uint64_t))MEMORY[0x24BE35078], MEMORY[0x24BE35068]);
          swift_retain();
          v105 = v1[22];
          sub_23C138D38();
          sub_23C127CD8();
          v106 = sub_23C127D5C();
          v107 = MEMORY[0x2426179DC](MEMORY[0x24BDEFC28], v1[50]);
          v1[79] = v104;
          v1[80] = v107;
          v108 = MEMORY[0x24BDEF3E0];
          v109 = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v1[49], v1 + 79);
          v1[77] = v106;
          v1[78] = v109;
          v41 = v1[52];
          v1[75] = MEMORY[0x2426179DC](v108, v41, v1 + 77);
          v1[76] = v1[54];
          v40 = v1[51];
          MEMORY[0x2426179DC](v108, v40, v1 + 75);
          sub_23C125314(v105, v1[32]);
          sub_23C106ED8(v105, &qword_256B22BC0);
          swift_release();
          v42 = v1[53];
          v39 = v1[44];
          goto LABEL_24;
        }
        sub_23C138FCC();
        if (qword_256B21878 != -1)
          swift_once();
        v89 = (void *)qword_256B2FCE8;
        v90 = *(_OWORD *)(v6 + 80);
        *((_OWORD *)v1 + 73) = *(_OWORD *)(v6 + 64);
        *((_OWORD *)v1 + 74) = v90;
        v91 = *(_OWORD *)(v6 + 112);
        *((_OWORD *)v1 + 75) = *(_OWORD *)(v6 + 96);
        *((_OWORD *)v1 + 76) = v91;
        v92 = *(_OWORD *)(v6 + 16);
        *((_OWORD *)v1 + 69) = *(_OWORD *)v6;
        *((_OWORD *)v1 + 70) = v92;
        v93 = *(_OWORD *)(v6 + 48);
        *((_OWORD *)v1 + 71) = *(_OWORD *)(v6 + 32);
        *((_OWORD *)v1 + 72) = v93;
        v94 = v89;
        sub_23C121C54();
        swift_getKeyPath();
        sub_23C138F9C();
        swift_release();
        swift_release();
        sub_23C138FE4();
        v95 = v1[9];
        sub_23C138BE8();
        v96 = v1[47];
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v1[29] + 16))(v1[20], v95, v96);
        swift_storeEnumTagMultiPayload();
        v97 = sub_23C100BA4(&qword_256B22C20, (uint64_t (*)(uint64_t))MEMORY[0x24BE35078], MEMORY[0x24BE35068]);
        v98 = v1[22];
        sub_23C138D38();
        sub_23C127CD8();
        v99 = sub_23C127D5C();
        v100 = MEMORY[0x2426179DC](MEMORY[0x24BDEFC28], v1[50]);
        v1[85] = v97;
        v1[86] = v100;
        v101 = MEMORY[0x24BDEF3E0];
        v102 = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v1[49], v1 + 85);
        v1[83] = v99;
        v1[84] = v102;
        v41 = v1[52];
        v1[81] = MEMORY[0x2426179DC](v101, v41, v1 + 83);
        v1[82] = v1[54];
        v40 = v1[51];
        MEMORY[0x2426179DC](v101, v40, v1 + 81);
        v103 = v1[35];
        sub_23C125314(v98, v1[32]);
        sub_23C106ED8(v98, &qword_256B22BC0);
        (*(void (**)(uint64_t, uint64_t))(v1[29] + 8))(v95, v96);
        v19 = v103;
      }
      else
      {
        v73 = v1[52];
        if (v1[134])
        {
          if (v1[134] == 1)
          {
            v74 = *(_OWORD *)(v6 + 80);
            *((_OWORD *)v1 + 73) = *(_OWORD *)(v6 + 64);
            *((_OWORD *)v1 + 74) = v74;
            v75 = *(_OWORD *)(v6 + 112);
            *((_OWORD *)v1 + 75) = *(_OWORD *)(v6 + 96);
            *((_OWORD *)v1 + 76) = v75;
            v76 = *(_OWORD *)(v6 + 16);
            *((_OWORD *)v1 + 69) = *(_OWORD *)v6;
            *((_OWORD *)v1 + 70) = v76;
            v77 = *(_OWORD *)(v6 + 48);
            *((_OWORD *)v1 + 71) = *(_OWORD *)(v6 + 32);
            *((_OWORD *)v1 + 72) = v77;
            v78 = v1[14];
            sub_23C1222C4();
            v79 = v1[6];
            v80 = v1[16];
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v79 + 16))(v1[13], v78, v80);
            swift_storeEnumTagMultiPayload();
            v81 = MEMORY[0x24BDEFC28];
            sub_23C107448(&qword_256B22C30, &qword_256B22C38, MEMORY[0x24BDEFC28]);
            sub_23C107448(&qword_256B22C40, qword_256B22C48, v81);
            v82 = v1[17];
            sub_23C138D38();
            sub_23C127D5C();
            v83 = sub_23C100BA4(&qword_256B22C20, (uint64_t (*)(uint64_t))MEMORY[0x24BE35078], MEMORY[0x24BE35068]);
            v84 = v1[50];
            v85 = MEMORY[0x2426179DC](v81, v84);
            v1[90] = v83;
            v1[91] = v85;
            v86 = v1[49];
            MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v86, v1 + 90);
            v87 = v1[23];
            sub_23C125314(v82, v1[46]);
            v88 = v82;
            v73 = v1[52];
            sub_23C106ED8(v88, &qword_256B22BC8);
            (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v1[14], v80);
          }
          else
          {
            v86 = v1[49];
            if (v15 | v16)
            {
              v118 = *(_OWORD *)(v6 + 80);
              *((_OWORD *)v1 + 73) = *(_OWORD *)(v6 + 64);
              *((_OWORD *)v1 + 74) = v118;
              v119 = *(_OWORD *)(v6 + 112);
              *((_OWORD *)v1 + 75) = *(_OWORD *)(v6 + 96);
              *((_OWORD *)v1 + 76) = v119;
              v120 = *(_OWORD *)(v6 + 16);
              *((_OWORD *)v1 + 69) = *(_OWORD *)v6;
              *((_OWORD *)v1 + 70) = v120;
              v121 = *(_OWORD *)(v6 + 48);
              *((_OWORD *)v1 + 71) = *(_OWORD *)(v6 + 32);
              *((_OWORD *)v1 + 72) = v121;
              v122 = (char *)v1[4];
              sub_23C123214(a1, v122);
              v84 = v1[50];
              v123 = MEMORY[0x2426179DC](MEMORY[0x24BDEFC28], v84);
              v124 = v1[3];
              v125 = *(void (**)(uint64_t, char *, uint64_t))(v124 + 16);
              v126 = (char *)v1[5];
              v125((uint64_t)v126, v122, v84);
              v127 = v73;
              v128 = *(void (**)(char *, uint64_t))(v124 + 8);
              v128(v122, v84);
              v125((uint64_t)v122, v126, v84);
              v129 = sub_23C100BA4(&qword_256B22C20, (uint64_t (*)(uint64_t))MEMORY[0x24BE35078], MEMORY[0x24BE35068]);
              v130 = v1[7];
              sub_23C1257C4((uint64_t)v122, v1[47], v84);
              v128(v122, v84);
              sub_23C127D5C();
              v1[101] = v129;
              v1[102] = v123;
              MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v86, v1 + 101);
              v131 = v1[23];
              sub_23C1257C4(v130, v1[46], v86);
              (*(void (**)(uint64_t, uint64_t))(v1[8] + 8))(v130, v86);
              v128(v126, v84);
              v73 = v127;
              v87 = v131;
            }
            else
            {
              sub_23C138FCC();
              if (qword_256B21878 != -1)
                swift_once();
              v132 = (void *)qword_256B2FCE8;
              v133 = *(_OWORD *)(v6 + 80);
              *((_OWORD *)v1 + 73) = *(_OWORD *)(v6 + 64);
              *((_OWORD *)v1 + 74) = v133;
              v134 = *(_OWORD *)(v6 + 112);
              *((_OWORD *)v1 + 75) = *(_OWORD *)(v6 + 96);
              *((_OWORD *)v1 + 76) = v134;
              v135 = *(_OWORD *)(v6 + 16);
              *((_OWORD *)v1 + 69) = *(_OWORD *)v6;
              *((_OWORD *)v1 + 70) = v135;
              v136 = *(_OWORD *)(v6 + 48);
              *((_OWORD *)v1 + 71) = *(_OWORD *)(v6 + 32);
              *((_OWORD *)v1 + 72) = v136;
              v137 = v132;
              sub_23C121C54();
              swift_getKeyPath();
              sub_23C138F9C();
              swift_release();
              swift_release();
              sub_23C138FE4();
              v138 = v1[2];
              sub_23C138BE8();
              v139 = sub_23C100BA4(&qword_256B22C20, (uint64_t (*)(uint64_t))MEMORY[0x24BE35078], MEMORY[0x24BE35068]);
              v84 = v1[50];
              v140 = MEMORY[0x2426179DC](MEMORY[0x24BDEFC28], v84);
              v141 = v1[7];
              v142 = v1[47];
              sub_23C125314(v138, v142);
              sub_23C127D5C();
              v1[92] = v139;
              v1[93] = v140;
              MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v86, v1 + 92);
              v143 = v1[23];
              sub_23C1257C4(v141, v1[46], v86);
              (*(void (**)(uint64_t, uint64_t))(v1[8] + 8))(v141, v86);
              v144 = v142;
              v87 = v143;
              (*(void (**)(uint64_t, uint64_t))(v1[29] + 8))(v138, v144);
            }
          }
        }
        else
        {
          v110 = v1[11];
          sub_23C121E60();
          v111 = v1[15];
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v1[12] + 16))(v1[13], v110, v111);
          swift_storeEnumTagMultiPayload();
          v112 = MEMORY[0x24BDEFC28];
          sub_23C107448(&qword_256B22C30, &qword_256B22C38, MEMORY[0x24BDEFC28]);
          sub_23C107448(&qword_256B22C40, qword_256B22C48, v112);
          v113 = v1[17];
          sub_23C138D38();
          sub_23C127D5C();
          v114 = sub_23C100BA4(&qword_256B22C20, (uint64_t (*)(uint64_t))MEMORY[0x24BE35078], MEMORY[0x24BE35068]);
          v115 = v112;
          v84 = v1[50];
          v116 = MEMORY[0x2426179DC](v115, v84);
          v1[88] = v114;
          v1[89] = v116;
          v86 = v1[49];
          MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v86, v1 + 88);
          v87 = v1[23];
          sub_23C125314(v113, v1[46]);
          sub_23C11B438(v15, v16, v17, 0);
          v117 = v113;
          v73 = v1[52];
          sub_23C106ED8(v117, &qword_256B22BC8);
          (*(void (**)(uint64_t, uint64_t))(v1[12] + 8))(v1[11], v111);
        }
        v145 = sub_23C127D5C();
        v146 = sub_23C100BA4(&qword_256B22C20, (uint64_t (*)(uint64_t))MEMORY[0x24BE35078], MEMORY[0x24BE35068]);
        v147 = MEMORY[0x2426179DC](MEMORY[0x24BDEFC28], v84);
        v1[99] = v146;
        v1[100] = v147;
        v148 = MEMORY[0x24BDEF3E0];
        v149 = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v86, v1 + 99);
        v1[97] = v145;
        v1[98] = v149;
        v150 = MEMORY[0x2426179DC](v148, v73, v1 + 97);
        v152 = v1[27];
        v151 = v1[28];
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v151 + 16))(v152, v87, v73);
        v153 = v1[30];
        v154 = v1[54];
        sub_23C125314(v152, v73);
        v155 = v87;
        v156 = v73;
        v157 = *(void (**)(uint64_t, uint64_t))(v151 + 8);
        v157(v152, v156);
        sub_23C127CD8();
        v1[95] = v150;
        v1[96] = v154;
        v40 = v1[51];
        MEMORY[0x2426179DC](v148, v40, v1 + 95);
        v158 = v1[35];
        sub_23C1257C4(v153, v1[32], v40);
        (*(void (**)(uint64_t, uint64_t))(v1[31] + 8))(v153, v40);
        v157(v155, v156);
        v41 = v156;
        v19 = v158;
      }
      v39 = v1[44];
      v42 = v1[53];
      goto LABEL_24;
    }
    (*(void (**)(uint64_t))(v6 + 40))(v9);
    v59 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    v1[1] = v7;
    v59(v7, v3, v2);
    v60 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v60(v3, v2);
    v1[48] = (uint64_t)v60;
    v59(v3, v7, v2);
    v61 = MEMORY[0x24BDF3E48];
    *v1 = v4;
    v62 = v1[53];
    sub_23C1257C4(v3, v61, v2);
    v60(v3, v2);
    v1[73] = v10;
    v1[74] = v62;
    v63 = MEMORY[0x24BDEF3E0];
    v64 = v1[40];
    v1[47] = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v64, v1 + 73);
    v65 = sub_23C127CD8();
    v66 = sub_23C127D5C();
    v67 = sub_23C100BA4(&qword_256B22C20, (uint64_t (*)(uint64_t))MEMORY[0x24BE35078], MEMORY[0x24BE35068]);
    v51 = v1[50];
    v68 = MEMORY[0x2426179DC](MEMORY[0x24BDEFC28], v51);
    v1[71] = v67;
    v1[72] = v68;
    v53 = v1[49];
    v69 = MEMORY[0x2426179DC](v63, v53, v1 + 71);
    v1[69] = v66;
    v1[70] = v69;
    v1[67] = MEMORY[0x2426179DC](v63, v1[52], v1 + 69);
    v1[68] = v1[54];
    v70 = MEMORY[0x2426179DC](v63, v1[51], v1 + 67);
    v1[65] = v65;
    v1[66] = v70;
    v39 = v1[44];
    MEMORY[0x2426179DC](v63, v39, v1 + 65);
    v58 = v1[41];
    v71 = *v1;
    sub_23C125314(*v1, v64);
    v72 = v71;
    v47 = v64;
    (*(void (**)(uint64_t, uint64_t))(v1[36] + 8))(v72, v64);
    v42 = v1[53];
    ((void (*)(uint64_t, uint64_t))v1[48])(v1[1], v2);
  }
  else
  {
    v43 = sub_23C138E88();
    v1[48] = v43;
    v1[138] = v43;
    v44 = v4;
    v45 = v1[53];
    sub_23C125314((uint64_t)(v1 + 138), MEMORY[0x24BDF3E48]);
    v1[63] = v10;
    v1[64] = v45;
    v46 = MEMORY[0x24BDEF3E0];
    v47 = v1[40];
    v1[47] = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v47, v1 + 63);
    v48 = sub_23C127CD8();
    v49 = sub_23C127D5C();
    v50 = sub_23C100BA4(&qword_256B22C20, (uint64_t (*)(uint64_t))MEMORY[0x24BE35078], MEMORY[0x24BE35068]);
    v51 = v1[50];
    v52 = MEMORY[0x2426179DC](MEMORY[0x24BDEFC28], v51);
    v1[61] = v50;
    v1[62] = v52;
    v53 = v1[49];
    v54 = MEMORY[0x2426179DC](v46, v53, v1 + 61);
    v1[59] = v49;
    v1[60] = v54;
    v55 = MEMORY[0x2426179DC](v46, v1[52], v1 + 59);
    v56 = v1[54];
    v1[57] = v55;
    v1[58] = v56;
    v57 = MEMORY[0x2426179DC](v46, v1[51], v1 + 57);
    v1[55] = v48;
    v1[56] = v57;
    v39 = v1[44];
    MEMORY[0x2426179DC](v46, v39, v1 + 55);
    v58 = v1[41];
    sub_23C125314(v44, v47);
    (*(void (**)(uint64_t, uint64_t))(v1[36] + 8))(v44, v47);
    v42 = v45;
    swift_release();
  }
LABEL_25:
  v1[113] = MEMORY[0x24BDF3E20];
  v1[114] = v42;
  v170 = MEMORY[0x24BDEF3E0];
  v171 = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v47, v1 + 113);
  v172 = sub_23C127CD8();
  v173 = sub_23C127D5C();
  v174 = sub_23C100BA4(&qword_256B22C20, (uint64_t (*)(uint64_t))MEMORY[0x24BE35078], MEMORY[0x24BE35068]);
  v175 = MEMORY[0x2426179DC](MEMORY[0x24BDEFC28], v51);
  v1[111] = v174;
  v1[112] = v175;
  v176 = MEMORY[0x2426179DC](v170, v53, v1 + 111);
  v1[109] = v173;
  v1[110] = v176;
  v1[107] = MEMORY[0x2426179DC](v170, v1[52], v1 + 109);
  v1[108] = v1[54];
  v177 = MEMORY[0x2426179DC](v170, v1[51], v1 + 107);
  v1[105] = v172;
  v1[106] = v177;
  v178 = MEMORY[0x2426179DC](v170, v39, v1 + 105);
  v1[103] = v171;
  v1[104] = v178;
  v179 = v170;
  v180 = v1[43];
  MEMORY[0x2426179DC](v179, v180, v1 + 103);
  v181 = v1[42];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v181 + 16))(v1[45], v58, v180);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v181 + 8))(v58, v180);
}

uint64_t sub_23C129924()
{
  return sub_23C12AC3C((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C127E00);
}

void sub_23C129930()
{
  type metadata accessor for ForYouView();
}

uint64_t sub_23C12997C()
{
  sub_23C121C54();
  sub_23C138FA8();
  return swift_release();
}

void sub_23C1299C4()
{
  sub_23C12A784();
}

uint64_t sub_23C1299CC(uint64_t a1)
{
  sub_23C106C54();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void sub_23C129A64()
{
  type metadata accessor for ForYouView();
}

uint64_t sub_23C129AB4()
{
  sub_23C121C54();
  sub_23C138FA8();
  return swift_release();
}

void sub_23C129AF8()
{
  sub_23C129A64();
}

void sub_23C129B2C()
{
  sub_23C129B34();
}

void sub_23C129B34()
{
  sub_23C129B6C();
}

void sub_23C129B6C()
{
  type metadata accessor for ForYouView();
}

uint64_t sub_23C129BC4()
{
  sub_23C121C54();
  sub_23C138FA8();
  return swift_release();
}

void sub_23C129C0C()
{
  sub_23C129B34();
}

uint64_t sub_23C129C14()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C129C54()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23C129C5C()
{
  sub_23C106C48();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23C129CBC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_23C106C54();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = a2[3];
  v7 = a2[8];
  v8 = *((_OWORD *)a2 + 3);
  *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
  *(_OWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 64) = v7;
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 9);
  *(_QWORD *)(a1 + 88) = a2[11];
  *(_BYTE *)(a1 + 96) = *((_BYTE *)a2 + 96);
  v9 = a2[14];
  *(_QWORD *)(a1 + 104) = a2[13];
  *(_QWORD *)(a1 + 112) = v9;
  *(_QWORD *)(a1 + 120) = a2[15];
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23C129D98(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_23C106C54();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_23C106C48();
  v7 = a2[4];
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = v7;
  swift_retain();
  swift_release();
  v8 = a2[6];
  *(_QWORD *)(a1 + 40) = a2[5];
  *(_QWORD *)(a1 + 48) = v8;
  swift_retain();
  swift_release();
  v9 = a2[8];
  *(_QWORD *)(a1 + 56) = a2[7];
  *(_QWORD *)(a1 + 64) = v9;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 72) = a2[9];
  *(_QWORD *)(a1 + 80) = a2[10];
  *(_QWORD *)(a1 + 88) = a2[11];
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 96) = *((_BYTE *)a2 + 96);
  *(_QWORD *)(a1 + 104) = a2[13];
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 112) = a2[14];
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 120) = a2[15];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy128_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t sub_23C129EDC(uint64_t a1, uint64_t a2)
{
  char v4;

  v4 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_23C106C48();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_release();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  swift_release();
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  swift_release();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_release();
  return a1;
}

uint64_t sub_23C129F98(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 128))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_23C129FE0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 128) = 1;
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
    *(_BYTE *)(result + 128) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for ForYouView()
{
  JUMPOUT(0x24261794CLL);
}

uint64_t sub_23C12A04C(_QWORD *a1)
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
  unint64_t v11;
  ValueMetadata *v12;
  uint64_t v13;
  uint64_t OpaqueTypeConformance2;
  unint64_t v15;
  uint64_t v16;
  ValueMetadata *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[2];
  uint64_t v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  uint64_t v56;
  ValueMetadata *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[3];

  v47 = a1[3];
  v1 = a1[5];
  v45 = a1[4];
  v43 = sub_23C138D44();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BC0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BC8);
  sub_23C138BF4();
  v2 = sub_23C138CA8();
  sub_23C138CA8();
  sub_23C138CA8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BD0);
  sub_23C138CA8();
  sub_23C138CA8();
  sub_23C138CA8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BD8);
  sub_23C138D44();
  sub_23C138EAC();
  sub_23C138CA8();
  v3 = sub_23C138CA8();
  v4 = sub_23C138CA8();
  v5 = sub_23C138CA8();
  v6 = sub_23C138CA8();
  v67[0] = v1;
  v67[1] = MEMORY[0x24BDF0910];
  v7 = MEMORY[0x24BDED308];
  v8 = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v2, v67);
  v9 = MEMORY[0x24BDEBEE0];
  v66[0] = v8;
  v66[1] = MEMORY[0x24BDEBEE0];
  v65[0] = MEMORY[0x2426179DC](v7, v3, v66);
  v65[1] = sub_23C107448(&qword_256B22BE0, &qword_256B22BD0, MEMORY[0x24BDEEC10]);
  v64[0] = MEMORY[0x2426179DC](v7, v4, v65);
  v64[1] = MEMORY[0x24BDEC438];
  v63[0] = MEMORY[0x2426179DC](v7, v5, v64);
  v63[1] = v9;
  v10 = MEMORY[0x2426179DC](v7, v6, v63);
  v11 = sub_23C127BB4();
  v12 = (ValueMetadata *)MEMORY[0x24BEE50B0];
  v56 = v6;
  v57 = (ValueMetadata *)MEMORY[0x24BEE50B0];
  v58 = v10;
  v59 = v11;
  MEMORY[0x242617988](255, &v56, MEMORY[0x24BDF38E8], 0);
  v13 = sub_23C138D44();
  v56 = v6;
  v57 = v12;
  v58 = v10;
  v59 = v11;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v15 = sub_23C127BF8();
  v62[0] = OpaqueTypeConformance2;
  v62[1] = v15;
  v16 = MEMORY[0x24BDEF3E0];
  MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v13, v62);
  sub_23C138C9C();
  sub_23C138CA8();
  sub_23C138D44();
  v17 = (ValueMetadata *)MEMORY[0x24BDF1FA8];
  swift_getTupleTypeMetadata2();
  v18 = sub_23C138F60();
  v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22BF8);
  v20 = MEMORY[0x2426179DC](MEMORY[0x24BDF5428], v18);
  v21 = sub_23C127C5C();
  v56 = v18;
  v57 = v17;
  v58 = v19;
  v59 = v20;
  v60 = MEMORY[0x24BDF1F80];
  v61 = v21;
  v22 = sub_23C138D68();
  v23 = sub_23C138D44();
  v24 = sub_23C138D44();
  v25 = sub_23C138D44();
  v26 = sub_23C138D44();
  v42 = sub_23C138D44();
  v44 = sub_23C138EAC();
  v27 = sub_23C138CA8();
  v55[0] = MEMORY[0x24BDF3E20];
  v55[1] = v45;
  v46 = MEMORY[0x2426179DC](v16, v43, v55);
  v28 = sub_23C127CD8();
  v29 = sub_23C127D5C();
  v54[0] = sub_23C100BA4(&qword_256B22C20, (uint64_t (*)(uint64_t))MEMORY[0x24BE35078], MEMORY[0x24BE35068]);
  v54[1] = MEMORY[0x2426179DC](MEMORY[0x24BDEFC28], v22);
  v53[0] = v29;
  v53[1] = MEMORY[0x2426179DC](v16, v23, v54);
  v52[0] = MEMORY[0x2426179DC](v16, v24, v53);
  v52[1] = v47;
  v51[0] = v28;
  v51[1] = MEMORY[0x2426179DC](v16, v25, v52);
  v50[0] = v46;
  v50[1] = MEMORY[0x2426179DC](v16, v26, v51);
  v49 = MEMORY[0x2426179DC](v16, v42, v50);
  v48[0] = MEMORY[0x2426179DC](MEMORY[0x24BDF3F50], v44, &v49);
  v48[1] = MEMORY[0x24BDF0910];
  v30 = MEMORY[0x2426179DC](MEMORY[0x24BDED308], v27, v48);
  v31 = sub_23C116624();
  v56 = v27;
  v57 = &type metadata for BrowsingIdentity;
  v58 = v30;
  v59 = v31;
  v32 = MEMORY[0x24BDF38E8];
  v33 = MEMORY[0x242617988](255, &v56, MEMORY[0x24BDF38E8], 0);
  v56 = v27;
  v57 = &type metadata for BrowsingIdentity;
  v58 = v30;
  v59 = v31;
  v34 = swift_getOpaqueTypeConformance2();
  v35 = sub_23C10D940();
  v56 = v33;
  v57 = &type metadata for NetworkConditions;
  v58 = v34;
  v59 = v35;
  v36 = MEMORY[0x242617988](255, &v56, v32, 0);
  v56 = v33;
  v57 = &type metadata for NetworkConditions;
  v58 = v34;
  v59 = v35;
  v37 = swift_getOpaqueTypeConformance2();
  v38 = sub_23C1216C4();
  v56 = v36;
  v57 = &type metadata for SubscriptionState;
  v58 = v37;
  v59 = v38;
  v39 = MEMORY[0x242617988](255, &v56, v32, 0);
  v56 = v36;
  v57 = &type metadata for SubscriptionState;
  v58 = v37;
  v59 = v38;
  v40 = swift_getOpaqueTypeConformance2();
  v56 = v39;
  v57 = (ValueMetadata *)v40;
  return swift_getOpaqueTypeConformance2();
}

void sub_23C12A67C()
{
  sub_23C12A7C8();
}

void sub_23C12A698()
{
  sub_23C121F88();
}

void sub_23C12A6CC()
{
  sub_23C12A6F0();
}

void sub_23C12A6F0()
{
  sub_23C126A0C();
}

uint64_t sub_23C12A734@<X0>(uint64_t a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t result;

  result = type metadata accessor for ForYouState();
  *a2 = *(_QWORD *)(a1 + *(int *)(result + 64)) < *(_QWORD *)(a1 + *(int *)(result + 56));
  return result;
}

void sub_23C12A77C()
{
  sub_23C12A784();
}

void sub_23C12A784()
{
  sub_23C129930();
}

void sub_23C12A7AC()
{
  sub_23C12A7C8();
}

void sub_23C12A7C8()
{
  sub_23C126C80();
}

uint64_t sub_23C12A800(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_23C10660C(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_23C12A830(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_23C10661C(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_23C12A860()
{
  type metadata accessor for ForYouView();
}

void sub_23C12A8BC()
{
  uint64_t v0;
  char v1;

  sub_23C1223D4(v1, v0);
}

void sub_23C12A8E4()
{
  sub_23C122A80();
}

unint64_t sub_23C12A8FC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B22D10;
  if (!qword_256B22D10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22D00);
    v2[0] = sub_23C12A980();
    v2[1] = sub_23C107448(&qword_256B22D38, &qword_256B22D40, MEMORY[0x24BDF41A8]);
    result = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B22D10);
  }
  return result;
}

unint64_t sub_23C12A980()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B22D18;
  if (!qword_256B22D18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22D20);
    v2[0] = sub_23C12AA04();
    v2[1] = sub_23C12AA80(&qword_256B22D48, &qword_256B22D50, MEMORY[0x24BDF5138]);
    result = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B22D18);
  }
  return result;
}

unint64_t sub_23C12AA04()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B22D28;
  if (!qword_256B22D28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22D30);
    v2[0] = sub_23C107448(&qword_256B22D38, &qword_256B22D40, MEMORY[0x24BDF41A8]);
    v2[1] = v2[0];
    result = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B22D28);
  }
  return result;
}

uint64_t sub_23C12AA80(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3;
    v7[1] = a3;
    result = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C12AAD4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B22D58;
  if (!qword_256B22D58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22D08);
    v2[0] = sub_23C12AB40();
    v2[1] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B22D58);
  }
  return result;
}

unint64_t sub_23C12AB40()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B22D60;
  if (!qword_256B22D60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B22D68);
    v2[0] = sub_23C12AA80(&qword_256B22D70, &qword_256B22D78, MEMORY[0x24BDF1F80]);
    v2[1] = sub_23C12AA80(&qword_256B22D48, &qword_256B22D50, MEMORY[0x24BDF5138]);
    result = MEMORY[0x2426179DC](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B22D60);
  }
  return result;
}

void sub_23C12ABDC()
{
  sub_23C12A7C8();
}

void sub_23C12ABF8()
{
  sub_23C12A7C8();
}

void sub_23C12AC14()
{
  sub_23C12A7C8();
}

uint64_t sub_23C12AC30()
{
  return sub_23C12AC3C((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C1236BC);
}

uint64_t sub_23C12AC3C(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[8], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

void sub_23C12AC54()
{
  sub_23C12A7C8();
}

void sub_23C12AC70()
{
  sub_23C12A6F0();
}

void sub_23C12AC98()
{
  sub_23C12A784();
}

void sub_23C12ACA0()
{
  sub_23C12A7C8();
}

void sub_23C12ACC0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_23C125888(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), a2);
}

uint64_t sub_23C12ACD4()
{
  return sub_23C12AC3C((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C1244EC);
}

void sub_23C12ACE4()
{
  sub_23C12ACF8((uint64_t)&unk_250D04820, (uint64_t)&unk_256B22DC8);
}

void sub_23C12ACF8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23C126698((uint64_t)(v2 + 8), v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], a1, a2);
}

uint64_t sub_23C12AD34()
{
  return sub_23C12AD40((uint64_t (*)(_QWORD *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C1250A4);
}

uint64_t sub_23C12AD40(uint64_t (*a1)(_QWORD *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1 + 8, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_23C12AD5C()
{
  return sub_23C12AD40((uint64_t (*)(_QWORD *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C1252A8);
}

unint64_t sub_23C12AD68()
{
  unint64_t result;

  result = qword_256B22D98;
  if (!qword_256B22D98)
  {
    result = MEMORY[0x2426179DC](MEMORY[0x24BDF4F50], MEMORY[0x24BDF4F48]);
    atomic_store(result, (unint64_t *)&qword_256B22D98);
  }
  return result;
}

uint64_t sub_23C12ADAC(uint64_t a1)
{
  sub_23C106C48();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_23C12AE48(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;

  v4 = v1[5];
  v11 = v1[4];
  v5 = v1[6];
  v6 = v1[7];
  v7 = v1[2];
  v8 = v1[3];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_23C12AEF0;
  return sub_23C1253D8(a1, v7, v8, (uint64_t)(v1 + 10), v11, v4, v5, v6);
}

uint64_t sub_23C12AEF0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23C12AF38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = sub_23C139128();
  *(_QWORD *)(v6 + 64) = v12;
  *(_QWORD *)(v6 + 72) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 80) = swift_task_alloc();
  *(_QWORD *)(v6 + 88) = swift_task_alloc();
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = a2;
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch();
}

uint64_t sub_23C12AFDC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  _QWORD *v5;

  v1 = v0[10];
  v2 = v0[8];
  v3 = v0[9];
  sub_23C139140();
  sub_23C100BA4(&qword_256B22DD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_23C13929C();
  sub_23C100BA4(&qword_256B22DE0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_23C13914C();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v4;
  v4(v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_23C12B0F4;
  return sub_23C1392A8();
}

uint64_t sub_23C12B0F4()
{
  uint64_t v0;
  uint64_t *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  v3 = *(_QWORD *)(*v1 + 88);
  v4 = *(_QWORD *)(*v1 + 64);
  v5 = *v1;
  *(_QWORD *)(v5 + 112) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_23C12B1A0()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23C12B1E0()
{
  sub_23C12ACF8((uint64_t)&unk_250D048C0, (uint64_t)&unk_256B22DF0);
}

uint64_t sub_23C12B1F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_23C138C84();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 192) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  sub_23C106C48();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_23C12B2A4()
{
  uint64_t v0;

  sub_23C138C84();
  sub_23C126418(v0 + 64);
}

uint64_t objectdestroy_2Tm_0()
{
  sub_23C106C48();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_23C12B37C()
{
  sub_23C126628();
}

uint64_t objectdestroy_51Tm()
{
  swift_unknownObjectRelease();
  sub_23C106C48();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C12B418(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;

  v4 = v1[5];
  v11 = v1[4];
  v5 = v1[6];
  v6 = v1[7];
  v7 = v1[2];
  v8 = v1[3];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_23C12B4C4;
  return sub_23C126844(a1, v7, v8, (uint64_t)(v1 + 10), v11, v4, v5, v6);
}

uint64_t PlaceholderReferenceType.rawValue.getter(char a1)
{
  return *(_QWORD *)&aAward_4[8 * a1];
}

uint64_t sub_23C12B4F0(char *a1, char *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = PlaceholderReferenceType.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == PlaceholderReferenceType.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_23C139284();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23C12B578@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s13FitnessForYou24PlaceholderReferenceTypeO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_23C12B5A4@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = PlaceholderReferenceType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23C12B5CC()
{
  sub_23C12B95C();
  return sub_23C13902C();
}

uint64_t sub_23C12B628()
{
  sub_23C12B95C();
  return sub_23C139020();
}

uint64_t sub_23C12B674()
{
  char *v0;
  char v1;

  v1 = *v0;
  sub_23C1392F0();
  PlaceholderReferenceType.rawValue.getter(v1);
  sub_23C139008();
  swift_bridgeObjectRelease();
  return sub_23C139320();
}

uint64_t sub_23C12B6D4()
{
  char *v0;

  PlaceholderReferenceType.rawValue.getter(*v0);
  sub_23C139008();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C12B714()
{
  char *v0;
  char v1;

  v1 = *v0;
  sub_23C1392F0();
  PlaceholderReferenceType.rawValue.getter(v1);
  sub_23C139008();
  swift_bridgeObjectRelease();
  return sub_23C139320();
}

uint64_t _s13FitnessForYou24PlaceholderReferenceTypeO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_23C139188();
  swift_bridgeObjectRelease();
  if (v0 >= 9)
    return 9;
  else
    return v0;
}

unint64_t sub_23C12B7BC()
{
  unint64_t result;

  result = qword_256B22E00;
  if (!qword_256B22E00)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for PlaceholderReferenceType, &type metadata for PlaceholderReferenceType);
    atomic_store(result, (unint64_t *)&qword_256B22E00);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PlaceholderReferenceType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
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
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PlaceholderReferenceType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C12B8DC + 4 * byte_23C13F875[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_23C12B910 + 4 * byte_23C13F870[v4]))();
}

uint64_t sub_23C12B910(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C12B918(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C12B920);
  return result;
}

uint64_t sub_23C12B92C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C12B934);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_23C12B938(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C12B940(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PlaceholderReferenceType()
{
  return &type metadata for PlaceholderReferenceType;
}

unint64_t sub_23C12B95C()
{
  unint64_t result;

  result = qword_256B22E08;
  if (!qword_256B22E08)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for PlaceholderReferenceType, &type metadata for PlaceholderReferenceType);
    atomic_store(result, (unint64_t *)&qword_256B22E08);
  }
  return result;
}

uint64_t sub_23C12B9A0(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aAward_5[8 * a1] == *(_QWORD *)&aAward_5[8 * a2] && qword_23C13FEC0[a1] == qword_23C13FEC0[a2])
    v3 = 1;
  else
    v3 = sub_23C139284();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_23C12BA24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  char v21;
  BOOL v23;
  _QWORD v25[2];
  __int128 v26;
  __int128 v27;
  char v28;
  __int128 v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];
  __int128 v35;
  __int128 v36;
  char v37;
  __int128 v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      v21 = 1;
    }
    else
    {
      v5 = 0;
      v6 = v2 - 1;
      do
      {
        v7 = *(_QWORD *)(a1 + v5 + 40);
        v8 = *(_BYTE *)(a1 + v5 + 80);
        v9 = *(_QWORD *)(a1 + v5 + 104);
        v10 = *(_BYTE *)(a1 + v5 + 112);
        v11 = *(_QWORD *)(a1 + v5 + 120);
        v12 = *(_QWORD *)(a1 + v5 + 128);
        v34[0] = *(_QWORD *)(a1 + v5 + 32);
        v34[1] = v7;
        v13 = *(_OWORD *)(a1 + v5 + 64);
        v35 = *(_OWORD *)(a1 + v5 + 48);
        v36 = v13;
        v37 = v8;
        v38 = *(_OWORD *)(a1 + v5 + 88);
        v39 = v9;
        v40 = v10;
        v41 = v11;
        v42 = v12;
        v14 = *(_QWORD *)(a2 + v5 + 40);
        v15 = *(_BYTE *)(a2 + v5 + 80);
        v16 = *(_QWORD *)(a2 + v5 + 104);
        v17 = *(_BYTE *)(a2 + v5 + 112);
        v18 = *(_QWORD *)(a2 + v5 + 120);
        v19 = *(_QWORD *)(a2 + v5 + 128);
        v25[0] = *(_QWORD *)(a2 + v5 + 32);
        v25[1] = v14;
        v20 = *(_OWORD *)(a2 + v5 + 64);
        v26 = *(_OWORD *)(a2 + v5 + 48);
        v27 = v20;
        v28 = v15;
        v29 = *(_OWORD *)(a2 + v5 + 88);
        v30 = v16;
        v31 = v17;
        v32 = v18;
        v33 = v19;
        v21 = _s13FitnessForYou23CanvasSectionDescriptorV2eeoiySbAC_ACtFZ_0((uint64_t)v34, (uint64_t)v25);
        v23 = v6-- != 0;
        if ((v21 & 1) == 0)
          break;
        v5 += 104;
      }
      while (v23);
    }
  }
  else
  {
    v21 = 0;
  }
  return v21 & 1;
}

uint64_t sub_23C12BB34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  char v6;
  uint64_t v7;
  double v8;
  char v9;
  uint64_t v10;
  double v11;
  int v12;
  BOOL v13;
  char v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    v5 = 0;
    do
    {
      v7 = *(char *)(a1 + v5 + 48);
      v8 = *(double *)(a1 + v5 + 56);
      v9 = *(_BYTE *)(a1 + v5 + 64);
      v10 = *(char *)(a2 + v5 + 48);
      v11 = *(double *)(a2 + v5 + 56);
      v12 = *(unsigned __int8 *)(a2 + v5 + 64);
      v13 = *(_QWORD *)(a1 + v5 + 32) == *(_QWORD *)(a2 + v5 + 32)
         && *(_QWORD *)(a1 + v5 + 40) == *(_QWORD *)(a2 + v5 + 40);
      if (!v13 && (sub_23C139284() & 1) == 0)
        return 0;
      if (*(_QWORD *)&aAward_5[8 * v7] == *(_QWORD *)&aAward_5[8 * v10] && qword_23C13FEC0[v7] == qword_23C13FEC0[v10])
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          goto LABEL_23;
      }
      else
      {
        v15 = sub_23C139284();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v15 & 1) == 0)
          return 0;
        if ((v9 & 1) != 0)
        {
LABEL_23:
          if (!v12)
            return 0;
          goto LABEL_9;
        }
      }
      if (v8 == v11)
        v6 = v12;
      else
        v6 = 1;
      if ((v6 & 1) != 0)
        return 0;
LABEL_9:
      v5 += 40;
      --v2;
    }
    while (v2);
  }
  return 1;
}

uint64_t sub_23C12BC80(uint64_t a1, uint64_t a2)
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
  char v14;
  BOOL v16;
  uint64_t v18;

  type metadata accessor for CanvasPlaceholder();
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v18 - v8;
  v10 = *(_QWORD *)(a1 + 16);
  if (v10 == *(_QWORD *)(a2 + 16))
  {
    if (!v10 || a1 == a2)
    {
      v14 = 1;
    }
    else
    {
      v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      v12 = *(_QWORD *)(v7 + 72);
      v13 = v10 - 1;
      do
      {
        sub_23C12D1D4(a1 + v11, (uint64_t)v9);
        sub_23C12D1D4(a2 + v11, (uint64_t)v6);
        v14 = _s13FitnessForYou17CanvasPlaceholderV2eeoiySbAC_ACtFZ_0((uint64_t)v9, (uint64_t)v6);
        sub_23C10017C((uint64_t)v6);
        sub_23C10017C((uint64_t)v9);
        v16 = v13-- != 0;
        if ((v14 & 1) == 0)
          break;
        v11 += v12;
      }
      while (v16);
    }
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

uint64_t sub_23C12BD9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  char v12;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
      return 1;
    v3 = (uint64_t *)(a2 + 64);
    for (i = (uint64_t *)(a1 + 64); ; i += 5)
    {
      v6 = *(i - 2);
      v5 = *(i - 1);
      v7 = *i;
      v9 = *(v3 - 2);
      v8 = *(v3 - 1);
      v14 = *v3;
      v10 = *(i - 4) == *(v3 - 4) && *(i - 3) == *(v3 - 3);
      if (!v10 && (sub_23C139284() & 1) == 0)
        break;
      v11 = v6 == v9 && v5 == v8;
      if (!v11 && (sub_23C139284() & 1) == 0)
        break;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v12 = sub_23C12BB34(v7, v14);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
        break;
      v3 += 5;
      if (!--v2)
        return 1;
    }
  }
  return 0;
}

uint64_t sub_23C12BEF8(char a1)
{
  return *(_QWORD *)&aIdle_2[8 * a1];
}

uint64_t sub_23C12BF18()
{
  char *v0;

  return sub_23C12BEF8(*v0);
}

uint64_t sub_23C12BF20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C12C53C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C12BF44()
{
  sub_23C12C35C();
  return sub_23C139350();
}

uint64_t sub_23C12BF6C()
{
  sub_23C12C35C();
  return sub_23C13935C();
}

uint64_t sub_23C12BF94()
{
  sub_23C12C3E4();
  return sub_23C139350();
}

uint64_t sub_23C12BFBC()
{
  sub_23C12C3E4();
  return sub_23C13935C();
}

uint64_t sub_23C12BFE4()
{
  sub_23C12C3A0();
  return sub_23C139350();
}

uint64_t sub_23C12C00C()
{
  sub_23C12C3A0();
  return sub_23C13935C();
}

uint64_t sub_23C12C034()
{
  sub_23C12C428();
  return sub_23C139350();
}

uint64_t sub_23C12C05C()
{
  sub_23C12C428();
  return sub_23C13935C();
}

uint64_t AwardLoadState.encode(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
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
  char *v16;
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
  char v28;
  char v29;
  char v30;

  v25 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22E10);
  v21 = *(_QWORD *)(v3 - 8);
  v22 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v20 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22E18);
  v23 = *(_QWORD *)(v5 - 8);
  v24 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22E20);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22E28);
  v26 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C12C35C();
  v15 = v25;
  sub_23C139338();
  if (!v15)
  {
    v28 = 0;
    sub_23C12C428();
    sub_23C139218();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v14, v12);
  }
  if (v15 == 1)
  {
    v30 = 2;
    sub_23C12C3A0();
    v16 = v20;
    sub_23C139218();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v16, v22);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v14, v12);
  }
  v29 = 1;
  sub_23C12C3E4();
  sub_23C139218();
  v27 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B21AC8);
  sub_23C12D16C(&qword_256B21AD0, (uint64_t (*)(void))sub_23C103E18, MEMORY[0x24BEE12A0]);
  v18 = v24;
  sub_23C139278();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v14, v12);
}

unint64_t sub_23C12C35C()
{
  unint64_t result;

  result = qword_256B22E30;
  if (!qword_256B22E30)
  {
    result = MEMORY[0x2426179DC](&unk_23C13FE24, &type metadata for AwardLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22E30);
  }
  return result;
}

unint64_t sub_23C12C3A0()
{
  unint64_t result;

  result = qword_256B22E38;
  if (!qword_256B22E38)
  {
    result = MEMORY[0x2426179DC](&unk_23C13FDD4, &type metadata for AwardLoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22E38);
  }
  return result;
}

unint64_t sub_23C12C3E4()
{
  unint64_t result;

  result = qword_256B22E40;
  if (!qword_256B22E40)
  {
    result = MEMORY[0x2426179DC](&unk_23C13FD84, &type metadata for AwardLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22E40);
  }
  return result;
}

unint64_t sub_23C12C428()
{
  unint64_t result;

  result = qword_256B22E48;
  if (!qword_256B22E48)
  {
    result = MEMORY[0x2426179DC](&unk_23C13FD34, &type metadata for AwardLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22E48);
  }
  return result;
}

uint64_t AwardLoadState.init(from:)(_QWORD *a1)
{
  return sub_23C12C670(a1);
}

uint64_t sub_23C12C480@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23C12C670(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_23C12C4A8(_QWORD *a1)
{
  uint64_t *v1;

  return AwardLoadState.encode(to:)(a1, *v1);
}

uint64_t static AwardLoadState.== infix(_:_:)(uint64_t a1, unint64_t a2)
{
  if (!a1)
    return !a2;
  if (a1 == 1)
    return a2 == 1;
  if (a2 < 2)
    return 0;
  return sub_23C12BD9C(a1, a2);
}

uint64_t sub_23C12C4FC(uint64_t *a1, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *a1;
  v3 = *a2;
  if (!v2)
    return !v3;
  if (v2 == 1)
    return v3 == 1;
  if (v3 < 2)
    return 0;
  return sub_23C12BD9C(v2, v3);
}

uint64_t sub_23C12C53C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1701602409 && a2 == 0xE400000000000000;
  if (v3 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64656863746566 && a2 == 0xE700000000000000 || (sub_23C139284() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x676E696863746566 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C139284();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23C12C670(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  char *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  char v35;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22EA0);
  v25 = *(_QWORD *)(v2 - 8);
  v26 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v28 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22EA8);
  v27 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v29 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22EB0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22EB8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v30 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_23C12C35C();
  v14 = v31;
  sub_23C13932C();
  if (!v14)
  {
    v31 = v5;
    v15 = v29;
    v16 = v10;
    v17 = sub_23C13920C();
    if (*(_QWORD *)(v17 + 16) == 1)
    {
      if (*(_BYTE *)(v17 + 32))
      {
        if (*(_BYTE *)(v17 + 32) == 1)
        {
          v31 = v10;
          v34 = 1;
          sub_23C12C3E4();
          sub_23C139194();
          __swift_instantiateConcreteTypeFromMangledName(&qword_256B21AC8);
          sub_23C12D16C(&qword_256B21B00, (uint64_t (*)(void))sub_23C104204, MEMORY[0x24BEE12D0]);
          v22 = v24;
          sub_23C139200();
          (*(void (**)(char *, uint64_t))(v27 + 8))(v15, v22);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v9);
          v6 = v32;
        }
        else
        {
          v35 = 2;
          sub_23C12C3A0();
          v20 = v28;
          sub_23C139194();
          (*(void (**)(char *, uint64_t))(v25 + 8))(v20, v26);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
          v6 = 1;
        }
      }
      else
      {
        v33 = 0;
        sub_23C12C428();
        sub_23C139194();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v31);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
        v6 = 0;
      }
    }
    else
    {
      v6 = sub_23C139110();
      swift_allocError();
      v19 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B21A98);
      *v19 = &type metadata for AwardLoadState;
      sub_23C1391A0();
      sub_23C139104();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v19, *MEMORY[0x24BEE26D0], v6);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v9);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return v6;
}

uint64_t *initializeBufferWithCopyOfBuffer for AwardLoadState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v3 = swift_bridgeObjectRetain();
  *a1 = v3;
  return a1;
}

unint64_t destroy for AwardLoadState(unint64_t *a1)
{
  unint64_t result;

  result = *a1;
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t *assignWithCopy for AwardLoadState(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF)
      swift_bridgeObjectRetain();
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

unint64_t *assignWithTake for AwardLoadState(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  if (*a1 < 0xFFFFFFFF)
    goto LABEL_5;
  if (v3 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AwardLoadState(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AwardLoadState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

uint64_t sub_23C12CCCC(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_23C12CCE4(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for AwardLoadState()
{
  return &type metadata for AwardLoadState;
}

uint64_t storeEnumTagSinglePayload for AwardLoadState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C12CD60 + 4 * byte_23C13FA25[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C12CD94 + 4 * byte_23C13FA20[v4]))();
}

uint64_t sub_23C12CD94(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C12CD9C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C12CDA4);
  return result;
}

uint64_t sub_23C12CDB0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C12CDB8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C12CDBC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C12CDC4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AwardLoadState.CodingKeys()
{
  return &type metadata for AwardLoadState.CodingKeys;
}

ValueMetadata *type metadata accessor for AwardLoadState.IdleCodingKeys()
{
  return &type metadata for AwardLoadState.IdleCodingKeys;
}

uint64_t storeEnumTagSinglePayload for AwardLoadState.FetchedCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C12CE30 + 4 * byte_23C13FA2A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C12CE50 + 4 * byte_23C13FA2F[v4]))();
}

_BYTE *sub_23C12CE30(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C12CE50(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C12CE58(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C12CE60(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C12CE68(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C12CE70(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AwardLoadState.FetchedCodingKeys()
{
  return &type metadata for AwardLoadState.FetchedCodingKeys;
}

ValueMetadata *type metadata accessor for AwardLoadState.FetchingCodingKeys()
{
  return &type metadata for AwardLoadState.FetchingCodingKeys;
}

unint64_t sub_23C12CEA0()
{
  unint64_t result;

  result = qword_256B22E50;
  if (!qword_256B22E50)
  {
    result = MEMORY[0x2426179DC](&unk_23C13FC04, &type metadata for AwardLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22E50);
  }
  return result;
}

unint64_t sub_23C12CEE8()
{
  unint64_t result;

  result = qword_256B22E58;
  if (!qword_256B22E58)
  {
    result = MEMORY[0x2426179DC](&unk_23C13FD0C, &type metadata for AwardLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22E58);
  }
  return result;
}

unint64_t sub_23C12CF30()
{
  unint64_t result;

  result = qword_256B22E60;
  if (!qword_256B22E60)
  {
    result = MEMORY[0x2426179DC](&unk_23C13FC2C, &type metadata for AwardLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22E60);
  }
  return result;
}

unint64_t sub_23C12CF78()
{
  unint64_t result;

  result = qword_256B22E68;
  if (!qword_256B22E68)
  {
    result = MEMORY[0x2426179DC](&unk_23C13FC54, &type metadata for AwardLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22E68);
  }
  return result;
}

unint64_t sub_23C12CFC0()
{
  unint64_t result;

  result = qword_256B22E70;
  if (!qword_256B22E70)
  {
    result = MEMORY[0x2426179DC](&unk_23C13FB74, &type metadata for AwardLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22E70);
  }
  return result;
}

unint64_t sub_23C12D008()
{
  unint64_t result;

  result = qword_256B22E78;
  if (!qword_256B22E78)
  {
    result = MEMORY[0x2426179DC](&unk_23C13FB9C, &type metadata for AwardLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22E78);
  }
  return result;
}

unint64_t sub_23C12D050()
{
  unint64_t result;

  result = qword_256B22E80;
  if (!qword_256B22E80)
  {
    result = MEMORY[0x2426179DC](&unk_23C13FB24, &type metadata for AwardLoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22E80);
  }
  return result;
}

unint64_t sub_23C12D098()
{
  unint64_t result;

  result = qword_256B22E88;
  if (!qword_256B22E88)
  {
    result = MEMORY[0x2426179DC](&unk_23C13FB4C, &type metadata for AwardLoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22E88);
  }
  return result;
}

unint64_t sub_23C12D0E0()
{
  unint64_t result;

  result = qword_256B22E90;
  if (!qword_256B22E90)
  {
    result = MEMORY[0x2426179DC](&unk_23C13FC7C, &type metadata for AwardLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22E90);
  }
  return result;
}

unint64_t sub_23C12D128()
{
  unint64_t result;

  result = qword_256B22E98;
  if (!qword_256B22E98)
  {
    result = MEMORY[0x2426179DC](&unk_23C13FCA4, &type metadata for AwardLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B22E98);
  }
  return result;
}

uint64_t sub_23C12D16C(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B21AC8);
    v8 = a2();
    result = MEMORY[0x2426179DC](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C12D1D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CanvasPlaceholder();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

__n128 ForYouToastFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t ForYouToastFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, unint64_t *a3, _BYTE *a4)
{
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
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
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, _QWORD, uint64_t);
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  void (*v36)(_QWORD);
  unint64_t v37;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t *v43;
  char *v44;
  char *v45;
  char *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t result;
  char *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unsigned int v68;
  void (*v69)(char *, _QWORD, uint64_t);
  void (*v70)(char *, uint64_t);
  uint64_t v71;
  void (*v72)(char *, _QWORD, uint64_t);
  uint64_t v73;
  unsigned int v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  char v84;
  char v85;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22EC0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v66 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v66 - v15;
  LOBYTE(a4) = *a4;
  v17 = v4[1];
  v18 = v4[2];
  v80 = *v4;
  v81 = v18;
  v82 = v4[3];
  v19 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B22EC8);
  v20 = v19[16];
  v21 = v19[20];
  v22 = v19[24];
  if ((a4 & 1) != 0)
  {
    v23 = v19;
    v24 = &v14[v20];
    v25 = &v14[v21];
    v79 = a3;
    v26 = &v14[v22];
    v85 = 1;
    v75 = sub_23C12D80C();
    sub_23C1390EC();
    sub_23C139074();
    v27 = *MEMORY[0x24BE2B570];
    v28 = sub_23C138F90();
    v29 = *(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v28 - 8) + 104);
    v74 = v27;
    v72 = v29;
    v73 = v28;
    ((void (*)(char *, uint64_t))v29)(v24, v27);
    v30 = (_QWORD *)swift_allocObject();
    v31 = v81;
    v30[2] = v80;
    v30[3] = v17;
    v32 = v82;
    v30[4] = v31;
    v30[5] = v32;
    *(_QWORD *)v26 = &unk_256B22EE0;
    *((_QWORD *)v26 + 1) = v30;
    v33 = *MEMORY[0x24BE2B558];
    v34 = sub_23C138F84();
    v70 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v34 - 8) + 104);
    v71 = v34;
    v70(v25, v33);
    v35 = *MEMORY[0x24BE2B438];
    v76 = v8;
    v36 = *(void (**)(_QWORD))(v8 + 104);
    v68 = v35;
    v78 = v7;
    v69 = (void (*)(char *, _QWORD, uint64_t))v36;
    v36(v14);
    v37 = *v79;
    swift_retain();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v77 = v17;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v37 = sub_23C12DF24(0, *(_QWORD *)(v37 + 16) + 1, 1, v37, &qword_256B22F40, &qword_256B22EC0);
    v40 = *(_QWORD *)(v37 + 16);
    v39 = *(_QWORD *)(v37 + 24);
    if (v40 >= v39 >> 1)
      v37 = sub_23C12DF24(v39 > 1, v40 + 1, 1, v37, &qword_256B22F40, &qword_256B22EC0);
    *(_QWORD *)(v37 + 16) = v40 + 1;
    v67 = (*(unsigned __int8 *)(v76 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80);
    v41 = *(_QWORD *)(v76 + 72);
    v42 = v78;
    v76 = *(_QWORD *)(v76 + 32);
    ((void (*)(unint64_t, char *, uint64_t))v76)(v37 + v67 + v41 * v40, v14, v78);
    v43 = v79;
    *v79 = v37;
    v44 = &v11[v23[16]];
    v45 = &v11[v23[20]];
    v46 = &v11[v23[24]];
    v84 = 0;
    sub_23C1390EC();
    sub_23C139074();
    v72(v44, v74, v73);
    v47 = (_QWORD *)swift_allocObject();
    v48 = v77;
    v47[2] = v80;
    v47[3] = v48;
    v49 = v82;
    v47[4] = v81;
    v47[5] = v49;
    *(_QWORD *)v46 = &unk_256B22EF0;
    *((_QWORD *)v46 + 1) = v47;
    ((void (*)(char *, uint64_t, uint64_t))v70)(v45, v33, v71);
    v69(v11, v68, v42);
    v50 = *v43;
    swift_retain();
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v50 = sub_23C12DF24(0, *(_QWORD *)(v50 + 16) + 1, 1, v50, &qword_256B22F40, &qword_256B22EC0);
    v52 = *(_QWORD *)(v50 + 16);
    v51 = *(_QWORD *)(v50 + 24);
    if (v52 >= v51 >> 1)
      v50 = sub_23C12DF24(v51 > 1, v52 + 1, 1, v50, &qword_256B22F40, &qword_256B22EC0);
    *(_QWORD *)(v50 + 16) = v52 + 1;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v76)(v50 + v67 + v52 * v41, v11, v42);
    a3 = v79;
  }
  else
  {
    v54 = &v16[v20];
    v55 = &v16[v21];
    v56 = &v16[v22];
    v83 = 1;
    sub_23C12D80C();
    sub_23C1390EC();
    sub_23C139074();
    v57 = *MEMORY[0x24BE2B570];
    v58 = sub_23C138F90();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 104))(v54, v57, v58);
    v59 = (_QWORD *)swift_allocObject();
    v60 = v81;
    v59[2] = v80;
    v59[3] = v17;
    v61 = v82;
    v59[4] = v60;
    v59[5] = v61;
    *(_QWORD *)v56 = &unk_256B22F00;
    *((_QWORD *)v56 + 1) = v59;
    v62 = *MEMORY[0x24BE2B558];
    v63 = sub_23C138F84();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 104))(v55, v62, v63);
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v16, *MEMORY[0x24BE2B438], v7);
    v50 = *a3;
    swift_retain();
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v50 = sub_23C12DF24(0, *(_QWORD *)(v50 + 16) + 1, 1, v50, &qword_256B22F40, &qword_256B22EC0);
    v65 = *(_QWORD *)(v50 + 16);
    v64 = *(_QWORD *)(v50 + 24);
    if (v65 >= v64 >> 1)
      v50 = sub_23C12DF24(v64 > 1, v65 + 1, 1, v50, &qword_256B22F40, &qword_256B22EC0);
    *(_QWORD *)(v50 + 16) = v65 + 1;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v8 + 32))(v50+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v65, v16, v7);
  }
  *a3 = v50;
  return result;
}

unint64_t sub_23C12D80C()
{
  unint64_t result;

  result = qword_256B22ED0;
  if (!qword_256B22ED0)
  {
    result = MEMORY[0x2426179DC](&unk_23C14000C, &type metadata for ForYouToastFeature.TaskIdentifier);
    atomic_store(result, &qword_256B22ED0);
  }
  return result;
}

uint64_t sub_23C12D850(uint64_t a1, int *a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v2[2] = sub_23C139068();
  v2[3] = sub_23C13905C();
  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_23C12D8D0;
  return v6(1);
}

uint64_t sub_23C12D8D0()
{
  swift_task_dealloc();
  sub_23C139044();
  return swift_task_switch();
}

uint64_t sub_23C12D940(uint64_t a1, int *a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD);

  v2[2] = sub_23C139068();
  v2[3] = sub_23C13905C();
  v6 = (uint64_t (*)(_QWORD))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_23C12D8D0;
  return v6(0);
}

uint64_t sub_23C12D9C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23C12B4C4;
  return sub_23C12D940(a1, v4);
}

uint64_t sub_23C12DA38(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  _QWORD *v4;
  _QWORD *v6;
  uint64_t (*v8)(void);

  v4[2] = sub_23C139068();
  v4[3] = sub_23C13905C();
  v8 = (uint64_t (*)(void))((char *)a4 + *a4);
  v6 = (_QWORD *)swift_task_alloc();
  v4[4] = v6;
  *v6 = v4;
  v6[1] = sub_23C12DAB4;
  return v8();
}

uint64_t sub_23C12DAB4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  sub_23C139044();
  return swift_task_switch();
}

uint64_t sub_23C12DB3C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C12DB70()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C12DBB0(uint64_t a1)
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
  v7[1] = sub_23C12AEF0;
  return sub_23C12DA38(a1, v4, v5, v6);
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C12DC54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23C12B4C4;
  return sub_23C12D850(a1, v4);
}

unint64_t sub_23C12DCCC()
{
  unint64_t result;

  result = qword_256B22F08;
  if (!qword_256B22F08)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for ForYouToastAction, &type metadata for ForYouToastAction);
    atomic_store(result, (unint64_t *)&qword_256B22F08);
  }
  return result;
}

unint64_t sub_23C12DD14()
{
  unint64_t result;

  result = qword_256B22F10;
  if (!qword_256B22F10)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for ForYouToastAction, &type metadata for ForYouToastAction);
    atomic_store(result, (unint64_t *)&qword_256B22F10);
  }
  return result;
}

unint64_t sub_23C12DD5C()
{
  unint64_t result;

  result = qword_256B22F18;
  if (!qword_256B22F18)
  {
    result = MEMORY[0x2426179DC](MEMORY[0x24BE2B430], MEMORY[0x24BE2B428]);
    atomic_store(result, (unint64_t *)&qword_256B22F18);
  }
  return result;
}

unint64_t sub_23C12DDA4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B22F20;
  if (!qword_256B22F20)
  {
    v1 = type metadata accessor for ForYouToastState();
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for ForYouToastState, v1);
    atomic_store(result, (unint64_t *)&qword_256B22F20);
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouToastFeature()
{
  return &type metadata for ForYouToastFeature;
}

uint64_t storeEnumTagSinglePayload for ForYouToastFeature.TaskIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C12DE48 + 4 * byte_23C13FF45[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C12DE7C + 4 * byte_23C13FF40[v4]))();
}

uint64_t sub_23C12DE7C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C12DE84(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C12DE8CLL);
  return result;
}

uint64_t sub_23C12DE98(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C12DEA0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C12DEA4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C12DEAC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ForYouToastFeature.TaskIdentifier()
{
  return &type metadata for ForYouToastFeature.TaskIdentifier;
}

unint64_t sub_23C12DECC()
{
  unint64_t result;

  result = qword_256B22F28;
  if (!qword_256B22F28)
  {
    result = MEMORY[0x2426179DC](&unk_23C13FFE4, &type metadata for ForYouToastFeature.TaskIdentifier);
    atomic_store(result, (unint64_t *)&qword_256B22F28);
  }
  return result;
}

uint64_t sub_23C12DF10(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23C12DF24(a1, a2, a3, a4, &qword_256B22F30, &qword_256B22F38);
}

uint64_t sub_23C12DF24(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_23C139158();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23C12E130(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_23C12E130(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a5) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_23C13917C();
  __break(1u);
  return result;
}

__n128 ForYouFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;

  v2 = *(_OWORD *)(a1 + 208);
  *(_OWORD *)(a2 + 192) = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(a2 + 208) = v2;
  v3 = *(_OWORD *)(a1 + 240);
  *(_OWORD *)(a2 + 224) = *(_OWORD *)(a1 + 224);
  *(_OWORD *)(a2 + 240) = v3;
  v4 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(a2 + 144) = v4;
  v5 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(a2 + 176) = v5;
  v6 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v6;
  v7 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 112) = v7;
  v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v8;
  result = *(__n128 *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 48);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v10;
  return result;
}

uint64_t ForYouFeature.environment.getter@<X0>(_OWORD *a1@<X8>)
{
  _OWORD *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;

  v2 = v1[13];
  v3 = v1[11];
  v37 = v1[12];
  v38 = v2;
  v4 = v1[13];
  v5 = v1[15];
  v39 = v1[14];
  v6 = v39;
  v40 = v5;
  v7 = v1[9];
  v9 = v1[7];
  v33 = v1[8];
  v8 = v33;
  v34 = v7;
  v10 = v1[9];
  v11 = v1[11];
  v35 = v1[10];
  v12 = v35;
  v36 = v11;
  v13 = v1[5];
  v15 = v1[3];
  v29 = v1[4];
  v14 = v29;
  v30 = v13;
  v16 = v1[5];
  v17 = v1[7];
  v31 = v1[6];
  v18 = v31;
  v32 = v17;
  v19 = v1[1];
  v26[0] = *v1;
  v26[1] = v19;
  v20 = v1[3];
  v22 = *v1;
  v21 = v1[1];
  v27 = v1[2];
  v23 = v27;
  v28 = v20;
  a1[12] = v37;
  a1[13] = v4;
  v24 = v1[15];
  a1[14] = v6;
  a1[15] = v24;
  a1[8] = v8;
  a1[9] = v10;
  a1[10] = v12;
  a1[11] = v3;
  a1[4] = v14;
  a1[5] = v16;
  a1[6] = v18;
  a1[7] = v9;
  *a1 = v22;
  a1[1] = v21;
  a1[2] = v23;
  a1[3] = v15;
  return sub_23C134124((uint64_t)v26);
}

void sub_23C12E340(uint64_t a1, unint64_t *a2, int a3)
{
  __int128 *v3;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  int *v17;
  char v18;
  int v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  int *v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t *v66;
  int v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78[32];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
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

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22F38);
  v69 = *(_QWORD *)(v7 - 8);
  v70 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v68 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v3[13];
  v91 = v3[12];
  v92 = v9;
  v10 = v3[15];
  v93 = v3[14];
  v94 = v10;
  v11 = v3[9];
  v87 = v3[8];
  v88 = v11;
  v12 = v3[11];
  v89 = v3[10];
  v90 = v12;
  v13 = v3[5];
  v83 = v3[4];
  v84 = v13;
  v14 = v3[7];
  v85 = v3[6];
  v86 = v14;
  v15 = v3[1];
  v79 = *v3;
  v80 = v15;
  v16 = v3[3];
  v81 = v3[2];
  v82 = v16;
  v17 = (int *)type metadata accessor for ForYouState();
  v76 = v17[15];
  v18 = *(_BYTE *)(a1 + v76);
  v74 = v17[19];
  v19 = *(unsigned __int8 *)(a1 + v74);
  v71 = v17[6];
  v20 = *(unsigned __int8 *)(a1 + v71);
  v72 = v19;
  v73 = v20;
  if (qword_256B21870 != -1)
    swift_once();
  v21 = sub_23C138C18();
  v75 = __swift_project_value_buffer(v21, (uint64_t)qword_256B2FCD0);
  v22 = sub_23C138C00();
  v23 = sub_23C1390C8();
  v24 = os_log_type_enabled(v22, v23);
  v67 = a3;
  if (v24)
  {
    v25 = swift_slowAlloc();
    v66 = a2;
    v26 = v25;
    v27 = swift_slowAlloc();
    v78[0] = v27;
    *(_DWORD *)v26 = 136315650;
    LOBYTE(v77) = v18;
    v28 = sub_23C138FF0();
    v77 = sub_23C13746C(v28, v29, v78);
    sub_23C1390D4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2080;
    LOBYTE(v77) = v72;
    v30 = sub_23C138FF0();
    v77 = sub_23C13746C(v30, v31, v78);
    sub_23C1390D4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 22) = 2080;
    LOBYTE(v77) = v73;
    v32 = sub_23C138FF0();
    v77 = sub_23C13746C(v32, v33, v78);
    sub_23C1390D4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C0FD000, v22, v23, "For You State — NetworkConditions: %s, SubscriptionState: %s, BrowsingIdentity: %s", (uint8_t *)v26, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x242617A54](v27, -1, -1);
    v34 = v26;
    a2 = v66;
    MEMORY[0x242617A54](v34, -1, -1);
  }

  if (*(_BYTE *)(a1 + v76) == 1)
  {
    v35 = sub_23C138C00();
    v36 = sub_23C1390C8();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      v38 = "Current Network Conditions are unsupported for fetching section descriptors.";
LABEL_11:
      _os_log_impl(&dword_23C0FD000, v35, v36, v38, v37, 2u);
      MEMORY[0x242617A54](v37, -1, -1);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (*(_BYTE *)(a1 + v74) == 2)
  {
    v35 = sub_23C138C00();
    v36 = sub_23C1390C8();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      v38 = "Current Subscription State is unsupported for fetching section descriptors.";
      goto LABEL_11;
    }
LABEL_12:

    return;
  }
  if ((*(_BYTE *)(a1 + v71) & 1) == 0 && (*(_BYTE *)(a1 + v17[20]) & 1) == 0)
  {
    sub_23C12E97C(0, 0, 0, 2, a1);
    return;
  }
  v39 = a1 + v17[12];
  v40 = *(_QWORD *)(v39 + 16);
  if (*(_BYTE *)(v39 + 24))
  {
    if (*(_BYTE *)(v39 + 24) != 1 && v40 | *(_QWORD *)v39 | *(_QWORD *)(v39 + 8))
      return;
    v41 = *(_BYTE *)(a1 + v17[7]);
    goto LABEL_22;
  }
  v41 = *(_BYTE *)(a1 + v17[7]);
  if ((v40 & 0xFE) == 0)
LABEL_22:
    sub_23C12ED00(a1);
  v42 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B22EC8);
  v43 = v68;
  v44 = &v68[v42[16]];
  v45 = &v68[v42[20]];
  v46 = &v68[v42[24]];
  LOBYTE(v78[0]) = 2;
  sub_23C1334A0();
  sub_23C1390EC();
  sub_23C139074();
  v47 = *MEMORY[0x24BE2B580];
  v48 = sub_23C138F90();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 104))(v44, v47, v48);
  v49 = *MEMORY[0x24BE2B550];
  v50 = sub_23C138F84();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 104))(v45, v49, v50);
  v51 = swift_allocObject();
  v52 = v92;
  *(_OWORD *)(v51 + 208) = v91;
  *(_OWORD *)(v51 + 224) = v52;
  v53 = v94;
  *(_OWORD *)(v51 + 240) = v93;
  *(_OWORD *)(v51 + 256) = v53;
  v54 = v88;
  *(_OWORD *)(v51 + 144) = v87;
  *(_OWORD *)(v51 + 160) = v54;
  v55 = v90;
  *(_OWORD *)(v51 + 176) = v89;
  *(_OWORD *)(v51 + 192) = v55;
  v56 = v84;
  *(_OWORD *)(v51 + 80) = v83;
  *(_OWORD *)(v51 + 96) = v56;
  v57 = v86;
  *(_OWORD *)(v51 + 112) = v85;
  *(_OWORD *)(v51 + 128) = v57;
  v58 = v80;
  *(_OWORD *)(v51 + 16) = v79;
  *(_OWORD *)(v51 + 32) = v58;
  v59 = v82;
  *(_OWORD *)(v51 + 48) = v81;
  *(_OWORD *)(v51 + 64) = v59;
  *(_BYTE *)(v51 + 272) = v67;
  *(_BYTE *)(v51 + 273) = v41;
  *(_QWORD *)v46 = &unk_256B23090;
  *((_QWORD *)v46 + 1) = v51;
  v61 = v69;
  v60 = v70;
  (*(void (**)(char *, _QWORD, uint64_t))(v69 + 104))(v43, *MEMORY[0x24BE2B438], v70);
  v62 = *a2;
  sub_23C134124((uint64_t)&v79);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v62 = sub_23C12DF10(0, *(_QWORD *)(v62 + 16) + 1, 1, v62);
  v64 = *(_QWORD *)(v62 + 16);
  v63 = *(_QWORD *)(v62 + 24);
  if (v64 >= v63 >> 1)
    v62 = sub_23C12DF10(v63 > 1, v64 + 1, 1, v62);
  *(_QWORD *)(v62 + 16) = v64 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v61 + 32))(v62+ ((*(unsigned __int8 *)(v61 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80))+ *(_QWORD *)(v61 + 72) * v64, v43, v60);
  *a2 = v62;
}

uint64_t sub_23C12E97C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t result;
  uint64_t v27;
  os_log_type_t type;
  char v29;
  uint64_t v30;

  v9 = a5 + *(int *)(type metadata accessor for ForYouState() + 48);
  v10 = *(_QWORD *)v9;
  v11 = *(_QWORD *)(v9 + 8);
  v12 = *(_QWORD *)(v9 + 16);
  v13 = *(_BYTE *)(v9 + 24);
  sub_23C11B380(*(_QWORD *)v9, v11, v12, v13);
  if (qword_256B21870 != -1)
    swift_once();
  v14 = sub_23C138C18();
  __swift_project_value_buffer(v14, (uint64_t)qword_256B2FCD0);
  sub_23C11B380(a1, a2, a3, a4);
  sub_23C11B380(v10, v11, v12, v13);
  sub_23C11B380(a1, a2, a3, a4);
  v15 = sub_23C138C00();
  type = sub_23C1390C8();
  if (os_log_type_enabled(v15, type))
  {
    v29 = a4;
    v16 = swift_slowAlloc();
    v27 = swift_slowAlloc();
    v30 = v27;
    *(_DWORD *)v16 = 136315394;
    sub_23C11B380(v10, v11, v12, v13);
    v17 = sub_23C138FF0();
    sub_23C13746C(v17, v18, &v30);
    sub_23C1390D4();
    swift_bridgeObjectRelease();
    sub_23C11B438(v10, v11, v12, v13);
    sub_23C11B438(v10, v11, v12, v13);
    *(_WORD *)(v16 + 12) = 2080;
    sub_23C11B380(a1, a2, a3, v29);
    v19 = sub_23C138FF0();
    sub_23C13746C(v19, v20, &v30);
    sub_23C1390D4();
    swift_bridgeObjectRelease();
    sub_23C11B438(a1, a2, a3, v29);
    sub_23C11B438(a1, a2, a3, v29);
    _os_log_impl(&dword_23C0FD000, v15, type, "Transitioning from %s to %s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242617A54](v27, -1, -1);
    v21 = v16;
    a4 = v29;
    MEMORY[0x242617A54](v21, -1, -1);

  }
  else
  {
    sub_23C11B438(v10, v11, v12, v13);
    sub_23C11B438(v10, v11, v12, v13);
    sub_23C11B438(a1, a2, a3, a4);
    sub_23C11B438(a1, a2, a3, a4);

  }
  v22 = *(_QWORD *)v9;
  v23 = *(_QWORD *)(v9 + 8);
  v24 = *(_QWORD *)(v9 + 16);
  v25 = *(_BYTE *)(v9 + 24);
  sub_23C11B380(a1, a2, a3, a4);
  result = sub_23C11B438(v22, v23, v24, v25);
  *(_QWORD *)v9 = a1;
  *(_QWORD *)(v9 + 8) = a2;
  *(_QWORD *)(v9 + 16) = a3;
  *(_BYTE *)(v9 + 24) = a4;
  return result;
}

uint64_t sub_23C12ED00(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  char isUniquelyReferenced_nonNull_native;
  char v28;
  unint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  uint64_t v32;
  char v33;
  unint64_t v34;
  char v35;
  uint64_t *v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t result;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  uint64_t v47;
  _QWORD *v48;

  v2 = sub_23C138BAC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C12E97C(1, 0, 0, 2, a1);
  sub_23C138BA0();
  sub_23C138B94();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_23C1390BC();
  v7 = v6;
  v8 = type metadata accessor for ForYouState();
  v9 = a1 + *(int *)(v8 + 52);
  *(_QWORD *)(v9 + 16) = v7;
  *(_BYTE *)(v9 + 24) = 0;
  v43 = *(int *)(v8 + 20);
  v44 = a1;
  v10 = *(_QWORD *)(a1 + v43);
  v11 = *(_QWORD *)(v10 + 64);
  v45 = v10 + 64;
  v12 = 1 << *(_BYTE *)(v10 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v46 = (unint64_t)(v12 + 63) >> 6;
  v47 = v10;
  swift_bridgeObjectRetain_n();
  v15 = 0;
  v16 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (1)
  {
    if (v14)
    {
      v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v20 = v19 | (v15 << 6);
    }
    else
    {
      v21 = v15 + 1;
      if (__OFADD__(v15, 1))
        goto LABEL_40;
      if (v21 >= v46)
      {
LABEL_37:
        swift_release();
        swift_bridgeObjectRelease();
        v41 = v43;
        v40 = v44;
        result = swift_bridgeObjectRelease();
        *(_QWORD *)(v40 + v41) = v16;
        return result;
      }
      v22 = *(_QWORD *)(v45 + 8 * v21);
      ++v15;
      if (!v22)
      {
        v15 = v21 + 1;
        if (v21 + 1 >= v46)
          goto LABEL_37;
        v22 = *(_QWORD *)(v45 + 8 * v15);
        if (!v22)
        {
          v15 = v21 + 2;
          if (v21 + 2 >= v46)
            goto LABEL_37;
          v22 = *(_QWORD *)(v45 + 8 * v15);
          if (!v22)
          {
            v15 = v21 + 3;
            if (v21 + 3 >= v46)
              goto LABEL_37;
            v22 = *(_QWORD *)(v45 + 8 * v15);
            if (!v22)
            {
              v15 = v21 + 4;
              if (v21 + 4 >= v46)
                goto LABEL_37;
              v22 = *(_QWORD *)(v45 + 8 * v15);
              if (!v22)
              {
                v23 = v21 + 5;
                if (v23 >= v46)
                  goto LABEL_37;
                v22 = *(_QWORD *)(v45 + 8 * v23);
                if (!v22)
                {
                  while (1)
                  {
                    v15 = v23 + 1;
                    if (__OFADD__(v23, 1))
                      goto LABEL_41;
                    if (v15 >= v46)
                      goto LABEL_37;
                    v22 = *(_QWORD *)(v45 + 8 * v15);
                    ++v23;
                    if (v22)
                      goto LABEL_25;
                  }
                }
                v15 = v23;
              }
            }
          }
        }
      }
LABEL_25:
      v14 = (v22 - 1) & v22;
      v20 = __clz(__rbit64(v22)) + (v15 << 6);
    }
    v24 = (uint64_t *)(*(_QWORD *)(v47 + 48) + 16 * v20);
    v26 = *v24;
    v25 = v24[1];
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v48 = v16;
    v29 = sub_23C137C30(v26, v25);
    v30 = v16[2];
    v31 = (v28 & 1) == 0;
    v32 = v30 + v31;
    if (__OFADD__(v30, v31))
      break;
    v33 = v28;
    if (v16[3] >= v32)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v16 = v48;
        if ((v28 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_23C138064();
        v16 = v48;
        if ((v33 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_23C137D74(v32, isUniquelyReferenced_nonNull_native);
      v34 = sub_23C137C30(v26, v25);
      if ((v33 & 1) != (v35 & 1))
        goto LABEL_42;
      v29 = v34;
      v16 = v48;
      if ((v33 & 1) != 0)
      {
LABEL_4:
        v17 = v16[7];
        v18 = *(_QWORD *)(v17 + 8 * v29);
        *(_QWORD *)(v17 + 8 * v29) = 1;
        sub_23C11E5E4(v18);
        goto LABEL_5;
      }
    }
    v16[(v29 >> 6) + 8] |= 1 << v29;
    v36 = (uint64_t *)(v16[6] + 16 * v29);
    *v36 = v26;
    v36[1] = v25;
    *(_QWORD *)(v16[7] + 8 * v29) = 1;
    v37 = v16[2];
    v38 = __OFADD__(v37, 1);
    v39 = v37 + 1;
    if (v38)
      goto LABEL_39;
    v16[2] = v39;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  result = sub_23C139290();
  __break(1u);
  return result;
}

uint64_t sub_23C12F0C8(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v4 + 107) = a4;
  *(_BYTE *)(v4 + 106) = a3;
  *(_QWORD *)(v4 + 648) = a2;
  *(_QWORD *)(v4 + 640) = a1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 656) = v5;
  *v5 = v4;
  v5[1] = sub_23C12F124;
  return sub_23C139098();
}

uint64_t sub_23C12F124()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v2 = (_QWORD *)*v1;
  v3 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
    MEMORY[0x2426178F8](v0);
  v4 = v2[81];
  v2[83] = *(_QWORD *)v4;
  v2[84] = *(_QWORD *)(v4 + 8);
  v2[85] = *(_QWORD *)(v4 + 176);
  v2[86] = *(_QWORD *)(v4 + 184);
  v2[87] = *(_QWORD *)(v4 + 208);
  v2[88] = *(_QWORD *)(v4 + 216);
  v2[89] = *(_QWORD *)(v4 + 224);
  v2[90] = *(_QWORD *)(v4 + 232);
  v7 = (uint64_t (*)(void))(**(int **)(v4 + 240) + *(_QWORD *)(v4 + 240));
  v5 = (_QWORD *)swift_task_alloc();
  v2[91] = v5;
  *v5 = v3;
  v5[1] = sub_23C12F1E8;
  return v7();
}

uint64_t sub_23C12F1E8(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 736) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_BYTE *)(v4 + 108) = a1 & 1;
  return swift_task_switch();
}

uint64_t sub_23C12F260()
{
  uint64_t v0;
  void *v1;
  _BYTE *v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *v14;
  id v15;
  _QWORD *v16;
  uint64_t (*v17)();
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(void);
  uint64_t (*v21)(uint64_t, _QWORD);
  uint64_t v22;

  if (*(_BYTE *)(v0 + 108) != 1)
  {
    v20 = (uint64_t (*)(void))(**(int **)(v0 + 696) + *(_QWORD *)(v0 + 696));
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 856) = v12;
    *v12 = v0;
    v12[1] = sub_23C1304B8;
    return v20();
  }
  v1 = *(void **)(v0 + 736);
  sub_23C1390A4();
  if (!v1)
  {
    v21 = (uint64_t (*)(uint64_t, _QWORD))(**(int **)(v0 + 664) + *(_QWORD *)(v0 + 664));
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 744) = v14;
    *v14 = v0;
    v14[1] = sub_23C12F69C;
    return v21(v0 + 16, *(unsigned __int8 *)(v0 + 106));
  }
  *(_QWORD *)(v0 + 880) = v1;
  if (qword_256B21870 != -1)
    swift_once();
  v2 = (_BYTE *)(v0 + 105);
  v3 = sub_23C138C18();
  __swift_project_value_buffer(v3, (uint64_t)qword_256B2FCD0);
  v4 = v1;
  v5 = v1;
  v6 = sub_23C138C00();
  v7 = sub_23C1390C8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v22 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_getErrorValue();
    v10 = sub_23C1392B4();
    *(_QWORD *)(v0 + 592) = sub_23C13746C(v10, v11, &v22);
    sub_23C1390D4();
    swift_bridgeObjectRelease();
    MEMORY[0x2426178F8](v1);
    MEMORY[0x2426178F8](v1);
    _os_log_impl(&dword_23C0FD000, v6, v7, "Failed to fetched descriptors with error: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242617A54](v9, -1, -1);
    MEMORY[0x242617A54](v8, -1, -1);
  }
  else
  {
    MEMORY[0x2426178F8](v1);
    MEMORY[0x2426178F8](v1);
  }

  *(_QWORD *)(v0 + 600) = v1;
  v15 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B23098);
  if (!swift_dynamicCast())
    goto LABEL_14;
  if (!*v2)
  {
    *(_OWORD *)(v0 + 256) = xmmword_23C140070;
    *(_QWORD *)(v0 + 280) = 0;
    *(_QWORD *)(v0 + 288) = 0;
    *(_QWORD *)(v0 + 272) = 2;
    *(_BYTE *)(v0 + 296) = 1;
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 912) = v16;
    *(_QWORD *)(v0 + 920) = __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    v17 = sub_23C130758;
    goto LABEL_16;
  }
  if (*v2 == 1)
  {
    *(_QWORD *)(v0 + 352) = 0;
    *(_QWORD *)(v0 + 360) = 0;
    *(_QWORD *)(v0 + 376) = 0;
    *(_QWORD *)(v0 + 384) = 0;
    *(_QWORD *)(v0 + 368) = 2;
    *(_BYTE *)(v0 + 392) = 1;
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 888) = v16;
    *(_QWORD *)(v0 + 896) = __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    v17 = sub_23C130638;
  }
  else
  {
LABEL_14:
    MEMORY[0x2426178F8](*(_QWORD *)(v0 + 600));
    swift_getErrorValue();
    v18 = sub_23C1392B4();
    *(_QWORD *)(v0 + 936) = v19;
    *(_QWORD *)(v0 + 208) = v18;
    *(_QWORD *)(v0 + 216) = v19;
    *(_QWORD *)(v0 + 224) = 0;
    *(_QWORD *)(v0 + 232) = 0;
    *(_QWORD *)(v0 + 240) = 0;
    *(_BYTE *)(v0 + 248) = 3;
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 944) = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    v17 = sub_23C130838;
  }
LABEL_16:
  *v16 = v0;
  v16[1] = v17;
  return sub_23C138F78();
}

uint64_t sub_23C12F69C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 752) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C12F700()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  _QWORD *v17;
  uint64_t (*v18)();
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 760) = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 768) = v1;
  v2 = *(_QWORD *)(v0 + 40);
  *(_QWORD *)(v0 + 776) = *(_QWORD *)(v0 + 32);
  *(_QWORD *)(v0 + 784) = v2;
  *(_OWORD *)(v0 + 792) = *(_OWORD *)(v0 + 48);
  if (!*(_QWORD *)(v1 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23C138B20();
    v4 = (void *)swift_allocError();
    *v5 = 2;
    swift_willThrow();
    *(_QWORD *)(v0 + 880) = v4;
    if (qword_256B21870 != -1)
      swift_once();
    v6 = (_BYTE *)(v0 + 105);
    v7 = sub_23C138C18();
    __swift_project_value_buffer(v7, (uint64_t)qword_256B2FCD0);
    v8 = v4;
    v9 = v4;
    v10 = sub_23C138C00();
    v11 = sub_23C1390C8();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v22 = v13;
      *(_DWORD *)v12 = 136315138;
      swift_getErrorValue();
      v14 = sub_23C1392B4();
      *(_QWORD *)(v0 + 592) = sub_23C13746C(v14, v15, &v22);
      sub_23C1390D4();
      swift_bridgeObjectRelease();
      MEMORY[0x2426178F8](v4);
      MEMORY[0x2426178F8](v4);
      _os_log_impl(&dword_23C0FD000, v10, v11, "Failed to fetched descriptors with error: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242617A54](v13, -1, -1);
      MEMORY[0x242617A54](v12, -1, -1);
    }
    else
    {
      MEMORY[0x2426178F8](v4);
      MEMORY[0x2426178F8](v4);
    }

    *(_QWORD *)(v0 + 600) = v4;
    v16 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B23098);
    if (!swift_dynamicCast())
      goto LABEL_12;
    if (!*v6)
    {
      *(_OWORD *)(v0 + 256) = xmmword_23C140070;
      *(_QWORD *)(v0 + 280) = 0;
      *(_QWORD *)(v0 + 288) = 0;
      *(_QWORD *)(v0 + 272) = 2;
      *(_BYTE *)(v0 + 296) = 1;
      v17 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 912) = v17;
      *(_QWORD *)(v0 + 920) = __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
      v18 = sub_23C130758;
      goto LABEL_14;
    }
    if (*v6 == 1)
    {
      *(_QWORD *)(v0 + 352) = 0;
      *(_QWORD *)(v0 + 360) = 0;
      *(_QWORD *)(v0 + 376) = 0;
      *(_QWORD *)(v0 + 384) = 0;
      *(_QWORD *)(v0 + 368) = 2;
      *(_BYTE *)(v0 + 392) = 1;
      v17 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 888) = v17;
      *(_QWORD *)(v0 + 896) = __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
      v18 = sub_23C130638;
    }
    else
    {
LABEL_12:
      MEMORY[0x2426178F8](*(_QWORD *)(v0 + 600));
      swift_getErrorValue();
      v19 = sub_23C1392B4();
      *(_QWORD *)(v0 + 936) = v20;
      *(_QWORD *)(v0 + 208) = v19;
      *(_QWORD *)(v0 + 216) = v20;
      *(_QWORD *)(v0 + 224) = 0;
      *(_QWORD *)(v0 + 232) = 0;
      *(_QWORD *)(v0 + 240) = 0;
      *(_BYTE *)(v0 + 248) = 3;
      v17 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 944) = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
      v18 = sub_23C130838;
    }
LABEL_14:
    *v17 = v0;
    v17[1] = v18;
    return sub_23C138F78();
  }
  *(_QWORD *)(v0 + 496) = 3;
  *(_OWORD *)(v0 + 504) = 0u;
  *(_OWORD *)(v0 + 520) = 0u;
  *(_BYTE *)(v0 + 536) = 8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 808) = v3;
  *(_QWORD *)(v0 + 816) = __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
  *v3 = v0;
  v3[1] = sub_23C12FB54;
  return sub_23C138F78();
}

uint64_t sub_23C12FB54()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v4 = *v0;
  swift_task_dealloc();
  *(_QWORD *)(v1 + 448) = 1;
  *(_OWORD *)(v1 + 456) = 0u;
  *(_OWORD *)(v1 + 472) = 0u;
  *(_BYTE *)(v1 + 488) = 8;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 824) = v2;
  *v2 = v4;
  v2[1] = sub_23C12FBE4;
  return sub_23C138F78();
}

uint64_t sub_23C12FBE4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C12FC38()
{
  uint64_t v0;
  void *v1;
  _BYTE *v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  _QWORD *v22;
  uint64_t (*v23)();
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v38[2];

  v1 = *(void **)(v0 + 752);
  sub_23C1390A4();
  if (v1)
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 880) = v1;
    if (qword_256B21870 != -1)
      swift_once();
    v2 = (_BYTE *)(v0 + 105);
    v3 = sub_23C138C18();
    __swift_project_value_buffer(v3, (uint64_t)qword_256B2FCD0);
    v4 = v1;
    v5 = v1;
    v6 = sub_23C138C00();
    v7 = sub_23C1390C8();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v38[0] = v9;
      *(_DWORD *)v8 = 136315138;
      swift_getErrorValue();
      v10 = sub_23C1392B4();
      *(_QWORD *)(v0 + 592) = sub_23C13746C(v10, v11, v38);
      sub_23C1390D4();
      swift_bridgeObjectRelease();
      MEMORY[0x2426178F8](v1);
      MEMORY[0x2426178F8](v1);
      _os_log_impl(&dword_23C0FD000, v6, v7, "Failed to fetched descriptors with error: %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242617A54](v9, -1, -1);
      MEMORY[0x242617A54](v8, -1, -1);
    }
    else
    {
      MEMORY[0x2426178F8](v1);
      MEMORY[0x2426178F8](v1);
    }

    *(_QWORD *)(v0 + 600) = v1;
    v21 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B23098);
    if (!swift_dynamicCast())
      goto LABEL_15;
    if (!*v2)
    {
      *(_OWORD *)(v0 + 256) = xmmword_23C140070;
      *(_QWORD *)(v0 + 280) = 0;
      *(_QWORD *)(v0 + 288) = 0;
      *(_QWORD *)(v0 + 272) = 2;
      *(_BYTE *)(v0 + 296) = 1;
      v22 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 912) = v22;
      *(_QWORD *)(v0 + 920) = __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
      v23 = sub_23C130758;
      goto LABEL_16;
    }
    if (*v2 == 1)
    {
      *(_QWORD *)(v0 + 352) = 0;
      *(_QWORD *)(v0 + 360) = 0;
      *(_QWORD *)(v0 + 376) = 0;
      *(_QWORD *)(v0 + 384) = 0;
      *(_QWORD *)(v0 + 368) = 2;
      *(_BYTE *)(v0 + 392) = 1;
      v22 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 888) = v22;
      *(_QWORD *)(v0 + 896) = __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
      v23 = sub_23C130638;
    }
    else
    {
LABEL_15:
      MEMORY[0x2426178F8](*(_QWORD *)(v0 + 600));
      swift_getErrorValue();
      v24 = sub_23C1392B4();
      *(_QWORD *)(v0 + 936) = v25;
      *(_QWORD *)(v0 + 208) = v24;
      *(_QWORD *)(v0 + 216) = v25;
      *(_QWORD *)(v0 + 224) = 0;
      *(_QWORD *)(v0 + 232) = 0;
      *(_QWORD *)(v0 + 240) = 0;
      *(_BYTE *)(v0 + 248) = 3;
      v22 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 944) = v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
      v23 = sub_23C130838;
    }
LABEL_16:
    *v22 = v0;
    v22[1] = v23;
    return sub_23C138F78();
  }
  if (qword_256B21870 != -1)
    swift_once();
  v12 = sub_23C138C18();
  __swift_project_value_buffer(v12, (uint64_t)qword_256B2FCD0);
  swift_bridgeObjectRetain_n();
  v13 = sub_23C138C00();
  v14 = sub_23C1390C8();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v38[0] = v16;
    *(_DWORD *)v15 = 136315138;
    v17 = swift_bridgeObjectRetain();
    v18 = MEMORY[0x242617424](v17, &type metadata for CanvasSectionDescriptor);
    v20 = v19;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 632) = sub_23C13746C(v18, v20, v38);
    sub_23C1390D4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23C0FD000, v13, v14, "Fetched descriptors: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242617A54](v16, -1, -1);
    MEMORY[0x242617A54](v15, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  swift_bridgeObjectRetain_n();
  v26 = sub_23C138C00();
  v27 = sub_23C1390C8();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    v29 = swift_slowAlloc();
    v38[0] = v29;
    *(_DWORD *)v28 = 136315138;
    v30 = swift_bridgeObjectRetain();
    v31 = MEMORY[0x242617424](v30, &type metadata for AwardCanvasSectionDescriptor);
    v33 = v32;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 624) = sub_23C13746C(v31, v33, v38);
    sub_23C1390D4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23C0FD000, v26, v27, "Fetched award descriptors: %s", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242617A54](v29, -1, -1);
    MEMORY[0x242617A54](v28, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v34 = *(_QWORD *)(v0 + 784);
  v35 = *(_QWORD *)(v0 + 768);
  *(_QWORD *)(v0 + 112) = *(_QWORD *)(v0 + 776);
  *(_QWORD *)(v0 + 120) = v34;
  *(_OWORD *)(v0 + 128) = *(_OWORD *)(v0 + 792);
  *(_QWORD *)(v0 + 144) = v35;
  *(_BYTE *)(v0 + 152) = 5;
  swift_bridgeObjectRetain();
  v36 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 832) = v36;
  *v36 = v0;
  v36[1] = sub_23C130308;
  return sub_23C138F78();
}

uint64_t sub_23C130308()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 760);
  v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  *(_QWORD *)(v1 + 64) = v2;
  v1 += 64;
  *(_OWORD *)(v1 + 8) = 0u;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_BYTE *)(v1 + 40) = 4;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 776) = v4;
  *v4 = v3;
  v4[1] = sub_23C1303CC;
  return sub_23C138F78();
}

uint64_t sub_23C1303CC()
{
  uint64_t *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v5)(void);
  uint64_t (*v7)(void);

  v1 = *v0;
  v2 = *(unsigned __int8 *)(*v0 + 107);
  v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v2 == 1)
  {
    v7 = (uint64_t (*)(void))(**(int **)(v1 + 712) + *(_QWORD *)(v1 + 712));
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 848) = v4;
    *v4 = v3;
    v4[1] = sub_23C13046C;
    v5 = v7;
  }
  else
  {
    v5 = *(uint64_t (**)(void))(v3 + 8);
  }
  return v5();
}

uint64_t sub_23C13046C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23C1304B8(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(void);

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    MEMORY[0x2426178F8](v1);
    a1 = 4;
  }
  *(_BYTE *)(v4 + 109) = a1;
  v8 = (uint64_t (*)(void))(**(int **)(v4 + 680) + *(_QWORD *)(v4 + 680));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 864) = v6;
  *v6 = v5;
  v6[1] = sub_23C13054C;
  return v8();
}

uint64_t sub_23C13054C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *v0;
  v2 = *(unsigned __int8 *)(*v0 + 109);
  v3 = *v0;
  swift_task_dealloc();
  *(_QWORD *)(v1 + 304) = v2;
  *(_QWORD *)(v1 + 312) = 0;
  *(_QWORD *)(v1 + 328) = 0;
  *(_QWORD *)(v1 + 336) = 0;
  *(_QWORD *)(v1 + 320) = 1;
  *(_BYTE *)(v1 + 344) = 1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 872) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
  *v4 = v3;
  v4[1] = sub_23C1305EC;
  return sub_23C138F78();
}

uint64_t sub_23C1305EC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23C130638()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v4 = *v0;
  swift_task_dealloc();
  *(_QWORD *)(v1 + 400) = 5;
  *(_OWORD *)(v1 + 408) = 0u;
  *(_OWORD *)(v1 + 424) = 0u;
  *(_BYTE *)(v1 + 440) = 8;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 904) = v2;
  *v2 = v4;
  v2[1] = sub_23C1306C8;
  return sub_23C138F78();
}

uint64_t sub_23C1306C8()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C13071C()
{
  uint64_t v0;

  MEMORY[0x2426178F8](*(_QWORD *)(v0 + 880));
  MEMORY[0x2426178F8](*(_QWORD *)(v0 + 600));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C130758()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *v0;
  v2 = *v0;
  swift_task_dealloc();
  *(_QWORD *)(v1 + 160) = 5;
  v1 += 160;
  *(_OWORD *)(v1 + 8) = 0u;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_BYTE *)(v1 + 40) = 8;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 768) = v3;
  *v3 = v2;
  v3[1] = sub_23C1307E4;
  return sub_23C138F78();
}

uint64_t sub_23C1307E4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C130838()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23C130898()
{
  uint64_t v0;

  MEMORY[0x2426178F8](*(_QWORD *)(v0 + 880));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C1308CC()
{
  uint64_t v0;
  void *v1;
  _BYTE *v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  _QWORD *v13;
  uint64_t (*v14)();
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v1 = *(void **)(v0 + 736);
  *(_QWORD *)(v0 + 880) = v1;
  if (qword_256B21870 != -1)
    swift_once();
  v2 = (_BYTE *)(v0 + 105);
  v3 = sub_23C138C18();
  __swift_project_value_buffer(v3, (uint64_t)qword_256B2FCD0);
  v4 = v1;
  v5 = v1;
  v6 = sub_23C138C00();
  v7 = sub_23C1390C8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v18 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_getErrorValue();
    v10 = sub_23C1392B4();
    *(_QWORD *)(v0 + 592) = sub_23C13746C(v10, v11, &v18);
    sub_23C1390D4();
    swift_bridgeObjectRelease();
    MEMORY[0x2426178F8](v1);
    MEMORY[0x2426178F8](v1);
    _os_log_impl(&dword_23C0FD000, v6, v7, "Failed to fetched descriptors with error: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242617A54](v9, -1, -1);
    MEMORY[0x242617A54](v8, -1, -1);
  }
  else
  {
    MEMORY[0x2426178F8](v1);
    MEMORY[0x2426178F8](v1);
  }

  *(_QWORD *)(v0 + 600) = v1;
  v12 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B23098);
  if (!swift_dynamicCast())
    goto LABEL_10;
  if (!*v2)
  {
    *(_OWORD *)(v0 + 256) = xmmword_23C140070;
    *(_QWORD *)(v0 + 280) = 0;
    *(_QWORD *)(v0 + 288) = 0;
    *(_QWORD *)(v0 + 272) = 2;
    *(_BYTE *)(v0 + 296) = 1;
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 912) = v13;
    *(_QWORD *)(v0 + 920) = __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    v14 = sub_23C130758;
    goto LABEL_12;
  }
  if (*v2 == 1)
  {
    *(_QWORD *)(v0 + 352) = 0;
    *(_QWORD *)(v0 + 360) = 0;
    *(_QWORD *)(v0 + 376) = 0;
    *(_QWORD *)(v0 + 384) = 0;
    *(_QWORD *)(v0 + 368) = 2;
    *(_BYTE *)(v0 + 392) = 1;
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 888) = v13;
    *(_QWORD *)(v0 + 896) = __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    v14 = sub_23C130638;
  }
  else
  {
LABEL_10:
    MEMORY[0x2426178F8](*(_QWORD *)(v0 + 600));
    swift_getErrorValue();
    v15 = sub_23C1392B4();
    *(_QWORD *)(v0 + 936) = v16;
    *(_QWORD *)(v0 + 208) = v15;
    *(_QWORD *)(v0 + 216) = v16;
    *(_QWORD *)(v0 + 224) = 0;
    *(_QWORD *)(v0 + 232) = 0;
    *(_QWORD *)(v0 + 240) = 0;
    *(_BYTE *)(v0 + 248) = 3;
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 944) = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    v14 = sub_23C130838;
  }
LABEL_12:
  *v13 = v0;
  v13[1] = v14;
  return sub_23C138F78();
}

uint64_t sub_23C130C3C()
{
  uint64_t v0;
  void *v1;
  _BYTE *v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  _QWORD *v13;
  uint64_t (*v14)();
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v1 = *(void **)(v0 + 752);
  *(_QWORD *)(v0 + 880) = v1;
  if (qword_256B21870 != -1)
    swift_once();
  v2 = (_BYTE *)(v0 + 105);
  v3 = sub_23C138C18();
  __swift_project_value_buffer(v3, (uint64_t)qword_256B2FCD0);
  v4 = v1;
  v5 = v1;
  v6 = sub_23C138C00();
  v7 = sub_23C1390C8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v18 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_getErrorValue();
    v10 = sub_23C1392B4();
    *(_QWORD *)(v0 + 592) = sub_23C13746C(v10, v11, &v18);
    sub_23C1390D4();
    swift_bridgeObjectRelease();
    MEMORY[0x2426178F8](v1);
    MEMORY[0x2426178F8](v1);
    _os_log_impl(&dword_23C0FD000, v6, v7, "Failed to fetched descriptors with error: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242617A54](v9, -1, -1);
    MEMORY[0x242617A54](v8, -1, -1);
  }
  else
  {
    MEMORY[0x2426178F8](v1);
    MEMORY[0x2426178F8](v1);
  }

  *(_QWORD *)(v0 + 600) = v1;
  v12 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B23098);
  if (!swift_dynamicCast())
    goto LABEL_10;
  if (!*v2)
  {
    *(_OWORD *)(v0 + 256) = xmmword_23C140070;
    *(_QWORD *)(v0 + 280) = 0;
    *(_QWORD *)(v0 + 288) = 0;
    *(_QWORD *)(v0 + 272) = 2;
    *(_BYTE *)(v0 + 296) = 1;
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 912) = v13;
    *(_QWORD *)(v0 + 920) = __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    v14 = sub_23C130758;
    goto LABEL_12;
  }
  if (*v2 == 1)
  {
    *(_QWORD *)(v0 + 352) = 0;
    *(_QWORD *)(v0 + 360) = 0;
    *(_QWORD *)(v0 + 376) = 0;
    *(_QWORD *)(v0 + 384) = 0;
    *(_QWORD *)(v0 + 368) = 2;
    *(_BYTE *)(v0 + 392) = 1;
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 888) = v13;
    *(_QWORD *)(v0 + 896) = __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    v14 = sub_23C130638;
  }
  else
  {
LABEL_10:
    MEMORY[0x2426178F8](*(_QWORD *)(v0 + 600));
    swift_getErrorValue();
    v15 = sub_23C1392B4();
    *(_QWORD *)(v0 + 936) = v16;
    *(_QWORD *)(v0 + 208) = v15;
    *(_QWORD *)(v0 + 216) = v16;
    *(_QWORD *)(v0 + 224) = 0;
    *(_QWORD *)(v0 + 232) = 0;
    *(_QWORD *)(v0 + 240) = 0;
    *(_BYTE *)(v0 + 248) = 3;
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 944) = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    v14 = sub_23C130838;
  }
LABEL_12:
  *v13 = v0;
  v13[1] = v14;
  return sub_23C138F78();
}

void ForYouFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  __int128 *v4;
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
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[16];
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;

  v45 = a2;
  v46 = a3;
  sub_23C109624(a4, &v47);
  v41 = v47;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DB8);
  MEMORY[0x24BDAC7A8](v6);
  v40[14] = (char *)v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_23C138BAC();
  MEMORY[0x24BDAC7A8](v42);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22F38);
  v43 = *(_QWORD *)(v8 - 8);
  v44 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v40[5] = (char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v40[13] = (char *)v40 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v40[12] = (char *)v40 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v40[11] = (char *)v40 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v40[10] = (char *)v40 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v40[9] = (char *)v40 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v40[4] = (char *)v40 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v40[8] = (char *)v40 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v40[7] = (char *)v40 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v40[6] = (char *)v40 - v28;
  v29 = MEMORY[0x24BDAC7A8](v27);
  v30 = MEMORY[0x24BDAC7A8](v29);
  v31 = MEMORY[0x24BDAC7A8](v30);
  MEMORY[0x24BDAC7A8](v31);
  v32 = v4[13];
  v62 = v4[12];
  v63 = v32;
  v33 = v4[15];
  v64 = v4[14];
  v65 = v33;
  v34 = v4[9];
  v58 = v4[8];
  v59 = v34;
  v35 = v4[11];
  v60 = v4[10];
  v61 = v35;
  v36 = v4[5];
  v54 = v4[4];
  v55 = v36;
  v37 = v4[7];
  v56 = v4[6];
  v57 = v37;
  v38 = v4[1];
  v50 = *v4;
  v51 = v38;
  v39 = v4[3];
  v52 = v4[2];
  v53 = v39;
  v40[15] = a4;
  sub_23C109624(a4, &v48);
  __asm { BR              X10 }
}

void sub_23C1312AC()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  *(_BYTE *)(v0 + 559) = v1 & 1;
  if (qword_256B21870 != -1)
    swift_once();
  v2 = sub_23C138C18();
  __swift_project_value_buffer(v2, (uint64_t)qword_256B2FCD0);
  v3 = sub_23C138C00();
  v4 = sub_23C1390C8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    *(_QWORD *)(v0 + 208) = v6;
    *(_DWORD *)v5 = 136315138;
    *(_BYTE *)(v0 + 200) = *(_BYTE *)(v0 + 559);
    v7 = sub_23C138FF0();
    *(_QWORD *)(v0 + 200) = sub_23C13746C(v7, v8, (uint64_t *)(v0 + 208));
    sub_23C1390D4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C0FD000, v3, v4, "Browsing Identity Updated to state: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242617A54](v6, -1, -1);
    MEMORY[0x242617A54](v5, -1, -1);
  }

  v10 = *(_QWORD *)(v0 + 168);
  v9 = *(unint64_t **)(v0 + 176);
  v11 = type metadata accessor for ForYouState();
  if ((*(_BYTE *)(v10 + *(int *)(v11 + 24)) & 1) != 0 || (*(_BYTE *)(v10 + *(int *)(v11 + 80)) & 1) != 0)
  {
    v12 = *(_OWORD *)(v0 + 768);
    *(_OWORD *)(v0 + 400) = *(_OWORD *)(v0 + 752);
    *(_OWORD *)(v0 + 416) = v12;
    v13 = *(_OWORD *)(v0 + 800);
    *(_OWORD *)(v0 + 432) = *(_OWORD *)(v0 + 784);
    *(_OWORD *)(v0 + 448) = v13;
    v14 = *(_OWORD *)(v0 + 704);
    *(_OWORD *)(v0 + 336) = *(_OWORD *)(v0 + 688);
    *(_OWORD *)(v0 + 352) = v14;
    v15 = *(_OWORD *)(v0 + 736);
    *(_OWORD *)(v0 + 368) = *(_OWORD *)(v0 + 720);
    *(_OWORD *)(v0 + 384) = v15;
    v16 = *(_OWORD *)(v0 + 640);
    *(_OWORD *)(v0 + 272) = *(_OWORD *)(v0 + 624);
    *(_OWORD *)(v0 + 288) = v16;
    v17 = *(_OWORD *)(v0 + 672);
    *(_OWORD *)(v0 + 304) = *(_OWORD *)(v0 + 656);
    *(_OWORD *)(v0 + 320) = v17;
    v18 = *(_OWORD *)(v0 + 576);
    *(_OWORD *)(v0 + 208) = *(_OWORD *)(v0 + 560);
    *(_OWORD *)(v0 + 224) = v18;
    v19 = *(_OWORD *)(v0 + 608);
    *(_OWORD *)(v0 + 240) = *(_OWORD *)(v0 + 592);
    *(_OWORD *)(v0 + 256) = v19;
    sub_23C12E340(v10, v9, 1);
  }
  else
  {
    sub_23C12E97C(0, 0, 0, 2, v10);
  }
}

unint64_t sub_23C1334A0()
{
  unint64_t result;

  result = qword_256B22F48;
  if (!qword_256B22F48)
  {
    result = MEMORY[0x2426179DC](&unk_23C140150, &type metadata for ForYouFeature.TaskIdentifier);
    atomic_store(result, &qword_256B22F48);
  }
  return result;
}

uint64_t sub_23C1334E4()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 64) = sub_23C139068();
  *(_QWORD *)(v0 + 72) = sub_23C13905C();
  *(_QWORD *)(v0 + 16) = 5;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_BYTE *)(v0 + 56) = 8;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
  *v1 = v0;
  v1[1] = sub_23C13358C;
  return sub_23C138F78();
}

uint64_t sub_23C13358C()
{
  swift_task_dealloc();
  sub_23C139044();
  return swift_task_switch();
}

uint64_t sub_23C1335FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v6;

  *(_QWORD *)(v3 + 64) = sub_23C139068();
  *(_QWORD *)(v3 + 72) = sub_23C13905C();
  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = a3;
  *(_QWORD *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 40) = 0;
  *(_QWORD *)(v3 + 48) = 0;
  *(_BYTE *)(v3 + 56) = 1;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 80) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
  *v6 = v3;
  v6[1] = sub_23C1336A4;
  return sub_23C138F78();
}

uint64_t sub_23C1336A4()
{
  swift_task_dealloc();
  sub_23C139044();
  return swift_task_switch();
}

uint64_t sub_23C133714()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C133748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v6;
  uint64_t (*v8)(void);

  v4[2] = sub_23C139068();
  v4[3] = sub_23C13905C();
  v8 = (uint64_t (*)(void))(**(int **)(a4 + 176) + *(_QWORD *)(a4 + 176));
  v6 = (_QWORD *)swift_task_alloc();
  v4[4] = v6;
  *v6 = v4;
  v6[1] = sub_23C1337BC;
  return v8();
}

uint64_t sub_23C1337BC()
{
  swift_task_dealloc();
  sub_23C139044();
  return swift_task_switch();
}

uint64_t sub_23C13382C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C13385C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23C13908C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23C139080();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23C138860(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23C139044();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23C1339A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v6;
  uint64_t (*v8)(void);

  v4[2] = sub_23C139068();
  v4[3] = sub_23C13905C();
  v8 = (uint64_t (*)(void))(**(int **)(a4 + 192) + *(_QWORD *)(a4 + 192));
  v6 = (_QWORD *)swift_task_alloc();
  v4[4] = v6;
  *v6 = v4;
  v6[1] = sub_23C133A14;
  return v8();
}

uint64_t sub_23C133A14()
{
  swift_task_dealloc();
  sub_23C139044();
  return swift_task_switch();
}

uint64_t sub_23C133A84()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 64) = sub_23C139068();
  *(_QWORD *)(v0 + 72) = sub_23C13905C();
  *(_QWORD *)(v0 + 16) = 1;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_BYTE *)(v0 + 56) = 2;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
  *v1 = v0;
  v1[1] = sub_23C13358C;
  return sub_23C138F78();
}

uint64_t sub_23C133B2C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD *);

  v2[18] = a1;
  v2[19] = sub_23C139068();
  v2[20] = sub_23C13905C();
  v6 = (uint64_t (*)(_QWORD *))(**(int **)(a2 + 16) + *(_QWORD *)(a2 + 16));
  v4 = (_QWORD *)swift_task_alloc();
  v2[21] = v4;
  *v4 = v2;
  v4[1] = sub_23C133BB4;
  return v6(v2 + 13);
}

uint64_t sub_23C133BB4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 176) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 184) = sub_23C139044();
  *(_QWORD *)(v2 + 192) = v3;
  return swift_task_switch();
}

uint64_t sub_23C133C40()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[16];
  v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  v3 = *(_QWORD *)(v1 - 8);
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, _QWORD *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_23C1390B0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  v0[25] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_23C133DA0;
  return sub_23C139050();
}

uint64_t sub_23C133DA0()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C133DF4()
{
  uint64_t v0;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  if (*(_BYTE *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    if (qword_256B21870 != -1)
      swift_once();
    v2 = sub_23C138C18();
    __swift_project_value_buffer(v2, (uint64_t)qword_256B2FCD0);
    v3 = sub_23C138C00();
    v4 = sub_23C1390C8();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = swift_slowAlloc();
      v6 = swift_slowAlloc();
      v10 = v6;
      *(_DWORD *)v5 = 136315138;
      v7 = sub_23C138FF0();
      *(_QWORD *)(v5 + 4) = sub_23C13746C(v7, v8, &v10);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C0FD000, v3, v4, "AchievementEnvironmentCache updated - refreshing. Updated cache %s ", (uint8_t *)v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242617A54](v6, -1, -1);
      MEMORY[0x242617A54](v5, -1, -1);
    }

    *(_QWORD *)(v0 + 48) = 0;
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    *(_BYTE *)(v0 + 56) = 2;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    *v9 = v0;
    v9[1] = sub_23C133FD8;
    return sub_23C138F78();
  }
}

uint64_t sub_23C133FD8()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C134024()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[25] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23C133DA0;
  return sub_23C139050();
}

uint64_t sub_23C1340C8()
{
  return objectdestroyTm_0();
}

uint64_t sub_23C1340D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C12B4C4;
  return sub_23C133B2C(a1, v1 + 16);
}

uint64_t sub_23C134124(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23C134234(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD *);

  v2[18] = a1;
  v2[19] = sub_23C139068();
  v2[20] = sub_23C13905C();
  v6 = (uint64_t (*)(_QWORD *))(**(int **)(a2 + 32) + *(_QWORD *)(a2 + 32));
  v4 = (_QWORD *)swift_task_alloc();
  v2[21] = v4;
  *v4 = v2;
  v4[1] = sub_23C1342BC;
  return v6(v2 + 13);
}

uint64_t sub_23C1342BC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 176) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 184) = sub_23C139044();
  *(_QWORD *)(v2 + 192) = v3;
  return swift_task_switch();
}

uint64_t sub_23C134348()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[16];
  v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  v3 = *(_QWORD *)(v1 - 8);
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, _QWORD *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_23C1390B0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  v0[25] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_23C1344A8;
  return sub_23C139050();
}

uint64_t sub_23C1344A8()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C1344FC()
{
  uint64_t v0;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;

  if (*(_BYTE *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    if (qword_256B21870 != -1)
      swift_once();
    v2 = sub_23C138C18();
    __swift_project_value_buffer(v2, (uint64_t)qword_256B2FCD0);
    v3 = sub_23C138C00();
    v4 = sub_23C1390C8();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23C0FD000, v3, v4, "Active Workout Plan Updated — refreshing", v5, 2u);
      MEMORY[0x242617A54](v5, -1, -1);
    }

    *(_QWORD *)(v0 + 16) = 4;
    *(_OWORD *)(v0 + 24) = 0u;
    *(_OWORD *)(v0 + 40) = 0u;
    *(_BYTE *)(v0 + 56) = 2;
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    *v6 = v0;
    v6[1] = sub_23C134670;
    return sub_23C138F78();
  }
}

uint64_t sub_23C134670()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C1346BC()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[25] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23C1344A8;
  return sub_23C139050();
}

uint64_t sub_23C134760(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD *);

  v2[18] = a1;
  v2[19] = sub_23C139068();
  v2[20] = sub_23C13905C();
  v6 = (uint64_t (*)(_QWORD *))(**(int **)(a2 + 48) + *(_QWORD *)(a2 + 48));
  v4 = (_QWORD *)swift_task_alloc();
  v2[21] = v4;
  *v4 = v2;
  v4[1] = sub_23C1347E8;
  return v6(v2 + 13);
}

uint64_t sub_23C1347E8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 176) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 184) = sub_23C139044();
  *(_QWORD *)(v2 + 192) = v3;
  return swift_task_switch();
}

uint64_t sub_23C134874()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[16];
  v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  v3 = *(_QWORD *)(v1 - 8);
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, _QWORD *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_23C1390B0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  v0[25] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_23C1349D4;
  return sub_23C139050();
}

uint64_t sub_23C1349D4()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C134A28()
{
  uint64_t v0;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;

  if (*(_BYTE *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    if (qword_256B21870 != -1)
      swift_once();
    v2 = sub_23C138C18();
    __swift_project_value_buffer(v2, (uint64_t)qword_256B2FCD0);
    v3 = sub_23C138C00();
    v4 = sub_23C1390C8();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23C0FD000, v3, v4, "Allowed Content Ratings Updated — refreshing", v5, 2u);
      MEMORY[0x242617A54](v5, -1, -1);
    }

    *(_QWORD *)(v0 + 16) = 1;
    *(_OWORD *)(v0 + 24) = 0u;
    *(_OWORD *)(v0 + 40) = 0u;
    *(_BYTE *)(v0 + 56) = 2;
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    *v6 = v0;
    v6[1] = sub_23C134B9C;
    return sub_23C138F78();
  }
}

uint64_t sub_23C134B9C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C134BE8()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[25] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23C1349D4;
  return sub_23C139050();
}

uint64_t sub_23C134C8C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD *);

  v2[18] = a1;
  v2[19] = sub_23C139068();
  v2[20] = sub_23C13905C();
  v6 = (uint64_t (*)(_QWORD *))(**(int **)(a2 + 64) + *(_QWORD *)(a2 + 64));
  v4 = (_QWORD *)swift_task_alloc();
  v2[21] = v4;
  *v4 = v2;
  v4[1] = sub_23C134D14;
  return v6(v2 + 13);
}

uint64_t sub_23C134D14()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 176) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 184) = sub_23C139044();
  *(_QWORD *)(v2 + 192) = v3;
  return swift_task_switch();
}

uint64_t sub_23C134DA0()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[16];
  v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  v3 = *(_QWORD *)(v1 - 8);
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, _QWORD *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_23C1390B0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  v0[25] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_23C134F00;
  return sub_23C139050();
}

uint64_t sub_23C134F00()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C134F54()
{
  uint64_t v0;
  _QWORD *v2;

  if (*(_BYTE *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_QWORD *)(v0 + 48) = 0;
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    *(_BYTE *)(v0 + 56) = 8;
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    *v2 = v0;
    v2[1] = sub_23C135018;
    return sub_23C138F78();
  }
}

uint64_t sub_23C135018()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C135064()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[25] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23C134F00;
  return sub_23C139050();
}

uint64_t sub_23C135108(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD *);

  v2[18] = a1;
  v2[19] = sub_23C139068();
  v2[20] = sub_23C13905C();
  v6 = (uint64_t (*)(_QWORD *))(**(int **)(a2 + 80) + *(_QWORD *)(a2 + 80));
  v4 = (_QWORD *)swift_task_alloc();
  v2[21] = v4;
  *v4 = v2;
  v4[1] = sub_23C135190;
  return v6(v2 + 13);
}

uint64_t sub_23C135190()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 176) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 184) = sub_23C139044();
  *(_QWORD *)(v2 + 192) = v3;
  return swift_task_switch();
}

uint64_t sub_23C13521C()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[16];
  v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  v3 = *(_QWORD *)(v1 - 8);
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, _QWORD *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_23C1390B0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  v0[25] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_23C13537C;
  return sub_23C139050();
}

uint64_t sub_23C13537C()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C1353D0()
{
  uint64_t v0;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;

  if (*(_BYTE *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    if (qword_256B21870 != -1)
      swift_once();
    v2 = sub_23C138C18();
    __swift_project_value_buffer(v2, (uint64_t)qword_256B2FCD0);
    v3 = sub_23C138C00();
    v4 = sub_23C1390C8();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23C0FD000, v3, v4, "Catalog Deleted — refreshing", v5, 2u);
      MEMORY[0x242617A54](v5, -1, -1);
    }

    *(_QWORD *)(v0 + 16) = 3;
    *(_OWORD *)(v0 + 24) = 0u;
    *(_OWORD *)(v0 + 40) = 0u;
    *(_BYTE *)(v0 + 56) = 2;
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    *v6 = v0;
    v6[1] = sub_23C135544;
    return sub_23C138F78();
  }
}

uint64_t sub_23C135544()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C135590()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[25] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23C13537C;
  return sub_23C139050();
}

uint64_t sub_23C135634(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD *);

  v2[18] = a1;
  v2[19] = sub_23C139068();
  v2[20] = sub_23C13905C();
  v6 = (uint64_t (*)(_QWORD *))(**(int **)(a2 + 96) + *(_QWORD *)(a2 + 96));
  v4 = (_QWORD *)swift_task_alloc();
  v2[21] = v4;
  *v4 = v2;
  v4[1] = sub_23C1356BC;
  return v6(v2 + 13);
}

uint64_t sub_23C1356BC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 176) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 184) = sub_23C139044();
  *(_QWORD *)(v2 + 192) = v3;
  return swift_task_switch();
}

uint64_t sub_23C135748()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[16];
  v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  v3 = *(_QWORD *)(v1 - 8);
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, _QWORD *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_23C1390B0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  v0[25] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_23C1358A8;
  return sub_23C139050();
}

uint64_t sub_23C1358A8()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C1358FC()
{
  uint64_t v0;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;

  if (*(_BYTE *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    if (qword_256B21870 != -1)
      swift_once();
    v2 = sub_23C138C18();
    __swift_project_value_buffer(v2, (uint64_t)qword_256B2FCD0);
    v3 = sub_23C138C00();
    v4 = sub_23C1390C8();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23C0FD000, v3, v4, "Content Availability Updated — refreshing", v5, 2u);
      MEMORY[0x242617A54](v5, -1, -1);
    }

    *(_QWORD *)(v0 + 16) = 1;
    *(_OWORD *)(v0 + 24) = 0u;
    *(_OWORD *)(v0 + 40) = 0u;
    *(_BYTE *)(v0 + 56) = 2;
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    *v6 = v0;
    v6[1] = sub_23C135A70;
    return sub_23C138F78();
  }
}

uint64_t sub_23C135A70()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C135ABC()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[25] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23C1358A8;
  return sub_23C139050();
}

uint64_t sub_23C135B60()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C135B94(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD *);

  v2[18] = a1;
  v2[19] = sub_23C139068();
  v2[20] = sub_23C13905C();
  v6 = (uint64_t (*)(_QWORD *))(**(int **)(a2 + 112) + *(_QWORD *)(a2 + 112));
  v4 = (_QWORD *)swift_task_alloc();
  v2[21] = v4;
  *v4 = v2;
  v4[1] = sub_23C135C1C;
  return v6(v2 + 13);
}

uint64_t sub_23C135C1C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  swift_task_dealloc();
  *(_QWORD *)(v1 + 176) = sub_23C139044();
  *(_QWORD *)(v1 + 184) = v2;
  return swift_task_switch();
}

uint64_t sub_23C135C90()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[16];
  v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  v3 = *(_QWORD *)(v1 - 8);
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, _QWORD *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_23C1390B0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  v0[24] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[25] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_23C135DF0;
  return sub_23C139050();
}

uint64_t sub_23C135DF0()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C135E44()
{
  uint64_t v0;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;

  if (*(_BYTE *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    if (qword_256B21870 != -1)
      swift_once();
    v2 = sub_23C138C18();
    __swift_project_value_buffer(v2, (uint64_t)qword_256B2FCD0);
    v3 = sub_23C138C00();
    v4 = sub_23C1390C8();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23C0FD000, v3, v4, "Onboarding Survey Results Updated — refreshing", v5, 2u);
      MEMORY[0x242617A54](v5, -1, -1);
    }

    *(_QWORD *)(v0 + 48) = 0;
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    *(_BYTE *)(v0 + 56) = 2;
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 208) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    *v6 = v0;
    v6[1] = sub_23C135FB4;
    return sub_23C138F78();
  }
}

uint64_t sub_23C135FB4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C136000()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[24] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[25] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23C135DF0;
  return sub_23C139050();
}

uint64_t sub_23C1360A4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD *);

  v2[18] = a1;
  v2[19] = sub_23C139068();
  v2[20] = sub_23C13905C();
  v6 = (uint64_t (*)(_QWORD *))(**(int **)(a2 + 128) + *(_QWORD *)(a2 + 128));
  v4 = (_QWORD *)swift_task_alloc();
  v2[21] = v4;
  *v4 = v2;
  v4[1] = sub_23C13612C;
  return v6(v2 + 13);
}

uint64_t sub_23C13612C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 176) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 184) = sub_23C139044();
  *(_QWORD *)(v2 + 192) = v3;
  return swift_task_switch();
}

uint64_t sub_23C1361B8()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[16];
  v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  v3 = *(_QWORD *)(v1 - 8);
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, _QWORD *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_23C1390B0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  v0[25] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_23C136318;
  return sub_23C139050();
}

uint64_t sub_23C136318()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C13636C()
{
  uint64_t v0;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;

  if (*(_BYTE *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    if (qword_256B21870 != -1)
      swift_once();
    v2 = sub_23C138C18();
    __swift_project_value_buffer(v2, (uint64_t)qword_256B2FCD0);
    v3 = sub_23C138C00();
    v4 = sub_23C1390C8();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23C0FD000, v3, v4, "Personalization Privacy Preference Updated — refreshing", v5, 2u);
      MEMORY[0x242617A54](v5, -1, -1);
    }

    *(_QWORD *)(v0 + 16) = 1;
    *(_OWORD *)(v0 + 24) = 0u;
    *(_OWORD *)(v0 + 40) = 0u;
    *(_BYTE *)(v0 + 56) = 2;
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    *v6 = v0;
    v6[1] = sub_23C1364E0;
    return sub_23C138F78();
  }
}

uint64_t sub_23C1364E0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C13652C()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[25] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23C136318;
  return sub_23C139050();
}

uint64_t sub_23C1365D0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD *);

  v2[18] = a1;
  v2[19] = sub_23C139068();
  v2[20] = sub_23C13905C();
  v6 = (uint64_t (*)(_QWORD *))(**(int **)(a2 + 144) + *(_QWORD *)(a2 + 144));
  v4 = (_QWORD *)swift_task_alloc();
  v2[21] = v4;
  *v4 = v2;
  v4[1] = sub_23C136658;
  return v6(v2 + 13);
}

uint64_t sub_23C136658()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 176) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 184) = sub_23C139044();
  *(_QWORD *)(v2 + 192) = v3;
  return swift_task_switch();
}

uint64_t sub_23C1366E4()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[16];
  v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  v3 = *(_QWORD *)(v1 - 8);
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, _QWORD *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_23C1390B0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  v0[25] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_23C136844;
  return sub_23C139050();
}

uint64_t sub_23C136844()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C136898()
{
  uint64_t v0;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;

  if (*(_BYTE *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    if (qword_256B21870 != -1)
      swift_once();
    v2 = sub_23C138C18();
    __swift_project_value_buffer(v2, (uint64_t)qword_256B2FCD0);
    v3 = sub_23C138C00();
    v4 = sub_23C1390C8();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23C0FD000, v3, v4, "Significant Time Change — refreshing", v5, 2u);
      MEMORY[0x242617A54](v5, -1, -1);
    }

    *(_QWORD *)(v0 + 16) = 1;
    *(_OWORD *)(v0 + 24) = 0u;
    *(_OWORD *)(v0 + 40) = 0u;
    *(_BYTE *)(v0 + 56) = 2;
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    *v6 = v0;
    v6[1] = sub_23C136A0C;
    return sub_23C138F78();
  }
}

uint64_t sub_23C136A0C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C136A58()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[25] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23C136844;
  return sub_23C139050();
}

uint64_t sub_23C136AFC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD *);

  v2[18] = a1;
  v2[19] = sub_23C139068();
  v2[20] = sub_23C13905C();
  v6 = (uint64_t (*)(_QWORD *))(**(int **)(a2 + 160) + *(_QWORD *)(a2 + 160));
  v4 = (_QWORD *)swift_task_alloc();
  v2[21] = v4;
  *v4 = v2;
  v4[1] = sub_23C136B84;
  return v6(v2 + 13);
}

uint64_t sub_23C136B84()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 176) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 184) = sub_23C139044();
  *(_QWORD *)(v2 + 192) = v3;
  return swift_task_switch();
}

uint64_t sub_23C136C10()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[16];
  v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  v3 = *(_QWORD *)(v1 - 8);
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, _QWORD *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_23C1390B0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  v0[25] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_23C136D70;
  return sub_23C139050();
}

uint64_t sub_23C136D70()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C136DC4()
{
  uint64_t v0;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;

  if (*(_BYTE *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    if (qword_256B21870 != -1)
      swift_once();
    v2 = sub_23C138C18();
    __swift_project_value_buffer(v2, (uint64_t)qword_256B2FCD0);
    v3 = sub_23C138C00();
    v4 = sub_23C1390C8();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23C0FD000, v3, v4, "Wheelchair Status Updated — refreshing", v5, 2u);
      MEMORY[0x242617A54](v5, -1, -1);
    }

    *(_QWORD *)(v0 + 16) = 1;
    *(_OWORD *)(v0 + 24) = 0u;
    *(_OWORD *)(v0 + 40) = 0u;
    *(_BYTE *)(v0 + 56) = 2;
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B23060);
    *v6 = v0;
    v6[1] = sub_23C136F38;
    return sub_23C138F78();
  }
}

uint64_t sub_23C136F38()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C136F84()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[25] = sub_23C13905C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23C136D70;
  return sub_23C139050();
}

uint64_t sub_23C13702C(uint64_t a1, uint64_t a2)
{
  return _s13FitnessForYou0bC7FeatureV7dispose10localState06sharedG0y8DataFlow05EmptyG0V_AA0bcG0VztF_0(a2);
}

void sub_23C137034(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  _OWORD *v6;
  __int128 v7[3];

  v6 = sub_23C109624(a4, v7);
  ForYouFeature.reduce(localState:sharedState:sideEffects:action:)((uint64_t)v6, a2, a3, v7);
}

uint64_t sub_23C137080(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C1370E4;
  return v6(a1);
}

uint64_t sub_23C1370E4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23C137130()
{
  return objectdestroyTm_0();
}

uint64_t sub_23C137138(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C12B4C4;
  return sub_23C134234(a1, v1 + 16);
}

uint64_t sub_23C13718C()
{
  return objectdestroyTm_0();
}

uint64_t sub_23C137194(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C12B4C4;
  return sub_23C134760(a1, v1 + 16);
}

uint64_t sub_23C1371E8()
{
  return objectdestroyTm_0();
}

uint64_t sub_23C1371F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C12B4C4;
  return sub_23C134C8C(a1, v1 + 16);
}

uint64_t sub_23C137244()
{
  return objectdestroyTm_0();
}

uint64_t sub_23C13724C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C12B4C4;
  return sub_23C135108(a1, v1 + 16);
}

uint64_t sub_23C1372A0()
{
  return objectdestroyTm_0();
}

uint64_t sub_23C1372A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C12B4C4;
  return sub_23C135634(a1, v1 + 16);
}

uint64_t sub_23C1372FC()
{
  return objectdestroyTm_0();
}

uint64_t sub_23C137304(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C12B4C4;
  return sub_23C135B94(a1, v1 + 16);
}

uint64_t sub_23C137358()
{
  return objectdestroyTm_0();
}

uint64_t sub_23C137360(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C12B4C4;
  return sub_23C1360A4(a1, v1 + 16);
}

uint64_t sub_23C1373B4()
{
  return objectdestroyTm_0();
}

uint64_t sub_23C1373BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C12B4C4;
  return sub_23C1365D0(a1, v1 + 16);
}

uint64_t sub_23C137410()
{
  return objectdestroyTm_0();
}

uint64_t sub_23C137418(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C12B4C4;
  return sub_23C136AFC(a1, v1 + 16);
}

uint64_t sub_23C13746C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23C13753C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23C138934((uint64_t)v12, *a3);
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
      sub_23C138934((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23C13753C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23C1390E0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23C1376F4(a5, a6);
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
  v8 = sub_23C13911C();
  if (!v8)
  {
    sub_23C139158();
    __break(1u);
LABEL_17:
    result = sub_23C13917C();
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

uint64_t sub_23C1376F4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23C137788(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23C137960(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23C137960(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23C137788(uint64_t a1, unint64_t a2)
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
      v3 = sub_23C1378FC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23C1390F8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23C139158();
      __break(1u);
LABEL_10:
      v2 = sub_23C139014();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23C13917C();
    __break(1u);
LABEL_14:
    result = sub_23C139158();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23C1378FC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B23080);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23C137960(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B23080);
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
  result = sub_23C13917C();
  __break(1u);
  return result;
}

uint64_t sub_23C137AB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_23C12B4C4;
  return sub_23C1339A0(a1, v4, v5, v1 + 32);
}

uint64_t objectdestroy_39Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C137BC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_23C12AEF0;
  return sub_23C133748(a1, v4, v5, v1 + 32);
}

unint64_t sub_23C137C30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23C1392F0();
  sub_23C139008();
  v4 = sub_23C139320();
  return sub_23C137C94(a1, a2, v4);
}

unint64_t sub_23C137C94(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23C139284() & 1) == 0)
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
      while (!v14 && (sub_23C139284() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23C137D74(uint64_t a1, char a2)
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
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B23068);
  v37 = a2;
  v6 = sub_23C139170();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_38;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
  v36 = v5 + 64;
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
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1))
      goto LABEL_40;
    if (v14 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v14);
    if (!v24)
    {
      v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        v3 = v35;
        if ((v37 & 1) == 0)
          goto LABEL_38;
        goto LABEL_34;
      }
      v24 = *(_QWORD *)(v36 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          v14 = v25 + 1;
          if (__OFADD__(v25, 1))
            break;
          if (v14 >= v11)
            goto LABEL_31;
          v24 = *(_QWORD *)(v36 + 8 * v14);
          ++v25;
          if (v24)
            goto LABEL_20;
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    v26 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      sub_23C11E5D4(v29);
    }
    sub_23C1392F0();
    sub_23C139008();
    result = sub_23C139320();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v32 = v17 == v31;
        if (v17 == v31)
          v17 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v33 == -1);
      v18 = __clz(__rbit64(~v33)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v18) = v29;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_38;
LABEL_34:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_38:
  result = swift_release();
  *v3 = v7;
  return result;
}

void *sub_23C138064()
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B23068);
  v2 = *v0;
  v3 = sub_23C139164();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
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
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    if (!v23)
      break;
LABEL_23:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)sub_23C11E5D4(v20);
  }
  v24 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_23C138200(uint64_t a1)
{
  sub_23C10BAF8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  return a1;
}

uint64_t sub_23C138234()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C138258(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_23C12B4C4;
  return sub_23C1335FC(a1, v5, v4);
}

uint64_t _s13FitnessForYou0bC7FeatureV7dispose10localState06sharedG0y8DataFlow05EmptyG0V_AA0bcG0VztF_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  int64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  char isUniquelyReferenced_nonNull_native;
  char v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  char v27;
  uint64_t *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t result;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  sub_23C12E97C(0, 0, 0, 2, a1);
  v33 = *(int *)(type metadata accessor for ForYouState() + 20);
  v34 = a1;
  v2 = *(_QWORD *)(a1 + v33);
  v35 = v2 + 64;
  v3 = 1 << *(_BYTE *)(v2 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(v2 + 64);
  v6 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain_n();
  v7 = 0;
  v8 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v7 << 6);
    }
    else
    {
      v13 = v7 + 1;
      if (__OFADD__(v7, 1))
        goto LABEL_40;
      if (v13 >= v6)
      {
LABEL_37:
        swift_release();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        *(_QWORD *)(v34 + v33) = v8;
        return result;
      }
      v14 = *(_QWORD *)(v35 + 8 * v13);
      ++v7;
      if (!v14)
      {
        v7 = v13 + 1;
        if (v13 + 1 >= v6)
          goto LABEL_37;
        v14 = *(_QWORD *)(v35 + 8 * v7);
        if (!v14)
        {
          v7 = v13 + 2;
          if (v13 + 2 >= v6)
            goto LABEL_37;
          v14 = *(_QWORD *)(v35 + 8 * v7);
          if (!v14)
          {
            v7 = v13 + 3;
            if (v13 + 3 >= v6)
              goto LABEL_37;
            v14 = *(_QWORD *)(v35 + 8 * v7);
            if (!v14)
            {
              v7 = v13 + 4;
              if (v13 + 4 >= v6)
                goto LABEL_37;
              v14 = *(_QWORD *)(v35 + 8 * v7);
              if (!v14)
              {
                v15 = v13 + 5;
                if (v15 >= v6)
                  goto LABEL_37;
                v14 = *(_QWORD *)(v35 + 8 * v15);
                if (!v14)
                {
                  while (1)
                  {
                    v7 = v15 + 1;
                    if (__OFADD__(v15, 1))
                      goto LABEL_41;
                    if (v7 >= v6)
                      goto LABEL_37;
                    v14 = *(_QWORD *)(v35 + 8 * v7);
                    ++v15;
                    if (v14)
                      goto LABEL_25;
                  }
                }
                v7 = v15;
              }
            }
          }
        }
      }
LABEL_25:
      v5 = (v14 - 1) & v14;
      v12 = __clz(__rbit64(v14)) + (v7 << 6);
    }
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v12);
    v18 = *v16;
    v17 = v16[1];
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v21 = sub_23C137C30(v18, v17);
    v22 = v8[2];
    v23 = (v20 & 1) == 0;
    v24 = v22 + v23;
    if (__OFADD__(v22, v23))
      break;
    v25 = v20;
    if (v8[3] >= v24)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v20 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_23C138064();
        if ((v25 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_23C137D74(v24, isUniquelyReferenced_nonNull_native);
      v26 = sub_23C137C30(v18, v17);
      if ((v25 & 1) != (v27 & 1))
        goto LABEL_42;
      v21 = v26;
      if ((v25 & 1) != 0)
      {
LABEL_4:
        v9 = v8[7];
        v10 = *(_QWORD *)(v9 + 8 * v21);
        *(_QWORD *)(v9 + 8 * v21) = 0;
        sub_23C11E5E4(v10);
        goto LABEL_5;
      }
    }
    v8[(v21 >> 6) + 8] |= 1 << v21;
    v28 = (uint64_t *)(v8[6] + 16 * v21);
    *v28 = v18;
    v28[1] = v17;
    *(_QWORD *)(v8[7] + 8 * v21) = 0;
    v29 = v8[2];
    v30 = __OFADD__(v29, 1);
    v31 = v29 + 1;
    if (v30)
      goto LABEL_39;
    v8[2] = v31;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  result = sub_23C139290();
  __break(1u);
  return result;
}

unint64_t sub_23C1385D4()
{
  unint64_t result;

  result = qword_256B23040;
  if (!qword_256B23040)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for ForYouAction, &type metadata for ForYouAction);
    atomic_store(result, (unint64_t *)&qword_256B23040);
  }
  return result;
}

unint64_t sub_23C13861C()
{
  unint64_t result;

  result = qword_256B23048;
  if (!qword_256B23048)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for ForYouAction, &type metadata for ForYouAction);
    atomic_store(result, (unint64_t *)&qword_256B23048);
  }
  return result;
}

unint64_t sub_23C138664()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B23050;
  if (!qword_256B23050)
  {
    v1 = type metadata accessor for ForYouState();
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for ForYouState, v1);
    atomic_store(result, (unint64_t *)&qword_256B23050);
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouFeature()
{
  return &type metadata for ForYouFeature;
}

uint64_t getEnumTagSinglePayload for ForYouFeature.TaskIdentifier(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xED)
    goto LABEL_17;
  if (a2 + 19 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 19) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 19;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 19;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 19;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x14;
  v8 = v6 - 20;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ForYouFeature.TaskIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 19 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 19) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xED)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEC)
    return ((uint64_t (*)(void))((char *)&loc_23C138798 + 4 * byte_23C140096[v4]))();
  *a1 = a2 + 19;
  return ((uint64_t (*)(void))((char *)sub_23C1387CC + 4 * byte_23C140091[v4]))();
}

uint64_t sub_23C1387CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1387D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1387DCLL);
  return result;
}

uint64_t sub_23C1387E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1387F0);
  *(_BYTE *)result = a2 + 19;
  return result;
}

uint64_t sub_23C1387F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1387FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ForYouFeature.TaskIdentifier()
{
  return &type metadata for ForYouFeature.TaskIdentifier;
}

unint64_t sub_23C13881C()
{
  unint64_t result;

  result = qword_256B23058;
  if (!qword_256B23058)
  {
    result = MEMORY[0x2426179DC](&unk_23C140128, &type metadata for ForYouFeature.TaskIdentifier);
    atomic_store(result, (unint64_t *)&qword_256B23058);
  }
  return result;
}

uint64_t sub_23C138860(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B22DB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C1388A0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C1388C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23C12B4C4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256B23070 + dword_256B23070))(a1, v4);
}

uint64_t sub_23C138934(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
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

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
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

uint64_t sub_23C1389D4()
{
  return objectdestroyTm_0();
}

uint64_t objectdestroyTm_0()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C138A84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1 + 16;
  v5 = *(_BYTE *)(v1 + 272);
  v6 = *(_BYTE *)(v1 + 273);
  v7 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *(_QWORD *)v7 = v2;
  *(_QWORD *)(v7 + 8) = sub_23C12AEF0;
  *(_BYTE *)(v7 + 107) = v6;
  *(_BYTE *)(v7 + 106) = v5;
  *(_QWORD *)(v7 + 648) = v4;
  *(_QWORD *)(v7 + 640) = a1;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 656) = v8;
  *v8 = v7;
  v8[1] = sub_23C12F124;
  return sub_23C139098();
}

unint64_t sub_23C138B20()
{
  unint64_t result;

  result = qword_256B230A0;
  if (!qword_256B230A0)
  {
    result = MEMORY[0x2426179DC](&protocol conformance descriptor for ForYouError, &type metadata for ForYouError);
    atomic_store(result, (unint64_t *)&qword_256B230A0);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_23C138B94()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_23C138BA0()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_23C138BAC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23C138BB8()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23C138BC4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23C138BD0()
{
  return MEMORY[0x24BDCECD8]();
}

uint64_t sub_23C138BDC()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23C138BE8()
{
  return MEMORY[0x24BE35070]();
}

uint64_t sub_23C138BF4()
{
  return MEMORY[0x24BE35078]();
}

uint64_t sub_23C138C00()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23C138C0C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23C138C18()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23C138C24()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_23C138C30()
{
  return MEMORY[0x24BDEB4C0]();
}

uint64_t sub_23C138C3C()
{
  return MEMORY[0x24BDEB4D8]();
}

uint64_t sub_23C138C48()
{
  return MEMORY[0x24BDEB4F8]();
}

uint64_t sub_23C138C54()
{
  return MEMORY[0x24BDEB540]();
}

uint64_t sub_23C138C60()
{
  return MEMORY[0x24BDEB5B8]();
}

uint64_t sub_23C138C6C()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_23C138C78()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_23C138C84()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_23C138C90()
{
  return MEMORY[0x24BDEC6D8]();
}

uint64_t sub_23C138C9C()
{
  return MEMORY[0x24BDEC6E0]();
}

uint64_t sub_23C138CA8()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_23C138CB4()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_23C138CC0()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_23C138CCC()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_23C138CD8()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_23C138CE4()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_23C138CF0()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_23C138CFC()
{
  return MEMORY[0x24BDEE608]();
}

uint64_t sub_23C138D08()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_23C138D14()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_23C138D20()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_23C138D2C()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_23C138D38()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_23C138D44()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_23C138D50()
{
  return MEMORY[0x24BDEF540]();
}

uint64_t sub_23C138D5C()
{
  return MEMORY[0x24BDEFBF0]();
}

uint64_t sub_23C138D68()
{
  return MEMORY[0x24BDEFC18]();
}

uint64_t sub_23C138D74()
{
  return MEMORY[0x24BDF0138]();
}

uint64_t sub_23C138D80()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_23C138D8C()
{
  return MEMORY[0x24BDF1560]();
}

uint64_t sub_23C138D98()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_23C138DA4()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_23C138DB0()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_23C138DBC()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_23C138DC8()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_23C138DD4()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_23C138DE0()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23C138DEC()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23C138DF8()
{
  return MEMORY[0x24BDF23D8]();
}

uint64_t sub_23C138E04()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_23C138E10()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23C138E1C()
{
  return MEMORY[0x24BDF2CC8]();
}

uint64_t sub_23C138E28()
{
  return MEMORY[0x24BDF3390]();
}

uint64_t sub_23C138E34()
{
  return MEMORY[0x24BDF3628]();
}

uint64_t sub_23C138E40()
{
  return MEMORY[0x24BDF3690]();
}

uint64_t sub_23C138E4C()
{
  return MEMORY[0x24BDF3768]();
}

uint64_t sub_23C138E58()
{
  return MEMORY[0x24BDF38C8]();
}

uint64_t sub_23C138E64()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_23C138E70()
{
  return MEMORY[0x24BDF3970]();
}

uint64_t sub_23C138E7C()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_23C138E88()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_23C138E94()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_23C138EA0()
{
  return MEMORY[0x24BDF3F18]();
}

uint64_t sub_23C138EAC()
{
  return MEMORY[0x24BDF3F28]();
}

uint64_t sub_23C138EB8()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_23C138EC4()
{
  return MEMORY[0x24BDF4150]();
}

uint64_t sub_23C138ED0()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_23C138EDC()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_23C138EE8()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_23C138EF4()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_23C138F00()
{
  return MEMORY[0x24BDF4A28]();
}

uint64_t sub_23C138F0C()
{
  return MEMORY[0x24BDF4E28]();
}

uint64_t sub_23C138F18()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_23C138F24()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_23C138F30()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_23C138F3C()
{
  return MEMORY[0x24BDF4F38]();
}

uint64_t sub_23C138F48()
{
  return MEMORY[0x24BDF4F70]();
}

uint64_t sub_23C138F54()
{
  return MEMORY[0x24BDF4FB8]();
}

uint64_t sub_23C138F60()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_23C138F6C()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_23C138F78()
{
  return MEMORY[0x24BE2B460]();
}

uint64_t sub_23C138F84()
{
  return MEMORY[0x24BE2B560]();
}

uint64_t sub_23C138F90()
{
  return MEMORY[0x24BE2B588]();
}

uint64_t sub_23C138F9C()
{
  return MEMORY[0x24BE2B598]();
}

uint64_t sub_23C138FA8()
{
  return MEMORY[0x24BE2B5A8]();
}

uint64_t sub_23C138FB4()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_23C138FC0()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23C138FCC()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_23C138FD8()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_23C138FE4()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_23C138FF0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23C138FFC()
{
  return MEMORY[0x24BE37C28]();
}

uint64_t sub_23C139008()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23C139014()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23C139020()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23C13902C()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23C139038()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23C139044()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23C139050()
{
  return MEMORY[0x24BEE68D8]();
}

uint64_t sub_23C13905C()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23C139068()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23C139074()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_23C139080()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23C13908C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23C139098()
{
  return MEMORY[0x24BE88158]();
}

uint64_t sub_23C1390A4()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_23C1390B0()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_23C1390BC()
{
  return MEMORY[0x24BE8DC60]();
}

uint64_t sub_23C1390C8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23C1390D4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23C1390E0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23C1390EC()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23C1390F8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23C139104()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23C139110()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23C13911C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23C139128()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_23C139134()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_23C139140()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_23C13914C()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_23C139158()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23C139164()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23C139170()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23C13917C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23C139188()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23C139194()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23C1391A0()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23C1391AC()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23C1391B8()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_23C1391C4()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23C1391D0()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23C1391DC()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23C1391E8()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_23C1391F4()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23C139200()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23C13920C()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23C139218()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23C139224()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23C139230()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_23C13923C()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23C139248()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23C139254()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23C139260()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_23C13926C()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23C139278()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23C139284()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23C139290()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23C13929C()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_23C1392A8()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_23C1392B4()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_23C1392C0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23C1392CC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23C1392D8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23C1392E4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23C1392F0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23C1392FC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23C139308()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23C139314()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_23C139320()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23C13932C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23C139338()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23C139344()
{
  return MEMORY[0x24BEE48A0]();
}

uint64_t sub_23C139350()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23C13935C()
{
  return MEMORY[0x24BEE4A10]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

