_DWORD *sub_232E67E28(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_232E67E30(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_232E67E38(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_232E67E40(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t storeEnumTagSinglePayload for ActivityDescriptorContentState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232E67E98 + 4 * byte_232E7B8F3[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_232E67ECC + 4 * byte_232E7B8EE[v4]))();
}

uint64_t sub_232E67ECC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232E67ED4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232E67EDCLL);
  return result;
}

uint64_t sub_232E67EE8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232E67EF0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_232E67EF4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232E67EFC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ActivityDescriptorContentState.CodingKeys()
{
  return &type metadata for ActivityDescriptorContentState.CodingKeys;
}

unint64_t sub_232E67F1C()
{
  unint64_t result;

  result = qword_255FFEAD0;
  if (!qword_255FFEAD0)
  {
    result = MEMORY[0x23492A124](&unk_232E7BBD8, &type metadata for ActivityDescriptorContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FFEAD0);
  }
  return result;
}

unint64_t sub_232E67F64()
{
  unint64_t result;

  result = qword_255FFEAD8;
  if (!qword_255FFEAD8)
  {
    result = MEMORY[0x23492A124](&unk_232E7BC90, &type metadata for XPCCodableActivityDescriptorContentStates.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FFEAD8);
  }
  return result;
}

unint64_t sub_232E67FAC()
{
  unint64_t result;

  result = qword_255FFC7D8;
  if (!qword_255FFC7D8)
  {
    result = MEMORY[0x23492A124](&unk_232E7BB48, &type metadata for ActivityDescriptorContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FFC7D8);
  }
  return result;
}

unint64_t sub_232E67FF4()
{
  unint64_t result;

  result = qword_255FFC7D0;
  if (!qword_255FFC7D0)
  {
    result = MEMORY[0x23492A124](&unk_232E7BB70, &type metadata for ActivityDescriptorContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FFC7D0);
  }
  return result;
}

uint64_t sub_232E68038(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7470697263736564 && a2 == 0xEA0000000000726FLL;
  if (v2 || (sub_232E6F6E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000 || (sub_232E6F6E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x53746E65746E6F63 && a2 == 0xEC00000065746174 || (sub_232E6F6E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746E65746E6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_232E6F6E4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_232E6820C(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000017 && a2 == 0x8000000232E7FBD0)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_232E6F6E4();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_232E68290(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254236840);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_232E682D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254236840);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

BOOL static ActivityAuthorizationOptionsType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

ActivityKit::ActivityAuthorizationOptionsType __swiftcall ActivityAuthorizationOptionsType.init(authorizationCount:)(Swift::Int authorizationCount)
{
  char *v1;
  char v2;

  if (authorizationCount == 2)
    v2 = 1;
  else
    v2 = 3;
  if (authorizationCount == 1)
    v2 = 0;
  *v1 = v2;
  return (char)authorizationCount;
}

uint64_t ActivityAuthorizationOptionsType.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_232E6837C + 4 * byte_232E7BD60[*v0]))(0xD000000000000010, 0x8000000232E7DDE0);
}

uint64_t sub_232E6837C(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_232E683A4()
{
  return 0x6F6974704F206F4ELL;
}

uint64_t ActivityAuthorizationOptionsType.authorizationCount.getter()
{
  _BYTE *v0;

  if (*v0)
    return 2 * (*v0 == 1);
  else
    return 1;
}

uint64_t ActivityAuthorizationOptionsType.hash(into:)()
{
  return sub_232E6F78C();
}

uint64_t sub_232E68404()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_232E68440 + 4 * byte_232E7BD64[*v0]))(0x7265507473726966, 0xEF6E6F697373696DLL);
}

unint64_t sub_232E68440()
{
  return 0xD000000000000010;
}

unint64_t sub_232E6845C()
{
  return 0xD000000000000013;
}

uint64_t sub_232E6847C()
{
  return 0x6E6F6974704F6F6ELL;
}

uint64_t sub_232E68498@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_232E69330(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_232E684BC()
{
  sub_232E68938();
  return sub_232E6F7D4();
}

uint64_t sub_232E684E4()
{
  sub_232E68938();
  return sub_232E6F7E0();
}

uint64_t sub_232E6850C()
{
  sub_232E68A48();
  return sub_232E6F7D4();
}

uint64_t sub_232E68534()
{
  sub_232E68A48();
  return sub_232E6F7E0();
}

uint64_t sub_232E6855C()
{
  sub_232E689C0();
  return sub_232E6F7D4();
}

uint64_t sub_232E68584()
{
  sub_232E689C0();
  return sub_232E6F7E0();
}

uint64_t sub_232E685AC()
{
  sub_232E6897C();
  return sub_232E6F7D4();
}

uint64_t sub_232E685D4()
{
  sub_232E6897C();
  return sub_232E6F7E0();
}

uint64_t sub_232E685FC()
{
  sub_232E68A04();
  return sub_232E6F7D4();
}

uint64_t sub_232E68624()
{
  sub_232E68A04();
  return sub_232E6F7E0();
}

void ActivityAuthorizationOptionsType.encode(to:)(_QWORD *a1)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
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
  uint64_t v21;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254237A10);
  v19 = *(_QWORD *)(v4 - 8);
  v20 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v18 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254237A30);
  v16 = *(_QWORD *)(v6 - 8);
  v17 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v15 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254237A28);
  v13 = *(_QWORD *)(v8 - 8);
  v14 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254237A20);
  MEMORY[0x24BDAC7A8](v12);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254237A18);
  v21 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v10 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232E68938();
  sub_232E6F7C8();
  __asm { BR              X9 }
}

uint64_t sub_232E68804()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v4 - 68) = 0;
  sub_232E68A48();
  sub_232E6F660();
  (*(void (**)(uint64_t, _QWORD))(v3 + 8))(v2, *(_QWORD *)(v4 - 168));
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 96) + 8))(v1, v0);
}

unint64_t sub_232E68938()
{
  unint64_t result;

  result = qword_254237EB8;
  if (!qword_254237EB8)
  {
    result = MEMORY[0x23492A124](&unk_232E7C25C, &type metadata for ActivityAuthorizationOptionsType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237EB8);
  }
  return result;
}

unint64_t sub_232E6897C()
{
  unint64_t result;

  result = qword_254237D68;
  if (!qword_254237D68)
  {
    result = MEMORY[0x23492A124](&unk_232E7C20C, &type metadata for ActivityAuthorizationOptionsType.NoOptionsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237D68);
  }
  return result;
}

unint64_t sub_232E689C0()
{
  unint64_t result;

  result = qword_255FFEAE0;
  if (!qword_255FFEAE0)
  {
    result = MEMORY[0x23492A124](&unk_232E7C1BC, &type metadata for ActivityAuthorizationOptionsType.MoreFrequentUpdatesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FFEAE0);
  }
  return result;
}

unint64_t sub_232E68A04()
{
  unint64_t result;

  result = qword_255FFEAE8;
  if (!qword_255FFEAE8)
  {
    result = MEMORY[0x23492A124](&unk_232E7C16C, &type metadata for ActivityAuthorizationOptionsType.SecondPermissionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FFEAE8);
  }
  return result;
}

unint64_t sub_232E68A48()
{
  unint64_t result;

  result = qword_2542377B8;
  if (!qword_2542377B8)
  {
    result = MEMORY[0x23492A124](&unk_232E7C11C, &type metadata for ActivityAuthorizationOptionsType.FirstPermissionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542377B8);
  }
  return result;
}

uint64_t ActivityAuthorizationOptionsType.hashValue.getter()
{
  sub_232E6F780();
  sub_232E6F78C();
  return sub_232E6F7B0();
}

uint64_t ActivityAuthorizationOptionsType.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  _QWORD *v27;
  uint64_t v28;

  v23 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254237F18);
  v21[5] = *(_QWORD *)(v3 - 8);
  v21[6] = v3;
  MEMORY[0x24BDAC7A8](v3);
  v26 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_254237F38);
  v21[4] = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254237F30);
  v21[2] = *(_QWORD *)(v6 - 8);
  v21[3] = v6;
  MEMORY[0x24BDAC7A8](v6);
  v24 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254237F28);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254237F20);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[3];
  v27 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_232E68938();
  v15 = v28;
  sub_232E6F7BC();
  if (!v15)
  {
    v21[0] = v9;
    v21[1] = v8;
    v28 = v11;
    v16 = sub_232E6F648();
    if (*(_QWORD *)(v16 + 16) == 1)
      __asm { BR              X9 }
    v17 = sub_232E6F51C();
    swift_allocError();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255FFD5B0);
    *v19 = &type metadata for ActivityAuthorizationOptionsType;
    sub_232E6F5E8();
    sub_232E6F510();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v19, *MEMORY[0x24BEE26D0], v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v10);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
}

unint64_t sub_232E68F58()
{
  unint64_t result;

  result = qword_255FFEAF0;
  if (!qword_255FFEAF0)
  {
    result = MEMORY[0x23492A124](&protocol conformance descriptor for ActivityAuthorizationOptionsType, &type metadata for ActivityAuthorizationOptionsType);
    atomic_store(result, (unint64_t *)&qword_255FFEAF0);
  }
  return result;
}

uint64_t sub_232E68F9C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ActivityAuthorizationOptionsType.init(from:)(a1, a2);
}

