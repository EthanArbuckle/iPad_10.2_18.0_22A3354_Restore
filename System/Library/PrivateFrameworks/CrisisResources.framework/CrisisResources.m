uint64_t CrisisResource.resourceType.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t CrisisResource.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CrisisResource.phoneNumber.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CrisisResource.smsNumber.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CrisisResource.website.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for CrisisResource() + 32);
  return sub_23A1B5054(v3, a1);
}

uint64_t type metadata accessor for CrisisResource()
{
  uint64_t result;

  result = qword_25694EDC8;
  if (!qword_25694EDC8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A1B5054(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694ED30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B8434B8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t CrisisResource.websearchQuery.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for CrisisResource() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CrisisResource.languageCode.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for CrisisResource() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CrisisResource.countryCode.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for CrisisResource() + 44));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CrisisResource.city.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for CrisisResource() + 48));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23A1B51CC(char a1)
{
  return *(_QWORD *)&aResourcename[8 * a1];
}

BOOL sub_23A1B51EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23A1B5200()
{
  sub_23A1B9A50();
  sub_23A1B9A5C();
  return sub_23A1B9A68();
}

uint64_t sub_23A1B5244()
{
  return sub_23A1B9A5C();
}

uint64_t sub_23A1B526C()
{
  sub_23A1B9A50();
  sub_23A1B9A5C();
  return sub_23A1B9A68();
}

uint64_t sub_23A1B52AC()
{
  char *v0;

  return sub_23A1B51CC(*v0);
}

uint64_t sub_23A1B52B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A1B6AC0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A1B52D8()
{
  return 0;
}

void sub_23A1B52E4(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_23A1B52F0()
{
  sub_23A1B5604();
  return sub_23A1B9A8C();
}

uint64_t sub_23A1B5318()
{
  sub_23A1B5604();
  return sub_23A1B9A98();
}

uint64_t CrisisResource.encode(to:)(_QWORD *a1)
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
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694ED38);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A1B5604();
  sub_23A1B9A80();
  v10[15] = *v3;
  v10[14] = 0;
  sub_23A1B5648();
  sub_23A1B99FC();
  if (!v2)
  {
    v10[13] = 1;
    sub_23A1B99D8();
    v10[12] = 2;
    sub_23A1B99D8();
    v10[11] = 3;
    sub_23A1B99D8();
    type metadata accessor for CrisisResource();
    v10[10] = 4;
    sub_23A1B9828();
    sub_23A1B5C64(&qword_25694ED50, MEMORY[0x24BDCDAE0]);
    sub_23A1B99E4();
    v10[9] = 5;
    sub_23A1B99D8();
    v10[8] = 6;
    sub_23A1B99F0();
    v10[7] = 7;
    sub_23A1B99F0();
    v10[6] = 8;
    sub_23A1B99D8();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23A1B5604()
{
  unint64_t result;

  result = qword_25694ED40;
  if (!qword_25694ED40)
  {
    result = MEMORY[0x23B8434D0](&unk_23A1B9E8C, &type metadata for CrisisResource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25694ED40);
  }
  return result;
}

unint64_t sub_23A1B5648()
{
  unint64_t result;

  result = qword_25694ED48;
  if (!qword_25694ED48)
  {
    result = MEMORY[0x23B8434D0](&protocol conformance descriptor for CrisisResourceType, &type metadata for CrisisResourceType);
    atomic_store(result, (unint64_t *)&qword_25694ED48);
  }
  return result;
}

uint64_t CrisisResource.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  int *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  _QWORD *v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;
  char v50;
  char v51;

  v38 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694ED30);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694ED58);
  v6 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for CrisisResource();
  MEMORY[0x24BDAC7A8]();
  v40 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A1B5604();
  v11 = v8;
  sub_23A1B9A74();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  v12 = (uint64_t)v5;
  v50 = 0;
  sub_23A1B5C20();
  v13 = v11;
  sub_23A1B99CC();
  v14 = (int *)v9;
  v15 = v40;
  *v40 = v51;
  v49 = 1;
  v16 = sub_23A1B99A8();
  v17 = v6;
  v18 = (uint64_t)v41;
  v15[1] = v16;
  v15[2] = v19;
  v48 = 2;
  v15[3] = sub_23A1B99A8();
  v15[4] = v20;
  v47 = 3;
  v15[5] = sub_23A1B99A8();
  v15[6] = v21;
  sub_23A1B9828();
  v46 = 4;
  sub_23A1B5C64(&qword_25694ED68, MEMORY[0x24BDCDB10]);
  sub_23A1B99B4();
  sub_23A1B5CA4(v12, (uint64_t)v15 + v14[8]);
  v45 = 5;
  v22 = sub_23A1B99A8();
  v23 = (_QWORD *)((char *)v15 + v14[9]);
  *v23 = v22;
  v23[1] = v24;
  v44 = 6;
  v25 = sub_23A1B99C0();
  v26 = (_QWORD *)((char *)v15 + v14[10]);
  *v26 = v25;
  v26[1] = v27;
  v43 = 7;
  v28 = sub_23A1B99C0();
  v29 = (_QWORD *)((char *)v15 + v14[11]);
  *v29 = v28;
  v29[1] = v30;
  v42 = 8;
  v31 = (uint64_t)v15;
  v32 = sub_23A1B99A8();
  v34 = v33;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v13, v39);
  v35 = (uint64_t *)(v31 + v14[12]);
  *v35 = v32;
  v35[1] = v34;
  sub_23A1B5CEC(v31, v38);
  __swift_destroy_boxed_opaque_existential_1(v18);
  return sub_23A1B5D30(v31);
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

