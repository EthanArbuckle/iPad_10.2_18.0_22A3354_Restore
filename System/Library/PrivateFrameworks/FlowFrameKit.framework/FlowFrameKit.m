BOOL static Understandable.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Understandable.hash(into:)()
{
  return sub_213BC94A8();
}

uint64_t Understandable.hashValue.getter()
{
  sub_213BC949C();
  sub_213BC94A8();
  return sub_213BC94B4();
}

BOOL sub_213BBCA98(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_213BBCAB0()
{
  sub_213BC949C();
  sub_213BC94A8();
  return sub_213BC94B4();
}

uint64_t sub_213BBCAF4()
{
  return sub_213BC94A8();
}

uint64_t sub_213BBCB1C()
{
  sub_213BC949C();
  sub_213BC94A8();
  return sub_213BC94B4();
}

uint64_t AnyFrame.__allocating_init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213BBCB74(a1, a2, a3, (uint64_t (*)(void))sub_213BBDACC);
}

uint64_t AnyFrame.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213BBCB74(a1, a2, a3, (uint64_t (*)(void))sub_213BBD7B4);
}

uint64_t sub_213BBCB74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6;

  v6 = a4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  return v6;
}

uint64_t sub_213BBCBBC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  _QWORD *v25;
  _QWORD v26[2];
  void (*v27)(uint64_t *);
  uint64_t v28;
  uint64_t v29;
  char v30;

  v26[1] = a5;
  v27 = a3;
  v28 = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = sub_213BC934C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v17 = (char *)v26 - v16;
  v18 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)v26 - v19;
  sub_213BBDB24(a1, (uint64_t)&v29);
  v21 = swift_dynamicCast();
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  if ((v21 & 1) != 0)
  {
    v22(v17, 0, 1, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v17, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t, void (*)(uint64_t *), uint64_t, uint64_t, uint64_t))(a8 + 56))(v20, a2, v27, v28, a7, a8);
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, AssociatedTypeWitness);
  }
  else
  {
    v22(v17, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    sub_213BBE064();
    v24 = swift_allocError();
    *v25 = 0xD00000000000001BLL;
    v25[1] = 0x8000000213BCA2A0;
    v29 = v24;
    v30 = 1;
    v27(&v29);
    return MEMORY[0x2199BE330](v24);
  }
}

uint64_t sub_213BBCDA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _QWORD *v17;
  void (*v18)(_BYTE *, uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t);
  _BYTE v20[32];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v14 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v16 = &v20[-v15];
  sub_213BBDB24(a1, (uint64_t)v20);
  swift_dynamicCast();
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a5;
  v17[3] = a6;
  v17[4] = a7;
  v17[5] = a2;
  v17[6] = a3;
  v18 = *(void (**)(_BYTE *, uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(a7 + 64);
  swift_retain();
  v18(v16, sub_213BBDFD4, v17, a6, a7);
  swift_release();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v14 + 8))(v16, AssociatedTypeWitness);
}

uint64_t sub_213BBCEE0(uint64_t a1, void (*a2)(uint64_t *))
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v16[4];
  char v17;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v7 = (char *)&v16[-1] - v6;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D26060);
  v8 = sub_213BC94C0();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v16[-1] - v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v16[-1] - v9, a1, v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v16[0] = *v10;
    v12 = v16[0];
    v17 = 1;
    MEMORY[0x2199BE33C](v16[0]);
    a2(v16);
    MEMORY[0x2199BE330](v12);
  }
  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v5 + 32))(v7, v10, AssociatedTypeWitness);
    v16[3] = AssociatedTypeWitness;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v16);
    (*(void (**)(uint64_t *, char *, uint64_t))(v5 + 16))(boxed_opaque_existential_0, v7, AssociatedTypeWitness);
    v17 = 0;
    a2(v16);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, AssociatedTypeWitness);
  }
  return sub_213BBE028((uint64_t)v16, &qword_254D26068);
}

uint64_t sub_213BBD074(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[32];
  _BYTE v26[32];

  v23 = a4;
  v24 = a5;
  v22 = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v15 = (char *)&v21 - v14;
  v16 = swift_getAssociatedTypeWitness();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v21 - v18;
  sub_213BBDB24(a1, (uint64_t)v26);
  swift_dynamicCast();
  sub_213BBDB24(a2, (uint64_t)v25);
  swift_dynamicCast();
  (*(void (**)(char *, char *, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 72))(v19, v15, v22, v23, a7, a8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, AssociatedTypeWitness);
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

uint64_t sub_213BBD1F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  void (*v12)(_BYTE *, uint64_t, uint64_t);
  _BYTE v14[32];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v11 = &v14[-v10];
  sub_213BBDB24(a1, (uint64_t)v14);
  swift_dynamicCast();
  v12 = *(void (**)(_BYTE *, uint64_t, uint64_t))(a3 + 80);
  a4[3] = swift_getAssociatedTypeWitness();
  __swift_allocate_boxed_opaque_existential_0(a4);
  v12(v11, a2, a3);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v9 + 8))(v11, AssociatedTypeWitness);
}

uint64_t sub_213BBD318(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void (*v11)(uint64_t *, uint64_t, uint64_t, uint64_t);
  uint64_t *boxed_opaque_existential_0;
  uint64_t v14[4];

  v11 = *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v5 + 32);
  v14[3] = a5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 16))(boxed_opaque_existential_0, a1, a5);
  v11(v14, a2, a3, a4);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v14);
}

uint64_t sub_213BBD3A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void (*v9)(uint64_t *, uint64_t, uint64_t);
  uint64_t *boxed_opaque_existential_0;
  uint64_t v12[4];

  v9 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v4 + 48);
  v12[3] = a4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))(boxed_opaque_existential_0, a1, a4);
  v9(v12, a2, a3);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
}

uint64_t sub_213BBD420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void (*v11)(uint64_t *, uint64_t, uint64_t, uint64_t);
  uint64_t *boxed_opaque_existential_0;
  uint64_t v14[4];

  v11 = *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v5 + 64);
  v14[3] = a5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 16))(boxed_opaque_existential_0, a1, a5);
  v11(v14, a2, a3, a4);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v14);
}

uint64_t sub_213BBD4AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v5)(uint64_t *);
  uint64_t *boxed_opaque_existential_0;
  uint64_t v8[4];

  v5 = *(void (**)(uint64_t *))(v2 + 80);
  v8[3] = a2;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(boxed_opaque_existential_0, a1, a2);
  v5(v8);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v8);
}

unint64_t sub_213BBD520()
{
  sub_213BC93A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_213BC9190();
  swift_bridgeObjectRelease();
  sub_213BC9190();
  swift_bridgeObjectRetain();
  sub_213BC9190();
  swift_bridgeObjectRelease();
  sub_213BC9190();
  return 0xD000000000000018;
}

uint64_t sub_213BBD608@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  int v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  _BYTE v14[32];

  v5 = sub_213BC934C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v14[-v7];
  sub_213BBDB24(v2 + 112, (uint64_t)v14);
  v9 = swift_dynamicCast();
  v10 = *(_QWORD *)(a1 - 8);
  v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  if (v9)
  {
    v11((uint64_t)v8, 0, 1, a1);
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v10 + 32))(a2, v8, a1);
    v12 = 0;
  }
  else
  {
    v12 = 1;
    v11((uint64_t)v8, 1, 1, a1);
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v11(a2, v12, 1, a1);
}

uint64_t AnyFrame.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 112);
  return v0;
}

uint64_t AnyFrame.__deallocating_deinit()
{
  AnyFrame.deinit();
  return swift_deallocClassInstance();
}

unint64_t sub_213BBD790()
{
  return sub_213BBD520();
}

_QWORD *sub_213BBD7B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *boxed_opaque_existential_0;
  void (*v16)(uint64_t *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  char *v34;
  _QWORD v36[3];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t);
  __int128 v42[2];
  uint64_t v43;
  _QWORD v44[4];

  v4 = v3;
  v39 = *v3;
  v8 = *(_QWORD *)(a2 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v36 - v12;
  v4[17] = v14;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v4 + 14);
  v16 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v8 + 16);
  v16(boxed_opaque_existential_0, a1, a2);
  v41 = (void (*)(char *, uint64_t, uint64_t))v16;
  v16((uint64_t *)v13, a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D26050);
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_213BBDF54(v42, (uint64_t)v44);
    __swift_project_boxed_opaque_existential_1(v44, v44[3]);
    v4[12] = sub_213BC9448();
    v4[13] = v17;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v44);
  }
  else
  {
    v43 = 0;
    memset(v42, 0, sizeof(v42));
    sub_213BBE028((uint64_t)v42, &qword_254D26058);
    v44[0] = swift_getDynamicType();
    swift_getMetatypeMetadata();
    v4[12] = sub_213BC9178();
    v4[13] = v18;
  }
  v4[2] = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
  v4[3] = v19;
  v41(v11, a1, a2);
  v20 = *(unsigned __int8 *)(v8 + 80);
  v21 = ((v20 + 40) & ~v20) + v9;
  v22 = (v20 + 40) & ~v20;
  v40 = v22;
  v23 = v8;
  v24 = v20 | 7;
  v25 = (_QWORD *)swift_allocObject();
  v37 = *(_QWORD *)(v39 + 80);
  v38 = a3;
  v25[2] = v37;
  v25[3] = a2;
  v25[4] = a3;
  v39 = *(_QWORD *)(v23 + 32);
  ((void (*)(char *, char *, uint64_t))v39)((char *)v25 + v22, v11, a2);
  v4[4] = sub_213BBDE70;
  v4[5] = v25;
  v26 = a1;
  v27 = v41;
  v41(v11, a1, a2);
  v36[1] = v24;
  v36[2] = v21;
  v28 = (_QWORD *)swift_allocObject();
  v30 = v37;
  v29 = v38;
  v28[2] = v37;
  v28[3] = a2;
  v28[4] = v29;
  ((void (*)(char *, char *, uint64_t))v39)((char *)v28 + v40, v11, a2);
  v4[6] = sub_213BBDE94;
  v4[7] = v28;
  v27(v11, v26, a2);
  v31 = (_QWORD *)swift_allocObject();
  v31[2] = v30;
  v31[3] = a2;
  v31[4] = v29;
  v32 = (void (*)(char *, char *, uint64_t))v39;
  v33 = v40;
  ((void (*)(char *, char *, uint64_t))v39)((char *)v31 + v40, v11, a2);
  v4[8] = sub_213BBDEB8;
  v4[9] = v31;
  v27(v11, v26, a2);
  v34 = (char *)swift_allocObject();
  *((_QWORD *)v34 + 2) = v30;
  *((_QWORD *)v34 + 3) = a2;
  *((_QWORD *)v34 + 4) = v29;
  v32(&v34[v33], v11, a2);
  v4[10] = sub_213BBDF34;
  v4[11] = v34;
  return v4;
}

_QWORD *sub_213BBDACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for AnyFrame(0, *(_QWORD *)(v4 + 80), a3, a4);
  swift_allocObject();
  return sub_213BBD7B4(a1, a2, a3);
}

uint64_t sub_213BBDB24(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_213BBDB64()
{
  unint64_t result;

  result = qword_254D25FC8[0];
  if (!qword_254D25FC8[0])
  {
    result = MEMORY[0x2199BE3E4](&protocol conformance descriptor for Understandable, &type metadata for Understandable);
    atomic_store(result, qword_254D25FC8);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Understandable(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Understandable(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_213BBDC94 + 4 * byte_213BC9895[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_213BBDCC8 + 4 * byte_213BC9890[v4]))();
}

uint64_t sub_213BBDCC8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213BBDCD0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213BBDCD8);
  return result;
}

uint64_t sub_213BBDCE4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213BBDCECLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_213BBDCF0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213BBDCF8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213BBDD04(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_213BBDD10(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Understandable()
{
  return &type metadata for Understandable;
}

uint64_t sub_213BBDD30()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for AnyFrame(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AnyFrame);
}

uint64_t method lookup function for AnyFrame()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AnyFrame.__allocating_init<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of AnyFrame.debugDescription.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of AnyFrame.unbox<A>()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of FlowFrameProtocol.namespace.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of FlowFrameProtocol.onInput(controller:input:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 56))();
}

uint64_t dispatch thunk of FlowFrameProtocol.execute(controller:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 64))();
}

uint64_t dispatch thunk of FlowFrameProtocol.action(renderer:args:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 72))();
}

uint64_t dispatch thunk of FlowFrameProtocol.exit(controller:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199BE3CC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_213BBDE70(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *), uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v5 = v4[3];
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  return sub_213BBCBBC(a1, a2, a3, a4, (uint64_t)v4 + ((v6 + 40) & ~v6), v4[2], v5, v4[4]);
}

uint64_t sub_213BBDE94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v4 = v3[3];
  v5 = *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80);
  return sub_213BBCDA8(a1, a2, a3, (uint64_t)v3 + ((v5 + 40) & ~v5), v3[2], v4, v3[4]);
}

uint64_t sub_213BBDEB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v5 = v4[3];
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  return sub_213BBD074(a1, a2, a3, a4, (uint64_t)v4 + ((v6 + 40) & ~v6), v4[2], v5, v4[4]);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_213BBDF34@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_213BBD1F8(a1, *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), a2);
}

uint64_t sub_213BBDF54(__int128 *a1, uint64_t a2)
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

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_213BBDFB0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213BBDFD4(uint64_t a1)
{
  uint64_t v1;

  return sub_213BBCEE0(a1, *(void (**)(uint64_t *))(v1 + 40));
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199BE3D8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_213BBE028(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_213BBE064()
{
  unint64_t result;

  result = qword_254D26070[0];
  if (!qword_254D26070[0])
  {
    result = MEMORY[0x2199BE3E4](&protocol conformance descriptor for IllegalStateError, &type metadata for IllegalStateError);
    atomic_store(result, qword_254D26070);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2199BE390](a1, v6, a5);
}

uint64_t NonUnderstanding.input.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 28));
}

uint64_t NonUnderstanding.localizedDescription.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_213BBE12C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  char *v7;

  *a5 = a1;
  a5[1] = a2;
  v7 = (char *)a5 + *(int *)(type metadata accessor for NonUnderstanding(0, a4, a3, a4) + 28);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(v7, a3, a4);
}

uint64_t TimedOutError.message.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for IllegalStateError()
{
  return &type metadata for IllegalStateError;
}

uint64_t sub_213BBE1D4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_213BBE1DC()
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

uint64_t *sub_213BBE254(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 16) & (unint64_t)~v6) + *(_QWORD *)(v5 + 64) > 0x18)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v13(v11, v12, v4);
  }
  return a1;
}

uint64_t sub_213BBE314(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

_QWORD *sub_213BBE358(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  swift_bridgeObjectRetain();
  v10(v8, v9, v5);
  return a1;
}

_QWORD *sub_213BBE3C8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

_OWORD *sub_213BBE440(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_QWORD *sub_213BBE490(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_213BBE4F8(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  int v11;
  unsigned int v13;
  int v14;
  unint64_t v15;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_22;
  v9 = ((v7 + 16) & ~v7) + *(_QWORD *)(v4 + 64);
  v10 = 8 * v9;
  if (v9 <= 3)
  {
    v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      v11 = *(_DWORD *)(a1 + v9);
      if (!v11)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      v11 = *(unsigned __int16 *)(a1 + v9);
      if (!*(_WORD *)(a1 + v9))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_22:
      if ((v5 & 0x80000000) != 0)
        return (*(uint64_t (**)(uint64_t))(v4 + 48))((a1 + v7 + 16) & ~v7);
      v15 = *(_QWORD *)(a1 + 8);
      if (v15 >= 0xFFFFFFFF)
        LODWORD(v15) = -1;
      return (v15 + 1);
    }
  }
  v11 = *(unsigned __int8 *)(a1 + v9);
  if (!*(_BYTE *)(a1 + v9))
    goto LABEL_22;
LABEL_15:
  v14 = (v11 - 1) << v10;
  if (v9 > 3)
    v14 = 0;
  if (!(_DWORD)v9)
    return v6 + v14 + 1;
  if (v9 > 3)
    LODWORD(v9) = 4;
  return ((uint64_t (*)(void))((char *)&loc_213BBE5CC + 4 * byte_213BC9A40[(v9 - 1)]))();
}

void sub_213BBE63C(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + *(_QWORD *)(v5 + 64);
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      v10 = ((a3 - v6 + ~(-1 << (8 * v7))) >> (8 * v7)) + 1;
      if (HIWORD(v10))
      {
        v8 = 4u;
      }
      else if (v10 >= 0x100)
      {
        v8 = 2;
      }
      else
      {
        v8 = v10 > 1;
      }
    }
    else
    {
      v8 = 1u;
    }
  }
  else
  {
    v8 = 0;
  }
  if (v6 < a2)
  {
    v9 = ~v6 + a2;
    if (v7 < 4)
    {
      if ((_DWORD)v7)
      {
        v11 = v9 & ~(-1 << (8 * v7));
        bzero(a1, v7);
        if ((_DWORD)v7 == 3)
        {
          *a1 = v11;
          *((_BYTE *)a1 + 2) = BYTE2(v11);
        }
        else if ((_DWORD)v7 == 2)
        {
          *a1 = v11;
        }
        else
        {
          *(_BYTE *)a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v7);
      *(_DWORD *)a1 = v9;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t type metadata accessor for NonUnderstanding(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for NonUnderstanding);
}

_QWORD *initializeBufferWithCopyOfBuffer for TimedOutError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for TimedOutError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithTake for TimedOutError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for TimedOutError()
{
  return &type metadata for TimedOutError;
}

_QWORD *_s12FlowFrameKit17IllegalStateErrorVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s12FlowFrameKit17IllegalStateErrorVwet_0(uint64_t a1, int a2)
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

uint64_t sub_213BBE93C(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CancelledError()
{
  return &type metadata for CancelledError;
}

uint64_t AnyFlowFrameFactory.namespace.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_213BBE9CC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 64))();
}

uint64_t sub_213BBE9EC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t AnyFlowFrameFactory.__allocating_init<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  AnyFlowFrameFactory.init<A>(_:)(a1, a2);
  return v4;
}

