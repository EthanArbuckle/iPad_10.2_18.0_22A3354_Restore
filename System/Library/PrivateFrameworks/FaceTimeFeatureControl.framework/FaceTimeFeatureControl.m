BOOL static FeatureEligibility.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t FeatureEligibility.hash(into:)()
{
  return sub_23B2FF328();
}

uint64_t sub_23B2FBA64(char a1)
{
  return *(_QWORD *)&aInvalid_0[8 * a1];
}

BOOL sub_23B2FBA84(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23B2FBA9C()
{
  return sub_23B2FF328();
}

uint64_t sub_23B2FBAC8()
{
  char *v0;

  return sub_23B2FBA64(*v0);
}

uint64_t sub_23B2FBAD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B2FCE94(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B2FBAF4()
{
  return 0;
}

void sub_23B2FBB00(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_23B2FBB0C()
{
  sub_23B2FC11C();
  return sub_23B2FF358();
}

uint64_t sub_23B2FBB34()
{
  sub_23B2FC11C();
  return sub_23B2FF364();
}

uint64_t sub_23B2FBB5C()
{
  return 0;
}

void sub_23B2FBB68(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23B2FBB74()
{
  sub_23B2FC1A4();
  return sub_23B2FF358();
}

uint64_t sub_23B2FBB9C()
{
  sub_23B2FC1A4();
  return sub_23B2FF364();
}

uint64_t sub_23B2FBBC4()
{
  sub_23B2FC270();
  return sub_23B2FF358();
}

uint64_t sub_23B2FBBEC()
{
  sub_23B2FC270();
  return sub_23B2FF364();
}

uint64_t sub_23B2FBC14@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_23B2FBC40()
{
  sub_23B2FC1E8();
  return sub_23B2FF358();
}

uint64_t sub_23B2FBC68()
{
  sub_23B2FC1E8();
  return sub_23B2FF364();
}

uint64_t sub_23B2FBC90()
{
  sub_23B2FC160();
  return sub_23B2FF358();
}

uint64_t sub_23B2FBCB8()
{
  sub_23B2FC160();
  return sub_23B2FF364();
}

uint64_t sub_23B2FBCE0()
{
  sub_23B2FC22C();
  return sub_23B2FF358();
}

uint64_t sub_23B2FBD08()
{
  sub_23B2FC22C();
  return sub_23B2FF364();
}

void FeatureEligibility.encode(to:)(_QWORD *a1)
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
  _QWORD v13[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A188);
  v13[11] = *(_QWORD *)(v3 - 8);
  v13[12] = v3;
  MEMORY[0x24BDAC7A8]();
  v13[10] = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A190);
  v13[8] = *(_QWORD *)(v5 - 8);
  v13[9] = v5;
  MEMORY[0x24BDAC7A8]();
  v13[7] = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A198);
  v13[5] = *(_QWORD *)(v7 - 8);
  v13[6] = v7;
  MEMORY[0x24BDAC7A8]();
  v13[4] = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A1A0);
  v13[2] = *(_QWORD *)(v9 - 8);
  v13[3] = v9;
  MEMORY[0x24BDAC7A8]();
  v13[1] = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A1A8);
  MEMORY[0x24BDAC7A8]();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A1B0);
  v13[14] = *(_QWORD *)(v11 - 8);
  v13[15] = v11;
  MEMORY[0x24BDAC7A8]();
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B2FC11C();
  sub_23B2FF34C();
  __asm { BR              X9 }
}

uint64_t sub_23B2FBF24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 - 69) = 0;
  sub_23B2FC270();
  v5 = *(_QWORD *)(v4 - 88);
  sub_23B2FF304();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 96) + 8))(v1, v5);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B8622C4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

unint64_t sub_23B2FC11C()
{
  unint64_t result;

  result = qword_256A0A1B8;
  if (!qword_256A0A1B8)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FFB60, &type metadata for FeatureEligibility.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A1B8);
  }
  return result;
}

unint64_t sub_23B2FC160()
{
  unint64_t result;

  result = qword_256A0A1C0;
  if (!qword_256A0A1C0)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FFB10, &type metadata for FeatureEligibility.NotEligibleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A1C0);
  }
  return result;
}

unint64_t sub_23B2FC1A4()
{
  unint64_t result;

  result = qword_256A0A1C8;
  if (!qword_256A0A1C8)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FFAC0, &type metadata for FeatureEligibility.EligibleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A1C8);
  }
  return result;
}