uint64_t sub_23A1B5BE0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694ED30);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A1B5C20()
{
  unint64_t result;

  result = qword_25694ED60;
  if (!qword_25694ED60)
  {
    result = MEMORY[0x23B8434D0](&protocol conformance descriptor for CrisisResourceType, &type metadata for CrisisResourceType);
    atomic_store(result, (unint64_t *)&qword_25694ED60);
  }
  return result;
}

uint64_t sub_23A1B5C64(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23A1B9828();
    result = MEMORY[0x23B8434D0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A1B5CA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694ED30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A1B5CEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CrisisResource();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A1B5D30(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CrisisResource();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A1B5D6C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CrisisResource.init(from:)(a1, a2);
}

uint64_t sub_23A1B5D80(_QWORD *a1)
{
  return CrisisResource.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for CrisisResource(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  char *__dst;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    v8 = a2[4];
    a1[3] = a2[3];
    a1[4] = v8;
    v9 = a2[6];
    v10 = a3[8];
    __dst = (char *)a1 + v10;
    v11 = (char *)a2 + v10;
    a1[5] = a2[5];
    a1[6] = v9;
    v12 = sub_23A1B9828();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v14(v11, 1, v12))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694ED30);
      memcpy(__dst, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    v17 = a3[9];
    v18 = a3[10];
    v19 = (uint64_t *)((char *)v4 + v17);
    v20 = (uint64_t *)((char *)a2 + v17);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    v22 = (uint64_t *)((char *)v4 + v18);
    v23 = (uint64_t *)((char *)a2 + v18);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    v25 = a3[11];
    v26 = a3[12];
    v27 = (uint64_t *)((char *)v4 + v25);
    v28 = (uint64_t *)((char *)a2 + v25);
    v29 = v28[1];
    *v27 = *v28;
    v27[1] = v29;
    v30 = (uint64_t *)((char *)v4 + v26);
    v31 = (uint64_t *)((char *)a2 + v26);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for CrisisResource(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = sub_23A1B9828();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CrisisResource(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  void *__dst;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  v8 = *(_QWORD *)(a2 + 48);
  v9 = a3[8];
  __dst = (void *)(a1 + v9);
  v10 = (const void *)(a2 + v9);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v8;
  v11 = sub_23A1B9828();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v13(v10, 1, v11))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694ED30);
    memcpy(__dst, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(__dst, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
  }
  v15 = a3[9];
  v16 = a3[10];
  v17 = (_QWORD *)(a1 + v15);
  v18 = (_QWORD *)(a2 + v15);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  v20 = (_QWORD *)(a1 + v16);
  v21 = (_QWORD *)(a2 + v16);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  v23 = a3[11];
  v24 = a3[12];
  v25 = (_QWORD *)(a1 + v23);
  v26 = (_QWORD *)(a2 + v23);
  v27 = v26[1];
  *v25 = *v26;
  v25[1] = v27;
  v28 = (_QWORD *)(a1 + v24);
  v29 = (_QWORD *)(a2 + v24);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CrisisResource(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[8];
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = sub_23A1B9828();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694ED30);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  v15 = a3[9];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = a3[10];
  v19 = (_QWORD *)(a1 + v18);
  v20 = (_QWORD *)(a2 + v18);
  *v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21 = a3[11];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (_QWORD *)(a2 + v21);
  *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v24 = a3[12];
  v25 = (_QWORD *)(a1 + v24);
  v26 = (_QWORD *)(a2 + v24);
  *v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for CrisisResource(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v6 = a3[8];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_23A1B9828();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694ED30);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  v13 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  return a1;
}

uint64_t assignWithTake for CrisisResource(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void *, uint64_t, uint64_t);
  int v15;
  int v16;
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
  uint64_t v28;
  _QWORD *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  v9 = a3[8];
  v10 = (void *)(a1 + v9);
  v11 = (void *)(a2 + v9);
  v12 = sub_23A1B9828();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 40))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694ED30);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  v18 = a3[9];
  v19 = (_QWORD *)(a1 + v18);
  v20 = (uint64_t *)(a2 + v18);
  v22 = *v20;
  v21 = v20[1];
  *v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  v23 = a3[10];
  v24 = (_QWORD *)(a1 + v23);
  v25 = (uint64_t *)(a2 + v23);
  v27 = *v25;
  v26 = v25[1];
  *v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  v28 = a3[11];
  v29 = (_QWORD *)(a1 + v28);
  v30 = (uint64_t *)(a2 + v28);
  v32 = *v30;
  v31 = v30[1];
  *v29 = v32;
  v29[1] = v31;
  swift_bridgeObjectRelease();
  v33 = a3[12];
  v34 = (_QWORD *)(a1 + v33);
  v35 = (uint64_t *)(a2 + v33);
  v37 = *v35;
  v36 = v35[1];
  *v34 = v37;
  v34[1] = v36;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CrisisResource()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A1B666C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694ED30);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 32), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 40) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for CrisisResource()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A1B6700(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_25694ED30);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 32), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 40) + 8) = (a2 - 1);
  return result;
}