void sub_232E68FB0(_QWORD *a1)
{
  ActivityAuthorizationOptionsType.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for ActivityAuthorizationOptionsType.CodingKeys()
{
  return &type metadata for ActivityAuthorizationOptionsType.CodingKeys;
}

ValueMetadata *type metadata accessor for ActivityAuthorizationOptionsType.FirstPermissionCodingKeys()
{
  return &type metadata for ActivityAuthorizationOptionsType.FirstPermissionCodingKeys;
}

ValueMetadata *type metadata accessor for ActivityAuthorizationOptionsType.SecondPermissionCodingKeys()
{
  return &type metadata for ActivityAuthorizationOptionsType.SecondPermissionCodingKeys;
}

ValueMetadata *type metadata accessor for ActivityAuthorizationOptionsType.MoreFrequentUpdatesCodingKeys()
{
  return &type metadata for ActivityAuthorizationOptionsType.MoreFrequentUpdatesCodingKeys;
}

ValueMetadata *type metadata accessor for ActivityAuthorizationOptionsType.NoOptionsCodingKeys()
{
  return &type metadata for ActivityAuthorizationOptionsType.NoOptionsCodingKeys;
}

unint64_t sub_232E6901C()
{
  unint64_t result;

  result = qword_255FFEAF8;
  if (!qword_255FFEAF8)
  {
    result = MEMORY[0x23492A124](&unk_232E7C0F4, &type metadata for ActivityAuthorizationOptionsType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FFEAF8);
  }
  return result;
}

unint64_t sub_232E69064()
{
  unint64_t result;

  result = qword_254237ED8;
  if (!qword_254237ED8)
  {
    result = MEMORY[0x23492A124](&unk_232E7C014, &type metadata for ActivityAuthorizationOptionsType.FirstPermissionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237ED8);
  }
  return result;
}

unint64_t sub_232E690AC()
{
  unint64_t result;

  result = qword_254237ED0;
  if (!qword_254237ED0)
  {
    result = MEMORY[0x23492A124](&unk_232E7C03C, &type metadata for ActivityAuthorizationOptionsType.FirstPermissionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237ED0);
  }
  return result;
}

unint64_t sub_232E690F4()
{
  unint64_t result;

  result = qword_254237EE8;
  if (!qword_254237EE8)
  {
    result = MEMORY[0x23492A124](&unk_232E7BFC4, &type metadata for ActivityAuthorizationOptionsType.SecondPermissionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237EE8);
  }
  return result;
}

unint64_t sub_232E6913C()
{
  unint64_t result;

  result = qword_254237EE0;
  if (!qword_254237EE0)
  {
    result = MEMORY[0x23492A124](&unk_232E7BFEC, &type metadata for ActivityAuthorizationOptionsType.SecondPermissionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237EE0);
  }
  return result;
}

unint64_t sub_232E69184()
{
  unint64_t result;

  result = qword_254237EF8;
  if (!qword_254237EF8)
  {
    result = MEMORY[0x23492A124](&unk_232E7BF74, &type metadata for ActivityAuthorizationOptionsType.MoreFrequentUpdatesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237EF8);
  }
  return result;
}

unint64_t sub_232E691CC()
{
  unint64_t result;

  result = qword_254237EF0;
  if (!qword_254237EF0)
  {
    result = MEMORY[0x23492A124](&unk_232E7BF9C, &type metadata for ActivityAuthorizationOptionsType.MoreFrequentUpdatesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237EF0);
  }
  return result;
}

unint64_t sub_232E69214()
{
  unint64_t result;

  result = qword_254237EB0;
  if (!qword_254237EB0)
  {
    result = MEMORY[0x23492A124](&unk_232E7BF24, &type metadata for ActivityAuthorizationOptionsType.NoOptionsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237EB0);
  }
  return result;
}

unint64_t sub_232E6925C()
{
  unint64_t result;

  result = qword_254237EA8;
  if (!qword_254237EA8)
  {
    result = MEMORY[0x23492A124](&unk_232E7BF4C, &type metadata for ActivityAuthorizationOptionsType.NoOptionsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237EA8);
  }
  return result;
}

unint64_t sub_232E692A4()
{
  unint64_t result;

  result = qword_254237EC8;
  if (!qword_254237EC8)
  {
    result = MEMORY[0x23492A124](&unk_232E7C064, &type metadata for ActivityAuthorizationOptionsType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237EC8);
  }
  return result;
}

unint64_t sub_232E692EC()
{
  unint64_t result;

  result = qword_254237EC0;
  if (!qword_254237EC0)
  {
    result = MEMORY[0x23492A124](&unk_232E7C08C, &type metadata for ActivityAuthorizationOptionsType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237EC0);
  }
  return result;
}

uint64_t sub_232E69330(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7265507473726966 && a2 == 0xEF6E6F697373696DLL;
  if (v2 || (sub_232E6F6E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000232E7FBF0 || (sub_232E6F6E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000232E7FC10 || (sub_232E6F6E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E6F6974704F6F6ELL && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_232E6F6E4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t static ActivityPushTokenServiceDefinition.domain.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_254238478 != -1)
    swift_once();
  v2 = sub_232E6EED4();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_254238590);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

ValueMetadata *type metadata accessor for ActivityPushTokenServiceDefinition()
{
  return &type metadata for ActivityPushTokenServiceDefinition;
}

BOOL sub_232E6958C(uint64_t a1, uint64_t a2)
{
  return sub_232E695FC(a1, a2, &qword_254237620, (uint64_t (*)(uint64_t))type metadata accessor for ActivityEndingOptions, &qword_255FFBFB0, (uint64_t)&protocol conformance descriptor for ActivityEndingOptions);
}

BOOL sub_232E695B0(uint64_t a1, _QWORD *a2)
{
  return sub_232E69E2C(a1, a2, (void (*)(void))sub_232DEBD34);
}

BOOL sub_232E695C4(uint64_t a1, _QWORD *a2)
{
  return sub_232E69E2C(a1, a2, (void (*)(void))sub_232DEBBB4);
}

BOOL sub_232E695D8(uint64_t a1, uint64_t a2)
{
  return sub_232E695FC(a1, a2, &qword_255FFD8E8, (uint64_t (*)(uint64_t))type metadata accessor for OpaqueActivityContent, &qword_2542379A0, (uint64_t)&protocol conformance descriptor for OpaqueActivityContent);
}

BOOL sub_232E695FC(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t), unint64_t *a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v23[2];

  v23[0] = a6;
  v10 = __swift_instantiateConcreteTypeFromMangledName(a3);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v23 - v14;
  sub_232DDD798(a2, a3);
  sub_232E6EDB4();
  swift_allocObject();
  sub_232E6EDA8();
  v16 = a4(0);
  v17 = sub_232E6EE44();
  v19 = v18;
  sub_232DDDAD8(a5, a4, v23[0]);
  sub_232E6ED9C();
  swift_release();
  sub_232DE8D98(v17, v19);
  v20 = *(_QWORD *)(v16 - 8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v15, 0, 1, v16);
  sub_232DE939C((uint64_t)v15, a2, a3);
  sub_232DF5040(a2, (uint64_t)v12, a3);
  v21 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v12, 1, v16) != 1;
  sub_232DDD798((uint64_t)v12, a3);
  return v21;
}

BOOL sub_232E697A8(uint64_t a1, uint64_t a2)
{
  return sub_232E695FC(a1, a2, &qword_2542379D0, type metadata accessor for OpaqueActivityPayload, &qword_2542378A0, (uint64_t)&protocol conformance descriptor for OpaqueActivityPayload);
}

BOOL sub_232E697CC(uint64_t a1, _QWORD *a2)
{
  return sub_232E69E2C(a1, a2, (void (*)(void))sub_232E09350);
}

BOOL sub_232E697E0(uint64_t a1, _QWORD *a2)
{
  return sub_232E69938(a1, a2, (void (*)(_QWORD))sub_232E5EFDC, (void (*)(void))sub_232E16E20);
}

BOOL sub_232E697FC(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;

  swift_bridgeObjectRelease();
  sub_232E6EDB4();
  swift_allocObject();
  sub_232E6EDA8();
  v3 = sub_232E6EE44();
  v5 = v4;
  sub_232E16F30();
  sub_232E6ED9C();
  swift_release();
  sub_232DE8D98(v3, v5);
  *a2 = v7;
  a2[1] = v8;
  return v8 != 0;
}

BOOL sub_232E698E4(uint64_t a1, _QWORD *a2)
{
  return sub_232E69E2C(a1, a2, (void (*)(void))sub_232DFD80C);
}

BOOL sub_232E698F8(uint64_t a1, uint64_t a2)
{
  return sub_232E695FC(a1, a2, &qword_255FFD8E0, (uint64_t (*)(uint64_t))type metadata accessor for ActivityUIDismissalPolicy, &qword_255FFC488, (uint64_t)&protocol conformance descriptor for ActivityUIDismissalPolicy);
}

BOOL sub_232E6991C(uint64_t a1, _QWORD *a2)
{
  return sub_232E69938(a1, a2, (void (*)(_QWORD))sub_232E5F0EC, (void (*)(void))sub_232E16EEC);
}

BOOL sub_232E69938(uint64_t a1, _QWORD *a2, void (*a3)(_QWORD), void (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;

  a3(*a2);
  sub_232E6EDB4();
  swift_allocObject();
  sub_232E6EDA8();
  v6 = sub_232E6EE44();
  v8 = v7;
  a4();
  sub_232E6ED9C();
  swift_release();
  sub_232DE8D98(v6, v8);
  *a2 = v10;
  return v10 != 1;
}

BOOL sub_232E69A20(uint64_t a1, _BYTE *a2)
{
  return sub_232E69C5C(a1, a2, (void (*)(void))sub_232DEB244);
}

BOOL sub_232E69A34(uint64_t a1, _WORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  __int16 v7;

  sub_232E6EDB4();
  swift_allocObject();
  sub_232E6EDA8();
  v3 = sub_232E6EE44();
  v5 = v4;
  sub_232DFEA54();
  sub_232E6ED9C();
  swift_release();
  sub_232DE8D98(v3, v5);
  *a2 = v7;
  return v7 != 2;
}

BOOL sub_232E69B14(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  __int128 v7;

  sub_232E5F050(*a2);
  sub_232E6EDB4();
  swift_allocObject();
  sub_232E6EDA8();
  v3 = sub_232E6EE44();
  v5 = v4;
  sub_232E12978();
  sub_232E6ED9C();
  swift_release();
  sub_232DE8D98(v3, v5);
  *(_OWORD *)a2 = v7;
  return (_QWORD)v7 != 1;
}

BOOL sub_232E69C00(uint64_t a1, uint64_t a2)
{
  return sub_232E695FC(a1, a2, &qword_254236840, (uint64_t (*)(uint64_t))type metadata accessor for ActivityDescriptorContentState, &qword_254237AF8, (uint64_t)&protocol conformance descriptor for ActivityDescriptorContentState);
}

BOOL sub_232E69C24(uint64_t a1, uint64_t a2)
{
  return sub_232E695FC(a1, a2, &qword_255FFD8C0, (uint64_t (*)(uint64_t))type metadata accessor for ActivityPlatterDismissalPolicy, &qword_255FFD8C8, (uint64_t)&protocol conformance descriptor for ActivityPlatterDismissalPolicy);
}

BOOL sub_232E69C48(uint64_t a1, _BYTE *a2)
{
  return sub_232E69C5C(a1, a2, (void (*)(void))sub_232DFE024);
}

BOOL sub_232E69C5C(uint64_t a1, _BYTE *a2, void (*a3)(void))
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v9;

  sub_232E6EDB4();
  swift_allocObject();
  sub_232E6EDA8();
  v5 = sub_232E6EE44();
  v7 = v6;
  a3();
  sub_232E6ED9C();
  swift_release();
  sub_232DE8D98(v5, v7);
  *a2 = v9;
  return v9 != 2;
}

BOOL sub_232E69D3C(uint64_t a1, _BYTE *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  char v7;

  sub_232E6EDB4();
  swift_allocObject();
  sub_232E6EDA8();
  v3 = sub_232E6EE44();
  v5 = v4;
  sub_232E16EA8();
  sub_232E6ED9C();
  swift_release();
  sub_232DE8D98(v3, v5);
  *a2 = v7;
  return v7 != 4;
}

BOOL sub_232E69E18(uint64_t a1, _QWORD *a2)
{
  return sub_232E69E2C(a1, a2, (void (*)(void))sub_232E0422C);
}

BOOL sub_232E69E2C(uint64_t a1, _QWORD *a2, void (*a3)(void))
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v9;

  swift_bridgeObjectRelease();
  sub_232E6EDB4();
  swift_allocObject();
  sub_232E6EDA8();
  v5 = sub_232E6EE44();
  v7 = v6;
  a3();
  sub_232E6ED9C();
  swift_release();
  sub_232DE8D98(v5, v7);
  *a2 = v9;
  return v9 != 0;
}

BOOL sub_232E69F14(uint64_t a1, uint64_t a2)
{
  return sub_232E695FC(a1, a2, &qword_254237420, (uint64_t (*)(uint64_t))type metadata accessor for ActivityRequest, &qword_255FFBFD8, (uint64_t)&protocol conformance descriptor for ActivityRequest);
}

BOOL sub_232E69F38(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  sub_232E5EFEC(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
  sub_232E6EDB4();
  swift_allocObject();
  sub_232E6EDA8();
  v3 = sub_232E6EE44();
  v5 = v4;
  sub_232E16E64();
  sub_232E6ED9C();
  swift_release();
  sub_232DE8D98(v3, v5);
  *(_QWORD *)a2 = v7;
  *(_OWORD *)(a2 + 8) = v8;
  *(_OWORD *)(a2 + 24) = v9;
  *(_OWORD *)(a2 + 40) = v10;
  return (_QWORD)v8 != 1;
}

BOOL sub_232E6A050(uint64_t a1, uint64_t a2)
{
  return sub_232E695FC(a1, a2, &qword_255FFD730, (uint64_t (*)(uint64_t))type metadata accessor for AlertPayload, &qword_255FFD700, (uint64_t)&protocol conformance descriptor for AlertPayload);
}

uint64_t ActivityDescriptor.decodeAttributes<A>(for:)()
{
  sub_232E6ECD0();
  swift_allocObject();
  sub_232E6ECC4();
  sub_232E6ECB8();
  return swift_release();
}

id ACActivityDescriptor.init(descriptor:)(uint64_t a1)
{
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  void *v8;
  id v9;
  int *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  void *v39;

  v31 = *(unsigned __int8 *)(a1 + 129);
  v32 = *(unsigned __int8 *)(a1 + 128);
  v2 = *(_QWORD *)(a1 + 104);
  v3 = *(_BYTE *)(a1 + 112);
  v4 = *(_BYTE *)(a1 + 113);
  v5 = *(_BYTE *)(a1 + 114);
  v6 = *(_BYTE *)(a1 + 115);
  v7 = *(_BYTE *)(a1 + 116);
  v8 = *(void **)(a1 + 120);
  sub_232DE06B4(0, &qword_254236870);
  v33 = v2;
  v34 = v3;
  v35 = v4;
  v36 = v5;
  v37 = v6;
  v38 = v7;
  v39 = v8;
  v9 = v8;
  swift_bridgeObjectRetain();
  v30 = sub_232E0564C(&v33);
  sub_232E6EDD8();
  swift_allocObject();
  sub_232E6EDCC();
  v10 = (int *)type metadata accessor for ActivityDescriptor();
  sub_232DDDAD8(&qword_254237400, (uint64_t (*)(uint64_t))type metadata accessor for ActivityDescriptor, (uint64_t)&protocol conformance descriptor for ActivityDescriptor);
  v11 = sub_232E6EDC0();
  v13 = v12;
  v14 = (void *)sub_232E6EE2C();
  sub_232DE8D98(v11, v13);
  swift_release();
  v15 = sub_232E6EE44();
  v17 = v16;

  v18 = *(_QWORD *)(a1 + v10[14] + 8);
  v29 = *(unsigned __int8 *)(a1 + 88);
  swift_bridgeObjectRetain();
  v27 = qword_232E7CC18[*(char *)(a1 + v10[15])];
  v19 = *(_QWORD *)(a1 + v10[13] + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v28 = (void *)sub_232E6F1E0();
  v20 = (void *)sub_232E6F1E0();
  swift_bridgeObjectRelease();
  v21 = (void *)sub_232E6EE50();
  v22 = (void *)sub_232E6EE2C();
  if (!v19)
  {
    v23 = 0;
    if (v18)
      goto LABEL_3;
LABEL_5:
    v24 = 0;
    goto LABEL_6;
  }
  v23 = (void *)sub_232E6F1E0();
  swift_bridgeObjectRelease();
  if (!v18)
    goto LABEL_5;
LABEL_3:
  v24 = (void *)sub_232E6F1E0();
  swift_bridgeObjectRelease();
LABEL_6:
  v25 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithIdentifier_target_presentationOptions_isEphemeral_isMomentary_createdDate_descriptorData_contentType_remoteDeviceIdentifier_localizedAppName_protectionClass_, v28, v20, v30, v32, v31, v21, v22, v29, v23, v24, v27);
  sub_232DE8D98(v15, v17);

  sub_232E6CBE4(a1);
  return v25;
}

id ActivityDescriptor.acActivityDescriptor.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v1 = type metadata accessor for ActivityDescriptor();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232DE06B4(0, &qword_254236868);
  sub_232E6CC20(v0, (uint64_t)v3);
  return ACActivityDescriptor.init(descriptor:)((uint64_t)v3);
}

uint64_t static DeviceIdentifier.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2)
    return a4 == 0;
  if (!a4)
    return 0;
  if (a1 == a3 && a2 == a4)
    return 1;
  return sub_232E6F6E4();
}