unint64_t sub_23B2FC1E8()
{
  unint64_t result;

  result = qword_256A0A1D0;
  if (!qword_256A0A1D0)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FFA70, &type metadata for FeatureEligibility.MaybeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A1D0);
  }
  return result;
}

unint64_t sub_23B2FC22C()
{
  unint64_t result;

  result = qword_256A0A1D8;
  if (!qword_256A0A1D8)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FFA20, &type metadata for FeatureEligibility.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A1D8);
  }
  return result;
}

unint64_t sub_23B2FC270()
{
  unint64_t result;

  result = qword_256A0A1E0;
  if (!qword_256A0A1E0)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FF9D0, &type metadata for FeatureEligibility.InvalidCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A1E0);
  }
  return result;
}

uint64_t FeatureEligibility.hashValue.getter()
{
  sub_23B2FF31C();
  sub_23B2FF328();
  return sub_23B2FF334();
}

uint64_t FeatureEligibility.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  char *v24;
  uint64_t v25;
  _QWORD v27[4];
  char *v28;
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
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;

  v42 = a2;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A1E8);
  v34 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8]();
  v40 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A1F0);
  v35 = *(_QWORD *)(v4 - 8);
  v36 = v4;
  MEMORY[0x24BDAC7A8]();
  v39 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A1F8);
  v32 = *(_QWORD *)(v6 - 8);
  v33 = v6;
  MEMORY[0x24BDAC7A8]();
  v38 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A200);
  v30 = *(_QWORD *)(v8 - 8);
  v31 = v8;
  MEMORY[0x24BDAC7A8]();
  v37 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A208);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A210);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8]();
  v17 = (char *)v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1[3];
  v43 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_23B2FC11C();
  v19 = v44;
  sub_23B2FF340();
  if (!v19)
  {
    v27[2] = v10;
    v27[3] = v13;
    v27[1] = v11;
    v44 = v15;
    v28 = v17;
    v29 = v14;
    v20 = sub_23B2FF2F8();
    if (*(_QWORD *)(v20 + 16) == 1)
      __asm { BR              X9 }
    v21 = sub_23B2FF2B0();
    swift_allocError();
    v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A218);
    *v23 = &type metadata for FeatureEligibility;
    v24 = v28;
    v25 = v29;
    sub_23B2FF2EC();
    sub_23B2FF2A4();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x24BEE26D0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v24, v25);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
}

uint64_t sub_23B2FC7F0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return FeatureEligibility.init(from:)(a1, a2);
}

void sub_23B2FC804(_QWORD *a1)
{
  FeatureEligibility.encode(to:)(a1);
}

uint64_t sub_23B2FC818()
{
  sub_23B2FF31C();
  sub_23B2FF328();
  return sub_23B2FF334();
}

uint64_t sub_23B2FC85C()
{
  sub_23B2FF31C();
  sub_23B2FF328();
  return sub_23B2FF334();
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

unint64_t sub_23B2FC8C0()
{
  unint64_t result;

  result = qword_256A0A220;
  if (!qword_256A0A220)
  {
    result = MEMORY[0x23B8622D0](&protocol conformance descriptor for FeatureEligibility, &type metadata for FeatureEligibility);
    atomic_store(result, (unint64_t *)&qword_256A0A220);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for FeatureEligibility()
{
  return &type metadata for FeatureEligibility;
}

uint64_t _s22FaceTimeFeatureControl18FeatureEligibilityOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s22FaceTimeFeatureControl18FeatureEligibilityOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23B2FCA0C + 4 * byte_23B2FF5DF[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23B2FCA40 + 4 * byte_23B2FF5DA[v4]))();
}

uint64_t sub_23B2FCA40(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B2FCA48(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B2FCA50);
  return result;
}

uint64_t sub_23B2FCA5C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B2FCA64);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23B2FCA68(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B2FCA70(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B2FCA7C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23B2FCA84(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FeatureEligibility.CodingKeys()
{
  return &type metadata for FeatureEligibility.CodingKeys;
}

ValueMetadata *type metadata accessor for FeatureEligibility.InvalidCodingKeys()
{
  return &type metadata for FeatureEligibility.InvalidCodingKeys;
}

ValueMetadata *type metadata accessor for FeatureEligibility.UnknownCodingKeys()
{
  return &type metadata for FeatureEligibility.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for FeatureEligibility.MaybeCodingKeys()
{
  return &type metadata for FeatureEligibility.MaybeCodingKeys;
}

ValueMetadata *type metadata accessor for FeatureEligibility.EligibleCodingKeys()
{
  return &type metadata for FeatureEligibility.EligibleCodingKeys;
}

ValueMetadata *type metadata accessor for FeatureEligibility.NotEligibleCodingKeys()
{
  return &type metadata for FeatureEligibility.NotEligibleCodingKeys;
}

unint64_t sub_23B2FCAF0()
{
  unint64_t result;

  result = qword_256A0A228;
  if (!qword_256A0A228)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FF9A8, &type metadata for FeatureEligibility.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A228);
  }
  return result;
}

unint64_t sub_23B2FCB38()
{
  unint64_t result;

  result = qword_256A0A230;
  if (!qword_256A0A230)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FF8C8, &type metadata for FeatureEligibility.InvalidCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A230);
  }
  return result;
}

