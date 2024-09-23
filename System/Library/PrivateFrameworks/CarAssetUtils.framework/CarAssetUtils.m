uint64_t CAUPhysicalControlBarsLayout.seat_front_left.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CAUPhysicalControlBarsLayout.seat_front_right.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CAUPhysicalControlBarsLayout.seat_front.getter()
{
  return swift_bridgeObjectRetain();
}

unint64_t sub_23780D094(char a1)
{
  if (!a1)
    return 0x6F72665F74616573;
  if (a1 == 1)
    return 0xD000000000000010;
  return 0x6F72665F74616573;
}

BOOL sub_23780D100(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t _s13CarAssetUtils19CAUVehicleLayoutKeyO4SideO9hashValueSivg_0()
{
  sub_237826234();
  sub_237826240();
  return sub_23782624C();
}

uint64_t sub_23780D158()
{
  return sub_237826240();
}

uint64_t sub_23780D180()
{
  sub_237826234();
  sub_237826240();
  return sub_23782624C();
}

unint64_t sub_23780D1C0()
{
  char *v0;

  return sub_23780D094(*v0);
}

uint64_t sub_23780D1C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23780EA5C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23780D1EC()
{
  return 0;
}

void sub_23780D1F8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23780D204()
{
  sub_23780D464();
  return sub_237826270();
}

uint64_t sub_23780D22C()
{
  sub_23780D464();
  return sub_23782627C();
}

uint64_t CAUPhysicalControlBarsLayout.encode(to:)(_QWORD *a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568112C8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v13 = v1[2];
  v14 = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23780D464();
  sub_237826264();
  v16 = v9;
  v15 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568112D8);
  sub_23780D80C(&qword_2568112E0, (uint64_t (*)(void))sub_23780D4EC, (uint64_t (*)(void))sub_23780D530, MEMORY[0x24BEE04C0]);
  sub_23782618C();
  if (!v2)
  {
    v10 = v13;
    v16 = v14;
    v15 = 1;
    sub_23782618C();
    v16 = v10;
    v15 = 2;
    sub_23782618C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B81C174]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

unint64_t sub_23780D464()
{
  unint64_t result;

  result = qword_2568112D0;
  if (!qword_2568112D0)
  {
    result = MEMORY[0x23B81C18C](&unk_237826AB8, &type metadata for CAUPhysicalControlBarsLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568112D0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B81C180](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23780D4EC()
{
  unint64_t result;

  result = qword_2568112E8;
  if (!qword_2568112E8)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUPhysicalControlBarsButton, &type metadata for CAUPhysicalControlBarsButton);
    atomic_store(result, (unint64_t *)&qword_2568112E8);
  }
  return result;
}

unint64_t sub_23780D530()
{
  unint64_t result;

  result = qword_2568112F0;
  if (!qword_2568112F0)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUPhysicalControlBarsButtonLayoutInfo, &type metadata for CAUPhysicalControlBarsButtonLayoutInfo);
    atomic_store(result, (unint64_t *)&qword_2568112F0);
  }
  return result;
}

uint64_t CAUPhysicalControlBarsLayout.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  uint64_t v18;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568112F8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23780D464();
  sub_237826258();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v16 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568112D8);
  v17 = 0;
  sub_23780D80C(&qword_256811300, (uint64_t (*)(void))sub_23780D888, (uint64_t (*)(void))sub_23780D8CC, MEMORY[0x24BEE04E0]);
  sub_237826144();
  v9 = v18;
  v17 = 1;
  swift_bridgeObjectRetain();
  sub_237826144();
  v17 = 2;
  v15 = v18;
  swift_bridgeObjectRetain();
  sub_237826144();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v10 = v18;
  swift_bridgeObjectRetain();
  v12 = v15;
  v11 = v16;
  *v16 = v9;
  v11[1] = v12;
  v11[2] = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
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

uint64_t sub_23780D80C(unint64_t *a1, uint64_t (*a2)(void), uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568112D8);
    v10[0] = a2();
    v10[1] = a3();
    result = MEMORY[0x23B81C18C](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23780D888()
{
  unint64_t result;

  result = qword_256811308;
  if (!qword_256811308)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUPhysicalControlBarsButton, &type metadata for CAUPhysicalControlBarsButton);
    atomic_store(result, (unint64_t *)&qword_256811308);
  }
  return result;
}

unint64_t sub_23780D8CC()
{
  unint64_t result;

  result = qword_256811310;
  if (!qword_256811310)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUPhysicalControlBarsButtonLayoutInfo, &type metadata for CAUPhysicalControlBarsButtonLayoutInfo);
    atomic_store(result, (unint64_t *)&qword_256811310);
  }
  return result;
}

uint64_t sub_23780D910@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return CAUPhysicalControlBarsLayout.init(from:)(a1, a2);
}

uint64_t sub_23780D924(_QWORD *a1)
{
  return CAUPhysicalControlBarsLayout.encode(to:)(a1);
}

unint64_t CAUPhysicalControlBarsLayout.allLayouts.getter()
{
  return sub_23780DACC((uint64_t)&unk_25095D0C0);
}

void *static CAUPhysicalControlBarsButton.allCases.getter()
{
  return &unk_25095D0E8;
}

unint64_t sub_23780D950(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v4 = *v1;
  v3 = v1[1];
  v5 = v1[2];
  v6 = sub_23780DB04(MEMORY[0x24BEE4AF8]);
  if (v4)
  {
    swift_bridgeObjectRetain();
    v7 = swift_bridgeObjectRetain();
    v8 = sub_23780EBFC(v7, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2378125C4(v8, 23, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  if (v3)
  {
    swift_bridgeObjectRetain();
    v10 = swift_bridgeObjectRetain();
    v11 = sub_23780EBFC(v10, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v12 = swift_isUniquelyReferenced_nonNull_native();
    sub_2378125C4(v11, 25, v12);
    swift_bridgeObjectRelease();
  }
  if (v5)
  {
    swift_bridgeObjectRetain();
    v13 = swift_bridgeObjectRetain();
    v14 = sub_23780EBFC(v13, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v15 = swift_isUniquelyReferenced_nonNull_native();
    sub_2378125C4(v14, 22, v15);
    swift_bridgeObjectRelease();
  }
  return v6;
}

unint64_t CAUPhysicalControlBarsLayout.climateLayouts.getter()
{
  return sub_23780DACC((uint64_t)&unk_25095D110);
}

unint64_t sub_23780DACC(uint64_t a1)
{
  return sub_23780D950(a1);
}

unint64_t sub_23780DB04(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811358);
  v2 = (_QWORD *)sub_237826120();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *((unsigned __int8 *)v4 - 8);
    v6 = *v4;
    swift_bridgeObjectRetain();
    result = sub_237811A1C(v5);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_BYTE *)(v2[6] + result) = v5;
    *(_QWORD *)(v2[7] + 8 * result) = v6;
    v9 = v2[2];
    v10 = __OFADD__(v9, 1);
    v11 = v9 + 1;
    if (v10)
      goto LABEL_11;
    v2[2] = v11;
    v4 += 2;
    if (!--v3)
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

uint64_t sub_23780DC04(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 16))
  {
    swift_bridgeObjectRetain();
    __asm { BR              X9 }
  }
  return 0;
}

CarAssetUtils::CAUPhysicalControlBarsButton_optional __swiftcall CAUPhysicalControlBarsButton.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  CarAssetUtils::CAUPhysicalControlBarsButton_optional result;
  char v5;

  v2 = v1;
  v3 = sub_237826138();
  result.value = swift_bridgeObjectRelease();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t CAUPhysicalControlBarsButton.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23780DE90 + 4 * byte_2378267BA[*v0]))(0xD000000000000012, 0x8000000237829730);
}

uint64_t sub_23780DE90()
{
  return 0x74617265706D6574;
}

uint64_t sub_23780DEB0()
{
  return 7233894;
}

uint64_t sub_23780DEC0()
{
  return 0x6E614674616573;
}

uint64_t sub_23780DED8()
{
  return 0x6B6E694C70656564;
}

void sub_23780DEF0(char *a1)
{
  sub_23781F368(*a1);
}

unint64_t sub_23780DF00()
{
  unint64_t result;

  result = qword_256811318;
  if (!qword_256811318)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUPhysicalControlBarsButton, &type metadata for CAUPhysicalControlBarsButton);
    atomic_store(result, (unint64_t *)&qword_256811318);
  }
  return result;
}

void sub_23780DF44()
{
  char *v0;

  sub_23781D2DC(*v0);
}

void sub_23780DF4C(uint64_t a1)
{
  char *v1;

  sub_23781E4B4(a1, *v1);
}

void sub_23780DF54(uint64_t a1)
{
  char *v1;

  sub_23781D4FC(a1, *v1);
}

CarAssetUtils::CAUPhysicalControlBarsButton_optional sub_23780DF5C(Swift::String *a1)
{
  return CAUPhysicalControlBarsButton.init(rawValue:)(*a1);
}

uint64_t sub_23780DF68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CAUPhysicalControlBarsButton.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23780DF8C()
{
  sub_23780EBB8();
  return sub_237826018();
}

uint64_t sub_23780DFE8()
{
  sub_23780EBB8();
  return sub_23782600C();
}

uint64_t sub_23780E034()
{
  sub_23780EBB8();
  return sub_237826024();
}

uint64_t sub_23780E074()
{
  sub_23780EBB8();
  return sub_237826030();
}

unint64_t sub_23780E0E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256811320;
  if (!qword_256811320)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811328);
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_256811320);
  }
  return result;
}

void sub_23780E12C(_QWORD *a1@<X8>)
{
  *a1 = &unk_25095D1D0;
}

uint64_t destroy for CAUPhysicalControlBarsLayout()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s13CarAssetUtils28CAUPhysicalControlBarsLayoutVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for CAUPhysicalControlBarsLayout(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
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

uint64_t assignWithTake for CAUPhysicalControlBarsLayout(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CAUPhysicalControlBarsLayout(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CAUPhysicalControlBarsLayout(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUPhysicalControlBarsLayout()
{
  return &type metadata for CAUPhysicalControlBarsLayout;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CAUPhysicalControlBarsButton(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CAUPhysicalControlBarsButton(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23780E43C + 4 * byte_2378267C4[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23780E470 + 4 * byte_2378267BF[v4]))();
}

uint64_t sub_23780E470(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23780E478(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23780E480);
  return result;
}

uint64_t sub_23780E48C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23780E494);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23780E498(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23780E4A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23780E4AC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23780E4B8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CAUPhysicalControlBarsButton()
{
  return &type metadata for CAUPhysicalControlBarsButton;
}

uint64_t getEnumTagSinglePayload for CAUPhysicalControlBarsLayout.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CAUPhysicalControlBarsLayout.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23780E5AC + 4 * byte_2378267CE[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23780E5E0 + 4 * byte_2378267C9[v4]))();
}

uint64_t sub_23780E5E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23780E5E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23780E5F0);
  return result;
}

uint64_t sub_23780E5FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23780E604);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23780E608(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23780E610(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CAUPhysicalControlBarsLayout.CodingKeys()
{
  return &type metadata for CAUPhysicalControlBarsLayout.CodingKeys;
}

unint64_t sub_23780E630()
{
  unint64_t result;

  result = qword_256811330;
  if (!qword_256811330)
  {
    result = MEMORY[0x23B81C18C](&unk_237826A90, &type metadata for CAUPhysicalControlBarsLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811330);
  }
  return result;
}

unint64_t sub_23780E678()
{
  unint64_t result;

  result = qword_256811338;
  if (!qword_256811338)
  {
    result = MEMORY[0x23B81C18C](&unk_237826A00, &type metadata for CAUPhysicalControlBarsLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811338);
  }
  return result;
}

unint64_t sub_23780E6C0()
{
  unint64_t result;

  result = qword_256811340;
  if (!qword_256811340)
  {
    result = MEMORY[0x23B81C18C](&unk_237826A28, &type metadata for CAUPhysicalControlBarsLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811340);
  }
  return result;
}

uint64_t sub_23780E704(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v4 = a4;
  if (*(_QWORD *)(a4 + 16) != a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256811350);
    v6 = sub_237826120();
    v14 = a2;
    if (a2 < 1)
      v7 = 0;
    else
      v7 = *a1;
    if (v7)
    {
      v8 = __clz(__rbit64(v7));
      goto LABEL_23;
    }
    if (v14 > 1)
    {
      v9 = a1[1];
      v10 = 1;
      if (v9)
        goto LABEL_22;
      v10 = 2;
      if (v14 <= 2)
        return v6;
      v9 = a1[2];
      if (v9)
        goto LABEL_22;
      v10 = 3;
      if (v14 <= 3)
        return v6;
      v9 = a1[3];
      if (v9)
      {
LABEL_22:
        v8 = __clz(__rbit64(v9)) + (v10 << 6);
LABEL_23:
        v12 = *(unsigned __int8 *)(*(_QWORD *)(v4 + 48) + v8);
        sub_237826234();
        __asm { BR              X8 }
      }
      v11 = 4;
      if (v14 > 4)
      {
        v9 = a1[4];
        if (v9)
        {
          v10 = 4;
          goto LABEL_22;
        }
        while (1)
        {
          v10 = v11 + 1;
          if (__OFADD__(v11, 1))
          {
            __break(1u);
            JUMPOUT(0x23780EA48);
          }
          if (v10 >= v14)
            break;
          v9 = a1[v10];
          ++v11;
          if (v9)
            goto LABEL_22;
        }
      }
    }
    return v6;
  }
  swift_retain();
  return v4;
}

uint64_t sub_23780EA5C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6F72665F74616573 && a2 == 0xEF7466656C5F746ELL;
  if (v3 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000237829A00 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F72665F74616573 && a2 == 0xEA0000000000746ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_2378261E0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

unint64_t sub_23780EBB8()
{
  unint64_t result;

  result = qword_256811348;
  if (!qword_256811348)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUPhysicalControlBarsButton, &type metadata for CAUPhysicalControlBarsButton);
    atomic_store(result, (unint64_t *)&qword_256811348);
  }
  return result;
}

uint64_t sub_23780EBFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v5;
  unsigned int v6;
  unint64_t v7;
  size_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v7 = (unint64_t)((1 << v5) + 63) >> 6;
  v8 = 8 * v7;
  swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (swift_stdlib_isStackAllocationSafe() & 1) != 0)
  {
    MEMORY[0x24BDAC7A8]();
    bzero((char *)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    v9 = sub_23780EDB0((uint64_t)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a1, a2);
    swift_bridgeObjectRelease();
    if (v2)
      swift_willThrow();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v10 = (void *)swift_slowAlloc();
    bzero(v10, v8);
    swift_bridgeObjectRetain();
    v9 = sub_23780EDB0((uint64_t)v10, v7, a1, a2);
    swift_bridgeObjectRelease();
    MEMORY[0x23B81C1EC](v10, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v9;
}

uint64_t sub_23780EDB0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v6 = (unint64_t *)result;
  v7 = 0;
  v8 = 0;
  v9 = a3 + 64;
  v10 = 1 << *(_BYTE *)(a3 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(a3 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v8 << 6);
      goto LABEL_5;
    }
    v16 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v16 >= v13)
      return sub_23780E704(v6, a2, v7, a3);
    v17 = *(_QWORD *)(v9 + 8 * v16);
    ++v8;
    if (!v17)
    {
      v8 = v16 + 1;
      if (v16 + 1 >= v13)
        return sub_23780E704(v6, a2, v7, a3);
      v17 = *(_QWORD *)(v9 + 8 * v8);
      if (!v17)
      {
        v8 = v16 + 2;
        if (v16 + 2 >= v13)
          return sub_23780E704(v6, a2, v7, a3);
        v17 = *(_QWORD *)(v9 + 8 * v8);
        if (!v17)
          break;
      }
    }
LABEL_20:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v8 << 6);
LABEL_5:
    result = sub_23780DC04(*(unsigned __int8 *)(*(_QWORD *)(a3 + 48) + v15), a4);
    if ((result & 1) != 0)
    {
      *(unint64_t *)((char *)v6 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      if (__OFADD__(v7++, 1))
      {
        __break(1u);
        return sub_23780E704(v6, a2, v7, a3);
      }
    }
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    return sub_23780E704(v6, a2, v7, a3);
  v17 = *(_QWORD *)(v9 + 8 * v18);
  if (v17)
  {
    v8 = v18;
    goto LABEL_20;
  }
  while (1)
  {
    v8 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v8 >= v13)
      return sub_23780E704(v6, a2, v7, a3);
    v17 = *(_QWORD *)(v9 + 8 * v8);
    ++v18;
    if (v17)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

id sub_23780EF84()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAUServices();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CAUServices()
{
  return objc_opt_self();
}

uint64_t CAUVehicleLayout.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

__n128 CAUVehicleLayout.widgetContentMargins.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  __n128 result;

  result = v1[1];
  *a1 = result;
  return result;
}

__n128 CAUVehicleLayout.topDownExteriorImage.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  unint64_t v2;
  unsigned __int8 v3;
  __n128 result;

  v2 = v1[3].n128_u64[0];
  v3 = v1[3].n128_u8[8];
  result = v1[2];
  *a1 = result;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

__n128 CAUVehicleLayout.body.getter@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v1;
  unint64_t v2;
  unsigned __int8 v3;
  __n128 result;

  v2 = *(_QWORD *)(v1 + 76);
  v3 = *(_BYTE *)(v1 + 84);
  result = *(__n128 *)(v1 + 60);
  *a1 = result;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

__n128 CAUVehicleLayout.cabinSeatsImage.getter@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v1;
  unint64_t v2;
  unsigned __int8 v3;
  __n128 result;

  v2 = *(_QWORD *)(v1 + 104);
  v3 = *(_BYTE *)(v1 + 112);
  result = *(__n128 *)(v1 + 88);
  *a1 = result;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

__n128 CAUVehicleLayout.topDownInteriorImage.getter@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v1;
  unint64_t v2;
  unsigned __int8 v3;
  __n128 result;

  v2 = *(_QWORD *)(v1 + 132);
  v3 = *(_BYTE *)(v1 + 140);
  result = *(__n128 *)(v1 + 116);
  *a1 = result;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

__n128 CAUVehicleLayout.cabin.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  unint64_t v2;
  unsigned __int8 v3;
  __n128 result;

  v2 = v1[10].n128_u64[0];
  v3 = v1[10].n128_u8[8];
  result = v1[9];
  *a1 = result;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

uint64_t CAUVehicleLayout.infos.getter()
{
  return swift_bridgeObjectRetain();
}

__n128 CAUVehicleLayout.init(identifier:widgetContentMargins:topDownExteriorImage:cabinSeatsImage:topDownInteriorImage:body:cabin:infos:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X2>, __int128 *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, __n128 *a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  __int128 v16;
  __n128 result;
  unsigned __int8 v18;
  char v19;
  char v20;
  char v21;

  v10 = *((_QWORD *)a4 + 2);
  v12 = *(_QWORD *)(a5 + 16);
  v13 = *(_QWORD *)(a6 + 16);
  v14 = *(_QWORD *)(a7 + 16);
  v15 = a8[1].n128_u64[0];
  v11 = *((_BYTE *)a4 + 24);
  v21 = *(_BYTE *)(a7 + 24);
  v20 = *(_BYTE *)(a5 + 24);
  v19 = *(_BYTE *)(a6 + 24);
  v18 = a8[1].n128_u8[8];
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  v16 = *a4;
  *(_OWORD *)(a9 + 16) = *a3;
  *(_OWORD *)(a9 + 32) = v16;
  *(_QWORD *)(a9 + 48) = v10;
  *(_BYTE *)(a9 + 56) = v11;
  *(_OWORD *)(a9 + 60) = *(_OWORD *)a7;
  *(_QWORD *)(a9 + 76) = v14;
  *(_BYTE *)(a9 + 84) = v21;
  *(_OWORD *)(a9 + 88) = *(_OWORD *)a5;
  *(_QWORD *)(a9 + 104) = v12;
  *(_BYTE *)(a9 + 112) = v20;
  *(_OWORD *)(a9 + 116) = *(_OWORD *)a6;
  *(_QWORD *)(a9 + 132) = v13;
  *(_BYTE *)(a9 + 140) = v19;
  result = *a8;
  *(__n128 *)(a9 + 144) = *a8;
  *(_QWORD *)(a9 + 160) = v15;
  *(_BYTE *)(a9 + 168) = v18;
  *(_QWORD *)(a9 + 176) = a10;
  return result;
}

uint64_t sub_23780F160(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23780F198 + 4 * byte_237826B20[a1]))(0xD000000000000014, 0x8000000237829BC0);
}

uint64_t sub_23780F198()
{
  return 0x696669746E656469;
}

uint64_t sub_23780F208()
{
  return 0x6E69626163;
}

uint64_t sub_23780F21C()
{
  return 0x736F666E69;
}

uint64_t sub_23780F238()
{
  unsigned __int8 *v0;

  return sub_23780F160(*v0);
}

uint64_t sub_23780F240@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237810E60(a1, a2);
  *a3 = result;
  return result;
}

void sub_23780F264(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_23780F270()
{
  sub_23780F70C();
  return sub_237826270();
}

uint64_t sub_23780F298()
{
  sub_23780F70C();
  return sub_23782627C();
}

uint64_t CAUVehicleLayout.encode(to:)(_QWORD *a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  int v51;
  char v52;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256811388);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v44 = *(_QWORD *)(v1 + 24);
  v45 = v7;
  v8 = *(_QWORD *)(v1 + 32);
  v38 = *(_QWORD *)(v1 + 40);
  v39 = v8;
  v9 = *(_QWORD *)(v1 + 48);
  v51 = *(unsigned __int8 *)(v1 + 56);
  v10 = *(_QWORD *)(v1 + 60);
  v11 = *(_QWORD *)(v1 + 68);
  v42 = *(_QWORD *)(v1 + 76);
  v43 = v9;
  v41 = *(unsigned __int8 *)(v1 + 84);
  v12 = *(_QWORD *)(v1 + 88);
  v13 = *(_QWORD *)(v1 + 96);
  v40 = *(_QWORD *)(v1 + 104);
  v37 = *(unsigned __int8 *)(v1 + 112);
  v14 = *(_QWORD *)(v1 + 116);
  v15 = *(_QWORD *)(v1 + 124);
  v35 = *(_QWORD *)(v1 + 132);
  v36 = *(unsigned __int8 *)(v1 + 140);
  v16 = *(_QWORD *)(v1 + 144);
  v17 = *(_QWORD *)(v1 + 152);
  v33 = *(_QWORD *)(v1 + 160);
  v34 = *(unsigned __int8 *)(v1 + 168);
  v32 = *(_QWORD *)(v1 + 176);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23780F70C();
  sub_237826264();
  LOBYTE(v47) = 0;
  v18 = v46;
  sub_237826198();
  if (!v18)
  {
    v19 = v51;
    v20 = v42;
    v21 = v43;
    v22 = v41;
    v31 = v11;
    v46 = v10;
    v23 = v40;
    v29 = v13;
    v30 = v12;
    v27 = v15;
    v28 = v14;
    v25 = v17;
    v26 = v16;
    v47 = v45;
    v48 = v44;
    v52 = 1;
    sub_23780F750();
    sub_2378261BC();
    v47 = v39;
    v48 = v38;
    v49 = v21;
    v50 = v19;
    v52 = 2;
    sub_23780F794();
    sub_2378261BC();
    v47 = v46;
    v48 = v31;
    v49 = v20;
    v50 = v22;
    v52 = 3;
    sub_2378261BC();
    v47 = v30;
    v48 = v29;
    v49 = v23;
    v50 = v37;
    v52 = 4;
    sub_2378261BC();
    v47 = v28;
    v48 = v27;
    v49 = v35;
    v50 = v36;
    v52 = 5;
    sub_2378261BC();
    v47 = v26;
    v48 = v25;
    v49 = v33;
    v50 = v34;
    v52 = 6;
    sub_2378261BC();
    v47 = v32;
    v52 = 7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568113A8);
    sub_23780FFCC(&qword_2568113B0, (uint64_t (*)(void))sub_23780F7D8, (uint64_t (*)(void))sub_23780F794, MEMORY[0x24BEE04C0]);
    sub_2378261BC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23780F70C()
{
  unint64_t result;

  result = qword_256811390;
  if (!qword_256811390)
  {
    result = MEMORY[0x23B81C18C](&unk_237826E14, &type metadata for CAUVehicleLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811390);
  }
  return result;
}

unint64_t sub_23780F750()
{
  unint64_t result;

  result = qword_256811398;
  if (!qword_256811398)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUWidgetContentMargins, &type metadata for CAUWidgetContentMargins);
    atomic_store(result, (unint64_t *)&qword_256811398);
  }
  return result;
}

unint64_t sub_23780F794()
{
  unint64_t result;

  result = qword_2568113A0;
  if (!qword_2568113A0)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUVehicleLayoutInfo, &type metadata for CAUVehicleLayoutInfo);
    atomic_store(result, (unint64_t *)&qword_2568113A0);
  }
  return result;
}

unint64_t sub_23780F7D8()
{
  unint64_t result;

  result = qword_2568113B8;
  if (!qword_2568113B8)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUVehicleLayoutKey, &type metadata for CAUVehicleLayoutKey);
    atomic_store(result, (unint64_t *)&qword_2568113B8);
  }
  return result;
}