void sub_23A1B6784()
{
  unint64_t v0;

  sub_23A1B6814();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23A1B6814()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25694EDD8[0])
  {
    sub_23A1B9828();
    v0 = sub_23A1B993C();
    if (!v1)
      atomic_store(v0, qword_25694EDD8);
  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CrisisResource.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CrisisResource.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A1B6954 + 4 * byte_23A1B9D05[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_23A1B6988 + 4 * byte_23A1B9D00[v4]))();
}

uint64_t sub_23A1B6988(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1B6990(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A1B6998);
  return result;
}

uint64_t sub_23A1B69A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A1B69ACLL);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_23A1B69B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1B69B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1B69C4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A1B69D0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CrisisResource.CodingKeys()
{
  return &type metadata for CrisisResource.CodingKeys;
}

unint64_t sub_23A1B69EC()
{
  unint64_t result;

  result = qword_25694EE28;
  if (!qword_25694EE28)
  {
    result = MEMORY[0x23B8434D0](&unk_23A1B9E64, &type metadata for CrisisResource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25694EE28);
  }
  return result;
}

unint64_t sub_23A1B6A34()
{
  unint64_t result;

  result = qword_25694EE30;
  if (!qword_25694EE30)
  {
    result = MEMORY[0x23B8434D0](&unk_23A1B9DD4, &type metadata for CrisisResource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25694EE30);
  }
  return result;
}

unint64_t sub_23A1B6A7C()
{
  unint64_t result;

  result = qword_25694EE38;
  if (!qword_25694EE38)
  {
    result = MEMORY[0x23B8434D0](&unk_23A1B9DFC, &type metadata for CrisisResource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25694EE38);
  }
  return result;
}