uint64_t *AnyFlowFrameFactory.init<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void (*v20)(char *, uint64_t, uint64_t);
  void (*v21)(char *, char *, uint64_t);
  char *v22;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = v2;
  v31 = *v3;
  v6 = *(_QWORD *)(a2 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = v9;
  v3[2] = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 32))(a2, v9);
  v3[3] = v10;
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v11(v8, a1, a2);
  v25 = v11;
  v12 = *(unsigned __int8 *)(v6 + 80);
  v13 = (v12 + 40) & ~v12;
  v28 = v13;
  v29 = v12 | 7;
  v14 = (_QWORD *)swift_allocObject();
  v15 = v30;
  v27 = *(_QWORD *)(v31 + 80);
  v14[2] = v27;
  v14[3] = a2;
  v14[4] = v15;
  v31 = *(_QWORD *)(v6 + 32);
  ((void (*)(char *, char *, uint64_t))v31)((char *)v14 + v13, v8, a2);
  v3[8] = (uint64_t)sub_213BBEC84;
  v3[9] = (uint64_t)v14;
  v26 = a1;
  v11(v8, a1, a2);
  v16 = (_QWORD *)swift_allocObject();
  v17 = v27;
  v18 = v28;
  v16[2] = v27;
  v16[3] = a2;
  v16[4] = v15;
  ((void (*)(char *, char *, uint64_t))v31)((char *)v16 + v18, v8, a2);
  v3[10] = (uint64_t)sub_213BBED0C;
  v3[11] = (uint64_t)v16;
  v25(v8, a1, a2);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = v17;
  v19[3] = a2;
  v19[4] = v15;
  v20 = (void (*)(char *, uint64_t, uint64_t))v31;
  ((void (*)(char *, char *, uint64_t))v31)((char *)v19 + v18, v8, a2);
  v3[4] = (uint64_t)sub_213BBED94;
  v3[5] = (uint64_t)v19;
  v20(v8, v26, a2);
  v21 = (void (*)(char *, char *, uint64_t))v20;
  v22 = (char *)swift_allocObject();
  *((_QWORD *)v22 + 2) = v17;
  *((_QWORD *)v22 + 3) = a2;
  *((_QWORD *)v22 + 4) = v30;
  v21(&v22[v18], v8, a2);
  v3[6] = (uint64_t)sub_213BBEDD4;
  v3[7] = (uint64_t)v22;
  return v3;
}

uint64_t sub_213BBEC84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 40);
  a1[3] = swift_getAssociatedTypeWitness();
  __swift_allocate_boxed_opaque_existential_0(a1);
  return v5(v3, v4);
}

uint64_t sub_213BBED0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 48);
  a1[3] = swift_getAssociatedTypeWitness();
  __swift_allocate_boxed_opaque_existential_0(a1);
  return v5(v3, v4);
}

uint64_t sub_213BBED94()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 32) + 56))() & 1;
}

uint64_t sub_213BBEDD4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 32) + 64))();
}

uint64_t sub_213BBEE0C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 32))() & 1;
}

uint64_t sub_213BBEE30()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t AnyFlowFrameFactory.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t AnyFlowFrameFactory.__deallocating_deinit()
{
  AnyFlowFrameFactory.deinit();
  return swift_deallocClassInstance();
}

uint64_t dispatch thunk of FlowFrameFactoryProtocol.namespace.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of FlowFrameFactoryProtocol.controller.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of FlowFrameFactoryProtocol.renderer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of FlowFrameFactoryProtocol.hasFrameAbleToHandle(givenInput:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of FlowFrameFactoryProtocol.makeFrameAbleToHandle(givenInput:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t sub_213BBEED4()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for AnyFlowFrameFactory(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AnyFlowFrameFactory);
}

uint64_t method lookup function for AnyFlowFrameFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AnyFlowFrameFactory.controller.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of AnyFlowFrameFactory.renderer.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of AnyFlowFrameFactory.__allocating_init<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of AnyFlowFrameFactory.hasFrameAbleToHandle(givenInput:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of AnyFlowFrameFactory.makeFrameAbleToHandle(givenInput:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of FlowFrameFactoryLoaderProtocol.loadFactory(fromNamespace:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of FlowFrameFactoryLoaderProtocol.loadFactory(forInput:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_213BBEF88()
{
  uint64_t v0;
  id v1;

  v0 = sub_213BC90AC();
  __swift_allocate_value_buffer(v0, qword_253F09168);
  __swift_project_value_buffer(v0, (uint64_t)qword_253F09168);
  if (qword_253F08DF0 != -1)
    swift_once();
  v1 = (id)qword_253F09160;
  return sub_213BC90B8();
}

void sub_213BBF008()
{
  strcpy((char *)&qword_254D26830, "FlowFrameKit");
  algn_254D26838[5] = 0;
  *(_WORD *)&algn_254D26838[6] = -5120;
}

uint64_t sub_213BBF034()
{
  uint64_t result;

  sub_213BBF0C8();
  if (qword_254D25FC0 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  result = sub_213BC9340();
  qword_253F09160 = result;
  return result;
}

unint64_t sub_213BBF0C8()
{
  unint64_t result;

  result = qword_253F08DE0;
  if (!qword_253F08DE0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253F08DE0);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

BOOL static FrameOperationType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t FrameOperationType.hash(into:)()
{
  return sub_213BC94A8();
}

uint64_t FrameOperationType.hashValue.getter()
{
  sub_213BC949C();
  sub_213BC94A8();
  return sub_213BC94B4();
}

BOOL sub_213BBF1DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void FrameOperation.type.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t FrameOperation.next.getter()
{
  return swift_retain();
}

uint64_t FrameOperation.requireInput.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t FrameOperation.onChildFrameCompletion.getter()
{
  return swift_retain();
}

_BYTE *FrameOperation.init(type:next:onChildFrameCompletion:requireInput:)@<X0>(_BYTE *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  *(_BYTE *)a5 = *result;
  *(_QWORD *)(a5 + 8) = a2;
  *(_BYTE *)(a5 + 16) = a4;
  *(_QWORD *)(a5 + 24) = a3;
  return result;
}

uint64_t static FrameOperation.ongoing(requireInput:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_BYTE *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = result;
  *(_QWORD *)(a2 + 24) = 0;
  return result;
}

_QWORD *static FrameOperation.ongoing<A>(next:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD *result;

  v9 = type metadata accessor for AnyFrame(0, a2, a3, a4);
  result = sub_213BBDACC(a1, a3, a4, v9);
  *(_BYTE *)a5 = 0;
  *(_QWORD *)(a5 + 8) = result;
  *(_BYTE *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  return result;
}

uint64_t static FrameOperation.ongoing<A, B>(next:childCompletion:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v15;
  _QWORD *v16;
  uint64_t AssociatedTypeWitness;
  uint64_t v18;
  _QWORD *v19;

  v15 = type metadata accessor for AnyFrame(0, a4, a3, a4);
  v16 = sub_213BBDACC(a1, a5, a7, v15);
  type metadata accessor for AnyChildCompletion();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v18 = swift_allocObject();
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = a6;
  v19[3] = AssociatedTypeWitness;
  v19[4] = a2;
  v19[5] = a3;
  *(_QWORD *)(v18 + 16) = sub_213BBFC50;
  *(_QWORD *)(v18 + 24) = v19;
  *(_BYTE *)a8 = 0;
  *(_QWORD *)(a8 + 8) = v16;
  *(_BYTE *)(a8 + 16) = 0;
  *(_QWORD *)(a8 + 24) = v18;
  return swift_retain();
}

uint64_t AnyChildCompletion.__allocating_init<A, B>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  _QWORD *v9;

  v8 = swift_allocObject();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = a1;
  v9[5] = a2;
  *(_QWORD *)(v8 + 16) = sub_213BBFC50;
  *(_QWORD *)(v8 + 24) = v9;
  return v8;
}

uint64_t static FrameOperation.ongoing(next:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_BYTE *)a2 = 0;
  *(_QWORD *)(a2 + 8) = a1;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  return swift_retain();
}

void static FrameOperation.complete()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 1;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
}

_QWORD *static FrameOperation.complete<A>(next:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD *result;

  v9 = type metadata accessor for AnyFrame(0, a2, a3, a4);
  result = sub_213BBDACC(a1, a3, a4, v9);
  *(_BYTE *)a5 = 1;
  *(_QWORD *)(a5 + 8) = result;
  *(_BYTE *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  return result;
}

uint64_t static FrameOperation.complete<A, B>(next:childCompletion:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v15;
  _QWORD *v16;
  uint64_t AssociatedTypeWitness;
  uint64_t v18;
  _QWORD *v19;

  v15 = type metadata accessor for AnyFrame(0, a4, a3, a4);
  v16 = sub_213BBDACC(a1, a5, a7, v15);
  type metadata accessor for AnyChildCompletion();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v18 = swift_allocObject();
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = a6;
  v19[3] = AssociatedTypeWitness;
  v19[4] = a2;
  v19[5] = a3;
  *(_QWORD *)(v18 + 16) = sub_213BBFC50;
  *(_QWORD *)(v18 + 24) = v19;
  *(_BYTE *)a8 = 1;
  *(_QWORD *)(a8 + 8) = v16;
  *(_BYTE *)(a8 + 16) = 0;
  *(_QWORD *)(a8 + 24) = v18;
  return swift_retain();
}

uint64_t static FrameOperation.complete(next:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_BYTE *)a2 = 1;
  *(_QWORD *)(a2 + 8) = a1;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  return swift_retain();
}

uint64_t static FrameOperation.replan(requireInput:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_BYTE *)a2 = 2;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = result;
  *(_QWORD *)(a2 + 24) = 0;
  return result;
}

_QWORD *static FrameOperation.replan<A>(next:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD *result;

  v9 = type metadata accessor for AnyFrame(0, a2, a3, a4);
  result = sub_213BBDACC(a1, a3, a4, v9);
  *(_BYTE *)a5 = 2;
  *(_QWORD *)(a5 + 8) = result;
  *(_BYTE *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  return result;
}

uint64_t static FrameOperation.replan<A, B>(next:childCompletion:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v15;
  _QWORD *v16;
  uint64_t AssociatedTypeWitness;
  uint64_t v18;
  _QWORD *v19;

  v15 = type metadata accessor for AnyFrame(0, a4, a3, a4);
  v16 = sub_213BBDACC(a1, a5, a7, v15);
  type metadata accessor for AnyChildCompletion();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v18 = swift_allocObject();
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = a6;
  v19[3] = AssociatedTypeWitness;
  v19[4] = a2;
  v19[5] = a3;
  *(_QWORD *)(v18 + 16) = sub_213BBFC50;
  *(_QWORD *)(v18 + 24) = v19;
  *(_BYTE *)a8 = 2;
  *(_QWORD *)(a8 + 8) = v16;
  *(_BYTE *)(a8 + 16) = 0;
  *(_QWORD *)(a8 + 24) = v18;
  return swift_retain();
}

uint64_t static FrameOperation.replan(next:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_BYTE *)a2 = 2;
  *(_QWORD *)(a2 + 8) = a1;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  return swift_retain();
}

uint64_t AnyChildCompletion.init<A, B>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = a1;
  v9[5] = a2;
  *(_QWORD *)(v4 + 16) = sub_213BBFC50;
  *(_QWORD *)(v4 + 24) = v9;
  return v4;
}

uint64_t sub_213BBF790(uint64_t a1, uint64_t a2, void (*a3)(char *, char *), uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  uint64_t v21;
  char *v22;
  char v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  char v26;
  void (*v27)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, char *);
  uint64_t v38;
  unint64_t v39;
  _BYTE v40[32];
  _BYTE v41[32];

  v36 = a4;
  v37 = a3;
  v35 = a2;
  v9 = sub_213BC934C();
  v32 = *(_QWORD *)(v9 - 8);
  v33 = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v30 - v11;
  v13 = *(_QWORD *)(a6 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_213BC934C();
  v16 = *(_QWORD *)(v31 - 8);
  v17 = MEMORY[0x24BDAC7A8](v31);
  v19 = (char *)&v30 - v18;
  v20 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = a1;
  sub_213BBDB24(a1, (uint64_t)v41);
  v23 = swift_dynamicCast();
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  if ((v23 & 1) != 0)
  {
    v24(v19, 0, 1, a5);
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v22, v19, a5);
    v25 = v35;
    sub_213BBDB24(v35, (uint64_t)v41);
    v26 = swift_dynamicCast();
    v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
    if ((v26 & 1) != 0)
    {
      v27(v12, 0, 1, a6);
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v12, a6);
      v37(v22, v15);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, a6);
      return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v22, a5);
    }
    v29 = v25;
    v27(v12, 1, 1, a6);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, a5);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v12, v33);
  }
  else
  {
    v29 = v35;
    v24(v19, 1, 1, a5);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v31);
  }
  sub_213BBDB24(v34, (uint64_t)v41);
  sub_213BBDB24(v29, (uint64_t)v40);
  v38 = 0;
  v39 = 0xE000000000000000;
  sub_213BC93A0();
  sub_213BC9190();
  sub_213BC94CC();
  sub_213BC9190();
  swift_bridgeObjectRelease();
  sub_213BC9190();
  sub_213BC94CC();
  sub_213BC9190();
  swift_bridgeObjectRelease();
  sub_213BC9190();
  sub_213BC940C();
  sub_213BC9190();
  sub_213BC940C();
  result = sub_213BC9424();
  __break(1u);
  return result;
}

uint64_t sub_213BBFB58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void (*v7)(uint64_t *, uint64_t);
  uint64_t *boxed_opaque_existential_0;
  uint64_t v10[4];

  v7 = *(void (**)(uint64_t *, uint64_t))(v3 + 16);
  v10[3] = a3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v10);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))(boxed_opaque_existential_0, a1, a3);
  v7(v10, a2);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v10);
}

uint64_t AnyChildCompletion.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t AnyChildCompletion.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AnyChildCompletion()
{
  return objc_opt_self();
}

uint64_t sub_213BBFC2C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213BBFC50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_213BBF790(a1, a2, *(void (**)(char *, char *))(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

unint64_t sub_213BBFC60()
{
  unint64_t result;

  result = qword_254D260F8[0];
  if (!qword_254D260F8[0])
  {
    result = MEMORY[0x2199BE3E4](&protocol conformance descriptor for FrameOperationType, &type metadata for FrameOperationType);
    atomic_store(result, qword_254D260F8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for FrameOperationType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FrameOperationType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_213BBFD80 + 4 * byte_213BC9CF5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_213BBFDB4 + 4 * byte_213BC9CF0[v4]))();
}

uint64_t sub_213BBFDB4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213BBFDBC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213BBFDC4);
  return result;
}

uint64_t sub_213BBFDD0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213BBFDD8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_213BBFDDC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213BBFDE4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_213BBFDF0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FrameOperationType()
{
  return &type metadata for FrameOperationType;
}