uint64_t CAUVehicleLayout.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  unsigned int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  int v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[48];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  char *v65;
  __int128 v66;
  __int128 v67;
  unsigned int v68;
  int v69;
  unsigned int v70;
  int v71;
  uint64_t v72;
  char v73;
  __int16 v74;
  char v75;
  uint64_t v76;
  unsigned int v77;
  unsigned int v78;
  uint64_t v79;
  char v80;
  __int16 v81;
  char v82;
  uint64_t v83;
  unsigned int v84;
  unsigned int v85;
  uint64_t v86;
  char v87;
  __int16 v88;
  char v89;
  uint64_t v90;
  int v91;
  int v92;
  uint64_t v93;
  char v94;
  __int16 v95;
  char v96;
  unsigned int v97;
  int v98;
  unsigned int v99;
  unsigned int v100;
  uint64_t v101;
  char v102;
  _BYTE v103[7];
  char *v104;
  char v105;
  char *v106;
  _BYTE v107[7];
  char v108;
  __int16 v109;
  char v110;
  char v111;
  __int16 v112;
  char v113;
  char v114;
  __int16 v115;
  char v116;
  char v117;
  __int16 v118;
  char v119;
  char v120;
  char *v121;

  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568113C0);
  v5 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23780F70C();
  v121 = v7;
  sub_237826258();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v8 = v5;
  LOBYTE(v66) = 0;
  v9 = v55;
  v10 = sub_237826150();
  v12 = v11;
  LOBYTE(v56) = 1;
  sub_23780FF44();
  swift_bridgeObjectRetain();
  sub_237826174();
  v53 = v10;
  v13 = v66;
  LOBYTE(v56) = 2;
  v54 = sub_23780FF88();
  sub_237826174();
  v14 = (uint64_t)a1;
  v52 = v66;
  v49 = DWORD2(v66);
  v50 = DWORD1(v66);
  v48 = HIDWORD(v66);
  v51 = v67;
  v15 = BYTE8(v67);
  v120 = BYTE8(v67);
  LOBYTE(v56) = 3;
  sub_237826174();
  v43 = v15;
  v47 = v66;
  v45 = HIDWORD(v66);
  v46 = DWORD2(v66);
  v44 = v67;
  v16 = BYTE8(v67);
  v117 = BYTE8(v67);
  LOBYTE(v56) = 4;
  sub_237826174();
  v38 = v16;
  v42 = v66;
  v40 = HIDWORD(v66);
  v41 = DWORD2(v66);
  v39 = v67;
  v17 = BYTE8(v67);
  v114 = BYTE8(v67);
  LOBYTE(v56) = 5;
  sub_237826174();
  v33 = v17;
  v37 = v66;
  v35 = HIDWORD(v66);
  v36 = DWORD2(v66);
  v34 = v67;
  v18 = BYTE8(v67);
  v111 = BYTE8(v67);
  LOBYTE(v56) = 6;
  sub_237826174();
  v28 = v18;
  LODWORD(v54) = DWORD1(v66);
  v29 = v66;
  v31 = HIDWORD(v66);
  v32 = DWORD2(v66);
  v30 = v67;
  LOBYTE(v18) = BYTE8(v67);
  v108 = BYTE8(v67);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568113A8);
  v105 = 7;
  sub_23780FFCC(&qword_2568113D8, (uint64_t (*)(void))sub_237810048, (uint64_t (*)(void))sub_23780FF88, MEMORY[0x24BEE04E0]);
  sub_237826174();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v121, v9);
  v59[8] = v43;
  v59[36] = v38;
  LOBYTE(v61) = v33;
  BYTE12(v62) = v28;
  BYTE8(v64) = v18;
  v121 = v106;
  v19 = v53;
  *(_QWORD *)&v56 = v53;
  *((_QWORD *)&v56 + 1) = v12;
  v57 = v13;
  v20 = v49;
  LODWORD(v9) = v50;
  *(_QWORD *)&v58 = __PAIR64__(v50, v52);
  LODWORD(v8) = v48;
  *((_QWORD *)&v58 + 1) = __PAIR64__(v48, v49);
  *(_QWORD *)v59 = v51;
  *(_QWORD *)&v59[12] = v47;
  *(_QWORD *)&v59[20] = __PAIR64__(v45, v46);
  *(_QWORD *)&v59[28] = v44;
  *(_QWORD *)&v59[40] = v42;
  *(_QWORD *)&v60 = __PAIR64__(v40, v41);
  *((_QWORD *)&v60 + 1) = v39;
  *(_QWORD *)((char *)&v61 + 4) = v37;
  HIDWORD(v61) = v36;
  LODWORD(v62) = v35;
  *(_QWORD *)((char *)&v62 + 4) = v34;
  *(_QWORD *)&v63 = __PAIR64__(v54, v29);
  *((_QWORD *)&v63 + 1) = __PAIR64__(v31, v32);
  *(_QWORD *)&v64 = v30;
  v65 = v106;
  sub_23781008C((uint64_t)&v56);
  swift_bridgeObjectRelease();
  v21 = v63;
  *(_OWORD *)(a2 + 128) = v62;
  *(_OWORD *)(a2 + 144) = v21;
  *(_OWORD *)(a2 + 160) = v64;
  *(_QWORD *)(a2 + 176) = v65;
  v22 = *(_OWORD *)&v59[32];
  *(_OWORD *)(a2 + 64) = *(_OWORD *)&v59[16];
  *(_OWORD *)(a2 + 80) = v22;
  v23 = v61;
  *(_OWORD *)(a2 + 96) = v60;
  *(_OWORD *)(a2 + 112) = v23;
  v24 = v57;
  *(_OWORD *)a2 = v56;
  *(_OWORD *)(a2 + 16) = v24;
  v25 = *(_OWORD *)v59;
  *(_OWORD *)(a2 + 32) = v58;
  *(_OWORD *)(a2 + 48) = v25;
  __swift_destroy_boxed_opaque_existential_1(v14);
  *(_QWORD *)&v66 = v19;
  *((_QWORD *)&v66 + 1) = v12;
  v67 = v13;
  v68 = v52;
  v69 = v9;
  v70 = v20;
  v71 = v8;
  v72 = v51;
  v73 = v120;
  v74 = v118;
  v75 = v119;
  v76 = v47;
  v77 = v46;
  v78 = v45;
  v79 = v44;
  v80 = v117;
  v81 = v115;
  v82 = v116;
  v83 = v42;
  v84 = v41;
  v85 = v40;
  v86 = v39;
  v87 = v114;
  v88 = v112;
  v89 = v113;
  v90 = v37;
  v91 = v36;
  v92 = v35;
  v93 = v34;
  v94 = v111;
  v96 = v110;
  v95 = v109;
  v97 = v29;
  v98 = v54;
  v99 = v32;
  v100 = v31;
  v101 = v30;
  v102 = v108;
  *(_DWORD *)&v103[3] = *(_DWORD *)&v107[3];
  *(_DWORD *)v103 = *(_DWORD *)v107;
  v104 = v121;
  return sub_2378100C0((uint64_t)&v66);
}

unint64_t sub_23780FF44()
{
  unint64_t result;

  result = qword_2568113C8;
  if (!qword_2568113C8)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUWidgetContentMargins, &type metadata for CAUWidgetContentMargins);
    atomic_store(result, (unint64_t *)&qword_2568113C8);
  }
  return result;
}

unint64_t sub_23780FF88()
{
  unint64_t result;

  result = qword_2568113D0;
  if (!qword_2568113D0)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUVehicleLayoutInfo, &type metadata for CAUVehicleLayoutInfo);
    atomic_store(result, (unint64_t *)&qword_2568113D0);
  }
  return result;
}

uint64_t sub_23780FFCC(unint64_t *a1, uint64_t (*a2)(void), uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568113A8);
    v10[0] = a2();
    v10[1] = a3();
    result = MEMORY[0x23B81C18C](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_237810048()
{
  unint64_t result;

  result = qword_2568113E0;
  if (!qword_2568113E0)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUVehicleLayoutKey, &type metadata for CAUVehicleLayoutKey);
    atomic_store(result, (unint64_t *)&qword_2568113E0);
  }
  return result;
}

uint64_t sub_23781008C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2378100C0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2378100F4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CAUVehicleLayout.init(from:)(a1, a2);
}

uint64_t sub_237810108(_QWORD *a1)
{
  return CAUVehicleLayout.encode(to:)(a1);
}

CarAssetUtils::CAUWidgetContentMargins __swiftcall CAUWidgetContentMargins.init(top:leading:bottom:trailing:)(Swift::Float top, Swift::Float leading, Swift::Float bottom, Swift::Float trailing)
{
  Swift::Float *v4;
  CarAssetUtils::CAUWidgetContentMargins result;

  *v4 = top;
  v4[1] = leading;
  v4[2] = bottom;
  v4[3] = trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

float CAUWidgetContentMargins.top.getter()
{
  uint64_t v0;

  return *(float *)v0;
}

float CAUWidgetContentMargins.leading.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 4);
}

float CAUWidgetContentMargins.bottom.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 8);
}

float CAUWidgetContentMargins.trailing.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 12);
}

uint64_t sub_237810148(char a1)
{
  return qword_237826E68[a1];
}

uint64_t sub_237810168()
{
  char *v0;

  return sub_237810148(*v0);
}

uint64_t sub_237810170@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237811168(a1, a2);
  *a3 = result;
  return result;
}

void sub_237810194(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_2378101A0()
{
  sub_237810368();
  return sub_237826270();
}

uint64_t sub_2378101C8()
{
  sub_237810368();
  return sub_23782627C();
}

uint64_t CAUWidgetContentMargins.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568113E8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237810368();
  sub_237826264();
  v8[15] = 0;
  sub_2378261B0();
  if (!v1)
  {
    v8[14] = 1;
    sub_2378261B0();
    v8[13] = 2;
    sub_2378261B0();
    v8[12] = 3;
    sub_2378261B0();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_237810368()
{
  unint64_t result;

  result = qword_2568113F0;
  if (!qword_2568113F0)
  {
    result = MEMORY[0x23B81C18C](&unk_237826DC4, &type metadata for CAUWidgetContentMargins.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568113F0);
  }
  return result;
}

uint64_t CAUWidgetContentMargins.init(from:)@<X0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  char v22;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568113F8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237810368();
  sub_237826258();
  if (!v2)
  {
    v22 = 0;
    sub_237826168();
    v10 = v9;
    v21 = 1;
    sub_237826168();
    v12 = v11;
    v20 = 2;
    sub_237826168();
    v15 = v14;
    v19 = 3;
    sub_237826168();
    v17 = v16;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
    a2[1] = v12;
    a2[2] = v15;
    a2[3] = v17;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_237810558@<X0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return CAUWidgetContentMargins.init(from:)(a1, a2);
}

uint64_t sub_23781056C(_QWORD *a1)
{
  return CAUWidgetContentMargins.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for CAUVehicleLayoutInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CAUVehicleLayout()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CAUVehicleLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 60) = *(_OWORD *)(a2 + 60);
  *(_OWORD *)(a1 + 69) = *(_OWORD *)(a2 + 69);
  *(_OWORD *)(a1 + 97) = *(_OWORD *)(a2 + 97);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 125) = *(_OWORD *)(a2 + 125);
  *(_OWORD *)(a1 + 116) = *(_OWORD *)(a2 + 116);
  *(_OWORD *)(a1 + 153) = *(_OWORD *)(a2 + 153);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CAUVehicleLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  v4 = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v4;
  *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 60);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a2 + 68);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  v5 = *(_QWORD *)(a2 + 76);
  *(_BYTE *)(a1 + 84) = *(_BYTE *)(a2 + 84);
  *(_QWORD *)(a1 + 76) = v5;
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  *(_DWORD *)(a1 + 100) = *(_DWORD *)(a2 + 100);
  v6 = *(_QWORD *)(a2 + 104);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = v6;
  *(_DWORD *)(a1 + 116) = *(_DWORD *)(a2 + 116);
  *(_DWORD *)(a1 + 120) = *(_DWORD *)(a2 + 120);
  *(_DWORD *)(a1 + 124) = *(_DWORD *)(a2 + 124);
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(a2 + 128);
  v7 = *(_QWORD *)(a2 + 132);
  *(_BYTE *)(a1 + 140) = *(_BYTE *)(a2 + 140);
  *(_QWORD *)(a1 + 132) = v7;
  *(_DWORD *)(a1 + 144) = *(_DWORD *)(a2 + 144);
  *(_DWORD *)(a1 + 148) = *(_DWORD *)(a2 + 148);
  *(_DWORD *)(a1 + 152) = *(_DWORD *)(a2 + 152);
  *(_DWORD *)(a1 + 156) = *(_DWORD *)(a2 + 156);
  v8 = *(_QWORD *)(a2 + 160);
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = v8;
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy184_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;

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
  result = (__n128)a2[8];
  v9 = a2[9];
  v10 = a2[10];
  *(_QWORD *)(a1 + 176) = *((_QWORD *)a2 + 22);
  *(_OWORD *)(a1 + 144) = v9;
  *(_OWORD *)(a1 + 160) = v10;
  *(__n128 *)(a1 + 128) = result;
  return result;
}

uint64_t assignWithTake for CAUVehicleLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_OWORD *)(a1 + 60) = *(_OWORD *)(a2 + 60);
  *(_QWORD *)(a1 + 76) = *(_QWORD *)(a2 + 76);
  *(_BYTE *)(a1 + 84) = *(_BYTE *)(a2 + 84);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 116) = *(_OWORD *)(a2 + 116);
  *(_BYTE *)(a1 + 140) = *(_BYTE *)(a2 + 140);
  *(_QWORD *)(a1 + 132) = *(_QWORD *)(a2 + 132);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CAUVehicleLayout(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 184))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CAUVehicleLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
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
      *(_BYTE *)(result + 184) = 1;
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
    *(_BYTE *)(result + 184) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUVehicleLayout()
{
  return &type metadata for CAUVehicleLayout;
}

__n128 __swift_memcpy16_4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CAUWidgetContentMargins(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CAUWidgetContentMargins(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CAUWidgetContentMargins()
{
  return &type metadata for CAUWidgetContentMargins;
}

uint64_t getEnumTagSinglePayload for CAUEdge(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CAUWidgetContentMargins.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237810AD4 + 4 * byte_237826B2D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_237810B08 + 4 * byte_237826B28[v4]))();
}

uint64_t sub_237810B08(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237810B10(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237810B18);
  return result;
}

uint64_t sub_237810B24(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237810B2CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_237810B30(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237810B38(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CAUWidgetContentMargins.CodingKeys()
{
  return &type metadata for CAUWidgetContentMargins.CodingKeys;
}

uint64_t getEnumTagSinglePayload for CAUVehicleLayout.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CAUVehicleLayout.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237810C30 + 4 * byte_237826B37[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_237810C64 + 4 * byte_237826B32[v4]))();
}

uint64_t sub_237810C64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237810C6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237810C74);
  return result;
}

uint64_t sub_237810C80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237810C88);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_237810C8C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237810C94(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CAUVehicleLayout.CodingKeys()
{
  return &type metadata for CAUVehicleLayout.CodingKeys;
}

unint64_t sub_237810CB4()
{
  unint64_t result;

  result = qword_256811400;
  if (!qword_256811400)
  {
    result = MEMORY[0x23B81C18C](&unk_237826CE4, &type metadata for CAUVehicleLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811400);
  }
  return result;
}

unint64_t sub_237810CFC()
{
  unint64_t result;

  result = qword_256811408;
  if (!qword_256811408)
  {
    result = MEMORY[0x23B81C18C](&unk_237826D9C, &type metadata for CAUWidgetContentMargins.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811408);
  }
  return result;
}

unint64_t sub_237810D44()
{
  unint64_t result;

  result = qword_256811410;
  if (!qword_256811410)
  {
    result = MEMORY[0x23B81C18C](&unk_237826D0C, &type metadata for CAUWidgetContentMargins.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811410);
  }
  return result;
}

unint64_t sub_237810D8C()
{
  unint64_t result;

  result = qword_256811418;
  if (!qword_256811418)
  {
    result = MEMORY[0x23B81C18C](&unk_237826D34, &type metadata for CAUWidgetContentMargins.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811418);
  }
  return result;
}

unint64_t sub_237810DD4()
{
  unint64_t result;

  result = qword_256811420;
  if (!qword_256811420)
  {
    result = MEMORY[0x23B81C18C](&unk_237826C54, &type metadata for CAUVehicleLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811420);
  }
  return result;
}

unint64_t sub_237810E1C()
{
  unint64_t result;

  result = qword_256811428;
  if (!qword_256811428)
  {
    result = MEMORY[0x23B81C18C](&unk_237826C7C, &type metadata for CAUVehicleLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811428);
  }
  return result;
}

uint64_t sub_237810E60(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000237829BC0 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000237829BE0 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 2036625250 && a2 == 0xE400000000000000 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6165536E69626163 && a2 == 0xEF6567616D497374 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000237829C00 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6E69626163 && a2 == 0xE500000000000000 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x736F666E69 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    v6 = sub_2378261E0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 7;
    else
      return 8;
  }
}

uint64_t sub_237811168(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 7368564 && a2 == 0xE300000000000000;
  if (v3 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696461656CLL && a2 == 0xE700000000000000 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6D6F74746F62 && a2 == 0xE600000000000000 || (sub_2378261E0() & 1) != 0)
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
    v6 = sub_2378261E0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t Dictionary<>.init(_:)(uint64_t a1)
{
  uint64_t v1;

  v1 = sub_2378138B4(a1);
  swift_bridgeObjectRelease();
  return v1;
}

{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v10;
  int64_t v11;

  v10 = (_QWORD *)(a1 + 64);
  v1 = 1 << *(_BYTE *)(a1 + 32);
  v2 = -1;
  if (v1 < 64)
    v2 = ~(-1 << v1);
  v3 = v2 & *(_QWORD *)(a1 + 64);
  v11 = (unint64_t)(v1 + 63) >> 6;
  swift_bridgeObjectRetain();
  v4 = MEMORY[0x24BEE4B00];
  if (v3)
  {
    v5 = __clz(__rbit64(v3));
    goto LABEL_22;
  }
  if (v11 > 1)
  {
    v6 = v10[1];
    v7 = 1;
    if (v6)
      goto LABEL_21;
    v7 = 2;
    if (v11 <= 2)
      goto LABEL_23;
    v6 = v10[2];
    if (v6)
      goto LABEL_21;
    v7 = 3;
    if (v11 <= 3)
      goto LABEL_23;
    v6 = v10[3];
    if (v6)
      goto LABEL_21;
    v7 = 4;
    if (v11 <= 4)
      goto LABEL_23;
    v6 = v10[4];
    if (v6)
      goto LABEL_21;
    v7 = 5;
    if (v11 <= 5)
      goto LABEL_23;
    v6 = v10[5];
    if (v6)
    {
LABEL_21:
      v5 = __clz(__rbit64(v6)) + (v7 << 6);
LABEL_22:
      __asm { BR              X8 }
    }
    v8 = 6;
    if (v11 > 6)
    {
      v6 = v10[6];
      if (v6)
      {
        v7 = 6;
        goto LABEL_21;
      }
      while (1)
      {
        v7 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
          __break(1u);
          JUMPOUT(0x2378119E8);
        }
        if (v7 >= v11)
          break;
        v6 = v10[v7];
        ++v8;
        if (v6)
          goto LABEL_21;
      }
    }
  }
LABEL_23:
  swift_release();
  swift_bridgeObjectRelease();
  return v4;
}

void sub_237811328(uint64_t *a1, uint64_t *a2)
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  Swift::String v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;

  v4 = *a2;
  v3 = (void *)a2[1];
  v6 = a2[2];
  v5 = a2[3];
  swift_bridgeObjectRetain();
  v7._countAndFlagsBits = v4;
  v7._object = v3;
  CAUVehicleTrait.init(rawValue:)(v7);
  v8 = v15;
  if (v15 == 9)
  {
    if (qword_2568112A8 != -1)
      swift_once();
    v9 = sub_237825F10();
    __swift_project_value_buffer(v9, (uint64_t)qword_256811808);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v10 = sub_237825EF8();
    v11 = sub_237826054();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = swift_slowAlloc();
      v13 = swift_slowAlloc();
      v15 = v13;
      *(_DWORD *)v12 = 136315394;
      swift_bridgeObjectRetain();
      sub_237816E0C(v4, (unint64_t)v3, &v15);
      sub_237826090();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v12 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_237816E0C(v6, v5, &v15);
      sub_237826090();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23780B000, v10, v11, "unexpected type %s or value %s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B81C1EC](v13, -1, -1);
      MEMORY[0x23B81C1EC](v12, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v15 = *a1;
    *a1 = 0x8000000000000000;
    sub_2378126F8(v6, v5, v8, isUniquelyReferenced_nonNull_native);
    *a1 = v15;
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_237811A1C(uint64_t a1)
{
  uint64_t v2;

  sub_237826234();
  CAUVehicleLayoutKey.rawValue.getter();
  sub_237825FC4();
  swift_bridgeObjectRelease();
  v2 = sub_23782624C();
  return sub_237812834(a1, v2);
}

uint64_t sub_237811A94(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[72];

  sub_237826234();
  sub_23781E56C((uint64_t)v4, a1);
  v2 = sub_23782624C();
  return sub_237812F7C(a1, v2);
}

unint64_t sub_237811AEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_237826234();
  sub_237825FC4();
  v4 = sub_23782624C();
  return sub_2378132D4(a1, a2, v4);
}

uint64_t sub_237811B50(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  int64_t v33;
  uint64_t v34;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811358);
  v6 = a2;
  v7 = sub_237826114();
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v34 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v32 = v2;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v19 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_31;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v33)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v34 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v33)
        goto LABEL_33;
      v23 = *(_QWORD *)(v34 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v33)
        {
LABEL_33:
          swift_release();
          v3 = v32;
          if ((v6 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v34 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v14 >= v33)
              goto LABEL_33;
            v23 = *(_QWORD *)(v34 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v14 = v24;
      }
    }
LABEL_30:
    v11 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_31:
    v29 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v20);
    v30 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v6 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_237826234();
    CAUVehicleLayoutKey.rawValue.getter();
    sub_237825FC4();
    swift_bridgeObjectRelease();
    result = sub_23782624C();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v17 == v26;
        if (v17 == v26)
          v17 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v28 == -1);
      v18 = __clz(__rbit64(~v28)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(_BYTE *)(*(_QWORD *)(v8 + 48) + v18) = v29;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v30;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v3 = v32;
  v22 = (_QWORD *)(v5 + 64);
  if ((v6 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v31 = 1 << *(_BYTE *)(v5 + 32);
  if (v31 >= 64)
    bzero(v22, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v31;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v8;
  return result;
}

uint64_t sub_237811E60(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  _QWORD *v18;
  char v19;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811438);
  v19 = a2;
  v6 = sub_237826114();
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_26;
  v7 = 1 << *(_BYTE *)(v5 + 32);
  v18 = (_QWORD *)(v5 + 64);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v5 + 64);
  v17 = (unint64_t)(v7 + 63) >> 6;
  swift_retain();
  if (v9)
  {
    v10 = __clz(__rbit64(v9));
    goto LABEL_18;
  }
  if (v17 > 1)
  {
    v11 = *(_QWORD *)(v5 + 72);
    v12 = 1;
    if (v11)
      goto LABEL_17;
    v12 = 2;
    if (v17 > 2)
    {
      v11 = *(_QWORD *)(v5 + 80);
      if (!v11)
      {
        v13 = 3;
        if (v17 > 3)
        {
          v11 = *(_QWORD *)(v5 + 88);
          if (v11)
          {
            v12 = 3;
            goto LABEL_17;
          }
          while (1)
          {
            v12 = v13 + 1;
            if (__OFADD__(v13, 1))
            {
              __break(1u);
              JUMPOUT(0x23781227CLL);
            }
            if (v12 >= v17)
              break;
            v11 = v18[v12];
            ++v13;
            if (v11)
              goto LABEL_17;
          }
        }
        goto LABEL_21;
      }
LABEL_17:
      v10 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_18:
      v14 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 48) + v10);
      if ((v19 & 1) == 0)
        swift_bridgeObjectRetain();
      sub_237826234();
      __asm { BR              X8 }
    }
  }
LABEL_21:
  swift_release();
  v3 = v2;
  if ((v19 & 1) != 0)
  {
    v15 = 1 << *(_BYTE *)(v5 + 32);
    if (v15 >= 64)
      bzero(v18, ((unint64_t)(v15 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    else
      *v18 = -1 << v15;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_26:
  result = swift_release();
  *v3 = v6;
  return result;
}

uint64_t sub_2378122A0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811430);
  v42 = a2;
  v6 = sub_237826114();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_237826234();
    sub_237825FC4();
    result = sub_23782624C();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2378125C4(uint64_t a1, uint64_t a2, char a3)
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
  uint64_t v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v4 = v3;
  v8 = *v3;
  v10 = sub_237811A1C(a2);
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
    result = (uint64_t)sub_2378133B4();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_BYTE *)(v16[6] + v10) = a2;
    *(_QWORD *)(v16[7] + 8 * v10) = a1;
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
  sub_237811B50(result, a3 & 1);
  result = sub_237811A1C(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_2378261F8();
  __break(1u);
  return result;
}

uint64_t sub_2378126F8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_237811A94(a3);
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
    result = (uint64_t)sub_237813554();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = (_QWORD *)(v18[7] + 16 * v12);
      result = swift_bridgeObjectRelease();
      *v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(_BYTE *)(v18[6] + v12) = a3;
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
  sub_237811E60(result, a4 & 1);
  result = sub_237811A94(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_2378261F8();
  __break(1u);
  return result;
}

uint64_t sub_237812834(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

uint64_t sub_237812F7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

unint64_t sub_2378132D4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2378261E0() & 1) == 0)
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
      while (!v14 && (sub_2378261E0() & 1) == 0);
    }
  }
  return v6;
}

void *sub_2378133B4()
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
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811358);
  v2 = *v0;
  v3 = sub_237826108();
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
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v15) = v16;
    result = (void *)swift_bridgeObjectRetain();
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_237813554()
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811438);
  v2 = *v0;
  v3 = sub_237826108();
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
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 56) + 16 * v15);
    v18 = *v16;
    v17 = v16[1];
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 56) + 16 * v15);
    *v19 = v18;
    v19[1] = v17;
    result = (void *)swift_bridgeObjectRetain();
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

