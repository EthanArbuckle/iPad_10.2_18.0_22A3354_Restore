uint64_t GridDescriptor.count.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

__n128 GridDescriptor.margins.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(v1 + 8);
  v3 = *(_OWORD *)(v1 + 24);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

double GridDescriptor.spacing.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 40);
}

uint64_t GridDescriptor.span.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

BOOL sub_23C02A3C8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C02A3DC()
{
  sub_23C05450C();
  sub_23C054518();
  return sub_23C054548();
}

uint64_t sub_23C02A420()
{
  return sub_23C054518();
}

uint64_t sub_23C02A448()
{
  sub_23C05450C();
  sub_23C054518();
  return sub_23C054548();
}

uint64_t sub_23C02A488()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23C02A4B4 + 4 * byte_23C054C60[*v0]))(0x746E756F63, 0xE500000000000000);
}

uint64_t sub_23C02A4B4()
{
  return 0x736E696772616DLL;
}

uint64_t sub_23C02A4CC()
{
  return 0x676E6963617073;
}

uint64_t sub_23C02A4E4()
{
  return 1851879539;
}

uint64_t sub_23C02A4F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C02B618(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C02A518()
{
  return 0;
}

void sub_23C02A524(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_23C02A530()
{
  sub_23C02A7AC();
  return sub_23C05456C();
}

uint64_t sub_23C02A558()
{
  sub_23C02A7AC();
  return sub_23C054578();
}

uint64_t GridDescriptor.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
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
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B02BE0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v1[1];
  v9 = v1[2];
  v10 = v1[3];
  v11 = v1[4];
  v12 = v1[5];
  v14 = v1[6];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C02A7AC();
  sub_23C054560();
  LOBYTE(v16) = 0;
  sub_23C054458();
  if (!v2)
  {
    v16 = v8;
    v17 = v9;
    v18 = v10;
    v19 = v11;
    v15 = 1;
    sub_23C02A7F0();
    sub_23C054464();
    v16 = v12;
    v15 = 2;
    sub_23C02A834();
    sub_23C054464();
    LOBYTE(v16) = 3;
    sub_23C054458();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242615EB0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

unint64_t sub_23C02A7AC()
{
  unint64_t result;

  result = qword_256B02BE8;
  if (!qword_256B02BE8)
  {
    result = MEMORY[0x242615EC8](&unk_23C0552EC, &type metadata for GridDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02BE8);
  }
  return result;
}

unint64_t sub_23C02A7F0()
{
  unint64_t result;

  result = qword_256B02BF0;
  if (!qword_256B02BF0)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for LayoutEdgeInsets, &type metadata for LayoutEdgeInsets);
    atomic_store(result, (unint64_t *)&qword_256B02BF0);
  }
  return result;
}

unint64_t sub_23C02A834()
{
  unint64_t result;

  result = qword_256B02BF8;
  if (!qword_256B02BF8)
  {
    result = MEMORY[0x242615EC8](MEMORY[0x24BEE50C0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_256B02BF8);
  }
  return result;
}

uint64_t GridDescriptor.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B02C00);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C02A7AC();
  sub_23C054554();
  if (!v2)
  {
    LOBYTE(v19) = 0;
    v9 = sub_23C0543F8();
    v18 = 1;
    sub_23C02AA90();
    sub_23C054404();
    v10 = v19;
    v11 = v20;
    v12 = v21;
    v13 = v22;
    v18 = 2;
    sub_23C02AAD4();
    sub_23C054404();
    v15 = v19;
    LOBYTE(v19) = 3;
    v16 = sub_23C0543F8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v11;
    a2[3] = v12;
    a2[4] = v13;
    a2[5] = v15;
    a2[6] = v16;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
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

unint64_t sub_23C02AA90()
{
  unint64_t result;

  result = qword_256B02C08;
  if (!qword_256B02C08)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for LayoutEdgeInsets, &type metadata for LayoutEdgeInsets);
    atomic_store(result, (unint64_t *)&qword_256B02C08);
  }
  return result;
}

unint64_t sub_23C02AAD4()
{
  unint64_t result;

  result = qword_256B02C10;
  if (!qword_256B02C10)
  {
    result = MEMORY[0x242615EC8](MEMORY[0x24BEE50E8], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_256B02C10);
  }
  return result;
}

uint64_t sub_23C02AB18@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return GridDescriptor.init(from:)(a1, a2);
}

uint64_t sub_23C02AB2C(_QWORD *a1)
{
  return GridDescriptor.encode(to:)(a1);
}

uint64_t GridDescriptor.hash(into:)()
{
  sub_23C054518();
  LayoutEdgeInsets.hash(into:)();
  sub_23C05453C();
  return sub_23C054518();
}

uint64_t GridDescriptor.hashValue.getter()
{
  sub_23C05450C();
  sub_23C054518();
  LayoutEdgeInsets.hash(into:)();
  sub_23C05453C();
  sub_23C054518();
  return sub_23C054548();
}

uint64_t sub_23C02AC64()
{
  sub_23C05450C();
  sub_23C054518();
  LayoutEdgeInsets.hash(into:)();
  sub_23C05453C();
  sub_23C054518();
  return sub_23C054548();
}

uint64_t sub_23C02ACFC(uint64_t a1, uint64_t a2)
{
  return sub_23C02AFF8(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_23C02AD14(uint64_t a1, uint64_t a2)
{
  return sub_23C02AFF8(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_23C02AD28()
{
  return sub_23C0541A0();
}

uint64_t sub_23C02AD30(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char v4;
  int v5;
  int v6;
  char v7;

  v6 = 0;
  v7 = 1;
  result = MEMORY[0x242615784](a1, &v6);
  v4 = v7;
  v5 = v6;
  if (v7)
    v5 = 0;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = v4;
  return result;
}

uint64_t sub_23C02AD80(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;
  int v5;
  int v7;
  char v8;

  v7 = 0;
  v8 = 1;
  v3 = MEMORY[0x242615790](a1, &v7);
  v4 = v8;
  v5 = v7;
  if (v8)
    v5 = 0;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = v4;
  return v3 & 1;
}

void sub_23C02ADD4(float *a1@<X8>)
{
  *a1 = MEMORY[0x24261579C]();
}

uint64_t sub_23C02ADF8()
{
  return sub_23C053D2C();
}

uint64_t sub_23C02AE00(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v6 = 0;
  v7 = 1;
  result = MEMORY[0x242615310](a1, &v6);
  v4 = v7;
  v5 = v6;
  if (v7)
    v5 = 0;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v4;
  return result;
}

uint64_t sub_23C02AE50(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v7;
  char v8;

  v7 = 0;
  v8 = 1;
  v3 = MEMORY[0x24261531C](a1, &v7);
  v4 = v8;
  v5 = v7;
  if (v8)
    v5 = 0;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v4;
  return v3 & 1;
}

void sub_23C02AEA4(double *a1@<X8>)
{
  *a1 = MEMORY[0x242615328]();
}

uint64_t sub_23C02AEC8(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_23C054020();
  *a2 = 0;
  return result;
}

uint64_t sub_23C02AF3C(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_23C05402C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23C02AFB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_23C054038();
  v2 = sub_23C054014();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23C02AFF8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_23C054038();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23C02B034()
{
  sub_23C054038();
  sub_23C05405C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C02B074()
{
  uint64_t v0;

  sub_23C054038();
  sub_23C05450C();
  sub_23C05405C();
  v0 = sub_23C054548();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23C02B0E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_23C054038();
  v2 = v1;
  if (v0 == sub_23C054038() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_23C054488();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23C02B174@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23C054038();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23C02B19C()
{
  sub_23C02BC88((unint64_t *)&qword_256B02D68, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_23C055780);
  sub_23C02BC88(&qword_256B02D70, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_23C055424);
  return sub_23C0543A4();
}

_DWORD *sub_23C02B220@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

float sub_23C02B230@<S0>(_DWORD *a1@<X8>)
{
  float *v1;
  float result;

  result = *v1;
  *a1 = *(_DWORD *)v1;
  return result;
}

uint64_t sub_23C02B23C()
{
  sub_23C02BC88(&qword_256B02CD0, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_23C054FAC);
  sub_23C02BC88(&qword_256B02CD8, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_23C054F4C);
  return sub_23C0543A4();
}

_QWORD *sub_23C02B2D0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

double sub_23C02B2E0@<D0>(_QWORD *a1@<X8>)
{
  double *v1;
  double result;

  result = *v1;
  *a1 = *(_QWORD *)v1;
  return result;
}

uint64_t sub_23C02B2EC()
{
  sub_23C02BC88(&qword_256B02D40, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_23C0556F0);
  sub_23C02BC88(&qword_256B02D48, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_23C055690);
  sub_23C02C098();
  return sub_23C0543A4();
}

uint64_t sub_23C02B38C()
{
  sub_23C02BC88((unint64_t *)&qword_256B02CB0, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_23C0552A8);
  sub_23C02BC88(&qword_256B02CB8, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_23C0551FC);
  return sub_23C0543A4();
}

uint64_t sub_23C02B410()
{
  sub_23C02BC88(&qword_256B02D58, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_23C055598);
  sub_23C02BC88(&qword_256B02D60, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_23C055538);
  return sub_23C0543A4();
}

uint64_t sub_23C02B494@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23C054014();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23C02B4D8()
{
  sub_23C02BC88(&qword_256B02CC0, (uint64_t (*)(uint64_t))type metadata accessor for FeatureKey, (uint64_t)&unk_23C055104);
  sub_23C02BC88(&qword_256B02CC8, (uint64_t (*)(uint64_t))type metadata accessor for FeatureKey, (uint64_t)&unk_23C0550A4);
  return sub_23C0543A4();
}

uint64_t sub_23C02B55C()
{
  return sub_23C0541D0();
}

uint64_t sub_23C02B564()
{
  return sub_23C054530();
}

void sub_23C02B594()
{
  JUMPOUT(0x242615ACCLL);
}

uint64_t sub_23C02B5A8()
{
  return sub_23C054194();
}

uint64_t sub_23C02B5B0()
{
  return sub_23C05453C();
}

uint64_t sub_23C02B5E0()
{
  return sub_23C054500();
}

BOOL sub_23C02B5F0(float *a1, float *a2)
{
  return *a1 == *a2;
}

BOOL sub_23C02B604(double *a1, double *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C02B618(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x746E756F63 && a2 == 0xE500000000000000;
  if (v2 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x736E696772616DLL && a2 == 0xE700000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x676E6963617073 && a2 == 0xE700000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1851879539 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23C054488();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

BOOL _s13FitnessCoreUI14GridDescriptorV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;

  result = 0;
  if (*(_QWORD *)a1 == *(_QWORD *)a2
    && (~vaddv_s16((int16x4_t)vand_s8((int8x8_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 8), *(float64x2_t *)(a2 + 8)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 24), *(float64x2_t *)(a2 + 24)))), 0xFuLL)), (int8x8_t)0x8000400020001)) & 0xF) == 0&& *(double *)(a1 + 40) == *(double *)(a2 + 40))
  {
    return *(_QWORD *)(a1 + 48) == *(_QWORD *)(a2 + 48);
  }
  return result;
}

unint64_t sub_23C02B84C()
{
  unint64_t result;

  result = qword_256B02C18;
  if (!qword_256B02C18)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for GridDescriptor, &type metadata for GridDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B02C18);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for LayoutEdgeInsets(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for GridDescriptor(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 56))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for GridDescriptor(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
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
  *(_BYTE *)(result + 56) = v3;
  return result;
}

ValueMetadata *type metadata accessor for GridDescriptor()
{
  return &type metadata for GridDescriptor;
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

uint64_t getEnumTagSinglePayload for LayoutEdgeInsets(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for LayoutEdgeInsets(uint64_t result, int a2, int a3)
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

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
  sub_23C02BEC8(a1, &qword_256B02C20);
}

void type metadata accessor for AttributeName(uint64_t a1)
{
  sub_23C02BEC8(a1, &qword_256B02C28);
}

void type metadata accessor for FeatureKey(uint64_t a1)
{
  sub_23C02BEC8(a1, &qword_256B02C30);
}

void type metadata accessor for NSDirectionalEdgeInsets(uint64_t a1)
{
  sub_23C02BEC8(a1, &qword_256B02C38);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23C02B9FC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23C02BA1C(uint64_t result, int a2, int a3)
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
  sub_23C02BEC8(a1, &qword_256B02C40);
}

void type metadata accessor for UILayoutPriority(uint64_t a1)
{
  sub_23C02BEC8(a1, &qword_256B02C48);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GridDescriptor.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for GridDescriptor.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C02BB54 + 4 * byte_23C054C69[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C02BB88 + 4 * byte_23C054C64[v4]))();
}

uint64_t sub_23C02BB88(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C02BB90(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C02BB98);
  return result;
}

uint64_t sub_23C02BBA4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C02BBACLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C02BBB0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C02BBB8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C02BBC4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23C02BBD0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GridDescriptor.CodingKeys()
{
  return &type metadata for GridDescriptor.CodingKeys;
}

unint64_t sub_23C02BBEC()
{
  unint64_t result;

  result = qword_256B02C50;
  if (!qword_256B02C50)
  {
    result = MEMORY[0x242615EC8](&unk_23C054EB0, &type metadata for GridDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02C50);
  }
  return result;
}

uint64_t sub_23C02BC30()
{
  return sub_23C02BC88(&qword_256B02C58, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_23C054F10);
}

uint64_t sub_23C02BC5C()
{
  return sub_23C02BC88(&qword_256B02C60, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_23C054EE4);
}

uint64_t sub_23C02BC88(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x242615EC8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C02BCC8()
{
  return sub_23C02BC88(&qword_256B02C68, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_23C054F80);
}

uint64_t sub_23C02BCF4()
{
  return sub_23C02BC88(&qword_256B02C70, (uint64_t (*)(uint64_t))type metadata accessor for FeatureKey, (uint64_t)&unk_23C055068);
}

uint64_t sub_23C02BD20()
{
  return sub_23C02BC88(&qword_256B02C78, (uint64_t (*)(uint64_t))type metadata accessor for FeatureKey, (uint64_t)&unk_23C05503C);
}

uint64_t sub_23C02BD4C()
{
  return sub_23C02BC88(&qword_256B02C80, (uint64_t (*)(uint64_t))type metadata accessor for FeatureKey, (uint64_t)&unk_23C0550D8);
}

uint64_t sub_23C02BD78()
{
  return sub_23C02BC88(&qword_256B02C88, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_23C0551C0);
}

uint64_t sub_23C02BDA4()
{
  return sub_23C02BC88(&qword_256B02C90, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_23C055194);
}

uint64_t sub_23C02BDD0()
{
  return sub_23C02BC88(&qword_256B02C98, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_23C055230);
}

unint64_t sub_23C02BE00()
{
  unint64_t result;

  result = qword_256B02CA0;
  if (!qword_256B02CA0)
  {
    result = MEMORY[0x242615EC8](&unk_23C054E20, &type metadata for GridDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02CA0);
  }
  return result;
}

unint64_t sub_23C02BE48()
{
  unint64_t result;

  result = qword_256B02CA8;
  if (!qword_256B02CA8)
  {
    result = MEMORY[0x242615EC8](&unk_23C054E48, &type metadata for GridDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02CA8);
  }
  return result;
}

void type metadata accessor for Weight(uint64_t a1)
{
  sub_23C02BEC8(a1, &qword_256B02CE0);
}

void type metadata accessor for TraitKey(uint64_t a1)
{
  sub_23C02BEC8(a1, &qword_256B02CE8);
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_23C02BEC8(a1, &qword_256B02CF0);
}

void sub_23C02BEC8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23C02BF0C()
{
  return sub_23C02BC88(&qword_256B02CF8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_23C0553E8);
}

uint64_t sub_23C02BF38()
{
  return sub_23C02BC88(&qword_256B02D00, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_23C0553BC);
}

uint64_t sub_23C02BF64()
{
  return sub_23C02BC88(&qword_256B02D08, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_23C0554FC);
}

uint64_t sub_23C02BF90()
{
  return sub_23C02BC88(&qword_256B02D10, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_23C0554D0);
}

uint64_t sub_23C02BFBC()
{
  return sub_23C02BC88(&qword_256B02D18, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_23C05556C);
}

uint64_t sub_23C02BFE8()
{
  return sub_23C02BC88(&qword_256B02D20, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_23C055654);
}

uint64_t sub_23C02C014()
{
  return sub_23C02BC88(&qword_256B02D28, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_23C055628);
}

uint64_t sub_23C02C040()
{
  return sub_23C02BC88(&qword_256B02D30, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_23C0556C4);
}

uint64_t sub_23C02C06C()
{
  return sub_23C02BC88(&qword_256B02D38, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_23C055458);
}

unint64_t sub_23C02C098()
{
  unint64_t result;

  result = qword_256B02D50;
  if (!qword_256B02D50)
  {
    result = MEMORY[0x242615EC8](MEMORY[0x24BEE50D0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_256B02D50);
  }
  return result;
}

uint64_t ColorDescriptor.init(hex:)@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  int64x2_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;

  if (!a2)
    goto LABEL_41;
  v5 = result;
  if (sub_23C054068() != 6 && sub_23C054068() != 8)
  {
LABEL_40:
    result = swift_bridgeObjectRelease();
LABEL_41:
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_BYTE *)(a3 + 32) = 1;
    return result;
  }
  v6 = sub_23C054074();
  v7 = sub_23C054074();
  v8 = sub_23C054074();
  v9 = sub_23C0540D4();
  v50 = v12;
  if (v7 >> 14 < v6 >> 14)
  {
    __break(1u);
    goto LABEL_35;
  }
  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = sub_23C0540D4();
  if (v8 >> 14 < v7 >> 14)
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRelease();
LABEL_31:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_40;
  }
  v46 = v18;
  v47 = v17;
  v48 = v16;
  v20 = v19;
  v49 = sub_23C0540D4();
  v44 = v22;
  v45 = v21;
  v24 = v23;
  if (sub_23C054068() == 8)
  {
    v25 = HIBYTE(a2) & 0xF;
    if ((a2 & 0x2000000000000000) == 0)
      v25 = v5 & 0xFFFFFFFFFFFFLL;
    if (v8 >> 14 > 4 * v25)
    {
      __break(1u);
      goto LABEL_38;
    }
    v26 = sub_23C0540D4();
    v42 = v27;
    v43 = v26;
    v41 = v28;
    v30 = v29;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v42 = 0;
    v43 = 0;
    v41 = 0;
    v30 = 0;
  }
  if (!((v13 ^ v14) >> 14))
    goto LABEL_36;
  v31 = sub_23C02D124(v13, v14, v50, v15, 16);
  if ((v31 & 0x10000000000) != 0)
    v31 = sub_23C02C81C(v13, v14, v50, v15, 16);
  v32 = v31;
  swift_bridgeObjectRelease();
  if ((v32 & 0x100000000) != 0)
    goto LABEL_31;
  if (!((v48 ^ v47) >> 14))
  {
LABEL_38:
    swift_bridgeObjectRelease();
LABEL_39:
    swift_bridgeObjectRelease();
    goto LABEL_40;
  }
  v33 = sub_23C02D124(v48, v47, v46, v20, 16);
  if ((v33 & 0x10000000000) != 0)
    v33 = sub_23C02C81C(v48, v47, v46, v20, 16);
  v34 = v33;
  swift_bridgeObjectRelease();
  if ((v34 & 0x100000000) != 0 || !((v49 ^ v45) >> 14))
    goto LABEL_39;
  v35 = sub_23C02D124(v49, v45, v44, v24, 16);
  if ((v35 & 0x10000000000) != 0)
    v35 = sub_23C02C81C(v49, v45, v44, v24, 16);
  v36 = v35;
  result = swift_bridgeObjectRelease();
  if ((v36 & 0x100000000) != 0)
    goto LABEL_40;
  v37 = 1.0;
  if (v30)
  {
    if ((v42 ^ v43) >> 14)
    {
      v38 = sub_23C02D124(v43, v42, v41, v30, 16);
      if ((v38 & 0x10000000000) != 0)
        v38 = sub_23C02C81C(v43, v42, v41, v30, 16);
      v39 = v38;
      result = swift_bridgeObjectRelease();
      if ((v39 & 0x100000000) == 0)
        v37 = (double)(int)v39 / 255.0;
    }
    else
    {
      result = swift_bridgeObjectRelease();
    }
  }
  v40.i64[0] = v36;
  v40.i64[1] = v34;
  *(double *)a3 = v37;
  *(float64x2_t *)(a3 + 8) = vdivq_f64(vcvtq_f64_s64(vshrq_n_s64(vshlq_n_s64(v40, 0x20uLL), 0x20uLL)), (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL));
  *(double *)(a3 + 24) = (double)(int)v32 / 255.0;
  *(_BYTE *)(a3 + 32) = 0;
  return result;
}

Swift::String __swiftcall ColorDescriptor.hex()()
{
  double *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  Swift::String result;

  v2 = *v0;
  v1 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B02D78);
  v5 = v4 * 255.999999;
  v6 = *(_QWORD *)&v5 & 0x7FF0000000000000;
  if (v2 != 1.0)
  {
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_23C0557E0;
    if (v6 != 0x7FF0000000000000)
    {
      if (v5 > -9.22337204e18)
      {
        if (v5 < 9.22337204e18)
        {
          v13 = MEMORY[0x24BEE1768];
          v14 = MEMORY[0x24BEE17F0];
          *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE1768];
          *(_QWORD *)(v7 + 64) = v14;
          *(_QWORD *)(v7 + 32) = (uint64_t)v5;
          v15 = v3 * 255.999999;
          if ((~COERCE__INT64(v3 * 255.999999) & 0x7FF0000000000000) != 0)
          {
            if (v15 > -9.22337204e18)
            {
              if (v15 < 9.22337204e18)
              {
                *(_QWORD *)(v7 + 96) = v13;
                *(_QWORD *)(v7 + 104) = v14;
                *(_QWORD *)(v7 + 72) = (uint64_t)v15;
                v16 = v1 * 255.999999;
                if ((~COERCE__INT64(v1 * 255.999999) & 0x7FF0000000000000) != 0)
                {
                  if (v16 > -9.22337204e18)
                  {
                    if (v16 < 9.22337204e18)
                    {
                      *(_QWORD *)(v7 + 136) = v13;
                      *(_QWORD *)(v7 + 144) = v14;
                      *(_QWORD *)(v7 + 112) = (uint64_t)v16;
                      v17 = v2 * 255.999999;
                      if ((~COERCE__INT64(v2 * 255.999999) & 0x7FF0000000000000) != 0)
                      {
                        if (v17 > -9.22337204e18)
                        {
                          if (v17 < 9.22337204e18)
                          {
                            *(_QWORD *)(v7 + 176) = v13;
                            *(_QWORD *)(v7 + 184) = v14;
                            *(_QWORD *)(v7 + 152) = (uint64_t)v17;
                            goto LABEL_25;
                          }
LABEL_46:
                          __break(1u);
                          goto _$s13FitnessCoreUI15ColorDescriptorV3hexSSyF;
                        }
LABEL_45:
                        __break(1u);
                        goto LABEL_46;
                      }
LABEL_44:
                      __break(1u);
                      goto LABEL_45;
                    }
LABEL_43:
                    __break(1u);
                    goto LABEL_44;
                  }
LABEL_42:
                  __break(1u);
                  goto LABEL_43;
                }
LABEL_41:
                __break(1u);
                goto LABEL_42;
              }
LABEL_40:
              __break(1u);
              goto LABEL_41;
            }
LABEL_39:
            __break(1u);
            goto LABEL_40;
          }
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
LABEL_37:
        __break(1u);
        goto LABEL_38;
      }
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_23C0557F0;
  if (v6 == 0x7FF0000000000000)
  {
    __break(1u);
    goto LABEL_27;
  }
  if (v5 <= -9.22337204e18)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v5 >= 9.22337204e18)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v9 = MEMORY[0x24BEE1768];
  v10 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v7 + 64) = v10;
  *(_QWORD *)(v7 + 32) = (uint64_t)v5;
  v11 = v3 * 255.999999;
  if ((~COERCE__INT64(v3 * 255.999999) & 0x7FF0000000000000) == 0)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v11 <= -9.22337204e18)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (v11 >= 9.22337204e18)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  *(_QWORD *)(v7 + 96) = v9;
  *(_QWORD *)(v7 + 104) = v10;
  *(_QWORD *)(v7 + 72) = (uint64_t)v11;
  v12 = v1 * 255.999999;
  if ((~COERCE__INT64(v1 * 255.999999) & 0x7FF0000000000000) == 0)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (v12 <= -9.22337204e18)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (v12 >= 9.22337204e18)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  *(_QWORD *)(v7 + 136) = v9;
  *(_QWORD *)(v7 + 144) = v10;
  *(_QWORD *)(v7 + 112) = (uint64_t)v12;
LABEL_25:
  v7 = sub_23C054044();
_$s13FitnessCoreUI15ColorDescriptorV3hexSSyF:
  result._object = v8;
  result._countAndFlagsBits = v7;
  return result;
}

uint64_t sub_23C02C81C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  sub_23C02D1F4();
  swift_bridgeObjectRetain();
  v7 = sub_23C0540C8();
  v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v10 = HIBYTE(v8) & 0xF;
    v15 = v7;
    v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  v7 = sub_23C02CB8C();
  v12 = v11;
  swift_bridgeObjectRelease();
  v8 = v12;
  if ((v12 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = (unsigned __int8 *)sub_23C0542D8();
  }
LABEL_7:
  v13 = sub_23C02C90C(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13 | ((((unint64_t)v13 >> 32) & 1) << 32);
}

unsigned __int8 *sub_23C02C90C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned int v12;
  unsigned __int8 v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  uint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned int v28;
  unsigned int v29;
  char v30;
  uint64_t v31;
  unsigned __int8 v32;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v16 = a2 - 1;
      if (a2 != 1)
      {
        v17 = a3 + 87;
        if (a3 > 10)
        {
          v18 = a3 + 55;
        }
        else
        {
          v17 = 97;
          v18 = 65;
        }
        if (a3 <= 10)
          v19 = a3 + 48;
        else
          v19 = 58;
        if (result)
        {
          v8 = 0;
          v20 = result + 1;
          do
          {
            v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                v12 = 0;
                v13 = 1;
                if (v21 < 0x61 || v21 >= v17)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v22 = -87;
              }
              else
              {
                v22 = -55;
              }
            }
            else
            {
              v22 = -48;
            }
            v23 = (int)v8 * (uint64_t)(int)a3;
            if (v23 != (int)v23)
              goto LABEL_72;
            v24 = v21 + v22;
            v8 = v23 + v24;
            if (__OFADD__((_DWORD)v23, v24))
              goto LABEL_72;
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v26 = a3 + 55;
        }
        else
        {
          v25 = 97;
          v26 = 65;
        }
        if (a3 <= 10)
          v27 = a3 + 48;
        else
          v27 = 58;
        if (result)
        {
          v28 = 0;
          do
          {
            v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                v12 = 0;
                v13 = 1;
                if (v29 < 0x61 || v29 >= v25)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v30 = -87;
              }
              else
              {
                v30 = -55;
              }
            }
            else
            {
              v30 = -48;
            }
            v31 = (int)v28 * (uint64_t)(int)a3;
            if (v31 != (int)v31)
              goto LABEL_72;
            v32 = v29 + v30;
            v28 = v31 + v32;
            if (__OFADD__((_DWORD)v31, v32))
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          v8 = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            v14 = (int)v8 * (uint64_t)(int)a3;
            if (v14 != (int)v14)
              goto LABEL_72;
            v15 = v10 + v11;
            v8 = v14 - v15;
            if (__OFSUB__((_DWORD)v14, v15))
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23C02CB8C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_23C0540D4();
  v4 = sub_23C02CC08(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_23C02CC08(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_23C02CD4C(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_23C02CE38(v9, 0);
      v12 = sub_23C02CE9C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x242615628](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x242615628);
LABEL_9:
      sub_23C0542D8();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x242615628]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_23C02CD4C(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_23C02D0AC(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_23C02D0AC(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_23C0540A4();
  }
  __break(1u);
  return result;
}

_QWORD *sub_23C02CE38(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B02D88);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_23C02CE9C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_23C02D0AC(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_23C0540B0();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_23C0542D8();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_23C02D0AC(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_23C05408C();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_23C02D0AC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_23C0540BC();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x242615670](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_23C02D124(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t result;
  _QWORD v13[2];
  unsigned __int8 v14;

  if ((a4 & 0x1000000000000000) != 0)
  {
    LODWORD(result) = 0;
    v14 = 0;
    return result | ((unint64_t)v14 << 32) | (((a4 >> 60) & 1) << 40);
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    v13[0] = a3;
    v13[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    v11 = v13;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    v11 = (_QWORD *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    v11 = (_QWORD *)sub_23C0542D8();
  }
  result = sub_23C02D23C((uint64_t)v11, a1, a2, a3, a4, a5);
  if (!v5)
  {
    v14 = BYTE4(result) & 1;
    return result | ((unint64_t)v14 << 32) | (((a4 >> 60) & 1) << 40);
  }
  return result;
}

unint64_t sub_23C02D1F4()
{
  unint64_t result;

  result = qword_256B02D80;
  if (!qword_256B02D80)
  {
    result = MEMORY[0x242615EC8](MEMORY[0x24BEE1E20], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_256B02D80);
  }
  return result;
}

uint64_t sub_23C02D23C(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unsigned __int8 *v19;
  int v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned int v24;
  unsigned __int8 *v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  unsigned int v29;
  unsigned __int8 v30;
  uint64_t v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 *v36;
  uint64_t v37;
  unsigned int v38;
  char v39;
  uint64_t v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  unsigned int v45;
  char v46;
  uint64_t v47;
  unsigned __int8 v48;

  v10 = a2;
  v11 = result;
  v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0)
    LOBYTE(v12) = 1;
  v13 = 4 << v12;
  v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    result = sub_23C02D0AC(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      v15 = a2 >> 16;
      if (v14 != v13)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0)
    v16 = HIBYTE(a5) & 0xF;
  if (v16 < a2 >> 16)
    goto LABEL_104;
  result = sub_23C0540A4();
  v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    result = sub_23C02D0AC(v10, a4, a5);
    v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    result = sub_23C02D0AC(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0)
      goto LABEL_8;
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0)
    v17 = a4 & 0xFFFFFFFFFFFFLL;
  if (v17 < v10 >> 16)
    goto LABEL_100;
  if (v17 < a3 >> 16)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  result = sub_23C0540A4();
LABEL_21:
  v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_99;
  }
  if (v18 < v15)
  {
LABEL_99:
    __break(1u);
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11)
    v19 = 0;
  v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        v33 = a6 + 87;
        if (a6 > 10)
        {
          v34 = a6 + 55;
        }
        else
        {
          v33 = 97;
          v34 = 65;
        }
        if (a6 <= 10)
          v35 = a6 + 48;
        else
          v35 = 58;
        if (v19)
        {
          v24 = 0;
          v36 = v19 + 1;
          v37 = result - 1;
          do
          {
            v38 = *v36;
            if (v38 < 0x30 || v38 >= v35)
            {
              if (v38 < 0x41 || v38 >= v34)
              {
                v29 = 0;
                v30 = 1;
                if (v38 < 0x61 || v38 >= v33)
                  return v29 | ((unint64_t)v30 << 32);
                v39 = -87;
              }
              else
              {
                v39 = -55;
              }
            }
            else
            {
              v39 = -48;
            }
            v40 = (int)v24 * (uint64_t)(int)a6;
            if (v40 != (int)v40)
              goto LABEL_96;
            v41 = v38 + v39;
            v24 = v40 + v41;
            if (__OFADD__((_DWORD)v40, v41))
              goto LABEL_96;
            ++v36;
            --v37;
          }
          while (v37);
LABEL_94:
          v30 = 0;
          v29 = v24;
          return v29 | ((unint64_t)v30 << 32);
        }
        goto LABEL_95;
      }
      goto LABEL_96;
    }
    goto LABEL_103;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      v42 = a6 + 87;
      if (a6 > 10)
      {
        v43 = a6 + 55;
      }
      else
      {
        v42 = 97;
        v43 = 65;
      }
      if (a6 <= 10)
        v44 = a6 + 48;
      else
        v44 = 58;
      if (v19)
      {
        v24 = 0;
        while (1)
        {
          v45 = *v19;
          if (v45 < 0x30 || v45 >= v44)
          {
            if (v45 < 0x41 || v45 >= v43)
            {
              v29 = 0;
              v30 = 1;
              if (v45 < 0x61 || v45 >= v42)
                return v29 | ((unint64_t)v30 << 32);
              v46 = -87;
            }
            else
            {
              v46 = -55;
            }
          }
          else
          {
            v46 = -48;
          }
          v47 = (int)v24 * (uint64_t)(int)a6;
          if (v47 != (int)v47)
            goto LABEL_96;
          v48 = v45 + v46;
          v24 = v47 + v48;
          if (__OFADD__((_DWORD)v47, v48))
            goto LABEL_96;
          ++v19;
          if (!--result)
            goto LABEL_94;
        }
      }
      goto LABEL_95;
    }
LABEL_96:
    v29 = 0;
    v30 = 1;
    return v29 | ((unint64_t)v30 << 32);
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      v21 = a6 + 87;
      if (a6 > 10)
      {
        v22 = a6 + 55;
      }
      else
      {
        v21 = 97;
        v22 = 65;
      }
      if (a6 <= 10)
        v23 = a6 + 48;
      else
        v23 = 58;
      if (v19)
      {
        v24 = 0;
        v25 = v19 + 1;
        v26 = result - 1;
        while (1)
        {
          v27 = *v25;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              v29 = 0;
              v30 = 1;
              if (v27 < 0x61 || v27 >= v21)
                return v29 | ((unint64_t)v30 << 32);
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          v31 = (int)v24 * (uint64_t)(int)a6;
          if (v31 != (int)v31)
            goto LABEL_96;
          v32 = v27 + v28;
          v24 = v31 - v32;
          if (__OFSUB__((_DWORD)v31, v32))
            goto LABEL_96;
          ++v25;
          if (!--v26)
            goto LABEL_94;
        }
      }
LABEL_95:
      v29 = 0;
      v30 = 0;
      return v29 | ((unint64_t)v30 << 32);
    }
    goto LABEL_96;
  }
LABEL_102:
  __break(1u);
LABEL_103:
  __break(1u);
LABEL_104:
  __break(1u);
  return result;
}

BOOL TabItemStyle.shouldDisplaySystemImage.getter()
{
  unsigned __int8 *v0;

  return *v0 < 2u;
}

BOOL TabItemStyle.shouldDisplayTitle.getter()
{
  _BYTE *v0;

  return (*v0 & 1) == 0;
}

BOOL static TabItemStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C02D694()
{
  return 0;
}

uint64_t sub_23C02D6A0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_23C02D6CC(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23C02D6D8()
{
  sub_23C02DBD8();
  return sub_23C05456C();
}

uint64_t sub_23C02D700()
{
  sub_23C02DBD8();
  return sub_23C054578();
}

uint64_t sub_23C02D730()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6C6E4F6567616D69;
  if (*v0 != 1)
    v1 = 0x6C6E4F656C746974;
  if (*v0)
    return v1;
  else
    return 0x6974616D6F747561;
}

uint64_t sub_23C02D788@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C02E568(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C02D7AC(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23C02D7B8()
{
  sub_23C02DB0C();
  return sub_23C05456C();
}

uint64_t sub_23C02D7E0()
{
  sub_23C02DB0C();
  return sub_23C054578();
}

uint64_t sub_23C02D808()
{
  sub_23C02DB94();
  return sub_23C05456C();
}

uint64_t sub_23C02D830()
{
  sub_23C02DB94();
  return sub_23C054578();
}

uint64_t sub_23C02D858()
{
  sub_23C02DB50();
  return sub_23C05456C();
}

uint64_t sub_23C02D880()
{
  sub_23C02DB50();
  return sub_23C054578();
}

uint64_t TabItemStyle.encode(to:)(_QWORD *a1)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int v15;
  char *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B02D90);
  v22 = *(_QWORD *)(v4 - 8);
  v23 = v4;
  MEMORY[0x24BDAC7A8]();
  v21 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B02D98);
  v19 = *(_QWORD *)(v6 - 8);
  v20 = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B02DA0);
  v9 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B02DA8);
  v24 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C02DB0C();
  sub_23C054560();
  if (v15)
  {
    if (v15 == 1)
    {
      v26 = 1;
      sub_23C02DB94();
      sub_23C054428();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);
    }
    else
    {
      v27 = 2;
      sub_23C02DB50();
      v16 = v21;
      sub_23C054428();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v23);
    }
  }
  else
  {
    v25 = 0;
    sub_23C02DBD8();
    sub_23C054428();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v18);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v14, v12);
}

unint64_t sub_23C02DB0C()
{
  unint64_t result;

  result = qword_256B02DB0;
  if (!qword_256B02DB0)
  {
    result = MEMORY[0x242615EC8](&unk_23C055BEC, &type metadata for TabItemStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02DB0);
  }
  return result;
}

unint64_t sub_23C02DB50()
{
  unint64_t result;

  result = qword_256B02DB8;
  if (!qword_256B02DB8)
  {
    result = MEMORY[0x242615EC8](&unk_23C055B9C, &type metadata for TabItemStyle.TitleOnlyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02DB8);
  }
  return result;
}

unint64_t sub_23C02DB94()
{
  unint64_t result;

  result = qword_256B02DC0;
  if (!qword_256B02DC0)
  {
    result = MEMORY[0x242615EC8](&unk_23C055B4C, &type metadata for TabItemStyle.ImageOnlyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02DC0);
  }
  return result;
}

unint64_t sub_23C02DBD8()
{
  unint64_t result;

  result = qword_256B02DC8;
  if (!qword_256B02DC8)
  {
    result = MEMORY[0x242615EC8](&unk_23C055AFC, &type metadata for TabItemStyle.AutomaticCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02DC8);
  }
  return result;
}

uint64_t TabItemStyle.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  char *v12;
  _QWORD *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
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
  _BYTE *v38;
  char *v39;
  char *v40;
  _QWORD *v41;
  char v42;
  char v43;
  char v44;

  v38 = a2;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B02DD0);
  v34 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8]();
  v40 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B02DD8);
  v35 = *(_QWORD *)(v4 - 8);
  v36 = v4;
  MEMORY[0x24BDAC7A8]();
  v39 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B02DE0);
  v6 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B02DE8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C02DB0C();
  v13 = v41;
  sub_23C054554();
  if (v13)
    goto LABEL_7;
  v31 = v6;
  v32 = v10;
  v14 = v39;
  v15 = v40;
  v41 = a1;
  v16 = v12;
  v17 = sub_23C054410();
  v18 = v9;
  if (*(_QWORD *)(v17 + 16) != 1)
  {
    v23 = sub_23C0542CC();
    swift_allocError();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B02DF0);
    *v25 = &type metadata for TabItemStyle;
    sub_23C0543C8();
    sub_23C0542C0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x24BEE26D0], v23);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v9);
    a1 = v41;
LABEL_7:
    v26 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v26);
  }
  v19 = *(unsigned __int8 *)(v17 + 32);
  if (*(_BYTE *)(v17 + 32))
  {
    if (v19 == 1)
    {
      v43 = 1;
      sub_23C02DB94();
      v20 = v9;
      sub_23C0543BC();
      v21 = v38;
      v22 = v32;
      (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v36);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v20);
    }
    else
    {
      v44 = 2;
      sub_23C02DB50();
      v28 = v15;
      sub_23C0543BC();
      v21 = v38;
      v29 = v32;
      (*(void (**)(char *, uint64_t))(v34 + 8))(v28, v37);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v16, v18);
    }
  }
  else
  {
    v42 = 0;
    sub_23C02DBD8();
    sub_23C0543BC();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v33);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v9);
    v21 = v38;
  }
  *v21 = v19;
  v26 = (uint64_t)v41;
  return __swift_destroy_boxed_opaque_existential_1(v26);
}

uint64_t sub_23C02E060@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return TabItemStyle.init(from:)(a1, a2);
}

uint64_t sub_23C02E074(_QWORD *a1)
{
  return TabItemStyle.encode(to:)(a1);
}

uint64_t TabItemStyle.hash(into:)()
{
  return sub_23C054518();
}

uint64_t TabItemStyle.hashValue.getter()
{
  sub_23C05450C();
  sub_23C054518();
  return sub_23C054548();
}

unint64_t sub_23C02E0F8()
{
  unint64_t result;

  result = qword_256B02DF8;
  if (!qword_256B02DF8)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItemStyle, &type metadata for TabItemStyle);
    atomic_store(result, (unint64_t *)&qword_256B02DF8);
  }
  return result;
}

ValueMetadata *type metadata accessor for TabItemStyle()
{
  return &type metadata for TabItemStyle;
}

uint64_t getEnumTagSinglePayload for TabItem.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s13FitnessCoreUI12TabItemStyleOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C02E230 + 4 * byte_23C055805[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C02E264 + 4 * byte_23C055800[v4]))();
}

uint64_t sub_23C02E264(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C02E26C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C02E274);
  return result;
}

uint64_t sub_23C02E280(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C02E288);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C02E28C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C02E294(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TabItemStyle.CodingKeys()
{
  return &type metadata for TabItemStyle.CodingKeys;
}

ValueMetadata *type metadata accessor for TabItemStyle.AutomaticCodingKeys()
{
  return &type metadata for TabItemStyle.AutomaticCodingKeys;
}

ValueMetadata *type metadata accessor for TabItemStyle.ImageOnlyCodingKeys()
{
  return &type metadata for TabItemStyle.ImageOnlyCodingKeys;
}

ValueMetadata *type metadata accessor for TabItemStyle.TitleOnlyCodingKeys()
{
  return &type metadata for TabItemStyle.TitleOnlyCodingKeys;
}

unint64_t sub_23C02E2E4()
{
  unint64_t result;

  result = qword_256B02E00;
  if (!qword_256B02E00)
  {
    result = MEMORY[0x242615EC8](&unk_23C055AD4, &type metadata for TabItemStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02E00);
  }
  return result;
}

unint64_t sub_23C02E32C()
{
  unint64_t result;

  result = qword_256B02E08;
  if (!qword_256B02E08)
  {
    result = MEMORY[0x242615EC8](&unk_23C0559F4, &type metadata for TabItemStyle.AutomaticCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02E08);
  }
  return result;
}

unint64_t sub_23C02E374()
{
  unint64_t result;

  result = qword_256B02E10;
  if (!qword_256B02E10)
  {
    result = MEMORY[0x242615EC8](&unk_23C055A1C, &type metadata for TabItemStyle.AutomaticCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02E10);
  }
  return result;
}

unint64_t sub_23C02E3BC()
{
  unint64_t result;

  result = qword_256B02E18;
  if (!qword_256B02E18)
  {
    result = MEMORY[0x242615EC8](&unk_23C0559A4, &type metadata for TabItemStyle.ImageOnlyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02E18);
  }
  return result;
}

unint64_t sub_23C02E404()
{
  unint64_t result;

  result = qword_256B02E20;
  if (!qword_256B02E20)
  {
    result = MEMORY[0x242615EC8](&unk_23C0559CC, &type metadata for TabItemStyle.ImageOnlyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02E20);
  }
  return result;
}

unint64_t sub_23C02E44C()
{
  unint64_t result;

  result = qword_256B02E28;
  if (!qword_256B02E28)
  {
    result = MEMORY[0x242615EC8](&unk_23C055954, &type metadata for TabItemStyle.TitleOnlyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02E28);
  }
  return result;
}

unint64_t sub_23C02E494()
{
  unint64_t result;

  result = qword_256B02E30;
  if (!qword_256B02E30)
  {
    result = MEMORY[0x242615EC8](&unk_23C05597C, &type metadata for TabItemStyle.TitleOnlyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02E30);
  }
  return result;
}

unint64_t sub_23C02E4DC()
{
  unint64_t result;

  result = qword_256B02E38;
  if (!qword_256B02E38)
  {
    result = MEMORY[0x242615EC8](&unk_23C055A44, &type metadata for TabItemStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02E38);
  }
  return result;
}

unint64_t sub_23C02E524()
{
  unint64_t result;

  result = qword_256B02E40;
  if (!qword_256B02E40)
  {
    result = MEMORY[0x242615EC8](&unk_23C055A6C, &type metadata for TabItemStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02E40);
  }
  return result;
}

uint64_t sub_23C02E568(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0x6974616D6F747561 && a2 == 0xE900000000000063 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C6E4F6567616D69 && a2 == 0xE900000000000079 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6E4F656C746974 && a2 == 0xE900000000000079)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_23C054488();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t dispatch thunk of FloatingContentViewDelegate.animationAnchorView()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_23C02E6E8()
{
  uint64_t v0;

  v0 = sub_23C053D8C();
  __swift_allocate_value_buffer(v0, qword_256B0EF10);
  __swift_project_value_buffer(v0, (uint64_t)qword_256B0EF10);
  return sub_23C053D80();
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

double CGFloat.pixelIntegral(using:)(void *a1, double a2)
{
  double v3;

  if (a1)
  {
    objc_msgSend(a1, sel_displayScale);
    if (v3 > 0.0)
      return ceil(v3 * a2) / v3;
  }
  return a2;
}

CGSize __swiftcall CGSize.pixelIntegral(using:)(UITraitCollection using)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = v2;
  v4 = v1;
  -[objc_class displayScale](using.super.isa, sel_displayScale);
  if (v6 > 0.0)
    v4 = ceil(v6 * v4) / v6;
  -[objc_class displayScale](using.super.isa, sel_displayScale);
  if (v7 > 0.0)
    v3 = ceil(v7 * v3) / v7;
  v8 = v4;
  v9 = v3;
  result.height = v9;
  result.width = v8;
  return result;
}

uint64_t dispatch thunk of ArtworkProtocol.backgroundColor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ArtworkProtocol.templateURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

__n128 TabItem.sizeDescriptor.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v2;
  __n128 result;
  __int128 v4;

  v2 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(v1 + 32);
  v4 = *(_OWORD *)(v1 + 48);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t TabItem.systemImageName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TabItem.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23C02E8DC()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6D496D6574737973;
  if (*v0 != 1)
    v1 = 0x656C746974;
  if (*v0)
    return v1;
  else
    return 0x63736544657A6973;
}

uint64_t sub_23C02E94C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C02F678(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C02E970()
{
  sub_23C02EB68();
  return sub_23C05456C();
}

uint64_t sub_23C02E998()
{
  sub_23C02EB68();
  return sub_23C054578();
}

uint64_t TabItem.encode(to:)(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B02E48);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v15 = v1[1];
  v16 = v8;
  v14 = v1[2];
  v9 = *((_QWORD *)v1 + 6);
  v10 = *((_QWORD *)v1 + 7);
  v11 = *((_QWORD *)v1 + 8);
  v13[2] = *((_QWORD *)v1 + 9);
  v13[3] = v11;
  v13[1] = *((_QWORD *)v1 + 10);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C02EB68();
  sub_23C054560();
  v17 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v9;
  v21 = v10;
  v22 = 0;
  sub_23C02EBAC();
  sub_23C054464();
  if (!v2)
  {
    LOBYTE(v17) = 1;
    sub_23C054434();
    LOBYTE(v17) = 2;
    sub_23C054434();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23C02EB68()
{
  unint64_t result;

  result = qword_256B02E50;
  if (!qword_256B02E50)
  {
    result = MEMORY[0x242615EC8](&unk_23C055E10, &type metadata for TabItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02E50);
  }
  return result;
}

unint64_t sub_23C02EBAC()
{
  unint64_t result;

  result = qword_256B02E58;
  if (!qword_256B02E58)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItemSizeDescriptor, &type metadata for TabItemSizeDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B02E58);
  }
  return result;
}

uint64_t TabItem.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  _QWORD v26[8];
  char v27;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B02E60);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C02EB68();
  sub_23C054554();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v27 = 0;
  sub_23C02EE10();
  sub_23C054404();
  v9 = v26[0];
  v10 = v26[1];
  v11 = v26[2];
  v12 = v26[3];
  v13 = v26[4];
  v14 = v26[5];
  v15 = v26[6];
  v16 = v26[7];
  LOBYTE(v26[0]) = 1;
  v17 = sub_23C0543D4();
  v19 = v18;
  LOBYTE(v26[0]) = 2;
  swift_bridgeObjectRetain();
  v20 = sub_23C0543D4();
  v22 = v21;
  v23 = *(void (**)(char *, uint64_t))(v6 + 8);
  v24 = v20;
  v23(v8, v5);
  *a2 = v9;
  a2[1] = v10;
  a2[2] = v11;
  a2[3] = v12;
  a2[4] = v13;
  a2[5] = v14;
  a2[6] = v15;
  a2[7] = v16;
  a2[8] = v17;
  a2[9] = v19;
  a2[10] = v24;
  a2[11] = v22;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_23C02EE10()
{
  unint64_t result;

  result = qword_256B02E68;
  if (!qword_256B02E68)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItemSizeDescriptor, &type metadata for TabItemSizeDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B02E68);
  }
  return result;
}

uint64_t sub_23C02EE54@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return TabItem.init(from:)(a1, a2);
}

uint64_t sub_23C02EE68(_QWORD *a1)
{
  return TabItem.encode(to:)(a1);
}

uint64_t TabItem.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 88);
  sub_23C05453C();
  sub_23C05453C();
  sub_23C05453C();
  sub_23C05453C();
  NSDirectionalEdgeInsets.hash(into:)();
  if (v1)
  {
    sub_23C054524();
    swift_bridgeObjectRetain();
    sub_23C05405C();
    swift_bridgeObjectRelease();
    if (v2)
    {
LABEL_3:
      sub_23C054524();
      swift_bridgeObjectRetain();
      sub_23C05405C();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_23C054524();
    if (v2)
      goto LABEL_3;
  }
  return sub_23C054524();
}

uint64_t TabItem.hashValue.getter()
{
  sub_23C05450C();
  TabItem.hash(into:)();
  return sub_23C054548();
}

uint64_t sub_23C02F00C()
{
  sub_23C05450C();
  TabItem.hash(into:)();
  return sub_23C054548();
}

uint64_t sub_23C02F06C()
{
  sub_23C05450C();
  TabItem.hash(into:)();
  return sub_23C054548();
}

uint64_t sub_23C02F0C8()
{
  sub_23C05453C();
  return sub_23C05453C();
}

uint64_t _s13FitnessCoreUI7TabItemV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float64x2_t v11;
  float64x2_t v12;
  char v13;
  uint64_t result;
  float64x2_t v15[3];
  float64x2_t v16[3];

  if (*(double *)a1 != *(double *)a2 || *(double *)(a1 + 8) != *(double *)(a2 + 8))
    return 0;
  v4 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a2 + 64);
  v7 = *(_QWORD *)(a2 + 72);
  v10 = *(_QWORD *)(a2 + 80);
  v9 = *(_QWORD *)(a2 + 88);
  v11 = *(float64x2_t *)(a1 + 32);
  v16[0] = *(float64x2_t *)(a1 + 16);
  v16[1] = v11;
  v16[2] = *(float64x2_t *)(a1 + 48);
  v12 = *(float64x2_t *)(a2 + 32);
  v15[0] = *(float64x2_t *)(a2 + 16);
  v15[1] = v12;
  v15[2] = *(float64x2_t *)(a2 + 48);
  if ((_s13FitnessCoreUI11TabItemSizeV2eeoiySbAC_ACtFZ_0(v16, v15) & 1) == 0)
    return 0;
  if (!v3)
  {
    if (v7)
      return 0;
    goto LABEL_14;
  }
  if (!v7)
    return 0;
  if (v4 == v8 && v3 == v7 || (v13 = sub_23C054488(), result = 0, (v13 & 1) != 0))
  {
LABEL_14:
    if (v6)
    {
      if (v9 && (v5 == v10 && v6 == v9 || (sub_23C054488() & 1) != 0))
        return 1;
    }
    else if (!v9)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t sub_23C02F228()
{
  unint64_t result;

  result = qword_256B02E70;
  if (!qword_256B02E70)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItem, &type metadata for TabItem);
    atomic_store(result, (unint64_t *)&qword_256B02E70);
  }
  return result;
}

uint64_t destroy for TabItem()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TabItem(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  v5 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v5;
  v6 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for TabItem(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
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
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for TabItem(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TabItem(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 96))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 72);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TabItem(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 96) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 96) = 0;
    if (a2)
      *(_QWORD *)(result + 72) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for TabItem()
{
  return &type metadata for TabItem;
}

uint64_t storeEnumTagSinglePayload for TabItem.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C02F520 + 4 * byte_23C055C71[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C02F554 + 4 * asc_23C055C6C[v4]))();
}

uint64_t sub_23C02F554(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C02F55C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C02F564);
  return result;
}

uint64_t sub_23C02F570(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C02F578);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C02F57C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C02F584(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TabItem.CodingKeys()
{
  return &type metadata for TabItem.CodingKeys;
}

unint64_t sub_23C02F5A4()
{
  unint64_t result;

  result = qword_256B02E78;
  if (!qword_256B02E78)
  {
    result = MEMORY[0x242615EC8](&unk_23C055DE8, &type metadata for TabItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02E78);
  }
  return result;
}

unint64_t sub_23C02F5EC()
{
  unint64_t result;

  result = qword_256B02E80;
  if (!qword_256B02E80)
  {
    result = MEMORY[0x242615EC8](&unk_23C055D58, &type metadata for TabItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B02E80);
  }
  return result;
}

unint64_t sub_23C02F634()
{
  unint64_t result;

  result = qword_256B02E88[0];
  if (!qword_256B02E88[0])
  {
    result = MEMORY[0x242615EC8](&unk_23C055D80, &type metadata for TabItem.CodingKeys);
    atomic_store(result, qword_256B02E88);
  }
  return result;
}

uint64_t sub_23C02F678(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x63736544657A6973 && a2 == 0xEE00726F74706972;
  if (v2 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D496D6574737973 && a2 == 0xEF656D614E656761 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C054488();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t StandardArtworkDescriptor.artwork.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t StandardArtworkDescriptor.cropCode.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 36));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t StandardArtworkDescriptor.init(artwork:cropCode:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t result;
  _QWORD *v13;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(a6, a1, a4);
  result = type metadata accessor for StandardArtworkDescriptor(0, a4, a5, v11);
  v13 = (_QWORD *)(a6 + *(int *)(result + 36));
  *v13 = a2;
  v13[1] = a3;
  return result;
}

uint64_t type metadata accessor for StandardArtworkDescriptor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for StandardArtworkDescriptor);
}

BOOL sub_23C02F8D4(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_23C02F8E4()
{
  return sub_23C054518();
}

uint64_t sub_23C02F908(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6B726F77747261 && a2 == 0xE700000000000000;
  if (v2 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65646F43706F7263 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C054488();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C02F9F8()
{
  sub_23C05450C();
  sub_23C054518();
  return sub_23C054548();
}

uint64_t sub_23C02FA3C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65646F43706F7263;
  else
    return 0x6B726F77747261;
}

BOOL sub_23C02FA74(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23C02F8D4(*a1, *a2);
}

uint64_t sub_23C02FA88()
{
  return sub_23C02F9F8();
}

uint64_t sub_23C02FA98()
{
  return sub_23C02F8E4();
}

uint64_t sub_23C02FAA8()
{
  sub_23C05450C();
  sub_23C02F8E4();
  return sub_23C054548();
}

uint64_t sub_23C02FAEC()
{
  char *v0;

  return sub_23C02FA3C(*v0);
}

uint64_t sub_23C02FAFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C02F908(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C02FB28@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23C030898();
  *a1 = result;
  return result;
}

uint64_t sub_23C02FB50(uint64_t a1)
{
  MEMORY[0x242615EC8](&unk_23C056070, a1);
  return sub_23C05456C();
}

uint64_t sub_23C02FB84(uint64_t a1)
{
  MEMORY[0x242615EC8](&unk_23C056070, a1);
  return sub_23C054578();
}

uint64_t StandardArtworkDescriptor.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;

  v13 = a2;
  v5 = *(_QWORD *)(a2 + 24);
  v14 = *(_QWORD *)(a2 + 16);
  v6 = type metadata accessor for StandardArtworkDescriptor.CodingKeys(255, v14, v5, a4);
  MEMORY[0x242615EC8](&unk_23C056070, v6);
  v7 = sub_23C054470();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C054560();
  v17 = 0;
  v11 = v15;
  sub_23C054464();
  if (!v11)
  {
    v16 = 1;
    sub_23C054440();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t type metadata accessor for StandardArtworkDescriptor.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for StandardArtworkDescriptor.CodingKeys);
}

uint64_t StandardArtworkDescriptor.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  char v44;
  char v45;

  v35 = a4;
  v37 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8]();
  v39 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for StandardArtworkDescriptor.CodingKeys(255, v8, v9, v10);
  MEMORY[0x242615EC8](&unk_23C056070, v11);
  v42 = sub_23C05441C();
  v36 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v34 - v12;
  v41 = a2;
  v38 = a3;
  v15 = type metadata accessor for StandardArtworkDescriptor(0, a2, a3, v14);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8]();
  v18 = (char *)&v34 - v17;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v40 = v13;
  v19 = (uint64_t)v43;
  sub_23C054554();
  if (v19)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v34 = v16;
  v43 = a1;
  v20 = v18;
  v22 = v36;
  v21 = v37;
  v45 = 0;
  v23 = v39;
  v24 = v41;
  v25 = v42;
  v26 = v40;
  sub_23C054404();
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v20, v23, v24);
  v44 = 1;
  v27 = sub_23C0543E0();
  v28 = v26;
  v30 = v29;
  (*(void (**)(char *, uint64_t))(v22 + 8))(v28, v25);
  v31 = (uint64_t *)&v20[*(int *)(v15 + 36)];
  *v31 = v27;
  v31[1] = v30;
  v32 = v34;
  (*(void (**)(uint64_t, char *, uint64_t))(v34 + 16))(v35, v20, v15);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v20, v15);
}

uint64_t sub_23C02FFA0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return StandardArtworkDescriptor.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3);
}

uint64_t sub_23C02FFBC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return StandardArtworkDescriptor.encode(to:)(a1, a2, a3, a4);
}

uint64_t StandardArtworkDescriptor.hash(into:)()
{
  sub_23C053FFC();
  swift_bridgeObjectRetain();
  sub_23C05405C();
  return swift_bridgeObjectRelease();
}

uint64_t static StandardArtworkDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  if ((sub_23C054008() & 1) == 0)
    return 0;
  v9 = *(int *)(type metadata accessor for StandardArtworkDescriptor(0, a3, a4, v8) + 36);
  v10 = *(_QWORD *)(a1 + v9);
  v11 = *(_QWORD *)(a1 + v9 + 8);
  v12 = (_QWORD *)(a2 + v9);
  if (v10 == *v12 && v11 == v12[1])
    return 1;
  else
    return sub_23C054488();
}

uint64_t StandardArtworkDescriptor.hashValue.getter()
{
  sub_23C05450C();
  StandardArtworkDescriptor.hash(into:)();
  return sub_23C054548();
}

uint64_t sub_23C03010C()
{
  sub_23C05450C();
  StandardArtworkDescriptor.hash(into:)();
  return sub_23C054548();
}

void sub_23C03014C()
{
  JUMPOUT(0x242615EC8);
}

uint64_t sub_23C03015C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static StandardArtworkDescriptor.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24));
}

uint64_t sub_23C030168()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23C030170()
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

uint64_t *sub_23C0301E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v11 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v10 = *v11;
    v10[1] = v11[1];
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_23C0302A0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C0302E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23C030348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23C0303BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_23C030418(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23C030484(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v12 = *(_QWORD *)(((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8) + 8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_23C030500 + 4 * byte_23C055E60[v10]))();
  }
}

void sub_23C030584(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
    v9 = 0;
    if (a2 <= v6)
      goto LABEL_17;
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
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_23C030678()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x23C0306F0);
}

void sub_23C030680(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x23C030688);
  JUMPOUT(0x23C0306F0);
}

void sub_23C0306CC()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x23C0306F0);
}

void sub_23C0306D4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x23C0306F0);
}

uint64_t sub_23C0306DC(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a2)
    goto LABEL_6;
  if (a3 < 0x7FFFFFFF)
  {
    if (a2 < 0)
      JUMPOUT(0x23C0306E8);
    *(_QWORD *)(((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) = (a2 - 1);
LABEL_6:
    JUMPOUT(0x23C0306F0);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

uint64_t sub_23C030708()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t getEnumTagSinglePayload for TabItemSize.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_23C0307A0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C0307EC + 4 * byte_23C055E74[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C030820 + 4 * byte_23C055E6F[v4]))();
}

uint64_t sub_23C030820(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C030828(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C030830);
  return result;
}

uint64_t sub_23C03083C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C030844);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C030848(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C030850(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23C03085C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void sub_23C030868()
{
  JUMPOUT(0x242615EC8);
}

void sub_23C030878()
{
  JUMPOUT(0x242615EC8);
}

void sub_23C030888()
{
  JUMPOUT(0x242615EC8);
}

uint64_t sub_23C030898()
{
  return 2;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x242615E68](a1, v6, a5);
}

uint64_t ArtworkDescriptor.standardArtworkDescriptor.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = v3;
  v7 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = type metadata accessor for DynamicArtworkDescriptor(0, v7, v8, a2);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v23 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v15, v4, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = type metadata accessor for StandardArtworkDescriptor(0, v7, v8, v17);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a3, v15, v18);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v15, v9);
    v20 = &v13[*(int *)(v9 + 36)];
    v22 = type metadata accessor for StandardArtworkDescriptor(0, v7, v8, v21);
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(a3, v20, v22);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }
}

uint64_t sub_23C030A28(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x63696D616E7964 && a2 == 0xE700000000000000;
  if (v2 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x647261646E617473 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C054488();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C030B18(char a1)
{
  if ((a1 & 1) != 0)
    return 0x647261646E617473;
  else
    return 0x63696D616E7964;
}

uint64_t sub_23C030B50(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x7470697263736564 && a2 == 0xEA0000000000726FLL)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23C054488();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C030BE0()
{
  char *v0;

  return sub_23C030B18(*v0);
}

uint64_t sub_23C030BF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C030A28(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C030C1C(uint64_t a1)
{
  MEMORY[0x242615EC8](&unk_23C0564B0, a1);
  return sub_23C05456C();
}

uint64_t sub_23C030C50(uint64_t a1)
{
  MEMORY[0x242615EC8](&unk_23C0564B0, a1);
  return sub_23C054578();
}

uint64_t sub_23C030C84()
{
  return 1;
}

uint64_t sub_23C030C90()
{
  return sub_23C054518();
}

uint64_t sub_23C030CB8()
{
  return 0x7470697263736564;
}

uint64_t sub_23C030CD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C030B50(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C030D04@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23C030C84();
  *a1 = result & 1;
  return result;
}

uint64_t sub_23C030D30(uint64_t a1)
{
  MEMORY[0x242615EC8](&unk_23C056500, a1);
  return sub_23C05456C();
}

uint64_t sub_23C030D64(uint64_t a1)
{
  MEMORY[0x242615EC8](&unk_23C056500, a1);
  return sub_23C054578();
}

uint64_t sub_23C030D98()
{
  sub_23C05450C();
  sub_23C054518();
  return sub_23C054548();
}

uint64_t sub_23C030DD8()
{
  sub_23C05450C();
  sub_23C054518();
  return sub_23C054548();
}

uint64_t sub_23C030E14(uint64_t a1)
{
  MEMORY[0x242615EC8](&unk_23C056550, a1);
  return sub_23C05456C();
}

uint64_t sub_23C030E48(uint64_t a1)
{
  MEMORY[0x242615EC8](&unk_23C056550, a1);
  return sub_23C054578();
}

uint64_t ArtworkDescriptor.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v34[3];
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char v53;

  v7 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v8 = type metadata accessor for ArtworkDescriptor.StandardCodingKeys(255, v7, v6, a4);
  v41 = MEMORY[0x242615EC8](&unk_23C056550, v8);
  v42 = v8;
  v48 = sub_23C054470();
  v46 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v45 = (char *)v34 - v9;
  v47 = type metadata accessor for StandardArtworkDescriptor(0, v7, v6, v10);
  v44 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v43 = (char *)v34 - v11;
  v13 = type metadata accessor for ArtworkDescriptor.DynamicCodingKeys(255, v7, v6, v12);
  v34[1] = MEMORY[0x242615EC8](&unk_23C056500, v13);
  v34[2] = v13;
  v40 = sub_23C054470();
  v38 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v37 = (char *)v34 - v14;
  v39 = type metadata accessor for DynamicArtworkDescriptor(0, v7, v6, v15);
  v36 = *(_QWORD *)(v39 - 8);
  v16 = MEMORY[0x24BDAC7A8](v39);
  v35 = (char *)v34 - v17;
  v18 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for ArtworkDescriptor.CodingKeys(255, v7, v6, v21);
  MEMORY[0x242615EC8](&unk_23C0564B0, v22);
  v23 = sub_23C054470();
  v49 = *(_QWORD *)(v23 - 8);
  v50 = v23;
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)v34 - v24;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C054560();
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v51, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v27 = v43;
    v26 = v44;
    v28 = v47;
    (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v43, v20, v47);
    v53 = 1;
    v29 = v45;
    v30 = v50;
    sub_23C054428();
    MEMORY[0x242615EC8](&protocol conformance descriptor for StandardArtworkDescriptor<A>, v28);
    v31 = v48;
    sub_23C054464();
    v32 = v46;
  }
  else
  {
    v27 = v35;
    v26 = v36;
    v28 = v39;
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v35, v20, v39);
    v52 = 0;
    v29 = v37;
    v30 = v50;
    sub_23C054428();
    MEMORY[0x242615EC8](&protocol conformance descriptor for DynamicArtworkDescriptor<A>, v28);
    v31 = v40;
    sub_23C054464();
    v32 = v38;
  }
  (*(void (**)(char *, uint64_t))(v32 + 8))(v29, v31);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v25, v30);
}

uint64_t type metadata accessor for ArtworkDescriptor.StandardCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ArtworkDescriptor.StandardCodingKeys);
}

uint64_t type metadata accessor for ArtworkDescriptor.DynamicCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ArtworkDescriptor.DynamicCodingKeys);
}

uint64_t type metadata accessor for ArtworkDescriptor.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ArtworkDescriptor.CodingKeys);
}

uint64_t ArtworkDescriptor.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
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
  char v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t *v43;
  char *v44;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  __int128 v62;
  char *v63;
  char *v64;
  char *v65;
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
  char *v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  char *v89;

  v79 = a5;
  v78 = type metadata accessor for ArtworkDescriptor.StandardCodingKeys(255, a2, a3, a4);
  v76 = MEMORY[0x242615EC8](&unk_23C056550, v78);
  v70 = sub_23C05441C();
  v72 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  v80 = (char *)&v62 - v8;
  v10 = type metadata accessor for ArtworkDescriptor.DynamicCodingKeys(255, a2, a3, v9);
  v74 = MEMORY[0x242615EC8](&unk_23C056500, v10);
  v75 = v10;
  v69 = sub_23C05441C();
  v71 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v77 = (char *)&v62 - v11;
  v13 = type metadata accessor for ArtworkDescriptor.CodingKeys(255, a2, a3, v12);
  MEMORY[0x242615EC8](&unk_23C0564B0, v13);
  v83 = sub_23C05441C();
  v81 = *(_QWORD *)(v83 - 8);
  MEMORY[0x24BDAC7A8](v83);
  v15 = (char *)&v62 - v14;
  v84 = a2;
  v73 = a3;
  v82 = type metadata accessor for ArtworkDescriptor(0, a2, a3, v16);
  v68 = *(_QWORD *)(v82 - 8);
  v17 = MEMORY[0x24BDAC7A8](v82);
  v19 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v62 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v62 - v23;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v25 = v89;
  sub_23C054554();
  v26 = (uint64_t)a1;
  if (!v25)
  {
    v64 = v22;
    v65 = v19;
    v63 = v24;
    v27 = v84;
    v28 = v82;
    v66 = 0;
    v67 = v26;
    v29 = v83;
    v89 = v15;
    *(_QWORD *)&v85 = sub_23C054410();
    v30 = sub_23C054134();
    MEMORY[0x242615EC8](MEMORY[0x24BEE12C8], v30);
    *(_QWORD *)&v87 = sub_23C054260();
    *((_QWORD *)&v87 + 1) = v31;
    *(_QWORD *)&v88 = v32;
    *((_QWORD *)&v88 + 1) = v33;
    v34 = sub_23C054254();
    MEMORY[0x242615EC8](MEMORY[0x24BEE2190], v34);
    sub_23C0541E8();
    v35 = v85;
    if (v85 == 2 || (v62 = v87, v85 = v87, v86 = v88, (sub_23C0541F4() & 1) == 0))
    {
      v40 = sub_23C0542CC();
      swift_allocError();
      v41 = v29;
      v43 = v42;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B02DF0);
      *v43 = v28;
      v44 = v89;
      sub_23C0543C8();
      sub_23C0542C0();
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v40 - 8) + 104))(v43, *MEMORY[0x24BEE26D0], v40);
      swift_willThrow();
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v81 + 8))(v44, v41);
      goto LABEL_9;
    }
    if ((v35 & 1) != 0)
    {
      LOBYTE(v85) = 1;
      v46 = v89;
      v47 = v66;
      sub_23C0543BC();
      v49 = v29;
      v50 = v79;
      if (v47)
      {
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v81 + 8))(v46, v49);
        goto LABEL_9;
      }
      v55 = type metadata accessor for StandardArtworkDescriptor(0, v27, v73, v48);
      MEMORY[0x242615EC8](&protocol conformance descriptor for StandardArtworkDescriptor<A>, v55);
      v56 = v65;
      v57 = v70;
      v58 = v80;
      sub_23C054404();
      (*(void (**)(char *, uint64_t))(v72 + 8))(v58, v57);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v81 + 8))(v46, v49);
      v59 = v28;
      swift_storeEnumTagMultiPayload();
      v60 = *(void (**)(char *, char *, uint64_t))(v68 + 32);
      v61 = v63;
      v60(v63, v56, v28);
    }
    else
    {
      LOBYTE(v85) = 0;
      v36 = v77;
      v37 = v89;
      v38 = v66;
      sub_23C0543BC();
      if (v38)
      {
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v81 + 8))(v37, v29);
LABEL_9:
        v26 = v67;
        return __swift_destroy_boxed_opaque_existential_1(v26);
      }
      v51 = type metadata accessor for DynamicArtworkDescriptor(0, v27, v73, v39);
      MEMORY[0x242615EC8](&protocol conformance descriptor for DynamicArtworkDescriptor<A>, v51);
      v52 = v64;
      v53 = v69;
      sub_23C054404();
      v54 = v81;
      (*(void (**)(char *, uint64_t))(v71 + 8))(v36, v53);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v37, v29);
      v59 = v28;
      swift_storeEnumTagMultiPayload();
      v60 = *(void (**)(char *, char *, uint64_t))(v68 + 32);
      v61 = v63;
      v60(v63, v52, v28);
      v50 = v79;
    }
    v60(v50, v61, v59);
    goto LABEL_9;
  }
  return __swift_destroy_boxed_opaque_existential_1(v26);
}

uint64_t type metadata accessor for ArtworkDescriptor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ArtworkDescriptor);
}

uint64_t sub_23C03194C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, char *a4@<X8>)
{
  return ArtworkDescriptor.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3, a4);
}

uint64_t sub_23C031968(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ArtworkDescriptor.encode(to:)(a1, a2, a3, a4);
}

uint64_t ArtworkDescriptor.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = v4;
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a2 + 24);
  v10 = type metadata accessor for StandardArtworkDescriptor(0, v8, v9, a4);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v26 - v12;
  v15 = type metadata accessor for DynamicArtworkDescriptor(0, v8, v9, v14);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v26 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v21, v5, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v21, v10);
    sub_23C054518();
    StandardArtworkDescriptor.hash(into:)();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v19, v21, v15);
    sub_23C054518();
    DynamicArtworkDescriptor.hash(into:)(a1, v15, v24, v25);
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v19, v15);
  }
}

uint64_t static ArtworkDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t TupleTypeMetadata2;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  void (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v43 = a1;
  v44 = a2;
  v6 = type metadata accessor for StandardArtworkDescriptor(0, a3, a4, a4);
  v41 = *(_QWORD *)(v6 - 8);
  v42 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v37 = (char *)&v35 - v7;
  v9 = type metadata accessor for DynamicArtworkDescriptor(0, a3, a4, v8);
  v39 = *(_QWORD *)(v9 - 8);
  v40 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v36 = (char *)&v35 - v10;
  v12 = type metadata accessor for ArtworkDescriptor(0, a3, a4, v11);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v35 - v17;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v38 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v20 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v22 = (char *)&v35 - v21;
  v23 = (char *)&v35 + *(int *)(v20 + 48) - v21;
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v24((char *)&v35 - v21, v43, v12);
  v24(v23, v44, v12);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v24(v16, (uint64_t)v22, v12);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v26 = v41;
      v25 = v42;
      v27 = (uint64_t)v37;
      (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v37, v23, v42);
      v28 = static StandardArtworkDescriptor.== infix(_:_:)((uint64_t)v16, v27, a3, a4);
      v29 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
      v29(v27, v25);
      v29((uint64_t)v16, v25);
      goto LABEL_10;
    }
    (*(void (**)(char *, uint64_t))(v41 + 8))(v16, v42);
LABEL_7:
    v28 = 0;
    v13 = v38;
    v12 = TupleTypeMetadata2;
    goto LABEL_10;
  }
  v24(v18, (uint64_t)v22, v12);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, uint64_t))(v39 + 8))(v18, v40);
    goto LABEL_7;
  }
  v31 = v39;
  v30 = v40;
  v32 = (uint64_t)v36;
  (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v36, v23, v40);
  v28 = static DynamicArtworkDescriptor.== infix(_:_:)((uint64_t)v18, v32, a3, a4);
  v33 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
  v33(v32, v30);
  v33((uint64_t)v18, v30);
LABEL_10:
  (*(void (**)(char *, uint64_t))(v13 + 8))(v22, v12);
  return v28 & 1;
}

uint64_t ArtworkDescriptor.hashValue.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[72];

  sub_23C05450C();
  ArtworkDescriptor.hash(into:)((uint64_t)v5, a1, v2, v3);
  return sub_23C054548();
}

uint64_t sub_23C031E30(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[72];

  sub_23C05450C();
  ArtworkDescriptor.hash(into:)((uint64_t)v6, a2, v3, v4);
  return sub_23C054548();
}

uint64_t sub_23C031E70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static ArtworkDescriptor.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24));
}

void sub_23C031E7C()
{
  JUMPOUT(0x242615EC8);
}

uint64_t sub_23C031E8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  result = type metadata accessor for DynamicArtworkDescriptor(319, v4, v5, a4);
  if (v8 <= 0x3F)
  {
    result = type metadata accessor for StandardArtworkDescriptor(319, v4, v5, v7);
    if (v9 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_23C031F28(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  _QWORD *v23;
  _QWORD *v24;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  v8 = v7 & 0xF8 | 7;
  v9 = ~v8;
  v10 = *(_QWORD *)(v6 + 64);
  v11 = v10 + 7;
  v12 = ((v10 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v12 <= (((v7 & 0xF8) + 15) & ~v8) + v12)
    v13 = (((v7 & 0xF8) + 15) & ~v8) + v12;
  else
    v13 = ((v10 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if ((v7 & 0x1000F8) != 0 || (v13 | 1) > 0x18)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v15 + ((v8 + 16) & v9));
    swift_retain();
  }
  else
  {
    v16 = *((unsigned __int8 *)a2 + v13);
    if (v16 >= 2)
    {
      if (v13 <= 3)
        v17 = v13;
      else
        v17 = 4;
      __asm { BR              X14 }
    }
    if (v16 == 1)
    {
      (*(void (**)(uint64_t *, uint64_t *, _QWORD))(v6 + 16))(a1, a2, *(_QWORD *)(a3 + 16));
      v18 = (_QWORD *)(((unint64_t)v4 + v10 + 7) & 0xFFFFFFFFFFFFFFF8);
      v19 = (_QWORD *)(((unint64_t)a2 + v10 + 7) & 0xFFFFFFFFFFFFFFF8);
      *v18 = *v19;
      v18[1] = v19[1];
      *((_BYTE *)v4 + v13) = 1;
    }
    else
    {
      *a1 = *a2;
      v20 = ((unint64_t)a1 + 15) & v9;
      v21 = ((unint64_t)a2 + 15) & v9;
      v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
      swift_bridgeObjectRetain();
      v22(v20, v21, v5);
      v23 = (_QWORD *)((v11 + v20) & 0xFFFFFFFFFFFFFFF8);
      v24 = (_QWORD *)((v11 + v21) & 0xFFFFFFFFFFFFFFF8);
      *v23 = *v24;
      v23[1] = v24[1];
      *((_BYTE *)v4 + v13) = 0;
    }
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_23C0320E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  uint64_t v11;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_DWORD *)(v4 + 80) & 0xF8;
  v6 = v5 | 7;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  v9 = ((v5 + 15) & ~(v5 | 7)) + v8;
  if (v8 > v9)
    v9 = ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  v10 = *(unsigned __int8 *)(a1 + v9);
  if (v10 >= 2)
  {
    if (v9 <= 3)
      v11 = v9;
    else
      v11 = 4;
    __asm { BR              X13 }
  }
  if (v10 == 1)
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 8))(a1, *(_QWORD *)(a2 + 16));
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))((a1 + v6 + 8) & ~v6, v3);
  }
  return swift_bridgeObjectRelease();
}

_QWORD *sub_23C032214(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  _QWORD *v22;
  _QWORD *v23;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80) & 0xF8;
  v8 = v7 | 7;
  v9 = *(_QWORD *)(v6 + 64);
  v10 = v9 + 7;
  v11 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  v12 = ((v7 + 15) & ~(v7 | 7)) + v11;
  if (v11 <= v12)
    v13 = v12;
  else
    v13 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  v14 = *((unsigned __int8 *)a2 + v13);
  if (v14 >= 2)
  {
    if (v13 <= 3)
      v15 = v13;
    else
      v15 = 4;
    __asm { BR              X14 }
  }
  if (v14 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, _QWORD))(v6 + 16))(a1, a2, *(_QWORD *)(a3 + 16));
    v16 = (_QWORD *)(((unint64_t)a1 + v9 + 7) & 0xFFFFFFFFFFFFFFF8);
    v17 = (_QWORD *)(((unint64_t)a2 + v9 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v16 = *v17;
    v16[1] = v17[1];
    v18 = 1;
  }
  else
  {
    *a1 = *a2;
    v19 = ((unint64_t)a1 + v8 + 8) & ~v8;
    v20 = ((unint64_t)a2 + v8 + 8) & ~v8;
    v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    swift_bridgeObjectRetain();
    v21(v19, v20, v5);
    v18 = 0;
    v22 = (_QWORD *)((v10 + v19) & 0xFFFFFFFFFFFFFFF8);
    v23 = (_QWORD *)((v10 + v20) & 0xFFFFFFFFFFFFFFF8);
    *v22 = *v23;
    v22[1] = v23[1];
  }
  swift_bridgeObjectRetain();
  *((_BYTE *)a1 + v13) = v18;
  return a1;
}

_QWORD *sub_23C0323AC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  char v21;
  uint64_t v22;
  void (*v23)(unint64_t, uint64_t, uint64_t);
  _QWORD *v24;
  _QWORD *v25;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_DWORD *)(v6 + 80) & 0xF8;
    v8 = v7 | 7;
    v9 = *(_QWORD *)(v6 + 64);
    v10 = v9 + 7;
    v11 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    v12 = ((v7 + 15) & ~(v7 | 7)) + v11;
    if (v11 <= v12)
      v13 = v12;
    else
      v13 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    v14 = *((unsigned __int8 *)a1 + v13);
    if (v14 >= 2)
    {
      if (v13 <= 3)
        v15 = v13;
      else
        v15 = 4;
      __asm { BR              X12 }
    }
    v16 = ~v8;
    if (v14 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    }
    else
    {
      swift_bridgeObjectRelease();
      (*(void (**)(unint64_t, uint64_t))(v6 + 8))(((unint64_t)a1 + v8 + 8) & v16, v5);
    }
    swift_bridgeObjectRelease();
    v17 = *((unsigned __int8 *)a2 + v13);
    if (v17 >= 2)
    {
      if (v13 <= 3)
        v18 = v13;
      else
        v18 = 4;
      __asm { BR              X12 }
    }
    if (v17 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
      v19 = (_QWORD *)(((unint64_t)a1 + v9 + 7) & 0xFFFFFFFFFFFFFFF8);
      v20 = (_QWORD *)(((unint64_t)a2 + v9 + 7) & 0xFFFFFFFFFFFFFFF8);
      *v19 = *v20;
      v19[1] = v20[1];
      v21 = 1;
    }
    else
    {
      *a1 = *a2;
      v22 = ((unint64_t)a2 + v8 + 8) & v16;
      v23 = *(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 16);
      swift_bridgeObjectRetain();
      v23(((unint64_t)a1 + v8 + 8) & v16, v22, v5);
      v21 = 0;
      v24 = (_QWORD *)((v10 + (((unint64_t)a1 + v8 + 8) & v16)) & 0xFFFFFFFFFFFFFFF8);
      v25 = (_QWORD *)((v10 + v22) & 0xFFFFFFFFFFFFFFF8);
      *v24 = *v25;
      v24[1] = v25[1];
    }
    *((_BYTE *)a1 + v13) = v21;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *sub_23C032650(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_DWORD *)(v5 + 80) & 0xF8;
  v7 = v6 | 7;
  v8 = *(_QWORD *)(v5 + 64);
  v9 = v8 + 7;
  v10 = ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  v11 = ((v6 + 15) & ~(v6 | 7)) + v10;
  if (v10 <= v11)
    v12 = v11;
  else
    v12 = ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  v13 = *((unsigned __int8 *)a2 + v12);
  if (v13 >= 2)
  {
    if (v12 <= 3)
      v14 = v12;
    else
      v14 = 4;
    __asm { BR              X14 }
  }
  if (v13 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *))(v5 + 32))(a1, a2);
    v15 = (uint64_t)a1 + v8 + 7;
    v16 = (uint64_t)a2 + v8 + 7;
    v17 = 1;
  }
  else
  {
    *a1 = *a2;
    v18 = ((unint64_t)a1 + v7 + 8) & ~v7;
    v19 = ((unint64_t)a2 + v7 + 8) & ~v7;
    (*(void (**)(uint64_t, uint64_t))(v5 + 32))(v18, v19);
    v17 = 0;
    v15 = v9 + v18;
    v16 = v9 + v19;
  }
  *(_OWORD *)(v15 & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(v16 & 0xFFFFFFFFFFFFF8);
  *((_BYTE *)a1 + v12) = v17;
  return a1;
}

_QWORD *sub_23C0327B0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_DWORD *)(v6 + 80) & 0xF8;
    v8 = v7 | 7;
    v9 = *(_QWORD *)(v6 + 64);
    v10 = v9 + 7;
    v11 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    v12 = ((v7 + 15) & ~(v7 | 7)) + v11;
    if (v11 <= v12)
      v13 = v12;
    else
      v13 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    v14 = *((unsigned __int8 *)a1 + v13);
    if (v14 >= 2)
    {
      if (v13 <= 3)
        v15 = v13;
      else
        v15 = 4;
      __asm { BR              X12 }
    }
    v16 = ~v8;
    if (v14 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    }
    else
    {
      swift_bridgeObjectRelease();
      (*(void (**)(unint64_t, uint64_t))(v6 + 8))(((unint64_t)a1 + v8 + 8) & v16, v5);
    }
    swift_bridgeObjectRelease();
    v17 = *((unsigned __int8 *)a2 + v13);
    if (v17 >= 2)
    {
      if (v13 <= 3)
        v18 = v13;
      else
        v18 = 4;
      __asm { BR              X12 }
    }
    if (v17 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
      v19 = (uint64_t)a1 + v9 + 7;
      v20 = (uint64_t)a2 + v9 + 7;
      v21 = 1;
    }
    else
    {
      *a1 = *a2;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 32))(((unint64_t)a1 + v8 + 8) & v16, ((unint64_t)a2 + v8 + 8) & v16, v5);
      v21 = 0;
      v19 = v10 + (((unint64_t)a1 + v8 + 8) & v16);
      v20 = v10 + (((unint64_t)a2 + v8 + 8) & v16);
    }
    *(_OWORD *)(v19 & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(v20 & 0xFFFFFFFFFFFFF8);
    *((_BYTE *)a1 + v13) = v21;
  }
  return a1;
}

uint64_t sub_23C032A2C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v9;
  unsigned int v10;

  v3 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v4 = *(_DWORD *)(v3 + 80) & 0xF8;
  v5 = ((*(_QWORD *)(v3 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  v6 = ((unsigned __int16)(v4 + 15) & (unsigned __int16)~(_WORD)v4 & 0x1F8) + v5;
  if (v5 <= v6)
    v5 = v6;
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_18;
  v7 = v5 | 1;
  if ((v5 | 1) <= 3)
  {
    v9 = (a2 + ~(-1 << (8 * (v5 | 1))) - 254) >> (8 * (v5 | 1));
    if (v9 > 0xFFFE)
    {
      if (!*(_DWORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_14;
    }
    if (v9 > 0xFE)
    {
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_14;
    }
    if (!v9)
    {
LABEL_18:
      v10 = *(unsigned __int8 *)(a1 + v5);
      if (v10 >= 2)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_14:
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_23C032B04 + 4 * byte_23C0560F8[(v7 - 1)]))();
}

void sub_23C032B50(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  size_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_DWORD *)(v5 + 80) & 0xF8;
  v7 = ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  v8 = ((unsigned __int16)(v6 + 15) & (unsigned __int16)~(_WORD)v6 & 0x1F8) + v7;
  if (v7 <= v8)
    v7 = v8;
  v9 = v7 | 1;
  if (a3 < 0xFF)
  {
    v10 = 0;
  }
  else if (v9 <= 3)
  {
    v12 = (a3 + ~(-1 << (8 * v9)) - 254) >> (8 * v9);
    if (v12 > 0xFFFE)
    {
      v10 = 4u;
    }
    else if (v12 >= 0xFF)
    {
      v10 = 2;
    }
    else
    {
      v10 = v12 != 0;
    }
  }
  else
  {
    v10 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v11 = a2 - 255;
  if (v9 < 4)
  {
    v13 = v11 & ~(-1 << (8 * v9));
    bzero(a1, v9);
    if ((_DWORD)v9 == 1)
    {
      *a1 = v13;
    }
    else
    {
      *(_WORD *)a1 = v13;
      a1[2] = BYTE2(v13);
    }
  }
  else
  {
    bzero(a1, v7 | 1);
    *(_DWORD *)a1 = v11;
  }
  __asm { BR              X10 }
}

uint64_t sub_23C032D04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_DWORD *)(v2 + 80) & 0xF8;
  v4 = ((*(_QWORD *)(v2 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  v5 = ((unsigned __int16)(v3 + 15) & (unsigned __int16)~(_WORD)v3 & 0x1F8) + v4;
  if (v4 > v5)
    v5 = v4;
  if (*(unsigned __int8 *)(a1 + v5) < 2u)
    return *(unsigned __int8 *)(a1 + v5);
  if (v5 <= 3)
    v6 = v5;
  else
    v6 = 4;
  return ((uint64_t (*)(void))((char *)&loc_23C032D6C + 4 * byte_23C056106[v6]))();
}

void sub_23C032DB4(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  size_t v9;
  size_t v10;
  unsigned int v11;
  unsigned int v12;
  int v13;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (a2 > 1)
  {
    v7 = *(_DWORD *)(v4 + 80) & 0xF8;
    v8 = ((*(_QWORD *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    v9 = ((unsigned __int16)(v7 + 15) & (unsigned __int16)~(_WORD)v7 & 0x1F8) + v8;
    if (v8 <= v9)
      v10 = v9;
    else
      v10 = v8;
    v11 = a2 - 2;
    if (v10 < 4)
    {
      v12 = v11 >> (8 * v10);
      v13 = v11 & ~(-1 << (8 * v10));
      a1[v10] = v12 + 2;
      bzero(a1, v10);
      if ((_DWORD)v10 == 3)
      {
        *(_WORD *)a1 = v13;
        a1[2] = BYTE2(v13);
      }
      else if ((_DWORD)v10 == 2)
      {
        *(_WORD *)a1 = v13;
      }
      else
      {
        *a1 = v13;
      }
    }
    else
    {
      a1[v10] = 2;
      bzero(a1, v10);
      *(_DWORD *)a1 = v11;
    }
  }
  else
  {
    v5 = ((*(_QWORD *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    v6 = ((unsigned __int16)((*(_WORD *)(v4 + 80) & 0xF8) + 15) & (unsigned __int16)~(*(_WORD *)(v4 + 80) & 0xF8) & 0x1F8)
       + v5;
    if (v5 > v6)
      v6 = v5;
    a1[v6] = a2;
  }
}

uint64_t sub_23C032ECC(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C032F18 + 4 * byte_23C056110[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C032F4C + 4 * byte_23C05610B[v4]))();
}

uint64_t sub_23C032F4C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C032F54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C032F5CLL);
  return result;
}

uint64_t sub_23C032F68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C032F70);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C032F74(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C032F7C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C032F94()
{
  return 0;
}

uint64_t _s13FitnessCoreUI13FloatingErrorOwet_0(unsigned int *a1, int a2)
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

uint64_t sub_23C032FEC(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C03302C + 4 * byte_23C056115[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C03304C + 4 * byte_23C05611A[v4]))();
}

_BYTE *sub_23C03302C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C03304C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C033054(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C03305C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C033064(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C03306C(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_23C033078()
{
  JUMPOUT(0x242615EC8);
}

void sub_23C033088()
{
  JUMPOUT(0x242615EC8);
}

void sub_23C033098()
{
  JUMPOUT(0x242615EC8);
}

void sub_23C0330A8()
{
  JUMPOUT(0x242615EC8);
}

void sub_23C0330B8()
{
  JUMPOUT(0x242615EC8);
}

void sub_23C0330C8()
{
  JUMPOUT(0x242615EC8);
}

void sub_23C0330D8()
{
  JUMPOUT(0x242615EC8);
}

void sub_23C0330E8()
{
  JUMPOUT(0x242615EC8);
}

void sub_23C0330F8()
{
  JUMPOUT(0x242615EC8);
}

uint64_t SizeClass.init(_:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  void (*v12)(char *, uint64_t, uint64_t);
  char v13;
  uint64_t v14;

  v4 = sub_23C053F48();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v14 - v9;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4) == 1)
  {
    result = sub_23C033250(a1);
LABEL_8:
    v13 = 2;
    goto LABEL_9;
  }
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  v12(v10, a1, v4);
  v12(v8, (uint64_t)v10, v4);
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
  if ((_DWORD)result == *MEMORY[0x24BDEFEE8])
  {
    v13 = 0;
  }
  else
  {
    if ((_DWORD)result != *MEMORY[0x24BDEFEF0])
    {
      result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      goto LABEL_8;
    }
    v13 = 1;
  }
LABEL_9:
  *a2 = v13;
  return result;
}

uint64_t sub_23C033250(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03190);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_23C033428(uint64_t a1, uint64_t a2)
{
  char *v2;
  void *v5;
  char *v6;
  id v7;
  id v8;
  double v9;
  double *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  objc_class *v17;
  id v18;
  objc_super v20;
  _QWORD v21[3];
  uint64_t v22;

  *(_QWORD *)&v2[OBJC_IVAR____TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer_dragCoordinator + 8] = 0;
  swift_unknownObjectWeakInit();
  v5 = (void *)objc_opt_self();
  v6 = v2;
  v7 = objc_msgSend(v5, sel_currentDevice);
  v8 = objc_msgSend(v7, sel_userInterfaceIdiom);

  v9 = -70.0;
  if (v8 == (id)1)
    v9 = -25.0;
  v10 = (double *)&v6[OBJC_IVAR____TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer_additionalTouchInsets];
  *v10 = v9;
  v10[1] = v9;
  v10[2] = v9;
  v10[3] = v9;

  sub_23C033690(a1, (uint64_t)v21);
  v11 = v22;
  if (v22)
  {
    v12 = __swift_project_boxed_opaque_existential_1(v21, v22);
    v13 = *(_QWORD *)(v11 - 8);
    MEMORY[0x24BDAC7A8](v12);
    v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    v16 = sub_23C05447C();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  }
  else
  {
    v16 = 0;
  }
  v17 = (objc_class *)type metadata accessor for ContinuousSelectionGestureRecognizer();
  v20.receiver = v6;
  v20.super_class = v17;
  v18 = objc_msgSendSuper2(&v20, sel_initWithTarget_action_, v16, a2);
  swift_unknownObjectRelease();
  sub_23C0336D8(a1);
  return v18;
}

id sub_23C033630()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContinuousSelectionGestureRecognizer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ContinuousSelectionGestureRecognizer()
{
  return objc_opt_self();
}

uint64_t sub_23C033690(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B031D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C0336D8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B031D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_23C033718(uint64_t a1)
{
  char *v1;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unsigned __int8 v16;
  id result;
  uint64_t v18;
  CGPoint v19;
  CGRect v20;

  v3 = objc_msgSend(v1, sel_view);
  objc_msgSend(v1, sel_locationInView_, v3);
  v5 = v4;
  v7 = v6;

  v8 = MEMORY[0x242616000](&v1[OBJC_IVAR____TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer_dragCoordinator]);
  if (v8)
  {
    v9 = *(_BYTE *)(v8 + OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_selectionShouldFollowGesture);
    swift_unknownObjectRelease();
    if ((v9 & 1) == 0)
    {
      v10 = objc_msgSend(v1, sel_view);
      if (v10)
      {
        v11 = v10;
        objc_msgSend(v10, sel_bounds);
        v20.origin.x = UIEdgeInsetsInsetRect(v12, v13, v14, v15, *(double *)&v1[OBJC_IVAR____TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer_additionalTouchInsets], *(double *)&v1[OBJC_IVAR____TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer_additionalTouchInsets+ 8]);
        v19.x = v5;
        v19.y = v7;
        if (CGRectContainsPoint(v20, v19))
        {

          goto LABEL_7;
        }
        v16 = objc_msgSend(v11, sel_pointInside_withEvent_, a1, v5, v7);

        if ((v16 & 1) != 0)
          goto LABEL_7;
      }
      if (objc_msgSend(v1, sel_state))
        v18 = 4;
      else
        v18 = 5;
      return objc_msgSend(v1, sel_setState_, v18);
    }
  }
LABEL_7:
  if (objc_msgSend(v1, sel_state) == (id)1 || (result = objc_msgSend(v1, sel_state), result == (id)2))
  {
    v18 = 2;
    return objc_msgSend(v1, sel_setState_, v18);
  }
  return result;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t sub_23C0338B4(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

double DelayedLoadingView.init(message:delayDuration:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, double *a5@<X8>)
{
  double result;
  double v11;
  uint64_t v12;

  sub_23C053FB4();
  result = v11;
  *a5 = v11;
  *((_QWORD *)a5 + 1) = v12;
  *((_QWORD *)a5 + 2) = a1;
  *((_QWORD *)a5 + 3) = a2;
  *((_QWORD *)a5 + 4) = a3;
  *((_QWORD *)a5 + 5) = a4;
  return result;
}

uint64_t DelayedLoadingView.body.getter@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t (*v15)();
  __int128 v16;
  uint64_t (**v17)();
  _OWORD *v18;
  __int128 v19;
  _QWORD *v20;
  _BYTE v22[16];
  __int128 *v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B031D8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v22[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B031E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v22[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B031E8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = &v22[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = v1[1];
  v26 = *v1;
  v27 = v13;
  v28 = v1[2];
  v23 = &v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B031F0);
  sub_23C033C30();
  sub_23C053E34();
  v24 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03200);
  sub_23C053FC0();
  v14 = v25;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 16))(v9, v6, v3);
  *(_QWORD *)&v9[*(int *)(v7 + 36)] = v14;
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  v15 = (uint64_t (*)())swift_allocObject();
  v16 = v27;
  *((_OWORD *)v15 + 1) = v26;
  *((_OWORD *)v15 + 2) = v16;
  *((_OWORD *)v15 + 3) = v28;
  sub_23C0342B4((uint64_t)v9, (uint64_t)v12, &qword_256B031E0);
  v17 = (uint64_t (**)())&v12[*(int *)(v10 + 36)];
  *v17 = sub_23C033DBC;
  v17[1] = v15;
  v17[2] = 0;
  v17[3] = 0;
  sub_23C033DC4((uint64_t)&v26);
  sub_23C034760((uint64_t)v9, &qword_256B031E0);
  v18 = (_OWORD *)swift_allocObject();
  v19 = v27;
  v18[1] = v26;
  v18[2] = v19;
  v18[3] = v28;
  sub_23C0342B4((uint64_t)v12, a1, &qword_256B031E8);
  v20 = (_QWORD *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B03208) + 36));
  *v20 = 0;
  v20[1] = 0;
  v20[2] = sub_23C03426C;
  v20[3] = v18;
  sub_23C033DC4((uint64_t)&v26);
  return sub_23C034760((uint64_t)v12, &qword_256B031E8);
}

uint64_t sub_23C033BC4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[16];
  uint64_t v8;
  uint64_t v9;

  sub_23C034BDC(a1 + 16, (uint64_t)v7);
  sub_23C034BDC((uint64_t)v7, (uint64_t)&v8);
  v4 = v8;
  v3 = v9;
  v5 = MEMORY[0x24BEE4AF8];
  if (!v9)
  {
    v4 = 0;
    v5 = 0;
  }
  *a2 = v4;
  a2[1] = v3;
  a2[2] = 0;
  a2[3] = v5;
  return sub_23C034C24((uint64_t)v7);
}

uint64_t sub_23C033C28@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_23C033BC4(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_23C033C30()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256B031F8;
  if (!qword_256B031F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B031F0);
    v2 = MEMORY[0x24BDF1F80];
    result = MEMORY[0x242615EC8](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256B031F8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242615EBC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23C033CD0(_OWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03230);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23C054188();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  sub_23C054170();
  sub_23C033DC4((uint64_t)a1);
  v6 = sub_23C054164();
  v7 = swift_allocObject();
  v8 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v8;
  v9 = a1[1];
  *(_OWORD *)(v7 + 32) = *a1;
  *(_OWORD *)(v7 + 48) = v9;
  *(_OWORD *)(v7 + 64) = a1[2];
  sub_23C0340F0((uint64_t)v4, (uint64_t)&unk_256B03240, v7);
  return swift_release();
}

uint64_t sub_23C033DBC()
{
  uint64_t v0;

  return sub_23C033CD0((_OWORD *)(v0 + 16));
}

uint64_t sub_23C033DC4(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_23C033DF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[2] = a4;
  v5 = sub_23C054338();
  v4[3] = v5;
  v4[4] = *(_QWORD *)(v5 - 8);
  v4[5] = swift_task_alloc();
  sub_23C054170();
  v4[6] = sub_23C054164();
  v4[7] = sub_23C054158();
  v4[8] = v6;
  return swift_task_switch();
}

uint64_t sub_23C033E8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  v1 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v1 + 32);
  v2 = *(_QWORD *)(v1 + 40);
  sub_23C05432C();
  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_256B03258 + dword_256B03258);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v4;
  *v4 = v0;
  v4[1] = sub_23C033F14;
  return v6(v3, v2, 0, 0, 1);
}

uint64_t sub_23C033F14()
{
  void *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  v4 = v2[4];
  v3 = v2[5];
  v5 = v2[3];
  if (v0)
  {

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 8))(v2[5], v2[3]);
  }
  return swift_task_switch();
}

uint64_t sub_23C033FB8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_release();
  sub_23C053FD8();
  *(_QWORD *)(swift_task_alloc() + 16) = v1;
  sub_23C053E64();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C034054()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_release();
  sub_23C053FD8();
  *(_QWORD *)(swift_task_alloc() + 16) = v1;
  sub_23C053E64();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C0340F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23C054188();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23C05417C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23C034760(a1, &qword_256B03230);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23C054158();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C03426C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03200);
  return sub_23C053FCC();
}

uint64_t sub_23C0342B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23C0342F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C034310()
{
  return sub_23C053F9C();
}

uint64_t destroy for DelayedLoadingView()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DelayedLoadingView(uint64_t a1, uint64_t a2)
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
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for DelayedLoadingView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for DelayedLoadingView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for DelayedLoadingView(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DelayedLoadingView(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DelayedLoadingView()
{
  return &type metadata for DelayedLoadingView;
}

uint64_t sub_23C034548()
{
  return sub_23C0345A0(&qword_256B03210, &qword_256B03208, sub_23C03457C, MEMORY[0x24BDF0910]);
}

uint64_t sub_23C03457C()
{
  return sub_23C0345A0(&qword_256B03218, &qword_256B031E8, sub_23C034608, MEMORY[0x24BDF0910]);
}

uint64_t sub_23C0345A0(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x242615EC8](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C034608()
{
  return sub_23C0345A0(&qword_256B03220, &qword_256B031E0, (uint64_t (*)(void))sub_23C03462C, MEMORY[0x24BDECC38]);
}

unint64_t sub_23C03462C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B03228;
  if (!qword_256B03228)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B031D8);
    result = MEMORY[0x242615EC8](MEMORY[0x24BDEBC00], v1);
    atomic_store(result, (unint64_t *)&qword_256B03228);
  }
  return result;
}

uint64_t sub_23C034678()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C0346AC(uint64_t a1)
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
  v6[1] = sub_23C034718;
  return sub_23C033DF8(a1, v4, v5, v1 + 32);
}

uint64_t sub_23C034718()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23C034760(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23C03479C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C034800;
  return v6(a1);
}

uint64_t sub_23C034800()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23C03484C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C034870(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23C034718;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256B03248 + dword_256B03248))(a1, v4);
}

uint64_t sub_23C0348E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = sub_23C054320();
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

uint64_t sub_23C034984()
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
  sub_23C054338();
  sub_23C02BC88(&qword_256B03260, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_23C0544AC();
  sub_23C02BC88(&qword_256B03268, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_23C054344();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v4;
  v4(v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_23C034A9C;
  return sub_23C0544B8();
}

uint64_t sub_23C034A9C()
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

uint64_t sub_23C034B48()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C034B84()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03200);
  return sub_23C053FCC();
}

uint64_t sub_23C034BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03270);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C034C24(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

FitnessCoreUI::SizeClass_optional __swiftcall SizeClass.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  FitnessCoreUI::SizeClass_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23C0543B0();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t SizeClass.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x72616C75676572;
  if (*v0 != 1)
    v1 = 0x6669636570736E75;
  if (*v0)
    return v1;
  else
    return 0x746361706D6F63;
}

uint64_t sub_23C034D08(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23C04DCA0(*a1, *a2);
}

FitnessCoreUI::SizeClass_optional sub_23C034D14(Swift::String *a1)
{
  return SizeClass.init(rawValue:)(*a1);
}

void sub_23C034D20(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE700000000000000;
  v4 = 0xE700000000000000;
  v5 = 0x72616C75676572;
  if (v2 != 1)
  {
    v5 = 0x6669636570736E75;
    v4 = 0xEB00000000646569;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x746361706D6F63;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_23C034D88()
{
  sub_23C035114();
  return sub_23C0540F8();
}

uint64_t sub_23C034DE4()
{
  sub_23C035114();
  return sub_23C0540E0();
}

unint64_t sub_23C034E34()
{
  unint64_t result;

  result = qword_256B03278;
  if (!qword_256B03278)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for SizeClass, &type metadata for SizeClass);
    atomic_store(result, (unint64_t *)&qword_256B03278);
  }
  return result;
}

uint64_t sub_23C034E78()
{
  sub_23C05450C();
  sub_23C05405C();
  swift_bridgeObjectRelease();
  return sub_23C054548();
}

uint64_t sub_23C034F20()
{
  sub_23C05405C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C034FA4()
{
  sub_23C05450C();
  sub_23C05405C();
  swift_bridgeObjectRelease();
  return sub_23C054548();
}

uint64_t storeEnumTagSinglePayload for SizeClass(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C035094 + 4 * byte_23C056679[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C0350C8 + 4 * asc_23C056674[v4]))();
}

uint64_t sub_23C0350C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C0350D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C0350D8);
  return result;
}

uint64_t sub_23C0350E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C0350ECLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C0350F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C0350F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SizeClass()
{
  return &type metadata for SizeClass;
}

unint64_t sub_23C035114()
{
  unint64_t result;

  result = qword_256B03280;
  if (!qword_256B03280)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for SizeClass, &type metadata for SizeClass);
    atomic_store(result, (unint64_t *)&qword_256B03280);
  }
  return result;
}

id ColorDescriptor.uiColor.getter()
{
  double *v0;

  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, v0[3], v0[2], v0[1], *v0);
}

uint64_t NSDirectionalEdgeInsets.hash(into:)()
{
  sub_23C05453C();
  sub_23C05453C();
  sub_23C05453C();
  return sub_23C05453C();
}

uint64_t NSDirectionalEdgeInsets.hashValue.getter()
{
  sub_23C05450C();
  NSDirectionalEdgeInsets.hash(into:)();
  return sub_23C054548();
}

uint64_t sub_23C035288()
{
  sub_23C05450C();
  NSDirectionalEdgeInsets.hash(into:)();
  return sub_23C054548();
}

uint64_t sub_23C0352EC()
{
  return NSDirectionalEdgeInsets.hash(into:)();
}

uint64_t sub_23C0352F8()
{
  sub_23C05450C();
  NSDirectionalEdgeInsets.hash(into:)();
  return sub_23C054548();
}

unint64_t sub_23C03535C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B03288;
  if (!qword_256B03288)
  {
    type metadata accessor for NSDirectionalEdgeInsets(255);
    result = MEMORY[0x242615EC8](MEMORY[0x24BEBCD80], v1);
    atomic_store(result, (unint64_t *)&qword_256B03288);
  }
  return result;
}

uint64_t TabItemEdge.Set.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

FitnessCoreUI::TabItemEdge::Set __swiftcall TabItemEdge.Set.init(_:)(FitnessCoreUI::TabItemEdge a1)
{
  uint64_t *v1;
  unsigned int v2;
  uint64_t v3;
  FitnessCoreUI::TabItemEdge::Set result;

  v2 = *(unsigned __int8 *)a1;
  if (v2 >= 0x40)
    v3 = 0;
  else
    v3 = 1 << v2;
  *v1 = v3;
  LOBYTE(result.rawValue) = a1;
  return result;
}

void static TabItemEdge.Set.bottom.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static TabItemEdge.Set.leading.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static TabItemEdge.Set.top.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void static TabItemEdge.Set.trailing.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

FitnessCoreUI::TabItemEdge::Set __swiftcall TabItemEdge.Set.init(rawValue:)(FitnessCoreUI::TabItemEdge::Set rawValue)
{
  FitnessCoreUI::TabItemEdge::Set *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

uint64_t TabItemEdge.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

Swift::Bool __swiftcall TabItemEdge.Set.contains(_:)(FitnessCoreUI::TabItemEdge a1)
{
  _QWORD *v1;
  unsigned int v2;
  uint64_t v3;

  v2 = *(unsigned __int8 *)a1;
  if (v2 >= 0x40)
    v3 = 0;
  else
    v3 = 1 << v2;
  return (v3 & ~*v1) == 0;
}

_QWORD *sub_23C03542C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_23C035438(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_23C035440@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_23C035454@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_23C035468@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_23C03547C(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_23C0354AC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_23C0354D8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_23C0354FC(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_23C035510(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_23C035524(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_23C035538@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_23C03554C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_23C035560(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_23C035574(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_23C035588()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_23C035598()
{
  return sub_23C05426C();
}

_QWORD *sub_23C0355B0(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

void sub_23C0355C4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_23C0355D0(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C0355E8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

FitnessCoreUI::TabItemEdge_optional __swiftcall TabItemEdge.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 4;
  if ((unint64_t)rawValue < 4)
    v2 = rawValue;
  *v1 = v2;
  return (FitnessCoreUI::TabItemEdge_optional)rawValue;
}

FitnessCoreUI::TabItemEdge_optional sub_23C035650(Swift::Int *a1)
{
  return TabItemEdge.init(rawValue:)(*a1);
}

void sub_23C035658(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

void sub_23C035664()
{
  qword_256B03290 = 15;
}

_QWORD *static TabItemEdge.Set.all.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_23C035740(&qword_256B02BC8, &qword_256B03290, a1);
}

void sub_23C0356C0()
{
  qword_256B03298 = 10;
}

_QWORD *static TabItemEdge.Set.horizontal.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_23C035740(&qword_256B02BD0, &qword_256B03298, a1);
}

void sub_23C035700()
{
  qword_256B032A0 = 5;
}

_QWORD *static TabItemEdge.Set.vertical.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_23C035740(&qword_256B02BD8, &qword_256B032A0, a1);
}

_QWORD *sub_23C035740@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (*result != -1)
    result = (_QWORD *)swift_once();
  *a3 = *a2;
  return result;
}

unint64_t sub_23C035784()
{
  unint64_t result;

  result = qword_256B032A8;
  if (!qword_256B032A8)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItemEdge.Set, &type metadata for TabItemEdge.Set);
    atomic_store(result, (unint64_t *)&qword_256B032A8);
  }
  return result;
}

unint64_t sub_23C0357CC()
{
  unint64_t result;

  result = qword_256B032B0;
  if (!qword_256B032B0)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItemEdge.Set, &type metadata for TabItemEdge.Set);
    atomic_store(result, (unint64_t *)&qword_256B032B0);
  }
  return result;
}

unint64_t sub_23C035814()
{
  unint64_t result;

  result = qword_256B032B8;
  if (!qword_256B032B8)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItemEdge.Set, &type metadata for TabItemEdge.Set);
    atomic_store(result, (unint64_t *)&qword_256B032B8);
  }
  return result;
}

unint64_t sub_23C03585C()
{
  unint64_t result;

  result = qword_256B032C0;
  if (!qword_256B032C0)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItemEdge.Set, &type metadata for TabItemEdge.Set);
    atomic_store(result, (unint64_t *)&qword_256B032C0);
  }
  return result;
}

uint64_t sub_23C0358A0()
{
  sub_23C035A6C();
  return sub_23C054104();
}

uint64_t sub_23C0358FC()
{
  sub_23C035A6C();
  return sub_23C0540EC();
}

unint64_t sub_23C03594C()
{
  unint64_t result;

  result = qword_256B032C8;
  if (!qword_256B032C8)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItemEdge, &type metadata for TabItemEdge);
    atomic_store(result, (unint64_t *)&qword_256B032C8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TabItemEdge(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C0359DC + 4 * byte_23C0567DD[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C035A10 + 4 * byte_23C0567D8[v4]))();
}

uint64_t sub_23C035A10(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C035A18(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C035A20);
  return result;
}

uint64_t sub_23C035A2C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C035A34);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C035A38(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C035A40(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TabItemEdge()
{
  return &type metadata for TabItemEdge;
}

ValueMetadata *type metadata accessor for TabItemEdge.Set()
{
  return &type metadata for TabItemEdge.Set;
}

unint64_t sub_23C035A6C()
{
  unint64_t result;

  result = qword_256B032D0;
  if (!qword_256B032D0)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItemEdge, &type metadata for TabItemEdge);
    atomic_store(result, (unint64_t *)&qword_256B032D0);
  }
  return result;
}

uint64_t sub_23C035AB4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_delegate;
  swift_beginAccess();
  return MEMORY[0x242616000](v1);
}

uint64_t sub_23C035B00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_delegate;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_23C035B68(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x242616000](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_23C035BDC;
}

void sub_23C035BDC(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48) + 8) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

id FloatingContentView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

char *FloatingContentView.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  id v10;
  char *v11;
  id v12;
  id v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  char *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  uint64_t ObjCClassFromMetadata;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void (**v45)(uint64_t);
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  _QWORD v70[6];
  objc_super v71;

  *(_QWORD *)&v4[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v9 = OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_collectionView;
  v10 = objc_allocWithZone(MEMORY[0x24BEBD498]);
  v11 = v4;
  v12 = objc_msgSend(v10, sel_init);
  v13 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FloatingCollectionView()), sel_initWithFrame_collectionViewLayout_, v12, 0.0, 0.0, 0.0, 0.0);

  *(_QWORD *)&v4[v9] = v13;
  v14 = OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectionView;
  *(_QWORD *)&v11[v14] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  v15 = &v11[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_highlightedIndex];
  *(_QWORD *)v15 = 0;
  v15[8] = 1;
  v16 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v11[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_itemDescriptors] = MEMORY[0x24BEE4AF8];
  v17 = &v11[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectedIndex];
  *(_QWORD *)v17 = 0;
  v17[8] = 1;
  *(_QWORD *)&v11[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_currentWidth] = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_dataSource] = 0;
  v18 = OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_heightConstraint;
  *(_QWORD *)&v11[v18] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1628]), sel_init);
  v11[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_isAnimating] = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_items] = v16;

  v71.receiver = v11;
  v71.super_class = (Class)type metadata accessor for FloatingContentView();
  v19 = objc_msgSendSuper2(&v71, sel_initWithFrame_, a1, a2, a3, a4);
  v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v21 = objc_allocWithZone((Class)type metadata accessor for FloatingLayout());
  v70[4] = sub_23C0368EC;
  v70[5] = v20;
  v70[0] = MEMORY[0x24BDAC760];
  v70[1] = 1107296256;
  v70[2] = sub_23C038DCC;
  v70[3] = &block_descriptor;
  v22 = _Block_copy(v70);
  v23 = (char *)v19;
  swift_retain();
  v24 = objc_msgSend(v21, sel_initWithSectionProvider_, v22);
  _Block_release(v22);
  swift_release();
  swift_release();
  v25 = OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_collectionView;
  v26 = *(void **)&v23[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_collectionView];
  swift_allocObject();
  swift_unknownObjectWeakInit();
  v27 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_256B03330));
  v28 = v26;
  v29 = sub_23C053E04();
  v30 = *(void **)&v23[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_dataSource];
  *(_QWORD *)&v23[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_dataSource] = v29;

  v31 = OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectionView;
  v32 = *(void **)&v23[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectionView];
  v33 = (void *)objc_opt_self();
  v34 = v32;
  v35 = objc_msgSend(v33, sel_systemFillColor);
  objc_msgSend(v34, sel_setBackgroundColor_, v35);

  v36 = objc_msgSend(*(id *)&v23[v31], sel_layer);
  objc_msgSend(v36, sel_setCornerRadius_, *MEMORY[0x24BDE5CD0]);

  objc_msgSend(v23, sel_addSubview_, *(_QWORD *)&v23[v31]);
  v37 = *(id *)&v23[v25];
  v38 = objc_msgSend(v33, sel_clearColor);
  objc_msgSend(v37, sel_setBackgroundColor_, v38);

  v39 = *(void **)&v23[v25];
  objc_msgSend(v39, sel_setCollectionViewLayout_, v24);
  objc_msgSend(v39, sel_setAllowsMultipleSelection_, 0);
  objc_msgSend(v39, sel_setAllowsSelection_, 0);
  objc_msgSend(v39, sel_setScrollEnabled_, 0);
  objc_msgSend(v39, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  type metadata accessor for TabItemCell();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v41 = v39;
  v42 = (void *)sub_23C054014();
  objc_msgSend(v41, sel_registerClass_forCellWithReuseIdentifier_, ObjCClassFromMetadata, v42);

  v43 = *(_QWORD *)&v23[v25];
  v44 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v45 = (void (**)(uint64_t))(v43 + OBJC_IVAR____TtC13FitnessCoreUI22FloatingCollectionView_onLayoutUpdate);
  v46 = *(_QWORD *)(v43 + OBJC_IVAR____TtC13FitnessCoreUI22FloatingCollectionView_onLayoutUpdate);
  *v45 = sub_23C038E50;
  v45[1] = (void (*)(uint64_t))v44;
  sub_23C038E58(v46);
  objc_msgSend(v23, sel_addSubview_, *(_QWORD *)&v23[v25]);
  v47 = objc_msgSend(v23, sel_heightAnchor);
  v48 = objc_msgSend(v47, sel_constraintEqualToConstant_, 34.0);

  v49 = OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_heightConstraint;
  v50 = *(void **)&v23[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_heightConstraint];
  *(_QWORD *)&v23[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_heightConstraint] = v48;

  v51 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03E60);
  v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = xmmword_23C056AC0;
  v53 = *(void **)&v23[v49];
  *(_QWORD *)(v52 + 32) = v53;
  v54 = *(void **)&v23[v25];
  v55 = v53;
  v56 = objc_msgSend(v54, sel_leadingAnchor);
  v57 = objc_msgSend(v23, sel_leadingAnchor);
  v58 = objc_msgSend(v56, sel_constraintEqualToAnchor_, v57);

  *(_QWORD *)(v52 + 40) = v58;
  v59 = objc_msgSend(*(id *)&v23[v25], sel_trailingAnchor);
  v60 = objc_msgSend(v23, sel_trailingAnchor);
  v61 = objc_msgSend(v59, sel_constraintEqualToAnchor_, v60);

  *(_QWORD *)(v52 + 48) = v61;
  v62 = objc_msgSend(*(id *)&v23[v25], sel_topAnchor);
  v63 = objc_msgSend(v23, sel_topAnchor);
  v64 = objc_msgSend(v62, sel_constraintEqualToAnchor_, v63);

  *(_QWORD *)(v52 + 56) = v64;
  v65 = objc_msgSend(*(id *)&v23[v25], sel_bottomAnchor);
  v66 = objc_msgSend(v23, sel_bottomAnchor);
  v67 = objc_msgSend(v65, sel_constraintEqualToAnchor_, v66);

  *(_QWORD *)(v52 + 64) = v67;
  v70[0] = v52;
  sub_23C054128();
  sub_23C03B7B4(0, (unint64_t *)&qword_256B03E70);
  v68 = (void *)sub_23C054110();
  swift_bridgeObjectRelease();
  objc_msgSend(v51, sel_activateConstraints_, v68);

  return v23;
}

uint64_t type metadata accessor for FloatingContentView()
{
  return objc_opt_self();
}

uint64_t sub_23C036414()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

id sub_23C036438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v36;

  v3 = a3 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x242616000](v3);
  if (!v4)
    return 0;
  v5 = (void *)v4;
  v6 = *(_QWORD *)(v4 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_items);
  swift_bridgeObjectRetain();

  v7 = *(_QWORD *)(v6 + 16);
  if (v7)
  {
    sub_23C0542FC();
    v8 = (void *)objc_opt_self();
    v36 = (id)objc_opt_self();
    v9 = (void *)objc_opt_self();
    v10 = v6 + 120;
    v11 = 0.0;
    do
    {
      v12 = *(double *)(v10 - 88);
      v13 = *(double *)(v10 - 80);
      v10 += 96;
      if (v11 < v13)
        v11 = v13;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v14 = objc_msgSend(v8, sel_absoluteDimension_, v12);
      v15 = objc_msgSend(v8, sel_absoluteDimension_, v13);
      v16 = objc_msgSend(v36, sel_sizeWithWidthDimension_heightDimension_, v14, v15);

      v17 = objc_msgSend(v9, sel_itemWithLayoutSize_, v16);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      sub_23C0542E4();
      sub_23C054308();
      sub_23C054314();
      sub_23C0542F0();
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
    v18 = (void *)objc_opt_self();
    v19 = objc_msgSend(v8, sel_fractionalWidthDimension_, 1.0);
    v20 = objc_msgSend(v8, sel_absoluteDimension_, v11);
    v21 = objc_msgSend(v36, sel_sizeWithWidthDimension_heightDimension_, v19, v20);

    sub_23C03B7B4(0, &qword_256B033C8);
    v22 = (void *)sub_23C054110();
    swift_release();
    v23 = objc_msgSend(v18, sel_horizontalGroupWithLayoutSize_subitems_, v21, v22);

    v24 = objc_msgSend((id)objc_opt_self(), sel_sectionWithGroup_, v23);
  }
  else
  {
    swift_bridgeObjectRelease();
    v25 = (void *)objc_opt_self();
    v26 = objc_msgSend(v25, sel_fractionalWidthDimension_, 1.0);
    v27 = objc_msgSend(v25, sel_fractionalHeightDimension_, 1.0);
    v28 = objc_msgSend((id)objc_opt_self(), sel_sizeWithWidthDimension_heightDimension_, v26, v27);

    v29 = objc_msgSend((id)objc_opt_self(), sel_itemWithLayoutSize_, v28);
    v30 = (void *)objc_opt_self();
    v31 = objc_msgSend(v29, sel_layoutSize);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B03E60);
    v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_23C056AD0;
    *(_QWORD *)(v32 + 32) = v29;
    sub_23C054128();
    sub_23C03B7B4(0, &qword_256B033C8);
    v33 = v29;
    v34 = (void *)sub_23C054110();
    swift_bridgeObjectRelease();
    v23 = objc_msgSend(v30, sel_horizontalGroupWithLayoutSize_subitems_, v31, v34);

    v24 = objc_msgSend((id)objc_opt_self(), sel_sectionWithGroup_, v23);
  }

  return v24;
}

id sub_23C0368EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23C036438(a1, a2, v2);
}

unint64_t sub_23C0368F4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  id v14;
  unint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unsigned __int8 v26;
  _OWORD v27[3];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v5 = a4 + 16;
  v6 = (void *)sub_23C054014();
  v7 = (void *)sub_23C053CE4();
  v8 = objc_msgSend(a1, sel_dequeueReusableCellWithReuseIdentifier_forIndexPath_, v6, v7);

  swift_beginAccess();
  v9 = MEMORY[0x242616000](v5);
  if (!v9)
    return (unint64_t)v8;
  v10 = (void *)v9;
  v11 = *(_QWORD *)(v9 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_items);
  swift_bridgeObjectRetain();
  v12 = sub_23C053D08();
  if (v12)
    v13 = 2 * (*(_QWORD *)(v11 + 16) - 1 == v12);
  else
    v13 = 1;
  type metadata accessor for TabItemCell();
  if (!swift_dynamicCastClass())
  {

    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  v14 = v8;
  result = sub_23C053D08();
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)(v11 + 16))
  {
    v16 = v11 + 96 * result;
    v24 = *(_OWORD *)(v16 + 48);
    v25 = *(_OWORD *)(v16 + 32);
    v23 = *(_OWORD *)(v16 + 64);
    v17 = *(_QWORD *)(v16 + 80);
    v18 = *(_QWORD *)(v16 + 88);
    v19 = *(_QWORD *)(v16 + 96);
    v20 = *(_QWORD *)(v16 + 104);
    v22 = *(_QWORD *)(v16 + 112);
    v21 = *(_QWORD *)(v16 + 120);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v27[0] = v25;
    v27[1] = v24;
    v27[2] = v23;
    v28 = v17;
    v29 = v18;
    v30 = v19;
    v31 = v20;
    v32 = v22;
    v33 = v21;
    v26 = v13;
    sub_23C03C3DC((double *)v27, &v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return (unint64_t)v8;
  }
  __break(1u);
  return result;
}

void sub_23C036AD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x242616000](v2);
  if (v3)
  {
    v4 = (void *)v3;
    if ((*(_BYTE *)(v3 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_isAnimating) & 1) == 0
      && (*(_BYTE *)(v3 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectedIndex + 8) & 1) == 0)
    {
      sub_23C037894(*(_QWORD *)(v3 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectedIndex));
    }

  }
}

void sub_23C036B90()
{
  char *v0;
  CGFloat Width;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  objc_super v7;
  CGRect v8;
  CGRect v9;

  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for FloatingContentView();
  objc_msgSendSuper2(&v7, sel_layoutSubviews);
  objc_msgSend(v0, sel_bounds);
  Width = CGRectGetWidth(v8);
  v2 = OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_currentWidth;
  if (Width != *(double *)&v0[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_currentWidth])
  {
    objc_msgSend(v0, sel_bounds);
    *(CGFloat *)&v0[v2] = CGRectGetWidth(v9);
    v3 = *(_QWORD *)&v0[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectedIndex];
    v4 = v0[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectedIndex + 8];
    v6 = 1;
    v5 = swift_bridgeObjectRetain();
    sub_23C036C8C(v5, v3, v4, &v6, 0);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_23C036C8C(uint64_t a1, uint64_t a2, char a3, char *a4, char a5)
{
  char *v5;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  id v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  objc_class *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  double v45;
  int8x16_t v46;
  int8x16_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  int8x16_t v52;
  int32x2_t v53;
  int64x2_t v54;
  int8x16_t v55;
  int8x16_t v56;
  int8x16_t v57;
  char *v58;
  char *v59;
  uint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  uint64_t v67;
  int8x16_t v68;
  char v70;
  __int128 v71;
  int8x16_t v72;
  double v73;
  int8x16_t v74;
  int8x16_t v75;
  uint64_t v76;
  BOOL v77;
  UITraitCollection_optional v78;
  CGRect v79;

  v70 = *a4;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_itemDescriptors] = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_bounds);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = swift_bridgeObjectRetain();
  v16 = sub_23C041644(v15);
  swift_bridgeObjectRelease();
  v17 = MEMORY[0x24BEE4AF8];
  v18 = (_QWORD *)sub_23C049B50(MEMORY[0x24BEE4AF8]);
  v19 = v5;
  v20 = sub_23C03A934(v18, v16, (uint64_t)v19, v8, v10, v12, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRetain();
  v21 = (char *)sub_23C03A5B0(a1, v20);
  v67 = v20;
  swift_bridgeObjectRelease();
  v22 = objc_msgSend(v19, sel_traitCollection);
  sub_23C03AD18(v21, v22);
  v24 = v23;

  swift_bridgeObjectRelease();
  v25 = *(_QWORD *)(a1 + 16);
  if (v25)
  {
    v64 = v19;
    v26 = a1 + 32;
    swift_bridgeObjectRetain();
    *(double *)&v27 = MEMORY[0x24BEE4AF8];
    do
    {
      if ((*(_BYTE *)v26 & 1) == 0)
      {
        v31 = *(_BYTE *)(v26 + 1);
        v32 = *(_QWORD *)(v26 + 8);
        v33 = *(_QWORD *)(v26 + 32);
        v71 = *(_OWORD *)(v26 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v73 = *(double *)&v27;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23C0390A0(0, *(_QWORD *)(v27 + 16) + 1, 1);
          *(double *)&v27 = v73;
        }
        v29 = *(_QWORD *)(v27 + 16);
        v28 = *(_QWORD *)(v27 + 24);
        if (v29 >= v28 >> 1)
        {
          sub_23C0390A0(v28 > 1, v29 + 1, 1);
          *(double *)&v27 = v73;
        }
        *(_QWORD *)(v27 + 16) = v29 + 1;
        v30 = v27 + 40 * v29;
        *(_BYTE *)(v30 + 32) = 0;
        *(_BYTE *)(v30 + 33) = v31;
        *(_QWORD *)(v30 + 40) = v32;
        *(_OWORD *)(v30 + 48) = v71;
        *(_QWORD *)(v30 + 64) = v33;
      }
      v26 += 40;
      --v25;
    }
    while (v25);
    swift_bridgeObjectRelease();
    v19 = v64;
  }
  else
  {
    v27 = v17;
  }
  swift_bridgeObjectRetain();
  v34 = sub_23C03A5B0(v27, v67);
  swift_bridgeObjectRelease_n();
  objc_msgSend(v19, sel_bounds);
  if (v24 <= CGRectGetWidth(v79))
  {
    if (qword_256B02BC0 != -1)
      swift_once();
    v35 = sub_23C053D8C();
    __swift_project_value_buffer(v35, (uint64_t)qword_256B0EF10);
    v36 = sub_23C053D74();
    v37 = sub_23C054200();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v38 = 134217984;
      v73 = v24;
      sub_23C05423C();
      _os_log_impl(&dword_23C028000, v36, v37, "[FloatingContentView] Bounds do not fit minimum size of %f", v38, 0xCu);
      MEMORY[0x242615F58](v38, -1, -1);
    }

  }
  v39 = (objc_class *)objc_msgSend(v19, sel_traitCollection);
  v78.value.super.isa = v39;
  sub_23C03B250(v34, v78, v8, v10, v12, v14);

  MEMORY[0x24BDAC7A8](v40);
  v41 = swift_retain();
  v42 = sub_23C03B564(v41, (void (*)(__int128 *__return_ptr, uint64_t, _BYTE *))sub_23C03B55C);
  swift_bridgeObjectRelease();
  swift_release();
  *(_QWORD *)&v19[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_items] = v42;
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(*(_QWORD *)&v19[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_items] + 16))
  {
    v43 = a3 & 1;
    v44 = *(_QWORD *)(v34 + 16);
    if (v44)
    {
      v45 = *(double *)(v34 + 32);
      v46 = *(int8x16_t *)(v34 + 56);
      v47 = *(int8x16_t *)(v34 + 40);
      v48 = *(_QWORD *)(v34 + 72);
      v49 = v44 - 1;
      if (v44 != 1)
      {
        v50 = v34 + 80;
        v51 = *(double *)(v34 + 40);
        do
        {
          v52 = *(int8x16_t *)(v50 + 8);
          if (v51 < *(double *)v52.i64)
            v45 = *(double *)v50;
          v53 = vdup_n_s32(v51 < *(double *)v52.i64);
          v54.i64[0] = v53.u32[0];
          v54.i64[1] = v53.u32[1];
          v55 = (int8x16_t)vcltzq_s64(vshlq_n_s64(v54, 0x3FuLL));
          v46 = vbslq_s8(v55, *(int8x16_t *)(v50 + 24), v46);
          v47 = vbslq_s8(v55, v52, v47);
          if (v51 < *(double *)v52.i64)
          {
            v48 = *(_QWORD *)(v50 + 40);
            v51 = *(double *)(v50 + 8);
          }
          v50 += 48;
          --v49;
        }
        while (v49);
      }
      v68 = v46;
      v72 = v47;
      swift_bridgeObjectRelease();
      v56 = v68;
      v57 = v72;
    }
    else
    {
      swift_bridgeObjectRelease();
      v57 = 0uLL;
      v45 = 0.0;
      v48 = 0;
      v56 = 0uLL;
    }
    v73 = v45;
    v74 = v57;
    v75 = v56;
    v76 = v48;
    v77 = v44 == 0;
    v61 = swift_allocObject();
    *(_QWORD *)(v61 + 16) = v19;
    *(double *)(v61 + 24) = *(double *)&v27;
    *(_BYTE *)(v61 + 32) = v70;
    *(_BYTE *)(v61 + 33) = a5 & 1;
    *(_QWORD *)(v61 + 40) = a2;
    *(_BYTE *)(v61 + 48) = v43 != 0;
    sub_23C03B4C4((uint64_t)&v73, v61 + 56, &qword_256B03388);
    *(_QWORD *)(swift_allocObject() + 16) = v19;
    if ((a5 & 1) != 0)
    {
      sub_23C03B7B4(0, &qword_256B03390);
      v62 = v19;
      sub_23C054224();
      swift_release();
    }
    else
    {
      v63 = v19;
      swift_retain();
      sub_23C037534(v63, v27, v70, 0, a2, v43, (uint64_t)&v73);
      swift_release();
      swift_release();
      v63[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_isAnimating] = 0;
    }
    return swift_release();
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    v58 = &v19[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectedIndex];
    *(_QWORD *)v58 = 0;
    v58[8] = 1;
    objc_msgSend(*(id *)&v19[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectionView], sel_setHidden_, 1);
    v59 = &v19[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_highlightedIndex];
    *(_QWORD *)v59 = 0;
    v59[8] = 1;
    LOBYTE(v73) = v70;
    return sub_23C038208(MEMORY[0x24BEE4AF8], (char *)&v73, a5 & 1);
  }
}

uint64_t sub_23C037478@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  _OWORD *v14;
  __int128 v15;
  __int128 v16;

  v7 = *(unsigned __int8 *)(a2 + 1);
  v9 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  if (v7 == 1)
  {
    v11 = 0;
    v12 = 0;
  }
  else
  {
    v11 = *(_QWORD *)(a2 + 24);
    v10 = *(_QWORD *)(a2 + 32);
    if (v7 == 2)
    {
      v9 = 0;
      v8 = 0;
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    v12 = v10;
  }
  result = swift_bridgeObjectRetain();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(a3 + 16) > a1)
  {
    v14 = (_OWORD *)(a3 + (a1 << 6));
    v15 = v14[3];
    *(_OWORD *)a4 = v14[2];
    *(_OWORD *)(a4 + 16) = v15;
    v16 = v14[5];
    *(_OWORD *)(a4 + 32) = v14[4];
    *(_OWORD *)(a4 + 48) = v16;
    *(_QWORD *)(a4 + 64) = v9;
    *(_QWORD *)(a4 + 72) = v8;
    *(_QWORD *)(a4 + 80) = v11;
    *(_QWORD *)(a4 + 88) = v12;
    return result;
  }
  __break(1u);
  return result;
}

void sub_23C037534(_BYTE *a1, uint64_t a2, char a3, int a4, uint64_t a5, char a6, uint64_t a7)
{
  int v12;
  int v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t ObjectType;
  id v21;
  uint64_t v22;
  char v23[8];
  double v24;
  double v25;
  double v26;
  char v27;

  v12 = a6 & 1;
  a1[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_isAnimating] = 1;
  v23[0] = a3 & 1;
  sub_23C038208(a2, v23, a4);
  v13 = a1[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectedIndex + 8];
  if (v13 == 1 && v12 != 0)
    goto LABEL_8;
  v15 = *(_QWORD *)(a2 + 16);
  v16 = v15 - 1;
  if ((v13 & 1) != 0)
  {
    if ((a6 & 1) != 0)
    {
LABEL_8:
      v17 = 0;
LABEL_9:
      sub_23C037E04(v17, 0);
      goto LABEL_10;
    }
    if (v16 >= a5)
      v17 = a5;
    else
      v17 = v15 - 1;
    if (v17 != a5)
      goto LABEL_9;
  }
  else
  {
    v22 = *(_QWORD *)&a1[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectedIndex];
    if ((a6 & 1) != 0)
    {
      if (v16 >= v22)
        v17 = *(_QWORD *)&a1[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectedIndex];
      else
        v17 = v15 - 1;
      goto LABEL_9;
    }
    if (v16 >= v22)
      v16 = *(_QWORD *)&a1[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectedIndex];
    if (v15 <= a5)
      v17 = v16;
    else
      v17 = a5;
    if (v17 != a5)
      goto LABEL_9;
  }
  sub_23C037894(a5);
LABEL_10:
  sub_23C03B4C4(a7, (uint64_t)v23, &qword_256B03388);
  if ((v27 & 1) == 0)
  {
    objc_msgSend(*(id *)&a1[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_heightConstraint], sel_setConstant_, v24 + v25 + v26);
    v18 = &a1[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_delegate];
    swift_beginAccess();
    if (!MEMORY[0x242616000](v18)
      || (v19 = *((_QWORD *)v18 + 1),
          ObjectType = swift_getObjectType(),
          v21 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(ObjectType, v19),
          swift_unknownObjectRelease(),
          !v21))
    {
      v21 = objc_msgSend(a1, sel_superview);
    }
    objc_msgSend(v21, sel_layoutIfNeeded);

  }
}

uint64_t sub_23C037704@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  double v6;
  uint64_t v7;
  char *v8;
  void *v9;
  double v10;
  double v11;
  double MidY;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  CGPoint v20;
  CGRect v21;
  CGRect v22;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256B03F00);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void **)(v2 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_collectionView);
  objc_msgSend(a1, sel_locationInView_, v9, v6);
  v11 = v10;
  objc_msgSend(v9, sel_bounds);
  MidY = CGRectGetMidY(v21);
  objc_msgSend(v9, sel_bounds);
  v20.x = v11;
  v20.y = MidY;
  if (CGRectContainsPoint(v22, v20))
  {
    v13 = objc_msgSend(v9, sel_indexPathForItemAtPoint_, v11, MidY);
    if (v13)
    {
      v14 = v13;
      sub_23C053CF0();

      v15 = sub_23C053D20();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v8, 0, 1, v15);
    }
    else
    {
      v18 = sub_23C053D20();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v8, 1, 1, v18);
    }
    return sub_23C03B4C4((uint64_t)v8, a2, (uint64_t *)&unk_256B03F00);
  }
  else
  {
    v16 = sub_23C053D20();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a2, 1, 1, v16);
  }
}

char *sub_23C037894(uint64_t a1)
{
  char *v1;
  id v2;
  void *v3;
  objc_class *v4;
  char *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  UITraitCollection_optional v23;
  CGSize v24;
  void *v25;
  uint64_t v26;
  char *result;
  double MaxX;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CGRect v38;
  CGRect v39;

  v5 = v1;
  v7 = sub_23C053D20();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x2426152D4](a1, 0);
  v11 = *(void **)&v5[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_dataSource];
  if (!v11)
    return (char *)(*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v12 = v11;
  sub_23C053E10();

  if (!v36)
    return (char *)(*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_23C03A580(v32, v33, v34, v35, v36);
  v13 = sub_23C053D08();
  if ((v13 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  v14 = *(_QWORD *)&v5[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_items];
  if (v13 >= *(_QWORD *)(v14 + 16))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    swift_once();
    goto LABEL_7;
  }
  v15 = (_QWORD *)(v14 + 96 * v13);
  v16 = v15[6];
  v17 = v15[7];
  v18 = v15[8];
  v19 = v15[9];
  v20 = v15[10];
  v21 = v15[11];
  v3 = *(void **)&v5[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_collectionView];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v22 = (void *)sub_23C053CE4();
  v2 = objc_msgSend(v3, sel_cellForItemAtIndexPath_, v22);

  if (!v2)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    swift_bridgeObjectRelease();
    return (char *)swift_bridgeObjectRelease();
  }
  v4 = (objc_class *)objc_msgSend(v5, sel_traitCollection);
  v32 = v16;
  v33 = v17;
  v34 = v18;
  v35 = v19;
  v36 = v20;
  v37 = v21;
  if (qword_256B02BC8 != -1)
    goto LABEL_19;
LABEL_7:
  v31 = qword_256B03290;
  v23.value.super.isa = v4;
  v24 = TabItemSize.minimumSize(respecting:compatibleWith:)((FitnessCoreUI::TabItemEdge::Set)&v31, v23);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v25 = *(void **)&v5[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectionView];
  objc_msgSend(v25, sel_setFrame_, 0.0, 0.0, v24.width, v24.height);
  if (!sub_23C053D08())
  {
    objc_msgSend(v25, sel_frame);
    objc_msgSend(v25, sel_setFrame_, 0.0);
    goto LABEL_13;
  }
  v26 = sub_23C053D08();
  result = (char *)objc_msgSend(v3, sel_numberOfItemsInSection_, sub_23C053D14());
  if (!__OFSUB__(result, 1))
  {
    if ((char *)v26 != result - 1)
    {
      objc_msgSend(v2, sel_center);
      goto LABEL_15;
    }
    objc_msgSend(v2, sel_frame);
    MaxX = CGRectGetMaxX(v38);
    objc_msgSend(v25, sel_frame);
    v29 = MaxX - CGRectGetWidth(v39);
    objc_msgSend(v25, sel_frame);
    objc_msgSend(v25, sel_setFrame_, v29);
LABEL_13:
    objc_msgSend(v2, sel_center);
    objc_msgSend(v25, sel_center);
LABEL_15:
    objc_msgSend(v25, sel_setCenter_);
    objc_msgSend(v2, sel_setSelected_, 1);

    return (char *)(*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  __break(1u);
  return result;
}

void sub_23C037C08(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  char *v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  id v18;
  BOOL v19;
  BOOL v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;

  v5 = v4;
  v10 = sub_23C053D20();
  v11 = *(_QWORD *)(v10 - 8);
  v12.n128_f64[0] = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t *)(v5 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_highlightedIndex);
  if ((*(_BYTE *)(v5 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_highlightedIndex + 8) & 1) != 0)
  {
    if ((a2 & 1) == 0)
    {
      *v15 = a1;
      *((_BYTE *)v15 + 8) = 0;
      if ((a4 & 1) != 0 || a1 != a3)
      {
LABEL_20:
        v21 = *(void **)(v5 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_collectionView);
        MEMORY[0x2426152D4](a1, 0, v12);
        v22 = (void *)sub_23C053CE4();
        (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
        v23 = objc_msgSend(v21, sel_cellForItemAtIndexPath_, v22);

        if (v23)
        {
          objc_msgSend(v23, sel_setHighlighted_, 1);

        }
      }
    }
  }
  else
  {
    v16 = *v15;
    if ((a2 & 1) != 0 || v16 != a1)
    {
      if ((a4 & 1) != 0 || v16 != a3)
      {
        v25 = *(id *)(v5 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_collectionView);
        MEMORY[0x2426152D4](v16, 0, v12);
        v17 = (void *)sub_23C053CE4();
        v24 = v17;
        (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
        v18 = objc_msgSend(v25, sel_cellForItemAtIndexPath_, v17);

        if (v18)
        {
          objc_msgSend(v18, sel_setSelected_, 0);
          objc_msgSend(v18, sel_setHighlighted_, 0);

        }
      }
      *v15 = a1;
      *((_BYTE *)v15 + 8) = a2 & 1;
      v19 = (a4 & 1) == 0 && a1 == a3;
      v20 = v19;
      if ((a2 & 1) == 0 && !v20)
        goto LABEL_20;
    }
  }
}

void sub_23C037E04(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[6];

  if ((a1 & 0x8000000000000000) == 0)
  {
    v5 = v2 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectedIndex;
    v6 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectedIndex);
    v7 = *(_BYTE *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectedIndex + 8);
    v8 = v2 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_highlightedIndex;
    v9 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_highlightedIndex);
    v10 = *(_BYTE *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_highlightedIndex + 8);
    *(_QWORD *)v5 = a1;
    *(_BYTE *)(v5 + 8) = 0;
    objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectionView), sel_setHidden_, 0);
    *(_QWORD *)v8 = 0;
    *(_BYTE *)(v8 + 8) = 1;
    v11 = swift_allocObject();
    swift_unknownObjectUnownedInit();
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v11;
    *(_QWORD *)(v12 + 24) = a1;
    *(_QWORD *)(v12 + 32) = v6;
    *(_BYTE *)(v12 + 40) = v7;
    *(_QWORD *)(v12 + 48) = v9;
    *(_BYTE *)(v12 + 56) = v10;
    if ((a2 & 1) != 0)
    {
      v13 = (void *)objc_opt_self();
      v16[4] = sub_23C03A568;
      v16[5] = v12;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 1107296256;
      v16[2] = sub_23C04F954;
      v16[3] = &block_descriptor_11;
      v14 = _Block_copy(v16);
      swift_retain();
      swift_release();
      objc_msgSend(v13, sel__animateUsingSpringWithDampingRatio_response_tracking_dampingRatioSmoothing_responseSmoothing_targetSmoothing_projectionDeceleration_animations_completion_, 0, v14, 0, 0.9, 0.3, 0.08, 0.08, 0.08, 0.0);
      swift_release();
      _Block_release(v14);
    }
    else
    {
      v15 = swift_retain();
      sub_23C038004(v15, a1, v6, v7, v9, v10);
      swift_release();
      swift_release();
    }
  }
}

void sub_23C038004(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, char a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *Strong;
  char *v16;
  id v17;
  void *v18;
  id v19;
  char *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;

  v11 = sub_23C053D20();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  sub_23C037894(a2);

  if ((a4 & 1) == 0 && a3 != a2)
  {
    v16 = (char *)swift_unknownObjectUnownedLoadStrong();
    v17 = *(id *)&v16[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_collectionView];

    MEMORY[0x2426152D4](a3, 0);
    v18 = (void *)sub_23C053CE4();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    v19 = objc_msgSend(v17, sel_cellForItemAtIndexPath_, v18);

    if (v19)
    {
      objc_msgSend(v19, sel_setSelected_, 0);

    }
  }
  if ((a6 & 1) == 0)
  {
    v20 = (char *)swift_unknownObjectUnownedLoadStrong();
    v21 = *(id *)&v20[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_collectionView];

    MEMORY[0x2426152D4](a5, 0);
    v22 = (void *)sub_23C053CE4();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    v23 = objc_msgSend(v21, sel_cellForItemAtIndexPath_, v22);

    if (a5 == a2)
    {
      if (!v23)
        return;
    }
    else
    {
      if (!v23)
        return;
      objc_msgSend(v23, sel_setSelected_, 0);
    }
    objc_msgSend(v23, sel_setHighlighted_, 0);

  }
}

uint64_t sub_23C038208(uint64_t a1, char *a2, int a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
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
  _BYTE *v21;
  char v22;
  uint64_t v23;
  void *v24;
  id v25;
  char v26;
  uint64_t v27;
  char v28;
  void *v29;
  id v30;
  id v32;
  char v33;
  uint64_t v34;
  char v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  _BYTE v43[12];
  int v44;
  uint64_t v45;
  uint64_t v46;
  char v47;

  v44 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03370);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = &v43[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v7);
  v11 = &v43[-v10];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03378);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = &v43[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = &v43[-v18];
  MEMORY[0x24BDAC7A8](v17);
  v21 = &v43[-v20];
  v22 = *a2;
  v23 = OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_dataSource;
  v45 = v3;
  v24 = *(void **)(v3 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_dataSource);
  if ((v22 & 1) != 0)
  {
    if (v24)
    {
      v25 = v24;
      sub_23C053E28();

      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v13 + 48))(v9, 1, v12) != 1)
      {
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v13 + 32))(v16, v9, v12);
        v46 = 0;
        sub_23C053DC8();
        if ((v26 & 1) == 0)
        {
          v46 = 0;
          v27 = sub_23C053DD4();
          v28 = sub_23C0386EC(v27, a1);
          swift_bridgeObjectRelease();
          if ((v28 & 1) != 0)
          {
            sub_23C053DEC();
            v29 = *(void **)(v45 + v23);
            if (v29)
            {
              v30 = v29;
              sub_23C053E1C();

            }
            return (*(uint64_t (**)(_BYTE *, uint64_t))(v13 + 8))(v16, v12);
          }
        }
        (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v16, v12);
LABEL_23:
        LOBYTE(v46) = 0;
        return sub_23C038208(a1, &v46, v44 & 1);
      }
    }
    else
    {
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v9, 1, 1, v12);
    }
    sub_23C038FC8((uint64_t)v9);
    goto LABEL_23;
  }
  if (!v24)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    goto LABEL_17;
  }
  v32 = v24;
  sub_23C053E28();

  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
LABEL_17:
    sub_23C038FC8((uint64_t)v11);
    goto LABEL_18;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v13 + 32))(v21, v11, v12);
  v46 = 0;
  sub_23C053DC8();
  if ((v33 & 1) != 0
    || (v46 = 0, v34 = sub_23C053DD4(), v35 = sub_23C0386EC(v34, a1), swift_bridgeObjectRelease(), (v35 & 1) != 0))
  {
    (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v21, v12);
LABEL_18:
    sub_23C039008();
    sub_23C053DF8();
    sub_23C053DBC();
    v46 = 0;
    v47 = 1;
    sub_23C053DA4();
    v36 = *(void **)(v45 + v23);
    if (v36)
    {
      v37 = v36;
      sub_23C053E1C();

    }
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v13 + 8))(v19, v12);
  }
  v38 = swift_bridgeObjectRetain();
  sub_23C039DA8(v38, (uint64_t)v21);
  swift_bridgeObjectRelease();
  v39 = swift_bridgeObjectRetain();
  sub_23C03A064(v39, (uint64_t)v21);
  swift_bridgeObjectRelease();
  v40 = sub_23C053DE0();
  swift_bridgeObjectRetain();
  sub_23C03A318(v40, a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23C053DB0();
  swift_bridgeObjectRelease();
  v46 = 0;
  v47 = 0;
  sub_23C053DA4();
  swift_bridgeObjectRelease();
  sub_23C053DEC();
  swift_bridgeObjectRelease();
  v41 = *(void **)(v45 + v23);
  if (v41)
  {
    v42 = v41;
    sub_23C053E1C();

  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v13 + 8))(v21, v12);
}

uint64_t sub_23C0386EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  BOOL v16;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    for (i = 0; ; i += 40)
    {
      v6 = (_QWORD *)(a1 + i);
      v7 = (_QWORD *)(a2 + i);
      if (*(unsigned __int8 *)(a1 + i + 32) != *(unsigned __int8 *)(a2 + i + 32)
        || *(unsigned __int8 *)(a1 + i + 33) != *(unsigned __int8 *)(a2 + i + 33))
      {
        break;
      }
      v9 = v6[6];
      v10 = v6[7];
      v11 = v6[8];
      v12 = v7[6];
      v13 = v7[7];
      v14 = v7[8];
      if (v9)
      {
        if (!v12)
          return 0;
        v15 = v6[5] == v7[5] && v9 == v12;
        if (!v15 && (sub_23C054488() & 1) == 0)
          return 0;
      }
      else if (v12)
      {
        return 0;
      }
      v16 = v10 == v13 && v11 == v14;
      if (!v16 && (sub_23C054488() & 1) == 0)
        return 0;
      if (!--v2)
        return 1;
    }
    return 0;
  }
  return 1;
}

uint64_t sub_23C0387EC(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;

  v3 = *(_QWORD *)(a3 + 16);
  if (result)
  {
    v4 = result - 1;
    v5 = __OFSUB__(result, 1);
    if (v3 - 1 == result)
    {
      if (v5)
      {
        __break(1u);
      }
      else if (v4 < v3)
      {
        return result;
      }
      __break(1u);
      goto LABEL_17;
    }
    if (v5)
    {
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
    if (v4 >= v3)
    {
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
    if (__OFADD__(result, 1))
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (result + 1 >= v3)
LABEL_20:
      __break(1u);
  }
  return result;
}

unint64_t sub_23C0388E8@<X0>(unint64_t result@<X0>, double *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  __int128 v5;
  __int128 v6;
  __int128 v7;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(a3 + 16) > result)
  {
    v5 = *(_OWORD *)a2;
    v6 = *((_OWORD *)a2 + 1);
    v7 = *((_OWORD *)a2 + 2);
    *(double *)a4 = *a2 + *(double *)(a3 + 8 * result + 32);
    *(double *)(a4 + 8) = a5;
    *(_OWORD *)(a4 + 16) = v5;
    *(_OWORD *)(a4 + 32) = v6;
    *(_OWORD *)(a4 + 48) = v7;
    return result;
  }
  __break(1u);
  return result;
}

void sub_23C038924(uint64_t a1)
{
  void *v1;
  int v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t inited;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;

  v2 = *(unsigned __int8 *)(a1 + 1);
  if (v2 != 2 && *(_QWORD *)(a1 + 16) != 0)
  {
    v4 = (void *)objc_opt_self();
    v5 = *MEMORY[0x24BEBE1D0];
    v6 = *MEMORY[0x24BEBE0B8];
    swift_bridgeObjectRetain();
    v7 = objc_msgSend(v4, sel__preferredFontForTextStyle_maximumContentSizeCategory_, v5, v6);
    if (!v7)
    {
      __break(1u);
      return;
    }
    v8 = v7;
    objc_msgSend(v7, sel_pointSize);
    v10 = v9;

    v11 = objc_msgSend((id)objc_opt_self(), sel_configurationWithPointSize_weight_scale_, 5, 2, v10);
    v12 = (void *)sub_23C054014();
    swift_bridgeObjectRelease();
    v13 = objc_msgSend((id)objc_opt_self(), sel__systemImageNamed_withConfiguration_, v12, v11);

    if (v13)
    {
      objc_msgSend(v13, sel_size);
      v14 = objc_msgSend(v1, sel_traitCollection);
      objc_msgSend(v14, sel_displayScale);
      objc_msgSend(v14, sel_displayScale);

    }
  }
  if (v2 != 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B03360);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23C056AE0;
    v16 = (void *)*MEMORY[0x24BEBB360];
    *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB360];
    v17 = (void *)objc_opt_self();
    v18 = *MEMORY[0x24BEBE1D0];
    v19 = *MEMORY[0x24BEBE0B8];
    swift_bridgeObjectRetain();
    v20 = v16;
    v21 = objc_msgSend(v17, sel__preferredFontForTextStyle_maximumContentSizeCategory_, v18, v19);
    *(_QWORD *)(inited + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03368);
    *(_QWORD *)(inited + 40) = v21;
    sub_23C049CD4(inited);
    v22 = objc_allocWithZone(MEMORY[0x24BDD1458]);
    v23 = (void *)sub_23C054014();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_23C038F80();
    v24 = (void *)sub_23C053FE4();
    swift_bridgeObjectRelease();
    v25 = objc_msgSend(v22, sel_initWithString_attributes_, v23, v24);

    objc_msgSend(v25, sel_boundingRectWithSize_options_context_, 0, 0, INFINITY, INFINITY);
    v26 = objc_msgSend(v1, sel_traitCollection);
    objc_msgSend(v26, sel_displayScale);
    objc_msgSend(v26, sel_displayScale);

  }
}

id FloatingContentView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FloatingContentView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_23C038DCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  void *v6;

  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  v6 = (void *)v5(a2, a3);
  swift_release();
  swift_unknownObjectRelease();
  return v6;
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

unint64_t sub_23C038E48(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_23C0368F4(a1, a2, a3, v3);
}

void sub_23C038E50(uint64_t a1)
{
  uint64_t v1;

  sub_23C036AD4(a1, v1);
}

uint64_t sub_23C038E58(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_23C038E68@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_delegate;
  swift_beginAccess();
  result = MEMORY[0x242616000](v3);
  v5 = *(_QWORD *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_23C038EC0(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_delegate;
  swift_beginAccess();
  *(_QWORD *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t method lookup function for FloatingContentView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FloatingContentView.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of FloatingContentView.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of FloatingContentView.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

unint64_t sub_23C038F80()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B02D68;
  if (!qword_256B02D68)
  {
    type metadata accessor for Key(255);
    result = MEMORY[0x242615EC8](&unk_23C055780, v1);
    atomic_store(result, (unint64_t *)&qword_256B02D68);
  }
  return result;
}

uint64_t sub_23C038FC8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03370);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23C039008()
{
  unint64_t result;

  result = qword_256B03590;
  if (!qword_256B03590)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItemDescriptor, &type metadata for TabItemDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B03590);
  }
  return result;
}

uint64_t sub_23C03904C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23C0390D8(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23C039068(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23C039250(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23C039084(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23C0393AC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23C0390A0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23C039508(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23C0390BC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23C039688(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23C0390D8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B033B8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8])
      memmove(v12, v13, 48 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[48 * v8] || v12 >= &v13[48 * v8])
  {
    memcpy(v12, v13, 48 * v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23C054398();
  __break(1u);
  return result;
}

uint64_t sub_23C039250(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B033A0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 + 31;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 6);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[64 * v8])
      memmove(v13, v14, v8 << 6);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[64 * v8] || v13 >= &v14[64 * v8])
  {
    memcpy(v13, v14, v8 << 6);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23C054398();
  __break(1u);
  return result;
}

uint64_t sub_23C0393AC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B033B0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23C054398();
  __break(1u);
  return result;
}

uint64_t sub_23C039508(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B03380);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8])
      memmove(v12, v13, 40 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[40 * v8] || v12 >= &v13[40 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23C054398();
  __break(1u);
  return result;
}

uint64_t sub_23C039688(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B03398);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 96);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[96 * v8])
      memmove(v12, v13, 96 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[96 * v8] || v12 >= &v13[96 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23C054398();
  __break(1u);
  return result;
}

void sub_23C03980C(uint64_t a1, char a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[8];
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38[4];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B033C0);
  v6 = (_QWORD *)sub_23C054380();
  if (*(_QWORD *)(v5 + 16))
  {
    v7 = 1 << *(_BYTE *)(v5 + 32);
    v28 = v3;
    v29 = (_QWORD *)(v5 + 64);
    v8 = -1;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    v9 = v8 & *(_QWORD *)(v5 + 64);
    v10 = (unint64_t)(v7 + 63) >> 6;
    swift_retain();
    v11 = 0;
    while (1)
    {
      if (v9)
      {
        v12 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v13 = v12 | (v11 << 6);
      }
      else
      {
        v14 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
          __break(1u);
LABEL_29:
          __break(1u);
          return;
        }
        if (v14 >= v10)
          goto LABEL_22;
        v15 = v29[v14];
        ++v11;
        if (!v15)
        {
          v11 = v14 + 1;
          if (v14 + 1 >= v10)
            goto LABEL_22;
          v15 = v29[v11];
          if (!v15)
          {
            v16 = v14 + 2;
            if (v16 >= v10)
            {
LABEL_22:
              swift_release();
              v3 = v28;
              if ((a2 & 1) != 0)
              {
                v27 = 1 << *(_BYTE *)(v5 + 32);
                if (v27 > 63)
                  bzero(v29, ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v29 = -1 << v27;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v15 = v29[v16];
            if (!v15)
            {
              while (1)
              {
                v11 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_29;
                if (v11 >= v10)
                  goto LABEL_22;
                v15 = v29[v11];
                ++v16;
                if (v15)
                  goto LABEL_19;
              }
            }
            v11 = v16;
          }
        }
LABEL_19:
        v9 = (v15 - 1) & v15;
        v13 = __clz(__rbit64(v15)) + (v11 << 6);
      }
      v17 = *(_QWORD *)(v5 + 48) + 40 * v13;
      v18 = *(_BYTE *)v17;
      v19 = *(_BYTE *)(v17 + 1);
      v20 = *(_QWORD *)(v17 + 8);
      v21 = *(_OWORD *)(v17 + 16);
      v22 = *(_QWORD *)(v17 + 32);
      v23 = (__int128 *)(*(_QWORD *)(v5 + 56) + 48 * v13);
      v25 = *v23;
      v24 = v23[1];
      v26 = v23[2];
      if ((a2 & 1) == 0)
      {
        v32 = v23[2];
        v33 = *(_OWORD *)(v17 + 16);
        v30 = *v23;
        v31 = v23[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v25 = v30;
        v24 = v31;
        v26 = v32;
        v21 = v33;
      }
      v38[0] = v25;
      v38[1] = v24;
      v38[2] = v26;
      v34[0] = v18;
      v34[1] = v19;
      v35 = v20;
      v36 = v21;
      v37 = v22;
      sub_23C039A5C((uint64_t)v34, v38, v6);
    }
  }
  swift_release();
  *v3 = v6;
}

__n128 sub_23C039A5C(uint64_t a1, __int128 *a2, _QWORD *a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  __n128 result;
  __int128 v13;

  sub_23C05450C();
  v6 = *(_QWORD *)(a1 + 16);
  sub_23C054524();
  sub_23C054518();
  sub_23C054524();
  if (v6)
  {
    swift_bridgeObjectRetain();
    sub_23C05405C();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_23C05405C();
  swift_bridgeObjectRelease();
  sub_23C054548();
  v7 = sub_23C054278();
  *(_QWORD *)((char *)a3 + ((v7 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v7;
  v8 = a3[6] + 40 * v7;
  v9 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v8 = *(_OWORD *)a1;
  *(_OWORD *)(v8 + 16) = v9;
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(a1 + 32);
  v10 = a3[7] + 48 * v7;
  v11 = a2[2];
  v13 = *a2;
  result = (__n128)a2[1];
  *(__n128 *)(v10 + 16) = result;
  *(_OWORD *)(v10 + 32) = v11;
  *(_OWORD *)v10 = v13;
  ++a3[2];
  return result;
}

void *sub_23C039BB8()
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
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _OWORD *v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B033C0);
  v2 = *v0;
  v3 = sub_23C054374();
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
    v29 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v29 >= v13)
      goto LABEL_26;
    v30 = *(_QWORD *)(v6 + 8 * v29);
    ++v9;
    if (!v30)
    {
      v9 = v29 + 1;
      if (v29 + 1 >= v13)
        goto LABEL_26;
      v30 = *(_QWORD *)(v6 + 8 * v9);
      if (!v30)
        break;
    }
LABEL_25:
    v12 = (v30 - 1) & v30;
    v15 = __clz(__rbit64(v30)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    v17 = *(_QWORD *)(v2 + 48) + 40 * v15;
    v18 = *(_BYTE *)(v17 + 1);
    v19 = *(_QWORD *)(v17 + 8);
    v20 = *(_QWORD *)(v17 + 32);
    v21 = 48 * v15;
    v22 = (__int128 *)(*(_QWORD *)(v2 + 56) + v21);
    v23 = *(_QWORD *)(v4 + 48) + v16;
    v24 = *(_OWORD *)(v17 + 16);
    v25 = *v22;
    v26 = v22[1];
    v27 = v22[2];
    *(_BYTE *)v23 = *(_BYTE *)v17;
    *(_BYTE *)(v23 + 1) = v18;
    *(_QWORD *)(v23 + 8) = v19;
    *(_OWORD *)(v23 + 16) = v24;
    *(_QWORD *)(v23 + 32) = v20;
    v28 = (_OWORD *)(*(_QWORD *)(v4 + 56) + v21);
    *v28 = v25;
    v28[1] = v26;
    v28[2] = v27;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v31 = v29 + 2;
  if (v31 >= v13)
    goto LABEL_26;
  v30 = *(_QWORD *)(v6 + 8 * v31);
  if (v30)
  {
    v9 = v31;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v30 = *(_QWORD *)(v6 + 8 * v9);
    ++v31;
    if (v30)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23C039DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unsigned __int8 *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  BOOL v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v39 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03378);
  v37 = *(_QWORD *)(v3 - 8);
  v38 = v3;
  result = MEMORY[0x24BDAC7A8](v3);
  v36 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
    return MEMORY[0x24BEE4AF8];
  v7 = 0;
  v34 = a1 + 32;
  v8 = MEMORY[0x24BEE4AF8];
  v35 = v6;
LABEL_3:
  v33 = v8;
  if (v7 <= v6)
    v9 = v6;
  else
    v9 = v7;
  v40 = v9;
  while (v7 != v40)
  {
    v10 = (unsigned __int8 *)(v34 + 40 * v7);
    v11 = *v10;
    v12 = v10[1];
    v13 = *((_QWORD *)v10 + 2);
    v14 = *((_QWORD *)v10 + 3);
    v15 = *((_QWORD *)v10 + 4);
    v42 = *((_QWORD *)v10 + 1);
    v43 = v14;
    v41 = v7 + 1;
    v17 = v36;
    v16 = v37;
    v18 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v36, v39, v38);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v19 = sub_23C053DE0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v17, v18);
    v20 = *(_QWORD *)(v19 + 16);
    if (v20)
    {
      v21 = 0;
      do
      {
        v22 = (_QWORD *)(v19 + v21);
        if (v11 != *(unsigned __int8 *)(v19 + v21 + 32) || *(unsigned __int8 *)(v19 + v21 + 33) != v12)
          goto LABEL_12;
        v24 = v22[6];
        v25 = v22[7];
        v26 = v22[8];
        if (v24)
        {
          if (!v13)
            goto LABEL_12;
          v27 = v22[5] == v42 && v24 == v13;
          if (!v27 && (sub_23C054488() & 1) == 0)
            goto LABEL_12;
        }
        else if (v13)
        {
          goto LABEL_12;
        }
        v28 = v25 == v43 && v26 == v15;
        if (v28 || (sub_23C054488() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v8 = v33;
          result = swift_isUniquelyReferenced_nonNull_native();
          v44 = v8;
          if ((result & 1) == 0)
          {
            result = sub_23C0390A0(0, *(_QWORD *)(v8 + 16) + 1, 1);
            v8 = v44;
          }
          v30 = *(_QWORD *)(v8 + 16);
          v29 = *(_QWORD *)(v8 + 24);
          if (v30 >= v29 >> 1)
          {
            result = sub_23C0390A0(v29 > 1, v30 + 1, 1);
            v8 = v44;
          }
          *(_QWORD *)(v8 + 16) = v30 + 1;
          v31 = v8 + 40 * v30;
          *(_BYTE *)(v31 + 32) = v11;
          *(_BYTE *)(v31 + 33) = v12;
          *(_QWORD *)(v31 + 40) = v42;
          *(_QWORD *)(v31 + 48) = v13;
          *(_QWORD *)(v31 + 56) = v43;
          *(_QWORD *)(v31 + 64) = v15;
          v6 = v35;
          v7 = v41;
          if (v41 == v35)
            return v8;
          goto LABEL_3;
        }
LABEL_12:
        v21 += 40;
        --v20;
      }
      while (v20);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    v7 = v41;
    if (v41 == v35)
      return v33;
  }
  __break(1u);
  return result;
}

uint64_t sub_23C03A064(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unsigned __int8 *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  BOOL v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v39 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03378);
  v37 = *(_QWORD *)(v3 - 8);
  v38 = v3;
  result = MEMORY[0x24BDAC7A8](v3);
  v36 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
    return MEMORY[0x24BEE4AF8];
  v7 = 0;
  v34 = a1 + 32;
  v8 = MEMORY[0x24BEE4AF8];
  v35 = v6;
  while (2)
  {
    if (v7 <= v6)
      v9 = v6;
    else
      v9 = v7;
    v40 = v8;
    v33 = v9;
LABEL_7:
    if (v7 != v9)
    {
      v10 = (unsigned __int8 *)(v34 + 40 * v7);
      v11 = *v10;
      v12 = v10[1];
      v13 = *((_QWORD *)v10 + 2);
      v14 = *((_QWORD *)v10 + 3);
      v15 = *((_QWORD *)v10 + 4);
      v42 = *((_QWORD *)v10 + 1);
      v43 = v14;
      v41 = v7 + 1;
      v17 = v36;
      v16 = v37;
      v18 = v38;
      (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v36, v39, v38);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v19 = sub_23C053DE0();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v17, v18);
      v20 = *(_QWORD *)(v19 + 16);
      if (!v20)
      {
LABEL_31:
        swift_bridgeObjectRelease();
        v8 = v40;
        result = swift_isUniquelyReferenced_nonNull_native();
        v44 = v8;
        if ((result & 1) == 0)
        {
          result = sub_23C0390A0(0, *(_QWORD *)(v8 + 16) + 1, 1);
          v8 = v44;
        }
        v30 = *(_QWORD *)(v8 + 16);
        v29 = *(_QWORD *)(v8 + 24);
        if (v30 >= v29 >> 1)
        {
          result = sub_23C0390A0(v29 > 1, v30 + 1, 1);
          v8 = v44;
        }
        *(_QWORD *)(v8 + 16) = v30 + 1;
        v31 = v8 + 40 * v30;
        *(_BYTE *)(v31 + 32) = v11;
        *(_BYTE *)(v31 + 33) = v12;
        *(_QWORD *)(v31 + 40) = v42;
        *(_QWORD *)(v31 + 48) = v13;
        *(_QWORD *)(v31 + 56) = v43;
        *(_QWORD *)(v31 + 64) = v15;
        v6 = v35;
        v7 = v41;
        if (v41 == v35)
          return v8;
        continue;
      }
      v21 = 0;
      while (1)
      {
        v22 = (_QWORD *)(v19 + v21);
        if (v11 != *(unsigned __int8 *)(v19 + v21 + 32) || *(unsigned __int8 *)(v19 + v21 + 33) != v12)
          goto LABEL_11;
        v24 = v22[6];
        v25 = v22[7];
        v26 = v22[8];
        if (v24)
        {
          if (!v13)
            goto LABEL_11;
          v27 = v22[5] == v42 && v24 == v13;
          if (!v27 && (sub_23C054488() & 1) == 0)
            goto LABEL_11;
        }
        else if (v13)
        {
          goto LABEL_11;
        }
        v28 = v25 == v43 && v26 == v15;
        if (v28 || (sub_23C054488() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease();
          v8 = v40;
          v7 = v41;
          v9 = v33;
          if (v41 == v35)
            return v8;
          goto LABEL_7;
        }
LABEL_11:
        v21 += 40;
        if (!--v20)
          goto LABEL_31;
      }
    }
    break;
  }
  __break(1u);
  return result;
}

uint64_t sub_23C03A318(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;

  v2 = *(_QWORD *)(result + 16);
  if (!v2)
    return MEMORY[0x24BEE4AF8];
  v3 = 0;
  v25 = result + 32;
  v23 = (unsigned __int8 *)(a2 + 32);
  v4 = MEMORY[0x24BEE4AF8];
  v26 = *(_QWORD *)(result + 16);
  v27 = a2;
  while (2)
  {
    if (v3 <= v2)
      v5 = v2;
    else
      v5 = v3;
    v28 = v4;
    v24 = v5;
LABEL_7:
    if (v3 != v5)
    {
      v6 = (unsigned __int8 *)(v25 + 40 * v3);
      v7 = *v6;
      v8 = v6[1];
      v9 = *((_QWORD *)v6 + 2);
      v10 = *((_QWORD *)v6 + 3);
      v11 = *((_QWORD *)v6 + 4);
      v12 = *(_QWORD *)(a2 + 16);
      v29 = v3 + 1;
      v30 = *((_QWORD *)v6 + 1);
      if (!v12)
      {
LABEL_31:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v4 = v28;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = sub_23C0390A0(0, *(_QWORD *)(v28 + 16) + 1, 1);
          v4 = v28;
        }
        v21 = *(_QWORD *)(v4 + 16);
        v20 = *(_QWORD *)(v4 + 24);
        if (v21 >= v20 >> 1)
        {
          result = sub_23C0390A0(v20 > 1, v21 + 1, 1);
          v4 = v28;
        }
        *(_QWORD *)(v4 + 16) = v21 + 1;
        v22 = v4 + 40 * v21;
        *(_BYTE *)(v22 + 32) = v7;
        *(_BYTE *)(v22 + 33) = v8;
        v3 = v29;
        *(_QWORD *)(v22 + 40) = v30;
        *(_QWORD *)(v22 + 48) = v9;
        *(_QWORD *)(v22 + 56) = v10;
        *(_QWORD *)(v22 + 64) = v11;
        v2 = v26;
        a2 = v27;
        if (v29 == v26)
          return v4;
        continue;
      }
      v13 = v23;
      while (1)
      {
        if (v7 != *v13 || v13[1] != v8)
          goto LABEL_11;
        v15 = *((_QWORD *)v13 + 2);
        v16 = *((_QWORD *)v13 + 3);
        v17 = *((_QWORD *)v13 + 4);
        if (v15)
        {
          if (!v9)
            goto LABEL_11;
          result = *((_QWORD *)v13 + 1);
          if (result != v30 || v15 != v9)
          {
            result = sub_23C054488();
            if ((result & 1) == 0)
              goto LABEL_11;
          }
        }
        else if (v9)
        {
          goto LABEL_11;
        }
        v19 = v16 == v10 && v17 == v11;
        if (v19 || (result = sub_23C054488(), (result & 1) != 0))
        {
          a2 = v27;
          v4 = v28;
          v3 = v29;
          v5 = v24;
          if (v29 == v26)
            return v4;
          goto LABEL_7;
        }
LABEL_11:
        v13 += 40;
        if (!--v12)
          goto LABEL_31;
      }
    }
    break;
  }
  __break(1u);
  return result;
}

uint64_t sub_23C03A520()
{
  swift_unknownObjectUnownedDestroy();
  return swift_deallocObject();
}

uint64_t sub_23C03A544()
{
  swift_release();
  return swift_deallocObject();
}

void sub_23C03A568()
{
  uint64_t v0;

  sub_23C038004(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_BYTE *)(v0 + 56));
}

uint64_t sub_23C03A580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  if (a5)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23C03A5B0(uint64_t a1, uint64_t a2)
{
  int64_t v2;
  uint64_t v3;
  uint64_t i;
  __int128 v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t result;
  _OWORD v22[2];
  uint64_t v23;
  uint64_t v24;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v24 = MEMORY[0x24BEE4AF8];
  sub_23C03904C(0, v2, 0);
  v3 = v24;
  for (i = a1 + 32; ; i += 40)
  {
    v7 = *(_OWORD *)(i + 16);
    v22[0] = *(_OWORD *)i;
    v22[1] = v7;
    v23 = *(_QWORD *)(i + 32);
    v8 = *(_QWORD *)(a2 + 16);
    sub_23C03B74C((uint64_t)v22);
    if (!v8)
      break;
    sub_23C03B74C((uint64_t)v22);
    v9 = sub_23C04A6EC((uint64_t)v22);
    if ((v10 & 1) == 0)
    {
      sub_23C03B780((uint64_t)v22);
      break;
    }
    v11 = (uint64_t *)(*(_QWORD *)(a2 + 56) + 48 * v9);
    v12 = *v11;
    v13 = v11[1];
    v14 = v11[2];
    v15 = v11[3];
    v16 = v11[4];
    v17 = v11[5];
    sub_23C03B780((uint64_t)v22);
    sub_23C03B780((uint64_t)v22);
    v24 = v3;
    v19 = *(_QWORD *)(v3 + 16);
    v18 = *(_QWORD *)(v3 + 24);
    if (v19 >= v18 >> 1)
    {
      sub_23C03904C(v18 > 1, v19 + 1, 1);
      v3 = v24;
    }
    *(_QWORD *)(v3 + 16) = v19 + 1;
    v20 = (_QWORD *)(v3 + 48 * v19);
    v20[4] = v12;
    v20[5] = v13;
    v20[6] = v14;
    v20[7] = v15;
    v20[8] = v16;
    v20[9] = v17;
    if (!--v2)
      return v3;
  }
  sub_23C03B74C((uint64_t)v22);
  sub_23C05429C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C054080();
  swift_bridgeObjectRelease();
  result = sub_23C05435C();
  __break(1u);
  return result;
}

void sub_23C03A7A8()
{
  _BYTE *v0;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  *(_QWORD *)&v0[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v1 = OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_collectionView;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD498]), sel_init);
  v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FloatingCollectionView()), sel_initWithFrame_collectionViewLayout_, v2, 0.0, 0.0, 0.0, 0.0);

  *(_QWORD *)&v0[v1] = v3;
  v4 = OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectionView;
  *(_QWORD *)&v0[v4] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  v5 = &v0[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_highlightedIndex];
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  v6 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_itemDescriptors] = MEMORY[0x24BEE4AF8];
  v7 = &v0[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectedIndex];
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_currentWidth] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_dataSource] = 0;
  v8 = OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_heightConstraint;
  *(_QWORD *)&v0[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1628]), sel_init);
  v0[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_isAnimating] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_items] = v6;

  sub_23C05435C();
  __break(1u);
}

uint64_t sub_23C03A934(_QWORD *a1, uint64_t a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  CGFloat Width;
  BOOL v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  char isUniquelyReferenced_nonNull_native;
  char v38;
  unint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  char v45;
  _QWORD *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  uint64_t result;
  uint64_t v55;
  int64_t v56;
  _OWORD v59[2];
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  CGRect v65;

  v64 = a3;
  v55 = a2 + 56;
  v11 = 1 << *(_BYTE *)(a2 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(a2 + 56);
  v56 = (unint64_t)(v11 + 63) >> 6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = 0;
  while (1)
  {
    if (v13)
    {
      v16 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v17 = v16 | (v14 << 6);
    }
    else
    {
      v18 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_51;
      if (v18 >= v56)
      {
LABEL_48:
        swift_release();
        return (uint64_t)a1;
      }
      v19 = *(_QWORD *)(v55 + 8 * v18);
      ++v14;
      if (!v19)
      {
        v14 = v18 + 1;
        if (v18 + 1 >= v56)
          goto LABEL_48;
        v19 = *(_QWORD *)(v55 + 8 * v14);
        if (!v19)
        {
          v14 = v18 + 2;
          if (v18 + 2 >= v56)
            goto LABEL_48;
          v19 = *(_QWORD *)(v55 + 8 * v14);
          if (!v19)
          {
            v14 = v18 + 3;
            if (v18 + 3 >= v56)
              goto LABEL_48;
            v19 = *(_QWORD *)(v55 + 8 * v14);
            if (!v19)
            {
              v20 = v18 + 4;
              if (v20 >= v56)
                goto LABEL_48;
              v19 = *(_QWORD *)(v55 + 8 * v20);
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_52;
                  if (v14 >= v56)
                    goto LABEL_48;
                  v19 = *(_QWORD *)(v55 + 8 * v14);
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
      }
LABEL_23:
      v13 = (v19 - 1) & v19;
      v17 = __clz(__rbit64(v19)) + (v14 << 6);
    }
    v21 = *(_QWORD *)(a2 + 48) + 40 * v17;
    v22 = *(_QWORD *)(v21 + 32);
    v23 = *(_OWORD *)(v21 + 16);
    v61 = *(_OWORD *)v21;
    v62 = v23;
    v63 = v22;
    v24 = *(_OWORD *)(v21 + 16);
    v59[0] = *(_OWORD *)v21;
    v59[1] = v24;
    v60 = *(_QWORD *)(v21 + 32);
    swift_bridgeObjectRetain();
    sub_23C03B74C((uint64_t)&v61);
    sub_23C038924((uint64_t)v59);
    v26 = v25;
    v28 = v27;
    v29 = BYTE1(v61);
    v65.origin.x = a4;
    v65.origin.y = a5;
    v65.size.width = a6;
    v65.size.height = a7;
    Width = CGRectGetWidth(v65);
    v31 = Width < 375.0;
    if (Width >= 375.0)
      v32 = 16.0;
    else
      v32 = 8.0;
    v33 = 14.0;
    if (v31)
      v33 = 8.0;
    v34 = 10.0;
    if (!v31)
      v34 = 16.0;
    v35 = v29 == 1 ? v33 : v34;
    v36 = v29 == 1 ? v32 : v34;
    sub_23C03B74C((uint64_t)&v61);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)&v59[0] = a1;
    v39 = sub_23C04A6EC((uint64_t)&v61);
    v40 = a1[2];
    v41 = (v38 & 1) == 0;
    v42 = v40 + v41;
    if (__OFADD__(v40, v41))
      break;
    v43 = v38;
    if (a1[3] >= v42)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v46 = *(_QWORD **)&v59[0];
        if ((v38 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_23C039BB8();
        v46 = *(_QWORD **)&v59[0];
        if ((v43 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_23C03980C(v42, isUniquelyReferenced_nonNull_native);
      v44 = sub_23C04A6EC((uint64_t)&v61);
      if ((v43 & 1) != (v45 & 1))
        goto LABEL_53;
      v39 = v44;
      v46 = *(_QWORD **)&v59[0];
      if ((v43 & 1) != 0)
      {
LABEL_4:
        v15 = v46[7] + 48 * v39;
        *(_QWORD *)v15 = v26;
        *(_QWORD *)(v15 + 8) = v28;
        *(_QWORD *)(v15 + 16) = 0x4018000000000000;
        *(double *)(v15 + 24) = v35;
        *(_QWORD *)(v15 + 32) = 0x4018000000000000;
        *(double *)(v15 + 40) = v36;
        goto LABEL_5;
      }
    }
    v46[(v39 >> 6) + 8] |= 1 << v39;
    v47 = v46[6] + 40 * v39;
    v48 = v61;
    v49 = v62;
    *(_QWORD *)(v47 + 32) = v63;
    *(_OWORD *)v47 = v48;
    *(_OWORD *)(v47 + 16) = v49;
    v50 = v46[7] + 48 * v39;
    *(_QWORD *)v50 = v26;
    *(_QWORD *)(v50 + 8) = v28;
    *(_QWORD *)(v50 + 16) = 0x4018000000000000;
    *(double *)(v50 + 24) = v35;
    *(_QWORD *)(v50 + 32) = 0x4018000000000000;
    *(double *)(v50 + 40) = v36;
    v51 = v46[2];
    v52 = __OFADD__(v51, 1);
    v53 = v51 + 1;
    if (v52)
      goto LABEL_50;
    v46[2] = v53;
    sub_23C03B74C((uint64_t)&v61);
LABEL_5:
    swift_bridgeObjectRelease();
    sub_23C03B780((uint64_t)&v61);
    sub_23C03B780((uint64_t)&v61);
    swift_bridgeObjectRelease();
    a1 = v46;
  }
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  result = sub_23C0544A0();
  __break(1u);
  return result;
}

char *sub_23C03AD18(char *result, void *a2)
{
  unint64_t v2;
  double *v4;
  unint64_t v5;
  double *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  double v16;
  char v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;

  v2 = *((_QWORD *)result + 2);
  if (v2)
  {
    v4 = (double *)&result[48 * v2 - 24];
    result = (char *)swift_bridgeObjectRetain();
    v5 = 0;
    v6 = (double *)(result + 56);
    v7 = 0.0;
    v8 = 0.0;
    while (1)
    {
      v10 = *(v6 - 3);
      v9 = *(v6 - 2);
      v12 = *(v6 - 1);
      v11 = *v6;
      v13 = v6[1];
      v14 = v6[2];
      v15 = v5 + 1;
      if (v5)
      {
        if (v2 - 1 == v5)
        {
          v16 = *v4;
          if (qword_256B02BD8 != -1)
          {
            v37 = v6[1];
            v40 = *(v6 - 2);
            result = (char *)swift_once();
            v13 = v37;
            v9 = v40;
          }
          v17 = qword_256B032A0 | 8;
          if (v16 > v11)
            v18 = v16;
          else
            v18 = v11;
          if ((qword_256B032A0 & 2) == 0)
            v18 = -0.0;
          v19 = v10 + v18;
          if (v14 < 0.0)
            v20 = 0.0;
          else
            v20 = v14;
          v21 = v20 + v19;
        }
        else
        {
          if (v15 >= v2)
          {
            __break(1u);
            return result;
          }
          v25 = *(v6 - 4);
          v26 = v6[6];
          if (qword_256B02BD8 != -1)
          {
            v38 = v6[1];
            v41 = *(v6 - 2);
            result = (char *)swift_once();
            v13 = v38;
            v9 = v41;
          }
          v17 = 8;
          if ((qword_256B032A0 & 0xFFFFFFFFFFFFFFF7) != 0)
            v17 = qword_256B032A0 | 8;
          if (v25 > v11)
            v27 = v25;
          else
            v27 = v11;
          if ((v17 & 2) == 0)
            v27 = -0.0;
          v28 = v10 + v27;
          if (v26 > v14)
            v29 = v26;
          else
            v29 = v14;
          v21 = v29 + v28;
        }
      }
      else
      {
        v22 = 0.0;
        if (v2 != 1)
          v22 = v6[6];
        if (qword_256B02BC8 != -1)
        {
          v36 = v6[1];
          v39 = *(v6 - 2);
          result = (char *)swift_once();
          v13 = v36;
          v9 = v39;
        }
        v17 = qword_256B03290;
        if (v11 < 0.0)
          v23 = 0.0;
        else
          v23 = v11;
        if ((qword_256B03290 & 2) == 0)
          v23 = -0.0;
        v21 = v10 + v23;
        if (v2 == 1)
        {
          if (v14 < 0.0)
            v24 = 0.0;
          else
            v24 = v14;
          if ((qword_256B03290 & 8) == 0)
            goto LABEL_53;
        }
        else
        {
          if (v22 > v14)
            v24 = v22;
          else
            v24 = v14;
          if ((qword_256B03290 & 8) == 0)
            goto LABEL_53;
        }
        v21 = v24 + v21;
      }
LABEL_53:
      v30 = -0.0;
      if ((v17 & 4) != 0)
        v31 = v12;
      else
        v31 = -0.0;
      v32 = v9 + v31;
      if ((v17 & 1) != 0)
        v30 = v13;
      v33 = v30 + v32;
      if (a2)
      {
        objc_msgSend(a2, sel_displayScale);
        if (v34 > 0.0)
          v21 = ceil(v21 * v34) / v34;
        result = (char *)objc_msgSend(a2, sel_displayScale);
        if (v35 > 0.0)
          v33 = ceil(v33 * v35) / v35;
      }
      if (v33 > v8)
        v8 = v33;
      v7 = v7 + v21;
      v6 += 6;
      v5 = v15;
      if (v2 == v15)
        return (char *)swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_23C03AFE4(uint64_t a1, double (*a2)(uint64_t, _OWORD *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  __int128 v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v13[3];
  uint64_t v14;

  v14 = MEMORY[0x24BEE4AF8];
  sub_23C039084(0, 0, 0);
  v4 = v14;
  v5 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v5)
  {
    v6 = 0;
    v7 = (_OWORD *)(a1 + 64);
    do
    {
      v8 = *(v7 - 1);
      v13[0] = *(v7 - 2);
      v13[1] = v8;
      v13[2] = *v7;
      v9 = a2(v6, v13);
      v14 = v4;
      v11 = *(_QWORD *)(v4 + 16);
      v10 = *(_QWORD *)(v4 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_23C039084(v10 > 1, v11 + 1, 1);
        v4 = v14;
      }
      ++v6;
      *(_QWORD *)(v4 + 16) = v11 + 1;
      *(double *)(v4 + 8 * v11 + 32) = v9;
      v7 += 3;
    }
    while (v5 != v6);
  }
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_23C03B110(uint64_t a1, void (*a2)(__int128 *__return_ptr, uint64_t, _OWORD *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  unint64_t v13;
  unint64_t v14;
  _OWORD *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _OWORD v26[3];
  uint64_t v27;

  v27 = MEMORY[0x24BEE4AF8];
  sub_23C039068(0, 0, 0);
  v4 = v27;
  v5 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v5)
  {
    v6 = 0;
    v7 = (_OWORD *)(a1 + 64);
    do
    {
      v25 = v6;
      v8 = *(v7 - 1);
      v26[0] = *(v7 - 2);
      v26[1] = v8;
      v26[2] = *v7;
      a2(&v21, v6, v26);
      v9 = v21;
      v10 = v22;
      v11 = v23;
      v12 = v24;
      v27 = v4;
      v14 = *(_QWORD *)(v4 + 16);
      v13 = *(_QWORD *)(v4 + 24);
      if (v14 >= v13 >> 1)
      {
        v19 = v22;
        v20 = v21;
        v17 = v24;
        v18 = v23;
        sub_23C039068(v13 > 1, v14 + 1, 1);
        v12 = v17;
        v11 = v18;
        v10 = v19;
        v9 = v20;
        v4 = v27;
      }
      ++v6;
      *(_QWORD *)(v4 + 16) = v14 + 1;
      v15 = (_OWORD *)(v4 + (v14 << 6));
      v15[2] = v9;
      v15[3] = v10;
      v15[4] = v11;
      v15[5] = v12;
      v7 += 3;
    }
    while (v5 != v6);
  }
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_23C03B250(uint64_t a1, UITraitCollection_optional compatibleWith, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t isa;
  unint64_t v7;
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
  CGSize v22;
  uint64_t v24;
  CGRect v25;

  isa = (uint64_t)compatibleWith.value.super.isa;
  v7 = *(_QWORD *)(a1 + 16);
  if (v7 < 2)
  {
    if (v7)
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(_QWORD *)(a1 + 48);
      v19 = *(_QWORD *)(a1 + 56);
      v20 = *(_QWORD *)(a1 + 64);
      v21 = *(_QWORD *)(a1 + 72);
      if (qword_256B02BC8 != -1)
        swift_once();
      v24 = qword_256B03290;
      compatibleWith.value.super.isa = (Class)isa;
      v22 = TabItemSize.minimumSize(respecting:compatibleWith:)((FitnessCoreUI::TabItemEdge::Set)&v24, compatibleWith);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B033A0);
      isa = swift_allocObject();
      *(_OWORD *)(isa + 16) = xmmword_23C056AE0;
      *(CGSize *)(isa + 32) = v22;
      *(_QWORD *)(isa + 48) = v16;
      *(_QWORD *)(isa + 56) = v17;
      *(_QWORD *)(isa + 64) = v18;
      *(_QWORD *)(isa + 72) = v19;
      *(_QWORD *)(isa + 80) = v20;
      *(_QWORD *)(isa + 88) = v21;
    }
    else
    {
      sub_23C03B6F0();
      swift_allocError();
      swift_willThrow();
    }
  }
  else
  {
    sub_23C03AD18((char *)a1, compatibleWith.value.super.isa);
    v25.origin.x = a3;
    v25.origin.y = a4;
    v25.size.width = a5;
    v25.size.height = a6;
    CGRectGetWidth(v25);
    MEMORY[0x24BDAC7A8](v12);
    v13 = swift_bridgeObjectRetain();
    sub_23C03AFE4(v13, (double (*)(uint64_t, _OWORD *))sub_23C03B734);
    v14 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v14);
    v15 = swift_bridgeObjectRetain();
    isa = sub_23C03B110(v15, (void (*)(__int128 *__return_ptr, uint64_t, _OWORD *))sub_23C03B740);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return isa;
}

uint64_t sub_23C03B498()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C03B4C4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_23C03B508()
{
  uint64_t v0;

  sub_23C037534(*(_BYTE **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32), *(unsigned __int8 *)(v0 + 33), *(_QWORD *)(v0 + 40), *(_BYTE *)(v0 + 48), v0 + 56);
}

uint64_t sub_23C03B524()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_23C03B548()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_isAnimating) = 0;
}

uint64_t sub_23C03B55C@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_23C037478(a1, a2, *(_QWORD *)(v3 + 16), a3);
}

uint64_t sub_23C03B564(uint64_t a1, void (*a2)(__int128 *__return_ptr, uint64_t, _BYTE *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  _OWORD *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _BYTE v35[8];
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = MEMORY[0x24BEE4AF8];
  sub_23C0390BC(0, 0, 0);
  v4 = v39;
  v5 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v5)
  {
    v6 = 0;
    v7 = (char *)(a1 + 32);
    do
    {
      v8 = *((_QWORD *)v7 + 4);
      v9 = *((_QWORD *)v7 + 1);
      v10 = v7[1];
      v11 = *v7;
      v34 = v6;
      v35[0] = v11;
      v35[1] = v10;
      v36 = v9;
      v37 = *((_OWORD *)v7 + 1);
      v38 = v8;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      a2(&v28, v6, v35);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v12 = v28;
      v13 = v29;
      v14 = v30;
      v15 = v31;
      v16 = v32;
      v17 = v33;
      v39 = v4;
      v19 = *(_QWORD *)(v4 + 16);
      v18 = *(_QWORD *)(v4 + 24);
      if (v19 >= v18 >> 1)
      {
        v26 = v29;
        v27 = v28;
        v24 = v31;
        v25 = v30;
        v22 = v33;
        v23 = v32;
        sub_23C0390BC(v18 > 1, v19 + 1, 1);
        v17 = v22;
        v16 = v23;
        v15 = v24;
        v14 = v25;
        v13 = v26;
        v12 = v27;
        v4 = v39;
      }
      ++v6;
      *(_QWORD *)(v4 + 16) = v19 + 1;
      v20 = (_OWORD *)(v4 + 96 * v19);
      v20[2] = v12;
      v20[3] = v13;
      v20[4] = v14;
      v20[5] = v15;
      v20[6] = v16;
      v20[7] = v17;
      v7 += 40;
    }
    while (v5 != v6);
  }
  swift_bridgeObjectRelease();
  return v4;
}

unint64_t sub_23C03B6F0()
{
  unint64_t result;

  result = qword_256B033A8;
  if (!qword_256B033A8)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for FloatingError, &type metadata for FloatingError);
    atomic_store(result, (unint64_t *)&qword_256B033A8);
  }
  return result;
}

uint64_t sub_23C03B734(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23C0387EC(a1, a2, *(_QWORD *)(v2 + 16));
}

unint64_t sub_23C03B740@<X0>(unint64_t a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_23C0388E8(a1, a2, *(_QWORD *)(v3 + 16), a3, *(double *)(v3 + 24));
}

uint64_t sub_23C03B74C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23C03B780(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23C03B7B4(uint64_t a1, unint64_t *a2)
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

uint64_t dispatch thunk of LayoutProtocol.containerSize.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of LayoutProtocol.gridSizeClass.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

BOOL static TabItemCell.Position.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TabItemCell.Position.hash(into:)()
{
  return sub_23C054518();
}

uint64_t TabItemCell.Position.hashValue.getter()
{
  sub_23C05450C();
  sub_23C054518();
  return sub_23C054548();
}

uint64_t type metadata accessor for TabItemCell()
{
  return objc_opt_self();
}

id sub_23C03B960(void *a1, uint64_t a2, SEL *a3)
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for TabItemCell();
  return objc_msgSendSuper2(&v5, *a3);
}

id TabItemCell.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

char *TabItemCell.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  id v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  double v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  double v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  double v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  int v74;
  objc_super v75;

  v9 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackView;
  v10 = objc_allocWithZone(MEMORY[0x24BEBD978]);
  v11 = v4;
  *(_QWORD *)&v4[v9] = objc_msgSend(v10, sel_init);
  v12 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView;
  *(_QWORD *)&v11[v12] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_init);
  v13 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_titleLabel;
  *(_QWORD *)&v11[v13] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  v14 = &v11[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem];
  *((_OWORD *)v14 + 2) = 0u;
  *((_OWORD *)v14 + 3) = 0u;
  *(_OWORD *)v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  *((_QWORD *)v14 + 8) = 0;
  *((_QWORD *)v14 + 9) = 1;
  *((_QWORD *)v14 + 10) = 0;
  *((_QWORD *)v14 + 11) = 0;
  v15 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewCenterXConstraint;
  *(_QWORD *)&v11[v15] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1628]), sel_init);
  v16 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewLeadingConstraint;
  *(_QWORD *)&v11[v16] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1628]), sel_init);
  v17 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewTrailingConstraint;
  *(_QWORD *)&v11[v17] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1628]), sel_init);

  v75.receiver = v11;
  v75.super_class = (Class)type metadata accessor for TabItemCell();
  v18 = objc_msgSendSuper2(&v75, sel_initWithFrame_, a1, a2, a3, a4);
  v19 = *MEMORY[0x24BEBE0B8];
  v20 = (char *)v18;
  objc_msgSend(v20, sel_setMaximumContentSizeCategory_, v19);
  v21 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackView;
  v22 = *(void **)&v20[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackView];
  objc_msgSend(v22, sel_setAxis_, 0);
  objc_msgSend(v22, sel_setDistribution_, 3);
  objc_msgSend(v22, sel_setSpacing_, 4.0);
  objc_msgSend(v22, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v23 = objc_msgSend(v20, sel_contentView);
  objc_msgSend(v23, sel_addSubview_, v22);

  v24 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView;
  v25 = *(void **)&v20[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView];
  objc_msgSend(v25, (SEL)&stru_250CF76C8, 0);
  objc_msgSend(v25, sel_setContentMode_, 1);
  objc_msgSend(v25, (SEL)&stru_250CF73C0.size + 3, v19);
  v26 = (void *)objc_opt_self();
  v27 = v25;
  v28 = objc_msgSend(v26, sel_labelColor);
  objc_msgSend(v27, sel_setTintColor_, v28);

  objc_msgSend(*(id *)&v20[v21], sel_addArrangedSubview_, *(_QWORD *)&v20[v24]);
  v29 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_titleLabel;
  v30 = *(void **)&v20[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_titleLabel];
  v31 = (void *)objc_opt_self();
  v32 = *MEMORY[0x24BEBE1D0];
  v33 = v30;
  v34 = objc_msgSend(v31, sel__preferredFontForTextStyle_maximumContentSizeCategory_, v32, v19);
  objc_msgSend(v33, sel_setFont_, v34);

  v35 = *(void **)&v20[v29];
  objc_msgSend(v35, sel_setNumberOfLines_, 1);
  v36 = v35;
  v37 = objc_msgSend(v26, sel_labelColor);
  objc_msgSend(v36, sel_setTextColor_, v37);

  v38 = *(void **)&v20[v29];
  objc_msgSend(v38, sel_setMaximumContentSizeCategory_, v19);
  objc_msgSend(v38, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v39 = *(void **)&v20[v21];
  objc_msgSend(v39, sel_addArrangedSubview_, v38);
  v40 = objc_msgSend(v39, sel_centerXAnchor);
  v41 = objc_msgSend(v20, sel_contentView);
  v42 = objc_msgSend(v41, sel_centerXAnchor);

  v43 = objc_msgSend(v40, sel_constraintEqualToAnchor_, v42);
  type metadata accessor for UILayoutPriority(0);
  sub_23C03CC0C();
  sub_23C053D98();
  LODWORD(v44) = v74;
  objc_msgSend(v43, sel_setPriority_, v44);
  v45 = *(void **)&v20[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewCenterXConstraint];
  *(_QWORD *)&v20[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewCenterXConstraint] = v43;

  v46 = objc_msgSend(*(id *)&v20[v21], sel_leadingAnchor);
  v47 = objc_msgSend(v20, sel_contentView);
  v48 = objc_msgSend(v47, (SEL)&ContinuousSelectionGestureRecognizer.base_meths + 6);

  v49 = objc_msgSend(v46, sel_constraintEqualToAnchor_, v48);
  sub_23C053D98();
  LODWORD(v50) = v74;
  objc_msgSend(v49, sel_setPriority_, v50);
  v51 = *(void **)&v20[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewLeadingConstraint];
  *(_QWORD *)&v20[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewLeadingConstraint] = v49;

  v52 = objc_msgSend(*(id *)&v20[v21], sel_trailingAnchor);
  v53 = objc_msgSend(v20, sel_contentView);
  v54 = objc_msgSend(v53, (SEL)&stru_250CF7638.imp);

  v55 = objc_msgSend(v52, sel_constraintEqualToAnchor_, v54);
  sub_23C053D98();
  LODWORD(v56) = v74;
  objc_msgSend(v55, sel_setPriority_, v56);
  v57 = *(void **)&v20[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewTrailingConstraint];
  *(_QWORD *)&v20[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewTrailingConstraint] = v55;

  v58 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03E60);
  v59 = swift_allocObject();
  *(_OWORD *)(v59 + 16) = xmmword_23C056B30;
  v60 = objc_msgSend(*(id *)&v20[v21], sel_centerYAnchor);
  v61 = objc_msgSend(v20, sel_contentView);
  v62 = objc_msgSend(v61, sel_centerYAnchor);

  v63 = objc_msgSend(v60, sel_constraintEqualToAnchor_, v62);
  *(_QWORD *)(v59 + 32) = v63;
  v64 = objc_msgSend(*(id *)&v20[v21], sel_leadingAnchor);
  v65 = objc_msgSend(v20, sel_contentView);
  v66 = objc_msgSend(v65, sel_leadingAnchor);

  v67 = objc_msgSend(v64, sel_constraintGreaterThanOrEqualToAnchor_, v66);
  *(_QWORD *)(v59 + 40) = v67;
  v68 = objc_msgSend(*(id *)&v20[v21], sel_trailingAnchor);
  v69 = objc_msgSend(v20, sel_contentView);
  v70 = objc_msgSend(v69, sel_trailingAnchor);

  v71 = objc_msgSend(v68, sel_constraintLessThanOrEqualToAnchor_, v70);
  *(_QWORD *)(v59 + 48) = v71;
  sub_23C054128();
  sub_23C03CC54();
  v72 = (void *)sub_23C054110();
  swift_bridgeObjectRelease();
  objc_msgSend(v58, sel_activateConstraints_, v72, v59, 0x447A00003F800000);

  return v20;
}

id TabItemCell.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id sub_23C03C2F8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  objc_super v12;

  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for TabItemCell();
  objc_msgSendSuper2(&v12, sel_prepareForReuse);
  v1 = &v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem];
  v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem];
  v3 = *(_QWORD *)&v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 8];
  v4 = *(_QWORD *)&v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 16];
  v5 = *(_QWORD *)&v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 24];
  v6 = *(_QWORD *)&v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 32];
  v7 = *(_QWORD *)&v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 40];
  v8 = *(_QWORD *)&v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 48];
  v9 = *(_QWORD *)&v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 56];
  v10 = *(_OWORD *)&v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 64];
  *(_OWORD *)v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_OWORD *)v1 + 2) = 0u;
  *((_OWORD *)v1 + 3) = 0u;
  *((_QWORD *)v1 + 8) = 0;
  *((_QWORD *)v1 + 9) = 1;
  *((_QWORD *)v1 + 10) = 0;
  *((_QWORD *)v1 + 11) = 0;
  sub_23C03CEB4(v2, v3, v4, v5, v6, v7, v8, v9, v10, *((uint64_t *)&v10 + 1));
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView], sel_setImage_, 0);
  return objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_titleLabel], sel_setText_, 0);
}

id sub_23C03C3DC(double *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  id result;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[12];
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
  double v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  uint64_t v79;
  double v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;

  v3 = *a1;
  v4 = *((_QWORD *)a1 + 1);
  v5 = *((_QWORD *)a1 + 2);
  v6 = *((_QWORD *)a1 + 3);
  v8 = *((_QWORD *)a1 + 4);
  v7 = a1[5];
  v10 = *((_QWORD *)a1 + 6);
  v9 = a1[7];
  v11 = *((_QWORD *)a1 + 8);
  v12 = *((_QWORD *)a1 + 9);
  v14 = *((_QWORD *)a1 + 10);
  v13 = *((_QWORD *)a1 + 11);
  v15 = *a2;
  v16 = v2 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem;
  v17 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 8);
  v19 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 16);
  v18 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 24);
  v21 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 32);
  v20 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 40);
  v23 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 48);
  v22 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 56);
  v24 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 64);
  v25 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 72);
  v26 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 80);
  v27 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 88);
  v57 = v11;
  if (v25 == 1)
  {
    v56 = *a2;
    v61 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem);
    v62 = v17;
    v63 = v19;
    v64 = v18;
    v65 = v21;
    v66 = v20;
    v67 = v23;
    v68 = v22;
    v69 = v24;
    v70 = 1;
    v71 = v26;
    v72 = v27;
    v73 = v3;
    v74 = v4;
    v75 = v5;
    v76 = v6;
    v77 = v8;
    v78 = v7;
    v79 = v10;
    v80 = v9;
    v81 = v11;
    v82 = v12;
    v83 = v14;
    v84 = v13;
    v28 = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23C03CEF0((uint64_t)&v61);
    v29 = v14;
  }
  else
  {
    v61 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem);
    v62 = v17;
    v63 = v19;
    v64 = v18;
    v65 = v21;
    v66 = v20;
    v67 = v23;
    v68 = v22;
    v69 = v24;
    v70 = v25;
    v71 = v26;
    v72 = v27;
    *(double *)v60 = v3;
    v60[1] = v4;
    v60[2] = v5;
    v60[3] = v6;
    v60[4] = v8;
    *(double *)&v60[5] = v7;
    v60[6] = v10;
    *(double *)&v60[7] = v9;
    v60[8] = v11;
    v60[9] = v12;
    v60[10] = v14;
    v60[11] = v13;
    v30 = _s13FitnessCoreUI7TabItemV2eeoiySbAC_ACtFZ_0((uint64_t)&v61, (uint64_t)v60);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    result = (id)swift_bridgeObjectRelease();
    if ((v30 & 1) != 0)
      return result;
    v56 = v15;
    v28 = v57;
    v29 = v58;
  }
  v32 = *(_QWORD *)v16;
  v33 = *(_QWORD *)(v16 + 8);
  v34 = *(_QWORD *)(v16 + 16);
  v35 = *(_QWORD *)(v16 + 24);
  v36 = *(_QWORD *)(v16 + 32);
  v54 = *(_QWORD *)(v16 + 48);
  v55 = *(_QWORD *)(v16 + 40);
  v53 = *(_QWORD *)(v16 + 56);
  v52 = *(_OWORD *)(v16 + 64);
  *(double *)v16 = v3;
  *(_QWORD *)(v16 + 8) = v4;
  *(_QWORD *)(v16 + 16) = v5;
  *(_QWORD *)(v16 + 24) = v6;
  *(_QWORD *)(v16 + 32) = v8;
  *(double *)(v16 + 40) = v7;
  *(_QWORD *)(v16 + 48) = v10;
  *(double *)(v16 + 56) = v9;
  *(_QWORD *)(v16 + 64) = v28;
  *(_QWORD *)(v16 + 72) = v12;
  *(_QWORD *)(v16 + 80) = v29;
  *(_QWORD *)(v16 + 88) = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23C03CEB4(v32, v33, v34, v35, v36, v55, v54, v53, v52, *((uint64_t *)&v52 + 1));
  if (v56)
  {
    v37 = v59;
    objc_msgSend(*(id *)(v59 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewCenterXConstraint), sel_setActive_, 0);
    if (v56 == 1)
    {
      objc_msgSend(*(id *)(v59 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewTrailingConstraint), sel_setActive_, 0);
      v38 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewLeadingConstraint;
      objc_msgSend(*(id *)(v59 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewLeadingConstraint), sel_setActive_, 1);
      objc_msgSend(*(id *)(v59 + v38), sel_setConstant_, v7);
    }
    else
    {
      objc_msgSend(*(id *)(v59 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewLeadingConstraint), sel_setActive_, 0);
      v39 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewTrailingConstraint;
      objc_msgSend(*(id *)(v59 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewTrailingConstraint), sel_setActive_, 1);
      objc_msgSend(*(id *)(v59 + v39), sel_setConstant_, -v9);
    }
  }
  else
  {
    v37 = v59;
    objc_msgSend(*(id *)(v59 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewLeadingConstraint), sel_setActive_, 0);
    objc_msgSend(*(id *)(v59 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewTrailingConstraint), sel_setActive_, 0);
    objc_msgSend(*(id *)(v59 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewCenterXConstraint), sel_setActive_, 1);
  }
  v40 = v13;
  if (v12)
  {
    v41 = *(void **)(v37 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView);
    result = objc_msgSend((id)objc_opt_self(), sel__preferredFontForTextStyle_weight_, *MEMORY[0x24BEBE1D0], *MEMORY[0x24BEBB600]);
    if (!result)
    {
      __break(1u);
      return result;
    }
    v42 = result;
    v43 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_scale_, result, 2);

    v44 = v43;
    swift_bridgeObjectRetain();
    v45 = (void *)sub_23C054014();
    swift_bridgeObjectRelease();
    v46 = objc_msgSend((id)objc_opt_self(), sel__systemImageNamed_withConfiguration_, v45, v44);

    objc_msgSend(v41, sel_setImage_, v46);
  }
  v47 = *(void **)(v37 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView);
  v48 = objc_msgSend(v47, sel_image);
  v49 = v48;
  if (v48)

  objc_msgSend(v47, sel_setHidden_, v49 == 0);
  v50 = *(void **)(v37 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_titleLabel);
  if (v40)
    v51 = (void *)sub_23C054014();
  else
    v51 = 0;
  objc_msgSend(v50, sel_setText_, v51);

  return objc_msgSend(v50, sel_setHidden_, v40 == 0);
}

void sub_23C03C8AC(char a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem + 72);
  if (v2 != 1)
  {
    if ((a1 & 1) != 0)
    {
      if (!v2)
      {
LABEL_6:
        v13 = *(void **)(v1 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_titleLabel);
        v14 = objc_msgSend((id)objc_opt_self(), sel__preferredFontForTextStyle_maximumContentSizeCategory_, *MEMORY[0x24BEBE200], *MEMORY[0x24BEBE0B8]);
LABEL_12:
        v25 = v14;
        objc_msgSend(v13, sel_setFont_);

        return;
      }
      v3 = *(void **)(v1 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView);
      v4 = (void *)objc_opt_self();
      v5 = *MEMORY[0x24BEBE1D0];
      v6 = *MEMORY[0x24BEBB600];
      swift_bridgeObjectRetain();
      v7 = objc_msgSend(v4, sel__preferredFontForTextStyle_weight_, v5, v6);
      if (v7)
      {
        v8 = v7;
        v9 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_scale_, v7, 2);

        swift_bridgeObjectRetain();
        v10 = v9;
        v11 = (void *)sub_23C054014();
        swift_bridgeObjectRelease();
        v12 = objc_msgSend((id)objc_opt_self(), sel__systemImageNamed_withConfiguration_, v11, v10);

        objc_msgSend(v3, sel_setImage_, v12);
        swift_bridgeObjectRelease();

        goto LABEL_6;
      }
      __break(1u);
      goto LABEL_14;
    }
    if (v2)
    {
      v15 = *(void **)(v1 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView);
      v16 = (void *)objc_opt_self();
      v17 = *MEMORY[0x24BEBE1D0];
      v18 = *MEMORY[0x24BEBB600];
      swift_bridgeObjectRetain();
      v19 = objc_msgSend(v16, sel__preferredFontForTextStyle_weight_, v17, v18);
      if (!v19)
      {
LABEL_14:
        __break(1u);
        return;
      }
      v20 = v19;
      v21 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_scale_, v19, 2);

      swift_bridgeObjectRetain();
      v22 = v21;
      v23 = (void *)sub_23C054014();
      swift_bridgeObjectRelease();
      v24 = objc_msgSend((id)objc_opt_self(), sel__systemImageNamed_withConfiguration_, v23, v22);

      objc_msgSend(v15, sel_setImage_, v24);
      swift_bridgeObjectRelease();

    }
    else
    {
      v17 = *MEMORY[0x24BEBE1D0];
    }
    v13 = *(void **)(v1 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_titleLabel);
    v14 = objc_msgSend((id)objc_opt_self(), sel__preferredFontForTextStyle_maximumContentSizeCategory_, v17, *MEMORY[0x24BEBE0B8]);
    goto LABEL_12;
  }
}

unint64_t sub_23C03CC0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B03408;
  if (!qword_256B03408)
  {
    type metadata accessor for UILayoutPriority(255);
    result = MEMORY[0x242615EC8](MEMORY[0x24BEBCC60], v1);
    atomic_store(result, (unint64_t *)&qword_256B03408);
  }
  return result;
}

unint64_t sub_23C03CC54()
{
  unint64_t result;

  result = qword_256B03E70;
  if (!qword_256B03E70)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256B03E70);
  }
  return result;
}

id TabItemCell.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TabItemCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void _s13FitnessCoreUI11TabItemCellC5coderACSgSo7NSCoderC_tcfc_0()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackView;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD978]), sel_init);
  v2 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView;
  *(_QWORD *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_init);
  v3 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_titleLabel;
  *(_QWORD *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  v4 = &v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem];
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 8) = 0;
  *((_QWORD *)v4 + 9) = 1;
  *((_QWORD *)v4 + 10) = 0;
  *((_QWORD *)v4 + 11) = 0;
  v5 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewCenterXConstraint;
  *(_QWORD *)&v0[v5] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1628]), sel_init);
  v6 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewLeadingConstraint;
  *(_QWORD *)&v0[v6] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1628]), sel_init);
  v7 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewTrailingConstraint;
  *(_QWORD *)&v0[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1628]), sel_init);

  sub_23C05435C();
  __break(1u);
}

uint64_t sub_23C03CEB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t result;

  result = a10;
  if (a10 != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23C03CEF0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 104);
  v11 = *(_QWORD *)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 112);
  v4 = *(_QWORD *)(a1 + 120);
  v5 = *(_QWORD *)(a1 + 128);
  v6 = *(_QWORD *)(a1 + 136);
  v7 = *(_QWORD *)(a1 + 144);
  v8 = *(_QWORD *)(a1 + 152);
  v10 = *(_OWORD *)(a1 + 160);
  sub_23C03CEB4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  sub_23C03CEB4(v11, v2, v3, v4, v5, v6, v7, v8, v10, *((uint64_t *)&v10 + 1));
  return a1;
}

unint64_t sub_23C03CFB4()
{
  unint64_t result;

  result = qword_256B03410;
  if (!qword_256B03410)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItemCell.Position, &type metadata for TabItemCell.Position);
    atomic_store(result, (unint64_t *)&qword_256B03410);
  }
  return result;
}

uint64_t method lookup function for TabItemCell()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TabItemCell.applyItem(_:at:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t storeEnumTagSinglePayload for TabItemCell.Position(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C03D06C + 4 * byte_23C056B45[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C03D0A0 + 4 * byte_23C056B40[v4]))();
}

uint64_t sub_23C03D0A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C03D0A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C03D0B0);
  return result;
}

uint64_t sub_23C03D0BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C03D0C4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C03D0C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C03D0D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TabItemCell.Position()
{
  return &type metadata for TabItemCell.Position;
}

uint64_t TabItemDescriptor.isHidden.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

void TabItemDescriptor.preferredStyle.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 1);
}

uint64_t TabItemDescriptor.systemImageName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TabItemDescriptor.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23C03D158()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23C03D188 + 4 * byte_23C056C00[*v0]))(0x6E65646469487369, 0xE800000000000000);
}

uint64_t sub_23C03D188()
{
  return 0x6572726566657270;
}

uint64_t sub_23C03D1AC()
{
  return 0x6D496D6574737973;
}

uint64_t sub_23C03D1D0()
{
  return 0x656C746974;
}

uint64_t sub_23C03D1E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C03DE2C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C03D208()
{
  sub_23C03D40C();
  return sub_23C05456C();
}

uint64_t sub_23C03D230()
{
  sub_23C03D40C();
  return sub_23C054578();
}

uint64_t TabItemDescriptor.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[5];
  int v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03440);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(unsigned __int8 *)(v1 + 1);
  v8 = *(_QWORD *)(v1 + 8);
  v11[3] = *(_QWORD *)(v1 + 16);
  v11[4] = v8;
  v9 = *(_QWORD *)(v1 + 24);
  v11[1] = *(_QWORD *)(v1 + 32);
  v11[2] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C03D40C();
  sub_23C054560();
  v17 = 0;
  sub_23C05444C();
  if (!v2)
  {
    v16 = v12;
    v15 = 1;
    sub_23C03D450();
    sub_23C054464();
    v14 = 2;
    sub_23C054434();
    v13 = 3;
    sub_23C054440();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23C03D40C()
{
  unint64_t result;

  result = qword_256B03448;
  if (!qword_256B03448)
  {
    result = MEMORY[0x242615EC8](&unk_23C056DB8, &type metadata for TabItemDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03448);
  }
  return result;
}

unint64_t sub_23C03D450()
{
  unint64_t result;

  result = qword_256B03450;
  if (!qword_256B03450)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItemStyle, &type metadata for TabItemStyle);
    atomic_store(result, (unint64_t *)&qword_256B03450);
  }
  return result;
}

uint64_t TabItemDescriptor.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v19;
  int v20;
  char v21;
  char v22;
  char v23;
  unsigned __int8 v24;
  char v25;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03458);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C03D40C();
  sub_23C054554();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v25 = 0;
  v9 = sub_23C0543EC();
  v23 = 1;
  sub_23C03D6C0();
  sub_23C054404();
  v10 = v24;
  v22 = 2;
  v19 = sub_23C0543D4();
  v20 = v10;
  v21 = 3;
  v12 = v11;
  swift_bridgeObjectRetain();
  v13 = sub_23C0543E0();
  v15 = v14;
  v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v17 = v13;
  v16(v8, v5);
  *(_BYTE *)a2 = v9 & 1;
  *(_BYTE *)(a2 + 1) = v20;
  *(_QWORD *)(a2 + 8) = v19;
  *(_QWORD *)(a2 + 16) = v12;
  *(_QWORD *)(a2 + 24) = v17;
  *(_QWORD *)(a2 + 32) = v15;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_23C03D6C0()
{
  unint64_t result;

  result = qword_256B03460;
  if (!qword_256B03460)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItemStyle, &type metadata for TabItemStyle);
    atomic_store(result, (unint64_t *)&qword_256B03460);
  }
  return result;
}

uint64_t sub_23C03D704@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TabItemDescriptor.init(from:)(a1, a2);
}

uint64_t sub_23C03D718(_QWORD *a1)
{
  return TabItemDescriptor.encode(to:)(a1);
}

uint64_t TabItemDescriptor.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_23C054524();
  sub_23C054518();
  sub_23C054524();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_23C05405C();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_23C05405C();
  return swift_bridgeObjectRelease();
}

uint64_t TabItemDescriptor.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_23C05450C();
  sub_23C054524();
  sub_23C054518();
  sub_23C054524();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_23C05405C();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_23C05405C();
  swift_bridgeObjectRelease();
  return sub_23C054548();
}

uint64_t sub_23C03D8A8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_23C05450C();
  sub_23C054524();
  sub_23C054518();
  sub_23C054524();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_23C05405C();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_23C05405C();
  swift_bridgeObjectRelease();
  return sub_23C054548();
}

uint64_t _s13FitnessCoreUI17TabItemDescriptorV2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  result = 0;
  if (*a1 != *a2 || a1[1] != a2[1])
    return result;
  v4 = *((_QWORD *)a1 + 2);
  v5 = *((_QWORD *)a1 + 3);
  v6 = *((_QWORD *)a1 + 4);
  v7 = *((_QWORD *)a2 + 2);
  v8 = *((_QWORD *)a2 + 3);
  v9 = *((_QWORD *)a2 + 4);
  if (!v4)
  {
    if (!v7)
    {
LABEL_11:
      if (v5 == v8 && v6 == v9)
        return 1;
      else
        return sub_23C054488();
    }
    return 0;
  }
  if (!v7)
    return 0;
  if (*((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1) && v4 == v7)
    goto LABEL_11;
  v10 = sub_23C054488();
  result = 0;
  if ((v10 & 1) != 0)
    goto LABEL_11;
  return result;
}

unint64_t sub_23C03DA54()
{
  unint64_t result;

  result = qword_256B03468;
  if (!qword_256B03468)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItemDescriptor, &type metadata for TabItemDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B03468);
  }
  return result;
}

uint64_t destroy for TabItemDescriptor()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TabItemDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_WORD *)a1 = *(_WORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TabItemDescriptor(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
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

uint64_t assignWithTake for TabItemDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TabItemDescriptor(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TabItemDescriptor(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TabItemDescriptor()
{
  return &type metadata for TabItemDescriptor;
}

uint64_t storeEnumTagSinglePayload for TabItemDescriptor.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C03DCD4 + 4 * byte_23C056C09[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C03DD08 + 4 * byte_23C056C04[v4]))();
}

uint64_t sub_23C03DD08(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C03DD10(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C03DD18);
  return result;
}

uint64_t sub_23C03DD24(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C03DD2CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C03DD30(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C03DD38(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TabItemDescriptor.CodingKeys()
{
  return &type metadata for TabItemDescriptor.CodingKeys;
}

unint64_t sub_23C03DD58()
{
  unint64_t result;

  result = qword_256B03470;
  if (!qword_256B03470)
  {
    result = MEMORY[0x242615EC8](&unk_23C056D90, &type metadata for TabItemDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03470);
  }
  return result;
}

unint64_t sub_23C03DDA0()
{
  unint64_t result;

  result = qword_256B03478;
  if (!qword_256B03478)
  {
    result = MEMORY[0x242615EC8](&unk_23C056D00, &type metadata for TabItemDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03478);
  }
  return result;
}

unint64_t sub_23C03DDE8()
{
  unint64_t result;

  result = qword_256B03480;
  if (!qword_256B03480)
  {
    result = MEMORY[0x242615EC8](&unk_23C056D28, &type metadata for TabItemDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03480);
  }
  return result;
}

uint64_t sub_23C03DE2C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E65646469487369 && a2 == 0xE800000000000000;
  if (v2 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6572726566657270 && a2 == 0xEE00656C79745364 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6D496D6574737973 && a2 == 0xEF656D614E656761 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23C054488();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t DynamicTypeSize.init(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;

  v2 = sub_23C053E70();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(a1, v2);
  if (v4 == *MEMORY[0x24BDECF20])
    return 1;
  if (v4 == *MEMORY[0x24BDECF08])
    return 2;
  if (v4 == *MEMORY[0x24BDECF10])
    return 3;
  if (v4 == *MEMORY[0x24BDECF00])
    return 4;
  if (v4 == *MEMORY[0x24BDECF18])
    return 5;
  if (v4 == *MEMORY[0x24BDECF28])
    return 6;
  if (v4 == *MEMORY[0x24BDECF38])
    return 7;
  if (v4 == *MEMORY[0x24BDECEA0])
    return 8;
  if (v4 == *MEMORY[0x24BDECEA8])
    return 9;
  if (v4 == *MEMORY[0x24BDECEC0])
    return 10;
  if (v4 == *MEMORY[0x24BDECED0])
    return 11;
  if (v4 == *MEMORY[0x24BDECEE0])
    return 12;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return 0;
}

uint64_t dispatch thunk of GridLayoutProviding.gridDescriptor(ofKind:compatibleWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of GridLayoutProviding.itemWidthForGrid(ofKind:compatibleWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of GridLayoutProviding.itemWidthForGrid(ofKind:inContainerOfWidth:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_23C03E1EC()
{
  return sub_23C053E58();
}

uint64_t sub_23C03E204@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03490);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

void View.focusedSection()()
{
  JUMPOUT(0x242615580);
}

uint64_t sub_23C03E258(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_23C053E7C();
  v4[0] = v1;
  v4[1] = sub_23C03E2AC();
  return MEMORY[0x242615EC8](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_23C03E2AC()
{
  unint64_t result;

  result = qword_256B03488;
  if (!qword_256B03488)
  {
    result = MEMORY[0x242615EC8](&unk_23C056E34, &type metadata for FocusSection);
    atomic_store(result, (unint64_t *)&qword_256B03488);
  }
  return result;
}

ValueMetadata *type metadata accessor for FocusSection()
{
  return &type metadata for FocusSection;
}

uint64_t sub_23C03E300()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_23C03E314()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B03498;
  if (!qword_256B03498)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B03490);
    result = MEMORY[0x242615EC8](MEMORY[0x24BDEFB78], v1);
    atomic_store(result, (unint64_t *)&qword_256B03498);
  }
  return result;
}

uint64_t MarqueeLabel.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2;
  *(_BYTE *)(a3 + 16) = 0;
  return result;
}

uint64_t MarqueeLabel.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v4 = sub_23C053CD8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C03B7B4(0, &qword_256B034A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = sub_23C05420C();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  *(_QWORD *)a2 = v8;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  return result;
}

uint64_t MarqueeLabel.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  return result;
}

id MarqueeLabel.makeUIView(context:)()
{
  id v0;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  objc_msgSend(v0, sel_setMarqueeEnabled_, 1);
  objc_msgSend(v0, sel_setNumberOfLines_, 1);
  return v0;
}

double MarqueeLabel.sizeThatFits(_:uiView:context:)(uint64_t a1, char a2, uint64_t a3, char a4, id a5)
{
  double v5;
  double result;

  v5 = 10.0;
  if ((a2 & 1) != 0)
    *(double *)&a1 = 10.0;
  if ((a4 & 1) == 0)
    v5 = *(double *)&a3;
  objc_msgSend(a5, sel_sizeThatFits_, *(double *)&a1, v5);
  if (*(double *)&a1 < result)
    return *(double *)&a1;
  return result;
}

uint64_t MarqueeLabel.updateUIView(_:context:)(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  char *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  id v36;
  uint64_t v37;

  v36 = a1;
  v33 = sub_23C053F78();
  v4 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23C053EB8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v30 - v12;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v30 - v15;
  v17 = *(void **)v2;
  v31 = *(_QWORD *)(v2 + 8);
  v32 = v17;
  v34 = *(unsigned __int8 *)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B034A8);
  v37 = a2;
  sub_23C053F54();
  v18 = sub_23C053EA0();
  v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v20 = v16;
  v21 = v18;
  v19(v20, v7);
  if (!v21)
    v21 = sub_23C053F6C();
  sub_23C053F54();
  sub_23C053E88();
  v19(v13, v7);
  v35 = v21;
  v22 = (void *)sub_23C053F60();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v33);
  v23 = v36;
  objc_msgSend(v36, sel_setFont_, v22);

  sub_23C053F54();
  v24 = (void *)sub_23C053E94();
  v19(v10, v7);
  if (v24)
  {
    sub_23C03B7B4(0, &qword_256B034B0);
    v24 = (void *)sub_23C054230();
  }
  objc_msgSend(v23, sel_setTextColor_, v24);

  if ((v34 & 1) != 0)
  {
    objc_msgSend(v23, sel_setAttributedText_, v32);
  }
  else
  {
    v25 = v31;
    swift_bridgeObjectRetain();
    v26 = v32;
    v27 = (void *)sub_23C054014();
    sub_23C03E7D4(v26, v25, 0);
    objc_msgSend(v23, sel_setText_, v27);

  }
  sub_23C053F54();
  v28 = sub_23C053EAC();
  v19(v13, v7);
  objc_msgSend(v23, sel_setMarqueeRunning_, v28 & 1);
  return swift_release();
}

void sub_23C03E7D4(void *a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

unint64_t sub_23C03E7E8()
{
  unint64_t result;

  result = qword_256B034B8;
  if (!qword_256B034B8)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for MarqueeLabel, &type metadata for MarqueeLabel);
    atomic_store(result, (unint64_t *)&qword_256B034B8);
  }
  return result;
}

id sub_23C03E82C()
{
  id v0;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  objc_msgSend(v0, sel_setMarqueeEnabled_, 1);
  objc_msgSend(v0, sel_setNumberOfLines_, 1);
  return v0;
}

double sub_23C03E89C(uint64_t a1, char a2, uint64_t a3, char a4, id a5)
{
  double v5;
  double result;

  v5 = 10.0;
  if ((a2 & 1) != 0)
    *(double *)&a1 = 10.0;
  if ((a4 & 1) == 0)
    v5 = *(double *)&a3;
  objc_msgSend(a5, sel_sizeThatFits_, *(double *)&a1, v5);
  if (*(double *)&a1 < result)
    return *(double *)&a1;
  return result;
}

uint64_t sub_23C03E908()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_23C03E914()
{
  sub_23C03EBC0();
  return sub_23C053F30();
}

uint64_t sub_23C03E964()
{
  sub_23C03EBC0();
  return sub_23C053EDC();
}

void sub_23C03E9B4()
{
  sub_23C03EBC0();
  sub_23C053F24();
  __break(1u);
}

id sub_23C03E9DC(void *a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return a1;
  else
    return (id)swift_bridgeObjectRetain();
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for MarqueeLabel()
{
  return &type metadata for MarqueeLabel;
}

void destroy for MarqueeLabel.Content(uint64_t a1)
{
  sub_23C03E7D4(*(void **)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s13FitnessCoreUI12MarqueeLabelV7ContentOwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  char v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23C03E9DC(*(void **)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s13FitnessCoreUI12MarqueeLabelV7ContentOwca_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  char v8;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23C03E9DC(*(void **)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_23C03E7D4(v6, v7, v8);
  return a1;
}

uint64_t _s13FitnessCoreUI12MarqueeLabelV7ContentOwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_23C03E7D4(v4, v5, v6);
  return a1;
}

uint64_t _s13FitnessCoreUI12MarqueeLabelV7ContentOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s13FitnessCoreUI12MarqueeLabelV7ContentOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_23C03EB9C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_23C03EBA4(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MarqueeLabel.Content()
{
  return &type metadata for MarqueeLabel.Content;
}

unint64_t sub_23C03EBC0()
{
  unint64_t result;

  result = qword_256B034C0;
  if (!qword_256B034C0)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for MarqueeLabel, &type metadata for MarqueeLabel);
    atomic_store(result, (unint64_t *)&qword_256B034C0);
  }
  return result;
}

uint64_t dispatch thunk of AppLayoutProviding.gridProvider.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_23C03EC10(unint64_t a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  char *v28;
  id v29;
  void *v30;
  uint64_t v31;
  char *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  char *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  objc_super v50;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256B03F00);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v42 - v7;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v42 - v10;
  v12 = sub_23C053D20();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v46 = (char *)&v42 - v17;
  sub_23C03F890();
  v18 = (void *)sub_23C054110();
  v19 = (objc_class *)type metadata accessor for FloatingLayout();
  v50.receiver = v1;
  v50.super_class = v19;
  objc_msgSendSuper2(&v50, sel_prepareForCollectionViewUpdates_, v18);

  v20 = a1;
  v47 = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v20 = v47;
    result = sub_23C054368();
    v21 = result;
    v43 = v1;
    if (result)
      goto LABEL_3;
LABEL_29:
    v24 = MEMORY[0x24BEE4AF8];
LABEL_30:
    swift_bridgeObjectRelease();
    v41 = sub_23C0416E4(v24);
    swift_bridgeObjectRelease();
    *(_QWORD *)&v43[OBJC_IVAR____TtC13FitnessCoreUI14FloatingLayout_animatableIndexPaths] = v41;
    return swift_bridgeObjectRelease();
  }
  v21 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  v43 = v1;
  if (!v21)
    goto LABEL_29;
LABEL_3:
  v48 = v21;
  if (v21 >= 1)
  {
    v44 = v5;
    v23 = 0;
    v49 = v20 & 0xC000000000000001;
    v24 = MEMORY[0x24BEE4AF8];
    v25 = v48;
    v45 = v15;
    while (1)
    {
      if (v49)
        v26 = (id)MEMORY[0x242615880](v23, v20);
      else
        v26 = *(id *)(v20 + 8 * v23 + 32);
      v27 = v26;
      v28 = (char *)objc_msgSend(v26, sel_updateAction);
      if ((unint64_t)(v28 - 2) < 3)
        goto LABEL_15;
      if (!v28)
      {
        v32 = v8;
        v33 = objc_msgSend(v27, sel_indexPathAfterUpdate);
        if (v33)
        {
          v34 = v33;
          v35 = (uint64_t)v44;
          sub_23C053CF0();

          v36 = 0;
        }
        else
        {
          v36 = 1;
          v35 = (uint64_t)v44;
        }
        v25 = v48;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(v35, v36, 1, v12);
        sub_23C0418A8(v35, (uint64_t)v11);
        v8 = v32;
        v15 = v45;
        goto LABEL_22;
      }
      if (v28 == (char *)1)
      {
        v29 = objc_msgSend(v27, sel_indexPathBeforeUpdate);
        if (v29)
        {
          v30 = v29;
          sub_23C053CF0();

          v31 = 0;
        }
        else
        {
          v31 = 1;
        }
        v25 = v48;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v8, v31, 1, v12);
        sub_23C0418A8((uint64_t)v8, (uint64_t)v11);
      }
      else
      {
LABEL_15:
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
      }
LABEL_22:

      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
      {
        sub_23C03F8CC((uint64_t)v11);
      }
      else
      {
        v37 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
        v38 = v46;
        v37(v46, v11, v12);
        v37(v15, v38, v12);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v24 = sub_23C03F90C(0, *(_QWORD *)(v24 + 16) + 1, 1, v24);
        v40 = *(_QWORD *)(v24 + 16);
        v39 = *(_QWORD *)(v24 + 24);
        if (v40 >= v39 >> 1)
          v24 = sub_23C03F90C(v39 > 1, v40 + 1, 1, v24);
        *(_QWORD *)(v24 + 16) = v40 + 1;
        v37((char *)(v24+ ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(_QWORD *)(v13 + 72) * v40), v15, v12);
        v20 = v47;
        v25 = v48;
      }
      if (v25 == ++v23)
        goto LABEL_30;
    }
  }
  __break(1u);
  return result;
}

id sub_23C03F08C(uint64_t a1)
{
  char *v1;
  char *v2;
  void *v4;
  id v5;
  uint64_t v6;
  CGAffineTransform v8;
  objc_super v9;

  v2 = v1;
  v4 = (void *)sub_23C053CE4();
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for FloatingLayout();
  v5 = objc_msgSendSuper2(&v9, sel_initialLayoutAttributesForAppearingItemAtIndexPath_, v4);

  v6 = *(_QWORD *)&v2[OBJC_IVAR____TtC13FitnessCoreUI14FloatingLayout_animatableIndexPaths];
  swift_bridgeObjectRetain();
  LOBYTE(a1) = sub_23C03F188(a1, v6);
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0 && v5)
  {
    objc_msgSend(v5, sel_setAlpha_, 0.0);
    CGAffineTransformMakeScale(&v8, 0.2, 0.2);
    objc_msgSend(v5, sel_setTransform_, &v8);
    objc_msgSend(v5, sel_setZIndex_, 1);
  }
  return v5;
}

uint64_t sub_23C03F188(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, unint64_t, uint64_t);
  char v12;
  uint64_t v14;
  uint64_t v15;

  v3 = sub_23C053D20();
  v15 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a2 + 16)
    && (sub_23C03F850(&qword_256B03560, MEMORY[0x24BDCF690]),
        v6 = sub_23C053FF0(),
        v7 = -1 << *(_BYTE *)(a2 + 32),
        v8 = v6 & ~v7,
        ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0))
  {
    v9 = ~v7;
    v10 = *(_QWORD *)(v15 + 72);
    v11 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
    do
    {
      v11(v5, *(_QWORD *)(a2 + 48) + v10 * v8, v3);
      sub_23C03F850(&qword_256B03568, MEMORY[0x24BDCF6A0]);
      v12 = sub_23C054008();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v3);
      if ((v12 & 1) != 0)
        break;
      v8 = (v8 + 1) & v9;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

BOOL sub_23C03F2FC(uint64_t a1, double a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  double *v10;
  double v11;
  _BOOL4 v12;
  _BOOL8 result;

  if (!*(_QWORD *)(a1 + 16))
    return 0;
  sub_23C05450C();
  sub_23C02F0C8();
  v6 = sub_23C054548();
  v7 = -1 << *(_BYTE *)(a1 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(a1 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
    return 0;
  v9 = ~v7;
  do
  {
    v10 = (double *)(*(_QWORD *)(a1 + 48) + 16 * v8);
    v11 = v10[1];
    v12 = *v10 == a2;
    result = v11 == a3 && v12;
    if (result)
      break;
    v8 = (v8 + 1) & v9;
  }
  while (((*(_QWORD *)(a1 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  return result;
}

id sub_23C03F78C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FloatingLayout();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FloatingLayout()
{
  return objc_opt_self();
}

uint64_t sub_23C03F7EC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

id sub_23C03F810()
{
  uint64_t v0;

  return (id)(*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
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

uint64_t sub_23C03F850(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23C053D20();
    result = MEMORY[0x242615EC8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C03F890()
{
  unint64_t result;

  result = qword_256B03570;
  if (!qword_256B03570)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256B03570);
  }
  return result;
}

uint64_t sub_23C03F8CC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256B03F00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C03F90C(char a1, int64_t a2, char a3, unint64_t a4)
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
  unint64_t v17;
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
        goto LABEL_29;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03580);
  v10 = *(_QWORD *)(sub_23C053D20() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_23C054350();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_23C053D20() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23C0418F0(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_23C03FB14(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  unsigned __int8 *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  BOOL v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char isUniquelyReferenced_nonNull_native;
  __int128 v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v5 = *v2;
  sub_23C05450C();
  v6 = *(_BYTE *)a2 & 1;
  v7 = *(unsigned __int8 *)(a2 + 1);
  v8 = *(_QWORD *)(a2 + 8);
  v9 = *(_QWORD *)(a2 + 16);
  sub_23C054524();
  sub_23C054518();
  v33 = v2;
  sub_23C054524();
  swift_bridgeObjectRetain();
  if (v9)
  {
    swift_bridgeObjectRetain();
    sub_23C05405C();
    swift_bridgeObjectRelease();
  }
  v10 = *(_QWORD *)(a2 + 24);
  v11 = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  v37 = v10;
  sub_23C05405C();
  swift_bridgeObjectRelease();
  v12 = sub_23C054548();
  v13 = -1 << *(_BYTE *)(v5 + 32);
  v14 = v12 & ~v13;
  v34 = a2;
  v35 = a1;
  if (((*(_QWORD *)(v5 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v36 = v8;
    v15 = ~v13;
    v16 = *(_QWORD *)(v5 + 48);
    v17 = v7;
    do
    {
      v18 = (unsigned __int8 *)(v16 + 40 * v14);
      if ((((v6 != 0) ^ *v18) & 1) != 0 || v18[1] != v17)
        goto LABEL_6;
      v19 = *((_QWORD *)v18 + 2);
      v20 = *((_QWORD *)v18 + 3);
      v21 = *((_QWORD *)v18 + 4);
      if (v19)
      {
        if (!v9)
          goto LABEL_6;
        if (*((_QWORD *)v18 + 1) != v36 || v19 != v9)
        {
          v23 = sub_23C054488();
          v17 = v7;
          if ((v23 & 1) == 0)
            goto LABEL_6;
        }
      }
      else if (v9)
      {
        goto LABEL_6;
      }
      v24 = v20 == v37 && v21 == v11;
      if (v24 || (v25 = sub_23C054488(), v17 = v7, (v25 & 1) != 0))
      {
        swift_bridgeObjectRelease();
        sub_23C03B780(v34);
        v26 = *(_QWORD *)(*v33 + 48) + 40 * v14;
        v27 = *(_BYTE *)(v26 + 1);
        v28 = *(_QWORD *)(v26 + 8);
        v29 = *(_QWORD *)(v26 + 32);
        *(_BYTE *)v35 = *(_BYTE *)v26;
        *(_BYTE *)(v35 + 1) = v27;
        *(_QWORD *)(v35 + 8) = v28;
        *(_OWORD *)(v35 + 16) = *(_OWORD *)(v26 + 16);
        *(_QWORD *)(v35 + 32) = v29;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        return 0;
      }
LABEL_6:
      v14 = (v14 + 1) & v15;
    }
    while (((*(_QWORD *)(v5 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v38 = *v33;
  *v33 = 0x8000000000000000;
  sub_23C03B74C(v34);
  sub_23C040730(v34, v14, isUniquelyReferenced_nonNull_native);
  *v33 = v38;
  swift_bridgeObjectRelease();
  v32 = *(_OWORD *)(v34 + 16);
  *(_OWORD *)v35 = *(_OWORD *)v34;
  *(_OWORD *)(v35 + 16) = v32;
  *(_QWORD *)(v35 + 32) = *(_QWORD *)(v34 + 32);
  return 1;
}

uint64_t sub_23C03FDEC(uint64_t a1, char *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  char *v24;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;

  v3 = v2;
  v6 = sub_23C053D20();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v2;
  sub_23C03F850(&qword_256B03560, MEMORY[0x24BDCF690]);
  swift_bridgeObjectRetain();
  v30 = a2;
  v11 = sub_23C053FF0();
  v12 = -1 << *(_BYTE *)(v10 + 32);
  v13 = v11 & ~v12;
  v14 = v10;
  v15 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v26 = v2;
    v27 = a1;
    v28 = ~v12;
    v16 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v29 = v16;
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v16 + 16);
    while (1)
    {
      v19 = v14;
      v20 = v18;
      v18(v9, *(_QWORD *)(v14 + 48) + v17 * v13, v6);
      sub_23C03F850(&qword_256B03568, MEMORY[0x24BDCF6A0]);
      v21 = sub_23C054008();
      v22 = *(void (**)(char *, uint64_t))(v29 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v13 = (v13 + 1) & v28;
      v14 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v15 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v26;
        a1 = v27;
        v7 = v29;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v30, v6);
    v20(v27, *(_QWORD *)(*v26 + 48) + v17 * v13, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v24 = v30;
    v18(v9, v30, v6);
    v31 = *v3;
    *v3 = 0x8000000000000000;
    sub_23C0409C4((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *v3 = v31;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_23C040040()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;
  int64_t v37;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03598);
  v3 = sub_23C054290();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v35 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v34 = (unint64_t)(v5 + 63) >> 6;
    v8 = v3 + 56;
    result = swift_retain();
    v10 = 0;
    v36 = v2;
    while (1)
    {
      if (v7)
      {
        v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v37 = v10;
        v14 = v13 | (v10 << 6);
      }
      else
      {
        v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v15 >= v34)
          goto LABEL_35;
        v16 = v35[v15];
        v17 = v10 + 1;
        if (!v16)
        {
          v17 = v10 + 2;
          if (v10 + 2 >= v34)
            goto LABEL_35;
          v16 = v35[v17];
          if (!v16)
          {
            v17 = v10 + 3;
            if (v10 + 3 >= v34)
              goto LABEL_35;
            v16 = v35[v17];
            if (!v16)
            {
              v18 = v10 + 4;
              if (v10 + 4 >= v34)
              {
LABEL_35:
                swift_release();
                v1 = v0;
                v33 = 1 << *(_BYTE *)(v2 + 32);
                if (v33 > 63)
                  bzero(v35, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v33;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v35[v18];
              if (!v16)
              {
                while (1)
                {
                  v17 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_41;
                  if (v17 >= v34)
                    goto LABEL_35;
                  v16 = v35[v17];
                  ++v18;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v17 = v10 + 4;
            }
          }
        }
LABEL_23:
        v7 = (v16 - 1) & v16;
        v37 = v17;
        v14 = __clz(__rbit64(v16)) + (v17 << 6);
      }
      v19 = *(_QWORD *)(v2 + 48) + 40 * v14;
      v20 = *(_BYTE *)v19;
      v21 = *(_BYTE *)(v19 + 1);
      v23 = *(_QWORD *)(v19 + 8);
      v22 = *(_QWORD *)(v19 + 16);
      v25 = *(_QWORD *)(v19 + 24);
      v24 = *(_QWORD *)(v19 + 32);
      sub_23C05450C();
      sub_23C054524();
      sub_23C054518();
      sub_23C054524();
      if (v22)
      {
        swift_bridgeObjectRetain();
        sub_23C05405C();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRetain();
      sub_23C05405C();
      swift_bridgeObjectRelease();
      result = sub_23C054548();
      v26 = -1 << *(_BYTE *)(v4 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v8 + 8 * (v27 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v8 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v8 + 8 * v28);
        }
        while (v32 == -1);
        v11 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      v12 = *(_QWORD *)(v4 + 48) + 40 * v11;
      *(_BYTE *)v12 = v20;
      *(_BYTE *)(v12 + 1) = v21;
      *(_QWORD *)(v12 + 8) = v23;
      *(_QWORD *)(v12 + 16) = v22;
      *(_QWORD *)(v12 + 24) = v25;
      *(_QWORD *)(v12 + 32) = v24;
      ++*(_QWORD *)(v4 + 16);
      v2 = v36;
      v10 = v37;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23C0403CC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_23C053D20();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03588);
  v6 = sub_23C054290();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v35 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v33 = v0;
    v34 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v34)
          goto LABEL_33;
        v19 = v35[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v34)
            goto LABEL_33;
          v19 = v35[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v34)
              goto LABEL_33;
            v19 = v35[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v34)
              {
LABEL_33:
                swift_release();
                v1 = v33;
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 > 63)
                  bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v19 = v35[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v34)
                    goto LABEL_33;
                  v19 = v35[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = v5;
      v22 = *(_QWORD *)(v36 + 72);
      v23 = *(_QWORD *)(v5 + 48) + v22 * v17;
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v24(v4, v23, v2);
      sub_23C03F850(&qword_256B03560, MEMORY[0x24BDCF690]);
      result = sub_23C053FF0();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(*(_QWORD *)(v7 + 48) + v15 * v22, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v21;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_23C040730(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unsigned __int8 *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  v33 = result;
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_29;
  if ((a3 & 1) != 0)
  {
    sub_23C040040();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_23C040BB8();
      goto LABEL_29;
    }
    sub_23C040FBC();
  }
  v8 = *v3;
  sub_23C05450C();
  v9 = *(_BYTE *)v5 & 1;
  v10 = *(unsigned __int8 *)(v5 + 1);
  v12 = *(_QWORD *)(v5 + 8);
  v11 = *(_QWORD *)(v5 + 16);
  sub_23C054524();
  sub_23C054518();
  sub_23C054524();
  if (v11)
  {
    swift_bridgeObjectRetain();
    sub_23C05405C();
    swift_bridgeObjectRelease();
  }
  v13 = *(_QWORD *)(v5 + 24);
  v14 = *(_QWORD *)(v5 + 32);
  swift_bridgeObjectRetain();
  v35 = v13;
  sub_23C05405C();
  swift_bridgeObjectRelease();
  result = sub_23C054548();
  v15 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v15;
  v16 = v8 + 56;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v34 = v12;
    v17 = ~v15;
    v18 = *(_QWORD *)(v8 + 48);
    v19 = v10;
    do
    {
      v20 = (unsigned __int8 *)(v18 + 40 * a2);
      if ((((v9 != 0) ^ *v20) & 1) != 0 || v20[1] != v19)
        goto LABEL_13;
      v21 = *((_QWORD *)v20 + 2);
      v22 = *((_QWORD *)v20 + 3);
      v23 = *((_QWORD *)v20 + 4);
      if (v21)
      {
        if (!v11)
          goto LABEL_13;
        if (*((_QWORD *)v20 + 1) != v34 || v21 != v11)
        {
          result = sub_23C054488();
          v19 = v10;
          if ((result & 1) == 0)
            goto LABEL_13;
        }
      }
      else if (v11)
      {
        goto LABEL_13;
      }
      v25 = v22 == v35 && v23 == v14;
      if (v25 || (result = sub_23C054488(), v19 = v10, (result & 1) != 0))
      {
        result = sub_23C054494();
        __break(1u);
        break;
      }
LABEL_13:
      a2 = (a2 + 1) & v17;
    }
    while (((*(_QWORD *)(v16 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_29:
  v26 = *v32;
  *(_QWORD *)(*v32 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  v27 = *(_QWORD *)(v26 + 48) + 40 * a2;
  v28 = *(_OWORD *)(v33 + 16);
  *(_OWORD *)v27 = *(_OWORD *)v33;
  *(_OWORD *)(v27 + 16) = v28;
  *(_QWORD *)(v27 + 32) = *(_QWORD *)(v33 + 32);
  v29 = *(_QWORD *)(v26 + 16);
  v30 = __OFADD__(v29, 1);
  v31 = v29 + 1;
  if (v30)
    __break(1u);
  else
    *(_QWORD *)(v26 + 16) = v31;
  return result;
}

uint64_t sub_23C0409C4(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, unint64_t, uint64_t);
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = a1;
  v6 = sub_23C053D20();
  v7 = *(_QWORD *)(v6 - 8);
  v8.n128_f64[0] = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(*v3 + 16);
  v12 = *(_QWORD *)(*v3 + 24);
  v26 = v3;
  if (v12 > v11 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_23C0403CC();
  }
  else
  {
    if (v12 > v11)
    {
      sub_23C040D98();
      goto LABEL_12;
    }
    sub_23C041324();
  }
  v13 = *v3;
  sub_23C03F850(&qword_256B03560, MEMORY[0x24BDCF690]);
  v14 = sub_23C053FF0();
  v15 = -1 << *(_BYTE *)(v13 + 32);
  a2 = v14 & ~v15;
  if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v16 = ~v15;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v18(v10, *(_QWORD *)(v13 + 48) + v17 * a2, v6);
      sub_23C03F850(&qword_256B03568, MEMORY[0x24BDCF6A0]);
      v19 = sub_23C054008();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      if ((v19 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v16;
    }
    while (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v20 = v27;
  v21 = *v26;
  *(_QWORD *)(*v26 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, __n128))(v7 + 32))(*(_QWORD *)(v21 + 48) + *(_QWORD *)(v7 + 72) * a2, v20, v6, v8);
  v23 = *(_QWORD *)(v21 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (!v24)
  {
    *(_QWORD *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_23C054494();
  __break(1u);
  return result;
}

void *sub_23C040BB8()
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
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03598);
  v2 = *v0;
  v3 = sub_23C054284();
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
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v23 >= v13)
      goto LABEL_28;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_28;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
      {
        v9 = v23 + 2;
        if (v23 + 2 >= v13)
          goto LABEL_28;
        v24 = *(_QWORD *)(v6 + 8 * v9);
        if (!v24)
          break;
      }
    }
LABEL_27:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    v17 = *(_QWORD *)(v2 + 48) + v16;
    v18 = *(_BYTE *)(v17 + 1);
    v19 = *(_QWORD *)(v17 + 8);
    v20 = *(_QWORD *)(v17 + 32);
    v21 = *(_QWORD *)(v4 + 48) + v16;
    v22 = *(_OWORD *)(v17 + 16);
    *(_BYTE *)v21 = *(_BYTE *)v17;
    *(_BYTE *)(v21 + 1) = v18;
    *(_QWORD *)(v21 + 8) = v19;
    *(_OWORD *)(v21 + 16) = v22;
    *(_QWORD *)(v21 + 32) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 3;
  if (v25 >= v13)
    goto LABEL_28;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23C040D98()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = sub_23C053D20();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03588);
  v6 = *v0;
  v7 = sub_23C054284();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_23C040FBC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  int64_t v36;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03598);
  v3 = sub_23C054290();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_38:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v33 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v34 = (unint64_t)(v5 + 63) >> 6;
  v8 = v3 + 56;
  result = swift_retain();
  v10 = 0;
  v35 = v2;
  while (1)
  {
    if (v7)
    {
      v13 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v36 = v10;
      v14 = v13 | (v10 << 6);
      goto LABEL_24;
    }
    v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v15 >= v34)
      goto LABEL_36;
    v16 = *(_QWORD *)(v33 + 8 * v15);
    v17 = v10 + 1;
    if (!v16)
    {
      v17 = v10 + 2;
      if (v10 + 2 >= v34)
        goto LABEL_36;
      v16 = *(_QWORD *)(v33 + 8 * v17);
      if (!v16)
      {
        v17 = v10 + 3;
        if (v10 + 3 >= v34)
          goto LABEL_36;
        v16 = *(_QWORD *)(v33 + 8 * v17);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v7 = (v16 - 1) & v16;
    v36 = v17;
    v14 = __clz(__rbit64(v16)) + (v17 << 6);
LABEL_24:
    v19 = *(_QWORD *)(v2 + 48) + 40 * v14;
    v20 = *(_BYTE *)v19;
    v21 = *(_BYTE *)(v19 + 1);
    v23 = *(_QWORD *)(v19 + 8);
    v22 = *(_QWORD *)(v19 + 16);
    v24 = *(_QWORD *)(v19 + 24);
    v25 = *(_QWORD *)(v19 + 32);
    sub_23C05450C();
    sub_23C054524();
    sub_23C054518();
    sub_23C054524();
    if (v22)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_23C05405C();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRetain();
    sub_23C05405C();
    swift_bridgeObjectRelease();
    result = sub_23C054548();
    v26 = -1 << *(_BYTE *)(v4 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v8 + 8 * (v27 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v8 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v31 = v28 == v30;
        if (v28 == v30)
          v28 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v8 + 8 * v28);
      }
      while (v32 == -1);
      v11 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    v12 = *(_QWORD *)(v4 + 48) + 40 * v11;
    *(_BYTE *)v12 = v20;
    *(_BYTE *)(v12 + 1) = v21;
    *(_QWORD *)(v12 + 8) = v23;
    *(_QWORD *)(v12 + 16) = v22;
    *(_QWORD *)(v12 + 24) = v24;
    *(_QWORD *)(v12 + 32) = v25;
    ++*(_QWORD *)(v4 + 16);
    v2 = v35;
    v10 = v36;
  }
  v18 = v10 + 4;
  if (v10 + 4 >= v34)
  {
LABEL_36:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_38;
  }
  v16 = *(_QWORD *)(v33 + 8 * v18);
  if (v16)
  {
    v17 = v10 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    v17 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v17 >= v34)
      goto LABEL_36;
    v16 = *(_QWORD *)(v33 + 8 * v17);
    ++v18;
    if (v16)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_23C041324()
{
  uint64_t *v0;
  uint64_t *v1;
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
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_23C053D20();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03588);
  v7 = sub_23C054290();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = swift_retain();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v17 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v18 = v17 | (v15 << 6);
      goto LABEL_24;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v19);
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v33)
        goto LABEL_33;
      v20 = *(_QWORD *)(v32 + 8 * v15);
      if (!v20)
      {
        v15 = v19 + 2;
        if (v19 + 2 >= v33)
          goto LABEL_33;
        v20 = *(_QWORD *)(v32 + 8 * v15);
        if (!v20)
          break;
      }
    }
LABEL_23:
    v12 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_24:
    v22 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v22 * v18, v2);
    sub_23C03F850(&qword_256B03560, MEMORY[0x24BDCF690]);
    result = sub_23C053FF0();
    v23 = -1 << *(_BYTE *)(v8 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v25);
      }
      while (v29 == -1);
      v16 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v16 * v22, v5, v2);
    ++*(_QWORD *)(v8 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v33)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_35;
  }
  v20 = *(_QWORD *)(v32 + 8 * v21);
  if (v20)
  {
    v15 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    v15 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v15 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v15);
    ++v21;
    if (v20)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23C041644(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[2];
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 16);
  sub_23C039008();
  result = sub_23C0541DC();
  v7 = result;
  if (v2)
  {
    v4 = a1 + 32;
    do
    {
      v5 = *(_OWORD *)(v4 + 16);
      v8[0] = *(_OWORD *)v4;
      v8[1] = v5;
      v9 = *(_QWORD *)(v4 + 32);
      sub_23C03B74C((uint64_t)v8);
      sub_23C03FB14((uint64_t)&v6, (uint64_t)v8);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v4 += 40;
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_23C0416E4(uint64_t a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;

  v2 = sub_23C053D20();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256B03F00);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a1 + 16);
  sub_23C03F850(&qword_256B03560, MEMORY[0x24BDCF690]);
  v18 = sub_23C0541DC();
  if (v12)
  {
    v13 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v17 = *(_QWORD *)(v3 + 72);
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    while (1)
    {
      v14(v11, v13, v2);
      v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
      v15(v11, 0, 1, v2);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v11, 1, v2) == 1)
        break;
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v11, v2);
      sub_23C03FDEC((uint64_t)v8, v5);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      v13 += v17;
      if (!--v12)
        goto LABEL_7;
    }
  }
  else
  {
    v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
LABEL_7:
    v15(v11, 1, 1, v2);
  }
  return v18;
}

uint64_t sub_23C0418A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256B03F00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C0418F0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_23C053D20() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_23C054398();
  __break(1u);
  return result;
}

uint64_t ArtworkCandidate.artwork.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t ArtworkCandidate.cropCode.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 36));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t ArtworkCandidate.predicateDescriptor.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 40));
  swift_retain();
  return v2;
}

uint64_t ArtworkCandidate.init(artwork:cropCode:predicateDescriptor:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v13;
  uint64_t result;
  _QWORD *v15;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 32))(a7, a1, a5);
  result = type metadata accessor for ArtworkCandidate(0, a5, a6, v13);
  v15 = (_QWORD *)(a7 + *(int *)(result + 36));
  *v15 = a2;
  v15[1] = a3;
  *(_QWORD *)(a7 + *(int *)(result + 40)) = a4;
  return result;
}

uint64_t type metadata accessor for ArtworkCandidate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ArtworkCandidate);
}

BOOL sub_23C041B18(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23C041B28()
{
  return sub_23C054518();
}

uint64_t sub_23C041B4C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6B726F77747261 && a2 == 0xE700000000000000;
  if (v2 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65646F43706F7263 && a2 == 0xE800000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023C05ADD0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C054488();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23C041C9C()
{
  sub_23C05450C();
  sub_23C054518();
  return sub_23C054548();
}

uint64_t sub_23C041CE0(char a1)
{
  if (!a1)
    return 0x6B726F77747261;
  if (a1 == 1)
    return 0x65646F43706F7263;
  return 0xD000000000000013;
}

BOOL sub_23C041D3C(char *a1, char *a2)
{
  return sub_23C041B18(*a1, *a2);
}

uint64_t sub_23C041D50()
{
  return sub_23C041C9C();
}

uint64_t sub_23C041D5C()
{
  return sub_23C041B28();
}

uint64_t sub_23C041D68()
{
  sub_23C05450C();
  sub_23C041B28();
  return sub_23C054548();
}

uint64_t sub_23C041DAC()
{
  char *v0;

  return sub_23C041CE0(*v0);
}

uint64_t sub_23C041DB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C041B4C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C041DE4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23C042D5C();
  *a1 = result;
  return result;
}

uint64_t sub_23C041E0C(uint64_t a1)
{
  MEMORY[0x242615EC8](&unk_23C0571E0, a1);
  return sub_23C05456C();
}

uint64_t sub_23C041E40(uint64_t a1)
{
  MEMORY[0x242615EC8](&unk_23C0571E0, a1);
  return sub_23C054578();
}

uint64_t ArtworkCandidate.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;

  v16 = a2;
  v5 = *(_QWORD *)(a2 + 24);
  v18 = *(_QWORD *)(a2 + 16);
  v6 = type metadata accessor for ArtworkCandidate.CodingKeys(255, v18, v5, a4);
  MEMORY[0x242615EC8](&unk_23C0571E0, v6);
  v7 = sub_23C054470();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v15 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v11 = v17;
  sub_23C054560();
  v23 = 0;
  v12 = v19;
  sub_23C054464();
  if (!v12)
  {
    v13 = v16;
    v22 = 1;
    sub_23C054434();
    v20 = *(_QWORD *)(v11 + *(int *)(v13 + 40));
    v21 = 2;
    sub_23C042018();
    sub_23C054464();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t type metadata accessor for ArtworkCandidate.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ArtworkCandidate.CodingKeys);
}

unint64_t sub_23C042018()
{
  unint64_t result;

  result = qword_256B03600;
  if (!qword_256B03600)
  {
    result = MEMORY[0x242615EC8](MEMORY[0x24BE37A98], MEMORY[0x24BE37A90]);
    atomic_store(result, (unint64_t *)&qword_256B03600);
  }
  return result;
}

uint64_t ArtworkCandidate.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char v42;
  char v43;
  char v44;

  v32 = a4;
  v37 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v38 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for ArtworkCandidate.CodingKeys(255, v8, v9, v10);
  MEMORY[0x242615EC8](&unk_23C0571E0, v11);
  v36 = sub_23C05441C();
  v33 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v13 = (char *)&v30 - v12;
  v34 = a3;
  v35 = a2;
  v15 = type metadata accessor for ArtworkCandidate(0, a2, a3, v14);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v30 - v17;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v39 = v13;
  v19 = v40;
  sub_23C054554();
  if (v19)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v31 = v16;
  v20 = v33;
  v40 = v18;
  v44 = 0;
  v21 = v37;
  v23 = v35;
  v22 = v36;
  sub_23C054404();
  v24 = v40;
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v40, v38, v23);
  v43 = 1;
  v25 = sub_23C0543D4();
  v26 = (uint64_t *)&v24[*(int *)(v15 + 36)];
  *v26 = v25;
  v26[1] = v27;
  v42 = 2;
  sub_23C042354();
  sub_23C054404();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v39, v22);
  *(_QWORD *)&v24[*(int *)(v15 + 40)] = v41;
  v28 = v31;
  (*(void (**)(uint64_t, char *, uint64_t))(v31 + 16))(v32, v24, v15);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v24, v15);
}

unint64_t sub_23C042354()
{
  unint64_t result;

  result = qword_256B03608[0];
  if (!qword_256B03608[0])
  {
    result = MEMORY[0x242615EC8](MEMORY[0x24BE37AA0], MEMORY[0x24BE37A90]);
    atomic_store(result, qword_256B03608);
  }
  return result;
}

uint64_t sub_23C042398@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return ArtworkCandidate.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3);
}

uint64_t sub_23C0423B4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ArtworkCandidate.encode(to:)(a1, a2, a3, a4);
}

uint64_t ArtworkCandidate.hash(into:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_23C053FFC();
  if (*(_QWORD *)(v2 + *(int *)(a2 + 36) + 8))
  {
    sub_23C054524();
    swift_bridgeObjectRetain();
    sub_23C05405C();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23C054524();
  }
  swift_retain();
  sub_23C053D68();
  return swift_release();
}

uint64_t static ArtworkCandidate.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;

  if ((sub_23C054008() & 1) != 0)
  {
    v9 = *(int *)(type metadata accessor for ArtworkCandidate(0, a3, a4, v8) + 36);
    v10 = (_QWORD *)(a1 + v9);
    v11 = *(_QWORD *)(a1 + v9 + 8);
    v12 = (_QWORD *)(a2 + v9);
    v13 = v12[1];
    if (v11)
    {
      if (v13)
      {
        v14 = *v10 == *v12 && v11 == v13;
        if (v14 || (sub_23C054488() & 1) != 0)
LABEL_12:
          JUMPOUT(0x242615334);
      }
    }
    else if (!v13)
    {
      goto LABEL_12;
    }
  }
  return 0;
}

uint64_t ArtworkCandidate.hashValue.getter(uint64_t a1)
{
  _BYTE v3[72];

  sub_23C05450C();
  ArtworkCandidate.hash(into:)((uint64_t)v3, a1);
  return sub_23C054548();
}

uint64_t sub_23C042580(uint64_t a1, uint64_t a2)
{
  _BYTE v4[72];

  sub_23C05450C();
  ArtworkCandidate.hash(into:)((uint64_t)v4, a2);
  return sub_23C054548();
}

void sub_23C0425C0()
{
  JUMPOUT(0x242615EC8);
}

uint64_t sub_23C0425D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static ArtworkCandidate.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24));
}

uint64_t sub_23C0425DC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23C0425E4()
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

uint64_t *sub_23C042664(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v11 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v10 = *v11;
    v10[1] = v11[1];
    *(_QWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_23C042748(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_23C04279C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  *(_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_23C042828(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23C0428CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_23C042938(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  *(_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_23C0429C8(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFE)
    v6 = 2147483646;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFE)
    {
      v12 = *(_QWORD *)(((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8) + 8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      if ((v12 + 1) >= 2)
        return v12;
      else
        return 0;
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_23C042A4C + 4 * byte_23C056FC0[v10]))();
  }
}

void sub_23C042AD8(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFEu)
    v6 = 2147483646;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8)
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
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_23C042BD4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x23C042C58);
}

void sub_23C042BDC(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x23C042BE4);
  JUMPOUT(0x23C042C58);
}

void sub_23C042C2C()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x23C042C58);
}

void sub_23C042C34()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x23C042C58);
}

uint64_t sub_23C042C3C(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a2)
    goto LABEL_6;
  if (a3 < 0x7FFFFFFE)
  {
    if (a2 > 0x7FFFFFFE)
      JUMPOUT(0x23C042C48);
    *(_QWORD *)(((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) = a2;
LABEL_6:
    JUMPOUT(0x23C042C58);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

uint64_t sub_23C042C70(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C042CBC + 4 * byte_23C056FD4[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C042CF0 + 4 * byte_23C056FCF[v4]))();
}

uint64_t sub_23C042CF0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C042CF8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C042D00);
  return result;
}

uint64_t sub_23C042D0C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C042D14);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C042D18(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C042D20(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_23C042D2C()
{
  JUMPOUT(0x242615EC8);
}

void sub_23C042D3C()
{
  JUMPOUT(0x242615EC8);
}

void sub_23C042D4C()
{
  JUMPOUT(0x242615EC8);
}

uint64_t sub_23C042D5C()
{
  return 3;
}

BOOL static GridAxis.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

BOOL sub_23C042D7C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23C042D94()
{
  _BYTE *v0;

  if (*v0)
    return 0x6C61636974726576;
  else
    return 0x746E6F7A69726F68;
}

uint64_t sub_23C042DD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C0438C4(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C042DF8(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23C042E04()
{
  sub_23C0430C8();
  return sub_23C05456C();
}

uint64_t sub_23C042E2C()
{
  sub_23C0430C8();
  return sub_23C054578();
}

uint64_t sub_23C042E54()
{
  sub_23C043150();
  return sub_23C05456C();
}

uint64_t sub_23C042E7C()
{
  sub_23C043150();
  return sub_23C054578();
}

uint64_t sub_23C042EA4()
{
  sub_23C04310C();
  return sub_23C05456C();
}

uint64_t sub_23C042ECC()
{
  sub_23C04310C();
  return sub_23C054578();
}

uint64_t GridAxis.encode(to:)(_QWORD *a1)
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03710);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03718);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03720);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C0430C8();
  sub_23C054560();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23C04310C();
    sub_23C054428();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23C043150();
    sub_23C054428();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_23C0430C8()
{
  unint64_t result;

  result = qword_256B03728;
  if (!qword_256B03728)
  {
    result = MEMORY[0x242615EC8](&unk_23C05755C, &type metadata for GridAxis.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03728);
  }
  return result;
}

unint64_t sub_23C04310C()
{
  unint64_t result;

  result = qword_256B03730;
  if (!qword_256B03730)
  {
    result = MEMORY[0x242615EC8](&unk_23C05750C, &type metadata for GridAxis.VerticalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03730);
  }
  return result;
}

unint64_t sub_23C043150()
{
  unint64_t result;

  result = qword_256B03738;
  if (!qword_256B03738)
  {
    result = MEMORY[0x242615EC8](&unk_23C0574BC, &type metadata for GridAxis.HorizontalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03738);
  }
  return result;
}

uint64_t GridAxis.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03740);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03748);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03750);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C0430C8();
  v11 = v33;
  sub_23C054554();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23C054410();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23C0542CC();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B02DF0);
    *v21 = &type metadata for GridAxis;
    sub_23C0543C8();
    sub_23C0542C0();
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
    sub_23C04310C();
    sub_23C0543BC();
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
    sub_23C043150();
    v22 = v6;
    sub_23C0543BC();
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

uint64_t sub_23C0434EC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return GridAxis.init(from:)(a1, a2);
}

uint64_t sub_23C043500(_QWORD *a1)
{
  return GridAxis.encode(to:)(a1);
}

uint64_t GridAxis.hash(into:)()
{
  return sub_23C054518();
}

uint64_t GridAxis.hashValue.getter()
{
  sub_23C05450C();
  sub_23C054518();
  return sub_23C054548();
}

unint64_t sub_23C043584()
{
  unint64_t result;

  result = qword_256B03758;
  if (!qword_256B03758)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for GridAxis, &type metadata for GridAxis);
    atomic_store(result, (unint64_t *)&qword_256B03758);
  }
  return result;
}

ValueMetadata *type metadata accessor for GridAxis()
{
  return &type metadata for GridAxis;
}

uint64_t _s13FitnessCoreUI8GridAxisOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C04362C + 4 * byte_23C057235[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C043660 + 4 * byte_23C057230[v4]))();
}

uint64_t sub_23C043660(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C043668(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C043670);
  return result;
}

uint64_t sub_23C04367C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C043684);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C043688(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C043690(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GridAxis.CodingKeys()
{
  return &type metadata for GridAxis.CodingKeys;
}

ValueMetadata *type metadata accessor for GridAxis.HorizontalCodingKeys()
{
  return &type metadata for GridAxis.HorizontalCodingKeys;
}

ValueMetadata *type metadata accessor for GridAxis.VerticalCodingKeys()
{
  return &type metadata for GridAxis.VerticalCodingKeys;
}

unint64_t sub_23C0436D0()
{
  unint64_t result;

  result = qword_256B03760;
  if (!qword_256B03760)
  {
    result = MEMORY[0x242615EC8](&unk_23C057494, &type metadata for GridAxis.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03760);
  }
  return result;
}

unint64_t sub_23C043718()
{
  unint64_t result;

  result = qword_256B03768;
  if (!qword_256B03768)
  {
    result = MEMORY[0x242615EC8](&unk_23C0573B4, &type metadata for GridAxis.HorizontalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03768);
  }
  return result;
}

unint64_t sub_23C043760()
{
  unint64_t result;

  result = qword_256B03770;
  if (!qword_256B03770)
  {
    result = MEMORY[0x242615EC8](&unk_23C0573DC, &type metadata for GridAxis.HorizontalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03770);
  }
  return result;
}

unint64_t sub_23C0437A8()
{
  unint64_t result;

  result = qword_256B03778;
  if (!qword_256B03778)
  {
    result = MEMORY[0x242615EC8](&unk_23C057364, &type metadata for GridAxis.VerticalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03778);
  }
  return result;
}

unint64_t sub_23C0437F0()
{
  unint64_t result;

  result = qword_256B03780;
  if (!qword_256B03780)
  {
    result = MEMORY[0x242615EC8](&unk_23C05738C, &type metadata for GridAxis.VerticalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03780);
  }
  return result;
}

unint64_t sub_23C043838()
{
  unint64_t result;

  result = qword_256B03788;
  if (!qword_256B03788)
  {
    result = MEMORY[0x242615EC8](&unk_23C057404, &type metadata for GridAxis.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03788);
  }
  return result;
}

unint64_t sub_23C043880()
{
  unint64_t result;

  result = qword_256B03790;
  if (!qword_256B03790)
  {
    result = MEMORY[0x242615EC8](&unk_23C05742C, &type metadata for GridAxis.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03790);
  }
  return result;
}

uint64_t sub_23C0438C4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x746E6F7A69726F68 && a2 == 0xEA00000000006C61;
  if (v2 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C61636974726576 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C054488();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

id sub_23C043B34()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FloatingCollectionView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FloatingCollectionView()
{
  return objc_opt_self();
}

double LayoutEdgeInsets.bottom.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double LayoutEdgeInsets.leading.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

double LayoutEdgeInsets.top.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

double LayoutEdgeInsets.trailing.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

double static LayoutEdgeInsets.zero.getter@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

void LayoutEdgeInsets.init(top:leading:bottom:trailing:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  *a1 = a4;
  a1[1] = a3;
  a1[2] = a2;
  a1[3] = a5;
}

void LayoutEdgeInsets.init(uniform:)(double *a1@<X8>, double a2@<D0>)
{
  *a1 = a2;
  a1[1] = a2;
  a1[2] = a2;
  a1[3] = a2;
}

uint64_t sub_23C043BE0()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23C043C0C + 4 * byte_23C0575D0[*v0]))(0x6D6F74746F62, 0xE600000000000000);
}

uint64_t sub_23C043C0C()
{
  return 0x676E696461656CLL;
}

uint64_t sub_23C043C24()
{
  return 7368564;
}

uint64_t sub_23C043C34()
{
  return 0x676E696C69617274;
}

uint64_t sub_23C043C4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C044470(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C043C70()
{
  sub_23C044230();
  return sub_23C05456C();
}

uint64_t sub_23C043C98()
{
  sub_23C044230();
  return sub_23C054578();
}

uint64_t LayoutEdgeInsets.encode(to:)(_QWORD *a1)
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

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B037C8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v11 = v1[2];
  v10 = v1[3];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C044230();
  sub_23C054560();
  v14 = v9;
  HIBYTE(v13) = 0;
  sub_23C02A834();
  sub_23C054464();
  if (!v2)
  {
    v14 = v8;
    HIBYTE(v13) = 1;
    sub_23C054464();
    v14 = v11;
    HIBYTE(v13) = 2;
    sub_23C054464();
    v14 = v10;
    HIBYTE(v13) = 3;
    sub_23C054464();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t LayoutEdgeInsets.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
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

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B037D8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C044230();
  sub_23C054554();
  if (!v2)
  {
    HIBYTE(v14) = 0;
    sub_23C02AAD4();
    sub_23C054404();
    v9 = v15;
    HIBYTE(v14) = 1;
    sub_23C054404();
    v10 = v15;
    HIBYTE(v14) = 2;
    sub_23C054404();
    v12 = v15;
    HIBYTE(v14) = 3;
    sub_23C054404();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v13 = v15;
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v12;
    a2[3] = v13;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23C044088@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return LayoutEdgeInsets.init(from:)(a1, a2);
}

uint64_t sub_23C04409C(_QWORD *a1)
{
  return LayoutEdgeInsets.encode(to:)(a1);
}

uint64_t LayoutEdgeInsets.hash(into:)()
{
  sub_23C05453C();
  sub_23C05453C();
  sub_23C05453C();
  return sub_23C05453C();
}

uint64_t LayoutEdgeInsets.hashValue.getter()
{
  sub_23C05450C();
  LayoutEdgeInsets.hash(into:)();
  return sub_23C054548();
}

uint64_t sub_23C044160()
{
  sub_23C05450C();
  LayoutEdgeInsets.hash(into:)();
  return sub_23C054548();
}

uint64_t sub_23C0441AC()
{
  sub_23C05450C();
  LayoutEdgeInsets.hash(into:)();
  return sub_23C054548();
}

BOOL _s13FitnessCoreUI16LayoutEdgeInsetsV2eeoiySbAC_ACtFZ_0(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

unint64_t sub_23C044230()
{
  unint64_t result;

  result = qword_256B037D0;
  if (!qword_256B037D0)
  {
    result = MEMORY[0x242615EC8](&unk_23C057784, &type metadata for LayoutEdgeInsets.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B037D0);
  }
  return result;
}

unint64_t sub_23C044278()
{
  unint64_t result;

  result = qword_256B037E0;
  if (!qword_256B037E0)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for LayoutEdgeInsets, &type metadata for LayoutEdgeInsets);
    atomic_store(result, (unint64_t *)&qword_256B037E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for LayoutEdgeInsets()
{
  return &type metadata for LayoutEdgeInsets;
}

uint64_t storeEnumTagSinglePayload for LayoutEdgeInsets.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C044318 + 4 * byte_23C0575D9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C04434C + 4 * byte_23C0575D4[v4]))();
}

uint64_t sub_23C04434C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C044354(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C04435CLL);
  return result;
}

uint64_t sub_23C044368(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C044370);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C044374(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C04437C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LayoutEdgeInsets.CodingKeys()
{
  return &type metadata for LayoutEdgeInsets.CodingKeys;
}

unint64_t sub_23C04439C()
{
  unint64_t result;

  result = qword_256B037E8;
  if (!qword_256B037E8)
  {
    result = MEMORY[0x242615EC8](&unk_23C05775C, &type metadata for LayoutEdgeInsets.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B037E8);
  }
  return result;
}

unint64_t sub_23C0443E4()
{
  unint64_t result;

  result = qword_256B037F0;
  if (!qword_256B037F0)
  {
    result = MEMORY[0x242615EC8](&unk_23C0576CC, &type metadata for LayoutEdgeInsets.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B037F0);
  }
  return result;
}

unint64_t sub_23C04442C()
{
  unint64_t result;

  result = qword_256B037F8;
  if (!qword_256B037F8)
  {
    result = MEMORY[0x242615EC8](&unk_23C0576F4, &type metadata for LayoutEdgeInsets.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B037F8);
  }
  return result;
}

uint64_t sub_23C044470(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6D6F74746F62 && a2 == 0xE600000000000000;
  if (v2 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696461656CLL && a2 == 0xE700000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 7368564 && a2 == 0xE300000000000000 || (sub_23C054488() & 1) != 0)
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
    v6 = sub_23C054488();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

CGSize __swiftcall TabItemSize.selectionSize(compatibleWith:)(UITraitCollection_optional compatibleWith)
{
  char v1;
  __int128 *v2;
  Class isa;
  __int128 v4;
  Class v5;
  double width;
  double height;
  CGSize v8;
  CGSize result;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  isa = compatibleWith.value.super.isa;
  v4 = v2[1];
  v11 = *v2;
  v12 = v4;
  v13 = v2[2];
  if (qword_256B02BC8 != -1)
    swift_once();
  v10 = qword_256B03290;
  v5 = isa;
  v8 = TabItemSize.minimumSize(respecting:compatibleWith:)((FitnessCoreUI::TabItemEdge::Set)&v10, *(UITraitCollection_optional *)(&v1 - 8));
  height = v8.height;
  width = v8.width;
  result.height = height;
  result.width = width;
  return result;
}

uint64_t TabItemSize.paddingToItem(ofSize:at:)(uint64_t a1, unsigned __int8 *a2)
{
  return ((uint64_t (*)(void))((char *)sub_23C0446A8 + 4 * byte_23C0577D4[*a2]))();
}

double sub_23C0446A8@<D0>(uint64_t a1@<X0>, int a2@<W8>)
{
  uint64_t v2;
  double result;
  double v4;

  result = *(double *)(v2 + 32);
  v4 = *(double *)(a1 + 16);
  if (a2)
    v4 = 0.0;
  if (v4 > result)
    return v4;
  return result;
}

CGSize __swiftcall TabItemSize.minimumSizeBetween(leadingItemSize:trailingItemSize:respecting:compatibleWith:)(FitnessCoreUI::TabItemSize_optional *leadingItemSize, FitnessCoreUI::TabItemSize_optional *trailingItemSize, FitnessCoreUI::TabItemEdge::Set respecting, UITraitCollection_optional compatibleWith)
{
  double *v4;
  Class isa;
  double leading;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double trailing;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  isa = compatibleWith.value.super.isa;
  leading = trailingItemSize->value.padding.leading;
  v7 = *(_QWORD *)respecting.rawValue;
  v8 = *v4;
  v9 = v4[2];
  v10 = v4[4];
  if ((*(_QWORD *)respecting.rawValue & 2) != 0)
  {
    v11 = v4[3];
    trailing = leadingItemSize->value.padding.trailing;
    if (leadingItemSize->is_nil)
      trailing = 0.0;
    if (trailing > v11)
      v11 = trailing;
    v8 = v8 + v11;
  }
  if (trailingItemSize->is_nil)
    leading = 0.0;
  if (leading <= v4[5])
    leading = v4[5];
  if ((v7 & 8) == 0)
    leading = -0.0;
  v13 = leading + v8;
  if ((v7 & 4) == 0)
    v9 = -0.0;
  if ((v7 & 1) == 0)
    v10 = -0.0;
  v14 = v4[1] + v9 + v10;
  if (compatibleWith.value.super.isa)
  {
    -[objc_class displayScale](compatibleWith.value.super.isa, sel_displayScale);
    if (v15 > 0.0)
      v13 = ceil(v13 * v15) / v15;
    -[objc_class displayScale](isa, sel_displayScale);
    if (v16 > 0.0)
      v14 = ceil(v14 * v16) / v16;
  }
  v17 = v13;
  v18 = v14;
  result.height = v18;
  result.width = v17;
  return result;
}

double TabItemSize.contentSize.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double TabItemSize.padding.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

CGSize __swiftcall TabItemSize.minimumSize(respecting:compatibleWith:)(FitnessCoreUI::TabItemEdge::Set respecting, UITraitCollection_optional compatibleWith)
{
  double *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  Class isa;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v3 = *(_QWORD *)respecting.rawValue;
  v4 = v2[3];
  if ((*(_QWORD *)respecting.rawValue & 2) == 0)
    v4 = -0.0;
  v5 = *v2 + v4;
  if ((v3 & 8) != 0)
    v6 = v2[5];
  else
    v6 = -0.0;
  v7 = v5 + v6;
  if ((v3 & 4) != 0)
    v8 = v2[2];
  else
    v8 = -0.0;
  v9 = v2[1] + v8;
  if ((v3 & 1) != 0)
    v10 = v2[4];
  else
    v10 = -0.0;
  v11 = v9 + v10;
  if (compatibleWith.value.super.isa)
  {
    isa = compatibleWith.value.super.isa;
    -[objc_class displayScale](compatibleWith.value.super.isa, sel_displayScale, *(_QWORD *)&compatibleWith.is_nil);
    if (v13 > 0.0)
      v7 = ceil(v7 * v13) / v13;
    -[objc_class displayScale](isa, sel_displayScale);
    if (v14 > 0.0)
      v11 = ceil(v11 * v14) / v14;
  }
  v15 = v7;
  v16 = v11;
  result.height = v16;
  result.width = v15;
  return result;
}

uint64_t sub_23C0448B0()
{
  _BYTE *v0;

  if (*v0)
    return 0x676E6964646170;
  else
    return 0x53746E65746E6F63;
}

uint64_t sub_23C0448F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C045200(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C044918()
{
  sub_23C044B08();
  return sub_23C05456C();
}

uint64_t sub_23C044940()
{
  sub_23C044B08();
  return sub_23C054578();
}

uint64_t TabItemSize.encode(to:)(_QWORD *a1)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03800);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = v1[1];
  v10 = v1[2];
  v11 = v1[3];
  v12 = v1[4];
  v13 = v1[5];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C044B08();
  sub_23C054560();
  v16 = v8;
  v17 = v9;
  v20 = 0;
  type metadata accessor for CGSize(0);
  sub_23C02BC88(&qword_256B03810, (uint64_t (*)(uint64_t))type metadata accessor for CGSize, MEMORY[0x24BDBD848]);
  sub_23C054464();
  if (!v2)
  {
    v16 = v10;
    v17 = v11;
    v18 = v12;
    v19 = v13;
    v20 = 1;
    type metadata accessor for NSDirectionalEdgeInsets(0);
    sub_23C02BC88(&qword_256B03818, (uint64_t (*)(uint64_t))type metadata accessor for NSDirectionalEdgeInsets, MEMORY[0x24BEBCD78]);
    sub_23C054464();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23C044B08()
{
  unint64_t result;

  result = qword_256B03808;
  if (!qword_256B03808)
  {
    result = MEMORY[0x242615EC8](&unk_23C05797C, &type metadata for TabItemSize.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03808);
  }
  return result;
}

uint64_t TabItemSize.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[2];
  char v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03820);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C044B08();
  sub_23C054554();
  if (!v2)
  {
    type metadata accessor for CGSize(0);
    v14 = 0;
    sub_23C02BC88(&qword_256B03828, (uint64_t (*)(uint64_t))type metadata accessor for CGSize, MEMORY[0x24BDBD860]);
    sub_23C054404();
    v9 = v13[0];
    type metadata accessor for NSDirectionalEdgeInsets(0);
    v14 = 1;
    sub_23C02BC88(&qword_256B03830, (uint64_t (*)(uint64_t))type metadata accessor for NSDirectionalEdgeInsets, MEMORY[0x24BEBCD88]);
    sub_23C054404();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v10 = v13[0];
    v11 = v13[1];
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23C044D14@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return TabItemSize.init(from:)(a1, a2);
}

uint64_t sub_23C044D28(_QWORD *a1)
{
  return TabItemSize.encode(to:)(a1);
}

uint64_t TabItemSize.hash(into:)()
{
  sub_23C02F0C8();
  return NSDirectionalEdgeInsets.hash(into:)();
}

uint64_t TabItemSize.hashValue.getter()
{
  sub_23C05450C();
  sub_23C02F0C8();
  NSDirectionalEdgeInsets.hash(into:)();
  return sub_23C054548();
}

uint64_t sub_23C044E10()
{
  sub_23C05450C();
  sub_23C02F0C8();
  NSDirectionalEdgeInsets.hash(into:)();
  return sub_23C054548();
}

uint64_t sub_23C044E90()
{
  sub_23C02F0C8();
  return NSDirectionalEdgeInsets.hash(into:)();
}

uint64_t sub_23C044EE0()
{
  sub_23C05450C();
  sub_23C02F0C8();
  NSDirectionalEdgeInsets.hash(into:)();
  return sub_23C054548();
}

uint64_t _s13FitnessCoreUI11TabItemSizeV2eeoiySbAC_ACtFZ_0(float64x2_t *a1, float64x2_t *a2)
{
  if (a1->f64[0] == a2->f64[0] && a1->f64[1] == a2->f64[1])
    return vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(a1[1], a2[1]), (int32x4_t)vceqq_f64(a1[2], a2[2]))), 0xFuLL))) & 1;
  else
    return 0;
}

unint64_t sub_23C044FB0()
{
  unint64_t result;

  result = qword_256B03838;
  if (!qword_256B03838)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItemSize, &type metadata for TabItemSize);
    atomic_store(result, (unint64_t *)&qword_256B03838);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TabItemSize(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TabItemSize(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TabItemSize()
{
  return &type metadata for TabItemSize;
}

uint64_t storeEnumTagSinglePayload for TabItemSize.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C0450A8 + 4 * byte_23C0577DD[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C0450DC + 4 * byte_23C0577D8[v4]))();
}

uint64_t sub_23C0450DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C0450E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C0450ECLL);
  return result;
}

uint64_t sub_23C0450F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C045100);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C045104(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C04510C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TabItemSize.CodingKeys()
{
  return &type metadata for TabItemSize.CodingKeys;
}

unint64_t sub_23C04512C()
{
  unint64_t result;

  result = qword_256B03840;
  if (!qword_256B03840)
  {
    result = MEMORY[0x242615EC8](&unk_23C057954, &type metadata for TabItemSize.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03840);
  }
  return result;
}

unint64_t sub_23C045174()
{
  unint64_t result;

  result = qword_256B03848;
  if (!qword_256B03848)
  {
    result = MEMORY[0x242615EC8](&unk_23C0578C4, &type metadata for TabItemSize.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03848);
  }
  return result;
}

unint64_t sub_23C0451BC()
{
  unint64_t result;

  result = qword_256B03850;
  if (!qword_256B03850)
  {
    result = MEMORY[0x242615EC8](&unk_23C0578EC, &type metadata for TabItemSize.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03850);
  }
  return result;
}

uint64_t sub_23C045200(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x53746E65746E6F63 && a2 == 0xEB00000000657A69;
  if (v2 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E6964646170 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C054488();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

BOOL DynamicTypeSize.isAccessibilitySize.getter(unsigned __int8 a1)
{
  return a1 - 8 < 5;
}

BOOL static DynamicTypeSize.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23C04532C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23C045368 + 4 * byte_23C0579D0[a1]))(0x6669636570736E75, 0xEB00000000646569);
}

uint64_t sub_23C045368()
{
  return 0x6C6C616D5378;
}

uint64_t sub_23C04537C()
{
  return 0x6C6C616D73;
}

uint64_t sub_23C045390()
{
  return 0x6D756964656DLL;
}

uint64_t sub_23C0453A4()
{
  return 0x656772616CLL;
}

uint64_t sub_23C0453B8()
{
  return 0x656772614C78;
}

uint64_t sub_23C0453CC()
{
  return 0x656772614C7878;
}

uint64_t sub_23C0453E4()
{
  return 0x656772614C787878;
}

uint64_t sub_23C0453FC()
{
  return 0x6269737365636361;
}

uint64_t sub_23C045460()
{
  sub_23C0462C0();
  return sub_23C05456C();
}

uint64_t sub_23C045488()
{
  sub_23C0462C0();
  return sub_23C054578();
}

uint64_t sub_23C0454B0()
{
  sub_23C04627C();
  return sub_23C05456C();
}

uint64_t sub_23C0454D8()
{
  sub_23C04627C();
  return sub_23C054578();
}

uint64_t sub_23C045500()
{
  sub_23C046238();
  return sub_23C05456C();
}

uint64_t sub_23C045528()
{
  sub_23C046238();
  return sub_23C054578();
}

uint64_t sub_23C045550()
{
  sub_23C0461F4();
  return sub_23C05456C();
}

uint64_t sub_23C045578()
{
  sub_23C0461F4();
  return sub_23C054578();
}

uint64_t sub_23C0455A0()
{
  sub_23C0461B0();
  return sub_23C05456C();
}

uint64_t sub_23C0455C8()
{
  sub_23C0461B0();
  return sub_23C054578();
}

uint64_t sub_23C0455F0()
{
  unsigned __int8 *v0;

  return sub_23C04532C(*v0);
}

uint64_t sub_23C0455F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C046640(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C04561C(_BYTE *a1@<X8>)
{
  *a1 = 13;
}

uint64_t sub_23C045628()
{
  sub_23C04616C();
  return sub_23C05456C();
}

uint64_t sub_23C045650()
{
  sub_23C04616C();
  return sub_23C054578();
}

uint64_t sub_23C045678()
{
  sub_23C0463D0();
  return sub_23C05456C();
}

uint64_t sub_23C0456A0()
{
  sub_23C0463D0();
  return sub_23C054578();
}

uint64_t sub_23C0456C8()
{
  sub_23C046414();
  return sub_23C05456C();
}

uint64_t sub_23C0456F0()
{
  sub_23C046414();
  return sub_23C054578();
}

uint64_t sub_23C045718()
{
  sub_23C046458();
  return sub_23C05456C();
}

uint64_t sub_23C045740()
{
  sub_23C046458();
  return sub_23C054578();
}

uint64_t sub_23C045768()
{
  sub_23C0464E0();
  return sub_23C05456C();
}

uint64_t sub_23C045790()
{
  sub_23C0464E0();
  return sub_23C054578();
}

uint64_t sub_23C0457B8()
{
  sub_23C04638C();
  return sub_23C05456C();
}

uint64_t sub_23C0457E0()
{
  sub_23C04638C();
  return sub_23C054578();
}

uint64_t sub_23C045808()
{
  sub_23C04649C();
  return sub_23C05456C();
}

uint64_t sub_23C045830()
{
  sub_23C04649C();
  return sub_23C054578();
}

uint64_t sub_23C045858()
{
  sub_23C046348();
  return sub_23C05456C();
}

uint64_t sub_23C045880()
{
  sub_23C046348();
  return sub_23C054578();
}

uint64_t sub_23C0458A8()
{
  sub_23C046304();
  return sub_23C05456C();
}

uint64_t sub_23C0458D0()
{
  sub_23C046304();
  return sub_23C054578();
}

void *static DynamicTypeSize.allCases.getter()
{
  return &unk_250CF36E0;
}

void sub_23C045904(_QWORD *a1@<X8>)
{
  *a1 = &unk_250CF36E0;
}

void DynamicTypeSize.encode(to:)(_QWORD *a1, uint64_t a2)
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;

  v57 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03858);
  v55 = *(_QWORD *)(v3 - 8);
  v56 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v54 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03860);
  v52 = *(_QWORD *)(v5 - 8);
  v53 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v51 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03868);
  v49 = *(_QWORD *)(v7 - 8);
  v50 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v48 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03870);
  v46 = *(_QWORD *)(v9 - 8);
  v47 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v45 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03878);
  v43 = *(_QWORD *)(v11 - 8);
  v44 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v42 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03880);
  v40 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v39 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03888);
  v37 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v36 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03890);
  v34 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v33 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03898);
  v31 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v30 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B038A0);
  v28 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v27 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B038A8);
  v25 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v24 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B038B0);
  MEMORY[0x24BDAC7A8](v23);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B038B8);
  MEMORY[0x24BDAC7A8](v19);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B038C0);
  v58 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v21 = (char *)&v22 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C04616C();
  v59 = v21;
  sub_23C054560();
  __asm { BR              X10 }
}

uint64_t sub_23C045D74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v3 - 93) = 0;
  sub_23C0464E0();
  v5 = *(_QWORD *)(v3 - 112);
  v4 = *(_QWORD *)(v3 - 104);
  sub_23C054428();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 120) + 8))(v5, v4);
}

unint64_t sub_23C04616C()
{
  unint64_t result;

  result = qword_256B038C8;
  if (!qword_256B038C8)
  {
    result = MEMORY[0x242615EC8](&unk_23C0585D4, &type metadata for DynamicTypeSize.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B038C8);
  }
  return result;
}

unint64_t sub_23C0461B0()
{
  unint64_t result;

  result = qword_256B038D0;
  if (!qword_256B038D0)
  {
    result = MEMORY[0x242615EC8](&unk_23C058584, &type metadata for DynamicTypeSize.Accessibility5CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B038D0);
  }
  return result;
}

unint64_t sub_23C0461F4()
{
  unint64_t result;

  result = qword_256B038D8;
  if (!qword_256B038D8)
  {
    result = MEMORY[0x242615EC8](&unk_23C058534, &type metadata for DynamicTypeSize.Accessibility4CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B038D8);
  }
  return result;
}

unint64_t sub_23C046238()
{
  unint64_t result;

  result = qword_256B038E0;
  if (!qword_256B038E0)
  {
    result = MEMORY[0x242615EC8](&unk_23C0584E4, &type metadata for DynamicTypeSize.Accessibility3CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B038E0);
  }
  return result;
}

unint64_t sub_23C04627C()
{
  unint64_t result;

  result = qword_256B038E8;
  if (!qword_256B038E8)
  {
    result = MEMORY[0x242615EC8](&unk_23C058494, &type metadata for DynamicTypeSize.Accessibility2CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B038E8);
  }
  return result;
}

unint64_t sub_23C0462C0()
{
  unint64_t result;

  result = qword_256B038F0;
  if (!qword_256B038F0)
  {
    result = MEMORY[0x242615EC8](&unk_23C058444, &type metadata for DynamicTypeSize.Accessibility1CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B038F0);
  }
  return result;
}

unint64_t sub_23C046304()
{
  unint64_t result;

  result = qword_256B038F8;
  if (!qword_256B038F8)
  {
    result = MEMORY[0x242615EC8](&unk_23C0583F4, &type metadata for DynamicTypeSize.XxxLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B038F8);
  }
  return result;
}

unint64_t sub_23C046348()
{
  unint64_t result;

  result = qword_256B03900;
  if (!qword_256B03900)
  {
    result = MEMORY[0x242615EC8](&unk_23C0583A4, &type metadata for DynamicTypeSize.XxLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03900);
  }
  return result;
}

unint64_t sub_23C04638C()
{
  unint64_t result;

  result = qword_256B03908;
  if (!qword_256B03908)
  {
    result = MEMORY[0x242615EC8](&unk_23C058354, &type metadata for DynamicTypeSize.XLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03908);
  }
  return result;
}

unint64_t sub_23C0463D0()
{
  unint64_t result;

  result = qword_256B03910;
  if (!qword_256B03910)
  {
    result = MEMORY[0x242615EC8](&unk_23C058304, &type metadata for DynamicTypeSize.LargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03910);
  }
  return result;
}

unint64_t sub_23C046414()
{
  unint64_t result;

  result = qword_256B03918;
  if (!qword_256B03918)
  {
    result = MEMORY[0x242615EC8](&unk_23C0582B4, &type metadata for DynamicTypeSize.MediumCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03918);
  }
  return result;
}

unint64_t sub_23C046458()
{
  unint64_t result;

  result = qword_256B03920;
  if (!qword_256B03920)
  {
    result = MEMORY[0x242615EC8](&unk_23C058264, &type metadata for DynamicTypeSize.SmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03920);
  }
  return result;
}

unint64_t sub_23C04649C()
{
  unint64_t result;

  result = qword_256B03928;
  if (!qword_256B03928)
  {
    result = MEMORY[0x242615EC8](&unk_23C058214, &type metadata for DynamicTypeSize.XSmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03928);
  }
  return result;
}

unint64_t sub_23C0464E0()
{
  unint64_t result;

  result = qword_256B03930;
  if (!qword_256B03930)
  {
    result = MEMORY[0x242615EC8](&unk_23C0581C4, &type metadata for DynamicTypeSize.UnspecifiedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03930);
  }
  return result;
}

uint64_t DynamicTypeSize.init(from:)(_QWORD *a1)
{
  return sub_23C046BE8(a1);
}

uint64_t sub_23C046538@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23C046BE8(a1);
  if (!v2)
    *a2 = result;
  return result;
}

void sub_23C046560(_QWORD *a1)
{
  unsigned __int8 *v1;

  DynamicTypeSize.encode(to:)(a1, *v1);
}

BOOL static DynamicTypeSize.< infix(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  return a1 < a2;
}

BOOL sub_23C046588(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_23C04659C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_23C0465B0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_23C0465C4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

uint64_t DynamicTypeSize.hash(into:)()
{
  return sub_23C054518();
}

uint64_t DynamicTypeSize.hashValue.getter()
{
  sub_23C05450C();
  sub_23C054518();
  return sub_23C054548();
}

uint64_t sub_23C046640(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6669636570736E75 && a2 == 0xEB00000000646569;
  if (v2 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C6C616D5378 && a2 == 0xE600000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6C616D73 && a2 == 0xE500000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6D756964656DLL && a2 == 0xE600000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656772616CLL && a2 == 0xE500000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x656772614C78 && a2 == 0xE600000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x656772614C7878 && a2 == 0xE700000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x656772614C787878 && a2 == 0xE800000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6269737365636361 && a2 == 0xEE00317974696C69 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6269737365636361 && a2 == 0xEE00327974696C69 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6269737365636361 && a2 == 0xEE00337974696C69 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6269737365636361 && a2 == 0xEE00347974696C69 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x6269737365636361 && a2 == 0xEE00357974696C69)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else
  {
    v6 = sub_23C054488();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 12;
    else
      return 13;
  }
}

uint64_t sub_23C046BE8(_QWORD *a1)
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
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD v33[3];
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
  char *v60;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  _QWORD *v71;
  uint64_t v72;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03A38);
  v57 = *(_QWORD *)(v2 - 8);
  v58 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v70 = (char *)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03A40);
  v55 = *(_QWORD *)(v4 - 8);
  v56 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v66 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03A48);
  v53 = *(_QWORD *)(v6 - 8);
  v54 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v65 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03A50);
  v51 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v64 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03A58);
  v49 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v63 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03A60);
  v41 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v69 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03A68);
  v46 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v68 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03A70);
  v44 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v62 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03A78);
  v42 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v67 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03A80);
  v39 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v61 = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03A88);
  v37 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v60 = (char *)v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03A90);
  v35 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v59 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03A98);
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03AA0);
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)v33 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = a1[3];
  v71 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v25);
  sub_23C04616C();
  v26 = v72;
  sub_23C054554();
  if (!v26)
  {
    v33[2] = v20;
    v33[0] = v18;
    v33[1] = v17;
    v34 = v22;
    v72 = 0;
    v27 = v24;
    v28 = sub_23C054410();
    v22 = v28;
    if (*(_QWORD *)(v28 + 16) == 1)
      __asm { BR              X9 }
    v29 = sub_23C0542CC();
    swift_allocError();
    v31 = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B02DF0);
    *v31 = &type metadata for DynamicTypeSize;
    sub_23C0543C8();
    sub_23C0542C0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v29 - 8) + 104))(v31, *MEMORY[0x24BEE26D0], v29);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v27, v21);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
  return v22;
}

void sub_23C0471F0(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v3 - 92) = 1;
  sub_23C04649C();
  v5 = *(_QWORD *)(v3 - 208);
  v6 = *(_QWORD *)(v3 - 104);
  sub_23C0543BC();
  if (!v6)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 400) + 8))(v5, *(_QWORD *)(v3 - 392));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(a1 + 8))(v1, v2);
    __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v3 - 112));
    JUMPOUT(0x23C0471C8);
  }
  swift_bridgeObjectRelease();
  JUMPOUT(0x23C0471B4);
}

unint64_t sub_23C04766C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B03938;
  if (!qword_256B03938)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B03940);
    result = MEMORY[0x242615EC8](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_256B03938);
  }
  return result;
}

unint64_t sub_23C0476BC()
{
  unint64_t result;

  result = qword_256B03948;
  if (!qword_256B03948)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for DynamicTypeSize, &type metadata for DynamicTypeSize);
    atomic_store(result, (unint64_t *)&qword_256B03948);
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicTypeSize()
{
  return &type metadata for DynamicTypeSize;
}

uint64_t getEnumTagSinglePayload for CropCode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF4)
    goto LABEL_17;
  if (a2 + 12 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 12) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 12;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 12;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 12;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xD;
  v8 = v6 - 13;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s13FitnessCoreUI15DynamicTypeSizeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 12 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 12) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF3)
    return ((uint64_t (*)(void))((char *)&loc_23C0477F4 + 4 * byte_23C057A09[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_23C047828 + 4 * byte_23C057A04[v4]))();
}

uint64_t sub_23C047828(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C047830(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C047838);
  return result;
}

uint64_t sub_23C047844(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C04784CLL);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_23C047850(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C047858(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.CodingKeys()
{
  return &type metadata for DynamicTypeSize.CodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.UnspecifiedCodingKeys()
{
  return &type metadata for DynamicTypeSize.UnspecifiedCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.XSmallCodingKeys()
{
  return &type metadata for DynamicTypeSize.XSmallCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.SmallCodingKeys()
{
  return &type metadata for DynamicTypeSize.SmallCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.MediumCodingKeys()
{
  return &type metadata for DynamicTypeSize.MediumCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.LargeCodingKeys()
{
  return &type metadata for DynamicTypeSize.LargeCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.XLargeCodingKeys()
{
  return &type metadata for DynamicTypeSize.XLargeCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.XxLargeCodingKeys()
{
  return &type metadata for DynamicTypeSize.XxLargeCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.XxxLargeCodingKeys()
{
  return &type metadata for DynamicTypeSize.XxxLargeCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.Accessibility1CodingKeys()
{
  return &type metadata for DynamicTypeSize.Accessibility1CodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.Accessibility2CodingKeys()
{
  return &type metadata for DynamicTypeSize.Accessibility2CodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.Accessibility3CodingKeys()
{
  return &type metadata for DynamicTypeSize.Accessibility3CodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.Accessibility4CodingKeys()
{
  return &type metadata for DynamicTypeSize.Accessibility4CodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.Accessibility5CodingKeys()
{
  return &type metadata for DynamicTypeSize.Accessibility5CodingKeys;
}

unint64_t sub_23C047948()
{
  unint64_t result;

  result = qword_256B03950;
  if (!qword_256B03950)
  {
    result = MEMORY[0x242615EC8](&unk_23C05819C, &type metadata for DynamicTypeSize.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03950);
  }
  return result;
}

unint64_t sub_23C047990()
{
  unint64_t result;

  result = qword_256B03958;
  if (!qword_256B03958)
  {
    result = MEMORY[0x242615EC8](&unk_23C0580BC, &type metadata for DynamicTypeSize.UnspecifiedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03958);
  }
  return result;
}

unint64_t sub_23C0479D8()
{
  unint64_t result;

  result = qword_256B03960;
  if (!qword_256B03960)
  {
    result = MEMORY[0x242615EC8](&unk_23C0580E4, &type metadata for DynamicTypeSize.UnspecifiedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03960);
  }
  return result;
}

unint64_t sub_23C047A20()
{
  unint64_t result;

  result = qword_256B03968;
  if (!qword_256B03968)
  {
    result = MEMORY[0x242615EC8](&unk_23C05806C, &type metadata for DynamicTypeSize.XSmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03968);
  }
  return result;
}

unint64_t sub_23C047A68()
{
  unint64_t result;

  result = qword_256B03970;
  if (!qword_256B03970)
  {
    result = MEMORY[0x242615EC8](&unk_23C058094, &type metadata for DynamicTypeSize.XSmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03970);
  }
  return result;
}

unint64_t sub_23C047AB0()
{
  unint64_t result;

  result = qword_256B03978;
  if (!qword_256B03978)
  {
    result = MEMORY[0x242615EC8](&unk_23C05801C, &type metadata for DynamicTypeSize.SmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03978);
  }
  return result;
}

unint64_t sub_23C047AF8()
{
  unint64_t result;

  result = qword_256B03980;
  if (!qword_256B03980)
  {
    result = MEMORY[0x242615EC8](&unk_23C058044, &type metadata for DynamicTypeSize.SmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03980);
  }
  return result;
}

unint64_t sub_23C047B40()
{
  unint64_t result;

  result = qword_256B03988;
  if (!qword_256B03988)
  {
    result = MEMORY[0x242615EC8](&unk_23C057FCC, &type metadata for DynamicTypeSize.MediumCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03988);
  }
  return result;
}

unint64_t sub_23C047B88()
{
  unint64_t result;

  result = qword_256B03990;
  if (!qword_256B03990)
  {
    result = MEMORY[0x242615EC8](&unk_23C057FF4, &type metadata for DynamicTypeSize.MediumCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03990);
  }
  return result;
}

unint64_t sub_23C047BD0()
{
  unint64_t result;

  result = qword_256B03998;
  if (!qword_256B03998)
  {
    result = MEMORY[0x242615EC8](&unk_23C057F7C, &type metadata for DynamicTypeSize.LargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03998);
  }
  return result;
}

unint64_t sub_23C047C18()
{
  unint64_t result;

  result = qword_256B039A0;
  if (!qword_256B039A0)
  {
    result = MEMORY[0x242615EC8](&unk_23C057FA4, &type metadata for DynamicTypeSize.LargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B039A0);
  }
  return result;
}

unint64_t sub_23C047C60()
{
  unint64_t result;

  result = qword_256B039A8;
  if (!qword_256B039A8)
  {
    result = MEMORY[0x242615EC8](&unk_23C057F2C, &type metadata for DynamicTypeSize.XLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B039A8);
  }
  return result;
}

unint64_t sub_23C047CA8()
{
  unint64_t result;

  result = qword_256B039B0;
  if (!qword_256B039B0)
  {
    result = MEMORY[0x242615EC8](&unk_23C057F54, &type metadata for DynamicTypeSize.XLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B039B0);
  }
  return result;
}

unint64_t sub_23C047CF0()
{
  unint64_t result;

  result = qword_256B039B8;
  if (!qword_256B039B8)
  {
    result = MEMORY[0x242615EC8](&unk_23C057EDC, &type metadata for DynamicTypeSize.XxLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B039B8);
  }
  return result;
}

unint64_t sub_23C047D38()
{
  unint64_t result;

  result = qword_256B039C0;
  if (!qword_256B039C0)
  {
    result = MEMORY[0x242615EC8](&unk_23C057F04, &type metadata for DynamicTypeSize.XxLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B039C0);
  }
  return result;
}

unint64_t sub_23C047D80()
{
  unint64_t result;

  result = qword_256B039C8;
  if (!qword_256B039C8)
  {
    result = MEMORY[0x242615EC8](&unk_23C057E8C, &type metadata for DynamicTypeSize.XxxLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B039C8);
  }
  return result;
}

unint64_t sub_23C047DC8()
{
  unint64_t result;

  result = qword_256B039D0;
  if (!qword_256B039D0)
  {
    result = MEMORY[0x242615EC8](&unk_23C057EB4, &type metadata for DynamicTypeSize.XxxLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B039D0);
  }
  return result;
}

unint64_t sub_23C047E10()
{
  unint64_t result;

  result = qword_256B039D8;
  if (!qword_256B039D8)
  {
    result = MEMORY[0x242615EC8](&unk_23C057E3C, &type metadata for DynamicTypeSize.Accessibility1CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B039D8);
  }
  return result;
}

unint64_t sub_23C047E58()
{
  unint64_t result;

  result = qword_256B039E0;
  if (!qword_256B039E0)
  {
    result = MEMORY[0x242615EC8](&unk_23C057E64, &type metadata for DynamicTypeSize.Accessibility1CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B039E0);
  }
  return result;
}

unint64_t sub_23C047EA0()
{
  unint64_t result;

  result = qword_256B039E8;
  if (!qword_256B039E8)
  {
    result = MEMORY[0x242615EC8](&unk_23C057DEC, &type metadata for DynamicTypeSize.Accessibility2CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B039E8);
  }
  return result;
}

unint64_t sub_23C047EE8()
{
  unint64_t result;

  result = qword_256B039F0;
  if (!qword_256B039F0)
  {
    result = MEMORY[0x242615EC8](&unk_23C057E14, &type metadata for DynamicTypeSize.Accessibility2CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B039F0);
  }
  return result;
}

unint64_t sub_23C047F30()
{
  unint64_t result;

  result = qword_256B039F8;
  if (!qword_256B039F8)
  {
    result = MEMORY[0x242615EC8](&unk_23C057D9C, &type metadata for DynamicTypeSize.Accessibility3CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B039F8);
  }
  return result;
}

unint64_t sub_23C047F78()
{
  unint64_t result;

  result = qword_256B03A00;
  if (!qword_256B03A00)
  {
    result = MEMORY[0x242615EC8](&unk_23C057DC4, &type metadata for DynamicTypeSize.Accessibility3CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03A00);
  }
  return result;
}

unint64_t sub_23C047FC0()
{
  unint64_t result;

  result = qword_256B03A08;
  if (!qword_256B03A08)
  {
    result = MEMORY[0x242615EC8](&unk_23C057D4C, &type metadata for DynamicTypeSize.Accessibility4CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03A08);
  }
  return result;
}

unint64_t sub_23C048008()
{
  unint64_t result;

  result = qword_256B03A10;
  if (!qword_256B03A10)
  {
    result = MEMORY[0x242615EC8](&unk_23C057D74, &type metadata for DynamicTypeSize.Accessibility4CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03A10);
  }
  return result;
}

unint64_t sub_23C048050()
{
  unint64_t result;

  result = qword_256B03A18;
  if (!qword_256B03A18)
  {
    result = MEMORY[0x242615EC8](&unk_23C057CFC, &type metadata for DynamicTypeSize.Accessibility5CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03A18);
  }
  return result;
}

unint64_t sub_23C048098()
{
  unint64_t result;

  result = qword_256B03A20;
  if (!qword_256B03A20)
  {
    result = MEMORY[0x242615EC8](&unk_23C057D24, &type metadata for DynamicTypeSize.Accessibility5CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03A20);
  }
  return result;
}

unint64_t sub_23C0480E0()
{
  unint64_t result;

  result = qword_256B03A28;
  if (!qword_256B03A28)
  {
    result = MEMORY[0x242615EC8](&unk_23C05810C, &type metadata for DynamicTypeSize.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03A28);
  }
  return result;
}

unint64_t sub_23C048128()
{
  unint64_t result;

  result = qword_256B03A30;
  if (!qword_256B03A30)
  {
    result = MEMORY[0x242615EC8](&unk_23C058134, &type metadata for DynamicTypeSize.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03A30);
  }
  return result;
}

uint64_t sub_23C048174(char *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = (uint64_t)*(&off_250CF5CA0 + *a1);
  return *(_QWORD *)(v2 + 8 * (char)_s13FitnessCoreUI13GridSizeClassOyAC0B8Graphics7CGFloatVcfC_0(*(double *)(a2 + 8)));
}

void sub_23C0481B0(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23C0481EC()
{
  double v0;

  return qword_23C058738[(char)_s13FitnessCoreUI13GridSizeClassOyAC0B8Graphics7CGFloatVcfC_0(v0)];
}

void sub_23C0482F8()
{
  JUMPOUT(0x23C0482E4);
}

void sub_23C048304()
{
  JUMPOUT(0x23C0482E4);
}

void sub_23C048310()
{
  JUMPOUT(0x23C0482E4);
}

void sub_23C04831C()
{
  JUMPOUT(0x23C0482E4);
}

void GridLayoutProvider.gridDescriptor(ofKind:compatibleWith:)(char *a1, double *a2)
{
  uint64_t *v2;
  char v3;
  char v4;
  uint64_t v5;
  double v6;
  char *v7;
  _BYTE v8[8];
  double v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;

  v3 = *a1;
  v4 = *(_BYTE *)a2;
  v6 = a2[1];
  v5 = *((_QWORD *)a2 + 2);
  if (*((_BYTE *)a2 + 24) == 1)
  {
    v13 = *v2;
    v12 = v3;
    v8[0] = v4;
    v9 = v6;
    v10 = v5;
    v11 = 1;
    sub_23C0481B0((uint64_t)&v12);
  }
  else
  {
    v12 = *a1;
    v8[0] = v4;
    v9 = v6;
    v10 = v5;
    v11 = 0;
    sub_23C048174(&v12, (uint64_t)v8);
  }
  v7 = (char *)sub_23C0483F4
     + 4 * byte_23C05863C[_s13FitnessCoreUI13GridSizeClassOyAC0B8Graphics7CGFloatVcfC_0(v6)];
  __asm { BR              X10 }
}

uint64_t sub_23C0483F4(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;

  v4 = 20.0;
  if ((result & 0xFE) == 4)
    v4 = 24.0;
  *(_QWORD *)v1 = v3;
  *(_QWORD *)(v1 + 8) = 0x404A000000000000;
  *(_QWORD *)(v1 + 16) = 0x404A000000000000;
  *(_QWORD *)(v1 + 24) = 0x404A000000000000;
  *(_QWORD *)(v1 + 32) = 0x404A000000000000;
  *(double *)(v1 + 40) = v4;
  *(_QWORD *)(v1 + 48) = v2;
  return result;
}

void GridLayoutProvider.itemWidthForGrid(ofKind:compatibleWith:)(char *a1, char *a2)
{
  uint64_t *v2;
  char v3;
  char v4;
  char v5;
  double v6;
  __int128 v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = *a1;
  v4 = *a2;
  v5 = a2[24];
  v10 = *v2;
  v9 = v3;
  LOBYTE(v6) = v4;
  v7 = *(_OWORD *)(a2 + 8);
  v8 = v5;
  GridLayoutProvider.gridDescriptor(ofKind:compatibleWith:)(&v9, &v6);
  if (__OFSUB__(v11, 1))
  {
    __break(1u);
    goto LABEL_5;
  }
  if (__OFSUB__(v12, 1))
LABEL_5:
    __break(1u);
}

void GridLayoutProvider.itemWidthForGrid(ofKind:inContainerOfWidth:)(char *a1, double a2)
{
  uint64_t *v2;
  char v3;
  char v4[8];
  double v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;

  v3 = *a1;
  v9 = *v2;
  v8 = v3;
  v4[0] = 0;
  v5 = a2;
  v6 = 0;
  v7 = 0;
  GridLayoutProvider.itemWidthForGrid(ofKind:compatibleWith:)(&v8, v4);
}

void sub_23C048560(char *a1, double a2)
{
  uint64_t *v2;
  char v3;
  char v4[8];
  double v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;

  v3 = *a1;
  v9 = *v2;
  v8 = v3;
  v4[0] = 0;
  v5 = a2;
  v6 = 0;
  v7 = 0;
  GridLayoutProvider.itemWidthForGrid(ofKind:compatibleWith:)(&v8, v4);
}

ValueMetadata *type metadata accessor for GridLayoutProvider()
{
  return &type metadata for GridLayoutProvider;
}

double TabItemSizeDescriptor.containerSize.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

__n128 TabItemSizeDescriptor.itemSize.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v2;
  __n128 result;

  v2 = *(_OWORD *)(v1 + 32);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(v1 + 48);
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t sub_23C0485E0()
{
  _BYTE *v0;

  if (*v0)
    return 0x657A69536D657469;
  else
    return 0x656E6961746E6F63;
}

uint64_t sub_23C048628@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C04907C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C04864C()
{
  sub_23C048D04();
  return sub_23C05456C();
}

uint64_t sub_23C048674()
{
  sub_23C048D04();
  return sub_23C054578();
}

uint64_t TabItemSizeDescriptor.encode(to:)(_QWORD *a1)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03AA8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = v1[1];
  v10 = v1[2];
  v11 = v1[3];
  v12 = v1[4];
  v13 = v1[5];
  v14 = v1[6];
  v15 = v1[7];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C048D04();
  sub_23C054560();
  v18 = v8;
  v19 = v9;
  v24 = 0;
  type metadata accessor for CGSize(0);
  sub_23C048D8C(&qword_256B03810, MEMORY[0x24BDBD848]);
  sub_23C054464();
  if (!v2)
  {
    v18 = v10;
    v19 = v11;
    v20 = v12;
    v21 = v13;
    v22 = v14;
    v23 = v15;
    v24 = 1;
    sub_23C048D48();
    sub_23C054464();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t TabItemSizeDescriptor.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v14[3];
  char v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03AC0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C048D04();
  sub_23C054554();
  if (!v2)
  {
    type metadata accessor for CGSize(0);
    v15 = 0;
    sub_23C048D8C(&qword_256B03828, MEMORY[0x24BDBD860]);
    sub_23C054404();
    v9 = v14[0];
    v15 = 1;
    sub_23C048DCC();
    sub_23C054404();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v10 = v14[0];
    v11 = v14[1];
    v12 = v14[2];
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v11;
    a2[3] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23C0489CC@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return TabItemSizeDescriptor.init(from:)(a1, a2);
}

uint64_t sub_23C0489E0(_QWORD *a1)
{
  return TabItemSizeDescriptor.encode(to:)(a1);
}

uint64_t TabItemSizeDescriptor.hash(into:)()
{
  sub_23C02F0C8();
  sub_23C02F0C8();
  return NSDirectionalEdgeInsets.hash(into:)();
}

uint64_t TabItemSizeDescriptor.hashValue.getter()
{
  sub_23C05450C();
  sub_23C02F0C8();
  sub_23C02F0C8();
  NSDirectionalEdgeInsets.hash(into:)();
  return sub_23C054548();
}

uint64_t sub_23C048AFC()
{
  sub_23C05450C();
  sub_23C02F0C8();
  sub_23C02F0C8();
  NSDirectionalEdgeInsets.hash(into:)();
  return sub_23C054548();
}

uint64_t sub_23C048B98()
{
  sub_23C02F0C8();
  sub_23C02F0C8();
  return NSDirectionalEdgeInsets.hash(into:)();
}

uint64_t sub_23C048C04()
{
  sub_23C05450C();
  sub_23C02F0C8();
  sub_23C02F0C8();
  NSDirectionalEdgeInsets.hash(into:)();
  return sub_23C054548();
}

uint64_t _s13FitnessCoreUI21TabItemSizeDescriptorV2eeoiySbAC_ACtFZ_0(float64x2_t *a1, float64x2_t *a2)
{
  char v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v7[3];
  float64x2_t v8[3];

  if (a1->f64[0] == a2->f64[0] && a1->f64[1] == a2->f64[1])
  {
    v4 = a1[2];
    v8[0] = a1[1];
    v8[1] = v4;
    v8[2] = a1[3];
    v5 = a2[2];
    v7[0] = a2[1];
    v7[1] = v5;
    v7[2] = a2[3];
    v3 = _s13FitnessCoreUI11TabItemSizeV2eeoiySbAC_ACtFZ_0(v8, v7);
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

unint64_t sub_23C048D04()
{
  unint64_t result;

  result = qword_256B03AB0;
  if (!qword_256B03AB0)
  {
    result = MEMORY[0x242615EC8](&unk_23C058A6C, &type metadata for TabItemSizeDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03AB0);
  }
  return result;
}

unint64_t sub_23C048D48()
{
  unint64_t result;

  result = qword_256B03AB8;
  if (!qword_256B03AB8)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItemSize, &type metadata for TabItemSize);
    atomic_store(result, (unint64_t *)&qword_256B03AB8);
  }
  return result;
}

uint64_t sub_23C048D8C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CGSize(255);
    result = MEMORY[0x242615EC8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C048DCC()
{
  unint64_t result;

  result = qword_256B03AC8;
  if (!qword_256B03AC8)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItemSize, &type metadata for TabItemSize);
    atomic_store(result, (unint64_t *)&qword_256B03AC8);
  }
  return result;
}

unint64_t sub_23C048E14()
{
  unint64_t result;

  result = qword_256B03AD0;
  if (!qword_256B03AD0)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for TabItemSizeDescriptor, &type metadata for TabItemSizeDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B03AD0);
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

uint64_t getEnumTagSinglePayload for TabItemSizeDescriptor(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TabItemSizeDescriptor(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
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
  *(_BYTE *)(result + 64) = v3;
  return result;
}

ValueMetadata *type metadata accessor for TabItemSizeDescriptor()
{
  return &type metadata for TabItemSizeDescriptor;
}

uint64_t storeEnumTagSinglePayload for TabItemSizeDescriptor.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C048F24 + 4 * byte_23C0588C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C048F58 + 4 * byte_23C0588C0[v4]))();
}

uint64_t sub_23C048F58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C048F60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C048F68);
  return result;
}

uint64_t sub_23C048F74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C048F7CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C048F80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C048F88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TabItemSizeDescriptor.CodingKeys()
{
  return &type metadata for TabItemSizeDescriptor.CodingKeys;
}

unint64_t sub_23C048FA8()
{
  unint64_t result;

  result = qword_256B03AD8;
  if (!qword_256B03AD8)
  {
    result = MEMORY[0x242615EC8](&unk_23C058A44, &type metadata for TabItemSizeDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03AD8);
  }
  return result;
}

unint64_t sub_23C048FF0()
{
  unint64_t result;

  result = qword_256B03AE0;
  if (!qword_256B03AE0)
  {
    result = MEMORY[0x242615EC8](&unk_23C0589B4, &type metadata for TabItemSizeDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03AE0);
  }
  return result;
}

unint64_t sub_23C049038()
{
  unint64_t result;

  result = qword_256B03AE8;
  if (!qword_256B03AE8)
  {
    result = MEMORY[0x242615EC8](&unk_23C0589DC, &type metadata for TabItemSizeDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03AE8);
  }
  return result;
}

uint64_t sub_23C04907C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x656E6961746E6F63 && a2 == 0xED0000657A695372;
  if (v2 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657A69536D657469 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C054488();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

FitnessCoreUI::CropCode_optional __swiftcall CropCode.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  FitnessCoreUI::CropCode_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23C0543B0();
  result.value = swift_bridgeObjectRelease();
  v5 = 13;
  if (v3 < 0xD)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t CropCode.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23C04921C + 4 * byte_23C058ABC[*v0]))(0x756F732E76617267, 0xEA00000000006874);
}

uint64_t sub_23C04921C()
{
  return 0x304D43462E434843;
}

uint64_t sub_23C049284()
{
  return 0x4D4F462E57444D43;
}

uint64_t sub_23C0492A4()
{
  return 0x5450462E574D5043;
}

uint64_t sub_23C0492C4()
{
  return 0x5450462E574D5043;
}

uint64_t sub_23C0492E8()
{
  return 0x5354462E54485543;
}

uint64_t sub_23C04930C()
{
  return 26210;
}

uint64_t sub_23C049318()
{
  return 29299;
}

uint64_t sub_23C049324()
{
  return 29294;
}

uint64_t sub_23C049330()
{
  return 0x7361652E76617267;
}

uint64_t sub_23C049350()
{
  return sub_23C04DDC8();
}

FitnessCoreUI::CropCode_optional sub_23C04935C(Swift::String *a1)
{
  return CropCode.init(rawValue:)(*a1);
}

uint64_t sub_23C049368@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CropCode.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23C04938C()
{
  sub_23C04965C();
  return sub_23C0540F8();
}

uint64_t sub_23C0493E8()
{
  sub_23C04965C();
  return sub_23C0540E0();
}

unint64_t sub_23C049438()
{
  unint64_t result;

  result = qword_256B03AF0;
  if (!qword_256B03AF0)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for CropCode, &type metadata for CropCode);
    atomic_store(result, (unint64_t *)&qword_256B03AF0);
  }
  return result;
}

uint64_t sub_23C04947C()
{
  sub_23C05450C();
  CropCode.rawValue.getter();
  sub_23C05405C();
  swift_bridgeObjectRelease();
  return sub_23C054548();
}

uint64_t sub_23C0494E0()
{
  CropCode.rawValue.getter();
  sub_23C05405C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C049530()
{
  sub_23C05450C();
  CropCode.rawValue.getter();
  sub_23C05405C();
  swift_bridgeObjectRelease();
  return sub_23C054548();
}

uint64_t storeEnumTagSinglePayload for CropCode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 12 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 12) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF3)
    return ((uint64_t (*)(void))((char *)&loc_23C0495DC + 4 * byte_23C058ACE[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_23C049610 + 4 * byte_23C058AC9[v4]))();
}

uint64_t sub_23C049610(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C049618(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C049620);
  return result;
}

uint64_t sub_23C04962C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C049634);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_23C049638(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C049640(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CropCode()
{
  return &type metadata for CropCode;
}

unint64_t sub_23C04965C()
{
  unint64_t result;

  result = qword_256B03AF8;
  if (!qword_256B03AF8)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for CropCode, &type metadata for CropCode);
    atomic_store(result, (unint64_t *)&qword_256B03AF8);
  }
  return result;
}

FitnessCoreUI::FloatingTabViewUpdateReason_optional __swiftcall FloatingTabViewUpdateReason.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  FitnessCoreUI::FloatingTabViewUpdateReason_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23C0543B0();
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

uint64_t FloatingTabViewUpdateReason.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x684374756F79616CLL;
  else
    return 0x6E61684361746164;
}

uint64_t sub_23C049750(char *a1, char *a2)
{
  return sub_23C04DE5C(*a1, *a2);
}

FitnessCoreUI::FloatingTabViewUpdateReason_optional sub_23C04975C(Swift::String *a1)
{
  return FloatingTabViewUpdateReason.init(rawValue:)(*a1);
}

void sub_23C049768(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x6E61684361746164;
  if (*v1)
    v2 = 0x684374756F79616CLL;
  v3 = 0xEB00000000646567;
  if (*v1)
    v3 = 0xED00006465676E61;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_23C0497BC()
{
  sub_23C049B0C();
  return sub_23C0540F8();
}

uint64_t sub_23C049818()
{
  sub_23C049B0C();
  return sub_23C0540E0();
}

unint64_t sub_23C049868()
{
  unint64_t result;

  result = qword_256B03B00;
  if (!qword_256B03B00)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for FloatingTabViewUpdateReason, &type metadata for FloatingTabViewUpdateReason);
    atomic_store(result, (unint64_t *)&qword_256B03B00);
  }
  return result;
}

uint64_t sub_23C0498AC()
{
  sub_23C05450C();
  sub_23C05405C();
  swift_bridgeObjectRelease();
  return sub_23C054548();
}

uint64_t sub_23C049940()
{
  sub_23C05405C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C0499B0()
{
  sub_23C05450C();
  sub_23C05405C();
  swift_bridgeObjectRelease();
  return sub_23C054548();
}

uint64_t storeEnumTagSinglePayload for FloatingTabViewUpdateReason(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C049A8C + 4 * byte_23C058C15[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C049AC0 + 4 * byte_23C058C10[v4]))();
}

uint64_t sub_23C049AC0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C049AC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C049AD0);
  return result;
}

uint64_t sub_23C049ADC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C049AE4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C049AE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C049AF0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FloatingTabViewUpdateReason()
{
  return &type metadata for FloatingTabViewUpdateReason;
}

unint64_t sub_23C049B0C()
{
  unint64_t result;

  result = qword_256B03B08;
  if (!qword_256B03B08)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for FloatingTabViewUpdateReason, &type metadata for FloatingTabViewUpdateReason);
    atomic_store(result, (unint64_t *)&qword_256B03B08);
  }
  return result;
}

unint64_t sub_23C049B50(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  uint64_t v16;
  __int128 v17;
  _QWORD *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B033C0);
  v2 = (_QWORD *)sub_23C05438C();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_QWORD *)(a1 + 64);
  while (1)
  {
    v5 = *((_BYTE *)v4 - 31);
    v6 = *(v4 - 3);
    v7 = *v4;
    v8 = v4[1];
    v9 = v4[2];
    v10 = v4[3];
    v11 = v4[4];
    v12 = v4[5];
    v13 = v4[6];
    LOBYTE(v22) = *((_BYTE *)v4 - 32);
    BYTE1(v22) = v5;
    *((_QWORD *)&v22 + 1) = v6;
    v23 = *((_OWORD *)v4 - 1);
    v24 = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_23C04A6EC((uint64_t)&v22);
    if ((v15 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v16 = v2[6] + 40 * result;
    v17 = v23;
    *(_OWORD *)v16 = v22;
    *(_OWORD *)(v16 + 16) = v17;
    *(_QWORD *)(v16 + 32) = v24;
    v18 = (_QWORD *)(v2[7] + 48 * result);
    *v18 = v8;
    v18[1] = v9;
    v18[2] = v10;
    v18[3] = v11;
    v18[4] = v12;
    v18[5] = v13;
    v19 = v2[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v2[2] = v21;
    v4 += 11;
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

unint64_t sub_23C049CD4(uint64_t a1)
{
  return sub_23C049DF8(a1, &qword_256B03B30, &qword_256B03B38, (uint64_t (*)(uint64_t))sub_23C04A7C4);
}

unint64_t sub_23C049CF0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B68);
  v2 = (_QWORD *)sub_23C05438C();
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
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    result = sub_23C04A844((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
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

unint64_t sub_23C049DF8(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t result;
  char v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;

  if (!*(_QWORD *)(a1 + 16))
  {
    v8 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = sub_23C05438C();
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  v10 = v7 + 64;
  v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23C0342B4(v11, (uint64_t)&v18, a3);
    v12 = v18;
    result = a4(v18);
    if ((v14 & 1) != 0)
      break;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v8[6] + 8 * result) = v12;
    result = (unint64_t)sub_23C04B068(&v19, (_OWORD *)(v8[7] + 32 * result));
    v15 = v8[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v8[2] = v17;
    v11 += 40;
    if (!--v9)
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

unint64_t sub_23C049F20(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B50);
  v2 = (_QWORD *)sub_23C05438C();
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
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    result = sub_23C04A844((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v4 += 2;
    v2[2] = v12;
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

id static UIFont.preferredFont(forTextStyle:design:symbolicTraits:weight:compatibleWith:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  return sub_23C04AB80(a1, a2, a3 | ((HIDWORD(a3) & 1) << 32), a4, a5 & 1, a6);
}

id static UIFont._preferredFont(forTextStyle:design:symbolicTraits:weight:maximumContentSizeCategory:compatibleWith:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, char a5, uint64_t a6, void *a7)
{
  id v10;
  id v11;
  id v12;
  double v13;
  id v14;
  id v15;
  double v16;
  id v17;

  v10 = sub_23C04AB80(a1, a2, a3 | ((HIDWORD(a3) & 1) << 32), a4, a5 & 1, (uint64_t)a7);
  v11 = objc_msgSend(v10, sel_fontDescriptor);

  v12 = objc_msgSend(a7, sel_preferredContentSizeCategory);
  LOBYTE(v10) = sub_23C054218();

  v13 = 0.0;
  if ((v10 & 1) != 0)
  {
    v14 = objc_msgSend((id)objc_opt_self(), sel_traitCollectionWithPreferredContentSizeCategory_, a6);
    v15 = objc_msgSend((id)objc_opt_self(), sel_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_, a1, v14);
    objc_msgSend(v15, sel_pointSize);
    v13 = v16;

  }
  v17 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v11, v13);

  return v17;
}

id static UIFont.systemFont(ofSize:weight:design:symbolicTraits:)(uint64_t a1, char a2, uint64_t a3, unsigned int a4, double a5)
{
  return sub_23C04ADAC(a1, a2 & 1, a3, a4, a5);
}

id static UIFont.systemFont(ofSize:weight:design:)(uint64_t a1, char a2, uint64_t a3, double a4)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  if ((a2 & 1) != 0)
    v5 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_, a4);
  else
    v5 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_weight_, a4, *(double *)&a1);
  v6 = v5;
  v7 = objc_msgSend(v6, sel_fontDescriptor);
  v8 = objc_msgSend(v7, sel_fontDescriptorWithDesign_, a3);
  if (v8)
  {
    v9 = v8;

    v7 = v9;
  }
  v10 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v7, 0.0);

  return v10;
}

id static UIFont.systemFont(ofSize:weight:symbolicTraits:)(uint64_t a1, char a2, unsigned int a3, double a4)
{
  return sub_23C04ADAC(a1, a2 & 1, 0, a3, a4);
}

UIFont __swiftcall UIFont.centeredColonsVersion()()
{
  return (UIFont)sub_23C04A504(35, 6);
}

UIFont __swiftcall UIFont.monospaced()()
{
  void *v0;
  id v1;
  uint64_t inited;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v1 = objc_msgSend(v0, sel_fontDescriptor);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B18);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23C056AE0;
  v3 = (void *)*MEMORY[0x24BEBB548];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB548];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B20);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23C058D40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B10);
  v5 = swift_initStackObject();
  *(_OWORD *)(v5 + 16) = xmmword_23C058D40;
  v6 = (void *)*MEMORY[0x24BEBE1B8];
  *(_QWORD *)(v5 + 32) = *MEMORY[0x24BEBE1B8];
  *(_QWORD *)(v5 + 40) = 6;
  v7 = (void *)*MEMORY[0x24BEBE1A8];
  *(_QWORD *)(v5 + 48) = *MEMORY[0x24BEBE1A8];
  *(_QWORD *)(v5 + 56) = 0;
  v8 = v3;
  v9 = v6;
  v10 = v7;
  *(_QWORD *)(v4 + 32) = sub_23C049F20(v5);
  v11 = swift_initStackObject();
  *(_OWORD *)(v11 + 16) = xmmword_23C058D40;
  *(_QWORD *)(v11 + 32) = v9;
  *(_QWORD *)(v11 + 40) = 22;
  *(_QWORD *)(v11 + 48) = v10;
  *(_QWORD *)(v11 + 56) = 1;
  v12 = v9;
  v13 = v10;
  *(_QWORD *)(v4 + 40) = sub_23C049F20(v11);
  *(_QWORD *)(inited + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B28);
  *(_QWORD *)(inited + 40) = v4;
  sub_23C049DF8(inited, &qword_256B03B40, &qword_256B03B48, (uint64_t (*)(uint64_t))sub_23C04A844);
  type metadata accessor for AttributeName(0);
  sub_23C04B020();
  v14 = (void *)sub_23C053FE4();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v1, sel_fontDescriptorByAddingAttributes_, v14);

  v16 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v15, 0.0);
  return (UIFont)v16;
}

UIFont __swiftcall UIFont.smallCapsVersion()()
{
  return (UIFont)sub_23C04A504(38, 1);
}

id sub_23C04A504(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v5;
  uint64_t inited;
  void *v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v5 = objc_msgSend(v2, sel_fontDescriptor);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B10);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23C058D40;
  v7 = (void *)*MEMORY[0x24BEBE1B8];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBE1B8];
  *(_QWORD *)(inited + 40) = a1;
  v8 = (void *)*MEMORY[0x24BEBE1A8];
  *(_QWORD *)(inited + 48) = *MEMORY[0x24BEBE1A8];
  *(_QWORD *)(inited + 56) = a2;
  v9 = v7;
  v10 = v8;
  v11 = sub_23C049F20(inited);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B18);
  v12 = swift_initStackObject();
  *(_OWORD *)(v12 + 16) = xmmword_23C056AE0;
  v13 = (void *)*MEMORY[0x24BEBB548];
  *(_QWORD *)(v12 + 32) = *MEMORY[0x24BEBB548];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B20);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_23C056AE0;
  *(_QWORD *)(v14 + 32) = v11;
  *(_QWORD *)(v12 + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B28);
  *(_QWORD *)(v12 + 40) = v14;
  v15 = v13;
  sub_23C049DF8(v12, &qword_256B03B40, &qword_256B03B48, (uint64_t (*)(uint64_t))sub_23C04A844);
  type metadata accessor for AttributeName(0);
  sub_23C04B020();
  v16 = (void *)sub_23C053FE4();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend(v5, sel_fontDescriptorByAddingAttributes_, v16);

  v18 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v17, 0.0);
  return v18;
}

UIFont __swiftcall UIFont.shortSlashVersion()()
{
  return (UIFont)sub_23C04A504(33, 0);
}

unint64_t sub_23C04A6EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  sub_23C05450C();
  v2 = *(_QWORD *)(a1 + 16);
  sub_23C054524();
  sub_23C054518();
  sub_23C054524();
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_23C05405C();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_23C05405C();
  swift_bridgeObjectRelease();
  v3 = sub_23C054548();
  return sub_23C04A8D0((unsigned __int8 *)a1, v3);
}

unint64_t sub_23C04A7C4(uint64_t a1)
{
  uint64_t v2;

  sub_23C054038();
  sub_23C05450C();
  sub_23C05405C();
  v2 = sub_23C054548();
  swift_bridgeObjectRelease();
  return sub_23C04AA0C(a1, v2);
}

unint64_t sub_23C04A844(uint64_t a1)
{
  uint64_t v2;

  sub_23C054038();
  sub_23C05450C();
  sub_23C05405C();
  v2 = sub_23C054548();
  swift_bridgeObjectRelease();
  return sub_23C04AA0C(a1, v2);
}

unint64_t sub_23C04A8D0(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  unsigned __int8 *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = ~v4;
    v7 = *(_QWORD *)(v2 + 48);
    v8 = *a1;
    v9 = a1[1];
    v10 = *((_QWORD *)a1 + 2);
    v19 = *((_QWORD *)a1 + 3);
    v20 = *((_QWORD *)a1 + 1);
    v18 = *((_QWORD *)a1 + 4);
    do
    {
      v11 = (unsigned __int8 *)(v7 + 40 * v5);
      if (((v8 ^ *v11) & 1) != 0 || v11[1] != v9)
        goto LABEL_4;
      v12 = *((_QWORD *)v11 + 2);
      v13 = *((_QWORD *)v11 + 3);
      v14 = *((_QWORD *)v11 + 4);
      if (v12)
      {
        if (!v10)
          goto LABEL_4;
        v15 = *((_QWORD *)v11 + 1) == v20 && v12 == v10;
        if (!v15 && (sub_23C054488() & 1) == 0)
          goto LABEL_4;
      }
      else if (v10)
      {
        goto LABEL_4;
      }
      v16 = v13 == v19 && v14 == v18;
      if (v16 || (sub_23C054488() & 1) != 0)
        return v5;
LABEL_4:
      v5 = (v5 + 1) & v6;
    }
    while (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t sub_23C04AA0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_23C054038();
    v8 = v7;
    if (v6 == sub_23C054038() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_23C054488();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_23C054038();
          v15 = v14;
          if (v13 == sub_23C054038() && v15 == v16)
            break;
          v18 = sub_23C054488();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

id sub_23C04AB80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t inited;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  unint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = objc_msgSend((id)objc_opt_self(), sel_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_, a1, a6);
  v11 = v10;
  if ((a3 & 0x100000000) == 0)
  {
    v12 = objc_msgSend(v10, sel_fontDescriptorWithSymbolicTraits_, a3);
    if (v12)
    {
      v13 = v12;

      v11 = v13;
    }
  }
  if ((a5 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B18);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23C056AE0;
    v15 = (void *)*MEMORY[0x24BEBB590];
    *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB590];
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B58);
    v16 = swift_initStackObject();
    *(_OWORD *)(v16 + 16) = xmmword_23C056AE0;
    v17 = (void *)*MEMORY[0x24BEBB620];
    *(_QWORD *)(v16 + 32) = *MEMORY[0x24BEBB620];
    *(_QWORD *)(v16 + 40) = a4;
    v18 = v15;
    v19 = v17;
    v20 = sub_23C049CF0(v16);
    *(_QWORD *)(inited + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B60);
    *(_QWORD *)(inited + 40) = v20;
    sub_23C049DF8(inited, &qword_256B03B40, &qword_256B03B48, (uint64_t (*)(uint64_t))sub_23C04A844);
    type metadata accessor for AttributeName(0);
    sub_23C04B020();
    v21 = (void *)sub_23C053FE4();
    swift_bridgeObjectRelease();
    v22 = objc_msgSend(v11, sel_fontDescriptorByAddingAttributes_, v21);

    v11 = v22;
  }
  if (a2)
  {
    v23 = objc_msgSend(v11, sel_fontDescriptorWithDesign_, a2);
    if (v23)
    {
      v24 = v23;

      v11 = v24;
    }
  }
  v25 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v11, 0.0);

  return v25;
}

id sub_23C04ADAC(uint64_t a1, char a2, uint64_t a3, uint64_t a4, double a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t inited;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  unint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;

  if ((a2 & 1) != 0)
    v9 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_, a5);
  else
    v9 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_weight_, a5, *(double *)&a1);
  v10 = v9;
  v11 = objc_msgSend(v10, sel_fontDescriptor);
  v12 = v11;
  if ((a4 & 0x100000000) == 0)
  {
    v13 = objc_msgSend(v11, sel_fontDescriptorWithSymbolicTraits_, a4);
    if (v13)
    {
      v14 = v13;

      v12 = v14;
    }
    if ((a2 & 1) == 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B18);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_23C056AE0;
      v16 = (void *)*MEMORY[0x24BEBB590];
      *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB590];
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B58);
      v17 = swift_initStackObject();
      *(_OWORD *)(v17 + 16) = xmmword_23C056AE0;
      v18 = (void *)*MEMORY[0x24BEBB620];
      *(_QWORD *)(v17 + 32) = *MEMORY[0x24BEBB620];
      *(_QWORD *)(v17 + 40) = a1;
      v19 = v16;
      v20 = v18;
      v21 = sub_23C049CF0(v17);
      *(_QWORD *)(inited + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B60);
      *(_QWORD *)(inited + 40) = v21;
      sub_23C049DF8(inited, &qword_256B03B40, &qword_256B03B48, (uint64_t (*)(uint64_t))sub_23C04A844);
      type metadata accessor for AttributeName(0);
      sub_23C04B020();
      v22 = (void *)sub_23C053FE4();
      swift_bridgeObjectRelease();
      v23 = objc_msgSend(v12, sel_fontDescriptorByAddingAttributes_, v22);

      v12 = v23;
    }
  }
  if (a3)
  {
    v24 = objc_msgSend(v12, sel_fontDescriptorWithDesign_, a3);
    if (v24)
    {
      v25 = v24;

      v12 = v25;
    }
  }
  v26 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v12, 0.0);

  return v26;
}

unint64_t sub_23C04B020()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B02CB0;
  if (!qword_256B02CB0)
  {
    type metadata accessor for AttributeName(255);
    result = MEMORY[0x242615EC8](&unk_23C0552A8, v1);
    atomic_store(result, (unint64_t *)&qword_256B02CB0);
  }
  return result;
}

_OWORD *sub_23C04B068(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id NSLayoutConstraint.withPriority(_:)()
{
  void *v0;
  id v2;

  objc_msgSend(v0, sel_setPriority_);
  return v2;
}

void static NSLayoutConstraint.activate(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t i;
  unint64_t v3;
  void *ObjCClassFromMetadata;
  id v5;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    for (i = 0; i != v1; ++i)
    {
      v3 = swift_bridgeObjectRetain();
      sub_23C04B16C(v3);
    }
    swift_bridgeObjectRelease();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_23C03CC54();
  v5 = (id)sub_23C054110();
  swift_bridgeObjectRelease();
  objc_msgSend(ObjCClassFromMetadata, sel_activateConstraints_, v5);

}

uint64_t sub_23C04B16C(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_23C054368();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_23C054368();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x24261588C](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_23C04B324(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_23C054368();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_23C054128();
  }
  __break(1u);
  return result;
}

uint64_t sub_23C04B324(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_23C054368();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_23C054368();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_23C04B59C();
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B70);
          v12 = sub_23C04B51C(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_23C03CC54();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_23C054398();
  __break(1u);
  return result;
}

void (*sub_23C04B51C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_23C04B5E8(v6, a2, a3);
  return sub_23C04B570;
}

void sub_23C04B570(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

unint64_t sub_23C04B59C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B03B78;
  if (!qword_256B03B78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B03B70);
    result = MEMORY[0x242615EC8](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_256B03B78);
  }
  return result;
}

void (*sub_23C04B5E8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x242615880](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_23C04B654;
  }
  __break(1u);
  return result;
}

void sub_23C04B654(id *a1)
{

}

CGSize __swiftcall CGSize.rounded()()
{
  double v0;
  double v1;
  double v2;
  double v3;
  CGSize result;

  v2 = ceil(v0);
  v3 = ceil(v1);
  result.height = v3;
  result.width = v2;
  return result;
}

uint64_t sub_23C04B668()
{
  return sub_23C05453C();
}

double ViewLayout.containerSize.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

uint64_t ViewLayout.gridSizeClass.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_23C04B6A8()
{
  _BYTE *v0;

  if (*v0)
    return 0x657A695364697267;
  else
    return 0x656E6961746E6F63;
}

uint64_t sub_23C04B6FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C04BF74(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C04B720()
{
  sub_23C04B8E8();
  return sub_23C05456C();
}

uint64_t sub_23C04B748()
{
  sub_23C04B8E8();
  return sub_23C054578();
}

double sub_23C04B770()
{
  uint64_t v0;

  return *(double *)v0;
}

uint64_t sub_23C04B778()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t ViewLayout.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  _QWORD v12[2];
  char v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = v1[1];
  v10 = *((_BYTE *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C04B8E8();
  sub_23C054560();
  v12[0] = v8;
  v12[1] = v9;
  v13 = 0;
  type metadata accessor for CGSize(0);
  sub_23C048D8C(&qword_256B03810, MEMORY[0x24BDBD848]);
  sub_23C054464();
  if (!v2)
  {
    LOBYTE(v12[0]) = v10;
    v13 = 1;
    sub_23C04B92C();
    sub_23C054464();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23C04B8E8()
{
  unint64_t result;

  result = qword_256B03B88;
  if (!qword_256B03B88)
  {
    result = MEMORY[0x242615EC8](&unk_23C058F04, &type metadata for ViewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03B88);
  }
  return result;
}

unint64_t sub_23C04B92C()
{
  unint64_t result;

  result = qword_256B03B90;
  if (!qword_256B03B90)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for GridSizeClass, &type metadata for GridSizeClass);
    atomic_store(result, (unint64_t *)&qword_256B03B90);
  }
  return result;
}

uint64_t ViewLayout.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _QWORD v13[2];
  char v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03B98);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C04B8E8();
  sub_23C054554();
  if (!v2)
  {
    type metadata accessor for CGSize(0);
    v14 = 0;
    sub_23C048D8C(&qword_256B03828, MEMORY[0x24BDBD860]);
    sub_23C054404();
    v9 = v13[0];
    v10 = v13[1];
    v14 = 1;
    sub_23C04BB10();
    sub_23C054404();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v11 = v13[0];
    *(_QWORD *)a2 = v9;
    *(_QWORD *)(a2 + 8) = v10;
    *(_BYTE *)(a2 + 16) = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_23C04BB10()
{
  unint64_t result;

  result = qword_256B03BA0;
  if (!qword_256B03BA0)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for GridSizeClass, &type metadata for GridSizeClass);
    atomic_store(result, (unint64_t *)&qword_256B03BA0);
  }
  return result;
}

uint64_t sub_23C04BB54@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ViewLayout.init(from:)(a1, a2);
}

uint64_t sub_23C04BB68(_QWORD *a1)
{
  return ViewLayout.encode(to:)(a1);
}

uint64_t ViewLayout.hash(into:)()
{
  sub_23C02F0C8();
  return sub_23C05453C();
}

uint64_t ViewLayout.hashValue.getter()
{
  sub_23C05450C();
  ViewLayout.hash(into:)();
  return sub_23C054548();
}

uint64_t sub_23C04BC0C()
{
  sub_23C05450C();
  ViewLayout.hash(into:)();
  return sub_23C054548();
}

uint64_t sub_23C04BC60()
{
  sub_23C05450C();
  ViewLayout.hash(into:)();
  return sub_23C054548();
}

BOOL _s13FitnessCoreUI10ViewLayoutV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  return *(double *)a1 == *(double *)a2
      && *(double *)(a1 + 8) == *(double *)(a2 + 8)
      && dbl_23C058F88[*(char *)(a1 + 16)] == dbl_23C058F88[*(char *)(a2 + 16)];
}

unint64_t sub_23C04BCF4()
{
  unint64_t result;

  result = qword_256B03BA8;
  if (!qword_256B03BA8)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for ViewLayout, &type metadata for ViewLayout);
    atomic_store(result, (unint64_t *)&qword_256B03BA8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ViewLayout(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 251);
  v3 = *(unsigned __int8 *)(a1 + 16);
  v4 = v3 >= 6;
  v5 = v3 - 6;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ViewLayout(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 251;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = a2 + 5;
  }
  return result;
}

ValueMetadata *type metadata accessor for ViewLayout()
{
  return &type metadata for ViewLayout;
}

uint64_t storeEnumTagSinglePayload for ViewLayout.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C04BE1C + 4 * byte_23C058D55[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C04BE50 + 4 * byte_23C058D50[v4]))();
}

uint64_t sub_23C04BE50(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C04BE58(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C04BE60);
  return result;
}

uint64_t sub_23C04BE6C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C04BE74);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C04BE78(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C04BE80(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ViewLayout.CodingKeys()
{
  return &type metadata for ViewLayout.CodingKeys;
}

unint64_t sub_23C04BEA0()
{
  unint64_t result;

  result = qword_256B03BB0;
  if (!qword_256B03BB0)
  {
    result = MEMORY[0x242615EC8](&unk_23C058EDC, &type metadata for ViewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03BB0);
  }
  return result;
}

unint64_t sub_23C04BEE8()
{
  unint64_t result;

  result = qword_256B03BB8;
  if (!qword_256B03BB8)
  {
    result = MEMORY[0x242615EC8](&unk_23C058E4C, &type metadata for ViewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03BB8);
  }
  return result;
}

unint64_t sub_23C04BF30()
{
  unint64_t result;

  result = qword_256B03BC0;
  if (!qword_256B03BC0)
  {
    result = MEMORY[0x242615EC8](&unk_23C058E74, &type metadata for ViewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03BC0);
  }
  return result;
}

uint64_t sub_23C04BF74(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x656E6961746E6F63 && a2 == 0xED0000657A695372;
  if (v2 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657A695364697267 && a2 == 0xED00007373616C43)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C054488();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

void ColorDescriptor.init(red:green:blue:alpha:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  *a1 = a5;
  a1[1] = a4;
  a1[2] = a3;
  a1[3] = a2;
}

double ColorDescriptor.alpha.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double ColorDescriptor.blue.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

double ColorDescriptor.green.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

double ColorDescriptor.red.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

double static ColorDescriptor.clear.getter@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_23C04C0E4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23C04C110 + 4 * byte_23C058FB8[*v0]))(0x6168706C61, 0xE500000000000000);
}

uint64_t sub_23C04C110()
{
  return 1702194274;
}

uint64_t sub_23C04C120()
{
  return 0x6E65657267;
}

uint64_t sub_23C04C130()
{
  return 6579570;
}

uint64_t sub_23C04C140@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C04C928(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C04C164()
{
  sub_23C04C374();
  return sub_23C05456C();
}

uint64_t sub_23C04C18C()
{
  sub_23C04C374();
  return sub_23C054578();
}

uint64_t ColorDescriptor.encode(to:)(_QWORD *a1)
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

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03BC8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v11 = v1[2];
  v10 = v1[3];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C04C374();
  sub_23C054560();
  v14 = v9;
  HIBYTE(v13) = 0;
  sub_23C02A834();
  sub_23C054464();
  if (!v2)
  {
    v14 = v8;
    HIBYTE(v13) = 1;
    sub_23C054464();
    v14 = v11;
    HIBYTE(v13) = 2;
    sub_23C054464();
    v14 = v10;
    HIBYTE(v13) = 3;
    sub_23C054464();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23C04C374()
{
  unint64_t result;

  result = qword_256B03BD0;
  if (!qword_256B03BD0)
  {
    result = MEMORY[0x242615EC8](&unk_23C05916C, &type metadata for ColorDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03BD0);
  }
  return result;
}

uint64_t ColorDescriptor.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
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

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03BD8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C04C374();
  sub_23C054554();
  if (!v2)
  {
    HIBYTE(v14) = 0;
    sub_23C02AAD4();
    sub_23C054404();
    v9 = v15;
    HIBYTE(v14) = 1;
    sub_23C054404();
    v10 = v15;
    HIBYTE(v14) = 2;
    sub_23C054404();
    v12 = v15;
    HIBYTE(v14) = 3;
    sub_23C054404();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v13 = v15;
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v12;
    a2[3] = v13;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23C04C5C0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return ColorDescriptor.init(from:)(a1, a2);
}

uint64_t sub_23C04C5D4(_QWORD *a1)
{
  return ColorDescriptor.encode(to:)(a1);
}

uint64_t ColorDescriptor.hash(into:)()
{
  sub_23C05453C();
  sub_23C05453C();
  sub_23C05453C();
  return sub_23C05453C();
}

uint64_t ColorDescriptor.hashValue.getter()
{
  sub_23C05450C();
  ColorDescriptor.hash(into:)();
  return sub_23C054548();
}

uint64_t sub_23C04C69C()
{
  sub_23C05450C();
  ColorDescriptor.hash(into:)();
  return sub_23C054548();
}

uint64_t sub_23C04C6E8()
{
  sub_23C05450C();
  ColorDescriptor.hash(into:)();
  return sub_23C054548();
}

unint64_t sub_23C04C730()
{
  unint64_t result;

  result = qword_256B03BE0;
  if (!qword_256B03BE0)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for ColorDescriptor, &type metadata for ColorDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B03BE0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorDescriptor()
{
  return &type metadata for ColorDescriptor;
}

uint64_t storeEnumTagSinglePayload for ColorDescriptor.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C04C7D0 + 4 * byte_23C058FC1[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C04C804 + 4 * byte_23C058FBC[v4]))();
}

uint64_t sub_23C04C804(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C04C80C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C04C814);
  return result;
}

uint64_t sub_23C04C820(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C04C828);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C04C82C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C04C834(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ColorDescriptor.CodingKeys()
{
  return &type metadata for ColorDescriptor.CodingKeys;
}

unint64_t sub_23C04C854()
{
  unint64_t result;

  result = qword_256B03BE8;
  if (!qword_256B03BE8)
  {
    result = MEMORY[0x242615EC8](&unk_23C059144, &type metadata for ColorDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03BE8);
  }
  return result;
}

unint64_t sub_23C04C89C()
{
  unint64_t result;

  result = qword_256B03BF0;
  if (!qword_256B03BF0)
  {
    result = MEMORY[0x242615EC8](&unk_23C0590B4, &type metadata for ColorDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03BF0);
  }
  return result;
}

unint64_t sub_23C04C8E4()
{
  unint64_t result;

  result = qword_256B03BF8[0];
  if (!qword_256B03BF8[0])
  {
    result = MEMORY[0x242615EC8](&unk_23C0590DC, &type metadata for ColorDescriptor.CodingKeys);
    atomic_store(result, qword_256B03BF8);
  }
  return result;
}

uint64_t sub_23C04C928(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6168706C61 && a2 == 0xE500000000000000;
  if (v2 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1702194274 && a2 == 0xE400000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E65657267 && a2 == 0xE500000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 6579570 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23C054488();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

BOOL CGSize.isNonZero.getter(double a1, double a2)
{
  return a2 > 0.0 && a1 > 0.0;
}

uint64_t static DynamicArtworkDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = type metadata accessor for ArtworkCandidate(0, a3, a4, a4);
  MEMORY[0x242615EC8](&protocol conformance descriptor for ArtworkCandidate<A>, v8);
  if ((sub_23C05414C() & 1) == 0)
    return 0;
  v10 = *(int *)(type metadata accessor for DynamicArtworkDescriptor(0, a3, a4, v9) + 36);
  return static StandardArtworkDescriptor.== infix(_:_:)(a1 + v10, a2 + v10, a3, a4);
}

uint64_t type metadata accessor for DynamicArtworkDescriptor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DynamicArtworkDescriptor);
}

uint64_t DynamicArtworkDescriptor.candidates.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DynamicArtworkDescriptor.fallbackArtworkDescriptor.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = v3 + *(int *)(a1 + 36);
  v6 = type metadata accessor for StandardArtworkDescriptor(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a3, v5, v6);
}

uint64_t DynamicArtworkDescriptor.init(candidates:fallbackArtworkDescriptor:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  char *v8;
  uint64_t v9;
  uint64_t v10;

  *a5 = a1;
  v8 = (char *)a5 + *(int *)(type metadata accessor for DynamicArtworkDescriptor(0, a3, a4, a4) + 36);
  v10 = type metadata accessor for StandardArtworkDescriptor(0, a3, a4, v9);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, a2, v10);
}

uint64_t sub_23C04CC50(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x74616469646E6163 && a2 == 0xEA00000000007365;
  if (v2 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000023C05AE70)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C054488();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C04CD48(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000019;
  else
    return 0x74616469646E6163;
}

uint64_t sub_23C04CD88()
{
  char *v0;

  return sub_23C04CD48(*v0);
}

uint64_t sub_23C04CD98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C04CC50(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C04CDC4(uint64_t a1)
{
  MEMORY[0x242615EC8](&unk_23C0593B8, a1);
  return sub_23C05456C();
}

uint64_t sub_23C04CDF8(uint64_t a1)
{
  MEMORY[0x242615EC8](&unk_23C0593B8, a1);
  return sub_23C054578();
}

uint64_t DynamicArtworkDescriptor.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;

  v21[0] = a2;
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = type metadata accessor for DynamicArtworkDescriptor.CodingKeys(255, v5, v6, a4);
  MEMORY[0x242615EC8](&unk_23C0593B8, v7);
  v8 = sub_23C054470();
  v22 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v21 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v11 = (uint64_t *)v21[1];
  v12 = v5;
  sub_23C054560();
  v26 = *v11;
  v25 = 0;
  v14 = type metadata accessor for ArtworkCandidate(255, v5, v6, v13);
  v15 = sub_23C054134();
  v24 = MEMORY[0x242615EC8](&protocol conformance descriptor for ArtworkCandidate<A>, v14);
  MEMORY[0x242615EC8](MEMORY[0x24BEE12A0], v15, &v24);
  v16 = v23;
  sub_23C054464();
  if (v16)
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v10, v8);
  v19 = v22;
  LOBYTE(v26) = 1;
  v20 = type metadata accessor for StandardArtworkDescriptor(0, v12, v6, v17);
  MEMORY[0x242615EC8](&protocol conformance descriptor for StandardArtworkDescriptor<A>, v20);
  sub_23C054464();
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v10, v8);
}

uint64_t type metadata accessor for DynamicArtworkDescriptor.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DynamicArtworkDescriptor.CodingKeys);
}

uint64_t DynamicArtworkDescriptor.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
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
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;

  v34 = a5;
  v37 = type metadata accessor for StandardArtworkDescriptor(0, a2, a3, a4);
  v33 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v36 = (char *)&v31 - v8;
  v10 = type metadata accessor for DynamicArtworkDescriptor.CodingKeys(255, a2, a3, v9);
  MEMORY[0x242615EC8](&unk_23C0593B8, v10);
  v40 = sub_23C05441C();
  v35 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v12 = (char *)&v31 - v11;
  v38 = a2;
  v39 = a3;
  v14 = type metadata accessor for DynamicArtworkDescriptor(0, a2, a3, v13);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v31 - v16;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v41 = v12;
  v18 = v42;
  sub_23C054554();
  if (v18)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v32 = v15;
  v42 = v14;
  v20 = v17;
  v22 = v35;
  v21 = v36;
  v23 = (uint64_t)a1;
  v24 = v37;
  v25 = type metadata accessor for ArtworkCandidate(255, v38, v39, v19);
  v26 = sub_23C054134();
  v44 = 0;
  v43 = MEMORY[0x242615EC8](&protocol conformance descriptor for ArtworkCandidate<A>, v25);
  MEMORY[0x242615EC8](MEMORY[0x24BEE12D0], v26, &v43);
  v27 = v40;
  sub_23C054404();
  *(_QWORD *)v20 = v45;
  LOBYTE(v45) = 1;
  MEMORY[0x242615EC8](&protocol conformance descriptor for StandardArtworkDescriptor<A>, v24);
  sub_23C054404();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v41, v27);
  v28 = v42;
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(&v20[*(int *)(v42 + 36)], v21, v24);
  v29 = v32;
  (*(void (**)(uint64_t, char *, uint64_t))(v32 + 16))(v34, v20, v28);
  __swift_destroy_boxed_opaque_existential_1(v23);
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v20, v28);
}

uint64_t sub_23C04D328@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  return DynamicArtworkDescriptor.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3, a4);
}

uint64_t sub_23C04D344(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return DynamicArtworkDescriptor.encode(to:)(a1, a2, a3, a4);
}

uint64_t DynamicArtworkDescriptor.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = type metadata accessor for ArtworkCandidate(0, v4, v5, a4);
  swift_bridgeObjectRetain();
  MEMORY[0x242615EC8](&protocol conformance descriptor for ArtworkCandidate<A>, v6);
  sub_23C054140();
  swift_bridgeObjectRelease();
  type metadata accessor for StandardArtworkDescriptor(0, v4, v5, v7);
  return StandardArtworkDescriptor.hash(into:)();
}

uint64_t DynamicArtworkDescriptor.hashValue.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[72];

  sub_23C05450C();
  DynamicArtworkDescriptor.hash(into:)((uint64_t)v5, a1, v2, v3);
  return sub_23C054548();
}

uint64_t sub_23C04D450(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[72];

  sub_23C05450C();
  DynamicArtworkDescriptor.hash(into:)((uint64_t)v6, a2, v3, v4);
  return sub_23C054548();
}

uint64_t sub_23C04D490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static DynamicArtworkDescriptor.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24));
}

void sub_23C04D49C()
{
  JUMPOUT(0x242615EC8);
}

uint64_t sub_23C04D4AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;

  result = type metadata accessor for StandardArtworkDescriptor(319, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_23C04D528(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  _QWORD *v15;
  _QWORD *v16;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = v6 & 0xF8 | 7;
  v8 = ~v7;
  v9 = *(_QWORD *)(v5 + 64) + 7;
  v10 = *a2;
  *a1 = *a2;
  if ((v6 & 0x1000F8) != 0 || (v9 & 0xFFFFFFFFFFFFFFF8) + (((v6 & 0xF8) + 15) & ~v7) + 16 > 0x18)
  {
    a1 = (uint64_t *)(v10 + ((v7 + 16) & v8));
    swift_retain();
  }
  else
  {
    v12 = ((unint64_t)a1 + 15) & v8;
    v13 = ((unint64_t)a2 + 15) & v8;
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v14(v12, v13, v4);
    v15 = (_QWORD *)((v9 + v12) & 0xFFFFFFFFFFFFFFF8);
    v16 = (_QWORD *)((v9 + v13) & 0xFFFFFFFFFFFFFFF8);
    *v15 = *v16;
    v15[1] = v16[1];
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_23C04D608(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80) & 0xF8 | 7;
  (*(void (**)(uint64_t))(v4 + 8))((a1 + v5 + 8) & ~v5);
  return swift_bridgeObjectRelease();
}

_QWORD *sub_23C04D678(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void (*v12)(unint64_t, unint64_t, uint64_t);
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80) & 0xF8;
  v7 = v6 + 15;
  v8 = (unint64_t)a1 + v6 + 15;
  v9 = ~v6 & 0xFFFFFFFFFFFFFFF8;
  v10 = v8 & v9;
  v11 = ((unint64_t)a2 + v7) & v9;
  v12 = *(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16);
  swift_bridgeObjectRetain();
  v12(v10, v11, v4);
  v13 = *(_QWORD *)(v5 + 64) + 7;
  v14 = (_QWORD *)((v13 + v10) & 0xFFFFFFFFFFFFFFF8);
  v15 = (_QWORD *)((v13 + v11) & 0xFFFFFFFFFFFFFFF8);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_23C04D720(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 80) & 0xF8;
  v8 = v7 + 15;
  v9 = (unint64_t)a1 + v7 + 15;
  v10 = ~v7 & 0xFFFFFFFFFFFFFFF8;
  v11 = v9 & v10;
  v12 = ((unint64_t)a2 + v8) & v10;
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(v9 & v10, v12);
  v13 = *(_QWORD *)(v6 + 64) + 7;
  v14 = (_QWORD *)((v13 + v11) & 0xFFFFFFFFFFFFFFF8);
  v15 = (_QWORD *)((v13 + v12) & 0xFFFFFFFFFFFFFFF8);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *sub_23C04D7DC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80) & 0xF8;
  v6 = v5 + 15;
  v7 = (unint64_t)a1 + v5 + 15;
  v8 = ~v5 & 0xFFFFFFFFFFFFFFF8;
  v9 = v7 & v8;
  v10 = ((unint64_t)a2 + v6) & v8;
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(v7 & v8, v10);
  *(_OWORD *)((*(_QWORD *)(v4 + 64) + 7 + v9) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v4 + 64) + 7 + v10) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_23C04D868(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 80) & 0xF8;
  v8 = v7 + 15;
  v9 = (unint64_t)a1 + v7 + 15;
  v10 = ~v7 & 0xFFFFFFFFFFFFFFF8;
  v11 = v9 & v10;
  v12 = ((unint64_t)a2 + v8) & v10;
  (*(void (**)(unint64_t, unint64_t))(v6 + 40))(v9 & v10, v12);
  v13 = *(_QWORD *)(v6 + 64) + 7;
  v14 = (_QWORD *)((v13 + v11) & 0xFFFFFFFFFFFFFFF8);
  v15 = (_QWORD *)((v13 + v12) & 0xFFFFFFFFFFFFFFF8);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23C04D914(uint64_t *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v13;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_DWORD *)(v4 + 80) & 0xF8;
  v8 = v7 | 7;
  if (v6 >= a2)
  {
    if ((v5 & 0x80000000) != 0)
    {
      return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v8 + 8) & ~v8);
    }
    else
    {
      v13 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v13) = -1;
      return (v13 + 1);
    }
  }
  else
  {
    if (((((*(_QWORD *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + ((v7 + 15) & ~v8) + 16) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v6 + 1;
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
    return ((uint64_t (*)(void))((char *)&loc_23C04D9A8 + 4 * byte_23C0591C0[v11]))();
  }
}

void sub_23C04DA28(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  _DWORD *v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_DWORD **)(*(_QWORD *)(a4 + 16) - 8);
  if (v5[21] <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = v5[21];
  if (v6 >= a3)
  {
    v9 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((v5[16] + 7) & 0xFFFFFFF8) + (((v5[20] & 0xF8) + 15) & ~(v5[20] & 0xF8 | 7)) == -16)
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
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X13 }
  }
  if (((v5[16] + 7) & 0xFFFFFFF8) + (((v5[20] & 0xF8) + 15) & ~(v5[20] & 0xF8 | 7)) != -16)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*((_QWORD *)v5 + 8) + 7) & 0xFFFFFFFFFFFFFFF8)+ (((v5[20] & 0xF8) + 15) & ~(v5[20] & 0xF8 | 7))+ 16);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_23C04DB34()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x23C04DB9CLL);
}

void sub_23C04DB3C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x23C04DB44);
  JUMPOUT(0x23C04DB9CLL);
}

void sub_23C04DB54()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x23C04DB9CLL);
}

void sub_23C04DB5C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x23C04DB9CLL);
}

void sub_23C04DB64(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_WORD *)(v3 + v4) = 0;
  if (a2)
  {
    if ((a3 & 0x80000000) == 0)
    {
      if ((a2 & 0x80000000) == 0)
        JUMPOUT(0x23C04DB98);
      JUMPOUT(0x23C04DB94);
    }
    JUMPOUT(0x23C04DB70);
  }
  JUMPOUT(0x23C04DB9CLL);
}

uint64_t sub_23C04DBB4(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C04DC00 + 4 * byte_23C0591D4[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C04DC34 + 4 * byte_23C0591CF[v4]))();
}

uint64_t sub_23C04DC34(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C04DC3C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C04DC44);
  return result;
}

uint64_t sub_23C04DC50(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C04DC58);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C04DC5C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C04DC64(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_23C04DC70()
{
  JUMPOUT(0x242615EC8);
}

void sub_23C04DC80()
{
  JUMPOUT(0x242615EC8);
}

void sub_23C04DC90()
{
  JUMPOUT(0x242615EC8);
}

uint64_t sub_23C04DCA0(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x72616C75676572;
    else
      v3 = 0x6669636570736E75;
    if (v2 == 1)
      v4 = 0xE700000000000000;
    else
      v4 = 0xEB00000000646569;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x72616C75676572;
      else
        v6 = 0x6669636570736E75;
      if (v5 == 1)
        v7 = 0xE700000000000000;
      else
        v7 = 0xEB00000000646569;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE700000000000000;
    v3 = 0x746361706D6F63;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE700000000000000;
  if (v3 != 0x746361706D6F63)
  {
LABEL_21:
    v8 = sub_23C054488();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23C04DDC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = CropCode.rawValue.getter();
  v2 = v1;
  if (v0 == CropCode.rawValue.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_23C054488();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23C04DE5C(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x684374756F79616CLL;
  else
    v3 = 0x6E61684361746164;
  if (v2)
    v4 = 0xEB00000000646567;
  else
    v4 = 0xED00006465676E61;
  if ((a2 & 1) != 0)
    v5 = 0x684374756F79616CLL;
  else
    v5 = 0x6E61684361746164;
  if ((a2 & 1) != 0)
    v6 = 0xED00006465676E61;
  else
    v6 = 0xEB00000000646567;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_23C054488();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

BOOL sub_23C04DF14(char a1, char a2)
{
  return dbl_23C059B40[a1] == dbl_23C059B40[a2];
}

uint64_t sub_23C04DF38()
{
  sub_23C05450C();
  sub_23C05453C();
  return sub_23C054548();
}

uint64_t sub_23C04DF88()
{
  sub_23C05450C();
  sub_23C05453C();
  return sub_23C054548();
}

BOOL sub_23C04DFD4(char a1, char a2)
{
  return dbl_23C059B40[a2] >= dbl_23C059B40[a1];
}

BOOL sub_23C04DFF8(char a1, char a2)
{
  return dbl_23C059B40[a1] >= dbl_23C059B40[a2];
}

BOOL sub_23C04E01C(char a1, char a2)
{
  return dbl_23C059B40[a2] < dbl_23C059B40[a1];
}

double GridSizeClass.maximumWidth.getter(char a1)
{
  return dbl_23C059B40[a1];
}

double GridSizeClass.rawValue.getter(char a1)
{
  return dbl_23C059B40[a1];
}

uint64_t sub_23C04E070()
{
  sub_23C04EACC();
  return sub_23C05456C();
}

uint64_t sub_23C04E098()
{
  sub_23C04EACC();
  return sub_23C054578();
}

uint64_t sub_23C04E0C0()
{
  sub_23C04EA88();
  return sub_23C05456C();
}

uint64_t sub_23C04E0E8()
{
  sub_23C04EA88();
  return sub_23C054578();
}

uint64_t sub_23C04E110()
{
  sub_23C04EA44();
  return sub_23C05456C();
}

uint64_t sub_23C04E138()
{
  sub_23C04EA44();
  return sub_23C054578();
}

uint64_t sub_23C04E160()
{
  sub_23C04EA00();
  return sub_23C05456C();
}

uint64_t sub_23C04E188()
{
  sub_23C04EA00();
  return sub_23C054578();
}

uint64_t sub_23C04E1B0()
{
  sub_23C04E9BC();
  return sub_23C05456C();
}

uint64_t sub_23C04E1D8()
{
  sub_23C04E9BC();
  return sub_23C054578();
}

uint64_t sub_23C04E200()
{
  sub_23C04E978();
  return sub_23C05456C();
}

uint64_t sub_23C04E228()
{
  sub_23C04E978();
  return sub_23C054578();
}

unint64_t sub_23C04E250()
{
  unsigned __int8 *v0;

  return ((unint64_t)*v0 << 40) + 0x317373616C63;
}

uint64_t sub_23C04E26C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C04EB10(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C04E290(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_23C04E29C()
{
  sub_23C04E934();
  return sub_23C05456C();
}

uint64_t sub_23C04E2C4()
{
  sub_23C04E934();
  return sub_23C054578();
}

BOOL sub_23C04E2EC(char *a1, char *a2)
{
  return sub_23C04DF14(*a1, *a2);
}

uint64_t sub_23C04E2F8@<X0>(double *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = _s13FitnessCoreUI13GridSizeClassO8rawValueACSg0B8Graphics7CGFloatV_tcfC_0(*a1);
  *a2 = result;
  return result;
}

double sub_23C04E320@<D0>(double *a1@<X8>)
{
  char *v1;
  double result;

  result = dbl_23C059B40[*v1];
  *a1 = result;
  return result;
}

BOOL sub_23C04E33C(char *a1, char *a2)
{
  return _s13FitnessCoreUI13GridSizeClassO1loiySbAC_ACtFZ_0(*a1, *a2);
}

BOOL sub_23C04E348(char *a1, char *a2)
{
  return sub_23C04DFD4(*a1, *a2);
}

BOOL sub_23C04E354(char *a1, char *a2)
{
  return sub_23C04DFF8(*a1, *a2);
}

BOOL sub_23C04E360(char *a1, char *a2)
{
  return sub_23C04E01C(*a1, *a2);
}

void GridSizeClass.encode(to:)(_QWORD *a1, uint64_t a2)
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
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03D00);
  v25 = *(_QWORD *)(v3 - 8);
  v26 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v24 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03D08);
  v22 = *(_QWORD *)(v5 - 8);
  v23 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v21 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03D10);
  v19 = *(_QWORD *)(v7 - 8);
  v20 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v18 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03D18);
  v16 = *(_QWORD *)(v9 - 8);
  v17 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v15 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03D20);
  MEMORY[0x24BDAC7A8](v14);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03D28);
  MEMORY[0x24BDAC7A8](v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03D30);
  v27 = *(_QWORD *)(v12 - 8);
  v28 = v12;
  MEMORY[0x24BDAC7A8](v12);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C04E934();
  sub_23C054560();
  __asm { BR              X10 }
}

uint64_t sub_23C04E5A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 - 70) = 0;
  sub_23C04EACC();
  v5 = *(_QWORD *)(v4 - 104);
  sub_23C054428();
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 112) + 8))(v1, v5);
}

uint64_t GridSizeClass.init(from:)(_QWORD *a1)
{
  return sub_23C04ED60(a1);
}

uint64_t sub_23C04E78C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23C04ED60(a1);
  if (!v2)
    *a2 = result;
  return result;
}

void sub_23C04E7B4(_QWORD *a1)
{
  unsigned __int8 *v1;

  GridSizeClass.encode(to:)(a1, *v1);
}

uint64_t sub_23C04E7CC()
{
  return sub_23C04DF38();
}

uint64_t sub_23C04E7D4()
{
  return sub_23C04B668();
}

uint64_t sub_23C04E7DC()
{
  return sub_23C04DF88();
}

BOOL _s13FitnessCoreUI13GridSizeClassO1loiySbAC_ACtFZ_0(char a1, char a2)
{
  return dbl_23C059B40[a1] < dbl_23C059B40[a2];
}

uint64_t _s13FitnessCoreUI13GridSizeClassOyAC0B8Graphics7CGFloatVcfC_0(double a1)
{
  int v1;
  unsigned int v2;

  if (a1 <= 374.0)
    return 0;
  if (a1 <= 460.0)
    return 1;
  if (a1 > 1194.0)
    v1 = 5;
  else
    v1 = 4;
  if (a1 > 981.0)
    v2 = v1;
  else
    v2 = 3;
  if (a1 > 726.0)
    return v2;
  else
    return 2;
}

uint64_t _s13FitnessCoreUI13GridSizeClassO8rawValueACSg0B8Graphics7CGFloatV_tcfC_0(double a1)
{
  int v2;
  unsigned int v3;

  if (a1 == 374.0)
    return 0;
  if (a1 == 460.0)
    return 1;
  if (a1 == 726.0)
    return 2;
  if (a1 == 1366.0)
    v2 = 5;
  else
    v2 = 6;
  if (a1 == 1194.0)
    v3 = 4;
  else
    v3 = v2;
  if (a1 == 981.0)
    return 3;
  else
    return v3;
}

unint64_t sub_23C04E934()
{
  unint64_t result;

  result = qword_256B03D38;
  if (!qword_256B03D38)
  {
    result = MEMORY[0x242615EC8](&unk_23C059ABC, &type metadata for GridSizeClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03D38);
  }
  return result;
}

unint64_t sub_23C04E978()
{
  unint64_t result;

  result = qword_256B03D40;
  if (!qword_256B03D40)
  {
    result = MEMORY[0x242615EC8](&unk_23C059A6C, &type metadata for GridSizeClass.Class6CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03D40);
  }
  return result;
}

unint64_t sub_23C04E9BC()
{
  unint64_t result;

  result = qword_256B03D48;
  if (!qword_256B03D48)
  {
    result = MEMORY[0x242615EC8](&unk_23C059A1C, &type metadata for GridSizeClass.Class5CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03D48);
  }
  return result;
}

unint64_t sub_23C04EA00()
{
  unint64_t result;

  result = qword_256B03D50;
  if (!qword_256B03D50)
  {
    result = MEMORY[0x242615EC8](&unk_23C0599CC, &type metadata for GridSizeClass.Class4CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03D50);
  }
  return result;
}

unint64_t sub_23C04EA44()
{
  unint64_t result;

  result = qword_256B03D58;
  if (!qword_256B03D58)
  {
    result = MEMORY[0x242615EC8](&unk_23C05997C, &type metadata for GridSizeClass.Class3CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03D58);
  }
  return result;
}

unint64_t sub_23C04EA88()
{
  unint64_t result;

  result = qword_256B03D60;
  if (!qword_256B03D60)
  {
    result = MEMORY[0x242615EC8](&unk_23C05992C, &type metadata for GridSizeClass.Class2CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03D60);
  }
  return result;
}

unint64_t sub_23C04EACC()
{
  unint64_t result;

  result = qword_256B03D68;
  if (!qword_256B03D68)
  {
    result = MEMORY[0x242615EC8](&unk_23C0598DC, &type metadata for GridSizeClass.Class1CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03D68);
  }
  return result;
}

uint64_t sub_23C04EB10(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x317373616C63 && a2 == 0xE600000000000000;
  if (v2 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x327373616C63 && a2 == 0xE600000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x337373616C63 && a2 == 0xE600000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x347373616C63 && a2 == 0xE600000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x357373616C63 && a2 == 0xE600000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x367373616C63 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_23C054488();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_23C04ED60(_QWORD *a1)
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

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03DF0);
  v27 = *(_QWORD *)(v2 - 8);
  v28 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v41 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03DF8);
  v34 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v40 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03E00);
  v31 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v39 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03E08);
  v32 = *(_QWORD *)(v6 - 8);
  v33 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v38 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03E10);
  v29 = *(_QWORD *)(v8 - 8);
  v30 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v37 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03E18);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256B03E20);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1[3];
  v42 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_23C04E934();
  v19 = v43;
  sub_23C054554();
  if (!v19)
  {
    v43 = v13;
    v25[1] = v11;
    v25[2] = v10;
    v26 = v15;
    v20 = sub_23C054410();
    if (*(_QWORD *)(v20 + 16) == 1)
      __asm { BR              X9 }
    v21 = sub_23C0542CC();
    swift_allocError();
    v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B02DF0);
    *v23 = &type metadata for GridSizeClass;
    sub_23C0543C8();
    sub_23C0542C0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x24BEE26D0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v17, v14);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  return v14;
}

void sub_23C04F258()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v2 - 65) = 5;
  sub_23C04E978();
  sub_23C0543BC();
  if (v0)
  {
    swift_bridgeObjectRelease();
    JUMPOUT(0x23C04F21CLL);
  }
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 224) + 8))(v1, *(_QWORD *)(v2 - 216));
  swift_bridgeObjectRelease();
  JUMPOUT(0x23C04F2C4);
}

unint64_t sub_23C04F304()
{
  unint64_t result;

  result = qword_256B03D70;
  if (!qword_256B03D70)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for GridSizeClass, &type metadata for GridSizeClass);
    atomic_store(result, (unint64_t *)&qword_256B03D70);
  }
  return result;
}

ValueMetadata *type metadata accessor for GridSizeClass()
{
  return &type metadata for GridSizeClass;
}

uint64_t _s13FitnessCoreUI13GridSizeClassOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s13FitnessCoreUI13GridSizeClassOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C04F43C + 4 * byte_23C059421[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23C04F470 + 4 * byte_23C05941C[v4]))();
}

uint64_t sub_23C04F470(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C04F478(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C04F480);
  return result;
}

uint64_t sub_23C04F48C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C04F494);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23C04F498(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C04F4A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GridSizeClass.CodingKeys()
{
  return &type metadata for GridSizeClass.CodingKeys;
}

ValueMetadata *type metadata accessor for GridSizeClass.Class1CodingKeys()
{
  return &type metadata for GridSizeClass.Class1CodingKeys;
}

ValueMetadata *type metadata accessor for GridSizeClass.Class2CodingKeys()
{
  return &type metadata for GridSizeClass.Class2CodingKeys;
}

ValueMetadata *type metadata accessor for GridSizeClass.Class3CodingKeys()
{
  return &type metadata for GridSizeClass.Class3CodingKeys;
}

ValueMetadata *type metadata accessor for GridSizeClass.Class4CodingKeys()
{
  return &type metadata for GridSizeClass.Class4CodingKeys;
}

ValueMetadata *type metadata accessor for GridSizeClass.Class5CodingKeys()
{
  return &type metadata for GridSizeClass.Class5CodingKeys;
}

ValueMetadata *type metadata accessor for GridSizeClass.Class6CodingKeys()
{
  return &type metadata for GridSizeClass.Class6CodingKeys;
}

unint64_t sub_23C04F520()
{
  unint64_t result;

  result = qword_256B03D78;
  if (!qword_256B03D78)
  {
    result = MEMORY[0x242615EC8](&unk_23C0598B4, &type metadata for GridSizeClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03D78);
  }
  return result;
}

unint64_t sub_23C04F568()
{
  unint64_t result;

  result = qword_256B03D80;
  if (!qword_256B03D80)
  {
    result = MEMORY[0x242615EC8](&unk_23C0597D4, &type metadata for GridSizeClass.Class1CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03D80);
  }
  return result;
}

unint64_t sub_23C04F5B0()
{
  unint64_t result;

  result = qword_256B03D88;
  if (!qword_256B03D88)
  {
    result = MEMORY[0x242615EC8](&unk_23C0597FC, &type metadata for GridSizeClass.Class1CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03D88);
  }
  return result;
}

unint64_t sub_23C04F5F8()
{
  unint64_t result;

  result = qword_256B03D90;
  if (!qword_256B03D90)
  {
    result = MEMORY[0x242615EC8](&unk_23C059784, &type metadata for GridSizeClass.Class2CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03D90);
  }
  return result;
}

unint64_t sub_23C04F640()
{
  unint64_t result;

  result = qword_256B03D98;
  if (!qword_256B03D98)
  {
    result = MEMORY[0x242615EC8](&unk_23C0597AC, &type metadata for GridSizeClass.Class2CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03D98);
  }
  return result;
}

unint64_t sub_23C04F688()
{
  unint64_t result;

  result = qword_256B03DA0;
  if (!qword_256B03DA0)
  {
    result = MEMORY[0x242615EC8](&unk_23C059734, &type metadata for GridSizeClass.Class3CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03DA0);
  }
  return result;
}

unint64_t sub_23C04F6D0()
{
  unint64_t result;

  result = qword_256B03DA8;
  if (!qword_256B03DA8)
  {
    result = MEMORY[0x242615EC8](&unk_23C05975C, &type metadata for GridSizeClass.Class3CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03DA8);
  }
  return result;
}

unint64_t sub_23C04F718()
{
  unint64_t result;

  result = qword_256B03DB0;
  if (!qword_256B03DB0)
  {
    result = MEMORY[0x242615EC8](&unk_23C0596E4, &type metadata for GridSizeClass.Class4CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03DB0);
  }
  return result;
}

unint64_t sub_23C04F760()
{
  unint64_t result;

  result = qword_256B03DB8;
  if (!qword_256B03DB8)
  {
    result = MEMORY[0x242615EC8](&unk_23C05970C, &type metadata for GridSizeClass.Class4CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03DB8);
  }
  return result;
}

unint64_t sub_23C04F7A8()
{
  unint64_t result;

  result = qword_256B03DC0;
  if (!qword_256B03DC0)
  {
    result = MEMORY[0x242615EC8](&unk_23C059694, &type metadata for GridSizeClass.Class5CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03DC0);
  }
  return result;
}

unint64_t sub_23C04F7F0()
{
  unint64_t result;

  result = qword_256B03DC8;
  if (!qword_256B03DC8)
  {
    result = MEMORY[0x242615EC8](&unk_23C0596BC, &type metadata for GridSizeClass.Class5CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03DC8);
  }
  return result;
}

unint64_t sub_23C04F838()
{
  unint64_t result;

  result = qword_256B03DD0;
  if (!qword_256B03DD0)
  {
    result = MEMORY[0x242615EC8](&unk_23C059644, &type metadata for GridSizeClass.Class6CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03DD0);
  }
  return result;
}

unint64_t sub_23C04F880()
{
  unint64_t result;

  result = qword_256B03DD8;
  if (!qword_256B03DD8)
  {
    result = MEMORY[0x242615EC8](&unk_23C05966C, &type metadata for GridSizeClass.Class6CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03DD8);
  }
  return result;
}

unint64_t sub_23C04F8C8()
{
  unint64_t result;

  result = qword_256B03DE0;
  if (!qword_256B03DE0)
  {
    result = MEMORY[0x242615EC8](&unk_23C059824, &type metadata for GridSizeClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03DE0);
  }
  return result;
}

unint64_t sub_23C04F910()
{
  unint64_t result;

  result = qword_256B03DE8;
  if (!qword_256B03DE8)
  {
    result = MEMORY[0x242615EC8](&unk_23C05984C, &type metadata for GridSizeClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03DE8);
  }
  return result;
}

uint64_t sub_23C04F954(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_23C04F980(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_animationAnchor);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

void *sub_23C04F9E0()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_animationAnchor);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_23C04FA2C(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_animationAnchor);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_23C04FA7C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_23C04FAC4()
{
  return swift_bridgeObjectRetain();
}

id FloatingView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void FloatingView.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  id v10;
  char *v11;
  char *v12;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  char *v22;
  id v23;
  id v24;
  double v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  double *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  char *v65;
  id v66;
  id v67;
  objc_super v68;

  *(_QWORD *)&v4[OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_animationAnchor] = 0;
  v9 = OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_backgroundVisuallEffectView;
  v10 = objc_allocWithZone(MEMORY[0x24BEBDB38]);
  v11 = v4;
  *(_QWORD *)&v4[v9] = objc_msgSend(v10, sel_init);
  v12 = &v11[OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_contentInsets];
  __asm { FMOV            V0.2D, #4.0 }
  *(_OWORD *)v12 = _Q0;
  *((_OWORD *)v12 + 1) = _Q0;
  v18 = OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_contentView;
  type metadata accessor for FloatingContentView();
  *(_QWORD *)&v11[v18] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v19 = OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_selectionGestureRecognizer;
  type metadata accessor for ContinuousSelectionGestureRecognizer();
  *(_QWORD *)&v11[v19] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v11[OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_selectionShouldFollowGesture] = 0;

  v68.receiver = v11;
  v68.super_class = (Class)type metadata accessor for FloatingView();
  v20 = objc_msgSendSuper2(&v68, sel_initWithFrame_, a1, a2, a3, a4);
  v21 = (void *)objc_opt_self();
  v22 = (char *)v20;
  v23 = objc_msgSend(v21, sel_clearColor);
  objc_msgSend(v22, sel_setBackgroundColor_, v23);

  v24 = objc_msgSend(v22, sel_layer);
  v25 = *MEMORY[0x24BDE5CD0];
  objc_msgSend(v24, sel_setCornerRadius_, *MEMORY[0x24BDE5CD0]);

  __swift_instantiateConcreteTypeFromMangledName(&qword_256B03E60);
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_23C059B70;
  *(_QWORD *)(v26 + 32) = objc_msgSend((id)objc_opt_self(), sel_effectWithStyle_, 8);
  v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.75, 0.75, 0.1, 0.06);
  v28 = (void *)objc_opt_self();
  v29 = objc_msgSend(v28, sel_effectCompositingColor_, v27);

  if (v29)
  {
    *(_QWORD *)(v26 + 40) = v29;
    sub_23C054128();
    sub_23C03B7B4(0, &qword_256B03E68);
    v30 = (void *)sub_23C054110();
    swift_bridgeObjectRelease();
    v67 = objc_msgSend(v28, sel_effectCombiningEffects_, v30);

    v31 = OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_backgroundVisuallEffectView;
    v32 = *(void **)&v22[OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_backgroundVisuallEffectView];
    objc_msgSend(v32, sel_setEffect_, v67);
    objc_msgSend(v32, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v33 = objc_msgSend(v32, sel_layer);
    objc_msgSend(v33, sel_setCornerRadius_, v25);

    v34 = *(void **)&v22[v31];
    objc_msgSend(v34, sel_setClipsToBounds_, 1);
    objc_msgSend(v22, sel_addSubview_, v34);
    v35 = OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_contentView;
    v36 = *(char **)&v22[OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_contentView];
    v37 = &v36[OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_delegate];
    swift_beginAccess();
    *((_QWORD *)v37 + 1) = &protocol witness table for FloatingView;
    swift_unknownObjectWeakAssign();
    objc_msgSend(v36, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v22, sel_addSubview_, v36);
    v66 = (id)objc_opt_self();
    v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_23C059B80;
    v39 = objc_msgSend(v34, sel_leadingAnchor);
    v40 = objc_msgSend(v22, sel_leadingAnchor);
    v41 = objc_msgSend(v39, sel_constraintEqualToAnchor_, v40);

    *(_QWORD *)(v38 + 32) = v41;
    v42 = objc_msgSend(*(id *)&v22[v31], sel_trailingAnchor);
    v43 = objc_msgSend(v22, sel_trailingAnchor);
    v44 = objc_msgSend(v42, sel_constraintEqualToAnchor_, v43);

    *(_QWORD *)(v38 + 40) = v44;
    v45 = objc_msgSend(*(id *)&v22[v31], sel_topAnchor);
    v46 = objc_msgSend(v22, (SEL)&stru_250CF76E0.imp + 4);
    v47 = objc_msgSend(v45, sel_constraintEqualToAnchor_, v46);

    *(_QWORD *)(v38 + 48) = v47;
    v48 = objc_msgSend(*(id *)&v22[v31], sel_bottomAnchor);
    v49 = objc_msgSend(v22, (SEL)&TabItemCell.weak_ivar_lyt + 5);
    v50 = objc_msgSend(v48, sel_constraintEqualToAnchor_, v49);

    *(_QWORD *)(v38 + 56) = v50;
    v51 = objc_msgSend(*(id *)&v22[v35], sel_leadingAnchor);
    v52 = objc_msgSend(v22, sel_leadingAnchor);
    v53 = (double *)&v22[OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_contentInsets];
    v54 = objc_msgSend(v51, sel_constraintEqualToAnchor_constant_, v52, *(double *)&v22[OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_contentInsets + 8]);

    *(_QWORD *)(v38 + 64) = v54;
    v55 = objc_msgSend(*(id *)&v22[v35], sel_trailingAnchor);
    v56 = objc_msgSend(v22, sel_trailingAnchor);
    v57 = objc_msgSend(v55, sel_constraintEqualToAnchor_constant_, v56, -v53[3]);

    *(_QWORD *)(v38 + 72) = v57;
    v58 = objc_msgSend(*(id *)&v22[v35], sel_topAnchor);
    v59 = objc_msgSend(v22, sel_topAnchor);
    v60 = objc_msgSend(v58, sel_constraintEqualToAnchor_constant_, v59, *v53);

    *(_QWORD *)(v38 + 80) = v60;
    v61 = objc_msgSend(*(id *)&v22[v35], sel_bottomAnchor);
    v62 = objc_msgSend(v22, sel_bottomAnchor);
    v63 = objc_msgSend(v61, sel_constraintEqualToAnchor_constant_, v62, -v53[2]);

    *(_QWORD *)(v38 + 88) = v63;
    sub_23C054128();
    sub_23C03B7B4(0, (unint64_t *)&qword_256B03E70);
    v64 = (void *)sub_23C054110();
    swift_bridgeObjectRelease();
    objc_msgSend(v66, sel_activateConstraints_, v64);

    v65 = *(char **)&v22[OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_selectionGestureRecognizer];
    objc_msgSend(v65, sel_addTarget_action_, v22, sel_handleSelectionGesture_);
    objc_msgSend(v65, sel_setCancelsTouchesInView_, 0);
    objc_msgSend(v65, sel_setDelegate_, v22);
    *(_QWORD *)&v65[OBJC_IVAR____TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer_dragCoordinator + 8] = &off_250CF68C0;
    swift_unknownObjectWeakAssign();
    objc_msgSend(v22, sel_addGestureRecognizer_, v65);

  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for FloatingView()
{
  return objc_opt_self();
}

id FloatingView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

uint64_t sub_23C0503E8(uint64_t a1, uint64_t a2, char a3, char a4)
{
  char v5;

  v5 = 0;
  return sub_23C036C8C(a1, a2, a3 & 1, &v5, a4);
}

void sub_23C050428(void *a1)
{
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  char v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BYTE *v18;
  _QWORD aBlock[6];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256B03F00);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)&v1[OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_contentView];
  sub_23C037704(a1, (uint64_t)v6);
  v8 = sub_23C053D20();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) == 1)
  {
    sub_23C03F8CC((uint64_t)v6);
    v10 = *(_QWORD *)(v7 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_highlightedIndex);
    v11 = *(_BYTE *)(v7 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_highlightedIndex + 8);
  }
  else
  {
    v10 = sub_23C053D08();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
    v11 = 0;
  }
  v12 = objc_msgSend(a1, sel_state);
  if (v12 == (id)3)
  {
    if ((v11 & 1) != 0)
    {
      v10 = 0;
LABEL_13:
      v13 = 1;
LABEL_14:
      sub_23C037C08(v10, v13, 0, 1);
      return;
    }
    sub_23C037E04(v10, 1);
  }
  else
  {
    v13 = v11;
    if (v12 != (id)2)
    {
      if (v12 != (id)1)
      {
        v10 = 0;
        v14 = 1;
        goto LABEL_12;
      }
      if ((v11 & 1) != 0)
      {
        v14 = 0;
LABEL_12:
        v2[OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_selectionShouldFollowGesture] = v14;
        goto LABEL_13;
      }
      v13 = 0;
      v2[OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_selectionShouldFollowGesture] = (v10 == *(_QWORD *)(v7 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectedIndex)) & ~*(_BYTE *)(v7 + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectedIndex + 8);
    }
    if (v2[OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_selectionShouldFollowGesture] != 1 || (v13 & 1) != 0)
      goto LABEL_14;
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v2;
    *(_QWORD *)(v15 + 24) = v10;
    *(_QWORD *)(v15 + 32) = v10;
    *(_BYTE *)(v15 + 40) = v11;
    v16 = (void *)objc_opt_self();
    aBlock[4] = sub_23C050AE0;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23C04F954;
    aBlock[3] = &block_descriptor_1;
    v17 = _Block_copy(aBlock);
    v18 = v2;
    swift_retain();
    swift_release();
    objc_msgSend(v16, sel__animateUsingSpringWithDampingRatio_response_tracking_dampingRatioSmoothing_responseSmoothing_targetSmoothing_projectionDeceleration_animations_completion_, 0, v17, 0, 0.9, 0.3, 0.08, 0.08, 0.08, 0.0);
    _Block_release(v17);
    swift_release();
  }
}

id FloatingView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FloatingView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void __swiftcall FloatingView.animationAnchorView()(UIView_optional *__return_ptr retstr)
{
  char *v1;
  void **v2;
  void *v3;
  id v4;

  v2 = (void **)&v1[OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_animationAnchor];
  swift_beginAccess();
  v3 = *v2;
  if (!*v2)
    objc_msgSend(v1, sel_superview);
  v4 = v3;
}

id sub_23C050838()
{
  char *v0;
  void **v1;
  void *v2;
  id v3;
  id v4;

  v1 = (void **)&v0[OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_animationAnchor];
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  if (!v2)
    v3 = objc_msgSend(v0, sel_superview);
  v4 = v2;
  return v3;
}

Swift::Bool __swiftcall FloatingView.gestureRecognizerShouldBegin(_:)(UIGestureRecognizer *a1)
{
  return 1;
}

Swift::Bool __swiftcall FloatingView.gestureRecognizer(_:shouldRecognizeSimultaneouslyWith:)(UIGestureRecognizer *_, UIGestureRecognizer *shouldRecognizeSimultaneouslyWith)
{
  return 0;
}

void _s13FitnessCoreUI12FloatingViewC5coderACSgSo7NSCoderC_tcfc_0()
{
  _BYTE *v0;
  uint64_t v1;
  _OWORD *v2;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)&v0[OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_animationAnchor] = 0;
  v1 = OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_backgroundVisuallEffectView;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB38]), sel_init);
  v2 = &v0[OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_contentInsets];
  __asm { FMOV            V0.2D, #4.0 }
  *v2 = _Q0;
  v2[1] = _Q0;
  v8 = OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_contentView;
  type metadata accessor for FloatingContentView();
  *(_QWORD *)&v0[v8] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v9 = OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_selectionGestureRecognizer;
  type metadata accessor for ContinuousSelectionGestureRecognizer();
  *(_QWORD *)&v0[v9] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v0[OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_selectionShouldFollowGesture] = 0;

  sub_23C05435C();
  __break(1u);
}

id sub_23C0509CC@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_animationAnchor);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t method lookup function for FloatingView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FloatingView.animationAnchor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of FloatingView.animationAnchor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of FloatingView.animationAnchor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of FloatingView.itemDescriptors.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of FloatingView.updateItemDescriptors(_:selectedIndex:animated:)(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v3) + 0xC8))(a1, a2, a3 & 1);
}

uint64_t sub_23C050ABC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_23C050AE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_BYTE *)(v0 + 40);
  sub_23C037894(v1);
  sub_23C037C08(v1, 0, v2, v3);
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

uint64_t static FloatingError.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_23C050B54()
{
  return 0x4964696C61766E69;
}

uint64_t sub_23C050B78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x4964696C61766E69 && a2 == 0xEF657A69536D6574)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23C054488();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23C050C30()
{
  sub_23C050E1C();
  return sub_23C05456C();
}

uint64_t sub_23C050C58()
{
  sub_23C050E1C();
  return sub_23C054578();
}

uint64_t sub_23C050C80()
{
  sub_23C050E60();
  return sub_23C05456C();
}

uint64_t sub_23C050CA8()
{
  sub_23C050E60();
  return sub_23C054578();
}

uint64_t FloatingError.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03F10);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03F18);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C050E1C();
  sub_23C054560();
  sub_23C050E60();
  sub_23C054428();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_23C050E1C()
{
  unint64_t result;

  result = qword_256B03F20;
  if (!qword_256B03F20)
  {
    result = MEMORY[0x242615EC8](&unk_23C059EA4, &type metadata for FloatingError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03F20);
  }
  return result;
}

unint64_t sub_23C050E60()
{
  unint64_t result;

  result = qword_256B03F28;
  if (!qword_256B03F28)
  {
    result = MEMORY[0x242615EC8](&unk_23C059E54, &type metadata for FloatingError.InvalidItemSizeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03F28);
  }
  return result;
}

uint64_t FloatingError.init(from:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03F30);
  v2 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03F38);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C050E1C();
  v8 = v23;
  sub_23C054554();
  if (v8)
    goto LABEL_7;
  v20 = a1;
  v23 = v5;
  v10 = v21;
  v9 = v22;
  if (*(_QWORD *)(sub_23C054410() + 16) != 1)
  {
    v14 = sub_23C0542CC();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B02DF0);
    *v16 = &type metadata for FloatingError;
    sub_23C0543C8();
    sub_23C0542C0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x24BEE26D0], v14);
    swift_willThrow();
    v17 = v23;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v9);
    a1 = v20;
LABEL_7:
    v13 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v13);
  }
  sub_23C050E60();
  v11 = v4;
  sub_23C0543BC();
  v12 = v23;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v10);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
  v13 = (uint64_t)v20;
  return __swift_destroy_boxed_opaque_existential_1(v13);
}

uint64_t sub_23C051100(_QWORD *a1)
{
  return FloatingError.init(from:)(a1);
}

uint64_t sub_23C051114(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03F10);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03F18);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C050E1C();
  sub_23C054560();
  sub_23C050E60();
  sub_23C054428();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t FloatingError.hash(into:)()
{
  return sub_23C054518();
}

uint64_t FloatingError.hashValue.getter()
{
  sub_23C05450C();
  sub_23C054518();
  return sub_23C054548();
}

unint64_t sub_23C0512B8()
{
  unint64_t result;

  result = qword_256B03F40;
  if (!qword_256B03F40)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for FloatingError, &type metadata for FloatingError);
    atomic_store(result, (unint64_t *)&qword_256B03F40);
  }
  return result;
}

ValueMetadata *type metadata accessor for FloatingError()
{
  return &type metadata for FloatingError;
}

uint64_t _s13FitnessCoreUI13FloatingErrorOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C051350 + 4 * byte_23C059BF0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C051370 + 4 * byte_23C059BF5[v4]))();
}

_BYTE *sub_23C051350(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C051370(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C051378(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C051380(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C051388(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C051390(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for FloatingError.CodingKeys()
{
  return &type metadata for FloatingError.CodingKeys;
}

ValueMetadata *type metadata accessor for FloatingError.InvalidItemSizeCodingKeys()
{
  return &type metadata for FloatingError.InvalidItemSizeCodingKeys;
}

unint64_t sub_23C0513C0()
{
  unint64_t result;

  result = qword_256B03F48;
  if (!qword_256B03F48)
  {
    result = MEMORY[0x242615EC8](&unk_23C059E2C, &type metadata for FloatingError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03F48);
  }
  return result;
}

unint64_t sub_23C051408()
{
  unint64_t result;

  result = qword_256B03F50;
  if (!qword_256B03F50)
  {
    result = MEMORY[0x242615EC8](&unk_23C059D4C, &type metadata for FloatingError.InvalidItemSizeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03F50);
  }
  return result;
}

unint64_t sub_23C051450()
{
  unint64_t result;

  result = qword_256B03F58;
  if (!qword_256B03F58)
  {
    result = MEMORY[0x242615EC8](&unk_23C059D74, &type metadata for FloatingError.InvalidItemSizeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03F58);
  }
  return result;
}

unint64_t sub_23C051498()
{
  unint64_t result;

  result = qword_256B03F60;
  if (!qword_256B03F60)
  {
    result = MEMORY[0x242615EC8](&unk_23C059D9C, &type metadata for FloatingError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03F60);
  }
  return result;
}

unint64_t sub_23C0514E0()
{
  unint64_t result;

  result = qword_256B03F68;
  if (!qword_256B03F68)
  {
    result = MEMORY[0x242615EC8](&unk_23C059DC4, &type metadata for FloatingError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03F68);
  }
  return result;
}

BOOL static GridKind.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C051538()
{
  sub_23C051D2C();
  return sub_23C05456C();
}

uint64_t sub_23C051560()
{
  sub_23C051D2C();
  return sub_23C054578();
}

uint64_t sub_23C051588()
{
  sub_23C051CE8();
  return sub_23C05456C();
}

uint64_t sub_23C0515B0()
{
  sub_23C051CE8();
  return sub_23C054578();
}

uint64_t sub_23C0515D8()
{
  sub_23C051CA4();
  return sub_23C05456C();
}

uint64_t sub_23C051600()
{
  sub_23C051CA4();
  return sub_23C054578();
}

uint64_t sub_23C051628()
{
  unsigned __int8 *v0;

  return *v0 + 97;
}

uint64_t sub_23C051638@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C0529F8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C05165C()
{
  sub_23C051B94();
  return sub_23C05456C();
}

uint64_t sub_23C051684()
{
  sub_23C051B94();
  return sub_23C054578();
}

uint64_t sub_23C0516AC()
{
  sub_23C051C60();
  return sub_23C05456C();
}

uint64_t sub_23C0516D4()
{
  sub_23C051C60();
  return sub_23C054578();
}

uint64_t sub_23C0516FC()
{
  sub_23C051C1C();
  return sub_23C05456C();
}

uint64_t sub_23C051724()
{
  sub_23C051C1C();
  return sub_23C054578();
}

uint64_t sub_23C05174C()
{
  sub_23C051BD8();
  return sub_23C05456C();
}

uint64_t sub_23C051774()
{
  sub_23C051BD8();
  return sub_23C054578();
}

void GridKind.encode(to:)(_QWORD *a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[17];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03F70);
  v15[13] = *(_QWORD *)(v3 - 8);
  v15[14] = v3;
  MEMORY[0x24BDAC7A8](v3);
  v15[12] = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03F78);
  v15[10] = *(_QWORD *)(v5 - 8);
  v15[11] = v5;
  MEMORY[0x24BDAC7A8](v5);
  v15[9] = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03F80);
  v15[7] = *(_QWORD *)(v7 - 8);
  v15[8] = v7;
  MEMORY[0x24BDAC7A8](v7);
  v15[6] = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03F88);
  v15[4] = *(_QWORD *)(v9 - 8);
  v15[5] = v9;
  MEMORY[0x24BDAC7A8](v9);
  v15[3] = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03F90);
  v15[1] = *(_QWORD *)(v11 - 8);
  v15[2] = v11;
  MEMORY[0x24BDAC7A8](v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03F98);
  MEMORY[0x24BDAC7A8](v12);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03FA0);
  v15[15] = *(_QWORD *)(v13 - 8);
  v15[16] = v13;
  MEMORY[0x24BDAC7A8](v13);
  v14 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C051B94();
  sub_23C054560();
  __asm { BR              X9 }
}

uint64_t sub_23C0519D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 - 70) = 0;
  sub_23C051D2C();
  v5 = *(_QWORD *)(v4 - 96);
  sub_23C054428();
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 104) + 8))(v1, v5);
}

unint64_t sub_23C051B94()
{
  unint64_t result;

  result = qword_256B03FA8;
  if (!qword_256B03FA8)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A4B8, &type metadata for GridKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03FA8);
  }
  return result;
}

unint64_t sub_23C051BD8()
{
  unint64_t result;

  result = qword_256B03FB0;
  if (!qword_256B03FB0)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A468, &type metadata for GridKind.FCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03FB0);
  }
  return result;
}

unint64_t sub_23C051C1C()
{
  unint64_t result;

  result = qword_256B03FB8;
  if (!qword_256B03FB8)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A418, &type metadata for GridKind.ECodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03FB8);
  }
  return result;
}

unint64_t sub_23C051C60()
{
  unint64_t result;

  result = qword_256B03FC0;
  if (!qword_256B03FC0)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A3C8, &type metadata for GridKind.DCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03FC0);
  }
  return result;
}

unint64_t sub_23C051CA4()
{
  unint64_t result;

  result = qword_256B03FC8;
  if (!qword_256B03FC8)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A378, &type metadata for GridKind.CCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03FC8);
  }
  return result;
}

unint64_t sub_23C051CE8()
{
  unint64_t result;

  result = qword_256B03FD0;
  if (!qword_256B03FD0)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A328, &type metadata for GridKind.BCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03FD0);
  }
  return result;
}

unint64_t sub_23C051D2C()
{
  unint64_t result;

  result = qword_256B03FD8;
  if (!qword_256B03FD8)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A2D8, &type metadata for GridKind.ACodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B03FD8);
  }
  return result;
}

uint64_t GridKind.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD v29[4];
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
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;

  v46 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03FE0);
  v31 = *(_QWORD *)(v3 - 8);
  v32 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v45 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03FE8);
  v37 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v43 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03FF0);
  v38 = *(_QWORD *)(v6 - 8);
  v39 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v42 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B03FF8);
  v35 = *(_QWORD *)(v8 - 8);
  v36 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v41 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B04000);
  v33 = *(_QWORD *)(v10 - 8);
  v34 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v40 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B04008);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B04010);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = a1[3];
  v47 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_23C051B94();
  v21 = v48;
  sub_23C054554();
  if (!v21)
  {
    v29[3] = v15;
    v29[1] = v13;
    v29[2] = v12;
    v30 = v17;
    v48 = v16;
    v22 = v19;
    v23 = sub_23C054410();
    if (*(_QWORD *)(v23 + 16) == 1)
    {
      v29[0] = v23;
      __asm { BR              X9 }
    }
    v24 = sub_23C0542CC();
    swift_allocError();
    v26 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B02DF0);
    *v26 = &type metadata for GridKind;
    v27 = v48;
    sub_23C0543C8();
    sub_23C0542C0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v26, *MEMORY[0x24BEE26D0], v24);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v22, v27);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
}

void sub_23C052158()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v6 = v0;
  *(_BYTE *)(v5 - 69) = 1;
  sub_23C051CE8();
  v7 = *(_QWORD *)(v5 - 160);
  v8 = *(_QWORD *)(v5 - 96);
  sub_23C0543BC();
  if (!v2)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v5 - 216) + 8))(v7, *(_QWORD *)(v5 - 208));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v8);
    *v3 = v6;
    JUMPOUT(0x23C052130);
  }
  swift_bridgeObjectRelease();
  JUMPOUT(0x23C052128);
}

uint64_t sub_23C0523A4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return GridKind.init(from:)(a1, a2);
}

void sub_23C0523B8(_QWORD *a1)
{
  GridKind.encode(to:)(a1);
}

uint64_t GridKind.hash(into:)()
{
  return sub_23C054518();
}

uint64_t GridKind.hashValue.getter()
{
  sub_23C05450C();
  sub_23C054518();
  return sub_23C054548();
}

unint64_t sub_23C05243C()
{
  unint64_t result;

  result = qword_256B04018;
  if (!qword_256B04018)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for GridKind, &type metadata for GridKind);
    atomic_store(result, (unint64_t *)&qword_256B04018);
  }
  return result;
}

ValueMetadata *type metadata accessor for GridKind()
{
  return &type metadata for GridKind;
}

uint64_t _s13FitnessCoreUI8GridKindOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C0524E0 + 4 * byte_23C059F05[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23C052514 + 4 * byte_23C059F00[v4]))();
}

uint64_t sub_23C052514(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C05251C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C052524);
  return result;
}

uint64_t sub_23C052530(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C052538);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23C05253C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C052544(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GridKind.CodingKeys()
{
  return &type metadata for GridKind.CodingKeys;
}

ValueMetadata *type metadata accessor for GridKind.ACodingKeys()
{
  return &type metadata for GridKind.ACodingKeys;
}

ValueMetadata *type metadata accessor for GridKind.BCodingKeys()
{
  return &type metadata for GridKind.BCodingKeys;
}

ValueMetadata *type metadata accessor for GridKind.CCodingKeys()
{
  return &type metadata for GridKind.CCodingKeys;
}

ValueMetadata *type metadata accessor for GridKind.DCodingKeys()
{
  return &type metadata for GridKind.DCodingKeys;
}

ValueMetadata *type metadata accessor for GridKind.ECodingKeys()
{
  return &type metadata for GridKind.ECodingKeys;
}

ValueMetadata *type metadata accessor for GridKind.FCodingKeys()
{
  return &type metadata for GridKind.FCodingKeys;
}

unint64_t sub_23C0525C4()
{
  unint64_t result;

  result = qword_256B04020;
  if (!qword_256B04020)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A2B0, &type metadata for GridKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B04020);
  }
  return result;
}

unint64_t sub_23C05260C()
{
  unint64_t result;

  result = qword_256B04028;
  if (!qword_256B04028)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A1D0, &type metadata for GridKind.ACodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B04028);
  }
  return result;
}

unint64_t sub_23C052654()
{
  unint64_t result;

  result = qword_256B04030;
  if (!qword_256B04030)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A1F8, &type metadata for GridKind.ACodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B04030);
  }
  return result;
}

unint64_t sub_23C05269C()
{
  unint64_t result;

  result = qword_256B04038;
  if (!qword_256B04038)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A180, &type metadata for GridKind.BCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B04038);
  }
  return result;
}

unint64_t sub_23C0526E4()
{
  unint64_t result;

  result = qword_256B04040;
  if (!qword_256B04040)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A1A8, &type metadata for GridKind.BCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B04040);
  }
  return result;
}

unint64_t sub_23C05272C()
{
  unint64_t result;

  result = qword_256B04048;
  if (!qword_256B04048)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A130, &type metadata for GridKind.CCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B04048);
  }
  return result;
}

unint64_t sub_23C052774()
{
  unint64_t result;

  result = qword_256B04050;
  if (!qword_256B04050)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A158, &type metadata for GridKind.CCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B04050);
  }
  return result;
}

unint64_t sub_23C0527BC()
{
  unint64_t result;

  result = qword_256B04058;
  if (!qword_256B04058)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A0E0, &type metadata for GridKind.DCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B04058);
  }
  return result;
}

unint64_t sub_23C052804()
{
  unint64_t result;

  result = qword_256B04060;
  if (!qword_256B04060)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A108, &type metadata for GridKind.DCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B04060);
  }
  return result;
}

unint64_t sub_23C05284C()
{
  unint64_t result;

  result = qword_256B04068;
  if (!qword_256B04068)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A090, &type metadata for GridKind.ECodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B04068);
  }
  return result;
}

unint64_t sub_23C052894()
{
  unint64_t result;

  result = qword_256B04070;
  if (!qword_256B04070)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A0B8, &type metadata for GridKind.ECodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B04070);
  }
  return result;
}

unint64_t sub_23C0528DC()
{
  unint64_t result;

  result = qword_256B04078;
  if (!qword_256B04078)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A040, &type metadata for GridKind.FCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B04078);
  }
  return result;
}

unint64_t sub_23C052924()
{
  unint64_t result;

  result = qword_256B04080;
  if (!qword_256B04080)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A068, &type metadata for GridKind.FCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B04080);
  }
  return result;
}

unint64_t sub_23C05296C()
{
  unint64_t result;

  result = qword_256B04088;
  if (!qword_256B04088)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A220, &type metadata for GridKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B04088);
  }
  return result;
}

unint64_t sub_23C0529B4()
{
  unint64_t result;

  result = qword_256B04090;
  if (!qword_256B04090)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A248, &type metadata for GridKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B04090);
  }
  return result;
}

uint64_t sub_23C0529F8(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 97 && a2 == 0xE100000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 98 && a2 == 0xE100000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 99 && a2 == 0xE100000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 100 && a2 == 0xE100000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 101 && a2 == 0xE100000000000000 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 102 && a2 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v5 = sub_23C054488();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

FitnessCoreUI::GridContext __swiftcall GridContext.init(axis:containerSize:supportsOrthogonalScrolling:)(FitnessCoreUI::GridAxis axis, CGSize containerSize, Swift::Bool supportsOrthogonalScrolling)
{
  uint64_t v3;
  FitnessCoreUI::GridContext result;

  *(_BYTE *)v3 = *(_BYTE *)axis;
  *(CGFloat *)(v3 + 8) = containerSize.width;
  *(CGFloat *)(v3 + 16) = containerSize.height;
  *(_BYTE *)(v3 + 24) = supportsOrthogonalScrolling;
  result.containerSize.height = containerSize.height;
  result.containerSize.width = containerSize.width;
  result.supportsOrthogonalScrolling = supportsOrthogonalScrolling;
  result.axis = axis;
  return result;
}

uint64_t GridContext.sizeClass.getter()
{
  uint64_t v0;

  return _s13FitnessCoreUI13GridSizeClassOyAC0B8Graphics7CGFloatVcfC_0(*(double *)(v0 + 8));
}

uint64_t sub_23C052BF0()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0x656E6961746E6F63;
  if (*v0 != 1)
    v1 = 0xD00000000000001BLL;
  if (*v0)
    return v1;
  else
    return 1936291937;
}

uint64_t sub_23C052C54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C053620(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C052C78()
{
  sub_23C0532B8();
  return sub_23C05456C();
}

uint64_t sub_23C052CA0()
{
  sub_23C0532B8();
  return sub_23C054578();
}

uint64_t GridContext.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];
  int v13;
  char v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B04098);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = *((_QWORD *)v1 + 1);
  v10 = *((_QWORD *)v1 + 2);
  v13 = v1[24];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C0532B8();
  sub_23C054560();
  LOBYTE(v12[0]) = v8;
  v14 = 0;
  sub_23C0532FC();
  sub_23C054464();
  if (!v2)
  {
    v12[0] = v9;
    v12[1] = v10;
    v14 = 1;
    type metadata accessor for CGSize(0);
    sub_23C048D8C(&qword_256B03810, MEMORY[0x24BDBD848]);
    sub_23C054464();
    LOBYTE(v12[0]) = 2;
    sub_23C05444C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t GridContext.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _QWORD v14[2];
  char v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B040B0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C0532B8();
  sub_23C054554();
  if (!v2)
  {
    v15 = 0;
    sub_23C053340();
    sub_23C054404();
    v9 = v14[0];
    type metadata accessor for CGSize(0);
    v15 = 1;
    sub_23C048D8C(&qword_256B03828, MEMORY[0x24BDBD860]);
    sub_23C054404();
    v11 = v14[0];
    v12 = v14[1];
    LOBYTE(v14[0]) = 2;
    v13 = sub_23C0543EC();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_BYTE *)a2 = v9;
    *(_QWORD *)(a2 + 8) = v11;
    *(_QWORD *)(a2 + 16) = v12;
    *(_BYTE *)(a2 + 24) = v13 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23C053034@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return GridContext.init(from:)(a1, a2);
}

uint64_t sub_23C053048(_QWORD *a1)
{
  return GridContext.encode(to:)(a1);
}

uint64_t GridContext.hash(into:)()
{
  sub_23C054518();
  sub_23C02F0C8();
  return sub_23C054524();
}

uint64_t GridContext.hashValue.getter()
{
  sub_23C05450C();
  sub_23C054518();
  sub_23C02F0C8();
  sub_23C054524();
  return sub_23C054548();
}

uint64_t sub_23C053130()
{
  sub_23C05450C();
  sub_23C054518();
  sub_23C02F0C8();
  sub_23C054524();
  return sub_23C054548();
}

uint64_t sub_23C0531A8()
{
  sub_23C054518();
  sub_23C02F0C8();
  return sub_23C054524();
}

uint64_t sub_23C053200()
{
  sub_23C05450C();
  sub_23C054518();
  sub_23C02F0C8();
  sub_23C054524();
  return sub_23C054548();
}

uint64_t _s13FitnessCoreUI11GridContextV2eeoiySbAC_ACtFZ_0(double *a1, double *a2)
{
  char v2;

  v2 = 0;
  if (((*(unsigned __int8 *)a1 ^ *(unsigned __int8 *)a2) & 1) == 0 && a1[1] == a2[1] && a1[2] == a2[2])
    v2 = *((_BYTE *)a2 + 24) ^ *((_BYTE *)a1 + 24) ^ 1;
  return v2 & 1;
}

unint64_t sub_23C0532B8()
{
  unint64_t result;

  result = qword_256B040A0;
  if (!qword_256B040A0)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A6A4, &type metadata for GridContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B040A0);
  }
  return result;
}

unint64_t sub_23C0532FC()
{
  unint64_t result;

  result = qword_256B040A8;
  if (!qword_256B040A8)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for GridAxis, &type metadata for GridAxis);
    atomic_store(result, (unint64_t *)&qword_256B040A8);
  }
  return result;
}

unint64_t sub_23C053340()
{
  unint64_t result;

  result = qword_256B040B8;
  if (!qword_256B040B8)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for GridAxis, &type metadata for GridAxis);
    atomic_store(result, (unint64_t *)&qword_256B040B8);
  }
  return result;
}

unint64_t sub_23C053388()
{
  unint64_t result;

  result = qword_256B040C0;
  if (!qword_256B040C0)
  {
    result = MEMORY[0x242615EC8](&protocol conformance descriptor for GridContext, &type metadata for GridContext);
    atomic_store(result, (unint64_t *)&qword_256B040C0);
  }
  return result;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for GridContext(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[25])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for GridContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for GridContext()
{
  return &type metadata for GridContext;
}

uint64_t storeEnumTagSinglePayload for GridContext.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C0534C8 + 4 * byte_23C05A50D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C0534FC + 4 * byte_23C05A508[v4]))();
}

uint64_t sub_23C0534FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C053504(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C05350CLL);
  return result;
}

uint64_t sub_23C053518(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C053520);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C053524(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C05352C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GridContext.CodingKeys()
{
  return &type metadata for GridContext.CodingKeys;
}

unint64_t sub_23C05354C()
{
  unint64_t result;

  result = qword_256B040C8;
  if (!qword_256B040C8)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A67C, &type metadata for GridContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B040C8);
  }
  return result;
}

unint64_t sub_23C053594()
{
  unint64_t result;

  result = qword_256B040D0;
  if (!qword_256B040D0)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A5EC, &type metadata for GridContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B040D0);
  }
  return result;
}

unint64_t sub_23C0535DC()
{
  unint64_t result;

  result = qword_256B040D8;
  if (!qword_256B040D8)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A614, &type metadata for GridContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B040D8);
  }
  return result;
}

uint64_t sub_23C053620(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1936291937 && a2 == 0xE400000000000000;
  if (v2 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656E6961746E6F63 && a2 == 0xED0000657A695372 || (sub_23C054488() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x800000023C05AFB0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C054488();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t View.onLoad(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;

  v15 = 0;
  swift_retain();
  sub_23C053FB4();
  v8 = v11;
  v9 = v12;
  v11 = a1;
  v12 = a2;
  v13 = v8;
  v14 = v9;
  MEMORY[0x242615580](&v11, a3, &type metadata for ViewOnLoadModifier, a4);
  swift_release();
  return swift_release();
}

uint64_t sub_23C053830(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_23C053E7C();
  v4[0] = v1;
  v4[1] = sub_23C053884();
  return MEMORY[0x242615EC8](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_23C053884()
{
  unint64_t result;

  result = qword_256B040E0;
  if (!qword_256B040E0)
  {
    result = MEMORY[0x242615EC8](&unk_23C05A714, &type metadata for ViewOnLoadModifier);
    atomic_store(result, (unint64_t *)&qword_256B040E0);
  }
  return result;
}

uint64_t destroy for ViewOnLoadModifier()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for ViewOnLoadModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ViewOnLoadModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for ViewOnLoadModifier(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ViewOnLoadModifier(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ViewOnLoadModifier(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ViewOnLoadModifier()
{
  return &type metadata for ViewOnLoadModifier;
}

uint64_t sub_23C053A7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C053A8C(uint64_t (*a1)(uint64_t))
{
  uint64_t result;
  uint64_t v3;
  char v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256B040F8);
  result = sub_23C053FC0();
  if ((v4 & 1) == 0)
  {
    v3 = sub_23C053FCC();
    return a1(v3);
  }
  return result;
}

uint64_t sub_23C053B24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (**v11)();

  v6 = *v2;
  v5 = v2[1];
  v7 = *((_BYTE *)v2 + 16);
  v8 = v2[3];
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v6;
  *(_QWORD *)(v9 + 24) = v5;
  *(_BYTE *)(v9 + 32) = v7;
  *(_QWORD *)(v9 + 40) = v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B040E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a2, a1, v10);
  v11 = (uint64_t (**)())(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B040F0) + 36));
  *v11 = sub_23C053C0C;
  v11[1] = (uint64_t (*)())v9;
  v11[2] = 0;
  v11[3] = 0;
  swift_retain();
  return swift_retain();
}

uint64_t sub_23C053BE0()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C053C0C()
{
  uint64_t v0;

  return sub_23C053A8C(*(uint64_t (**)(uint64_t))(v0 + 16));
}

unint64_t sub_23C053C20()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B04100;
  if (!qword_256B04100)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B040F0);
    v2[0] = sub_23C053C8C();
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x242615EC8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B04100);
  }
  return result;
}

unint64_t sub_23C053C8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B04108;
  if (!qword_256B04108)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B040E8);
    result = MEMORY[0x242615EC8](MEMORY[0x24BDEFB78], v1);
    atomic_store(result, (unint64_t *)&qword_256B04108);
  }
  return result;
}

uint64_t sub_23C053CD8()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_23C053CE4()
{
  return MEMORY[0x24BDCF638]();
}

uint64_t sub_23C053CF0()
{
  return MEMORY[0x24BDCF650]();
}

uint64_t sub_23C053CFC()
{
  return MEMORY[0x24BEBBE90]();
}

uint64_t sub_23C053D08()
{
  return MEMORY[0x24BEBBEA0]();
}

uint64_t sub_23C053D14()
{
  return MEMORY[0x24BEBBEB8]();
}

uint64_t sub_23C053D20()
{
  return MEMORY[0x24BDCF678]();
}

uint64_t sub_23C053D2C()
{
  return MEMORY[0x24BDCF760]();
}

uint64_t sub_23C053D38()
{
  return MEMORY[0x24BDCF770]();
}

uint64_t sub_23C053D44()
{
  return MEMORY[0x24BDCF788]();
}

uint64_t sub_23C053D50()
{
  return MEMORY[0x24BDCF798]();
}

uint64_t sub_23C053D5C()
{
  return MEMORY[0x24BE37A78]();
}

uint64_t sub_23C053D68()
{
  return MEMORY[0x24BE37A80]();
}

uint64_t sub_23C053D74()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23C053D80()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23C053D8C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23C053D98()
{
  return MEMORY[0x24BEBBEC8]();
}

uint64_t sub_23C053DA4()
{
  return MEMORY[0x24BEBC690]();
}

uint64_t sub_23C053DB0()
{
  return MEMORY[0x24BEBC698]();
}

uint64_t sub_23C053DBC()
{
  return MEMORY[0x24BEBC6D0]();
}

uint64_t sub_23C053DC8()
{
  return MEMORY[0x24BEBC6E0]();
}

uint64_t sub_23C053DD4()
{
  return MEMORY[0x24BEBC6F0]();
}

uint64_t sub_23C053DE0()
{
  return MEMORY[0x24BEBC6F8]();
}

uint64_t sub_23C053DEC()
{
  return MEMORY[0x24BEBC708]();
}

uint64_t sub_23C053DF8()
{
  return MEMORY[0x24BEBC740]();
}

uint64_t sub_23C053E04()
{
  return MEMORY[0x24BEBC9C0]();
}

uint64_t sub_23C053E10()
{
  return MEMORY[0x24BEBC9D0]();
}

uint64_t sub_23C053E1C()
{
  return MEMORY[0x24BEBCA08]();
}

uint64_t sub_23C053E28()
{
  return MEMORY[0x24BEBCA20]();
}

uint64_t sub_23C053E34()
{
  return MEMORY[0x24BDEBBB8]();
}

uint64_t sub_23C053E40()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_23C053E4C()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_23C053E58()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_23C053E64()
{
  return MEMORY[0x24BDEC5A0]();
}

uint64_t sub_23C053E70()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_23C053E7C()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_23C053E88()
{
  return MEMORY[0x24BDEE258]();
}

uint64_t sub_23C053E94()
{
  return MEMORY[0x24BDEE2C8]();
}

uint64_t sub_23C053EA0()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_23C053EAC()
{
  return MEMORY[0x24BDEE488]();
}

uint64_t sub_23C053EB8()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_23C053EC4()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_23C053ED0()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_23C053EDC()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_23C053EE8()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_23C053EF4()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_23C053F00()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_23C053F0C()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_23C053F18()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_23C053F24()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_23C053F30()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_23C053F3C()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_23C053F48()
{
  return MEMORY[0x24BDEFEF8]();
}

uint64_t sub_23C053F54()
{
  return MEMORY[0x24BDF0AF8]();
}

uint64_t sub_23C053F60()
{
  return MEMORY[0x24BDF1558]();
}

uint64_t sub_23C053F6C()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_23C053F78()
{
  return MEMORY[0x24BDF17A8]();
}

uint64_t sub_23C053F84()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23C053F90()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23C053F9C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23C053FA8()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_23C053FB4()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_23C053FC0()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_23C053FCC()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_23C053FD8()
{
  return MEMORY[0x24BDF4FA8]();
}

uint64_t sub_23C053FE4()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23C053FF0()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23C053FFC()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23C054008()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23C054014()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23C054020()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_23C05402C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_23C054038()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23C054044()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_23C054050()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_23C05405C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23C054068()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_23C054074()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_23C054080()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23C05408C()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_23C054098()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_23C0540A4()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_23C0540B0()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_23C0540BC()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_23C0540C8()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_23C0540D4()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23C0540E0()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23C0540EC()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_23C0540F8()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23C054104()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_23C054110()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23C05411C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23C054128()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23C054134()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23C054140()
{
  return MEMORY[0x24BEE1268]();
}

uint64_t sub_23C05414C()
{
  return MEMORY[0x24BEE1278]();
}

uint64_t sub_23C054158()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23C054164()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23C054170()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23C05417C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23C054188()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23C054194()
{
  return MEMORY[0x24BEE13B8]();
}

uint64_t sub_23C0541A0()
{
  return MEMORY[0x24BDCFC80]();
}

uint64_t sub_23C0541AC()
{
  return MEMORY[0x24BDCFC90]();
}

uint64_t sub_23C0541B8()
{
  return MEMORY[0x24BDCFC98]();
}

uint64_t sub_23C0541C4()
{
  return MEMORY[0x24BDCFCA0]();
}

uint64_t sub_23C0541D0()
{
  return MEMORY[0x24BEE14D8]();
}

uint64_t sub_23C0541DC()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23C0541E8()
{
  return MEMORY[0x24BEE1930]();
}

uint64_t sub_23C0541F4()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_23C054200()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23C05420C()
{
  return MEMORY[0x24BDCFFF8]();
}

uint64_t sub_23C054218()
{
  return MEMORY[0x24BEBCD50]();
}

uint64_t sub_23C054224()
{
  return MEMORY[0x24BEBCFD8]();
}

uint64_t sub_23C054230()
{
  return MEMORY[0x24BDF5540]();
}

uint64_t sub_23C05423C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23C054248()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23C054254()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_23C054260()
{
  return MEMORY[0x24BEE2168]();
}

uint64_t sub_23C05426C()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_23C054278()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_23C054284()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23C054290()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23C05429C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23C0542A8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23C0542B4()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_23C0542C0()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23C0542CC()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23C0542D8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23C0542E4()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23C0542F0()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23C0542FC()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23C054308()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23C054314()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23C054320()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_23C05432C()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_23C054338()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_23C054344()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_23C054350()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23C05435C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23C054368()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23C054374()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23C054380()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23C05438C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23C054398()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23C0543A4()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_23C0543B0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23C0543BC()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23C0543C8()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23C0543D4()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23C0543E0()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23C0543EC()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23C0543F8()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23C054404()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23C054410()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23C05441C()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_23C054428()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23C054434()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23C054440()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23C05444C()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23C054458()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23C054464()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23C054470()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_23C05447C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_23C054488()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23C054494()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23C0544A0()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23C0544AC()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_23C0544B8()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_23C0544C4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23C0544D0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23C0544DC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23C0544E8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23C0544F4()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_23C054500()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_23C05450C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23C054518()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23C054524()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23C054530()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_23C05453C()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_23C054548()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23C054554()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23C054560()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23C05456C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23C054578()
{
  return MEMORY[0x24BEE4A10]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x24BEE4F98]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x24BEE4FA0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x24BEE4FA8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
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