unint64_t sub_23B2FCB80()
{
  unint64_t result;

  result = qword_256A0A238;
  if (!qword_256A0A238)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FF8F0, &type metadata for FeatureEligibility.InvalidCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A238);
  }
  return result;
}

unint64_t sub_23B2FCBC8()
{
  unint64_t result;

  result = qword_256A0A240;
  if (!qword_256A0A240)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FF878, &type metadata for FeatureEligibility.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A240);
  }
  return result;
}

unint64_t sub_23B2FCC10()
{
  unint64_t result;

  result = qword_256A0A248;
  if (!qword_256A0A248)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FF8A0, &type metadata for FeatureEligibility.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A248);
  }
  return result;
}

unint64_t sub_23B2FCC58()
{
  unint64_t result;

  result = qword_256A0A250;
  if (!qword_256A0A250)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FF828, &type metadata for FeatureEligibility.MaybeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A250);
  }
  return result;
}

unint64_t sub_23B2FCCA0()
{
  unint64_t result;

  result = qword_256A0A258;
  if (!qword_256A0A258)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FF850, &type metadata for FeatureEligibility.MaybeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A258);
  }
  return result;
}

unint64_t sub_23B2FCCE8()
{
  unint64_t result;

  result = qword_256A0A260;
  if (!qword_256A0A260)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FF7D8, &type metadata for FeatureEligibility.EligibleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A260);
  }
  return result;
}

unint64_t sub_23B2FCD30()
{
  unint64_t result;

  result = qword_256A0A268;
  if (!qword_256A0A268)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FF800, &type metadata for FeatureEligibility.EligibleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A268);
  }
  return result;
}

unint64_t sub_23B2FCD78()
{
  unint64_t result;

  result = qword_256A0A270;
  if (!qword_256A0A270)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FF788, &type metadata for FeatureEligibility.NotEligibleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A270);
  }
  return result;
}

unint64_t sub_23B2FCDC0()
{
  unint64_t result;

  result = qword_256A0A278;
  if (!qword_256A0A278)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FF7B0, &type metadata for FeatureEligibility.NotEligibleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A278);
  }
  return result;
}

unint64_t sub_23B2FCE08()
{
  unint64_t result;

  result = qword_256A0A280;
  if (!qword_256A0A280)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FF918, &type metadata for FeatureEligibility.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A280);
  }
  return result;
}

unint64_t sub_23B2FCE50()
{
  unint64_t result;

  result = qword_256A0A288;
  if (!qword_256A0A288)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FF940, &type metadata for FeatureEligibility.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A288);
  }
  return result;
}