uint64_t sub_213BBFE08()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_213BBFE10(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_213BBFE40()
{
  swift_release();
  return swift_release();
}

uint64_t sub_213BBFE68(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_213BBFEB4(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
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

uint64_t sub_213BBFF2C(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t sub_213BBFF80(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t sub_213BBFFDC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t type metadata accessor for FrameOperation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FrameOperation);
}

uint64_t method lookup function for AnyChildCompletion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AnyChildCompletion.__allocating_init<A, B>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of AnyChildCompletion.completion<A>(controller:exitValue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t sub_213BC005C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  sub_213BC00B0(a1, a2, a3);
  return v6;
}

uint64_t sub_213BC00B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = qword_253F09190;
  *(_QWORD *)(v3 + v7) = dispatch_semaphore_create(0);
  v8 = qword_253F09198;
  *(_QWORD *)(v3 + v8) = dispatch_semaphore_create(0);
  v9 = qword_253F09188;
  *(_QWORD *)(v3 + v9) = dispatch_semaphore_create(0);
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a2;
  v10 = v3 + qword_253F091A0;
  v11 = sub_213BC90C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10, a3, v11);
  *(_BYTE *)(v3 + qword_253F09180) = 0;
  return v3;
}

uint64_t sub_213BC0160@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  char *v38;
  void (*v39)(char *, uint64_t);
  char *v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  char v55;
  uint64_t *v56;
  int v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  _QWORD *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;

  v5 = v4;
  v65 = a2;
  v66 = a3;
  v64 = a1;
  v69 = a4;
  v68 = sub_213BC9118();
  v6 = *(_QWORD *)(v68 - 8);
  v7 = MEMORY[0x24BDAC7A8](v68);
  v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v67 = (char *)&v62 - v10;
  if (qword_253F08DE8 != -1)
    swift_once();
  v11 = sub_213BC90AC();
  __swift_project_value_buffer(v11, (uint64_t)qword_253F09168);
  swift_retain_n();
  v12 = sub_213BC90A0();
  v13 = sub_213BC92BC();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v63 = v9;
    v16 = v15;
    v71 = v15;
    *(_DWORD *)v14 = 136315138;
    v17 = sub_213BBD520();
    v70 = sub_213BC6158(v17, v18, &v71);
    sub_213BC9364();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213BBB000, v12, v13, "FlowFrameRuntime MegaFrame.onInput. %s", v14, 0xCu);
    swift_arrayDestroy();
    v9 = v63;
    MEMORY[0x2199BE474](v16, -1, -1);
    MEMORY[0x2199BE474](v14, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v19 = qword_253F09180;
  if (*(_BYTE *)(v4 + qword_253F09180) == 1)
  {
    v20 = sub_213BC90A0();
    v21 = sub_213BC92BC();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_213BBB000, v20, v21, "MegaFrame.onInput Cancelled before.", v22, 2u);
      MEMORY[0x2199BE474](v22, -1, -1);
    }

    v71 = 0;
    v72 = 0xE000000000000000;
    sub_213BC93A0();
    v23 = *(_QWORD *)(v5 + 16);
    v25 = *(_QWORD *)(v23 + 96);
    v24 = *(_QWORD *)(v23 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v71 = v25;
    v72 = v24;
    sub_213BC9190();
    v26 = v71;
    v27 = v72;
    sub_213BC7ED4();
    result = swift_allocError();
    v29 = result;
    *v30 = v26;
    v30[1] = v27;
    goto LABEL_22;
  }
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = 0;
  *(_BYTE *)(v31 + 24) = -1;
  v32 = *(_QWORD *)(v4 + 16);
  v33 = (_QWORD *)swift_allocObject();
  v34 = v66;
  v33[2] = v66;
  v33[3] = v5;
  v33[4] = v31;
  swift_retain();
  swift_retain();
  v66 = v32;
  sub_213BBD318(v64, v65, (uint64_t)sub_213BC80E8, (uint64_t)v33, v34);
  swift_release();
  v35 = sub_213BC90A0();
  v36 = sub_213BC92BC();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v37 = 0;
    _os_log_impl(&dword_213BBB000, v35, v36, "FlowFrameRuntime MegaFrame.onInput wait.", v37, 2u);
    MEMORY[0x2199BE474](v37, -1, -1);
  }

  sub_213BC910C();
  v38 = v67;
  MEMORY[0x2199BDDC0](v9, v5 + qword_253F091A0);
  v39 = *(void (**)(char *, uint64_t))(v6 + 8);
  v40 = v9;
  v41 = v68;
  v39(v40, v68);
  sub_213BC931C();
  v39(v38, v41);
  if ((sub_213BC90D0() & 1) != 0)
  {
    v42 = sub_213BC90A0();
    v43 = sub_213BC92BC();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_213BBB000, v42, v43, "FlowFrameRuntime MegaFrame.onInput wait timeout.", v44, 2u);
      MEMORY[0x2199BE474](v44, -1, -1);
    }

    v71 = 0;
    v72 = 0xE000000000000000;
    sub_213BC93A0();
    v46 = *(_QWORD *)(v66 + 96);
    v45 = *(_QWORD *)(v66 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v71 = v46;
    v72 = v45;
    sub_213BC9190();
    v47 = v71;
    v48 = v72;
    sub_213BC6F5C();
  }
  else
  {
    if (*(_BYTE *)(v5 + v19) != 1)
    {
      swift_beginAccess();
      v57 = *(unsigned __int8 *)(v31 + 24);
      if (v57 != 255)
      {
        v29 = *(_QWORD *)(v31 + 16);
        v55 = v57 & 1;
        sub_213BC7D20(v29, v57 & 1);
        result = swift_release();
        goto LABEL_23;
      }
      v58 = sub_213BC90A0();
      v59 = sub_213BC92BC();
      if (os_log_type_enabled(v58, v59))
      {
        v60 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v60 = 0;
        _os_log_impl(&dword_213BBB000, v58, v59, "MegaFrame.onInput result not set.", v60, 2u);
        MEMORY[0x2199BE474](v60, -1, -1);
      }

      sub_213BBE064();
      v29 = swift_allocError();
      *v61 = 0xD000000000000020;
      v61[1] = 0x8000000213BCA6E0;
      goto LABEL_21;
    }
    v49 = sub_213BC90A0();
    v50 = sub_213BC92BC();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_213BBB000, v49, v50, "FlowFrameRuntime MegaFrame.onInput Cancelled after.", v51, 2u);
      MEMORY[0x2199BE474](v51, -1, -1);
    }

    v71 = 0;
    v72 = 0xE000000000000000;
    sub_213BC93A0();
    v53 = *(_QWORD *)(v66 + 96);
    v52 = *(_QWORD *)(v66 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v71 = v53;
    v72 = v52;
    sub_213BC9190();
    v47 = v71;
    v48 = v72;
    sub_213BC7ED4();
  }
  v29 = swift_allocError();
  *v54 = v47;
  v54[1] = v48;
LABEL_21:
  result = swift_release();
LABEL_22:
  v55 = 1;
LABEL_23:
  v56 = v69;
  *v69 = v29;
  *((_BYTE *)v56 + 8) = v55;
  return result;
}

uint64_t sub_213BC08D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned __int8 v9;

  v4 = *(_QWORD *)a1;
  v5 = *(_BYTE *)(a1 + 8);
  swift_beginAccess();
  if (*(unsigned __int8 *)(a3 + 24) != 255)
    sub_213BC683C(0x7475706E496E6FLL, 0xE700000000000000);
  swift_beginAccess();
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(unsigned __int8 *)(a3 + 24);
  if (v7 == 255)
  {
    sub_213BC7D20(v4, v5);
  }
  else
  {
    v5 = v7 & 1;
    v4 = *(_QWORD *)(a3 + 16);
  }
  swift_beginAccess();
  v8 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(a3 + 16) = v4;
  v9 = *(_BYTE *)(a3 + 24);
  *(_BYTE *)(a3 + 24) = v5;
  sub_213BC80F4(v6, v7);
  sub_213BC810C(v8, v9);
  return sub_213BC9334();
}

uint64_t sub_213BC09E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t result;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  char *v38;
  char *v39;
  void (*v40)(char *, uint64_t);
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  int v48;
  NSObject *v49;
  os_log_type_t v50;
  _BOOL4 v51;
  uint8_t *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t *v57;
  uint8_t *v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t *v68;
  _QWORD v69[4];
  unsigned __int8 v70;
  uint64_t v71;
  unint64_t v72;

  v4 = v3;
  v64 = a1;
  v65 = a2;
  v68 = a3;
  v5 = sub_213BC9118();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v66 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v67 = (char *)&v63 - v9;
  if (qword_253F08DE8 != -1)
    swift_once();
  v10 = sub_213BC90AC();
  __swift_project_value_buffer(v10, (uint64_t)qword_253F09168);
  swift_retain_n();
  v11 = sub_213BC90A0();
  v12 = sub_213BC92BC();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v63 = v6;
    v15 = v14;
    v71 = v14;
    *(_DWORD *)v13 = 136315138;
    v16 = sub_213BBD520();
    v69[0] = sub_213BC6158(v16, v17, &v71);
    sub_213BC9364();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213BBB000, v11, v12, "FlowFrameRuntime MegaFrame.execute. %s", v13, 0xCu);
    swift_arrayDestroy();
    v6 = v63;
    MEMORY[0x2199BE474](v15, -1, -1);
    MEMORY[0x2199BE474](v13, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v18 = qword_253F09180;
  if (*(_BYTE *)(v3 + qword_253F09180) != 1)
  {
    v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = 0u;
    v31 = v30 + 16;
    *(_OWORD *)(v30 + 32) = 0u;
    *(_BYTE *)(v30 + 48) = -1;
    v32 = *(_QWORD *)(v3 + 16);
    v33 = (_QWORD *)swift_allocObject();
    v34 = v65;
    v33[2] = v65;
    v33[3] = v4;
    v33[4] = v30;
    swift_retain();
    v63 = v30;
    swift_retain();
    v65 = v32;
    sub_213BBD3A4(v64, (uint64_t)sub_213BC7FA4, (uint64_t)v33, v34);
    swift_release();
    v35 = sub_213BC90A0();
    v36 = sub_213BC92BC();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_213BBB000, v35, v36, "FlowFrameRuntime MegaFrame.execute wait.", v37, 2u);
      MEMORY[0x2199BE474](v37, -1, -1);
    }

    v38 = v66;
    sub_213BC910C();
    v39 = v67;
    MEMORY[0x2199BDDC0](v38, v4 + qword_253F091A0);
    v40 = *(void (**)(char *, uint64_t))(v6 + 8);
    v40(v38, v5);
    sub_213BC931C();
    v40(v39, v5);
    if ((sub_213BC90D0() & 1) != 0)
    {
      v41 = sub_213BC90A0();
      v42 = sub_213BC92BC();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_213BBB000, v41, v42, "FlowFrameRuntime MegaFrame.execute wait timeout.", v43, 2u);
        MEMORY[0x2199BE474](v43, -1, -1);
      }

      v71 = 0;
      v72 = 0xE000000000000000;
      sub_213BC93A0();
      v45 = *(_QWORD *)(v65 + 96);
      v44 = *(_QWORD *)(v65 + 104);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v71 = v45;
      v72 = v44;
      sub_213BC9190();
      v46 = v71;
      v47 = v72;
      sub_213BC6F5C();
    }
    else
    {
      v48 = *(unsigned __int8 *)(v4 + v18);
      v49 = sub_213BC90A0();
      v50 = sub_213BC92BC();
      v51 = os_log_type_enabled(v49, v50);
      if (v48 != 1)
      {
        if (v51)
        {
          v58 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v58 = 0;
          _os_log_impl(&dword_213BBB000, v49, v50, "FlowFrameRuntime MegaFrame.execute wait complete.", v58, 2u);
          MEMORY[0x2199BE474](v58, -1, -1);
        }

        swift_beginAccess();
        sub_213BC7FB0(v31, (uint64_t)v69, &qword_254D262A0);
        if (v70 != 255)
        {
          sub_213BC7FF4((uint64_t)v69, (uint64_t)&v71);
          sub_213BC7FF4((uint64_t)&v71, (uint64_t)v68);
          return swift_release();
        }
        sub_213BBE028((uint64_t)v69, &qword_254D262A0);
        v59 = sub_213BC90A0();
        v60 = sub_213BC92BC();
        if (os_log_type_enabled(v59, v60))
        {
          v61 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v61 = 0;
          _os_log_impl(&dword_213BBB000, v59, v60, "MegaFrame.execute result not set.", v61, 2u);
          MEMORY[0x2199BE474](v61, -1, -1);
        }

        sub_213BBE064();
        v55 = swift_allocError();
        *v62 = 0xD000000000000020;
        v62[1] = 0x8000000213BCA660;
LABEL_21:
        v57 = v68;
        *v68 = v55;
        *((_BYTE *)v57 + 32) = 1;
        return swift_release();
      }
      if (v51)
      {
        v52 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_213BBB000, v49, v50, "FlowFrameRuntime MegaFrame.execute Cancelled after.", v52, 2u);
        MEMORY[0x2199BE474](v52, -1, -1);
      }

      v71 = 0;
      v72 = 0xE000000000000000;
      sub_213BC93A0();
      v54 = *(_QWORD *)(v65 + 96);
      v53 = *(_QWORD *)(v65 + 104);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v71 = v54;
      v72 = v53;
      sub_213BC9190();
      v46 = v71;
      v47 = v72;
      sub_213BC7ED4();
    }
    v55 = swift_allocError();
    *v56 = v46;
    v56[1] = v47;
    goto LABEL_21;
  }
  v19 = sub_213BC90A0();
  v20 = sub_213BC92BC();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_213BBB000, v19, v20, "MegaFrame.execute Cancelled before.", v21, 2u);
    MEMORY[0x2199BE474](v21, -1, -1);
  }

  v71 = 0;
  v72 = 0xE000000000000000;
  sub_213BC93A0();
  v22 = *(_QWORD *)(v4 + 16);
  v24 = *(_QWORD *)(v22 + 96);
  v23 = *(_QWORD *)(v22 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v71 = v24;
  v72 = v23;
  sub_213BC9190();
  v25 = v71;
  v26 = v72;
  sub_213BC7ED4();
  result = swift_allocError();
  *v28 = v25;
  v28[1] = v26;
  v29 = v68;
  *v68 = result;
  *((_BYTE *)v29 + 32) = 1;
  return result;
}

uint64_t sub_213BC11DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  _BYTE v7[40];
  _BYTE v8[40];
  _BYTE v9[40];

  v4 = a3 + 16;
  swift_beginAccess();
  sub_213BC7FB0(v4, (uint64_t)v9, &qword_254D262A0);
  v5 = v9[32];
  sub_213BBE028((uint64_t)v9, &qword_254D262A0);
  if (v5 != 255)
    sub_213BC683C(0x65747563657865, 0xE700000000000000);
  swift_beginAccess();
  sub_213BC7FB0(v4, (uint64_t)v8, &qword_254D262A0);
  sub_213BC7FB0(a1, (uint64_t)v7, &qword_254D26068);
  if (v8[32] == 255)
  {
    sub_213BC7FF4((uint64_t)v7, (uint64_t)v9);
    sub_213BBE028((uint64_t)v8, &qword_254D262A0);
  }
  else
  {
    sub_213BBE028((uint64_t)v7, &qword_254D26068);
    sub_213BC7FF4((uint64_t)v8, (uint64_t)v9);
  }
  swift_beginAccess();
  sub_213BC803C((uint64_t)v9, v4);
  return sub_213BC9334();
}

uint64_t sub_213BC1330@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t result;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  int v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v56;
  unint64_t v57;

  v5 = v4;
  if (qword_253F08DE8 != -1)
    swift_once();
  v8 = sub_213BC90AC();
  __swift_project_value_buffer(v8, (uint64_t)qword_253F09168);
  swift_retain_n();
  v9 = sub_213BC90A0();
  v10 = sub_213BC92BC();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = a4;
    v13 = a3;
    v14 = swift_slowAlloc();
    v56 = v14;
    *(_DWORD *)v11 = 136315138;
    v15 = sub_213BBD520();
    sub_213BC6158(v15, v16, &v56);
    sub_213BC9364();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213BBB000, v9, v10, "FlowFrameRuntime MegaFrame.action. %s", v11, 0xCu);
    swift_arrayDestroy();
    v17 = v14;
    a3 = v13;
    a4 = v12;
    MEMORY[0x2199BE474](v17, -1, -1);
    MEMORY[0x2199BE474](v11, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v18 = qword_253F09180;
  if (*(_BYTE *)(v4 + qword_253F09180) == 1)
  {
    v19 = sub_213BC90A0();
    v20 = sub_213BC92BC();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_213BBB000, v19, v20, "MegaFrame.action Cancelled before.", v21, 2u);
      MEMORY[0x2199BE474](v21, -1, -1);
    }

    v56 = 0;
    v57 = 0xE000000000000000;
    sub_213BC93A0();
    v22 = *(_QWORD *)(v5 + 16);
    v24 = *(_QWORD *)(v22 + 96);
    v23 = *(_QWORD *)(v22 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v56 = v24;
    v57 = v23;
    sub_213BC9190();
    v25 = v56;
    v26 = v57;
    sub_213BC7ED4();
    result = swift_allocError();
    *v28 = v25;
    v28[1] = v26;
    *(_QWORD *)(a4 + 16) = 0;
    *(_QWORD *)(a4 + 24) = 0;
    *(_QWORD *)a4 = result;
    *(_QWORD *)(a4 + 8) = 0;
    goto LABEL_21;
  }
  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = 0u;
  *(_OWORD *)(v29 + 32) = 0u;
  *(_BYTE *)(v29 + 48) = -1;
  v30 = *(_QWORD *)(v4 + 16);
  v31 = (_QWORD *)swift_allocObject();
  v31[2] = a3;
  v31[3] = v4;
  v31[4] = v29;
  swift_retain();
  swift_retain();
  sub_213BBD420(a1, a2, (uint64_t)sub_213BC7E98, (uint64_t)v31, a3);
  swift_release();
  v32 = sub_213BC90A0();
  v33 = sub_213BC92BC();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_213BBB000, v32, v33, "FlowFrameRuntime MegaFrame.action wait.", v34, 2u);
    MEMORY[0x2199BE474](v34, -1, -1);
  }

  sub_213BC9328();
  if (*(_BYTE *)(v5 + v18) == 1)
  {
    v35 = sub_213BC90A0();
    v36 = sub_213BC92BC();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_213BBB000, v35, v36, "MegaFrame.action Cancelled after.", v37, 2u);
      MEMORY[0x2199BE474](v37, -1, -1);
    }

    v56 = 0;
    v57 = 0xE000000000000000;
    sub_213BC93A0();
    v39 = *(_QWORD *)(v30 + 96);
    v38 = *(_QWORD *)(v30 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v56 = v39;
    v57 = v38;
    sub_213BC9190();
    v40 = v56;
    v41 = v57;
    sub_213BC7ED4();
    v42 = swift_allocError();
    *v43 = v40;
    v43[1] = v41;
LABEL_20:
    result = swift_release();
    *(_QWORD *)a4 = v42;
    *(_QWORD *)(a4 + 8) = 0;
    *(_QWORD *)(a4 + 16) = 0;
    *(_QWORD *)(a4 + 24) = 0;
LABEL_21:
    *(_BYTE *)(a4 + 32) = 1;
    return result;
  }
  swift_beginAccess();
  v44 = *(unsigned __int8 *)(v29 + 48);
  if (v44 == 255)
  {
    v45 = sub_213BC90A0();
    v46 = sub_213BC92BC();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_213BBB000, v45, v46, "MegaFrame.action result not set.", v47, 2u);
      MEMORY[0x2199BE474](v47, -1, -1);
    }

    sub_213BBE064();
    v42 = swift_allocError();
    *v48 = 0xD00000000000001FLL;
    v48[1] = 0x8000000213BCA5E0;
    goto LABEL_20;
  }
  v50 = *(_QWORD *)(v29 + 32);
  v49 = *(_QWORD *)(v29 + 40);
  v51 = v44 & 1;
  v53 = *(_QWORD *)(v29 + 16);
  v52 = *(_QWORD *)(v29 + 24);
  sub_213BC7EA4(v53, v52, v50, v49, v44 & 1);
  result = swift_release();
  *(_QWORD *)a4 = v53;
  *(_QWORD *)(a4 + 8) = v52;
  *(_QWORD *)(a4 + 16) = v50;
  *(_QWORD *)(a4 + 24) = v49;
  *(_BYTE *)(a4 + 32) = v51;
  return result;
}