uint64_t sub_23A1B6AC0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x656372756F736572 && a2 == 0xEC00000065707954;
  if (v3 || (sub_23A1B9A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_23A1B9A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6D754E656E6F6870 && a2 == 0xEB00000000726562 || (sub_23A1B9A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x65626D754E736D73 && a2 == 0xE900000000000072 || (sub_23A1B9A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x65746973626577 && a2 == 0xE700000000000000 || (sub_23A1B9A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6372616573626577 && a2 == 0xEE00797265755168 || (sub_23A1B9A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x65676175676E616CLL && a2 == 0xEC00000065646F43 || (sub_23A1B9A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL || (sub_23A1B9A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 2037672291 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    v6 = sub_23A1B9A14();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 8;
    else
      return 9;
  }
}

uint64_t CrisisResourcesProvider.getCrisisResources(resourceType:isoCountryCode:locale:locality:)(int a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint8_t *a6)
{
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  void (*v21)(_BYTE *, uint64_t, uint64_t);
  NSObject *v22;
  os_log_type_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  os_log_t v36;
  uint64_t v37;
  void (*v38)(_QWORD, _QWORD);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  _BYTE *v47;
  NSObject *v48;
  os_log_type_t v49;
  int v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  NSObject *v58;
  uint64_t v59;
  _BYTE *v60;
  uint64_t v61;
  _BYTE v62[4];
  int v63;
  os_log_t v64;
  uint64_t v65;
  void (*isa)(_QWORD, _QWORD, _QWORD);
  uint64_t v67;
  _BYTE *v68;
  _BYTE *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  uint64_t v80;
  uint64_t v81;

  v73 = a5;
  v77 = a2;
  LODWORD(v76) = a1;
  v9 = sub_23A1B9828();
  v70 = *(_QWORD *)(v9 - 8);
  v71 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = &v62[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = sub_23A1B987C();
  v78 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = &v62[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = sub_23A1B9894();
  v79 = *(NSObject **)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v68 = &v62[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v16);
  v19 = &v62[-v18];
  if (qword_25694ED28 != -1)
    swift_once();
  v20 = __swift_project_value_buffer(v15, (uint64_t)static Logger.crisisResources);
  swift_beginAccess();
  isa = (void (*)(_QWORD, _QWORD, _QWORD))v79[2].isa;
  v67 = v20;
  isa(v19, v20, v15);
  v21 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v78 + 16);
  v72 = a4;
  v21(v14, a4, v12);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v75 = v15;
  v22 = sub_23A1B9888();
  v23 = sub_23A1B9918();
  v24 = v23;
  v25 = a3;
  if (os_log_type_enabled(v22, v23))
  {
    v26 = swift_slowAlloc();
    v64 = v22;
    v27 = a6;
    v28 = v26;
    v65 = swift_slowAlloc();
    v81 = v65;
    *(_DWORD *)v28 = 136315906;
    v63 = v24;
    LOBYTE(v80) = v76;
    v69 = v11;
    v29 = sub_23A1B98C4();
    v80 = sub_23A1B812C(v29, v30, &v81);
    sub_23A1B9948();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2080;
    swift_bridgeObjectRetain();
    v80 = sub_23A1B812C(v77, a3, &v81);
    sub_23A1B9948();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v28 + 22) = 2080;
    sub_23A1B876C(&qword_25694EE58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEF0]);
    v31 = sub_23A1B9A08();
    v80 = sub_23A1B812C(v31, v32, &v81);
    v25 = a3;
    sub_23A1B9948();
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v78 + 8))(v14, v12);
    *(_WORD *)(v28 + 32) = 2080;
    v33 = v73;
    if (v27)
      v34 = v73;
    else
      v34 = 0x3E6C696E3CLL;
    if (v27)
      v35 = (unint64_t)v27;
    else
      v35 = 0xE500000000000000;
    swift_bridgeObjectRetain();
    v80 = sub_23A1B812C(v34, v35, &v81);
    v11 = v69;
    sub_23A1B9948();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v36 = v64;
    _os_log_impl(&dword_23A1B0000, v64, (os_log_type_t)v63, "Retrieving crisis resource with resourceType: %s, isoCountryCode: %s, locale: %s, locality: %s", (uint8_t *)v28, 0x2Au);
    v37 = v65;
    swift_arrayDestroy();
    MEMORY[0x23B843524](v37, -1, -1);
    MEMORY[0x23B843524](v28, -1, -1);

    v38 = (void (*)(_QWORD, _QWORD))v79[1].isa;
    v39 = v75;
    v38(v19, v75);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(_BYTE *, uint64_t))(v78 + 8))(v14, v12);

    swift_bridgeObjectRelease_n();
    v27 = a6;
    v38 = (void (*)(_QWORD, _QWORD))v79[1].isa;
    v39 = v75;
    v38(v19, v75);
    v33 = v73;
  }
  v40 = v74;
  sub_23A1B75DC(v76, v77, v25, v72, v33, v27, (uint64_t)v11);
  if (!v40)
  {
    v41 = sub_23A1B9834();
    v42 = v11;
    v43 = v41;
    v45 = v44;
    v69 = v42;
    sub_23A1B9804();
    swift_allocObject();
    sub_23A1B97F8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25694EE40);
    sub_23A1B8028();
    sub_23A1B97EC();
    swift_release();
    v33 = v81;
    v47 = v68;
    isa(v68, v67, v39);
    swift_bridgeObjectRetain_n();
    v48 = sub_23A1B9888();
    v49 = sub_23A1B9918();
    v50 = v49;
    v79 = v48;
    if (os_log_type_enabled(v48, v49))
    {
      v52 = swift_slowAlloc();
      v78 = swift_slowAlloc();
      v81 = v78;
      *(_DWORD *)v52 = 134218242;
      v80 = *(_QWORD *)(v33 + 16);
      LODWORD(v77) = v50;
      sub_23A1B9948();
      swift_bridgeObjectRelease();
      *(_WORD *)(v52 + 12) = 2080;
      v76 = v52 + 14;
      v53 = type metadata accessor for CrisisResource();
      v54 = swift_bridgeObjectRetain();
      v55 = MEMORY[0x23B8431A0](v54, v53);
      v57 = v56;
      swift_bridgeObjectRelease();
      v80 = sub_23A1B812C(v55, v57, &v81);
      sub_23A1B9948();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v58 = v79;
      _os_log_impl(&dword_23A1B0000, v79, (os_log_type_t)v77, "Retrieved %ld resource(s): %s", (uint8_t *)v52, 0x16u);
      v59 = v78;
      swift_arrayDestroy();
      MEMORY[0x23B843524](v59, -1, -1);
      MEMORY[0x23B843524](v52, -1, -1);
      sub_23A1B80E8(v43, v45);

      v60 = v68;
      v61 = v75;
    }
    else
    {
      sub_23A1B80E8(v43, v45);
      swift_bridgeObjectRelease_n();

      v60 = v47;
      v61 = v39;
    }
    v38(v60, v61);
    (*(void (**)(_BYTE *, uint64_t))(v70 + 8))(v69, v71);
  }
  return v33;
}