void *sub_2378136FC()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811430);
  v2 = *v0;
  v3 = sub_237826108();
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
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_2378138B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t i;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21[4];
  uint64_t v22;

  v22 = MEMORY[0x24BEE4B00];
  v2 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v6 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain();
  v7 = 0;
  if (!v5)
    goto LABEL_5;
LABEL_4:
  v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  for (i = v8 | (v7 << 6); ; i = __clz(__rbit64(v11)) + (v7 << 6))
  {
    v13 = 16 * i;
    v14 = (uint64_t *)(*(_QWORD *)(a1 + 48) + v13);
    v15 = *v14;
    v16 = v14[1];
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 56) + v13);
    v18 = *v17;
    v19 = v17[1];
    v21[0] = v15;
    v21[1] = v16;
    v21[2] = v18;
    v21[3] = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_237811328(&v22, v21);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v5)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v7++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v7 >= v6)
      goto LABEL_26;
    v11 = *(_QWORD *)(v2 + 8 * v7);
    if (!v11)
      break;
LABEL_19:
    v5 = (v11 - 1) & v11;
  }
  v12 = v7 + 1;
  if (v7 + 1 >= v6)
    goto LABEL_26;
  v11 = *(_QWORD *)(v2 + 8 * v12);
  if (v11)
    goto LABEL_18;
  v12 = v7 + 2;
  if (v7 + 2 >= v6)
    goto LABEL_26;
  v11 = *(_QWORD *)(v2 + 8 * v12);
  if (v11)
    goto LABEL_18;
  v12 = v7 + 3;
  if (v7 + 3 >= v6)
    goto LABEL_26;
  v11 = *(_QWORD *)(v2 + 8 * v12);
  if (v11)
    goto LABEL_18;
  v12 = v7 + 4;
  if (v7 + 4 >= v6)
    goto LABEL_26;
  v11 = *(_QWORD *)(v2 + 8 * v12);
  if (v11)
    goto LABEL_18;
  v12 = v7 + 5;
  if (v7 + 5 >= v6)
  {
LABEL_26:
    swift_release();
    return v22;
  }
  v11 = *(_QWORD *)(v2 + 8 * v12);
  if (v11)
  {
LABEL_18:
    v7 = v12;
    goto LABEL_19;
  }
  while (1)
  {
    v7 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v7 >= v6)
      goto LABEL_26;
    v11 = *(_QWORD *)(v2 + 8 * v7);
    ++v12;
    if (v11)
      goto LABEL_19;
  }
LABEL_28:
  __break(1u);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t CAUBaselineAnchor.x.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t CAUBaselineAnchor.y.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 4);
}

uint64_t CAUBaselineAnchor.init(x:y:)@<X0>(uint64_t result@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t sub_237813ACC(char a1)
{
  if ((a1 & 1) != 0)
    return 121;
  else
    return 120;
}

BOOL sub_237813AE0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_237813AF8()
{
  char *v0;

  return sub_237813ACC(*v0);
}

uint64_t sub_237813B00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237814920(a1, a2);
  *a3 = result;
  return result;
}

void sub_237813B24(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_237813B30()
{
  sub_237813C9C();
  return sub_237826270();
}

uint64_t sub_237813B58()
{
  sub_237813C9C();
  return sub_23782627C();
}

uint64_t CAUBaselineAnchor.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;
  int v10;
  char v11;
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256811440);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_DWORD *)(v1 + 4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237813C9C();
  sub_237826264();
  v12 = 0;
  sub_2378261C8();
  if (!v2)
  {
    v11 = 1;
    sub_2378261C8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_237813C9C()
{
  unint64_t result;

  result = qword_256811448;
  if (!qword_256811448)
  {
    result = MEMORY[0x23B81C18C](&unk_2378271F0, &type metadata for CAUBaselineAnchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811448);
  }
  return result;
}

uint64_t CAUBaselineAnchor.init(from:)@<X0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  int v10;
  uint64_t v12;
  char v13;
  char v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256811450);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237813C9C();
  sub_237826258();
  if (!v2)
  {
    v14 = 0;
    v9 = sub_237826180();
    v13 = 1;
    v10 = sub_237826180();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_237813E28@<X0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return CAUBaselineAnchor.init(from:)(a1, a2);
}

uint64_t sub_237813E3C(_QWORD *a1)
{
  return CAUBaselineAnchor.encode(to:)(a1);
}

uint64_t CAUVehicleLayoutInfo.x.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t CAUVehicleLayoutInfo.y.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 4);
}

uint64_t CAUVehicleLayoutInfo.width.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 8);
}

uint64_t CAUVehicleLayoutInfo.height.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 12);
}

void CAUVehicleLayoutInfo.baselineAnchor.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 24);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 16);
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t CAUVehicleLayoutInfo.init(x:y:height:width:baselineAnchor:)@<X0>(uint64_t result@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, uint64_t *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  char v7;

  v6 = *a5;
  v7 = *((_BYTE *)a5 + 8);
  *(_DWORD *)a6 = result;
  *(_DWORD *)(a6 + 4) = a2;
  *(_DWORD *)(a6 + 8) = a4;
  *(_DWORD *)(a6 + 12) = a3;
  *(_QWORD *)(a6 + 16) = v6;
  *(_BYTE *)(a6 + 24) = v7;
  return result;
}

uint64_t sub_237813EA0(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_237813EC8 + 4 * byte_237826F10[a1]))(120, 0xE100000000000000);
}

uint64_t sub_237813EC8()
{
  return 121;
}

uint64_t sub_237813ED0()
{
  return 0x6874646977;
}

uint64_t sub_237813EE4()
{
  return 0x746867696568;
}

uint64_t sub_237813EF8()
{
  return 0x656E696C65736162;
}

uint64_t sub_237813F1C()
{
  unsigned __int8 *v0;

  return sub_237813EA0(*v0);
}

uint64_t sub_237813F24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2378149DC(a1, a2);
  *a3 = result;
  return result;
}

void sub_237813F48(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_237813F54()
{
  sub_23781417C();
  return sub_237826270();
}

uint64_t sub_237813F7C()
{
  sub_23781417C();
  return sub_23782627C();
}

uint64_t CAUVehicleLayoutInfo.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  char v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256811458);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_DWORD *)(v1 + 4);
  v15 = *(_DWORD *)(v1 + 8);
  v16 = v8;
  v14 = *(_DWORD *)(v1 + 12);
  v13 = *(_QWORD *)(v1 + 16);
  HIDWORD(v12) = *(unsigned __int8 *)(v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23781417C();
  sub_237826264();
  v23 = 0;
  sub_2378261C8();
  if (!v2)
  {
    v9 = BYTE4(v12);
    v10 = v13;
    v22 = 1;
    sub_2378261C8();
    v21 = 2;
    sub_2378261C8();
    v20 = 3;
    sub_2378261C8();
    v17 = v10;
    v18 = v9;
    v19 = 4;
    sub_2378141C0();
    sub_23782618C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23781417C()
{
  unint64_t result;

  result = qword_256811460;
  if (!qword_256811460)
  {
    result = MEMORY[0x23B81C18C](&unk_2378271A0, &type metadata for CAUVehicleLayoutInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811460);
  }
  return result;
}

unint64_t sub_2378141C0()
{
  unint64_t result;

  result = qword_256811468;
  if (!qword_256811468)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUBaselineAnchor, &type metadata for CAUBaselineAnchor);
    atomic_store(result, (unint64_t *)&qword_256811468);
  }
  return result;
}

uint64_t CAUVehicleLayoutInfo.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  int v10;
  uint64_t v12;
  char v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256811470);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23781417C();
  sub_237826258();
  if (!v2)
  {
    v24 = 0;
    v9 = sub_237826180();
    v23 = 1;
    v10 = sub_237826180();
    v22 = 2;
    v17 = sub_237826180();
    v21 = 3;
    v16 = sub_237826180();
    v20 = 4;
    sub_2378143F8();
    sub_237826144();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v12 = v18;
    v13 = v19;
    *(_DWORD *)a2 = v9;
    *(_DWORD *)(a2 + 4) = v10;
    v14 = v16;
    *(_DWORD *)(a2 + 8) = v17;
    *(_DWORD *)(a2 + 12) = v14;
    *(_QWORD *)(a2 + 16) = v12;
    *(_BYTE *)(a2 + 24) = v13;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_2378143F8()
{
  unint64_t result;

  result = qword_256811478;
  if (!qword_256811478)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUBaselineAnchor, &type metadata for CAUBaselineAnchor);
    atomic_store(result, (unint64_t *)&qword_256811478);
  }
  return result;
}

uint64_t sub_23781443C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CAUVehicleLayoutInfo.init(from:)(a1, a2);
}

uint64_t sub_237814450(_QWORD *a1)
{
  return CAUVehicleLayoutInfo.encode(to:)(a1);
}

_QWORD *__swift_memcpy8_4(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CAUBaselineAnchor(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CAUBaselineAnchor(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
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
  *(_BYTE *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CAUBaselineAnchor()
{
  return &type metadata for CAUBaselineAnchor;
}

__n128 __swift_memcpy25_4(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CAUVehicleLayoutInfo(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CAUVehicleLayoutInfo(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
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
  *(_BYTE *)(result + 25) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CAUVehicleLayoutInfo()
{
  return &type metadata for CAUVehicleLayoutInfo;
}

uint64_t storeEnumTagSinglePayload for CAUVehicleLayoutInfo.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237814588 + 4 * byte_237826F1A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2378145BC + 4 * byte_237826F15[v4]))();
}

uint64_t sub_2378145BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2378145C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2378145CCLL);
  return result;
}

uint64_t sub_2378145D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2378145E0);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2378145E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2378145EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CAUVehicleLayoutInfo.CodingKeys()
{
  return &type metadata for CAUVehicleLayoutInfo.CodingKeys;
}

uint64_t getEnumTagSinglePayload for CAUBaselineAnchor.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CAUBaselineAnchor.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2378146E4 + 4 * byte_237826F24[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_237814718 + 4 * byte_237826F1F[v4]))();
}

uint64_t sub_237814718(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237814720(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237814728);
  return result;
}

uint64_t sub_237814734(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23781473CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_237814740(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237814748(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_237814754(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CAUBaselineAnchor.CodingKeys()
{
  return &type metadata for CAUBaselineAnchor.CodingKeys;
}

unint64_t sub_237814774()
{
  unint64_t result;

  result = qword_256811480;
  if (!qword_256811480)
  {
    result = MEMORY[0x23B81C18C](&unk_2378270C0, &type metadata for CAUBaselineAnchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811480);
  }
  return result;
}

unint64_t sub_2378147BC()
{
  unint64_t result;

  result = qword_256811488;
  if (!qword_256811488)
  {
    result = MEMORY[0x23B81C18C](&unk_237827178, &type metadata for CAUVehicleLayoutInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811488);
  }
  return result;
}

unint64_t sub_237814804()
{
  unint64_t result;

  result = qword_256811490;
  if (!qword_256811490)
  {
    result = MEMORY[0x23B81C18C](&unk_2378270E8, &type metadata for CAUVehicleLayoutInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811490);
  }
  return result;
}

unint64_t sub_23781484C()
{
  unint64_t result;

  result = qword_256811498;
  if (!qword_256811498)
  {
    result = MEMORY[0x23B81C18C](&unk_237827110, &type metadata for CAUVehicleLayoutInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811498);
  }
  return result;
}

unint64_t sub_237814894()
{
  unint64_t result;

  result = qword_2568114A0;
  if (!qword_2568114A0)
  {
    result = MEMORY[0x23B81C18C](&unk_237827030, &type metadata for CAUBaselineAnchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568114A0);
  }
  return result;
}

unint64_t sub_2378148DC()
{
  unint64_t result;

  result = qword_2568114A8;
  if (!qword_2568114A8)
  {
    result = MEMORY[0x23B81C18C](&unk_237827058, &type metadata for CAUBaselineAnchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568114A8);
  }
  return result;
}

uint64_t sub_237814920(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 120 && a2 == 0xE100000000000000 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 121 && a2 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_2378261E0();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2378149DC(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 120 && a2 == 0xE100000000000000 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 121 && a2 == 0xE100000000000000 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6874646977 && a2 == 0xE500000000000000 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746867696568 && a2 == 0xE600000000000000 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656E696C65736162 && a2 == 0xEE00726F68636E41)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v5 = sub_2378261E0();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_237814BBC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_237825F4C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_237814C38(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  v2 = v1;
  swift_retain();
  return sub_237825F58();
}

uint64_t sub_237814CAC()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_237825F4C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_237814D24()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568114B8);
  sub_237825F34();
  return swift_endAccess();
}

uint64_t sub_237814D88(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, uint64_t, uint64_t);
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568116C8);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - v7;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568114B8);
  sub_237825F40();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_237814E98()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568114B8);
  sub_237825F34();
  return swift_endAccess();
}

uint64_t CAUAssetLibraryManager.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  CAUAssetLibraryManager.init()();
  return v0;
}

uint64_t CAUAssetLibraryManager.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD v12[2];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568114B8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v1 + 16) = 0;
  v6 = v1 + OBJC_IVAR____TtC13CarAssetUtils22CAUAssetLibraryManager__assetLibrary;
  v12[1] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568114C0);
  sub_237825F28();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v6, v5, v2);
  if (qword_2568112A8 != -1)
    swift_once();
  v7 = sub_237825F10();
  __swift_project_value_buffer(v7, (uint64_t)qword_256811808);
  v8 = sub_237825EF8();
  v9 = sub_237826054();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_23780B000, v8, v9, "Starting Asset Manager", v10, 2u);
    MEMORY[0x23B81C1EC](v10, -1, -1);
  }

  sub_237815098();
  return v1;
}

void sub_237815098()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;

  v1 = v0;
  if (qword_2568112A8 != -1)
    swift_once();
  v2 = sub_237825F10();
  __swift_project_value_buffer(v2, (uint64_t)qword_256811808);
  v3 = sub_237825EF8();
  v4 = sub_237826054();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23780B000, v3, v4, "setup new connection", v5, 2u);
    MEMORY[0x23B81C1EC](v5, -1, -1);
  }

  objc_msgSend(*(id *)(v0 + 16), sel_invalidate);
  v6 = *(void **)(v0 + 16);
  *(_QWORD *)(v0 + 16) = 0;

  sub_237817514();
  v7 = *(void **)(v0 + 16);
  *(_QWORD *)(v0 + 16) = v8;

  v9 = sub_237825EF8();
  v10 = sub_237826054();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_23780B000, v9, v10, "Initialized client proxy", v11, 2u);
    MEMORY[0x23B81C1EC](v11, -1, -1);
  }

  if (*(_QWORD *)(v1 + 16))
    swift_weakAssign();
}

uint64_t sub_237815388()
{
  uint64_t v0;
  uint64_t v2;
  _OWORD v3[2];
  _BYTE v4[24];
  uint64_t v5;

  if (objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy_connection), sel_remoteTarget))
  {
    sub_2378260A8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_23781748C((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568116C0);
    if (swift_dynamicCast())
      return v2;
    else
      return 0;
  }
  else
  {
    sub_2378174D4((uint64_t)v4);
    return 0;
  }
}

id sub_2378154C0(void *a1)
{
  void *v1;
  char *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  _QWORD v18[6];
  objc_super v19;

  swift_weakInit();
  v3 = v1;
  v4 = (void *)sub_237825FA0();
  v5 = objc_msgSend((id)objc_opt_self(), sel_serial);
  v6 = BSDispatchQueueCreate();

  *(_QWORD *)&v3[OBJC_IVAR____TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy_connectionQueue] = v6;
  *(_QWORD *)&v3[OBJC_IVAR____TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy_connection] = a1;
  v7 = a1;

  v19.receiver = v3;
  v19.super_class = (Class)type metadata accessor for CAUAssetLibraryManager._ClientProxy();
  v8 = objc_msgSendSuper2(&v19, sel_init);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_237817808;
  *(_QWORD *)(v10 + 24) = v9;
  v18[4] = sub_237816C8C;
  v18[5] = v10;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 1107296256;
  v18[2] = sub_237815CD0;
  v18[3] = &block_descriptor_25;
  v11 = _Block_copy(v18);
  v12 = v8;
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_configureConnection_, v11);
  _Block_release(v11);
  LOBYTE(v11) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v11 & 1) != 0)
  {
    __break(1u);
  }
  else if (qword_2568112A8 == -1)
  {
    goto LABEL_3;
  }
  swift_once();
LABEL_3:
  v13 = sub_237825F10();
  __swift_project_value_buffer(v13, (uint64_t)qword_256811808);
  v14 = sub_237825EF8();
  v15 = sub_237826054();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_23780B000, v14, v15, "connection activating", v16, 2u);
    MEMORY[0x23B81C1EC](v16, -1, -1);
  }

  objc_msgSend(v7, sel_activate);
  swift_release();

  return v12;
}

void sub_237815770(void *a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  void *v15;
  uint64_t v16;

  v4 = objc_msgSend((id)objc_opt_self(), sel_userInteractive);
  objc_msgSend(a1, sel_setServiceQuality_, v4);

  if (qword_256811298 != -1)
    swift_once();
  objc_msgSend(a1, sel_setInterface_, qword_2568117D8);
  objc_msgSend(a1, sel_setInterfaceTarget_, a2);
  v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v15 = sub_237817820;
  v16 = v5;
  v6 = MEMORY[0x24BDAC760];
  v11 = MEMORY[0x24BDAC760];
  v12 = 1107296256;
  v13 = sub_237815A90;
  v14 = &block_descriptor_29;
  v7 = _Block_copy(&v11);
  swift_release();
  objc_msgSend(a1, sel_setActivationHandler_, v7);
  _Block_release(v7);
  v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v15 = sub_237817828;
  v16 = v8;
  v11 = v6;
  v12 = 1107296256;
  v13 = sub_237815A90;
  v14 = &block_descriptor_33;
  v9 = _Block_copy(&v11);
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v9);
  _Block_release(v9);
  v15 = sub_237815C04;
  v16 = 0;
  v11 = v6;
  v12 = 1107296256;
  v13 = sub_237815A90;
  v14 = &block_descriptor_36;
  v10 = _Block_copy(&v11);
  objc_msgSend(a1, sel_setInvalidationHandler_, v10);
  _Block_release(v10);
}

void sub_237815988(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x23B81C234](v2);
  if (v3)
  {
    v4 = (void *)v3;
    if (qword_2568112A8 != -1)
      swift_once();
    v5 = sub_237825F10();
    __swift_project_value_buffer(v5, (uint64_t)qword_256811808);
    v6 = sub_237825EF8();
    v7 = sub_237826054();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_23780B000, v6, v7, "connection activated", v8, 2u);
      MEMORY[0x23B81C1EC](v8, -1, -1);
    }

    sub_237815D0C();
  }
}

void sub_237815A90(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_237815AE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x23B81C234](v2);
  if (v3)
  {
    v4 = (void *)v3;
    if (qword_2568112A8 != -1)
      swift_once();
    v5 = sub_237825F10();
    __swift_project_value_buffer(v5, (uint64_t)qword_256811808);
    v6 = sub_237825EF8();
    v7 = sub_237826054();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_23780B000, v6, v7, "connection interrupted", v8, 2u);
      MEMORY[0x23B81C1EC](v8, -1, -1);
    }

    if (swift_weakLoadStrong())
    {
      sub_237815098();
      swift_release();
    }

  }
}

void sub_237815C04()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (qword_2568112A8 != -1)
    swift_once();
  v0 = sub_237825F10();
  __swift_project_value_buffer(v0, (uint64_t)qword_256811808);
  oslog = sub_237825EF8();
  v1 = sub_237826054();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_23780B000, oslog, v1, "connection invalidated", v2, 2u);
    MEMORY[0x23B81C1EC](v2, -1, -1);
  }

}

uint64_t sub_237815CD0(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

uint64_t sub_237815D0C()
{
  void *v0;
  uint64_t result;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  char isEscapingClosureAtFileLocation;
  _QWORD v8[6];

  result = sub_237815388();
  if (result)
  {
    v2 = (void *)result;
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v0;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = sub_237816C74;
    *(_QWORD *)(v4 + 24) = v3;
    v8[4] = sub_237816C8C;
    v8[5] = v4;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 1107296256;
    v8[2] = sub_2378166D0;
    v8[3] = &block_descriptor;
    v5 = _Block_copy(v8);
    v6 = v0;
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_fetchVariantsWithReply_, v5);
    swift_unknownObjectRelease();
    _Block_release(v5);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_237815E44(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v8 = sub_237825F70();
  v25 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_237825F88();
  v23 = *(_QWORD *)(v11 - 8);
  v24 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237816CC4();
  v14 = (void *)sub_237826060();
  v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v15;
  v16[3] = a4;
  v16[4] = a3;
  v16[5] = a1;
  v16[6] = a2;
  aBlock[4] = sub_237816D68;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2378166A4;
  aBlock[3] = &block_descriptor_16;
  v17 = _Block_copy(aBlock);
  v18 = a1;
  v19 = a2;
  v20 = a4;
  swift_bridgeObjectRetain();
  swift_release();
  sub_237825F7C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_237816D78();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811688);
  sub_237816DC0();
  sub_2378260B4();
  MEMORY[0x23B81BC7C](0, v13, v10, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v13, v24);
}

void sub_237816060(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;
  os_log_type_t v16;
  uint64_t v17;
  id v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  int v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;

  v9 = a1 + 16;
  swift_beginAccess();
  v10 = MEMORY[0x23B81C234](v9);
  if (!v10)
  {
    if (qword_2568112A8 != -1)
      swift_once();
    v13 = sub_237825F10();
    __swift_project_value_buffer(v13, (uint64_t)qword_256811808);
    v11 = sub_237825EF8();
    v14 = sub_237826048();
    if (os_log_type_enabled(v11, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_23780B000, v11, v14, "_ClientProxy instance is nil.", v15, 2u);
      MEMORY[0x23B81C1EC](v15, -1, -1);
    }
    goto LABEL_20;
  }
  v11 = v10;
  if (a2)
    v12 = sub_237826048();
  else
    v12 = sub_23782603C();
  v16 = v12;
  if (qword_2568112A8 != -1)
    swift_once();
  v17 = sub_237825F10();
  __swift_project_value_buffer(v17, (uint64_t)qword_256811808);
  v18 = a2;
  swift_bridgeObjectRetain_n();
  v19 = v18;
  v20 = sub_237825EF8();
  v21 = v16;
  if (os_log_type_enabled(v20, v16))
  {
    v22 = swift_slowAlloc();
    v23 = swift_slowAlloc();
    v34 = v23;
    *(_DWORD *)v22 = 136315394;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568116A0);
    v24 = sub_237825FAC();
    sub_237816E0C(v24, v25, &v34);
    sub_237826090();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    v26 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568116A8);
    v27 = sub_237825FAC();
    sub_237816E0C(v27, v28, &v34);
    sub_237826090();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23780B000, v20, v21, "fetched %s with error %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B81C1EC](v23, -1, -1);
    MEMORY[0x23B81C1EC](v22, -1, -1);

    if (!a3)
    {
LABEL_18:
      if (swift_weakLoadStrong())
      {
        swift_getKeyPath();
        swift_getKeyPath();
        v34 = 0;
        swift_retain();
        sub_237825F58();
        swift_release();
      }
      goto LABEL_20;
    }
  }
  else
  {

    swift_bridgeObjectRelease_n();
    if (!a3)
      goto LABEL_18;
  }
  if (!a4)
    goto LABEL_18;
  if (swift_weakLoadStrong())
  {
    swift_bridgeObjectRetain();
    v29 = a4;
    v30 = objc_msgSend(a5, sel_BOOLValue);
    v31 = (void *)sub_2378138B4(a3);
    swift_bridgeObjectRelease();
    objc_allocWithZone((Class)type metadata accessor for CAUAssetLibrary());
    v32 = v29;
    v33 = sub_237823388(v30, v31, v32);
    swift_getKeyPath();
    swift_getKeyPath();
    v34 = (uint64_t)v33;
    swift_retain();
    sub_237825F58();
    swift_release();

    return;
  }
LABEL_20:

}

uint64_t sub_2378166A4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2378166D0(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  void (*v8)(void *, id, uint64_t, void *);
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  v8 = *(void (**)(void *, id, uint64_t, void *))(a1 + 32);
  if (a4)
    v9 = sub_237825F94();
  else
    v9 = 0;
  v10 = a2;
  v11 = a3;
  v12 = a5;
  v8(a2, v11, v9, a5);

  return swift_bridgeObjectRelease();
}

id sub_23781677C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAUAssetLibraryManager._ClientProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t CAUAssetLibraryManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC13CarAssetUtils22CAUAssetLibraryManager__assetLibrary;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568114B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t CAUAssetLibraryManager.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC13CarAssetUtils22CAUAssetLibraryManager__assetLibrary;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568114B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_2378168A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for CAUAssetLibraryManager();
  result = sub_237825F1C();
  *a1 = result;
  return result;
}

id sub_2378168DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v1 = v0;
  if (qword_2568112A8 != -1)
    swift_once();
  v2 = sub_237825F10();
  __swift_project_value_buffer(v2, (uint64_t)qword_256811808);
  v3 = sub_237825EF8();
  v4 = sub_237826054();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23780B000, v3, v4, "invalidate proxy", v5, 2u);
    MEMORY[0x23B81C1EC](v5, -1, -1);
  }

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy_connection), sel_invalidate);
}

uint64_t sub_237816ADC()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_237816AF0()
{
  return type metadata accessor for CAUAssetLibraryManager();
}

uint64_t type metadata accessor for CAUAssetLibraryManager()
{
  uint64_t result;

  result = qword_2568114F0;
  if (!qword_2568114F0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_237816B34()
{
  unint64_t v0;

  sub_237816BD8();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for CAUAssetLibraryManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CAUAssetLibraryManager.assetLibrary.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of CAUAssetLibraryManager.$assetLibrary.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of CAUAssetLibraryManager.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

void sub_237816BD8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256811500)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568114C0);
    v0 = sub_237825F64();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256811500);
  }
}