uint64_t sub_23B2FCE94(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x64696C61766E69 && a2 == 0xE700000000000000;
  if (v3 || (sub_23B2FF310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000 || (sub_23B2FF310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656279616DLL && a2 == 0xE500000000000000 || (sub_23B2FF310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656C626967696C65 && a2 == 0xE800000000000000 || (sub_23B2FF310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6967696C45746F6ELL && a2 == 0xEB00000000656C62)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_23B2FF310();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

FaceTimeFeatureControl::FeatureEligibility __swiftcall FeatureEligibilityChecker.getEligibilityForDomain(_:)(FaceTimeFeatureControl::FeatureEligibilityDomain a1)
{
  BOOL *v1;
  BOOL *v2;
  int domain_answer;

  v2 = v1;
  domain_answer = os_eligibility_get_domain_answer();
  *v2 = domain_answer != 0;
  return (char)domain_answer;
}

uint64_t sub_23B2FD148(FaceTimeFeatureControl::FeatureEligibilityDomain a1)
{
  return FeatureEligibilityChecker.getEligibilityForDomain(_:)(a1);
}

uint64_t dispatch thunk of FeatureEligibilityChecking.getEligibilityForDomain(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for FeatureEligibilityChecker()
{
  return &type metadata for FeatureEligibilityChecker;
}

uint64_t sub_23B2FD174()
{
  uint64_t v0;

  v0 = sub_23B2FF214();
  __swift_allocate_value_buffer(v0, qword_2542EE5F0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2542EE5F0);
  return sub_23B2FF208();
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

uint64_t sub_23B2FD24C()
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
  uint64_t result;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A2A8);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23B2FFC60;
  *(_QWORD *)(v0 + 32) = sub_23B2FF244();
  *(_QWORD *)(v0 + 40) = v1;
  *(_QWORD *)(v0 + 48) = sub_23B2FF244();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)(v0 + 64) = sub_23B2FF244();
  *(_QWORD *)(v0 + 72) = v3;
  *(_QWORD *)(v0 + 80) = sub_23B2FF244();
  *(_QWORD *)(v0 + 88) = v4;
  *(_QWORD *)(v0 + 96) = sub_23B2FF244();
  *(_QWORD *)(v0 + 104) = v5;
  *(_QWORD *)(v0 + 112) = sub_23B2FF244();
  *(_QWORD *)(v0 + 120) = v6;
  *(_QWORD *)(v0 + 128) = sub_23B2FF244();
  *(_QWORD *)(v0 + 136) = v7;
  *(_QWORD *)(v0 + 144) = sub_23B2FF244();
  *(_QWORD *)(v0 + 152) = v8;
  *(_QWORD *)(v0 + 160) = sub_23B2FF244();
  *(_QWORD *)(v0 + 168) = v9;
  *(_QWORD *)(v0 + 176) = sub_23B2FF244();
  *(_QWORD *)(v0 + 184) = v10;
  *(_QWORD *)(v0 + 192) = sub_23B2FF244();
  *(_QWORD *)(v0 + 200) = v11;
  *(_QWORD *)(v0 + 208) = sub_23B2FF244();
  *(_QWORD *)(v0 + 216) = v12;
  *(_QWORD *)(v0 + 224) = sub_23B2FF244();
  *(_QWORD *)(v0 + 232) = v13;
  result = sub_23B2FF244();
  *(_QWORD *)(v0 + 240) = result;
  *(_QWORD *)(v0 + 248) = v15;
  qword_256A0B6C0 = v0;
  return result;
}

uint64_t DeviceRestrictionController.init(profileConnection:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

Swift::Void __swiftcall DeviceRestrictionController.setRestrictionsActive(_:)(Swift::Bool a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (qword_2542EE5E8 != -1)
    swift_once();
  v2 = sub_23B2FF214();
  __swift_project_value_buffer(v2, (uint64_t)qword_2542EE5F0);
  v3 = sub_23B2FF1FC();
  v4 = sub_23B2FF274();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 67109120;
    sub_23B2FF280();
    _os_log_impl(&dword_23B2FA000, v3, v4, "Setting device restrictions active=%{BOOL}d", v5, 8u);
    MEMORY[0x23B86230C](v5, -1, -1);
  }

  sub_23B2FD624(a1);
}

void sub_23B2FD624(char a1)
{
  id *v1;
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  id v19[2];

  v19[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (*v1)
  {
    v3 = *v1;
    if (sub_23B2FD90C(a1 & 1))
    {
      v4 = (void *)sub_23B2FF220();
      swift_bridgeObjectRelease();
    }
    else
    {
      v4 = 0;
    }
    v9 = (void *)sub_23B2FF238();
    v10 = (void *)sub_23B2FF238();
    v19[0] = 0;
    v11 = objc_msgSend(v3, sel_applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_outRestrictionChanged_outEffectiveSettingsChanged_outError_, v4, v9, v10, 0, 0, 0, 0, v19);

    if (v11)
    {
      v12 = v19[0];

    }
    else
    {
      v13 = v19[0];
      v14 = (void *)sub_23B2FF1F0();

      swift_willThrow();
      if (qword_2542EE5E8 != -1)
        swift_once();
      v15 = sub_23B2FF214();
      __swift_project_value_buffer(v15, (uint64_t)qword_2542EE5F0);
      v16 = sub_23B2FF1FC();
      v17 = sub_23B2FF268();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_23B2FA000, v16, v17, "Unable to apply restrictions with MCProfileConnection", v18, 2u);
        MEMORY[0x23B86230C](v18, -1, -1);
      }

    }
  }
  else
  {
    if (qword_2542EE5E8 != -1)
      swift_once();
    v5 = sub_23B2FF214();
    __swift_project_value_buffer(v5, (uint64_t)qword_2542EE5F0);
    v6 = sub_23B2FF1FC();
    v7 = sub_23B2FF268();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_23B2FA000, v6, v7, "Unable to get MCProfileConnection", v8, 2u);
      MEMORY[0x23B86230C](v8, -1, -1);
    }

  }
}

uint64_t sub_23B2FD90C(char a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  id v20;
  uint64_t v21;

  if ((a1 & 1) != 0)
  {
    v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCED8]), sel_init);
    if (qword_256A0A180 != -1)
      swift_once();
    v2 = qword_256A0B6C0;
    v3 = *(_QWORD *)(qword_256A0B6C0 + 16);
    if (v3)
    {
      swift_bridgeObjectRetain_n();
      v4 = v2 + 40;
      do
      {
        swift_bridgeObjectRetain();
        v5 = (void *)sub_23B2FF238();
        objc_msgSend(v1, sel_MCSetBoolRestriction_value_, v5, 0);
        swift_bridgeObjectRelease();

        v4 += 16;
        --v3;
      }
      while (v3);
      swift_bridgeObjectRelease_n();
    }
    if (qword_2542EE5E8 != -1)
      swift_once();
    v6 = sub_23B2FF214();
    __swift_project_value_buffer(v6, (uint64_t)qword_2542EE5F0);
    v7 = v1;
    v8 = sub_23B2FF1FC();
    v9 = sub_23B2FF274();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v21 = v11;
      *(_DWORD *)v10 = 136315138;
      sub_23B2FE440();
      v12 = v7;
      v13 = sub_23B2FF250();
      sub_23B2FDCA0(v13, v14, &v21);
      sub_23B2FF280();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23B2FA000, v8, v9, "Set device restrictions. Updating configuration to mcFeaturesSettings %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B86230C](v11, -1, -1);
      MEMORY[0x23B86230C](v10, -1, -1);

    }
    else
    {

    }
    v21 = 0;
    v20 = v7;
    sub_23B2FF22C();

    return v21;
  }
  else
  {
    if (qword_2542EE5E8 != -1)
      swift_once();
    v15 = sub_23B2FF214();
    __swift_project_value_buffer(v15, (uint64_t)qword_2542EE5F0);
    v16 = sub_23B2FF1FC();
    v17 = sub_23B2FF274();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_23B2FA000, v16, v17, "Remove device restrictions. Updating configuration to nil", v18, 2u);
      MEMORY[0x23B86230C](v18, -1, -1);
    }

    return 0;
  }
}