void sub_23A1B75DC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint8_t *a6@<X5>, uint64_t a7@<X8>)
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t ObjCClassFromMetadata;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  _BYTE *v42;
  _QWORD v43[6];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint8_t *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[6];

  v53 = a6;
  v43[2] = a5;
  v50 = a2;
  v51 = a3;
  v46 = a1;
  v45 = a7;
  v49 = sub_23A1B987C();
  v54 = *(_QWORD *)(v49 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v47 = (char *)v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23A1B9894();
  v56 = *(_QWORD *)(v9 - 8);
  v57 = v9;
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v52 = (char *)v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v43[1] = (char *)v43 - v12;
  v44 = sub_23A1B9810();
  v43[4] = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v43[5] = (char *)v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694ED30);
  MEMORY[0x24BDAC7A8](v14);
  v43[3] = (char *)v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694EF00);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_23A1B9864();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)v43 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_23A1B984C();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)v43 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BundleHelper();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v55 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v48 = a4;
  sub_23A1B9870();
  sub_23A1B9858();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v18, 1, v23) != 1)
  {
    v54 = v24;
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v26, v18, v23);
    v59[0] = 0;
    v59[1] = 0xE000000000000000;
    sub_23A1B9960();
    swift_bridgeObjectRelease();
    strcpy((char *)v59, "ResourceData/");
    HIWORD(v59[1]) = -4864;
    __asm { BR              X10 }
  }
  sub_23A1B881C((uint64_t)v18);
  if (qword_25694ED28 != -1)
    swift_once();
  v28 = v57;
  v29 = __swift_project_value_buffer(v57, (uint64_t)static Logger.crisisResources);
  swift_beginAccess();
  v30 = v56;
  v31 = v52;
  (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v52, v29, v28);
  v32 = v54;
  v33 = v47;
  v34 = v49;
  (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v47, v48, v49);
  v35 = sub_23A1B9888();
  v36 = sub_23A1B9924();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    v38 = swift_slowAlloc();
    v58 = v38;
    *(_DWORD *)v37 = 136315138;
    v53 = v37 + 4;
    sub_23A1B876C(&qword_25694EE58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEF0]);
    v39 = sub_23A1B9A08();
    v59[5] = sub_23A1B812C(v39, v40, &v58);
    sub_23A1B9948();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v33, v34);
    _os_log_impl(&dword_23A1B0000, v35, v36, "No languageCode found in locale: %s", v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B843524](v38, -1, -1);
    MEMORY[0x23B843524](v37, -1, -1);

    (*(void (**)(char *, uint64_t))(v56 + 8))(v31, v57);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);

    (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v28);
  }
  v41 = v55;
  sub_23A1B885C();
  swift_allocError();
  *v42 = 0;
  swift_willThrow();

}