uint64_t type metadata accessor for CAUAssetLibraryManager._ClientProxy()
{
  return objc_opt_self();
}

uint64_t sub_237816C50()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_237816C74(void *a1, void *a2, uint64_t a3, void *a4)
{
  return sub_237815E44(a1, a2, a3, a4);
}

uint64_t sub_237816C7C()
{
  return swift_deallocObject();
}

uint64_t sub_237816C8C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

unint64_t sub_237816CC4()
{
  unint64_t result;

  result = qword_256811678;
  if (!qword_256811678)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256811678);
  }
  return result;
}

uint64_t sub_237816D00()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_237816D24()
{
  id *v0;

  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_237816D68()
{
  uint64_t v0;

  sub_237816060(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40), *(void **)(v0 + 48));
}

unint64_t sub_237816D78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256811680;
  if (!qword_256811680)
  {
    v1 = sub_237825F70();
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_256811680);
  }
  return result;
}

unint64_t sub_237816DC0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256811690;
  if (!qword_256811690)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811688);
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_256811690);
  }
  return result;
}

uint64_t sub_237816E0C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_237816EDC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23781744C((uint64_t)v12, *a3);
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
      sub_23781744C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_237816EDC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23782609C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_237817094(a5, a6);
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
  v8 = sub_2378260D8();
  if (!v8)
  {
    sub_2378260F0();
    __break(1u);
LABEL_17:
    result = sub_23782612C();
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

uint64_t sub_237817094(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_237817128(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_237817300(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_237817300(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_237817128(uint64_t a1, unint64_t a2)
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
      v3 = sub_23781729C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2378260CC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2378260F0();
      __break(1u);
LABEL_10:
      v2 = sub_237825FE8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23782612C();
    __break(1u);
LABEL_14:
    result = sub_2378260F0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23781729C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568116B0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_237817300(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568116B0);
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
  result = sub_23782612C();
  __break(1u);
  return result;
}

uint64_t sub_23781744C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23781748C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568116B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2378174D4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568116B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_237817514()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _BYTE *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _BYTE *v15;

  v0 = (void *)sub_237825FA0();
  v1 = (void *)sub_237825FA0();
  v2 = objc_msgSend((id)objc_opt_self(), sel_endpointForMachName_service_instance_, v0, v1, 0);

  if (v2)
  {
    v3 = objc_msgSend((id)objc_opt_self(), sel_connectionWithEndpoint_, v2);
    if (v3)
    {
      v4 = v3;
      v5 = objc_allocWithZone((Class)type metadata accessor for CAUAssetLibraryManager._ClientProxy());
      sub_2378154C0(v4);

    }
    else
    {
      if (qword_2568112A8 != -1)
        swift_once();
      v11 = sub_237825F10();
      __swift_project_value_buffer(v11, (uint64_t)qword_256811808);
      v12 = sub_237825EF8();
      v13 = sub_237826054();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_23780B000, v12, v13, "connection failed", v14, 2u);
        MEMORY[0x23B81C1EC](v14, -1, -1);
      }

      sub_2378177C4();
      swift_allocError();
      *v15 = 1;
      swift_willThrow();

    }
  }
  else
  {
    if (qword_2568112A8 != -1)
      swift_once();
    v6 = sub_237825F10();
    __swift_project_value_buffer(v6, (uint64_t)qword_256811808);
    v7 = sub_237825EF8();
    v8 = sub_237826054();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_23780B000, v7, v8, "endpoint failed", v9, 2u);
      MEMORY[0x23B81C1EC](v9, -1, -1);
    }

    sub_2378177C4();
    swift_allocError();
    *v10 = 0;
    swift_willThrow();
  }
}

unint64_t sub_2378177C4()
{
  unint64_t result;

  result = qword_2568116D0;
  if (!qword_2568116D0)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUError.AssetLibrary, &type metadata for CAUError.AssetLibrary);
    atomic_store(result, (unint64_t *)&qword_2568116D0);
  }
  return result;
}

void sub_237817808(void *a1)
{
  uint64_t v1;

  sub_237815770(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_237817810()
{
  return swift_deallocObject();
}

void sub_237817820(uint64_t a1)
{
  uint64_t v1;

  sub_237815988(a1, v1);
}

void sub_237817828(uint64_t a1)
{
  uint64_t v1;

  sub_237815AE0(a1, v1);
}

BOOL static CAUVehicleLayoutKey.End.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CAUVehicleLayoutKey.End.hash(into:)()
{
  return sub_237826240();
}

void CAUVehicleLayoutKey.side.getter(_BYTE *a1@<X8>)
{
  char *v1;

  *a1 = byte_2378276B6[*v1];
}

void CAUVehicleLayoutKey.end.getter(_BYTE *a1@<X8>)
{
  char *v1;

  *a1 = byte_2378276D7[*v1];
}

uint64_t CAUVehicleLayoutKey.sharedKeys.getter()
{
  char *v0;

  return qword_25095E748[*v0];
}

CarAssetUtils::CAUVehicleLayoutKey_optional __swiftcall CAUVehicleLayoutKey.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  CarAssetUtils::CAUVehicleLayoutKey_optional result;
  char v5;
  char v6;

  v2 = v1;
  v3 = sub_2378261EC();
  result.value = swift_bridgeObjectRelease();
  v5 = 0;
  v6 = 15;
  switch(v3)
  {
    case 0:
      goto LABEL_17;
    case 1:
      v5 = 1;
      goto LABEL_17;
    case 2:
      v5 = 2;
      goto LABEL_17;
    case 3:
      v5 = 3;
      goto LABEL_17;
    case 4:
      v5 = 4;
      goto LABEL_17;
    case 5:
      v5 = 5;
      goto LABEL_17;
    case 6:
      v5 = 6;
      goto LABEL_17;
    case 7:
      v5 = 7;
      goto LABEL_17;
    case 8:
      v5 = 8;
      goto LABEL_17;
    case 9:
      v5 = 9;
      goto LABEL_17;
    case 10:
      v5 = 10;
      goto LABEL_17;
    case 11:
      v5 = 11;
      goto LABEL_17;
    case 12:
      v5 = 12;
      goto LABEL_17;
    case 13:
      v5 = 13;
      goto LABEL_17;
    case 14:
      v5 = 14;
LABEL_17:
      v6 = v5;
      break;
    case 15:
      break;
    case 16:
      v6 = 16;
      break;
    case 17:
      v6 = 17;
      break;
    case 18:
      v6 = 18;
      break;
    case 19:
      v6 = 19;
      break;
    case 20:
      v6 = 20;
      break;
    case 21:
      v6 = 21;
      break;
    case 22:
      v6 = 22;
      break;
    case 23:
      v6 = 23;
      break;
    case 24:
      v6 = 24;
      break;
    case 25:
      v6 = 25;
      break;
    case 26:
      v6 = 26;
      break;
    case 27:
      v6 = 27;
      break;
    case 28:
      v6 = 28;
      break;
    case 29:
      v6 = 29;
      break;
    case 30:
      v6 = 30;
      break;
    case 31:
      v6 = 31;
      break;
    case 32:
      v6 = 32;
      break;
    default:
      v6 = 33;
      break;
  }
  *v2 = v6;
  return result;
}

void *static CAUVehicleLayoutKey.allCases.getter()
{
  return &unk_25095D880;
}

uint64_t CAUVehicleLayoutKey.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_237817AA0 + 4 * byte_237827381[*v0]))(0xD000000000000010, 0x8000000237829800);
}

uint64_t sub_237817AA0()
{
  return 0x6F72665F726F6F64;
}

void sub_237817CBC()
{
  JUMPOUT(0x237817CE8);
}

uint64_t sub_237817CF4()
{
  return 0x6B6E757274;
}

uint64_t sub_237817D20()
{
  return 0x65696873646E6977;
}

unint64_t sub_237817D48()
{
  unint64_t result;

  result = qword_2568117A0;
  if (!qword_2568117A0)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUVehicleLayoutKey.Side, &type metadata for CAUVehicleLayoutKey.Side);
    atomic_store(result, (unint64_t *)&qword_2568117A0);
  }
  return result;
}

unint64_t sub_237817D90()
{
  unint64_t result;

  result = qword_2568117A8;
  if (!qword_2568117A8)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUVehicleLayoutKey.End, &type metadata for CAUVehicleLayoutKey.End);
    atomic_store(result, (unint64_t *)&qword_2568117A8);
  }
  return result;
}

uint64_t sub_237817DD4()
{
  return sub_23781F138();
}

unint64_t sub_237817DE4()
{
  unint64_t result;

  result = qword_2568117B0;
  if (!qword_2568117B0)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUVehicleLayoutKey, &type metadata for CAUVehicleLayoutKey);
    atomic_store(result, (unint64_t *)&qword_2568117B0);
  }
  return result;
}

uint64_t sub_237817E28()
{
  sub_237826234();
  CAUVehicleLayoutKey.rawValue.getter();
  sub_237825FC4();
  swift_bridgeObjectRelease();
  return sub_23782624C();
}

uint64_t sub_237817E8C()
{
  CAUVehicleLayoutKey.rawValue.getter();
  sub_237825FC4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237817EDC()
{
  sub_237826234();
  CAUVehicleLayoutKey.rawValue.getter();
  sub_237825FC4();
  swift_bridgeObjectRelease();
  return sub_23782624C();
}

CarAssetUtils::CAUVehicleLayoutKey_optional sub_237817F3C(Swift::String *a1)
{
  return CAUVehicleLayoutKey.init(rawValue:)(*a1);
}

uint64_t sub_237817F48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CAUVehicleLayoutKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_237817F6C()
{
  sub_23781835C();
  return sub_237826018();
}

uint64_t sub_237817FC8()
{
  sub_23781835C();
  return sub_23782600C();
}

uint64_t sub_237818014()
{
  sub_23781835C();
  return sub_237826024();
}

uint64_t sub_237818054()
{
  sub_23781835C();
  return sub_237826030();
}

unint64_t sub_2378180C0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568117B8;
  if (!qword_2568117B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568117C0);
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2568117B8);
  }
  return result;
}

void sub_23781810C(_QWORD *a1@<X8>)
{
  *a1 = &unk_25095D880;
}

uint64_t getEnumTagSinglePayload for CAUVehicleLayoutKey(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE0)
    goto LABEL_17;
  if (a2 + 32 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 32) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 32;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 32;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 32;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x21;
  v8 = v6 - 33;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CAUVehicleLayoutKey(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 32 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 32) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE0)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xDF)
    return ((uint64_t (*)(void))((char *)&loc_2378181F8 + 4 * byte_2378273A7[v4]))();
  *a1 = a2 + 32;
  return ((uint64_t (*)(void))((char *)sub_23781822C + 4 * byte_2378273A2[v4]))();
}

uint64_t sub_23781822C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237818234(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23781823CLL);
  return result;
}

uint64_t sub_237818248(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237818250);
  *(_BYTE *)result = a2 + 32;
  return result;
}

uint64_t sub_237818254(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23781825C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CAUVehicleLayoutKey()
{
  return &type metadata for CAUVehicleLayoutKey;
}

ValueMetadata *type metadata accessor for CAUVehicleLayoutKey.Side()
{
  return &type metadata for CAUVehicleLayoutKey.Side;
}

uint64_t _s13CarAssetUtils19CAUVehicleLayoutKeyO4SideOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2378182DC + 4 * byte_2378273B1[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_237818310 + 4 * byte_2378273AC[v4]))();
}

uint64_t sub_237818310(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237818318(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237818320);
  return result;
}

uint64_t sub_23781832C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237818334);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_237818338(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237818340(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CAUVehicleLayoutKey.End()
{
  return &type metadata for CAUVehicleLayoutKey.End;
}

unint64_t sub_23781835C()
{
  unint64_t result;

  result = qword_2568117C8;
  if (!qword_2568117C8)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUVehicleLayoutKey, &type metadata for CAUVehicleLayoutKey);
    atomic_store(result, (unint64_t *)&qword_2568117C8);
  }
  return result;
}

unint64_t static CAUVariantsService.domain.getter()
{
  return 0xD000000000000020;
}

unint64_t static CAUVariantsService.machName.getter()
{
  return 0xD000000000000020;
}

unint64_t static CAUVariantsService.entitlement.getter()
{
  return 0xD000000000000028;
}

unint64_t static CAUVariantsService.identifier.getter()
{
  return 0xD000000000000020;
}

id sub_237818470()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_userInteractive);
  qword_2568117D0 = (uint64_t)result;
  return result;
}

id static CAUVariantsService.serviceQuality.getter()
{
  return sub_237818620(&qword_256811290, (id *)&qword_2568117D0);
}

id sub_2378184E0()
{
  id result;

  result = sub_2378184FC();
  qword_2568117D8 = (uint64_t)result;
  return result;
}

id sub_2378184FC()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;

  v0 = (void *)sub_237825FA0();
  v1 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithIdentifier_, v0);

  objc_msgSend(v1, sel_setClientMessagingExpectation_, 1);
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_protocolForProtocol_, &unk_2568195A0);
  objc_msgSend(v1, sel_setServer_, v3);

  v4 = objc_msgSend(v2, sel_protocolForProtocol_, &unk_256819200);
  objc_msgSend(v1, sel_setClient_, v4);

  return v1;
}

id static CAUVariantsService.interface.getter()
{
  return sub_237818620(&qword_256811298, (id *)&qword_2568117D8);
}

id sub_237818620(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

id sub_237818674(uint64_t a1, uint64_t a2, _QWORD *a3, id *a4)
{
  if (*a3 != -1)
    swift_once();
  return *a4;
}

id CAUVariantsService.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CAUVariantsService.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAUVariantsService();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for CAUVariantsService()
{
  return objc_opt_self();
}

id CAUVariantsService.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAUVariantsService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_237818798()
{
  uint64_t result;

  sub_237819564();
  result = sub_237826078();
  qword_256817AE0 = result;
  return result;
}

uint64_t static CAULogger.error(_:function:file:line:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  return sub_23781883C(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x24BEE7910]);
}

uint64_t static CAULogger.info(_:function:file:line:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  return sub_23781883C(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x24BEE78F0]);
}

uint64_t static CAULogger.default(_:function:file:line:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  return sub_23781883C(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x24BEE78F0]);
}

uint64_t static CAULogger.debug(_:function:file:line:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  return sub_23781883C(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x24BEE7908]);
}

uint64_t static CAULogger.fault(_:function:file:line:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  return sub_23781883C(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x24BEE7920]);
}

uint64_t sub_23781883C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t (*a8)(void))
{
  os_log_type_t v15;

  v15 = a8();
  if (qword_2568112A0 != -1)
    swift_once();
  return sub_2378191CC(v15, (os_log_t)qword_256817AE0, a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_2378188EC()
{
  uint64_t v0;

  v0 = sub_237825F10();
  __swift_allocate_value_buffer(v0, qword_256811808);
  __swift_project_value_buffer(v0, (uint64_t)qword_256811808);
  return sub_237825F04();
}

uint64_t static Logger.assetVariants.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2568112A8 != -1)
    swift_once();
  v2 = sub_237825F10();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256811808);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2378189DC(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  unint64_t v48;
  _QWORD v50[4];

  v50[3] = a4;
  if (a1 < 0)
    goto LABEL_42;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_237818E78(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    v13 = *(_QWORD **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  v42 = a1;
  v43 = v10;
  v48 = 4 * v12;
  v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v14 = 15;
  v15 = 15;
  v16 = 15;
  while (1)
  {
    v50[0] = sub_237825FF4();
    v50[1] = v17;
    v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) != 0)
      break;
    v14 = sub_237825FD0();
LABEL_9:
    if (v48 == v14 >> 14)
      goto LABEL_29;
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    v14 = sub_237825FD0();
    *(_QWORD *)(v47 + 16) = v14;
    v15 = v14;
    v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14)
    goto LABEL_41;
  v20 = sub_237826000();
  v44 = v21;
  v45 = v20;
  v23 = v22;
  v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v13 = sub_237818FD0(0, v13[2] + 1, 1, v13);
  v27 = v13[2];
  v26 = v13[3];
  if (v27 >= v26 >> 1)
    v13 = sub_237818FD0((_QWORD *)(v26 > 1), v27 + 1, 1, v13);
  v13[2] = v27 + 1;
  v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(_QWORD *)(v43 + 16) = v13;
  v29 = sub_237825FD0();
  v14 = v29;
  *(_QWORD *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    v15 = v29;
    v16 = v29;
    goto LABEL_9;
  }
  v16 = v29;
  v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    v31 = sub_237826000();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = sub_237818FD0(0, v13[2] + 1, 1, v13);
    v39 = v13[2];
    v38 = v13[3];
    if (v39 >= v38 >> 1)
      v13 = sub_237818FD0((_QWORD *)(v38 > 1), v39 + 1, 1, v13);
    v13[2] = v39 + 1;
    v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(_QWORD *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_2378260F0();
  __break(1u);
LABEL_42:
  result = sub_2378260F0();
  __break(1u);
  return result;
}

uint64_t sub_237818E78(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_237826000();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_237818FD0(0, v14[2] + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_237818FD0((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_2378260F0();
  __break(1u);
  return result;
}

_QWORD *sub_237818FD0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256811820);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2378190DC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2378190DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23782612C();
  __break(1u);
  return result;
}

uint64_t sub_2378191CC(os_log_type_t a1, os_log_t oslog, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9)
{
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  os_log_t v39;
  _QWORD v40[2];
  uint64_t v41;

  result = os_log_type_enabled(oslog, a1);
  if ((_DWORD)result)
  {
    v38 = a3;
    v39 = oslog;
    v35 = a9;
    v36 = a5;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v18 = swift_slowAlloc();
    v19 = swift_slowAlloc();
    v37 = v19;
    *(_DWORD *)v18 = 136315906;
    v40[0] = 47;
    v40[1] = 0xE100000000000000;
    v41 = v19;
    MEMORY[0x24BDAC7A8](v19);
    v34[2] = v40;
    swift_bridgeObjectRetain();
    v20 = sub_2378189DC(0x7FFFFFFFFFFFFFFFLL, 1, sub_2378194DC, (uint64_t)v34, a7, a8);
    v21 = *(_QWORD *)(v20 + 16);
    if (v21)
    {
      v22 = (uint64_t *)(v20 + 32 * v21);
      v23 = *v22;
      v24 = v22[1];
      v26 = v22[2];
      v25 = v22[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      v23 = MEMORY[0x23B81BC94](0, 0xE000000000000000);
      v24 = v27;
      v26 = v28;
      v25 = v29;
    }
    v30 = MEMORY[0x23B81BBC8](v23, v24, v26, v25);
    v32 = v31;
    swift_bridgeObjectRelease();
    v40[0] = sub_237816E0C(v30, v32, &v41);
    sub_237826090();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2048;
    v40[0] = v35;
    sub_237826090();
    *(_WORD *)(v18 + 22) = 2080;
    swift_bridgeObjectRetain();
    v40[0] = sub_237816E0C(v36, a6, &v41);
    sub_237826090();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 32) = 2080;
    swift_bridgeObjectRetain();
    v40[0] = sub_237816E0C(v38, a4, &v41);
    sub_237826090();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23780B000, v39, a1, "%s:%ld %s - %s", (uint8_t *)v18, 0x2Au);
    v33 = v37;
    swift_arrayDestroy();
    MEMORY[0x23B81C1EC](v33, -1, -1);
    return MEMORY[0x23B81C1EC](v18, -1, -1);
  }
  return result;
}

ValueMetadata *type metadata accessor for CAULogger()
{
  return &type metadata for CAULogger;
}

uint64_t sub_2378194DC(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_2378261E0() & 1;
}

uint64_t sub_237819530()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_237819554()
{
  return swift_deallocObject();
}

unint64_t sub_237819564()
{
  unint64_t result;

  result = qword_256811828;
  if (!qword_256811828)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256811828);
  }
  return result;
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

CarAssetUtils::CAUAsset::ClosureMask::State_optional __swiftcall CAUAsset.ClosureMask.State.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  CarAssetUtils::CAUAsset::ClosureMask::State_optional result;
  char v5;

  v2 = v1;
  v3 = sub_237826138();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

uint64_t CAUAsset.ClosureMask.State.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x6465736F6C63;
  else
    return 1852141679;
}

uint64_t sub_237819670(char *a1, char *a2)
{
  return sub_23781F250(*a1, *a2);
}

uint64_t sub_23781967C()
{
  return sub_23781D3B8();
}

uint64_t sub_237819684()
{
  return sub_23781E428();
}

uint64_t sub_23781968C()
{
  return sub_23781D638();
}

CarAssetUtils::CAUAsset::ClosureMask::State_optional sub_237819694(Swift::String *a1)
{
  return CAUAsset.ClosureMask.State.init(rawValue:)(*a1);
}

uint64_t sub_2378196A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CAUAsset.ClosureMask.State.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2378196C4()
{
  sub_23781D228();
  return sub_237826018();
}

uint64_t sub_237819720()
{
  sub_23781D228();
  return sub_23782600C();
}

uint64_t sub_23781976C()
{
  sub_23781D228();
  return sub_237826024();
}

uint64_t sub_2378197AC()
{
  sub_23781D228();
  return sub_237826030();
}

uint64_t CAUAsset.ClosureMask.filename.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

CarAssetUtils::CAUAsset::ClosureMask __swiftcall CAUAsset.ClosureMask.init(vehicleLayoutKey:state:filename:)(CarAssetUtils::CAUVehicleLayoutKey vehicleLayoutKey, CarAssetUtils::CAUAsset::ClosureMask::State state, Swift::String filename)
{
  uint64_t v3;
  char v4;
  CarAssetUtils::CAUAsset::ClosureMask result;

  v4 = *(_BYTE *)state;
  *(_BYTE *)v3 = *(_BYTE *)vehicleLayoutKey;
  *(_BYTE *)(v3 + 1) = v4;
  *(Swift::String *)(v3 + 8) = filename;
  result.filename._object = (void *)filename._countAndFlagsBits;
  LOBYTE(result.filename._countAndFlagsBits) = state;
  result.vehicleLayoutKey = vehicleLayoutKey;
  return result;
}

uint64_t sub_23781985C(char a1)
{
  if (!a1)
    return 0xD000000000000010;
  if (a1 == 1)
    return 0x6574617473;
  return 0x656D616E656C6966;
}

uint64_t sub_2378198B4()
{
  char *v0;

  return sub_23781985C(*v0);
}

uint64_t sub_2378198BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23781CD94(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2378198E0()
{
  sub_23781B574();
  return sub_237826270();
}

uint64_t sub_237819908()
{
  sub_23781B574();
  return sub_23782627C();
}

uint64_t CAUAsset.ClosureMask.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  _QWORD v11[3];
  int v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256811830);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v12 = v1[1];
  v9 = *((_QWORD *)v1 + 1);
  v11[1] = *((_QWORD *)v1 + 2);
  v11[2] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23781B574();
  sub_237826264();
  v17 = v8;
  v16 = 0;
  sub_23780F7D8();
  sub_2378261BC();
  if (!v2)
  {
    v15 = v12;
    v14 = 1;
    sub_23781B5B8();
    sub_2378261BC();
    v13 = 2;
    sub_237826198();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t CAUAsset.ClosureMask.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  char v16;
  char v17;
  unsigned __int8 v18;
  char v19;
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256811848);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23781B574();
  sub_237826258();
  if (!v2)
  {
    v19 = 0;
    sub_237810048();
    sub_237826174();
    v9 = v20;
    v17 = 1;
    sub_23781B5FC();
    sub_237826174();
    v15 = v18;
    v16 = 2;
    v11 = sub_237826150();
    v13 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_BYTE *)a2 = v9;
    *(_BYTE *)(a2 + 1) = v15;
    *(_QWORD *)(a2 + 8) = v11;
    *(_QWORD *)(a2 + 16) = v13;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_237819C74@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CAUAsset.ClosureMask.init(from:)(a1, a2);
}

uint64_t sub_237819C88(_QWORD *a1)
{
  return CAUAsset.ClosureMask.encode(to:)(a1);
}

uint64_t sub_237819CA0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

CarAssetUtils::CAUAsset::Seat::State_optional __swiftcall CAUAsset.Seat.State.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  CarAssetUtils::CAUAsset::Seat::State_optional result;
  char v5;

  v2 = v1;
  v3 = sub_237826138();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t CAUAsset.Seat.State.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aSelectedheaton[8 * *v0];
}

uint64_t sub_237819D48(char *a1, char *a2)
{
  return sub_23781F1CC(*a1, *a2);
}

uint64_t sub_237819D54()
{
  return sub_23781D42C();
}

uint64_t sub_237819D5C()
{
  return sub_23781E3E8();
}

uint64_t sub_237819D64()
{
  return sub_23781D6A8();
}

CarAssetUtils::CAUAsset::Seat::State_optional sub_237819D6C(Swift::String *a1)
{
  return CAUAsset.Seat.State.init(rawValue:)(*a1);
}

uint64_t sub_237819D78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CAUAsset.Seat.State.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_237819D9C()
{
  sub_23781D1E4();
  return sub_237826018();
}

uint64_t sub_237819DF8()
{
  sub_23781D1E4();
  return sub_23782600C();
}

uint64_t sub_237819E44()
{
  sub_23781D1E4();
  return sub_237826024();
}

uint64_t sub_237819E84()
{
  sub_23781D1E4();
  return sub_237826030();
}

uint64_t CAUAsset.Seat.isRHD.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 2);
}

CarAssetUtils::CAUAsset::Seat __swiftcall CAUAsset.Seat.init(isRHD:vehicleLayoutKey:state:filename:)(Swift::Bool isRHD, CarAssetUtils::CAUVehicleLayoutKey vehicleLayoutKey, CarAssetUtils::CAUAsset::Seat::State state, Swift::String filename)
{
  uint64_t v4;
  char v5;
  CarAssetUtils::CAUAsset::Seat result;

  v5 = *(_BYTE *)state;
  *(_BYTE *)v4 = *(_BYTE *)vehicleLayoutKey;
  *(_BYTE *)(v4 + 1) = v5;
  *(_BYTE *)(v4 + 2) = isRHD;
  *(Swift::String *)(v4 + 8) = filename;
  LOBYTE(result.filename._object) = state;
  LOBYTE(result.filename._countAndFlagsBits) = vehicleLayoutKey;
  result.vehicleLayoutKey = isRHD;
  return result;
}

