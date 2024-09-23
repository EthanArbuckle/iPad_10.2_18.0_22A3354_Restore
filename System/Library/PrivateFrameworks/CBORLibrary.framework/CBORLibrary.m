uint64_t sub_20D85179C(uint64_t a1, uint64_t a2)
{
  return nullsub_1(*(_QWORD *)(a1 + 24), *(_QWORD *)(a2 - 8));
}

uint64_t sub_20D8517A8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 88))();
  *a2 = result;
  return result;
}

uint64_t sub_20D8517D8(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 96);
  v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_20D851808()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_20D85183C(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_20D851880())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_20D8518C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9108);
  MEMORY[0x24BDAC7A8](v0, v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_20D877E48();
  __swift_allocate_value_buffer(v4, qword_2549C9568);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2549C9568);
  sub_20D877E3C();
  v6 = *(_QWORD *)(v4 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v3, 1, v4);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(v5, v3, v4);
  __break(1u);
  return result;
}

uint64_t CBORDecoder.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_20D8519FC(MEMORY[0x24BEE4AF8]);
  return v0;
}

uint64_t CBORDecoder.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = sub_20D8519FC(MEMORY[0x24BEE4AF8]);
  return v0;
}

unint64_t sub_20D8519FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9110);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9118);
  v6 = sub_20D877ECC();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_20D85C134(v12, (uint64_t)v5, &qword_2549C9110);
    result = sub_20D86E598((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_20D877E48();
    (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    result = (unint64_t)sub_20D85C0C4(v9, (_OWORD *)(v7[7] + 32 * v16));
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_20D851B98(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C90F8);
  v2 = sub_20D877ECC();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_20D85C134(v6, (uint64_t)&v15, &qword_2549C9100);
    v7 = v15;
    v8 = v16;
    result = sub_20D86E628(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_20D85C0C4(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

unint64_t sub_20D851CCC(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9098);
  v2 = (_QWORD *)sub_20D877ECC();
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
    swift_unknownObjectRetain();
    result = sub_20D86E68C((uint64_t)v6);
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

unint64_t sub_20D851DD4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C90C0);
  v2 = (_QWORD *)sub_20D877ECC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = *(v4 - 1);
    v7 = v5;
    result = sub_20D86E68C((uint64_t)v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v2[6] + v10) = v6;
    *(_QWORD *)(v2[7] + v10) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
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

void sub_20D851EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;

  v19 = a5;
  v20 = a1;
  v7 = sub_20D877DAC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (void *)objc_opt_self();
  v13 = (void *)sub_20D877BCC();
  v14 = objc_msgSend(v12, sel_decodeFromData_keepKeyOrdering_noCopy_, v13, 1, 0);

  if (v14)
  {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(*(_QWORD *)v5 + 136))(v20, v14, a4, v19);

  }
  else
  {
    sub_20D877DA0();
    v15 = sub_20D877DB8();
    swift_allocError();
    v17 = v16;
    v18 = (char *)v16 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088) + 48);
    *v17 = v20;
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v18, v11, v7);
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v17, *MEMORY[0x24BEE26E0], v15);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BAA894]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_20D8520E4(uint64_t a1@<X0>, char a2@<W3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
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
  void (*v19)(_BYTE *, _QWORD);
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[32];
  char v34[24];
  uint64_t v35;
  uint64_t v36;

  v32 = a4;
  v6 = v5;
  v30 = a5;
  v31 = a3;
  v36 = a1;
  v29 = sub_20D877DAC();
  v8 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29, v9);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_20D877E48();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12, v14);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2549C9080 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v12, (uint64_t)qword_2549C9568);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v17, v12);
  v35 = MEMORY[0x24BEE1328];
  v18 = a2 & 1;
  v34[0] = a2 & 1;
  v19 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 104))(v33);
  sub_20D852398((uint64_t)v34, (uint64_t)v16);
  v19(v33, 0);
  v20 = (void *)objc_opt_self();
  v21 = (void *)sub_20D877BCC();
  v22 = objc_msgSend(v20, sel_decodeFromData_keepKeyOrdering_noCopy_, v21, 1, v18);

  if (v22)
  {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(*(_QWORD *)v6 + 136))(v36, v22, v31, v32);

  }
  else
  {
    sub_20D877DA0();
    v23 = sub_20D877DB8();
    swift_allocError();
    v25 = v24;
    v26 = (char *)v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088) + 48);
    *v25 = v36;
    v27 = v29;
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v26, v11, v29);
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x24BEE26E0], v23);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v27);
  }
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_20D852398(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  _OWORD v9[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_20D85C0C4((_OWORD *)a1, v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v2;
    *v2 = 0x8000000000000000;
    sub_20D86296C(v9, a2, isUniquelyReferenced_nonNull_native);
    *v2 = v8;
    swift_bridgeObjectRelease();
    v5 = sub_20D877E48();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a2, v5);
  }
  else
  {
    sub_20D85C088(a1, &qword_2549C90C8);
    sub_20D8610B4(a2, v9);
    v7 = sub_20D877E48();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a2, v7);
    return sub_20D85C088((uint64_t)v9, &qword_2549C90C8);
  }
}

uint64_t sub_20D85247C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t (*v14)(void);
  id v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v36 = a4;
  v32 = a5;
  v9 = sub_20D877DAC();
  v34 = *(_QWORD *)(v9 - 8);
  v35 = v9;
  MEMORY[0x24BDAC7A8]();
  v33 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_20D877D64();
  v30 = *(_QWORD *)(v11 - 8);
  v31 = v11;
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v30 - v12;
  v14 = *(uint64_t (**)(void))(*(_QWORD *)v5 + 88);
  v15 = a2;
  v16 = v14();
  type metadata accessor for _CBORDecoder();
  v17 = (_QWORD *)swift_allocObject();
  v18 = MEMORY[0x24BEE4AF8];
  v17[3] = MEMORY[0x24BEE4AF8];
  swift_beginAccess();
  v19 = v15;
  MEMORY[0x212BA9E14]();
  if (*(_QWORD *)((v17[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v17[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_20D877D1C();
  sub_20D877D28();
  sub_20D877D10();
  swift_endAccess();

  v17[2] = v18;
  v17[4] = v16;
  v20 = v37;
  sub_20D852764(v19, a1, a3, v36, (uint64_t)v13);
  if (v20)
    return swift_release();
  v22 = *(_QWORD *)(a3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v13, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v31);
    v23 = v33;
    sub_20D877DA0();
    v24 = sub_20D877DB8();
    swift_allocError();
    v26 = v25;
    v27 = (char *)v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088) + 48);
    *v26 = a1;
    v29 = v34;
    v28 = v35;
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v27, v23, v35);
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v26, *MEMORY[0x24BEE26E0], v24);
    swift_willThrow();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v23, v28);
  }
  else
  {
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v22 + 32))(v32, v13, a3);
  }
}

uint64_t type metadata accessor for _CBORDecoder()
{
  return objc_opt_self();
}

void sub_20D852764(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  int v8;
  uint64_t v9;

  sub_20D85A1D4(a1, a2, a4, (uint64_t)&v9);
  if (!v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C90C8);
    v8 = swift_dynamicCast();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a5, v8 ^ 1u, 1, a3);
  }
}

uint64_t CBORDecoder.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CBORDecoder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_20D85282C(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(**(_QWORD **)v4 + 120))(a1, *a2, a2[1], a3, a4);
}

uint64_t type metadata accessor for CBORDecoder()
{
  return objc_opt_self();
}

uint64_t method lookup function for CBORDecoder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CBORDecoder.userInfo.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of CBORDecoder.userInfo.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of CBORDecoder.userInfo.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of CBORDecoder.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of CBORDecoder.decode<A>(_:from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of CBORDecoder.decode<A>(_:from:noCopyOnDecodeReturn:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

void sub_20D852910(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  swift_beginAccess();
  v7 = *(_QWORD *)(v3 + 24);
  if (!(v7 >> 62))
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
      goto LABEL_3;
LABEL_12:
    swift_bridgeObjectRelease();
LABEL_13:
    v16 = sub_20D877DB8();
    swift_allocError();
    v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v18 = a1;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x24BEE26D0], v16);
    swift_willThrow();
    return;
  }
  swift_bridgeObjectRetain();
  v8 = sub_20D877E9C();
  if (!v8)
    goto LABEL_12;
LABEL_3:
  v9 = v8 - 1;
  if (__OFSUB__(v8, 1))
  {
    __break(1u);
    goto LABEL_15;
  }
  if ((v7 & 0xC000000000000001) != 0)
  {
LABEL_15:
    v10 = (id)MEMORY[0x212BA9EBC](v9, v7);
    goto LABEL_8;
  }
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v9 < *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v10 = *(id *)(v7 + 8 * v9 + 32);
LABEL_8:
    v11 = v10;
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v11, sel_dictionary);
    if (v12)
    {
      v13 = v12;
      sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
      sub_20D85BEFC();
      sub_20D877C14();

      swift_beginAccess();
      v15 = type metadata accessor for _CBORDecoderKeyedContainer(0, a2, a3, v14);
      swift_retain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      MEMORY[0x212BAA8AC](&unk_20D879138, v15);
      sub_20D877EF0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();

      return;
    }

    goto LABEL_13;
  }
  __break(1u);
}

void sub_20D852BBC(_QWORD *a1@<X8>)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 24);
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_12:
    swift_bridgeObjectRelease();
LABEL_13:
    v13 = sub_20D877DB8();
    swift_allocError();
    v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549C90A0);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877DA0();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v15, *MEMORY[0x24BEE26D0], v13);
    swift_willThrow();
    return;
  }
  swift_bridgeObjectRetain();
  v4 = sub_20D877E9C();
  if (!v4)
    goto LABEL_12;
LABEL_3:
  v5 = v4 - 1;
  if (__OFSUB__(v4, 1))
  {
    __break(1u);
    goto LABEL_15;
  }
  if ((v3 & 0xC000000000000001) != 0)
  {
LABEL_15:
    v6 = (id)MEMORY[0x212BA9EBC](v5, v3);
    goto LABEL_8;
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v5 < *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v6 = *(id *)(v3 + 8 * v5 + 32);
LABEL_8:
    v7 = v6;
    swift_bridgeObjectRelease();
    v8 = objc_msgSend(v7, sel_array);
    if (v8)
    {
      v9 = v8;
      sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
      v10 = sub_20D877CF8();

      swift_beginAccess();
      v11 = *(_QWORD *)(v1 + 16);
      a1[3] = &type metadata for _CBORDecoderUnkeyedContainer;
      a1[4] = sub_20D85BE84();
      v12 = (_QWORD *)swift_allocObject();
      *a1 = v12;
      swift_retain();
      swift_bridgeObjectRetain();

      v12[2] = v11;
      v12[3] = 0;
      v12[4] = v1;
      v12[5] = v10;
      return;
    }

    goto LABEL_13;
  }
  __break(1u);
}

uint64_t sub_20D852E1C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_20D852E54()
{
  return swift_bridgeObjectRetain();
}

void sub_20D852E60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D852910(a1, a2, a3);
}

void sub_20D852E80(_QWORD *a1@<X8>)
{
  sub_20D852BBC(a1);
}

uint64_t sub_20D852EA0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[3] = type metadata accessor for _CBORDecoder();
  a1[4] = sub_20D85BF98(&qword_2549C9090, (uint64_t)&unk_20D878F30);
  *a1 = v3;
  return swift_retain();
}

unint64_t sub_20D852F00()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t result;
  id v7;

  if ((sub_20D854A98() & 1) != 0)
  {
    v1 = sub_20D877DB8();
    swift_allocError();
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v3 = MEMORY[0x24BEE1328];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877D7C();
    swift_bridgeObjectRelease();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 104))(v3, *MEMORY[0x24BEE26E0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  v4 = *(_QWORD *)(v0 + 24);
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_5;
LABEL_13:
    result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v5 = sub_20D877E9C();
  if (!v5)
    goto LABEL_13;
LABEL_5:
  result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    v7 = (id)MEMORY[0x212BA9EBC](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_20D8530D4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t result;
  id v7;

  if ((sub_20D854A98() & 1) != 0)
  {
    v1 = sub_20D877DB8();
    swift_allocError();
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v3 = MEMORY[0x24BEE0D00];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877D7C();
    swift_bridgeObjectRelease();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 104))(v3, *MEMORY[0x24BEE26E0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  v4 = *(_QWORD *)(v0 + 24);
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_5;
LABEL_13:
    result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v5 = sub_20D877E9C();
  if (!v5)
    goto LABEL_13;
LABEL_5:
  result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    v7 = (id)MEMORY[0x212BA9EBC](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_20D8532A8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t result;
  id v7;

  if ((sub_20D854A98() & 1) != 0)
  {
    v1 = sub_20D877DB8();
    swift_allocError();
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v3 = MEMORY[0x24BEE13C8];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877D7C();
    swift_bridgeObjectRelease();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 104))(v3, *MEMORY[0x24BEE26E0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  v4 = *(_QWORD *)(v0 + 24);
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_5;
LABEL_13:
    result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v5 = sub_20D877E9C();
  if (!v5)
    goto LABEL_13;
LABEL_5:
  result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    v7 = (id)MEMORY[0x212BA9EBC](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_20D85347C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t result;
  id v7;

  if ((sub_20D854A98() & 1) != 0)
  {
    v1 = sub_20D877DB8();
    swift_allocError();
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v3 = MEMORY[0x24BEE14E8];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877D7C();
    swift_bridgeObjectRelease();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 104))(v3, *MEMORY[0x24BEE26E0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  v4 = *(_QWORD *)(v0 + 24);
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_5;
LABEL_13:
    result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v5 = sub_20D877E9C();
  if (!v5)
    goto LABEL_13;
LABEL_5:
  result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    v7 = (id)MEMORY[0x212BA9EBC](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_20D853650()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t result;
  id v7;

  if ((sub_20D854A98() & 1) != 0)
  {
    v1 = sub_20D877DB8();
    swift_allocError();
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v3 = MEMORY[0x24BEE1768];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877D7C();
    swift_bridgeObjectRelease();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 104))(v3, *MEMORY[0x24BEE26E0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  v4 = *(_QWORD *)(v0 + 24);
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_5;
LABEL_13:
    result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v5 = sub_20D877E9C();
  if (!v5)
    goto LABEL_13;
LABEL_5:
  result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    v7 = (id)MEMORY[0x212BA9EBC](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_20D853824()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t result;
  id v7;

  if ((sub_20D854A98() & 1) != 0)
  {
    v1 = sub_20D877DB8();
    swift_allocError();
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v3 = MEMORY[0x24BEE3E50];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877D7C();
    swift_bridgeObjectRelease();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 104))(v3, *MEMORY[0x24BEE26E0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  v4 = *(_QWORD *)(v0 + 24);
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_5;
LABEL_13:
    result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v5 = sub_20D877E9C();
  if (!v5)
    goto LABEL_13;
LABEL_5:
  result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    v7 = (id)MEMORY[0x212BA9EBC](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_20D8539F8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t result;
  id v7;

  if ((sub_20D854A98() & 1) != 0)
  {
    v1 = sub_20D877DB8();
    swift_allocError();
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v3 = MEMORY[0x24BEE3F30];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877D7C();
    swift_bridgeObjectRelease();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 104))(v3, *MEMORY[0x24BEE26E0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  v4 = *(_QWORD *)(v0 + 24);
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_5;
LABEL_13:
    result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v5 = sub_20D877E9C();
  if (!v5)
    goto LABEL_13;
LABEL_5:
  result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    v7 = (id)MEMORY[0x212BA9EBC](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_20D853BCC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t result;
  id v7;

  if ((sub_20D854A98() & 1) != 0)
  {
    v1 = sub_20D877DB8();
    swift_allocError();
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v3 = MEMORY[0x24BEE3F88];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877D7C();
    swift_bridgeObjectRelease();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 104))(v3, *MEMORY[0x24BEE26E0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  v4 = *(_QWORD *)(v0 + 24);
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_5;
LABEL_13:
    result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v5 = sub_20D877E9C();
  if (!v5)
    goto LABEL_13;
LABEL_5:
  result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    v7 = (id)MEMORY[0x212BA9EBC](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_20D853DA0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t result;
  id v7;

  if ((sub_20D854A98() & 1) != 0)
  {
    v1 = sub_20D877DB8();
    swift_allocError();
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v3 = MEMORY[0x24BEE4008];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877D7C();
    swift_bridgeObjectRelease();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 104))(v3, *MEMORY[0x24BEE26E0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  v4 = *(_QWORD *)(v0 + 24);
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_5;
LABEL_13:
    result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v5 = sub_20D877E9C();
  if (!v5)
    goto LABEL_13;
LABEL_5:
  result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    v7 = (id)MEMORY[0x212BA9EBC](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_20D853F74()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t result;
  id v7;

  if ((sub_20D854A98() & 1) != 0)
  {
    v1 = sub_20D877DB8();
    swift_allocError();
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v3 = MEMORY[0x24BEE1E88];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877D7C();
    swift_bridgeObjectRelease();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 104))(v3, *MEMORY[0x24BEE26E0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  v4 = *(_QWORD *)(v0 + 24);
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_5;
LABEL_13:
    result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v5 = sub_20D877E9C();
  if (!v5)
    goto LABEL_13;
LABEL_5:
  result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    v7 = (id)MEMORY[0x212BA9EBC](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_20D854148()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t result;
  id v7;

  if ((sub_20D854A98() & 1) != 0)
  {
    v1 = sub_20D877DB8();
    swift_allocError();
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v3 = MEMORY[0x24BEE4260];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877D7C();
    swift_bridgeObjectRelease();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 104))(v3, *MEMORY[0x24BEE26E0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  v4 = *(_QWORD *)(v0 + 24);
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_5;
LABEL_13:
    result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v5 = sub_20D877E9C();
  if (!v5)
    goto LABEL_13;
LABEL_5:
  result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    v7 = (id)MEMORY[0x212BA9EBC](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_20D85431C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t result;
  id v7;

  if ((sub_20D854A98() & 1) != 0)
  {
    v1 = sub_20D877DB8();
    swift_allocError();
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v3 = MEMORY[0x24BEE4478];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877D7C();
    swift_bridgeObjectRelease();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 104))(v3, *MEMORY[0x24BEE26E0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  v4 = *(_QWORD *)(v0 + 24);
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_5;
LABEL_13:
    result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v5 = sub_20D877E9C();
  if (!v5)
    goto LABEL_13;
LABEL_5:
  result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    v7 = (id)MEMORY[0x212BA9EBC](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_20D8544F0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t result;
  id v7;

  if ((sub_20D854A98() & 1) != 0)
  {
    v1 = sub_20D877DB8();
    swift_allocError();
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v3 = MEMORY[0x24BEE44F0];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877D7C();
    swift_bridgeObjectRelease();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 104))(v3, *MEMORY[0x24BEE26E0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  v4 = *(_QWORD *)(v0 + 24);
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_5;
LABEL_13:
    result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v5 = sub_20D877E9C();
  if (!v5)
    goto LABEL_13;
LABEL_5:
  result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    v7 = (id)MEMORY[0x212BA9EBC](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_20D8546C4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t result;
  id v7;

  if ((sub_20D854A98() & 1) != 0)
  {
    v1 = sub_20D877DB8();
    swift_allocError();
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v3 = MEMORY[0x24BEE4568];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877D7C();
    swift_bridgeObjectRelease();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 104))(v3, *MEMORY[0x24BEE26E0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  v4 = *(_QWORD *)(v0 + 24);
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_5;
LABEL_13:
    result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v5 = sub_20D877E9C();
  if (!v5)
    goto LABEL_13;
LABEL_5:
  result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    v7 = (id)MEMORY[0x212BA9EBC](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_20D854898(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t result;
  id v9;

  if ((sub_20D854A98() & 1) != 0)
  {
    v3 = sub_20D877DB8();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v5 = a1;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877D7C();
    sub_20D8782F8();
    swift_bridgeObjectRelease();
    sub_20D877C74();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v5, *MEMORY[0x24BEE26E0], v3);
    swift_willThrow();
    return v3;
  }
  swift_beginAccess();
  v6 = *(_QWORD *)(v1 + 24);
  if (!(v6 >> 62))
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7)
      goto LABEL_5;
LABEL_13:
    result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v7 = sub_20D877E9C();
  if (!v7)
    goto LABEL_13;
LABEL_5:
  result = v7 - 1;
  if (__OFSUB__(v7, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v6 & 0xC000000000000001) != 0)
  {
LABEL_15:
    v9 = (id)MEMORY[0x212BA9EBC](result, v6);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v9 = *(id *)(v6 + 8 * result + 32);
LABEL_10:
    v3 = (uint64_t)v9;
    swift_bridgeObjectRelease();
    return v3;
  }
  __break(1u);
  return result;
}

unint64_t sub_20D854A98()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t result;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v1 = v0 + 24;
  swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 24);
  if (!(v2 >> 62))
  {
    if (*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  v8 = sub_20D877E9C();
  swift_bridgeObjectRelease();
  if (!v8)
    goto LABEL_15;
LABEL_3:
  v1 = *(_QWORD *)v1;
  if (!(v1 >> 62))
  {
    v3 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_5;
LABEL_17:
    result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_18;
  }
LABEL_16:
  swift_bridgeObjectRetain();
  v3 = sub_20D877E9C();
  if (!v3)
    goto LABEL_17;
LABEL_5:
  result = v3 - 1;
  if (__OFSUB__(v3, 1))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if ((v1 & 0xC000000000000001) == 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (result < *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v5 = *(id *)(v1 + 8 * result + 32);
      goto LABEL_10;
    }
    __break(1u);
    return result;
  }
LABEL_19:
  v5 = (id)MEMORY[0x212BA9EBC](result, v1);
LABEL_10:
  v6 = v5;
  swift_bridgeObjectRelease();
  if (objc_msgSend(v6, sel_type) == (id)11)
  {

    return 1;
  }
  else
  {
    v7 = objc_msgSend(v6, sel_type);

    return v7 == (id)12;
  }
}

_QWORD *sub_20D854C04(void *a1)
{
  id v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  if (objc_msgSend(a1, sel_type) == (id)3)
  {
    v2 = objc_msgSend(a1, sel_string);
    if (v2)
    {
      v3 = v2;
      v4 = (_QWORD *)sub_20D877C50();

    }
    else
    {
      return 0;
    }
  }
  else
  {
    v5 = sub_20D877DB8();
    swift_allocError();
    v7 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v7 = MEMORY[0x24BEE0D00];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v8 = objc_msgSend(a1, sel_description);
    v9 = sub_20D877C50();
    v11 = v10;

    v13[0] = v9;
    v13[1] = v11;
    sub_20D877C74();
    v4 = v13;
    sub_20D877C74();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(v7, *MEMORY[0x24BEE26D0], v5);
    swift_willThrow();
  }
  return v4;
}

void sub_20D854DB0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  sub_20D877D64();
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v14 - v9;
  v11 = (void *)sub_20D854898(a1);
  if (!v4)
  {
    v12 = v11;
    sub_20D852764(v11, a1, a2, a3, (uint64_t)v10);

    v13 = *(_QWORD *)(a2 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, a2) == 1)
      __break(1u);
    else
      (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(a4, v10, a2);
  }
}

uint64_t sub_20D854EA4()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

unint64_t sub_20D854EE4()
{
  return sub_20D854A98() & 1;
}

uint64_t sub_20D854F08()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *v0;
  v3 = (void *)sub_20D852F00();
  if (!v1)
  {
    v4 = v3;
    LOBYTE(v2) = sub_20D85B1C8(v3);

  }
  return v2 & 1;
}

_QWORD *sub_20D854F5C()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  void *v4;

  v2 = (_QWORD *)*v0;
  v3 = (void *)sub_20D8530D4();
  if (!v1)
  {
    v4 = v3;
    v2 = sub_20D854C04(v3);

  }
  return v2;
}

double sub_20D854FB8()
{
  uint64_t v0;
  double v1;
  void *v2;
  void *v3;
  double v4;

  v2 = (void *)sub_20D8532A8();
  if (!v0)
  {
    v3 = v2;
    sub_20D85B33C(v2);
    v1 = v4;

  }
  return v1;
}

float sub_20D855014()
{
  uint64_t v0;
  float v1;
  void *v2;
  void *v3;
  float v4;

  v2 = (void *)sub_20D85347C();
  if (!v0)
  {
    v3 = v2;
    sub_20D85B4E0(v2);
    v1 = v4;

  }
  return v1;
}

uint64_t sub_20D855070()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *v0;
  v3 = (void *)sub_20D853650();
  if (!v1)
  {
    v4 = v3;
    v2 = sub_20D85BCE0(v3, MEMORY[0x24BEE1768], 7630409, 0xE300000000000000, (SEL *)&selRef_integerValue);

  }
  return v2;
}

uint64_t sub_20D8550E0(uint64_t a1, uint64_t a2)
{
  return sub_20D8552B8(a1, a2, (uint64_t (*)(void))sub_20D853824, (uint64_t (*)(void))sub_20D85B684);
}

uint64_t sub_20D855104(uint64_t a1, uint64_t a2)
{
  return sub_20D8552B8(a1, a2, (uint64_t (*)(void))sub_20D8539F8, (uint64_t (*)(void))sub_20D85B818);
}

uint64_t sub_20D855128()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *v0;
  v3 = (void *)sub_20D853BCC();
  if (!v1)
  {
    v4 = v3;
    v2 = sub_20D85BCE0(v3, MEMORY[0x24BEE3F88], 0x3233746E49, 0xE500000000000000, (SEL *)&selRef_intValue);

  }
  return v2;
}

uint64_t sub_20D85519C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *v0;
  v3 = (void *)sub_20D853DA0();
  if (!v1)
  {
    v4 = v3;
    v2 = sub_20D85BCE0(v3, MEMORY[0x24BEE4008], 0x3436746E49, 0xE500000000000000, (SEL *)&selRef_longLongValue);

  }
  return v2;
}

uint64_t sub_20D855210()
{
  return sub_20D8780B8();
}

uint64_t sub_20D855224()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *v0;
  v3 = (void *)sub_20D853F74();
  if (!v1)
  {
    v4 = v3;
    v2 = sub_20D85BCE0(v3, MEMORY[0x24BEE1E88], 1953384789, 0xE400000000000000, (SEL *)&selRef_unsignedIntegerValue);

  }
  return v2;
}

uint64_t sub_20D855294(uint64_t a1, uint64_t a2)
{
  return sub_20D8552B8(a1, a2, (uint64_t (*)(void))sub_20D854148, (uint64_t (*)(void))sub_20D85B9B0);
}

uint64_t sub_20D8552B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v7 = *v4;
  v8 = a3();
  if (!v5)
  {
    v9 = (void *)v8;
    v7 = a4();

  }
  return v7;
}

uint64_t sub_20D855310(uint64_t a1, uint64_t a2)
{
  return sub_20D8552B8(a1, a2, (uint64_t (*)(void))sub_20D85431C, (uint64_t (*)(void))sub_20D85BB48);
}

uint64_t sub_20D855334()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *v0;
  v3 = (void *)sub_20D8544F0();
  if (!v1)
  {
    v4 = v3;
    v2 = sub_20D85BCE0(v3, MEMORY[0x24BEE44F0], 0x3233746E4955, 0xE600000000000000, (SEL *)&selRef_unsignedIntValue);

  }
  return v2;
}

uint64_t sub_20D8553A8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *v0;
  v3 = (void *)sub_20D8546C4();
  if (!v1)
  {
    v4 = v3;
    v2 = sub_20D85BCE0(v3, MEMORY[0x24BEE4568], 0x3436746E4955, 0xE600000000000000, (SEL *)&selRef_unsignedLongLongValue);

  }
  return v2;
}

uint64_t sub_20D85541C()
{
  return sub_20D8780C4();
}

void sub_20D855430(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_20D854DB0(a1, a2, a3, a4);
}

uint64_t sub_20D855450()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C91D0);
  sub_20D85CF3C();
  v0 = sub_20D877CD4();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_20D8554E8@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  id v6;
  id v8;
  void *v9;

  if (objc_msgSend(a1, sel_isWholeNumber))
  {
    v6 = objc_msgSend(a1, sel_numeric);
    objc_msgSend(v6, sel_integerValue);

    return sub_20D8782D4();
  }
  else
  {
    v8 = objc_msgSend(a1, sel_string);
    if (v8)
    {
      v9 = v8;
      sub_20D877C50();

      return sub_20D8782BC();
    }
    else
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a3, 1, 1, a2);
    }
  }
}

BOOL sub_20D8555EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v15;

  v8 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, a5);
  v12 = sub_20D86D038((uint64_t)v10, v11, a5);
  v13 = sub_20D8556C4(v12, a3);

  if (v13)
  return v13 != 0;
}

void *sub_20D8556C4(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  char v7;
  id v8;
  void *v10;

  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v6 = sub_20D86E68C((uint64_t)a1);
      if ((v7 & 1) != 0)
      {
        v5 = *(void **)(*(_QWORD *)(a2 + 56) + 8 * v6);
        v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  v3 = a1;
  v4 = sub_20D877E78();

  if (!v4)
    return 0;
  sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t *sub_20D855798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  char *v24;
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;

  v29 = a4;
  v33 = sub_20D877DAC();
  v30 = *(_QWORD *)(v33 - 8);
  v11 = MEMORY[0x24BDAC7A8](v33, v10);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](v11, v15);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v19(v17, a1, a5);
  v20 = sub_20D86D038((uint64_t)v17, v18, a5);
  v21 = (uint64_t *)sub_20D8556C4(v20, a3);

  if (!v21)
  {
    v31 = 0;
    v32 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_20D877D7C();
    sub_20D877C74();
    sub_20D878094();
    sub_20D877DA0();
    v22 = sub_20D877DB8();
    swift_allocError();
    v21 = v23;
    v24 = (char *)v23 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549C91C8) + 48);
    v21[3] = a5;
    v21[4] = a6;
    boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v21);
    v19((char *)boxed_opaque_existential_1Tm, a1, a5);
    v26 = v30;
    v27 = v33;
    (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v24, v13, v33);
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v21, *MEMORY[0x24BEE26C8], v22);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v27);
  }
  return v21;
}

uint64_t sub_20D8559CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  void (*v27)(char *, uint64_t, uint64_t);
  _QWORD *v28;
  _QWORD *v29;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v31;
  unint64_t v32;
  uint64_t *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v13 = *(_QWORD *)(a5 - 8);
  v14 = MEMORY[0x24BDAC7A8](a1, a2);
  v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v14, v17);
  v20 = (char *)&v35 - v19;
  v26 = sub_20D855798(v18, v21, v22, v23, v24, v25);
  if (!v6)
  {
    v38 = v26;
    v39 = 0;
    v36 = a6;
    v37 = a3;
    v27 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    v27(v20, a1, a5);
    v28 = (_QWORD *)(a2 + 16);
    swift_beginAccess();
    v29 = *(_QWORD **)(a2 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a2 + 16) = v29;
    v40 = a4;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v29 = sub_20D8635F8(0, v29[2] + 1, 1, v29);
      *v28 = v29;
    }
    v32 = v29[2];
    v31 = v29[3];
    if (v32 >= v31 >> 1)
      *v28 = sub_20D8635F8((_QWORD *)(v31 > 1), v32 + 1, 1, v29);
    v27(v16, (uint64_t)v20, a5);
    sub_20D86D14C(v32, (uint64_t)v16, (uint64_t *)(a2 + 16), a5, v36);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v20, a5);
    v33 = v38;
    LOBYTE(a4) = objc_msgSend(v38, sel_type) == (id)11 || objc_msgSend(v33, sel_type) == (id)12;
    sub_20D855DC0(a2);

  }
  return a4 & 1;
}

unint64_t sub_20D855BB0(char *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  void (*v27)(uint64_t, char *, uint64_t);
  _QWORD *v28;
  char isUniquelyReferenced_nonNull_native;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  unint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v39;
  void (*v40)(uint64_t, char *, uint64_t);
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  unint64_t v46;

  v13 = *(_QWORD *)(a5 - 8);
  v14 = MEMORY[0x24BDAC7A8](a1, a2);
  v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v14, v17);
  v20 = (char *)&v39 - v19;
  v26 = sub_20D855798(v18, v21, v22, v23, v24, v25);
  if (!v6)
  {
    v41 = 0;
    v42 = v16;
    v44 = v26;
    v45 = a3;
    v43 = v13;
    v27 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 16);
    v39 = a6;
    v40 = v27;
    v27((uint64_t)v20, a1, a5);
    swift_beginAccess();
    v28 = *(_QWORD **)(a2 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a2 + 16) = v28;
    v30 = v20;
    v46 = a4;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      v31 = v39;
      v32 = (uint64_t)v42;
      v33 = (uint64_t *)(a2 + 16);
    }
    else
    {
      v28 = sub_20D8635F8(0, v28[2] + 1, 1, v28);
      v33 = (uint64_t *)(a2 + 16);
      *(_QWORD *)(a2 + 16) = v28;
      v31 = v39;
      v32 = (uint64_t)v42;
    }
    a4 = v28[2];
    v34 = v28[3];
    v35 = v44;
    if (a4 >= v34 >> 1)
      *v33 = (uint64_t)sub_20D8635F8((_QWORD *)(v34 > 1), a4 + 1, 1, v28);
    v40(v32, v30, a5);
    sub_20D86D14C(a4, v32, v33, a5, v31);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v30, a5);
    v36 = v41;
    v37 = sub_20D85B1C8(v35);
    if (!v36)
      LOBYTE(a4) = v37;
    sub_20D855DC0(a2);

  }
  return a4 & 1;
}

uint64_t sub_20D855DC0(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v2 = (_QWORD *)(a1 + 16);
  swift_beginAccess();
  v3 = *(_QWORD **)(a1 + 16);
  if (!v3[2])
  {
    __break(1u);
LABEL_6:
    result = (uint64_t)sub_20D86CDFC(v3);
    v3 = (_QWORD *)result;
    v5 = *(_QWORD *)(result + 16);
    if (v5)
      goto LABEL_4;
    goto LABEL_7;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
    goto LABEL_6;
  v5 = v3[2];
  if (v5)
  {
LABEL_4:
    v6 = v5 - 1;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v3[5 * v5 - 1]);
    v3[2] = v6;
    *v2 = v3;
    return swift_endAccess();
  }
LABEL_7:
  __break(1u);
  return result;
}

char *sub_20D855E64(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  void (*v27)(uint64_t, char *, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char *v38;
  uint64_t v40;
  void (*v41)(uint64_t, char *, uint64_t);
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;

  v12 = a1;
  v13 = *(_QWORD *)(a5 - 8);
  v14 = MEMORY[0x24BDAC7A8](a1, a2);
  v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v14, v17);
  v20 = (char *)&v40 - v19;
  v26 = sub_20D855798(v18, v21, v22, v23, v24, v25);
  if (!v6)
  {
    v42 = 0;
    v43 = v16;
    v45 = v26;
    v46 = a3;
    v44 = v13;
    v27 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 16);
    v40 = a6;
    v41 = v27;
    v27((uint64_t)v20, v12, a5);
    swift_beginAccess();
    v12 = *(char **)(a2 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a2 + 16) = v12;
    v29 = v20;
    v47 = a4;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      v30 = v40;
      v31 = (uint64_t)v43;
      v32 = (uint64_t *)(a2 + 16);
    }
    else
    {
      v12 = (char *)sub_20D8635F8(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
      v32 = (uint64_t *)(a2 + 16);
      *(_QWORD *)(a2 + 16) = v12;
      v30 = v40;
      v31 = (uint64_t)v43;
    }
    v34 = *((_QWORD *)v12 + 2);
    v33 = *((_QWORD *)v12 + 3);
    v35 = v44;
    if (v34 >= v33 >> 1)
      *v32 = (uint64_t)sub_20D8635F8((_QWORD *)(v33 > 1), v34 + 1, 1, v12);
    v41(v31, v29, a5);
    sub_20D86D14C(v34, v31, v32, a5, v30);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v29, a5);
    v36 = v45;
    v37 = v42;
    v38 = (char *)sub_20D854C04(v45);
    if (!v37)
      v12 = v38;
    sub_20D855DC0(a2);

  }
  return v12;
}

double sub_20D85607C(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  double v7;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  void (*v28)(uint64_t, char *, uint64_t);
  _QWORD *v29;
  char isUniquelyReferenced_nonNull_native;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  double v40;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, char *, uint64_t);
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;

  v14 = *(_QWORD *)(a5 - 8);
  v15 = MEMORY[0x24BDAC7A8](a1, a2);
  v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v15, v18);
  v21 = (char *)&v42 - v20;
  v27 = sub_20D855798(v19, v22, v23, v24, v25, v26);
  if (!v6)
  {
    v45 = 0;
    v46 = v17;
    v48 = v27;
    v49 = a3;
    v47 = v14;
    v28 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 16);
    v43 = a6;
    v44 = v28;
    v28((uint64_t)v21, a1, a5);
    swift_beginAccess();
    v29 = *(_QWORD **)(a2 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a2 + 16) = v29;
    v31 = v21;
    v50 = a4;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      v32 = v43;
      v33 = (uint64_t)v46;
      v34 = (uint64_t *)(a2 + 16);
    }
    else
    {
      v29 = sub_20D8635F8(0, v29[2] + 1, 1, v29);
      v34 = (uint64_t *)(a2 + 16);
      *(_QWORD *)(a2 + 16) = v29;
      v32 = v43;
      v33 = (uint64_t)v46;
    }
    v36 = v29[2];
    v35 = v29[3];
    v37 = v47;
    if (v36 >= v35 >> 1)
      *v34 = (uint64_t)sub_20D8635F8((_QWORD *)(v35 > 1), v36 + 1, 1, v29);
    v44(v33, v31, a5);
    sub_20D86D14C(v36, v33, v34, a5, v32);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v31, a5);
    v38 = v48;
    v39 = v45;
    sub_20D85B33C(v48);
    if (!v39)
      v7 = v40;
    sub_20D855DC0(a2);

  }
  return v7;
}

float sub_20D85628C(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  float v7;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  void (*v28)(uint64_t, char *, uint64_t);
  _QWORD *v29;
  char isUniquelyReferenced_nonNull_native;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  float v40;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, char *, uint64_t);
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;

  v14 = *(_QWORD *)(a5 - 8);
  v15 = MEMORY[0x24BDAC7A8](a1, a2);
  v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v15, v18);
  v21 = (char *)&v42 - v20;
  v27 = sub_20D855798(v19, v22, v23, v24, v25, v26);
  if (!v6)
  {
    v45 = 0;
    v46 = v17;
    v48 = v27;
    v49 = a3;
    v47 = v14;
    v28 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 16);
    v43 = a6;
    v44 = v28;
    v28((uint64_t)v21, a1, a5);
    swift_beginAccess();
    v29 = *(_QWORD **)(a2 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a2 + 16) = v29;
    v31 = v21;
    v50 = a4;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      v32 = v43;
      v33 = (uint64_t)v46;
      v34 = (uint64_t *)(a2 + 16);
    }
    else
    {
      v29 = sub_20D8635F8(0, v29[2] + 1, 1, v29);
      v34 = (uint64_t *)(a2 + 16);
      *(_QWORD *)(a2 + 16) = v29;
      v32 = v43;
      v33 = (uint64_t)v46;
    }
    v36 = v29[2];
    v35 = v29[3];
    v37 = v47;
    if (v36 >= v35 >> 1)
      *v34 = (uint64_t)sub_20D8635F8((_QWORD *)(v35 > 1), v36 + 1, 1, v29);
    v44(v33, v31, a5);
    sub_20D86D14C(v36, v33, v34, a5, v32);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v31, a5);
    v38 = v48;
    v39 = v45;
    sub_20D85B4E0(v48);
    if (!v39)
      v7 = v40;
    sub_20D855DC0(a2);

  }
  return v7;
}

unint64_t sub_20D85649C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t *))
{
  uint64_t v7;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  char *v28;
  void (*v29)(char *, uint64_t, uint64_t);
  _QWORD *v30;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  unint64_t v35;
  uint64_t (*v36)(uint64_t *);
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t *v51;
  uint64_t (*v52)(uint64_t *);

  v52 = a7;
  v14 = *(_QWORD *)(a5 - 8);
  v15 = MEMORY[0x24BDAC7A8](a1, a2);
  v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v15, v18);
  v21 = (char *)&v43 - v20;
  v27 = sub_20D855798(v19, v22, v23, v24, v25, v26);
  if (!v7)
  {
    v44 = 0;
    v45 = v21;
    v46 = v17;
    v47 = v14;
    v48 = v27;
    v49 = a3;
    v28 = v21;
    v29 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
    v29(v28, a1, a5);
    v51 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    v30 = *(_QWORD **)(a2 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a2 + 16) = v30;
    v50 = a4;
    v43 = a2;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v30 = sub_20D8635F8(0, v30[2] + 1, 1, v30);
      *v51 = (uint64_t)v30;
    }
    v32 = a6;
    v34 = v45;
    v33 = (uint64_t)v46;
    a4 = v30[2];
    v35 = v30[3];
    v36 = v52;
    v37 = v48;
    if (a4 >= v35 >> 1)
    {
      v42 = sub_20D8635F8((_QWORD *)(v35 > 1), a4 + 1, 1, v30);
      *v51 = (uint64_t)v42;
    }
    v29((char *)v33, (uint64_t)v34, a5);
    sub_20D86D14C(a4, v33, v51, a5, v32);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v34, a5);
    v39 = v43;
    v38 = v44;
    v40 = v36(v37);
    if (!v38)
      a4 = v40;
    sub_20D855DC0(v39);

  }
  return a4;
}

unint64_t sub_20D8566A0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, SEL *a10)
{
  uint64_t v10;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  char *v31;
  _QWORD *v32;
  _QWORD *v33;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t);
  uint64_t v46;
  SEL *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v54 = a8;
  v55 = a7;
  v17 = *(_QWORD *)(a5 - 8);
  v18 = MEMORY[0x24BDAC7A8](a1, a2);
  v20 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v18, v21);
  v24 = (char *)&v44 - v23;
  v30 = sub_20D855798(v22, v25, v26, v27, v28, v29);
  if (!v10)
  {
    v48 = 0;
    v49 = v20;
    v51 = v30;
    v52 = a3;
    v46 = a9;
    v47 = a10;
    v50 = v17;
    v31 = v24;
    v45 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
    v45(v24, a1, a5);
    v32 = (_QWORD *)(a2 + 16);
    swift_beginAccess();
    v33 = *(_QWORD **)(a2 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a2 + 16) = v33;
    v44 = a2;
    v53 = a4;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v33 = sub_20D8635F8(0, v33[2] + 1, 1, v33);
      *v32 = v33;
    }
    v35 = a6;
    v36 = (uint64_t)v49;
    a4 = v33[2];
    v37 = v33[3];
    v38 = v54;
    if (a4 >= v37 >> 1)
      *v32 = sub_20D8635F8((_QWORD *)(v37 > 1), a4 + 1, 1, v33);
    v45((char *)v36, (uint64_t)v31, a5);
    sub_20D86D14C(a4, v36, (uint64_t *)(a2 + 16), a5, v35);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v31, a5);
    v39 = v51;
    v40 = v44;
    v41 = v48;
    v42 = sub_20D85BCE0(v51, v55, v38, v46, v47);
    if (!v41)
      a4 = v42;
    sub_20D855DC0(v40);

  }
  return a4;
}

void sub_20D8568C0(uint64_t a1@<X0>, void (*a2)(_QWORD, _QWORD, _QWORD)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
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
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  void (*v37)(_QWORD, _QWORD, _QWORD);
  uint64_t v38;
  uint64_t *v39;
  _QWORD *v40;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(_QWORD, _QWORD, _QWORD);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;

  v63 = a7;
  v64 = a1;
  v60 = a9;
  v16 = sub_20D877D64();
  v18 = MEMORY[0x24BDAC7A8](v16, v17);
  v20 = (char *)&v53 - v19;
  v61 = *(_QWORD *)(a6 - 8);
  v22 = MEMORY[0x24BDAC7A8](v18, v21);
  v24 = (char *)&v53 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22, v25);
  v27 = (char *)&v53 - v26;
  v62 = a2;
  v28 = (uint64_t)a2;
  v65 = a3;
  v29 = a3;
  v30 = a4;
  v31 = a8;
  v32 = v66;
  v33 = sub_20D855798(v28, v29, a4, a5, a6, a8);
  if (!v32)
  {
    v57 = a5;
    v58 = v24;
    v66 = v33;
    v54 = v20;
    v55 = 0;
    v34 = v60;
    v35 = v61;
    v56 = v30;
    v53 = v31;
    v59 = a10;
    v36 = v27;
    v37 = v62;
    v62 = *(void (**)(_QWORD, _QWORD, _QWORD))(v61 + 16);
    v62(v27, v37, a6);
    v38 = v65;
    v39 = (uint64_t *)(v65 + 16);
    swift_beginAccess();
    v40 = *(_QWORD **)(v38 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v38 + 16) = v40;
    v42 = v35;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v40 = sub_20D8635F8(0, v40[2] + 1, 1, v40);
      *v39 = (uint64_t)v40;
    }
    v43 = v34;
    v44 = (uint64_t)v58;
    v46 = v40[2];
    v45 = v40[3];
    if (v46 >= v45 >> 1)
      *v39 = (uint64_t)sub_20D8635F8((_QWORD *)(v45 > 1), v46 + 1, 1, v40);
    v62(v44, v36, a6);
    sub_20D86D14C(v46, v44, v39, a6, v53);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v36, a6);
    v48 = (uint64_t)v54;
    v47 = v55;
    v49 = v66;
    v50 = v63;
    v51 = v65;
    sub_20D852764(v66, v64, v63, v59, (uint64_t)v54);
    if (v47)
    {
      sub_20D855DC0(v51);

    }
    else
    {
      v52 = *(_QWORD *)(v50 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v48, 1, v50) == 1)
      {
        __break(1u);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 32))(v43, v48, v50);
        sub_20D855DC0(v51);

      }
    }
  }
}

void sub_20D856BB0(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
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
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  char isUniquelyReferenced_nonNull_native;
  void (*v42)(char *, char *, uint64_t);
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t inited;
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t *v60;
  char *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[2];
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;

  v72 = a7;
  v78 = a3;
  v73 = a1;
  v70 = a9;
  v76 = *(_QWORD *)(a6 - 8);
  v15 = MEMORY[0x24BDAC7A8](a1, a2);
  v74 = (char *)v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15, v17);
  v19 = (char *)v66 - v18;
  v20 = sub_20D877DAC();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20, v22);
  v24 = (char *)v66 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = a2;
  v25 = a2;
  v26 = v78;
  v71 = a4;
  v75 = a5;
  v27 = a5;
  v28 = a8;
  v29 = v84;
  v30 = sub_20D855798(v25, v78, a4, v27, a6, a8);
  if (!v29)
  {
    v67 = v24;
    v66[1] = 0;
    v68 = v21;
    v69 = v20;
    v31 = v26;
    v32 = v77;
    v84 = v28;
    v33 = v30;
    if (objc_msgSend(v30, sel_type) == (id)5)
    {
      v73 = v33;
      v34 = v76;
      v35 = *(void (**)(char *, uint64_t, uint64_t))(v76 + 16);
      v36 = v19;
      v37 = v32;
      v38 = a6;
      v35(v19, v37, a6);
      v39 = (_QWORD *)(v31 + 16);
      swift_beginAccess();
      v40 = *(_QWORD **)(v31 + 16);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v31 + 16) = v40;
      v42 = (void (*)(char *, char *, uint64_t))v35;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v40 = sub_20D8635F8(0, v40[2] + 1, 1, v40);
        *v39 = v40;
      }
      v43 = v84;
      v45 = v40[2];
      v44 = v40[3];
      v46 = v74;
      if (v45 >= v44 >> 1)
      {
        *v39 = sub_20D8635F8((_QWORD *)(v44 > 1), v45 + 1, 1, v40);
        v46 = v74;
      }
      v47 = (uint64_t)v46;
      v42(v46, v36, v38);
      sub_20D86D14C(v45, v47, (uint64_t *)(v31 + 16), v38, v43);
      (*(void (**)(char *, uint64_t))(v34 + 8))(v36, v38);
      swift_retain();
      v48 = v73;
      v49 = objc_msgSend(v73, sel_dictionary);
      if (v49)
      {
        v50 = v49;
        sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
        sub_20D85BEFC();
        v51 = sub_20D877C14();

        __swift_instantiateConcreteTypeFromMangledName(&qword_2549C91B8);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_20D878E40;
        *(_QWORD *)(inited + 56) = v38;
        *(_QWORD *)(inited + 64) = v43;
        boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)(inited + 32));
        v42((char *)boxed_opaque_existential_1Tm, (char *)v77, v38);
        v79 = v75;
        swift_bridgeObjectRetain();
        sub_20D85B0CC((_QWORD *)inited);
        v54 = v79;
        v79 = v31;
        v80 = v51;
        v81 = v54;
        v56 = type metadata accessor for _CBORDecoderKeyedContainer(0, v72, a10, v55);
        MEMORY[0x212BAA8AC](&unk_20D879138, v56);
        sub_20D877EF0();
        sub_20D855DC0(v31);

      }
      else
      {
        __break(1u);
      }
    }
    else
    {
      v82 = 0;
      v83 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      sub_20D878094();
      sub_20D877C74();
      sub_20D8782F8();
      sub_20D877C74();
      swift_bridgeObjectRelease();
      v57 = v67;
      sub_20D877DA0();
      v58 = sub_20D877DB8();
      swift_allocError();
      v60 = v59;
      v61 = (char *)v59 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549C91C8) + 48);
      v62 = v84;
      v60[3] = a6;
      v60[4] = v62;
      v63 = __swift_allocate_boxed_opaque_existential_1Tm(v60);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v76 + 16))(v63, v32, a6);
      v64 = v68;
      v65 = v69;
      (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v61, v57, v69);
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v58 - 8) + 104))(v60, *MEMORY[0x24BEE26C8], v58);
      swift_willThrow();

      (*(void (**)(char *, uint64_t))(v64 + 8))(v57, v65);
    }
  }
}

void sub_20D8570B8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char *v29;
  uint64_t *v30;
  id v31;
  void (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t *v34;
  _QWORD *v35;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  char *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t *v52;
  char *v53;
  uint64_t v54;
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  _QWORD *v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;

  v64 = a7;
  v70 = *(_QWORD *)(a5 - 8);
  v13 = MEMORY[0x24BDAC7A8](a1, a2);
  v66 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13, v15);
  v67 = (char *)&v58 - v16;
  v17 = sub_20D877DAC();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17, v19);
  v21 = (char *)&v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = a1;
  v69 = a2;
  v65 = a3;
  v22 = a3;
  v23 = a4;
  v24 = a4;
  v25 = a6;
  v26 = v73;
  v27 = sub_20D855798(a1, a2, v22, v24, a5, a6);
  if (!v26)
  {
    v29 = v67;
    v28 = v68;
    v59 = v21;
    v60 = v18;
    v61 = v17;
    v62 = v23;
    v73 = v25;
    v30 = v27;
    v31 = objc_msgSend(v27, sel_type, 0);
    v63 = v30;
    if (v31 == (id)4)
    {
      v32 = *(void (**)(char *, uint64_t, uint64_t))(v70 + 16);
      v32(v29, v28, a5);
      v33 = v69;
      v34 = (uint64_t *)(v69 + 16);
      swift_beginAccess();
      v35 = *(_QWORD **)(v33 + 16);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v33 + 16) = v35;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v35 = sub_20D8635F8(0, v35[2] + 1, 1, v35);
        *v34 = (uint64_t)v35;
      }
      v37 = (uint64_t)v66;
      v39 = v35[2];
      v38 = v35[3];
      v40 = v70;
      if (v39 >= v38 >> 1)
        *v34 = (uint64_t)sub_20D8635F8((_QWORD *)(v38 > 1), v39 + 1, 1, v35);
      v32((char *)v37, (uint64_t)v29, a5);
      sub_20D86D14C(v39, v37, v34, a5, v73);
      (*(void (**)(char *, uint64_t))(v40 + 8))(v29, a5);
      v41 = v69;
      swift_retain();
      v42 = v63;
      v43 = objc_msgSend(v63, sel_array);
      if (v43)
      {
        v44 = v43;
        sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
        v45 = sub_20D877CF8();

        v46 = *(_QWORD *)(v41 + 16);
        v47 = v64;
        v64[3] = &type metadata for _CBORDecoderUnkeyedContainer;
        v47[4] = sub_20D85BE84();
        v48 = (_QWORD *)swift_allocObject();
        *v47 = v48;
        v48[2] = v46;
        v48[3] = 0;
        v48[4] = v41;
        v48[5] = v45;
        swift_bridgeObjectRetain();
        sub_20D855DC0(v41);

      }
      else
      {
        __break(1u);
      }
    }
    else
    {
      v71 = 0;
      v72 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      sub_20D877D7C();
      sub_20D878094();
      sub_20D877C74();
      v49 = v59;
      sub_20D877DA0();
      v50 = sub_20D877DB8();
      swift_allocError();
      v52 = v51;
      v53 = (char *)v51 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549C91C8) + 48);
      v54 = v73;
      v52[3] = a5;
      v52[4] = v54;
      boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v52);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v70 + 16))(boxed_opaque_existential_1Tm, v28, a5);
      v57 = v60;
      v56 = v61;
      (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v53, v49, v61);
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v50 - 8) + 104))(v52, *MEMORY[0x24BEE26C8], v50);
      swift_willThrow();

      (*(void (**)(char *, uint64_t))(v57 + 8))(v49, v56);
    }
  }
}

uint64_t sub_20D8574E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  _QWORD *v10;
  _QWORD *v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  id v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[24];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v38 = a6;
  v36 = a4;
  v37 = a5;
  v42 = a3;
  sub_20D85CE98(a1, (uint64_t)v39);
  v10 = (_QWORD *)(a2 + 16);
  swift_beginAccess();
  v11 = *(_QWORD **)(a2 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a2 + 16) = v11;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v11 = sub_20D8635F8(0, v11[2] + 1, 1, v11);
    *v10 = v11;
  }
  v14 = v11[2];
  v13 = v11[3];
  if (v14 >= v13 >> 1)
    *v10 = sub_20D8635F8((_QWORD *)(v13 > 1), v14 + 1, 1, v11);
  v15 = v40;
  v16 = v41;
  v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v39, v40);
  MEMORY[0x24BDAC7A8](v17, v17);
  v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v20 + 16))(v19);
  sub_20D86D14C(v14, (uint64_t)v19, (uint64_t *)(a2 + 16), v15, v16);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
  v21 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  sub_20D85CE98(a1, (uint64_t)v39);
  v22 = v40;
  v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v39, v40);
  MEMORY[0x24BDAC7A8](v23, v23);
  v25 = (char *)&v36 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v26 + 16))(v25);
  v27 = sub_20D86D038((uint64_t)v25, v21, v22);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
  v28 = sub_20D8556C4(v27, v42);

  if (!v28)
    v28 = objc_msgSend((id)objc_opt_self(), sel_cborNil, v36, v37, v38);
  v29 = *(_QWORD *)(a2 + 16);
  v30 = *(_QWORD *)(a2 + 32);
  v31 = type metadata accessor for _CBORDecoder();
  v32 = (_QWORD *)swift_allocObject();
  v32[3] = MEMORY[0x24BEE4AF8];
  swift_beginAccess();
  v33 = v28;
  swift_bridgeObjectRetain();
  v34 = swift_bridgeObjectRetain();
  MEMORY[0x212BA9E14](v34);
  if (*(_QWORD *)((v32[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v32[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_20D877D1C();
  sub_20D877D28();
  sub_20D877D10();
  swift_endAccess();
  v32[2] = v29;
  v32[4] = v30;
  a7[3] = v31;
  a7[4] = sub_20D85BF98(&qword_2549C90E8, (uint64_t)&unk_20D878FE8);

  *a7 = v32;
  return sub_20D855DC0(a2);
}

uint64_t sub_20D857800@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD v21[5];

  result = sub_20D8647A8(0x7265707573, 0xE500000000000000);
  if (v12)
  {
    v15 = result;
    v16 = v12;
    v17 = v13;
    v18 = v14;
    v21[3] = &type metadata for CBORCodingKey;
    v21[4] = sub_20D85C5DC();
    v19 = swift_allocObject();
    v21[0] = v19;
    *(_QWORD *)(v19 + 16) = v15;
    *(_QWORD *)(v19 + 24) = v16;
    *(_QWORD *)(v19 + 32) = v17;
    *(_BYTE *)(v19 + 40) = v18 & 1;
    sub_20D8574E4((uint64_t)v21, a1, a2, a3, a4, a5, a6);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v21);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t *sub_20D8578F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  uint64_t v7;
  uint64_t *result;
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t v17[5];

  result = sub_20D855798(a1, a2, a3, a4, a5, a6);
  if (!v7)
  {

    v17[3] = a5;
    v17[4] = a6;
    boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v17);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 16))(boxed_opaque_existential_1Tm, a1, a5);
    sub_20D8574E4((uint64_t)v17, a2, a3, a4, a5, a6, a7);
    return (uint64_t *)__swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
  }
  return result;
}

uint64_t sub_20D8579AC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_20D8579B4()
{
  return sub_20D855450();
}

BOOL sub_20D8579C8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_20D8555EC(a1, *v2, v2[1], v2[2], *(_QWORD *)(a2 + 16));
}

uint64_t sub_20D8579DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857A1C(a1, a2, a3, sub_20D8559CC) & 1;
}

uint64_t sub_20D8579FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857A1C(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_20D855BB0) & 1;
}

uint64_t sub_20D857A1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v4;

  return a4(a1, *v4, v4[1], v4[2], *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24)) & 1;
}

char *sub_20D857A48(char *a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_20D855E64(a1, *v2, v2[1], v2[2], *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

double sub_20D857A6C(char *a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_20D85607C(a1, *v2, v2[1], v2[2], *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

float sub_20D857A90(char *a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_20D85628C(a1, *v2, v2[1], v2[2], *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

unint64_t sub_20D857AB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857B84(a1, a2, a3, MEMORY[0x24BEE1768], 7630409, 0xE300000000000000, (SEL *)&selRef_integerValue);
}

unint64_t sub_20D857AE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857C24(a1, a2, a3, (uint64_t (*)(uint64_t *))sub_20D85B684);
}

unint64_t sub_20D857B00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857C24(a1, a2, a3, (uint64_t (*)(uint64_t *))sub_20D85B818);
}

unint64_t sub_20D857B1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857B84(a1, a2, a3, MEMORY[0x24BEE3F88], 0x3233746E49, 0xE500000000000000, (SEL *)&selRef_intValue);
}

unint64_t sub_20D857B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857B84(a1, a2, a3, MEMORY[0x24BEE4008], 0x3436746E49, 0xE500000000000000, (SEL *)&selRef_longLongValue);
}

unint64_t sub_20D857B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, SEL *a7)
{
  uint64_t v7;

  return sub_20D8566A0(a1, *(_QWORD *)v7, *(_QWORD *)(v7 + 8), *(_QWORD *)(v7 + 16), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a4, a5, a6, a7);
}

uint64_t sub_20D857BC4()
{
  return sub_20D878154();
}

unint64_t sub_20D857BD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857B84(a1, a2, a3, MEMORY[0x24BEE1E88], 1953384789, 0xE400000000000000, (SEL *)&selRef_unsignedIntegerValue);
}

unint64_t sub_20D857C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857C24(a1, a2, a3, (uint64_t (*)(uint64_t *))sub_20D85B9B0);
}

unint64_t sub_20D857C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t *))
{
  uint64_t v4;

  return sub_20D85649C(a1, *(_QWORD *)v4, *(_QWORD *)(v4 + 8), *(_QWORD *)(v4 + 16), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a4);
}

unint64_t sub_20D857C4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857C24(a1, a2, a3, (uint64_t (*)(uint64_t *))sub_20D85BB48);
}

unint64_t sub_20D857C68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857B84(a1, a2, a3, MEMORY[0x24BEE44F0], 0x3233746E4955, 0xE600000000000000, (SEL *)&selRef_unsignedIntValue);
}

unint64_t sub_20D857C9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857B84(a1, a2, a3, MEMORY[0x24BEE4568], 0x3436746E4955, 0xE600000000000000, (SEL *)&selRef_unsignedLongLongValue);
}

uint64_t sub_20D857CD0()
{
  return sub_20D878160();
}

uint64_t sub_20D857CE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_20D857FAC(a1, a2, a3, a4, a5, a6, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t))sub_20D8568C0);
}

uint64_t sub_20D857D00()
{
  return sub_20D878100();
}

uint64_t sub_20D857D14()
{
  return sub_20D8780F4();
}

uint64_t sub_20D857D28()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_20D87810C();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_20D857D48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857ED8(a1, a2, a3, MEMORY[0x24BEE3C00]);
}

uint64_t sub_20D857D64()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_20D878118();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_20D857D84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857E50(a1, a2, a3, MEMORY[0x24BEE3C20]);
}

uint64_t sub_20D857DA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857E94(a1, a2, a3, MEMORY[0x24BEE3C28]);
}

uint64_t sub_20D857DBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857ED8(a1, a2, a3, MEMORY[0x24BEE3C30]);
}

uint64_t sub_20D857DD8()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_20D87813C();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_20D857DF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857F44(a1, a2, a3, MEMORY[0x24BEE3C48]);
}

uint64_t sub_20D857E14()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_20D878124();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_20D857E34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857E50(a1, a2, a3, MEMORY[0x24BEE3C40]);
}

uint64_t sub_20D857E50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FF;
}

uint64_t sub_20D857E78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857E94(a1, a2, a3, MEMORY[0x24BEE3C50]);
}

uint64_t sub_20D857E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FFFF;
}

uint64_t sub_20D857EBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857ED8(a1, a2, a3, MEMORY[0x24BEE3C58]);
}

uint64_t sub_20D857ED8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v4;

  v4 = a4();
  return v4 | ((HIDWORD(v4) & 1) << 32);
}

uint64_t sub_20D857F08()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_20D878148();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_20D857F28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D857F44(a1, a2, a3, MEMORY[0x24BEE3C68]);
}

uint64_t sub_20D857F44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  result = a4();
  if (v4)
    return v6;
  return result;
}

uint64_t sub_20D857F68()
{
  return sub_20D878130();
}

uint64_t sub_20D857F90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_20D857FAC(a1, a2, a3, a4, a5, a6, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t))sub_20D856BB0);
}

uint64_t sub_20D857FAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t))
{
  _QWORD *v7;

  return a7(a1, a2, *v7, v7[1], v7[2], *(_QWORD *)(a5 + 16), a3, *(_QWORD *)(a5 + 24), a4);
}

uint64_t sub_20D857FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D858044(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_20D8570B8);
}

uint64_t sub_20D858004@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;

  return sub_20D857800(*v2, v2[1], v2[2], *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2);
}

uint64_t sub_20D858028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D858044(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_20D8578F4);
}

uint64_t sub_20D858044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v4;

  return a4(a1, *v4, v4[1], v4[2], *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

void sub_20D85806C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 24);
  if (!(v2 >> 62))
  {
    if (v1 < *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_17:
    v10 = sub_20D877DB8();
    swift_allocError();
    v12 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v12 = MEMORY[0x24BEE1328];
    swift_bridgeObjectRetain();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v10 - 8) + 104))(v12, *MEMORY[0x24BEE26E0], v10);
    swift_willThrow();
    return;
  }
  swift_bridgeObjectRetain();
  v9 = sub_20D877E9C();
  swift_bridgeObjectRelease();
  if (v1 >= v9)
    goto LABEL_17;
LABEL_3:
  if ((v2 & 0xC000000000000001) == 0)
  {
    if (v1 < 0)
    {
      __break(1u);
    }
    else if ((unint64_t)v1 < *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v3 = *(id *)(v2 + 8 * v1 + 32);
      goto LABEL_7;
    }
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v3 = (id)MEMORY[0x212BA9EBC](v1, v2);
LABEL_7:
  v4 = v3;
  v5 = objc_msgSend(v3, sel_type);

  if (v5 == (id)11)
  {
LABEL_14:
    *(_QWORD *)(v0 + 8) = v1 + 1;
    return;
  }
  if ((v2 & 0xC000000000000001) != 0)
  {
    v6 = (id)MEMORY[0x212BA9EBC](v1, v2);
    goto LABEL_13;
  }
  if (v1 < 0)
    goto LABEL_21;
  if ((unint64_t)v1 >= *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_22:
    __break(1u);
    return;
  }
  v6 = *(id *)(v2 + 8 * v1 + 32);
LABEL_13:
  v7 = v6;
  v8 = objc_msgSend(v6, sel_type);

  if (v8 == (id)12)
    goto LABEL_14;
}

void sub_20D858264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v2 = *(_QWORD *)(v0 + 8);
  v3 = *(_QWORD *)(v0 + 24);
  if (!(v3 >> 62))
  {
    if (v2 < *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_10:
    v7 = sub_20D877DB8();
    swift_allocError();
    v9 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v9 = MEMORY[0x24BEE1328];
    swift_bridgeObjectRetain();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v9, *MEMORY[0x24BEE26E0], v7);
    swift_willThrow();
    return;
  }
  swift_bridgeObjectRetain();
  v6 = sub_20D877E9C();
  swift_bridgeObjectRelease();
  if (v2 >= v6)
    goto LABEL_10;
LABEL_3:
  if ((v3 & 0xC000000000000001) == 0)
  {
    if (v2 < 0)
    {
      __break(1u);
    }
    else if ((unint64_t)v2 < *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v4 = *(id *)(v3 + 8 * v2 + 32);
      goto LABEL_7;
    }
    __break(1u);
    return;
  }
  v4 = (id)MEMORY[0x212BA9EBC](v2, v3);
LABEL_7:
  v5 = v4;
  sub_20D854C04(v4);

  if (!v1)
    *(_QWORD *)(v0 + 8) = v2 + 1;
}

void sub_20D858400(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v5 = v4;
  v30 = a1;
  v31 = a3;
  v29 = a4;
  v7 = sub_20D877D64();
  v8 = *(_QWORD *)(v7 - 8);
  v10 = MEMORY[0x24BDAC7A8](v7, v9);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v10, v13);
  v16 = (char *)&v28 - v15;
  v17 = *(_QWORD *)(v4 + 8);
  v18 = *(_QWORD *)(v4 + 24);
  if (!(v18 >> 62))
  {
    if (v17 < *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_11:
    v25 = sub_20D877DB8();
    swift_allocError();
    v27 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v27 = MEMORY[0x24BEE1328];
    swift_bridgeObjectRetain();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v27, *MEMORY[0x24BEE26E0], v25);
    swift_willThrow();
    return;
  }
  v28 = v14;
  swift_bridgeObjectRetain();
  v24 = sub_20D877E9C();
  swift_bridgeObjectRelease();
  v14 = v28;
  if (v17 >= v24)
    goto LABEL_11;
LABEL_3:
  v28 = v14;
  if ((v18 & 0xC000000000000001) == 0)
  {
    if (v17 < 0)
    {
      __break(1u);
    }
    else if ((unint64_t)v17 < *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v19 = *(id *)(v18 + 8 * v17 + 32);
      goto LABEL_7;
    }
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  v19 = (id)MEMORY[0x212BA9EBC](v17, v18);
LABEL_7:
  v20 = v19;
  v21 = v32;
  sub_20D852764(v19, v30, a2, v31, (uint64_t)v16);

  if (!v21)
  {
    *(_QWORD *)(v5 + 8) = v17 + 1;
    v22 = v28;
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v12, v16, v28);
    v23 = *(_QWORD *)(a2 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v12, 1, a2) != 1)
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v16, v22);
      (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v29, v12, a2);
      return;
    }
    goto LABEL_16;
  }
}

uint64_t sub_20D858674@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t inited;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  ValueMetadata *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v5 = v4;
  v46 = a1;
  v47 = a3;
  v54 = a2;
  v48 = a4;
  v6 = sub_20D877DAC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (unint64_t *)((char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = *v4;
  v11 = v4[1];
  v13 = v4[3];
  if (!(v13 >> 62))
  {
    if (v11 < *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_14:
    v40 = sub_20D877DB8();
    swift_allocError();
    v42 = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v42 = MEMORY[0x24BEE1328];
    swift_bridgeObjectRetain();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v40 - 8) + 104))(v42, *MEMORY[0x24BEE26E0], v40);
    return swift_willThrow();
  }
  swift_bridgeObjectRetain();
  v39 = sub_20D877E9C();
  swift_bridgeObjectRelease();
  if (v11 >= v39)
    goto LABEL_14;
LABEL_3:
  if ((v13 & 0xC000000000000001) != 0)
  {
    v14 = (id)MEMORY[0x212BA9EBC](v11, v13);
LABEL_7:
    v15 = v14;
    v16 = objc_msgSend(v14, sel_dictionary);

    if (!v16)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549C91B8);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_20D878E40;
      *(_QWORD *)&v49 = 0x3A6D657449;
      *((_QWORD *)&v49 + 1) = 0xE500000000000000;
      v53 = v11;
      sub_20D877F20();
      sub_20D877C74();
      swift_bridgeObjectRelease();
      v28 = v49;
      *(_QWORD *)(inited + 56) = &type metadata for CBORCodingKey;
      *(_QWORD *)(inited + 64) = sub_20D85C5DC();
      v29 = swift_allocObject();
      *(_QWORD *)(inited + 32) = v29;
      *(_OWORD *)(v29 + 16) = v28;
      *(_QWORD *)(v29 + 32) = 0;
      *(_BYTE *)(v29 + 40) = 1;
      *(_QWORD *)&v49 = v12;
      swift_bridgeObjectRetain();
      sub_20D85B0CC((_QWORD *)inited);
      *(_QWORD *)&v49 = 0;
      *((_QWORD *)&v49 + 1) = 0xE000000000000000;
      sub_20D877D7C();
      v30 = *v5;
      swift_bridgeObjectRetain();
      v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549C91C0);
      v32 = MEMORY[0x212BA9E38](v30, v31);
      v34 = v33;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v49 = v32;
      *((_QWORD *)&v49 + 1) = v34;
      sub_20D877C74();
      v53 = v11;
      sub_20D877F20();
      sub_20D877C74();
      swift_bridgeObjectRelease();
      sub_20D877C74();
      sub_20D8782F8();
      sub_20D877C74();
      swift_bridgeObjectRelease();
      sub_20D877DA0();
      v35 = sub_20D877DB8();
      swift_allocError();
      v37 = v36;
      v38 = (char *)v36 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088) + 48);
      *v37 = MEMORY[0x24BEE1328];
      (*(void (**)(char *, unint64_t *, uint64_t))(v7 + 16))(v38, v10, v6);
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v35 - 8) + 104))(v37, *MEMORY[0x24BEE26D0], v35);
      swift_willThrow();
      return (*(uint64_t (**)(unint64_t *, uint64_t))(v7 + 8))(v10, v6);
    }
    sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
    sub_20D85BEFC();
    v17 = sub_20D877C14();

    v6 = v5[2];
    *(_QWORD *)&v49 = 0x3A6D657449;
    *((_QWORD *)&v49 + 1) = 0xE500000000000000;
    v53 = v11;
    sub_20D877F20();
    sub_20D877C74();
    swift_bridgeObjectRelease();
    v44 = *((_QWORD *)&v49 + 1);
    v18 = v49;
    v10 = (unint64_t *)(v6 + 16);
    swift_beginAccess();
    v13 = *(_QWORD *)(v6 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v6 + 16) = v13;
    v45 = v18;
    v46 = v17;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      goto LABEL_9;
    goto LABEL_18;
  }
  if (v11 < 0)
  {
    __break(1u);
  }
  else if ((unint64_t)v11 < *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v14 = *(id *)(v13 + 8 * v11 + 32);
    goto LABEL_7;
  }
  __break(1u);
LABEL_18:
  v13 = (unint64_t)sub_20D8635F8(0, *(_QWORD *)(v13 + 16) + 1, 1, (_QWORD *)v13);
  *v10 = v13;
LABEL_9:
  v21 = *(_QWORD *)(v13 + 16);
  v20 = *(_QWORD *)(v13 + 24);
  if (v21 >= v20 >> 1)
  {
    v13 = (unint64_t)sub_20D8635F8((_QWORD *)(v20 > 1), v21 + 1, 1, (_QWORD *)v13);
    *v10 = v13;
  }
  v51 = &type metadata for CBORCodingKey;
  v52 = sub_20D85C5DC();
  v22 = swift_allocObject();
  *(_QWORD *)&v49 = v22;
  v23 = v44;
  *(_QWORD *)(v22 + 16) = v45;
  *(_QWORD *)(v22 + 24) = v23;
  *(_QWORD *)(v22 + 32) = 0;
  *(_BYTE *)(v22 + 40) = 1;
  *(_QWORD *)(v13 + 16) = v21 + 1;
  sub_20D85C644(&v49, v13 + 40 * v21 + 32);
  v5[1] = v11 + 1;
  *(_QWORD *)&v49 = v6;
  *((_QWORD *)&v49 + 1) = v46;
  v50 = v12;
  v25 = type metadata accessor for _CBORDecoderKeyedContainer(0, v54, v47, v24);
  swift_bridgeObjectRetain();
  swift_retain();
  MEMORY[0x212BAA8AC](&unk_20D879138, v25);
  sub_20D877EF0();
  return sub_20D859234((uint64_t)v5);
}

uint64_t sub_20D858C78@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t inited;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  ValueMetadata *v45;
  unint64_t v46;
  uint64_t v47;
  _QWORD *v48;

  v2 = v1;
  v48 = a1;
  v3 = sub_20D877DAC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (unint64_t *)*v1;
  v8 = v1[1];
  v10 = v1[3];
  if (!(v10 >> 62))
  {
    if (v8 < *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_14:
    v38 = sub_20D877DB8();
    swift_allocError();
    v40 = v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v40 = MEMORY[0x24BEE1328];
    swift_bridgeObjectRetain();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v38 - 8) + 104))(v40, *MEMORY[0x24BEE26E0], v38);
    return swift_willThrow();
  }
  swift_bridgeObjectRetain();
  v37 = sub_20D877E9C();
  swift_bridgeObjectRelease();
  if (v8 >= v37)
    goto LABEL_14;
LABEL_3:
  if ((v10 & 0xC000000000000001) != 0)
  {
    v11 = (id)MEMORY[0x212BA9EBC](v8, v10);
LABEL_7:
    v12 = v11;
    v13 = objc_msgSend(v11, sel_array);

    if (!v13)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549C91B8);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_20D878E40;
      *(_QWORD *)&v44 = 0x3A6D657449;
      *((_QWORD *)&v44 + 1) = 0xE500000000000000;
      v47 = v8;
      sub_20D877F20();
      sub_20D877C74();
      swift_bridgeObjectRelease();
      v26 = v44;
      *(_QWORD *)(inited + 56) = &type metadata for CBORCodingKey;
      *(_QWORD *)(inited + 64) = sub_20D85C5DC();
      v27 = swift_allocObject();
      *(_QWORD *)(inited + 32) = v27;
      *(_OWORD *)(v27 + 16) = v26;
      *(_QWORD *)(v27 + 32) = 0;
      *(_BYTE *)(v27 + 40) = 1;
      *(_QWORD *)&v44 = v9;
      swift_bridgeObjectRetain();
      sub_20D85B0CC((_QWORD *)inited);
      *(_QWORD *)&v44 = 0;
      *((_QWORD *)&v44 + 1) = 0xE000000000000000;
      sub_20D877D7C();
      v28 = *v2;
      swift_bridgeObjectRetain();
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549C91C0);
      v30 = MEMORY[0x212BA9E38](v28, v29);
      v32 = v31;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v44 = v30;
      *((_QWORD *)&v44 + 1) = v32;
      sub_20D877C74();
      v47 = v8;
      sub_20D877F20();
      sub_20D877C74();
      swift_bridgeObjectRelease();
      sub_20D877C74();
      sub_20D877DA0();
      v33 = sub_20D877DB8();
      swift_allocError();
      v35 = v34;
      v36 = (char *)v34 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088) + 48);
      *v35 = MEMORY[0x24BEE1328];
      (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v36, v7, v3);
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v35, *MEMORY[0x24BEE26D0], v33);
      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
    sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
    v14 = sub_20D877CF8();

    v7 = (char *)v2[2];
    *(_QWORD *)&v44 = 0x3A6D657449;
    *((_QWORD *)&v44 + 1) = 0xE500000000000000;
    v47 = v8;
    sub_20D877F20();
    sub_20D877C74();
    swift_bridgeObjectRelease();
    v4 = *((_QWORD *)&v44 + 1);
    v15 = v44;
    v9 = (unint64_t *)(v7 + 16);
    swift_beginAccess();
    v10 = *((_QWORD *)v7 + 2);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *((_QWORD *)v7 + 2) = v10;
    v42 = v15;
    v43 = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      goto LABEL_9;
    goto LABEL_18;
  }
  if (v8 < 0)
  {
    __break(1u);
  }
  else if ((unint64_t)v8 < *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v11 = *(id *)(v10 + 8 * v8 + 32);
    goto LABEL_7;
  }
  __break(1u);
LABEL_18:
  v10 = (unint64_t)sub_20D8635F8(0, *(_QWORD *)(v10 + 16) + 1, 1, (_QWORD *)v10);
  *v9 = v10;
LABEL_9:
  v18 = *(_QWORD *)(v10 + 16);
  v17 = *(_QWORD *)(v10 + 24);
  if (v18 >= v17 >> 1)
  {
    v10 = (unint64_t)sub_20D8635F8((_QWORD *)(v17 > 1), v18 + 1, 1, (_QWORD *)v10);
    *v9 = v10;
  }
  v45 = &type metadata for CBORCodingKey;
  v46 = sub_20D85C5DC();
  v19 = swift_allocObject();
  *(_QWORD *)&v44 = v19;
  *(_QWORD *)(v19 + 16) = v42;
  *(_QWORD *)(v19 + 24) = v4;
  *(_QWORD *)(v19 + 32) = 0;
  *(_BYTE *)(v19 + 40) = 1;
  *(_QWORD *)(v10 + 16) = v18 + 1;
  sub_20D85C644(&v44, v10 + 40 * v18 + 32);
  v20 = *((_QWORD *)v7 + 2);
  v2[1] = v8 + 1;
  v21 = v48;
  v48[3] = &type metadata for _CBORDecoderUnkeyedContainer;
  v21[4] = sub_20D85BE84();
  v22 = (_QWORD *)swift_allocObject();
  *v21 = v22;
  v22[2] = v20;
  v22[3] = 0;
  v23 = v43;
  v22[4] = v7;
  v22[5] = v23;
  swift_retain();
  swift_bridgeObjectRetain();
  return sub_20D859234((uint64_t)v2);
}

uint64_t sub_20D859234(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 16);
  swift_beginAccess();
  v2 = *(_QWORD **)(v1 + 16);
  if (!v2[2])
  {
    __break(1u);
LABEL_6:
    result = (uint64_t)sub_20D86CDFC(v2);
    v2 = (_QWORD *)result;
    v4 = *(_QWORD *)(result + 16);
    if (v4)
      goto LABEL_4;
    goto LABEL_7;
  }
  swift_retain();
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
    goto LABEL_6;
  v4 = v2[2];
  if (v4)
  {
LABEL_4:
    v5 = v4 - 1;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v2[5 * v4 - 1]);
    v2[2] = v5;
    *(_QWORD *)(v1 + 16) = v2;
    swift_endAccess();
    return swift_release();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_20D8592E4@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  __int128 v24;
  ValueMetadata *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = (uint64_t)v1;
  v4 = v1[1];
  v5 = v1[3];
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v19 = sub_20D877E9C();
    swift_bridgeObjectRelease();
    if (v4 < v19)
    {
LABEL_3:
      v23 = a1;
      v6 = v1[2];
      *(_QWORD *)&v24 = 0x3A6D657449;
      *((_QWORD *)&v24 + 1) = 0xE500000000000000;
      v27 = v4;
      sub_20D877F20();
      sub_20D877C74();
      swift_bridgeObjectRelease();
      v7 = (id)0xE500000000000000;
      v28 = 0x3A6D657449;
      v8 = (_QWORD *)(v6 + 16);
      swift_beginAccess();
      v9 = *(_QWORD **)(v6 + 16);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v6 + 16) = v9;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v9 = sub_20D8635F8(0, v9[2] + 1, 1, v9);
        *v8 = v9;
      }
      v12 = v9[2];
      v11 = v9[3];
      v13 = v12 + 1;
      if (v12 >= v11 >> 1)
      {
        v9 = sub_20D8635F8((_QWORD *)(v11 > 1), v12 + 1, 1, v9);
        *v8 = v9;
      }
      v25 = &type metadata for CBORCodingKey;
      v26 = sub_20D85C5DC();
      v14 = swift_allocObject();
      *(_QWORD *)&v24 = v14;
      *(_QWORD *)(v14 + 16) = v28;
      *(_QWORD *)(v14 + 24) = 0xE500000000000000;
      *(_QWORD *)(v14 + 32) = 0;
      *(_BYTE *)(v14 + 40) = 1;
      v9[2] = v13;
      sub_20D85C644(&v24, (uint64_t)&v9[5 * v12 + 4]);
      if ((v5 & 0xC000000000000001) == 0)
      {
        if (v4 < 0)
        {
          __break(1u);
        }
        else if ((unint64_t)v4 < *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          v15 = *(id *)(v5 + 8 * v4 + 32);
          goto LABEL_11;
        }
        __break(1u);
        goto LABEL_18;
      }
      v15 = (id)MEMORY[0x212BA9EBC](v4, v5);
LABEL_11:
      v16 = v15;
      *(_QWORD *)(v2 + 8) = v4 + 1;
      v4 = *(_QWORD *)(v6 + 16);
      v5 = *(_QWORD *)(v6 + 32);
      v13 = type metadata accessor for _CBORDecoder();
      v8 = (_QWORD *)swift_allocObject();
      v8[3] = MEMORY[0x24BEE4AF8];
      swift_beginAccess();
      v7 = v16;
      swift_bridgeObjectRetain();
      v17 = swift_bridgeObjectRetain();
      MEMORY[0x212BA9E14](v17);
      if (*(_QWORD *)((v8[3] & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((v8[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      {
LABEL_12:
        sub_20D877D28();
        sub_20D877D10();
        swift_endAccess();
        v8[2] = v4;
        v8[4] = v5;
        v23[3] = v13;
        v23[4] = sub_20D85BF98(&qword_2549C90E8, (uint64_t)&unk_20D878FE8);

        *v23 = v8;
        return sub_20D859234(v2);
      }
LABEL_18:
      sub_20D877D1C();
      goto LABEL_12;
    }
  }
  else if (v4 < *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v20 = sub_20D877DB8();
  swift_allocError();
  v22 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
  *v22 = MEMORY[0x24BEE1328];
  swift_bridgeObjectRetain();
  sub_20D877DA0();
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v22, *MEMORY[0x24BEE26E0], v20);
  return swift_willThrow();
}

uint64_t sub_20D859688()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_20D859690()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 24);
  if (!(v1 >> 62))
    return *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v2 = sub_20D877E9C();
  swift_bridgeObjectRelease();
  return v2;
}

BOOL sub_20D8596F0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 24);
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_20D877E9C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return v1 >= v3;
}

uint64_t sub_20D85975C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t sub_20D859764()
{
  char v0;

  sub_20D85806C();
  return v0 & 1;
}

uint64_t sub_20D85977C()
{
  char v0;

  sub_20D85C65C();
  return v0 & 1;
}

void sub_20D859794()
{
  sub_20D858264();
}

void sub_20D8597A8()
{
  sub_20D85C7F0();
}

void sub_20D8597BC()
{
  sub_20D85C98C();
}

uint64_t sub_20D8597D0()
{
  return sub_20D85CB28(MEMORY[0x24BEE1768], 7630409, 0xE300000000000000, (SEL *)&selRef_integerValue);
}

uint64_t sub_20D859800()
{
  return sub_20D85CCF8((uint64_t)sub_20D85B684);
}

uint64_t sub_20D85981C()
{
  return sub_20D85CCF8((uint64_t)sub_20D85B818);
}

uint64_t sub_20D859838()
{
  return sub_20D85CB28(MEMORY[0x24BEE3F88], 0x3233746E49, 0xE500000000000000, (SEL *)&selRef_intValue);
}

uint64_t sub_20D85986C()
{
  return sub_20D85CB28(MEMORY[0x24BEE4008], 0x3436746E49, 0xE500000000000000, (SEL *)&selRef_longLongValue);
}

uint64_t sub_20D8598A0()
{
  return sub_20D877F8C();
}

uint64_t sub_20D8598B4()
{
  return sub_20D85CB28(MEMORY[0x24BEE1E88], 1953384789, 0xE400000000000000, (SEL *)&selRef_unsignedIntegerValue);
}

uint64_t sub_20D8598E4()
{
  return sub_20D85CCF8((uint64_t)sub_20D85B9B0);
}

uint64_t sub_20D859900()
{
  return sub_20D85CCF8((uint64_t)sub_20D85BB48);
}

uint64_t sub_20D85991C()
{
  return sub_20D85CB28(MEMORY[0x24BEE44F0], 0x3233746E4955, 0xE600000000000000, (SEL *)&selRef_unsignedIntValue);
}

uint64_t sub_20D859950()
{
  return sub_20D85CB28(MEMORY[0x24BEE4568], 0x3436746E4955, 0xE600000000000000, (SEL *)&selRef_unsignedLongLongValue);
}

uint64_t sub_20D859984()
{
  return sub_20D877F98();
}

void sub_20D859998(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_20D858400(a1, a2, a3, a4);
}

uint64_t sub_20D8599AC()
{
  return sub_20D877F38();
}

uint64_t sub_20D8599C0()
{
  return sub_20D877F2C();
}

uint64_t sub_20D8599D4()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_20D877F44();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_20D8599F4(uint64_t a1, uint64_t a2)
{
  return sub_20D859B84(a1, a2, MEMORY[0x24BEE3690]);
}

uint64_t sub_20D859A10()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_20D877F50();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_20D859A30(uint64_t a1, uint64_t a2)
{
  return sub_20D859AFC(a1, a2, MEMORY[0x24BEE36B0]);
}

uint64_t sub_20D859A4C(uint64_t a1, uint64_t a2)
{
  return sub_20D859B40(a1, a2, MEMORY[0x24BEE36B8]);
}

uint64_t sub_20D859A68(uint64_t a1, uint64_t a2)
{
  return sub_20D859B84(a1, a2, MEMORY[0x24BEE36C0]);
}

uint64_t sub_20D859A84()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_20D877F74();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_20D859AA4(uint64_t a1, uint64_t a2)
{
  return sub_20D859BF0(a1, a2, MEMORY[0x24BEE36D8]);
}

uint64_t sub_20D859AC0()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_20D877F5C();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_20D859AE0(uint64_t a1, uint64_t a2)
{
  return sub_20D859AFC(a1, a2, MEMORY[0x24BEE36D0]);
}

uint64_t sub_20D859AFC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FF;
}

uint64_t sub_20D859B24(uint64_t a1, uint64_t a2)
{
  return sub_20D859B40(a1, a2, MEMORY[0x24BEE36E0]);
}

uint64_t sub_20D859B40(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FFFF;
}

uint64_t sub_20D859B68(uint64_t a1, uint64_t a2)
{
  return sub_20D859B84(a1, a2, MEMORY[0x24BEE36E8]);
}

uint64_t sub_20D859B84(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  unint64_t v3;

  v3 = a3();
  return v3 | ((HIDWORD(v3) & 1) << 32);
}

uint64_t sub_20D859BB4()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_20D877F80();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_20D859BD4(uint64_t a1, uint64_t a2)
{
  return sub_20D859BF0(a1, a2, MEMORY[0x24BEE36F8]);
}

uint64_t sub_20D859BF0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  result = a3();
  if (v3)
    return v5;
  return result;
}

uint64_t sub_20D859C14()
{
  return sub_20D877F68();
}

uint64_t sub_20D859C3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_20D858674(a1, a2, a3, a4);
}

uint64_t sub_20D859C50@<X0>(_QWORD *a1@<X8>)
{
  return sub_20D858C78(a1);
}

uint64_t sub_20D859C64@<X0>(_QWORD *a1@<X8>)
{
  return sub_20D8592E4(a1);
}

uint64_t sub_20D859C78@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  void (*v12)(char *, char *, uint64_t);
  void (*v13)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  id v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[3];

  v4 = sub_20D877BFC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C90D0);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((objc_msgSend(a1, sel_isDate) & 1) != 0)
  {
    v10 = objc_msgSend(a1, sel_date);
    if (v10)
    {
      v11 = v10;
      sub_20D877BF0();

      v12 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
      v12(v9, v7, v4);
      v13 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56);
      v13(v9, 0, 1, v4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v9, 1, v4) != 1)
      {
        v12(a2, v9, v4);
        return ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v13)(a2, 0, 1, v4);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v9, 1, 1, v4);
    }
    sub_20D85C088((uint64_t)v9, &qword_2549C90D0);
    v15 = sub_20D877DB8();
    swift_allocError();
    v17 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v17 = v4;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v18 = objc_msgSend(a1, sel_description);
  }
  else
  {
    v15 = sub_20D877DB8();
    swift_allocError();
    v17 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v17 = v4;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v18 = objc_msgSend(a1, sel_description);
  }
  v20 = v18;
  v21 = sub_20D877C50();
  v23 = v22;

  v24[1] = v21;
  v24[2] = v23;
  sub_20D877C74();
  sub_20D877C74();
  sub_20D877DA0();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v17, *MEMORY[0x24BEE26D0], v15);
  return swift_willThrow();
}

uint64_t sub_20D859F84(void *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  id v9;
  unsigned int *v10;
  _QWORD *v11;

  if (objc_msgSend(a1, sel_type) == (id)2)
  {
    v2 = objc_msgSend(a1, sel_data);
    if (v2)
    {
      v3 = v2;
      v4 = sub_20D877BD8();

      return v4;
    }
    v6 = sub_20D877DB8();
    swift_allocError();
    v8 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v8 = MEMORY[0x24BDCDDE8];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877D7C();
    swift_bridgeObjectRelease();
    sub_20D877DA0();
    v10 = (unsigned int *)MEMORY[0x24BEE26E0];
  }
  else
  {
    v6 = sub_20D877DB8();
    swift_allocError();
    v8 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v8 = MEMORY[0x24BDCDDE8];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v9 = objc_msgSend(a1, sel_description);
    sub_20D877C50();

    sub_20D877C74();
    sub_20D877C74();
    sub_20D877DA0();
    v10 = (unsigned int *)MEMORY[0x24BEE26D0];
  }
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *v10, v6);
  return swift_willThrow();
}

void sub_20D85A1D4(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *boxed_opaque_existential_1Tm;
  _QWORD *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[7];
  uint64_t v36[3];
  uint64_t v37;
  uint64_t v38;

  v6 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C90D0);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDCDDE8];
  if (a2 == MEMORY[0x24BDCDDE8] || sub_20D85BF60(0, &qword_2549C90D8) == a2)
  {
    v16 = sub_20D859F84(a1);
    if (v5)
      return;
    if (v17 >> 60 != 15)
    {
      *(_QWORD *)(a4 + 24) = v13;
      *(_QWORD *)a4 = v16;
      *(_QWORD *)(a4 + 8) = v17;
      return;
    }
    goto LABEL_13;
  }
  v14 = sub_20D877BFC();
  if (v14 == a2 || sub_20D85BF60(0, &qword_2549C90E0) == a2)
  {
    sub_20D859C78(a1, v12);
    if (v5)
      return;
    v18 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v12, 1, v14) != 1)
    {
      *(_QWORD *)(a4 + 24) = v14;
      boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)a4);
      (*(void (**)(uint64_t *, char *, uint64_t))(v18 + 32))(boxed_opaque_existential_1Tm, v12, v14);
      return;
    }
    sub_20D85C088((uint64_t)v12, &qword_2549C90D0);
LABEL_13:
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    return;
  }
  if (swift_dynamicCastMetatype())
  {
    *(_QWORD *)(a4 + 24) = &type metadata for CBORCodableWrapper;
    *(_QWORD *)a4 = a1;
    v15 = a1;
    return;
  }
  v19 = swift_conformsToProtocol2();
  if (v19)
    v20 = v19;
  else
    v20 = 0;
  if (v19)
    v21 = a2;
  else
    v21 = 0;
  if (v21)
  {
    sub_20D85A680(a1, v21, v20, (_OWORD *)a4);
    return;
  }
  v23 = (_QWORD *)(v6 + 24);
  swift_beginAccess();
  v24 = a1;
  MEMORY[0x212BA9E14]();
  if (*(_QWORD *)((*(_QWORD *)(v6 + 24) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v6 + 24) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
  {
    v35[1] = *(_QWORD *)((*(_QWORD *)(v6 + 24) & 0xFFFFFFFFFFFFFF8) + 0x10);
    sub_20D877D1C();
  }
  sub_20D877D28();
  sub_20D877D10();
  swift_endAccess();
  v35[5] = type metadata accessor for _CBORDecoder();
  v35[6] = sub_20D85BF98(&qword_2549C90E8, (uint64_t)&unk_20D878FE8);
  v35[2] = v6;
  v37 = a2;
  v38 = a3;
  __swift_allocate_boxed_opaque_existential_1Tm(v36);
  swift_retain();
  sub_20D877D34();
  if (!v5)
    goto LABEL_33;
  __swift_deallocate_boxed_opaque_existential_1((uint64_t)v36);
  swift_beginAccess();
  if (*v23 >> 62)
  {
    swift_bridgeObjectRetain();
    v32 = sub_20D877E9C();
    swift_bridgeObjectRelease();
    if (v32)
      goto LABEL_28;
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (!*(_QWORD *)((*v23 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_42;
LABEL_28:
  v25 = sub_20D86CD90();
  if (v25)
    goto LABEL_39;
  if (*v23 >> 62)
    goto LABEL_45;
  a4 = *(_QWORD *)((*v23 & 0xFFFFFFFFFFFFF8) + 0x10);
  v26 = a4 - 1;
  if (!__OFSUB__(a4, 1))
  {
LABEL_38:
    v25 = sub_20D86CC68(v26);
    goto LABEL_39;
  }
  while (1)
  {
    __break(1u);
LABEL_33:
    v27 = v37;
    v28 = __swift_project_boxed_opaque_existential_1(v36, v37);
    *(_QWORD *)(a4 + 24) = v27;
    v29 = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)a4);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v29, v28, v27);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v36);
    swift_beginAccess();
    if (*v23 >> 62)
      break;
    if (*(_QWORD *)((*v23 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_35;
LABEL_44:
    __break(1u);
LABEL_45:
    swift_bridgeObjectRetain();
    a4 = sub_20D877E9C();
    swift_bridgeObjectRelease();
    v26 = a4 - 1;
    if (!__OFSUB__(a4, 1))
      goto LABEL_38;
  }
LABEL_43:
  swift_bridgeObjectRetain();
  v33 = sub_20D877E9C();
  swift_bridgeObjectRelease();
  if (!v33)
    goto LABEL_44;
LABEL_35:
  v25 = sub_20D86CD90();
  if (v25)
  {
LABEL_39:
    v31 = (void *)v25;
    swift_endAccess();

    return;
  }
  if (*v23 >> 62)
  {
    swift_bridgeObjectRetain();
    v34 = sub_20D877E9C();
    swift_bridgeObjectRelease();
    v26 = v34 - 1;
    if (__OFSUB__(v34, 1))
      goto LABEL_50;
    goto LABEL_38;
  }
  v30 = *(_QWORD *)((*v23 & 0xFFFFFFFFFFFFF8) + 0x10);
  v26 = v30 - 1;
  if (!__OFSUB__(v30, 1))
    goto LABEL_38;
LABEL_50:
  __break(1u);
}

uint64_t sub_20D85A680@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  _OWORD *v38;
  uint64_t v39;
  unint64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  unint64_t v46;
  int64_t v47;
  uint64_t v48;
  void *v49;
  unsigned __int8 v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char isUniquelyReferenced_nonNull_native;
  char v64;
  unint64_t v65;
  uint64_t v66;
  _BOOL8 v67;
  uint64_t v68;
  char v69;
  unint64_t v70;
  char v71;
  unint64_t v72;
  char v73;
  char v74;
  char v75;
  uint64_t *v76;
  uint64_t v77;
  BOOL v78;
  uint64_t v79;
  int64_t v80;
  id v81;
  char *v82;
  uint64_t v83;
  _QWORD *v84;
  _QWORD *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  _OWORD *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _OWORD *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  int64_t v99;
  unint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int64_t v105;
  uint64_t v106;
  char *v107;
  _OWORD v108[2];
  __int128 v109;
  uint64_t v110;
  _QWORD *v111;

  v9 = sub_20D877DAC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend(a1, sel_dictionary);
  if (!v13)
  {
    v23 = sub_20D877DB8();
    v24 = a2;
    swift_allocError();
    v26 = v25;
    v107 = (char *)v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088) + 48);
    *v26 = v24;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v27 = objc_msgSend(a1, sel_description);
    v28 = sub_20D877C50();
    v30 = v29;

    *(_QWORD *)&v108[0] = v28;
    *((_QWORD *)&v108[0] + 1) = v30;
    sub_20D877C74();
    sub_20D8782F8();
    sub_20D877C74();
    swift_bridgeObjectRelease();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v26, *MEMORY[0x24BEE26D0], v23);
    return swift_willThrow();
  }
  v14 = v13;
  v104 = v4;
  v94 = a4;
  v90 = v12;
  v15 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  sub_20D85BEFC();
  v97 = v15;
  v16 = sub_20D877C14();

  v17 = (_QWORD *)sub_20D851B98(MEMORY[0x24BEE4AF8]);
  v18 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  v102 = v19;
  v103 = v18;
  v93 = a2;
  v92 = v9;
  v91 = v10;
  if ((v16 & 0xC000000000000001) != 0)
  {
    v20 = sub_20D877E60();
    v100 = 0;
    v21 = 0;
    v22 = 0;
    v16 = v20 | 0x8000000000000000;
  }
  else
  {
    v32 = -1 << *(_BYTE *)(v16 + 32);
    v33 = *(_QWORD *)(v16 + 64);
    v100 = v16 + 64;
    v34 = ~v32;
    v35 = -v32;
    if (v35 < 64)
      v36 = ~(-1 << v35);
    else
      v36 = -1;
    v22 = v36 & v33;
    v21 = v34;
  }
  v37 = 0;
  v98 = v16 & 0x7FFFFFFFFFFFFFFFLL;
  v95 = v21;
  v99 = (unint64_t)(v21 + 64) >> 6;
  v96 = MEMORY[0x24BEE4AD0] + 8;
  v101 = v16;
  while ((v16 & 0x8000000000000000) != 0)
  {
    v42 = sub_20D877E84();
    if (!v42)
      goto LABEL_62;
    v44 = v43;
    *(_QWORD *)&v108[0] = v42;
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v45 = (id)v109;
    swift_unknownObjectRelease();
    *(_QWORD *)&v108[0] = v44;
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v107 = (char *)v109;
    swift_unknownObjectRelease();
    v41 = v37;
    v39 = v22;
    if (!v45)
      goto LABEL_62;
LABEL_31:
    v50 = objc_msgSend(v45, sel_isWholeNumber);
    v105 = v41;
    if ((v50 & 1) != 0)
    {
      v51 = objc_msgSend(v45, sel_numeric);
      v52 = objc_msgSend(v51, sel_integerValue);

      *(_QWORD *)&v109 = v52;
      v53 = sub_20D877F20();
    }
    else
    {
      v55 = objc_msgSend(v45, sel_string);
      if (!v55)
      {
        swift_bridgeObjectRelease();
        swift_beginAccess();
        *(_QWORD *)&v108[0] = 0;
        *((_QWORD *)&v108[0] + 1) = 0xE000000000000000;
        swift_bridgeObjectRetain();
        sub_20D877D7C();
        v81 = objc_msgSend(v45, sel_description);
        sub_20D877C50();

        sub_20D877C74();
        swift_bridgeObjectRelease();
        sub_20D877C74();
        v111 = objc_msgSend(v45, sel_type);
        type metadata accessor for CBORType(0);
        sub_20D877E30();
        sub_20D877C74();
        v82 = v90;
        sub_20D877DA0();
        v83 = sub_20D877DB8();
        v106 = swift_allocError();
        v85 = v84;
        v86 = (char *)v84 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088) + 48);
        *v85 = v93;
        v87 = v91;
        v88 = v92;
        (*(void (**)(char *, char *, uint64_t))(v91 + 16))(v86, v82, v92);
        (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v83 - 8) + 104))(v85, *MEMORY[0x24BEE26D0], v83);
        swift_willThrow();

        (*(void (**)(char *, uint64_t))(v87 + 8))(v82, v88);
        return sub_20D85C06C();
      }
      v56 = v55;
      v57 = sub_20D877C50();
      v59 = v58;

      v53 = sub_20D8647A8(v57, v59);
      if (!v54)
        goto LABEL_68;
    }
    v60 = v53;
    v61 = v54;
    v62 = v106;
    sub_20D85A1D4(&v109, v107, v103, v102);
    v106 = v62;
    if (v62)
    {
      swift_bridgeObjectRelease();

      sub_20D85C06C();
      return swift_bridgeObjectRelease();
    }
    if (v110)
    {
      sub_20D85C0C4(&v109, v108);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v111 = v17;
      v65 = sub_20D86E628(v60, v61);
      v66 = v17[2];
      v67 = (v64 & 1) == 0;
      v68 = v66 + v67;
      if (__OFADD__(v66, v67))
      {
        __break(1u);
LABEL_66:
        __break(1u);
LABEL_67:
        __break(1u);
LABEL_68:
        __break(1u);
LABEL_69:
        result = sub_20D878208();
        __break(1u);
        return result;
      }
      v69 = v64;
      if (v17[3] >= v68)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v17 = v111;
          if ((v64 & 1) == 0)
            goto LABEL_48;
        }
        else
        {
          sub_20D8630C8();
          v17 = v111;
          if ((v69 & 1) == 0)
            goto LABEL_48;
        }
      }
      else
      {
        sub_20D861AC4(v68, isUniquelyReferenced_nonNull_native);
        v70 = sub_20D86E628(v60, v61);
        if ((v69 & 1) != (v71 & 1))
          goto LABEL_69;
        v65 = v70;
        v17 = v111;
        if ((v69 & 1) == 0)
        {
LABEL_48:
          v17[(v65 >> 6) + 8] |= 1 << v65;
          v76 = (uint64_t *)(v17[6] + 16 * v65);
          *v76 = v60;
          v76[1] = v61;
          sub_20D85C0C4(v108, (_OWORD *)(v17[7] + 32 * v65));
          v77 = v17[2];
          v78 = __OFADD__(v77, 1);
          v79 = v77 + 1;
          if (v78)
            goto LABEL_66;
          v17[2] = v79;
          swift_bridgeObjectRetain();
          goto LABEL_11;
        }
      }
      v38 = (_OWORD *)(v17[7] + 32 * v65);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
      sub_20D85C0C4(v108, v38);
LABEL_11:

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    sub_20D85C088((uint64_t)&v109, &qword_2549C90C8);
    swift_bridgeObjectRetain();
    v72 = sub_20D86E628(v60, v61);
    v74 = v73;
    swift_bridgeObjectRelease();
    if ((v74 & 1) != 0)
    {
      v75 = swift_isUniquelyReferenced_nonNull_native();
      v111 = v17;
      if ((v75 & 1) == 0)
      {
        sub_20D8630C8();
        v17 = v111;
      }
      swift_bridgeObjectRelease();
      sub_20D85C0C4((_OWORD *)(v17[7] + 32 * v72), v108);
      sub_20D8625E8(v72, (uint64_t)v17);
      swift_bridgeObjectRelease();
    }
    else
    {
      memset(v108, 0, sizeof(v108));
    }
    swift_bridgeObjectRelease();
    sub_20D85C088((uint64_t)v108, &qword_2549C90C8);

LABEL_12:
    v37 = v105;
    v22 = v39;
    v16 = v101;
  }
  if (v22)
  {
    v39 = (v22 - 1) & v22;
    v40 = __clz(__rbit64(v22)) | (v37 << 6);
    v41 = v37;
    goto LABEL_30;
  }
  v41 = v37 + 1;
  if (__OFADD__(v37, 1))
    goto LABEL_67;
  if (v41 >= v99)
    goto LABEL_62;
  v46 = *(_QWORD *)(v100 + 8 * v41);
  if (v46)
  {
LABEL_29:
    v39 = (v46 - 1) & v46;
    v40 = __clz(__rbit64(v46)) + (v41 << 6);
LABEL_30:
    v48 = 8 * v40;
    v49 = *(void **)(*(_QWORD *)(v16 + 56) + v48);
    v45 = *(id *)(*(_QWORD *)(v16 + 48) + v48);
    v107 = v49;
    if (!v45)
      goto LABEL_62;
    goto LABEL_31;
  }
  v47 = v37 + 2;
  if (v37 + 2 >= v99)
    goto LABEL_62;
  v46 = *(_QWORD *)(v100 + 8 * v47);
  if (v46)
    goto LABEL_28;
  v47 = v37 + 3;
  if (v37 + 3 >= v99)
    goto LABEL_62;
  v46 = *(_QWORD *)(v100 + 8 * v47);
  if (v46)
    goto LABEL_28;
  v47 = v37 + 4;
  if (v37 + 4 >= v99)
    goto LABEL_62;
  v46 = *(_QWORD *)(v100 + 8 * v47);
  if (v46)
  {
LABEL_28:
    v41 = v47;
    goto LABEL_29;
  }
  v41 = v37 + 5;
  if (v37 + 5 >= v99)
    goto LABEL_62;
  v46 = *(_QWORD *)(v100 + 8 * v41);
  if (v46)
    goto LABEL_29;
  v80 = v37 + 6;
  while (v99 != v80)
  {
    v46 = *(_QWORD *)(v100 + 8 * v80++);
    if (v46)
    {
      v41 = v80 - 1;
      goto LABEL_29;
    }
  }
LABEL_62:
  sub_20D85C06C();
  *(_QWORD *)&v109 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C90F0);
  v89 = v94;
  result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
    *v89 = 0u;
    v89[1] = 0u;
  }
  return result;
}

_QWORD *sub_20D85B09C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

BOOL sub_20D85B0AC(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void sub_20D85B0C0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_20D85B0CC(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v2 = result[2];
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= v3[3] >> 1)
  {
    if (v6[2])
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v10 = v4 + v2;
  else
    v10 = v4;
  result = sub_20D8635F8(result, v10, 1, v3);
  v3 = result;
  if (!v6[2])
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C91C0);
  result = (_QWORD *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = (_QWORD *)swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v7 = v3[2];
  v8 = __OFADD__(v7, v2);
  v9 = v7 + v2;
  if (!v8)
  {
    v3[2] = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_20D85B1C8(void *a1)
{
  unsigned __int8 v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  id v6;

  if ((objc_msgSend(a1, sel_isBoolean) & 1) != 0)
  {
    v2 = objc_msgSend(a1, sel_BOOLValue);
  }
  else
  {
    v3 = sub_20D877DB8();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v5 = MEMORY[0x24BEE1328];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v6 = objc_msgSend(a1, sel_description);
    sub_20D877C50();

    sub_20D877C74();
    sub_20D877C74();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v5, *MEMORY[0x24BEE26D0], v3);
    v2 = swift_willThrow();
  }
  return v2 & 1;
}

void sub_20D85B33C(void *a1)
{
  id v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  id v6;

  if ((objc_msgSend(a1, sel_isFloatNumber) & 1) != 0)
  {
    v2 = objc_msgSend(a1, sel_numeric);
    objc_msgSend(v2, sel_doubleValue);

  }
  else
  {
    v3 = sub_20D877DB8();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v5 = MEMORY[0x24BEE13C8];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v6 = objc_msgSend(a1, sel_description);
    sub_20D877C50();

    sub_20D877C74();
    sub_20D877C74();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v5, *MEMORY[0x24BEE26D0], v3);
    swift_willThrow();
  }
}

void sub_20D85B4E0(void *a1)
{
  id v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  id v6;

  if ((objc_msgSend(a1, sel_isFloatNumber) & 1) != 0)
  {
    v2 = objc_msgSend(a1, sel_numeric);
    objc_msgSend(v2, sel_floatValue);

  }
  else
  {
    v3 = sub_20D877DB8();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v5 = MEMORY[0x24BEE14E8];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v6 = objc_msgSend(a1, sel_description);
    sub_20D877C50();

    sub_20D877C74();
    sub_20D877C74();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v5, *MEMORY[0x24BEE26D0], v3);
    swift_willThrow();
  }
}

_QWORD *sub_20D85B684(void *a1)
{
  id v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  if ((objc_msgSend(a1, sel_isWholeNumber) & 1) != 0)
  {
    v2 = objc_msgSend(a1, sel_numeric);
    v3 = objc_msgSend(v2, sel_charValue);

  }
  else
  {
    v4 = sub_20D877DB8();
    swift_allocError();
    v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v6 = MEMORY[0x24BEE3E50];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v7 = objc_msgSend(a1, sel_description);
    v8 = sub_20D877C50();
    v10 = v9;

    v12[0] = v8;
    v12[1] = v10;
    sub_20D877C74();
    v3 = v12;
    sub_20D877C74();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(v6, *MEMORY[0x24BEE26D0], v4);
    swift_willThrow();
  }
  return v3;
}

_QWORD *sub_20D85B818(void *a1)
{
  id v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  if ((objc_msgSend(a1, sel_isWholeNumber) & 1) != 0)
  {
    v2 = objc_msgSend(a1, sel_numeric);
    v3 = objc_msgSend(v2, sel_shortValue);

  }
  else
  {
    v4 = sub_20D877DB8();
    swift_allocError();
    v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v6 = MEMORY[0x24BEE3F30];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v7 = objc_msgSend(a1, sel_description);
    v8 = sub_20D877C50();
    v10 = v9;

    v12[0] = v8;
    v12[1] = v10;
    sub_20D877C74();
    v3 = v12;
    sub_20D877C74();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(v6, *MEMORY[0x24BEE26D0], v4);
    swift_willThrow();
  }
  return v3;
}

_QWORD *sub_20D85B9B0(void *a1)
{
  id v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  if ((objc_msgSend(a1, sel_isWholeNumber) & 1) != 0)
  {
    v2 = objc_msgSend(a1, sel_numeric);
    v3 = objc_msgSend(v2, sel_unsignedCharValue);

  }
  else
  {
    v4 = sub_20D877DB8();
    swift_allocError();
    v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v6 = MEMORY[0x24BEE4260];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v7 = objc_msgSend(a1, sel_description);
    v8 = sub_20D877C50();
    v10 = v9;

    v12[0] = v8;
    v12[1] = v10;
    sub_20D877C74();
    v3 = v12;
    sub_20D877C74();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(v6, *MEMORY[0x24BEE26D0], v4);
    swift_willThrow();
  }
  return v3;
}

_QWORD *sub_20D85BB48(void *a1)
{
  id v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  if ((objc_msgSend(a1, sel_isWholeNumber) & 1) != 0)
  {
    v2 = objc_msgSend(a1, sel_numeric);
    v3 = objc_msgSend(v2, sel_unsignedShortValue);

  }
  else
  {
    v4 = sub_20D877DB8();
    swift_allocError();
    v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v6 = MEMORY[0x24BEE4478];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v7 = objc_msgSend(a1, sel_description);
    v8 = sub_20D877C50();
    v10 = v9;

    v12[0] = v8;
    v12[1] = v10;
    sub_20D877C74();
    v3 = v12;
    sub_20D877C74();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(v6, *MEMORY[0x24BEE26D0], v4);
    swift_willThrow();
  }
  return v3;
}

uint64_t sub_20D85BCE0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  id v8;
  id v9;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;

  if ((objc_msgSend(a1, sel_isWholeNumber) & 1) != 0)
  {
    v8 = objc_msgSend(a1, sel_numeric);
    v9 = objc_msgSend(v8, *a5);

    return (uint64_t)v9;
  }
  else
  {
    v11 = sub_20D877DB8();
    swift_allocError();
    v13 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v13 = a2;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v14 = objc_msgSend(a1, sel_description);
    sub_20D877C50();

    sub_20D877C74();
    sub_20D877C74();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v13, *MEMORY[0x24BEE26D0], v11);
    return swift_willThrow();
  }
}

unint64_t sub_20D85BE84()
{
  unint64_t result;

  result = qword_2549C90B0;
  if (!qword_2549C90B0)
  {
    result = MEMORY[0x212BAA8AC](&unk_20D8792B8, &type metadata for _CBORDecoderUnkeyedContainer);
    atomic_store(result, (unint64_t *)&qword_2549C90B0);
  }
  return result;
}

uint64_t sub_20D85BEC8()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_20D85BEFC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549C90B8;
  if (!qword_2549C90B8)
  {
    v1 = sub_20D85BF60(255, (unint64_t *)&qword_2549C90A8);
    result = MEMORY[0x212BAA8AC](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2549C90B8);
  }
  return result;
}

uint64_t type metadata accessor for _CBORDecoderKeyedContainer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _CBORDecoderKeyedContainer);
}

uint64_t sub_20D85BF60(uint64_t a1, unint64_t *a2)
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

uint64_t sub_20D85BF98(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for _CBORDecoder();
    result = MEMORY[0x212BAA8AC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x212BAA93CLL);
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1Tm(uint64_t *a1)
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

uint64_t sub_20D85C06C()
{
  return swift_release();
}

void type metadata accessor for CBORType(uint64_t a1)
{
  sub_20D85C18C(a1, &qword_2549C9120);
}

uint64_t sub_20D85C088(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *sub_20D85C0C4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
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

uint64_t sub_20D85C134(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void type metadata accessor for COSEKeyOperationType(uint64_t a1)
{
  sub_20D85C18C(a1, qword_2549C9128);
}

void sub_20D85C18C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_20D85C1D0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_20D85C1DC()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_20D85C20C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_20D85C258(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
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

uint64_t sub_20D85C2E0(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s11CBORLibrary28_CBOREncoderUnkeyedContainerVwet_0(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_20D85C374(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for _CBORDecoderUnkeyedContainer(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for _CBORDecoderUnkeyedContainer()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for _CBORDecoderUnkeyedContainer(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for _CBORDecoderUnkeyedContainer(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for _CBORDecoderUnkeyedContainer(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for _CBORDecoderUnkeyedContainer(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for _CBORDecoderUnkeyedContainer(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for _CBORDecoderUnkeyedContainer()
{
  return &type metadata for _CBORDecoderUnkeyedContainer;
}

uint64_t sub_20D85C5D4(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 24);
}

unint64_t sub_20D85C5DC()
{
  unint64_t result;

  result = qword_2549C91B0;
  if (!qword_2549C91B0)
  {
    result = MEMORY[0x212BAA8AC](&unk_20D8798B8, &type metadata for CBORCodingKey);
    atomic_store(result, (unint64_t *)&qword_2549C91B0);
  }
  return result;
}

uint64_t sub_20D85C620()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20D85C644(__int128 *a1, uint64_t a2)
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

void sub_20D85C65C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v2 = *(_QWORD *)(v0 + 8);
  v3 = *(_QWORD *)(v0 + 24);
  if (!(v3 >> 62))
  {
    if (v2 < *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_10:
    v7 = sub_20D877DB8();
    swift_allocError();
    v9 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v9 = MEMORY[0x24BEE1328];
    swift_bridgeObjectRetain();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v9, *MEMORY[0x24BEE26E0], v7);
    swift_willThrow();
    return;
  }
  swift_bridgeObjectRetain();
  v6 = sub_20D877E9C();
  swift_bridgeObjectRelease();
  if (v2 >= v6)
    goto LABEL_10;
LABEL_3:
  if ((v3 & 0xC000000000000001) == 0)
  {
    if (v2 < 0)
    {
      __break(1u);
    }
    else if ((unint64_t)v2 < *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v4 = *(id *)(v3 + 8 * v2 + 32);
      goto LABEL_7;
    }
    __break(1u);
    return;
  }
  v4 = (id)MEMORY[0x212BA9EBC](v2, v3);
LABEL_7:
  v5 = v4;
  sub_20D85B1C8(v4);

  if (!v1)
    *(_QWORD *)(v0 + 8) = v2 + 1;
}

void sub_20D85C7F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v2 = *(_QWORD *)(v0 + 8);
  v3 = *(_QWORD *)(v0 + 24);
  if (!(v3 >> 62))
  {
    if (v2 < *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_10:
    v7 = sub_20D877DB8();
    swift_allocError();
    v9 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v9 = MEMORY[0x24BEE1328];
    swift_bridgeObjectRetain();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v9, *MEMORY[0x24BEE26E0], v7);
    swift_willThrow();
    return;
  }
  swift_bridgeObjectRetain();
  v6 = sub_20D877E9C();
  swift_bridgeObjectRelease();
  if (v2 >= v6)
    goto LABEL_10;
LABEL_3:
  if ((v3 & 0xC000000000000001) == 0)
  {
    if (v2 < 0)
    {
      __break(1u);
    }
    else if ((unint64_t)v2 < *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v4 = *(id *)(v3 + 8 * v2 + 32);
      goto LABEL_7;
    }
    __break(1u);
    return;
  }
  v4 = (id)MEMORY[0x212BA9EBC](v2, v3);
LABEL_7:
  v5 = v4;
  sub_20D85B33C(v4);

  if (!v1)
    *(_QWORD *)(v0 + 8) = v2 + 1;
}

void sub_20D85C98C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v2 = *(_QWORD *)(v0 + 8);
  v3 = *(_QWORD *)(v0 + 24);
  if (!(v3 >> 62))
  {
    if (v2 < *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_10:
    v7 = sub_20D877DB8();
    swift_allocError();
    v9 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v9 = MEMORY[0x24BEE1328];
    swift_bridgeObjectRetain();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v9, *MEMORY[0x24BEE26E0], v7);
    swift_willThrow();
    return;
  }
  swift_bridgeObjectRetain();
  v6 = sub_20D877E9C();
  swift_bridgeObjectRelease();
  if (v2 >= v6)
    goto LABEL_10;
LABEL_3:
  if ((v3 & 0xC000000000000001) == 0)
  {
    if (v2 < 0)
    {
      __break(1u);
    }
    else if ((unint64_t)v2 < *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v4 = *(id *)(v3 + 8 * v2 + 32);
      goto LABEL_7;
    }
    __break(1u);
    return;
  }
  v4 = (id)MEMORY[0x212BA9EBC](v2, v3);
LABEL_7:
  v5 = v4;
  sub_20D85B4E0(v4);

  if (!v1)
    *(_QWORD *)(v0 + 8) = v2 + 1;
}

uint64_t sub_20D85CB28(uint64_t result, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  SEL *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  SEL *v20;

  v8 = result;
  v9 = v4;
  v10 = *v4;
  v11 = v9[1];
  v12 = v9[3];
  if (!(v12 >> 62))
  {
    if (v11 < *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_10:
    v17 = sub_20D877DB8();
    swift_allocError();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v19 = MEMORY[0x24BEE1328];
    swift_bridgeObjectRetain();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v19, *MEMORY[0x24BEE26E0], v17);
    swift_willThrow();
    return v10;
  }
  v20 = a4;
  swift_bridgeObjectRetain();
  v16 = sub_20D877E9C();
  result = swift_bridgeObjectRelease();
  a4 = v20;
  if (v11 >= v16)
    goto LABEL_10;
LABEL_3:
  if ((v12 & 0xC000000000000001) != 0)
  {
    v13 = a4;
    v14 = (id)MEMORY[0x212BA9EBC](v11, v12);
LABEL_7:
    v15 = v14;
    v10 = sub_20D85BCE0(v14, v8, a2, a3, v13);

    if (!v5)
      v9[1] = v11 + 1;
    return v10;
  }
  if (v11 < 0)
  {
    __break(1u);
  }
  else if ((unint64_t)v11 < *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v13 = a4;
    v14 = *(id *)(v12 + 8 * v11 + 32);
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_20D85CCF8(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  v3 = (uint64_t (*)(void))result;
  v4 = v1;
  v5 = *v1;
  v6 = v4[1];
  v7 = v4[3];
  if (!(v7 >> 62))
  {
    if (v6 < *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_10:
    v11 = sub_20D877DB8();
    swift_allocError();
    v13 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
    *v13 = MEMORY[0x24BEE1328];
    swift_bridgeObjectRetain();
    sub_20D877DA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v13, *MEMORY[0x24BEE26E0], v11);
    swift_willThrow();
    return v5;
  }
  swift_bridgeObjectRetain();
  v10 = sub_20D877E9C();
  result = swift_bridgeObjectRelease();
  if (v6 >= v10)
    goto LABEL_10;
LABEL_3:
  if ((v7 & 0xC000000000000001) != 0)
  {
    v8 = (id)MEMORY[0x212BA9EBC](v6, v7);
LABEL_7:
    v9 = v8;
    v5 = v3();

    if (!v2)
      v4[1] = v6 + 1;
    return v5;
  }
  if (v6 < 0)
  {
    __break(1u);
  }
  else if ((unint64_t)v6 < *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v8 = *(id *)(v7 + 8 * v6 + 32);
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_20D85CE98(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_20D85CF04@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_20D8554E8(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_20D85CF0C(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 32))(*a1, a1[1]);
}

unint64_t sub_20D85CF3C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549C91D8;
  if (!qword_2549C91D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549C91D0);
    result = MEMORY[0x212BAA8AC](MEMORY[0x24BEE04D8], v1);
    atomic_store(result, (unint64_t *)&qword_2549C91D8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BAA8A0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x212BAA858](a1, v6, a5);
}

void __swiftcall CBORCodableWrapper.init(cbor:)(CBORLibrary::CBORCodableWrapper *__return_ptr retstr, CBOR *cbor)
{
  retstr->cborObj.super.isa = (Class)cbor;
}

uint64_t sub_20D85D008()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 24);
  sub_20D878244();
  swift_bridgeObjectRetain();
  sub_20D877C68();
  swift_bridgeObjectRelease();
  sub_20D87825C();
  if (v1 != 1)
    sub_20D878250();
  return sub_20D878268();
}

uint64_t sub_20D85D0A0()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 24);
  swift_bridgeObjectRetain();
  sub_20D877C68();
  swift_bridgeObjectRelease();
  if (v1 == 1)
    return sub_20D87825C();
  sub_20D87825C();
  return sub_20D878250();
}

uint64_t sub_20D85D124()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 24);
  sub_20D878244();
  swift_bridgeObjectRetain();
  sub_20D877C68();
  swift_bridgeObjectRelease();
  sub_20D87825C();
  if (v1 != 1)
    sub_20D878250();
  return sub_20D878268();
}

uint64_t sub_20D85D1B8()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_20D85D1E4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  char v7;

  result = sub_20D8647A8(a1, a2);
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v5;
  *(_QWORD *)(a3 + 16) = v6;
  *(_BYTE *)(a3 + 24) = v7;
  return result;
}

uint64_t sub_20D85D210()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_20D85D21C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v5;

  result = sub_20D877F20();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 16) = a1;
  *(_BYTE *)(a2 + 24) = 0;
  return result;
}

uint64_t sub_20D85D274(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  int v5;
  BOOL v6;
  char v7;
  uint64_t result;
  char v9;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_BYTE *)(a1 + 24);
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(unsigned __int8 *)(a2 + 24);
  v6 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v6 || (v7 = sub_20D8780A0(), result = 0, (v7 & 1) != 0))
  {
    if ((v3 & 1) != 0)
    {
      if (v5)
        return 1;
    }
    else
    {
      if (v2 == v4)
        v9 = v5;
      else
        v9 = 1;
      if ((v9 & 1) == 0)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_20D85D2F4()
{
  sub_20D85C5DC();
  return sub_20D8782E0();
}

uint64_t sub_20D85D31C()
{
  sub_20D85C5DC();
  return sub_20D8782EC();
}

uint64_t Data.init(_:)(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_dataWithCBOR_, a1);
  v3 = MEMORY[0x212BA9CF4]();

  return v3;
}

uint64_t Data.init(oldCanonicalOrdering:)(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_dataWithCBOR_encodingKeyOrder_, a1, 1);
  v3 = MEMORY[0x212BA9CF4]();

  return v3;
}

id CBORCodableWrapper.cborObj.getter()
{
  id *v0;

  return *v0;
}

void CBORCodableWrapper.cborObj.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*CBORCodableWrapper.cborObj.modify())(_QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t CBORCodableWrapper.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _BYTE v8[24];
  uint64_t v9;

  v2 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20D878298();
  v3 = objc_msgSend((id)objc_opt_self(), sel_dataWithCBOR_, v2);
  v4 = sub_20D877BD8();
  v6 = v5;

  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v8, v9);
  sub_20D85D540();
  sub_20D8780D0();
  sub_20D85D584(v4, v6);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
}

unint64_t sub_20D85D540()
{
  unint64_t result;

  result = qword_2549C91E0;
  if (!qword_2549C91E0)
  {
    result = MEMORY[0x212BAA8AC](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2549C91E0);
  }
  return result;
}

uint64_t sub_20D85D584(uint64_t a1, unint64_t a2)
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

uint64_t CBORCodableWrapper.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v6;
  _QWORD v7[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20D878274();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    sub_20D85D69C();
    sub_20D8780AC();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
    *a2 = v6;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

unint64_t sub_20D85D69C()
{
  unint64_t result;

  result = qword_2549C91E8;
  if (!qword_2549C91E8)
  {
    result = MEMORY[0x212BAA8AC](&protocol conformance descriptor for CBORCodableWrapper, &type metadata for CBORCodableWrapper);
    atomic_store(result, (unint64_t *)&qword_2549C91E8);
  }
  return result;
}

uint64_t sub_20D85D6E0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return CBORCodableWrapper.init(from:)(a1, a2);
}

uint64_t sub_20D85D6F4(_QWORD *a1)
{
  return CBORCodableWrapper.encode(to:)(a1);
}

uint64_t Data.init(coseSign1:)(_QWORD *a1)
{
  return sub_20D85D720(a1, (SEL *)&selRef_dataWithCOSE_);
}

uint64_t Data.init(coseKey:)(_QWORD *a1)
{
  return sub_20D85D720(a1, (SEL *)&selRef_dataWithCOSEKey_);
}

uint64_t sub_20D85D720(_QWORD *a1, SEL *a2)
{
  void *v2;
  id v3;
  uint64_t v4;

  v2 = (void *)*a1;
  v3 = objc_msgSend((id)objc_opt_self(), *a2, *a1);

  v4 = MEMORY[0x212BA9CF4](v3);
  return v4;
}

id COSE_Sign1.init(algorithmIdentifier:keyIdentifier:initializationVector:partialInitializationVector:payload:signature:x509Chain:includeCBORTag:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, unint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, unint64_t a10, uint64_t a11, unint64_t a12, _QWORD *a13, char a14)
{
  uint64_t inited;
  void *v22;
  __objc2_prot_list **p_base_prots;
  unint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  id result;
  char v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  char isUniquelyReferenced_nonNull_native;
  void *v37;
  unint64_t v38;
  __objc2_prot_list **v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  char v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t *v49;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  char v63;
  uint64_t v64;
  id v65;
  void *v66;
  id v67;
  uint64_t v68;
  char v69;
  void *v70;
  id v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C91F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20D878E40;
  v22 = (void *)objc_opt_self();
  p_base_prots = &_CBORReferenceEncoder.base_prots;
  *(_QWORD *)(inited + 32) = objc_msgSend(v22, sel_cborWithInteger_, 1);
  *(_QWORD *)(inited + 40) = objc_msgSend(v22, sel_cborWithInteger_, a1);
  v76 = sub_20D851DD4(inited);
  v24 = sub_20D851DD4(MEMORY[0x24BEE4AF8]);
  v81 = v24;
  v79 = a6;
  if (a3 >> 60 == 15)
  {
LABEL_10:
    if (a5 >> 60 != 15)
    {
      sub_20D85E18C(a4, a5);
      v32 = objc_msgSend(v22, (SEL)p_base_prots[463], 5);
      sub_20D85E18C(a4, a5);
      v33 = (void *)sub_20D877BCC();
      v34 = objc_msgSend(v22, sel_cborWithData_, v33);
      sub_20D85E178(a4, a5);

      if (v34)
      {
        v35 = v81;
        if ((v81 & 0xC000000000000001) != 0)
        {
          if (v81 >= 0)
            v35 = v81 & 0xFFFFFFFFFFFFFF8;
          result = (id)sub_20D877E6C();
          if (__OFADD__(result, 1))
            goto LABEL_61;
          v35 = sub_20D8612FC(v35, (uint64_t)result + 1);
        }
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_20D862AE8((uint64_t)v34, v32, isUniquelyReferenced_nonNull_native);
        v81 = v35;

        swift_bridgeObjectRelease();
      }
      else
      {
        v37 = (void *)sub_20D8611B0((unint64_t)v32);

      }
      sub_20D85E178(a4, a5);
      a6 = v79;
    }
    if (a7 >> 60 != 15)
    {
      v75 = a2;
      v38 = a3;
      sub_20D85E18C(a6, a7);
      v39 = p_base_prots;
      v40 = objc_msgSend(v22, (SEL)p_base_prots[463], 6);
      sub_20D85E18C(a6, a7);
      v41 = (void *)sub_20D877BCC();
      v42 = a6;
      v43 = objc_msgSend(v22, sel_cborWithData_, v41);
      sub_20D85E178(v42, a7);

      if (v43)
      {
        v44 = v81;
        if ((v81 & 0xC000000000000001) != 0)
        {
          if (v81 >= 0)
            v44 = v81 & 0xFFFFFFFFFFFFFF8;
          result = (id)sub_20D877E6C();
          if (__OFADD__(result, 1))
            goto LABEL_62;
          p_base_prots = v39;
          v44 = sub_20D8612FC(v44, (uint64_t)result + 1);
        }
        else
        {
          p_base_prots = v39;
        }
        a3 = v38;
        v46 = swift_isUniquelyReferenced_nonNull_native();
        sub_20D862AE8((uint64_t)v43, v40, v46);
        v81 = v44;

        swift_bridgeObjectRelease();
        a6 = v79;
        sub_20D85E178(v79, a7);
      }
      else
      {
        v45 = (void *)sub_20D8611B0((unint64_t)v40);

        sub_20D85E178(v42, a7);
        a6 = v42;
        p_base_prots = v39;
        a3 = v38;
      }
      a2 = v75;
    }
    if (a13)
    {
      v47 = a13[2];
      v48 = MEMORY[0x24BEE4AF8];
      v74 = a7;
      if (v47)
      {
        v72 = a4;
        v73 = a5;
        v80 = MEMORY[0x24BEE4AF8];
        sub_20D877E0C();
        v49 = a13 + 5;
        do
        {
          v50 = *(v49 - 1);
          v51 = *v49;
          sub_20D85E18C(v50, *v49);
          v52 = (void *)sub_20D877BCC();
          v53 = objc_msgSend(v22, sel_cborWithData_, v52);
          sub_20D85D584(v50, v51);

          sub_20D877DF4();
          sub_20D877E18();
          sub_20D877E24();
          sub_20D877E00();
          v49 += 2;
          --v47;
        }
        while (v47);
        v48 = v80;
        a5 = v73;
        a4 = v72;
        p_base_prots = &_CBORReferenceEncoder.base_prots;
      }
      if (v48 >> 62)
      {
        swift_bridgeObjectRetain();
        v64 = sub_20D877E9C();
        swift_bridgeObjectRelease();
        if (v64 == 1)
          goto LABEL_38;
      }
      else if (*(_QWORD *)((v48 & 0xFFFFFFFFFFFFF8) + 0x10) == 1)
      {
LABEL_38:
        swift_bridgeObjectRelease();
        result = objc_msgSend(v22, (SEL)p_base_prots[463], 33);
        if (a13[2])
        {
          v54 = result;
          v55 = a4;
          v56 = a5;
          v57 = a13[4];
          v58 = a13[5];
          sub_20D85E18C(v57, v58);
          swift_bridgeObjectRelease();
          v59 = (void *)sub_20D877BCC();
          v60 = objc_msgSend(v22, sel_cborWithData_, v59);
          sub_20D85D584(v57, v58);

          if (!v60)
          {
            v62 = (void *)sub_20D8611B0((unint64_t)v54);

            a5 = v56;
            a4 = v55;
            a7 = v74;
LABEL_57:
            a6 = v79;
            goto LABEL_58;
          }
          v61 = v81;
          a5 = v56;
          if ((v81 & 0xC000000000000001) == 0)
          {
            a4 = v55;
            goto LABEL_47;
          }
          if (v81 >= 0)
            v61 = v81 & 0xFFFFFFFFFFFFFF8;
          result = (id)sub_20D877E6C();
          if (!__OFADD__(result, 1))
          {
            a4 = v55;
            v61 = sub_20D8612FC(v61, (uint64_t)result + 1);
LABEL_47:
            a7 = v74;
            v63 = swift_isUniquelyReferenced_nonNull_native();
            sub_20D862AE8((uint64_t)v60, v54, v63);
            v81 = v61;

            swift_bridgeObjectRelease();
            goto LABEL_57;
          }
          goto LABEL_63;
        }
        __break(1u);
        goto LABEL_60;
      }
      swift_bridgeObjectRelease();
      v65 = objc_msgSend(v22, (SEL)p_base_prots[463], 33);
      sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
      v66 = (void *)sub_20D877CEC();
      swift_bridgeObjectRelease();
      v67 = objc_msgSend(v22, sel_cborWithArray_, v66);

      if (!v67)
      {
        v70 = (void *)sub_20D8611B0((unint64_t)v65);

        goto LABEL_57;
      }
      v68 = v81;
      a6 = v79;
      if ((v81 & 0xC000000000000001) != 0)
      {
        if (v81 >= 0)
          v68 = v81 & 0xFFFFFFFFFFFFFF8;
        result = (id)sub_20D877E6C();
        if (__OFADD__(result, 1))
          goto LABEL_64;
        v68 = sub_20D8612FC(v68, (uint64_t)result + 1);
      }
      v69 = swift_isUniquelyReferenced_nonNull_native();
      sub_20D862AE8((uint64_t)v67, v65, v69);
      v81 = v68;

      swift_bridgeObjectRelease();
    }
LABEL_58:
    sub_20D85BF60(0, &qword_2549C91F8);
    v71 = sub_20D85E01C(v76, v81, a8, a10, a11, a12, a14 & 1);
    sub_20D85E178(a6, a7);
    sub_20D85E178(a4, a5);
    result = (id)sub_20D85E178(a2, a3);
    *a9 = v71;
    return result;
  }
  v25 = v24;
  sub_20D85E18C(a2, a3);
  v26 = objc_msgSend(v22, sel_cborWithInteger_, 4);
  sub_20D85E18C(a2, a3);
  v27 = (void *)sub_20D877BCC();
  v28 = objc_msgSend(v22, sel_cborWithData_, v27);
  sub_20D85E178(a2, a3);

  if (!v28)
  {
    v31 = (void *)sub_20D8611B0((unint64_t)v26);

    sub_20D85E178(a2, a3);
    a6 = v79;
    p_base_prots = &_CBORReferenceEncoder.base_prots;
    goto LABEL_10;
  }
  p_base_prots = (__objc2_prot_list **)(&_CBORReferenceEncoder + 40);
  if ((v25 & 0xC000000000000001) == 0)
  {
LABEL_8:
    v30 = swift_isUniquelyReferenced_nonNull_native();
    sub_20D862AE8((uint64_t)v28, v26, v30);
    v81 = v25;

    swift_bridgeObjectRelease();
    sub_20D85E178(a2, a3);
    a6 = v79;
    goto LABEL_10;
  }
  if (v25 >= 0)
    v25 &= 0xFFFFFFFFFFFFFF8uLL;
  result = (id)sub_20D877E6C();
  if (!__OFADD__(result, 1))
  {
    v25 = sub_20D8612FC(v25, (uint64_t)result + 1);
    goto LABEL_8;
  }
LABEL_60:
  __break(1u);
LABEL_61:
  __break(1u);
LABEL_62:
  __break(1u);
LABEL_63:
  __break(1u);
LABEL_64:
  __break(1u);
  return result;
}

id sub_20D85E01C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, char a7)
{
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  sub_20D85BEFC();
  v11 = (void *)sub_20D877C08();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_20D877C08();
  swift_bridgeObjectRelease();
  v13 = 0;
  if (a4 >> 60 != 15)
  {
    v13 = (void *)sub_20D877BCC();
    sub_20D85E178(a3, a4);
  }
  v14 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v15 = (void *)sub_20D877BCC();
  v16 = objc_msgSend(v14, sel_initWithProtectedHeaders_unprotectedHeaders_payload_signature_includeCBORTag_, v11, v12, v13, v15, a7 & 1);
  sub_20D85D584(a5, a6);

  return v16;
}

uint64_t sub_20D85E178(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_20D85D584(a1, a2);
  return a1;
}

uint64_t sub_20D85E18C(uint64_t a1, unint64_t a2)
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

void COSE_Sign1.init(data:)(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  sub_20D85FECC(a1, a2, (Class *)&off_24C7D2C50, a3);
}

uint64_t COSE_Sign1.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  id v5;
  id v6;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  _QWORD v12[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20D878274();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v12, v12[3]);
    sub_20D85D69C();
    sub_20D8780AC();
    v5 = objc_msgSend(objc_allocWithZone((Class)COSE_Sign1), sel_initWithCBOR_, v11);
    if (v5)
    {
      v6 = v5;

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
      *a2 = v6;
    }
    else
    {
      v8 = sub_20D877DB8();
      swift_allocError();
      v10 = v9;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
      *v10 = &type metadata for COSE_Sign1;
      sub_20D877DA0();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v8 - 8) + 104))(v10, *MEMORY[0x24BEE26D0], v8);
      swift_willThrow();

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t COSE_Sign1.encode(to:)(_QWORD *a1)
{
  return sub_20D85F490(a1, (SEL *)&selRef_cborWithCOSE_);
}

uint64_t COSE_Sign1.payload.getter()
{
  return sub_20D85FE5C((SEL *)&selRef_content);
}

uint64_t COSE_Sign1.signature.getter()
{
  return sub_20D85EB04((SEL *)&selRef_signature);
}

id COSE_Sign1.algorithmIdentifier.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_algorithmIdentifier);
}

uint64_t COSE_Sign1.contentType.getter()
{
  return sub_20D85ED10((SEL *)&selRef_contentType);
}

uint64_t COSE_Sign1.keyIdentifier.getter()
{
  return sub_20D85FE5C((SEL *)&selRef_keyIdentifier);
}

uint64_t COSE_Sign1.initializationVector.getter()
{
  return sub_20D85FE5C((SEL *)&selRef_initializationVector);
}

uint64_t COSE_Sign1.partialInitializationVector.getter()
{
  return sub_20D85FE5C((SEL *)&selRef_partialInitializationVector);
}

uint64_t COSE_Sign1.x509Bag.getter()
{
  return sub_20D85E3FC((SEL *)&selRef_x509bag);
}

uint64_t COSE_Sign1.x509Chain.getter()
{
  return sub_20D85E3FC((SEL *)&selRef_x509chain);
}

uint64_t sub_20D85E3FC(SEL *a1)
{
  id *v1;
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(*v1, *a1);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_20D877CF8();

  return v4;
}

uint64_t COSE_Sign1.x509Uri.getter()
{
  return sub_20D85ED10((SEL *)&selRef_x509uri);
}

uint64_t COSE_Sign1.X509Hash.algorithmIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t COSE_Sign1.X509Hash.value.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_20D85E18C(v1, *(_QWORD *)(v0 + 24));
  return v1;
}

BOOL sub_20D85E4BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_20D85E4D8()
{
  return sub_20D878250();
}

uint64_t sub_20D85E504()
{
  _BYTE *v0;

  if (*v0)
    return 0x65756C6176;
  else
    return 0xD000000000000013;
}

uint64_t sub_20D85E540@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_20D864A08(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20D85E564()
{
  return 0;
}

void sub_20D85E570(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_20D85E57C()
{
  sub_20D864138();
  return sub_20D8782E0();
}

uint64_t sub_20D85E5A4()
{
  sub_20D864138();
  return sub_20D8782EC();
}

uint64_t COSE_Sign1.X509Hash.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9210);
  v13 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 16);
  v11 = *(_QWORD *)(v1 + 24);
  v12 = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20D864138();
  sub_20D8782A4();
  LOBYTE(v14) = 0;
  sub_20D877EFC();
  if (!v2)
  {
    v14 = v12;
    v15 = v11;
    v16 = 1;
    sub_20D85D540();
    sub_20D877F08();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v7, v4);
}

uint64_t COSE_Sign1.X509Hash.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD v16[2];
  char v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9220);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20D864138();
  sub_20D87828C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  LOBYTE(v16[0]) = 0;
  v10 = sub_20D877ED8();
  v12 = v11;
  v17 = 1;
  sub_20D86417C();
  swift_bridgeObjectRetain();
  sub_20D877EE4();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  v13 = v16[0];
  v14 = v16[1];
  swift_bridgeObjectRetain();
  sub_20D85E18C(v13, v14);
  swift_bridgeObjectRelease();
  *a2 = v10;
  a2[1] = v12;
  a2[2] = v13;
  a2[3] = v14;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  swift_bridgeObjectRelease();
  return sub_20D85D584(v13, v14);
}

uint64_t sub_20D85E8F8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return COSE_Sign1.X509Hash.init(from:)(a1, a2);
}

uint64_t sub_20D85E90C(_QWORD *a1)
{
  return COSE_Sign1.X509Hash.encode(to:)(a1);
}

double COSE_Sign1.x509Hash.getter@<D0>(uint64_t *a1@<X8>)
{
  id *v1;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double result;

  v3 = *v1;
  v4 = objc_msgSend(*v1, sel_x509hashAlgorithmIdentifier);
  if (v4)
  {
    v5 = v4;
    v6 = sub_20D877C50();
    v8 = v7;

    v9 = objc_msgSend(v3, sel_x509hashValue);
    if (v9)
    {
      v10 = v9;
      v11 = sub_20D877BD8();
      v13 = v12;

      *a1 = v6;
      a1[1] = v8;
      a1[2] = v11;
      a1[3] = v13;
      return result;
    }
    swift_bridgeObjectRelease();
  }
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  return result;
}

uint64_t sub_20D85E9CC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return COSE_Sign1.init(from:)(a1, a2);
}

uint64_t sub_20D85E9E0(_QWORD *a1)
{
  return COSE_Sign1.encode(to:)(a1);
}

uint64_t _s11CBORLibrary10COSE_Sign1V28rawProtectedHeaderParameters10Foundation4DataVvg_0()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel_protectedHeaderParameters);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_20D877BD8();

  return v3;
}

unint64_t _s11CBORLibrary10COSE_Sign1V30rawUnprotectedHeaderParametersSDySo4CBORCAFGvg_0()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel_unprotectedHeaderParameters);
  if (!v1)
    return sub_20D851DD4(MEMORY[0x24BEE4AF8]);
  v2 = v1;
  sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  sub_20D85BEFC();
  v3 = sub_20D877C14();

  return v3;
}

uint64_t COSE_Mac0.payload.getter()
{
  return sub_20D85FE5C((SEL *)&selRef_content);
}

uint64_t COSE_Mac0.mac.getter()
{
  return sub_20D85EB04((SEL *)&selRef_mac);
}

uint64_t sub_20D85EB04(SEL *a1)
{
  id *v1;
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(*v1, *a1);
  v3 = sub_20D877BD8();

  return v3;
}

char *_s11CBORLibrary10COSE_Sign1V23criticalHeaderParameterSaySiGSgvg_0()
{
  id *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;

  v1 = objc_msgSend(*v0, sel_criticalHeaderParameters);
  if (!v1)
    return (char *)v1;
  sub_20D85BF60(0, &qword_2549C9208);
  v2 = sub_20D877CF8();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_4;
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v3 = sub_20D877E9C();
  swift_bridgeObjectRelease();
  if (!v3)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
LABEL_4:
  v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
  result = sub_20D86411C(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v1 = v11;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x212BA9EBC](v5, v2);
      else
        v6 = *(id *)(v2 + 8 * v5 + 32);
      v7 = v6;
      v8 = objc_msgSend(v6, sel_integerValue);

      v10 = v11[2];
      v9 = v11[3];
      if (v10 >= v9 >> 1)
        sub_20D86411C((char *)(v9 > 1), v10 + 1, 1);
      ++v5;
      v11[2] = v10 + 1;
      v11[v10 + 4] = v8;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v1;
  }
  __break(1u);
  return result;
}

uint64_t COSE_Mac0.contentType.getter()
{
  return sub_20D85ED10((SEL *)&selRef_contentType);
}

uint64_t sub_20D85ED10(SEL *a1)
{
  id *v1;
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(*v1, *a1);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_20D877C50();

  return v4;
}

uint64_t COSE_Mac0.keyIdentifier.getter()
{
  return sub_20D85FE5C((SEL *)&selRef_keyIdentifier);
}

uint64_t COSE_Mac0.initializationVector.getter()
{
  return sub_20D85FE5C((SEL *)&selRef_initializationVector);
}

uint64_t COSE_Mac0.partialInitializationVector.getter()
{
  return sub_20D85FE5C((SEL *)&selRef_partialInitializationVector);
}

uint64_t COSE_Mac0.computeMAC_Structure(externalAAD:)(uint64_t a1, unint64_t a2)
{
  void **v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = *v2;
  if (a2 >> 60 == 15)
    v4 = 0;
  else
    v4 = (void *)sub_20D877BCC();
  v5 = objc_msgSend(v3, sel_generateMessageForMACWithApplicationProtectedAttributes_, v4);

  v6 = sub_20D877BD8();
  return v6;
}

uint64_t COSE_Mac0.init(algorithmIdentifier:keyIdentifier:initializationVector:partialInitializationVector:payload:mac:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, unint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, unint64_t a10, uint64_t a11, unint64_t a12)
{
  uint64_t inited;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  uint64_t result;
  void *v27;
  char isUniquelyReferenced_nonNull_native;
  id v29;
  void *v30;
  id v31;
  char v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  char v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C91F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20D878E40;
  v20 = (void *)objc_opt_self();
  *(_QWORD *)(inited + 32) = objc_msgSend(v20, sel_cborWithInteger_, 1);
  *(_QWORD *)(inited + 40) = objc_msgSend(v20, sel_cborWithInteger_, a1);
  v21 = sub_20D851DD4(inited);
  v47 = v21;
  v22 = sub_20D851DD4(MEMORY[0x24BEE4AF8]);
  v46 = v22;
  v45 = a6;
  if (a3 >> 60 != 15)
  {
    v42 = a4;
    sub_20D85E18C(a2, a3);
    v23 = objc_msgSend(v20, sel_cborWithInteger_, 4);
    sub_20D85E18C(a2, a3);
    v24 = (void *)sub_20D877BCC();
    v25 = objc_msgSend(v20, sel_cborWithData_, v24);
    sub_20D85E178(a2, a3);

    if (v25)
    {
      a6 = v45;
      if ((v21 & 0xC000000000000001) != 0)
      {
        if (v21 >= 0)
          v21 &= 0xFFFFFFFFFFFFFF8uLL;
        result = sub_20D877E6C();
        if (__OFADD__(result, 1))
        {
          __break(1u);
          goto LABEL_32;
        }
        v21 = sub_20D8612FC(v21, result + 1);
      }
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_20D862AE8((uint64_t)v25, v23, isUniquelyReferenced_nonNull_native);
      v47 = v21;

      swift_bridgeObjectRelease();
      sub_20D85E178(a2, a3);
      a4 = v42;
    }
    else
    {
      v27 = (void *)sub_20D8611B0((unint64_t)v23);

      sub_20D85E178(a2, a3);
      a4 = v42;
      a6 = v45;
    }
  }
  if (a5 >> 60 != 15)
  {
    sub_20D85E18C(a4, a5);
    v29 = objc_msgSend(v20, sel_cborWithInteger_, 5);
    sub_20D85E18C(a4, a5);
    v30 = (void *)sub_20D877BCC();
    v31 = objc_msgSend(v20, sel_cborWithData_, v30);
    sub_20D85E178(a4, a5);

    if (!v31)
    {
      v33 = (void *)sub_20D8611B0((unint64_t)v29);

      goto LABEL_19;
    }
    if ((v22 & 0xC000000000000001) == 0)
    {
LABEL_17:
      v32 = swift_isUniquelyReferenced_nonNull_native();
      sub_20D862AE8((uint64_t)v31, v29, v32);
      v46 = v22;

      swift_bridgeObjectRelease();
LABEL_19:
      sub_20D85E178(a4, a5);
      a6 = v45;
      goto LABEL_20;
    }
    if (v22 >= 0)
      v22 &= 0xFFFFFFFFFFFFFF8uLL;
    result = sub_20D877E6C();
    if (!__OFADD__(result, 1))
    {
      v22 = sub_20D8612FC(v22, result + 1);
      goto LABEL_17;
    }
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
LABEL_20:
  if (a7 >> 60 == 15)
  {
LABEL_30:
    sub_20D85BF60(0, &qword_2549C9230);
    v41 = sub_20D85F304(v47, v46, a8, a10, a11, a12);
    sub_20D85E178(a6, a7);
    sub_20D85E178(a4, a5);
    result = sub_20D85E178(a2, a3);
    *a9 = v41;
    return result;
  }
  v34 = a4;
  sub_20D85E18C(a6, a7);
  v35 = objc_msgSend(v20, sel_cborWithInteger_, 6);
  sub_20D85E18C(a6, a7);
  v36 = (void *)sub_20D877BCC();
  v37 = objc_msgSend(v20, sel_cborWithData_, v36);
  sub_20D85E178(a6, a7);

  if (!v37)
  {
    v40 = (void *)sub_20D8611B0((unint64_t)v35);

    goto LABEL_29;
  }
  v38 = v46;
  if ((v46 & 0xC000000000000001) == 0)
  {
LABEL_27:
    v39 = swift_isUniquelyReferenced_nonNull_native();
    sub_20D862AE8((uint64_t)v37, v35, v39);
    v46 = v38;

    swift_bridgeObjectRelease();
LABEL_29:
    sub_20D85E178(a6, a7);
    a4 = v34;
    goto LABEL_30;
  }
  if (v46 >= 0)
    v38 = v46 & 0xFFFFFFFFFFFFFF8;
  result = sub_20D877E6C();
  if (!__OFADD__(result, 1))
  {
    v38 = sub_20D8612FC(v38, result + 1);
    goto LABEL_27;
  }
LABEL_33:
  __break(1u);
  return result;
}

id sub_20D85F304(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  sub_20D85BEFC();
  v10 = (void *)sub_20D877C08();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_20D877C08();
  swift_bridgeObjectRelease();
  v12 = 0;
  if (a4 >> 60 != 15)
  {
    v12 = (void *)sub_20D877BCC();
    sub_20D85E178(a3, a4);
  }
  v13 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v14 = (void *)sub_20D877BCC();
  v15 = objc_msgSend(v13, sel_initWithProtectedHeaders_unprotectedHeaders_payload_tag_, v10, v11, v12, v14);
  sub_20D85D584(a5, a6);

  return v15;
}

void COSE_Mac0.init(data:)(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  sub_20D85FECC(a1, a2, (Class *)off_24C7D2C48, a3);
}

uint64_t COSE_Mac0.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_20D85FF64(a1, (Class *)off_24C7D2C48, a2);
}

uint64_t COSE_Mac0.encode(to:)(_QWORD *a1)
{
  return sub_20D85F490(a1, (SEL *)&selRef_cborWithCOSE_);
}

uint64_t sub_20D85F490(_QWORD *a1, SEL *a2)
{
  uint64_t *v2;
  uint64_t v4;
  id v6;
  _BYTE v7[24];
  uint64_t v8;

  v4 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20D878298();
  v6 = objc_msgSend((id)objc_opt_self(), *a2, v4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v7, v8);
  sub_20D862C48();
  sub_20D8780D0();

  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
}

uint64_t sub_20D85F560@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return COSE_Mac0.init(from:)(a1, a2);
}

id COSEKey.type.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_type);
}

id COSEKey.algorithm.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_algorithm);
}

uint64_t COSEKey.identifier.getter()
{
  return sub_20D85FE5C((SEL *)&selRef_identifier);
}

uint64_t COSEKey.operations.getter()
{
  id *v0;
  id v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;

  v1 = objc_msgSend(*v0, sel_operations);
  if (!v1)
    return 0;
  v2 = v1;
  sub_20D85BF60(0, &qword_2549C9208);
  v3 = sub_20D877CF8();

  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_4;
LABEL_17:
    v7 = (char *)MEMORY[0x24BEE4AF8];
LABEL_18:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v7;
  }
  swift_bridgeObjectRetain();
  result = sub_20D877E9C();
  v4 = result;
  if (!result)
    goto LABEL_17;
LABEL_4:
  if (v4 >= 1)
  {
    v6 = 0;
    v7 = (char *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x212BA9EBC](v6, v3);
      else
        v8 = *(id *)(v3 + 8 * v6 + 32);
      v9 = v8;
      v10 = objc_msgSend(v8, sel_integerValue);

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v7 = sub_20D86372C(0, *((_QWORD *)v7 + 2) + 1, 1, v7);
      v12 = *((_QWORD *)v7 + 2);
      v11 = *((_QWORD *)v7 + 3);
      if (v12 >= v11 >> 1)
        v7 = sub_20D86372C((char *)(v11 > 1), v12 + 1, 1, v7);
      ++v6;
      *((_QWORD *)v7 + 2) = v12 + 1;
      *(_QWORD *)&v7[8 * v12 + 32] = v10;
    }
    while (v4 != v6);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t COSEKey.baseInitializeationVector.getter()
{
  return sub_20D85FE5C((SEL *)&selRef_baseInitializationVector);
}

id COSEKey.init(ec2CurveIdentifier:x:y:d:algorithm:keyOperations:keyIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, unint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11, unint64_t a12)
{
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id result;
  uint64_t v31;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a9;
  if (a10)
  {
    v17 = *(_QWORD *)(a10 + 16);
    if (v17)
    {
      v31 = MEMORY[0x24BEE4AF8];
      sub_20D877E0C();
      sub_20D85BF60(0, &qword_2549C9208);
      v18 = 0;
      do
      {
        v19 = v18 + 1;
        sub_20D877D40();
        sub_20D877DF4();
        sub_20D877E18();
        sub_20D877E24();
        sub_20D877E00();
        v18 = v19;
      }
      while (v17 != v19);
      v20 = v31;
      swift_bridgeObjectRelease();
      v15 = a9;
      v12 = a7;
      v14 = a5;
      v13 = a6;
    }
    else
    {
      swift_bridgeObjectRelease();
      v20 = MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    v20 = 0;
  }
  v21 = objc_allocWithZone((Class)COSEKey);
  result = sub_20D860C1C(a8, a1, a2, a3, a4, v14, v13, v12, v20, a11, a12);
  *v15 = result;
  return result;
}

id COSEKey.init(ec2CurveIdentifier:x:signBit:d:algorithm:keyOperations:keyIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, unint64_t a11)
{
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id result;
  uint64_t v29;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a9;
  if (a8)
  {
    v15 = a4;
    v16 = *(_QWORD *)(a8 + 16);
    if (v16)
    {
      v29 = MEMORY[0x24BEE4AF8];
      sub_20D877E0C();
      sub_20D85BF60(0, &qword_2549C9208);
      v17 = 0;
      do
      {
        v18 = v17 + 1;
        sub_20D877D40();
        sub_20D877DF4();
        sub_20D877E18();
        sub_20D877E24();
        sub_20D877E00();
        v17 = v18;
      }
      while (v16 != v18);
      v19 = v29;
      swift_bridgeObjectRelease();
      v12 = a6;
      v14 = a9;
      v11 = a7;
      v13 = a5;
    }
    else
    {
      swift_bridgeObjectRelease();
      v19 = MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    v15 = a4;
    v19 = 0;
  }
  v20 = objc_allocWithZone((Class)COSEKey);
  result = sub_20D860DAC(v11, a1, a2, a3, v15 & 1, v13, v12, v19, a10, a11);
  *v14 = result;
  return result;
}

id COSEKey.init(okpCurveIdentifier:x:d:algorithm:keyOperations:keyIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, unint64_t a10)
{
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id result;
  uint64_t v28;

  v10 = a8;
  v11 = a5;
  v12 = a4;
  v13 = a9;
  if (a7)
  {
    v14 = a1;
    v15 = a6;
    v16 = *(_QWORD *)(a7 + 16);
    if (v16)
    {
      v28 = MEMORY[0x24BEE4AF8];
      sub_20D877E0C();
      sub_20D85BF60(0, &qword_2549C9208);
      v17 = 0;
      do
      {
        v18 = v17 + 1;
        sub_20D877D40();
        sub_20D877DF4();
        sub_20D877E18();
        sub_20D877E24();
        sub_20D877E00();
        v17 = v18;
      }
      while (v16 != v18);
      v19 = v28;
      swift_bridgeObjectRelease();
      v13 = a9;
      v10 = a8;
      v12 = a4;
      v11 = a5;
    }
    else
    {
      swift_bridgeObjectRelease();
      v19 = MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    v14 = a1;
    v15 = a6;
    v19 = 0;
  }
  v20 = objc_allocWithZone((Class)COSEKey);
  result = sub_20D860F50(v15, v14, a2, a3, v12, v11, v19, v10, a10);
  *v13 = result;
  return result;
}

void COSEKey.ec2.getter(_QWORD *a1@<X8>)
{
  id *v1;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  void *v17;
  unint64_t v18;
  id v19;
  void *v20;
  unint64_t v21;

  v3 = *v1;
  if (objc_msgSend(*v1, sel_type) == (id)2
    && (v4 = objc_msgSend(v3, sel_ecCurveIdentifier)) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_integerValue);
    v7 = objc_msgSend(v3, sel_ecCurveX);
    if (v7)
    {
      v8 = v7;
      v9 = sub_20D877BD8();
      v11 = v10;

    }
    else
    {
      v9 = 0;
      v11 = 0xC000000000000000;
    }
    v16 = objc_msgSend(v3, sel_ecCurveY);
    if (v16)
    {
      v17 = v16;
      v12 = sub_20D877BD8();
      v13 = v18;

    }
    else
    {
      v12 = 0;
      v13 = 0xC000000000000000;
    }
    v19 = objc_msgSend(v3, sel_ecCurveD);
    if (v19)
    {
      v20 = v19;
      v14 = sub_20D877BD8();
      v15 = v21;

    }
    else
    {

      v14 = 0;
      v15 = 0xC000000000000000;
    }
  }
  else
  {
    v6 = 0;
    v9 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v11 = 0xF000000000000000;
  }
  *a1 = v6;
  a1[1] = v9;
  a1[2] = v11;
  a1[3] = v12;
  a1[4] = v13;
  a1[5] = v14;
  a1[6] = v15;
}

void COSEKey.okp.getter(_QWORD *a1@<X8>)
{
  id *v1;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  unint64_t v16;

  v3 = *v1;
  if (objc_msgSend(*v1, sel_type) == (id)1
    && (v4 = objc_msgSend(v3, sel_okpCurveIdentifier)) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_integerValue);
    v7 = objc_msgSend(v3, sel_okpCurveX);
    if (v7)
    {
      v8 = v7;
      v9 = sub_20D877BD8();
      v11 = v10;

    }
    else
    {
      v9 = 0;
      v11 = 0xC000000000000000;
    }
    v14 = objc_msgSend(v3, sel_okpCurveD);
    if (v14)
    {
      v15 = v14;
      v12 = sub_20D877BD8();
      v13 = v16;

    }
    else
    {

      v12 = 0;
      v13 = 0xC000000000000000;
    }
  }
  else
  {
    v6 = 0;
    v9 = 0;
    v12 = 0;
    v13 = 0;
    v11 = 0xF000000000000000;
  }
  *a1 = v6;
  a1[1] = v9;
  a1[2] = v11;
  a1[3] = v12;
  a1[4] = v13;
}

uint64_t COSEKey.symmetricKey.getter()
{
  return sub_20D85FE5C((SEL *)&selRef_symmetricKey);
}

uint64_t sub_20D85FE5C(SEL *a1)
{
  id *v1;
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(*v1, *a1);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_20D877BD8();

  return v4;
}

void COSEKey.init(data:)(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  sub_20D85FECC(a1, a2, (Class *)off_24C7D2C40, a3);
}

void sub_20D85FECC(uint64_t a1@<X0>, unint64_t a2@<X1>, Class *a3@<X2>, _QWORD *a4@<X8>)
{
  id v7;
  void *v8;
  id v9;

  v7 = objc_allocWithZone(*a3);
  v8 = (void *)sub_20D877BCC();
  v9 = objc_msgSend(v7, sel_initWithData_, v8);
  sub_20D85D584(a1, a2);

  *a4 = v9;
}

uint64_t COSEKey.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_20D85FF64(a1, (Class *)off_24C7D2C40, a2);
}

uint64_t sub_20D85FF64@<X0>(_QWORD *a1@<X0>, Class *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  void *v7;
  id v8;
  id v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  _QWORD v14[4];
  void *v15;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20D878274();
  if (!v3)
  {
    __swift_project_boxed_opaque_existential_1(v14, v14[3]);
    sub_20D85D69C();
    sub_20D8780AC();
    v7 = v15;
    v8 = objc_msgSend(objc_allocWithZone(*a2), sel_initWithCBOR_, v15);
    if (v8)
    {
      v9 = v8;

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
      *a3 = v9;
    }
    else
    {
      v11 = sub_20D877DB8();
      swift_allocError();
      v13 = v12;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088);
      *v13 = sub_20D85BF60(0, &qword_2549C9230);
      sub_20D877DA0();
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v13, *MEMORY[0x24BEE26D0], v11);
      swift_willThrow();

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t COSEKey.encode(to:)(_QWORD *a1)
{
  return sub_20D85F490(a1, (SEL *)&selRef_cborWithCOSEKey_);
}

uint64_t sub_20D860124@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return COSEKey.init(from:)(a1, a2);
}

uint64_t sub_20D860138(_QWORD *a1)
{
  return COSEKey.encode(to:)(a1);
}

BOOL static CBOR.InitError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CBOR.InitError.hash(into:)()
{
  return sub_20D878250();
}

uint64_t CBOR.InitError.hashValue.getter()
{
  sub_20D878244();
  sub_20D878250();
  return sub_20D878268();
}

uint64_t sub_20D8601D0()
{
  sub_20D878244();
  sub_20D878250();
  return sub_20D878268();
}

uint64_t sub_20D860214()
{
  sub_20D878244();
  sub_20D878250();
  return sub_20D878268();
}

id CBOR.init<A>(_:tag:fullDate:)(uint64_t a1, id a2, char a3, char a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char v19;
  char *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  int v25;
  void *v26;
  double v27;
  id v28;
  void *v29;
  id v30;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  unint64_t v38;
  char v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  double v46;
  unint64_t v47;

  v10 = sub_20D877BFC();
  v11 = *(_QWORD *)(v10 - 8);
  v13 = MEMORY[0x24BDAC7A8](v10, v12);
  v15 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](v13, v16);
  v18 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = 0;
  if ((a3 & 1) != 0
    || (v45 = objc_msgSend((id)objc_opt_self(), sel_cborWithInteger_, a2),
        a2 != (id)24)
    || a5 == MEMORY[0x24BDCDDE8])
  {
    if (a5 == MEMORY[0x24BEE1768])
    {
      v21 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      v22 = v44;
      v23 = a1;
      (*(void (**)(char *, uint64_t, _QWORD))(v44 + 16))(v18, a1, MEMORY[0x24BEE1768]);
      swift_dynamicCast();
      v24 = objc_msgSend((id)objc_opt_self(), sel_cborWithInteger_, *(_QWORD *)&v46);
    }
    else if (a5 == MEMORY[0x24BEE3F30])
    {
      v21 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      v22 = v44;
      v23 = a1;
      (*(void (**)(char *, uint64_t, _QWORD))(v44 + 16))(v18, a1, MEMORY[0x24BEE3F30]);
      swift_dynamicCast();
      v24 = objc_msgSend((id)objc_opt_self(), sel_cborWithInteger_, SLOWORD(v46));
    }
    else if (a5 == MEMORY[0x24BEE3F88])
    {
      v21 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      v22 = v44;
      v23 = a1;
      (*(void (**)(char *, uint64_t, _QWORD))(v44 + 16))(v18, a1, MEMORY[0x24BEE3F88]);
      swift_dynamicCast();
      v24 = objc_msgSend((id)objc_opt_self(), sel_cborWithInteger_, SLODWORD(v46));
    }
    else if (a5 == MEMORY[0x24BEE4008])
    {
      v21 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      v22 = v44;
      v23 = a1;
      (*(void (**)(char *, uint64_t, _QWORD))(v44 + 16))(v18, a1, MEMORY[0x24BEE4008]);
      swift_dynamicCast();
      v24 = objc_msgSend((id)objc_opt_self(), sel_cborWithInteger_, *(_QWORD *)&v46);
    }
    else if (a5 == MEMORY[0x24BEE1E88])
    {
      v21 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      v22 = v44;
      v23 = a1;
      (*(void (**)(char *, uint64_t, _QWORD))(v44 + 16))(v18, a1, MEMORY[0x24BEE1E88]);
      swift_dynamicCast();
      v24 = objc_msgSend((id)objc_opt_self(), sel_cborWithUnsignedInteger_, *(_QWORD *)&v46);
    }
    else if (a5 == MEMORY[0x24BEE4478])
    {
      v21 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      v22 = v44;
      v23 = a1;
      (*(void (**)(char *, uint64_t, _QWORD))(v44 + 16))(v18, a1, MEMORY[0x24BEE4478]);
      swift_dynamicCast();
      v24 = objc_msgSend((id)objc_opt_self(), sel_cborWithUnsignedInteger_, LOWORD(v46));
    }
    else if (a5 == MEMORY[0x24BEE44F0])
    {
      v21 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      v22 = v44;
      v23 = a1;
      (*(void (**)(char *, uint64_t, _QWORD))(v44 + 16))(v18, a1, MEMORY[0x24BEE44F0]);
      swift_dynamicCast();
      v24 = objc_msgSend((id)objc_opt_self(), sel_cborWithUnsignedInteger_, LODWORD(v46));
    }
    else if (a5 == MEMORY[0x24BEE4568])
    {
      v21 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      v22 = v44;
      v23 = a1;
      (*(void (**)(char *, uint64_t, _QWORD))(v44 + 16))(v18, a1, MEMORY[0x24BEE4568]);
      swift_dynamicCast();
      v24 = objc_msgSend((id)objc_opt_self(), sel_cborWithUnsignedInteger_, *(_QWORD *)&v46);
    }
    else if (a5 == MEMORY[0x24BEE14E8])
    {
      v21 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      v22 = v44;
      v23 = a1;
      (*(void (**)(char *, uint64_t, _QWORD))(v44 + 16))(v18, a1, MEMORY[0x24BEE14E8]);
      swift_dynamicCast();
      v25 = LODWORD(v46);
      v26 = (void *)objc_opt_self();
      LODWORD(v27) = v25;
      v24 = objc_msgSend(v26, sel_cborWithFloat_, v27);
    }
    else
    {
      if (a5 != MEMORY[0x24BEE13C8])
      {
        if (a5 == MEMORY[0x24BEE0D00])
        {
          v32 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
          v22 = v44;
          v23 = a1;
          (*(void (**)(char *, uint64_t, _QWORD))(v44 + 16))(v18, a1, MEMORY[0x24BEE0D00]);
          swift_dynamicCast();
          v33 = (void *)sub_20D877C44();
          swift_bridgeObjectRelease();
          v28 = objc_msgSend((id)objc_opt_self(), sel_cborWithUTF8String_, v33);

        }
        else
        {
          if (a5 != MEMORY[0x24BDCDDE8])
          {
            if (v10 != a5)
            {
              v19 = 0;
              goto LABEL_5;
            }
            v39 = a4;
            v23 = a1;
            if (a4 == 2)
            {
              (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v18, a1, a5);
              swift_dynamicCast();
              v40 = (void *)sub_20D877BE4();
              v41 = objc_msgSend((id)objc_opt_self(), sel_cborWithDateTime_, v40);
              v30 = v45;
            }
            else
            {
              (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v18, a1, a5);
              swift_dynamicCast();
              v40 = (void *)sub_20D877BE4();
              v42 = (void *)objc_opt_self();
              v30 = v45;
              if ((v39 & 1) != 0)
                v41 = objc_msgSend(v42, sel_cborWithFullDate_, v40);
              else
                v41 = objc_msgSend(v42, sel_cborWithDateTime_, v40);
            }
            v28 = v41;

            (*(void (**)(char *, uint64_t))(v11 + 8))(v15, a5);
            a2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCbor_tag_, v28, v30);
            v22 = v44;
LABEL_32:

            (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, a5);
            return a2;
          }
          v32 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
          v22 = v44;
          v23 = a1;
          (*(void (**)(char *, uint64_t, _QWORD))(v44 + 16))(v18, a1, MEMORY[0x24BDCDDE8]);
          swift_dynamicCast();
          v34 = a5;
          v35 = *(_QWORD *)&v46;
          v36 = v47;
          v37 = (void *)sub_20D877BCC();
          v28 = objc_msgSend((id)objc_opt_self(), sel_cborWithData_, v37);
          v38 = v36;
          a5 = v34;
          sub_20D85D584(v35, v38);

        }
        v29 = v32;
LABEL_31:
        v30 = v45;
        a2 = objc_msgSend(v29, sel_initWithCbor_tag_, v28, v45);
        goto LABEL_32;
      }
      v21 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      v22 = v44;
      v23 = a1;
      (*(void (**)(char *, uint64_t, _QWORD))(v44 + 16))(v18, a1, MEMORY[0x24BEE13C8]);
      swift_dynamicCast();
      v24 = objc_msgSend((id)objc_opt_self(), sel_cborWithDouble_, v46);
    }
    v28 = v24;
    v29 = v21;
    goto LABEL_31;
  }
  v19 = 1;
LABEL_5:
  sub_20D8641C0();
  swift_allocError();
  *v20 = v19;
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v44 + 8))(a1, a5);
  return a2;
}

id sub_20D860C1C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10, unint64_t a11)
{
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v26;
  void *v27;

  v17 = (void *)sub_20D877BCC();
  v27 = (void *)sub_20D877BCC();
  if (a8 >> 60 == 15)
  {
    v18 = 0;
    v19 = a11;
    if (a9)
    {
LABEL_3:
      sub_20D85BF60(0, &qword_2549C9208);
      v20 = (void *)sub_20D877CEC();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    v18 = (void *)sub_20D877BCC();
    sub_20D85E178(a7, a8);
    v19 = a11;
    if (a9)
      goto LABEL_3;
  }
  v20 = 0;
LABEL_6:
  if (v19 >> 60 == 15)
  {
    v21 = 0;
  }
  else
  {
    v21 = (void *)sub_20D877BCC();
    sub_20D85E178(a10, v19);
  }
  v22 = objc_msgSend(v26, sel_initEC2WithAlgorithm_curveIdentifier_x_y_d_keyOperations_keyIdentifier_, a1, a2, v17, v27, v18, v20, v21);
  sub_20D85D584(a5, a6);
  sub_20D85D584(a3, a4);

  return v22;
}

id sub_20D860DAC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, char a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  void *v10;
  void *v11;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  id v24;

  v11 = v10;
  v19 = (void *)sub_20D877BCC();
  if (a7 >> 60 == 15)
  {
    v20 = 0;
    v21 = a10;
    if (a8)
    {
LABEL_3:
      sub_20D85BF60(0, &qword_2549C9208);
      v22 = (void *)sub_20D877CEC();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    v20 = (void *)sub_20D877BCC();
    sub_20D85E178(a6, a7);
    v21 = a10;
    if (a8)
      goto LABEL_3;
  }
  v22 = 0;
LABEL_6:
  if (v21 >> 60 == 15)
  {
    v23 = 0;
  }
  else
  {
    v23 = (void *)sub_20D877BCC();
    sub_20D85E178(a9, v21);
  }
  v24 = objc_msgSend(v11, sel_initEC2WithAlgorithm_curveIdentifier_x_signBit_d_keyOperations_keyIdentifier_, a1, a2, v19, a5 & 1, v20, v22, v23);
  sub_20D85D584(a3, a4);

  return v24;
}

id sub_20D860F50(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v24;

  v17 = (void *)sub_20D877BCC();
  if (a6 >> 60 == 15)
  {
    v18 = 0;
    v19 = a9;
    if (a7)
    {
LABEL_3:
      sub_20D85BF60(0, &qword_2549C9208);
      v20 = (void *)sub_20D877CEC();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    v18 = (void *)sub_20D877BCC();
    sub_20D85E178(a5, a6);
    v19 = a9;
    if (a7)
      goto LABEL_3;
  }
  v20 = 0;
LABEL_6:
  if (v19 >> 60 == 15)
  {
    v21 = 0;
  }
  else
  {
    v21 = (void *)sub_20D877BCC();
    sub_20D85E178(a8, v19);
  }
  v22 = objc_msgSend(v24, sel_initOKPWithAlgorithm_curveIdentifier_x_d_keyOperations_keyIdentifier_, a1, a2, v17, v18, v20, v21);
  sub_20D85D584(a3, a4);

  return v22;
}

double sub_20D8610B4@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double result;
  uint64_t v13;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_20D86E598(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v13 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_20D862E8C();
      v9 = v13;
    }
    v10 = *(_QWORD *)(v9 + 48);
    v11 = sub_20D877E48();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v6, v11);
    sub_20D85C0C4((_OWORD *)(*(_QWORD *)(v9 + 56) + 32 * v6), a2);
    sub_20D862364(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_20D8611B0(unint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  char v13;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v17;

  v2 = v1;
  v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_20D86E68C(a1);
    v13 = v12;
    swift_bridgeObjectRelease();
    if ((v13 & 1) != 0)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v9 = *v2;
      v17 = *v2;
      *v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_20D8632AC();
        v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0)
    v5 = v4;
  else
    v5 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v6 = (id)a1;
  v7 = sub_20D877E78();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  v8 = sub_20D877E6C();
  v9 = sub_20D8612FC(v5, v8);
  swift_retain();
  a1 = sub_20D86E68C((uint64_t)v6);
  v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  v15 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * a1);
  sub_20D8627BC(a1, v9);
  *v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_20D8612FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C90C0);
    v2 = sub_20D877EC0();
    v18 = v2;
    sub_20D877E60();
    v3 = sub_20D877E84();
    if (v3)
    {
      v4 = v3;
      sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
      do
      {
        swift_dynamicCast();
        swift_dynamicCast();
        v2 = v18;
        v12 = *(_QWORD *)(v18 + 16);
        if (*(_QWORD *)(v18 + 24) <= v12)
        {
          sub_20D861DC0(v12 + 1, 1);
          v2 = v18;
        }
        result = sub_20D877D4C();
        v6 = v2 + 64;
        v7 = -1 << *(_BYTE *)(v2 + 32);
        v8 = result & ~v7;
        v9 = v8 >> 6;
        if (((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          v10 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v13 = 0;
          v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v15 = v9 == v14;
            if (v9 == v14)
              v9 = 0;
            v13 |= v15;
            v16 = *(_QWORD *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(_QWORD *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        v11 = 8 * v10;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v11) = v17;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v11) = v4;
        ++*(_QWORD *)(v2 + 16);
        v4 = sub_20D877E84();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B00];
  }
  return v2;
}

uint64_t sub_20D86152C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9098);
    v2 = sub_20D877EC0();
    v20 = v2;
    sub_20D877E60();
    if (sub_20D877E84())
    {
      v4 = v3;
      sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
      do
      {
        swift_dynamicCast();
        v2 = v20;
        v14 = *(_QWORD *)(v20 + 16);
        if (*(_QWORD *)(v20 + 24) <= v14)
        {
          sub_20D862090(v14 + 1, 1);
          v2 = v20;
        }
        result = sub_20D877D4C();
        v6 = v2 + 64;
        v7 = -1 << *(_BYTE *)(v2 + 32);
        v8 = result & ~v7;
        v9 = v8 >> 6;
        if (((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          v10 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v15 = 0;
          v16 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v16 && (v15 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v17 = v9 == v16;
            if (v9 == v16)
              v9 = 0;
            v15 |= v17;
            v18 = *(_QWORD *)(v6 + 8 * v9);
          }
          while (v18 == -1);
          v10 = __clz(__rbit64(~v18)) + (v9 << 6);
        }
        *(_QWORD *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        v11 = 8 * v10;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v11) = v19;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v11) = v4;
        ++*(_QWORD *)(v2 + 16);
        v12 = sub_20D877E84();
        v4 = v13;
      }
      while (v12);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B00];
  }
  return v2;
}

uint64_t sub_20D861740(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  int64_t v38;
  _QWORD *v39;
  int v40;
  _OWORD v41[2];

  v3 = v2;
  v5 = sub_20D877E48();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9118);
  v40 = a2;
  v11 = sub_20D877EB4();
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_41;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 64);
  v39 = (_QWORD *)(v10 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v37 = v2;
  v38 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 64;
  result = swift_retain();
  v19 = 0;
  while (1)
  {
    if (v16)
    {
      v21 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v22 = v21 | (v19 << 6);
      goto LABEL_22;
    }
    v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v38)
      break;
    v24 = v39;
    v25 = v39[v23];
    ++v19;
    if (!v25)
    {
      v19 = v23 + 1;
      if (v23 + 1 >= v38)
        goto LABEL_34;
      v25 = v39[v19];
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v38)
        {
LABEL_34:
          swift_release();
          v3 = v37;
          if ((v40 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v25 = v39[v26];
        if (!v25)
        {
          while (1)
          {
            v19 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_43;
            if (v19 >= v38)
              goto LABEL_34;
            v25 = v39[v19];
            ++v26;
            if (v25)
              goto LABEL_21;
          }
        }
        v19 = v26;
      }
    }
LABEL_21:
    v16 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v19 << 6);
LABEL_22:
    v27 = *(_QWORD *)(v6 + 72);
    v28 = *(_QWORD *)(v10 + 48) + v27 * v22;
    if ((v40 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v9, v28, v5);
      sub_20D85C0C4((_OWORD *)(*(_QWORD *)(v10 + 56) + 32 * v22), v41);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v9, v28, v5);
      sub_20D864AF0(*(_QWORD *)(v10 + 56) + 32 * v22, (uint64_t)v41);
    }
    result = sub_20D877C2C();
    v29 = -1 << *(_BYTE *)(v12 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v17 + 8 * (v30 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v17 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v17 + 8 * v31);
      }
      while (v35 == -1);
      v20 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v12 + 48) + v27 * v20, v9, v5);
    result = (uint64_t)sub_20D85C0C4(v41, (_OWORD *)(*(_QWORD *)(v12 + 56) + 32 * v20));
    ++*(_QWORD *)(v12 + 16);
  }
  swift_release();
  v3 = v37;
  v24 = v39;
  if ((v40 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v10 + 32);
  if (v36 >= 64)
    bzero(v24, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v36;
  *(_QWORD *)(v10 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v12;
  return result;
}

uint64_t sub_20D861AC4(uint64_t a1, char a2)
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
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C90F8);
  v6 = sub_20D877EB4();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_20D85C0C4(v24, v35);
      }
      else
      {
        sub_20D864AF0((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_20D878244();
      sub_20D877C68();
      result = sub_20D878268();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_20D85C0C4(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_20D861DC0(uint64_t a1, char a2)
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
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C90C0);
  v6 = sub_20D877EB4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
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
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v37 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v31;
      v34 = v32;
    }
    result = sub_20D877D4C();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_20D862090(uint64_t a1, char a2)
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
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9098);
  v6 = sub_20D877EB4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
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
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v31;
      swift_unknownObjectRetain();
    }
    result = sub_20D877D4C();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_20D862364(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v23;
  uint64_t v24;
  _OWORD *v25;
  _OWORD *v26;
  __int128 v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, unint64_t, uint64_t);
  unint64_t v36;
  uint64_t v37;

  v4 = sub_20D877E48();
  v37 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4, v5);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a2 + 64;
  v10 = -1 << *(_BYTE *)(a2 + 32);
  v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(_QWORD *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    v12 = ~v10;
    result = sub_20D877D70();
    if ((*(_QWORD *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      v36 = (result + 1) & v12;
      v13 = *(_QWORD *)(v37 + 72);
      v35 = *(void (**)(char *, unint64_t, uint64_t))(v37 + 16);
      v14 = v12;
      do
      {
        v15 = v9;
        v16 = v13;
        v17 = v13 * v11;
        v18 = v14;
        v35(v8, *(_QWORD *)(a2 + 48) + v13 * v11, v4);
        v19 = sub_20D877C2C();
        result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v8, v4);
        v14 = v18;
        v20 = v19 & v18;
        if (a1 >= (uint64_t)v36)
        {
          if (v20 >= v36 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            v23 = *(_QWORD *)(a2 + 48);
            result = v23 + v16 * a1;
            v9 = v15;
            if (v16 * a1 < v17 || (v13 = v16, result >= v23 + v17 + v16))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              v13 = v16;
              v14 = v18;
            }
            else if (v16 * a1 != v17)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            v24 = *(_QWORD *)(a2 + 56);
            v25 = (_OWORD *)(v24 + 32 * a1);
            v26 = (_OWORD *)(v24 + 32 * v11);
            if (a1 != v11 || (a1 = v11, v25 >= v26 + 2))
            {
              v27 = v26[1];
              *v25 = *v26;
              v25[1] = v27;
              a1 = v11;
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v36 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }
        v9 = v15;
        v13 = v16;
LABEL_5:
        v11 = (v11 + 1) & v14;
      }
      while (((*(_QWORD *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    v28 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    v29 = *v28;
    v30 = (-1 << a1) - 1;
  }
  else
  {
    v28 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    v30 = *v28;
    v29 = (-1 << a1) - 1;
  }
  *v28 = v30 & v29;
  v31 = *(_QWORD *)(a2 + 16);
  v32 = __OFSUB__(v31, 1);
  v33 = v31 - 1;
  if (v32)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v33;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_20D8625E8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_20D877D70();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_20D878244();
        swift_bridgeObjectRetain();
        sub_20D877C68();
        v10 = sub_20D878268();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_OWORD *)(v12 + 16 * v3);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = (_OWORD *)(v15 + 32 * v3);
          v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= v17 + 2))
          {
            v9 = v17[1];
            *v16 = *v17;
            v16[1] = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_20D8627BC(unint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = a1;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    v8 = sub_20D877D70();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        v11 = sub_20D877D4C();

        v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = *(_QWORD *)(a2 + 48);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1)
              *v16 = *v17;
            v18 = *(_QWORD *)(a2 + 56);
            v19 = (_QWORD *)(v18 + 8 * v3);
            v20 = (_QWORD *)(v18 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v19 >= v20 + 1))
            {
              *v19 = *v20;
              v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    v23 = *v21;
    v22 = (-1 << a1) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

_OWORD *sub_20D86296C(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  _OWORD *v22;
  _OWORD *result;
  unint64_t v24;
  char v25;
  uint64_t v26;

  v4 = (_QWORD **)v3;
  v8 = sub_20D877E48();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (_QWORD *)*v3;
  v15 = sub_20D86E598(a2);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
  }
  else
  {
    v19 = v14;
    v20 = v13[3];
    if (v20 >= v18 && (a3 & 1) != 0)
    {
LABEL_7:
      v21 = *v4;
      if ((v19 & 1) != 0)
      {
LABEL_8:
        v22 = (_OWORD *)(v21[7] + 32 * v15);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
        return sub_20D85C0C4(a1, v22);
      }
      goto LABEL_11;
    }
    if (v20 >= v18 && (a3 & 1) == 0)
    {
      sub_20D862E8C();
      goto LABEL_7;
    }
    sub_20D861740(v18, a3 & 1);
    v24 = sub_20D86E598(a2);
    if ((v19 & 1) == (v25 & 1))
    {
      v15 = v24;
      v21 = *v4;
      if ((v19 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a2, v8);
      return sub_20D862DEC(v15, (uint64_t)v12, a1, v21);
    }
  }
  result = (_OWORD *)sub_20D878208();
  __break(1u);
  return result;
}

void sub_20D862AE8(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  id v23;

  v4 = v3;
  v7 = *v3;
  v9 = sub_20D86E68C((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_20D8632AC();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];

      *(_QWORD *)(v16 + 8 * v9) = a1;
      return;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v19 = 8 * v9;
    *(_QWORD *)(v15[6] + v19) = a2;
    *(_QWORD *)(v15[7] + v19) = a1;
    v20 = v15[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v15[2] = v22;
      v23 = a2;
      return;
    }
    goto LABEL_14;
  }
  sub_20D861DC0(v12, a3 & 1);
  v17 = sub_20D86E68C((uint64_t)a2);
  if ((v13 & 1) == (v18 & 1))
  {
    v9 = v17;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  sub_20D878208();
  __break(1u);
}

unint64_t sub_20D862C48()
{
  unint64_t result;

  result = qword_2549C9200;
  if (!qword_2549C9200)
  {
    result = MEMORY[0x212BAA8AC](&protocol conformance descriptor for CBORCodableWrapper, &type metadata for CBORCodableWrapper);
    atomic_store(result, (unint64_t *)&qword_2549C9200);
  }
  return result;
}

id sub_20D862C8C(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id result;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v4 = v3;
  v7 = *v3;
  v9 = sub_20D86E68C((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_20D863450();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];
      result = (id)swift_unknownObjectRelease();
      *(_QWORD *)(v16 + 8 * v9) = a1;
      return result;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v20 = 8 * v9;
    *(_QWORD *)(v15[6] + v20) = a2;
    *(_QWORD *)(v15[7] + v20) = a1;
    v21 = v15[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v15[2] = v23;
      return a2;
    }
    goto LABEL_14;
  }
  sub_20D862090(v12, a3 & 1);
  v18 = sub_20D86E68C((uint64_t)a2);
  if ((v13 & 1) == (v19 & 1))
  {
    v9 = v18;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  result = (id)sub_20D878208();
  __break(1u);
  return result;
}

_OWORD *sub_20D862DEC(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  _OWORD *result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_20D877E48();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  result = sub_20D85C0C4(a3, (_OWORD *)(a4[7] + 32 * a1));
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

void *sub_20D862E8C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *result;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  uint64_t v26;
  _OWORD v27[2];

  v1 = v0;
  v2 = sub_20D877E48();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9118);
  v7 = *v0;
  v8 = sub_20D877EA8();
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v9;
    return result;
  }
  v25 = v1;
  result = (void *)(v8 + 64);
  v11 = (unint64_t)((1 << *(_BYTE *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11)
    result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  v26 = v7 + 64;
  v13 = 0;
  *(_QWORD *)(v9 + 16) = *(_QWORD *)(v7 + 16);
  v14 = 1 << *(_BYTE *)(v7 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v7 + 64);
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
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v17)
      goto LABEL_26;
    v23 = *(_QWORD *)(v26 + 8 * v22);
    ++v13;
    if (!v23)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v17)
        goto LABEL_26;
      v23 = *(_QWORD *)(v26 + 8 * v13);
      if (!v23)
        break;
    }
LABEL_25:
    v16 = (v23 - 1) & v23;
    v19 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v6, *(_QWORD *)(v7 + 48) + v20, v2);
    v21 = 32 * v19;
    sub_20D864AF0(*(_QWORD *)(v7 + 56) + v21, (uint64_t)v27);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v9 + 48) + v20, v6, v2);
    result = sub_20D85C0C4(v27, (_OWORD *)(*(_QWORD *)(v9 + 56) + v21));
  }
  v24 = v22 + 2;
  if (v24 >= v17)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v26 + 8 * v24);
  if (v23)
  {
    v13 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v13 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v13 >= v17)
      goto LABEL_26;
    v23 = *(_QWORD *)(v26 + 8 * v13);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_20D8630C8()
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
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C90F8);
  v2 = *v0;
  v3 = sub_20D877EA8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_20D864AF0(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_20D85C0C4(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_20D8632AC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  void *v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C90C0);
  v2 = *v0;
  v3 = sub_20D877EA8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = v18;
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

void *sub_20D863450()
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
  void *v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9098);
  v2 = *v0;
  v3 = sub_20D877EA8();
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
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = (void *)swift_unknownObjectRetain();
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

_QWORD *sub_20D8635F8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C91B8);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C91C0);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_20D86372C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9260);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

unsigned __int8 *sub_20D863824(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_20D877CBC();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_20D863B84();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_20D877DE8();
  }
LABEL_7:
  v11 = sub_20D863908(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_20D863908(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 *v19;
  unsigned int v20;
  char v21;
  uint64_t v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  v13 = 0;
                  if (v11 < 0x61 || v11 >= v8)
                    return (unsigned __int8 *)v13;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v14 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v14 - (v11 + v12);
              if (__OFSUB__(v14, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_66;
    }
    if (a2)
    {
      v23 = a3 + 48;
      v24 = a3 + 55;
      v25 = a3 + 87;
      if (a3 > 10)
      {
        v23 = 58;
      }
      else
      {
        v25 = 97;
        v24 = 65;
      }
      if (result)
      {
        v26 = 0;
        do
        {
          v27 = *result;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              v13 = 0;
              if (v27 < 0x61 || v27 >= v25)
                return (unsigned __int8 *)v13;
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
          v29 = v26 * a3;
          if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63)
            return 0;
          v26 = v29 + (v27 + v28);
          if (__OFADD__(v29, (v27 + v28)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v29 + (v27 + v28));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  v15 = a2 - 1;
  if (a2 == 1)
    return 0;
  v16 = a3 + 48;
  v17 = a3 + 55;
  v18 = a3 + 87;
  if (a3 > 10)
  {
    v16 = 58;
  }
  else
  {
    v18 = 97;
    v17 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v19 = result + 1;
  do
  {
    v20 = *v19;
    if (v20 < 0x30 || v20 >= v16)
    {
      if (v20 < 0x41 || v20 >= v17)
      {
        v13 = 0;
        if (v20 < 0x61 || v20 >= v18)
          return (unsigned __int8 *)v13;
        v21 = -87;
      }
      else
      {
        v21 = -55;
      }
    }
    else
    {
      v21 = -48;
    }
    v22 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v22 + (v20 + v21);
    if (__OFADD__(v22, (v20 + v21)))
      return 0;
    ++v19;
    --v15;
  }
  while (v15);
  return (unsigned __int8 *)v9;
}

uint64_t sub_20D863B84()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_20D877CC8();
  v4 = sub_20D863C00(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_20D863C00(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_20D863D44(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_20D863E30(v9, 0);
      v12 = sub_20D863E94((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
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
    v13 = MEMORY[0x212BA9D90](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x212BA9D90);
LABEL_9:
      sub_20D877DE8();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x212BA9D90]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_20D863D44(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_20D8640A4(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_20D8640A4(a2, a3, a4);
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
    return sub_20D877C98();
  }
  __break(1u);
  return result;
}

_QWORD *sub_20D863E30(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9270);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_20D863E94(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      result = sub_20D8640A4(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_20D877CA4();
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
          result = sub_20D877DE8();
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
    result = sub_20D8640A4(v12, a6, a7);
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
    v12 = sub_20D877C80();
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

uint64_t sub_20D8640A4(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_20D877CB0();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x212BA9DC0](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

char *sub_20D86411C(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_20D8646B0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

unint64_t sub_20D864138()
{
  unint64_t result;

  result = qword_2549C9218;
  if (!qword_2549C9218)
  {
    result = MEMORY[0x212BAA8AC](&unk_20D8797A0, &type metadata for COSE_Sign1.X509Hash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2549C9218);
  }
  return result;
}

unint64_t sub_20D86417C()
{
  unint64_t result;

  result = qword_2549C9228;
  if (!qword_2549C9228)
  {
    result = MEMORY[0x212BAA8AC](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2549C9228);
  }
  return result;
}

unint64_t sub_20D8641C0()
{
  unint64_t result;

  result = qword_2549C9238;
  if (!qword_2549C9238)
  {
    result = MEMORY[0x212BAA8AC](&protocol conformance descriptor for CBOR.InitError, &type metadata for CBOR.InitError);
    atomic_store(result, (unint64_t *)&qword_2549C9238);
  }
  return result;
}

unint64_t sub_20D864208()
{
  unint64_t result;

  result = qword_2549C9240;
  if (!qword_2549C9240)
  {
    result = MEMORY[0x212BAA8AC](&protocol conformance descriptor for CBOR.InitError, &type metadata for CBOR.InitError);
    atomic_store(result, (unint64_t *)&qword_2549C9240);
  }
  return result;
}

ValueMetadata *type metadata accessor for CBORCodableWrapper()
{
  return &type metadata for CBORCodableWrapper;
}

ValueMetadata *type metadata accessor for COSE_Sign1()
{
  return &type metadata for COSE_Sign1;
}

uint64_t destroy for COSE_Sign1.X509Hash(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return sub_20D85D584(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

_QWORD *initializeWithCopy for COSE_Sign1.X509Hash(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[2];
  v5 = a2[3];
  swift_bridgeObjectRetain();
  sub_20D85E18C(v4, v5);
  a1[2] = v4;
  a1[3] = v5;
  return a1;
}

_QWORD *assignWithCopy for COSE_Sign1.X509Hash(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = a2[2];
  v4 = a2[3];
  sub_20D85E18C(v5, v4);
  v6 = a1[2];
  v7 = a1[3];
  a1[2] = v5;
  a1[3] = v4;
  sub_20D85D584(v6, v7);
  return a1;
}

_QWORD *assignWithTake for COSE_Sign1.X509Hash(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a1[2];
  v6 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_20D85D584(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for COSE_Sign1.X509Hash(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for COSE_Sign1.X509Hash(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for COSE_Sign1.X509Hash()
{
  return &type metadata for COSE_Sign1.X509Hash;
}

ValueMetadata *type metadata accessor for COSE_Mac0()
{
  return &type metadata for COSE_Mac0;
}

ValueMetadata *type metadata accessor for COSEKey()
{
  return &type metadata for COSEKey;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for CBOR.InitError()
{
  return &type metadata for CBOR.InitError;
}

uint64_t getEnumTagSinglePayload for CBOREncoder.DateEncodingStrategy(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s9InitErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20D864544 + 4 * byte_20D879435[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20D864578 + 4 * byte_20D879430[v4]))();
}

uint64_t sub_20D864578(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D864580(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20D864588);
  return result;
}

uint64_t sub_20D864594(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20D86459CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20D8645A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D8645A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D8645B4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_20D8645BC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for COSE_Sign1.X509Hash.CodingKeys()
{
  return &type metadata for COSE_Sign1.X509Hash.CodingKeys;
}

unint64_t sub_20D8645DC()
{
  unint64_t result;

  result = qword_2549C9248;
  if (!qword_2549C9248)
  {
    result = MEMORY[0x212BAA8AC](&unk_20D879778, &type metadata for COSE_Sign1.X509Hash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2549C9248);
  }
  return result;
}

unint64_t sub_20D864624()
{
  unint64_t result;

  result = qword_2549C9250;
  if (!qword_2549C9250)
  {
    result = MEMORY[0x212BAA8AC](&unk_20D8796E8, &type metadata for COSE_Sign1.X509Hash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2549C9250);
  }
  return result;
}

unint64_t sub_20D86466C()
{
  unint64_t result;

  result = qword_2549C9258;
  if (!qword_2549C9258)
  {
    result = MEMORY[0x212BAA8AC](&unk_20D879710, &type metadata for COSE_Sign1.X509Hash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2549C9258);
  }
  return result;
}

char *sub_20D8646B0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549C9268);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_20D8647A8(uint64_t result, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  unsigned __int8 v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  unsigned __int8 v23;
  _QWORD v24[3];

  v3 = result;
  v4 = HIBYTE(a2) & 0xF;
  v5 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v6 = v4;
  else
    v6 = result & 0xFFFFFFFFFFFFLL;
  if (!v6)
    return v3;
  if ((a2 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    sub_20D863824(v3, a2, 8);
    swift_bridgeObjectRelease();
    return v3;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
      v7 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v7 = (unsigned __int8 *)sub_20D877DE8();
    sub_20D863908(v7, v5, 8);
    return v3;
  }
  v24[0] = result;
  v24[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (v4)
    {
      if (v4 != 1 && (BYTE1(result) & 0xF8) == 0x30)
      {
        v14 = (BYTE1(result) - 48);
        v15 = v4 - 2;
        if (v15)
        {
          v16 = (char *)v24 + 2;
          do
          {
            if ((*v16 & 0xF8) != 0x30 || (unint64_t)(v14 - 0x1000000000000000) >> 61 != 7)
              break;
            v18 = *v16 - 48;
            v13 = __OFADD__(8 * v14, v18);
            v14 = 8 * v14 + v18;
            if (v13)
              break;
            ++v16;
            --v15;
          }
          while (v15);
        }
      }
      return v3;
    }
  }
  else
  {
    if (result != 45)
    {
      if (v4)
      {
        if ((result & 0xF8) == 0x30)
        {
          v19 = (result - 48);
          v20 = v4 - 1;
          if (v20)
          {
            v21 = (char *)v24 + 1;
            do
            {
              if ((*v21 & 0xF8) != 0x30 || (unint64_t)(v19 - 0x1000000000000000) >> 61 != 7)
                break;
              v23 = *v21 - 48;
              v13 = __OFADD__(8 * v19, v23);
              v19 = 8 * v19 + v23;
              if (v13)
                break;
              ++v21;
              --v20;
            }
            while (v20);
          }
        }
      }
      return v3;
    }
    if (v4)
    {
      if (v4 != 1 && (BYTE1(result) & 0xF8) == 0x30)
      {
        v8 = -(uint64_t)(BYTE1(result) - 48);
        v9 = v4 - 2;
        if (v9)
        {
          v10 = (char *)v24 + 2;
          do
          {
            if ((*v10 & 0xF8) != 0x30 || (unint64_t)(v8 - 0x1000000000000000) >> 61 != 7)
              break;
            v12 = *v10 - 48;
            v13 = __OFSUB__(8 * v8, v12);
            v8 = 8 * v8 - v12;
            if (v13)
              break;
            ++v10;
            --v9;
          }
          while (v9);
        }
      }
      return v3;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_20D864A08(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000013 && a2 == 0x800000020D87A570 || (sub_20D8780A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_20D8780A0();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_20D864AF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t destroy for CBORCodingKey()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CBORCodingKey(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CBORCodingKey(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
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

uint64_t assignWithTake for CBORCodingKey(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for CBORCodingKey(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 25))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CBORCodingKey(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 25) = 1;
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
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CBORCodingKey()
{
  return &type metadata for CBORCodingKey;
}

unint64_t sub_20D864CC4()
{
  unint64_t result;

  result = qword_2549C9278;
  if (!qword_2549C9278)
  {
    result = MEMORY[0x212BAA8AC](&unk_20D879850, &type metadata for CBORCodingKey);
    atomic_store(result, (unint64_t *)&qword_2549C9278);
  }
  return result;
}

unint64_t sub_20D864D0C()
{
  unint64_t result;

  result = qword_2549C9280;
  if (!qword_2549C9280)
  {
    result = MEMORY[0x212BAA8AC](&unk_20D879800, &type metadata for CBORCodingKey);
    atomic_store(result, (unint64_t *)&qword_2549C9280);
  }
  return result;
}

unint64_t sub_20D864D54()
{
  unint64_t result;

  result = qword_2549C9288;
  if (!qword_2549C9288)
  {
    result = MEMORY[0x212BAA8AC](&unk_20D879828, &type metadata for CBORCodingKey);
    atomic_store(result, (unint64_t *)&qword_2549C9288);
  }
  return result;
}

id sub_20D864DD4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _CBORDictionary();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t (*sub_20D864E40())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t CBOREncoder.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_20D8519FC(MEMORY[0x24BEE4AF8]);
  *(_WORD *)(v0 + 24) = 2;
  return v0;
}

uint64_t CBOREncoder.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = sub_20D8519FC(MEMORY[0x24BEE4AF8]);
  *(_WORD *)(v0 + 24) = 2;
  return v0;
}

uint64_t CBOREncoder.__allocating_init(userInfo:dictionaryEncodingStrategy:dateEncodingStrategy:)(uint64_t a1, char *a2, char *a3)
{
  uint64_t result;
  char v7;
  char v8;

  result = swift_allocObject();
  v7 = *a2;
  v8 = *a3;
  *(_QWORD *)(result + 16) = a1;
  *(_BYTE *)(result + 24) = v7;
  *(_BYTE *)(result + 25) = v8;
  return result;
}

uint64_t CBOREncoder.init(userInfo:dictionaryEncodingStrategy:dateEncodingStrategy:)(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3;
  char v4;
  char v5;

  v4 = *a2;
  v5 = *a3;
  *(_QWORD *)(v3 + 16) = a1;
  *(_BYTE *)(v3 + 24) = v4;
  *(_BYTE *)(v3 + 25) = v5;
  return v3;
}

void *sub_20D864F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *result;
  void (*v6)(uint64_t *__return_ptr);
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  result = (void *)(*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v3 + 168))(a1, 0, 1, a2, a3);
  if (!v4)
  {
    v6 = *(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v3 + 176);
    v7 = result;
    v6(&v10);
    v8 = objc_msgSend((id)objc_opt_self(), sel_dataWithCBOR_encodingKeyOrder_, v7, v10 > 2u);

    v9 = sub_20D877BD8();
    return (void *)v9;
  }
  return result;
}

void *sub_20D865020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  void *result;
  void (*v7)(uint64_t *__return_ptr);
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  result = (void *)(*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)v4 + 168))(a1, a2, 0, a3, a4);
  if (!v5)
  {
    v7 = *(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v4 + 176);
    v8 = result;
    v7(&v11);
    v9 = objc_msgSend((id)objc_opt_self(), sel_dataWithCBOR_encodingKeyOrder_, v8, v11 > 2u);

    v10 = sub_20D877BD8();
    return (void *)v10;
  }
  return result;
}

void (*sub_20D8650E0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5))(uint64_t *, uint64_t, uint64_t)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  char v16;
  _QWORD *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  void (*v24)(uint64_t *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  char *v33;
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  char *v39;
  uint64_t *v40;
  uint64_t v42;
  void (*v43)(uint64_t *, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;

  v45 = a2;
  v51 = a3;
  v9 = sub_20D877DD0();
  v10 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x24BDAC7A8](v9, v11);
  v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (*(_QWORD *(**)(uint64_t *__return_ptr, uint64_t))(*(_QWORD *)v5 + 176))(&v47, v12);
  v16 = v47;
  v17 = (*(_QWORD *(**)(uint64_t *__return_ptr, _QWORD *))(*(_QWORD *)v5 + 200))(&v52, v15);
  v18 = v52;
  v19 = (*(uint64_t (**)(_QWORD *))(*(_QWORD *)v5 + 104))(v17);
  type metadata accessor for _CBOREncoder();
  v20 = swift_allocObject();
  v21 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v20 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v20 + 24) = v21;
  *(_BYTE *)(v20 + 40) = v16;
  *(_BYTE *)(v20 + 41) = v18;
  *(_QWORD *)(v20 + 32) = v19;
  v49 = a4;
  v50 = a5;
  v22 = v20;
  v23 = __swift_allocate_boxed_opaque_existential_1Tm(&v47);
  v24 = *(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16);
  v24(v23, a1, a4);
  v25 = v46;
  v26 = sub_20D865574(&v47);
  if (v25)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v47);
    return v24;
  }
  v27 = v26;
  v46 = v22;
  v42 = a1;
  v43 = (void (*)(uint64_t *, uint64_t, uint64_t))v9;
  v44 = v10;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v47);
  if (!v27)
  {
    v47 = 0;
    v48 = 0xE000000000000000;
    sub_20D877D7C();
    swift_bridgeObjectRelease();
    v47 = 0x6576656C20706F54;
    v48 = 0xEA0000000000206CLL;
    v29 = a4;
    sub_20D8782F8();
    sub_20D877C74();
    swift_bridgeObjectRelease();
    sub_20D877C74();
    sub_20D877DA0();
    v30 = sub_20D877DDC();
    swift_allocError();
    v32 = v31;
    v33 = (char *)v31 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549C9290) + 48);
    v32[3] = v29;
    boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v32);
    v24(boxed_opaque_existential_1Tm, v42, v29);
    v24 = v43;
    v35 = v44;
    (*(void (**)(char *, char *, _QWORD))(v44 + 16))(v33, v14, v43);
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v32, *MEMORY[0x24BEE2728], v30);
    swift_willThrow();
LABEL_10:
    swift_release();
    (*(void (**)(char *, void (*)(uint64_t *, uint64_t, uint64_t)))(v35 + 8))(v14, v24);
    return v24;
  }
  objc_opt_self();
  if (!swift_dynamicCastObjCClass())
  {
    v47 = 0;
    v48 = 0xE000000000000000;
    sub_20D877D7C();
    swift_bridgeObjectRelease();
    v47 = 0x6576656C20706F54;
    v48 = 0xEA0000000000206CLL;
    sub_20D8782F8();
    sub_20D877C74();
    swift_bridgeObjectRelease();
    sub_20D877C74();
    sub_20D877DA0();
    v36 = sub_20D877DDC();
    swift_allocError();
    v38 = v37;
    v39 = (char *)v37 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549C9290) + 48);
    v38[3] = a4;
    v40 = __swift_allocate_boxed_opaque_existential_1Tm(v38);
    v24(v40, v42, a4);
    v24 = v43;
    v35 = v44;
    (*(void (**)(char *, char *, _QWORD))(v44 + 16))(v39, v14, v43);
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v36 - 8) + 104))(v38, *MEMORY[0x24BEE2728], v36);
    swift_willThrow();
    swift_unknownObjectRelease();
    goto LABEL_10;
  }
  swift_unknownObjectRetain();
  objc_opt_self();
  v24 = (void (*)(uint64_t *, uint64_t, uint64_t))swift_dynamicCastObjCClassUnconditional();
  if ((v51 & 1) == 0)
  {
    v28 = objc_msgSend((id)objc_opt_self(), sel_cborWithInteger_, v45);
    objc_msgSend(v24, sel_setTag_, v28);

  }
  swift_release();
  swift_unknownObjectRelease();
  return v24;
}

uint64_t type metadata accessor for _CBOREncoder()
{
  return objc_opt_self();
}

uint64_t sub_20D865574(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t DynamicType;
  ValueMetadata *v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  char **v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v33[5];
  uint64_t v34;
  unint64_t v35;

  v3 = v1;
  v5 = sub_20D877BFC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  DynamicType = swift_getDynamicType();
  if (DynamicType == v5)
  {
    sub_20D85CE98((uint64_t)a1, (uint64_t)v33);
    __swift_instantiateConcreteTypeFromMangledName(qword_2549C92D8);
    swift_dynamicCast();
    v20 = *(unsigned __int8 *)(v3 + 41);
    v21 = (void *)sub_20D877BE4();
    v22 = (void *)objc_opt_self();
    v23 = &selRef_cborWithDateTime_;
    if (!v20)
      v23 = &selRef_cborWithFullDate_;
    v15 = (uint64_t)objc_msgSend(v22, *v23, v21);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    return v15;
  }
  v11 = (ValueMetadata *)DynamicType;
  if (DynamicType == MEMORY[0x24BDCDDE8] || DynamicType == sub_20D85BF60(0, &qword_2549C90D8))
  {
    sub_20D85CE98((uint64_t)a1, (uint64_t)v33);
    __swift_instantiateConcreteTypeFromMangledName(qword_2549C92D8);
    swift_dynamicCast();
    v17 = v34;
    v18 = v35;
    sub_20D85E18C(v34, v35);
    v19 = (void *)sub_20D877BCC();
    v15 = (uint64_t)objc_msgSend((id)objc_opt_self(), sel_cborWithData_, v19);
    sub_20D85D584(v17, v18);

    sub_20D85D584(v17, v18);
    return v15;
  }
  if (v11 == &type metadata for CBORCodableWrapper)
  {
    sub_20D85CE98((uint64_t)a1, (uint64_t)v33);
    __swift_instantiateConcreteTypeFromMangledName(qword_2549C92D8);
    swift_dynamicCast();
    return v34;
  }
  v12 = (uint64_t *)(v3 + 16);
  swift_beginAccess();
  v13 = *(_QWORD *)(v3 + 16);
  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    v14 = sub_20D877E9C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v33[3] = type metadata accessor for _CBOREncoder();
  v33[4] = sub_20D86CE78(&qword_2549C92D0, (uint64_t (*)(uint64_t))type metadata accessor for _CBOREncoder, (uint64_t)&unk_20D879C20);
  v33[0] = v3;
  swift_retain();
  sub_20D877C20();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
    v15 = *v12;
    if ((unint64_t)*v12 >> 62)
    {
      swift_bridgeObjectRetain();
      v29 = sub_20D877E9C();
      swift_bridgeObjectRelease();
      if (v14 >= v29)
        goto LABEL_14;
    }
    else if (v14 >= *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_14:
      swift_willThrow();
      return v15;
    }
    swift_beginAccess();
    if ((unint64_t)*v12 >> 62)
    {
      swift_bridgeObjectRetain();
      v3 = sub_20D877E9C();
      swift_bridgeObjectRelease();
      if (v3)
      {
LABEL_12:
        result = sub_20D86CB00();
        if (result)
        {
          v15 = result;
          swift_endAccess();
          swift_unknownObjectRelease();
          goto LABEL_14;
        }
        goto LABEL_42;
      }
    }
    else
    {
      v3 = *(_QWORD *)((*v12 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v3)
        goto LABEL_12;
    }
    __break(1u);
LABEL_40:
    swift_bridgeObjectRetain();
    v31 = sub_20D877E9C();
    result = swift_bridgeObjectRelease();
    if (!v31)
      goto LABEL_41;
    goto LABEL_25;
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
  if (!((unint64_t)*v12 >> 62))
  {
    if (v14 < *(_QWORD *)((*v12 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_23;
    return 0;
  }
  swift_bridgeObjectRetain();
  v30 = sub_20D877E9C();
  swift_bridgeObjectRelease();
  if (v14 >= v30)
    return 0;
LABEL_23:
  result = swift_beginAccess();
  if ((unint64_t)*v12 >> 62)
    goto LABEL_40;
  if (!*(_QWORD *)((*v12 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
LABEL_25:
  result = sub_20D86CB00();
  if (result)
  {
    v15 = result;
    swift_endAccess();
    type metadata accessor for _CBORDictionary();
    swift_unknownObjectRetain();
    if (swift_dynamicCastClass())
    {
      if (*(_BYTE *)(v3 + 40))
      {
        swift_beginAccess();
        v24 = swift_bridgeObjectRetain();
        sub_20D866B00(v24);
        swift_bridgeObjectRelease();
        sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
        sub_20D85BEFC();
        v25 = (void *)sub_20D877C08();
        swift_bridgeObjectRelease();
        v26 = objc_msgSend((id)objc_opt_self(), sel_cborWithDictionary_, v25);
        swift_unknownObjectRelease_n();
      }
      else
      {
        swift_beginAccess();
        v27 = swift_bridgeObjectRetain();
        sub_20D866B00(v27);
        swift_bridgeObjectRelease();
        swift_beginAccess();
        sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
        sub_20D85BEFC();
        swift_bridgeObjectRetain();
        v28 = (void *)sub_20D877C08();
        swift_bridgeObjectRelease();
        v25 = (void *)sub_20D877CEC();
        swift_bridgeObjectRelease();
        v26 = objc_msgSend((id)objc_opt_self(), sel_cborWithDictionary_keyOrderList_, v28, v25);
        swift_unknownObjectRelease_n();

      }
    }
    else
    {
      v33[0] = v15;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549C90A0);
      if (!swift_dynamicCast())
        return v15;
      sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
      v25 = (void *)sub_20D877CEC();
      swift_bridgeObjectRelease();
      v26 = objc_msgSend((id)objc_opt_self(), sel_cborWithArray_, v25);
      swift_unknownObjectRelease();
    }

    return (uint64_t)v26;
  }
LABEL_43:
  __break(1u);
  return result;
}

BOOL static CBOREncoder.DictionaryEncodingStrategy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CBOREncoder.DictionaryEncodingStrategy.hash(into:)()
{
  return sub_20D878250();
}

uint64_t CBOREncoder.DictionaryEncodingStrategy.hashValue.getter()
{
  sub_20D878244();
  sub_20D878250();
  return sub_20D878268();
}

BOOL sub_20D865D2C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_20D865D40@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *a1 = *(_BYTE *)(v1 + 24);
  return result;
}

uint64_t sub_20D865D80(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = swift_beginAccess();
  *(_BYTE *)(v1 + 24) = v2;
  return result;
}

uint64_t (*sub_20D865DBC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

BOOL static CBOREncoder.DateEncodingStrategy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CBOREncoder.DateEncodingStrategy.hash(into:)()
{
  return sub_20D878250();
}

uint64_t CBOREncoder.DateEncodingStrategy.hashValue.getter()
{
  sub_20D878244();
  sub_20D878250();
  return sub_20D878268();
}

uint64_t sub_20D865E7C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *a1 = *(_BYTE *)(v1 + 25);
  return result;
}

uint64_t sub_20D865EBC(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = swift_beginAccess();
  *(_BYTE *)(v1 + 25) = v2;
  return result;
}

uint64_t (*sub_20D865EF8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t CBOREncoder.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CBOREncoder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

unint64_t sub_20D865F78()
{
  unint64_t result;

  result = qword_2549C9298;
  if (!qword_2549C9298)
  {
    result = MEMORY[0x212BAA8AC](&protocol conformance descriptor for CBOREncoder.DictionaryEncodingStrategy, &type metadata for CBOREncoder.DictionaryEncodingStrategy);
    atomic_store(result, (unint64_t *)&qword_2549C9298);
  }
  return result;
}

unint64_t sub_20D865FC0()
{
  unint64_t result;

  result = qword_2549C92A0;
  if (!qword_2549C92A0)
  {
    result = MEMORY[0x212BAA8AC](&protocol conformance descriptor for CBOREncoder.DateEncodingStrategy, &type metadata for CBOREncoder.DateEncodingStrategy);
    atomic_store(result, (unint64_t *)&qword_2549C92A0);
  }
  return result;
}

uint64_t sub_20D866004@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = (*(uint64_t (**)(void))(**(_QWORD **)v1 + 152))();
  if (!v2)
  {
    *a1 = result;
    a1[1] = v5;
  }
  return result;
}

uint64_t sub_20D866038@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 104))();
  *a2 = result;
  return result;
}

uint64_t sub_20D866068(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 112);
  v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

_QWORD *sub_20D866098@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  _QWORD *result;
  uint64_t v4;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr))(**(_QWORD **)a1 + 176))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_20D8660D8(char *a1, uint64_t *a2)
{
  uint64_t v2;
  char v4;

  v2 = *a2;
  v4 = *a1;
  return (*(uint64_t (**)(char *))(*(_QWORD *)v2 + 184))(&v4);
}

_QWORD *sub_20D866114@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  _QWORD *result;
  uint64_t v4;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr))(**(_QWORD **)a1 + 200))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_20D866154(char *a1, uint64_t *a2)
{
  uint64_t v2;
  char v4;

  v2 = *a2;
  v4 = *a1;
  return (*(uint64_t (**)(char *))(*(_QWORD *)v2 + 208))(&v4);
}

uint64_t type metadata accessor for _CBORDictionary()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for CBOREncoder()
{
  return objc_opt_self();
}

uint64_t method lookup function for CBOREncoder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CBOREncoder.userInfo.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of CBOREncoder.userInfo.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of CBOREncoder.userInfo.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of CBOREncoder.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of CBOREncoder.__allocating_init(userInfo:dictionaryEncodingStrategy:dateEncodingStrategy:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of CBOREncoder.encode<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of CBOREncoder.encode<A>(_:tag:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of CBOREncoder.encodeToCBOR<A>(_:tag:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v3 + 168))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of CBOREncoder.dictionaryEncodingStrategy.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of CBOREncoder.dictionaryEncodingStrategy.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of CBOREncoder.dictionaryEncodingStrategy.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of CBOREncoder.dateEncodingStrategy.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of CBOREncoder.dateEncodingStrategy.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of CBOREncoder.dateEncodingStrategy.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t getEnumTagSinglePayload for CBOREncoder.DictionaryEncodingStrategy(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CBOREncoder.DictionaryEncodingStrategy(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20D86638C + 4 * byte_20D879915[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_20D8663C0 + 4 * byte_20D879910[v4]))();
}

uint64_t sub_20D8663C0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D8663C8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20D8663D0);
  return result;
}

uint64_t sub_20D8663DC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20D8663E4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_20D8663E8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D8663F0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_20D8663FC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CBOREncoder.DictionaryEncodingStrategy()
{
  return &type metadata for CBOREncoder.DictionaryEncodingStrategy;
}

uint64_t storeEnumTagSinglePayload for CBOREncoder.DateEncodingStrategy(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20D866460 + 4 * byte_20D87991F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20D866494 + 4 * byte_20D87991A[v4]))();
}

uint64_t sub_20D866494(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D86649C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20D8664A4);
  return result;
}

uint64_t sub_20D8664B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20D8664B8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20D8664BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D8664C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CBOREncoder.DateEncodingStrategy()
{
  return &type metadata for CBOREncoder.DateEncodingStrategy;
}

BOOL sub_20D8664E0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_20D877E9C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_beginAccess();
  return v2 == *(_QWORD *)(*(_QWORD *)(v0 + 24) + 16);
}

uint64_t sub_20D866580()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_20D8665B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v6 = v3 + 2;
  if (((*(uint64_t (**)(void))(*v3 + 184))() & 1) != 0)
  {
    swift_beginAccess();
    sub_20D866780();
    swift_endAccess();
LABEL_11:
    swift_beginAccess();
    v11 = type metadata accessor for _CBOREncoderKeyContainer(0, a2, a3, v10);
    swift_retain();
    swift_bridgeObjectRetain();
    MEMORY[0x212BAA8AC](&unk_20D879CE0, v11);
    return sub_20D877F14();
  }
  swift_beginAccess();
  v7 = *v6;
  if (!((unint64_t)*v6 >> 62))
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
      goto LABEL_5;
LABEL_13:
    v9 = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v8 = sub_20D877E9C();
  if (!v8)
    goto LABEL_13;
LABEL_5:
  v9 = v8 - 1;
  if (__OFSUB__(v8, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v7 & 0xC000000000000001) == 0)
  {
    if ((v9 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v9 < *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      swift_unknownObjectRetain();
      goto LABEL_10;
    }
    __break(1u);
    goto LABEL_18;
  }
LABEL_15:
  MEMORY[0x212BA9EBC](v9, v7);
LABEL_10:
  swift_bridgeObjectRelease();
  type metadata accessor for _CBORDictionary();
  if (swift_dynamicCastClass())
    goto LABEL_11;
LABEL_18:
  result = swift_unknownObjectRelease();
  __break(1u);
  return result;
}

id sub_20D866780()
{
  _QWORD *v0;
  objc_class *v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v1 = (objc_class *)type metadata accessor for _CBORDictionary();
  v2 = (char *)objc_allocWithZone(v1);
  v3 = OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content;
  v4 = v2;
  v5 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v2[v3] = sub_20D851CCC(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)&v4[OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList] = v5;
  v4[OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder] = 1;

  v8.receiver = v4;
  v8.super_class = v1;
  v6 = objc_msgSendSuper2(&v8, sel_init);
  MEMORY[0x212BA9E14]();
  if (*(_QWORD *)((*v0 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v0 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_20D877D1C();
  sub_20D877D28();
  sub_20D877D10();
  return v6;
}

uint64_t sub_20D866868@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;

  v2 = v1;
  v4 = v1 + 2;
  if (((*(uint64_t (**)(void))(*v1 + 184))() & 1) != 0)
  {
    swift_beginAccess();
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), sel_init);
    MEMORY[0x212BA9E14]();
    if (*(_QWORD *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_20D877D1C();
    sub_20D877D28();
    sub_20D877D10();
    swift_endAccess();
    goto LABEL_13;
  }
  swift_beginAccess();
  v6 = *v4;
  if (!((unint64_t)*v4 >> 62))
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7)
      goto LABEL_7;
LABEL_15:
    v8 = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  v7 = sub_20D877E9C();
  if (!v7)
    goto LABEL_15;
LABEL_7:
  v8 = v7 - 1;
  if (__OFSUB__(v7, 1))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if ((v6 & 0xC000000000000001) == 0)
  {
    if ((v8 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v8 < *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      swift_unknownObjectRetain();
      goto LABEL_12;
    }
    __break(1u);
    goto LABEL_20;
  }
LABEL_17:
  MEMORY[0x212BA9EBC](v8, v6);
LABEL_12:
  swift_bridgeObjectRelease();
  objc_opt_self();
  v5 = (id)swift_dynamicCastObjCClass();
  if (v5)
  {
LABEL_13:
    swift_beginAccess();
    v9 = v2[3];
    a1[3] = &type metadata for _CBOREncoderUnkeyedContainer;
    a1[4] = sub_20D86CAB0();
    *a1 = v9;
    a1[1] = v5;
    a1[2] = v2;
    swift_retain();
    return swift_bridgeObjectRetain();
  }
LABEL_20:
  result = swift_unknownObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_20D866A6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D8665B4(a1, a2, a3);
}

uint64_t sub_20D866A8C@<X0>(_QWORD *a1@<X8>)
{
  return sub_20D866868(a1);
}

uint64_t sub_20D866AAC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[3] = type metadata accessor for _CBOREncoder();
  a1[4] = sub_20D86CE78(&qword_2549C92C0, (uint64_t (*)(uint64_t))type metadata accessor for _CBOREncoder, (uint64_t)&unk_20D879B68);
  *a1 = v3;
  return swift_retain();
}

uint64_t sub_20D866B00(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v1 = a1 & 0xFFFFFFFFFFFFFF8;
    if (a1 < 0)
      v1 = a1;
    v2 = ~(v1 >> 1) & 0x4000000000000000 | v1;
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
    sub_20D85BEFC();
    swift_bridgeObjectRetain();
    v3 = sub_20D877E54();
    return ~(v3 >> 1) & 0x4000000000000000 | v3;
  }
  return v2;
}

void sub_20D866BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  char v17;
  char v18;
  _QWORD *v19;
  id v20;
  id v21;
  id v22;
  _BYTE v23[24];

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v7 = &v23[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = *(_QWORD *)(v2 + 8);
  v9 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v10 = sub_20D86D038((uint64_t)v7, v9, v4);
  v11 = objc_msgSend((id)objc_opt_self(), sel_cborNil);
  if (*(_BYTE *)(v8
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    v12 = (uint64_t *)(v8 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    v13 = *v12;
    if ((v13 & 0xC000000000000001) != 0)
    {
      v14 = v10;
      swift_bridgeObjectRetain();
      v15 = sub_20D877E78();

      swift_bridgeObjectRelease();
      if (v15)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(_QWORD *)(v13 + 16))
    {
      v16 = v10;
      swift_bridgeObjectRetain();
      sub_20D86E68C((uint64_t)v16);
      v18 = v17;

      swift_bridgeObjectRelease();
      if ((v18 & 1) != 0)
        goto LABEL_10;
    }
    v19 = (_QWORD *)(v8 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    v20 = v10;
    MEMORY[0x212BA9E14]();
    if (*(_QWORD *)((*v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_20D877D1C();
    sub_20D877D28();
    sub_20D877D10();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  v21 = v10;
  v22 = v11;
  sub_20D86CBC8((uint64_t)v22, v21);
  swift_endAccess();

}

void sub_20D866E10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  char **v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  char v21;
  char v22;
  _QWORD *v23;
  id v24;
  id v25;
  id v26;
  _BYTE v27[24];

  v5 = a1;
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v9 = &v27[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *(_QWORD *)(v3 + 8);
  v11 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  v12 = sub_20D86D038((uint64_t)v9, v11, v6);
  v13 = (void *)objc_opt_self();
  v14 = &selRef_cborTrue;
  if ((v5 & 1) == 0)
    v14 = &selRef_cborFalse;
  v15 = objc_msgSend(v13, *v14);
  if (*(_BYTE *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    v16 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    v17 = *v16;
    if ((v17 & 0xC000000000000001) != 0)
    {
      v18 = v12;
      swift_bridgeObjectRetain();
      v19 = sub_20D877E78();

      swift_bridgeObjectRelease();
      if (v19)
      {
        swift_unknownObjectRelease();
        goto LABEL_12;
      }
    }
    else if (*(_QWORD *)(v17 + 16))
    {
      v20 = v12;
      swift_bridgeObjectRetain();
      sub_20D86E68C((uint64_t)v20);
      v22 = v21;

      swift_bridgeObjectRelease();
      if ((v22 & 1) != 0)
        goto LABEL_12;
    }
    v23 = (_QWORD *)(v10
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    v24 = v12;
    MEMORY[0x212BA9E14]();
    if (*(_QWORD *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_20D877D1C();
    sub_20D877D28();
    sub_20D877D10();
    swift_endAccess();
  }
LABEL_12:
  swift_beginAccess();
  v25 = v12;
  v26 = v15;
  sub_20D86CBC8((uint64_t)v26, v25);
  swift_endAccess();

}

void sub_20D867094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(_BYTE *, uint64_t, uint64_t);
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  char v22;
  char v23;
  _QWORD *v24;
  id v25;
  id v26;
  id v27;
  _BYTE v28[24];

  v6 = *(_QWORD *)(a4 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v9 = &v28[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *(_QWORD *)(v4 + 8);
  v11 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  v12 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16);
  v13 = v10;
  v12(v9, a3, v6);
  v14 = sub_20D86D038((uint64_t)v9, v11, v6);
  swift_bridgeObjectRetain();
  v15 = (void *)sub_20D877C44();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend((id)objc_opt_self(), sel_cborWithUTF8String_, v15);

  if (*(_BYTE *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    v17 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    v18 = *v17;
    if ((v18 & 0xC000000000000001) != 0)
    {
      v19 = v14;
      swift_bridgeObjectRetain();
      v20 = sub_20D877E78();

      swift_bridgeObjectRelease();
      if (v20)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(_QWORD *)(v18 + 16))
    {
      v21 = v14;
      swift_bridgeObjectRetain();
      sub_20D86E68C((uint64_t)v21);
      v23 = v22;

      swift_bridgeObjectRelease();
      if ((v23 & 1) != 0)
        goto LABEL_10;
    }
    v24 = (_QWORD *)(v13
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    v25 = v14;
    MEMORY[0x212BA9E14]();
    if (*(_QWORD *)((*v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v24 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_20D877D1C();
    sub_20D877D28();
    sub_20D877D10();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  v26 = v14;
  v27 = v16;
  sub_20D86CBC8((uint64_t)v27, v26);
  swift_endAccess();

}

void sub_20D867338(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  char v19;
  char v20;
  _QWORD *v21;
  id v22;
  id v23;
  id v24;
  _BYTE v25[24];

  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *(_QWORD *)(v3 + 8);
  v11 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v12 = sub_20D86D038((uint64_t)v9, v11, v6);
  v13 = objc_msgSend((id)objc_opt_self(), sel_cborWithDouble_, a3);
  if (*(_BYTE *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    v14 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    v15 = *v14;
    if ((v15 & 0xC000000000000001) != 0)
    {
      v16 = v12;
      swift_bridgeObjectRetain();
      v17 = sub_20D877E78();

      swift_bridgeObjectRelease();
      if (v17)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(_QWORD *)(v15 + 16))
    {
      v18 = v12;
      swift_bridgeObjectRetain();
      sub_20D86E68C((uint64_t)v18);
      v20 = v19;

      swift_bridgeObjectRelease();
      if ((v20 & 1) != 0)
        goto LABEL_10;
    }
    v21 = (_QWORD *)(v10
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    v22 = v12;
    MEMORY[0x212BA9E14]();
    if (*(_QWORD *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_20D877D1C();
    sub_20D877D28();
    sub_20D877D10();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  v23 = v12;
  v24 = v13;
  sub_20D86CBC8((uint64_t)v24, v23);
  swift_endAccess();

}

void sub_20D8675B4(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  double v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  char v21;
  char v22;
  _QWORD *v23;
  id v24;
  id v25;
  id v26;
  _BYTE v27[24];

  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v9 = &v27[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *(_QWORD *)(v3 + 8);
  v11 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v12 = sub_20D86D038((uint64_t)v9, v11, v6);
  v13 = (void *)objc_opt_self();
  *(float *)&v14 = a3;
  v15 = objc_msgSend(v13, sel_cborWithFloat_, v14);
  if (*(_BYTE *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    v16 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    v17 = *v16;
    if ((v17 & 0xC000000000000001) != 0)
    {
      v18 = v12;
      swift_bridgeObjectRetain();
      v19 = sub_20D877E78();

      swift_bridgeObjectRelease();
      if (v19)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(_QWORD *)(v17 + 16))
    {
      v20 = v12;
      swift_bridgeObjectRetain();
      sub_20D86E68C((uint64_t)v20);
      v22 = v21;

      swift_bridgeObjectRelease();
      if ((v22 & 1) != 0)
        goto LABEL_10;
    }
    v23 = (_QWORD *)(v10
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    v24 = v12;
    MEMORY[0x212BA9E14]();
    if (*(_QWORD *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_20D877D1C();
    sub_20D877D28();
    sub_20D877D10();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  v25 = v12;
  v26 = v15;
  sub_20D86CBC8((uint64_t)v26, v25);
  swift_endAccess();

}

void sub_20D867830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  char v19;
  char v20;
  _QWORD *v21;
  id v22;
  id v23;
  id v24;
  _BYTE v25[24];

  v5 = a1;
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *(_QWORD *)(v3 + 8);
  v11 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  v12 = sub_20D86D038((uint64_t)v9, v11, v6);
  v13 = objc_msgSend((id)objc_opt_self(), sel_cborWithInteger_, v5);
  if (*(_BYTE *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    v14 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    v15 = *v14;
    if ((v15 & 0xC000000000000001) != 0)
    {
      v16 = v12;
      swift_bridgeObjectRetain();
      v17 = sub_20D877E78();

      swift_bridgeObjectRelease();
      if (v17)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(_QWORD *)(v15 + 16))
    {
      v18 = v12;
      swift_bridgeObjectRetain();
      sub_20D86E68C((uint64_t)v18);
      v20 = v19;

      swift_bridgeObjectRelease();
      if ((v20 & 1) != 0)
        goto LABEL_10;
    }
    v21 = (_QWORD *)(v10
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    v22 = v12;
    MEMORY[0x212BA9E14]();
    if (*(_QWORD *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_20D877D1C();
    sub_20D877D28();
    sub_20D877D10();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  v23 = v12;
  v24 = v13;
  sub_20D86CBC8((uint64_t)v24, v23);
  swift_endAccess();

}

void sub_20D867AA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  char v19;
  char v20;
  _QWORD *v21;
  id v22;
  id v23;
  id v24;
  _BYTE v25[24];

  v5 = a1;
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *(_QWORD *)(v3 + 8);
  v11 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  v12 = sub_20D86D038((uint64_t)v9, v11, v6);
  v13 = objc_msgSend((id)objc_opt_self(), sel_cborWithInteger_, v5);
  if (*(_BYTE *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    v14 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    v15 = *v14;
    if ((v15 & 0xC000000000000001) != 0)
    {
      v16 = v12;
      swift_bridgeObjectRetain();
      v17 = sub_20D877E78();

      swift_bridgeObjectRelease();
      if (v17)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(_QWORD *)(v15 + 16))
    {
      v18 = v12;
      swift_bridgeObjectRetain();
      sub_20D86E68C((uint64_t)v18);
      v20 = v19;

      swift_bridgeObjectRelease();
      if ((v20 & 1) != 0)
        goto LABEL_10;
    }
    v21 = (_QWORD *)(v10
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    v22 = v12;
    MEMORY[0x212BA9E14]();
    if (*(_QWORD *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_20D877D1C();
    sub_20D877D28();
    sub_20D877D10();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  v23 = v12;
  v24 = v13;
  sub_20D86CBC8((uint64_t)v24, v23);
  swift_endAccess();

}

void sub_20D867D20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  char v19;
  char v20;
  _QWORD *v21;
  id v22;
  id v23;
  id v24;
  _BYTE v25[24];

  v5 = a1;
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *(_QWORD *)(v3 + 8);
  v11 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  v12 = sub_20D86D038((uint64_t)v9, v11, v6);
  v13 = objc_msgSend((id)objc_opt_self(), sel_cborWithInteger_, v5);
  if (*(_BYTE *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    v14 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    v15 = *v14;
    if ((v15 & 0xC000000000000001) != 0)
    {
      v16 = v12;
      swift_bridgeObjectRetain();
      v17 = sub_20D877E78();

      swift_bridgeObjectRelease();
      if (v17)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(_QWORD *)(v15 + 16))
    {
      v18 = v12;
      swift_bridgeObjectRetain();
      sub_20D86E68C((uint64_t)v18);
      v20 = v19;

      swift_bridgeObjectRelease();
      if ((v20 & 1) != 0)
        goto LABEL_10;
    }
    v21 = (_QWORD *)(v10
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    v22 = v12;
    MEMORY[0x212BA9E14]();
    if (*(_QWORD *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_20D877D1C();
    sub_20D877D28();
    sub_20D877D10();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  v23 = v12;
  v24 = v13;
  sub_20D86CBC8((uint64_t)v24, v23);
  swift_endAccess();

}

void sub_20D867F98(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  char v22;
  char v23;
  _QWORD *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  SEL *v29;

  v29 = a4;
  v7 = *(_QWORD *)(a3 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(v4 + 8);
  v12 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v14 = v11;
  v13(v10, a2, v7);
  v15 = sub_20D86D038((uint64_t)v10, v12, v7);
  v16 = objc_msgSend((id)objc_opt_self(), *v29, a1);
  if (*(_BYTE *)(v14
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    v17 = (uint64_t *)(v14 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    v18 = *v17;
    if ((v18 & 0xC000000000000001) != 0)
    {
      v19 = v15;
      swift_bridgeObjectRetain();
      v20 = sub_20D877E78();

      swift_bridgeObjectRelease();
      if (v20)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(_QWORD *)(v18 + 16))
    {
      v21 = v15;
      swift_bridgeObjectRetain();
      sub_20D86E68C((uint64_t)v21);
      v23 = v22;

      swift_bridgeObjectRelease();
      if ((v23 & 1) != 0)
        goto LABEL_10;
    }
    v24 = (_QWORD *)(v14
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    v25 = v15;
    MEMORY[0x212BA9E14]();
    if (*(_QWORD *)((*v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v24 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_20D877D1C();
    sub_20D877D28();
    sub_20D877D10();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  v26 = v15;
  v27 = v16;
  sub_20D86CBC8((uint64_t)v27, v26);
  swift_endAccess();

}

void sub_20D868214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  char v19;
  char v20;
  _QWORD *v21;
  id v22;
  id v23;
  id v24;
  _BYTE v25[24];

  v5 = a1;
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *(_QWORD *)(v3 + 8);
  v11 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  v12 = sub_20D86D038((uint64_t)v9, v11, v6);
  v13 = objc_msgSend((id)objc_opt_self(), sel_cborWithUnsignedInteger_, v5);
  if (*(_BYTE *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    v14 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    v15 = *v14;
    if ((v15 & 0xC000000000000001) != 0)
    {
      v16 = v12;
      swift_bridgeObjectRetain();
      v17 = sub_20D877E78();

      swift_bridgeObjectRelease();
      if (v17)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(_QWORD *)(v15 + 16))
    {
      v18 = v12;
      swift_bridgeObjectRetain();
      sub_20D86E68C((uint64_t)v18);
      v20 = v19;

      swift_bridgeObjectRelease();
      if ((v20 & 1) != 0)
        goto LABEL_10;
    }
    v21 = (_QWORD *)(v10
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    v22 = v12;
    MEMORY[0x212BA9E14]();
    if (*(_QWORD *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_20D877D1C();
    sub_20D877D28();
    sub_20D877D10();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  v23 = v12;
  v24 = v13;
  sub_20D86CBC8((uint64_t)v24, v23);
  swift_endAccess();

}

void sub_20D86848C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unsigned __int16 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  char v19;
  char v20;
  _QWORD *v21;
  id v22;
  id v23;
  id v24;
  _BYTE v25[24];

  v5 = a1;
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *(_QWORD *)(v3 + 8);
  v11 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  v12 = sub_20D86D038((uint64_t)v9, v11, v6);
  v13 = objc_msgSend((id)objc_opt_self(), sel_cborWithUnsignedInteger_, v5);
  if (*(_BYTE *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    v14 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    v15 = *v14;
    if ((v15 & 0xC000000000000001) != 0)
    {
      v16 = v12;
      swift_bridgeObjectRetain();
      v17 = sub_20D877E78();

      swift_bridgeObjectRelease();
      if (v17)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(_QWORD *)(v15 + 16))
    {
      v18 = v12;
      swift_bridgeObjectRetain();
      sub_20D86E68C((uint64_t)v18);
      v20 = v19;

      swift_bridgeObjectRelease();
      if ((v20 & 1) != 0)
        goto LABEL_10;
    }
    v21 = (_QWORD *)(v10
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    v22 = v12;
    MEMORY[0x212BA9E14]();
    if (*(_QWORD *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_20D877D1C();
    sub_20D877D28();
    sub_20D877D10();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  v23 = v12;
  v24 = v13;
  sub_20D86CBC8((uint64_t)v24, v23);
  swift_endAccess();

}

void sub_20D868704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  char v19;
  char v20;
  _QWORD *v21;
  id v22;
  id v23;
  id v24;
  _BYTE v25[24];

  v5 = a1;
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *(_QWORD *)(v3 + 8);
  v11 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  v12 = sub_20D86D038((uint64_t)v9, v11, v6);
  v13 = objc_msgSend((id)objc_opt_self(), sel_cborWithUnsignedInteger_, v5);
  if (*(_BYTE *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    v14 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    v15 = *v14;
    if ((v15 & 0xC000000000000001) != 0)
    {
      v16 = v12;
      swift_bridgeObjectRetain();
      v17 = sub_20D877E78();

      swift_bridgeObjectRelease();
      if (v17)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(_QWORD *)(v15 + 16))
    {
      v18 = v12;
      swift_bridgeObjectRetain();
      sub_20D86E68C((uint64_t)v18);
      v20 = v19;

      swift_bridgeObjectRelease();
      if ((v20 & 1) != 0)
        goto LABEL_10;
    }
    v21 = (_QWORD *)(v10
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    v22 = v12;
    MEMORY[0x212BA9E14]();
    if (*(_QWORD *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_20D877D1C();
    sub_20D877D28();
    sub_20D877D10();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  v23 = v12;
  v24 = v13;
  sub_20D86CBC8((uint64_t)v24, v23);
  swift_endAccess();

}

uint64_t sub_20D86897C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *);
  uint64_t v17;
  uint64_t *v18;
  _QWORD *v19;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t v29;
  uint64_t v30;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  char v38;
  char v39;
  _QWORD *v40;
  id v41;
  id v42;
  uint64_t v43;
  _QWORD v44[2];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48[5];
  uint64_t v49;

  v45 = a5;
  v49 = a4;
  v46 = a1;
  v7 = *(_QWORD *)(a3 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](a1, a2);
  v11 = (char *)v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9, v12);
  v14 = (char *)v44 - v13;
  v47 = v5;
  v15 = *(_QWORD *)(v5 + 16);
  v16 = *(void (**)(char *))(v8 + 16);
  v44[0] = v17;
  v16((char *)v44 - v13);
  v18 = (uint64_t *)(v15 + 24);
  swift_beginAccess();
  v19 = *(_QWORD **)(v15 + 24);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v15 + 24) = v19;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v19 = sub_20D8635F8(0, v19[2] + 1, 1, v19);
    *v18 = (uint64_t)v19;
  }
  v22 = v19[2];
  v21 = v19[3];
  if (v22 >= v21 >> 1)
    *v18 = (uint64_t)sub_20D8635F8((_QWORD *)(v21 > 1), v22 + 1, 1, v19);
  ((void (*)(char *, char *, uint64_t))v16)(v11, v14, v7);
  sub_20D86D14C(v22, (uint64_t)v11, v18, v7, *(_QWORD *)(a3 + 24));
  (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v7);
  v23 = v47;
  v24 = *(_QWORD *)(v47 + 8);
  v25 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  ((void (*)(char *, _QWORD, uint64_t))v16)(v11, v44[0], v7);
  v26 = sub_20D86D038((uint64_t)v11, v25, v7);
  v27 = v49;
  v48[3] = v49;
  v48[4] = v45;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v48);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(boxed_opaque_existential_1Tm, v46, v27);
  v29 = v44[1];
  v30 = sub_20D865574(v48);
  if (v29)
  {

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v48);
    return sub_20D868D9C(v23);
  }
  v46 = v24;
  if (!v30)
    v32 = objc_msgSend((id)objc_opt_self(), sel_cborNil);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v48);
  if (*(_BYTE *)(v46
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    v33 = v46 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content;
    swift_beginAccess();
    if ((*(_QWORD *)v33 & 0xC000000000000001) != 0)
    {
      v34 = v26;
      swift_bridgeObjectRetain();
      v35 = sub_20D877E78();

      swift_bridgeObjectRelease();
      v36 = v46;
      if (v35)
      {
        swift_unknownObjectRelease();
        goto LABEL_18;
      }
    }
    else
    {
      v36 = v46;
      if (*(_QWORD *)(*(_QWORD *)v33 + 16))
      {
        v37 = v26;
        swift_bridgeObjectRetain();
        sub_20D86E68C((uint64_t)v37);
        v39 = v38;

        swift_bridgeObjectRelease();
        v36 = v46;
        if ((v39 & 1) != 0)
          goto LABEL_18;
      }
    }
    v40 = (_QWORD *)(v36
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    v41 = v26;
    MEMORY[0x212BA9E14]();
    if (*(_QWORD *)((*v40 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v40 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_20D877D1C();
    sub_20D877D28();
    sub_20D877D10();
    swift_endAccess();
  }
LABEL_18:
  swift_beginAccess();
  v42 = v26;
  v43 = swift_unknownObjectRetain();
  sub_20D86CBC8(v43, v42);
  swift_endAccess();
  swift_unknownObjectRelease();

  return sub_20D868D9C(v47);
}

uint64_t sub_20D868D9C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 16);
  swift_beginAccess();
  v2 = *(_QWORD **)(v1 + 24);
  if (!v2[2])
  {
    __break(1u);
LABEL_6:
    result = (uint64_t)sub_20D86CDFC(v2);
    v2 = (_QWORD *)result;
    v4 = *(_QWORD *)(result + 16);
    if (v4)
      goto LABEL_4;
    goto LABEL_7;
  }
  swift_retain();
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
    goto LABEL_6;
  v4 = v2[2];
  if (v4)
  {
LABEL_4:
    v5 = v4 - 1;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v2[5 * v4 - 1]);
    v2[2] = v5;
    *(_QWORD *)(v1 + 24) = v2;
    swift_endAccess();
    return swift_release();
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_20D868E4C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  id v26;
  uint64_t v27;
  id v28;
  unint64_t v29;
  char v30;
  id v31;
  uint64_t v32;
  BOOL v33;
  objc_class *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  char v50;
  char v51;
  id v52;
  _QWORD *v53;
  id v54;
  id v55;
  _QWORD *v56;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(char *, uint64_t, uint64_t);
  char *v72;
  id v73;
  id v74;
  objc_super v75;
  __int128 v76;
  uint64_t ObjectType;
  __int128 v78;
  uint64_t v79;

  v7 = v6;
  v13 = *(_QWORD *)(a3 + 16);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](a1, a2);
  v72 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15, v17);
  v19 = (char *)&v65 - v18;
  v20 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  v69 = a2;
  v70 = v14;
  v71 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v71(v19, a2, v13);
  v21 = *(_QWORD *)(a3 + 24);
  v22 = sub_20D86D038((uint64_t)v19, v20, v13);
  v23 = (uint64_t *)(v7[1] + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
  swift_beginAccess();
  v24 = *v23;
  v25 = (*v23 & 0xC000000000000001) == 0;
  v73 = v22;
  if (v25)
  {
    if (!*(_QWORD *)(v24 + 16))
      goto LABEL_10;
    v28 = v73;
    swift_bridgeObjectRetain();
    v29 = sub_20D86E68C((uint64_t)v28);
    if ((v30 & 1) == 0)
    {

      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
    v27 = *(_QWORD *)(*(_QWORD *)(v24 + 56) + 8 * v29);
    swift_unknownObjectRetain();

    swift_bridgeObjectRelease();
  }
  else
  {
    v26 = v22;
    swift_bridgeObjectRetain();
    v27 = sub_20D877E78();

    swift_bridgeObjectRelease();
    if (!v27)
    {
LABEL_10:
      v66 = v21;
      v67 = a6;
      v68 = a5;
      v32 = a4;
      v33 = *(_BYTE *)(v7[2] + 40) == 0;
      v34 = (objc_class *)type metadata accessor for _CBORDictionary();
      v35 = (char *)objc_allocWithZone(v34);
      v36 = OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content;
      v37 = v35;
      v38 = MEMORY[0x24BEE4AF8];
      *(_QWORD *)&v35[v36] = sub_20D851CCC(MEMORY[0x24BEE4AF8]);
      *(_QWORD *)&v37[OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList] = v38;
      v37[OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder] = v33;

      v75.receiver = v37;
      v75.super_class = v34;
      v39 = objc_msgSendSuper2(&v75, sel_init);
      v40 = v39;
      v41 = v7[1];
      if (*(_BYTE *)(v41
                    + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
      {
        v42 = (uint64_t *)(v41
                        + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
        swift_beginAccess();
        v43 = *v42;
        a4 = v32;
        if ((v43 & 0xC000000000000001) != 0)
        {
          v44 = v73;
          v45 = v40;
          swift_bridgeObjectRetain();
          v46 = sub_20D877E78();

          swift_bridgeObjectRelease();
          if (v46)
          {
            swift_unknownObjectRelease();
LABEL_22:
            swift_beginAccess();
            v55 = v73;
            v31 = v40;
            sub_20D86CBC8((uint64_t)v31, v55);
            swift_endAccess();

            a5 = v68;
            v21 = v66;
            goto LABEL_23;
          }
        }
        else if (*(_QWORD *)(v43 + 16))
        {
          v48 = v73;
          v49 = v40;
          swift_bridgeObjectRetain();
          sub_20D86E68C((uint64_t)v48);
          v51 = v50;

          swift_bridgeObjectRelease();
          if ((v51 & 1) != 0)
            goto LABEL_22;
        }
        else
        {
          v52 = v40;
        }
        v53 = (_QWORD *)(v41
                       + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
        swift_beginAccess();
        v54 = v73;
        MEMORY[0x212BA9E14]();
        if (*(_QWORD *)((*v53 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v53 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_20D877D1C();
        sub_20D877D28();
        sub_20D877D10();
        swift_endAccess();
        goto LABEL_22;
      }
      v47 = v39;
      a4 = v32;
      goto LABEL_22;
    }
  }
  ObjectType = swift_getObjectType();
  *(_QWORD *)&v76 = v27;
  sub_20D85C0C4(&v76, &v78);
  sub_20D864AF0((uint64_t)&v78, (uint64_t)&v76);
  type metadata accessor for _CBORDictionary();
  if (!swift_dynamicCast())
  {
    __break(1u);
    return;
  }

  sub_20D85C0C4(&v78, &v76);
  swift_dynamicCast();
  v31 = v74;
LABEL_23:
  v71(v72, v69, v13);
  v56 = (_QWORD *)*v7;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = (uint64_t)v56;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v56 = sub_20D8635F8(0, v56[2] + 1, 1, v56);
    *v7 = (uint64_t)v56;
  }
  v59 = v56[2];
  v58 = v56[3];
  if (v59 >= v58 >> 1)
    *v7 = (uint64_t)sub_20D8635F8((_QWORD *)(v58 > 1), v59 + 1, 1, v56);
  v60 = v72;
  v71(v19, (uint64_t)v72, v13);
  sub_20D86D14C(v59, (uint64_t)v19, v7, v13, v21);
  (*(void (**)(char *, uint64_t))(v70 + 8))(v60, v13);
  v61 = v7[2];
  *(_QWORD *)&v78 = *v7;
  *((_QWORD *)&v78 + 1) = v31;
  v79 = v61;
  v63 = type metadata accessor for _CBOREncoderKeyContainer(0, a4, a5, v62);
  swift_retain();
  swift_bridgeObjectRetain();
  v64 = v31;
  MEMORY[0x212BAA8AC](&unk_20D879CE0, v63);
  sub_20D877F14();
  sub_20D869428(v7);

}

uint64_t sub_20D869428(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)*a1;
  if (!*(_QWORD *)(*a1 + 16))
  {
    __break(1u);
LABEL_6:
    result = (uint64_t)sub_20D86CDFC(v2);
    v2 = (_QWORD *)result;
    v4 = *(_QWORD *)(result + 16);
    if (v4)
      goto LABEL_4;
    goto LABEL_7;
  }
  v1 = a1;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
    goto LABEL_6;
  v4 = v2[2];
  if (v4)
  {
LABEL_4:
    v5 = v4 - 1;
    result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v2[5 * v4 - 1]);
    v2[2] = v5;
    *v1 = v2;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_20D8694A4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  id v18;
  uint64_t *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  unint64_t v24;
  char v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  int v30;
  uint64_t *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  char v40;
  char v41;
  id v42;
  _QWORD *v43;
  id v44;
  id v45;
  _QWORD *v46;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void (*v53)(char *, uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  __int128 v59;
  uint64_t ObjectType;
  _OWORD v61[2];

  v4 = v3;
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1, a2);
  v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v13);
  v15 = (char *)&v52 - v14;
  v16 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  v56 = v9;
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v54 = a1;
  v17(v15, a1, v8);
  v55 = *(_QWORD *)(a2 + 24);
  v18 = sub_20D86D038((uint64_t)v15, v16, v8);
  v19 = (uint64_t *)(v4[1] + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
  swift_beginAccess();
  v20 = *v19;
  v57 = v18;
  if ((v20 & 0xC000000000000001) != 0)
  {
    v21 = v18;
    swift_bridgeObjectRetain();
    v22 = sub_20D877E78();

    swift_bridgeObjectRelease();
    if (!v22)
    {
LABEL_10:
      v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), sel_init);
      v28 = v27;
      v29 = v4[1];
      v30 = *(unsigned __int8 *)(v29
                               + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder);
      v53 = v17;
      if (v30 == 1)
      {
        v31 = (uint64_t *)(v29
                        + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
        swift_beginAccess();
        v32 = *v31;
        v33 = v57;
        if ((v32 & 0xC000000000000001) != 0)
        {
          v34 = v57;
          v35 = v28;
          swift_bridgeObjectRetain();
          v36 = sub_20D877E78();

          v33 = v57;
          swift_bridgeObjectRelease();
          if (v36)
          {
            swift_unknownObjectRelease();
LABEL_22:
            swift_beginAccess();
            v45 = v33;
            v26 = v28;
            sub_20D86CBC8((uint64_t)v26, v45);
            swift_endAccess();

            v17 = v53;
            goto LABEL_23;
          }
        }
        else if (*(_QWORD *)(v32 + 16))
        {
          v38 = v57;
          v39 = v28;
          swift_bridgeObjectRetain();
          sub_20D86E68C((uint64_t)v38);
          v41 = v40;

          v33 = v57;
          swift_bridgeObjectRelease();
          if ((v41 & 1) != 0)
            goto LABEL_22;
        }
        else
        {
          v42 = v28;
        }
        v52 = v28;
        v43 = (_QWORD *)(v29
                       + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
        swift_beginAccess();
        v44 = v33;
        MEMORY[0x212BA9E14]();
        if (*(_QWORD *)((*v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_20D877D1C();
        sub_20D877D28();
        sub_20D877D10();
        swift_endAccess();
        v28 = v52;
        goto LABEL_22;
      }
      v37 = v27;
      v33 = v57;
      goto LABEL_22;
    }
  }
  else
  {
    if (!*(_QWORD *)(v20 + 16))
      goto LABEL_10;
    v23 = v57;
    swift_bridgeObjectRetain();
    v24 = sub_20D86E68C((uint64_t)v23);
    if ((v25 & 1) == 0)
    {

      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
    v22 = *(_QWORD *)(*(_QWORD *)(v20 + 56) + 8 * v24);
    swift_unknownObjectRetain();

    swift_bridgeObjectRelease();
  }
  ObjectType = swift_getObjectType();
  *(_QWORD *)&v59 = v22;
  sub_20D85C0C4(&v59, v61);
  sub_20D864AF0((uint64_t)v61, (uint64_t)&v59);
  sub_20D85BF60(0, qword_2549C9368);
  if (!swift_dynamicCast())
  {
    __break(1u);
    return;
  }

  sub_20D85C0C4(v61, &v59);
  swift_dynamicCast();
  v26 = v58;
LABEL_23:
  v17(v12, v54, v8);
  v46 = (_QWORD *)*v4;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v4 = (uint64_t)v46;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v46 = sub_20D8635F8(0, v46[2] + 1, 1, v46);
    *v4 = (uint64_t)v46;
  }
  v49 = v46[2];
  v48 = v46[3];
  if (v49 >= v48 >> 1)
    *v4 = (uint64_t)sub_20D8635F8((_QWORD *)(v48 > 1), v49 + 1, 1, v46);
  v17(v15, (uint64_t)v12, v8);
  sub_20D86D14C(v49, (uint64_t)v15, v4, v8, v55);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v12, v8);
  v50 = *v4;
  v51 = v4[2];
  a3[3] = (uint64_t)&type metadata for _CBOREncoderUnkeyedContainer;
  a3[4] = sub_20D86CAB0();
  *a3 = v50;
  a3[1] = (uint64_t)v26;
  a3[2] = v51;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_20D869428(v4);

}

uint64_t sub_20D8699C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *(_QWORD *)(v1 + 16);
  swift_retain();
  result = sub_20D8647A8(0x7265707573, 0xE500000000000000);
  if (v5)
  {
    v8 = result;
    v9 = v5;
    v10 = v6;
    v11 = v7 & 1;
    v12 = *(void **)(v1 + 8);
    v13 = type metadata accessor for _CBORReferenceEncoder();
    v14 = swift_allocObject();
    v15 = sub_20D86D430(v3, v8, v9, v10, v11, v12, v14);
    swift_bridgeObjectRelease();
    a1[3] = v13;
    result = sub_20D86CE78(&qword_2549C9360, (uint64_t (*)(uint64_t))type metadata accessor for _CBORReferenceEncoder, (uint64_t)&unk_20D879C20);
    a1[4] = result;
    *a1 = v15;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D869AB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v7 = type metadata accessor for _CBORReferenceEncoder();
  v9 = *(void **)(v3 + 8);
  v8 = *(_QWORD *)(v3 + 16);
  v11 = *(_QWORD *)(a2 + 16);
  v10 = *(_QWORD *)(a2 + 24);
  swift_retain();
  v12 = sub_20D86D6A0(v8, a1, v9, v7, v11, v10);
  a3[3] = v7;
  result = sub_20D86CE78(&qword_2549C9360, (uint64_t (*)(uint64_t))type metadata accessor for _CBORReferenceEncoder, (uint64_t)&unk_20D879C20);
  a3[4] = result;
  *a3 = v12;
  return result;
}

void sub_20D869B60(uint64_t a1, uint64_t a2)
{
  sub_20D866BA4(a1, a2);
}

void sub_20D869B74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D866E10(a1, a2, a3);
}

void sub_20D869B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_20D867094(a1, a2, a3, a4);
}

void sub_20D869B9C(uint64_t a1, uint64_t a2, double a3)
{
  sub_20D867338(a1, a2, a3);
}

void sub_20D869BB0(uint64_t a1, uint64_t a2, float a3)
{
  sub_20D8675B4(a1, a2, a3);
}

void sub_20D869BC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D867F98(a1, a2, a3, (SEL *)&selRef_cborWithInteger_);
}

void sub_20D869BE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D867830(a1, a2, a3);
}

void sub_20D869BF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D867AA8(a1, a2, a3);
}

void sub_20D869C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D867D20(a1, a2, a3);
}

uint64_t sub_20D869C1C()
{
  return sub_20D8781F0();
}

void sub_20D869C30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D867F98(a1, a2, a3, (SEL *)&selRef_cborWithUnsignedInteger_);
}

void sub_20D869C4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D868214(a1, a2, a3);
}

void sub_20D869C60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D86848C(a1, a2, a3);
}

void sub_20D869C74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D868704(a1, a2, a3);
}

uint64_t sub_20D869C88()
{
  return sub_20D8781FC();
}

uint64_t sub_20D869C9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_20D86897C(a1, a2, a5, a3, a4);
}

uint64_t sub_20D869CC0()
{
  return sub_20D8781E4();
}

uint64_t sub_20D869CE8()
{
  return sub_20D878178();
}

uint64_t sub_20D869CFC()
{
  return sub_20D87816C();
}

uint64_t sub_20D869D10()
{
  return sub_20D878184();
}

uint64_t sub_20D869D28(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D869E8C(a1, a2, a3, a4, MEMORY[0x24BEE3C98]);
}

uint64_t sub_20D869D44()
{
  return sub_20D878190();
}

uint64_t sub_20D869D5C(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D869E14(a1, a2, a3, a4, MEMORY[0x24BEE3CB8]);
}

uint64_t sub_20D869D78(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D869E50(a1, a2, a3, a4, MEMORY[0x24BEE3CC0]);
}

uint64_t sub_20D869D94(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D869E8C(a1, a2, a3, a4, MEMORY[0x24BEE3CC8]);
}

uint64_t sub_20D869DB0()
{
  return sub_20D8781B4();
}

uint64_t sub_20D869DC8()
{
  return sub_20D8781C0();
}

uint64_t sub_20D869DE0()
{
  return sub_20D87819C();
}

uint64_t sub_20D869DF8(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D869E14(a1, a2, a3, a4, MEMORY[0x24BEE3CD8]);
}

uint64_t sub_20D869E14(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  return a5(a1 & 0x1FF);
}

uint64_t sub_20D869E34(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D869E50(a1, a2, a3, a4, MEMORY[0x24BEE3CE8]);
}

uint64_t sub_20D869E50(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  return a5(a1 & 0x1FFFF);
}

uint64_t sub_20D869E70(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D869E8C(a1, a2, a3, a4, MEMORY[0x24BEE3CF0]);
}

uint64_t sub_20D869E8C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  return a5(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_20D869EB4()
{
  return sub_20D8781CC();
}

uint64_t sub_20D869ECC()
{
  return sub_20D8781D8();
}

uint64_t sub_20D869EE4()
{
  return sub_20D8781A8();
}

void sub_20D869F0C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  sub_20D868E4C(a1, a2, a5, a3, a4, a6);
}

uint64_t sub_20D869F2C(double a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  __int128 v16;
  ValueMetadata *v17;
  unint64_t v18;
  id v19;

  v2 = v1;
  v4 = *(void **)(v1 + 8);
  v5 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)&v16 = 0x3A6D657449;
  *((_QWORD *)&v16 + 1) = 0xE500000000000000;
  v19 = objc_msgSend(v4, sel_count);
  sub_20D877F20();
  sub_20D877C74();
  swift_bridgeObjectRelease();
  v6 = (_QWORD *)(v5 + 24);
  swift_beginAccess();
  v7 = *(_QWORD **)(v5 + 24);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v5 + 24) = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v7 = sub_20D8635F8(0, v7[2] + 1, 1, v7);
    *v6 = v7;
  }
  v10 = v7[2];
  v9 = v7[3];
  if (v10 >= v9 >> 1)
  {
    v7 = sub_20D8635F8((_QWORD *)(v9 > 1), v10 + 1, 1, v7);
    *v6 = v7;
  }
  v17 = &type metadata for CBORCodingKey;
  v18 = sub_20D85C5DC();
  v11 = swift_allocObject();
  *(_QWORD *)&v16 = v11;
  *(_QWORD *)(v11 + 16) = 0x3A6D657449;
  *(_QWORD *)(v11 + 24) = 0xE500000000000000;
  *(_QWORD *)(v11 + 32) = 0;
  *(_BYTE *)(v11 + 40) = 1;
  v7[2] = v10 + 1;
  sub_20D85C644(&v16, (uint64_t)&v7[5 * v10 + 4]);
  v17 = (ValueMetadata *)MEMORY[0x24BEE13C8];
  v18 = MEMORY[0x24BEE13D8];
  *(double *)&v16 = a1;
  v12 = sub_20D865574(&v16);
  if (v15)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v16);
    return sub_20D868D9C(v2);
  }
  v13 = v12;
  result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v16);
  if (v13)
  {
    objc_msgSend(v4, sel_addObject_, v13);
    swift_unknownObjectRelease();
    return sub_20D868D9C(v2);
  }
  __break(1u);
  return result;
}

uint64_t sub_20D86A12C(float a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  __int128 v16;
  ValueMetadata *v17;
  unint64_t v18;
  id v19;

  v2 = v1;
  v4 = *(void **)(v1 + 8);
  v5 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)&v16 = 0x3A6D657449;
  *((_QWORD *)&v16 + 1) = 0xE500000000000000;
  v19 = objc_msgSend(v4, sel_count);
  sub_20D877F20();
  sub_20D877C74();
  swift_bridgeObjectRelease();
  v6 = (_QWORD *)(v5 + 24);
  swift_beginAccess();
  v7 = *(_QWORD **)(v5 + 24);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v5 + 24) = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v7 = sub_20D8635F8(0, v7[2] + 1, 1, v7);
    *v6 = v7;
  }
  v10 = v7[2];
  v9 = v7[3];
  if (v10 >= v9 >> 1)
  {
    v7 = sub_20D8635F8((_QWORD *)(v9 > 1), v10 + 1, 1, v7);
    *v6 = v7;
  }
  v17 = &type metadata for CBORCodingKey;
  v18 = sub_20D85C5DC();
  v11 = swift_allocObject();
  *(_QWORD *)&v16 = v11;
  *(_QWORD *)(v11 + 16) = 0x3A6D657449;
  *(_QWORD *)(v11 + 24) = 0xE500000000000000;
  *(_QWORD *)(v11 + 32) = 0;
  *(_BYTE *)(v11 + 40) = 1;
  v7[2] = v10 + 1;
  sub_20D85C644(&v16, (uint64_t)&v7[5 * v10 + 4]);
  v17 = (ValueMetadata *)MEMORY[0x24BEE14E8];
  v18 = MEMORY[0x24BEE14F8];
  *(float *)&v16 = a1;
  v12 = sub_20D865574(&v16);
  if (v15)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v16);
    return sub_20D868D9C(v2);
  }
  v13 = v12;
  result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v16);
  if (v13)
  {
    objc_msgSend(v4, sel_addObject_, v13);
    swift_unknownObjectRelease();
    return sub_20D868D9C(v2);
  }
  __break(1u);
  return result;
}

uint64_t sub_20D86A32C(uint64_t a1, ValueMetadata *a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  id v18;
  __int128 v21;
  ValueMetadata *v22;
  unint64_t v23;
  id v24;
  uint64_t v25;

  v4 = v3;
  v6 = *(_QWORD *)(v3 + 16);
  v18 = *(id *)(v3 + 8);
  *(_QWORD *)&v21 = 0x3A6D657449;
  *((_QWORD *)&v21 + 1) = 0xE500000000000000;
  v24 = objc_msgSend(v18, sel_count);
  sub_20D877F20();
  sub_20D877C74();
  swift_bridgeObjectRelease();
  v7 = (_QWORD *)(v6 + 24);
  swift_beginAccess();
  v8 = *(_QWORD **)(v6 + 24);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v6 + 24) = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_20D8635F8(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  v11 = v8[2];
  v10 = v8[3];
  if (v11 >= v10 >> 1)
  {
    v8 = sub_20D8635F8((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
    *v7 = v8;
  }
  v22 = &type metadata for CBORCodingKey;
  v23 = sub_20D85C5DC();
  v12 = swift_allocObject();
  *(_QWORD *)&v21 = v12;
  *(_QWORD *)(v12 + 16) = 0x3A6D657449;
  *(_QWORD *)(v12 + 24) = 0xE500000000000000;
  *(_QWORD *)(v12 + 32) = 0;
  *(_BYTE *)(v12 + 40) = 1;
  v8[2] = v11 + 1;
  sub_20D85C644(&v21, (uint64_t)&v8[5 * v11 + 4]);
  v22 = a2;
  v23 = a3;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)&v21);
  (*((void (**)(uint64_t *, uint64_t, ValueMetadata *))a2[-1].Description + 2))(boxed_opaque_existential_1Tm, a1, a2);
  v14 = v25;
  v15 = sub_20D865574(&v21);
  if (v14)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v21);
    return sub_20D868D9C(v4);
  }
  v16 = v15;
  result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v21);
  if (v16)
  {
    objc_msgSend(v18, sel_addObject_, v16);
    swift_unknownObjectRelease();
    return sub_20D868D9C(v4);
  }
  __break(1u);
  return result;
}

void sub_20D86A534(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  BOOL v8;
  objc_class *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  uint64_t v24;
  ValueMetadata *v25;
  unint64_t v26;
  id v27;
  objc_super v28;

  v4 = v3;
  v7 = *(_QWORD *)(v3 + 16);
  v8 = *(_BYTE *)(v7 + 40) == 0;
  v9 = (objc_class *)type metadata accessor for _CBORDictionary();
  v10 = (char *)objc_allocWithZone(v9);
  v11 = OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content;
  v12 = v10;
  v13 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v10[v11] = sub_20D851CCC(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)&v12[OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList] = v13;
  v12[OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder] = v8;

  v28.receiver = v12;
  v28.super_class = v9;
  v14 = objc_msgSendSuper2(&v28, sel_init);
  v15 = objc_msgSend(*(id *)(v4 + 8), sel_count);
  *(_QWORD *)&v23 = 0x3A6D657449;
  *((_QWORD *)&v23 + 1) = 0xE500000000000000;
  v27 = v15;
  sub_20D877F20();
  sub_20D877C74();
  swift_bridgeObjectRelease();
  v16 = *(_QWORD **)v4;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v16 = sub_20D8635F8(0, v16[2] + 1, 1, v16);
  v18 = v16[2];
  v17 = v16[3];
  if (v18 >= v17 >> 1)
    v16 = sub_20D8635F8((_QWORD *)(v17 > 1), v18 + 1, 1, v16);
  v25 = &type metadata for CBORCodingKey;
  v26 = sub_20D85C5DC();
  v19 = swift_allocObject();
  *(_QWORD *)&v23 = v19;
  *(_QWORD *)(v19 + 16) = 0x3A6D657449;
  *(_QWORD *)(v19 + 24) = 0xE500000000000000;
  *(_QWORD *)(v19 + 32) = 0;
  *(_BYTE *)(v19 + 40) = 1;
  v16[2] = v18 + 1;
  sub_20D85C644(&v23, (uint64_t)&v16[5 * v18 + 4]);
  *(_QWORD *)v4 = v16;
  *(_QWORD *)&v23 = v16;
  *((_QWORD *)&v23 + 1) = v14;
  v24 = v7;
  v21 = type metadata accessor for _CBOREncoderKeyContainer(0, a2, a3, v20);
  swift_retain();
  swift_bridgeObjectRetain();
  v22 = v14;
  MEMORY[0x212BAA8AC](&unk_20D879CE0, v21);
  sub_20D877F14();
  sub_20D869428((_QWORD *)v4);

}

uint64_t sub_20D86A778@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;
  id v4;
  id v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  ValueMetadata *v13;
  unint64_t v14;
  id v15;

  v2 = (_QWORD *)v1;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), sel_init);
  v5 = objc_msgSend(*(id *)(v1 + 8), sel_count);
  *(_QWORD *)&v12 = 0x3A6D657449;
  *((_QWORD *)&v12 + 1) = 0xE500000000000000;
  v15 = v5;
  sub_20D877F20();
  sub_20D877C74();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD **)v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v6 = sub_20D8635F8(0, v6[2] + 1, 1, v6);
  v8 = v6[2];
  v7 = v6[3];
  if (v8 >= v7 >> 1)
    v6 = sub_20D8635F8((_QWORD *)(v7 > 1), v8 + 1, 1, v6);
  v13 = &type metadata for CBORCodingKey;
  v14 = sub_20D85C5DC();
  v9 = swift_allocObject();
  *(_QWORD *)&v12 = v9;
  *(_QWORD *)(v9 + 16) = 0x3A6D657449;
  *(_QWORD *)(v9 + 24) = 0xE500000000000000;
  *(_QWORD *)(v9 + 32) = 0;
  *(_BYTE *)(v9 + 40) = 1;
  v6[2] = v8 + 1;
  sub_20D85C644(&v12, (uint64_t)&v6[5 * v8 + 4]);
  *v2 = v6;
  v10 = v2[2];
  a1[3] = &type metadata for _CBOREncoderUnkeyedContainer;
  a1[4] = sub_20D86CAB0();
  *a1 = v6;
  a1[1] = v4;
  a1[2] = v10;
  swift_retain();
  swift_bridgeObjectRetain();
  return sub_20D869428(v2);
}

id sub_20D86A91C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 8), sel_count);
}

void sub_20D86A92C()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 8);
  v2 = objc_msgSend((id)objc_opt_self(), sel_cborNil);
  objc_msgSend(v1, sel_addObject_, v2);

}

void sub_20D86A994(char a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  char **v5;
  id v6;

  v3 = *(void **)(v1 + 8);
  v4 = (void *)objc_opt_self();
  v5 = &selRef_cborTrue;
  if ((a1 & 1) == 0)
    v5 = &selRef_cborFalse;
  v6 = objc_msgSend(v4, *v5);
  objc_msgSend(v3, sel_addObject_, v6);

}

void sub_20D86AA14()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(v0 + 8);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_20D877C44();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend((id)objc_opt_self(), sel_cborWithUTF8String_, v2);

  objc_msgSend(v1, sel_addObject_, v3);
}

uint64_t sub_20D86AAAC(double a1)
{
  return sub_20D869F2C(a1);
}

uint64_t sub_20D86AAC0(float a1)
{
  return sub_20D86A12C(a1);
}

void sub_20D86AAD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D86ADC0(a1, a2, a3, (SEL *)&selRef_cborWithInteger_);
}

void sub_20D86AAF0(char a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + 8);
  v3 = objc_msgSend((id)objc_opt_self(), sel_cborWithInteger_, a1);
  objc_msgSend(v2, sel_addObject_, v3);

}

void sub_20D86AB60(__int16 a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + 8);
  v3 = objc_msgSend((id)objc_opt_self(), sel_cborWithInteger_, a1);
  objc_msgSend(v2, sel_addObject_, v3);

}

void sub_20D86ABD0(int a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + 8);
  v3 = objc_msgSend((id)objc_opt_self(), sel_cborWithInteger_, a1);
  objc_msgSend(v2, sel_addObject_, v3);

}

uint64_t sub_20D86AC40()
{
  return sub_20D87807C();
}

void sub_20D86AC54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D86ADC0(a1, a2, a3, (SEL *)&selRef_cborWithUnsignedInteger_);
}

void sub_20D86AC70(unsigned __int8 a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + 8);
  v3 = objc_msgSend((id)objc_opt_self(), sel_cborWithUnsignedInteger_, a1);
  objc_msgSend(v2, sel_addObject_, v3);

}

void sub_20D86ACE0(unsigned __int16 a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + 8);
  v3 = objc_msgSend((id)objc_opt_self(), sel_cborWithUnsignedInteger_, a1);
  objc_msgSend(v2, sel_addObject_, v3);

}

void sub_20D86AD50(unsigned int a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + 8);
  v3 = objc_msgSend((id)objc_opt_self(), sel_cborWithUnsignedInteger_, a1);
  objc_msgSend(v2, sel_addObject_, v3);

}

void sub_20D86ADC0(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v4;
  void *v5;
  id v6;

  v5 = *(void **)(v4 + 8);
  v6 = objc_msgSend((id)objc_opt_self(), *a4, a1);
  objc_msgSend(v5, sel_addObject_, v6);

}

uint64_t sub_20D86AE30()
{
  return sub_20D878088();
}

uint64_t sub_20D86AE44(uint64_t a1, ValueMetadata *a2, unint64_t a3)
{
  return sub_20D86A32C(a1, a2, a3);
}

uint64_t sub_20D86AE58()
{
  return sub_20D877FA4();
}

uint64_t sub_20D86AE80()
{
  return sub_20D877FC8();
}

uint64_t sub_20D86AEA8()
{
  return sub_20D877FBC();
}

uint64_t sub_20D86AED0()
{
  return sub_20D877FD4();
}

uint64_t sub_20D86AEF8()
{
  return sub_20D877FE0();
}

uint64_t sub_20D86AF20()
{
  return sub_20D877FEC();
}

uint64_t sub_20D86AF48()
{
  return sub_20D878004();
}

uint64_t sub_20D86AF70()
{
  return sub_20D878010();
}

uint64_t sub_20D86AF98()
{
  return sub_20D87801C();
}

uint64_t sub_20D86AFC0()
{
  return sub_20D878028();
}

uint64_t sub_20D86AFE8()
{
  return sub_20D878040();
}

uint64_t sub_20D86B010()
{
  return sub_20D877FF8();
}

uint64_t sub_20D86B038()
{
  return sub_20D878034();
}

uint64_t sub_20D86B060()
{
  return sub_20D87804C();
}

uint64_t sub_20D86B088()
{
  return sub_20D878058();
}

uint64_t sub_20D86B0B0()
{
  return sub_20D878064();
}

uint64_t sub_20D86B0D8()
{
  return sub_20D878070();
}

uint64_t sub_20D86B100()
{
  return sub_20D877FB0();
}

uint64_t sub_20D86B138@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v5 = v1 + 8;
  v3 = *(void **)(v1 + 8);
  v4 = *(_QWORD *)(v5 + 8);
  swift_retain();
  v6 = objc_msgSend(v3, sel_count);
  v7 = type metadata accessor for _CBORReferenceEncoder();
  swift_allocObject();
  v8 = sub_20D86C050(v4, (uint64_t)v6, v3);
  a1[3] = v7;
  result = sub_20D86CE78(&qword_2549C9360, (uint64_t (*)(uint64_t))type metadata accessor for _CBORReferenceEncoder, (uint64_t)&unk_20D879C20);
  a1[4] = result;
  *a1 = v8;
  return result;
}

void sub_20D86B1F0()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend((id)objc_opt_self(), sel_cborNil);
  swift_beginAccess();
  v2 = swift_unknownObjectRetain();
  MEMORY[0x212BA9E14](v2);
  if (*(_QWORD *)((*(_QWORD *)(v0 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v0 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_20D877D1C();
  sub_20D877D28();
  sub_20D877D10();
  swift_endAccess();

}

void sub_20D86B2B4(char a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  char **v5;
  id v6;
  uint64_t v7;

  v2 = v1;
  v4 = (void *)objc_opt_self();
  v5 = &selRef_cborTrue;
  if ((a1 & 1) == 0)
    v5 = &selRef_cborFalse;
  v6 = objc_msgSend(v4, *v5);
  swift_beginAccess();
  v7 = swift_unknownObjectRetain();
  MEMORY[0x212BA9E14](v7);
  if (*(_QWORD *)((*(_QWORD *)(v2 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v2 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_20D877D1C();
  sub_20D877D28();
  sub_20D877D10();
  swift_endAccess();

}

void sub_20D86B390()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;

  swift_bridgeObjectRetain();
  v1 = (void *)sub_20D877C44();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend((id)objc_opt_self(), sel_cborWithUTF8String_, v1);

  swift_beginAccess();
  v3 = swift_unknownObjectRetain();
  MEMORY[0x212BA9E14](v3);
  if (*(_QWORD *)((*(_QWORD *)(v0 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v0 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_20D877D1C();
  sub_20D877D28();
  sub_20D877D10();
  swift_endAccess();

}

void sub_20D86B48C(double a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_cborWithDouble_, a1);
  swift_beginAccess();
  v3 = swift_unknownObjectRetain();
  MEMORY[0x212BA9E14](v3);
  if (*(_QWORD *)((*(_QWORD *)(v1 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v1 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_20D877D1C();
  sub_20D877D28();
  sub_20D877D10();
  swift_endAccess();

}

void sub_20D86B560(float a1)
{
  uint64_t v1;
  void *v3;
  double v4;
  id v5;
  uint64_t v6;

  v3 = (void *)objc_opt_self();
  *(float *)&v4 = a1;
  v5 = objc_msgSend(v3, sel_cborWithFloat_, v4);
  swift_beginAccess();
  v6 = swift_unknownObjectRetain();
  MEMORY[0x212BA9E14](v6);
  if (*(_QWORD *)((*(_QWORD *)(v1 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v1 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_20D877D1C();
  sub_20D877D28();
  sub_20D877D10();
  swift_endAccess();

}

void sub_20D86B634(char a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_cborWithInteger_, a1);
  swift_beginAccess();
  v3 = swift_unknownObjectRetain();
  MEMORY[0x212BA9E14](v3);
  if (*(_QWORD *)((*(_QWORD *)(v1 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v1 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_20D877D1C();
  sub_20D877D28();
  sub_20D877D10();
  swift_endAccess();

}

void sub_20D86B700(__int16 a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_cborWithInteger_, a1);
  swift_beginAccess();
  v3 = swift_unknownObjectRetain();
  MEMORY[0x212BA9E14](v3);
  if (*(_QWORD *)((*(_QWORD *)(v1 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v1 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_20D877D1C();
  sub_20D877D28();
  sub_20D877D10();
  swift_endAccess();

}

void sub_20D86B7CC(int a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_cborWithInteger_, a1);
  swift_beginAccess();
  v3 = swift_unknownObjectRetain();
  MEMORY[0x212BA9E14](v3);
  if (*(_QWORD *)((*(_QWORD *)(v1 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v1 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_20D877D1C();
  sub_20D877D28();
  sub_20D877D10();
  swift_endAccess();

}

void sub_20D86B898(unsigned __int8 a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_cborWithUnsignedInteger_, a1);
  swift_beginAccess();
  v3 = swift_unknownObjectRetain();
  MEMORY[0x212BA9E14](v3);
  if (*(_QWORD *)((*(_QWORD *)(v1 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v1 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_20D877D1C();
  sub_20D877D28();
  sub_20D877D10();
  swift_endAccess();

}

void sub_20D86B964(unsigned __int16 a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_cborWithUnsignedInteger_, a1);
  swift_beginAccess();
  v3 = swift_unknownObjectRetain();
  MEMORY[0x212BA9E14](v3);
  if (*(_QWORD *)((*(_QWORD *)(v1 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v1 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_20D877D1C();
  sub_20D877D28();
  sub_20D877D10();
  swift_endAccess();

}

void sub_20D86BA30(unsigned int a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_cborWithUnsignedInteger_, a1);
  swift_beginAccess();
  v3 = swift_unknownObjectRetain();
  MEMORY[0x212BA9E14](v3);
  if (*(_QWORD *)((*(_QWORD *)(v1 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v1 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_20D877D1C();
  sub_20D877D28();
  sub_20D877D10();
  swift_endAccess();

}

void sub_20D86BAFC(uint64_t a1, SEL *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;

  v3 = objc_msgSend((id)objc_opt_self(), *a2, a1);
  swift_beginAccess();
  v4 = swift_unknownObjectRetain();
  MEMORY[0x212BA9E14](v4);
  if (*(_QWORD *)((*(_QWORD *)(v2 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v2 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_20D877D1C();
  sub_20D877D28();
  sub_20D877D10();
  swift_endAccess();

}

uint64_t sub_20D86BBC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t *boxed_opaque_existential_1Tm;
  void (*v15)(uint64_t *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  char *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28[5];
  uint64_t v29;

  v5 = v3;
  v9 = sub_20D877DD0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28[3] = a2;
  v28[4] = a3;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v28);
  v15 = *(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16);
  v15(boxed_opaque_existential_1Tm, a1, a2);
  v16 = sub_20D865574(v28);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  if (v4)
    return swift_willThrow();
  v26 = v15;
  v27 = a1;
  v29 = v10;
  if (!v16)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_20D877DA0();
    v19 = sub_20D877DDC();
    swift_allocError();
    v21 = v20;
    v22 = (char *)v20 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549C9290) + 48);
    v21[3] = a2;
    v23 = __swift_allocate_boxed_opaque_existential_1Tm(v21);
    v26(v23, v27, a2);
    v24 = v29;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v22, v13, v9);
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE2728], v19);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v9);
    return swift_willThrow();
  }
  swift_beginAccess();
  v18 = swift_unknownObjectRetain();
  MEMORY[0x212BA9E14](v18);
  if (*(_QWORD *)((*(_QWORD *)(v5 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v5 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_20D877D1C();
  sub_20D877D28();
  sub_20D877D10();
  swift_endAccess();
  return swift_unknownObjectRelease();
}

uint64_t sub_20D86BE18()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

void sub_20D86BE58()
{
  sub_20D86B1F0();
}

void sub_20D86BE78(char a1)
{
  sub_20D86B2B4(a1);
}

void sub_20D86BE98()
{
  sub_20D86B390();
}

void sub_20D86BEB8(double a1)
{
  sub_20D86B48C(a1);
}

void sub_20D86BED8(float a1)
{
  sub_20D86B560(a1);
}

void sub_20D86BEF8(uint64_t a1)
{
  sub_20D86BAFC(a1, (SEL *)&selRef_cborWithInteger_);
}

void sub_20D86BF20(char a1)
{
  sub_20D86B634(a1);
}

void sub_20D86BF40(__int16 a1)
{
  sub_20D86B700(a1);
}

void sub_20D86BF60(int a1)
{
  sub_20D86B7CC(a1);
}

uint64_t sub_20D86BF80()
{
  return sub_20D8780DC();
}

void sub_20D86BF94(uint64_t a1)
{
  sub_20D86BAFC(a1, (SEL *)&selRef_cborWithUnsignedInteger_);
}

void sub_20D86BFBC(unsigned __int8 a1)
{
  sub_20D86B898(a1);
}

void sub_20D86BFDC(unsigned __int16 a1)
{
  sub_20D86B964(a1);
}

void sub_20D86BFFC(unsigned int a1)
{
  sub_20D86BA30(a1);
}

uint64_t sub_20D86C01C()
{
  return sub_20D8780E8();
}

uint64_t sub_20D86C030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D86BBC8(a1, a2, a3);
}

uint64_t sub_20D86C050(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  __int128 v20;
  ValueMetadata *v21;
  unint64_t v22;
  uint64_t v23;

  v4 = v3;
  *(_QWORD *)(v4 + 48) = a1;
  *(_QWORD *)(v4 + 56) = a3;
  *(_QWORD *)(v4 + 64) = a2;
  *(_BYTE *)(v4 + 72) = 0;
  v8 = *(_BYTE *)(a1 + 40);
  v9 = *(_BYTE *)(a1 + 41);
  swift_beginAccess();
  v10 = *(_QWORD *)(a1 + 24);
  v11 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v4 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v4 + 24) = v10;
  v12 = (_QWORD *)(v4 + 24);
  *(_BYTE *)(v4 + 40) = v8;
  *(_BYTE *)(v4 + 41) = v9;
  *(_QWORD *)(v4 + 32) = v11;
  *(_QWORD *)&v20 = 0x3A6D657449;
  *((_QWORD *)&v20 + 1) = 0xE500000000000000;
  v23 = a2;
  swift_retain();
  v13 = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_20D877F20();
  sub_20D877C74();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v14 = *(_QWORD **)(v4 + 24);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v4 + 24) = v14;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v14 = sub_20D8635F8(0, v14[2] + 1, 1, v14);
    *v12 = v14;
  }
  v17 = v14[2];
  v16 = v14[3];
  if (v17 >= v16 >> 1)
  {
    v14 = sub_20D8635F8((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
    *v12 = v14;
  }
  v21 = &type metadata for CBORCodingKey;
  v22 = sub_20D85C5DC();
  v18 = swift_allocObject();
  *(_QWORD *)&v20 = v18;
  *(_QWORD *)(v18 + 16) = 0x3A6D657449;
  *(_QWORD *)(v18 + 24) = 0xE500000000000000;
  *(_QWORD *)(v18 + 32) = 0;
  *(_BYTE *)(v18 + 40) = 1;
  v14[2] = v17 + 1;
  sub_20D85C644(&v20, (uint64_t)&v14[5 * v17 + 4]);
  swift_release();
  swift_release();

  return v4;
}

BOOL sub_20D86C248()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_beginAccess();
  v1 = v0[2];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_20D877E9C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_beginAccess();
  v3 = *(_QWORD *)(v0[3] + 16);
  v4 = v0[6];
  swift_beginAccess();
  return v2 == v3 + ~*(_QWORD *)(*(_QWORD *)(v4 + 24) + 16);
}

void sub_20D86C310()
{
  uint64_t v0;

  swift_release();
  sub_20D86C74C(*(void **)(v0 + 56), *(void **)(v0 + 64), *(_BYTE *)(v0 + 72));
}

uint64_t sub_20D86C330()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  id v8;
  char *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  id v16;
  char v17;
  char v18;
  char *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t result;

  v2 = v0;
  v3 = (_QWORD *)(v0 + 16);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 + 16);
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_20D877E9C();
    swift_bridgeObjectRelease();
    if (v5 == 1)
    {
LABEL_3:
      swift_beginAccess();
      if (*v3 >> 62)
      {
        swift_bridgeObjectRetain();
        v6 = (char *)sub_20D877E9C();
        swift_bridgeObjectRelease();
        if (v6)
          goto LABEL_5;
      }
      else
      {
        v6 = *(char **)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v6)
        {
LABEL_5:
          v7 = sub_20D86CB00();
          if (v7)
          {
            v8 = (id)v7;
            swift_endAccess();
            goto LABEL_10;
          }
          __break(1u);
          goto LABEL_27;
        }
      }
      __break(1u);
      goto LABEL_25;
    }
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5 == 1)
      goto LABEL_3;
  }
  if (!v5)
  {
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE70]), sel_init);
LABEL_10:
    v6 = *(char **)(v2 + 56);
    v1 = *(void **)(v2 + 64);
    if ((*(_BYTE *)(v2 + 72) & 1) == 0)
    {
      objc_msgSend(v6, sel_insertObject_atIndex_, v8, v1);
      swift_unknownObjectRelease();
      sub_20D86C74C(v6, v1, 0);
LABEL_22:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      sub_20D86C74C(*(void **)(v2 + 56), *(void **)(v2 + 64), *(_BYTE *)(v2 + 72));
      return v2;
    }
    if (v6[OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder] != 1)
    {
      v13 = v6;
      v14 = v1;
      goto LABEL_21;
    }
    v9 = &v6[OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content];
    swift_beginAccess();
    v10 = *(_QWORD *)v9;
    if ((v10 & 0xC000000000000001) != 0)
    {
      sub_20D86C714(v6, v1, 1);
      v11 = v1;
      swift_bridgeObjectRetain();
      v12 = sub_20D877E78();

      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_unknownObjectRelease();
LABEL_21:
        swift_beginAccess();
        v21 = v1;
        v22 = swift_unknownObjectRetain();
        sub_20D86CBC8(v22, v21);
        swift_endAccess();

        swift_unknownObjectRelease();
        goto LABEL_22;
      }
    }
    else
    {
      v15 = *(_QWORD *)(v10 + 16);
      sub_20D86C714(v6, v1, 1);
      if (v15)
      {
        v16 = v1;
        swift_bridgeObjectRetain();
        sub_20D86E68C((uint64_t)v16);
        v18 = v17;

        swift_bridgeObjectRelease();
        if ((v18 & 1) != 0)
          goto LABEL_21;
      }
    }
    v19 = &v6[OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList];
    swift_beginAccess();
    v20 = v1;
    MEMORY[0x212BA9E14]();
    if (*(_QWORD *)((*(_QWORD *)v19 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((*(_QWORD *)v19 & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
    {
LABEL_20:
      sub_20D877D28();
      sub_20D877D10();
      swift_endAccess();
      goto LABEL_21;
    }
LABEL_25:
    sub_20D877D1C();
    goto LABEL_20;
  }
LABEL_27:
  result = sub_20D877E90();
  __break(1u);
  return result;
}

uint64_t sub_20D86C6D4()
{
  sub_20D86C330();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for _CBORReferenceEncoder()
{
  return objc_opt_self();
}

id sub_20D86C714(void *a1, void *a2, char a3)
{
  id v4;

  if ((a3 & 1) != 0)
  {
    v4 = a1;
    a1 = a2;
  }
  return a1;
}

void destroy for _CBORReferenceEncoder.Reference(uint64_t a1)
{
  sub_20D86C74C(*(void **)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_20D86C74C(void *a1, void *a2, char a3)
{

  if ((a3 & 1) != 0)
}

uint64_t _s11CBORLibrary21_CBORReferenceEncoderC9ReferenceOwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_20D86C714(*(void **)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for _CBORReferenceEncoder.Reference(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_20D86C714(*(void **)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_20D86C74C(v6, v7, v8);
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

uint64_t assignWithTake for _CBORReferenceEncoder.Reference(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_20D86C74C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for _CBORReferenceEncoder.Reference(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for _CBORReferenceEncoder.Reference(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_20D86C910(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_20D86C918(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for _CBORReferenceEncoder.Reference()
{
  return &type metadata for _CBORReferenceEncoder.Reference;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CBOREncoder._Options(unsigned __int16 *a1, unsigned int a2)
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
  if (a2 + 65281 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65281 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65281;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65281;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65281;
  }
LABEL_17:
  v6 = *((unsigned __int8 *)a1 + 1);
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CBOREncoder._Options(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65281 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65281 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_20D86CA20 + 4 * byte_20D879929[v4]))();
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_20D86CA54 + 4 * byte_20D879924[v4]))();
}

uint64_t sub_20D86CA54(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_20D86CA5C(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x20D86CA64);
  return result;
}

uint64_t sub_20D86CA70(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x20D86CA78);
  *(_BYTE *)(result + 1) = a2 + 1;
  return result;
}

uint64_t sub_20D86CA7C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_20D86CA84(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CBOREncoder._Options()
{
  return &type metadata for CBOREncoder._Options;
}

ValueMetadata *type metadata accessor for _CBOREncodingStorage()
{
  return &type metadata for _CBOREncodingStorage;
}

unint64_t sub_20D86CAB0()
{
  unint64_t result;

  result = qword_2549C92C8;
  if (!qword_2549C92C8)
  {
    result = MEMORY[0x212BAA8AC](&unk_20D879E58, &type metadata for _CBOREncoderUnkeyedContainer);
    atomic_store(result, (unint64_t *)&qword_2549C92C8);
  }
  return result;
}

uint64_t type metadata accessor for _CBOREncoderKeyContainer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _CBOREncoderKeyContainer);
}

unint64_t sub_20D86CB00()
{
  _QWORD *v0;
  unint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!(*v0 >> 62))
  {
    if (*(_QWORD *)((*v0 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
    return 0;
  }
  swift_bridgeObjectRetain();
  v3 = sub_20D877E9C();
  swift_bridgeObjectRelease();
  if (!v3)
    return 0;
LABEL_3:
  result = sub_20D86CD90();
  if (!result)
  {
    if (*v0 >> 62)
    {
      swift_bridgeObjectRetain();
      v4 = sub_20D877E9C();
      swift_bridgeObjectRelease();
      result = v4 - 1;
      if (!__OFSUB__(v4, 1))
        return sub_20D86CCFC(result);
    }
    else
    {
      v2 = *(_QWORD *)((*v0 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = v2 - 1;
      if (!__OFSUB__(v2, 1))
        return sub_20D86CCFC(result);
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_20D86CBC8(uint64_t a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) == 0)
    goto LABEL_7;
  if (v6 < 0)
    v7 = *v2;
  else
    v7 = v6 & 0xFFFFFFFFFFFFFF8;
  result = sub_20D877E6C();
  if (!__OFADD__(result, 1))
  {
    *v3 = sub_20D86152C(v7, result + 1);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v10 = *v3;
    *v3 = 0x8000000000000000;
    sub_20D862C8C(a1, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v10;
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_20D86CC68(unint64_t a1)
{
  unint64_t *v1;
  unint64_t v3;
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v3;
  if (!(_DWORD)result || (v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
    sub_20D86CE10(v3);
  v5 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5 <= a1)
  {
    __break(1u);
  }
  else
  {
    v6 = v5 - 1;
    v7 = (v3 & 0xFFFFFFFFFFFFFF8) + 8 * a1 + 32;
    v8 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 8 * a1 + 0x20);
    memmove((void *)v7, (const void *)(v7 + 8), 8 * (v5 - 1 - a1));
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x10) = v6;
    sub_20D877D10();
    return v8;
  }
  return result;
}

uint64_t sub_20D86CCFC(unint64_t a1)
{
  unint64_t *v1;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v3;
  if (!(_DWORD)result || (v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
    sub_20D86CE10(v3);
  v5 = v3 & 0xFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    v8 = v5 + 8 * a1;
    v9 = *(_QWORD *)(v8 + 32);
    memmove((void *)(v8 + 32), (const void *)(v8 + 40), 8 * (v6 - 1 - a1));
    *(_QWORD *)(v5 + 16) = v7;
    sub_20D877D10();
    return v9;
  }
  return result;
}

uint64_t sub_20D86CD90()
{
  unint64_t *v0;
  unint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *v0;
  result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v0 = v1;
  if (!(_DWORD)result || (v1 & 0x8000000000000000) != 0 || (v1 & 0x4000000000000000) != 0)
    sub_20D86CE10(v1);
  v3 = v1 & 0xFFFFFFFFFFFFFF8;
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    v5 = v4 - 1;
    v6 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 8 * v5 + 0x20);
    *(_QWORD *)(v3 + 16) = v5;
    sub_20D877D10();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

_QWORD *sub_20D86CDFC(_QWORD *a1)
{
  return sub_20D8635F8(0, a1[2], 0, a1);
}

void sub_20D86CE10(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_20D877E9C();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x212BA9EC8);
}

uint64_t sub_20D86CE78(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x212BAA8AC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t _s11CBORLibrary28_CBOREncoderUnkeyedContainerVwxx_0(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_release();
}

_QWORD *_s11CBORLibrary28_CBOREncoderUnkeyedContainerVwCP_0(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  id v4;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  v4 = v3;
  swift_retain();
  return a1;
}

_QWORD *_s11CBORLibrary28_CBOREncoderUnkeyedContainerVwca_0(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[1];
  v5 = (void *)a1[1];
  a1[1] = v4;
  v6 = v4;

  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s11CBORLibrary28_CBOREncoderUnkeyedContainerVwta_0(uint64_t a1, uint64_t a2)
{
  void *v4;

  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for _CBOREncoderUnkeyedContainer()
{
  return &type metadata for _CBOREncoderUnkeyedContainer;
}

uint64_t sub_20D86D014()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

id sub_20D86D038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  id v9;
  void *ObjCClassFromMetadata;
  void *v11;
  uint64_t v13;

  v4 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1, a1);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 32))(v6);
  v7 = sub_20D8782C8();
  if ((v8 & 1) != 0)
  {
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    sub_20D8782B0();
    v11 = (void *)sub_20D877C44();
    swift_bridgeObjectRelease();
    v9 = objc_msgSend(ObjCClassFromMetadata, sel_cborWithUTF8String_, v11);

  }
  else
  {
    v9 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_cborWithInteger_, v7);
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a3);
  return v9;
}

uint64_t sub_20D86D14C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v13 = a4;
  v14 = a5;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1Tm, a2, a4);
  v10 = *a3;
  *(_QWORD *)(v10 + 16) = a1 + 1;
  return sub_20D85C644(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_20D86D1C4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  id v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v26;
  unint64_t v27;
  uint64_t v29;
  id v30;
  id v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  uint64_t v34;

  v11 = *(_QWORD *)(a5 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1, a2);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12, v15);
  v17 = (char *)&v29 - v16;
  (*(void (**)(char *))(v11 + 32))((char *)&v29 - v16);
  *(_QWORD *)(a4 + 48) = a1;
  v18 = sub_20D85BF60(0, (unint64_t *)&qword_2549C90A8);
  v34 = v11;
  v32 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v32(v14, v17, a5);
  swift_retain();
  swift_retain();
  v33 = a6;
  v19 = sub_20D86D038((uint64_t)v14, v18, a5);
  *(_QWORD *)(a4 + 56) = a3;
  *(_QWORD *)(a4 + 64) = v19;
  *(_BYTE *)(a4 + 72) = 1;
  v31 = a3;
  v30 = v19;
  swift_release();
  v20 = *(_BYTE *)(a1 + 40);
  LOBYTE(v19) = *(_BYTE *)(a1 + 41);
  swift_beginAccess();
  v22 = *(_QWORD *)(a1 + 24);
  v21 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a4 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a4 + 24) = v22;
  v23 = (_QWORD *)(a4 + 24);
  *(_BYTE *)(a4 + 40) = v20;
  *(_BYTE *)(a4 + 41) = (_BYTE)v19;
  *(_QWORD *)(a4 + 32) = v21;
  swift_beginAccess();
  v24 = *(_QWORD **)(a4 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a4 + 24) = v24;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v24 = sub_20D8635F8(0, v24[2] + 1, 1, v24);
    *v23 = v24;
  }
  v27 = v24[2];
  v26 = v24[3];
  if (v27 >= v26 >> 1)
    *v23 = sub_20D8635F8((_QWORD *)(v26 > 1), v27 + 1, 1, v24);
  v32(v14, v17, a5);
  sub_20D86D14C(v27, (uint64_t)v14, (uint64_t *)(a4 + 24), a5, v33);

  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v34 + 8))(v17, a5);
  return a4;
}

uint64_t sub_20D86D430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, uint64_t a7)
{
  void *v14;
  void *v15;
  id v16;
  id v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  ValueMetadata *v33;
  unint64_t v34;

  *(_QWORD *)(a7 + 48) = a1;
  v14 = (void *)objc_opt_self();
  swift_retain();
  swift_retain();
  v30 = a2;
  v31 = a4;
  if ((a5 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v15 = (void *)sub_20D877C44();
    v16 = objc_msgSend(v14, sel_cborWithUTF8String_, v15);
    swift_bridgeObjectRelease();

  }
  else
  {
    v16 = objc_msgSend(v14, sel_cborWithInteger_, a4);
  }
  *(_QWORD *)(a7 + 56) = a6;
  *(_QWORD *)(a7 + 64) = v16;
  *(_BYTE *)(a7 + 72) = 1;
  v29 = a6;
  v17 = v16;
  swift_release();
  v18 = *(_BYTE *)(a1 + 40);
  v19 = *(_BYTE *)(a1 + 41);
  swift_beginAccess();
  v20 = *(_QWORD *)(a1 + 24);
  v21 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a7 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a7 + 24) = v20;
  v22 = (_QWORD *)(a7 + 24);
  *(_BYTE *)(a7 + 40) = v18;
  *(_BYTE *)(a7 + 41) = v19;
  *(_QWORD *)(a7 + 32) = v21;
  swift_beginAccess();
  v23 = *(_QWORD **)(a7 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a7 + 24) = v23;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v23 = sub_20D8635F8(0, v23[2] + 1, 1, v23);
    *v22 = v23;
  }
  v26 = v23[2];
  v25 = v23[3];
  if (v26 >= v25 >> 1)
  {
    v23 = sub_20D8635F8((_QWORD *)(v25 > 1), v26 + 1, 1, v23);
    *v22 = v23;
  }
  v33 = &type metadata for CBORCodingKey;
  v34 = sub_20D85C5DC();
  v27 = swift_allocObject();
  *(_QWORD *)&v32 = v27;
  *(_QWORD *)(v27 + 16) = v30;
  *(_QWORD *)(v27 + 24) = a3;
  *(_QWORD *)(v27 + 32) = v31;
  *(_BYTE *)(v27 + 40) = a5 & 1;
  v23[2] = v26 + 1;
  sub_20D85C644(&v32, (uint64_t)&v23[5 * v26 + 4]);
  swift_bridgeObjectRetain();

  swift_release();
  swift_release();

  return a7;
}

uint64_t sub_20D86D6A0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;

  v11 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for _CBORReferenceEncoder();
  v14 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, a5);
  return sub_20D86D1C4(a1, (uint64_t)v13, a3, v14, a5, a6);
}

void sub_20D86D75C(uint64_t a1)
{
  sub_20D86BEF8(a1);
}

void sub_20D86D770(uint64_t a1)
{
  sub_20D86BF94(a1);
}

uint64_t CBOR.EncodedCBOR.embeddedCodable.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t CBOR.EncodedCBOR.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

uint64_t CBOR.EncodedCBOR.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  _QWORD *v25;
  _QWORD *v26;
  char *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t *v45;
  char *v46;
  unint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  unint64_t v53;
  void (*v55)(char *, uint64_t, uint64_t);
  char *v56;
  char *v57;
  _QWORD *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  char *v73;
  _QWORD *v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  char v78;

  v73 = a5;
  v67 = a4;
  v70 = a3;
  v72 = (_QWORD *)sub_20D877DAC();
  v69 = *(v72 - 1);
  v8 = MEMORY[0x24BDAC7A8](v72, v7);
  v68 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = a2;
  v65 = *(_QWORD *)(a2 - 8);
  v11 = MEMORY[0x24BDAC7A8](v8, v10);
  v66 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11, v13);
  v16 = (char *)&v59 - v15;
  MEMORY[0x24BDAC7A8](v14, v17);
  v19 = (char *)&v59 - v18;
  v20 = sub_20D877E48();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20, v22);
  v24 = (char *)&v59 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v25 = v74;
  sub_20D878274();
  if (v25)
    goto LABEL_17;
  v61 = v24;
  v62 = v21;
  v63 = v20;
  v26 = v72;
  v60 = v19;
  v64 = v16;
  v74 = a1;
  v27 = v73;
  __swift_project_boxed_opaque_existential_1(v77, v77[3]);
  sub_20D85D69C();
  sub_20D8780AC();
  v28 = (void *)v75;
  if (!objc_msgSend((id)v75, sel_isEmbeddedCBORData)
    || (v29 = objc_msgSend(v28, sel_data)) == 0)
  {
    v42 = v68;
    sub_20D877DA0();
    v43 = sub_20D877DB8();
    swift_allocError();
    v45 = v44;
    v46 = (char *)v44 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088) + 48);
    *v45 = type metadata accessor for CBOR.EncodedCBOR(0, v71, v70, v67);
    v47 = v69;
    (*(void (**)(char *, char *, _QWORD *))(v69 + 16))(v46, v42, v26);
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v43 - 8) + 104))(v45, *MEMORY[0x24BEE26D0], v43);
    swift_willThrow();

    (*(void (**)(char *, _QWORD *))(v47 + 8))(v42, v26);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v77);
    a1 = v74;
LABEL_17:
    v58 = a1;
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v58);
  }
  v30 = v29;
  v72 = v28;
  v31 = sub_20D877BD8();
  v69 = v32;

  __swift_project_boxed_opaque_existential_1(v74, v74[3]);
  v33 = sub_20D878280();
  if (qword_2549C9080 != -1)
    swift_once();
  v34 = v63;
  v35 = __swift_project_value_buffer(v63, (uint64_t)qword_2549C9568);
  v36 = v62;
  v37 = (uint64_t)v61;
  (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v61, v35, v34);
  v38 = v27;
  v39 = (uint64_t)v64;
  if (*(_QWORD *)(v33 + 16) && (v40 = sub_20D86E598(v37), (v41 & 1) != 0))
  {
    sub_20D864AF0(*(_QWORD *)(v33 + 56) + 32 * v40, (uint64_t)&v75);
  }
  else
  {
    v75 = 0u;
    v76 = 0u;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v37, v34);
  if (*((_QWORD *)&v76 + 1))
  {
    v48 = swift_dynamicCast();
    v50 = v70;
    v49 = v71;
    if (v48)
      v51 = v78;
    else
      v51 = 0;
  }
  else
  {
    sub_20D86E5E8((uint64_t)&v75);
    v51 = 0;
    v50 = v70;
    v49 = v71;
  }
  type metadata accessor for CBORDecoder();
  v52 = swift_allocObject();
  *(_QWORD *)(v52 + 16) = sub_20D8519FC(MEMORY[0x24BEE4AF8]);
  v53 = v69;
  sub_20D8520E4(v49, v51, v49, v50, v39);
  swift_release();

  sub_20D85D584(v31, v53);
  v55 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 32);
  v56 = v60;
  v55(v60, v39, v49);
  v57 = v66;
  v55(v66, (uint64_t)v56, v49);
  v55(v38, (uint64_t)v57, v49);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v77);
  v58 = v74;
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v58);
}

uint64_t type metadata accessor for CBOR.EncodedCBOR(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CBOR.EncodedCBOR);
}

uint64_t CBOR.EncodedCBOR.encode(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;
  id v14;
  _BYTE v15[24];
  uint64_t v16;
  id v17;

  type metadata accessor for CBOREncoder();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_20D8519FC(MEMORY[0x24BEE4AF8]);
  *(_WORD *)(v6 + 24) = 2;
  v7 = sub_20D864F5C(v2, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 32));
  if (v3)
    return swift_release();
  v10 = (uint64_t)v7;
  v11 = v8;
  sub_20D85E18C((uint64_t)v7, v8);
  v12 = (void *)sub_20D877BCC();
  v13 = objc_msgSend((id)objc_opt_self(), sel_cborWithEmbeddedCBORData_, v12);
  sub_20D85D584(v10, v11);

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v14 = v13;
  sub_20D878298();
  v17 = v14;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v15, v16);
  sub_20D862C48();
  sub_20D8780D0();
  sub_20D85D584(v10, v11);
  swift_release();

  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
}

uint64_t sub_20D86DE7C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, char *a3@<X8>)
{
  return CBOR.EncodedCBOR.init(from:)(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_20D86DE9C(_QWORD *a1, uint64_t a2)
{
  return CBOR.EncodedCBOR.encode(to:)(a1, a2);
}

uint64_t CBOR.EncodedCBORTag24Data.decode()(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *v1;
  v3 = v1[1];
  type metadata accessor for CBORDecoder();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_20D8519FC(MEMORY[0x24BEE4AF8]);
  sub_20D851EDC(*(_QWORD *)(a1 + 16), v4, v3, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  return swift_release();
}

uint64_t CBOR.EncodedCBORTag24Data.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t CBOR.EncodedCBORTag24Data.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  char *v23;
  uint64_t v24;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;

  v31 = a3;
  v32 = a4;
  v30 = a2;
  v8 = sub_20D877DAC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20D878274();
  if (v5)
    goto LABEL_8;
  v28 = v9;
  v29 = a1;
  v27 = v12;
  __swift_project_boxed_opaque_existential_1(v33, v33[3]);
  sub_20D85D69C();
  sub_20D8780AC();
  v13 = v34;
  if (!objc_msgSend(v34, sel_isEmbeddedCBORData) || objc_msgSend(v13, sel_type) != (id)2)
  {
    v19 = v27;
    sub_20D877DA0();
    v20 = sub_20D877DB8();
    swift_allocError();
    v22 = v21;
    v23 = (char *)v21 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549C9088) + 48);
    *v22 = type metadata accessor for CBOR.EncodedCBOR(0, v30, v31, v32);
    v24 = v28;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v23, v19, v8);
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v22, *MEMORY[0x24BEE26D0], v20);
    swift_willThrow();

    (*(void (**)(char *, uint64_t))(v24 + 8))(v19, v8);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
    a1 = v29;
LABEL_8:
    v18 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1Tm(v18);
  }
  v14 = objc_msgSend((id)objc_opt_self(), sel_dataWithCBOR_, v13);
  v15 = sub_20D877BD8();
  v17 = v16;

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
  *a5 = v15;
  a5[1] = v17;
  v18 = (uint64_t)v29;
  return __swift_destroy_boxed_opaque_existential_1Tm(v18);
}

uint64_t CBOR.EncodedCBORTag24Data.encode(to:)(_QWORD *a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[24];
  uint64_t v23;
  id v24;

  v21 = sub_20D877DD0();
  v5 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21, v6);
  v8 = &v22[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v10 = *v2;
  v9 = v2[1];
  sub_20D85E18C(v10, v9);
  v11 = (void *)sub_20D877BCC();
  v12 = objc_msgSend((id)objc_opt_self(), sel_cborWithEncodedTag24Data_, v11);
  sub_20D85D584(v10, v9);

  if (v12)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    v13 = v12;
    sub_20D878298();
    v24 = v13;
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, v23);
    sub_20D862C48();
    sub_20D8780D0();

    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
  }
  else
  {
    sub_20D877DA0();
    v15 = sub_20D877DDC();
    swift_allocError();
    v17 = v16;
    v18 = (char *)v16 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549C9290) + 48);
    v19 = type metadata accessor for CBOR.EncodedCBOR(0, a2[2], a2[3], a2[4]);
    v17[3] = swift_getMetatypeMetadata();
    *v17 = v19;
    v20 = v21;
    (*(void (**)(char *, _BYTE *, uint64_t))(v5 + 16))(v18, v8, v21);
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v17, *MEMORY[0x24BEE2728], v15);
    swift_willThrow();
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v8, v20);
  }
}

uint64_t sub_20D86E3F8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  return CBOR.EncodedCBORTag24Data.init(from:)(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_20D86E418(_QWORD *a1, uint64_t *a2)
{
  return CBOR.EncodedCBORTag24Data.encode(to:)(a1, a2);
}

uint64_t static CBOR.EncodedCBOR<>.== infix(_:_:)()
{
  return sub_20D877C38() & 1;
}

uint64_t sub_20D86E454()
{
  return static CBOR.EncodedCBOR<>.== infix(_:_:)();
}

void static CBOR.EncodedCBORTag24Data<>.== infix(_:_:)(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_20D86E49C()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_20D86E4D0 + dword_20D86E584[v0 >> 62]))();
}

BOOL sub_20D86E4E0@<W0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  _BOOL8 result;

  result = 0;
  if (a1 == BYTE6(v4))
  {
    if (a1 < 1)
      return 1;
    sub_20D85E18C(v3, v4);
    sub_20D86EC34(v1, v2);
    if ((v5 & 1) != 0)
      return 1;
  }
  return result;
}

unint64_t sub_20D86E598(uint64_t a1)
{
  uint64_t v2;

  sub_20D877E48();
  v2 = sub_20D877C2C();
  return sub_20D86E6BC(a1, v2);
}

uint64_t sub_20D86E5E8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549C90C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_20D86E628(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_20D878244();
  sub_20D877C68();
  v4 = sub_20D878268();
  return sub_20D86E7E4(a1, a2, v4);
}

unint64_t sub_20D86E68C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_20D877D4C();
  return sub_20D86E8C4(a1, v2);
}

unint64_t sub_20D86E6BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_20D877E48();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      v14 = sub_20D877C38();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_20D86E7E4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_20D8780A0() & 1) == 0)
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
      while (!v14 && (sub_20D8780A0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_20D86E8C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_20D86F430();
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_20D877D58();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_20D877D58();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

void sub_20D86E9CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_20D86EA2C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x20D86EC10);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_20D86EC34(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_20D86EC90()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v3;
  v9 = v4;
  v10 = BYTE2(v4);
  v11 = BYTE3(v4);
  v12 = BYTE4(v4);
  v13 = BYTE5(v4);
  sub_20D86E9CC((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_20D85D584(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_20D86EE58()
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

uint64_t *sub_20D86EEC4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(_QWORD *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_20D86EF34(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_20D86EF44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

uint64_t sub_20D86EF74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t sub_20D86EFA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t sub_20D86EFD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t sub_20D86F004(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_20D86F0B4 + 4 * byte_20D879FD0[(v7 - 1)]))();
}

void sub_20D86F104(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t *sub_20D86F2B4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  sub_20D85E18C(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t sub_20D86F2F0(uint64_t a1)
{
  return sub_20D85D584(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t *sub_20D86F2FC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = *a2;
  v4 = a2[1];
  sub_20D85E18C(*a2, v4);
  v5 = *a1;
  v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_20D85D584(v5, v6);
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t *sub_20D86F34C(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_20D85D584(v3, v4);
  return a1;
}

uint64_t sub_20D86F384(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t sub_20D86F3D8(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)result = a2 - 13;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

uint64_t type metadata accessor for CBOR.EncodedCBORTag24Data(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CBOR.EncodedCBORTag24Data);
}

unint64_t sub_20D86F430()
{
  unint64_t result;

  result = qword_2549C90A8;
  if (!qword_2549C90A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2549C90A8);
  }
  return result;
}

uint64_t sub_20D86F46C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_20D877B9C();
  v11 = result;
  if (result)
  {
    result = sub_20D877BB4();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_20D877BA8();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_20D86E9CC(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

id _getRFC3339DateFormatter(int a1)
{
  id v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  if (a1)
    v4 = CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'");
  else
    v4 = CFSTR("yyyy-MM-dd");
  objc_msgSend(v2, "setDateFormat:", v4);
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v5);

  return v2;
}

void sub_20D8753D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t sub_20D877B9C()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_20D877BA8()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_20D877BB4()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_20D877BC0()
{
  return MEMORY[0x24BDCDBE8]();
}

uint64_t sub_20D877BCC()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_20D877BD8()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_20D877BE4()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_20D877BF0()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_20D877BFC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_20D877C08()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_20D877C14()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_20D877C20()
{
  return MEMORY[0x24BEE0500]();
}

uint64_t sub_20D877C2C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_20D877C38()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_20D877C44()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_20D877C50()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_20D877C5C()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_20D877C68()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_20D877C74()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_20D877C80()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_20D877C8C()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_20D877C98()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_20D877CA4()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_20D877CB0()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_20D877CBC()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_20D877CC8()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_20D877CD4()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_20D877CE0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_20D877CEC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_20D877CF8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_20D877D04()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_20D877D10()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_20D877D1C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_20D877D28()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_20D877D34()
{
  return MEMORY[0x24BEE1478]();
}

uint64_t sub_20D877D40()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_20D877D4C()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_20D877D58()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_20D877D64()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_20D877D70()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_20D877D7C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_20D877D88()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_20D877D94()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_20D877DA0()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_20D877DAC()
{
  return MEMORY[0x24BEE2700]();
}

uint64_t sub_20D877DB8()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_20D877DC4()
{
  return MEMORY[0x24BEE2730]();
}

uint64_t sub_20D877DD0()
{
  return MEMORY[0x24BEE2740]();
}

uint64_t sub_20D877DDC()
{
  return MEMORY[0x24BEE2750]();
}

uint64_t sub_20D877DE8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_20D877DF4()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_20D877E00()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_20D877E0C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_20D877E18()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_20D877E24()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_20D877E30()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_20D877E3C()
{
  return MEMORY[0x24BEE2CB8]();
}

uint64_t sub_20D877E48()
{
  return MEMORY[0x24BEE2CC8]();
}

uint64_t sub_20D877E54()
{
  return MEMORY[0x24BEE2E80]();
}

uint64_t sub_20D877E60()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_20D877E6C()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_20D877E78()
{
  return MEMORY[0x24BEE2F08]();
}

uint64_t sub_20D877E84()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_20D877E90()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_20D877E9C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_20D877EA8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_20D877EB4()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_20D877EC0()
{
  return MEMORY[0x24BEE3090]();
}

uint64_t sub_20D877ECC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_20D877ED8()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_20D877EE4()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_20D877EF0()
{
  return MEMORY[0x24BEE33F0]();
}

uint64_t sub_20D877EFC()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_20D877F08()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_20D877F14()
{
  return MEMORY[0x24BEE3530]();
}

uint64_t sub_20D877F20()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_20D877F2C()
{
  return MEMORY[0x24BEE3678]();
}

uint64_t sub_20D877F38()
{
  return MEMORY[0x24BEE3680]();
}

uint64_t sub_20D877F44()
{
  return MEMORY[0x24BEE3688]();
}

uint64_t sub_20D877F50()
{
  return MEMORY[0x24BEE3698]();
}

uint64_t sub_20D877F5C()
{
  return MEMORY[0x24BEE36A0]();
}

uint64_t sub_20D877F68()
{
  return MEMORY[0x24BEE36A8]();
}

uint64_t sub_20D877F74()
{
  return MEMORY[0x24BEE36C8]();
}

uint64_t sub_20D877F80()
{
  return MEMORY[0x24BEE36F0]();
}

uint64_t sub_20D877F8C()
{
  return MEMORY[0x24BEE3700]();
}

uint64_t sub_20D877F98()
{
  return MEMORY[0x24BEE3708]();
}

uint64_t sub_20D877FA4()
{
  return MEMORY[0x24BEE37D8]();
}

uint64_t sub_20D877FB0()
{
  return MEMORY[0x24BEE37E0]();
}

uint64_t sub_20D877FBC()
{
  return MEMORY[0x24BEE37E8]();
}

uint64_t sub_20D877FC8()
{
  return MEMORY[0x24BEE37F0]();
}

uint64_t sub_20D877FD4()
{
  return MEMORY[0x24BEE37F8]();
}

uint64_t sub_20D877FE0()
{
  return MEMORY[0x24BEE3800]();
}

uint64_t sub_20D877FEC()
{
  return MEMORY[0x24BEE3808]();
}

uint64_t sub_20D877FF8()
{
  return MEMORY[0x24BEE3810]();
}

uint64_t sub_20D878004()
{
  return MEMORY[0x24BEE3818]();
}

uint64_t sub_20D878010()
{
  return MEMORY[0x24BEE3820]();
}

uint64_t sub_20D87801C()
{
  return MEMORY[0x24BEE3828]();
}

uint64_t sub_20D878028()
{
  return MEMORY[0x24BEE3830]();
}

uint64_t sub_20D878034()
{
  return MEMORY[0x24BEE3838]();
}

uint64_t sub_20D878040()
{
  return MEMORY[0x24BEE3840]();
}

uint64_t sub_20D87804C()
{
  return MEMORY[0x24BEE3848]();
}

uint64_t sub_20D878058()
{
  return MEMORY[0x24BEE3850]();
}

uint64_t sub_20D878064()
{
  return MEMORY[0x24BEE3858]();
}

uint64_t sub_20D878070()
{
  return MEMORY[0x24BEE3860]();
}

uint64_t sub_20D87807C()
{
  return MEMORY[0x24BEE3868]();
}

uint64_t sub_20D878088()
{
  return MEMORY[0x24BEE3870]();
}

uint64_t sub_20D878094()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_20D8780A0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_20D8780AC()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t sub_20D8780B8()
{
  return MEMORY[0x24BEE3AD0]();
}

uint64_t sub_20D8780C4()
{
  return MEMORY[0x24BEE3AD8]();
}

uint64_t sub_20D8780D0()
{
  return MEMORY[0x24BEE3B20]();
}

uint64_t sub_20D8780DC()
{
  return MEMORY[0x24BEE3B70]();
}

uint64_t sub_20D8780E8()
{
  return MEMORY[0x24BEE3B78]();
}

uint64_t sub_20D8780F4()
{
  return MEMORY[0x24BEE3BE8]();
}

uint64_t sub_20D878100()
{
  return MEMORY[0x24BEE3BF0]();
}

uint64_t sub_20D87810C()
{
  return MEMORY[0x24BEE3BF8]();
}

uint64_t sub_20D878118()
{
  return MEMORY[0x24BEE3C08]();
}

uint64_t sub_20D878124()
{
  return MEMORY[0x24BEE3C10]();
}

uint64_t sub_20D878130()
{
  return MEMORY[0x24BEE3C18]();
}

uint64_t sub_20D87813C()
{
  return MEMORY[0x24BEE3C38]();
}

uint64_t sub_20D878148()
{
  return MEMORY[0x24BEE3C60]();
}

uint64_t sub_20D878154()
{
  return MEMORY[0x24BEE3C70]();
}

uint64_t sub_20D878160()
{
  return MEMORY[0x24BEE3C78]();
}

uint64_t sub_20D87816C()
{
  return MEMORY[0x24BEE3C80]();
}

uint64_t sub_20D878178()
{
  return MEMORY[0x24BEE3C88]();
}

uint64_t sub_20D878184()
{
  return MEMORY[0x24BEE3C90]();
}

uint64_t sub_20D878190()
{
  return MEMORY[0x24BEE3CA0]();
}

uint64_t sub_20D87819C()
{
  return MEMORY[0x24BEE3CA8]();
}

uint64_t sub_20D8781A8()
{
  return MEMORY[0x24BEE3CB0]();
}

uint64_t sub_20D8781B4()
{
  return MEMORY[0x24BEE3CD0]();
}

uint64_t sub_20D8781C0()
{
  return MEMORY[0x24BEE3CE0]();
}

uint64_t sub_20D8781CC()
{
  return MEMORY[0x24BEE3CF8]();
}

uint64_t sub_20D8781D8()
{
  return MEMORY[0x24BEE3D00]();
}

uint64_t sub_20D8781E4()
{
  return MEMORY[0x24BEE3D08]();
}

uint64_t sub_20D8781F0()
{
  return MEMORY[0x24BEE3D10]();
}

uint64_t sub_20D8781FC()
{
  return MEMORY[0x24BEE3D18]();
}

uint64_t sub_20D878208()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_20D878214()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_20D878220()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_20D87822C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_20D878238()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_20D878244()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_20D878250()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_20D87825C()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_20D878268()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_20D878274()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_20D878280()
{
  return MEMORY[0x24BEE4600]();
}

uint64_t sub_20D87828C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_20D878298()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_20D8782A4()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_20D8782B0()
{
  return MEMORY[0x24BEE49E8]();
}

uint64_t sub_20D8782BC()
{
  return MEMORY[0x24BEE49F0]();
}

uint64_t sub_20D8782C8()
{
  return MEMORY[0x24BEE49F8]();
}

uint64_t sub_20D8782D4()
{
  return MEMORY[0x24BEE4A00]();
}

uint64_t sub_20D8782E0()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_20D8782EC()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_20D8782F8()
{
  return MEMORY[0x24BEE4A98]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double ldexp(long double __x, int __e)
{
  long double result;

  MEMORY[0x24BDAEA30](*(_QWORD *)&__e, __x);
  return result;
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

time_t mktime(tm *a1)
{
  return MEMORY[0x24BDAEF98](a1);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

char *__cdecl strptime_l(const char *a1, const char *a2, tm *a3, locale_t a4)
{
  return (char *)MEMORY[0x24BDAFFA0](a1, a2, a3, a4);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x24BDAFFD0](a1, a2);
  return result;
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x24BDB0248](a1);
}