uint64_t sub_23A1B7FEC(int a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint8_t *a6)
{
  return CrisisResourcesProvider.getCrisisResources(resourceType:isoCountryCode:locale:locality:)(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_23A1B8000()
{
  return swift_deallocClassInstance();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_23A1B8028()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_25694EE48;
  if (!qword_25694EE48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25694EE40);
    v2 = sub_23A1B876C(&qword_25694EE50, (uint64_t (*)(uint64_t))type metadata accessor for CrisisResource, (uint64_t)&protocol conformance descriptor for CrisisResource);
    result = MEMORY[0x23B8434D0](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25694EE48);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B8434C4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A1B80E8(uint64_t a1, unint64_t a2)
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

uint64_t sub_23A1B812C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23A1B81FC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23A1B87DC((uint64_t)v12, *a3);
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
      sub_23A1B87DC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23A1B81FC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23A1B9954();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23A1B83B4(a5, a6);
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
  v8 = sub_23A1B9978();
  if (!v8)
  {
    sub_23A1B9984();
    __break(1u);
LABEL_17:
    result = sub_23A1B9990();
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

uint64_t sub_23A1B83B4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23A1B8448(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23A1B8620(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23A1B8620(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23A1B8448(uint64_t a1, unint64_t a2)
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
      v3 = sub_23A1B85BC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23A1B996C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23A1B9984();
      __break(1u);
LABEL_10:
      v2 = sub_23A1B98E8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23A1B9990();
    __break(1u);
LABEL_14:
    result = sub_23A1B9984();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23A1B85BC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694EEF8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23A1B8620(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25694EEF8);
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
  result = sub_23A1B9990();
  __break(1u);
  return result;
}

uint64_t sub_23A1B876C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B8434D0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for CrisisResourcesProvider()
{
  return &type metadata for CrisisResourcesProvider;
}

uint64_t type metadata accessor for BundleHelper()
{
  return objc_opt_self();
}

uint64_t sub_23A1B87DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23A1B881C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694EF00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A1B885C()
{
  unint64_t result;

  result = qword_25694EF08;
  if (!qword_25694EF08)
  {
    result = MEMORY[0x23B8434D0](&protocol conformance descriptor for CrisisResourceError, &type metadata for CrisisResourceError);
    atomic_store(result, (unint64_t *)&qword_25694EF08);
  }
  return result;
}

uint64_t Logger.crisisResources.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_25694ED28 != -1)
    swift_once();
  v0 = sub_23A1B9894();
  return __swift_project_value_buffer(v0, (uint64_t)static Logger.crisisResources);
}

void sub_23A1B88E8()
{
  strcpy((char *)&qword_25694F6B0, "com.apple.siri");
  algn_25694F6B8[7] = -18;
}

void sub_23A1B8918()
{
  qword_25694F6C0 = 0x6552736973697243;
  *(_QWORD *)algn_25694F6C8 = 0xEF73656372756F73;
}

uint64_t sub_23A1B8948()
{
  uint64_t v0;
  uint64_t result;

  sub_23A1B8CE4();
  if (qword_25694ED10 != -1)
    swift_once();
  v0 = qword_25694ED18;
  swift_bridgeObjectRetain();
  if (v0 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  result = sub_23A1B9930();
  static Log.crisisResources = result;
  return result;
}

uint64_t *Log.crisisResources.unsafeMutableAddressor()
{
  if (qword_25694ED20 != -1)
    swift_once();
  return &static Log.crisisResources;
}

id static Log.crisisResources.getter()
{
  if (qword_25694ED20 != -1)
    swift_once();
  return (id)static Log.crisisResources;
}

uint64_t sub_23A1B8A90()
{
  uint64_t v0;
  id v1;

  v0 = sub_23A1B9894();
  __swift_allocate_value_buffer(v0, static Logger.crisisResources);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.crisisResources);
  if (qword_25694ED20 != -1)
    swift_once();
  v1 = (id)static Log.crisisResources;
  return sub_23A1B98A0();
}

uint64_t static Logger.crisisResources.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_25694ED28 != -1)
    swift_once();
  v2 = sub_23A1B9894();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.crisisResources);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static Logger.crisisResources.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_25694ED28 != -1)
    swift_once();
  v2 = sub_23A1B9894();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.crisisResources);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static Logger.crisisResources.modify())()
{
  uint64_t v0;

  if (qword_25694ED28 != -1)
    swift_once();
  v0 = sub_23A1B9894();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.crisisResources);
  swift_beginAccess();
  return j__swift_endAccess;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