uint64_t sub_232E6A4B8()
{
  _BYTE *v0;

  if (*v0)
    return 0x65746F6D6572;
  else
    return 0x6C61636F6CLL;
}

uint64_t sub_232E6A4EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_232E6CD30(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_232E6A510()
{
  sub_232E6CC64();
  return sub_232E6F7D4();
}

uint64_t sub_232E6A538()
{
  sub_232E6CC64();
  return sub_232E6F7E0();
}

uint64_t sub_232E6A560()
{
  sub_232E6CCEC();
  return sub_232E6F7D4();
}

uint64_t sub_232E6A588()
{
  sub_232E6CCEC();
  return sub_232E6F7E0();
}

uint64_t sub_232E6A5B0()
{
  sub_232E6CCA8();
  return sub_232E6F7D4();
}

uint64_t sub_232E6A5D8()
{
  sub_232E6CCA8();
  return sub_232E6F7E0();
}

uint64_t DeviceIdentifier.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD v15[2];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v17 = a3;
  v15[1] = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255FFC888);
  v16 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_255FFC880);
  v7 = *(_QWORD *)(v15[0] - 8);
  MEMORY[0x24BDAC7A8](v15[0]);
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255FFC878);
  v18 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232E6CC64();
  v13 = v17;
  sub_232E6F7C8();
  if (v13)
  {
    v20 = 1;
    sub_232E6CCA8();
    sub_232E6F660();
    sub_232E6F684();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v6, v4);
  }
  else
  {
    v19 = 0;
    sub_232E6CCEC();
    sub_232E6F660();
    (*(void (**)(char *, _QWORD))(v7 + 8))(v9, v15[0]);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v12, v10);
}

_QWORD *DeviceIdentifier.init(from:)(_QWORD *a1)
{
  return sub_232E6CE10(a1);
}

_QWORD *sub_232E6A830@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;

  result = sub_232E6CE10(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_232E6A858(_QWORD *a1)
{
  uint64_t *v1;

  return DeviceIdentifier.encode(to:)(a1, *v1, v1[1]);
}

uint64_t ActivityDescriptor.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ActivityDescriptor.attributesType.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 24);
  *a1 = *(_QWORD *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t ActivityDescriptor.attributesData.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  sub_232DE4A2C(v1, *(_QWORD *)(v0 + 40));
  return v1;
}

uint64_t ActivityDescriptor.platterTarget.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v2 = *(_QWORD *)(v1 + 56);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(_QWORD *)(v1 + 72);
  v5 = *(_QWORD *)(v1 + 80);
  v6 = *(_BYTE *)(v1 + 88);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 48);
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  return sub_232E01E78();
}

uint64_t ActivityDescriptor.contentSources.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ActivityDescriptor.presentationOptions.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  char v5;
  char v6;
  void *v7;
  id v8;

  v2 = *(_BYTE *)(v1 + 112);
  v3 = *(_BYTE *)(v1 + 113);
  v4 = *(_BYTE *)(v1 + 114);
  v5 = *(_BYTE *)(v1 + 115);
  v6 = *(_BYTE *)(v1 + 116);
  v7 = *(void **)(v1 + 120);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 104);
  *(_BYTE *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 9) = v3;
  *(_BYTE *)(a1 + 10) = v4;
  *(_BYTE *)(a1 + 11) = v5;
  *(_BYTE *)(a1 + 12) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  v8 = v7;
  return swift_bridgeObjectRetain();
}

uint64_t ActivityDescriptor.isEphemeral.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 128);
}

uint64_t ActivityDescriptor.isMomentary.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 129);
}

uint64_t ActivityDescriptor.createdDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ActivityDescriptor() + 48);
  v4 = sub_232E6EE74();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t ActivityDescriptor.deviceIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ActivityDescriptor() + 52));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ActivityDescriptor.localizedAppName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ActivityDescriptor() + 56));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ActivityDescriptor.protectionClass.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ActivityDescriptor() + 60));
}

uint64_t ActivityDescriptor.createdBySessionRequest.getter()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16) == 0x7474417972746E45 && *(_QWORD *)(v0 + 24) == 0xEF73657475626972)
    return 1;
  else
    return sub_232E6F6E4();
}

uint64_t ActivityDescriptor.init(id:attributesType:attributesData:platterTarget:presentationOptions:contentSources:isEphemeral:isMomentary:createdDate:deviceIdentifier:localizedAppName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  uint64_t v27;
  __int128 v28;
  int *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  _QWORD *v33;
  _QWORD *v34;

  v17 = *a3;
  v18 = a3[1];
  v19 = *(_QWORD *)(a6 + 32);
  v20 = *(_BYTE *)(a6 + 40);
  v21 = *a7;
  v22 = *((_BYTE *)a7 + 8);
  v23 = *((_BYTE *)a7 + 9);
  v24 = *((_BYTE *)a7 + 10);
  v25 = *((_BYTE *)a7 + 11);
  v26 = *((_BYTE *)a7 + 12);
  v27 = a7[2];
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = v17;
  *(_QWORD *)(a9 + 24) = v18;
  *(_QWORD *)(a9 + 32) = a4;
  *(_QWORD *)(a9 + 40) = a5;
  v28 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a9 + 48) = *(_OWORD *)a6;
  *(_OWORD *)(a9 + 64) = v28;
  *(_QWORD *)(a9 + 80) = v19;
  *(_BYTE *)(a9 + 88) = v20;
  *(_BYTE *)(a9 + 112) = v22;
  *(_BYTE *)(a9 + 113) = v23;
  *(_BYTE *)(a9 + 114) = v24;
  *(_BYTE *)(a9 + 115) = v25;
  *(_BYTE *)(a9 + 116) = v26;
  *(_QWORD *)(a9 + 120) = v27;
  *(_QWORD *)(a9 + 96) = a8;
  *(_QWORD *)(a9 + 104) = v21;
  *(_BYTE *)(a9 + 128) = a10;
  *(_BYTE *)(a9 + 129) = a11;
  v29 = (int *)type metadata accessor for ActivityDescriptor();
  v30 = a9 + v29[12];
  v31 = sub_232E6EE74();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v30, a12, v31);
  v33 = (_QWORD *)(a9 + v29[13]);
  *v33 = a13;
  v33[1] = a14;
  v34 = (_QWORD *)(a9 + v29[14]);
  *v34 = a15;
  v34[1] = a16;
  *(_BYTE *)(a9 + v29[15]) = 4;
  return result;
}

uint64_t ActivityDescriptor.init(id:attributesType:attributesData:platterTarget:presentationOptions:contentSources:isEphemeral:createdDate:deviceIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, unsigned __int8 a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  __int128 v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  _QWORD *v30;
  _QWORD *v31;

  v14 = *a3;
  v15 = a3[1];
  v16 = *(_QWORD *)(a6 + 32);
  v17 = *(_BYTE *)(a6 + 40);
  v18 = *a7;
  v19 = *((_BYTE *)a7 + 8);
  v20 = *((_BYTE *)a7 + 9);
  v21 = *((_BYTE *)a7 + 10);
  v22 = *((_BYTE *)a7 + 11);
  v23 = *((_BYTE *)a7 + 12);
  v24 = a7[2];
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = v14;
  *(_QWORD *)(a9 + 24) = v15;
  *(_QWORD *)(a9 + 32) = a4;
  *(_QWORD *)(a9 + 40) = a5;
  v25 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a9 + 48) = *(_OWORD *)a6;
  *(_OWORD *)(a9 + 64) = v25;
  *(_QWORD *)(a9 + 80) = v16;
  *(_BYTE *)(a9 + 88) = v17;
  *(_BYTE *)(a9 + 112) = v19;
  *(_BYTE *)(a9 + 113) = v20;
  *(_BYTE *)(a9 + 114) = v21;
  *(_BYTE *)(a9 + 115) = v22;
  *(_BYTE *)(a9 + 116) = v23;
  *(_QWORD *)(a9 + 120) = v24;
  *(_QWORD *)(a9 + 96) = a8;
  *(_QWORD *)(a9 + 104) = v18;
  *(_WORD *)(a9 + 128) = a10;
  v26 = (int *)type metadata accessor for ActivityDescriptor();
  v27 = a9 + v26[12];
  v28 = sub_232E6EE74();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v27, a11, v28);
  v30 = (_QWORD *)(a9 + v26[13]);
  *v30 = a12;
  v30[1] = a13;
  v31 = (_QWORD *)(a9 + v26[14]);
  *v31 = 0;
  v31[1] = 0;
  *(_BYTE *)(a9 + v26[15]) = 4;
  return result;
}

