unint64_t sub_23C312C90()
{
  unint64_t result;

  result = qword_256B5B850;
  if (!qword_256B5B850)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for ProgramDetailDynamicTypeSize, &type metadata for ProgramDetailDynamicTypeSize);
    atomic_store(result, (unint64_t *)&qword_256B5B850);
  }
  return result;
}

ValueMetadata *type metadata accessor for ProgramDetailDynamicTypeSize()
{
  return &type metadata for ProgramDetailDynamicTypeSize;
}

uint64_t _s20FitnessProductDetail28ProgramDetailDynamicTypeSizeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_23C312D38 + 4 * byte_23C35AC35[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_23C312D6C + 4 * byte_23C35AC30[v4]))();
}

uint64_t sub_23C312D6C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C312D74(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C312D7CLL);
  return result;
}

uint64_t sub_23C312D88(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C312D90);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_23C312D94(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C312D9C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProgramDetailDynamicTypeSize.CodingKeys()
{
  return &type metadata for ProgramDetailDynamicTypeSize.CodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailDynamicTypeSize.ExtraSmallCodingKeys()
{
  return &type metadata for ProgramDetailDynamicTypeSize.ExtraSmallCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailDynamicTypeSize.SmallCodingKeys()
{
  return &type metadata for ProgramDetailDynamicTypeSize.SmallCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailDynamicTypeSize.MediumCodingKeys()
{
  return &type metadata for ProgramDetailDynamicTypeSize.MediumCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailDynamicTypeSize.LargeCodingKeys()
{
  return &type metadata for ProgramDetailDynamicTypeSize.LargeCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailDynamicTypeSize.ExtraLargeCodingKeys()
{
  return &type metadata for ProgramDetailDynamicTypeSize.ExtraLargeCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailDynamicTypeSize.ExtraExtraLargeCodingKeys()
{
  return &type metadata for ProgramDetailDynamicTypeSize.ExtraExtraLargeCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailDynamicTypeSize.ExtraExtraExtraLargeCodingKeys()
{
  return &type metadata for ProgramDetailDynamicTypeSize.ExtraExtraExtraLargeCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailDynamicTypeSize.Accessibility1CodingKeys()
{
  return &type metadata for ProgramDetailDynamicTypeSize.Accessibility1CodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailDynamicTypeSize.Accessibility2CodingKeys()
{
  return &type metadata for ProgramDetailDynamicTypeSize.Accessibility2CodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailDynamicTypeSize.Accessibility3CodingKeys()
{
  return &type metadata for ProgramDetailDynamicTypeSize.Accessibility3CodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailDynamicTypeSize.Accessibility4CodingKeys()
{
  return &type metadata for ProgramDetailDynamicTypeSize.Accessibility4CodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailDynamicTypeSize.Accessibility5CodingKeys()
{
  return &type metadata for ProgramDetailDynamicTypeSize.Accessibility5CodingKeys;
}

unint64_t sub_23C312E7C()
{
  unint64_t result;

  result = qword_256B5B858;
  if (!qword_256B5B858)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B31C, &type metadata for ProgramDetailDynamicTypeSize.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B858);
  }
  return result;
}

unint64_t sub_23C312EC4()
{
  unint64_t result;

  result = qword_256B5B860;
  if (!qword_256B5B860)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B23C, &type metadata for ProgramDetailDynamicTypeSize.ExtraSmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B860);
  }
  return result;
}

unint64_t sub_23C312F0C()
{
  unint64_t result;

  result = qword_256B5B868;
  if (!qword_256B5B868)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B264, &type metadata for ProgramDetailDynamicTypeSize.ExtraSmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B868);
  }
  return result;
}

unint64_t sub_23C312F54()
{
  unint64_t result;

  result = qword_256B5B870;
  if (!qword_256B5B870)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B1EC, &type metadata for ProgramDetailDynamicTypeSize.SmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B870);
  }
  return result;
}

unint64_t sub_23C312F9C()
{
  unint64_t result;

  result = qword_256B5B878;
  if (!qword_256B5B878)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B214, &type metadata for ProgramDetailDynamicTypeSize.SmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B878);
  }
  return result;
}

unint64_t sub_23C312FE4()
{
  unint64_t result;

  result = qword_256B5B880;
  if (!qword_256B5B880)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B19C, &type metadata for ProgramDetailDynamicTypeSize.MediumCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B880);
  }
  return result;
}

unint64_t sub_23C31302C()
{
  unint64_t result;

  result = qword_256B5B888;
  if (!qword_256B5B888)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B1C4, &type metadata for ProgramDetailDynamicTypeSize.MediumCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B888);
  }
  return result;
}

unint64_t sub_23C313074()
{
  unint64_t result;

  result = qword_256B5B890;
  if (!qword_256B5B890)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B14C, &type metadata for ProgramDetailDynamicTypeSize.LargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B890);
  }
  return result;
}

unint64_t sub_23C3130BC()
{
  unint64_t result;

  result = qword_256B5B898;
  if (!qword_256B5B898)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B174, &type metadata for ProgramDetailDynamicTypeSize.LargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B898);
  }
  return result;
}

unint64_t sub_23C313104()
{
  unint64_t result;

  result = qword_256B5B8A0;
  if (!qword_256B5B8A0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B0FC, &type metadata for ProgramDetailDynamicTypeSize.ExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B8A0);
  }
  return result;
}

unint64_t sub_23C31314C()
{
  unint64_t result;

  result = qword_256B5B8A8;
  if (!qword_256B5B8A8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B124, &type metadata for ProgramDetailDynamicTypeSize.ExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B8A8);
  }
  return result;
}

unint64_t sub_23C313194()
{
  unint64_t result;

  result = qword_256B5B8B0;
  if (!qword_256B5B8B0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B0AC, &type metadata for ProgramDetailDynamicTypeSize.ExtraExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B8B0);
  }
  return result;
}

unint64_t sub_23C3131DC()
{
  unint64_t result;

  result = qword_256B5B8B8;
  if (!qword_256B5B8B8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B0D4, &type metadata for ProgramDetailDynamicTypeSize.ExtraExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B8B8);
  }
  return result;
}

unint64_t sub_23C313224()
{
  unint64_t result;

  result = qword_256B5B8C0;
  if (!qword_256B5B8C0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B05C, &type metadata for ProgramDetailDynamicTypeSize.ExtraExtraExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B8C0);
  }
  return result;
}

unint64_t sub_23C31326C()
{
  unint64_t result;

  result = qword_256B5B8C8;
  if (!qword_256B5B8C8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B084, &type metadata for ProgramDetailDynamicTypeSize.ExtraExtraExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B8C8);
  }
  return result;
}

unint64_t sub_23C3132B4()
{
  unint64_t result;

  result = qword_256B5B8D0;
  if (!qword_256B5B8D0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B00C, &type metadata for ProgramDetailDynamicTypeSize.Accessibility1CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B8D0);
  }
  return result;
}

unint64_t sub_23C3132FC()
{
  unint64_t result;

  result = qword_256B5B8D8;
  if (!qword_256B5B8D8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B034, &type metadata for ProgramDetailDynamicTypeSize.Accessibility1CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B8D8);
  }
  return result;
}

unint64_t sub_23C313344()
{
  unint64_t result;

  result = qword_256B5B8E0;
  if (!qword_256B5B8E0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35AFBC, &type metadata for ProgramDetailDynamicTypeSize.Accessibility2CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B8E0);
  }
  return result;
}

unint64_t sub_23C31338C()
{
  unint64_t result;

  result = qword_256B5B8E8;
  if (!qword_256B5B8E8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35AFE4, &type metadata for ProgramDetailDynamicTypeSize.Accessibility2CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B8E8);
  }
  return result;
}

unint64_t sub_23C3133D4()
{
  unint64_t result;

  result = qword_256B5B8F0;
  if (!qword_256B5B8F0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35AF6C, &type metadata for ProgramDetailDynamicTypeSize.Accessibility3CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B8F0);
  }
  return result;
}

unint64_t sub_23C31341C()
{
  unint64_t result;

  result = qword_256B5B8F8;
  if (!qword_256B5B8F8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35AF94, &type metadata for ProgramDetailDynamicTypeSize.Accessibility3CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B8F8);
  }
  return result;
}

unint64_t sub_23C313464()
{
  unint64_t result;

  result = qword_256B5B900;
  if (!qword_256B5B900)
  {
    result = MEMORY[0x24261C66C](&unk_23C35AF1C, &type metadata for ProgramDetailDynamicTypeSize.Accessibility4CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B900);
  }
  return result;
}

unint64_t sub_23C3134AC()
{
  unint64_t result;

  result = qword_256B5B908;
  if (!qword_256B5B908)
  {
    result = MEMORY[0x24261C66C](&unk_23C35AF44, &type metadata for ProgramDetailDynamicTypeSize.Accessibility4CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B908);
  }
  return result;
}

unint64_t sub_23C3134F4()
{
  unint64_t result;

  result = qword_256B5B910;
  if (!qword_256B5B910)
  {
    result = MEMORY[0x24261C66C](&unk_23C35AECC, &type metadata for ProgramDetailDynamicTypeSize.Accessibility5CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B910);
  }
  return result;
}

unint64_t sub_23C31353C()
{
  unint64_t result;

  result = qword_256B5B918;
  if (!qword_256B5B918)
  {
    result = MEMORY[0x24261C66C](&unk_23C35AEF4, &type metadata for ProgramDetailDynamicTypeSize.Accessibility5CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B918);
  }
  return result;
}

unint64_t sub_23C313584()
{
  unint64_t result;

  result = qword_256B5B920;
  if (!qword_256B5B920)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B28C, &type metadata for ProgramDetailDynamicTypeSize.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B920);
  }
  return result;
}

unint64_t sub_23C3135CC()
{
  unint64_t result;

  result = qword_256B5B928;
  if (!qword_256B5B928)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B2B4, &type metadata for ProgramDetailDynamicTypeSize.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B928);
  }
  return result;
}

FitnessProductDetail::WorkoutResumableSession __swiftcall WorkoutResumableSession.init(startTime:activityType:)(Swift::Double startTime, Swift::UInt_optional activityType)
{
  uint64_t v2;
  FitnessProductDetail::WorkoutResumableSession result;

  *(Swift::Double *)v2 = startTime;
  *(_QWORD *)(v2 + 8) = activityType.value;
  *(_BYTE *)(v2 + 16) = activityType.is_nil;
  result.activityType = activityType;
  result.startTime = startTime;
  return result;
}

uint64_t sub_23C313624(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7974697669746361;
  else
    return 0x6D69547472617473;
}

uint64_t sub_23C313668()
{
  char *v0;

  return sub_23C313624(*v0);
}

uint64_t sub_23C313670@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C313C70(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C313694()
{
  sub_23C313818();
  return sub_23C34ECD0();
}

uint64_t sub_23C3136BC()
{
  sub_23C313818();
  return sub_23C34ECDC();
}

uint64_t WorkoutResumableSession.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;
  char v10;
  char v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5B998);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C313818();
  sub_23C34ECC4();
  v11 = 0;
  sub_23C34EC28();
  if (!v2)
  {
    v10 = 1;
    sub_23C34EBF8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23C313818()
{
  unint64_t result;

  result = qword_256B5B9A0;
  if (!qword_256B5B9A0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B8CC, &type metadata for WorkoutResumableSession.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B9A0);
  }
  return result;
}

uint64_t WorkoutResumableSession.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  char v13;
  char v14;
  _BYTE v15[16];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5B9A8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C313818();
  sub_23C34ECB8();
  if (!v2)
  {
    v15[15] = 0;
    sub_23C34EB98();
    v10 = v9;
    v15[14] = 1;
    v12 = sub_23C34EB68();
    v14 = v13;
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    *(_QWORD *)a2 = v10;
    *(_QWORD *)(a2 + 8) = v12;
    *(_BYTE *)(a2 + 16) = v14 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23C3139C0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return WorkoutResumableSession.init(from:)(a1, a2);
}

uint64_t sub_23C3139D4(_QWORD *a1)
{
  return WorkoutResumableSession.encode(to:)(a1);
}

uint64_t static WorkoutResumableSession.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v2;

  if (*(double *)a1 != *(double *)a2)
    return 0;
  v2 = *(_BYTE *)(a2 + 16);
  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 16) & 1) == 0)
      return 0;
  }
  else
  {
    if (*(_QWORD *)(a1 + 8) != *(_QWORD *)(a2 + 8))
      v2 = 1;
    if ((v2 & 1) != 0)
      return 0;
  }
  return 1;
}

uint64_t sub_23C313A2C(uint64_t a1, uint64_t a2)
{
  char v2;

  if (*(double *)a1 == *(double *)a2)
  {
    v2 = *(_BYTE *)(a2 + 16);
    if ((*(_BYTE *)(a1 + 16) & 1) != 0)
    {
      if (*(_BYTE *)(a2 + 16))
        return 1;
    }
    else
    {
      if (*(_QWORD *)(a1 + 8) != *(_QWORD *)(a2 + 8))
        v2 = 1;
      if ((v2 & 1) == 0)
        return 1;
    }
  }
  return 0;
}

uint64_t getEnumTagSinglePayload for WorkoutResumableSession(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for WorkoutResumableSession(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 16) = 0;
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
  *(_BYTE *)(result + 17) = v3;
  return result;
}

ValueMetadata *type metadata accessor for WorkoutResumableSession()
{
  return &type metadata for WorkoutResumableSession;
}

uint64_t storeEnumTagSinglePayload for WorkoutResumableSession.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C313B18 + 4 * byte_23C35B765[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C313B4C + 4 * byte_23C35B760[v4]))();
}

uint64_t sub_23C313B4C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C313B54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C313B5CLL);
  return result;
}

uint64_t sub_23C313B68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C313B70);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C313B74(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C313B7C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WorkoutResumableSession.CodingKeys()
{
  return &type metadata for WorkoutResumableSession.CodingKeys;
}

unint64_t sub_23C313B9C()
{
  unint64_t result;

  result = qword_256B5B9B0;
  if (!qword_256B5B9B0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B8A4, &type metadata for WorkoutResumableSession.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B9B0);
  }
  return result;
}

unint64_t sub_23C313BE4()
{
  unint64_t result;

  result = qword_256B5B9B8;
  if (!qword_256B5B9B8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B814, &type metadata for WorkoutResumableSession.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B9B8);
  }
  return result;
}

unint64_t sub_23C313C2C()
{
  unint64_t result;

  result = qword_256B5B9C0;
  if (!qword_256B5B9C0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35B83C, &type metadata for WorkoutResumableSession.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B9C0);
  }
  return result;
}

uint64_t sub_23C313C70(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6D69547472617473 && a2 == 0xE900000000000065;
  if (v3 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7974697669746361 && a2 == 0xEC00000065707954)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C34EC64();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

BOOL static WorkoutContextMenuPreviewLayout.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t WorkoutContextMenuPreviewLayout.sizeClass.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

FitnessProductDetail::WorkoutContextMenuPreviewLayout __swiftcall WorkoutContextMenuPreviewLayout.init(sizeClass:)(FitnessProductDetail::WorkoutContextMenuPreviewLayout sizeClass)
{
  _BYTE *v1;

  *v1 = sizeClass.sizeClass & 1;
  return sizeClass;
}

uint64_t sub_23C313DA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C314418(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C313DC8()
{
  sub_23C313F14();
  return sub_23C34ECD0();
}

uint64_t sub_23C313DF0()
{
  sub_23C313F14();
  return sub_23C34ECDC();
}

uint64_t WorkoutContextMenuPreviewLayout.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v9;
  char v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5B9C8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C313F14();
  sub_23C34ECC4();
  v10 = v7;
  sub_23C313F58();
  sub_23C34EC40();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23C313F14()
{
  unint64_t result;

  result = qword_256B5B9D0;
  if (!qword_256B5B9D0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35BAE4, &type metadata for WorkoutContextMenuPreviewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B9D0);
  }
  return result;
}

unint64_t sub_23C313F58()
{
  unint64_t result;

  result = qword_256B5B9D8;
  if (!qword_256B5B9D8)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for WorkoutContextMenuPreviewSizeClass, &type metadata for WorkoutContextMenuPreviewSizeClass);
    atomic_store(result, (unint64_t *)&qword_256B5B9D8);
  }
  return result;
}

uint64_t WorkoutContextMenuPreviewLayout.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5B9E0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C313F14();
  sub_23C34ECB8();
  if (!v2)
  {
    sub_23C3140B8();
    sub_23C34EBB0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_23C3140B8()
{
  unint64_t result;

  result = qword_256B5B9E8;
  if (!qword_256B5B9E8)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for WorkoutContextMenuPreviewSizeClass, &type metadata for WorkoutContextMenuPreviewSizeClass);
    atomic_store(result, (unint64_t *)&qword_256B5B9E8);
  }
  return result;
}

uint64_t sub_23C3140FC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return WorkoutContextMenuPreviewLayout.init(from:)(a1, a2);
}

uint64_t sub_23C314110(_QWORD *a1)
{
  return WorkoutContextMenuPreviewLayout.encode(to:)(a1);
}

uint64_t WorkoutContextMenuPreviewLayout.hash(into:)()
{
  return sub_23C34EC88();
}

uint64_t WorkoutContextMenuPreviewLayout.hashValue.getter()
{
  sub_23C34EC7C();
  sub_23C34EC88();
  return sub_23C34ECAC();
}

unint64_t sub_23C314194()
{
  unint64_t result;

  result = qword_256B5B9F0;
  if (!qword_256B5B9F0)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for WorkoutContextMenuPreviewLayout, &type metadata for WorkoutContextMenuPreviewLayout);
    atomic_store(result, (unint64_t *)&qword_256B5B9F0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for WorkoutContextMenuPreviewLayout(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C314224 + 4 * byte_23C35B925[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C314258 + 4 * byte_23C35B920[v4]))();
}

uint64_t sub_23C314258(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C314260(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C314268);
  return result;
}

uint64_t sub_23C314274(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C31427CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C314280(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C314288(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WorkoutContextMenuPreviewLayout()
{
  return &type metadata for WorkoutContextMenuPreviewLayout;
}

uint64_t storeEnumTagSinglePayload for WorkoutContextMenuPreviewLayout.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C3142E4 + 4 * byte_23C35B92A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C314304 + 4 * byte_23C35B92F[v4]))();
}

_BYTE *sub_23C3142E4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C314304(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C31430C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C314314(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C31431C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C314324(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for WorkoutContextMenuPreviewLayout.CodingKeys()
{
  return &type metadata for WorkoutContextMenuPreviewLayout.CodingKeys;
}

unint64_t sub_23C314344()
{
  unint64_t result;

  result = qword_256B5B9F8;
  if (!qword_256B5B9F8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35BABC, &type metadata for WorkoutContextMenuPreviewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5B9F8);
  }
  return result;
}

unint64_t sub_23C31438C()
{
  unint64_t result;

  result = qword_256B5BA00;
  if (!qword_256B5BA00)
  {
    result = MEMORY[0x24261C66C](&unk_23C35BA2C, &type metadata for WorkoutContextMenuPreviewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BA00);
  }
  return result;
}

unint64_t sub_23C3143D4()
{
  unint64_t result;

  result = qword_256B5BA08;
  if (!qword_256B5BA08)
  {
    result = MEMORY[0x24261C66C](&unk_23C35BA54, &type metadata for WorkoutContextMenuPreviewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BA08);
  }
  return result;
}

uint64_t sub_23C314418(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x73616C43657A6973 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23C34EC64();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C3144A4()
{
  return 0x73616C43657A6973;
}

uint64_t WorkoutScheduleEnvironment.init(fetchWorkoutSchedule:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

ValueMetadata *type metadata accessor for WorkoutScheduleEnvironment()
{
  return &type metadata for WorkoutScheduleEnvironment;
}

uint64_t sub_23C3144D8(char a1)
{
  return *(_QWORD *)&aIdle_14[8 * a1];
}

uint64_t sub_23C3144F8()
{
  char *v0;

  return sub_23C3144D8(*v0);
}

uint64_t sub_23C314500()
{
  sub_23C314914();
  return sub_23C34ECD0();
}

uint64_t sub_23C314528()
{
  sub_23C314914();
  return sub_23C34ECDC();
}

uint64_t sub_23C314554@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C3154CC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C31457C()
{
  sub_23C314958();
  return sub_23C34ECD0();
}

uint64_t sub_23C3145A4()
{
  sub_23C314958();
  return sub_23C34ECDC();
}

uint64_t sub_23C3145CC()
{
  sub_23C31499C();
  return sub_23C34ECD0();
}

uint64_t sub_23C3145F4()
{
  sub_23C31499C();
  return sub_23C34ECDC();
}

uint64_t sub_23C31461C()
{
  sub_23C3149E0();
  return sub_23C34ECD0();
}

uint64_t sub_23C314644()
{
  sub_23C3149E0();
  return sub_23C34ECDC();
}

uint64_t ServiceSubscriptionLoadState.encode(to:)(_QWORD *a1)
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  char v28;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BA10);
  v23 = *(_QWORD *)(v4 - 8);
  v24 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v22 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BA18);
  v20 = *(_QWORD *)(v6 - 8);
  v21 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BA20);
  v9 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BA28);
  v25 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C314914();
  sub_23C34ECC4();
  if (v15 == 2)
  {
    v26 = 0;
    sub_23C3149E0();
    sub_23C34EBD4();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v14, v12);
  }
  if (v15 == 3)
  {
    v27 = 1;
    sub_23C31499C();
    sub_23C34EBD4();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v8, v21);
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v14, v12);
  }
  v28 = 2;
  sub_23C314958();
  v17 = v22;
  sub_23C34EBD4();
  v18 = v24;
  sub_23C34EC1C();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v17, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v14, v12);
}

unint64_t sub_23C314914()
{
  unint64_t result;

  result = qword_256B5BA30;
  if (!qword_256B5BA30)
  {
    result = MEMORY[0x24261C66C](&unk_23C35BF84, &type metadata for ServiceSubscriptionLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BA30);
  }
  return result;
}

unint64_t sub_23C314958()
{
  unint64_t result;

  result = qword_256B5BA38;
  if (!qword_256B5BA38)
  {
    result = MEMORY[0x24261C66C](&unk_23C35BF34, &type metadata for ServiceSubscriptionLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BA38);
  }
  return result;
}

unint64_t sub_23C31499C()
{
  unint64_t result;

  result = qword_256B5BA40;
  if (!qword_256B5BA40)
  {
    result = MEMORY[0x24261C66C](&unk_23C35BEE4, &type metadata for ServiceSubscriptionLoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BA40);
  }
  return result;
}

unint64_t sub_23C3149E0()
{
  unint64_t result;

  result = qword_256B5BA48;
  if (!qword_256B5BA48)
  {
    result = MEMORY[0x24261C66C](&unk_23C35BE94, &type metadata for ServiceSubscriptionLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BA48);
  }
  return result;
}

uint64_t ServiceSubscriptionLoadState.init(from:)@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  _QWORD *v37;
  uint64_t v38;
  char v39;
  char v40;
  char v41;

  v34 = a2;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BA50);
  v33 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v36 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BA58);
  v30 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v35 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BA60);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BA68);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v37 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_23C314914();
  v14 = v38;
  sub_23C34ECB8();
  if (v14)
    goto LABEL_9;
  v29 = v5;
  v15 = v35;
  v16 = v36;
  v38 = v10;
  v17 = sub_23C34EBBC();
  if (*(_QWORD *)(v17 + 16) != 1)
  {
    v19 = sub_23C34EAC0();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B576B0);
    *v21 = &type metadata for ServiceSubscriptionLoadState;
    sub_23C34EB44();
    sub_23C34EAB4();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v12, v9);
LABEL_9:
    v28 = (uint64_t)v37;
    return __swift_destroy_boxed_opaque_existential_1(v28);
  }
  if (!*(_BYTE *)(v17 + 32))
  {
    v39 = 0;
    sub_23C3149E0();
    sub_23C34EB38();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v12, v9);
    v18 = 2;
    goto LABEL_11;
  }
  if (*(_BYTE *)(v17 + 32) == 1)
  {
    v40 = 1;
    sub_23C31499C();
    sub_23C34EB38();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v15, v32);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v12, v9);
    v18 = 3;
LABEL_11:
    v28 = (uint64_t)v37;
    *v34 = v18;
    return __swift_destroy_boxed_opaque_existential_1(v28);
  }
  v35 = (char *)v17;
  v41 = 2;
  sub_23C314958();
  v22 = v16;
  v23 = v9;
  sub_23C34EB38();
  v24 = v34;
  v26 = v31;
  v27 = sub_23C34EB8C();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v22, v26);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v12, v23);
  v28 = (uint64_t)v37;
  *v24 = v27 & 1;
  return __swift_destroy_boxed_opaque_existential_1(v28);
}

uint64_t sub_23C314E70@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  return ServiceSubscriptionLoadState.init(from:)(a1, a2);
}

uint64_t sub_23C314E84(_QWORD *a1)
{
  return ServiceSubscriptionLoadState.encode(to:)(a1);
}

BOOL static ServiceSubscriptionLoadState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;

  v2 = *a1;
  v3 = *a2;
  if (v2 == 2)
    return v3 == 2;
  if (v2 == 3)
    return v3 == 3;
  if ((v3 & 0xFE) == 2)
    return 0;
  return (((v2 & 1) == 0) ^ v3) & 1;
}

uint64_t getEnumTagSinglePayload for ServiceSubscriptionLoadState(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t result;
  unsigned int v6;
  unsigned int v7;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
  {
    v6 = *a1;
    if (v6 >= 2)
    {
      v7 = (v6 + 2147483646) & 0x7FFFFFFF;
      result = v7 - 1;
      if (v7 > 1)
        return result;
    }
    return 0;
  }
  v2 = a2 + 3;
  if (a2 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if (v2 >> 8 < 0xFF)
    v3 = 1;
  if (v2 >= 0x100)
    v4 = v3;
  else
    v4 = 0;
  return ((uint64_t (*)(void))((char *)&loc_23C314F48 + 4 * asc_23C35BB60[v4]))();
}

uint64_t storeEnumTagSinglePayload for ServiceSubscriptionLoadState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 3;
  if (a3 + 3 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFD)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_23C314FF4 + 4 * byte_23C35BB6A[v5]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C315028 + 4 * byte_23C35BB65[v5]))();
}

uint64_t sub_23C315028(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C315030(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C315038);
  return result;
}

uint64_t sub_23C315044(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C31504CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C315050(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C315058(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ServiceSubscriptionLoadState()
{
  return &type metadata for ServiceSubscriptionLoadState;
}

uint64_t storeEnumTagSinglePayload for ServiceSubscriptionLoadState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C3150C0 + 4 * byte_23C35BB74[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C3150F4 + 4 * byte_23C35BB6F[v4]))();
}

uint64_t sub_23C3150F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C3150FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C315104);
  return result;
}

uint64_t sub_23C315110(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C315118);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C31511C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C315124(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ServiceSubscriptionLoadState.CodingKeys()
{
  return &type metadata for ServiceSubscriptionLoadState.CodingKeys;
}

ValueMetadata *type metadata accessor for ServiceSubscriptionLoadState.IdleCodingKeys()
{
  return &type metadata for ServiceSubscriptionLoadState.IdleCodingKeys;
}

ValueMetadata *type metadata accessor for ServiceSubscriptionLoadState.FetchingCodingKeys()
{
  return &type metadata for ServiceSubscriptionLoadState.FetchingCodingKeys;
}

uint64_t storeEnumTagSinglePayload for ServiceSubscriptionLoadState.FetchedCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C3151A0 + 4 * byte_23C35BB79[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C3151C0 + 4 * byte_23C35BB7E[v4]))();
}

_BYTE *sub_23C3151A0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C3151C0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C3151C8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C3151D0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C3151D8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C3151E0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ServiceSubscriptionLoadState.FetchedCodingKeys()
{
  return &type metadata for ServiceSubscriptionLoadState.FetchedCodingKeys;
}

unint64_t sub_23C315200()
{
  unint64_t result;

  result = qword_256B5BA70;
  if (!qword_256B5BA70)
  {
    result = MEMORY[0x24261C66C](&unk_23C35BD14, &type metadata for ServiceSubscriptionLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BA70);
  }
  return result;
}

unint64_t sub_23C315248()
{
  unint64_t result;

  result = qword_256B5BA78;
  if (!qword_256B5BA78)
  {
    result = MEMORY[0x24261C66C](&unk_23C35BE6C, &type metadata for ServiceSubscriptionLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BA78);
  }
  return result;
}

unint64_t sub_23C315290()
{
  unint64_t result;

  result = qword_256B5BA80;
  if (!qword_256B5BA80)
  {
    result = MEMORY[0x24261C66C](&unk_23C35BD8C, &type metadata for ServiceSubscriptionLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BA80);
  }
  return result;
}

unint64_t sub_23C3152D8()
{
  unint64_t result;

  result = qword_256B5BA88;
  if (!qword_256B5BA88)
  {
    result = MEMORY[0x24261C66C](&unk_23C35BDB4, &type metadata for ServiceSubscriptionLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BA88);
  }
  return result;
}

unint64_t sub_23C315320()
{
  unint64_t result;

  result = qword_256B5BA90;
  if (!qword_256B5BA90)
  {
    result = MEMORY[0x24261C66C](&unk_23C35BD3C, &type metadata for ServiceSubscriptionLoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BA90);
  }
  return result;
}

unint64_t sub_23C315368()
{
  unint64_t result;

  result = qword_256B5BA98;
  if (!qword_256B5BA98)
  {
    result = MEMORY[0x24261C66C](&unk_23C35BD64, &type metadata for ServiceSubscriptionLoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BA98);
  }
  return result;
}

unint64_t sub_23C3153B0()
{
  unint64_t result;

  result = qword_256B5BAA0;
  if (!qword_256B5BAA0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35BC84, &type metadata for ServiceSubscriptionLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BAA0);
  }
  return result;
}

unint64_t sub_23C3153F8()
{
  unint64_t result;

  result = qword_256B5BAA8;
  if (!qword_256B5BAA8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35BCAC, &type metadata for ServiceSubscriptionLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BAA8);
  }
  return result;
}

unint64_t sub_23C315440()
{
  unint64_t result;

  result = qword_256B5BAB0;
  if (!qword_256B5BAB0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35BDDC, &type metadata for ServiceSubscriptionLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BAB0);
  }
  return result;
}

unint64_t sub_23C315488()
{
  unint64_t result;

  result = qword_256B5BAB8;
  if (!qword_256B5BAB8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35BE04, &type metadata for ServiceSubscriptionLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BAB8);
  }
  return result;
}

uint64_t sub_23C3154CC(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x7263736275537369 && a2 == 0xEC00000064656269)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23C34EC64();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C315560()
{
  return 0x7263736275537369;
}

uint64_t RelatedWorkoutItemContext.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  sub_23C2D2D44();
  return v1;
}

uint64_t RelatedWorkoutItemContext.hash(into:)()
{
  sub_23C34EC88();
  return sub_23C34E8B0();
}

uint64_t sub_23C315600()
{
  sub_23C315F6C();
  return sub_23C34ECD0();
}

uint64_t sub_23C315628()
{
  sub_23C315F6C();
  return sub_23C34ECDC();
}

uint64_t sub_23C315654@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C31663C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C31567C()
{
  sub_23C315FF4();
  return sub_23C34ECD0();
}

uint64_t sub_23C3156A4()
{
  sub_23C315FF4();
  return sub_23C34ECDC();
}

uint64_t sub_23C3156CC()
{
  sub_23C315FB0();
  return sub_23C34ECD0();
}

uint64_t sub_23C3156F4()
{
  sub_23C315FB0();
  return sub_23C34ECDC();
}

uint64_t RelatedWorkoutItemContext.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
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
  char v13;
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
  char v25;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BAC0);
  v19 = *(_QWORD *)(v3 - 8);
  v20 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BAC8);
  v17 = *(_QWORD *)(v6 - 8);
  v18 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BAD0);
  v23 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  v21 = v1[1];
  v22 = v12;
  v13 = *((_BYTE *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C315F6C();
  sub_23C34ECC4();
  if ((v13 & 1) != 0)
  {
    v25 = 1;
    sub_23C315FB0();
    sub_23C34EBD4();
    v14 = v20;
    sub_23C34EC10();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v14);
  }
  else
  {
    v24 = 0;
    sub_23C315FF4();
    sub_23C34EBD4();
    v15 = v18;
    sub_23C34EC10();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v11, v9);
}

uint64_t RelatedWorkoutItemContext.hashValue.getter()
{
  sub_23C34EC7C();
  sub_23C34EC88();
  sub_23C34E8B0();
  return sub_23C34ECAC();
}

uint64_t RelatedWorkoutItemContext.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  int v38;
  char v39;
  char v40;

  v32 = a2;
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BAF0);
  v33 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v34 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BAF8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BB00);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v36 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_23C315F6C();
  v13 = v37;
  sub_23C34ECB8();
  if (v13)
    goto LABEL_6;
  v31 = v5;
  v14 = v4;
  v16 = v34;
  v15 = v35;
  v37 = v9;
  v17 = sub_23C34EBBC();
  if (*(_QWORD *)(v17 + 16) != 1)
  {
    v18 = sub_23C34EAC0();
    swift_allocError();
    v19 = v11;
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B576B0);
    *v21 = &type metadata for RelatedWorkoutItemContext;
    sub_23C34EB44();
    sub_23C34EAB4();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v18);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v19, v8);
LABEL_6:
    v22 = (uint64_t)v36;
    return __swift_destroy_boxed_opaque_existential_1(v22);
  }
  v38 = *(unsigned __int8 *)(v17 + 32);
  if ((v38 & 1) != 0)
  {
    v31 = v17;
    v40 = 1;
    sub_23C315FB0();
    sub_23C34EB38();
    v25 = sub_23C34EB80();
    v27 = v26;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v16, v15);
  }
  else
  {
    v39 = 0;
    sub_23C315FF4();
    v24 = v7;
    sub_23C34EB38();
    v25 = sub_23C34EB80();
    v27 = v28;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v24, v14);
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v8);
  v22 = (uint64_t)v36;
  v29 = v32;
  *v32 = v25;
  v29[1] = v27;
  *((_BYTE *)v29 + 16) = v38;
  return __swift_destroy_boxed_opaque_existential_1(v22);
}

uint64_t sub_23C315D58@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return RelatedWorkoutItemContext.init(from:)(a1, a2);
}

uint64_t sub_23C315D6C(_QWORD *a1)
{
  return RelatedWorkoutItemContext.encode(to:)(a1);
}

uint64_t sub_23C315D80()
{
  sub_23C34EC7C();
  sub_23C34EC88();
  sub_23C34E8B0();
  return sub_23C34ECAC();
}

uint64_t sub_23C315DE0()
{
  sub_23C34EC88();
  return sub_23C34E8B0();
}

uint64_t sub_23C315E20()
{
  sub_23C34EC7C();
  sub_23C34EC88();
  sub_23C34E8B0();
  return sub_23C34ECAC();
}

uint64_t _s20FitnessProductDetail25RelatedWorkoutItemContextO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  if ((a1[2] & 1) != 0)
  {
    if ((a2[2] & 1) != 0)
    {
      if (v2 != v4 || v3 != v5)
      {
LABEL_15:
        v7 = sub_23C34EC64();
        goto LABEL_17;
      }
LABEL_16:
      v7 = 1;
      goto LABEL_17;
    }
  }
  else if ((a2[2] & 1) == 0)
  {
    if (v2 != v4 || v3 != v5)
      goto LABEL_15;
    goto LABEL_16;
  }
  v7 = 0;
LABEL_17:
  sub_23C2D2D44();
  sub_23C2D2D44();
  sub_23C2D200C();
  sub_23C2D200C();
  return v7 & 1;
}

unint64_t sub_23C315F6C()
{
  unint64_t result;

  result = qword_256B5BAD8;
  if (!qword_256B5BAD8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C400, &type metadata for RelatedWorkoutItemContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BAD8);
  }
  return result;
}

unint64_t sub_23C315FB0()
{
  unint64_t result;

  result = qword_256B5BAE0;
  if (!qword_256B5BAE0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C3B0, &type metadata for RelatedWorkoutItemContext.PlaceholderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BAE0);
  }
  return result;
}

unint64_t sub_23C315FF4()
{
  unint64_t result;

  result = qword_256B5BAE8;
  if (!qword_256B5BAE8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C360, &type metadata for RelatedWorkoutItemContext.ItemCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BAE8);
  }
  return result;
}

unint64_t sub_23C31603C()
{
  unint64_t result;

  result = qword_256B5BB08;
  if (!qword_256B5BB08)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for RelatedWorkoutItemContext, &type metadata for RelatedWorkoutItemContext);
    atomic_store(result, (unint64_t *)&qword_256B5BB08);
  }
  return result;
}

uint64_t destroy for RelatedWorkoutItemContext()
{
  return sub_23C2D200C();
}

uint64_t _s20FitnessProductDetail25RelatedWorkoutItemContextOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_23C2D2D44();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for RelatedWorkoutItemContext(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_23C2D2D44();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_23C2D200C();
  return a1;
}

uint64_t assignWithTake for RelatedWorkoutItemContext(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_23C2D200C();
  return a1;
}

uint64_t getEnumTagSinglePayload for RelatedWorkoutItemContext(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for RelatedWorkoutItemContext(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_23C316200(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RelatedWorkoutItemContext()
{
  return &type metadata for RelatedWorkoutItemContext;
}

uint64_t storeEnumTagSinglePayload for RelatedWorkoutItemContext.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C316268 + 4 * byte_23C35C015[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C31629C + 4 * byte_23C35C010[v4]))();
}

uint64_t sub_23C31629C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C3162A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C3162ACLL);
  return result;
}

uint64_t sub_23C3162B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C3162C0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C3162C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C3162CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RelatedWorkoutItemContext.CodingKeys()
{
  return &type metadata for RelatedWorkoutItemContext.CodingKeys;
}

ValueMetadata *type metadata accessor for RelatedWorkoutItemContext.ItemCodingKeys()
{
  return &type metadata for RelatedWorkoutItemContext.ItemCodingKeys;
}

uint64_t _s20FitnessProductDetail25RelatedWorkoutItemContextO14ItemCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C31633C + 4 * byte_23C35C01A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C31635C + 4 * byte_23C35C01F[v4]))();
}

_BYTE *sub_23C31633C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C31635C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C316364(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C31636C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C316374(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C31637C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for RelatedWorkoutItemContext.PlaceholderCodingKeys()
{
  return &type metadata for RelatedWorkoutItemContext.PlaceholderCodingKeys;
}

unint64_t sub_23C31639C()
{
  unint64_t result;

  result = qword_256B5BB10;
  if (!qword_256B5BB10)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C1C8, &type metadata for RelatedWorkoutItemContext.PlaceholderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BB10);
  }
  return result;
}

unint64_t sub_23C3163E4()
{
  unint64_t result;

  result = qword_256B5BB18;
  if (!qword_256B5BB18)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C280, &type metadata for RelatedWorkoutItemContext.ItemCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BB18);
  }
  return result;
}

unint64_t sub_23C31642C()
{
  unint64_t result;

  result = qword_256B5BB20;
  if (!qword_256B5BB20)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C338, &type metadata for RelatedWorkoutItemContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BB20);
  }
  return result;
}

unint64_t sub_23C316474()
{
  unint64_t result;

  result = qword_256B5BB28;
  if (!qword_256B5BB28)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C1F0, &type metadata for RelatedWorkoutItemContext.ItemCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BB28);
  }
  return result;
}

unint64_t sub_23C3164BC()
{
  unint64_t result;

  result = qword_256B5BB30;
  if (!qword_256B5BB30)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C218, &type metadata for RelatedWorkoutItemContext.ItemCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BB30);
  }
  return result;
}

unint64_t sub_23C316504()
{
  unint64_t result;

  result = qword_256B5BB38;
  if (!qword_256B5BB38)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C138, &type metadata for RelatedWorkoutItemContext.PlaceholderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BB38);
  }
  return result;
}

unint64_t sub_23C31654C()
{
  unint64_t result;

  result = qword_256B5BB40;
  if (!qword_256B5BB40)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C160, &type metadata for RelatedWorkoutItemContext.PlaceholderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BB40);
  }
  return result;
}

unint64_t sub_23C316594()
{
  unint64_t result;

  result = qword_256B5BB48;
  if (!qword_256B5BB48)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C2A8, &type metadata for RelatedWorkoutItemContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BB48);
  }
  return result;
}

unint64_t sub_23C3165DC()
{
  unint64_t result;

  result = qword_256B5BB50;
  if (!qword_256B5BB50)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C2D0, &type metadata for RelatedWorkoutItemContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BB50);
  }
  return result;
}

uint64_t sub_23C316620()
{
  return 0x696669746E656469;
}

uint64_t sub_23C31663C(uint64_t a1, uint64_t a2)
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
    v3 = sub_23C34EC64();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t TrainerTipGalleryLayout.contentMargins.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23C34DC38();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t TrainerTipGalleryLayout.init(contentMargins:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_23C34DC38();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t sub_23C316748@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C317098(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C316770()
{
  sub_23C3168C8();
  return sub_23C34ECD0();
}

uint64_t sub_23C316798()
{
  sub_23C3168C8();
  return sub_23C34ECDC();
}

uint64_t TrainerTipGalleryLayout.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BB58);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C3168C8();
  sub_23C34ECC4();
  sub_23C34DC38();
  sub_23C316B04(&qword_256B59B58, MEMORY[0x24BE34BA8]);
  sub_23C34EC40();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_23C3168C8()
{
  unint64_t result;

  result = qword_256B5BB60;
  if (!qword_256B5BB60)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C5BC, &type metadata for TrainerTipGalleryLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BB60);
  }
  return result;
}

uint64_t TrainerTipGalleryLayout.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  v17 = sub_23C34DC38();
  v14 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v16 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BB68);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for TrainerTipGalleryLayout();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C3168C8();
  sub_23C34ECB8();
  if (!v2)
  {
    sub_23C316B04(&qword_256B59B70, MEMORY[0x24BE34BB8]);
    sub_23C34EBB0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v16, v17);
    sub_23C316B44((uint64_t)v11, v15);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t type metadata accessor for TrainerTipGalleryLayout()
{
  uint64_t result;

  result = qword_256B5BBC8;
  if (!qword_256B5BBC8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23C316B04(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23C34DC38();
    result = MEMORY[0x24261C66C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C316B44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TrainerTipGalleryLayout();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C316B88@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TrainerTipGalleryLayout.init(from:)(a1, a2);
}

uint64_t sub_23C316B9C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BB58);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C3168C8();
  sub_23C34ECC4();
  sub_23C34DC38();
  sub_23C316B04(&qword_256B59B58, MEMORY[0x24BE34BA8]);
  sub_23C34EC40();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t initializeBufferWithCopyOfBuffer for TrainerTipGalleryLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C34DC38();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for EditorialDetailLayout(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23C34DC38();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for TrainerTipGalleryLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C34DC38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for TrainerTipGalleryLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C34DC38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for TrainerTipGalleryLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C34DC38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for TrainerTipGalleryLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C34DC38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrainerTipGalleryLayout()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C316E34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C34DC38();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for TrainerTipGalleryLayout()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C316E7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C34DC38();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_23C316EBC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23C34DC38();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TrainerTipGalleryLayout.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C316F64 + 4 * byte_23C35C450[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C316F84 + 4 * byte_23C35C455[v4]))();
}

_BYTE *sub_23C316F64(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C316F84(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C316F8C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C316F94(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C316F9C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C316FA4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipGalleryLayout.CodingKeys()
{
  return &type metadata for TrainerTipGalleryLayout.CodingKeys;
}

unint64_t sub_23C316FC4()
{
  unint64_t result;

  result = qword_256B5BC00;
  if (!qword_256B5BC00)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C594, &type metadata for TrainerTipGalleryLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BC00);
  }
  return result;
}

unint64_t sub_23C31700C()
{
  unint64_t result;

  result = qword_256B5BC08;
  if (!qword_256B5BC08)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C504, &type metadata for TrainerTipGalleryLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BC08);
  }
  return result;
}

unint64_t sub_23C317054()
{
  unint64_t result;

  result = qword_256B5BC10;
  if (!qword_256B5BC10)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C52C, &type metadata for TrainerTipGalleryLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BC10);
  }
  return result;
}

uint64_t sub_23C317098(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x4D746E65746E6F63 && a2 == 0xEE00736E69677261)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23C34EC64();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C317134()
{
  return 0x4D746E65746E6F63;
}

uint64_t WorkoutDetailArtwork.init(backgroundColor:templateURL:textColor:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t result;
  _QWORD *v11;

  sub_23C2894C8(a1, a5, &qword_256B57E18);
  v9 = type metadata accessor for WorkoutDetailArtwork();
  result = sub_23C2894C8(a2, a5 + *(int *)(v9 + 20), &qword_256B57E20);
  v11 = (_QWORD *)(a5 + *(int *)(v9 + 24));
  *v11 = a3;
  v11[1] = a4;
  return result;
}

uint64_t WorkoutDetailArtwork.backgroundColor.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C28950C(v1, a1, &qword_256B57E18);
}

uint64_t WorkoutDetailArtwork.templateURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for WorkoutDetailArtwork();
  return sub_23C28950C(v1 + *(int *)(v3 + 20), a1, &qword_256B57E20);
}

uint64_t WorkoutDetailArtwork.textColor.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for WorkoutDetailArtwork() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23C317270(char a1)
{
  return qword_23C35C838[a1];
}

uint64_t sub_23C317290()
{
  char *v0;

  return sub_23C317270(*v0);
}

uint64_t sub_23C317298()
{
  sub_23C318918();
  return sub_23C34ECD0();
}

uint64_t sub_23C3172C0()
{
  sub_23C318918();
  return sub_23C34ECDC();
}

uint64_t WorkoutDetailArtwork.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BC18);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C318918();
  sub_23C34ECC4();
  v8[15] = 0;
  sub_23C34DA94();
  sub_23C27FEE4(&qword_256B58100, (uint64_t (*)(uint64_t))MEMORY[0x24BE34FA0], MEMORY[0x24BE34FB0]);
  sub_23C34EC04();
  if (!v1)
  {
    type metadata accessor for WorkoutDetailArtwork();
    v8[14] = 1;
    sub_23C34D950();
    sub_23C27FEE4(&qword_256B58108, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
    sub_23C34EC04();
    v8[13] = 2;
    sub_23C34EC10();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t WorkoutDetailArtwork.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  _QWORD *v28;
  char v29;
  char v30;
  char v31;

  v25 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E18);
  MEMORY[0x24BDAC7A8](v7);
  v26 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BC28);
  v9 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for WorkoutDetailArtwork();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a1[3];
  v28 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v15);
  sub_23C318918();
  sub_23C34ECB8();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  v16 = v9;
  v17 = (uint64_t)v14;
  sub_23C34DA94();
  v31 = 0;
  sub_23C27FEE4(&qword_256B58118, (uint64_t (*)(uint64_t))MEMORY[0x24BE34FA0], MEMORY[0x24BE34FC8]);
  v18 = (uint64_t)v26;
  v19 = v27;
  sub_23C34EB74();
  sub_23C2894C8(v18, v17, &qword_256B57E18);
  sub_23C34D950();
  v30 = 1;
  sub_23C27FEE4(&qword_256B58120, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
  sub_23C34EB74();
  sub_23C2894C8((uint64_t)v6, v17 + *(int *)(v12 + 20), &qword_256B57E20);
  v29 = 2;
  v20 = sub_23C34EB80();
  v22 = v21;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v19);
  v23 = (uint64_t *)(v17 + *(int *)(v12 + 24));
  *v23 = v20;
  v23[1] = v22;
  sub_23C31895C(v17, v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  return sub_23C3189A0(v17);
}

uint64_t sub_23C3177EC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return WorkoutDetailArtwork.init(from:)(a1, a2);
}

uint64_t sub_23C317800(_QWORD *a1)
{
  return WorkoutDetailArtwork.encode(to:)(a1);
}

uint64_t WorkoutDetailArtwork.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  char *v18;
  uint64_t v19;

  v1 = v0;
  v2 = sub_23C34D950();
  v19 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v18 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23C34DA94();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E18);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C28950C(v1, (uint64_t)v13, &qword_256B57E18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1, v7) == 1)
  {
    sub_23C34EC94();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v13, v7);
    sub_23C34EC94();
    sub_23C27FEE4(&qword_256B57EE8, (uint64_t (*)(uint64_t))MEMORY[0x24BE34FA0], MEMORY[0x24BE34FB8]);
    sub_23C34E838();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  v14 = type metadata accessor for WorkoutDetailArtwork();
  sub_23C28950C(v1 + *(int *)(v14 + 20), (uint64_t)v6, &qword_256B57E20);
  v15 = v19;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v6, 1, v2) == 1)
  {
    sub_23C34EC94();
  }
  else
  {
    v16 = v18;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v6, v2);
    sub_23C34EC94();
    sub_23C27FEE4(&qword_256B57EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
    sub_23C34E838();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v16, v2);
  }
  swift_bridgeObjectRetain();
  sub_23C34E8B0();
  return swift_bridgeObjectRelease();
}

uint64_t WorkoutDetailArtwork.hashValue.getter()
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
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v1 = v0;
  v2 = sub_23C34D950();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23C34DA94();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E18);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C34EC7C();
  sub_23C28950C(v1, (uint64_t)v15, &qword_256B57E18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v15, 1, v9) == 1)
  {
    sub_23C34EC94();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
    sub_23C34EC94();
    sub_23C27FEE4(&qword_256B57EE8, (uint64_t (*)(uint64_t))MEMORY[0x24BE34FA0], MEMORY[0x24BE34FB8]);
    sub_23C34E838();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  v16 = type metadata accessor for WorkoutDetailArtwork();
  sub_23C28950C(v1 + *(int *)(v16 + 20), (uint64_t)v8, &qword_256B57E20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    sub_23C34EC94();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_23C34EC94();
    sub_23C27FEE4(&qword_256B57EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
    sub_23C34E838();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_23C34E8B0();
  return sub_23C34ECAC();
}

uint64_t sub_23C317D6C(uint64_t a1, uint64_t a2)
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
  char *v17;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;

  v22 = a2;
  v3 = v2;
  v4 = sub_23C34D950();
  v21 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v20 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23C34DA94();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E18);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C28950C(v3, (uint64_t)v15, &qword_256B57E18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v15, 1, v9) == 1)
  {
    sub_23C34EC94();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
    sub_23C34EC94();
    sub_23C27FEE4(&qword_256B57EE8, (uint64_t (*)(uint64_t))MEMORY[0x24BE34FA0], MEMORY[0x24BE34FB8]);
    sub_23C34E838();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  sub_23C28950C(v3 + *(int *)(v22 + 20), (uint64_t)v8, &qword_256B57E20);
  v16 = v21;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v8, 1, v4) == 1)
  {
    sub_23C34EC94();
  }
  else
  {
    v17 = v20;
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v20, v8, v4);
    sub_23C34EC94();
    sub_23C27FEE4(&qword_256B57EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
    sub_23C34E838();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v17, v4);
  }
  return sub_23C34E8B0();
}

uint64_t sub_23C31800C(uint64_t a1, uint64_t a2)
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
  char *v16;
  uint64_t v18;
  char *v19;
  uint64_t v20;

  v20 = a2;
  v3 = sub_23C34D950();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v19 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23C34DA94();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E18);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C34EC7C();
  sub_23C28950C(v2, (uint64_t)v15, &qword_256B57E18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v15, 1, v9) == 1)
  {
    sub_23C34EC94();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
    sub_23C34EC94();
    sub_23C27FEE4(&qword_256B57EE8, (uint64_t (*)(uint64_t))MEMORY[0x24BE34FA0], MEMORY[0x24BE34FB8]);
    sub_23C34E838();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  sub_23C28950C(v2 + *(int *)(v20 + 20), (uint64_t)v8, &qword_256B57E20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v8, 1, v3) == 1)
  {
    sub_23C34EC94();
  }
  else
  {
    v16 = v19;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v19, v8, v3);
    sub_23C34EC94();
    sub_23C27FEE4(&qword_256B57EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
    sub_23C34E838();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v16, v3);
  }
  sub_23C34E8B0();
  return sub_23C34ECAC();
}

uint64_t _s20FitnessProductDetail07WorkoutC7ArtworkV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unsigned int (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t *v29;
  uint64_t v30;
  char *v31;
  char v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int (*v42)(uint64_t, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  char v45;
  char *v47;
  char v48;
  void (*v49)(char *, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v61 = sub_23C34D950();
  v59 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v55 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58200);
  MEMORY[0x24BDAC7A8](v58);
  v60 = (uint64_t)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
  MEMORY[0x24BDAC7A8](v6);
  v56 = (uint64_t)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v65 = (uint64_t)&v54 - v9;
  MEMORY[0x24BDAC7A8](v10);
  v64 = (uint64_t)&v54 - v11;
  v12 = sub_23C34DA94();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v57 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58208);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E18);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v54 - v22;
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v54 - v25;
  v62 = a1;
  sub_23C28950C(a1, (uint64_t)&v54 - v25, &qword_256B57E18);
  v63 = a2;
  sub_23C28950C(a2, (uint64_t)v23, &qword_256B57E18);
  v27 = (uint64_t)&v17[*(int *)(v15 + 48)];
  sub_23C28950C((uint64_t)v26, (uint64_t)v17, &qword_256B57E18);
  sub_23C28950C((uint64_t)v23, v27, &qword_256B57E18);
  v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  if (v28((uint64_t)v17, 1, v12) == 1)
  {
    sub_23C285184((uint64_t)v23, &qword_256B57E18);
    sub_23C285184((uint64_t)v26, &qword_256B57E18);
    if (v28(v27, 1, v12) == 1)
    {
      sub_23C285184((uint64_t)v17, &qword_256B57E18);
      goto LABEL_8;
    }
LABEL_6:
    v29 = &qword_256B58208;
    v30 = (uint64_t)v17;
LABEL_14:
    sub_23C285184(v30, v29);
    goto LABEL_15;
  }
  sub_23C28950C((uint64_t)v17, (uint64_t)v20, &qword_256B57E18);
  if (v28(v27, 1, v12) == 1)
  {
    sub_23C285184((uint64_t)v23, &qword_256B57E18);
    sub_23C285184((uint64_t)v26, &qword_256B57E18);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v20, v12);
    goto LABEL_6;
  }
  v31 = v57;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v57, v27, v12);
  sub_23C27FEE4(&qword_256B58218, (uint64_t (*)(uint64_t))MEMORY[0x24BE34FA0], MEMORY[0x24BE34FC0]);
  v32 = sub_23C34E850();
  v33 = *(void (**)(char *, uint64_t))(v13 + 8);
  v33(v31, v12);
  sub_23C285184((uint64_t)v23, &qword_256B57E18);
  sub_23C285184((uint64_t)v26, &qword_256B57E18);
  v33(v20, v12);
  sub_23C285184((uint64_t)v17, &qword_256B57E18);
  if ((v32 & 1) == 0)
    goto LABEL_15;
LABEL_8:
  v34 = type metadata accessor for WorkoutDetailArtwork();
  v35 = v62;
  v36 = v64;
  sub_23C28950C(v62 + *(int *)(v34 + 20), v64, &qword_256B57E20);
  v37 = v63;
  v38 = v65;
  sub_23C28950C(v63 + *(int *)(v34 + 20), v65, &qword_256B57E20);
  v39 = v60;
  v40 = v60 + *(int *)(v58 + 48);
  sub_23C28950C(v36, v60, &qword_256B57E20);
  sub_23C28950C(v38, v40, &qword_256B57E20);
  v41 = v59;
  v42 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v59 + 48);
  v43 = v61;
  if (v42(v39, 1, v61) != 1)
  {
    v44 = v56;
    sub_23C28950C(v39, v56, &qword_256B57E20);
    if (v42(v40, 1, v43) == 1)
    {
      sub_23C285184(v65, &qword_256B57E20);
      sub_23C285184(v36, &qword_256B57E20);
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v44, v43);
      goto LABEL_13;
    }
    v47 = v55;
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 32))(v55, v40, v43);
    sub_23C27FEE4(&qword_256B58210, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB00]);
    v48 = sub_23C34E850();
    v49 = *(void (**)(char *, uint64_t))(v41 + 8);
    v49(v47, v43);
    sub_23C285184(v65, &qword_256B57E20);
    sub_23C285184(v64, &qword_256B57E20);
    v49((char *)v44, v43);
    sub_23C285184(v39, &qword_256B57E20);
    if ((v48 & 1) != 0)
      goto LABEL_18;
LABEL_15:
    v45 = 0;
    return v45 & 1;
  }
  sub_23C285184(v38, &qword_256B57E20);
  sub_23C285184(v36, &qword_256B57E20);
  if (v42(v40, 1, v43) != 1)
  {
LABEL_13:
    v29 = &qword_256B58200;
    v30 = v39;
    goto LABEL_14;
  }
  sub_23C285184(v39, &qword_256B57E20);
LABEL_18:
  v50 = *(int *)(v34 + 24);
  v51 = *(_QWORD *)(v35 + v50);
  v52 = *(_QWORD *)(v35 + v50 + 8);
  v53 = (_QWORD *)(v37 + v50);
  if (v51 == *v53 && v52 == v53[1])
    v45 = 1;
  else
    v45 = sub_23C34EC64();
  return v45 & 1;
}

uint64_t type metadata accessor for WorkoutDetailArtwork()
{
  uint64_t result;

  result = qword_256B5BC90;
  if (!qword_256B5BC90)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23C318918()
{
  unint64_t result;

  result = qword_256B5BC20;
  if (!qword_256B5BC20)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C7E4, &type metadata for WorkoutDetailArtwork.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BC20);
  }
  return result;
}

uint64_t sub_23C31895C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WorkoutDetailArtwork();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C3189A0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for WorkoutDetailArtwork();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C3189DC()
{
  return sub_23C27FEE4(&qword_256B5BC30, (uint64_t (*)(uint64_t))type metadata accessor for WorkoutDetailArtwork, (uint64_t)&protocol conformance descriptor for WorkoutDetailArtwork);
}

uint64_t getEnumTagSinglePayload for WorkoutDetailArtwork()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C318A14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E18);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for WorkoutDetailArtwork()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C318AD4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E18);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

void sub_23C318B84()
{
  unint64_t v0;
  unint64_t v1;

  sub_23C2906B4(319, &qword_256B581B0, (void (*)(uint64_t))MEMORY[0x24BE34FA0]);
  if (v0 <= 0x3F)
  {
    sub_23C2906B4(319, qword_256B581B8, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t storeEnumTagSinglePayload for WorkoutDetailArtwork.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C318C7C + 4 * byte_23C35C615[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C318CB0 + 4 * byte_23C35C610[v4]))();
}

uint64_t sub_23C318CB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C318CB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C318CC0);
  return result;
}

uint64_t sub_23C318CCC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C318CD4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C318CD8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C318CE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WorkoutDetailArtwork.CodingKeys()
{
  return &type metadata for WorkoutDetailArtwork.CodingKeys;
}

unint64_t sub_23C318D00()
{
  unint64_t result;

  result = qword_256B5BCD0;
  if (!qword_256B5BCD0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C7BC, &type metadata for WorkoutDetailArtwork.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BCD0);
  }
  return result;
}

unint64_t sub_23C318D48()
{
  unint64_t result;

  result = qword_256B5BCD8;
  if (!qword_256B5BCD8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C72C, &type metadata for WorkoutDetailArtwork.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BCD8);
  }
  return result;
}

unint64_t sub_23C318D90()
{
  unint64_t result;

  result = qword_256B5BCE0;
  if (!qword_256B5BCE0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35C754, &type metadata for WorkoutDetailArtwork.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5BCE0);
  }
  return result;
}

uint64_t WorkoutContextMenuPreviewEnvironment.init(fetchContextMenuPreviewContent:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

ValueMetadata *type metadata accessor for WorkoutContextMenuPreviewEnvironment()
{
  return &type metadata for WorkoutContextMenuPreviewEnvironment;
}

uint64_t sub_23C318DEC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[5];
  char v18;

  v8 = sub_23C34E0DC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  if ((a3 & 1) == 0)
    sub_23C34DD28();
  v17[1] = v12;
  v17[2] = v13;
  v17[3] = v14;
  v17[4] = v15;
  v18 = a3 & 1;
  sub_23C34E0D0();
  MEMORY[0x24261BBD4](v11, a4, v8, a5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_23C318EE0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BE58);
  sub_23C28943C(&qword_256B5BE60, &qword_256B5BE58, MEMORY[0x24BE2B5E8]);
  return sub_23C34DD58();
}

uint64_t sub_23C318F50()
{
  uint64_t v0;
  __n128 v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t, uint64_t, __n128);
  uint64_t v7;
  uint64_t v9;

  v0 = sub_23C34E520();
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *MEMORY[0x24BDF3C28];
  v6 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v5 + 104);
  v6(v3, v4, v0, v1);
  v7 = MEMORY[0x24261BC64](v3, 0.650980392, 1.0, 0.0, 1.0);
  ((void (*)(char *, uint64_t, uint64_t))v6)(v3, v4, v0);
  MEMORY[0x24261BC64](v3, 0.109803922, 0.109803922, 0.117647059, 1.0);
  return v7;
}

uint64_t ProgramDetailView.init(store:workoutsCanvasViewBuilder:artworkViewBuilder:textViewBuilder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;

  v17 = sub_23C318F50();
  v19 = v18;
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)a9 = sub_23C286DF0;
  *(_QWORD *)(a9 + 8) = result;
  *(_BYTE *)(a9 + 16) = 0;
  *(_QWORD *)(a9 + 24) = a5;
  *(_QWORD *)(a9 + 32) = a6;
  *(_QWORD *)(a9 + 40) = v17;
  *(_QWORD *)(a9 + 48) = v19;
  *(_QWORD *)(a9 + 56) = a7;
  *(_QWORD *)(a9 + 64) = a8;
  *(_QWORD *)(a9 + 72) = a3;
  *(_QWORD *)(a9 + 80) = a4;
  return result;
}

uint64_t sub_23C3190E8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C31910C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v42[2];
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
  _QWORD v57[2];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  _OWORD v64[2];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;

  v8 = a6;
  v48 = a5;
  v55 = a4;
  v54 = a3;
  v53 = a2;
  v52 = a1;
  v56 = a7;
  v51 = *(_QWORD *)(a6 + 16);
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCF8);
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD00);
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD08);
  swift_getTupleTypeMetadata2();
  v9 = sub_23C34E700();
  v10 = MEMORY[0x24BDF5428];
  v45 = v9;
  v44 = MEMORY[0x24261C66C](MEMORY[0x24BDF5428], v9);
  v11 = sub_23C34E64C();
  v46 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v47 = (uint64_t)v42 - v15;
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCE8);
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCF0);
  swift_getTupleTypeMetadata2();
  v16 = sub_23C34E700();
  v42[1] = MEMORY[0x24261C66C](v10, v16);
  v17 = sub_23C34E64C();
  v43 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)v42 - v21;
  v50 = sub_23C34E010();
  v49 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v24 = (char *)v42 - v23;
  v25 = *(_OWORD *)(v7 + 48);
  v26 = *(_OWORD *)(v7 + 16);
  v65 = *(_OWORD *)(v7 + 32);
  v66 = v25;
  v27 = *(_OWORD *)(v7 + 48);
  v67 = *(_OWORD *)(v7 + 64);
  v28 = *(_OWORD *)(v7 + 16);
  v64[0] = *(_OWORD *)v7;
  v64[1] = v28;
  v60 = v65;
  v61 = v27;
  v62 = *(_OWORD *)(v7 + 64);
  v68 = *(_QWORD *)(v7 + 80);
  v63 = *(_QWORD *)(v7 + 80);
  v58 = v64[0];
  v59 = v26;
  v29 = v8;
  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  LOBYTE(v8) = BYTE1(v60);
  v30 = sub_23C34DFEC();
  MEMORY[0x24BDAC7A8](v30);
  v42[-10] = v51;
  *(_OWORD *)&v42[-9] = *(_OWORD *)(v29 + 24);
  v42[-7] = *(_QWORD *)(v29 + 40);
  v42[-6] = v64;
  v31 = v53;
  v42[-5] = v52;
  v42[-4] = v31;
  v32 = v55;
  v42[-3] = v54;
  v42[-2] = v32;
  if ((v8 & 1) != 0)
  {
    v42[-1] = v48;
    sub_23C34E640();
    v33 = MEMORY[0x24BDF4700];
    MEMORY[0x24261C66C](MEMORY[0x24BDF4700], v11);
    v34 = v47;
    sub_23C28958C((uint64_t)v13, v11, v47);
    v35 = *(void (**)(char *, uint64_t))(v46 + 8);
    v35(v13, v11);
    sub_23C287D30(v34, v11, (uint64_t)v13);
    MEMORY[0x24261C66C](v33, v17);
    sub_23C328C04((uint64_t)v13, v17, v11);
    v35(v13, v11);
    v36 = (char *)v34;
    v37 = v11;
  }
  else
  {
    sub_23C34E640();
    v33 = MEMORY[0x24BDF4700];
    MEMORY[0x24261C66C](MEMORY[0x24BDF4700], v17);
    sub_23C28958C((uint64_t)v19, v17, (uint64_t)v22);
    v35 = *(void (**)(char *, uint64_t))(v43 + 8);
    v35(v19, v17);
    sub_23C287D30((uint64_t)v22, v17, (uint64_t)v19);
    MEMORY[0x24261C66C](v33, v11);
    sub_23C328CC8((uint64_t)v19, v17);
    v35(v19, v17);
    v36 = v22;
    v37 = v17;
  }
  v35(v36, v37);
  v38 = MEMORY[0x24261C66C](v33, v17);
  v39 = MEMORY[0x24261C66C](v33, v11);
  v57[0] = v38;
  v57[1] = v39;
  v40 = v50;
  MEMORY[0x24261C66C](MEMORY[0x24BDEF3E0], v50, v57);
  sub_23C287D30((uint64_t)v24, v40, v56);
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v24, v40);
}

void sub_23C319790(void (**a1)(uint64_t, __n128)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
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
  uint64_t v25;
  uint64_t v26;
  __n128 v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
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
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  void (*v65)(uint64_t, __n128);

  v54 = a4;
  v55 = a7;
  v52 = a3;
  v53 = a5;
  v33 = a2;
  v49 = a9;
  v50 = a10;
  v13 = *(_QWORD *)(a6 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23C34DE30();
  v35 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v17 = sub_23C34DE30();
  v39 = *(_QWORD *)(v17 - 8);
  v37 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v34 = (char *)&v32 - v18;
  v19 = sub_23C34DE30();
  v44 = *(_QWORD *)(v19 - 8);
  v38 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v36 = (char *)&v32 - v20;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCE8);
  v21 = sub_23C34DE30();
  v46 = *(_QWORD *)(v21 - 8);
  v42 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v40 = (char *)&v32 - v22;
  v45 = sub_23C34DE30();
  v47 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v48 = (char *)&v32 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v41 = (char *)&v32 - v25;
  v27 = MEMORY[0x24BDAC7A8](v26);
  v43 = (char *)&v32 - v28;
  a1[3](v33, v27);
  sub_23C34DE3C();
  sub_23C34E16C();
  sub_23C34E424();
  v29 = *(void (**)(char *, uint64_t))(v13 + 8);
  v51 = a6;
  v29(v15, a6);
  v30 = *((_OWORD *)a1 + 3);
  v62 = *((_OWORD *)a1 + 2);
  v63 = v30;
  v64 = *((_OWORD *)a1 + 4);
  v65 = a1[10];
  v31 = *((_OWORD *)a1 + 1);
  v60 = *(_OWORD *)a1;
  v61 = v31;
  v56 = a6;
  v57 = v55;
  v58 = a8;
  v59 = a10;
  type metadata accessor for ProgramDetailView();
}

void sub_23C319A4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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

  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  v6 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v0 + 1424) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v0 + 1440) = v6;
  *(_OWORD *)(v0 + 1456) = *(_OWORD *)(v1 + 64);
  *(_QWORD *)(v0 + 1472) = *(_QWORD *)(v1 + 80);
  v7 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v0 + 1392) = *(_OWORD *)v1;
  *(_OWORD *)(v0 + 1408) = v7;
  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  v8 = MEMORY[0x24BDF1050];
  v9 = v3;
  *(_QWORD *)v0 = v3;
  *(_QWORD *)(v5 - 120) = v3;
  *(_QWORD *)(v5 - 112) = v8;
  v10 = MEMORY[0x24BDED308];
  v11 = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v2, v5 - 120);
  v12 = *(_QWORD *)(v0 + 16);
  sub_23C34E3C4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 24) + 8))(v4, v2);
  sub_23C34E184();
  v13 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v0 + 1424) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v0 + 1440) = v13;
  *(_OWORD *)(v0 + 1456) = *(_OWORD *)(v1 + 64);
  *(_QWORD *)(v0 + 1472) = *(_QWORD *)(v1 + 80);
  v14 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v0 + 1392) = *(_OWORD *)v1;
  *(_OWORD *)(v0 + 1408) = v14;
  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  v15 = MEMORY[0x24BDEEC40];
  *(_QWORD *)(v0 + 704) = v11;
  *(_QWORD *)(v0 + 712) = v15;
  v16 = v10;
  v17 = *(_QWORD *)(v0 + 40);
  v18 = MEMORY[0x24261C66C](v10, v17, v0 + 704);
  v19 = *(_QWORD *)(v0 + 32);
  sub_23C34E4B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 56) + 8))(v12, v17);
  sub_23C34E6DC();
  v20 = *(_QWORD *)(v0 + 184);
  *(_QWORD *)(v0 + 208) = *(_QWORD *)(v0 + 152);
  *(_QWORD *)(v0 + 216) = v20;
  v21 = *(_QWORD *)(v0 + 144);
  *(_QWORD *)(v0 + 224) = v9;
  *(_QWORD *)(v0 + 232) = v21;
  v22 = *(_QWORD *)(v0 + 160);
  *(_QWORD *)(v0 + 240) = v1;
  *(_QWORD *)(v0 + 248) = v22;
  v23 = *(_QWORD *)(v0 + 168);
  *(_QWORD *)(v0 + 256) = *(_QWORD *)(v0 + 176);
  *(_QWORD *)(v0 + 264) = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C050);
  v24 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v0 + 688) = v18;
  *(_QWORD *)(v0 + 696) = v24;
  v25 = v16;
  v26 = *(_QWORD *)(v0 + 48);
  v27 = MEMORY[0x24261C66C](v25, v26, v0 + 688);
  sub_23C28943C(&qword_256B5C058, &qword_256B5C050, MEMORY[0x24BDF4750]);
  v28 = *(_QWORD *)(v0 + 64);
  sub_23C34E4A8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 96) + 8))(v19, v26);
  v29 = sub_23C28943C(&qword_256B5C060, &qword_256B5BCE8, MEMORY[0x24BDEDC10]);
  *(_QWORD *)(v0 + 672) = v27;
  *(_QWORD *)(v0 + 680) = v29;
  v30 = MEMORY[0x24BDED308];
  v31 = *(_QWORD *)(v0 + 80);
  v32 = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v31, v0 + 672);
  v33 = *(_QWORD *)(v0 + 72);
  sub_23C34E4FC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 112) + 8))(v28, v31);
  v34 = MEMORY[0x24BDEDB80];
  *(_QWORD *)(v0 + 656) = v32;
  *(_QWORD *)(v0 + 664) = v34;
  v35 = *(_QWORD *)(v0 + 104);
  MEMORY[0x24261C66C](v30, v35, v0 + 656);
  sub_23C28958C(v33, v35, *(_QWORD *)(v0 + 88));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 120) + 8))(v33, v35);
  sub_23C31AA50((__int128 *)v1, *(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 184), *(_QWORD *)v0, *(_QWORD *)(v0 + 144));
}

uint64_t sub_23C319E10()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  memcpy((void *)(v0 + 1056), (const void *)(v0 + 720), 0x149uLL);
  v6 = *(_QWORD *)(v0 + 128);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v6, v4, v3);
  *(_QWORD *)(v0 + 640) = v6;
  memcpy((void *)(v0 + 304), (const void *)(v0 + 1056), 0x149uLL);
  *(_WORD *)(v0 + 633) = 256;
  *(_QWORD *)(v0 + 648) = v0 + 304;
  sub_23C324818(v0 + 720, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23C32449C);
  *(_QWORD *)(v0 + 288) = v3;
  *(_QWORD *)(v0 + 296) = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BCF0);
  *(_QWORD *)(v0 + 272) = v1;
  *(_QWORD *)(v0 + 280) = sub_23C3245A4();
  sub_23C328D8C((uint64_t *)(v0 + 640), 2uLL, v0 + 288);
  sub_23C324818(v0 + 720, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23C324710);
  v2(v4, v3);
  memcpy((void *)(v0 + 1392), (const void *)(v0 + 304), 0x14BuLL);
  sub_23C324818(v0 + 1392, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23C324710);
  return ((uint64_t (*)(uint64_t, uint64_t))v2)(v6, v3);
}

void sub_23C319F14()
{
  sub_23C34E6DC();
  sub_23C319FEC();
}

void *sub_23C319F8C()
{
  uint64_t v0;
  uint64_t v1;
  void *v3;
  _BYTE v4[368];
  _QWORD v5[61];

  sub_23C2894C8((uint64_t)v5, (uint64_t)v4, &qword_256B5C0A0);
  v5[0] = v1;
  v5[1] = v0;
  sub_23C2894C8((uint64_t)v4, (uint64_t)&v5[2], &qword_256B5C0A0);
  return memcpy(v3, v5, 0x179uLL);
}

void sub_23C319FEC()
{
  type metadata accessor for ProgramDetailView();
}

uint64_t sub_23C31A078()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  _BYTE *v22;
  _BYTE v23[288];
  _BYTE v24[296];
  _QWORD v25[39];
  _BYTE v26[312];
  _QWORD v27[2];
  char v28;
  _BYTE v29[288];
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  _BYTE v36[312];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[4];
  unsigned __int8 v41;

  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  if (v41 > 6u)
  {
    sub_23C324964(&v30);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C0A8);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_23C354470;
    *(_QWORD *)(v4 + 32) = sub_23C34E538();
    *(_QWORD *)(v4 + 40) = sub_23C34E52C();
    v40[0] = v4;
    sub_23C34E904();
    MEMORY[0x24261BDA8](v4);
    sub_23C34E730();
    sub_23C34E724();
    sub_23C34DE18();
    v5 = v37;
    v20 = *(_OWORD *)(v0 + 8);
    v6 = v38;
    v7 = v39;
    v19 = sub_23C34DE3C();
    v8 = sub_23C34E16C();
    v9 = v1;
    v10 = sub_23C34DFEC();
    sub_23C31A2B4(v3, v2, v21, v22, (uint64_t)v23);
    v24[288] = 0;
    memcpy(&v24[7], v23, 0x119uLL);
    v25[0] = v10;
    v25[1] = 0;
    LOBYTE(v25[2]) = 0;
    memcpy((char *)&v25[2] + 1, v24, 0x120uLL);
    memcpy(&v26[7], v25, 0x131uLL);
    v27[0] = v10;
    v1 = v9;
    v27[1] = 0;
    v28 = 0;
    memcpy(v29, v24, sizeof(v29));
    swift_bridgeObjectRetain();
    sub_23C3249A0((uint64_t)v25);
    sub_23C324A98((uint64_t)v27);
    swift_bridgeObjectRelease();
    v30 = v5;
    v31 = v20;
    v32 = v6;
    v33 = v7;
    v34 = v19;
    v35 = v8;
    memcpy(v36, v26, sizeof(v36));
    ((void (*)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))nullsub_1)(&v30, v11, v12, v13, v14, v15, v16, v17);
  }
  sub_23C2894C8((uint64_t)&v30, (uint64_t)v40, &qword_256B5C0A0);
  return sub_23C2894C8((uint64_t)v40, v1, &qword_256B5C0A0);
}

uint64_t sub_23C31A2B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __n128 v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t (*v17)(_QWORD, __n128);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  void (*v24)(_QWORD);
  void (*v25)(_BYTE *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  _BYTE *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE *v45;
  uint64_t v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  char v76;
  uint64_t (*v77)(_QWORD);
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  char v84;
  int v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _BYTE *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  _BYTE v102[12];
  int v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  _BYTE *v108;
  uint64_t v109;
  void (*v110)(_BYTE *, uint64_t);
  void (*v111)(_BYTE *, _QWORD, uint64_t);
  unsigned int v112;
  uint64_t v113;
  uint64_t (*v114)(_BYTE *);
  int v115;
  uint64_t v116;
  _BYTE *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  _BYTE *v124;
  uint64_t v125;
  uint64_t KeyPath;
  uint64_t v127;
  char v128;
  _BYTE v129[7];
  _BYTE v130[7];
  char v131;
  _BYTE v132[7];
  _BYTE v133[7];
  char v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _OWORD v141[2];
  _OWORD v142[8];
  _BYTE v143[7];
  char v144;
  _BYTE v145[7];
  char v146;
  _QWORD v147[2];
  char v148;
  _BYTE v149[7];
  uint64_t v150;
  char v151;
  _BYTE v152[7];
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char v157;
  _BYTE v158[7];
  char v159;
  _BYTE v160[7];
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  char v165;

  v108 = a4;
  v125 = a3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
  MEMORY[0x24BDAC7A8](v8);
  v124 = &v102[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_23C34D86C();
  v122 = *(_QWORD *)(v10 - 8);
  v123 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v117 = &v102[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = sub_23C34E25C();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = &v102[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = *(uint64_t (**)(_QWORD, __n128))(a1 + 56);
  v113 = *(_QWORD *)(a1 + 64);
  v114 = (uint64_t (*)(_BYTE *))v17;
  v18 = v17(a2, v14);
  v20 = v19;
  KeyPath = v21;
  v23 = v22 & 1;
  sub_23C34E1FC();
  sub_23C34E1F0();
  swift_release();
  v24 = *(void (**)(_QWORD))(v13 + 104);
  v112 = *MEMORY[0x24BDF17C8];
  v111 = (void (*)(_BYTE *, _QWORD, uint64_t))v24;
  v24(v16);
  sub_23C34E28C();
  swift_release();
  v25 = *(void (**)(_BYTE *, uint64_t))(v13 + 8);
  v109 = v12;
  v110 = v25;
  v25(v16, v12);
  v26 = sub_23C34E334();
  v120 = v27;
  v121 = v26;
  v29 = v28;
  v127 = v30;
  v31 = v124;
  swift_release();
  sub_23C289340(v18, v20, v23);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  sub_23C28950C(v125, (uint64_t)v31, &qword_256B58910);
  v32 = v122;
  v33 = v123;
  if ((*(unsigned int (**)(_BYTE *, uint64_t))(v122 + 48))(v31, 1) == 1)
  {
    sub_23C285184((uint64_t)v31, &qword_256B58910);
    v124 = 0;
    v125 = 0;
    v118 = 0;
    v119 = 0;
    v122 = 0;
    v123 = 0;
    v116 = 0;
    v117 = 0;
    v106 = 0;
    v107 = 0;
    v104 = 0;
    v105 = 0;
    v103 = 0;
  }
  else
  {
    v34 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v32 + 32);
    v35 = v117;
    v34(v117, v31, v33);
    v36 = v114(v35);
    v38 = v37;
    v118 = v39;
    v41 = v40 & 1;
    sub_23C34E1E4();
    v42 = v16;
    v43 = v109;
    v111(v16, v112, v109);
    sub_23C34E28C();
    swift_release();
    v110(v16, v43);
    v44 = sub_23C34E334();
    v124 = v45;
    v125 = v44;
    v119 = v46;
    v48 = v47;
    swift_release();
    sub_23C289340(v36, v38, v41);
    swift_bridgeObjectRelease();
    v118 = swift_getKeyPath();
    LOBYTE(v36) = sub_23C34E184();
    sub_23C34DD28();
    v106 = v50;
    v107 = v49;
    v104 = v52;
    v105 = v51;
    v53 = v48 & 1;
    v16 = v42;
    LOBYTE(v142[0]) = v53;
    LOBYTE(v147[0]) = 0;
    LOBYTE(v135) = 0;
    (*(void (**)(_BYTE *, uint64_t))(v122 + 8))(v117, v123);
    v123 = LOBYTE(v142[0]);
    v117 = (_BYTE *)LOBYTE(v147[0]);
    v116 = v36;
    v122 = 2;
    v103 = v135;
  }
  v115 = v29 & 1;
  v54 = v114(v108);
  v56 = v55;
  v58 = v57 & 1;
  sub_23C34E298();
  v59 = v109;
  v111(v16, v112, v109);
  sub_23C34E28C();
  swift_release();
  v110(v16, v59);
  v114 = (uint64_t (*)(_BYTE *))sub_23C34E334();
  v61 = v60;
  v63 = v62;
  v65 = v64;
  swift_release();
  sub_23C289340(v54, v56, v58);
  swift_bridgeObjectRelease();
  v66 = sub_23C34E184();
  sub_23C34DD28();
  v68 = v67;
  v70 = v69;
  v72 = v71;
  v74 = v73;
  v75 = sub_23C34E190();
  sub_23C34DD28();
  *(_DWORD *)v149 = *(_DWORD *)v133;
  *(_DWORD *)&v149[3] = *(_DWORD *)&v133[3];
  *(_DWORD *)v152 = *(_DWORD *)v132;
  *(_DWORD *)&v152[3] = *(_DWORD *)&v132[3];
  *(_DWORD *)&v158[3] = *(_DWORD *)&v130[3];
  *(_DWORD *)v158 = *(_DWORD *)v130;
  *(_DWORD *)&v160[3] = *(_DWORD *)&v129[3];
  *(_DWORD *)v160 = *(_DWORD *)v129;
  DWORD1(v136) = *(_DWORD *)&v133[3];
  v76 = v63 & 1;
  v134 = v63 & 1;
  v131 = 0;
  v128 = 0;
  *(_DWORD *)((char *)&v136 + 1) = *(_DWORD *)v133;
  DWORD1(v137) = *(_DWORD *)&v132[3];
  v77 = (uint64_t (*)(_QWORD))v114;
  *(_QWORD *)&v135 = v114;
  *((_QWORD *)&v135 + 1) = v61;
  LOBYTE(v136) = v63 & 1;
  *((_QWORD *)&v136 + 1) = v65;
  v78 = v66;
  LOBYTE(v137) = v66;
  *(_DWORD *)((char *)&v137 + 1) = *(_DWORD *)v132;
  *((_QWORD *)&v137 + 1) = v68;
  *(_QWORD *)&v138 = v70;
  *((_QWORD *)&v138 + 1) = v72;
  *(_QWORD *)&v139 = v74;
  BYTE8(v139) = 0;
  HIDWORD(v139) = *(_DWORD *)&v130[3];
  *(_DWORD *)((char *)&v139 + 9) = *(_DWORD *)v130;
  LOBYTE(v140) = v75;
  DWORD1(v140) = *(_DWORD *)&v129[3];
  *(_DWORD *)((char *)&v140 + 1) = *(_DWORD *)v129;
  *((_QWORD *)&v140 + 1) = v79;
  *(_QWORD *)&v141[0] = v80;
  *((_QWORD *)&v141[0] + 1) = v81;
  *(_QWORD *)&v141[1] = v82;
  BYTE8(v141[1]) = 0;
  v83 = v115;
  v146 = v115;
  v144 = 0;
  v142[7] = *(_OWORD *)((char *)v141 + 9);
  *(_OWORD *)((char *)&v142[6] + 7) = v141[0];
  *(_OWORD *)((char *)&v142[5] + 7) = v140;
  *(_OWORD *)((char *)&v142[4] + 7) = v139;
  *(_OWORD *)((char *)&v142[3] + 7) = v138;
  *(_OWORD *)((char *)&v142[2] + 7) = v137;
  *(_OWORD *)((char *)&v142[1] + 7) = v136;
  *(_OWORD *)((char *)v142 + 7) = v135;
  v84 = v115;
  v85 = *(_DWORD *)v145;
  *(_DWORD *)(a5 + 20) = *(_DWORD *)&v145[3];
  *(_DWORD *)(a5 + 17) = v85;
  LOBYTE(v85) = v144;
  v86 = *(_DWORD *)v143;
  *(_DWORD *)(a5 + 52) = *(_DWORD *)&v143[3];
  *(_DWORD *)(a5 + 49) = v86;
  v87 = v121;
  *(_QWORD *)a5 = v121;
  v88 = v87;
  v89 = v120;
  *(_QWORD *)(a5 + 8) = v120;
  *(_BYTE *)(a5 + 16) = v84;
  *(_QWORD *)(a5 + 24) = v127;
  v90 = v125;
  *(_QWORD *)(a5 + 32) = KeyPath;
  *(_QWORD *)(a5 + 40) = 3;
  *(_BYTE *)(a5 + 48) = v85;
  v91 = v119;
  *(_QWORD *)(a5 + 56) = v90;
  *(_QWORD *)(a5 + 64) = v91;
  v92 = v124;
  *(_QWORD *)(a5 + 72) = v123;
  *(_QWORD *)(a5 + 80) = v92;
  v124 = v92;
  v125 = v90;
  v93 = v122;
  *(_QWORD *)(a5 + 88) = v118;
  *(_QWORD *)(a5 + 96) = v93;
  v122 = v93;
  v94 = v116;
  *(_QWORD *)(a5 + 104) = v117;
  *(_QWORD *)(a5 + 112) = v94;
  v95 = v106;
  *(_QWORD *)(a5 + 120) = v107;
  *(_QWORD *)(a5 + 128) = v95;
  *(_QWORD *)(a5 + 136) = v105;
  *(_QWORD *)(a5 + 144) = v104;
  *(_BYTE *)(a5 + 152) = v103;
  v96 = v142[2];
  *(_OWORD *)(a5 + 201) = v142[3];
  *(_OWORD *)(a5 + 185) = v96;
  v97 = v142[0];
  *(_OWORD *)(a5 + 169) = v142[1];
  *(_OWORD *)(a5 + 153) = v97;
  v98 = v142[6];
  *(_OWORD *)(a5 + 265) = v142[7];
  *(_OWORD *)(a5 + 249) = v98;
  v99 = v142[4];
  *(_OWORD *)(a5 + 233) = v142[5];
  *(_OWORD *)(a5 + 217) = v99;
  v147[0] = v77;
  v147[1] = v61;
  v148 = v76;
  v150 = v65;
  v151 = v78;
  v153 = v68;
  v154 = v70;
  v155 = v72;
  v156 = v74;
  v157 = 0;
  v159 = v75;
  v161 = v79;
  v162 = v80;
  v163 = v81;
  v164 = v82;
  v165 = 0;
  sub_23C289550(v88, v89, v83);
  swift_bridgeObjectRetain();
  swift_retain();
  v100 = v119;
  sub_23C2BED10(v90, v119, v123, (uint64_t)v92);
  sub_23C3248B4((uint64_t)&v135);
  sub_23C3248F0((uint64_t)v147);
  sub_23C2BEEB8(v125, v100, v123, (uint64_t)v124);
  sub_23C289340(v121, v120, v115);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_23C31AA50(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[18];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v20[11] = a4;
  v24 = a3;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
  MEMORY[0x24BDAC7A8](v13);
  v25 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23C34D86C();
  v16 = *(_QWORD *)(v15 - 8);
  v22 = v15;
  v23 = v16;
  MEMORY[0x24BDAC7A8](v15);
  v20[17] = (char *)v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_23C34E25C();
  MEMORY[0x24BDAC7A8](v21);
  v18 = a1[3];
  v32 = a1[2];
  v33 = v18;
  v34 = a1[4];
  v35 = *((_QWORD *)a1 + 10);
  v19 = a1[1];
  v30 = *a1;
  v31 = v19;
  v26 = a5;
  v27 = a6;
  v28 = a7;
  v29 = a8;
  type metadata accessor for ProgramDetailView();
}

uint64_t sub_23C31AB9C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  int v19;
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
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  int v71;
  int v72;
  int v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  char v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  int v87;
  int v88;
  int v89;
  int v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
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
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;

  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  if (*((unsigned __int8 *)v0 + 1232) >= 7u)
  {
    v0[4] = v4;
    v6 = *(uint64_t (**)(uint64_t))(v5 + 56);
    v0[8] = *(_QWORD *)(v5 + 64);
    v0[9] = (uint64_t)v6;
    v7 = v6(v1);
    v9 = v8;
    v11 = v10 & 1;
    sub_23C34E1CC();
    sub_23C34E1F0();
    swift_release();
    v12 = *(void (**)(uint64_t))(v3 + 104);
    v13 = v2;
    *((_DWORD *)v0 + 15) = *MEMORY[0x24BDF17C8];
    v14 = v2;
    v15 = v0[18];
    v0[6] = (uint64_t)v12;
    v12(v13);
    sub_23C34E28C();
    swift_release();
    v16 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
    v0[5] = (uint64_t)v16;
    v16(v14, v15);
    v17 = sub_23C34E334();
    v0[14] = v18;
    v0[15] = v17;
    *((_DWORD *)v0 + 6) = v19;
    v0[16] = v20;
    swift_release();
    sub_23C289340(v7, v9, v11);
    swift_bridgeObjectRelease();
    v0[13] = swift_getKeyPath();
    *((_DWORD *)v0 + 7) = sub_23C34E184();
    sub_23C34DD28();
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v29 = v0[25];
    sub_23C28950C(v0[24], v29, &qword_256B58910);
    v30 = v0[19];
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0[20] + 48))(v29, 1, v30) == 1)
    {
      sub_23C285184(v29, &qword_256B58910);
      v0[12] = 0;
      v0[24] = 0;
      v0[25] = 0;
      v0[19] = 0;
      v0[20] = 0;
      v0[10] = 0;
      *v0 = 0;
      v0[1] = 0;
      v0[2] = 0;
      v0[22] = 0;
      v0[23] = 0;
      v0[21] = 0;
      *((_DWORD *)v0 + 34) = 0;
      v31 = v0[18];
      v32 = v14;
    }
    else
    {
      v33 = v0[17];
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v0[20] + 32))(v33, v29, v30);
      v32 = v14;
      v34 = ((uint64_t (*)(uint64_t))v0[9])(v33);
      v36 = v35;
      v38 = v37 & 1;
      sub_23C34E1E4();
      v39 = v0[18];
      ((void (*)(uint64_t, _QWORD, uint64_t))v0[6])(v32, *((unsigned int *)v0 + 15), v39);
      sub_23C34E28C();
      swift_release();
      ((void (*)(uint64_t, uint64_t))v0[5])(v32, v39);
      v0[12] = sub_23C34E334();
      v0[24] = v41;
      v0[25] = v40;
      v43 = v42;
      swift_release();
      sub_23C289340(v34, v36, v38);
      swift_bridgeObjectRelease();
      v0[10] = swift_getKeyPath();
      LOBYTE(v34) = sub_23C34E184();
      sub_23C34DD28();
      v0[22] = v45;
      v0[23] = v44;
      *((_BYTE *)v0 + 1200) = v43 & 1;
      *((_BYTE *)v0 + 856) = 0;
      *((_BYTE *)v0 + 560) = 0;
      v46 = *(void (**)(uint64_t, uint64_t))(v0[20] + 8);
      v0[20] = v48;
      v0[21] = v47;
      v46(v0[17], v30);
      v0[19] = *((unsigned __int8 *)v0 + 1200);
      v0[2] = *((unsigned __int8 *)v0 + 856);
      *v0 = 2;
      v0[1] = v34;
      *((_DWORD *)v0 + 34) = *((unsigned __int8 *)v0 + 560);
      v31 = v39;
    }
    v49 = ((uint64_t (*)(uint64_t))v0[9])(v0[11]);
    v51 = v50;
    v53 = v52 & 1;
    sub_23C34E298();
    ((void (*)(uint64_t, _QWORD, uint64_t))v0[6])(v32, *((unsigned int *)v0 + 15), v31);
    sub_23C34E28C();
    swift_release();
    ((void (*)(uint64_t, uint64_t))v0[5])(v32, v31);
    v54 = sub_23C34E334();
    v56 = v55;
    v58 = v57;
    v60 = v59;
    swift_release();
    sub_23C289340(v49, v51, v53);
    swift_bridgeObjectRelease();
    v61 = sub_23C34E184();
    sub_23C34DD28();
    v63 = v62;
    v65 = v64;
    v67 = v66;
    v69 = v68;
    LOBYTE(v49) = sub_23C34E190();
    sub_23C34DD28();
    *((_BYTE *)v0 + 256) = v58 & 1;
    *((_BYTE *)v0 + 240) = 0;
    *((_BYTE *)v0 + 224) = 0;
    v70 = *(_DWORD *)((char *)v0 + 249);
    *(_DWORD *)((char *)v0 + 745) = v70;
    *((_DWORD *)v0 + 187) = *((_DWORD *)v0 + 63);
    v71 = *(_DWORD *)((char *)v0 + 242);
    *(_DWORD *)((char *)v0 + 761) = v71;
    *((_DWORD *)v0 + 191) = *(_DWORD *)((char *)v0 + 245);
    *((_DWORD *)v0 + 201) = *((_DWORD *)v0 + 59);
    v72 = *(_DWORD *)((char *)v0 + 233);
    *(_DWORD *)((char *)v0 + 801) = v72;
    *((_DWORD *)v0 + 203) = *(_DWORD *)((char *)v0 + 229);
    v73 = *(_DWORD *)((char *)v0 + 226);
    *(_DWORD *)((char *)v0 + 809) = v73;
    v74 = *((_BYTE *)v0 + 224);
    v0[33] = v54;
    v0[34] = v56;
    *((_BYTE *)v0 + 280) = v58 & 1;
    *((_DWORD *)v0 + 71) = *((_DWORD *)v0 + 63);
    *(_DWORD *)((char *)v0 + 281) = v70;
    v0[36] = v60;
    *((_BYTE *)v0 + 296) = v61;
    *((_DWORD *)v0 + 75) = *(_DWORD *)((char *)v0 + 245);
    *(_DWORD *)((char *)v0 + 297) = v71;
    v0[38] = v63;
    v0[39] = v65;
    v0[40] = v67;
    v0[41] = v69;
    *((_BYTE *)v0 + 336) = 0;
    *((_DWORD *)v0 + 85) = *((_DWORD *)v0 + 59);
    *(_DWORD *)((char *)v0 + 337) = v72;
    *((_BYTE *)v0 + 344) = v49;
    *((_DWORD *)v0 + 87) = *(_DWORD *)((char *)v0 + 229);
    *(_DWORD *)((char *)v0 + 345) = v73;
    v0[44] = v75;
    v0[45] = v76;
    v0[46] = v77;
    v0[47] = v78;
    *((_BYTE *)v0 + 384) = v74;
    v79 = v0[3] & 1;
    *((_BYTE *)v0 + 552) = v79;
    v80 = v79;
    *((_DWORD *)v0 + 16) = v79;
    *((_BYTE *)v0 + 544) = 0;
    *((_BYTE *)v0 + 528) = 0;
    v81 = *(_OWORD *)(v0 + 41);
    v82 = *(_OWORD *)(v0 + 43);
    v83 = *(_OWORD *)(v0 + 45);
    *(_OWORD *)(v0 + 63) = *(_OWORD *)((char *)v0 + 369);
    *(_OWORD *)((char *)v0 + 495) = v83;
    *(_OWORD *)((char *)v0 + 479) = v82;
    *(_OWORD *)((char *)v0 + 463) = v81;
    v84 = *(_OWORD *)(v0 + 33);
    v85 = *(_OWORD *)(v0 + 35);
    v86 = *(_OWORD *)(v0 + 37);
    *(_OWORD *)((char *)v0 + 447) = *(_OWORD *)(v0 + 39);
    *(_OWORD *)((char *)v0 + 431) = v86;
    *(_OWORD *)((char *)v0 + 415) = v85;
    *(_OWORD *)((char *)v0 + 399) = v84;
    *((_DWORD *)v0 + 18) = *((unsigned __int8 *)v0 + 552);
    v87 = *(_DWORD *)((char *)v0 + 545);
    *(_DWORD *)((char *)v0 + 723) = *((_DWORD *)v0 + 137);
    *((_DWORD *)v0 + 180) = v87;
    *((_DWORD *)v0 + 22) = *((unsigned __int8 *)v0 + 544);
    v88 = *(_DWORD *)((char *)v0 + 537);
    *(_DWORD *)((char *)v0 + 715) = *((_DWORD *)v0 + 135);
    *((_DWORD *)v0 + 178) = v88;
    v89 = *(_DWORD *)((char *)v0 + 530);
    *(_DWORD *)((char *)v0 + 707) = *(_DWORD *)((char *)v0 + 533);
    *((_DWORD *)v0 + 176) = v89;
    *((_DWORD *)v0 + 36) = *((unsigned __int8 *)v0 + 528);
    v90 = *(_DWORD *)((char *)v0 + 521);
    *(_DWORD *)((char *)v0 + 699) = *((_DWORD *)v0 + 131);
    *((_DWORD *)v0 + 174) = v90;
    v91 = *(_OWORD *)(v0 + 49);
    v92 = *(_OWORD *)(v0 + 51);
    v93 = *(_OWORD *)(v0 + 55);
    *((_OWORD *)v0 + 37) = *(_OWORD *)(v0 + 53);
    *((_OWORD *)v0 + 38) = v93;
    *((_OWORD *)v0 + 35) = v91;
    *((_OWORD *)v0 + 36) = v92;
    v94 = *(_OWORD *)(v0 + 57);
    v95 = *(_OWORD *)(v0 + 59);
    v96 = *(_OWORD *)(v0 + 63);
    *((_OWORD *)v0 + 41) = *(_OWORD *)(v0 + 61);
    *((_OWORD *)v0 + 42) = v96;
    *((_OWORD *)v0 + 39) = v94;
    *((_OWORD *)v0 + 40) = v95;
    v0[91] = v54;
    v0[92] = v56;
    *((_BYTE *)v0 + 744) = v58 & 1;
    v0[94] = v60;
    *((_BYTE *)v0 + 760) = v61;
    v0[96] = v63;
    v0[97] = v65;
    v0[98] = v67;
    v0[99] = v69;
    *((_BYTE *)v0 + 800) = 0;
    *((_BYTE *)v0 + 808) = v49;
    v0[102] = v75;
    v0[103] = v76;
    v0[104] = v77;
    v0[105] = v78;
    *((_BYTE *)v0 + 848) = v74;
    sub_23C289550(v0[15], v0[14], v80);
    swift_bridgeObjectRetain();
    swift_retain();
    *((_DWORD *)v0 + 34) = *((_DWORD *)v0 + 34);
    v0[20] = v0[20];
    v0[21] = v0[21];
    v0[22] = v0[22];
    v0[23] = v0[23];
    v97 = v0[12];
    v99 = v0[24];
    v98 = v0[25];
    v100 = v0[19];
    v0[19] = v100;
    v102 = *v0;
    v101 = v0[1];
    v103 = v0[2];
    sub_23C2BED10(v97, v98, v100, v99);
    sub_23C3248B4((uint64_t)(v0 + 33));
    sub_23C3248F0((uint64_t)(v0 + 91));
    v104 = v0[12];
    v105 = v0[10];
    sub_23C2BEEB8(v104, v0[25], v100, v0[24]);
    v107 = v0[14];
    v106 = v0[15];
    sub_23C289340(v106, v107, *((_DWORD *)v0 + 16));
    v108 = v0[13];
    swift_release();
    v109 = v0[16];
    swift_bridgeObjectRelease();
    v0[107] = v106;
    v0[108] = v107;
    *((_BYTE *)v0 + 872) = *((_DWORD *)v0 + 18);
    *(_DWORD *)((char *)v0 + 873) = *((_DWORD *)v0 + 180);
    *((_DWORD *)v0 + 219) = *(_DWORD *)((char *)v0 + 723);
    v0[110] = v109;
    v0[111] = v108;
    v0[112] = 3;
    *((_BYTE *)v0 + 904) = *((_DWORD *)v0 + 22);
    *(_DWORD *)((char *)v0 + 905) = *((_DWORD *)v0 + 178);
    *((_DWORD *)v0 + 227) = *(_DWORD *)((char *)v0 + 715);
    *((_BYTE *)v0 + 912) = *((_DWORD *)v0 + 7);
    *(_DWORD *)((char *)v0 + 913) = *((_DWORD *)v0 + 176);
    *((_DWORD *)v0 + 229) = *(_DWORD *)((char *)v0 + 707);
    v0[115] = v22;
    v0[116] = v24;
    v0[117] = v26;
    v0[118] = v28;
    *((_BYTE *)v0 + 952) = *((_DWORD *)v0 + 36);
    *((_DWORD *)v0 + 239) = *(_DWORD *)((char *)v0 + 699);
    *(_DWORD *)((char *)v0 + 953) = *((_DWORD *)v0 + 174);
    v0[120] = v104;
    v0[121] = v0[25];
    v0[122] = v0[19];
    v0[123] = v0[24];
    v0[124] = v105;
    v0[125] = v102;
    v0[126] = v103;
    v0[127] = v101;
    v0[128] = v0[23];
    v0[129] = v0[22];
    v0[130] = v0[21];
    v0[131] = v0[20];
    *((_BYTE *)v0 + 1056) = *((_DWORD *)v0 + 34);
    v110 = *((_OWORD *)v0 + 40);
    *(_OWORD *)((char *)v0 + 1121) = *((_OWORD *)v0 + 39);
    *(_OWORD *)((char *)v0 + 1137) = v110;
    v111 = *((_OWORD *)v0 + 42);
    *(_OWORD *)((char *)v0 + 1153) = *((_OWORD *)v0 + 41);
    *(_OWORD *)((char *)v0 + 1169) = v111;
    v112 = *((_OWORD *)v0 + 36);
    *(_OWORD *)((char *)v0 + 1057) = *((_OWORD *)v0 + 35);
    *(_OWORD *)((char *)v0 + 1073) = v112;
    v113 = *((_OWORD *)v0 + 38);
    *(_OWORD *)((char *)v0 + 1089) = *((_OWORD *)v0 + 37);
    *(_OWORD *)((char *)v0 + 1105) = v113;
    ((void (*)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))nullsub_1)(v0 + 107, v114, v115, v116, v117, v118, v119, v120);
    sub_23C2894C8((uint64_t)(v0 + 107), (uint64_t)(v0 + 150), &qword_256B5C088);
    v4 = v0[4];
  }
  else
  {
    sub_23C32492C(v0 + 107);
    sub_23C2894C8((uint64_t)(v0 + 107), (uint64_t)(v0 + 150), &qword_256B5C088);
  }
  return sub_23C2894C8((uint64_t)(v0 + 150), v4, &qword_256B5C088);
}

void sub_23C31B410(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void (*a6)(_QWORD, _QWORD)@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
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
  uint64_t v27;
  __n128 v28;
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
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(_QWORD, _QWORD);
  uint64_t v63;
  uint64_t v64;
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
  uint64_t v77;
  uint64_t v78;
  void (*v79)(_QWORD, _QWORD);
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[3];

  v68 = a3;
  v69 = a8;
  v61 = a5;
  v62 = a6;
  v60 = a4;
  v50 = a2;
  v63 = a9;
  v70 = a11;
  v13 = *(_QWORD *)(a7 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23C34DE30();
  v52 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v47 - v17;
  v19 = sub_23C34DE30();
  v54 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v48 = (char *)&v47 - v20;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCF8);
  v21 = sub_23C34DE30();
  v57 = *(_QWORD *)(v21 - 8);
  v53 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v51 = (char *)&v47 - v22;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD00);
  v23 = sub_23C34DE30();
  v24 = *(_QWORD *)(v23 - 8);
  v56 = v23;
  v58 = v24;
  MEMORY[0x24BDAC7A8](v23);
  v55 = (char *)&v47 - v25;
  v67 = sub_23C34DE30();
  v59 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v65 = (char *)&v47 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v66 = (uint64_t)&v47 - v29;
  v49 = a1;
  (*(void (**)(uint64_t, __n128))(a1 + 24))(v50, v28);
  sub_23C34DE3C();
  sub_23C34E16C();
  v64 = a7;
  sub_23C34E424();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, a7);
  sub_23C34E6E8();
  v84[0] = a10;
  v84[1] = MEMORY[0x24BDF1050];
  v47 = a10;
  v30 = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v16, v84);
  v31 = v48;
  sub_23C34E484();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v18, v16);
  sub_23C34E6DC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C0B0);
  v83[0] = v30;
  v83[1] = MEMORY[0x24BDEBEE0];
  v32 = MEMORY[0x24BDED308];
  v33 = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v19, v83);
  sub_23C2BFE70(&qword_256B5C0B8, &qword_256B5C0B0, (uint64_t (*)(void))sub_23C324B90, MEMORY[0x24BDF1050]);
  v34 = v51;
  sub_23C34E4A8();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v31, v19);
  sub_23C34E6DC();
  v71 = v64;
  v72 = v69;
  v73 = a10;
  v74 = v70;
  v75 = v49;
  v76 = v68;
  v77 = v60;
  v78 = v61;
  v79 = v62;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C0C8);
  v35 = MEMORY[0x24BDEDC10];
  v36 = sub_23C28943C(&qword_256B5C0D0, &qword_256B5BCF8, MEMORY[0x24BDEDC10]);
  v82[0] = v33;
  v82[1] = v36;
  v37 = v53;
  v38 = MEMORY[0x24261C66C](v32, v53, v82);
  sub_23C324C18();
  v39 = v55;
  sub_23C34E4A8();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v34, v37);
  v40 = sub_23C28943C(&qword_256B5C0F0, &qword_256B5BD00, v35);
  v81[0] = v38;
  v81[1] = v40;
  v41 = MEMORY[0x24BDED308];
  v42 = v56;
  v43 = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v56, v81);
  v44 = (uint64_t)v65;
  sub_23C34E4FC();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v39, v42);
  v80[0] = v43;
  v80[1] = MEMORY[0x24BDEDB80];
  v45 = v41;
  v46 = v67;
  v61 = MEMORY[0x24261C66C](v45, v67, v80);
  sub_23C28958C(v44, v46, v66);
  v62 = *(void (**)(_QWORD, _QWORD))(v59 + 8);
  v62(v44, v46);
  sub_23C31CFA8();
}

uint64_t sub_23C31B958()
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
  char v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);

  v4 = *(_QWORD *)(v3 - 240);
  v5 = *(_QWORD *)(v3 - 232);
  v6 = *(_QWORD *)(v3 - 224);
  v7 = *(_QWORD *)(v3 - 216);
  v8 = *(_QWORD *)(v3 - 208);
  v9 = *(_QWORD *)(v3 - 200);
  v10 = *(_BYTE *)(v3 - 192);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v12 = v0[18];
  v13 = v1;
  v14 = v0[20];
  v11(v12, v13, v14);
  *(_QWORD *)(v3 - 240) = v4;
  *(_QWORD *)(v3 - 232) = v5;
  *(_QWORD *)(v3 - 224) = v6;
  *(_QWORD *)(v3 - 216) = v7;
  *(_QWORD *)(v3 - 208) = v8;
  *(_QWORD *)(v3 - 200) = v9;
  *(_BYTE *)(v3 - 192) = v10;
  *(_WORD *)(v3 - 191) = 256;
  *(_QWORD *)(v3 - 184) = v12;
  *(_QWORD *)(v3 - 176) = v3 - 240;
  sub_23C2BED10(v4, v5, v6, v7);
  *(_QWORD *)(v3 - 256) = v14;
  *(_QWORD *)(v3 - 248) = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BD08);
  v0[36] = v0[14];
  v0[37] = sub_23C324C9C();
  sub_23C328D8C((uint64_t *)(v3 - 184), 2uLL, v3 - 256);
  sub_23C2BEEB8(v4, v5, v6, v7);
  v15 = (uint64_t (*)(uint64_t, uint64_t))v0[15];
  v15(v0[19], v14);
  sub_23C2BEEB8(*(_QWORD *)(v3 - 240), *(_QWORD *)(v3 - 232), *(_QWORD *)(v3 - 224), *(_QWORD *)(v3 - 216));
  return v15(v12, v14);
}

__n128 sub_23C31BA70@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  __n128 result;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C0A8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23C354470;
  *(_QWORD *)(v2 + 32) = sub_23C34E538();
  *(_QWORD *)(v2 + 40) = sub_23C34E52C();
  sub_23C34E904();
  MEMORY[0x24261BDA8](v2);
  sub_23C34E730();
  sub_23C34E724();
  sub_23C34DE18();
  v3 = v2;
  v4 = sub_23C34DE3C();
  v5 = sub_23C34E16C();
  *(_QWORD *)a1 = v3;
  result = v7;
  *(__n128 *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 32) = v9;
  *(_QWORD *)(a1 + 40) = v4;
  *(_BYTE *)(a1 + 48) = v5;
  return result;
}

void sub_23C31BB54()
{
  uint64_t v0;
  uint64_t v1;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C110);
  MEMORY[0x24BDAC7A8](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C0E8);
  MEMORY[0x24BDAC7A8](v1);
  type metadata accessor for ProgramDetailView();
}

uint64_t sub_23C31BC44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  if (*(unsigned __int8 *)(v5 - 144) <= 6u)
  {
    *(_QWORD *)v4 = sub_23C34DFEC();
    *(_QWORD *)(v4 + 8) = 0;
    *(_BYTE *)(v4 + 16) = 0;
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C118);
    sub_23C31BDAC(v3, *(_QWORD *)(v5 - 256), *(_QWORD *)(v5 - 248), *(_QWORD *)(v5 - 240), *(_QWORD *)(v5 - 232), v2, v1, *(_QWORD *)(v5 - 224), v4 + *(int *)(v6 + 44), v0);
  }
  swift_storeEnumTagMultiPayload();
  sub_23C28943C(&qword_256B5C0E0, &qword_256B5C0E8, MEMORY[0x24BDF4700]);
  return sub_23C34E004();
}

void sub_23C31BDAC(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __n128 v28;
  uint64_t v29;
  uint64_t (*v30)(_QWORD, __n128);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  void (*v36)(_QWORD);
  void (*v37)(_QWORD, _QWORD);
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[6];
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(_QWORD, _QWORD);
  uint64_t (*v52)(_QWORD, __n128);
  void (*v53)(_QWORD);
  int v54;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
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
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;

  v66 = a8;
  v65 = a7;
  v64 = a6;
  v42[5] = a5;
  v42[3] = a4;
  v71 = a3;
  v49 = a9;
  v63 = a10;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF68);
  MEMORY[0x24BDAC7A8](v45);
  v44 = (char *)v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C120);
  v47 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v46 = (char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C128);
  MEMORY[0x24BDAC7A8](v43);
  v57 = (char *)v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v56 = (char *)v42 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
  MEMORY[0x24BDAC7A8](v17);
  v67 = (char *)v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_23C34D86C();
  v60 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v58 = (char *)v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_23C34E25C();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)v42 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C130);
  v69 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  v55 = (char *)v42 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v62 = (char *)v42 - v26;
  v28 = MEMORY[0x24BDAC7A8](v27);
  v68 = (char *)v42 - v29;
  v30 = (uint64_t (*)(_QWORD, __n128))*((_QWORD *)a1 + 7);
  v50 = *((_QWORD *)a1 + 8);
  v52 = v30;
  v31 = v30(a2, v28);
  v33 = v32;
  v35 = v34 & 1;
  sub_23C34E1CC();
  sub_23C34E1F0();
  swift_release();
  v36 = *(void (**)(_QWORD))(v21 + 104);
  v54 = *MEMORY[0x24BDF17C8];
  v53 = v36;
  v36(v23);
  sub_23C34E28C();
  swift_release();
  v37 = *(void (**)(_QWORD, _QWORD))(v21 + 8);
  v42[1] = v23;
  v42[2] = v20;
  v51 = v37;
  v37(v23, v20);
  sub_23C34E334();
  v59 = v38;
  swift_release();
  sub_23C289340(v31, v33, v35);
  swift_bridgeObjectRelease();
  v39 = a1[3];
  v78 = a1[2];
  v79 = v39;
  v80 = a1[4];
  v81 = *((_QWORD *)a1 + 10);
  v40 = *a1;
  v41 = a1[1];
  v42[4] = a1;
  v76 = v40;
  v77 = v41;
  v72 = v64;
  v73 = v65;
  v74 = v66;
  v75 = v63;
  type metadata accessor for ProgramDetailView();
}

uint64_t sub_23C31C208(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  BOOL v7;
  uint64_t v8;
  uint64_t KeyPath;
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
  char v20;
  char v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, _QWORD);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  char v37;
  char v38;
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
  void (*v63)(uint64_t, uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(_QWORD, uint64_t);
  uint64_t v84;

  *(_QWORD *)(v5 - 608) = a1;
  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  v6 = *(unsigned __int8 *)(v5 - 224);
  v7 = v6 > 6;
  if (v6 <= 6)
    v8 = 3;
  else
    v8 = 0;
  KeyPath = swift_getKeyPath();
  *(_QWORD *)(v5 - 256) = v4;
  *(_QWORD *)(v5 - 248) = v2;
  *(_BYTE *)(v5 - 240) = v3;
  *(_QWORD *)(v5 - 232) = v1;
  *(_QWORD *)(v5 - 224) = KeyPath;
  *(_QWORD *)(v5 - 216) = v8;
  *(_BYTE *)(v5 - 208) = v7;
  sub_23C34E148();
  sub_23C34E6F4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B58E70);
  sub_23C324D28();
  v10 = *(_QWORD *)(v5 - 392);
  v11 = *(_QWORD *)(v5 - 408);
  sub_23C34E46C();
  v12 = *(_QWORD *)(v5 - 400);
  sub_23C289340(v4, v2, v3);
  v13 = *(_QWORD *)(v5 - 352);
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v5 - 336) + 32))(*(_QWORD *)(v5 - 344), v10, *(_QWORD *)(v5 - 328));
  sub_23C28950C(*(_QWORD *)(v5 - 320), v13, &qword_256B58910);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v13, 1, v12) == 1)
  {
    sub_23C285184(v13, &qword_256B58910);
    *(_QWORD *)(v5 - 352) = 0;
    *(_QWORD *)(v5 - 360) = 0;
    *(_QWORD *)(v5 - 400) = 0;
    *(_QWORD *)(v5 - 320) = 0;
    *(_QWORD *)(v5 - 368) = 0;
    *(_QWORD *)(v5 - 416) = 0;
    *(_QWORD *)(v5 - 456) = 0;
    *(_QWORD *)(v5 - 464) = 0;
    *(_QWORD *)(v5 - 376) = 0;
    *(_QWORD *)(v5 - 384) = 0;
    *(_QWORD *)(v5 - 392) = 0;
    *(_QWORD *)(v5 - 408) = 0;
    *(_DWORD *)(v5 - 424) = 0;
    v14 = *(_QWORD *)(v5 - 592);
    v15 = *(_QWORD *)(v5 - 600);
  }
  else
  {
    v16 = *(_QWORD *)(v5 - 424);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v16, v13, v12);
    v17 = (*(uint64_t (**)(uint64_t))(v5 - 488))(v16);
    v19 = v18;
    v21 = v20 & 1;
    sub_23C34E1E4();
    v15 = *(_QWORD *)(v5 - 600);
    v14 = *(_QWORD *)(v5 - 592);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 - 480))(v15, *(unsigned int *)(v5 - 472), v14);
    sub_23C34E28C();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v5 - 496))(v15, v14);
    *(_QWORD *)(v5 - 352) = sub_23C34E334();
    *(_QWORD *)(v5 - 360) = v22;
    v24 = v23;
    *(_QWORD *)(v5 - 320) = v25;
    swift_release();
    sub_23C289340(v17, v19, v21);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v5 - 368) = swift_getKeyPath();
    LOBYTE(v17) = sub_23C34E184();
    sub_23C34DD28();
    *(_QWORD *)(v5 - 376) = v26;
    *(_QWORD *)(v5 - 384) = v27;
    *(_QWORD *)(v5 - 392) = v28;
    *(_BYTE *)(v5 - 256) = v24 & 1;
    *(_BYTE *)(v5 - 288) = 0;
    *(_BYTE *)(v5 - 304) = 0;
    v29 = *(void (**)(uint64_t, _QWORD))(v11 + 8);
    *(_QWORD *)(v5 - 408) = v30;
    v29(v16, *(_QWORD *)(v5 - 400));
    *(_QWORD *)(v5 - 400) = *(unsigned __int8 *)(v5 - 256);
    *(_QWORD *)(v5 - 456) = *(unsigned __int8 *)(v5 - 288);
    *(_QWORD *)(v5 - 464) = v17;
    *(_QWORD *)(v5 - 416) = 2;
    *(_DWORD *)(v5 - 424) = *(unsigned __int8 *)(v5 - 304);
  }
  v31 = (*(uint64_t (**)(_QWORD))(v5 - 488))(*(_QWORD *)(v5 - 584));
  v33 = v32;
  v35 = v34 & 1;
  sub_23C34E298();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 - 480))(v15, *(unsigned int *)(v5 - 472), v14);
  sub_23C34E28C();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 - 496))(v15, v14);
  *(_QWORD *)(v5 - 480) = sub_23C34E334();
  *(_QWORD *)(v5 - 488) = v36;
  v38 = v37;
  *(_QWORD *)(v5 - 472) = v39;
  swift_release();
  *(_DWORD *)(v5 - 496) = v38 & 1;
  sub_23C289340(v31, v33, v35);
  swift_bridgeObjectRelease();
  *(_DWORD *)(v5 - 504) = sub_23C34E1C0();
  sub_23C34DD28();
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v48 = *(_QWORD *)(v5 - 552);
  sub_23C31CADC(*(_QWORD *)(v5 - 568), *(_QWORD **)(v5 - 608), v48);
  sub_23C34E148();
  sub_23C34E6F4();
  sub_23C323D34();
  v49 = *(_QWORD *)(v5 - 536);
  sub_23C34E46C();
  sub_23C285184(v48, &qword_256B5BF68);
  LOBYTE(v31) = sub_23C34E184();
  sub_23C34DD28();
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v57 = v56;
  v58 = *(_QWORD *)(v5 - 528);
  v59 = *(_QWORD *)(v5 - 432);
  v60 = *(_QWORD *)(v5 - 520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 16))(v59, v49, v60);
  v61 = v59 + *(int *)(*(_QWORD *)(v5 - 560) + 36);
  *(_BYTE *)v61 = v31;
  *(_QWORD *)(v61 + 8) = v51;
  *(_QWORD *)(v61 + 16) = v53;
  *(_QWORD *)(v61 + 24) = v55;
  *(_QWORD *)(v61 + 32) = v57;
  *(_BYTE *)(v61 + 40) = 0;
  (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v49, v60);
  v62 = *(_QWORD *)(v5 - 440);
  sub_23C2894C8(v59, v62, &qword_256B5C128);
  v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 336) + 16);
  v64 = *(_QWORD *)(v5 - 448);
  v65 = *(_QWORD *)(v5 - 328);
  v63(v64, *(_QWORD *)(v5 - 344), v65);
  sub_23C28950C(v62, v59, &qword_256B5C128);
  v66 = *(_QWORD *)(v5 - 512);
  v63(v66, v64, v65);
  v67 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B5C138);
  v68 = v66 + v67[12];
  v69 = *(_QWORD *)(v5 - 360);
  *(_QWORD *)v68 = *(_QWORD *)(v5 - 352);
  *(_QWORD *)(v68 + 8) = v69;
  v70 = *(_QWORD *)(v5 - 320);
  *(_QWORD *)(v68 + 16) = *(_QWORD *)(v5 - 400);
  *(_QWORD *)(v68 + 24) = v70;
  v71 = *(_QWORD *)(v5 - 416);
  *(_QWORD *)(v68 + 32) = *(_QWORD *)(v5 - 368);
  *(_QWORD *)(v68 + 40) = v71;
  v72 = *(_QWORD *)(v5 - 464);
  *(_QWORD *)(v68 + 48) = *(_QWORD *)(v5 - 456);
  *(_QWORD *)(v68 + 56) = v72;
  v73 = *(_QWORD *)(v5 - 376);
  *(_QWORD *)(v5 - 376) = v73;
  v74 = *(_QWORD *)(v5 - 384);
  *(_QWORD *)(v68 + 64) = v73;
  *(_QWORD *)(v68 + 72) = v74;
  *(_QWORD *)(v5 - 384) = v74;
  v75 = *(_QWORD *)(v5 - 392);
  *(_QWORD *)(v5 - 392) = v75;
  v76 = *(_QWORD *)(v5 - 408);
  *(_QWORD *)(v68 + 80) = v75;
  *(_QWORD *)(v68 + 88) = v76;
  *(_QWORD *)(v5 - 408) = v76;
  v77 = *(_DWORD *)(v5 - 424);
  *(_BYTE *)(v68 + 96) = v77;
  *(_DWORD *)(v5 - 424) = v77;
  v78 = v66 + v67[16];
  v79 = *(_QWORD *)(v5 - 480);
  v80 = *(_QWORD *)(v5 - 488);
  *(_QWORD *)v78 = v79;
  *(_QWORD *)(v78 + 8) = v80;
  LODWORD(v64) = *(_DWORD *)(v5 - 496);
  *(_BYTE *)(v78 + 16) = v64;
  *(_QWORD *)(v78 + 24) = *(_QWORD *)(v5 - 472);
  *(_BYTE *)(v78 + 32) = *(_DWORD *)(v5 - 504);
  *(_QWORD *)(v78 + 40) = v41;
  *(_QWORD *)(v78 + 48) = v43;
  *(_QWORD *)(v78 + 56) = v45;
  *(_QWORD *)(v78 + 64) = v47;
  *(_BYTE *)(v78 + 72) = 0;
  v81 = v66 + v67[20];
  v82 = *(_QWORD *)(v5 - 432);
  sub_23C28950C(v82, v81, &qword_256B5C128);
  sub_23C2BED10(*(_QWORD *)(v5 - 352), *(_QWORD *)(v5 - 360), *(_QWORD *)(v5 - 400), *(_QWORD *)(v5 - 320));
  sub_23C289550(v79, v80, v64);
  swift_bridgeObjectRetain();
  sub_23C285184(*(_QWORD *)(v5 - 440), &qword_256B5C128);
  v83 = *(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v5 - 336) + 8);
  v84 = *(_QWORD *)(v5 - 328);
  v83(*(_QWORD *)(v5 - 344), v84);
  sub_23C285184(v82, &qword_256B5C128);
  sub_23C289340(v79, v80, v64);
  swift_bridgeObjectRelease();
  sub_23C2BEEB8(*(_QWORD *)(v5 - 352), *(_QWORD *)(v5 - 360), *(_QWORD *)(v5 - 400), *(_QWORD *)(v5 - 320));
  return ((uint64_t (*)(_QWORD, uint64_t))v83)(*(_QWORD *)(v5 - 448), v84);
}

uint64_t sub_23C31CADC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  __int128 *v3;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;

  v65 = a3;
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C018);
  MEMORY[0x24BDAC7A8](v64);
  v7 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23C34DE54();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (_OWORD *)((char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = sub_23C34E6D0();
  v62 = *(_QWORD *)(v11 - 8);
  v63 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BFA0);
  v61 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v60 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF90);
  MEMORY[0x24BDAC7A8](v66);
  v59 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v57 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = v3[3];
  v69 = v3[2];
  v70 = v22;
  v71 = v3[4];
  v72 = *((_QWORD *)v3 + 10);
  v23 = v3[1];
  v67 = *v3;
  v68 = v23;
  v24 = type metadata accessor for WorkoutProgram();
  sub_23C28950C(a1 + *(int *)(v24 + 32), (uint64_t)v21, &qword_256B5A368);
  v25 = type metadata accessor for WorkoutProgramPreview();
  v26 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 48))(v21, 1, v25);
  sub_23C285184((uint64_t)v21, &qword_256B5A368);
  if (v26 == 1)
  {
    swift_storeEnumTagMultiPayload();
    sub_23C323DA0();
    return sub_23C34E004();
  }
  else
  {
    v28 = swift_allocObject();
    v29 = a2[3];
    *(_QWORD *)(v28 + 16) = a2[2];
    *(_QWORD *)(v28 + 24) = v29;
    *(_QWORD *)(v28 + 128) = v72;
    v30 = a2[5];
    *(_QWORD *)(v28 + 32) = a2[4];
    *(_QWORD *)(v28 + 40) = v30;
    v31 = v70;
    *(_OWORD *)(v28 + 80) = v69;
    *(_OWORD *)(v28 + 96) = v31;
    *(_OWORD *)(v28 + 112) = v71;
    v32 = v68;
    *(_OWORD *)(v28 + 48) = v67;
    *(_OWORD *)(v28 + 64) = v32;
    MEMORY[0x24BDAC7A8](v28);
    *(&v57 - 6) = (char *)v33;
    *(&v57 - 5) = (char *)v34;
    *(&v57 - 4) = (char *)v35;
    *(&v57 - 3) = (char *)v36;
    *(&v57 - 2) = (char *)&v67;
    sub_23C321FF0((uint64_t)&v67);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C020);
    sub_23C2BFE70(&qword_256B5C028, &qword_256B5C020, sub_23C3242B8, MEMORY[0x24BDECC60]);
    v37 = v8;
    v38 = v60;
    sub_23C34E5D4();
    sub_23C34E6C4();
    v39 = (char *)v10 + *(int *)(v37 + 20);
    v40 = *MEMORY[0x24BDEEB68];
    v41 = sub_23C34DFB0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 104))(v39, v40, v41);
    __asm { FMOV            V0.2D, #12.0 }
    *v10 = _Q0;
    v47 = (uint64_t)v59;
    v48 = &v59[*(int *)(v66 + 36)];
    v57 = v18;
    v49 = v58;
    v50 = (uint64_t)v10;
    v51 = (uint64_t)v7;
    v53 = v62;
    v52 = v63;
    (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v48, v13, v63);
    v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BFB0);
    sub_23C282F90(v50, (uint64_t)&v48[*(int *)(v54 + 52)], (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    *(_WORD *)&v48[*(int *)(v54 + 56)] = 256;
    v55 = v61;
    (*(void (**)(uint64_t, char *, uint64_t))(v61 + 16))(v47, v38, v49);
    sub_23C283550(v50, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v13, v52);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v38, v49);
    v56 = (uint64_t)v57;
    sub_23C2894C8(v47, (uint64_t)v57, &qword_256B5BF90);
    sub_23C28950C(v56, v51, &qword_256B5BF90);
    swift_storeEnumTagMultiPayload();
    sub_23C323DA0();
    sub_23C34E004();
    return sub_23C285184(v56, &qword_256B5BF90);
  }
}

void sub_23C31CFA8()
{
  uint64_t v0;

  v0 = sub_23C34E25C();
  MEMORY[0x24BDAC7A8](v0);
  type metadata accessor for ProgramDetailView();
}

uint64_t sub_23C31D050()
{
  int64x2_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64x2_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;

  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  result = swift_release();
  if (*(unsigned __int8 *)(v6 - 144) >= 7u)
  {
    v13 = (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
    v15 = v14;
    *(_QWORD *)(v6 - 224) = v16;
    v18 = v17 & 1;
    sub_23C34E1CC();
    sub_23C34E1F0();
    swift_release();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, *MEMORY[0x24BDF17C8], v1);
    sub_23C34E28C();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v1);
    *(_QWORD *)(v6 - 232) = sub_23C34E334();
    v9 = v19;
    v21 = v20;
    v11 = v22;
    swift_release();
    v10 = v21 & 1;
    sub_23C289340(v13, v15, v18);
    swift_bridgeObjectRelease();
    result = swift_getKeyPath();
    v12 = vdupq_n_s64(3uLL);
    v12.i64[0] = result;
    v8 = *(_QWORD *)(v6 - 232);
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0uLL;
  }
  v0->i64[0] = v8;
  v0->i64[1] = v9;
  v0[1].i64[0] = v10;
  v0[1].i64[1] = v11;
  v0[2] = v12;
  v0[3].i8[0] = 0;
  return result;
}

uint64_t sub_23C31D1C0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  __int128 v7;
  __int128 v8;
  _OWORD v10[5];
  uint64_t v11;

  v7 = *(_OWORD *)(v3 + 48);
  v10[2] = *(_OWORD *)(v3 + 32);
  v10[3] = v7;
  v10[4] = *(_OWORD *)(v3 + 64);
  v11 = *(_QWORD *)(v3 + 80);
  v8 = *(_OWORD *)(v3 + 16);
  v10[0] = *(_OWORD *)v3;
  v10[1] = v8;
  *(_QWORD *)a3 = sub_23C34DFE0();
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BFD0);
  return sub_23C31D24C(a1, (uint64_t)v10, a2[2], a2[3], a2[4], a2[5]);
}

uint64_t sub_23C31D24C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  __int128 v12;
  __int128 v13;

  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = a4;
  *(_QWORD *)(v11 + 32) = a5;
  *(_QWORD *)(v11 + 40) = a6;
  v12 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v11 + 80) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v11 + 96) = v12;
  *(_OWORD *)(v11 + 112) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(v11 + 128) = *(_QWORD *)(a2 + 80);
  v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v11 + 48) = *(_OWORD *)a2;
  *(_OWORD *)(v11 + 64) = v13;
  swift_bridgeObjectRetain();
  sub_23C321FF0(a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A388);
  type metadata accessor for WorkoutProgramLinkAnnotation();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BFD8);
  sub_23C28943C(&qword_256B5BFE0, &qword_256B5A388, MEMORY[0x24BEE12D8]);
  sub_23C28943C(&qword_256B5BFE8, &qword_256B5BFD8, MEMORY[0x24BDF43B0]);
  sub_23C27FEE4(&qword_256B5BFF0, (uint64_t (*)(uint64_t))type metadata accessor for WorkoutProgramLinkAnnotation, (uint64_t)&protocol conformance descriptor for WorkoutProgramLinkAnnotation);
  return sub_23C34E694();
}

uint64_t sub_23C31D3B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD v24[10];

  v24[1] = a7;
  v13 = type metadata accessor for WorkoutProgramLinkAnnotation();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8](v13);
  sub_23C282F90(a1, (uint64_t)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for WorkoutProgramLinkAnnotation);
  v16 = (*(unsigned __int8 *)(v14 + 80) + 136) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a3;
  *(_QWORD *)(v17 + 24) = a4;
  *(_QWORD *)(v17 + 32) = a5;
  *(_QWORD *)(v17 + 40) = a6;
  v18 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v17 + 80) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v17 + 96) = v18;
  *(_OWORD *)(v17 + 112) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(v17 + 128) = *(_QWORD *)(a2 + 80);
  v19 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v17 + 48) = *(_OWORD *)a2;
  *(_OWORD *)(v17 + 64) = v19;
  sub_23C2851C0((uint64_t)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutProgramLinkAnnotation);
  v24[4] = a1;
  sub_23C321FF0(a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BFF8);
  v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5C000);
  v21 = sub_23C324138();
  v22 = sub_23C3241D4();
  v24[6] = v20;
  v24[7] = &type metadata for ReversedTitleIconLabelStyle;
  v24[8] = v21;
  v24[9] = v22;
  swift_getOpaqueTypeConformance2();
  return sub_23C34E5D4();
}

void sub_23C31D538()
{
  uint64_t v0;

  v0 = type metadata accessor for ProgramDetailAction();
  MEMORY[0x24BDAC7A8](v0);
  type metadata accessor for ProgramDetailView();
}

uint64_t sub_23C31D5E4()
{
  uint64_t (*v0)(_QWORD);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_23C318EE0();
  v3 = v2 + *(int *)(type metadata accessor for WorkoutProgramLinkAnnotation() + 24);
  v4 = sub_23C34D950();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(v1, v3, v4);
  swift_storeEnumTagMultiPayload();
  sub_23C34E7A8();
  swift_release();
  return sub_23C283550(v1, v0);
}

uint64_t sub_23C31D66C(uint64_t a1)
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
  uint64_t v11;
  uint64_t KeyPath;
  uint64_t *v13;
  _QWORD v15[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5B0B0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C000);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v15[0] = v9;
  v15[1] = v10;
  sub_23C2C0058();
  swift_bridgeObjectRetain();
  sub_23C34E5C8();
  sub_23C34E1E4();
  sub_23C34E220();
  v11 = sub_23C34E250();
  swift_release();
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v8, v5, v2);
  v13 = (uint64_t *)&v8[*(int *)(v6 + 36)];
  *v13 = KeyPath;
  v13[1] = v11;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v15[0] = 0x4000000000000000;
  sub_23C324138();
  sub_23C3241D4();
  sub_23C34E3AC();
  return sub_23C285184((uint64_t)v8, &qword_256B5C000);
}

uint64_t sub_23C31D81C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X5>, uint64_t a7@<X8>)
{
  __int128 *v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  char *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;

  v39 = a5;
  v46 = a4;
  v45 = a3;
  v42 = a2;
  v47 = a7;
  v38 = sub_23C34DA34();
  v37 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v44 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23C34D86C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF60);
  v41 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v40 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = v7[3];
  v56 = v7[2];
  v57 = v16;
  v58 = v7[4];
  v59 = *((_QWORD *)v7 + 10);
  v17 = v7[1];
  v54 = *v7;
  v55 = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  v18 = (*(unsigned __int8 *)(v12 + 80) + 136) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v19 = swift_allocObject();
  v21 = a6[2];
  v20 = a6[3];
  *(_QWORD *)(v19 + 16) = v21;
  *(_QWORD *)(v19 + 24) = v20;
  v22 = a6[4];
  v23 = a6[5];
  *(_QWORD *)(v19 + 32) = v22;
  *(_QWORD *)(v19 + 40) = v23;
  v24 = v57;
  *(_OWORD *)(v19 + 80) = v56;
  *(_OWORD *)(v19 + 96) = v24;
  *(_OWORD *)(v19 + 112) = v58;
  *(_QWORD *)(v19 + 128) = v59;
  v25 = v55;
  *(_OWORD *)(v19 + 48) = v54;
  *(_OWORD *)(v19 + 64) = v25;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v19 + v18, v14, v11);
  v50 = v56;
  v51 = v57;
  v52 = v58;
  v53 = v59;
  v48 = v54;
  v49 = v55;
  sub_23C321FF0((uint64_t)&v54);
  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  if ((BYTE1(v50) & 1) == 0)
  {
    v50 = v56;
    v51 = v57;
    v52 = v58;
    v53 = v59;
    v48 = v54;
    v49 = v55;
    sub_23C318EE0();
    swift_getKeyPath();
    sub_23C34E79C();
    swift_release();
    swift_release();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v44, v39, v38);
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = v21;
  *(_QWORD *)(v26 + 24) = v20;
  *(_QWORD *)(v26 + 32) = v22;
  *(_QWORD *)(v26 + 40) = v23;
  v27 = v57;
  *(_OWORD *)(v26 + 80) = v56;
  *(_OWORD *)(v26 + 96) = v27;
  *(_OWORD *)(v26 + 112) = v58;
  v28 = v59;
  v29 = v55;
  *(_OWORD *)(v26 + 48) = v54;
  *(_OWORD *)(v26 + 64) = v29;
  v30 = v42;
  *(_QWORD *)(v26 + 128) = v28;
  *(_QWORD *)(v26 + 136) = v30;
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = v21;
  *(_QWORD *)(v31 + 24) = v20;
  *(_QWORD *)(v31 + 32) = v22;
  *(_QWORD *)(v31 + 40) = v23;
  v32 = v57;
  *(_OWORD *)(v31 + 80) = v56;
  *(_OWORD *)(v31 + 96) = v32;
  *(_OWORD *)(v31 + 112) = v58;
  *(_QWORD *)(v31 + 128) = v59;
  v33 = v55;
  *(_OWORD *)(v31 + 48) = v54;
  *(_OWORD *)(v31 + 64) = v33;
  sub_23C321FF0((uint64_t)&v54);
  sub_23C321FF0((uint64_t)&v54);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BFC0);
  sub_23C28943C(&qword_256B5BFC8, &qword_256B5BFC0, MEMORY[0x24BDF4700]);
  v34 = v40;
  sub_23C34DC5C();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v41 + 32))(v47, v34, v43);
}

uint64_t sub_23C31DC68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v16;

  v4 = sub_23C34E25C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (*(uint64_t (**)(uint64_t, __n128))(a1 + 56))(a2, v6);
  v11 = v10;
  v13 = v12 & 1;
  sub_23C34E1D8();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v8, *MEMORY[0x24BDF17C8], v4);
  sub_23C34E28C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  v14 = sub_23C34E334();
  swift_release();
  sub_23C289340(v9, v11, v13);
  swift_bridgeObjectRelease();
  return v14;
}

void sub_23C31DDA8()
{
  uint64_t v0;

  v0 = type metadata accessor for ProgramDetailAction();
  MEMORY[0x24BDAC7A8](v0);
  type metadata accessor for ProgramDetailView();
}

uint64_t sub_23C31DE54()
{
  uint64_t (*v0)(_QWORD);
  uint64_t v1;

  sub_23C318EE0();
  swift_storeEnumTagMultiPayload();
  sub_23C34E7A8();
  swift_release();
  return sub_23C283550(v1, v0);
}

void sub_23C31DEAC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C048);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A748);
  MEMORY[0x24BDAC7A8](v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A750);
  MEMORY[0x24BDAC7A8](v4);
  sub_23C31E0D8((uint64_t)v2);
}

uint64_t sub_23C31DFA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t KeyPath;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  sub_23C34E1E4();
  sub_23C34E220();
  v5 = sub_23C34E250();
  swift_release();
  KeyPath = swift_getKeyPath();
  sub_23C28950C(v3, v1, &qword_256B5C048);
  v7 = (uint64_t *)(v1 + *(int *)(v4 + 36));
  *v7 = KeyPath;
  v7[1] = v5;
  sub_23C285184(v3, &qword_256B5C048);
  v8 = sub_23C34E6E8();
  sub_23C2EE14C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v2, 0.0, 1, 0.0, 1, v8, v9);
  sub_23C285184(v1, &qword_256B5A748);
  v10 = sub_23C34E178();
  sub_23C28950C(v2, v0, &qword_256B5A750);
  v11 = v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B5C020) + 36);
  *(_BYTE *)v11 = v10;
  *(_OWORD *)(v11 + 8) = 0u;
  *(_OWORD *)(v11 + 24) = 0u;
  *(_BYTE *)(v11 + 40) = 1;
  return sub_23C285184(v2, &qword_256B5A750);
}

void sub_23C31E0D8(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjCClassFromMetadata;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BED8);
  MEMORY[0x24BDAC7A8](v7);
  v1 = sub_23C34DA34();
  MEMORY[0x24BDAC7A8](v1);
  v2 = sub_23C34E868();
  MEMORY[0x24BDAC7A8](v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5B0B0);
  v6 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  sub_23C34E85C();
  type metadata accessor for LocalizationBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata, v6, v7, a1);
  type metadata accessor for ProgramDetailView();
}

uint64_t sub_23C31E28C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t result;

  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  *(_QWORD *)(v3 - 176) = sub_23C34E8A4();
  *(_QWORD *)(v3 - 168) = v4;
  sub_23C2C0058();
  sub_23C34E5C8();
  v5 = *MEMORY[0x24BDECF38];
  v6 = sub_23C34DE24();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v0, v5, v6);
  sub_23C27FEE4(&qword_256B5BF28, v7, MEMORY[0x24BDECF78]);
  result = sub_23C34E850();
  if ((result & 1) != 0)
  {
    sub_23C28943C(&qword_256B5B0B8, &qword_256B5B0B0, MEMORY[0x24BDF41A8]);
    sub_23C28943C(&qword_256B5BF08, &qword_256B5BED8, MEMORY[0x24BEE30C8]);
    sub_23C34E418();
    sub_23C285184(v0, &qword_256B5BED8);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 256) + 8))(v2, v1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23C31E424@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD v16[2];
  __int128 v17;
  __int128 v18;
  _OWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _OWORD v24[5];
  uint64_t v25;

  v16[1] = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BEB8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_OWORD *)(v2 + 48);
  v24[2] = *(_OWORD *)(v2 + 32);
  v24[3] = v8;
  v24[4] = *(_OWORD *)(v2 + 64);
  v25 = *(_QWORD *)(v2 + 80);
  v9 = *(_OWORD *)(v2 + 16);
  v24[0] = *(_OWORD *)v2;
  v24[1] = v9;
  v10 = *(_OWORD *)(a1 + 32);
  v17 = *(_OWORD *)(a1 + 16);
  v18 = v10;
  v19 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BEC0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BEC8);
  v11 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BED0);
  v12 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BED8);
  v13 = sub_23C323AF4();
  v14 = sub_23C28943C(&qword_256B5BF08, &qword_256B5BED8, MEMORY[0x24BEE30C8]);
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  swift_getOpaqueTypeConformance2();
  sub_23C28943C(&qword_256B5BF10, &qword_256B5BEC8, MEMORY[0x24BDF5428]);
  sub_23C34E2A4();
  sub_23C28943C(&qword_256B5BF18, &qword_256B5BEB8, MEMORY[0x24BDF1A70]);
  sub_23C323BFC();
  sub_23C34E508();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_23C31E604@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  char *v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  char *v39;
  char *v40;
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

  v40 = a6;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BE90);
  v38 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v39 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v37 = (char *)&v35 - v14;
  MEMORY[0x24BDAC7A8](v15);
  v36 = (char *)&v35 - v16;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v35 - v18;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a2;
  *(_QWORD *)(v20 + 24) = a3;
  *(_QWORD *)(v20 + 32) = a4;
  *(_QWORD *)(v20 + 40) = a5;
  v21 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v20 + 80) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v20 + 96) = v21;
  *(_OWORD *)(v20 + 112) = *(_OWORD *)(a1 + 64);
  *(_QWORD *)(v20 + 128) = *(_QWORD *)(a1 + 80);
  v22 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v20 + 48) = *(_OWORD *)a1;
  *(_OWORD *)(v20 + 64) = v22;
  v46 = a2;
  v47 = a3;
  v48 = a4;
  v49 = a5;
  v50 = a1;
  sub_23C321FF0(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5B0B0);
  sub_23C28943C(&qword_256B5B0B8, &qword_256B5B0B0, MEMORY[0x24BDF41A8]);
  sub_23C34E5D4();
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = a2;
  *(_QWORD *)(v23 + 24) = a3;
  *(_QWORD *)(v23 + 32) = a4;
  *(_QWORD *)(v23 + 40) = a5;
  v24 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v23 + 80) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v23 + 96) = v24;
  *(_OWORD *)(v23 + 112) = *(_OWORD *)(a1 + 64);
  *(_QWORD *)(v23 + 128) = *(_QWORD *)(a1 + 80);
  v25 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v23 + 48) = *(_OWORD *)a1;
  *(_OWORD *)(v23 + 64) = v25;
  v41 = a2;
  v42 = a3;
  v43 = a4;
  v44 = a5;
  v45 = a1;
  sub_23C321FF0(a1);
  v26 = v36;
  sub_23C34E5D4();
  v27 = v37;
  v28 = v38;
  v29 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
  v29(v37, v19, v11);
  v30 = v39;
  v29(v39, v26, v11);
  v31 = v40;
  v29(v40, v27, v11);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF30);
  v29(&v31[*(int *)(v32 + 48)], v30, v11);
  v33 = *(void (**)(char *, uint64_t))(v28 + 8);
  v33(v26, v11);
  v33(v19, v11);
  v33(v30, v11);
  return ((uint64_t (*)(char *, uint64_t))v33)(v27, v11);
}

void sub_23C31E8BC()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5B0B0);
  MEMORY[0x24BDAC7A8](v0);
  type metadata accessor for ProgramDetailView();
}

uint64_t sub_23C31E964()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  sub_23C34DF98();
  v5 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(v4 - 144) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(v4 - 128) = v5;
  *(_OWORD *)(v4 - 112) = *(_OWORD *)(v3 + 64);
  *(_QWORD *)(v4 - 96) = *(_QWORD *)(v3 + 80);
  v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v4 - 176) = *(_OWORD *)v3;
  *(_OWORD *)(v4 - 160) = v6;
  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  sub_23C34E5BC();
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v0 + 32))(*(_QWORD *)(v4 - 216), v2, v1);
}

void sub_23C31EAC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;

  v0 = sub_23C34DA34();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_23C34E868();
  MEMORY[0x24BDAC7A8](v1);
  sub_23C34E85C();
  type metadata accessor for LocalizationBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  type metadata accessor for ProgramDetailView();
}

uint64_t sub_23C31EBF0()
{
  uint64_t v0;
  uint64_t v1;

  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  *(_QWORD *)(v0 - 176) = sub_23C34E8A4();
  *(_QWORD *)(v0 - 168) = v1;
  sub_23C2C0058();
  return sub_23C34E5C8();
}

uint64_t sub_23C31ECA0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  uint64_t result;
  _QWORD v16[6];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BED8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23C34E25C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23C34E598();
  sub_23C34E1D8();
  sub_23C34E1F0();
  swift_release();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDF17C8], v3);
  v8 = sub_23C34E28C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  KeyPath = swift_getKeyPath();
  v10 = sub_23C34E550();
  v11 = swift_getKeyPath();
  v16[1] = v7;
  v16[2] = KeyPath;
  v16[3] = v8;
  v16[4] = v11;
  v16[5] = v10;
  v12 = *MEMORY[0x24BDECF00];
  v13 = sub_23C34DE24();
  v14 = (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50];
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v2, v12, v13);
  sub_23C27FEE4(&qword_256B5BF28, v14, MEMORY[0x24BDECF78]);
  result = sub_23C34E850();
  if ((result & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BED0);
    sub_23C323AF4();
    sub_23C28943C(&qword_256B5BF08, &qword_256B5BED8, MEMORY[0x24BEE30C8]);
    sub_23C34E418();
    sub_23C285184((uint64_t)v2, &qword_256B5BED8);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t ProgramDetailView.body.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t (*v12)(uint64_t);
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
  uint64_t OpaqueTypeConformance2;
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
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  __int128 *v55;
  char *v56;
  uint64_t v57;
  __int128 *v58;
  __int128 v59;
  __int128 v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t ObjCClassFromMetadata;
  id v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(uint64_t, uint64_t);
  _QWORD v83[4];
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  __int128 *v108;
  char *v109;
  char *v110;
  uint64_t v111;
  char *v112;
  _QWORD *v113;
  uint64_t v114;
  uint64_t v115;
  __int128 *v116;
  uint64_t v117;
  __int128 *v118;
  uint64_t v119;
  uint64_t v120;
  __int128 *v121;
  uint64_t v122;
  __int128 *v123;
  uint64_t v124;
  uint64_t v125;
  __int128 *v126;
  uint64_t v127;
  __int128 *v128;
  uint64_t v129;
  uint64_t v130;
  __int128 *v131;
  uint64_t v132;
  __int128 *v133;
  uint64_t v134;
  uint64_t v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  uint64_t v141;
  _QWORD v142[2];
  uint64_t v143;
  _QWORD v144[2];
  _QWORD v145[2];
  _QWORD v146[2];
  _QWORD v147[2];
  _QWORD v148[2];
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  uint64_t v154;

  v111 = a2;
  v3 = sub_23C34DA34();
  MEMORY[0x24BDAC7A8](v3);
  v110 = (char *)v83 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23C34E868();
  MEMORY[0x24BDAC7A8](v5);
  v109 = (char *)v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B57C78);
  v107 = a1[2];
  v113 = a1;
  sub_23C34DE30();
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCE8);
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCF0);
  swift_getTupleTypeMetadata2();
  v7 = sub_23C34E700();
  v8 = MEMORY[0x24BDF5428];
  MEMORY[0x24261C66C](MEMORY[0x24BDF5428], v7);
  sub_23C34E64C();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCF8);
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD00);
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD08);
  swift_getTupleTypeMetadata2();
  v9 = sub_23C34E700();
  MEMORY[0x24261C66C](v8, v9);
  sub_23C34E64C();
  sub_23C34E010();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD10);
  v106 = a1[3];
  sub_23C34DE30();
  swift_getTupleTypeMetadata2();
  sub_23C34E700();
  sub_23C34E58C();
  sub_23C34DE30();
  swift_getTupleTypeMetadata2();
  v10 = sub_23C34E700();
  MEMORY[0x24261C66C](v8, v10);
  v11 = sub_23C34E64C();
  sub_23C34E0DC();
  v12 = (uint64_t (*)(uint64_t))MEMORY[0x24BDF02F8];
  v13 = sub_23C34DE30();
  v14 = sub_23C34DE30();
  v15 = sub_23C34DE30();
  v16 = MEMORY[0x24261C66C](MEMORY[0x24BDF4700], v11);
  v17 = sub_23C27FEE4(&qword_256B58D68, v12, MEMORY[0x24BDF02F0]);
  v148[0] = v16;
  v148[1] = v17;
  v18 = MEMORY[0x24BDED308];
  v147[0] = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v13, v148);
  v147[1] = v17;
  v146[0] = MEMORY[0x24261C66C](v18, v14, v147);
  v146[1] = v17;
  MEMORY[0x24261C66C](v18, v15, v146);
  v19 = sub_23C34DD34();
  v20 = sub_23C34DE30();
  v145[0] = MEMORY[0x24261C66C](MEMORY[0x24BDEB238], v19);
  v145[1] = MEMORY[0x24BDF1050];
  v21 = MEMORY[0x24261C66C](v18, v20, v145);
  *(_QWORD *)&v149 = v20;
  *((_QWORD *)&v149 + 1) = v21;
  MEMORY[0x24261C60C](255, &v149, MEMORY[0x24BDF2670], 0);
  v22 = sub_23C34E010();
  v86 = v22;
  v23 = sub_23C34E58C();
  v94 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v91 = (char *)v83 - v24;
  v90 = v23;
  v25 = sub_23C34DE30();
  v95 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v93 = (char *)v83 - v26;
  v27 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD18);
  v28 = sub_23C28943C(qword_256B57C88, &qword_256B57C78, MEMORY[0x24BDEBC00]);
  *(_QWORD *)&v149 = v20;
  *((_QWORD *)&v149 + 1) = v21;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v144[0] = v28;
  v144[1] = OpaqueTypeConformance2;
  v143 = MEMORY[0x24261C66C](MEMORY[0x24BDEF3E0], v22, v144);
  v89 = MEMORY[0x24261C66C](MEMORY[0x24BDF3F50], v23, &v143);
  v142[0] = v89;
  v142[1] = MEMORY[0x24BDF0910];
  v30 = MEMORY[0x24261C66C](v18, v25, v142);
  v31 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD20);
  v32 = sub_23C28943C(&qword_256B5BD28, &qword_256B5BD20, MEMORY[0x24BDEDAF0]);
  *(_QWORD *)&v149 = v31;
  *((_QWORD *)&v149 + 1) = v32;
  v33 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)&v149 = v25;
  *((_QWORD *)&v149 + 1) = v27;
  v83[3] = v27;
  v84 = v25;
  v83[1] = v33;
  v83[2] = v30;
  *(_QWORD *)&v150 = v30;
  *((_QWORD *)&v150 + 1) = v33;
  v34 = v33;
  v35 = MEMORY[0x24261C60C](0, &v149, MEMORY[0x24BDF3858], 0);
  v92 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v85 = (char *)v83 - v36;
  *(_QWORD *)&v149 = v25;
  *((_QWORD *)&v149 + 1) = v27;
  *(_QWORD *)&v150 = v30;
  *((_QWORD *)&v150 + 1) = v34;
  v37 = swift_getOpaqueTypeConformance2();
  v87 = v35;
  v88 = v37;
  *(_QWORD *)&v149 = v35;
  *((_QWORD *)&v149 + 1) = v37;
  v38 = v37;
  v39 = MEMORY[0x24261C60C](0, &v149, MEMORY[0x24BDF3888], 0);
  v105 = *(_QWORD *)(v39 - 8);
  v40 = v39;
  v101 = v39;
  MEMORY[0x24BDAC7A8](v39);
  v112 = (char *)v83 - v41;
  v42 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD30);
  v100 = v42;
  *(_QWORD *)&v149 = v35;
  *((_QWORD *)&v149 + 1) = v38;
  v43 = swift_getOpaqueTypeConformance2();
  v99 = v43;
  v44 = sub_23C2C0058();
  v97 = v44;
  v96 = sub_23C28943C(&qword_256B5BD38, &qword_256B5BD30, MEMORY[0x24BDF5428]);
  *(_QWORD *)&v149 = v40;
  *((_QWORD *)&v149 + 1) = MEMORY[0x24BEE0D00];
  *(_QWORD *)&v150 = v42;
  *((_QWORD *)&v150 + 1) = MEMORY[0x24BDF1FA8];
  *(_QWORD *)&v151 = v43;
  *((_QWORD *)&v151 + 1) = v44;
  *(_QWORD *)&v152 = v96;
  *((_QWORD *)&v152 + 1) = MEMORY[0x24BDF1F80];
  v45 = MEMORY[0x24261C60C](0, &v149, MEMORY[0x24BDF2BF0], 0);
  v46 = *(_QWORD *)(v45 - 8);
  v103 = v45;
  v104 = v46;
  MEMORY[0x24BDAC7A8](v45);
  v98 = (char *)v83 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v48);
  v102 = (uint64_t)v83 - v49;
  v50 = v107;
  v51 = v108[3];
  v151 = v108[2];
  v152 = v51;
  v153 = v108[4];
  v154 = *((_QWORD *)v108 + 10);
  v52 = v108[1];
  v149 = *v108;
  v150 = v52;
  v53 = v106;
  v129 = v107;
  v130 = v106;
  v54 = v113[5];
  v131 = (__int128 *)v113[4];
  v132 = v54;
  v55 = v131;
  v133 = &v149;
  v56 = v91;
  sub_23C34E580();
  v57 = swift_allocObject();
  *(_QWORD *)(v57 + 16) = v50;
  *(_QWORD *)(v57 + 24) = v53;
  *(_QWORD *)(v57 + 32) = v55;
  *(_QWORD *)(v57 + 40) = v54;
  v58 = v55;
  v108 = v55;
  v59 = v152;
  *(_OWORD *)(v57 + 80) = v151;
  *(_OWORD *)(v57 + 96) = v59;
  *(_OWORD *)(v57 + 112) = v153;
  *(_QWORD *)(v57 + 128) = v154;
  v60 = v150;
  *(_OWORD *)(v57 + 48) = v149;
  *(_OWORD *)(v57 + 64) = v60;
  sub_23C321FF0((uint64_t)&v149);
  v61 = v93;
  v62 = v90;
  sub_23C34E4E4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v94 + 8))(v56, v62);
  v124 = v50;
  v125 = v53;
  v63 = v50;
  v64 = v53;
  v126 = v58;
  v127 = v54;
  v128 = &v149;
  v65 = v84;
  v66 = v85;
  sub_23C34E4C0();
  (*(void (**)(char *, uint64_t))(v95 + 8))(v61, v65);
  __swift_instantiateConcreteTypeFromMangledName(qword_256B5BD40);
  sub_23C34DE78();
  v67 = swift_allocObject();
  *(_OWORD *)(v67 + 16) = xmmword_23C353A20;
  sub_23C34DE6C();
  v68 = v87;
  MEMORY[0x24261BBC8](1, v67, v87, v88);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v92 + 8))(v66, v68);
  sub_23C34E85C();
  type metadata accessor for LocalizationBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v70 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v138 = v151;
  v139 = v152;
  v140 = v153;
  v141 = v154;
  v136 = v149;
  v137 = v150;
  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  v134 = sub_23C34E8A4();
  v135 = v71;
  v138 = v151;
  v139 = v152;
  v140 = v153;
  v141 = v154;
  v136 = v149;
  v137 = v150;
  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E7B4();
  swift_release();
  swift_release();
  v113 = v83;
  v119 = v63;
  v120 = v64;
  v121 = v108;
  v122 = v54;
  v123 = &v149;
  v114 = v63;
  v115 = v64;
  v116 = v108;
  v117 = v54;
  v118 = &v149;
  v72 = v96;
  v73 = v97;
  v74 = v99;
  v75 = v100;
  v76 = v101;
  v77 = (uint64_t)v98;
  v78 = v112;
  sub_23C34E430();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v105 + 8))(v78, v76);
  *(_QWORD *)&v136 = v76;
  *((_QWORD *)&v136 + 1) = MEMORY[0x24BEE0D00];
  *(_QWORD *)&v137 = v75;
  *((_QWORD *)&v137 + 1) = MEMORY[0x24BDF1FA8];
  *(_QWORD *)&v138 = v74;
  *((_QWORD *)&v138 + 1) = v73;
  *(_QWORD *)&v139 = v72;
  *((_QWORD *)&v139 + 1) = MEMORY[0x24BDF1F80];
  swift_getOpaqueTypeConformance2();
  v80 = v102;
  v79 = v103;
  sub_23C28958C(v77, v103, v102);
  v81 = *(void (**)(uint64_t, uint64_t))(v104 + 8);
  v81(v77, v79);
  sub_23C287D30(v80, v79, v111);
  return ((uint64_t (*)(uint64_t, uint64_t))v81)(v80, v79);
}

void sub_23C31FB84(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __n128 v23;
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
  uint64_t State;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
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
  _OWORD v62[5];
  uint64_t v63;
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];

  v56 = a5;
  v55 = a4;
  v57 = a3;
  v54 = a6;
  sub_23C34DE30();
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCE8);
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCF0);
  swift_getTupleTypeMetadata2();
  v8 = sub_23C34E700();
  v9 = MEMORY[0x24BDF5428];
  MEMORY[0x24261C66C](MEMORY[0x24BDF5428], v8);
  sub_23C34E64C();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCF8);
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD00);
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD08);
  swift_getTupleTypeMetadata2();
  v10 = sub_23C34E700();
  MEMORY[0x24261C66C](v9, v10);
  sub_23C34E64C();
  sub_23C34E010();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD10);
  sub_23C34DE30();
  swift_getTupleTypeMetadata2();
  sub_23C34E700();
  sub_23C34E58C();
  sub_23C34DE30();
  swift_getTupleTypeMetadata2();
  v11 = sub_23C34E700();
  MEMORY[0x24261C66C](v9, v11);
  v12 = sub_23C34E64C();
  sub_23C34E0DC();
  v13 = (uint64_t (*)(uint64_t))MEMORY[0x24BDF02F8];
  v14 = sub_23C34DE30();
  v15 = sub_23C34DE30();
  v16 = sub_23C34DE30();
  v17 = MEMORY[0x24261C66C](MEMORY[0x24BDF4700], v12);
  v18 = sub_23C27FEE4(&qword_256B58D68, v13, MEMORY[0x24BDF02F0]);
  v67[0] = v17;
  v67[1] = v18;
  v19 = MEMORY[0x24BDED308];
  v66[0] = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v14, v67);
  v66[1] = v18;
  v65[0] = MEMORY[0x24261C66C](v19, v15, v66);
  v65[1] = v18;
  v37[3] = v16;
  v37[2] = MEMORY[0x24261C66C](v19, v16, v65);
  v20 = sub_23C34DD34();
  v40 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v49 = (char *)v37 - v21;
  v22 = sub_23C34DE30();
  v45 = *(_QWORD *)(v22 - 8);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v43 = (char *)v37 - v24;
  v39 = MEMORY[0x24261C66C](MEMORY[0x24BDEB238], v20, v23);
  v64[0] = v39;
  v64[1] = MEMORY[0x24BDF1050];
  v25 = MEMORY[0x24261C66C](v19, v22, v64);
  *(_QWORD *)&v62[0] = v22;
  *((_QWORD *)&v62[0] + 1) = v25;
  v51 = v25;
  v26 = MEMORY[0x24261C60C](0, v62, MEMORY[0x24BDF2670], 0);
  v42 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v46 = (char *)v37 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v41 = (char *)v37 - v29;
  MEMORY[0x24BDAC7A8](v30);
  v44 = (char *)v37 - v31;
  v38 = type metadata accessor for WorkoutProgram();
  MEMORY[0x24BDAC7A8](v38);
  v50 = (char *)v37 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57C78);
  v48 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  State = type metadata accessor for ProgramDetailLoadState();
  MEMORY[0x24BDAC7A8](State);
  v53 = sub_23C34E010();
  v52 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v35 = *(_OWORD *)(a1 + 48);
  v62[2] = *(_OWORD *)(a1 + 32);
  v62[3] = v35;
  v62[4] = *(_OWORD *)(a1 + 64);
  v63 = *(_QWORD *)(a1 + 80);
  v36 = *(_OWORD *)(a1 + 16);
  v62[0] = *(_OWORD *)a1;
  v62[1] = v36;
  v47 = a2;
  v58 = a2;
  v59 = v57;
  v60 = v55;
  v61 = v56;
  type metadata accessor for ProgramDetailView();
}

uint64_t sub_23C3201E4(uint64_t a1)
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
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t OpaqueTypeConformance2;

  *(_QWORD *)(v9 - 472) = a1;
  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v6, 2, v10))
  {
    sub_23C34DD7C();
    sub_23C28943C(qword_256B57C88, &qword_256B57C78, MEMORY[0x24BDEBC00]);
    v11 = *(_QWORD *)(v9 - 344);
    *(_QWORD *)(v9 - 240) = v4;
    *(_QWORD *)(v9 - 232) = v11;
    swift_getOpaqueTypeConformance2();
    sub_23C328CC8(v5, v3);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 368) + 8))(v5, v3);
    v12 = *(_QWORD *)(v9 - 320);
    v13 = *(_QWORD *)(v9 - 328);
    v14 = *(_QWORD *)(v9 - 336);
    v15 = v8;
  }
  else
  {
    *(_QWORD *)(v9 - 480) = v2;
    *(_QWORD *)(v9 - 368) = v3;
    v16 = v7;
    v11 = *(_QWORD *)(v9 - 344);
    sub_23C2851C0(v6, *(_QWORD *)(v9 - 352), (uint64_t (*)(_QWORD))type metadata accessor for WorkoutProgram);
    v17 = sub_23C34E160();
    MEMORY[0x24BDAC7A8](v17);
    sub_23C328F40();
    sub_23C34DE3C();
    v18 = *(_OWORD *)(v1 + 48);
    *(_OWORD *)(v9 - 208) = *(_OWORD *)(v1 + 32);
    *(_OWORD *)(v9 - 192) = v18;
    *(_OWORD *)(v9 - 176) = *(_OWORD *)(v1 + 64);
    *(_QWORD *)(v9 - 160) = *(_QWORD *)(v1 + 80);
    v19 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)(v9 - 240) = *(_OWORD *)v1;
    *(_OWORD *)(v9 - 224) = v19;
    sub_23C318EE0();
    swift_getKeyPath();
    sub_23C34E79C();
    swift_release();
    swift_release();
    if (*(unsigned __int8 *)(v9 - 208) < 7u)
      goto LABEL_5;
    v20 = *(_OWORD *)(v1 + 48);
    *(_OWORD *)(v9 - 208) = *(_OWORD *)(v1 + 32);
    *(_OWORD *)(v9 - 192) = v20;
    *(_OWORD *)(v9 - 176) = *(_OWORD *)(v1 + 64);
    *(_QWORD *)(v9 - 160) = *(_QWORD *)(v1 + 80);
    v21 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)(v9 - 240) = *(_OWORD *)v1;
    *(_OWORD *)(v9 - 224) = v21;
    sub_23C318EE0();
    swift_getKeyPath();
    sub_23C34E79C();
    swift_release();
    swift_release();
    if (*(_BYTE *)(v9 - 207) == 1)
LABEL_5:
      sub_23C34E184();
    else
      sub_23C34E1A8();
    v15 = v8;
    v22 = *(_QWORD *)(v9 - 408);
    v23 = *(_QWORD *)(v9 - 480);
    v24 = *(_QWORD *)(v9 - 360);
    sub_23C34E424();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 432) + 8))(v24, v23);
    v25 = *(_OWORD *)(v1 + 48);
    *(_OWORD *)(v9 - 208) = *(_OWORD *)(v1 + 32);
    *(_OWORD *)(v9 - 192) = v25;
    *(_OWORD *)(v9 - 176) = *(_OWORD *)(v1 + 64);
    *(_QWORD *)(v9 - 160) = *(_QWORD *)(v1 + 80);
    v26 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)(v9 - 240) = *(_OWORD *)v1;
    *(_OWORD *)(v9 - 224) = v26;
    sub_23C318EE0();
    swift_getKeyPath();
    sub_23C34E7B4();
    swift_release();
    swift_release();
    v27 = *(_QWORD *)(v9 - 352);
    v28 = *(_QWORD *)(v9 - 424);
    sub_23C34E400();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 392) + 8))(v22, v4);
    *(_QWORD *)(v9 - 240) = v4;
    *(_QWORD *)(v9 - 232) = v11;
    swift_getOpaqueTypeConformance2();
    v29 = *(_QWORD *)(v9 - 400);
    sub_23C28958C(v28, v16, v29);
    v30 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 416) + 8);
    v30(v28, v16);
    v31 = *(_QWORD *)(v9 - 384);
    sub_23C287D30(v29, v16, v31);
    sub_23C28943C(qword_256B57C88, &qword_256B57C78, MEMORY[0x24BDEBC00]);
    sub_23C328C04(v31, *(_QWORD *)(v9 - 368), v16);
    v30(v31, v16);
    v30(v29, v16);
    sub_23C283550(v27, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutProgram);
    v12 = *(_QWORD *)(v9 - 320);
    v13 = *(_QWORD *)(v9 - 328);
    v14 = *(_QWORD *)(v9 - 336);
  }
  v32 = sub_23C28943C(qword_256B57C88, &qword_256B57C78, MEMORY[0x24BDEBC00]);
  *(_QWORD *)(v9 - 240) = v4;
  *(_QWORD *)(v9 - 232) = v11;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v9 - 288) = v32;
  *(_QWORD *)(v9 - 280) = OpaqueTypeConformance2;
  MEMORY[0x24261C66C](MEMORY[0x24BDEF3E0], v13, v9 - 288);
  sub_23C287D30(v15, v13, v12);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v15, v13);
}

uint64_t sub_23C320734()
{
  return sub_23C3242A4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C31FB84);
}

void sub_23C320740(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
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
  __int128 v26;
  __int128 v27;
  _QWORD v28[7];
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
  __int128 *v40;
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
  uint64_t v51;

  v34 = a6;
  v32 = a5;
  v33 = a2;
  v35 = a7;
  sub_23C34DE30();
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCE8);
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCF0);
  swift_getTupleTypeMetadata2();
  v10 = sub_23C34E700();
  v11 = MEMORY[0x24BDF5428];
  MEMORY[0x24261C66C](MEMORY[0x24BDF5428], v10);
  sub_23C34E64C();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCF8);
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD00);
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD08);
  swift_getTupleTypeMetadata2();
  v12 = sub_23C34E700();
  MEMORY[0x24261C66C](v11, v12);
  sub_23C34E64C();
  sub_23C34E010();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD10);
  sub_23C34DE30();
  swift_getTupleTypeMetadata2();
  sub_23C34E700();
  sub_23C34E58C();
  sub_23C34DE30();
  swift_getTupleTypeMetadata2();
  v13 = sub_23C34E700();
  MEMORY[0x24261C66C](v11, v13);
  v14 = sub_23C34E64C();
  v28[1] = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  sub_23C34E0DC();
  v15 = sub_23C34DE30();
  v28[3] = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v28[0] = (char *)v28 - v16;
  v17 = sub_23C34DE30();
  v30 = *(_QWORD *)(v17 - 8);
  v28[5] = v17;
  MEMORY[0x24BDAC7A8](v17);
  v28[2] = (char *)v28 - v18;
  v29 = sub_23C34DE30();
  v31 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v28[4] = (char *)v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v28[6] = (char *)v28 - v21;
  sub_23C34DFEC();
  v22 = a3;
  v36 = a3;
  v23 = a4;
  v37 = a4;
  v24 = v32;
  v38 = v32;
  v25 = v34;
  v39 = v34;
  v40 = a1;
  v41 = v33;
  sub_23C34E640();
  sub_23C34E19C();
  v26 = a1[3];
  v48 = a1[2];
  v49 = v26;
  v50 = a1[4];
  v51 = *((_QWORD *)a1 + 10);
  v27 = a1[1];
  v46 = *a1;
  v47 = v27;
  v42 = v22;
  v43 = v23;
  v44 = v24;
  v45 = v25;
  type metadata accessor for ProgramDetailView();
}

uint64_t sub_23C320BFC()
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
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);

  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  v6 = *(_QWORD *)(v5 - 168);
  v7 = MEMORY[0x24261C66C](MEMORY[0x24BDF4700], v3);
  v8 = *(_QWORD *)(v5 - 432);
  sub_23C318DEC(v2, v6, 0, v3, v7);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 424) + 8))(v4, v3);
  v9 = sub_23C34E1B4();
  v10 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v5 - 144) = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v5 - 128) = v10;
  *(_OWORD *)(v5 - 112) = *(_OWORD *)(v0 + 64);
  *(_QWORD *)(v5 - 96) = *(_QWORD *)(v0 + 80);
  v11 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v5 - 176) = *(_OWORD *)v0;
  *(_OWORD *)(v5 - 160) = v11;
  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  v12 = *(_QWORD *)(v5 - 152);
  v13 = sub_23C27FEE4(&qword_256B58D68, (uint64_t (*)(uint64_t))MEMORY[0x24BDF02F8], MEMORY[0x24BDF02F0]);
  *(_QWORD *)(v5 - 224) = v7;
  *(_QWORD *)(v5 - 216) = v13;
  v14 = MEMORY[0x24BDED308];
  v15 = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v1, v5 - 224);
  v16 = *(_QWORD *)(v5 - 416);
  sub_23C318DEC(v9, v12, 0, v1, v15);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 408) + 8))(v8, v1);
  v17 = sub_23C34E190();
  v18 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v5 - 144) = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v5 - 128) = v18;
  *(_OWORD *)(v5 - 112) = *(_OWORD *)(v0 + 64);
  *(_QWORD *)(v5 - 96) = *(_QWORD *)(v0 + 80);
  v19 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v5 - 176) = *(_OWORD *)v0;
  *(_OWORD *)(v5 - 160) = v19;
  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  v20 = *(_QWORD *)(v5 - 176);
  *(_QWORD *)(v5 - 240) = v15;
  *(_QWORD *)(v5 - 232) = v13;
  v21 = *(_QWORD *)(v5 - 392);
  v22 = MEMORY[0x24261C66C](v14, v21, v5 - 240);
  v23 = *(_QWORD *)(v5 - 400);
  sub_23C318DEC(v17, v20, 0, v21, v22);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 368) + 8))(v16, v21);
  *(_QWORD *)(v5 - 256) = v22;
  *(_QWORD *)(v5 - 248) = v13;
  v24 = *(_QWORD *)(v5 - 376);
  MEMORY[0x24261C66C](v14, v24, v5 - 256);
  v25 = *(_QWORD *)(v5 - 384);
  sub_23C28958C(v23, v24, v25);
  v26 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 360) + 8);
  v26(v23, v24);
  sub_23C287D30(v25, v24, *(_QWORD *)(v5 - 328));
  return ((uint64_t (*)(uint64_t, uint64_t))v26)(v25, v24);
}

void sub_23C320ED4(__int128 *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
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
  __int128 v21;
  __int128 v22;
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
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
  uint64_t v51;

  v40 = a4;
  v41 = a5;
  v38 = a2;
  v39 = a3;
  v35 = a6;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD10);
  sub_23C34DE30();
  swift_getTupleTypeMetadata2();
  v27 = sub_23C34E700();
  v7 = sub_23C34E58C();
  v8 = *(_QWORD *)(v7 - 8);
  v29 = v7;
  v32 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v26 = (char *)v23 - v9;
  v31 = sub_23C34DE30();
  v33 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v34 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v28 = (char *)v23 - v12;
  MEMORY[0x24BDAC7A8](v13);
  v30 = (char *)v23 - v14;
  sub_23C34DE30();
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCE8);
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCF0);
  swift_getTupleTypeMetadata2();
  v15 = sub_23C34E700();
  v16 = MEMORY[0x24BDF5428];
  MEMORY[0x24261C66C](MEMORY[0x24BDF5428], v15);
  v23[0] = sub_23C34E64C();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCF8);
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD00);
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD08);
  swift_getTupleTypeMetadata2();
  v17 = sub_23C34E700();
  MEMORY[0x24261C66C](v16, v17);
  v23[1] = sub_23C34E64C();
  v18 = sub_23C34E010();
  v25 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v24 = sub_23C34DE30();
  v37 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  MEMORY[0x24BDAC7A8](v19);
  v36 = (char *)v23 - v20;
  v21 = a1[3];
  v48 = a1[2];
  v49 = v21;
  v50 = a1[4];
  v51 = *((_QWORD *)a1 + 10);
  v22 = a1[1];
  v46 = *a1;
  v47 = v22;
  type metadata accessor for WorkoutProgram();
  v42 = v38;
  v43 = v39;
  v44 = v40;
  v45 = v41;
  type metadata accessor for ProgramDetailView();
}

uint64_t sub_23C3212D8(uint64_t a1)
{
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;

  v1[2] = a1;
  sub_23C31910C(v5, v3, v2, v7, v5, a1, v8);
  sub_23C34E190();
  v11 = MEMORY[0x24BDF4700];
  v12 = MEMORY[0x24261C66C](MEMORY[0x24BDF4700], *v1);
  v13 = MEMORY[0x24261C66C](v11, v1[1]);
  *(_QWORD *)(v10 - 240) = v12;
  *(_QWORD *)(v10 - 232) = v13;
  v14 = MEMORY[0x24261C66C](MEMORY[0x24BDEF3E0], v6, v10 - 240);
  sub_23C34E4B4();
  (*(void (**)(uint64_t, uint64_t))(v1[5] + 8))(v8, v6);
  v15 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v10 - 256) = v14;
  *(_QWORD *)(v10 - 248) = v15;
  v16 = v1[3];
  v17 = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v16, v10 - 256);
  v1[4] = v4;
  v1[5] = v17;
  sub_23C28958C(v4, v16, v1[16]);
  v18 = *(void (**)(uint64_t, uint64_t))(v1[17] + 8);
  v19 = v4;
  v20 = v16;
  v18(v19, v16);
  v21 = v1[19];
  v1[24] = v1[18];
  v1[25] = v21;
  v22 = v1[21];
  v1[26] = v1[20];
  v1[27] = v22;
  v1[28] = v9;
  v1[29] = v5;
  v23 = MEMORY[0x24261C66C](MEMORY[0x24BDF5428], v1[7]);
  v24 = v1[6];
  sub_23C34E580();
  v25 = *(_OWORD *)(v9 + 48);
  *(_OWORD *)(v10 - 160) = *(_OWORD *)(v9 + 32);
  *(_OWORD *)(v10 - 144) = v25;
  *(_OWORD *)(v10 - 128) = *(_OWORD *)(v9 + 64);
  *(_QWORD *)(v10 - 112) = *(_QWORD *)(v9 + 80);
  v26 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)(v10 - 192) = *(_OWORD *)v9;
  *(_OWORD *)(v10 - 176) = v26;
  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  v1[35] = v23;
  v27 = v1[9];
  v28 = MEMORY[0x24261C66C](MEMORY[0x24BDF3F50], v27, v1 + 35);
  v29 = v1[8];
  sub_23C34E49C();
  (*(void (**)(uint64_t, uint64_t))(v1[12] + 8))(v24, v27);
  v30 = MEMORY[0x24BDEC438];
  v1[33] = v28;
  v1[34] = v30;
  v31 = v1[11];
  v32 = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v31, v1 + 33);
  v33 = v1[10];
  v34 = v29;
  sub_23C28958C(v29, v31, v33);
  v35 = v1[13];
  v36 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
  v36(v34, v31);
  v37 = v1[16];
  v38 = v1[4];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1[17] + 16))(v38, v37, v20);
  *(_QWORD *)(v10 - 192) = v38;
  v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16);
  v40 = v1[14];
  v39(v40, v33, v31);
  *(_QWORD *)(v10 - 184) = v40;
  *(_QWORD *)(v10 - 224) = v20;
  *(_QWORD *)(v10 - 216) = v31;
  v1[31] = v1[5];
  v1[32] = v32;
  sub_23C328D8C((uint64_t *)(v10 - 192), 2uLL, v10 - 224);
  v36(v33, v31);
  v18(v37, v20);
  v36(v40, v31);
  return ((uint64_t (*)(uint64_t, uint64_t))v18)(v38, v20);
}

void sub_23C3215F0(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v19[1] = a6;
  v22 = a3;
  v23 = a5;
  v21 = a2;
  v27 = a7;
  v25 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v10 = sub_23C34DE30();
  v26 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  MEMORY[0x24BDAC7A8](v11);
  v24 = (char *)v19 - v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF40);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BD10);
  MEMORY[0x24BDAC7A8](v20);
  MEMORY[0x24BDAC7A8](v16);
  v19[2] = (char *)v19 - v17;
  *(_QWORD *)v15 = sub_23C34DFEC();
  *((_QWORD *)v15 + 1) = 0x4034000000000000;
  v15[16] = 0;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF48);
  sub_23C321968(a1, v22, a4, v23, a6, (uint64_t)&v15[*(int *)(v18 + 44)]);
}

uint64_t sub_23C3217A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
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
  void (*v27)(uint64_t, uint64_t);

  v10 = sub_23C34E190();
  sub_23C34DD28();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  sub_23C28950C(v6, v5, v8);
  v19 = v5 + *(int *)(v1 + 36);
  *(_BYTE *)v19 = v10;
  *(_QWORD *)(v19 + 8) = v12;
  *(_QWORD *)(v19 + 16) = v14;
  *(_QWORD *)(v19 + 24) = v16;
  *(_QWORD *)(v19 + 32) = v18;
  *(_BYTE *)(v19 + 40) = 0;
  sub_23C285184(v6, v8);
  v20 = *(_QWORD *)(v9 - 256);
  v21 = sub_23C2894C8(v5, v20, &qword_256B5BD10);
  (*(void (**)(uint64_t))(v4 + 72))(v21);
  sub_23C34DE3C();
  sub_23C34E16C();
  v22 = *(_QWORD *)(v9 - 264);
  sub_23C34E424();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 208) + 8))(v0, v7);
  v23 = MEMORY[0x24BDF1050];
  *(_QWORD *)(v9 - 136) = v22;
  *(_QWORD *)(v9 - 128) = v23;
  v24 = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v2, v9 - 136);
  v25 = *(_QWORD *)(v9 - 216);
  sub_23C28958C(v3, v2, v25);
  v26 = *(_QWORD *)(v9 - 200);
  v27 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
  v27(v3, v2);
  sub_23C28950C(v20, v5, &qword_256B5BD10);
  *(_QWORD *)(v9 - 152) = v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v3, v25, v2);
  *(_QWORD *)(v9 - 144) = v3;
  *(_QWORD *)(v9 - 168) = *(_QWORD *)(v9 - 248);
  *(_QWORD *)(v9 - 160) = v2;
  *(_QWORD *)(v9 - 184) = sub_23C323CB0();
  *(_QWORD *)(v9 - 176) = v24;
  sub_23C328D8C((uint64_t *)(v9 - 152), 2uLL, v9 - 168);
  v27(v25, v2);
  sub_23C285184(v20, &qword_256B5BD10);
  v27(v3, v2);
  return sub_23C285184(v5, &qword_256B5BD10);
}

void sub_23C321968(__int128 *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
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
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v24 = a4;
  v37 = a6;
  v36 = sub_23C34DA34();
  v35 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v33 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_23C34D7D0();
  MEMORY[0x24BDAC7A8](v27);
  v26 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_23C34D86C();
  v25 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF60);
  v34 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v29 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v32 = (char *)&v23 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF68);
  MEMORY[0x24BDAC7A8](v15);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF70);
  MEMORY[0x24BDAC7A8](v16);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF78);
  MEMORY[0x24BDAC7A8](v17);
  v28 = (char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v38 = (char *)&v23 - v20;
  v21 = a1[3];
  v45 = a1[2];
  v46 = v21;
  v47 = a1[4];
  v48 = *((_QWORD *)a1 + 10);
  v22 = a1[1];
  v43 = *a1;
  v44 = v22;
  v39 = a2;
  v40 = a3;
  v41 = v24;
  v42 = a5;
  type metadata accessor for ProgramDetailView();
}

uint64_t sub_23C321C1C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);

  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  if (*(unsigned __int8 *)(v6 - 144) > 6u)
    goto LABEL_4;
  v8 = *(_OWORD *)(v4 + 48);
  *(_OWORD *)(v6 - 144) = *(_OWORD *)(v4 + 32);
  *(_OWORD *)(v6 - 128) = v8;
  *(_OWORD *)(v6 - 112) = *(_OWORD *)(v4 + 64);
  *(_QWORD *)(v6 - 96) = *(_QWORD *)(v4 + 80);
  v9 = *(_OWORD *)(v4 + 16);
  *(_OWORD *)(v6 - 176) = *(_OWORD *)v4;
  *(_OWORD *)(v6 - 160) = v9;
  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  if (*(_BYTE *)(v6 - 143) == 1)
  {
    swift_storeEnumTagMultiPayload();
    sub_23C323D34();
    sub_23C34E004();
  }
  else
  {
LABEL_4:
    sub_23C31CADC(v1, a1, v5);
    sub_23C28950C(v5, v2, &qword_256B5BF68);
    swift_storeEnumTagMultiPayload();
    sub_23C323D34();
    sub_23C34E004();
    sub_23C285184(v5, &qword_256B5BF68);
  }
  v10 = *(_OWORD *)(v4 + 48);
  *(_OWORD *)(v6 - 144) = *(_OWORD *)(v4 + 32);
  *(_OWORD *)(v6 - 128) = v10;
  *(_OWORD *)(v6 - 112) = *(_OWORD *)(v4 + 64);
  *(_QWORD *)(v6 - 96) = *(_QWORD *)(v4 + 80);
  v11 = *(_OWORD *)(v4 + 16);
  *(_OWORD *)(v6 - 176) = *(_OWORD *)v4;
  *(_OWORD *)(v6 - 160) = v11;
  v12 = type metadata accessor for WorkoutProgram();
  v13 = v1 + *(int *)(v12 + 44);
  v14 = v1;
  v15 = *(_QWORD *)(v6 - 384);
  v16 = *(_QWORD *)(v6 - 336);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v3, v13, v16);
  v17 = *(_QWORD *)(v14 + *(int *)(v12 + 28));
  sub_23C34D7C4();
  sub_23C27FEE4(&qword_256B59028, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC290], MEMORY[0x24BDCC2A8]);
  v18 = sub_23C34E8C8();
  v20 = v19;
  v21 = *(_OWORD *)(v4 + 48);
  *(_OWORD *)(v6 - 240) = *(_OWORD *)(v4 + 32);
  *(_OWORD *)(v6 - 224) = v21;
  *(_OWORD *)(v6 - 208) = *(_OWORD *)(v4 + 64);
  *(_QWORD *)(v6 - 192) = *(_QWORD *)(v4 + 80);
  v22 = *(_OWORD *)(v4 + 16);
  *(_OWORD *)(v6 - 272) = *(_OWORD *)v4;
  *(_OWORD *)(v6 - 256) = v22;
  sub_23C318EE0();
  swift_getKeyPath();
  v23 = *(_QWORD *)(v6 - 320);
  sub_23C34E79C();
  swift_release();
  swift_release();
  v24 = *(_QWORD *)(v6 - 352);
  sub_23C31D81C(v3, v17, v18, v20, v23, a1, v24);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 - 304) + 8))(v23, *(_QWORD *)(v6 - 296));
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v3, v16);
  v25 = *(_QWORD *)(v6 - 312);
  v26 = *(_QWORD *)(v6 - 328);
  v27 = *(_QWORD *)(v6 - 344);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 32))(v26, v24, v27);
  v28 = *(_QWORD *)(v6 - 280);
  v29 = *(_QWORD *)(v6 - 360);
  sub_23C28950C(v28, v29, &qword_256B5BF78);
  v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
  v30(v24, v26, v27);
  v31 = *(_QWORD *)(v6 - 288);
  sub_23C28950C(v29, v31, &qword_256B5BF78);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BFB8);
  v30(v31 + *(int *)(v32 + 48), v24, v27);
  v33 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
  v33(v26, v27);
  sub_23C285184(v28, &qword_256B5BF78);
  v33(v24, v27);
  return sub_23C285184(v29, &qword_256B5BF78);
}

void sub_23C321FE8()
{
  sub_23C324274();
}

uint64_t sub_23C321FF0(uint64_t a1)
{
  sub_23C28801C();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23C322068@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD v18[10];

  v18[1] = a6;
  v11 = sub_23C34E040();
  MEMORY[0x24BDAC7A8](v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BD20);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C34E034();
  v18[4] = a2;
  v18[5] = a3;
  v18[6] = a4;
  v18[7] = a5;
  v18[8] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BE68);
  sub_23C323988();
  sub_23C34DE60();
  v16 = sub_23C28943C(&qword_256B5BD28, &qword_256B5BD20, MEMORY[0x24BDEDAF0]);
  MEMORY[0x24261B748](v15, v12, v16);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_23C3221B8()
{
  return sub_23C3242A4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C322068);
}

void sub_23C3221C4(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
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
  __int128 v20;
  __int128 v21;
  _QWORD v22[8];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v29 = a6;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BE88);
  v28 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v30 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v27 = (char *)v22 - v13;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BE90);
  v22[7] = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v22[6] = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BE98);
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v22[5] = (char *)v22 - v17;
  MEMORY[0x24BDAC7A8](v18);
  v32 = (char *)v22 - v19;
  v33 = a2;
  v20 = a1[3];
  v39 = a1[2];
  v40 = v20;
  v41 = a1[4];
  v42 = *((_QWORD *)a1 + 10);
  v21 = a1[1];
  v37 = *a1;
  v38 = v21;
  v22[2] = a2;
  v22[3] = a3;
  v34 = a3;
  v35 = a4;
  v22[4] = a5;
  v36 = a5;
  type metadata accessor for ProgramDetailView();
}

uint64_t sub_23C322394(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  uint64_t (*v30)(uint64_t, uint64_t);

  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  *(_QWORD *)(v3 - 352) = sub_23C34DF98();
  v5 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v3 - 144) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v3 - 128) = v5;
  *(_OWORD *)(v3 - 112) = *(_OWORD *)(v1 + 64);
  *(_QWORD *)(v3 - 96) = *(_QWORD *)(v1 + 80);
  v6 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v3 - 176) = *(_OWORD *)v1;
  *(_OWORD *)(v3 - 160) = v6;
  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  *(_QWORD *)(v3 - 344) = a1;
  v7 = swift_allocObject();
  v8 = *(_QWORD *)(v3 - 328);
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v3 - 336);
  *(_QWORD *)(v7 + 24) = v8;
  v9 = *(_QWORD *)(v3 - 320);
  *(_QWORD *)(v7 + 32) = v2;
  *(_QWORD *)(v7 + 40) = v9;
  v10 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v7 + 80) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v7 + 96) = v10;
  *(_OWORD *)(v7 + 112) = *(_OWORD *)(v1 + 64);
  *(_QWORD *)(v7 + 128) = *(_QWORD *)(v1 + 80);
  v11 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v7 + 48) = *(_OWORD *)v1;
  *(_OWORD *)(v7 + 64) = v11;
  MEMORY[0x24BDAC7A8](v7);
  sub_23C321FF0(v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5B0B0);
  sub_23C28943C(&qword_256B5B0B8, &qword_256B5B0B0, MEMORY[0x24BDF41A8]);
  v12 = *(_QWORD *)(v3 - 304);
  sub_23C34E5D4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23C28943C(&qword_256B5BEA0, &qword_256B5BE90, MEMORY[0x24BDF43B0]);
  sub_23C323AA4();
  v13 = *(_QWORD *)(v3 - 312);
  v14 = *(_QWORD *)(v3 - 288);
  sub_23C34E3DC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 296) + 8))(v12, v14);
  v15 = *(_QWORD *)(v3 - 272);
  v16 = *(_QWORD *)(v3 - 216);
  v17 = *(_QWORD *)(v3 - 280);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v16, v13, v17);
  v18 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v3 - 144) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v3 - 128) = v18;
  *(_OWORD *)(v3 - 112) = *(_OWORD *)(v1 + 64);
  *(_QWORD *)(v3 - 96) = *(_QWORD *)(v1 + 80);
  v19 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v3 - 176) = *(_OWORD *)v1;
  *(_OWORD *)(v3 - 160) = v19;
  v20 = *(_QWORD *)(v3 - 256);
  sub_23C31E424(*(_QWORD *)(v3 - 344), v20);
  v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
  v22 = *(_QWORD *)(v3 - 264);
  v21(v22, v16, v17);
  v23 = *(_QWORD *)(v3 - 248);
  v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
  v26 = *(_QWORD *)(v3 - 232);
  v25 = *(_QWORD *)(v3 - 224);
  v24(v26, v20, v25);
  v27 = *(_QWORD *)(v3 - 240);
  v21(v27, v22, v17);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BEB0);
  v24(v27 + *(int *)(v28 + 48), v26, v25);
  v29 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  v29(v20, v25);
  v30 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
  v30(*(_QWORD *)(v3 - 216), v17);
  v29(v26, v25);
  return v30(v22, v17);
}

void sub_23C32275C(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
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
  uint64_t ObjCClassFromMetadata;
  id v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[7];
  id v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v37 = a6;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BE48);
  MEMORY[0x24BDAC7A8](v11);
  v32 = (char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23C34DA34();
  MEMORY[0x24BDAC7A8](v13);
  v38 = (char *)v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23C34E868();
  MEMORY[0x24BDAC7A8](v15);
  v29[0] = (char *)v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58F98);
  v35 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v36 = (char *)v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v34 = (char *)v29 - v20;
  MEMORY[0x24BDAC7A8](v21);
  v33 = (char *)v29 - v22;
  MEMORY[0x24BDAC7A8](v23);
  v39 = (char *)v29 - v24;
  sub_23C34E85C();
  type metadata accessor for LocalizationBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v31 = ObjCClassFromMetadata;
  v30 = (id)objc_opt_self();
  v26 = objc_msgSend(v30, sel_bundleForClass_, ObjCClassFromMetadata);
  v27 = a1[3];
  v46 = a1[2];
  v47 = v27;
  v48 = a1[4];
  v49 = *((_QWORD *)a1 + 10);
  v28 = a1[1];
  v44 = *a1;
  v45 = v28;
  v40 = a2;
  v41 = a3;
  v29[1] = a2;
  v29[2] = a4;
  v42 = a4;
  v43 = a5;
  v29[3] = a5;
  type metadata accessor for ProgramDetailView();
}

uint64_t sub_23C3229B0(uint64_t a1)
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
  void (*v11)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  id v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);

  *(_QWORD *)(v7 - 304) = a1;
  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  *(_QWORD *)(v7 - 176) = sub_23C34E8A4();
  *(_QWORD *)(v7 - 168) = v8;
  v9 = *(_QWORD *)(v7 - 280);
  sub_23C34DD04();
  v10 = sub_23C34DD1C();
  *(_QWORD *)(v7 - 312) = v10;
  v11 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  *(_QWORD *)(v7 - 320) = v11;
  v11(v9, 0, 1, v10);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v3;
  *(_QWORD *)(v12 + 24) = v6;
  *(_QWORD *)(v12 + 32) = v5;
  *(_QWORD *)(v12 + 40) = v4;
  v13 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v12 + 80) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v12 + 96) = v13;
  *(_OWORD *)(v12 + 112) = *(_OWORD *)(v2 + 64);
  *(_QWORD *)(v12 + 128) = *(_QWORD *)(v2 + 80);
  v14 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v12 + 48) = *(_OWORD *)v2;
  *(_OWORD *)(v12 + 64) = v14;
  sub_23C321FF0(v2);
  sub_23C2C0058();
  sub_23C34E5E0();
  sub_23C34E85C();
  v15 = objc_msgSend(*(id *)(v7 - 296), sel_bundleForClass_, *(_QWORD *)(v7 - 288));
  v16 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v7 - 144) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v7 - 128) = v16;
  *(_OWORD *)(v7 - 112) = *(_OWORD *)(v2 + 64);
  *(_QWORD *)(v7 - 96) = *(_QWORD *)(v2 + 80);
  v17 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v7 - 176) = *(_OWORD *)v2;
  *(_OWORD *)(v7 - 160) = v17;
  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  *(_QWORD *)(v7 - 176) = sub_23C34E8A4();
  *(_QWORD *)(v7 - 168) = v18;
  sub_23C34DD10();
  (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v7 - 320))(v9, 0, 1, *(_QWORD *)(v7 - 312));
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = *(_QWORD *)(v7 - 344);
  *(_QWORD *)(v19 + 24) = v6;
  v20 = *(_QWORD *)(v7 - 328);
  *(_QWORD *)(v19 + 32) = *(_QWORD *)(v7 - 336);
  *(_QWORD *)(v19 + 40) = v20;
  v21 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v19 + 80) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v19 + 96) = v21;
  *(_OWORD *)(v19 + 112) = *(_OWORD *)(v2 + 64);
  *(_QWORD *)(v19 + 128) = *(_QWORD *)(v2 + 80);
  v22 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v19 + 48) = *(_OWORD *)v2;
  *(_OWORD *)(v19 + 64) = v22;
  sub_23C321FF0(v2);
  v23 = *(_QWORD *)(v7 - 272);
  sub_23C34E5E0();
  v24 = *(_QWORD *)(v7 - 256);
  v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16);
  v26 = *(_QWORD *)(v7 - 264);
  v27 = *(_QWORD *)(v7 - 224);
  v25(v26, v27, v1);
  v28 = *(_QWORD *)(v7 - 248);
  v29 = v23;
  v25(v28, v23, v1);
  v30 = *(_QWORD *)(v7 - 240);
  v25(v30, v26, v1);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BE50);
  v25(v30 + *(int *)(v31 + 48), v28, v1);
  v32 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
  v32(v29, v1);
  v32(v27, v1);
  v32(v28, v1);
  return ((uint64_t (*)(uint64_t, uint64_t))v32)(v26, v1);
}

uint64_t sub_23C322D24()
{
  return sub_23C3242A4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C32275C);
}

void sub_23C322D30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;

  v0 = sub_23C34DA34();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_23C34E868();
  MEMORY[0x24BDAC7A8](v1);
  sub_23C34E85C();
  type metadata accessor for LocalizationBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  type metadata accessor for ProgramDetailView();
}

uint64_t sub_23C322E64()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  char v3;
  uint64_t v4;

  sub_23C318EE0();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  result = sub_23C34E310();
  *(_QWORD *)v0 = result;
  *(_QWORD *)(v0 + 8) = v2;
  *(_BYTE *)(v0 + 16) = v3 & 1;
  *(_QWORD *)(v0 + 24) = v4;
  return result;
}

void sub_23C322EE4()
{
  sub_23C322D30();
}

uint64_t sub_23C322EF4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C322F2C()
{
  sub_23C287FCC();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23C322F7C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_23C28801C();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  v7 = a2[4];
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = a2[5];
  v8 = a2[10];
  v10 = *((_OWORD *)a2 + 4);
  *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
  *(_OWORD *)(a1 + 64) = v10;
  *(_QWORD *)(a1 + 80) = v8;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23C323028(uint64_t a1, uint64_t *a2)
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
  sub_23C28801C();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_23C287FCC();
  v7 = a2[4];
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = v7;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 40) = a2[5];
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 48) = a2[6];
  swift_retain();
  swift_release();
  v8 = a2[8];
  *(_QWORD *)(a1 + 56) = a2[7];
  *(_QWORD *)(a1 + 64) = v8;
  swift_retain();
  swift_release();
  v9 = a2[10];
  *(_QWORD *)(a1 + 72) = a2[9];
  *(_QWORD *)(a1 + 80) = v9;
  swift_retain();
  swift_release();
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

uint64_t sub_23C323124(uint64_t a1, uint64_t a2)
{
  char v4;

  v4 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_23C287FCC();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t sub_23C3231B0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_23C3231F8(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for ProgramDetailView()
{
  JUMPOUT(0x24261C5D0);
}

uint64_t sub_23C323258()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
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
  uint64_t OpaqueTypeConformance2;
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  uint64_t v42;
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[3];

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B57C78);
  sub_23C34DE30();
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCE8);
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCF0);
  swift_getTupleTypeMetadata2();
  v0 = sub_23C34E700();
  v1 = MEMORY[0x24BDF5428];
  MEMORY[0x24261C66C](MEMORY[0x24BDF5428], v0);
  sub_23C34E64C();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCF8);
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD00);
  sub_23C34DE30();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD08);
  swift_getTupleTypeMetadata2();
  v2 = sub_23C34E700();
  MEMORY[0x24261C66C](v1, v2);
  sub_23C34E64C();
  sub_23C34E010();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD10);
  sub_23C34DE30();
  swift_getTupleTypeMetadata2();
  sub_23C34E700();
  sub_23C34E58C();
  sub_23C34DE30();
  swift_getTupleTypeMetadata2();
  v3 = sub_23C34E700();
  MEMORY[0x24261C66C](v1, v3);
  v4 = sub_23C34E64C();
  sub_23C34E0DC();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BDF02F8];
  v6 = sub_23C34DE30();
  v7 = sub_23C34DE30();
  v8 = sub_23C34DE30();
  v9 = MEMORY[0x24261C66C](MEMORY[0x24BDF4700], v4);
  v10 = sub_23C27FEE4(&qword_256B58D68, v5, MEMORY[0x24BDF02F0]);
  v47[0] = v9;
  v47[1] = v10;
  v11 = MEMORY[0x24BDED308];
  v46[0] = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v6, v47);
  v46[1] = v10;
  v45[0] = MEMORY[0x24261C66C](v11, v7, v46);
  v45[1] = v10;
  MEMORY[0x24261C66C](v11, v8, v45);
  v12 = sub_23C34DD34();
  v13 = sub_23C34DE30();
  v44[0] = MEMORY[0x24261C66C](MEMORY[0x24BDEB238], v12);
  v44[1] = MEMORY[0x24BDF1050];
  v14 = MEMORY[0x24261C66C](v11, v13, v44);
  v33 = v13;
  v34 = v14;
  MEMORY[0x24261C60C](255, &v33, MEMORY[0x24BDF2670], 0);
  v15 = sub_23C34E010();
  v16 = sub_23C34E58C();
  v17 = sub_23C34DE30();
  v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD18);
  v19 = sub_23C28943C(qword_256B57C88, &qword_256B57C78, MEMORY[0x24BDEBC00]);
  v33 = v13;
  v34 = v14;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v43[0] = v19;
  v43[1] = OpaqueTypeConformance2;
  v42 = MEMORY[0x24261C66C](MEMORY[0x24BDEF3E0], v15, v43);
  v41[0] = MEMORY[0x24261C66C](MEMORY[0x24BDF3F50], v16, &v42);
  v41[1] = MEMORY[0x24BDF0910];
  v21 = MEMORY[0x24261C66C](v11, v17, v41);
  v22 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD20);
  v23 = sub_23C28943C(&qword_256B5BD28, &qword_256B5BD20, MEMORY[0x24BDEDAF0]);
  v33 = v22;
  v34 = v23;
  v24 = swift_getOpaqueTypeConformance2();
  v33 = v17;
  v34 = v18;
  v35 = v21;
  v36 = v24;
  v25 = MEMORY[0x24261C60C](255, &v33, MEMORY[0x24BDF3858], 0);
  v33 = v17;
  v34 = v18;
  v35 = v21;
  v36 = v24;
  v26 = swift_getOpaqueTypeConformance2();
  v33 = v25;
  v34 = v26;
  v27 = MEMORY[0x24261C60C](255, &v33, MEMORY[0x24BDF3888], 0);
  v28 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD30);
  v33 = v25;
  v34 = v26;
  v29 = swift_getOpaqueTypeConformance2();
  v30 = sub_23C2C0058();
  v31 = sub_23C28943C(&qword_256B5BD38, &qword_256B5BD30, v1);
  v33 = v27;
  v34 = MEMORY[0x24BEE0D00];
  v35 = v28;
  v36 = MEMORY[0x24BDF1FA8];
  v37 = v29;
  v38 = v30;
  v39 = v31;
  v40 = MEMORY[0x24BDF1F80];
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C323854()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23C323860()
{
  swift_release();
  return swift_release();
}

_QWORD *sub_23C323888(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_23C3238BC(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_23C323918(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  return a1;
}

void type metadata accessor for ProgramDetailView.Layout()
{
  JUMPOUT(0x24261C5D0);
}

void sub_23C323964()
{
  sub_23C324274();
}

void sub_23C323970()
{
  sub_23C324274();
}

void sub_23C323978(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_23C3221C4(*(__int128 **)(v1 + 48), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

unint64_t sub_23C323988()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256B5BE70;
  if (!qword_256B5BE70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BE68);
    v2 = sub_23C28943C(&qword_256B5BE78, &qword_256B5BE80, MEMORY[0x24BDF5428]);
    result = MEMORY[0x24261C66C](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256B5BE70);
  }
  return result;
}

void sub_23C323A08()
{
  sub_23C324274();
}

uint64_t sub_23C323A10()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_23C34E5BC();
}

uint64_t sub_23C323A90()
{
  return sub_23C323A10();
}

unint64_t sub_23C323AA4()
{
  unint64_t result;

  result = qword_256B5BEA8;
  if (!qword_256B5BEA8)
  {
    result = MEMORY[0x24261C66C](&unk_23C3543CC, &type metadata for NavigationBarButtonStyle);
    atomic_store(result, (unint64_t *)&qword_256B5BEA8);
  }
  return result;
}

uint64_t sub_23C323AE8()
{
  return sub_23C3242A4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C31E604);
}

unint64_t sub_23C323AF4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B5BEE0;
  if (!qword_256B5BEE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BED0);
    v2[0] = sub_23C323B78();
    v2[1] = sub_23C28943C(&qword_256B5BEF8, &qword_256B5BF00, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B5BEE0);
  }
  return result;
}

unint64_t sub_23C323B78()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256B5BEE8;
  if (!qword_256B5BEE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BEF0);
    v2 = sub_23C28943C(&qword_256B59380, &qword_256B59388, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256B5BEE8);
  }
  return result;
}

unint64_t sub_23C323BFC()
{
  unint64_t result;

  result = qword_256B5BF20;
  if (!qword_256B5BF20)
  {
    result = MEMORY[0x24261C66C](&unk_23C3560E8, &type metadata for NavigationBarMenuStyle);
    atomic_store(result, (unint64_t *)&qword_256B5BF20);
  }
  return result;
}

uint64_t sub_23C323C54()
{
  return sub_23C3242A4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C31E8BC);
}

void sub_23C323C64()
{
  sub_23C324274();
}

uint64_t sub_23C323C6C()
{
  return sub_23C3242A4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C31EAC4);
}

uint64_t sub_23C323C78()
{
  return sub_23C323C9C((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C320740);
}

uint64_t sub_23C323C84()
{
  return sub_23C323C9C((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C320ED4);
}

uint64_t sub_23C323C90()
{
  return sub_23C323C9C((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C3215F0);
}

uint64_t sub_23C323C9C(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[6], v1[7], v1[2], v1[3], v1[4], v1[5]);
}

unint64_t sub_23C323CB0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B5BF50;
  if (!qword_256B5BF50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD10);
    v2[0] = sub_23C28943C(&qword_256B5BF58, &qword_256B5BF40, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B5BF50);
  }
  return result;
}

unint64_t sub_23C323D34()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B5BF80;
  if (!qword_256B5BF80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BF68);
    v2[0] = sub_23C323DA0();
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x24261C66C](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B5BF80);
  }
  return result;
}

unint64_t sub_23C323DA0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B5BF88;
  if (!qword_256B5BF88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BF90);
    v2[0] = sub_23C28943C(&qword_256B5BF98, &qword_256B5BFA0, MEMORY[0x24BDF43B0]);
    v2[1] = sub_23C28943C(&qword_256B5BFA8, &qword_256B5BFB0, MEMORY[0x24BDF1330]);
    result = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B5BF88);
  }
  return result;
}

uint64_t sub_23C323E3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_23C34D86C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 136) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  sub_23C287FCC();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23C323EDC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_23C34D86C() - 8) + 80);
  return sub_23C31DC68(v0 + 48, v0 + ((v1 + 136) & ~v1));
}

uint64_t sub_23C323F3C()
{
  sub_23C287FCC();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_23C323F94()
{
  type metadata accessor for ProgramDetailView();
}

uint64_t sub_23C323FC8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_23C31D1C0(v2, a1, v1);
}

void sub_23C323FF4()
{
  sub_23C324274();
}

uint64_t sub_23C324000@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_23C31D3B0(a1, (uint64_t)(v2 + 6), v2[2], v2[3], v2[4], v2[5], a2);
}

uint64_t sub_23C324010()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for WorkoutProgramLinkAnnotation();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 136) & ~v2;
  sub_23C287FCC();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v4 = v0 + v3 + *(int *)(v1 + 24);
  v5 = sub_23C34D950();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

void sub_23C3240D0()
{
  type metadata accessor for WorkoutProgramLinkAnnotation();
  sub_23C31D538();
}

uint64_t sub_23C324130()
{
  uint64_t v0;

  return sub_23C31D66C(*(_QWORD *)(v0 + 16));
}

unint64_t sub_23C324138()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B5C008;
  if (!qword_256B5C008)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5C000);
    v2[0] = sub_23C28943C(&qword_256B5B0B8, &qword_256B5B0B0, MEMORY[0x24BDF41A8]);
    v2[1] = sub_23C28943C(&qword_256B59380, &qword_256B59388, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B5C008);
  }
  return result;
}

unint64_t sub_23C3241D4()
{
  unint64_t result;

  result = qword_256B5C010;
  if (!qword_256B5C010)
  {
    result = MEMORY[0x24261C66C](&unk_23C35774C, &type metadata for ReversedTitleIconLabelStyle);
    atomic_store(result, (unint64_t *)&qword_256B5C010);
  }
  return result;
}

uint64_t objectdestroy_2Tm_2()
{
  sub_23C287FCC();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_23C32426C()
{
  sub_23C324274();
}

void sub_23C324274()
{
  sub_23C31DDA8();
}

uint64_t sub_23C324298()
{
  return sub_23C3242A4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C31DEAC);
}

uint64_t sub_23C3242A4(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[6], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_23C3242B8()
{
  return sub_23C2BFE70(&qword_256B5C030, &qword_256B5A750, (uint64_t (*)(void))sub_23C3242DC, MEMORY[0x24BDEDBB8]);
}

unint64_t sub_23C3242DC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B5C038;
  if (!qword_256B5C038)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5A748);
    v2[0] = sub_23C324360();
    v2[1] = sub_23C28943C(&qword_256B59380, &qword_256B59388, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B5C038);
  }
  return result;
}

unint64_t sub_23C324360()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[5];

  result = qword_256B5C040;
  if (!qword_256B5C040)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5C048);
    v2[1] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5B0B0);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BED8);
    v2[3] = sub_23C28943C(&qword_256B5B0B8, &qword_256B5B0B0, MEMORY[0x24BDF41A8]);
    v2[4] = sub_23C28943C(&qword_256B5BF08, &qword_256B5BED8, MEMORY[0x24BEE30C8]);
    v2[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x24261C66C](MEMORY[0x24BDF3F50], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B5C040);
  }
  return result;
}

void sub_23C324448(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_23C31B410(*(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(void (**)(_QWORD, _QWORD))(v1 + 88), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1, *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

void sub_23C32447C()
{
  sub_23C324BE0((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C319790);
}

void sub_23C324488()
{
  sub_23C319F14();
}

uint64_t sub_23C32449C(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  if (a4)
  {
    sub_23C289550(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_23C2BED10(a14, a15, a16, a17);
    sub_23C289550(a27, a28, a29 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_23C3245A4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B5C068;
  if (!qword_256B5C068)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BCF0);
    v2[0] = sub_23C324630(&qword_256B5C070, &qword_256B5C078, (uint64_t (*)(void))sub_23C324694, MEMORY[0x24BDF3F50]);
    v2[1] = MEMORY[0x24BDEDB80];
    result = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B5C068);
  }
  return result;
}

uint64_t sub_23C324630(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x24261C66C](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C324694()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256B5C080;
  if (!qword_256B5C080)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5C088);
    v2 = sub_23C28943C(&qword_256B5C090, &qword_256B5C098, MEMORY[0x24BDF5428]);
    result = MEMORY[0x24261C66C](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256B5C080);
  }
  return result;
}

uint64_t sub_23C324710(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  if (a4)
  {
    sub_23C289340(result, a2, a3 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    sub_23C2BEEB8(a14, a15, a16, a17);
    sub_23C289340(a27, a28, a29 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23C324818(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  char v9;

  v9 = *(_BYTE *)(a1 + 328);
  v7 = *(_OWORD *)(a1 + 288);
  v8 = *(_OWORD *)(a1 + 304);
  v5 = *(_OWORD *)(a1 + 256);
  v6 = *(_OWORD *)(a1 + 272);
  v4 = *(_OWORD *)(a1 + 224);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(_QWORD *)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    v4,
    *((_QWORD *)&v4 + 1),
    *(_QWORD *)(a1 + 240),
    *(_QWORD *)(a1 + 248),
    v5,
    *((_QWORD *)&v5 + 1),
    v6,
    *((_QWORD *)&v6 + 1),
    v7,
    *((_QWORD *)&v7 + 1),
    v8,
    *((_QWORD *)&v8 + 1),
    *(_QWORD *)(a1 + 320),
    v9);
  return a1;
}

uint64_t sub_23C3248B4(uint64_t a1)
{
  sub_23C289550(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23C3248F0(uint64_t a1)
{
  sub_23C289340(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRelease();
  return a1;
}

double sub_23C32492C(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[18] = 0u;
  a1[19] = 0u;
  a1[16] = 0u;
  a1[17] = 0u;
  a1[14] = 0u;
  a1[15] = 0u;
  a1[12] = 0u;
  a1[13] = 0u;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  *(_OWORD *)((char *)a1 + 313) = 0u;
  return result;
}

double sub_23C324964(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[20] = 0u;
  a1[21] = 0u;
  a1[18] = 0u;
  a1[19] = 0u;
  a1[16] = 0u;
  a1[17] = 0u;
  a1[14] = 0u;
  a1[15] = 0u;
  a1[12] = 0u;
  a1[13] = 0u;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  *(_OWORD *)((char *)a1 + 345) = 0u;
  return result;
}

uint64_t sub_23C3249A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 96);
  v8 = *(_QWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 104);
  v2 = *(_QWORD *)(a1 + 184);
  v3 = *(_QWORD *)(a1 + 192);
  v4 = *(_BYTE *)(a1 + 200);
  sub_23C289550(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23C2BED10(v9, v8, v7, v6);
  sub_23C289550(v2, v3, v4);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23C324A98(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 96);
  v8 = *(_QWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 104);
  v2 = *(_QWORD *)(a1 + 184);
  v3 = *(_QWORD *)(a1 + 192);
  v4 = *(_BYTE *)(a1 + 200);
  sub_23C289340(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_release();
  swift_bridgeObjectRelease();
  sub_23C2BEEB8(v9, v8, v7, v6);
  sub_23C289340(v2, v3, v4);
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_23C324B90()
{
  unint64_t result;

  result = qword_256B5C0C0;
  if (!qword_256B5C0C0)
  {
    result = MEMORY[0x24261C66C](MEMORY[0x24BDEC7C0], MEMORY[0x24BDEC7D0]);
    atomic_store(result, (unint64_t *)&qword_256B5C0C0);
  }
  return result;
}

void sub_23C324BD4()
{
  sub_23C324BE0((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C31BB54);
}

void sub_23C324BE0(void (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  a1(v1[6], v1[7], v1[8], v1[9], v1[10], v1[2], v1[3], v1[4], v1[5]);
  JUMPOUT(0x23C324C0CLL);
}

unint64_t sub_23C324C18()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B5C0D8;
  if (!qword_256B5C0D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5C0C8);
    v2[0] = sub_23C28943C(&qword_256B5C0E0, &qword_256B5C0E8, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x24261C66C](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B5C0D8);
  }
  return result;
}

unint64_t sub_23C324C9C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B5C0F8;
  if (!qword_256B5C0F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BD08);
    v2[0] = sub_23C324630(&qword_256B5C100, &qword_256B5C108, (uint64_t (*)(void))sub_23C2BEDBC, MEMORY[0x24BDF3F50]);
    v2[1] = MEMORY[0x24BDEDB80];
    result = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B5C0F8);
  }
  return result;
}

unint64_t sub_23C324D28()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256B58E68;
  if (!qword_256B58E68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B58E70);
    v2 = sub_23C28943C(&qword_256B58E78, &qword_256B58E80, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256B58E68);
  }
  return result;
}

__n128 ProgramDetailEnvironment.init(addToLibrary:fetchRemoteProgramDetail:loadLibraryState:makeArchivedSessionsUpdatedStream:navigateToWorkoutDetail:openUrl:presentMoreInfo:presentVideo:refreshCanvasWorkoutItems:removeFromLibrary:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __int128 a10, __int128 a11, __int128 a12, __int128 a13, __n128 a14, uint64_t a15, uint64_t a16)
{
  __n128 result;

  result = a14;
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
  *(__n128 *)(a9 + 128) = a14;
  *(_QWORD *)(a9 + 144) = a15;
  *(_QWORD *)(a9 + 152) = a16;
  return result;
}

uint64_t destroy for ProgramDetailEnvironment()
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
  return swift_release();
}

uint64_t initializeWithCopy for ProgramDetailEnvironment(uint64_t a1, uint64_t a2)
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
  v3 = *(_QWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 152) = v3;
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

_QWORD *assignWithCopy for ProgramDetailEnvironment(_QWORD *a1, _QWORD *a2)
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
  return a1;
}

__n128 __swift_memcpy160_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  result = *(__n128 *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

_OWORD *assignWithTake for ProgramDetailEnvironment(_OWORD *a1, _OWORD *a2)
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
  return a1;
}

uint64_t getEnumTagSinglePayload for ProgramDetailEnvironment(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 160))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ProgramDetailEnvironment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 152) = 0;
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
      *(_BYTE *)(result + 160) = 1;
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
    *(_BYTE *)(result + 160) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ProgramDetailEnvironment()
{
  return &type metadata for ProgramDetailEnvironment;
}

uint64_t sub_23C325224(char a1)
{
  return *(_QWORD *)&aIdle_15[8 * a1];
}

uint64_t sub_23C325244()
{
  char *v0;

  return sub_23C325224(*v0);
}

uint64_t sub_23C32524C()
{
  sub_23C325774();
  return sub_23C34ECD0();
}

uint64_t sub_23C325274()
{
  sub_23C325774();
  return sub_23C34ECDC();
}

uint64_t sub_23C3252A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C327EEC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C3252C8()
{
  sub_23C3257FC();
  return sub_23C34ECD0();
}

uint64_t sub_23C3252F0()
{
  sub_23C3257FC();
  return sub_23C34ECDC();
}

uint64_t sub_23C325318()
{
  sub_23C325840();
  return sub_23C34ECD0();
}

uint64_t sub_23C325340()
{
  sub_23C325840();
  return sub_23C34ECDC();
}

uint64_t sub_23C325368()
{
  sub_23C325884();
  return sub_23C34ECD0();
}

uint64_t sub_23C325390()
{
  sub_23C325884();
  return sub_23C34ECDC();
}

uint64_t ProgramDetailLoadState.encode(to:)(_QWORD *a1)
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
  uint64_t State;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
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
  char v34;
  char v35;
  char v36;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C140);
  v30 = *(_QWORD *)(v2 - 8);
  v31 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v29 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = type metadata accessor for WorkoutProgram();
  MEMORY[0x24BDAC7A8](v27);
  v28 = (uint64_t)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C148);
  v25 = *(_QWORD *)(v5 - 8);
  v26 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C150);
  v8 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  State = type metadata accessor for ProgramDetailLoadState();
  MEMORY[0x24BDAC7A8](State);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C158);
  v33 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C325774();
  sub_23C34ECC4();
  sub_23C3257B8(v32, (uint64_t)v13);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
  v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 48))(v13, 2, v17);
  if (v18)
  {
    if (v18 == 1)
    {
      v34 = 0;
      sub_23C325884();
      sub_23C34EBD4();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v24);
    }
    else
    {
      v35 = 1;
      sub_23C325840();
      sub_23C34EBD4();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v26);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v16, v14);
  }
  else
  {
    v19 = v28;
    sub_23C2851C0((uint64_t)v13, v28, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutProgram);
    v36 = 2;
    sub_23C3257FC();
    v20 = v29;
    sub_23C34EBD4();
    sub_23C325E30(&qword_256B5C170, (uint64_t)&protocol conformance descriptor for WorkoutProgram);
    v21 = v31;
    sub_23C34EC40();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v20, v21);
    sub_23C283550(v19, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutProgram);
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v16, v14);
  }
}

uint64_t type metadata accessor for ProgramDetailLoadState()
{
  uint64_t result;

  result = qword_256B5C220;
  if (!qword_256B5C220)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23C325774()
{
  unint64_t result;

  result = qword_256B5C160;
  if (!qword_256B5C160)
  {
    result = MEMORY[0x24261C66C](&unk_23C35CEE4, &type metadata for ProgramDetailLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C160);
  }
  return result;
}

uint64_t sub_23C3257B8(uint64_t a1, uint64_t a2)
{
  uint64_t State;

  State = type metadata accessor for ProgramDetailLoadState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(State - 8) + 16))(a2, a1, State);
  return a2;
}

unint64_t sub_23C3257FC()
{
  unint64_t result;

  result = qword_256B5C168;
  if (!qword_256B5C168)
  {
    result = MEMORY[0x24261C66C](&unk_23C35CE94, &type metadata for ProgramDetailLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C168);
  }
  return result;
}

unint64_t sub_23C325840()
{
  unint64_t result;

  result = qword_256B5C178;
  if (!qword_256B5C178)
  {
    result = MEMORY[0x24261C66C](&unk_23C35CE44, &type metadata for ProgramDetailLoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C178);
  }
  return result;
}

unint64_t sub_23C325884()
{
  unint64_t result;

  result = qword_256B5C180;
  if (!qword_256B5C180)
  {
    result = MEMORY[0x24261C66C](&unk_23C35CDF4, &type metadata for ProgramDetailLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C180);
  }
  return result;
}

uint64_t ProgramDetailLoadState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t State;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
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
  _QWORD *v58;
  uint64_t v59;
  char v60;
  char v61;
  char v62;

  v53 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C188);
  v4 = *(_QWORD *)(v3 - 8);
  v51 = v3;
  v52 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v56 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C190);
  v49 = *(_QWORD *)(v6 - 8);
  v50 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v55 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C198);
  v47 = *(_QWORD *)(v8 - 8);
  v48 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v54 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C1A0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  State = type metadata accessor for ProgramDetailLoadState();
  MEMORY[0x24BDAC7A8](State);
  v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v44 - v18;
  v20 = a1[3];
  v58 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_23C325774();
  v57 = v13;
  v21 = v59;
  sub_23C34ECB8();
  if (!v21)
  {
    v22 = v54;
    v23 = v55;
    v45 = v16;
    v46 = v19;
    v24 = v56;
    v59 = v11;
    v25 = sub_23C34EBBC();
    v26 = (char *)v25;
    if (*(_QWORD *)(v25 + 16) == 1)
    {
      v27 = v57;
      v28 = v59;
      if (*(_BYTE *)(v25 + 32))
      {
        if (*(_BYTE *)(v25 + 32) != 1)
        {
          v62 = 2;
          sub_23C3257FC();
          v36 = v27;
          sub_23C34EB38();
          v37 = v53;
          type metadata accessor for WorkoutProgram();
          v55 = v26;
          sub_23C325E30(&qword_256B5C1A8, (uint64_t)&protocol conformance descriptor for WorkoutProgram);
          v40 = (uint64_t)v45;
          v41 = v51;
          sub_23C34EBB0();
          (*(void (**)(char *, uint64_t))(v52 + 8))(v24, v41);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v59 + 8))(v36, v10);
          v42 = (uint64_t)v58;
          v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v40, 0, 2, v43);
          v30 = (uint64_t)v46;
          sub_23C2851C0(v40, (uint64_t)v46, (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailLoadState);
LABEL_12:
          sub_23C2851C0(v30, v37, (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailLoadState);
          return __swift_destroy_boxed_opaque_existential_1(v42);
        }
        v61 = 1;
        sub_23C325840();
        sub_23C34EB38();
        (*(void (**)(char *, uint64_t))(v49 + 8))(v23, v50);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v27, v10);
        v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
        v30 = (uint64_t)v46;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v46, 2, 2, v29);
      }
      else
      {
        v60 = 0;
        sub_23C325884();
        sub_23C34EB38();
        (*(void (**)(char *, uint64_t))(v47 + 8))(v22, v48);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v27, v10);
        v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
        v30 = (uint64_t)v46;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v46, 1, 2, v39);
      }
      v42 = (uint64_t)v58;
      v37 = v53;
      goto LABEL_12;
    }
    v31 = v10;
    v32 = sub_23C34EAC0();
    swift_allocError();
    v34 = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B576B0);
    *v34 = State;
    v35 = v57;
    sub_23C34EB44();
    sub_23C34EAB4();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v32 - 8) + 104))(v34, *MEMORY[0x24BEE26D0], v32);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v59 + 8))(v35, v31);
  }
  v42 = (uint64_t)v58;
  return __swift_destroy_boxed_opaque_existential_1(v42);
}

uint64_t sub_23C325E30(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for WorkoutProgram();
    result = MEMORY[0x24261C66C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C325E70@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ProgramDetailLoadState.init(from:)(a1, a2);
}

uint64_t sub_23C325E84(_QWORD *a1)
{
  return ProgramDetailLoadState.encode(to:)(a1);
}

uint64_t _s20FitnessProductDetail07ProgramC9LoadStateO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t State;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(char *, uint64_t, uint64_t);
  int v17;
  char v18;
  uint64_t v20;

  v4 = type metadata accessor for WorkoutProgram();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  State = type metadata accessor for ProgramDetailLoadState();
  MEMORY[0x24BDAC7A8](State);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C280);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (uint64_t)&v12[*(int *)(v13 + 48)];
  sub_23C3257B8(a1, (uint64_t)v12);
  sub_23C3257B8(a2, v14);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
  v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 48);
  v17 = v16(v12, 2, v15);
  if (!v17)
  {
    sub_23C3257B8((uint64_t)v12, (uint64_t)v9);
    if (!v16((char *)v14, 2, v15))
    {
      sub_23C2851C0(v14, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutProgram);
      v18 = _s20FitnessProductDetail14WorkoutProgramV2eeoiySbAC_ACtFZ_0((uint64_t)v9, (uint64_t)v6);
      sub_23C283550((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutProgram);
      sub_23C283550((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutProgram);
      sub_23C283550((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailLoadState);
      return v18 & 1;
    }
    sub_23C283550((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutProgram);
    goto LABEL_9;
  }
  if (v17 == 1)
  {
    if (v16((char *)v14, 2, v15) != 1)
      goto LABEL_9;
  }
  else if (v16((char *)v14, 2, v15) != 2)
  {
LABEL_9:
    sub_23C285184((uint64_t)v12, &qword_256B5C280);
    v18 = 0;
    return v18 & 1;
  }
  sub_23C283550((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailLoadState);
  v18 = 1;
  return v18 & 1;
}

uint64_t *initializeBufferWithCopyOfBuffer for ProgramDetailLoadState(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int (*v26)(_QWORD *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  char *v42;
  void (*v43)(uint64_t *, _QWORD, uint64_t, uint64_t);
  char *v45;
  void (*v46)(char *, char *);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v49 = v8;
      v50 = v7;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
      if (swift_getEnumCaseMultiPayload() == 1)
        v10 = (uint64_t *)&unk_256B5A3E8;
      else
        v10 = (uint64_t *)&unk_256B5A3E0;
      v11 = __swift_instantiateConcreteTypeFromMangledName(v10);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
      swift_storeEnumTagMultiPayload();
      v12 = (int *)type metadata accessor for WorkoutProgram();
      v13 = v12[5];
      v14 = (char *)a1 + v13;
      v15 = (char *)a2 + v13;
      v16 = sub_23C34D86C();
      v47 = *(_QWORD *)(v16 - 8);
      v48 = v16;
      v46 = *(void (**)(char *, char *))(v47 + 16);
      v46(v14, v15);
      v17 = v12[6];
      v18 = (uint64_t *)((char *)a1 + v17);
      v19 = (uint64_t *)((char *)a2 + v17);
      v20 = v19[1];
      *v18 = *v19;
      v18[1] = v20;
      *(uint64_t *)((char *)a1 + v12[7]) = *(uint64_t *)((char *)a2 + v12[7]);
      v21 = v12[8];
      v22 = (uint64_t *)((char *)a1 + v21);
      v23 = (uint64_t *)((char *)a2 + v21);
      v24 = type metadata accessor for WorkoutProgramPreview();
      v25 = *(_QWORD *)(v24 - 8);
      v26 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v25 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v26(v23, 1, v24))
      {
        v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
        memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
      }
      else
      {
        v28 = v23[1];
        *v22 = *v23;
        v22[1] = v28;
        v29 = *(int *)(v24 + 20);
        v30 = (char *)v22 + v29;
        v45 = (char *)v23 + v29;
        v31 = sub_23C34D950();
        v32 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16);
        swift_bridgeObjectRetain();
        v32(v30, v45, v31);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
      }
      v33 = v12[9];
      v34 = (char *)a1 + v33;
      v35 = (char *)a2 + v33;
      v36 = sub_23C34D950();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 16))(v34, v35, v36);
      v37 = v12[10];
      v38 = (char *)a1 + v37;
      v39 = (char *)a2 + v37;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))((char *)a2 + v37, 1, v48))
      {
        v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
        memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
        v41 = (void (*)(char *, char *, uint64_t))v46;
      }
      else
      {
        v42 = v39;
        v41 = (void (*)(char *, char *, uint64_t))v46;
        ((void (*)(char *, char *, uint64_t))v46)(v38, v42, v48);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v47 + 56))(v38, 0, 1, v48);
      }
      ((void (*)(char *, char *, uint64_t))v46)((char *)a1 + v12[11], (char *)a2 + v12[11], v48);
      v41((char *)a1 + v12[12], (char *)a2 + v12[12], v48);
      *(uint64_t *)((char *)a1 + v12[13]) = *(uint64_t *)((char *)a2 + v12[13]);
      v43 = *(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v49 + 56);
      swift_bridgeObjectRetain();
      v43(a1, 0, 2, v50);
    }
  }
  return a1;
}

uint64_t destroy for ProgramDetailLoadState(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 2, v2);
  if (!(_DWORD)result)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
    if (swift_getEnumCaseMultiPayload() == 1)
      v4 = (uint64_t *)&unk_256B5A3E8;
    else
      v4 = (uint64_t *)&unk_256B5A3E0;
    v5 = __swift_instantiateConcreteTypeFromMangledName(v4);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
    v6 = (int *)type metadata accessor for WorkoutProgram();
    v7 = a1 + v6[5];
    v8 = sub_23C34D86C();
    v9 = *(_QWORD *)(v8 - 8);
    v10 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v10(v7, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v11 = a1 + v6[8];
    v12 = type metadata accessor for WorkoutProgramPreview();
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v11, 1, v12))
    {
      swift_bridgeObjectRelease();
      v13 = v11 + *(int *)(v12 + 20);
      v14 = sub_23C34D950();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
    }
    v15 = a1 + v6[9];
    v16 = sub_23C34D950();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
    v17 = a1 + v6[10];
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v17, 1, v8))
      v10(v17, v8);
    v10(a1 + v6[11], v8);
    v10(a1 + v6[12], v8);
    return swift_bridgeObjectRelease();
  }
  return result;
}

char *initializeWithCopy for ProgramDetailLoadState(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  char *v40;
  void (*v41)(char *, _QWORD, uint64_t, uint64_t);
  char *v43;
  uint64_t v44;
  void (*v45)(char *, char *);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v47 = v7;
    v48 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
    if (swift_getEnumCaseMultiPayload() == 1)
      v8 = (uint64_t *)&unk_256B5A3E8;
    else
      v8 = (uint64_t *)&unk_256B5A3E0;
    v9 = __swift_instantiateConcreteTypeFromMangledName(v8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
    swift_storeEnumTagMultiPayload();
    v10 = (int *)type metadata accessor for WorkoutProgram();
    v11 = v10[5];
    v12 = &a1[v11];
    v13 = &a2[v11];
    v14 = sub_23C34D86C();
    v44 = *(_QWORD *)(v14 - 8);
    v45 = *(void (**)(char *, char *))(v44 + 16);
    v46 = v14;
    v45(v12, v13);
    v15 = v10[6];
    v16 = &a1[v15];
    v17 = &a2[v15];
    v18 = *((_QWORD *)v17 + 1);
    *(_QWORD *)v16 = *(_QWORD *)v17;
    *((_QWORD *)v16 + 1) = v18;
    *(_QWORD *)&a1[v10[7]] = *(_QWORD *)&a2[v10[7]];
    v19 = v10[8];
    v20 = &a1[v19];
    v21 = &a2[v19];
    v22 = type metadata accessor for WorkoutProgramPreview();
    v23 = *(_QWORD *)(v22 - 8);
    v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v24(v21, 1, v22))
    {
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
    else
    {
      v26 = *((_QWORD *)v21 + 1);
      *(_QWORD *)v20 = *(_QWORD *)v21;
      *((_QWORD *)v20 + 1) = v26;
      v27 = *(int *)(v22 + 20);
      v28 = &v20[v27];
      v43 = &v21[v27];
      v29 = sub_23C34D950();
      v30 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16);
      swift_bridgeObjectRetain();
      v30(v28, v43, v29);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
    }
    v31 = v10[9];
    v32 = &a1[v31];
    v33 = &a2[v31];
    v34 = sub_23C34D950();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v32, v33, v34);
    v35 = v10[10];
    v36 = &a1[v35];
    v37 = &a2[v35];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(&a2[v35], 1, v46))
    {
      v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
      memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
      v39 = (void (*)(char *, char *, uint64_t))v45;
    }
    else
    {
      v40 = v37;
      v39 = (void (*)(char *, char *, uint64_t))v45;
      ((void (*)(char *, char *, uint64_t))v45)(v36, v40, v46);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v36, 0, 1, v46);
    }
    ((void (*)(char *, char *, uint64_t))v45)(&a1[v10[11]], &a2[v10[11]], v46);
    v39(&a1[v10[12]], &a2[v10[12]], v46);
    *(_QWORD *)&a1[v10[13]] = *(_QWORD *)&a2[v10[13]];
    v41 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v47 + 56);
    swift_bridgeObjectRetain();
    v41(a1, 0, 2, v48);
  }
  return a1;
}

char *assignWithCopy for ProgramDetailLoadState(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unsigned int (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(char *, uint64_t, uint64_t);
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, char *, uint64_t);
  uint64_t v48;
  char *v49;
  uint64_t v50;
  void (*v51)(char *, char *, uint64_t);
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  void (*v62)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t (*v71)(char *, uint64_t, uint64_t);
  int v72;
  int v73;
  uint64_t v74;
  void (*v75)(char *, char *, uint64_t);
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  void (*v86)(char *, char *);
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void (*v91)(char *, char *, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 2, v6);
  v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_23C285184((uint64_t)a1, &qword_256B5BF38);
      goto LABEL_10;
    }
    if (a1 != a2)
    {
      sub_23C285184((uint64_t)a1, &qword_256B5A360);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
      if (swift_getEnumCaseMultiPayload() == 1)
        v27 = (uint64_t *)&unk_256B5A3E8;
      else
        v27 = (uint64_t *)&unk_256B5A3E0;
      v28 = __swift_instantiateConcreteTypeFromMangledName(v27);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(a1, a2, v28);
      swift_storeEnumTagMultiPayload();
    }
    v29 = (int *)type metadata accessor for WorkoutProgram();
    v30 = v29[5];
    v31 = &a1[v30];
    v32 = &a2[v30];
    v33 = sub_23C34D86C();
    v89 = *(_QWORD *)(v33 - 8);
    v91 = *(void (**)(char *, char *, uint64_t))(v89 + 24);
    v91(v31, v32, v33);
    v34 = v29[6];
    v35 = &a1[v34];
    v36 = &a2[v34];
    *(_QWORD *)v35 = *(_QWORD *)v36;
    *((_QWORD *)v35 + 1) = *((_QWORD *)v36 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)&a1[v29[7]] = *(_QWORD *)&a2[v29[7]];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v37 = v29[8];
    v38 = &a1[v37];
    v39 = &a2[v37];
    v40 = type metadata accessor for WorkoutProgramPreview();
    v41 = *(_QWORD *)(v40 - 8);
    v42 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v41 + 48);
    v43 = v42(v38, 1, v40);
    v44 = v42(v39, 1, v40);
    if (v43)
    {
      if (!v44)
      {
        *(_QWORD *)v38 = *(_QWORD *)v39;
        *((_QWORD *)v38 + 1) = *((_QWORD *)v39 + 1);
        v45 = *(int *)(v40 + 20);
        v85 = &v39[v45];
        v87 = &v38[v45];
        v46 = sub_23C34D950();
        v47 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v46 - 8) + 16);
        swift_bridgeObjectRetain();
        v47(v87, v85, v46);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
        goto LABEL_27;
      }
    }
    else
    {
      if (!v44)
      {
        *(_QWORD *)v38 = *(_QWORD *)v39;
        *((_QWORD *)v38 + 1) = *((_QWORD *)v39 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v77 = *(int *)(v40 + 20);
        v78 = &v38[v77];
        v79 = &v39[v77];
        v80 = sub_23C34D950();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v80 - 8) + 24))(v78, v79, v80);
LABEL_27:
        v64 = v29[9];
        v65 = &a1[v64];
        v66 = &a2[v64];
        v67 = sub_23C34D950();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v67 - 8) + 24))(v65, v66, v67);
        v68 = v29[10];
        v69 = &a1[v68];
        v70 = &a2[v68];
        v71 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v89 + 48);
        v72 = v71(&a1[v68], 1, v33);
        v73 = v71(v70, 1, v33);
        if (v72)
        {
          if (!v73)
          {
            (*(void (**)(char *, char *, uint64_t))(v89 + 16))(v69, v70, v33);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v89 + 56))(v69, 0, 1, v33);
LABEL_33:
            v75 = v91;
LABEL_34:
            v75(&a1[v29[11]], &a2[v29[11]], v33);
            v75(&a1[v29[12]], &a2[v29[12]], v33);
            *(_QWORD *)&a1[v29[13]] = *(_QWORD *)&a2[v29[13]];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            return a1;
          }
        }
        else
        {
          if (!v73)
          {
            v81 = v69;
            v75 = v91;
            v91(v81, v70, v33);
            goto LABEL_34;
          }
          (*(void (**)(char *, uint64_t))(v89 + 8))(v69, v33);
        }
        v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
        memcpy(v69, v70, *(_QWORD *)(*(_QWORD *)(v74 - 8) + 64));
        goto LABEL_33;
      }
      sub_23C283550((uint64_t)v38, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutProgramPreview);
    }
    v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v63 - 8) + 64));
    goto LABEL_27;
  }
  if (v10)
  {
LABEL_10:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v90 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
  if (swift_getEnumCaseMultiPayload() == 1)
    v11 = (uint64_t *)&unk_256B5A3E8;
  else
    v11 = (uint64_t *)&unk_256B5A3E0;
  v12 = __swift_instantiateConcreteTypeFromMangledName(v11);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(a1, a2, v12);
  swift_storeEnumTagMultiPayload();
  v13 = (int *)type metadata accessor for WorkoutProgram();
  v14 = v13[5];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = sub_23C34D86C();
  v84 = *(_QWORD *)(v17 - 8);
  v86 = *(void (**)(char *, char *))(v84 + 16);
  v88 = v17;
  v86(v15, v16);
  v18 = v13[6];
  v19 = &a1[v18];
  v20 = &a2[v18];
  *(_QWORD *)v19 = *(_QWORD *)v20;
  *((_QWORD *)v19 + 1) = *((_QWORD *)v20 + 1);
  *(_QWORD *)&a1[v13[7]] = *(_QWORD *)&a2[v13[7]];
  v21 = v13[8];
  v22 = &a1[v21];
  v23 = &a2[v21];
  v24 = type metadata accessor for WorkoutProgramPreview();
  v83 = *(_QWORD *)(v24 - 8);
  v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v83 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v25(v23, 1, v24))
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    *(_QWORD *)v22 = *(_QWORD *)v23;
    *((_QWORD *)v22 + 1) = *((_QWORD *)v23 + 1);
    v48 = *(int *)(v24 + 20);
    v49 = &v22[v48];
    v82 = &v23[v48];
    v50 = sub_23C34D950();
    v51 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v50 - 8) + 16);
    swift_bridgeObjectRetain();
    v51(v49, v82, v50);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v83 + 56))(v22, 0, 1, v24);
  }
  v52 = v13[9];
  v53 = &a1[v52];
  v54 = &a2[v52];
  v55 = sub_23C34D950();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v55 - 8) + 16))(v53, v54, v55);
  v56 = v13[10];
  v57 = &a1[v56];
  v58 = &a2[v56];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v84 + 48))(&a2[v56], 1, v88))
  {
    v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
    memcpy(v57, v58, *(_QWORD *)(*(_QWORD *)(v59 - 8) + 64));
    v60 = (void (*)(char *, char *, uint64_t))v86;
  }
  else
  {
    v61 = v58;
    v60 = (void (*)(char *, char *, uint64_t))v86;
    ((void (*)(char *, char *, uint64_t))v86)(v57, v61, v88);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v84 + 56))(v57, 0, 1, v88);
  }
  ((void (*)(char *, char *, uint64_t))v86)(&a1[v13[11]], &a2[v13[11]], v88);
  v60(&a1[v13[12]], &a2[v13[12]], v88);
  *(_QWORD *)&a1[v13[13]] = *(_QWORD *)&a2[v13[13]];
  v62 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v90 + 56);
  swift_bridgeObjectRetain();
  v62(a1, 0, 2, v6);
  return a1;
}

char *initializeWithTake for ProgramDetailLoadState(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  char *v33;
  char *v35;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
    if (swift_getEnumCaseMultiPayload() == 1)
      v8 = (uint64_t *)&unk_256B5A3E8;
    else
      v8 = (uint64_t *)&unk_256B5A3E0;
    v9 = __swift_instantiateConcreteTypeFromMangledName(v8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
    swift_storeEnumTagMultiPayload();
    v10 = (int *)type metadata accessor for WorkoutProgram();
    v11 = v10[5];
    v12 = &a1[v11];
    v13 = &a2[v11];
    v14 = sub_23C34D86C();
    v36 = *(_QWORD *)(v14 - 8);
    v37 = *(void (**)(char *, char *, uint64_t))(v36 + 32);
    v37(v12, v13, v14);
    *(_OWORD *)&a1[v10[6]] = *(_OWORD *)&a2[v10[6]];
    *(_QWORD *)&a1[v10[7]] = *(_QWORD *)&a2[v10[7]];
    v15 = v10[8];
    v16 = &a1[v15];
    v17 = &a2[v15];
    v18 = type metadata accessor for WorkoutProgramPreview();
    v19 = *(_QWORD *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      *(_OWORD *)v16 = *(_OWORD *)v17;
      v21 = *(int *)(v18 + 20);
      v35 = &v16[v21];
      v22 = &v17[v21];
      v23 = sub_23C34D950();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v35, v22, v23);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
    v24 = v10[9];
    v25 = &a1[v24];
    v26 = &a2[v24];
    v27 = sub_23C34D950();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v25, v26, v27);
    v28 = v10[10];
    v29 = &a1[v28];
    v30 = &a2[v28];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(&a2[v28], 1, v14))
    {
      v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
      memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
      v32 = v37;
    }
    else
    {
      v33 = v30;
      v32 = v37;
      v37(v29, v33, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v29, 0, 1, v14);
    }
    v37(&a1[v10[11]], &a2[v10[11]], v14);
    v32(&a1[v10[12]], &a2[v10[12]], v14);
    *(_QWORD *)&a1[v10[13]] = *(_QWORD *)&a2[v10[13]];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

char *assignWithTake for ProgramDetailLoadState(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(char *, uint64_t, uint64_t);
  int v42;
  int v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  void (*v59)(char *, char *, uint64_t);
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t (*v69)(char *, uint64_t, uint64_t);
  int v70;
  int v71;
  uint64_t v72;
  void (*v73)(char *, char *, uint64_t);
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  void (*v84)(char *, char *, uint64_t);
  void (*v85)(char *, char *, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 2, v6);
  v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_23C285184((uint64_t)a1, &qword_256B5BF38);
      goto LABEL_10;
    }
    if (a1 != a2)
    {
      sub_23C285184((uint64_t)a1, &qword_256B5A360);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
      if (swift_getEnumCaseMultiPayload() == 1)
        v24 = (uint64_t *)&unk_256B5A3E8;
      else
        v24 = (uint64_t *)&unk_256B5A3E0;
      v25 = __swift_instantiateConcreteTypeFromMangledName(v24);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(a1, a2, v25);
      swift_storeEnumTagMultiPayload();
    }
    v26 = (int *)type metadata accessor for WorkoutProgram();
    v27 = v26[5];
    v28 = &a1[v27];
    v29 = &a2[v27];
    v30 = sub_23C34D86C();
    v83 = *(_QWORD *)(v30 - 8);
    v85 = *(void (**)(char *, char *, uint64_t))(v83 + 40);
    v85(v28, v29, v30);
    v31 = v26[6];
    v32 = &a1[v31];
    v33 = &a2[v31];
    v35 = *(_QWORD *)v33;
    v34 = *((_QWORD *)v33 + 1);
    *(_QWORD *)v32 = v35;
    *((_QWORD *)v32 + 1) = v34;
    swift_bridgeObjectRelease();
    *(_QWORD *)&a1[v26[7]] = *(_QWORD *)&a2[v26[7]];
    swift_bridgeObjectRelease();
    v36 = v26[8];
    v37 = &a1[v36];
    v38 = &a2[v36];
    v39 = type metadata accessor for WorkoutProgramPreview();
    v40 = *(_QWORD *)(v39 - 8);
    v41 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v40 + 48);
    v42 = v41(v37, 1, v39);
    v43 = v41(v38, 1, v39);
    if (v42)
    {
      if (!v43)
      {
        *(_OWORD *)v37 = *(_OWORD *)v38;
        v44 = *(int *)(v39 + 20);
        v45 = &v37[v44];
        v46 = &v38[v44];
        v47 = sub_23C34D950();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v47 - 8) + 32))(v45, v46, v47);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
        goto LABEL_27;
      }
    }
    else
    {
      if (!v43)
      {
        v75 = *((_QWORD *)v38 + 1);
        *(_QWORD *)v37 = *(_QWORD *)v38;
        *((_QWORD *)v37 + 1) = v75;
        swift_bridgeObjectRelease();
        v76 = *(int *)(v39 + 20);
        v77 = &v37[v76];
        v78 = &v38[v76];
        v79 = sub_23C34D950();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v79 - 8) + 40))(v77, v78, v79);
LABEL_27:
        v62 = v26[9];
        v63 = &a1[v62];
        v64 = &a2[v62];
        v65 = sub_23C34D950();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v65 - 8) + 40))(v63, v64, v65);
        v66 = v26[10];
        v67 = &a1[v66];
        v68 = &a2[v66];
        v69 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v83 + 48);
        v70 = v69(&a1[v66], 1, v30);
        v71 = v69(v68, 1, v30);
        if (v70)
        {
          if (!v71)
          {
            (*(void (**)(char *, char *, uint64_t))(v83 + 32))(v67, v68, v30);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v83 + 56))(v67, 0, 1, v30);
LABEL_33:
            v73 = v85;
LABEL_34:
            v73(&a1[v26[11]], &a2[v26[11]], v30);
            v73(&a1[v26[12]], &a2[v26[12]], v30);
            *(_QWORD *)&a1[v26[13]] = *(_QWORD *)&a2[v26[13]];
            swift_bridgeObjectRelease();
            return a1;
          }
        }
        else
        {
          if (!v71)
          {
            v80 = v67;
            v73 = v85;
            v85(v80, v68, v30);
            goto LABEL_34;
          }
          (*(void (**)(char *, uint64_t))(v83 + 8))(v67, v30);
        }
        v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
        memcpy(v67, v68, *(_QWORD *)(*(_QWORD *)(v72 - 8) + 64));
        goto LABEL_33;
      }
      sub_23C283550((uint64_t)v37, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutProgramPreview);
    }
    v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
    memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64));
    goto LABEL_27;
  }
  if (v10)
  {
LABEL_10:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
  if (swift_getEnumCaseMultiPayload() == 1)
    v11 = (uint64_t *)&unk_256B5A3E8;
  else
    v11 = (uint64_t *)&unk_256B5A3E0;
  v12 = __swift_instantiateConcreteTypeFromMangledName(v11);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(a1, a2, v12);
  swift_storeEnumTagMultiPayload();
  v13 = (int *)type metadata accessor for WorkoutProgram();
  v14 = v13[5];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = sub_23C34D86C();
  v82 = *(_QWORD *)(v17 - 8);
  v84 = *(void (**)(char *, char *, uint64_t))(v82 + 32);
  v84(v15, v16, v17);
  *(_OWORD *)&a1[v13[6]] = *(_OWORD *)&a2[v13[6]];
  *(_QWORD *)&a1[v13[7]] = *(_QWORD *)&a2[v13[7]];
  v18 = v13[8];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = type metadata accessor for WorkoutProgramPreview();
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    *(_OWORD *)v19 = *(_OWORD *)v20;
    v48 = *(int *)(v21 + 20);
    v81 = &v19[v48];
    v49 = &v20[v48];
    v50 = sub_23C34D950();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v50 - 8) + 32))(v81, v49, v50);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  v51 = v13[9];
  v52 = &a1[v51];
  v53 = &a2[v51];
  v54 = sub_23C34D950();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v54 - 8) + 32))(v52, v53, v54);
  v55 = v13[10];
  v56 = &a1[v55];
  v57 = &a2[v55];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v82 + 48))(&a2[v55], 1, v17))
  {
    v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
    memcpy(v56, v57, *(_QWORD *)(*(_QWORD *)(v58 - 8) + 64));
    v59 = v84;
  }
  else
  {
    v60 = v57;
    v59 = v84;
    v84(v56, v60, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v82 + 56))(v56, 0, 1, v17);
  }
  v84(&a1[v13[11]], &a2[v13[11]], v17);
  v59(&a1[v13[12]], &a2[v13[12]], v17);
  *(_QWORD *)&a1[v13[13]] = *(_QWORD *)&a2[v13[13]];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProgramDetailLoadState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C32790C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 3)
    return v5 - 2;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ProgramDetailLoadState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C327968(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 2);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_23C3279C0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 2, v2);
}

uint64_t sub_23C3279FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 2, v4);
}

uint64_t sub_23C327A40()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for WorkoutProgram();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ProgramDetailLoadState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C327AE0 + 4 * byte_23C35CAE5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C327B14 + 4 * asc_23C35CAE0[v4]))();
}

uint64_t sub_23C327B14(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C327B1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C327B24);
  return result;
}

uint64_t sub_23C327B30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C327B38);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C327B3C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C327B44(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProgramDetailLoadState.CodingKeys()
{
  return &type metadata for ProgramDetailLoadState.CodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailLoadState.IdleCodingKeys()
{
  return &type metadata for ProgramDetailLoadState.IdleCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailLoadState.FetchingCodingKeys()
{
  return &type metadata for ProgramDetailLoadState.FetchingCodingKeys;
}

uint64_t storeEnumTagSinglePayload for ProgramDetailLoadState.FetchedCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C327BC0 + 4 * byte_23C35CAEA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C327BE0 + 4 * byte_23C35CAEF[v4]))();
}

_BYTE *sub_23C327BC0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C327BE0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C327BE8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C327BF0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C327BF8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C327C00(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ProgramDetailLoadState.FetchedCodingKeys()
{
  return &type metadata for ProgramDetailLoadState.FetchedCodingKeys;
}

unint64_t sub_23C327C20()
{
  unint64_t result;

  result = qword_256B5C230;
  if (!qword_256B5C230)
  {
    result = MEMORY[0x24261C66C](&unk_23C35CC74, &type metadata for ProgramDetailLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C230);
  }
  return result;
}

unint64_t sub_23C327C68()
{
  unint64_t result;

  result = qword_256B5C238;
  if (!qword_256B5C238)
  {
    result = MEMORY[0x24261C66C](&unk_23C35CDCC, &type metadata for ProgramDetailLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C238);
  }
  return result;
}

unint64_t sub_23C327CB0()
{
  unint64_t result;

  result = qword_256B5C240;
  if (!qword_256B5C240)
  {
    result = MEMORY[0x24261C66C](&unk_23C35CCEC, &type metadata for ProgramDetailLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C240);
  }
  return result;
}

unint64_t sub_23C327CF8()
{
  unint64_t result;

  result = qword_256B5C248;
  if (!qword_256B5C248)
  {
    result = MEMORY[0x24261C66C](&unk_23C35CD14, &type metadata for ProgramDetailLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C248);
  }
  return result;
}

unint64_t sub_23C327D40()
{
  unint64_t result;

  result = qword_256B5C250;
  if (!qword_256B5C250)
  {
    result = MEMORY[0x24261C66C](&unk_23C35CC9C, &type metadata for ProgramDetailLoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C250);
  }
  return result;
}

unint64_t sub_23C327D88()
{
  unint64_t result;

  result = qword_256B5C258;
  if (!qword_256B5C258)
  {
    result = MEMORY[0x24261C66C](&unk_23C35CCC4, &type metadata for ProgramDetailLoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C258);
  }
  return result;
}

unint64_t sub_23C327DD0()
{
  unint64_t result;

  result = qword_256B5C260;
  if (!qword_256B5C260)
  {
    result = MEMORY[0x24261C66C](&unk_23C35CBE4, &type metadata for ProgramDetailLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C260);
  }
  return result;
}

unint64_t sub_23C327E18()
{
  unint64_t result;

  result = qword_256B5C268;
  if (!qword_256B5C268)
  {
    result = MEMORY[0x24261C66C](&unk_23C35CC0C, &type metadata for ProgramDetailLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C268);
  }
  return result;
}

unint64_t sub_23C327E60()
{
  unint64_t result;

  result = qword_256B5C270;
  if (!qword_256B5C270)
  {
    result = MEMORY[0x24261C66C](&unk_23C35CD3C, &type metadata for ProgramDetailLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C270);
  }
  return result;
}

unint64_t sub_23C327EA8()
{
  unint64_t result;

  result = qword_256B5C278;
  if (!qword_256B5C278)
  {
    result = MEMORY[0x24261C66C](&unk_23C35CD64, &type metadata for ProgramDetailLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C278);
  }
  return result;
}

uint64_t sub_23C327EEC(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x446D6172676F7270 && a2 == 0xED00006C69617465)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23C34EC64();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C327F88()
{
  return 0x446D6172676F7270;
}

__n128 ProgramDetailLayout.contentMargins.getter@<Q0>(_OWORD *a1@<X8>)
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

uint64_t ProgramDetailLayout.dynamicTypeSize.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t ProgramDetailLayout.sizeClass.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 33);
}

__n128 ProgramDetailLayout.init(contentMargins:dynamicTypeSize:sizeClass:)@<Q0>(uint64_t a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X8>)
{
  __n128 result;
  __int128 v5;

  result = *(__n128 *)a1;
  v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(_OWORD *)(a4 + 16) = v5;
  *(_BYTE *)(a4 + 32) = a2;
  *(_BYTE *)(a4 + 33) = a3 & 1;
  return result;
}

uint64_t sub_23C327FE0(char a1)
{
  return *(_QWORD *)&aContentmdynami[8 * a1];
}

uint64_t sub_23C328000()
{
  char *v0;

  return sub_23C327FE0(*v0);
}

uint64_t sub_23C328008@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C328A88(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C32802C()
{
  sub_23C328224();
  return sub_23C34ECD0();
}

uint64_t sub_23C328054()
{
  sub_23C328224();
  return sub_23C34ECDC();
}

uint64_t ProgramDetailLayout.encode(to:)(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  char v17;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C288);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  v8 = *((_QWORD *)v1 + 2);
  v9 = *((_QWORD *)v1 + 3);
  v16 = *((unsigned __int8 *)v1 + 32);
  v10 = *((_BYTE *)v1 + 33);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C328224();
  sub_23C34ECC4();
  v13 = v12;
  v14 = v8;
  v15 = v9;
  v17 = 0;
  sub_23C328268();
  sub_23C34EC40();
  if (!v2)
  {
    LOBYTE(v13) = v16;
    v17 = 1;
    sub_23C3282AC();
    sub_23C34EC40();
    LOBYTE(v13) = v10;
    v17 = 2;
    sub_23C3282F0();
    sub_23C34EC40();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23C328224()
{
  unint64_t result;

  result = qword_256B5C290;
  if (!qword_256B5C290)
  {
    result = MEMORY[0x24261C66C](&unk_23C35D128, &type metadata for ProgramDetailLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C290);
  }
  return result;
}

unint64_t sub_23C328268()
{
  unint64_t result;

  result = qword_256B5C298;
  if (!qword_256B5C298)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for ProgramDetailContentMargins, &type metadata for ProgramDetailContentMargins);
    atomic_store(result, (unint64_t *)&qword_256B5C298);
  }
  return result;
}

unint64_t sub_23C3282AC()
{
  unint64_t result;

  result = qword_256B5C2A0;
  if (!qword_256B5C2A0)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for ProgramDetailDynamicTypeSize, &type metadata for ProgramDetailDynamicTypeSize);
    atomic_store(result, (unint64_t *)&qword_256B5C2A0);
  }
  return result;
}

unint64_t sub_23C3282F0()
{
  unint64_t result;

  result = qword_256B5C2A8;
  if (!qword_256B5C2A8)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for ProgramDetailSizeClass, &type metadata for ProgramDetailSizeClass);
    atomic_store(result, (unint64_t *)&qword_256B5C2A8);
  }
  return result;
}

uint64_t ProgramDetailLayout.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char v14;
  char v15;
  _QWORD v16[4];
  char v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C2B0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C328224();
  sub_23C34ECB8();
  if (!v2)
  {
    v17 = 0;
    sub_23C328510();
    sub_23C34EBB0();
    v9 = v16[0];
    v10 = v16[1];
    v11 = v16[2];
    v12 = v16[3];
    v17 = 1;
    sub_23C328554();
    sub_23C34EBB0();
    v14 = v16[0];
    v17 = 2;
    sub_23C328598();
    sub_23C34EBB0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v15 = v16[0];
    *(_QWORD *)a2 = v9;
    *(_QWORD *)(a2 + 8) = v10;
    *(_QWORD *)(a2 + 16) = v11;
    *(_QWORD *)(a2 + 24) = v12;
    *(_BYTE *)(a2 + 32) = v14;
    *(_BYTE *)(a2 + 33) = v15;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_23C328510()
{
  unint64_t result;

  result = qword_256B5C2B8;
  if (!qword_256B5C2B8)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for ProgramDetailContentMargins, &type metadata for ProgramDetailContentMargins);
    atomic_store(result, (unint64_t *)&qword_256B5C2B8);
  }
  return result;
}

unint64_t sub_23C328554()
{
  unint64_t result;

  result = qword_256B5C2C0;
  if (!qword_256B5C2C0)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for ProgramDetailDynamicTypeSize, &type metadata for ProgramDetailDynamicTypeSize);
    atomic_store(result, (unint64_t *)&qword_256B5C2C0);
  }
  return result;
}

unint64_t sub_23C328598()
{
  unint64_t result;

  result = qword_256B5C2C8;
  if (!qword_256B5C2C8)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for ProgramDetailSizeClass, &type metadata for ProgramDetailSizeClass);
    atomic_store(result, (unint64_t *)&qword_256B5C2C8);
  }
  return result;
}

uint64_t sub_23C3285DC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ProgramDetailLayout.init(from:)(a1, a2);
}

uint64_t sub_23C3285F0(_QWORD *a1)
{
  return ProgramDetailLayout.encode(to:)(a1);
}

uint64_t ProgramDetailLayout.hash(into:)()
{
  sub_23C34ECA0();
  sub_23C34ECA0();
  sub_23C34ECA0();
  sub_23C34ECA0();
  sub_23C34EC88();
  return sub_23C34EC88();
}

uint64_t ProgramDetailLayout.hashValue.getter()
{
  sub_23C34EC7C();
  ProgramDetailLayout.hash(into:)();
  return sub_23C34ECAC();
}

uint64_t sub_23C3286E8()
{
  sub_23C34EC7C();
  ProgramDetailLayout.hash(into:)();
  return sub_23C34ECAC();
}

uint64_t sub_23C328744()
{
  sub_23C34EC7C();
  ProgramDetailLayout.hash(into:)();
  return sub_23C34ECAC();
}

uint64_t _s20FitnessProductDetail07ProgramC6LayoutV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint16x4_t v2;

  v2 = (uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)a1, *(float64x2_t *)a2), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 16), *(float64x2_t *)(a2 + 16)))), 0xFuLL));
  v2.i16[0] = vminv_u16(v2);
  return v2.i32[0] & ~(*(unsigned __int8 *)(a2 + 33) ^ *(unsigned __int8 *)(a1 + 33)) & (*(unsigned __int8 *)(a1 + 32) == *(unsigned __int8 *)(a2 + 32));
}

unint64_t sub_23C3287F0()
{
  unint64_t result;

  result = qword_256B5C2D0;
  if (!qword_256B5C2D0)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for ProgramDetailLayout, &type metadata for ProgramDetailLayout);
    atomic_store(result, (unint64_t *)&qword_256B5C2D0);
  }
  return result;
}

__n128 __swift_memcpy34_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for ProgramDetailLayout(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 34))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 33);
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ProgramDetailLayout(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_WORD *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 34) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 34) = 0;
    if (a2)
      *(_BYTE *)(result + 33) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for ProgramDetailLayout()
{
  return &type metadata for ProgramDetailLayout;
}

uint64_t storeEnumTagSinglePayload for ProgramDetailLayout.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C328930 + 4 * byte_23C35CF75[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C328964 + 4 * byte_23C35CF70[v4]))();
}

uint64_t sub_23C328964(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C32896C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C328974);
  return result;
}

uint64_t sub_23C328980(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C328988);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C32898C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C328994(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProgramDetailLayout.CodingKeys()
{
  return &type metadata for ProgramDetailLayout.CodingKeys;
}

unint64_t sub_23C3289B4()
{
  unint64_t result;

  result = qword_256B5C2D8;
  if (!qword_256B5C2D8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35D100, &type metadata for ProgramDetailLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C2D8);
  }
  return result;
}

unint64_t sub_23C3289FC()
{
  unint64_t result;

  result = qword_256B5C2E0;
  if (!qword_256B5C2E0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35D070, &type metadata for ProgramDetailLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C2E0);
  }
  return result;
}

unint64_t sub_23C328A44()
{
  unint64_t result;

  result = qword_256B5C2E8;
  if (!qword_256B5C2E8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35D098, &type metadata for ProgramDetailLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C2E8);
  }
  return result;
}

uint64_t sub_23C328A88(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x4D746E65746E6F63 && a2 == 0xEE00736E69677261;
  if (v3 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5463696D616E7964 && a2 == 0xEF657A6953657079 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x73616C43657A6973 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C34EC64();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23C328C04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_23C34DFF8();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_23C34E004();
}

uint64_t sub_23C328CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_23C34DFF8();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_23C34E004();
}

uint64_t sub_23C328D8C(uint64_t *a1, unint64_t a2, uint64_t a3)
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
    return sub_23C34E70C();
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
  return sub_23C34E70C();
}

uint64_t sub_23C328F40()
{
  return sub_23C34DD40();
}

uint64_t sub_23C328F58()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C378);
  sub_23C28943C(&qword_256B5C380, &qword_256B5C378, MEMORY[0x24BE2B5E8]);
  return sub_23C34DD58();
}

uint64_t EditorialDetailView.init(store:artworkViewBuilder:filterResultsViewBuilder:textViewBuilder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)a9 = sub_23C286DF0;
  *(_QWORD *)(a9 + 8) = result;
  *(_BYTE *)(a9 + 16) = 0;
  *(_QWORD *)(a9 + 24) = a3;
  *(_QWORD *)(a9 + 32) = a4;
  *(_QWORD *)(a9 + 40) = a5;
  *(_QWORD *)(a9 + 48) = a6;
  *(_QWORD *)(a9 + 56) = a7;
  *(_QWORD *)(a9 + 64) = a8;
  return result;
}

uint64_t sub_23C329058()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t EditorialDetailView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v25[2];
  _QWORD v26[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _QWORD v32[2];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v25[1] = a2;
  v4 = *(_QWORD *)(a1 + 16);
  sub_23C34DE30();
  sub_23C34DE30();
  sub_23C34E010();
  sub_23C34E130();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256B5C2F0);
  v5 = *(_QWORD *)(a1 + 24);
  swift_getTupleTypeMetadata3();
  v6 = sub_23C34E700();
  MEMORY[0x24261C66C](MEMORY[0x24BDF5428], v6);
  v7 = sub_23C34E64C();
  MEMORY[0x24261C66C](MEMORY[0x24BDF4700], v7);
  v8 = sub_23C34DD34();
  v9 = sub_23C34DE30();
  v32[0] = MEMORY[0x24261C66C](MEMORY[0x24BDEB238], v8);
  v32[1] = MEMORY[0x24BDF1050];
  v10 = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v9, v32);
  *(_QWORD *)&v33 = v9;
  *((_QWORD *)&v33 + 1) = v10;
  MEMORY[0x24261C60C](255, &v33, MEMORY[0x24BDF2FE0], 0);
  v11 = sub_23C34E010();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v25 - v13;
  v15 = v2[1];
  v16 = v2[3];
  v35 = v2[2];
  v36 = v16;
  v17 = v2[1];
  v33 = *v2;
  v34 = v17;
  v18 = v2[3];
  v29 = v35;
  v30 = v18;
  v37 = *((_QWORD *)v2 + 8);
  v31 = *((_QWORD *)v2 + 8);
  v27 = v33;
  v28 = v15;
  sub_23C329360(a1, (uint64_t)v25 - v13);
  v19 = swift_allocObject();
  v20 = v35;
  v21 = v36;
  v22 = v33;
  *(_OWORD *)(v19 + 64) = v34;
  *(_OWORD *)(v19 + 80) = v20;
  *(_QWORD *)(v19 + 16) = v4;
  *(_QWORD *)(v19 + 24) = v5;
  *(_OWORD *)(v19 + 96) = v21;
  v23 = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(v19 + 112) = v37;
  *(_OWORD *)(v19 + 32) = v23;
  *(_OWORD *)(v19 + 48) = v22;
  sub_23C329B3C((uint64_t)&v33);
  *(_QWORD *)&v27 = v9;
  *((_QWORD *)&v27 + 1) = v10;
  v26[0] = swift_getOpaqueTypeConformance2();
  v26[1] = MEMORY[0x24BDF5138];
  MEMORY[0x24261C66C](MEMORY[0x24BDEF3E0], v11, v26);
  sub_23C34E4E4();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_23C329360@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  __n128 v12;
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
  uint64_t State;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t OpaqueTypeConformance2;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  unsigned __int8 v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[2];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  _QWORD v84[2];
  _OWORD v85[2];
  __int128 v86;
  __int128 v87;
  uint64_t v88;

  v77 = a2;
  v72 = sub_23C34E028();
  v73 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72);
  v64 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(a1 + 16);
  sub_23C34DE30();
  v66 = v5;
  sub_23C34DE30();
  sub_23C34E010();
  sub_23C34E130();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256B5C2F0);
  v63 = *(_QWORD *)(a1 + 24);
  swift_getTupleTypeMetadata3();
  v6 = sub_23C34E700();
  MEMORY[0x24261C66C](MEMORY[0x24BDF5428], v6);
  v7 = sub_23C34E64C();
  v8 = MEMORY[0x24261C66C](MEMORY[0x24BDF4700], v7);
  v60 = v7;
  v59 = v8;
  v9 = sub_23C34DD34();
  v65 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v62 = (char *)&v56 - v10;
  v11 = sub_23C34DE30();
  v71 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v74 = (char *)&v56 - v13;
  v61 = MEMORY[0x24261C66C](MEMORY[0x24BDEB238], v9, v12);
  v84[0] = v61;
  v84[1] = MEMORY[0x24BDF1050];
  v14 = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v11, v84);
  *(_QWORD *)&v85[0] = v11;
  *((_QWORD *)&v85[0] + 1) = v14;
  v15 = MEMORY[0x24261C60C](0, v85, MEMORY[0x24BDF2FE0], 0);
  v69 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v70 = (uint64_t)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v67 = (char *)&v56 - v18;
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v56 - v20;
  v22 = type metadata accessor for EditorialDetailContent();
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v56 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  State = type metadata accessor for EditorialDetailLoadState();
  MEMORY[0x24BDAC7A8](State);
  v27 = (char *)&v56 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = sub_23C34E010();
  v76 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v29 = (char *)&v56 - v28;
  v30 = *(_OWORD *)(v2 + 16);
  v31 = *(_OWORD *)(v2 + 48);
  v86 = *(_OWORD *)(v2 + 32);
  v87 = v31;
  v32 = *(_OWORD *)(v2 + 16);
  v85[0] = *(_OWORD *)v2;
  v85[1] = v32;
  v33 = *(_OWORD *)(v2 + 48);
  v81 = v86;
  v82 = v33;
  v88 = *(_QWORD *)(v2 + 64);
  v83 = *(_QWORD *)(v2 + 64);
  v79 = v85[0];
  v80 = v30;
  v68 = (char *)a1;
  sub_23C328F58();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A538);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 48))(v27, 2, v34))
  {
    *(_QWORD *)&v79 = v11;
    *((_QWORD *)&v79 + 1) = v14;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_23C328C04(OpaqueTypeConformance2, v15, MEMORY[0x24BDF5158]);
    v36 = v77;
    v37 = v14;
    v38 = v76;
    v39 = v75;
    v40 = v11;
  }
  else
  {
    v56 = v11;
    v57 = v21;
    v58 = v14;
    v41 = v64;
    v42 = sub_23C2851C0((uint64_t)v27, (uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for EditorialDetailContent);
    MEMORY[0x24BDAC7A8](v42);
    v43 = v63;
    *(&v56 - 6) = v66;
    *(&v56 - 5) = v43;
    *((_OWORD *)&v56 - 2) = *((_OWORD *)v68 + 2);
    *(&v56 - 2) = (uint64_t)v85;
    *(&v56 - 1) = (uint64_t)v24;
    v68 = v24;
    sub_23C34E160();
    v44 = v62;
    sub_23C34DD40();
    sub_23C34DE3C();
    v45 = sub_23C34E184();
    sub_23C34E1A8();
    sub_23C34E1A8();
    if (sub_23C34E1A8() != v45)
      sub_23C34E1A8();
    sub_23C34E424();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v44, v9);
    sub_23C34E01C();
    v46 = sub_23C34E160();
    sub_23C34E154();
    sub_23C34E154();
    v47 = sub_23C34E154();
    v48 = v72;
    v49 = v73;
    v40 = v56;
    if (v47 != v46)
      sub_23C34E154();
    v50 = (uint64_t)v67;
    v37 = v58;
    v51 = v74;
    sub_23C34E454();
    (*(void (**)(char *, uint64_t))(v49 + 8))(v41, v48);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v51, v40);
    *(_QWORD *)&v79 = v40;
    *((_QWORD *)&v79 + 1) = v37;
    swift_getOpaqueTypeConformance2();
    v52 = (uint64_t)v57;
    sub_23C28958C(v50, v15, (uint64_t)v57);
    v53 = *(void (**)(uint64_t, uint64_t))(v69 + 8);
    v53(v50, v15);
    v54 = v70;
    sub_23C287D30(v52, v15, v70);
    sub_23C328CC8(v54, v15);
    v53(v54, v15);
    v53(v52, v15);
    sub_23C283550((uint64_t)v68, (uint64_t (*)(_QWORD))type metadata accessor for EditorialDetailContent);
    v36 = v77;
    v38 = v76;
    v39 = v75;
  }
  *(_QWORD *)&v79 = v40;
  *((_QWORD *)&v79 + 1) = v37;
  v78[0] = swift_getOpaqueTypeConformance2();
  v78[1] = MEMORY[0x24BDF5138];
  MEMORY[0x24261C66C](MEMORY[0x24BDEF3E0], v39, v78);
  sub_23C287D30((uint64_t)v29, v39, v36);
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v29, v39);
}

void sub_23C329B34()
{
  sub_23C32DD24();
}

uint64_t sub_23C329B3C(uint64_t a1)
{
  sub_23C28801C();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23C329B98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C329BCC()
{
  sub_23C287FCC();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23C329C0C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  __int128 v8;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_23C28801C();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = a2[3];
  v7 = a2[8];
  v8 = *((_OWORD *)a2 + 3);
  *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
  *(_OWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 64) = v7;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23C329CA0(uint64_t a1, uint64_t *a2)
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
  sub_23C28801C();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_23C287FCC();
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
  return a1;
}

uint64_t sub_23C329D48(uint64_t a1, uint64_t a2)
{
  char v4;

  v4 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_23C287FCC();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  return a1;
}

uint64_t sub_23C329DBC(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_23C329E04(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
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
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for EditorialDetailView()
{
  JUMPOUT(0x24261C5D0);
}

uint64_t sub_23C329E60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];
  _QWORD v10[2];
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  sub_23C34DE30();
  sub_23C34DE30();
  sub_23C34E010();
  sub_23C34E130();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256B5C2F0);
  swift_getTupleTypeMetadata3();
  v0 = sub_23C34E700();
  MEMORY[0x24261C66C](MEMORY[0x24BDF5428], v0);
  v1 = sub_23C34E64C();
  MEMORY[0x24261C66C](MEMORY[0x24BDF4700], v1);
  v2 = sub_23C34DD34();
  v3 = sub_23C34DE30();
  v13[0] = MEMORY[0x24261C66C](MEMORY[0x24BDEB238], v2);
  v13[1] = MEMORY[0x24BDF1050];
  v4 = MEMORY[0x24BDED308];
  v5 = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v3, v13);
  v11 = v3;
  v12 = v5;
  MEMORY[0x24261C60C](255, &v11, MEMORY[0x24BDF2FE0], 0);
  v6 = sub_23C34E010();
  v7 = sub_23C34DE30();
  v11 = v3;
  v12 = v5;
  v10[0] = swift_getOpaqueTypeConformance2();
  v10[1] = MEMORY[0x24BDF5138];
  v9[0] = MEMORY[0x24261C66C](MEMORY[0x24BDEF3E0], v6, v10);
  v9[1] = MEMORY[0x24BDF0910];
  return MEMORY[0x24261C66C](v4, v7, v9);
}

uint64_t sub_23C32A060@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t);
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

  v22 = a5;
  v23 = a6;
  v24 = a7;
  sub_23C34DE30();
  sub_23C34DE30();
  sub_23C34E010();
  sub_23C34E130();
  sub_23C34DE30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256B5C2F0);
  swift_getTupleTypeMetadata3();
  v11 = sub_23C34E700();
  MEMORY[0x24261C66C](MEMORY[0x24BDF5428], v11);
  v12 = sub_23C34E64C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v21 - v17;
  sub_23C34DFEC();
  v25 = a3;
  v26 = a4;
  v27 = v22;
  v28 = v23;
  v29 = a1;
  v30 = a2;
  sub_23C34E640();
  MEMORY[0x24261C66C](MEMORY[0x24BDF4700], v12);
  sub_23C28958C((uint64_t)v15, v12, (uint64_t)v18);
  v19 = *(void (**)(char *, uint64_t))(v13 + 8);
  v19(v15, v12);
  sub_23C287D30((uint64_t)v18, v12, v24);
  return ((uint64_t (*)(char *, uint64_t))v19)(v18, v12);
}

uint64_t sub_23C32A250()
{
  return sub_23C323C9C((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C32A060);
}

void sub_23C32A25C(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
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
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[15];
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v28[2] = a6;
  v28[4] = a2;
  v28[13] = a7;
  v28[12] = *(_QWORD *)(a4 - 8);
  v30 = a4;
  MEMORY[0x24BDAC7A8](a1);
  v28[10] = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v28[11] = (char *)v28 - v14;
  v15 = type metadata accessor for EditorialDetailLayout();
  MEMORY[0x24BDAC7A8](v15);
  v28[8] = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C388);
  MEMORY[0x24BDAC7A8](v17);
  v28[6] = (char *)v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(qword_256B5C2F0);
  MEMORY[0x24BDAC7A8](v34);
  v32 = (char *)v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v28[9] = (char *)v28 - v21;
  sub_23C34DE30();
  v28[1] = a3;
  sub_23C34DE30();
  v22 = sub_23C34E010();
  v28[7] = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  sub_23C34E130();
  v29 = sub_23C34DE30();
  v33 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  MEMORY[0x24BDAC7A8](v23);
  v31 = (char *)v28 - v24;
  v25 = a1[2];
  v26 = a1[3];
  v27 = *a1;
  v40 = a1[1];
  v41 = v25;
  v42 = v26;
  v43 = *((_QWORD *)a1 + 8);
  v39 = v27;
  v35 = a3;
  v36 = a4;
  v37 = a5;
  v38 = a6;
  type metadata accessor for EditorialDetailView();
}

uint64_t sub_23C32A528(uint64_t a1)
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
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD *v26;
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
  void (*v40)(_QWORD, _QWORD);
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t);

  *(_QWORD *)(v8 - 472) = a1;
  v9 = *(_QWORD *)(v8 - 464);
  sub_23C32A9EC(v9, a1, v3);
  v10 = MEMORY[0x24BDEEC40];
  *(_QWORD *)(v8 - 256) = v5;
  *(_QWORD *)(v8 - 248) = v10;
  v11 = v5;
  v12 = MEMORY[0x24BDED308];
  v13 = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v4, v8 - 256);
  v14 = MEMORY[0x24BDEBEE0];
  *(_QWORD *)(v8 - 272) = v11;
  *(_QWORD *)(v8 - 264) = v14;
  v15 = MEMORY[0x24261C66C](v12, v1, v8 - 272);
  *(_QWORD *)(v8 - 288) = v13;
  *(_QWORD *)(v8 - 280) = v15;
  v16 = MEMORY[0x24261C66C](MEMORY[0x24BDEF3E0], v6, v8 - 288);
  sub_23C34E43C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 440) + 8))(v3, v6);
  v17 = sub_23C27FEE4(&qword_256B58D20, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  *(_QWORD *)(v8 - 304) = v16;
  *(_QWORD *)(v8 - 296) = v17;
  v18 = *(_QWORD *)(v8 - 376);
  *(_QWORD *)(v8 - 456) = MEMORY[0x24261C66C](v12, v18, v8 - 304);
  v19 = *(_QWORD *)(v8 - 360);
  *(_QWORD *)(v8 - 384) = v7;
  sub_23C28958C(v7, v18, v19);
  v20 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 344) + 8);
  *(_QWORD *)(v8 - 440) = v20;
  v20(v7, v18);
  v21 = *(_QWORD *)(v8 - 448);
  v22 = *(_QWORD *)(v8 - 480);
  sub_23C32AF58(v9, v2, *(_QWORD *)(v8 - 488), *(_QWORD *)(v8 - 368), v11, v22, v21);
  LOBYTE(v16) = sub_23C34E16C();
  v23 = *(_OWORD *)(v2 + 32);
  v24 = *(_OWORD *)(v2 + 48);
  v25 = *(_OWORD *)v2;
  v26 = (_OWORD *)(v8 - 208);
  v26[1] = *(_OWORD *)(v2 + 16);
  v26[2] = v23;
  v26[3] = v24;
  *(_QWORD *)(v8 - 144) = *(_QWORD *)(v2 + 64);
  *(_OWORD *)(v8 - 208) = v25;
  sub_23C328F58();
  swift_getKeyPath();
  v27 = *(_QWORD *)(v8 - 432);
  sub_23C34E79C();
  swift_release();
  swift_release();
  sub_23C34DC20();
  v28 = sub_23C34DC38();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 8))(v27, v28);
  sub_23C34DD28();
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v37 = *(_QWORD *)(v8 - 352);
  sub_23C28950C(v21, v37, &qword_256B5C388);
  v38 = v37 + *(int *)(*(_QWORD *)(v8 - 336) + 36);
  *(_BYTE *)v38 = v16;
  *(_QWORD *)(v38 + 8) = v30;
  *(_QWORD *)(v38 + 16) = v32;
  *(_QWORD *)(v38 + 24) = v34;
  *(_QWORD *)(v38 + 32) = v36;
  *(_BYTE *)(v38 + 40) = 0;
  sub_23C285184(v21, &qword_256B5C388);
  v39 = *(_QWORD *)(v8 - 424);
  sub_23C2894C8(v37, v39, qword_256B5C2F0);
  v40 = *(void (**)(_QWORD, _QWORD))(v2 + 40);
  v41 = *(_OWORD *)(v2 + 32);
  v42 = *(_OWORD *)v2;
  *(_OWORD *)(v8 - 192) = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v8 - 176) = v41;
  *(_OWORD *)(v8 - 160) = *(_OWORD *)(v2 + 48);
  *(_QWORD *)(v8 - 144) = *(_QWORD *)(v2 + 64);
  *(_OWORD *)(v8 - 208) = v42;
  sub_23C328F58();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  v43 = *(_QWORD *)(v8 - 416);
  v40(*(_QWORD *)(v8 - 208), *(_QWORD *)(v8 - 200));
  swift_bridgeObjectRelease();
  v44 = *(_QWORD *)(v8 - 408);
  v45 = *(_QWORD *)(v8 - 368);
  v46 = v22;
  sub_23C28958C(v43, v45, v44);
  v47 = *(_QWORD *)(v8 - 400);
  v48 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
  v49 = v43;
  v48(v43, v45);
  v50 = *(_QWORD *)(v8 - 384);
  v51 = *(_QWORD *)(v8 - 360);
  v52 = *(_QWORD *)(v8 - 376);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 344) + 16))(v50, v51, v52);
  *(_QWORD *)(v8 - 208) = v50;
  v53 = *(_QWORD *)(v8 - 352);
  sub_23C28950C(v39, v53, qword_256B5C2F0);
  *(_QWORD *)(v8 - 200) = v53;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16))(v49, v44, v45);
  *(_QWORD *)(v8 - 192) = v49;
  v54 = *(_QWORD *)(v8 - 336);
  *(_QWORD *)(v8 - 240) = v52;
  *(_QWORD *)(v8 - 232) = v54;
  *(_QWORD *)(v8 - 224) = v45;
  *(_QWORD *)(v8 - 328) = *(_QWORD *)(v8 - 456);
  *(_QWORD *)(v8 - 320) = sub_23C32B960();
  *(_QWORD *)(v8 - 312) = v46;
  sub_23C328D8C((uint64_t *)(v8 - 208), 3uLL, v8 - 240);
  v48(v44, v45);
  sub_23C285184(v39, qword_256B5C2F0);
  v55 = *(void (**)(uint64_t, uint64_t))(v8 - 440);
  v55(v51, v52);
  v48(v49, v45);
  sub_23C285184(v53, qword_256B5C2F0);
  return ((uint64_t (*)(_QWORD, uint64_t))v55)(*(_QWORD *)(v8 - 384), v52);
}

uint64_t sub_23C32A9E0()
{
  return sub_23C323C9C((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C32A25C);
}

uint64_t sub_23C32A9EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 *v3;
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(_QWORD);
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[2];
  __int128 v66;
  char v67;
  void (*v68)(_QWORD);
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v4 = a2;
  v52 = a1;
  v58 = a3;
  v5 = *(_QWORD *)(a2 + 16);
  v6 = sub_23C34DE30();
  v48 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v50 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v49 = (uint64_t)&v45 - v9;
  v54 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23C34DE30();
  v46 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v47 = (uint64_t)&v45 - v17;
  v18 = type metadata accessor for EditorialDetailLayout();
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = v6;
  v57 = sub_23C34E010();
  v56 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57);
  v55 = (char *)&v45 - v21;
  LOBYTE(v21) = *((_BYTE *)v3 + 16);
  v22 = (void (*)(_QWORD))*((_QWORD *)v3 + 3);
  v23 = *((_QWORD *)v3 + 8);
  v66 = *v3;
  v67 = v21;
  v68 = v22;
  v24 = v3[3];
  v51 = v3[2];
  v69 = v51;
  v70 = v24;
  v71 = v23;
  v25 = v4;
  sub_23C328F58();
  swift_getKeyPath();
  sub_23C34E79C();
  swift_release();
  swift_release();
  LODWORD(v4) = v20[*(int *)(v18 + 20)];
  sub_23C283550((uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for EditorialDetailLayout);
  v22(v52);
  v26 = MEMORY[0x24BDEEC40];
  v27 = MEMORY[0x24BDEBEE0];
  if (v4 > 2)
  {
    sub_23C34E6E8();
    v28 = *(_QWORD *)(v25 + 32);
    v35 = (uint64_t)v50;
    sub_23C34E484();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v12, v5);
    v65[0] = v28;
    v65[1] = v27;
    v36 = MEMORY[0x24BDED308];
    v33 = v53;
    MEMORY[0x24261C66C](MEMORY[0x24BDED308], v53, v65);
    v37 = v49;
    sub_23C28958C(v35, v33, v49);
    v38 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
    v38(v35, v33);
    sub_23C287D30(v37, v33, v35);
    v64[0] = v28;
    v64[1] = v26;
    MEMORY[0x24261C66C](v36, v13, v64);
    v34 = (uint64_t)v55;
    sub_23C328C04(v35, v13, v33);
    v38(v35, v33);
    v39 = v37;
    v27 = MEMORY[0x24BDEBEE0];
    v38(v39, v33);
  }
  else
  {
    v28 = *(_QWORD *)(v25 + 32);
    sub_23C34E3C4();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v12, v5);
    v60[0] = v28;
    v60[1] = v26;
    v29 = MEMORY[0x24BDED308];
    MEMORY[0x24261C66C](MEMORY[0x24BDED308], v13, v60);
    v30 = v47;
    sub_23C28958C((uint64_t)v15, v13, v47);
    v31 = *(void (**)(char *, uint64_t))(v46 + 8);
    v31(v15, v13);
    sub_23C287D30(v30, v13, (uint64_t)v15);
    v59[0] = v28;
    v59[1] = v27;
    v32 = v29;
    v33 = v53;
    MEMORY[0x24261C66C](v32, v53, v59);
    v34 = (uint64_t)v55;
    sub_23C328CC8((uint64_t)v15, v13);
    v31(v15, v13);
    v31((char *)v30, v13);
  }
  v63[0] = v28;
  v63[1] = v26;
  v40 = MEMORY[0x24BDED308];
  v41 = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v13, v63);
  v62[0] = v28;
  v62[1] = v27;
  v42 = MEMORY[0x24261C66C](v40, v33, v62);
  v61[0] = v41;
  v61[1] = v42;
  v43 = v57;
  MEMORY[0x24261C66C](MEMORY[0x24BDEF3E0], v57, v61);
  sub_23C287D30(v34, v43, v58);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v56 + 8))(v34, v43);
}

uint64_t sub_23C32AF58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
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
  int *v25;
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
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
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
  unint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  char *v77;
  char v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD v90[7];
  uint64_t v91;
  uint64_t v92;
  char *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  char *v111;
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
  uint64_t v122;

  v112 = a6;
  v106 = a7;
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C3B0);
  v95 = *(_QWORD *)(v96 - 8);
  MEMORY[0x24BDAC7A8](v96);
  v94 = (char *)v90 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C3B8);
  v103 = *(_QWORD *)(v105 - 8);
  MEMORY[0x24BDAC7A8](v105);
  v93 = (char *)v90 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A0C8);
  MEMORY[0x24BDAC7A8](v14);
  v109 = (uint64_t)v90 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for EditorialPreview();
  v17 = *(_QWORD *)(v16 - 8);
  v107 = v16;
  v108 = v17;
  MEMORY[0x24BDAC7A8](v16);
  v91 = (uint64_t)v90 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90[6] = v18;
  MEMORY[0x24BDAC7A8](v19);
  v92 = (uint64_t)v90 - v20;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C3C0);
  MEMORY[0x24BDAC7A8](v21);
  v104 = (char *)v90 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v102 = (uint64_t)v90 - v24;
  v25 = (int *)type metadata accessor for EditorialDetailContent();
  v97 = *((_QWORD *)v25 - 1);
  MEMORY[0x24BDAC7A8](v25);
  v98 = v26;
  v99 = (char *)v90 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_23C34DA34();
  MEMORY[0x24BDAC7A8](v27);
  v111 = (char *)v90 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C3C8);
  MEMORY[0x24BDAC7A8](v29);
  v101 = (char *)v90 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31);
  v113 = (uint64_t)v90 - v32;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C3D0);
  MEMORY[0x24BDAC7A8](v33);
  v100 = (char *)v90 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v35);
  v37 = (char *)v90 - v36;
  MEMORY[0x24BDAC7A8](v38);
  v40 = (char *)v90 - v39;
  *(_QWORD *)v37 = sub_23C34DF5C();
  *((_QWORD *)v37 + 1) = 0;
  v37[16] = 0;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C3D8);
  v42 = a3;
  v43 = a3;
  v44 = a4;
  v45 = a4;
  v46 = a5;
  v47 = a5;
  v48 = v112;
  sub_23C32BA48(a1, a2, v43, v45, v47, v112, (uint64_t)&v37[*(int *)(v41 + 44)]);
  v110 = v40;
  sub_23C2894C8((uint64_t)v37, (uint64_t)v40, &qword_256B5C3D0);
  v49 = (uint64_t *)(a1 + v25[10]);
  v50 = v49[1];
  if (v50)
  {
    v51 = *v49;
    v52 = swift_allocObject();
    v90[3] = v52;
    *(_QWORD *)(v52 + 16) = v51;
    *(_QWORD *)(v52 + 24) = v50;
    v53 = (_QWORD *)(a1 + v25[7]);
    v54 = v53[1];
    v90[4] = *v53;
    v90[2] = v54;
    v55 = *(_OWORD *)(a2 + 48);
    v120 = *(_OWORD *)(a2 + 32);
    v121 = v55;
    v122 = *(_QWORD *)(a2 + 64);
    v56 = *(_OWORD *)(a2 + 16);
    v118 = *(_OWORD *)a2;
    v119 = v56;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v114 = v42;
    v115 = v44;
    v90[5] = v25;
    v90[0] = v46;
    v116 = v46;
    v117 = v48;
    type metadata accessor for EditorialDetailView();
  }
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C3E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v113, 1, 1, v57);
  v58 = v48;
  v59 = v109;
  sub_23C28950C(a1 + v25[8], v109, &qword_256B5A0C8);
  v60 = v108;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v108 + 48))(v59, 1, v107) == 1)
  {
    sub_23C285184(v59, &qword_256B5A0C8);
    v61 = 1;
    v62 = v106;
    v63 = v105;
    v64 = (uint64_t)v104;
    v65 = v103;
    v66 = v102;
  }
  else
  {
    v67 = v92;
    sub_23C2851C0(v59, v92, (uint64_t (*)(_QWORD))type metadata accessor for EditorialPreview);
    v68 = v91;
    sub_23C282F90(v67, v91, (uint64_t (*)(_QWORD))type metadata accessor for EditorialPreview);
    v69 = (*(unsigned __int8 *)(v60 + 80) + 120) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
    v70 = swift_allocObject();
    *(_QWORD *)(v70 + 16) = v42;
    *(_QWORD *)(v70 + 24) = v44;
    *(_QWORD *)(v70 + 32) = v46;
    *(_QWORD *)(v70 + 40) = v58;
    v71 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(v70 + 80) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(v70 + 96) = v71;
    *(_QWORD *)(v70 + 112) = *(_QWORD *)(a2 + 64);
    v72 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v70 + 48) = *(_OWORD *)a2;
    *(_OWORD *)(v70 + 64) = v72;
    sub_23C2851C0(v68, v70 + v69, (uint64_t (*)(_QWORD))type metadata accessor for EditorialPreview);
    sub_23C329B3C(a2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C3F0);
    v73 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5C3F8);
    v74 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5BED8);
    v75 = sub_23C32D188();
    v76 = sub_23C28943C(&qword_256B5BF08, &qword_256B5BED8, MEMORY[0x24BEE30C8]);
    *(_QWORD *)&v118 = v73;
    *((_QWORD *)&v118 + 1) = v74;
    *(_QWORD *)&v119 = v75;
    *((_QWORD *)&v119 + 1) = v76;
    swift_getOpaqueTypeConformance2();
    v77 = v94;
    sub_23C34E5D4();
    v78 = sub_23C34E1C0();
    v79 = v95;
    v80 = v93;
    v81 = v96;
    (*(void (**)(char *, char *, uint64_t))(v95 + 16))(v93, v77, v96);
    v63 = v105;
    v82 = &v80[*(int *)(v105 + 36)];
    *v82 = v78;
    *(_OWORD *)(v82 + 8) = 0u;
    *(_OWORD *)(v82 + 24) = 0u;
    v82[40] = 1;
    (*(void (**)(char *, uint64_t))(v79 + 8))(v77, v81);
    sub_23C283550(v67, (uint64_t (*)(_QWORD))type metadata accessor for EditorialPreview);
    v83 = (uint64_t)v80;
    v66 = v102;
    sub_23C2894C8(v83, v102, &qword_256B5C3B8);
    v61 = 0;
    v62 = v106;
    v64 = (uint64_t)v104;
    v65 = v103;
  }
  v84 = (uint64_t)v101;
  v85 = (uint64_t)v100;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v65 + 56))(v66, v61, 1, v63);
  v86 = (uint64_t)v110;
  sub_23C28950C((uint64_t)v110, v85, &qword_256B5C3D0);
  v87 = v113;
  sub_23C28950C(v113, v84, &qword_256B5C3C8);
  sub_23C28950C(v66, v64, &qword_256B5C3C0);
  sub_23C28950C(v85, v62, &qword_256B5C3D0);
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C3E8);
  sub_23C28950C(v84, v62 + *(int *)(v88 + 48), &qword_256B5C3C8);
  sub_23C28950C(v64, v62 + *(int *)(v88 + 64), &qword_256B5C3C0);
  sub_23C285184(v66, &qword_256B5C3C0);
  sub_23C285184(v87, &qword_256B5C3C8);
  sub_23C285184(v86, &qword_256B5C3D0);
  sub_23C285184(v64, &qword_256B5C3C0);
  sub_23C285184(v84, &qword_256B5C3C8);
  return sub_23C285184(v85, &qword_256B5C3D0);
}

unint64_t sub_23C32B960()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B5C390;
  if (!qword_256B5C390)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256B5C2F0);
    v2[0] = sub_23C32B9CC();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B5C390);
  }
  return result;
}

unint64_t sub_23C32B9CC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256B5C398;
  if (!qword_256B5C398)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5C388);
    v2 = sub_23C28943C(&qword_256B5C3A0, &qword_256B5C3A8, MEMORY[0x24BDF5428]);
    result = MEMORY[0x24261C66C](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256B5C398);
  }
  return result;
}

uint64_t sub_23C32BA48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t KeyPath;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t);
  uint64_t result;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  char *v103;
  char *v104;
  char *v105;
  char *v106;
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
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char v129;

  v113 = a6;
  v111 = a5;
  v109 = a4;
  v108 = a3;
  v112 = a2;
  v96 = a7;
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BED8);
  MEMORY[0x24BDAC7A8](v95);
  v102 = (char *)&v89 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23C34DEA8();
  v120 = *(_QWORD *)(v9 - 8);
  v121 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v119 = (char *)&v89 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23C34E124();
  v12 = *(_QWORD *)(v11 - 8);
  v115 = v11;
  v116 = v12;
  MEMORY[0x24BDAC7A8](v11);
  v105 = (char *)&v89 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C478);
  v114 = *(_QWORD *)(v110 - 8);
  MEMORY[0x24BDAC7A8](v110);
  v103 = (char *)&v89 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C480);
  v117 = *(_QWORD *)(v15 - 8);
  v118 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v104 = (char *)&v89 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C488);
  MEMORY[0x24BDAC7A8](v107);
  v106 = (char *)&v89 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C490);
  MEMORY[0x24BDAC7A8](v101);
  v99 = (char *)&v89 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C498);
  v91 = *(_QWORD *)(v92 - 8);
  MEMORY[0x24BDAC7A8](v92);
  v90 = (char *)&v89 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C4A0);
  MEMORY[0x24BDAC7A8](v89);
  v94 = (char *)&v89 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v93 = (uint64_t)&v89 - v22;
  v100 = sub_23C34DFC8();
  v98 = *(_QWORD *)(v100 - 8);
  MEMORY[0x24BDAC7A8](v100);
  v24 = (char *)&v89 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C4A8);
  MEMORY[0x24BDAC7A8](v25);
  v97 = (char *)&v89 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v122 = (uint64_t)&v89 - v28;
  v29 = (uint64_t *)(a1 + *(int *)(type metadata accessor for EditorialDetailContent() + 28));
  v30 = v29[1];
  v123 = *v29;
  v124 = v30;
  sub_23C2C0058();
  swift_bridgeObjectRetain();
  v31 = sub_23C34E358();
  v33 = v32;
  v35 = v34 & 1;
  sub_23C34E1CC();
  v36 = sub_23C34E334();
  v38 = v37;
  v40 = v39;
  swift_release();
  sub_23C289340(v31, v33, v35);
  swift_bridgeObjectRelease();
  v41 = sub_23C34E328();
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v48 = v36;
  v49 = (uint64_t)v97;
  v50 = v38;
  v51 = (uint64_t)v99;
  sub_23C289340(v48, v50, v40 & 1);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  v123 = v41;
  v124 = v43;
  v125 = v45 & 1;
  v126 = v47;
  v127 = KeyPath;
  v128 = 3;
  v129 = 0;
  sub_23C34DFBC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B58E70);
  sub_23C324D28();
  sub_23C34E460();
  v53 = v24;
  v54 = (uint64_t)v102;
  (*(void (**)(char *, uint64_t))(v98 + 8))(v53, v100);
  sub_23C289340(v123, v124, v125);
  swift_bridgeObjectRelease();
  swift_release();
  sub_23C2894C8(v49, v122, &qword_256B5C4A8);
  v55 = swift_allocObject();
  v56 = v109;
  *(_QWORD *)(v55 + 16) = v108;
  *(_QWORD *)(v55 + 24) = v56;
  v57 = v113;
  *(_QWORD *)(v55 + 32) = v111;
  *(_QWORD *)(v55 + 40) = v57;
  v58 = v112;
  v59 = *(_OWORD *)(v112 + 48);
  *(_OWORD *)(v55 + 80) = *(_OWORD *)(v112 + 32);
  *(_OWORD *)(v55 + 96) = v59;
  *(_QWORD *)(v55 + 112) = *(_QWORD *)(v58 + 64);
  v60 = *(_OWORD *)(v58 + 16);
  *(_OWORD *)(v55 + 48) = *(_OWORD *)v58;
  *(_OWORD *)(v55 + 64) = v60;
  sub_23C329B3C(v58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C000);
  sub_23C324138();
  v61 = v103;
  sub_23C34E5D4();
  v62 = v105;
  sub_23C34E118();
  sub_23C28943C(&qword_256B5C4B0, &qword_256B5C478, MEMORY[0x24BDF43B0]);
  sub_23C27FEE4(&qword_256B5C4B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF0DA8], MEMORY[0x24BDF0D88]);
  v63 = v104;
  v64 = v110;
  v65 = v115;
  sub_23C34E3D0();
  (*(void (**)(char *, uint64_t))(v116 + 8))(v62, v65);
  (*(void (**)(char *, uint64_t))(v114 + 8))(v61, v64);
  v66 = v119;
  sub_23C34DE9C();
  v67 = swift_getKeyPath();
  v68 = (uint64_t)v106;
  v69 = (uint64_t *)&v106[*(int *)(v107 + 36)];
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C4C0);
  v72 = v120;
  v71 = v121;
  (*(void (**)(char *, char *, uint64_t))(v120 + 16))((char *)v69 + *(int *)(v70 + 28), v66, v121);
  *v69 = v67;
  v74 = v117;
  v73 = v118;
  (*(void (**)(uint64_t, char *, uint64_t))(v117 + 16))(v68, v63, v118);
  (*(void (**)(char *, uint64_t))(v72 + 8))(v66, v71);
  (*(void (**)(char *, uint64_t))(v74 + 8))(v63, v73);
  v75 = sub_23C34E52C();
  sub_23C28950C(v68, v51, &qword_256B5C488);
  *(_QWORD *)(v51 + *(int *)(v101 + 36)) = v75;
  sub_23C285184(v68, &qword_256B5C488);
  v76 = *MEMORY[0x24BDECF38];
  v77 = sub_23C34DE24();
  v78 = (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v77 - 8) + 104))(v54, v76, v77);
  sub_23C27FEE4(&qword_256B5BF28, v78, MEMORY[0x24BDECF78]);
  result = sub_23C34E850();
  if ((result & 1) != 0)
  {
    sub_23C32DD8C();
    sub_23C28943C(&qword_256B5BF08, &qword_256B5BED8, MEMORY[0x24BEE30C8]);
    v80 = v90;
    sub_23C34E418();
    sub_23C285184(v54, &qword_256B5BED8);
    sub_23C285184(v51, &qword_256B5C490);
    v81 = v91;
    v82 = (uint64_t)v94;
    v83 = v92;
    (*(void (**)(char *, char *, uint64_t))(v91 + 16))(v94, v80, v92);
    *(_QWORD *)(v82 + *(int *)(v89 + 36)) = 0x3FF0000000000000;
    (*(void (**)(char *, uint64_t))(v81 + 8))(v80, v83);
    v84 = v93;
    sub_23C2894C8(v82, v93, &qword_256B5C4A0);
    v85 = v122;
    sub_23C28950C(v122, v49, &qword_256B5C4A8);
    sub_23C28950C(v84, v82, &qword_256B5C4A0);
    v86 = v96;
    sub_23C28950C(v49, v96, &qword_256B5C4A8);
    v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C4E0);
    v88 = v86 + *(int *)(v87 + 48);
    *(_QWORD *)v88 = 0x4014000000000000;
    *(_BYTE *)(v88 + 8) = 0;
    sub_23C28950C(v82, v86 + *(int *)(v87 + 64), &qword_256B5C4A0);
    sub_23C285184(v84, &qword_256B5C4A0);
    sub_23C285184(v85, &qword_256B5C4A8);
    sub_23C285184(v82, &qword_256B5C4A0);
    return sub_23C285184(v49, &qword_256B5C4A8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_23C32C39C()
{
  uint64_t v0;

  v0 = type metadata accessor for EditorialDetailAction();
  MEMORY[0x24BDAC7A8](v0);
  type metadata accessor for EditorialDetailView();
}

uint64_t sub_23C32C440()
{
  uint64_t (*v0)(_QWORD);
  uint64_t v1;

  sub_23C328F58();
  swift_storeEnumTagMultiPayload();
  sub_23C34E7A8();
  swift_release();
  return sub_23C283550(v1, v0);
}

uint64_t sub_23C32C498@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t *v8;
  uint64_t v10;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5B0B0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C34DF98();
  sub_23C34E5BC();
  v6 = sub_23C34E1D8();
  KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  v8 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B5C000) + 36));
  *v8 = KeyPath;
  v8[1] = v6;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_23C32C590()
{
  sub_23C2C0058();
  swift_bridgeObjectRetain();
  return sub_23C34E358();
}

uint64_t sub_23C32C5E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  *(_QWORD *)a7 = sub_23C34DFEC();
  *(_QWORD *)(a7 + 8) = 0x4024000000000000;
  *(_BYTE *)(a7 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C418);
  return sub_23C32C66C(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_23C32C66C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;

  type metadata accessor for EditorialDetailContent();
  v11 = swift_bridgeObjectRetain();
  sub_23C32D58C(v11);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a3;
  *(_QWORD *)(v12 + 24) = a4;
  *(_QWORD *)(v12 + 32) = a5;
  *(_QWORD *)(v12 + 40) = a6;
  v13 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v12 + 80) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v12 + 96) = v13;
  *(_QWORD *)(v12 + 112) = *(_QWORD *)(a2 + 64);
  v14 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v12 + 48) = *(_OWORD *)a2;
  *(_OWORD *)(v12 + 64) = v14;
  sub_23C329B3C(a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C420);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C428);
  sub_23C28943C(&qword_256B5C430, &qword_256B5C420, MEMORY[0x24BEE12D8]);
  sub_23C27FEE4(&qword_256B5C438, (uint64_t (*)(uint64_t))type metadata accessor for EditorialExternalLink, (uint64_t)&protocol conformance descriptor for EditorialExternalLink);
  sub_23C28943C(&qword_256B5C440, &qword_256B5C428, MEMORY[0x24BDF43B0]);
  return sub_23C34E688();
}

uint64_t sub_23C32C7E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  _QWORD v21[6];

  v21[1] = a7;
  v13 = type metadata accessor for EditorialExternalLink();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8](v13);
  sub_23C282F90(a1, (uint64_t)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for EditorialExternalLink);
  v16 = (*(unsigned __int8 *)(v14 + 80) + 120) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a3;
  *(_QWORD *)(v17 + 24) = a4;
  *(_QWORD *)(v17 + 32) = a5;
  *(_QWORD *)(v17 + 40) = a6;
  v18 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v17 + 80) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v17 + 96) = v18;
  *(_QWORD *)(v17 + 112) = *(_QWORD *)(a2 + 64);
  v19 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v17 + 48) = *(_OWORD *)a2;
  *(_OWORD *)(v17 + 64) = v19;
  sub_23C2851C0((uint64_t)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16, (uint64_t (*)(_QWORD))type metadata accessor for EditorialExternalLink);
  v21[4] = a1;
  sub_23C329B3C(a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C448);
  sub_23C32D808();
  return sub_23C34E5D4();
}

void sub_23C32C92C()
{
  uint64_t v0;

  v0 = type metadata accessor for EditorialDetailAction();
  MEMORY[0x24BDAC7A8](v0);
  type metadata accessor for EditorialDetailView();
}

uint64_t sub_23C32C9D0()
{
  uint64_t (*v0)(_QWORD);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_23C328F58();
  v3 = v2 + *(int *)(type metadata accessor for EditorialExternalLink() + 20);
  v4 = sub_23C34D950();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(v1, v3, v4);
  swift_storeEnumTagMultiPayload();
  sub_23C34E7A8();
  swift_release();
  return sub_23C283550(v1, v0);
}

uint64_t sub_23C32CA58@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t KeyPath;
  uint64_t *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v41 = a2;
  v3 = sub_23C34E5A4();
  v39 = *(_QWORD *)(v3 - 8);
  v40 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v38 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23C34E25C();
  v36 = *(_QWORD *)(v5 - 8);
  v37 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5B0B0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C468);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C460);
  MEMORY[0x24BDAC7A8](v35);
  v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *a1;
  v19 = a1[1];
  v42 = v18;
  v43 = v19;
  sub_23C2C0058();
  swift_bridgeObjectRetain();
  sub_23C34E5C8();
  v42 = 0x4000000000000000;
  sub_23C28943C(&qword_256B5B0B8, &qword_256B5B0B0, MEMORY[0x24BDF41A8]);
  sub_23C3241D4();
  sub_23C34E3AC();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_23C34E1E4();
  v21 = v36;
  v20 = v37;
  (*(void (**)(char *, _QWORD, uint64_t))(v36 + 104))(v7, *MEMORY[0x24BDF17C8], v37);
  v22 = sub_23C34E28C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v20);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v17, v15, v12);
  v24 = (uint64_t *)&v17[*(int *)(v35 + 36)];
  *v24 = KeyPath;
  v24[1] = v22;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v26 = v38;
  v25 = v39;
  v27 = v40;
  (*(void (**)(char *, _QWORD, uint64_t))(v39 + 104))(v38, *MEMORY[0x24BDF40B0], v40);
  v28 = swift_getKeyPath();
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C448);
  v30 = v41;
  v31 = (uint64_t *)(v41 + *(int *)(v29 + 36));
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58FC0);
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))((char *)v31 + *(int *)(v32 + 28), v26, v27);
  *v31 = v28;
  sub_23C28950C((uint64_t)v17, v30, &qword_256B5C460);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  return sub_23C285184((uint64_t)v17, &qword_256B5C460);
}

void sub_23C32CDA8()
{
  uint64_t v0;

  v0 = type metadata accessor for EditorialDetailAction();
  MEMORY[0x24BDAC7A8](v0);
  type metadata accessor for EditorialDetailView();
}

uint64_t sub_23C32CE4C()
{
  uint64_t (*v0)(_QWORD);
  _QWORD *v1;
  _QWORD *v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  sub_23C328F58();
  v3 = (char *)v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B5AB70) + 48);
  v4 = v2[1];
  *v1 = *v2;
  v1[1] = v4;
  v5 = (char *)v2 + *(int *)(type metadata accessor for EditorialPreview() + 20);
  v6 = sub_23C34D950();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v3, v5, v6);
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRetain();
  sub_23C34E7A8();
  swift_release();
  return sub_23C283550((uint64_t)v1, v0);
}

uint64_t sub_23C32CEF8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  uint64_t result;
  uint64_t v15;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BED8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5B0B0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C3F8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C34DF98();
  sub_23C34E5BC();
  v10 = MEMORY[0x24261BC10](objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.650980392, 1.0, 0.0, 1.0));
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v6, v3);
  *(_QWORD *)&v9[*(int *)(v7 + 36)] = v10;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v11 = *MEMORY[0x24BDECF38];
  v12 = sub_23C34DE24();
  v13 = (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50];
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v2, v11, v12);
  sub_23C27FEE4(&qword_256B5BF28, v13, MEMORY[0x24BDECF78]);
  result = sub_23C34E850();
  if ((result & 1) != 0)
  {
    sub_23C32D188();
    sub_23C28943C(&qword_256B5BF08, &qword_256B5BED8, MEMORY[0x24BEE30C8]);
    sub_23C34E418();
    sub_23C285184((uint64_t)v2, &qword_256B5BED8);
    return sub_23C285184((uint64_t)v9, &qword_256B5C3F8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23C32D168()
{
  return objectdestroy_10Tm((uint64_t (*)(_QWORD))type metadata accessor for EditorialPreview);
}

uint64_t sub_23C32D174()
{
  return sub_23C32D78C((uint64_t (*)(_QWORD))type metadata accessor for EditorialPreview, (uint64_t (*)(_QWORD *, char *, uint64_t, uint64_t, uint64_t, uint64_t))sub_23C32CDA8);
}

unint64_t sub_23C32D188()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B5C400;
  if (!qword_256B5C400)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5C3F8);
    v2[0] = sub_23C28943C(&qword_256B5B0B8, &qword_256B5B0B0, MEMORY[0x24BDF41A8]);
    v2[1] = sub_23C28943C(&qword_256B59008, &qword_256B59010, MEMORY[0x24BDF0710]);
    result = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B5C400);
  }
  return result;
}

uint64_t sub_23C32D224()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C32D248()
{
  return sub_23C32C590();
}

uint64_t sub_23C32D250()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = type metadata accessor for EditorialDetailContent();
  v2 = (*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A0C0);
  if (swift_getEnumCaseMultiPayload() == 1)
    v4 = (uint64_t *)&unk_256B5A168;
  else
    v4 = (uint64_t *)&unk_256B5A160;
  v5 = __swift_instantiateConcreteTypeFromMangledName(v4);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v0 + v2, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = v3 + *(int *)(v1 + 32);
  v7 = type metadata accessor for EditorialPreview();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7))
  {
    swift_bridgeObjectRelease();
    v8 = v6 + *(int *)(v7 + 20);
    v9 = sub_23C34D950();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  }
  v10 = v3 + *(int *)(v1 + 36);
  v11 = sub_23C34D950();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23C287FCC();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C32D3FC@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = v1[2];
  v4 = v1[3];
  v5 = v1[4];
  v6 = v1[5];
  v7 = *(_QWORD *)(type metadata accessor for EditorialDetailContent() - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  return sub_23C32C5E0((uint64_t)v1 + v8, (uint64_t)v1 + ((*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8), v3, v4, v5, v6, a1);
}

void sub_23C32D478()
{
  sub_23C32DD24();
}

uint64_t sub_23C32D480@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_23C34DF44();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_23C32D4B0()
{
  return sub_23C34DF50();
}

uint64_t sub_23C32D4DC()
{
  return sub_23C34DEB4();
}

uint64_t sub_23C32D4FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23C32D510(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDF40C0], MEMORY[0x24BDEDE98]);
}

uint64_t sub_23C32D510(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(char *))
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  a5(0);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

size_t sub_23C32D58C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  size_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C470);
  v3 = *(_QWORD *)(type metadata accessor for EditorialExternalLink() - 8);
  v4 = *(_QWORD *)(v3 + 72);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      sub_23C32D9B8(&v11, (uint64_t)v6 + v5, v1, a1);
      v10 = v9;
      swift_bridgeObjectRetain();
      sub_23C32DC74();
      if (v10 == v1)
        return (size_t)v6;
      __break(1u);
      return MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23C32D6A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_23C32C7E8(a1, (uint64_t)(v2 + 6), v2[2], v2[3], v2[4], v2[5], a2);
}

uint64_t sub_23C32D6B8()
{
  return objectdestroy_10Tm((uint64_t (*)(_QWORD))type metadata accessor for EditorialExternalLink);
}

uint64_t objectdestroy_10Tm(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1(0);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);
  v4 = (v3 + 120) & ~v3;
  sub_23C287FCC();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v5 = v1 + v4 + *(int *)(v2 + 20);
  v6 = sub_23C34D950();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_deallocObject();
}

uint64_t sub_23C32D778()
{
  return sub_23C32D78C((uint64_t (*)(_QWORD))type metadata accessor for EditorialExternalLink, (uint64_t (*)(_QWORD *, char *, uint64_t, uint64_t, uint64_t, uint64_t))sub_23C32C92C);
}

uint64_t sub_23C32D78C(uint64_t (*a1)(_QWORD), uint64_t (*a2)(_QWORD *, char *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *((_QWORD *)v2 + 2);
  v4 = *((_QWORD *)v2 + 3);
  v5 = *((_QWORD *)v2 + 4);
  v6 = *((_QWORD *)v2 + 5);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(a1(0) - 8) + 80);
  return a2((_QWORD *)v2 + 6, &v2[(v7 + 120) & ~v7], v3, v4, v5, v6);
}

uint64_t sub_23C32D800@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C32CA58(*(uint64_t **)(v1 + 16), a1);
}

unint64_t sub_23C32D808()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B5C450;
  if (!qword_256B5C450)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5C448);
    v2[0] = sub_23C32D88C();
    v2[1] = sub_23C28943C(&qword_256B58FE8, &qword_256B58FC0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B5C450);
  }
  return result;
}

unint64_t sub_23C32D88C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_256B5C458;
  if (!qword_256B5C458)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5C460);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5B0B0);
    v2[3] = &type metadata for ReversedTitleIconLabelStyle;
    v2[4] = sub_23C28943C(&qword_256B5B0B8, &qword_256B5B0B0, MEMORY[0x24BDF41A8]);
    v2[5] = sub_23C3241D4();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_23C28943C(&qword_256B59380, &qword_256B59388, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B5C458);
  }
  return result;
}

uint64_t sub_23C32D974()
{
  return sub_23C34DEB4();
}

uint64_t sub_23C32D994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23C32D510(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDF40C0], MEMORY[0x24BDEDE98]);
}

void sub_23C32D9B8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  _QWORD *v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v8 = type metadata accessor for EditorialExternalLink();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v30 - v13;
  v35 = a4;
  v17 = *(_QWORD *)(a4 + 56);
  v16 = a4 + 56;
  v15 = v17;
  v34 = v16;
  v18 = -1 << *(_BYTE *)(v16 - 24);
  if (-v18 < 64)
    v19 = ~(-1 << -(char)v18);
  else
    v19 = -1;
  v20 = v19 & v15;
  if (!a2)
  {
    v21 = 0;
LABEL_37:
    v29 = v34;
    *a1 = v35;
    a1[1] = v29;
    a1[2] = ~v18;
    a1[3] = v21;
    a1[4] = v20;
    return;
  }
  if (!a3)
  {
    v21 = 0;
    goto LABEL_37;
  }
  if (a3 < 0)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v31 = -1 << *(_BYTE *)(v16 - 24);
  v32 = a1;
  v21 = 0;
  v22 = 0;
  v33 = (unint64_t)(63 - v18) >> 6;
  v30 = v33 - 1;
  if (!v20)
    goto LABEL_9;
LABEL_8:
  v23 = __clz(__rbit64(v20));
  v20 &= v20 - 1;
  v24 = v23 | (v21 << 6);
  while (1)
  {
    ++v22;
    v28 = *(_QWORD *)(v9 + 72);
    sub_23C282F90(*(_QWORD *)(v35 + 48) + v28 * v24, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for EditorialExternalLink);
    sub_23C2851C0((uint64_t)v11, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for EditorialExternalLink);
    sub_23C2851C0((uint64_t)v14, a2, (uint64_t (*)(_QWORD))type metadata accessor for EditorialExternalLink);
    if (v22 == a3)
      goto LABEL_36;
    a2 += v28;
    if (v20)
      goto LABEL_8;
LABEL_9:
    v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v25 >= v33)
      goto LABEL_32;
    v26 = *(_QWORD *)(v34 + 8 * v25);
    if (!v26)
      break;
LABEL_18:
    v20 = (v26 - 1) & v26;
    v24 = __clz(__rbit64(v26)) + (v25 << 6);
    v21 = v25;
  }
  v21 += 2;
  if (v25 + 1 >= v33)
  {
    v20 = 0;
    v21 = v25;
    goto LABEL_36;
  }
  v26 = *(_QWORD *)(v34 + 8 * v21);
  if (v26)
    goto LABEL_14;
  v27 = v25 + 2;
  if (v25 + 2 >= v33)
    goto LABEL_32;
  v26 = *(_QWORD *)(v34 + 8 * v27);
  if (v26)
    goto LABEL_17;
  v21 = v25 + 3;
  if (v25 + 3 >= v33)
  {
    v20 = 0;
    v21 = v25 + 2;
    goto LABEL_36;
  }
  v26 = *(_QWORD *)(v34 + 8 * v21);
  if (v26)
  {
LABEL_14:
    v25 = v21;
    goto LABEL_18;
  }
  v27 = v25 + 4;
  if (v25 + 4 >= v33)
  {
LABEL_32:
    v20 = 0;
LABEL_36:
    v18 = v31;
    a1 = v32;
    goto LABEL_37;
  }
  v26 = *(_QWORD *)(v34 + 8 * v27);
  if (v26)
  {
LABEL_17:
    v25 = v27;
    goto LABEL_18;
  }
  while (1)
  {
    v25 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v25 >= v33)
    {
      v20 = 0;
      v21 = v30;
      goto LABEL_36;
    }
    v26 = *(_QWORD *)(v34 + 8 * v25);
    ++v27;
    if (v26)
      goto LABEL_18;
  }
LABEL_40:
  __break(1u);
}

uint64_t sub_23C32DC74()
{
  return swift_release();
}

uint64_t sub_23C32DC7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_23C34DF44();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_23C32DCAC()
{
  return sub_23C34DF50();
}

uint64_t objectdestroy_2Tm_3()
{
  sub_23C287FCC();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_23C32DD1C()
{
  sub_23C32DD24();
}

void sub_23C32DD24()
{
  sub_23C32C39C();
}

uint64_t sub_23C32DD48()
{
  return sub_23C34DEF0();
}

uint64_t sub_23C32DD68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23C32D510(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDEDCA8], MEMORY[0x24BDEE140]);
}

unint64_t sub_23C32DD8C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B5C4C8;
  if (!qword_256B5C4C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5C490);
    v2[0] = sub_23C32DE10();
    v2[1] = sub_23C28943C(&qword_256B59008, &qword_256B59010, MEMORY[0x24BDF0710]);
    result = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B5C4C8);
  }
  return result;
}

unint64_t sub_23C32DE10()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  _QWORD v5[6];

  result = qword_256B5C4D0;
  if (!qword_256B5C4D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5C488);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B5C478);
    v3 = sub_23C34E124();
    v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDF0DA8];
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = sub_23C28943C(&qword_256B5C4B0, &qword_256B5C478, MEMORY[0x24BDF43B0]);
    v5[5] = sub_23C27FEE4(&qword_256B5C4B8, v4, MEMORY[0x24BDF0D88]);
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = sub_23C28943C(&qword_256B5C4D8, &qword_256B5C4C0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24261C66C](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256B5C4D0);
  }
  return result;
}

__n128 ProgramDetailState.layout.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  char v3;
  __n128 result;
  __int128 v5;

  v2 = *(_BYTE *)(v1 + 32);
  v3 = *(_BYTE *)(v1 + 33);
  result = *(__n128 *)v1;
  v5 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 32) = v2;
  *(_BYTE *)(a1 + 33) = v3;
  return result;
}

void ProgramDetailState.libraryState.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 34);
}

_BYTE *ProgramDetailState.libraryState.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 34) = *result;
  return result;
}

uint64_t (*ProgramDetailState.libraryState.modify())(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t ProgramDetailState.loadState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for ProgramDetailState();
  return sub_23C282F90(v1 + *(int *)(v3 + 24), a1, (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailLoadState);
}

uint64_t type metadata accessor for ProgramDetailState()
{
  uint64_t result;

  result = qword_256B5C578;
  if (!qword_256B5C578)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ProgramDetailState.loadState.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for ProgramDetailState() + 24);
  return sub_23C32E004(a1, v3);
}

uint64_t sub_23C32E004(uint64_t a1, uint64_t a2)
{
  uint64_t State;

  State = type metadata accessor for ProgramDetailLoadState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(State - 8) + 40))(a2, a1, State);
  return a2;
}

uint64_t (*ProgramDetailState.loadState.modify())(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD)
{
  type metadata accessor for ProgramDetailState();
  return nullsub_1;
}

uint64_t ProgramDetailState.locale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ProgramDetailState() + 28);
  v4 = sub_23C34DA34();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t ProgramDetailState.programIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ProgramDetailState() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ProgramDetailState.showingRemoveFromLibraryAlert.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ProgramDetailState() + 36));
}

uint64_t ProgramDetailState.showingRemoveFromLibraryAlert.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for ProgramDetailState();
  *(_BYTE *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*ProgramDetailState.showingRemoveFromLibraryAlert.modify())(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD)
{
  type metadata accessor for ProgramDetailState();
  return nullsub_1;
}

uint64_t ProgramDetailState.showingShareSheet.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ProgramDetailState() + 40));
}

uint64_t ProgramDetailState.showingShareSheet.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for ProgramDetailState();
  *(_BYTE *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*ProgramDetailState.showingShareSheet.modify())(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD)
{
  type metadata accessor for ProgramDetailState();
  return nullsub_1;
}

uint64_t ProgramDetailState.init(layout:libraryState:loadState:locale:programIdentifier:showingRemoveFromLibraryAlert:showingShareSheet:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, char a8@<W7>, uint64_t a9@<X8>)
{
  char v16;
  char v17;
  char v18;
  __int128 v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  _QWORD *v24;

  v16 = *(_BYTE *)(a1 + 32);
  v17 = *(_BYTE *)(a1 + 33);
  v18 = *a2;
  v19 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a9 = *(_OWORD *)a1;
  *(_OWORD *)(a9 + 16) = v19;
  *(_BYTE *)(a9 + 32) = v16;
  *(_BYTE *)(a9 + 33) = v17;
  *(_BYTE *)(a9 + 34) = v18;
  v20 = (int *)type metadata accessor for ProgramDetailState();
  sub_23C32E2A8(a3, a9 + v20[6]);
  v21 = a9 + v20[7];
  v22 = sub_23C34DA34();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v21, a4, v22);
  v24 = (_QWORD *)(a9 + v20[8]);
  *v24 = a5;
  v24[1] = a6;
  *(_BYTE *)(a9 + v20[9]) = a7;
  *(_BYTE *)(a9 + v20[10]) = a8;
  return result;
}

uint64_t sub_23C32E2A8(uint64_t a1, uint64_t a2)
{
  uint64_t State;

  State = type metadata accessor for ProgramDetailLoadState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(State - 8) + 32))(a2, a1, State);
  return a2;
}

uint64_t sub_23C32E2EC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C32E324 + 4 * byte_23C35D3B0[a1]))(0xD000000000000011, 0x800000023C361DB0);
}

uint64_t sub_23C32E324()
{
  return 0x74756F79616CLL;
}

uint64_t sub_23C32E338()
{
  return 0x537972617262696CLL;
}

uint64_t sub_23C32E358()
{
  return 0x7461745364616F6CLL;
}

uint64_t sub_23C32E374()
{
  return 0x656C61636F6CLL;
}

uint64_t sub_23C32E388(uint64_t a1)
{
  return a1 + 12;
}

uint64_t sub_23C32E3AC()
{
  unsigned __int8 *v0;

  return sub_23C32E2EC(*v0);
}

uint64_t sub_23C32E3B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C330DC8(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C32E3D8(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_23C32E3E4()
{
  sub_23C32E6DC();
  return sub_23C34ECD0();
}

uint64_t sub_23C32E40C()
{
  sub_23C32E6DC();
  return sub_23C34ECDC();
}

uint64_t ProgramDetailState.encode(to:)(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v2;
  __int128 *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  char v10;
  __int128 v11;
  uint64_t v13;
  char v14;
  __int128 v15;
  __int128 v16;
  char v17;
  char v18;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C4E8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C32E6DC();
  sub_23C34ECC4();
  v9 = *((_BYTE *)v3 + 32);
  v10 = *((_BYTE *)v3 + 33);
  v11 = v3[1];
  v15 = *v3;
  v16 = v11;
  v17 = v9;
  v18 = v10;
  v14 = 0;
  sub_23C32E720();
  sub_23C34EC40();
  if (!v2)
  {
    LOBYTE(v15) = *((_BYTE *)v3 + 34);
    v14 = 1;
    sub_23C2F4650();
    sub_23C34EC40();
    type metadata accessor for ProgramDetailState();
    LOBYTE(v15) = 2;
    type metadata accessor for ProgramDetailLoadState();
    sub_23C27FEE4(&qword_256B5C500, (uint64_t (*)(uint64_t))type metadata accessor for ProgramDetailLoadState, (uint64_t)&protocol conformance descriptor for ProgramDetailLoadState);
    sub_23C34EC40();
    LOBYTE(v15) = 3;
    sub_23C34DA34();
    sub_23C27FEE4(&qword_256B576D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEC8]);
    sub_23C34EC40();
    LOBYTE(v15) = 4;
    sub_23C34EC10();
    LOBYTE(v15) = 5;
    sub_23C34EC1C();
    LOBYTE(v15) = 6;
    sub_23C34EC1C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_23C32E6DC()
{
  unint64_t result;

  result = qword_256B5C4F0;
  if (!qword_256B5C4F0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35D594, &type metadata for ProgramDetailState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C4F0);
  }
  return result;
}

unint64_t sub_23C32E720()
{
  unint64_t result;

  result = qword_256B5C4F8;
  if (!qword_256B5C4F8)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for ProgramDetailLayout, &type metadata for ProgramDetailLayout);
    atomic_store(result, (unint64_t *)&qword_256B5C4F8);
  }
  return result;
}

uint64_t ProgramDetailState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t State;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char v17;
  char v18;
  __int128 v19;
  uint64_t v20;
  int *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  char *v37;
  __int128 v38;
  __int128 v39;
  char v40;
  char v41;
  char v42;

  v30 = a2;
  v3 = sub_23C34DA34();
  v33 = *(_QWORD *)(v3 - 8);
  v34 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  State = type metadata accessor for ProgramDetailLoadState();
  MEMORY[0x24BDAC7A8](State);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C508);
  v9 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = type metadata accessor for ProgramDetailState();
  MEMORY[0x24BDAC7A8](v36);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[3];
  v35 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_23C32E6DC();
  v32 = v11;
  v15 = v37;
  sub_23C34ECB8();
  if (v15)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  v37 = v8;
  v29 = v5;
  v16 = v9;
  v42 = 0;
  sub_23C32EC50();
  sub_23C34EBB0();
  v17 = v40;
  v18 = v41;
  v19 = v39;
  *(_OWORD *)v13 = v38;
  *((_OWORD *)v13 + 1) = v19;
  v13[32] = v17;
  v13[33] = v18;
  v42 = 1;
  sub_23C2F5B6C();
  sub_23C34EBB0();
  v13[34] = v38;
  LOBYTE(v38) = 2;
  sub_23C27FEE4(&qword_256B5C518, (uint64_t (*)(uint64_t))type metadata accessor for ProgramDetailLoadState, (uint64_t)&protocol conformance descriptor for ProgramDetailLoadState);
  v20 = (uint64_t)v37;
  sub_23C34EBB0();
  v21 = (int *)v36;
  sub_23C32E2A8(v20, (uint64_t)&v13[*(int *)(v36 + 24)]);
  LOBYTE(v38) = 3;
  sub_23C27FEE4(&qword_256B57708, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEE8]);
  v22 = v29;
  v23 = v34;
  sub_23C34EBB0();
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(&v13[v21[7]], v22, v23);
  LOBYTE(v38) = 4;
  v24 = sub_23C34EB80();
  v25 = (uint64_t *)&v13[v21[8]];
  *v25 = v24;
  v25[1] = v26;
  LOBYTE(v38) = 5;
  v13[v21[9]] = sub_23C34EB8C() & 1;
  LOBYTE(v38) = 6;
  LOBYTE(v23) = sub_23C34EB8C();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v32, v31);
  v13[v21[10]] = v23 & 1;
  sub_23C282F90((uint64_t)v13, v30, (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailState);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  return sub_23C283550((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailState);
}

unint64_t sub_23C32EC50()
{
  unint64_t result;

  result = qword_256B5C510;
  if (!qword_256B5C510)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for ProgramDetailLayout, &type metadata for ProgramDetailLayout);
    atomic_store(result, (unint64_t *)&qword_256B5C510);
  }
  return result;
}

uint64_t sub_23C32EC94@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ProgramDetailState.init(from:)(a1, a2);
}

uint64_t sub_23C32ECA8(_QWORD *a1)
{
  return ProgramDetailState.encode(to:)(a1);
}

uint64_t _s20FitnessProductDetail07ProgramC5StateV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  char v4;
  char v5;
  __int128 v6;
  char v7;
  char v8;
  __int128 v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char v15;
  char v16;
  _OWORD v18[2];
  char v19;
  char v20;
  _OWORD v21[2];
  char v22;
  char v23;

  v4 = *(_BYTE *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 33);
  v6 = *(_OWORD *)(a1 + 16);
  v21[0] = *(_OWORD *)a1;
  v21[1] = v6;
  v22 = v4;
  v23 = v5;
  v7 = *(_BYTE *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 33);
  v9 = *(_OWORD *)(a2 + 16);
  v18[0] = *(_OWORD *)a2;
  v18[1] = v9;
  v19 = v7;
  v20 = v8;
  if ((_s20FitnessProductDetail07ProgramC6LayoutV2eeoiySbAC_ACtFZ_0((uint64_t)v21, (uint64_t)v18) & 1) == 0
    || *(unsigned __int8 *)(a1 + 34) != *(unsigned __int8 *)(a2 + 34)
    || (v10 = (int *)type metadata accessor for ProgramDetailState(),
        (_s20FitnessProductDetail07ProgramC9LoadStateO2eeoiySbAC_ACtFZ_0(a1 + v10[6], a2 + v10[6]) & 1) == 0)
    || (MEMORY[0x24261B124](a1 + v10[7], a2 + v10[7]) & 1) == 0)
  {
LABEL_9:
    v16 = 0;
    return v16 & 1;
  }
  v11 = v10[8];
  v12 = *(_QWORD *)(a1 + v11);
  v13 = *(_QWORD *)(a1 + v11 + 8);
  v14 = (_QWORD *)(a2 + v11);
  if (v12 == *v14 && v13 == v14[1] || (v15 = sub_23C34EC64(), v16 = 0, (v15 & 1) != 0))
  {
    if (*(unsigned __int8 *)(a1 + v10[9]) == *(unsigned __int8 *)(a2 + v10[9]))
    {
      v16 = *(_BYTE *)(a1 + v10[10]) ^ *(_BYTE *)(a2 + v10[10]) ^ 1;
      return v16 & 1;
    }
    goto LABEL_9;
  }
  return v16 & 1;
}

_QWORD *initializeBufferWithCopyOfBuffer for ProgramDetailState(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  __int128 v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t State;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  unsigned int (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *, char *, uint64_t);
  char *v44;
  void (*v45)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  char *v56;
  char *v57;
  uint64_t v58;
  char *__dst;
  void (*v60)(char *, char *);
  uint64_t v61;
  uint64_t v62;
  int *v63;
  uint64_t v64;
  uint64_t v65;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(_WORD *)(a1 + 32) = *((_WORD *)a2 + 16);
    *(_BYTE *)(a1 + 34) = *((_BYTE *)a2 + 34);
    v8 = a3[6];
    v9 = (char *)(a1 + v8);
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 2, v11))
    {
      State = type metadata accessor for ProgramDetailLoadState();
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(State - 8) + 64));
    }
    else
    {
      v64 = v12;
      v65 = v11;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
      if (swift_getEnumCaseMultiPayload() == 1)
        v15 = (uint64_t *)&unk_256B5A3E8;
      else
        v15 = (uint64_t *)&unk_256B5A3E0;
      v16 = __swift_instantiateConcreteTypeFromMangledName(v15);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v9, v10, v16);
      swift_storeEnumTagMultiPayload();
      v17 = (int *)type metadata accessor for WorkoutProgram();
      v18 = v17[5];
      v19 = &v9[v18];
      v20 = &v10[v18];
      v21 = sub_23C34D86C();
      v61 = *(_QWORD *)(v21 - 8);
      v62 = v21;
      v60 = *(void (**)(char *, char *))(v61 + 16);
      v60(v19, v20);
      v22 = v17[6];
      v23 = &v9[v22];
      v24 = &v10[v22];
      v25 = *((_QWORD *)v24 + 1);
      *(_QWORD *)v23 = *(_QWORD *)v24;
      *((_QWORD *)v23 + 1) = v25;
      *(_QWORD *)&v9[v17[7]] = *(_QWORD *)&v10[v17[7]];
      v63 = v17;
      v26 = v17[8];
      __dst = &v9[v26];
      v27 = &v10[v26];
      v28 = type metadata accessor for WorkoutProgramPreview();
      v58 = *(_QWORD *)(v28 - 8);
      v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v29(v27, 1, v28))
      {
        v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
        memcpy(__dst, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
      }
      else
      {
        v31 = *((_QWORD *)v27 + 1);
        *(_QWORD *)__dst = *(_QWORD *)v27;
        *((_QWORD *)__dst + 1) = v31;
        v32 = *(int *)(v28 + 20);
        v56 = &v27[v32];
        v57 = &__dst[v32];
        v33 = sub_23C34D950();
        v34 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 16);
        swift_bridgeObjectRetain();
        v34(v57, v56, v33);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v58 + 56))(__dst, 0, 1, v28);
      }
      v35 = v63[9];
      v36 = &v9[v35];
      v37 = &v10[v35];
      v38 = sub_23C34D950();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 16))(v36, v37, v38);
      v39 = v63[10];
      v40 = &v9[v39];
      v41 = &v10[v39];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v61 + 48))(&v10[v39], 1, v62))
      {
        v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
        memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
        v43 = (void (*)(char *, char *, uint64_t))v60;
      }
      else
      {
        v44 = v41;
        v43 = (void (*)(char *, char *, uint64_t))v60;
        ((void (*)(char *, char *, uint64_t))v60)(v40, v44, v62);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v61 + 56))(v40, 0, 1, v62);
      }
      ((void (*)(char *, char *, uint64_t))v60)(&v9[v63[11]], &v10[v63[11]], v62);
      v43(&v9[v63[12]], &v10[v63[12]], v62);
      *(_QWORD *)&v9[v63[13]] = *(_QWORD *)&v10[v63[13]];
      v45 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v64 + 56);
      swift_bridgeObjectRetain();
      v45(v9, 0, 2, v65);
    }
    v46 = a3[7];
    v47 = (char *)v4 + v46;
    v48 = (uint64_t)a2 + v46;
    v49 = sub_23C34DA34();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 16))(v47, v48, v49);
    v50 = a3[8];
    v51 = a3[9];
    v52 = (_QWORD *)((char *)v4 + v50);
    v53 = (uint64_t *)((char *)a2 + v50);
    v54 = v53[1];
    *v52 = *v53;
    v52[1] = v54;
    *((_BYTE *)v4 + v51) = *((_BYTE *)a2 + v51);
    *((_BYTE *)v4 + a3[10]) = *((_BYTE *)a2 + a3[10]);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for ProgramDetailState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a1 + *(int *)(a2 + 24);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 2, v5))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
    if (swift_getEnumCaseMultiPayload() == 1)
      v6 = (uint64_t *)&unk_256B5A3E8;
    else
      v6 = (uint64_t *)&unk_256B5A3E0;
    v7 = __swift_instantiateConcreteTypeFromMangledName(v6);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v4, v7);
    v8 = (int *)type metadata accessor for WorkoutProgram();
    v9 = v4 + v8[5];
    v10 = sub_23C34D86C();
    v11 = *(_QWORD *)(v10 - 8);
    v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v12(v9, v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v13 = v4 + v8[8];
    v14 = type metadata accessor for WorkoutProgramPreview();
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 48))(v13, 1, v14))
    {
      swift_bridgeObjectRelease();
      v15 = v13 + *(int *)(v14 + 20);
      v16 = sub_23C34D950();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
    }
    v17 = v4 + v8[9];
    v18 = sub_23C34D950();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v17, v18);
    v19 = v4 + v8[10];
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v19, 1, v10))
      v12(v19, v10);
    v12(v4 + v8[11], v10);
    v12(v4 + v8[12], v10);
    swift_bridgeObjectRelease();
  }
  v20 = a1 + *(int *)(a2 + 28);
  v21 = sub_23C34DA34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(v20, v21);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ProgramDetailState(uint64_t a1, uint64_t a2, int *a3)
{
  int *v3;
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t State;
  uint64_t *v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  unsigned int (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  void (*v42)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  char *v53;
  char *v54;
  uint64_t v55;
  char *__dst;
  uint64_t v57;
  void (*v58)(char *, char *);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int *v62;

  v3 = a3;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(_BYTE *)(a1 + 34) = *(_BYTE *)(a2 + 34);
  v7 = a3[6];
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 2, v10))
  {
    State = type metadata accessor for ProgramDetailLoadState();
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(State - 8) + 64));
  }
  else
  {
    v60 = v11;
    v61 = v10;
    v62 = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
    if (swift_getEnumCaseMultiPayload() == 1)
      v13 = (uint64_t *)&unk_256B5A3E8;
    else
      v13 = (uint64_t *)&unk_256B5A3E0;
    v14 = __swift_instantiateConcreteTypeFromMangledName(v13);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v8, v9, v14);
    swift_storeEnumTagMultiPayload();
    v15 = (int *)type metadata accessor for WorkoutProgram();
    v16 = v15[5];
    v17 = &v8[v16];
    v18 = &v9[v16];
    v19 = sub_23C34D86C();
    v57 = *(_QWORD *)(v19 - 8);
    v58 = *(void (**)(char *, char *))(v57 + 16);
    v59 = v19;
    v58(v17, v18);
    v20 = v15[6];
    v21 = &v8[v20];
    v22 = &v9[v20];
    v23 = *((_QWORD *)v22 + 1);
    *(_QWORD *)v21 = *(_QWORD *)v22;
    *((_QWORD *)v21 + 1) = v23;
    *(_QWORD *)&v8[v15[7]] = *(_QWORD *)&v9[v15[7]];
    v24 = v15[8];
    __dst = &v8[v24];
    v25 = &v9[v24];
    v26 = type metadata accessor for WorkoutProgramPreview();
    v55 = *(_QWORD *)(v26 - 8);
    v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v55 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v27(v25, 1, v26))
    {
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
      memcpy(__dst, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      v29 = *((_QWORD *)v25 + 1);
      *(_QWORD *)__dst = *(_QWORD *)v25;
      *((_QWORD *)__dst + 1) = v29;
      v30 = *(int *)(v26 + 20);
      v53 = &v25[v30];
      v54 = &__dst[v30];
      v31 = sub_23C34D950();
      v32 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16);
      swift_bridgeObjectRetain();
      v32(v54, v53, v31);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v55 + 56))(__dst, 0, 1, v26);
    }
    v33 = v15[9];
    v34 = &v8[v33];
    v35 = &v9[v33];
    v36 = sub_23C34D950();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 16))(v34, v35, v36);
    v37 = v15[10];
    v38 = &v8[v37];
    v39 = &v9[v37];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48))(&v9[v37], 1, v59))
    {
      v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
      memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
      v41 = (void (*)(char *, char *, uint64_t))v58;
    }
    else
    {
      v41 = (void (*)(char *, char *, uint64_t))v58;
      ((void (*)(char *, char *, uint64_t))v58)(v38, v39, v59);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v57 + 56))(v38, 0, 1, v59);
    }
    ((void (*)(char *, char *, uint64_t))v58)(&v8[v15[11]], &v9[v15[11]], v59);
    v41(&v8[v15[12]], &v9[v15[12]], v59);
    *(_QWORD *)&v8[v15[13]] = *(_QWORD *)&v9[v15[13]];
    v42 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v60 + 56);
    swift_bridgeObjectRetain();
    v42(v8, 0, 2, v61);
    v3 = v62;
  }
  v43 = v3[7];
  v44 = a1 + v43;
  v45 = a2 + v43;
  v46 = sub_23C34DA34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 16))(v44, v45, v46);
  v47 = v3[8];
  v48 = v3[9];
  v49 = (_QWORD *)(a1 + v47);
  v50 = (_QWORD *)(a2 + v47);
  v51 = v50[1];
  *v49 = *v50;
  v49[1] = v51;
  *(_BYTE *)(a1 + v48) = *(_BYTE *)(a2 + v48);
  *(_BYTE *)(a1 + v3[10]) = *(_BYTE *)(a2 + v3[10]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ProgramDetailState(uint64_t a1, uint64_t a2, int *a3)
{
  int *v3;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t *v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  unsigned int (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t State;
  uint64_t *v30;
  uint64_t v31;
  int *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(char *, uint64_t, uint64_t);
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, char *, uint64_t);
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  void (*v61)(char *, char *, uint64_t);
  char *v62;
  void (*v63)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t (*v71)(void);
  int v72;
  int *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void (*v77)(char *, char *, void *);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  _QWORD *v84;
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  char *v95;
  void (*__src)(char *, char *);
  char *__srca;
  uint64_t v98;
  void (*v99)(char *, char *);
  uint64_t v100;
  int *v101;
  int *v102;
  uint64_t v103;
  char *__dst;
  void *__dsta;
  char *__dstb;
  char *v107;
  char *v108;

  v3 = a3;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_BYTE *)(a1 + 34) = *(_BYTE *)(a2 + 34);
  v6 = a3[6];
  v7 = (char *)(a1 + v6);
  v8 = (char *)(a2 + v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 2, v9);
  v13 = v11(v8, 2, v9);
  if (!v12)
  {
    if (v13)
    {
      sub_23C285184((uint64_t)v7, &qword_256B5BF38);
      goto LABEL_10;
    }
    if (a1 != a2)
    {
      sub_23C285184((uint64_t)v7, &qword_256B5A360);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
      if (swift_getEnumCaseMultiPayload() == 1)
        v30 = (uint64_t *)&unk_256B5A3E8;
      else
        v30 = (uint64_t *)&unk_256B5A3E0;
      v31 = __swift_instantiateConcreteTypeFromMangledName(v30);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16))(v7, v8, v31);
      swift_storeEnumTagMultiPayload();
    }
    v32 = (int *)type metadata accessor for WorkoutProgram();
    v33 = v32[5];
    v34 = &v7[v33];
    v35 = &v8[v33];
    v36 = sub_23C34D86C();
    v103 = *(_QWORD *)(v36 - 8);
    __dsta = (void *)v36;
    v99 = *(void (**)(char *, char *))(v103 + 24);
    v99(v34, v35);
    v37 = v32[6];
    v38 = &v7[v37];
    v39 = &v8[v37];
    *(_QWORD *)v38 = *(_QWORD *)v39;
    *((_QWORD *)v38 + 1) = *((_QWORD *)v39 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v7[v32[7]] = *(_QWORD *)&v8[v32[7]];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v101 = v32;
    v40 = v32[8];
    v41 = &v7[v40];
    v108 = v8;
    v42 = &v8[v40];
    v43 = type metadata accessor for WorkoutProgramPreview();
    v44 = *(_QWORD *)(v43 - 8);
    v45 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v44 + 48);
    v46 = v45(v41, 1, v43);
    v47 = v45(v42, 1, v43);
    if (v46)
    {
      if (!v47)
      {
        *(_QWORD *)v41 = *(_QWORD *)v42;
        *((_QWORD *)v41 + 1) = *((_QWORD *)v42 + 1);
        v48 = *(int *)(v43 + 20);
        v94 = &v42[v48];
        __srca = &v41[v48];
        v49 = sub_23C34D950();
        v50 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v49 - 8) + 16);
        swift_bridgeObjectRetain();
        v50(__srca, v94, v49);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v41, 0, 1, v43);
        goto LABEL_27;
      }
    }
    else
    {
      if (!v47)
      {
        *(_QWORD *)v41 = *(_QWORD *)v42;
        *((_QWORD *)v41 + 1) = *((_QWORD *)v42 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v86 = *(int *)(v43 + 20);
        v87 = &v41[v86];
        v88 = &v42[v86];
        v89 = sub_23C34D950();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v89 - 8) + 24))(v87, v88, v89);
LABEL_27:
        v65 = v101[9];
        v66 = &v7[v65];
        v67 = &v108[v65];
        v68 = sub_23C34D950();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v68 - 8) + 24))(v66, v67, v68);
        v69 = v101[10];
        v70 = &v108[v69];
        v71 = *(uint64_t (**)(void))(v103 + 48);
        v95 = &v7[v69];
        LODWORD(v66) = v71();
        v72 = ((uint64_t (*)(char *, uint64_t, void *))v71)(v70, 1, __dsta);
        v73 = v3;
        if ((_DWORD)v66)
        {
          if (v72)
          {
            v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
            memcpy(v95, v70, *(_QWORD *)(*(_QWORD *)(v74 - 8) + 64));
            v75 = __dsta;
          }
          else
          {
            v75 = __dsta;
            (*(void (**)(char *, char *, void *))(v103 + 16))(v95, v70, __dsta);
            (*(void (**)(char *, _QWORD, uint64_t, void *))(v103 + 56))(v95, 0, 1, __dsta);
          }
        }
        else
        {
          if (!v72)
          {
            v75 = __dsta;
            v77 = (void (*)(char *, char *, void *))v99;
            ((void (*)(char *, char *, void *))v99)(v95, v70, __dsta);
            goto LABEL_34;
          }
          v75 = __dsta;
          (*(void (**)(char *, void *))(v103 + 8))(v95, __dsta);
          v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
          memcpy(v95, v70, *(_QWORD *)(*(_QWORD *)(v76 - 8) + 64));
        }
        v77 = (void (*)(char *, char *, void *))v99;
LABEL_34:
        v77(&v7[v101[11]], &v108[v101[11]], v75);
        v77(&v7[v101[12]], &v108[v101[12]], v75);
        *(_QWORD *)&v7[v101[13]] = *(_QWORD *)&v108[v101[13]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v3 = v73;
        goto LABEL_35;
      }
      sub_23C283550((uint64_t)v41, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutProgramPreview);
    }
    v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
    memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v64 - 8) + 64));
    goto LABEL_27;
  }
  if (v13)
  {
LABEL_10:
    State = type metadata accessor for ProgramDetailLoadState();
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(State - 8) + 64));
    goto LABEL_35;
  }
  v100 = v10;
  v102 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
  if (swift_getEnumCaseMultiPayload() == 1)
    v14 = (uint64_t *)&unk_256B5A3E8;
  else
    v14 = (uint64_t *)&unk_256B5A3E0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(v14);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v7, v8, v15);
  swift_storeEnumTagMultiPayload();
  v16 = (int *)type metadata accessor for WorkoutProgram();
  v17 = v16[5];
  v18 = &v7[v17];
  v19 = &v8[v17];
  v20 = sub_23C34D86C();
  v93 = *(_QWORD *)(v20 - 8);
  __src = *(void (**)(char *, char *))(v93 + 16);
  v98 = v20;
  __src(v18, v19);
  v21 = v16[6];
  v22 = &v7[v21];
  v23 = &v8[v21];
  *(_QWORD *)v22 = *(_QWORD *)v23;
  *((_QWORD *)v22 + 1) = *((_QWORD *)v23 + 1);
  *(_QWORD *)&v7[v16[7]] = *(_QWORD *)&v8[v16[7]];
  v24 = v16[8];
  __dst = &v7[v24];
  v107 = v8;
  v25 = &v8[v24];
  v26 = type metadata accessor for WorkoutProgramPreview();
  v92 = *(_QWORD *)(v26 - 8);
  v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v92 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v27(v25, 1, v26))
  {
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
    memcpy(__dst, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
  }
  else
  {
    *(_QWORD *)__dst = *(_QWORD *)v25;
    *((_QWORD *)__dst + 1) = *((_QWORD *)v25 + 1);
    v51 = *(int *)(v26 + 20);
    v90 = &v25[v51];
    v91 = &__dst[v51];
    v52 = sub_23C34D950();
    v53 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v52 - 8) + 16);
    swift_bridgeObjectRetain();
    v53(v91, v90, v52);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v92 + 56))(__dst, 0, 1, v26);
  }
  v54 = v16[9];
  v55 = &v7[v54];
  v56 = &v107[v54];
  v57 = sub_23C34D950();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v57 - 8) + 16))(v55, v56, v57);
  v58 = v16[10];
  __dstb = &v7[v58];
  v59 = &v107[v58];
  v3 = v102;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v93 + 48))(&v107[v58], 1, v98))
  {
    v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
    memcpy(__dstb, v59, *(_QWORD *)(*(_QWORD *)(v60 - 8) + 64));
    v61 = (void (*)(char *, char *, uint64_t))__src;
  }
  else
  {
    v62 = v59;
    v61 = (void (*)(char *, char *, uint64_t))__src;
    ((void (*)(char *, char *, uint64_t))__src)(__dstb, v62, v98);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v93 + 56))(__dstb, 0, 1, v98);
  }
  ((void (*)(char *, char *, uint64_t))__src)(&v7[v16[11]], &v107[v16[11]], v98);
  v61(&v7[v16[12]], &v107[v16[12]], v98);
  *(_QWORD *)&v7[v16[13]] = *(_QWORD *)&v107[v16[13]];
  v63 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v100 + 56);
  swift_bridgeObjectRetain();
  v63(v7, 0, 2, v9);
LABEL_35:
  v78 = v3[7];
  v79 = a1 + v78;
  v80 = a2 + v78;
  v81 = sub_23C34DA34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v81 - 8) + 24))(v79, v80, v81);
  v82 = v3[8];
  v83 = (_QWORD *)(a1 + v82);
  v84 = (_QWORD *)(a2 + v82);
  *v83 = *v84;
  v83[1] = v84[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + v3[9]) = *(_BYTE *)(a2 + v3[9]);
  *(_BYTE *)(a1 + v3[10]) = *(_BYTE *)(a2 + v3[10]);
  return a1;
}

uint64_t initializeWithTake for ProgramDetailState(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t State;
  uint64_t *v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v44;
  uint64_t v45;
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  char *__dst;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(_BYTE *)(a1 + 34) = *(_BYTE *)(a2 + 34);
  v7 = a3[6];
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 2, v10))
  {
    State = type metadata accessor for ProgramDetailLoadState();
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(State - 8) + 64));
  }
  else
  {
    v47 = v11;
    v48 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
    if (swift_getEnumCaseMultiPayload() == 1)
      v13 = (uint64_t *)&unk_256B5A3E8;
    else
      v13 = (uint64_t *)&unk_256B5A3E0;
    v14 = __swift_instantiateConcreteTypeFromMangledName(v13);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v8, v9, v14);
    swift_storeEnumTagMultiPayload();
    v15 = (int *)type metadata accessor for WorkoutProgram();
    v16 = v15[5];
    v17 = &v8[v16];
    v18 = &v9[v16];
    v19 = sub_23C34D86C();
    v45 = *(_QWORD *)(v19 - 8);
    v46 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
    v46(v17, v18, v19);
    *(_OWORD *)&v8[v15[6]] = *(_OWORD *)&v9[v15[6]];
    *(_QWORD *)&v8[v15[7]] = *(_QWORD *)&v9[v15[7]];
    v20 = v15[8];
    __dst = &v8[v20];
    v21 = &v9[v20];
    v22 = type metadata accessor for WorkoutProgramPreview();
    v23 = *(_QWORD *)(v22 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
    {
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
      memcpy(__dst, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    }
    else
    {
      *(_OWORD *)__dst = *(_OWORD *)v21;
      v25 = *(int *)(v22 + 20);
      v44 = &__dst[v25];
      v26 = &v21[v25];
      v27 = sub_23C34D950();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v44, v26, v27);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(__dst, 0, 1, v22);
    }
    v28 = v15[9];
    v29 = &v8[v28];
    v30 = &v9[v28];
    v31 = sub_23C34D950();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v29, v30, v31);
    v32 = v15[10];
    v33 = &v8[v32];
    v34 = &v9[v32];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(&v9[v32], 1, v19))
    {
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
      memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
      v36 = v46;
    }
    else
    {
      v37 = v34;
      v36 = v46;
      v46(v33, v37, v19);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v45 + 56))(v33, 0, 1, v19);
    }
    v46(&v8[v15[11]], &v9[v15[11]], v19);
    v36(&v8[v15[12]], &v9[v15[12]], v19);
    *(_QWORD *)&v8[v15[13]] = *(_QWORD *)&v9[v15[13]];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v47 + 56))(v8, 0, 2, v48);
  }
  v38 = a3[7];
  v39 = a1 + v38;
  v40 = a2 + v38;
  v41 = sub_23C34DA34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 32))(v39, v40, v41);
  v42 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  *(_BYTE *)(a1 + v42) = *(_BYTE *)(a2 + v42);
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  return a1;
}

uint64_t assignWithTake for ProgramDetailState(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t *v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t State;
  uint64_t *v28;
  uint64_t v29;
  int *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t (*v44)(char *, uint64_t, uint64_t);
  int v45;
  int v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  void (*v62)(char *, char *, uint64_t);
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t (*v71)(void);
  int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(char *, char *, uint64_t);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  char *v93;
  char *v94;
  char *__dst;
  _QWORD *__dsta;
  uint64_t v97;
  void (*v98)(char *, char *);
  void (*v99)(char *, char *);
  int *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_BYTE *)(a1 + 34) = *(_BYTE *)(a2 + 34);
  v7 = a3[6];
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5BF38);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 2, v10);
  v14 = v12(v9, 2, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_23C285184((uint64_t)v8, &qword_256B5BF38);
      goto LABEL_10;
    }
    if (a1 != a2)
    {
      sub_23C285184((uint64_t)v8, &qword_256B5A360);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
      if (swift_getEnumCaseMultiPayload() == 1)
        v28 = (uint64_t *)&unk_256B5A3E8;
      else
        v28 = (uint64_t *)&unk_256B5A3E0;
      v29 = __swift_instantiateConcreteTypeFromMangledName(v28);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 32))(v8, v9, v29);
      swift_storeEnumTagMultiPayload();
    }
    v30 = (int *)type metadata accessor for WorkoutProgram();
    v31 = v30[5];
    v32 = &v8[v31];
    v33 = &v9[v31];
    v34 = sub_23C34D86C();
    v102 = *(_QWORD *)(v34 - 8);
    v104 = v34;
    v98 = *(void (**)(char *, char *))(v102 + 40);
    v98(v32, v33);
    v35 = v30[6];
    v36 = &v8[v35];
    v37 = &v9[v35];
    v39 = *(_QWORD *)v37;
    v38 = *((_QWORD *)v37 + 1);
    *(_QWORD *)v36 = v39;
    *((_QWORD *)v36 + 1) = v38;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v8[v30[7]] = *(_QWORD *)&v9[v30[7]];
    swift_bridgeObjectRelease();
    v100 = v30;
    v40 = v30[8];
    v41 = &v8[v40];
    v42 = &v9[v40];
    v43 = type metadata accessor for WorkoutProgramPreview();
    __dsta = *(_QWORD **)(v43 - 8);
    v44 = (uint64_t (*)(char *, uint64_t, uint64_t))__dsta[6];
    v45 = v44(v41, 1, v43);
    v46 = v44(v42, 1, v43);
    if (v45)
    {
      if (!v46)
      {
        *(_OWORD *)v41 = *(_OWORD *)v42;
        v47 = *(int *)(v43 + 20);
        v48 = &v41[v47];
        v49 = &v42[v47];
        v50 = sub_23C34D950();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v50 - 8) + 32))(v48, v49, v50);
        ((void (*)(char *, _QWORD, uint64_t, uint64_t))__dsta[7])(v41, 0, 1, v43);
        goto LABEL_27;
      }
    }
    else
    {
      if (!v46)
      {
        v88 = *((_QWORD *)v42 + 1);
        *(_QWORD *)v41 = *(_QWORD *)v42;
        *((_QWORD *)v41 + 1) = v88;
        swift_bridgeObjectRelease();
        v89 = *(int *)(v43 + 20);
        v90 = &v41[v89];
        v91 = &v42[v89];
        v92 = sub_23C34D950();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v92 - 8) + 40))(v90, v91, v92);
LABEL_27:
        v65 = v100[9];
        v66 = &v8[v65];
        v67 = &v9[v65];
        v68 = sub_23C34D950();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v68 - 8) + 40))(v66, v67, v68);
        v69 = v100[10];
        v70 = &v9[v69];
        v71 = *(uint64_t (**)(void))(v102 + 48);
        v94 = &v8[v69];
        LODWORD(v66) = v71();
        v72 = ((uint64_t (*)(char *, uint64_t, uint64_t))v71)(v70, 1, v104);
        if ((_DWORD)v66)
        {
          if (v72)
          {
            v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
            memcpy(v94, v70, *(_QWORD *)(*(_QWORD *)(v73 - 8) + 64));
            v74 = v104;
          }
          else
          {
            v74 = v104;
            (*(void (**)(char *, char *, uint64_t))(v102 + 32))(v94, v70, v104);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v102 + 56))(v94, 0, 1, v104);
          }
        }
        else
        {
          if (!v72)
          {
            v74 = v104;
            v76 = (void (*)(char *, char *, uint64_t))v98;
            ((void (*)(char *, char *, uint64_t))v98)(v94, v70, v104);
            goto LABEL_34;
          }
          v74 = v104;
          (*(void (**)(char *, uint64_t))(v102 + 8))(v94, v104);
          v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
          memcpy(v94, v70, *(_QWORD *)(*(_QWORD *)(v75 - 8) + 64));
        }
        v76 = (void (*)(char *, char *, uint64_t))v98;
LABEL_34:
        v76(&v8[v100[11]], &v9[v100[11]], v74);
        v76(&v8[v100[12]], &v9[v100[12]], v74);
        *(_QWORD *)&v8[v100[13]] = *(_QWORD *)&v9[v100[13]];
        swift_bridgeObjectRelease();
        goto LABEL_35;
      }
      sub_23C283550((uint64_t)v41, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutProgramPreview);
    }
    v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
    memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v64 - 8) + 64));
    goto LABEL_27;
  }
  if (v14)
  {
LABEL_10:
    State = type metadata accessor for ProgramDetailLoadState();
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(State - 8) + 64));
    goto LABEL_35;
  }
  v103 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
  if (swift_getEnumCaseMultiPayload() == 1)
    v15 = (uint64_t *)&unk_256B5A3E8;
  else
    v15 = (uint64_t *)&unk_256B5A3E0;
  v16 = __swift_instantiateConcreteTypeFromMangledName(v15);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v8, v9, v16);
  swift_storeEnumTagMultiPayload();
  v17 = (int *)type metadata accessor for WorkoutProgram();
  v18 = v17[5];
  v19 = &v8[v18];
  v20 = &v9[v18];
  v21 = sub_23C34D86C();
  v97 = *(_QWORD *)(v21 - 8);
  v99 = *(void (**)(char *, char *))(v97 + 32);
  v101 = v21;
  v99(v19, v20);
  *(_OWORD *)&v8[v17[6]] = *(_OWORD *)&v9[v17[6]];
  *(_QWORD *)&v8[v17[7]] = *(_QWORD *)&v9[v17[7]];
  v22 = v17[8];
  __dst = &v8[v22];
  v23 = &v9[v22];
  v24 = type metadata accessor for WorkoutProgramPreview();
  v25 = *(_QWORD *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
    memcpy(__dst, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)v23;
    v51 = *(int *)(v24 + 20);
    v93 = &__dst[v51];
    v52 = &v23[v51];
    v53 = sub_23C34D950();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v53 - 8) + 32))(v93, v52, v53);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(__dst, 0, 1, v24);
  }
  v54 = v17[9];
  v55 = &v8[v54];
  v56 = &v9[v54];
  v57 = sub_23C34D950();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v57 - 8) + 32))(v55, v56, v57);
  v58 = v17[10];
  v59 = &v8[v58];
  v60 = &v9[v58];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v97 + 48))(&v9[v58], 1, v101))
  {
    v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
    memcpy(v59, v60, *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64));
    v62 = (void (*)(char *, char *, uint64_t))v99;
  }
  else
  {
    v63 = v60;
    v62 = (void (*)(char *, char *, uint64_t))v99;
    ((void (*)(char *, char *, uint64_t))v99)(v59, v63, v101);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v97 + 56))(v59, 0, 1, v101);
  }
  v62(&v8[v17[11]], &v9[v17[11]], v101);
  v62(&v8[v17[12]], &v9[v17[12]], v101);
  *(_QWORD *)&v8[v17[13]] = *(_QWORD *)&v9[v17[13]];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v103 + 56))(v8, 0, 2, v10);
LABEL_35:
  v77 = a3[7];
  v78 = a1 + v77;
  v79 = a2 + v77;
  v80 = sub_23C34DA34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v80 - 8) + 40))(v78, v79, v80);
  v81 = a3[8];
  v82 = (_QWORD *)(a1 + v81);
  v83 = (uint64_t *)(a2 + v81);
  v85 = *v83;
  v84 = v83[1];
  *v82 = v85;
  v82[1] = v84;
  swift_bridgeObjectRelease();
  v86 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v86) = *(_BYTE *)(a2 + v86);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProgramDetailState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C330A28(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t State;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;

  State = type metadata accessor for ProgramDetailLoadState();
  v7 = *(_QWORD *)(State - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = State;
    v9 = a3[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = sub_23C34DA34();
  v7 = *(_QWORD *)(v10 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v10;
    v9 = a3[7];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v12 = *(_QWORD *)(a1 + a3[8] + 8);
  if (v12 >= 0xFFFFFFFF)
    LODWORD(v12) = -1;
  return (v12 + 1);
}

uint64_t storeEnumTagSinglePayload for ProgramDetailState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C330ADC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t State;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  State = type metadata accessor for ProgramDetailLoadState();
  v9 = *(_QWORD *)(State - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = State;
    v11 = a4[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
  }
  result = sub_23C34DA34();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = a4[7];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
  }
  *(_QWORD *)(a1 + a4[8] + 8) = (a2 - 1);
  return result;
}

uint64_t sub_23C330B80()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for ProgramDetailLoadState();
  if (v1 <= 0x3F)
  {
    result = sub_23C34DA34();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ProgramDetailState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C330C70 + 4 * byte_23C35D3BC[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23C330CA4 + 4 * byte_23C35D3B7[v4]))();
}

uint64_t sub_23C330CA4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C330CAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C330CB4);
  return result;
}

uint64_t sub_23C330CC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C330CC8);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_23C330CCC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C330CD4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProgramDetailState.CodingKeys()
{
  return &type metadata for ProgramDetailState.CodingKeys;
}

unint64_t sub_23C330CF4()
{
  unint64_t result;

  result = qword_256B5C5C8;
  if (!qword_256B5C5C8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35D56C, &type metadata for ProgramDetailState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C5C8);
  }
  return result;
}

unint64_t sub_23C330D3C()
{
  unint64_t result;

  result = qword_256B5C5D0;
  if (!qword_256B5C5D0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35D4DC, &type metadata for ProgramDetailState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C5D0);
  }
  return result;
}

unint64_t sub_23C330D84()
{
  unint64_t result;

  result = qword_256B5C5D8;
  if (!qword_256B5C5D8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35D504, &type metadata for ProgramDetailState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C5D8);
  }
  return result;
}

uint64_t sub_23C330DC8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x74756F79616CLL && a2 == 0xE600000000000000;
  if (v3 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x537972617262696CLL && a2 == 0xEC00000065746174 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7461745364616F6CLL && a2 == 0xE900000000000065 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C361DB0 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x800000023C361DD0 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C361DF0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v6 = sub_23C34EC64();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

BOOL static EditorialDetailLayout.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if ((MEMORY[0x24261B310]() & 1) == 0)
    return 0;
  v4 = type metadata accessor for EditorialDetailLayout();
  return *(unsigned __int8 *)(a1 + *(int *)(v4 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(v4 + 20));
}

uint64_t type metadata accessor for EditorialDetailLayout()
{
  uint64_t result;

  result = qword_256B5C668;
  if (!qword_256B5C668)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t EditorialDetailLayout.init(contentMargins:sizeClass:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t result;

  v6 = sub_23C34DC38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  result = type metadata accessor for EditorialDetailLayout();
  *(_BYTE *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t sub_23C331160(char a1)
{
  if ((a1 & 1) != 0)
    return 0x73616C43657A6973;
  else
    return 0x4D746E65746E6F63;
}

uint64_t sub_23C3311A8()
{
  char *v0;

  return sub_23C331160(*v0);
}

uint64_t sub_23C3311B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C331F8C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C3311D4()
{
  sub_23C3316B0();
  return sub_23C34ECD0();
}

uint64_t sub_23C3311FC()
{
  sub_23C3316B0();
  return sub_23C34ECDC();
}

uint64_t EditorialDetailLayout.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C5E0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C3316B0();
  sub_23C34ECC4();
  v10[15] = 0;
  sub_23C34DC38();
  sub_23C27FEE4(&qword_256B59B58, (uint64_t (*)(uint64_t))MEMORY[0x24BE34B98], MEMORY[0x24BE34BA8]);
  sub_23C34EC40();
  if (!v2)
  {
    v10[14] = *(_BYTE *)(v3 + *(int *)(type metadata accessor for EditorialDetailLayout() + 20));
    v10[13] = 1;
    sub_23C3316F4();
    sub_23C34EC40();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t EditorialDetailLayout.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;

  v20 = a2;
  v24 = sub_23C34DC38();
  v21 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v22 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C5F8);
  v5 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for EditorialDetailLayout();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C3316B0();
  sub_23C34ECB8();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v18 = a1;
  v19 = v5;
  v11 = (uint64_t)v10;
  v12 = v21;
  v27 = 0;
  sub_23C27FEE4(&qword_256B59B70, (uint64_t (*)(uint64_t))MEMORY[0x24BE34B98], MEMORY[0x24BE34BB8]);
  v14 = v22;
  v13 = v23;
  v15 = v24;
  sub_23C34EBB0();
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v11, v14, v15);
  v25 = 1;
  sub_23C331738();
  sub_23C34EBB0();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v13);
  *(_BYTE *)(v11 + *(int *)(v8 + 20)) = v26;
  sub_23C33177C(v11, v20);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  return sub_23C3317C0(v11);
}

uint64_t sub_23C331614@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return EditorialDetailLayout.init(from:)(a1, a2);
}

uint64_t sub_23C331628(_QWORD *a1)
{
  return EditorialDetailLayout.encode(to:)(a1);
}

uint64_t EditorialDetailLayout.hash(into:)()
{
  sub_23C34DC38();
  sub_23C27FEE4(&qword_256B5A528, (uint64_t (*)(uint64_t))MEMORY[0x24BE34B98], MEMORY[0x24BE34BB0]);
  sub_23C34E838();
  type metadata accessor for EditorialDetailLayout();
  return sub_23C34EC88();
}

unint64_t sub_23C3316B0()
{
  unint64_t result;

  result = qword_256B5C5E8;
  if (!qword_256B5C5E8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35D7B4, &type metadata for EditorialDetailLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C5E8);
  }
  return result;
}

unint64_t sub_23C3316F4()
{
  unint64_t result;

  result = qword_256B5C5F0;
  if (!qword_256B5C5F0)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for EditorialDetailSizeClass, &type metadata for EditorialDetailSizeClass);
    atomic_store(result, (unint64_t *)&qword_256B5C5F0);
  }
  return result;
}

unint64_t sub_23C331738()
{
  unint64_t result;

  result = qword_256B5C600;
  if (!qword_256B5C600)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for EditorialDetailSizeClass, &type metadata for EditorialDetailSizeClass);
    atomic_store(result, (unint64_t *)&qword_256B5C600);
  }
  return result;
}

uint64_t sub_23C33177C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EditorialDetailLayout();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C3317C0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for EditorialDetailLayout();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t EditorialDetailLayout.hashValue.getter()
{
  sub_23C34EC7C();
  sub_23C34DC38();
  sub_23C27FEE4(&qword_256B5A528, (uint64_t (*)(uint64_t))MEMORY[0x24BE34B98], MEMORY[0x24BE34BB0]);
  sub_23C34E838();
  type metadata accessor for EditorialDetailLayout();
  sub_23C34EC88();
  return sub_23C34ECAC();
}

uint64_t sub_23C331880()
{
  sub_23C34EC7C();
  sub_23C34DC38();
  sub_23C27FEE4(&qword_256B5A528, (uint64_t (*)(uint64_t))MEMORY[0x24BE34B98], MEMORY[0x24BE34BB0]);
  sub_23C34E838();
  sub_23C34EC88();
  return sub_23C34ECAC();
}

uint64_t sub_23C331908()
{
  sub_23C34DC38();
  sub_23C27FEE4(&qword_256B5A528, (uint64_t (*)(uint64_t))MEMORY[0x24BE34B98], MEMORY[0x24BE34BB0]);
  sub_23C34E838();
  return sub_23C34EC88();
}

uint64_t sub_23C331978()
{
  sub_23C34EC7C();
  sub_23C34DC38();
  sub_23C27FEE4(&qword_256B5A528, (uint64_t (*)(uint64_t))MEMORY[0x24BE34B98], MEMORY[0x24BE34BB0]);
  sub_23C34E838();
  sub_23C34EC88();
  return sub_23C34ECAC();
}

BOOL sub_23C3319FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (MEMORY[0x24261B310]() & 1) != 0
      && *(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(a3 + 20));
}

uint64_t sub_23C331A4C()
{
  return sub_23C27FEE4(&qword_256B5C608, (uint64_t (*)(uint64_t))type metadata accessor for EditorialDetailLayout, (uint64_t)&protocol conformance descriptor for EditorialDetailLayout);
}

_QWORD *initializeBufferWithCopyOfBuffer for EditorialDetailLayout(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23C34DC38();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t initializeWithCopy for EditorialDetailLayout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23C34DC38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for EditorialDetailLayout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23C34DC38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for EditorialDetailLayout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23C34DC38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for EditorialDetailLayout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23C34DC38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for EditorialDetailLayout()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C331C7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = sub_23C34DC38();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 6)
    return v9 - 5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for EditorialDetailLayout()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C331D00(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23C34DC38();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 5;
  return result;
}

uint64_t sub_23C331D78()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23C34DC38();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for EditorialDetailLayout.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C331E34 + 4 * byte_23C35D5F5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C331E68 + 4 * byte_23C35D5F0[v4]))();
}

uint64_t sub_23C331E68(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C331E70(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C331E78);
  return result;
}

uint64_t sub_23C331E84(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C331E8CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C331E90(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C331E98(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EditorialDetailLayout.CodingKeys()
{
  return &type metadata for EditorialDetailLayout.CodingKeys;
}

unint64_t sub_23C331EB8()
{
  unint64_t result;

  result = qword_256B5C6A0;
  if (!qword_256B5C6A0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35D78C, &type metadata for EditorialDetailLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C6A0);
  }
  return result;
}

unint64_t sub_23C331F00()
{
  unint64_t result;

  result = qword_256B5C6A8;
  if (!qword_256B5C6A8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35D6FC, &type metadata for EditorialDetailLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C6A8);
  }
  return result;
}

unint64_t sub_23C331F48()
{
  unint64_t result;

  result = qword_256B5C6B0;
  if (!qword_256B5C6B0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35D724, &type metadata for EditorialDetailLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C6B0);
  }
  return result;
}

uint64_t sub_23C331F8C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x4D746E65746E6F63 && a2 == 0xEE00736E69677261;
  if (v3 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73616C43657A6973 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C34EC64();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C332094(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C3320D0 + 4 * byte_23C35D810[a1]))(0xD00000000000001DLL, 0x800000023C361E10);
}

uint64_t sub_23C3320D0()
{
  return 0x4164694477656976;
}

uint64_t sub_23C3320F4()
{
  uint64_t v0;

  return v0 + 1;
}

uint64_t sub_23C332188()
{
  return 0x707061546B6E696CLL;
}

uint64_t sub_23C3321B0()
{
  sub_23C3331F4();
  return sub_23C34ECD0();
}

uint64_t sub_23C3321D8()
{
  sub_23C3331F4();
  return sub_23C34ECDC();
}

uint64_t sub_23C332200()
{
  unsigned __int8 *v0;

  return sub_23C332094(*v0);
}

uint64_t sub_23C332208@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C336024(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C33222C(_BYTE *a1@<X8>)
{
  *a1 = 11;
}

uint64_t sub_23C332238()
{
  sub_23C332FD4();
  return sub_23C34ECD0();
}

uint64_t sub_23C332260()
{
  sub_23C332FD4();
  return sub_23C34ECDC();
}

uint64_t sub_23C332288()
{
  sub_23C333304();
  return sub_23C34ECD0();
}

uint64_t sub_23C3322B0()
{
  sub_23C333304();
  return sub_23C34ECDC();
}

uint64_t sub_23C3322D8()
{
  sub_23C33327C();
  return sub_23C34ECD0();
}

uint64_t sub_23C332300()
{
  sub_23C33327C();
  return sub_23C34ECDC();
}

uint64_t sub_23C33232C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C336464(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C332354()
{
  sub_23C33305C();
  return sub_23C34ECD0();
}

uint64_t sub_23C33237C()
{
  sub_23C33305C();
  return sub_23C34ECDC();
}

uint64_t sub_23C3323A4()
{
  sub_23C333238();
  return sub_23C34ECD0();
}

uint64_t sub_23C3323CC()
{
  sub_23C333238();
  return sub_23C34ECDC();
}

uint64_t sub_23C3323F4()
{
  sub_23C3330E4();
  return sub_23C34ECD0();
}

uint64_t sub_23C33241C()
{
  sub_23C3330E4();
  return sub_23C34ECDC();
}

uint64_t sub_23C332444()
{
  sub_23C3330A0();
  return sub_23C34ECD0();
}

uint64_t sub_23C33246C()
{
  sub_23C3330A0();
  return sub_23C34ECDC();
}

uint64_t sub_23C332494()
{
  sub_23C33316C();
  return sub_23C34ECD0();
}

uint64_t sub_23C3324BC()
{
  sub_23C33316C();
  return sub_23C34ECDC();
}

uint64_t sub_23C3324E4()
{
  sub_23C3331B0();
  return sub_23C34ECD0();
}

uint64_t sub_23C33250C()
{
  sub_23C3331B0();
  return sub_23C34ECDC();
}

uint64_t sub_23C332534()
{
  sub_23C3332C0();
  return sub_23C34ECD0();
}

uint64_t sub_23C33255C()
{
  sub_23C3332C0();
  return sub_23C34ECDC();
}

uint64_t sub_23C332584()
{
  sub_23C333128();
  return sub_23C34ECD0();
}

uint64_t sub_23C3325AC()
{
  sub_23C333128();
  return sub_23C34ECDC();
}

void ProgramDetailAction.encode(to:)(_QWORD *a1)
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
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  _QWORD v25[2];
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C6B8);
  v57 = *(_QWORD *)(v2 - 8);
  v58 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v55 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = sub_23C34D950();
  v54 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v53 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C6C0);
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v50 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C6C8);
  v48 = *(_QWORD *)(v7 - 8);
  v49 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v47 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C6D0);
  v45 = *(_QWORD *)(v9 - 8);
  v46 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v44 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C6D8);
  v42 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v41 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C6E0);
  v39 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v37 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C6E8);
  v33 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v32 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C6F0);
  v36 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v34 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = type metadata accessor for WorkoutProgram();
  MEMORY[0x24BDAC7A8](v30);
  v31 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C6F8);
  v28 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v27 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C700);
  v25[1] = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v25[0] = (char *)v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C708);
  MEMORY[0x24BDAC7A8](v18);
  v19 = type metadata accessor for ProgramDetailAction();
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)v25 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C710);
  v59 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v23 = (char *)v25 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C332FD4();
  v60 = v23;
  sub_23C34ECC4();
  sub_23C333018(v62, (uint64_t)v21);
  v24 = (char *)sub_23C332A84 + 4 * word_23C35D81C[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23C332A84()
{
  char *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *v0;
  *(_BYTE *)(v1 - 89) = 2;
  sub_23C33327C();
  v3 = *(_QWORD *)(v1 - 392);
  v5 = *(_QWORD *)(v1 - 128);
  v4 = *(_QWORD *)(v1 - 120);
  sub_23C34EBD4();
  *(_BYTE *)(v1 - 90) = v2;
  sub_23C2F4650();
  v6 = *(_QWORD *)(v1 - 376);
  sub_23C34EC40();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 384) + 8))(v3, v6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 136) + 8))(v5, v4);
}

uint64_t type metadata accessor for ProgramDetailAction()
{
  uint64_t result;

  result = qword_256B5C848;
  if (!qword_256B5C848)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23C332FD4()
{
  unint64_t result;

  result = qword_256B5C718;
  if (!qword_256B5C718)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E3F0, &type metadata for ProgramDetailAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C718);
  }
  return result;
}

uint64_t sub_23C333018(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ProgramDetailAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23C33305C()
{
  unint64_t result;

  result = qword_256B5C720;
  if (!qword_256B5C720)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E3A0, &type metadata for ProgramDetailAction.LinkTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C720);
  }
  return result;
}

unint64_t sub_23C3330A0()
{
  unint64_t result;

  result = qword_256B5C728;
  if (!qword_256B5C728)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E350, &type metadata for ProgramDetailAction.NavigateToWorkoutDetailCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C728);
  }
  return result;
}

unint64_t sub_23C3330E4()
{
  unint64_t result;

  result = qword_256B5C730;
  if (!qword_256B5C730)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E300, &type metadata for ProgramDetailAction.MoreTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C730);
  }
  return result;
}

unint64_t sub_23C333128()
{
  unint64_t result;

  result = qword_256B5C738;
  if (!qword_256B5C738)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E2B0, &type metadata for ProgramDetailAction.WatchFilmTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C738);
  }
  return result;
}

unint64_t sub_23C33316C()
{
  unint64_t result;

  result = qword_256B5C740;
  if (!qword_256B5C740)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E260, &type metadata for ProgramDetailAction.RemoveFromLibraryConfirmationTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C740);
  }
  return result;
}

unint64_t sub_23C3331B0()
{
  unint64_t result;

  result = qword_256B5C748;
  if (!qword_256B5C748)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E210, &type metadata for ProgramDetailAction.ShareProgramTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C748);
  }
  return result;
}

unint64_t sub_23C3331F4()
{
  unint64_t result;

  result = qword_256B5C750;
  if (!qword_256B5C750)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E1C0, &type metadata for ProgramDetailAction.AddToLibraryTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C750);
  }
  return result;
}

unint64_t sub_23C333238()
{
  unint64_t result;

  result = qword_256B5C758;
  if (!qword_256B5C758)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E170, &type metadata for ProgramDetailAction.LoadedProgramDetailCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C758);
  }
  return result;
}

unint64_t sub_23C33327C()
{
  unint64_t result;

  result = qword_256B5C760;
  if (!qword_256B5C760)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E120, &type metadata for ProgramDetailAction.LibraryStateUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C760);
  }
  return result;
}

unint64_t sub_23C3332C0()
{
  unint64_t result;

  result = qword_256B5C768;
  if (!qword_256B5C768)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E0D0, &type metadata for ProgramDetailAction.ViewDidAppearCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C768);
  }
  return result;
}

unint64_t sub_23C333304()
{
  unint64_t result;

  result = qword_256B5C770;
  if (!qword_256B5C770)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E080, &type metadata for ProgramDetailAction.DismissRemoveFromLibraryAlertCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C770);
  }
  return result;
}

uint64_t ProgramDetailAction.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  _QWORD v39[7];
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
  char *v60;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  uint64_t v78;

  v68 = a2;
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C778);
  v59 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v74 = (char *)v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C780);
  v58 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v73 = (char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C788);
  v53 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v67 = (char *)v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C790);
  v51 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v66 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C798);
  v49 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v65 = (char *)v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C7A0);
  v46 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v64 = (char *)v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C7A8);
  v44 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v63 = (char *)v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C7B0);
  v57 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v71 = (char *)v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C7B8);
  v42 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v62 = (char *)v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C7C0);
  v41 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v61 = (char *)v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C7C8);
  v39[6] = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  v60 = (char *)v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C7D0);
  v69 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v15 = (char *)v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = type metadata accessor for ProgramDetailAction();
  MEMORY[0x24BDAC7A8](v75);
  v17 = (char *)v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v39 - v19;
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)v39 - v22;
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)v39 - v25;
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)v39 - v28;
  v30 = a1[3];
  v77 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v30);
  sub_23C332FD4();
  v72 = v15;
  v31 = v78;
  sub_23C34ECB8();
  if (!v31)
  {
    v39[1] = v26;
    v39[2] = v20;
    v39[3] = v23;
    v39[4] = v17;
    v78 = 0;
    v39[5] = v29;
    v32 = v72;
    v33 = sub_23C34EBBC();
    if (*(_QWORD *)(v33 + 16) == 1)
      __asm { BR              X10 }
    v34 = sub_23C34EAC0();
    swift_allocError();
    v36 = v35;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B576B0);
    v37 = v76;
    *v36 = v75;
    sub_23C34EB44();
    sub_23C34EAB4();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v34 - 8) + 104))(v36, *MEMORY[0x24BEE26D0], v34);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v32, v37);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v77);
}

uint64_t sub_23C334220@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ProgramDetailAction.init(from:)(a1, a2);
}

void sub_23C334234(_QWORD *a1)
{
  ProgramDetailAction.encode(to:)(a1);
}

char *initializeBufferWithCopyOfBuffer for ProgramDetailAction(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unsigned int (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, char *);

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v25 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v25 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 3:
        v27 = sub_23C34D950();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(a1, a2, v27);
        swift_storeEnumTagMultiPayload();
        break;
      case 2:
        v28 = *((_QWORD *)a2 + 1);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *((_QWORD *)a1 + 1) = v28;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 1:
        __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
        if (swift_getEnumCaseMultiPayload() == 1)
          v8 = (uint64_t *)&unk_256B5A3E8;
        else
          v8 = (uint64_t *)&unk_256B5A3E0;
        v9 = __swift_instantiateConcreteTypeFromMangledName(v8);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
        swift_storeEnumTagMultiPayload();
        v10 = (int *)type metadata accessor for WorkoutProgram();
        v11 = v10[5];
        v12 = &a1[v11];
        v13 = &a2[v11];
        v14 = sub_23C34D86C();
        v46 = *(_QWORD *)(v14 - 8);
        v47 = v14;
        v48 = *(void (**)(char *, char *))(v46 + 16);
        v48(v12, v13);
        v15 = v10[6];
        v16 = &a1[v15];
        v17 = &a2[v15];
        v18 = *((_QWORD *)v17 + 1);
        *(_QWORD *)v16 = *(_QWORD *)v17;
        *((_QWORD *)v16 + 1) = v18;
        *(_QWORD *)&a1[v10[7]] = *(_QWORD *)&a2[v10[7]];
        v19 = v10[8];
        v20 = &a1[v19];
        v21 = &a2[v19];
        v22 = type metadata accessor for WorkoutProgramPreview();
        v45 = *(_QWORD *)(v22 - 8);
        v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v23(v21, 1, v22))
        {
          v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
          memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
        }
        else
        {
          v29 = *((_QWORD *)v21 + 1);
          *(_QWORD *)v20 = *(_QWORD *)v21;
          *((_QWORD *)v20 + 1) = v29;
          v30 = *(int *)(v22 + 20);
          v31 = &v20[v30];
          v44 = &v21[v30];
          v32 = sub_23C34D950();
          v33 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 16);
          swift_bridgeObjectRetain();
          v33(v31, v44, v32);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v45 + 56))(v20, 0, 1, v22);
        }
        v34 = v10[9];
        v35 = &a1[v34];
        v36 = &a2[v34];
        v37 = sub_23C34D950();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v37 - 8) + 16))(v35, v36, v37);
        v38 = v10[10];
        v39 = &a1[v38];
        v40 = &a2[v38];
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(&a2[v38], 1, v47))
        {
          v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
          memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
          v42 = (void (*)(char *, char *, uint64_t))v48;
        }
        else
        {
          v43 = v40;
          v42 = (void (*)(char *, char *, uint64_t))v48;
          ((void (*)(char *, char *, uint64_t))v48)(v39, v43, v47);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v46 + 56))(v39, 0, 1, v47);
        }
        ((void (*)(char *, char *, uint64_t))v48)(&a1[v10[11]], &a2[v10[11]], v47);
        v42(&a1[v10[12]], &a2[v10[12]], v47);
        *(_QWORD *)&a1[v10[13]] = *(_QWORD *)&a2[v10[13]];
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

uint64_t destroy for ProgramDetailAction(uint64_t a1)
{
  uint64_t result;
  uint64_t *v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 3)
  {
    v17 = sub_23C34D950();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(a1, v17);
  }
  else
  {
    if ((_DWORD)result != 2)
    {
      if ((_DWORD)result != 1)
        return result;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
      if (swift_getEnumCaseMultiPayload() == 1)
        v3 = (uint64_t *)&unk_256B5A3E8;
      else
        v3 = (uint64_t *)&unk_256B5A3E0;
      v4 = __swift_instantiateConcreteTypeFromMangledName(v3);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
      v5 = (int *)type metadata accessor for WorkoutProgram();
      v6 = a1 + v5[5];
      v7 = sub_23C34D86C();
      v8 = *(_QWORD *)(v7 - 8);
      v9 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
      v9(v6, v7);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v10 = a1 + v5[8];
      v11 = type metadata accessor for WorkoutProgramPreview();
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v10, 1, v11))
      {
        swift_bridgeObjectRelease();
        v12 = v10 + *(int *)(v11 + 20);
        v13 = sub_23C34D950();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
      }
      v14 = a1 + v5[9];
      v15 = sub_23C34D950();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
      v16 = a1 + v5[10];
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v16, 1, v7))
        v9(v16, v7);
      v9(a1 + v5[11], v7);
      v9(a1 + v5[12], v7);
    }
    return swift_bridgeObjectRelease();
  }
}

char *initializeWithCopy for ProgramDetailAction(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t *v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  char *v40;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, char *);

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v24 = sub_23C34D950();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(a1, a2, v24);
LABEL_17:
      swift_storeEnumTagMultiPayload();
      return a1;
    case 2:
      v25 = *((_QWORD *)a2 + 1);
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *((_QWORD *)a1 + 1) = v25;
      swift_bridgeObjectRetain();
      goto LABEL_17;
    case 1:
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
      if (swift_getEnumCaseMultiPayload() == 1)
        v7 = (uint64_t *)&unk_256B5A3E8;
      else
        v7 = (uint64_t *)&unk_256B5A3E0;
      v8 = __swift_instantiateConcreteTypeFromMangledName(v7);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
      v9 = (int *)type metadata accessor for WorkoutProgram();
      v10 = v9[5];
      v11 = &a1[v10];
      v12 = &a2[v10];
      v13 = sub_23C34D86C();
      v44 = *(_QWORD *)(v13 - 8);
      v45 = v13;
      v46 = *(void (**)(char *, char *))(v44 + 16);
      v46(v11, v12);
      v14 = v9[6];
      v15 = &a1[v14];
      v16 = &a2[v14];
      v17 = *((_QWORD *)v16 + 1);
      *(_QWORD *)v15 = *(_QWORD *)v16;
      *((_QWORD *)v15 + 1) = v17;
      *(_QWORD *)&a1[v9[7]] = *(_QWORD *)&a2[v9[7]];
      v18 = v9[8];
      v19 = &a1[v18];
      v20 = &a2[v18];
      v21 = type metadata accessor for WorkoutProgramPreview();
      v43 = *(_QWORD *)(v21 - 8);
      v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v22(v20, 1, v21))
      {
        v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
        memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
      }
      else
      {
        v26 = *((_QWORD *)v20 + 1);
        *(_QWORD *)v19 = *(_QWORD *)v20;
        *((_QWORD *)v19 + 1) = v26;
        v27 = *(int *)(v21 + 20);
        v28 = &v19[v27];
        v42 = &v20[v27];
        v29 = sub_23C34D950();
        v30 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16);
        swift_bridgeObjectRetain();
        v30(v28, v42, v29);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v19, 0, 1, v21);
      }
      v31 = v9[9];
      v32 = &a1[v31];
      v33 = &a2[v31];
      v34 = sub_23C34D950();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v32, v33, v34);
      v35 = v9[10];
      v36 = &a1[v35];
      v37 = &a2[v35];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(&a2[v35], 1, v45))
      {
        v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
        memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
        v39 = (void (*)(char *, char *, uint64_t))v46;
      }
      else
      {
        v40 = v37;
        v39 = (void (*)(char *, char *, uint64_t))v46;
        ((void (*)(char *, char *, uint64_t))v46)(v36, v40, v45);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v36, 0, 1, v45);
      }
      ((void (*)(char *, char *, uint64_t))v46)(&a1[v9[11]], &a2[v9[11]], v45);
      v39(&a1[v9[12]], &a2[v9[12]], v45);
      *(_QWORD *)&a1[v9[13]] = *(_QWORD *)&a2[v9[13]];
      swift_bridgeObjectRetain();
      goto LABEL_17;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

char *assignWithCopy for ProgramDetailAction(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t *v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  char *v38;
  char *v39;
  char *__dst;
  uint64_t v41;
  void (*v42)(char *, char *);
  uint64_t v43;

  if (a1 == a2)
    return a1;
  sub_23C283550((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailAction);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v23 = sub_23C34D950();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(a1, a2, v23);
LABEL_18:
      swift_storeEnumTagMultiPayload();
      return a1;
    case 2:
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
      swift_bridgeObjectRetain();
      goto LABEL_18;
    case 1:
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
      if (swift_getEnumCaseMultiPayload() == 1)
        v7 = (uint64_t *)&unk_256B5A3E8;
      else
        v7 = (uint64_t *)&unk_256B5A3E0;
      v8 = __swift_instantiateConcreteTypeFromMangledName(v7);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
      v9 = (int *)type metadata accessor for WorkoutProgram();
      v10 = v9[5];
      v11 = &a1[v10];
      v12 = &a2[v10];
      v13 = sub_23C34D86C();
      v41 = *(_QWORD *)(v13 - 8);
      v42 = *(void (**)(char *, char *))(v41 + 16);
      v43 = v13;
      v42(v11, v12);
      v14 = v9[6];
      v15 = &a1[v14];
      v16 = &a2[v14];
      *(_QWORD *)v15 = *(_QWORD *)v16;
      *((_QWORD *)v15 + 1) = *((_QWORD *)v16 + 1);
      *(_QWORD *)&a1[v9[7]] = *(_QWORD *)&a2[v9[7]];
      v17 = v9[8];
      __dst = &a1[v17];
      v18 = &a2[v17];
      v19 = type metadata accessor for WorkoutProgramPreview();
      v20 = *(_QWORD *)(v19 - 8);
      v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v21(v18, 1, v19))
      {
        v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
        memcpy(__dst, v18, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
      }
      else
      {
        *(_QWORD *)__dst = *(_QWORD *)v18;
        *((_QWORD *)__dst + 1) = *((_QWORD *)v18 + 1);
        v24 = *(int *)(v19 + 20);
        v38 = &v18[v24];
        v39 = &__dst[v24];
        v25 = sub_23C34D950();
        v26 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16);
        swift_bridgeObjectRetain();
        v26(v39, v38, v25);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(__dst, 0, 1, v19);
      }
      v27 = v9[9];
      v28 = &a1[v27];
      v29 = &a2[v27];
      v30 = sub_23C34D950();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v28, v29, v30);
      v31 = v9[10];
      v32 = &a1[v31];
      v33 = &a2[v31];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(&a2[v31], 1, v43))
      {
        v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
        memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
        v35 = (void (*)(char *, char *, uint64_t))v42;
      }
      else
      {
        v36 = v33;
        v35 = (void (*)(char *, char *, uint64_t))v42;
        ((void (*)(char *, char *, uint64_t))v42)(v32, v36, v43);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v32, 0, 1, v43);
      }
      ((void (*)(char *, char *, uint64_t))v42)(&a1[v9[11]], &a2[v9[11]], v43);
      v35(&a1[v9[12]], &a2[v9[12]], v43);
      *(_QWORD *)&a1[v9[13]] = *(_QWORD *)&a2[v9[13]];
      swift_bridgeObjectRetain();
      goto LABEL_18;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

char *initializeWithTake for ProgramDetailAction(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t *v7;
  uint64_t v8;
  int *v9;
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
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v34;
  uint64_t v35;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    v21 = sub_23C34D950();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(a1, a2, v21);
LABEL_15:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (EnumCaseMultiPayload == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
    if (swift_getEnumCaseMultiPayload() == 1)
      v7 = (uint64_t *)&unk_256B5A3E8;
    else
      v7 = (uint64_t *)&unk_256B5A3E0;
    v8 = __swift_instantiateConcreteTypeFromMangledName(v7);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
    v9 = (int *)type metadata accessor for WorkoutProgram();
    v10 = v9[5];
    v11 = &a1[v10];
    v12 = &a2[v10];
    v13 = sub_23C34D86C();
    v35 = *(_QWORD *)(v13 - 8);
    v14 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
    v14(v11, v12, v13);
    *(_OWORD *)&a1[v9[6]] = *(_OWORD *)&a2[v9[6]];
    *(_QWORD *)&a1[v9[7]] = *(_QWORD *)&a2[v9[7]];
    v15 = v9[8];
    v16 = &a1[v15];
    v17 = &a2[v15];
    v18 = type metadata accessor for WorkoutProgramPreview();
    v19 = *(_QWORD *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      *(_OWORD *)v16 = *(_OWORD *)v17;
      v22 = *(int *)(v18 + 20);
      v34 = &v16[v22];
      v23 = &v17[v22];
      v24 = sub_23C34D950();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v34, v23, v24);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
    v25 = v9[9];
    v26 = &a1[v25];
    v27 = &a2[v25];
    v28 = sub_23C34D950();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v26, v27, v28);
    v29 = v9[10];
    v30 = &a1[v29];
    v31 = &a2[v29];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(&a2[v29], 1, v13))
    {
      v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
      memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    }
    else
    {
      v14(v30, v31, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v30, 0, 1, v13);
    }
    v14(&a1[v9[11]], &a2[v9[11]], v13);
    v14(&a1[v9[12]], &a2[v9[12]], v13);
    *(_QWORD *)&a1[v9[13]] = *(_QWORD *)&a2[v9[13]];
    goto LABEL_15;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

char *assignWithTake for ProgramDetailAction(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t *v7;
  uint64_t v8;
  int *v9;
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
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v34;
  uint64_t v35;

  if (a1 != a2)
  {
    sub_23C283550((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailAction);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      v21 = sub_23C34D950();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(a1, a2, v21);
LABEL_16:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (EnumCaseMultiPayload == 1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
      if (swift_getEnumCaseMultiPayload() == 1)
        v7 = (uint64_t *)&unk_256B5A3E8;
      else
        v7 = (uint64_t *)&unk_256B5A3E0;
      v8 = __swift_instantiateConcreteTypeFromMangledName(v7);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
      v9 = (int *)type metadata accessor for WorkoutProgram();
      v10 = v9[5];
      v11 = &a1[v10];
      v12 = &a2[v10];
      v13 = sub_23C34D86C();
      v35 = *(_QWORD *)(v13 - 8);
      v14 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
      v14(v11, v12, v13);
      *(_OWORD *)&a1[v9[6]] = *(_OWORD *)&a2[v9[6]];
      *(_QWORD *)&a1[v9[7]] = *(_QWORD *)&a2[v9[7]];
      v15 = v9[8];
      v16 = &a1[v15];
      v17 = &a2[v15];
      v18 = type metadata accessor for WorkoutProgramPreview();
      v19 = *(_QWORD *)(v18 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
      {
        v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
        memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
      }
      else
      {
        *(_OWORD *)v16 = *(_OWORD *)v17;
        v22 = *(int *)(v18 + 20);
        v34 = &v16[v22];
        v23 = &v17[v22];
        v24 = sub_23C34D950();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v34, v23, v24);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      }
      v25 = v9[9];
      v26 = &a1[v25];
      v27 = &a2[v25];
      v28 = sub_23C34D950();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v26, v27, v28);
      v29 = v9[10];
      v30 = &a1[v29];
      v31 = &a2[v29];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(&a2[v29], 1, v13))
      {
        v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
        memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
      }
      else
      {
        v14(v30, v31, v13);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v30, 0, 1, v13);
      }
      v14(&a1[v9[11]], &a2[v9[11]], v13);
      v14(&a1[v9[12]], &a2[v9[12]], v13);
      *(_QWORD *)&a1[v9[13]] = *(_QWORD *)&a2[v9[13]];
      goto LABEL_16;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_23C3354CC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for WorkoutProgram();
  if (v1 <= 0x3F)
  {
    result = sub_23C34D950();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ProgramDetailAction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ProgramDetailAction.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C33563C + 4 * byte_23C35D84D[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_23C335670 + 4 * byte_23C35D848[v4]))();
}

uint64_t sub_23C335670(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C335678(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C335680);
  return result;
}

uint64_t sub_23C33568C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C335694);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_23C335698(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C3356A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.CodingKeys()
{
  return &type metadata for ProgramDetailAction.CodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.DismissRemoveFromLibraryAlertCodingKeys()
{
  return &type metadata for ProgramDetailAction.DismissRemoveFromLibraryAlertCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.ViewDidAppearCodingKeys()
{
  return &type metadata for ProgramDetailAction.ViewDidAppearCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.LibraryStateUpdatedCodingKeys()
{
  return &type metadata for ProgramDetailAction.LibraryStateUpdatedCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.LoadedProgramDetailCodingKeys()
{
  return &type metadata for ProgramDetailAction.LoadedProgramDetailCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.AddToLibraryTappedCodingKeys()
{
  return &type metadata for ProgramDetailAction.AddToLibraryTappedCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.ShareProgramTappedCodingKeys()
{
  return &type metadata for ProgramDetailAction.ShareProgramTappedCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.RemoveFromLibraryConfirmationTappedCodingKeys()
{
  return &type metadata for ProgramDetailAction.RemoveFromLibraryConfirmationTappedCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.WatchFilmTappedCodingKeys()
{
  return &type metadata for ProgramDetailAction.WatchFilmTappedCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.MoreTappedCodingKeys()
{
  return &type metadata for ProgramDetailAction.MoreTappedCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.NavigateToWorkoutDetailCodingKeys()
{
  return &type metadata for ProgramDetailAction.NavigateToWorkoutDetailCodingKeys;
}

uint64_t _s20FitnessProductDetail19ProgramDetailActionO29LibraryStateUpdatedCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C3357A0 + 4 * byte_23C35D852[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C3357C0 + 4 * byte_23C35D857[v4]))();
}

_BYTE *sub_23C3357A0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C3357C0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C3357C8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C3357D0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C3357D8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C3357E0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.LinkTappedCodingKeys()
{
  return &type metadata for ProgramDetailAction.LinkTappedCodingKeys;
}

unint64_t sub_23C335800()
{
  unint64_t result;

  result = qword_256B5C880;
  if (!qword_256B5C880)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DB48, &type metadata for ProgramDetailAction.LinkTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C880);
  }
  return result;
}

unint64_t sub_23C335848()
{
  unint64_t result;

  result = qword_256B5C888;
  if (!qword_256B5C888)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DC00, &type metadata for ProgramDetailAction.NavigateToWorkoutDetailCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C888);
  }
  return result;
}

unint64_t sub_23C335890()
{
  unint64_t result;

  result = qword_256B5C890;
  if (!qword_256B5C890)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DE48, &type metadata for ProgramDetailAction.LoadedProgramDetailCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C890);
  }
  return result;
}

unint64_t sub_23C3358D8()
{
  unint64_t result;

  result = qword_256B5C898;
  if (!qword_256B5C898)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DF00, &type metadata for ProgramDetailAction.LibraryStateUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C898);
  }
  return result;
}

unint64_t sub_23C335920()
{
  unint64_t result;

  result = qword_256B5C8A0;
  if (!qword_256B5C8A0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E058, &type metadata for ProgramDetailAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C8A0);
  }
  return result;
}

unint64_t sub_23C335968()
{
  unint64_t result;

  result = qword_256B5C8A8;
  if (!qword_256B5C8A8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DF78, &type metadata for ProgramDetailAction.DismissRemoveFromLibraryAlertCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C8A8);
  }
  return result;
}

unint64_t sub_23C3359B0()
{
  unint64_t result;

  result = qword_256B5C8B0;
  if (!qword_256B5C8B0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DFA0, &type metadata for ProgramDetailAction.DismissRemoveFromLibraryAlertCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C8B0);
  }
  return result;
}

unint64_t sub_23C3359F8()
{
  unint64_t result;

  result = qword_256B5C8B8;
  if (!qword_256B5C8B8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DF28, &type metadata for ProgramDetailAction.ViewDidAppearCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C8B8);
  }
  return result;
}

unint64_t sub_23C335A40()
{
  unint64_t result;

  result = qword_256B5C8C0;
  if (!qword_256B5C8C0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DF50, &type metadata for ProgramDetailAction.ViewDidAppearCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C8C0);
  }
  return result;
}

unint64_t sub_23C335A88()
{
  unint64_t result;

  result = qword_256B5C8C8;
  if (!qword_256B5C8C8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DE70, &type metadata for ProgramDetailAction.LibraryStateUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C8C8);
  }
  return result;
}

unint64_t sub_23C335AD0()
{
  unint64_t result;

  result = qword_256B5C8D0;
  if (!qword_256B5C8D0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DE98, &type metadata for ProgramDetailAction.LibraryStateUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C8D0);
  }
  return result;
}

unint64_t sub_23C335B18()
{
  unint64_t result;

  result = qword_256B5C8D8;
  if (!qword_256B5C8D8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DDB8, &type metadata for ProgramDetailAction.LoadedProgramDetailCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C8D8);
  }
  return result;
}

unint64_t sub_23C335B60()
{
  unint64_t result;

  result = qword_256B5C8E0;
  if (!qword_256B5C8E0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DDE0, &type metadata for ProgramDetailAction.LoadedProgramDetailCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C8E0);
  }
  return result;
}

unint64_t sub_23C335BA8()
{
  unint64_t result;

  result = qword_256B5C8E8;
  if (!qword_256B5C8E8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DD68, &type metadata for ProgramDetailAction.AddToLibraryTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C8E8);
  }
  return result;
}

unint64_t sub_23C335BF0()
{
  unint64_t result;

  result = qword_256B5C8F0;
  if (!qword_256B5C8F0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DD90, &type metadata for ProgramDetailAction.AddToLibraryTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C8F0);
  }
  return result;
}

unint64_t sub_23C335C38()
{
  unint64_t result;

  result = qword_256B5C8F8;
  if (!qword_256B5C8F8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DD18, &type metadata for ProgramDetailAction.ShareProgramTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C8F8);
  }
  return result;
}

unint64_t sub_23C335C80()
{
  unint64_t result;

  result = qword_256B5C900;
  if (!qword_256B5C900)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DD40, &type metadata for ProgramDetailAction.ShareProgramTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C900);
  }
  return result;
}

unint64_t sub_23C335CC8()
{
  unint64_t result;

  result = qword_256B5C908;
  if (!qword_256B5C908)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DCC8, &type metadata for ProgramDetailAction.RemoveFromLibraryConfirmationTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C908);
  }
  return result;
}

unint64_t sub_23C335D10()
{
  unint64_t result;

  result = qword_256B5C910;
  if (!qword_256B5C910)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DCF0, &type metadata for ProgramDetailAction.RemoveFromLibraryConfirmationTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C910);
  }
  return result;
}

unint64_t sub_23C335D58()
{
  unint64_t result;

  result = qword_256B5C918;
  if (!qword_256B5C918)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DC78, &type metadata for ProgramDetailAction.WatchFilmTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C918);
  }
  return result;
}

unint64_t sub_23C335DA0()
{
  unint64_t result;

  result = qword_256B5C920;
  if (!qword_256B5C920)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DCA0, &type metadata for ProgramDetailAction.WatchFilmTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C920);
  }
  return result;
}

unint64_t sub_23C335DE8()
{
  unint64_t result;

  result = qword_256B5C928;
  if (!qword_256B5C928)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DC28, &type metadata for ProgramDetailAction.MoreTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C928);
  }
  return result;
}

unint64_t sub_23C335E30()
{
  unint64_t result;

  result = qword_256B5C930;
  if (!qword_256B5C930)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DC50, &type metadata for ProgramDetailAction.MoreTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C930);
  }
  return result;
}

unint64_t sub_23C335E78()
{
  unint64_t result;

  result = qword_256B5C938;
  if (!qword_256B5C938)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DB70, &type metadata for ProgramDetailAction.NavigateToWorkoutDetailCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C938);
  }
  return result;
}

unint64_t sub_23C335EC0()
{
  unint64_t result;

  result = qword_256B5C940;
  if (!qword_256B5C940)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DB98, &type metadata for ProgramDetailAction.NavigateToWorkoutDetailCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C940);
  }
  return result;
}

unint64_t sub_23C335F08()
{
  unint64_t result;

  result = qword_256B5C948;
  if (!qword_256B5C948)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DAB8, &type metadata for ProgramDetailAction.LinkTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C948);
  }
  return result;
}

unint64_t sub_23C335F50()
{
  unint64_t result;

  result = qword_256B5C950;
  if (!qword_256B5C950)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DAE0, &type metadata for ProgramDetailAction.LinkTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C950);
  }
  return result;
}

unint64_t sub_23C335F98()
{
  unint64_t result;

  result = qword_256B5C958;
  if (!qword_256B5C958)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DFC8, &type metadata for ProgramDetailAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C958);
  }
  return result;
}

unint64_t sub_23C335FE0()
{
  unint64_t result;

  result = qword_256B5C960;
  if (!qword_256B5C960)
  {
    result = MEMORY[0x24261C66C](&unk_23C35DFF0, &type metadata for ProgramDetailAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C960);
  }
  return result;
}

uint64_t sub_23C336024(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD00000000000001DLL && a2 == 0x800000023C361E10 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4164694477656976 && a2 == 0xED00007261657070 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023C361E30 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023C361E50 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000023C361E70 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000023C361E90 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000023 && a2 == 0x800000023C361EB0 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6C69466863746177 && a2 == 0xEF6465707061546DLL || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x7070615465726F6DLL && a2 == 0xEA00000000006465 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000023C361EE0 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x707061546B6E696CLL && a2 == 0xEA00000000006465)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else
  {
    v5 = sub_23C34EC64();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 10;
    else
      return 11;
  }
}

uint64_t sub_23C336464(uint64_t a1, uint64_t a2)
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
    v3 = sub_23C34EC64();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C3364D8()
{
  return 7107189;
}

BOOL static WorkoutDetailDynamicTypeSize.< infix(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  return a1 < a2;
}

BOOL static WorkoutDetailDynamicTypeSize.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23C336508(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C336540 + 4 * byte_23C35E440[a1]))(0xD000000000000014, 0x800000023C361CA0);
}

uint64_t sub_23C336540()
{
  return 0x616D536172747865;
}

uint64_t sub_23C336560()
{
  return 0x6C6C616D73;
}

uint64_t sub_23C336574()
{
  return 0x6D756964656DLL;
}

uint64_t sub_23C336588()
{
  return 0x656772616CLL;
}

uint64_t sub_23C33659C()
{
  return 0x72614C6172747865;
}

uint64_t sub_23C3365B8()
{
  return 0x7478456172747865;
}

uint64_t sub_23C3365DC()
{
  return 0x6269737365636361;
}

uint64_t sub_23C336640()
{
  sub_23C337360();
  return sub_23C34ECD0();
}

uint64_t sub_23C336668()
{
  sub_23C337360();
  return sub_23C34ECDC();
}

uint64_t sub_23C336690()
{
  sub_23C33731C();
  return sub_23C34ECD0();
}

uint64_t sub_23C3366B8()
{
  sub_23C33731C();
  return sub_23C34ECDC();
}

uint64_t sub_23C3366E0()
{
  sub_23C3372D8();
  return sub_23C34ECD0();
}

uint64_t sub_23C336708()
{
  sub_23C3372D8();
  return sub_23C34ECDC();
}

uint64_t sub_23C336730()
{
  sub_23C337294();
  return sub_23C34ECD0();
}

uint64_t sub_23C336758()
{
  sub_23C337294();
  return sub_23C34ECDC();
}

uint64_t sub_23C336780()
{
  sub_23C337250();
  return sub_23C34ECD0();
}

uint64_t sub_23C3367A8()
{
  sub_23C337250();
  return sub_23C34ECDC();
}

uint64_t sub_23C3367D0()
{
  unsigned __int8 *v0;

  return sub_23C336508(*v0);
}

uint64_t sub_23C3367D8()
{
  sub_23C33720C();
  return sub_23C34ECD0();
}

uint64_t sub_23C336800()
{
  sub_23C33720C();
  return sub_23C34ECDC();
}

uint64_t sub_23C336828()
{
  sub_23C3373A4();
  return sub_23C34ECD0();
}

uint64_t sub_23C336850()
{
  sub_23C3373A4();
  return sub_23C34ECDC();
}

uint64_t sub_23C336878()
{
  sub_23C3373E8();
  return sub_23C34ECD0();
}

uint64_t sub_23C3368A0()
{
  sub_23C3373E8();
  return sub_23C34ECDC();
}

uint64_t sub_23C3368C8()
{
  sub_23C33742C();
  return sub_23C34ECD0();
}

uint64_t sub_23C3368F0()
{
  sub_23C33742C();
  return sub_23C34ECDC();
}

uint64_t sub_23C336918()
{
  sub_23C33753C();
  return sub_23C34ECD0();
}

uint64_t sub_23C336940()
{
  sub_23C33753C();
  return sub_23C34ECDC();
}

uint64_t sub_23C336968()
{
  sub_23C337470();
  return sub_23C34ECD0();
}

uint64_t sub_23C336990()
{
  sub_23C337470();
  return sub_23C34ECDC();
}

uint64_t sub_23C3369B8()
{
  sub_23C3374B4();
  return sub_23C34ECD0();
}

uint64_t sub_23C3369E0()
{
  sub_23C3374B4();
  return sub_23C34ECDC();
}

uint64_t sub_23C336A08()
{
  sub_23C3374F8();
  return sub_23C34ECD0();
}

uint64_t sub_23C336A30()
{
  sub_23C3374F8();
  return sub_23C34ECDC();
}

void WorkoutDetailDynamicTypeSize.encode(to:)(_QWORD *a1, uint64_t a2)
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
  char *v20;
  _QWORD v21[3];
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;

  v50 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C968);
  v48 = *(_QWORD *)(v3 - 8);
  v49 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v47 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C970);
  v45 = *(_QWORD *)(v5 - 8);
  v46 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v44 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C978);
  v42 = *(_QWORD *)(v7 - 8);
  v43 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v41 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C980);
  v39 = *(_QWORD *)(v9 - 8);
  v40 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v38 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C988);
  v36 = *(_QWORD *)(v11 - 8);
  v37 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v35 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C990);
  v33 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v32 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C998);
  v30 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v29 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C9A0);
  v27 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v26 = (char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C9A8);
  v24 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v23 = (char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C9B0);
  v21[2] = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v21[1] = (char *)v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C9B8);
  MEMORY[0x24BDAC7A8](v21[0]);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C9C0);
  MEMORY[0x24BDAC7A8](v18);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5C9C8);
  v51 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v20 = (char *)v21 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C33720C();
  v52 = v20;
  sub_23C34ECC4();
  __asm { BR              X10 }
}

uint64_t sub_23C336E68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v3 - 92) = 0;
  sub_23C33753C();
  v4 = *(_QWORD *)(v3 - 112);
  v5 = *(_QWORD *)(v3 - 104);
  sub_23C34EBD4();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 120) + 8))(v4, v5);
}

unint64_t sub_23C33720C()
{
  unint64_t result;

  result = qword_256B5C9D0;
  if (!qword_256B5C9D0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35EF44, &type metadata for WorkoutDetailDynamicTypeSize.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C9D0);
  }
  return result;
}

unint64_t sub_23C337250()
{
  unint64_t result;

  result = qword_256B5C9D8;
  if (!qword_256B5C9D8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35EEF4, &type metadata for WorkoutDetailDynamicTypeSize.Accessibility5CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C9D8);
  }
  return result;
}

unint64_t sub_23C337294()
{
  unint64_t result;

  result = qword_256B5C9E0;
  if (!qword_256B5C9E0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35EEA4, &type metadata for WorkoutDetailDynamicTypeSize.Accessibility4CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C9E0);
  }
  return result;
}

unint64_t sub_23C3372D8()
{
  unint64_t result;

  result = qword_256B5C9E8;
  if (!qword_256B5C9E8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35EE54, &type metadata for WorkoutDetailDynamicTypeSize.Accessibility3CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C9E8);
  }
  return result;
}

unint64_t sub_23C33731C()
{
  unint64_t result;

  result = qword_256B5C9F0;
  if (!qword_256B5C9F0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35EE04, &type metadata for WorkoutDetailDynamicTypeSize.Accessibility2CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C9F0);
  }
  return result;
}

unint64_t sub_23C337360()
{
  unint64_t result;

  result = qword_256B5C9F8;
  if (!qword_256B5C9F8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35EDB4, &type metadata for WorkoutDetailDynamicTypeSize.Accessibility1CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5C9F8);
  }
  return result;
}

unint64_t sub_23C3373A4()
{
  unint64_t result;

  result = qword_256B5CA00;
  if (!qword_256B5CA00)
  {
    result = MEMORY[0x24261C66C](&unk_23C35ED64, &type metadata for WorkoutDetailDynamicTypeSize.ExtraExtraExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA00);
  }
  return result;
}

unint64_t sub_23C3373E8()
{
  unint64_t result;

  result = qword_256B5CA08;
  if (!qword_256B5CA08)
  {
    result = MEMORY[0x24261C66C](&unk_23C35ED14, &type metadata for WorkoutDetailDynamicTypeSize.ExtraExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA08);
  }
  return result;
}

unint64_t sub_23C33742C()
{
  unint64_t result;

  result = qword_256B5CA10;
  if (!qword_256B5CA10)
  {
    result = MEMORY[0x24261C66C](&unk_23C35ECC4, &type metadata for WorkoutDetailDynamicTypeSize.ExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA10);
  }
  return result;
}

unint64_t sub_23C337470()
{
  unint64_t result;

  result = qword_256B5CA18;
  if (!qword_256B5CA18)
  {
    result = MEMORY[0x24261C66C](&unk_23C35EC74, &type metadata for WorkoutDetailDynamicTypeSize.LargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA18);
  }
  return result;
}

unint64_t sub_23C3374B4()
{
  unint64_t result;

  result = qword_256B5CA20;
  if (!qword_256B5CA20)
  {
    result = MEMORY[0x24261C66C](&unk_23C35EC24, &type metadata for WorkoutDetailDynamicTypeSize.MediumCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA20);
  }
  return result;
}

unint64_t sub_23C3374F8()
{
  unint64_t result;

  result = qword_256B5CA28;
  if (!qword_256B5CA28)
  {
    result = MEMORY[0x24261C66C](&unk_23C35EBD4, &type metadata for WorkoutDetailDynamicTypeSize.SmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA28);
  }
  return result;
}

unint64_t sub_23C33753C()
{
  unint64_t result;

  result = qword_256B5CA30;
  if (!qword_256B5CA30)
  {
    result = MEMORY[0x24261C66C](&unk_23C35EB84, &type metadata for WorkoutDetailDynamicTypeSize.ExtraSmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA30);
  }
  return result;
}

uint64_t WorkoutDetailDynamicTypeSize.init(from:)(_QWORD *a1)
{
  return sub_23C33763C(a1);
}

uint64_t sub_23C337594@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23C33763C(a1);
  if (!v2)
    *a2 = result;
  return result;
}

void sub_23C3375BC(_QWORD *a1)
{
  unsigned __int8 *v1;

  WorkoutDetailDynamicTypeSize.encode(to:)(a1, *v1);
}

uint64_t WorkoutDetailDynamicTypeSize.hash(into:)()
{
  return sub_23C34EC88();
}

uint64_t WorkoutDetailDynamicTypeSize.hashValue.getter()
{
  sub_23C34EC7C();
  sub_23C34EC88();
  return sub_23C34ECAC();
}

uint64_t sub_23C33763C(_QWORD *a1)
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD v34[4];
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
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  _QWORD *v67;
  uint64_t v68;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CB18);
  v54 = *(_QWORD *)(v2 - 8);
  v55 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v63 = (char *)v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CB20);
  v52 = *(_QWORD *)(v4 - 8);
  v53 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v62 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CB28);
  v50 = *(_QWORD *)(v6 - 8);
  v51 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v61 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CB30);
  v34[3] = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v60 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CB38);
  v47 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v66 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CB40);
  v44 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v58 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CB48);
  v45 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v65 = (char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CB50);
  v42 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v59 = (char *)v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CB58);
  v40 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v64 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CB60);
  v38 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v57 = (char *)v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CB68);
  v36 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v56 = (char *)v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CB70);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CB78);
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)v34 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = a1[3];
  v67 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v24);
  sub_23C33720C();
  v25 = v68;
  sub_23C34ECB8();
  if (!v25)
  {
    v34[2] = v19;
    v34[0] = v17;
    v34[1] = v16;
    v68 = 0;
    v26 = v21;
    v27 = v23;
    v28 = sub_23C34EBBC();
    v29 = v20;
    if (*(_QWORD *)(v28 + 16) == 1)
      __asm { BR              X9 }
    v30 = sub_23C34EAC0();
    swift_allocError();
    v32 = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B576B0);
    *v32 = &type metadata for WorkoutDetailDynamicTypeSize;
    sub_23C34EB44();
    sub_23C34EAB4();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v32, *MEMORY[0x24BEE26D0], v30);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v29);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v67);
}

unint64_t sub_23C337FCC()
{
  unint64_t result;

  result = qword_256B5CA38;
  if (!qword_256B5CA38)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for WorkoutDetailDynamicTypeSize, &type metadata for WorkoutDetailDynamicTypeSize);
    atomic_store(result, (unint64_t *)&qword_256B5CA38);
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize()
{
  return &type metadata for WorkoutDetailDynamicTypeSize;
}

uint64_t _s20FitnessProductDetail28WorkoutDetailDynamicTypeSizeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_23C338070 + 4 * byte_23C35E475[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_23C3380A4 + 4 * byte_23C35E470[v4]))();
}

uint64_t sub_23C3380A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C3380AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C3380B4);
  return result;
}

uint64_t sub_23C3380C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C3380C8);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_23C3380CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C3380D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.CodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.CodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.ExtraSmallCodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.ExtraSmallCodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.SmallCodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.SmallCodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.MediumCodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.MediumCodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.LargeCodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.LargeCodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.ExtraLargeCodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.ExtraLargeCodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.ExtraExtraLargeCodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.ExtraExtraLargeCodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.ExtraExtraExtraLargeCodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.ExtraExtraExtraLargeCodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.Accessibility1CodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.Accessibility1CodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.Accessibility2CodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.Accessibility2CodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.Accessibility3CodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.Accessibility3CodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.Accessibility4CodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.Accessibility4CodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.Accessibility5CodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.Accessibility5CodingKeys;
}

unint64_t sub_23C3381B4()
{
  unint64_t result;

  result = qword_256B5CA40;
  if (!qword_256B5CA40)
  {
    result = MEMORY[0x24261C66C](&unk_23C35EB5C, &type metadata for WorkoutDetailDynamicTypeSize.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA40);
  }
  return result;
}

unint64_t sub_23C3381FC()
{
  unint64_t result;

  result = qword_256B5CA48;
  if (!qword_256B5CA48)
  {
    result = MEMORY[0x24261C66C](&unk_23C35EA7C, &type metadata for WorkoutDetailDynamicTypeSize.ExtraSmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA48);
  }
  return result;
}

unint64_t sub_23C338244()
{
  unint64_t result;

  result = qword_256B5CA50;
  if (!qword_256B5CA50)
  {
    result = MEMORY[0x24261C66C](&unk_23C35EAA4, &type metadata for WorkoutDetailDynamicTypeSize.ExtraSmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA50);
  }
  return result;
}

unint64_t sub_23C33828C()
{
  unint64_t result;

  result = qword_256B5CA58;
  if (!qword_256B5CA58)
  {
    result = MEMORY[0x24261C66C](&unk_23C35EA2C, &type metadata for WorkoutDetailDynamicTypeSize.SmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA58);
  }
  return result;
}

unint64_t sub_23C3382D4()
{
  unint64_t result;

  result = qword_256B5CA60;
  if (!qword_256B5CA60)
  {
    result = MEMORY[0x24261C66C](&unk_23C35EA54, &type metadata for WorkoutDetailDynamicTypeSize.SmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA60);
  }
  return result;
}

unint64_t sub_23C33831C()
{
  unint64_t result;

  result = qword_256B5CA68;
  if (!qword_256B5CA68)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E9DC, &type metadata for WorkoutDetailDynamicTypeSize.MediumCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA68);
  }
  return result;
}

unint64_t sub_23C338364()
{
  unint64_t result;

  result = qword_256B5CA70;
  if (!qword_256B5CA70)
  {
    result = MEMORY[0x24261C66C](&unk_23C35EA04, &type metadata for WorkoutDetailDynamicTypeSize.MediumCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA70);
  }
  return result;
}

unint64_t sub_23C3383AC()
{
  unint64_t result;

  result = qword_256B5CA78;
  if (!qword_256B5CA78)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E98C, &type metadata for WorkoutDetailDynamicTypeSize.LargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA78);
  }
  return result;
}

unint64_t sub_23C3383F4()
{
  unint64_t result;

  result = qword_256B5CA80;
  if (!qword_256B5CA80)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E9B4, &type metadata for WorkoutDetailDynamicTypeSize.LargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA80);
  }
  return result;
}

unint64_t sub_23C33843C()
{
  unint64_t result;

  result = qword_256B5CA88;
  if (!qword_256B5CA88)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E93C, &type metadata for WorkoutDetailDynamicTypeSize.ExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA88);
  }
  return result;
}

unint64_t sub_23C338484()
{
  unint64_t result;

  result = qword_256B5CA90;
  if (!qword_256B5CA90)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E964, &type metadata for WorkoutDetailDynamicTypeSize.ExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA90);
  }
  return result;
}

unint64_t sub_23C3384CC()
{
  unint64_t result;

  result = qword_256B5CA98;
  if (!qword_256B5CA98)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E8EC, &type metadata for WorkoutDetailDynamicTypeSize.ExtraExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CA98);
  }
  return result;
}

unint64_t sub_23C338514()
{
  unint64_t result;

  result = qword_256B5CAA0;
  if (!qword_256B5CAA0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E914, &type metadata for WorkoutDetailDynamicTypeSize.ExtraExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CAA0);
  }
  return result;
}

unint64_t sub_23C33855C()
{
  unint64_t result;

  result = qword_256B5CAA8;
  if (!qword_256B5CAA8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E89C, &type metadata for WorkoutDetailDynamicTypeSize.ExtraExtraExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CAA8);
  }
  return result;
}

unint64_t sub_23C3385A4()
{
  unint64_t result;

  result = qword_256B5CAB0;
  if (!qword_256B5CAB0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E8C4, &type metadata for WorkoutDetailDynamicTypeSize.ExtraExtraExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CAB0);
  }
  return result;
}

unint64_t sub_23C3385EC()
{
  unint64_t result;

  result = qword_256B5CAB8;
  if (!qword_256B5CAB8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E84C, &type metadata for WorkoutDetailDynamicTypeSize.Accessibility1CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CAB8);
  }
  return result;
}

unint64_t sub_23C338634()
{
  unint64_t result;

  result = qword_256B5CAC0;
  if (!qword_256B5CAC0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E874, &type metadata for WorkoutDetailDynamicTypeSize.Accessibility1CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CAC0);
  }
  return result;
}

unint64_t sub_23C33867C()
{
  unint64_t result;

  result = qword_256B5CAC8;
  if (!qword_256B5CAC8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E7FC, &type metadata for WorkoutDetailDynamicTypeSize.Accessibility2CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CAC8);
  }
  return result;
}

unint64_t sub_23C3386C4()
{
  unint64_t result;

  result = qword_256B5CAD0;
  if (!qword_256B5CAD0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E824, &type metadata for WorkoutDetailDynamicTypeSize.Accessibility2CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CAD0);
  }
  return result;
}

unint64_t sub_23C33870C()
{
  unint64_t result;

  result = qword_256B5CAD8;
  if (!qword_256B5CAD8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E7AC, &type metadata for WorkoutDetailDynamicTypeSize.Accessibility3CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CAD8);
  }
  return result;
}

unint64_t sub_23C338754()
{
  unint64_t result;

  result = qword_256B5CAE0;
  if (!qword_256B5CAE0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E7D4, &type metadata for WorkoutDetailDynamicTypeSize.Accessibility3CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CAE0);
  }
  return result;
}

unint64_t sub_23C33879C()
{
  unint64_t result;

  result = qword_256B5CAE8;
  if (!qword_256B5CAE8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E75C, &type metadata for WorkoutDetailDynamicTypeSize.Accessibility4CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CAE8);
  }
  return result;
}

unint64_t sub_23C3387E4()
{
  unint64_t result;

  result = qword_256B5CAF0;
  if (!qword_256B5CAF0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E784, &type metadata for WorkoutDetailDynamicTypeSize.Accessibility4CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CAF0);
  }
  return result;
}

unint64_t sub_23C33882C()
{
  unint64_t result;

  result = qword_256B5CAF8;
  if (!qword_256B5CAF8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E70C, &type metadata for WorkoutDetailDynamicTypeSize.Accessibility5CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CAF8);
  }
  return result;
}

unint64_t sub_23C338874()
{
  unint64_t result;

  result = qword_256B5CB00;
  if (!qword_256B5CB00)
  {
    result = MEMORY[0x24261C66C](&unk_23C35E734, &type metadata for WorkoutDetailDynamicTypeSize.Accessibility5CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CB00);
  }
  return result;
}

unint64_t sub_23C3388BC()
{
  unint64_t result;

  result = qword_256B5CB08;
  if (!qword_256B5CB08)
  {
    result = MEMORY[0x24261C66C](&unk_23C35EACC, &type metadata for WorkoutDetailDynamicTypeSize.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CB08);
  }
  return result;
}

unint64_t sub_23C338904()
{
  unint64_t result;

  result = qword_256B5CB10;
  if (!qword_256B5CB10)
  {
    result = MEMORY[0x24261C66C](&unk_23C35EAF4, &type metadata for WorkoutDetailDynamicTypeSize.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CB10);
  }
  return result;
}

BOOL static BookmarkStatus.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23C338960(char a1)
{
  if ((a1 & 1) != 0)
    return 0x62694C6E49746F6ELL;
  else
    return 0x72617262694C6E69;
}

uint64_t sub_23C3389A4()
{
  char *v0;

  return sub_23C338960(*v0);
}

uint64_t sub_23C3389AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C33948C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C3389D0()
{
  sub_23C338C94();
  return sub_23C34ECD0();
}

uint64_t sub_23C3389F8()
{
  sub_23C338C94();
  return sub_23C34ECDC();
}

uint64_t sub_23C338A20()
{
  sub_23C338D1C();
  return sub_23C34ECD0();
}

uint64_t sub_23C338A48()
{
  sub_23C338D1C();
  return sub_23C34ECDC();
}

uint64_t sub_23C338A70()
{
  sub_23C338CD8();
  return sub_23C34ECD0();
}

uint64_t sub_23C338A98()
{
  sub_23C338CD8();
  return sub_23C34ECDC();
}

uint64_t BookmarkStatus.encode(to:)(_QWORD *a1)
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CB80);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CB88);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CB90);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C338C94();
  sub_23C34ECC4();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23C338CD8();
    sub_23C34EBD4();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23C338D1C();
    sub_23C34EBD4();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_23C338C94()
{
  unint64_t result;

  result = qword_256B5CB98;
  if (!qword_256B5CB98)
  {
    result = MEMORY[0x24261C66C](&unk_23C35F2D0, &type metadata for BookmarkStatus.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CB98);
  }
  return result;
}

unint64_t sub_23C338CD8()
{
  unint64_t result;

  result = qword_256B5CBA0;
  if (!qword_256B5CBA0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35F280, &type metadata for BookmarkStatus.NotInLibraryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CBA0);
  }
  return result;
}

unint64_t sub_23C338D1C()
{
  unint64_t result;

  result = qword_256B5CBA8;
  if (!qword_256B5CBA8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35F230, &type metadata for BookmarkStatus.InLibraryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CBA8);
  }
  return result;
}

uint64_t BookmarkStatus.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CBB0);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CBB8);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CBC0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C338C94();
  v11 = v33;
  sub_23C34ECB8();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23C34EBBC();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23C34EAC0();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B576B0);
    *v21 = &type metadata for BookmarkStatus;
    sub_23C34EB44();
    sub_23C34EAB4();
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
    sub_23C338CD8();
    sub_23C34EB38();
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
    sub_23C338D1C();
    v22 = v6;
    sub_23C34EB38();
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

uint64_t sub_23C3390B8@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return BookmarkStatus.init(from:)(a1, a2);
}

uint64_t sub_23C3390CC(_QWORD *a1)
{
  return BookmarkStatus.encode(to:)(a1);
}

uint64_t BookmarkStatus.hash(into:)()
{
  return sub_23C34EC88();
}

uint64_t BookmarkStatus.hashValue.getter()
{
  sub_23C34EC7C();
  sub_23C34EC88();
  return sub_23C34ECAC();
}

unint64_t sub_23C339150()
{
  unint64_t result;

  result = qword_256B5CBC8;
  if (!qword_256B5CBC8)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for BookmarkStatus, &type metadata for BookmarkStatus);
    atomic_store(result, (unint64_t *)&qword_256B5CBC8);
  }
  return result;
}

ValueMetadata *type metadata accessor for BookmarkStatus()
{
  return &type metadata for BookmarkStatus;
}

uint64_t _s20FitnessProductDetail14BookmarkStatusOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C3391F4 + 4 * byte_23C35EFA5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C339228 + 4 * byte_23C35EFA0[v4]))();
}

uint64_t sub_23C339228(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C339230(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C339238);
  return result;
}

uint64_t sub_23C339244(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C33924CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C339250(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C339258(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BookmarkStatus.CodingKeys()
{
  return &type metadata for BookmarkStatus.CodingKeys;
}

ValueMetadata *type metadata accessor for BookmarkStatus.InLibraryCodingKeys()
{
  return &type metadata for BookmarkStatus.InLibraryCodingKeys;
}

ValueMetadata *type metadata accessor for BookmarkStatus.NotInLibraryCodingKeys()
{
  return &type metadata for BookmarkStatus.NotInLibraryCodingKeys;
}

unint64_t sub_23C339298()
{
  unint64_t result;

  result = qword_256B5CBD0;
  if (!qword_256B5CBD0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35F208, &type metadata for BookmarkStatus.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CBD0);
  }
  return result;
}

unint64_t sub_23C3392E0()
{
  unint64_t result;

  result = qword_256B5CBD8;
  if (!qword_256B5CBD8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35F128, &type metadata for BookmarkStatus.InLibraryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CBD8);
  }
  return result;
}

unint64_t sub_23C339328()
{
  unint64_t result;

  result = qword_256B5CBE0;
  if (!qword_256B5CBE0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35F150, &type metadata for BookmarkStatus.InLibraryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CBE0);
  }
  return result;
}

unint64_t sub_23C339370()
{
  unint64_t result;

  result = qword_256B5CBE8;
  if (!qword_256B5CBE8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35F0D8, &type metadata for BookmarkStatus.NotInLibraryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CBE8);
  }
  return result;
}

unint64_t sub_23C3393B8()
{
  unint64_t result;

  result = qword_256B5CBF0;
  if (!qword_256B5CBF0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35F100, &type metadata for BookmarkStatus.NotInLibraryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CBF0);
  }
  return result;
}

unint64_t sub_23C339400()
{
  unint64_t result;

  result = qword_256B5CBF8;
  if (!qword_256B5CBF8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35F178, &type metadata for BookmarkStatus.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CBF8);
  }
  return result;
}

unint64_t sub_23C339448()
{
  unint64_t result;

  result = qword_256B5CC00;
  if (!qword_256B5CC00)
  {
    result = MEMORY[0x24261C66C](&unk_23C35F1A0, &type metadata for BookmarkStatus.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CC00);
  }
  return result;
}

uint64_t sub_23C33948C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x72617262694C6E69 && a2 == 0xE900000000000079;
  if (v3 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x62694C6E49746F6ELL && a2 == 0xEC00000079726172)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C34EC64();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t EditorialExternalLink.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EditorialExternalLink.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for EditorialExternalLink() + 20);
  v4 = sub_23C34D950();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for EditorialExternalLink()
{
  uint64_t result;

  result = qword_256B5CC80;
  if (!qword_256B5CC80)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t EditorialExternalLink.init(name:url:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  char *v5;
  uint64_t v6;

  *a4 = a1;
  a4[1] = a2;
  v5 = (char *)a4 + *(int *)(type metadata accessor for EditorialExternalLink() + 20);
  v6 = sub_23C34D950();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a3, v6);
}

uint64_t sub_23C33968C(char a1)
{
  if ((a1 & 1) != 0)
    return 7107189;
  else
    return 1701667182;
}

uint64_t sub_23C3396B4()
{
  char *v0;

  return sub_23C33968C(*v0);
}

uint64_t sub_23C3396BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C33A2EC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C3396E0()
{
  sub_23C339884();
  return sub_23C34ECD0();
}

uint64_t sub_23C339708()
{
  sub_23C339884();
  return sub_23C34ECDC();
}

uint64_t EditorialExternalLink.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CC08);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C339884();
  sub_23C34ECC4();
  v8[15] = 0;
  sub_23C34EC10();
  if (!v1)
  {
    type metadata accessor for EditorialExternalLink();
    v8[14] = 1;
    sub_23C34D950();
    sub_23C27FEE4(&qword_256B58108, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
    sub_23C34EC40();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23C339884()
{
  unint64_t result;

  result = qword_256B5CC10;
  if (!qword_256B5CC10)
  {
    result = MEMORY[0x24261C66C](&unk_23C35F4F4, &type metadata for EditorialExternalLink.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CC10);
  }
  return result;
}

uint64_t EditorialExternalLink.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;

  v22 = a2;
  v4 = sub_23C34D950();
  v24 = *(_QWORD *)(v4 - 8);
  v25 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v23 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CC18);
  v6 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for EditorialExternalLink();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C339884();
  sub_23C34ECB8();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v20 = a1;
  v21 = v6;
  v12 = v11;
  v14 = v23;
  v13 = v24;
  v15 = v25;
  v16 = v26;
  v28 = 0;
  *v12 = sub_23C34EB80();
  v12[1] = v17;
  v27 = 1;
  sub_23C27FEE4(&qword_256B58120, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
  sub_23C34EBB0();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v16);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))((char *)v12 + *(int *)(v9 + 20), v14, v15);
  sub_23C339B10((uint64_t)v12, v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  return sub_23C339B54((uint64_t)v12);
}

uint64_t sub_23C339B10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EditorialExternalLink();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C339B54(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for EditorialExternalLink();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C339B90@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return EditorialExternalLink.init(from:)(a1, a2);
}

uint64_t sub_23C339BA4(_QWORD *a1)
{
  return EditorialExternalLink.encode(to:)(a1);
}

uint64_t EditorialExternalLink.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_23C34E8B0();
  swift_bridgeObjectRelease();
  type metadata accessor for EditorialExternalLink();
  sub_23C34D950();
  sub_23C27FEE4(&qword_256B57EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  return sub_23C34E838();
}

uint64_t static EditorialExternalLink.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  BOOL v2;

  v2 = *a1 == *a2 && a1[1] == a2[1];
  if (v2 || (sub_23C34EC64() & 1) != 0)
  {
    type metadata accessor for EditorialExternalLink();
    JUMPOUT(0x24261B040);
  }
  return 0;
}

uint64_t EditorialExternalLink.hashValue.getter()
{
  sub_23C34EC7C();
  swift_bridgeObjectRetain();
  sub_23C34E8B0();
  swift_bridgeObjectRelease();
  type metadata accessor for EditorialExternalLink();
  sub_23C34D950();
  sub_23C27FEE4(&qword_256B57EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_23C34E838();
  return sub_23C34ECAC();
}

uint64_t sub_23C339D58()
{
  sub_23C34EC7C();
  swift_bridgeObjectRetain();
  sub_23C34E8B0();
  swift_bridgeObjectRelease();
  sub_23C34D950();
  sub_23C27FEE4(&qword_256B57EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_23C34E838();
  return sub_23C34ECAC();
}

uint64_t sub_23C339DFC()
{
  swift_bridgeObjectRetain();
  sub_23C34E8B0();
  swift_bridgeObjectRelease();
  sub_23C34D950();
  sub_23C27FEE4(&qword_256B57EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  return sub_23C34E838();
}

uint64_t sub_23C339E90()
{
  sub_23C34EC7C();
  swift_bridgeObjectRetain();
  sub_23C34E8B0();
  swift_bridgeObjectRelease();
  sub_23C34D950();
  sub_23C27FEE4(&qword_256B57EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_23C34E838();
  return sub_23C34ECAC();
}

uint64_t sub_23C339F30()
{
  return sub_23C27FEE4(&qword_256B5CC20, (uint64_t (*)(uint64_t))type metadata accessor for EditorialExternalLink, (uint64_t)&protocol conformance descriptor for EditorialExternalLink);
}

uint64_t sub_23C339F5C(_QWORD *a1, _QWORD *a2)
{
  BOOL v2;

  v2 = *a1 == *a2 && a1[1] == a2[1];
  if (v2 || (sub_23C34EC64() & 1) != 0)
    JUMPOUT(0x24261B040);
  return 0;
}

uint64_t getEnumTagSinglePayload for EditorialExternalLink()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C339FD8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_23C34D950();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for EditorialExternalLink()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C33A060(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_23C34D950();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23C33A0D4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23C34D950();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for EditorialExternalLink.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C33A194 + 4 * byte_23C35F325[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C33A1C8 + 4 * byte_23C35F320[v4]))();
}

uint64_t sub_23C33A1C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C33A1D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C33A1D8);
  return result;
}

uint64_t sub_23C33A1E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C33A1ECLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C33A1F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C33A1F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EditorialExternalLink.CodingKeys()
{
  return &type metadata for EditorialExternalLink.CodingKeys;
}

unint64_t sub_23C33A218()
{
  unint64_t result;

  result = qword_256B5CCB8;
  if (!qword_256B5CCB8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35F4CC, &type metadata for EditorialExternalLink.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CCB8);
  }
  return result;
}

unint64_t sub_23C33A260()
{
  unint64_t result;

  result = qword_256B5CCC0;
  if (!qword_256B5CCC0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35F43C, &type metadata for EditorialExternalLink.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CCC0);
  }
  return result;
}

unint64_t sub_23C33A2A8()
{
  unint64_t result;

  result = qword_256B5CCC8;
  if (!qword_256B5CCC8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35F464, &type metadata for EditorialExternalLink.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CCC8);
  }
  return result;
}

uint64_t sub_23C33A2EC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v3 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7107189 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C34EC64();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

void sub_23C33A3B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  char *v5;
  uint64_t v6;

  v1 = sub_23C34D950();
  MEMORY[0x24BDAC7A8](v1);
  v2 = type metadata accessor for ProgramDetailFeature.TaskIdentifier();
  MEMORY[0x24BDAC7A8](v2);
  sub_23C282F90(v0, (uint64_t)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v5 = (char *)sub_23C33A480 + 4 * byte_23C35F550[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23C33A480()
{
  sub_23C34EC88();
  sub_23C34E8B0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C33A59C()
{
  sub_23C34EC7C();
  sub_23C33A3B4();
  return sub_23C34ECAC();
}

uint64_t sub_23C33A5DC()
{
  sub_23C34EC7C();
  sub_23C33A3B4();
  return sub_23C34ECAC();
}

__n128 ProgramDetailFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;

  v2 = *(_OWORD *)(a1 + 112);
  a2[6] = *(_OWORD *)(a1 + 96);
  a2[7] = v2;
  v3 = *(_OWORD *)(a1 + 144);
  a2[8] = *(_OWORD *)(a1 + 128);
  a2[9] = v3;
  v4 = *(_OWORD *)(a1 + 48);
  a2[2] = *(_OWORD *)(a1 + 32);
  a2[3] = v4;
  v5 = *(_OWORD *)(a1 + 80);
  a2[4] = *(_OWORD *)(a1 + 64);
  a2[5] = v5;
  result = *(__n128 *)a1;
  v7 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v7;
  return result;
}

void ProgramDetailFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 *v4;
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
  uint64_t State;
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
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t (*v58)(_QWORD);
  char *v59;
  _QWORD v60[4];
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  char *v66;
  uint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  char *v76;
  char *v77;
  uint64_t v78;
  char *v79;
  char *v80;
  char *v81;
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;

  v92 = a4;
  v90 = a3;
  v91 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
  MEMORY[0x24BDAC7A8](v5);
  v62 = (char *)v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = type metadata accessor for WorkoutProgramPreview();
  v67 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v60[3] = (char *)v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60[2] = v7;
  MEMORY[0x24BDAC7A8](v8);
  v65 = (char *)v60 - v9;
  v85 = sub_23C34D950();
  v84 = *(_QWORD *)(v85 - 8);
  v10 = *(_QWORD *)(v84 + 64);
  MEMORY[0x24BDAC7A8](v85);
  v74 = (char *)v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v83 = (char *)v60 - v12;
  v61 = type metadata accessor for WorkoutProgram();
  v78 = *(_QWORD *)(v61 - 8);
  v13 = *(_QWORD *)(v78 + 64);
  MEMORY[0x24BDAC7A8](v61);
  v60[1] = (char *)v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v68 = (char *)v60 - v15;
  MEMORY[0x24BDAC7A8](v16);
  v75 = (char *)v60 - v17;
  MEMORY[0x24BDAC7A8](v18);
  v77 = (char *)v60 - v19;
  State = type metadata accessor for ProgramDetailLoadState();
  MEMORY[0x24BDAC7A8](State);
  v73 = (char *)v60 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v76 = (char *)v60 - v23;
  v88 = type metadata accessor for ProgramDetailFeature.TaskIdentifier();
  MEMORY[0x24BDAC7A8](v88);
  v60[0] = (char *)v60 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v72 = (char *)v60 - v26;
  MEMORY[0x24BDAC7A8](v27);
  MEMORY[0x24BDAC7A8](v28);
  MEMORY[0x24BDAC7A8](v29);
  MEMORY[0x24BDAC7A8](v30);
  v71 = (char *)v60 - v31;
  MEMORY[0x24BDAC7A8](v32);
  v66 = (char *)v60 - v33;
  MEMORY[0x24BDAC7A8](v34);
  v87 = (char *)v60 - v35;
  MEMORY[0x24BDAC7A8](v36);
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58B18);
  v86 = *(_QWORD *)(v89 - 8);
  MEMORY[0x24BDAC7A8](v89);
  v64 = (char *)v60 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v38);
  v81 = (char *)v60 - v39;
  MEMORY[0x24BDAC7A8](v40);
  v79 = (char *)v60 - v41;
  MEMORY[0x24BDAC7A8](v42);
  v80 = (char *)v60 - v43;
  MEMORY[0x24BDAC7A8](v44);
  v69 = (char *)v60 - v45;
  MEMORY[0x24BDAC7A8](v46);
  v82 = (char *)v60 - v47;
  MEMORY[0x24BDAC7A8](v48);
  v70 = (char *)v60 - v49;
  MEMORY[0x24BDAC7A8](v50);
  v51 = type metadata accessor for ProgramDetailAction();
  MEMORY[0x24BDAC7A8](v51);
  v53 = v4[7];
  v99 = v4[6];
  v100 = v53;
  v54 = v4[9];
  v101 = v4[8];
  v102 = v54;
  v55 = v4[3];
  v95 = v4[2];
  v96 = v55;
  v56 = v4[5];
  v97 = v4[4];
  v98 = v56;
  v57 = v4[1];
  v93 = *v4;
  v94 = v57;
  sub_23C282F90(v92, (uint64_t)v60 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0), v58);
  v59 = (char *)sub_23C33ABE4 + 4 * word_23C35F558[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_23C33ABE4()
{
  _BYTE *v0;
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)(v1 - 272) + 34) = *v0;
}

uint64_t type metadata accessor for ProgramDetailFeature.TaskIdentifier()
{
  uint64_t result;

  result = qword_256B5CDE8;
  if (!qword_256B5CDE8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23C33C3EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C33C434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v8;
  uint64_t (*v10)(_QWORD *, uint64_t, uint64_t);

  v4[2] = a1;
  v4[3] = type metadata accessor for ProgramDetailAction();
  v4[4] = swift_task_alloc();
  v4[5] = sub_23C34E964();
  v4[6] = sub_23C34E958();
  v10 = (uint64_t (*)(_QWORD *, uint64_t, uint64_t))(**(int **)(a2 + 32) + *(_QWORD *)(a2 + 32));
  v8 = (_QWORD *)swift_task_alloc();
  v4[7] = v8;
  *v8 = v4;
  v8[1] = sub_23C33C4F8;
  return v10(v4 + 12, a3, a4);
}

uint64_t sub_23C33C4F8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 64) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 72) = sub_23C34E940();
  *(_QWORD *)(v2 + 80) = v3;
  return swift_task_switch();
}

uint64_t sub_23C33C584()
{
  uint64_t v0;
  _QWORD *v1;

  **(_BYTE **)(v0 + 32) = *(_BYTE *)(v0 + 96);
  swift_storeEnumTagMultiPayload();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CE30);
  *v1 = v0;
  v1[1] = sub_23C33C5FC;
  return sub_23C34E76C();
}

uint64_t sub_23C33C5FC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 32);
  swift_task_dealloc();
  sub_23C283550(v1, (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailAction);
  return swift_task_switch();
}

uint64_t sub_23C33C65C()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C33C69C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);

  v4[2] = a1;
  v4[3] = type metadata accessor for ProgramDetailAction();
  v4[4] = swift_task_alloc();
  type metadata accessor for WorkoutProgram();
  v8 = swift_task_alloc();
  v4[5] = v8;
  v4[6] = sub_23C34E964();
  v4[7] = sub_23C34E958();
  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a2 + 16) + *(_QWORD *)(a2 + 16));
  v9 = (_QWORD *)swift_task_alloc();
  v4[8] = v9;
  *v9 = v4;
  v9[1] = sub_23C33C780;
  return v11(v8, a3, a4);
}

uint64_t sub_23C33C780()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 72) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 80) = sub_23C34E940();
  *(_QWORD *)(v2 + 88) = v3;
  return swift_task_switch();
}

uint64_t sub_23C33C80C()
{
  uint64_t *v0;
  _QWORD *v1;

  sub_23C282F90(v0[5], v0[4], (uint64_t (*)(_QWORD))type metadata accessor for WorkoutProgram);
  swift_storeEnumTagMultiPayload();
  v1 = (_QWORD *)swift_task_alloc();
  v0[12] = (uint64_t)v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CE30);
  *v1 = v0;
  v1[1] = sub_23C33C898;
  return sub_23C34E76C();
}

uint64_t sub_23C33C898()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 32);
  swift_task_dealloc();
  sub_23C283550(v1, (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailAction);
  return swift_task_switch();
}

uint64_t sub_23C33C8F8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_release();
  sub_23C283550(v1, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutProgram);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C33C950(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t);

  *(_QWORD *)(v3 + 48) = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CE38);
  *(_QWORD *)(v3 + 56) = v5;
  *(_QWORD *)(v3 + 64) = *(_QWORD *)(v5 - 8);
  v6 = swift_task_alloc();
  *(_QWORD *)(v3 + 72) = v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CE40);
  *(_QWORD *)(v3 + 80) = v7;
  *(_QWORD *)(v3 + 88) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v3 + 96) = swift_task_alloc();
  *(_QWORD *)(v3 + 104) = sub_23C34E964();
  *(_QWORD *)(v3 + 112) = sub_23C34E958();
  v8 = *(int **)(a2 + 48);
  *(_OWORD *)(v3 + 120) = *(_OWORD *)(a2 + 128);
  v11 = (uint64_t (*)(uint64_t))((char *)v8 + *v8);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 136) = v9;
  *v9 = v3;
  v9[1] = sub_23C33CA38;
  return v11(v6);
}

uint64_t sub_23C33CA38()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 144) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 152) = sub_23C34E940();
  *(_QWORD *)(v2 + 160) = v3;
  return swift_task_switch();
}

uint64_t sub_23C33CAC4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[8];
  v1 = v0[9];
  v3 = v0[7];
  sub_23C34E994();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v0[21] = sub_23C34E958();
  v4 = (_QWORD *)swift_task_alloc();
  v0[22] = v4;
  *v4 = v0;
  v4[1] = sub_23C33CB68;
  return sub_23C34E9A0();
}

uint64_t sub_23C33CB68()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C33CBBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  int *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t (*v19)(uint64_t);

  v1 = *(_QWORD *)(v0 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 48);
    v3 = *(_QWORD *)(v2 + *(int *)(type metadata accessor for WorkoutProgram() + 52));
    swift_bridgeObjectRetain();
    v4 = sub_23C34E9B8();
    *(_QWORD *)(v0 + 40) = v4;
    v5 = *(_QWORD *)(v3 + 16);
    if (v5)
    {
      v6 = (uint64_t *)(v3 + 40);
      do
      {
        v7 = *(v6 - 1);
        v8 = *v6;
        swift_bridgeObjectRetain();
        sub_23C33E8AC((uint64_t *)(v0 + 16), v7, v8);
        swift_bridgeObjectRelease();
        v6 += 2;
        --v5;
      }
      while (v5);
      swift_bridgeObjectRelease();
      v9 = *(_QWORD *)(v0 + 40);
    }
    else
    {
      v9 = v4;
      swift_bridgeObjectRelease();
    }
    v11 = sub_23C33ED34(v9, v1);
    *(_QWORD *)(v0 + 184) = v11;
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v11 + 16))
    {
      if (qword_256B574F8 != -1)
        swift_once();
      v12 = sub_23C34DCE0();
      __swift_project_value_buffer(v12, (uint64_t)qword_256B7FF10);
      v13 = sub_23C34DCC8();
      v14 = sub_23C34EA3C();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_23C27A000, v13, v14, "Archived Sessions Updated — refreshing", v15, 2u);
        MEMORY[0x24261C708](v15, -1, -1);
      }
      v16 = *(int **)(v0 + 120);

      v19 = (uint64_t (*)(uint64_t))((char *)v16 + *v16);
      v17 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 192) = v17;
      *v17 = v0;
      v17[1] = sub_23C33CE80;
      return v19(v11);
    }
    else
    {
      swift_release();
      *(_QWORD *)(v0 + 168) = sub_23C34E958();
      v18 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 176) = v18;
      *v18 = v0;
      v18[1] = sub_23C33CB68;
      return sub_23C34E9A0();
    }
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23C33CE80()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C33CED4()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 168) = sub_23C34E958();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 176) = v1;
  *v1 = v0;
  v1[1] = sub_23C33CB68;
  return sub_23C34E9A0();
}

uint64_t sub_23C33CF54()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C33CFA0(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t);

  v4[2] = a1;
  v4[3] = type metadata accessor for ProgramDetailAction();
  v4[4] = swift_task_alloc();
  v4[5] = sub_23C34E964();
  v4[6] = sub_23C34E958();
  v10 = (uint64_t (*)(uint64_t, uint64_t))(*(int *)*a2 + *a2);
  v8 = (_QWORD *)swift_task_alloc();
  v4[7] = v8;
  *v8 = v4;
  v8[1] = sub_23C33D054;
  return v10(a3, a4);
}

uint64_t sub_23C33D054()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 64) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 72) = sub_23C34E940();
  *(_QWORD *)(v2 + 80) = v3;
  return swift_task_switch();
}

uint64_t sub_23C33D0E0()
{
  uint64_t v0;
  _QWORD *v1;

  **(_BYTE **)(v0 + 32) = 0;
  swift_storeEnumTagMultiPayload();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CE30);
  *v1 = v0;
  v1[1] = sub_23C33D154;
  return sub_23C34E76C();
}

uint64_t sub_23C33D154()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 32);
  swift_task_dealloc();
  sub_23C283550(v1, (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailAction);
  return swift_task_switch();
}

uint64_t sub_23C33D1B4()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C33D1F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[2] = a2;
  v3[3] = a3;
  sub_23C34E964();
  v3[4] = sub_23C34E958();
  sub_23C34E940();
  return swift_task_switch();
}

uint64_t sub_23C33D260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 16);
  swift_release();
  (*(void (**)(uint64_t))(v2 + 80))(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C33D2A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t);

  v4[2] = sub_23C34E964();
  v4[3] = sub_23C34E958();
  v10 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 64) + *(_QWORD *)(a2 + 64));
  v8 = (_QWORD *)swift_task_alloc();
  v4[4] = v8;
  *v8 = v4;
  v8[1] = sub_23C2FB910;
  return v10(a3, a4);
}

uint64_t sub_23C33D330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t);

  v4[2] = a1;
  v4[3] = type metadata accessor for ProgramDetailAction();
  v4[4] = swift_task_alloc();
  v4[5] = sub_23C34E964();
  v4[6] = sub_23C34E958();
  v10 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 144) + *(_QWORD *)(a2 + 144));
  v8 = (_QWORD *)swift_task_alloc();
  v4[7] = v8;
  *v8 = v4;
  v8[1] = sub_23C33D3E4;
  return v10(a3, a4);
}

uint64_t sub_23C33D3E4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 64) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 72) = sub_23C34E940();
  *(_QWORD *)(v2 + 80) = v3;
  return swift_task_switch();
}

uint64_t sub_23C33D470()
{
  uint64_t v0;
  _QWORD *v1;

  **(_BYTE **)(v0 + 32) = 1;
  swift_storeEnumTagMultiPayload();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CE30);
  *v1 = v0;
  v1[1] = sub_23C33C5FC;
  return sub_23C34E76C();
}

uint64_t sub_23C33D4E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[3] = a3;
  v4[4] = a4;
  v4[2] = a2;
  sub_23C34E964();
  v4[5] = sub_23C34E958();
  v4[6] = sub_23C34E940();
  v4[7] = v5;
  return swift_task_switch();
}

uint64_t sub_23C33D558()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v1 = v0[3];
  v2 = v0[4];
  v3 = *(int **)(v0[2] + 112);
  v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for WorkoutProgram() + 24));
  v5 = *v4;
  v6 = v4[1];
  v7 = v2 + *(int *)(type metadata accessor for WorkoutProgramPreview() + 20);
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v3 + *v3);
  v8 = (_QWORD *)swift_task_alloc();
  v0[8] = v8;
  *v8 = v0;
  v8[1] = sub_23C33D5F4;
  return v10(v5, v6, v7);
}

uint64_t sub_23C33D5F4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C33D654()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C33D688()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;

  v1 = (int *)type metadata accessor for WorkoutProgram();
  v2 = *((_QWORD *)v1 - 1);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 176) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v22 = *(_QWORD *)(v2 + 64);
  v4 = type metadata accessor for WorkoutProgramPreview();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
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
  v23 = v3;
  v7 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
  if (swift_getEnumCaseMultiPayload() == 1)
    v8 = (uint64_t *)&unk_256B5A3E8;
  else
    v8 = (uint64_t *)&unk_256B5A3E0;
  v9 = __swift_instantiateConcreteTypeFromMangledName(v8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v7, v9);
  v10 = v7 + v1[5];
  v11 = sub_23C34D86C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  v13(v10, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = v7 + v1[8];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v14, 1, v4))
  {
    swift_bridgeObjectRelease();
    v15 = v14 + *(int *)(v4 + 20);
    v16 = sub_23C34D950();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  }
  v24 = v4;
  v17 = v7 + v1[9];
  v18 = sub_23C34D950();
  v19 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8);
  v19(v17, v18);
  v20 = v7 + v1[10];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v20, 1, v11))
    v13(v20, v11);
  v13(v7 + v1[11], v11);
  v13(v7 + v1[12], v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v19(v0 + ((v23 + v22 + v6) & ~v6) + *(int *)(v24 + 20), v18);
  return swift_deallocObject();
}

uint64_t sub_23C33D910(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(type metadata accessor for WorkoutProgram() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 176) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for WorkoutProgramPreview() - 8) + 80);
  v8 = v5 + v6 + v7;
  v9 = v1 + 16;
  v10 = v1 + v5;
  v11 = v1 + (v8 & ~v7);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_23C2D2F88;
  return sub_23C33D4E8(a1, v9, v10, v11);
}

uint64_t sub_23C33D9B4(uint64_t a1)
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
  return a1;
}

uint64_t sub_23C33DA74(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1 + 16;
  v6 = *(_QWORD *)(v1 + 176);
  v5 = *(_QWORD *)(v1 + 184);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23C2D2F88;
  return sub_23C33D330(a1, v4, v6, v5);
}

uint64_t sub_23C33DAE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1 + 16;
  v6 = *(_QWORD *)(v1 + 176);
  v5 = *(_QWORD *)(v1 + 184);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23C2D2F88;
  return sub_23C33D2A4(a1, v4, v6, v5);
}

uint64_t sub_23C33DB48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_23C34D950();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 176) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
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
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23C33DC04(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_23C34D950() - 8) + 80);
  v5 = v1 + 16;
  v6 = v1 + ((v4 + 176) & ~v4);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23C2D2F88;
  return sub_23C33D1F4(a1, v5, v6);
}

uint64_t sub_23C33DC84(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1 + 2;
  v6 = v1[22];
  v5 = v1[23];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23C2D2F88;
  return sub_23C33CFA0(a1, v4, v6, v5);
}

uint64_t sub_23C33DCEC()
{
  uint64_t v0;
  int *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = (int *)type metadata accessor for WorkoutProgram();
  v2 = (*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80) + 176) & ~(unint64_t)*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
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
  v3 = v0 + v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A360);
  if (swift_getEnumCaseMultiPayload() == 1)
    v4 = (uint64_t *)&unk_256B5A3E8;
  else
    v4 = (uint64_t *)&unk_256B5A3E0;
  v5 = __swift_instantiateConcreteTypeFromMangledName(v4);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v0 + v2, v5);
  v6 = v3 + v1[5];
  v7 = sub_23C34D86C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v9(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = v3 + v1[8];
  v11 = type metadata accessor for WorkoutProgramPreview();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v10, 1, v11))
  {
    swift_bridgeObjectRelease();
    v12 = v10 + *(int *)(v11 + 20);
    v13 = sub_23C34D950();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  }
  v14 = v3 + v1[9];
  v15 = sub_23C34D950();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  v16 = v3 + v1[10];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v16, 1, v7))
    v9(v16, v7);
  v9(v3 + v1[11], v7);
  v9(v3 + v1[12], v7);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C33DF20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for WorkoutProgram() - 8) + 80);
  v5 = v1 + 16;
  v6 = v1 + ((v4 + 176) & ~v4);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23C2D2F88;
  return sub_23C33C950(a1, v5, v6);
}

uint64_t sub_23C33DFA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1 + 16;
  v6 = *(_QWORD *)(v1 + 176);
  v5 = *(_QWORD *)(v1 + 184);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23C2D2F88;
  return sub_23C33C434(a1, v4, v6, v5);
}

uint64_t objectdestroy_3Tm()
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
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C33E080(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1 + 16;
  v6 = *(_QWORD *)(v1 + 176);
  v5 = *(_QWORD *)(v1 + 184);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23C2A1EC8;
  return sub_23C33C69C(a1, v4, v6, v5);
}

uint64_t sub_23C33E0E8()
{
  return sub_23C27FEE4(&qword_256B5CD60, (uint64_t (*)(uint64_t))type metadata accessor for ProgramDetailAction, (uint64_t)&protocol conformance descriptor for ProgramDetailAction);
}

uint64_t sub_23C33E114()
{
  return sub_23C27FEE4(&qword_256B5CD68, (uint64_t (*)(uint64_t))type metadata accessor for ProgramDetailAction, (uint64_t)&protocol conformance descriptor for ProgramDetailAction);
}

uint64_t sub_23C33E140()
{
  return sub_23C27FEE4(&qword_256B5CD70, (uint64_t (*)(uint64_t))type metadata accessor for ProgramDetailState, (uint64_t)&protocol conformance descriptor for ProgramDetailState);
}

ValueMetadata *type metadata accessor for ProgramDetailFeature()
{
  return &type metadata for ProgramDetailFeature;
}

uint64_t *sub_23C33E17C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

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
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
        v7 = a2[1];
        *a1 = *a2;
        a1[1] = v7;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        v10 = sub_23C34D950();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        v11 = a2[1];
        *a1 = *a2;
        a1[1] = v11;
        swift_bridgeObjectRetain();
        v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B5CCD0) + 48);
        v13 = (char *)a1 + v12;
        v14 = (char *)a2 + v12;
        v15 = sub_23C34D950();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_23C33E2E4(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
      result = swift_bridgeObjectRelease();
      break;
    case 2:
      goto LABEL_4;
    case 3:
      swift_bridgeObjectRelease();
      a1 += *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B5CCD0) + 48);
LABEL_4:
      v3 = sub_23C34D950();
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

_QWORD *sub_23C33E378(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
      v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
      goto LABEL_6;
    case 2u:
      v7 = sub_23C34D950();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      goto LABEL_6;
    case 3u:
      v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B5CCD0) + 48);
      v10 = (char *)a1 + v9;
      v11 = (char *)a2 + v9;
      v12 = sub_23C34D950();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
LABEL_6:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_QWORD *sub_23C33E4AC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  if (a1 != a2)
  {
    sub_23C283550((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_7;
      case 2u:
        v6 = sub_23C34D950();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
        goto LABEL_7;
      case 3u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B5CCD0) + 48);
        v8 = (char *)a1 + v7;
        v9 = (char *)a2 + v7;
        v10 = sub_23C34D950();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
LABEL_7:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

_OWORD *sub_23C33E610(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    *a1 = *a2;
    v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B5CCD0) + 48);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23C34D950();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 2)
  {
    v7 = sub_23C34D950();
    (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

_OWORD *sub_23C33E6F8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  if (a1 != a2)
  {
    sub_23C283550((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      *a1 = *a2;
      v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B5CCD0) + 48);
      v9 = (char *)a1 + v8;
      v10 = (char *)a2 + v8;
      v11 = sub_23C34D950();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 2)
    {
      v7 = sub_23C34D950();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_23C33E7F8()
{
  uint64_t result;
  unint64_t v1;
  _QWORD v2[8];

  v2[4] = &unk_23C35F618;
  v2[5] = &unk_23C35F618;
  result = sub_23C34D950();
  if (v1 <= 0x3F)
  {
    v2[6] = *(_QWORD *)(result - 8) + 64;
    swift_getTupleTypeLayout2();
    v2[7] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_23C33E880()
{
  return sub_23C27FEE4(&qword_256B5CE20, (uint64_t (*)(uint64_t))type metadata accessor for ProgramDetailFeature.TaskIdentifier, (uint64_t)&unk_23C35F630);
}

uint64_t sub_23C33E8AC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_23C34EC7C();
  swift_bridgeObjectRetain();
  sub_23C34E8B0();
  v8 = sub_23C34ECAC();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23C34EC64() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_23C34EC64() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23C33F684(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_23C33EA58()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CE48);
  v3 = sub_23C34EA90();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_23C34EC7C();
      sub_23C34E8B0();
      result = sub_23C34ECAC();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23C33ED34(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3;
  char v4;
  unint64_t v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_BYTE *)(a2 + 32);
  v5 = (unint64_t)((1 << v4) + 63) >> 6;
  v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    v7 = sub_23C33EEB4((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    v7 = sub_23C33EEB4((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x24261C708](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_23C33EEB4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t v28;
  unint64_t i;
  unint64_t v30;
  _QWORD *v31;
  BOOL v32;
  BOOL v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  int64_t v41;
  unint64_t v42;
  int64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  BOOL v52;
  uint64_t v53;
  _QWORD *v54;
  BOOL v55;
  unint64_t *v57;
  uint64_t v58;
  int64_t v59;
  uint64_t v60;
  uint64_t v61;
  int64_t v62;
  int64_t v63;

  v4 = a4;
  v5 = a3;
  v57 = (unint64_t *)result;
  if (*(_QWORD *)(a4 + 16) < *(_QWORD *)(a3 + 16))
  {
    v6 = 0;
    v58 = a4 + 56;
    v7 = 1 << *(_BYTE *)(a4 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(a4 + 56);
    v59 = (unint64_t)(v7 + 63) >> 6;
    v61 = 0;
    v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          v62 = v6;
          v12 = v11 | (v6 << 6);
        }
        else
        {
          v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_81;
          }
          if (v13 >= v59)
            goto LABEL_79;
          v14 = *(_QWORD *)(v58 + 8 * v13);
          v15 = v6 + 1;
          if (!v14)
          {
            v15 = v6 + 2;
            if (v6 + 2 >= v59)
              goto LABEL_79;
            v14 = *(_QWORD *)(v58 + 8 * v15);
            if (!v14)
            {
              v15 = v6 + 3;
              if (v6 + 3 >= v59)
                goto LABEL_79;
              v14 = *(_QWORD *)(v58 + 8 * v15);
              if (!v14)
              {
                v16 = v6 + 4;
                if (v6 + 4 >= v59)
                  goto LABEL_79;
                v14 = *(_QWORD *)(v58 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    v15 = v16 + 1;
                    if (__OFADD__(v16, 1))
                      goto LABEL_83;
                    if (v15 >= v59)
                      goto LABEL_79;
                    v14 = *(_QWORD *)(v58 + 8 * v15);
                    ++v16;
                    if (v14)
                      goto LABEL_22;
                  }
                }
                v15 = v6 + 4;
              }
            }
          }
LABEL_22:
          v9 = (v14 - 1) & v14;
          v62 = v15;
          v12 = __clz(__rbit64(v14)) + (v15 << 6);
        }
        v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v12);
        v19 = *v17;
        v18 = v17[1];
        sub_23C34EC7C();
        swift_bridgeObjectRetain();
        sub_23C34E8B0();
        v20 = sub_23C34ECAC();
        v21 = -1 << *(_BYTE *)(v5 + 32);
        v22 = v20 & ~v21;
        v23 = v22 >> 6;
        v24 = 1 << v22;
        if (((1 << v22) & *(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
          break;
LABEL_6:
        result = swift_bridgeObjectRelease();
        v6 = v62;
        v5 = a3;
        v4 = a4;
      }
      v25 = *(_QWORD *)(a3 + 48);
      v26 = (_QWORD *)(v25 + 16 * v22);
      v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (sub_23C34EC64() & 1) == 0)
      {
        v28 = ~v21;
        for (i = v22 + 1; ; i = v30 + 1)
        {
          v30 = i & v28;
          if (((*(_QWORD *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0)
            break;
          v31 = (_QWORD *)(v25 + 16 * v30);
          v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (sub_23C34EC64() & 1) != 0)
          {
            result = swift_bridgeObjectRelease();
            v23 = v30 >> 6;
            v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      result = swift_bridgeObjectRelease();
LABEL_38:
      v6 = v62;
      v5 = a3;
      v57[v23] |= v24;
      v33 = __OFADD__(v61++, 1);
      v4 = a4;
      if (v33)
        goto LABEL_82;
    }
  }
  v34 = 0;
  v60 = a3 + 56;
  v61 = 0;
  v35 = 1 << *(_BYTE *)(a3 + 32);
  if (v35 < 64)
    v36 = ~(-1 << v35);
  else
    v36 = -1;
  v37 = v36 & *(_QWORD *)(a3 + 56);
  v63 = (unint64_t)(v35 + 63) >> 6;
  v38 = a4 + 56;
  while (1)
  {
    if (v37)
    {
      v39 = __clz(__rbit64(v37));
      v37 &= v37 - 1;
      v40 = v39 | (v34 << 6);
      goto LABEL_63;
    }
    v41 = v34 + 1;
    if (__OFADD__(v34, 1))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    if (v41 >= v63)
      goto LABEL_79;
    v42 = *(_QWORD *)(v60 + 8 * v41);
    ++v34;
    if (!v42)
    {
      v34 = v41 + 1;
      if (v41 + 1 >= v63)
        goto LABEL_79;
      v42 = *(_QWORD *)(v60 + 8 * v34);
      if (!v42)
      {
        v34 = v41 + 2;
        if (v41 + 2 >= v63)
          goto LABEL_79;
        v42 = *(_QWORD *)(v60 + 8 * v34);
        if (!v42)
          break;
      }
    }
LABEL_62:
    v37 = (v42 - 1) & v42;
    v40 = __clz(__rbit64(v42)) + (v34 << 6);
LABEL_63:
    v44 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v40);
    v46 = *v44;
    v45 = v44[1];
    sub_23C34EC7C();
    swift_bridgeObjectRetain();
    sub_23C34E8B0();
    v47 = sub_23C34ECAC();
    v48 = -1 << *(_BYTE *)(v4 + 32);
    v49 = v47 & ~v48;
    if (((*(_QWORD *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFF8)) >> v49) & 1) == 0)
      goto LABEL_46;
    v50 = *(_QWORD *)(a4 + 48);
    v51 = (_QWORD *)(v50 + 16 * v49);
    v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (sub_23C34EC64() & 1) != 0)
    {
LABEL_76:
      result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      v33 = __OFADD__(v61++, 1);
      v5 = a3;
      v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_23C33F3F0(v57, a2, v61, v5);
      }
    }
    else
    {
      v53 = ~v48;
      while (1)
      {
        v49 = (v49 + 1) & v53;
        if (((*(_QWORD *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFF8)) >> v49) & 1) == 0)
          break;
        v54 = (_QWORD *)(v50 + 16 * v49);
        v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (sub_23C34EC64() & 1) != 0)
          goto LABEL_76;
      }
LABEL_46:
      result = swift_bridgeObjectRelease();
      v5 = a3;
      v4 = a4;
    }
  }
  v43 = v41 + 3;
  if (v43 >= v63)
    goto LABEL_79;
  v42 = *(_QWORD *)(v60 + 8 * v43);
  if (v42)
  {
    v34 = v43;
    goto LABEL_62;
  }
  while (1)
  {
    v34 = v43 + 1;
    if (__OFADD__(v43, 1))
      break;
    if (v34 >= v63)
      goto LABEL_79;
    v42 = *(_QWORD *)(v60 + 8 * v34);
    ++v43;
    if (v42)
      goto LABEL_62;
  }
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_23C33F3F0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CE48);
  result = sub_23C34EA9C();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    sub_23C34EC7C();
    swift_bridgeObjectRetain();
    sub_23C34E8B0();
    result = sub_23C34ECAC();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_23C33F684(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_23C33EA58();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_23C33F81C();
      goto LABEL_22;
    }
    sub_23C33F9CC();
  }
  v11 = *v4;
  sub_23C34EC7C();
  sub_23C34E8B0();
  result = sub_23C34ECAC();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_23C34EC64(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_23C34EC70();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_23C34EC64();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_23C33F81C()
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
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CE48);
  v2 = *v0;
  v3 = sub_23C34EA84();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23C33F9CC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CE48);
  v3 = sub_23C34EA90();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_23C34EC7C();
    swift_bridgeObjectRetain();
    sub_23C34E8B0();
    result = sub_23C34ECAC();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_23C33FC78(uint64_t a1, uint64_t a2)
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
  char *v17;
  char *v18;
  _QWORD v19[6];

  v4 = sub_23C34D950();
  v19[4] = *(_QWORD *)(v4 - 8);
  v19[5] = v4;
  MEMORY[0x24BDAC7A8](v4);
  v19[3] = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v19[2] = (char *)v19 - v7;
  MEMORY[0x24BDAC7A8](v8);
  v19[1] = (char *)v19 - v9;
  v10 = type metadata accessor for ProgramDetailFeature.TaskIdentifier();
  MEMORY[0x24BDAC7A8](v10);
  MEMORY[0x24BDAC7A8](v11);
  MEMORY[0x24BDAC7A8](v12);
  MEMORY[0x24BDAC7A8](v13);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CE28);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v19 + *(int *)(v16 + 48) - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C282F90(a1, (uint64_t)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
  sub_23C282F90(a2, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
  v18 = (char *)sub_23C33FE38 + 4 * byte_23C35F57E[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23C33FE38()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  char v7;

  sub_23C282F90(v0, (uint64_t)v2, (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
  v4 = *v2;
  v3 = v2[1];
  if (!swift_getEnumCaseMultiPayload())
  {
    if (v4 == *v1 && v3 == v1[1])
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v6 = sub_23C34EC64();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v6 & 1) == 0)
      {
        sub_23C283550(v0, (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
        goto LABEL_9;
      }
    }
    sub_23C283550(v0, (uint64_t (*)(_QWORD))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
    v7 = 1;
    return v7 & 1;
  }
  swift_bridgeObjectRelease();
  sub_23C285184(v0, &qword_256B5CE28);
LABEL_9:
  v7 = 0;
  return v7 & 1;
}

uint64_t WorkoutContextMenuPreviewContent.init(artwork:title:subtitle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;

  sub_23C2894C8(a1, a4, &qword_256B58908);
  v7 = type metadata accessor for WorkoutContextMenuPreviewContent();
  sub_23C2894C8(a2, a4 + *(int *)(v7 + 20), &qword_256B58910);
  return sub_23C2894C8(a3, a4 + *(int *)(v7 + 24), &qword_256B58910);
}

uint64_t sub_23C3401EC(char a1)
{
  return *(_QWORD *)&aArtwork_4[8 * a1];
}

uint64_t sub_23C34020C()
{
  char *v0;

  return sub_23C3401EC(*v0);
}

uint64_t sub_23C340214@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C34300C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C340238()
{
  sub_23C341D88();
  return sub_23C34ECD0();
}

uint64_t sub_23C340260()
{
  sub_23C341D88();
  return sub_23C34ECDC();
}

uint64_t WorkoutContextMenuPreviewContent.hash(into:)()
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
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int (*v18)(char *, uint64_t, uint64_t);
  char *v19;
  uint64_t v20;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;

  v1 = v0;
  v2 = sub_23C34D86C();
  v26 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v25 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
  MEMORY[0x24BDAC7A8](v4);
  v24 = (uint64_t)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v23 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B588F0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58908);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C28950C(v1, (uint64_t)v15, &qword_256B58908);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v15, 1, v9) == 1)
  {
    sub_23C34EC94();
  }
  else
  {
    sub_23C2894C8((uint64_t)v15, (uint64_t)v12, &qword_256B588F0);
    sub_23C34EC94();
    sub_23C34DAAC();
    sub_23C285184((uint64_t)v12, &qword_256B588F0);
  }
  v16 = type metadata accessor for WorkoutContextMenuPreviewContent();
  sub_23C28950C(v1 + *(int *)(v16 + 20), (uint64_t)v8, &qword_256B58910);
  v17 = v26;
  v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
  if (v18(v8, 1, v2) == 1)
  {
    sub_23C34EC94();
  }
  else
  {
    v19 = v25;
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v25, v8, v2);
    sub_23C34EC94();
    sub_23C27FEE4(&qword_256B58308, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5C0]);
    sub_23C34E838();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v2);
  }
  v20 = v24;
  sub_23C28950C(v1 + *(int *)(v16 + 24), v24, &qword_256B58910);
  if (v18((char *)v20, 1, v2) == 1)
    return sub_23C34EC94();
  v22 = v25;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(v25, v20, v2);
  sub_23C34EC94();
  sub_23C27FEE4(&qword_256B58308, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5C0]);
  sub_23C34E838();
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v22, v2);
}

uint64_t WorkoutContextMenuPreviewContent.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  char v9;
  char v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CE50);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C341D88();
  sub_23C34ECC4();
  v11 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B588F0);
  sub_23C341DCC(&qword_256B5CE60, MEMORY[0x24BE35058]);
  sub_23C34EC04();
  if (!v1)
  {
    type metadata accessor for WorkoutContextMenuPreviewContent();
    v10 = 1;
    sub_23C34D86C();
    sub_23C27FEE4(&qword_256B582E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5B8]);
    sub_23C34EC04();
    v9 = 2;
    sub_23C34EC04();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t WorkoutContextMenuPreviewContent.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  char *v20;
  char *v21;
  uint64_t v23;
  char *v24;
  uint64_t v25;

  v1 = v0;
  v2 = sub_23C34D86C();
  v25 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v24 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v23 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B588F0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58908);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C34EC7C();
  sub_23C28950C(v1, (uint64_t)v16, &qword_256B58908);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v16, 1, v10) == 1)
  {
    sub_23C34EC94();
  }
  else
  {
    sub_23C2894C8((uint64_t)v16, (uint64_t)v13, &qword_256B588F0);
    sub_23C34EC94();
    sub_23C34DAAC();
    sub_23C285184((uint64_t)v13, &qword_256B588F0);
  }
  v17 = type metadata accessor for WorkoutContextMenuPreviewContent();
  sub_23C28950C(v1 + *(int *)(v17 + 20), (uint64_t)v9, &qword_256B58910);
  v18 = v25;
  v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
  if (v19(v9, 1, v2) == 1)
  {
    sub_23C34EC94();
  }
  else
  {
    v20 = v24;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v24, v9, v2);
    sub_23C34EC94();
    sub_23C27FEE4(&qword_256B58308, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5C0]);
    sub_23C34E838();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v2);
  }
  sub_23C28950C(v1 + *(int *)(v17 + 24), (uint64_t)v6, &qword_256B58910);
  if (v19(v6, 1, v2) == 1)
  {
    sub_23C34EC94();
  }
  else
  {
    v21 = v24;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v24, v6, v2);
    sub_23C34EC94();
    sub_23C27FEE4(&qword_256B58308, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5C0]);
    sub_23C34E838();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v2);
  }
  return sub_23C34ECAC();
}

uint64_t WorkoutContextMenuPreviewContent.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  _QWORD *v31;
  char *v32;
  char v33;
  char v34;
  char v35;

  v27 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v27 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58908);
  MEMORY[0x24BDAC7A8](v9);
  v28 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CE68);
  v11 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for WorkoutContextMenuPreviewContent();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = a1[3];
  v31 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  sub_23C341D88();
  v30 = v13;
  v18 = v32;
  sub_23C34ECB8();
  if (v18)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  v19 = (uint64_t)v16;
  v32 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B588F0);
  v35 = 0;
  sub_23C341DCC(&qword_256B5CE70, MEMORY[0x24BE35060]);
  v20 = v28;
  v21 = v29;
  sub_23C34EB74();
  v22 = (uint64_t)v20;
  v23 = v19;
  sub_23C2894C8(v22, v19, &qword_256B58908);
  sub_23C34D86C();
  v34 = 1;
  v28 = (char *)sub_23C27FEE4(&qword_256B58300, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5D0]);
  sub_23C34EB74();
  sub_23C2894C8((uint64_t)v8, v19 + *(int *)(v14 + 20), &qword_256B58910);
  v33 = 2;
  v24 = (uint64_t)v32;
  v25 = v30;
  sub_23C34EB74();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v25, v21);
  sub_23C2894C8(v24, v23 + *(int *)(v14 + 24), &qword_256B58910);
  sub_23C341E10(v23, v27);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  return sub_23C29D6E4(v23);
}

uint64_t sub_23C340E50@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return WorkoutContextMenuPreviewContent.init(from:)(a1, a2);
}

uint64_t sub_23C340E64(_QWORD *a1)
{
  return WorkoutContextMenuPreviewContent.encode(to:)(a1);
}

uint64_t sub_23C340E7C(uint64_t a1, uint64_t a2)
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  char *v21;
  uint64_t v22;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;

  v26 = a2;
  v3 = v2;
  v4 = sub_23C34D86C();
  v28 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v27 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
  MEMORY[0x24BDAC7A8](v6);
  v25 = (uint64_t)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v25 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B588F0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58908);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C28950C(v3, (uint64_t)v17, &qword_256B58908);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v17, 1, v11) == 1)
  {
    sub_23C34EC94();
  }
  else
  {
    sub_23C2894C8((uint64_t)v17, (uint64_t)v14, &qword_256B588F0);
    sub_23C34EC94();
    sub_23C34DAAC();
    sub_23C285184((uint64_t)v14, &qword_256B588F0);
  }
  v18 = v26;
  sub_23C28950C(v3 + *(int *)(v26 + 20), (uint64_t)v10, &qword_256B58910);
  v19 = v28;
  v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
  if (v20(v10, 1, v4) == 1)
  {
    sub_23C34EC94();
  }
  else
  {
    v21 = v27;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v27, v10, v4);
    sub_23C34EC94();
    sub_23C27FEE4(&qword_256B58308, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5C0]);
    sub_23C34E838();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v4);
  }
  v22 = v25;
  sub_23C28950C(v3 + *(int *)(v18 + 24), v25, &qword_256B58910);
  if (v20((char *)v22, 1, v4) == 1)
    return sub_23C34EC94();
  v24 = v27;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(v27, v22, v4);
  sub_23C34EC94();
  sub_23C27FEE4(&qword_256B58308, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5C0]);
  sub_23C34E838();
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v24, v4);
}

uint64_t sub_23C3411B4(uint64_t a1, uint64_t a2)
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  char *v21;
  char *v22;
  uint64_t v24;
  char *v25;
  uint64_t v26;

  v24 = a2;
  v3 = sub_23C34D86C();
  v26 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v25 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v24 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B588F0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58908);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C34EC7C();
  sub_23C28950C(v2, (uint64_t)v17, &qword_256B58908);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v17, 1, v11) == 1)
  {
    sub_23C34EC94();
  }
  else
  {
    sub_23C2894C8((uint64_t)v17, (uint64_t)v14, &qword_256B588F0);
    sub_23C34EC94();
    sub_23C34DAAC();
    sub_23C285184((uint64_t)v14, &qword_256B588F0);
  }
  v18 = v24;
  sub_23C28950C(v2 + *(int *)(v24 + 20), (uint64_t)v10, &qword_256B58910);
  v19 = v26;
  v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
  if (v20(v10, 1, v3) == 1)
  {
    sub_23C34EC94();
  }
  else
  {
    v21 = v25;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v25, v10, v3);
    sub_23C34EC94();
    sub_23C27FEE4(&qword_256B58308, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5C0]);
    sub_23C34E838();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v3);
  }
  sub_23C28950C(v2 + *(int *)(v18 + 24), (uint64_t)v7, &qword_256B58910);
  if (v20(v7, 1, v3) == 1)
  {
    sub_23C34EC94();
  }
  else
  {
    v22 = v25;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v25, v7, v3);
    sub_23C34EC94();
    sub_23C27FEE4(&qword_256B58308, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5C0]);
    sub_23C34E838();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v3);
  }
  return sub_23C34ECAC();
}

BOOL _s20FitnessProductDetail32WorkoutContextMenuPreviewContentV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
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
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  unsigned int (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE *v42;
  _BYTE *v43;
  _BYTE *v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int (*v47)(uint64_t, uint64_t, uint64_t);
  uint64_t v48;
  _BYTE *v49;
  uint64_t v50;
  _BYTE *v51;
  uint64_t v52;
  void (*v53)(_BYTE *, uint64_t);
  uint64_t v54;
  _BYTE *v55;
  uint64_t v56;
  _BYTE *v57;
  _BYTE *v58;
  uint64_t v59;
  _BYTE *v60;
  uint64_t v62;
  uint64_t v63;
  _BYTE *v64;
  char v65;
  void (*v66)(_BYTE *, uint64_t);
  _BYTE v67[12];
  int v68;
  _BYTE *v69;
  _BYTE *v70;
  _BYTE *v71;
  _BYTE *v72;
  _BYTE *v73;
  _BYTE *v74;
  _BYTE *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _BYTE *v79;
  _BYTE *v80;
  uint64_t v81;
  uint64_t v82;

  v82 = a2;
  v78 = sub_23C34D86C();
  v81 = *(_QWORD *)(v78 - 8);
  MEMORY[0x24BDAC7A8](v78);
  v70 = &v67[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5A4D8);
  v4 = MEMORY[0x24BDAC7A8](v76);
  v73 = &v67[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v75 = &v67[-v6];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v69 = &v67[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = MEMORY[0x24BDAC7A8](v8);
  v71 = &v67[-v11];
  v12 = MEMORY[0x24BDAC7A8](v10);
  v72 = &v67[-v13];
  v14 = MEMORY[0x24BDAC7A8](v12);
  v74 = &v67[-v15];
  v16 = MEMORY[0x24BDAC7A8](v14);
  v79 = &v67[-v17];
  MEMORY[0x24BDAC7A8](v16);
  v80 = &v67[-v18];
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B588F0);
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = &v67[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CF38);
  MEMORY[0x24BDAC7A8](v23);
  v25 = &v67[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58908);
  v27 = MEMORY[0x24BDAC7A8](v26);
  v29 = &v67[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v30 = MEMORY[0x24BDAC7A8](v27);
  v32 = &v67[-v31];
  MEMORY[0x24BDAC7A8](v30);
  v34 = &v67[-v33];
  v77 = a1;
  sub_23C28950C(a1, (uint64_t)&v67[-v33], &qword_256B58908);
  sub_23C28950C(v82, (uint64_t)v32, &qword_256B58908);
  v35 = (uint64_t)&v25[*(int *)(v23 + 48)];
  sub_23C28950C((uint64_t)v34, (uint64_t)v25, &qword_256B58908);
  sub_23C28950C((uint64_t)v32, v35, &qword_256B58908);
  v36 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48);
  if (v36((uint64_t)v25, 1, v19) == 1)
  {
    sub_23C285184((uint64_t)v32, &qword_256B58908);
    sub_23C285184((uint64_t)v34, &qword_256B58908);
    if (v36(v35, 1, v19) == 1)
    {
      sub_23C285184((uint64_t)v25, &qword_256B58908);
      goto LABEL_8;
    }
LABEL_6:
    v37 = &qword_256B5CF38;
    v38 = (uint64_t)v25;
LABEL_21:
    sub_23C285184(v38, v37);
    return 0;
  }
  sub_23C28950C((uint64_t)v25, (uint64_t)v29, &qword_256B58908);
  if (v36(v35, 1, v19) == 1)
  {
    sub_23C285184((uint64_t)v32, &qword_256B58908);
    sub_23C285184((uint64_t)v34, &qword_256B58908);
    sub_23C285184((uint64_t)v29, &qword_256B588F0);
    goto LABEL_6;
  }
  sub_23C2894C8(v35, (uint64_t)v22, &qword_256B588F0);
  type metadata accessor for WorkoutContextMenuPreviewArtwork();
  sub_23C27FEE4(&qword_256B5CF40, (uint64_t (*)(uint64_t))type metadata accessor for WorkoutContextMenuPreviewArtwork, (uint64_t)&protocol conformance descriptor for WorkoutContextMenuPreviewArtwork);
  v39 = sub_23C34DAA0();
  sub_23C285184((uint64_t)v22, &qword_256B588F0);
  sub_23C285184((uint64_t)v32, &qword_256B58908);
  sub_23C285184((uint64_t)v34, &qword_256B58908);
  sub_23C285184((uint64_t)v29, &qword_256B588F0);
  sub_23C285184((uint64_t)v25, &qword_256B58908);
  if ((v39 & 1) == 0)
    return 0;
LABEL_8:
  v40 = type metadata accessor for WorkoutContextMenuPreviewContent();
  v41 = v77;
  v42 = v80;
  sub_23C28950C(v77 + *(int *)(v40 + 20), (uint64_t)v80, &qword_256B58910);
  v43 = v79;
  sub_23C28950C(v82 + *(int *)(v40 + 20), (uint64_t)v79, &qword_256B58910);
  v44 = v75;
  v45 = v76;
  v46 = (uint64_t)&v75[*(int *)(v76 + 48)];
  sub_23C28950C((uint64_t)v42, (uint64_t)v75, &qword_256B58910);
  sub_23C28950C((uint64_t)v43, v46, &qword_256B58910);
  v47 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v81 + 48);
  v48 = v78;
  if (v47((uint64_t)v44, 1, v78) != 1)
  {
    v49 = v74;
    sub_23C28950C((uint64_t)v44, (uint64_t)v74, &qword_256B58910);
    if (v47(v46, 1, v48) != 1)
    {
      v50 = v81;
      v51 = v70;
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v81 + 32))(v70, v46, v48);
      sub_23C27FEE4(&qword_256B5A4E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5C8]);
      v68 = sub_23C34E850();
      v52 = (uint64_t)v44;
      v53 = *(void (**)(_BYTE *, uint64_t))(v50 + 8);
      v53(v51, v48);
      sub_23C285184((uint64_t)v79, &qword_256B58910);
      sub_23C285184((uint64_t)v80, &qword_256B58910);
      v53(v49, v48);
      sub_23C285184(v52, &qword_256B58910);
      if ((v68 & 1) == 0)
        return 0;
      goto LABEL_15;
    }
    sub_23C285184((uint64_t)v79, &qword_256B58910);
    sub_23C285184((uint64_t)v80, &qword_256B58910);
    (*(void (**)(_BYTE *, uint64_t))(v81 + 8))(v49, v48);
    goto LABEL_13;
  }
  sub_23C285184((uint64_t)v43, &qword_256B58910);
  sub_23C285184((uint64_t)v42, &qword_256B58910);
  if (v47(v46, 1, v48) != 1)
  {
LABEL_13:
    v37 = &qword_256B5A4D8;
    v38 = (uint64_t)v44;
    goto LABEL_21;
  }
  sub_23C285184((uint64_t)v44, &qword_256B58910);
LABEL_15:
  v54 = v41 + *(int *)(v40 + 24);
  v55 = v72;
  sub_23C28950C(v54, (uint64_t)v72, &qword_256B58910);
  v56 = v82 + *(int *)(v40 + 24);
  v57 = v71;
  sub_23C28950C(v56, (uint64_t)v71, &qword_256B58910);
  v58 = v73;
  v59 = (uint64_t)&v73[*(int *)(v45 + 48)];
  sub_23C28950C((uint64_t)v55, (uint64_t)v73, &qword_256B58910);
  sub_23C28950C((uint64_t)v57, v59, &qword_256B58910);
  if (v47((uint64_t)v58, 1, v48) == 1)
  {
    sub_23C285184((uint64_t)v57, &qword_256B58910);
    sub_23C285184((uint64_t)v55, &qword_256B58910);
    if (v47(v59, 1, v48) == 1)
    {
      sub_23C285184((uint64_t)v58, &qword_256B58910);
      return 1;
    }
    goto LABEL_20;
  }
  v60 = v69;
  sub_23C28950C((uint64_t)v58, (uint64_t)v69, &qword_256B58910);
  if (v47(v59, 1, v48) == 1)
  {
    sub_23C285184((uint64_t)v57, &qword_256B58910);
    sub_23C285184((uint64_t)v55, &qword_256B58910);
    (*(void (**)(_BYTE *, uint64_t))(v81 + 8))(v60, v48);
LABEL_20:
    v37 = &qword_256B5A4D8;
    v38 = (uint64_t)v58;
    goto LABEL_21;
  }
  v62 = v81;
  v63 = (uint64_t)v57;
  v64 = v70;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v81 + 32))(v70, v59, v48);
  sub_23C27FEE4(&qword_256B5A4E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5C8]);
  v65 = sub_23C34E850();
  v66 = *(void (**)(_BYTE *, uint64_t))(v62 + 8);
  v66(v64, v48);
  sub_23C285184(v63, &qword_256B58910);
  sub_23C285184((uint64_t)v55, &qword_256B58910);
  v66(v60, v48);
  sub_23C285184((uint64_t)v58, &qword_256B58910);
  return (v65 & 1) != 0;
}

uint64_t type metadata accessor for WorkoutContextMenuPreviewContent()
{
  uint64_t result;

  result = qword_256B5CED8;
  if (!qword_256B5CED8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23C341D88()
{
  unint64_t result;

  result = qword_256B5CE58;
  if (!qword_256B5CE58)
  {
    result = MEMORY[0x24261C66C](&unk_23C35F854, &type metadata for WorkoutContextMenuPreviewContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CE58);
  }
  return result;
}

uint64_t sub_23C341DCC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B588F0);
    result = MEMORY[0x24261C66C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C341E10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WorkoutContextMenuPreviewContent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C341E54()
{
  return sub_23C27FEE4(&qword_256B5CE78, (uint64_t (*)(uint64_t))type metadata accessor for WorkoutContextMenuPreviewContent, (uint64_t)&protocol conformance descriptor for WorkoutContextMenuPreviewContent);
}

uint64_t *initializeBufferWithCopyOfBuffer for WorkoutContextMenuPreviewContent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B588F0);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58908);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() == 1)
        v11 = &qword_256B58900;
      else
        v11 = &qword_256B588F8;
      v12 = __swift_instantiateConcreteTypeFromMangledName(v11);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(a1, a2, v12);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v13 = *(int *)(a3 + 20);
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = sub_23C34D86C();
    v17 = *(_QWORD *)(v16 - 8);
    v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
    if (v18(v15, 1, v16))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    v20 = *(int *)(a3 + 24);
    v21 = (char *)a1 + v20;
    v22 = (char *)a2 + v20;
    if (v18(v22, 1, v16))
    {
      v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
      memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v21, v22, v16);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v21, 0, 1, v16);
    }
  }
  return a1;
}

uint64_t destroy for WorkoutContextMenuPreviewContent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t result;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B588F0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, 1, v4))
  {
    if (swift_getEnumCaseMultiPayload() == 1)
      v5 = &qword_256B58900;
    else
      v5 = &qword_256B588F8;
    v6 = __swift_instantiateConcreteTypeFromMangledName(v5);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  v7 = a1 + *(int *)(a2 + 20);
  v8 = sub_23C34D86C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v10(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  v11 = a1 + *(int *)(a2 + 24);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v10)(v11, 1, v8);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v11, v8);
  return result;
}

char *initializeWithCopy for WorkoutContextMenuPreviewContent(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B588F0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58908);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
      v9 = &qword_256B58900;
    else
      v9 = &qword_256B588F8;
    v10 = __swift_instantiateConcreteTypeFromMangledName(v9);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v11 = *(int *)(a3 + 20);
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = sub_23C34D86C();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v16(v13, 1, v14))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  v18 = *(int *)(a3 + 24);
  v19 = &a1[v18];
  v20 = &a2[v18];
  if (v16(v20, 1, v14))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, v20, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v19, 0, 1, v14);
  }
  return a1;
}

char *assignWithCopy for WorkoutContextMenuPreviewContent(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(char *, uint64_t, uint64_t);
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v30;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B588F0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      if (swift_getEnumCaseMultiPayload() == 1)
        v11 = &qword_256B58900;
      else
        v11 = &qword_256B588F8;
      v12 = __swift_instantiateConcreteTypeFromMangledName(v11);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(a1, a2, v12);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_10;
    }
LABEL_9:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58908);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    goto LABEL_10;
  }
  if (v10)
  {
    sub_23C285184((uint64_t)a1, &qword_256B588F0);
    goto LABEL_9;
  }
  if (a1 != a2)
  {
    sub_23C285184((uint64_t)a1, &qword_256B588F0);
    if (swift_getEnumCaseMultiPayload() == 1)
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58900);
    else
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B588F8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(a1, a2, v30);
    swift_storeEnumTagMultiPayload();
  }
LABEL_10:
  v14 = *(int *)(a3 + 20);
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = sub_23C34D86C();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  v20 = v19(v15, 1, v17);
  v21 = v19(v16, 1, v17);
  if (v20)
  {
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
LABEL_15:
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    goto LABEL_16;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 24))(v15, v16, v17);
LABEL_16:
  v23 = *(int *)(a3 + 24);
  v24 = &a1[v23];
  v25 = &a2[v23];
  v26 = v19(&a1[v23], 1, v17);
  v27 = v19(v25, 1, v17);
  if (!v26)
  {
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 24))(v24, v25, v17);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v24, v17);
    goto LABEL_21;
  }
  if (v27)
  {
LABEL_21:
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v24, v25, v17);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v24, 0, 1, v17);
  return a1;
}

char *initializeWithTake for WorkoutContextMenuPreviewContent(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B588F0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58908);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
      v9 = &qword_256B58900;
    else
      v9 = &qword_256B588F8;
    v10 = __swift_instantiateConcreteTypeFromMangledName(v9);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a1, a2, v10);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v11 = *(int *)(a3 + 20);
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = sub_23C34D86C();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v16(v13, 1, v14))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  v18 = *(int *)(a3 + 24);
  v19 = &a1[v18];
  v20 = &a2[v18];
  if (v16(v20, 1, v14))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v19, v20, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v19, 0, 1, v14);
  }
  return a1;
}

char *assignWithTake for WorkoutContextMenuPreviewContent(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(char *, uint64_t, uint64_t);
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v30;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B588F0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      if (swift_getEnumCaseMultiPayload() == 1)
        v11 = &qword_256B58900;
      else
        v11 = &qword_256B588F8;
      v12 = __swift_instantiateConcreteTypeFromMangledName(v11);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(a1, a2, v12);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_10;
    }
LABEL_9:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58908);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    goto LABEL_10;
  }
  if (v10)
  {
    sub_23C285184((uint64_t)a1, &qword_256B588F0);
    goto LABEL_9;
  }
  if (a1 != a2)
  {
    sub_23C285184((uint64_t)a1, &qword_256B588F0);
    if (swift_getEnumCaseMultiPayload() == 1)
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58900);
    else
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B588F8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 32))(a1, a2, v30);
    swift_storeEnumTagMultiPayload();
  }
LABEL_10:
  v14 = *(int *)(a3 + 20);
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = sub_23C34D86C();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  v20 = v19(v15, 1, v17);
  v21 = v19(v16, 1, v17);
  if (v20)
  {
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
LABEL_15:
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    goto LABEL_16;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 40))(v15, v16, v17);
LABEL_16:
  v23 = *(int *)(a3 + 24);
  v24 = &a1[v23];
  v25 = &a2[v23];
  v26 = v19(&a1[v23], 1, v17);
  v27 = v19(v25, 1, v17);
  if (!v26)
  {
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 40))(v24, v25, v17);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v24, v17);
    goto LABEL_21;
  }
  if (v27)
  {
LABEL_21:
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v24, v25, v17);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v24, 0, 1, v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutContextMenuPreviewContent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C342C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58908);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for WorkoutContextMenuPreviewContent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C342CB4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58908);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58910);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_23C342D38()
{
  unint64_t v0;
  unint64_t v1;

  sub_23C342DBC();
  if (v0 <= 0x3F)
  {
    sub_23C342E14();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_23C342DBC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256B5CEE8[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B588F0);
    v0 = sub_23C34EA48();
    if (!v1)
      atomic_store(v0, qword_256B5CEE8);
  }
}

void sub_23C342E14()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256B5A470)
  {
    sub_23C34D86C();
    v0 = sub_23C34EA48();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256B5A470);
  }
}

uint64_t storeEnumTagSinglePayload for WorkoutContextMenuPreviewContent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C342EB4 + 4 * byte_23C35F6A5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C342EE8 + 4 * byte_23C35F6A0[v4]))();
}

uint64_t sub_23C342EE8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C342EF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C342EF8);
  return result;
}

uint64_t sub_23C342F04(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C342F0CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C342F10(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C342F18(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WorkoutContextMenuPreviewContent.CodingKeys()
{
  return &type metadata for WorkoutContextMenuPreviewContent.CodingKeys;
}

unint64_t sub_23C342F38()
{
  unint64_t result;

  result = qword_256B5CF20;
  if (!qword_256B5CF20)
  {
    result = MEMORY[0x24261C66C](&unk_23C35F82C, &type metadata for WorkoutContextMenuPreviewContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CF20);
  }
  return result;
}

unint64_t sub_23C342F80()
{
  unint64_t result;

  result = qword_256B5CF28;
  if (!qword_256B5CF28)
  {
    result = MEMORY[0x24261C66C](&unk_23C35F79C, &type metadata for WorkoutContextMenuPreviewContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CF28);
  }
  return result;
}

unint64_t sub_23C342FC8()
{
  unint64_t result;

  result = qword_256B5CF30;
  if (!qword_256B5CF30)
  {
    result = MEMORY[0x24261C66C](&unk_23C35F7C4, &type metadata for WorkoutContextMenuPreviewContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CF30);
  }
  return result;
}

uint64_t sub_23C34300C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6B726F77747261 && a2 == 0xE700000000000000;
  if (v3 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C34EC64();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

BOOL static EditorialDetailSizeClass.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23C343158(char a1)
{
  return *(_QWORD *)&aExtrasmasmall[8 * a1];
}

uint64_t sub_23C343178()
{
  char *v0;

  return sub_23C343158(*v0);
}

uint64_t sub_23C343180@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C343A88(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C3431A4()
{
  sub_23C3437E0();
  return sub_23C34ECD0();
}

uint64_t sub_23C3431CC()
{
  sub_23C3437E0();
  return sub_23C34ECDC();
}

uint64_t sub_23C3431F4()
{
  sub_23C343824();
  return sub_23C34ECD0();
}

uint64_t sub_23C34321C()
{
  sub_23C343824();
  return sub_23C34ECDC();
}

uint64_t sub_23C343244()
{
  sub_23C343978();
  return sub_23C34ECD0();
}

uint64_t sub_23C34326C()
{
  sub_23C343978();
  return sub_23C34ECDC();
}

uint64_t sub_23C343294()
{
  sub_23C343868();
  return sub_23C34ECD0();
}

uint64_t sub_23C3432BC()
{
  sub_23C343868();
  return sub_23C34ECDC();
}

uint64_t sub_23C3432E4()
{
  sub_23C3438AC();
  return sub_23C34ECD0();
}

uint64_t sub_23C34330C()
{
  sub_23C3438AC();
  return sub_23C34ECDC();
}

uint64_t sub_23C343334()
{
  sub_23C3438F0();
  return sub_23C34ECD0();
}

uint64_t sub_23C34335C()
{
  sub_23C3438F0();
  return sub_23C34ECDC();
}

uint64_t sub_23C343384()
{
  sub_23C343934();
  return sub_23C34ECD0();
}

uint64_t sub_23C3433AC()
{
  sub_23C343934();
  return sub_23C34ECDC();
}

void EditorialDetailSizeClass.encode(to:)(_QWORD *a1, uint64_t a2)
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
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CF48);
  v25 = *(_QWORD *)(v3 - 8);
  v26 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v24 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CF50);
  v22 = *(_QWORD *)(v5 - 8);
  v23 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v21 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CF58);
  v19 = *(_QWORD *)(v7 - 8);
  v20 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v18 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CF60);
  v16 = *(_QWORD *)(v9 - 8);
  v17 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v15 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CF68);
  MEMORY[0x24BDAC7A8](v14);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CF70);
  MEMORY[0x24BDAC7A8](v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5CF78);
  v27 = *(_QWORD *)(v12 - 8);
  v28 = v12;
  MEMORY[0x24BDAC7A8](v12);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C3437E0();
  sub_23C34ECC4();
  __asm { BR              X10 }
}

uint64_t sub_23C343608()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 - 70) = 0;
  sub_23C343978();
  v5 = *(_QWORD *)(v4 - 104);
  sub_23C34EBD4();
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 112) + 8))(v1, v5);
}

unint64_t sub_23C3437E0()
{
  unint64_t result;

  result = qword_256B5CF80;
  if (!qword_256B5CF80)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FF40, &type metadata for EditorialDetailSizeClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CF80);
  }
  return result;
}

unint64_t sub_23C343824()
{
  unint64_t result;

  result = qword_256B5CF88;
  if (!qword_256B5CF88)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FEF0, &type metadata for EditorialDetailSizeClass.ExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CF88);
  }
  return result;
}

unint64_t sub_23C343868()
{
  unint64_t result;

  result = qword_256B5CF90;
  if (!qword_256B5CF90)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FEA0, &type metadata for EditorialDetailSizeClass.LargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CF90);
  }
  return result;
}

unint64_t sub_23C3438AC()
{
  unint64_t result;

  result = qword_256B5CF98;
  if (!qword_256B5CF98)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FE50, &type metadata for EditorialDetailSizeClass.MediumCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CF98);
  }
  return result;
}

unint64_t sub_23C3438F0()
{
  unint64_t result;

  result = qword_256B5CFA0;
  if (!qword_256B5CFA0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FE00, &type metadata for EditorialDetailSizeClass.RegularCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CFA0);
  }
  return result;
}

unint64_t sub_23C343934()
{
  unint64_t result;

  result = qword_256B5CFA8;
  if (!qword_256B5CFA8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FDB0, &type metadata for EditorialDetailSizeClass.SmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CFA8);
  }
  return result;
}

unint64_t sub_23C343978()
{
  unint64_t result;

  result = qword_256B5CFB0;
  if (!qword_256B5CFB0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FD60, &type metadata for EditorialDetailSizeClass.ExtraSmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CFB0);
  }
  return result;
}

uint64_t EditorialDetailSizeClass.init(from:)(_QWORD *a1)
{
  return sub_23C343CD8(a1);
}

uint64_t sub_23C3439D0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23C343CD8(a1);
  if (!v2)
    *a2 = result;
  return result;
}

void sub_23C3439F8(_QWORD *a1)
{
  unsigned __int8 *v1;

  EditorialDetailSizeClass.encode(to:)(a1, *v1);
}

BOOL static EditorialDetailSizeClass.< infix(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  return a1 < a2;
}

uint64_t EditorialDetailSizeClass.hash(into:)()
{
  return sub_23C34EC88();
}

uint64_t EditorialDetailSizeClass.hashValue.getter()
{
  sub_23C34EC7C();
  sub_23C34EC88();
  return sub_23C34ECAC();
}

uint64_t sub_23C343A88(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0x616D536172747865 && a2 == 0xEA00000000006C6CLL || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C6C616D73 && a2 == 0xE500000000000000 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x72616C75676572 && a2 == 0xE700000000000000 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6D756964656DLL && a2 == 0xE600000000000000 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656772616CLL && a2 == 0xE500000000000000 || (sub_23C34EC64() & 1) != 0)
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
    v5 = sub_23C34EC64();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_23C343CD8(_QWORD *a1)
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

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D038);
  v27 = *(_QWORD *)(v2 - 8);
  v28 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v41 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D040);
  v34 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v40 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D048);
  v31 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v39 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D050);
  v32 = *(_QWORD *)(v6 - 8);
  v33 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v38 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D058);
  v29 = *(_QWORD *)(v8 - 8);
  v30 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v37 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D060);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D068);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1[3];
  v42 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_23C3437E0();
  v19 = v43;
  sub_23C34ECB8();
  if (!v19)
  {
    v43 = v13;
    v25[1] = v11;
    v25[2] = v10;
    v26 = v15;
    v20 = sub_23C34EBBC();
    if (*(_QWORD *)(v20 + 16) == 1)
      __asm { BR              X9 }
    v21 = sub_23C34EAC0();
    swift_allocError();
    v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B576B0);
    *v23 = &type metadata for EditorialDetailSizeClass;
    sub_23C34EB44();
    sub_23C34EAB4();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x24BEE26D0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v17, v14);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  return v14;
}

void sub_23C3441D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v2 - 65) = 5;
  sub_23C343824();
  sub_23C34EB38();
  if (v0)
  {
    swift_bridgeObjectRelease();
    JUMPOUT(0x23C344194);
  }
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 224) + 8))(v1, *(_QWORD *)(v2 - 216));
  swift_bridgeObjectRelease();
  JUMPOUT(0x23C34423CLL);
}

unint64_t sub_23C34427C()
{
  unint64_t result;

  result = qword_256B5CFB8;
  if (!qword_256B5CFB8)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for EditorialDetailSizeClass, &type metadata for EditorialDetailSizeClass);
    atomic_store(result, (unint64_t *)&qword_256B5CFB8);
  }
  return result;
}

ValueMetadata *type metadata accessor for EditorialDetailSizeClass()
{
  return &type metadata for EditorialDetailSizeClass;
}

uint64_t _s20FitnessProductDetail24EditorialDetailSizeClassOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C344324 + 4 * byte_23C35F8F1[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23C344358 + 4 * byte_23C35F8EC[v4]))();
}

uint64_t sub_23C344358(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C344360(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C344368);
  return result;
}

uint64_t sub_23C344374(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C34437CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23C344380(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C344388(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EditorialDetailSizeClass.CodingKeys()
{
  return &type metadata for EditorialDetailSizeClass.CodingKeys;
}

ValueMetadata *type metadata accessor for EditorialDetailSizeClass.ExtraSmallCodingKeys()
{
  return &type metadata for EditorialDetailSizeClass.ExtraSmallCodingKeys;
}

ValueMetadata *type metadata accessor for EditorialDetailSizeClass.SmallCodingKeys()
{
  return &type metadata for EditorialDetailSizeClass.SmallCodingKeys;
}

ValueMetadata *type metadata accessor for EditorialDetailSizeClass.RegularCodingKeys()
{
  return &type metadata for EditorialDetailSizeClass.RegularCodingKeys;
}

ValueMetadata *type metadata accessor for EditorialDetailSizeClass.MediumCodingKeys()
{
  return &type metadata for EditorialDetailSizeClass.MediumCodingKeys;
}

ValueMetadata *type metadata accessor for EditorialDetailSizeClass.LargeCodingKeys()
{
  return &type metadata for EditorialDetailSizeClass.LargeCodingKeys;
}

ValueMetadata *type metadata accessor for EditorialDetailSizeClass.ExtraLargeCodingKeys()
{
  return &type metadata for EditorialDetailSizeClass.ExtraLargeCodingKeys;
}

unint64_t sub_23C344408()
{
  unint64_t result;

  result = qword_256B5CFC0;
  if (!qword_256B5CFC0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FD38, &type metadata for EditorialDetailSizeClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CFC0);
  }
  return result;
}

unint64_t sub_23C344450()
{
  unint64_t result;

  result = qword_256B5CFC8;
  if (!qword_256B5CFC8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FC58, &type metadata for EditorialDetailSizeClass.ExtraSmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CFC8);
  }
  return result;
}

unint64_t sub_23C344498()
{
  unint64_t result;

  result = qword_256B5CFD0;
  if (!qword_256B5CFD0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FC80, &type metadata for EditorialDetailSizeClass.ExtraSmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CFD0);
  }
  return result;
}

unint64_t sub_23C3444E0()
{
  unint64_t result;

  result = qword_256B5CFD8;
  if (!qword_256B5CFD8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FC08, &type metadata for EditorialDetailSizeClass.SmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CFD8);
  }
  return result;
}

unint64_t sub_23C344528()
{
  unint64_t result;

  result = qword_256B5CFE0;
  if (!qword_256B5CFE0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FC30, &type metadata for EditorialDetailSizeClass.SmallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CFE0);
  }
  return result;
}

unint64_t sub_23C344570()
{
  unint64_t result;

  result = qword_256B5CFE8;
  if (!qword_256B5CFE8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FBB8, &type metadata for EditorialDetailSizeClass.RegularCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CFE8);
  }
  return result;
}

unint64_t sub_23C3445B8()
{
  unint64_t result;

  result = qword_256B5CFF0;
  if (!qword_256B5CFF0)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FBE0, &type metadata for EditorialDetailSizeClass.RegularCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CFF0);
  }
  return result;
}

unint64_t sub_23C344600()
{
  unint64_t result;

  result = qword_256B5CFF8;
  if (!qword_256B5CFF8)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FB68, &type metadata for EditorialDetailSizeClass.MediumCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5CFF8);
  }
  return result;
}

unint64_t sub_23C344648()
{
  unint64_t result;

  result = qword_256B5D000;
  if (!qword_256B5D000)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FB90, &type metadata for EditorialDetailSizeClass.MediumCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D000);
  }
  return result;
}

unint64_t sub_23C344690()
{
  unint64_t result;

  result = qword_256B5D008;
  if (!qword_256B5D008)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FB18, &type metadata for EditorialDetailSizeClass.LargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D008);
  }
  return result;
}

unint64_t sub_23C3446D8()
{
  unint64_t result;

  result = qword_256B5D010;
  if (!qword_256B5D010)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FB40, &type metadata for EditorialDetailSizeClass.LargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D010);
  }
  return result;
}

unint64_t sub_23C344720()
{
  unint64_t result;

  result = qword_256B5D018;
  if (!qword_256B5D018)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FAC8, &type metadata for EditorialDetailSizeClass.ExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D018);
  }
  return result;
}

unint64_t sub_23C344768()
{
  unint64_t result;

  result = qword_256B5D020;
  if (!qword_256B5D020)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FAF0, &type metadata for EditorialDetailSizeClass.ExtraLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D020);
  }
  return result;
}

unint64_t sub_23C3447B0()
{
  unint64_t result;

  result = qword_256B5D028;
  if (!qword_256B5D028)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FCA8, &type metadata for EditorialDetailSizeClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D028);
  }
  return result;
}

unint64_t sub_23C3447F8()
{
  unint64_t result;

  result = qword_256B5D030;
  if (!qword_256B5D030)
  {
    result = MEMORY[0x24261C66C](&unk_23C35FCD0, &type metadata for EditorialDetailSizeClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D030);
  }
  return result;
}

uint64_t WorkoutSchedule.init(nextWorkout:additionalDays:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t result;

  v6 = sub_23C34D9EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  result = type metadata accessor for WorkoutSchedule();
  *(_QWORD *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t type metadata accessor for WorkoutSchedule()
{
  uint64_t result;

  result = qword_256B5D0F0;
  if (!qword_256B5D0F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23C3448D4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6E6F697469646461;
  else
    return 0x6B726F577478656ELL;
}

uint64_t sub_23C344920()
{
  char *v0;

  return sub_23C3448D4(*v0);
}

uint64_t sub_23C344928@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C3453A8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C34494C()
{
  sub_23C344AE4();
  return sub_23C34ECD0();
}

uint64_t sub_23C344974()
{
  sub_23C344AE4();
  return sub_23C34ECDC();
}

uint64_t WorkoutSchedule.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D070);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C344AE4();
  sub_23C34ECC4();
  v8[15] = 0;
  sub_23C34D9EC();
  sub_23C344D88(&qword_256B5D080, MEMORY[0x24BDCE920]);
  sub_23C34EC40();
  if (!v1)
  {
    type metadata accessor for WorkoutSchedule();
    v8[14] = 1;
    sub_23C34EC34();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23C344AE4()
{
  unint64_t result;

  result = qword_256B5D078;
  if (!qword_256B5D078)
  {
    result = MEMORY[0x24261C66C](&unk_23C360168, &type metadata for WorkoutSchedule.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D078);
  }
  return result;
}

uint64_t WorkoutSchedule.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;

  v25 = a2;
  v4 = sub_23C34D9EC();
  v5 = *(_QWORD *)(v4 - 8);
  v28 = v4;
  v29 = v5;
  MEMORY[0x24BDAC7A8](v4);
  v26 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D088);
  v7 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for WorkoutSchedule();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C344AE4();
  sub_23C34ECB8();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v23 = v10;
  v24 = v12;
  v13 = v7;
  v14 = v29;
  v31 = 0;
  sub_23C344D88(&qword_256B5D090, MEMORY[0x24BDCE960]);
  v15 = v26;
  v16 = v27;
  v17 = v28;
  sub_23C34EBB0();
  v18 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v19 = (uint64_t)v24;
  v18(v24, v15, v17);
  v30 = 1;
  v20 = sub_23C34EBA4();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v16);
  *(_QWORD *)(v19 + *(int *)(v23 + 20)) = v20;
  sub_23C344DC8(v19, v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_23C2D7684(v19);
}

uint64_t sub_23C344D88(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23C34D9EC();
    result = MEMORY[0x24261C66C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C344DC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WorkoutSchedule();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C344E0C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return WorkoutSchedule.init(from:)(a1, a2);
}

uint64_t sub_23C344E20(_QWORD *a1)
{
  return WorkoutSchedule.encode(to:)(a1);
}

BOOL static WorkoutSchedule.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if ((sub_23C34D9D4() & 1) == 0)
    return 0;
  v4 = type metadata accessor for WorkoutSchedule();
  return *(_QWORD *)(a1 + *(int *)(v4 + 20)) == *(_QWORD *)(a2 + *(int *)(v4 + 20));
}

BOOL sub_23C344E80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (sub_23C34D9D4() & 1) != 0 && *(_QWORD *)(a1 + *(int *)(a3 + 20)) == *(_QWORD *)(a2 + *(int *)(a3 + 20));
}

uint64_t *initializeBufferWithCopyOfBuffer for WorkoutSchedule(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

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
    v7 = sub_23C34D9EC();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for WorkoutSchedule(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23C34D9EC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for WorkoutSchedule(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23C34D9EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for WorkoutSchedule(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23C34D9EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for WorkoutSchedule(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23C34D9EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for WorkoutSchedule(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23C34D9EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutSchedule()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C345108(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C34D9EC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for WorkoutSchedule()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C345150(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C34D9EC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_23C345190()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23C34D9EC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for WorkoutSchedule.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C345250 + 4 * byte_23C360005[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C345284 + 4 * byte_23C360000[v4]))();
}

uint64_t sub_23C345284(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C34528C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C345294);
  return result;
}

uint64_t sub_23C3452A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C3452A8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C3452AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C3452B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WorkoutSchedule.CodingKeys()
{
  return &type metadata for WorkoutSchedule.CodingKeys;
}

unint64_t sub_23C3452D4()
{
  unint64_t result;

  result = qword_256B5D128;
  if (!qword_256B5D128)
  {
    result = MEMORY[0x24261C66C](&unk_23C360140, &type metadata for WorkoutSchedule.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D128);
  }
  return result;
}

unint64_t sub_23C34531C()
{
  unint64_t result;

  result = qword_256B5D130;
  if (!qword_256B5D130)
  {
    result = MEMORY[0x24261C66C](&unk_23C3600B0, &type metadata for WorkoutSchedule.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D130);
  }
  return result;
}

unint64_t sub_23C345364()
{
  unint64_t result;

  result = qword_256B5D138;
  if (!qword_256B5D138)
  {
    result = MEMORY[0x24261C66C](&unk_23C3600D8, &type metadata for WorkoutSchedule.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D138);
  }
  return result;
}

uint64_t sub_23C3453A8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6B726F577478656ELL && a2 == 0xEB0000000074756FLL;
  if (v3 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F697469646461 && a2 == 0xEE00737961446C61)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C34EC64();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

BOOL static WorkoutProgramLinkPlatform.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23C3454D0(char a1)
{
  if ((a1 & 1) != 0)
    return 0x72657474697774;
  else
    return 0x6172676174736E69;
}

uint64_t sub_23C34550C()
{
  char *v0;

  return sub_23C3454D0(*v0);
}

uint64_t sub_23C345514@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C345FF4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C345538()
{
  sub_23C3457FC();
  return sub_23C34ECD0();
}

uint64_t sub_23C345560()
{
  sub_23C3457FC();
  return sub_23C34ECDC();
}

uint64_t sub_23C345588()
{
  sub_23C345884();
  return sub_23C34ECD0();
}

uint64_t sub_23C3455B0()
{
  sub_23C345884();
  return sub_23C34ECDC();
}

uint64_t sub_23C3455D8()
{
  sub_23C345840();
  return sub_23C34ECD0();
}

uint64_t sub_23C345600()
{
  sub_23C345840();
  return sub_23C34ECDC();
}

uint64_t WorkoutProgramLinkPlatform.encode(to:)(_QWORD *a1)
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D140);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D148);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D150);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C3457FC();
  sub_23C34ECC4();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23C345840();
    sub_23C34EBD4();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23C345884();
    sub_23C34EBD4();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_23C3457FC()
{
  unint64_t result;

  result = qword_256B5D158;
  if (!qword_256B5D158)
  {
    result = MEMORY[0x24261C66C](&unk_23C3604EC, &type metadata for WorkoutProgramLinkPlatform.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D158);
  }
  return result;
}

unint64_t sub_23C345840()
{
  unint64_t result;

  result = qword_256B5D160;
  if (!qword_256B5D160)
  {
    result = MEMORY[0x24261C66C](&unk_23C36049C, &type metadata for WorkoutProgramLinkPlatform.TwitterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D160);
  }
  return result;
}

unint64_t sub_23C345884()
{
  unint64_t result;

  result = qword_256B5D168;
  if (!qword_256B5D168)
  {
    result = MEMORY[0x24261C66C](&unk_23C36044C, &type metadata for WorkoutProgramLinkPlatform.InstagramCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D168);
  }
  return result;
}

uint64_t WorkoutProgramLinkPlatform.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D170);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D178);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D180);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C3457FC();
  v11 = v33;
  sub_23C34ECB8();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23C34EBBC();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23C34EAC0();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B576B0);
    *v21 = &type metadata for WorkoutProgramLinkPlatform;
    sub_23C34EB44();
    sub_23C34EAB4();
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
    sub_23C345840();
    sub_23C34EB38();
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
    sub_23C345884();
    v22 = v6;
    sub_23C34EB38();
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

uint64_t sub_23C345C20@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return WorkoutProgramLinkPlatform.init(from:)(a1, a2);
}

uint64_t sub_23C345C34(_QWORD *a1)
{
  return WorkoutProgramLinkPlatform.encode(to:)(a1);
}

uint64_t WorkoutProgramLinkPlatform.hash(into:)()
{
  return sub_23C34EC88();
}

uint64_t WorkoutProgramLinkPlatform.hashValue.getter()
{
  sub_23C34EC7C();
  sub_23C34EC88();
  return sub_23C34ECAC();
}

unint64_t sub_23C345CB8()
{
  unint64_t result;

  result = qword_256B5D188;
  if (!qword_256B5D188)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for WorkoutProgramLinkPlatform, &type metadata for WorkoutProgramLinkPlatform);
    atomic_store(result, (unint64_t *)&qword_256B5D188);
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkoutProgramLinkPlatform()
{
  return &type metadata for WorkoutProgramLinkPlatform;
}

uint64_t _s20FitnessProductDetail26WorkoutProgramLinkPlatformOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C345D5C + 4 * byte_23C3601C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C345D90 + 4 * byte_23C3601C0[v4]))();
}

uint64_t sub_23C345D90(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C345D98(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C345DA0);
  return result;
}

uint64_t sub_23C345DAC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C345DB4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C345DB8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C345DC0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WorkoutProgramLinkPlatform.CodingKeys()
{
  return &type metadata for WorkoutProgramLinkPlatform.CodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutProgramLinkPlatform.InstagramCodingKeys()
{
  return &type metadata for WorkoutProgramLinkPlatform.InstagramCodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutProgramLinkPlatform.TwitterCodingKeys()
{
  return &type metadata for WorkoutProgramLinkPlatform.TwitterCodingKeys;
}

unint64_t sub_23C345E00()
{
  unint64_t result;

  result = qword_256B5D190;
  if (!qword_256B5D190)
  {
    result = MEMORY[0x24261C66C](&unk_23C360424, &type metadata for WorkoutProgramLinkPlatform.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D190);
  }
  return result;
}

unint64_t sub_23C345E48()
{
  unint64_t result;

  result = qword_256B5D198;
  if (!qword_256B5D198)
  {
    result = MEMORY[0x24261C66C](&unk_23C360344, &type metadata for WorkoutProgramLinkPlatform.InstagramCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D198);
  }
  return result;
}

unint64_t sub_23C345E90()
{
  unint64_t result;

  result = qword_256B5D1A0;
  if (!qword_256B5D1A0)
  {
    result = MEMORY[0x24261C66C](&unk_23C36036C, &type metadata for WorkoutProgramLinkPlatform.InstagramCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D1A0);
  }
  return result;
}

unint64_t sub_23C345ED8()
{
  unint64_t result;

  result = qword_256B5D1A8;
  if (!qword_256B5D1A8)
  {
    result = MEMORY[0x24261C66C](&unk_23C3602F4, &type metadata for WorkoutProgramLinkPlatform.TwitterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D1A8);
  }
  return result;
}

unint64_t sub_23C345F20()
{
  unint64_t result;

  result = qword_256B5D1B0;
  if (!qword_256B5D1B0)
  {
    result = MEMORY[0x24261C66C](&unk_23C36031C, &type metadata for WorkoutProgramLinkPlatform.TwitterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D1B0);
  }
  return result;
}

unint64_t sub_23C345F68()
{
  unint64_t result;

  result = qword_256B5D1B8;
  if (!qword_256B5D1B8)
  {
    result = MEMORY[0x24261C66C](&unk_23C360394, &type metadata for WorkoutProgramLinkPlatform.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D1B8);
  }
  return result;
}

unint64_t sub_23C345FB0()
{
  unint64_t result;

  result = qword_256B5D1C0;
  if (!qword_256B5D1C0)
  {
    result = MEMORY[0x24261C66C](&unk_23C3603BC, &type metadata for WorkoutProgramLinkPlatform.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D1C0);
  }
  return result;
}

uint64_t sub_23C345FF4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6172676174736E69 && a2 == 0xE90000000000006DLL;
  if (v3 || (sub_23C34EC64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x72657474697774 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C34EC64();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t EditorialPreview.streamingProgramIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EditorialPreview.streamingURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for EditorialPreview() + 20);
  v4 = sub_23C34D950();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for EditorialPreview()
{
  uint64_t result;

  result = qword_256B5D240;
  if (!qword_256B5D240)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t EditorialPreview.init(streamingProgramIdentifier:streamingURL:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  char *v5;
  uint64_t v6;

  *a4 = a1;
  a4[1] = a2;
  v5 = (char *)a4 + *(int *)(type metadata accessor for EditorialPreview() + 20);
  v6 = sub_23C34D950();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a3, v6);
}

uint64_t sub_23C3461E4()
{
  sub_23C346388();
  return sub_23C34ECD0();
}

uint64_t sub_23C34620C()
{
  sub_23C346388();
  return sub_23C34ECDC();
}

uint64_t EditorialPreview.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D1C8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C346388();
  sub_23C34ECC4();
  v8[15] = 0;
  sub_23C34EBE0();
  if (!v1)
  {
    type metadata accessor for EditorialPreview();
    v8[14] = 1;
    sub_23C34D950();
    sub_23C27FEE4(&qword_256B58108, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
    sub_23C34EC40();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23C346388()
{
  unint64_t result;

  result = qword_256B5D1D0;
  if (!qword_256B5D1D0)
  {
    result = MEMORY[0x24261C66C](&unk_23C360714, &type metadata for EditorialPreview.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D1D0);
  }
  return result;
}

uint64_t EditorialPreview.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;

  v22 = a2;
  v4 = sub_23C34D950();
  v24 = *(_QWORD *)(v4 - 8);
  v25 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v23 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D1D8);
  v6 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for EditorialPreview();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C346388();
  sub_23C34ECB8();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v20 = a1;
  v21 = v6;
  v12 = v11;
  v14 = v23;
  v13 = v24;
  v15 = v25;
  v16 = v26;
  v28 = 0;
  *v12 = sub_23C34EB50();
  v12[1] = v17;
  v27 = 1;
  sub_23C27FEE4(&qword_256B58120, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
  sub_23C34EBB0();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v16);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))((char *)v12 + *(int *)(v9 + 20), v14, v15);
  sub_23C346614((uint64_t)v12, v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  return sub_23C346658((uint64_t)v12);
}

uint64_t sub_23C346614(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EditorialPreview();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C346658(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for EditorialPreview();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C346694@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return EditorialPreview.init(from:)(a1, a2);
}

uint64_t sub_23C3466A8(_QWORD *a1)
{
  return EditorialPreview.encode(to:)(a1);
}

uint64_t EditorialPreview.hash(into:)()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8))
  {
    sub_23C34EC94();
    swift_bridgeObjectRetain();
    sub_23C34E8B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23C34EC94();
  }
  type metadata accessor for EditorialPreview();
  sub_23C34D950();
  sub_23C27FEE4(&qword_256B57EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  return sub_23C34E838();
}

uint64_t EditorialPreview.hashValue.getter()
{
  uint64_t v0;

  sub_23C34EC7C();
  if (*(_QWORD *)(v0 + 8))
  {
    sub_23C34EC94();
    swift_bridgeObjectRetain();
    sub_23C34E8B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23C34EC94();
  }
  type metadata accessor for EditorialPreview();
  sub_23C34D950();
  sub_23C27FEE4(&qword_256B57EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_23C34E838();
  return sub_23C34ECAC();
}

uint64_t _s20FitnessProductDetail16EditorialPreviewV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
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
      if (v5 || (sub_23C34EC64() & 1) != 0)
      {
LABEL_8:
        type metadata accessor for EditorialPreview();
        JUMPOUT(0x24261B040);
      }
    }
  }
  else if (!v4)
  {
    goto LABEL_8;
  }
  return 0;
}

uint64_t sub_23C3468CC()
{
  return sub_23C27FEE4(&qword_256B5D1E0, (uint64_t (*)(uint64_t))type metadata accessor for EditorialPreview, (uint64_t)&protocol conformance descriptor for EditorialPreview);
}

uint64_t getEnumTagSinglePayload for EditorialPreview()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C346904(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_23C34D950();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for EditorialPreview()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C346998(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    v7 = sub_23C34D950();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23C346A0C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23C34D950();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for EditorialPreview.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C346ACC + 4 * byte_23C360545[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C346B00 + 4 * byte_23C360540[v4]))();
}

uint64_t sub_23C346B00(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C346B08(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C346B10);
  return result;
}

uint64_t sub_23C346B1C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C346B24);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C346B28(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C346B30(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EditorialPreview.CodingKeys()
{
  return &type metadata for EditorialPreview.CodingKeys;
}

unint64_t sub_23C346B50()
{
  unint64_t result;

  result = qword_256B5D278;
  if (!qword_256B5D278)
  {
    result = MEMORY[0x24261C66C](&unk_23C3606EC, &type metadata for EditorialPreview.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D278);
  }
  return result;
}

unint64_t sub_23C346B98()
{
  unint64_t result;

  result = qword_256B5D280;
  if (!qword_256B5D280)
  {
    result = MEMORY[0x24261C66C](&unk_23C36065C, &type metadata for EditorialPreview.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D280);
  }
  return result;
}

unint64_t sub_23C346BE0()
{
  unint64_t result;

  result = qword_256B5D288;
  if (!qword_256B5D288)
  {
    result = MEMORY[0x24261C66C](&unk_23C360684, &type metadata for EditorialPreview.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D288);
  }
  return result;
}

BOOL static ProgramDetailSizeClass.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_23C346C34()
{
  sub_23C346EF4();
  return sub_23C34ECD0();
}

uint64_t sub_23C346C5C()
{
  sub_23C346EF4();
  return sub_23C34ECDC();
}

uint64_t sub_23C346C84()
{
  sub_23C346F7C();
  return sub_23C34ECD0();
}

uint64_t sub_23C346CAC()
{
  sub_23C346F7C();
  return sub_23C34ECDC();
}

uint64_t sub_23C346CD4()
{
  sub_23C346F38();
  return sub_23C34ECD0();
}

uint64_t sub_23C346CFC()
{
  sub_23C346F38();
  return sub_23C34ECDC();
}

uint64_t ProgramDetailSizeClass.encode(to:)(_QWORD *a1, int a2)
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
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D290);
  v15 = *(_QWORD *)(v3 - 8);
  v16 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D298);
  v6 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D2A0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C346EF4();
  sub_23C34ECC4();
  if ((v17 & 1) != 0)
  {
    v19 = 1;
    sub_23C346F38();
    sub_23C34EBD4();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v16);
  }
  else
  {
    v18 = 0;
    sub_23C346F7C();
    sub_23C34EBD4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v14);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

unint64_t sub_23C346EF4()
{
  unint64_t result;

  result = qword_256B5D2A8;
  if (!qword_256B5D2A8)
  {
    result = MEMORY[0x24261C66C](&unk_23C360A9C, &type metadata for ProgramDetailSizeClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D2A8);
  }
  return result;
}

unint64_t sub_23C346F38()
{
  unint64_t result;

  result = qword_256B5D2B0;
  if (!qword_256B5D2B0)
  {
    result = MEMORY[0x24261C66C](&unk_23C360A4C, &type metadata for ProgramDetailSizeClass.RegularCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D2B0);
  }
  return result;
}

unint64_t sub_23C346F7C()
{
  unint64_t result;

  result = qword_256B5D2B8;
  if (!qword_256B5D2B8)
  {
    result = MEMORY[0x24261C66C](&unk_23C3609FC, &type metadata for ProgramDetailSizeClass.CompactCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D2B8);
  }
  return result;
}

uint64_t ProgramDetailSizeClass.init(from:)(_QWORD *a1)
{
  return sub_23C347084(a1) & 1;
}

uint64_t sub_23C346FD8@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23C347084(a1);
  if (!v2)
    *a2 = result & 1;
  return result;
}

uint64_t sub_23C347004(_QWORD *a1)
{
  unsigned __int8 *v1;

  return ProgramDetailSizeClass.encode(to:)(a1, *v1);
}

uint64_t ProgramDetailSizeClass.hash(into:)()
{
  return sub_23C34EC88();
}

uint64_t ProgramDetailSizeClass.hashValue.getter()
{
  sub_23C34EC7C();
  sub_23C34EC88();
  return sub_23C34ECAC();
}

uint64_t sub_23C347084(_QWORD *a1)
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

  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D300);
  v22 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v25 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D308);
  v3 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D310);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C346EF4();
  v10 = v26;
  sub_23C34ECB8();
  if (v10)
    goto LABEL_7;
  v11 = v5;
  v12 = v25;
  v21 = a1;
  v26 = v7;
  v13 = sub_23C34EBBC();
  v14 = v6;
  if (*(_QWORD *)(v13 + 16) != 1)
  {
    v16 = sub_23C34EAC0();
    swift_allocError();
    v17 = v9;
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B576B0);
    *v19 = &type metadata for ProgramDetailSizeClass;
    sub_23C34EB44();
    sub_23C34EAB4();
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
    sub_23C346F38();
    sub_23C34EB38();
    v15 = v26;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v24);
  }
  else
  {
    v27 = 0;
    sub_23C346F7C();
    sub_23C34EB38();
    v15 = v26;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v23);
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  return v6;
}

unint64_t sub_23C3473B4()
{
  unint64_t result;

  result = qword_256B5D2C0;
  if (!qword_256B5D2C0)
  {
    result = MEMORY[0x24261C66C](&protocol conformance descriptor for ProgramDetailSizeClass, &type metadata for ProgramDetailSizeClass);
    atomic_store(result, (unint64_t *)&qword_256B5D2C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ProgramDetailSizeClass()
{
  return &type metadata for ProgramDetailSizeClass;
}

uint64_t _s20FitnessProductDetail22ProgramDetailSizeClassOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C347458 + 4 * byte_23C360775[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C34748C + 4 * byte_23C360770[v4]))();
}

uint64_t sub_23C34748C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C347494(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C34749CLL);
  return result;
}

uint64_t sub_23C3474A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C3474B0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C3474B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C3474BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProgramDetailSizeClass.CodingKeys()
{
  return &type metadata for ProgramDetailSizeClass.CodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailSizeClass.CompactCodingKeys()
{
  return &type metadata for ProgramDetailSizeClass.CompactCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailSizeClass.RegularCodingKeys()
{
  return &type metadata for ProgramDetailSizeClass.RegularCodingKeys;
}

unint64_t sub_23C3474FC()
{
  unint64_t result;

  result = qword_256B5D2C8;
  if (!qword_256B5D2C8)
  {
    result = MEMORY[0x24261C66C](&unk_23C3609D4, &type metadata for ProgramDetailSizeClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D2C8);
  }
  return result;
}

unint64_t sub_23C347544()
{
  unint64_t result;

  result = qword_256B5D2D0;
  if (!qword_256B5D2D0)
  {
    result = MEMORY[0x24261C66C](&unk_23C3608F4, &type metadata for ProgramDetailSizeClass.CompactCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D2D0);
  }
  return result;
}

unint64_t sub_23C34758C()
{
  unint64_t result;

  result = qword_256B5D2D8;
  if (!qword_256B5D2D8)
  {
    result = MEMORY[0x24261C66C](&unk_23C36091C, &type metadata for ProgramDetailSizeClass.CompactCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D2D8);
  }
  return result;
}

unint64_t sub_23C3475D4()
{
  unint64_t result;

  result = qword_256B5D2E0;
  if (!qword_256B5D2E0)
  {
    result = MEMORY[0x24261C66C](&unk_23C3608A4, &type metadata for ProgramDetailSizeClass.RegularCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D2E0);
  }
  return result;
}

unint64_t sub_23C34761C()
{
  unint64_t result;

  result = qword_256B5D2E8;
  if (!qword_256B5D2E8)
  {
    result = MEMORY[0x24261C66C](&unk_23C3608CC, &type metadata for ProgramDetailSizeClass.RegularCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D2E8);
  }
  return result;
}

unint64_t sub_23C347664()
{
  unint64_t result;

  result = qword_256B5D2F0;
  if (!qword_256B5D2F0)
  {
    result = MEMORY[0x24261C66C](&unk_23C360944, &type metadata for ProgramDetailSizeClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D2F0);
  }
  return result;
}

unint64_t sub_23C3476AC()
{
  unint64_t result;

  result = qword_256B5D2F8;
  if (!qword_256B5D2F8)
  {
    result = MEMORY[0x24261C66C](&unk_23C36096C, &type metadata for ProgramDetailSizeClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D2F8);
  }
  return result;
}

uint64_t WorkoutDetailLoadState.workoutDetail.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t State;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v2 = v1;
  State = type metadata accessor for WorkoutDetailLoadState();
  MEMORY[0x24BDAC7A8](State);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C347828(v2, (uint64_t)v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 2, v7))
  {
    sub_23C283550((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetailLoadState);
    v8 = type metadata accessor for WorkoutDetail();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(a1, 1, 1, v8);
  }
  else
  {
    sub_23C2851C0((uint64_t)v6, a1, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetail);
    v10 = type metadata accessor for WorkoutDetail();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(a1, 0, 1, v10);
  }
}

uint64_t type metadata accessor for WorkoutDetailLoadState()
{
  uint64_t result;

  result = qword_256B5D3F8;
  if (!qword_256B5D3F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23C347828(uint64_t a1, uint64_t a2)
{
  uint64_t State;

  State = type metadata accessor for WorkoutDetailLoadState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(State - 8) + 16))(a2, a1, State);
  return a2;
}

uint64_t sub_23C34786C(char a1)
{
  return *(_QWORD *)&aIdle_16[8 * a1];
}

uint64_t sub_23C34788C()
{
  char *v0;

  return sub_23C34786C(*v0);
}

uint64_t sub_23C347894()
{
  sub_23C347D84();
  return sub_23C34ECD0();
}

uint64_t sub_23C3478BC()
{
  sub_23C347D84();
  return sub_23C34ECDC();
}

uint64_t sub_23C3478E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C34BA80(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C347910()
{
  sub_23C347DC8();
  return sub_23C34ECD0();
}

uint64_t sub_23C347938()
{
  sub_23C347DC8();
  return sub_23C34ECDC();
}

uint64_t sub_23C347960()
{
  sub_23C347E0C();
  return sub_23C34ECD0();
}

uint64_t sub_23C347988()
{
  sub_23C347E0C();
  return sub_23C34ECDC();
}

uint64_t sub_23C3479B0()
{
  sub_23C347E50();
  return sub_23C34ECD0();
}

uint64_t sub_23C3479D8()
{
  sub_23C347E50();
  return sub_23C34ECDC();
}

uint64_t WorkoutDetailLoadState.encode(to:)(_QWORD *a1)
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
  uint64_t State;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
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
  char v34;
  char v35;
  char v36;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D320);
  v30 = *(_QWORD *)(v2 - 8);
  v31 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v29 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = type metadata accessor for WorkoutDetail();
  MEMORY[0x24BDAC7A8](v27);
  v28 = (uint64_t)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D328);
  v25 = *(_QWORD *)(v5 - 8);
  v26 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D330);
  v8 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  State = type metadata accessor for WorkoutDetailLoadState();
  MEMORY[0x24BDAC7A8](State);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D338);
  v33 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C347D84();
  sub_23C34ECC4();
  sub_23C347828(v32, (uint64_t)v13);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
  v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 48))(v13, 2, v17);
  if (v18)
  {
    if (v18 == 1)
    {
      v34 = 0;
      sub_23C347E50();
      sub_23C34EBD4();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v24);
    }
    else
    {
      v35 = 1;
      sub_23C347E0C();
      sub_23C34EBD4();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v26);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v16, v14);
  }
  else
  {
    v19 = v28;
    sub_23C2851C0((uint64_t)v13, v28, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetail);
    v36 = 2;
    sub_23C347DC8();
    v20 = v29;
    sub_23C34EBD4();
    sub_23C27FEE4(&qword_256B576F8, (uint64_t (*)(uint64_t))type metadata accessor for WorkoutDetail, (uint64_t)&protocol conformance descriptor for WorkoutDetail);
    v21 = v31;
    sub_23C34EC40();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v20, v21);
    sub_23C283550(v19, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetail);
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v16, v14);
  }
}

unint64_t sub_23C347D84()
{
  unint64_t result;

  result = qword_256B5D340;
  if (!qword_256B5D340)
  {
    result = MEMORY[0x24261C66C](&unk_23C360F34, &type metadata for WorkoutDetailLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D340);
  }
  return result;
}

unint64_t sub_23C347DC8()
{
  unint64_t result;

  result = qword_256B5D348;
  if (!qword_256B5D348)
  {
    result = MEMORY[0x24261C66C](&unk_23C360EE4, &type metadata for WorkoutDetailLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D348);
  }
  return result;
}

unint64_t sub_23C347E0C()
{
  unint64_t result;

  result = qword_256B5D350;
  if (!qword_256B5D350)
  {
    result = MEMORY[0x24261C66C](&unk_23C360E94, &type metadata for WorkoutDetailLoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D350);
  }
  return result;
}

unint64_t sub_23C347E50()
{
  unint64_t result;

  result = qword_256B5D358;
  if (!qword_256B5D358)
  {
    result = MEMORY[0x24261C66C](&unk_23C360E44, &type metadata for WorkoutDetailLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D358);
  }
  return result;
}

uint64_t WorkoutDetailLoadState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t State;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
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
  _QWORD *v58;
  uint64_t v59;
  char v60;
  char v61;
  char v62;

  v53 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D360);
  v4 = *(_QWORD *)(v3 - 8);
  v51 = v3;
  v52 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v56 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D368);
  v49 = *(_QWORD *)(v6 - 8);
  v50 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v55 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D370);
  v47 = *(_QWORD *)(v8 - 8);
  v48 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v54 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D378);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  State = type metadata accessor for WorkoutDetailLoadState();
  MEMORY[0x24BDAC7A8](State);
  v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v44 - v18;
  v20 = a1[3];
  v58 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_23C347D84();
  v57 = v13;
  v21 = v59;
  sub_23C34ECB8();
  if (!v21)
  {
    v22 = v54;
    v23 = v55;
    v45 = v16;
    v46 = v19;
    v24 = v56;
    v59 = v11;
    v25 = sub_23C34EBBC();
    v26 = (char *)v25;
    if (*(_QWORD *)(v25 + 16) == 1)
    {
      v27 = v57;
      v28 = v59;
      if (*(_BYTE *)(v25 + 32))
      {
        if (*(_BYTE *)(v25 + 32) != 1)
        {
          v62 = 2;
          sub_23C347DC8();
          v36 = v27;
          sub_23C34EB38();
          v37 = v53;
          type metadata accessor for WorkoutDetail();
          v55 = v26;
          sub_23C27FEE4(&qword_256B576F0, (uint64_t (*)(uint64_t))type metadata accessor for WorkoutDetail, (uint64_t)&protocol conformance descriptor for WorkoutDetail);
          v40 = (uint64_t)v45;
          v41 = v51;
          sub_23C34EBB0();
          (*(void (**)(char *, uint64_t))(v52 + 8))(v24, v41);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v59 + 8))(v36, v10);
          v42 = (uint64_t)v58;
          v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v40, 0, 2, v43);
          v30 = (uint64_t)v46;
          sub_23C2851C0(v40, (uint64_t)v46, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetailLoadState);
LABEL_12:
          sub_23C2851C0(v30, v37, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetailLoadState);
          return __swift_destroy_boxed_opaque_existential_1(v42);
        }
        v61 = 1;
        sub_23C347E0C();
        sub_23C34EB38();
        (*(void (**)(char *, uint64_t))(v49 + 8))(v23, v50);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v27, v10);
        v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
        v30 = (uint64_t)v46;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v46, 2, 2, v29);
      }
      else
      {
        v60 = 0;
        sub_23C347E50();
        sub_23C34EB38();
        (*(void (**)(char *, uint64_t))(v47 + 8))(v22, v48);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v27, v10);
        v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
        v30 = (uint64_t)v46;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v46, 1, 2, v39);
      }
      v42 = (uint64_t)v58;
      v37 = v53;
      goto LABEL_12;
    }
    v31 = v10;
    v32 = sub_23C34EAC0();
    swift_allocError();
    v34 = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B576B0);
    *v34 = State;
    v35 = v57;
    sub_23C34EB44();
    sub_23C34EAB4();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v32 - 8) + 104))(v34, *MEMORY[0x24BEE26D0], v32);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v59 + 8))(v35, v31);
  }
  v42 = (uint64_t)v58;
  return __swift_destroy_boxed_opaque_existential_1(v42);
}

uint64_t sub_23C348404@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return WorkoutDetailLoadState.init(from:)(a1, a2);
}

uint64_t sub_23C348418(_QWORD *a1)
{
  return WorkoutDetailLoadState.encode(to:)(a1);
}

uint64_t WorkoutDetailLoadState.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t State;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v2 = v1;
  v4 = type metadata accessor for WorkoutDetail();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  State = type metadata accessor for WorkoutDetailLoadState();
  MEMORY[0x24BDAC7A8](State);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C347828(v2, (uint64_t)v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v9, 2, v10))
    return sub_23C34EC88();
  sub_23C2851C0((uint64_t)v9, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetail);
  sub_23C34EC88();
  WorkoutDetail.hash(into:)(a1);
  return sub_23C283550((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetail);
}

uint64_t WorkoutDetailLoadState.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t State;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _BYTE v11[72];

  v1 = v0;
  v2 = type metadata accessor for WorkoutDetail();
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v11[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  State = type metadata accessor for WorkoutDetailLoadState();
  MEMORY[0x24BDAC7A8](State);
  v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_23C34EC7C();
  sub_23C347828(v1, (uint64_t)v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v7, 2, v8))
  {
    sub_23C34EC88();
  }
  else
  {
    sub_23C2851C0((uint64_t)v7, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetail);
    sub_23C34EC88();
    WorkoutDetail.hash(into:)((uint64_t)v11);
    sub_23C283550((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetail);
  }
  return sub_23C34ECAC();
}

uint64_t sub_23C348688(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v2 = v1;
  v4 = type metadata accessor for WorkoutDetail();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C347828(v2, (uint64_t)v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v9, 2, v10))
    return sub_23C34EC88();
  sub_23C2851C0((uint64_t)v9, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetail);
  sub_23C34EC88();
  WorkoutDetail.hash(into:)(a1);
  return sub_23C283550((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetail);
}

uint64_t sub_23C3487A0()
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
  _BYTE v11[72];

  v1 = v0;
  v2 = type metadata accessor for WorkoutDetail();
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v11[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_23C34EC7C();
  sub_23C347828(v1, (uint64_t)v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v7, 2, v8))
  {
    sub_23C34EC88();
  }
  else
  {
    sub_23C2851C0((uint64_t)v7, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetail);
    sub_23C34EC88();
    WorkoutDetail.hash(into:)((uint64_t)v11);
    sub_23C283550((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetail);
  }
  return sub_23C34ECAC();
}

BOOL _s20FitnessProductDetail07WorkoutC9LoadStateO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t State;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(char *, uint64_t, uint64_t);
  int v17;
  BOOL v18;
  uint64_t v20;

  v4 = type metadata accessor for WorkoutDetail();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  State = type metadata accessor for WorkoutDetailLoadState();
  MEMORY[0x24BDAC7A8](State);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D458);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (uint64_t)&v12[*(int *)(v13 + 48)];
  sub_23C347828(a1, (uint64_t)v12);
  sub_23C347828(a2, v14);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
  v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 48);
  v17 = v16(v12, 2, v15);
  if (!v17)
  {
    sub_23C347828((uint64_t)v12, (uint64_t)v9);
    if (!v16((char *)v14, 2, v15))
    {
      sub_23C2851C0(v14, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetail);
      v18 = static WorkoutDetail.== infix(_:_:)((uint64_t)v9, (uint64_t)v6);
      sub_23C283550((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetail);
      sub_23C283550((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetail);
      sub_23C283550((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetailLoadState);
      return v18;
    }
    sub_23C283550((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetail);
    goto LABEL_9;
  }
  if (v17 == 1)
  {
    if (v16((char *)v14, 2, v15) != 1)
      goto LABEL_9;
  }
  else if (v16((char *)v14, 2, v15) != 2)
  {
LABEL_9:
    sub_23C285184((uint64_t)v12, &qword_256B5D458);
    return 0;
  }
  sub_23C283550((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutDetailLoadState);
  return 1;
}

uint64_t sub_23C348AF8()
{
  return sub_23C27FEE4(&qword_256B5D380, (uint64_t (*)(uint64_t))type metadata accessor for WorkoutDetailLoadState, (uint64_t)&protocol conformance descriptor for WorkoutDetailLoadState);
}

uint64_t *initializeBufferWithCopyOfBuffer for WorkoutDetailLoadState(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  void (*v65)(char *, char *, uint64_t);
  uint64_t v66;
  _QWORD *v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  char *v74;
  char *v75;
  void (*v76)(uint64_t *, _QWORD, uint64_t, uint64_t);
  uint64_t v78;
  uint64_t v79;
  void (*v80)(char *, char *, uint64_t);
  uint64_t v81;
  unsigned int (*v82)(char *, uint64_t, uint64_t);

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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v81 = v8;
      v10 = sub_23C34D86C();
      v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
      v11((char *)a1, (char *)a2, v10);
      v12 = (int *)type metadata accessor for WorkoutDetail();
      *(uint64_t *)((char *)a1 + v12[5]) = *(uint64_t *)((char *)a2 + v12[5]);
      v13 = v12[6];
      v14 = (char *)a1 + v13;
      v15 = (char *)a2 + v13;
      swift_bridgeObjectRetain();
      v11(v14, v15, v10);
      v16 = v12[7];
      v17 = (char *)a1 + v16;
      v18 = (char *)a2 + v16;
      v19 = sub_23C34DA94();
      v20 = *(_QWORD *)(v19 - 8);
      v78 = v7;
      v79 = v10;
      v80 = v11;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
      {
        v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E18);
        memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      }
      v22 = type metadata accessor for WorkoutDetailArtwork();
      v23 = *(int *)(v22 + 20);
      v24 = &v17[v23];
      v25 = &v18[v23];
      v26 = sub_23C34D950();
      v27 = *(_QWORD *)(v26 - 8);
      v82 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
      if (v82(v25, 1, v26))
      {
        v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
        memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v24, v25, v26);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
      }
      v29 = *(int *)(v22 + 24);
      v30 = &v17[v29];
      v31 = &v18[v29];
      v32 = *((_QWORD *)v31 + 1);
      *(_QWORD *)v30 = *(_QWORD *)v31;
      *((_QWORD *)v30 + 1) = v32;
      v33 = v12[8];
      v34 = (uint64_t *)((char *)a1 + v33);
      v35 = (uint64_t *)((char *)a2 + v33);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B58ED8);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v36 = sub_23C34DAC4();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v36 - 8) + 16))(v34, v35, v36);
      }
      else
      {
        v37 = v35[1];
        *v34 = *v35;
        v34[1] = v37;
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
      *(uint64_t *)((char *)a1 + v12[9]) = *(uint64_t *)((char *)a2 + v12[9]);
      v38 = v12[10];
      v39 = (char *)a1 + v38;
      v40 = (char *)a2 + v38;
      swift_bridgeObjectRetain();
      v80(v39, v40, v79);
      v80((char *)a1 + v12[11], (char *)a2 + v12[11], v79);
      v80((char *)a1 + v12[12], (char *)a2 + v12[12], v79);
      v41 = v12[13];
      v42 = (uint64_t *)((char *)a1 + v41);
      v43 = (uint64_t *)((char *)a2 + v41);
      v44 = v43[1];
      *v42 = *v43;
      v42[1] = v44;
      *((_BYTE *)a1 + v12[14]) = *((_BYTE *)a2 + v12[14]);
      v45 = v12[15];
      v46 = (uint64_t *)((char *)a1 + v45);
      v47 = (uint64_t *)((char *)a2 + v45);
      v48 = v47[1];
      *v46 = *v47;
      v46[1] = v48;
      v49 = v12[16];
      v50 = (char *)a1 + v49;
      v51 = (char *)a2 + v49;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v82(v51, 1, v26))
      {
        v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
        memcpy(v50, v51, *(_QWORD *)(*(_QWORD *)(v52 - 8) + 64));
        v53 = v27;
      }
      else
      {
        v53 = v27;
        (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v50, v51, v26);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v50, 0, 1, v26);
      }
      *(uint64_t *)((char *)a1 + v12[17]) = *(uint64_t *)((char *)a2 + v12[17]);
      v54 = v12[18];
      v55 = (char *)a1 + v54;
      v56 = (char *)a2 + v54;
      swift_bridgeObjectRetain();
      if (v82(v56, 1, v26))
      {
        v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
        memcpy(v55, v56, *(_QWORD *)(*(_QWORD *)(v57 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v55, v56, v26);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v53 + 56))(v55, 0, 1, v26);
      }
      v58 = v12[19];
      v59 = (uint64_t *)((char *)a1 + v58);
      v60 = (uint64_t *)((char *)a2 + v58);
      v61 = v60[1];
      *v59 = *v60;
      v59[1] = v61;
      v62 = v12[20];
      v63 = (char *)a1 + v62;
      v64 = (char *)a2 + v62;
      swift_bridgeObjectRetain();
      v80(v63, v64, v79);
      v65 = *(void (**)(char *, char *, uint64_t))(v53 + 16);
      v65((char *)a1 + v12[21], (char *)a2 + v12[21], v26);
      v65((char *)a1 + v12[22], (char *)a2 + v12[22], v26);
      v66 = v12[23];
      v67 = (uint64_t *)((char *)a1 + v66);
      v68 = (uint64_t *)((char *)a2 + v66);
      v69 = v68[1];
      *v67 = *v68;
      v67[1] = v69;
      v70 = v12[24];
      v71 = (char *)a1 + v70;
      v72 = (char *)a2 + v70;
      swift_bridgeObjectRetain();
      v80(v71, v72, v79);
      v80((char *)a1 + v12[25], (char *)a2 + v12[25], v79);
      *(uint64_t *)((char *)a1 + v12[26]) = *(uint64_t *)((char *)a2 + v12[26]);
      *((_BYTE *)a1 + v12[27]) = *((_BYTE *)a2 + v12[27]);
      v73 = v12[28];
      v74 = (char *)a1 + v73;
      v75 = (char *)a2 + v73;
      *(_QWORD *)v74 = *(_QWORD *)v75;
      *(_DWORD *)(v74 + 7) = *(_DWORD *)(v75 + 7);
      v76 = *(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v81 + 56);
      swift_bridgeObjectRetain();
      v76(a1, 0, 2, v78);
    }
  }
  return a1;
}

uint64_t destroy for WorkoutDetailLoadState(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 2, v2);
  if (!(_DWORD)result)
  {
    v4 = sub_23C34D86C();
    v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
    v5(a1, v4);
    v6 = (int *)type metadata accessor for WorkoutDetail();
    swift_bridgeObjectRelease();
    v5(a1 + v6[6], v4);
    v7 = a1 + v6[7];
    v8 = sub_23C34DA94();
    v9 = *(_QWORD *)(v8 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    v10 = v7 + *(int *)(type metadata accessor for WorkoutDetailArtwork() + 20);
    v11 = sub_23C34D950();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    if (!v13(v10, 1, v11))
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    swift_bridgeObjectRelease();
    v14 = a1 + v6[8];
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B58ED8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = sub_23C34DAC4();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    v5(a1 + v6[10], v4);
    v5(a1 + v6[11], v4);
    v5(a1 + v6[12], v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v16 = a1 + v6[16];
    if (!v13(v16, 1, v11))
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v16, v11);
    swift_bridgeObjectRelease();
    v17 = a1 + v6[18];
    if (!v13(v17, 1, v11))
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v17, v11);
    swift_bridgeObjectRelease();
    v5(a1 + v6[20], v4);
    v18 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v18(a1 + v6[21], v11);
    v18(a1 + v6[22], v11);
    swift_bridgeObjectRelease();
    v5(a1 + v6[24], v4);
    v5(a1 + v6[25], v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

char *initializeWithCopy for WorkoutDetailLoadState(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  void (*v63)(char *, char *, uint64_t);
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  char *v72;
  char *v73;
  void (*v74)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  void (*v78)(char *, char *, uint64_t);
  uint64_t v79;
  unsigned int (*v80)(char *, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v79 = v7;
    v8 = sub_23C34D86C();
    v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
    v9(a1, a2, v8);
    v10 = (int *)type metadata accessor for WorkoutDetail();
    *(_QWORD *)&a1[v10[5]] = *(_QWORD *)&a2[v10[5]];
    v11 = v10[6];
    v12 = &a1[v11];
    v13 = &a2[v11];
    swift_bridgeObjectRetain();
    v9(v12, v13, v8);
    v14 = v10[7];
    v15 = &a1[v14];
    v16 = &a2[v14];
    v17 = sub_23C34DA94();
    v18 = *(_QWORD *)(v17 - 8);
    v76 = v6;
    v77 = v8;
    v78 = v9;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E18);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
    v20 = type metadata accessor for WorkoutDetailArtwork();
    v21 = *(int *)(v20 + 20);
    v22 = &v15[v21];
    v23 = &v16[v21];
    v24 = sub_23C34D950();
    v25 = *(_QWORD *)(v24 - 8);
    v80 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
    if (v80(v23, 1, v24))
    {
      v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
      memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
    v27 = *(int *)(v20 + 24);
    v28 = &v15[v27];
    v29 = &v16[v27];
    v30 = *((_QWORD *)v29 + 1);
    *(_QWORD *)v28 = *(_QWORD *)v29;
    *((_QWORD *)v28 + 1) = v30;
    v31 = v10[8];
    v32 = &a1[v31];
    v33 = &a2[v31];
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B58ED8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v34 = sub_23C34DAC4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v32, v33, v34);
    }
    else
    {
      v35 = *((_QWORD *)v33 + 1);
      *(_QWORD *)v32 = *(_QWORD *)v33;
      *((_QWORD *)v32 + 1) = v35;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
    *(_QWORD *)&a1[v10[9]] = *(_QWORD *)&a2[v10[9]];
    v36 = v10[10];
    v37 = &a1[v36];
    v38 = &a2[v36];
    swift_bridgeObjectRetain();
    v78(v37, v38, v77);
    v78(&a1[v10[11]], &a2[v10[11]], v77);
    v78(&a1[v10[12]], &a2[v10[12]], v77);
    v39 = v10[13];
    v40 = &a1[v39];
    v41 = &a2[v39];
    v42 = *((_QWORD *)v41 + 1);
    *(_QWORD *)v40 = *(_QWORD *)v41;
    *((_QWORD *)v40 + 1) = v42;
    a1[v10[14]] = a2[v10[14]];
    v43 = v10[15];
    v44 = &a1[v43];
    v45 = &a2[v43];
    v46 = *((_QWORD *)v45 + 1);
    *(_QWORD *)v44 = *(_QWORD *)v45;
    *((_QWORD *)v44 + 1) = v46;
    v47 = v10[16];
    v48 = &a1[v47];
    v49 = &a2[v47];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v80(v49, 1, v24))
    {
      v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
      memcpy(v48, v49, *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64));
      v51 = v25;
    }
    else
    {
      v51 = v25;
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v48, v49, v24);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v48, 0, 1, v24);
    }
    *(_QWORD *)&a1[v10[17]] = *(_QWORD *)&a2[v10[17]];
    v52 = v10[18];
    v53 = &a1[v52];
    v54 = &a2[v52];
    swift_bridgeObjectRetain();
    if (v80(v54, 1, v24))
    {
      v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
      memcpy(v53, v54, *(_QWORD *)(*(_QWORD *)(v55 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v53, v54, v24);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v51 + 56))(v53, 0, 1, v24);
    }
    v56 = v10[19];
    v57 = &a1[v56];
    v58 = &a2[v56];
    v59 = *((_QWORD *)v58 + 1);
    *(_QWORD *)v57 = *(_QWORD *)v58;
    *((_QWORD *)v57 + 1) = v59;
    v60 = v10[20];
    v61 = &a1[v60];
    v62 = &a2[v60];
    swift_bridgeObjectRetain();
    v78(v61, v62, v77);
    v63 = *(void (**)(char *, char *, uint64_t))(v51 + 16);
    v63(&a1[v10[21]], &a2[v10[21]], v24);
    v63(&a1[v10[22]], &a2[v10[22]], v24);
    v64 = v10[23];
    v65 = &a1[v64];
    v66 = &a2[v64];
    v67 = *((_QWORD *)v66 + 1);
    *(_QWORD *)v65 = *(_QWORD *)v66;
    *((_QWORD *)v65 + 1) = v67;
    v68 = v10[24];
    v69 = &a1[v68];
    v70 = &a2[v68];
    swift_bridgeObjectRetain();
    v78(v69, v70, v77);
    v78(&a1[v10[25]], &a2[v10[25]], v77);
    *(_QWORD *)&a1[v10[26]] = *(_QWORD *)&a2[v10[26]];
    a1[v10[27]] = a2[v10[27]];
    v71 = v10[28];
    v72 = &a1[v71];
    v73 = &a2[v71];
    *(_QWORD *)v72 = *(_QWORD *)v73;
    *(_DWORD *)(v72 + 7) = *(_DWORD *)(v73 + 7);
    v74 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v79 + 56);
    swift_bridgeObjectRetain();
    v74(a1, 0, 2, v76);
  }
  return a1;
}

_BYTE *assignWithCopy for WorkoutDetailLoadState(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_BYTE *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(_BYTE *, _BYTE *, uint64_t);
  int *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(char *, uint64_t, uint64_t);
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  _QWORD *v69;
  uint64_t v70;
  char *v71;
  char *v72;
  void (*v73)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v74;
  _QWORD *v75;
  _QWORD *v76;
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  char *v81;
  char *v82;
  int v83;
  void (*v84)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t (*v91)(char *, uint64_t, uint64_t);
  int v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  char *v98;
  char *v99;
  uint64_t v100;
  char *v101;
  char *v102;
  uint64_t v103;
  _QWORD *v104;
  _QWORD *v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD *v108;
  _QWORD *v109;
  uint64_t v110;
  _QWORD *v111;
  _QWORD *v112;
  uint64_t v113;
  char *v114;
  char *v115;
  int v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  char *v121;
  int v122;
  int v123;
  uint64_t v124;
  uint64_t v125;
  _QWORD *v126;
  _QWORD *v127;
  void (*v128)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v129;
  _QWORD *v130;
  _QWORD *v131;
  uint64_t v132;
  char *v133;
  char *v134;
  uint64_t v135;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  void (*v140)(char *, char *, uint64_t);
  void (*v141)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  unsigned int (*v146)(char *, uint64_t, uint64_t);
  uint64_t (*v147)(char *, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 2, v6);
  v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_23C285184((uint64_t)a1, &qword_256B5D318);
      goto LABEL_7;
    }
    v23 = sub_23C34D86C();
    v24 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v23 - 8) + 24);
    v24(a1, a2, v23);
    v25 = (int *)type metadata accessor for WorkoutDetail();
    *(_QWORD *)&a1[v25[5]] = *(_QWORD *)&a2[v25[5]];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v141 = v24;
    v143 = v23;
    v24(&a1[v25[6]], &a2[v25[6]], v23);
    v26 = v25[7];
    v27 = &a1[v26];
    v28 = &a2[v26];
    v29 = sub_23C34DA94();
    v30 = *(_QWORD *)(v29 - 8);
    v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v30 + 48);
    v32 = v31(v27, 1, v29);
    v33 = v31(v28, 1, v29);
    if (v32)
    {
      if (!v33)
      {
        (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
        goto LABEL_28;
      }
    }
    else
    {
      if (!v33)
      {
        (*(void (**)(char *, char *, uint64_t))(v30 + 24))(v27, v28, v29);
LABEL_28:
        v139 = type metadata accessor for WorkoutDetailArtwork();
        v86 = *(int *)(v139 + 20);
        v87 = &v27[v86];
        v145 = v28;
        v88 = &v28[v86];
        v89 = sub_23C34D950();
        v90 = *(_QWORD *)(v89 - 8);
        v91 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v90 + 48);
        v92 = v91(v87, 1, v89);
        v147 = v91;
        v93 = v91(v88, 1, v89);
        if (v92)
        {
          if (v93)
          {
            v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
            memcpy(v87, v88, *(_QWORD *)(*(_QWORD *)(v94 - 8) + 64));
            v95 = v90;
          }
          else
          {
            v98 = v88;
            v95 = v90;
            (*(void (**)(char *, char *, uint64_t))(v90 + 16))(v87, v98, v89);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v90 + 56))(v87, 0, 1, v89);
          }
        }
        else if (v93)
        {
          (*(void (**)(char *, uint64_t))(v90 + 8))(v87, v89);
          v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
          v97 = v88;
          v95 = v90;
          memcpy(v87, v97, *(_QWORD *)(*(_QWORD *)(v96 - 8) + 64));
        }
        else
        {
          v99 = v88;
          v95 = v90;
          (*(void (**)(char *, char *, uint64_t))(v90 + 24))(v87, v99, v89);
        }
        v100 = *(int *)(v139 + 24);
        v101 = &v27[v100];
        v102 = &v145[v100];
        *(_QWORD *)v101 = *(_QWORD *)v102;
        *((_QWORD *)v101 + 1) = *((_QWORD *)v102 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (a1 != a2)
        {
          v103 = v25[8];
          v104 = &a1[v103];
          v105 = &a2[v103];
          sub_23C285184((uint64_t)&a1[v103], &qword_256B58ED8);
          __swift_instantiateConcreteTypeFromMangledName(&qword_256B58ED8);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            v106 = sub_23C34DAC4();
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v106 - 8) + 16))(v104, v105, v106);
          }
          else
          {
            *v104 = *v105;
            v104[1] = v105[1];
            swift_bridgeObjectRetain();
          }
          swift_storeEnumTagMultiPayload();
        }
        *(_QWORD *)&a1[v25[9]] = *(_QWORD *)&a2[v25[9]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v141(&a1[v25[10]], &a2[v25[10]], v143);
        v141(&a1[v25[11]], &a2[v25[11]], v143);
        v141(&a1[v25[12]], &a2[v25[12]], v143);
        v107 = v25[13];
        v108 = &a1[v107];
        v109 = &a2[v107];
        *v108 = *v109;
        v108[1] = v109[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        a1[v25[14]] = a2[v25[14]];
        v110 = v25[15];
        v111 = &a1[v110];
        v112 = &a2[v110];
        *v111 = *v112;
        v111[1] = v112[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v113 = v25[16];
        v114 = &a1[v113];
        v115 = &a2[v113];
        v116 = v147(&a1[v113], 1, v89);
        v117 = v147(v115, 1, v89);
        if (v116)
        {
          if (!v117)
          {
            (*(void (**)(char *, char *, uint64_t))(v95 + 16))(v114, v115, v89);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v95 + 56))(v114, 0, 1, v89);
            goto LABEL_47;
          }
        }
        else
        {
          if (!v117)
          {
            (*(void (**)(char *, char *, uint64_t))(v95 + 24))(v114, v115, v89);
LABEL_47:
            *(_QWORD *)&a1[v25[17]] = *(_QWORD *)&a2[v25[17]];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            v119 = v25[18];
            v120 = &a1[v119];
            v121 = &a2[v119];
            v122 = v147(&a1[v119], 1, v89);
            v123 = v147(v121, 1, v89);
            if (v122)
            {
              if (!v123)
              {
                (*(void (**)(char *, char *, uint64_t))(v95 + 16))(v120, v121, v89);
                (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v95 + 56))(v120, 0, 1, v89);
LABEL_53:
                v125 = v25[19];
                v126 = &a1[v125];
                v127 = &a2[v125];
                *v126 = *v127;
                v126[1] = v127[1];
                swift_bridgeObjectRetain();
                swift_bridgeObjectRelease();
                v141(&a1[v25[20]], &a2[v25[20]], v143);
                v128 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v95 + 24);
                v128(&a1[v25[21]], &a2[v25[21]], v89);
                v128(&a1[v25[22]], &a2[v25[22]], v89);
                v129 = v25[23];
                v130 = &a1[v129];
                v131 = &a2[v129];
                *v130 = *v131;
                v130[1] = v131[1];
                swift_bridgeObjectRetain();
                swift_bridgeObjectRelease();
                v141(&a1[v25[24]], &a2[v25[24]], v143);
                v141(&a1[v25[25]], &a2[v25[25]], v143);
                *(_QWORD *)&a1[v25[26]] = *(_QWORD *)&a2[v25[26]];
                swift_bridgeObjectRetain();
                swift_bridgeObjectRelease();
                a1[v25[27]] = a2[v25[27]];
                v132 = v25[28];
                v133 = &a1[v132];
                v134 = &a2[v132];
                v135 = *(_QWORD *)v134;
                *(_DWORD *)(v133 + 7) = *(_DWORD *)(v134 + 7);
                *(_QWORD *)v133 = v135;
                return a1;
              }
            }
            else
            {
              if (!v123)
              {
                (*(void (**)(char *, char *, uint64_t))(v95 + 24))(v120, v121, v89);
                goto LABEL_53;
              }
              (*(void (**)(char *, uint64_t))(v95 + 8))(v120, v89);
            }
            v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
            memcpy(v120, v121, *(_QWORD *)(*(_QWORD *)(v124 - 8) + 64));
            goto LABEL_53;
          }
          (*(void (**)(char *, uint64_t))(v95 + 8))(v114, v89);
        }
        v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
        memcpy(v114, v115, *(_QWORD *)(*(_QWORD *)(v118 - 8) + 64));
        goto LABEL_47;
      }
      (*(void (**)(char *, uint64_t))(v30 + 8))(v27, v29);
    }
    v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E18);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v85 - 8) + 64));
    goto LABEL_28;
  }
  if (v10)
  {
LABEL_7:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v144 = v7;
  v11 = sub_23C34D86C();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  v12(a1, a2, v11);
  v13 = (int *)type metadata accessor for WorkoutDetail();
  *(_QWORD *)&a1[v13[5]] = *(_QWORD *)&a2[v13[5]];
  v14 = v13[6];
  v15 = &a1[v14];
  v16 = &a2[v14];
  swift_bridgeObjectRetain();
  v12(v15, v16, v11);
  v17 = v13[7];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = sub_23C34DA94();
  v21 = *(_QWORD *)(v20 - 8);
  v140 = v12;
  v142 = v11;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E18);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  v34 = type metadata accessor for WorkoutDetailArtwork();
  v35 = *(int *)(v34 + 20);
  v137 = v18;
  v36 = &v18[v35];
  v37 = &v19[v35];
  v38 = sub_23C34D950();
  v39 = *(_QWORD *)(v38 - 8);
  v146 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
  v138 = v39;
  if (v146(v37, 1, v38))
  {
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
    memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v36, v37, v38);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v38);
  }
  v41 = v38;
  v42 = *(int *)(v34 + 24);
  v43 = &v137[v42];
  v44 = &v19[v42];
  *(_QWORD *)v43 = *(_QWORD *)v44;
  *((_QWORD *)v43 + 1) = *((_QWORD *)v44 + 1);
  v45 = v13[8];
  v46 = &a1[v45];
  v47 = &a2[v45];
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B58ED8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v48 = sub_23C34DAC4();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v48 - 8) + 16))(v46, v47, v48);
  }
  else
  {
    *v46 = *v47;
    v46[1] = v47[1];
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)&a1[v13[9]] = *(_QWORD *)&a2[v13[9]];
  v49 = v13[10];
  v50 = &a1[v49];
  v51 = &a2[v49];
  swift_bridgeObjectRetain();
  v140(v50, v51, v142);
  v140(&a1[v13[11]], &a2[v13[11]], v142);
  v140(&a1[v13[12]], &a2[v13[12]], v142);
  v52 = v13[13];
  v53 = &a1[v52];
  v54 = &a2[v52];
  *v53 = *v54;
  v53[1] = v54[1];
  a1[v13[14]] = a2[v13[14]];
  v55 = v13[15];
  v56 = &a1[v55];
  v57 = &a2[v55];
  *v56 = *v57;
  v56[1] = v57[1];
  v58 = v13[16];
  v59 = &a1[v58];
  v60 = &a2[v58];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v146(v60, 1, v41))
  {
    v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
    memcpy(v59, v60, *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64));
    v62 = v138;
  }
  else
  {
    v62 = v138;
    (*(void (**)(char *, char *, uint64_t))(v138 + 16))(v59, v60, v41);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v138 + 56))(v59, 0, 1, v41);
  }
  *(_QWORD *)&a1[v13[17]] = *(_QWORD *)&a2[v13[17]];
  v63 = v13[18];
  v64 = &a1[v63];
  v65 = &a2[v63];
  swift_bridgeObjectRetain();
  if (v146(v65, 1, v41))
  {
    v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
    memcpy(v64, v65, *(_QWORD *)(*(_QWORD *)(v66 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v64, v65, v41);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v62 + 56))(v64, 0, 1, v41);
  }
  v67 = v13[19];
  v68 = &a1[v67];
  v69 = &a2[v67];
  *v68 = *v69;
  v68[1] = v69[1];
  v70 = v13[20];
  v71 = &a1[v70];
  v72 = &a2[v70];
  swift_bridgeObjectRetain();
  v140(v71, v72, v142);
  v73 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v62 + 16);
  v73(&a1[v13[21]], &a2[v13[21]], v41);
  v73(&a1[v13[22]], &a2[v13[22]], v41);
  v74 = v13[23];
  v75 = &a1[v74];
  v76 = &a2[v74];
  *v75 = *v76;
  v75[1] = v76[1];
  v77 = v13[24];
  v78 = &a1[v77];
  v79 = &a2[v77];
  swift_bridgeObjectRetain();
  v140(v78, v79, v142);
  v140(&a1[v13[25]], &a2[v13[25]], v142);
  *(_QWORD *)&a1[v13[26]] = *(_QWORD *)&a2[v13[26]];
  a1[v13[27]] = a2[v13[27]];
  v80 = v13[28];
  v81 = &a1[v80];
  v82 = &a2[v80];
  v83 = *(_DWORD *)(v82 + 7);
  *(_QWORD *)v81 = *(_QWORD *)v82;
  *(_DWORD *)(v81 + 7) = v83;
  v84 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v144 + 56);
  swift_bridgeObjectRetain();
  v84(a1, 0, 2, v6);
  return a1;
}

char *initializeWithTake for WorkoutDetailLoadState(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  void (*v39)(char *, char *, uint64_t);
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  unsigned int (*v49)(char *, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v45 = v6;
    v47 = sub_23C34D86C();
    v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v47 - 8) + 32);
    v8(a1, a2, v47);
    v9 = (int *)type metadata accessor for WorkoutDetail();
    *(_QWORD *)&a1[v9[5]] = *(_QWORD *)&a2[v9[5]];
    v8(&a1[v9[6]], &a2[v9[6]], v47);
    v10 = v9[7];
    v11 = &a1[v10];
    v12 = &a2[v10];
    v13 = sub_23C34DA94();
    v14 = *(_QWORD *)(v13 - 8);
    v44 = v7;
    v46 = v8;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E18);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
    v16 = type metadata accessor for WorkoutDetailArtwork();
    v17 = *(int *)(v16 + 20);
    v18 = &v11[v17];
    v19 = &v12[v17];
    v20 = sub_23C34D950();
    v21 = *(_QWORD *)(v20 - 8);
    v49 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
    v48 = v21;
    if (v49(v19, 1, v20))
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v18, v19, v20);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    *(_OWORD *)&v11[*(int *)(v16 + 24)] = *(_OWORD *)&v12[*(int *)(v16 + 24)];
    v23 = v9[8];
    v24 = &a1[v23];
    v25 = &a2[v23];
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58ED8);
    v27 = v47;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v28 = sub_23C34DAC4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v24, v25, v28);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
    *(_QWORD *)&a1[v9[9]] = *(_QWORD *)&a2[v9[9]];
    v46(&a1[v9[10]], &a2[v9[10]], v47);
    v46(&a1[v9[11]], &a2[v9[11]], v47);
    v46(&a1[v9[12]], &a2[v9[12]], v47);
    *(_OWORD *)&a1[v9[13]] = *(_OWORD *)&a2[v9[13]];
    a1[v9[14]] = a2[v9[14]];
    *(_OWORD *)&a1[v9[15]] = *(_OWORD *)&a2[v9[15]];
    v29 = v9[16];
    v30 = &a1[v29];
    v31 = &a2[v29];
    if (v49(&a2[v29], 1, v20))
    {
      v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
      memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v30, v31, v20);
      v27 = v47;
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v48 + 56))(v30, 0, 1, v20);
    }
    *(_QWORD *)&a1[v9[17]] = *(_QWORD *)&a2[v9[17]];
    v33 = v9[18];
    v34 = &a1[v33];
    v35 = &a2[v33];
    if (v49(&a2[v33], 1, v20))
    {
      v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
      memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
      v37 = v48;
    }
    else
    {
      v38 = v35;
      v37 = v48;
      (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v34, v38, v20);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v48 + 56))(v34, 0, 1, v20);
    }
    *(_OWORD *)&a1[v9[19]] = *(_OWORD *)&a2[v9[19]];
    v46(&a1[v9[20]], &a2[v9[20]], v27);
    v39 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
    v39(&a1[v9[21]], &a2[v9[21]], v20);
    v39(&a1[v9[22]], &a2[v9[22]], v20);
    *(_OWORD *)&a1[v9[23]] = *(_OWORD *)&a2[v9[23]];
    v46(&a1[v9[24]], &a2[v9[24]], v27);
    v46(&a1[v9[25]], &a2[v9[25]], v27);
    *(_QWORD *)&a1[v9[26]] = *(_QWORD *)&a2[v9[26]];
    a1[v9[27]] = a2[v9[27]];
    v40 = v9[28];
    v41 = &a1[v40];
    v42 = &a2[v40];
    *(_QWORD *)v41 = *(_QWORD *)v42;
    *(_DWORD *)(v41 + 7) = *(_DWORD *)(v42 + 7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v44 + 56))(a1, 0, 2, v45);
  }
  return a1;
}

_BYTE *assignWithTake for WorkoutDetailLoadState(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_BYTE *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  void (*v12)(_BYTE *, _BYTE *, uint64_t);
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_BYTE *, _BYTE *, uint64_t);
  int *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(char *, uint64_t, uint64_t);
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  void (*v51)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t (*v61)(char *, uint64_t, uint64_t);
  int v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;
  int v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  char *v93;
  int v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD *v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  void (*v104)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v105;
  _QWORD *v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  char *v112;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  void (*v118)(_BYTE *, _BYTE *, uint64_t);
  void (*v119)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unsigned int (*v124)(char *, uint64_t, uint64_t);
  uint64_t (*v125)(char *, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 2, v6);
  v10 = v8(a2, 2, v6);
  if (v9)
  {
    if (!v10)
    {
      v122 = v7;
      v11 = sub_23C34D86C();
      v12 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 32);
      v12(a1, a2, v11);
      v13 = (int *)type metadata accessor for WorkoutDetail();
      *(_QWORD *)&a1[v13[5]] = *(_QWORD *)&a2[v13[5]];
      v120 = v11;
      v12(&a1[v13[6]], &a2[v13[6]], v11);
      v14 = v13[7];
      v15 = &a1[v14];
      v16 = &a2[v14];
      v17 = sub_23C34DA94();
      v18 = *(_QWORD *)(v17 - 8);
      v118 = v12;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
      {
        v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E18);
        memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      }
      v31 = type metadata accessor for WorkoutDetailArtwork();
      v32 = *(int *)(v31 + 20);
      v114 = v15;
      v33 = &v15[v32];
      v34 = &v16[v32];
      v35 = sub_23C34D950();
      v36 = *(_QWORD *)(v35 - 8);
      v124 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
      v116 = v36;
      if (v124(v34, 1, v35))
      {
        v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
        memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v33, v34, v35);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
      }
      *(_OWORD *)&v114[*(int *)(v31 + 24)] = *(_OWORD *)&v16[*(int *)(v31 + 24)];
      v38 = v13[8];
      v39 = &a1[v38];
      v40 = &a2[v38];
      v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58ED8);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v42 = sub_23C34DAC4();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v42 - 8) + 32))(v39, v40, v42);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
      }
      *(_QWORD *)&a1[v13[9]] = *(_QWORD *)&a2[v13[9]];
      v118(&a1[v13[10]], &a2[v13[10]], v120);
      v118(&a1[v13[11]], &a2[v13[11]], v120);
      v118(&a1[v13[12]], &a2[v13[12]], v120);
      *(_OWORD *)&a1[v13[13]] = *(_OWORD *)&a2[v13[13]];
      a1[v13[14]] = a2[v13[14]];
      *(_OWORD *)&a1[v13[15]] = *(_OWORD *)&a2[v13[15]];
      v43 = v13[16];
      v44 = &a1[v43];
      v45 = &a2[v43];
      if (v124(&a2[v43], 1, v35))
      {
        v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
        memcpy(v44, v45, *(_QWORD *)(*(_QWORD *)(v46 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v116 + 32))(v44, v45, v35);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v116 + 56))(v44, 0, 1, v35);
      }
      *(_QWORD *)&a1[v13[17]] = *(_QWORD *)&a2[v13[17]];
      v47 = v13[18];
      v48 = &a1[v47];
      v49 = &a2[v47];
      if (v124(&a2[v47], 1, v35))
      {
        v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
        memcpy(v48, v49, *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v116 + 32))(v48, v49, v35);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v116 + 56))(v48, 0, 1, v35);
      }
      *(_OWORD *)&a1[v13[19]] = *(_OWORD *)&a2[v13[19]];
      v118(&a1[v13[20]], &a2[v13[20]], v120);
      v51 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v116 + 32);
      v51(&a1[v13[21]], &a2[v13[21]], v35);
      v51(&a1[v13[22]], &a2[v13[22]], v35);
      *(_OWORD *)&a1[v13[23]] = *(_OWORD *)&a2[v13[23]];
      v118(&a1[v13[24]], &a2[v13[24]], v120);
      v118(&a1[v13[25]], &a2[v13[25]], v120);
      *(_QWORD *)&a1[v13[26]] = *(_QWORD *)&a2[v13[26]];
      a1[v13[27]] = a2[v13[27]];
      v52 = v13[28];
      v53 = &a1[v52];
      v54 = &a2[v52];
      *(_QWORD *)v53 = *(_QWORD *)v54;
      *(_DWORD *)(v53 + 7) = *(_DWORD *)(v54 + 7);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v122 + 56))(a1, 0, 2, v6);
      return a1;
    }
LABEL_7:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  if (v10)
  {
    sub_23C285184((uint64_t)a1, &qword_256B5D318);
    goto LABEL_7;
  }
  v20 = sub_23C34D86C();
  v21 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v20 - 8) + 40);
  v21(a1, a2, v20);
  v22 = (int *)type metadata accessor for WorkoutDetail();
  *(_QWORD *)&a1[v22[5]] = *(_QWORD *)&a2[v22[5]];
  swift_bridgeObjectRelease();
  v119 = v21;
  v121 = v20;
  v21(&a1[v22[6]], &a2[v22[6]], v20);
  v23 = v22[7];
  v24 = &a1[v23];
  v25 = &a2[v23];
  v26 = sub_23C34DA94();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  v29 = v28(v24, 1, v26);
  v30 = v28(v25, 1, v26);
  if (v29)
  {
    if (!v30)
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v24, v25, v26);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (v30)
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v24, v26);
LABEL_27:
    v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E18);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v55 - 8) + 64));
    goto LABEL_28;
  }
  (*(void (**)(char *, char *, uint64_t))(v27 + 40))(v24, v25, v26);
LABEL_28:
  v115 = type metadata accessor for WorkoutDetailArtwork();
  v117 = v25;
  v56 = *(int *)(v115 + 20);
  v57 = &v24[v56];
  v58 = &v25[v56];
  v59 = sub_23C34D950();
  v60 = *(_QWORD *)(v59 - 8);
  v61 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v60 + 48);
  v62 = v61(v57, 1, v59);
  v125 = v61;
  v63 = v61(v58, 1, v59);
  v123 = v60;
  if (v62)
  {
    if (!v63)
    {
      (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v57, v58, v59);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v60 + 56))(v57, 0, 1, v59);
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  if (v63)
  {
    (*(void (**)(char *, uint64_t))(v60 + 8))(v57, v59);
LABEL_33:
    v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
    memcpy(v57, v58, *(_QWORD *)(*(_QWORD *)(v64 - 8) + 64));
    goto LABEL_34;
  }
  (*(void (**)(char *, char *, uint64_t))(v60 + 40))(v57, v58, v59);
LABEL_34:
  v65 = *(int *)(v115 + 24);
  v66 = &v24[v65];
  v67 = &v117[v65];
  v69 = *(_QWORD *)v67;
  v68 = *((_QWORD *)v67 + 1);
  *(_QWORD *)v66 = v69;
  *((_QWORD *)v66 + 1) = v68;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v70 = v22[8];
    v71 = &a1[v70];
    v72 = &a2[v70];
    sub_23C285184((uint64_t)&a1[v70], &qword_256B58ED8);
    v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B58ED8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v74 = sub_23C34DAC4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v74 - 8) + 32))(v71, v72, v74);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v71, v72, *(_QWORD *)(*(_QWORD *)(v73 - 8) + 64));
    }
  }
  *(_QWORD *)&a1[v22[9]] = *(_QWORD *)&a2[v22[9]];
  swift_bridgeObjectRelease();
  v119(&a1[v22[10]], &a2[v22[10]], v121);
  v119(&a1[v22[11]], &a2[v22[11]], v121);
  v119(&a1[v22[12]], &a2[v22[12]], v121);
  v75 = v22[13];
  v76 = &a1[v75];
  v77 = (uint64_t *)&a2[v75];
  v79 = *v77;
  v78 = v77[1];
  *v76 = v79;
  v76[1] = v78;
  swift_bridgeObjectRelease();
  a1[v22[14]] = a2[v22[14]];
  v80 = v22[15];
  v81 = &a1[v80];
  v82 = (uint64_t *)&a2[v80];
  v84 = *v82;
  v83 = v82[1];
  *v81 = v84;
  v81[1] = v83;
  swift_bridgeObjectRelease();
  v85 = v22[16];
  v86 = &a1[v85];
  v87 = &a2[v85];
  v88 = v125(&a1[v85], 1, v59);
  v89 = v125(v87, 1, v59);
  if (!v88)
  {
    if (!v89)
    {
      (*(void (**)(char *, char *, uint64_t))(v123 + 40))(v86, v87, v59);
      goto LABEL_44;
    }
    (*(void (**)(char *, uint64_t))(v123 + 8))(v86, v59);
    goto LABEL_43;
  }
  if (v89)
  {
LABEL_43:
    v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
    memcpy(v86, v87, *(_QWORD *)(*(_QWORD *)(v90 - 8) + 64));
    goto LABEL_44;
  }
  (*(void (**)(char *, char *, uint64_t))(v123 + 32))(v86, v87, v59);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v123 + 56))(v86, 0, 1, v59);
LABEL_44:
  *(_QWORD *)&a1[v22[17]] = *(_QWORD *)&a2[v22[17]];
  swift_bridgeObjectRelease();
  v91 = v22[18];
  v92 = &a1[v91];
  v93 = &a2[v91];
  v94 = v125(&a1[v91], 1, v59);
  v95 = v125(v93, 1, v59);
  if (v94)
  {
    if (v95)
    {
      v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
      memcpy(v92, v93, *(_QWORD *)(*(_QWORD *)(v96 - 8) + 64));
      v97 = v123;
    }
    else
    {
      v97 = v123;
      (*(void (**)(char *, char *, uint64_t))(v123 + 32))(v92, v93, v59);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v123 + 56))(v92, 0, 1, v59);
    }
  }
  else
  {
    v97 = v123;
    if (v95)
    {
      (*(void (**)(char *, uint64_t))(v123 + 8))(v92, v59);
      v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B57E20);
      memcpy(v92, v93, *(_QWORD *)(*(_QWORD *)(v98 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v123 + 40))(v92, v93, v59);
    }
  }
  v99 = v22[19];
  v100 = &a1[v99];
  v101 = (uint64_t *)&a2[v99];
  v103 = *v101;
  v102 = v101[1];
  *v100 = v103;
  v100[1] = v102;
  swift_bridgeObjectRelease();
  v119(&a1[v22[20]], &a2[v22[20]], v121);
  v104 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v97 + 40);
  v104(&a1[v22[21]], &a2[v22[21]], v59);
  v104(&a1[v22[22]], &a2[v22[22]], v59);
  v105 = v22[23];
  v106 = &a1[v105];
  v107 = (uint64_t *)&a2[v105];
  v109 = *v107;
  v108 = v107[1];
  *v106 = v109;
  v106[1] = v108;
  swift_bridgeObjectRelease();
  v119(&a1[v22[24]], &a2[v22[24]], v121);
  v119(&a1[v22[25]], &a2[v22[25]], v121);
  *(_QWORD *)&a1[v22[26]] = *(_QWORD *)&a2[v22[26]];
  swift_bridgeObjectRelease();
  a1[v22[27]] = a2[v22[27]];
  v110 = v22[28];
  v111 = &a1[v110];
  v112 = &a2[v110];
  *(_QWORD *)v111 = *(_QWORD *)v112;
  *(_DWORD *)(v111 + 7) = *(_DWORD *)(v112 + 7);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutDetailLoadState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C34B4A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 3)
    return v5 - 2;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for WorkoutDetailLoadState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C34B4FC(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 2);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_23C34B554(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 2, v2);
}

uint64_t sub_23C34B590(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D318);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 2, v4);
}

uint64_t sub_23C34B5D4()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for WorkoutDetail();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for WorkoutDetailLoadState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C34B674 + 4 * byte_23C360AF5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C34B6A8 + 4 * byte_23C360AF0[v4]))();
}

uint64_t sub_23C34B6A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C34B6B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C34B6B8);
  return result;
}

uint64_t sub_23C34B6C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C34B6CCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C34B6D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C34B6D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WorkoutDetailLoadState.CodingKeys()
{
  return &type metadata for WorkoutDetailLoadState.CodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailLoadState.IdleCodingKeys()
{
  return &type metadata for WorkoutDetailLoadState.IdleCodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailLoadState.FetchingCodingKeys()
{
  return &type metadata for WorkoutDetailLoadState.FetchingCodingKeys;
}

uint64_t storeEnumTagSinglePayload for WorkoutDetailLoadState.FetchedCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C34B754 + 4 * byte_23C360AFA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C34B774 + 4 * byte_23C360AFF[v4]))();
}

_BYTE *sub_23C34B754(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C34B774(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C34B77C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C34B784(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C34B78C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C34B794(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for WorkoutDetailLoadState.FetchedCodingKeys()
{
  return &type metadata for WorkoutDetailLoadState.FetchedCodingKeys;
}

unint64_t sub_23C34B7B4()
{
  unint64_t result;

  result = qword_256B5D408;
  if (!qword_256B5D408)
  {
    result = MEMORY[0x24261C66C](&unk_23C360CC4, &type metadata for WorkoutDetailLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D408);
  }
  return result;
}

unint64_t sub_23C34B7FC()
{
  unint64_t result;

  result = qword_256B5D410;
  if (!qword_256B5D410)
  {
    result = MEMORY[0x24261C66C](&unk_23C360E1C, &type metadata for WorkoutDetailLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D410);
  }
  return result;
}

unint64_t sub_23C34B844()
{
  unint64_t result;

  result = qword_256B5D418;
  if (!qword_256B5D418)
  {
    result = MEMORY[0x24261C66C](&unk_23C360D3C, &type metadata for WorkoutDetailLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D418);
  }
  return result;
}

unint64_t sub_23C34B88C()
{
  unint64_t result;

  result = qword_256B5D420;
  if (!qword_256B5D420)
  {
    result = MEMORY[0x24261C66C](&unk_23C360D64, &type metadata for WorkoutDetailLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D420);
  }
  return result;
}

unint64_t sub_23C34B8D4()
{
  unint64_t result;

  result = qword_256B5D428;
  if (!qword_256B5D428)
  {
    result = MEMORY[0x24261C66C](&unk_23C360CEC, &type metadata for WorkoutDetailLoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D428);
  }
  return result;
}

unint64_t sub_23C34B91C()
{
  unint64_t result;

  result = qword_256B5D430;
  if (!qword_256B5D430)
  {
    result = MEMORY[0x24261C66C](&unk_23C360D14, &type metadata for WorkoutDetailLoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D430);
  }
  return result;
}

unint64_t sub_23C34B964()
{
  unint64_t result;

  result = qword_256B5D438;
  if (!qword_256B5D438)
  {
    result = MEMORY[0x24261C66C](&unk_23C360C34, &type metadata for WorkoutDetailLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D438);
  }
  return result;
}

unint64_t sub_23C34B9AC()
{
  unint64_t result;

  result = qword_256B5D440;
  if (!qword_256B5D440)
  {
    result = MEMORY[0x24261C66C](&unk_23C360C5C, &type metadata for WorkoutDetailLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D440);
  }
  return result;
}

unint64_t sub_23C34B9F4()
{
  unint64_t result;

  result = qword_256B5D448;
  if (!qword_256B5D448)
  {
    result = MEMORY[0x24261C66C](&unk_23C360D8C, &type metadata for WorkoutDetailLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D448);
  }
  return result;
}

unint64_t sub_23C34BA3C()
{
  unint64_t result;

  result = qword_256B5D450;
  if (!qword_256B5D450)
  {
    result = MEMORY[0x24261C66C](&unk_23C360DB4, &type metadata for WorkoutDetailLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D450);
  }
  return result;
}

uint64_t sub_23C34BA80(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x4474756F6B726F77 && a2 == 0xED00006C69617465)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23C34EC64();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C34BB1C()
{
  return 0x4474756F6B726F77;
}

uint64_t sub_23C34BB44(char a1)
{
  return *(_QWORD *)&aIdle_17[8 * a1];
}

uint64_t sub_23C34BB64()
{
  char *v0;

  return sub_23C34BB44(*v0);
}

uint64_t sub_23C34BB6C()
{
  sub_23C34C9D0();
  return sub_23C34ECD0();
}

uint64_t sub_23C34BB94()
{
  sub_23C34C9D0();
  return sub_23C34ECDC();
}

uint64_t sub_23C34BBBC()
{
  sub_23C34CAE0();
  return sub_23C34ECD0();
}

uint64_t sub_23C34BBE4()
{
  sub_23C34CAE0();
  return sub_23C34ECDC();
}

uint64_t sub_23C34BC0C()
{
  sub_23C34CA58();
  return sub_23C34ECD0();
}

uint64_t sub_23C34BC34()
{
  sub_23C34CA58();
  return sub_23C34ECDC();
}

uint64_t sub_23C34BC5C()
{
  sub_23C34CA9C();
  return sub_23C34ECD0();
}

uint64_t sub_23C34BC84()
{
  sub_23C34CA9C();
  return sub_23C34ECDC();
}

uint64_t sub_23C34BCAC()
{
  sub_23C34CB24();
  return sub_23C34ECD0();
}

uint64_t sub_23C34BCD4()
{
  sub_23C34CB24();
  return sub_23C34ECDC();
}

void TrainerTipGalleryListLoadState.encode(to:)(_QWORD *a1)
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
  uint64_t State;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  _QWORD v17[16];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D460);
  v17[5] = *(_QWORD *)(v2 - 8);
  v17[6] = v2;
  MEMORY[0x24BDAC7A8](v2);
  v17[4] = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for TrainerTipGalleryList();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v17[3] = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D468);
  v17[11] = *(_QWORD *)(v7 - 8);
  v17[12] = v7;
  MEMORY[0x24BDAC7A8](v7);
  v17[10] = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D470);
  v17[8] = *(_QWORD *)(v9 - 8);
  v17[9] = v9;
  MEMORY[0x24BDAC7A8](v9);
  v17[7] = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D478);
  v17[1] = *(_QWORD *)(v11 - 8);
  v17[2] = v11;
  MEMORY[0x24BDAC7A8](v11);
  State = type metadata accessor for TrainerTipGalleryListLoadState();
  MEMORY[0x24BDAC7A8](State);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D480);
  v17[13] = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C34C9D0();
  sub_23C34ECC4();
  sub_23C34CA14(v17[15], (uint64_t)v14);
  v16 = (char *)sub_23C34BF48
      + 4 * byte_23C360FC0[(*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v14, 3, v4)];
  __asm { BR              X10 }
}

uint64_t sub_23C34BF48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(v3 - 184);
  sub_23C2851C0(v2, v4, (uint64_t (*)(_QWORD))type metadata accessor for TrainerTipGalleryList);
  *(_BYTE *)(v3 - 65) = 3;
  sub_23C34CA58();
  v5 = *(_QWORD *)(v3 - 176);
  sub_23C34EBD4();
  sub_23C34CB68(&qword_256B58520, (uint64_t)&protocol conformance descriptor for TrainerTipGalleryList);
  v6 = *(_QWORD *)(v3 - 160);
  sub_23C34EC40();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 168) + 8))(v5, v6);
  sub_23C283550(v4, (uint64_t (*)(_QWORD))type metadata accessor for TrainerTipGalleryList);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 104) + 8))(v1, v0);
}

uint64_t TrainerTipGalleryListLoadState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t State;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;

  v41 = a2;
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D4B0);
  v35 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v39 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D4B8);
  v33 = *(_QWORD *)(v4 - 8);
  v34 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v38 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D4C0);
  v31 = *(_QWORD *)(v6 - 8);
  v32 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v37 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D4C8);
  v29 = *(_QWORD *)(v8 - 8);
  v30 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v36 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D4D0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  State = type metadata accessor for TrainerTipGalleryListLoadState();
  MEMORY[0x24BDAC7A8](State);
  v16 = (char *)v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)v27 - v18;
  v20 = a1[3];
  v42 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_23C34C9D0();
  v21 = v43;
  sub_23C34ECB8();
  if (!v21)
  {
    v27[1] = v19;
    v28 = State;
    v27[0] = v16;
    v43 = v11;
    v22 = sub_23C34EBBC();
    if (*(_QWORD *)(v22 + 16) == 1)
      __asm { BR              X10 }
    v23 = sub_23C34EAC0();
    swift_allocError();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B576B0);
    *v25 = v28;
    sub_23C34EB44();
    sub_23C34EAB4();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x24BEE26D0], v23);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v13, v10);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
}

uint64_t sub_23C34C700@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TrainerTipGalleryListLoadState.init(from:)(a1, a2);
}

void sub_23C34C714(_QWORD *a1)
{
  TrainerTipGalleryListLoadState.encode(to:)(a1);
}

void _s20FitnessProductDetail30TrainerTipGalleryListLoadStateO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t State;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;

  v4 = type metadata accessor for TrainerTipGalleryList();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  State = type metadata accessor for TrainerTipGalleryListLoadState();
  MEMORY[0x24BDAC7A8](State);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D5B8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t)&v9[*(int *)(v10 + 48)];
  sub_23C34CA14(a1, (uint64_t)v9);
  sub_23C34CA14(a2, v11);
  v12 = (char *)sub_23C34C840
      + 4 * byte_23C360FC8[(*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v9, 3, v4)];
  __asm { BR              X10 }
}

uint64_t sub_23C34C840()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;

  sub_23C34CA14(v0, v3);
  if (v4(v5, 3, v1))
  {
    sub_23C283550(v3, (uint64_t (*)(_QWORD))type metadata accessor for TrainerTipGalleryList);
    sub_23C34D754(v0);
    return 0;
  }
  sub_23C2851C0(v5, v2, (uint64_t (*)(_QWORD))type metadata accessor for TrainerTipGalleryList);
  if ((sub_23C34DA04() & 1) == 0
    || (sub_23C28599C(*(_QWORD *)(v3 + *(int *)(v1 + 20)), *(_QWORD *)(v2 + *(int *)(v1 + 20))) & 1) == 0)
  {
    sub_23C283550(v2, (uint64_t (*)(_QWORD))type metadata accessor for TrainerTipGalleryList);
    sub_23C283550(v3, (uint64_t (*)(_QWORD))type metadata accessor for TrainerTipGalleryList);
    sub_23C283550(v0, (uint64_t (*)(_QWORD))type metadata accessor for TrainerTipGalleryListLoadState);
    return 0;
  }
  sub_23C283550(v2, (uint64_t (*)(_QWORD))type metadata accessor for TrainerTipGalleryList);
  sub_23C283550(v3, (uint64_t (*)(_QWORD))type metadata accessor for TrainerTipGalleryList);
  sub_23C283550(v0, (uint64_t (*)(_QWORD))type metadata accessor for TrainerTipGalleryListLoadState);
  return 1;
}

uint64_t type metadata accessor for TrainerTipGalleryListLoadState()
{
  uint64_t result;

  result = qword_256B5D548;
  if (!qword_256B5D548)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23C34C9D0()
{
  unint64_t result;

  result = qword_256B5D488;
  if (!qword_256B5D488)
  {
    result = MEMORY[0x24261C66C](&unk_23C3614A4, &type metadata for TrainerTipGalleryListLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D488);
  }
  return result;
}

uint64_t sub_23C34CA14(uint64_t a1, uint64_t a2)
{
  uint64_t State;

  State = type metadata accessor for TrainerTipGalleryListLoadState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(State - 8) + 16))(a2, a1, State);
  return a2;
}

unint64_t sub_23C34CA58()
{
  unint64_t result;

  result = qword_256B5D490;
  if (!qword_256B5D490)
  {
    result = MEMORY[0x24261C66C](&unk_23C361454, &type metadata for TrainerTipGalleryListLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D490);
  }
  return result;
}

unint64_t sub_23C34CA9C()
{
  unint64_t result;

  result = qword_256B5D498;
  if (!qword_256B5D498)
  {
    result = MEMORY[0x24261C66C](&unk_23C361404, &type metadata for TrainerTipGalleryListLoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D498);
  }
  return result;
}

unint64_t sub_23C34CAE0()
{
  unint64_t result;

  result = qword_256B5D4A0;
  if (!qword_256B5D4A0)
  {
    result = MEMORY[0x24261C66C](&unk_23C3613B4, &type metadata for TrainerTipGalleryListLoadState.FailedToLoadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D4A0);
  }
  return result;
}

unint64_t sub_23C34CB24()
{
  unint64_t result;

  result = qword_256B5D4A8;
  if (!qword_256B5D4A8)
  {
    result = MEMORY[0x24261C66C](&unk_23C361364, &type metadata for TrainerTipGalleryListLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D4A8);
  }
  return result;
}

uint64_t sub_23C34CB68(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for TrainerTipGalleryList();
    result = MEMORY[0x24261C66C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for TrainerTipGalleryListLoadState(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t *, _QWORD, uint64_t, uint64_t);

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
    v7 = type metadata accessor for TrainerTipGalleryList();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 3, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v10 = sub_23C34DA1C();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
      *(uint64_t *)((char *)a1 + *(int *)(v7 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v7 + 20));
      v11 = *(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56);
      swift_bridgeObjectRetain();
      v11(a1, 0, 3, v7);
    }
  }
  return a1;
}

uint64_t destroy for TrainerTipGalleryListLoadState(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = type metadata accessor for TrainerTipGalleryList();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 3, v2);
  if (!(_DWORD)result)
  {
    v4 = sub_23C34DA1C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

char *initializeWithCopy for TrainerTipGalleryListLoadState(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, _QWORD, uint64_t, uint64_t);

  v6 = type metadata accessor for TrainerTipGalleryList();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = sub_23C34DA1C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    *(_QWORD *)&a1[*(int *)(v6 + 20)] = *(_QWORD *)&a2[*(int *)(v6 + 20)];
    v9 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56);
    swift_bridgeObjectRetain();
    v9(a1, 0, 3, v6);
  }
  return a1;
}

char *assignWithCopy for TrainerTipGalleryListLoadState(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  void (*v12)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v14;

  v6 = type metadata accessor for TrainerTipGalleryList();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 3, v6);
  v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      v14 = sub_23C34DA1C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(a1, a2, v14);
      *(_QWORD *)&a1[*(int *)(v6 + 20)] = *(_QWORD *)&a2[*(int *)(v6 + 20)];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_23C283550((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for TrainerTipGalleryList);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = sub_23C34DA1C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
  *(_QWORD *)&a1[*(int *)(v6 + 20)] = *(_QWORD *)&a2[*(int *)(v6 + 20)];
  v12 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56);
  swift_bridgeObjectRetain();
  v12(a1, 0, 3, v6);
  return a1;
}

char *initializeWithTake for TrainerTipGalleryListLoadState(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = type metadata accessor for TrainerTipGalleryList();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = sub_23C34DA1C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    *(_QWORD *)&a1[*(int *)(v6 + 20)] = *(_QWORD *)&a2[*(int *)(v6 + 20)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

char *assignWithTake for TrainerTipGalleryListLoadState(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v13;

  v6 = type metadata accessor for TrainerTipGalleryList();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 3, v6);
  v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      v13 = sub_23C34DA1C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(a1, a2, v13);
      *(_QWORD *)&a1[*(int *)(v6 + 20)] = *(_QWORD *)&a2[*(int *)(v6 + 20)];
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_23C283550((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for TrainerTipGalleryList);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = sub_23C34DA1C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
  *(_QWORD *)&a1[*(int *)(v6 + 20)] = *(_QWORD *)&a2[*(int *)(v6 + 20)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrainerTipGalleryListLoadState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C34D0E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = type metadata accessor for TrainerTipGalleryList();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 4)
    return v5 - 3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TrainerTipGalleryListLoadState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C34D13C(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 3);
  else
    v5 = 0;
  v6 = type metadata accessor for TrainerTipGalleryList();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_23C34D190(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TrainerTipGalleryList();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 3, v2);
}

uint64_t sub_23C34D1C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TrainerTipGalleryList();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 3, v4);
}

uint64_t sub_23C34D208()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for TrainerTipGalleryList();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TrainerTipGalleryListLoadState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C34D2A8 + 4 * byte_23C360FD1[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C34D2DC + 4 * byte_23C360FCC[v4]))();
}

uint64_t sub_23C34D2DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C34D2E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C34D2ECLL);
  return result;
}

uint64_t sub_23C34D2F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C34D300);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C34D304(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C34D30C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipGalleryListLoadState.CodingKeys()
{
  return &type metadata for TrainerTipGalleryListLoadState.CodingKeys;
}

ValueMetadata *type metadata accessor for TrainerTipGalleryListLoadState.IdleCodingKeys()
{
  return &type metadata for TrainerTipGalleryListLoadState.IdleCodingKeys;
}

ValueMetadata *type metadata accessor for TrainerTipGalleryListLoadState.FailedToLoadCodingKeys()
{
  return &type metadata for TrainerTipGalleryListLoadState.FailedToLoadCodingKeys;
}

ValueMetadata *type metadata accessor for TrainerTipGalleryListLoadState.FetchingCodingKeys()
{
  return &type metadata for TrainerTipGalleryListLoadState.FetchingCodingKeys;
}

uint64_t storeEnumTagSinglePayload for TrainerTipGalleryListLoadState.FetchedCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C34D398 + 4 * byte_23C360FD6[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C34D3B8 + 4 * byte_23C360FDB[v4]))();
}

_BYTE *sub_23C34D398(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C34D3B8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C34D3C0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C34D3C8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C34D3D0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C34D3D8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipGalleryListLoadState.FetchedCodingKeys()
{
  return &type metadata for TrainerTipGalleryListLoadState.FetchedCodingKeys;
}

unint64_t sub_23C34D3F8()
{
  unint64_t result;

  result = qword_256B5D558;
  if (!qword_256B5D558)
  {
    result = MEMORY[0x24261C66C](&unk_23C361194, &type metadata for TrainerTipGalleryListLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D558);
  }
  return result;
}

unint64_t sub_23C34D440()
{
  unint64_t result;

  result = qword_256B5D560;
  if (!qword_256B5D560)
  {
    result = MEMORY[0x24261C66C](&unk_23C36133C, &type metadata for TrainerTipGalleryListLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D560);
  }
  return result;
}

unint64_t sub_23C34D488()
{
  unint64_t result;

  result = qword_256B5D568;
  if (!qword_256B5D568)
  {
    result = MEMORY[0x24261C66C](&unk_23C36125C, &type metadata for TrainerTipGalleryListLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D568);
  }
  return result;
}

unint64_t sub_23C34D4D0()
{
  unint64_t result;

  result = qword_256B5D570;
  if (!qword_256B5D570)
  {
    result = MEMORY[0x24261C66C](&unk_23C361284, &type metadata for TrainerTipGalleryListLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D570);
  }
  return result;
}

unint64_t sub_23C34D518()
{
  unint64_t result;

  result = qword_256B5D578;
  if (!qword_256B5D578)
  {
    result = MEMORY[0x24261C66C](&unk_23C36120C, &type metadata for TrainerTipGalleryListLoadState.FailedToLoadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D578);
  }
  return result;
}

unint64_t sub_23C34D560()
{
  unint64_t result;

  result = qword_256B5D580;
  if (!qword_256B5D580)
  {
    result = MEMORY[0x24261C66C](&unk_23C361234, &type metadata for TrainerTipGalleryListLoadState.FailedToLoadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D580);
  }
  return result;
}

unint64_t sub_23C34D5A8()
{
  unint64_t result;

  result = qword_256B5D588;
  if (!qword_256B5D588)
  {
    result = MEMORY[0x24261C66C](&unk_23C3611BC, &type metadata for TrainerTipGalleryListLoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D588);
  }
  return result;
}

unint64_t sub_23C34D5F0()
{
  unint64_t result;

  result = qword_256B5D590;
  if (!qword_256B5D590)
  {
    result = MEMORY[0x24261C66C](&unk_23C3611E4, &type metadata for TrainerTipGalleryListLoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D590);
  }
  return result;
}

unint64_t sub_23C34D638()
{
  unint64_t result;

  result = qword_256B5D598;
  if (!qword_256B5D598)
  {
    result = MEMORY[0x24261C66C](&unk_23C361104, &type metadata for TrainerTipGalleryListLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D598);
  }
  return result;
}

unint64_t sub_23C34D680()
{
  unint64_t result;

  result = qword_256B5D5A0;
  if (!qword_256B5D5A0)
  {
    result = MEMORY[0x24261C66C](&unk_23C36112C, &type metadata for TrainerTipGalleryListLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D5A0);
  }
  return result;
}

unint64_t sub_23C34D6C8()
{
  unint64_t result;

  result = qword_256B5D5A8;
  if (!qword_256B5D5A8)
  {
    result = MEMORY[0x24261C66C](&unk_23C3612AC, &type metadata for TrainerTipGalleryListLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D5A8);
  }
  return result;
}

unint64_t sub_23C34D710()
{
  unint64_t result;

  result = qword_256B5D5B0;
  if (!qword_256B5D5B0)
  {
    result = MEMORY[0x24261C66C](&unk_23C3612D4, &type metadata for TrainerTipGalleryListLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B5D5B0);
  }
  return result;
}

uint64_t sub_23C34D754(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B5D5B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C34D794()
{
  return MEMORY[0x24BDCBC18]();
}

uint64_t sub_23C34D7A0()
{
  return MEMORY[0x24BDCBC20]();
}

uint64_t sub_23C34D7AC()
{
  return MEMORY[0x24BDEAD30]();
}

uint64_t sub_23C34D7B8()
{
  return MEMORY[0x24BDEAD60]();
}

uint64_t sub_23C34D7C4()
{
  return MEMORY[0x24BDCC268]();
}

uint64_t sub_23C34D7D0()
{
  return MEMORY[0x24BDCC290]();
}

uint64_t sub_23C34D7DC()
{
  return MEMORY[0x24BDCC2D8]();
}

uint64_t sub_23C34D7E8()
{
  return MEMORY[0x24BDCC2F8]();
}

uint64_t sub_23C34D7F4()
{
  return MEMORY[0x24BDCC320]();
}

uint64_t sub_23C34D800()
{
  return MEMORY[0x24BDCC3F8]();
}

uint64_t sub_23C34D80C()
{
  return MEMORY[0x24BDCC470]();
}

uint64_t sub_23C34D818()
{
  return MEMORY[0x24BDCC478]();
}

uint64_t sub_23C34D824()
{
  return MEMORY[0x24BDCC480]();
}

uint64_t sub_23C34D830()
{
  return MEMORY[0x24BDCC498]();
}

uint64_t sub_23C34D83C()
{
  return MEMORY[0x24BDCC4A8]();
}

uint64_t sub_23C34D848()
{
  return MEMORY[0x24BDCC4E0]();
}

uint64_t sub_23C34D854()
{
  return MEMORY[0x24BDCC4F0]();
}

uint64_t sub_23C34D860()
{
  return MEMORY[0x24BDCC550]();
}

uint64_t sub_23C34D86C()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_23C34D878()
{
  return MEMORY[0x24BDCC5D8]();
}

uint64_t sub_23C34D884()
{
  return MEMORY[0x24BDCC610]();
}

uint64_t sub_23C34D890()
{
  return MEMORY[0x24BDCC620]();
}

uint64_t sub_23C34D89C()
{
  return MEMORY[0x24BDCC848]();
}

uint64_t sub_23C34D8A8()
{
  return MEMORY[0x24BDCC890]();
}

uint64_t sub_23C34D8B4()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_23C34D8C0()
{
  return MEMORY[0x24BDCC948]();
}

uint64_t sub_23C34D8CC()
{
  return MEMORY[0x24BDCC950]();
}

uint64_t sub_23C34D8D8()
{
  return MEMORY[0x24BDCC958]();
}

uint64_t sub_23C34D8E4()
{
  return MEMORY[0x24BDCC9A8]();
}

uint64_t sub_23C34D8F0()
{
  return MEMORY[0x24BDCCB18]();
}

uint64_t sub_23C34D8FC()
{
  return MEMORY[0x24BDEAD90]();
}

uint64_t sub_23C34D908()
{
  return MEMORY[0x24BDCD4E8]();
}

uint64_t sub_23C34D914()
{
  return MEMORY[0x24BDCD5B0]();
}

uint64_t sub_23C34D920()
{
  return MEMORY[0x24BDCD5B8]();
}

uint64_t sub_23C34D92C()
{
  return MEMORY[0x24BDCD710]();
}

uint64_t sub_23C34D938()
{
  return MEMORY[0x24BDCD718]();
}

uint64_t sub_23C34D944()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_23C34D950()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23C34D95C()
{
  return MEMORY[0x24BDCE010]();
}

uint64_t sub_23C34D968()
{
  return MEMORY[0x24BDCE040]();
}

uint64_t sub_23C34D974()
{
  return MEMORY[0x24BDCE060]();
}

uint64_t sub_23C34D980()
{
  return MEMORY[0x24BDCE078]();
}

uint64_t sub_23C34D98C()
{
  return MEMORY[0x24BDCE140]();
}

uint64_t sub_23C34D998()
{
  return MEMORY[0x24BDCE160]();
}

uint64_t sub_23C34D9A4()
{
  return MEMORY[0x24BDCE1B8]();
}

uint64_t sub_23C34D9B0()
{
  return MEMORY[0x24BDCE1E0]();
}

uint64_t sub_23C34D9BC()
{
  return MEMORY[0x24BDCE250]();
}

uint64_t sub_23C34D9C8()
{
  return MEMORY[0x24BDCE2A0]();
}

uint64_t sub_23C34D9D4()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_23C34D9E0()
{
  return MEMORY[0x24BDCE8D8]();
}

uint64_t sub_23C34D9EC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23C34D9F8()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23C34DA04()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23C34DA10()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23C34DA1C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23C34DA28()
{
  return MEMORY[0x24BDCECD8]();
}

uint64_t sub_23C34DA34()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23C34DA40()
{
  return MEMORY[0x24BDCF008]();
}

uint64_t sub_23C34DA4C()
{
  return MEMORY[0x24BDCF098]();
}

uint64_t sub_23C34DA58()
{
  return MEMORY[0x24BDCF0A0]();
}

uint64_t sub_23C34DA64()
{
  return MEMORY[0x24BDCF118]();
}

uint64_t sub_23C34DA70()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_23C34DA7C()
{
  return MEMORY[0x24BEBBE78]();
}

uint64_t sub_23C34DA88()
{
  return MEMORY[0x24BDCF678]();
}

uint64_t sub_23C34DA94()
{
  return MEMORY[0x24BE34FA0]();
}

uint64_t sub_23C34DAA0()
{
  return MEMORY[0x24BE35038]();
}

uint64_t sub_23C34DAAC()
{
  return MEMORY[0x24BE35040]();
}

uint64_t sub_23C34DAB8()
{
  return MEMORY[0x24BE35048]();
}

uint64_t sub_23C34DAC4()
{
  return MEMORY[0x24BE35120]();
}

uint64_t sub_23C34DAD0()
{
  return MEMORY[0x24BE346D8]();
}

uint64_t sub_23C34DADC()
{
  return MEMORY[0x24BE346E8]();
}

uint64_t sub_23C34DAE8()
{
  return MEMORY[0x24BE34748]();
}

uint64_t sub_23C34DAF4()
{
  return MEMORY[0x24BE34750]();
}

uint64_t sub_23C34DB00()
{
  return MEMORY[0x24BE34758]();
}

uint64_t sub_23C34DB0C()
{
  return MEMORY[0x24BE34790]();
}

uint64_t sub_23C34DB18()
{
  return MEMORY[0x24BE34798]();
}

uint64_t sub_23C34DB24()
{
  return MEMORY[0x24BE347A8]();
}

uint64_t sub_23C34DB30()
{
  return MEMORY[0x24BE34800]();
}

uint64_t sub_23C34DB3C()
{
  return MEMORY[0x24BE34810]();
}

uint64_t sub_23C34DB48()
{
  return MEMORY[0x24BE34818]();
}

uint64_t sub_23C34DB54()
{
  return MEMORY[0x24BE34858]();
}

uint64_t sub_23C34DB60()
{
  return MEMORY[0x24BE34880]();
}

uint64_t sub_23C34DB6C()
{
  return MEMORY[0x24BE348A8]();
}

uint64_t sub_23C34DB78()
{
  return MEMORY[0x24BE348B0]();
}

uint64_t sub_23C34DB84()
{
  return MEMORY[0x24BE34970]();
}

uint64_t sub_23C34DB90()
{
  return MEMORY[0x24BE349A8]();
}

uint64_t sub_23C34DB9C()
{
  return MEMORY[0x24BE349B8]();
}

uint64_t sub_23C34DBA8()
{
  return MEMORY[0x24BE349D8]();
}

uint64_t sub_23C34DBB4()
{
  return MEMORY[0x24BE349F8]();
}

uint64_t sub_23C34DBC0()
{
  return MEMORY[0x24BE34A00]();
}

uint64_t sub_23C34DBCC()
{
  return MEMORY[0x24BE34A08]();
}

uint64_t sub_23C34DBD8()
{
  return MEMORY[0x24BE34A10]();
}

uint64_t sub_23C34DBE4()
{
  return MEMORY[0x24BE34A18]();
}

uint64_t sub_23C34DBF0()
{
  return MEMORY[0x24BE34A20]();
}

uint64_t sub_23C34DBFC()
{
  return MEMORY[0x24BE34A88]();
}

uint64_t sub_23C34DC08()
{
  return MEMORY[0x24BE34A98]();
}

uint64_t sub_23C34DC14()
{
  return MEMORY[0x24BE34B60]();
}

uint64_t sub_23C34DC20()
{
  return MEMORY[0x24BE34B88]();
}

uint64_t sub_23C34DC2C()
{
  return MEMORY[0x24BE34B90]();
}

uint64_t sub_23C34DC38()
{
  return MEMORY[0x24BE34B98]();
}

uint64_t sub_23C34DC44()
{
  return MEMORY[0x24BE34BC0]();
}

uint64_t sub_23C34DC50()
{
  return MEMORY[0x24BE34BC8]();
}

uint64_t sub_23C34DC5C()
{
  return MEMORY[0x24BE34BE0]();
}

uint64_t sub_23C34DC68()
{
  return MEMORY[0x24BE34C00]();
}

uint64_t sub_23C34DC74()
{
  return MEMORY[0x24BE34CA0]();
}

uint64_t sub_23C34DC80()
{
  return MEMORY[0x24BE34E18]();
}

uint64_t sub_23C34DC8C()
{
  return MEMORY[0x24BE34E28]();
}

uint64_t sub_23C34DC98()
{
  return MEMORY[0x24BE379D0]();
}

uint64_t sub_23C34DCA4()
{
  return MEMORY[0x24BE379D8]();
}

uint64_t sub_23C34DCB0()
{
  return MEMORY[0x24BE379E0]();
}

uint64_t sub_23C34DCBC()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_23C34DCC8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23C34DCD4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23C34DCE0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23C34DCEC()
{
  return MEMORY[0x24BDEAE98]();
}

uint64_t sub_23C34DCF8()
{
  return MEMORY[0x24BDEAEB0]();
}

uint64_t sub_23C34DD04()
{
  return MEMORY[0x24BDEAF80]();
}

uint64_t sub_23C34DD10()
{
  return MEMORY[0x24BDEAF98]();
}

uint64_t sub_23C34DD1C()
{
  return MEMORY[0x24BDEAFA8]();
}

uint64_t sub_23C34DD28()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_23C34DD34()
{
  return MEMORY[0x24BDEB210]();
}

uint64_t sub_23C34DD40()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t sub_23C34DD4C()
{
  return MEMORY[0x24BDEB780]();
}

uint64_t sub_23C34DD58()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_23C34DD64()
{
  return MEMORY[0x24BDEB978]();
}

uint64_t sub_23C34DD70()
{
  return MEMORY[0x24BDEB990]();
}

uint64_t sub_23C34DD7C()
{
  return MEMORY[0x24BDEBBC8]();
}

uint64_t sub_23C34DD88()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_23C34DD94()
{
  return MEMORY[0x24BDEBF88]();
}

uint64_t sub_23C34DDA0()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_23C34DDAC()
{
  return MEMORY[0x24BDEC260]();
}

uint64_t sub_23C34DDB8()
{
  return MEMORY[0x24BDEC268]();
}

uint64_t sub_23C34DDC4()
{
  return MEMORY[0x24BDEC280]();
}

uint64_t sub_23C34DDD0()
{
  return MEMORY[0x24BDEC530]();
}

uint64_t sub_23C34DDDC()
{
  return MEMORY[0x24BDEC548]();
}

uint64_t sub_23C34DDE8()
{
  return MEMORY[0x24BDEC6D8]();
}

uint64_t sub_23C34DDF4()
{
  return MEMORY[0x24BDEC6E0]();
}

uint64_t sub_23C34DE00()
{
  return MEMORY[0x24BDEC778]();
}

uint64_t sub_23C34DE0C()
{
  return MEMORY[0x24BDEC7A8]();
}

uint64_t sub_23C34DE18()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_23C34DE24()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_23C34DE30()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_23C34DE3C()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_23C34DE48()
{
  return MEMORY[0x24BDED8E0]();
}

uint64_t sub_23C34DE54()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_23C34DE60()
{
  return MEMORY[0x24BDEDAE0]();
}

uint64_t sub_23C34DE6C()
{
  return MEMORY[0x24BDEDB08]();
}

uint64_t sub_23C34DE78()
{
  return MEMORY[0x24BDEDB18]();
}

uint64_t sub_23C34DE84()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_23C34DE90()
{
  return MEMORY[0x24BDEDBF0]();
}

uint64_t sub_23C34DE9C()
{
  return MEMORY[0x24BDEDC80]();
}

uint64_t sub_23C34DEA8()
{
  return MEMORY[0x24BDEDCA8]();
}

uint64_t sub_23C34DEB4()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_23C34DEC0()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_23C34DECC()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_23C34DED8()
{
  return MEMORY[0x24BDEE0A0]();
}

uint64_t sub_23C34DEE4()
{
  return MEMORY[0x24BDEE0A8]();
}

uint64_t sub_23C34DEF0()
{
  return MEMORY[0x24BDEE138]();
}

uint64_t sub_23C34DEFC()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_23C34DF08()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_23C34DF14()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_23C34DF20()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_23C34DF2C()
{
  return MEMORY[0x24BDEE3B0]();
}

uint64_t sub_23C34DF38()
{
  return MEMORY[0x24BDEE3B8]();
}

uint64_t sub_23C34DF44()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_23C34DF50()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_23C34DF5C()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_23C34DF68()
{
  return MEMORY[0x24BDEEA08]();
}

uint64_t sub_23C34DF74()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_23C34DF80()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_23C34DF8C()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_23C34DF98()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_23C34DFA4()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_23C34DFB0()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_23C34DFBC()
{
  return MEMORY[0x24BDEED70]();
}

uint64_t sub_23C34DFC8()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_23C34DFD4()
{
  return MEMORY[0x24BDEEF48]();
}

uint64_t sub_23C34DFE0()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_23C34DFEC()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_23C34DFF8()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_23C34E004()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_23C34E010()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_23C34E01C()
{
  return MEMORY[0x24BDEF5C8]();
}

uint64_t sub_23C34E028()
{
  return MEMORY[0x24BDEF5D8]();
}

uint64_t sub_23C34E034()
{
  return MEMORY[0x24BDEF6E0]();
}

uint64_t sub_23C34E040()
{
  return MEMORY[0x24BDEF740]();
}

uint64_t sub_23C34E04C()
{
  return MEMORY[0x24BDEFA78]();
}

uint64_t sub_23C34E058()
{
  return MEMORY[0x24BDEFBF0]();
}

uint64_t sub_23C34E064()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_23C34E070()
{
  return MEMORY[0x24BDEFD30]();
}

uint64_t sub_23C34E07C()
{
  return MEMORY[0x24BDEFD40]();
}

uint64_t sub_23C34E088()
{
  return MEMORY[0x24BDEFD50]();
}

uint64_t sub_23C34E094()
{
  return MEMORY[0x24BDEFD60]();
}

uint64_t sub_23C34E0A0()
{
  return MEMORY[0x24BDF0200]();
}

uint64_t sub_23C34E0AC()
{
  return MEMORY[0x24BDF0210]();
}

uint64_t sub_23C34E0B8()
{
  return MEMORY[0x24BDF0220]();
}

uint64_t sub_23C34E0C4()
{
  return MEMORY[0x24BDF0230]();
}

uint64_t sub_23C34E0D0()
{
  return MEMORY[0x24BDF02E8]();
}

uint64_t sub_23C34E0DC()
{
  return MEMORY[0x24BDF02F8]();
}

uint64_t sub_23C34E0E8()
{
  return MEMORY[0x24BDF0440]();
}

uint64_t sub_23C34E0F4()
{
  return MEMORY[0x24BDF0468]();
}

uint64_t sub_23C34E100()
{
  return MEMORY[0x24BDF0A10]();
}

uint64_t sub_23C34E10C()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_23C34E118()
{
  return MEMORY[0x24BDF0D98]();
}

uint64_t sub_23C34E124()
{
  return MEMORY[0x24BDF0DA8]();
}

uint64_t sub_23C34E130()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_23C34E13C()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_23C34E148()
{
  return MEMORY[0x24BDF1450]();
}

uint64_t sub_23C34E154()
{
  return MEMORY[0x24BDF1458]();
}

uint64_t sub_23C34E160()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_23C34E16C()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_23C34E178()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_23C34E184()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_23C34E190()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_23C34E19C()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_23C34E1A8()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_23C34E1B4()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_23C34E1C0()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_23C34E1CC()
{
  return MEMORY[0x24BDF1560]();
}

uint64_t sub_23C34E1D8()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_23C34E1E4()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_23C34E1F0()
{
  return MEMORY[0x24BDF1600]();
}

uint64_t sub_23C34E1FC()
{
  return MEMORY[0x24BDF1640]();
}

uint64_t sub_23C34E208()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_23C34E214()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_23C34E220()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_23C34E22C()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_23C34E238()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_23C34E244()
{
  return MEMORY[0x24BDF1790]();
}

uint64_t sub_23C34E250()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_23C34E25C()
{
  return MEMORY[0x24BDF17D8]();
}

uint64_t sub_23C34E268()
{
  return MEMORY[0x24BDF17E8]();
}

uint64_t sub_23C34E274()
{
  return MEMORY[0x24BDF17F8]();
}

uint64_t sub_23C34E280()
{
  return MEMORY[0x24BDF1800]();
}

uint64_t sub_23C34E28C()
{
  return MEMORY[0x24BDF1818]();
}

uint64_t sub_23C34E298()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_23C34E2A4()
{
  return MEMORY[0x24BDF1A48]();
}

uint64_t sub_23C34E2B0()
{
  return MEMORY[0x24BDF1C40]();
}

uint64_t sub_23C34E2BC()
{
  return MEMORY[0x24BDF1C58]();
}

uint64_t sub_23C34E2C8()
{
  return MEMORY[0x24BDF1C70]();
}

uint64_t sub_23C34E2D4()
{
  return MEMORY[0x24BDF1C80]();
}

uint64_t sub_23C34E2E0()
{
  return MEMORY[0x24BDF1C90]();
}

uint64_t sub_23C34E2EC()
{
  return MEMORY[0x24BDF1CA0]();
}

uint64_t sub_23C34E2F8()
{
  return MEMORY[0x24BDF1CA8]();
}

uint64_t sub_23C34E304()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_23C34E310()
{
  return MEMORY[0x24BE37BF0]();
}

uint64_t sub_23C34E31C()
{
  return MEMORY[0x24BDF1D68]();
}

uint64_t sub_23C34E328()
{
  return MEMORY[0x24BDF1DB8]();
}

uint64_t sub_23C34E334()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_23C34E340()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_23C34E34C()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_23C34E358()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_23C34E364()
{
  return MEMORY[0x24BEC6708]();
}

uint64_t sub_23C34E370()
{
  return MEMORY[0x24BE37BF8]();
}

uint64_t sub_23C34E37C()
{
  return MEMORY[0x24BE37C18]();
}

uint64_t sub_23C34E388()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23C34E394()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23C34E3A0()
{
  return MEMORY[0x24BDF20E8]();
}

uint64_t sub_23C34E3AC()
{
  return MEMORY[0x24BDF2170]();
}

uint64_t sub_23C34E3B8()
{
  return MEMORY[0x24BDF2298]();
}

uint64_t sub_23C34E3C4()
{
  return MEMORY[0x24BDF22A0]();
}

uint64_t sub_23C34E3D0()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_23C34E3DC()
{
  return MEMORY[0x24BDF22C8]();
}

uint64_t sub_23C34E3E8()
{
  return MEMORY[0x24BDF24B8]();
}

uint64_t sub_23C34E3F4()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_23C34E400()
{
  return MEMORY[0x24BDF2668]();
}

uint64_t sub_23C34E40C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23C34E418()
{
  return MEMORY[0x24BDF27F0]();
}

uint64_t sub_23C34E424()
{
  return MEMORY[0x24BDF2858]();
}

uint64_t sub_23C34E430()
{
  return MEMORY[0x24BDF2BE0]();
}

uint64_t sub_23C34E43C()
{
  return MEMORY[0x24BDF2DB8]();
}

uint64_t sub_23C34E448()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_23C34E454()
{
  return MEMORY[0x24BDF2FD8]();
}

uint64_t sub_23C34E460()
{
  return MEMORY[0x24BDF30D8]();
}

uint64_t sub_23C34E46C()
{
  return MEMORY[0x24BDF30E8]();
}

uint64_t sub_23C34E478()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_23C34E484()
{
  return MEMORY[0x24BDF3628]();
}

uint64_t sub_23C34E490()
{
  return MEMORY[0x24BDF3630]();
}

uint64_t sub_23C34E49C()
{
  return MEMORY[0x24BDF3690]();
}

uint64_t sub_23C34E4A8()
{
  return MEMORY[0x24BDF37B0]();
}

uint64_t sub_23C34E4B4()
{
  return MEMORY[0x24BDF37E0]();
}

uint64_t sub_23C34E4C0()
{
  return MEMORY[0x24BDF3840]();
}

uint64_t sub_23C34E4CC()
{
  return MEMORY[0x24BDF3880]();
}

uint64_t sub_23C34E4D8()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_23C34E4E4()
{
  return MEMORY[0x24BDF38C8]();
}

uint64_t sub_23C34E4F0()
{
  return MEMORY[0x24BDF3980]();
}

uint64_t sub_23C34E4FC()
{
  return MEMORY[0x24BDF39B0]();
}

uint64_t sub_23C34E508()
{
  return MEMORY[0x24BDF3A98]();
}

uint64_t sub_23C34E514()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_23C34E520()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_23C34E52C()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_23C34E538()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_23C34E544()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_23C34E550()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_23C34E55C()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_23C34E568()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_23C34E574()
{
  return MEMORY[0x24BDF3E78]();
}

uint64_t sub_23C34E580()
{
  return MEMORY[0x24BDF3F18]();
}

uint64_t sub_23C34E58C()
{
  return MEMORY[0x24BDF3F28]();
}

uint64_t sub_23C34E598()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_23C34E5A4()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_23C34E5B0()
{
  return MEMORY[0x24BDF4150]();
}

uint64_t sub_23C34E5BC()
{
  return MEMORY[0x24BDF4160]();
}

uint64_t sub_23C34E5C8()
{
  return MEMORY[0x24BDF4170]();
}

uint64_t sub_23C34E5D4()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_23C34E5E0()
{
  return MEMORY[0x24BDF4368]();
}

uint64_t sub_23C34E5EC()
{
  return MEMORY[0x24BDF4380]();
}

uint64_t sub_23C34E5F8()
{
  return MEMORY[0x24BDF4470]();
}

uint64_t sub_23C34E604()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t sub_23C34E610()
{
  return MEMORY[0x24BDF44E0]();
}

uint64_t sub_23C34E61C()
{
  return MEMORY[0x24BDF44E8]();
}

uint64_t sub_23C34E628()
{
  return MEMORY[0x24BDF44F0]();
}

uint64_t sub_23C34E634()
{
  return MEMORY[0x24BDF4508]();
}

uint64_t sub_23C34E640()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_23C34E64C()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_23C34E658()
{
  return MEMORY[0x24BDF4728]();
}

uint64_t sub_23C34E664()
{
  return MEMORY[0x24BDF4730]();
}

uint64_t sub_23C34E670()
{
  return MEMORY[0x24BDF4908]();
}

uint64_t sub_23C34E67C()
{
  return MEMORY[0x24BDF4918]();
}

uint64_t sub_23C34E688()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_23C34E694()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_23C34E6A0()
{
  return MEMORY[0x24BDF49C8]();
}

uint64_t sub_23C34E6AC()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_23C34E6B8()
{
  return MEMORY[0x24BDF4E10]();
}

uint64_t sub_23C34E6C4()
{
  return MEMORY[0x24BDF4E30]();
}

uint64_t sub_23C34E6D0()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_23C34E6DC()
{
  return MEMORY[0x24BDF4ED0]();
}

uint64_t sub_23C34E6E8()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_23C34E6F4()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_23C34E700()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_23C34E70C()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_23C34E718()
{
  return MEMORY[0x24BDF5448]();
}

uint64_t sub_23C34E724()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_23C34E730()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_23C34E73C()
{
  return MEMORY[0x24BE2B3C0]();
}

uint64_t sub_23C34E748()
{
  return MEMORY[0x24BE2B3D8]();
}

uint64_t sub_23C34E754()
{
  return MEMORY[0x24BE2B3E8]();
}

uint64_t sub_23C34E760()
{
  return MEMORY[0x24BE2B450]();
}

uint64_t sub_23C34E76C()
{
  return MEMORY[0x24BE2B460]();
}

uint64_t sub_23C34E778()
{
  return MEMORY[0x24BE2B470]();
}

uint64_t sub_23C34E784()
{
  return MEMORY[0x24BE2B560]();
}

uint64_t sub_23C34E790()
{
  return MEMORY[0x24BE2B588]();
}

uint64_t sub_23C34E79C()
{
  return MEMORY[0x24BE2B598]();
}

uint64_t sub_23C34E7A8()
{
  return MEMORY[0x24BE2B5A8]();
}

uint64_t sub_23C34E7B4()
{
  return MEMORY[0x24BE2B5B8]();
}

uint64_t sub_23C34E7C0()
{
  return MEMORY[0x24BE2B5D0]();
}

uint64_t sub_23C34E7CC()
{
  return MEMORY[0x24BE5D228]();
}

uint64_t sub_23C34E7D8()
{
  return MEMORY[0x24BE5D230]();
}

uint64_t sub_23C34E7E4()
{
  return MEMORY[0x24BE5D2D8]();
}

uint64_t sub_23C34E7F0()
{
  return MEMORY[0x24BE5D2F8]();
}

uint64_t sub_23C34E7FC()
{
  return MEMORY[0x24BE5D308]();
}

uint64_t sub_23C34E808()
{
  return MEMORY[0x24BE5D330]();
}

uint64_t sub_23C34E814()
{
  return MEMORY[0x24BE5D770]();
}

uint64_t sub_23C34E820()
{
  return MEMORY[0x24BE5D790]();
}

uint64_t sub_23C34E82C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23C34E838()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23C34E844()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_23C34E850()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23C34E85C()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_23C34E868()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_23C34E874()
{
  return MEMORY[0x24BDCF990]();
}

uint64_t sub_23C34E880()
{
  return MEMORY[0x24BDCFA68]();
}

uint64_t sub_23C34E88C()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_23C34E898()
{
  return MEMORY[0x24BE34F10]();
}

uint64_t sub_23C34E8A4()
{
  return MEMORY[0x24BE37C28]();
}

uint64_t sub_23C34E8B0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23C34E8BC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23C34E8C8()
{
  return MEMORY[0x24BEE0DC8]();
}

uint64_t sub_23C34E8D4()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_23C34E8E0()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_23C34E8EC()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23C34E8F8()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23C34E904()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23C34E910()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_23C34E91C()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_23C34E928()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_23C34E934()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23C34E940()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23C34E94C()
{
  return MEMORY[0x24BEE68D8]();
}

uint64_t sub_23C34E958()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23C34E964()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23C34E970()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_23C34E97C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23C34E988()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23C34E994()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_23C34E9A0()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_23C34E9AC()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_23C34E9B8()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23C34E9C4()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_23C34E9D0()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_23C34E9DC()
{
  return MEMORY[0x24BEE1908]();
}

uint64_t sub_23C34E9E8()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_23C34E9F4()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_23C34EA00()
{
  return MEMORY[0x24BEE1930]();
}

uint64_t sub_23C34EA0C()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_23C34EA18()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_23C34EA24()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_23C34EA30()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23C34EA3C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23C34EA48()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23C34EA54()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_23C34EA60()
{
  return MEMORY[0x24BEE2168]();
}

uint64_t sub_23C34EA6C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23C34EA78()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23C34EA84()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23C34EA90()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23C34EA9C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23C34EAA8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23C34EAB4()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23C34EAC0()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23C34EACC()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_23C34EAD8()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_23C34EAE4()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_23C34EAF0()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_23C34EAFC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23C34EB08()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23C34EB14()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23C34EB20()
{
  return MEMORY[0x24BEE3288]();
}

uint64_t sub_23C34EB2C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23C34EB38()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23C34EB44()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23C34EB50()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23C34EB5C()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_23C34EB68()
{
  return MEMORY[0x24BEE3300]();
}

uint64_t sub_23C34EB74()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23C34EB80()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23C34EB8C()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23C34EB98()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_23C34EBA4()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23C34EBB0()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23C34EBBC()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23C34EBC8()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_23C34EBD4()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23C34EBE0()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23C34EBEC()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_23C34EBF8()
{
  return MEMORY[0x24BEE3450]();
}

uint64_t sub_23C34EC04()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23C34EC10()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23C34EC1C()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23C34EC28()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_23C34EC34()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23C34EC40()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23C34EC4C()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_23C34EC58()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_23C34EC64()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23C34EC70()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23C34EC7C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23C34EC88()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23C34EC94()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23C34ECA0()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_23C34ECAC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23C34ECB8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23C34ECC4()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23C34ECD0()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23C34ECDC()
{
  return MEMORY[0x24BEE4A10]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
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

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
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