uint64_t sub_237819F14(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_237819F4C + 4 * byte_237827740[a1]))(0xD000000000000010, 0x800000023782A2B0);
}

uint64_t sub_237819F4C()
{
  return 0x6574617473;
}

uint64_t sub_237819F60()
{
  return 0x4448527369;
}

uint64_t sub_237819F74()
{
  return 0x656D616E656C6966;
}

uint64_t sub_237819F8C()
{
  unsigned __int8 *v0;

  return sub_237819F14(*v0);
}

uint64_t sub_237819F94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23781CED4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237819FB8()
{
  sub_23781B784();
  return sub_237826270();
}

uint64_t sub_237819FE0()
{
  sub_23781B784();
  return sub_23782627C();
}

uint64_t CAUAsset.Seat.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  int v9;
  uint64_t v10;
  _QWORD v12[3];
  int v13;
  int v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256811858);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = v1[1];
  v13 = v1[2];
  v14 = v9;
  v10 = *((_QWORD *)v1 + 1);
  v12[1] = *((_QWORD *)v1 + 2);
  v12[2] = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23781B784();
  sub_237826264();
  v20 = v8;
  v19 = 0;
  sub_23780F7D8();
  sub_2378261BC();
  if (!v2)
  {
    v18 = v14;
    v17 = 1;
    sub_23781B7C8();
    sub_2378261BC();
    v16 = 2;
    sub_2378261A4();
    v15 = 3;
    sub_237826198();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t CAUAsset.Seat.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  char v18;
  char v19;
  char v20;
  unsigned __int8 v21;
  char v22;
  char v23;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256811870);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23781B784();
  sub_237826258();
  if (!v2)
  {
    v22 = 0;
    sub_237810048();
    sub_237826174();
    v9 = v23;
    v20 = 1;
    sub_23781B80C();
    sub_237826174();
    v10 = v21;
    v19 = 2;
    v16 = sub_23782615C();
    v17 = v10;
    v18 = 3;
    v12 = sub_237826150();
    v14 = v13;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_BYTE *)a2 = v9;
    *(_BYTE *)(a2 + 1) = v17;
    *(_BYTE *)(a2 + 2) = v16 & 1;
    *(_QWORD *)(a2 + 8) = v12;
    *(_QWORD *)(a2 + 16) = v14;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23781A3A8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CAUAsset.Seat.init(from:)(a1, a2);
}

uint64_t sub_23781A3BC(_QWORD *a1)
{
  return CAUAsset.Seat.encode(to:)(a1);
}

uint64_t sub_23781A3D8()
{
  return 1;
}

void sub_23781A3EC(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23781A3F8()
{
  sub_23781B850();
  return sub_237826270();
}

uint64_t sub_23781A420()
{
  sub_23781B850();
  return sub_23782627C();
}

uint64_t CAUAsset.AudioBrandLogo.encode(to:)(_QWORD *a1)
{
  return sub_23781B054(a1, &qword_256811880, (void (*)(void))sub_23781B850);
}

uint64_t CAUAsset.AudioBrandLogo.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23781B178(a1, &qword_256811890, (void (*)(void))sub_23781B850, a2);
}

uint64_t sub_23781A4A0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return CAUAsset.AudioBrandLogo.init(from:)(a1, a2);
}

uint64_t sub_23781A4B4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_23781B2E0(a1, a2, a3, &qword_256811880, (void (*)(void))sub_23781B850);
}

uint64_t CAUAsset.VehicleLogo.filename.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

CarAssetUtils::CAUAsset::VehicleLogo __swiftcall CAUAsset.VehicleLogo.init(filename:)(CarAssetUtils::CAUAsset::VehicleLogo filename)
{
  CarAssetUtils::CAUAsset::VehicleLogo *v1;

  *v1 = filename;
  return filename;
}

uint64_t sub_23781A51C()
{
  return sub_237826240();
}

uint64_t sub_23781A540@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23781D160(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23781A568()
{
  sub_23781B894();
  return sub_237826270();
}

uint64_t sub_23781A590()
{
  sub_23781B894();
  return sub_23782627C();
}

uint64_t CAUAsset.VehicleLogo.encode(to:)(_QWORD *a1)
{
  return sub_23781B054(a1, &qword_256811898, (void (*)(void))sub_23781B894);
}

uint64_t CAUAsset.VehicleLogo.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23781B178(a1, &qword_2568118A8, (void (*)(void))sub_23781B894, a2);
}

uint64_t sub_23781A610@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return CAUAsset.VehicleLogo.init(from:)(a1, a2);
}

uint64_t sub_23781A624(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_23781B2E0(a1, a2, a3, &qword_256811898, (void (*)(void))sub_23781B894);
}

uint64_t sub_23781A650()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CAUAsset.Cabin.isRHD.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t sub_23781A688()
{
  sub_23781B8D8();
  return sub_237826270();
}

uint64_t sub_23781A6B0()
{
  sub_23781B8D8();
  return sub_23782627C();
}

uint64_t CAUAsset.Cabin.encode(to:)(_QWORD *a1)
{
  return sub_23781A898(a1, &qword_2568118B0, (void (*)(void))sub_23781B8D8);
}

uint64_t CAUAsset.Cabin.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23781A9F4(a1, &qword_2568118C0, (void (*)(void))sub_23781B8D8, a2);
}

uint64_t sub_23781A730@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CAUAsset.Cabin.init(from:)(a1, a2);
}

uint64_t sub_23781A744(_QWORD *a1)
{
  return CAUAsset.Cabin.encode(to:)(a1);
}

uint64_t CAUAsset.TopDownInterior.isRHD.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

CarAssetUtils::CAUAsset::TopDownInterior __swiftcall CAUAsset.TopDownInterior.init(isRHD:filename:)(Swift::Bool isRHD, Swift::String filename)
{
  uint64_t v2;
  CarAssetUtils::CAUAsset::TopDownInterior result;

  *(_BYTE *)v2 = isRHD;
  *(Swift::String *)(v2 + 8) = filename;
  result.filename = filename;
  result.isRHD = isRHD;
  return result;
}

uint64_t _s13CarAssetUtils8CAUAssetO5CabinV2eeoiySbAE_AEtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2)
    return 0;
  if (*((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1) && *((_QWORD *)a1 + 2) == *((_QWORD *)a2 + 2))
    return 1;
  else
    return sub_2378261E0();
}

uint64_t sub_23781A7BC(char a1)
{
  if ((a1 & 1) != 0)
    return 0x656D616E656C6966;
  else
    return 0x4448527369;
}

uint64_t sub_23781A7F0()
{
  char *v0;

  return sub_23781A7BC(*v0);
}

uint64_t sub_23781A7F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23781D080(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23781A81C()
{
  sub_23781B91C();
  return sub_237826270();
}

uint64_t sub_23781A844()
{
  sub_23781B91C();
  return sub_23782627C();
}

uint64_t CAUAsset.TopDownInterior.encode(to:)(_QWORD *a1)
{
  return sub_23781A898(a1, &qword_2568118C8, (void (*)(void))sub_23781B91C);
}

uint64_t sub_23781A898(_QWORD *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t v13;
  char v14;
  char v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v13 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v3 + 8);
  v12[0] = *(_QWORD *)(v3 + 16);
  v12[1] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_237826264();
  v15 = 0;
  v10 = v12[2];
  sub_2378261A4();
  if (!v10)
  {
    v14 = 1;
    sub_237826198();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v8, v6);
}

uint64_t CAUAsset.TopDownInterior.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23781A9F4(a1, &qword_2568118D8, (void (*)(void))sub_23781B91C, a2);
}

uint64_t sub_23781A9F4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v17 = a4;
  v18 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_237826258();
  if (!v4)
  {
    v10 = v17;
    v11 = v18;
    v20 = 0;
    v12 = sub_23782615C();
    v19 = 1;
    v14 = sub_237826150();
    v16 = v15;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v11);
    *(_BYTE *)v10 = v12 & 1;
    *(_QWORD *)(v10 + 8) = v14;
    *(_QWORD *)(v10 + 16) = v16;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23781AB50@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CAUAsset.TopDownInterior.init(from:)(a1, a2);
}

uint64_t sub_23781AB64(_QWORD *a1)
{
  return CAUAsset.TopDownInterior.encode(to:)(a1);
}

uint64_t sub_23781AB7C()
{
  sub_23781B960();
  return sub_237826270();
}

uint64_t sub_23781ABA4()
{
  sub_23781B960();
  return sub_23782627C();
}

uint64_t CAUAsset.TopDownExteriorClosuresOverlay.encode(to:)(_QWORD *a1)
{
  return sub_23781B054(a1, &qword_2568118E0, (void (*)(void))sub_23781B960);
}

uint64_t CAUAsset.TopDownExteriorClosuresOverlay.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23781B178(a1, &qword_2568118F0, (void (*)(void))sub_23781B960, a2);
}

uint64_t sub_23781AC24@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return CAUAsset.TopDownExteriorClosuresOverlay.init(from:)(a1, a2);
}

uint64_t sub_23781AC38(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_23781B2E0(a1, a2, a3, &qword_2568118E0, (void (*)(void))sub_23781B960);
}

uint64_t sub_23781AC68()
{
  sub_23781B9A4();
  return sub_237826270();
}

uint64_t sub_23781AC90()
{
  sub_23781B9A4();
  return sub_23782627C();
}

uint64_t CAUAsset.TopDownExteriorVisible.encode(to:)(_QWORD *a1)
{
  return sub_23781B054(a1, &qword_2568118F8, (void (*)(void))sub_23781B9A4);
}

uint64_t CAUAsset.TopDownExteriorVisible.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23781B178(a1, &qword_256811908, (void (*)(void))sub_23781B9A4, a2);
}

uint64_t sub_23781AD10@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return CAUAsset.TopDownExteriorVisible.init(from:)(a1, a2);
}

uint64_t sub_23781AD24(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_23781B2E0(a1, a2, a3, &qword_2568118F8, (void (*)(void))sub_23781B9A4);
}

uint64_t sub_23781AD54()
{
  sub_23781B9E8();
  return sub_237826270();
}

uint64_t sub_23781AD7C()
{
  sub_23781B9E8();
  return sub_23782627C();
}

uint64_t CAUAsset.VehicleLayout.encode(to:)(_QWORD *a1)
{
  return sub_23781B054(a1, &qword_256811910, (void (*)(void))sub_23781B9E8);
}

uint64_t CAUAsset.VehicleLayout.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23781B178(a1, &qword_256811920, (void (*)(void))sub_23781B9E8, a2);
}

uint64_t sub_23781ADFC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return CAUAsset.VehicleLayout.init(from:)(a1, a2);
}

uint64_t sub_23781AE10(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_23781B2E0(a1, a2, a3, &qword_256811910, (void (*)(void))sub_23781B9E8);
}

uint64_t sub_23781AE40()
{
  sub_23781BA2C();
  return sub_237826270();
}

uint64_t sub_23781AE68()
{
  sub_23781BA2C();
  return sub_23782627C();
}

uint64_t CAUAsset.WallpaperOverlay.encode(to:)(_QWORD *a1)
{
  return sub_23781B054(a1, &qword_256811928, (void (*)(void))sub_23781BA2C);
}

uint64_t CAUAsset.WallpaperOverlay.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23781B178(a1, &qword_256811938, (void (*)(void))sub_23781BA2C, a2);
}

uint64_t sub_23781AEE8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return CAUAsset.WallpaperOverlay.init(from:)(a1, a2);
}

uint64_t sub_23781AEFC(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_23781B2E0(a1, a2, a3, &qword_256811928, (void (*)(void))sub_23781BA2C);
}

uint64_t _s13CarAssetUtils8CAUAssetO14AudioBrandLogoV2eeoiySbAE_AEtFZ_0(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_2378261E0();
}

uint64_t sub_23781AF5C()
{
  sub_237826234();
  sub_237826240();
  return sub_23782624C();
}

uint64_t sub_23781AF9C()
{
  sub_237826234();
  sub_237826240();
  return sub_23782624C();
}

uint64_t sub_23781AFD8()
{
  sub_23781BA70();
  return sub_237826270();
}

uint64_t sub_23781B000()
{
  sub_23781BA70();
  return sub_23782627C();
}

uint64_t CAUAsset.PhysicalControlBarsLayout.encode(to:)(_QWORD *a1)
{
  return sub_23781B054(a1, &qword_256811940, (void (*)(void))sub_23781BA70);
}

uint64_t sub_23781B054(_QWORD *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  void (*v11)(void);

  v11 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v11();
  sub_237826264();
  sub_237826198();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t CAUAsset.PhysicalControlBarsLayout.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23781B178(a1, &qword_256811950, (void (*)(void))sub_23781BA70, a2);
}

uint64_t sub_23781B178@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(void)@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;

  v17 = a4;
  v18 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_237826258();
  if (!v4)
  {
    v10 = v17;
    v11 = v18;
    v12 = sub_237826150();
    v14 = v13;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v11);
    *v10 = v12;
    v10[1] = v14;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23781B2A0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return CAUAsset.PhysicalControlBarsLayout.init(from:)(a1, a2);
}

uint64_t sub_23781B2B4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_23781B2E0(a1, a2, a3, &qword_256811940, (void (*)(void))sub_23781BA70);
}

uint64_t sub_23781B2E0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  uint64_t *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  void (*v13)(void);

  v13 = a5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v13();
  sub_237826264();
  sub_237826198();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t _s13CarAssetUtils8CAUAssetO11ClosureMaskV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;

  v2 = *(unsigned __int8 *)(a1 + 1);
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(unsigned __int8 *)(a2 + 1);
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  v8 = CAUVehicleLayoutKey.rawValue.getter();
  v10 = v9;
  if (v8 == CAUVehicleLayoutKey.rawValue.getter() && v10 == v11)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v12 = sub_2378261E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v12 & 1) == 0)
      return result;
  }
  if (v2)
    v14 = 0x6465736F6C63;
  else
    v14 = 1852141679;
  if (v2)
    v15 = 0xE600000000000000;
  else
    v15 = 0xE400000000000000;
  if (v5)
    v16 = 0x6465736F6C63;
  else
    v16 = 1852141679;
  if (v5)
    v17 = 0xE600000000000000;
  else
    v17 = 0xE400000000000000;
  if (v14 == v16 && v15 == v17)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v18 = sub_2378261E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v18 & 1) == 0)
      return result;
  }
  if (v3 == v6 && v4 == v7)
    return 1;
  else
    return sub_2378261E0();
}

unint64_t sub_23781B574()
{
  unint64_t result;

  result = qword_256811838;
  if (!qword_256811838)
  {
    result = MEMORY[0x23B81C18C](&unk_237828BEC, &type metadata for CAUAsset.ClosureMask.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811838);
  }
  return result;
}

unint64_t sub_23781B5B8()
{
  unint64_t result;

  result = qword_256811840;
  if (!qword_256811840)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.ClosureMask.State, &type metadata for CAUAsset.ClosureMask.State);
    atomic_store(result, (unint64_t *)&qword_256811840);
  }
  return result;
}

unint64_t sub_23781B5FC()
{
  unint64_t result;

  result = qword_256811850;
  if (!qword_256811850)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.ClosureMask.State, &type metadata for CAUAsset.ClosureMask.State);
    atomic_store(result, (unint64_t *)&qword_256811850);
  }
  return result;
}

uint64_t _s13CarAssetUtils8CAUAssetO4SeatV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  char v2;
  int v3;
  uint64_t v4;
  char v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t result;
  char v15;
  uint64_t v16;

  v2 = *(_BYTE *)(a1 + 1);
  v3 = *(unsigned __int8 *)(a1 + 2);
  v4 = *(_QWORD *)(a1 + 8);
  v16 = *(_QWORD *)(a1 + 16);
  v5 = *(_BYTE *)(a2 + 1);
  v6 = *(unsigned __int8 *)(a2 + 2);
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = CAUVehicleLayoutKey.rawValue.getter();
  v11 = v10;
  if (v9 == CAUVehicleLayoutKey.rawValue.getter() && v11 == v12)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v13 = sub_2378261E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v13 & 1) == 0)
      return result;
  }
  v15 = sub_23781F1CC(v2, v5);
  result = 0;
  if ((v15 & 1) != 0 && ((v3 ^ v6) & 1) == 0)
  {
    if (v4 == v7 && v16 == v8)
      return 1;
    else
      return sub_2378261E0();
  }
  return result;
}

unint64_t sub_23781B784()
{
  unint64_t result;

  result = qword_256811860;
  if (!qword_256811860)
  {
    result = MEMORY[0x23B81C18C](&unk_237828B9C, &type metadata for CAUAsset.Seat.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811860);
  }
  return result;
}

unint64_t sub_23781B7C8()
{
  unint64_t result;

  result = qword_256811868;
  if (!qword_256811868)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.Seat.State, &type metadata for CAUAsset.Seat.State);
    atomic_store(result, (unint64_t *)&qword_256811868);
  }
  return result;
}

unint64_t sub_23781B80C()
{
  unint64_t result;

  result = qword_256811878;
  if (!qword_256811878)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.Seat.State, &type metadata for CAUAsset.Seat.State);
    atomic_store(result, (unint64_t *)&qword_256811878);
  }
  return result;
}

unint64_t sub_23781B850()
{
  unint64_t result;

  result = qword_256811888;
  if (!qword_256811888)
  {
    result = MEMORY[0x23B81C18C](&unk_237828B4C, &type metadata for CAUAsset.AudioBrandLogo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811888);
  }
  return result;
}

unint64_t sub_23781B894()
{
  unint64_t result;

  result = qword_2568118A0;
  if (!qword_2568118A0)
  {
    result = MEMORY[0x23B81C18C](&unk_237828AFC, &type metadata for CAUAsset.VehicleLogo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568118A0);
  }
  return result;
}

unint64_t sub_23781B8D8()
{
  unint64_t result;

  result = qword_2568118B8;
  if (!qword_2568118B8)
  {
    result = MEMORY[0x23B81C18C](&unk_237828AAC, &type metadata for CAUAsset.Cabin.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568118B8);
  }
  return result;
}

unint64_t sub_23781B91C()
{
  unint64_t result;

  result = qword_2568118D0;
  if (!qword_2568118D0)
  {
    result = MEMORY[0x23B81C18C](&unk_237828A5C, &type metadata for CAUAsset.TopDownInterior.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568118D0);
  }
  return result;
}

unint64_t sub_23781B960()
{
  unint64_t result;

  result = qword_2568118E8;
  if (!qword_2568118E8)
  {
    result = MEMORY[0x23B81C18C](&unk_237828A0C, &type metadata for CAUAsset.TopDownExteriorClosuresOverlay.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568118E8);
  }
  return result;
}

unint64_t sub_23781B9A4()
{
  unint64_t result;

  result = qword_256811900;
  if (!qword_256811900)
  {
    result = MEMORY[0x23B81C18C](&unk_2378289BC, &type metadata for CAUAsset.TopDownExteriorVisible.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811900);
  }
  return result;
}

unint64_t sub_23781B9E8()
{
  unint64_t result;

  result = qword_256811918;
  if (!qword_256811918)
  {
    result = MEMORY[0x23B81C18C](&unk_23782896C, &type metadata for CAUAsset.VehicleLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811918);
  }
  return result;
}

unint64_t sub_23781BA2C()
{
  unint64_t result;

  result = qword_256811930;
  if (!qword_256811930)
  {
    result = MEMORY[0x23B81C18C](&unk_23782891C, &type metadata for CAUAsset.WallpaperOverlay.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811930);
  }
  return result;
}

unint64_t sub_23781BA70()
{
  unint64_t result;

  result = qword_256811948;
  if (!qword_256811948)
  {
    result = MEMORY[0x23B81C18C](&unk_2378288CC, &type metadata for CAUAsset.PhysicalControlBarsLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811948);
  }
  return result;
}

unint64_t sub_23781BAB8()
{
  unint64_t result;

  result = qword_256811958;
  if (!qword_256811958)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.ClosureMask.State, &type metadata for CAUAsset.ClosureMask.State);
    atomic_store(result, (unint64_t *)&qword_256811958);
  }
  return result;
}

unint64_t sub_23781BB00()
{
  unint64_t result;

  result = qword_256811960;
  if (!qword_256811960)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.Seat.State, &type metadata for CAUAsset.Seat.State);
    atomic_store(result, (unint64_t *)&qword_256811960);
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUAsset()
{
  return &type metadata for CAUAsset;
}