uint64_t ActivityDescriptor.init(id:attributesType:attributesData:platterTarget:presentationOptions:contentSources:isEphemeral:createdDate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, unsigned __int8 a10, uint64_t a11)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  uint64_t v22;
  __int128 v23;
  int *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  _QWORD *v28;
  _QWORD *v29;

  v12 = *a3;
  v13 = a3[1];
  v14 = *(_QWORD *)(a6 + 32);
  v15 = *(_BYTE *)(a6 + 40);
  v16 = *a7;
  v17 = *((_BYTE *)a7 + 8);
  v18 = *((_BYTE *)a7 + 9);
  v19 = *((_BYTE *)a7 + 10);
  v20 = *((_BYTE *)a7 + 11);
  v21 = *((_BYTE *)a7 + 12);
  v22 = a7[2];
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = v12;
  *(_QWORD *)(a9 + 24) = v13;
  *(_QWORD *)(a9 + 32) = a4;
  *(_QWORD *)(a9 + 40) = a5;
  v23 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a9 + 48) = *(_OWORD *)a6;
  *(_OWORD *)(a9 + 64) = v23;
  *(_QWORD *)(a9 + 80) = v14;
  *(_BYTE *)(a9 + 88) = v15;
  *(_BYTE *)(a9 + 112) = v17;
  *(_BYTE *)(a9 + 113) = v18;
  *(_BYTE *)(a9 + 114) = v19;
  *(_BYTE *)(a9 + 115) = v20;
  *(_BYTE *)(a9 + 116) = v21;
  *(_QWORD *)(a9 + 120) = v22;
  *(_QWORD *)(a9 + 96) = a8;
  *(_QWORD *)(a9 + 104) = v16;
  *(_WORD *)(a9 + 128) = a10;
  v24 = (int *)type metadata accessor for ActivityDescriptor();
  v25 = a9 + v24[12];
  v26 = sub_232E6EE74();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v25, a11, v26);
  v28 = (_QWORD *)(a9 + v24[13]);
  *v28 = 0;
  v28[1] = 0;
  v29 = (_QWORD *)(a9 + v24[14]);
  *v29 = 0;
  v29[1] = 0;
  *(_BYTE *)(a9 + v24[15]) = 4;
  return result;
}

uint64_t ActivityDescriptor.init(id:attributesType:attributesData:platterTarget:presentationOptions:contentSources:isEphemeral:isMomentary:createdDate:deviceIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  uint64_t v25;
  __int128 v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
  _QWORD *v31;
  _QWORD *v32;

  v15 = *a3;
  v16 = a3[1];
  v17 = *(_QWORD *)(a6 + 32);
  v18 = *(_BYTE *)(a6 + 40);
  v19 = *a7;
  v20 = *((_BYTE *)a7 + 8);
  v21 = *((_BYTE *)a7 + 9);
  v22 = *((_BYTE *)a7 + 10);
  v23 = *((_BYTE *)a7 + 11);
  v24 = *((_BYTE *)a7 + 12);
  v25 = a7[2];
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = v15;
  *(_QWORD *)(a9 + 24) = v16;
  *(_QWORD *)(a9 + 32) = a4;
  *(_QWORD *)(a9 + 40) = a5;
  v26 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a9 + 48) = *(_OWORD *)a6;
  *(_OWORD *)(a9 + 64) = v26;
  *(_QWORD *)(a9 + 80) = v17;
  *(_BYTE *)(a9 + 88) = v18;
  *(_BYTE *)(a9 + 112) = v20;
  *(_BYTE *)(a9 + 113) = v21;
  *(_BYTE *)(a9 + 114) = v22;
  *(_BYTE *)(a9 + 115) = v23;
  *(_BYTE *)(a9 + 116) = v24;
  *(_QWORD *)(a9 + 120) = v25;
  *(_QWORD *)(a9 + 96) = a8;
  *(_QWORD *)(a9 + 104) = v19;
  *(_BYTE *)(a9 + 128) = a10;
  *(_BYTE *)(a9 + 129) = a11;
  v27 = (int *)type metadata accessor for ActivityDescriptor();
  v28 = a9 + v27[12];
  v29 = sub_232E6EE74();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 32))(v28, a12, v29);
  v31 = (_QWORD *)(a9 + v27[13]);
  *v31 = a13;
  v31[1] = a14;
  v32 = (_QWORD *)(a9 + v27[14]);
  *v32 = 0;
  v32[1] = 0;
  *(_BYTE *)(a9 + v27[15]) = 4;
  return result;
}

uint64_t ActivityDescriptor.init(id:attributesType:attributesData:platterTarget:presentationOptions:contentSources:isEphemeral:isMomentary:createdDate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, char a11, uint64_t a12)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  uint64_t v23;
  __int128 v24;
  int *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  _QWORD *v29;
  _QWORD *v30;

  v13 = *a3;
  v14 = a3[1];
  v15 = *(_QWORD *)(a6 + 32);
  v16 = *(_BYTE *)(a6 + 40);
  v17 = *a7;
  v18 = *((_BYTE *)a7 + 8);
  v19 = *((_BYTE *)a7 + 9);
  v20 = *((_BYTE *)a7 + 10);
  v21 = *((_BYTE *)a7 + 11);
  v22 = *((_BYTE *)a7 + 12);
  v23 = a7[2];
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = v13;
  *(_QWORD *)(a9 + 24) = v14;
  *(_QWORD *)(a9 + 32) = a4;
  *(_QWORD *)(a9 + 40) = a5;
  v24 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a9 + 48) = *(_OWORD *)a6;
  *(_OWORD *)(a9 + 64) = v24;
  *(_QWORD *)(a9 + 80) = v15;
  *(_BYTE *)(a9 + 88) = v16;
  *(_BYTE *)(a9 + 112) = v18;
  *(_BYTE *)(a9 + 113) = v19;
  *(_BYTE *)(a9 + 114) = v20;
  *(_BYTE *)(a9 + 115) = v21;
  *(_BYTE *)(a9 + 116) = v22;
  *(_QWORD *)(a9 + 120) = v23;
  *(_QWORD *)(a9 + 96) = a8;
  *(_QWORD *)(a9 + 104) = v17;
  *(_BYTE *)(a9 + 128) = a10;
  *(_BYTE *)(a9 + 129) = a11;
  v25 = (int *)type metadata accessor for ActivityDescriptor();
  v26 = a9 + v25[12];
  v27 = sub_232E6EE74();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v26, a12, v27);
  v29 = (_QWORD *)(a9 + v25[13]);
  *v29 = 0;
  v29[1] = 0;
  v30 = (_QWORD *)(a9 + v25[14]);
  *v30 = 0;
  v30[1] = 0;
  *(_BYTE *)(a9 + v25[15]) = 4;
  return result;
}

uint64_t ActivityDescriptor.init(id:attributesType:attributesData:platterTarget:presentationOptions:contentSources:isEphemeral:isMomentary:createdDate:deviceIdentifier:protectionClass:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  uint64_t v26;
  __int128 v27;
  int *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  _QWORD *v32;
  _QWORD *v33;

  v16 = *a3;
  v17 = a3[1];
  v18 = *(_QWORD *)(a6 + 32);
  v19 = *(_BYTE *)(a6 + 40);
  v20 = *a7;
  v21 = *((_BYTE *)a7 + 8);
  v22 = *((_BYTE *)a7 + 9);
  v23 = *((_BYTE *)a7 + 10);
  v24 = *((_BYTE *)a7 + 11);
  v25 = *((_BYTE *)a7 + 12);
  v26 = a7[2];
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = v16;
  *(_QWORD *)(a9 + 24) = v17;
  *(_QWORD *)(a9 + 32) = a4;
  *(_QWORD *)(a9 + 40) = a5;
  v27 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a9 + 48) = *(_OWORD *)a6;
  *(_OWORD *)(a9 + 64) = v27;
  *(_QWORD *)(a9 + 80) = v18;
  *(_BYTE *)(a9 + 88) = v19;
  *(_BYTE *)(a9 + 112) = v21;
  *(_BYTE *)(a9 + 113) = v22;
  *(_BYTE *)(a9 + 114) = v23;
  *(_BYTE *)(a9 + 115) = v24;
  *(_BYTE *)(a9 + 116) = v25;
  *(_QWORD *)(a9 + 120) = v26;
  *(_QWORD *)(a9 + 96) = a8;
  *(_QWORD *)(a9 + 104) = v20;
  *(_BYTE *)(a9 + 128) = a10;
  *(_BYTE *)(a9 + 129) = a11;
  v28 = (int *)type metadata accessor for ActivityDescriptor();
  v29 = a9 + v28[12];
  v30 = sub_232E6EE74();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 32))(v29, a12, v30);
  v32 = (_QWORD *)(a9 + v28[13]);
  *v32 = a13;
  v32[1] = a14;
  v33 = (_QWORD *)(a9 + v28[14]);
  *v33 = 0;
  v33[1] = 0;
  *(_BYTE *)(a9 + v28[15]) = a15;
  return result;
}

uint64_t ActivityDescriptor.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_232E6F21C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_232E6B0CC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_232E6B0F4 + 4 * byte_232E7C350[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_232E6B0F4()
{
  return 0x7475626972747461;
}

uint64_t sub_232E6B128()
{
  return 0x5472657474616C70;
}

uint64_t sub_232E6B14C()
{
  return 0x53746E65746E6F63;
}

unint64_t sub_232E6B170()
{
  return 0xD000000000000013;
}

uint64_t sub_232E6B190()
{
  return 0x656D656870457369;
}

uint64_t sub_232E6B1B0()
{
  return 0x746E656D6F4D7369;
}

uint64_t sub_232E6B1D0()
{
  return 0x4464657461657263;
}

unint64_t sub_232E6B1F0()
{
  return 0xD000000000000010;
}

uint64_t sub_232E6B218()
{
  return 0x69746365746F7270;
}

uint64_t sub_232E6B23C()
{
  unsigned __int8 *v0;

  return sub_232E6B0CC(*v0);
}

uint64_t sub_232E6B244@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_232E6E420(a1, a2);
  *a3 = result;
  return result;
}