unint64_t sub_23A1B8CE4()
{
  unint64_t result;

  result = qword_25694EF10;
  if (!qword_25694EF10)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25694EF10);
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

uint64_t CrisisResourceType.asDirectoryName.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A1B8D9C
                                                                     + 4 * asc_23A1BA010[a1]))(0xD000000000000011, 0x800000023A1BA5D0);
}

uint64_t sub_23A1B8D9C()
{
  return 0x73416C6175786553;
}

uint64_t sub_23A1B8DC0()
{
  return 0x6F436E6F73696F50;
}

unint64_t sub_23A1B8DE4()
{
  return 0xD000000000000010;
}

uint64_t sub_23A1B8E2C()
{
  return 1296126787;
}

uint64_t CrisisResourceType.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A1B8E78 + 4 * byte_23A1BA017[a1]))(0xD000000000000019, 0x800000023A1BA240);
}

uint64_t sub_23A1B8E78(uint64_t a1)
{
  return a1 + 3;
}

uint64_t sub_23A1B8EE0()
{
  return 1835103075;
}

void sub_23A1B8EF0(char *a1)
{
  sub_23A1B8EFC(*a1);
}

void sub_23A1B8EFC(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_23A1B8F48(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23A1B8FDC + 4 * byte_23A1BA025[a2]))(a3 + 3);
}

uint64_t sub_23A1B8FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;

  if (a1 == a3 + 3 && v3 == 0x800000023A1BA260)
    v4 = 1;
  else
    v4 = sub_23A1B9A14();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

void sub_23A1B90AC()
{
  char *v0;

  sub_23A1B9198(0, *v0);
}

void sub_23A1B90B8(uint64_t a1)
{
  char *v1;

  sub_23A1B90C0(a1, *v1);
}

void sub_23A1B90C0(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23A1B9104()
{
  sub_23A1B98D0();
  return swift_bridgeObjectRelease();
}

void sub_23A1B9190(uint64_t a1)
{
  char *v1;

  sub_23A1B9198(a1, *v1);
}

void sub_23A1B9198(uint64_t a1, char a2)
{
  sub_23A1B9A50();
  __asm { BR              X10 }
}

uint64_t sub_23A1B91EC()
{
  sub_23A1B98D0();
  swift_bridgeObjectRelease();
  return sub_23A1B9A68();
}

uint64_t sub_23A1B9294@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s15CrisisResources0A12ResourceTypeO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_23A1B92C0@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = CrisisResourceType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23A1B92E8()
{
  sub_23A1B957C();
  return sub_23A1B9900();
}

uint64_t sub_23A1B9344()
{
  sub_23A1B957C();
  return sub_23A1B98F4();
}

uint64_t _s15CrisisResources0A12ResourceTypeO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_23A1B999C();
  swift_bridgeObjectRelease();
  if (v0 >= 7)
    return 7;
  else
    return v0;
}