uint64_t destroy for CAUAsset.ClosureMask()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s13CarAssetUtils8CAUAssetO11ClosureMaskVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CAUAsset.ClosureMask(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for CAUAsset.ClosureMask(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for CAUAsset.ClosureMask()
{
  return &type metadata for CAUAsset.ClosureMask;
}

ValueMetadata *type metadata accessor for CAUAsset.ClosureMask.State()
{
  return &type metadata for CAUAsset.ClosureMask.State;
}

uint64_t sub_23781BC60(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CAUAsset.Seat(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for CAUAsset.Seat(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_WORD *)a1 = *(_WORD *)a2;
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for CAUAsset.Seat()
{
  return &type metadata for CAUAsset.Seat;
}

ValueMetadata *type metadata accessor for CAUAsset.Seat.State()
{
  return &type metadata for CAUAsset.Seat.State;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for CAUAsset.AudioBrandLogo()
{
  return &type metadata for CAUAsset.AudioBrandLogo;
}

_QWORD *initializeBufferWithCopyOfBuffer for CAUAsset.VehicleLogo(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for CAUAsset.VehicleLogo()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithTake for CAUAsset.VehicleLogo(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for CAUAsset.VehicleLogo()
{
  return &type metadata for CAUAsset.VehicleLogo;
}

ValueMetadata *type metadata accessor for CAUAsset.Cabin()
{
  return &type metadata for CAUAsset.Cabin;
}

uint64_t _s13CarAssetUtils8CAUAssetO5CabinVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s13CarAssetUtils8CAUAssetO5CabinVwca_0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13CarAssetUtils8CAUAssetO5CabinVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13CarAssetUtils8CAUAssetO11ClosureMaskVwet_0(uint64_t a1, int a2)
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

uint64_t sub_23781BF0C(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CAUAsset.TopDownInterior()
{
  return &type metadata for CAUAsset.TopDownInterior;
}

ValueMetadata *type metadata accessor for CAUAsset.TopDownExteriorClosuresOverlay()
{
  return &type metadata for CAUAsset.TopDownExteriorClosuresOverlay;
}

ValueMetadata *type metadata accessor for CAUAsset.TopDownExteriorVisible()
{
  return &type metadata for CAUAsset.TopDownExteriorVisible;
}

ValueMetadata *type metadata accessor for CAUAsset.VehicleLayout()
{
  return &type metadata for CAUAsset.VehicleLayout;
}

ValueMetadata *type metadata accessor for CAUAsset.WallpaperOverlay()
{
  return &type metadata for CAUAsset.WallpaperOverlay;
}

_QWORD *_s13CarAssetUtils8CAUAssetO14AudioBrandLogoVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13CarAssetUtils8CAUAssetO14AudioBrandLogoVwet_0(uint64_t a1, int a2)
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

uint64_t sub_23781C024(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CAUAsset.PhysicalControlBarsLayout()
{
  return &type metadata for CAUAsset.PhysicalControlBarsLayout;
}

uint64_t dispatch thunk of CAUFileName.filename.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_23781C084()
{
  return 0;
}

ValueMetadata *type metadata accessor for CAUAsset.PhysicalControlBarsLayout.CodingKeys()
{
  return &type metadata for CAUAsset.PhysicalControlBarsLayout.CodingKeys;
}

ValueMetadata *type metadata accessor for CAUAsset.WallpaperOverlay.CodingKeys()
{
  return &type metadata for CAUAsset.WallpaperOverlay.CodingKeys;
}

ValueMetadata *type metadata accessor for CAUAsset.VehicleLayout.CodingKeys()
{
  return &type metadata for CAUAsset.VehicleLayout.CodingKeys;
}

ValueMetadata *type metadata accessor for CAUAsset.TopDownExteriorVisible.CodingKeys()
{
  return &type metadata for CAUAsset.TopDownExteriorVisible.CodingKeys;
}

ValueMetadata *type metadata accessor for CAUAsset.TopDownExteriorClosuresOverlay.CodingKeys()
{
  return &type metadata for CAUAsset.TopDownExteriorClosuresOverlay.CodingKeys;
}

ValueMetadata *type metadata accessor for CAUAsset.TopDownInterior.CodingKeys()
{
  return &type metadata for CAUAsset.TopDownInterior.CodingKeys;
}

uint64_t _s13CarAssetUtils8CAUAssetO11ClosureMaskV5StateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23781C138 + 4 * byte_237827749[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23781C16C + 4 * byte_237827744[v4]))();
}

uint64_t sub_23781C16C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23781C174(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23781C17CLL);
  return result;
}

uint64_t sub_23781C188(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23781C190);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23781C194(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23781C19C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CAUAsset.Cabin.CodingKeys()
{
  return &type metadata for CAUAsset.Cabin.CodingKeys;
}

ValueMetadata *type metadata accessor for CAUAsset.VehicleLogo.CodingKeys()
{
  return &type metadata for CAUAsset.VehicleLogo.CodingKeys;
}

uint64_t _s13CarAssetUtils8CAUAssetO25PhysicalControlBarsLayoutV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s13CarAssetUtils8CAUAssetO25PhysicalControlBarsLayoutV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23781C258 + 4 * byte_23782774E[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23781C278 + 4 * byte_237827753[v4]))();
}

_BYTE *sub_23781C258(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23781C278(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23781C280(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23781C288(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23781C290(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23781C298(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CAUAsset.AudioBrandLogo.CodingKeys()
{
  return &type metadata for CAUAsset.AudioBrandLogo.CodingKeys;
}

uint64_t _s13CarAssetUtils8CAUAssetO4SeatV5StateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23781C300 + 4 * byte_23782775D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23781C334 + 4 * byte_237827758[v4]))();
}

uint64_t sub_23781C334(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23781C33C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23781C344);
  return result;
}

uint64_t sub_23781C350(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23781C358);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23781C35C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23781C364(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CAUAsset.Seat.CodingKeys()
{
  return &type metadata for CAUAsset.Seat.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for CAUAsset.ClosureMask.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23781C3CC + 4 * byte_237827767[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23781C400 + 4 * byte_237827762[v4]))();
}

uint64_t sub_23781C400(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23781C408(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23781C410);
  return result;
}

uint64_t sub_23781C41C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23781C424);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23781C428(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23781C430(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CAUAsset.ClosureMask.CodingKeys()
{
  return &type metadata for CAUAsset.ClosureMask.CodingKeys;
}

unint64_t sub_23781C450()
{
  unint64_t result;

  result = qword_256811968;
  if (!qword_256811968)
  {
    result = MEMORY[0x23B81C18C](&unk_237828174, &type metadata for CAUAsset.ClosureMask.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811968);
  }
  return result;
}

unint64_t sub_23781C498()
{
  unint64_t result;

  result = qword_256811970;
  if (!qword_256811970)
  {
    result = MEMORY[0x23B81C18C](&unk_23782822C, &type metadata for CAUAsset.Seat.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811970);
  }
  return result;
}

unint64_t sub_23781C4E0()
{
  unint64_t result;

  result = qword_256811978;
  if (!qword_256811978)
  {
    result = MEMORY[0x23B81C18C](&unk_2378282E4, &type metadata for CAUAsset.AudioBrandLogo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811978);
  }
  return result;
}

unint64_t sub_23781C528()
{
  unint64_t result;

  result = qword_256811980;
  if (!qword_256811980)
  {
    result = MEMORY[0x23B81C18C](&unk_23782839C, &type metadata for CAUAsset.VehicleLogo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811980);
  }
  return result;
}

unint64_t sub_23781C570()
{
  unint64_t result;

  result = qword_256811988;
  if (!qword_256811988)
  {
    result = MEMORY[0x23B81C18C](&unk_237828454, &type metadata for CAUAsset.Cabin.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811988);
  }
  return result;
}

unint64_t sub_23781C5B8()
{
  unint64_t result;

  result = qword_256811990;
  if (!qword_256811990)
  {
    result = MEMORY[0x23B81C18C](&unk_23782850C, &type metadata for CAUAsset.TopDownInterior.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811990);
  }
  return result;
}

unint64_t sub_23781C600()
{
  unint64_t result;

  result = qword_256811998;
  if (!qword_256811998)
  {
    result = MEMORY[0x23B81C18C](&unk_2378285C4, &type metadata for CAUAsset.TopDownExteriorClosuresOverlay.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811998);
  }
  return result;
}

unint64_t sub_23781C648()
{
  unint64_t result;

  result = qword_2568119A0;
  if (!qword_2568119A0)
  {
    result = MEMORY[0x23B81C18C](&unk_23782867C, &type metadata for CAUAsset.TopDownExteriorVisible.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568119A0);
  }
  return result;
}

unint64_t sub_23781C690()
{
  unint64_t result;

  result = qword_2568119A8;
  if (!qword_2568119A8)
  {
    result = MEMORY[0x23B81C18C](&unk_237828734, &type metadata for CAUAsset.VehicleLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568119A8);
  }
  return result;
}

unint64_t sub_23781C6D8()
{
  unint64_t result;

  result = qword_2568119B0;
  if (!qword_2568119B0)
  {
    result = MEMORY[0x23B81C18C](&unk_2378287EC, &type metadata for CAUAsset.WallpaperOverlay.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568119B0);
  }
  return result;
}

unint64_t sub_23781C720()
{
  unint64_t result;

  result = qword_2568119B8;
  if (!qword_2568119B8)
  {
    result = MEMORY[0x23B81C18C](&unk_2378288A4, &type metadata for CAUAsset.PhysicalControlBarsLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568119B8);
  }
  return result;
}

unint64_t sub_23781C768()
{
  unint64_t result;

  result = qword_2568119C0;
  if (!qword_2568119C0)
  {
    result = MEMORY[0x23B81C18C](&unk_237828814, &type metadata for CAUAsset.PhysicalControlBarsLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568119C0);
  }
  return result;
}

unint64_t sub_23781C7B0()
{
  unint64_t result;

  result = qword_2568119C8;
  if (!qword_2568119C8)
  {
    result = MEMORY[0x23B81C18C](&unk_23782883C, &type metadata for CAUAsset.PhysicalControlBarsLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568119C8);
  }
  return result;
}

unint64_t sub_23781C7F8()
{
  unint64_t result;

  result = qword_2568119D0;
  if (!qword_2568119D0)
  {
    result = MEMORY[0x23B81C18C](&unk_23782875C, &type metadata for CAUAsset.WallpaperOverlay.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568119D0);
  }
  return result;
}

unint64_t sub_23781C840()
{
  unint64_t result;

  result = qword_2568119D8;
  if (!qword_2568119D8)
  {
    result = MEMORY[0x23B81C18C](&unk_237828784, &type metadata for CAUAsset.WallpaperOverlay.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568119D8);
  }
  return result;
}

unint64_t sub_23781C888()
{
  unint64_t result;

  result = qword_2568119E0;
  if (!qword_2568119E0)
  {
    result = MEMORY[0x23B81C18C](&unk_2378286A4, &type metadata for CAUAsset.VehicleLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568119E0);
  }
  return result;
}

unint64_t sub_23781C8D0()
{
  unint64_t result;

  result = qword_2568119E8;
  if (!qword_2568119E8)
  {
    result = MEMORY[0x23B81C18C](&unk_2378286CC, &type metadata for CAUAsset.VehicleLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568119E8);
  }
  return result;
}

unint64_t sub_23781C918()
{
  unint64_t result;

  result = qword_2568119F0;
  if (!qword_2568119F0)
  {
    result = MEMORY[0x23B81C18C](&unk_2378285EC, &type metadata for CAUAsset.TopDownExteriorVisible.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568119F0);
  }
  return result;
}

unint64_t sub_23781C960()
{
  unint64_t result;

  result = qword_2568119F8;
  if (!qword_2568119F8)
  {
    result = MEMORY[0x23B81C18C](&unk_237828614, &type metadata for CAUAsset.TopDownExteriorVisible.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568119F8);
  }
  return result;
}

unint64_t sub_23781C9A8()
{
  unint64_t result;

  result = qword_256811A00;
  if (!qword_256811A00)
  {
    result = MEMORY[0x23B81C18C](&unk_237828534, &type metadata for CAUAsset.TopDownExteriorClosuresOverlay.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811A00);
  }
  return result;
}

unint64_t sub_23781C9F0()
{
  unint64_t result;

  result = qword_256811A08;
  if (!qword_256811A08)
  {
    result = MEMORY[0x23B81C18C](&unk_23782855C, &type metadata for CAUAsset.TopDownExteriorClosuresOverlay.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811A08);
  }
  return result;
}

unint64_t sub_23781CA38()
{
  unint64_t result;

  result = qword_256811A10;
  if (!qword_256811A10)
  {
    result = MEMORY[0x23B81C18C](&unk_23782847C, &type metadata for CAUAsset.TopDownInterior.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811A10);
  }
  return result;
}

unint64_t sub_23781CA80()
{
  unint64_t result;

  result = qword_256811A18;
  if (!qword_256811A18)
  {
    result = MEMORY[0x23B81C18C](&unk_2378284A4, &type metadata for CAUAsset.TopDownInterior.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811A18);
  }
  return result;
}

unint64_t sub_23781CAC8()
{
  unint64_t result;

  result = qword_256811A20;
  if (!qword_256811A20)
  {
    result = MEMORY[0x23B81C18C](&unk_2378283C4, &type metadata for CAUAsset.Cabin.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811A20);
  }
  return result;
}

unint64_t sub_23781CB10()
{
  unint64_t result;

  result = qword_256811A28;
  if (!qword_256811A28)
  {
    result = MEMORY[0x23B81C18C](&unk_2378283EC, &type metadata for CAUAsset.Cabin.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811A28);
  }
  return result;
}

unint64_t sub_23781CB58()
{
  unint64_t result;

  result = qword_256811A30;
  if (!qword_256811A30)
  {
    result = MEMORY[0x23B81C18C](&unk_23782830C, &type metadata for CAUAsset.VehicleLogo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811A30);
  }
  return result;
}

unint64_t sub_23781CBA0()
{
  unint64_t result;

  result = qword_256811A38;
  if (!qword_256811A38)
  {
    result = MEMORY[0x23B81C18C](&unk_237828334, &type metadata for CAUAsset.VehicleLogo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811A38);
  }
  return result;
}

unint64_t sub_23781CBE8()
{
  unint64_t result;

  result = qword_256811A40;
  if (!qword_256811A40)
  {
    result = MEMORY[0x23B81C18C](&unk_237828254, &type metadata for CAUAsset.AudioBrandLogo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811A40);
  }
  return result;
}

unint64_t sub_23781CC30()
{
  unint64_t result;

  result = qword_256811A48;
  if (!qword_256811A48)
  {
    result = MEMORY[0x23B81C18C](&unk_23782827C, &type metadata for CAUAsset.AudioBrandLogo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811A48);
  }
  return result;
}

unint64_t sub_23781CC78()
{
  unint64_t result;

  result = qword_256811A50;
  if (!qword_256811A50)
  {
    result = MEMORY[0x23B81C18C](&unk_23782819C, &type metadata for CAUAsset.Seat.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811A50);
  }
  return result;
}

unint64_t sub_23781CCC0()
{
  unint64_t result;

  result = qword_256811A58;
  if (!qword_256811A58)
  {
    result = MEMORY[0x23B81C18C](&unk_2378281C4, &type metadata for CAUAsset.Seat.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811A58);
  }
  return result;
}

unint64_t sub_23781CD08()
{
  unint64_t result;

  result = qword_256811A60;
  if (!qword_256811A60)
  {
    result = MEMORY[0x23B81C18C](&unk_2378280E4, &type metadata for CAUAsset.ClosureMask.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811A60);
  }
  return result;
}

unint64_t sub_23781CD50()
{
  unint64_t result;

  result = qword_256811A68;
  if (!qword_256811A68)
  {
    result = MEMORY[0x23B81C18C](&unk_23782810C, &type metadata for CAUAsset.ClosureMask.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811A68);
  }
  return result;
}

uint64_t sub_23781CD94(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x800000023782A2B0 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656D616E656C6966 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_2378261E0();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23781CED4(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x800000023782A2B0 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4448527369 && a2 == 0xE500000000000000 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656D616E656C6966 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v5 = sub_2378261E0();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23781D068()
{
  return 0x656D616E656C6966;
}

uint64_t sub_23781D080(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x4448527369 && a2 == 0xE500000000000000;
  if (v3 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D616E656C6966 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2378261E0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23781D160(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x656D616E656C6966 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_2378261E0();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

unint64_t sub_23781D1E4()
{
  unint64_t result;

  result = qword_256811A70;
  if (!qword_256811A70)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.Seat.State, &type metadata for CAUAsset.Seat.State);
    atomic_store(result, (unint64_t *)&qword_256811A70);
  }
  return result;
}

unint64_t sub_23781D228()
{
  unint64_t result;

  result = qword_256811A78;
  if (!qword_256811A78)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.ClosureMask.State, &type metadata for CAUAsset.ClosureMask.State);
    atomic_store(result, (unint64_t *)&qword_256811A78);
  }
  return result;
}

void sub_23781D2DC(char a1)
{
  sub_237826234();
  __asm { BR              X10 }
}

uint64_t sub_23781D330()
{
  sub_237825FC4();
  swift_bridgeObjectRelease();
  return sub_23782624C();
}

uint64_t sub_23781D3B8()
{
  sub_237826234();
  sub_237825FC4();
  swift_bridgeObjectRelease();
  return sub_23782624C();
}

uint64_t sub_23781D42C()
{
  sub_237826234();
  sub_237825FC4();
  swift_bridgeObjectRelease();
  return sub_23782624C();
}

uint64_t sub_23781D494()
{
  sub_237826234();
  sub_237825FC4();
  swift_bridgeObjectRelease();
  return sub_23782624C();
}

void sub_23781D4FC(uint64_t a1, char a2)
{
  sub_237826234();
  __asm { BR              X10 }
}

uint64_t sub_23781D54C()
{
  sub_237825FC4();
  swift_bridgeObjectRelease();
  return sub_23782624C();
}

uint64_t sub_23781D5D4()
{
  sub_237826234();
  sub_237825FC4();
  swift_bridgeObjectRelease();
  return sub_23782624C();
}

uint64_t sub_23781D638()
{
  sub_237826234();
  sub_237825FC4();
  swift_bridgeObjectRelease();
  return sub_23782624C();
}

uint64_t sub_23781D6A8()
{
  sub_237826234();
  sub_237825FC4();
  swift_bridgeObjectRelease();
  return sub_23782624C();
}

void CAUPhysicalControlBarsButtonLayoutInfo.edge.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t CAUPhysicalControlBarsButtonLayoutInfo.startingPoint.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 4);
}

uint64_t CAUPhysicalControlBarsButtonLayoutInfo.length.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 8);
}

_BYTE *CAUPhysicalControlBarsButtonLayoutInfo.init(edge:startingPoint:length:)@<X0>(_BYTE *result@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  *(_BYTE *)a4 = *result;
  *(_DWORD *)(a4 + 4) = a2;
  *(_DWORD *)(a4 + 8) = a3;
  return result;
}

uint64_t sub_23781D738(char a1)
{
  return *(_QWORD *)&aEdge_0[8 * a1];
}

uint64_t sub_23781D758()
{
  char *v0;

  return sub_23781D738(*v0);
}

uint64_t sub_23781D760@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23781E1B0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23781D784()
{
  sub_23781D940();
  return sub_237826270();
}

uint64_t sub_23781D7AC()
{
  sub_23781D940();
  return sub_23782627C();
}

uint64_t CAUPhysicalControlBarsButtonLayoutInfo.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  _DWORD v10[7];
  char v11;
  char v12;
  char v13;
  char v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256811A80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v10[6] = *((_DWORD *)v1 + 1);
  v10[3] = *((_DWORD *)v1 + 2);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23781D940();
  sub_237826264();
  v14 = v8;
  v13 = 0;
  sub_23781D984();
  sub_2378261BC();
  if (!v2)
  {
    v12 = 1;
    sub_2378261C8();
    v11 = 2;
    sub_2378261C8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23781D940()
{
  unint64_t result;

  result = qword_256811A88;
  if (!qword_256811A88)
  {
    result = MEMORY[0x23B81C18C](&unk_237828F64, &type metadata for CAUPhysicalControlBarsButtonLayoutInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811A88);
  }
  return result;
}

unint64_t sub_23781D984()
{
  unint64_t result;

  result = qword_256811A90;
  if (!qword_256811A90)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUEdge, &type metadata for CAUEdge);
    atomic_store(result, (unint64_t *)&qword_256811A90);
  }
  return result;
}

uint64_t CAUPhysicalControlBarsButtonLayoutInfo.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  int v11;
  int v12;
  uint64_t v13;
  char v14;
  char v15;
  char v16;
  char v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256811A98);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23781D940();
  sub_237826258();
  if (!v2)
  {
    v16 = 0;
    sub_23781DB54();
    sub_237826174();
    v9 = v17;
    v15 = 1;
    v11 = sub_237826180();
    v14 = 2;
    v12 = sub_237826180();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_BYTE *)a2 = v9;
    *(_DWORD *)(a2 + 4) = v11;
    *(_DWORD *)(a2 + 8) = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_23781DB54()
{
  unint64_t result;

  result = qword_256811AA0;
  if (!qword_256811AA0)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUEdge, &type metadata for CAUEdge);
    atomic_store(result, (unint64_t *)&qword_256811AA0);
  }
  return result;
}

uint64_t sub_23781DB98@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CAUPhysicalControlBarsButtonLayoutInfo.init(from:)(a1, a2);
}

uint64_t sub_23781DBAC(_QWORD *a1)
{
  return CAUPhysicalControlBarsButtonLayoutInfo.encode(to:)(a1);
}

CarAssetUtils::CAUEdge_optional __swiftcall CAUEdge.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  CarAssetUtils::CAUEdge_optional result;
  char v5;

  v2 = v1;
  v3 = sub_237826138();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static CAUEdge.allCases.getter()
{
  return &unk_25095DA18;
}

uint64_t CAUEdge.rawValue.getter()
{
  char *v0;

  return qword_237829028[*v0];
}

uint64_t sub_23781DC48(char *a1, char *a2)
{
  return sub_23781F2E4(*a1, *a2);
}

unint64_t sub_23781DC58()
{
  unint64_t result;

  result = qword_256811AA8;
  if (!qword_256811AA8)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUEdge, &type metadata for CAUEdge);
    atomic_store(result, (unint64_t *)&qword_256811AA8);
  }
  return result;
}

uint64_t sub_23781DC9C()
{
  return sub_23781D494();
}

uint64_t sub_23781DCA4()
{
  return sub_23781E474();
}

uint64_t sub_23781DCAC()
{
  return sub_23781D5D4();
}

CarAssetUtils::CAUEdge_optional sub_23781DCB4(Swift::String *a1)
{
  return CAUEdge.init(rawValue:)(*a1);
}

uint64_t sub_23781DCC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CAUEdge.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23781DCE4()
{
  sub_23781E2F4();
  return sub_237826018();
}

uint64_t sub_23781DD40()
{
  sub_23781E2F4();
  return sub_23782600C();
}

uint64_t sub_23781DD8C()
{
  sub_23781E2F4();
  return sub_237826024();
}

uint64_t sub_23781DDCC()
{
  sub_23781E2F4();
  return sub_237826030();
}

unint64_t sub_23781DE38()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256811AB0;
  if (!qword_256811AB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811AB8);
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_256811AB0);
  }
  return result;
}

void sub_23781DE84(_QWORD *a1@<X8>)
{
  *a1 = &unk_25095DA40;
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CAUPhysicalControlBarsButtonLayoutInfo(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && a1[12])
    return (*(_DWORD *)a1 + 253);
  v3 = *a1;
  v4 = v3 >= 4;
  v5 = v3 - 4;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for CAUPhysicalControlBarsButtonLayoutInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_DWORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 12) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 12) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 3;
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUPhysicalControlBarsButtonLayoutInfo()
{
  return &type metadata for CAUPhysicalControlBarsButtonLayoutInfo;
}

uint64_t storeEnumTagSinglePayload for CAUEdge(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23781DF8C + 4 * byte_237828C8F[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23781DFC0 + 4 * byte_237828C8A[v4]))();
}

uint64_t sub_23781DFC0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23781DFC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23781DFD0);
  return result;
}

uint64_t sub_23781DFDC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23781DFE4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23781DFE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23781DFF0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CAUEdge()
{
  return &type metadata for CAUEdge;
}

uint64_t storeEnumTagSinglePayload for CAUPhysicalControlBarsButtonLayoutInfo.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23781E058 + 4 * byte_237828C99[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23781E08C + 4 * byte_237828C94[v4]))();
}

uint64_t sub_23781E08C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23781E094(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23781E09CLL);
  return result;
}

uint64_t sub_23781E0A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23781E0B0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23781E0B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23781E0BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CAUPhysicalControlBarsButtonLayoutInfo.CodingKeys()
{
  return &type metadata for CAUPhysicalControlBarsButtonLayoutInfo.CodingKeys;
}

unint64_t sub_23781E0DC()
{
  unint64_t result;

  result = qword_256811AC0;
  if (!qword_256811AC0)
  {
    result = MEMORY[0x23B81C18C](&unk_237828F3C, &type metadata for CAUPhysicalControlBarsButtonLayoutInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811AC0);
  }
  return result;
}

unint64_t sub_23781E124()
{
  unint64_t result;

  result = qword_256811AC8;
  if (!qword_256811AC8)
  {
    result = MEMORY[0x23B81C18C](&unk_237828EAC, &type metadata for CAUPhysicalControlBarsButtonLayoutInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811AC8);
  }
  return result;
}

unint64_t sub_23781E16C()
{
  unint64_t result;

  result = qword_256811AD0;
  if (!qword_256811AD0)
  {
    result = MEMORY[0x23B81C18C](&unk_237828ED4, &type metadata for CAUPhysicalControlBarsButtonLayoutInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811AD0);
  }
  return result;
}

uint64_t sub_23781E1B0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1701274725 && a2 == 0xE400000000000000;
  if (v3 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E697472617473 && a2 == 0xED0000746E696F50 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6874676E656CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_2378261E0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

unint64_t sub_23781E2F4()
{
  unint64_t result;

  result = qword_256811AD8;
  if (!qword_256811AD8)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUEdge, &type metadata for CAUEdge);
    atomic_store(result, (unint64_t *)&qword_256811AD8);
  }
  return result;
}

uint64_t JSONEncoder.encode<A>(_:toFile:)()
{
  uint64_t v0;
  uint64_t result;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;

  result = sub_237825E44();
  if (!v0)
  {
    v3 = result;
    v4 = v2;
    sub_237825EEC();
    return sub_23781E3A4(v3, v4);
  }
  return result;
}

uint64_t sub_23781E3A4(uint64_t a1, unint64_t a2)
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

uint64_t sub_23781E3E8()
{
  sub_237825FC4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23781E428()
{
  sub_237825FC4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23781E474()
{
  sub_237825FC4();
  return swift_bridgeObjectRelease();
}

void sub_23781E4B4(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23781E4F8()
{
  sub_237825FC4();
  return swift_bridgeObjectRelease();
}

void sub_23781E56C(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23781E5B0()
{
  sub_237825FC4();
  return swift_bridgeObjectRelease();
}

CarAssetUtils::CAUVehicleTrait_optional __swiftcall CAUVehicleTrait.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  CarAssetUtils::CAUVehicleTrait_optional result;
  char v5;

  v2 = v1;
  v3 = sub_237826138();
  result.value = swift_bridgeObjectRelease();
  v5 = 9;
  if (v3 < 9)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t CAUVehicleTrait.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23781E738 + 4 * byte_237829076[*v0]))(0xD000000000000010, 0x80000002378297B0);
}

uint64_t sub_23781E738()
{
  return 0x726F697265747865;
}

uint64_t sub_23781E774()
{
  return 0x726F697265747865;
}

uint64_t sub_23781E7B0()
{
  return 0x6172426F69647561;
}

uint64_t sub_23781E7D4()
{
  return 0x4C656C6369686576;
}

uint64_t sub_23781E808(uint64_t a1)
{
  return a1 + 9;
}

void sub_23781E820(char *a1)
{
  sub_23781F4F0(*a1);
}

unint64_t sub_23781E830()
{
  unint64_t result;

  result = qword_256811AE0;
  if (!qword_256811AE0)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUVehicleTrait, &type metadata for CAUVehicleTrait);
    atomic_store(result, (unint64_t *)&qword_256811AE0);
  }
  return result;
}

uint64_t sub_23781E874()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_237826234();
  sub_23781E56C((uint64_t)v3, v1);
  return sub_23782624C();
}

void sub_23781E8B8(uint64_t a1)
{
  char *v1;

  sub_23781E56C(a1, *v1);
}

uint64_t sub_23781E8C0()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_237826234();
  sub_23781E56C((uint64_t)v3, v1);
  return sub_23782624C();
}

CarAssetUtils::CAUVehicleTrait_optional sub_23781E900(Swift::String *a1)
{
  return CAUVehicleTrait.init(rawValue:)(*a1);
}

uint64_t sub_23781E90C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CAUVehicleTrait.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for CAUVehicleTrait(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CAUVehicleTrait(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23781EA0C + 4 * byte_237829084[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_23781EA40 + 4 * byte_23782907F[v4]))();
}

uint64_t sub_23781EA40(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23781EA48(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23781EA50);
  return result;
}

uint64_t sub_23781EA5C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23781EA64);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_23781EA68(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23781EA70(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CAUVehicleTrait()
{
  return &type metadata for CAUVehicleTrait;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CAUResource(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 65282 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65282 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65282;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65282;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65282;
  }
LABEL_17:
  v6 = ((*a1 >> 14) | (4 * (HIBYTE(*a1) & 0x3C | (*a1 >> 6)))) ^ 0xFF;
  if (v6 >= 0xFD)
    v6 = -1;
  return v6 + 1;
}

uint64_t storeEnumTagSinglePayload for CAUResource(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65282 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65282 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_23781EB90 + 4 * byte_23782908E[v4]))();
  *a1 = a2 - 254;
  return ((uint64_t (*)(void))((char *)sub_23781EBC4 + 4 * byte_237829089[v4]))();
}

uint64_t sub_23781EBC4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_23781EBCC(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x23781EBD4);
  return result;
}

uint64_t sub_23781EBF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x23781EBFCLL);
  *(_WORD *)result = (((-(__int16)a2 & 0xF0) << 6) - ((_WORD)a2 << 14)) & 0xFF3F | (((-a2 >> 2) & 3) << 6);
  return result;
}