void sub_232E6B268(_BYTE *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_232E6B274()
{
  sub_232E6D19C();
  return sub_232E6F7D4();
}

uint64_t sub_232E6B29C()
{
  sub_232E6D19C();
  return sub_232E6F7E0();
}

uint64_t ActivityDescriptor.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  char v24;
  char v25;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542375B8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232E6D19C();
  sub_232E6F7C8();
  LOBYTE(v21) = 0;
  sub_232E6F684();
  if (!v2)
  {
    v9 = *(_QWORD *)(v3 + 24);
    *(_QWORD *)&v21 = *(_QWORD *)(v3 + 16);
    *((_QWORD *)&v21 + 1) = v9;
    v25 = 1;
    sub_232E20C78();
    sub_232E6F6A8();
    v21 = *(_OWORD *)(v3 + 32);
    v25 = 2;
    sub_232E069B0();
    sub_232E6F6A8();
    v10 = *(_QWORD *)(v3 + 80);
    v11 = *(_BYTE *)(v3 + 88);
    v12 = *(_OWORD *)(v3 + 64);
    v21 = *(_OWORD *)(v3 + 48);
    v22 = v12;
    v23 = v10;
    v24 = v11;
    v25 = 3;
    sub_232E02474();
    sub_232E6F6A8();
    *(_QWORD *)&v21 = *(_QWORD *)(v3 + 96);
    v25 = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254238208);
    sub_232E6D224(&qword_2542375B0, (uint64_t (*)(void))sub_232E6D1E0, MEMORY[0x24BEE12A0]);
    sub_232E6F6A8();
    v13 = *(_BYTE *)(v3 + 112);
    v14 = *(_BYTE *)(v3 + 113);
    v15 = *(_BYTE *)(v3 + 114);
    v16 = *(_BYTE *)(v3 + 115);
    v17 = *(_BYTE *)(v3 + 116);
    v18 = *(_QWORD *)(v3 + 120);
    *(_QWORD *)&v21 = *(_QWORD *)(v3 + 104);
    BYTE8(v21) = v13;
    BYTE9(v21) = v14;
    BYTE10(v21) = v15;
    BYTE11(v21) = v16;
    BYTE12(v21) = v17;
    *(_QWORD *)&v22 = v18;
    v25 = 5;
    sub_232E4BEC8();
    sub_232E6F6A8();
    LOBYTE(v21) = 6;
    sub_232E6F690();
    LOBYTE(v21) = 7;
    sub_232E6F690();
    v19 = type metadata accessor for ActivityDescriptor();
    LOBYTE(v21) = 8;
    sub_232E6EE74();
    sub_232DDDAD8(&qword_254237BA0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_232E6F6A8();
    v21 = *(_OWORD *)(v3 + *(int *)(v19 + 52));
    v25 = 9;
    sub_232E02430();
    sub_232E6F6A8();
    LOBYTE(v21) = 10;
    sub_232E6F66C();
    LOBYTE(v21) = *(_BYTE *)(v3 + *(int *)(v19 + 60));
    v25 = 11;
    sub_232E4BF50();
    sub_232E6F678();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t ActivityDescriptor.hashValue.getter()
{
  sub_232E6F780();
  swift_bridgeObjectRetain();
  sub_232E6F21C();
  swift_bridgeObjectRelease();
  return sub_232E6F7B0();
}

void ActivityDescriptor.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  int *v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  char v37;
  char v38;

  v5 = sub_232E6EE74();
  v30 = *(_QWORD *)(v5 - 8);
  v31 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_254237D28);
  v8 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = (int *)type metadata accessor for ActivityDescriptor();
  MEMORY[0x24BDAC7A8](v33);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v32 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_232E6D19C();
  sub_232E6F7BC();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  }
  else
  {
    v28 = a2;
    LOBYTE(v34) = 0;
    *(_QWORD *)v12 = sub_232E6F618();
    *((_QWORD *)v12 + 1) = v14;
    v38 = 1;
    sub_232E16F30();
    sub_232E6F63C();
    v15 = *((_QWORD *)&v34 + 1);
    *((_QWORD *)v12 + 2) = v34;
    *((_QWORD *)v12 + 3) = v15;
    v38 = 2;
    sub_232E0683C();
    sub_232E6F63C();
    *((_OWORD *)v12 + 2) = v34;
    v38 = 3;
    sub_232E02A14();
    sub_232E6F63C();
    v16 = v36;
    v17 = v37;
    v18 = v35;
    *((_OWORD *)v12 + 3) = v34;
    *((_OWORD *)v12 + 4) = v18;
    *((_QWORD *)v12 + 10) = v16;
    v12[88] = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254238208);
    v38 = 4;
    sub_232E6D224(&qword_254237D88, (uint64_t (*)(void))sub_232E6D28C, MEMORY[0x24BEE12D0]);
    sub_232E6F63C();
    *((_QWORD *)v12 + 12) = v34;
    v38 = 5;
    sub_232E4BFD8();
    sub_232E6F63C();
    v19 = BYTE8(v34);
    v20 = BYTE9(v34);
    v21 = BYTE10(v34);
    v22 = BYTE11(v34);
    v23 = BYTE12(v34);
    v24 = v35;
    *((_QWORD *)v12 + 13) = v34;
    v12[112] = v19;
    v12[113] = v20;
    v12[114] = v21;
    v12[115] = v22;
    v12[116] = v23;
    *((_QWORD *)v12 + 15) = v24;
    LOBYTE(v34) = 6;
    v12[128] = sub_232E6F624() & 1;
    LOBYTE(v34) = 7;
    v12[129] = sub_232E6F624() & 1;
    LOBYTE(v34) = 8;
    sub_232DDDAD8(&qword_254238120, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    sub_232E6F63C();
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(&v12[v33[12]], v7, v31);
    v38 = 9;
    sub_232E029D0();
    sub_232E6F63C();
    *(_OWORD *)&v12[v33[13]] = v34;
    LOBYTE(v34) = 10;
    v25 = sub_232E6F5F4();
    v26 = (uint64_t *)&v12[v33[14]];
    *v26 = v25;
    v26[1] = v27;
    v38 = 11;
    sub_232E4C0C8();
    sub_232E6F60C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v29);
    v12[v33[15]] = v34;
    sub_232E6CC20((uint64_t)v12, v28);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
    sub_232E6CBE4((uint64_t)v12);
  }
}

void sub_232E6BE50(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  ActivityDescriptor.init(from:)(a1, a2);
}

uint64_t sub_232E6BE64(_QWORD *a1)
{
  return ActivityDescriptor.encode(to:)(a1);
}

uint64_t sub_232E6BE78()
{
  sub_232E6F780();
  swift_bridgeObjectRetain();
  sub_232E6F21C();
  swift_bridgeObjectRelease();
  return sub_232E6F7B0();
}

uint64_t sub_232E6BED0()
{
  swift_bridgeObjectRetain();
  sub_232E6F21C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_232E6BF14()
{
  sub_232E6F780();
  swift_bridgeObjectRetain();
  sub_232E6F21C();
  swift_bridgeObjectRelease();
  return sub_232E6F7B0();
}

uint64_t sub_232E6BF6C()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;

  sub_232E6EDD8();
  swift_allocObject();
  sub_232E6EDCC();
  sub_232DDDAD8(&qword_254237400, (uint64_t (*)(uint64_t))type metadata accessor for ActivityDescriptor, (uint64_t)&protocol conformance descriptor for ActivityDescriptor);
  v0 = sub_232E6EDC0();
  v2 = v1;
  v3 = sub_232E6EE2C();
  sub_232DE8D98(v0, v2);
  swift_release();
  return v3;
}

uint64_t sub_232E6C038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_254237A40);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E6EDB4();
  swift_allocObject();
  sub_232E6EDA8();
  v8 = sub_232E6EE44();
  v10 = v9;
  sub_232DDDAD8(&qword_254237EA0, (uint64_t (*)(uint64_t))type metadata accessor for ActivityDescriptor, (uint64_t)&protocol conformance descriptor for ActivityDescriptor);
  sub_232E6ED9C();
  sub_232DDD798(a2, qword_254237A40);
  sub_232DE8D98(v8, v10);
  swift_release();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(v7, 0, 1, a3);
  return sub_232DE939C((uint64_t)v7, a2, qword_254237A40);
}

BOOL sub_232E6C1A8(uint64_t a1, uint64_t a2)
{
  return sub_232E695FC(a1, a2, qword_254237A40, (uint64_t (*)(uint64_t))type metadata accessor for ActivityDescriptor, &qword_254237EA0, (uint64_t)&protocol conformance descriptor for ActivityDescriptor);
}

ActivityKit::XPCCodableActivityDescriptors __swiftcall XPCCodableActivityDescriptors.init(descriptors:)(ActivityKit::XPCCodableActivityDescriptors descriptors)
{
  ActivityKit::XPCCodableActivityDescriptors *v1;

  v1->descriptors._rawValue = descriptors.descriptors._rawValue;
  return descriptors;
}

uint64_t sub_232E6C1EC()
{
  return 0x7470697263736564;
}

uint64_t sub_232E6C20C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x7470697263736564 && a2 == 0xEB0000000073726FLL)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_232E6F6E4();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_232E6C2B8()
{
  sub_232E6D2D0();
  return sub_232E6F7D4();
}

uint64_t sub_232E6C2E0()
{
  sub_232E6D2D0();
  return sub_232E6F7E0();
}

uint64_t XPCCodableActivityDescriptors.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255FFEB08);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232E6D2D0();
  sub_232E6F7C8();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255FFD358);
  sub_232E6D314(&qword_255FFEB18, &qword_254237400, (uint64_t)&protocol conformance descriptor for ActivityDescriptor, MEMORY[0x24BEE12A0]);
  sub_232E6F6A8();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t XPCCodableActivityDescriptors.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255FFEB20);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232E6D2D0();
  sub_232E6F7BC();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255FFD358);
    sub_232E6D314(&qword_255FFEB28, &qword_254237EA0, (uint64_t)&protocol conformance descriptor for ActivityDescriptor, MEMORY[0x24BEE12D0]);
    sub_232E6F63C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_232E6C578@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return XPCCodableActivityDescriptors.init(from:)(a1, a2);
}

uint64_t sub_232E6C58C(_QWORD *a1)
{
  return XPCCodableActivityDescriptors.encode(to:)(a1);
}

uint64_t sub_232E6C5A0()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;

  sub_232E6EDD8();
  swift_allocObject();
  sub_232E6EDCC();
  sub_232E6D470();
  v0 = sub_232E6EDC0();
  v2 = v1;
  v3 = sub_232E6EE2C();
  sub_232DE8D98(v0, v2);
  swift_release();
  return v3;
}

BOOL sub_232E6C65C(uint64_t a1, _QWORD *a2)
{
  return sub_232E69E2C(a1, a2, (void (*)(void))sub_232DF5174);
}