Swift::Void __swiftcall DeviceRestrictionController.resetRestrictions()()
{
  DeviceRestrictionController.setRestrictionsActive(_:)(0);
}

uint64_t sub_23B2FDCA0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23B2FDD70(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23B2FE47C((uint64_t)v12, *a3);
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
      sub_23B2FE47C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23B2FDD70(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23B2FF28C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23B2FDF28(a5, a6);
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
  v8 = sub_23B2FF2BC();
  if (!v8)
  {
    sub_23B2FF2C8();
    __break(1u);
LABEL_17:
    result = sub_23B2FF2D4();
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

uint64_t sub_23B2FDF28(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23B2FDFBC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23B2FE194(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23B2FE194(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23B2FDFBC(uint64_t a1, unint64_t a2)
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
      v3 = sub_23B2FE130(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23B2FF298();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23B2FF2C8();
      __break(1u);
LABEL_10:
      v2 = sub_23B2FF25C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23B2FF2D4();
    __break(1u);
LABEL_14:
    result = sub_23B2FF2C8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23B2FE130(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A2A0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23B2FE194(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A2A0);
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
  result = sub_23B2FF2D4();
  __break(1u);
  return result;
}

void **initializeBufferWithCopyOfBuffer for DeviceRestrictionController(void **a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void destroy for DeviceRestrictionController(id *a1)
{

}

void **assignWithCopy for DeviceRestrictionController(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a1;
  v4 = *a2;
  *a1 = *a2;
  v5 = v4;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for DeviceRestrictionController(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceRestrictionController(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceRestrictionController(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
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

ValueMetadata *type metadata accessor for DeviceRestrictionController()
{
  return &type metadata for DeviceRestrictionController;
}

unint64_t sub_23B2FE440()
{
  unint64_t result;

  result = qword_256A0A298;
  if (!qword_256A0A298)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256A0A298);
  }
  return result;
}

uint64_t sub_23B2FE47C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

BOOL static FeatureEligibilityDomain.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t FeatureEligibilityDomain.hash(into:)()
{
  return sub_23B2FF328();
}

uint64_t sub_23B2FE500(char a1)
{
  if ((a1 & 1) != 0)
    return 0x69486F5477617264;
  else
    return 0x6F4365746F6D6572;
}

BOOL sub_23B2FE550(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23B2FE568()
{
  char *v0;

  return sub_23B2FE500(*v0);
}

uint64_t sub_23B2FE570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B2FF0D4(a1, a2);
  *a3 = result;
  return result;
}

void sub_23B2FE594(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23B2FE5A0()
{
  sub_23B2FE864();
  return sub_23B2FF358();
}

uint64_t sub_23B2FE5C8()
{
  sub_23B2FE864();
  return sub_23B2FF364();
}

uint64_t sub_23B2FE5F0()
{
  sub_23B2FE8A8();
  return sub_23B2FF358();
}

uint64_t sub_23B2FE618()
{
  sub_23B2FE8A8();
  return sub_23B2FF364();
}

uint64_t sub_23B2FE640()
{
  sub_23B2FE8EC();
  return sub_23B2FF358();
}

uint64_t sub_23B2FE668()
{
  sub_23B2FE8EC();
  return sub_23B2FF364();
}

uint64_t FeatureEligibilityDomain.encode(to:)(_QWORD *a1)
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A2B0);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A2B8);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A2C0);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B2FE864();
  sub_23B2FF34C();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23B2FE8A8();
    sub_23B2FF304();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23B2FE8EC();
    sub_23B2FF304();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_23B2FE864()
{
  unint64_t result;

  result = qword_256A0A2C8;
  if (!qword_256A0A2C8)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FFFE4, &type metadata for FeatureEligibilityDomain.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A2C8);
  }
  return result;
}

unint64_t sub_23B2FE8A8()
{
  unint64_t result;

  result = qword_256A0A2D0;
  if (!qword_256A0A2D0)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FFF94, &type metadata for FeatureEligibilityDomain.DrawToHighlightCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A2D0);
  }
  return result;
}

unint64_t sub_23B2FE8EC()
{
  unint64_t result;

  result = qword_256A0A2D8;
  if (!qword_256A0A2D8)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FFF44, &type metadata for FeatureEligibilityDomain.RemoteControlCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A2D8);
  }
  return result;
}

uint64_t FeatureEligibilityDomain.hashValue.getter()
{
  sub_23B2FF31C();
  sub_23B2FF328();
  return sub_23B2FF334();
}

uint64_t FeatureEligibilityDomain.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A2E0);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8]();
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A2E8);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A2F0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B2FE864();
  v11 = v33;
  sub_23B2FF340();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23B2FF2F8();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23B2FF2B0();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A0A218);
    *v21 = &type metadata for FeatureEligibilityDomain;
    sub_23B2FF2EC();
    sub_23B2FF2A4();
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
    sub_23B2FE8A8();
    sub_23B2FF2E0();
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
    sub_23B2FE8EC();
    v22 = v6;
    sub_23B2FF2E0();
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