uint64_t sub_213BC1928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_BYTE *)(a1 + 32);
  swift_beginAccess();
  if (*(unsigned __int8 *)(a3 + 48) != 255)
    sub_213BC683C(0x6E6F69746361, 0xE600000000000000);
  swift_beginAccess();
  v9 = *(unsigned __int8 *)(a3 + 48);
  v19 = *(_QWORD *)(a3 + 24);
  v20 = *(_QWORD *)(a3 + 16);
  v17 = *(_QWORD *)(a3 + 40);
  v18 = *(_QWORD *)(a3 + 32);
  if (v9 == 255)
  {
    sub_213BC7EA4(v4, v5, v6, v7, v8);
    v16 = v8;
  }
  else
  {
    v16 = v9 & 1;
    v4 = *(_QWORD *)(a3 + 16);
    v5 = *(_QWORD *)(a3 + 24);
    v6 = *(_QWORD *)(a3 + 32);
    v7 = *(_QWORD *)(a3 + 40);
  }
  swift_beginAccess();
  v11 = *(_QWORD *)(a3 + 16);
  v10 = *(_QWORD *)(a3 + 24);
  v12 = *(_QWORD *)(a3 + 32);
  v13 = *(_QWORD *)(a3 + 40);
  *(_QWORD *)(a3 + 16) = v4;
  *(_QWORD *)(a3 + 24) = v5;
  *(_QWORD *)(a3 + 32) = v6;
  *(_QWORD *)(a3 + 40) = v7;
  v14 = *(_BYTE *)(a3 + 48);
  *(_BYTE *)(a3 + 48) = v16;
  sub_213BC7F18(v20, v19, v18, v17, v9);
  sub_213BC7F3C(v11, v10, v12, v13, v14);
  return sub_213BC9334();
}

uint64_t sub_213BC1A90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;

  if (qword_253F08DE8 != -1)
    swift_once();
  v4 = sub_213BC90AC();
  __swift_project_value_buffer(v4, (uint64_t)qword_253F09168);
  swift_retain_n();
  v5 = sub_213BC90A0();
  v6 = sub_213BC92BC();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v12 = v8;
    *(_DWORD *)v7 = 136315138;
    v9 = sub_213BBD520();
    sub_213BC6158(v9, v10, &v12);
    sub_213BC9364();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213BBB000, v5, v6, "FlowFrameRuntime MegaFrame.exit. %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199BE474](v8, -1, -1);
    MEMORY[0x2199BE474](v7, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  return sub_213BBD4AC(a1, a2);
}

uint64_t sub_213BC1C6C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v9;

  if (qword_253F08DE8 != -1)
    swift_once();
  v1 = sub_213BC90AC();
  __swift_project_value_buffer(v1, (uint64_t)qword_253F09168);
  swift_retain_n();
  v2 = sub_213BC90A0();
  v3 = sub_213BC92BC();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136315138;
    v6 = sub_213BBD520();
    sub_213BC6158(v6, v7, &v9);
    sub_213BC9364();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213BBB000, v2, v3, "FlowFrameRuntime MegaFrame.cancel. %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199BE474](v5, -1, -1);
    MEMORY[0x2199BE474](v4, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  *(_BYTE *)(v0 + qword_253F09180) = 1;
  sub_213BC9334();
  sub_213BC9334();
  return sub_213BC9334();
}

uint64_t sub_213BC1E48()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_213BC93A0();
  sub_213BC9190();
  swift_bridgeObjectRetain();
  sub_213BC9190();
  swift_bridgeObjectRelease();
  sub_213BC9190();
  sub_213BC90C4();
  sub_213BC940C();
  sub_213BC9190();
  type metadata accessor for AnyFrame(0, *(_QWORD *)(v1 + 80), v2, v3);
  sub_213BC943C();
  sub_213BC9190();
  sub_213BC9190();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_213BC1FF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_release();
  v1 = v0 + qword_253F091A0;
  v2 = sub_213BC90C4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t sub_213BC2078()
{
  return sub_213BC610C((void (*)(void))sub_213BC1FF4);
}

uint64_t sub_213BC2084()
{
  return sub_213BC1E48();
}

uint64_t sub_213BC20A4(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 40) = result;
  return result;
}

uint64_t sub_213BC20AC()
{
  sub_213BC820C();
  return swift_deallocClassInstance();
}

uint64_t sub_213BC20C8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t Strong;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = *(_QWORD *)(*(_QWORD *)(*a1 + 80) + 80);
  sub_213BC2194((uint64_t)a1);
  *a2 = v5;
  a2[1] = v6;
  Strong = swift_weakLoadStrong();
  sub_213BC2194(Strong);
  v9 = v8;
  v11 = v10;
  swift_release();
  a2[2] = v9;
  a2[3] = v11;
  v12 = *(_QWORD **)(a1[2] + 16);
  v13 = v12[3];
  a2[4] = v12[2];
  a2[5] = v13;
  v14 = v12[13];
  a2[6] = v12[12];
  a2[7] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  a2[8] = sub_213BC2254();
  type metadata accessor for InstrumentedCancellableStack.TrackedFrame(0, v4, v15, v16);
  sub_213BC9094();
  return swift_release();
}

uint64_t sub_213BC2194(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!a1)
    return 0;
  swift_retain();
  v1 = sub_213BC9154();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D26288);
  v2 = swift_allocObject();
  v3 = MEMORY[0x24BEE4568];
  *(_OWORD *)(v2 + 16) = xmmword_213BC9E30;
  v4 = MEMORY[0x24BEE45B8];
  *(_QWORD *)(v2 + 56) = v3;
  *(_QWORD *)(v2 + 64) = v4;
  *(_QWORD *)(v2 + 32) = v1;
  sub_213BC916C();
  swift_release();
  return v1;
}

uint64_t sub_213BC2254()
{
  uint64_t result;
  uint64_t v1;

  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = sub_213BC2254();
    swift_release();
    result = v1 + 1;
    if (__OFADD__(v1, 1))
      __break(1u);
  }
  return result;
}

BOOL sub_213BC2298(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for InstrumentedCancellableStack.TrackedFrame(0, a3, a3, a4);
  v4 = sub_213BC22EC();
  return v4 == sub_213BC22EC();
}

uint64_t sub_213BC22EC()
{
  sub_213BC949C();
  sub_213BC2330();
  return sub_213BC94B4();
}

uint64_t sub_213BC2330()
{
  swift_bridgeObjectRetain();
  sub_213BC9184();
  return swift_bridgeObjectRelease();
}

uint64_t sub_213BC2374()
{
  uint64_t *v0;
  uint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = v0;
  v3 = v0[4];
  v2 = v0[5];
  swift_bridgeObjectRetain();
  sub_213BC9190();
  v5 = v0[6];
  v4 = v0[7];
  swift_bridgeObjectRetain();
  sub_213BC9190();
  swift_bridgeObjectRelease();
  v6 = sub_213BC2560(0, v3, v2);
  swift_bridgeObjectRelease();
  sub_213BC9304();
  if (qword_253F08DF0 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D26288);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_213BC9E40;
  v8 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE0D00];
  v9 = sub_213BC7DB4();
  *(_QWORD *)(v7 + 32) = v3;
  *(_QWORD *)(v7 + 40) = v2;
  *(_QWORD *)(v7 + 96) = v8;
  *(_QWORD *)(v7 + 104) = v9;
  *(_QWORD *)(v7 + 64) = v9;
  *(_QWORD *)(v7 + 72) = v5;
  *(_QWORD *)(v7 + 80) = v4;
  v10 = v1[8];
  v11 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v7 + 136) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v7 + 144) = v11;
  *(_QWORD *)(v7 + 112) = v10;
  v12 = *v1;
  v13 = v1[1];
  *(_QWORD *)(v7 + 176) = v8;
  *(_QWORD *)(v7 + 184) = v9;
  *(_QWORD *)(v7 + 152) = v12;
  *(_QWORD *)(v7 + 160) = v13;
  v14 = v1[2];
  v15 = v1[3];
  *(_QWORD *)(v7 + 216) = v8;
  *(_QWORD *)(v7 + 224) = v9;
  v16 = MEMORY[0x24BEE4260];
  *(_QWORD *)(v7 + 192) = v14;
  *(_QWORD *)(v7 + 200) = v15;
  v17 = MEMORY[0x24BEE42B0];
  *(_QWORD *)(v7 + 256) = v16;
  *(_QWORD *)(v7 + 264) = v17;
  *(_BYTE *)(v7 + 232) = -v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_213BC9064();
  return swift_bridgeObjectRelease();
}

unint64_t sub_213BC2560(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v4;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t result;
  unint64_t v12;
  int v13;
  uint64_t v14;
  _QWORD v15[2];
  uint64_t v16;

  if ((a3 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a3) & 0xF;
  else
    v4 = a2 & 0xFFFFFFFFFFFFLL;
  if (!v4)
    return a1;
  v7 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v7) = 1;
  v8 = 4 << v7;
  v16 = a3 & 0xFFFFFFFFFFFFFFLL;
  v14 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v9 = 15;
  while (1)
  {
    v10 = v9 & 0xC;
    result = v9;
    if (v10 == v8)
      result = sub_213BC664C(v9, a2, a3);
    v12 = result >> 16;
    if (result >> 16 >= v4)
      break;
    if ((a3 & 0x1000000000000000) != 0)
    {
      result = sub_213BC91C0();
      v13 = result;
      if (v10 != v8)
        goto LABEL_20;
    }
    else if ((a3 & 0x2000000000000000) != 0)
    {
      v15[0] = a2;
      v15[1] = v16;
      v13 = *((unsigned __int8 *)v15 + v12);
      if (v10 != v8)
        goto LABEL_20;
    }
    else
    {
      result = v14;
      if ((a2 & 0x1000000000000000) == 0)
        result = sub_213BC93C4();
      v13 = *(unsigned __int8 *)(result + v12);
      if (v10 != v8)
      {
LABEL_20:
        if ((a3 & 0x1000000000000000) == 0)
          goto LABEL_8;
        goto LABEL_21;
      }
    }
    result = sub_213BC664C(v9, a2, a3);
    v9 = result;
    if ((a3 & 0x1000000000000000) == 0)
    {
LABEL_8:
      v9 = (v9 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_9;
    }
LABEL_21:
    if (v4 <= v9 >> 16)
      goto LABEL_28;
    v9 = sub_213BC91A8();
LABEL_9:
    a1 = (v13 + a1);
    if (4 * v4 == v9 >> 14)
      return a1;
  }
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_213BC26F4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_213BC92F8();
  if (qword_253F08DF0 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D26288);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_213BC9E30;
  v3 = *v0;
  v2 = v0[1];
  *(_QWORD *)(v1 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v1 + 64) = sub_213BC7DB4();
  *(_QWORD *)(v1 + 32) = v3;
  *(_QWORD *)(v1 + 40) = v2;
  swift_bridgeObjectRetain();
  sub_213BC9064();
  return swift_bridgeObjectRelease();
}

uint64_t sub_213BC2804()
{
  sub_213BC949C();
  sub_213BC2330();
  return sub_213BC94B4();
}

BOOL sub_213BC2844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213BC2298(a1, a2, *(_QWORD *)(a3 + 16), a4);
}

uint64_t sub_213BC284C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_213BC2854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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

  v5 = type metadata accessor for InstrumentedCancellableStack.TrackedFrame(0, *(_QWORD *)(*(_QWORD *)v4 + 376), a3, a4);
  v6 = sub_213BC922C();
  if (MEMORY[0x2199BDF04](v6, v5))
  {
    v7 = MEMORY[0x2199BE3E4](&unk_213BCA050, v5);
    v8 = sub_213BC6BA8(v6, v5, v7);
  }
  else
  {
    v8 = MEMORY[0x24BEE4B08];
  }
  swift_bridgeObjectRelease();
  sub_213BC2F2C(v8, v9, v10, v11);
  swift_bridgeObjectRelease();
  v12 = sub_213BC820C();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_213BC2900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_213BC2854(a1, a2, a3, a4);
  return swift_deallocClassInstance();
}

uint64_t sub_213BC291C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v18 = *(_QWORD *)(*(_QWORD *)v4 + 376);
  v5 = type metadata accessor for InstrumentedCancellableStack(0, v18, a3, a4);
  v8 = type metadata accessor for InstrumentedCancellableStack.TrackedFrame(0, v18, v6, v7);
  v9 = MEMORY[0x2199BE3E4](&unk_213BCA170, v5);
  v19 = sub_213BC2A20((void (*)(char *, char *))sub_213BC7DF8, (uint64_t)&v17, v5, v8, MEMORY[0x24BEE4078], v9, MEMORY[0x24BEE40A8], v10);
  v11 = sub_213BC9274();
  MEMORY[0x2199BE3E4](&unk_213BCA050, v8);
  MEMORY[0x2199BE3E4](MEMORY[0x24BEE12C8], v11);
  v12 = sub_213BC9298();
  sub_213BC2F2C(v12, v13, v14, v15);
  return swift_bridgeObjectRelease();
}

uint64_t sub_213BC2A20(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  void (*v15)(char *, char *, uint64_t);
  uint64_t AssociatedTypeWitness;
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
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  char *v32;
  uint64_t result;
  char *v34;
  char *v35;
  char *v36;
  _QWORD v37[2];
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  char *v52;
  uint64_t v53;
  void (*v54)(char *, char *);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v40 = a8;
  v41 = a5;
  v9 = v8;
  v53 = a4;
  v54 = a1;
  v55 = a2;
  v39 = *(_QWORD *)(a5 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v52 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v51 = (char *)v37 - v12;
  v45 = v13;
  v15 = v14;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v17 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v38 = (char *)v37 - v18;
  v19 = sub_213BC934C();
  v42 = *(_QWORD *)(v19 - 8);
  v43 = v19;
  v20 = MEMORY[0x24BDAC7A8](v19);
  v49 = (char *)v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v37 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v37[1] = (char *)v37 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v48 = *((_QWORD *)v15 - 1);
  MEMORY[0x24BDAC7A8](v27);
  v47 = (char *)v37 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = swift_getAssociatedTypeWitness();
  v44 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v46 = (char *)v37 - v29;
  v30 = v15;
  v31 = sub_213BC91E4();
  v57 = sub_213BC93F4();
  v53 = sub_213BC9400();
  sub_213BC93DC();
  (*(void (**)(char *, _QWORD, _QWORD *))(v48 + 16))(v47, v50, v15);
  v32 = v46;
  v50 = v30;
  result = sub_213BC91D8();
  if (v31 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v31)
  {
    swift_getAssociatedConformanceWitness();
    while (1)
    {
      sub_213BC9358();
      result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v24, 1, AssociatedTypeWitness);
      if ((_DWORD)result == 1)
        goto LABEL_18;
      v54(v24, v52);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v52, v41);
        return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      }
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      sub_213BC93E8();
      if (!--v31)
      {
        v34 = v49;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  v34 = v49;
LABEL_9:
  sub_213BC9358();
  v52 = *(char **)(v17 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v34, 1, AssociatedTypeWitness) == 1)
  {
    v35 = v49;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v43);
    return v57;
  }
  else
  {
    v50 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    v36 = v38;
    v35 = v49;
    while (1)
    {
      v50(v36, v35, AssociatedTypeWitness);
      v54(v36, v51);
      if (v9)
        break;
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
      sub_213BC93E8();
      sub_213BC9358();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v35, 1, AssociatedTypeWitness) == 1)
        goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v51, v41);
  }
}