uint64_t _s11ActivityKit0A10DescriptorV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  char v5;
  uint64_t result;
  BOOL v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  int v40;
  int v41;
  char v42;
  uint64_t v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  char v53;
  char v54;
  char v55;
  uint64_t v56;

  v4 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v4 || (v5 = sub_232E6F6E4(), result = 0, (v5 & 1) != 0))
  {
    v7 = *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
    if (v7 || (v8 = sub_232E6F6E4(), result = 0, (v8 & 1) != 0))
    {
      sub_232E66B88(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      if ((v9 & 1) == 0)
        return 0;
      v11 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      v13 = *(_QWORD *)(a2 + 48);
      v12 = *(_QWORD *)(a2 + 56);
      if ((*(_BYTE *)(a1 + 88) & 1) != 0)
      {
        if ((*(_BYTE *)(a2 + 88) & 1) != 0)
        {
          if (v11 != v13 || v10 != v12)
            goto LABEL_22;
          goto LABEL_21;
        }
      }
      else if ((*(_BYTE *)(a2 + 88) & 1) == 0)
      {
        if (v11 != v13 || v10 != v12)
        {
LABEL_22:
          v42 = sub_232E6F6E4();
          sub_232E01E78();
          sub_232E01E78();
          sub_232E03000();
          sub_232E03000();
          result = 0;
          if ((v42 & 1) == 0)
            return result;
          goto LABEL_23;
        }
LABEL_21:
        sub_232E01E78();
        sub_232E01E78();
        sub_232E03000();
        sub_232E03000();
LABEL_23:
        if ((sub_232E214A8(*(_QWORD *)(a1 + 96), *(_QWORD *)(a2 + 96)) & 1) == 0)
          return 0;
        v14 = *(_BYTE *)(a1 + 112);
        v15 = *(_BYTE *)(a1 + 113);
        v16 = *(_BYTE *)(a1 + 114);
        v17 = *(_BYTE *)(a1 + 115);
        v18 = *(_BYTE *)(a1 + 116);
        v19 = *(_QWORD *)(a1 + 120);
        v50 = *(_QWORD *)(a1 + 104);
        v51 = v14;
        v52 = v15;
        v53 = v16;
        v54 = v17;
        v55 = v18;
        v56 = v19;
        v20 = *(_BYTE *)(a2 + 112);
        v21 = *(_BYTE *)(a2 + 113);
        v22 = *(_BYTE *)(a2 + 114);
        v23 = *(_BYTE *)(a2 + 115);
        v24 = *(_BYTE *)(a2 + 116);
        v25 = *(_QWORD *)(a2 + 120);
        v43 = *(_QWORD *)(a2 + 104);
        v44 = v20;
        v45 = v21;
        v46 = v22;
        v47 = v23;
        v48 = v24;
        v49 = v25;
        if ((_s11ActivityKit0A19PresentationOptionsV2eeoiySbAC_ACtFZ_0((uint64_t)&v50, (uint64_t)&v43) & 1) == 0)
          return 0;
        if (*(unsigned __int8 *)(a1 + 128) != *(unsigned __int8 *)(a2 + 128))
          return 0;
        if (*(unsigned __int8 *)(a1 + 129) != *(unsigned __int8 *)(a2 + 129))
          return 0;
        v26 = (int *)type metadata accessor for ActivityDescriptor();
        if ((_s11ActivityKit0A13EndingOptionsV2eeoiySbAC_ACtFZ_0() & 1) == 0)
          return 0;
        v27 = v26[13];
        v28 = (_QWORD *)(a1 + v27);
        v29 = *(_QWORD *)(a1 + v27 + 8);
        v30 = (_QWORD *)(a2 + v27);
        v31 = v30[1];
        if (v29)
        {
          if (!v31)
            return 0;
          if (*v28 != *v30 || v29 != v31)
          {
            v32 = sub_232E6F6E4();
            result = 0;
            if ((v32 & 1) == 0)
              return result;
          }
        }
        else if (v31)
        {
          return 0;
        }
        v33 = v26[14];
        v34 = (_QWORD *)(a1 + v33);
        v35 = *(_QWORD *)(a1 + v33 + 8);
        v36 = (_QWORD *)(a2 + v33);
        v37 = v36[1];
        if (v35)
        {
          if (v37)
          {
            if (*v34 != *v36 || v35 != v37)
            {
              v38 = sub_232E6F6E4();
              result = 0;
              if ((v38 & 1) == 0)
                return result;
            }
LABEL_42:
            v39 = v26[15];
            v40 = *(unsigned __int8 *)(a1 + v39);
            v41 = *(unsigned __int8 *)(a2 + v39);
            if (v40 == 4)
            {
              if (v41 != 4)
                return 0;
            }
            else if (v41 == 4 || v40 != v41)
            {
              return 0;
            }
            return 1;
          }
        }
        else if (!v37)
        {
          goto LABEL_42;
        }
        return 0;
      }
      sub_232E01E78();
      sub_232E01E78();
      sub_232E03000();
      sub_232E03000();
      return 0;
    }
  }
  return result;
}

uint64_t sub_232E6CBE4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ActivityDescriptor();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_232E6CC20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ActivityDescriptor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_232E6CC64()
{
  unint64_t result;

  result = qword_254237E60;
  if (!qword_254237E60)
  {
    result = MEMORY[0x23492A124](&unk_232E7CBC4, &type metadata for DeviceIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237E60);
  }
  return result;
}

unint64_t sub_232E6CCA8()
{
  unint64_t result;

  result = qword_255FFEB00;
  if (!qword_255FFEB00)
  {
    result = MEMORY[0x23492A124](&unk_232E7CB74, &type metadata for DeviceIdentifier.RemoteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FFEB00);
  }
  return result;
}

unint64_t sub_232E6CCEC()
{
  unint64_t result;

  result = qword_254237E78;
  if (!qword_254237E78)
  {
    result = MEMORY[0x23492A124](&unk_232E7CB24, &type metadata for DeviceIdentifier.LocalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237E78);
  }
  return result;
}

uint64_t sub_232E6CD30(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6C61636F6CLL && a2 == 0xE500000000000000;
  if (v2 || (sub_232E6F6E4() & 1) != 0)
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
    v6 = sub_232E6F6E4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

_QWORD *sub_232E6CE10(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  _QWORD *v28;
  char v29;
  char v30;

  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_254237D58);
  v26 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_254237D50);
  v3 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254237D48);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232E6CC64();
  v11 = (uint64_t)v28;
  sub_232E6F7BC();
  if (v11)
    goto LABEL_9;
  v12 = v5;
  v13 = v27;
  v23 = v7;
  v28 = a1;
  v14 = sub_232E6F648();
  v15 = v14;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_232E6F51C();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255FFD5B0);
    *v21 = &type metadata for DeviceIdentifier;
    v10 = v9;
    sub_232E6F5E8();
    sub_232E6F510();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v6);
    a1 = v28;
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v10;
  }
  if ((*(_BYTE *)(v14 + 32) & 1) != 0)
  {
    v30 = 1;
    sub_232E6CCA8();
    sub_232E6F5DC();
    v25 = v15;
    v16 = v24;
    v17 = sub_232E6F618();
    v18 = v23;
    v10 = (_QWORD *)v17;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v16);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v9, v6);
  }
  else
  {
    v29 = 0;
    sub_232E6CCEC();
    sub_232E6F5DC();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v25);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v6);
    v10 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  return v10;
}

unint64_t sub_232E6D19C()
{
  unint64_t result;

  result = qword_254238128;
  if (!qword_254238128)
  {
    result = MEMORY[0x23492A124](&unk_232E7CAD4, &type metadata for ActivityDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254238128);
  }
  return result;
}

unint64_t sub_232E6D1E0()
{
  unint64_t result;

  result = qword_254237598;
  if (!qword_254237598)
  {
    result = MEMORY[0x23492A124](&protocol conformance descriptor for ActivityContentSource, &type metadata for ActivityContentSource);
    atomic_store(result, (unint64_t *)&qword_254237598);
  }
  return result;
}

uint64_t sub_232E6D224(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254238208);
    v8 = a2();
    result = MEMORY[0x23492A124](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_232E6D28C()
{
  unint64_t result;

  result = qword_254237D60;
  if (!qword_254237D60)
  {
    result = MEMORY[0x23492A124](&protocol conformance descriptor for ActivityContentSource, &type metadata for ActivityContentSource);
    atomic_store(result, (unint64_t *)&qword_254237D60);
  }
  return result;
}

unint64_t sub_232E6D2D0()
{
  unint64_t result;

  result = qword_255FFEB10;
  if (!qword_255FFEB10)
  {
    result = MEMORY[0x23492A124](&unk_232E7CA84, &type metadata for XPCCodableActivityDescriptors.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FFEB10);
  }
  return result;
}

uint64_t sub_232E6D314(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255FFD358);
    v10 = sub_232DDDAD8(a2, (uint64_t (*)(uint64_t))type metadata accessor for ActivityDescriptor, a3);
    result = MEMORY[0x23492A124](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_232E6D398()
{
  return sub_232DDDAD8(&qword_255FFD360, (uint64_t (*)(uint64_t))type metadata accessor for ActivityDescriptor, (uint64_t)&protocol conformance descriptor for ActivityDescriptor);
}

uint64_t sub_232E6D3C4(_QWORD *a1)
{
  uint64_t result;

  a1[1] = sub_232DDDAD8(&qword_254237EA0, (uint64_t (*)(uint64_t))type metadata accessor for ActivityDescriptor, (uint64_t)&protocol conformance descriptor for ActivityDescriptor);
  a1[2] = sub_232DDDAD8(&qword_254237400, (uint64_t (*)(uint64_t))type metadata accessor for ActivityDescriptor, (uint64_t)&protocol conformance descriptor for ActivityDescriptor);
  result = sub_232DDDAD8(&qword_2542372C8, (uint64_t (*)(uint64_t))type metadata accessor for ActivityDescriptor, (uint64_t)&protocol conformance descriptor for ActivityDescriptor);
  a1[3] = result;
  return result;
}

unint64_t sub_232E6D43C(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_232DF5174();
  a1[2] = sub_232E6D470();
  result = sub_232E6D4B4();
  a1[3] = result;
  return result;
}

unint64_t sub_232E6D470()
{
  unint64_t result;

  result = qword_255FFEB30;
  if (!qword_255FFEB30)
  {
    result = MEMORY[0x23492A124](&protocol conformance descriptor for XPCCodableActivityDescriptors, &type metadata for XPCCodableActivityDescriptors);
    atomic_store(result, (unint64_t *)&qword_255FFEB30);
  }
  return result;
}

unint64_t sub_232E6D4B4()
{
  unint64_t result;

  result = qword_255FFEB38;
  if (!qword_255FFEB38)
  {
    result = MEMORY[0x23492A124](&protocol conformance descriptor for XPCCodableActivityDescriptors, &type metadata for XPCCodableActivityDescriptors);
    atomic_store(result, (unint64_t *)&qword_255FFEB38);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceIdentifier()
{
  return &type metadata for DeviceIdentifier;
}

uint64_t initializeBufferWithCopyOfBuffer for ActivityDescriptor(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  id v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v33 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v33 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    v8 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v8;
    v9 = a2[4];
    v10 = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_232DE4A2C(v9, v10);
    *(_QWORD *)(a1 + 32) = v9;
    *(_QWORD *)(a1 + 40) = v10;
    v11 = a2[6];
    v12 = a2[7];
    v13 = a2[8];
    v14 = a2[9];
    v15 = a2[10];
    v16 = *((_BYTE *)a2 + 88);
    sub_232E01E78();
    *(_QWORD *)(a1 + 48) = v11;
    *(_QWORD *)(a1 + 56) = v12;
    *(_QWORD *)(a1 + 64) = v13;
    *(_QWORD *)(a1 + 72) = v14;
    *(_QWORD *)(a1 + 80) = v15;
    *(_BYTE *)(a1 + 88) = v16;
    v17 = a2[13];
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_QWORD *)(a1 + 104) = v17;
    *(_DWORD *)(a1 + 112) = *((_DWORD *)a2 + 28);
    *(_BYTE *)(a1 + 116) = *((_BYTE *)a2 + 116);
    v18 = (void *)a2[15];
    *(_QWORD *)(a1 + 120) = v18;
    *(_BYTE *)(a1 + 128) = *((_BYTE *)a2 + 128);
    v19 = a3[12];
    v20 = a1 + v19;
    v21 = (uint64_t)a2 + v19;
    *(_BYTE *)(a1 + 129) = *((_BYTE *)a2 + 129);
    v22 = sub_232E6EE74();
    v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v24 = v18;
    v23(v20, v21, v22);
    v25 = a3[13];
    v26 = a3[14];
    v27 = (_QWORD *)(a1 + v25);
    v28 = (uint64_t *)((char *)a2 + v25);
    v29 = v28[1];
    *v27 = *v28;
    v27[1] = v29;
    v30 = (_QWORD *)(a1 + v26);
    v31 = (uint64_t *)((char *)a2 + v26);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    *(_BYTE *)(a1 + a3[15]) = *((_BYTE *)a2 + a3[15]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ActivityDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_232DE8D98(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  sub_232E03000();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v4 = a1 + *(int *)(a2 + 48);
  v5 = sub_232E6EE74();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ActivityDescriptor(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  id v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_232DE4A2C(v8, v9);
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  v10 = *(_QWORD *)(a2 + 48);
  v11 = *(_QWORD *)(a2 + 56);
  v12 = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_QWORD *)(a2 + 80);
  v15 = *(_BYTE *)(a2 + 88);
  sub_232E01E78();
  *(_QWORD *)(a1 + 48) = v10;
  *(_QWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 64) = v12;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v14;
  *(_BYTE *)(a1 + 88) = v15;
  v16 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v16;
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 116) = *(_BYTE *)(a2 + 116);
  v17 = *(void **)(a2 + 120);
  *(_QWORD *)(a1 + 120) = v17;
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  v18 = a3[12];
  v19 = a1 + v18;
  v20 = a2 + v18;
  *(_BYTE *)(a1 + 129) = *(_BYTE *)(a2 + 129);
  v21 = sub_232E6EE74();
  v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v23 = v17;
  v22(v19, v20, v21);
  v24 = a3[13];
  v25 = a3[14];
  v26 = (_QWORD *)(a1 + v24);
  v27 = (_QWORD *)(a2 + v24);
  v28 = v27[1];
  *v26 = *v27;
  v26[1] = v28;
  v29 = (_QWORD *)(a1 + v25);
  v30 = (_QWORD *)(a2 + v25);
  v31 = v30[1];
  *v29 = *v30;
  v29[1] = v31;
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ActivityDescriptor(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a2 + 40);
  sub_232DE4A2C(v6, v7);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  sub_232DE8D98(v8, v9);
  v10 = *(_QWORD *)(a2 + 48);
  v11 = *(_QWORD *)(a2 + 56);
  v12 = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_QWORD *)(a2 + 80);
  v15 = *(_BYTE *)(a2 + 88);
  sub_232E01E78();
  *(_QWORD *)(a1 + 48) = v10;
  *(_QWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 64) = v12;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v14;
  *(_BYTE *)(a1 + 88) = v15;
  sub_232E03000();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_BYTE *)(a1 + 113) = *(_BYTE *)(a2 + 113);
  *(_BYTE *)(a1 + 114) = *(_BYTE *)(a2 + 114);
  *(_BYTE *)(a1 + 115) = *(_BYTE *)(a2 + 115);
  *(_BYTE *)(a1 + 116) = *(_BYTE *)(a2 + 116);
  v16 = *(void **)(a1 + 120);
  v17 = *(void **)(a2 + 120);
  *(_QWORD *)(a1 + 120) = v17;
  v18 = v17;

  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_BYTE *)(a1 + 129) = *(_BYTE *)(a2 + 129);
  v19 = a3[12];
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = sub_232E6EE74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 24))(v20, v21, v22);
  v23 = a3[13];
  v24 = (_QWORD *)(a1 + v23);
  v25 = (_QWORD *)(a2 + v23);
  *v24 = *v25;
  v24[1] = v25[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v26 = a3[14];
  v27 = (_QWORD *)(a1 + v26);
  v28 = (_QWORD *)(a2 + v26);
  *v27 = *v28;
  v27[1] = v28[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  return a1;
}

uint64_t initializeWithTake for ActivityDescriptor(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v8 = *(_OWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_WORD *)(a1 + 128) = *(_WORD *)(a2 + 128);
  v9 = a3[12];
  v10 = a1 + v9;
  v11 = a2 + v9;
  *(_OWORD *)(a1 + 104) = v8;
  v12 = sub_232E6EE74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  v13 = a3[14];
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  return a1;
}

uint64_t assignWithTake for ActivityDescriptor(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  sub_232DE8D98(v8, v9);
  v10 = *(_QWORD *)(a2 + 80);
  v11 = *(_BYTE *)(a2 + 88);
  v12 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v12;
  *(_QWORD *)(a1 + 80) = v10;
  *(_BYTE *)(a1 + 88) = v11;
  sub_232E03000();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_BYTE *)(a1 + 113) = *(_BYTE *)(a2 + 113);
  *(_BYTE *)(a1 + 114) = *(_BYTE *)(a2 + 114);
  *(_BYTE *)(a1 + 115) = *(_BYTE *)(a2 + 115);
  *(_BYTE *)(a1 + 116) = *(_BYTE *)(a2 + 116);
  v13 = *(void **)(a1 + 120);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);

  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_BYTE *)(a1 + 129) = *(_BYTE *)(a2 + 129);
  v14 = a3[12];
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = sub_232E6EE74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 40))(v15, v16, v17);
  v18 = a3[13];
  v19 = (_QWORD *)(a1 + v18);
  v20 = (uint64_t *)(a2 + v18);
  v22 = *v20;
  v21 = v20[1];
  *v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  v23 = a3[14];
  v24 = (_QWORD *)(a1 + v23);
  v25 = (uint64_t *)(a2 + v23);
  v27 = *v25;
  v26 = v25[1];
  *v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  return a1;
}