unint64_t sub_23A1B93DC()
{
  unint64_t result;

  result = qword_25694EF18;
  if (!qword_25694EF18)
  {
    result = MEMORY[0x23B8434D0](&protocol conformance descriptor for CrisisResourceType, &type metadata for CrisisResourceType);
    atomic_store(result, (unint64_t *)&qword_25694EF18);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CrisisResourceType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CrisisResourceType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A1B94FC + 4 * byte_23A1BA03F[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23A1B9530 + 4 * byte_23A1BA03A[v4]))();
}

uint64_t sub_23A1B9530(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1B9538(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A1B9540);
  return result;
}

uint64_t sub_23A1B954C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A1B9554);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_23A1B9558(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1B9560(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CrisisResourceType()
{
  return &type metadata for CrisisResourceType;
}

unint64_t sub_23A1B957C()
{
  unint64_t result;

  result = qword_25694EF20;
  if (!qword_25694EF20)
  {
    result = MEMORY[0x23B8434D0](&protocol conformance descriptor for CrisisResourceType, &type metadata for CrisisResourceType);
    atomic_store(result, (unint64_t *)&qword_25694EF20);
  }
  return result;
}

BOOL static CrisisResourceError.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t CrisisResourceError.hash(into:)()
{
  return sub_23A1B9A5C();
}

uint64_t CrisisResourceError.hashValue.getter()
{
  sub_23A1B9A50();
  sub_23A1B9A5C();
  return sub_23A1B9A68();
}

unint64_t sub_23A1B963C()
{
  unint64_t result;

  result = qword_25694EF28;
  if (!qword_25694EF28)
  {
    result = MEMORY[0x23B8434D0](&protocol conformance descriptor for CrisisResourceError, &type metadata for CrisisResourceError);
    atomic_store(result, (unint64_t *)&qword_25694EF28);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CrisisResourceError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CrisisResourceError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A1B976C + 4 * byte_23A1BA175[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A1B97A0 + 4 * asc_23A1BA170[v4]))();
}

uint64_t sub_23A1B97A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1B97A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A1B97B0);
  return result;
}

uint64_t sub_23A1B97BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A1B97C4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A1B97C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1B97D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CrisisResourceError()
{
  return &type metadata for CrisisResourceError;
}

uint64_t sub_23A1B97EC()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_23A1B97F8()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_23A1B9804()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_23A1B9810()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_23A1B981C()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_23A1B9828()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23A1B9834()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_23A1B9840()
{
  return MEMORY[0x24BDCEB50]();
}

uint64_t sub_23A1B984C()
{
  return MEMORY[0x24BDCEB60]();
}

uint64_t sub_23A1B9858()
{
  return MEMORY[0x24BDCEDE0]();
}

uint64_t sub_23A1B9864()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_23A1B9870()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_23A1B987C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23A1B9888()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23A1B9894()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23A1B98A0()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_23A1B98AC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A1B98B8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A1B98C4()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23A1B98D0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A1B98DC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A1B98E8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23A1B98F4()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23A1B9900()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23A1B990C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23A1B9918()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23A1B9924()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23A1B9930()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_23A1B993C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23A1B9948()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23A1B9954()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23A1B9960()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A1B996C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23A1B9978()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A1B9984()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23A1B9990()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23A1B999C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23A1B99A8()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23A1B99B4()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23A1B99C0()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23A1B99CC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23A1B99D8()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23A1B99E4()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23A1B99F0()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23A1B99FC()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23A1B9A08()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23A1B9A14()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A1B9A20()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23A1B9A2C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23A1B9A38()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23A1B9A44()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23A1B9A50()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A1B9A5C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A1B9A68()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23A1B9A74()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23A1B9A80()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23A1B9A8C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23A1B9A98()
{
  return MEMORY[0x24BEE4A10]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