uint64_t sub_213BC2F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for InstrumentedCancellableStack.TrackedFrame(0, *(_QWORD *)(*v4 + 376), a3, a4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  MEMORY[0x2199BE3E4](&unk_213BCA050, v6);
  sub_213BC9280();
  swift_bridgeObjectRelease();
  v7 = sub_213BC928C();
  MEMORY[0x2199BE3E4](MEMORY[0x24BEE1718], v7);
  sub_213BC9208();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_213BC9280();
  sub_213BC9208();
  swift_bridgeObjectRelease();
  v4[6] = a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_213BC3090()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = sub_213BC8248();
  return sub_213BC291C(v0, v1, v2, v3);
}

uint64_t *sub_213BC30A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v9 = a1;
  v4 = sub_213BC8274((uint64_t)&v9, a2, a3, a4);
  sub_213BC291C((uint64_t)v4, v5, v6, v7);
  return v4;
}

uint64_t *sub_213BC30DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = sub_213BC8354(a1, a2, a3, a4);
  sub_213BC291C((uint64_t)v4, v5, v6, v7);
  return v4;
}

uint64_t *sub_213BC3104(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = sub_213BC8EA8(a1);
  v2 = swift_retain();
  sub_213BC291C(v2, v3, v4, v5);
  return v1;
}

_QWORD *sub_213BC3130()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = swift_allocObject();
  return sub_213BC3160(v0, v1, v2, v3);
}

_QWORD *sub_213BC3160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v5 = type metadata accessor for InstrumentedCancellableStack.TrackedFrame(0, *(_QWORD *)(*(_QWORD *)v4 + 376), a3, a4);
  swift_retain();
  MEMORY[0x2199BE3E4](&unk_213BCA050, v5);
  *(_QWORD *)(v4 + 48) = sub_213BC9130();
  swift_release();
  *(_BYTE *)(v4 + 40) = 0;
  return sub_213BC89A8();
}

uint64_t *sub_213BC31C0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213BC30A4(*a1, a2, a3, a4);
}

uint64_t RuntimeConfiguration.perFrameOperationTimeout.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_213BC90C4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t RuntimeConfiguration.init()@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = 300;
  v2 = *MEMORY[0x24BEE5420];
  v3 = sub_213BC90C4();
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t RuntimeConfiguration.init(perFrameOperationTimeout:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_213BC90C4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t sub_213BC3288(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 136)) = a1;
  return swift_release();
}

uint64_t sub_213BC32A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v5 = *v4;
  v15 = *(uint64_t *)((char *)v4 + *(_QWORD *)(*v4 + 120));
  v12 = *(_OWORD *)(v5 + 80);
  v13 = *(_QWORD *)(v5 + 96);
  v6 = type metadata accessor for CancellableStack(0, v12, a3, a4);
  swift_retain();
  v7 = MEMORY[0x2199BE3E4](&unk_213BCA170, v6);
  v9 = sub_213BC2A20((void (*)(char *, char *))sub_213BC6810, (uint64_t)&v11, v6, MEMORY[0x24BEE0D00], MEMORY[0x24BEE4078], v7, MEMORY[0x24BEE40A8], v8);
  swift_release();
  v15 = 0x203A73656D617246;
  v16 = 0xE90000000000005BLL;
  v14 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D26228);
  sub_213BC7174(&qword_254D26230, &qword_254D26228, MEMORY[0x24BEE12B0]);
  sub_213BC9148();
  swift_bridgeObjectRelease();
  sub_213BC9190();
  swift_bridgeObjectRelease();
  sub_213BC9190();
  return v15;
}

uint64_t sub_213BC33F4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  _QWORD v4[2];

  if (swift_weakLoadStrong())
  {
    v4[0] = 0;
    v4[1] = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_213BC93A0();
    sub_213BC9190();
    sub_213BC9190();
    swift_bridgeObjectRelease();
    sub_213BC9190();
    sub_213BC9190();
    swift_bridgeObjectRelease();
    sub_213BC9190();
    sub_213BC9190();
    swift_bridgeObjectRelease();
    sub_213BC9190();
    sub_213BC9190();
    swift_bridgeObjectRelease();
    sub_213BC9190();
    result = swift_release();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_213BC93A0();
    swift_bridgeObjectRelease();
    strcpy((char *)v4, "{namespace: ");
    BYTE5(v4[1]) = 0;
    HIWORD(v4[1]) = -5120;
    sub_213BC9190();
    swift_bridgeObjectRelease();
    sub_213BC9190();
    sub_213BC9190();
    swift_bridgeObjectRelease();
    result = sub_213BC9190();
  }
  v3 = v4[1];
  *a1 = v4[0];
  a1[1] = v3;
  return result;
}

uint64_t **FlowFrameRuntime.__allocating_init(frameFactoryLoader:configuration:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t **v6;

  v3 = v2;
  swift_allocObject();
  v6 = sub_213BC6EB0(a1, a2);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 88) - 8) + 8))(a1);
  return v6;
}

uint64_t **FlowFrameRuntime.init(frameFactoryLoader:configuration:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t **v5;

  v4 = *v2;
  v5 = sub_213BC6EB0(a1, a2);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v4 + 88) - 8) + 8))(a1);
  return v5;
}

_QWORD *sub_213BC3720(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  type metadata accessor for InstrumentedCancellableStack(0, *(_QWORD *)(v4 + 80), a3, a4);
  v5 = swift_allocObject();
  return sub_213BC3160(v5, v6, v7, v8);
}

uint64_t sub_213BC3758()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t);
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;

  v0 = sub_213BC90C4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (uint64_t *)((char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = sub_213BC9118();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  sub_213BC910C();
  *v3 = 250;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5410], v0);
  MEMORY[0x2199BDDC0](v8, v3);
  (*(void (**)(_QWORD *, uint64_t))(v1 + 8))(v3, v0);
  v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v8, v4);
  LOBYTE(v0) = sub_213BC931C();
  v11(v10, v4);
  if ((v0 & 1) == 0)
    return sub_213BC9334();
  if (qword_253F08DE8 != -1)
    swift_once();
  v13 = sub_213BC90AC();
  __swift_project_value_buffer(v13, (uint64_t)qword_253F09168);
  v14 = sub_213BC90A0();
  v15 = sub_213BC92C8();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_213BBB000, v14, v15, "FlowFrameRuntime is blocked: attempting to reset it.", v16, 2u);
    MEMORY[0x2199BE474](v16, -1, -1);
  }

  return sub_213BC3970();
}

uint64_t sub_213BC3970()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD);
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint8_t *v24;
  char *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  void (*v36)(uint64_t);
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  char *v45;
  _QWORD *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(_QWORD *, uint64_t);
  unsigned int v51;
  void (*v52)(_QWORD *, _QWORD, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v0 = sub_213BC9088();
  v48 = *(_QWORD *)(v0 - 8);
  v49 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v47 = (char *)&v47 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_213BC90C4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char **)((char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v56 = sub_213BC9118();
  v6 = *(_QWORD *)(v56 - 8);
  v7 = MEMORY[0x24BDAC7A8](v56);
  v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v47 - v10;
  if (qword_253F08DE8 != -1)
    swift_once();
  v12 = sub_213BC90AC();
  v54 = __swift_project_value_buffer(v12, (uint64_t)qword_253F09168);
  v13 = sub_213BC90A0();
  v14 = sub_213BC92BC();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_213BBB000, v13, v14, "FlowFrameRuntime reset, cancel stack.", v15, 2u);
    MEMORY[0x2199BE474](v15, -1, -1);
  }

  v16 = v55;
  *(_BYTE *)(*(_QWORD *)(v55 + *(_QWORD *)(*(_QWORD *)v55 + 120)) + 40) = 1;
  v17 = *(_QWORD *)(v16 + *(_QWORD *)(*(_QWORD *)v16 + 112));
  sub_213BC910C();
  *v5 = 250;
  v18 = *(void (**)(_QWORD))(v3 + 104);
  v51 = *MEMORY[0x24BEE5410];
  v52 = (void (*)(_QWORD *, _QWORD, uint64_t))v18;
  v18(v5);
  MEMORY[0x2199BDDC0](v9, v5);
  v50 = *(void (**)(_QWORD *, uint64_t))(v3 + 8);
  v50(v5, v2);
  v19 = *(void (**)(char *, uint64_t))(v6 + 8);
  v20 = v56;
  v19(v9, v56);
  v53 = v17;
  sub_213BC931C();
  v19(v11, v20);
  if ((sub_213BC90D0() & 1) == 0)
    goto LABEL_14;
  v21 = sub_213BC90A0();
  v22 = sub_213BC92BC();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_213BBB000, v21, v22, "FlowFrameRuntime reset semaphone locked. Attempting cancel.", v23, 2u);
    v24 = v23;
    v16 = v55;
    MEMORY[0x2199BE474](v24, -1, -1);
  }

  if (*(_QWORD *)(v16 + *(_QWORD *)(*(_QWORD *)v16 + 136)))
  {
    swift_retain();
    sub_213BC1C6C();
    swift_release();
  }
  sub_213BC910C();
  *v5 = 250;
  v52(v5, v51, v2);
  MEMORY[0x2199BDDC0](v9, v5);
  v50(v5, v2);
  v25 = v9;
  v26 = v56;
  v19(v25, v56);
  sub_213BC931C();
  v19(v11, v26);
  if ((sub_213BC90D0() & 1) != 0)
  {
    if (*(_QWORD *)(v16 + *(_QWORD *)(*(_QWORD *)v16 + 136)))
    {
      swift_retain_n();
      v27 = sub_213BC90A0();
      v28 = sub_213BC92C8();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = (uint8_t *)swift_slowAlloc();
        v30 = swift_slowAlloc();
        v58 = v30;
        *(_DWORD *)v29 = 136315138;
        v31 = sub_213BC1E48();
        v57 = sub_213BC6158(v31, v32, &v58);
        sub_213BC9364();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_213BBB000, v27, v28, "'%s' is stuck on the stack! This flow may not have exited properly by calling its completion handler", v29, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2199BE474](v30, -1, -1);
        MEMORY[0x2199BE474](v29, -1, -1);
        swift_release();

      }
      else
      {

        swift_release_n();
      }
    }
    v42 = sub_213BC90A0();
    v43 = sub_213BC92BC();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_213BBB000, v42, v43, "FlowFrameRuntime reset semaphone locked. Unable to continue.", v44, 2u);
      MEMORY[0x2199BE474](v44, -1, -1);
    }

    sub_213BC9310();
    if (qword_253F08DF0 != -1)
      swift_once();
    v45 = v47;
    sub_213BC907C();
    sub_213BC9070();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v45, v49);
    sub_213BC6F5C();
    swift_allocError();
    *v46 = 0xD000000000000029;
    v46[1] = 0x8000000213BCA450;
    swift_willThrow();
    return sub_213BC9334();
  }
  else
  {
LABEL_14:
    v33 = sub_213BC90A0();
    v34 = sub_213BC92BC();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_213BBB000, v33, v34, "FlowFrameRuntime reset, clear stack.", v35, 2u);
      MEMORY[0x2199BE474](v35, -1, -1);
    }

    v36 = *(void (**)(uint64_t))(**(_QWORD **)(v16 + *(_QWORD *)(*(_QWORD *)v16 + 120)) + 200);
    v37 = swift_retain();
    v36(v37);
    swift_release();
    v38 = sub_213BC90A0();
    v39 = sub_213BC92BC();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_213BBB000, v38, v39, "FlowFrameRuntime reset finished.", v40, 2u);
      MEMORY[0x2199BE474](v40, -1, -1);
    }

    return sub_213BC9334();
  }
}

uint64_t sub_213BC40B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char *v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t (**v30)(uint64_t);
  void *v31;
  char *v32;
  char *v33;
  uint64_t v34;
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
  uint64_t v47;
  _QWORD aBlock[6];

  v4 = v3;
  v36 = a2;
  v37 = a3;
  v39 = a1;
  v5 = *v3;
  v6 = sub_213BC90DC();
  v45 = *(_QWORD *)(v6 - 8);
  v46 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v44 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_213BC9100();
  v42 = *(_QWORD *)(v8 - 8);
  v43 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v40 = v5;
  v41 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(v5 + 80);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v38 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_213BC90E8();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_253F08DE8 != -1)
    swift_once();
  v18 = sub_213BC90AC();
  __swift_project_value_buffer(v18, (uint64_t)qword_253F09168);
  v19 = sub_213BC90A0();
  v20 = sub_213BC92BC();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_213BBB000, v19, v20, "FlowFrameRuntime handle.", v21, 2u);
    MEMORY[0x2199BE474](v21, -1, -1);
  }

  v22 = (uint64_t (*)(uint64_t))swift_allocObject();
  v23 = v36;
  v24 = v37;
  *((_QWORD *)v22 + 2) = v4;
  *((_QWORD *)v22 + 3) = v23;
  *((_QWORD *)v22 + 4) = v24;
  *(_BYTE *)(*(_QWORD *)((char *)v4 + *(_QWORD *)(*v4 + 120)) + 40) = 1;
  sub_213BC7014();
  (*(void (**)(char *, _QWORD, uint64_t))(v15 + 104))(v17, *MEMORY[0x24BEE5480], v14);
  swift_retain();
  swift_retain();
  v25 = (void *)sub_213BC92EC();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  v26 = v38;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v38, v39, v11);
  v27 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v28 = (char *)swift_allocObject();
  *((_QWORD *)v28 + 2) = v11;
  v29 = v40;
  *((_QWORD *)v28 + 3) = *(_QWORD *)(v40 + 88);
  *((_QWORD *)v28 + 4) = *(_QWORD *)(v29 + 96);
  *((_QWORD *)v28 + 5) = v4;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v28[v27], v26, v11);
  v30 = (uint64_t (**)(uint64_t))&v28[(v13 + v27 + 7) & 0xFFFFFFFFFFFFFFF8];
  *v30 = sub_213BC6FCC;
  v30[1] = v22;
  aBlock[4] = sub_213BC70DC;
  aBlock[5] = v28;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213BC47B0;
  aBlock[3] = &block_descriptor;
  v31 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  v32 = v41;
  sub_213BC90F4();
  v47 = MEMORY[0x24BEE4AF8];
  sub_213BC712C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D26250);
  sub_213BC7174(qword_254D26258, &qword_254D26250, MEMORY[0x24BEE12C8]);
  v33 = v44;
  v34 = v46;
  sub_213BC937C();
  MEMORY[0x2199BDF7C](0, v32, v33, v31);
  _Block_release(v31);
  swift_release();

  (*(void (**)(char *, uint64_t))(v45 + 8))(v33, v34);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v32, v43);
  return swift_release();
}

uint64_t sub_213BC44BC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  void (*v19)(uint64_t *);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t *);
  uint64_t v40;

  v39 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)a1 + 80);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D26060);
  v11 = sub_213BC94C0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (uint64_t *)((char *)&v35 - v13);
  sub_213BC9328();
  *(_BYTE *)(*(_QWORD *)(a1 + *(_QWORD *)(*(_QWORD *)a1 + 120)) + 40) = 0;
  v15 = sub_213BC47DC(a2);
  if ((v18 & 1) != 0)
  {
    *v14 = v15;
    v30 = v15;
    swift_storeEnumTagMultiPayload();
    MEMORY[0x2199BE33C](v30);
    v39(v14);
    sub_213BC8124(v30, 1);
    v29 = v11;
  }
  else
  {
    v35 = a4;
    v36 = v11;
    v19 = v39;
    v37 = v12;
    v38 = v15;
    v40 = v15;
    v20 = type metadata accessor for MegaFrame(255, v7, v16, v17);
    type metadata accessor for Node(255, v20, v21, v22);
    v23 = sub_213BC9274();
    MEMORY[0x2199BE3E4](MEMORY[0x24BEE12E0], v23);
    if ((sub_213BC92B0() & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, v7);
      v26 = type metadata accessor for NonUnderstanding(0, v7, v24, v25);
      MEMORY[0x2199BE3E4](&protocol conformance descriptor for NonUnderstanding<A>, v26);
      v27 = swift_allocError();
      sub_213BBE12C(0xD000000000000024, 0x8000000213BCA790, (uint64_t)v10, v7, v28);
      *v14 = v27;
      v29 = v36;
      swift_storeEnumTagMultiPayload();
      v19(v14);
      sub_213BC8124(v38, 0);
      v12 = v37;
    }
    else
    {
      v31 = sub_213BC5414(v38);
      v29 = v36;
      v12 = v37;
      if ((v32 & 1) != 0)
      {
        v33 = v31;
        *v14 = v31;
        swift_storeEnumTagMultiPayload();
        MEMORY[0x2199BE33C](v33);
        v19(v14);
        sub_213BC8124(v38, 0);
        sub_213BC7D2C(v33, 1);
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v8 + 16))(v14, a2, v7);
        swift_storeEnumTagMultiPayload();
        v19(v14);
        sub_213BC8124(v38, 0);
      }
    }
  }
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v12 + 8))(v14, v29);
}