uint64_t sub_23B2FECCC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return FeatureEligibilityDomain.init(from:)(a1, a2);
}

uint64_t sub_23B2FECE0(_QWORD *a1)
{
  return FeatureEligibilityDomain.encode(to:)(a1);
}

unint64_t sub_23B2FECF8()
{
  unint64_t result;

  result = qword_256A0A2F8;
  if (!qword_256A0A2F8)
  {
    result = MEMORY[0x23B8622D0](&protocol conformance descriptor for FeatureEligibilityDomain, &type metadata for FeatureEligibilityDomain);
    atomic_store(result, (unint64_t *)&qword_256A0A2F8);
  }
  return result;
}

ValueMetadata *type metadata accessor for FeatureEligibilityDomain()
{
  return &type metadata for FeatureEligibilityDomain;
}

uint64_t _s22FaceTimeFeatureControl24FeatureEligibilityDomainOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s22FaceTimeFeatureControl24FeatureEligibilityDomainOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23B2FEE30 + 4 * byte_23B2FFCB5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23B2FEE64 + 4 * asc_23B2FFCB0[v4]))();
}

uint64_t sub_23B2FEE64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B2FEE6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B2FEE74);
  return result;
}

uint64_t sub_23B2FEE80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B2FEE88);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23B2FEE8C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B2FEE94(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23B2FEEA0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FeatureEligibilityDomain.CodingKeys()
{
  return &type metadata for FeatureEligibilityDomain.CodingKeys;
}

ValueMetadata *type metadata accessor for FeatureEligibilityDomain.RemoteControlCodingKeys()
{
  return &type metadata for FeatureEligibilityDomain.RemoteControlCodingKeys;
}

ValueMetadata *type metadata accessor for FeatureEligibilityDomain.DrawToHighlightCodingKeys()
{
  return &type metadata for FeatureEligibilityDomain.DrawToHighlightCodingKeys;
}

unint64_t sub_23B2FEEE0()
{
  unint64_t result;

  result = qword_256A0A300;
  if (!qword_256A0A300)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FFF1C, &type metadata for FeatureEligibilityDomain.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A300);
  }
  return result;
}