uint64_t sub_232E6DCD8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_232E6EE74();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 48), a2, v8);
  }
}

uint64_t sub_232E6DD54(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_232E6EE74();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 48), a2, a2, v7);
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCCodableActivityDescriptors()
{
  return &type metadata for XPCCodableActivityDescriptors;
}

ValueMetadata *type metadata accessor for XPCCodableActivityDescriptors.CodingKeys()
{
  return &type metadata for XPCCodableActivityDescriptors.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for ActivityDescriptor.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232E6DE38 + 4 * byte_232E7C361[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_232E6DE6C + 4 * byte_232E7C35C[v4]))();
}

uint64_t sub_232E6DE6C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232E6DE74(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232E6DE7CLL);
  return result;
}

uint64_t sub_232E6DE88(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232E6DE90);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_232E6DE94(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232E6DE9C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ActivityDescriptor.CodingKeys()
{
  return &type metadata for ActivityDescriptor.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for DeviceIdentifier.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232E6DF04 + 4 * byte_232E7C36B[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_232E6DF38 + 4 * byte_232E7C366[v4]))();
}

uint64_t sub_232E6DF38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232E6DF40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232E6DF48);
  return result;
}

uint64_t sub_232E6DF54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232E6DF5CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_232E6DF60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232E6DF68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DeviceIdentifier.CodingKeys()
{
  return &type metadata for DeviceIdentifier.CodingKeys;
}

ValueMetadata *type metadata accessor for DeviceIdentifier.LocalCodingKeys()
{
  return &type metadata for DeviceIdentifier.LocalCodingKeys;
}

uint64_t _s11ActivityKit29XPCCodableActivityDescriptorsV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_232E6DFD4 + 4 * byte_232E7C370[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_232E6DFF4 + 4 * byte_232E7C375[v4]))();
}