uint64_t sub_213BC47B0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_213BC47DC(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
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
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  void (*v48)(uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t *, _QWORD);
  uint64_t v77;
  os_log_type_t v78;
  uint8_t *v79;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  __int128 v87;
  uint64_t *v88;
  uint8_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99[4];
  uint64_t v100;
  unsigned __int8 v101;
  uint64_t v102;
  uint64_t v103;

  v2 = v1;
  v4 = *v1;
  v84 = sub_213BC90C4();
  v83 = *(_QWORD *)(v84 - 8);
  MEMORY[0x24BDAC7A8](v84);
  v85 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for RuntimeConfiguration();
  MEMORY[0x24BDAC7A8](v6);
  v82 = (uint64_t)&v81 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = v4;
  v10 = type metadata accessor for MegaFrame(255, *(_QWORD *)(v4 + 80), v8, v9);
  v13 = type metadata accessor for Node(0, v10, v11, v12);
  v103 = sub_213BC922C();
  if (qword_253F08DE8 != -1)
    swift_once();
  v14 = sub_213BC90AC();
  v15 = __swift_project_value_buffer(v14, (uint64_t)qword_253F09168);
  swift_retain();
  v91 = v15;
  v16 = sub_213BC90A0();
  v17 = sub_213BC92BC();
  v18 = os_log_type_enabled(v16, v17);
  v96 = a1;
  if (v18)
  {
    v19 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v19 = 134217984;
    v99[0] = *(_QWORD *)(*(_QWORD *)((char *)v2 + *(_QWORD *)(*v2 + 120)) + 32);
    sub_213BC9364();
    swift_release();
    _os_log_impl(&dword_213BBB000, v16, v17, "FlowFrameRuntime onInput. Stack size %ld", v19, 0xCu);
    MEMORY[0x2199BE474](v19, -1, -1);

  }
  else
  {

    swift_release();
  }
  v102 = sub_213BC8240();
  v94 = (char *)v2 + *(_QWORD *)(*v2 + 104);
  v86 = v10;
  v22 = type metadata accessor for NodeIterator(0, v10, v20, v21);
  v23 = sub_213BC87CC();
  if (v23)
  {
    v25 = v23;
    v88 = &v98;
    v26 = MEMORY[0x24BEE12E0];
    v93 = MEMORY[0x24BEE4AD8] + 8;
    *(_QWORD *)&v24 = 136315138;
    v87 = v24;
    v92 = v22;
    do
    {
      if ((*(_BYTE *)(*(_QWORD *)((char *)v2 + *(_QWORD *)(*v2 + 120)) + 40) & 1) != 0
        || (v99[0] = v103, v27 = sub_213BC9274(), MEMORY[0x2199BE3E4](v26, v27), (sub_213BC92B0() & 1) == 0))
      {
        swift_release();
      }
      else
      {
        v28 = v13;
        v29 = *(_QWORD *)(*(_QWORD *)(v25 + 16) + 16);
        v30 = *(_QWORD *)(v29 + 16);
        v31 = *(_QWORD *)(v29 + 24);
        v33 = *(_QWORD *)(v95 + 88);
        v32 = *(_QWORD *)(v95 + 96);
        v34 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 16);
        swift_bridgeObjectRetain();
        v34(v30, v31, v33, v32);
        swift_bridgeObjectRelease();
        sub_213BBE9CC();
        *(_QWORD *)((char *)v2 + *(_QWORD *)(*v2 + 136)) = *(_QWORD *)(v25 + 16);
        swift_retain();
        swift_release();
        swift_retain();
        sub_213BC0160((uint64_t)v99, v96, v93, &v100);
        swift_release();
        v35 = v100;
        LOBYTE(v30) = v101;
        *(_QWORD *)((char *)v2 + *(_QWORD *)(*v2 + 136)) = 0;
        swift_release();
        if ((v30 & 1) != 0)
        {
          swift_release();
          swift_release();
          __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v99);
          swift_release();
          swift_bridgeObjectRelease();
          return v35;
        }
        if ((v35 & 1) != 0)
        {
          swift_release();
          swift_release();
          __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v99);
          v13 = v28;
        }
        else
        {
          swift_retain_n();
          v36 = sub_213BC90A0();
          v37 = sub_213BC92BC();
          if (os_log_type_enabled(v36, v37))
          {
            v38 = (uint8_t *)swift_slowAlloc();
            v90 = swift_slowAlloc();
            v100 = v90;
            *(_DWORD *)v38 = v87;
            v89 = v38 + 4;
            v39 = sub_213BC1E48();
            v97 = sub_213BC6158(v39, v40, &v100);
            sub_213BC9364();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_213BBB000, v36, v37, "FlowFrameRuntime found Understandable frame. %s", v38, 0xCu);
            v41 = v90;
            swift_arrayDestroy();
            MEMORY[0x2199BE474](v41, -1, -1);
            MEMORY[0x2199BE474](v38, -1, -1);

          }
          else
          {

            swift_release_n();
          }
          v13 = v28;
          v100 = v25;
          swift_retain();
          sub_213BC9250();
          swift_release();
          swift_release();
          __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v99);
        }
        v26 = MEMORY[0x24BEE12E0];
      }
      v25 = sub_213BC87CC();
    }
    while (v25);
  }
  swift_release();
  v99[0] = v103;
  v42 = sub_213BC9274();
  MEMORY[0x2199BE3E4](MEMORY[0x24BEE12E0], v42);
  if ((sub_213BC92B0() & 1) == 0 || (*(_BYTE *)(*(_QWORD *)((char *)v2 + *(_QWORD *)(*v2 + 120)) + 40) & 1) != 0)
    return v103;
  v43 = sub_213BC8230();
  v44 = v96;
  if (!v43)
  {
    v45 = sub_213BC90A0();
    v46 = sub_213BC92BC();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_213BBB000, v45, v46, "FlowFrameRuntime found no frames supporting input. Clearing existing stack frames.", v47, 2u);
      MEMORY[0x2199BE474](v47, -1, -1);
    }

    v48 = *(void (**)(uint64_t))(**(_QWORD **)((char *)v2 + *(_QWORD *)(*v2 + 120)) + 200);
    v49 = swift_retain();
    v48(v49);
    swift_release();
  }
  if (!(*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v95 + 96) + 24))(v44, *(_QWORD *)(v95 + 88)))
  {
    v66 = sub_213BC90A0();
    v67 = sub_213BC92C8();
    if (os_log_type_enabled(v66, v67))
    {
      v68 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v68 = 0;
      _os_log_impl(&dword_213BBB000, v66, v67, "FlowFrameRuntime frameFactoryLoader.loadFactory failed.", v68, 2u);
      MEMORY[0x2199BE474](v68, -1, -1);
    }

    return v103;
  }
  v50 = sub_213BBEE30();
  if (!v50)
  {
    v69 = sub_213BC90A0();
    v70 = sub_213BC92C8();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v71 = 0;
      _os_log_impl(&dword_213BBB000, v69, v70, "FlowFrameRuntime factory.makeFrameAbleToHandle failed.", v71, 2u);
      MEMORY[0x2199BE474](v71, -1, -1);
    }

    goto LABEL_50;
  }
  v51 = v50;
  v52 = sub_213BC90A0();
  v53 = sub_213BC92BC();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v54 = 0;
    _os_log_impl(&dword_213BBB000, v52, v53, "FlowFrameRuntime created frame to handle input.", v54, 2u);
    MEMORY[0x2199BE474](v54, -1, -1);
  }

  v55 = v82;
  sub_213BC7CB8((uint64_t)v2 + *(_QWORD *)(*v2 + 128), v82);
  v56 = (uint64_t)v85;
  (*(void (**)(char *, uint64_t, uint64_t))(v83 + 32))(v85, v55, v84);
  v57 = swift_allocObject();
  v58 = swift_retain();
  sub_213BC00B0(v58, 0, v56);
  *(_QWORD *)((char *)v2 + *(_QWORD *)(*v2 + 136)) = v57;
  swift_retain();
  swift_release();
  sub_213BBE9CC();
  sub_213BC0160((uint64_t)v99, v96, MEMORY[0x24BEE4AD8] + 8, &v100);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v99);
  v35 = v100;
  LODWORD(v56) = v101;
  *(_QWORD *)((char *)v2 + *(_QWORD *)(*v2 + 136)) = 0;
  swift_release();
  if ((_DWORD)v56 != 1)
  {
    v72 = sub_213BC90A0();
    if ((v35 & 1) != 0)
    {
      v78 = sub_213BC92C8();
      if (os_log_type_enabled(v72, v78))
      {
        v79 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v79 = 0;
        _os_log_impl(&dword_213BBB000, v72, v78, "FlowFrameRuntime frame created handle input does not understand input.", v79, 2u);
        MEMORY[0x2199BE474](v79, -1, -1);
        swift_release();
        swift_release();

LABEL_50:
        swift_release();
        return v103;
      }

      swift_release();
    }
    else
    {
      v73 = sub_213BC92BC();
      if (os_log_type_enabled(v72, v73))
      {
        v74 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v74 = 0;
        _os_log_impl(&dword_213BBB000, v72, v73, "FlowFrameRuntime frame created handle input understands input.", v74, 2u);
        MEMORY[0x2199BE474](v74, -1, -1);
      }

      v75 = *(_QWORD *)((char *)v2 + *(_QWORD *)(*v2 + 120));
      v99[0] = v57;
      v76 = *(uint64_t (**)(uint64_t *, _QWORD))(*(_QWORD *)v75 + 208);
      swift_retain();
      v77 = v76(v99, 0);
      swift_release();
      v99[0] = v77;
      swift_retain();
      sub_213BC9250();
      swift_release();
      swift_release();
    }
    swift_release();
    goto LABEL_50;
  }
  sub_213BC7D20(v35, 1);
  MEMORY[0x2199BE33C](v35);
  MEMORY[0x2199BE33C](v35);
  v59 = sub_213BC90A0();
  v60 = sub_213BC92C8();
  if (os_log_type_enabled(v59, v60))
  {
    v61 = (uint8_t *)swift_slowAlloc();
    v62 = swift_slowAlloc();
    v96 = v51;
    v63 = v62;
    v99[0] = v62;
    *(_DWORD *)v61 = 136315138;
    swift_getErrorValue();
    v64 = sub_213BC9460();
    v100 = sub_213BC6158(v64, v65, v99);
    sub_213BC9364();
    swift_bridgeObjectRelease();
    sub_213BC7D2C(v35, 1);
    sub_213BC7D2C(v35, 1);
    _os_log_impl(&dword_213BBB000, v59, v60, "FlowFrameRuntime error calling onInput for new frame. %s", v61, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199BE474](v63, -1, -1);
    MEMORY[0x2199BE474](v61, -1, -1);

    swift_release();
    sub_213BC7D2C(v35, 1);
  }
  else
  {

    swift_release();
    sub_213BC7D2C(v35, 1);
    sub_213BC7D2C(v35, 1);
    MEMORY[0x2199BE330](v35);
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v35;
}

uint64_t sub_213BC5414(uint64_t a1)
{
  uint64_t **v1;
  uint64_t **v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
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
  __int128 v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t Strong;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(_QWORD *, __int128 *);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(uint64_t);
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(uint64_t);
  uint64_t v74;
  uint64_t *v75;
  uint8_t *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  char *v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[4];
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  uint64_t v97;
  uint64_t v98;
  unsigned __int8 v99;
  __int128 v100;
  uint64_t v101;
  _BYTE v102[24];
  char v103[8];
  uint64_t v104;

  v2 = v1;
  v87 = *v1;
  v84 = sub_213BC90C4();
  v83 = *(_QWORD *)(v84 - 8);
  MEMORY[0x24BDAC7A8](v84);
  v82 = (char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for RuntimeConfiguration();
  MEMORY[0x24BDAC7A8](v5);
  v81 = (uint64_t)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_253F08DE8 != -1)
    swift_once();
  v7 = sub_213BC90AC();
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_253F09168);
  swift_bridgeObjectRetain();
  v89 = v8;
  v9 = sub_213BC90A0();
  v10 = sub_213BC92BC();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v11 = 134217984;
    v14 = type metadata accessor for MegaFrame(255, v87[10], v12, v13);
    v17 = type metadata accessor for Node(0, v14, v15, v16);
    v101 = MEMORY[0x2199BDEE0](a1, v17);
    sub_213BC9364();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213BBB000, v9, v10, "FlowFrameRuntime action with understandableFrames count %ld.", v11, 0xCu);
    MEMORY[0x2199BE474](v11, -1, -1);

    v20 = v14;
  }
  else
  {

    swift_bridgeObjectRelease();
    v20 = type metadata accessor for MegaFrame(255, v87[10], v21, v22);
  }
  v101 = a1;
  v80 = v20;
  type metadata accessor for Node(255, v20, v18, v19);
  v23 = sub_213BC9274();
  MEMORY[0x2199BE3E4](MEMORY[0x24BEE12E0], v23);
  sub_213BC92A4();
  if (!sub_213BC8230())
  {
    v30 = *v2;
    v86 = (char *)v2 + (*v2)[13];
    v79 = (uint64_t)v2 + v30[16];
    v78 = (char *)&v96 + 8;
    v75 = &v95;
    *(_QWORD *)&v24 = 136315138;
    v85 = v24;
    v77 = MEMORY[0x24BEE4AD8] + 8;
    do
    {
      if (((*(uint64_t **)((char *)v2 + (*v2)[15]))[5] & 1) != 0)
        break;
      v31 = v104;
      if (!v104)
      {
        if (!sub_213BC8C50())
          break;
        v31 = swift_retain();
      }
      v104 = 0;
      v91 = v31;
      v32 = *(uint64_t **)(v31 + 16);
      swift_retain_n();
      v33 = sub_213BC90A0();
      v34 = sub_213BC92BC();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc();
        v36 = swift_slowAlloc();
        v101 = v36;
        *(_DWORD *)v35 = v85;
        v37 = sub_213BC1E48();
        *(_QWORD *)&v96 = sub_213BC6158(v37, v38, &v101);
        sub_213BC9364();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_213BBB000, v33, v34, "FlowFrameRuntime action active frame. %s", v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2199BE474](v36, -1, -1);
        MEMORY[0x2199BE474](v35, -1, -1);

      }
      else
      {

        swift_release_n();
      }
      v39 = v32[2];
      v40 = *(_QWORD *)(v39 + 16);
      v41 = *(_QWORD *)(v39 + 24);
      v43 = v87[11];
      v42 = v87[12];
      v44 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 16);
      swift_bridgeObjectRetain();
      v45 = v44(v40, v41, v43, v42);
      swift_bridgeObjectRelease();
      sub_213BBE9CC();
      sub_213BBE9EC();
      *(uint64_t **)((char *)v2 + (*v2)[17]) = v32;
      swift_retain();
      swift_release();
      v46 = MEMORY[0x24BEE4AD8] + 8;
      sub_213BC09E8((uint64_t)v103, MEMORY[0x24BEE4AD8] + 8, &v101);
      *(uint64_t **)((char *)v2 + (*v2)[17]) = 0;
      swift_release();
      sub_213BC7FB0((uint64_t)&v101, (uint64_t)&v96, &qword_254D26068);
      if (v99 == 1)
      {
        swift_release();
        swift_release();
        swift_release();
        sub_213BBE028((uint64_t)&v101, &qword_254D26068);
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v102);
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v103);
        swift_release();
        return v96;
      }
      v88 = v45;
      sub_213BC7CA8(&v96, &v100);
      *(uint64_t **)((char *)v2 + (*v2)[17]) = v32;
      swift_retain();
      swift_release();
      sub_213BC1330((uint64_t)v102, (uint64_t)&v100, v46, (uint64_t)&v96);
      v47 = *((_QWORD *)&v96 + 1);
      v28 = v96;
      v48 = v98;
      v92 = v97;
      v49 = v99;
      *(uint64_t **)((char *)v2 + (*v2)[17]) = 0;
      swift_release();
      if (v49 == 1)
      {
        swift_release();
        swift_release();
        swift_release();
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v100);
        sub_213BBE028((uint64_t)&v101, &qword_254D26068);
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v102);
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v103);
        swift_release();
        return v28;
      }
      v90 = v28;
      if ((_BYTE)v28)
      {
        if (v28 == 1)
        {
          sub_213BC7EA4(v28, v47, v92, v48, 0);
          swift_retain();
          swift_retain();
          sub_213BC1A90((uint64_t)v103, MEMORY[0x24BEE4AD8] + 8);
          Strong = swift_weakLoadStrong();
          if (Strong)
          {
            v51 = *(_QWORD *)(Strong + 16);
            swift_retain();
            swift_release();
            v52 = v32[3];
            if (v52)
            {
              v53 = *(_QWORD *)(v51 + 16);
              v76 = (uint8_t *)v51;
              v54 = *(_QWORD *)(v53 + 16);
              v55 = *(_QWORD *)(v53 + 24);
              swift_bridgeObjectRetain();
              swift_retain();
              v44(v54, v55, v43, v42);
              swift_bridgeObjectRelease();
              sub_213BBE9CC();
              v56 = *(void (**)(_QWORD *, __int128 *))(v52 + 16);
              v93[3] = MEMORY[0x24BEE4AD8] + 8;
              v93[0] = swift_allocObject();
              sub_213BBDB24((uint64_t)&v94, v93[0] + 16);
              v56(v93, &v96);
              __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v93);
              swift_release();
              swift_release();
              swift_release();
              __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v94);
            }
            else
            {
              swift_release();
            }
          }
          v73 = *(void (**)(uint64_t))(**(uint64_t **)((char *)v2 + (*v2)[15]) + 240);
          swift_retain();
          v58 = v91;
          v73(v91);
          swift_release();
          swift_release();
          __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v96);
          v57 = v92;
          if (v47)
          {
LABEL_29:
            swift_retain_n();
            v61 = sub_213BC90A0();
            v62 = sub_213BC92BC();
            if (os_log_type_enabled(v61, v62))
            {
              v63 = (uint8_t *)swift_slowAlloc();
              v64 = swift_slowAlloc();
              *(_QWORD *)&v96 = v64;
              *(_DWORD *)v63 = v85;
              v76 = v63 + 4;
              v65 = sub_213BBD520();
              v94 = sub_213BC6158(v65, v66, (uint64_t *)&v96);
              v58 = v91;
              sub_213BC9364();
              swift_release_n();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_213BBB000, v61, v62, "FlowFrameRuntime action activeFrame.action pushing next frame. %s", v63, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x2199BE474](v64, -1, -1);
              MEMORY[0x2199BE474](v63, -1, -1);

            }
            else
            {

              swift_release_n();
            }
            if (v90 == 1)
            {
              v67 = 0;
            }
            else
            {
              swift_retain();
              v67 = v58;
            }
            v68 = *(uint64_t *)((char *)v2 + (*v2)[15]);
            v69 = v81;
            sub_213BC7CB8(v79, v81);
            v70 = (uint64_t)v82;
            (*(void (**)(char *, uint64_t, uint64_t))(v83 + 32))(v82, v69, v84);
            v71 = swift_allocObject();
            swift_retain();
            swift_retain();
            sub_213BC00B0(v47, v48, v70);
            *(_QWORD *)&v96 = v71;
            (*(void (**)(__int128 *, uint64_t))(*(_QWORD *)v68 + 208))(&v96, v67);
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            v72 = v90;
            v57 = v92;
            sub_213BC7E64(v90, v47, v92, v48, 0);
            sub_213BC7E64(v72, v47, v57, v48, 0);
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            goto LABEL_39;
          }
        }
        else
        {
          v59 = v28;
          v60 = *(void (**)(uint64_t))(**(uint64_t **)((char *)v2 + (*v2)[15]) + 232);
          v57 = v92;
          sub_213BC7EA4(v59, v47, v92, v48, 0);
          swift_retain();
          swift_retain();
          swift_retain();
          v58 = v91;
          v60(v91);
          swift_release();
          swift_release();
          if (v47)
            goto LABEL_29;
        }
      }
      else
      {
        v57 = v92;
        sub_213BC7EA4(v28, v47, v92, v48, 0);
        swift_retain();
        swift_retain();
        v58 = v91;
        if (v47)
          goto LABEL_29;
      }
      swift_release();
      v74 = v90;
      sub_213BC7E64(v90, 0, v57, v48, 0);
      swift_release();
      swift_release();
      swift_release();
      sub_213BC7E64(v74, 0, v57, v48, 0);