uint64_t sub_23781EC00(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_23781EC08(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_23781EC14(unsigned __int16 *a1)
{
  unsigned int v1;
  int v2;
  unsigned int v3;
  unsigned int v4;

  v1 = *a1;
  v2 = (__int16)v1;
  v3 = v1 >> 14;
  v4 = (v1 & 0x3F | (((v1 >> 8) & 3) << 6)) + 2;
  if (v2 >= 0)
    return v3;
  else
    return v4;
}

_WORD *sub_23781EC3C(_WORD *result)
{
  *result &= 0x3FFFu;
  return result;
}

_WORD *sub_23781EC4C(_WORD *result, unsigned int a2)
{
  if (a2 < 2)
    *result = *result & 0x33F | ((_WORD)a2 << 14);
  else
    *result = (4 * (a2 - 2)) & 0x300 | (a2 - 2) & 0x3F | 0x8000;
  return result;
}

ValueMetadata *type metadata accessor for CAUResource()
{
  return &type metadata for CAUResource;
}

BOOL static CAUError.AssetLibrary.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CAUError.AssetLibrary.hash(into:)()
{
  return sub_237826240();
}

uint64_t CAUError.AssetLibrary.hashValue.getter()
{
  sub_237826234();
  sub_237826240();
  return sub_23782624C();
}

unint64_t sub_23781ED1C()
{
  unint64_t result;

  result = qword_256811AE8;
  if (!qword_256811AE8)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUError.AssetLibrary, &type metadata for CAUError.AssetLibrary);
    atomic_store(result, (unint64_t *)&qword_256811AE8);
  }
  return result;
}

unint64_t sub_23781ED88()
{
  unint64_t result;

  result = qword_256811AF0;
  if (!qword_256811AF0)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUError, &type metadata for CAUError);
    atomic_store(result, (unint64_t *)&qword_256811AF0);
  }
  return result;
}

id sub_23781EDCC(id result, id a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 1:
    case 3:
      result = (id)swift_bridgeObjectRetain();
      break;
    case 2:
      result = result;
      break;
    case 4:
      result = a2;
      break;
    default:
      return result;
  }
  return result;
}

void destroy for CAUError(uint64_t a1)
{
  sub_23781EE28(*(void **)a1, *(id *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

void sub_23781EE28(void *a1, id a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 1:
    case 3:
      swift_bridgeObjectRelease();
      break;
    case 2:

      break;
    case 4:

      break;
    default:
      return;
  }
}

uint64_t initializeWithCopy for CAUError(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23781EDCC(*(id *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for CAUError(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23781EDCC(*(id *)a2, v4, v5, v6);
  v7 = *(void **)a1;
  v8 = *(void **)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_23781EE28(v7, v8, v9, v10);
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

uint64_t assignWithTake for CAUError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_23781EE28(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for CAUError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 251);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 5)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CAUError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 251;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_23781F028(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 4u)
    return *(unsigned __int8 *)(a1 + 24);
  else
    return (*(_DWORD *)a1 + 5);
}

uint64_t sub_23781F040(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = a2 - 5;
  if (a2 >= 5)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    LOBYTE(a2) = 5;
    *(_QWORD *)result = v2;
  }
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CAUError()
{
  return &type metadata for CAUError;
}

uint64_t storeEnumTagSinglePayload for CAUError.AssetLibrary(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23781F0B8 + 4 * byte_23782923D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23781F0EC + 4 * byte_237829238[v4]))();
}

uint64_t sub_23781F0EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23781F0F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23781F0FCLL);
  return result;
}

uint64_t sub_23781F108(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23781F110);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23781F114(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23781F11C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CAUError.AssetLibrary()
{
  return &type metadata for CAUError.AssetLibrary;
}

uint64_t sub_23781F138()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = CAUVehicleLayoutKey.rawValue.getter();
  v2 = v1;
  if (v0 == CAUVehicleLayoutKey.rawValue.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_2378261E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23781F1CC(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aSelectedheaton_2[8 * a1] == *(_QWORD *)&aSelectedheaton_2[8 * a2]
    && qword_237829650[a1] == qword_237829650[a2])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_2378261E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_23781F250(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x6465736F6C63;
  else
    v3 = 1852141679;
  if (v2)
    v4 = 0xE400000000000000;
  else
    v4 = 0xE600000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x6465736F6C63;
  else
    v5 = 1852141679;
  if ((a2 & 1) != 0)
    v6 = 0xE600000000000000;
  else
    v6 = 0xE400000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_2378261E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_23781F2E4(char a1, char a2)
{
  char v3;

  if (qword_2378295F0[a1] == qword_2378295F0[a2] && qword_237829610[a1] == qword_237829610[a2])
    v3 = 1;
  else
    v3 = sub_2378261E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_23781F368(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_23781F3B4(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23781F430 + 4 * byte_237829405[a2]))(0x74617265706D6574);
}

uint64_t sub_23781F430(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x74617265706D6574 && v1 == 0xEB00000000657275)
    v2 = 1;
  else
    v2 = sub_2378261E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_23781F4F0(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_23781F53C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23781F650 + 4 * byte_237829413[a2]))(0x726F697265747865);
}

uint64_t sub_23781F650(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x726F697265747865 && v1 == 0xED0000656C797453)
    v2 = 1;
  else
    v2 = sub_2378261E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

__n128 CAUManifest.init(cabin:topDownInterior:topDownExteriorClosuresOverlay:topDownExterior:seats:closures:audioBrandLogo:vehicleLogo:vehicleLayouts:wallpaperOverlays:physicalControlBarsLayouts:)@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, unint64_t a8@<X7>, __n128 *a9@<X8>, __n128 a10, unint64_t a11)
{
  __n128 result;

  result = a10;
  a9->n128_u64[0] = a1;
  a9->n128_u64[1] = a2;
  a9[1].n128_u64[0] = a3;
  a9[1].n128_u64[1] = a4;
  a9[2].n128_u64[0] = a5;
  a9[2].n128_u64[1] = a6;
  a9[3].n128_u64[0] = a7;
  a9[3].n128_u64[1] = a8;
  a9[4] = a10;
  a9[5].n128_u64[0] = a11;
  return result;
}

uint64_t sub_23781F7D4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, unsigned __int8 *a4@<X3>, char *a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int16 *i;
  int v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  char v48;

  v8 = *(_QWORD *)(v6 + 32);
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_31;
  v11 = result;
  v12 = *a4;
  v13 = *a5;
  swift_bridgeObjectRetain();
  v14 = sub_237811AEC(v11, a2);
  if ((v15 & 1) == 0)
  {
    result = swift_bridgeObjectRelease();
LABEL_31:
    *a6 = 0;
    a6[1] = 0;
    a6[2] = 0;
    return result;
  }
  v44 = a3;
  v16 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v14);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(v16 + 16);
  v45 = a6;
  if (v17)
  {
    v46 = v13;
    v18 = MEMORY[0x24BEE4AF8];
    v19 = (char *)(v16 + 32);
    while (1)
    {
      v20 = *v19;
      v21 = v19[1];
      v48 = v19[2];
      v22 = *((_QWORD *)v19 + 2);
      v47 = *((_QWORD *)v19 + 1);
      v23 = v12;
      v24 = CAUVehicleLayoutKey.rawValue.getter();
      v26 = v25;
      if (v24 == CAUVehicleLayoutKey.rawValue.getter() && v26 == v27)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v28 = sub_2378261E0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v28 & 1) == 0)
          goto LABEL_5;
      }
      if (*(_QWORD *)&aSelectedheaton_2[8 * v21] == *(_QWORD *)&aSelectedheaton_2[8 * v46]
        && qword_237829650[v21] == qword_237829650[v46])
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_18:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_237822CF0(0, *(_QWORD *)(v18 + 16) + 1, 1);
        v32 = *(_QWORD *)(v18 + 16);
        v31 = *(_QWORD *)(v18 + 24);
        if (v32 >= v31 >> 1)
          sub_237822CF0(v31 > 1, v32 + 1, 1);
        *(_QWORD *)(v18 + 16) = v32 + 1;
        v33 = v18 + 24 * v32;
        *(_BYTE *)(v33 + 32) = v20;
        *(_BYTE *)(v33 + 33) = v21;
        *(_BYTE *)(v33 + 34) = v48;
        *(_QWORD *)(v33 + 40) = v47;
        *(_QWORD *)(v33 + 48) = v22;
        goto LABEL_6;
      }
      v30 = sub_2378261E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v30 & 1) != 0)
        goto LABEL_18;
LABEL_5:
      swift_bridgeObjectRelease();
LABEL_6:
      v12 = v23;
      v19 += 24;
      if (!--v17)
        goto LABEL_25;
    }
  }
  v18 = MEMORY[0x24BEE4AF8];
LABEL_25:
  swift_bridgeObjectRelease();
  v34 = *(_QWORD *)(v18 + 16);
  if (!v34)
  {
    result = swift_release();
    a6 = v45;
    goto LABEL_31;
  }
  for (i = (unsigned __int16 *)(v18 + 32); ; i += 12)
  {
    v36 = *((unsigned __int8 *)i + 2);
    if (v36 == (v44 & 1))
      break;
    if (!--v34)
    {
      v37 = *(_BYTE *)(v18 + 34);
      v39 = *(_QWORD *)(v18 + 40);
      v38 = *(_QWORD *)(v18 + 48);
      *(_WORD *)v45 = *(_WORD *)(v18 + 32);
      *((_BYTE *)v45 + 2) = v37;
      v45[1] = v39;
      v45[2] = v38;
      swift_bridgeObjectRetain();
      return swift_release();
    }
  }
  v41 = *((_QWORD *)i + 1);
  v40 = *((_QWORD *)i + 2);
  v42 = *i;
  swift_bridgeObjectRetain();
  result = swift_release();
  v43 = 0x10000;
  if (!v36)
    v43 = 0;
  *v45 = v42 | v43;
  v45[1] = v41;
  v45[2] = v40;
  return result;
}

uint64_t sub_23781FB14@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;

  v5 = *(_QWORD *)(v3 + 40);
  if (*(_QWORD *)(v5 + 16))
  {
    v7 = result;
    swift_bridgeObjectRetain();
    v8 = sub_237811AEC(v7, a2);
    if ((v9 & 1) != 0)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(v10 + 16))
      {
        swift_bridgeObjectRetain();
        __asm { BR              X8 }
      }
    }
    result = swift_bridgeObjectRelease();
  }
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  return result;
}

uint64_t sub_23782036C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, _QWORD *a4@<X8>)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = *v4;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_14:
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    return result;
  }
  v9 = result;
  swift_bridgeObjectRetain();
  v10 = sub_237811AEC(v9, a2);
  if ((v11 & 1) == 0
    || (v12 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v10),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRelease(),
        (v13 = *(_QWORD *)(v12 + 16)) == 0))
  {
LABEL_7:
    result = swift_bridgeObjectRelease();
    if (*(_QWORD *)(v6 + 16))
    {
      swift_bridgeObjectRetain();
      v17 = sub_237811AEC(v9, a2);
      if ((v18 & 1) != 0)
      {
        v19 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v17);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (*(_QWORD *)(v19 + 16))
        {
          v21 = *(_QWORD *)(v19 + 40);
          v20 = *(_QWORD *)(v19 + 48);
          *(_BYTE *)a4 = *(_BYTE *)(v19 + 32);
          a4[1] = v21;
          a4[2] = v20;
          swift_bridgeObjectRetain();
          return swift_bridgeObjectRelease();
        }
      }
      result = swift_bridgeObjectRelease();
    }
    goto LABEL_14;
  }
  v14 = (uint64_t *)(v12 + 48);
  v15 = a3 & 1;
  while (1)
  {
    v16 = *((unsigned __int8 *)v14 - 16);
    if ((_DWORD)v16 == v15)
      break;
    v14 += 3;
    if (!--v13)
      goto LABEL_7;
  }
  v23 = *(v14 - 1);
  v22 = *v14;
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  *a4 = v16;
  a4[1] = v23;
  a4[2] = v22;
  return result;
}

uint64_t sub_2378204BC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = *(_QWORD *)(v4 + 8);
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_14:
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    return result;
  }
  v9 = result;
  swift_bridgeObjectRetain();
  v10 = sub_237811AEC(v9, a2);
  if ((v11 & 1) == 0
    || (v12 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v10),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRelease(),
        (v13 = *(_QWORD *)(v12 + 16)) == 0))
  {
LABEL_7:
    result = swift_bridgeObjectRelease();
    if (*(_QWORD *)(v6 + 16))
    {
      swift_bridgeObjectRetain();
      v17 = sub_237811AEC(v9, a2);
      if ((v18 & 1) != 0)
      {
        v19 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v17);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (*(_QWORD *)(v19 + 16))
        {
          v21 = *(_QWORD *)(v19 + 40);
          v20 = *(_QWORD *)(v19 + 48);
          *(_BYTE *)a4 = *(_BYTE *)(v19 + 32);
          a4[1] = v21;
          a4[2] = v20;
          swift_bridgeObjectRetain();
          return swift_bridgeObjectRelease();
        }
      }
      result = swift_bridgeObjectRelease();
    }
    goto LABEL_14;
  }
  v14 = (uint64_t *)(v12 + 48);
  v15 = a3 & 1;
  while (1)
  {
    v16 = *((unsigned __int8 *)v14 - 16);
    if ((_DWORD)v16 == v15)
      break;
    v14 += 3;
    if (!--v13)
      goto LABEL_7;
  }
  v23 = *(v14 - 1);
  v22 = *v14;
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  *a4 = v16;
  a4[1] = v23;
  a4[2] = v22;
  return result;
}

uint64_t sub_23782060C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_237820648 + 4 * byte_23782945E[a1]))(0xD00000000000001ELL, 0x800000023782A2E0);
}

uint64_t sub_237820648()
{
  return 0x6E69626163;
}

uint64_t sub_23782065C()
{
  return 0x496E776F44706F74;
}

uint64_t sub_237820680()
{
  return 0x456E776F44706F74;
}

uint64_t sub_2378206A8()
{
  return 0x7374616573;
}

uint64_t sub_2378206BC()
{
  return 0x73657275736F6C63;
}

uint64_t sub_2378206D4()
{
  return 0x6172426F69647561;
}

uint64_t sub_2378206F8()
{
  return 0x4C656C6369686576;
}

uint64_t sub_237820760()
{
  unsigned __int8 *v0;

  return sub_23782060C(*v0);
}

uint64_t sub_237820768@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237822E90(a1, a2);
  *a3 = result;
  return result;
}

void sub_23782078C(_BYTE *a1@<X8>)
{
  *a1 = 11;
}

uint64_t sub_237820798()
{
  sub_237820C28();
  return sub_237826270();
}

uint64_t sub_2378207C0()
{
  sub_237820C28();
  return sub_23782627C();
}

uint64_t CAUManifest.encode(to:)(_QWORD *a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
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
  char v31;
  uint64_t v32;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256811AF8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v29 = v1[2];
  v30 = v8;
  v10 = v1[3];
  v27 = v1[4];
  v28 = v10;
  v11 = v1[5];
  v25 = v1[6];
  v26 = v11;
  v12 = v1[7];
  v23 = v1[8];
  v24 = v12;
  v13 = v1[9];
  v21 = v1[10];
  v22 = v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237820C28();
  v14 = v4;
  sub_237826264();
  v32 = v9;
  v31 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811B08);
  sub_237820C6C();
  sub_2378261BC();
  if (!v2)
  {
    v15 = v28;
    v16 = v29;
    v17 = v26;
    v18 = v27;
    v32 = v30;
    v31 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256811B30);
    sub_237820D3C();
    sub_2378261BC();
    v32 = v16;
    v31 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256811B58);
    sub_237820E0C();
    sub_2378261BC();
    v32 = v15;
    v31 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256811B70);
    sub_237820EBC();
    sub_2378261BC();
    v32 = v18;
    v31 = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256811B88);
    sub_237820F6C();
    sub_2378261BC();
    v32 = v17;
    v31 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256811BB0);
    sub_23782103C();
    sub_2378261BC();
    v32 = v25;
    v31 = 6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256811BD8);
    sub_23782110C();
    sub_2378261BC();
    v32 = v24;
    v31 = 7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256811BF0);
    sub_2378211BC();
    sub_2378261BC();
    v32 = v23;
    v31 = 8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256811C08);
    sub_23782126C();
    sub_2378261BC();
    v32 = v22;
    v31 = 9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256811C20);
    sub_23782131C();
    sub_2378261BC();
    v32 = v21;
    v31 = 10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256811C38);
    sub_2378213CC();
    sub_23782618C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v14);
}

unint64_t sub_237820C28()
{
  unint64_t result;

  result = qword_256811B00;
  if (!qword_256811B00)
  {
    result = MEMORY[0x23B81C18C](&unk_23782959C, &type metadata for CAUManifest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811B00);
  }
  return result;
}

unint64_t sub_237820C6C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256811B10;
  if (!qword_256811B10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811B08);
    v2 = sub_23782228C(&qword_256811B18, &qword_256811B20, (uint64_t (*)(void))sub_237820CF8, MEMORY[0x24BEE12A0]);
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811B10);
  }
  return result;
}

unint64_t sub_237820CF8()
{
  unint64_t result;

  result = qword_256811B28;
  if (!qword_256811B28)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.Cabin, &type metadata for CAUAsset.Cabin);
    atomic_store(result, (unint64_t *)&qword_256811B28);
  }
  return result;
}

unint64_t sub_237820D3C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256811B38;
  if (!qword_256811B38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811B30);
    v2 = sub_23782228C(&qword_256811B40, &qword_256811B48, (uint64_t (*)(void))sub_237820DC8, MEMORY[0x24BEE12A0]);
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811B38);
  }
  return result;
}

unint64_t sub_237820DC8()
{
  unint64_t result;

  result = qword_256811B50;
  if (!qword_256811B50)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.TopDownInterior, &type metadata for CAUAsset.TopDownInterior);
    atomic_store(result, (unint64_t *)&qword_256811B50);
  }
  return result;
}

unint64_t sub_237820E0C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_256811B60;
  if (!qword_256811B60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811B58);
    v2 = sub_237820E78();
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811B60);
  }
  return result;
}

unint64_t sub_237820E78()
{
  unint64_t result;

  result = qword_256811B68;
  if (!qword_256811B68)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.TopDownExteriorClosuresOverlay, &type metadata for CAUAsset.TopDownExteriorClosuresOverlay);
    atomic_store(result, (unint64_t *)&qword_256811B68);
  }
  return result;
}

unint64_t sub_237820EBC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_256811B78;
  if (!qword_256811B78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811B70);
    v2 = sub_237820F28();
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811B78);
  }
  return result;
}

unint64_t sub_237820F28()
{
  unint64_t result;

  result = qword_256811B80;
  if (!qword_256811B80)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.TopDownExteriorVisible, &type metadata for CAUAsset.TopDownExteriorVisible);
    atomic_store(result, (unint64_t *)&qword_256811B80);
  }
  return result;
}

unint64_t sub_237820F6C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256811B90;
  if (!qword_256811B90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811B88);
    v2 = sub_23782228C(&qword_256811B98, &qword_256811BA0, (uint64_t (*)(void))sub_237820FF8, MEMORY[0x24BEE12A0]);
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811B90);
  }
  return result;
}

unint64_t sub_237820FF8()
{
  unint64_t result;

  result = qword_256811BA8;
  if (!qword_256811BA8)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.Seat, &type metadata for CAUAsset.Seat);
    atomic_store(result, (unint64_t *)&qword_256811BA8);
  }
  return result;
}

unint64_t sub_23782103C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256811BB8;
  if (!qword_256811BB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811BB0);
    v2 = sub_23782228C(&qword_256811BC0, &qword_256811BC8, (uint64_t (*)(void))sub_2378210C8, MEMORY[0x24BEE12A0]);
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811BB8);
  }
  return result;
}

unint64_t sub_2378210C8()
{
  unint64_t result;

  result = qword_256811BD0;
  if (!qword_256811BD0)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.ClosureMask, &type metadata for CAUAsset.ClosureMask);
    atomic_store(result, (unint64_t *)&qword_256811BD0);
  }
  return result;
}

unint64_t sub_23782110C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_256811BE0;
  if (!qword_256811BE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811BD8);
    v2 = sub_237821178();
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811BE0);
  }
  return result;
}

unint64_t sub_237821178()
{
  unint64_t result;

  result = qword_256811BE8;
  if (!qword_256811BE8)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.AudioBrandLogo, &type metadata for CAUAsset.AudioBrandLogo);
    atomic_store(result, (unint64_t *)&qword_256811BE8);
  }
  return result;
}

unint64_t sub_2378211BC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_256811BF8;
  if (!qword_256811BF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811BF0);
    v2 = sub_237821228();
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811BF8);
  }
  return result;
}

unint64_t sub_237821228()
{
  unint64_t result;

  result = qword_256811C00;
  if (!qword_256811C00)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.VehicleLogo, &type metadata for CAUAsset.VehicleLogo);
    atomic_store(result, (unint64_t *)&qword_256811C00);
  }
  return result;
}

unint64_t sub_23782126C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_256811C10;
  if (!qword_256811C10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811C08);
    v2 = sub_2378212D8();
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811C10);
  }
  return result;
}

unint64_t sub_2378212D8()
{
  unint64_t result;

  result = qword_256811C18;
  if (!qword_256811C18)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.VehicleLayout, &type metadata for CAUAsset.VehicleLayout);
    atomic_store(result, (unint64_t *)&qword_256811C18);
  }
  return result;
}

unint64_t sub_23782131C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_256811C28;
  if (!qword_256811C28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811C20);
    v2 = sub_237821388();
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811C28);
  }
  return result;
}

unint64_t sub_237821388()
{
  unint64_t result;

  result = qword_256811C30;
  if (!qword_256811C30)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.WallpaperOverlay, &type metadata for CAUAsset.WallpaperOverlay);
    atomic_store(result, (unint64_t *)&qword_256811C30);
  }
  return result;
}

unint64_t sub_2378213CC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_256811C40;
  if (!qword_256811C40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811C38);
    v2 = sub_237821438();
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811C40);
  }
  return result;
}

unint64_t sub_237821438()
{
  unint64_t result;

  result = qword_256811C48;
  if (!qword_256811C48)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.PhysicalControlBarsLayout, &type metadata for CAUAsset.PhysicalControlBarsLayout);
    atomic_store(result, (unint64_t *)&qword_256811C48);
  }
  return result;
}

uint64_t CAUManifest.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
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
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256811C50);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237820C28();
  sub_237826258();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811B08);
  v40 = 0;
  sub_237821E30();
  sub_237826174();
  v10 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811B30);
  v40 = 1;
  sub_237821F00();
  swift_bridgeObjectRetain();
  sub_237826174();
  v38 = a2;
  v11 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811B58);
  v40 = 2;
  sub_237821FD0();
  swift_bridgeObjectRetain();
  sub_237826174();
  v12 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811B70);
  v40 = 3;
  sub_237822080();
  swift_bridgeObjectRetain();
  sub_237826174();
  v37 = v12;
  v13 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811B88);
  v40 = 4;
  sub_237822130();
  v36 = v13;
  swift_bridgeObjectRetain();
  sub_237826174();
  v14 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811BB0);
  v40 = 5;
  sub_237822200();
  swift_bridgeObjectRetain();
  sub_237826174();
  v34 = v14;
  v15 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811BD8);
  v40 = 6;
  sub_237822334();
  swift_bridgeObjectRetain();
  sub_237826174();
  v35 = v15;
  v16 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811BF0);
  v40 = 7;
  sub_2378223E4();
  v33 = v16;
  swift_bridgeObjectRetain();
  sub_237826174();
  v31 = v11;
  v32 = v10;
  v17 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811C08);
  v40 = 8;
  sub_237822494();
  v30 = v17;
  swift_bridgeObjectRetain();
  v28[1] = 0;
  sub_237826174();
  v18 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811C20);
  v40 = 9;
  sub_237822544();
  v29 = v18;
  swift_bridgeObjectRetain();
  sub_237826174();
  v19 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256811C38);
  v40 = 10;
  sub_2378225F4();
  v39 = v19;
  swift_bridgeObjectRetain();
  sub_237826144();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v20 = v41;
  swift_bridgeObjectRetain();
  v21 = v38;
  v22 = v39;
  v23 = v33;
  *v38 = v32;
  v21[1] = v11;
  v25 = v35;
  v24 = v36;
  v21[2] = v37;
  v21[3] = v24;
  v21[4] = v34;
  v21[5] = v25;
  v27 = v29;
  v26 = v30;
  v21[6] = v23;
  v21[7] = v26;
  v21[8] = v27;
  v21[9] = v22;
  v21[10] = v20;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_237821E30()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256811C58;
  if (!qword_256811C58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811B08);
    v2 = sub_23782228C(&qword_256811C60, &qword_256811B20, (uint64_t (*)(void))sub_237821EBC, MEMORY[0x24BEE12D0]);
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811C58);
  }
  return result;
}

unint64_t sub_237821EBC()
{
  unint64_t result;

  result = qword_256811C68;
  if (!qword_256811C68)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.Cabin, &type metadata for CAUAsset.Cabin);
    atomic_store(result, (unint64_t *)&qword_256811C68);
  }
  return result;
}

unint64_t sub_237821F00()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256811C70;
  if (!qword_256811C70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811B30);
    v2 = sub_23782228C(&qword_256811C78, &qword_256811B48, (uint64_t (*)(void))sub_237821F8C, MEMORY[0x24BEE12D0]);
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811C70);
  }
  return result;
}

unint64_t sub_237821F8C()
{
  unint64_t result;

  result = qword_256811C80;
  if (!qword_256811C80)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.TopDownInterior, &type metadata for CAUAsset.TopDownInterior);
    atomic_store(result, (unint64_t *)&qword_256811C80);
  }
  return result;
}

unint64_t sub_237821FD0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_256811C88;
  if (!qword_256811C88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811B58);
    v2 = sub_23782203C();
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811C88);
  }
  return result;
}

unint64_t sub_23782203C()
{
  unint64_t result;

  result = qword_256811C90;
  if (!qword_256811C90)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.TopDownExteriorClosuresOverlay, &type metadata for CAUAsset.TopDownExteriorClosuresOverlay);
    atomic_store(result, (unint64_t *)&qword_256811C90);
  }
  return result;
}

unint64_t sub_237822080()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_256811C98;
  if (!qword_256811C98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811B70);
    v2 = sub_2378220EC();
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811C98);
  }
  return result;
}

