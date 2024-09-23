uint64_t sub_1D5624FCC()
{
  return sub_1D565F9B4();
}

uint64_t sub_1D5624FE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  const void *v2;
  _BYTE __dst[40];

  memcpy(__dst, v2, sizeof(__dst));
  return sub_1D5622EF0(a1, a2);
}

uint64_t sub_1D562502C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  (*(void (**)(uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1 + *(int *)(a5 + 44));
  return a1;
}

unint64_t sub_1D5625060()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E5D0;
  if (!qword_1EFF3E5D0)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E570);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CDB1A0], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E5D0);
    return v1;
  }
  return v3;
}

uint64_t sub_1D56250D0(uint64_t a1)
{
  uint64_t v1;

  v1 = sub_1D565FB88();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(a1);
  return a1;
}

uint64_t sub_1D562510C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v14;

  (*(void (**)(uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1 + *(int *)(a5 + 44));
  v14 = *(int *)(a12 + 36);
  v12 = sub_1D565FB88();
  (*(void (**)(uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1 + v14);
  return a1;
}

uint64_t sub_1D5625178()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D562521C()
{
  uint64_t v0;

  return sub_1D561F524(v0 + 32);
}

uint64_t sub_1D5625238()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1D56252DC()
{
  uint64_t *v0;

  sub_1D561F578(v0 + 4, v0[2], v0[3]);
}

uint64_t sub_1D56252F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  (*(void (**)(void))(*(_QWORD *)(a2 - 8) + 8))();
  v6 = *(int *)(a3 + 36);
  if (*(_QWORD *)(a1 + v6))
    swift_release();
  if (*(_QWORD *)(a1 + v6 + 16))
    swift_release();
  return a1;
}

uint64_t sub_1D562539C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v15;

  (*(void (**)(void))(*(_QWORD *)(a3 - 8) + 16))();
  v15 = *(int *)(a4 + 36);
  if (*(_QWORD *)(a1 + v15))
  {
    v10 = *(_QWORD *)(a1 + v15);
    v11 = *(_QWORD *)(a1 + v15 + 8);
    swift_retain();
    v4 = (_QWORD *)(a2 + v15);
    *v4 = v10;
    v4[1] = v11;
  }
  else
  {
    *(_OWORD *)(a2 + v15) = *(_OWORD *)(a1 + v15);
  }
  v8 = a2 + v15;
  v9 = a1 + v15;
  if (*(_QWORD *)(a1 + v15 + 16))
  {
    v6 = *(_QWORD *)(v9 + 16);
    v7 = *(_QWORD *)(a1 + v15 + 24);
    swift_retain();
    *(_QWORD *)(v8 + 16) = v6;
    *(_QWORD *)(a2 + v15 + 24) = v7;
  }
  else
  {
    *(_OWORD *)(v8 + 16) = *(_OWORD *)(v9 + 16);
  }
  return a2;
}

uint64_t *sub_1D56254F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D561FB7C(*(char **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_1D562550C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E5F0;
  if (!qword_1EFF3E5F0)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E5E8);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CE0680], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E5F0);
    return v1;
  }
  return v3;
}

unint64_t sub_1D562557C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E5F8;
  if (!qword_1EFF3E5F8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E5E0);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CDFB10], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E5F8);
    return v1;
  }
  return v3;
}

uint64_t sub_1D56255EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E600) + 44);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E608);
  v5 = *(int *)(v6 + 48);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E610);
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(a1 + v4 + v5);
  v7 = *(int *)(v6 + 64);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E618);
  v9 = *(_QWORD *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v9 + 48))(a1 + v4 + v7, 1))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1 + v4 + v7, v8);
  return a1;
}

uint64_t sub_1D5625720@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D5621154(*(const void **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_1D562573C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1 + *(int *)(a3 + 44));
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1D5625770()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

_QWORD *sub_1D56257A4(uint64_t *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v4;

  v4 = *a1;
  swift_unknownObjectRetain();
  result = a2;
  *a2 = v4;
  return result;
}

uint64_t sub_1D56257D8()
{
  return sub_1D5622E70() & 1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1D5625814()
{
  swift_unknownObjectRetain();
}

uint64_t sub_1D562583C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D562328C(*(void **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_1D5625858()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E640;
  if (!qword_1EFF3E640)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E638);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CE0680], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E640);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1D56258C8()
{
  swift_unknownObjectRelease();
}

unint64_t sub_1D56258F0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E648;
  if (!qword_1EFF3E648)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E628);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CDFB10], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E648);
    return v1;
  }
  return v3;
}

uint64_t sub_1D5625960(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
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

  v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E650) + 44);
  swift_release();
  v8 = a1 + v7 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E658) + 36);
  swift_release();
  v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E660) + 28);
  v1 = sub_1D565FA50();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v8 + v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E668);
  swift_release();
  v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E670) + 48);
  v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E678) + 44);
  v14 = a1 + v7 + v10 + v11;
  sub_1D5603614(*(_QWORD *)v14, *(_QWORD *)(v14 + 8), *(_BYTE *)(v14 + 16) & 1);
  swift_bridgeObjectRelease();
  swift_release();
  v12 = v14 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E680) + 36);
  swift_release();
  v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E688) + 28);
  v2 = sub_1D565F6E4();
  (*(void (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v12 + v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E690);
  swift_release();
  swift_release();
  v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E698) + 48);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v14 + v15, 1))
  {
    v5 = a1 + v7 + v10 + v11 + v15 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A8) + 44);
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6B0);
    (*(void (**)(uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v5);
    swift_release();
  }
  return a1;
}

unint64_t sub_1D5625BF4()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  v3 = qword_1EFF3E6B8;
  if (!qword_1EFF3E6B8)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E630);
    v4[0] = sub_1D56258F0();
    v4[1] = MEMORY[0x1E0CDA228];
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0CD9C20], v2, v4);
    atomic_store(v0, (unint64_t *)&qword_1EFF3E6B8);
    return v0;
  }
  return v3;
}

uint64_t sub_1D5625C7C(uint64_t a1, uint64_t a2)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
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
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_BYTE *)(a2 + 16) = *(_BYTE *)(a1 + 16);
  v22 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E650) + 44);
  v23 = *(_QWORD *)(a1 + v22);
  swift_retain();
  v30 = a2 + v22;
  *(_QWORD *)(a2 + v22) = v23;
  v24 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E658) + 36);
  v27 = (char *)(a1 + v22 + v24);
  v25 = *(_QWORD *)v27;
  swift_retain();
  *(_QWORD *)(v30 + v24) = v25;
  v26 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E660) + 28);
  v2 = sub_1D565FA50();
  (*(void (**)(uint64_t, char *))(*(_QWORD *)(v2 - 8) + 16))(a2 + v22 + v24 + v26, &v27[v26]);
  v28 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E668) + 36);
  v29 = *(_QWORD *)(a1 + v22 + v28);
  swift_retain();
  *(_QWORD *)(v30 + v28) = v29;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6C0);
  memcpy((void *)(a2 + v22 + *(int *)(v3 + 36)), (const void *)(a1 + v22 + *(int *)(v3 + 36)), 0x29uLL);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6C8);
  memcpy((void *)(a2 + v22 + *(int *)(v4 + 36)), (const void *)(a1 + v22 + *(int *)(v4 + 36)), 0x30uLL);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E670);
  v32 = *(int *)(v31 + 48);
  v33 = a1 + v22 + v32;
  v34 = a2 + v22 + v32;
  *(_OWORD *)v34 = *(_OWORD *)v33;
  *(_BYTE *)(v34 + 16) = *(_BYTE *)(v33 + 16);
  v35 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E678) + 44);
  v36 = *(_QWORD *)(v33 + v35);
  v37 = *(_QWORD *)(v33 + v35 + 8);
  v38 = *(_BYTE *)(v33 + v35 + 16);
  sub_1D5603AAC(v36, v37, v38 & 1);
  v5 = v34 + v35;
  v45 = v34 + v35;
  *(_QWORD *)v5 = v36;
  *(_QWORD *)(v5 + 8) = v37;
  *(_BYTE *)(v5 + 16) = v38 & 1;
  v39 = *(_QWORD *)(v33 + v35 + 24);
  swift_bridgeObjectRetain();
  *(_QWORD *)(v45 + 24) = v39;
  v40 = *(_QWORD *)(v33 + v35 + 32);
  swift_retain();
  *(_QWORD *)(v45 + 32) = v40;
  *(_QWORD *)(v45 + 40) = *(_QWORD *)(v33 + v35 + 40);
  *(_BYTE *)(v45 + 48) = *(_BYTE *)(v33 + v35 + 48);
  v41 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E680) + 36);
  v44 = (char *)(v33 + v35 + v41);
  v42 = *(_QWORD *)v44;
  swift_retain();
  *(_QWORD *)(v45 + v41) = v42;
  v43 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E688) + 28);
  v6 = sub_1D565F6E4();
  (*(void (**)(uint64_t, char *))(*(_QWORD *)(v6 - 8) + 16))(v34 + v35 + v41 + v43, &v44[v43]);
  v46 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E690) + 36);
  v48 = (uint64_t *)(v33 + v35 + v46);
  v47 = *v48;
  swift_retain();
  *(_QWORD *)(v45 + v46) = v47;
  v49 = v48[1];
  swift_retain();
  *(_QWORD *)(v34 + v35 + v46 + 8) = v49;
  v50 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E698) + 48);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A0);
  v52 = *(_QWORD *)(v51 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v52 + 48))(v33 + v35 + v50, 1))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(qword_1EFF3E6D0);
    memcpy((void *)(a2 + v22 + v32 + v35 + v50), (const void *)(a1 + v22 + v32 + v35 + v50), *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    v16 = a1 + v22 + v32 + v35 + v50;
    v17 = a2 + v22 + v32 + v35 + v50;
    *(_OWORD *)v17 = *(_OWORD *)v16;
    *(_BYTE *)(v17 + 16) = *(_BYTE *)(v16 + 16);
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A8);
    v15 = v17 + *(int *)(v7 + 44);
    v14 = v16 + *(int *)(v7 + 44);
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6B0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v15, v14);
    v18 = *(int *)(v51 + 36);
    v19 = *(_QWORD *)(v16 + v18);
    swift_retain();
    *(_QWORD *)(v17 + v18) = v19;
    (*(void (**)(void))(v52 + 56))();
  }
  v10 = a2 + v22 + *(int *)(v31 + 64);
  v11 = a1 + v22 + *(int *)(v31 + 64);
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *(_BYTE *)(v10 + 8) = *(_BYTE *)(v11 + 8);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E630);
  memcpy((void *)(a2 + *(int *)(v12 + 36)), (const void *)(a1 + *(int *)(v12 + 36)), 0x70uLL);
  return a2;
}

uint64_t sub_1D562627C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1D56262C0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1D56262EC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  return swift_release();
}

uint64_t sub_1D56263A0(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t result;
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
  void *v14;
  uint64_t v15;
  uint64_t v17;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v4 = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 48) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  swift_unknownObjectRetain();
  *(_QWORD *)(a1 + 56) = v5;
  v6 = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 64) = v6;
  v7 = *(_QWORD *)(a2 + 72);
  swift_retain();
  *(_QWORD *)(a1 + 72) = v7;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  v8 = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 88) = v8;
  v9 = *(_QWORD *)(a2 + 96);
  swift_retain();
  *(_QWORD *)(a1 + 96) = v9;
  v10 = *(_QWORD *)(a2 + 104);
  swift_unknownObjectRetain();
  *(_QWORD *)(a1 + 104) = v10;
  v11 = *(_QWORD *)(a2 + 112);
  swift_retain();
  *(_QWORD *)(a1 + 112) = v11;
  v12 = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 120) = v12;
  v13 = *(_QWORD *)(a2 + 128);
  swift_retain();
  *(_QWORD *)(a1 + 128) = v13;
  v14 = *(void **)(a2 + 136);
  v2 = v14;
  *(_QWORD *)(a1 + 136) = v14;
  v15 = *(_QWORD *)(a2 + 144);
  swift_retain();
  *(_QWORD *)(a1 + 144) = v15;
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  v17 = *(_QWORD *)(a2 + 160);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 160) = v17;
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  return result;
}

uint64_t sub_1D5626574(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t result;
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
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v4 = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 48) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 56);
  swift_unknownObjectRetain();
  *(_QWORD *)(a1 + 56) = v5;
  swift_unknownObjectRelease();
  v6 = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 72);
  swift_retain();
  *(_QWORD *)(a1 + 72) = v7;
  swift_release();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  v8 = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 88) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 96);
  swift_retain();
  *(_QWORD *)(a1 + 96) = v9;
  swift_release();
  v10 = *(_QWORD *)(a2 + 104);
  swift_unknownObjectRetain();
  *(_QWORD *)(a1 + 104) = v10;
  swift_unknownObjectRelease();
  v11 = *(_QWORD *)(a2 + 112);
  swift_retain();
  *(_QWORD *)(a1 + 112) = v11;
  swift_release();
  v12 = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 120) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 128);
  swift_retain();
  *(_QWORD *)(a1 + 128) = v13;
  swift_release();
  v15 = *(void **)(a1 + 136);
  v14 = *(void **)(a2 + 136);
  v2 = v14;
  *(_QWORD *)(a1 + 136) = v14;

  v16 = *(_QWORD *)(a2 + 144);
  swift_retain();
  *(_QWORD *)(a1 + 144) = v16;
  swift_release();
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152) & 1;
  v17 = *(_QWORD *)(a2 + 160);
  swift_retain();
  *(_QWORD *)(a1 + 160) = v17;
  swift_release();
  result = a1;
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168) & 1;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy169_8(void *a1, const void *a2)
{
  memcpy(a1, a2, 0xA9uLL);
}

uint64_t sub_1D5626850(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t result;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_release();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_release();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_release();
  v2 = *(void **)(a1 + 136);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);

  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_release();
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152) & 1;
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_release();
  result = a1;
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168) & 1;
  return result;
}

uint64_t sub_1D5626A00(uint64_t a1, int a2)
{
  int v3;
  int v4;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 169))
    {
      v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v3 = -1;
      if (!HIDWORD(*(_QWORD *)(a1 + 48)))
        v3 = *(_QWORD *)(a1 + 48);
      v4 = v3;
    }
  }
  else
  {
    v4 = -1;
  }
  return (v4 + 1);
}

uint64_t sub_1D5626B18(uint64_t result, int a2, int a3)
{
  _BYTE *v3;

  v3 = (_BYTE *)(result + 169);
  if (a2 < 0)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_QWORD *)(result + 112) = 0;
    *(_QWORD *)(result + 104) = 0;
    *(_QWORD *)(result + 96) = 0;
    *(_QWORD *)(result + 88) = 0;
    *(_QWORD *)(result + 80) = 0;
    *(_QWORD *)(result + 72) = 0;
    *(_QWORD *)(result + 64) = 0;
    *(_QWORD *)(result + 56) = 0;
    *(_QWORD *)(result + 48) = 0;
    *(_QWORD *)(result + 40) = 0;
    *(_QWORD *)(result + 32) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 + 0x80000000;
    *(_QWORD *)(result + 152) = 0;
    *(_QWORD *)(result + 144) = 0;
    *(_QWORD *)(result + 136) = 0;
    *(_QWORD *)(result + 128) = 0;
    *(_QWORD *)(result + 160) = 0;
    *(_BYTE *)(result + 168) = 0;
    if (a3 < 0)
      *v3 = 1;
  }
  else
  {
    if (a3 < 0)
      *v3 = 0;
    if (a2)
      *(_QWORD *)(result + 48) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for MUIOpenMailboxQuicklyView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MUIOpenMailboxQuicklyView);
}

uint64_t sub_1D5626D38()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1D5626D64()
{
  return swift_unknownObjectRelease();
}

_QWORD *sub_1D5626D7C(_QWORD *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v4;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  v4 = a2[4];
  swift_unknownObjectRetain();
  result = a1;
  a1[4] = v4;
  return result;
}

_QWORD *sub_1D5626DD0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  v3 = a2[4];
  swift_unknownObjectRetain();
  a1[4] = v3;
  swift_unknownObjectRelease();
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1D5626E30(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_unknownObjectRelease();
}

uint64_t sub_1D5626E84(uint64_t a1, int a2)
{
  int v3;
  int v4;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v3 = -1;
      if (!HIDWORD(*(_QWORD *)(a1 + 32)))
        v3 = *(_QWORD *)(a1 + 32);
      v4 = v3;
    }
  }
  else
  {
    v4 = -1;
  }
  return (v4 + 1);
}

uint64_t sub_1D5626F9C(uint64_t result, unsigned int a2, unsigned int a3)
{
  _BOOL4 v3;

  v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(_QWORD *)result = a2 + 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)(result + 32) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 40) = 1;
      else
        __break(1u);
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 40) = 0;
      else
        __break(1u);
    }
    if (a2)
      *(_QWORD *)(result + 32) = a2 - 1;
  }
  return result;
}

uint64_t sub_1D56271A8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
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
  uint64_t OpaqueTypeConformance2;
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
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[4];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  uint64_t v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[4];
  _QWORD v53[4];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[6];
  _QWORD v59[4];
  uint64_t v60;
  _QWORD v61[2];
  _QWORD v62[6];
  _QWORD v63[8];
  uint64_t v64;

  v64 = *a1;
  v10 = a1[1];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E578);
  sub_1D565FB04();
  v7 = sub_1D5660038();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = type metadata accessor for MailboxView(255, v64, v10, AssociatedTypeWitness);
  v1 = MEMORY[0x1D82763B0](&unk_1D5673E28);
  v63[4] = v3;
  v63[5] = MEMORY[0x1E0DEA968];
  v63[6] = v1;
  v63[7] = MEMORY[0x1E0DEA978];
  v4 = sub_1D565FABC();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3DF80);
  v6 = sub_1D565F360();
  v5 = MEMORY[0x1D82763B0](MEMORY[0x1E0CDFB30], v4);
  v36 = sub_1D560569C();
  v63[2] = v5;
  v63[3] = v36;
  v41 = MEMORY[0x1E0CD9C20];
  v63[0] = v6;
  v63[1] = MEMORY[0x1D82763B0]();
  v39 = MEMORY[0x1E0CDE248];
  MEMORY[0x1D827635C](255, v63);
  sub_1D565F360();
  sub_1D565F360();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E580);
  sub_1D565F360();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E588);
  swift_getTupleTypeMetadata2();
  v62[1] = v7;
  v62[2] = AssociatedTypeWitness;
  v62[3] = sub_1D565FBDC();
  v62[4] = MEMORY[0x1D82763B0](MEMORY[0x1E0DEAF48], v7);
  v62[5] = swift_getAssociatedConformanceWitness();
  v9 = sub_1D565FB28();
  v25 = MEMORY[0x1E0CE0680];
  v62[0] = MEMORY[0x1D82763B0]();
  MEMORY[0x1D82763B0](MEMORY[0x1E0CDFEE8], v9, v62);
  sub_1D565FAE0();
  v11 = sub_1D565F360();
  sub_1D565F360();
  v12 = sub_1D566041C();
  v27 = MEMORY[0x1E0CDFCC0];
  v61[0] = MEMORY[0x1D82763B0]();
  v30 = MEMORY[0x1E0CD9758];
  v61[1] = MEMORY[0x1E0CD9758];
  v13 = MEMORY[0x1D82763B0](v41, v11, v61);
  v60 = *(_QWORD *)(v10 + 8);
  v14 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEE998], v12, &v60);
  v59[0] = v11;
  v59[1] = v12;
  v59[2] = v13;
  v59[3] = v14;
  MEMORY[0x1D827635C](255, v59);
  v58[2] = v11;
  v58[3] = v12;
  v58[4] = v13;
  v58[5] = v14;
  swift_getOpaqueTypeConformance2();
  sub_1D565F3C0();
  MEMORY[0x1D82763B0](MEMORY[0x1E0CDA0C8]);
  sub_1D565F210();
  swift_getTupleTypeMetadata2();
  sub_1D565FBDC();
  MEMORY[0x1D82763B0](v25);
  sub_1D565F2B8();
  sub_1D565F360();
  swift_getTupleTypeMetadata2();
  sub_1D565FBDC();
  sub_1D566041C();
  swift_getTupleTypeMetadata2();
  sub_1D565FBDC();
  MEMORY[0x1D82763B0](v25);
  v15 = sub_1D565FAE0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E590);
  v16 = sub_1D565F360();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E598);
  v17 = sub_1D565F360();
  v18 = sub_1D565F360();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E5A0);
  v19 = sub_1D565F360();
  v58[0] = MEMORY[0x1D82763B0](v27, v15);
  v58[1] = sub_1D5619A0C();
  v57[0] = MEMORY[0x1D82763B0](v41, v16, v58);
  v57[1] = sub_1D5619A7C();
  v56[0] = MEMORY[0x1D82763B0](v41, v17, v57);
  v56[1] = MEMORY[0x1E0CD9100];
  v55[0] = MEMORY[0x1D82763B0](v41, v18, v56);
  v55[1] = sub_1D5619AEC();
  v20 = MEMORY[0x1D82763B0](v41, v19, v55);
  v54[0] = v19;
  v54[1] = v20;
  v23 = MEMORY[0x1E0CDDF40];
  v21 = MEMORY[0x1D827635C](255, v54);
  v53[2] = v19;
  v53[3] = v20;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v53[0] = v21;
  v53[1] = OpaqueTypeConformance2;
  MEMORY[0x1D827635C](255, v53, v23, 0);
  v24 = sub_1D565F360();
  v52[2] = v21;
  v52[3] = OpaqueTypeConformance2;
  v52[0] = swift_getOpaqueTypeConformance2();
  v52[1] = v36;
  v51[0] = v24;
  v51[1] = MEMORY[0x1D82763B0](v41, v24, v52);
  MEMORY[0x1D827635C](255, v51, v39, 0);
  swift_getTupleTypeMetadata2();
  sub_1D565FBDC();
  MEMORY[0x1D82763B0](v25);
  v26 = sub_1D565FAE0();
  v28 = sub_1D565F360();
  v29 = sub_1D565F360();
  v31 = sub_1D565F360();
  v32 = sub_1D565FA08();
  v34 = sub_1D565F360();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E5C0);
  v35 = sub_1D565F360();
  v37 = sub_1D565F360();
  v50[0] = MEMORY[0x1D82763B0](v27, v26);
  v50[1] = MEMORY[0x1E0CD8D70];
  v49[0] = MEMORY[0x1D82763B0](v41, v28, v50);
  v33 = MEMORY[0x1E0CDA228];
  v49[1] = MEMORY[0x1E0CDA228];
  v48[0] = MEMORY[0x1D82763B0](v41, v29, v49);
  v48[1] = v30;
  v47 = MEMORY[0x1D82763B0](v41, v31, v48);
  v46[0] = MEMORY[0x1D82763B0](MEMORY[0x1E0CDF690], v32, &v47);
  v46[1] = v33;
  v45[0] = MEMORY[0x1D82763B0](v41, v34, v46);
  v45[1] = sub_1D5619B5C();
  v44[0] = MEMORY[0x1D82763B0](v41, v35, v45);
  v44[1] = v36;
  v38 = MEMORY[0x1D82763B0](v41, v37, v44);
  v43[0] = v37;
  v43[1] = v38;
  MEMORY[0x1D827635C](255, v43, v39, 0);
  v40 = sub_1D565F360();
  v42[2] = v37;
  v42[3] = v38;
  v42[0] = swift_getOpaqueTypeConformance2();
  v42[1] = MEMORY[0x1E0CDC8B0];
  return MEMORY[0x1D82763B0](v41, v40, v42);
}

unint64_t sub_1D5627B38()
{
  return sub_1D5627B4C();
}

unint64_t sub_1D5627B4C()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  v3 = qword_1EFF3E7D8;
  if (!qword_1EFF3E7D8)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E7E0);
    v4[0] = sub_1D562557C();
    v4[1] = MEMORY[0x1E0CD9758];
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0CD9C20], v2, v4);
    atomic_store(v0, (unint64_t *)&qword_1EFF3E7D8);
    return v0;
  }
  return v3;
}

uint64_t sub_1D5627BD4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;
  uint64_t AssociatedConformanceWitness;
  _QWORD v18[8];
  uint64_t v19;

  v19 = *a1;
  v3 = a1[1];
  v7 = sub_1D5660038();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4 = type metadata accessor for MailboxView(255, v19, v3, AssociatedTypeWitness);
  v1 = MEMORY[0x1D82763B0](&unk_1D5673E28);
  v18[4] = v4;
  v18[5] = MEMORY[0x1E0DEA968];
  v18[6] = v1;
  v18[7] = MEMORY[0x1E0DEA978];
  v5 = sub_1D565FABC();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3DF80);
  v6 = sub_1D565F360();
  v18[2] = MEMORY[0x1D82763B0](MEMORY[0x1E0CDFB30], v5);
  v18[3] = sub_1D560569C();
  v12 = MEMORY[0x1E0CD9C20];
  v18[0] = v6;
  v18[1] = MEMORY[0x1D82763B0]();
  MEMORY[0x1D827635C](255, v18, MEMORY[0x1E0CDE248], 0);
  sub_1D565F360();
  sub_1D565F360();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E580);
  sub_1D565F360();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E588);
  swift_getTupleTypeMetadata2();
  v14[1] = v7;
  v14[2] = AssociatedTypeWitness;
  v15 = sub_1D565FBDC();
  v16 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEAF48], v7);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v9 = sub_1D565FB28();
  v14[0] = MEMORY[0x1D82763B0](MEMORY[0x1E0CE0680], v15);
  MEMORY[0x1D82763B0](MEMORY[0x1E0CDFEE8], v9, v14);
  v10 = sub_1D565FAE0();
  v11 = sub_1D565F360();
  v13[0] = MEMORY[0x1D82763B0](MEMORY[0x1E0CDFCC0], v10);
  v13[1] = MEMORY[0x1E0CD9758];
  return MEMORY[0x1D82763B0](v12, v11, v13);
}

unint64_t sub_1D5627EB8()
{
  return sub_1D5625BF4();
}

uint64_t sub_1D5627ECC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1D5627F10(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1D565FA44();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

unint64_t sub_1D5627F80()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  v4 = qword_1EFF3E7F8;
  if (!qword_1EFF3E7F8)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E658);
    v0 = sub_1D5628008();
    v5[0] = MEMORY[0x1E0CDF820];
    v5[1] = v0;
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CD9C20], v3, v5);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E7F8);
    return v1;
  }
  return v4;
}

unint64_t sub_1D5628008()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E800;
  if (!qword_1EFF3E800)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E660);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CDCF80], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E800);
    return v1;
  }
  return v3;
}

uint64_t sub_1D5628078(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  swift_release();
  v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E658) + 36);
  swift_release();
  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E660) + 28);
  v1 = sub_1D565FA50();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v3 + v4);
  return a1;
}

unint64_t sub_1D5628100()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  v3 = qword_1EFF3E808;
  if (!qword_1EFF3E808)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E668);
    v4[0] = sub_1D5627F80();
    v4[1] = sub_1D562818C();
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0CD9C20], v2, v4);
    atomic_store(v0, (unint64_t *)&qword_1EFF3E808);
    return v0;
  }
  return v3;
}

unint64_t sub_1D562818C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E810;
  if (!qword_1EFF3E810)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E818);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CDC718], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E810);
    return v1;
  }
  return v3;
}

uint64_t sub_1D56281FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  swift_release();
  v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E658) + 36);
  swift_release();
  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E660) + 28);
  v1 = sub_1D565FA50();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v3 + v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E668);
  swift_release();
  return a1;
}

unint64_t sub_1D56282A4()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  v3 = qword_1EFF3E820;
  if (!qword_1EFF3E820)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E6C0);
    v4[0] = sub_1D5628100();
    v4[1] = MEMORY[0x1E0CD9758];
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0CD9C20], v2, v4);
    atomic_store(v0, (unint64_t *)&qword_1EFF3E820);
    return v0;
  }
  return v3;
}

unint64_t sub_1D562832C()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  v3 = qword_1EFF3E828;
  if (!qword_1EFF3E828)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E6C8);
    v4[0] = sub_1D56282A4();
    v4[1] = MEMORY[0x1E0CD8D70];
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0CD9C20], v2, v4);
    atomic_store(v0, (unint64_t *)&qword_1EFF3E828);
    return v0;
  }
  return v3;
}

uint64_t sub_1D56283B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D56239D0(*(void **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_1D56283D0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E838;
  if (!qword_1EFF3E838)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E830);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CE0680], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E838);
    return v1;
  }
  return v3;
}

unint64_t sub_1D5628440()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E840;
  if (!qword_1EFF3E840)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E7E8);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CDFCC0], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E840);
    return v1;
  }
  return v3;
}

uint64_t sub_1D56284B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E678) + 44);
  sub_1D5603614(*(_QWORD *)(a1 + v6), *(_QWORD *)(a1 + v6 + 8), *(_BYTE *)(a1 + v6 + 16) & 1);
  swift_bridgeObjectRelease();
  swift_release();
  v7 = a1 + v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E680) + 36);
  swift_release();
  v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E688) + 28);
  v1 = sub_1D565F6E4();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v7 + v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E690);
  swift_release();
  swift_release();
  v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E698) + 48);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(a1 + v6 + v9, 1))
  {
    v4 = a1 + v6 + v9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A8) + 44);
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6B0);
    (*(void (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v4);
    swift_release();
  }
  return a1;
}

char *sub_1D5628670(char *a1, char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)a1;
  swift_retain();
  *(_QWORD *)a2 = v6;
  v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E658) + 36);
  v8 = *(_QWORD *)&a1[v7];
  swift_retain();
  *(_QWORD *)&a2[v7] = v8;
  v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E660) + 28);
  v2 = sub_1D565FA50();
  (*(void (**)(char *, char *))(*(_QWORD *)(v2 - 8) + 16))(&a2[v7 + v9], &a1[v7 + v9]);
  v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E668) + 36);
  v11 = *(_QWORD *)&a1[v10];
  swift_retain();
  *(_QWORD *)&a2[v10] = v11;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6C0);
  memcpy(&a2[*(int *)(v3 + 36)], &a1[*(int *)(v3 + 36)], 0x29uLL);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6C8);
  memcpy(&a2[*(int *)(v4 + 36)], &a1[*(int *)(v4 + 36)], 0x30uLL);
  return a2;
}

uint64_t sub_1D56287E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_BYTE *)(a2 + 16) = *(_BYTE *)(a1 + 16);
  v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E678) + 44);
  v17 = *(_QWORD *)(a1 + v16);
  v18 = *(_QWORD *)(a1 + v16 + 8);
  v19 = *(_BYTE *)(a1 + v16 + 16);
  sub_1D5603AAC(v17, v18, v19 & 1);
  v2 = a2 + v16;
  v26 = a2 + v16;
  *(_QWORD *)v2 = v17;
  *(_QWORD *)(v2 + 8) = v18;
  *(_BYTE *)(v2 + 16) = v19 & 1;
  v20 = *(_QWORD *)(a1 + v16 + 24);
  swift_bridgeObjectRetain();
  *(_QWORD *)(v26 + 24) = v20;
  v21 = *(_QWORD *)(a1 + v16 + 32);
  swift_retain();
  *(_QWORD *)(v26 + 32) = v21;
  *(_QWORD *)(v26 + 40) = *(_QWORD *)(a1 + v16 + 40);
  *(_BYTE *)(v26 + 48) = *(_BYTE *)(a1 + v16 + 48);
  v22 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E680) + 36);
  v25 = (char *)(a1 + v16 + v22);
  v23 = *(_QWORD *)v25;
  swift_retain();
  *(_QWORD *)(v26 + v22) = v23;
  v24 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E688) + 28);
  v3 = sub_1D565F6E4();
  (*(void (**)(uint64_t, char *))(*(_QWORD *)(v3 - 8) + 16))(a2 + v16 + v22 + v24, &v25[v24]);
  v27 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E690) + 36);
  v29 = (uint64_t *)(a1 + v16 + v27);
  v28 = *v29;
  swift_retain();
  *(_QWORD *)(v26 + v27) = v28;
  v30 = v29[1];
  swift_retain();
  *(_QWORD *)(a2 + v16 + v27 + 8) = v30;
  v31 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E698) + 48);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A0);
  v33 = *(_QWORD *)(v32 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v33 + 48))(a1 + v16 + v31, 1))
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(qword_1EFF3E6D0);
    memcpy((void *)(a2 + v16 + v31), (const void *)(a1 + v16 + v31), *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    v10 = a1 + v16 + v31;
    v11 = a2 + v16 + v31;
    *(_OWORD *)v11 = *(_OWORD *)v10;
    *(_BYTE *)(v11 + 16) = *(_BYTE *)(v10 + 16);
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A8);
    v9 = v11 + *(int *)(v4 + 44);
    v8 = v10 + *(int *)(v4 + 44);
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6B0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v9, v8);
    v12 = *(int *)(v32 + 36);
    v13 = *(_QWORD *)(v10 + v12);
    swift_retain();
    *(_QWORD *)(v11 + v12) = v13;
    (*(void (**)(void))(v33 + 56))();
  }
  return a2;
}

unint64_t sub_1D5628B70()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  v4 = qword_1EFF3E858;
  if (!qword_1EFF3E858)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E850);
    v0 = sub_1D5628BF8();
    v5[0] = MEMORY[0x1E0CDDD58];
    v5[1] = v0;
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CD9C20], v3, v5);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E858);
    return v1;
  }
  return v4;
}

unint64_t sub_1D5628BF8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E860;
  if (!qword_1EFF3E860)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E868);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CDCF80], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E860);
    return v1;
  }
  return v3;
}

uint64_t sub_1D5628C68(uint64_t a1)
{
  sub_1D5603614(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16) & 1);
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

unint64_t sub_1D5628CB8()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  v3 = qword_1EFF3E870;
  if (!qword_1EFF3E870)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E680);
    v4[0] = sub_1D5628B70();
    v4[1] = sub_1D5628D44();
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0CD9C20], v2, v4);
    atomic_store(v0, (unint64_t *)&qword_1EFF3E870);
    return v0;
  }
  return v3;
}

unint64_t sub_1D5628D44()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E878;
  if (!qword_1EFF3E878)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E688);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CDCF80], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E878);
    return v1;
  }
  return v3;
}

uint64_t sub_1D5628DB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  sub_1D5603614(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16) & 1);
  swift_bridgeObjectRelease();
  swift_release();
  v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E680) + 36);
  swift_release();
  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E688) + 28);
  v1 = sub_1D565F6E4();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v3 + v4);
  return a1;
}

unint64_t sub_1D5628E64()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  v3 = qword_1EFF3E880;
  if (!qword_1EFF3E880)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E690);
    v4[0] = sub_1D5628CB8();
    v4[1] = sub_1D5608FAC();
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0CD9C20], v2, v4);
    atomic_store(v0, (unint64_t *)&qword_1EFF3E880);
    return v0;
  }
  return v3;
}

uint64_t sub_1D5628EF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  sub_1D5603614(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16) & 1);
  swift_bridgeObjectRelease();
  swift_release();
  v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E680) + 36);
  swift_release();
  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E688) + 28);
  v1 = sub_1D565F6E4();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v3 + v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E690);
  swift_release();
  swift_release();
  return a1;
}

unint64_t sub_1D5628FD4()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  v3 = qword_1EFF3E888;
  if (!qword_1EFF3E888)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E6A0);
    v4[0] = sub_1D5629060();
    v4[1] = sub_1D562818C();
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0CD9C20], v2, v4);
    atomic_store(v0, (unint64_t *)&qword_1EFF3E888);
    return v0;
  }
  return v3;
}

unint64_t sub_1D5629060()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E890;
  if (!qword_1EFF3E890)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E848);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CDFB10], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E890);
    return v1;
  }
  return v3;
}

uint64_t sub_1D56290D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(a1, 1))
  {
    v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A8) + 44);
    v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6B0);
    (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v3);
    swift_release();
  }
  return a1;
}

_BYTE *sub_1D562917C(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v10;
  uint64_t v11;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t))(v11 + 48))(a1, 1))
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1EFF3E6D0);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    a2[16] = a1[16];
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A8);
    v7 = &a2[*(int *)(v2 + 44)];
    v6 = &a1[*(int *)(v2 + 44)];
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6B0);
    (*(void (**)(_BYTE *, _BYTE *))(*(_QWORD *)(v3 - 8) + 32))(v7, v6);
    *(_QWORD *)&a2[*(int *)(v10 + 36)] = *(_QWORD *)&a1[*(int *)(v10 + 36)];
    (*(void (**)(void))(v11 + 56))();
  }
  return a2;
}

uint64_t sub_1D56292A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  sub_1D5603AAC(*(_QWORD *)a1, v5, v6 & 1);
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = v6 & 1;
  v7 = *(_QWORD *)(a1 + 24);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a2 + 24) = v7;
  v8 = *(_QWORD *)(a1 + 32);
  swift_retain();
  *(_QWORD *)(a2 + 32) = v8;
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 40);
  *(_BYTE *)(a2 + 48) = *(_BYTE *)(a1 + 48);
  v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E680) + 36);
  v10 = *(_QWORD *)(a1 + v9);
  swift_retain();
  *(_QWORD *)(a2 + v9) = v10;
  v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E688) + 28);
  v2 = sub_1D565F6E4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a2 + v9 + v11, a1 + v9 + v11);
  v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E690) + 36);
  v14 = *(_QWORD *)(a1 + v13);
  swift_retain();
  *(_QWORD *)(a2 + v13) = v14;
  v16 = *(_QWORD *)(a1 + v13 + 8);
  swift_retain();
  result = a2;
  *(_QWORD *)(a2 + v13 + 8) = v16;
  return result;
}

_BYTE *sub_1D5629458(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A0);
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t))(v13 + 48))(a1, 1))
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1EFF3E6D0);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    a2[16] = a1[16];
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A8);
    v7 = &a2[*(int *)(v2 + 44)];
    v6 = &a1[*(int *)(v2 + 44)];
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6B0);
    (*(void (**)(_BYTE *, _BYTE *))(*(_QWORD *)(v3 - 8) + 16))(v7, v6);
    v8 = *(int *)(v12 + 36);
    v9 = *(_QWORD *)&a1[v8];
    swift_retain();
    *(_QWORD *)&a2[v8] = v9;
    (*(void (**)(void))(v13 + 56))();
  }
  return a2;
}

unint64_t sub_1D5629594()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = qword_1EFF3E898;
  if (!qword_1EFF3E898)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EFF3E6D0);
    v4 = sub_1D5628FD4();
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0CE0798], v2, &v4);
    atomic_store(v0, (unint64_t *)&qword_1EFF3E898);
    return v0;
  }
  return v3;
}

uint64_t sub_1D5629610@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D56243FC(*(const void **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_1D562962C()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = qword_1EFF3E8A0;
  if (!qword_1EFF3E8A0)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E6B0);
    v4 = sub_1D56296A8();
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0CDFEE8], v2, &v4);
    atomic_store(v0, (unint64_t *)&qword_1EFF3E8A0);
    return v0;
  }
  return v3;
}

unint64_t sub_1D56296A8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E8A8;
  if (!qword_1EFF3E8A8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E8B0);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CE0680], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E8A8);
    return v1;
  }
  return v3;
}

uint64_t sub_1D5629718(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A8) + 44);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6B0);
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(a1 + v3);
  return a1;
}

uint64_t sub_1D5629774(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A8) + 44);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6B0);
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(a1 + v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A0);
  swift_release();
  return a1;
}

uint64_t sub_1D56297F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;

  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_BYTE *)(a2 + 16) = *(_BYTE *)(a1 + 16);
  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A8) + 44);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a2 + v4, a1 + v4);
  v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E6A0) + 36);
  v8 = *(_QWORD *)(a1 + v7);
  swift_retain();
  result = a2;
  *(_QWORD *)(a2 + v7) = v8;
  return result;
}

uint64_t sub_1D56298AC()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1D56298F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1D5624674(a1, v2 + 32, *(_QWORD *)(v2 + 16), a2);
}

unint64_t sub_1D562990C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E8B8;
  if (!qword_1EFF3E8B8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1ED9AA190);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEAF48], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E8B8);
    return v1;
  }
  return v3;
}

unint64_t sub_1D562997C()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  v4 = qword_1EFF3E8D0;
  if (!qword_1EFF3E8D0)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E8C8);
    v0 = sub_1D5608FAC();
    v5[0] = MEMORY[0x1E0CDF820];
    v5[1] = v0;
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CD9C20], v3, v5);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E8D0);
    return v1;
  }
  return v4;
}

_QWORD *sub_1D5629A04(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (*a1)
  {
    v3 = *a1;
    swift_retain();
    *a2 = v3;
    v4 = a1[1];
    swift_retain();
    a2[1] = v4;
    v5 = a1[2];
    swift_retain();
    a2[2] = v5;
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    a2[2] = a1[2];
  }
  return a2;
}

unint64_t sub_1D5629AB0()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = qword_1EFF3E8E0;
  if (!qword_1EFF3E8E0)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E8D8);
    v4 = sub_1D562997C();
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0CE0798], v2, &v4);
    atomic_store(v0, (unint64_t *)&qword_1EFF3E8E0);
    return v0;
  }
  return v3;
}

_QWORD *sub_1D5629B2C(_QWORD *a1)
{
  if (*a1)
  {
    swift_release();
    swift_release();
    swift_release();
  }
  return a1;
}

void *sub_1D5629B88(const void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9;

  v9 = *(_QWORD *)(a3 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v9 + 48))(a1, 1))
  {
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(a4 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(a2, a1, a3);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(a2, 0, 1, a3);
  }
  return a2;
}

uint64_t sub_1D5629C34()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D5629CD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_1D56215D8(a1, v2 + 4, v2[2], v2[3], a2);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1D5629CF4()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

uint64_t sub_1D5629D28()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1D5629DD4()
{
  uint64_t v0;

  return sub_1D562203C((const void *)(v0 + 32), *(void **)(v0 + 208), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1D5629DF4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(a2 - 8) + 8))();
}

uint64_t sub_1D5629E20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D56220BC(*(const void **)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_1D5629E40()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E8F8;
  if (!qword_1EFF3E8F8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E8F0);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CD8668], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E8F8);
    return v1;
  }
  return v3;
}

unint64_t sub_1D5629EB0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E900;
  if (!qword_1EFF3E900)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E580);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CDB838], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E900);
    return v1;
  }
  return v3;
}

uint64_t sub_1D5629F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;

  (*(void (**)(void))(*(_QWORD *)(a2 - 8) + 8))();
  v8 = *(int *)(a5 + 36);
  v9 = *(int *)(sub_1D565F3A8() + 20);
  v5 = sub_1D565F474();
  (*(void (**)(uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1 + v8 + v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E8F0);
  swift_release();
  return a1;
}

unint64_t sub_1D5629FC0()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  v3 = qword_1EFF3E910;
  if (!qword_1EFF3E910)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E588);
    v4[0] = sub_1D5603764();
    v4[1] = MEMORY[0x1E0CD9728];
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0CD9C20], v2, v4);
    atomic_store(v0, (unint64_t *)&qword_1EFF3E910);
    return v0;
  }
  return v3;
}

__n128 sub_1D562A048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  __n128 result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;

  (*(void (**)(void))(*(_QWORD *)(a3 - 8) + 16))();
  memcpy((void *)(a2 + *(int *)(a4 + 36)), (const void *)(a1 + *(int *)(a4 + 36)), 0x29uLL);
  memcpy((void *)(a2 + *(int *)(a5 + 36)), (const void *)(a1 + *(int *)(a5 + 36)), 0x29uLL);
  v17 = (char *)(a1 + *(int *)(a6 + 36));
  v18 = (char *)(a2 + *(int *)(a6 + 36));
  *(_OWORD *)v18 = *(_OWORD *)v17;
  v13 = *(int *)(sub_1D565F3A8() + 20);
  v6 = sub_1D565F474();
  (*(void (**)(char *, char *))(*(_QWORD *)(v6 - 8) + 16))(&v18[v13], &v17[v13]);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E8F0);
  v15 = *(int *)(v14 + 52);
  v16 = *(_QWORD *)&v17[v15];
  swift_retain();
  *(_QWORD *)&v18[v15] = v16;
  *(_WORD *)&v18[*(int *)(v14 + 56)] = *(_WORD *)&v17[*(int *)(v14 + 56)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E580);
  result = *(__n128 *)&v17[*(int *)(v7 + 36)];
  *(__n128 *)&v18[*(int *)(v7 + 36)] = result;
  return result;
}

uint64_t sub_1D562A1DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = sub_1D565FB04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a2, a1);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E588);
  result = a2;
  *(_QWORD *)(a2 + *(int *)(v3 + 36)) = *(_QWORD *)(a1 + *(int *)(v3 + 36));
  return result;
}

unint64_t sub_1D562A244()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E918;
  if (!qword_1EFF3E918)
  {
    v0 = sub_1D565F3A8();
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CDA078], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E918);
    return v1;
  }
  return v3;
}

uint64_t sub_1D562A2B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(sub_1D565F3A8() + 20);
  v1 = sub_1D565F474();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(a1 + v3);
  return a1;
}

uint64_t sub_1D562A310(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(sub_1D565F3A8() + 20);
  v1 = sub_1D565F474();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(a1 + v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E8F0);
  swift_release();
  return a1;
}

char *sub_1D562A38C(char *a1, char *a2)
{
  uint64_t v2;
  char *result;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_OWORD *)a2 = *(_OWORD *)a1;
  v4 = *(int *)(sub_1D565F3A8() + 20);
  v2 = sub_1D565F474();
  (*(void (**)(char *, char *))(*(_QWORD *)(v2 - 8) + 16))(&a2[v4], &a1[v4]);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E8F0);
  v6 = *(int *)(v8 + 52);
  v7 = *(_QWORD *)&a1[v6];
  swift_retain();
  result = a2;
  *(_QWORD *)&a2[v6] = v7;
  *(_WORD *)&a2[*(int *)(v8 + 56)] = *(_WORD *)&a1[*(int *)(v8 + 56)];
  return result;
}

unint64_t sub_1D562A468()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  v4 = qword_1EFF3E968;
  if (!qword_1EFF3E968)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E960);
    v0 = sub_1D562A4F0();
    v5[0] = MEMORY[0x1E0CDF820];
    v5[1] = v0;
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CD9C20], v3, v5);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E968);
    return v1;
  }
  return v4;
}

unint64_t sub_1D562A4F0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E970;
  if (!qword_1EFF3E970)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E978);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CDCF80], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E970);
    return v1;
  }
  return v3;
}

unint64_t sub_1D562A560()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  v3 = qword_1EFF3E988;
  if (!qword_1EFF3E988)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E980);
    v4[0] = sub_1D562A468();
    v4[1] = sub_1D5608FAC();
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0CD9C20], v2, v4);
    atomic_store(v0, (unint64_t *)&qword_1EFF3E988);
    return v0;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1D562A5EC()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1D562A644()
{
  swift_bridgeObjectRetain();
}

unint64_t sub_1D562A66C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E998;
  if (!qword_1EFF3E998)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E930);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CE0638], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E998);
    return v1;
  }
  return v3;
}

unint64_t sub_1D562A6DC()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  v3 = qword_1EFF3E9A0;
  if (!qword_1EFF3E9A0)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E938);
    v4[0] = sub_1D562A66C();
    v4[1] = sub_1D5608FAC();
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0CD9C20], v2, v4);
    atomic_store(v0, (unint64_t *)&qword_1EFF3E9A0);
    return v0;
  }
  return v3;
}

unint64_t sub_1D562A768()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E9A8;
  if (!qword_1EFF3E9A8)
  {
    v0 = sub_1D565F4C8();
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CDB4B0], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E9A8);
    return v1;
  }
  return v3;
}

uint64_t sub_1D562A7D8(uint64_t a1)
{
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E930);
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E938);
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_1D562A84C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D562A8F0(uint64_t a1)
{
  uint64_t *v1;

  return sub_1D5620B78(a1, v1 + 4, v1[2], v1[3]);
}

unint64_t sub_1D562A90C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E9B0;
  if (!qword_1EFF3E9B0)
  {
    v0 = sub_1D566029C();
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CB1F20], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E9B0);
    return v1;
  }
  return v3;
}

uint64_t sub_1D562A97C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D562AA20()
{
  uint64_t *v0;

  return sub_1D5620CA4(v0 + 4, v0[2], v0[3]);
}

unint64_t sub_1D562AA3C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E9B8;
  if (!qword_1EFF3E9B8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E958);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CDA108], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E9B8);
    return v1;
  }
  return v3;
}

uint64_t sub_1D562AAAC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E950);
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(a1);
  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E958) + 52);
  v2 = sub_1D566029C();
  (*(void (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1 + v4);
  swift_release();
  return a1;
}

unint64_t sub_1D562AB40()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E9C0;
  if (!qword_1EFF3E9C0)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E920);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CDFA58], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E9C0);
    return v1;
  }
  return v3;
}

unint64_t sub_1D562ABB0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3E9C8;
  if (!qword_1EFF3E9C8)
  {
    v0 = sub_1D565F390();
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0CD9F68], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3E9C8);
    return v1;
  }
  return v3;
}

uint64_t sub_1D562AC20(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E618);
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

void *sub_1D562AC94(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;
  uint64_t v7;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E618);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E928);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a2, a1, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

_QWORD *sub_1D562AD54(uint64_t *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v9;

  v3 = *a1;
  swift_retain();
  *a2 = v3;
  v4 = a1[1];
  swift_retain();
  a2[1] = v4;
  v5 = a1[2];
  swift_retain();
  a2[2] = v5;
  v7 = a1[3];
  swift_retain();
  a2[3] = v7;
  v9 = a1[4];
  swift_retain();
  result = a2;
  a2[4] = v9;
  return result;
}

void *sub_1D562ADFC(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;
  uint64_t v7;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E618);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E928);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

unint64_t sub_1D562AEBC()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v3 = qword_1EFF3E9D0;
  if (!qword_1EFF3E9D0)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E928);
    v4[1] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3E920);
    v4[2] = sub_1D565F390();
    v4[3] = sub_1D562AB40();
    v4[4] = sub_1D562ABB0();
    v4[0] = swift_getOpaqueTypeConformance2();
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0CE0798], v2, v4);
    atomic_store(v0, (unint64_t *)&qword_1EFF3E9D0);
    return v0;
  }
  return v3;
}

uint64_t sub_1D562AF98()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D562B03C()
{
  uint64_t *v0;

  return sub_1D5620E58(v0 + 4, v0[2], v0[3]);
}

unint64_t sub_1D562B058()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1EFF3E9D8;
  if (!qword_1EFF3E9D8)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EFF3E9D8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1D562B0BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D561A9C4(*(void **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_1D562B0D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v14;
  uint64_t v15;

  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_BYTE *)(a2 + 16) = *(_BYTE *)(a1 + 16);
  v15 = a2 + *(int *)(a6 + 44);
  v14 = a1 + *(int *)(a6 + 44);
  (*(void (**)(void))(*(_QWORD *)(a3 - 8) + 16))();
  v10 = v14 + *(int *)(a4 + 48);
  v11 = v15 + *(int *)(a4 + 48);
  *(_QWORD *)v11 = *(_QWORD *)v10;
  *(_BYTE *)(v11 + 8) = *(_BYTE *)(v10 + 8);
  memcpy((void *)(a2 + *(int *)(a8 + 36)), (const void *)(a1 + *(int *)(a8 + 36)), 0x30uLL);
  memcpy((void *)(a2 + *(int *)(a9 + 36)), (const void *)(a1 + *(int *)(a9 + 36)), 0x70uLL);
  memcpy((void *)(a2 + *(int *)(a10 + 36)), (const void *)(a1 + *(int *)(a10 + 36)), 0x29uLL);
  return a2;
}

uint64_t sub_1D562B1F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D561BC7C(*(void **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_1D562B20C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3E9E0;
  if (!qword_1EFF3E9E0)
  {
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0CDA290], MEMORY[0x1E0CDA2A8]);
    atomic_store(v0, (unint64_t *)&qword_1EFF3E9E0);
    return v0;
  }
  return v2;
}

uint64_t sub_1D562B274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v26;
  uint64_t v28;

  v26 = *(int *)(a18 + 44);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E578);
  (*(void (**)(void))(*(_QWORD *)(v18 - 8) + 8))();
  v28 = *(int *)(a16 + 48);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(a14 - 8) + 48))(a1 + v26 + v28, 1))
  {
    v19 = sub_1D565FB04();
    (*(void (**)(void))(*(_QWORD *)(v19 - 8) + 8))();
    v21 = a1 + v26 + v28 + *(int *)(a13 + 48) + *(int *)(a10 + 44);
    (*(void (**)(uint64_t))(*(_QWORD *)(a2 - 8) + 8))(v21 + *(int *)(a3 + 44));
    swift_release();
    (*(void (**)(uint64_t))(*(_QWORD *)(a7 - 8) + 8))(v21 + *(int *)(a8 + 48));
  }
  return a1;
}

uint64_t sub_1D562B3E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v26;
  uint64_t v28;

  v26 = *(int *)(a18 + 44);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E578);
  (*(void (**)(void))(*(_QWORD *)(v18 - 8) + 8))();
  v28 = *(int *)(a16 + 48);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(a14 - 8) + 48))(a1 + v26 + v28, 1))
  {
    v19 = sub_1D565FB04();
    (*(void (**)(void))(*(_QWORD *)(v19 - 8) + 8))();
    v21 = a1 + v26 + v28 + *(int *)(a13 + 48) + *(int *)(a10 + 44);
    (*(void (**)(uint64_t))(*(_QWORD *)(a2 - 8) + 8))(v21 + *(int *)(a3 + 44));
    swift_release();
    (*(void (**)(uint64_t))(*(_QWORD *)(a7 - 8) + 8))(v21 + *(int *)(a8 + 48));
  }
  swift_release();
  return a1;
}

uint64_t sub_1D562B568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v32;
  uint64_t v34;

  v32 = *(int *)(a18 + 44);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E578);
  (*(void (**)(void))(*(_QWORD *)(v21 - 8) + 8))();
  v34 = *(int *)(a16 + 48);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(a14 - 8) + 48))(a1 + v32 + v34, 1))
  {
    v22 = sub_1D565FB04();
    (*(void (**)(void))(*(_QWORD *)(v22 - 8) + 8))();
    v27 = a1 + v32 + v34 + *(int *)(a13 + 48) + *(int *)(a10 + 44);
    (*(void (**)(uint64_t))(*(_QWORD *)(a2 - 8) + 8))(v27 + *(int *)(a3 + 44));
    swift_release();
    (*(void (**)(uint64_t))(*(_QWORD *)(a7 - 8) + 8))(v27 + *(int *)(a8 + 48));
  }
  swift_release();
  v25 = a1 + *(int *)(a21 + 36);
  v26 = v25 + *(int *)(sub_1D565F3A8() + 20);
  v23 = sub_1D565F474();
  (*(void (**)(uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v26);
  return a1;
}

uint64_t sub_1D562B750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v32;
  uint64_t v34;

  v32 = *(int *)(a18 + 44);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E578);
  (*(void (**)(void))(*(_QWORD *)(v21 - 8) + 8))();
  v34 = *(int *)(a16 + 48);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(a14 - 8) + 48))(a1 + v32 + v34, 1))
  {
    v22 = sub_1D565FB04();
    (*(void (**)(void))(*(_QWORD *)(v22 - 8) + 8))();
    v27 = a1 + v32 + v34 + *(int *)(a13 + 48) + *(int *)(a10 + 44);
    (*(void (**)(uint64_t))(*(_QWORD *)(a2 - 8) + 8))(v27 + *(int *)(a3 + 44));
    swift_release();
    (*(void (**)(uint64_t))(*(_QWORD *)(a7 - 8) + 8))(v27 + *(int *)(a8 + 48));
  }
  swift_release();
  v25 = a1 + *(int *)(a21 + 36);
  v26 = v25 + *(int *)(sub_1D565F3A8() + 20);
  v23 = sub_1D565F474();
  (*(void (**)(uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v26);
  swift_release();
  return a1;
}

uint64_t sub_1D562B954()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

void *sub_1D562B9F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_1D561EFBC(v1 + 4, v1[2], v1[3], a1);
}

uint64_t sub_1D562BA14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v32;
  uint64_t v34;

  v32 = *(int *)(a18 + 44);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E578);
  (*(void (**)(void))(*(_QWORD *)(v21 - 8) + 8))();
  v34 = *(int *)(a16 + 48);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(a14 - 8) + 48))(a1 + v32 + v34, 1))
  {
    v22 = sub_1D565FB04();
    (*(void (**)(void))(*(_QWORD *)(v22 - 8) + 8))();
    v27 = a1 + v32 + v34 + *(int *)(a13 + 48) + *(int *)(a10 + 44);
    (*(void (**)(uint64_t))(*(_QWORD *)(a2 - 8) + 8))(v27 + *(int *)(a3 + 44));
    swift_release();
    (*(void (**)(uint64_t))(*(_QWORD *)(a7 - 8) + 8))(v27 + *(int *)(a8 + 48));
  }
  swift_release();
  v25 = a1 + *(int *)(a21 + 36);
  v26 = v25 + *(int *)(sub_1D565F3A8() + 20);
  v23 = sub_1D565F474();
  (*(void (**)(uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v26);
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_1D562BC34()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

void *sub_1D562BCD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_1D561F228(v1 + 4, v1[2], v1[3], a1);
}

uint64_t sub_1D562BCF4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D562BD98()
{
  uint64_t *v0;

  return sub_1D561D098(v0 + 4, v0[2], v0[3]);
}

uint64_t sub_1D562BDB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  uint64_t v16;

  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(a14 - 8) + 48))(a1, 1))
  {
    v14 = sub_1D565FB04();
    (*(void (**)(uint64_t))(*(_QWORD *)(v14 - 8) + 8))(a1);
    v16 = a1 + *(int *)(a13 + 48) + *(int *)(a10 + 44);
    (*(void (**)(uint64_t))(*(_QWORD *)(a2 - 8) + 8))(v16 + *(int *)(a3 + 44));
    swift_release();
    (*(void (**)(uint64_t))(*(_QWORD *)(a7 - 8) + 8))(v16 + *(int *)(a8 + 48));
  }
  return a1;
}

char *sub_1D562BEB0(char *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v31;

  v31 = *(_QWORD *)(a15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v31 + 48))(a1, 1))
  {
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(a16 - 8) + 64));
  }
  else
  {
    v16 = sub_1D565FB04();
    (*(void (**)(char *, char *))(*(_QWORD *)(v16 - 8) + 32))(a2, a1);
    v17 = *(int *)(a14 + 48);
    v22 = &a2[v17];
    v23 = &a1[v17];
    *v22 = a1[v17];
    v18 = *(int *)(a11 + 44);
    v20 = &a2[v17 + v18];
    v21 = &a1[v17 + v18];
    *(_OWORD *)v20 = *(_OWORD *)v21;
    v20[16] = v21[16];
    (*(void (**)(char *, char *))(*(_QWORD *)(a3 - 8) + 32))(&v20[*(int *)(a4 + 44)], &v21[*(int *)(a4 + 44)]);
    memcpy(&v20[*(int *)(a6 + 36)], &v21[*(int *)(a6 + 36)], 0x29uLL);
    *(_OWORD *)&v20[*(int *)(a7 + 36)] = *(_OWORD *)&v21[*(int *)(a7 + 36)];
    (*(void (**)(char *, char *))(*(_QWORD *)(a8 - 8) + 32))(&v20[*(int *)(a9 + 48)], &v21[*(int *)(a9 + 48)]);
    memcpy(&v22[*(int *)(a13 + 36)], &v23[*(int *)(a13 + 36)], 0x29uLL);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(a2, 0, 1, a15);
  }
  return a2;
}

char *sub_1D562C0A4(char *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v35;

  v35 = *(_QWORD *)(a15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v35 + 48))(a1, 1))
  {
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(a16 - 8) + 64));
  }
  else
  {
    v16 = sub_1D565FB04();
    (*(void (**)(char *, char *))(*(_QWORD *)(v16 - 8) + 16))(a2, a1);
    v17 = *(int *)(a14 + 48);
    v26 = &a2[v17];
    v27 = &a1[v17];
    *v26 = a1[v17];
    v18 = *(int *)(a11 + 44);
    v24 = &a2[v17 + v18];
    v25 = &a1[v17 + v18];
    *(_OWORD *)v24 = *(_OWORD *)v25;
    v24[16] = v25[16];
    (*(void (**)(char *, char *))(*(_QWORD *)(a3 - 8) + 16))(&v24[*(int *)(a4 + 44)], &v25[*(int *)(a4 + 44)]);
    memcpy(&v24[*(int *)(a6 + 36)], &v25[*(int *)(a6 + 36)], 0x29uLL);
    v19 = *(int *)(a7 + 36);
    v22 = &v24[v19];
    v21 = *(_QWORD *)&v25[v19];
    v23 = *(_QWORD *)&v25[v19 + 8];
    swift_retain();
    *(_QWORD *)v22 = v21;
    *((_QWORD *)v22 + 1) = v23;
    (*(void (**)(char *, char *))(*(_QWORD *)(a8 - 8) + 16))(&v24[*(int *)(a9 + 48)], &v25[*(int *)(a9 + 48)]);
    memcpy(&v26[*(int *)(a13 + 36)], &v27[*(int *)(a13 + 36)], 0x29uLL);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(a2, 0, 1, a15);
  }
  return a2;
}

uint64_t sub_1D562C2CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D561D2A8(*(void **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_1D562C2E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v12;

  v12 = a1 + *(int *)(a10 + 44);
  (*(void (**)(uint64_t))(*(_QWORD *)(a2 - 8) + 8))(v12 + *(int *)(a3 + 44));
  swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)(a7 - 8) + 8))(v12 + *(int *)(a8 + 48));
  return a1;
}

_BYTE *sub_1D562C370(_BYTE *a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  _QWORD *v14;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  _BYTE *v22;

  *a2 = *a1;
  v13 = *(int *)(a11 + 44);
  v22 = &a1[v13];
  v21 = &a2[v13];
  *(_OWORD *)v21 = *(_OWORD *)&a1[v13];
  v21[16] = a1[v13 + 16];
  (*(void (**)(_BYTE *, _BYTE *))(*(_QWORD *)(a3 - 8) + 16))(&a2[v13 + *(int *)(a4 + 44)], &a1[v13 + *(int *)(a4 + 44)]);
  memcpy(&v21[*(int *)(a6 + 36)], &v22[*(int *)(a6 + 36)], 0x29uLL);
  v18 = *(int *)(a7 + 36);
  v19 = *(_QWORD *)&v22[v18];
  v20 = *(_QWORD *)&v22[v18 + 8];
  swift_retain();
  v14 = &v21[v18];
  *v14 = v19;
  v14[1] = v20;
  (*(void (**)(_BYTE *, _BYTE *))(*(_QWORD *)(a8 - 8) + 16))(&v21[*(int *)(a9 + 48)], &v22[*(int *)(a9 + 48)]);
  memcpy(&a2[*(int *)(a13 + 36)], &a1[*(int *)(a13 + 36)], 0x29uLL);
  return a2;
}

uint64_t sub_1D562C4C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1 + *(int *)(a3 + 44));
  swift_release();
  return a1;
}

uint64_t *sub_1D562C514@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D561DE84(*(const void **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_1D562C530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;
  _QWORD *v8;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_BYTE *)(a2 + 16) = *(_BYTE *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))(a2 + *(int *)(a4 + 44), a1 + *(int *)(a4 + 44));
  memcpy((void *)(a2 + *(int *)(a6 + 36)), (const void *)(a1 + *(int *)(a6 + 36)), 0x29uLL);
  v13 = *(int *)(a7 + 36);
  v14 = *(_QWORD *)(a1 + v13);
  v15 = *(_QWORD *)(a1 + v13 + 8);
  swift_retain();
  result = a2;
  v8 = (_QWORD *)(a2 + v13);
  *v8 = v14;
  v8[1] = v15;
  return result;
}

uint64_t sub_1D562C5FC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D562C6A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_1D561E34C(a1, v2 + 4, v2[2], v2[3], a2);
}

uint64_t sub_1D562C6BC()
{
  uint64_t v0;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v4 = sub_1D565F378();
  v2 = *(_QWORD *)(v4 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 201) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v4);
  return swift_deallocObject();
}

uint64_t sub_1D562C7B0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v0[2];
  v4 = v0[3];
  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_1D565F378() - 8) + 80);
  return sub_1D561EA58(v0 + 4, (uint64_t)v0 + ((v1 + 201) & ~v1), v3, v4);
}

void sub_1D562C808()
{
  uint64_t v0;

  sub_1D561ED1C(*(_QWORD *)(v0 + 32), *(id *)(v0 + 40));
}

Swift::Void __swiftcall NSDiffableDataSourceSnapshot.mui_reconfigureItems(_:)(Swift::OpaquePointer a1)
{
  sub_1D565F15C();
}

uint64_t NSDiffableDataSourceSnapshot.mui_moveSections(_:before:)(uint64_t a1, const void *a2, uint64_t a3)
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
  int v18;
  char *v19;
  int v20;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _BOOL4 v27;
  uint64_t v28;
  int v29;
  _BOOL4 v30;
  void (*v31)(char *, char *, uint64_t);
  void (*v32)(char *, uint64_t, uint64_t);
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  int v35;
  unsigned int (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  const char *v38;
  _QWORD *v39;
  unint64_t v40;
  char *v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  unint64_t v47;
  char *v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  const void *v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  unint64_t v56;
  char *v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  _QWORD v69[2];
  char v70;
  uint64_t v71;
  _QWORD v72[2];
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  char *v80;
  uint64_t v81;

  v61 = a1;
  v52 = a2;
  v51 = a3;
  v38 = "MailUI/NSDiffableDataSourceSnapshot+MailUI.swift";
  v80 = 0;
  v79 = 0;
  v78 = 0;
  v77 = 0;
  v76 = 0;
  v75 = 0;
  v73 = 0;
  v64 = v72;
  v72[0] = 0;
  v72[1] = 0;
  v39 = *(_QWORD **)(a3 - 8);
  v40 = (v39[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](a1);
  v41 = (char *)&v23 - v40;
  v42 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78]((char *)&v23 - v40);
  v43 = (char *)&v23 - v42;
  v62 = *(_QWORD *)(v5 + 16);
  v81 = v62;
  v44 = *(_QWORD *)(v62 - 8);
  v45 = (*(_QWORD *)(v44 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78]((char *)&v23 - v42);
  v46 = (char *)&v23 - v45;
  v80 = (char *)&v23 - v45;
  v47 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v7);
  v48 = (char *)&v23 - v47;
  v79 = (char *)&v23 - v47;
  v49 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v9);
  v50 = (char *)&v23 - v49;
  v78 = (char *)&v23 - v49;
  v60 = 0;
  v53 = sub_1D566041C();
  v54 = (*(_QWORD *)(*(_QWORD *)(v53 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v61);
  v55 = (char *)&v23 - v54;
  v56 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v11);
  v57 = (char *)&v23 - v56;
  v58 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v13);
  v59 = (char *)&v23 - v58;
  v77 = v14;
  v76 = v15;
  v75 = v3;
  v74 = *(_QWORD *)(v16 + 24);
  v73 = 0;
  swift_bridgeObjectRetain();
  v71 = v61;
  v65 = sub_1D5660038();
  v66 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEAF50]);
  sub_1D56601B8();
  while (1)
  {
    while (1)
    {
      sub_1D56605FC();
      sub_1D56605D8();
      v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48);
      if (v36(v59, 1, v62) == 1)
      {
        sub_1D5565788();
        return v73;
      }
      v17 = v43;
      v31 = *(void (**)(char *, char *, uint64_t))(v44 + 32);
      v31(v50, v59, v62);
      v32 = (void (*)(char *, uint64_t, uint64_t))v39[2];
      v32(v17, v37, v51);
      v34 = sub_1D565F150();
      v35 = v18;
      v33 = (void (*)(char *, uint64_t))v39[1];
      v33(v43, v51);
      v69[1] = v34;
      v70 = v35 & 1;
      v30 = (v35 & 1) == 0;
      if ((v35 & 1) == 0)
        break;
      (*(void (**)(char *, uint64_t))(v44 + 8))(v50, v62);
    }
    sub_1D5629B88(v52, v57, v62, v53);
    if (v36(v57, 1, v62) == 1)
    {
      sub_1D562D0AC((uint64_t)v57, v62);
      goto LABEL_9;
    }
    v19 = v43;
    v31(v48, v57, v62);
    v32(v19, v37, v51);
    v28 = sub_1D565F150();
    v29 = v20;
    v33(v43, v51);
    v67 = v28;
    v68 = v29 & 1;
    v27 = (v29 & 1) == 0;
    if ((v29 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t))(v44 + 8))(v48, v62);
LABEL_9:
      v32(v41, v37, v51);
      v25 = sub_1D565F168();
      v33(v41, v51);
      swift_bridgeObjectRetain();
      v26 = v69;
      v69[0] = v25;
      MEMORY[0x1D82763B0](MEMORY[0x1E0DEAF20], v65, v63);
      sub_1D565FD44();
      sub_1D5565788();
      if (v36(v55, 1, v62) == 1)
      {
        sub_1D562D0AC((uint64_t)v55, v62);
        swift_bridgeObjectRelease();
        result = sub_1D5660608();
      }
      else
      {
        v31(v46, v55, v62);
        swift_bridgeObjectRelease();
        sub_1D565F138();
        result = (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v46, v62);
      }
      goto LABEL_12;
    }
    sub_1D565F144();
    result = (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v48, v62);
LABEL_12:
    v24 = v73 + 1;
    if (__OFADD__(v73, 1))
      break;
    v73 = v24;
    (*(void (**)(char *, uint64_t))(v44 + 8))(v50, v62);
  }
  __break(1u);
  return result;
}

uint64_t sub_1D562D0AC(uint64_t a1, uint64_t a2)
{
  uint64_t v5;

  v5 = *(_QWORD *)(a2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v5 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, a2);
  return a1;
}

uint64_t sub_1D562D118()
{
  return sub_1D565FE64();
}

uint64_t NSDiffableDataSourceSnapshot.mui_moveSections(_:after:)(uint64_t a1, const void *a2, uint64_t a3)
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
  int v18;
  char *v19;
  int v20;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _BOOL4 v27;
  uint64_t v28;
  int v29;
  _BOOL4 v30;
  void (*v31)(char *, char *, uint64_t);
  void (*v32)(char *, uint64_t, uint64_t);
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  int v35;
  unsigned int (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  const char *v38;
  _QWORD *v39;
  unint64_t v40;
  char *v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  unint64_t v47;
  char *v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  const void *v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  unint64_t v56;
  char *v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  char v68;
  _QWORD v69[2];
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[2];
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  char *v82;
  uint64_t v83;

  v60 = a1;
  v52 = a2;
  v51 = a3;
  v38 = "MailUI/NSDiffableDataSourceSnapshot+MailUI.swift";
  v82 = 0;
  v81 = 0;
  v80 = 0;
  v79 = 0;
  v78 = 0;
  v77 = 0;
  v75 = 0;
  v66 = v74;
  v74[0] = 0;
  v74[1] = 0;
  v39 = *(_QWORD **)(a3 - 8);
  v40 = (v39[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](a1);
  v41 = (char *)&v23 - v40;
  v42 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78]((char *)&v23 - v40);
  v43 = (char *)&v23 - v42;
  v61 = *(_QWORD *)(v5 + 16);
  v83 = v61;
  v44 = *(_QWORD *)(v61 - 8);
  v45 = (*(_QWORD *)(v44 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78]((char *)&v23 - v42);
  v46 = (char *)&v23 - v45;
  v82 = (char *)&v23 - v45;
  v47 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v7);
  v48 = (char *)&v23 - v47;
  v81 = (char *)&v23 - v47;
  v49 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v9);
  v50 = (char *)&v23 - v49;
  v80 = (char *)&v23 - v49;
  v63 = 0;
  v53 = sub_1D566041C();
  v54 = (*(_QWORD *)(*(_QWORD *)(v53 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v60);
  v55 = (char *)&v23 - v54;
  v56 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v11);
  v57 = (char *)&v23 - v56;
  v58 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v13);
  v59 = (char *)&v23 - v58;
  v79 = v14;
  v78 = v15;
  v77 = v3;
  v76 = *(_QWORD *)(v16 + 24);
  v75 = 0;
  swift_bridgeObjectRetain();
  v72 = v60;
  v64 = sub_1D5660038();
  v65 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEAF20]);
  sub_1D565FD5C();
  v71 = v73;
  sub_1D5660698();
  sub_1D5660674();
  while (1)
  {
    while (1)
    {
      sub_1D566068C();
      sub_1D5660680();
      v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48);
      if (v36(v59, 1, v61) == 1)
      {
        sub_1D5565788();
        return v75;
      }
      v17 = v43;
      v31 = *(void (**)(char *, char *, uint64_t))(v44 + 32);
      v31(v50, v59, v61);
      v32 = (void (*)(char *, uint64_t, uint64_t))v39[2];
      v32(v17, v37, v51);
      v34 = sub_1D565F150();
      v35 = v18;
      v33 = (void (*)(char *, uint64_t))v39[1];
      v33(v43, v51);
      v69[1] = v34;
      v70 = v35 & 1;
      v30 = (v35 & 1) == 0;
      if ((v35 & 1) == 0)
        break;
      (*(void (**)(char *, uint64_t))(v44 + 8))(v50, v61);
    }
    sub_1D5629B88(v52, v57, v61, v53);
    if (v36(v57, 1, v61) == 1)
    {
      sub_1D562D0AC((uint64_t)v57, v61);
      goto LABEL_9;
    }
    v19 = v43;
    v31(v48, v57, v61);
    v32(v19, v37, v51);
    v28 = sub_1D565F150();
    v29 = v20;
    v33(v43, v51);
    v67 = v28;
    v68 = v29 & 1;
    v27 = (v29 & 1) == 0;
    if ((v29 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t))(v44 + 8))(v48, v61);
LABEL_9:
      v32(v41, v37, v51);
      v25 = sub_1D565F168();
      v33(v41, v51);
      swift_bridgeObjectRetain();
      v26 = v69;
      v69[0] = v25;
      MEMORY[0x1D82763B0](MEMORY[0x1E0DEAF50], v64, v62);
      sub_1D566017C();
      sub_1D5565788();
      if (v36(v55, 1, v61) == 1)
      {
        sub_1D562D0AC((uint64_t)v55, v61);
        swift_bridgeObjectRelease();
        result = sub_1D5660608();
      }
      else
      {
        v31(v46, v55, v61);
        swift_bridgeObjectRelease();
        sub_1D565F144();
        result = (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v46, v61);
      }
      goto LABEL_12;
    }
    sub_1D565F138();
    result = (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v48, v61);
LABEL_12:
    v24 = v75 + 1;
    if (__OFADD__(v75, 1))
      break;
    v75 = v24;
    (*(void (**)(char *, uint64_t))(v44 + 8))(v50, v61);
  }
  __break(1u);
  return result;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> NSRegularExpression.init(tokens:options:)(NSRegularExpression *__return_ptr retstr, Swift::OpaquePointer tokens, NSRegularExpressionOptions options)
{
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24[5];
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSRegularExpressionOptions v31;
  void *rawValue;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = 0;
  rawValue = tokens._rawValue;
  v31 = options;
  swift_bridgeObjectRetain();
  v30 = tokens._rawValue;
  v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9AA190);
  sub_1D5616DD8();
  v23 = sub_1D5660590();
  if (v22)
  {
    __break(1u);
    __break(1u);
    __break(1u);
  }
  else
  {
    v29 = v23;
    sub_1D55743D0();
    v18 = sub_1D565FF24();
    sub_1D5565788();
    v28 = v18;
    v3 = sub_1D5595FB0();
    v17 = sub_1D556F498((void (*)(char *, char *))sub_1D562DDE0, 0, v21, MEMORY[0x1E0DEA968], MEMORY[0x1E0DEDCE8], v3, MEMORY[0x1E0DEDD18], v16);
    sub_1D5565788();
    v27 = v17;
    sub_1D565FE64();
    sub_1D55CAC78();
    v10 = (void *)sub_1D565FD68();
    v11 = v4;
    swift_bridgeObjectRelease();
    sub_1D5565788();
    v25 = v10;
    v26 = v11;
    v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    v33 = 0;
    v24[3] = (id)sub_1D5660770();
    v24[4] = v5;
    sub_1D565FE64();
    sub_1D5660764();
    swift_bridgeObjectRelease();
    v24[1] = v10;
    v24[2] = v11;
    sub_1D5660758();
    sub_1D565FE64();
    sub_1D5660764();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1D5530388();
    sub_1D565FE4C();
    v14 = (id)sub_1D565FDF8();
    swift_bridgeObjectRelease();
    v24[0] = v33;
    v15 = objc_msgSend(v12, sel_initWithPattern_options_error_, v14, options, v24);
    v13 = v24[0];
    v6 = v24[0];
    v7 = v33;
    v33 = v13;

    if (v15)
    {
      v8 = v15;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return;
    }
  }
  v9 = v33;
  sub_1D565ECAC();

  swift_willThrow();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

uint64_t *sub_1D562DDE0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *result;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v25 = 0;
  v26 = 0;
  v23 = 0;
  v24 = 0;
  v21 = a1[1];
  v25 = *a1;
  v26 = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v23 = v25;
  v24 = v21;
  sub_1D562E23C();
  sub_1D565FD50();
  sub_1D565FE64();
  sub_1D5590254();
  sub_1D5573454();
  v22 = sub_1D5660494();
  if ((v22 & 1) != 0)
  {
    sub_1D559036C();
    sub_1D5660200();
  }
  v15 = (id)objc_opt_self();
  swift_bridgeObjectRetain();
  v16 = (id)sub_1D565FDF8();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend(v15, sel_escapedPatternForString_, v16);

  v18 = sub_1D565FE10();
  v19 = v2;

  sub_1D565FE64();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9A97B0);
  sub_1D566077C();
  if ((v22 & 1) != 0)
  {
    v10 = v3;
    swift_bridgeObjectRetain();
    v10[3] = MEMORY[0x1E0DEA968];
    v10[4] = sub_1D55DFBF8();
    *v10 = v18;
    v10[1] = v19;
    sub_1D5571928();
    v11 = sub_1D565FE1C();
    v12 = v4;
    swift_bridgeObjectRelease();
    v13 = v11;
    v14 = v12;
  }
  else
  {
    v7 = v3;
    swift_bridgeObjectRetain();
    v7[3] = MEMORY[0x1E0DEA968];
    v7[4] = sub_1D55DFBF8();
    *v7 = v18;
    v7[1] = v19;
    sub_1D5571928();
    v8 = sub_1D565FE1C();
    v9 = v5;
    swift_bridgeObjectRelease();
    v13 = v8;
    v14 = v9;
  }
  swift_bridgeObjectRetain();
  *a2 = v13;
  a2[1] = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = &v23;
  sub_1D5530388();
  return result;
}

unint64_t sub_1D562E23C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1ED9A93A8;
  if (!qword_1ED9A93A8)
  {
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEA980], MEMORY[0x1E0DEA968]);
    atomic_store(v0, (unint64_t *)&qword_1ED9A93A8);
    return v0;
  }
  return v2;
}

__C::_NSRange __swiftcall NSString.rangeByAdding(maxNumberOfWordsBefore:maxNumberOfWordsAfter:range:)(Swift::Int maxNumberOfWordsBefore, Swift::Int maxNumberOfWordsAfter, __C::_NSRange range)
{
  id v3;
  id v4;
  Swift::Int v5;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  __C::_NSRange result;
  uint64_t v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  Swift::Int v22;
  void *v23;
  Swift::Int v24;
  id v25;
  Swift::Int v26;
  Swift::Int v27;
  BOOL v29;
  id v30;
  BOOL v32;
  BOOL v33;
  Swift::Int length;
  id v37;
  Swift::Int location;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t (*v42)(uint64_t, void *);
  void *v43;
  uint64_t (*v44)(uint64_t, uint64_t, NSUInteger, NSUInteger, uint64_t, uint64_t, uint64_t);
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  Swift::Int v49;
  uint64_t aBlock;
  int v51;
  int v52;
  uint64_t (*v53)(uint64_t, void *);
  void *v54;
  uint64_t (*v55)(uint64_t, uint64_t, NSUInteger, NSUInteger, uint64_t, uint64_t, uint64_t);
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  Swift::Int v61;
  Swift::Int v62;
  Swift::Int v63;
  Swift::Int v64;
  Swift::Int v65;
  Swift::Int v66;
  Swift::Int v67;
  Swift::Int v68;
  Swift::Int v69;
  id v70;
  Swift::Int v71;
  id v72;
  Swift::Int v73;
  Swift::Int v74;
  Swift::Int v75;
  BOOL v76;
  uint64_t v77;
  id v78;
  Swift::Int v79;
  Swift::Int v80;
  BOOL v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  __C::_NSRange v85;
  Swift::Int v86;
  Swift::Int v87;
  uint64_t v88;
  id v89;
  Swift::Int v90;
  Swift::Int v91;
  Swift::Int v92;
  Swift::Int v93;
  uint64_t v94;
  id v95;
  Swift::Int v96;
  Swift::Int v97;

  location = range.location;
  length = range.length;
  v84 = 0;
  v82 = 0;
  v83 = 0;
  v81 = 0;
  v76 = 0;
  v70 = 0;
  v71 = 0;
  v68 = 0;
  v69 = 0;
  v62 = 0;
  v63 = 0;
  v60 = 0;
  v61 = 0;
  v59 = 0;
  v58 = 0;
  v47 = 0;
  v87 = maxNumberOfWordsBefore;
  v86 = maxNumberOfWordsAfter;
  v85 = range;
  v33 = range.location != sub_1D565EB44() && length != 0;
  v3 = v37;
  v32 = v33 && objc_msgSend(v37, sel_length) != 0;

  if (!v32)
  {
    v23 = (void *)location;
    v24 = length;
    goto LABEL_31;
  }
  if (maxNumberOfWordsBefore <= 0 && maxNumberOfWordsAfter <= 0)
  {
    v23 = (void *)location;
    v24 = length;
    goto LABEL_31;
  }
  v30 = objc_msgSend(v37, sel_length);
  v82 = 0;
  v83 = v30;
  if (location < 0)
  {
    v29 = 0;
  }
  else
  {
    v88 = 0;
    v89 = v30;
    v29 = location < (uint64_t)v30;
  }
  v81 = v29;
  v79 = location;
  v80 = length;
  v96 = location;
  v97 = length;
  v77 = 0;
  v78 = v30;
  v94 = 0;
  v95 = v30;
  v76 = (uint64_t)v30 >= location + length;
  if (!v29 || (uint64_t)v30 < location + length)
  {
    v23 = (void *)location;
    v24 = length;
    goto LABEL_31;
  }
  v74 = location;
  v75 = length;
  v4 = objc_msgSend(v37, sel_paragraphRangeForRange_, location, length);
  v72 = v4;
  v73 = v5;
  v25 = v4;
  v26 = v5;
  v70 = v4;
  v71 = v5;
  v27 = location - (_QWORD)v4;
  if (__OFSUB__(location, v4))
  {
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v68 = location - (_QWORD)v4;
  v69 = length;
  v66 = location;
  v67 = length;
  v92 = location;
  v93 = length;
  v64 = location - (_QWORD)v4;
  v65 = length;
  v90 = location - (_QWORD)v4;
  v91 = length;
  if (__OFSUB__(v5, v27 + length))
    goto LABEL_33;
  v62 = location + length;
  v63 = v5 - (v27 + length);
  v60 = v4;
  v61 = location - (_QWORD)v4;
  v20 = swift_allocObject();
  v59 = v20 + 16;
  *(_QWORD *)(v20 + 16) = location;
  *(_QWORD *)(v20 + 24) = length;
  v19 = swift_allocObject();
  v58 = v19 + 16;
  *(_QWORD *)(v19 + 16) = 0;
  _s3__C18EnumerationOptionsVMa_0();
  sub_1D566077C();
  *v8 = 3;
  v8[1] = 256;
  sub_1D5571928();
  sub_1D556A930();
  sub_1D56604E8();
  v13 = v57;
  swift_retain();
  swift_retain();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v19;
  v9[3] = maxNumberOfWordsBefore;
  v9[4] = v20;
  v55 = sub_1D562EC94;
  v56 = v9;
  v15 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v51 = 1107296256;
  v52 = 0;
  v53 = sub_1D562ECC8;
  v54 = &block_descriptor_3;
  v14 = _Block_copy(&aBlock);
  swift_release();
  v48 = v25;
  v49 = v27;
  objc_msgSend(v37, (SEL)0x1F2FA5AF0, v25, v27, v13, v14);
  _Block_release(v14);
  v18 = swift_allocObject();
  v47 = v18 + 16;
  *(_QWORD *)(v18 + 16) = 0;
  sub_1D566077C();
  *v10 = 3;
  sub_1D5571928();
  sub_1D56604E8();
  v16 = v46;
  swift_retain();
  swift_retain();
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v18;
  v11[3] = maxNumberOfWordsAfter;
  v11[4] = v20;
  v44 = sub_1D562EC94;
  v45 = v11;
  v39 = v15;
  v40 = 1107296256;
  v41 = 0;
  v42 = sub_1D562ECC8;
  v43 = &block_descriptor_13;
  v17 = _Block_copy(&v39);
  swift_release();
  objc_msgSend(v37, (SEL)0x1F2FA5AF0, location + length, v26 - (v27 + length), v16, v17);
  _Block_release(v17);
  swift_beginAccess();
  v21 = *(void **)(v20 + 16);
  v22 = *(_QWORD *)(v20 + 24);
  swift_endAccess();
  swift_release();
  swift_release();
  swift_release();
  v23 = v21;
  v24 = v22;
LABEL_31:
  v4 = v23;
  v5 = v24;
LABEL_34:
  result.length = v5;
  result.location = (Swift::Int)v4;
  return result;
}

uint64_t sub_1D562E9D8()
{
  return swift_deallocObject();
}

uint64_t sub_1D562EA00()
{
  return swift_deallocObject();
}

uint64_t sub_1D562EA28(uint64_t a1, uint64_t a2, NSUInteger a3, NSUInteger a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, NSRange *a10)
{
  uint64_t result;
  uint64_t v11;
  NSRange v13;
  uint64_t v14;
  NSRange v15;
  uint64_t v18;
  char v19;
  NSRange v20;
  NSRange v21;
  NSRange v22;
  NSRange *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  uint64_t v31;
  uint64_t v32;

  v15.location = a3;
  v15.length = a4;
  v31 = a1;
  v32 = a2;
  v29 = a3;
  v30 = a4;
  v27 = a5;
  v28 = a6;
  v26 = a7;
  v25 = a8 + 16;
  v24 = a9;
  v23 = a10 + 1;
  swift_beginAccess();
  v18 = *(_QWORD *)(a8 + 16);
  swift_endAccess();
  if (v18 < a9)
  {
    swift_beginAccess();
    v13 = a10[1];
    swift_endAccess();
    v22 = v13;
    v21 = v15;
    v20 = NSUnionRange(v13, v15);
    swift_beginAccess();
    a10[1] = v20;
    swift_endAccess();
    result = swift_beginAccess();
    v11 = *(_QWORD *)(a8 + 16);
    v14 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
    }
    else
    {
      *(_QWORD *)(a8 + 16) = v14;
      return swift_endAccess();
    }
  }
  else
  {
    v19 = 1;
    return sub_1D564C02C((uint64_t)&v19, a7, MEMORY[0x1E0DEFC90]);
  }
  return result;
}

uint64_t sub_1D562EC50()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D562EC94(uint64_t a1, uint64_t a2, NSUInteger a3, NSUInteger a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  return sub_1D562EA28(a1, a2, a3, a4, a5, a6, a7, *(_QWORD *)(v7 + 16), *(_QWORD *)(v7 + 24), *(NSRange **)(v7 + 32));
}

uint64_t sub_1D562ECC8(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);

  v6 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = a2;
  if (a2)
  {
    v4 = sub_1D565FE10();

    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6(v5);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_1D562EE3C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t block_copy_helper_11(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_12()
{
  return swift_release();
}

uint64_t sub_1D562EEDC()
{
  swift_allocObject();
  return sub_1D5633C04();
}

uint64_t EMOriginalContentMessage.summarizableMessage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v7;
  id v8;
  unsigned int v9;
  int v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  char v45;
  char v46;
  void *v47;
  char *v48;

  v19 = a1;
  v48 = 0;
  v47 = 0;
  v44 = 0;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E9F0);
  v20 = (*(_QWORD *)(*(_QWORD *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v1);
  v21 = (char *)&v7 - v20;
  v31 = 0;
  v39 = sub_1D565ED78();
  v38 = *(_QWORD *)(v39 - 8);
  v22 = (*(_QWORD *)(v38 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v39);
  v37 = (char *)&v7 - v22;
  v23 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3E9F8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v31);
  v40 = (char *)&v7 - v23;
  v24 = sub_1D565F030();
  v25 = *(_QWORD *)(v24 - 8);
  v26 = (*(_QWORD *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (void *)MEMORY[0x1E0C80A78](v42);
  v27 = (char *)&v7 - v26;
  v48 = (char *)&v7 - v26;
  v47 = v2;
  v28 = objc_msgSend(v2, sel_searchableMessageID);
  v36 = objc_msgSend(v28, sel_stringValue);
  v32 = sub_1D565FE10();
  v33 = v3;

  v35 = objc_msgSend((id)objc_opt_self(), sel_searchableIndexBundleID);
  v29 = sub_1D565FE10();
  v30 = v4;
  v34 = objc_msgSend(v42, sel_bodyText);
  sub_1D565FE10();
  sub_1D565EFE8();

  v41 = objc_msgSend(v42, sel_date);
  sub_1D565ED6C();
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v40, v37, v39);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v40, 0, 1, v39);
  sub_1D565F000();

  v43 = objc_msgSend(v42, sel_subject);
  if (v43)
  {
    v18 = v43;
    v13 = v43;
    v14 = sub_1D565FE10();
    v15 = v5;

    v16 = v14;
    v17 = v15;
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  sub_1D565F024();
  v12 = objc_msgSend(v42, sel_flags);
  if (v12)
  {
    v11 = v12;
    v8 = v12;
    v9 = objc_msgSend(v12, sel_read);

    v10 = v9 & 1;
  }
  else
  {
    v10 = 2;
  }
  v45 = v10;
  if (v10 == 2)
    v46 = 1;
  else
    v46 = v45 & 1;
  sub_1D565F00C();
  v7 = objc_msgSend(v42, sel_sender);
  swift_getObjectType();
  sub_1D5633DAC();
  swift_unknownObjectRelease();
  sub_1D565F018();
  v44 = sub_1D563407C(v42);
  sub_1D565EFF4();
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 16))(v19, v27, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v27, v24);
}

uint64_t sub_1D562F3FC()
{
  id v1;
  uint64_t v2;

  sub_1D565FE64();
  sub_1D565FE64();
  v1 = sub_1D556D374();
  sub_1D556D3A0();
  v2 = sub_1D565EC34();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1D562F4DC()
{
  sub_1D5634354();
  return sub_1D5660560();
}

uint64_t sub_1D562F524()
{
  return sub_1D562F4DC();
}

uint64_t sub_1D562F53C()
{
  return sub_1D565FC0C();
}

uint64_t sub_1D562F550(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 56) = v2;
  *(_BYTE *)(v3 + 105) = a2 & 1;
  *(_QWORD *)(v3 + 48) = a1;
  *(_QWORD *)(v3 + 16) = v3;
  *(_QWORD *)(v3 + 24) = 0;
  *(_BYTE *)(v3 + 104) = 0;
  *(_QWORD *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 24) = a1;
  *(_BYTE *)(v3 + 104) = a2 & 1;
  *(_QWORD *)(v3 + 32) = v2;
  return swift_task_switch();
}

uint64_t sub_1D562F5BC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(_BYTE *)(v0 + 105);
  v5 = *(_QWORD *)(v0 + 48);
  *(_QWORD *)(v0 + 16) = v0;
  sub_1D565FE64();
  *(_QWORD *)(v0 + 64) = v1;
  v4 = swift_allocObject();
  *(_QWORD *)(v0 + 72) = v4;
  swift_retain();
  swift_weakInit();
  swift_release();
  swift_retain();
  swift_bridgeObjectRetain();
  v8 = swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v8;
  *(_QWORD *)(v8 + 16) = v4;
  *(_QWORD *)(v8 + 24) = v5;
  *(_BYTE *)(v8 + 32) = v6 & 1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 88) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3EA10);
  *v2 = *(_QWORD *)(v7 + 16);
  v2[1] = sub_1D562F73C;
  return sub_1D56607B8();
}

uint64_t sub_1D562F73C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  *(_QWORD *)(v2 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_1D562F82C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 16) + 8))(*(_QWORD *)(v0 + 40));
}

uint64_t sub_1D562F858()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 16) + 8))();
}

uint64_t sub_1D562F8F0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t Strong;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v18 = a1;
  v15 = a2;
  v16 = a3;
  v17 = a4;
  v33 = 0;
  v32 = 0;
  v31 = 0;
  v30 = 0;
  v27 = 0;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3EBF8);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(_QWORD *)(v20 + 64);
  v22 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
  v23 = (char *)&v10 - v22;
  v33 = MEMORY[0x1E0C80A78](v18);
  v24 = v4 + 16;
  v32 = v4 + 16;
  v31 = v5;
  v30 = v6 & 1;
  v25 = &v29;
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  swift_endAccess();
  if (Strong)
  {
    v14 = Strong;
    v13 = Strong;
    v27 = Strong;
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v23, v18, v19);
    v11 = (*(unsigned __int8 *)(v20 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
    v12 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v20 + 32))(v12 + v11, v23, v19);
    sub_1D56316E0(v16, v17 & 1, (void (*)(_QWORD))sub_1D5635B84, v12);
    swift_release();
    return swift_release();
  }
  else
  {
    sub_1D56345BC();
    v7 = swift_allocError();
    *v8 = 0;
    v28 = v7;
    return sub_1D566008C();
  }
}

void sub_1D562FB00(void *a1, char a2)
{
  id v2;
  id v3;

  if ((a2 & 1) != 0)
  {
    v2 = a1;
    v3 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3EBF8);
    sub_1D566008C();

  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3EBF8);
    sub_1D5660098();
    swift_bridgeObjectRelease();
  }
}

void sub_1D562FC10(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  id v4;
  _QWORD *v5;
  uint64_t v9;
  const void *v11;
  id v12;
  id v13;
  _BYTE v14[32];
  uint64_t aBlock;
  int v16;
  int v17;
  uint64_t (*v18)(uint64_t, void *, void *);
  void *v19;
  uint64_t (*v20)(void *, void *);
  _QWORD *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  void *v27;

  v23 = 0;
  v22 = 0;
  v27 = a1;
  v26 = a2 & 1;
  v24 = a3;
  v25 = a4;
  sub_1D5634410();
  v14[16] = a2 & 1;
  v13 = (id)sub_1D562FEC4((uint64_t)sub_1D5634474, (uint64_t)v14);
  v22 = v13;
  v9 = swift_allocObject();
  swift_retain();
  swift_weakInit();
  swift_release();
  swift_retain();
  swift_retain();
  v4 = a1;
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = v9;
  v5[3] = a3;
  v5[4] = a4;
  v5[5] = a1;
  v20 = sub_1D56344CC;
  v21 = v5;
  aBlock = MEMORY[0x1E0C809B0];
  v16 = 1107296256;
  v17 = 0;
  v18 = sub_1D5630D94;
  v19 = &block_descriptor_4;
  v11 = _Block_copy(&aBlock);
  swift_release();
  swift_release();
  v12 = objc_msgSend(a1, sel_requestRepresentationWithOptions_completionHandler_, v13, v11);
  _Block_release(v11);

}

uint64_t sub_1D562FDF4(void *a1, char a2)
{
  id v2;
  id v4;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v4 = (id)*MEMORY[0x1E0D1DBE0];
  v2 = (id)*MEMORY[0x1E0D1DBE0];
  objc_msgSend(a1, sel_setRequestedRepresentation_, v4);

  swift_unknownObjectRelease();
  swift_getObjectType();
  swift_unknownObjectRetain();
  if ((a2 & 1) != 0)
    objc_msgSend(a1, sel_setNetworkUsage_, 1, 1);
  else
    objc_msgSend(a1, sel_setNetworkUsage_, 0, 0);
  return swift_unknownObjectRelease();
}

uint64_t sub_1D562FEC4(uint64_t a1, uint64_t a2)
{
  id v2;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_1D5634E94(a1, a2);
}

uint64_t sub_1D562FF08(void *a1, void *a2, uint64_t a3, void (*a4)(void *), uint64_t a5, void *a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (*v12)(void *, uint64_t);
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
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
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  void (*v50)(void *, uint64_t);
  _BYTE *v51;
  _BYTE *v52;
  uint64_t v53;
  id v54;
  _DWORD v55[2];
  void *v56;
  void *v57;
  unsigned int v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint8_t *v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int v70;
  _BYTE **v71;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t *v79;
  uint32_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
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
  _QWORD *v97;
  uint64_t v98;
  NSObject *v99;
  int v100;
  id v101;
  id v102;
  uint64_t v103;
  void *v104;
  unsigned int v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void (*v109)(void *);
  uint64_t v110;
  id v111;
  uint64_t v112;
  id v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char *v118;
  uint64_t v119;
  char *v120;
  uint64_t Strong;
  uint64_t (*v122)(uint64_t, uint64_t, uint64_t);
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  _BYTE *v126;
  uint64_t v127;
  uint32_t v128;
  id v129;
  id v130;
  uint64_t v131;
  char v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;

  v114 = a1;
  v113 = a2;
  v108 = a3;
  v109 = a4;
  v110 = a5;
  v111 = a6;
  v138 = 0;
  v137 = 0;
  v136 = 0;
  v134 = 0;
  v135 = 0;
  v133 = 0;
  v131 = 0;
  v130 = 0;
  v129 = 0;
  v112 = 0;
  v107 = 0;
  v115 = sub_1D565F084();
  v116 = *(_QWORD *)(v115 - 8);
  v117 = (*(_QWORD *)(v116 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v118 = (char *)v55 - v117;
  v138 = MEMORY[0x1E0C80A78](v114);
  v137 = v6;
  v119 = v7 + 16;
  v136 = v7 + 16;
  v134 = v8;
  v135 = v9;
  v133 = v10;
  v120 = &v132;
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  swift_endAccess();
  if (Strong)
  {
    v106 = Strong;
    v103 = Strong;
    v131 = Strong;
    v17 = v113;
    if (v113)
    {
      v102 = v113;
      v76 = v113;
      v129 = v113;
      (*(void (**)(char *, uint64_t, uint64_t))(v116 + 16))(v118, v103 + OBJC_IVAR____TtC6MailUI31OriginalContentMessageGenerator_logger, v115);
      v19 = v111;
      v75 = 24;
      v87 = 7;
      v20 = swift_allocObject();
      v21 = v76;
      v81 = v20;
      *(_QWORD *)(v20 + 16) = v111;
      v22 = v21;
      v85 = swift_allocObject();
      *(_QWORD *)(v85 + 16) = v76;
      sub_1D556D3A0();
      swift_bridgeObjectRelease();
      v99 = sub_1D565F06C();
      v100 = sub_1D566023C();
      v79 = &v127;
      v127 = 22;
      v77 = sub_1D556CAE8();
      v78 = sub_1D5571968();
      sub_1D55719D0();
      sub_1D565FF54();
      v80 = v128;
      v83 = 17;
      v90 = swift_allocObject();
      *(_BYTE *)(v90 + 16) = 32;
      v91 = swift_allocObject();
      v84 = 8;
      *(_BYTE *)(v91 + 16) = 8;
      v86 = 32;
      v23 = swift_allocObject();
      v24 = v81;
      v82 = v23;
      *(_QWORD *)(v23 + 16) = sub_1D563562C;
      *(_QWORD *)(v23 + 24) = v24;
      v25 = swift_allocObject();
      v26 = v82;
      v92 = v25;
      *(_QWORD *)(v25 + 16) = sub_1D5571CF0;
      *(_QWORD *)(v25 + 24) = v26;
      v93 = swift_allocObject();
      *(_BYTE *)(v93 + 16) = 64;
      v94 = swift_allocObject();
      *(_BYTE *)(v94 + 16) = v84;
      v27 = swift_allocObject();
      v28 = v85;
      v88 = v27;
      *(_QWORD *)(v27 + 16) = sub_1D55D7370;
      *(_QWORD *)(v27 + 24) = v28;
      v29 = swift_allocObject();
      v30 = v88;
      v89 = v29;
      *(_QWORD *)(v29 + 16) = sub_1D55D7404;
      *(_QWORD *)(v29 + 24) = v30;
      v31 = swift_allocObject();
      v32 = v89;
      v96 = v31;
      *(_QWORD *)(v31 + 16) = sub_1D5571CF0;
      *(_QWORD *)(v31 + 24) = v32;
      v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9AA200);
      v95 = sub_1D566077C();
      v97 = v33;
      swift_retain();
      v34 = v90;
      v35 = v97;
      *v97 = sub_1D5571C84;
      v35[1] = v34;
      swift_retain();
      v36 = v91;
      v37 = v97;
      v97[2] = sub_1D5571C84;
      v37[3] = v36;
      swift_retain();
      v38 = v92;
      v39 = v97;
      v97[4] = sub_1D5572550;
      v39[5] = v38;
      swift_retain();
      v40 = v93;
      v41 = v97;
      v97[6] = sub_1D5571C84;
      v41[7] = v40;
      swift_retain();
      v42 = v94;
      v43 = v97;
      v97[8] = sub_1D5571C84;
      v43[9] = v42;
      swift_retain();
      v44 = v96;
      v45 = v97;
      v97[10] = sub_1D5571E74;
      v45[11] = v44;
      sub_1D5571928();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v99, (os_log_type_t)v100))
      {
        v46 = v107;
        v67 = (uint8_t *)sub_1D5660410();
        v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9AA1C0);
        v66 = 1;
        v68 = sub_1D5571A58(1);
        v69 = sub_1D5571A58(v66);
        v71 = &v126;
        v126 = v67;
        v72 = &v125;
        v125 = v68;
        v73 = &v124;
        v124 = v69;
        v70 = 2;
        sub_1D5571AB0(2, &v126);
        sub_1D5571AB0(v70, v71);
        v122 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1D5571C84;
        v123 = v90;
        sub_1D5571AC4(&v122, (uint64_t)v71, (uint64_t)v72, (uint64_t)v73);
        v74 = v46;
        if (v46)
        {
          __break(1u);
        }
        else
        {
          v122 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1D5571C84;
          v123 = v91;
          sub_1D5571AC4(&v122, (uint64_t)&v126, (uint64_t)&v125, (uint64_t)&v124);
          v64 = 0;
          v47 = v64;
          v122 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1D5572550;
          v123 = v92;
          sub_1D5571AC4(&v122, (uint64_t)&v126, (uint64_t)&v125, (uint64_t)&v124);
          v63 = v47;
          v122 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1D5571C84;
          v123 = v93;
          sub_1D5571AC4(&v122, (uint64_t)&v126, (uint64_t)&v125, (uint64_t)&v124);
          v62 = 0;
          v122 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1D5571C84;
          v123 = v94;
          sub_1D5571AC4(&v122, (uint64_t)&v126, (uint64_t)&v125, (uint64_t)&v124);
          v61 = 0;
          v122 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1D5571E74;
          v123 = v96;
          sub_1D5571AC4(&v122, (uint64_t)&v126, (uint64_t)&v125, (uint64_t)&v124);
          _os_log_impl(&dword_1D5522000, v99, (os_log_type_t)v100, "Unable to request representation for message: %s with error %@", v67, v80);
          v60 = 1;
          sub_1D5571B08(v68);
          sub_1D5571B08(v69);
          sub_1D56603F8();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v116 + 8))(v118, v115);
      swift_retain();
      v48 = v76;
      v59 = 1;
      v109(v76);
      sub_1D5634580(v76);
      swift_release();

      return swift_release();
    }
    else
    {
      v18 = v114;
      if (v114)
      {
        v101 = v114;
        v56 = v114;
        v130 = v114;
        swift_retain();
        v54 = v56;
        v55[1] = 0;
        v109(v56);
        sub_1D5634580(v56);
        swift_release();

      }
      else
      {
        swift_retain();
        sub_1D56345BC();
        v58 = 1;
        v49 = (void *)swift_allocError();
        v50 = (void (*)(void *, uint64_t))v109;
        v57 = v49;
        v52 = v51;
        v53 = v58;
        *v52 = 1;
        v50(v49, v53);
        sub_1D5634580(v57);
        swift_release();
      }
      return swift_release();
    }
  }
  else
  {
    swift_retain();
    sub_1D56345BC();
    v105 = 1;
    v11 = (void *)swift_allocError();
    v12 = (void (*)(void *, uint64_t))v109;
    v104 = v11;
    v14 = v13;
    v15 = v105;
    *v14 = 0;
    v12(v11, v15);
    sub_1D5634580(v104);
    return swift_release();
  }
}

uint64_t sub_1D5630C74(void *a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;

  v8 = objc_msgSend(a1, sel_searchableMessageID);
  if (v8)
  {
    v3 = objc_msgSend(v8, sel_stringValue);
    v4 = sub_1D565FE10();
    v5 = v1;

    v6 = v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  if (v7)
    return v6;
  v9 = sub_1D565FE64();
  sub_1D5530388();
  return v9;
}

uint64_t sub_1D5630D94(uint64_t a1, void *a2, void *a3)
{
  id v3;
  id v4;
  void *v6;
  void (*v7)(void *);

  v7 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v3 = a2;
  v4 = a3;
  if (a3)
    v6 = a3;
  else
    v6 = 0;
  v7(a2);

  return swift_release();
}

void *sub_1D5630E48(void *a1, char a2)
{
  uint64_t v2;
  _BYTE *v3;
  NSObject *v4;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  dispatch_semaphore_t v11;

  v11 = dispatch_semaphore_create(0);
  v9 = swift_allocObject();
  sub_1D56345BC();
  v2 = swift_allocError();
  *v3 = 1;
  *(_QWORD *)(v9 + 16) = v2;
  *(_BYTE *)(v9 + 24) = 1;
  swift_retain();
  v4 = v11;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v9;
  *(_QWORD *)(v8 + 24) = v11;
  sub_1D562FC10(a1, a2 & 1, (uint64_t)sub_1D563466C, v8);
  swift_release();
  sub_1D56602C0();
  swift_beginAccess();
  v10 = *(void **)(v9 + 16);
  sub_1D563467C(v10);
  swift_endAccess();
  swift_release();

  return v10;
}

uint64_t sub_1D5631000(void *a1, char a2, uint64_t a3)
{
  void *v3;

  sub_1D563467C(a1);
  swift_beginAccess();
  v3 = *(void **)(a3 + 16);
  *(_QWORD *)(a3 + 16) = a1;
  *(_BYTE *)(a3 + 24) = a2 & 1;
  sub_1D5634580(v3);
  swift_endAccess();
  return sub_1D56602CC();
}

uint64_t sub_1D56310CC(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char *v54;
  unint64_t v55;
  char *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[2];
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  char v67;
  char v68;
  void *v69;
  char *v70;

  v50 = a1;
  v49 = a2;
  v48 = a3;
  v70 = 0;
  v69 = 0;
  v68 = 0;
  v67 = 0;
  v66 = 0;
  v45 = 0;
  v64 = 0;
  v65 = 0;
  v61 = 0;
  v62 = 0;
  v58 = 0;
  v59 = 0;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3D238);
  v46 = (*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v4);
  v47 = (uint64_t)&v18 - v46;
  v51 = sub_1D565ED18();
  v52 = *(_QWORD *)(v51 - 8);
  v53 = (*(_QWORD *)(v52 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = MEMORY[0x1E0C80A78](v50);
  v54 = (char *)&v18 - v53;
  v55 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = (void *)MEMORY[0x1E0C80A78](v5);
  v56 = (char *)&v18 - v55;
  v70 = (char *)&v18 - v55;
  v69 = v7;
  v68 = v8 & 1;
  v67 = v9 & 1;
  v66 = v3;
  v57 = objc_msgSend(v7, sel_contentURL);
  if (v57)
  {
    v44 = v57;
    v43 = v57;
    sub_1D565ED0C();
    (*(void (**)(uint64_t, char *, uint64_t))(v52 + 32))(v47, v54, v51);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v52 + 56))(v47, 0, 1, v51);

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v52 + 56))(v47, 1, 1, v51);
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v47, 1, v51) == 1)
  {
    sub_1D55B6E10(v47);
LABEL_14:
    v26 = 0;
    v27 = 0;
    return v26;
  }
  v10 = v45;
  (*(void (**)(char *, uint64_t, uint64_t))(v52 + 32))(v56, v47, v51);
  sub_1D55D94D8();
  v40 = sub_1D565ED24();
  v41 = v11;
  v42 = v10;
  if (v10)
  {
    v18 = 0;
    v19 = 0xF000000000000000;

    v38 = v18;
    v39 = v19;
  }
  else
  {
    v38 = v40;
    v39 = v41;
  }
  v36 = v39;
  v37 = v38;
  if ((v39 & 0xF000000000000000) == 0xF000000000000000)
  {
    (*(void (**)(char *, uint64_t))(v52 + 8))(v56, v51);
    goto LABEL_14;
  }
  v34 = v37;
  v35 = v36;
  v29 = v36;
  v28 = v37;
  v64 = v37;
  v65 = v36;
  sub_1D56346B8(v37, v36);
  v31 = v63;
  v63[0] = v28;
  v63[1] = v29;
  v30 = sub_1D5634740();
  sub_1D56347A8();
  v12 = sub_1D565FEB8();
  v32 = v12;
  v33 = v13;
  v61 = v12;
  v62 = v13;
  if ((v49 & 1) != 0)
  {
    v21 = (id)objc_opt_self();
    swift_bridgeObjectRetain();
    v22 = (id)sub_1D565FDF8();
    swift_bridgeObjectRelease();
    type metadata accessor for ECMessageBodyStringAccumulatorOptions();
    v14 = sub_1D566077C();
    *v15 = 32;
    sub_1D5571928();
    v20 = v14;
    sub_1D556AA38();
    sub_1D56604E8();
    v23 = objc_msgSend(v21, sel_snippetFromHTMLBody_options_maxLength_preservingQuotedForwardedContent_, v22, v60, 0x7FFFFFFFFFFFFFFFLL, v48 & 1);

    v24 = sub_1D565FE10();
    v25 = v16;
    v58 = v24;
    v59 = v16;

    swift_bridgeObjectRelease();
    sub_1D5634810(v28, v29);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v56, v51);
    v26 = v24;
    v27 = v25;
  }
  else
  {
    sub_1D5634810(v28, v29);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v56, v51);
    v26 = v32;
    v27 = v33;
  }
  return v26;
}

uint64_t sub_1D56316E0(uint64_t a1, int a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void (*v13)(_QWORD);
  uint64_t v14;
  NSObject *v15;
  char v16;
  uint64_t v17;
  id v18;
  _QWORD v20[3];
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  void (*v44)(_QWORD);
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t aBlock;
  int v58;
  int v59;
  uint64_t (*v60)(uint64_t);
  void *v61;
  void (*v62)();
  uint64_t v63;
  void *v64;
  char v65;
  char v66;
  char v67;
  void *v68;
  uint64_t v69;
  _QWORD v70[2];
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t v77;

  v54 = a1;
  v46 = a2;
  v44 = a3;
  v45 = a4;
  v77 = 0;
  v76 = 0;
  v74 = 0;
  v75 = 0;
  v73 = 0;
  v72 = 0;
  v71 = 0;
  v55 = v70;
  v70[0] = 0;
  v70[1] = 0;
  v64 = 0;
  v51 = 0;
  v40 = sub_1D565FC00();
  v41 = *(_QWORD *)(v40 - 8);
  v42 = (*(_QWORD *)(v41 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v43 = (char *)v20 - v42;
  v47 = sub_1D565FC24();
  v48 = *(_QWORD *)(v47 - 8);
  v49 = (*(_QWORD *)(v48 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = MEMORY[0x1E0C80A78](v54);
  v50 = (char *)v20 - v49;
  v77 = v5;
  v76 = v6 & 1;
  v74 = v7;
  v75 = v8;
  v73 = v4;
  v52 = swift_allocObject();
  v72 = v52 + 16;
  sub_1D56348D4();
  *(_QWORD *)(v52 + 16) = sub_1D566077C();
  v53 = dispatch_group_create();
  v71 = v53;
  swift_bridgeObjectRetain();
  v69 = v54;
  v56 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFF3EA50);
  sub_1D55D61F8();
  sub_1D56601B8();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3EA60);
    sub_1D56605D8();
    v38 = v68;
    if (!v68)
      break;
    v37 = v38;
    v36 = v38;
    v64 = v38;
    dispatch_group_enter(v53);
    v35 = *(id *)(v39 + OBJC_IVAR____TtC6MailUI31OriginalContentMessageGenerator_contentRepresentationQueue);
    v9 = v35;
    v31 = 7;
    v34 = swift_allocObject();
    v29 = v34 + 16;
    swift_retain();
    v30 = v39;
    swift_weakInit();
    swift_release();
    swift_retain();
    swift_retain();
    v10 = v53;
    v11 = v36;
    swift_retain();
    v12 = swift_allocObject();
    v13 = v44;
    v14 = v45;
    v15 = v53;
    v16 = v46;
    v17 = v52;
    v18 = v36;
    v32 = v12;
    *(_QWORD *)(v12 + 16) = v34;
    *(_QWORD *)(v12 + 24) = v13;
    *(_QWORD *)(v12 + 32) = v14;
    *(_QWORD *)(v12 + 40) = v15;
    *(_QWORD *)(v12 + 48) = v18;
    *(_BYTE *)(v12 + 56) = v16 & 1;
    *(_QWORD *)(v12 + 64) = v17;
    v62 = sub_1D56349D0;
    v63 = v12;
    aBlock = MEMORY[0x1E0C809B0];
    v58 = 1107296256;
    v59 = 0;
    v60 = sub_1D5632A90;
    v61 = &block_descriptor_22;
    v33 = _Block_copy(&aBlock);
    sub_1D562F53C();
    sub_1D5632AD8();
    MEMORY[0x1D82752B8](0, v50, v43, v33);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v40);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v50, v47);
    _Block_release(v33);
    swift_release();
    swift_release();

  }
  sub_1D5565788();
  sub_1D5660254();
  v23 = v52 + 16;
  v20[1] = &v67;
  v24 = 32;
  v25 = 0;
  swift_beginAccess();
  v20[2] = *(_QWORD *)(v52 + 16);
  swift_bridgeObjectRetain();
  swift_endAccess();
  v21 = sub_1D5633958();
  swift_bridgeObjectRelease();
  v22 = &v66;
  swift_beginAccess();
  *(_QWORD *)(v52 + 16) = v21;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_retain();
  v26 = &v65;
  swift_beginAccess();
  v27 = *(void **)(v52 + 16);
  swift_bridgeObjectRetain();
  swift_endAccess();
  v28 = 0;
  v44(v27);
  sub_1D5634938(v27, v28 & 1);
  swift_release();

  return swift_release();
}

void sub_1D5631D74(uint64_t a1, void (*a2)(void *, uint64_t), uint64_t a3, NSObject *a4, void *a5, char a6, uint64_t a7)
{
  _BYTE *v7;
  id v8;
  NSObject *v9;
  _QWORD *v10;
  void *v11;
  uint64_t Strong;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  swift_endAccess();
  swift_retain();
  if (Strong)
  {
    swift_retain();
    v8 = a5;
    v9 = a4;
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = a7;
    v10[3] = Strong;
    v10[4] = a5;
    v10[5] = a4;
    sub_1D5632B6C(a5, a6 & 1, (uint64_t)sub_1D56355D8, (uint64_t)v10);
    swift_release();
    swift_release();
  }
  else
  {
    sub_1D56345BC();
    v11 = (void *)swift_allocError();
    *v7 = 0;
    a2(v11, 1);
    sub_1D5634938(v11, 1);
    swift_release();
    dispatch_group_leave(a4);
  }
}

void sub_1D5631F60(void *a1, int a2, uint64_t a3, uint64_t a4, void *a5, NSObject *a6)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  char *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
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
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[5];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  _BYTE **v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t *v60;
  uint32_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
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
  _QWORD *v78;
  uint64_t v79;
  NSObject *v80;
  int v81;
  id *v82;
  char *v83;
  id v84;
  id v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  dispatch_group_t v91;
  int v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  char v98;
  id v99;
  id v100;
  uint64_t (*v101)(uint64_t, uint64_t, uint64_t);
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  _BYTE *v105;
  uint64_t v106;
  uint32_t v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char v114;

  v93 = a1;
  v92 = a2;
  v88 = a3;
  v89 = a4;
  v90 = a5;
  v91 = a6;
  v113 = 0;
  v114 = 0;
  v112 = 0;
  v111 = 0;
  v110 = 0;
  v109 = 0;
  v108 = 0;
  v87 = 0;
  v100 = 0;
  v94 = sub_1D565F084();
  v95 = *(_QWORD *)(v94 - 8);
  v96 = (*(_QWORD *)(v95 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v97 = (char *)v44 - v96;
  v113 = MEMORY[0x1E0C80A78](v93);
  v114 = v6 & 1;
  v112 = v7 + 16;
  v111 = v8;
  v110 = v9;
  v109 = v10;
  if ((v6 & 1) != 0)
  {
    v85 = v93;
    v13 = v97;
    v57 = v93;
    v14 = v93;
    v108 = v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))(v13, v89 + OBJC_IVAR____TtC6MailUI31OriginalContentMessageGenerator_logger, v94);
    v15 = v90;
    v56 = 24;
    v68 = 7;
    v16 = swift_allocObject();
    v17 = v57;
    v62 = v16;
    *(_QWORD *)(v16 + 16) = v90;
    v18 = v17;
    v66 = swift_allocObject();
    *(_QWORD *)(v66 + 16) = v57;
    sub_1D556D3A0();
    swift_bridgeObjectRelease();
    v80 = sub_1D565F06C();
    v81 = sub_1D566023C();
    v60 = &v106;
    v106 = 22;
    v58 = sub_1D556CAE8();
    v59 = sub_1D5571968();
    sub_1D55719D0();
    sub_1D565FF54();
    v61 = v107;
    v64 = 17;
    v71 = swift_allocObject();
    *(_BYTE *)(v71 + 16) = 32;
    v72 = swift_allocObject();
    v65 = 8;
    *(_BYTE *)(v72 + 16) = 8;
    v67 = 32;
    v19 = swift_allocObject();
    v20 = v62;
    v63 = v19;
    *(_QWORD *)(v19 + 16) = sub_1D563562C;
    *(_QWORD *)(v19 + 24) = v20;
    v21 = swift_allocObject();
    v22 = v63;
    v73 = v21;
    *(_QWORD *)(v21 + 16) = sub_1D5571CF0;
    *(_QWORD *)(v21 + 24) = v22;
    v74 = swift_allocObject();
    *(_BYTE *)(v74 + 16) = 64;
    v75 = swift_allocObject();
    *(_BYTE *)(v75 + 16) = v65;
    v23 = swift_allocObject();
    v24 = v66;
    v69 = v23;
    *(_QWORD *)(v23 + 16) = sub_1D55D7370;
    *(_QWORD *)(v23 + 24) = v24;
    v25 = swift_allocObject();
    v26 = v69;
    v70 = v25;
    *(_QWORD *)(v25 + 16) = sub_1D55D7404;
    *(_QWORD *)(v25 + 24) = v26;
    v27 = swift_allocObject();
    v28 = v70;
    v77 = v27;
    *(_QWORD *)(v27 + 16) = sub_1D5571CF0;
    *(_QWORD *)(v27 + 24) = v28;
    v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9AA200);
    v76 = sub_1D566077C();
    v78 = v29;
    swift_retain();
    v30 = v71;
    v31 = v78;
    *v78 = sub_1D5571C84;
    v31[1] = v30;
    swift_retain();
    v32 = v72;
    v33 = v78;
    v78[2] = sub_1D5571C84;
    v33[3] = v32;
    swift_retain();
    v34 = v73;
    v35 = v78;
    v78[4] = sub_1D5572550;
    v35[5] = v34;
    swift_retain();
    v36 = v74;
    v37 = v78;
    v78[6] = sub_1D5571C84;
    v37[7] = v36;
    swift_retain();
    v38 = v75;
    v39 = v78;
    v78[8] = sub_1D5571C84;
    v39[9] = v38;
    swift_retain();
    v40 = v77;
    v41 = v78;
    v78[10] = sub_1D5571E74;
    v41[11] = v40;
    sub_1D5571928();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v80, (os_log_type_t)v81))
    {
      v42 = v87;
      v48 = (uint8_t *)sub_1D5660410();
      v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9AA1C0);
      v47 = 1;
      v49 = sub_1D5571A58(1);
      v50 = sub_1D5571A58(v47);
      v52 = &v105;
      v105 = v48;
      v53 = &v104;
      v104 = v49;
      v54 = &v103;
      v103 = v50;
      v51 = 2;
      sub_1D5571AB0(2, &v105);
      sub_1D5571AB0(v51, v52);
      v101 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1D5571C84;
      v102 = v71;
      sub_1D5571AC4(&v101, (uint64_t)v52, (uint64_t)v53, (uint64_t)v54);
      v55 = v42;
      if (v42)
      {
        __break(1u);
      }
      else
      {
        v101 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1D5571C84;
        v102 = v72;
        sub_1D5571AC4(&v101, (uint64_t)&v105, (uint64_t)&v104, (uint64_t)&v103);
        v45 = 0;
        v43 = v45;
        v101 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1D5572550;
        v102 = v73;
        sub_1D5571AC4(&v101, (uint64_t)&v105, (uint64_t)&v104, (uint64_t)&v103);
        v44[4] = v43;
        v101 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1D5571C84;
        v102 = v74;
        sub_1D5571AC4(&v101, (uint64_t)&v105, (uint64_t)&v104, (uint64_t)&v103);
        v44[3] = 0;
        v101 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1D5571C84;
        v102 = v75;
        sub_1D5571AC4(&v101, (uint64_t)&v105, (uint64_t)&v104, (uint64_t)&v103);
        v44[2] = 0;
        v101 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1D5571E74;
        v102 = v77;
        sub_1D5571AC4(&v101, (uint64_t)&v105, (uint64_t)&v104, (uint64_t)&v103);
        _os_log_impl(&dword_1D5522000, v80, (os_log_type_t)v81, "Unable to generate original content message for message: %s with error %@. Skipping this message.", v48, v61);
        v44[1] = 1;
        sub_1D5571B08(v49);
        sub_1D5571B08(v50);
        sub_1D56603F8();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v95 + 8))(v97, v94);
  }
  else
  {
    v86 = v93;
    v84 = v93;
    v11 = v93;
    v100 = v84;
    v12 = v84;
    v82 = &v99;
    v99 = v84;
    v83 = &v98;
    swift_beginAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3EA10);
    sub_1D5660008();
    swift_endAccess();

  }
  dispatch_group_leave(v91);
}

uint64_t sub_1D5632A90(uint64_t a1)
{
  uint64_t v1;
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  v1 = swift_retain();
  v3(v1);
  return swift_release();
}

uint64_t sub_1D5632AD8()
{
  sub_1D56353EC(0);
  sub_1D565FC00();
  sub_1D56354A4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9A00);
  sub_1D5635514();
  return sub_1D5660548();
}

uint64_t sub_1D5632B6C(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  id v4;
  _QWORD *v10;
  uint64_t v11;

  v11 = swift_allocObject();
  swift_retain();
  swift_weakInit();
  swift_release();
  swift_retain();
  swift_retain();
  v4 = a1;
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = v11;
  v10[3] = a3;
  v10[4] = a4;
  v10[5] = a1;
  sub_1D562FC10(a1, a2 & 1, (uint64_t)sub_1D5634A9C, (uint64_t)v10);
  swift_release();
  return swift_release();
}

uint64_t sub_1D5632C90(void *a1, int a2, uint64_t a3, void (*a4)(_QWORD, _QWORD), uint64_t a5, void *a6)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void (*v13)(void *, uint64_t);
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  char v20;
  id v21;
  void (*v22)(_QWORD, _QWORD);
  uint64_t v23;
  uint64_t v24;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  void (*v38)(_QWORD, _QWORD);
  uint64_t v39;
  id v40;
  int v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t Strong;
  uint64_t aBlock;
  int v51;
  int v52;
  uint64_t (*v53)(uint64_t);
  void *v54;
  void (*v55)();
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;

  v42 = a1;
  v41 = a2;
  v37 = a3;
  v38 = a4;
  v39 = a5;
  v40 = a6;
  v63 = 0;
  v64 = 0;
  v62 = 0;
  v60 = 0;
  v61 = 0;
  v59 = 0;
  v57 = 0;
  v32 = 0;
  v33 = sub_1D565FC00();
  v34 = *(_QWORD *)(v33 - 8);
  v35 = (*(_QWORD *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v36 = (char *)&v26 - v35;
  v43 = sub_1D565FC24();
  v44 = *(_QWORD *)(v43 - 8);
  v45 = (*(_QWORD *)(v44 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = MEMORY[0x1E0C80A78](v42);
  v46 = (char *)&v26 - v45;
  v63 = v6;
  v64 = v7 & 1;
  v47 = v8 + 16;
  v62 = v8 + 16;
  v60 = v9;
  v61 = v10;
  v59 = v11;
  v48 = &v58;
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  swift_endAccess();
  if (Strong)
  {
    v31 = Strong;
    v28 = Strong;
    v57 = Strong;
    v27 = *(id *)(Strong + OBJC_IVAR____TtC6MailUI31OriginalContentMessageGenerator_contentRepresentationQueue);
    v17 = v27;
    sub_1D563467C(v42);
    swift_retain();
    v18 = v40;
    swift_retain();
    v19 = swift_allocObject();
    v20 = v41;
    v21 = v40;
    v22 = v38;
    v23 = v39;
    v24 = v28;
    *(_QWORD *)(v19 + 16) = v42;
    *(_BYTE *)(v19 + 24) = v20 & 1;
    *(_QWORD *)(v19 + 32) = v24;
    *(_QWORD *)(v19 + 40) = v21;
    *(_QWORD *)(v19 + 48) = v22;
    *(_QWORD *)(v19 + 56) = v23;
    v55 = sub_1D5635330;
    v56 = v19;
    aBlock = MEMORY[0x1E0C809B0];
    v51 = 1107296256;
    v52 = 0;
    v53 = sub_1D5632A90;
    v54 = &block_descriptor_33;
    v26 = _Block_copy(&aBlock);
    sub_1D562F53C();
    sub_1D5632AD8();
    MEMORY[0x1D82752B8](0, v46, v36, v26);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v36, v33);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v46, v43);
    _Block_release(v26);
    swift_release();

  }
  else
  {
    swift_retain();
    sub_1D56345BC();
    v30 = 1;
    v12 = (void *)swift_allocError();
    v13 = (void (*)(void *, uint64_t))v38;
    v29 = v12;
    v15 = v14;
    v16 = v30;
    *v15 = 0;
    v13(v12, v16);
    sub_1D5634580(v29);
  }
  return swift_release();
}

void sub_1D5633048(void *a1, char a2, uint64_t a3, void *a4, void (*a5)(void *))
{
  id v5;
  _BYTE *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  if ((a2 & 1) != 0)
  {
    v8 = a1;
    swift_retain();
    v9 = a1;
    a5(a1);
    sub_1D5634580(a1);
    swift_release();

  }
  else
  {
    v5 = a1;
    v11 = sub_1D563325C((uint64_t)a1, a4);
    swift_retain();
    if (v11)
    {
      v7 = v11;
      a5(v11);
      sub_1D5634580(v11);
      swift_release();

    }
    else
    {
      sub_1D56345BC();
      v10 = (void *)swift_allocError();
      *v6 = 2;
      ((void (*)(void *, uint64_t))a5)(v10, 1);
      sub_1D5634580(v10);
      swift_release();
    }

  }
}

id sub_1D563325C(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[2];
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v51 = a1;
  v50 = a2;
  v71 = 0;
  v70 = 0;
  v69 = 0;
  v67 = 0;
  v68 = 0;
  v66 = 0;
  v63 = 0;
  v47 = 0;
  v48 = (*(_QWORD *)(*(_QWORD *)(sub_1D565ED78() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v49 = (uint64_t)v17 - v48;
  v52 = sub_1D565EDB4();
  v53 = *(_QWORD *)(v52 - 8);
  v54 = (*(_QWORD *)(v53 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = MEMORY[0x1E0C80A78](v51);
  v55 = (char *)v17 - v54;
  v71 = v3;
  v70 = v4;
  v69 = v2;
  v56 = sub_1D56310CC(v3, 1, 0);
  v57 = v5;
  if (!v5)
    return 0;
  v45 = v56;
  v46 = v57;
  v42 = v57;
  v43 = v56;
  v67 = v56;
  v68 = v57;
  v6 = v50;
  v44 = objc_msgSend(v50, sel_senderAddress);
  if (!v44)
  {

    swift_bridgeObjectRelease();
    return 0;
  }
  v41 = v44;
  v40 = (uint64_t)v44;
  v66 = v44;

  v64 = objc_msgSend(v50, sel_searchableMessageID);
  if (v64)
  {
    v65 = v64;
  }
  else
  {
    v37 = sub_1D55D78B4();
    sub_1D565EDA8();
    v38 = sub_1D565ED84();
    v39 = v7;
    (*(void (**)(char *, uint64_t))(v53 + 8))(v55, v52);
    v65 = sub_1D563387C();
    sub_1D5565D18(&v64);
  }
  v35 = v65;
  v63 = v65;
  v36 = sub_1D56348D4();
  swift_bridgeObjectRetain();
  v8 = v50;
  v60 = objc_msgSend(v50, sel_subject);
  if (v60)
  {
    v28 = &v60;
    v29 = v60;
    v9 = v60;
    sub_1D5565D18(v28);

    v30 = objc_msgSend(v29, sel_subjectString);
    v31 = sub_1D565FE10();
    v32 = v10;

    v33 = v31;
    v34 = v32;
  }
  else
  {
    v17[0] = 0;
    sub_1D5565D18(&v60);

    v33 = v17[0];
    v34 = v17[0];
  }
  v58 = v33;
  v59 = v34;
  if (v34)
  {
    v61 = v58;
    v62 = v59;
  }
  else
  {
    v61 = sub_1D565FE64();
    v62 = v11;
    sub_1D5530388();
  }
  v19 = v61;
  v20 = v62;
  v12 = v50;
  v25 = objc_msgSend(v50, sel_toList);
  v17[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9650);
  v21 = sub_1D565FF90();

  v13 = v50;
  v24 = objc_msgSend(v50, sel_ccList);
  v22 = sub_1D565FF90();

  v14 = v50;
  v18 = objc_msgSend(v50, sel_flags);

  v15 = v50;
  v23 = objc_msgSend(v50, sel_date);
  sub_1D565ED6C();

  v26 = sub_1D56338C0(v35, v43, v42, v19, v20, v40, v21, v22, v18, v49);
  swift_bridgeObjectRelease();
  return v26;
}

id sub_1D563387C()
{
  id v0;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_1D563501C();
}

id sub_1D56338C0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10)
{
  id v10;

  v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_1D5635074(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1D5633958()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3EA10);
  sub_1D5634AB4();
  return sub_1D565FF24();
}

uint64_t sub_1D56339F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  id *v5;
  _QWORD v7[2];
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  char *v14;
  id v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  id v19;
  int v20;
  id v21;
  id v22;

  v8 = a1;
  v7[1] = a2;
  v22 = 0;
  v21 = 0;
  v17 = sub_1D565ED78();
  v13 = *(_QWORD *)(v17 - 8);
  v9 = (*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x1E0C80A78](v8);
  v14 = (char *)v7 - v9;
  v10 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = (id *)MEMORY[0x1E0C80A78](v2);
  v16 = (char *)v7 - v10;
  v22 = *v4;
  v12 = *v5;
  v21 = v12;
  v11 = 0x1F260B000uLL;
  v19 = objc_msgSend(v22, (SEL)0x1F260BC48);
  sub_1D565ED6C();
  v15 = objc_msgSend(v12, (SEL)(v11 + 3144));
  sub_1D565ED6C();
  v20 = sub_1D565ED54();
  v18 = *(void (**)(char *, uint64_t))(v13 + 8);
  v18(v14, v17);

  v18(v16, v17);
  return v20 & 1;
}

uint64_t OriginalContentMessageGenerator.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = OBJC_IVAR____TtC6MailUI31OriginalContentMessageGenerator_logger;
  v1 = sub_1D565F084();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0 + v3);

  return v4;
}

uint64_t OriginalContentMessageGenerator.__deallocating_deinit()
{
  OriginalContentMessageGenerator.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1D5633C04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = 0;
  v14 = 0;
  v5 = (*(_QWORD *)(*(_QWORD *)(sub_1D566026C() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v13 = (uint64_t)&v4 - v5;
  v6 = (*(_QWORD *)(*(_QWORD *)(sub_1D5660260() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v14);
  v12 = (char *)&v4 - v6;
  v7 = (*(_QWORD *)(*(_QWORD *)(sub_1D565FC24() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v14);
  v11 = (char *)&v4 - v7;
  v17 = v0;
  v8 = OBJC_IVAR____TtC6MailUI31OriginalContentMessageGenerator_logger;
  type metadata accessor for OriginalContentMessageGenerator();
  static Logger.mailUILogger<A>(for:)();
  v15 = OBJC_IVAR____TtC6MailUI31OriginalContentMessageGenerator_contentRepresentationQueue;
  sub_1D55C7A08();
  v9 = sub_1D565FE64();
  v10 = v1;
  sub_1D562F53C();
  sub_1D55C7A6C();
  sub_1D55C7B00(v13);
  v2 = sub_1D5660284();
  result = v16;
  *(_QWORD *)(v16 + v15) = v2;
  return result;
}

void sub_1D5633DAC()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  id location;
  id v14;
  char v15;
  id v16;
  id v17;
  id v18;

  swift_unknownObjectRetain();
  location = 0;
  objc_storeStrong(&location, v0);
  v9 = (id)objc_msgSend(location, "emailAddressValue");
  v10 = (id)objc_msgSend(v9, "displayName");
  v11 = 0;
  if (v10)
  {
    v1 = v10;
  }
  else
  {
    v12 = (id)objc_msgSend(location, "stringValue");
    v11 = 1;
    v1 = v12;
  }
  v14 = v1;
  if ((v11 & 1) != 0)

  objc_storeStrong(&location, 0);
  v6 = v14;
  swift_unknownObjectRelease();
  sub_1D565FE10();
  swift_unknownObjectRetain();
  v17 = 0;
  objc_storeStrong(&v17, v0);
  v7 = (id)objc_msgSend(v17, "emailAddressValue");
  v8 = (id)objc_msgSend(v7, "simpleAddress");
  v15 = 0;
  if (v8)
  {
    v2 = v8;
  }
  else
  {
    v16 = (id)objc_msgSend(v17, "stringValue");
    v15 = 1;
    v2 = v16;
  }
  v18 = v2;
  if ((v15 & 1) != 0)

  objc_storeStrong(&v17, 0);
  v5 = v18;
  swift_unknownObjectRelease();
  sub_1D565FE10();
  v4 = (id)*MEMORY[0x1E0C966A8];
  v3 = (id)*MEMORY[0x1E0C966A8];
  sub_1D565FE10();
  sub_1D565EFB8();

}

uint64_t sub_1D563407C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9650);
  sub_1D566077C();
  v9 = objc_msgSend(a1, sel_toList);
  if (v9)
  {
    v6 = sub_1D565FF90();

    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  if (v7)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9A70);
    sub_1D5595B4C();
    sub_1D565FFFC();
    swift_bridgeObjectRelease();
  }
  v5 = objc_msgSend(a1, sel_ccList);
  if (v5)
  {
    v3 = sub_1D565FF90();

    v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9A70);
    sub_1D5595B4C();
    sub_1D565FFFC();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9A70);
  sub_1D565EFC4();
  sub_1D5595B4C();
  v2 = sub_1D565FEDC();
  sub_1D5565788();
  sub_1D5565788();
  return v2;
}

unint64_t sub_1D5634354()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3EA00;
  if (!qword_1EFF3EA00)
  {
    v0 = MEMORY[0x1D82763B0](&unk_1D5673F60, &unk_1E99E9450);
    atomic_store(v0, (unint64_t *)&qword_1EFF3EA00);
    return v0;
  }
  return v2;
}

uint64_t sub_1D56343C0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1D56343FC(uint64_t a1)
{
  uint64_t v1;

  return sub_1D562F8F0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_BYTE *)(v1 + 32) & 1);
}

unint64_t sub_1D5634410()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1EFF3EA18;
  if (!qword_1EFF3EA18)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EFF3EA18);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1D5634474(void *a1)
{
  uint64_t v1;

  return sub_1D562FDF4(a1, *(_BYTE *)(v1 + 16) & 1);
}

uint64_t sub_1D5634480()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1D56344CC(void *a1, void *a2)
{
  uint64_t v2;

  return sub_1D562FF08(a1, a2, *(_QWORD *)(v2 + 16), *(void (**)(void *))(v2 + 24), *(_QWORD *)(v2 + 32), *(void **)(v2 + 40));
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_1D563453C()
{
  uint64_t v0;

  sub_1D5634580(*(void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1D5634580(void *a1)
{

}

unint64_t sub_1D56345BC()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3EA20;
  if (!qword_1EFF3EA20)
  {
    v0 = MEMORY[0x1D82763B0](&unk_1D5673F20, &unk_1E99E9450);
    atomic_store(v0, (unint64_t *)&qword_1EFF3EA20);
    return v0;
  }
  return v2;
}

uint64_t sub_1D5634628()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1D563466C(void *a1, char a2)
{
  uint64_t v2;

  return sub_1D5631000(a1, a2 & 1, *(_QWORD *)(v2 + 16));
}

id sub_1D563467C(void *a1)
{
  return a1;
}

uint64_t sub_1D56346B8(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (((a2 >> 62) & 3) == 1)
    return swift_retain();
  if (((a2 >> 62) & 3) == 2)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

unint64_t sub_1D5634740()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3EA30;
  if (!qword_1EFF3EA30)
  {
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0CB0388], MEMORY[0x1E0CB0338]);
    atomic_store(v0, (unint64_t *)&qword_1EFF3EA30);
    return v0;
  }
  return v2;
}

unint64_t sub_1D56347A8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3EA38;
  if (!qword_1EFF3EA38)
  {
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEE480], MEMORY[0x1E0DEE478]);
    atomic_store(v0, (unint64_t *)&qword_1EFF3EA38);
    return v0;
  }
  return v2;
}

uint64_t sub_1D5634810(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (((a2 >> 62) & 3) == 1)
    return swift_release();
  if (((a2 >> 62) & 3) == 2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1D5634898()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_1D56348D4()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1EFF3EA48;
  if (!qword_1EFF3EA48)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EFF3EA48);
    return ObjCClassMetadata;
  }
  return v2;
}

void sub_1D5634938(void *a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

uint64_t sub_1D5634974()
{
  uint64_t v0;

  swift_release();
  swift_release();

  swift_release();
  return swift_deallocObject();
}

void sub_1D56349D0()
{
  uint64_t v0;

  sub_1D5631D74(*(_QWORD *)(v0 + 16), *(void (**)(void *, uint64_t))(v0 + 24), *(_QWORD *)(v0 + 32), *(NSObject **)(v0 + 40), *(void **)(v0 + 48), *(_BYTE *)(v0 + 56) & 1, *(_QWORD *)(v0 + 64));
}

uint64_t block_copy_helper_20(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_21()
{
  return swift_release();
}

uint64_t sub_1D5634A50()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1D5634A9C(void *a1, char a2)
{
  uint64_t v2;

  return sub_1D5632C90(a1, a2 & 1, *(_QWORD *)(v2 + 16), *(void (**)(_QWORD, _QWORD))(v2 + 24), *(_QWORD *)(v2 + 32), *(void **)(v2 + 40));
}

unint64_t sub_1D5634AB4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3EA80;
  if (!qword_1EFF3EA80)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFF3EA10);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEAF38], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3EA80);
    return v1;
  }
  return v3;
}

uint64_t sub_1D5634B24()
{
  return type metadata accessor for OriginalContentMessageGenerator();
}

uint64_t type metadata accessor for OriginalContentMessageGenerator()
{
  uint64_t v1;

  v1 = qword_1EFF3EAB8;
  if (!qword_1EFF3EAB8)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t sub_1D5634BA0()
{
  unint64_t v0;
  uint64_t updated;

  updated = sub_1D565F084();
  if (v0 <= 0x3F)
  {
    updated = swift_updateClassMetadata2();
    if (!updated)
      return 0;
  }
  return updated;
}

uint64_t method lookup function for OriginalContentMessageGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of OriginalContentMessageGenerator.originalContentMessages(for:allowNetwork:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v7)(uint64_t, _QWORD);

  *(_QWORD *)(v3 + 16) = v3;
  v7 = (uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)v2 + 96) + **(int **)(*(_QWORD *)v2 + 96));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v4;
  *v4 = *(_QWORD *)(v3 + 16);
  v4[1] = sub_1D5597C4C;
  return v7(a1, a2 & 1);
}

uint64_t dispatch thunk of OriginalContentMessageGenerator.contentRepresentation(for:allowNetwork:completionHandler:)(uint64_t a1, char a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 104))(a1, a2 & 1);
}

uint64_t dispatch thunk of OriginalContentMessageGenerator.contentRepresentation(for:allowNetwork:)(uint64_t a1, char a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 112))(a1, a2 & 1);
}

uint64_t dispatch thunk of OriginalContentMessageGenerator.messageBody(from:convertToPlainText:preservingQuotedForwardedContent:)(uint64_t a1, char a2, char a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v3 + 120))(a1, a2 & 1, a3 & 1);
}

void *type metadata accessor for OriginalContentMessageGenerator.OriginalContentMessageGeneratorError()
{
  return &unk_1E99E9450;
}

unint64_t sub_1D5634DB0()
{
  return sub_1D5634DC4();
}

unint64_t sub_1D5634DC4()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3EB90;
  if (!qword_1EFF3EB90)
  {
    v0 = MEMORY[0x1D82763B0](&unk_1D5673EF8, &unk_1E99E9450);
    atomic_store(v0, (unint64_t *)&qword_1EFF3EB90);
    return v0;
  }
  return v2;
}

uint64_t sub_1D5634E30()
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  sub_1D5633DAC();
  return swift_unknownObjectRelease();
}

uint64_t sub_1D5634E94(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  id v5;
  const void *v6;
  id v7;
  uint64_t v8;
  uint64_t aBlock;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  uint64_t (*v14)(uint64_t);
  uint64_t v15;

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  swift_retain();
  v14 = sub_1D5635AA8;
  v15 = v8;
  aBlock = MEMORY[0x1E0C809B0];
  v10 = 1107296256;
  v11 = 0;
  v12 = sub_1D5634FCC;
  v13 = &block_descriptor_120;
  v6 = _Block_copy(&aBlock);
  v7 = objc_msgSend(v5, sel_initWithBuilder_);
  _Block_release(v6);
  swift_release();
  result = swift_isEscapingClosureAtFileLocation();
  if ((result & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    swift_release();
    return (uint64_t)v7;
  }
  return result;
}

uint64_t sub_1D5634FAC(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_1D5634FCC(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

id sub_1D563501C()
{
  id v1;
  id v2;
  id v3;

  v2 = (id)sub_1D565FDF8();
  v3 = objc_msgSend(v1, sel_initWithString_);

  swift_bridgeObjectRelease();
  return v3;
}

id sub_1D5635074(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10)
{
  uint64_t v10;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v24;
  void *v26;

  v26 = (void *)sub_1D565FDF8();
  if (a5)
  {
    v18 = sub_1D565FDF8();
    swift_bridgeObjectRelease();
    v19 = (void *)v18;
  }
  else
  {
    v19 = 0;
  }
  if (a7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9650);
    v16 = sub_1D565FF84();
    swift_bridgeObjectRelease();
    v17 = (void *)v16;
  }
  else
  {
    v17 = 0;
  }
  if (a8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9650);
    v14 = sub_1D565FF84();
    swift_bridgeObjectRelease();
    v15 = (void *)v14;
  }
  else
  {
    v15 = 0;
  }
  v12 = (id)sub_1D565ED48();
  v13 = objc_msgSend(v24, sel_initWithSearchableMessageID_bodyText_subject_sender_toList_ccList_flags_date_, a1, v26, v19, a6, v17, v15, a9, v12);

  v10 = sub_1D565ED78();
  (*(void (**)(uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a10);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v13;
}

uint64_t sub_1D56352D4()
{
  uint64_t v0;

  sub_1D5634580(*(void **)(v0 + 16));
  swift_release();

  swift_release();
  return swift_deallocObject();
}

void sub_1D5635330()
{
  uint64_t v0;

  sub_1D5633048(*(void **)(v0 + 16), *(_BYTE *)(v0 + 24) & 1, *(_QWORD *)(v0 + 32), *(void **)(v0 + 40), *(void (**)(void *))(v0 + 48));
}

uint64_t block_copy_helper_31(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_32()
{
  return swift_release();
}

void *sub_1D56353AC(void (*a1)(void))
{
  id v1;
  void *v3;

  a1();
  v3 = (void *)_swift_stdlib_bridgeErrorToNSError();
  v1 = v3;
  swift_unknownObjectRelease();
  return v3;
}

uint64_t sub_1D56353EC(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (result > 0)
    {
      sub_1D565FC00();
      v1 = sub_1D565FFCC();
      *(_QWORD *)(v1 + 16) = v4;
      v3 = v1;
    }
    else
    {
      v2 = MEMORY[0x1E0DEE9D8];
      swift_retain();
      v3 = v2;
    }
    sub_1D565FC00();
    return v3;
  }
  return result;
}

unint64_t sub_1D56354A4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1ED9A99E8;
  if (!qword_1ED9A99E8)
  {
    v0 = sub_1D565FC00();
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEF510], v0);
    atomic_store(v1, (unint64_t *)&qword_1ED9A99E8);
    return v1;
  }
  return v3;
}

unint64_t sub_1D5635514()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1ED9A9A08;
  if (!qword_1ED9A9A08)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED9A9A00);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEAF38], v0);
    atomic_store(v1, (unint64_t *)&qword_1ED9A9A08);
    return v1;
  }
  return v3;
}

uint64_t sub_1D5635584()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

void sub_1D56355D8(void *a1, char a2)
{
  uint64_t v2;

  sub_1D5631F60(a1, a2 & 1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(void **)(v2 + 32), *(NSObject **)(v2 + 40));
}

uint64_t sub_1D56355F0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1D563562C()
{
  uint64_t v0;

  return sub_1D5630C74(*(void **)(v0 + 16));
}

uint64_t sub_1D5635634()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1D5635670()
{
  return swift_deallocObject();
}

uint64_t sub_1D5635698()
{
  return swift_deallocObject();
}

uint64_t sub_1D56356C0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D56356FC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D5635738()
{
  return swift_deallocObject();
}

uint64_t sub_1D5635760()
{
  return swift_deallocObject();
}

uint64_t sub_1D5635788()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D56357C4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D5635800()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D563583C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1D5635878()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1D56358B4()
{
  return swift_deallocObject();
}

uint64_t sub_1D56358DC()
{
  return swift_deallocObject();
}

uint64_t sub_1D5635904()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D5635940()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D563597C()
{
  return swift_deallocObject();
}

uint64_t sub_1D56359A4()
{
  return swift_deallocObject();
}

uint64_t sub_1D56359CC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D5635A08()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D5635A44()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D5635A80()
{
  return swift_deallocObject();
}

uint64_t sub_1D5635AA8(uint64_t a1)
{
  uint64_t v1;

  return sub_1D5634FAC(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t block_copy_helper_118(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_119()
{
  return swift_release();
}

uint64_t sub_1D5635B10()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3EBF8) - 8);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  return swift_deallocObject();
}

void sub_1D5635B84(void *a1, char a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3EBF8);
  sub_1D562FB00(a1, a2 & 1);
}

uint64_t SearchItem.Photo.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  v1 = sub_1D565EDB4();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1);
}

uint64_t SearchItem.Photo.id.setter(uint64_t a1)
{
  uint64_t v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v11 = a1;
  v13 = 0;
  v12 = 0;
  v10 = sub_1D565EDB4();
  v9 = *(_QWORD *)(v10 - 8);
  v6 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x1E0C80A78](v10);
  v7 = (char *)&v6 - v6;
  v13 = v3;
  v12 = v1;
  (*(void (**)(double))(v4 + 16))(v2);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v8, v7, v10);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v11, v10);
}

void (*SearchItem.Photo.id.modify())()
{
  return sub_1D558A1A8;
}

_QWORD *SearchItem.Photo.configuration.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = type metadata accessor for SearchItem.Photo();
  return sub_1D558B990((_QWORD *)(v1 + *(int *)(v2 + 20)), a1);
}

uint64_t type metadata accessor for SearchItem.Photo()
{
  uint64_t v1;

  v1 = qword_1ED9A8C48;
  if (!qword_1ED9A8C48)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t SearchItem.Photo.configuration.setter(uint64_t *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *a1;
  v5 = a1[1];
  swift_bridgeObjectRetain();
  v2 = (_QWORD *)(v1 + *(int *)(type metadata accessor for SearchItem.Photo() + 20));
  *v2 = v4;
  v2[1] = v5;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*SearchItem.Photo.configuration.modify())()
{
  type metadata accessor for SearchItem.Photo();
  return sub_1D558A1A8;
}

uint64_t SearchItem.Photo.description.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for SearchItem.Photo() + 24));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t SearchItem.Photo.description.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  swift_bridgeObjectRetain();
  v3 = (_QWORD *)(v2 + *(int *)(type metadata accessor for SearchItem.Photo() + 24));
  *v3 = a1;
  v3[1] = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*SearchItem.Photo.description.modify())()
{
  type metadata accessor for SearchItem.Photo();
  return sub_1D558A1A8;
}

void *SearchItem.Photo.image.getter()
{
  uint64_t v0;
  id v1;
  void *v3;

  v3 = *(void **)(v0 + *(int *)(type metadata accessor for SearchItem.Photo() + 28));
  v1 = v3;
  return v3;
}

void SearchItem.Photo.image.setter(void *a1)
{
  uint64_t v1;
  id v2;
  void **v3;
  void *v4;

  v2 = a1;
  v3 = (void **)(v1 + *(int *)(type metadata accessor for SearchItem.Photo() + 28));
  v4 = *v3;
  *v3 = a1;

}

void (*SearchItem.Photo.image.modify())()
{
  type metadata accessor for SearchItem.Photo();
  return sub_1D558A1A8;
}

uint64_t SearchItem.Photo.senders.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for SearchItem.Photo() + 32));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t SearchItem.Photo.senders.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRetain();
  *(_QWORD *)(v1 + *(int *)(type metadata accessor for SearchItem.Photo() + 32)) = a1;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*SearchItem.Photo.senders.modify())()
{
  type metadata accessor for SearchItem.Photo();
  return sub_1D558A1A8;
}

uint64_t SearchItem.Photo.init(id:configuration:description:image:senders:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  _QWORD v24[2];
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  int *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
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
  char *v46;

  v30 = a7;
  v36 = a1;
  v24[1] = a2;
  v28 = a3;
  v33 = a4;
  v32 = a5;
  v31 = a6;
  v46 = 0;
  v45 = 0;
  v43 = 0;
  v44 = 0;
  v41 = 0;
  v42 = 0;
  v40 = 0;
  v39 = 0;
  v25 = 0;
  v37 = sub_1D565EDB4();
  v35 = *(_QWORD *)(v37 - 8);
  v24[0] = (*(_QWORD *)(v35 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v26 = (char *)v24 - v24[0];
  v29 = (int *)type metadata accessor for SearchItem.Photo();
  MEMORY[0x1E0C80A78](v26);
  v7 = v25;
  v8 = v29;
  v38 = (uint64_t)v24 - v9;
  v46 = (char *)v24 - v9;
  v45 = v10;
  v27 = *v11;
  v34 = v11[1];
  v43 = v27;
  v44 = v34;
  v41 = v12;
  v42 = v13;
  v40 = v14;
  v39 = v15;
  v16 = (_QWORD *)((char *)v24 + v29[6] - v9);
  *v16 = 0;
  v16[1] = 0;
  *(_QWORD *)((char *)v24 + v8[8] - v9) = v7;
  (*(void (**)(void))(v17 + 16))();
  (*(void (**)(uint64_t, char *, uint64_t))(v35 + 32))(v38, v26, v37);
  swift_bridgeObjectRetain();
  v18 = v34;
  v19 = (_QWORD *)(v38 + v29[5]);
  *v19 = v27;
  v19[1] = v18;
  swift_bridgeObjectRetain();
  v20 = v33;
  v21 = (_QWORD *)(v38 + v29[6]);
  *v21 = v28;
  v21[1] = v20;
  swift_bridgeObjectRelease();
  v22 = v32;
  *(_QWORD *)(v38 + v29[7]) = v32;
  swift_bridgeObjectRetain();
  *(_QWORD *)(v38 + v29[8]) = v31;
  swift_bridgeObjectRelease();
  sub_1D5636358(v38, v30);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v36, v37);
  return sub_1D5636488(v38);
}

uint64_t sub_1D5636358(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  id v5;
  uint64_t result;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int *v13;
  uint64_t v16;
  uint64_t v17;

  v2 = sub_1D565EDB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a2, a1);
  v13 = (int *)type metadata accessor for SearchItem.Photo();
  v3 = (_QWORD *)(a1 + v13[5]);
  v7 = (_QWORD *)(a2 + v13[5]);
  *v7 = *v3;
  v8 = v3[1];
  swift_bridgeObjectRetain();
  v7[1] = v8;
  v4 = v13[6];
  v9 = a2 + v4;
  *(_QWORD *)(a2 + v4) = *(_QWORD *)(a1 + v4);
  v10 = *(_QWORD *)(a1 + v4 + 8);
  swift_bridgeObjectRetain();
  *(_QWORD *)(v9 + 8) = v10;
  v11 = v13[7];
  v12 = *(void **)(a1 + v11);
  v5 = v12;
  *(_QWORD *)(a2 + v11) = v12;
  v16 = v13[8];
  v17 = *(_QWORD *)(a1 + v16);
  swift_bridgeObjectRetain();
  result = a2;
  *(_QWORD *)(a2 + v16) = v17;
  return result;
}

uint64_t sub_1D5636488(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v1 = sub_1D565EDB4();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(a1);
  v3 = type metadata accessor for SearchItem.Photo();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *SearchItem.Photo.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  id v9;
  uint64_t *result;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  id *v26;
  uint64_t v27;
  int *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint64_t v37;
  uint64_t v38;

  v27 = a1;
  v2 = v1;
  v29 = v2;
  v38 = 0;
  v37 = 0;
  v24 = 0;
  v15 = sub_1D565EDB4();
  v13 = *(_QWORD *)(v15 - 8);
  v12 = (*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x1E0C80A78](v15);
  v14 = (char *)&v11 - v12;
  v38 = a1;
  v37 = v5;
  (*(void (**)(double))(v6 + 16))(v4);
  sub_1D558B484();
  sub_1D5660884();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v14, v15);
  v28 = (int *)type metadata accessor for SearchItem.Photo();
  v7 = (uint64_t *)(v29 + v28[5]);
  v16 = *v7;
  v17 = v7[1];
  swift_bridgeObjectRetain();
  v18 = v36;
  v36[0] = v16;
  v36[1] = v17;
  sub_1D558CB60();
  sub_1D5660884();
  sub_1D5530388();
  v8 = (uint64_t *)(v29 + v28[6]);
  v19 = *v8;
  v20 = v8[1];
  swift_bridgeObjectRetain();
  v22 = v35;
  v35[0] = v19;
  v35[1] = v20;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A99F0);
  sub_1D558B38C();
  sub_1D5660884();
  sub_1D5530388();
  v23 = *(id *)(v29 + v28[7]);
  v9 = v23;
  v26 = &v34;
  v34 = v23;
  v25 = sub_1D5594EB0();
  sub_1D559DE08();
  sub_1D5660884();

  v30 = *(_QWORD *)(v29 + v28[8]);
  swift_bridgeObjectRetain();
  v32 = &v33;
  v33 = v30;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9A30);
  sub_1D5592314();
  sub_1D5660884();
  result = v32;
  sub_1D5565788();
  return result;
}

BOOL static SearchItem.Photo.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  double *v6;
  uint64_t *v7;
  uint64_t *v8;
  id v9;
  id v10;
  uint64_t v12;
  int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double *v42;
  double *v43;
  _BOOL4 v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  void (*v50)(double);
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  int v56;
  _QWORD v57[2];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[2];
  uint64_t v62;
  uint64_t v63;
  double v64[2];
  _QWORD v65[2];
  uint64_t v66;
  uint64_t v67;

  v45 = a1;
  v49 = a2;
  v67 = 0;
  v66 = 0;
  v54 = sub_1D565EDB4();
  v51 = *(_QWORD *)(v54 - 8);
  v47 = *(_QWORD *)(v51 + 64);
  v46 = (v47 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v54);
  v52 = (char *)&v12 - v46;
  v48 = v46;
  v2 = MEMORY[0x1E0C80A78]((char *)&v12 - v46);
  v53 = (char *)&v12 - v48;
  v67 = v3;
  v66 = v49;
  v50 = *(void (**)(double))(v4 + 16);
  v50(v2);
  ((void (*)(char *, uint64_t, uint64_t))v50)(v52, v49, v54);
  v56 = sub_1D565ED90();
  v55 = *(void (**)(char *, uint64_t))(v51 + 8);
  v55(v52, v54);
  v55(v53, v54);
  if ((v56 & 1) == 0)
    return 0;
  v37 = (int *)type metadata accessor for SearchItem.Photo();
  v5 = (uint64_t *)(v45 + v37[5]);
  v38 = *v5;
  v39 = v5[1];
  swift_bridgeObjectRetain();
  v43 = (double *)v65;
  v65[0] = v38;
  v65[1] = v39;
  v6 = (double *)(v49 + v37[5]);
  v40 = *v6;
  v41 = v6[1];
  swift_bridgeObjectRetain();
  v42 = v64;
  v64[0] = v40;
  v64[1] = v41;
  v44 = static CornerConfiguration.== infix(_:_:)(v43, v64);
  sub_1D5530388();
  sub_1D5530388();
  if (!v44)
    return 0;
  v7 = (uint64_t *)(v45 + v37[6]);
  v33 = *v7;
  v34 = v7[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = (uint64_t *)(v49 + v37[6]);
  v35 = *v8;
  v36 = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v61[0] = v33;
  v61[1] = v34;
  v62 = v35;
  v63 = v36;
  if (v34)
  {
    sub_1D558B990(v61, v57);
    if (v63)
    {
      v26 = v57[0];
      v29 = v57[1];
      swift_bridgeObjectRetain();
      v27 = v62;
      v30 = v61;
      v28 = v63;
      swift_bridgeObjectRetain();
      v31 = sub_1D565FE70();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1D5530388();
      v32 = v31;
      goto LABEL_9;
    }
    sub_1D5530388();
    goto LABEL_11;
  }
  if (v63)
  {
LABEL_11:
    sub_1D558B95C();
    v32 = 0;
    goto LABEL_9;
  }
  sub_1D5530388();
  v32 = 1;
LABEL_9:
  v25 = v32;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v25 & 1) != 0)
  {
    sub_1D559E6B8();
    v23 = *(id *)(v45 + v37[7]);
    v9 = v23;
    v22 = *(id *)(v49 + v37[7]);
    v10 = v22;
    v24 = sub_1D56602FC();

    if ((v24 & 1) == 0)
      return 0;
    v20 = *(_QWORD *)(v45 + v37[8]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21 = *(_QWORD *)(v49 + v37[8]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v59 = v20;
    v60 = v21;
    if (v20)
    {
      sub_1D5593174(&v59, &v58);
      if (v60)
      {
        v17 = v58;
        swift_bridgeObjectRetain();
        v16 = v60;
        swift_bridgeObjectRetain();
        v15 = sub_1D559247C();
        sub_1D55931A8();
        v18 = sub_1D5660044();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1D5565788();
        v19 = v18;
LABEL_20:
        v14 = v19;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return (v14 & 1) != 0;
      }
      sub_1D5565788();
    }
    else if (!v60)
    {
      sub_1D5565788();
      v19 = 1;
      goto LABEL_20;
    }
    sub_1D5593140();
    v19 = 0;
    goto LABEL_20;
  }
  return 0;
}

uint64_t SearchItem.Photo.hashValue.getter()
{
  type metadata accessor for SearchItem.Photo();
  sub_1D5636EC8();
  return sub_1D5660560();
}

unint64_t sub_1D5636EC8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3EC00;
  if (!qword_1EFF3EC00)
  {
    v0 = type metadata accessor for SearchItem.Photo();
    v1 = MEMORY[0x1D82763B0](&protocol conformance descriptor for SearchItem.Photo, v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3EC00);
    return v1;
  }
  return v3;
}

uint64_t sub_1D5636F38()
{
  return SearchItem.Photo.hashValue.getter();
}

uint64_t *sub_1D5636F4C(uint64_t a1)
{
  return SearchItem.Photo.hash(into:)(a1);
}

uint64_t sub_1D5636F60@<X0>(uint64_t a1@<X8>)
{
  return SearchItem.Photo.id.getter(a1);
}

unint64_t sub_1D5636F74()
{
  return sub_1D5636F88();
}

unint64_t sub_1D5636F88()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3EC08;
  if (!qword_1EFF3EC08)
  {
    v0 = type metadata accessor for SearchItem.Photo();
    v1 = MEMORY[0x1D82763B0](&protocol conformance descriptor for SearchItem.Photo, v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3EC08);
    return v1;
  }
  return v3;
}

BOOL sub_1D5636FF8(uint64_t a1, uint64_t a2)
{
  return static SearchItem.Photo.== infix(_:_:)(a1, a2);
}

unint64_t _s5PhotoVwCP(_QWORD *a1, uint64_t *a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v21;

  v21 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v21 & 0x20000) != 0)
  {
    v16 = *a2;
    swift_retain();
    *a1 = v16;
    return *a1 + ((v21 + 16) & ~(unint64_t)v21);
  }
  else
  {
    v3 = sub_1D565EDB4();
    (*(void (**)(_QWORD *, uint64_t *))(*(_QWORD *)(v3 - 8) + 16))(a1, a2);
    v4 = a3[5];
    v8 = (char *)a1 + v4;
    *(_QWORD *)((char *)a1 + v4) = *(uint64_t *)((char *)a2 + v4);
    v9 = *(uint64_t *)((char *)a2 + v4 + 8);
    swift_bridgeObjectRetain();
    *((_QWORD *)v8 + 1) = v9;
    v5 = a3[6];
    v10 = (char *)a1 + v5;
    *(_QWORD *)((char *)a1 + v5) = *(uint64_t *)((char *)a2 + v5);
    v11 = *(uint64_t *)((char *)a2 + v5 + 8);
    swift_bridgeObjectRetain();
    *((_QWORD *)v10 + 1) = v11;
    v12 = a3[7];
    v13 = *(void **)((char *)a2 + v12);
    v6 = v13;
    *(_QWORD *)((char *)a1 + v12) = v13;
    v14 = a3[8];
    v15 = *(uint64_t *)((char *)a2 + v14);
    swift_bridgeObjectRetain();
    *(_QWORD *)((char *)a1 + v14) = v15;
    return (unint64_t)a1;
  }
}

uint64_t _s5PhotoVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = sub_1D565EDB4();
  (*(void (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t _s5PhotoVwcp(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  uint64_t result;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v17;
  uint64_t v18;

  v3 = sub_1D565EDB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, a2);
  v4 = (_QWORD *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + a3[5]);
  *v8 = *v4;
  v9 = v4[1];
  swift_bridgeObjectRetain();
  v8[1] = v9;
  v5 = (_QWORD *)(a2 + a3[6]);
  v10 = (_QWORD *)(a1 + a3[6]);
  *v10 = *v5;
  v11 = v5[1];
  swift_bridgeObjectRetain();
  v10[1] = v11;
  v12 = a3[7];
  v13 = *(void **)(a2 + v12);
  v6 = v13;
  *(_QWORD *)(a1 + v12) = v13;
  v17 = a3[8];
  v18 = *(_QWORD *)(a2 + v17);
  swift_bridgeObjectRetain();
  result = a1;
  *(_QWORD *)(a1 + v17) = v18;
  return result;
}

uint64_t _s5PhotoVwca(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  void *v7;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v17;
  uint64_t v18;

  v3 = sub_1D565EDB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 24))(a1, a2);
  v4 = (_QWORD *)(a2 + a3[5]);
  v9 = (_QWORD *)(a1 + a3[5]);
  *v9 = *v4;
  v10 = v4[1];
  swift_bridgeObjectRetain();
  v9[1] = v10;
  swift_bridgeObjectRelease();
  v5 = (_QWORD *)(a2 + a3[6]);
  v11 = (_QWORD *)(a1 + a3[6]);
  *v11 = *v5;
  v12 = v5[1];
  swift_bridgeObjectRetain();
  v11[1] = v12;
  swift_bridgeObjectRelease();
  v13 = a3[7];
  v14 = *(void **)(a2 + v13);
  v6 = v14;
  v7 = *(void **)(a1 + v13);
  *(_QWORD *)(a1 + v13) = v14;

  v17 = (_QWORD *)(a1 + a3[8]);
  v18 = *(_QWORD *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  *v17 = v18;
  swift_bridgeObjectRelease();
  return a1;
}

__n128 _s5PhotoVwtk(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  __n128 result;

  v3 = sub_1D565EDB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32))(a1, a2);
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  result = *(__n128 *)(a2 + a3[6]);
  *(__n128 *)(a1 + a3[6]) = result;
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  return result;
}

uint64_t _s5PhotoVwta(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  void **v8;
  void *v9;

  v3 = sub_1D565EDB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(a1, a2);
  v4 = (_QWORD *)(a2 + a3[5]);
  v5 = (_QWORD *)(a1 + a3[5]);
  *v5 = *v4;
  v5[1] = v4[1];
  swift_bridgeObjectRelease();
  v6 = (_QWORD *)(a2 + a3[6]);
  v7 = (_QWORD *)(a1 + a3[6]);
  *v7 = *v6;
  v7[1] = v6[1];
  swift_bridgeObjectRelease();
  v8 = (void **)(a1 + a3[7]);
  v9 = *v8;
  *v8 = *(void **)(a2 + a3[7]);

  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s5PhotoVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D5637654(uint64_t a1, unsigned int a2, uint64_t a3)
{
  int v4;
  unsigned int v5;
  uint64_t v9;
  uint64_t v10;

  v9 = sub_1D565EDB4();
  v10 = *(_QWORD *)(v9 - 8);
  if (a2 == *(_DWORD *)(v10 + 84))
  {
    return (*(unsigned int (**)(uint64_t, _QWORD, uint64_t))(v10 + 48))(a1, a2, v9);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    v4 = -1;
    if (*(_QWORD *)(a1 + *(int *)(a3 + 20) + 8) < 0x100000000uLL)
      v4 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
    return (v4 + 1);
  }
  else
  {
    __break(1u);
  }
  return v5;
}

uint64_t _s5PhotoVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D5637750(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1D565EDB4();
  v9 = *(_QWORD *)(result - 8);
  if (a3 == *(_DWORD *)(v9 + 84))
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v9 + 56))(a1, a2, a2, result);
  if (a3 == 0x7FFFFFFF)
    *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = a2 - 1;
  else
    __break(1u);
  return result;
}

uint64_t sub_1D5637804()
{
  unint64_t v0;
  uint64_t v2;

  v2 = sub_1D565EDB4();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

id static UIColor.platformSecondaryLabel.getter()
{
  return objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor);
}

id static UIColor.platformLabel.getter()
{
  return objc_msgSend((id)objc_opt_self(), sel_labelColor);
}

id static UIColor.focus.getter()
{
  return objc_msgSend((id)objc_opt_self(), sel_systemIndigoColor);
}

id static UIColor.readLater.getter()
{
  return objc_msgSend((id)objc_opt_self(), sel_systemTealColor);
}

id static UIColor.reviewSenderBackground.getter()
{
  return objc_msgSend((id)objc_opt_self(), sel_secondarySystemGroupedBackgroundColor);
}

id static UIColor.messageListBackground.getter()
{
  return objc_msgSend((id)objc_opt_self(), sel_tableBackgroundColor);
}

id static UIFont.manualSummary.getter()
{
  id v0;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_opt_self();
  v4 = (void *)*MEMORY[0x1E0DC4AB8];
  v0 = (id)*MEMORY[0x1E0DC4AB8];
  v5 = objc_msgSend(v3, sel__preferredFontForTextStyle_addingSymbolicTraits_, v4, 2);

  if (v5)
    return v5;
  sub_1D5660620();
  __break(1u);
  return (id)v2;
}

id static UIFont.manualSummaryTextView.getter()
{
  id v0;
  id v2;
  id v3;
  id v4;

  v2 = (id)objc_opt_self();
  v3 = (id)*MEMORY[0x1E0DC4A88];
  v0 = (id)*MEMORY[0x1E0DC4A88];
  v4 = objc_msgSend(v2, sel_preferredFontForTextStyle_, v3);

  return v4;
}

id sub_1D5637BC8()
{
  id v0;
  id ObjCClassFromMetadata;
  void *v4;
  id v5;

  ObjCClassFromMetadata = (id)swift_getObjCClassFromMetadata();
  swift_bridgeObjectRetain();
  v4 = (void *)sub_1D565FDF8();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(ObjCClassFromMetadata, sel__systemImageNamed_, v4);

  if (v5)
  {
    v0 = v5;
    swift_bridgeObjectRelease();

    return v5;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

id sub_1D5637CC8()
{
  return sub_1D556CE74();
}

uint64_t PlatformLocation.address.getter()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t PlatformLocation.address.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRetain();
  *v2 = a1;
  v2[1] = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*PlatformLocation.address.modify())()
{
  return sub_1D558A1A8;
}

uint64_t PlatformLocation.description.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t PlatformLocation.description.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRetain();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*PlatformLocation.description.modify())()
{
  return sub_1D558A1A8;
}

void *PlatformLocation.senderImage.getter()
{
  uint64_t v0;
  id v1;
  void *v3;

  v3 = *(void **)(v0 + 32);
  v1 = v3;
  return v3;
}

void PlatformLocation.senderImage.setter(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v2 = a1;
  v3 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = a1;

}

void (*PlatformLocation.senderImage.modify())()
{
  return sub_1D558A1A8;
}

void *PlatformLocation.mapImage.getter()
{
  uint64_t v0;
  id v1;
  void *v3;

  v3 = *(void **)(v0 + 40);
  v1 = v3;
  return v3;
}

void PlatformLocation.mapImage.setter(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v2 = a1;
  v3 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = a1;

}

void (*PlatformLocation.mapImage.modify())()
{
  return sub_1D558A1A8;
}

id *PlatformLocation.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  id *result;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12[5];
  uint64_t v13;
  uint64_t v14;

  v13 = 0;
  v14 = a1;
  v5 = *(void **)v1;
  v6 = *(void **)(v1 + 8);
  v7 = *(void **)(v1 + 16);
  v8 = *(void **)(v1 + 24);
  v9 = *(id *)(v1 + 32);
  v10 = *(id *)(v1 + 40);
  v13 = v1;
  swift_bridgeObjectRetain();
  v12[3] = v5;
  v12[4] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A99F0);
  sub_1D558B38C();
  sub_1D5660884();
  sub_1D5530388();
  swift_bridgeObjectRetain();
  v12[1] = v7;
  v12[2] = v8;
  sub_1D5660884();
  sub_1D5530388();
  v2 = v9;
  v12[0] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9B68);
  sub_1D5638138();
  sub_1D5660884();
  sub_1D5565D18(v12);
  v3 = v10;
  v11 = v10;
  sub_1D5660884();
  result = &v11;
  sub_1D5565D18(&v11);
  return result;
}

unint64_t sub_1D5638138()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = qword_1EFF3EC10;
  if (!qword_1EFF3EC10)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED9A9B68);
    v4 = sub_1D559DE08();
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEE990], v2, &v4);
    atomic_store(v0, (unint64_t *)&qword_1EFF3EC10);
    return v0;
  }
  return v3;
}

BOOL static PlatformLocation.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  _QWORD v44[3];
  uint64_t v45;
  _QWORD v46[3];
  uint64_t v47;
  _QWORD *v48;
  _QWORD *v49;

  v49 = 0;
  v48 = 0;
  v28 = *a1;
  v29 = a1[1];
  v20 = a1[2];
  v21 = a1[3];
  v22 = (id)a1[4];
  v23 = (id)a1[5];
  v49 = a1;
  v30 = *a2;
  v31 = a2[1];
  v24 = a2[2];
  v25 = a2[3];
  v26 = (id)a2[4];
  v27 = (id)a2[5];
  v48 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v46[0] = v28;
  v46[1] = v29;
  v46[2] = v30;
  v47 = v31;
  if (v29)
  {
    sub_1D558B990(v46, &v32);
    if (v47)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v18 = sub_1D565FE70();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1D5530388();
      v19 = v18;
      goto LABEL_7;
    }
    sub_1D5530388();
    goto LABEL_9;
  }
  if (v47)
  {
LABEL_9:
    sub_1D558B95C();
    v19 = 0;
    goto LABEL_7;
  }
  sub_1D5530388();
  v19 = 1;
LABEL_7:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v19 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v44[0] = v20;
    v44[1] = v21;
    v44[2] = v24;
    v45 = v25;
    if (v21)
    {
      sub_1D558B990(v44, &v33);
      if (v45)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v16 = sub_1D565FE70();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1D5530388();
        v17 = v16;
        goto LABEL_17;
      }
      sub_1D5530388();
    }
    else if (!v45)
    {
      sub_1D5530388();
      v17 = 1;
LABEL_17:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v17 & 1) == 0)
        return 0;
      v2 = v22;
      v3 = v22;
      v4 = v26;
      v5 = v26;
      v42 = v22;
      v43 = v26;
      if (v22)
      {
        sub_1D559B584(&v42, &v36);
        if (v43)
        {
          v35 = v36;
          v34 = v43;
          sub_1D5594EB0();
          v14 = sub_1D56602FC();

          sub_1D5565D18(&v42);
          v15 = v14;
          goto LABEL_27;
        }

      }
      else if (!v43)
      {
        sub_1D5565D18(&v42);
        v15 = 1;
LABEL_27:

        if ((v15 & 1) == 0)
          return 0;
        v6 = v23;
        v7 = v23;
        v8 = v27;
        v9 = v27;
        v40 = v23;
        v41 = v27;
        if (v23)
        {
          sub_1D559B584(&v40, &v39);
          if (v41)
          {
            v38 = v39;
            v37 = v41;
            sub_1D5594EB0();
            v12 = sub_1D56602FC();

            sub_1D5565D18(&v40);
            v13 = v12;
LABEL_37:

            return (v13 & 1) != 0;
          }

        }
        else if (!v41)
        {
          sub_1D5565D18(&v40);
          v13 = 1;
          goto LABEL_37;
        }
        sub_1D559E71C(&v40);
        v13 = 0;
        goto LABEL_37;
      }
      sub_1D559E71C(&v42);
      v15 = 0;
      goto LABEL_27;
    }
    sub_1D558B95C();
    v17 = 0;
    goto LABEL_17;
  }
  return 0;
}

uint64_t PlatformLocation.hashValue.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD __b[6];

  memset(__b, 0, sizeof(__b));
  v1 = v0[1];
  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = v0[5];
  __b[0] = *v0;
  __b[1] = v1;
  __b[2] = v2;
  __b[3] = v3;
  __b[4] = v4;
  __b[5] = v5;
  sub_1D5638830();
  return sub_1D5660560();
}

unint64_t sub_1D5638830()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3EC18;
  if (!qword_1EFF3EC18)
  {
    v0 = MEMORY[0x1D82763B0](&protocol conformance descriptor for PlatformLocation, &type metadata for PlatformLocation);
    atomic_store(v0, (unint64_t *)&qword_1EFF3EC18);
    return v0;
  }
  return v2;
}

uint64_t sub_1D563889C()
{
  return PlatformLocation.hashValue.getter();
}

id *sub_1D56388B0(uint64_t a1)
{
  return PlatformLocation.hash(into:)(a1);
}

unint64_t sub_1D56388C4()
{
  return sub_1D56388D8();
}

unint64_t sub_1D56388D8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3EC20;
  if (!qword_1EFF3EC20)
  {
    v0 = MEMORY[0x1D82763B0](&protocol conformance descriptor for PlatformLocation, &type metadata for PlatformLocation);
    atomic_store(v0, (unint64_t *)&qword_1EFF3EC20);
    return v0;
  }
  return v2;
}

BOOL sub_1D5638944(_QWORD *a1, _QWORD *a2)
{
  return static PlatformLocation.== infix(_:_:)(a1, a2);
}

void destroy for PlatformLocation(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

_QWORD *initializeWithCopy for PlatformLocation(_QWORD *a1, _QWORD *a2)
{
  id v2;
  id v3;
  _QWORD *result;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v9;

  *a1 = *a2;
  v5 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v5;
  a1[2] = a2[2];
  v6 = a2[3];
  swift_bridgeObjectRetain();
  a1[3] = v6;
  v7 = (void *)a2[4];
  v2 = v7;
  a1[4] = v7;
  v9 = (void *)a2[5];
  v3 = v9;
  result = a1;
  a1[5] = v9;
  return result;
}

_QWORD *assignWithCopy for PlatformLocation(_QWORD *a1, _QWORD *a2)
{
  id v2;
  id v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v10;
  void *v11;

  *a1 = *a2;
  v5 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v5;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  v6 = a2[3];
  swift_bridgeObjectRetain();
  a1[3] = v6;
  swift_bridgeObjectRelease();
  v8 = (id)a1[4];
  v7 = (void *)a2[4];
  v2 = v7;
  a1[4] = v7;

  v11 = (void *)a1[5];
  v10 = (void *)a2[5];
  v3 = v10;
  a1[5] = v10;

  return a1;
}

_QWORD *assignWithTake for PlatformLocation(_QWORD *a1, _QWORD *a2)
{
  void *v2;
  void *v3;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  v2 = (void *)a1[4];
  a1[4] = a2[4];

  v3 = (void *)a1[5];
  a1[5] = a2[5];

  return a1;
}

uint64_t getEnumTagSinglePayload for PlatformLocation(uint64_t a1, unsigned int a2)
{
  int v2;
  int v4;
  int v5;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 48))
    {
      v5 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v4 = -1;
      if (!HIDWORD(*(_QWORD *)(a1 + 8)))
        v4 = *(_QWORD *)(a1 + 8);
      v2 = v4 - 1;
      if (v4 - 1 < 0)
        v2 = -1;
      v5 = v2;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PlatformLocation(uint64_t result, unsigned int a2, unsigned int a3)
{
  _BOOL4 v3;

  v3 = a3 > 0x7FFFFFFE;
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)(result + 32) = 0;
    *(_QWORD *)(result + 40) = 0;
    if (a3 > 0x7FFFFFFE)
    {
      if (v3)
        *(_BYTE *)(result + 48) = 1;
      else
        __break(1u);
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFE)
    {
      if (v3)
        *(_BYTE *)(result + 48) = 0;
      else
        __break(1u);
    }
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PlatformLocation()
{
  return &type metadata for PlatformLocation;
}

void sub_1D5638F04(double a1)
{
  void *v1;
  id v3;

  v3 = objc_msgSend(v1, sel_textContainer);
  objc_msgSend(v3, sel_setLineFragmentPadding_, a1);

}

double sub_1D5638F70()
{
  void *v0;
  double v1;
  double v2;
  double v4;

  objc_msgSend(v0, (SEL)0x1F28C58C8);
  v4 = v1;
  objc_msgSend(v0, (SEL)0x1F28C58C8);
  return v4 + v2;
}

void sub_1D5638FFC(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v6;
  uint64_t v7;

  sub_1D565FE64();
  v7 = sub_1D565EE20();
  if ((objc_msgSend(v6, sel_respondsToSelector_) & 1) != 0)
  {
    v1 = a1;
    v2 = v6;
    objc_msgSend(v6, sel_performSelector_withObject_, v7, a1);
    swift_unknownObjectRelease();
    v3 = v6;
  }
  else
  {
    v4 = a1;
    objc_msgSend(v6, sel_setAttributedText_, a1);

  }
}

id sub_1D56390D8()
{
  id result;
  id v1;
  id v2;
  uint64_t v3;

  sub_1D565FE64();
  v3 = sub_1D565EE20();
  result = objc_msgSend(v2, sel_respondsToSelector_);
  if ((result & 1) != 0)
  {
    v1 = v2;
    objc_msgSend(v2, sel_performSelector_, v3);
    return v2;
  }
  return result;
}

id sub_1D5639170()
{
  id result;
  id v1;
  id v2;
  uint64_t v3;

  sub_1D565FE64();
  v3 = sub_1D565EE20();
  result = objc_msgSend(v2, sel_respondsToSelector_);
  if ((result & 1) != 0)
  {
    v1 = v2;
    objc_msgSend(v2, sel_performSelector_, v3);
    return v2;
  }
  return result;
}

double sub_1D5639208()
{
  void *v0;
  double v1;
  id v3;
  double v4;

  v3 = objc_msgSend(v0, sel_textContainer);
  objc_msgSend(v3, sel_lineFragmentPadding);
  v4 = v1;

  return v4;
}

id QLThumbnailRepresentation.platformImage.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_UIImage);
}

double static QuickReply.additionalWebViewPadding.getter()
{
  return 2.0;
}

ValueMetadata *type metadata accessor for QuickReply()
{
  return &type metadata for QuickReply;
}

id sub_1D56392C8(uint64_t a1, uint64_t a2)
{
  id v2;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_1D5639E6C(a1, a2);
}

uint64_t RichLinkMetadataGenerator.__allocating_init(messageRepository:)(void *a1)
{
  swift_allocObject();
  return RichLinkMetadataGenerator.init(messageRepository:)(a1);
}

uint64_t RichLinkMetadataGenerator.init(messageRepository:)(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v6;

  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 24) = sub_1D56393EC();
  v2 = a1;
  swift_beginAccess();
  v3 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = a1;

  swift_endAccess();
  return v6;
}

id sub_1D56393EC()
{
  unint64_t v0;
  unint64_t v2;
  id v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9750);
  v2 = sub_1D55CA678();
  v0 = sub_1D5639E08();
  v3 = sub_1D56392C8(v2, v0);
  objc_msgSend(v3, sel_setCountLimit_, 6);
  return v3;
}

void RichLinkMetadataGenerator.retreiveMetadata(for:messageID:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t a6)
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  const void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v18;
  id v20;
  id v22;
  id v23;
  uint64_t aBlock;
  int v25;
  int v26;
  uint64_t (*v27)(uint64_t, void *);
  void *v28;
  uint64_t (*v29)(uint64_t, unint64_t);
  _QWORD *v30;
  void *v31;
  uint64_t v32;
  void (*v33)(_QWORD);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v31 = 0;
  v37 = a1;
  v38 = a2;
  v35 = a3;
  v36 = a4;
  v33 = a5;
  v34 = a6;
  v32 = v6;
  swift_beginAccess();
  v22 = *(id *)(v6 + 24);
  v7 = v22;
  swift_endAccess();
  swift_bridgeObjectRetain();
  v20 = (id)sub_1D565FDF8();
  v23 = objc_msgSend(v22, sel_objectForKey_);

  swift_bridgeObjectRelease();
  if (v23)
  {
    swift_retain();
    v8 = v23;
    a5(v23);

    swift_release();
  }
  else
  {
    swift_beginAccess();
    v15 = *(void **)(v18 + 16);
    v9 = v15;
    swift_endAccess();
    if (v15)
    {
      v31 = v15;
      swift_bridgeObjectRetain();
      v14 = (id)sub_1D565FDF8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v13 = (id)sub_1D565FDF8();
      swift_bridgeObjectRelease();
      v11 = swift_allocObject();
      swift_retain();
      swift_weakInit();
      swift_release();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      v10 = (_QWORD *)swift_allocObject();
      v10[2] = a5;
      v10[3] = a6;
      v10[4] = v11;
      v10[5] = a1;
      v10[6] = a2;
      v29 = sub_1D5639AEC;
      v30 = v10;
      aBlock = MEMORY[0x1E0C809B0];
      v25 = 1107296256;
      v26 = 0;
      v27 = sub_1D5639B74;
      v28 = &block_descriptor_5;
      v12 = _Block_copy(&aBlock);
      swift_release();
      swift_release();
      objc_msgSend(v15, sel_requestRichLinkMetadataForRichLinkID_messageID_completionHandler_, v14, v13, v12);
      _Block_release(v12);

    }
    else
    {
      swift_retain();
      a5(0);
      swift_release();
    }
  }
}

uint64_t sub_1D56397F8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1D5639834(uint64_t a1, unint64_t a2, void (*a3)(id))
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t Strong;

  sub_1D5639DC0(a1, a2);
  if ((a2 & 0xF000000000000000) == 0xF000000000000000)
  {
    swift_retain();
    a3(0);
    return swift_release();
  }
  else
  {
    sub_1D5639E08();
    sub_1D56346B8(a1, a2);
    v8 = sub_1D5639B04(a1, a2);
    swift_beginAccess();
    Strong = swift_weakLoadStrong();
    if (Strong)
    {
      swift_retain();
      sub_1D5565D40();
      swift_endAccess();
      swift_beginAccess();
      v7 = *(id *)(Strong + 24);
      v4 = v7;
      swift_endAccess();
      swift_release();
      swift_bridgeObjectRetain();
      v6 = (id)sub_1D565FDF8();
      objc_msgSend(v7, sel_setObject_forKey_, v8);

      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1D5565D40();
      swift_endAccess();
    }
    swift_retain();
    v5 = v8;
    a3(v8);

    swift_release();
    return sub_1D5634810(a1, a2);
  }
}

uint64_t sub_1D5639AA0()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1D5639AEC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_1D5639834(a1, a2, *(void (**)(id))(v2 + 16));
}

id sub_1D5639B04(uint64_t a1, unint64_t a2)
{
  id v3;
  id v6;

  v3 = (id)sub_1D565ED30();
  v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_metadataWithDataRepresentation_, v3);

  sub_1D5634810(a1, a2);
  return v6;
}

uint64_t sub_1D5639B74(uint64_t a1, void *a2)
{
  id v2;
  unint64_t v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void (*v9)(void);

  v9 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v2 = a2;
  if (a2)
  {
    v5 = sub_1D565ED3C();
    v6 = v3;

    v7 = v5;
    v8 = v6;
  }
  else
  {
    v7 = 0;
    v8 = 0xF000000000000000;
  }
  v9();
  sub_1D5639D78(v7, v8);
  return swift_release();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t RichLinkMetadataGenerator.deinit()
{
  uint64_t v0;
  uint64_t v2;

  sub_1D5565D18((id *)(v0 + 16));

  return v2;
}

uint64_t RichLinkMetadataGenerator.__deallocating_deinit()
{
  RichLinkMetadataGenerator.deinit();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RichLinkMetadataGenerator()
{
  return objc_opt_self();
}

uint64_t method lookup function for RichLinkMetadataGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RichLinkMetadataGenerator.__allocating_init(messageRepository:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_1D5639D78(uint64_t result, unint64_t a2)
{
  if ((a2 & 0xF000000000000000) != 0xF000000000000000)
    return sub_1D5634810(result, a2);
  return result;
}

uint64_t sub_1D5639DC0(uint64_t result, unint64_t a2)
{
  if ((a2 & 0xF000000000000000) != 0xF000000000000000)
    return sub_1D56346B8(result, a2);
  return result;
}

unint64_t sub_1D5639E08()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1ED9A9538;
  if (!qword_1ED9A9538)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1ED9A9538);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_1D5639E6C(uint64_t a1, uint64_t a2)
{
  void *v2;

  return objc_msgSend(v2, sel_init, a2, a1);
}

double sub_1D5639EA0()
{
  double result;

  result = 16.0;
  qword_1ED9A9380 = 16.0;
  return result;
}

uint64_t *sub_1D5639EB0()
{
  if (qword_1ED9A9390 != -1)
    swift_once();
  return &qword_1ED9A9380;
}

double static SearchCollectionViewLayoutFactory_iOS.horizontalPadding.getter()
{
  return *(double *)sub_1D5639EB0();
}

double sub_1D5639F1C()
{
  double result;

  result = 800.0;
  qword_1ED9A99C8 = 0x4089000000000000;
  return result;
}

uint64_t *sub_1D5639F30()
{
  if (qword_1ED9A99D8 != -1)
    swift_once();
  return &qword_1ED9A99C8;
}

double static SearchCollectionViewLayoutFactory_iOS.screenSizeLarge.getter()
{
  return *(double *)sub_1D5639F30();
}

double sub_1D5639F9C()
{
  double result;

  result = 44.0;
  qword_1ED9A9398 = 0x4046000000000000;
  return result;
}

uint64_t *sub_1D5639FB0()
{
  if (qword_1ED9A93A0 != -1)
    swift_once();
  return &qword_1ED9A9398;
}

double static SearchCollectionViewLayoutFactory_iOS.estimatedHeaderHeight.getter()
{
  return *(double *)sub_1D5639FB0();
}

void static SearchCollectionViewLayoutFactory_iOS.columnCount(forSection:usingLayoutEnvironment:)(char *a1, void *a2)
{
  id v3;
  char v4;

  v4 = *a1;
  swift_getObjectType();
  swift_unknownObjectRetain();
  v3 = objc_msgSend(a2, sel_container);
  swift_unknownObjectRelease();
  swift_getObjectType();
  objc_msgSend(v3, sel_effectiveContentSize);
  swift_unknownObjectRelease();
  __asm { BR              X8 }
}

uint64_t sub_1D563A0F4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16, id a17, id a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v30;
  uint64_t v32;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v35 = objc_msgSend(v37, sel_traitCollection);
  swift_unknownObjectRelease();
  v36 = objc_msgSend(v35, sel_preferredContentSizeCategory);
  *(_QWORD *)(v30 - 48) = v36;

  if ((sub_1D56602D8() & 1) != 0)
  {
    if (*(double *)sub_1D5639F30() >= *(double *)(v30 - 72))
      v32 = 2;
    else
      v32 = 4;

    return v32;
  }
  else
  {
    if (*(double *)sub_1D5639F30() >= *(double *)(v30 - 72))
      v34 = 4;
    else
      v34 = 6;

    return v34;
  }
}

void static SearchCollectionViewLayoutFactory_iOS.layout(forSection:layoutEnvironment:)(char *a1, void *a2)
{
  char v2;
  char v3;
  void *v4;
  char v5;

  v5 = 0;
  v4 = 0;
  v2 = *a1;
  v5 = v2;
  v4 = a2;
  v3 = v2;
  static SearchCollectionViewLayoutFactory_iOS.columnCount(forSection:usingLayoutEnvironment:)(&v3, a2);
  __asm { BR              X8 }
}

id sub_1D563A350()
{
  uint64_t v1;

  return static SearchCollectionViewLayoutFactory_iOS.contactsSectionLayout(columns:)(v1);
}

id static SearchCollectionViewLayoutFactory_iOS.contactsSectionLayout(columns:)(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  uint64_t *v18;
  _QWORD *v19;
  id v20;
  id v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;

  sub_1D563C4F4();
  v22 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F295BE65);
  v1 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F29AD8E3);
  v38 = sub_1D563C558(v22, v1);
  sub_1D563C5B8();
  v2 = v38;
  v37 = sub_1D563C61C(v38);
  v23 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F295BE65, 1.0);
  v3 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F29AD8E3, 76.0);
  v36 = sub_1D563C558(v23, v3);
  v35 = objc_msgSend((id)objc_opt_self(), sel_horizontalGroupWithLayoutSize_subitem_count_, v36, v37, a1);
  sub_1D563C66C();
  v4 = v35;
  v32 = sub_1D563C6D0(v35);
  v5 = v32;
  v6 = v32;
  v7 = v32;
  v8 = v32;
  v9 = v32;
  objc_msgSend(v32, sel_setInterGroupSpacing_);

  v25 = *sub_1D5639EB0();
  objc_msgSend(v32, (SEL)0x1F2687848);
  objc_msgSend(v32, (SEL)0x1F27183C8, *(double *)&v25, v10, v11, v12);

  v26 = *sub_1D5639EB0();
  objc_msgSend(v32, (SEL)0x1F2687848);
  objc_msgSend(v32, (SEL)0x1F27183C8, v13, v14, *(double *)&v26, v15);

  objc_msgSend(v37, (SEL)0x1F27183C8, 8.0, 8.0, 8.0, 8.0);
  v27 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F295BE65, 1.0);
  v16 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F29AD8E3, 1.0);
  v34 = sub_1D563C558(v27, v16);
  sub_1D563C720();
  v17 = v34;
  v18 = sub_1D564A728();
  v28 = *v18;
  v29 = v18[1];
  swift_bridgeObjectRetain();
  v33 = sub_1D563C784(v34, v28, v29, 5);
  sub_1D566077C();
  v30 = v19;
  v20 = v33;
  *v30 = v33;
  sub_1D5571928();
  v31 = (id)sub_1D565FF84();
  swift_bridgeObjectRelease();
  objc_msgSend(v32, sel_setBoundarySupplementaryItems_, v31);

  return v32;
}

id static SearchCollectionViewLayoutFactory_iOS.documentsSectionLayout(columns:)(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t *v10;
  id v11;
  id v12;
  uint64_t *v13;
  _QWORD *v14;
  id v15;
  id v16;
  id v18;
  id v19;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;

  sub_1D563C4F4();
  v18 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F295BE65);
  v1 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F29AD8E3);
  v39 = sub_1D563C558(v18, v1);
  sub_1D563C5B8();
  v2 = v39;
  v38 = sub_1D563C61C(v39);
  objc_msgSend(v38, (SEL)0x1F27183C8, 8.0, 8.0, 8.0, 8.0);
  v19 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F295BE65, 1.0);
  v3 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F29AD8E3, 150.0);
  v37 = sub_1D563C558(v19, v3);
  v36 = objc_msgSend((id)objc_opt_self(), sel_horizontalGroupWithLayoutSize_subitem_count_, v37, v38, a1);
  sub_1D563C66C();
  v4 = v36;
  v30 = sub_1D563C6D0(v36);
  v5 = v30;
  v6 = v30;
  v7 = v30;
  v35 = *sub_1D5639EB0();
  objc_msgSend(v30, (SEL)0x1F27183C8, 8.0, *(double *)&v35, 8.0, *(double *)sub_1D5639EB0());

  v22 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F295BE65, 1.0);
  v21 = (id)objc_opt_self();
  v8 = objc_msgSend(v21, (SEL)0x1F29AD8E3, *(double *)sub_1D5639FB0());
  v34 = sub_1D563C558(v22, v8);
  sub_1D563C720();
  v9 = v34;
  v10 = sub_1D565348C();
  v23 = *v10;
  v24 = v10[1];
  swift_bridgeObjectRetain();
  v33 = sub_1D563C784(v34, v23, v24, 1);
  v25 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F295BE65, 1.0);
  v11 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F29AD8E3, 1.0);
  v32 = sub_1D563C558(v25, v11);
  v12 = v32;
  v13 = sub_1D564A728();
  v26 = *v13;
  v27 = v13[1];
  swift_bridgeObjectRetain();
  v31 = sub_1D563C784(v32, v26, v27, 5);
  sub_1D566077C();
  v28 = v14;
  v15 = v33;
  *v28 = v33;
  v16 = v31;
  v28[1] = v31;
  sub_1D5571928();
  v29 = (id)sub_1D565FF84();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_setBoundarySupplementaryItems_, v29);

  return v30;
}

id static SearchCollectionViewLayoutFactory_iOS.linksSectionLayout(columns:)(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t *v7;
  _QWORD *v8;
  id v9;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[7];
  _QWORD v34[2];

  v34[1] = a1;
  sub_1D563C4F4();
  v11 = (id)objc_opt_self();
  v34[0] = a1;
  v14 = sub_1D55719D0();
  v13 = MEMORY[0x1E0DEB418];
  v12 = objc_msgSend(v11, (SEL)0x1F295BE65, 1.0 / sub_1D557C0AC((uint64_t)v34, MEMORY[0x1E0DEB418], v14));
  v1 = objc_msgSend((id)objc_opt_self(), sel_fractionalHeightDimension_, 1.0);
  v26 = sub_1D563C558(v12, v1);
  v33[6] = v26;
  sub_1D563C5B8();
  v2 = v26;
  v25 = sub_1D563C61C(v26);
  v33[5] = v25;
  v33[1] = 2.0;
  v33[2] = 2.0;
  v33[3] = 2.0;
  v33[4] = 2.0;
  objc_msgSend(v25, (SEL)0x1F27183C8, 2.0, 2.0, 2.0, 2.0);
  v16 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F295BE65, 1.0);
  v15 = (id)objc_opt_self();
  v33[0] = a1;
  v3 = objc_msgSend(v15, (SEL)0x1F295BE65, 1.0 / sub_1D557C0AC((uint64_t)v33, v13, v14));
  v32 = sub_1D563C558(v16, v3);
  v31 = objc_msgSend((id)objc_opt_self(), sel_horizontalGroupWithLayoutSize_subitem_count_, v32, v25, a1);
  v18 = objc_msgSend((id)objc_opt_self(), sel_fixedSpacing_, 2.0);
  objc_msgSend(v31, sel_setInterItemSpacing_);

  sub_1D563C66C();
  v4 = v31;
  v30 = sub_1D563C6D0(v31);
  v29 = *sub_1D5639EB0();
  objc_msgSend(v30, (SEL)0x1F27183C8, 2.0, *(double *)&v29, 2.0, *(double *)sub_1D5639EB0());
  objc_msgSend(v30, sel_setInterGroupSpacing_, 2.0);
  v20 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F295BE65, 1.0);
  v19 = (id)objc_opt_self();
  v5 = objc_msgSend(v19, sel_estimatedDimension_, *(double *)sub_1D5639FB0());
  v28 = sub_1D563C558(v20, v5);
  sub_1D563C720();
  v6 = v28;
  v7 = sub_1D565348C();
  v21 = *v7;
  v22 = v7[1];
  swift_bridgeObjectRetain();
  v27 = sub_1D563C784(v28, v21, v22, 1);
  sub_1D566077C();
  v23 = v8;
  v9 = v27;
  *v23 = v27;
  sub_1D5571928();
  v24 = (id)sub_1D565FF84();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_setBoundarySupplementaryItems_, v24);

  return v30;
}

id static SearchCollectionViewLayoutFactory_iOS.locationsSectionLayout(columns:)(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t *v7;
  id v8;
  id v9;
  uint64_t *v10;
  _QWORD *v11;
  id v12;
  id v13;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  id v20;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[7];
  _QWORD v43[2];

  v43[1] = a1;
  sub_1D563C4F4();
  v15 = (id)objc_opt_self();
  v43[0] = a1;
  v18 = sub_1D55719D0();
  v17 = MEMORY[0x1E0DEB418];
  v16 = objc_msgSend(v15, (SEL)0x1F295BE65, 1.0 / sub_1D557C0AC((uint64_t)v43, MEMORY[0x1E0DEB418], v18));
  v1 = objc_msgSend((id)objc_opt_self(), sel_fractionalHeightDimension_, 1.0);
  v33 = sub_1D563C558(v16, v1);
  v42[6] = v33;
  sub_1D563C5B8();
  v2 = v33;
  v32 = sub_1D563C61C(v33);
  v42[5] = v32;
  v42[1] = 2.0;
  v42[2] = 2.0;
  v42[3] = 2.0;
  v42[4] = 2.0;
  objc_msgSend(v32, (SEL)0x1F27183C8, 2.0, 2.0, 2.0, 2.0);
  v20 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F295BE65, 1.0);
  v19 = (id)objc_opt_self();
  v42[0] = a1;
  v3 = objc_msgSend(v19, (SEL)0x1F295BE65, 1.0 / sub_1D557C0AC((uint64_t)v42, v17, v18));
  v41 = sub_1D563C558(v20, v3);
  v40 = objc_msgSend((id)objc_opt_self(), sel_horizontalGroupWithLayoutSize_subitem_count_, v41, v32, a1);
  v22 = objc_msgSend((id)objc_opt_self(), sel_fixedSpacing_, 2.0);
  objc_msgSend(v40, sel_setInterItemSpacing_);

  sub_1D563C66C();
  v4 = v40;
  v39 = sub_1D563C6D0(v40);
  v38 = *sub_1D5639EB0();
  objc_msgSend(v39, (SEL)0x1F27183C8, 2.0, *(double *)&v38, 2.0, *(double *)sub_1D5639EB0());
  objc_msgSend(v39, sel_setInterGroupSpacing_, 2.0);
  v24 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F295BE65, 1.0);
  v23 = (id)objc_opt_self();
  v5 = objc_msgSend(v23, (SEL)0x1F29AD8E3, *(double *)sub_1D5639FB0());
  v37 = sub_1D563C558(v24, v5);
  sub_1D563C720();
  v6 = v37;
  v7 = sub_1D565348C();
  v25 = *v7;
  v26 = v7[1];
  swift_bridgeObjectRetain();
  v36 = sub_1D563C784(v37, v25, v26, 1);
  v27 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F295BE65, 1.0);
  v8 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F29AD8E3, 1.0);
  v35 = sub_1D563C558(v27, v8);
  v9 = v35;
  v10 = sub_1D564A728();
  v28 = *v10;
  v29 = v10[1];
  swift_bridgeObjectRetain();
  v34 = sub_1D563C784(v35, v28, v29, 5);
  sub_1D566077C();
  v30 = v11;
  v12 = v36;
  *v30 = v36;
  v13 = v34;
  v30[1] = v34;
  sub_1D5571928();
  v31 = (id)sub_1D565FF84();
  swift_bridgeObjectRelease();
  objc_msgSend(v39, sel_setBoundarySupplementaryItems_, v31);

  return v39;
}

id static SearchCollectionViewLayoutFactory_iOS.photosSectionLayout(columns:)(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t *v11;
  id v12;
  id v13;
  uint64_t *v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  id v24;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  _QWORD v47[3];
  _QWORD v48[2];

  v48[1] = a1;
  sub_1D563C4F4();
  v19 = (id)objc_opt_self();
  v48[0] = a1;
  v22 = sub_1D55719D0();
  v21 = MEMORY[0x1E0DEB418];
  v20 = objc_msgSend(v19, (SEL)0x1F295BE65, 1.0 / sub_1D557C0AC((uint64_t)v48, MEMORY[0x1E0DEB418], v22));
  v1 = objc_msgSend((id)objc_opt_self(), sel_fractionalHeightDimension_, 1.0);
  v38 = sub_1D563C558(v20, v1);
  v47[2] = v38;
  sub_1D563C5B8();
  v2 = v38;
  v37 = sub_1D563C61C(v38);
  v47[1] = v37;
  v24 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F295BE65, 1.0);
  v23 = (id)objc_opt_self();
  v47[0] = a1;
  v3 = objc_msgSend(v23, (SEL)0x1F295BE65, 1.0 / sub_1D557C0AC((uint64_t)v47, v21, v22));
  v46 = sub_1D563C558(v24, v3);
  v45 = objc_msgSend((id)objc_opt_self(), sel_horizontalGroupWithLayoutSize_subitem_count_, v46, v37, a1);
  v26 = objc_msgSend((id)objc_opt_self(), sel_fixedSpacing_);
  objc_msgSend(v45, sel_setInterItemSpacing_);

  sub_1D563C66C();
  v4 = v45;
  v39 = sub_1D563C6D0(v45);
  v5 = v39;
  v6 = v39;
  v7 = v39;
  v8 = v39;
  v44 = *sub_1D5639EB0();
  objc_msgSend(v39, sel_setContentInsets_, 2.0, *(double *)&v44, 2.0, *(double *)sub_1D5639EB0());

  objc_msgSend(v39, sel_setInterGroupSpacing_, 2.0);
  v28 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F295BE65, 1.0);
  v27 = (id)objc_opt_self();
  v9 = objc_msgSend(v27, (SEL)0x1F29AD8E3, *(double *)sub_1D5639FB0());
  v43 = sub_1D563C558(v28, v9);
  sub_1D563C720();
  v10 = v43;
  v11 = sub_1D565348C();
  v29 = *v11;
  v30 = v11[1];
  swift_bridgeObjectRetain();
  v42 = sub_1D563C784(v43, v29, v30, 1);
  v32 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F295BE65, 1.0);
  v31 = (id)objc_opt_self();
  v12 = objc_msgSend(v31, (SEL)0x1F29AD8E3, *(double *)sub_1D5639FB0());
  v41 = sub_1D563C558(v32, v12);
  v13 = v41;
  v14 = sub_1D564A728();
  v33 = *v14;
  v34 = v14[1];
  swift_bridgeObjectRetain();
  v40 = sub_1D563C784(v41, v33, v34, 5);
  sub_1D566077C();
  v35 = v15;
  v16 = v42;
  *v35 = v42;
  v17 = v40;
  v35[1] = v40;
  sub_1D5571928();
  v36 = (void *)sub_1D565FF84();
  swift_bridgeObjectRelease();
  objc_msgSend(v39, sel_setBoundarySupplementaryItems_, v36);

  return v39;
}

uint64_t sub_1D563BCE0()
{
  return 0;
}

uint64_t static SearchCollectionViewLayoutFactory_iOS.recentSearchesSectionLayout(_:deletion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t);
  uint64_t (*v21)@<X0>(uint64_t@<X0>, uint64_t@<X1>, uint64_t@<X8>);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;

  v23 = a1;
  v18 = a2;
  v19 = a3;
  v20 = sub_1D563CAD4;
  v21 = sub_1D563CE2C;
  v34 = 0;
  v33 = 0;
  v31 = 0;
  v32 = 0;
  v30 = 0;
  v22 = 0;
  v14 = sub_1D565F1A4();
  v13 = *(_QWORD *)(v14 - 8);
  v12 = (*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v17 = (char *)&v11 - v12;
  v27 = sub_1D565F1D4();
  v24 = *(_QWORD *)(v27 - 8);
  v16 = *(_QWORD *)(v24 + 64);
  v15 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v17);
  v25 = (char *)&v11 - v15;
  v4 = MEMORY[0x1E0C80A78](v3);
  v26 = (char *)&v11 - v5;
  v34 = (char *)&v11 - v5;
  v33 = v23;
  v31 = v6;
  v32 = v19;
  (*(void (**)(double))(v7 + 104))(v4);
  sub_1D565F1B0();
  swift_retain();
  v8 = swift_allocObject();
  v9 = v19;
  *(_QWORD *)(v8 + 16) = v18;
  *(_QWORD *)(v8 + 24) = v9;
  sub_1D565F198();
  sub_1D565F1C8();
  sub_1D563C66C();
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v25, v26, v27);
  v29 = sub_1D56602E4();
  v28 = *(void (**)(char *, uint64_t))(v24 + 8);
  v28(v25, v27);
  v30 = v29;
  v28(v26, v27);
  return v29;
}

void *static SearchCollectionViewLayoutFactory_iOS.listSectionWithHeaderLayout(_:)(void *a1)
{
  char has_malloc_size;
  id v2;
  id v3;
  uint64_t *v4;
  _QWORD *v5;
  id v6;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;

  has_malloc_size = _swift_stdlib_has_malloc_size();
  v17 = (void *)static SearchCollectionViewLayoutFactory_iOS.listSectionLayout(_:showsSeparators:)(a1, has_malloc_size & 1);
  sub_1D563C4F4();
  v10 = objc_msgSend((id)objc_opt_self(), sel_fractionalWidthDimension_, 1.0);
  v9 = (id)objc_opt_self();
  v2 = objc_msgSend(v9, sel_estimatedDimension_, *(double *)sub_1D5639FB0());
  v16 = sub_1D563C558(v10, v2);
  sub_1D563C720();
  v3 = v16;
  v4 = sub_1D5655CE8();
  v11 = *v4;
  v12 = v4[1];
  swift_bridgeObjectRetain();
  v15 = sub_1D563C784(v16, v11, v12, 1);
  sub_1D566077C();
  v13 = v5;
  v6 = v15;
  *v13 = v15;
  sub_1D5571928();
  v14 = (void *)sub_1D565FF84();
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_setBoundarySupplementaryItems_, v14);

  return v17;
}

uint64_t static SearchCollectionViewLayoutFactory_iOS.listSectionLayout(_:showsSeparators:)(void *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  unint64_t v20;
  char *v21;
  id v22;
  id v23;
  unsigned int v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char *v28;

  v22 = a1;
  v15 = a2;
  v28 = 0;
  v27 = 0;
  v26 = 0;
  v25 = 0;
  v10 = 0;
  v11 = sub_1D565F1A4();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v14 = (char *)&v7 - v13;
  v16 = sub_1D565F1D4();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = (*(_QWORD *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v22);
  v19 = (char *)&v7 - v18;
  v20 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v3);
  v21 = (char *)&v7 - v20;
  v28 = (char *)&v7 - v20;
  v27 = v4;
  v26 = v5 & 1;
  swift_getObjectType();
  swift_unknownObjectRetain();
  v23 = objc_msgSend(v22, sel_traitCollection);
  swift_unknownObjectRelease();
  v24 = objc_msgSend(v23, sel_mf_useSplitViewStyling);

  if ((v24 & 1) != 0)
    (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E0DC2880], v11);
  else
    (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E0DC2890], v11);
  sub_1D565F1B0();
  sub_1D565F1BC();
  sub_1D563C66C();
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v19, v21, v16);
  v9 = sub_1D56602E4();
  v8 = *(void (**)(char *, uint64_t))(v17 + 8);
  v8(v19, v16);
  v25 = v9;
  v8(v21, v16);
  return v9;
}

uint64_t static SearchCollectionViewLayoutFactory_iOS.indexStatusSectionLayout(_:)(uint64_t a1)
{
  uint64_t v1;
  double v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;

  v13 = a1;
  v22 = 0;
  v21 = 0;
  v20 = 0;
  v12 = 0;
  v7 = sub_1D565F1A4();
  v6 = *(_QWORD *)(v7 - 8);
  v5 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v11 = (char *)&v5 - v5;
  v17 = sub_1D565F1D4();
  v14 = *(_QWORD *)(v17 - 8);
  v9 = *(_QWORD *)(v14 + 64);
  v8 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v5 - v8;
  v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x1E0C80A78](v1);
  v16 = (char *)&v5 - v10;
  v22 = (char *)&v5 - v10;
  v21 = v13;
  (*(void (**)(double))(v3 + 104))(v2);
  sub_1D565F1B0();
  sub_1D565F1BC();
  sub_1D563C66C();
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v15, v16, v17);
  v19 = sub_1D56602E4();
  v18 = *(void (**)(char *, uint64_t))(v14 + 8);
  v18(v15, v17);
  v20 = v19;
  v18(v16, v17);
  return v19;
}

unint64_t sub_1D563C4F4()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1ED9A9600;
  if (!qword_1ED9A9600)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1ED9A9600);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_1D563C558(void *a1, void *a2)
{
  id v5;

  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sizeWithWidthDimension_heightDimension_, a1, a2);

  return v5;
}

unint64_t sub_1D563C5B8()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1ED9A9B10;
  if (!qword_1ED9A9B10)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1ED9A9B10);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_1D563C61C(void *a1)
{
  id v3;

  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_itemWithLayoutSize_, a1);

  return v3;
}

unint64_t sub_1D563C66C()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1ED9A9658;
  if (!qword_1ED9A9658)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1ED9A9658);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_1D563C6D0(void *a1)
{
  id v3;

  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sectionWithGroup_, a1);

  return v3;
}

unint64_t sub_1D563C720()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1ED9A9748;
  if (!qword_1ED9A9748)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1ED9A9748);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_1D563C784(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6;
  id v8;

  v6 = (id)sub_1D565FDF8();
  v8 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_boundarySupplementaryItemWithLayoutSize_elementKind_alignment_, a1, v6, a4);

  swift_bridgeObjectRelease();
  return v8;
}

id sub_1D563C80C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  unint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  unint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v27 = a1;
  v29 = a2;
  v30 = a3;
  v48 = 0;
  v46 = 0;
  v47 = 0;
  v45 = 0;
  v38 = 0;
  v34 = sub_1D565EDFC();
  v31 = *(_QWORD *)(v34 - 8);
  v28 = *(_QWORD *)(v31 + 64);
  v19 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v33 = (char *)&v19 - v19;
  v48 = v3;
  v46 = v4;
  v47 = v5;
  v41 = sub_1D563CF98();
  v20 = 1;
  v22 = sub_1D565FE64();
  v26 = v6;
  v21 = sub_1D565FE64();
  v25 = v7;
  v24 = sub_1D556D374();
  sub_1D556D3A0();
  v23 = v8;
  v35 = sub_1D565EC34();
  v36 = v9;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_retain();
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v33, v27, v34);
  v32 = (*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  v10 = swift_allocObject();
  v11 = v30;
  v12 = v31;
  v13 = v32;
  v14 = v33;
  v15 = v34;
  v37 = v10;
  *(_QWORD *)(v10 + 16) = v29;
  *(_QWORD *)(v10 + 24) = v11;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v10 + v13, v14, v15);
  v39 = 1;
  v43 = sub_1D563CB98(1, v35, v36, (uint64_t)sub_1D563D088, v37);
  v45 = v43;
  sub_1D563D0EC();
  v42 = sub_1D566077C();
  v40 = v16;
  v17 = v43;
  *v40 = v43;
  sub_1D5571928();
  v44 = sub_1D563CDB4();

  return v44;
}

uint64_t sub_1D563CA98()
{
  swift_release();
  return swift_deallocObject();
}

id sub_1D563CAD4(uint64_t a1)
{
  uint64_t v1;

  return sub_1D563C80C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1D563CAE0(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4, uint64_t (*a5)(uint64_t), uint64_t a6, uint64_t a7)
{
  char v7;

  swift_retain();
  swift_retain();
  v7 = a5(a7);
  a3(v7 & 1);
  swift_release();
  return swift_release();
}

id sub_1D563CB98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t aBlock;
  int v14;
  int v15;
  uint64_t (*v16)(uint64_t, void *, void *, const void *);
  void *v17;
  uint64_t v18;
  uint64_t v19;

  if (a3)
  {
    v8 = sub_1D565FDF8();
    swift_bridgeObjectRelease();
    v9 = (void *)v8;
  }
  else
  {
    v9 = 0;
  }
  v18 = a4;
  v19 = a5;
  aBlock = MEMORY[0x1E0C809B0];
  v14 = 1107296256;
  v15 = 0;
  v16 = sub_1D563CCC8;
  v17 = &block_descriptor_6;
  v6 = _Block_copy(&aBlock);
  v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_contextualActionWithStyle_title_handler_, a1, v9, v6);
  _Block_release(v6);
  swift_release();

  return v7;
}

uint64_t sub_1D563CCC8(uint64_t a1, void *a2, void *a3, const void *a4)
{
  id v4;
  id v5;
  void *v8;
  void (*v9)(void *, void *, uint64_t (*)(char));

  v9 = *(void (**)(void *, void *, uint64_t (*)(char)))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = a3;
  v8 = _Block_copy(a4);
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  v9(a2, a3, sub_1D563D1E8);
  swift_release();

  return swift_release();
}

uint64_t sub_1D563CD90(char a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, a1 & 1);
}

id sub_1D563CDB4()
{
  id v1;
  id v2;

  sub_1D563CF98();
  v1 = (id)sub_1D565FF84();
  v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_configurationWithActions_, v1);

  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1D563CE2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;

  v8[0] = a3;
  v13 = a2;
  v20 = 0;
  v19 = 0;
  v18 = 0;
  v8[1] = 0;
  v9 = sub_1D565F180();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v12 = (char *)v8 - v11;
  v14 = sub_1D565F18C();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x1E0C80A78](v14);
  v17 = (char *)v8 - v16;
  v20 = (char *)v8 - v16;
  v19 = a1;
  v18 = v5;
  (*(void (**)(double))(v6 + 16))(v4);
  if (!sub_1D565EDF0())
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E0DC2518], v9);
    sub_1D565F174();
  }
  return (*(uint64_t (**)(_QWORD, char *, uint64_t))(v15 + 32))(v8[0], v17, v14);
}

ValueMetadata *type metadata accessor for SearchCollectionViewLayoutFactory_iOS()
{
  return &type metadata for SearchCollectionViewLayoutFactory_iOS;
}

unint64_t sub_1D563CF98()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1EFF3EC28;
  if (!qword_1EFF3EC28)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EFF3EC28);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1D563CFFC()
{
  uint64_t v0;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v4 = sub_1D565EDFC();
  v2 = *(_QWORD *)(v4 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v4);
  return swift_deallocObject();
}

uint64_t sub_1D563D088(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_1D565EDFC() - 8) + 80);
  return sub_1D563CAE0(a1, a2, a3, a4, *(uint64_t (**)(uint64_t))(v4 + 16), *(_QWORD *)(v4 + 24), v4 + ((v5 + 32) & ~v5));
}

unint64_t sub_1D563D0EC()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1EFF3EC30;
  if (!qword_1EFF3EC30)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EFF3EC30);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_1D563D1AC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1D563D1E8(char a1)
{
  uint64_t v1;

  return sub_1D563CD90(a1 & 1, *(_QWORD *)(v1 + 16));
}

void SearchItem.section.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD v2[4];
  uint64_t v3;
  unint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t EnumCaseMultiPayload;
  uint64_t v11;
  char *v12;

  v2[2] = a1;
  v11 = 0;
  v12 = 0;
  v2[3] = 0;
  v3 = type metadata accessor for SearchItem.LegacySuggested();
  v4 = (*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v5 = (char *)v2 - v4;
  v12 = (char *)v2 - v4;
  v8 = type metadata accessor for SearchItem();
  v7 = (*(_QWORD *)(*(_QWORD *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v2 - v7;
  v11 = v1;
  sub_1D55A4B7C();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  __asm { BR              X8 }
}

uint64_t sub_1D563D2F4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 - 48);
  **(_BYTE **)(v0 - 112) = 10;
  return sub_1D559D63C(v1);
}

uint64_t type metadata accessor for SearchItem()
{
  uint64_t v1;

  v1 = qword_1ED9A9010;
  if (!qword_1ED9A9010)
    return swift_getSingletonMetadata();
  return v1;
}

__n128 sub_1D563D51C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int *v3;
  __n128 result;

  v2 = sub_1D565EDB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(a2, a1);
  v3 = (int *)type metadata accessor for SearchItem.LegacySuggested();
  *(_QWORD *)(a2 + v3[5]) = *(_QWORD *)(a1 + v3[5]);
  *(_OWORD *)(a2 + v3[6]) = *(_OWORD *)(a1 + v3[6]);
  result = *(__n128 *)(a1 + v3[7]);
  *(__n128 *)(a2 + v3[7]) = result;
  *(_QWORD *)(a2 + v3[8]) = *(_QWORD *)(a1 + v3[8]);
  *(_BYTE *)(a2 + v3[9]) = *(_BYTE *)(a1 + v3[9]);
  return result;
}

uint64_t sub_1D563D5D0(uint64_t a1)
{
  uint64_t v1;

  v1 = sub_1D565EDB4();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(a1);

  swift_bridgeObjectRelease();
  return a1;
}

void SearchItem.id.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD v2[7];
  uint64_t v3;
  unint64_t v4;
  char *v5;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  char *v11;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t EnumCaseMultiPayload;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;

  v2[6] = a1;
  v32 = 0;
  v41 = 0;
  v40 = 0;
  v39 = 0;
  v31 = 0;
  v30 = 0;
  v38 = 0;
  v37 = 0;
  v36 = 0;
  v35 = 0;
  v34 = 0;
  v33 = 0;
  v21 = 0;
  v3 = type metadata accessor for SearchItem.Link();
  v4 = (*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v5 = (char *)v2 - v4;
  v41 = (char *)v2 - v4;
  v6 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SearchItem.InstantAnswer() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v21);
  v7 = (char *)v2 - v6;
  v40 = (char *)v2 - v6;
  v8 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SearchItem.TopHit() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v21);
  v9 = (char *)v2 - v8;
  v39 = (char *)v2 - v8;
  v10 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SearchItem.LegacySuggested() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v21);
  v11 = (char *)v2 - v10;
  v38 = (char *)v2 - v10;
  v12 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SearchItem.Document() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v21);
  v13 = (char *)v2 - v12;
  v37 = (char *)v2 - v12;
  v14 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SearchItem.Location() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v21);
  v15 = (char *)v2 - v14;
  v36 = (char *)v2 - v14;
  v16 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SearchItem.Photo() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v21);
  v17 = (char *)v2 - v16;
  v35 = (char *)v2 - v16;
  v18 = type metadata accessor for SearchItem.Contact();
  v19 = (*(_QWORD *)(*(_QWORD *)(v18 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v21);
  v20 = (char *)v2 - v19;
  v34 = (char *)v2 - v19;
  v22 = type metadata accessor for SearchItem.Generic();
  v23 = (*(_QWORD *)(*(_QWORD *)(v22 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v21);
  v24 = (char *)v2 - v23;
  v33 = (char *)v2 - v23;
  v27 = type metadata accessor for SearchItem();
  v26 = (*(_QWORD *)(*(_QWORD *)(v27 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = MEMORY[0x1E0C80A78](v25);
  v28 = (char *)v2 - v26;
  v32 = v1;
  sub_1D55A4B7C();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  __asm { BR              X8 }
}

uint64_t sub_1D563DA14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_1D559D950(*(_QWORD *)(v0 - 128), *(_QWORD *)(v0 - 160));
  v1 = *(_QWORD *)(v0 - 176);
  v2 = *(_QWORD *)(v0 - 160);
  *(_QWORD *)(v0 - 88) = v2;
  *(_QWORD *)(v0 - 344) = v2 + *(int *)(v1 + 24);
  v3 = sub_1D565EDB4();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v3 - 8) + 16))(*(_QWORD *)(v0 - 336), *(_QWORD *)(v0 - 344));
  return sub_1D559D63C(*(_QWORD *)(v0 - 160));
}

__n128 sub_1D563DE0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __n128 result;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *__dst;
  void *__src;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(void);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  int *v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  unsigned int (*v33)(void);

  v2 = sub_1D565EDB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(a2, a1);
  v28 = (int *)type metadata accessor for SearchItem.InstantAnswer();
  *(_QWORD *)(a2 + v28[5]) = *(_QWORD *)(a1 + v28[5]);
  *(_OWORD *)(a2 + v28[6]) = *(_OWORD *)(a1 + v28[6]);
  *(_OWORD *)(a2 + v28[7]) = *(_OWORD *)(a1 + v28[7]);
  *(_OWORD *)(a2 + v28[8]) = *(_OWORD *)(a1 + v28[8]);
  v23 = v28[9];
  v25 = sub_1D565EBC8();
  v24 = *(_QWORD *)(v25 - 8);
  v26 = *(void (**)(uint64_t, uint64_t))(v24 + 32);
  v26(a2 + v23, a1 + v23);
  ((void (*)(uint64_t, uint64_t, uint64_t))v26)(a2 + v28[10], a1 + v28[10], v25);
  *(_OWORD *)(a2 + v28[11]) = *(_OWORD *)(a1 + v28[11]);
  v29 = v28[12];
  v31 = sub_1D565ED18();
  v32 = *(_QWORD *)(v31 - 8);
  v33 = *(unsigned int (**)(void))(v32 + 48);
  if (((unsigned int (*)(uint64_t, uint64_t))v33)(a1 + v29, 1))
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3D238);
    memcpy((void *)(a2 + v29), (const void *)(a1 + v29), *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v32 + 32))();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v32 + 56))(a2 + v29, 0, 1, v31);
  }
  __dst = (void *)(a2 + v28[13]);
  __src = (void *)(a1 + v28[13]);
  v20 = sub_1D565EDE4();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(unsigned int (**)(void))(v21 + 48);
  if (((unsigned int (*)(void *, uint64_t))v22)(__src, 1))
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3D240);
    memcpy(__dst, __src, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v21 + 32))(__dst, __src, v20);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 1, v20);
  }
  v16 = (void *)(a2 + v28[14]);
  v17 = (void *)(a1 + v28[14]);
  if (v22())
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3D240);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v21 + 32))(v16, v17, v20);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v16, 0, 1, v20);
  }
  v14 = (void *)(a2 + v28[15]);
  v15 = (void *)(a1 + v28[15]);
  if (v33())
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3D238);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v32 + 32))(v14, v15, v31);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v14, 0, 1, v31);
  }
  *(_OWORD *)(a2 + v28[16]) = *(_OWORD *)(a1 + v28[16]);
  *(_OWORD *)(a2 + v28[17]) = *(_OWORD *)(a1 + v28[17]);
  *(_OWORD *)(a2 + v28[18]) = *(_OWORD *)(a1 + v28[18]);
  *(_OWORD *)(a2 + v28[19]) = *(_OWORD *)(a1 + v28[19]);
  ((void (*)(uint64_t, uint64_t, uint64_t))v26)(a2 + v28[20], a1 + v28[20], v25);
  v12 = (void *)(a2 + v28[21]);
  v13 = (void *)(a1 + v28[21]);
  if ((*(unsigned int (**)(void))(v24 + 48))())
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3D248);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    ((void (*)(void *, void *, uint64_t))v26)(v12, v13, v25);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v12, 0, 1, v25);
  }
  v10 = (void *)(a2 + v28[22]);
  v11 = (void *)(a1 + v28[22]);
  if (v22())
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3D240);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v21 + 32))(v10, v11, v20);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v10, 0, 1, v20);
  }
  *(_OWORD *)(a2 + v28[23]) = *(_OWORD *)(a1 + v28[23]);
  *(_OWORD *)(a2 + v28[24]) = *(_OWORD *)(a1 + v28[24]);
  *(_OWORD *)(a2 + v28[25]) = *(_OWORD *)(a1 + v28[25]);
  result = *(__n128 *)(a1 + v28[26]);
  *(__n128 *)(a2 + v28[26]) = result;
  return result;
}

uint64_t sub_1D563E410(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = sub_1D565EDB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(a2, a1);
  v3 = type metadata accessor for SearchItem.TopHit();
  result = a2;
  *(_QWORD *)(a2 + *(int *)(v3 + 20)) = *(_QWORD *)(a1 + *(int *)(v3 + 20));
  *(_QWORD *)(a2 + *(int *)(v3 + 24)) = *(_QWORD *)(a1 + *(int *)(v3 + 24));
  return result;
}

__n128 sub_1D563E488(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int *v3;
  __n128 result;

  v2 = sub_1D565EDB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(a2, a1);
  v3 = (int *)type metadata accessor for SearchItem.Photo();
  *(_OWORD *)(a2 + v3[5]) = *(_OWORD *)(a1 + v3[5]);
  result = *(__n128 *)(a1 + v3[6]);
  *(__n128 *)(a2 + v3[6]) = result;
  *(_QWORD *)(a2 + v3[7]) = *(_QWORD *)(a1 + v3[7]);
  *(_QWORD *)(a2 + v3[8]) = *(_QWORD *)(a1 + v3[8]);
  return result;
}

uint64_t SearchItem.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a1;
  v11 = 0;
  v10 = 0;
  v9 = sub_1D565EDB4();
  v7 = *(_QWORD *)(v9 - 8);
  v5 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v4 - v5;
  v11 = v2;
  v10 = v1;
  SearchItem.id.getter((uint64_t)&v4 - v5);
  sub_1D565ED9C();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v8, v9);
}

void static SearchItem.== infix(_:_:)(uint64_t a1, uint64_t a2)
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
  unint64_t v39;
  char *v40;
  unint64_t v41;
  char *v42;
  unint64_t v43;
  char *v44;
  unint64_t v45;
  char *v46;
  unint64_t v47;
  char *v48;
  unint64_t v49;
  char *v50;
  unint64_t v51;
  char *v52;
  unint64_t v53;
  char *v54;
  unint64_t v55;
  char *v56;
  unint64_t v57;
  char *v58;
  unint64_t v59;
  char *v60;
  unint64_t v61;
  char *v62;
  unint64_t v63;
  char *v64;
  unint64_t v65;
  char *v66;
  unint64_t v67;
  char *v68;
  unint64_t v69;
  char *v70;
  unint64_t v71;
  char *v72;
  unint64_t v73;
  char *v74;
  unint64_t v75;
  char *v76;
  unint64_t v77;
  char *v78;
  unint64_t v79;
  char *v80;
  unint64_t v81;
  char *v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char *v87;
  unint64_t v88;
  char *v89;
  unint64_t v90;
  char *v91;
  unint64_t v92;
  char *v93;
  unint64_t v94;
  char *v95;
  unint64_t v96;
  char *v97;
  unint64_t v98;
  char *v99;
  unint64_t v100;
  char *v101;
  unint64_t v102;
  char *v103;
  unint64_t v104;
  char *v105;
  unint64_t v106;
  char *v107;
  unint64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t EnumCaseMultiPayload;
  uint64_t v120;
  uint64_t v121;

  v85 = a1;
  v111 = a2;
  v121 = 0;
  v120 = 0;
  v83 = 0;
  v39 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SearchItem.Link() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v40 = (char *)&v38 - v39;
  v41 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v3);
  v42 = (char *)&v38 - v41;
  v43 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SearchItem.InstantAnswer() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v83);
  v44 = (char *)&v38 - v43;
  v45 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v5);
  v46 = (char *)&v38 - v45;
  v47 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SearchItem.TopHit() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v83);
  v48 = (char *)&v38 - v47;
  v49 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v7);
  v50 = (char *)&v38 - v49;
  v51 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SearchItem.LegacySuggested() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v83);
  v52 = (char *)&v38 - v51;
  v53 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v9);
  v54 = (char *)&v38 - v53;
  v55 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SearchItem.Document() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v83);
  v56 = (char *)&v38 - v55;
  v57 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v11);
  v58 = (char *)&v38 - v57;
  v59 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SearchItem.Location() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v83);
  v60 = (char *)&v38 - v59;
  v61 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v13);
  v62 = (char *)&v38 - v61;
  v63 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SearchItem.Photo() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v83);
  v64 = (char *)&v38 - v63;
  v65 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v15);
  v66 = (char *)&v38 - v65;
  v67 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SearchItem.Contact() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v83);
  v68 = (char *)&v38 - v67;
  v69 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v17);
  v70 = (char *)&v38 - v69;
  v18 = type metadata accessor for SearchItem.Generic();
  v71 = (*(_QWORD *)(*(_QWORD *)(v18 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v18);
  v72 = (char *)&v38 - v71;
  v73 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78]((char *)&v38 - v71);
  v74 = (char *)&v38 - v73;
  v75 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78]((char *)&v38 - v73);
  v76 = (char *)&v38 - v75;
  v77 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78]((char *)&v38 - v75);
  v78 = (char *)&v38 - v77;
  v79 = (v22 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78]((char *)&v38 - v77);
  v80 = (char *)&v38 - v79;
  v81 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78]((char *)&v38 - v79);
  v82 = (char *)&v38 - v81;
  v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A90C0);
  v84 = (*(_QWORD *)(*(_QWORD *)(v115 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v83);
  v117 = (char *)&v38 - v84;
  v116 = type metadata accessor for SearchItem();
  v109 = *(_QWORD *)(*(_QWORD *)(v116 - 8) + 64);
  v86 = (v109 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v85);
  v87 = (char *)&v38 - v86;
  v88 = (v109 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v24);
  v89 = (char *)&v38 - v88;
  v90 = (v109 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v25);
  v91 = (char *)&v38 - v90;
  v92 = (v109 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v26);
  v93 = (char *)&v38 - v92;
  v94 = (v109 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v27);
  v95 = (char *)&v38 - v94;
  v96 = (v109 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v28);
  v97 = (char *)&v38 - v96;
  v98 = (v109 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v29);
  v99 = (char *)&v38 - v98;
  v100 = (v109 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v30);
  v101 = (char *)&v38 - v100;
  v102 = (v109 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v31);
  v103 = (char *)&v38 - v102;
  v104 = (v109 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v32);
  v105 = (char *)&v38 - v104;
  v106 = (v109 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v33);
  v107 = (char *)&v38 - v106;
  v108 = (v109 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v34);
  v114 = (char *)&v38 - v108;
  v110 = (v109 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v35);
  v112 = (char *)&v38 - v110;
  v121 = v36;
  v120 = v37;
  sub_1D55A4B7C();
  sub_1D55A4B7C();
  v113 = *(int *)(v115 + 48);
  sub_1D55B27F0();
  sub_1D55B27F0();
  v118 = *(int *)(v115 + 48);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  __asm { BR              X8 }
}

uint64_t sub_1D563EFBC()
{
  uint64_t v0;

  sub_1D55A4B7C();
  if (swift_getEnumCaseMultiPayload())
  {
    sub_1D559D63C(*(_QWORD *)(v0 - 136));
    sub_1D563F9E0(*(_QWORD *)(v0 - 56));
    *(_DWORD *)(v0 - 684) = 0;
  }
  else
  {
    sub_1D559D950(*(_QWORD *)(v0 - 136), *(_QWORD *)(v0 - 336));
    sub_1D559D950(*(_QWORD *)(v0 - 56) + *(_QWORD *)(v0 - 48), *(_QWORD *)(v0 - 352));
    if (static SearchItem.Generic.== infix(_:_:)(*(_QWORD *)(v0 - 336), *(_QWORD **)(v0 - 352)))
    {
      sub_1D559D63C(*(_QWORD *)(v0 - 352));
      sub_1D559D63C(*(_QWORD *)(v0 - 336));
      sub_1D55A6130(*(_QWORD *)(v0 - 56));
      *(_DWORD *)(v0 - 684) = 1;
    }
    else
    {
      sub_1D559D63C(*(_QWORD *)(v0 - 352));
      sub_1D559D63C(*(_QWORD *)(v0 - 336));
      sub_1D55A6130(*(_QWORD *)(v0 - 56));
      *(_DWORD *)(v0 - 684) = 0;
    }
  }
  return *(_DWORD *)(v0 - 684) & 1;
}

uint64_t sub_1D563F9E0(uint64_t a1)
{
  unint64_t v2;
  unint64_t EnumCaseMultiPayload;

  type metadata accessor for SearchItem();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload <= 0xA)
    __asm { BR              X8 }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A90C0);
  v2 = swift_getEnumCaseMultiPayload();
  if (v2 <= 0xA)
    __asm { BR              X8 }
  return a1;
}

uint64_t SearchItem.hashValue.getter()
{
  type metadata accessor for SearchItem();
  sub_1D5640EB0();
  return sub_1D5660560();
}

unint64_t sub_1D5640EB0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1ED9A9000;
  if (!qword_1ED9A9000)
  {
    v0 = type metadata accessor for SearchItem();
    v1 = MEMORY[0x1D82763B0](&protocol conformance descriptor for SearchItem, v0);
    atomic_store(v1, (unint64_t *)&qword_1ED9A9000);
    return v1;
  }
  return v3;
}

uint64_t sub_1D5640F20()
{
  return SearchItem.hashValue.getter();
}

uint64_t sub_1D5640F34(uint64_t a1)
{
  return SearchItem.hash(into:)(a1);
}

uint64_t sub_1D5640F48(uint64_t a1, uint64_t a2)
{
  char v2;

  static SearchItem.== infix(_:_:)(a1, a2);
  return v2 & 1;
}

void SearchItem.accessibilityDescription.getter()
{
  uint64_t v0;
  _BYTE v1[392];
  unint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t EnumCaseMultiPayload;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;

  v14 = 0;
  v13 = 0;
  v16 = 0;
  v15 = 0;
  v4 = 0;
  v2 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SearchItem.Generic() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v3 = &v1[-v2];
  v16 = &v1[-v2];
  v5 = type metadata accessor for SearchItem.LegacySuggested();
  v6 = (*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v4);
  v7 = &v1[-v6];
  v15 = &v1[-v6];
  v10 = type metadata accessor for SearchItem();
  v9 = (*(_QWORD *)(*(_QWORD *)(v10 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v8);
  v11 = &v1[-v9];
  v14 = v0;
  sub_1D55A4B7C();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  __asm { BR              X8 }
}

uint64_t sub_1D56410B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = sub_1D565FE64();
  v2 = *(_QWORD *)(v0 - 128);
  *(_QWORD *)(v0 - 224) = v1;
  *(_QWORD *)(v0 - 232) = v3;
  sub_1D558ADFC(v2);
  v4 = *(_QWORD *)(v0 - 232);
  *(_QWORD *)(v0 - 216) = *(_QWORD *)(v0 - 224);
  *(_QWORD *)(v0 - 208) = v4;
  return *(_QWORD *)(v0 - 216);
}

void sub_1D5641820(uint64_t a1@<X8>)
{
  SearchItem.id.getter(a1);
}

unint64_t sub_1D5641834()
{
  return sub_1D5641848();
}

unint64_t sub_1D5641848()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1ED9A9008;
  if (!qword_1ED9A9008)
  {
    v0 = type metadata accessor for SearchItem();
    v1 = MEMORY[0x1D82763B0](&protocol conformance descriptor for SearchItem, v0);
    atomic_store(v1, (unint64_t *)&qword_1ED9A9008);
    return v1;
  }
  return v3;
}

uint64_t dispatch thunk of ListSearchItem.count.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ListSearchItem.count.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ListSearchItem.count.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ListSearchItem.image.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ListSearchItem.title.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ListSearchItem.title.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of ListSearchItem.title.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

unint64_t initializeBufferWithCopyOfBuffer for SearchItem(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  char *v3;
  uint64_t v5;
  int v7;

  v7 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v7 & 0x20000) == 0)
  {
    v3 = (char *)&loc_1D56419F8 + dword_1D5642F44[swift_getEnumCaseMultiPayload()];
    __asm { BR              X8 }
  }
  v5 = *a2;
  swift_retain();
  *a1 = v5;
  return *a1 + ((v7 + 16) & ~(unint64_t)v7);
}

uint64_t destroy for SearchItem()
{
  uint64_t result;

  result = swift_getEnumCaseMultiPayload();
  if (result <= 0xAuLL)
    __asm { BR              X8 }
  return result;
}

void initializeWithCopy for SearchItem()
{
  char *v0;

  v0 = (char *)&loc_1D56439EC + dword_1D5644F2C[swift_getEnumCaseMultiPayload()];
  __asm { BR              X8 }
}

uint64_t sub_1D56439FC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;

  v1 = *(_QWORD **)(v0 - 40);
  **(_QWORD **)(v0 - 48) = *v1;
  *(_QWORD *)(v0 - 168) = v1[1];
  swift_bridgeObjectRetain();
  v2 = *(_QWORD *)(v0 - 40);
  v3 = *(_QWORD *)(v0 - 48);
  *(_QWORD *)(v3 + 8) = *(_QWORD *)(v0 - 168);
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v0 - 160) = 0;
  v4 = type metadata accessor for SearchItem.Generic();
  v5 = *(_QWORD *)(v0 - 40);
  v6 = *(_QWORD *)(v0 - 48);
  *(_QWORD *)(v0 - 88) = v4;
  *(_QWORD *)(v0 - 144) = v6 + *(int *)(v4 + 24);
  *(_QWORD *)(v0 - 152) = v5 + *(int *)(v4 + 24);
  v7 = sub_1D565EDB4();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v7 - 8) + 16))(*(_QWORD *)(v0 - 144), *(_QWORD *)(v0 - 152));
  v8 = *(_QWORD *)(v0 - 40);
  v9 = *(_QWORD *)(v0 - 88);
  *(_QWORD *)(v0 - 136) = *(int *)(v9 + 28);
  v10 = *(void **)(v8 + *(int *)(v9 + 28));
  *(_QWORD *)(v0 - 128) = v10;
  v11 = v10;
  v12 = *(_QWORD *)(v0 - 40);
  v13 = *(_QWORD *)(v0 - 88);
  *(_QWORD *)(*(_QWORD *)(v0 - 48) + *(_QWORD *)(v0 - 136)) = *(_QWORD *)(v0 - 128);
  *(_QWORD *)(v0 - 120) = *(int *)(v13 + 32);
  v14 = *(void **)(v12 + *(int *)(v13 + 32));
  *(_QWORD *)(v0 - 112) = v14;
  v15 = v14;
  v16 = *(_QWORD *)(v0 - 40);
  v17 = *(_QWORD *)(v0 - 88);
  *(_QWORD *)(*(_QWORD *)(v0 - 48) + *(_QWORD *)(v0 - 120)) = *(_QWORD *)(v0 - 112);
  *(_QWORD *)(v0 - 104) = *(int *)(v17 + 36);
  v18 = *(void **)(v16 + *(int *)(v17 + 36));
  *(_QWORD *)(v0 - 96) = v18;
  v19 = v18;
  v20 = *(_QWORD *)(v0 - 40);
  v21 = *(_QWORD *)(v0 - 48);
  v22 = *(_QWORD *)(v0 - 88);
  *(_QWORD *)(v21 + *(_QWORD *)(v0 - 104)) = *(_QWORD *)(v0 - 96);
  v23 = (_QWORD *)(v21 + *(int *)(v22 + 40));
  *(_QWORD *)(v0 - 80) = v23;
  v24 = (_QWORD *)(v20 + *(int *)(v22 + 40));
  *v23 = *v24;
  *(_QWORD *)(v0 - 72) = v24[1];
  swift_bridgeObjectRetain();
  v25 = *(_QWORD *)(v0 - 88);
  v26 = *(_QWORD *)(v0 - 40);
  v27 = *(_QWORD *)(v0 - 48);
  *(_QWORD *)(*(_QWORD *)(v0 - 80) + 8) = *(_QWORD *)(v0 - 72);
  *(_BYTE *)(v27 + *(int *)(v25 + 44)) = *(_BYTE *)(v26 + *(int *)(v25 + 44));
  v28 = (_QWORD *)(v27 + *(int *)(v25 + 48));
  *(_QWORD *)(v0 - 64) = v28;
  v29 = (_QWORD *)(v26 + *(int *)(v25 + 48));
  *v28 = *v29;
  *(_QWORD *)(v0 - 56) = v29[1];
  swift_bridgeObjectRetain();
  *(_QWORD *)(*(_QWORD *)(v0 - 64) + 8) = *(_QWORD *)(v0 - 56);
  swift_storeEnumTagMultiPayload();
  return *(_QWORD *)(v0 - 48);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> assignWithCopy for SearchItem(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;

  if (a1 != a2)
  {
    sub_1D55A6130(v3);
    v2 = (char *)&loc_1D5644FB0 + dword_1D56464F4[swift_getEnumCaseMultiPayload()];
    __asm { BR              X8 }
  }
}

void initializeWithTake for SearchItem()
{
  char *v0;

  v0 = (char *)&loc_1D5646560 + *((int *)qword_1D56472A8 + swift_getEnumCaseMultiPayload());
  __asm { BR              X8 }
}

uint64_t sub_1D5646570()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 - 48);
  v2 = *(_QWORD *)(v0 - 40);
  *(_OWORD *)v1 = *(_OWORD *)v2;
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v0 - 80) = 0;
  v3 = type metadata accessor for SearchItem.Generic();
  v4 = *(_QWORD *)(v0 - 40);
  v5 = *(_QWORD *)(v0 - 48);
  *(_QWORD *)(v0 - 56) = v3;
  *(_QWORD *)(v0 - 64) = v5 + *(int *)(v3 + 24);
  *(_QWORD *)(v0 - 72) = v4 + *(int *)(v3 + 24);
  v6 = sub_1D565EDB4();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v6 - 8) + 32))(*(_QWORD *)(v0 - 64), *(_QWORD *)(v0 - 72));
  v7 = *(int **)(v0 - 56);
  v8 = *(_QWORD *)(v0 - 40);
  v9 = *(_QWORD *)(v0 - 48);
  *(_QWORD *)(v9 + v7[7]) = *(_QWORD *)(v8 + v7[7]);
  *(_QWORD *)(v9 + v7[8]) = *(_QWORD *)(v8 + v7[8]);
  *(_QWORD *)(v9 + v7[9]) = *(_QWORD *)(v8 + v7[9]);
  *(_OWORD *)(v9 + v7[10]) = *(_OWORD *)(v8 + v7[10]);
  *(_BYTE *)(v9 + v7[11]) = *(_BYTE *)(v8 + v7[11]);
  *(_OWORD *)(v9 + v7[12]) = *(_OWORD *)(v8 + v7[12]);
  swift_storeEnumTagMultiPayload();
  return *(_QWORD *)(v0 - 48);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> assignWithTake for SearchItem(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;

  if (a1 != a2)
  {
    sub_1D55A6130(v3);
    v2 = (char *)&loc_1D564732C + *((int *)qword_1D5648078 + swift_getEnumCaseMultiPayload());
    __asm { BR              X8 }
  }
}

uint64_t sub_1D56480A4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v10 = type metadata accessor for SearchItem.Generic();
  if (v0 <= 0x3F)
  {
    v10 = type metadata accessor for SearchItem.Contact();
    if (v1 <= 0x3F)
    {
      v10 = type metadata accessor for SearchItem.Photo();
      if (v2 <= 0x3F)
      {
        v10 = type metadata accessor for SearchItem.Location();
        if (v3 <= 0x3F)
        {
          v10 = type metadata accessor for SearchItem.Document();
          if (v4 <= 0x3F)
          {
            v10 = type metadata accessor for SearchItem.LegacySuggested();
            if (v5 <= 0x3F)
            {
              v10 = type metadata accessor for SearchItem.TopHit();
              if (v6 <= 0x3F)
              {
                v10 = type metadata accessor for SearchItem.InstantAnswer();
                if (v7 <= 0x3F)
                {
                  v10 = type metadata accessor for SearchItem.Link();
                  if (v8 <= 0x3F)
                  {
                    swift_initEnumMetadataMultiPayload();
                    return 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v10;
}

double sub_1D5648348()
{
  double result;

  qword_1ED9AA020 = 12.0;
  result = 16.0;
  qword_1ED9AA028 = 16.0;
  qword_1ED9AA030 = 6.0;
  qword_1ED9AA038 = 16.0;
  return result;
}

uint64_t *sub_1D5648374()
{
  if (qword_1ED9A9BB8 != -1)
    swift_once();
  return &qword_1ED9AA020;
}

void *sub_1D56483C8()
{
  return &unk_1D5674300;
}

void *sub_1D56483D4()
{
  return &unk_1D5674308;
}

void *sub_1D56483E0()
{
  return &unk_1D5674310;
}

uint64_t sub_1D56483EC(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
  }
  return 4;
}

void sub_1D56484A8(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_1D56484E0()
{
  return 0;
}

uint64_t sub_1D564852C()
{
  sub_1D5648574();
  return sub_1D56607A0() & 1;
}

unint64_t sub_1D5648574()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3EC38;
  if (!qword_1EFF3EC38)
  {
    v0 = MEMORY[0x1D82763B0](&unk_1D5674490, &unk_1E99E9C90);
    atomic_store(v0, (unint64_t *)&qword_1EFF3EC38);
    return v0;
  }
  return v2;
}

uint64_t sub_1D56485E0()
{
  sub_1D5648574();
  return sub_1D565FF60();
}

uint64_t sub_1D564861C()
{
  sub_1D5648574();
  return sub_1D565FF78();
}

uint64_t sub_1D5648660()
{
  sub_1D5648574();
  return sub_1D565FF6C();
}

uint64_t sub_1D56486A4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_1D56483EC(*a1);
  *a2 = result;
  return result;
}

void sub_1D56486D0(_QWORD *a1@<X8>)
{
  char *v1;
  uint64_t v2;

  sub_1D56484A8(*v1);
  *a1 = v2;
}

uint64_t sub_1D56486FC()
{
  uint64_t v0;
  id v1;
  float v2;
  float v4;
  id v5;
  float v6;
  float v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  float v12;

  v10 = OBJC_IVAR____TtC6MailUI19SearchPreparingView_indexStatus;
  v11 = (_QWORD *)(v0 + OBJC_IVAR____TtC6MailUI19SearchPreparingView_indexStatus);
  swift_beginAccess();
  if (*v11)
  {
    v5 = *(id *)(v9 + v10);
    v1 = v5;
    swift_endAccess();
    objc_msgSend(v5, sel_progress);
    v6 = v2;

    v7 = v6;
    v8 = 0;
  }
  else
  {
    swift_endAccess();
    v7 = 0.0;
    v8 = 1;
  }
  if ((v8 & 1) != 0)
    v12 = 0.0;
  else
    v12 = v7;
  v4 = v12 * 100.0;
  if ((COERCE_UNSIGNED_INT(v12 * 100.0) >> 23) == 255)
  {
    sub_1D5660620();
    __break(1u);
  }
  if (v4 <= -9.2234e18)
  {
    sub_1D5660620();
    __break(1u);
  }
  if (v4 >= 9.2234e18)
  {
    sub_1D5660620();
    __break(1u);
  }
  return sub_1D565FED0();
}

uint64_t sub_1D56489C4()
{
  uint64_t v0;
  id v1;
  unsigned __int8 v2;
  BOOL v4;
  id v5;
  id v8;
  id *v9;
  id v10;

  v9 = (id *)(v0 + OBJC_IVAR____TtC6MailUI19SearchPreparingView_indexStatus);
  swift_beginAccess();
  v10 = *v9;
  v1 = *v9;
  swift_endAccess();
  if (!v10)
    return 3;
  v2 = objc_msgSend(v10, sel_isVisible);
  if ((v2 & 1) == 0)
  {

    return 3;
  }
  v8 = objc_msgSend(v10, sel_messagesInLargestRemoteAccount);
  if ((uint64_t)v8 < 0 || (unint64_t)v8 < 0x186A0)
  {

    return 0;
  }
  else
  {
    v5 = objc_msgSend(v10, sel_messagesInLargestRemoteAccount);
    v4 = (uint64_t)v5 < 0 || (unint64_t)v5 < 0x7A120;

    if (v4)
      return 1;
    else
      return 2;
  }
}

void sub_1D5648B74()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v4 = *(id *)(v0 + OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel);
  v1 = v4;
  sub_1D565FE64();
  v3 = (id)sub_1D565FDF8();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, (SEL)0x1F2BB17C8, v3);

  v6 = *(void **)(v0 + OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel);
  v2 = v6;
  sub_1D565FE64();
  v5 = (void *)sub_1D565FDF8();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, (SEL)0x1F2BB17C8, v5);

}

void sub_1D5648C74()
{
  char *v0;

  sub_1D565FE64();
  sub_1D565FE64();
  sub_1D565FE64();
  v0 = (char *)&loc_1D5648D78 + dword_1D5649904[sub_1D56489C4()];
  __asm { BR              X8 }
}

uint64_t sub_1D5648D88()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  char wapiCapability;

  v1 = *(void **)(*(_QWORD *)(v0 - 168) + OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel);
  *(_QWORD *)(v0 - 192) = v1;
  v2 = v1;
  *(_QWORD *)(v0 - 248) = sub_1D565FE64();
  *(_QWORD *)(v0 - 224) = v3;
  *(_QWORD *)(v0 - 232) = sub_1D556D374();
  sub_1D556D3A0();
  v4 = *(_QWORD *)(v0 - 128);
  *(_QWORD *)(v0 - 240) = v5;
  v13 = v4;
  *(_QWORD *)(v0 - 216) = sub_1D565EC34();
  *(_QWORD *)(v0 - 208) = v6;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 - 200) = sub_1D565FDF8();
  swift_bridgeObjectRelease();
  objc_msgSend(*(id *)(v0 - 192), sel_setText_, *(_QWORD *)(v0 - 200), v13);

  v7 = *(void **)(*(_QWORD *)(v0 - 168) + OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel);
  *(_QWORD *)(v0 - 184) = v7;
  v8 = v7;
  v9 = (id)MobileGestalt_get_current_device();
  *(_QWORD *)(v0 - 176) = v9;
  if (v9)
  {
    *(_QWORD *)(v0 - 256) = *(_QWORD *)(v0 - 176);
  }
  else
  {
    sub_1D5660620();
    __break(1u);
  }
  v28 = *(void **)(v0 - 256);
  wapiCapability = MobileGestalt_get_wapiCapability();

  if ((wapiCapability & 1) != 0)
  {
    v25 = (void *)objc_opt_self();
    sub_1D565FE64();
    v26 = (void *)sub_1D565FDF8();
    swift_bridgeObjectRelease();
    v27 = objc_msgSend(v25, sel_modelSpecificLocalizedStringKeyForKey_, v26);

    if (v27)
    {
      sub_1D565FE10();
      v23 = v10;

      v24 = v23;
    }
    else
    {
      v24 = 0;
    }
    if (!v24)
    {
      sub_1D5660620();
      __break(1u);
    }
    v22 = sub_1D556D374();
    sub_1D556D3A0();
    v14 = *(_QWORD *)(v0 - 104);
    sub_1D565EC34();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
  else
  {
    v19 = (void *)objc_opt_self();
    sub_1D565FE64();
    v20 = (void *)sub_1D565FDF8();
    swift_bridgeObjectRelease();
    v21 = objc_msgSend(v19, sel_modelSpecificLocalizedStringKeyForKey_, v20);

    if (v21)
    {
      sub_1D565FE10();
      v17 = v11;

      v18 = v17;
    }
    else
    {
      v18 = 0;
    }
    if (!v18)
    {
      sub_1D5660620();
      __break(1u);
    }
    v16 = sub_1D556D374();
    sub_1D556D3A0();
    v14 = *(_QWORD *)(v0 - 88);
    sub_1D565EC34();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
  v15 = (void *)sub_1D565FDF8();
  swift_bridgeObjectRelease();
  objc_msgSend(*(id *)(v0 - 184), sel_setText_, v15, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1D5649914(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void **v4;

  v2 = a1;
  v4 = (void **)(v1 + OBJC_IVAR____TtC6MailUI19SearchPreparingView_indexStatus);
  swift_beginAccess();
  v3 = *v4;
  *v4 = a1;

  swift_endAccess();
  sub_1D5648C74();
}

id sub_1D56499E0(double a1, double a2, double a3, double a4)
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  objc_class *ObjectType;
  __int128 v17;
  __int128 v18;
  id v19;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  id v23;

  *(double *)&v17 = a1;
  *((double *)&v17 + 1) = a2;
  *(double *)&v18 = a3;
  *((double *)&v18 + 1) = a4;
  ObjectType = (objc_class *)swift_getObjectType();
  v21 = v17;
  v22 = v18;
  v5 = v4;
  v6 = v4;
  v7 = v4;
  v8 = v4;
  v23 = v4;
  v12 = OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView;
  sub_1D55E336C();
  *(_QWORD *)&v15[v12] = sub_1D556CE74();

  v13 = OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel;
  sub_1D559C8F0();
  *(_QWORD *)&v15[v13] = sub_1D556CE74();

  v14 = OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel;
  *(_QWORD *)&v15[v14] = sub_1D556CE74();

  *(_QWORD *)&v15[OBJC_IVAR____TtC6MailUI19SearchPreparingView_indexStatus] = 0;
  v20.receiver = v23;
  v20.super_class = ObjectType;
  v19 = objc_msgSendSuper2(&v20, sel_initWithFrame_, v17, v18);
  v9 = v19;
  v10 = v19;
  v23 = v19;
  sub_1D5649BA4();

  return v19;
}

void sub_1D5649BA4()
{
  char *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  id v21;
  char *v22;
  id v23;
  char *v24;
  id v25;
  char *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
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
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  _QWORD *v71;
  void *v72;
  void *v73;

  v30 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel];
  v1 = v30;
  v29 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F380E2E5);
  objc_msgSend(v30, (SEL)0x1F3363D48);

  v34 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel];
  v2 = v34;
  v31 = (id)objc_opt_self();
  v32 = (id)*MEMORY[0x1E0DC4B10];
  v3 = (id)*MEMORY[0x1E0DC4B10];
  v33 = objc_msgSend(v31, (SEL)0x1F3754EDBLL, v32, *MEMORY[0x1E0DC1438]);

  objc_msgSend(v34, (SEL)0x1F31146C8, v33);
  v35 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel];
  v4 = v35;
  objc_msgSend(v35, (SEL)0x1F2E75D48, 1);

  v36 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel];
  v5 = v36;
  objc_msgSend(v36, (SEL)0x1F30414C8);

  v38 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel];
  v6 = v38;
  v37 = objc_msgSend((id)objc_opt_self(), (SEL)0x1F380E2E5);
  objc_msgSend(v38, (SEL)0x1F3363D48);

  v42 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel];
  v7 = v42;
  v39 = (id)objc_opt_self();
  v40 = (id)*MEMORY[0x1E0DC4AB8];
  v8 = (id)*MEMORY[0x1E0DC4AB8];
  v41 = objc_msgSend(v39, (SEL)0x1F3754EDBLL, v40, *MEMORY[0x1E0DC1440]);

  objc_msgSend(v42, (SEL)0x1F31146C8, v41);
  v43 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel];
  v9 = v43;
  objc_msgSend(v43, (SEL)0x1F2E75D48, 1);

  v44 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel];
  v10 = v44;
  objc_msgSend(v44, (SEL)0x1F30414C8, 1);

  v45 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel];
  v11 = v45;
  objc_msgSend(v45, sel_setNumberOfLines_);

  v47 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  v12 = v47;
  v46 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel];
  v13 = v46;
  objc_msgSend(v47, (SEL)0x1F37ACD51, v46);

  v49 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  v14 = v49;
  v48 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel];
  v15 = v48;
  objc_msgSend(v49, (SEL)0x1F37ACD51, v48);

  v50 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  v16 = v50;
  objc_msgSend(v50, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v51 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  v17 = v51;
  objc_msgSend(v51, sel_setAxis_, 1);

  v52 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  v18 = v52;
  sub_1D566011C();
  objc_msgSend(v52, sel_setSpacing_);

  v53 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  v19 = v53;
  objc_msgSend(v0, sel_addSubview_, v53);

  v72 = (void *)objc_opt_self();
  sub_1D559C4E0();
  sub_1D566077C();
  v71 = v20;
  v54 = *(void **)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  v21 = v54;
  v56 = objc_msgSend(v54, (SEL)0x1F38436F4);

  v22 = v0;
  v55 = objc_msgSend(v0, (SEL)0x1F38436F4);

  v57 = objc_msgSend(v56, (SEL)0x1F37BEF67, v55, *(double *)sub_1D5648374());
  *v71 = v57;
  v58 = *(void **)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  v23 = v58;
  v60 = objc_msgSend(v58, (SEL)0x1F37B738DLL);

  v24 = v0;
  v59 = objc_msgSend(v0, (SEL)0x1F37B738DLL);

  v61 = objc_msgSend(v60, (SEL)0x1F37BEF67, v59, *((double *)sub_1D5648374() + 2));
  v71[1] = v61;
  v62 = *(void **)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  v25 = v62;
  v64 = objc_msgSend(v62, (SEL)0x1F37F0136);

  v26 = v0;
  v63 = objc_msgSend(v0, (SEL)0x1F37F0136);

  v65 = objc_msgSend(v64, (SEL)0x1F37BEF67, v63, *((double *)sub_1D5648374() + 1));
  v71[2] = v65;
  v66 = *(void **)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  v27 = v66;
  v69 = objc_msgSend(v66, (SEL)0x1F3844648);

  v28 = v67;
  v68 = objc_msgSend(v67, (SEL)0x1F3844648);

  v70 = objc_retainAutoreleasedReturnValue(objc_msgSend(v69, (SEL)0x1F37BEF67, v68, -0.0 - *((double *)sub_1D5648374()
                                                                                             + 3)));

  v71[3] = v70;
  sub_1D5571928();
  v73 = (void *)sub_1D565FF84();
  swift_bridgeObjectRelease();
  objc_msgSend(v72, sel_activateConstraints_, v73);

}

void sub_1D564A404()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;

  v1 = v0;
  v2 = v0;
  v3 = v0;
  v4 = v0;
  v5 = OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView;
  sub_1D55E336C();
  *(_QWORD *)&v8[v5] = sub_1D556CE74();

  v6 = OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel;
  sub_1D559C8F0();
  *(_QWORD *)&v8[v6] = sub_1D556CE74();

  v7 = OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel;
  *(_QWORD *)&v8[v7] = sub_1D556CE74();

  *(_QWORD *)&v8[OBJC_IVAR____TtC6MailUI19SearchPreparingView_indexStatus] = 0;
  sub_1D565FE64();
  sub_1D566062C();
  __break(1u);
}

id SearchPreparingView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SearchPreparingView()
{
  return objc_opt_self();
}

void *type metadata accessor for SearchPreparingView.Constants()
{
  return &unk_1E99E9C00;
}

void *type metadata accessor for SearchPreparingView.OptimizationScenario()
{
  return &unk_1E99E9C90;
}

unint64_t sub_1D564A6A8()
{
  return sub_1D564A6BC();
}

unint64_t sub_1D564A6BC()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3EC60;
  if (!qword_1EFF3EC60)
  {
    v0 = MEMORY[0x1D82763B0](&unk_1D5674468, &unk_1E99E9C90);
    atomic_store(v0, (unint64_t *)&qword_1EFF3EC60);
    return v0;
  }
  return v2;
}

uint64_t *sub_1D564A728()
{
  if (qword_1ED9A9288 != -1)
    swift_once();
  return &qword_1ED9A9270;
}

double SeparatorSupplementaryView.separatorLeadingInset.getter()
{
  uint64_t v0;
  double *v2;
  double v3;

  v2 = (double *)(v0 + OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separatorLeadingInset);
  swift_beginAccess();
  v3 = *v2;
  swift_endAccess();
  return v3;
}

void sub_1D564A7DC(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  char *v3;
  char *v4;
  uint64_t v6;

  v3 = (char *)*a1;
  v2 = *a1;
  v4 = &v3[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separatorLeadingInset];
  swift_beginAccess();
  v6 = *(_QWORD *)v4;
  swift_endAccess();
  *a2 = v6;

}

void sub_1D564A864(double *a1, id *a2)
{
  id v2;
  id v3;
  double v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  SeparatorSupplementaryView.separatorLeadingInset.setter(v4);

}

void SeparatorSupplementaryView.separatorLeadingInset.setter(double a1)
{
  uint64_t v1;
  double *v2;

  v2 = (double *)(v1 + OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separatorLeadingInset);
  swift_beginAccess();
  *v2 = a1;
  swift_endAccess();
  sub_1D564A924();
}

void sub_1D564A924()
{
  uint64_t v0;
  id v1;
  double *v2;
  double v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v6 = OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_leadingConstraint;
  v7 = (_QWORD *)(v0 + OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_leadingConstraint);
  swift_beginAccess();
  if (*v7)
  {
    v4 = *(id *)(v5 + v6);
    v1 = v4;
    swift_endAccess();
    v2 = (double *)(v5 + OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separatorLeadingInset);
    swift_beginAccess();
    v3 = *v2;
    swift_endAccess();
    objc_msgSend(v4, sel_setConstant_, v3);

  }
  else
  {
    swift_endAccess();
  }
}

void (*SeparatorSupplementaryView.separatorLeadingInset.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D564AA68;
}

void sub_1D564AA68(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    sub_1D564A924();
  }
}

uint64_t sub_1D564AAB4()
{
  uint64_t result;
  uint64_t v1;

  type metadata accessor for SeparatorSupplementaryView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9290);
  result = sub_1D565FE34();
  qword_1ED9A9270 = result;
  qword_1ED9A9278 = v1;
  return result;
}

uint64_t type metadata accessor for SeparatorSupplementaryView()
{
  return objc_opt_self();
}

uint64_t static SeparatorSupplementaryView.reuseIdentifier.getter()
{
  uint64_t v1;

  v1 = *sub_1D564A728();
  swift_bridgeObjectRetain();
  return v1;
}

double sub_1D564AB70()
{
  void *v0;
  id v1;
  id v2;
  double v3;
  double v4;
  id v6;
  double v7;
  id v8;
  id v10;
  id v11;
  char v12;

  v1 = v0;
  v10 = objc_msgSend(v0, sel_traitCollection);

  v11 = objc_msgSend(v10, sel_preferredContentSizeCategory);
  v12 = sub_1D56602D8();

  if ((v12 & 1) != 0)
    return 1.0;
  v8 = (id)objc_opt_self();
  v2 = v0;
  v6 = objc_msgSend(v0, sel_traitCollection);

  objc_msgSend(v6, sel_displayScale);
  v7 = v3;

  objc_msgSend(v8, sel_uiRoundValue_toViewScale_, v0, 1.0 / v7);
  return v4;
}

id SeparatorSupplementaryView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id SeparatorSupplementaryView.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v13;
  objc_class *ObjectType;
  __int128 v15;
  __int128 v16;
  id v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  id v21;

  *(double *)&v15 = a1;
  *((double *)&v15 + 1) = a2;
  *(double *)&v16 = a3;
  *((double *)&v16 + 1) = a4;
  ObjectType = (objc_class *)swift_getObjectType();
  v19 = v15;
  v20 = v16;
  v5 = v4;
  v6 = v4;
  v7 = v4;
  v8 = v4;
  v21 = v4;
  *(_QWORD *)&v4[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separatorLeadingInset] = 0;

  *(_QWORD *)&v4[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_heightConstraint] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_leadingConstraint] = 0;

  v13 = OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator;
  sub_1D55E33D0();
  *(_QWORD *)&v4[v13] = sub_1D556CE74();

  v18.receiver = v21;
  v18.super_class = ObjectType;
  v17 = objc_msgSendSuper2(&v18, sel_initWithFrame_, v15, v16);
  v9 = v17;
  v10 = v17;
  v11 = v17;
  v21 = v17;
  SeparatorSupplementaryView.setupLayout()();

  SeparatorSupplementaryView.configureBackground()();
  return v17;
}

Swift::Void __swiftcall SeparatorSupplementaryView.setupLayout()()
{
  char *v0;
  id v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  char *v6;
  void *v7;
  _QWORD *v8;
  id v9;
  char *v10;
  id v11;
  char *v12;
  id v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char *v19;
  id v20;
  void **v21;
  id v22;
  id v23;
  double *v24;
  double v25;
  id v26;
  id v27;
  void **v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id *v43;
  id *v44;
  _QWORD *v45;

  v16 = *(id *)&v0[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator];
  v1 = v16;
  objc_msgSend(v0, sel_addSubview_, v16);

  v17 = *(id *)&v0[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator];
  v2 = v17;
  objc_msgSend(v17, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v18 = *(id *)&v0[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator];
  v3 = v18;
  v20 = objc_msgSend(v18, sel_heightAnchor);

  v22 = objc_msgSend(v20, sel_constraintEqualToConstant_, sub_1D564AB70());
  v21 = (void **)&v19[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_heightConstraint];
  swift_beginAccess();
  v4 = *v21;
  *v21 = v22;

  swift_endAccess();
  v23 = *(id *)&v19[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator];
  v5 = v23;
  v27 = objc_msgSend(v23, (SEL)0x1F37F0136);

  v6 = v19;
  v26 = objc_msgSend(v19, (SEL)0x1F37F0136);

  v24 = (double *)&v19[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separatorLeadingInset];
  swift_beginAccess();
  v25 = *v24;
  swift_endAccess();
  v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_constant_, v26, v25);

  v28 = (void **)&v19[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_leadingConstraint];
  swift_beginAccess();
  v7 = *v28;
  *v28 = v29;

  swift_endAccess();
  v30 = (id)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9AF0);
  sub_1D566077C();
  v45 = v8;
  v31 = *(id *)&v19[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator];
  v9 = v31;
  v33 = objc_msgSend(v31, (SEL)0x1F38436F4);

  v10 = v19;
  v32 = objc_msgSend(v19, (SEL)0x1F38436F4);

  v34 = objc_msgSend(v33, (SEL)0x1F37BEF4ELL, v32);
  *v45 = v34;
  v35 = *(id *)&v19[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator];
  v11 = v35;
  v37 = objc_msgSend(v35, (SEL)0x1F37B738DLL);

  v12 = v19;
  v36 = objc_msgSend(v19, (SEL)0x1F37B738DLL);

  v38 = objc_msgSend(v37, (SEL)0x1F37BEF4ELL, v36);
  v45[1] = v38;
  v39 = *(id *)&v19[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator];
  v13 = v39;
  v41 = objc_msgSend(v39, (SEL)0x1F3844648);

  v14 = v19;
  v40 = objc_msgSend(v19, (SEL)0x1F3844648);

  v42 = objc_msgSend(v41, (SEL)0x1F37BEF4ELL, v40);
  v45[2] = v42;
  v43 = (id *)&v19[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_heightConstraint];
  swift_beginAccess();
  sub_1D559B584(v43, v45 + 3);
  swift_endAccess();
  v44 = (id *)&v19[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_leadingConstraint];
  swift_beginAccess();
  sub_1D559B584(v44, v45 + 4);
  swift_endAccess();
  sub_1D5571928();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9A60);
  sub_1D559C4E0();
  sub_1D55DE230();
  sub_1D565FEDC();
  sub_1D5565788();
  v15 = (id)sub_1D565FF84();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_activateConstraints_, v15);

}

Swift::Void __swiftcall SeparatorSupplementaryView.configureBackground()()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;

  v3 = *(id *)(v0 + OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator);
  v1 = v3;
  v2 = objc_msgSend((id)objc_opt_self(), sel_separatorColor);
  objc_msgSend(v3, sel_setBackgroundColor_);

}

void sub_1D564B5A0()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  uint64_t v5;

  v1 = v0;
  v2 = v0;
  v3 = v0;
  v4 = v0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separatorLeadingInset] = 0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_heightConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_leadingConstraint] = 0;

  v5 = OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator;
  sub_1D55E33D0();
  *(_QWORD *)&v0[v5] = sub_1D556CE74();

  sub_1D565FE64();
  sub_1D566062C();
  __break(1u);
}

Swift::Void __swiftcall SeparatorSupplementaryView.traitCollectionDidChange(_:)(UITraitCollection_optional a1)
{
  void *v1;
  id v2;
  objc_class *v3;
  char *v4;
  id v5;
  id v6;
  id *v7;
  id v8;
  unsigned __int8 v9;
  char v10;
  objc_class *ObjectType;
  char *v12;
  Class isa;
  char v14;
  objc_super v15;
  void *v16;
  Class v17;

  isa = a1.value.super.isa;
  ObjectType = (objc_class *)swift_getObjectType();
  v17 = isa;
  v16 = v1;
  v2 = v1;
  v15.receiver = v1;
  v15.super_class = ObjectType;
  objc_msgSendSuper2(&v15, sel_traitCollectionDidChange_, isa);

  v3 = isa;
  if (isa)
  {
    v4 = v12;
    v8 = objc_msgSend(v12, sel_traitCollection);

    v9 = -[objc_class mf_traitDifferenceAffectsTextLayout:](isa, sel_mf_traitDifferenceAffectsTextLayout_, v8);
    v10 = v9 & 1;
  }
  else
  {
    v10 = 2;
  }
  if (v10 == 2)
    v14 = 1;
  else
    v14 = v10 & 1;
  if ((v14 & 1) != 0)
  {
    v7 = (id *)&v12[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_heightConstraint];
    swift_beginAccess();
    if (*v7)
    {
      v6 = *v7;
      v5 = *v7;
      swift_endAccess();
      objc_msgSend(v6, sel_setConstant_, sub_1D564AB70());

    }
    else
    {
      swift_endAccess();
    }
  }
}

id SeparatorSupplementaryView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1D564BA0C(id *a1@<X0>, _QWORD *a2@<X8>)
{
  sub_1D564A7DC(a1, a2);
}

void sub_1D564BA20(double *a1, id *a2)
{
  sub_1D564A864(a1, a2);
}

uint64_t Sequence<>.joined(by:matchingAttributes:)(void *a1)
{
  id v1;
  id v4;
  uint64_t v5;

  sub_1D559B61C();
  v4 = sub_1D556CE74();
  v1 = a1;
  sub_1D565FF18();

  return v5;
}

id sub_1D564BB34@<X0>(id *a1@<X0>, id *a2@<X1>, char a3@<W2>, void *a4@<X3>, _QWORD *a5@<X8>)
{
  id v5;
  id v6;
  id v7;
  id result;
  id v9;
  id v10;
  id v11;
  id v15;
  id v16;
  id v17;
  id v18;

  v16 = *a1;
  v15 = *a2;
  v5 = *a1;
  v17 = objc_msgSend(v16, sel_length);

  if ((uint64_t)v17 > 0)
  {
    if ((a3 & 1) != 0)
    {
      objc_msgSend(v15, (SEL)0x1F2A45948);
      v9 = objc_msgSend(v15, sel_attributesAtIndex_longestEffectiveRange_inRange_);
      type metadata accessor for Key();
      sub_1D556CA08();
      sub_1D565FCA8();

      sub_1D559B61C();
      v6 = a4;
      v18 = sub_1D564C098(a4);
      v7 = v18;
      v10 = objc_msgSend(v18, (SEL)0x1F2A45948);

      swift_bridgeObjectRetain();
      v11 = (id)sub_1D565FC9C();
      swift_bridgeObjectRelease();
      objc_msgSend(v18, sel_addAttributes_range_, v11, 0, v10);

      objc_msgSend(v16, sel_appendAttributedString_, v18);
      swift_bridgeObjectRelease();
    }
    else
    {
      objc_msgSend(v16, sel_appendAttributedString_, a4);
    }
  }
  objc_msgSend(v16, sel_appendAttributedString_, v15);
  result = v16;
  *a5 = v16;
  return result;
}

id sub_1D564BDC8@<X0>(id *a1@<X0>, id *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  return sub_1D564BB34(a1, a2, *(_BYTE *)(v3 + 16) & 1, *(void **)(v3 + 24), a3);
}

uint64_t sub_1D564BDF4@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  _QWORD v17[2];
  uint64_t v18;
  void (*v19)(char *, char *);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  unint64_t v29;
  char *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v18 = a7;
  v19 = a1;
  v20 = a2;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v25 = a6;
  v37 = a4;
  v36 = a5;
  v26 = *(_QWORD *)(a4 - 8);
  v27 = (*(_QWORD *)(v26 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = MEMORY[0x1E0C80A78](v7);
  v28 = (char *)v17 - v27;
  v33 = *(_QWORD *)(v9 + 16);
  v35 = v33;
  v32 = *(_QWORD *)(v33 - 8);
  v29 = (*(_QWORD *)(v32 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v10 = MEMORY[0x1E0C80A78](v8);
  v30 = (char *)v17 - v29;
  v31 = (*(_QWORD *)(*(_QWORD *)(v11 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v12 = (const void *)MEMORY[0x1E0C80A78](v10);
  v34 = (char *)v17 - v31;
  sub_1D5629B88(v12, (char *)v17 - v31, v13, v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v34, 1, v33) == 1)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v18, 1);
    v17[1] = v24;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v30, v34, v33);
    v16 = v24;
    v19(v30, v28);
    v17[0] = v16;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v30, v33);
    if (v16)
    {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v25, v28, v22);
    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v18, 0, 1);
      return v17[0];
    }
  }
  return result;
}

uint64_t sub_1D564C02C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(a2, a1);
}

id sub_1D564C064()
{
  sub_1D559DF64();
  return sub_1D556CE74();
}

id sub_1D564C098(void *a1)
{
  id v1;

  v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_1D5652900(a1);
}

uint64_t sub_1D564C0D4()
{
  _QWORD *v0;
  uint64_t v2;

  type metadata accessor for Options();
  sub_1D566077C();
  *v0 = 1;
  sub_1D5571928();
  sub_1D556AB40();
  sub_1D56604E8();
  return v2;
}

uint64_t sub_1D564C14C()
{
  uint64_t v1;

  type metadata accessor for MatchingOptions();
  sub_1D566077C();
  sub_1D556AC48();
  sub_1D56604E8();
  return v1;
}

uint64_t static SnippetGenerator.highlightingTokens(tokens:in:highlighting:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v5;
  NSRegularExpressionOptions v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  id v14;
  _QWORD v15[6];
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t KeyPath;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  unint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  Swift::OpaquePointer v49;
  uint64_t v50;
  _QWORD *v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  _QWORD v59[6];
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;

  v40 = a1;
  v41 = a2;
  v42 = a3;
  v43 = a4;
  v58 = 0;
  v57 = 0;
  v69 = a1;
  v68 = a2;
  v66 = a3;
  v67 = a4;
  v65 = v4;
  sub_1D564C740(a2, a1, &v60);
  v45 = v60;
  v46 = v61;
  v47 = v62;
  v48 = v63;
  v49._rawValue = v64;
  v59[4] = v60;
  v59[5] = v61;
  v59[2] = v62;
  v59[3] = v63;
  v59[1] = v64;
  swift_bridgeObjectRetain();
  v51 = v59;
  v59[0] = v49._rawValue;
  v50 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9AA190);
  sub_1D5595FB0();
  v52 = sub_1D5660194();
  sub_1D5565788();
  if ((v52 & 1) != 0 || (sub_1D565FEA0() & 1) != 0)
  {
    v14 = v41;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v17 = v41;
    v18 = v44;
    return (uint64_t)v17;
  }
  v34 = 0;
  sub_1D559B61C();
  v5 = v41;
  v35 = sub_1D564C098(v41);
  v58 = v35;
  v36 = sub_1D564CC94();
  swift_bridgeObjectRetain();
  v6 = sub_1D564C0D4();
  NSRegularExpression.init(tokens:options:)((NSRegularExpression *)&v70, v49, v6);
  v37 = v7;
  v38 = v8;
  v39 = v7;
  if (v7)
  {
    v16 = v39;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v31;
  }
  else
  {
    v24 = v38;
    v57 = v38;
    swift_bridgeObjectRetain();
    v25 = (id)sub_1D565FDF8();
    swift_bridgeObjectRelease();
    v55 = v47;
    v56 = v48;
    v26 = objc_msgSend(v38, sel_matchesInString_options_range_, v25, sub_1D564C14C(), v47, v48);

    v27 = 0;
    sub_1D564CCF8();
    v54 = sub_1D565FF90();
    KeyPath = swift_getKeyPath();
    swift_retain();
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A94D8);
    v30 = type metadata accessor for _NSRange();
    v9 = sub_1D564CE7C();
    v32 = 0;
    v33 = sub_1D556F498((void (*)(char *, char *))sub_1D564CE4C, KeyPath, v29, v30, MEMORY[0x1E0DEDCE8], v9, MEMORY[0x1E0DEDD18], v31);
    v19 = v33;
    swift_release();
    swift_release();
    sub_1D5565788();

    v53 = v33;
    v10 = v35;
    v20 = &v16;
    MEMORY[0x1E0C80A78](&v16);
    v21 = v15;
    v15[2] = v42;
    v15[3] = v43;
    v15[4] = v11;
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A94E8);
    sub_1D564CF8C();
    v12 = v32;
    result = sub_1D565FF30();
    v23 = v12;
    if (!v12)
    {

      sub_1D5565788();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v17 = v35;
      v18 = v23;
      return (uint64_t)v17;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1D564C740@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[5];
  _QWORD v60[2];
  _QWORD v61[6];

  v43 = a3;
  v44 = a2;
  v45 = "Fatal error";
  v46 = "Range cannot have an unordered lower bound.";
  v47 = "Swift/Range.swift";
  v61[3] = 0;
  v55 = 0;
  v56 = 0;
  v48 = 0;
  v53 = 0;
  v61[5] = a1;
  v61[4] = a2;
  v49 = objc_msgSend(a1, sel_string);
  v50 = sub_1D565FE10();
  v51 = v3;
  v61[1] = v50;
  v61[2] = v3;

  v52 = sub_1D565FE40();
  v36 = v61;
  v61[0] = v52;
  swift_bridgeObjectRetain();
  v33 = v60;
  v60[0] = v50;
  v60[1] = v51;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A97A8);
  v35 = sub_1D564CFFC();
  v37 = sub_1D5573454();
  v38 = sub_1D56603EC();
  v39 = v4;
  v59[3] = v38;
  v59[4] = v4;
  v40 = sub_1D564DAF0();
  v41 = v5;
  v59[1] = v40;
  v59[2] = v5;
  v42 = sub_1D565FE40();
  v24 = v59;
  v59[0] = v42;
  swift_bridgeObjectRetain();
  v57 = v40;
  v58 = v41;
  v30 = MEMORY[0x1E0DEA968];
  v25 = sub_1D56603EC();
  v26 = v6;
  v55 = v25;
  v56 = v6;
  v54 = v44;
  v27 = &v17;
  MEMORY[0x1E0C80A78](&v17);
  v28 = &v15;
  v16 = v7;
  v29 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9AA190);
  v8 = sub_1D5595FB0();
  v32 = sub_1D556F498((void (*)(char *, char *))sub_1D565216C, (uint64_t)v28, v29, v30, MEMORY[0x1E0DEDCE8], v8, MEMORY[0x1E0DEDD18], v31);
  v23 = v32;
  v53 = v32;
  if ((sub_1D56603E0() & 1) != 0)
  {
    result = swift_bridgeObjectRelease();
    v18 = v40;
    v19 = v41;
    v20 = v25;
    v21 = v26;
    v22 = v23;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    v18 = v50;
    v19 = v51;
    v20 = v38;
    v21 = v39;
    v22 = v44;
  }
  v10 = v43;
  v11 = v19;
  v12 = v20;
  v13 = v21;
  v14 = v22;
  *v43 = v18;
  v10[1] = v11;
  v10[2] = v12;
  v10[3] = v13;
  v10[4] = v14;
  return result;
}

unint64_t sub_1D564CC94()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1ED9A9598;
  if (!qword_1ED9A9598)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1ED9A9598);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_1D564CCF8()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1ED9A95B0;
  if (!qword_1ED9A95B0)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1ED9A95B0);
    return ObjCClassMetadata;
  }
  return v2;
}

char *keypath_get_selector_range()
{
  return sel_range;
}

void sub_1D564CD68(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  uint64_t v3;
  id v4;

  v4 = *a1;
  v2 = *a1;
  *a2 = objc_msgSend(v4, sel_range);
  a2[1] = v3;

}

void sub_1D564CDD4(id *a1@<X0>, _QWORD *a2@<X8>)
{
  sub_1D564CD68(a1, a2);
}

uint64_t sub_1D564CDE8(id *a1)
{
  id v1;
  id v3;

  v3 = *a1;
  v1 = *a1;
  swift_retain();
  swift_getAtKeyPath();

  return swift_release();
}

uint64_t sub_1D564CE4C(id *a1)
{
  return sub_1D564CDE8(a1);
}

unint64_t sub_1D564CE7C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1ED9A94E0;
  if (!qword_1ED9A94E0)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED9A94D8);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEAF50], v0);
    atomic_store(v1, (unint64_t *)&qword_1ED9A94E0);
    return v1;
  }
  return v3;
}

uint64_t sub_1D564CEEC(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_1D564CF60(uint64_t a1)
{
  uint64_t v1;

  return sub_1D564CEEC(a1, *(uint64_t (**)(void))(v1 + 16));
}

unint64_t sub_1D564CF8C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1ED9A9500;
  if (!qword_1ED9A9500)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED9A94E8);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEAF38], v0);
    atomic_store(v1, (unint64_t *)&qword_1ED9A9500);
    return v1;
  }
  return v3;
}

unint64_t sub_1D564CFFC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1ED9A97A0;
  if (!qword_1ED9A97A0)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED9A97A8);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEC928], v0);
    atomic_store(v1, (unint64_t *)&qword_1ED9A97A0);
    return v1;
  }
  return v3;
}

uint64_t sub_1D564D1F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a1, a2, a3);
}

uint64_t static SnippetGenerator.highlightingTokens(authorTokens:authorEmailTokens:inEmailAttributedString:highlighting:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v5;
  uint64_t result;
  id v7;
  NSRegularExpressionOptions v8;
  NSRegularExpression *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void (*(*v16)(uint64_t, uint64_t, uint64_t, uint64_t))(char *, _QWORD);
  id v17;
  void (*(*v18)(uint64_t, uint64_t, uint64_t, uint64_t))(char *, _QWORD);
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  const void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  const void *v33;
  void *v34;
  char v35;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  Swift::OpaquePointer v46;
  char v47[16];
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t (*v54)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v55;
  uint64_t (*v56)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  id v62;
  uint64_t aBlock;
  int v64;
  int v65;
  uint64_t (*v66)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v67;
  uint64_t (*v68)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *rawValue;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;

  v76 = 0;
  rawValue = 0;
  v72 = 0;
  v71 = 0;
  v60 = 0;
  v59 = 0;
  v81 = a1;
  v80 = a2;
  v79 = a3;
  v77 = a4;
  v78 = a5;
  v42 = MEMORY[0x1E0DEA968];
  v75 = sub_1D565FFA8();
  v48 = v40;
  v41 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9AA190);
  v45 = sub_1D5595FB0();
  v46._rawValue = (void *)sub_1D556F498((void (*)(char *, char *))sub_1D565216C, (uint64_t)v47, v41, v42, MEMORY[0x1E0DEDCE8], v45, MEMORY[0x1E0DEDD18], v44);
  if (v43)
  {
    __break(1u);
    swift_bridgeObjectRelease();
    v16 = 0;
    goto LABEL_14;
  }
  sub_1D5565788();
  rawValue = v46._rawValue;
  swift_bridgeObjectRetain();
  v73 = v46._rawValue;
  v35 = sub_1D5660194();
  sub_1D5565788();
  if ((v35 & 1) != 0 || !objc_msgSend(a3, sel_length))
  {
    v15 = a3;
    swift_bridgeObjectRelease();
    v17 = a3;
    v18 = 0;
    v19 = 0;
    goto LABEL_10;
  }
  v34 = (void *)static SnippetGenerator.highlightingTokens(tokens:in:highlighting:)((uint64_t)v46._rawValue, a3, a4, a5);
  v72 = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9438);
  sub_1D566077C();
  v71 = sub_1D565FCCC();
  v31 = (id)*MEMORY[0x1E0D1E4D0];
  v5 = (id)*MEMORY[0x1E0D1E4D0];
  v30 = objc_msgSend(v34, sel_length);
  type metadata accessor for EnumerationOptions();
  sub_1D566077C();
  sub_1D556AD50();
  sub_1D56604E8();
  v32 = v70;
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = &v71;
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = sub_1D56521C4;
  *(_QWORD *)(v29 + 24) = v28;
  swift_retain();
  v68 = sub_1D56521F4;
  v69 = v29;
  aBlock = MEMORY[0x1E0C809B0];
  v64 = 1107296256;
  v65 = 0;
  v66 = sub_1D564E128;
  v67 = &block_descriptor_7;
  v33 = _Block_copy(&aBlock);
  swift_release();
  v61 = 0;
  v62 = v30;
  objc_msgSend(v34, sel_enumerateAttribute_inRange_options_usingBlock_, v31, 0, v30, v32, v33);
  _Block_release(v33);
  result = swift_isEscapingClosureAtFileLocation();
  if ((result & 1) == 0)
  {
    sub_1D55A3BE8((uint64_t)sub_1D56521F4);

    sub_1D559B61C();
    v7 = v34;
    v26 = sub_1D564C098(v34);
    v60 = v26;
    sub_1D564CC94();
    swift_bridgeObjectRetain();
    v8 = sub_1D564C0D4();
    NSRegularExpression.init(tokens:options:)(v9, v46, v8);
    v27 = v10;
    if (!v11)
    {
      v59 = v10;
      v23 = (id)*MEMORY[0x1E0D1E4D0];
      v12 = (id)*MEMORY[0x1E0D1E4D0];
      v22 = objc_msgSend(v34, sel_length);
      sub_1D566077C();
      sub_1D56604E8();
      v24 = v58;
      swift_bridgeObjectRetain();
      v13 = v27;
      v14 = v26;
      v20 = (_QWORD *)swift_allocObject();
      v20[2] = &v71;
      v20[3] = a1;
      v20[4] = v27;
      v20[5] = a4;
      v20[6] = a5;
      v20[7] = v26;
      v21 = swift_allocObject();
      *(_QWORD *)(v21 + 16) = sub_1D56522A8;
      *(_QWORD *)(v21 + 24) = v20;
      swift_retain();
      v56 = sub_1D56521F4;
      v57 = v21;
      v51 = MEMORY[0x1E0C809B0];
      v52 = 1107296256;
      v53 = 0;
      v54 = sub_1D564E128;
      v55 = &block_descriptor_13_0;
      v25 = _Block_copy(&v51);
      swift_release();
      v49 = 0;
      v50 = v22;
      objc_msgSend(v34, sel_enumerateAttribute_inRange_options_usingBlock_, v23, 0, v22, v24, v25);
      _Block_release(v25);
      result = swift_isEscapingClosureAtFileLocation();
      if ((result & 1) == 0)
      {
        sub_1D55A3BE8((uint64_t)sub_1D56521F4);

        sub_1D5565788();
        swift_bridgeObjectRelease();
        v17 = v26;
        v18 = sub_1D56521C4;
        v19 = sub_1D56522A8;
LABEL_10:
        sub_1D55A3BE8((uint64_t)v18);
        sub_1D55A3BE8(0);
        sub_1D55A3BE8((uint64_t)v19);
        sub_1D55A3BE8(0);
        return (uint64_t)v17;
      }
      goto LABEL_16;
    }

    sub_1D5565788();
    swift_bridgeObjectRelease();
    v16 = sub_1D56521C4;
LABEL_14:
    sub_1D55A3BE8((uint64_t)v16);
    sub_1D55A3BE8(0);
    return v44;
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_1D564DA88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v2;

  result = sub_1D564DAF0();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_1D564DAF0()
{
  id v0;
  uint64_t v1;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1D565FE64();
  sub_1D565FE64();
  sub_1D5573454();
  sub_1D558FE70();
  v3 = sub_1D5660470();
  v4 = (id)*MEMORY[0x1E0C99880];
  v0 = (id)*MEMORY[0x1E0C99880];
  v5 = sub_1D5660458();
  v6 = v1;

  swift_bridgeObjectRetain();
  if (v6)
  {
    v7 = v5;
  }
  else
  {
    swift_bridgeObjectRetain();
    v7 = v3;
    sub_1D5530388();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

void (*sub_1D564DD58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(char *, _QWORD)
{
  uint64_t v5;
  void (*result)(char *, _QWORD);
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  char v21[32];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _BYTE v27[24];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v26 = 0;
  v24 = 0;
  v25 = 0;
  v33 = a1;
  v31 = a2;
  v32 = a3;
  v30 = a4;
  v29 = a5;
  sub_1D5652B78(a1, (uint64_t)v27);
  if (v28)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9650);
    if ((swift_dynamicCast() & 1) != 0)
      v18 = v20;
    else
      v18 = 0;
    v19 = v18;
  }
  else
  {
    sub_1D559B1D8((uint64_t)v27);
    v19 = 0;
  }
  if (!v19)
    return (void (*)(char *, _QWORD))sub_1D55A3BE8(0);
  v26 = v19;
  swift_getObjectType();
  swift_unknownObjectRetain();
  v17 = objc_msgSend(v19, sel_emailAddressValue);
  swift_unknownObjectRelease();
  if (v17)
  {
    v14 = objc_msgSend(v17, sel_simpleAddress);
    if (v14)
    {
      v10 = sub_1D565FE10();
      v11 = v5;

      v12 = v10;
      v13 = v11;
    }
    else
    {
      v12 = 0;
      v13 = 0;
    }

    v15 = v12;
    v16 = v13;
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }
  if (!v16)
  {
    swift_unknownObjectRelease();
    return (void (*)(char *, _QWORD))sub_1D55A3BE8(0);
  }
  v24 = v15;
  v25 = v16;
  swift_bridgeObjectRetain();
  v22 = v15;
  v23 = v16;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_1D55D94D8;
  *(_QWORD *)(v9 + 24) = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9A9428);
  result = (void (*)(char *, _QWORD))sub_1D565FCFC();
  if (__OFADD__(*v7, 1))
  {
    __break(1u);
  }
  else
  {
    ++*v7;
    result(v21, 0);
    sub_1D5530388();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    return (void (*)(char *, _QWORD))sub_1D55A3BE8((uint64_t)sub_1D557EA98);
  }
  return result;
}

uint64_t sub_1D564E108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

uint64_t sub_1D564E128(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 v4;
  void (*v6)(__n128);
  _QWORD v8[4];
  _QWORD v9[6];

  v9[4] = a3;
  v9[5] = a4;
  v6 = *(void (**)(__n128))(a1 + 32);
  swift_unknownObjectRetain();
  if (a2)
  {
    v8[3] = swift_getObjectType();
    v8[0] = a2;
    v4 = sub_1D5580C50((uint64_t)v8, (uint64_t)v9);
  }
  else
  {
    memset(v9, 0, 32);
  }
  v6(v4);
  return sub_1D559B1D8((uint64_t)v9);
}

uint64_t sub_1D564E20C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void (*a8)(_QWORD, _QWORD, _QWORD), uint64_t a9, uint64_t a10)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  _BYTE v76[24];
  uint64_t v77;
  uint64_t v78;
  void (*v79)(_QWORD, _QWORD, _QWORD);
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;

  v75 = 0;
  v73 = 0;
  v74 = 0;
  v71 = 0;
  v72 = 0;
  v70 = 0;
  v69 = 0;
  v67 = 0;
  v68 = 0;
  v65 = 0;
  v66 = 0;
  v61 = 0;
  v59 = 0;
  v52 = 0;
  v53 = 0;
  v87 = a1;
  v85 = a2;
  v86 = a3;
  v84 = a4;
  v83 = a5;
  v82 = a6;
  v81 = a7;
  v79 = a8;
  v80 = a9;
  v78 = a10;
  sub_1D5652B78(a1, (uint64_t)v76);
  if (v77)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9650);
    result = swift_dynamicCast();
    if ((result & 1) != 0)
      v42 = v49;
    else
      v42 = 0;
    v43 = v42;
  }
  else
  {
    result = sub_1D559B1D8((uint64_t)v76);
    v43 = 0;
  }
  if (v43)
  {
    v75 = v43;
    swift_getObjectType();
    swift_unknownObjectRetain();
    v41 = objc_msgSend(v43, sel_emailAddressValue);
    swift_unknownObjectRelease();
    if (v41)
    {
      v38 = objc_msgSend(v41, sel_simpleAddress);
      if (v38)
      {
        v34 = sub_1D565FE10();
        v35 = v11;

        v36 = v34;
        v37 = v35;
      }
      else
      {
        v36 = 0;
        v37 = 0;
      }

      v39 = v36;
      v40 = v37;
    }
    else
    {
      v39 = 0;
      v40 = 0;
    }
    v73 = v39;
    v74 = v40;
    swift_getObjectType();
    swift_unknownObjectRetain();
    v33 = objc_msgSend(v43, sel_emailAddressValue);
    swift_unknownObjectRelease();
    if (v33)
    {
      v30 = objc_msgSend(v33, sel_displayName);
      if (v30)
      {
        v26 = sub_1D565FE10();
        v27 = v12;

        v28 = v26;
        v29 = v27;
      }
      else
      {
        v28 = 0;
        v29 = 0;
      }

      v31 = v28;
      v32 = v29;
    }
    else
    {
      v31 = 0;
      v32 = 0;
    }
    v71 = v31;
    v72 = v32;
    swift_bridgeObjectRetain();
    if (v40)
    {
      v52 = v39;
      v53 = v40;
      swift_bridgeObjectRetain();
      MEMORY[0x1D8274D54](&v50);
      sub_1D5530388();
      if ((v51 & 1) == 0 && v50 > 1)
      {
        v70 = 1;
        swift_bridgeObjectRelease();
LABEL_32:
        v25 = v70;
        swift_bridgeObjectRetain();
        if ((v25 & 1) != 0)
        {
          swift_bridgeObjectRetain();
          v54 = a6;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9AA190);
          sub_1D5595FB0();
          v23 = sub_1D5660194();
          sub_1D5565788();
          v24 = v23 ^ 1;
        }
        else
        {
          v24 = 0;
        }
        swift_bridgeObjectRelease();
        v69 = v24 & 1;
        if ((v24 & 1) != 0)
        {
          swift_bridgeObjectRetain();
          v55 = v31;
          v56 = v32;
          if (v32)
          {
            v57 = v55;
            v58 = v56;
          }
          else
          {
            v57 = sub_1D565FE64();
            v58 = v13;
            sub_1D5530388();
          }
          v21 = v57;
          v22 = v58;
        }
        else
        {
          swift_getObjectType();
          swift_unknownObjectRetain();
          v18 = objc_msgSend(v43, sel_stringValue);
          v19 = sub_1D565FE10();
          v20 = v14;
          swift_unknownObjectRelease();

          v21 = v19;
          v22 = v20;
        }
        v67 = v21;
        v68 = v22;
        v15 = sub_1D565FE88();
        v65 = 0;
        v66 = v15;
        swift_bridgeObjectRetain();
        v16 = (id)sub_1D565FDF8();
        swift_bridgeObjectRelease();
        type metadata accessor for MatchingOptions();
        sub_1D566077C();
        sub_1D556AC48();
        sub_1D56604E8();
        v62 = 0;
        v63 = v15;
        v17 = objc_msgSend(a7, sel_firstMatchInString_options_range_, v16, v64, 0, v15);

        v61 = v17;
        v60 = v17;
        v59 = v17 != 0;
        if (v17)
          a8(a10, a2, a3);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return swift_unknownObjectRelease();
      }
      swift_bridgeObjectRelease();
    }
    v70 = 0;
    goto LABEL_32;
  }
  return result;
}

uint64_t static SnippetGenerator.highlightedSnippetUsingTokens(tokens:in:maxNumberOfWordsBeforeOrAfterToken:maxNumberOfRanges:highlighting:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  NSRegularExpressionOptions v7;
  NSRegularExpression *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  id v49;
  _QWORD v51[6];
  _QWORD v52[2];
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  int v59;
  uint64_t v60;
  id v61;
  _QWORD *v62;
  void *v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  id v79;
  id v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t *v86;
  id v87;
  uint64_t v88;
  __int128 v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  __int128 *v94;
  _QWORD *v95;
  unint64_t v96;
  uint64_t v97;
  id v98;
  __int128 v99;
  __int128 v100;
  _QWORD *v101;
  unint64_t v102;
  _QWORD *v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  __int128 v108;
  uint64_t v109;
  unint64_t v110;
  _QWORD *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  _QWORD *v116;
  __int128 *v117;
  _QWORD *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  _QWORD *v128;
  _QWORD *v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  id v134;
  id v135;
  id v136;
  uint64_t v137;
  uint64_t KeyPath;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  Swift::OpaquePointer tokens;
  uint64_t v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  id v160;
  id v161;
  uint64_t v162;
  uint64_t v163;
  id v164;
  id v165;
  void *v166;
  _QWORD v167[2];
  char v168;
  uint64_t v169;
  char v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  char v174;
  _QWORD v175[2];
  __int128 v176;
  uint64_t v177;
  uint64_t v178;
  char v179;
  char v180;
  id v181;
  id v182;
  uint64_t v183;
  __int128 v184;
  __int128 v185;
  id v186;
  uint64_t v187;
  char v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  char v192;
  _QWORD v193[2];
  __int128 v194;
  uint64_t v195;
  uint64_t v196;
  _BYTE v197[9];
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  __int128 v206;
  __int128 v207;
  id v208;
  void *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  uint64_t v229;

  v148 = a1;
  v147 = a2;
  v144 = a3;
  v145 = a5;
  v146 = a6;
  v208 = 0;
  v206 = 0u;
  v207 = 0u;
  v186 = 0;
  v182 = 0;
  v166 = 0;
  v165 = 0;
  v162 = 0;
  v161 = 0;
  v229 = a1;
  v228 = a2;
  v227 = a3;
  v226 = a4;
  v224 = a5;
  v225 = a6;
  v223 = v6;
  v221 = a4;
  v220 = 1;
  sub_1D56607DC();
  v149 = v222;
  v219 = v222;
  sub_1D564C740(v147, v148, &v214);
  v150 = v214;
  v151 = v215;
  v152 = v216;
  v153 = v217;
  tokens._rawValue = v218;
  v212 = v214;
  v213 = v215;
  v210 = v216;
  v211 = v217;
  v209 = v218;
  v154 = sub_1D564CC94();
  swift_bridgeObjectRetain();
  v7 = sub_1D564C0D4();
  NSRegularExpression.init(tokens:options:)(v8, tokens, v7);
  v156 = v9;
  v157 = v10;
  v158 = v9;
  if (v9)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v53 = v158;
    return v141;
  }
  v134 = v157;
  v208 = v157;
  swift_bridgeObjectRetain();
  v135 = (id)sub_1D565FDF8();
  swift_bridgeObjectRelease();
  v203 = v152;
  v204 = v153;
  v136 = objc_msgSend(v157, sel_matchesInString_options_range_, v135, sub_1D564C14C(), v152, v153);

  v137 = 0;
  sub_1D564CCF8();
  v202 = sub_1D565FF90();
  KeyPath = swift_getKeyPath();
  swift_retain();
  v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A94D8);
  v140 = type metadata accessor for _NSRange();
  v11 = sub_1D564CE7C();
  v142 = 0;
  v143 = sub_1D556F498((void (*)(char *, char *))sub_1D564CE4C, KeyPath, v139, v140, MEMORY[0x1E0DEDCE8], v11, MEMORY[0x1E0DEDD18], v141);
  v127 = v143;
  swift_release();
  swift_release();
  sub_1D5565788();

  v201 = v143;
  swift_bridgeObjectRetain();
  v128 = v52;
  MEMORY[0x1E0C80A78](v52);
  v129 = v51;
  v51[2] = v150;
  v51[3] = v151;
  v51[4] = v12;
  v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A94E8);
  v13 = sub_1D565239C();
  v14 = v142;
  v131 = v13;
  v15 = sub_1D556F498((void (*)(char *, char *))sub_1D565236C, (uint64_t)v129, v130, v140, MEMORY[0x1E0DEDCE8], v13, MEMORY[0x1E0DEDD18], v141);
  v132 = v14;
  v133 = v15;
  if (v14)
  {
    __break(1u);
    goto LABEL_22;
  }
  v123 = v133;
  swift_bridgeObjectRelease();
  sub_1D5565788();
  v200 = v123;
  v16 = sub_1D564CF8C();
  v17 = v132;
  v124 = v16;
  v18 = sub_1D565FF24();
  v125 = v17;
  v126 = v18;
  if (v17)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v121 = v126;
  sub_1D5565788();
  v199 = v121;
  v19 = sub_1D565FC6C();
  v20 = v125;
  v198 = v19;
  sub_1D565FF0C();
  v122 = v20;
  if (v20)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_1D5565788();
  *(_QWORD *)&v197[1] = v205;
  v117 = &v206;
  sub_1D5660188();
  v107 = *((_QWORD *)&v206 + 1);
  v112 = v206;
  v108 = v207;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v111 = v193;
  v193[0] = v112;
  v193[1] = v107;
  v194 = v108;
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9790);
  v110 = sub_1D565240C();
  sub_1D5660140();
  sub_1D557EFF0();
  v113 = v195;
  v114 = v196;
  swift_unknownObjectRelease();
  v189 = v113;
  v190 = v114;
  v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9520);
  sub_1D565247C();
  sub_1D565FD44();
  v187 = v191;
  v188 = v192 & 1;
  v116 = v51;
  MEMORY[0x1E0C80A78](v51);
  v21 = v152;
  v22 = &v51[-6];
  v118 = &v51[-6];
  v22[2] = v117;
  v22[3] = v21;
  v22[4] = v23;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9518);
  v25 = v122;
  v119 = v24;
  sub_1D564BDF4((void (*)(char *, char *))sub_1D565256C, (uint64_t)v118, v24, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0DEE9C0] + 8, v141, (uint64_t)v197);
  v120 = v25;
  if (v25)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v104 = sub_1D559DF64();
  sub_1D565FE64();
  v98 = sub_1D563387C();
  v186 = v98;
  v99 = v206;
  v100 = v207;
  swift_unknownObjectRetain();
  v184 = v99;
  v185 = v100;
  v26 = v147;
  v101 = v51;
  v102 = 32;
  MEMORY[0x1E0C80A78](v51);
  v103 = &v51[v102 / 0xFFFFFFFFFFFFFFF8];
  v103[2] = v27;
  v28 = sub_1D56525C4();
  v29 = v120;
  v30 = sub_1D556F498((void (*)(char *, char *))sub_1D565259C, (uint64_t)v103, v109, v104, MEMORY[0x1E0DEDCE8], v28, MEMORY[0x1E0DEDD18], v141);
  v105 = v29;
  v106 = v30;
  if (v29)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v83 = v106;

  sub_1D557EFF0();
  v86 = &v183;
  v183 = v83;
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A94A0);
  v85 = sub_1D5652634();
  v87 = (id)Sequence<>.joined(by:matchingAttributes:)(v98);
  sub_1D5565788();
  v182 = v87;
  v94 = &v206;
  v88 = *((_QWORD *)&v206 + 1);
  v91 = v206;
  v89 = v207;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v90 = v175;
  v175[0] = v91;
  v175[1] = v88;
  v176 = v89;
  sub_1D5660140();
  sub_1D557EFF0();
  v92 = v177;
  v93 = v178;
  swift_unknownObjectRelease();
  v171 = v92;
  v172 = v93;
  sub_1D56526A4();
  sub_1D566017C();
  v31 = v105;
  v169 = v173;
  v170 = v174 & 1;
  v95 = v51;
  v96 = 32;
  MEMORY[0x1E0C80A78](v51);
  v32 = &v51[v96 / 0xFFFFFFFFFFFFFFF8];
  v32[2] = v33;
  sub_1D564BDF4((void (*)(char *, char *))sub_1D565272C, (uint64_t)v32, v34, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0DEAFA0], v35, (uint64_t)&v179);
  v97 = v31;
  if (v31)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v168 = v179;
  if (v179 == 2)
    v180 = 0;
  else
    v180 = v168 & 1;
  if ((v180 & 1) != 0)
  {
    v78 = 0x1F2A45000uLL;
    v36 = objc_msgSend(v87, (SEL)0x1F2A45948);
    v74 = 0;
    v163 = 0;
    v164 = v36;
    v73 = objc_msgSend(v87, sel_attributesAtIndex_longestEffectiveRange_inRange_);
    v75 = type metadata accessor for Key();
    v77 = sub_1D556CA08();
    v76 = MEMORY[0x1E0DEE9B8] + 8;
    v82 = sub_1D565FCA8();
    v162 = v82;

    sub_1D559B61C();
    v37 = v98;
    v81 = sub_1D564C098(v98);
    v161 = v81;
    swift_bridgeObjectRetain();
    v80 = (id)sub_1D565FC9C();
    swift_bridgeObjectRelease();
    v38 = v81;
    v79 = objc_msgSend(v81, (SEL)(v78 + 2376));

    v159 = 0;
    v160 = v79;
    objc_msgSend(v81, sel_addAttributes_range_, v80, 0, v79);

    v39 = v81;
    v181 = v81;

    swift_bridgeObjectRelease();
  }
  else
  {
    v181 = 0;
  }
  v68 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9A9588);
  v69 = sub_1D566077C();
  v67 = v40;
  sub_1D559B584(&v181, v40);
  v41 = v87;
  v42 = v69;
  v67[1] = v87;
  sub_1D5571928();
  v167[1] = v42;
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A94B0);
  sub_1D5652754();
  v43 = v97;
  v44 = sub_1D565FEDC();
  v71 = v43;
  v72 = v44;
  if (v43)
    goto LABEL_27;
  v60 = v72;
  sub_1D5565788();
  v62 = v167;
  v167[0] = v60;
  v61 = sub_1D564C064();
  sub_1D561EF08();
  v63 = (void *)Sequence<>.joined(by:matchingAttributes:)(v61);

  sub_1D5565788();
  v45 = v71;
  v166 = v63;
  v46 = (void *)static SnippetGenerator.highlightingTokens(tokens:in:highlighting:)((uint64_t)tokens._rawValue, v63, v145, v146);
  v64 = v45;
  v65 = v46;
  v66 = v45;
  if (v45)
  {
LABEL_28:
    v52[0] = v66;

    sub_1D5565D18(&v181);
    sub_1D557EFF0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v53 = v52[0];
    return v141;
  }
  v56 = v65;
  v165 = v65;
  v58 = objc_msgSend(v65, sel_string);
  sub_1D565FE10();
  v57 = v47;
  v59 = sub_1D565FEA0();
  swift_bridgeObjectRelease();

  if ((v59 & 1) != 0)
  {
    v48 = v147;
    v55 = v147;
  }
  else
  {
    v49 = v56;
    v55 = v56;
  }
  v54 = v55;

  sub_1D5565D18(&v181);
  sub_1D557EFF0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (uint64_t)v54;
}

Swift::Int sub_1D564F988@<X0>(__C::_NSRange *a1@<X0>, Swift::Int a2@<X3>, __C::_NSRange *a3@<X8>)
{
  __C::_NSRange v3;
  Swift::Int result;
  __C::_NSRange range;
  id v7;

  range = *a1;
  swift_bridgeObjectRetain();
  v7 = (id)sub_1D565FDF8();
  v3 = NSString.rangeByAdding(maxNumberOfWordsBefore:maxNumberOfWordsAfter:range:)(a2, a2, range);

  swift_bridgeObjectRelease();
  result = v3.location;
  *a3 = v3;
  return result;
}

BOOL sub_1D564FA60(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

uint64_t sub_1D564FA90(uint64_t *a1, NSRange *a2)
{
  uint64_t result;
  NSRange v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger length;
  _QWORD *v14;
  NSUInteger location;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  NSRange v19;
  uint64_t v20;
  NSRange v21;
  uint64_t *v22;
  uint64_t v23;
  NSRange v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  NSRange v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  _QWORD v35[3];
  char v36;
  NSRange v37;
  NSRange v38;
  NSRange v39;
  NSRange v40;
  NSRange v41;
  NSRange v42;
  NSRange v43;
  NSRange v44;
  NSRange v45;
  NSRange v46;
  NSRange v47;
  uint64_t v48;
  NSRange v49;
  char v50;
  NSRange v51;
  uint64_t *v52;

  v22 = a1;
  v51.location = 0;
  v51.length = 0;
  v46.location = 0;
  v46.length = 0;
  v42.location = 0;
  v42.length = 0;
  v37.location = 0;
  v37.length = 0;
  v52 = a1;
  v24 = *a2;
  v51 = v24;
  v25 = *a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v27 = &v48;
  v48 = v25;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A94E8);
  sub_1D5652A68();
  sub_1D565FD44();
  sub_1D5565788();
  v28 = v49;
  if ((v50 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v47 = v24;
    result = sub_1D5660008();
    v20 = v23;
  }
  else
  {
    v21 = v28;
    v19 = v28;
    v46 = v28;
    swift_bridgeObjectRelease();
    v45 = v28;
    v44 = v24;
    v3 = NSIntersectionRange(v28, v24);
    v43 = v3;
    v42 = v3;
    if (v3.length)
    {
      v40 = v19;
      v39 = v24;
      v38 = NSUnionRange(v19, v24);
      length = v38.length;
      location = v38.location;
      v37 = v38;
      v9 = *v22;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v8 = v35;
      v35[0] = v9;
      sub_1D5652AD8();
      sub_1D5660140();
      sub_1D5565788();
      v10 = v35[1];
      v11 = v35[2];
      swift_bridgeObjectRelease();
      v31 = v10;
      v32 = v11;
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9520);
      sub_1D565247C();
      sub_1D565FD44();
      v29 = v33;
      v30 = v34 & 1;
      v14 = &v8;
      MEMORY[0x1E0C80A78](&v8);
      v16 = v7;
      v7[2] = v22;
      v7[3] = location;
      v7[4] = v4;
      v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9518);
      v6 = v23;
      result = sub_1D564BDF4((void (*)(char *, char *))sub_1D5652B48, (uint64_t)v16, v5, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0DEE9C0] + 8, v17, (uint64_t)&v36);
      v18 = v6;
      if (v6)
      {
        __break(1u);
      }
      else
      {
        result = 0;
        v20 = 0;
      }
    }
    else
    {
      v41 = v24;
      sub_1D5660008();
      result = v23;
      v20 = v23;
    }
  }
  return result;
}

uint64_t sub_1D564FE28(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v4)(_BYTE *, _QWORD);
  _QWORD *v5;
  _BYTE v9[32];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = 0;
  v12 = 0;
  v10 = 0;
  v11 = 0;
  v13 = *a1;
  v12 = a2;
  v10 = a3;
  v11 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A94E8);
  v4 = (uint64_t (*)(_BYTE *, _QWORD))sub_1D566005C();
  *v5 = a3;
  v5[1] = a4;
  return v4(v9, 0);
}

uint64_t sub_1D564FECC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  NSRange v6;
  uint64_t (*v7)(_BYTE *, _QWORD);
  NSRange *v8;
  _BYTE v10[32];
  NSRange v11;
  NSRange range2;
  NSRange v13;
  NSUInteger v14;
  NSUInteger v15;
  NSRange v16;
  NSRange v17;
  NSRange v18;
  NSRange v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSRange v24;
  NSRange v25;
  NSRange v26;

  v23 = 0;
  v22 = 0;
  v20 = 0;
  v21 = 0;
  v18.location = 0;
  v18.length = 0;
  v14 = 0;
  v15 = 0;
  v23 = *a1;
  v22 = a2;
  v20 = a3;
  v21 = a4;
  type metadata accessor for _NSRange();
  result = sub_1D56604DC();
  v18 = v19;
  v17 = v19;
  v25 = v19;
  v16 = v19;
  v24 = v19;
  if (__OFSUB__(a4, v19.location + v19.length))
  {
    __break(1u);
  }
  else
  {
    v14 = v19.location + v19.length;
    v15 = a4 - (v19.location + v19.length);
    v13 = v19;
    range2.location = v19.location + v19.length;
    range2.length = v15;
    v26.location = v19.location + v19.length;
    v26.length = v15;
    v6 = NSUnionRange(v19, v26);
    v11 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9790);
    v7 = (uint64_t (*)(_BYTE *, _QWORD))sub_1D56604D0();
    *v8 = v6;
    return v7(v10, 0);
  }
  return result;
}

id sub_1D565009C@<X0>(id a1@<X1>, _QWORD *a2@<X0>, _QWORD *a3@<X8>)
{
  id result;

  result = objc_msgSend(a1, sel_attributedSubstringFromRange_, *a2, a2[1]);
  *a3 = result;
  return result;
}

uint64_t sub_1D5650118@<X0>(BOOL *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for _NSRange();
  result = sub_1D56604DC();
  *a1 = v3 != 0;
  return result;
}

_QWORD *static SnippetGenerator.highlightedSnippetUsingTokens(tokens:in:inside:highlighting:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  uint64_t v8;
  NSRegularExpressionOptions v9;
  NSRegularExpression *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *result;
  _QWORD *v17;
  id v18;
  id v19;
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v31;
  id v32;
  char v33;
  id v34;
  id v35;
  id v36;
  _QWORD *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  const void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id v54;
  uint64_t KeyPath;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  void *v61;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t tokens;
  char v73;
  id v74;
  id v75;
  BOOL v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t aBlock;
  int v85;
  int v86;
  uint64_t (*v87)(uint64_t, void *);
  void *v88;
  void (*v89)(uint64_t, uint64_t, NSUInteger, NSUInteger, uint64_t, uint64_t, uint64_t);
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
  _QWORD v107[4];
  uint64_t v108;
  uint64_t v109;
  char v110;
  void *v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119[2];
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  double v126;
  double v127;
  double v128;
  double v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;

  v112 = 0;
  v111 = 0;
  v105 = 0;
  v106 = 0;
  v101 = 0;
  v102 = 0;
  v99 = 0;
  v100 = 0;
  v93 = 0;
  v94 = 0;
  v92 = 0;
  v80 = 0;
  v81 = 0;
  v77 = 0;
  v76 = 0;
  v131 = a1;
  v130 = a2;
  v126 = a5;
  v127 = a6;
  v128 = a7;
  v129 = a8;
  v124 = a3;
  v125 = a4;
  v123 = v8;
  sub_1D564C740(a2, a1, v119);
  v70 = v120;
  v71 = v121;
  tokens = v122;
  v117 = v119[0];
  v118 = v119[1];
  v115 = v120;
  v116 = v121;
  v114 = v122;
  swift_bridgeObjectRetain();
  v113 = tokens;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9AA190);
  sub_1D5595FB0();
  v73 = sub_1D5660194();
  sub_1D5565788();
  if ((v73 & 1) != 0 || (sub_1D565FEA0() & 1) != 0)
  {
    v29 = a2;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return a2;
  }
  sub_1D559DF64();
  sub_1D565FE64();
  v60 = sub_1D563387C();
  v112 = v60;
  sub_1D564CC94();
  swift_bridgeObjectRetain();
  v9 = sub_1D564C0D4();
  NSRegularExpression.init(tokens:options:)(v10, (Swift::OpaquePointer)tokens, v9);
  v61 = v11;
  if (v12)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (_QWORD *)v58;
  }
  v111 = v11;
  swift_bridgeObjectRetain();
  v53 = (id)sub_1D565FDF8();
  swift_bridgeObjectRelease();
  v107[2] = v70;
  v107[3] = v71;
  v54 = objc_msgSend(v61, sel_matchesInString_options_range_, v53, sub_1D564C14C(), v70, v71);

  sub_1D564CCF8();
  v107[1] = sub_1D565FF90();
  KeyPath = swift_getKeyPath();
  swift_retain();
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A94D8);
  v57 = type metadata accessor for _NSRange();
  v13 = sub_1D564CE7C();
  v59 = sub_1D556F498((void (*)(char *, char *))sub_1D564CE4C, KeyPath, v56, v57, MEMORY[0x1E0DEDCE8], v13, MEMORY[0x1E0DEDD18], v58);
  swift_release();
  swift_release();
  sub_1D5565788();

  v107[0] = v59;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A94E8);
  sub_1D564CF8C();
  sub_1D565FEF4();
  result = v107;
  sub_1D5565788();
  v51 = v108;
  v52 = v109;
  if ((v110 & 1) != 0)
  {
    v28 = a2;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return a2;
  }
  v105 = v108;
  v106 = v109;
  v103 = v108;
  v104 = v109;
  v136 = v108;
  v137 = v109;
  v50 = v108 + v109;
  v101 = 0;
  v102 = v108 + v109;
  if (__OFSUB__(v71, v108))
  {
    __break(1u);
  }
  else
  {
    v99 = v108;
    v100 = v71 - v108;
    v97 = v108;
    v98 = v109;
    v134 = v108;
    v135 = v109;
    v95 = v108;
    v96 = v109;
    v132 = v108;
    v133 = v109;
    if (!__OFSUB__(v71, v108 + v109))
    {
      v93 = v108 + v109;
      v94 = v71 - (v108 + v109);
      v48 = swift_allocObject();
      v92 = v48 + 16;
      *(_QWORD *)(v48 + 16) = v51;
      v49 = objc_msgSend(a2, sel_string);
      if (v49)
      {
        v47 = v49;
      }
      else
      {
        sub_1D5660620();
        __break(1u);
      }
      _s3__C18EnumerationOptionsVMa_0();
      sub_1D566077C();
      *v17 = 3;
      v17[1] = 256;
      sub_1D5571928();
      sub_1D556A930();
      sub_1D56604E8();
      v43 = v91;
      v18 = a2;
      v19 = v60;
      swift_retain();
      v42 = swift_allocObject();
      *(_QWORD *)(v42 + 16) = v51;
      *(_QWORD *)(v42 + 24) = v52;
      *(_QWORD *)(v42 + 32) = v51 + v52;
      *(_QWORD *)(v42 + 40) = v71 - (v51 + v52);
      *(_QWORD *)(v42 + 48) = a2;
      *(_QWORD *)(v42 + 56) = v69;
      *(_QWORD *)(v42 + 64) = v60;
      *(double *)(v42 + 72) = a5;
      *(double *)(v42 + 80) = a6;
      *(double *)(v42 + 88) = a7;
      *(double *)(v42 + 96) = a8;
      *(_QWORD *)(v42 + 104) = v48;
      v89 = sub_1D5652838;
      v90 = v42;
      aBlock = MEMORY[0x1E0C809B0];
      v85 = 1107296256;
      v86 = 0;
      v87 = sub_1D562ECC8;
      v88 = &block_descriptor_24;
      v44 = _Block_copy(&aBlock);
      swift_release();
      v82 = 0;
      v83 = v50;
      objc_msgSend(v47, sel_enumerateSubstringsInRange_options_usingBlock_, 0, v50, v43, v44);
      _Block_release(v44);

      swift_beginAccess();
      v45 = *(_QWORD *)(v48 + 16);
      swift_endAccess();
      swift_beginAccess();
      v46 = *(_QWORD *)(v48 + 16);
      result = (_QWORD *)swift_endAccess();
      if (!__OFSUB__(v71, v46))
      {
        v80 = v45;
        v81 = v71 - v46;
        v78 = v45;
        v79 = v71 - v46;
        v41 = objc_msgSend(a2, sel_attributedSubstringFromRange_, v45, v71 - v46);
        v77 = v41;
        v76 = v45 != 0;
        if (v45)
        {
          objc_msgSend(v41, (SEL)0x1F2A45948);
          v38 = objc_msgSend(v41, sel_attributesAtIndex_longestEffectiveRange_inRange_);
          type metadata accessor for Key();
          sub_1D556CA08();
          sub_1D565FCA8();

          sub_1D559B61C();
          v21 = v60;
          v74 = sub_1D564C098(v60);
          swift_bridgeObjectRetain();
          v40 = (id)sub_1D565FC9C();
          swift_bridgeObjectRelease();
          v22 = v74;
          v39 = objc_msgSend(v74, (SEL)0x1F2A45948);

          objc_msgSend(v74, sel_addAttributes_range_, v40, 0, v39);
          v23 = v74;
          v75 = v74;

          swift_bridgeObjectRelease();
        }
        else
        {
          v75 = 0;
        }
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9A9588);
        sub_1D566077C();
        v37 = v24;
        sub_1D559B584(&v75, v24);
        v25 = v41;
        v37[1] = v41;
        sub_1D5571928();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A94B0);
        sub_1D5652754();
        sub_1D565FEDC();
        sub_1D5565788();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A94A0);
        sub_1D5652634();
        v34 = sub_1D564C064();
        sub_1D561EF08();
        v35 = (id)Sequence<>.joined(by:matchingAttributes:)(v34);

        sub_1D5565788();
        v36 = (id)static SnippetGenerator.highlightingTokens(tokens:in:highlighting:)(tokens, v35, a3, a4);
        v32 = objc_msgSend(v36, sel_string);
        sub_1D565FE10();
        v33 = sub_1D565FEA0();
        swift_bridgeObjectRelease();

        if ((v33 & 1) != 0)
        {
          v26 = a2;
          v31 = a2;
        }
        else
        {
          v27 = v36;
          v31 = v36;
        }

        sub_1D5565D18(&v75);
        swift_release();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v31;
      }
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

void sub_1D5651080(uint64_t a1, uint64_t a2, NSUInteger a3, NSUInteger a4, uint64_t a5, uint64_t a6, uint64_t a7, NSUInteger a8, double a9, double a10, double a11, long double a12, NSUInteger a13, NSUInteger a14, NSUInteger a15, void *a16, uint64_t a17, void *a18, uint64_t a19)
{
  char v19;
  id v22;
  id v27;
  char v28;
  _BYTE v29[33];
  char v30;
  id v31;
  NSRange v32;
  id v33;
  NSRange v34;
  BOOL v35;
  NSRange v36;
  NSRange v37;
  NSUInteger v38;
  NSUInteger v39;
  NSRange v40;
  NSRange v41;
  NSRange v42;
  NSUInteger v43;
  NSUInteger v44;
  NSUInteger v45;
  NSUInteger v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  long double v51;
  void *v52;
  uint64_t v53;
  void *v54;
  NSUInteger v55;
  NSUInteger v56;
  NSUInteger v57;
  NSUInteger v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSUInteger v62;
  NSUInteger v63;
  uint64_t v64;
  uint64_t v65;
  NSRange v66;
  NSRange v67;
  NSRange v68;

  v64 = a1;
  v65 = a2;
  v62 = a3;
  v63 = a4;
  v60 = a5;
  v61 = a6;
  v59 = a7;
  v57 = a8;
  v58 = a13;
  v55 = a14;
  v56 = a15;
  v54 = a16;
  v53 = a17;
  v52 = a18;
  v48 = a9;
  v49 = a10;
  v50 = a11;
  v51 = a12;
  v47 = a19 + 16;
  v45 = a3;
  v46 = a4;
  v66.location = a3;
  v66.length = a4;
  v43 = a8;
  v44 = a13;
  v67.location = a8;
  v67.length = a13;
  v42 = NSUnionRange(v66, v67);
  v41 = v42;
  v40 = v42;
  v38 = a14;
  v39 = a15;
  v68.location = a14;
  v68.length = a15;
  v37 = NSUnionRange(v42, v68);
  v36 = v37;
  v35 = a3 != 0;
  v34 = v42;
  v22 = objc_msgSend(a16, (SEL)0x1F296919CLL, v42);
  v33 = v22;
  v32 = v37;
  v27 = objc_msgSend(a16, (SEL)0x1F296919CLL, v37.location, v37.length);
  v31 = v27;
  v30 = sub_1D5651414(v22, a18, a3 != 0, 0, a9, a10, a11, a12) & 1;
  v28 = sub_1D5651414(v27, a18, a3 != 0, 1, a9, a10, a11, a12);
  v29[25] = v28 & 1;
  if (v30)
    v19 = 0;
  else
    v19 = v28 ^ 1;
  if ((v19 & 1) != 0)
  {
    v29[0] = 1;
    sub_1D564C02C((uint64_t)v29, a7, MEMORY[0x1E0DEFC90]);

  }
  else
  {
    swift_beginAccess();
    *(_QWORD *)(a19 + 16) = v42.location;
    swift_endAccess();

  }
}

uint64_t sub_1D5651414(void *a1, void *a2, int a3, int a4, double a5, double a6, double a7, long double a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  double v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  CGFloat v40;
  double v41;
  _BOOL4 v42;
  uint64_t v43;
  double v44;
  double v45;
  int v46;
  uint64_t v47;
  id v48;
  double v49;
  double v50;
  double v51;
  long double v52;
  int v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  unint64_t v59;
  char *v60;
  int v61;
  void *v62;
  id v63;
  BOOL v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  double v69;
  double v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  double v74;
  id v75;
  uint64_t v76;
  char v77;
  __int128 v78;
  __int128 v79;
  char v80;
  uint64_t v81;
  void *v82;

  v62 = a1;
  v54 = a2;
  v61 = a3;
  v49 = a5;
  v50 = a6;
  v51 = a7;
  v52 = a8;
  v53 = a4;
  v82 = 0;
  v81 = 0;
  v80 = 0;
  v78 = 0u;
  v79 = 0u;
  v77 = 0;
  v76 = 0;
  v75 = 0;
  v71 = 0u;
  v72 = 0u;
  v70 = 0.0;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v64 = 0;
  v63 = 0;
  v55 = sub_1D5660734();
  v56 = *(_QWORD *)(v55 - 8);
  v57 = (*(_QWORD *)(v56 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v62);
  v58 = (char *)&v36 - v57;
  v59 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  v11 = MEMORY[0x1E0C80A78](v10);
  v60 = (char *)&v36 - v59;
  v82 = v12;
  v81 = v13;
  v80 = v14 & 1;
  *(double *)&v78 = v11;
  *((_QWORD *)&v78 + 1) = v15;
  *(_QWORD *)&v79 = v16;
  *((_QWORD *)&v79 + 1) = v17;
  v77 = v18 & 1;
  v76 = v8;
  v19 = v12;
  v75 = v62;
  if ((v61 & 1) != 0)
  {
    v47 = 0;
    sub_1D559B61C();
    v20 = v62;
    v48 = sub_1D564C098(v62);
    v63 = v48;
    objc_msgSend(v48, sel_insertAttributedString_atIndex_, v54, v47);
    v21 = v48;
    v22 = v75;
    v75 = v48;

  }
  objc_msgSend(v54, sel_size);
  v73 = v23;
  v74 = v24;
  sub_1D5651FA8(v54, v51, v24);
  v45 = v25;
  *(_QWORD *)&v71 = v26;
  *((_QWORD *)&v71 + 1) = v27;
  *(_QWORD *)&v72 = v28;
  *((double *)&v72 + 1) = v25;
  v70 = sub_1D5651DF0(v53 & 1);
  v44 = v51 * v70;
  (*(void (**)(char *, _QWORD, uint64_t))(v56 + 104))(v60, *MEMORY[0x1E0DED500], v55);
  v69 = v45;
  (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v58, v60, v55);
  result = (*(uint64_t (**)(char *, uint64_t))(v56 + 88))(v58, v55);
  v46 = result;
  if ((_DWORD)result == *MEMORY[0x1E0DED4F0])
  {
    v69 = round(v45);
    goto LABEL_17;
  }
  if (v46 == *MEMORY[0x1E0DED4E8])
  {
    v69 = rint(v45);
    goto LABEL_17;
  }
  if (v46 == *MEMORY[0x1E0DED500])
    goto LABEL_15;
  if (v46 == *MEMORY[0x1E0DED508])
  {
LABEL_16:
    v69 = floor(v45);
    goto LABEL_17;
  }
  if (v46 == *MEMORY[0x1E0DED4D8])
  {
    v69 = trunc(v45);
    goto LABEL_17;
  }
  if (v46 != *MEMORY[0x1E0DED4E0])
  {
    sub_1D56600F8();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v58, v55);
LABEL_17:
    v36 = v69;
    (*(void (**)(char *, uint64_t))(v56 + 8))(v60, v55);
    fmax(v52, v36);
    sub_1D566011C();
    v41 = v30;
    v40 = 0.0;
    v67 = 0uLL;
    *(double *)&v68 = v44;
    *((double *)&v68 + 1) = v30;
    v37 = v75;
    v31 = v75;
    sub_1D5651FA8(v37, v44, v41);
    *(_QWORD *)&v38 = v32;
    *((_QWORD *)&v38 + 1) = v33;
    *(_QWORD *)&v39 = v34;
    *((_QWORD *)&v39 + 1) = v35;

    v65 = v38;
    v66 = v39;
    v42 = sub_1D56520DC(*(CGFloat *)&v38, *((CGFloat *)&v38 + 1), *(CGFloat *)&v39, *((CGFloat *)&v39 + 1), v40, v40, v44, v41);
    v64 = v42;

    return v42;
  }
  v43 = *(_QWORD *)&v45 >> 63;
  if (v45 >= 0.0)
  {
LABEL_15:
    v69 = ceil(v45);
    goto LABEL_17;
  }
  if (v43 == 1)
    goto LABEL_16;
  __break(1u);
  return result;
}

id SnippetGenerator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SnippetGenerator.init()()
{
  void *v0;
  id v1;
  id v3;
  objc_super v4;
  id v5;

  v5 = v0;
  v4.receiver = v0;
  v4.super_class = (Class)swift_getObjectType();
  v3 = objc_msgSendSuper2(&v4, sel_init);
  v1 = v3;
  v5 = v3;

  return v3;
}

id SnippetGenerator.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D5651D74(double a1)
{
  char v3;

  if (0.5 == a1)
  {
    v3 = 0;
    return v3 & 1;
  }
  if (1.0 == a1)
  {
    v3 = 1;
    return v3 & 1;
  }
  return 2;
}

double sub_1D5651DF0(char a1)
{
  if ((a1 & 1) != 0)
    return 1.0;
  else
    return 0.5;
}

uint64_t sub_1D5651E30()
{
  sub_1D5652944();
  sub_1D5603384();
  return sub_1D56607A0() & 1;
}

uint64_t sub_1D5651E7C()
{
  sub_1D5652944();
  sub_1D558C95C();
  return sub_1D565FF60();
}

uint64_t sub_1D5651EBC()
{
  sub_1D5652944();
  sub_1D558C95C();
  return sub_1D565FF78();
}

uint64_t sub_1D5651F04()
{
  sub_1D5652944();
  sub_1D558C95C();
  return sub_1D565FF6C();
}

uint64_t sub_1D5651F4C@<X0>(double *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_1D5651D74(*a1);
  *a2 = result;
  return result;
}

void sub_1D5651F78(double *a1@<X8>)
{
  _BYTE *v1;

  *a1 = sub_1D5651DF0(*v1 & 1);
}

id sub_1D5651FA8(void *a1, double a2, double a3)
{
  _QWORD *v3;
  double v6;
  double v7;
  uint64_t v9;

  v6 = a2 * 2.0;
  v7 = a3 * 2.0;
  type metadata accessor for NSStringDrawingOptions();
  sub_1D566077C();
  *v3 = 1;
  v3[1] = 2;
  sub_1D5571928();
  sub_1D556AE58();
  sub_1D56604E8();
  return objc_msgSend(a1, sel_boundingRectWithSize_options_context_, v9, 0, v6, v7, *(_QWORD *)&a2);
}

BOOL sub_1D56520DC(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGRect v13;
  CGRect v14;

  v13.origin.x = a5;
  v13.origin.y = a6;
  v13.size.width = a7;
  v13.size.height = a8;
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  return CGRectContainsRect(v13, v14);
}

uint64_t sub_1D565216C@<X0>(uint64_t *a1@<X8>)
{
  return sub_1D564DA88(a1);
}

uint64_t sub_1D5652194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1D564D1F0(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_1D565219C()
{
  return swift_deallocObject();
}

void (*sub_1D56521C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))(char *, _QWORD)
{
  uint64_t v4;

  return sub_1D564DD58(a1, a2, a3, a4, *(_QWORD *)(v4 + 16));
}

uint64_t sub_1D56521CC()
{
  return swift_deallocObject();
}

uint64_t sub_1D56521F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1D564E108(a1, a2, a3, a4, *(uint64_t (**)(void))(v4 + 16));
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_1D565225C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1D56522A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1D564E20C(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), *(void **)(v4 + 32), *(void (**)(_QWORD, _QWORD, _QWORD))(v4 + 40), *(_QWORD *)(v4 + 48), *(_QWORD *)(v4 + 56));
}

uint64_t sub_1D56522E8()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_11_0(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_12_0()
{
  return swift_release();
}

Swift::Int sub_1D565236C@<X0>(__C::_NSRange *a1@<X0>, __C::_NSRange *a2@<X8>)
{
  uint64_t v2;

  return sub_1D564F988(a1, *(_QWORD *)(v2 + 32), a2);
}

unint64_t sub_1D565239C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1ED9A9508;
  if (!qword_1ED9A9508)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED9A94E8);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEAF50], v0);
    atomic_store(v1, (unint64_t *)&qword_1ED9A9508);
    return v1;
  }
  return v3;
}

unint64_t sub_1D565240C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1ED9A9778;
  if (!qword_1ED9A9778)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED9A9790);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEBF80], v0);
    atomic_store(v1, (unint64_t *)&qword_1ED9A9778);
    return v1;
  }
  return v3;
}

unint64_t sub_1D565247C()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  v4 = qword_1ED9A9528;
  if (!qword_1ED9A9528)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED9A9520);
    v0 = sub_1D5652504();
    v5[0] = MEMORY[0x1E0DEB458];
    v5[1] = v0;
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEB890], v3, v5);
    atomic_store(v1, (unint64_t *)&qword_1ED9A9528);
    return v1;
  }
  return v4;
}

unint64_t sub_1D5652504()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1ED9A93E0;
  if (!qword_1ED9A93E0)
  {
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEB440], MEMORY[0x1E0DEB418]);
    atomic_store(v0, (unint64_t *)&qword_1ED9A93E0);
    return v0;
  }
  return v2;
}

uint64_t sub_1D565256C(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1D564FECC(a1, v1[2], v1[3], v1[4]);
}

id sub_1D565259C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_1D565009C(*(id *)(v2 + 16), a1, a2);
}

unint64_t sub_1D56525C4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1ED9A9788;
  if (!qword_1ED9A9788)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED9A9790);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEBF88], v0);
    atomic_store(v1, (unint64_t *)&qword_1ED9A9788);
    return v1;
  }
  return v3;
}

unint64_t sub_1D5652634()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1ED9A94A8;
  if (!qword_1ED9A94A8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED9A94A0);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEAF38], v0);
    atomic_store(v1, (unint64_t *)&qword_1ED9A94A8);
    return v1;
  }
  return v3;
}

unint64_t sub_1D56526A4()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  v4 = qword_1ED9A9530;
  if (!qword_1ED9A9530)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED9A9520);
    v0 = sub_1D5652504();
    v5[0] = MEMORY[0x1E0DEB458];
    v5[1] = v0;
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEB8C0], v3, v5);
    atomic_store(v1, (unint64_t *)&qword_1ED9A9530);
    return v1;
  }
  return v4;
}

uint64_t sub_1D565272C@<X0>(BOOL *a1@<X8>)
{
  return sub_1D5650118(a1);
}

unint64_t sub_1D5652754()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1ED9A94B8;
  if (!qword_1ED9A94B8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED9A94B0);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEAF38], v0);
    atomic_store(v1, (unint64_t *)&qword_1ED9A94B8);
    return v1;
  }
  return v3;
}

uint64_t sub_1D56527C4()
{
  return swift_deallocObject();
}

uint64_t sub_1D56527EC()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_1D5652838(uint64_t a1, uint64_t a2, NSUInteger a3, NSUInteger a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  sub_1D5651080(a1, a2, a3, a4, a5, a6, a7, *(_QWORD *)(v7 + 16), *(double *)(v7 + 72), *(double *)(v7 + 80), *(double *)(v7 + 88), *(long double *)(v7 + 96), *(_QWORD *)(v7 + 24), *(_QWORD *)(v7 + 32), *(_QWORD *)(v7 + 40), *(void **)(v7 + 48), *(_QWORD *)(v7 + 56), *(void **)(v7 + 64), *(_QWORD *)(v7 + 104));
}

uint64_t block_copy_helper_22(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_23()
{
  return swift_release();
}

id sub_1D5652900(void *a1)
{
  void *v1;
  id v4;

  v4 = objc_msgSend(v1, sel_initWithAttributedString_);

  return v4;
}

unint64_t sub_1D5652944()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3ECA0;
  if (!qword_1EFF3ECA0)
  {
    v0 = MEMORY[0x1D82763B0](&unk_1D5674628, &unk_1E99E9EF0);
    atomic_store(v0, (unint64_t *)&qword_1EFF3ECA0);
    return v0;
  }
  return v2;
}

uint64_t type metadata accessor for SnippetGenerator()
{
  return objc_opt_self();
}

void *type metadata accessor for SnippetGenerator.SnippetPosition()
{
  return &unk_1E99E9EF0;
}

unint64_t sub_1D56529E8()
{
  return sub_1D56529FC();
}

unint64_t sub_1D56529FC()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3ECB8;
  if (!qword_1EFF3ECB8)
  {
    v0 = MEMORY[0x1D82763B0](&unk_1D5674600, &unk_1E99E9EF0);
    atomic_store(v0, (unint64_t *)&qword_1EFF3ECB8);
    return v0;
  }
  return v2;
}

unint64_t sub_1D5652A68()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1ED9A94F0;
  if (!qword_1ED9A94F0)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED9A94E8);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEAF20], v0);
    atomic_store(v1, (unint64_t *)&qword_1ED9A94F0);
    return v1;
  }
  return v3;
}

unint64_t sub_1D5652AD8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3ECC8;
  if (!qword_1EFF3ECC8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED9A94E8);
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0DEAF48], v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3ECC8);
    return v1;
  }
  return v3;
}

uint64_t sub_1D5652B48(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1D564FE28(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1D5652B78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (*(_QWORD *)(a1 + 24))
  {
    v2 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a2 + 24) = v2;
    (**(void (***)(void))(v2 - 8))();
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  }
  return a2;
}

uint64_t sub_1D5652BF0()
{
  return swift_deallocObject();
}

uint64_t String.height(width:font:)(void *a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  _QWORD *v11;
  id v12;
  unint64_t v13;
  id v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  double v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  double v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  int v51;
  double v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double v66;

  v38 = a4;
  v28 = a1;
  v27 = a2;
  v43 = a3;
  v66 = 0.0;
  v65 = 0;
  v63 = 0;
  v64 = 0;
  v61 = 0.0;
  v62 = 0.0;
  v53 = 0u;
  v54 = 0u;
  v32 = 0;
  v49 = sub_1D5660734();
  v48 = *(_QWORD *)(v49 - 8);
  v25 = (*(_QWORD *)(v48 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v28);
  v50 = (char *)&v23 - v25;
  v26 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = MEMORY[0x1E0C80A78](v5);
  v47 = (char *)&v23 - v26;
  v66 = v6;
  v65 = v7;
  v63 = v8;
  v64 = v9;
  sub_1D5660104();
  sub_1D566011C();
  v39 = v10;
  v61 = v38;
  v62 = v10;
  swift_bridgeObjectRetain();
  v42 = (id)sub_1D565FDF8();
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A8798);
  v40 = 1;
  v31 = sub_1D566077C();
  v29 = v11;
  sub_1D559B584(MEMORY[0x1E0DC1138], v11);
  v12 = v28;
  v13 = sub_1D559B5B8();
  v14 = v28;
  v15 = v29;
  v16 = v13;
  v17 = v31;
  v29[4] = v16;
  v15[1] = v14;
  sub_1D5571928();
  v33 = v17;
  v34 = type metadata accessor for Key();
  v36 = sub_1D556CA08();
  v35 = MEMORY[0x1E0DEE9B8] + 8;
  v37 = sub_1D565FCCC();
  v41 = (id)sub_1D565FC9C();
  swift_bridgeObjectRelease();
  v59 = v38;
  v60 = v39;
  objc_msgSend(v42, sel_boundingRectWithSize_options_attributes_context_, v40, v41, 0, v38, v39);
  v55 = v18;
  v56 = v19;
  v57 = v20;
  v58 = v21;
  *(_QWORD *)&v44 = v18;
  *((_QWORD *)&v44 + 1) = v19;
  *(_QWORD *)&v45 = v20;
  *((_QWORD *)&v45 + 1) = v21;

  swift_bridgeObjectRelease();
  v53 = v44;
  v54 = v45;
  v46 = sub_1D5589B2C(*(double *)&v44, *((double *)&v44 + 1), *(double *)&v45, *((double *)&v45 + 1));
  (*(void (**)(char *, _QWORD, uint64_t))(v48 + 104))(v47, *MEMORY[0x1E0DED500], v49);
  v52 = v46;
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v50, v47, v49);
  result = (*(uint64_t (**)(char *, uint64_t))(v48 + 88))(v50, v49);
  v51 = result;
  if ((_DWORD)result == *MEMORY[0x1E0DED4F0])
  {
    v52 = round(v46);
    goto LABEL_15;
  }
  if (v51 == *MEMORY[0x1E0DED4E8])
  {
    v52 = rint(v46);
    goto LABEL_15;
  }
  if (v51 == *MEMORY[0x1E0DED500])
    goto LABEL_13;
  if (v51 == *MEMORY[0x1E0DED508])
  {
LABEL_14:
    v52 = floor(v46);
    goto LABEL_15;
  }
  if (v51 == *MEMORY[0x1E0DED4D8])
  {
    v52 = trunc(v46);
    goto LABEL_15;
  }
  if (v51 != *MEMORY[0x1E0DED4E0])
  {
    sub_1D56600F8();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v50, v49);
LABEL_15:
    v23 = v52;
    return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v47, v49);
  }
  v24 = *(_QWORD *)&v46 >> 63;
  if (v46 >= 0.0)
  {
LABEL_13:
    v52 = ceil(v46);
    goto LABEL_15;
  }
  if (v24 == 1)
    goto LABEL_14;
  __break(1u);
  return result;
}

uint64_t String.partiallyRedactedSubjectOrSummary.getter()
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;

  v1 = (id)objc_opt_self();
  swift_bridgeObjectRetain();
  v2 = (id)sub_1D565FDF8();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_ec_partiallyRedactedStringForSubjectOrSummary_, v2);

  v4 = sub_1D565FE10();
  return v4;
}

uint64_t String.redactedQueryString.getter()
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;

  v1 = (id)objc_opt_self();
  swift_bridgeObjectRetain();
  v2 = (id)sub_1D565FDF8();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_redactedQueryStringForQueryString_, v2);

  v4 = sub_1D565FE10();
  return v4;
}

uint64_t String.partiallyRedactedString.getter()
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;

  v1 = (id)objc_opt_self();
  swift_bridgeObjectRetain();
  v2 = (id)sub_1D565FDF8();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_partiallyRedactedStringForString_, v2);

  v4 = sub_1D565FE10();
  return v4;
}

uint64_t String.partiallyRedactedAddress.getter()
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v4 = (void *)sub_1D565FDF8();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v3, sel_ec_partiallyRedactedStringForAddress_localPart_domain_, v4, 0);

  if (!v5)
    return 0;
  v1 = sub_1D565FE10();

  return v1;
}

uint64_t *sub_1D565348C()
{
  if (qword_1ED9A92B0 != -1)
    swift_once();
  return &qword_1ED9A92A0;
}

uint64_t TitleAndButtonSupplementaryView_iOS.Model.title.getter()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t TitleAndButtonSupplementaryView_iOS.Model.buttonConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *(int *)(type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model() + 20);
  v2 = sub_1D56603BC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v1 + v4);
}

void *TitleAndButtonSupplementaryView_iOS.Model.buttonAction.getter()
{
  uint64_t v0;
  id v1;
  void *v3;

  v3 = *(void **)(v0 + *(int *)(type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model() + 24));
  v1 = v3;
  return v3;
}

uint64_t TitleAndButtonSupplementaryView_iOS.Model.init(title:buttonConfiguration:buttonAction:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, char *a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  char *v16;
  char *v17;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;

  v25 = a5;
  v22 = a1;
  v30 = a2;
  v28 = a3;
  v26 = a4;
  v36 = 0;
  v34 = 0;
  v35 = 0;
  v33 = 0;
  v32 = 0;
  v19 = 0;
  v29 = sub_1D56603BC();
  v27 = *(_QWORD *)(v29 - 8);
  v20 = (*(_QWORD *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v23 = (char *)&v19 - v20;
  v24 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  v21 = (*(_QWORD *)(*(_QWORD *)(v24 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v30);
  v31 = (uint64_t *)((char *)&v19 - v21);
  v36 = (char *)&v19 - v21;
  v34 = v5;
  v35 = v6;
  v33 = v7;
  v32 = v8;
  swift_bridgeObjectRetain();
  v9 = v23;
  v10 = v27;
  v11 = v28;
  v12 = v29;
  v13 = v30;
  v14 = v31;
  *v31 = v22;
  v14[1] = v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v9, v11, v12);
  (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))((uint64_t)v31 + *(int *)(v24 + 20), v23, v29);
  v15 = v26;
  v16 = v25;
  v17 = (char *)v31;
  *(_QWORD *)((char *)v31 + *(int *)(v24 + 24)) = v26;
  sub_1D5653FB8(v17, v16);

  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v28, v29);
  swift_bridgeObjectRelease();
  return sub_1D565407C((uint64_t)v31);
}

uint64_t TitleAndButtonSupplementaryView_iOS.model.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_model);
  swift_beginAccess();
  sub_1D56540F8(v3, a1);
  return swift_endAccess();
}

void sub_1D56537C0(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  char **v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  _QWORD *v9;
  _OWORD *v10;
  id v11;
  char v12;
  char *v13;

  v10 = a2;
  v4 = a1;
  v5 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A99C0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v4);
  v9 = (uint64_t *)((char *)&v4 - v5);
  v6 = *v2;
  v3 = v6;
  v13 = v6;
  v11 = v6;
  v7 = &v6[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_model];
  v8 = &v12;
  swift_beginAccess();
  sub_1D56540F8(v7, v9);
  swift_endAccess();
  sub_1D5655BE4(v9, v10);

}

void sub_1D5653898(uint64_t a1, id *a2)
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = a1;
  v7 = a2;
  v6 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A99C0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v5);
  v9 = (uint64_t)&v4 - v6;
  sub_1D56540F8(v2, (uint64_t *)((char *)&v4 - v6));
  v8 = *v7;
  v3 = v8;
  v11 = v8;
  v10 = v8;
  TitleAndButtonSupplementaryView_iOS.model.setter(v9);

}

uint64_t TitleAndButtonSupplementaryView_iOS.model.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  unint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;

  v8 = a1;
  v11 = 0;
  v10 = 0;
  v4 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A99C0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v8);
  v5 = (unint64_t *)((char *)&v4 - v4);
  v11 = v2;
  v10 = v1;
  sub_1D56540F8(v2, (unint64_t *)((char *)&v4 - v4));
  v6 = (_QWORD *)(v1 + OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_model);
  v7 = &v9;
  swift_beginAccess();
  sub_1D5654230(v5, v6);
  swift_endAccess();
  sub_1D5653A08();
  return sub_1D5654440(v8);
}

void sub_1D5653A08()
{
  TitleAndButtonSupplementaryView_iOS.configure()();
}

Swift::Void __swiftcall TitleAndButtonSupplementaryView_iOS.configure()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  char *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  unint64_t v33;
  char *v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  _QWORD *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char *v45;

  v45 = 0;
  v44 = 0;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9B88);
  v33 = (*(_QWORD *)(*(_QWORD *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v1);
  v34 = (char *)&v8 - v33;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A99C0);
  v35 = (*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v2);
  v41 = (char *)&v8 - v35;
  v42 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  v40 = *(_QWORD *)(v42 - 8);
  v36 = (*(_QWORD *)(v40 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v42);
  v37 = (char *)&v8 - v36;
  v45 = (char *)&v8 - v36;
  v44 = v0;
  v38 = (_QWORD *)(v0 + OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_model);
  v39 = &v43;
  swift_beginAccess();
  sub_1D56540F8(v38, v41);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v41, 1, v42) == 1)
  {
    sub_1D5654440((uint64_t)v41);
  }
  else
  {
    sub_1D56544E8(v41, v37);
    v29 = *(id *)&v32[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_label];
    v3 = v29;
    v30 = *(_QWORD *)v37;
    v31 = *((_QWORD *)v37 + 1);
    swift_bridgeObjectRetain();
    if (v31)
    {
      v27 = v30;
      v28 = v31;
      v24 = v31;
      v25 = sub_1D565FDF8();
      swift_bridgeObjectRelease();
      v26 = (void *)v25;
    }
    else
    {
      v26 = 0;
    }
    v21 = v26;
    objc_msgSend(v29, sel_setText_);

    v4 = v32;
    v22 = *(_QWORD *)v37;
    v23 = *((_QWORD *)v37 + 1);
    swift_bridgeObjectRetain();
    if (v23)
    {
      v19 = v22;
      v20 = v23;
      v16 = v23;
      v17 = sub_1D565FDF8();
      swift_bridgeObjectRelease();
      v18 = v17;
    }
    else
    {
      v18 = 0;
    }
    objc_msgSend(v32, sel_setAccessibilityLabel_, v18);

    v13 = &qword_1ED9A9000;
    v12 = *(id *)&v32[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_button];
    v5 = v12;
    v9 = &v37[*(int *)(v42 + 20)];
    v11 = sub_1D56603BC();
    v10 = *(_QWORD *)(v11 - 8);
    (*(void (**)(char *, char *))(v10 + 16))(v34, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v34, 0, 1, v11);
    sub_1D56603D4();

    v15 = *(id *)&v32[v13[108]];
    v6 = v15;
    v14 = *(id *)&v37[*(int *)(v42 + 24)];
    v7 = v14;
    objc_msgSend(v15, sel_addAction_forControlEvents_, v14, 64);

    sub_1D565407C((uint64_t)v37);
  }
}

void (*TitleAndButtonSupplementaryView_iOS.model.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D5653EB0;
}

void sub_1D5653EB0(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    sub_1D5653A08();
  }
}

uint64_t sub_1D5653EFC()
{
  uint64_t result;
  uint64_t v1;

  type metadata accessor for TitleAndButtonSupplementaryView_iOS();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9378);
  result = sub_1D565FE34();
  qword_1ED9A92A0 = result;
  qword_1ED9A92A8 = v1;
  return result;
}

uint64_t type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model()
{
  uint64_t v1;

  v1 = qword_1ED9A92B8;
  if (!qword_1ED9A92B8)
    return swift_getSingletonMetadata();
  return v1;
}

char *sub_1D5653FB8(char *a1, char *a2)
{
  uint64_t v2;
  id v3;
  char *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void *v10;

  *(_QWORD *)a2 = *(_QWORD *)a1;
  v5 = *((_QWORD *)a1 + 1);
  swift_bridgeObjectRetain();
  *((_QWORD *)a2 + 1) = v5;
  v7 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  v6 = *(int *)(v7 + 20);
  v2 = sub_1D56603BC();
  (*(void (**)(char *, char *))(*(_QWORD *)(v2 - 8) + 16))(&a2[v6], &a1[v6]);
  v9 = *(int *)(v7 + 24);
  v10 = *(void **)&a1[v9];
  v3 = v10;
  result = a2;
  *(_QWORD *)&a2[v9] = v10;
  return result;
}

uint64_t sub_1D565407C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v4 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  v3 = *(int *)(v4 + 20);
  v1 = sub_1D56603BC();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(a1 + v3);

  return a1;
}

_QWORD *sub_1D56540F8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v13;
  uint64_t v14;

  v13 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t))(v14 + 48))(a1, 1))
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A99C0);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  else
  {
    *a2 = *a1;
    v6 = a1[1];
    swift_bridgeObjectRetain();
    a2[1] = v6;
    v8 = (char *)a2 + *(int *)(v13 + 20);
    v7 = (char *)a1 + *(int *)(v13 + 20);
    v2 = sub_1D56603BC();
    (*(void (**)(char *, char *))(*(_QWORD *)(v2 - 8) + 16))(v8, v7);
    v9 = *(int *)(v13 + 24);
    v10 = *(void **)((char *)a1 + v9);
    v3 = v10;
    *(_QWORD *)((char *)a2 + v9) = v10;
    (*(void (**)(void))(v14 + 56))();
  }
  return a2;
}

_QWORD *sub_1D5654230(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  void **v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(_QWORD *, uint64_t, uint64_t);

  v15 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v16 + 48);
  if (((unsigned int (*)(_QWORD *, uint64_t))v17)(a2, 1))
  {
    if (v17(a1, 1, v15))
    {
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A99C0);
      memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
    }
    else
    {
      *(_OWORD *)a2 = *(_OWORD *)a1;
      v10 = (char *)a2 + *(int *)(v15 + 20);
      v9 = (char *)a1 + *(int *)(v15 + 20);
      v6 = sub_1D56603BC();
      (*(void (**)(char *, char *))(*(_QWORD *)(v6 - 8) + 32))(v10, v9);
      *(_QWORD *)((char *)a2 + *(int *)(v15 + 24)) = *(_QWORD *)((char *)a1 + *(int *)(v15 + 24));
      (*(void (**)(void))(v16 + 56))();
    }
  }
  else if (v17(a1, 1, v15))
  {
    sub_1D565407C((uint64_t)a2);
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A99C0);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
  }
  else
  {
    *a2 = *a1;
    a2[1] = a1[1];
    swift_bridgeObjectRelease();
    v12 = (char *)a2 + *(int *)(v15 + 20);
    v11 = (char *)a1 + *(int *)(v15 + 20);
    v2 = sub_1D56603BC();
    (*(void (**)(char *, char *))(*(_QWORD *)(v2 - 8) + 40))(v12, v11);
    v3 = (void **)((char *)a2 + *(int *)(v15 + 24));
    v4 = *v3;
    *v3 = *(void **)((char *)a1 + *(int *)(v15 + 24));

  }
  return a2;
}

uint64_t sub_1D5654440(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v5;

  v5 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(a1, 1))
  {
    swift_bridgeObjectRelease();
    v3 = a1 + *(int *)(v5 + 20);
    v1 = sub_1D56603BC();
    (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v3);

  }
  return a1;
}

char *sub_1D56544E8(char *a1, char *a2)
{
  uint64_t v2;
  char *result;
  uint64_t v4;
  uint64_t v5;

  *(_OWORD *)a2 = *(_OWORD *)a1;
  v5 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  v4 = *(int *)(v5 + 20);
  v2 = sub_1D56603BC();
  (*(void (**)(char *, char *))(*(_QWORD *)(v2 - 8) + 32))(&a2[v4], &a1[v4]);
  result = a2;
  *(_QWORD *)&a2[*(int *)(v5 + 24)] = *(_QWORD *)&a1[*(int *)(v5 + 24)];
  return result;
}

uint64_t type metadata accessor for TitleAndButtonSupplementaryView_iOS()
{
  uint64_t v1;

  v1 = qword_1ED9A9368;
  if (!qword_1ED9A9368)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t static TitleAndButtonSupplementaryView_iOS.reuseIdentifier.getter()
{
  uint64_t v1;

  v1 = *sub_1D565348C();
  swift_bridgeObjectRetain();
  return v1;
}

id TitleAndButtonSupplementaryView_iOS.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id TitleAndButtonSupplementaryView_iOS.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  objc_class *ObjectType;
  __int128 v24;
  __int128 v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  objc_super v30;
  __int128 v31;
  __int128 v32;
  id v33;

  *(double *)&v24 = a1;
  *((double *)&v24 + 1) = a2;
  *(double *)&v25 = a3;
  *((double *)&v25 + 1) = a4;
  ObjectType = (objc_class *)swift_getObjectType();
  v31 = v24;
  v32 = v25;
  v5 = v4;
  v6 = v4;
  v7 = v4;
  v8 = v4;
  v33 = v4;
  v18 = OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_model;
  v9 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(&v4[v18], 1);

  v19 = OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_label;
  sub_1D559C8F0();
  *(_QWORD *)&v22[v19] = sub_1D556CE74();

  v20 = OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_button;
  sub_1D55E0348();
  *(_QWORD *)&v22[v20] = sub_1D556CE74();

  v21 = OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView;
  sub_1D55E336C();
  *(_QWORD *)&v22[v21] = sub_1D556CE74();

  v30.receiver = v33;
  v30.super_class = ObjectType;
  v28 = objc_msgSendSuper2(&v30, sel_initWithFrame_, v24, v25);
  v10 = v28;
  v11 = v28;
  v12 = v28;
  v13 = v28;
  v14 = v28;
  v33 = v28;
  TitleAndButtonSupplementaryView_iOS.setupLayout()();

  v26 = (id)*MEMORY[0x1E0D46BA8];
  v15 = (id)*MEMORY[0x1E0D46BA8];
  sub_1D565FE10();
  v27 = (id)sub_1D565FDF8();
  swift_bridgeObjectRelease();

  objc_msgSend(v28, sel_setAccessibilityIdentifier_, v27);
  type metadata accessor for UIAccessibilityTraits();
  sub_1D566077C();
  *v16 = *MEMORY[0x1E0DC4670];
  sub_1D5571928();
  sub_1D5654FF8();
  sub_1D56604E8();
  objc_msgSend(v28, sel_setAccessibilityTraits_, v29);

  objc_msgSend(v28, sel_setIsAccessibilityElement_, 1);
  return v28;
}

Swift::Void __swiftcall TitleAndButtonSupplementaryView_iOS.setupLayout()()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  id v13;
  char *v14;
  id v15;
  char *v16;
  id v17;
  char *v18;
  id v19;
  char *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  char *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD *v55;
  void *v56;
  void *v57;
  id v58;

  v21 = *(id *)(v0 + OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView);
  v1 = v21;
  objc_msgSend(v50, sel_addSubview_, v21);

  sub_1D55E33D0();
  v58 = sub_1D556CE74();
  v23 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  v2 = v23;
  v22 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_label];
  v3 = v22;
  objc_msgSend(v23, (SEL)0x1F37ACD51, v22);

  v24 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  v4 = v24;
  objc_msgSend(v24, (SEL)0x1F37ACD51, v58);

  v25 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  v5 = v25;
  objc_msgSend(v25, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v26 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  v6 = v26;
  objc_msgSend(v26, sel_setAxis_, 0);

  v27 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  v7 = v27;
  objc_msgSend(v27, sel_setDistribution_, 0);

  v28 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  v8 = v28;
  objc_msgSend(v28, sel_setAlignment_, 2);

  v29 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  v9 = v29;
  objc_msgSend(v29, sel_setSpacing_, 1.17549435e-38);

  v33 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_label];
  v10 = v33;
  v30 = (id)objc_opt_self();
  v31 = (id)*MEMORY[0x1E0DC4AD0];
  v11 = (id)*MEMORY[0x1E0DC4AD0];
  v32 = objc_msgSend(v30, sel_preferredFontForTextStyle_, v31);

  UILabel.contentSizeAdjustingFont(_:)((UIFont)v32);
  v56 = (void *)objc_opt_self();
  sub_1D559C4E0();
  sub_1D566077C();
  v55 = v12;
  v34 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  v13 = v34;
  v37 = objc_msgSend(v34, (SEL)0x1F38436F4);

  v14 = v50;
  v35 = objc_msgSend(v50, (SEL)0x1F37EFED5);

  v36 = objc_msgSend(v35, (SEL)0x1F38436F4);
  v38 = objc_msgSend(v37, (SEL)0x1F37BEF4ELL, v36);

  *v55 = v38;
  v39 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  v15 = v39;
  v42 = objc_msgSend(v39, (SEL)0x1F37B738DLL);

  v16 = v50;
  v40 = objc_msgSend(v50, (SEL)0x1F37EFED5);

  v41 = objc_msgSend(v40, (SEL)0x1F37B738DLL);
  v43 = objc_msgSend(v42, (SEL)0x1F37BEF4ELL, v41);

  v55[1] = v43;
  v44 = *(void **)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  v17 = v44;
  v47 = objc_msgSend(v44, (SEL)0x1F37F0136);

  v18 = v50;
  v45 = objc_msgSend(v50, (SEL)0x1F380C31BLL);

  v46 = objc_msgSend(v45, (SEL)0x1F37F0136);
  v48 = objc_msgSend(v47, (SEL)0x1F37BEF4ELL, v46);

  v55[2] = v48;
  v49 = *(void **)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  v19 = v49;
  v53 = objc_msgSend(v49, (SEL)0x1F3844648);

  v20 = v50;
  v51 = objc_msgSend(v50, (SEL)0x1F380C31BLL);

  v52 = objc_msgSend(v51, (SEL)0x1F3844648);
  v54 = objc_msgSend(v53, (SEL)0x1F37BEF4ELL, v52);

  v55[3] = v54;
  sub_1D5571928();
  v57 = (void *)sub_1D565FF84();
  swift_bridgeObjectRelease();
  objc_msgSend(v56, sel_activateConstraints_, v57);

}

unint64_t sub_1D5654FF8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1ED9A9B00;
  if (!qword_1ED9A9B00)
  {
    v0 = type metadata accessor for UIAccessibilityTraits();
    v1 = MEMORY[0x1D82763B0](MEMORY[0x1E0DC2D38], v0);
    atomic_store(v1, (unint64_t *)&qword_1ED9A9B00);
    return v1;
  }
  return v3;
}

void sub_1D56550B0()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;

  v1 = v0;
  v2 = v0;
  v3 = v0;
  v4 = v0;
  v6 = OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_model;
  v5 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(&v0[v6], 1);

  v7 = OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_label;
  sub_1D559C8F0();
  *(_QWORD *)&v10[v7] = sub_1D556CE74();

  v8 = OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_button;
  sub_1D55E0348();
  *(_QWORD *)&v10[v8] = sub_1D556CE74();

  v9 = OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView;
  sub_1D55E336C();
  *(_QWORD *)&v10[v9] = sub_1D556CE74();

  sub_1D565FE64();
  sub_1D566062C();
  __break(1u);
}

id TitleAndButtonSupplementaryView_iOS.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1D5655338(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  sub_1D56537C0(a1, a2);
}

void sub_1D565534C(uint64_t a1, id *a2)
{
  sub_1D5653898(a1, a2);
}

uint64_t sub_1D5655360()
{
  return type metadata accessor for TitleAndButtonSupplementaryView_iOS();
}

uint64_t sub_1D5655378()
{
  unint64_t v0;
  uint64_t updated;

  updated = sub_1D5655450();
  if (v0 <= 0x3F)
  {
    updated = swift_updateClassMetadata2();
    if (!updated)
      return 0;
  }
  return updated;
}

uint64_t sub_1D5655450()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v3;
  uint64_t v4;

  v4 = qword_1ED9A92F8;
  if (!qword_1ED9A92F8)
  {
    type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
    v3 = sub_1D566041C();
    v4 = v3;
    if (!v0)
    {
      v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_1ED9A92F8);
      return v1;
    }
  }
  return v4;
}

unint64_t initializeBufferWithCopyOfBuffer for TitleAndButtonSupplementaryView_iOS.Model(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v16;

  v16 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v16 & 0x20000) != 0)
  {
    v11 = *a2;
    swift_retain();
    *a1 = v11;
    return *a1 + ((v16 + 16) & ~(unint64_t)v16);
  }
  else
  {
    *a1 = *a2;
    v6 = a2[1];
    swift_bridgeObjectRetain();
    a1[1] = v6;
    v8 = (char *)a1 + *(int *)(a3 + 20);
    v7 = (char *)a2 + *(int *)(a3 + 20);
    v3 = sub_1D56603BC();
    (*(void (**)(char *, char *))(*(_QWORD *)(v3 - 8) + 16))(v8, v7);
    v9 = *(int *)(a3 + 24);
    v10 = *(void **)((char *)a2 + v9);
    v4 = v10;
    *(uint64_t *)((char *)a1 + v9) = (uint64_t)v10;
    return (unint64_t)a1;
  }
}

void destroy for TitleAndButtonSupplementaryView_iOS.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  swift_bridgeObjectRelease();
  v3 = *(int *)(a2 + 20);
  v2 = sub_1D56603BC();
  (*(void (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1 + v3);

}

char *initializeWithCopy for TitleAndButtonSupplementaryView_iOS.Model(char *a1, char *a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  char *result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  void *v11;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  *((_QWORD *)a1 + 1) = v6;
  v7 = *(int *)(a3 + 20);
  v3 = sub_1D56603BC();
  (*(void (**)(char *, char *))(*(_QWORD *)(v3 - 8) + 16))(&a1[v7], &a2[v7]);
  v10 = *(int *)(a3 + 24);
  v11 = *(void **)&a2[v10];
  v4 = v11;
  result = a1;
  *(_QWORD *)&a1[v10] = v11;
  return result;
}

char *assignWithCopy for TitleAndButtonSupplementaryView_iOS.Model(char *a1, char *a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  void *v12;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v7 = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  *((_QWORD *)a1 + 1) = v7;
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 20);
  v3 = sub_1D56603BC();
  (*(void (**)(char *, char *))(*(_QWORD *)(v3 - 8) + 24))(&a1[v8], &a2[v8]);
  v11 = *(int *)(a3 + 24);
  v12 = *(void **)&a2[v11];
  v4 = v12;
  v5 = *(void **)&a1[v11];
  *(_QWORD *)&a1[v11] = v12;

  return a1;
}

char *initializeWithTake for TitleAndButtonSupplementaryView_iOS.Model(char *a1, char *a2, uint64_t a3)
{
  uint64_t v3;
  char *result;
  uint64_t v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v5 = *(int *)(a3 + 20);
  v3 = sub_1D56603BC();
  (*(void (**)(char *, char *))(*(_QWORD *)(v3 - 8) + 32))(&a1[v5], &a2[v5]);
  result = a1;
  *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
  return result;
}

char *assignWithTake for TitleAndButtonSupplementaryView_iOS.Model(char *a1, char *a2, uint64_t a3)
{
  uint64_t v3;
  void **v4;
  void *v5;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v3 = sub_1D56603BC();
  (*(void (**)(char *, char *))(*(_QWORD *)(v3 - 8) + 40))(&a1[v7], &a2[v7]);
  v4 = (void **)&a1[*(int *)(a3 + 24)];
  v5 = *v4;
  *v4 = *(void **)&a2[*(int *)(a3 + 24)];

  return a1;
}

uint64_t getEnumTagSinglePayload for TitleAndButtonSupplementaryView_iOS.Model()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D565595C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  int v4;
  unsigned int v5;
  uint64_t v9;
  uint64_t v10;

  v9 = sub_1D56603BC();
  v10 = *(_QWORD *)(v9 - 8);
  if (a2 == *(_DWORD *)(v10 + 84))
  {
    return (*(unsigned int (**)(uint64_t, _QWORD, uint64_t))(v10 + 48))(a1 + *(int *)(a3 + 20), a2, v9);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    v4 = -1;
    if (*(_QWORD *)(a1 + *(int *)(a3 + 24)) < 0x100000000uLL)
      v4 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
    return (v4 + 1);
  }
  else
  {
    __break(1u);
  }
  return v5;
}

uint64_t storeEnumTagSinglePayload for TitleAndButtonSupplementaryView_iOS.Model()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D5655A60(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1D56603BC();
  v9 = *(_QWORD *)(result - 8);
  if (a3 == *(_DWORD *)(v9 + 84))
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  if (a3 == 0x7FFFFFFF)
    *(_QWORD *)(a1 + *(int *)(a4 + 24)) = a2 - 1;
  else
    __break(1u);
  return result;
}

uint64_t sub_1D5655B1C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = sub_1D56603BC();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

_OWORD *sub_1D5655BE4(_OWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v5;
  char *v6;
  uint64_t v9;
  uint64_t v10;

  v9 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t))(v10 + 48))(a1, 1))
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A99C0);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
  }
  else
  {
    *a2 = *a1;
    v6 = (char *)a2 + *(int *)(v9 + 20);
    v5 = (char *)a1 + *(int *)(v9 + 20);
    v2 = sub_1D56603BC();
    (*(void (**)(char *, char *))(*(_QWORD *)(v2 - 8) + 32))(v6, v5);
    *(_QWORD *)((char *)a2 + *(int *)(v9 + 24)) = *(_QWORD *)((char *)a1 + *(int *)(v9 + 24));
    (*(void (**)(void))(v10 + 56))();
  }
  return a2;
}

uint64_t *sub_1D5655CE8()
{
  if (qword_1ED9A91B8 != -1)
    swift_once();
  return &qword_1ED9A91A8;
}

uint64_t TitleSupplementaryView.title.getter()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_title);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

void sub_1D5655DAC(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v3 = (char *)*a1;
  v2 = *a1;
  v4 = &v3[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_title];
  swift_beginAccess();
  v5 = *(_QWORD *)v4;
  v7 = *((_QWORD *)v4 + 1);
  swift_bridgeObjectRetain();
  swift_endAccess();
  *a2 = v5;
  a2[1] = v7;

}

void sub_1D5655E48(_QWORD *a1, id *a2)
{
  id v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  sub_1D558B990(a1, v7);
  v6 = v7[0];
  v5 = v7[1];
  v4 = *a2;
  v2 = *a2;
  TitleSupplementaryView.title.setter(v6, v5);

}

uint64_t TitleSupplementaryView.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  swift_bridgeObjectRetain();
  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_title);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  sub_1D5655F54();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D5655F54()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_title);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  sub_1D5655FD0(v3, v4);
  return swift_bridgeObjectRelease();
}

void sub_1D5655FD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v10 = *(void **)(v2 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label);
  v3 = v10;
  swift_bridgeObjectRetain();
  if (a2)
  {
    v7 = sub_1D565FDF8();
    swift_bridgeObjectRelease();
    v8 = (void *)v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v10, sel_setText_);

  v4 = v9;
  swift_bridgeObjectRetain();
  if (a2)
  {
    v5 = sub_1D565FDF8();
    swift_bridgeObjectRelease();
    v6 = (void *)v5;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v9, sel_setAccessibilityLabel_);

}

uint64_t (*TitleSupplementaryView.title.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D56561A0;
}

uint64_t sub_1D56561A0(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return swift_endAccess();
  swift_endAccess();
  return sub_1D5655F54();
}

double TitleSupplementaryView.horizontalPadding.getter()
{
  uint64_t v0;
  double *v2;
  double v3;

  v2 = (double *)(v0 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_horizontalPadding);
  swift_beginAccess();
  v3 = *v2;
  swift_endAccess();
  return v3;
}

void sub_1D565624C(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  char *v3;
  char *v4;
  uint64_t v6;

  v3 = (char *)*a1;
  v2 = *a1;
  v4 = &v3[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_horizontalPadding];
  swift_beginAccess();
  v6 = *(_QWORD *)v4;
  swift_endAccess();
  *a2 = v6;

}

void sub_1D56562D4(double *a1, id *a2)
{
  id v2;
  id v3;
  double v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  TitleSupplementaryView.horizontalPadding.setter(v4);

}

void TitleSupplementaryView.horizontalPadding.setter(double a1)
{
  uint64_t v1;
  double *v2;

  v2 = (double *)(v1 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_horizontalPadding);
  swift_beginAccess();
  *v2 = a1;
  swift_endAccess();
  sub_1D5656394();
}

void sub_1D5656394()
{
  sub_1D56563BC();
}

void sub_1D56563BC()
{
  uint64_t v0;
  id v1;
  id v2;
  double *v3;
  double v4;
  id v5;
  id *v6;
  double *v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v11 = OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_leadingConstraint;
  v12 = (_QWORD *)(v0 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_leadingConstraint);
  swift_beginAccess();
  if (*v12)
  {
    v9 = *(id *)(v10 + v11);
    v1 = v9;
    swift_endAccess();
    v7 = (double *)(v10 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_horizontalPadding);
    swift_beginAccess();
    v8 = *v7;
    swift_endAccess();
    objc_msgSend(v9, sel_setConstant_, v8);

  }
  else
  {
    swift_endAccess();
  }
  v6 = (id *)(v10 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_trailingConstraint);
  swift_beginAccess();
  if (*v6)
  {
    v5 = *v6;
    v2 = *v6;
    swift_endAccess();
    v3 = (double *)(v10 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_horizontalPadding);
    swift_beginAccess();
    v4 = *v3;
    swift_endAccess();
    objc_msgSend(v5, sel_setConstant_, v4);

  }
  else
  {
    swift_endAccess();
  }
}

void (*TitleSupplementaryView.horizontalPadding.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D56565C4;
}

void sub_1D56565C4(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    sub_1D5656394();
  }
}

uint64_t sub_1D5656610()
{
  uint64_t result;
  uint64_t v1;

  type metadata accessor for TitleSupplementaryView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A91C0);
  result = sub_1D565FE34();
  qword_1ED9A91A8 = result;
  qword_1ED9A91B0 = v1;
  return result;
}

uint64_t type metadata accessor for TitleSupplementaryView()
{
  return objc_opt_self();
}

uint64_t static TitleSupplementaryView.reuseIdentifier.getter()
{
  uint64_t v1;

  v1 = *sub_1D5655CE8();
  swift_bridgeObjectRetain();
  return v1;
}

id TitleSupplementaryView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id TitleSupplementaryView.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  uint64_t v19;
  objc_class *ObjectType;
  __int128 v21;
  __int128 v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  id v30;

  *(double *)&v21 = a1;
  *((double *)&v21 + 1) = a2;
  *(double *)&v22 = a3;
  *((double *)&v22 + 1) = a4;
  ObjectType = (objc_class *)swift_getObjectType();
  v28 = v21;
  v29 = v22;
  v5 = v4;
  v6 = v4;
  v7 = v4;
  v8 = v4;
  v9 = v4;
  v30 = v4;
  v10 = &v4[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_title];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;

  *(_QWORD *)&v4[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_horizontalPadding] = 0;
  v19 = OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label;
  sub_1D559C8F0();
  *(_QWORD *)&v4[v19] = sub_1D556CE74();

  *(_QWORD *)&v4[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_leadingConstraint] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_trailingConstraint] = 0;

  v27.receiver = v30;
  v27.super_class = ObjectType;
  v25 = objc_msgSendSuper2(&v27, sel_initWithFrame_, v21, v22);
  v11 = v25;
  v12 = v25;
  v13 = v25;
  v14 = v25;
  v15 = v25;
  v30 = v25;
  sub_1D5656A08();

  v23 = (id)*MEMORY[0x1E0D46BA8];
  v16 = (id)*MEMORY[0x1E0D46BA8];
  sub_1D565FE10();
  v24 = (id)sub_1D565FDF8();
  swift_bridgeObjectRelease();

  objc_msgSend(v25, sel_setAccessibilityIdentifier_, v24);
  type metadata accessor for UIAccessibilityTraits();
  sub_1D566077C();
  *v17 = *MEMORY[0x1E0DC4670];
  sub_1D5571928();
  sub_1D5654FF8();
  sub_1D56604E8();
  objc_msgSend(v25, sel_setAccessibilityTraits_, v26);

  objc_msgSend(v25, sel_setIsAccessibilityElement_, 1);
  return v25;
}

void sub_1D5656A08()
{
  char *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  char *v6;
  void *v7;
  id v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  id v12;
  char *v13;
  id v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  char *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  double *v26;
  double v27;
  id v28;
  id v29;
  void **v30;
  id v31;
  id v32;
  id v33;
  double *v34;
  double v35;
  id v36;
  id v37;
  void **v38;
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
  id *v51;
  id *v52;
  _QWORD *v53;

  v17 = *(id *)&v0[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label];
  v1 = v17;
  objc_msgSend(v0, sel_addSubview_, v17);

  v18 = *(id *)&v0[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label];
  v2 = v18;
  objc_msgSend(v18, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v23 = *(id *)&v0[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label];
  v3 = v23;
  v19 = (id)objc_opt_self();
  v20 = (id)*MEMORY[0x1E0DC4AD0];
  v4 = (id)*MEMORY[0x1E0DC4AD0];
  v22 = objc_msgSend(v19, sel_preferredFontForTextStyle_, v20);

  UILabel.contentSizeAdjustingFont(_:)((UIFont)v22);
  v24 = *(id *)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label];
  v5 = v24;
  v29 = objc_msgSend(v24, (SEL)0x1F37F0136);

  v6 = v21;
  v25 = objc_msgSend(v21, (SEL)0x1F380C31BLL);

  v28 = objc_msgSend(v25, (SEL)0x1F37F0136);
  v26 = (double *)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_horizontalPadding];
  swift_beginAccess();
  v27 = *v26;
  swift_endAccess();
  v31 = objc_msgSend(v29, (SEL)0x1F37BEF67, v28, v27);

  v30 = (void **)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_leadingConstraint];
  swift_beginAccess();
  v7 = *v30;
  *v30 = v31;

  swift_endAccess();
  v32 = *(id *)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label];
  v8 = v32;
  v37 = objc_msgSend(v32, (SEL)0x1F3844648);

  v9 = v21;
  v33 = objc_msgSend(v21, (SEL)0x1F380C31BLL);

  v36 = objc_msgSend(v33, (SEL)0x1F3844648);
  v34 = (double *)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_horizontalPadding];
  swift_beginAccess();
  v35 = *v34;
  swift_endAccess();
  v39 = objc_msgSend(v37, (SEL)0x1F37BEF67, v36, v35);

  v38 = (void **)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_trailingConstraint];
  swift_beginAccess();
  v10 = *v38;
  *v38 = v39;

  swift_endAccess();
  v40 = (id)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9AF0);
  sub_1D566077C();
  v53 = v11;
  v41 = *(id *)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label];
  v12 = v41;
  v44 = objc_msgSend(v41, (SEL)0x1F38436F4);

  v13 = v21;
  v42 = objc_msgSend(v21, (SEL)0x1F37EFED5);

  v43 = objc_msgSend(v42, (SEL)0x1F38436F4);
  v45 = objc_msgSend(v44, (SEL)0x1F37BEF67, v43, 16.0);

  *v53 = v45;
  v46 = *(id *)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label];
  v14 = v46;
  v49 = objc_msgSend(v46, (SEL)0x1F37B738DLL);

  v15 = v21;
  v47 = objc_msgSend(v21, (SEL)0x1F37EFED5);

  v48 = objc_msgSend(v47, (SEL)0x1F37B738DLL);
  v50 = objc_msgSend(v49, (SEL)0x1F37BEF67, v48, -8.0);

  v53[1] = v50;
  v51 = (id *)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_leadingConstraint];
  swift_beginAccess();
  sub_1D559B584(v51, v53 + 2);
  swift_endAccess();
  v52 = (id *)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_trailingConstraint];
  swift_beginAccess();
  sub_1D559B584(v52, v53 + 3);
  swift_endAccess();
  sub_1D5571928();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9A60);
  sub_1D559C4E0();
  sub_1D55DE230();
  sub_1D565FEDC();
  sub_1D5565788();
  v16 = (id)sub_1D565FF84();
  swift_bridgeObjectRelease();
  objc_msgSend(v40, sel_activateConstraints_, v16);

}

void sub_1D5657150()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;

  v1 = v0;
  v2 = v0;
  v3 = v0;
  v4 = v0;
  v5 = v0;
  v6 = &v0[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_title];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_horizontalPadding] = 0;
  v7 = OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label;
  sub_1D559C8F0();
  *(_QWORD *)&v0[v7] = sub_1D556CE74();

  *(_QWORD *)&v0[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_leadingConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_trailingConstraint] = 0;

  sub_1D565FE64();
  sub_1D566062C();
  __break(1u);
}

id TitleSupplementaryView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1D56573B0(id *a1@<X0>, _QWORD *a2@<X8>)
{
  sub_1D5655DAC(a1, a2);
}

void sub_1D56573C4(_QWORD *a1, id *a2)
{
  sub_1D5655E48(a1, a2);
}

void sub_1D56573D8(id *a1@<X0>, _QWORD *a2@<X8>)
{
  sub_1D565624C(a1, a2);
}

void sub_1D56573EC(double *a1, id *a2)
{
  sub_1D56562D4(a1, a2);
}

void ToolboxErrors.localizedStringResource.getter(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v2;
  _QWORD v3[31];
  unint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  unsigned __int8 v12;

  v3[18] = a1;
  v3[19] = "Dialog to show and say when the user has asked to unsubscribe to a non-mailing list email, which we won't be able to do.";
  v3[20] = "Cannot_Unsubscribe_Dialog";
  v3[21] = "Dialog to show and say when the user has asked to do something with Mail, but they haven't set up an account yet.";
  v3[22] = "No_Active_Accounts_Dialog";
  v3[23] = "Dialog to show and say when the user has asked to do something with emails, but we did not find any matching results.";
  v3[24] = "No_Messages_Found_Dialog";
  v3[25] = "Dialog to show and say when the user has asked to undo the email they just sent, but we cannot.";
  v3[26] = "Undo_Send_Failed_Dialog";
  v3[27] = "Dialog to show and say when the user has asked to save an email message as a draft, but attachments are not d"
           "one loading onto the message.";
  v3[28] = "Incomplete_Attachments_Dialog";
  v3[29] = "Dialog to show and say when the user has asked to make edits to an email message draft, but is not actively c"
           "omposing an email message draft.";
  v3[30] = "Active_Draft_Not_Found_Dialog";
  v12 = 0;
  v6 = 0;
  v4 = (*(_QWORD *)(*(_QWORD *)(sub_1D565ECC4() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v5 = (char *)v3 - v4;
  v7 = (*(_QWORD *)(*(_QWORD *)(sub_1D565EDCC() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v3 - v7;
  v2 = sub_1D565FDEC();
  v9 = (*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v2);
  v10 = (char *)v3 - v9;
  v12 = *v1;
  v11 = v12;
  __asm { BR              X8 }
}

uint64_t sub_1D56575D0()
{
  uint64_t v0;
  uint64_t v1;

  *(_DWORD *)(v0 - 356) = 1;
  sub_1D565FE64();
  sub_1D565FD98();
  *(_QWORD *)(v0 - 352) = sub_1D565FE64();
  *(_QWORD *)(v0 - 344) = v1;
  sub_1D55982A0();
  sub_1D55982B4(*(_QWORD *)(v0 - 224));
  *(_QWORD *)(v0 - 168) = *(_QWORD *)(v0 - 248);
  *(_QWORD *)(v0 - 160) = 141;
  *(_BYTE *)(v0 - 152) = 2;
  *(_BYTE *)(v0 - 151) = 0;
  return sub_1D565ECDC();
}

void static ToolboxErrors.== infix(_:_:)(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_1D5657C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned __int8 a12)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_1D5657CC4
                                                                                       + dword_1D5657D4C[a12]))(a1, a2, a3, a4, a5, a6);
}

BOOL sub_1D5657CD4()
{
  uint64_t v1;

  return v1 == 0;
}

void ToolboxErrors.hash(into:)()
{
  __asm { BR              X8 }
}

uint64_t sub_1D5657DB8()
{
  return sub_1D5660884();
}

uint64_t ToolboxErrors.hashValue.getter()
{
  sub_1D5657E94();
  return sub_1D5660560();
}

unint64_t sub_1D5657E94()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3ED58;
  if (!qword_1EFF3ED58)
  {
    v0 = MEMORY[0x1D82763B0](&protocol conformance descriptor for ToolboxErrors, &type metadata for ToolboxErrors);
    atomic_store(v0, (unint64_t *)&qword_1EFF3ED58);
    return v0;
  }
  return v2;
}

uint64_t sub_1D5657F00(uint64_t a1)
{
  char v1;

  static ToolboxErrors.== infix(_:_:)(a1);
  return v1 & 1;
}

uint64_t sub_1D5657F18()
{
  return ToolboxErrors.hashValue.getter();
}

void sub_1D5657F2C()
{
  ToolboxErrors.hash(into:)();
}

void sub_1D5657F40(uint64_t a1@<X8>)
{
  ToolboxErrors.localizedStringResource.getter(a1);
}

unint64_t sub_1D5657F54()
{
  return sub_1D5657F68();
}

unint64_t sub_1D5657F68()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3ED60;
  if (!qword_1EFF3ED60)
  {
    v0 = MEMORY[0x1D82763B0](&protocol conformance descriptor for ToolboxErrors, &type metadata for ToolboxErrors);
    atomic_store(v0, (unint64_t *)&qword_1EFF3ED60);
    return v0;
  }
  return v2;
}

ValueMetadata *type metadata accessor for ToolboxErrors()
{
  return &type metadata for ToolboxErrors;
}

uint64_t static SearchItem.TopHit.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void (*v11)(double);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  int v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a1;
  v10 = a2;
  v19 = 0;
  v18 = 0;
  v15 = sub_1D565EDB4();
  v12 = *(_QWORD *)(v15 - 8);
  v8 = *(_QWORD *)(v12 + 64);
  v7 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v15);
  v13 = (char *)&v6 - v7;
  v9 = v7;
  v2 = MEMORY[0x1E0C80A78]((char *)&v6 - v7);
  v14 = (char *)&v6 - v9;
  v19 = v3;
  v18 = v10;
  v11 = *(void (**)(double))(v4 + 16);
  v11(v2);
  ((void (*)(char *, uint64_t, uint64_t))v11)(v13, v10, v15);
  v17 = sub_1D565ED90();
  v16 = *(void (**)(char *, uint64_t))(v12 + 8);
  v16(v13, v15);
  v16(v14, v15);
  return v17 & 1;
}

uint64_t SearchItem.TopHit.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  v1 = sub_1D565EDB4();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1);
}

uint64_t SearchItem.TopHit.id.setter(uint64_t a1)
{
  uint64_t v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v11 = a1;
  v13 = 0;
  v12 = 0;
  v10 = sub_1D565EDB4();
  v9 = *(_QWORD *)(v10 - 8);
  v6 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x1E0C80A78](v10);
  v7 = (char *)&v6 - v6;
  v13 = v3;
  v12 = v1;
  (*(void (**)(double))(v4 + 16))(v2);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v8, v7, v10);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v11, v10);
}

void (*SearchItem.TopHit.id.modify())()
{
  return sub_1D558A1A8;
}

void *SearchItem.TopHit.message.getter()
{
  uint64_t v0;
  id v1;
  void *v3;

  v3 = *(void **)(v0 + *(int *)(type metadata accessor for SearchItem.TopHit() + 20));
  v1 = v3;
  return v3;
}

uint64_t type metadata accessor for SearchItem.TopHit()
{
  uint64_t v1;

  v1 = qword_1ED9A8CE8;
  if (!qword_1ED9A8CE8)
    return swift_getSingletonMetadata();
  return v1;
}

void SearchItem.TopHit.message.setter(void *a1)
{
  uint64_t v1;
  id v2;
  void **v3;
  void *v4;

  v2 = a1;
  v3 = (void **)(v1 + *(int *)(type metadata accessor for SearchItem.TopHit() + 20));
  v4 = *v3;
  *v3 = a1;

}

void (*SearchItem.TopHit.message.modify())()
{
  type metadata accessor for SearchItem.TopHit();
  return sub_1D558A1A8;
}

uint64_t SearchItem.TopHit.matchingHintsByGlobalMessageID.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for SearchItem.TopHit() + 24));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t SearchItem.TopHit.matchingHintsByGlobalMessageID.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRetain();
  *(_QWORD *)(v1 + *(int *)(type metadata accessor for SearchItem.TopHit() + 24)) = a1;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*SearchItem.TopHit.matchingHintsByGlobalMessageID.modify())()
{
  type metadata accessor for SearchItem.TopHit();
  return sub_1D558A1A8;
}

uint64_t SearchItem.TopHit.init(id:message:matchingHintsByGlobalMessageID:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;

  v17 = a4;
  v21 = a1;
  v19 = a2;
  v18 = a3;
  v27 = 0;
  v26 = 0;
  v25 = 0;
  v24 = 0;
  v14 = 0;
  v22 = sub_1D565EDB4();
  v20 = *(_QWORD *)(v22 - 8);
  v13 = (*(_QWORD *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v15 = (char *)&v12 - v13;
  v16 = type metadata accessor for SearchItem.TopHit();
  v4 = MEMORY[0x1E0C80A78](v15);
  v23 = (uint64_t)&v12 - v5;
  v27 = (char *)&v12 - v5;
  v26 = v6;
  v25 = v7;
  v24 = v8;
  *(uint64_t *)((char *)&v12 + *(int *)(v16 + 24) - v5) = v14;
  (*(void (**)(double))(v9 + 16))(v4);
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v23, v15, v22);
  v10 = v19;
  *(_QWORD *)(v23 + *(int *)(v16 + 20)) = v19;
  swift_bridgeObjectRetain();
  *(_QWORD *)(v23 + *(int *)(v16 + 24)) = v18;
  swift_bridgeObjectRelease();
  sub_1D56585E8(v23, v17);
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
  return sub_1D563D5D0(v23);
}

uint64_t sub_1D56585E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;
  uint64_t result;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;

  v2 = sub_1D565EDB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a2, a1);
  v7 = type metadata accessor for SearchItem.TopHit();
  v5 = *(int *)(v7 + 20);
  v6 = *(void **)(a1 + v5);
  v3 = v6;
  *(_QWORD *)(a2 + v5) = v6;
  v10 = *(int *)(v7 + 24);
  v11 = *(_QWORD *)(a1 + v10);
  swift_bridgeObjectRetain();
  result = a2;
  *(_QWORD *)(a2 + v10) = v11;
  return result;
}

uint64_t sub_1D5658698@<X0>(uint64_t a1@<X8>)
{
  return SearchItem.TopHit.id.getter(a1);
}

uint64_t SearchItem.TopHit.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a1;
  v7 = v1;
  v13 = 0;
  v12 = 0;
  v11 = sub_1D565EDB4();
  v9 = *(_QWORD *)(v11 - 8);
  v8 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x1E0C80A78](v11);
  v10 = (char *)&v6 - v8;
  v13 = v6;
  v12 = v3;
  (*(void (**)(double))(v4 + 16))(v2);
  sub_1D558B484();
  sub_1D5660884();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t SearchItem.TopHit.hashValue.getter()
{
  type metadata accessor for SearchItem.TopHit();
  sub_1D56587B8();
  return sub_1D5660560();
}

unint64_t sub_1D56587B8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3ED68;
  if (!qword_1EFF3ED68)
  {
    v0 = type metadata accessor for SearchItem.TopHit();
    v1 = MEMORY[0x1D82763B0](&protocol conformance descriptor for SearchItem.TopHit, v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3ED68);
    return v1;
  }
  return v3;
}

uint64_t sub_1D5658828()
{
  return SearchItem.TopHit.hashValue.getter();
}

uint64_t sub_1D565883C(uint64_t a1)
{
  return SearchItem.TopHit.hash(into:)(a1);
}

uint64_t sub_1D5658850(uint64_t a1, uint64_t a2)
{
  return static SearchItem.TopHit.== infix(_:_:)(a1, a2) & 1;
}

unint64_t sub_1D5658868()
{
  return sub_1D565887C();
}

unint64_t sub_1D565887C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EFF3ED70;
  if (!qword_1EFF3ED70)
  {
    v0 = type metadata accessor for SearchItem.TopHit();
    v1 = MEMORY[0x1D82763B0](&protocol conformance descriptor for SearchItem.TopHit, v0);
    atomic_store(v1, (unint64_t *)&qword_1EFF3ED70);
    return v1;
  }
  return v3;
}

unint64_t _s6TopHitVwCP(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v15;

  v15 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v15 & 0x20000) != 0)
  {
    v10 = *a2;
    swift_retain();
    *a1 = v10;
    return *a1 + ((v15 + 16) & ~(unint64_t)v15);
  }
  else
  {
    v3 = sub_1D565EDB4();
    (*(void (**)(_QWORD *, uint64_t *))(*(_QWORD *)(v3 - 8) + 16))(a1, a2);
    v6 = *(int *)(a3 + 20);
    v7 = *(void **)((char *)a2 + v6);
    v4 = v7;
    *(_QWORD *)((char *)a1 + v6) = v7;
    v8 = *(int *)(a3 + 24);
    v9 = *(uint64_t *)((char *)a2 + v8);
    swift_bridgeObjectRetain();
    *(_QWORD *)((char *)a1 + v8) = v9;
    return (unint64_t)a1;
  }
}

uint64_t _s6TopHitVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = sub_1D565EDB4();
  (*(void (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1);

  return swift_bridgeObjectRelease();
}

uint64_t _s6TopHitVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  uint64_t result;
  uint64_t v6;
  void *v7;
  uint64_t v11;
  uint64_t v12;

  v3 = sub_1D565EDB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, a2);
  v6 = *(int *)(a3 + 20);
  v7 = *(void **)(a2 + v6);
  v4 = v7;
  *(_QWORD *)(a1 + v6) = v7;
  v11 = *(int *)(a3 + 24);
  v12 = *(_QWORD *)(a2 + v11);
  swift_bridgeObjectRetain();
  result = a1;
  *(_QWORD *)(a1 + v11) = v12;
  return result;
}

uint64_t _s6TopHitVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v7;
  void *v8;
  _QWORD *v11;
  uint64_t v12;

  v3 = sub_1D565EDB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 24))(a1, a2);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a2 + v7);
  v4 = v8;
  v5 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = v8;

  v11 = (_QWORD *)(a1 + *(int *)(a3 + 24));
  v12 = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  *v11 = v12;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6TopHitVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_1D565EDB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32))(a1, a2);
  result = a1;
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  return result;
}

uint64_t _s6TopHitVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void **v4;
  void *v5;

  v3 = sub_1D565EDB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(a1, a2);
  v4 = (void **)(a1 + *(int *)(a3 + 20));
  v5 = *v4;
  *v4 = *(void **)(a2 + *(int *)(a3 + 20));

  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6TopHitVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D5658CE8(uint64_t a1, unsigned int a2, uint64_t a3)
{
  int v4;
  unsigned int v5;
  uint64_t v9;
  uint64_t v10;

  v9 = sub_1D565EDB4();
  v10 = *(_QWORD *)(v9 - 8);
  if (a2 == *(_DWORD *)(v10 + 84))
  {
    return (*(unsigned int (**)(uint64_t, _QWORD, uint64_t))(v10 + 48))(a1, a2, v9);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    v4 = -1;
    if (*(_QWORD *)(a1 + *(int *)(a3 + 20)) < 0x100000000uLL)
      v4 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
    return (v4 + 1);
  }
  else
  {
    __break(1u);
  }
  return v5;
}

uint64_t _s6TopHitVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D5658DE0(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1D565EDB4();
  v9 = *(_QWORD *)(result - 8);
  if (a3 == *(_DWORD *)(v9 + 84))
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v9 + 56))(a1, a2, a2, result);
  if (a3 == 0x7FFFFFFF)
    *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2 - 1;
  else
    __break(1u);
  return result;
}

uint64_t sub_1D5658E90()
{
  unint64_t v0;
  uint64_t v2;

  v2 = sub_1D565EDB4();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

void static MUIBackgroundConfigurationStyle.== infix(_:_:)(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_1D5658FA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned __int8 a12)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_1D5659020
                                                                                       + *((int *)qword_1D56590C8 + a12)))(a1, a2, a3, a4, a5, a6);
}

BOOL sub_1D5659030()
{
  uint64_t v1;

  return v1 == 0;
}

void MUIBackgroundConfigurationStyle.hash(into:)()
{
  __asm { BR              X8 }
}

uint64_t sub_1D565913C()
{
  return sub_1D5660884();
}

uint64_t MUIBackgroundConfigurationStyle.hashValue.getter()
{
  sub_1D5659238();
  return sub_1D5660560();
}

unint64_t sub_1D5659238()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3ED78;
  if (!qword_1EFF3ED78)
  {
    v0 = MEMORY[0x1D82763B0](&protocol conformance descriptor for MUIBackgroundConfigurationStyle, &type metadata for MUIBackgroundConfigurationStyle);
    atomic_store(v0, (unint64_t *)&qword_1EFF3ED78);
    return v0;
  }
  return v2;
}

uint64_t sub_1D56592A4(uint64_t a1)
{
  char v1;

  static MUIBackgroundConfigurationStyle.== infix(_:_:)(a1);
  return v1 & 1;
}

uint64_t sub_1D56592BC()
{
  return MUIBackgroundConfigurationStyle.hashValue.getter();
}

void sub_1D56592D0()
{
  MUIBackgroundConfigurationStyle.hash(into:)();
}

void static UIBackgroundConfiguration.withStyle(_:configuration:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 v20;
  char *v21;

  v9[3] = a4;
  v10 = a1;
  v9[5] = a2;
  v9[4] = a3;
  v21 = 0;
  v20 = 0;
  v18 = 0;
  v19 = 0;
  v11 = sub_1D565F12C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)v9 - v13;
  v15 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v5);
  v16 = (char *)v9 - v15;
  v21 = (char *)v9 - v15;
  v20 = *v6;
  v18 = v7;
  v19 = v8;
  v17 = v20;
  __asm { BR              X8 }
}

uint64_t sub_1D56593DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t);

  sub_1D565F114();
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 - 96) + 32))(*(_QWORD *)(v0 - 64), *(_QWORD *)(v0 - 80), *(_QWORD *)(v0 - 104));
  sub_1D55B4FE4(*(_QWORD *)(v0 - 120));
  if (*(_QWORD *)(v0 - 120))
  {
    v1 = *(_QWORD *)(v0 - 128);
    *(_QWORD *)(v0 - 152) = *(_QWORD *)(v0 - 120);
    *(_QWORD *)(v0 - 144) = v1;
    v2 = *(_QWORD *)(v0 - 64);
    v3 = *(void (**)(uint64_t))(v0 - 152);
    *(_QWORD *)(v0 - 160) = *(_QWORD *)(v0 - 144);
    v3(v2);
    swift_release();
  }
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 - 96) + 32))(*(_QWORD *)(v0 - 136), *(_QWORD *)(v0 - 64), *(_QWORD *)(v0 - 104));
}

unint64_t sub_1D565959C()
{
  return sub_1D56595B0();
}

unint64_t sub_1D56595B0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3ED80;
  if (!qword_1EFF3ED80)
  {
    v0 = MEMORY[0x1D82763B0](&protocol conformance descriptor for MUIBackgroundConfigurationStyle, &type metadata for MUIBackgroundConfigurationStyle);
    atomic_store(v0, (unint64_t *)&qword_1EFF3ED80);
    return v0;
  }
  return v2;
}

uint64_t getEnumTagSinglePayload for MUIBackgroundConfigurationStyle(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xF8)
      goto LABEL_15;
    v7 = ((a2 + 7) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 248;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 8;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for MUIBackgroundConfigurationStyle(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xF8)
  {
    v5 = ((a3 + 7) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xF8)
  {
    v4 = ((a2 - 249) >> 8) + 1;
    *result = a2 + 7;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 7;
  }
  return result;
}

ValueMetadata *type metadata accessor for MUIBackgroundConfigurationStyle()
{
  return &type metadata for MUIBackgroundConfigurationStyle;
}

uint64_t static UIButton.Configuration.bucketButton(title:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v10[4];
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  id *v34;
  uint64_t v35;
  uint64_t KeyPath;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;

  v11 = a3;
  v25 = a1;
  v35 = a2;
  v44 = 0;
  v43 = 0;
  v42 = 0;
  v40 = 0;
  v41 = 0;
  v37 = 0;
  v38 = 0;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3D000);
  v12 = (*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v3);
  v13 = (char *)v10 - v12;
  v18 = 0;
  v14 = sub_1D565EC10();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v18);
  v17 = (char *)v10 - v16;
  v44 = (char *)v10 - v16;
  v19 = sub_1D565EC58();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = (*(_QWORD *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v18);
  v22 = (char *)v10 - v21;
  v23 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v5);
  v24 = (char *)v10 - v23;
  v43 = (char *)v10 - v23;
  v26 = sub_1D56603BC();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = (*(_QWORD *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v25);
  v29 = (char *)v10 - v28;
  v42 = (char *)v10 - v28;
  v40 = v6;
  v41 = v7;
  sub_1D56603A4();
  sub_1D565EC4C();
  KeyPath = swift_getKeyPath();
  v33 = swift_getKeyPath();
  v30 = (id)objc_opt_self();
  v31 = (id)*MEMORY[0x1E0DC4AB8];
  v8 = v31;
  v32 = objc_msgSend(v30, sel_preferredFontForTextStyle_, v31);

  v34 = &v39;
  v39 = v32;
  sub_1D5659FDC();
  sub_1D565EC40();
  swift_bridgeObjectRetain();
  if (v35)
  {
    v10[2] = v25;
    v10[3] = v35;
    v10[0] = v35;
    v10[1] = v25;
    v37 = v25;
    v38 = v35;
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v22, v24, v19);
    sub_1D565EC1C();
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v13, v17, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v14);
    sub_1D5660350();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v27 + 16))(v11, v29, v26);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v24, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v29, v26);
}

BOOL sub_1D5659E0C()
{
  char v1;

  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3ED90);
  v1 = sub_1D565FD8C();
  swift_release();
  swift_release();
  return (v1 & 1) != 0;
}

uint64_t sub_1D5659ED4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF3ED90);
  return sub_1D565FD2C();
}

void sub_1D5659F18()
{
  swift_retain();
  sub_1D5659FDC();
  sub_1D565EC94();
  __break(1u);
}

void sub_1D5659F48(uint64_t a1)
{
  uint64_t v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v4 = a1;
  v1 = sub_1D565EBE0();
  v5 = (*(_QWORD *)(*(_QWORD *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x1E0C80A78](v1);
  (*(void (**)(char *, double))(v3 + 16))((char *)&v4 - v5, v2);
  sub_1D565EBD4();
  __break(1u);
}

void sub_1D5659FB4(uint64_t a1)
{
  sub_1D5659F48(a1);
}

unint64_t sub_1D5659FC8()
{
  return sub_1D5659FDC();
}

unint64_t sub_1D5659FDC()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3ED88;
  if (!qword_1EFF3ED88)
  {
    v0 = MEMORY[0x1D82763B0](MEMORY[0x1E0DC1948], MEMORY[0x1E0DC1958]);
    atomic_store(v0, (unint64_t *)&qword_1EFF3ED88);
    return v0;
  }
  return v2;
}

void sub_1D565A044()
{
  sub_1D5659F18();
}

uint64_t sub_1D565A058()
{
  return 8;
}

uint64_t sub_1D565A06C()
{
  return swift_release();
}

uint64_t sub_1D565A084(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v4;

  v4 = *a1;
  result = swift_retain();
  *a2 = v4;
  return result;
}

BOOL sub_1D565A0B8()
{
  return sub_1D5659E0C();
}

uint64_t sub_1D565A0D0()
{
  return sub_1D5659ED4();
}

_QWORD *sub_1D565A0E4(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

Swift::Void __swiftcall UILabel.contentSizeAdjustingFont(_:)(UIFont a1)
{
  objc_class *v1;
  id v3;

  v1 = a1.super.isa;
  objc_msgSend(v3, sel_setFont_, a1.super.isa);

  objc_msgSend(v3, sel_setAdjustsFontForContentSizeCategory_, 1);
}

uint64_t ZeroKeywordResultModel.title.getter()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t ZeroKeywordResultModel.title.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRetain();
  *v2 = a1;
  v2[1] = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*ZeroKeywordResultModel.title.modify())()
{
  return sub_1D558A1A8;
}

uint64_t ZeroKeywordResultModel.subtitle.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t ZeroKeywordResultModel.subtitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRetain();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*ZeroKeywordResultModel.subtitle.modify())()
{
  return sub_1D558A1A8;
}

void *ZeroKeywordResultModel.image.getter()
{
  uint64_t v0;
  id v1;
  void *v3;

  v3 = *(void **)(v0 + 32);
  v1 = v3;
  return v3;
}

void ZeroKeywordResultModel.image.setter(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v2 = a1;
  v3 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = a1;

}

void (*ZeroKeywordResultModel.image.modify())()
{
  return sub_1D558A1A8;
}

uint64_t ZeroKeywordResultModel.init(title:subtitle:image:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, _QWORD *a6@<X8>)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t __b;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  __b = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b = a1;
  v18 = a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v19 = a3;
  v20 = a4;
  swift_bridgeObjectRelease();
  v6 = a5;
  v7 = a5;
  v8 = v21;
  v21 = a5;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9 = a5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_1D565A504((uint64_t)&__b);
}

uint64_t sub_1D565A504(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return a1;
}

uint64_t ZeroKeywordResultModel.init(title:subtitle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  id v5;
  uint64_t __b;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  __b = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b = a1;
  v13 = a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = a3;
  v15 = a4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v5 = 0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  a5[4] = 0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_1D565A504((uint64_t)&__b);
}

id *ZeroKeywordResultModel.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id *result;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9[5];
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = a1;
  v4 = *(void **)v1;
  v5 = *(void **)(v1 + 8);
  v6 = *(void **)(v1 + 16);
  v7 = *(void **)(v1 + 24);
  v8 = *(id *)(v1 + 32);
  v10 = v1;
  swift_bridgeObjectRetain();
  v9[3] = v4;
  v9[4] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A99F0);
  sub_1D558B38C();
  sub_1D5660884();
  sub_1D5530388();
  swift_bridgeObjectRetain();
  v9[1] = v6;
  v9[2] = v7;
  sub_1D5660884();
  sub_1D5530388();
  v2 = v8;
  v9[0] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A9B68);
  sub_1D5638138();
  sub_1D5660884();
  result = v9;
  sub_1D5565D18(v9);
  return result;
}

BOOL static ZeroKeywordResultModel.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  id v2;
  id v3;
  id v4;
  id v5;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  _QWORD v31[3];
  uint64_t v32;
  _QWORD v33[3];
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;

  v36 = 0;
  v35 = 0;
  v20 = *a1;
  v21 = a1[1];
  v14 = a1[2];
  v15 = a1[3];
  v16 = (id)a1[4];
  v36 = a1;
  v22 = *a2;
  v23 = a2[1];
  v17 = a2[2];
  v18 = a2[3];
  v19 = (id)a2[4];
  v35 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v33[0] = v20;
  v33[1] = v21;
  v33[2] = v22;
  v34 = v23;
  if (v21)
  {
    sub_1D558B990(v33, &v24);
    if (v34)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v12 = sub_1D565FE70();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1D5530388();
      v13 = v12;
      goto LABEL_7;
    }
    sub_1D5530388();
    goto LABEL_9;
  }
  if (v34)
  {
LABEL_9:
    sub_1D558B95C();
    v13 = 0;
    goto LABEL_7;
  }
  sub_1D5530388();
  v13 = 1;
LABEL_7:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v13 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v31[0] = v14;
    v31[1] = v15;
    v31[2] = v17;
    v32 = v18;
    if (v15)
    {
      sub_1D558B990(v31, &v25);
      if (v32)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v10 = sub_1D565FE70();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1D5530388();
        v11 = v10;
        goto LABEL_17;
      }
      sub_1D5530388();
    }
    else if (!v32)
    {
      sub_1D5530388();
      v11 = 1;
LABEL_17:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
        return 0;
      v2 = v16;
      v3 = v16;
      v4 = v19;
      v5 = v19;
      v29 = v16;
      v30 = v19;
      if (v16)
      {
        sub_1D559B584(&v29, &v28);
        if (v30)
        {
          v27 = v28;
          v26 = v30;
          sub_1D5594EB0();
          v8 = sub_1D56602FC();

          sub_1D5565D18(&v29);
          v9 = v8;
LABEL_27:

          return (v9 & 1) != 0;
        }

      }
      else if (!v30)
      {
        sub_1D5565D18(&v29);
        v9 = 1;
        goto LABEL_27;
      }
      sub_1D559E71C(&v29);
      v9 = 0;
      goto LABEL_27;
    }
    sub_1D558B95C();
    v11 = 0;
    goto LABEL_17;
  }
  return 0;
}

uint64_t ZeroKeywordResultModel.hashValue.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD __b[5];

  memset(__b, 0, sizeof(__b));
  v1 = v0[1];
  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  __b[0] = *v0;
  __b[1] = v1;
  __b[2] = v2;
  __b[3] = v3;
  __b[4] = v4;
  sub_1D565ACE0();
  return sub_1D5660560();
}

unint64_t sub_1D565ACE0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3ED98;
  if (!qword_1EFF3ED98)
  {
    v0 = MEMORY[0x1D82763B0](&protocol conformance descriptor for ZeroKeywordResultModel, &type metadata for ZeroKeywordResultModel);
    atomic_store(v0, (unint64_t *)&qword_1EFF3ED98);
    return v0;
  }
  return v2;
}

uint64_t sub_1D565AD4C()
{
  return ZeroKeywordResultModel.hashValue.getter();
}

id *sub_1D565AD60(uint64_t a1)
{
  return ZeroKeywordResultModel.hash(into:)(a1);
}

unint64_t sub_1D565AD74()
{
  return sub_1D565AD88();
}

unint64_t sub_1D565AD88()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EFF3EDA0;
  if (!qword_1EFF3EDA0)
  {
    v0 = MEMORY[0x1D82763B0](&protocol conformance descriptor for ZeroKeywordResultModel, &type metadata for ZeroKeywordResultModel);
    atomic_store(v0, (unint64_t *)&qword_1EFF3EDA0);
    return v0;
  }
  return v2;
}

BOOL sub_1D565ADF4(_QWORD *a1, _QWORD *a2)
{
  return static ZeroKeywordResultModel.== infix(_:_:)(a1, a2);
}

void destroy for ZeroKeywordResultModel(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

_QWORD *initializeWithCopy for ZeroKeywordResultModel(_QWORD *a1, _QWORD *a2)
{
  id v2;
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  void *v7;

  *a1 = *a2;
  v4 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = a2[3];
  swift_bridgeObjectRetain();
  a1[3] = v5;
  v7 = (void *)a2[4];
  v2 = v7;
  result = a1;
  a1[4] = v7;
  return result;
}

_QWORD *assignWithCopy for ZeroKeywordResultModel(_QWORD *a1, _QWORD *a2)
{
  id v2;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;

  *a1 = *a2;
  v4 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  v5 = a2[3];
  swift_bridgeObjectRetain();
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v8 = (void *)a1[4];
  v7 = (void *)a2[4];
  v2 = v7;
  a1[4] = v7;

  return a1;
}

_QWORD *assignWithTake for ZeroKeywordResultModel(_QWORD *a1, _QWORD *a2)
{
  void *v2;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  v2 = (void *)a1[4];
  a1[4] = a2[4];

  return a1;
}

uint64_t getEnumTagSinglePayload for ZeroKeywordResultModel(uint64_t a1, unsigned int a2)
{
  int v2;
  int v4;
  int v5;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
    {
      v5 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v4 = -1;
      if (!HIDWORD(*(_QWORD *)(a1 + 8)))
        v4 = *(_QWORD *)(a1 + 8);
      v2 = v4 - 1;
      if (v4 - 1 < 0)
        v2 = -1;
      v5 = v2;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ZeroKeywordResultModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  _BOOL4 v3;

  v3 = a3 > 0x7FFFFFFE;
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)(result + 32) = 0;
    if (a3 > 0x7FFFFFFE)
    {
      if (v3)
        *(_BYTE *)(result + 40) = 1;
      else
        __break(1u);
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFE)
    {
      if (v3)
        *(_BYTE *)(result + 40) = 0;
      else
        __break(1u);
    }
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ZeroKeywordResultModel()
{
  return &type metadata for ZeroKeywordResultModel;
}

uint64_t sub_1D565B340()
{
  sub_1D5594C70();
  return swift_deallocClassInstance();
}

id sub_1D565B37C()
{
  id result;

  sub_1D55E550C();
  type metadata accessor for ResourceBundleClass();
  result = sub_1D565B3C0();
  qword_1EFF3EDA8 = (uint64_t)result;
  return result;
}

id sub_1D565B3C0()
{
  uint64_t ObjCClassFromMetadata;

  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleForClass_, ObjCClassFromMetadata);
}

uint64_t *sub_1D565B404()
{
  if (qword_1EFF3C450 != -1)
    swift_once();
  return &qword_1EFF3EDA8;
}

uint64_t sub_1D565B458()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF432F8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF432F8);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565B4E4()
{
  uint64_t v0;

  if (qword_1EFF3C458 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF432F8);
}

uint64_t sub_1D565B544()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF43310);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF43310);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565B5D0()
{
  uint64_t v0;

  if (qword_1EFF3C460 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF43310);
}

uint64_t sub_1D565B630()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF43328);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF43328);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565B6BC()
{
  uint64_t v0;

  if (qword_1EFF3C468 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF43328);
}

uint64_t sub_1D565B71C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF43340);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF43340);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565B7A8()
{
  uint64_t v0;

  if (qword_1EFF3C470 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF43340);
}

uint64_t sub_1D565B808()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF43358);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF43358);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565B894()
{
  uint64_t v0;

  if (qword_1EFF3C478 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF43358);
}

uint64_t sub_1D565B8F4()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF43370);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF43370);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565B980()
{
  uint64_t v0;

  if (qword_1EFF3C480 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF43370);
}

uint64_t sub_1D565B9E0()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF43388);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF43388);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565BA6C()
{
  uint64_t v0;

  if (qword_1EFF3C488 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF43388);
}

uint64_t sub_1D565BACC()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF433A0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF433A0);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565BB58()
{
  uint64_t v0;

  if (qword_1EFF3C490 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF433A0);
}

uint64_t sub_1D565BBB8()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF433B8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF433B8);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565BC44()
{
  uint64_t v0;

  if (qword_1EFF3C498 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF433B8);
}

uint64_t sub_1D565BCA4()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF433D0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF433D0);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565BD30()
{
  uint64_t v0;

  if (qword_1EFF3C4A0 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF433D0);
}

uint64_t sub_1D565BD90()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF433E8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF433E8);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565BE1C()
{
  uint64_t v0;

  if (qword_1EFF3C4A8 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF433E8);
}

uint64_t sub_1D565BE7C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF43400);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF43400);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565BF08()
{
  uint64_t v0;

  if (qword_1EFF3C4B0 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF43400);
}

uint64_t sub_1D565BF68()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF43418);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF43418);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565BFF4()
{
  uint64_t v0;

  if (qword_1EFF3C4B8 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF43418);
}

uint64_t sub_1D565C054()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF43430);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF43430);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565C0E0()
{
  uint64_t v0;

  if (qword_1EFF3C4C0 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF43430);
}

uint64_t sub_1D565C140()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF43448);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF43448);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565C1CC()
{
  uint64_t v0;

  if (qword_1EFF3C4C8 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF43448);
}

uint64_t sub_1D565C22C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF43460);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF43460);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565C2B8()
{
  uint64_t v0;

  if (qword_1EFF3C4D0 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF43460);
}

uint64_t sub_1D565C318()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF43478);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF43478);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565C3A4()
{
  uint64_t v0;

  if (qword_1EFF3C4D8 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF43478);
}

uint64_t sub_1D565C404()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF43490);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF43490);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565C490()
{
  uint64_t v0;

  if (qword_1EFF3C4E0 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF43490);
}

uint64_t sub_1D565C4F0()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF434A8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF434A8);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565C57C()
{
  uint64_t v0;

  if (qword_1EFF3C4E8 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF434A8);
}

uint64_t sub_1D565C5DC()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF434C0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF434C0);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565C668()
{
  uint64_t v0;

  if (qword_1EFF3C4F0 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF434C0);
}

uint64_t sub_1D565C6C8()
{
  id v0;
  uint64_t v2;

  v2 = sub_1D565EEF8();
  __swift_allocate_value_buffer(v2, qword_1EFF434D8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFF434D8);
  sub_1D565FE64();
  v0 = (id)*sub_1D565B404();
  return sub_1D565EEEC();
}

uint64_t sub_1D565C754()
{
  uint64_t v0;

  if (qword_1EFF3C4F8 != -1)
    swift_once();
  v0 = sub_1D565EEF8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EFF434D8);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  BOOL v8;

  if (qword_1EFF432C8 == -1)
  {
    if (qword_1EFF432D0)
      return _availability_version_check();
  }
  else
  {
    dispatch_once_f(&qword_1EFF432C8, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_1EFF432D0)
      return _availability_version_check();
  }
  if (qword_1EFF432C0 == -1)
  {
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_1EFF432C0, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  if (v8)
    return 0;
  if (dword_1EFF432B4 > a3)
    return 1;
  return dword_1EFF432B4 >= a3 && dword_1EFF432B8 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t (*v1)(void);
  BOOL v2;
  unsigned __int8 *v4;
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD, _QWORD);
  uint64_t (*v8)(_QWORD, const char *, uint64_t, unsigned __int8 *);
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t (*v11)(void);
  FILE *v12;
  FILE *v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  FILE *v27;
  unsigned int (*v28)(uint64_t, char *, uint64_t, uint64_t);
  char v29[32];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = (uint64_t (*)(void))qword_1EFF432D0;
  if (qword_1EFF432D0)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (MEMORY[0x1E0C80CC0])
    {
      qword_1EFF432D0 = (uint64_t)MEMORY[0x1E0C80CC0];
      v1 = MEMORY[0x1E0C80CC0];
    }
    if (!v1 || (_DWORD)result != 0)
    {
      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        v4 = *(unsigned __int8 **)result;
        result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          v5 = (uint64_t (*)(_QWORD))result;
          v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            v7 = (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))result;
            result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              v8 = (uint64_t (*)(_QWORD, const char *, uint64_t, unsigned __int8 *))result;
              result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  v10 = (uint64_t (*)(uint64_t))result;
                  result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    v11 = (uint64_t (*)(void))result;
                    result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        v12 = (FILE *)result;
                        result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          v13 = (FILE *)result;
                          v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          v14 = MEMORY[0x1D8275DEC](v13);
                          if (v14 < 0)
                          {
                            v16 = 0;
                          }
                          else
                          {
                            v15 = v14;
                            rewind(v13);
                            v16 = malloc(v15);
                            if (v16)
                            {
                              v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                v17 = v5(0);
                                if (v17)
                                {
                                  v18 = v17;
                                  v19 = v13;
                                  if (v6)
                                    v20 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))v6)(0, v17, 0, 0, 0);
                                  else
                                    v20 = v7(0, v17, 0, 0);
                                  v21 = v20;
                                  if (v20)
                                  {
                                    v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      v23 = v22;
                                      v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984))
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_1EFF432B4, &dword_1EFF432B8);
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  v19 = v13;
                                }
                                v16 = v26;
                              }
                              else
                              {
                                v16 = v26;
                                v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void MUICGRectFromNSDictionary_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v5;
  _os_log_error_impl(&dword_1D5522000, a3, OS_LOG_TYPE_ERROR, "ERROR converting dictionary keys/values to CGRect, %@", (uint8_t *)&v6, 0xCu);

}

uint64_t sub_1D565E9A0()
{
  return MEMORY[0x1E0C90300]();
}

uint64_t sub_1D565E9AC()
{
  return MEMORY[0x1E0C90518]();
}

uint64_t sub_1D565E9B8()
{
  return MEMORY[0x1E0C905A0]();
}

uint64_t sub_1D565E9C4()
{
  return MEMORY[0x1E0C905C0]();
}

uint64_t sub_1D565E9D0()
{
  return MEMORY[0x1E0C905D0]();
}

uint64_t sub_1D565E9DC()
{
  return MEMORY[0x1E0C905E0]();
}

uint64_t sub_1D565E9E8()
{
  return MEMORY[0x1E0C90640]();
}

uint64_t sub_1D565E9F4()
{
  return MEMORY[0x1E0C90650]();
}

uint64_t sub_1D565EA00()
{
  return MEMORY[0x1E0C90778]();
}

uint64_t sub_1D565EA0C()
{
  return MEMORY[0x1E0C907D0]();
}

uint64_t sub_1D565EA18()
{
  return MEMORY[0x1E0C90860]();
}

uint64_t sub_1D565EA24()
{
  return MEMORY[0x1E0C90878]();
}

uint64_t sub_1D565EA30()
{
  return MEMORY[0x1E0C908E8]();
}

uint64_t sub_1D565EA3C()
{
  return MEMORY[0x1E0C90918]();
}

uint64_t sub_1D565EA48()
{
  return MEMORY[0x1E0C90938]();
}

uint64_t sub_1D565EA54()
{
  return MEMORY[0x1E0C90950]();
}

uint64_t sub_1D565EA60()
{
  return MEMORY[0x1E0C90970]();
}

uint64_t sub_1D565EA6C()
{
  return MEMORY[0x1E0C90978]();
}

uint64_t sub_1D565EA78()
{
  return MEMORY[0x1E0C90980]();
}

uint64_t sub_1D565EA84()
{
  return MEMORY[0x1E0C90998]();
}

uint64_t sub_1D565EA90()
{
  return MEMORY[0x1E0C90A08]();
}

uint64_t sub_1D565EA9C()
{
  return MEMORY[0x1E0C90D00]();
}

uint64_t sub_1D565EAA8()
{
  return MEMORY[0x1E0C90DB0]();
}

uint64_t sub_1D565EAB4()
{
  return MEMORY[0x1E0C91128]();
}

uint64_t sub_1D565EAC0()
{
  return MEMORY[0x1E0C91148]();
}

uint64_t sub_1D565EACC()
{
  return MEMORY[0x1E0C913A0]();
}

uint64_t sub_1D565EAD8()
{
  return MEMORY[0x1E0C91480]();
}

uint64_t sub_1D565EAE4()
{
  return MEMORY[0x1E0C914B0]();
}

uint64_t sub_1D565EAF0()
{
  return MEMORY[0x1E0C91620]();
}

uint64_t sub_1D565EAFC()
{
  return MEMORY[0x1E0C91640]();
}

uint64_t sub_1D565EB08()
{
  return MEMORY[0x1E0C91750]();
}

uint64_t sub_1D565EB14()
{
  return MEMORY[0x1E0C91820]();
}

uint64_t sub_1D565EB20()
{
  return MEMORY[0x1E0C91910]();
}

uint64_t sub_1D565EB2C()
{
  return MEMORY[0x1E0C91920]();
}

uint64_t sub_1D565EB38()
{
  return MEMORY[0x1E0C91A38]();
}

uint64_t sub_1D565EB44()
{
  return MEMORY[0x1E0CADE58]();
}

uint64_t sub_1D565EB50()
{
  return MEMORY[0x1E0CADE70]();
}

uint64_t sub_1D565EB5C()
{
  return MEMORY[0x1E0CADE90]();
}

uint64_t sub_1D565EB68()
{
  return MEMORY[0x1E0CAE390]();
}

uint64_t sub_1D565EB74()
{
  return MEMORY[0x1E0CAE3A0]();
}

uint64_t sub_1D565EB80()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1D565EB8C()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1D565EB98()
{
  return MEMORY[0x1E0CAE630]();
}

uint64_t sub_1D565EBA4()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1D565EBB0()
{
  return MEMORY[0x1E0CAE6E0]();
}

uint64_t sub_1D565EBBC()
{
  return MEMORY[0x1E0CAE9B8]();
}

uint64_t sub_1D565EBC8()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1D565EBD4()
{
  return MEMORY[0x1E0DC19E0]();
}

uint64_t sub_1D565EBE0()
{
  return MEMORY[0x1E0DC1A00]();
}

uint64_t sub_1D565EBEC()
{
  return MEMORY[0x1E0CAEEE0]();
}

uint64_t sub_1D565EBF8()
{
  return MEMORY[0x1E0CAEF10]();
}

uint64_t sub_1D565EC04()
{
  return MEMORY[0x1E0CAEF60]();
}

uint64_t sub_1D565EC10()
{
  return MEMORY[0x1E0CAF240]();
}

uint64_t sub_1D565EC1C()
{
  return MEMORY[0x1E0CAF278]();
}

uint64_t sub_1D565EC28()
{
  return MEMORY[0x1E0CAF2C8]();
}

uint64_t sub_1D565EC34()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1D565EC40()
{
  return MEMORY[0x1E0CAF400]();
}

uint64_t sub_1D565EC4C()
{
  return MEMORY[0x1E0CAF458]();
}

uint64_t sub_1D565EC58()
{
  return MEMORY[0x1E0CAF460]();
}

uint64_t sub_1D565EC64()
{
  return MEMORY[0x1E0CAF480]();
}

uint64_t sub_1D565EC70()
{
  return MEMORY[0x1E0CAF780]();
}

uint64_t sub_1D565EC7C()
{
  return MEMORY[0x1E0CAF790]();
}

uint64_t sub_1D565EC88()
{
  return MEMORY[0x1E0CAF940]();
}

uint64_t sub_1D565EC94()
{
  return MEMORY[0x1E0DC1A18]();
}

uint64_t sub_1D565ECA0()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1D565ECAC()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1D565ECB8()
{
  return MEMORY[0x1E0CAF9B0]();
}

uint64_t sub_1D565ECC4()
{
  return MEMORY[0x1E0CAF9D0]();
}

uint64_t sub_1D565ECD0()
{
  return MEMORY[0x1E0CAF9F8]();
}

uint64_t sub_1D565ECDC()
{
  return MEMORY[0x1E0CAFA20]();
}

uint64_t sub_1D565ECE8()
{
  return MEMORY[0x1E0CAFA28]();
}

uint64_t sub_1D565ECF4()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1D565ED00()
{
  return MEMORY[0x1E0CAFED8]();
}

uint64_t sub_1D565ED0C()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1D565ED18()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1D565ED24()
{
  return MEMORY[0x1E0CB00A0]();
}

uint64_t sub_1D565ED30()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1D565ED3C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1D565ED48()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1D565ED54()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1D565ED60()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1D565ED6C()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1D565ED78()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1D565ED84()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1D565ED90()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1D565ED9C()
{
  return MEMORY[0x1E0CB0968]();
}

uint64_t sub_1D565EDA8()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1D565EDB4()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1D565EDC0()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1D565EDCC()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1D565EDD8()
{
  return MEMORY[0x1E0CB1458]();
}

uint64_t sub_1D565EDE4()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1D565EDF0()
{
  return MEMORY[0x1E0DC1A30]();
}

uint64_t sub_1D565EDFC()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_1D565EE08()
{
  return MEMORY[0x1E0DEFC78]();
}

uint64_t sub_1D565EE14()
{
  return MEMORY[0x1E0DEFC80]();
}

uint64_t sub_1D565EE20()
{
  return MEMORY[0x1E0DEFCD0]();
}

uint64_t sub_1D565EE2C()
{
  return MEMORY[0x1E0DEFD58]();
}

uint64_t sub_1D565EE38()
{
  return MEMORY[0x1E0DEFD60]();
}

uint64_t sub_1D565EE44()
{
  return MEMORY[0x1E0DEFD68]();
}

uint64_t sub_1D565EE50()
{
  return MEMORY[0x1E0DEFD70]();
}

uint64_t sub_1D565EE5C()
{
  return MEMORY[0x1E0DEFD78]();
}

uint64_t sub_1D565EE68()
{
  return MEMORY[0x1E0DEFD80]();
}

uint64_t sub_1D565EE74()
{
  return MEMORY[0x1E0D21068]();
}

uint64_t sub_1D565EE80()
{
  return MEMORY[0x1E0D210A0]();
}

uint64_t sub_1D565EE8C()
{
  return MEMORY[0x1E0D210E0]();
}

uint64_t sub_1D565EE98()
{
  return MEMORY[0x1E0D210E8]();
}

uint64_t sub_1D565EEA4()
{
  return MEMORY[0x1E0D21140]();
}

uint64_t sub_1D565EEB0()
{
  return MEMORY[0x1E0D21150]();
}

uint64_t sub_1D565EEBC()
{
  return MEMORY[0x1E0D12F68]();
}

uint64_t sub_1D565EEC8()
{
  return MEMORY[0x1E0D12F78]();
}

uint64_t sub_1D565EED4()
{
  return MEMORY[0x1E0D12F90]();
}

uint64_t sub_1D565EEE0()
{
  return MEMORY[0x1E0D12F98]();
}

uint64_t sub_1D565EEEC()
{
  return MEMORY[0x1E0CA9B80]();
}

uint64_t sub_1D565EEF8()
{
  return MEMORY[0x1E0CA9B90]();
}

uint64_t sub_1D565EF04()
{
  return MEMORY[0x1E0D81298]();
}

uint64_t sub_1D565EF10()
{
  return MEMORY[0x1E0D812A8]();
}

uint64_t sub_1D565EF1C()
{
  return MEMORY[0x1E0D812B8]();
}

uint64_t sub_1D565EF28()
{
  return MEMORY[0x1E0D812C8]();
}

uint64_t sub_1D565EF34()
{
  return MEMORY[0x1E0D812D0]();
}

uint64_t sub_1D565EF40()
{
  return MEMORY[0x1E0D812D8]();
}

uint64_t sub_1D565EF4C()
{
  return MEMORY[0x1E0D812E0]();
}

uint64_t sub_1D565EF58()
{
  return MEMORY[0x1E0D81338]();
}

uint64_t sub_1D565EF64()
{
  return MEMORY[0x1E0D81340]();
}

uint64_t sub_1D565EF70()
{
  return MEMORY[0x1E0D81348]();
}

uint64_t sub_1D565EF7C()
{
  return MEMORY[0x1E0D81350]();
}

uint64_t sub_1D565EF88()
{
  return MEMORY[0x1E0D81358]();
}

uint64_t sub_1D565EF94()
{
  return MEMORY[0x1E0D81380]();
}

uint64_t sub_1D565EFA0()
{
  return MEMORY[0x1E0D813A0]();
}

uint64_t sub_1D565EFAC()
{
  return MEMORY[0x1E0D813B0]();
}

uint64_t sub_1D565EFB8()
{
  return MEMORY[0x1E0D813C8]();
}

uint64_t sub_1D565EFC4()
{
  return MEMORY[0x1E0D813D0]();
}

uint64_t sub_1D565EFD0()
{
  return MEMORY[0x1E0D813E0]();
}

uint64_t sub_1D565EFDC()
{
  return MEMORY[0x1E0D813E8]();
}

uint64_t sub_1D565EFE8()
{
  return MEMORY[0x1E0D813F8]();
}

uint64_t sub_1D565EFF4()
{
  return MEMORY[0x1E0D81400]();
}

uint64_t sub_1D565F000()
{
  return MEMORY[0x1E0D81408]();
}

uint64_t sub_1D565F00C()
{
  return MEMORY[0x1E0D81410]();
}

uint64_t sub_1D565F018()
{
  return MEMORY[0x1E0D81418]();
}

uint64_t sub_1D565F024()
{
  return MEMORY[0x1E0D81420]();
}

uint64_t sub_1D565F030()
{
  return MEMORY[0x1E0D81428]();
}

uint64_t sub_1D565F03C()
{
  return MEMORY[0x1E0D81438]();
}

uint64_t sub_1D565F048()
{
  return MEMORY[0x1E0D81470]();
}

uint64_t sub_1D565F054()
{
  return MEMORY[0x1E0D814D8]();
}

uint64_t sub_1D565F060()
{
  return MEMORY[0x1E0D814E0]();
}

uint64_t sub_1D565F06C()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1D565F078()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1D565F084()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1D565F090()
{
  return MEMORY[0x1E0D1DB48]();
}

uint64_t sub_1D565F09C()
{
  return MEMORY[0x1E0D1DB50]();
}

uint64_t sub_1D565F0A8()
{
  return MEMORY[0x1E0DC1FF0]();
}

uint64_t sub_1D565F0B4()
{
  return MEMORY[0x1E0DC2020]();
}

uint64_t sub_1D565F0C0()
{
  return MEMORY[0x1E0DC20B8]();
}

uint64_t sub_1D565F0CC()
{
  return MEMORY[0x1E0DC20D0]();
}

uint64_t sub_1D565F0D8()
{
  return MEMORY[0x1E0DC20D8]();
}

uint64_t sub_1D565F0E4()
{
  return MEMORY[0x1E0DC20E8]();
}

uint64_t sub_1D565F0F0()
{
  return MEMORY[0x1E0DC20F0]();
}

uint64_t sub_1D565F0FC()
{
  return MEMORY[0x1E0DC2100]();
}

uint64_t sub_1D565F108()
{
  return MEMORY[0x1E0DC2110]();
}

uint64_t sub_1D565F114()
{
  return MEMORY[0x1E0DC2118]();
}

uint64_t sub_1D565F120()
{
  return MEMORY[0x1E0DC2120]();
}

uint64_t sub_1D565F12C()
{
  return MEMORY[0x1E0DC2130]();
}

uint64_t sub_1D565F138()
{
  return MEMORY[0x1E0DC2408]();
}

uint64_t sub_1D565F144()
{
  return MEMORY[0x1E0DC2410]();
}

uint64_t sub_1D565F150()
{
  return MEMORY[0x1E0DC2448]();
}

uint64_t sub_1D565F15C()
{
  return MEMORY[0x1E0DC2480]();
}

uint64_t sub_1D565F168()
{
  return MEMORY[0x1E0DC2490]();
}

uint64_t sub_1D565F174()
{
  return MEMORY[0x1E0DC24E8]();
}

uint64_t sub_1D565F180()
{
  return MEMORY[0x1E0DC2528]();
}

uint64_t sub_1D565F18C()
{
  return MEMORY[0x1E0DC2548]();
}

uint64_t sub_1D565F198()
{
  return MEMORY[0x1E0DC2868]();
}

uint64_t sub_1D565F1A4()
{
  return MEMORY[0x1E0DC28A8]();
}

uint64_t sub_1D565F1B0()
{
  return MEMORY[0x1E0DC2918]();
}

uint64_t sub_1D565F1BC()
{
  return MEMORY[0x1E0DC2950]();
}

uint64_t sub_1D565F1C8()
{
  return MEMORY[0x1E0DC2960]();
}

uint64_t sub_1D565F1D4()
{
  return MEMORY[0x1E0DC29A0]();
}

uint64_t sub_1D565F1E0()
{
  return MEMORY[0x1E0CD83C0]();
}

uint64_t sub_1D565F1EC()
{
  return MEMORY[0x1E0CD8418]();
}

uint64_t sub_1D565F1F8()
{
  return MEMORY[0x1E0CD8420]();
}

uint64_t sub_1D565F204()
{
  return MEMORY[0x1E0CD8440]();
}

uint64_t sub_1D565F210()
{
  return MEMORY[0x1E0CD8530]();
}

uint64_t sub_1D565F21C()
{
  return MEMORY[0x1E0CD8550]();
}

uint64_t sub_1D565F228()
{
  return MEMORY[0x1E0CD8578]();
}

uint64_t sub_1D565F234()
{
  return MEMORY[0x1E0CD8580]();
}

uint64_t sub_1D565F240()
{
  return MEMORY[0x1E0CD8590]();
}

uint64_t sub_1D565F24C()
{
  return MEMORY[0x1E0CD8598]();
}

uint64_t sub_1D565F258()
{
  return MEMORY[0x1E0CD8648]();
}

uint64_t sub_1D565F264()
{
  return MEMORY[0x1E0CD87C0]();
}

uint64_t sub_1D565F270()
{
  return MEMORY[0x1E0CD87D0]();
}

uint64_t sub_1D565F27C()
{
  return MEMORY[0x1E0CD8808]();
}

uint64_t sub_1D565F288()
{
  return MEMORY[0x1E0CD8818]();
}

uint64_t sub_1D565F294()
{
  return MEMORY[0x1E0CD8C38]();
}

uint64_t sub_1D565F2A0()
{
  return MEMORY[0x1E0CD8C50]();
}

uint64_t sub_1D565F2AC()
{
  return MEMORY[0x1E0CD8CA8]();
}

uint64_t sub_1D565F2B8()
{
  return MEMORY[0x1E0CD8CB0]();
}

uint64_t sub_1D565F2C4()
{
  return MEMORY[0x1E0CD8DE8]();
}

uint64_t sub_1D565F2D0()
{
  return MEMORY[0x1E0CD8EF0]();
}

uint64_t sub_1D565F2DC()
{
  return MEMORY[0x1E0CD8F90]();
}

uint64_t sub_1D565F2E8()
{
  return MEMORY[0x1E0CD8F98]();
}

uint64_t sub_1D565F2F4()
{
  return MEMORY[0x1E0CD8FA0]();
}

uint64_t sub_1D565F300()
{
  return MEMORY[0x1E0CD9168]();
}

uint64_t sub_1D565F30C()
{
  return MEMORY[0x1E0CD91C0]();
}

uint64_t sub_1D565F318()
{
  return MEMORY[0x1E0CD9210]();
}

uint64_t sub_1D565F324()
{
  return MEMORY[0x1E0CD92F0]();
}

uint64_t sub_1D565F330()
{
  return MEMORY[0x1E0CD9558]();
}

uint64_t sub_1D565F33C()
{
  return MEMORY[0x1E0CD9560]();
}

uint64_t sub_1D565F348()
{
  return MEMORY[0x1E0CD9640]();
}

uint64_t sub_1D565F354()
{
  return MEMORY[0x1E0CD9660]();
}

uint64_t sub_1D565F360()
{
  return MEMORY[0x1E0CD9BF0]();
}

uint64_t sub_1D565F36C()
{
  return MEMORY[0x1E0CD9CC0]();
}

uint64_t sub_1D565F378()
{
  return MEMORY[0x1E0CD9CC8]();
}

uint64_t sub_1D565F384()
{
  return MEMORY[0x1E0CD9F70]();
}

uint64_t sub_1D565F390()
{
  return MEMORY[0x1E0CD9F78]();
}

uint64_t sub_1D565F39C()
{
  return MEMORY[0x1E0CDA040]();
}

uint64_t sub_1D565F3A8()
{
  return MEMORY[0x1E0CDA088]();
}

uint64_t sub_1D565F3B4()
{
  return MEMORY[0x1E0CDA0B0]();
}

uint64_t sub_1D565F3C0()
{
  return MEMORY[0x1E0CDA0B8]();
}

uint64_t sub_1D565F3CC()
{
  return MEMORY[0x1E0CDA178]();
}

uint64_t sub_1D565F3D8()
{
  return MEMORY[0x1E0CDA558]();
}

uint64_t sub_1D565F3E4()
{
  return MEMORY[0x1E0CDA5A8]();
}

uint64_t sub_1D565F3F0()
{
  return MEMORY[0x1E0CDA5C0]();
}

uint64_t sub_1D565F3FC()
{
  return MEMORY[0x1E0CDA7B8]();
}

uint64_t sub_1D565F408()
{
  return MEMORY[0x1E0CDA7C0]();
}

uint64_t sub_1D565F414()
{
  return MEMORY[0x1E0CDAA30]();
}

uint64_t sub_1D565F420()
{
  return MEMORY[0x1E0CDACC8]();
}

uint64_t sub_1D565F42C()
{
  return MEMORY[0x1E0CDAFB8]();
}

uint64_t sub_1D565F438()
{
  return MEMORY[0x1E0CDAFC8]();
}

uint64_t sub_1D565F444()
{
  return MEMORY[0x1E0CDAFD0]();
}

uint64_t sub_1D565F450()
{
  return MEMORY[0x1E0CDAFE0]();
}

uint64_t sub_1D565F45C()
{
  return MEMORY[0x1E0CDAFF8]();
}

uint64_t sub_1D565F468()
{
  return MEMORY[0x1E0CDB000]();
}

uint64_t sub_1D565F474()
{
  return MEMORY[0x1E0CDB0E8]();
}

uint64_t sub_1D565F480()
{
  return MEMORY[0x1E0CDB270]();
}

uint64_t sub_1D565F48C()
{
  return MEMORY[0x1E0CDB288]();
}

uint64_t sub_1D565F498()
{
  return MEMORY[0x1E0CDB388]();
}

uint64_t sub_1D565F4A4()
{
  return MEMORY[0x1E0CDB420]();
}

uint64_t sub_1D565F4B0()
{
  return MEMORY[0x1E0CDB430]();
}

uint64_t sub_1D565F4BC()
{
  return MEMORY[0x1E0CDB4C0]();
}

uint64_t sub_1D565F4C8()
{
  return MEMORY[0x1E0CDB4D0]();
}

uint64_t sub_1D565F4D4()
{
  return MEMORY[0x1E0CDB538]();
}

uint64_t sub_1D565F4E0()
{
  return MEMORY[0x1E0CDB558]();
}

uint64_t sub_1D565F4EC()
{
  return MEMORY[0x1E0CDB5D0]();
}

uint64_t sub_1D565F4F8()
{
  return MEMORY[0x1E0CDB5F0]();
}

uint64_t sub_1D565F504()
{
  return MEMORY[0x1E0CDB608]();
}

uint64_t sub_1D565F510()
{
  return MEMORY[0x1E0CDB618]();
}

uint64_t sub_1D565F51C()
{
  return MEMORY[0x1E0CDB658]();
}

uint64_t sub_1D565F528()
{
  return MEMORY[0x1E0CDB668]();
}

uint64_t sub_1D565F534()
{
  return MEMORY[0x1E0CDB678]();
}

uint64_t sub_1D565F540()
{
  return MEMORY[0x1E0CDB688]();
}

uint64_t sub_1D565F54C()
{
  return MEMORY[0x1E0CDB698]();
}

uint64_t sub_1D565F558()
{
  return MEMORY[0x1E0CDB6A8]();
}

uint64_t sub_1D565F564()
{
  return MEMORY[0x1E0CDB6B8]();
}

uint64_t sub_1D565F570()
{
  return MEMORY[0x1E0CDB6D0]();
}

uint64_t sub_1D565F57C()
{
  return MEMORY[0x1E0CDB6E0]();
}

uint64_t sub_1D565F588()
{
  return MEMORY[0x1E0CDB6F0]();
}

uint64_t sub_1D565F594()
{
  return MEMORY[0x1E0CDB6F8]();
}

uint64_t sub_1D565F5A0()
{
  return MEMORY[0x1E0CDB708]();
}

uint64_t sub_1D565F5AC()
{
  return MEMORY[0x1E0CDB908]();
}

uint64_t sub_1D565F5B8()
{
  return MEMORY[0x1E0CDB910]();
}

uint64_t sub_1D565F5C4()
{
  return MEMORY[0x1E0CDB918]();
}

uint64_t sub_1D565F5D0()
{
  return MEMORY[0x1E0CDB920]();
}

uint64_t sub_1D565F5DC()
{
  return MEMORY[0x1E0CDB9F8]();
}

uint64_t sub_1D565F5E8()
{
  return MEMORY[0x1E0CDBFA8]();
}

uint64_t sub_1D565F5F4()
{
  return MEMORY[0x1E0CDC138]();
}

uint64_t sub_1D565F600()
{
  return MEMORY[0x1E0CDC978]();
}

uint64_t sub_1D565F60C()
{
  return MEMORY[0x1E0CDC990]();
}

uint64_t sub_1D565F618()
{
  return MEMORY[0x1E0CDCFD0]();
}

uint64_t sub_1D565F624()
{
  return MEMORY[0x1E0CDD0A0]();
}

uint64_t sub_1D565F630()
{
  return MEMORY[0x1E0CDD0B0]();
}

uint64_t sub_1D565F63C()
{
  return MEMORY[0x1E0CDD320]();
}

uint64_t sub_1D565F648()
{
  return MEMORY[0x1E0CDD358]();
}

uint64_t sub_1D565F654()
{
  return MEMORY[0x1E0CDD368]();
}

uint64_t sub_1D565F660()
{
  return MEMORY[0x1E0CDD380]();
}

uint64_t sub_1D565F66C()
{
  return MEMORY[0x1E0CDD390]();
}

uint64_t sub_1D565F678()
{
  return MEMORY[0x1E0CDD3B0]();
}

uint64_t sub_1D565F684()
{
  return MEMORY[0x1E0CDD438]();
}

uint64_t sub_1D565F690()
{
  return MEMORY[0x1E0CDD5F8]();
}

uint64_t sub_1D565F69C()
{
  return MEMORY[0x1E0CDD668]();
}

uint64_t sub_1D565F6A8()
{
  return MEMORY[0x1E0CDD678]();
}

uint64_t sub_1D565F6B4()
{
  return MEMORY[0x1E0CDD770]();
}

uint64_t sub_1D565F6C0()
{
  return MEMORY[0x1E0CDD780]();
}

uint64_t sub_1D565F6CC()
{
  return MEMORY[0x1E0CDD920]();
}

uint64_t sub_1D565F6D8()
{
  return MEMORY[0x1E0CDDAA0]();
}

uint64_t sub_1D565F6E4()
{
  return MEMORY[0x1E0CDDB68]();
}

uint64_t sub_1D565F6F0()
{
  return MEMORY[0x1E0CDDB98]();
}

uint64_t sub_1D565F6FC()
{
  return MEMORY[0x1E0CDDBC0]();
}

uint64_t sub_1D565F708()
{
  return MEMORY[0x1E0CDDBE0]();
}

uint64_t sub_1D565F714()
{
  return MEMORY[0x1E0CDDC48]();
}

uint64_t sub_1D565F720()
{
  return MEMORY[0x1E0CDDDA0]();
}

uint64_t sub_1D565F72C()
{
  return MEMORY[0x1E0CDDDC0]();
}

uint64_t sub_1D565F738()
{
  return MEMORY[0x1E0CDDDD0]();
}

uint64_t sub_1D565F744()
{
  return MEMORY[0x1E0CDDDE8]();
}

uint64_t sub_1D565F750()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_1D565F75C()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_1D565F768()
{
  return MEMORY[0x1E0CDDE98]();
}

uint64_t sub_1D565F774()
{
  return MEMORY[0x1E0CDDEA0]();
}

uint64_t sub_1D565F780()
{
  return MEMORY[0x1E0CDDEB0]();
}

uint64_t sub_1D565F78C()
{
  return MEMORY[0x1E0CDDF00]();
}

uint64_t sub_1D565F798()
{
  return MEMORY[0x1E0CDDF38]();
}

uint64_t sub_1D565F7A4()
{
  return MEMORY[0x1E0CDDFD0]();
}

uint64_t sub_1D565F7B0()
{
  return MEMORY[0x1E0CDE018]();
}

uint64_t sub_1D565F7BC()
{
  return MEMORY[0x1E0CDE038]();
}

uint64_t sub_1D565F7C8()
{
  return MEMORY[0x1E0CDE050]();
}

uint64_t sub_1D565F7D4()
{
  return MEMORY[0x1E0CDE1C8]();
}

uint64_t sub_1D565F7E0()
{
  return MEMORY[0x1E0CDE1D8]();
}

uint64_t sub_1D565F7EC()
{
  return MEMORY[0x1E0CDE230]();
}

uint64_t sub_1D565F7F8()
{
  return MEMORY[0x1E0CDE338]();
}

uint64_t sub_1D565F804()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_1D565F810()
{
  return MEMORY[0x1E0CDE428]();
}

uint64_t sub_1D565F81C()
{
  return MEMORY[0x1E0CDE440]();
}

uint64_t sub_1D565F828()
{
  return MEMORY[0x1E0CDE4D0]();
}

uint64_t sub_1D565F834()
{
  return MEMORY[0x1E0CDE4E8]();
}

uint64_t sub_1D565F840()
{
  return MEMORY[0x1E0CDE600]();
}

uint64_t sub_1D565F84C()
{
  return MEMORY[0x1E0CDE700]();
}

uint64_t sub_1D565F858()
{
  return MEMORY[0x1E0CDE960]();
}

uint64_t sub_1D565F864()
{
  return MEMORY[0x1E0CDEA88]();
}

uint64_t sub_1D565F870()
{
  return MEMORY[0x1E0CDEAC8]();
}

uint64_t sub_1D565F87C()
{
  return MEMORY[0x1E0CDEB28]();
}

uint64_t sub_1D565F888()
{
  return MEMORY[0x1E0CDEBA8]();
}

uint64_t sub_1D565F894()
{
  return MEMORY[0x1E0CDEC40]();
}

uint64_t sub_1D565F8A0()
{
  return MEMORY[0x1E0CDEC48]();
}

uint64_t sub_1D565F8AC()
{
  return MEMORY[0x1E0CDEDB0]();
}

uint64_t sub_1D565F8B8()
{
  return MEMORY[0x1E0CDEE48]();
}

uint64_t sub_1D565F8C4()
{
  return MEMORY[0x1E0CDEE88]();
}

uint64_t sub_1D565F8D0()
{
  return MEMORY[0x1E0CDEF40]();
}

uint64_t sub_1D565F8DC()
{
  return MEMORY[0x1E0CDEF48]();
}

uint64_t sub_1D565F8E8()
{
  return MEMORY[0x1E0CDEFE8]();
}

uint64_t sub_1D565F8F4()
{
  return MEMORY[0x1E0CDF010]();
}

uint64_t sub_1D565F900()
{
  return MEMORY[0x1E0CDF048]();
}

uint64_t sub_1D565F90C()
{
  return MEMORY[0x1E0CDF088]();
}

uint64_t sub_1D565F918()
{
  return MEMORY[0x1E0CDF130]();
}

uint64_t sub_1D565F924()
{
  return MEMORY[0x1E0CDF158]();
}

uint64_t sub_1D565F930()
{
  return MEMORY[0x1E0CDF178]();
}

uint64_t sub_1D565F93C()
{
  return MEMORY[0x1E0CDF1E8]();
}

uint64_t sub_1D565F948()
{
  return MEMORY[0x1E0CDF1F0]();
}

uint64_t sub_1D565F954()
{
  return MEMORY[0x1E0CDF208]();
}

uint64_t sub_1D565F960()
{
  return MEMORY[0x1E0CDF210]();
}

uint64_t sub_1D565F96C()
{
  return MEMORY[0x1E0CDF2A8]();
}

uint64_t sub_1D565F978()
{
  return MEMORY[0x1E0CDF2B0]();
}

uint64_t sub_1D565F984()
{
  return MEMORY[0x1E0CDF300]();
}

uint64_t sub_1D565F990()
{
  return MEMORY[0x1E0CDF3B0]();
}

uint64_t sub_1D565F99C()
{
  return MEMORY[0x1E0CDF3C0]();
}

uint64_t sub_1D565F9A8()
{
  return MEMORY[0x1E0CDF3F0]();
}

uint64_t sub_1D565F9B4()
{
  return MEMORY[0x1E0CDF458]();
}

uint64_t sub_1D565F9C0()
{
  return MEMORY[0x1E0CDF4A8]();
}

uint64_t sub_1D565F9CC()
{
  return MEMORY[0x1E0CDF4D0]();
}

uint64_t sub_1D565F9D8()
{
  return MEMORY[0x1E0CDF530]();
}

uint64_t sub_1D565F9E4()
{
  return MEMORY[0x1E0CDF608]();
}

uint64_t sub_1D565F9F0()
{
  return MEMORY[0x1E0CDF628]();
}

uint64_t sub_1D565F9FC()
{
  return MEMORY[0x1E0CDF670]();
}

uint64_t sub_1D565FA08()
{
  return MEMORY[0x1E0CDF678]();
}

uint64_t sub_1D565FA14()
{
  return MEMORY[0x1E0CDF6D8]();
}

uint64_t sub_1D565FA20()
{
  return MEMORY[0x1E0CDF730]();
}

uint64_t sub_1D565FA2C()
{
  return MEMORY[0x1E0CDF748]();
}

uint64_t sub_1D565FA38()
{
  return MEMORY[0x1E0CDF758]();
}

uint64_t sub_1D565FA44()
{
  return MEMORY[0x1E0CDF788]();
}

uint64_t sub_1D565FA50()
{
  return MEMORY[0x1E0CDF7E8]();
}

uint64_t sub_1D565FA5C()
{
  return MEMORY[0x1E0CDF888]();
}

uint64_t sub_1D565FA68()
{
  return MEMORY[0x1E0CDF968]();
}

uint64_t sub_1D565FA74()
{
  return MEMORY[0x1E0CDF970]();
}

uint64_t sub_1D565FA80()
{
  return MEMORY[0x1E0CDF988]();
}

uint64_t sub_1D565FA8C()
{
  return MEMORY[0x1E0CDF990]();
}

uint64_t sub_1D565FA98()
{
  return MEMORY[0x1E0CDF9A8]();
}

uint64_t sub_1D565FAA4()
{
  return MEMORY[0x1E0CDF9F0]();
}

uint64_t sub_1D565FAB0()
{
  return MEMORY[0x1E0CDFAE0]();
}

uint64_t sub_1D565FABC()
{
  return MEMORY[0x1E0CDFB18]();
}

uint64_t sub_1D565FAC8()
{
  return MEMORY[0x1E0CDFBE0]();
}

uint64_t sub_1D565FAD4()
{
  return MEMORY[0x1E0CDFC88]();
}

uint64_t sub_1D565FAE0()
{
  return MEMORY[0x1E0CDFCA0]();
}

uint64_t sub_1D565FAEC()
{
  return MEMORY[0x1E0CDFD38]();
}

uint64_t sub_1D565FAF8()
{
  return MEMORY[0x1E0CDFE48]();
}

uint64_t sub_1D565FB04()
{
  return MEMORY[0x1E0CDFE58]();
}

uint64_t sub_1D565FB10()
{
  return MEMORY[0x1E0CDFE98]();
}

uint64_t sub_1D565FB1C()
{
  return MEMORY[0x1E0CDFEA8]();
}

uint64_t sub_1D565FB28()
{
  return MEMORY[0x1E0CDFEC0]();
}

uint64_t sub_1D565FB34()
{
  return MEMORY[0x1E0CDFF28]();
}

uint64_t sub_1D565FB40()
{
  return MEMORY[0x1E0CE0008]();
}

uint64_t sub_1D565FB4C()
{
  return MEMORY[0x1E0CE0020]();
}

uint64_t sub_1D565FB58()
{
  return MEMORY[0x1E0CE0038]();
}

uint64_t sub_1D565FB64()
{
  return MEMORY[0x1E0CE0048]();
}

uint64_t sub_1D565FB70()
{
  return MEMORY[0x1E0CE0160]();
}

uint64_t sub_1D565FB7C()
{
  return MEMORY[0x1E0CE0198]();
}

uint64_t sub_1D565FB88()
{
  return MEMORY[0x1E0CE01B0]();
}

uint64_t sub_1D565FB94()
{
  return MEMORY[0x1E0CE0220]();
}

uint64_t sub_1D565FBA0()
{
  return MEMORY[0x1E0CE0228]();
}

uint64_t sub_1D565FBAC()
{
  return MEMORY[0x1E0CE02D8]();
}

uint64_t sub_1D565FBB8()
{
  return MEMORY[0x1E0CE02F8]();
}

uint64_t sub_1D565FBC4()
{
  return MEMORY[0x1E0CE0568]();
}

uint64_t sub_1D565FBD0()
{
  return MEMORY[0x1E0CE05E8]();
}

uint64_t sub_1D565FBDC()
{
  return MEMORY[0x1E0CE0648]();
}

uint64_t sub_1D565FBE8()
{
  return MEMORY[0x1E0CE0670]();
}

uint64_t sub_1D565FBF4()
{
  return MEMORY[0x1E0CE06C8]();
}

uint64_t sub_1D565FC00()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1D565FC0C()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1D565FC18()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t sub_1D565FC24()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1D565FC30()
{
  return MEMORY[0x1E0D20F80]();
}

uint64_t sub_1D565FC3C()
{
  return MEMORY[0x1E0D20FC0]();
}

uint64_t sub_1D565FC48()
{
  return MEMORY[0x1E0D20FC8]();
}

uint64_t sub_1D565FC54()
{
  return MEMORY[0x1E0D20FE0]();
}

uint64_t sub_1D565FC60()
{
  return MEMORY[0x1E0D20FF0]();
}

uint64_t sub_1D565FC6C()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_1D565FC78()
{
  return MEMORY[0x1E0DEFFB0]();
}

uint64_t sub_1D565FC84()
{
  return MEMORY[0x1E0DE9D80]();
}

uint64_t sub_1D565FC90()
{
  return MEMORY[0x1E0DE9E10]();
}

uint64_t sub_1D565FC9C()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1D565FCA8()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1D565FCB4()
{
  return MEMORY[0x1E0DE9E40]();
}

uint64_t sub_1D565FCC0()
{
  return MEMORY[0x1E0DE9E50]();
}

uint64_t sub_1D565FCCC()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1D565FCD8()
{
  return MEMORY[0x1E0DE9FA8]();
}

uint64_t sub_1D565FCE4()
{
  return MEMORY[0x1E0DE9FC8]();
}

uint64_t sub_1D565FCF0()
{
  return MEMORY[0x1E0DE9FD8]();
}

uint64_t sub_1D565FCFC()
{
  return MEMORY[0x1E0DEA060]();
}

uint64_t sub_1D565FD08()
{
  return MEMORY[0x1E0DEA098]();
}

uint64_t sub_1D565FD14()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1D565FD20()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_1D565FD2C()
{
  return MEMORY[0x1E0DEA1C8]();
}

uint64_t sub_1D565FD38()
{
  return MEMORY[0x1E0DEA1E0]();
}

uint64_t sub_1D565FD44()
{
  return MEMORY[0x1E0DEA360]();
}

uint64_t sub_1D565FD50()
{
  return MEMORY[0x1E0DEA378]();
}

uint64_t sub_1D565FD5C()
{
  return MEMORY[0x1E0DEA390]();
}

uint64_t sub_1D565FD68()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1D565FD74()
{
  return MEMORY[0x1E0DEA448]();
}

uint64_t sub_1D565FD80()
{
  return MEMORY[0x1E0DEA468]();
}

uint64_t sub_1D565FD8C()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1D565FD98()
{
  return MEMORY[0x1E0CB18A0]();
}

uint64_t sub_1D565FDA4()
{
  return MEMORY[0x1E0CB18B8]();
}

uint64_t sub_1D565FDB0()
{
  return MEMORY[0x1E0CB18C0]();
}

uint64_t sub_1D565FDBC()
{
  return MEMORY[0x1E0CB18D8]();
}

uint64_t sub_1D565FDC8()
{
  return MEMORY[0x1E0CB18E0]();
}

uint64_t sub_1D565FDD4()
{
  return MEMORY[0x1E0CB18E8]();
}

uint64_t sub_1D565FDE0()
{
  return MEMORY[0x1E0CB18F0]();
}

uint64_t sub_1D565FDEC()
{
  return MEMORY[0x1E0CB18F8]();
}

uint64_t sub_1D565FDF8()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1D565FE04()
{
  return MEMORY[0x1E0CB1950]();
}

uint64_t sub_1D565FE10()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1D565FE1C()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1D565FE28()
{
  return MEMORY[0x1E0CB1A40]();
}

uint64_t sub_1D565FE34()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1D565FE40()
{
  return MEMORY[0x1E0DEA620]();
}

uint64_t sub_1D565FE4C()
{
  return MEMORY[0x1E0DEA708]();
}

uint64_t sub_1D565FE58()
{
  return MEMORY[0x1E0DEA710]();
}

uint64_t sub_1D565FE64()
{
  return MEMORY[0x1E0DEA718]();
}

uint64_t sub_1D565FE70()
{
  return MEMORY[0x1E0DEA730]();
}

uint64_t sub_1D565FE7C()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1D565FE88()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1D565FE94()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1D565FEA0()
{
  return MEMORY[0x1E0DEA838]();
}

uint64_t sub_1D565FEAC()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1D565FEB8()
{
  return MEMORY[0x1E0DEA8B8]();
}

uint64_t sub_1D565FEC4()
{
  return MEMORY[0x1E0DEAA38]();
}

uint64_t sub_1D565FED0()
{
  return MEMORY[0x1E0DEAA48]();
}

uint64_t sub_1D565FEDC()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_1D565FEE8()
{
  return MEMORY[0x1E0DEAAB0]();
}

uint64_t sub_1D565FEF4()
{
  return MEMORY[0x1E0DEAAE8]();
}

uint64_t sub_1D565FF00()
{
  return MEMORY[0x1E0DEAB00]();
}

uint64_t sub_1D565FF0C()
{
  return MEMORY[0x1E0DEAB20]();
}

uint64_t sub_1D565FF18()
{
  return MEMORY[0x1E0DEAB28]();
}

uint64_t sub_1D565FF24()
{
  return MEMORY[0x1E0DEAB30]();
}

uint64_t sub_1D565FF30()
{
  return MEMORY[0x1E0DEAB40]();
}

uint64_t sub_1D565FF3C()
{
  return MEMORY[0x1E0DEAB48]();
}

uint64_t sub_1D565FF48()
{
  return MEMORY[0x1E0DEABA0]();
}

uint64_t sub_1D565FF54()
{
  return MEMORY[0x1E0DEABC0]();
}

uint64_t sub_1D565FF60()
{
  return MEMORY[0x1E0DEAD00]();
}

uint64_t sub_1D565FF6C()
{
  return MEMORY[0x1E0DEAD08]();
}

uint64_t sub_1D565FF78()
{
  return MEMORY[0x1E0DEAD10]();
}

uint64_t sub_1D565FF84()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1D565FF90()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1D565FF9C()
{
  return MEMORY[0x1E0DEADA8]();
}

uint64_t sub_1D565FFA8()
{
  return MEMORY[0x1E0DEADF8]();
}

uint64_t sub_1D565FFB4()
{
  return MEMORY[0x1E0DEAE00]();
}

uint64_t sub_1D565FFC0()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1D565FFCC()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1D565FFD8()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1D565FFE4()
{
  return MEMORY[0x1E0DEFFC8]();
}

uint64_t sub_1D565FFF0()
{
  return MEMORY[0x1E0DEAE68]();
}

uint64_t sub_1D565FFFC()
{
  return MEMORY[0x1E0DEAE78]();
}

uint64_t sub_1D5660008()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1D5660014()
{
  return MEMORY[0x1E0DEFFD8]();
}

uint64_t sub_1D5660020()
{
  return MEMORY[0x1E0DEAE90]();
}

uint64_t sub_1D566002C()
{
  return MEMORY[0x1E0DEAEC0]();
}

uint64_t sub_1D5660038()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1D5660044()
{
  return MEMORY[0x1E0DEAEF0]();
}

uint64_t sub_1D5660050()
{
  return MEMORY[0x1E0DEAF00]();
}

uint64_t sub_1D566005C()
{
  return MEMORY[0x1E0DEAF70]();
}

uint64_t sub_1D5660068()
{
  return MEMORY[0x1E0DEAF78]();
}

uint64_t sub_1D5660074()
{
  return MEMORY[0x1E0DF0010]();
}

uint64_t sub_1D5660080()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1D566008C()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1D5660098()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1D56600A4()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1D56600B0()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1D56600BC()
{
  return MEMORY[0x1E0DF0700]();
}

uint64_t sub_1D56600C8()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1D56600D4()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1D56600E0()
{
  return MEMORY[0x1E0DF08D0]();
}

uint64_t sub_1D56600EC()
{
  return MEMORY[0x1E0DF0920]();
}

uint64_t sub_1D56600F8()
{
  return MEMORY[0x1E0DEAFF8]();
}

uint64_t sub_1D5660104()
{
  return MEMORY[0x1E0DEB010]();
}

uint64_t sub_1D5660110()
{
  return MEMORY[0x1E0DEB050]();
}

uint64_t sub_1D566011C()
{
  return MEMORY[0x1E0DEB108]();
}

uint64_t sub_1D5660128()
{
  return MEMORY[0x1E0DEB238]();
}

uint64_t sub_1D5660134()
{
  return MEMORY[0x1E0DEB288]();
}

uint64_t sub_1D5660140()
{
  return MEMORY[0x1E0DEB518]();
}

uint64_t sub_1D566014C()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1D5660158()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1D5660164()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1D5660170()
{
  return MEMORY[0x1E0DEB5D0]();
}

uint64_t sub_1D566017C()
{
  return MEMORY[0x1E0DEB620]();
}

uint64_t sub_1D5660188()
{
  return MEMORY[0x1E0DEB648]();
}

uint64_t sub_1D5660194()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1D56601A0()
{
  return MEMORY[0x1E0DEB678]();
}

uint64_t sub_1D56601AC()
{
  return MEMORY[0x1E0DEB6A8]();
}

uint64_t sub_1D56601B8()
{
  return MEMORY[0x1E0DEB6B8]();
}

uint64_t sub_1D56601C4()
{
  return MEMORY[0x1E0DF0018]();
}

uint64_t sub_1D56601D0()
{
  return MEMORY[0x1E0DF0020]();
}

uint64_t sub_1D56601DC()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1D56601E8()
{
  return MEMORY[0x1E0DEB788]();
}

uint64_t sub_1D56601F4()
{
  return MEMORY[0x1E0DEB7A0]();
}

uint64_t sub_1D5660200()
{
  return MEMORY[0x1E0DEB800]();
}

uint64_t sub_1D566020C()
{
  return MEMORY[0x1E0DEB810]();
}

uint64_t sub_1D5660218()
{
  return MEMORY[0x1E0CB1C90]();
}

uint64_t sub_1D5660224()
{
  return MEMORY[0x1E0C9B900]();
}

uint64_t sub_1D5660230()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1D566023C()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1D5660248()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1D5660254()
{
  return MEMORY[0x1E0DEF7E0]();
}

uint64_t sub_1D5660260()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1D566026C()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1D5660278()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1D5660284()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1D5660290()
{
  return MEMORY[0x1E0CB1EC8]();
}

uint64_t sub_1D566029C()
{
  return MEMORY[0x1E0CB1F30]();
}

uint64_t sub_1D56602A8()
{
  return MEMORY[0x1E0CB1F50]();
}

uint64_t sub_1D56602B4()
{
  return MEMORY[0x1E0DC2D18]();
}

uint64_t sub_1D56602C0()
{
  return MEMORY[0x1E0DEFA68]();
}

uint64_t sub_1D56602CC()
{
  return MEMORY[0x1E0DEFA70]();
}

uint64_t sub_1D56602D8()
{
  return MEMORY[0x1E0DC2D40]();
}

uint64_t sub_1D56602E4()
{
  return MEMORY[0x1E0DC2DC0]();
}

uint64_t sub_1D56602F0()
{
  return MEMORY[0x1E0DC2F48]();
}

uint64_t sub_1D56602FC()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1D5660308()
{
  return MEMORY[0x1E0DC2FF8]();
}

uint64_t sub_1D5660314()
{
  return MEMORY[0x1E0DC3008]();
}

uint64_t sub_1D5660320()
{
  return MEMORY[0x1E0DC3038]();
}

uint64_t sub_1D566032C()
{
  return MEMORY[0x1E0DC3070]();
}

uint64_t sub_1D5660338()
{
  return MEMORY[0x1E0DC3080]();
}

uint64_t sub_1D5660344()
{
  return MEMORY[0x1E0DC30B8]();
}

uint64_t sub_1D5660350()
{
  return MEMORY[0x1E0DC3110]();
}

uint64_t sub_1D566035C()
{
  return MEMORY[0x1E0DC3138]();
}

uint64_t sub_1D5660368()
{
  return MEMORY[0x1E0DC3148]();
}

uint64_t sub_1D5660374()
{
  return MEMORY[0x1E0DC31A0]();
}

uint64_t sub_1D5660380()
{
  return MEMORY[0x1E0DC31A8]();
}

uint64_t sub_1D566038C()
{
  return MEMORY[0x1E0DC31B8]();
}

uint64_t sub_1D5660398()
{
  return MEMORY[0x1E0DC31D0]();
}

uint64_t sub_1D56603A4()
{
  return MEMORY[0x1E0DC31D8]();
}

uint64_t sub_1D56603B0()
{
  return MEMORY[0x1E0DC31E0]();
}

uint64_t sub_1D56603BC()
{
  return MEMORY[0x1E0DC3228]();
}

uint64_t sub_1D56603C8()
{
  return MEMORY[0x1E0DC3238]();
}

uint64_t sub_1D56603D4()
{
  return MEMORY[0x1E0DC3248]();
}

uint64_t sub_1D56603E0()
{
  return MEMORY[0x1E0CB2180]();
}

uint64_t sub_1D56603EC()
{
  return MEMORY[0x1E0CB2190]();
}

uint64_t sub_1D56603F8()
{
  return MEMORY[0x1E0DEB8C8]();
}

uint64_t sub_1D5660404()
{
  return MEMORY[0x1E0DEB8E8]();
}

uint64_t sub_1D5660410()
{
  return MEMORY[0x1E0DEB908]();
}

uint64_t sub_1D566041C()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1D5660428()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1D5660434()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1D5660440()
{
  return MEMORY[0x1E0CB2400]();
}

uint64_t sub_1D566044C()
{
  return MEMORY[0x1E0CB2420]();
}

uint64_t sub_1D5660458()
{
  return MEMORY[0x1E0CB2468]();
}

uint64_t sub_1D5660464()
{
  return MEMORY[0x1E0CB2478]();
}

uint64_t sub_1D5660470()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1D566047C()
{
  return MEMORY[0x1E0CB2500]();
}

uint64_t sub_1D5660488()
{
  return MEMORY[0x1E0CB2540]();
}

uint64_t sub_1D5660494()
{
  return MEMORY[0x1E0DEBD58]();
}

uint64_t sub_1D56604A0()
{
  return MEMORY[0x1E0DEBDF8]();
}

uint64_t sub_1D56604AC()
{
  return MEMORY[0x1E0DEBE00]();
}

uint64_t sub_1D56604B8()
{
  return MEMORY[0x1E0DEBE10]();
}

uint64_t sub_1D56604C4()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1D56604D0()
{
  return MEMORY[0x1E0DEBFA8]();
}

uint64_t sub_1D56604DC()
{
  return MEMORY[0x1E0DEBFB0]();
}

uint64_t sub_1D56604E8()
{
  return MEMORY[0x1E0DEC018]();
}

uint64_t sub_1D56604F4()
{
  return MEMORY[0x1E0DEC020]();
}

uint64_t sub_1D5660500()
{
  return MEMORY[0x1E0DEC028]();
}

uint64_t sub_1D566050C()
{
  return MEMORY[0x1E0DEC030]();
}

uint64_t sub_1D5660518()
{
  return MEMORY[0x1E0DEC038]();
}

uint64_t sub_1D5660524()
{
  return MEMORY[0x1E0DEC040]();
}

uint64_t sub_1D5660530()
{
  return MEMORY[0x1E0DEC048]();
}

uint64_t sub_1D566053C()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1D5660548()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1D5660554()
{
  return MEMORY[0x1E0DEC130]();
}

uint64_t sub_1D5660560()
{
  return MEMORY[0x1E0DEC138]();
}

uint64_t sub_1D566056C()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1D5660578()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1D5660584()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1D5660590()
{
  return MEMORY[0x1E0DEC5F8]();
}

uint64_t sub_1D566059C()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1D56605A8()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1D56605B4()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1D56605C0()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1D56605CC()
{
  return MEMORY[0x1E0DEC8D8]();
}

uint64_t sub_1D56605D8()
{
  return MEMORY[0x1E0DEC8F0]();
}

uint64_t sub_1D56605E4()
{
  return MEMORY[0x1E0DF0028]();
}

uint64_t sub_1D56605F0()
{
  return MEMORY[0x1E0DF0030]();
}

uint64_t sub_1D56605FC()
{
  return MEMORY[0x1E0DEC8F8]();
}

uint64_t sub_1D5660608()
{
  return MEMORY[0x1E0DEC978]();
}

uint64_t sub_1D5660614()
{
  return MEMORY[0x1E0DEC9F0]();
}

uint64_t sub_1D5660620()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1D566062C()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1D5660638()
{
  return MEMORY[0x1E0DECBF0]();
}

uint64_t sub_1D5660644()
{
  return MEMORY[0x1E0DECC20]();
}

uint64_t sub_1D5660650()
{
  return MEMORY[0x1E0DECC28]();
}

uint64_t sub_1D566065C()
{
  return MEMORY[0x1E0DECC38]();
}

uint64_t sub_1D5660668()
{
  return MEMORY[0x1E0DECC40]();
}

uint64_t sub_1D5660674()
{
  return MEMORY[0x1E0DECCC0]();
}

uint64_t sub_1D5660680()
{
  return MEMORY[0x1E0DECCC8]();
}

uint64_t sub_1D566068C()
{
  return MEMORY[0x1E0DECCD0]();
}

uint64_t sub_1D5660698()
{
  return MEMORY[0x1E0DECCE0]();
}

uint64_t sub_1D56606A4()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1D56606B0()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1D56606BC()
{
  return MEMORY[0x1E0DECE60]();
}

uint64_t sub_1D56606C8()
{
  return MEMORY[0x1E0DECE68]();
}

uint64_t sub_1D56606D4()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1D56606E0()
{
  return MEMORY[0x1E0DECE78]();
}

uint64_t sub_1D56606EC()
{
  return MEMORY[0x1E0DECE80]();
}

uint64_t sub_1D56606F8()
{
  return MEMORY[0x1E0DECE88]();
}

uint64_t sub_1D5660704()
{
  return MEMORY[0x1E0DECE90]();
}

uint64_t sub_1D5660710()
{
  return MEMORY[0x1E0DECE98]();
}

uint64_t sub_1D566071C()
{
  return MEMORY[0x1E0DECF18]();
}

uint64_t sub_1D5660728()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1D5660734()
{
  return MEMORY[0x1E0DED510]();
}

uint64_t sub_1D5660740()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_1D566074C()
{
  return MEMORY[0x1E0DED550]();
}

uint64_t sub_1D5660758()
{
  return MEMORY[0x1E0DED558]();
}

uint64_t sub_1D5660764()
{
  return MEMORY[0x1E0DED560]();
}

uint64_t sub_1D5660770()
{
  return MEMORY[0x1E0DED568]();
}

uint64_t sub_1D566077C()
{
  return MEMORY[0x1E0DED5E8]();
}

uint64_t sub_1D5660788()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1D5660794()
{
  return MEMORY[0x1E0DED5F8]();
}

uint64_t sub_1D56607A0()
{
  return MEMORY[0x1E0DED788]();
}

uint64_t sub_1D56607AC()
{
  return MEMORY[0x1E0DED988]();
}

uint64_t sub_1D56607B8()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1D56607C4()
{
  return MEMORY[0x1E0DEDA00]();
}

uint64_t sub_1D56607D0()
{
  return MEMORY[0x1E0DEDA08]();
}

uint64_t sub_1D56607DC()
{
  return MEMORY[0x1E0DEDA10]();
}

uint64_t sub_1D56607E8()
{
  return MEMORY[0x1E0DEDA18]();
}

uint64_t sub_1D56607F4()
{
  return MEMORY[0x1E0DEDA20]();
}

uint64_t sub_1D5660800()
{
  return MEMORY[0x1E0DEDA28]();
}

uint64_t sub_1D566080C()
{
  return MEMORY[0x1E0DEDA30]();
}

uint64_t sub_1D5660818()
{
  return MEMORY[0x1E0DEDA50]();
}

uint64_t sub_1D5660824()
{
  return MEMORY[0x1E0CB2620]();
}

uint64_t sub_1D5660830()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_1D566083C()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1D5660848()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1D5660854()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1D5660860()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1D566086C()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1D5660878()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1D5660884()
{
  return MEMORY[0x1E0DEDF08]();
}

uint64_t sub_1D5660890()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1D566089C()
{
  return MEMORY[0x1E0DEE900]();
}

uint64_t sub_1D56608A8()
{
  return MEMORY[0x1E0DEE908]();
}

uint64_t sub_1D56608B4()
{
  return MEMORY[0x1E0DEE910]();
}

uint64_t sub_1D56608C0()
{
  return MEMORY[0x1E0DEE918]();
}

uint64_t sub_1D56608CC()
{
  return MEMORY[0x1E0DEE920]();
}

uint64_t sub_1D56608D8()
{
  return MEMORY[0x1E0DEE928]();
}

uint64_t sub_1D56608E4()
{
  return MEMORY[0x1E0DEE930]();
}

uint64_t sub_1D56608F0()
{
  return MEMORY[0x1E0DEE938]();
}

uint64_t sub_1D56608FC()
{
  return MEMORY[0x1E0DEE940]();
}

uint64_t sub_1D5660908()
{
  return MEMORY[0x1E0DEE948]();
}

uint64_t sub_1D5660914()
{
  return MEMORY[0x1E0DEE950]();
}

uint64_t sub_1D5660920()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x1E0C9BB48](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1E0C9BB60](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1E0C9BB78](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1E0C9BB80](context);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE40](data);
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x1E0C9CB98](image, space);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CFDataRef ColorSyncProfileCopyData(ColorSyncProfileRef prof, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C95458](prof, error);
}

ColorSyncProfileRef ColorSyncProfileCreateWithName(CFStringRef name)
{
  return (ColorSyncProfileRef)MEMORY[0x1E0C95498](name);
}

uint64_t EFArraysAreEqual()
{
  return MEMORY[0x1E0D1ECB8]();
}

uint64_t EFContentProtectionGetObservedState()
{
  return MEMORY[0x1E0D1ED18]();
}

uint64_t EFContentProtectionStateDescription()
{
  return MEMORY[0x1E0D1ED20]();
}

uint64_t EFObjectsAreEqual()
{
  return MEMORY[0x1E0D1EDC8]();
}

uint64_t EFSaveTailspin()
{
  return MEMORY[0x1E0D1EE20]();
}

uint64_t EMIsGreymatterAvailableWithOverride()
{
  return MEMORY[0x1E0D1DC60]();
}

uint64_t EMIsGreymatterSupportedWithOverride()
{
  return MEMORY[0x1E0D1DC68]();
}

uint64_t EMLogSearchableIndexStatus()
{
  return MEMORY[0x1E0D1DC88]();
}

uint64_t MFMessageListLoadingSignpostLog()
{
  return MEMORY[0x1E0D4D818]();
}

uint64_t MFPreferredAbbreviatedNameForAddressAndDisplayName()
{
  return MEMORY[0x1E0CC6868]();
}

uint64_t MFPreferredCompositeNameForAddressAndDisplayName()
{
  return MEMORY[0x1E0CC6870]();
}

uint64_t MFPreferredCompositeNameForPerson()
{
  return MEMORY[0x1E0CC6878]();
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  double v3;
  double v4;
  double v5;
  double v6;
  MKCoordinateRegion result;

  MEMORY[0x1E0CC1570]((__n128)centerCoordinate, *(__n128 *)&centerCoordinate.longitude, latitudinalMeters, longitudinalMeters);
  result.span.longitudeDelta = v6;
  result.span.latitudeDelta = v5;
  result.center.longitude = v4;
  result.center.latitude = v3;
  return result;
}

uint64_t MSPreferredAbbreviatedNameForAddressAndDisplayName()
{
  return MEMORY[0x1E0D46D30]();
}

uint64_t MSPreferredCompositeNameForAddressAndDisplayName()
{
  return MEMORY[0x1E0D46D38]();
}

uint64_t MSSharedContactStore()
{
  return MEMORY[0x1E0D46D78]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x1E0DE2C00]();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return MEMORY[0x1E0DE2C80]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1E0DC4728]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1E0DC4888]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0DC4910](category);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0DC4C60](image);
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1E0DC5238]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1E0DC5240]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0DC52B0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0DC52F8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _EFLocalizedString()
{
  return MEMORY[0x1E0D1F0A0]();
}

uint64_t _EFLocalizedStringFromTable()
{
  return MEMORY[0x1E0D1F0A8]();
}

uint64_t _UIBarsDesktopNavigationBarEnabled()
{
  return MEMORY[0x1E0DC5770]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _availability_version_check()
{
  return MEMORY[0x1E0C80CC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x1E0DEEA48]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

long double fmax(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83430](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
}

void rewind(FILE *a1)
{
  MEMORY[0x1E0C85120](a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1E0DEECF0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1E0DEED18]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