LABEL_39:
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v100);
      sub_213BBE028((uint64_t)&v101, &qword_254D26068);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v102);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v103);
    }
    while ((v57 & 1) == 0 && !sub_213BC8230());
  }
  v25 = sub_213BC90A0();
  v26 = sub_213BC92BC();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_213BBB000, v25, v26, "FlowFrameRuntime action complete.", v27, 2u);
    MEMORY[0x2199BE474](v27, -1, -1);
  }

  swift_release();
  return 0;
}

uint64_t FlowFrameRuntime.deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 88) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 104));

  swift_release();
  sub_213BC71B4(v0 + *(_QWORD *)(*(_QWORD *)v0 + 128));
  swift_release();
  return v0;
}

uint64_t FlowFrameRuntime.__deallocating_deinit()
{
  return sub_213BC610C((void (*)(void))FlowFrameRuntime.deinit);
}

uint64_t sub_213BC610C(void (*a1)(void))
{
  a1();
  return swift_deallocClassInstance();
}

uint64_t sub_213BC6130()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 192))();
}

uint64_t sub_213BC6158(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_213BC6228(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_213BBDB24((uint64_t)v12, *a3);
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
      sub_213BBDB24((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_213BC6228(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_213BC9370();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_213BC63E0(a5, a6);
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
  v8 = sub_213BC93C4();
  if (!v8)
  {
    sub_213BC9418();
    __break(1u);
LABEL_17:
    result = sub_213BC9430();
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

uint64_t sub_213BC63E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_213BC6474(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_213BC66C4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_213BC66C4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_213BC6474(uint64_t a1, unint64_t a2)
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
      v3 = sub_213BC65E8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_213BC93AC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_213BC9418();
      __break(1u);
LABEL_10:
      v2 = sub_213BC919C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_213BC9430();
    __break(1u);
LABEL_14:
    result = sub_213BC9418();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_213BC65E8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D262A8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_213BC664C(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_213BC91CC();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x2199BDE50](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_213BC66C4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D262A8);
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
  result = sub_213BC9430();
  __break(1u);
  return result;
}

uint64_t sub_213BC6810@<X0>(_QWORD *a1@<X8>)
{
  return sub_213BC33F4(a1);
}

uint64_t type metadata accessor for CancellableStack(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CancellableStack);
}

uint64_t sub_213BC683C(uint64_t a1, unint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v4 = objc_msgSend((id)objc_opt_self(), sel_callStackSymbols);
  v5 = sub_213BC9214();

  if (qword_253F08DE8 != -1)
    swift_once();
  v6 = sub_213BC90AC();
  __swift_project_value_buffer(v6, (uint64_t)qword_253F09168);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v7 = sub_213BC90A0();
  v8 = sub_213BC92D4();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v20 = v10;
    *(_DWORD *)v9 = 136315394;
    swift_bridgeObjectRetain();
    sub_213BC6158(a1, a2, &v20);
    sub_213BC9364();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 12) = 2048;
    swift_bridgeObjectRelease();
    sub_213BC9364();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213BBB000, v7, v8, "MegaFrame.%s repeated completion invocation. Logging %ld callstack symbols.", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199BE474](v10, -1, -1);
    MEMORY[0x2199BE474](v9, -1, -1);

    v11 = *(_QWORD *)(v5 + 16);
    if (!v11)
      return swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    v11 = *(_QWORD *)(v5 + 16);
    if (!v11)
      return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  v12 = (unint64_t *)(v5 + 40);
  do
  {
    v14 = *(v12 - 1);
    v13 = *v12;
    swift_bridgeObjectRetain_n();
    v15 = sub_213BC90A0();
    v16 = sub_213BC92D4();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v18 = swift_slowAlloc();
      v20 = v18;
      *(_DWORD *)v17 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v17 + 4) = sub_213BC6158(v14, v13, &v20);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_213BBB000, v15, v16, "%s", (uint8_t *)v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199BE474](v18, -1, -1);
      MEMORY[0x2199BE474](v17, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v12 += 2;
    --v11;
  }
  while (v11);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_213BC6BA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, unint64_t, uint64_t);
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  uint64_t result;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;

  v5 = a1;
  v45 = *(_QWORD *)(a2 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v44 = (char *)&v37 - v10;
  v37 = v11;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v37 - v13;
  if (MEMORY[0x2199BDEE0](v12))
  {
    sub_213BC9394();
    v15 = sub_213BC9388();
  }
  else
  {
    v15 = MEMORY[0x24BEE4B08];
  }
  v40 = MEMORY[0x2199BDF04](v5, a2);
  if (!v40)
    return v15;
  v16 = 0;
  v43 = v15 + 56;
  v38 = v14;
  v39 = v5;
  while (1)
  {
    v17 = sub_213BC9238();
    sub_213BC9220();
    if ((v17 & 1) != 0)
    {
      v18 = *(void (**)(char *, unint64_t, uint64_t))(v45 + 16);
      v18(v14, v5+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(_QWORD *)(v45 + 72) * v16, a2);
      v19 = __OFADD__(v16, 1);
      v20 = v16 + 1;
      if (v19)
        goto LABEL_20;
    }
    else
    {
      result = sub_213BC93B8();
      if (v37 != 8)
        goto LABEL_23;
      v46 = result;
      v18 = *(void (**)(char *, unint64_t, uint64_t))(v45 + 16);
      v18(v14, (unint64_t)&v46, a2);
      swift_unknownObjectRelease();
      v19 = __OFADD__(v16, 1);
      v20 = v16 + 1;
      if (v19)
      {
LABEL_20:
        __break(1u);
        return v15;
      }
    }
    v21 = v45;
    v41 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
    v42 = v20;
    v41(v44, v14, a2);
    v22 = sub_213BC913C();
    v23 = -1 << *(_BYTE *)(v15 + 32);
    v24 = v22 & ~v23;
    v25 = v24 >> 6;
    v26 = *(_QWORD *)(v43 + 8 * (v24 >> 6));
    v27 = 1 << v24;
    v28 = *(_QWORD *)(v21 + 72);
    if (((1 << v24) & v26) != 0)
    {
      v29 = ~v23;
      do
      {
        v18(v8, *(_QWORD *)(v15 + 48) + v28 * v24, a2);
        v30 = a3;
        v31 = sub_213BC9160();
        v32 = *(void (**)(char *, uint64_t))(v45 + 8);
        v32(v8, a2);
        if ((v31 & 1) != 0)
        {
          v32(v44, a2);
          a3 = v30;
          v14 = v38;
          v5 = v39;
          goto LABEL_7;
        }
        v24 = (v24 + 1) & v29;
        v25 = v24 >> 6;
        v26 = *(_QWORD *)(v43 + 8 * (v24 >> 6));
        v27 = 1 << v24;
        a3 = v30;
      }
      while ((v26 & (1 << v24)) != 0);
      v14 = v38;
      v5 = v39;
    }
    v33 = v44;
    *(_QWORD *)(v43 + 8 * v25) = v27 | v26;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v41)(*(_QWORD *)(v15 + 48) + v28 * v24, v33, a2);
    v35 = *(_QWORD *)(v15 + 16);
    v19 = __OFADD__(v35, 1);
    v36 = v35 + 1;
    if (v19)
      break;
    *(_QWORD *)(v15 + 16) = v36;
LABEL_7:
    v16 = v42;
    if (v42 == v40)
      return v15;
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

uint64_t **sub_213BC6EB0(uint64_t a1, uint64_t a2)
{
  uint64_t **v2;
  uint64_t **v3;
  uint64_t *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = v2;
  v6 = *v2;
  *(uint64_t **)((char *)v2 + (*v2)[17]) = 0;
  v7 = (char *)v2 + (*v2)[13];
  v8 = v6[11];
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v7, a1, v8);
  v9 = type metadata accessor for FlowFrameRuntime(0, v6[10], v8, v6[12]);
  *(uint64_t **)((char *)v3 + (*v3)[15]) = sub_213BC3720(v9, v10, v11, v12);
  *(uint64_t **)((char *)v3 + (*v3)[14]) = (uint64_t *)dispatch_semaphore_create(1);
  sub_213BC8134(a2, (uint64_t)v3 + (*v3)[16]);
  return v3;
}

unint64_t sub_213BC6F5C()
{
  unint64_t result;

  result = qword_254D26238;
  if (!qword_254D26238)
  {
    result = MEMORY[0x2199BE3E4](&protocol conformance descriptor for TimedOutError, &type metadata for TimedOutError);
    atomic_store(result, (unint64_t *)&qword_254D26238);
  }
  return result;
}

uint64_t sub_213BC6FA0()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213BC6FCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t);

  v3 = *(uint64_t (**)(uint64_t))(v1 + 24);
  sub_213BC9334();
  return v3(a1);
}

unint64_t sub_213BC7014()
{
  unint64_t result;

  result = qword_254D26240;
  if (!qword_254D26240)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D26240);
  }
  return result;
}

uint64_t sub_213BC7050()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213BC70DC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_213BC44BC(*(_QWORD *)(v0 + 40), v0 + v2, *(void (**)(uint64_t *))v3, *(_QWORD *)(v3 + 8));
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

unint64_t sub_213BC712C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D26248;
  if (!qword_254D26248)
  {
    v1 = sub_213BC90DC();
    result = MEMORY[0x2199BE3E4](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_254D26248);
  }
  return result;
}

uint64_t sub_213BC7174(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199BE3E4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_213BC71B4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RuntimeConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for RuntimeConfiguration()
{
  uint64_t result;

  result = qword_253F09078;
  if (!qword_253F09078)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_213BC722C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_213BC90C4();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for MegaFrame(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MegaFrame);
}

uint64_t sub_213BC72D8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_213BC7318()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for InstrumentedCancellableStack(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for InstrumentedCancellableStack);
}

uint64_t initializeBufferWithCopyOfBuffer for RuntimeConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_213BC90C4();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for RuntimeConfiguration(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_213BC90C4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for RuntimeConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_213BC90C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for RuntimeConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_213BC90C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for RuntimeConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_213BC90C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for RuntimeConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_213BC90C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for RuntimeConfiguration()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_213BC74F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_213BC90C4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for RuntimeConfiguration()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_213BC753C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_213BC90C4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_213BC757C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_213BC90C4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_213BC75E4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = sub_213BC90C4();
    if (v2 <= 0x3F)
    {
      result = swift_initClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for FlowFrameRuntime(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FlowFrameRuntime);
}

uint64_t method lookup function for FlowFrameRuntime()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FlowFrameRuntime.debugDescription.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of FlowFrameRuntime.__allocating_init(frameFactoryLoader:configuration:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of FlowFrameRuntime.ensureReady()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of FlowFrameRuntime.reset()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of FlowFrameRuntime.handle(input:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t sub_213BC7704()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_213BC770C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_213BC9088();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_213BC7794(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v14 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
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
    v7 = a2[5];
    a1[4] = a2[4];
    a1[5] = v7;
    v8 = a2[7];
    a1[6] = a2[6];
    a1[7] = v8;
    v9 = *(int *)(a3 + 44);
    v10 = (char *)a2 + v9;
    v11 = (char *)a1 + v9;
    a1[8] = a2[8];
    v12 = sub_213BC9088();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v11, v10, v12);
  }
  return v3;
}

uint64_t sub_213BC7878(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 44);
  v5 = sub_213BC9088();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_213BC78D8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  v8 = *(int *)(a3 + 44);
  v9 = (char *)a2 + v8;
  v10 = (char *)a1 + v8;
  a1[8] = a2[8];
  v11 = sub_213BC9088();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v10, v9, v11);
  return a1;
}

_QWORD *sub_213BC7990(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

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
  a1[8] = a2[8];
  v6 = *(int *)(a3 + 44);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_213BC9088();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_213BC7A74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v6 = *(int *)(a3 + 44);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_213BC9088();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

_QWORD *sub_213BC7AE0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  v10 = *(int *)(a3 + 44);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_213BC9088();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_213BC7B84()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_213BC7B90(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_213BC9088();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 44), a2, v8);
  }
}

uint64_t sub_213BC7C0C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_213BC7C18(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_213BC9088();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 44), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for InstrumentedCancellableStack.TrackedFrame(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for InstrumentedCancellableStack.TrackedFrame);
}

void sub_213BC7C98()
{
  JUMPOUT(0x2199BE3E4);
}

_OWORD *sub_213BC7CA8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_213BC7CB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RuntimeConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_213BC7CFC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
  return swift_deallocObject();
}

void sub_213BC7D20(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    JUMPOUT(0x2199BE33CLL);
}

void sub_213BC7D2C(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    JUMPOUT(0x2199BE330);
}

uint64_t sub_213BC7D38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213BC7D70(a1, (uint64_t (*)(uint64_t))sub_213BC2374, a3, a4);
}

uint64_t sub_213BC7D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213BC7D70(a1, (uint64_t (*)(uint64_t))sub_213BC26F4, a3, a4);
}