unint64_t sub_23B2FEF28()
{
  unint64_t result;

  result = qword_256A0A308;
  if (!qword_256A0A308)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FFE3C, &type metadata for FeatureEligibilityDomain.RemoteControlCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A308);
  }
  return result;
}

unint64_t sub_23B2FEF70()
{
  unint64_t result;

  result = qword_256A0A310;
  if (!qword_256A0A310)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FFE64, &type metadata for FeatureEligibilityDomain.RemoteControlCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A310);
  }
  return result;
}

unint64_t sub_23B2FEFB8()
{
  unint64_t result;

  result = qword_256A0A318;
  if (!qword_256A0A318)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FFDEC, &type metadata for FeatureEligibilityDomain.DrawToHighlightCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A318);
  }
  return result;
}

unint64_t sub_23B2FF000()
{
  unint64_t result;

  result = qword_256A0A320;
  if (!qword_256A0A320)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FFE14, &type metadata for FeatureEligibilityDomain.DrawToHighlightCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A320);
  }
  return result;
}

unint64_t sub_23B2FF048()
{
  unint64_t result;

  result = qword_256A0A328;
  if (!qword_256A0A328)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FFE8C, &type metadata for FeatureEligibilityDomain.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A328);
  }
  return result;
}

unint64_t sub_23B2FF090()
{
  unint64_t result;

  result = qword_256A0A330;
  if (!qword_256A0A330)
  {
    result = MEMORY[0x23B8622D0](&unk_23B2FFEB4, &type metadata for FeatureEligibilityDomain.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A0A330);
  }
  return result;
}

uint64_t sub_23B2FF0D4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6F4365746F6D6572 && a2 == 0xED00006C6F72746ELL;
  if (v3 || (sub_23B2FF310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x69486F5477617264 && a2 == 0xEF746867696C6867)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23B2FF310();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23B2FF1F0()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23B2FF1FC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23B2FF208()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23B2FF214()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23B2FF220()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23B2FF22C()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t sub_23B2FF238()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23B2FF244()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23B2FF250()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_23B2FF25C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23B2FF268()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23B2FF274()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23B2FF280()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23B2FF28C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23B2FF298()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23B2FF2A4()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23B2FF2B0()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23B2FF2BC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23B2FF2C8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23B2FF2D4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23B2FF2E0()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23B2FF2EC()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23B2FF2F8()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23B2FF304()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23B2FF310()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23B2FF31C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23B2FF328()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23B2FF334()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23B2FF340()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23B2FF34C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23B2FF358()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23B2FF364()
{
  return MEMORY[0x24BEE4A10]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
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

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x24BDAF2F8]();
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