_BYTE *sub_232E6DFD4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_232E6DFF4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_232E6DFFC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_232E6E004(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_232E6E00C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_232E6E014(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DeviceIdentifier.RemoteCodingKeys()
{
  return &type metadata for DeviceIdentifier.RemoteCodingKeys;
}

unint64_t sub_232E6E034()
{
  unint64_t result;

  result = qword_255FFEB40;
  if (!qword_255FFEB40)
  {
    result = MEMORY[0x23492A124](&unk_232E7C7E4, &type metadata for DeviceIdentifier.RemoteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FFEB40);
  }
  return result;
}

unint64_t sub_232E6E07C()
{
  unint64_t result;

  result = qword_255FFEB48;
  if (!qword_255FFEB48)
  {
    result = MEMORY[0x23492A124](&unk_232E7C8EC, &type metadata for DeviceIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FFEB48);
  }
  return result;
}

unint64_t sub_232E6E0C4()
{
  unint64_t result;

  result = qword_255FFEB50;
  if (!qword_255FFEB50)
  {
    result = MEMORY[0x23492A124](&unk_232E7C9A4, &type metadata for ActivityDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FFEB50);
  }
  return result;
}

unint64_t sub_232E6E10C()
{
  unint64_t result;

  result = qword_255FFEB58;
  if (!qword_255FFEB58)
  {
    result = MEMORY[0x23492A124](&unk_232E7CA5C, &type metadata for XPCCodableActivityDescriptors.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FFEB58);
  }
  return result;
}

unint64_t sub_232E6E154()
{
  unint64_t result;

  result = qword_255FFEB60;
  if (!qword_255FFEB60)
  {
    result = MEMORY[0x23492A124](&unk_232E7C9CC, &type metadata for XPCCodableActivityDescriptors.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FFEB60);
  }
  return result;
}

unint64_t sub_232E6E19C()
{
  unint64_t result;

  result = qword_255FFEB68;
  if (!qword_255FFEB68)
  {
    result = MEMORY[0x23492A124](&unk_232E7C9F4, &type metadata for XPCCodableActivityDescriptors.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FFEB68);
  }
  return result;
}

unint64_t sub_232E6E1E4()
{
  unint64_t result;

  result = qword_254238138;
  if (!qword_254238138)
  {
    result = MEMORY[0x23492A124](&unk_232E7C914, &type metadata for ActivityDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254238138);
  }
  return result;
}

unint64_t sub_232E6E22C()
{
  unint64_t result;

  result = qword_254238130;
  if (!qword_254238130)
  {
    result = MEMORY[0x23492A124](&unk_232E7C93C, &type metadata for ActivityDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254238130);
  }
  return result;
}

unint64_t sub_232E6E274()
{
  unint64_t result;

  result = qword_254237E88;
  if (!qword_254237E88)
  {
    result = MEMORY[0x23492A124](&unk_232E7C80C, &type metadata for DeviceIdentifier.LocalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237E88);
  }
  return result;
}

unint64_t sub_232E6E2BC()
{
  unint64_t result;

  result = qword_254237E80;
  if (!qword_254237E80)
  {
    result = MEMORY[0x23492A124](&unk_232E7C834, &type metadata for DeviceIdentifier.LocalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237E80);
  }
  return result;
}

unint64_t sub_232E6E304()
{
  unint64_t result;

  result = qword_254237E98;
  if (!qword_254237E98)
  {
    result = MEMORY[0x23492A124](&unk_232E7C754, &type metadata for DeviceIdentifier.RemoteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237E98);
  }
  return result;
}

unint64_t sub_232E6E34C()
{
  unint64_t result;

  result = qword_254237E90;
  if (!qword_254237E90)
  {
    result = MEMORY[0x23492A124](&unk_232E7C77C, &type metadata for DeviceIdentifier.RemoteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237E90);
  }
  return result;
}

unint64_t sub_232E6E394()
{
  unint64_t result;

  result = qword_254237E70;
  if (!qword_254237E70)
  {
    result = MEMORY[0x23492A124](&unk_232E7C85C, &type metadata for DeviceIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237E70);
  }
  return result;
}

unint64_t sub_232E6E3DC()
{
  unint64_t result;

  result = qword_254237E68;
  if (!qword_254237E68)
  {
    result = MEMORY[0x23492A124](&unk_232E7C884, &type metadata for DeviceIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254237E68);
  }
  return result;
}

uint64_t sub_232E6E420(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_232E6F6E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7475626972747461 && a2 == 0xEE00657079547365 || (sub_232E6F6E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7475626972747461 && a2 == 0xEE00617461447365 || (sub_232E6F6E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x5472657474616C70 && a2 == 0xED00007465677261 || (sub_232E6F6E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x53746E65746E6F63 && a2 == 0xEE0073656372756FLL || (sub_232E6F6E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000232E7F630 || (sub_232E6F6E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x656D656870457369 && a2 == 0xEB000000006C6172 || (sub_232E6F6E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x746E656D6F4D7369 && a2 == 0xEB00000000797261 || (sub_232E6F6E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x4464657461657263 && a2 == 0xEB00000000657461 || (sub_232E6F6E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000232E7DC50 || (sub_232E6F6E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000232E7FC30 || (sub_232E6F6E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x69746365746F7270 && a2 == 0xEF7373616C436E6FLL)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    v6 = sub_232E6F6E4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 11;
    else
      return 12;
  }
}

uint64_t static OpaqueObjectiveCBridgable<>._forceBridgeFromObjectiveC(_:result:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;

  v5 = sub_232E6F474();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - v7;
  sub_232E6EDB4();
  swift_allocObject();
  sub_232E6EDA8();
  v9 = sub_232E6EE44();
  v11 = v10;
  sub_232E6ED9C();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v5);
  sub_232DE8D98(v9, v11);
  swift_release();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(v8, 0, 1, a3);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v8, v5);
}

BOOL static OpaqueObjectiveCBridgable<>._conditionallyBridgeFromObjectiveC(_:result:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  _QWORD v19[2];

  v5 = sub_232E6F474();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v19 - v11;
  v19[0] = *(_QWORD *)(v6 + 8);
  ((void (*)(uint64_t, uint64_t, double))v19[0])(a2, v5, v10);
  sub_232E6EDB4();
  swift_allocObject();
  sub_232E6EDA8();
  v13 = sub_232E6EE44();
  v15 = v14;
  sub_232E6ED9C();
  swift_release();
  sub_232DE8D98(v13, v15);
  v16 = *(_QWORD *)(a3 - 8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v12, 0, 1, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v12, v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v5);
  v17 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v8, 1, a3) != 1;
  ((void (*)(char *, uint64_t))v19[0])(v8, v5);
  return v17;
}

uint64_t sub_232E6ECAC()
{
  return MEMORY[0x24BDCB150]();
}

uint64_t sub_232E6ECB8()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_232E6ECC4()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_232E6ECD0()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_232E6ECDC()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_232E6ECE8()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_232E6ECF4()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_232E6ED00()
{
  return MEMORY[0x24BDCB488]();
}

uint64_t sub_232E6ED0C()
{
  return MEMORY[0x24BDCB4C8]();
}

uint64_t sub_232E6ED18()
{
  return MEMORY[0x24BDCB580]();
}

uint64_t sub_232E6ED24()
{
  return MEMORY[0x24BDCB9D8]();
}

uint64_t sub_232E6ED30()
{
  return MEMORY[0x24BDCB9E0]();
}

uint64_t sub_232E6ED3C()
{
  return MEMORY[0x24BDCB9E8]();
}

uint64_t sub_232E6ED48()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_232E6ED54()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_232E6ED60()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_232E6ED6C()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_232E6ED78()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_232E6ED84()
{
  return MEMORY[0x24BDCBE78]();
}

uint64_t sub_232E6ED90()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_232E6ED9C()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_232E6EDA8()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_232E6EDB4()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_232E6EDC0()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_232E6EDCC()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_232E6EDD8()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_232E6EDE4()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_232E6EDF0()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_232E6EDFC()
{
  return MEMORY[0x24BDCD350]();
}

uint64_t sub_232E6EE08()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_232E6EE14()
{
  return MEMORY[0x24BDCD548]();
}

uint64_t sub_232E6EE20()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_232E6EE2C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_232E6EE38()
{
  return MEMORY[0x24BDCDCD8]();
}

uint64_t sub_232E6EE44()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_232E6EE50()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t _s11ActivityKit0A13EndingOptionsV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_232E6EE68()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_232E6EE74()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_232E6EE80()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_232E6EE8C()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_232E6EE98()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_232E6EEA4()
{
  return MEMORY[0x24BEE5B98]();
}

uint64_t sub_232E6EEB0()
{
  return MEMORY[0x24BE85498]();
}

uint64_t sub_232E6EEBC()
{
  return MEMORY[0x24BE854A0]();
}

uint64_t sub_232E6EEC8()
{
  return MEMORY[0x24BE854A8]();
}

uint64_t sub_232E6EED4()
{
  return MEMORY[0x24BE854B0]();
}

uint64_t sub_232E6EEE0()
{
  return MEMORY[0x24BE854B8]();
}

uint64_t sub_232E6EEEC()
{
  return MEMORY[0x24BE854D0]();
}

uint64_t sub_232E6EEF8()
{
  return MEMORY[0x24BE854D8]();
}

uint64_t sub_232E6EF04()
{
  return MEMORY[0x24BE85500]();
}

uint64_t sub_232E6EF10()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_232E6EF1C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_232E6EF28()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_232E6EF34()
{
  return MEMORY[0x24BDB9A50]();
}

uint64_t sub_232E6EF40()
{
  return MEMORY[0x24BDB9AC0]();
}

uint64_t sub_232E6EF4C()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_232E6EF58()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_232E6EF64()
{
  return MEMORY[0x24BDB9B60]();
}

uint64_t sub_232E6EF70()
{
  return MEMORY[0x24BDB9B88]();
}

uint64_t sub_232E6EF7C()
{
  return MEMORY[0x24BDB9B98]();
}

uint64_t sub_232E6EF88()
{
  return MEMORY[0x24BDB9BA0]();
}

uint64_t sub_232E6EF94()
{
  return MEMORY[0x24BDB9C78]();
}

uint64_t sub_232E6EFA0()
{
  return MEMORY[0x24BDB9C88]();
}

uint64_t sub_232E6EFAC()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t sub_232E6EFB8()
{
  return MEMORY[0x24BDB9C98]();
}

uint64_t sub_232E6EFC4()
{
  return MEMORY[0x24BDB9CB8]();
}

uint64_t sub_232E6EFD0()
{
  return MEMORY[0x24BDB9CC0]();
}

uint64_t sub_232E6EFDC()
{
  return MEMORY[0x24BDB9CD0]();
}

uint64_t sub_232E6EFE8()
{
  return MEMORY[0x24BDB9CE0]();
}

uint64_t sub_232E6EFF4()
{
  return MEMORY[0x24BDB9CF8]();
}

uint64_t sub_232E6F000()
{
  return MEMORY[0x24BDB9D00]();
}

uint64_t sub_232E6F00C()
{
  return MEMORY[0x24BDB9DC0]();
}

uint64_t sub_232E6F018()
{
  return MEMORY[0x24BDB9DF0]();
}

uint64_t sub_232E6F024()
{
  return MEMORY[0x24BDB9E68]();
}

uint64_t sub_232E6F030()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_232E6F03C()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t sub_232E6F048()
{
  return MEMORY[0x24BDB9F38]();
}

uint64_t sub_232E6F054()
{
  return MEMORY[0x24BDB9FB0]();
}

uint64_t sub_232E6F060()
{
  return MEMORY[0x24BDB9FB8]();
}

uint64_t sub_232E6F06C()
{
  return MEMORY[0x24BDB9FD8]();
}

uint64_t sub_232E6F078()
{
  return MEMORY[0x24BDBA030]();
}

uint64_t sub_232E6F084()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_232E6F090()
{
  return MEMORY[0x24BDBA0E8]();
}

uint64_t sub_232E6F09C()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_232E6F0A8()
{
  return MEMORY[0x24BDBA128]();
}

uint64_t sub_232E6F0B4()
{
  return MEMORY[0x24BDBA130]();
}

uint64_t sub_232E6F0C0()
{
  return MEMORY[0x24BDBA138]();
}

uint64_t sub_232E6F0CC()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_232E6F0D8()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_232E6F0E4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_232E6F0F0()
{
  return MEMORY[0x24BEE54D8]();
}

uint64_t sub_232E6F0FC()
{
  return MEMORY[0x24BEE54E0]();
}

uint64_t sub_232E6F108()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_232E6F114()
{
  return MEMORY[0x24BEE55A8]();
}

uint64_t sub_232E6F120()
{
  return MEMORY[0x24BEE55B0]();
}

uint64_t sub_232E6F12C()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_232E6F138()
{
  return MEMORY[0x24BEE5630]();
}

uint64_t sub_232E6F144()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_232E6F150()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_232E6F15C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_232E6F168()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_232E6F174()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_232E6F180()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_232E6F18C()
{
  return MEMORY[0x24BEE02C0]();
}

uint64_t sub_232E6F198()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_232E6F1A4()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_232E6F1B0()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_232E6F1BC()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_232E6F1C8()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_232E6F1D4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_232E6F1E0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_232E6F1EC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_232E6F1F8()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_232E6F204()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_232E6F210()
{
  return MEMORY[0x24BEE0A78]();
}

uint64_t sub_232E6F21C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_232E6F228()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_232E6F234()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_232E6F240()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_232E6F24C()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_232E6F258()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_232E6F264()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_232E6F270()
{
  return MEMORY[0x24BEE1040]();
}

uint64_t sub_232E6F27C()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_232E6F288()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_232E6F294()
{
  return MEMORY[0x24BEE10C0]();
}

uint64_t sub_232E6F2A0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_232E6F2AC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_232E6F2B8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_232E6F2C4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_232E6F2D0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_232E6F2DC()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_232E6F2E8()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_232E6F2F4()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_232E6F300()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_232E6F30C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_232E6F318()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_232E6F324()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_232E6F330()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_232E6F33C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_232E6F348()
{
  return MEMORY[0x24BEE6908]();
}

uint64_t sub_232E6F354()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_232E6F360()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_232E6F36C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_232E6F378()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_232E6F384()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_232E6F390()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_232E6F39C()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_232E6F3A8()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_232E6F3B4()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_232E6F3C0()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_232E6F3CC()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_232E6F3D8()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_232E6F3E4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_232E6F3F0()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_232E6F3FC()
{
  return MEMORY[0x24BEE57C0]();
}

uint64_t sub_232E6F408()
{
  return MEMORY[0x24BEE5828]();
}

uint64_t sub_232E6F414()
{
  return MEMORY[0x24BEE58B8]();
}

uint64_t sub_232E6F420()
{
  return MEMORY[0x24BEE58D0]();
}

uint64_t sub_232E6F42C()
{
  return MEMORY[0x24BEE58D8]();
}

uint64_t sub_232E6F438()
{
  return MEMORY[0x24BE85510]();
}

uint64_t sub_232E6F444()
{
  return MEMORY[0x24BEE5950]();
}

uint64_t sub_232E6F450()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_232E6F45C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_232E6F468()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_232E6F474()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_232E6F480()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_232E6F48C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_232E6F498()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_232E6F4A4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_232E6F4B0()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_232E6F4BC()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_232E6F4C8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_232E6F4D4()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_232E6F4E0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_232E6F4EC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_232E6F4F8()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_232E6F504()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_232E6F510()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_232E6F51C()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_232E6F528()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_232E6F534()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_232E6F540()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_232E6F54C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_232E6F558()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_232E6F564()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_232E6F570()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_232E6F57C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_232E6F588()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_232E6F594()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_232E6F5A0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_232E6F5AC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_232E6F5B8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_232E6F5C4()
{
  return MEMORY[0x24BEE3270]();
}

uint64_t sub_232E6F5D0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_232E6F5DC()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_232E6F5E8()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_232E6F5F4()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_232E6F600()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_232E6F60C()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_232E6F618()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_232E6F624()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_232E6F630()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_232E6F63C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_232E6F648()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_232E6F654()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_232E6F660()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_232E6F66C()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_232E6F678()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_232E6F684()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_232E6F690()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_232E6F69C()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_232E6F6A8()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_232E6F6B4()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_232E6F6C0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_232E6F6CC()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_232E6F6D8()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_232E6F6E4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_232E6F6F0()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_232E6F6FC()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_232E6F708()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_232E6F714()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_232E6F720()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_232E6F72C()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_232E6F738()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_232E6F744()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_232E6F750()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_232E6F75C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_232E6F768()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_232E6F774()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_232E6F780()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_232E6F78C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_232E6F798()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_232E6F7A4()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_232E6F7B0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_232E6F7BC()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_232E6F7C8()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_232E6F7D4()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_232E6F7E0()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_232E6F7EC()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x24BED8580]();
}

uint64_t MobileGestalt_get_deviceClassNumber()
{
  return MEMORY[0x24BED8588]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x24BDAF198](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
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

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x24BEE4E38]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
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

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