uint64_t sub_213BC7D70(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;

  v6 = type metadata accessor for InstrumentedCancellableStack.TrackedFrame(0, *(_QWORD *)(v4 + 16), a3, a4);
  return a2(v6);
}

unint64_t sub_213BC7DB4()
{
  unint64_t result;

  result = qword_254D26290;
  if (!qword_254D26290)
  {
    result = MEMORY[0x2199BE3E4](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254D26290);
  }
  return result;
}

uint64_t sub_213BC7DF8@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v2;

  v2 = (_QWORD *)swift_retain();
  return sub_213BC20C8(v2, a1);
}

uint64_t sub_213BC7E2C()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 48);
  if (v1 != 255)
    sub_213BC7E64(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), v1 & 1);
  return swift_deallocObject();
}

uint64_t sub_213BC7E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0)
    JUMPOUT(0x2199BE330);
  swift_release();
  return swift_release();
}

uint64_t sub_213BC7E98(uint64_t a1)
{
  uint64_t v1;

  return sub_213BC1928(a1, *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_213BC7EA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0)
    JUMPOUT(0x2199BE33CLL);
  swift_retain();
  return swift_retain();
}

unint64_t sub_213BC7ED4()
{
  unint64_t result;

  result = qword_254D26298;
  if (!qword_254D26298)
  {
    result = MEMORY[0x2199BE3E4](&protocol conformance descriptor for CancelledError, &type metadata for CancelledError);
    atomic_store(result, (unint64_t *)&qword_254D26298);
  }
  return result;
}

uint64_t sub_213BC7F18(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 255)
    return sub_213BC7EA4(result, a2, a3, a4, a5 & 1);
  return result;
}

uint64_t sub_213BC7F3C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 255)
    return sub_213BC7E64(result, a2, a3, a4, a5 & 1);
  return result;
}

uint64_t sub_213BC7F60()
{
  uint64_t v0;
  int v1;
  _QWORD *v2;

  v1 = *(unsigned __int8 *)(v0 + 48);
  if (v1 != 255)
  {
    v2 = (_QWORD *)(v0 + 16);
    if ((v1 & 1) != 0)
      MEMORY[0x2199BE330](*v2);
    else
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
  }
  return swift_deallocObject();
}

uint64_t sub_213BC7FA4(uint64_t a1)
{
  uint64_t v1;

  return sub_213BC11DC(a1, *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_213BC7FB0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_213BC7FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D26068);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_213BC803C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D262A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_213BC8084()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 24);
  if (v1 != 255)
    sub_213BC7D2C(*(_QWORD *)(v0 + 16), v1 & 1);
  return swift_deallocObject();
}

uint64_t objectdestroy_13Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213BC80E8(uint64_t a1)
{
  uint64_t v1;

  return sub_213BC08D4(a1, *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

void sub_213BC80F4(uint64_t a1, unsigned __int8 a2)
{
  if (a2 != 255)
    sub_213BC7D20(a1, a2 & 1);
}

void sub_213BC810C(uint64_t a1, unsigned __int8 a2)
{
  if (a2 != 255)
    sub_213BC7D2C(a1, a2 & 1);
}

uint64_t sub_213BC8124(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    JUMPOUT(0x2199BE330);
  return swift_bridgeObjectRelease();
}

uint64_t sub_213BC8134(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RuntimeConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_213BC8178()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_213BC820C()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

BOOL sub_213BC8230()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32) == 0;
}

uint64_t sub_213BC8240()
{
  return swift_retain();
}

uint64_t sub_213BC8248()
{
  _QWORD *v0;
  uint64_t result;

  v0[2] = 0;
  swift_release();
  v0[3] = 0;
  result = swift_release();
  v0[4] = 0;
  return result;
}

uint64_t *sub_213BC8274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  type metadata accessor for Node(0, *(_QWORD *)(*(_QWORD *)v4 + 80), a3, a4);
  swift_retain();
  v9 = sub_213BC8C00(a1, a2, v7, v8);
  if (a2)
  {
    swift_beginAccess();
    sub_213BC9274();
    swift_retain();
    swift_retain();
    sub_213BC9250();
    swift_endAccess();
    swift_release();
  }
  sub_213BC857C((uint64_t)v9);
  return v9;
}

uint64_t *sub_213BC8354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t Strong;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;

  type metadata accessor for Node(0, *(_QWORD *)(*(_QWORD *)v4 + 80), a3, a4);
  v6 = a1 + *(_QWORD *)(*(_QWORD *)a1 + 88);
  Strong = swift_weakLoadStrong();
  v10 = sub_213BC8C00(v6, Strong, v8, v9);
  sub_213BC8C58(a1);
  v11 = (uint64_t *)(a1 + *(_QWORD *)(*(_QWORD *)a1 + 104));
  swift_beginAccess();
  v12 = *v11;
  v13 = (uint64_t *)((char *)v10 + *(_QWORD *)(*v10 + 104));
  swift_beginAccess();
  *v13 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *v11 = sub_213BC922C();
  swift_bridgeObjectRelease();
  sub_213BC857C(a1);
  v14 = swift_weakLoadStrong();
  if (v14)
  {
    v15 = (uint64_t *)(v14 + *(_QWORD *)(*(_QWORD *)v14 + 104));
    swift_beginAccess();
    v16 = sub_213BC9274();
    MEMORY[0x2199BE3E4](MEMORY[0x24BEE12E0], v16);
    if ((sub_213BC92B0() & 1) == 0)
    {
      swift_bridgeObjectRetain();
      MEMORY[0x2199BE3E4](MEMORY[0x24BEE12F0], v16);
      *v15 = sub_213BC93D0();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      swift_retain();
      sub_213BC9250();
      swift_endAccess();
    }
    swift_release();
  }
  return v10;
}

uint64_t sub_213BC8568(uint64_t *a1)
{
  sub_213BC8EA8(a1);
  return swift_retain();
}

uint64_t sub_213BC857C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v3 = v1[3];
  if (v1[2] && v3)
  {
    swift_weakAssign();
    *(_QWORD *)(v3 + *(_QWORD *)(*(_QWORD *)v3 + 120)) = a1;
    swift_retain();
    swift_release();
    v1[3] = a1;
  }
  else
  {
    v1[3] = a1;
    swift_retain();
    swift_release();
    v1[2] = a1;
  }
  swift_retain();
  result = swift_release();
  v5 = v1[4];
  v6 = __OFADD__(v5, 1);
  v7 = v5 + 1;
  if (v6)
    __break(1u);
  else
    v1[4] = v7;
  return result;
}

uint64_t sub_213BC862C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t Strong;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  v3 = v1[2];
  v4 = v1[3];
  if (v3)
    v5 = v3 == a1;
  else
    v5 = 0;
  if (v5)
  {
    if (v4)
      v8 = v4 == a1;
    else
      v8 = 0;
    if (v8)
    {
      v1[2] = 0;
      swift_release();
      v1[3] = 0;
    }
    else
    {
      v1[2] = *(_QWORD *)(a1 + *(_QWORD *)(*(_QWORD *)a1 + 120));
      swift_retain();
    }
    goto LABEL_23;
  }
  Strong = swift_weakLoadStrong();
  if (v4)
    v7 = v4 == a1;
  else
    v7 = 0;
  if (v7)
  {
    if (Strong)
    {
      *(_QWORD *)(Strong + *(_QWORD *)(*(_QWORD *)Strong + 120)) = 0;
      swift_retain();
      swift_release();
      swift_release();
    }
    else
    {
      swift_retain();
    }
    v9 = swift_weakLoadStrong();
    swift_release();
    v1[3] = v9;
    goto LABEL_23;
  }
  if (Strong)
  {
    *(_QWORD *)(Strong + *(_QWORD *)(*(_QWORD *)Strong + 120)) = *(_QWORD *)(a1 + *(_QWORD *)(*(_QWORD *)a1 + 120));
    swift_retain();
    swift_release();
    swift_release();
  }
  if (*(_QWORD *)(a1 + *(_QWORD *)(*(_QWORD *)a1 + 120)))
  {
    swift_weakLoadStrong();
    swift_weakAssign();
LABEL_23:
    swift_release();
  }
  swift_weakAssign();
  *(_QWORD *)(a1 + *(_QWORD *)(*(_QWORD *)a1 + 120)) = 0;
  result = swift_release();
  v11 = v1[4];
  v12 = __OFSUB__(v11, 1);
  v13 = v11 - 1;
  if (v12)
    __break(1u);
  else
    v1[4] = v13;
  return result;
}

uint64_t sub_213BC87CC()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  if (*v0)
    *v0 = swift_weakLoadStrong();
  return v1;
}

uint64_t sub_213BC8804()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 88));
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 120);
  v2 = *(_QWORD *)(v0 + v1);
  *(_QWORD *)(v0 + v1) = 0;
  if (v2)
  {
    do
    {
      if (!swift_isUniquelyReferenced_native())
        break;
      v3 = *(_QWORD *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 120));
      swift_retain();
      swift_release();
      v2 = v3;
    }
    while (v3);
  }
  swift_release();
  return v0;
}

uint64_t sub_213BC88BC()
{
  sub_213BC8804();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Node(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Node);
}

uint64_t sub_213BC88EC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_213BC893C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_213BC87CC();
  *a1 = result;
  return result;
}

uint64_t sub_213BC8960()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for OrderedForest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for OrderedForest);
}

void sub_213BC8998()
{
  JUMPOUT(0x2199BE3E4);
}

_QWORD *sub_213BC89A8()
{
  _QWORD *v0;
  _QWORD *result;

  result = v0;
  v0[2] = 0;
  v0[3] = 0;
  v0[4] = 0;
  return result;
}

uint64_t sub_213BC89B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_213BC8240();
  result = swift_release();
  *a1 = v2;
  return result;
}

uint64_t sub_213BC89F4()
{
  return 0;
}

uint64_t sub_213BC89FC()
{
  return 2;
}

uint64_t sub_213BC8A04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for OrderedForest(0, *(_QWORD *)(a1 + 80), a3, a4);
  v4 = sub_213BC8ED4();
  swift_release();
  return v4;
}

void sub_213BC8A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for OrderedForest(0, *(_QWORD *)(a4 + 80), a3, a4);
  JUMPOUT(0x2199BDE8CLL);
}

uint64_t sub_213BC8AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for OrderedForest(0, *(_QWORD *)(a4 + 80), a3, a4);
  return sub_213BC91FC();
}

uint64_t *sub_213BC8B10(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *v1;
  swift_weakInit();
  swift_weakInit();
  *(uint64_t *)((char *)v1 + *(_QWORD *)(*v1 + 120)) = 0;
  v4 = *(_QWORD *)(v3 + 80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))((uint64_t)v1 + *(_QWORD *)(*v1 + 88), a1, v4);
  swift_weakAssign();
  type metadata accessor for Node(0, v4, v5, v6);
  v7 = sub_213BC922C();
  swift_release();
  *(uint64_t *)((char *)v1 + *(_QWORD *)(*v1 + 104)) = v7;
  swift_weakAssign();
  *(uint64_t *)((char *)v1 + *(_QWORD *)(*v1 + 120)) = 0;
  swift_release();
  return v1;
}

uint64_t *sub_213BC8C00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for Node(0, *(_QWORD *)(v4 + 80), a3, a4);
  swift_allocObject();
  return sub_213BC8B10(a1);
}

uint64_t sub_213BC8C50()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t sub_213BC8C58(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v3 = *v1;
  v4 = (uint64_t *)(a1 + *(_QWORD *)(*(_QWORD *)a1 + 104));
  swift_beginAccess();
  v5 = *v4;
  v8 = type metadata accessor for Node(0, *(_QWORD *)(v3 + 80), v6, v7);
  v9 = swift_bridgeObjectRetain();
  if (MEMORY[0x2199BDEF8](v9, v8))
  {
    v10 = 4;
    do
    {
      v11 = v10 - 4;
      v12 = sub_213BC9238();
      sub_213BC9220();
      if ((v12 & 1) != 0)
      {
        v13 = *(_QWORD *)(v5 + 8 * v10);
        swift_retain();
        v14 = __OFADD__(v11, 1);
        v15 = v10 - 3;
        if (v14)
          goto LABEL_9;
      }
      else
      {
        v13 = sub_213BC93B8();
        v14 = __OFADD__(v11, 1);
        v15 = v10 - 3;
        if (v14)
        {
LABEL_9:
          __break(1u);
          break;
        }
      }
      sub_213BC8C58(v13);
      swift_release();
      ++v10;
    }
    while (v15 != MEMORY[0x2199BDEF8](v5, v8));
  }
  swift_bridgeObjectRelease();
  sub_213BC862C(a1);
  return a1;
}

uint64_t sub_213BC8D84(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *a1;
  result = swift_weakLoadStrong();
  if (result)
  {
    v3 = (uint64_t *)(result + *(_QWORD *)(*(_QWORD *)result + 104));
    swift_beginAccess();
    type metadata accessor for Node(255, *(_QWORD *)(v1 + 80), v4, v5);
    v6 = sub_213BC9274();
    MEMORY[0x2199BE3E4](MEMORY[0x24BEE12E0], v6);
    if ((sub_213BC92B0() & 1) != 0)
    {
      return swift_release();
    }
    else
    {
      swift_bridgeObjectRetain();
      MEMORY[0x2199BE3E4](MEMORY[0x24BEE12F0], v6);
      *v3 = sub_213BC93D0();
      swift_release();
      swift_bridgeObjectRelease();
      return swift_weakAssign();
    }
  }
  return result;
}

uint64_t *sub_213BC8EA8(uint64_t *a1)
{
  sub_213BC8C58((uint64_t)a1);
  sub_213BC8D84(a1);
  return a1;
}

BOOL sub_213BC8ED8(_QWORD *a1)
{
  uint64_t v1;

  return *a1 != v1;
}

_QWORD *sub_213BC8EE8(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t sub_213BC8F14()
{
  return swift_release();
}

_QWORD *sub_213BC8F1C(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *sub_213BC8F60(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_213BC8F90(uint64_t *a1, unsigned int a2)
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

uint64_t sub_213BC8FEC(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t type metadata accessor for NodeIterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for NodeIterator);
}

BOOL sub_213BC904C(_QWORD *a1)
{
  return sub_213BC8ED8(a1);
}

uint64_t sub_213BC9064()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t sub_213BC9070()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_213BC907C()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_213BC9088()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_213BC9094()
{
  return MEMORY[0x24BEE7780]();
}

uint64_t sub_213BC90A0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_213BC90AC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_213BC90B8()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_213BC90C4()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_213BC90D0()
{
  return MEMORY[0x24BEE5438]();
}

uint64_t sub_213BC90DC()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_213BC90E8()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_213BC90F4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_213BC9100()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_213BC910C()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_213BC9118()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_213BC9124()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_213BC9130()
{
  return MEMORY[0x24BEE01C0]();
}

uint64_t sub_213BC913C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_213BC9148()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_213BC9154()
{
  return MEMORY[0x24BEE0930]();
}

uint64_t sub_213BC9160()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_213BC916C()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_213BC9178()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_213BC9184()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_213BC9190()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_213BC919C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_213BC91A8()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_213BC91B4()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_213BC91C0()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_213BC91CC()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_213BC91D8()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_213BC91E4()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_213BC91F0()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t sub_213BC91FC()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_213BC9208()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_213BC9214()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_213BC9220()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_213BC922C()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_213BC9238()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_213BC9244()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_213BC9250()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_213BC925C()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_213BC9268()
{
  return MEMORY[0x24BEE1228]();
}

uint64_t sub_213BC9274()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_213BC9280()
{
  return MEMORY[0x24BEE15A8]();
}

uint64_t sub_213BC928C()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_213BC9298()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t sub_213BC92A4()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_213BC92B0()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_213BC92BC()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_213BC92C8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_213BC92D4()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_213BC92E0()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_213BC92EC()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_213BC92F8()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_213BC9304()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_213BC9310()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t sub_213BC931C()
{
  return MEMORY[0x24BEE5918]();
}

uint64_t sub_213BC9328()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_213BC9334()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_213BC9340()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_213BC934C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_213BC9358()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_213BC9364()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_213BC9370()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_213BC937C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_213BC9388()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_213BC9394()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_213BC93A0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_213BC93AC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_213BC93B8()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_213BC93C4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_213BC93D0()
{
  return MEMORY[0x24BEE28C0]();
}

uint64_t sub_213BC93DC()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_213BC93E8()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_213BC93F4()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_213BC9400()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_213BC940C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_213BC9418()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_213BC9424()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_213BC9430()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_213BC943C()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_213BC9448()
{
  return MEMORY[0x24BEE3A40]();
}

uint64_t sub_213BC9454()
{
  return MEMORY[0x24BEE3D38]();
}

uint64_t sub_213BC9460()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_213BC946C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_213BC9478()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_213BC9484()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_213BC9490()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_213BC949C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_213BC94A8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_213BC94B4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_213BC94C0()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_213BC94CC()
{
  return MEMORY[0x24BEE4A98]();
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x24BEE4E80]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
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