unint64_t sub_2378220EC()
{
  unint64_t result;

  result = qword_256811CA0;
  if (!qword_256811CA0)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.TopDownExteriorVisible, &type metadata for CAUAsset.TopDownExteriorVisible);
    atomic_store(result, (unint64_t *)&qword_256811CA0);
  }
  return result;
}

unint64_t sub_237822130()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256811CA8;
  if (!qword_256811CA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811B88);
    v2 = sub_23782228C(&qword_256811CB0, &qword_256811BA0, (uint64_t (*)(void))sub_2378221BC, MEMORY[0x24BEE12D0]);
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811CA8);
  }
  return result;
}

unint64_t sub_2378221BC()
{
  unint64_t result;

  result = qword_256811CB8;
  if (!qword_256811CB8)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.Seat, &type metadata for CAUAsset.Seat);
    atomic_store(result, (unint64_t *)&qword_256811CB8);
  }
  return result;
}

unint64_t sub_237822200()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256811CC0;
  if (!qword_256811CC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811BB0);
    v2 = sub_23782228C(&qword_256811CC8, &qword_256811BC8, (uint64_t (*)(void))sub_2378222F0, MEMORY[0x24BEE12D0]);
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811CC0);
  }
  return result;
}

uint64_t sub_23782228C(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x23B81C18C](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2378222F0()
{
  unint64_t result;

  result = qword_256811CD0;
  if (!qword_256811CD0)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.ClosureMask, &type metadata for CAUAsset.ClosureMask);
    atomic_store(result, (unint64_t *)&qword_256811CD0);
  }
  return result;
}

unint64_t sub_237822334()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_256811CD8;
  if (!qword_256811CD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811BD8);
    v2 = sub_2378223A0();
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811CD8);
  }
  return result;
}

unint64_t sub_2378223A0()
{
  unint64_t result;

  result = qword_256811CE0;
  if (!qword_256811CE0)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.AudioBrandLogo, &type metadata for CAUAsset.AudioBrandLogo);
    atomic_store(result, (unint64_t *)&qword_256811CE0);
  }
  return result;
}

unint64_t sub_2378223E4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_256811CE8;
  if (!qword_256811CE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811BF0);
    v2 = sub_237822450();
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811CE8);
  }
  return result;
}

unint64_t sub_237822450()
{
  unint64_t result;

  result = qword_256811CF0;
  if (!qword_256811CF0)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.VehicleLogo, &type metadata for CAUAsset.VehicleLogo);
    atomic_store(result, (unint64_t *)&qword_256811CF0);
  }
  return result;
}

unint64_t sub_237822494()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_256811CF8;
  if (!qword_256811CF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811C08);
    v2 = sub_237822500();
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811CF8);
  }
  return result;
}

unint64_t sub_237822500()
{
  unint64_t result;

  result = qword_256811D00;
  if (!qword_256811D00)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.VehicleLayout, &type metadata for CAUAsset.VehicleLayout);
    atomic_store(result, (unint64_t *)&qword_256811D00);
  }
  return result;
}

unint64_t sub_237822544()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_256811D08;
  if (!qword_256811D08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811C20);
    v2 = sub_2378225B0();
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811D08);
  }
  return result;
}

unint64_t sub_2378225B0()
{
  unint64_t result;

  result = qword_256811D10;
  if (!qword_256811D10)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.WallpaperOverlay, &type metadata for CAUAsset.WallpaperOverlay);
    atomic_store(result, (unint64_t *)&qword_256811D10);
  }
  return result;
}

unint64_t sub_2378225F4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_256811D18;
  if (!qword_256811D18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256811C38);
    v2 = sub_237822660();
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256811D18);
  }
  return result;
}

unint64_t sub_237822660()
{
  unint64_t result;

  result = qword_256811D20;
  if (!qword_256811D20)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUAsset.PhysicalControlBarsLayout, &type metadata for CAUAsset.PhysicalControlBarsLayout);
    atomic_store(result, (unint64_t *)&qword_256811D20);
  }
  return result;
}

uint64_t sub_2378226A4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return CAUManifest.init(from:)(a1, a2);
}

uint64_t sub_2378226B8(_QWORD *a1)
{
  return CAUManifest.encode(to:)(a1);
}

uint64_t destroy for CAUManifest()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for CAUManifest(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

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
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
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

_QWORD *assignWithCopy for CAUManifest(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for CAUManifest(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CAUManifest(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CAUManifest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
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
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUManifest()
{
  return &type metadata for CAUManifest;
}

uint64_t getEnumTagSinglePayload for CAUManifest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 10;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 10;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 10;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CAUManifest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_237822B98 + 4 * byte_23782946E[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_237822BCC + 4 * byte_237829469[v4]))();
}

uint64_t sub_237822BCC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237822BD4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237822BDCLL);
  return result;
}

uint64_t sub_237822BE8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237822BF0);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_237822BF4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237822BFC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CAUManifest.CodingKeys()
{
  return &type metadata for CAUManifest.CodingKeys;
}

unint64_t sub_237822C1C()
{
  unint64_t result;

  result = qword_256811D28;
  if (!qword_256811D28)
  {
    result = MEMORY[0x23B81C18C](&unk_237829574, &type metadata for CAUManifest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811D28);
  }
  return result;
}

unint64_t sub_237822C64()
{
  unint64_t result;

  result = qword_256811D30;
  if (!qword_256811D30)
  {
    result = MEMORY[0x23B81C18C](&unk_2378294E4, &type metadata for CAUManifest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811D30);
  }
  return result;
}

unint64_t sub_237822CAC()
{
  unint64_t result;

  result = qword_256811D38;
  if (!qword_256811D38)
  {
    result = MEMORY[0x23B81C18C](&unk_23782950C, &type metadata for CAUManifest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256811D38);
  }
  return result;
}

uint64_t sub_237822CF0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_237822D0C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_237822D0C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256811D40);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8])
      memmove(v12, v13, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23782612C();
  __break(1u);
  return result;
}

uint64_t sub_237822E90(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E69626163 && a2 == 0xE500000000000000;
  if (v3 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x496E776F44706F74 && a2 == 0xEF726F697265746ELL || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD00000000000001ELL && a2 == 0x800000023782A2E0 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x456E776F44706F74 && a2 == 0xEF726F6972657478 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7374616573 && a2 == 0xE500000000000000 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x73657275736F6C63 && a2 == 0xE800000000000000 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6172426F69647561 && a2 == 0xEE006F676F4C646ELL || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x4C656C6369686576 && a2 == 0xEB000000006F676FLL || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x4C656C6369686576 && a2 == 0xEE007374756F7961 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023782A300 || (sub_2378261E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x800000023782A320)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else
  {
    v6 = sub_2378261E0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 10;
    else
      return 11;
  }
}

void sub_2378232E0()
{
  strcpy((char *)&qword_256811D48, "manifest.json");
  unk_256811D56 = -4864;
}

uint64_t static CAUAssetLibrary.manifestFileName.getter()
{
  uint64_t v0;

  if (qword_2568112B0 != -1)
    swift_once();
  v0 = qword_256811D48;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t static CAUAssetLibrary.vehicleLayoutFileName.getter()
{
  return 0xD000000000000012;
}

id sub_237823388(int a1, id a2, void *a3)
{
  void *v3;
  void *v4;
  void *v5;
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
  char *v20;
  id v21;
  char v22;
  uint64_t v23;
  id v24;
  os_log_type_t v25;
  uint64_t v26;
  id v27;
  char *v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  unint64_t v31;
  os_log_type_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  os_log_type_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  os_log_type_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t *v55;
  id v56;
  id v57;
  os_log_type_t v58;
  unint64_t v59;
  id v60;
  char *v61;
  uint64_t v62;
  unint64_t *v63;
  void *v64;
  objc_class *v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  char *v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  id v81;
  int v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  id v87;
  objc_super v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  void *v100;

  v5 = v4;
  v82 = a1;
  v8 = sub_237825E80();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_237825ED4();
  v13 = *(_QWORD *)(v12 - 8);
  v84 = v12;
  v85 = v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v83 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v86 = (char *)&v66 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v66 - v18;
  v20 = v3;
  v87 = a3;
  v21 = objc_msgSend(a3, sel_url);
  sub_237825EB0();

  if ((sub_237825EBC() & 1) == 0)
  {
    swift_bridgeObjectRelease();

    v25 = sub_23782603C();
    if (qword_2568112A0 != -1)
      swift_once();
    sub_2378191CC(v25, (os_log_t)qword_256817AE0, 0xD00000000000002BLL, 0x800000023782A480, 0xD00000000000002DLL, 0x800000023782A4B0, 0xD000000000000054, 0x800000023782A380, 19);
    sub_23781ED88();
    swift_allocError();
    *(_QWORD *)(v26 + 8) = 0;
    *(_QWORD *)(v26 + 16) = 0;
    *(_QWORD *)v26 = 0;
    *(_BYTE *)(v26 + 24) = 5;
    swift_willThrow();

    (*(void (**)(char *, uint64_t))(v85 + 8))(v19, v84);
    goto LABEL_19;
  }
  v81 = a2;
  if (qword_2568112B0 != -1)
    swift_once();
  v89 = qword_256811D48;
  v90 = unk_256811D50;
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BDCD798], v8);
  sub_237824570();
  swift_bridgeObjectRetain();
  sub_237825EC8();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_bridgeObjectRelease();
  v22 = sub_237825E98();
  if (v4)
  {
    swift_bridgeObjectRelease();

    v23 = v84;
    v24 = v87;
    a2 = (id)0xD00000000000002DLL;
LABEL_16:
    v89 = 0;
    v90 = 0xE000000000000000;
    sub_2378260C0();
    sub_237825FDC();
    v100 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256811D68);
    sub_2378260E4();
    v39 = v89;
    v38 = v90;
    v40 = sub_23782603C();
    if (qword_2568112A0 != -1)
      swift_once();
    sub_2378191CC(v40, (os_log_t)qword_256817AE0, v39, v38, 0xD00000000000002DLL, 0x800000023782A4B0, 0xD000000000000054, 0x800000023782A380, 32);
    swift_bridgeObjectRelease();
    sub_237825EA4();
    sub_23781ED88();
    swift_allocError();
    *(_QWORD *)(v41 + 8) = 0;
    *(_QWORD *)(v41 + 16) = 0;
    *(_QWORD *)v41 = 1;
    *(_BYTE *)(v41 + 24) = 5;
    swift_willThrow();

    v42 = *(void (**)(char *, uint64_t))(v85 + 8);
    v42(v86, v23);
    v42(v19, v23);
LABEL_19:
    type metadata accessor for CAUAssetLibrary();
    swift_deallocPartialClassInstance();
    return a2;
  }
  v23 = v84;
  if ((v22 & 1) == 0)
  {
    swift_bridgeObjectRelease();

    v36 = sub_23782603C();
    v24 = v87;
    a2 = (id)0xD00000000000002DLL;
    if (qword_2568112A0 != -1)
      swift_once();
    sub_2378191CC(v36, (os_log_t)qword_256817AE0, 0xD00000000000001ELL, 0x800000023782A510, 0xD00000000000002DLL, 0x800000023782A4B0, 0xD000000000000054, 0x800000023782A380, 27);
    sub_237825EA4();
    sub_23781ED88();
    v5 = (void *)swift_allocError();
    *(_QWORD *)(v37 + 8) = 0;
    *(_QWORD *)(v37 + 16) = 0;
    *(_QWORD *)v37 = 1;
    *(_BYTE *)(v37 + 24) = 5;
    swift_willThrow();
    goto LABEL_16;
  }
  v89 = 0;
  v90 = 0xE000000000000000;
  sub_2378260C0();
  swift_bridgeObjectRelease();
  v89 = 0xD00000000000001CLL;
  v90 = 0x800000023782A530;
  v27 = objc_msgSend(v87, sel_url);
  v28 = v83;
  sub_237825EB0();

  sub_2378245B4();
  sub_2378261D4();
  sub_237825FDC();
  swift_bridgeObjectRelease();
  v29 = *(void (**)(char *, uint64_t))(v85 + 8);
  v29(v28, v23);
  v30 = v89;
  v31 = v90;
  v32 = sub_23782603C();
  if (qword_2568112A0 != -1)
    swift_once();
  v79 = (unint64_t)"ty scoped resource. failed.";
  v80 = (unint64_t)"failed to decode json file ";
  sub_2378191CC(v32, (os_log_t)qword_256817AE0, v30, v31, 0xD00000000000002DLL, 0x800000023782A4B0, 0xD000000000000054, 0x800000023782A380, 37);
  swift_bridgeObjectRelease();
  sub_237825E38();
  swift_allocObject();
  sub_237825E2C();
  v33 = sub_237825EE0();
  v35 = v34;
  sub_2378245FC();
  sub_237825E20();
  sub_23781E3A4(v33, v35);
  swift_release();
  v45 = v89;
  v44 = v90;
  v71 = v90;
  v46 = v91;
  v47 = v92;
  v77 = v91;
  v78 = v92;
  v48 = v93;
  v49 = v94;
  v75 = v93;
  v76 = v94;
  v50 = v95;
  v51 = v96;
  v73 = v95;
  v74 = v96;
  v52 = v97;
  v53 = v98;
  v67 = v97;
  v72 = v98;
  v54 = v99;
  v55 = (unint64_t *)&v20[OBJC_IVAR____TtC13CarAssetUtils15CAUAssetLibrary_manifest];
  *v55 = v89;
  v55[1] = v44;
  v68 = v45;
  v55[2] = v46;
  v55[3] = v47;
  v55[4] = v48;
  v55[5] = v49;
  v55[6] = v50;
  v55[7] = v51;
  v55[8] = v52;
  v55[9] = v53;
  v55[10] = v54;
  v69 = v54;
  v56 = v87;
  v70 = v20;
  *(_QWORD *)&v20[OBJC_IVAR____TtC13CarAssetUtils15CAUAssetLibrary_securityScopedBasePathURL] = v87;
  (*(void (**)(char *, char *, uint64_t))(v85 + 16))(&v20[OBJC_IVAR____TtC13CarAssetUtils15CAUAssetLibrary_basePathURL], v19, v23);
  v57 = v56;
  v87 = v57;
  v58 = sub_23782603C();
  sub_2378191CC(v58, (os_log_t)qword_256817AE0, 0x74736566696E616DLL, 0xEF646564616F6C20, 0xD00000000000002DLL, v79 | 0x8000000000000000, 0xD000000000000054, v80 | 0x8000000000000000, 49);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v59 = v67;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v60 = objc_msgSend(v57, sel_url);
  v61 = v83;
  sub_237825EB0();

  v29(v86, v23);
  v29(v19, v23);
  type metadata accessor for CAUAssetsResolver();
  v62 = swift_allocObject();
  v63 = (unint64_t *)(v62 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest);
  *v63 = v68;
  v63[1] = v71;
  v63[2] = v77;
  v63[3] = v78;
  v63[4] = v75;
  v63[5] = v76;
  v63[6] = v73;
  v63[7] = v74;
  v63[8] = v59;
  v63[9] = v72;
  v63[10] = v69;
  (*(void (**)(uint64_t, char *, uint64_t))(v85 + 32))(v62 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_basePathURL, v61, v23);
  *(_QWORD *)(v62 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_variants) = v81;
  *(_BYTE *)(v62 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_rhd) = v82 & 1;
  v64 = v70;
  *(_QWORD *)&v70[OBJC_IVAR____TtC13CarAssetUtils15CAUAssetLibrary_assetResolver] = v62;

  v65 = (objc_class *)type metadata accessor for CAUAssetLibrary();
  v88.receiver = v64;
  v88.super_class = v65;
  a2 = objc_msgSendSuper2(&v88, sel_init);

  return a2;
}

id CAUAssetLibrary.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  sub_237825EA4();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAUAssetLibrary();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CAUAssetLibrary()
{
  uint64_t result;

  result = qword_256811DA8;
  if (!qword_256811DA8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237824120@<X0>(unsigned __int16 *a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int16 v3;

  v3 = *a1;
  return sub_23782572C(&v3, a2);
}

uint64_t sub_237824154(_WORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;

  v3 = sub_237825ED4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOWORD(v8) = *a1;
  result = sub_23782572C((unsigned __int16 *)&v8, (uint64_t)v6);
  if (!v1)
  {
    sub_237825E38();
    swift_allocObject();
    sub_237825E2C();
    sub_237825D90();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return swift_release();
  }
  return result;
}

id CAUAssetLibrary.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CAUAssetLibrary.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_237824470()
{
  return type metadata accessor for CAUAssetLibrary();
}

uint64_t sub_237824478()
{
  uint64_t result;
  unint64_t v1;

  result = sub_237825ED4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for CAUAssetLibrary()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CAUAssetLibrary.path(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CAUAssetLibrary.asset<A>(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

unint64_t sub_237824570()
{
  unint64_t result;

  result = qword_256811DB8;
  if (!qword_256811DB8)
  {
    result = MEMORY[0x23B81C18C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256811DB8);
  }
  return result;
}

unint64_t sub_2378245B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256811DC0;
  if (!qword_256811DC0)
  {
    v1 = sub_237825ED4();
    result = MEMORY[0x23B81C18C](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_256811DC0);
  }
  return result;
}

unint64_t sub_2378245FC()
{
  unint64_t result;

  result = qword_256811DC8;
  if (!qword_256811DC8)
  {
    result = MEMORY[0x23B81C18C](&protocol conformance descriptor for CAUManifest, &type metadata for CAUManifest);
    atomic_store(result, (unint64_t *)&qword_256811DC8);
  }
  return result;
}

void sub_237824640(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_237825ED4();
  v5 = MEMORY[0x24BDAC7A8](v4);
  MEMORY[0x24BDAC7A8](v5);
  __asm { BR              X10 }
}

uint64_t sub_2378246F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t, uint64_t, uint64_t);

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v0 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_basePathURL, v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_237825E8C();
  swift_bridgeObjectRelease();
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(v4, v2);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);
  v7(v4, v3, v2);
  swift_bridgeObjectRetain();
  sub_237825E8C();
  swift_bridgeObjectRelease();
  v6(v4, v2);
  v7(v4, v3, v2);
  v7(v1, v4, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2378248C0(unsigned __int16 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unsigned int v4;
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
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v32;
  unsigned __int8 v33;
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
  uint64_t v45[4];

  v4 = *a1;
  if (v4 >> 14)
  {
    if (v4 >> 14 != 1)
      __asm { BR              X10 }
    v5 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 8);
    v7 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 16);
    v6 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 24);
    v8 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 32);
    v9 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 56);
    v23 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 40);
    v24 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 48);
    v10 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 64);
    v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 72);
    v12 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 80);
    v34 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest);
    v35 = v5;
    v36 = v7;
    v37 = v6;
    v38 = v8;
    v39 = v23;
    v40 = v24;
    v41 = v9;
    v42 = v10;
    v43 = v11;
    v44 = v12;
    v25 = *(_BYTE *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_rhd);
    v33 = v4;
    v32 = BYTE1(v4) & 0x3F;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23781F7D4(a2, a3, v25, &v33, &v32, v45);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 16);
    v14 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 24);
    v15 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 32);
    v16 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 40);
    v17 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 56);
    v26 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 48);
    v27 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 8);
    v18 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 64);
    v19 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 72);
    v20 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 80);
    v34 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest);
    v35 = v27;
    v36 = v13;
    v37 = v14;
    v38 = v15;
    v39 = v16;
    v40 = v26;
    v41 = v17;
    v42 = v18;
    v43 = v19;
    v44 = v20;
    v33 = v4;
    v32 = BYTE1(v4) & 1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23781FB14(a2, a3, v45);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v45[2])
    return v45[1];
  else
    return 0;
}

void sub_237824BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if (*(_QWORD *)(*(_QWORD *)(v2 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 48) + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_237811AEC(a2, v3);
    if ((v4 & 1) != 0)
      swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x237824B60);
}

uint64_t sub_23782572C@<X0>(unsigned __int16 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v23;
  uint64_t v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  os_log_type_t v30;
  uint64_t v31;
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  __int16 v37;

  v3 = v2;
  v6 = sub_237825ED4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  v11 = v10 >> 14;
  if (v10 == 32773 && v11 == 2)
  {
    sub_23781ED88();
    swift_allocError();
    *(_QWORD *)(v14 + 16) = 0;
    *(_QWORD *)v14 = 32773;
LABEL_18:
    *(_QWORD *)(v14 + 8) = 0;
    *(_BYTE *)(v14 + 24) = 0;
    return swift_willThrow();
  }
  if (v11)
  {
    if (v11 != 1)
      __asm { BR              X10 }
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }
  v15 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_variants);
  if (!*(_QWORD *)(v15 + 16) || (v16 = sub_237811A94(v13), (v17 & 1) == 0))
  {
    v35 = 0;
    v36 = 0xE000000000000000;
    sub_2378260C0();
    sub_237825FDC();
    v37 = v10;
    sub_2378260E4();
    sub_237825FDC();
    v24 = v35;
    v23 = v36;
    v25 = sub_237826048();
    if (qword_2568112A0 != -1)
      swift_once();
    sub_2378191CC(v25, (os_log_t)qword_256817AE0, v24, v23, 0x726F662868746170, 0xEA0000000000293ALL, 0xD000000000000056, 0x800000023782A5E0, 69);
    swift_bridgeObjectRelease();
    sub_23781ED88();
    swift_allocError();
    *(_QWORD *)(v14 + 16) = 0;
    *(_QWORD *)v14 = v10;
    goto LABEL_18;
  }
  v18 = (uint64_t *)(*(_QWORD *)(v15 + 56) + 16 * v16);
  v19 = *v18;
  v20 = v18[1];
  swift_bridgeObjectRetain();
  v32[1] = a2;
  v33 = v19;
  v34 = v20;
  LOWORD(v35) = v10;
  sub_2378248C0((unsigned __int16 *)&v35, v19, v20);
  if (v21)
  {
    LOBYTE(v35) = v13;
    sub_237824640(v33, v34, (uint64_t)&v35);
    swift_bridgeObjectRelease();
    sub_237825E8C();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  v35 = 0;
  v36 = 0xE000000000000000;
  sub_2378260C0();
  sub_237825FDC();
  v37 = v10;
  sub_2378260E4();
  sub_237825FDC();
  v27 = v33;
  v26 = v34;
  sub_237825FDC();
  v29 = v35;
  v28 = v36;
  v30 = sub_237826048();
  if (qword_2568112A0 != -1)
    swift_once();
  sub_2378191CC(v30, (os_log_t)qword_256817AE0, v29, v28, 0x726F662868746170, 0xEA0000000000293ALL, 0xD000000000000056, 0x800000023782A5E0, 74);
  swift_bridgeObjectRelease();
  sub_23781ED88();
  swift_allocError();
  *(_QWORD *)v31 = v10;
  *(_QWORD *)(v31 + 8) = v27;
  *(_QWORD *)(v31 + 16) = v26;
  *(_BYTE *)(v31 + 24) = 3;
  return swift_willThrow();
}

uint64_t sub_237825BBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_basePathURL;
  v2 = sub_237825ED4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_237825CC0()
{
  return type metadata accessor for CAUAssetsResolver();
}

uint64_t type metadata accessor for CAUAssetsResolver()
{
  uint64_t result;

  result = qword_256811E18;
  if (!qword_256811E18)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237825D04()
{
  uint64_t result;
  unint64_t v1;

  result = sub_237825ED4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_237825D90()
{
  uint64_t v0;
  uint64_t result;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;

  result = sub_237825EE0();
  if (!v0)
  {
    v3 = result;
    v4 = v2;
    sub_237825E20();
    return sub_23781E3A4(v3, v4);
  }
  return result;
}

uint64_t sub_237825E20()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_237825E2C()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_237825E38()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_237825E44()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_237825E50()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_237825E5C()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_237825E68()
{
  return MEMORY[0x24BDCBE78]();
}

uint64_t sub_237825E74()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_237825E80()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_237825E8C()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_237825E98()
{
  return MEMORY[0x24BDCD958]();
}

uint64_t sub_237825EA4()
{
  return MEMORY[0x24BDCD9B0]();
}

uint64_t sub_237825EB0()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_237825EBC()
{
  return MEMORY[0x24BDCD9C8]();
}

uint64_t sub_237825EC8()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_237825ED4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_237825EE0()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_237825EEC()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_237825EF8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_237825F04()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_237825F10()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_237825F1C()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_237825F28()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_237825F34()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_237825F40()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_237825F4C()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_237825F58()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_237825F64()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_237825F70()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_237825F7C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_237825F88()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_237825F94()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_237825FA0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_237825FAC()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_237825FB8()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_237825FC4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_237825FD0()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_237825FDC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_237825FE8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_237825FF4()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_237826000()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23782600C()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_237826018()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_237826024()
{
  return MEMORY[0x24BEE10E8]();
}

uint64_t sub_237826030()
{
  return MEMORY[0x24BEE10F0]();
}

uint64_t sub_23782603C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_237826048()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_237826054()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_237826060()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_23782606C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_237826078()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_237826084()
{
  return MEMORY[0x24BEE1E58]();
}

uint64_t sub_237826090()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23782609C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2378260A8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2378260B4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2378260C0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2378260CC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2378260D8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2378260E4()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2378260F0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2378260FC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_237826108()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_237826114()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_237826120()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23782612C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_237826138()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_237826144()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_237826150()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23782615C()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_237826168()
{
  return MEMORY[0x24BEE3368]();
}

uint64_t sub_237826174()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_237826180()
{
  return MEMORY[0x24BEE3398]();
}

uint64_t sub_23782618C()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_237826198()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2378261A4()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_2378261B0()
{
  return MEMORY[0x24BEE34B8]();
}

uint64_t sub_2378261BC()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2378261C8()
{
  return MEMORY[0x24BEE34E8]();
}

uint64_t sub_2378261D4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2378261E0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2378261EC()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_2378261F8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_237826204()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_237826210()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23782621C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_237826228()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_237826234()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_237826240()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23782624C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_237826258()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_237826264()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_237826270()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23782627C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x24BE0BB58]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
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

